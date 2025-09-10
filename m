Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9121B52434
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 00:23:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1118860.1464506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwTDl-0001Wl-6W; Wed, 10 Sep 2025 22:23:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1118860.1464506; Wed, 10 Sep 2025 22:23:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwTDl-0001VB-3D; Wed, 10 Sep 2025 22:23:21 +0000
Received: by outflank-mailman (input) for mailman id 1118860;
 Wed, 10 Sep 2025 22:23:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kMwI=3V=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uwTDj-0001Ut-KV
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 22:23:19 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfb2e8a0-8e94-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 00:23:17 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45dfe95bbb7so966845e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Sep 2025 15:23:17 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e01ba9601sm2452195e9.23.2025.09.10.15.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 15:23:15 -0700 (PDT)
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
X-Inumbo-ID: bfb2e8a0-8e94-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1757542996; x=1758147796; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HlkCMCHL5vKi/TSpvzV5Z9BPGY7+wbhbMerflx8hDtc=;
        b=Iehxnw7e7EqyHHuV0DF5mk1UfToAh3qFwtEX69GexNixvNYh8EHXU9XHLgt3MzMnkf
         xQ9mLmQEtUyPrkBeFHFGQPYhrBZAaSWbhbdnaPQTJVU87KqbV7yy4ia1nXm0QX8jrmne
         24AeYwr3KTgmsPrnpm+GOVrthE8CUuIjRhz0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757542996; x=1758147796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HlkCMCHL5vKi/TSpvzV5Z9BPGY7+wbhbMerflx8hDtc=;
        b=uAaSj6uNgMZwG6vn55lV4Z0Ff4QCo3VZPWc/uy4LeYwd/IhBLnRFNizHKrw0T5iBLr
         fB2vtyH9S9vo/fqpaCDpV+m3AnLiR3eyyaFouCE7X6fJp3GqfoySVQGhwQ7KCNAqCdKJ
         3g2F60+mIJQ3AwvnMEuqVIoQTukfWVSTKmS6Pk6A53qRJABvhurzrrEJ6vn8WfXmiVRh
         R6UUqzdq+O9OA2mtBSDw9xBcC2UmhdhgCkgKIXkT/aPowtWJQG0LMiElqMqAcxDYp8P9
         Swf7iuY1NhWnwSwT5E/huFdH+sBtygxOuUCr8yYTnp9gWQnJdaoWHAguHWzeFWvNfLPA
         jNyQ==
X-Gm-Message-State: AOJu0YzinmsG3XYxFbqTktl4ZEJjIYyPeNNdVkSezXLC5ZlBDmLb1JnU
	n8DrAwMixFvznwR1HJTvprcIH3Gk9YPrRcdnAIt4ah8PoBCgDxEWVvaaK7ngajjBKnKZRDhT6SZ
	wz/Uq
X-Gm-Gg: ASbGncsInQ3P6tncmNxv9A7L6X/6W+eknLjhVFILRZIwzNAB6s6/LSTrH6C/ngJ4j8V
	op/wngFxaL4gBYZoz7cKwlsgS4rGMzuivk/onLcgMrIB84h5lRxA6geA/kzXTmmY2z/3YWpcBbM
	/u7AL1UOjHmbw2CpjT04yhvLjsMAnZWg2pWodKo4roMbaJ6Eo3cn5/03mWkPg+25h+WaiB5LEdH
	1K1lajcF3sIkaBW8Jis6iGZQNBqTgHrHVdvMC8hD9L5xuTkLjTyTUoYWTFYyR7sQs3QIUKXosxE
	WzvJkEG8spsst9r5OrsohGG2TpDDhuflY42NYpmmy85z1BkGwXfTbIyEX7hSHnCQgMKmhDIKI4M
	4jALT3lu62HmtEbExg9ZqrBlCgn5dEmlonqMBOgxi2KwUOkv45pqme9vRSW7hPvghOk/fAABlv3
	gKNrnTDbCZZ+Y=
X-Google-Smtp-Source: AGHT+IHCHjynZ6xrP4i5Gypcv4UUV+H8pbYMVE/XZKEjMRTVYnwVtaWsbMH0B4H2yoHuAqagH2T5zg==
X-Received: by 2002:a05:600c:1d26:b0:45b:90fc:1ede with SMTP id 5b1f17b1804b1-45ddde6a436mr166145185e9.6.1757542996321;
        Wed, 10 Sep 2025 15:23:16 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v2 0/3] CI: Add Debian Trixie
Date: Wed, 10 Sep 2025 23:23:10 +0100
Message-Id: <20250910222313.1858941-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Refreshed the Trixie series.  Update containerize, and change one x86
container to be rootless.  Add some changelog notes.

These containers are already built and deployed for people to test with.

Andrew Cooper (3):
  CI: Update ppc64 to use Debian Trixie
  CI: Update x86 to use Debian Trixie
  CHANGELOG: Notes about distro changes in CI

 CHANGELOG.md                                  |  3 +
 automation/build/debian/13-ppc64le.dockerfile | 37 +++++++++
 automation/build/debian/13-x86_32.dockerfile  | 51 +++++++++++++
 automation/build/debian/13-x86_64.dockerfile  | 76 +++++++++++++++++++
 automation/gitlab-ci/build.yaml               | 72 ++++++++++++++----
 automation/gitlab-ci/test.yaml                | 12 +--
 automation/scripts/containerize               |  4 +-
 7 files changed, 234 insertions(+), 21 deletions(-)
 create mode 100644 automation/build/debian/13-ppc64le.dockerfile
 create mode 100644 automation/build/debian/13-x86_32.dockerfile
 create mode 100644 automation/build/debian/13-x86_64.dockerfile

-- 
2.39.5


