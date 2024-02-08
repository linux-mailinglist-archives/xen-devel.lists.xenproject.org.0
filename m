Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9E084D746
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 01:46:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677917.1054840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXsYQ-0006s9-7g; Thu, 08 Feb 2024 00:46:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677917.1054840; Thu, 08 Feb 2024 00:46:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXsYQ-0006qc-4X; Thu, 08 Feb 2024 00:46:14 +0000
Received: by outflank-mailman (input) for mailman id 677917;
 Thu, 08 Feb 2024 00:46:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+jwf=JR=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rXsYP-0006qW-9j
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 00:46:13 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74497895-c61b-11ee-98f5-efadbce2ee36;
 Thu, 08 Feb 2024 01:46:11 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-55ad2a47b7aso1742364a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 16:46:11 -0800 (PST)
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
X-Inumbo-ID: 74497895-c61b-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707353171; x=1707957971; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/OCgb0jTRL69NrP0XVB7Vo2l0PgRnEdf6iV8TLjQ5ec=;
        b=ChEvcRnKvKNAauevlxBmKR+7YPb4LaduC8P/CjVOWLbcRm0CBasQ1DW750JsjT4b3f
         7cBnGuvBVouTqwuxMjAqIAi25spKkdH/hjHHoVUJXcZLgUtWeB+nAfhy/gz5H62X/8Gr
         ksW9czmI2dj8f5CqA3zLje9fWDl+TOD0OxIgvjoux1cAS+v7Qn7zKY/7JyyqECk2TPUM
         tf9Hzxk95WSI0QfhNCGyoMOXIlqHtBcchlsW3yas68D4nmRGxvzzWhYm8/Zvo6jjCkDh
         /HC7tWBWBKKYCgrqtxBrW2uk+mLm4iP+x2nm9akUpM037MtH4v1DCCWs6g+Tu7+OZg6C
         1+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707353171; x=1707957971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/OCgb0jTRL69NrP0XVB7Vo2l0PgRnEdf6iV8TLjQ5ec=;
        b=EUNzWlgYGgzkSIzoK6a07ZAag1aB6qcIjz9MlK2v6JDF3oUU4vqgyog0v1sAY0VYo1
         8WBzJClfWJYEEUovGq6Wub7VFDMBn2z41o4dCc298mjawF2Fad+8x1TGAgWBaFOCRuYn
         641n4zOIsPF/1twXM209EtfkTClTCJhWNZ709Sc0Lk5OJvyyUVkXG7iiVY5UyLluTS7A
         U+o7nge+72zCh+O8n3XMcX2eBWh79HfjZXTXhF5BVFnUCLA22sYQvdiqL2lnQmZNvSpj
         HsTT4fE/k1O4a/eX3+9orndv7qaDTgD+OSNEIGw1KD6zpQ3yX5cMvdNuramKiMoUy/cj
         P1Lw==
X-Gm-Message-State: AOJu0YxwaiohsZJH4ju5cqkecuPG1H6PR5h8ydr2KjiNUpynK/tSB9SL
	Ls/Qz/GrOIBx9u7TBP93kRaDnr0U12H/SNpY3FsMNoqE/8xvUkejAe8lGajn+tTn29OYu8SAg+m
	qsFAwopFmhpjJ98SNJa+UUNsF5es=
X-Google-Smtp-Source: AGHT+IEkgmgNXu84IsAIEUvw5RpvD9U5KdWagYvH1D/akR77xdE1/K3zXnDhcSEmA9nr9jXGvZhvzp3UmfjjW21W6DU=
X-Received: by 2002:a05:6402:5154:b0:560:5fbb:a148 with SMTP id
 n20-20020a056402515400b005605fbba148mr5443550edd.39.1707353170582; Wed, 07
 Feb 2024 16:46:10 -0800 (PST)
MIME-Version: 1.0
References: <20240205105001.24171-1-jgross@suse.com> <20240205105001.24171-8-jgross@suse.com>
In-Reply-To: <20240205105001.24171-8-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 7 Feb 2024 19:45:59 -0500
Message-ID: <CAKf6xpurmS-__uvPAKzhQyhZbFAMepHU4r2HPvR+rNpRRLSjUQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/32] tools/xen-9pfsd: add 9pfs attach request support
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 5, 2024 at 5:57=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> Add the attach request of the 9pfs protocol. This introduces the "fid"
> scheme of the 9pfs protocol.
>
> As this will be needed later, use a dedicated memory allocation
> function in alloc_fid() and prepare a fid reference count.
>
> For filling the qid data take the approach from the qemu 9pfs backend
> implementation.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

