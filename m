Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A1F68A2A7
	for <lists+xen-devel@lfdr.de>; Fri,  3 Feb 2023 20:10:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.489349.757702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pO1RB-0003kx-0Q; Fri, 03 Feb 2023 19:09:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 489349.757702; Fri, 03 Feb 2023 19:09:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pO1RA-0003gi-TG; Fri, 03 Feb 2023 19:09:28 +0000
Received: by outflank-mailman (input) for mailman id 489349;
 Fri, 03 Feb 2023 19:09:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S4sJ=57=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pO1RA-0003dr-3l
 for xen-devel@lists.xenproject.org; Fri, 03 Feb 2023 19:09:28 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 448449f8-a3f6-11ed-93b5-47a8fe42b414;
 Fri, 03 Feb 2023 20:09:23 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id lu11so18062983ejb.3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Feb 2023 11:09:22 -0800 (PST)
Received: from uni.router.wind (adsl-160.109.242.226.tellas.gr.
 [109.242.226.160]) by smtp.googlemail.com with ESMTPSA id
 q24-20020aa7cc18000000b0049e19136c22sm1517393edt.95.2023.02.03.11.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 11:09:21 -0800 (PST)
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
X-Inumbo-ID: 448449f8-a3f6-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+fzZMQ+2jafPS2MFlWMRAqix0hGiyv5wDJVeUhTAdTU=;
        b=Ek65BpXFqK+r5CErMfowedSYBY5DMmSf5M0MFI/WA5X3iLoaNnexl4AbZ7mVgQ/TnE
         aXeC8/SL/pbVsemJfvIPtX9WXxo0ii0fgK/5P2EACgYg6c/LRWfpv+gGknFzrqX9YbEy
         8UiV8CAan5q7s0LO7FmzNpG4EbRdQ1dBIiARyl1W6aermiPHPUWOTIQfL0ZSAyWK5sD5
         CnLRYHq23ZF5OLK+o+7ym21nnC/gOB4GWRBF+mRL5/UIiCJS4rgbEm9lgmZzW+xKD9Tt
         fHoT5XARSTnlXc5yUqqa3ieCwVFqcMMUCgDBkhqGvvyGKOJxreQC2GkCevHZCgXhRJUC
         M/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+fzZMQ+2jafPS2MFlWMRAqix0hGiyv5wDJVeUhTAdTU=;
        b=M40vJjSe0snJpnfnxypG/xElVjeX5ELMqa3pcYNgUvbBk34N2DuCdozQ/f8ijPforM
         Gt582eQMmfryKlO7qa8mOoGJllKLFHcJrSP+qqpzJDRygT7eOtgpBv1qEjbxuQr9vYLc
         /8DuGjg1YNLstu5kaetAu5CEehMiOxMKGzjcpZzbUPeeCKO1sG5biJLFS5YESosrMSId
         FVyew8WrSAyqL/Jt2Nk3qeE38ki7ye0ODQ6lFve9jiKhuu47b59myOCEWdHgU/Iv4eL5
         tRdU506YdROnJ1AOzyrXTx+1ON2RIdcS7Zclnk4F2ijD7FFzmRuMl8Ylb+GPzrnYk2+q
         rqBQ==
X-Gm-Message-State: AO0yUKXU5IPkCIr1/SNei3WdiynrDnAggpOXgZYcKUjAtGYQJRP/5w5r
	zlT+RJpZv6d7NSieg1/Hl1iDyH8Bz98=
X-Google-Smtp-Source: AK7set+5cH7dT8nZl9h6ONnVwJRAC6JedrPJmzWnuAjvzdEKmKTbCfem8DT0SmRxULPLVntCIbvnhQ==
X-Received: by 2002:a17:906:a28b:b0:886:ec6e:4c1 with SMTP id i11-20020a170906a28b00b00886ec6e04c1mr10823073ejz.59.1675451361950;
        Fri, 03 Feb 2023 11:09:21 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH v3 0/2] Resolve issues related to macros in device_tree.h
Date: Fri,  3 Feb 2023 21:09:06 +0200
Message-Id: <20230203190908.211541-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xenia Ragiadakou (2):
  xen/device_tree: fix Eclair findings for MISRA C 2012 Rule 20.7
  xen/device_tree: remove incorrect and unused dt_irq() and
    dt_irq_flags() macros

 xen/include/xen/device_tree.h | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

-- 
2.37.2


