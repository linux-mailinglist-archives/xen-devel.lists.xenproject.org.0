Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC07A4DF19
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 14:23:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901142.1309124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpSEz-00006L-U7; Tue, 04 Mar 2025 13:23:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901142.1309124; Tue, 04 Mar 2025 13:23:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpSEz-0008VS-R1; Tue, 04 Mar 2025 13:23:21 +0000
Received: by outflank-mailman (input) for mailman id 901142;
 Tue, 04 Mar 2025 13:23:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QBId=VX=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tpSEy-0008VM-KS
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 13:23:20 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d606aa11-f8fb-11ef-9898-31a8f345e629;
 Tue, 04 Mar 2025 14:23:18 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43bc638686eso11251965e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 04 Mar 2025 05:23:18 -0800 (PST)
Received: from localhost.localdomain (172.74.6.51.dyn.plus.net. [51.6.74.172])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba5710f6sm234888765e9.29.2025.03.04.05.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Mar 2025 05:23:17 -0800 (PST)
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
X-Inumbo-ID: d606aa11-f8fb-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1741094598; x=1741699398; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I1uscNqFaFtz43eRgY1wNwFVffA/ar3ed9Rc6ucAINU=;
        b=adrMNRMrObsH0ykEwyUaeZ1yU3QdAl6XSMSEoJXWhTcvMtI25u1fOV/CpzsyvcAsrT
         N0wh28GKO1/NLHN6h8NPG8GwsZbK/GN2wYwBMvEyVl9bfNG+tHBmkHnOzxxlV23Bn6D8
         O98Vk+QveoG3QHKQy2+J2a/jWnBtAW6B9po7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741094598; x=1741699398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I1uscNqFaFtz43eRgY1wNwFVffA/ar3ed9Rc6ucAINU=;
        b=X4CqEufTkQ3/KPUCSlnjsjeyZO18NMFFVX4v/AeXJNuI6rPQVjDbof3bqlo7WZ4v+w
         vGbUcwBJwh1+ivXJc7Jx/jjhgpP5C9Chp1C0Gg1DqPZ1a0WmmOvwFMfLIzBl8q68mT+e
         IHCMQWpZGIqfsd0wZHU3qEDoNj2ALJh9ySqWUktknXoAnmG+VKPHH41RwfAxO6pp88tz
         kICUQ+3nPLNmvF6nchPyIh4rn5ExXQcSAybrnEugpKRzP2XUtpqlVy1ljpGmQdXkTk3a
         OxOiKjKubsTiUy3WRl/pFwi6vnrLwsDPbipuY0/iwOxvs6Jk/DeqA1UW+Th9QbRlpD7l
         rlqw==
X-Gm-Message-State: AOJu0Yz1IpO+1fe0qWopYlBON+/BE5rTq4GU0QvqwAIYSh2fQeehBSa9
	/TE54fMgXUsOMgVUhBXCy3KoTSuUjcLVnzqZCnG0COBrogE8TJRFtWIixQNnXxVbA5qUGlZAbXF
	T
X-Gm-Gg: ASbGncvsYHysC29ZVOys28oYvNOO41Xbi6nwsiwKt5yo7p4ID5Npo4OUF6rEsBgdFco
	altw32TZiSfqpaOqRf1MEq2iIoLt53GtwMvsYehxTSWj17MWIUXBQK6Mo8T5JX/9CddF+p4LxLk
	WRLZ9PFbofZpASGcEd2IDBFtPZCfl5XLop4NKqElIXDVkNOch2Azz//3Xmfm32eLO4H8y+W4ORX
	c9Ddgfgh9eLIeltFcYLT4pXEi/xVS+v/t6Qoh5OyDMEYRIT8Es8Il7dPZWut1OUADM5ZfrJVEKl
	mj8H8lPMzb789EATl6Ifd6DrKS/gNiGeUY2dbbnUHZZdU5KqcEjGaokkXDWgWG7Fomui/gUAnqG
	a7HL35Gre1w==
X-Google-Smtp-Source: AGHT+IHf99zJA6gc6my3UzUPsv1ZdlLiru2rHyzOho1fFKvDyp60c8sgQpLuwIZw3nK34y/NsmMQWQ==
X-Received: by 2002:a05:600c:3c98:b0:439:98fd:a4b6 with SMTP id 5b1f17b1804b1-43bcb04c074mr27208325e9.15.1741094597631;
        Tue, 04 Mar 2025 05:23:17 -0800 (PST)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH v2] docs: Add some details on XenServer PCI devices
Date: Tue,  4 Mar 2025 13:22:53 +0000
Message-Id: <20250304132253.23955-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250228152100.23105-1-frediano.ziglio@cloud.com>
References: <20250228152100.23105-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the usage of devices 5853:0002 and 5853:C000.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
Changes since v1:
- address minor comments
---
 docs/man/xen-pci-device-reservations.7.pod | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/docs/man/xen-pci-device-reservations.7.pod b/docs/man/xen-pci-device-reservations.7.pod
index 9ddf3a18ad..adc325069c 100644
--- a/docs/man/xen-pci-device-reservations.7.pod
+++ b/docs/man/xen-pci-device-reservations.7.pod
@@ -10,6 +10,9 @@ use of this is with device ID 0x0001 to advertise the Xen Platform PCI
 device - the presence of this virtual device enables a guest Operating
 System (subject to the availability of suitable drivers) to make use of
 paravirtualisation features such as disk and network devices etc.
+XenServer, for Windows machines, may present Xen Platform device with device
+ID 0x0002 instead of 0x0001. Device 0x0001 and 0x0002 should be mutually
+exclusive.
 
 Some Xen vendors wish to provide alternative and/or additional guest drivers
 that can bind to virtual devices[1]. This may be done using the Xen PCI
@@ -86,4 +89,8 @@ and unplug protocol.
 libxl provides support for creation of a single additional xen-pvdevice.
 See the vendor_device parameter in xl.cfg(5).
 
+XenServer might present a xen-pvdevice device with ID 0xC000.
+Such device is a placeholder for Windows update usage and is always exposed
+in conjunction with a Xen Platform PCI device, usually with ID 0x0002
+
 =back
-- 
2.34.1


