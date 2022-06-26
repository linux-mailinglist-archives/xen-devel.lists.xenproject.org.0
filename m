Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD53F55B423
	for <lists+xen-devel@lfdr.de>; Sun, 26 Jun 2022 23:12:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356137.584193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5ZXp-0003Yo-Oi; Sun, 26 Jun 2022 21:11:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356137.584193; Sun, 26 Jun 2022 21:11:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5ZXp-0003W1-Kv; Sun, 26 Jun 2022 21:11:49 +0000
Received: by outflank-mailman (input) for mailman id 356137;
 Sun, 26 Jun 2022 21:11:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0i3P=XB=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o5ZXo-0002ze-4J
 for xen-devel@lists.xenproject.org; Sun, 26 Jun 2022 21:11:48 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96a317e6-f594-11ec-b725-ed86ccbb4733;
 Sun, 26 Jun 2022 23:11:47 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id eo8so10553039edb.0
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jun 2022 14:11:47 -0700 (PDT)
Received: from uni.. (adsl-146.37.6.170.tellas.gr. [37.6.170.146])
 by smtp.googlemail.com with ESMTPSA id
 cq12-20020a056402220c00b004356b8ad003sm6367556edb.60.2022.06.26.14.11.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 14:11:46 -0700 (PDT)
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
X-Inumbo-ID: 96a317e6-f594-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nuU5RdK7p3A+qPrUO/Jr3dM+wawCSfpGpfW4baMZN1o=;
        b=WpQxztn4nBsr82cJ9eOZah6UtylOZg7AnA56/KVKxKTt9oh2n1FZWC3Bm3MprrBI5m
         9cNC6/OGiNYKWqZm14RYDQvL8OO5O6swZL1K91SmSlC+eJHvIubQmaS4RmNqAAP80U2g
         CsTG1O68POh/vetLnbSuc+dS1GaV6PzisV1sVOA1PFgFVjOYK/NomIx/VuWyUrwc3ZDa
         BTXw06zoRN8pLFb9aJoVyFbHaAw4INhhLeMpFKv6uyrP7TStYcWisyQbNlxb0NaV1btx
         dw3ZcSaj/tmw4pRP0da5dyeUT2nL72p26qq0sKfqeMV491SnuGoh3I/WUE3wSQHvOezc
         DgQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nuU5RdK7p3A+qPrUO/Jr3dM+wawCSfpGpfW4baMZN1o=;
        b=t21KKj1KKy436cHUNN+AJNN2Tor0I8hPbB6+k8EeDcCnSy9USmYsuL/VIj3ZiGpE2j
         TUzcYayZxXTUCOvVodehFSm/73bPXPkfk4vxvgSAmIcQ7os+DMInsyIq+/Oz+GUXUbP7
         sm28gSD7Wowwpn9P+mItpoqhw7a+LVGS1GF47tZpf/U5rsfxLxcSHGmoWw+5LGXYnpjx
         +Bg0PXsqv6vjOLoL6oLoHiX9dx0Rk720DQnbn0hYUEQtmuV02pGPBEjvCeUaJOFStpDD
         hmyuvwp9sfKKD9QtPyZ6e8Z706+rylqKYW1mb1L0k/MR7I9i7E66iTwQkN8FBcUC6ozr
         Kljg==
X-Gm-Message-State: AJIora+RjC0SFh2vrHomQBWULY/4DT2jrkLvq9I7C5sLmnETWasccYx9
	I8Q94BUZBYrlySsePVmsjYbcwrGZ7fU=
X-Google-Smtp-Source: AGRyM1uqxPILZfgMHtiSrlaohNVIDdzBMh410mKVJtBS0assx2Gn2edp44afW8udB/i1s3pRO8iozA==
X-Received: by 2002:a05:6402:4496:b0:435:d605:6ff8 with SMTP id er22-20020a056402449600b00435d6056ff8mr12821122edb.357.1656277906805;
        Sun, 26 Jun 2022 14:11:46 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [PATCH 2/5] xen/common: vm_event: Fix MISRA C 2012 Rule 8.7 violation
Date: Mon, 27 Jun 2022 00:11:28 +0300
Message-Id: <20220626211131.678995-3-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220626211131.678995-1-burzalodowa@gmail.com>
References: <20220626211131.678995-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function vm_event_wake() is referenced only in vm_event.c.
Change the linkage of the function from external to internal by adding
the storage-class specifier static to the function definition.

This patch aims to resolve indirectly a MISRA C 2012 Rule 8.4 violation warning.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/common/vm_event.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/vm_event.c b/xen/common/vm_event.c
index 0b99a6ea72..ecf49c38a9 100644
--- a/xen/common/vm_event.c
+++ b/xen/common/vm_event.c
@@ -173,7 +173,7 @@ static void vm_event_wake_queued(struct domain *d, struct vm_event_domain *ved)
  * call vm_event_wake() again, ensuring that any blocked vCPUs will get
  * unpaused once all the queued vCPUs have made it through.
  */
-void vm_event_wake(struct domain *d, struct vm_event_domain *ved)
+static void vm_event_wake(struct domain *d, struct vm_event_domain *ved)
 {
     if ( !list_empty(&ved->wq.list) )
         vm_event_wake_queued(d, ved);
-- 
2.34.1


