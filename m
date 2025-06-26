Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AAFAE9E45
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 15:11:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026354.1401554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUmNg-0006H1-R3; Thu, 26 Jun 2025 13:11:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026354.1401554; Thu, 26 Jun 2025 13:11:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUmNg-0006Eh-ND; Thu, 26 Jun 2025 13:11:08 +0000
Received: by outflank-mailman (input) for mailman id 1026354;
 Thu, 26 Jun 2025 13:11:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kW9B=ZJ=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uUmNf-0005vJ-8B
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 13:11:07 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05115511-528f-11f0-a30f-13f23c93f187;
 Thu, 26 Jun 2025 15:11:06 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a50fc7ac4dso498087f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jun 2025 06:11:06 -0700 (PDT)
Received: from localhost.localdomain (253.226.6.51.dyn.plus.net.
 [51.6.226.253]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6e806916esm7351356f8f.43.2025.06.26.06.11.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 06:11:05 -0700 (PDT)
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
X-Inumbo-ID: 05115511-528f-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1750943466; x=1751548266; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s6BJndVvhk0Ds/aN/1ClgpsDUl6Okek1m4XQxq4tbbw=;
        b=IeQgBiiU8ztHIulSYcDyU2SUlF4UsIKba5NXk6S7pRXltnHO6Ami/Qppg6Mw1nEl/0
         b8vXkwkDIXRjMkvbLIVLydFRy9RCU7XL7mFlSw+ruKWN7XV6xfDfVQGfNXugxIgomW8E
         DzU03ZYx0KJbZxAt9EAzaJ3RXE1CZaYjxQbs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750943466; x=1751548266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s6BJndVvhk0Ds/aN/1ClgpsDUl6Okek1m4XQxq4tbbw=;
        b=npt2skFT5JuKAJV8VoPT3M2xCLyKyKX9IvI+y1Z5kQXUPS2xZ7CIVXuyVOGCAxoTIz
         LEMV8tdqyLDDbOjY1PyFJz3LHTy8Q7MvLV5laLxxl8/Fm8f/WqnOr/nX9tLngkwRcDLA
         D/jFyWIpNqyBUSs2lfQNKaW/TjimrxOM/qYonf5CINcjXbogczCkhIkL18BBHJtMXQF/
         RCE4nbrWujbcvTX9y9nxoSm/1qI3hIixff67nathCMD1OUATMxg9W1HLeNIXXA5oTW4P
         p8T3emjMGI/MFIQ+KXpkGgZ7sBKGT7j6t/kjzeP5dMQmVkGHTPeWxC2khCWBScFfxIW9
         iWuw==
X-Gm-Message-State: AOJu0Yw+kc2pPUz3vDbOautbmH01EDPGOTqMFkwnwgprXls62d2c5DnV
	u+Z0b2i+18rL3cGvYQeK4/Bv4iUh5VruWlF4Um9PM6Ql+v9BNIsKpHxR77GqkUFhZz4uwDCQJ7c
	4HDDot3c=
X-Gm-Gg: ASbGncvncieBVZqz0xEYwqMmWtELYSROW4SoHos9qyY49xC2LKrw7l56P0Mfgd311Uf
	nU6AEH/j9bYgSYyFHQ4Hg+/q6KGMZIWwpbeZFsMCWXq1L8UVT3Rf+bemRWsVBfN6Nr4pcRXlQLt
	SVACeDpF09wMj0wsEUvXwlVC4uRXTkW+y9IdiZ1O+8NJ8CxiS1DYqpDIMgVAo9/bsuRvTDiBJPY
	23n+iwuK9moBhcTdLY8jdX1VfD7A+KBibz5BmOqNrPxkru+dpCCePJ0uzgAq/dOgezSguLoEfI1
	Hq/MkjzMS7OZUXw0DVy8gnbtwhqCC3SBuyZz7O5cdBJIdLwnliKocfTULsORInMlqVBqyniOjt5
	0kn41H3Wo+cjTJ8RSdOL8MAgOZuM73g==
X-Google-Smtp-Source: AGHT+IFBB6Ws21E1/GkABDlKkF9TxdfI+48vAclDO2Kyd8hhNU8tB1webCV5hV3qXq6B8uR4cIb/6A==
X-Received: by 2002:a05:6000:2c0d:b0:3a4:ea40:4d3f with SMTP id ffacd0b85a97d-3a6ed6717e2mr6058709f8f.53.1750943465951;
        Thu, 26 Jun 2025 06:11:05 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4 0/3] xen/efi: Make boot more flexible, especially with GRUB2
Date: Thu, 26 Jun 2025 14:10:52 +0100
Message-ID: <20250626131059.61894-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The combination of GRUB2, EFI and UKI allows potentially more flexibility.
For instance is possible to load xen.efi from a no ESP partition leaving
a boot loader like GRUB2 taking care of the file loading.
This however requires some changes in Xen to be less restrictive.
Specifically for GRUB2 these changes allows the usage of "chainloader"
command with UKI and reading xen.efi from no ESP (so no DeviceHandle
set) and usage of "linux" and "initrd" commands to load separately
the kernel (embedding using UKI) and initrd (using LoadFile2 protocol).

Changes since v1:
- keep read_file fatal when it was so;
- attempt to use LoadFile2 after trying object section;
- minor changes (see details on specific changes).

Changes since v2:
- update read_file style;
- added acked-by.

Changes since v3:
- style update;
- coherency changes for LoadFile2.

Frediano Ziglio (3):
  xen/efi: Handle cases where file didn't come from ESP
  xen/efi: Support loading initrd using GRUB2 LoadFile2 protocol
  xen/efi: Update error flow for read_file function

 xen/common/efi/boot.c     | 177 +++++++++++++++++++++++++++++---------
 xen/include/efi/efidevp.h |   2 +
 xen/include/efi/efiprot.h |  19 ++++
 3 files changed, 159 insertions(+), 39 deletions(-)

-- 
2.43.0


