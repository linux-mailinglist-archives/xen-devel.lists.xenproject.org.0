Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BC88C7861
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 16:23:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723420.1128280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7c0B-0004Qu-MB; Thu, 16 May 2024 14:22:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723420.1128280; Thu, 16 May 2024 14:22:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7c0B-0004PN-IR; Thu, 16 May 2024 14:22:35 +0000
Received: by outflank-mailman (input) for mailman id 723420;
 Thu, 16 May 2024 14:22:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0hAQ=MT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s7c0A-0004PH-1d
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 14:22:34 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb8321f4-138f-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 16:22:32 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2e564cad1f1so11152431fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 07:22:31 -0700 (PDT)
Received: from [192.168.226.248] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e4d18344e9sm24121811fa.139.2024.05.16.07.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 07:22:30 -0700 (PDT)
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
X-Inumbo-ID: bb8321f4-138f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715869351; x=1716474151; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=51qAFqO3J8VvzLgLj/wFYjT3KCxnpJFhUgC1HQ2a31g=;
        b=GDjxurYwqPq9zTC61x5IF8+7BujmOJut0e+sipE0/yA+smkeAv4ysW8A0Q7nq/L0er
         UoMHFKjPVGgDirqsc9fjSzCr3a0kkVOYjTCg5W1kN4mdzeGg2nmwg93TjHFSEyKCrTtV
         qUzK43xdV+DOIKWX78v8Cy8mDBp3RXlar8f3NG+80a27a7s5Lzr80eCvuVFKcBmgG2x8
         xgj7qqaORWuiZaz64tkZJpc7V+LNTr/ssYPVcrPdoEU/lOVbywwq6IP4bRJ5jdbtkShg
         fixAZE7ziIWj2tjyryvbs8/gwpLGKqGTP0x8/PA7wUUCT9RH14ENyoAJlPYEOJw5cHf/
         IU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715869351; x=1716474151;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=51qAFqO3J8VvzLgLj/wFYjT3KCxnpJFhUgC1HQ2a31g=;
        b=hb1qJFSKwKiQI21qrSvw1H5wN2YlZ4C6m+TJ4Ray6c26I1ynrw7yJ0zyDoZkIZNlaJ
         s1Uj96qvlaev4ffuSot/8XE6PF3yYoyWaMUs2q2+6D7j9i4qIzsLIIPNzNo935Kfwzql
         JY/h2Yy7JbwKMntLl2gHDXPhgMMXSnXOE0xdMrLB+6u9QqnDJL4XW1ypQxQHpz6OC2NG
         ulStPNugAsKsXA0Dc6Aaqop2DHqcl9QriWziXwXNrqHNvhDN4lBsgwyNHs6dodDpZO6h
         dLOjSyIcEpUUow2RQFpiTRWN2mpOlicBb3hm3PvacjqVWiKbBLqH7L7TE1OpIsIa9pLk
         1zcg==
X-Gm-Message-State: AOJu0YyEHzAsjKtLw3VK7d+Uu32nr+R87F5FrTK3GXzTLMvVyzzN4+LY
	LUHolT42sItHU504UDIrCjaRtU0mwhCCiV1xNzDFZYtzikD8T9uhj4SEIynC
X-Google-Smtp-Source: AGHT+IHGsHzTv6LLbt1WjFRX+DiJ8oBBAQAbN2MFHtmINivy7ck/5dKY1fM892GB6vgEuPdjIZ+kLw==
X-Received: by 2002:a2e:8397:0:b0:2e6:f710:6056 with SMTP id 38308e7fff4ca-2e6f710618cmr31304871fa.18.1715869350870;
        Thu, 16 May 2024 07:22:30 -0700 (PDT)
Message-ID: <d7456a1a3d8a872297d65785466ae07fdf0bcbfd.camel@gmail.com>
Subject: Feature Freeze Deadline Extended to May 24
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: committers@xenproject.org, community.manager@xenproject.org, Kelly Choi
	 <kelly.choi@cloud.com>
Date: Thu, 16 May 2024 16:22:30 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

Hello everyone,

Since there were no objections to extending the Feature Freeze Deadline
Proposal, I would like to inform you that the deadline has been
extended to May 24.

At the moment, I don't see any reason to extend other deadlines, so
they will remain the same.

Have a nice day!

Best regards,
 Oleksii

