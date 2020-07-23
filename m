Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2EB22ADCB
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 13:30:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyZQp-0005dB-DG; Thu, 23 Jul 2020 11:30:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0L1b=BC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jyZQo-0005d3-2B
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 11:30:34 +0000
X-Inumbo-ID: eb242685-ccd7-11ea-a281-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eb242685-ccd7-11ea-a281-12813bfff9fa;
 Thu, 23 Jul 2020 11:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595503832;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=AEGXJnYUL36sPmyfPejacPpdAzMnNyNFpcFfg/8Dcwc=;
 b=CrH+/rCGPfvvhoez4tPgWrRACfDX+t1qlVAwvPc0PuJ4DHBqZUJFmVBZ
 5b8IDALzoIkvg6OGVBV1btIdFZTONE7BAoNq4B3x/bBUUoUORTYX8cADd
 n5XtPaFA8PU3Wz9a8CzxW6tNb80uR0T5OHar+UShBO/xLJTq344S5Q2Gi M=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: WNh0sKpjmcuyb8eJEuv9zo7IX2gwMJjXI2cuvfu94C5HwfUCbokOJVcr/MO2vueW5qKaUlFLQ8
 xmgWrrEOKBTRAHbQ27aqdn5sSV7Lx0JfbtfRcb3i3drfcGRer67UJ933t98A3V19nH4CNbBV7f
 O9+wUmuD4E0Kpx2shfYKJ6vNJb9QB6/uotOc87vUQIYmAU3dESqSZSGE/PCZkZAZB+v6fFHpua
 zKeCSFpkh1R3UQv1g9q9p8BCyXvAEAsbvZKkj2VIZdcBfcWJ9Mwvn1HDhjezTnll4ZgEgbB08k
 FVg=
X-SBRS: 2.7
X-MesageID: 23889623
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,386,1589256000"; d="scan'208";a="23889623"
Date: Thu, 23 Jul 2020 13:30:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/vmce: Dispatch vmce_{rd,wr}msr() from
 guest_{rd,wr}msr()
Message-ID: <20200723113025.GC7191@Air-de-Roger>
References: <20200722101809.8389-1-andrew.cooper3@citrix.com>
 <20200723100727.GA7191@Air-de-Roger>
 <ccc153a5-cf65-c483-43ea-d6b864366e06@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ccc153a5-cf65-c483-43ea-d6b864366e06@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jul 23, 2020 at 12:00:53PM +0100, Andrew Cooper wrote:
> On 23/07/2020 11:07, Roger Pau Monné wrote:
> > On Wed, Jul 22, 2020 at 11:18:09AM +0100, Andrew Cooper wrote:
> >> +    case MSR_IA32_MCG_CAP     ... MSR_IA32_MCG_CTL:      /* 0x179 -> 0x17b */
> >> +    case MSR_IA32_MCx_CTL2(0) ... MSR_IA32_MCx_CTL2(31): /* 0x280 -> 0x29f */
> >> +    case MSR_IA32_MCx_CTL(0)  ... MSR_IA32_MCx_MISC(31): /* 0x400 -> 0x47f */
> > Where do you get the ranges from 0 to 31? It seems like the count
> > field in the CAP register is 8 bits, which could allow for up to 256
> > banks?
> >
> > I'm quite sure this would then overlap with other MSRs?
> 
> Irritatingly, nothing I can find actually states an upper architectural
> limit.
> 
> SDM Vol4, Table 2-2 which enumerates the Architectural MSRs.
> 
> 0x280 thru 0x29f are explicitly reserved MCx_CTL2, which is a limit of
> 32 banks.  There are gaps after this in the architectural table, but
> IceLake has PRMRR_BASE_0 at 0x2a0.
> 
> The main bank of MCx_{CTL,STATUS,ADDR,MISC} start at 0x400 and are
> listed in the table up to 0x473, which is a limit of 29 banks.  The
> Model specific table for SandyBridge fills in the remaining 3 banks up
> to MSR 0x47f, which is the previous limit of 32 banks.  (These MSRs have
> package scope rather than core/thread scope, but they are still
> enumerated architecturally so I'm not sure why they are in the model
> specific tables.)
> 
> More importantly however, the VMX MSR range starts at 0x480, immediately
> above bank 31, which puts an architectural hard limit on the number of
> banks.

Yes, realized about the VMX MSRs starting at 0x480, which limits the
number of banks. Maybe a small comment about the fact that albeit the
count in the CAP register could go up to 256 32 is the actual limit
due to how MSRs are arranged?

Note there's also GUEST_MC_BANK_NUM which is the actual implementation
limit in Xen AFAICT, maybe using it here would be clearer? (and limit
the ranges forwarded to vmce_rdmsr)

Thanks, Roger.

