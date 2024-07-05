Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46424928D7A
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2024 20:24:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.754478.1162935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPnaa-0006rU-Jl; Fri, 05 Jul 2024 18:23:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 754478.1162935; Fri, 05 Jul 2024 18:23:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPnaa-0006ot-Dd; Fri, 05 Jul 2024 18:23:20 +0000
Received: by outflank-mailman (input) for mailman id 754478;
 Fri, 05 Jul 2024 18:23:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A4R/=OF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sPnaY-0006of-TI
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2024 18:23:18 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5d4bf1b-3afb-11ef-bbfb-fd08da9f4363;
 Fri, 05 Jul 2024 20:23:16 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-57cb9a370ddso2602211a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jul 2024 11:23:16 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-58f9d3f11ffsm1084696a12.67.2024.07.05.11.23.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 11:23:13 -0700 (PDT)
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
X-Inumbo-ID: a5d4bf1b-3afb-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720203795; x=1720808595; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ykZjKbXh9UmKyZo8fjcIZ1I5BuCpnN4JJtWIO/GSyng=;
        b=Gj9c/16TEqC8l7rnEoWE0malHtA+QhHqN8gp2s08dLPo+as71qs4+a46dXs8q9TTfx
         /GBy8NDs+uqDsHHVGlfgKL3JxBTBFGCwEBNknRuhL4cloQa/2DJjpmZEit01CGMXncLV
         6UN4anuzECJVWSFTTc7LfgAV6UR9hZHHat/UE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720203795; x=1720808595;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ykZjKbXh9UmKyZo8fjcIZ1I5BuCpnN4JJtWIO/GSyng=;
        b=hGTn9fNd3S5OPjQ4xCw5KOIueN31cfD2T4r6AvIxFPaHCJ0GspMoovQI75g2aqIKA5
         dZEM8jnt1iVYp8DtabYYtGYfqpiQJxr/bDDEAA+IStS9euRzuobKbX7Z+QFfH6jCp/31
         SO0BUE8Excln8Z+xvRxPL6pDyN21Sp+boch37kPxGuH5aUTN6HxHOo8IcoVXs6z/Z853
         AU4IhGxTa67PO6OLRHMQJ5EcnjCJlzIUEC6mNJlrvvqHrdXZkYhpoMcmXP2fYxjJzxf6
         Lu8Zg4eLf6x7D/tR75o74ygMC/k+N06i8E08i9Ts2BS6nHaUubzcJ8j3wViHgsUZUpEY
         5w9g==
X-Gm-Message-State: AOJu0YwdAbNaRZoMsFCaYUKiRXdL8v9cObzQg+S7HEhoxdvNwdRVk9Rn
	Tvk/CePqRMqfFT8poA3MvOIPxbqU6YuR32ScfCxlPgIKQshwcyMINwv9ZDo0M0GfQJhuKlp52Zm
	7
X-Google-Smtp-Source: AGHT+IHjQc78kY0IfYHTpBEqA9L6mCyX6+TwII3IdXPZPbtoARlqaKBIKEN9sVECxLQ6/rjZ9HIhTw==
X-Received: by 2002:a05:6402:524b:b0:57c:7486:3f7d with SMTP id 4fb4d7f45d1cf-58e59d3b3efmr4081018a12.19.1720203795073;
        Fri, 05 Jul 2024 11:23:15 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH 0/2] ppc/shutdown: Implement machine_{halt,restart}()
Date: Fri,  5 Jul 2024 19:23:09 +0100
Message-Id: <20240705182311.1968790-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I got bored testing fixes to the gitlab containers.

Oleksii: There's almost certainly a related change suitable for RISC-V.

Andrew Cooper (2):
  xen/shutdown: Fix build issue with shutdown.h on PPC
  ppc/shutdown: Implement machine_{halt,restart}()

 xen/arch/ppc/Makefile           |  1 +
 xen/arch/ppc/ppc64/opal-calls.S |  4 +++
 xen/arch/ppc/setup.c            |  8 +++---
 xen/arch/ppc/shutdown.c         | 43 +++++++++++++++++++++++++++++++++
 xen/arch/ppc/stubs.c            | 12 ---------
 xen/common/shutdown.c           |  4 +--
 xen/include/xen/shutdown.h      |  3 ++-
 7 files changed, 55 insertions(+), 20 deletions(-)
 create mode 100644 xen/arch/ppc/shutdown.c


base-commit: c2a66d0b58b9661037cfed6bf3f8122b3363ca38
-- 
2.39.2


