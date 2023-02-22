Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 999B069F803
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 16:34:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499538.770722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUr85-0001cr-LM; Wed, 22 Feb 2023 15:34:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499538.770722; Wed, 22 Feb 2023 15:34:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUr85-0001be-FT; Wed, 22 Feb 2023 15:34:01 +0000
Received: by outflank-mailman (input) for mailman id 499538;
 Wed, 22 Feb 2023 15:33:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvgA=6S=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pUr83-0001MC-68
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 15:33:59 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5311e990-b2c6-11ed-a089-e9535cc0f9c3;
 Wed, 22 Feb 2023 16:33:58 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id m6so10601552lfq.5
 for <xen-devel@lists.xenproject.org>; Wed, 22 Feb 2023 07:33:58 -0800 (PST)
Received: from localhost.localdomain (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 q9-20020ac25289000000b004db0d26adb4sm927746lfm.182.2023.02.22.07.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 07:33:57 -0800 (PST)
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
X-Inumbo-ID: 5311e990-b2c6-11ed-a089-e9535cc0f9c3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zqvukz9Wc9inONzmuv1uqsHsrEr+5BrdoP3LyiYlJNc=;
        b=A5wwFKfLIQXuxIScvZsdkXI7TfET/8Br388Cj7wQG+b6a6GmqgTNLaCaxklh0lPUDS
         nAtT2c9RPmuCRUo9tHO/DoToQ6fM2JSEDsNaDEkka0r2rrTlb8NZTB3yVjfyUE55xwsJ
         MbWoyYJXmJ78Hfk8KBYdC/1UWDc3CPohkl3MjiC8fbTBmTWDN86nHVwYZOAXt395BHrB
         0r1M5lmxpHiviohxpFyo+3w+stRsTSLsQmN+a+WbHu5sZp81OGz1bXzZoeJ8PW82Z2WL
         qZHrVGIulMCIaK8N750h+PWtKziYA7TTPJGkgAjWklIj8QJSCMfg81WhXynCr5u9e/5R
         RjLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zqvukz9Wc9inONzmuv1uqsHsrEr+5BrdoP3LyiYlJNc=;
        b=iMTFeCRCtHmehAD/djPzKFMSCd5OOE06jXql96iy/cty55qYHOkhRomRBX+9qrCGqm
         Pg4lp26jwBfOY2zsg6xhlQOgYs3664jE5qunbxt3rUJY+sNSOl+Ws1QHAf8sNwZO0tP1
         0ARMLhssKwYx2fAyEWvEh86YVRVOymsrzsQJtkm7Klt1NTH5WkEEFxB81W+w2RGKzocZ
         dU6LX7v9GIKEVajpnGcdo4FBnHMioYCVonKjCQcOEN4Ebu9SSbmgKikaXdu6w/Gk0kx5
         gQR+bvhnSIN1oWhxMNPZDkQ46VncnpLtGtnv8IJeAwK+qjFCQs4FSTG80o4r6fnAEKn7
         G7uA==
X-Gm-Message-State: AO0yUKWE5ozFZ/Il3/8JCAn1AyaHJqb/CKZBbC/w7KaLSo4himpLmzhm
	DBfNLJqdontwEP7G5zgHAhIy/UwIopDLKx4mLBM=
X-Google-Smtp-Source: AK7set+DcuvGaDQ5vp9ctw+TkJQtIbCDGMtu3l/ttC+FbPE+boIAHse0unqWaTs9of2BqAGtALrbeg==
X-Received: by 2002:ac2:5234:0:b0:4cb:4374:cc78 with SMTP id i20-20020ac25234000000b004cb4374cc78mr3352349lfl.26.1677080037933;
        Wed, 22 Feb 2023 07:33:57 -0800 (PST)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com,
	Marc Bonnici <marc.bonnici@arm.com>,
	Achin Gupta <achin.gupta@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [XEN PATCH v7 04/20] docs: add Arm FF-A mediator
Date: Wed, 22 Feb 2023 16:33:01 +0100
Message-Id: <5c588d92cdf23a7355a79bf4b91c7214e5ced197.1677079672.git.jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677079671.git.jens.wiklander@linaro.org>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describes a FF-A version 1.1 [1] mediator to communicate with a Secure
Partition in secure world.

[1] https://developer.arm.com/documentation/den0077/latest
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 SUPPORT.md               |  7 +++++++
 docs/man/xl.cfg.5.pod.in | 15 +++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/SUPPORT.md b/SUPPORT.md
index aa1940e55f09..5e0595419684 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -818,6 +818,13 @@ that covers the DMA of the device to be passed through.
 
 No support for QEMU backends in a 16K or 64K domain.
 
+### ARM: Firmware Framework for Arm A-profile (FF-A) Mediator
+
+    Status, Arm64: Tech Preview
+
+There are still some code paths where a vCPU may hog a pCPU longer than
+necessary. The FF-A mediator is not yet implemented for Arm32.
+
 ### ARM: Guest Device Tree support
 
     Status: Supported
diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 024bceeb61b2..ca4fc3e67b0c 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -1645,6 +1645,21 @@ in OP-TEE.
 
 This feature is a B<technology preview>.
 
+=item B<ffa>
+
+B<Arm only.> Allow a guest to communicate via FF-A with Secure Partitions
+(SP), default false.
+
+Currently is only a small subset of the FF-A specification supported. Just
+enough to communicate with OP-TEE. In general only direct messaging and
+sharing memory with one SP. More advanced use cases where memory might be
+shared or donated to multple SPs is not supported.
+
+See L<https://developer.arm.com/documentation/den0077/latest> for more
+informantion about FF-A.
+
+This feature is a B<technology preview>.
+
 =back
 
 =back
-- 
2.34.1


