Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11029767720
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 22:36:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571571.895753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPUC3-0000LZ-Ly; Fri, 28 Jul 2023 20:36:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571571.895753; Fri, 28 Jul 2023 20:36:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPUC3-0000JF-JB; Fri, 28 Jul 2023 20:36:11 +0000
Received: by outflank-mailman (input) for mailman id 571571;
 Fri, 28 Jul 2023 20:36:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q8mr=DO=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1qPUC1-0000J9-FM
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 20:36:09 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 604d7465-2d86-11ee-8613-37d641c3527e;
 Fri, 28 Jul 2023 22:36:06 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4fe1c285690so3097197e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Jul 2023 13:36:06 -0700 (PDT)
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
X-Inumbo-ID: 604d7465-2d86-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1690576565; x=1691181365;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R1CEhNBkkK7TxjpswD5hbvZQWlFVU5MVakie2pjKRyY=;
        b=TAImuOEUlWnRwo3L7rNBlhHu9n4UEQgbNYFnpXu6RhKh7XUApqub7/hY0FoT3ib4q4
         ja45KNdLjI4gvtpjL6wqzneln2gdPsufmjCQGhBQQ0SVRHb71bQyudSXpOWUdBtab2fT
         Fo2mWYrFRX6pt7FXRWFsdswtmLrrNs1T17Uck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690576565; x=1691181365;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R1CEhNBkkK7TxjpswD5hbvZQWlFVU5MVakie2pjKRyY=;
        b=OS8AZg39asCK1lH4hQFOV5Dxl/VwOvw2jSAgwLUeyJTtNuJOQjHOfGhzL26yCoGGxn
         7OGKUJJtD6eKSByb/1RL+yb9ovekDNrhWwdIFRnJVjzFAkfwVatycyh1+qWNQs+/3uKi
         KiRTUkzXArrBnd7LLP+2+YMmi0sEj2XFBIfMs20F0DlzFAxyNHTzlhR6HFG2NYAhjmqR
         cBi6eaUe39ioG0HBsIJLSeOasSh3PCkkC1ZkVHNyIkWuhDrY6CXWc/NSulaEAffhw7DC
         6d08dtWGvZbL/V99n+bW6apDjjMe316ux6Mr1I3qxswpunviomJBrPj2wIJj9BmOqs3e
         f5Yg==
X-Gm-Message-State: ABy/qLbTSkEXScjRmDd0fkOlhZyFgVdJGzxjY+gOa/Azue5oTKKqNoZA
	QgJ8Qjhcb2MyD+yZWjWh3GEyWehJ+j5FRiUqlSPcmAcVEAzrboo9aoQ=
X-Google-Smtp-Source: APBJJlHwsAWCuXUJiImE7SjyUMbHPDh3kTk8Lgo/6eDH5i2qfyqnDcHts5Y9cTMTPslEh4KlZm1XHprzseYzZqbNaNY=
X-Received: by 2002:a05:6512:52e:b0:4fb:8c52:611 with SMTP id
 o14-20020a056512052e00b004fb8c520611mr2633369lfc.38.1690576565386; Fri, 28
 Jul 2023 13:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230601142742.15489-1-olaf@aepfle.de> <20230601142742.15489-8-olaf@aepfle.de>
In-Reply-To: <20230601142742.15489-8-olaf@aepfle.de>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 28 Jul 2023 21:35:54 +0100
Message-ID: <CA+zSX=ZW+-un+sUCEDA3RKd4vHzCvCjJxmqZPuXNf0UHFDq2BA@mail.gmail.com>
Subject: Re: [PATCH v1 7/7] xenalyze: handle more potential exit reason values
 from vmx.h
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>, 
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Content-Type: multipart/alternative; boundary="000000000000a5540806019207b3"

--000000000000a5540806019207b3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 1, 2023 at 3:28=E2=80=AFPM Olaf Hering <olaf@aepfle.de> wrote:

> Copy and use more constants from vmx.h, to turn numbers into strings.
> Adjust the REASON_MAX value accordingly.
> Remove the size constraint from string array, the compiler will grow it
> as needed.
>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
>

Thanks for doing this.

Everything looks good (including adding the missing strings), except for
the removal of the fixed array size.  Call me paranoid, but if we define it
as REASON_MAX length, then there will never be any way that a value less
than REASON_MAX causes a segfault (and if we assign a value higher than
REASON_MAX, the compiler will complain); whereas if we make it variable, we
leave open the possibility that someone won't update REASON_MAX properly,
resulting in either segfaults (if REASON_MAX is too high) or missing
strings (if REASON_MAX is too low).

 -George

--000000000000a5540806019207b3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 1, 2023 at 3:28=E2=80=AFP=
M Olaf Hering &lt;<a href=3D"mailto:olaf@aepfle.de">olaf@aepfle.de</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Copy and =
use more constants from vmx.h, to turn numbers into strings.<br>
Adjust the REASON_MAX value accordingly.<br>
Remove the size constraint from string array, the compiler will grow it<br>
as needed.<br>
<br>
Signed-off-by: Olaf Hering &lt;<a href=3D"mailto:olaf@aepfle.de" target=3D"=
_blank">olaf@aepfle.de</a>&gt;<br></blockquote><div><br></div><div>Thanks=
=C2=A0for doing=C2=A0this.</div><div><br></div><div>Everything looks good (=
including adding the missing strings), except for the removal of the fixed =
array size.=C2=A0 Call me paranoid, but if we define it as REASON_MAX lengt=
h, then there will never be any way that a value less than REASON_MAX cause=
s a segfault (and if we assign a value higher than REASON_MAX, the compiler=
 will complain); whereas if we make it variable, we leave open the possibil=
ity that someone won&#39;t update REASON_MAX properly, resulting in either =
segfaults (if REASON_MAX is too high) or missing strings (if REASON_MAX is =
too low).</div><div><br></div><div>=C2=A0-George</div><div>=C2=A0</div></di=
v></div>

--000000000000a5540806019207b3--

