Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C14087FB69B
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 11:04:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642876.1002668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7uwq-0002vi-TK; Tue, 28 Nov 2023 10:04:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642876.1002668; Tue, 28 Nov 2023 10:04:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7uwq-0002tc-QH; Tue, 28 Nov 2023 10:04:08 +0000
Received: by outflank-mailman (input) for mailman id 642876;
 Tue, 28 Nov 2023 10:04:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PT6c=HJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r7uwo-0002NP-TZ
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 10:04:06 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7750044f-8dd5-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 11:04:06 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2c997467747so36351941fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Nov 2023 02:04:06 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 a10-20020a056000050a00b0032ddf2804ccsm14288986wrf.83.2023.11.28.02.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 02:04:05 -0800 (PST)
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
X-Inumbo-ID: 7750044f-8dd5-11ee-98e3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701165845; x=1701770645; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WKzhNQNtxrNJla1Dvx/CNVFVt9mfF6UZ3a4ebqZogfY=;
        b=uSy2i5dY2qzwh0od/byWASiBZg0pemBzLLZkFcxeyHCRNY9Zo3eSxZITng4aehZdw9
         KYlY+ZpwcMTR4KvG6zXC3K/n92lq0q0qJkSOqc5aUe5eM9hyKZsDdZwcx2fyVyH7WYxP
         A4xRCjqYUoANEzVTQRcccWR+pgTBJmyP34STc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701165845; x=1701770645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WKzhNQNtxrNJla1Dvx/CNVFVt9mfF6UZ3a4ebqZogfY=;
        b=P7qUlz7OMi0wru3DeEvj8ewUwZSx5ctBHt+SvEAQfaayC+htAsEci7ej3J8ci6vA5n
         aSB68Q0MEr5I27jICxgtW9TNos89wBGdRxrJh/83HxAZdcL5OjD+0WBHxHlgzyZmbuk6
         22VzoXBL4ymMhdw0XkoimClEygECgYH22beOoc7lqMWzFQHkzAzprj2Q8g31O2erNEIF
         RHX0RkOPK/nyeu+iGZAK0V7bqAnQnxUqnJYrMHxmS9dpj8Gph0o8MopSfRPpIxmYZoxr
         W/gJn6Tu8LFwzmg2HSgazTPdwRBBjtjDKYUaCTYE801avn9KfKQgGx2+woGi0JxtT3Jp
         nbaA==
X-Gm-Message-State: AOJu0Yxpw+I0VqmIcmEFaCSJNrZ7Xt7E95wuAhL79zu5IWMmhGYId1KD
	Ke/Y8iOrUMgSyFZ7i/h4ikvLvLumS/gwYnxEs9Q=
X-Google-Smtp-Source: AGHT+IEAPFRNttEIDc2cga3vjZhyJzcR+IN/kUQKqgwhWxsJGmAecXFEOYUlzZSYsfk2FSth4FaCfA==
X-Received: by 2002:a2e:1551:0:b0:2c9:9a39:28ed with SMTP id 17-20020a2e1551000000b002c99a3928edmr5366718ljv.31.1701165845276;
        Tue, 28 Nov 2023 02:04:05 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 2/5] automation/alpine: add elfutils-dev
Date: Tue, 28 Nov 2023 11:03:49 +0100
Message-ID: <20231128100352.35430-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231128100352.35430-1-roger.pau@citrix.com>
References: <20231128100352.35430-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In preparation for adding some livepatch-build-tools test update the Alpine
container to also install elfutils-dev.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 automation/build/alpine/3.18.dockerfile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/automation/build/alpine/3.18.dockerfile b/automation/build/alpine/3.18.dockerfile
index 4ae9cb5e9e30..aac2d8cc82d9 100644
--- a/automation/build/alpine/3.18.dockerfile
+++ b/automation/build/alpine/3.18.dockerfile
@@ -47,3 +47,5 @@ RUN apk --no-cache add \
   libcap-ng-dev \
   ninja \
   pixman-dev \
+  # livepatch-tools deps
+  elfutils-dev
-- 
2.43.0


