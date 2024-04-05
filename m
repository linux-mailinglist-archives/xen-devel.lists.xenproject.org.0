Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C66899D3F
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 14:42:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701250.1095574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsitb-0008W7-DS; Fri, 05 Apr 2024 12:42:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701250.1095574; Fri, 05 Apr 2024 12:42:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsitb-0008U0-9t; Fri, 05 Apr 2024 12:42:15 +0000
Received: by outflank-mailman (input) for mailman id 701250;
 Fri, 05 Apr 2024 12:42:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rrxH=LK=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1rsitZ-0008Tn-39
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 12:42:13 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec7a2143-f349-11ee-afe6-a90da7624cb6;
 Fri, 05 Apr 2024 14:42:12 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-56e2b41187aso1542393a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 05 Apr 2024 05:42:12 -0700 (PDT)
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
X-Inumbo-ID: ec7a2143-f349-11ee-afe6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1712320931; x=1712925731; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RVyraYjJW60W7EU0acb0SKA1sSG0MVBG1TFHZZiCV6Q=;
        b=L0IPdyC9t0hJCyuFrQ/Ypnvu98bJQ/ibWJw0Y7p+RXu1kk7YFT9uLNYlN+gh6XCdbV
         kjprOB1BM1d54K+X9F0HuYxUHqOBQgK9UDvty+FzC5/jsbGLSkratoVOBxfUzranM6m9
         aK93NDNU6LhJ9gvCpvlaEagJkoRb0JGNNPmH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712320931; x=1712925731;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RVyraYjJW60W7EU0acb0SKA1sSG0MVBG1TFHZZiCV6Q=;
        b=avlHGpZHp0KhxFF/JLCZ8aNOJ19PlAkCTCFKcbpFzih5GVzwjpA+ag/i1xnkr8q8Hs
         ibRdtbVR8jKgkE9ocIXp0BV94CH59GGnHvKsjXvu34R8kmZpU0Vy+n5v5i83CYs8YxVC
         pxnMJLp+H5CSN8CSWhTC4LWvHMVuKIL0PxRrB4RMzRgaHQgo+PUvy0qYwOjp5rkYp7pL
         1wa9TFbpdfZxoXe6O5oGcHEnxGAwVBFnsB+nblhQEKdg83EaiCsAeDfjLrmQmiP4kT8z
         no7txWiWx76YCp8voVueuSNwsyQoqSxJMFz3zNHFMeo+D0lWS+o+5zaJMsGRdAWVGTW6
         cT/A==
X-Gm-Message-State: AOJu0YwcY5pVzD2foIWQVmxgu+TQlAXKagsF7uU44b8H3X+eZ+8+Ljvv
	ZGDGq8MwRC9SZXbu3mv1gqGiYoNmQkxQGgo8j8S7vItY2uWoP0KpwcDI0/9kP/71mQKJ6lmRsru
	aU/c665LJmEJ8MIPAHciwJ31dqfVr+r6QungvL/8O3D3Nnlv1BmZArg==
X-Google-Smtp-Source: AGHT+IEceTPR3C97nMzLbW7SqCk4NV+XDNoXZA9jb/b+Ze5ClKvpyVDK8x2D0dikACqf+V0iAgq1+QPBlSCa7bU1Z48=
X-Received: by 2002:a50:ba83:0:b0:56c:d1b:588 with SMTP id x3-20020a50ba83000000b0056c0d1b0588mr1464007ede.14.1712320931286;
 Fri, 05 Apr 2024 05:42:11 -0700 (PDT)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Fri, 5 Apr 2024 13:41:35 +0100
Message-ID: <CAO-mL=xTSaMeAPiGw9Vy3ZTHumKxTQjeCdtyqSRTWT3Gx1UGHw@mail.gmail.com>
Subject: April 2024 - community call recording
To: xen-devel <xen-devel@lists.xenproject.org>, xen-users@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000d9f4e4061558c8f6"

--000000000000d9f4e4061558c8f6
Content-Type: text/plain; charset="UTF-8"

Hi all,

The April community call recording has been uploaded:
https://www.youtube.com/watch?v=fpcxKWdaJyw&ab_channel=TheXenProject

This has also been saved in the Cryptpad file.

Many thanks,
Kelly Choi

Community Manager
Xen Project

--000000000000d9f4e4061558c8f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,<div><br></div><div>The April=C2=A0<span class=
=3D"gmail-il">community</span>=C2=A0<span class=3D"gmail-il">call</span>=C2=
=A0recording has been uploaded: <br><a href=3D"https://www.youtube.com/watc=
h?v=3DfpcxKWdaJyw&amp;ab_channel=3DTheXenProject">https://www.youtube.com/w=
atch?v=3DfpcxKWdaJyw&amp;ab_channel=3DTheXenProject</a>=C2=A0</div><div><br=
 clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"=
ltr"><div>This has also been saved in the Cryptpad file.</div></div></div><=
/div></div></div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Many thank=
s,</div><div>Kelly Choi</div><div><br></div><div><div style=3D"color:rgb(13=
6,136,136)">Community Manager</div><div style=3D"color:rgb(136,136,136)">Xe=
n Project=C2=A0<br></div></div></div></div></div></div>

--000000000000d9f4e4061558c8f6--

