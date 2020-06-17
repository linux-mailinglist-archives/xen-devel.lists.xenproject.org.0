Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E06971FC991
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 11:10:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlU4t-00061U-TU; Wed, 17 Jun 2020 09:09:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jIsh=76=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jlU4s-00061P-Vp
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 09:09:51 +0000
X-Inumbo-ID: 4c1696b8-b07a-11ea-b9ae-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4c1696b8-b07a-11ea-b9ae-12813bfff9fa;
 Wed, 17 Jun 2020 09:09:50 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 2Ga5Ehl2ycOHUWmP6oHZ+QWITf7JVhV5CW0cohm862hmWIaZSU9gnW6p+X3Xh2MxK5Y7NLtGq4
 jTMEAqUU94W+fofCGiq5piCeyxthkYN8VDrymV4/u9asg9eat3WwDiC9eGab2BasBM4XFERv1E
 bneHhbW/v/UEofkRf7jaAemOXv+YJp6Q6RdEU39GL3AvxmmxcxVxVv2MsXY6DpDnwT4BENlA/F
 v1GS8PH6PzIifqEbP2P1m2mLdbvULG0qfn1F2+slZJthS504ReM8reLMyvB0SBbdgveB8RO+dm
 Dq4=
X-SBRS: 2.7
X-MesageID: 20263476
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,522,1583211600"; d="scan'208";a="20263476"
Date: Wed, 17 Jun 2020 11:09:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH v1 7/7] x86/vmx: switch IPT MSRs on vmentry/vmexit
Message-ID: <20200617090942.GY735@Air-de-Roger>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
 <317430261.8766476.1592321051337.JavaMail.zimbra@cert.pl>
 <20200616173857.GU735@Air-de-Roger>
 <676696113.8782412.1592329627666.JavaMail.zimbra@cert.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <676696113.8782412.1592329627666.JavaMail.zimbra@cert.pl>
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

On Tue, Jun 16, 2020 at 07:47:07PM +0200, Michał Leszczyński wrote:
> ----- 16 cze 2020 o 19:38, Roger Pau Monné roger.pau@citrix.com napisał(a):
> 
> > On Tue, Jun 16, 2020 at 05:24:11PM +0200, Michał Leszczyński wrote:
> >> Enable IPT when entering the VM and disable it on vmexit.
> >> Register state is persisted using vCPU ipt_state structure.
> > 
> > Shouldn't this be better done using Intel MSR load lists?
> > 
> > That seems to be what the SDM recommends for tracing VM events.
> > 
> > Thanks, Roger.
> 
> 
> This is intentional, additionally described by the comment:
> 
> // MSR_IA32_RTIT_CTL is context-switched manually instead of being
> // stored inside VMCS, as of Q2'20 only the most recent processors
> // support such field in VMCS
> 
> 
> There is a special feature flag which indicates whether MSR_IA32_RTIT_CTL can be loaded using MR load lists.

I've been looking at the Intel SDM and I'm not able to find which bit
signals whether MSR_IA32_RTIT_CTL can be loaded using MSR load lists.
Sorry to ask, but can you elaborate on where is this signaled?

Thanks, Roger.

