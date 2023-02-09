Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EED690B3E
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 15:03:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492491.762053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ7Wd-0005Ky-Bc; Thu, 09 Feb 2023 14:03:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492491.762053; Thu, 09 Feb 2023 14:03:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ7Wd-0005IY-7o; Thu, 09 Feb 2023 14:03:47 +0000
Received: by outflank-mailman (input) for mailman id 492491;
 Thu, 09 Feb 2023 14:03:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FIAB=6F=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1pQ7Wc-0004OI-5x
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 14:03:46 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 915a1d69-a882-11ed-933c-83870f6b2ba8;
 Thu, 09 Feb 2023 15:03:45 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id h17so2159596ljq.4
 for <xen-devel@lists.xenproject.org>; Thu, 09 Feb 2023 06:03:45 -0800 (PST)
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
X-Inumbo-ID: 915a1d69-a882-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=orY8+KMLnKfslQJnE14XiaXMjZAa+hkRKQd5u/p26Dw=;
        b=Bv9ixm0D9TOn1V4hEZzfD0PkUtaUYuvZJqgMlOdgdZTmR32kjpGDQ/tdXKI6cb/3li
         lPWsJqs1T7iiQUPSz3FcwMAmQaRM0zwMQpoOwMAjkAp7w2YoWgG5qk6otVsZwgvBZ+vj
         vezXNrP98bfDsxdiB+/EKeP0Yy/m7EYjs9zB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=orY8+KMLnKfslQJnE14XiaXMjZAa+hkRKQd5u/p26Dw=;
        b=FFY1c6JU+2KF67HgAPJcQHnQuyFBs5w92crFTRPs51LsgOXvbXOMLuix5W2vUc+q4K
         w82D5r8n0BhfrZni2/n3b6jfhQIHfZ/aWJZ0o/ckjJP/M2HO3J5asE+Hmmaw3mhyCCL7
         24JmYbxcjrpqqwixyxvqGwpJKK3m8LUe2lJHovbfbNtUQQ63GmgVCQMkFqihlIsEpaan
         wOopam8Imi6xgnLgJFZjTXWJHdjBGmP1zfd2AMUoJs52vAHj7FPYtrgEwPLx/Fwv8AAN
         jMmSzEGu7QB/VsBk1i0D2hyrjOij+9WQloxl+oc/+caskyoUBHFytYngE/DASsnAlTFZ
         7zxQ==
X-Gm-Message-State: AO0yUKVeuaKbXWSr2CwY/4wLdovaXtb3PtHwReS5sawaB004jog6wuCS
	dHk6aXn2I4wPjUidNwu10XbI2FhrN0lYroW1mh5BSQ==
X-Google-Smtp-Source: AK7set/OosX6C8dnwrpyM0kcbx1rnR7RWdXl6ofEbU/wXvRpUF2wgMmJo6E0pErqU18oW+w/F3YetvPU6ipEJHaJCrY=
X-Received: by 2002:a2e:b539:0:b0:290:5823:cde1 with SMTP id
 z25-20020a2eb539000000b002905823cde1mr1849073ljm.122.1675951425116; Thu, 09
 Feb 2023 06:03:45 -0800 (PST)
MIME-Version: 1.0
References: <cover.1675889601.git.demi@invisiblethingslab.com> <8a3d0ce9747e486e91ad5b47777c80293e0fd168.1675889602.git.demi@invisiblethingslab.com>
In-Reply-To: <8a3d0ce9747e486e91ad5b47777c80293e0fd168.1675889602.git.demi@invisiblethingslab.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Thu, 9 Feb 2023 14:03:34 +0000
Message-ID: <CA+zSX=Yu+wV8mqj1n5=yFZxDxLwB5cpaZ3oG62DZu_Z2ebPxdQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] Automation and CI: Replace git:// and http:// with https://
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Doug Goldstein <cardoe@cardoe.com>
Content-Type: multipart/alternative; boundary="0000000000005af77505f444d907"

--0000000000005af77505f444d907
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 8, 2023 at 8:59 PM Demi Marie Obenour <
demi@invisiblethingslab.com> wrote:

> Obtaining code over an insecure transport is a terrible idea for
> blatently obvious reasons.  Even for non-executable data, insecure
> transports are considered deprecated.
>
> This patch enforces the use of secure transports in automation and CI.
>
> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
>

Same question here -- have you verified somehow that the new URLs work?

 -George

>
>

--0000000000005af77505f444d907
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 8, 2023 at 8:59 PM Demi M=
arie Obenour &lt;<a href=3D"mailto:demi@invisiblethingslab.com">demi@invisi=
blethingslab.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Obtaining code over an insecure transport is a terrible ide=
a for<br>
blatently obvious reasons.=C2=A0 Even for non-executable data, insecure<br>
transports are considered deprecated.<br>
<br>
This patch enforces the use of secure transports in automation and CI.<br>
<br>
Signed-off-by: Demi Marie Obenour &lt;<a href=3D"mailto:demi@invisiblething=
slab.com" target=3D"_blank">demi@invisiblethingslab.com</a>&gt;<br></blockq=
uote><div><br></div><div>Same question here -- have you verified somehow th=
at the new URLs work?</div><div><br></div><div>=C2=A0-George</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><br>
</blockquote></div></div>

--0000000000005af77505f444d907--

