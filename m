Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C357FB1B5
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 07:00:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642695.1002400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7r8N-0006JG-Bq; Tue, 28 Nov 2023 05:59:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642695.1002400; Tue, 28 Nov 2023 05:59:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7r8N-0006H9-91; Tue, 28 Nov 2023 05:59:47 +0000
Received: by outflank-mailman (input) for mailman id 642695;
 Tue, 28 Nov 2023 01:37:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2PfH=HJ=gmail.com=emelyvollmer@srs-se1.protection.inumbo.net>)
 id 1r7n2q-0008Bz-Fy
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 01:37:48 +0000
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [2607:f8b0:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb90b01b-8d8e-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 02:37:47 +0100 (CET)
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-6d30d9f4549so3084567a34.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 17:37:47 -0800 (PST)
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
X-Inumbo-ID: bb90b01b-8d8e-11ee-98e3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701135466; x=1701740266; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Jy/oTCykTaM00e347CNwkHBaLS2CcP30AyMFVm4vGQw=;
        b=InSl1ON5f3e/8hmVKKOXx9kaJy0fgY2JlS06URJdZD2pOpamGMU6kw10/fIX0ETU6m
         dVIDay8Q8VvsFIwZtu9o9MvS9DEvUEhyqz+RIHpbwvdf01zqeoScACbNXIrAPQPQuFHh
         FDVakPRmYH3XFbzSbkIrcyugRgsM/fMSVDmKAKvS59Rgomrct5JYrLGq6s4NKyV72C2M
         t7shmzMlf4BC63cQpFP9HvlDjPkU3Zl2qlmKLTj5LgjDpRhuED2J2Opg7GMURxi+41pW
         whaTF9j94pO1v1qNUYotQDcmwilRS974MZ0YrvSoqm1QIqEv66BVAmc/fur1/Z3tKaeE
         xPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701135466; x=1701740266;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jy/oTCykTaM00e347CNwkHBaLS2CcP30AyMFVm4vGQw=;
        b=ao0TYGyz14XM1kB+2cNivb5GttXWGQxl1VMveU3fSlKpKZxmgr16kg1mZKNBZ7lKDt
         2KNCa5bS7+0vs9mXE9m4aJHNhsx99v6iLC/UH3ReQNtGQmcQR+cf1x0enICIiwjazuZ2
         OW98Qr1xAYOlvjE8Zs522JnjooonQekN+xubpmPWKHU9hJ9QCSoeG5xt02bX57N7SGKQ
         FC64tLm2/9fqDxceyY7AkDMjUy7bX+O/rFY/wCtAPOZV/5OZba/9yx/wNyVlCnwa5cCr
         ILciXKDy6DMiKWvXV1iTQXPBLAtgQ2dn94ZoUt6uwZ5KRh7xy+3e6K6JZPvaFB1YswcP
         1M9w==
X-Gm-Message-State: AOJu0Yw2+v7sawiizXj9M+TmIaF8Wd4g372Fd345MAn77529CFhEcqkx
	rbBccPxw+th/eyuKfyCluzPDx6upk+WiCvfj84JggHki
X-Google-Smtp-Source: AGHT+IEdvahee5qc9B66WkqTMMcEicKk+Fr+/x+6R+emAg1zM+NNzXz9qxS8FUlODbHrfA3PGtMd2eDYoKHZvvjHKOc=
X-Received: by 2002:a05:6870:7021:b0:1f0:811a:324d with SMTP id
 u33-20020a056870702100b001f0811a324dmr15690215oae.51.1701135465895; Mon, 27
 Nov 2023 17:37:45 -0800 (PST)
MIME-Version: 1.0
From: Emely Vollmer <emelyvollmer@gmail.com>
Date: Tue, 28 Nov 2023 02:37:34 +0100
Message-ID: <CAEe9NNQvj=2F_=teO7UvN7doA3gJMgJU_oHct6txTyTFTTCfEg@mail.gmail.com>
Subject: Inquiry Regarding Usage of Xen Project Images for Private T-shirt Printing
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000028e56e060b2c7743"

--00000000000028e56e060b2c7743
Content-Type: text/plain; charset="UTF-8"

Dear Xen Project Team,

I trust this message finds you well. My name is Emely. I am an avid
supporter and admirer of the Xen Project, and I am writing to seek your
guidance and permission regarding the use of your images for personal,
non-commercial purposes.

I have recently been exploring ways to express my enthusiasm for the Xen
Project within the confines of my private interests. To this end, I am
interested in creating a custom t-shirt featuring the Xen Project images.
These shirts would be exclusively for personal use and would not be
utilized for any commercial purposes or intentions of selling.

In my research, I came across your usage guidelines, which state, "You can
use the images and material without attribution when used in a context that
refers to the Xen Project [...] Where the context is not clear, attribution
must be made to XenProject.org, and images used on merchandise, such as a
sticker, must contain the Xen Project logo." I appreciate the clarity you
provide on the acceptable use of Xen Project materials.

However, I find myself in a situation where I am unsure whether the
proposed use falls within the defined boundaries. Specifically, I would
like to confirm whether it is permissible to print Xen Project images on
private-use t-shirts without the intent to sell or engage in any commercial
activities.

I understand the importance of respecting intellectual property rights, and
I want to ensure that I adhere to your guidelines and policies. If there
are any additional conditions or steps I should follow to obtain formal
approval for this specific use, please do let me know, and I will be more
than happy to comply.

I appreciate your time and consideration in addressing this matter. Thank
you for your commitment to fostering a collaborative and supportive
community around the Xen Project.

Best regards,

Emely V.

--00000000000028e56e060b2c7743
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><span style=3D"font-size:17px">Dear Xen Project Team,</sp=
an>
<br><br><span style=3D"font-size:17px">I trust this message finds you well.=
 My name is Emely. I am an avid supporter and admirer of the Xen Project, a=
nd I am writing to seek your guidance and permission regarding the use of y=
our images for personal, non-commercial purposes.</span>
<br><br><span style=3D"font-size:17px">I have recently been exploring ways =
to express my enthusiasm for the Xen Project within the confines of my priv=
ate interests. To this end, I am interested in creating a custom t-shirt fe=
aturing the Xen Project images. These shirts would be exclusively for perso=
nal use and would not be utilized for any commercial purposes or intentions=
 of selling.</span>
<br><br><span style=3D"font-size:17px">In my research, I came across your u=
sage guidelines, which state, &quot;You can use the images and material wit=
hout attribution when used in a context that refers to the Xen Project [...=
] Where the context is not clear, attribution must be made to XenProject.or=
g, and images used on merchandise, such as a sticker, must contain the Xen =
Project logo.&quot; I appreciate the clarity you provide on the acceptable =
use of Xen Project materials.</span>
<br><br><span style=3D"font-size:17px">However, I find myself in a situatio=
n where I am unsure whether the proposed use falls within the defined bound=
aries. Specifically, I would like to confirm whether it is permissible to p=
rint Xen Project images on private-use t-shirts without the intent to sell =
or engage in any commercial activities.</span>
<br><br><span style=3D"font-size:17px">I understand the importance of respe=
cting intellectual property rights, and I want to ensure that I adhere to y=
our guidelines and policies. If there are any additional conditions or step=
s I should follow to obtain formal approval for this specific use, please d=
o let me know, and I will be more than happy to comply.</span>
<br><br><span style=3D"font-size:17px">I appreciate your time and considera=
tion in addressing this matter. Thank you for your commitment to fostering =
a collaborative and supportive community around the Xen Project.</span>
<br><br><span style=3D"font-size:17px">Best regards,</span>
<br><br><span style=3D"font-size:17px">Emely V.</span></div>

--00000000000028e56e060b2c7743--

