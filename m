Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C95678EAA
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 04:01:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483381.749529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK9Xn-0006gy-EH; Tue, 24 Jan 2023 03:00:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483381.749529; Tue, 24 Jan 2023 03:00:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK9Xn-0006fJ-8T; Tue, 24 Jan 2023 03:00:19 +0000
Received: by outflank-mailman (input) for mailman id 483381;
 Tue, 24 Jan 2023 03:00:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=25we=5V=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pK9Xm-0006f9-3Q
 for xen-devel@lists.xenproject.org; Tue, 24 Jan 2023 03:00:18 +0000
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [2607:f8b0:4864:20::f36])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a8faeb9-9b93-11ed-91b6-6bf2151ebd3b;
 Tue, 24 Jan 2023 04:00:17 +0100 (CET)
Received: by mail-qv1-xf36.google.com with SMTP id g10so10772879qvo.6
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jan 2023 19:00:16 -0800 (PST)
Received: from shine.lan ([2001:470:8:67e:5892:c1fa:86fb:7cb6])
 by smtp.gmail.com with ESMTPSA id
 72-20020a37074b000000b00706c1fc62desm602498qkh.112.2023.01.23.19.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 19:00:14 -0800 (PST)
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
X-Inumbo-ID: 3a8faeb9-9b93-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L76zDfRTj/n0Xuzc86WBC7BClE4At9jWssMD/edYJas=;
        b=LNxVpcwQMhdFJpTIhVwDBKVFSLKxn/oNLsonu6fujZjczRa5j6XIAr1P2njPyu64Md
         yeTDx67Qang/461h/qd7OjNJNEVkrNt+kNnX84vDGFMIdvdjTDLUGBzB99yGisfP6BPy
         Z21lF4u076Ol0f1XgQ7GUjVDM41IIuJHe0UKE5Cx4X2IVDcTNXgmwLIqow7BQEJuZG26
         5yqOaaLXtdo9EXB14Qc1AwGqX0PZv8oOCpRkCmtmzq0dMHVV3GWDhgLh+6yUrx6boiGa
         Wm+wsZTQExG2N/MGqmCvm/3p7H8u3TNzRRU196lW5itufHpe0e52UEPBL2qKLNUylfwT
         /T6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L76zDfRTj/n0Xuzc86WBC7BClE4At9jWssMD/edYJas=;
        b=0L3ErUt3NZzjoEmS2mA4ECuNZ3jzZGHgQTXaalWncgiZX6IjohLnZ7dhcSX4q4NiDY
         /vFqKLahdiIUrry4LginyA1Nuq0mkLGiN//DWlIwtJs6bt9jFMzHSm3cD1obnAsalLYE
         N+DgGaKUZXGO5aIiHDWWC6qTMIcxHtffBxCkhKtyfgDuR8OrYIggBqUnYhXuQkoh3Jow
         COv7+Eow9LtG2UHpzShAw1LDCpdWVkl98VRupxTz3qp21ju4wYmgHGBiMy8pN87yvSLJ
         TeL6OPS8Rv436yjEVLCyjxzmX0mtg/ouakdD77WQx1kljQXgPw6ywmsUTpOQno+VxGZn
         lRKg==
X-Gm-Message-State: AFqh2krvJBY1WDCSBNe5od7R3ub9DOsrPcwuhheZQSa6gobouw2Fx9Pi
	rBDnInTs0nrpjG0qDW27Pep6RM8zbRQ=
X-Google-Smtp-Source: AMrXdXuf6hTJd+XVFgHH32png9t7hWkV/MOZt9I06AVbQcxwVBGbvPEBg+z7kbhI/bENBo1KDAjdoA==
X-Received: by 2002:a05:6214:b94:b0:531:c116:33c4 with SMTP id fe20-20020a0562140b9400b00531c11633c4mr41496092qvb.0.1674529215236;
        Mon, 23 Jan 2023 19:00:15 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Dongli Zhang <dongli.zhang@oracle.com>
Subject: [PATCH v2 0/2] tools: guest kexec fixes
Date: Mon, 23 Jan 2023 21:59:37 -0500
Message-Id: <20230124025939.6480-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two toolstack fixes for guest kexec.  This restored kexec enough that I
got Debian bullseye to kexec once.  Trying to kexec the guest a second
time had it spinning at 100% CPU after initiating the kexec.  Haven't
looked into that part yet.

Regards,
Jason

Jason Andryuk (2):
  libxl: Fix guest kexec - skip cpuid policy
  Revert "tools/xenstore: simplify loop handling connection I/O"

 tools/libs/light/libxl_create.c   |  2 ++
 tools/libs/light/libxl_dom.c      |  2 +-
 tools/libs/light/libxl_internal.h |  1 +
 tools/xenstore/xenstored_core.c   | 19 +++++++++++++++++--
 4 files changed, 21 insertions(+), 3 deletions(-)

-- 
2.34.1


