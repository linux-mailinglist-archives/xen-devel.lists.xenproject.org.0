Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7895D1E7D04
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 14:19:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jedyP-0000he-Bc; Fri, 29 May 2020 12:18:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mY44=7L=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jedyO-0000hZ-8X
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 12:18:52 +0000
X-Inumbo-ID: 8df82a8e-a1a6-11ea-81bc-bc764e2007e4
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8df82a8e-a1a6-11ea-81bc-bc764e2007e4;
 Fri, 29 May 2020 12:18:51 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:56132
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jedyK-000Cj0-Jc (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Fri, 29 May 2020 13:18:48 +0100
Subject: Re: [PATCH v10 1/9] x86emul: address x86_insn_is_mem_{access, write}()
 omissions
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d2375ecb-f662-99d8-84c2-e9f9c5cf7b9e@suse.com>
 <f41a4f27-bbe2-6450-38c1-6c4e23f2b07b@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <8e976b4b-60f2-bf94-843d-0fe0ba57087c@citrix.com>
Date: Fri, 29 May 2020 13:18:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <f41a4f27-bbe2-6450-38c1-6c4e23f2b07b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25/05/2020 15:26, Jan Beulich wrote:
> First of all explain in comments what the functions' purposes are. Then
> make them actually match their comments.
>
> Note that fc6fa977be54 ("x86emul: extend x86_insn_is_mem_write()
> coverage") didn't actually fix the function's behavior for {,V}STMXCSR:
> Both are covered by generic code higher up in the function, due to
> x86_decode_twobyte() already doing suitable adjustments. And VSTMXCSR
> wouldn't have been covered anyway without a further X86EMUL_OPC_VEX()
> case label. Keep the inner case label in a comment for reference.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v10: Move ARPL case to earlier switch() x86_insn_is_mem_write(). Make
>      group 5 handling actually work there. Drop VMPTRST case. Also
>      handle CLFLUSH*, CLWB, UDn, and remaining PREFETCH* in
>      x86_insn_is_mem_access().
> v9: New.
>
> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -11474,25 +11474,87 @@ x86_insn_operand_ea(const struct x86_emu
>      return state->ea.mem.off;
>  }
>  
> +/*
> + * This function means to return 'true' for all supported insns with explicit
> + * accesses to memory.  This means also insns which don't have an explicit
> + * memory operand (like POP), but it does not mean e.g. segment selector
> + * loads, where the descriptor table access is considered an implicit one.
> + */
>  bool
>  x86_insn_is_mem_access(const struct x86_emulate_state *state,
>                         const struct x86_emulate_ctxt *ctxt)
>  {
> +    if ( mode_64bit() && state->not_64bit )
> +        return false;

Is this path actually used?  state->not_64bit ought to fail instruction
decode, at which point we wouldn't have a valid state to be used here.

Everything else looks ok, so Acked-by: Andrew Cooper
<andrew.cooper3@citrix.com>

