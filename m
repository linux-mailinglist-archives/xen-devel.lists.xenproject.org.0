Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9799F1579
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 20:09:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857087.1269518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tMB29-0004Vz-5W; Fri, 13 Dec 2024 19:09:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857087.1269518; Fri, 13 Dec 2024 19:09:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tMB29-0004Tc-2N; Fri, 13 Dec 2024 19:09:05 +0000
Received: by outflank-mailman (input) for mailman id 857087;
 Fri, 13 Dec 2024 19:09:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I5eD=TG=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1tMB27-0004TW-IU
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 19:09:03 +0000
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [2607:f8b0:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5eb0664-b985-11ef-99a3-01e77a169b0f;
 Fri, 13 Dec 2024 20:09:01 +0100 (CET)
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-71e1158fe3eso974845a34.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Dec 2024 11:09:01 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71e4834da91sm29697a34.18.2024.12.13.11.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 11:08:59 -0800 (PST)
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
X-Inumbo-ID: b5eb0664-b985-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734116940; x=1734721740; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VBuAnCPgZLHdX0sVpQB+fbM15dWtrtdAGUwOdHBBqsc=;
        b=lmkMzcGiWAmwSkFj8FYR/5sT4TP38QIHngNyyOJNNh1dIE2fvUngs/bSTaYy1HLqxk
         ikVnyMS9TNdpoyyFqLKTOmLLuvMGDrNJm1GHpQ9EWTXNnkC3ui/dAOmq/DzekD+yh4qo
         ZN+MLOPWZhaHNcxcQ9KRsLbpVmr42WyB+uKyxx+EbJ93XdJc3hH/aZ9IIMExbg2WIqKn
         aFuFRdvGbbwIblilmmvmPQqBwGGebbvngD8K7thQibbhcXY/8p1ecpXbakQS8UKmvtag
         SenTcdQSIka0994kw+/RFy4ZXyrnmvHkE4Ao76jby9uKQGhjFO7owWa6rIXE5fdhMJpO
         DF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734116940; x=1734721740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VBuAnCPgZLHdX0sVpQB+fbM15dWtrtdAGUwOdHBBqsc=;
        b=WmZG44ELWgTmrXISVE2gVVODlQm+efzVJl0+6lGg6y5toRRfUkGGrrp7MvTKW1c+QO
         qOPQw8WTJJyNXSJ+amXjSdczyjcE5wPsfmOVe4GROTUhivupu7aluxCWaxuIsYgFcWtN
         rxi6/OfozNZzPTipSd86WyOHs8LAde3Zeo3XNe9GlEg532+YSrr0NsdJpIJ+81IpJvqm
         XG37zJARq1aG7Q/wvtH+yUbQTEHJqa78w83lJ2mQKxG+M2Z3fNO4PbygSGInTLAFhhRN
         4L0qwjXEinf2cCjv3m5TN6vD3wLxCrwxiqSWOcfNA+dPSc6oV55u3Rme9CmF4MjofG7L
         Zvtw==
X-Forwarded-Encrypted: i=1; AJvYcCX+rP10ikkcLbXuws3g9TTAO0D+RamE1tcMUTp/amgQbr8E0vr1tCaLYaLtvF+09Tb6pMZ2pbir3eo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzrb0CK78TJsU+TMaCBBSrlMYNer5b1VVDWk9U56aG26ZIamwcj
	TyxbKcOV1ykTijSZgT/LhuyfWjLVaygmEz4rYKpR1dbUbgGqM+rDwJVGacnTGZo=
X-Gm-Gg: ASbGncvBUzXirFMVEa3jl7rdy2SVYlKnPDATwtz7FXGnr538tFjorMp5DMWZHZrih/0
	cFlTZ/IvgvgHvOXeawHqInTItdvMz+oWIt7H4YVjdrOSPgitlJWKKkqb3OCzUlZJqquMPtH/s6N
	PfhFCya4CAwjojwqi0Dsh3MnlsIrYJ++SDkm0B963ZzJvZunx3OBxp2xoS7IUdxC+lqs3nZ9X3P
	oWpRsXVgSsx3shqyalgIatHkNc1v/se1dJgtdVL1s7FPbYacjOWwEUNCpne9U9o
X-Google-Smtp-Source: AGHT+IG4Oaa1CFMaif+EnKB8kf2kg/gBi+Er63DHsr2guVeeoIb4v5eKEHl55hIr030QigRhTnJLHA==
X-Received: by 2002:a05:6830:2a92:b0:71d:f6d3:9fd2 with SMTP id 46e09a7af769-71e3ba3f147mr1411664a34.24.1734116940056;
        Fri, 13 Dec 2024 11:09:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs),
	qemu-block@nongnu.org (open list:Block layer core)
Subject: [PATCH 18/71] hw/block/xen-block: Unexport PropertyInfo
Date: Fri, 13 Dec 2024 13:06:52 -0600
Message-ID: <20241213190750.2513964-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241213190750.2513964-1-richard.henderson@linaro.org>
References: <20241213190750.2513964-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xen_block_prop_vdev is not used outside the file.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/block/xen-block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index aed1d5c330..72cfd6893a 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -659,7 +659,7 @@ invalid:
  *
  * https://xenbits.xen.org/docs/unstable/man/xen-vbd-interface.7.html
  */
-const PropertyInfo xen_block_prop_vdev = {
+static const PropertyInfo xen_block_prop_vdev = {
     .name  = "str",
     .description = "Virtual Disk specifier: d*p*/xvd*/hd*/sd*",
     .get = xen_block_get_vdev,
-- 
2.43.0


