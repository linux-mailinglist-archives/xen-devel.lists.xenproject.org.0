Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 988AAA94804
	for <lists+xen-devel@lfdr.de>; Sun, 20 Apr 2025 16:15:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960716.1352476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6VRI-0000bh-0D; Sun, 20 Apr 2025 14:14:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960716.1352476; Sun, 20 Apr 2025 14:14:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6VRH-0000a8-TX; Sun, 20 Apr 2025 14:14:31 +0000
Received: by outflank-mailman (input) for mailman id 960716;
 Sun, 20 Apr 2025 14:14:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dJou=XG=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1u6VRG-0000a0-Ci
 for xen-devel@lists.xenproject.org; Sun, 20 Apr 2025 14:14:30 +0000
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [2607:f8b0:4864:20::b2d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4e22209-1df1-11f0-9eb0-5ba50f476ded;
 Sun, 20 Apr 2025 16:14:28 +0200 (CEST)
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-e6a8aa771e8so2591301276.3
 for <xen-devel@lists.xenproject.org>; Sun, 20 Apr 2025 07:14:28 -0700 (PDT)
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
X-Inumbo-ID: c4e22209-1df1-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745158467; x=1745763267; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4eDjS9dml/91wUZdvmU4OGbE1FbA4NuafODmKT8GZnQ=;
        b=CILb+eCMMUy3KGiUvVOVixYPzwRTAo4Uv7Mi22XJbJ0EttXj4Hg+t5+stgcyqvQPC4
         m4bAJpU5BLYsAjiMMsUDCSfbKC6v5KSyvHkQYFiNSLG/jb8aVegDaVb+PWFzCAcoX0fc
         5SgRNrKTSGd01QEH5NivP04ERfc1JlNCkn7s4zZ3NHf1kgc3Ha+L+JOJ+EnCI9voogCl
         hMoLIUGmStDCzywqkoxxuyRKseHFJVmY77ngJcXrw5mRIS8VG8u/vAWtrlpX+fHLirpn
         5RvWHc4HPYuDP4Xs4M+4RepwDw7xFrNhin3EK9oqzHFblQqTURdBqmcun0iuF7Jj5BzB
         r9Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745158467; x=1745763267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4eDjS9dml/91wUZdvmU4OGbE1FbA4NuafODmKT8GZnQ=;
        b=vvycxMuPGYDJwvP9x0LGllzPjR0TpAyACLkOhFbkSuy0TwCI4RLBxBOkkY0Z+3bL/b
         zeBhAIapkuI4bux7L+A1fg3PrguR+55vMwmQ8/63KzbsBjl+NFLC1yt2faZ2SOetUtRu
         SfMLzUrFlLRBT4xlpwP7/kyGac86VB1+i46WS7M6776apX2RPn0p+BdaTCO9JOpQGshK
         8h0Rz0a8bD4T5MVOOds8DCmQ4xFiC5Fk6UbJUsc3DOOQbAYpxyQdovHuXd7Bdnb/k+n4
         MpAkdlZ+hMH+f47v4pi3qcq382hrqQeBquTaeUnvD2KkXlwbia0eCIpW9YQItb2fdLbc
         Xlww==
X-Forwarded-Encrypted: i=1; AJvYcCWRZaWph1mEQuxnzNj1aQi7Gegl/Hpr9FY1kpqyp6qzIjRjBdephGs4kD1TAKI7qnqmslehv/xSYJ4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxa5dWCIfE+Xc/4Twk7sBsebBHx+eYmpdjrre5Ross/m2SoT8Wi
	PFM2kmAomKlhssuna5LisLznUxWhryk7+61BwchvIcxUhwhnY/NtSFtlKEWgNtBfKcm24QLGIIs
	lblJ05+9VQb4Oex8AUSIlBmGKhqc=
X-Gm-Gg: ASbGnctNxyZnFKrl5EIKEi3n4oN+4/CcPsAXH6J79jfI4vf96Sk4I6hdER5p8DIb/OI
	FCnDLa/rulMgaw3xNVgmZusF8c6JbagM0ufZTObYA04YRO7JZbN2n7Y+B6+QI1lBZ6830l0YNIj
	GT7aBvIUXe3XQ0i4zHV7A=
X-Google-Smtp-Source: AGHT+IFb4jinzLTyx0F81tBmqDEds5c5n5PRoxllZMCI/LIgHB1gA8JuBzIiJZgFWLUtbexzIfMgPXr1mSRHPlvhIk0=
X-Received: by 2002:a05:6902:2385:b0:e6d:f157:c601 with SMTP id
 3f1490d57ef6-e7297dcce7bmr11923691276.17.1745158467132; Sun, 20 Apr 2025
 07:14:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250418205933.542150-1-jason.andryuk@amd.com> <43ce15d8-bf94-4b3c-9c2e-d1121476056f@xen.org>
In-Reply-To: <43ce15d8-bf94-4b3c-9c2e-d1121476056f@xen.org>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Sun, 20 Apr 2025 10:14:16 -0400
X-Gm-Features: ATxdqUERcuGK1q_dvA2JYmTBTclqWt-0UkOA6zcDCYBhs_wuZ4ci3XE5LxyEFaM
Message-ID: <CAKf6xpsh47SzaA3aYNBW30jOSCGE7ekNc0-MZEZkipgq-RC8VQ@mail.gmail.com>
Subject: Re: [PATCH] xenstored: Remove setjmp.h
To: Julien Grall <julien@xen.org>
Cc: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org, 
	Juergen Gross <jgross@suse.com>, Anthony PERARD <anthony.perard@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2025 at 6:51=E2=80=AFPM Julien Grall <julien@xen.org> wrote=
:
>
> Hi Jason,
>
> On 19/04/2025 05:59, Jason Andryuk wrote:
> > Use of setjmp/longjmp as removed in 2006, but the include remained.

Whoops, this should be "was removed".

> > Remove it now.
> >
> > Fixes: 1bac3b49cd ("Import the current version of talloc...")
>
> The subject truncation is ok however for the commit ID, we are expecting
> 12 characters (see docs/process/sending-patches.pandoc).

Sorry about that.  I used `--pretty=3Dfixes`, but I guess I have it
misconfigured on that machine.

The 12 character ID is:
1bac3b49cdd4

>
> > Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>
> With the remark above addressed (can be fixed on commit):
>
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Thanks,
Jason

