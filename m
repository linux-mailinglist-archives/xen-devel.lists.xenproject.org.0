Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA8A32F076
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 17:58:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93915.177423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIDmT-00077n-2y; Fri, 05 Mar 2021 16:58:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93915.177423; Fri, 05 Mar 2021 16:58:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIDmS-00077R-Vp; Fri, 05 Mar 2021 16:58:24 +0000
Received: by outflank-mailman (input) for mailman id 93915;
 Fri, 05 Mar 2021 16:58:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lIDmR-00077M-EI
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 16:58:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lIDmR-0002dy-BM
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 16:58:23 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lIDmR-0005WA-AN
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 16:58:23 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lIDmM-0000Zd-J6; Fri, 05 Mar 2021 16:58:18 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=HTq3VOKpN2RVbgaeFuerPy6PXQRO3SOBWnBKI9W1qPY=; b=HPOcqC0PWvVYHr3iJe/f22xwft
	qmDaa+ndtJGq6cvOQTuuqZNtCMvfXsBuhCiUF6sNgG3TPDJakiIM6mTfuvN0QGs+0p4rFxJ/780Hn
	3Q0WgdE0cdWGTTyBM8MTwrg9W+JBEsWQBctHFtB4aWRvLg2dMa0W016EWF/Ob+ji90Xg=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24642.25386.315054.76149@mariner.uk.xensource.com>
Date: Fri, 5 Mar 2021 16:58:18 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Tim Deegan <tim@xen.org>,
    George Dunlap <george.dunlap@citrix.com>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 1/2][4.15?] x86/shadow: suppress "fast fault path"
 optimization when running virtualized
In-Reply-To: <2983621d-c7bb-3cad-14bd-a26481be0109@citrix.com>
References: <d0190313-921f-7cbc-4659-9a79f6299fab@suse.com>
	<3bb90ab6-22c9-31d4-88a2-39bd3d81c2d7@suse.com>
	<2e09dfd0-5da4-bdcc-900b-d40a112d832b@citrix.com>
	<24642.24295.466588.233219@mariner.uk.xensource.com>
	<2983621d-c7bb-3cad-14bd-a26481be0109@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("Re: [PATCH 1/2][4.15?] x86/shadow: suppress "fast fault path" optimization when running virtualized"):
> On 05/03/2021 16:40, Ian Jackson wrote:
> > Andrew Cooper writes ("Re: [PATCH 1/2][4.15?] x86/shadow: suppress "fast fault path" optimization when running virtualized"):
> >> This wants backporting to stable releases, so I would recommend for 4.15
> >> even at this point.
> > Can someone explain to me the implications of not taking these patch,
> > and the risks of taking them ?
> >
> > AFIACT the implications of not taking 1/ are that we would misbehave
> > in a security relevant way, sometimes, when we are running under
> > another hypervisor ?
> 
> Correct.  Specifically if you've got a migration pool containing an
> IceLake server and something older.
> 
> > As to the risks, 1/ looks obviously correct even to me.
> 
> I agree, although Tim has the deciding maintainer vote.

Right, well, for patch 1 then

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

> > And the implications of not taking 2/ is a performance problem ?
> 
> Correct (I believe).
> 
> > 2/ seems complex.  What would go wrong if there were a misplaced ) or
> > confused bit-twiddling or something ?
> 
> The bit twiddling can be independency checked by disassembling the binary.
> 
> However, I have some concerns with the patch as-is, in relation to L1TF
> / XSA-273.

I'm going to hold off on this for now.  I think to give it a
release-ack I would want someone to argue the case.  Concerns would
include Andy's comments (which I saw earlier but do not fully
understand) and me wanting to to know (i) how bad is the perf impact
without it (ii) how has this bit-twiddling been checked.

I hope that makes sense.

Thanks,
Ian.

