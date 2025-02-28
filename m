Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF04A49D39
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 16:21:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898879.1307333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to2Aw-0000hr-1M; Fri, 28 Feb 2025 15:21:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898879.1307333; Fri, 28 Feb 2025 15:21:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to2Av-0000ey-US; Fri, 28 Feb 2025 15:21:17 +0000
Received: by outflank-mailman (input) for mailman id 898879;
 Fri, 28 Feb 2025 15:21:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yp8s=VT=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1to2Au-0000es-Al
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 15:21:16 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a68f96fe-f5e7-11ef-9aaf-95dc52dad729;
 Fri, 28 Feb 2025 16:21:15 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-38dcac27bcbso2349771f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Feb 2025 07:21:15 -0800 (PST)
Received: from localhost.localdomain (172.74.6.51.dyn.plus.net. [51.6.74.172])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e4795983sm5504962f8f.6.2025.02.28.07.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 07:21:13 -0800 (PST)
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
X-Inumbo-ID: a68f96fe-f5e7-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1740756074; x=1741360874; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=onFrawmAWc6SYlUN1erRcKyMraWrJbBYp7dq1bf6Lko=;
        b=i3nxf8SaSaajxV+RhWnfvdW5cSHj70R9cJoD/SBDIlA/jNwrm3+fVaWUN3BpAGsXC6
         0i46PCkkEMSGQHWYtjrYhslSpWqsY6K8Hl4kyZEoqpG76BIDn66oGEVmTH/OBjV/mR35
         U4e4udlbLM75KufnLkaBhJClfC8pU+NuaTPk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740756074; x=1741360874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=onFrawmAWc6SYlUN1erRcKyMraWrJbBYp7dq1bf6Lko=;
        b=Z/j1xX5GZij9TBRwRWi0mwbd1fmaWcFxd0w0rnzW2mSJG8zW385xEZZfxVm/5ejbWM
         5j6ygH3MLKc1Vyik2qXuTsM+e0wxDSGTj70jKIapRN3/Km/5TGHB67fO1dJoUzhHh9Mv
         8iWsR873g3mpA0kzNE0zWpzBY1pGK1//p8gYWFzPWqILprMqhVLwBxaH8xiKNbGFKr9R
         5YTZSw5ob2LUNeGvE7AOF8zmMAWdAe7B9/edvb2ITZA2vq8QlHySfbQhutcf5wnU3dgA
         nXfi86p1ZCSDTs7IU+E9IOAvMB+2aGRl+KP09yDbgvlhGvF45mxUK//k+hGRnXY/SHsm
         ocAQ==
X-Gm-Message-State: AOJu0YzdPeFgz+MZzVK9qYJmvgfmxG8XEOYrc5S6CRQ0LctRF1vKoNaK
	Amki0nuo7hiYMgnj3KwkFODpLd97yKym2hQOl56IF8yITDm7IEZV1cYkeEH9+rwo3Y4C1W1CnU8
	P
X-Gm-Gg: ASbGncuygpt03vBAaoEDnqJIOsi7gH2slIsibl+M3GA4eoptR1XEOXcV97olb4f6OGi
	dhQNEjPDEtFgVJ2pqoFxWR+PJUwT1hp6Dyqy7KjekFuj8KO5SaQOdfqZVpDTup9qGQCoQOGMxdr
	1Q++rPScs/W2/Blzhhf3L+5/BkAUZ42dFJ2VU8F4PUHuMUgpOsTOczDmxcg8B5aVWQU2p63asET
	ixVkeiHxjZa/FUuojCX+7AAoAHV8+ZYBIzbVYZd91FuPWFLPKoXwehIBxByVAFhZfhFliLfQn4g
	fIVYRSdfttzkJ8TgtWVIuqnQJshQZmyxb6kwrwriVSzYmK6CMVOQR0SHQdaTCUjX0zc=
X-Google-Smtp-Source: AGHT+IHP0bLT+ftkj6jBu+DUzukIQY49PkjP7vhZIKwPuyZYh0CYTxo2/vWA1dY0Bqs3Fr9iD6q21w==
X-Received: by 2002:a5d:6d8e:0:b0:38d:dc03:a3d6 with SMTP id ffacd0b85a97d-390e164b41amr6229432f8f.4.1740756074493;
        Fri, 28 Feb 2025 07:21:14 -0800 (PST)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH] docs: Add some details on XenServer PCI devices
Date: Fri, 28 Feb 2025 15:21:00 +0000
Message-Id: <20250228152100.23105-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the usage of devices 5853:0002 and 5853:C000.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 docs/man/xen-pci-device-reservations.7.pod | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/docs/man/xen-pci-device-reservations.7.pod b/docs/man/xen-pci-device-reservations.7.pod
index 9ddf3a18ad..62f3bd2105 100644
--- a/docs/man/xen-pci-device-reservations.7.pod
+++ b/docs/man/xen-pci-device-reservations.7.pod
@@ -10,6 +10,8 @@ use of this is with device ID 0x0001 to advertise the Xen Platform PCI
 device - the presence of this virtual device enables a guest Operating
 System (subject to the availability of suitable drivers) to make use of
 paravirtualisation features such as disk and network devices etc.
+XenServer, for Windows machines, presents Xen Platform device with device
+ID 0x0002 instead of 0x0001.
 
 Some Xen vendors wish to provide alternative and/or additional guest drivers
 that can bind to virtual devices[1]. This may be done using the Xen PCI
@@ -86,4 +88,11 @@ and unplug protocol.
 libxl provides support for creation of a single additional xen-pvdevice.
 See the vendor_device parameter in xl.cfg(5).
 
+=item 2.
+
+XenServer, for Windows machines, presents a device with ID 0xC000.
+This device is a placeholders for Windows update.
+Device 0xC000 is presented with a Xen Platform PCI device, usually with ID
+0x0002.
+
 =back
-- 
2.34.1


