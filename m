Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0B15839EE
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 09:59:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376665.609588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGyQB-0005Wa-LF; Thu, 28 Jul 2022 07:59:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376665.609588; Thu, 28 Jul 2022 07:59:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGyQB-0005UC-IJ; Thu, 28 Jul 2022 07:59:03 +0000
Received: by outflank-mailman (input) for mailman id 376665;
 Thu, 28 Jul 2022 07:59:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dfiA=YB=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oGyQA-0005U6-Bs
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 07:59:02 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2444d247-0e4b-11ed-bd2d-47488cf2e6aa;
 Thu, 28 Jul 2022 09:59:01 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id v17so1179959edc.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jul 2022 00:59:01 -0700 (PDT)
Received: from uni.router.wind (adsl-69.109.242.233.tellas.gr.
 [109.242.233.69]) by smtp.googlemail.com with ESMTPSA id
 l2-20020a1709060cc200b00722e4bab163sm105413ejh.200.2022.07.28.00.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 00:59:00 -0700 (PDT)
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
X-Inumbo-ID: 2444d247-0e4b-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c3TxKve5pKEJCP5h37jSixpvAyP6PRIDSzPuepm/z4I=;
        b=h8Nek/xFAd9+FaQ2zpvTNk9u1oFpYkDVzEDUw/+NMqyImOX26wSgKsTXCgjj/ifsdp
         Hs1eQH3GV2Ed9xN3fsuIXwZpFJ33y7RSQd5oOplxJB7rjlQ0fik1yMOwTPhcW65ZqlvV
         lJPUsxbvXFrjpZ+d7U55e9OJrwD/pzeEuB34BVpQtYTwmhoED6iXk0cVIhQsTndttBRY
         35ZgPnOsD8GzRR7kelsq90B38BCTuA/wh2jixWtnfHhwrJLyT2+y4jlAJ7AR/NbHhKrj
         qX53Ha2ewx3+eGwfCwkuxiRSaIo4DrpNB/pacKRMRYplIzLjVob7NeYGQkhYXsOH+0zX
         qFsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c3TxKve5pKEJCP5h37jSixpvAyP6PRIDSzPuepm/z4I=;
        b=Qp9rYs36DMl+UGNbEbDVubji1kxt0z1e0ztdKcpiftjl9v+YAwptyIYR42PCS9Km/U
         msXBYbrABHJrWKnSnaDwH4jpDtEoq4FoGxATOCO0Lm8UmMpRbHBvMU6icBXfJU52uEal
         qq+fJ+sCQzK7RmG/2bS68rSNXi+uEblaQ2T0qt2FzMSjVA+KSgthYk78J8m8L5sBghaL
         i8P32vXPqH+r/q26R4SS41ucDKBI1uWVZNs7a2JebTk0FBJ3M+2A4fT+bI1pdfV08HPR
         W5uYQCH44vFgwEIifZ9A3ougwUOpZM2cWtfnVgRfX3mk4AAnSdqoym5zK8aeLixkLYsz
         H6Ug==
X-Gm-Message-State: AJIora+xR5RH3O1/ZtjobcCOJXsPplCBIppKlb1250hsTe7LQDqrdoZD
	drm846EukbmLZVIdspong7ALcHLRQ+E=
X-Google-Smtp-Source: AGRyM1t86kLTof2/POweXLjj+Z8VujzUS78wBLNcE8N03jtK5IKhGQq2VZ15ePrqte6leyJYAvZzEw==
X-Received: by 2002:a05:6402:529a:b0:43b:b8e4:fca5 with SMTP id en26-20020a056402529a00b0043bb8e4fca5mr26749539edb.344.1658995140612;
        Thu, 28 Jul 2022 00:59:00 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 0/2] Create a test job for testing static memory on qemu
Date: Thu, 28 Jul 2022 10:58:54 +0300
Message-Id: <20220728075856.1175504-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series
- removes all the references to the XEN_CONFIG_EXPERT environmental variable
which is not used anymore
- creates a trivial arm64 test job that boots xen on qemu with dom0 and a
direct mapped dom0less domu with static memory and verifies that domu's memory
ranges are the same as the static memory ranges with which it was configured

The static memory test relies on the existing qemu-smoke-arm64.sh script.
This script uses the kernel-5.9.9 from the test-artifacts container as domu
kernel. This particular kernel does not work with dom0less enhanced enabled.
More specifically, domu crashes when it attempts to dereference the xenstore
interface which is still uninitialized,
So, qemu-smoke-arm64-gcc test, as well as its static memory version, fails.

To be able to test, I had to disable dom0less enhanced by adding the following
commands to the script.

sed -i 's/xen,enhanced "enabled"/xen,enhanced "disabled"/g' binaries/boot.source
mkimage -A arm64 -T script -C none -d binaries/boot.source binaries/boot.scr

These commands are not part of the patch.
Since dom0less enhanced is enabled by default, a newer kernel version would
be more appropriate for testing dom0less.

Xenia Ragiadakou (2):
  automation: Remove XEN_CONFIG_EXPERT leftovers
  automation: arm64: Create a test job for testing static allocation on
    qemu

 automation/build/README.md             |  3 ---
 automation/gitlab-ci/test.yaml         | 18 ++++++++++++++++++
 automation/scripts/build               | 14 +++++++++++---
 automation/scripts/containerize        |  1 -
 automation/scripts/qemu-smoke-arm64.sh | 25 ++++++++++++++++++++++++-
 5 files changed, 53 insertions(+), 8 deletions(-)

-- 
2.34.1


