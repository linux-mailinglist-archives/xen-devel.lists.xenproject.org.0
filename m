Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D53B7EA1FC
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 18:37:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631878.985645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2arn-0005v3-6K; Mon, 13 Nov 2023 17:36:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631878.985645; Mon, 13 Nov 2023 17:36:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2arn-0005qt-2t; Mon, 13 Nov 2023 17:36:55 +0000
Received: by outflank-mailman (input) for mailman id 631878;
 Mon, 13 Nov 2023 17:36:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9tbd=G2=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1r2arm-000525-D5
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 17:36:54 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c1a4d1b-824b-11ee-98da-6d05b1d4d9a1;
 Mon, 13 Nov 2023 18:36:53 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-53de8fc1ad8so7181066a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 13 Nov 2023 09:36:53 -0800 (PST)
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
X-Inumbo-ID: 3c1a4d1b-824b-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699897013; x=1700501813; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3dIySdVH70V6nJ6eVXUpOrVhksMY0i9p9FFRw/x4Pl4=;
        b=HtObLZuvY4dVWaXchxwsUgC2Figfzgz7EzTOBRFvtBpIzK8Uyk8QooN6L+Eat3jU9Y
         OH1eB0FgAcUYTZusLA3XVMaj6uDzjsONiW/M3T3yjTTZyHtwLQA4J991cqpWzQQJDQah
         bohAQ/xUjMWpBAYeWQt4LtoMJfVWS1IpEuu1g+NHLxNpQwPA6T9fliVzDBd8cgKL5dWv
         hFF7LjvpKpp4ItlNuqAkQzwxAz1bpLXodxALexpw/EK1o/fzWlbXrSnev5aJJRg999qD
         dcpE/GyNzP6GD0mMiVEaGitVwqXqFcVQwNZYtgIKT8/ryE9uz0FdCmhsx/uXoyISjIJC
         W5tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699897013; x=1700501813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3dIySdVH70V6nJ6eVXUpOrVhksMY0i9p9FFRw/x4Pl4=;
        b=WFyw1U80727w3Ltj9h4Ry57EGrKasgz93UT62MaXSHrRbtAPC28O7O9sZnw8dVHTnp
         u5UBrU2sy3Cn/DbH8Jbsq0bmZjE/pdw4FJTGiD06Qd8AaORxun+CpvvrQjlt0Ah8jqDb
         jfR5ABGrKcBLQB39MH6T03ZnPz9U4UVYGBQu1j4gyuqUuq7hBs2CmoyxOT4r3sI4kIW3
         i/HUF+rB1/epmnCau8e8buQ2F7HabKr4PIH2NpnrKqKvx6SnSPA3u1gc/MFy2z/UYQZL
         jiHSoZisdfwStFEGnM0zTtOmwA9qvU7Y8WA4wa583vm38c0luEVqDI8hqssdb3Us09a+
         YeeA==
X-Gm-Message-State: AOJu0Yy3JUbfsVr+trE61ULwDOYl180Z32Bh/Q3gZIqtBw673dGfdxLV
	YaQ3k7CGHpt89i8fsmJfdgn446EbOft/0WYRx4FrkB8l
X-Google-Smtp-Source: AGHT+IHfXSWO8TrQ7jMKZM8yl1xKT/8xtcnvyhy4kTY/gwYTUH6HgSls8z/rp5dQSd8zXe5jChgXKtIECuXxDkzT1CY=
X-Received: by 2002:a05:6402:510:b0:543:7256:6370 with SMTP id
 m16-20020a056402051000b0054372566370mr5224417edv.23.1699897013213; Mon, 13
 Nov 2023 09:36:53 -0800 (PST)
MIME-Version: 1.0
References: <20231110160804.29021-1-jgross@suse.com> <20231110160804.29021-3-jgross@suse.com>
In-Reply-To: <20231110160804.29021-3-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 13 Nov 2023 12:36:41 -0500
Message-ID: <CAKf6xpvOOU04rsuHq=39vDF=i+HQ67ZdejrVxJUju4ud87pT5w@mail.gmail.com>
Subject: Re: [PATCH v2 02/29] tools: add a new xen logging daemon
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 10, 2023 at 11:08=E2=80=AFAM Juergen Gross <jgross@suse.com> wr=
ote:
>
> Add "xen-9pfsd", a new logging daemon meant to support infrastructure
> domains (e.g. xenstore-stubdom) to access files in dom0.
>
> For now only add the code needed for starting the daemon and
> registering it with Xenstore via a new "libxl/xen-9pfs/state" node by
> writing the "running" state to it.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---

> --- /dev/null
> +++ b/tools/xen-9pfsd/xen-9pfsd.c
> @@ -0,0 +1,145 @@

> + * The backend device string is "xen_9pfs", the tag used for mounting th=
e
> + * 9pfs device is "Xen".

'_' is much less common in xenstore node names than '-'.  Is there a
particular reason you chose '_'?  I generally prefer '-', but IIRC the
libxl idl can't handle '-'.  Did you hit that?

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

