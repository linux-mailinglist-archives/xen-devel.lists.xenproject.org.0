Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D547F419F
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 10:28:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638571.995266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5jWa-0000Sp-EV; Wed, 22 Nov 2023 09:28:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638571.995266; Wed, 22 Nov 2023 09:28:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5jWa-0000Qg-Bf; Wed, 22 Nov 2023 09:28:00 +0000
Received: by outflank-mailman (input) for mailman id 638571;
 Wed, 22 Nov 2023 09:27:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xj/n=HD=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r5jWZ-0000Qa-E7
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 09:27:59 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c0a2aef-8919-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 10:27:57 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 0BD754EE073C;
 Wed, 22 Nov 2023 10:27:57 +0100 (CET)
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
X-Inumbo-ID: 6c0a2aef-8919-11ee-98e1-6d05b1d4d9a1
MIME-Version: 1.0
Date: Wed, 22 Nov 2023 10:27:57 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Xen Devel <xen-devel@lists.xenproject.org>,
 Consulting <consulting@bugseng.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>
Subject: Re: Devise macros to encapsulate (x & -x)
In-Reply-To: <1799e5c8-ab8a-453f-96f0-c3b66ae446e1@suse.com>
References: <08e6cb27d65250d109df0ef8a49dc80a@bugseng.com>
 <ddb70b8e-e014-4389-9572-8d5272a73ec3@citrix.com>
 <alpine.DEB.2.22.394.2311171845440.773207@ubuntu-linux-20-04-desktop>
 <da1d557a-6030-4dd8-a875-af733572fc48@xen.org>
 <alpine.DEB.2.22.394.2311211742400.2053963@ubuntu-linux-20-04-desktop>
 <1799e5c8-ab8a-453f-96f0-c3b66ae446e1@suse.com>
Message-ID: <054ccbe1173f4a9ec27ca4201e6d74a2@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit


>> 
>> Jan, would you be willing to accept that other maintainers have a
>> preference for having a single MACRO even if suboptimal?
> 
> I can live with that, even if I'm surprised by this perspective that 
> others
> take. How can we, in reviews, tell people to make sure arguments are
> evaluated only once, when then we deliberately do otherwise in a case 
> like
> the one here? The criteria of "not likely to be used in cases that have
> side effects" is an extremely fuzzy and sufficiently weak one, imo. I 
> for
> one am even worried about the uses in MASK_EXTR() / MASK_INSR(), and 
> would
> have considered introducing single-evaluation forms there as well.
> 
>> If so, can we go ahead and commit the original patches?
> 
> Well, the renaming needs to be done there anyway.
> 

I can do the renaming if you don't feel particularly safe doing it on 
commit. I already modified my local version to do experiments with 
single evaluation anyway.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

