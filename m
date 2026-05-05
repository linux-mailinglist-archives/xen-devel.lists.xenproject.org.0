Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOQlLcXM+WlHEQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 12:56:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2812C4CBF7B
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 12:56:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300504.1575103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKDRF-0008SU-Us; Tue, 05 May 2026 10:55:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300504.1575103; Tue, 05 May 2026 10:55:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKDRF-0008QU-SH; Tue, 05 May 2026 10:55:41 +0000
Received: by outflank-mailman (input) for mailman id 1300504;
 Tue, 05 May 2026 10:29:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ukleinek@baylibre.com>) id 1wKD1i-0001Gj-M7
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 10:29:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKD1g-003A7k-Gc
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 12:29:18 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ukleinek@baylibre.com>)
 id 69f9c666-bab6-0a2a0a5309dd-0a2a450aa878-44
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 12:29:17 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ukleinek@baylibre.com>)
 id 69f9c67c-56b3-0a2a450a0019-d155dd2ba413-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 12:29:16 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-43d734223e4so2954864f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 03:29:16 -0700 (PDT)
Received: from localhost
 (p200300f65f114e082236c6257eff72a1.dip0.t-ipconnect.de.
 [2003:f6:5f11:4e08:2236:c625:7eff:72a1])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-45055f2203csm3772962f8f.37.2026.05.05.03.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2026 03:29:16 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=baylibre-com.20251104.gappssmtp.com header.i="@baylibre-com.20251104.gappssmtp.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1777976956; x=1778581756; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jq6G9SCADZgi5j8IAt02Ku+HE9Gjzrrr5m74sKn8VBQ=;
        b=h4nwx/XVEA601XzxBFHxm28273wEWn3AuKJUXV/a9mUqixGvdzKOI88pBGJDEa+ah3
         E+7C9IX9G8YYva6SCqEDsFZ505GofUp1SUqtHrVFvww9CnndQORodFAwop0TXiCgVkk7
         nMS2gPkdsGIGbDXmUQ47K+YSIbWS2rweV5HC2sKHuzOlREy56o95u6rL9fXd1qcTAX9A
         +Z6tb8SrWEr+Rg1TK/7lvH51S17hv6Sx39OCTfQSY83bgKGzt5AUao2oRhr8HfRp9pGZ
         /4BA1DazHC6WCVnsUP3ZttsGWdaxuUtKw6JpjFJMr+hfu/IBd4RhRE87zm47Qqc8fYA1
         BXDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976956; x=1778581756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jq6G9SCADZgi5j8IAt02Ku+HE9Gjzrrr5m74sKn8VBQ=;
        b=Qb/Kc4FyAP7KyaJjJ8gzRakRYZBKtvLknheIXh9wESEPd/6H8uCJai8KGWXGPvDBqX
         mVx6STquCIOst5snoXFUkMKs+SKfX3eWVlyGnzugSwQllDfpat7gPWXbasIEgxfHNWGU
         IFM5RUUQ99erlkcbuA8aE/pZ1+59wbP85IgD4CG8vKQ5EFLtqF5TcDq7RiwMb+/5SARG
         RX5OqIVF5Z/3bBrjTLaB072ZfdzxFesIcC6c7dvgA7uFCAyz7kCAHa0nMpQdzrPwYrXw
         1tPf8QYkTHbVDlWcRF7krF3LnG1kFQgMvgxc0a1mYgKLFG/uedYfIGy3/CUCq6agSISp
         mCHQ==
X-Forwarded-Encrypted: i=1; AFNElJ/F8P8+wp0h4rfwRAZ+jhmaQ5i7uXsHNCVSiSx0FrOSkYy6QDUWUQ0s9w54DkorQf/iCV0FeZ0MO7k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzZT4pnhBy4cehE8L6VAl5r4GzBhQXPhcHElOgIcswQt9tanvts
	VDuFJDrFRs8ztVpTn+ybxOZcxv75pVEx81sBntwQNAH/wbiTLGIUqrEpjYyt3Q1sERI=
