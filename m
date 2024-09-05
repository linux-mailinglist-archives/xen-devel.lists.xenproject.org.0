Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9033896E38C
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 21:54:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791350.1201229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smIY1-0006Vq-Cp; Thu, 05 Sep 2024 19:53:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791350.1201229; Thu, 05 Sep 2024 19:53:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smIY1-0006Ta-9t; Thu, 05 Sep 2024 19:53:41 +0000
Received: by outflank-mailman (input) for mailman id 791350;
 Thu, 05 Sep 2024 19:53:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v7hT=QD=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1smIXz-00065Z-O9
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2024 19:53:39 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ab14b5e-6bc0-11ef-99a1-01e77a169b0f;
 Thu, 05 Sep 2024 21:53:37 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5356aa9a0afso2069747e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2024 12:53:37 -0700 (PDT)
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
X-Inumbo-ID: 8ab14b5e-6bc0-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725566017; x=1726170817; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EXswSmnBjPrXQRFfRsfaC2LJ4aGPrwQXhfPxYuT8+zs=;
        b=ZwhNQk5LXz1iKqW670r9spw3AZurNQ/Xxy8dL79Q93Y/jq5Lao3r83gzrUkxsGKNIi
         cLp0G5L9zBW63H5h54zKpD/sWJG1VhS/FRS/GnOFLr19zbo8S6REkZK0CyxBZNe2R+p2
         U46OFCZUj3Z4svNJ0G9+Do4ob7OwpNE6/OqrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725566017; x=1726170817;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EXswSmnBjPrXQRFfRsfaC2LJ4aGPrwQXhfPxYuT8+zs=;
        b=cObnHk8KhZgI120qdH6kuQNqAZbDPMmFR/k4U6OMeXY6xYXzI4MFQrb+OeQ8FDcohQ
         JGF7+5gZe+2T65ahEt/D76BctRSJfuWe5P6TMCCJoeZBCmg8KifHhJbRvEvZt2KFGLqG
         /VPsHKrSYPW62FoZ4UCy8u4Pg83A5jR0SHE3k9W8RignYDtEIWEfQUoz3Yll6Kd62pgm
         EUvGgXA3AOPbt0vGZZBWzHJmU+teFCWP0HXU/umM71iZL5vMJj7zSDqJ9F5IbCsW0vZ4
         P3NpAjnNWUYxNMAcECTOaaNjTVACyPWkhy9IVh6Uew5MasYcX5N0POQyIeE6Z+rcCCc0
         wY6g==
X-Gm-Message-State: AOJu0YwMHMs5Wlhr5drnaM3JUSleWCJ0s8msuVR/9NF/naLOGX+Ziu0i
	UZ5rt1D5c/Qf7GUhQ0V4d2HwXdghgUGbNSj1uqrqenUuNeLMBNLz5SNReR8fBi3GOnPB2ZzY5gW
	uYCV0O5+NJKaRjO2ZS/loJEwqUiNqVysx/iVyLEg0c16UBgaLbT8=
X-Google-Smtp-Source: AGHT+IG6ObVQxpZ02KLnFx8qz4OFQhfJvSDVfDg2ugC3+DHUpWPOe5Z/1u54QKW4PI7SADgijlK0YzXMEnaDN+ngcUU=
X-Received: by 2002:a05:6512:104a:b0:533:4591:fc03 with SMTP id
 2adb3069b0e04-536587fbcbdmr50963e87.46.1725566015836; Thu, 05 Sep 2024
 12:53:35 -0700 (PDT)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Thu, 5 Sep 2024 20:52:00 +0100
Message-ID: <CAO-mL=yYqtd4vaW5OPvRs4Uca-eAsjcrWKpnMScN5CzhJvJLJQ@mail.gmail.com>
Subject: Community Call Recording - September 2024
To: xen-devel <xen-devel@lists.xenproject.org>, xen-users@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000006951ad062164a589"

--0000000000006951ad062164a589
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

The community call recording has been uploaded.

YouTube link:
https://youtu.be/bVnZtQWzLtI

Cryptpad file:
https://cryptpad.fr/pad/#/2/pad/view/iPdSDDD4+An7kt0UT1V32t9f-rfyEQ4wJWqYj5cZCmg/


Many thanks,
Kelly Choi

Community Manager
Xen Project

--0000000000006951ad062164a589
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi everyone,</div><div><br></div><div>The community c=
all recording has been uploaded.</div><div><br></div><div>YouTube link:</di=
v><div><a href=3D"https://youtu.be/bVnZtQWzLtI">https://youtu.be/bVnZtQWzLt=
I</a>=C2=A0<br></div><div><br></div>Cryptpad file:<div><a href=3D"https://c=
ryptpad.fr/pad/#/2/pad/view/iPdSDDD4+An7kt0UT1V32t9f-rfyEQ4wJWqYj5cZCmg/">h=
ttps://cryptpad.fr/pad/#/2/pad/view/iPdSDDD4+An7kt0UT1V32t9f-rfyEQ4wJWqYj5c=
ZCmg/</a>=C2=A0</div><div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"=
gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>M=
any thanks,</div><div>Kelly Choi</div><div><br></div><div><div style=3D"col=
or:rgb(136,136,136)">Community Manager</div><div style=3D"color:rgb(136,136=
,136)">Xen Project=C2=A0<br></div></div></div></div></div></div></div>

--0000000000006951ad062164a589--

