Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5811BB054EF
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 10:31:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043768.1413817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubb4O-00063A-Ey; Tue, 15 Jul 2025 08:31:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043768.1413817; Tue, 15 Jul 2025 08:31:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubb4O-00061d-BV; Tue, 15 Jul 2025 08:31:24 +0000
Received: by outflank-mailman (input) for mailman id 1043768;
 Tue, 15 Jul 2025 08:31:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V4bE=Z4=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1ubb4M-0005YW-Q0
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 08:31:22 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 156ee5cb-6156-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 10:31:20 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-456065d60a8so1278725e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 01:31:20 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560f22cd14sm84787075e9.30.2025.07.15.01.31.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 01:31:19 -0700 (PDT)
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
X-Inumbo-ID: 156ee5cb-6156-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752568279; x=1753173079; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vr3HAWcy3iR7RnCWpXjXk9ptcqN2sMtjI1FfiwT4ilQ=;
        b=PayESNHn8Rt0p7oUNeauFW14sQeHqy8CQ+xwjkAdxDKvu5vpaoR/g/swue2csOAVny
         EoZJJbwlf1VeRgrFaepVaJvhqPPJAXQafUSgV74ZOWrtXwFdpaExrLB2c0yPuDFvt883
         mytGQei9fZ4A4cz89ajhD2drTc9ANcI5ylJNvQXf58TMdmZfz+oSPf+kFNEfUZx7saJx
         c+0icVYpEOF/MAZ4+fSqK2rtmyWcQPLToJTIq/Eylo8cJzWbdJ0mf76bW2J769ywW6St
         ZVuWy2hI0IisNLFxKUvTdzXdpQOX5hU3bv1JHpjLp4UL7o77CS/bayY3oj70sfrrWl91
         f9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752568279; x=1753173079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vr3HAWcy3iR7RnCWpXjXk9ptcqN2sMtjI1FfiwT4ilQ=;
        b=UWP9/uTylz7f98IpD8kZR2yNVMeO7AdTCGsSwg42z6mXzqvL6q7xUCcHHhZYmqyw5w
         aX1DNKbTYVYMIsIhzq4AcG/IYG+R6Uc6GL16BGSWqkrw8c4ER/x/kWG6ohyLPHZC7Lc0
         SGhho1So62LEEzSWTeaNknPqMgH2h0xZqROSzZbv72vRvqn+Gk+qqQ8N88ZGQLqQRDqT
         jxr57ovYtqOXN014AEBbeDb6dZHEhzzCwOgC00bOpk6z6yhRctEKNKuzJM0E0c8yer7J
         g5jIXirVq53b5NR0iWyPNQh9dhQq+f6DIpuCcP7X+fKRXxDldybK80GkJwtRwVOo4F+1
         AQEQ==
X-Gm-Message-State: AOJu0Yy3pYUWrctWactTOLzUS+RtCjmMX3M9j7c/rL1k9YbbBtihL8Wb
	ZVmjP6lS1sZYcWDD0AGzzQ1MmNz+iaY0/kyVWqOywpf8X3bi69WYEND7sihSHA==
X-Gm-Gg: ASbGnctF6qd+xdZeNOm/BMHPbOctyrGy+uQS+RXYpXWlyou8U20NgpP/tYqmGO8e1LZ
	+MYwMZFDWZxMQMadtwSjFeLfJNJ6ys1hx0CaNrnnrXQEjOS5CcoEkEW/s08k7ViZCoy/oX5jVLy
	szQnyLnIQfG2cAiEO+hoAAvLfbeg2+wjXvZxWuyIq7kmT4Z/vJckq63JxsYDlPVQhwkqxtN2/Xz
	q2sQUza5xBgaBY10LSVtYOdyCR1Nww5e2zlsfs9GZxcFDxHkfAEq82iOAYtlcOx+LfpygOMCKDp
	P0/NR3HBHUHSfXCIeAmo3TeStR2pxPkosumnnZTLuMR2N9V7gkx+qnaTBb4kHSr1UPOJgqMOwQP
	7ut7ciHEi9VhCYGif2SlSB7Gd2sAOWmb2mLlUdyNm+y9vjgtZkLl0b0M0W7jns28OoAHP0vFwfW
	fQRchtmE7z5n05o9s1GOd/KA==
X-Google-Smtp-Source: AGHT+IE0IoqeQjYrVTJ4W+niRnqgN0QrX7h/6rUzm9znrMqEEXFRnJufxXJ7QUFkTa3XXTSMC7T6Aw==
X-Received: by 2002:a05:600c:3b89:b0:451:df07:f41e with SMTP id 5b1f17b1804b1-45629123a8dmr3514165e9.1.1752568279391;
        Tue, 15 Jul 2025 01:31:19 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v9 2/6] docs/man: Add altp2m_count parameter to the xl.cfg manual
Date: Tue, 15 Jul 2025 08:31:10 +0000
Message-Id: <ca85680d6c2d5993808b4bfd041bdfb544d9504e.1752568020.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1752568020.git.w1benny@gmail.com>
References: <cover.1752568020.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

Update manual pages to include detailed information about the altp2m_count
configuration parameter.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
Acked-by: Anthony PERARD <anthony.perard@vates.tech>
---
 docs/man/xl.cfg.5.pod.in | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 1d122982c6..5362fb0e9a 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2023,6 +2023,20 @@ a single guest HVM domain. B<This option is deprecated, use the option
 B<Note>: While the option "altp2mhvm" is deprecated, legacy applications for
 x86 systems will continue to work using it.
 
+=item B<altp2m_count=NUMBER>
+
+Specifies the maximum number of alternate-p2m views available to the guest.
+This setting is crucial in domain introspection scenarios that require
+multiple physical-to-machine (p2m) memory mappings to be established
+simultaneously.
+
+Enabling multiple p2m views may increase memory usage. It is advisable to
+review and adjust the B<shadow_memory> setting as necessary to accommodate
+the additional memory requirements.
+
+B<Note>: This option is ignored if B<altp2m> is disabled. The default value
+is 10.
+
 =item B<nestedhvm=BOOLEAN>
 
 Enable or disables guest access to hardware virtualisation features,
-- 
2.34.1


