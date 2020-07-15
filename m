Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F31E022079A
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 10:41:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvcym-0005zr-Bt; Wed, 15 Jul 2020 08:41:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=osgb=A2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jvcyl-0005zl-3K
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 08:41:27 +0000
X-Inumbo-ID: f685dbba-c676-11ea-939d-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f685dbba-c676-11ea-939d-12813bfff9fa;
 Wed, 15 Jul 2020 08:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594802485;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=qOIlK/cVyyOE1sWXX5QKm0Oq6F74EPo/yMXtJBvTGzc=;
 b=ETTz8vtcZn5eFji4cWWsgyyh0YeCz3cKGfCJfFx5V/XE+b391Q9Hi6/a
 XtpTq8/mOcIkahl7I+YnfJ71CkDtPgm3AOkP/cFedBRujpCbHdo3TaERp
 5FGmSUrlcArdXLztyKFwSF08yLvimm2gmRVAfAPzcoX/g6pUh68BOjTEl w=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: b7rsqCGmoulWnZI2MCgkcsNEKMBHqsqx/4UsM2fKwx2lHSNCWuPfD5mkXkZHbezHKbJ6RMvscE
 6NCiv6ivzGBbmr4bN5qMTB/rVAmL0lLoJ3j/EPfj91VQbF9abgeQ/OF5cILErAv3+++ZdmIQUo
 lukqUnj5FPabD6n16K6oq96NBSK616oX9iVjE2ti3nUJYrQRG1lIGne25K6zz/t6VcVyZqBj/d
 bFAyv/w2IdyVroDvtbeeZVnW82yyrGFCbzGPuYLNMXy3lOGrqpFsU/AOQBOSDyC+Q2JVwwmqkr
 ZnM=
X-SBRS: 2.7
X-MesageID: 22407872
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,354,1589256000"; d="scan'208";a="22407872"
Date: Wed, 15 Jul 2020 10:41:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2 6/7] flask: drop dead compat translation code
Message-ID: <20200715084115.GS7191@Air-de-Roger>
References: <bb6a96c6-b6b1-76ff-f9db-10bec0fb4ab1@suse.com>
 <7711f68d-394e-a74f-81fa-51f8447174ce@suse.com>
 <20200714145800.GO7191@Air-de-Roger>
 <937a51c5-7563-0ac2-4ada-b4dfd7a5d636@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <937a51c5-7563-0ac2-4ada-b4dfd7a5d636@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel de Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 15, 2020 at 08:42:44AM +0200, Jan Beulich wrote:
> On 14.07.2020 16:58, Roger Pau Monné wrote:
> > On Wed, Jul 01, 2020 at 12:28:07PM +0200, Jan Beulich wrote:
> >> Translation macros aren't needed at all (or else a devicetree_label
> >> entry would have been missing), and userlist has been removed quite some
> >> time ago.
> >>
> >> No functional change.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>
> >> --- a/xen/include/xlat.lst
> >> +++ b/xen/include/xlat.lst
> >> @@ -148,14 +148,11 @@
> >>  ?	xenoprof_init			xenoprof.h
> >>  ?	xenoprof_passive		xenoprof.h
> >>  ?	flask_access			xsm/flask_op.h
> >> -!	flask_boolean			xsm/flask_op.h
> >>  ?	flask_cache_stats		xsm/flask_op.h
> >>  ?	flask_hash_stats		xsm/flask_op.h
> >> -!	flask_load			xsm/flask_op.h
> >>  ?	flask_ocontext			xsm/flask_op.h
> >>  ?	flask_peersid			xsm/flask_op.h
> >>  ?	flask_relabel			xsm/flask_op.h
> >>  ?	flask_setavc_threshold		xsm/flask_op.h
> >>  ?	flask_setenforce		xsm/flask_op.h
> >> -!	flask_sid_context		xsm/flask_op.h
> >>  ?	flask_transition		xsm/flask_op.h
> > 
> > Shouldn't those become checks then?
> 
> No, checking will never succeed for structures containing
> XEN_GUEST_HANDLE(). But there's no point in generating xlat macros
> when they're never used. There are two fundamentally different
> strategies for handling the compat hypercalls: One is to wrap a
> translation layer around the native hypercall. That's where the
> xlat macros come into play. The other, used here, is to compile
> the entire hypercall function a second time, arranging for the
> compat structures to get used in place of the native ones. There
> are no xlat macros involved here, all that's needed are correctly
> translated structures. (For completeness, x86's MCA hypercall
> uses yet another, quite adhoc strategy for handling, but also not
> involving any xlat macro use. Hence the consideration there to
> possibly drop the respective lines from the file here.)

Thanks, I think this explanation is helpful and I wonder whether it
would be possible to have something along this lines in a file or as a
comment somewhere, maybe at the top of xlat.lst?

Also could you add a line to the commit message noting that flask code
doesn't use any of the translation macros because it follows a
different approach to compat handling?

IMO the compat code is complicated to understand, and it also seems to
be mostly undocumented.

For the patch:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

