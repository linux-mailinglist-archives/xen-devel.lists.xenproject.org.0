Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEEE1E7FB6
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 16:08:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jefgU-00054i-61; Fri, 29 May 2020 14:08:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mY44=7L=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jefgS-00054d-ES
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 14:08:28 +0000
X-Inumbo-ID: ddfe0eea-a1b5-11ea-81bc-bc764e2007e4
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ddfe0eea-a1b5-11ea-81bc-bc764e2007e4;
 Fri, 29 May 2020 14:08:27 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:59376
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jefgP-000L2n-Jb (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Fri, 29 May 2020 15:08:25 +0100
Subject: Re: [PATCH v10 7/9] x86emul: support FNSTENV and FNSAVE
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d2375ecb-f662-99d8-84c2-e9f9c5cf7b9e@suse.com>
 <ec5d12df-dbef-af1a-7649-44a9a7d46de4@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <6851a948-e4a8-5caf-e87b-c4b361bdd950@citrix.com>
Date: Fri, 29 May 2020 15:08:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <ec5d12df-dbef-af1a-7649-44a9a7d46de4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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

On 25/05/2020 15:29, Jan Beulich wrote:
> To avoid introducing another boolean into emulator state, the
> rex_prefix field gets (ab)used to convey the real/VM86 vs protected mode
> info (affecting structure layout, albeit not size) to x86_emul_blk().
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>, with one suggestion.

> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -856,6 +856,9 @@ struct x86_emulate_state {
>      enum {
>          blk_NONE,
>          blk_enqcmd,
> +#ifndef X86EMUL_NO_FPU
> +        blk_fst, /* FNSTENV, FNSAVE */
> +#endif
>          blk_movdir,
>      } blk;
>      uint8_t modrm, modrm_mod, modrm_reg, modrm_rm;
> @@ -897,6 +900,50 @@ struct x86_emulate_state {
>  #define PTR_POISON NULL /* 32-bit builds are for user-space, so NULL is OK. */
>  #endif
>  
> +#ifndef X86EMUL_NO_FPU
> +struct x87_env16 {
> +    uint16_t fcw;
> +    uint16_t fsw;
> +    uint16_t ftw;
> +    union {
> +        struct {
> +            uint16_t fip_lo;
> +            uint16_t fop:11, :1, fip_hi:4;
> +            uint16_t fdp_lo;
> +            uint16_t :12, fdp_hi:4;
> +        } real;
> +        struct {
> +            uint16_t fip;
> +            uint16_t fcs;
> +            uint16_t fdp;
> +            uint16_t fds;
> +        } prot;
> +    } mode;
> +};
> +
> +struct x87_env32 {
> +    uint32_t fcw:16, :16;
> +    uint32_t fsw:16, :16;
> +    uint32_t ftw:16, :16;

uint16_t fcw, :16;
uint16_t fsw, :16;
uint16_t ftw, :16;

?

~Andrew

