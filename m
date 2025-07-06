Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B99AFA6CB
	for <lists+xen-devel@lfdr.de>; Sun,  6 Jul 2025 19:24:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1034884.1407242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYT5i-0003Gz-JY; Sun, 06 Jul 2025 17:23:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1034884.1407242; Sun, 06 Jul 2025 17:23:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYT5i-0003Ew-GY; Sun, 06 Jul 2025 17:23:50 +0000
Received: by outflank-mailman (input) for mailman id 1034884;
 Sun, 06 Jul 2025 17:23:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XHaa=ZT=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uYT5g-0003Eq-Rn
 for xen-devel@lists.xenproject.org; Sun, 06 Jul 2025 17:23:48 +0000
Received: from 3.mo582.mail-out.ovh.net (3.mo582.mail-out.ovh.net
 [178.33.253.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f77ca8c8-5a8d-11f0-b894-0df219b8e170;
 Sun, 06 Jul 2025 19:23:43 +0200 (CEST)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.110.37.80])
 by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4bZvNb48x3z6MfX
 for <xen-devel@lists.xenproject.org>; Sun,  6 Jul 2025 17:23:43 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-s8dws (unknown [10.110.113.85])
 by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id CFC391000ED;
 Sun,  6 Jul 2025 17:23:42 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.104])
 by ghost-submission-5b5ff79f4f-s8dws with ESMTPSA
 id y5LCJx6xamh1+QQAffsLqA
 (envelope-from <sergii.dmytruk@3mdeb.com>); Sun, 06 Jul 2025 17:23:42 +0000
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
X-Inumbo-ID: f77ca8c8-5a8d-11f0-b894-0df219b8e170
Authentication-Results:garm.ovh; auth=pass (GARM-104R005a2dcb11e-881a-4342-a29a-79d4e2703a04,
                    FF3279A5BAD606DDEEDDFD371ACA0117F5CC5AB0) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
Date: Sun, 6 Jul 2025 20:23:40 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 12/22] x86/hvm: check for VMX in SMX if Slaunch is
 active
Message-ID: <aGqxHAvkf77-VsWs@MjU3Nj>
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <25de2a5ba43629cca33b96d20c77f19d64096242.1748611041.git.sergii.dmytruk@3mdeb.com>
 <22ff462d-11e7-42ea-806b-7a521ce67417@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <22ff462d-11e7-42ea-806b-7a521ce67417@suse.com>
X-Ovh-Tracer-Id: 12762919869199725657
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvleehtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepufgvrhhgihhiucffmhihthhruhhkuceoshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeevveevgefgvdekvefhffevgeejgffghfehiedvffdtgfevudetkefhgfekfeffvdenucfkphepuddvjedrtddrtddruddpudejiedrudduuddrudekgedrvddvuddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehkedvmgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=i4qJsy7OXrSypH5nuyYZlau5MyihHF8LVckzoMVxP4k=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1751822623; v=1;
 b=aqj0NA4+c7zEg3M//MxS3hgl+PQJItghKFH9WFZ5L54Z9uB/5q4KMSQS5vMDL0K9GGx8REYv
 DN0D1Ypaoegt6P0XLj9s8Kj9JpFrU7IO62FNxc+k8V7scogx7pwcQjtB4cU9BBeuaia60WlFdWj
 E+4vekQAUHygiORguXRQhxPbEFKh6pee3OQ0RPwvM+MSxCtKxDTeXoj+TdKJXjzjtHviNRehlez
 P4NLwjGPSzETV6CGUc3iLDwAzI3lvLLGaZbwqMhuYLtfWSrLPmj8BhejRnbQcc1+lKwwQzQxbf6
 7cwk6HHAlw0laDtCW7/OR4sA1xkejq4zRJEtEKFdlX8XQ==

On Wed, Jul 02, 2025 at 04:50:05PM +0200, Jan Beulich wrote:
> On 30.05.2025 15:17, Sergii Dmytruk wrote:
> > From: Michał Żygowski <michal.zygowski@3mdeb.com>
> >
> > Check whther IA32_FEATURE_CONTROL has the proper bits enabled to run
> > VMX in SMX when slaunch is active.
> >
> > Signed-off-by: Michał Żygowski <michal.zygowski@3mdeb.com>
>
> Apart from this lacking your own S-o-b:
> Acked-by: Jan Beulich <jbeulich@suse.com>
>
> Jan

Missed that, most of the time git adds S-o-b on its own.

Thanks

