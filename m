Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7BA1FEE16
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 10:52:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlqHS-0004pD-Km; Thu, 18 Jun 2020 08:52:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HRl3=77=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jlqHQ-0004p8-S8
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 08:52:16 +0000
X-Inumbo-ID: 019f65b8-b141-11ea-ba55-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 019f65b8-b141-11ea-ba55-12813bfff9fa;
 Thu, 18 Jun 2020 08:52:16 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: hN2MGqKixUcU/enmJS6pEMBaRvB+ruUwsN6IPousl08imhb74/Xf0fNFYUGos+2LuEifq/5rN7
 V3G3sKHuio628fvFouUyGCwbs/9+661kUI923jMmEmCIqVj93+dy6YM+4U2bmvrWMgfWPc3Ru8
 lls2OcduGGVIos4EeBB1QXW0I2hP3VD12zQW9dL85YWGP5b0Lk6BYOdrNtd8I/kUzv7m/Uzhln
 uwKsfdgizCVRZuiE5e64a9M56VLAjO+3OUOxJKwvWfBd/ALt5LG39cB0FmrwFIE3TCuV1zmdU/
 wbk=
X-SBRS: 2.7
X-MesageID: 20649486
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,526,1583211600"; d="scan'208";a="20649486"
Date: Thu, 18 Jun 2020 10:52:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH v1 7/7] x86/vmx: switch IPT MSRs on vmentry/vmexit
Message-ID: <20200618085208.GG735@Air-de-Roger>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
 <317430261.8766476.1592321051337.JavaMail.zimbra@cert.pl>
 <20200616173857.GU735@Air-de-Roger>
 <676696113.8782412.1592329627666.JavaMail.zimbra@cert.pl>
 <20200617090942.GY735@Air-de-Roger>
 <574150.9103505.1592394885283.JavaMail.zimbra@cert.pl>
 <20200617125146.GA735@Air-de-Roger>
 <5ad138bb-9195-a8de-5566-468db553422e@citrix.com>
 <219980918.9257247.1592420217746.JavaMail.zimbra@cert.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <219980918.9257247.1592420217746.JavaMail.zimbra@cert.pl>
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
Cc: Kevin Tian <kevin.tian@intel.com>, luwei kang <luwei.kang@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 17, 2020 at 08:56:57PM +0200, Michał Leszczyński wrote:
> ----- 17 cze 2020 o 17:14, Andrew Cooper andrew.cooper3@citrix.com napisał(a):
> 
> > On 17/06/2020 13:51, Roger Pau Monné wrote:
> >> On Wed, Jun 17, 2020 at 01:54:45PM +0200, Michał Leszczyński wrote:
> >>> ----- 17 cze 2020 o 11:09, Roger Pau Monné roger.pau@citrix.com napisał(a):
> >>>
> >>>> 24 Virtual Machine Control Structures -> 24.8 VM-entry Control Fields -> 24.8.1
> >>>> VM-Entry Controls
> >>>> Software should consult the VMX capability MSRs IA32_VMX_ENTRY_CTLS to determine
> >>>> how it should set the reserved bits.
> >>> Please look at bit position 18 "Load IA32_RTIT_CTL".
> >> I think this is something different from what I was referring to.
> >> Those options you refer to (load/clear IA32_RTIT_CTL) deal with
> >> loading/storing a specific field on the vmcs that maps to the guest
> >> IA32_RTIT_CTL.
> >>
> >> OTOH MSR load lists can be used to load and store any arbitrary MSR on
> >> vmentry/vmexit, see section 26.4 LOADING MSRS on the SDM. There's
> >> already infrastructure on Xen to do so, see vmx_{add/del/find}_msr.
> > 
> > If I remember the historic roadmaps correctly, there are 3 cases.
> > 
> > The first hardware to support PT (Broadwell?) prohibited its use
> > completely in VMX operations.  In this case, we can use it to trace PV
> > guests iff we don't enable VMX in hardware to begin with.
> > 
> > This was relaxed in later hardware (Skylake?) to permit use within VMX
> > operations, but without any help in the VMCS.  (i.e. manual context
> > switching per this patch, or MSR load lists as noted in the SDM.)
> > 
> > Subsequent support for "virtualised PT" was added (IceLake?) which adds
> > the load/save controls, and the ability to translate the output buffer
> > under EPT.
> > 
> > 
> > All of this is from memory so I'm quite possibly wrong with details, but
> > I believe this is why the current complexity exists.
> > 
> > ~Andrew
> 
> 
> I've managed to toggle MSR_IA32_RTIT_CTL values using MSR load lists, as in:
> 
> > 35.5.2.2 Guest-Only Tracing
> > "For this usage, VM-entry is programmed to enable trace packet generation, while VM-exit is programmed to clear MSR_IA32_RTIT_CTL.TraceEn so as to disable trace-packet generation in the host."
> 
> it actually helped a bit. With patch v1 there were parts of hypervisor recorded in the trace (i.e. the moment between TRACE_EN being set and actual vmenter, and the moment between vmexit and TRACE_EN being unset). Using MSR load list this was eliminated. This change will be reflected in patch v2.
> 
> 
> I can't however implement any working scenario in which all these MSRs are managed using MSR load lists. As in "35.3.3 Flushing Trace Output": packets are buffered internally and are flushed only when TRACE_EN bit in MSR_IA32_RTIT_CTL is set to 0. The values of remaining registers will be stable after everything is serialized. I think this is too complex for the load lists alone. I belive that currently SDM instructs to use load lists only for toggling this single bit on-or-off.

I think that's exactly what we want: handling TraceEn at
vmentry/vmexit, so that no hypervisor packets are recorded. The rest
of the MSRs can be handled in VMM mode without issues. Switching those
on every vmentry/vmexit would also add more overhead that needed,
since I assume they don't need to be modified on every entry/exit?

> 
> Thus, for now I propose to stay with MSR_IA32_RTIT_CTL being managed by MSR load lists and the rest of related MSRs being managed manually.

Yes, that' seems like a good approach.

Roger.

