Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE99F57B926
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jul 2022 17:06:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.371960.603804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEBGV-0001Kx-Cs; Wed, 20 Jul 2022 15:05:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 371960.603804; Wed, 20 Jul 2022 15:05:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEBGV-0001J9-9C; Wed, 20 Jul 2022 15:05:31 +0000
Received: by outflank-mailman (input) for mailman id 371960;
 Wed, 20 Jul 2022 15:05:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uTqr=XZ=protonmail.com=mathieu.tarral@srs-se1.protection.inumbo.net>)
 id 1oEBGT-0000sn-5Y
 for xen-devel@lists.xenproject.org; Wed, 20 Jul 2022 15:05:29 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6332d667-083d-11ed-924f-1f966e50362f;
 Wed, 20 Jul 2022 17:05:27 +0200 (CEST)
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
X-Inumbo-ID: 6332d667-083d-11ed-924f-1f966e50362f
Date: Wed, 20 Jul 2022 15:04:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1658329482; x=1658588682;
	bh=8I6cUtZSxk5aI20oZA3YlA3RP4NUz/d6XthLogP9r+E=;
	h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
	 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
	 Feedback-ID:Message-ID;
	b=G491Dn2r0ZXu4IEQcp2uuwyYDSgPsyWy6x1cPic4+z/8KMtLS1+X2auvtagsZuhA4
	 6LCAsxaOecbbgxAY1EFMmz2sangpVgII8LiM9zprdmocrYSr7UOF+jgk0lY14DKz1n
	 Rlermn1I2/2rayToe/P1Fy3V2EqI7tOXnwpMhsBIP0jg25b4iK8Q4YHX30wyuidQQS
	 lguqcqAjVQyhwi4432JmBXb5X5RyhXjxg7ovkEF7uMNGTMwXXgmcAW4KVFUADrW6z4
	 Q3IRocngeD8A+G/3QPH4mbHoMlACpURyMSdW4/xQG96jWUf/DMXNljKpzIIzmpFWLG
	 n8baQdSuUU8Vg==
To: Anthony PERARD <anthony.perard@citrix.com>
From: Mathieu Tarral <mathieu.tarral@protonmail.com>
Cc: Xen-users <xen-users@lists.xenproject.org>, George Dunlap <George.Dunlap@citrix.com>, George Dunlap <dunlapg@umich.edu>, Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Reply-To: Mathieu Tarral <mathieu.tarral@protonmail.com>
Subject: Re: xen master: xl create hangs
Message-ID: <hF_ANsRE_9Sbu2AU-AYkf0uIMtOhY2NGK2eG1QOXsdL8uKwi7K9y3SrJAJ4UrHJ34Mpp2WXUGOh4F2vdtJpguCOVHn-K-XuwtYeISjijagk=@protonmail.com>
In-Reply-To: <YtgRpBR0duVAqPZJ@perard.uk.xensource.com>
References: <YtgRpBR0duVAqPZJ@perard.uk.xensource.com>
Feedback-ID: 279104:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Anthony


> $(debug) controls the level of optimisation of the compilation to make
> it easier to debug.
>
> So, with debug=3Dy, we have libxenstore having issue with killing the
> its reading thread? :-(
> Maybe that reading thread is doing something that can't be stopped,
> maybe it's waiting for a lock. Could you try to print a back trace of
> that thread (or even all thread in `xl`)? ("thread apply all bt full" in =
gdb)

I recompiled the buggy master, and this is the full GDB stacktrace when xl =
create hangs:
https://gist.github.com/Wenzel/969d5c06982246cd6cb2eb8cdf252a18

I don't see the same stacktrace as before, maybe I was on a different commi=
t ?

I hope this helps.

Mathieu


