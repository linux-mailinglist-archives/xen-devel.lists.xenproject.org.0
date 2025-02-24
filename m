Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEAFA426CC
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2025 16:48:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895228.1303825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmahK-0006kc-Oo; Mon, 24 Feb 2025 15:48:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895228.1303825; Mon, 24 Feb 2025 15:48:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmahK-0006j8-Ko; Mon, 24 Feb 2025 15:48:46 +0000
Received: by outflank-mailman (input) for mailman id 895228;
 Mon, 24 Feb 2025 15:48:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1jZ5=VP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tmahJ-0006ip-M6
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2025 15:48:45 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2235521-f2c6-11ef-9897-31a8f345e629;
 Mon, 24 Feb 2025 16:48:42 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-546210287c1so4750292e87.2; 
 Mon, 24 Feb 2025 07:48:41 -0800 (PST)
Received: from [172.24.85.51] ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5461c1e4ae0sm2606705e87.43.2025.02.24.07.48.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2025 07:48:40 -0800 (PST)
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
X-Inumbo-ID: d2235521-f2c6-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740412121; x=1741016921; darn=lists.xenproject.org;
        h=to:subject:from:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6bgsp8zew5+67NQYQXJH+nX6Jz9kS4sg/ZyUNAuYgFk=;
        b=lb89muxOwa48NVbJpNfHGKaK1kyhfxjxS8ypulT6hBz959vSlxLvw8Oj1CylYkcZbf
         VcuZRP94ZxzctnRPQdR7yg2tB8LogvhB9d1T0bceRA9ga5QzquMLXt0YZoEfZd4dtSed
         dj8TDvRbI+1tlpieBAgmJvoj8TNfm+k/cbv8Dx7pSSnyaD1ZapkkcaXyDTjkWxqpPz0K
         PJpe0yQT62bSDxhrBDK5rLoSJiVcI5SuZbpH8Ea91pFIm5gRe+eIj/MqJErT1xH+R3fa
         xJZ6auMyhMerg64w8vdjfyx/6/P66/QearvxNkw1uccPiICOtvKfliSczL6cLmpau0zk
         ub7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740412121; x=1741016921;
        h=to:subject:from:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6bgsp8zew5+67NQYQXJH+nX6Jz9kS4sg/ZyUNAuYgFk=;
        b=fNLFlY3yo/CDSIO6XxplWPoM+mOomRJxxObC4oLBylADxL631XiQglfOpgGCw/VlGc
         bHQel4pFy321MEtLQISuiMKPKQAEmN8323T7rrqkhAKuMVnNgifEng8I+YHplzIXbDfH
         /RlbKeOyFAvL0NPPt5MQrUA3zfedJnA2vesOZ3iJ819PNkKJyooCvKahXQZFmH4Qdwhi
         84mWfBPcdN24Zu3L74sP0SZF38MQdOuEFsO6R/HekvD9xQKmiU/2DX7PEDLwo46T5/Kx
         TyoGi7c8FSZ8usuVGQYS15Qiumps1oWAGYLYEIybpYzJekeWzSWANnid8sY2kLCu5PWc
         nQXw==
X-Forwarded-Encrypted: i=1; AJvYcCUweBNY9Juxqq9C1wf+iPjVBD8ZdltDHUu0946oik0Jdw/Gjp7j0+nh6wsQ0nHfltlxr0x1y7SVCl9ZWII=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyBcw5ti4mY2bTPry6okdo3Ob/Bm/YANlvFlnz1u7aJDx3TYzUI
	2tHvXqS09pvRXzx84cEwgTvFI6G+6/g60eFReOYp6V5+ZxDpwLgkpfxAFA==
X-Gm-Gg: ASbGncuaj2tqu7Tnv6hwvj5qwd5lBm2nPWGxgeEKATy08Y+cqhfsX5uQjQz7mTi+RNp
	UsEax32j7pXu5bIP6M7+xnI7sqfqwmlXHeHOslDAULFej6JXSzNvn5OkdLVq+Vx5Fjit1iWMAku
	EuQCOruXtVDI9I9WGTfEuJBb48qmxpna7UNcQGgbPXfXMM1K0NCb/g1CCHoJf1Xzl/xErwNne0p
	qBVpJAcc8db7KjFncKbehFwVoz7laYrzSfFZKf4WnhejE5+T9wXD3W/RbL8ntyWODPAoaPRlg89
	qWYrMXiZosBfJpttP766lGOJ1+i2Dlx1uB0=
X-Google-Smtp-Source: AGHT+IG1jFlr6SRBVRiJC3kvy6ia/clUl5MlW6KoHN6YS74YYkLVWMvbsCARZWdkvNM4RmUtxpQozw==
X-Received: by 2002:a05:6512:398a:b0:545:fc8:e155 with SMTP id 2adb3069b0e04-548391400a7mr4652140e87.20.1740412120366;
        Mon, 24 Feb 2025 07:48:40 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------kPfzbG0Qw773NNhnyc0Kzoq3"
Message-ID: <1a7ca814-3f1e-48be-b606-c4d2b8966aa3@gmail.com>
Date: Mon, 24 Feb 2025 16:48:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [ANNOUNCEMENT] Xen 4.21 is branched off
To: Xen-devel <xen-devel@lists.xenproject.org>,
 xen-announce@lists.xenproject.org,
 Community Manager <community.manager@xenproject.org>,
 committers@xenproject.org

This is a multi-part message in MIME format.
--------------kPfzbG0Qw773NNhnyc0Kzoq3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello everyone,

I would like to announce that we have branched off Xen 4.21.

At the moment, staging is going to be half-open. It is fine to commit
small bug fixes and changes that are unlikely to impact the remaining
Xen 4.20 work.

The release for 4.20 is expected on Wednesday, Feb 26, but there might
be a slight delay of 1–2 days.

Thanks in advance, and have a great week!

Best regards,
  Oleksii

--------------kPfzbG0Qw773NNhnyc0Kzoq3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre data-start="86" data-end="103">Hello everyone,

I would like to announce that we have branched off Xen 4.21.

At the moment, staging is going to be half-open. It is fine to commit
small bug fixes and changes that are unlikely to impact the remaining
Xen 4.20 work.

The release for 4.20 is expected on Wednesday, Feb 26, but there might
be a slight delay of 1–2 days.

Thanks in advance, and have a great week!

Best regards,
 Oleksii</pre>
  </body>
</html>

--------------kPfzbG0Qw773NNhnyc0Kzoq3--

