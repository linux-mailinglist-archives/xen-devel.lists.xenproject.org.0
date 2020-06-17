Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7267A1FCDBC
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 14:52:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlXXn-0001iQ-Sz; Wed, 17 Jun 2020 12:51:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jIsh=76=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jlXXm-0001iJ-SK
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 12:51:54 +0000
X-Inumbo-ID: 51d00b88-b099-11ea-bca7-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 51d00b88-b099-11ea-bca7-bc764e2007e4;
 Wed, 17 Jun 2020 12:51:54 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: JelWnxgmzcGxW2RilfLHiKwTeGyTzsm+y9rEL7KMQEj43MMwwWZbkt1P5xdODg8VUJbhDWa8vU
 +NMXNNp8SvERiO0PqrhaeJXL3z0KqFUJVIT3DjKU8+sT5bwHWTRWAN0X1bM/6kXQcQsVdYaKlc
 cG7ujtsRPASJVA4pOihNkxH7Szz1UQLTWJYAzP41VChdEvmh+Hmay4LF4n0C56G81kSM3Spr8m
 zv+G8I8gIlOURRQQY0noKlL1//vrAw0uJRMELY/IqGVACHVp2Yso1L2mzo/u8m/Y2u+A/AmciS
 rz8=
X-SBRS: 2.7
X-MesageID: 20611856
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,522,1583211600"; d="scan'208";a="20611856"
Date: Wed, 17 Jun 2020 14:51:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH v1 7/7] x86/vmx: switch IPT MSRs on vmentry/vmexit
Message-ID: <20200617125146.GA735@Air-de-Roger>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
 <317430261.8766476.1592321051337.JavaMail.zimbra@cert.pl>
 <20200616173857.GU735@Air-de-Roger>
 <676696113.8782412.1592329627666.JavaMail.zimbra@cert.pl>
 <20200617090942.GY735@Air-de-Roger>
 <574150.9103505.1592394885283.JavaMail.zimbra@cert.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <574150.9103505.1592394885283.JavaMail.zimbra@cert.pl>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 17, 2020 at 01:54:45PM +0200, Michał Leszczyński wrote:
> ----- 17 cze 2020 o 11:09, Roger Pau Monné roger.pau@citrix.com napisał(a):
> 
> > On Tue, Jun 16, 2020 at 07:47:07PM +0200, Michał Leszczyński wrote:
> >> ----- 16 cze 2020 o 19:38, Roger Pau Monné roger.pau@citrix.com napisał(a):
> >> 
> >> > On Tue, Jun 16, 2020 at 05:24:11PM +0200, Michał Leszczyński wrote:
> >> >> Enable IPT when entering the VM and disable it on vmexit.
> >> >> Register state is persisted using vCPU ipt_state structure.
> >> > 
> >> > Shouldn't this be better done using Intel MSR load lists?
> >> > 
> >> > That seems to be what the SDM recommends for tracing VM events.
> >> > 
> >> > Thanks, Roger.
> >> 
> >> 
> >> This is intentional, additionally described by the comment:
> >> 
> >> // MSR_IA32_RTIT_CTL is context-switched manually instead of being
> >> // stored inside VMCS, as of Q2'20 only the most recent processors
> >> // support such field in VMCS
> >> 
> >> 
> >> There is a special feature flag which indicates whether MSR_IA32_RTIT_CTL can be
> >> loaded using MR load lists.
> > 
> > I've been looking at the Intel SDM and I'm not able to find which bit
> > signals whether MSR_IA32_RTIT_CTL can be loaded using MSR load lists.
> > Sorry to ask, but can you elaborate on where is this signaled?
> > 
> > Thanks, Roger.
> 
> 
> According to SDM:
> 
> > 24 Virtual Machine Control Structures -> 24.4 Guest-state Area -> 24.4.1 Guest Register State
> 
> > IA32_RTIT_CTL (64 bits). This field is supported only on processors that support either the 1-setting of the "load IA32_RTIT_CTL" VM-entry control or that of the "clear IA32_RTIT_CTL" VM-exit control.
> 
> 
> > 24 Virtual Machine Control Structures -> 24.8 VM-entry Control Fields -> 24.8.1 VM-Entry Controls
> 
> > Software should consult the VMX capability MSRs IA32_VMX_ENTRY_CTLS to determine how it should set the reserved bits.
> 
> Please look at bit position 18 "Load IA32_RTIT_CTL".

I think this is something different from what I was referring to.
Those options you refer to (load/clear IA32_RTIT_CTL) deal with
loading/storing a specific field on the vmcs that maps to the guest
IA32_RTIT_CTL.

OTOH MSR load lists can be used to load and store any arbitrary MSR on
vmentry/vmexit, see section 26.4 LOADING MSRS on the SDM. There's
already infrastructure on Xen to do so, see vmx_{add/del/find}_msr.

Roger.

