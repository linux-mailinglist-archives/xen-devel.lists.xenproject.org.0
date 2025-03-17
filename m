Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE98AA64E64
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 13:16:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916677.1321732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu9OU-0001GX-1V; Mon, 17 Mar 2025 12:16:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916677.1321732; Mon, 17 Mar 2025 12:16:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu9OT-0001F0-Tp; Mon, 17 Mar 2025 12:16:33 +0000
Received: by outflank-mailman (input) for mailman id 916677;
 Mon, 17 Mar 2025 12:16:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VoqB=WE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tu9OS-0000kV-HP
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 12:16:32 +0000
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [2607:f8b0:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8edfed1-0329-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 13:16:32 +0100 (CET)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-225df540edcso49176785ad.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 05:16:32 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-7371169c3desm7368772b3a.155.2025.03.17.05.16.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 05:16:29 -0700 (PDT)
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
X-Inumbo-ID: a8edfed1-0329-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742213790; x=1742818590; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4FOBbhCP0imDkUgjKqMbBcMw13NboVeuC+jJxhcpiYg=;
        b=I9zwihrvetcdZB8nhX6SKX6QOCuHWiiY915EjP5PEeBn5nd4AJnY62rUP9213njjj+
         dfkfdJJuTBhC2Zwfzxh9VohAecKexXJgeTTzOD/2KRcnBHFV2NjTcTkJhS21KJeFMN/G
         mCJjVx7cv272ovK7/u3QSuzNi83NvY+bahbiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742213790; x=1742818590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4FOBbhCP0imDkUgjKqMbBcMw13NboVeuC+jJxhcpiYg=;
        b=PXAC0vvARZ9ruxFWGoClOuDxAPR7gu7PfXFwzFaS1B1IGKJxlvdk+6I6fN3exA61/M
         zvR1tm01OBJKlmBZwVudqayCTSkZs/qQcWYzXOnO4nUZmvNubEgfAxoSY2MUgGvWGt80
         QxdFWsptA1jsr2NbYlCsOBE1if0D3/Lp5n5sllAs1h12FUr08GEcYkdQupZ62kXe6wGw
         HA40/a6q8KuyzTpIQ7ISxteSqMJvCfG0ZeX+JCNrC1/4t5jNZBY9sinoKCiYCGfv3QqG
         xKn8/E7JdOoch0mPQKS2JVBr/eJHOXPsV/AFX0RO9V22apKVg4zEKFoN5PZ3gew6o3FF
         j4kw==
X-Gm-Message-State: AOJu0YzezqNYXlcWPiw1YE8paJPbFILQ6XUqiFvf0r4kBpjVlXU4QNRu
	RhtnjO6ZUNHB4GkDQVK9pwP/RhvImV8vSYvpclzAueVYx/aKDswTEL9eay1fUD3Ln8kSpjkFb3R
	H
X-Gm-Gg: ASbGncvee/zfNKBmtz8VCAZrc1gf+fqJS2YOzyZ5zotVhssVMXrcp931FWtq7hRv3D4
	YOJZdnloxkkTWFn7D3j5tfc72zH6fZjTo0fiYrARr1zPBDPP3qCIHF/0HXqIgqGovEEfC7LxkM/
	AhIGJ6AylYG+gVIsEDzE3+d991XDPJpFF4f7zPEuFheXNcLMw/ZIfh4taXKLKISUL9hbhcDlaZv
	naZG0+L5gwc8Ewy9tqgdk2GKSlOmiH2Upn6yeRyfdvv34JfGQt0KhCq0dYC4NCtoDDDk+p6ruY+
	0QFz21WxbFehLhujRvbs6xfr2FJ17fmn6rvSzOrto4dg3Ang5sizECo=
X-Google-Smtp-Source: AGHT+IHujT+Wo9PhSePZ4ffaBUfBR8oQHSQsDQgGhoWR920enGK+d78uzn7H6xNSyWVz4JXhpdgxjw==
X-Received: by 2002:a05:6a00:80e:b0:736:b923:5323 with SMTP id d2e1a72fcca58-7371080d21dmr23154388b3a.10.1742213789947;
        Mon, 17 Mar 2025 05:16:29 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH 0/8] automation/cirrus-ci: add smoke tests of the FreeBSD builds
Date: Mon, 17 Mar 2025 13:16:08 +0100
Message-ID: <20250317121616.40687-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

The aim of the series is to introduce a basic set of smoke tests using
QEMU and XTF, to ensure some minimal run-time testing of the LLVM
toolchain generated Xen binary.

Roger Pau Monne (8):
  automation/cirrus-ci: add timestamps
  automation/cirrus-ci: update FreeBSD to 13.5
  automation/cirrus-ci: store Xen Kconfig before doing a build
  automation/cirrus-ci: use matrix keyword to generate per-version build
    tasks
  automation/cirrus-ci: build XTF
  automation/cirrus-ci: store XTF and Xen build artifacts
  automation/console.exp: do not assume expect is always at /usr/bin/
  automation/cirrus-ci: add smoke tests for the FreeBSD builds

 .cirrus.yml                    | 170 +++++++++++++++++++++++++--------
 CHANGELOG.md                   |   1 +
 automation/scripts/console.exp |   2 +-
 3 files changed, 133 insertions(+), 40 deletions(-)

-- 
2.48.1


