Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C62F5843D4C
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 11:53:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673900.1048451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV8DH-0005NH-Ma; Wed, 31 Jan 2024 10:53:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673900.1048451; Wed, 31 Jan 2024 10:53:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV8DH-0005Kg-Jx; Wed, 31 Jan 2024 10:53:03 +0000
Received: by outflank-mailman (input) for mailman id 673900;
 Wed, 31 Jan 2024 10:53:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/tZP=JJ=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1rV8DF-0005Ka-NH
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 10:53:01 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6a618e9-c026-11ee-8a43-1f161083a0e0;
 Wed, 31 Jan 2024 11:53:00 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-337d05b8942so3977332f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jan 2024 02:53:00 -0800 (PST)
Received: from fedora39.edvint-x-u ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 o1-20020a5d4081000000b0033ae50e2c6asm10585757wrp.83.2024.01.31.02.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jan 2024 02:52:59 -0800 (PST)
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
X-Inumbo-ID: e6a618e9-c026-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1706698379; x=1707303179; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sqcpMyubNBGDxVa/kmnrdlCvdP0FKIm2OllKjlPoGbY=;
        b=iWJSez+57xzL+9WM6KfJ41eFys2+InThLWHIrJ0X6ydoqC60gxD16IELDkxL0kcSLj
         1axjNTaQIyj/xgG40Xv1wSmE7U1zeOwVg4CgdvMXYgm41nakhSjUO/keRKPxxemkLada
         SI5x8n/xOzdlNrPUofT8mxWwpmbQoDN/ZAAE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706698379; x=1707303179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sqcpMyubNBGDxVa/kmnrdlCvdP0FKIm2OllKjlPoGbY=;
        b=DazpKtfMFXpsIINZ8ScVzBSLtuf8WCvjJ48DOnVzNM8MmWepLCv+VlvZsXWZ1xYAzi
         9MTSww0Y8Ji9MsDEFNKeJgmaccC94wgVH2bvaC//XhqeyiyYu0kA82MkbmOHJeaf6ffH
         Mvv533kgqqxJMosTeQS50euUPi94QkuripMa/Bf8fr+XPqBLnFQJ8497X7EQLO5w8p0x
         /X1jVG2aDvy02XkzdbDZJ5H1axNhlYd4vLJQniL/vkEAbYIWcpzzmvjkQiAY+H5ZU9uv
         nskfFlhFz+T83m9HlllBYSsm7CKJmORt+CJu3W3zMtMOfVUVt+/INI7shBnszJQZLOnD
         gsUA==
X-Gm-Message-State: AOJu0YwYrNMY7tHg1z8NoaXm7xWXucTpVRhLJFhRfXBB/8Lp4SgqMJfb
	iDI/XaCnl8Ct+GPn/balel3OTJjmTZxh5Z6StQD+BBUtSyuKq6782voHkzynRdO0HxPdeG9jDDT
	5AnQwNQ==
X-Google-Smtp-Source: AGHT+IFzRNHUP+siVc5t0N/Wc3YlJ+R+nyJtDIkictnRmYrLygi+7k5x6DEXWzeg2+RxAsx4+HurXA==
X-Received: by 2002:a5d:6b89:0:b0:33a:eda1:e68b with SMTP id n9-20020a5d6b89000000b0033aeda1e68bmr773755wrx.24.1706698379430;
        Wed, 31 Jan 2024 02:52:59 -0800 (PST)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1 0/2] reduce oxenstored quota processing overhead under load
Date: Wed, 31 Jan 2024 10:52:54 +0000
Message-ID: <cover.1706697858.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A recent stress test with 1000 VMs has shown that oxenstored spends ~40% of time in Quota.copy,
even when processing read-only xenstore commands.
Use an immutable data structure instead.

I have tested this in the gitlab CI here: https://gitlab.com/xen-project/people/edwintorok/xen/-/pipelines/1158302827
For convenience the changes in this (and the other series I sent out) are also available as a git repository:
https://gitlab.com/xen-project/people/edwintorok/xen/-/compare/private%2Fedvint%2Fdune1x...private%2Fedvint%2Fno-hashtbl-dev?from_project_id=47263871&straight=false

I haven't yet measured the speedup, but thought to send out the patch for review early.

Edwin Török (2):
  oxenstored: use Map instead of Hashtbl for quotas
  oxenstored: make Quota.t pure

 tools/ocaml/xenstored/quota.ml | 65 ++++++++++++++++++----------------
 tools/ocaml/xenstored/store.ml | 17 +++++----
 2 files changed, 44 insertions(+), 38 deletions(-)

-- 
2.43.0


