Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E16E496CA9A
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 00:55:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790818.1200592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slyuZ-0001Y2-Bg; Wed, 04 Sep 2024 22:55:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790818.1200592; Wed, 04 Sep 2024 22:55:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slyuZ-0001Vq-82; Wed, 04 Sep 2024 22:55:39 +0000
Received: by outflank-mailman (input) for mailman id 790818;
 Wed, 04 Sep 2024 22:55:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EFI/=QC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1slyuY-0001Vf-6o
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 22:55:38 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc38b145-6b10-11ef-99a1-01e77a169b0f;
 Thu, 05 Sep 2024 00:55:36 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5c26311c6f0so187353a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 15:55:36 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a679755b3sm21546166b.146.2024.09.04.15.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 15:55:33 -0700 (PDT)
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
X-Inumbo-ID: cc38b145-6b10-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725490535; x=1726095335; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1eN53slfy9I3c815jQL5cMupt9DljpoPG7bUABF1MDs=;
        b=vGlxSZvyBWx/BsBJg61QwnW0HgAkaAYD7A+MhDylfEDlLmLDqV6J5r6sxzqJjw2pwN
         62j5+7iDp3c/2wYROnLAqlvbFlLIeQLt0cTvNSMICayXvrZSD0aTVeareYL+mZ5BJURp
         a9U5Vq0Wg5cULLbBcMnYY8QtlXfw9/vFsQMIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725490535; x=1726095335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1eN53slfy9I3c815jQL5cMupt9DljpoPG7bUABF1MDs=;
        b=wnmvdCwTjsZBwYZhyJexpjR00XuftNNmH4jGclar0R68ltmdlpl9Mu2VsPlQIcnB3+
         XRB1EFVbwtVLMJ+p7DNIPcrxGLrN0Rt3VuHoHinDT+V2cXDNfG0OFQZjl+v3gtBgjgcN
         jHd302tsF6rAQZ+DYgyUz1ne2ia0gUykbyHqR2ie9+RCgOdowQcx+Ed2TMciL4UCd532
         yOg1NLi0A1ziiqu1o3K/PdZ9AmI5Vtj59OP73MM3pMILNo69XLYN35BQQ63pPzyGwIM8
         Q/Wa7axBXtswuc3ljNAwJMJJ6QImNGswxMlicAR5OsRanV2cH5aHo/ne74tjMU6YZ2O+
         lRdg==
X-Gm-Message-State: AOJu0Yzv7ssvNYwIOvoas1efEPMdeQ3Y1ts7UI6bWK8WYQKfc0K5d+gz
	paAHJCuCyoYu3K1BYmJXU9NkW8CsKtmuHZAJKMWzdmKPk3QJ/tbg13cXNcQ75hS4s1GUaNcV+vZ
	r
X-Google-Smtp-Source: AGHT+IF5neoxat+XC1GIGSnxUW1YsKKzEwTk/Bg1gyZiK5hezua477XGCRoz291Fzi5eBtRqaav/yQ==
X-Received: by 2002:a17:907:f78c:b0:a86:9596:92a3 with SMTP id a640c23a62f3a-a8a3f49bc11mr358366466b.44.1725490534189;
        Wed, 04 Sep 2024 15:55:34 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v3 0/5] xen/bitops: hweight() cleanup/improvements
Date: Wed,  4 Sep 2024 23:55:25 +0100
Message-Id: <20240904225530.3888315-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The next phase of bitops cleanup.  This series:

 1) Untangles the mess around hweight()
 2) Removes some unwise uses of hweight()
 3) Makes it work transparently for RISC-V
 4) Use the POPCNT instruction on x86 when available

6 patches from the v2 posting has been committed.  See the remainder for v3
changes.

Andrew Cooper (5):
  xen/bitops: Reinstate the please tidy message
  xen/bitops: Drop the remnants of hweight{8,16}()
  xen/bitops: Implement hweight32() in terms of hweightl()
  xen/bitops: Implement hweight64() in terms of hweight{l,32}()
  x86/bitops: Use the POPCNT instruction when available

 xen/arch/arm/include/asm/bitops.h | 11 -----
 xen/arch/ppc/include/asm/bitops.h | 11 -----
 xen/arch/x86/include/asm/bitops.h | 32 +++++++++-----
 xen/common/bitops.c               |  3 ++
 xen/include/xen/bitops.h          | 69 +++++++-----------------------
 xen/lib/Makefile                  |  1 +
 xen/lib/x86-generic-hweightl.c    | 71 +++++++++++++++++++++++++++++++
 7 files changed, 112 insertions(+), 86 deletions(-)
 create mode 100644 xen/lib/x86-generic-hweightl.c

-- 
2.39.2


