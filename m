Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A082697161D
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 13:03:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794288.1203114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sncBL-000809-KN; Mon, 09 Sep 2024 11:03:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794288.1203114; Mon, 09 Sep 2024 11:03:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sncBL-0007tJ-Ff; Mon, 09 Sep 2024 11:03:43 +0000
Received: by outflank-mailman (input) for mailman id 794288;
 Mon, 09 Sep 2024 11:03:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dA/l=QH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sncBK-0007rV-M9
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 11:03:42 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2be16a09-6e9b-11ef-99a1-01e77a169b0f;
 Mon, 09 Sep 2024 13:03:40 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a8d24f98215so229025966b.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 04:03:40 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25ce96a7sm324623966b.158.2024.09.09.04.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 04:03:39 -0700 (PDT)
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
X-Inumbo-ID: 2be16a09-6e9b-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725879820; x=1726484620; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TXUmWlwTdTjWYOzxS3av+DQ/P/2LExw+a7gF6NCKfWQ=;
        b=CGnaUTNlyHk5tN6Nq5C+nA95w50eBEGNDLlGHVYI6q7d2qB/7ydcqA2yPk7auKthpb
         zQWnmLHst4cy6XgF6k9Z7JbXaq7Z8wKewRJStqCJ/Z69p2J3VhpHko+9j2qGgmu7LDbq
         /t2XeyK5//YMdaDX3QmKOAl+rjm0fOW2S9dDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725879820; x=1726484620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TXUmWlwTdTjWYOzxS3av+DQ/P/2LExw+a7gF6NCKfWQ=;
        b=PoZkZe1o7JGP4jOoG8cQGv6RmUFO5lPuLCwqq4OsgChqutJjYPN1SQjbAL7/JohPDi
         0nBMYi1ZG5ClLPonipa7zQf0N6sSfsXQYf7BjpoUh50EeM60ermaGPgoESa3qsiZWHya
         DUHnup9VrgYYnOvlyhxo+GKHfPdETrz4SFZYij13XRAktA89SZv6/n90oft5jXNRxCjH
         fcfer3HWgJuxNBj13H5HgwZLoijr/MoOexnHKcgFcomOasRq8P2RplJQ6LbgH2NfG70z
         mgUGBlpIVgHfIqLNXB1dSbP+4rKyT0eCNxpG/WBTxjYoMMyVLbwr7UuboXPMK4YYOpvC
         IhDw==
X-Gm-Message-State: AOJu0YxDsAt17+I8cLZyd6pHdBsKA8J41bKngEUcjE5GEbfuxzG3nIEf
	L8KX3LyxVe0PEZvSW3jz5VtWjH8YMVHnJslS/RL2G+r7vddj38MsbFRkcGrFHfur3W6mDyywKUO
	U
X-Google-Smtp-Source: AGHT+IH/KIOeTgpAuyHh+E8dBDOBbLzcEFrM3RU228z91O7leohp83aA60ojGDVibVd9xzwEVk1Kqg==
X-Received: by 2002:a17:907:980e:b0:a77:cca9:b212 with SMTP id a640c23a62f3a-a8d248a611amr445920866b.45.1725879819783;
        Mon, 09 Sep 2024 04:03:39 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>
Subject: [PATCH v3 2/2] x86/boot: Add missing __XEN__ definition
Date: Mon,  9 Sep 2024 12:03:29 +0100
Message-Id: <20240909110329.84512-2-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240909110329.84512-1-frediano.ziglio@cloud.com>
References: <20240909110329.84512-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We are compiling Xen source code so we should define __XEN__
macro.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index dfe3cb7034..ff0f965876 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -15,7 +15,7 @@ CFLAGS_x86_32 := $(subst -m64,-m32 -march=i686,$(XEN_TREEWIDE_CFLAGS))
 $(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
 CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float -mregparm=3
 CFLAGS_x86_32 += -nostdinc -include $(filter %/include/xen/config.h,$(XEN_CFLAGS))
-CFLAGS_x86_32 += $(filter -I% -O%,$(XEN_CFLAGS))
+CFLAGS_x86_32 += $(filter -I% -O%,$(XEN_CFLAGS)) -D__XEN__
 
 # override for 32bit binaries
 $(head-bin-objs): CFLAGS_stack_boundary :=
-- 
2.34.1


