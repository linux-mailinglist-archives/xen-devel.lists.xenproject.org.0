Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E972E9182BF
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 15:40:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748926.1156895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMSsH-0001vf-Vu; Wed, 26 Jun 2024 13:39:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748926.1156895; Wed, 26 Jun 2024 13:39:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMSsH-0001t0-T2; Wed, 26 Jun 2024 13:39:49 +0000
Received: by outflank-mailman (input) for mailman id 748926;
 Wed, 26 Jun 2024 13:39:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ak5a=N4=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1sMSsG-0001bd-68
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 13:39:48 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d33b630-33c1-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 15:39:46 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-57d251b5fccso351190a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 06:39:46 -0700 (PDT)
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
X-Inumbo-ID: 8d33b630-33c1-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1719409185; x=1720013985; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+R6YONPwlHpoRRYsr6+mBW727pvDLC/LMVbe3FPlL40=;
        b=FKA1Z/Uc9+YgRCV41c65DjAORkr9fL8fWAnkm0eaGDw1dx1pBsVTLKbsimhp+8rBMO
         QlLsFMavIApXij6zXhMLa+SQIyV12GtwDEsnF+Uhiord+XXq73tIDnbMjnCEeoGQwE6s
         vB4Saa/9ke2c/30VD3YZBSB6wr1qn9V8Fmc20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719409185; x=1720013985;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+R6YONPwlHpoRRYsr6+mBW727pvDLC/LMVbe3FPlL40=;
        b=eVtFAT0k3TkoANxbLi/o6XS70NjM7XEjo7UoVy914svgvbpHln+Aoe64JfTutTPIyV
         csbkO0fRRkUWiyTLB7nVRUxpEBt5oDIIdLO7tp9BjPr+Ki14EnRwKTRrTuOjtliEL93M
         asREcMvRgKNDFt3S008LvOD+KMkgjph5JBt56CTIqNe++Rxc+nnYvtWCRKAL7ViRQ8S8
         BLofV7wDJ3QCcmsxqRPuaSDXFJ/CUT+w+lB4qgWfjoMAG5lkvkdmVrT92UToXyMbcbfs
         L2Ey07/3PSoiPv13xuMODdbDG14DKizpW7Ia63b6ZBtaEPvxT4u3adZaud6dpiRFDtYa
         06uA==
X-Gm-Message-State: AOJu0YwMzqhiMqoeDsOrBvpM+4IFb1BrZir1YxpbBn0lppmDgZIqWAXb
	949o/4QXxGIWjF6SXwvYqbvV1SqjoJcr1MV9nw1FBdzrXQ6iXLcmOI4oxgFKQT9Z/pZ+Tom5DqD
	MLxeK1JSJrTJ8WvLwHNyE7FZUOYOl/H/njig1h74l43hNG5KWyF8=
X-Google-Smtp-Source: AGHT+IFEK+k5gxufcXa5MITJDPr+ovOxlDx6IOPGKH0gzDEZjUZvs/ObB5XRX+NIqr8FTYNSWFGJrGnbNBb20sOgUDk=
X-Received: by 2002:a50:cd59:0:b0:57c:6a1f:11d5 with SMTP id
 4fb4d7f45d1cf-57d4bd63249mr7649898a12.15.1719409185337; Wed, 26 Jun 2024
 06:39:45 -0700 (PDT)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Wed, 26 Jun 2024 14:39:09 +0100
Message-ID: <CAO-mL=xjBTpGX9kfmnbBKmRHgbB8xvJXfNL1M2ArBZ9p4_0Vmg@mail.gmail.com>
Subject: [ANNOUNCE] Postpone community call to 11th July 2024
To: xen-devel <xen-devel@lists.xenproject.org>, xen-users@lists.xenproject.org, 
	xen-announce@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000b74cc1061bcb2598"

--000000000000b74cc1061bcb2598
Content-Type: text/plain; charset="UTF-8"

Hi all,

Our next community call is on 4th July 2024. As this is a national holiday
in the US, I propose we move our call to the same time on *11th July 2024*
if there are no objections.

Details and agenda links will be sent that week.

Many thanks,
Kelly Choi

Community Manager
Xen Project

--000000000000b74cc1061bcb2598
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,=C2=A0<div><br></div><div>Our next community call i=
s on 4th July 2024. As this is a national holiday in the US, I propose we m=
ove our call to the same time on=C2=A0<u><b>11th July 2024</b></u> if there=
 are no objections.</div><div><br></div><div>Details and agenda links will=
=C2=A0be sent that week.=C2=A0</div><div><br></div><div><div><div dir=3D"lt=
r" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D=
"ltr"><div>Many thanks,</div><div>Kelly Choi</div><div><br></div><div><div =
style=3D"color:rgb(136,136,136)">Community Manager</div><div style=3D"color=
:rgb(136,136,136)">Xen Project=C2=A0<br></div></div></div></div></div></div=
></div>

--000000000000b74cc1061bcb2598--

