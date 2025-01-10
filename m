Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78129A08C47
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 10:36:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869349.1280806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWBQk-0005dq-Cx; Fri, 10 Jan 2025 09:35:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869349.1280806; Fri, 10 Jan 2025 09:35:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWBQk-0005cE-8i; Fri, 10 Jan 2025 09:35:50 +0000
Received: by outflank-mailman (input) for mailman id 869349;
 Fri, 10 Jan 2025 09:35:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J0bo=UC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tWBQj-0005c8-62
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 09:35:49 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4600aef5-cf36-11ef-a0df-8be0dac302b0;
 Fri, 10 Jan 2025 10:35:48 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-aae81f4fdc4so377811166b.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jan 2025 01:35:48 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c905f0c9sm151901366b.19.2025.01.10.01.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 01:35:47 -0800 (PST)
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
X-Inumbo-ID: 4600aef5-cf36-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736501748; x=1737106548; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pETirQ8gMZHueGENb+NbJKwsttVKoOOQHvJbKrUYGcU=;
        b=aMNoyLAfsKsn8qab8N/nSE9ya1YFy9jMFthMcmSwllkVnUN1hx0QNMfkiWHXy9bggF
         2QXoA7IQmkgmiCE1vMn4LPnw++FY942hHAOZHqUiA7J3S3RnYhU9tBgrxN9XL4fERzGK
         +OqdSTOilRkI3nYNFDOyQm4Dhx28aoKj33eKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736501748; x=1737106548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pETirQ8gMZHueGENb+NbJKwsttVKoOOQHvJbKrUYGcU=;
        b=n1HvKTaQWqoJfbxVwzfKoBuUBD9NJIYUW582eseLTuMKVSGXTl8KtibPlC+7QWxGxm
         /HBtkCzbN/1EUg+qG4yxglrb3kH2BGKSvtJJJueVteISDLklYS1rC6r228yo+waz91Bz
         oQf4gAq7lnuWThd52x6oCCytCSv4as6zlGgb5pWoKEx5GnSF4EnJvqEUZW4SktbtEUj9
         pkcvHWqKM8V2eub+NCtkHhgI2bR5gcUZuTr/jpGb5T0bP3GPnTZ/NrhUAfH5+0e9BgMi
         JNIjrOJ7Dxk8PUU8bQAlleTe9DY426hVD6O7+GKn4DkAdJVHW49WUAQ1a9M/5ocos7vT
         EIJw==
X-Forwarded-Encrypted: i=1; AJvYcCXeCUUUrmeP6Y8iptxZIUk55pSgkyxuUYxVL0+lkoU7QKKtqNU9eL0Lq1l23Flt0qjYMvco1q3fAbc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxqtlbQbghByJz9H+sCd8EMsaO0CTxCFj/wrhH8o3CpqqjM2B3p
	s3q/TxWTwIyvAPcWPIeNENg5c3Dk87RGsStW725E3gsBOdRoGBm/uqF1l6yL1j4=
X-Gm-Gg: ASbGncs9OLwwyFR0TCAWcL6AwnRaDARRJJR1UZW87FH6dimUlRUiLv0+u8DOnuu7S+a
	vsjboNaz9XHLRIMi0me/E5NcuFKwK/Shblnjd5wrhY7M5ZBPIFzh7oGuQJIfwqGvInjK/S6FiK4
	JhK0RFk3y2Pj1G5XFZ8xBgnRsVhOqm+p+wTTf6NIjhEBEtSa6+BRFT+6QEYThSjqbw9rm2x+ZMR
	vbRgtSpK1htCaQUhb+4HAnoc8F7V2u4S2TIfq2FzL0fLj8CTn1iqN/wffavVM/JOjg=
X-Google-Smtp-Source: AGHT+IF9Q+tc7zeQFkrp5t8due6zm/61UjY1kpKR16BTxlfnx3CZQHqRQ9rAy0+5QTUyBVAxonI8fw==
X-Received: by 2002:a17:907:3e24:b0:aa6:7737:199c with SMTP id a640c23a62f3a-ab2ab6fd036mr73135066b.15.1736501747665;
        Fri, 10 Jan 2025 01:35:47 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: qemu-devel@nongnu.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org
Subject: [PATCH v2 0/2] xen: error handling and FreeBSD compatibility fixes
Date: Fri, 10 Jan 2025 10:35:29 +0100
Message-ID: <20250110093531.23221-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

First patch from David introduces a new helper to fetch xenstore nodes,
while second patch removes the usage of scanf related functions with the
"%ms" format specifier, as it's not supported by the FreeBSD scanf libc
implementation.

Thanks, Roger.

David Woodhouse (1):
  hw/xen: Add xs_node_read() helper function

Roger Pau Monné (1):
  xen: do not use '%ms' scanf specifier

 hw/block/xen-block.c            |  3 ++-
 hw/char/xen_console.c           | 14 ++++++++------
 hw/xen/trace-events             |  1 +
 hw/xen/xen-bus-helper.c         | 22 ++++++++++++++++++++++
 hw/xen/xen-bus.c                | 14 ++++++++++++--
 include/hw/xen/xen-bus-helper.h |  4 ++++
 include/hw/xen/xen-bus.h        |  1 +
 7 files changed, 50 insertions(+), 9 deletions(-)

-- 
2.46.0


