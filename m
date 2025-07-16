Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD82B07EAF
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 22:16:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045623.1415767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc8Xk-0003wW-N0; Wed, 16 Jul 2025 20:15:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045623.1415767; Wed, 16 Jul 2025 20:15:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc8Xk-0003uu-JS; Wed, 16 Jul 2025 20:15:56 +0000
Received: by outflank-mailman (input) for mailman id 1045623;
 Wed, 16 Jul 2025 20:15:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2WS3=Z5=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uc8Xi-0003uZ-Uh
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 20:15:54 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id acbf28cc-6281-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 22:15:53 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3b39c46e1cfso32353f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 13:15:53 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e7f2e8csm30504145e9.5.2025.07.16.13.15.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 13:15:52 -0700 (PDT)
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
X-Inumbo-ID: acbf28cc-6281-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752696953; x=1753301753; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vr3HAWcy3iR7RnCWpXjXk9ptcqN2sMtjI1FfiwT4ilQ=;
        b=ZFrA7ZpBv4duqpUQ2MMsy0F9jSXlnTFF9Wmyr2Uz/hF7wGUwQTiKdQO679XdiJPpYc
         qbJkbdueTE5l4U7rRSy5QorjCy+fBtOkfOPtDmT2jvY3GXb4f06UmNv4PT1tqf0vK0ui
         1eSaiByXSQazzAqTp5qDNQWH56Fj/zlC/zwprMQPhtR8MzqGYFe8tJtzYyZNe1Mgwl3Z
         /iO9o0v4D1x/PFQ1Im9nfuh87PYIZQkxsFy4nsFSrQSWbYDoc9rewLp9mEhkazwmvsyt
         hxRdF+eF9YhjPWW08bLfoAQqXEaDSlc8E3EBvxqOtXV/AJuQueCTjkZlZ/9jwA/Foq6E
         3v+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752696953; x=1753301753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vr3HAWcy3iR7RnCWpXjXk9ptcqN2sMtjI1FfiwT4ilQ=;
        b=hAfgIi3hWLisEAWS4QKnwnaaozMp5K6VSdPLbvZvsPb9oRw2Y2q1bwUtIFVfPTPj5b
         5o5Lq+kDZMGFohbkgHnxJl0o2W5YqiAORFoJ7WD8LcUAJlldY1J+eLf3uQuKuYLc9RBr
         L9rtlYhlgQFipdPDVhGjLrslhfmXeQOZshHzi/xMLjWAbPrY/Xk5z/Oa3Ic4oxv43bX4
         rgOlCZyTR9LUxAVbIp+gWQ8SHIAmnprzAvhgsthYIFK2nUnrgYFV9vA2OTGa2hDAeqY4
         oFyvToA553MqxUg7BWwko173NUMGDWwfz9+TvnBVHQZIsIDUHCE5tFL2VajGZ+03DWLj
         t6gQ==
X-Gm-Message-State: AOJu0YwY6w2OCrtP8LJtgl0qqaYfQ9l05w4VF946a9OEOD1LeHNYjHu9
	EtuAgknDYLb0Cl+uEX8dg4UOrFRgEHJZcOXkp2Y+x3V5fEYNMP/YrSxkOZvCDQ==
X-Gm-Gg: ASbGnctTah4Us1Q/cNk98Jv1OXHpV7GjudDYTHXTkc3fD0JD2DCQhWr8dy0QoIeNEGY
	7T464RQb6fyZJZEk+WJRY4Oaaj06IGviho8daHOy6eLswQkI/tY2IfZU4wQl+0j3MY5Qv7RHRlF
	IqTB0bNnNTmgE12Hv7yHsrD866iWm0h8JgRQtaGiIxeWyUrzIAqwx7KJnf1YCAKk3Wfr/46sUUW
	j6YOg1GRRjvzrL2wiKm5BzUCiCIINpSPnnwbBZ647amizsgu4L9KkqSyznWebJQeOo7wQ/36JSY
	SgFTZPOK7JXfGCv2JE/tA2l0tNJcgk83fdxl7mW1YrZLAt9NLekfAHXxlIpKM0aYE2Zdl567li5
	dEGdm3iVETiqvZgc7FNiDn1Mil2W40IUxNScOjih2Y+KOAwVBETR+MkQnzIn8wAZsb5aTIlnRiB
	LlenDUbHCuh39KAg3Co2/L8w==
X-Google-Smtp-Source: AGHT+IHNXfcNe0myIz2D3lhRJdy2pFf2m1UWPB8saOVgP9AD1JAbBH+BBtmj35TCCkDj3ChfnyZU5Q==
X-Received: by 2002:a5d:64e2:0:b0:3a5:2dae:970f with SMTP id ffacd0b85a97d-3b60dd81736mr1506879f8f.13.1752696952748;
        Wed, 16 Jul 2025 13:15:52 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v10 2/9] docs/man: Add altp2m_count parameter to the xl.cfg manual
Date: Wed, 16 Jul 2025 20:15:32 +0000
Message-Id: <ca85680d6c2d5993808b4bfd041bdfb544d9504e.1752691429.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1752691429.git.w1benny@gmail.com>
References: <cover.1752691429.git.w1benny@gmail.com>
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


