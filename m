Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F727F969E
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 00:47:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641519.1000081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7OpJ-0005VN-04; Sun, 26 Nov 2023 23:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641519.1000081; Sun, 26 Nov 2023 23:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7OpI-0005SQ-TW; Sun, 26 Nov 2023 23:46:12 +0000
Received: by outflank-mailman (input) for mailman id 641519;
 Sun, 26 Nov 2023 23:46:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+N0s=HH=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1r7OpH-0005SK-LL
 for xen-devel@lists.xenproject.org; Sun, 26 Nov 2023 23:46:11 +0000
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f35b3806-8cb5-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 00:46:01 +0100 (CET)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169]) by mx.zohomail.com
 with SMTPS id 1701042355550503.334650266578;
 Sun, 26 Nov 2023 15:45:55 -0800 (PST)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-5b383b4184fso36795587b3.1
 for <xen-devel@lists.xenproject.org>; Sun, 26 Nov 2023 15:45:55 -0800 (PST)
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
X-Inumbo-ID: f35b3806-8cb5-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; t=1701042358; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OcnDc+kPXb9DTvzRwFbKiqRBfQ4ycEzdZseVJvW/wUDNh4ENGZykAF6bVAPfZmi0dvfjeqSqGplI9XD+lqWyAoijxJK44N9ICwchYKV9rpFC/dBlqmchNyXYCjoD+YX1iZEjPtATY3VXe65VJEQ50nEFjeCIPvQkVLDib8DPW0s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1701042358; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4IJwgedyDNLSUAna4chhs+5GUUpSKzzdKWokeejZMh0=; 
	b=L3EwAvJAx+wNrIcN0StyAVM5W3OfUWGobCNlWr1bAPRxAYX5RbslHlkmrPx5mU20l8PTZmj/B2rycTnQWrpp0HWAxw+d6TtXS5iB0BLxXzR3SB6dqYwzHnUbOkfRucdvh0umYu6TBKP7xihzGSJdXM3v1JAmESfQigRW3xP2y5Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1701042358;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=4IJwgedyDNLSUAna4chhs+5GUUpSKzzdKWokeejZMh0=;
	b=hmT2pIwkIo8lreZ3V24QcQNUkqMNFdX4BByvfeF2pFRHYYuadrpc/unDbRlkhyWe
	pofZCWBH4pA/ZoLauNj1fav2UIqQWBb/RmgNZ0gJURM7gAZp9Dm6fClRZIdi52DdBm4
	3eqC59LrMU6AIhi2c4Jb8QycoLtp4C8XXUzpTNQc=
X-Gm-Message-State: AOJu0Yw0ijzSpWIDXUpB9Esw9ASBGKZf39UAcsnZddUB+VWjmrs1wAYX
	vpkArS/2YcXrjCkY174wjDSqjZgYU8lekhOVgk4=
X-Google-Smtp-Source: AGHT+IHYBQsGOK1rlZGwbBsKo0GRoEib7feCrPh3Io6w4KKViY1GicdO6jj9Pi8ZKJTWFKW2oWZObgdKF0fLh6TZszg=
X-Received: by 2002:a05:690c:2e88:b0:5cb:996d:15ea with SMTP id
 eu8-20020a05690c2e8800b005cb996d15eamr8523670ywb.4.1701042354953; Sun, 26 Nov
 2023 15:45:54 -0800 (PST)
MIME-Version: 1.0
References: <20231122163955.14555-1-frediano.ziglio@cloud.com> <03d5e381-1444-4ac0-9feb-3f46948e31b8@citrix.com>
In-Reply-To: <03d5e381-1444-4ac0-9feb-3f46948e31b8@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Sun, 26 Nov 2023 18:45:18 -0500
X-Gmail-Original-Message-ID: <CABfawh=GSbO8ApJ-QmERC3Z7xS4CozjoBGc4010aYRrbgboYQw@mail.gmail.com>
Message-ID: <CABfawh=GSbO8ApJ-QmERC3Z7xS4CozjoBGc4010aYRrbgboYQw@mail.gmail.com>
Subject: Re: [PATCH] x86/mem_sharing: Release domain if we are not able to
 enable memory sharing
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>, xen-devel@lists.xenproject.org, 
	Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 2:42=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> On 22/11/2023 4:39 pm, Frediano Ziglio wrote:
> > In case it's not possible to enable memory sharing (mem_sharing_control
> > fails) we just return the error code without releasing the domain
> > acquired some lines above by rcu_lock_live_remote_domain_by_id.
>
> Fixes: 72f8d45d69b8 ("x86/mem_sharing: enable mem_sharing on first memop"=
)
>
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
>
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

