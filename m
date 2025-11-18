Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D65B1C6A5AE
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 16:40:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165058.1491908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLNo9-0005JU-9Y; Tue, 18 Nov 2025 15:39:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165058.1491908; Tue, 18 Nov 2025 15:39:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLNo9-0005H8-4R; Tue, 18 Nov 2025 15:39:53 +0000
Received: by outflank-mailman (input) for mailman id 1165058;
 Tue, 18 Nov 2025 15:39:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n9C8=52=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vLNo8-0004pf-7K
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 15:39:52 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1fbea06-c494-11f0-980a-7dc792cee155;
 Tue, 18 Nov 2025 16:39:50 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-644f90587e5so2210502a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Nov 2025 07:39:50 -0800 (PST)
Received: from EPUAKYIW02F7.. (pool185-5-253-54.as6723.net. [185.5.253.54])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fd80d27sm1391385266b.40.2025.11.18.07.39.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 07:39:49 -0800 (PST)
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
X-Inumbo-ID: d1fbea06-c494-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763480390; x=1764085190; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+IE/6U2/jxx06UiTUo+lX1PbDac7ac5Ki4u3TKrSREY=;
        b=ae5z4BfSyT1L7yg6+zC2NbkvzxbnuhyPg2NEfeTy4cPv9XOF8HfUbnskMJhujoWobI
         T7ZCi3Lz+uxW8a8A1e1gALMflkNk94TinDMkQgiBybUZf86d67oOc2EywKJ2xMf7ylE2
         fRARnOomheo524Rj55F/jDb8cu6nBSwlNrP0JeVPte0190FX/lh28t510p7sMxLp42/d
         /Qj9xh4fPOElwaRg08KiPEM1YkXrVZvmP+V00zn0DQB4K6lrdRMW0FLgdIVYlSm7H493
         lxM39GO7QbWE5wBue8DkkV1V6U/4mowMGXAhH/Wrv2XT0a8R+vHKiRnqyXnwtFlomCic
         spoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763480390; x=1764085190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+IE/6U2/jxx06UiTUo+lX1PbDac7ac5Ki4u3TKrSREY=;
        b=SjqHuuDraT9xm7tc0S46pmB9smjxzOFujicPkljOZkS9CReC3fzXQX4JG5iUZTeYeI
         xh6wSfI1b71zjS+FI0QpGQSyCL4InSq3moaes7e3JK3/33vfnDUb3HK6QZQdaZHZdmzI
         JjtZxYGjc2kGYcA+EJ/K4WTXrMFzsC9p5zpvZGW+BH+WkKtIU0zL04oLfmKhNRYhcABh
         dTTvo0K0nP3leJSbBx6aaY/+cOPPZiOtqONLrhtj6yH82Z6cATnAc3FfNQzB8DTndfzX
         0e1uWS5fOIdu4BJevZzs6efN4HlJp92XrKmAHSYinQC5RbbmWJ+e9ww0/jwmTucBCjNM
         V57Q==
X-Gm-Message-State: AOJu0Yw3uQ5Hc8IxciCSLtaXSyiU1hJQdBHGtEcSMjmuIVONotcbCvvk
	4HNB/x/kuQ776URgwVRekMdUCIrfaJNyT7hXmyxg3IQ6XxSwo/+I5W9hQvU+OSsss5g=
X-Gm-Gg: ASbGncvEiCzeOt3q3x7cMxsLEpIp+WquGJLtMKdc5B8gO728rs+qXCZ6K92rLXI7IvQ
	6AwW2U7Us0iF7ZArBCAoo/ppSPWssIxEjl6NqodmiUNYW+iQ1cklYChPWjWabzSuIJ/Fu7LwvBy
	8HgVgWjbvMu6NbZtNTHIcJaB70GIU38svM01rznb4mnVLqDD+luWpM1Iw0bdwBoxyWSoJFzQhRV
	ONc78Ivh943UQvZOs3zaA3EeZxiKhbifnGhj7noghBBFX1UPl/9FNPY2Epl2RAcf8XTch04j6S+
	WrH0HJDY3WRIuPKJCfuPSSudXkRCuVqmsX5ohIOOXzflChxnLZkxXhJnY/bxrMTrElp/lZzrs/G
	WKapJprI6+5WMae0pz+b2t7pRL6V6qhAKvSUd9GkzNmV6TtmC4Ln7gfuUY7QOLra4l7kU/bTUnS
	IYP20u0mp0nqg4gSmyH0ZQ7bHlmGupAhzK6EokACoODeA=
X-Google-Smtp-Source: AGHT+IGspqpLQVqJEfAtmfmsTcS7G26/37S4TaDKtxuqTB51rg7iKd6MO9sAN/Y4UCS40Wfj9i9PUg==
X-Received: by 2002:a17:907:1c01:b0:b0e:d477:4972 with SMTP id a640c23a62f3a-b736780c3b1mr1466748066b.25.1763480389685;
        Tue, 18 Nov 2025 07:39:49 -0800 (PST)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v14 3/4] SUPPORT.md: Document PSCI SYSTEM_SUSPEND support for guests
Date: Tue, 18 Nov 2025 17:37:30 +0200
Message-ID: <aacae215d49a6cc96f4add793c6637d2fced8ddd.1763479083.git.xakep.amatop@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763479083.git.xakep.amatop@gmail.com>
References: <cover.1763479083.git.xakep.amatop@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

Add a new entry under the "Virtual Hardware, Hypervisor" section
documenting support for the optional PSCI SYSTEM_SUSPEND function
exposed to guests.

This function is available via the virtual PSCI interface and allows
guest domains (domUs) to initiate system suspend operations.

The feature is currently marked as "Tech Preview".

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
Changes in V14:
- fixes in commit message.
---
 SUPPORT.md | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index d441bccf37..8e7ab7cb3e 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -962,8 +962,9 @@ Emulated PSCI interface exposed to guests. We support all mandatory
 functions of PSCI 1.1. See below for the list of optional PSCI call
 implemented and their status.
 
-   Status, Mandatory: Supported
-   Status, MIGRATE_INFO_TYPE: Supported
+    Status, Mandatory: Supported
+    Status, MIGRATE_INFO_TYPE: Supported
+    Status, SYSTEM_SUSPEND: Tech Preview
 
 ## Virtual Hardware, QEMU
 
-- 
2.43.0


