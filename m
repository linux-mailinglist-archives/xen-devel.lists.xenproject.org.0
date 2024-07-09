Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E47E92BB06
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 15:28:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756284.1164845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRAst-0001Vr-2y; Tue, 09 Jul 2024 13:27:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756284.1164845; Tue, 09 Jul 2024 13:27:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRAss-0001TM-WC; Tue, 09 Jul 2024 13:27:54 +0000
Received: by outflank-mailman (input) for mailman id 756284;
 Tue, 09 Jul 2024 13:27:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ELTS=OJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sRAsr-0000vh-NR
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 13:27:53 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09550af1-3df7-11ef-bbfb-fd08da9f4363;
 Tue, 09 Jul 2024 15:27:51 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-52e94eaf5efso6161393e87.2; 
 Tue, 09 Jul 2024 06:27:49 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52eb90677fdsm241911e87.232.2024.07.09.06.27.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 06:27:48 -0700 (PDT)
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
X-Inumbo-ID: 09550af1-3df7-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720531669; x=1721136469; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ti8sp+/BX7R6wA3VB6v8okYhWPpZXcaVGcBvggtq4dc=;
        b=OwObSToacesmBPMmwDTu2YHzQAWthfJLEg3ep4kx7yUaBWuFA5+MMzxsZfWMlS/Fag
         JA72XQJdh6Uyla8wYtHNrJJQ2C8gVVY44EQRQCH0almyP9TYoNIud4fFtS2CgpAd+BkI
         HfWFAmADgF2VXh5WdTixACv9eW4yoi/+yDmiy/d4x+4Zdcn3KKatTQOpBuymp9xO8zzO
         6XhupEpx0/FILqN+93I5PzYXgGHaDYkW1n8XjCSPQYvGwhyqnwW3fmof9qmkGoSWscIG
         nqUzh5ITbWyxzOXexh8WLtUbtpF7w6Qy+VNgYsQ2DAX3v1szOSady+u5C2vaGHMxn6/x
         0osg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720531669; x=1721136469;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ti8sp+/BX7R6wA3VB6v8okYhWPpZXcaVGcBvggtq4dc=;
        b=N4WM9BijKEkgf3ds081PSSxsOc8ovA0je2Hscwu28pD1v88FWr5qfet5T1TKafw4LY
         pSxw0yOmJQXRZLPZd+84HmOGiaUNb52N6QI5I0y34IGSlrWYLuDWwnSiZ3zvAGlRRFmI
         BrJQbZehFDXVfLSW/g3dz7UXP1xRPRriTQY2ngqxL8es9I5XeRnFFhOpwUkW7Fliw+iD
         noosqBle0nWSrLRYWDnrCRW3ITGWOmlk9em94TxVSlEcX4rQ+D87ps+/kttld06ZWziJ
         7/7b0a6QU2mYrHRS85RhU+YV5ysx+iBqYjaG9PjsDN4churzwOgzUQ1T1ofYvarMdRc1
         SWjw==
X-Forwarded-Encrypted: i=1; AJvYcCUVdCfwq0w8Nx1vzNDcnl6K9HH6eOlDH1GSOs+HLqe00GFemJmU8MCf08ZKT5r+CS1H5P0IgQ7zJ802VZPBAZ3Sk+Kt3RtE9V4Kp2jLP66HqPc=
X-Gm-Message-State: AOJu0Yx7BBAb00LPKLcG0XYLHe5ffbyLT2m+5D/k7Dh45zMj+vHD7Hu1
	LV7YZhm+lQXR1xswTFAJcYebUBFVje2wntrY00EwnNdNRqy8zeB7Brborwd+
X-Google-Smtp-Source: AGHT+IGPWB6auGIZQ7g0/oehpI07mf6q5nYVSr7v+w2hJfIolO5BBBUHWDyJIMGVTQPQu5TtOmMgcQ==
X-Received: by 2002:a05:6512:703:b0:52e:9c69:b25b with SMTP id 2adb3069b0e04-52eb999e1abmr1278239e87.28.1720531668528;
        Tue, 09 Jul 2024 06:27:48 -0700 (PDT)
Message-ID: <9e1fecdf469cab8b0f1767efc680c12105d4e763.camel@gmail.com>
Subject: Xen 4.19-rc2
From: Oleksii <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: xen-users@lists.xenproject.org, xen-announce@lists.xenproject.org
Date: Tue, 09 Jul 2024 15:27:47 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

Hi all,

Xen 4.19-rc2 is tagged. You can check that out from xen.git:

git://xenbits.xen.org/xen.git 4.19.0-rc2

For your convenience there is also a tarball and the signature at:
https://downloads.xenproject.org/release/xen/4.19.0-rc2/xen-4.19.0-rc2.tar.=
gz

And the signature is at:
https://downloads.xenproject.org/release/xen/4.19.0-rc2/xen-4.19.0-rc2.tar.=
gz.sig

Please send bug reports and test reports to
xen-devel@lists.xenproject.org<mailto:xen-devel@lists.xenproject.org>.
When sending bug reports, please CC relevant maintainers and me
(oleskii.kurochko@gmail.com<mailto:oleskii.kurochko@gmail.com).

Best regards,
 Oleksii

