Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 889AEAA812C
	for <lists+xen-devel@lfdr.de>; Sat,  3 May 2025 17:00:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.975375.1362889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBEL7-0002rW-Ea; Sat, 03 May 2025 14:59:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 975375.1362889; Sat, 03 May 2025 14:59:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBEL7-0002pE-AD; Sat, 03 May 2025 14:59:41 +0000
Received: by outflank-mailman (input) for mailman id 975375;
 Sat, 03 May 2025 14:59:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9ZY/=XT=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1uBEL5-0002p8-H1
 for xen-devel@lists.xenproject.org; Sat, 03 May 2025 14:59:39 +0000
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [2607:f8b0:4864:20::112a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b873b87-282f-11f0-9eb4-5ba50f476ded;
 Sat, 03 May 2025 16:59:38 +0200 (CEST)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-6fead015247so27501917b3.2
 for <xen-devel@lists.xenproject.org>; Sat, 03 May 2025 07:59:38 -0700 (PDT)
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
X-Inumbo-ID: 3b873b87-282f-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746284377; x=1746889177; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4q+Qc6SlV9gZdCMK5o3Co8yk/mgFhtRau0S+hN2Hx6Y=;
        b=XjPuVKmiBkrOG8Upg65+JId9eeGU8EfJ+yh8Rbkro4EDBiqBDU5j1TVqIVbukTw22U
         +tMN+ZoCbgpLvEhTUmLjjJjv9jJ06t+ZYBXf9iy1POGAUzkyrFJCoewncb2clrGw/+te
         73X70cUT5PiGrsjY5T5J0Uc/9EZBajW5f3uBqmLTL4rOUS/Qf3iuoQqkbfZmUIrUGvid
         JvxB37LtpOqh74l7p6a/DGPotN4HXnHOvBB9/+521UfIpDPOaeniTHktAbnAsdgE/IKB
         M+h434eeEXtcXY1GySA8vnoUkDxQJKsk3H877KBR7fw3UpRhBXe8zt+u2MfcH957bdji
         I7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746284377; x=1746889177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4q+Qc6SlV9gZdCMK5o3Co8yk/mgFhtRau0S+hN2Hx6Y=;
        b=vPb/XAy6sGkfRm7rfu0K4gM7DcjXkznihEUaNUH6L0l6iCDmX5inCBbW0Nswz0BQwL
         Z6C4utUeNJlpK5VOQzudW9MFKvX8dTqhDS7USUz1gNMSNmLHhbHZrq6uFZjuXb9ULXWc
         OaY+iWH36i3Y0F/gvb0ku9lCHz7PZPmLhNfDlVZMfP3+NH9wnqCGo0ExUffo9MtDbbmW
         h4pNBJBKUBQ68NY4zHMSXuDQcfzLANx4Xecf+TZ6mjCFrSQxf53ztT30VjPt/KWnqYVW
         wlNTnyjAyjncG66GelLB/q7iXqre2J+HpsUdutZhex9HFZmVVeK3/qjzDu+QoPyDjYFm
         fChQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQyd76KzhkExALOSOuFOoYog25lqADxOYVA4LPfQVdoQUvjSZSSKU3El0gPcmRLpqnzlHzQEYDNXU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVyLeGQ39ojurkwRtLS5ZOcp4QOnhWvKMiGTdYlAYyCIJwsUPw
	E6XuTaaN/YrVJZtQea55uGXrbI5w2HqS4groXabVZyU5W0TRDF623EZRQ5uQwv1aVOVNvSfpv2E
	cYn1+DrcYTpQW3pszacJUHT98sX0L6g==
X-Gm-Gg: ASbGncv5nqwOKG54k61qu6jcd8+JncO62yq+Ry6rVAY1yzVJYy70L95zuqkeFRWRQ6j
	QneRX8A87yP7Z3yntOB3dZrhMD3680yndikGk1xct7yw3E9EBns9h/OG5OnaQmFrhNMd78T2hcb
	vBVuTPKFFiecWADnVgvRc/nVRFFW+Qjg==
X-Google-Smtp-Source: AGHT+IEPWQ/FsgFWI8Ah2eiyVKUKGdDxNTbLeRyGv4I/o89MCiPd/pJQvrXZnmFmxE9bqLRhGjREtFW2SF9Y8o49ls8=
X-Received: by 2002:a05:6902:1ac8:b0:e72:d88e:7af4 with SMTP id
 3f1490d57ef6-e757d55f966mr1559769276.43.1746284377078; Sat, 03 May 2025
 07:59:37 -0700 (PDT)
MIME-Version: 1.0
References: <ZO0WrR5J0xuwDIxW@mail-itl> <ZTUuRj6e5x5xFVqb@mail-itl>
 <ZgGjf3hpLHXXtb8z@mail-itl> <0f8c0e27-e60d-4e64-bc8a-6cb407c67ab2@xen.org>
 <ZlpTwbmDjNLkCNgH@mail-itl> <aAjgGKRAW95BnTiK@mail-itl> <CAKf6xpu7=2O96XK88WL02c-4po3qX-4P4i=2JbD2=o2JcM+_EQ@mail.gmail.com>
 <aBQLT2g4XQfK2dwh@mail-itl>
In-Reply-To: <aBQLT2g4XQfK2dwh@mail-itl>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Sat, 3 May 2025 10:59:24 -0400
X-Gm-Features: ATxdqUHeeIXirakMqjaldYjlbanK1MA3FOHoMkQ_OTgzuuF6Iwq0YvdcmjlUlRI
Message-ID: <CAKf6xpu-wVnQ7+AM3o+5oXdC8wj+_xZBJva4seyPsyktb3JvFg@mail.gmail.com>
Subject: Re: NULL pointer dereference in xenbus_thread->...
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Julien Grall <julien@xen.org>, xen-devel <xen-devel@lists.xenproject.org>, 
	Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 8:01=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:

> > I'm curious what process_msg+0x18e/0x2f0 is.  process_writes() has a
> > direct call to wake_up(), but process_msg() calling req->cb(req) may
> > be xs_wake_up() which is a thin wrapper over wake_up().
>
> So, it's req->cb(req).

Thanks for confirming.

Regards,
Jason

