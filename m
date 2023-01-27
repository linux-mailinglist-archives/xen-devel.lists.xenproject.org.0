Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9965167E0A2
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 10:47:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485376.752561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLLK8-0003UM-DW; Fri, 27 Jan 2023 09:47:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485376.752561; Fri, 27 Jan 2023 09:47:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLLK8-0003Sx-Ad; Fri, 27 Jan 2023 09:47:08 +0000
Received: by outflank-mailman (input) for mailman id 485376;
 Fri, 27 Jan 2023 09:47:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yrR2=5Y=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pLLK6-0003Dw-TY
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 09:47:06 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f28a56d-9e27-11ed-a5d9-ddcf98b90cbd;
 Fri, 27 Jan 2023 10:47:06 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id g11so4197186eda.12
 for <xen-devel@lists.xenproject.org>; Fri, 27 Jan 2023 01:47:06 -0800 (PST)
Received: from uni.router.wind (adsl-40.109.242.227.tellas.gr.
 [109.242.227.40]) by smtp.googlemail.com with ESMTPSA id
 l23-20020a50d6d7000000b004a0b1d7e39csm2054861edj.51.2023.01.27.01.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 01:47:05 -0800 (PST)
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
X-Inumbo-ID: 8f28a56d-9e27-11ed-a5d9-ddcf98b90cbd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZuMqEkUObXwx6VxSDOaQ2lorR4GwNazZTarPmLJUzc4=;
        b=iYwByFmSd5mLhkd48HIQR2RURAXcUrDGHluwCzAWjg8ApMA0m0RzUv9VWguRbyS1Dw
         D6A3QgGLjLHPR3KpTLU+oQZ7xxtSaSGK1R+MDuLeDstSk5miLKMuzYwO3NzZK8+MtNCl
         AMSgV8H24BvC1FO8dLhg0EskIc8BvFaGTdmKX1gVpfwzajGq/kQrgSQvoycXHXChslmR
         fmM9hvEa71EkiLdUAxMKZVxrr/k3l0Ht6vjcDZfmKxuoeYiQkWgK5oruPGCBskjxC1Ij
         QPd4NDqphFgLs60yMC0MnO3qEAplw7HhGJlbb3FoD1c30PQj90SM9b0f8b7wf8t1gOAA
         6w+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZuMqEkUObXwx6VxSDOaQ2lorR4GwNazZTarPmLJUzc4=;
        b=MkboXaiwRqNnarouZA61QY/urkBaXWUqZb7nnclpw4GClFfHpIgSS8pm0bkaVZ3xKO
         PL413WFKIiNrbQfBxiO9GtlntMowgUN8DSoQm5+UU4Z4TtSfPVpljQ14Eb903p3397Gi
         N9VtIiHMiUTLlLV2ZCoDhACRTxuaoJ3jBCfRTV5b+2GP5sVETr6dP1ZT+e13cPUt6O4w
         XfSSgu+QiFJjv43uXUMy3FGwDeAuJn0jBtj/ObwQGTlgdu3nX+IicQWnnA0VHlxuMeQi
         Io8r6elb5hAiTkcI1fQUjtpGTbtC/V8iXJLYNu3s/7MRrKj864zmXCnzD7uSTY/lcg9q
         fi3Q==
X-Gm-Message-State: AO0yUKVLC2us8SWcZ+4qcFB2zjpOCAUYHg2znmfwy9e7J6+liXr3tMiQ
	+OHph204ljY1e3f2YIIL3K/XKf2zk8Y=
X-Google-Smtp-Source: AK7set/4hBHF+bf0ZMmx3MDbntL254QqcV8kidTc7ZqquaiRl51OStrmxdD2WnNWCdsTH7mBbgsJ2w==
X-Received: by 2002:aa7:d899:0:b0:4a1:a308:8b8f with SMTP id u25-20020aa7d899000000b004a1a3088b8fmr2865688edq.20.1674812825616;
        Fri, 27 Jan 2023 01:47:05 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 1/2] x86/emulate: remove unused svm specific header
Date: Fri, 27 Jan 2023 11:46:55 +0200
Message-Id: <20230127094656.140120-2-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230127094656.140120-1-burzalodowa@gmail.com>
References: <20230127094656.140120-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes: 2191599bacb7 ("x86/emul: Simplfy emulation state setup")
Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

I 'm not sure that a Fixes tag applies in this case. I 've added it mostly
for reference.

 xen/arch/x86/hvm/emulate.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index cb221f70e8..95364deb19 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -24,7 +24,6 @@
 #include <asm/hvm/monitor.h>
 #include <asm/hvm/trace.h>
 #include <asm/hvm/support.h>
-#include <asm/hvm/svm/svm.h>
 #include <asm/iocap.h>
 #include <asm/vm_event.h>
 
-- 
2.37.2


