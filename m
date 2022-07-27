Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1025829AF
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 17:33:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376265.608915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGj29-0000SW-3Z; Wed, 27 Jul 2022 15:33:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376265.608915; Wed, 27 Jul 2022 15:33:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGj29-0000Q0-0X; Wed, 27 Jul 2022 15:33:13 +0000
Received: by outflank-mailman (input) for mailman id 376265;
 Wed, 27 Jul 2022 15:33:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uTNG=YA=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oGj27-0000Po-BG
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 15:33:11 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b0a70d0-0dc1-11ed-bd2d-47488cf2e6aa;
 Wed, 27 Jul 2022 17:33:09 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id w5so9440288edd.13
 for <xen-devel@lists.xenproject.org>; Wed, 27 Jul 2022 08:33:09 -0700 (PDT)
Received: from uni.router.wind (adsl-141.176.58.226.tellas.gr.
 [176.58.226.141]) by smtp.googlemail.com with ESMTPSA id
 ev6-20020a056402540600b0043af8007e7fsm10260725edb.3.2022.07.27.08.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 08:33:06 -0700 (PDT)
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
X-Inumbo-ID: 6b0a70d0-0dc1-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p8Cy3IKT6/AflZoLkcKNavrDiqUoPXLAJcSHK2voDa8=;
        b=bwmxrUqXArzNP+KEmQQa/pH/4D8DF2VJleeqaG5o3MleGaCVptHTT7ing+38TLVlex
         qjfoCimpdKHfmDekQ7kb5M7GetZJYCl85TY6PZmcq2s+xW5Je+rFUML95oB3NRez+vGp
         9joxl0hfXe4sytRBD/HkeQACC/ii5VP8Qd750TylQLRftnOgNxdhF6LSobY7sfsA72c2
         4hEm3Jtlr+ipb8GLqVnsv0C0ciAH7i+eDMpBbe71ycT8DUIsrBCwpq8Tf7UTC/qk0Kda
         VwHRJIYgDxn6b/v3yr+cGZ0nhJ2nhXDlR+6qwfJ5mdRqQiyoNwo61w7alN6+APS/WUcS
         QJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p8Cy3IKT6/AflZoLkcKNavrDiqUoPXLAJcSHK2voDa8=;
        b=lXM5rBIPBrb/3hgUjgurBkfnXIS9aMIyH/gjLlfuD4/56pxf5zAQTBZSF4dSAhX5Hb
         T4q6Vpupuz42P+nnEfOVukuI1f2Apl/JDTsY2gtP+6Npn2AMnaCTr2NHVbMUFAQScRdl
         DkWyPUtOhqKca6L7l40Mle5szmbdug+l7CmR+Mgjg9vkggKCsrvZU3GRTNNl8i8sq9aX
         9y3kZdA2nRoCZGBQUzkuJHk34HH/AaX7/Sob7kyvKVdl54jW1A33eadWPODzomlWz2Ut
         qE+54ztfqLdCA1OnDQ9kO0ZsSAS1v+UB1wBJoZ3t1iuSuyT2+kMUZpP5c5Y4MLHNqLkl
         4dWg==
X-Gm-Message-State: AJIora8G3kdYx2lbUk5yhVfJt1oLBM6ItUNAnIptgSLjm7TsGKwO87U+
	zsiWPhZUqsEZzK9DWubZjHKzXk6yPCc=
X-Google-Smtp-Source: AGRyM1tySdZvhNo9NxfFtTQf7YJ0bNDhZyvCOV9LdVP3ZYXfHDSG5tuCuV0ZSB50D2DXc6eMHzPXlg==
X-Received: by 2002:a05:6402:d05:b0:425:b7ab:776e with SMTP id eb5-20020a0564020d0500b00425b7ab776emr24440762edb.142.1658935987169;
        Wed, 27 Jul 2022 08:33:07 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 0/2] xen/arm: asm/atomic.h: Fix MISRA C 2012 Rule violations
Date: Wed, 27 Jul 2022 18:32:52 +0300
Message-Id: <20220727153254.1143503-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series fixes violations of rules 20.7 and 2.5 found in
xen/arch/arm/include/asm/atomic.h.
Rule 2.5 (a project should not contain unused macro declarations) is advisory.

Xenia Ragiadakou (2):
  xen/arm: asm/atomic.h: Fix MISRA C 2012 Rule 20.7 violation
  xen/arm: asm/atomic.h: Fix MISRA C 2012 Rule 2.5 violation

 xen/arch/arm/include/asm/atomic.h | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

-- 
2.34.1


