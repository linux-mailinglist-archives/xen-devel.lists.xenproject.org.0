Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D600092F988
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 13:27:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757924.1167104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSEQU-0006v6-31; Fri, 12 Jul 2024 11:26:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757924.1167104; Fri, 12 Jul 2024 11:26:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSEQU-0006sR-0M; Fri, 12 Jul 2024 11:26:58 +0000
Received: by outflank-mailman (input) for mailman id 757924;
 Fri, 12 Jul 2024 11:26:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zb5b=OM=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1sSEQS-0006sG-20
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 11:26:56 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4052e72-4041-11ef-8776-851b0ebba9a2;
 Fri, 12 Jul 2024 13:26:54 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-58ba3e37feeso2305292a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jul 2024 04:26:54 -0700 (PDT)
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
X-Inumbo-ID: a4052e72-4041-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1720783613; x=1721388413; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=clwYByx2EcJcRZHsyw/4T3lTp3tE9zfOWXixrl41ogU=;
        b=lMJAFCpWa/jVgUFGgtd0W/qDcectzzQRejEm0p+cfQNg64zCXlr1Z/1gmkfoaZSlUd
         3jvLLTcrxsqQtHI5ASMbxibtiIyapuWgHhZ6cUyzLrpa637ywkEQeMlfUi6tv3ZqN2hs
         IwhFQu9ah2LJC7tz8BRg1ZnPfC8pxzDDMRTIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720783613; x=1721388413;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=clwYByx2EcJcRZHsyw/4T3lTp3tE9zfOWXixrl41ogU=;
        b=sb9w8NcNKF7TpqQHfxmlrW4uyF9JQv7J695fm5sSaIftTsdZyU8ASjXdkIh4XLd6P4
         chOZCAFW7CYAgaiBhvyjcvCZO3eWSGkUBUkCnC0gupDM3T1rpl+jguMXkZw42U29lr55
         cF6a/mYMrfeSgu0yqWoZqdVhfTWyGKGn1m1Mb7n8oBQg+/2kBGI7MWcqBpWiMLmy4iO9
         59Qtco/Ae3eiJ/YU0/xuWUZTygrtM9Eg1ur5rExV40wQs7ouZZWA/vZo6XKjqInuXozm
         4C1NXm2HIjS6VOIMB0n2PtNoWPoU1+F+UOwTrYTkHKbJHWVvNl/9yRHIlmhbGv88UhPh
         V4pA==
X-Gm-Message-State: AOJu0YyOPJvZX9PsMGxp6mxSyc4R8zYCqdQBYnLaIIdl5QFBufXc+KLj
	UavI9RAZMaMzN4nH7IoLTsLEtLwSHRcxffXjOZzZYl76aECXxedQyw6FTCycAx7C3MnnMpNxopg
	uWNk19tkYxnYzsrr7OiwYgr23GNvcR0KinlEK/hSskcpi4rMOREMNNg==
X-Google-Smtp-Source: AGHT+IGVVdgwMfezA3eET1/Imu4uaCuYHUmKg/bidevB3uCJqWOupwpRa2RZY6bBOP/Krr50LwHBNkBRRV+7r8Cfx9s=
X-Received: by 2002:a17:906:ca52:b0:a6f:61c7:dea7 with SMTP id
 a640c23a62f3a-a780b6b1891mr698029866b.18.1720783612897; Fri, 12 Jul 2024
 04:26:52 -0700 (PDT)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Fri, 12 Jul 2024 12:26:17 +0100
Message-ID: <CAO-mL=zNpZVnXD-uGjpeGjhxnFtUaXACv_d=BBoyYBi5e1MSZA@mail.gmail.com>
Subject: Community call recording - July 2024
To: xen-devel <xen-devel@lists.xenproject.org>, xen-users@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000fb8e27061d0b27c7"

--000000000000fb8e27061d0b27c7
Content-Type: text/plain; charset="UTF-8"

Hi all,

The July community call recording has been uploaded:
https://youtu.be/BEFmzqxf2Wo

Many thanks,
Kelly Choi

Community Manager
Xen Project

--000000000000fb8e27061d0b27c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>The July community=C2=A0call=C2=
=A0<span class=3D"gmail-il">recording</span>=C2=A0has been uploaded:<br></d=
iv><div><a href=3D"https://youtu.be/BEFmzqxf2Wo">https://youtu.be/BEFmzqxf2=
Wo</a></div><div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Many thank=
s,</div><div>Kelly Choi</div><div><br></div><div><div style=3D"color:rgb(13=
6,136,136)">Community Manager</div><div style=3D"color:rgb(136,136,136)">Xe=
n Project=C2=A0<br></div></div></div></div></div></div></div>

--000000000000fb8e27061d0b27c7--

