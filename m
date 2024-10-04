Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCED298FED4
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 10:17:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810084.1222717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swdVE-0005he-GB; Fri, 04 Oct 2024 08:17:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810084.1222717; Fri, 04 Oct 2024 08:17:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swdVE-0005ao-AI; Fri, 04 Oct 2024 08:17:32 +0000
Received: by outflank-mailman (input) for mailman id 810084;
 Fri, 04 Oct 2024 08:17:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=njpt=RA=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swdVC-0005Vm-IB
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 08:17:30 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 187ec53c-8229-11ef-a0bb-8be0dac302b0;
 Fri, 04 Oct 2024 10:17:28 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a8d60e23b33so258298366b.0
 for <xen-devel@lists.xenproject.org>; Fri, 04 Oct 2024 01:17:28 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99102858a4sm189829366b.49.2024.10.04.01.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2024 01:17:27 -0700 (PDT)
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
X-Inumbo-ID: 187ec53c-8229-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728029848; x=1728634648; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=82kd1u5j1vZbiViZ/c3NxDTptPC9vtDK6Y4UsawIGEw=;
        b=YRjADQhmt303GWIP46YY1x/svMrC+RnvYkwBiZhlX/EqcqknepshHUh0vQmvW4MW4I
         7TpqnRqIH+f70jk68VlbYrmGEb0dtM88WulajfmXeAXJ3saQHF9bDZZWe/FDTFdtrB7a
         Xyln0QoR4K2UnTpiOaMWQib1PX3PhEFKZ2vwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728029848; x=1728634648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=82kd1u5j1vZbiViZ/c3NxDTptPC9vtDK6Y4UsawIGEw=;
        b=GnbJ+thJNxWJTeyZvMDyFv402mU9i1viNDOBFep7ivyelIDKwVgClQBnn9CKUV0c+E
         npnOvdfGR1HEahhvkkeXBKLGFLystC6kHURdDexGbDu7cXKFrpvujl7+9ADulmWgp3ES
         I0IA3GwTAwAc2aanT0J2sloswz14UVyI39O9YIsyVtYITHilYBWH3knFUs7BM7YdmWqB
         yMFn8yA16TL8QmLwVxAaXoA+25eYIwGb6JZ1BwRDDnM5gQSl+HNbUkRY5pKhX8jxm94X
         fTQnj5qDf4syZR4GwITXt8O0W4tzLU8ODx4ag4whZoCWfNHBYTc2kV/y9Hjnuja4YFgo
         N9Dw==
X-Gm-Message-State: AOJu0YydGehW5XuGuR4HnaojlIJw+Ubz7rqsCuMIksW90cLOkLE5eDEh
	IE7CRU1M6jqILmMfqtE52lBZN0zZ4SzdiKFZ0ugVnypdwNeolX5ttKcnrMsizl5LsLswYyX01JH
	f
X-Google-Smtp-Source: AGHT+IG5nj7+qKPN+fyXKItdbWqs8orgg13HpQOsUq41dDr0TbYzqER7SpnRb7ML7RcSOjRZiMicxA==
X-Received: by 2002:a17:906:d7d0:b0:a8d:5e1a:8d7b with SMTP id a640c23a62f3a-a991bfde131mr164688066b.43.1728029847903;
        Fri, 04 Oct 2024 01:17:27 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH v3 04/19] xen: Update header guards - ARGO
Date: Fri,  4 Oct 2024 09:16:58 +0100
Message-Id: <20241004081713.749031-5-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241004081713.749031-1-frediano.ziglio@cloud.com>
References: <20241004081713.749031-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updated headers related to ARGO.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/include/xen/argo.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
---
Changes since v2:
- exclude missing public headers.

diff --git a/xen/include/xen/argo.h b/xen/include/xen/argo.h
index fd4cfdd55c..3ef62dab19 100644
--- a/xen/include/xen/argo.h
+++ b/xen/include/xen/argo.h
@@ -12,8 +12,8 @@
  * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef __XEN_ARGO_H__
-#define __XEN_ARGO_H__
+#ifndef XEN__ARGO_H
+#define XEN__ARGO_H
 
 #include <xen/sched.h>
 
-- 
2.34.1


