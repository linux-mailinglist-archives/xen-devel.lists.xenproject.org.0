Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 242D6843D08
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 11:43:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673883.1048412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV83U-0001M2-4c; Wed, 31 Jan 2024 10:42:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673883.1048412; Wed, 31 Jan 2024 10:42:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV83U-0001KT-1s; Wed, 31 Jan 2024 10:42:56 +0000
Received: by outflank-mailman (input) for mailman id 673883;
 Wed, 31 Jan 2024 10:42:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/tZP=JJ=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1rV83R-0001KI-QM
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 10:42:53 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c44744f-c025-11ee-8a43-1f161083a0e0;
 Wed, 31 Jan 2024 11:42:52 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-33ae38df9d2so2827077f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jan 2024 02:42:52 -0800 (PST)
Received: from fedora39.edvint-x-u ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 bk24-20020a0560001d9800b0033add8aa1d2sm12678460wrb.44.2024.01.31.02.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jan 2024 02:42:51 -0800 (PST)
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
X-Inumbo-ID: 7c44744f-c025-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1706697771; x=1707302571; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G9G6lN19S7UuH82NSIIjIF9gI4HbSZalaDbkGSamEmE=;
        b=N1pqHJkEdrHW9tT5PKMI93Ige+eFrvjVslGq73VbWaFMDSgqVsUIvHcuh1CSPS8uDa
         0Z+sOeRzbpqJL1KhRO5ufI4nq9RXpfBvq3qRqK5N5L6NsRUxTBimNUCYethWT+pMu0Za
         P3cCtOEMaBvzOf4r8Ciiq1m9M8ofNnssgA5CE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706697771; x=1707302571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G9G6lN19S7UuH82NSIIjIF9gI4HbSZalaDbkGSamEmE=;
        b=WryxZCnMqCTtju7afTdE7WnvatLAwfOD7hydX0pT3k30W3iIE8i3ls0Cka/nhPcoWU
         0W+I6DxVdAuRTpIbFSYM0hCJG5KcwLp8lP/CP1LOYCTiYnwWRs0z4KNXi6dYnHapv7wP
         q/QSwcp2FE4fpRN9gBTwmux3jGhd3SczBYgx2nak7cUi8VfBsJKbTZALxrZ4XxhcSMtt
         1bF+bSvyPmo/3Lnmw86omVHlGy5gBIiYVAc+7FDrqt9JMAXD72G+OxhKyda9CyLQmeiv
         2/0gxSs1jePgkcI1bL/uOaTJVcUlNwiiTWFruluzC1L28kAMAPadpQUTsL0VZHtzksiN
         phzg==
X-Gm-Message-State: AOJu0YzVaBxOYHvw5wpOvy86pFO5TvbV0nK/O71lmVeItAtFd3XfgM5Q
	t7Vnj/OH8v/YNwn/l88dhbIamBKzad9w5WOSJOQsu765xIWVLCj9bcByFGrmRsKj/zntCPoCIf/
	48iP9jQ==
X-Google-Smtp-Source: AGHT+IHdCD1CtDyCS9WTiqcitTydGCpHq8MQl7L4ZxcFKWR8lHK6/+1TO1K/oYAIfjEMHz2+7IUrtQ==
X-Received: by 2002:a5d:684a:0:b0:33b:3b5:39b6 with SMTP id o10-20020a5d684a000000b0033b03b539b6mr880639wrw.30.1706697771482;
        Wed, 31 Jan 2024 02:42:51 -0800 (PST)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>
Subject: [PATCH v1 0/2] tools/ocaml: support OCaml 5.x, drop support for <=4.05
Date: Wed, 31 Jan 2024 10:42:47 +0000
Message-ID: <cover.1706697216.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix building oxenstored with OCaml 5.x.
OCaml 5.x has removed some functions that have been deprecated for many years,
in order to support OCaml 5.x we need to drop support for OCaml 4.02.

Tested in gitlab CI (together with my other series):
https://gitlab.com/xen-project/people/edwintorok/xen/-/pipelines/1158302827

Edwin Török (2):
  oxenstored: fix build on OCaml 5.x
  tools/ocaml: bump minimum version to OCaml 4.05

 tools/configure               | 2 +-
 tools/configure.ac            | 2 +-
 tools/ocaml/xenstored/disk.ml | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.43.0


