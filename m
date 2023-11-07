Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4C77E4356
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 16:21:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628879.980786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0NtD-0003jT-Iv; Tue, 07 Nov 2023 15:21:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628879.980786; Tue, 07 Nov 2023 15:21:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0NtD-0003ga-G4; Tue, 07 Nov 2023 15:21:15 +0000
Received: by outflank-mailman (input) for mailman id 628879;
 Tue, 07 Nov 2023 15:21:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zQVP=GU=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1r0NtC-0003gS-D4
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 15:21:14 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48fdea95-7d81-11ee-9b0e-b553b5be7939;
 Tue, 07 Nov 2023 16:21:12 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-53df747cfe5so10001504a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 07 Nov 2023 07:21:12 -0800 (PST)
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
X-Inumbo-ID: 48fdea95-7d81-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699370472; x=1699975272; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3OsLQXgxyFnLft3eanu6Eq7M/x1KdPiNT5ZvR3pqvK4=;
        b=HcL/FlvylpsEoXCJcvy2prsEdIslvr70MWj7JYQTyxg78/PVw4FxhCJZEPOoP5l09y
         uIZR5nCsUd5i9Gn2tBHygW9Ku+2n8x7IzXfQYTDIm3lUZ1jOXk3NjJTXg8mYQzne6sfd
         gBpwDavdc4NRjn71J9tvA+8XgqYDn80WbKtTmQbAfkIoGCWFPGPhrvVs1ByYeS2gRYGC
         C89MKvw4jzYPogf1bPllwAssBrbpn4cPJjvdV7khoc93S+Ity4PeMVbS+OpbdwFN/IeH
         xrAlUXzpLY1TUyMkHAkVhp7BopERpVl/HbHi6jqtrqu2gH0NkVeG7Cx5aIdzF1xV86Cq
         t7fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699370472; x=1699975272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3OsLQXgxyFnLft3eanu6Eq7M/x1KdPiNT5ZvR3pqvK4=;
        b=r/zW3pPxiAzFNOqvpcDgBpLDc7IaV3x0cn/jyc1UzmUokf6kJns3tlcf9jDlNBUefN
         4sM5OYcDbAcGMUD58pshZ4hgyhe1WzBhL/y3cVPtFRCCF+9yzuYm28VOAsBWPjHeIe7Z
         Ufng7Tlf+HppYV60HuRDXBQ8gozN+1gvJ2iuq6lZ7PxuahexbRjid3DIZC6dSpc2TGxv
         MhSetWnuuBxObwCDrG44T+MFTPg1domvCF177uDXQm7sc6GFNpzPsG51QaHPWsc5+8pd
         ZZ0DAPf6A1EK5O/4ZHGBdV7P4rB92wPAfhPs+czGiLIcDToBY4bIOtBGAKjC7k0QSi2z
         XoEA==
X-Gm-Message-State: AOJu0Yx5dUo6FXxlUBZAha8GLmoJlh3tLOmNon1pmcFZBjFGhuhjCkaA
	lzMf4u0wm03izTPTDQMCEw+W8W3Y+cREnLPMdpE=
X-Google-Smtp-Source: AGHT+IH2E5v1VtRHzjqsWmOypqYBCS103Wol/RfhYnEbc5v/xoq+Vo3QqK+RvtuWxBVn55ZLJPmcIRZ87ddSUe2d5lU=
X-Received: by 2002:a50:cddd:0:b0:53e:30dc:ef59 with SMTP id
 h29-20020a50cddd000000b0053e30dcef59mr21603118edj.10.1699370471849; Tue, 07
 Nov 2023 07:21:11 -0800 (PST)
MIME-Version: 1.0
References: <20231101093325.30302-1-jgross@suse.com> <20231101093325.30302-13-jgross@suse.com>
 <CAKf6xpt43A6KAsKT_J0CiCnFme2f=OR3tqLgAGWrJE7hhxnHPw@mail.gmail.com>
 <e931f9bd-cbeb-43c3-98a6-7b3dff3af8d3@suse.com> <CAKf6xpsMBkeg4bZBGnur15C5+h3FPYZv9EGvc2xwPj_2qvVKyQ@mail.gmail.com>
In-Reply-To: <CAKf6xpsMBkeg4bZBGnur15C5+h3FPYZv9EGvc2xwPj_2qvVKyQ@mail.gmail.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 7 Nov 2023 10:20:59 -0500
Message-ID: <CAKf6xpvjcR-PwTvGv8tT1rA+PdyUTx-Hv1F82pLEf3WOyAuS6g@mail.gmail.com>
Subject: Re: [PATCH 12/29] tools/xenlogd: add 9pfs stat request support
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 7, 2023 at 9:48=E2=80=AFAM Jason Andryuk <jandryuk@gmail.com> w=
rote:
>
> On Tue, Nov 7, 2023 at 9:42=E2=80=AFAM Juergen Gross <jgross@suse.com> wr=
ote:
> >
> > On 07.11.23 15:04, Jason Andryuk wrote:
> > > On Wed, Nov 1, 2023 at 5:34=E2=80=AFAM Juergen Gross <jgross@suse.com=
> wrote:
> > >>
> > >> Add the stat request of the 9pfs protocol.
> > >>
> > >> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

