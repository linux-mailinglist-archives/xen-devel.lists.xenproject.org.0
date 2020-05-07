Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 479211C9C7E
	for <lists+xen-devel@lfdr.de>; Thu,  7 May 2020 22:34:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWnEB-00075C-TF; Thu, 07 May 2020 20:34:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=53Et=6V=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jWnE9-00074t-UZ
 for xen-devel@lists.xenproject.org; Thu, 07 May 2020 20:34:42 +0000
X-Inumbo-ID: 2d204bd4-90a2-11ea-9f78-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2d204bd4-90a2-11ea-9f78-12813bfff9fa;
 Thu, 07 May 2020 20:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588883681;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=f0Uw6mGiBkQ8TwNJ5g8wMfPKIHQUD5J++nwUo0Pr1FM=;
 b=HiDLKQ/j+3wJu9zrL4ZU04MKN7+Z5GLntcvJ3qC0lK+0ZxIesde+zUGj
 1owgHYPWR90RRqNbT0W7jCCbnG76FUWrDxHDsj48y9x6KjAa6iZQG6CEf
 M09Wc5BSNRp+OSSBFHo0kRyZFruRj2EtjsefV5zAQ0L/J8AT+qO/N6kGU c=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4l840KJWxXZaKt8DTNrayIgsKYM2HkaSsrFt6xy+Fg/JIuvs6xa3b3dpCehkFlx7B8FGfwVyY0
 BJ+b8MOAubfsGLlvTC1rLbI9LHvX6qZMbJzpsFm6+mnPK3Emc7BYurABEbvipqmqm5DJRREo9C
 wIvZp8KvUWc2pFHWY+/KBY8BLTIkllUZ3GsyeH8XkrvvguPUPBFBVyCXYwvXkzpav7GI1g7OeC
 Qf/FNz5eCvaAMsVUHvfxW6N51D0X0FuNRaPCnJkVTmtTKeyngFQX7krvokLDEanSdjkwfLjHgF
 2iY=
X-SBRS: 2.7
X-MesageID: 17278392
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,365,1583211600"; d="scan'208";a="17278392"
Subject: Re: [PATCH v8 06/12] x86/HVM: make hvmemul_blk() capable of handling
 r/o operations
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <60cc730f-2a1c-d7a6-74fe-64f3c9308831@suse.com>
 <1587789a-b0d6-6d18-99fc-a94bbea52d7b@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <507d4ced-d6ff-dfd9-d6e5-0a732c334de1@citrix.com>
Date: Thu, 7 May 2020 21:34:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1587789a-b0d6-6d18-99fc-a94bbea52d7b@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 05/05/2020 09:15, Jan Beulich wrote:
> In preparation for handling e.g. FLDENV or {F,FX,X}RSTOR here as well.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v8: New (could be folded into "x86emul: support MOVDIR{I,64B} insns",
>     but would invalidate Paul's R-b there).
>
> --- a/xen/arch/x86/hvm/emulate.c
> +++ b/xen/arch/x86/hvm/emulate.c
> @@ -1453,7 +1453,7 @@ static int hvmemul_blk(
>      struct hvm_emulate_ctxt *hvmemul_ctxt =
>          container_of(ctxt, struct hvm_emulate_ctxt, ctxt);
>      unsigned long addr;
> -    uint32_t pfec = PFEC_page_present | PFEC_write_access;
> +    uint32_t pfec = PFEC_page_present;
>      int rc;
>      void *mapping = NULL;
>  
> @@ -1462,6 +1462,9 @@ static int hvmemul_blk(
>      if ( rc != X86EMUL_OKAY || !bytes )
>          return rc;
>  
> +    if ( x86_insn_is_mem_write(state, ctxt) )
> +        pfec |= PFEC_write_access;
> +

For the instructions with two memory operands, it conflates the
read-only side with the read-write side.

~Andrew

