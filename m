Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAAC8CD72C
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 17:35:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728661.1133688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAATR-00025l-Uu; Thu, 23 May 2024 15:35:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728661.1133688; Thu, 23 May 2024 15:35:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAATR-00022z-RN; Thu, 23 May 2024 15:35:21 +0000
Received: by outflank-mailman (input) for mailman id 728661;
 Thu, 23 May 2024 15:35:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j16U=M2=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1sAATQ-0001Wm-BD
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 15:35:20 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f292336-191a-11ef-b4bb-af5377834399;
 Thu, 23 May 2024 17:35:18 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-51fc01b6fe7so6890218e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 08:35:18 -0700 (PDT)
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
X-Inumbo-ID: 0f292336-191a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1716478518; x=1717083318; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WK2due6RzDqlyZIoN7S9vAmqA/HTLxu5ojLW3xzMpwM=;
        b=jNK9EnX5FS8prht7GnGQfikn6fe5ueePdIZFCKe+4oabuQQkl8Jz19+kREcjdv2t+4
         9nJ0g4QN1d1Zlsy3YkfNiUFd2407nvmv0TeF1MX3bpdyl5MWYQciD5gBrj5JvvK/q8tj
         LTGiX0TjUVhksS8A3KSlTB7hUF+s5Pnkk2e6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716478518; x=1717083318;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WK2due6RzDqlyZIoN7S9vAmqA/HTLxu5ojLW3xzMpwM=;
        b=M4QYipgWvQUVyFPNqlhi3/sl4LougTpzdTkx8wrXjeEeDJsbLc832ifhAbrcdmisNm
         gk637lI7UtDEDWNzL4dIwbfsPKOmUBauOJi9cBKhl7fg5Eq6ASLS4PeDRM5x6cQQzzhF
         HlvQvn57eAZSpYmvvARNnWVAMcsYVSS9mi3MvZTi8KMzWrkduA28vGlJKpYaosEznUNL
         7DQZ3IyHvpWU3nS91Rc8DixirbNjBtXwBPhcD7oqoetxFGSxLZdr1QGnFuG73wR/NC/G
         lkAK1K1SXId5ETtuFyBCs8KgOzICY8nn/4DmRdIm93Ku9fyLkjjDU896XRXt+PR7ulTG
         5L/g==
X-Gm-Message-State: AOJu0Yw2acBSUjsTs47T/Z14rmPEQ3UwP9BXiYT5zQwDqbvZikvjS0QI
	MAfccPv/zMHhI7ucUxeGIYs1oWZArPC/DMX7vJwr81E8lobwR850hG4uAcmOVz9bLOmRuS8KUCo
	kzQoii5OIHLrhTAbWzmaEM8m+2mb0Tccu3gc6Pq1zgMIjGaw7IadVsQ==
X-Google-Smtp-Source: AGHT+IHiN3P2uyCiShckpnb7rRSbwrfifxWG+oM1Inw8lhMdx+Y4YRXfW6MkPl0glrNwfVTuAfQq4ReYqnaNi1cjX/Y=
X-Received: by 2002:a05:6512:2113:b0:526:92d7:52d4 with SMTP id
 2adb3069b0e04-526bf451c82mr3152501e87.61.1716478517606; Thu, 23 May 2024
 08:35:17 -0700 (PDT)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Thu, 23 May 2024 16:34:41 +0100
Message-ID: <CAO-mL=wAfgraP41vxH7rYnJp0p7O6BTsiNqLg+iVXYrivAL=CQ@mail.gmail.com>
Subject: [ANNOUNCE} Postpone June Community call
To: xen-devel <xen-devel@lists.xenproject.org>, xen-users@lists.xenproject.org, 
	xen-announce@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000004ea237061920cc00"

--0000000000004ea237061920cc00
Content-Type: text/plain; charset="UTF-8"

Hi all,

The next community call is on Thursday 6th June 2024, which clashes with
Xen Summit in Lisbon.

I propose we move the call a week later to *Thursday 13th June 2024, 4-5pm
(UK time). *

Many thanks,
Kelly Choi

Community Manager
Xen Project

--0000000000004ea237061920cc00
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>The next community call is on T=
hursday 6th June 2024, which clashes with Xen Summit in Lisbon.=C2=A0</div>=
<div><br></div><div>I propose we move the call a week later to <b>Thursday =
13th June 2024, 4-5pm (UK time).=C2=A0</b></div><div><br></div><div><div><d=
iv dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"=
><div dir=3D"ltr"><div>Many thanks,</div><div>Kelly Choi</div><div><br></di=
v><div><div style=3D"color:rgb(136,136,136)">Community Manager</div><div st=
yle=3D"color:rgb(136,136,136)">Xen Project=C2=A0<br></div></div></div></div=
></div></div></div>

--0000000000004ea237061920cc00--

