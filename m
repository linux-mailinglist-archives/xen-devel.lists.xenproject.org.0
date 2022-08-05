Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB9258AAFB
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 14:44:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381155.615711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJwh8-0004uc-1s; Fri, 05 Aug 2022 12:44:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381155.615711; Fri, 05 Aug 2022 12:44:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJwh7-0004sZ-V0; Fri, 05 Aug 2022 12:44:49 +0000
Received: by outflank-mailman (input) for mailman id 381155;
 Fri, 05 Aug 2022 12:44:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gvBN=YJ=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oJwh6-0004jk-Rs
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 12:44:48 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63e07661-14bc-11ed-bd2e-47488cf2e6aa;
 Fri, 05 Aug 2022 14:44:48 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id j15so3150729wrr.2
 for <xen-devel@lists.xenproject.org>; Fri, 05 Aug 2022 05:44:48 -0700 (PDT)
Received: from uni.. ([2a02:587:ac1d:6c00:cdd9:ab5d:6d5c:1538])
 by smtp.googlemail.com with ESMTPSA id
 g11-20020a5d698b000000b0021eff2ecb31sm3993185wru.95.2022.08.05.05.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 05:44:47 -0700 (PDT)
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
X-Inumbo-ID: 63e07661-14bc-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=5QoU0mc2TWEv8sO0311kNKz03SKY0VN/lL0FOXSMxc8=;
        b=eAMeHqYn3TwvjihOdduYnbF1FZFVBn3rjuaFuL1Lc8Z5O51s1DqV8940tDa0fxwIRi
         Wj0dhBAc3qypEJVEu1P1yP5RQfg0E+e26ZVDeJc0M8xafpuchgGB6eOey4R8eFUHr146
         7GyrxIRZk3igngFt8IEhP/5HnySeva17u5wquB69IeEwvbCyalv6kj49/VCwtFDohJwp
         srgzJvpH30I7wrSt4bQkVa4ImQDwkp60kbFP/hDWbmPpaBzSJBXgHFcpvyfk333oMgCJ
         32a2jPrM6kTPjU0QBcFjeMK+2mxkBsEWeZkyi+fT06Q6mBxiGpd0QmZ8CNWgXurl1e/I
         D9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=5QoU0mc2TWEv8sO0311kNKz03SKY0VN/lL0FOXSMxc8=;
        b=bMnaDs7dVcHv3Ok05cHG4bnipwhXPF8gbTYrzCUV/lDpRpw23pZn+O03ksIq8MOLo5
         WEpn5+j/CFyQZMkqCeX0YUTj5XQVueNxNwT/QBb3DfscerDT7dRNS+blm8hfnPMcpuLk
         bhNMtA3TSpfDPay1DDfhoNhtOpHyC4oDtZnZab211nOhD7TG3tsOT9HlZSRFoJ5w+lLZ
         0pVkXllq2/PyacRLRdpOCoEfnx605yxW4UMRQR4H7dgO5i08+xJT1C2QIfFi2mUJpf7+
         dwppBdAO7ksNsp4xulccRVn9B+hrkoW5cic6zOx6nIpwQIQsFqCVgJnkJ2ZIrWjmOVNH
         Ckvw==
X-Gm-Message-State: ACgBeo0fhsx6khqEaLo98g5SjdKy8HuHzt0L3dWoX7Ld3MnP3AfuH/mT
	1kebT0/+EqhOS0KM6Gh6Kja4sWZR6I8=
X-Google-Smtp-Source: AA6agR4RcMWd4ceoG8ZP6qhSNeKcMR8r4w0CR+VYY/gkjAJQfgLQLqW72r9UcAXrN8PUXaPL0M3NBQ==
X-Received: by 2002:adf:fbd2:0:b0:21e:7f74:5df1 with SMTP id d18-20020adffbd2000000b0021e7f745df1mr4201846wrs.43.1659703487404;
        Fri, 05 Aug 2022 05:44:47 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 0/3] xen/cpu: Minor coding style fixes
Date: Fri,  5 Aug 2022 15:44:39 +0300
Message-Id: <20220805124442.1857692-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xenia Ragiadakou (3):
  xen/cpu: Fix MISRA C 2012 Rule 20.7 violation
  xen/cpu: Add missing white space around arithmetic operators
  xen/cpu: Undefine MASK_DECLARE_ macros after their usage

 xen/common/cpu.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

-- 
2.34.1


