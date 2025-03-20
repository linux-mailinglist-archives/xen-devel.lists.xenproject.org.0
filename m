Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7800A6AA76
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 16:59:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922809.1326630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvIIh-0004aF-7P; Thu, 20 Mar 2025 15:59:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922809.1326630; Thu, 20 Mar 2025 15:59:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvIIh-0004Yl-45; Thu, 20 Mar 2025 15:59:19 +0000
Received: by outflank-mailman (input) for mailman id 922809;
 Thu, 20 Mar 2025 15:59:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vaXX=WH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tvIIe-0004Bj-PX
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 15:59:16 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4639a056-05a4-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 16:59:16 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43cf628cb14so14414285e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 08:59:16 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d4fceafacsm1851225e9.6.2025.03.20.08.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 08:59:14 -0700 (PDT)
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
X-Inumbo-ID: 4639a056-05a4-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742486355; x=1743091155; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L/8OKxq5tdUvL+relQi7wdXNnmHOUxgp/8lJVL44Vxo=;
        b=T1H6exlkhnFbiyyvi0+rwBhszk3FOodw1074+EwmRbnvN+XVuFNmPu2zuTZ8/PzxZd
         N16a/Uk/4yUGLnl6LHKGqnXd0HkO8AtH7Ps+lpFXvv3hHtKy66IHVN4j5PNXuB9s0U6Z
         ZlpYeP5MolwnQcLfQz/8EODxTFapbYXWOfLFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742486355; x=1743091155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L/8OKxq5tdUvL+relQi7wdXNnmHOUxgp/8lJVL44Vxo=;
        b=ecJWNVn3x58530loxz0mQ8a1AweWsAY3nWh8Va1lfc7f8Av2hI1exmEOprbx/cjdR+
         g9IJv+l7U7d4Beqpp/Nvckh8nehBrdQ0qLm03vS2CwjKTftgnWpH0o2n42UkNPtGrf8Z
         3ZARcHUTK/OjqfbdQIvnL8ekhV3PSkRnihK7w2EF8FKQuOLG5qn2Dau5A56j03S68O9/
         BpFoQpKGJ9eqdsfH2jrm+uQ6Nn69aBUAwi5JrNkFkwNFZ41sBghn9mzZheSBe1TeITEt
         5r1rA14BTSY+Ohl5mziJ/u3+9u1VcLn/yc0JmwSy7SRdUwntKQ0rkQWlBzLBmB/3m85j
         Kwbw==
X-Gm-Message-State: AOJu0YwzY+DKhNzqJhP6mMapCfPMdv0mlgtKp7oycvMJ7i1EYjKSj2Uq
	UUcmFpfvspBlLrYpBjun2z0TcbAOB7VvsHjP2ZQ1oWCB8XL6KeTIhHmn22OCGrKyBXuS4vJPkDH
	a
X-Gm-Gg: ASbGncssvtg8dylzAhhILYSm35W5p+D+VmDXQVJVbjUe/AesTegkM2xiJRSl2AfVmXS
	nqG5yYMzYigIOpM6neAfNiD0yQknhAbIhB0H/FUPYIHgAQttzZchHQGL9opihBrACiPYPZBeTqe
	ox4iqueJ+NgA1PTCic233H/C5IAEMaDe8n52OVIEISU0QGZ+ycPfD4xfFKE6heROU1aa2DmpQBb
	MjWWi06mqMZ0COBPLo9nnpnVPD/y73CTN3Lf+priY/+d4ISGe7OfqP77Upv4X68bi/NmJSScus1
	LWScpjhx0rv6G2RxDxsWFsyQpCQl7iVwllluMlhjMV3Uu4FAO/kF3BGKvsO8PfRDLKi/64pGZ7Y
	lwS+Aqxknx+9scwT0Cg==
X-Google-Smtp-Source: AGHT+IE0OO4lw9CtCSW5Bt/ILRqTBLYjpT8yYEqT37jaA57URTYo6Twixus+lsjEx0/QoleZVGNTGQ==
X-Received: by 2002:a05:600c:1e8f:b0:43b:c7f0:6173 with SMTP id 5b1f17b1804b1-43d502e4332mr627565e9.4.1742486355196;
        Thu, 20 Mar 2025 08:59:15 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH RESEND 0/3] Xen: CI changes for new toolchain baseline
Date: Thu, 20 Mar 2025 15:59:05 +0000
Message-Id: <20250320155908.43885-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Prep work to allow us to start making changes based on the toolchain
requirements.

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1726628670
https://cirrus-ci.com/build/5232741505040384

Andrew Cooper (3):
  CI: Update build tests based on new minimum toolchain requirements
  Xen: Update compiler checks
  CHANGELOG: Minimum toolchain requirements

 CHANGELOG.md                         |  3 ++
 automation/build/centos/7.dockerfile | 72 ----------------------------
 automation/gitlab-ci/build.yaml      | 30 ++++--------
 xen/include/xen/compiler.h           | 16 ++-----
 4 files changed, 17 insertions(+), 104 deletions(-)
 delete mode 100644 automation/build/centos/7.dockerfile


base-commit: 6e5fed7cb67c9f84653cdbd3924b8a119ef653be
-- 
2.39.5


