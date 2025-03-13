Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5ECA5FC02
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 17:39:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912901.1319156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslak-0003cm-Su; Thu, 13 Mar 2025 16:39:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912901.1319156; Thu, 13 Mar 2025 16:39:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslak-0003WH-Lo; Thu, 13 Mar 2025 16:39:30 +0000
Received: by outflank-mailman (input) for mailman id 912901;
 Thu, 13 Mar 2025 16:39:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UNRr=WA=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tslaj-0000Wn-Jz
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 16:39:29 +0000
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [2607:f8b0:4864:20::1036])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9495a7a-0029-11f0-9898-31a8f345e629;
 Thu, 13 Mar 2025 17:39:26 +0100 (CET)
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-2ff85fec403so4308544a91.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 09:39:28 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30119265938sm4020084a91.39.2025.03.13.09.39.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 09:39:26 -0700 (PDT)
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
X-Inumbo-ID: b9495a7a-0029-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741883966; x=1742488766; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cOa15ppvF5kxsldjPkSIJYe5T0c824L9GaUvR3via0Q=;
        b=iMMCRlvMjRkWl3bXt4ODIHd8IRhsPtR7UUKUFV9iL9kTPP8jYWquSI1SwSWGSxwKmF
         XpMOJc4dn/TnvVjOuG0791Vkf+rIftgDeXOmC5mwD8jSabJfvCbQW1MDApsypGLxyrhl
         ketYI9WhLVmtdlNU4Csbyol8Aneh6LsG0LDjt5lp3G3N1DPD1X2d3GRksk2vjcT/J1B8
         HqaZUY7XNWha2xsBbhl+mgBDN0qXVUnKjmUGIrcQssdIVOIZzGSvn0nSX8jmZ/E8qqL0
         B4bssBkOxJYeACVnzZPouAl3BVgIc0ml22Oue5AIGlKAOgOz5p2EHAhWmmi2Sz2NxGWb
         m48Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741883966; x=1742488766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cOa15ppvF5kxsldjPkSIJYe5T0c824L9GaUvR3via0Q=;
        b=beYdh9uoBIEHEVrw1U92VvoIlmAX8tHC8rO3wjLTbu1l06mTzyBtI3tU7l99JzGIVb
         bGFCd1nPjG8zAl9AwMAErrgh62H8mAjIGgsZaTN/CTdzuzboesYyZstt24tJyK8QlYQ9
         sezSZQzZXHBSIF9O7K/gRqO+c66OfEZ41m9/rjMs9+quBNSkTN6Y4szGO8eV5GOUBFM5
         g8cHVYSxcbWAgNS3RS3XY7qxhKWlq+LprtCxMf/0OkMaGRn+hyu6Z3BoKu7htQUO1Fws
         I6fTz6GjZpInXPBgqfJXb6CjuuS/waPdHD3/4pE3oD5uAzRbrHBQx0U3KprxAAN+ENNv
         7bjw==
X-Forwarded-Encrypted: i=1; AJvYcCVEAU36GCZ7rshgB1cfbxMB5wfiP9rDXQWDFjv8b8cErJ3zEkCQ4PHl4OHCbA1qef2YW5goc/iUgl8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwijuYKJotpEbzRDqSnym8tEJrUsDGi3WMiU/G2+mnz6AMjHPDA
	wATNqsvJxB1VUsqPs8c90LKsdx6P+4VObKNQxBGh1liHfmGgdRT2WFTRfo28M8g=
X-Gm-Gg: ASbGnctcDgXU95m7LnqQheC5HmAlUkc1DuSQ0zcXKQ5lE7jhr/eK9eCynKwKhrvaxxH
	00EN4NKYxcDvueGaBrpf2qBY3LKARZr2Pslt/d+EIZH0jyU0b4GKZHtxeOlRoQoaHu+T/ykkevp
	EFUgAqsKhSrI2tQuPxWHr717pTAHGbFiJNnljUjh/WP1tPLIAD81J7pRjnBZbaRVRg81lM4Y8qU
	C9DiYnIg29j9tfUxnAZB6RddRSW6woCT/kIvcZIA+bOd4tfCYqkUxra3bcSXaO/JacojG63EJc5
	9f950JhJRVxFdP4mgVdzEiv0TM+jAQV/Djk17SyIlS7X
X-Google-Smtp-Source: AGHT+IF4AzvOcFWztZZ2bxlYvUCRcZgJhJkixRgg9I+5NbaWKKn606UlzAb4zSHX4i3sVnz0TZr9yg==
X-Received: by 2002:a17:90b:574c:b0:2fa:30e9:2051 with SMTP id 98e67ed59e1d1-30135eab105mr4295980a91.5.1741883966469;
        Thu, 13 Mar 2025 09:39:26 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org,
	Peter Xu <peterx@redhat.com>,
	alex.bennee@linaro.org,
	manos.pitsidianakis@linaro.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	kvm@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Weiwei Li <liwei1518@gmail.com>,
	qemu-riscv@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 13/17] system/physmem: compilation unit is now common to all targets
Date: Thu, 13 Mar 2025 09:38:59 -0700
Message-Id: <20250313163903.1738581-14-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
References: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 system/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/meson.build b/system/meson.build
index eec07a94513..bd82ef132e7 100644
--- a/system/meson.build
+++ b/system/meson.build
@@ -3,7 +3,6 @@ specific_ss.add(when: 'CONFIG_SYSTEM_ONLY', if_true: [files(
   'ioport.c',
   'globals-target.c',
   'memory.c',
-  'physmem.c',
 )])
 
 system_ss.add(files(
@@ -16,6 +15,7 @@ system_ss.add(files(
   'dma-helpers.c',
   'globals.c',
   'memory_mapping.c',
+  'physmem.c',
   'qdev-monitor.c',
   'qtest.c',
   'rtc.c',
-- 
2.39.5


