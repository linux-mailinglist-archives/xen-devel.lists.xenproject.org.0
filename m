Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BBA192486
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 10:48:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH2aa-0006lX-Hm; Wed, 25 Mar 2020 09:44:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K3jc=5K=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jH2aY-0006lR-Qk
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 09:44:42 +0000
X-Inumbo-ID: 404f9e04-6e7d-11ea-a6c1-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 404f9e04-6e7d-11ea-a6c1-bc764e2007e4;
 Wed, 25 Mar 2020 09:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585129482;
 h=from:subject:to:cc:references:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=AFMSAaGnIlDWey4/UszjwVBhNG9SNA6zRCnyyxT+kTY=;
 b=J8Ei3Gfjg9fLoKmMuPdi55EwdTJjccKc+WfW2C7c+2JCF/6G42LqG1qt
 vCZ6+Sej2lhHS8zlzxMiMpAxNZuo+PHsOBWaiDNULycs7i3G3UcHIvztU
 SSRvqeh4T2ZjOL0YAZSQHdtWduO4sRRDSIC9zZKr18ma43jHgDyZWeg89 g=;
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
IronPort-SDR: sT+zysPX0PijWhQhlIYD9vHp/NNVH3bBo7Gl9yb2BSPsiri5enKJgadLKWWtnRNlxTHskW7O94
 qBbwLCVPXC04QYgUTkhUm0ZEcvpCHS3YrDwYIwxIk/IWR1EYdDPLirN8AIAm/FZGSf3TnR0bY4
 S+QDliNCzxJvSeomVoznHXqc6mwlnfGefL7JvUAbz83P4uT1YOusgYk9Hl2/O0QwQcj4w9piQE
 mdeN8T70xt3b2Ga/Sf7ihMdqb57krwGGIoSPVNi1n3ZTxPOnsjo5dl6Py0qzkUkG4iEDFzf01F
 UZ8=
X-SBRS: 2.7
X-MesageID: 15006161
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,303,1580792400"; d="scan'208";a="15006161"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <cfeb8fcf-3ba6-674c-17a9-93be9e746930@suse.com>
 <7c4b7701-0840-1e06-3b54-e259c223e61c@suse.com>
Message-ID: <877ede08-b331-7dbc-c9db-4c0995e4dd21@citrix.com>
Date: Wed, 25 Mar 2020 09:44:37 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <7c4b7701-0840-1e06-3b54-e259c223e61c@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 6/7] x86emul: vendor specific SYSCALL
 behavior
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24/03/2020 16:28, Jan Beulich wrote:
> AMD CPUs permit the insn everywhere (even outside of protected mode),
> while Intel ones restrict it to 64-bit mode. While at it also add the
> so far missing CPUID bit check.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -1870,6 +1870,7 @@ amd_like(const struct x86_emulate_ctxt *
>  #define vcpu_has_f16c()        (ctxt->cpuid->basic.f16c)
>  #define vcpu_has_rdrand()      (ctxt->cpuid->basic.rdrand)
>  
> +#define vcpu_has_syscall()     (ctxt->cpuid->extd.syscall)
>  #define vcpu_has_mmxext()      (ctxt->cpuid->extd.mmxext || vcpu_has_sse())
>  #define vcpu_has_3dnow_ext()   (ctxt->cpuid->extd._3dnowext)
>  #define vcpu_has_3dnow()       (ctxt->cpuid->extd._3dnow)
> @@ -5897,13 +5898,13 @@ x86_emulate(
>          break;
>  
>      case X86EMUL_OPC(0x0f, 0x05): /* syscall */
> -        generate_exception_if(!in_protmode(ctxt, ops), EXC_UD);
> -
> +        vcpu_must_have(syscall);
>          /* Inject #UD if syscall/sysret are disabled. */
>          fail_if(ops->read_msr == NULL);
>          if ( (rc = ops->read_msr(MSR_EFER, &msr_val, ctxt)) != X86EMUL_OKAY )
>              goto done;
>          generate_exception_if((msr_val & EFER_SCE) == 0, EXC_UD);

The CPUID check isn't actually missing, but it is fairly well hidden
here in the validity check to enable EFER.SCE in the first place.

In my (still incomplete and unposed) XSA-204 followup, I just commented
the fact here rather than introducing vcpu_must_have().

~Andrew

> +        generate_exception_if(!amd_like(ctxt) && !mode_64bit(), EXC_UD);
>  
>          if ( (rc = ops->read_msr(MSR_STAR, &msr_val, ctxt)) != X86EMUL_OKAY )
>              goto done;
>


