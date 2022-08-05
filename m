Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A39D58B10C
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 23:18:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381516.616239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oK4hb-0007ZY-5e; Fri, 05 Aug 2022 21:17:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381516.616239; Fri, 05 Aug 2022 21:17:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oK4hb-0007XV-2N; Fri, 05 Aug 2022 21:17:51 +0000
Received: by outflank-mailman (input) for mailman id 381516;
 Fri, 05 Aug 2022 21:17:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gvBN=YJ=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oK4ha-0007XM-4H
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 21:17:50 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e8f1f67-1504-11ed-924f-1f966e50362f;
 Fri, 05 Aug 2022 23:17:49 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id l22so4517656wrz.7
 for <xen-devel@lists.xenproject.org>; Fri, 05 Aug 2022 14:17:48 -0700 (PDT)
Received: from uni.. ([2a02:587:ac1d:6c00:cdd9:ab5d:6d5c:1538])
 by smtp.googlemail.com with ESMTPSA id
 z9-20020a5d4d09000000b0021dd08ad8d7sm4833347wrt.46.2022.08.05.14.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 14:17:47 -0700 (PDT)
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
X-Inumbo-ID: 0e8f1f67-1504-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=U9oyGo2xK9qn/v4CR94onuln5ETzoejF6L9XxhBXwCk=;
        b=SvYg6n/dXePu4V843nj8d+0plQBewKILIQRL9YqL4D2PagYiNyVRDIT+9Y4Qt/9Tk7
         jJapaJ5QaFv1kGdqex8KjhtrJjLpP4LVEMcQoUzIroqGA7Dib2uzoxqDsnbDdxEbmNUB
         gVGjeOkA/J67DRPwArl47AnlNjdYx4avP53T2otn6ZRcSZC5E8Zu2n0VTKj9hN58zlCJ
         0mW4BKamJHF/KrdmN5a1wR+aC/4b5Hnn4tF//1Gk6YPURxyK7FeW8MUigmVfBLgxsyFe
         vw/GdtiZAesKQjq7qS45OOMuyTT1E33lwBuJ711pWx0NPRja22HeT+PwrY0ww3ZbGA53
         V8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=U9oyGo2xK9qn/v4CR94onuln5ETzoejF6L9XxhBXwCk=;
        b=MO93t8C1Y8LhO4WE4/QuCxUEtf4K+ulCp2FJxzkrFuj0jy/EABPqAPEA22SRHTLwtH
         e0opn2XTqpS5CmJFj2mVx/i6aWsiyX3ScLTEGI8L6HxyZ0vSByqzD4LKkSmVv9JhaDNA
         CNuc7SFKRmHaCqCFWKIVItcNqNShYdAPlr8JW08Ava30fo39LrCjmCpgQPCvw/oM8pkB
         j3kYM+8Whw4TOOGHMyi06vnYmk3Dbp8u6te/wbIX2Owbid9t9+Zh1l3zo0EhnOr2LaM2
         nQGdkgdyYVEGOrSDkcjABco/mfnz0bHCInICA/3hBRiVJ9lscN9wmboRilJLvj9QhzXI
         a/Iw==
X-Gm-Message-State: ACgBeo26hQMq6xtFx5nCcy8nl5ApHtS9aLu+3Lj1eToVF/YHLvdAJTlu
	pPaw7QQ/zqoqjItUp9Z5XidT+kiv2xk=
X-Google-Smtp-Source: AA6agR45mHKoEUaKa85DtqrmuKxottTAYeYU3g1NT4+XIaDZT5xE+LfO6Qq22kBmwcTwyvXzyVTc9A==
X-Received: by 2002:a5d:4345:0:b0:21a:3b82:ad57 with SMTP id u5-20020a5d4345000000b0021a3b82ad57mr5398632wrr.176.1659734268172;
        Fri, 05 Aug 2022 14:17:48 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/2] automation: Test a pv network interface under dom0less enhanced
Date: Sat,  6 Aug 2022 00:17:39 +0300
Message-Id: <20220805211741.1869068-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xenia Ragiadakou (2):
  automation: qemu-smoke-arm64: Use kernel 5.19
  automation: qemu-smoke-arm64: Run ping test over a pv network
    interface

 automation/gitlab-ci/build.yaml               | 11 +++++
 automation/gitlab-ci/test.yaml                | 10 +++--
 automation/scripts/qemu-smoke-arm64.sh        | 43 +++++++++++++++++--
 .../kernel/5.19-arm64v8.dockerfile            | 37 ++++++++++++++++
 4 files changed, 93 insertions(+), 8 deletions(-)
 create mode 100644 automation/tests-artifacts/kernel/5.19-arm64v8.dockerfile

-- 
2.34.1


