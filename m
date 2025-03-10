Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F25CA58C3B
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 07:43:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905967.1313480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trWqt-0002Lm-KX; Mon, 10 Mar 2025 06:43:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905967.1313480; Mon, 10 Mar 2025 06:43:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trWqt-0002DO-1v; Mon, 10 Mar 2025 06:43:03 +0000
Received: by outflank-mailman (input) for mailman id 905967;
 Mon, 10 Mar 2025 04:59:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fu2G=V5=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1trVEH-00070S-LG
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 04:59:05 +0000
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [2607:f8b0:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61434633-fd6c-11ef-9898-31a8f345e629;
 Mon, 10 Mar 2025 05:59:01 +0100 (CET)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-223959039f4so72659275ad.3
 for <xen-devel@lists.xenproject.org>; Sun, 09 Mar 2025 21:59:01 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736d2ae318csm1708308b3a.53.2025.03.09.21.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Mar 2025 21:58:59 -0700 (PDT)
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
X-Inumbo-ID: 61434633-fd6c-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741582739; x=1742187539; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nnRQREfY8a8hSo7O5I1BTgAG3l8eG/Rc3wUh1Oiddgs=;
        b=kvGAjamNHVP3zUFlVlqc4eqZJDNVC3pOlJCk0JpwNKfCRHL3+fFf+PQn5ihjFjqdq4
         kNH9NLKxw+C9yxcdrdOdDVGcXN5vNjIMjC8UW2atRBjuEkCV1U1/OwwtBB0BY0bkb6m7
         mameGeisaz9s/enb0CZbYhQ8X79LARZUf587f7XgaKQFzUOho7AGzuQitOavWaVLvkVJ
         wwxP/7YGGPbYKXnpU+T4UptMmV6niX50llnoEcOFeAb5U+arUBW0pUW6n9ct2asDPkat
         TtI2kgrzzXoylLR4kbkuaKSAJZBNCyaxbO+8xELOgs2DekRYFYRUPuQQZkKWdqiBNftx
         Fakg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741582739; x=1742187539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nnRQREfY8a8hSo7O5I1BTgAG3l8eG/Rc3wUh1Oiddgs=;
        b=U12OpdKFMEYM3/satlsKfy6ZAmUX+48f7trtdf68B91QuBXikXHUkJnqbG7VLGzAnF
         Mt82AsxvsCQ9nfRuyed3aJmNFRC1uam6J1Qtnj7++qQ1+9zIApoOnTNYEKdTJMquVNeg
         qgZyEkQG/3MXNnsTjTajgTTy0ZBIzo0m/yVwAWnCjfztmUBfxyH03FhZ7qH/tBcUIDh1
         dzp6AE1MPfc35/G5syVC9ICjD76uoGHrIj8I6lhpQcsZWpnt+EmAdx3j1ddgEp7Q/FRD
         S+VWEVe6mZipBU/G12sK8+nXsDFJma+Qw7EuVwcyqbN3bGPrKMuiBKs9sU3N5AkE9oDq
         YCqQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+TA8VNcmlaL9xYC0ng8A5S0B8KjN5AVhZdZXRG121iy1YI6b3VNeTn4BrwArmxEUp3gm2EuIZYcQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YycgCKHhoUi6BCNtihUe1P0QzCKk6qxBWRcjIhxFFwlhn0rDrqx
	tBF+oJGOdXO/pAeZY7+zuHdx2lbvnimiXRod3/tJy/9Ox4rKktVR4VcFeDrkHQA=
X-Gm-Gg: ASbGncsOookgIQgVIQqLZqMxlz1fWMADKKW0ZTiwLo2fo32rv7S8YilZq+V6WvWhUoD
	U1sIxVJb6IyUFkrNieqPx0ZTh+xqfVCEy/8WNZ+25OlFki3ZLgUZwrhoWt/Kqo+d57rnOvNCDYV
	MMkM7eVQRT0i9suXK/va96dDV5jZHhiKyuI268T9Vu/+9GZPb/OvoG4dRLUVE+rexilt3yPuHi7
	Or9BN+hrJBMxih49crJrXz+v6I943A+0Rfptqs5TG3mnUZl+8VnvFZPthzX/7tArih2+6PmIOXg
	wPPtseoi1NfgWbG2Kyw2QsO78zqgnTV5yqnt7UiRxYGD
X-Google-Smtp-Source: AGHT+IHAsq4Y63EYcwwuW/i7zg2X2liiOFC3cUgAGGWfi3nL4Ogmzyt5TH8VxxgwmAwHkd5TSMj4Zg==
X-Received: by 2002:a05:6a00:3e29:b0:736:5ee3:64d5 with SMTP id d2e1a72fcca58-736aaaed79amr16963023b3a.23.1741582739550;
        Sun, 09 Mar 2025 21:58:59 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	alex.bennee@linaro.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	kvm@vger.kernel.org,
	Peter Xu <peterx@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	manos.pitsidianakis@linaro.org,
	qemu-riscv@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 08/16] exec/exec-all: remove dependency on cpu.h
Date: Sun,  9 Mar 2025 21:58:34 -0700
Message-Id: <20250310045842.2650784-9-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
References: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/exec-all.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index dd5c40f2233..19b0eda44a7 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -20,7 +20,6 @@
 #ifndef EXEC_ALL_H
 #define EXEC_ALL_H
 
-#include "cpu.h"
 #if defined(CONFIG_USER_ONLY)
 #include "exec/cpu_ldst.h"
 #endif
-- 
2.39.5


