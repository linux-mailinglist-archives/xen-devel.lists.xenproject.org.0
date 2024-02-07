Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C05A84CCDE
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 15:35:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677708.1054496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXj0p-000127-Gx; Wed, 07 Feb 2024 14:34:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677708.1054496; Wed, 07 Feb 2024 14:34:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXj0p-0000zM-Dm; Wed, 07 Feb 2024 14:34:55 +0000
Received: by outflank-mailman (input) for mailman id 677708;
 Wed, 07 Feb 2024 14:34:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9378=JQ=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rXj0n-0000fl-Fu
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 14:34:53 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0daf0bd4-c5c6-11ee-98f5-efadbce2ee36;
 Wed, 07 Feb 2024 15:34:51 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-51168572090so912355e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 06:34:51 -0800 (PST)
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
X-Inumbo-ID: 0daf0bd4-c5c6-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707316491; x=1707921291; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RJXz4eOzOB/wEF6Z9P+wu/oxvAjOFut5Y1isvsL+Lo4=;
        b=mhk/jkLXgXP88JtVXxvFbelumAzF6bcjIFvTs03PK+GHwiEENg2nz7qZqQeTbloCaL
         XzmdVdDhhWoZ8Xhbexs0qfHd3+dglq/vHoTAxnjwWLjRkJKiMCCGjotOvSXpCv1d0yTd
         4jvR9KMnvtdqGdVEhxGvS1EEHR0MGPav1bGmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707316491; x=1707921291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RJXz4eOzOB/wEF6Z9P+wu/oxvAjOFut5Y1isvsL+Lo4=;
        b=Qb9FrRYcn3hplmf4XqpmjzkXgnAaX6fcAMVBi2YHtondZ37yg5eiQ4Ay2d0YdYSWyi
         r4iMeW7gS37iH+e99ebEupwR9OwZR7FBO4B5jlOOBmFibAD24CRDchO+HUO7w89A7K3Z
         LfKefJowRM/Ci4p0lVIUdIqgQTt+mUrV27Zdsbx4H66lcAogHH75P7eIcEhfD7G3GaLu
         H5WHADUYUP5nXlyLsmGhCgKCQn7QBz7cVyCvtZMd+4duE/rAii36nqWpz7Q9gdJRRwqW
         HUDVBi1+3OKD/rM5YSNJdWCLVm0zFRX9Wo6Zpby0r64V/L8Mn9ExKs/fM8W3G9AE93Mi
         H34Q==
X-Gm-Message-State: AOJu0YxsK0GSXSVUjcb5VKZJj1SdjVavUiFvvqWQh5WEMwymzO4pt7c2
	3c41IyedIB3a732cJIunj5QgkEHJ3Rd8U4GBHdZng2r+Ewa+fNR69mPRYcB+RFfO3kyldW0Apws
	6EpsAzaBBB4boN8HLp14mj0aNpwJjbcT/K52MYw==
X-Google-Smtp-Source: AGHT+IG+SRYI4PlCbGiEJw48dR5iliE1UaLoAi6lzqHkmM9BvRirdMojkkXHaxa4MjbiwujUdZOssYoJfjvHFfZrQbc=
X-Received: by 2002:ac2:5a01:0:b0:511:4844:77f2 with SMTP id
 q1-20020ac25a01000000b00511484477f2mr4254008lfn.40.1707316491464; Wed, 07 Feb
 2024 06:34:51 -0800 (PST)
MIME-Version: 1.0
References: <65c38d7a7ea07_2d1b5321c96792@gitlab-sidekiq-catchall-v2-779bdffdc8-kp98w.mail>
 <115f10ac-a115-40d1-a444-50e960320557@suse.com> <65665f86-cbfc-4352-9d81-67ac0b21b161@citrix.com>
In-Reply-To: <65665f86-cbfc-4352-9d81-67ac0b21b161@citrix.com>
From: Anthony PERARD <anthony.perard@citrix.com>
Date: Wed, 7 Feb 2024 14:34:40 +0000
Message-ID: <CAKoJhMROFw1w679U9xsW6s4p34Zzm6-gaHihUHtU1w5ZH9ViUQ@mail.gmail.com>
Subject: Re: xen | Failed pipeline for staging | f4519ee8
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 7, 2024 at 2:24=E2=80=AFPM Andrew Cooper <andrew.cooper3@citrix=
.com> wrote:
> >> Stage: test
> >> Name: qemu-smoke-riscv64-gcc
> > I have to admit that I can't connect what was pushed recently to this j=
ob
> > failing.
>
> The qemu smoke tests for riscv and ppc intermittently fail on the
> OSSTest-lab infrastructure in Gitlab.
>
> We've never got to the bottom of it.

It's maybe because joubertin* and nocera* have more than one NUMA
nodes. It's look like 2 for nocera* and 4 for joubertin*.
Would that be enough of of an explanation about those tests taking a
bit longer than expected?
I could try to setup gitlab-runner/docker to have the containers
running on a single node, since my guess is Linux doesn't do that well
enough.

Cheers,

--=20
Anthony PERARD

