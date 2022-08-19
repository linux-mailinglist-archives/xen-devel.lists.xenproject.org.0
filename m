Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9990459A6A9
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 21:44:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390437.627871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oP7uw-0004u3-3Q; Fri, 19 Aug 2022 19:44:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390437.627871; Fri, 19 Aug 2022 19:44:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oP7uv-0004mW-Vi; Fri, 19 Aug 2022 19:44:29 +0000
Received: by outflank-mailman (input) for mailman id 390437;
 Fri, 19 Aug 2022 19:44:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yp9C=YX=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oP7uu-0004jJ-O6
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 19:44:28 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54387ee2-1ff7-11ed-9250-1f966e50362f;
 Fri, 19 Aug 2022 21:44:25 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id e21so2001078edc.7
 for <xen-devel@lists.xenproject.org>; Fri, 19 Aug 2022 12:44:25 -0700 (PDT)
Received: from uni.. (adsl-47.176.58.181.tellas.gr. [176.58.181.47])
 by smtp.googlemail.com with ESMTPSA id
 r17-20020a1709061bb100b00731745a7e62sm2695059ejg.28.2022.08.19.12.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 12:44:23 -0700 (PDT)
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
X-Inumbo-ID: 54387ee2-1ff7-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=+iXUh+ly3q7kTPvB48H2wMf09H72FCO7C0IVYZo0oO8=;
        b=B+aiSCje4l4vPdNaIjXtq1BHl63IYACV0YzKTpqO31Fj2Npfox+TQeEPbUF8rT7H1q
         GDMsl/+PndSO6DsxLpj38Zm8ZcLrO+NK2smo/Mp04hfh4D7PzPAsBVy9tR52MxW24dkG
         tAj/oNXN1QaGtaoqreLZvqb0oqS8imU6azMDlwpYw8Wg0mfPsYMJ41ClFSfUBAJWAA26
         yl7BGzq2Q7bXbsGiefye7FlF/PmYx4npUghat/j9nwURR8Xi281WvcCYeOMxOJ6HNUfW
         d77WZH6OOY9C4KLvvy2DmlFCoKMDEeguG2058TFgxAOLe94QtA7C9KTEcWCEP5VmXusi
         jRpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=+iXUh+ly3q7kTPvB48H2wMf09H72FCO7C0IVYZo0oO8=;
        b=2L99lxHPOx3RRCSeAysy1HV82QJ6cq3Lm015fcoxs1cYgO6qYOjgg0WmsCgzlb1l14
         5O7Qx2Av7pl3eVxTEn6DMCLqPaWwZS3zgxBzLQ1PWtnkLAbPGmcJp9PFqdfvYjobTw/1
         WC/XTQ+sm2XBkPeF6+adOAMGyTancI7KJ8I42AaNoWtcyiEuBx1227FV07gJKlZYvfVT
         0yDZ36uzjhKBb7jh5dAMQ38hWQjJneyPsV4PPm5APJFP6d8zzR3oEJSVZCCqmc5fywhm
         LqAA+uV+FsW2lmK+5orku70IE58q4s+SXQS4Yphhr3fNxb6460uEK3CQiMFOK5lHmIpG
         D2LA==
X-Gm-Message-State: ACgBeo1yJnXCZWzJqYQz8VBFl5u88biymg8E8rYk8umWgnfavc4BHSsD
	87UxjXi3RFLFv3Wzj49XSJyzVrok/9M=
X-Google-Smtp-Source: AA6agR72LdtB5UQUlBPODzMyHks5cfiMyCkdYYCp/gd/V8DP8gEKKfchu1fMq1hEg8Iy9WAfjJNYqA==
X-Received: by 2002:a05:6402:3552:b0:43d:a57d:22e9 with SMTP id f18-20020a056402355200b0043da57d22e9mr7201976edd.119.1660938264363;
        Fri, 19 Aug 2022 12:44:24 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 0/7] Fix MISRA C 2012 Rule 20.7 violations
Date: Fri, 19 Aug 2022 22:43:52 +0300
Message-Id: <20220819194359.1196539-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xenia Ragiadakou (7):
  xen/arm: gic_v3_its: Fix MISRA C 2012 Rule 20.7 violations
  xsm/flask: sidtab: Fix MISRA C 2012 Rule 20.7 violations
  xen/elf: Fix MISRA C 2012 Rule 20.7 violations
  xen/vgic: Fix MISRA C 2012 Rule 20.7 violation
  xen/rbtree: Fix MISRA C 2012 Rule 20.7 violation
  xen/arm: processor: Fix MISRA C 2012 Rule 20.7 violations
  xen/device_tree: Fix MISRA C 2012 Rule 20.7 violations

 xen/arch/arm/include/asm/gic_v3_its.h | 10 +++++-----
 xen/arch/arm/include/asm/new_vgic.h   |  2 +-
 xen/arch/arm/include/asm/processor.h  |  4 ++--
 xen/include/xen/device_tree.h         |  6 +++---
 xen/include/xen/elfstructs.h          |  4 ++--
 xen/lib/rbtree.c                      |  2 +-
 xen/xsm/flask/ss/sidtab.c             |  8 ++++----
 7 files changed, 18 insertions(+), 18 deletions(-)

-- 
2.34.1


