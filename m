Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CD11D93A9
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 11:44:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaynA-0003WW-8X; Tue, 19 May 2020 09:44:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PPOd=7B=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jayn8-0003WK-KB
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 09:44:06 +0000
X-Inumbo-ID: 46acefc8-99b5-11ea-a8eb-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 46acefc8-99b5-11ea-a8eb-12813bfff9fa;
 Tue, 19 May 2020 09:44:04 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: nbfM0cE4uTvOGlVC+iVD6Ua5gLTXHWs2Plv3qJMlRGDH8uygZtKGap/f/0I8DsIedHP/f95zFn
 8HUyZz1f0BpMKuU7UeRPOtKmM06hAO4TLXCKiboIqmOQWUEuESjjIfpFTpNxidb0VLpRAqJpn2
 KDtkY0WMxN2WGzFaXtHlhSYbIrKjyPeg2AZW4iqa7FuuhB7fxhIFRODJyukV+pkYkNyVwR6qM4
 6JUedKS37SdJ62xO5fe36eqtyjj2qjHRyZoXvcl4JeiTujJOvg4xnxtVs8RuuTy8kDFTi+NanH
 hgg=
X-SBRS: 2.7
X-MesageID: 18141824
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,409,1583211600"; d="scan'208";a="18141824"
Date: Tue, 19 May 2020 11:43:57 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] changelog: add relevant changes during 4.14 development
 window
Message-ID: <20200519094357.GD54375@Air-de-Roger>
References: <20200511103145.37098-1-roger.pau@citrix.com>
 <9f783539-6a36-08eb-c141-bd0f76e5acfd@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9f783539-6a36-08eb-c141-bd0f76e5acfd@suse.com>
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
Cc: Community Manager <community.manager@xenproject.org>,
 xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, May 11, 2020 at 03:10:07PM +0200, Jan Beulich wrote:
> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
> 
> On 11.05.2020 12:31, Roger Pau Monne wrote:
> > Add entries for the relevant changes I've been working on during the
> > 4.14 development time frame. Mostly performance improvements related
> > to pvshim scalability issues when running with high number of vCPUs.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  CHANGELOG.md | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/CHANGELOG.md b/CHANGELOG.md
> > index b11e9bc4e3..554eeb6a12 100644
> > --- a/CHANGELOG.md
> > +++ b/CHANGELOG.md
> > @@ -8,6 +8,12 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
> >  
> >  ### Added
> >   - This file and MAINTAINERS entry.
> > + - Use x2APIC mode whenever available, regardless of interrupt remapping
> > +   support.
> > + - Performance improvements to guest assisted TLB flushes, either when using
> > +   the Xen hypercall interface or the viridian one.
> > + - Assorted pvshim performance and scalability improvements plus some bug
> > +   fixes.
> 
> Wouldn't most/all of these better go under a "### Changed" heading?

Sorry I didn't get to this on time, I see the patch has been
committed. Would you like me to move them?

Roger.

