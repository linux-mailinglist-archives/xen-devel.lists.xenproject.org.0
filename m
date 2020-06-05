Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC3F1EF35B
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 10:47:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jh807-0006vb-FA; Fri, 05 Jun 2020 08:46:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lb65=7S=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jh806-0006vW-Ba
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 08:46:54 +0000
X-Inumbo-ID: 1a5c33f0-a709-11ea-af8e-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a5c33f0-a709-11ea-af8e-12813bfff9fa;
 Fri, 05 Jun 2020 08:46:53 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: f8OXVohKE4k/nmQym3ANfLiLOliTUROI64UtVoj82JVSSfs3jUgD3fWlSRFUsScnhLIKYjUuxg
 7h0yEHX13DAaxvE7FC2p2EE09WVvZuYvLa6zm8bsKuIiQgon3gFrxqu8zVj+9Yjvu0KKg7s57i
 /zU6ABQm9BC8mGaOLXbp9YnBKNU5bts4rNU4Ud9u/qP6TvwN/1LUaueUCB2vOEQ0TPMvUGhocd
 N++covbL6KVNXQGjoiunLDY7kGbVQvyjnc6Oolglr6IGcYtifpcJfgvhCkscObBkNvjGywHdmz
 /aI=
X-SBRS: 2.7
X-MesageID: 19553588
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,475,1583211600"; d="scan'208";a="19553588"
Date: Fri, 5 Jun 2020 10:46:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86/Intel: insert Ice Lake and Comet Lake model numbers
Message-ID: <20200605084644.GJ1195@Air-de-Roger>
References: <baa738ce-0398-48df-e94e-dc8b86a35f6c@suse.com>
 <20200605080216.GI1195@Air-de-Roger>
 <32c4cdf7-0fdd-8b12-ee42-dfe8fe096935@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <32c4cdf7-0fdd-8b12-ee42-dfe8fe096935@suse.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jun 05, 2020 at 10:10:01AM +0200, Jan Beulich wrote:
> On 05.06.2020 10:02, Roger Pau Monné wrote:
> > On Fri, Jun 05, 2020 at 09:51:09AM +0200, Jan Beulich wrote:
> >> Both match prior generation processors as far as LBR and C-state MSRs
> >> go (SDM rev 072) as well as applicability of the if_pschange_mc erratum
> >> (recent spec updates).
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> Such changes having been subject to backporting in the past, this
> >> change may want considering for 4.14.
> >> ---
> >> I'm leaving alone spec_ctrl.c, albeit there's a scary looking erratum
> >> for Ice Lake indicating that MDS_NO may wrongly be set. But this is
> >> apparently addressed by ucode update, so we may not need to deal with
> >> it in software.
> >>
> >> --- a/xen/arch/x86/acpi/cpu_idle.c
> >> +++ b/xen/arch/x86/acpi/cpu_idle.c
> > 
> > What about mwait-idle? I guess we pick that from Linux and no patch
> > has been added so far?
> 
> Correct. I've looked at recent history there, and I'm uncertain they'll
> add further models there. They look to prefer to use ACPI _CST now again
> with, as it seems, not overly much of a difference to the ACPI driver
> (which, if we were to follow, I'd rather see us integrate there).

Urg, OK, that's a shame as using mwait-idle was IMO better from a Xen
PoV as we didn't rely on dom0 in order to discover C states. I wonder
if we could continue to update mwait-idle on our own for newer models.

FWIW, wikichip also lists 6c and 6a [0] as Ice Lake Server model versions,
but I'm not sure if this has been confirmed in any way?

Roger.

[0] https://en.wikichip.org/wiki/intel/cpuid#Big_Cores_.28Server.29

