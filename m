Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D47B2372074
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 21:29:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121823.229806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldeFc-0006JJ-IY; Mon, 03 May 2021 19:29:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121823.229806; Mon, 03 May 2021 19:29:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldeFc-0006Il-DZ; Mon, 03 May 2021 19:29:04 +0000
Received: by outflank-mailman (input) for mailman id 121823;
 Mon, 03 May 2021 19:29:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wh1Q=J6=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1ldeFa-0005i5-Jn
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 19:29:02 +0000
Received: from mail-qk1-x72a.google.com (unknown [2607:f8b0:4864:20::72a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 987927ca-06df-4976-8231-de24dc5622a7;
 Mon, 03 May 2021 19:28:46 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id 197so5973479qkl.12
 for <xen-devel@lists.xenproject.org>; Mon, 03 May 2021 12:28:46 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:8710:5560:a711:776f])
 by smtp.gmail.com with ESMTPSA id
 g18sm9225209qke.21.2021.05.03.12.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 12:28:45 -0700 (PDT)
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
X-Inumbo-ID: 987927ca-06df-4976-8231-de24dc5622a7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uqmeaN/4AXKtgJwT/eGJDLG2d8Jq2K3MPeafs5T5nYM=;
        b=O/puGUfut9mjkvqGS86rfWewHK5E599cwLjEx2+bHI6TOIOUpS4ZZ9oNcqv64wwHK0
         q64nPMyLnCGNL3Fw+sllS/T/vFIOtu+Mv+Ul+uPQI8xdQJKtmvMCWpAN8zP0t3OrvxLp
         3Efpb6rDVyYF+PCKjAjx4oPbKKF6sMAs5uQdixPlakV7IBxVtdzzJIwO2kT/Cww1k0xO
         LJsYSJCkJ2UcPEZ7+zKyFFoTMnsi5U1O7DTKpJo1FXK5XFWkFEAG2V/bu1/jDg6bEvUW
         JdhIKB+xJ5HSvhF3bKXWpt1otDoigLP4X+VLeAOGW6rpUBxs24bKmmY8LzvvL8/Yt7K0
         DrLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uqmeaN/4AXKtgJwT/eGJDLG2d8Jq2K3MPeafs5T5nYM=;
        b=EogcMaZAhCEo1wIQ51f8la57OqKB71wXegTyaiybm4ekVOe2lQ5xppNz0SMgus4Bw2
         97dxO3OCrkvmA2p/UA0BaFs6uyUu9AX/SCUrzl70q+X9/MmGK58KxtRSXkIjpUZukR/V
         uvD6MAfc6uGiMELEYaD0a4jWlaAKHhQ+AGZ4gvF0WUw1r9Tcx9DmjWN1aXIPtPqSy7vf
         kCAT3c3mbsK6Vc3Wo0dAUgyvHCx56Gknr+t5f8/7G1svb3ai8OxP/cudpEasVWdzvbxi
         cj1lJM3iCqu1een1fbl3kyAlRwF7G83cnZtgGepLyBtyGTzfFRDAmxln3OKgULXIS2fo
         KftQ==
X-Gm-Message-State: AOAM532bxZXgjU6UxUtoLlXs0iO/C9Yp43kNID1SvHXs3lqT21VLEfLD
	j2J1DhScbX+pTF0wSb/1nek+kfXIC5Y=
X-Google-Smtp-Source: ABdhPJx6ttFNkIn5dzIsgKI9wOkqyfRGwETpXC7M8/giqwZN9obtfIXDzSEvqWjAmhLcaCATHTdqBw==
X-Received: by 2002:a37:a5d8:: with SMTP id o207mr17799675qke.13.1620070125776;
        Mon, 03 May 2021 12:28:45 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 07/13] libxc: Include hwp_para in definitions
Date: Mon,  3 May 2021 15:28:04 -0400
Message-Id: <20210503192810.36084-8-jandryuk@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503192810.36084-1-jandryuk@gmail.com>
References: <20210503192810.36084-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expose the hwp_para fields through libxc.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/include/xenctrl.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 27cec1b93f..82dfa1613a 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1960,6 +1960,7 @@ int xc_smt_disable(xc_interface *xch);
  */
 typedef struct xen_userspace xc_userspace_t;
 typedef struct xen_ondemand xc_ondemand_t;
+typedef struct xen_hwp_para xc_hwp_para_t;
 
 struct xc_get_cpufreq_para {
     /* IN/OUT variable */
@@ -1987,6 +1988,7 @@ struct xc_get_cpufreq_para {
     union {
         xc_userspace_t userspace;
         xc_ondemand_t ondemand;
+        xc_hwp_para_t hwp_para;
     } u;
 
     int32_t turbo_enabled;
-- 
2.30.2


