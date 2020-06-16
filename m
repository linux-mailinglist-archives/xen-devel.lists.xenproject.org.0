Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2988B1FBD34
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 19:39:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlFYA-0005fN-BD; Tue, 16 Jun 2020 17:39:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AL9H=75=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jlFY9-0005fI-0E
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 17:39:05 +0000
X-Inumbo-ID: 453ec810-aff8-11ea-b91d-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 453ec810-aff8-11ea-b91d-12813bfff9fa;
 Tue, 16 Jun 2020 17:39:04 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Mb4s/JXwT4z+JVYADY0DJeKUP6xM8ze+DZ4hLLiiB98bE5Rj873p6CV9wW05uMe0RTNBOR29Kn
 PsBDttcGSlC79Us4WTSsWtB4AM5dY6NBJP6a8QlgOlYYcsc7Kl0jo1g56fPrBqZ9Y2ChF0rRsJ
 Z3Dfk4DSc14vrg8dGCHkch0m9n82fg9OrpJaZ0sYFeEGthnZCXPWcV53EAhwZ2otddyqtvUT+V
 zO66bIbwFoTlgfYmvobJndaZMdrF8dBe0NS2LnI72sCMMTORN4PjR5AyhpyvqbITUFLBByNH8q
 0mQ=
X-SBRS: 2.7
X-MesageID: 20975100
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,518,1583211600"; d="scan'208";a="20975100"
Date: Tue, 16 Jun 2020 19:38:57 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH v1 7/7] x86/vmx: switch IPT MSRs on vmentry/vmexit
Message-ID: <20200616173857.GU735@Air-de-Roger>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
 <317430261.8766476.1592321051337.JavaMail.zimbra@cert.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <317430261.8766476.1592321051337.JavaMail.zimbra@cert.pl>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 16, 2020 at 05:24:11PM +0200, Michał Leszczyński wrote:
> Enable IPT when entering the VM and disable it on vmexit.
> Register state is persisted using vCPU ipt_state structure.

Shouldn't this be better done using Intel MSR load lists?

That seems to be what the SDM recommends for tracing VM events.

Thanks, Roger.

