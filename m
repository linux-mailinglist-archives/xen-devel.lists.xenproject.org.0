Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA4F853444
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 16:09:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680006.1057802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZuPG-0005jH-NR; Tue, 13 Feb 2024 15:09:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680006.1057802; Tue, 13 Feb 2024 15:09:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZuPG-0005hB-Kq; Tue, 13 Feb 2024 15:09:10 +0000
Received: by outflank-mailman (input) for mailman id 680006;
 Tue, 13 Feb 2024 15:09:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+jOn=JW=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1rZuPF-0005gR-Id
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 15:09:09 +0000
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [2607:f8b0:4864:20::c35])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5d8349f-ca81-11ee-8a4d-1f161083a0e0;
 Tue, 13 Feb 2024 16:09:09 +0100 (CET)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-595b3644acbso2333950eaf.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Feb 2024 07:09:09 -0800 (PST)
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
X-Inumbo-ID: d5d8349f-ca81-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707836947; x=1708441747; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K5RylAlv7OWrL6a01VMui+e25V6uawgAKvykDJbNmtg=;
        b=KI6hYkZ5Y9xf1kNUia6IYRBGwTfw9xeOSBtgxRm00VMxunH142Tbw3If5j+f1Fv7ZJ
         f8CszrJX0+0HClmfPub37lkzZuTtpoZNOsKgXf1LmmYFrsItKEC0a3HqQ/t8YsbaT/jz
         lbJ02tsBsGVE9dLStcG+4JE0bv3rJEY4eDZdJPXq5WAMkSGZtY99KKpmWNvqwpq9xmQ3
         BEGLqO95Z22EUXwy8BiePFAqQPQ6UBcjPqSdbhkMgRYnhcCD3d4/iNsZ69sYPzeQ4D8o
         I0qw9DhRMPsuTpYqrzt4nisAPYRMwxIUC/Bb8o2Kxs9KcW2aPDsE4XSFnJJ8RfNQXfXc
         De9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707836947; x=1708441747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K5RylAlv7OWrL6a01VMui+e25V6uawgAKvykDJbNmtg=;
        b=EkTxQKdIZTLp4nIRM1iQ+MFaVsSMoUgP679uiUY3thrb4GPO93dwuUegp/ZaiP6NmX
         bCUyP4SGUejRyYXrXbA5RljWY19IInmWj4jEglMYLLR8pBKSAXr4w2xHc4u7B7jCYFnU
         Xm/3neZ5waISwthhTE3UF93lbYUJstjKDOCI1/0BEapQlayywwUNmW60VrKtr2h6Vftm
         Z5aJ+EQNMEU/gm2Iz4rH64Sh4vBYn0c8+6FVmy4XSh6XFrNsv2GGWbQLlAw464AT1fwr
         bpH9lSSGW6paUaI5y1Q8KYOm9k/jicXBHO+S6/oL9T9U71Sbo8SJvPunxNB78zXFBuD6
         UdHA==
X-Forwarded-Encrypted: i=1; AJvYcCVNqDRKNfuTvPddSkO5DlMtfXrPUxtHj7eF2ewj78zsWBbh8846fuJCs0cci9UialSSAv3veFIQDiptKI2VpHjRFZatfJ5YyePQMzj+73M=
X-Gm-Message-State: AOJu0Yy55eDbS7L4lD8hHOevNpnkfoV3+hXLGFYRtOYWu1+41djHJJTI
	TRNBUoOEu5QYhA6HQNRMmNS3zYeTNq47y84ucIhIh8cw7ECy2P7NhFeLnCH3uTUoH15e+IT03kb
	omMKBR+IKcSO94wbZpapa0fv571A=
X-Google-Smtp-Source: AGHT+IHXcSiXV8TKgh5H1Ka4FnpH0/FfcxF93dyUqN6KpyJd4ieGd949LuGJpaXVKA0D3Xk/lFAwXVQ1vUSF7SQb6XQ=
X-Received: by 2002:a05:6870:1494:b0:21a:1e58:2ce0 with SMTP id
 k20-20020a056870149400b0021a1e582ce0mr1147218oab.29.1707836947629; Tue, 13
 Feb 2024 07:09:07 -0800 (PST)
MIME-Version: 1.0
References: <4ced67935b2e1a2fc79ccda7624c0849bea6cd87.1707836102.git.w1benny@gmail.com>
 <34bfa65b-5537-4bd3-a017-c9a3b01fb331@suse.com>
In-Reply-To: <34bfa65b-5537-4bd3-a017-c9a3b01fb331@suse.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Tue, 13 Feb 2024 16:08:56 +0100
Message-ID: <CAKBKdXiZ1wcz7_GnUHUmuboTHHVEE03QPSeWhdRKMoV=o7nf3w@mail.gmail.com>
Subject: Re: [PATCH v2] libxl: Fix comment for LIBXL_HAVE_VMTRACE_BUF_KB
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> On Tue, Feb 13, 2024 at 4:02=E2=80=AFPM Jan Beulich <jbeulich@suse.com> w=
rote:
>
> On 13.02.2024 15:56, Petr Bene=C5=A1 wrote:
> > From: Petr Bene=C5=A1 <w1benny@gmail.com>
> >
> > It's located in libxl_domain_build_info, not libxl_domain_create_info.
> >
> > Signed-off-by: Petr Bene=C5=A1 <w1benny@gmail.com>
> > Acked-by: Anthony PERARD <anthony.perard@citrix.com>
>
> Any reason you didn't also add the Fixes: tag that Anthony suggested
> to put there (for me to recognize that this may need backporting;
> didn't check yet when that earlier commit went in)?
>
> Jan

Apologies. No other reason that it's my first experience with creating
v2 patch and I honestly didn't know that the "Fixes: tag" suggestion
was directed at me. How should I proceed from here?

P.

