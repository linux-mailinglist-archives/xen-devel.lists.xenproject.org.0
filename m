Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47555AE78A7
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 09:34:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024416.1400291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUKeF-00074g-Ls; Wed, 25 Jun 2025 07:34:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024416.1400291; Wed, 25 Jun 2025 07:34:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUKeF-00072v-Iz; Wed, 25 Jun 2025 07:34:23 +0000
Received: by outflank-mailman (input) for mailman id 1024416;
 Wed, 25 Jun 2025 07:34:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=edXa=ZI=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uUKeE-00071z-Eo
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 07:34:22 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf6bbe7a-5196-11f0-a30f-13f23c93f187;
 Wed, 25 Jun 2025 09:34:21 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45363645a8eso9981925e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jun 2025 00:34:21 -0700 (PDT)
Received: from localhost.localdomain (253.226.6.51.dyn.plus.net.
 [51.6.226.253]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538233c05csm11319445e9.5.2025.06.25.00.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 00:34:20 -0700 (PDT)
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
X-Inumbo-ID: cf6bbe7a-5196-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1750836861; x=1751441661; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ku/bkWnKDeRxrJXT+SYJnnAc76B76woDVUrHOmPvtLo=;
        b=NquKiVMAvKgbABJhpXndvZDz2URHX/vkzT/e5W4b8drtQaEWAtOmgkJPMzRTxL4tGG
         Xav8sQ39IaGaUn7IobMJz3SW2D2MumtFCyR/oV5WDNvNL9XB0khiAqK/pr9CJRkl0QfL
         s1Iq9RqtiDoVGwLnOQqwJLsvN9C6IfKjBV51s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750836861; x=1751441661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ku/bkWnKDeRxrJXT+SYJnnAc76B76woDVUrHOmPvtLo=;
        b=XcHqpv7Ak1hb77mX8fnUquCuE6qTO/d6P1GAV8v6CwBkWkIBvFr+QDyk0fl5Y7BdVJ
         HAdNMFlBv3lY3UrL9UXDmgtTfmQSahaVbJMfCNp1EzRpgAySc/Sc/E9nVKYyND7v3gM2
         KIisYxn/eRiK59x9cjsZC9NO5koXcI9Va2Lsc5qEKnL/FMCfM55XP0iw5PaUb5JMLMHV
         rvM4F/WQTq7uXXHd3fY3FHgo9UHVf6Tn0FkARhIo+XJJHjASzQlYa/LMqgVzIvU9I7wh
         vCFUzXQhVWKc3p+CD3rDS1kyRGIwzDhW+vFCDXkz833Xl0ifKlvv9xwArjJvsRsAUABh
         0SHA==
X-Gm-Message-State: AOJu0YwVyH9bg3El3+vmvRawCzfJWL0Vj/JrW5RGE+qeUP3bWgAxWKrz
	/fChjtz1SlgIgdRBJkVZa6/GDedF3bYeIZcsHyWv/Oy/bobSetEuHmHRA7xh7SCp1r0Byv8hyVY
	OSRpTMIbvHA==
X-Gm-Gg: ASbGnctqfuRtLDraWiaSN2MGNFJrV55sy8ZSdcpgCtQl1ArTNnZaUUCOweJWa2+cQWy
	yUEs2lxOkVzt7o6kVmKUBfGnix6QAfIbmWY0hnSwN17n0ZW+gyk2Ubu89dFzG3Y5rQfModg+DWA
	b/jkkA7Gb/Uf8dVF6KdyIC8XtgVJ8CHbqStZMHWkoibdVACiZD4eRdEKsdQIC2/upbQerM3uyP0
	dvB65gHdjYEaO5yGFlisDrjHnC9V1IzpNZcbsF7rdfcNm2rTRudsp+Ia1yhx4uS/fI4gex82Nfo
	qXFxv9mZgysQLuOV3x9NiYeX8nwgJRy2sudhLahbifuh5AhF4gHzo+Xx0B/dV1Nbp/QfnaHHNhj
	UaURWTQlv2pT5ZPdbxj5GL+NEvuXzxgN4/sUi+SVf
X-Google-Smtp-Source: AGHT+IGUj4fbsRaMsN8tCyV60UhoJ13zAH1kbx+HylBijsbW2KTZhREm2HCvDC5EMys9zsZy0lujQA==
X-Received: by 2002:a05:600c:1e1e:b0:43c:f3e4:d6f6 with SMTP id 5b1f17b1804b1-45381b0632dmr18067825e9.31.1750836860777;
        Wed, 25 Jun 2025 00:34:20 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 0/3] xen/efi: Make boot more flexible, especially with GRUB2
Date: Wed, 25 Jun 2025 08:34:02 +0100
Message-ID: <20250625073408.7496-1-frediano.ziglio@cloud.com>
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

Frediano Ziglio (3):
  xen/efi: Handle cases where file didn't come from ESP
  xen/efi: Support loading initrd using GRUB2 LoadFile2 protocol
  xen/efi: Update error flow for read_file function

 xen/common/efi/boot.c     | 179 +++++++++++++++++++++++++++++---------
 xen/include/efi/efidevp.h |  21 +++++
 2 files changed, 160 insertions(+), 40 deletions(-)

-- 
2.43.0


