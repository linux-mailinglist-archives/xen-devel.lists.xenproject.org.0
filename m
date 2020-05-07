Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 907FA1C9A36
	for <lists+xen-devel@lfdr.de>; Thu,  7 May 2020 21:00:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWlkK-00072I-Te; Thu, 07 May 2020 18:59:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=53Et=6V=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jWlkJ-00072D-5r
 for xen-devel@lists.xenproject.org; Thu, 07 May 2020 18:59:47 +0000
X-Inumbo-ID: ea3e8560-9094-11ea-9f67-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ea3e8560-9094-11ea-9f67-12813bfff9fa;
 Thu, 07 May 2020 18:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588877986;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=LnPmYM3ZIWR8fY2XZ/1m4Q8XN2yWUNpWWtz164UryAc=;
 b=SIZ/cl/vP/WSnBKBvEG9nCKVZdSi6HiVTzgafN28plVKVJajIGUR6y1R
 CS3rNhFsPZ+PBf+Ptof0vJhj4VIJuacw97myL8C6fCiFcRD0eacUl/Zfh
 T/P3/35tRqJfSYvuD/rALRgKLad6SS7RsQ8O2Y6kWC6vcWhVQ6u3Zva/Y M=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Q5uRWlnG0+tlH0bGWkwoZ6/ZlIDqAjgGXdOa5aPCyZiPYERYl/440Ns3OVWX3KRzNkmHrM+MWR
 Ieu/WeEM3eRx5btQaKkxlM7M4AlLjUPo6HWjAOKTf9XsfWzYe4WwR9nvyX5Isn4gZC4VEnzoZN
 2wQV6SkxDKQOLphaVcxL3bOIxoppQPPdvKKesNEXeq/dkaWfZxv66QGrfXa+ykz0eAA3U7c6zT
 H82HgtRFUy5nPqIQKxv2KnJhEhUv4OnuhEfIIJ4L7ONRO7KjyLNhWKR/lG00UvFEhWPLRfKTiW
 Ah8=
X-SBRS: 2.7
X-MesageID: 17382956
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,364,1583211600"; d="scan'208";a="17382956"
Subject: Re: [PATCH v8 03/12] x86emul: support ENQCMD insns
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <60cc730f-2a1c-d7a6-74fe-64f3c9308831@suse.com>
 <099d03d0-2846-2a3d-93ec-2d10dab12655@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <4fdaeefb-9593-789d-9f73-510e89d6df43@citrix.com>
Date: Thu, 7 May 2020 19:59:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <099d03d0-2846-2a3d-93ec-2d10dab12655@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 05/05/2020 09:13, Jan Beulich wrote:
> Note that the ISA extensions document revision 038 doesn't specify
> exception behavior for ModRM.mod == 0b11; assuming #UD here.

Stale.

> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -11480,11 +11513,36 @@ int x86_emul_blk(
>  {
>      switch ( state->blk )
>      {
> +        bool zf;
> +
>          /*
>           * Throughout this switch(), memory clobbers are used to compensate
>           * that other operands may not properly express the (full) memory
>           * ranges covered.
>           */
> +    case blk_enqcmd:
> +        ASSERT(bytes == 64);
> +        if ( ((unsigned long)ptr & 0x3f) )
> +        {
> +            ASSERT_UNREACHABLE();
> +            return X86EMUL_UNHANDLEABLE;
> +        }
> +        *eflags &= ~EFLAGS_MASK;
> +#ifdef HAVE_AS_ENQCMD
> +        asm ( "enqcmds (%[src]), %[dst]" ASM_FLAG_OUT(, "; setz %0")

%[zf]

> +              : [zf] ASM_FLAG_OUT("=@ccz", "=qm") (zf)
> +              : [src] "r" (data), [dst] "r" (ptr) : "memory" );

Can't src get away with being "m" (*data)?  There is no need to force it
into a single register, even if it is overwhelmingly likely to end up
with %rsi scheduled here.

> +#else
> +        /* enqcmds (%rsi), %rdi */
> +        asm ( ".byte 0xf3, 0x0f, 0x38, 0xf8, 0x3e"
> +              ASM_FLAG_OUT(, "; setz %[zf]")
> +              : [zf] ASM_FLAG_OUT("=@ccz", "=qm") (zf)
> +              : "S" (data), "D" (ptr) : "memory" );
> +#endif
> +        if ( zf )
> +            *eflags |= X86_EFLAGS_ZF;
> +        break;
> +
>      case blk_movdir:
>          switch ( bytes )
>          {
> --- a/xen/include/asm-x86/msr-index.h
> +++ b/xen/include/asm-x86/msr-index.h
> @@ -420,6 +420,10 @@
>  #define MSR_IA32_TSC_DEADLINE		0x000006E0
>  #define MSR_IA32_ENERGY_PERF_BIAS	0x000001b0
>  
> +#define MSR_IA32_PASID			0x00000d93
> +#define  PASID_PASID_MASK		0x000fffff
> +#define  PASID_VALID			0x80000000
> +

Above the legacy line please as this is using the newer style, and drop
_IA32.  Intel's ideal of architectural-ness isn't interesting or worth
the added code volume.

PASSID_PASSID_MASK isn't great, but I can't suggest anything better, and
MSR_PASSID_MAS doesn't work either.

Otherwise, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

