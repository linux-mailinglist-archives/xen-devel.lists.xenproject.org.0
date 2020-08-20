Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB9824C42F
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 19:09:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8o3f-0007W4-4o; Thu, 20 Aug 2020 17:08:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SJFq=B6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k8o3e-0007Vz-Kc
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 17:08:58 +0000
X-Inumbo-ID: c64b0ca1-1f73-4c9d-abad-02dec4af7bc1
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c64b0ca1-1f73-4c9d-abad-02dec4af7bc1;
 Thu, 20 Aug 2020 17:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597943338;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=kZjMNFFxzZ/CdrkPSTnbydQR2foJt+gO5rD5taRft5k=;
 b=MYh9bfMsODrLrHLVlFhnN/07HIBKyMDm64pgQltSGiyt/ZjRu4BoWUbt
 ajBtzu/RL7BxozXj8gugH1Fc5y94CtiEEd5+iKAKDlT9jXNbty/gttltn
 IoiUgZf29pFB1LJYkdI1Nu7xcW29woZJ/FSfujRzJICaHduToAl5JympE o=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: JIxLo2ZKGcHSCHqB3EPerHxF2TgrQcYSKbFLGCBaLFy4iPpRHu3qI+LlHPvG4zWqHssE4GFCPm
 aY97eEBTouedY6Ziz/NMCi+K7qwRCkqbotpHov6KVEPcl1oDvsH2BoQkRtQxXSxnqj1m8nZj7C
 ZMfX+6QVim3axFOOCcMljoBLTH9FoWJbiR7FDQGNSgshyft5POVagXoEZL1r3+YFgEAkbUa1jY
 H+xE2HrJ8c4iCkHcbDflBOBpaFKdvaoghsJ0gOMxWj5E8OwLJPBEsFRmCcUfL8VhpyW+fGOVI8
 6Uk=
X-SBRS: 2.7
X-MesageID: 24979179
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,333,1592884800"; d="scan'208";a="24979179"
Subject: Re: [PATCH v2 3/8] x86/msr: explicitly handle AMD DE_CFG
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20200820150835.27440-1-roger.pau@citrix.com>
 <20200820150835.27440-4-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <50eef25c-8054-89e7-3b83-a233a0faa6f8@citrix.com>
Date: Thu, 20 Aug 2020 18:08:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200820150835.27440-4-roger.pau@citrix.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20/08/2020 16:08, Roger Pau Monne wrote:

> diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
> index ca4307e19f..a890cb9976 100644
> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -274,6 +274,14 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>          *val = msrs->tsc_aux;
>          break;
>  
> +    case MSR_AMD64_DE_CFG:
> +        if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) ||
> +             !(boot_cpu_data.x86_vendor & (X86_VENDOR_AMD |
> +                                           X86_VENDOR_HYGON)) ||
> +             rdmsr_safe(MSR_AMD64_DE_CFG, *val) )
> +            goto gp_fault;
> +        break;

Ah.  What I intended was to read just bit 2 and nothing else.

Leaking the full value is non-ideal from a migration point of view, and
in this case, you can avoid querying hardware entirely.

Just return AMD64_DE_CFG_LFENCE_SERIALISE here.  The only case where it
won't be true is when the hypervisor running us (i.e. Xen) failed to set
it up, and the CPU boot path failed to adjust it, at which point the
whole system has much bigger problems.

> +
>      case MSR_AMD64_DR0_ADDRESS_MASK:
>      case MSR_AMD64_DR1_ADDRESS_MASK ... MSR_AMD64_DR3_ADDRESS_MASK:
>          if ( !cp->extd.dbext )
> @@ -499,6 +507,12 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
>              wrmsr_tsc_aux(val);
>          break;
>  
> +    case MSR_AMD64_DE_CFG:
> +        if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) ||
> +             !(boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
> +            goto gp_fault;
> +        break;

There should be no problem yielding #GP here (i.e. dropping this hunk).

IIRC, it was the behaviour of certain hypervisors when Spectre hit, so
all guests ought to cope.  (And indeed, not try to redundantly set the
bit to start with).

~Andrew

> +
>      case MSR_AMD64_DR0_ADDRESS_MASK:
>      case MSR_AMD64_DR1_ADDRESS_MASK ... MSR_AMD64_DR3_ADDRESS_MASK:
>          if ( !cp->extd.dbext || val != (uint32_t)val )


