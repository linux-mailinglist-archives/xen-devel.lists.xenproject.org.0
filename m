Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8A07E43C7
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 16:47:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628904.980830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0OIK-0003na-CO; Tue, 07 Nov 2023 15:47:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628904.980830; Tue, 07 Nov 2023 15:47:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0OIK-0003la-9Y; Tue, 07 Nov 2023 15:47:12 +0000
Received: by outflank-mailman (input) for mailman id 628904;
 Tue, 07 Nov 2023 15:47:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zQVP=GU=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1r0OIJ-0003lR-0p
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 15:47:11 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e950ea12-7d84-11ee-98da-6d05b1d4d9a1;
 Tue, 07 Nov 2023 16:47:10 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-544455a4b56so5716197a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Nov 2023 07:47:09 -0800 (PST)
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
X-Inumbo-ID: e950ea12-7d84-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699372029; x=1699976829; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a/KrJv8VKc6B+DrXcFDoO4tRmGqqBxGebKKms2s2kcc=;
        b=DUPgL+xZ9HZCTfVAKekc/gtgC1Cy7dNtnizGNqgZ3XbkktUbFP9XbGiqa5WSsH8rSH
         b3j0BkJSFD6nmnYRvpSiSQVzM1X4Y8Or4Hzy/t78UGv8ygEdJVpqCx+er5IQt/mIXm5T
         UZd0P9upMp2v791WHQKyX3lWR4FmKFIPW2teyElfq6LleQXKRxjaB8Bm7fCDUDunVymy
         fPtgbV2jJdqKKGm1kECReo43p2OlKCsmAPB1SjzqjF+8u0XMrIJEH3r/WlYJhKjs27fk
         zBbYscYsQeKJLbON1DzngHFAeQBQ9m9S7SDJFwU9Z8z22ivKq0g01WCACEFswjE3AfE2
         e0gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699372029; x=1699976829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a/KrJv8VKc6B+DrXcFDoO4tRmGqqBxGebKKms2s2kcc=;
        b=ULit/6h4mIdEfEyI7wPgQo40/hTGap6j0lBdLaENDM3nrCgDAnSHjxdOlr0MSvQBDu
         i7CPtVHHf0/LpYWAMv+72OIf7aKySR98y5tb0Sc4V9PRMoyTYIzdvldrGV0Z1g+KvQ2l
         toigNrwOMkGgnwbQh3BzE127Uz0gtWM8oKpXaYgZVSXkebx+HwqYrDqpjl+wawAa6tqC
         TSUJDn7kvVPbBekDl1Er3qyOdQYab2J9yMXhRTPDMKcZPeC5lO5zQbXSa5PWAXunOjPc
         Ze6aIkTy+OJ/FDQHyQof5paULTsgrWjwtWbxkieo9jq8NOMdjovWry2v1IjUYdp7iiQg
         dWhg==
X-Gm-Message-State: AOJu0YwUo2sWJQo85LwTIiPmUVReXlKIMLqVoGXwafRZuJo4J2TMXlBi
	3SVJ+nv/6Cv/5c0qXERHKV6Ek9jlyzIsAp4bj2P0JSZW
X-Google-Smtp-Source: AGHT+IHdDGxQFUrGo/jp0TqLT4WJrYCiq+W67StTvHIn0dYyw6Aagz6Zo+Ha6SvFRAf3e8DxlbVG1VwHkb4gmUg3plI=
X-Received: by 2002:aa7:d156:0:b0:533:c55f:5830 with SMTP id
 r22-20020aa7d156000000b00533c55f5830mr24716258edo.28.1699372029307; Tue, 07
 Nov 2023 07:47:09 -0800 (PST)
MIME-Version: 1.0
References: <20231101093325.30302-1-jgross@suse.com> <20231101093325.30302-16-jgross@suse.com>
In-Reply-To: <20231101093325.30302-16-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 7 Nov 2023 10:46:57 -0500
Message-ID: <CAKf6xpvo288OX0xJdjms9xkfuuaqMh_CdBBtSvFWBVbOr8r-bw@mail.gmail.com>
Subject: Re: [PATCH 15/29] tools/libs/light: add backend type for 9pfs PV devices
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 1, 2023 at 5:51=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> Make the backend type of 9pfs PV devices configurable. The default is
> "qemu" with the related Xenstore backend-side directory being "9pfs".
>
> Add another type "xenlogd" with the related Xenstore backend-side
> directory "xen_9pfs".
>
> As additional security features it is possible to specify:
> - "max-space" for limiting the maximum space consumed on the filesystem
>   in MBs
> - "max-files" for limiting the maximum number of files in the
>   filesystem
> - "max-open-files" for limiting the maximum number of concurrent open
>   files
>
> For convenience "auto-delete" is available to let the backend delete the
> oldest file of the guest in case otherwise "max-space" or "max-files"
> would be violated.
>
> The xenlogd daemon will be started by libxenlight automatically when
> the first "xen_9pfs" device is being created.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

With Xentore paths updated to "libxl/..." as mentioned elsewhere:

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

