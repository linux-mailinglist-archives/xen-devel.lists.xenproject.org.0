Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FFF98EF3D
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 14:28:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809426.1221762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swKwh-0008HD-Mp; Thu, 03 Oct 2024 12:28:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809426.1221762; Thu, 03 Oct 2024 12:28:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swKwh-0008EK-JO; Thu, 03 Oct 2024 12:28:39 +0000
Received: by outflank-mailman (input) for mailman id 809426;
 Thu, 03 Oct 2024 12:28:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d1Re=Q7=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swKnz-00043u-9S
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 12:19:39 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1f20bc6-8181-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 14:19:37 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a8a7596b7dfso178682966b.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 05:19:37 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a991047319asm77328366b.184.2024.10.03.05.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 05:19:36 -0700 (PDT)
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
X-Inumbo-ID: c1f20bc6-8181-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727957977; x=1728562777; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3DKuhQNv3MsZ5QX5cGeELREhQ+CQGQiRyTh9z9amE0=;
        b=SmSfEaK/hTUEQPmQPhMtuizfEn0ErEQeeeo2IKpIRMve26CkfvDlHDyrp9eJqQN1hO
         du+SfS5K1noyghmOPESZnof3uliOaWeqIpU90a4ptzAUz2xXYCSEulMTS5k3ESW91iK/
         0pEsbwA4x9Wlh3DwH+p2ykGJkZAVATo2AJbyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727957977; x=1728562777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I3DKuhQNv3MsZ5QX5cGeELREhQ+CQGQiRyTh9z9amE0=;
        b=sNzun18iXNNR606qbT/LLnny3hiSkS5w3gfPmv5JbQjJlwlpaTUuJhF8bFsP8bLH//
         2HUXHpB4uYLKPsuDZwHG4i9X1OD3/v/z+5TrIU/xTv/qkaChfQ9SMco/h7ECz6cdmJ+x
         nETL+RpFXTmpAGhuMV6rHsBc4AFtcySYFOagrVapUe6remZz27XP2AqJb9rw33WcAvbn
         ypo06DKsn26ygYZKZ1WEJ3ufRnEbO2Y0ftERFxJYQ54604dirpU8AI1Wxnqt5LHVAbT/
         qlIAuyNrxCZ/RAi/ZOXXiMMo55J8aiAXZdNpXP3dh3g94mqnyiVkTeO5XPa++bUgF5sH
         uv6w==
X-Gm-Message-State: AOJu0YwUUScvHVACk/gVrFXNYnO+h/yEXAuKuQ0THe7jnrrG8FfcELLU
	mE+0812lDt3c8YQLtM7/w31i1hrNXzZI0bHLYDXiTi0zbOYtCcg063mjepsc3fJ/V2BcWlsRv7U
	+
X-Google-Smtp-Source: AGHT+IHxtoLUSN1W0/txPHzw10TNeI8XojpvBuHpgefeO0JS/ngOev4Gur9gCOXLbOD+wrcQ3vOXHA==
X-Received: by 2002:a17:907:3f9d:b0:a98:f6dc:6cf3 with SMTP id a640c23a62f3a-a990a21d55emr317536166b.21.1727957976958;
        Thu, 03 Oct 2024 05:19:36 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 19/20] xen: Update header guards - VPCI
Date: Thu,  3 Oct 2024 13:19:07 +0100
Message-Id: <20241003121908.362888-20-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241003121908.362888-1-frediano.ziglio@cloud.com>
References: <20241003121908.362888-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updated headers related to VPCI.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/include/xen/vpci.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 41e7c3bc27..d2d2905447 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -1,5 +1,5 @@
-#ifndef _XEN_VPCI_H_
-#define _XEN_VPCI_H_
+#ifndef XEN__VPCI_H
+#define XEN__VPCI_H
 
 #ifdef CONFIG_HAS_VPCI
 
-- 
2.34.1


