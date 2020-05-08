Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA581CB908
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 22:34:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jX9fz-0003tx-Cj; Fri, 08 May 2020 20:32:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M6n8=6W=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jX9fx-0003ts-O4
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 20:32:53 +0000
X-Inumbo-ID: 16ceacda-916b-11ea-9887-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 16ceacda-916b-11ea-9887-bc764e2007e4;
 Fri, 08 May 2020 20:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588969973;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=lvcHfMrPoxy3lfH9QSTjWGiNH2/W59CeABGN2RP453Y=;
 b=d3ct67v+yu+aVKURHK/vShqTADatG0FviMjUtPd2qkIDz9Roz2c/OBDQ
 THjEpf5UVqZm/6c1u+RNruwHKBmjPmH8Tr40Vdq8FT9+fdVmPhJeSTJTW
 0uk8JVvcSU1YQsCh1d6mrG/c9QQ+UusZKGzvBCFFYlZbjYStIYMX1RASX U=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
X-Ironport-Dmarc-Check-Result: validskip
IronPort-SDR: gLEO9oAMiGRmKnl3GtWt0sX7AQPZZ1BwmIWR7VMFy2qVlsq6amL74aGQSuJrccZJEuvSXPTsJX
 6blFDBlgf0HbtDdDpeEpCaVj0m0PIURi9a5lf3RI89aLJG85AqcLoBaEqsfCn2Dm04vU/Ztnxv
 R3JftELIBv5iFSMVOm142oJT3uvqD2+GdKYH4igu9rAK9+GDHte3Z7ZyfMAov/QouF9nooY5Xl
 Oh6xs/y3sK83m6QcWYmEWbgVjOyBpz96bi9owHQ4OcV7LtWlV0Hud3qiTdiBkGVa7J8Me1ad7t
 O/k=
X-SBRS: 2.7
X-MesageID: 17123184
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,369,1583211600"; d="scan'208";a="17123184"
Subject: Re: [PATCH v8 10/12] x86/HVM: scale MPERF values reported to guests
 (on AMD)
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <60cc730f-2a1c-d7a6-74fe-64f3c9308831@suse.com>
 <5da4ed2e-8eb8-0b18-3c1f-9d419371c08a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <8bf8b3c9-1cec-0943-4b98-75b4a787a344@citrix.com>
Date: Fri, 8 May 2020 21:32:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <5da4ed2e-8eb8-0b18-3c1f-9d419371c08a@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 05/05/2020 09:18, Jan Beulich wrote:
> AMD's PM specifies that MPERF (and its r/o counterpart) reads are
> affected by the TSC ratio. Hence when processing such reads in software
> we too should scale the values. While we don't currently (yet) expose
> the underlying feature flags, besides us allowing the MSRs to be read
> nevertheless, RDPRU is going to expose the values even to user space.
>
> Furthermore, due to the not exposed feature flags, this change has the
> effect of making properly inaccessible (for reads) the two MSRs.
>
> Note that writes to MPERF (and APERF) continue to be unsupported.

Linux is now using MPERF/APERF for its frequency-invariant scheduling
logic.  Irritatingly, via its read/write alias rather than its read-only
alias.  Even more irritatingly, Intel's reference algorithm recommends
writing to both, despite this being being far less efficient than (one
of) AMD's (two) algorithm(s) which tells you just to subtract the values
you last sampled.

On the one hand, I'm tempted to suggest that we offer EFRO on Intel and
update Linux to use it.  OTOH, that would VMExit as Intel CPUs don't
understand the EFRO interface.

I can't see any sane way to virtualise the write behaviour for MPERF/APERF.

>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v3: New.
> ---
> I did consider whether to put the code in guest_rdmsr() instead, but
> decided that it's better to have it next to TSC handling.

Please do put it in guest_rdmsr().  This is code hygene just as much as
bool_t or style fixes are.

The relationship to TSC is passing-at-best.

>
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -3478,6 +3478,22 @@ int hvm_msr_read_intercept(unsigned int
>          *msr_content = v->arch.hvm.msr_tsc_adjust;
>          break;
>  
> +    case MSR_MPERF_RD_ONLY:
> +        if ( !d->arch.cpuid->extd.efro )
> +        {
> +            goto gp_fault;
> +
> +    case MSR_IA32_MPERF:
> +            if ( !(d->arch.cpuid->basic.raw[6].c &
> +                   CPUID6_ECX_APERFMPERF_CAPABILITY) )
> +                goto gp_fault;
> +        }
> +        if ( rdmsr_safe(msr, *msr_content) )
> +            goto gp_fault;
> +        if ( d->arch.cpuid->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )

I suspect we want to gain amd_like() outside of the emulator.

> +            *msr_content = hvm_get_guest_tsc_fixed(v, *msr_content);
> +        break;
> +
>      case MSR_APIC_BASE:
>          *msr_content = vcpu_vlapic(v)->hw.apic_base_msr;
>          break;
> --- a/xen/include/asm-x86/msr-index.h
> +++ b/xen/include/asm-x86/msr-index.h
> @@ -405,6 +405,9 @@
>  #define MSR_IA32_MPERF			0x000000e7
>  #define MSR_IA32_APERF			0x000000e8
>  
> +#define MSR_MPERF_RD_ONLY		0xc00000e7
> +#define MSR_APERF_RD_ONLY		0xc00000e8

S/RD_ONLY/RO/ ?  No loss of meaning.  Also, above the legacy line please.

~Andrew

> +
>  #define MSR_IA32_THERM_CONTROL		0x0000019a
>  #define MSR_IA32_THERM_INTERRUPT	0x0000019b
>  #define MSR_IA32_THERM_STATUS		0x0000019c
>


