Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 306F6A9CBB8
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 16:32:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968182.1357859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8K68-0003qD-JT; Fri, 25 Apr 2025 14:32:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968182.1357859; Fri, 25 Apr 2025 14:32:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8K68-0003oB-GY; Fri, 25 Apr 2025 14:32:12 +0000
Received: by outflank-mailman (input) for mailman id 968182;
 Fri, 25 Apr 2025 14:32:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b9qI=XL=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1u8K66-0003o0-7X
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 14:32:10 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 114f80d6-21e2-11f0-9eb3-5ba50f476ded;
 Fri, 25 Apr 2025 16:32:08 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-54d65cb6e8aso2941489e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 25 Apr 2025 07:32:08 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cc9e883sm632540e87.133.2025.04.25.07.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 07:32:06 -0700 (PDT)
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
X-Inumbo-ID: 114f80d6-21e2-11f0-9eb3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745591528; x=1746196328; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=azeeqSY8CzJ4Bp0LEe7Hpbdx1EyTNPLikM5147epRk8=;
        b=IB7WaTjj5aJ49u0YnLym0YIjbf425Qzyi0J6wT6aRHxGxri1mxkCcWUo0bwDbxeaAs
         TX4lv3lQ8+BOX7Mgy9/YMr3zXUKe8YDWToZmAXB18NiLyI4kWQkIuAnT0KYFZX2bW2IN
         +CCJnuM0MvBqED2r0dmhWQ/ABWO2ZbZq2ys/JrFkt7AnIjv34BnoB6gFgZus8UwpPsuU
         LqqRYNsMPXvRFcGB+nMBk0BpsGJhLYbVG0KRWw5IgwY73kq5A5eUj+ezGwiJYPrl+jOZ
         5FHh5OzHUXInupPM2e9Bxv+KSPuZpxAG9/Pnuuc36t0rEKIJo3GQ2Qg7NgrXOumQugol
         K1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745591528; x=1746196328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=azeeqSY8CzJ4Bp0LEe7Hpbdx1EyTNPLikM5147epRk8=;
        b=df0RNklHFjxDcVrv2bOUv4fHEfaXJIWS4m7qPyw0+wDeToeq+Du6lhsQYTXQZsNP95
         jn3ZiSowyUfUxF08mqYlt2L8Md/9JzORNfw4E56koUq/z1rGBheu7nf26i9vgdPq/1GB
         8lMq41uAFd/E/lKZrDUYdLBfmpYV2IynbM0OKk+9Om5sVu2/zunxKT9v54wiXIv+gBtW
         mIgKfxWKmXq5txCho+Ncfmy7SYENDe8kEaa0IsYSIPtwLsZdZCEMOvN3GbcrVugwDxsl
         ofXBJ7v6pqZe85TPVikD3tg3vVNHXtCcQNJ1ck8Sn/evKiiUsE66upT4ZHoS2mr6b6gQ
         uj9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUkOcDUCMq7PgFfpOdaDwzGV1k5jaYDPrnTTb3SSecsuhpZs93QWVfRtT0J+Elmgy2y4Xw86FeIhq8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxzN8kGIo76Qw+6jyvXcbg7T1+bwdDT4crZnMeCLQxaKfj64ZpN
	OygoOcjAK3XvTjIfipMbds3niKE75jNRTcq1+aY59mzWpD+pEkBV/+sJFIoNHk8=
X-Gm-Gg: ASbGncsP/j94lg2g+itH5eMuwIn6ctONV9wWBaX2H3BuuvzfXs/cKL83AwhiooejKBv
	VzcNtAqeZmgg0uwiyxEGbjg35a9GfcwhgB/oUoweFFDKCkgtJbphmUWXMP/DW7wKVHl0zsn8lKT
	jy2HSq5AV2iwr0MrGHXmJ0hPyuWg9f4Kaimlp3UMwqDXIm7cpDY1QH1NuxihqeWr6yhfFm5djFo
	Dx2sKcoTdRpMr9By+aIZTCPS6RN4EdNew5lvlPhGqAML7ritXJpIxd/1TJLAMnfpvULBZdaJg+z
	KPbZcjUUaI/PayFd9GcOdRxHJizdy2FSHvLONsNkt4PZ/DmG5sobjb/HIuGqKPvqxPplvtidUZv
	0V3dETL/FhQh0
X-Google-Smtp-Source: AGHT+IF6GoiPiuFmU1v0uNdbuCBJilb8xb2JfSTEgACYnhGTyApmLy4m47IQ+SEYeYHqhegvkysP7A==
X-Received: by 2002:a05:6512:10cf:b0:54b:f04:59e8 with SMTP id 2adb3069b0e04-54e8cbd55e2mr744424e87.23.1745591527794;
        Fri, 25 Apr 2025 07:32:07 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-stable@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org
Subject: [PATCH v1 0/1] xen: mapcache: grants: Fix mixup betwen ro and rw mappings
Date: Fri, 25 Apr 2025 16:31:55 +0200
Message-ID: <20250425143156.204452-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

This fixes an issue with grant mappings when a read-only
mapping is requested followed by a read-write mapping for
the same page. Today, we don't track write-ability and
read-write lookups hit on read-only entries.

This series is an attempt to fix this by splitting mapcache_grants
in two, a read-only and a read-write instance.

I tried a couple of other approaches, one was to speculatively
map grants as read-write and if mapping fails, then fall back
to read-only. This works but since Xen logs each failed grant
mapping, it gets noisy.

Another way is to track writeability per mapping in the cache
and modify the lookup logic to only hit on compatible mappings.
It works but adds more complexity to the lookup logic compared
with the split cache approach.
https://gitlab.com/edgar.iglesias/qemu/-/commits/edgar/grants-ro-rw-fix

Cheers,
Edgar

Edgar E. Iglesias (1):
  xen: mapcache: Split mapcache_grants by ro and rw

 hw/xen/xen-mapcache.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

-- 
2.43.0


