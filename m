Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C2BA33FF9
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 14:12:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887556.1297026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiZ0Z-0008DN-35; Thu, 13 Feb 2025 13:11:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887556.1297026; Thu, 13 Feb 2025 13:11:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiZ0Z-0008B2-0P; Thu, 13 Feb 2025 13:11:59 +0000
Received: by outflank-mailman (input) for mailman id 887556;
 Thu, 13 Feb 2025 13:11:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZhyQ=VE=cloud.com=andrii.sultanov@srs-se1.protection.inumbo.net>)
 id 1tiYsK-0000vx-D7
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 13:03:28 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea870444-ea0a-11ef-a075-877d107080fb;
 Thu, 13 Feb 2025 14:03:27 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-aaeec07b705so135150766b.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2025 05:03:27 -0800 (PST)
Received: from CSGPROD238885.citrite.net
 (cpc92320-cmbg19-2-0-cust1786.5-4.cable.virginm.net. [82.13.70.251])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba532802a1sm129340366b.76.2025.02.13.05.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 05:03:21 -0800 (PST)
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
X-Inumbo-ID: ea870444-ea0a-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1739451807; x=1740056607; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SZNuIlSry1IawXwXrlF5dR7aNutHGhSmqaGhnjzizx0=;
        b=ZMzuLuTDmSWeU2s0pN5lC7B2Arn6+TS3U4zJgkg1CCFr793mnPus9V6M5FQt4TUNJ5
         p5DYhOMg948cH3tG87ZeEF3m2TPwJbFLS8m+9xl2cv6fE5qbxlY5IEJSIDNYBBMkjGQe
         oR8ZDbxWrY5LinwFH8HodEuYhHngywbkm9R1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739451807; x=1740056607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SZNuIlSry1IawXwXrlF5dR7aNutHGhSmqaGhnjzizx0=;
        b=Na0NOxNPbcZtApSqBzIztGbsRqkaRwfhD/Y3fTyAKP6RBdwliwpNrxFDEGz9Zme0PS
         xoOXnDuk4jHhDcR3tbCSC8D6EJcoLgIcxOhXSJnDhzXCmTmJ7QEeLArv9b3m0RN83ClE
         ZMSY6cmPgMzypzOMwSGG04Lt0Hjc6khHOZn4TALiQ9dhCKvmwEdqesXWECbd2UraLXlF
         aJ0y0orTXgJXzCCMbtdHNo5wGspVg3D70wopZPRj7C51PkUp9bHdtP8vP4QY5v0Ja8qs
         jhJHOrRiRBKeQX/ETMFt0DTYGcsnYf9dUSSUQYmFl3U+NejgIE6c3XNH62lspK3woBdw
         cdQw==
X-Gm-Message-State: AOJu0YxkBPmU9eZzEwQ/JcIRsmhyGYGT2DPV+4Sc4IUfSNcwahxXQ9C7
	JiIgmcbSjG7/g1kFq0z/oh/WSRRiPt+B23NInCJtjIID/O53G2sRBngQAmAH3b0vx4N00OTgdQ2
	1
X-Gm-Gg: ASbGnctKTgaYnoD39fiLQ26HPhTrRHKly0wAoVEgV0p59rW5juLy1JOikG4K+a4aZap
	ankn9zjtvCX1icRMQJVQq/I1ZdNgturihrC1a3TNd6JBBfDWwUzdaE5Fu3U1bNpv8Cuq1MtkXUD
	S/ngpHOXTGG9xqrdSPaJEBPGCFT+mCPHnCRh3Nw5P7Y+YGjn0yx4kwEO/nAGHukUTTo78oyefKQ
	YuKgDo1wMgF+LNgcTJ3gAqp3XCMarwm9GQjQFvmPDkdZzwIK9B2RcbhDBh1N0En9EjbUA/RaPPL
	Qjb8HjCfLptSwUmRnRupB5HDzmmTp37T5dbMjNf86uNbqTVIhRz7XIE5FkQQH+aZ0DjWHdxsFW4
	rLPorH6P8AgKhoS59alJ26Q==
X-Google-Smtp-Source: AGHT+IEUj9cCtx+WZC37p0uqsURCXw3Xgr+ByXr7/eV/WfksSHWRnDtF5h2lxx7ztpAsTkEo34sSMQ==
X-Received: by 2002:a17:907:7207:b0:ab7:f245:fbc1 with SMTP id a640c23a62f3a-ab7f336d4b0mr629764166b.3.1739451802045;
        Thu, 13 Feb 2025 05:03:22 -0800 (PST)
From: Andrii Sultanov <andrii.sultanov@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Andrii Sultanov <andrii.sultanov@cloud.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v1 0/1] Fix OCaml build warning
Date: Thu, 13 Feb 2025 13:03:16 +0000
Message-Id: <cover.1739451311.git.andrii.sultanov@cloud.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Andrii Sultanov (1):
  tools/ocaml: Fix oxenstored build warning

 tools/ocaml/xenstored/Makefile     |  1 +
 tools/ocaml/xenstored/perms.ml     |  2 +-
 tools/ocaml/xenstored/poll.ml      |  2 +-
 tools/ocaml/xenstored/process.ml   | 18 +++++++++---------
 tools/ocaml/xenstored/utils.ml     | 10 ++++++++--
 tools/ocaml/xenstored/xenstored.ml | 16 ++++++++--------
 6 files changed, 28 insertions(+), 21 deletions(-)

-- 
2.39.5


