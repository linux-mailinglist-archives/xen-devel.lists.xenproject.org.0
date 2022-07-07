Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1AD56ACD6
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 22:38:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363124.593490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9YGS-0005Hc-P5; Thu, 07 Jul 2022 20:38:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363124.593490; Thu, 07 Jul 2022 20:38:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9YGS-0005Fq-MO; Thu, 07 Jul 2022 20:38:20 +0000
Received: by outflank-mailman (input) for mailman id 363124;
 Thu, 07 Jul 2022 20:38:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S5Xm=XM=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o9YGR-0005FX-61
 for xen-devel@lists.xenproject.org; Thu, 07 Jul 2022 20:38:19 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb422a90-fe34-11ec-bd2d-47488cf2e6aa;
 Thu, 07 Jul 2022 22:38:17 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id ez10so4259042ejc.13
 for <xen-devel@lists.xenproject.org>; Thu, 07 Jul 2022 13:38:18 -0700 (PDT)
Received: from uni.. (adsl-142.37.6.26.tellas.gr. [37.6.26.142])
 by smtp.googlemail.com with ESMTPSA id
 s17-20020a1709060c1100b00722e52d043dsm19344858ejf.114.2022.07.07.13.38.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 13:38:16 -0700 (PDT)
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
X-Inumbo-ID: bb422a90-fe34-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jWcqEuvxM0/j0hASRiAWQ4nyDWpbIM9ewuBdZsVBjG4=;
        b=FZjcAC6BbZHyOX4ck/m6He8Ox1TnsMSg5WWzVe3xxnSjv23yjllmR4GtPmIEeTv8Jg
         XnZOxXuG+55RIaXgZUF8b8/e/viE7YFiKoMlGxa1zXGcFsqMymJhLDpgL6K0rwKuKwAe
         jd/DgovVw3gRYn/YYiXFYrpGRdaGEbwHFPBAsMA1OmS9vxqZ+SVato9Dw1CLZB+ngb9V
         cytB5gAK4GTqBabqh8VaQTSPewfcPSuJiPqNWVksEVuziYr/T+Sq2wbkKkKA3kmJrY/B
         BpDpnOqgQKZa3JD67bK+MwrqiY42G3iqCnaBXot2YiJfmieYKo48/XYaCB+GT0tZkc0B
         w8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jWcqEuvxM0/j0hASRiAWQ4nyDWpbIM9ewuBdZsVBjG4=;
        b=yKxisd1bDOJvWwT2rdjjPRbGWqt/Ip1cAPT08N1pY5th3sIgY/jOaUX5nZr5bnyjW1
         tL60JhUquDz1yToOKvOG7bKyBO/0nS+CKvEnGsX+CrWee7j6ylw/cLFF6vLS0CK/h6T9
         ZWW5jyQrq4dFRmr1qJpyF2ASa+hCKWEl5YPFpvaQEnOrjFswij+iD+ICcLmaxoamteFq
         YoJizp+XSlYMVGLCYWXBzgS+TdbQIRP/llrUm0YLUXs2E2GNjWPH9iPHXROPGtK++bJl
         8BXejxqKPa/BFFa8myPwHd6xbPOmIPjXhoi/fzO5dyIkSKJcuV2a/e2vCVXUQreL+CNu
         VWRg==
X-Gm-Message-State: AJIora/nEof1CN9FFJ1s//0EAzU7bl8keh7s4cnYJDMg5W23lwkzrF8R
	hof2B2flWOXyGvQYFeC3XooLQ6316xI=
X-Google-Smtp-Source: AGRyM1uPBRYIoOlIfxVSo5FrU2hEDcz3XjKBv0WnwMzVpkXX8EQT71fE85ZndhTt9wxdtPs6uUTxYw==
X-Received: by 2002:a17:907:3d8d:b0:726:3f5e:dc58 with SMTP id he13-20020a1709073d8d00b007263f5edc58mr44029204ejc.416.1657226297455;
        Thu, 07 Jul 2022 13:38:17 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/2]  Create a test job for testing static memory on qemu
Date: Thu,  7 Jul 2022 23:38:01 +0300
Message-Id: <20220707203803.798317-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series
- removes all the references to the XEN_CONFIG_EXPERT environmental variable
which is not used anymore
- creates a trivial arm64 test job that boots xen on qemu with a direct mapped
dom0less domu with static memory and verifies, based on its logs, that the
domu's memory node ranges are the same as the static memory ranges with which
it was configured

Xenia Ragiadakou (2):
  automation: Remove XEN_CONFIG_EXPERT leftovers
  automation: arm64: Create a test job for testing static allocation on
    qemu

 automation/build/README.md                 |   3 -
 automation/configs/arm/static_mem          |   3 +
 automation/gitlab-ci/test.yaml             |  24 +++++
 automation/scripts/build                   |   8 +-
 automation/scripts/containerize            |   1 -
 automation/scripts/qemu-staticmem-arm64.sh | 114 +++++++++++++++++++++
 6 files changed, 147 insertions(+), 6 deletions(-)
 create mode 100644 automation/configs/arm/static_mem
 create mode 100755 automation/scripts/qemu-staticmem-arm64.sh

-- 
2.34.1


