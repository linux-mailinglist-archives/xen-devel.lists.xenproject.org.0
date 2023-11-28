Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E75D07FBE7C
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 16:50:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643294.1003335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r80LR-0006sI-Cp; Tue, 28 Nov 2023 15:49:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643294.1003335; Tue, 28 Nov 2023 15:49:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r80LR-0006px-A3; Tue, 28 Nov 2023 15:49:53 +0000
Received: by outflank-mailman (input) for mailman id 643294;
 Tue, 28 Nov 2023 15:49:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zxdS=HJ=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1r80LQ-0006pp-9T
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 15:49:52 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c43e9273-8e05-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 16:49:51 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-54b8276361cso2512226a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Nov 2023 07:49:51 -0800 (PST)
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
X-Inumbo-ID: c43e9273-8e05-11ee-98e3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701186591; x=1701791391; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t260ZxEeDhOc/ZZeUCIyG4DebFCLK+ZQzABGUVIGfsA=;
        b=m7VUvbSMnVWpU1tX/ERGqMFOEFDDyILdImDMJmII/8t2Wya8vlP96yt7boyIiT6YHK
         fqWt+ueXE7i0Bqi0bmCv+2uhvNkm+uuDyj8hdBso8GN9w8CLagA5IaKjym6M9zRO83zn
         ZSDgWhRMCPUsAnYuR+JobPk9ksQHBGZZ8bRrNOFzXd9a3vCD4MKSBBj11hYXstbtILLv
         HvmQ6jdulFkD4IkGJ+mfEXZ7aJv9Oj9m7MuUmZGlM1xEJBo90U9Oygmo6wX/Ckt1z8uq
         RKIWibt0LQLszHUurNUJe2ZpzCWdroUPX2lcLyh/nM1qLfWvicJ6D3jT6RbmXvAp1dI4
         oPdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701186591; x=1701791391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t260ZxEeDhOc/ZZeUCIyG4DebFCLK+ZQzABGUVIGfsA=;
        b=FP+Y7YxNAl/UJIH2zgtVwDlDpXUqIHOS+uQsBXVQ7sOa0fxnD6blevstAHvc//vqRB
         dCgkDwky6t/T56pm+azRXd5MV/g1u7PMQftrs7X5+fq5bJHtjzSk02DRvARgAMG8UKk9
         ND/ixSL/iyJm1/rLqXaUUTrA/Uji4ue3pbsnAhP7U2UyTSRFUjkgM7Takf1wNvTae24I
         GlkaxvZOdtG1q9vKll5TAOqtr4SFpZHQ5O+3nQ+dR9XH+l4QlM9MWzhzgIyYYHu+lE/6
         1ppI/2QU7qfrN6EKZ27cFxWTEmtvgElfndG2rSXMY773XCvYu4pVIIWcd80sy42ZtOK8
         h2hg==
X-Gm-Message-State: AOJu0Yz2pAiQttRBVikxJuB6catR6DXjHkRQYGw/a0VHpYe7QaObZMe2
	pvwYfqPoQr9Xlpw2lFQqFppxbQpGJ/h3upOaF5E=
X-Google-Smtp-Source: AGHT+IEJvYVCWaGLIPpdn5mWwriMrRmuQBg77ck3Sc7MSDE6iowLcp09YYLQEHAkUTlRVYuMZNCDv6lm/PZsU5Ig2yw=
X-Received: by 2002:a05:6402:713:b0:54b:1a4c:871a with SMTP id
 w19-20020a056402071300b0054b1a4c871amr9152019edx.19.1701186590798; Tue, 28
 Nov 2023 07:49:50 -0800 (PST)
MIME-Version: 1.0
References: <20231110160804.29021-1-jgross@suse.com> <20231110160804.29021-10-jgross@suse.com>
In-Reply-To: <20231110160804.29021-10-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 28 Nov 2023 10:49:38 -0500
Message-ID: <CAKf6xptfFX9ONv70h+-O2UXw7PQbUppB+qHbRMxTyhSmMOMfyw@mail.gmail.com>
Subject: Re: [PATCH v2 09/29] tools/xenlogd: add 9pfs open request support
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 10, 2023 at 12:16=E2=80=AFPM Juergen Gross <jgross@suse.com> wr=
ote:
>
> Add the open request of the 9pfs protocol.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