X-Gm-Gg: AeBDieuyLa3CRtb4iZcb7V/2afJQcAJeCpZh2VcHGMOFNvvtDlcIT4Upn2cT+mkEgx8
	DjR95co2uMkxkovNypyS4gCUahBQ4zTd0I8Imzhj+pDUbLdmbE4cVKUqSj1XiB0q9vsPtjT7QoR
	Gyg1ed3zEhxd4Fetv+rzzZl9RtJpzrsxX4XbCIo8450a05fOV8YR0/vIGF0g8NI3WCW8VG2/2V1
	eTDm5C8dFMTEkMHGFWnC7yIXxbmbof/AeS8fsNj65YBSvgqJiQkIQlwIoT0Z5JmCf3nOXcTIfG4
	bH1nrTRFWjTlg+NgDakKwHiIS2dh7nxjSTvZw/DzWXnfiaGnsy3W7S1Whcjn/xJRjg0mIuWDOh/
	0f8xBwKvpAcMs8qFbSQSznfBDBzyPc8G0BfqLxmIRVJSyIVtL8VozKJm9Zt8mcEvdwW3iUfhmyw
	1ZK+gETbcyoVNSqHmeFX6+596JBXbSz1yyab+9zJjjnFds0WwPZ29QxMGLHptykS+Ke2FuJApKM
	1yLNm1QK1xJktUxl7UBJZExyg==
X-Received: by 2002:a05:6000:2004:b0:449:d1f5:7101 with SMTP id ffacd0b85a97d-44fdcf887aamr5474975f8f.12.1777976956342;
        Tue, 05 May 2026 03:29:16 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH] xen/platform-pci: Simplify initialization of pci_device_id array
Date: Tue,  5 May 2026 12:29:09 +0200
Message-ID: <20260505102909.2380470-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1563; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=zfUmnTuMCPKl1uBG6shy+GoSAItHMkggjMydPWbUatc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBp+cZ149Ot8luyVHVeurVu/y5CpJvjXDg8c6mH8 bQwgQ+JvwOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCafnGdQAKCRCPgPtYfRL+ TlRPB/9EtPMzqvPbpzz9rvz0r8PM5VBvrovdLtaMiGTUp2UYkJT6HN7nesS9ghlDesSXQ22OEoJ THMHYGRsjMmAnI536nBTL8eh85DHcs9aLyb6TF1MRDx9Jmd60i1Nn7gWc5fhJ06X9FTsmkiD4iD eZSSrVEWEnzc1722cAvJO3G6OXXz3wJeZOgSEC1h+a2ZF4VodurfW85n7SDV0K3GppKUiFyUwkn RCbFL6azSsiXShHStGggI9wPpou/EduZuSW3nXA75BiCC63pGOhlc7mt0V3xpFADKN8R0z5i+fN B3jawWkKy6xL2MHnXjyjQZ5ssV9IjxNueknS0bq+BSq8LCdH
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1777976957-80E798B7-EC6DBB66/0/0
X-purgate-type: clean
X-purgate-size: 1565
X-Rspamd-Queue-Id: 2812C4CBF7B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:mid,baylibre.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,baylibre-com.20251104.gappssmtp.com:dkim];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:msp@baylibre.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[baylibre.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[baylibre-com.20251104.gappssmtp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

Instead of using a list initializer---that is hard to read unless you know
the structure of struct pci_device_id by heart---use the PCI_VDEVICE
macro to assign the needed values and drop all explicit but unneeded
zeros.

This doesn't introduce any changes to the compiled result of the array.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

this is a preparing change for making struct pci_device_id::driver_data
an anonymous union (similar to
https://lore.kernel.org/all/cover.1776579304.git.u.kleine-koenig@baylibre.com/).
This requires named initializers for .driver_data. Dropping the unused
assignment is still better.

Best regards
Uwe

 drivers/xen/platform-pci.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/xen/platform-pci.c b/drivers/xen/platform-pci.c
index 1db82da56db6..f2438232518c 100644
--- a/drivers/xen/platform-pci.c
+++ b/drivers/xen/platform-pci.c
@@ -174,11 +174,9 @@ static int platform_pci_probe(struct pci_dev *pdev,
 }
 
 static const struct pci_device_id platform_pci_tbl[] = {
-	{PCI_VENDOR_ID_XEN, PCI_DEVICE_ID_XEN_PLATFORM,
-		PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
-	{PCI_VENDOR_ID_XEN, PCI_DEVICE_ID_XEN_PLATFORM_XS61,
-		PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
-	{0,}
+	{ PCI_VDEVICE(XEN, PCI_DEVICE_ID_XEN_PLATFORM) },
+	{ PCI_VDEVICE(XEN, PCI_DEVICE_ID_XEN_PLATFORM_XS61) },
+	{ }
 };
 
 static const struct dev_pm_ops platform_pm_ops = {

base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.47.3


