Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 387D3445FED
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 07:57:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222086.384115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mit9P-0008Kp-Tn; Fri, 05 Nov 2021 06:56:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222086.384115; Fri, 05 Nov 2021 06:56:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mit9P-0008Gf-Pm; Fri, 05 Nov 2021 06:56:35 +0000
Received: by outflank-mailman (input) for mailman id 222086;
 Fri, 05 Nov 2021 06:56:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gmz5=PY=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1mit9O-0008Eb-Oj
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 06:56:34 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 834c34e1-3e05-11ec-9787-a32c541c8605;
 Fri, 05 Nov 2021 07:56:34 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id w1so30026395edd.10
 for <xen-devel@lists.xenproject.org>; Thu, 04 Nov 2021 23:56:34 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id dt4sm3735150ejb.27.2021.11.04.23.56.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 23:56:33 -0700 (PDT)
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
X-Inumbo-ID: 834c34e1-3e05-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yH9Aud+KhB6bv78AcEs/8owAaYp6cfId4snOD7ig8jw=;
        b=EfwEGn9TETYI3BA8ZmMTaDRqGPxCqXvnVwC3dRPjriRMBXX3h/wixWYL8mkilXFism
         4ROBY4RdKHXgMgbKWI8NO+s0nJQU9XgD9EA5O4lH5BDPOcIaiqUD4yE/rWlJf0zj0hzD
         7iPduDZB2eOSWU3sVQQDxlKr62mlS28xpaWu1Oy8KxJzWnmK0/ajj3LKL3hQeynGu9gq
         tIS2yxE9jh/KHIlICHhSdzlmCyGORvS1MuI8ipwcmEYxbQaX/xs+3NNHfXuKpcEyLL9P
         H0wFfHiQQxHVtPrrjCTc5+tRUOkUnnMUMk2xmc/XYoSc99XeyLGbspcGP1hgKtePggK4
         dbjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yH9Aud+KhB6bv78AcEs/8owAaYp6cfId4snOD7ig8jw=;
        b=WGgHvPIxk+fmqz2WLT0K3snTOipPGx0fJb+hJC7xr31Pg78S0tHYJeUtAf9iEGnRzI
         lCzXR0X40UqXnGzWplU0hHkJhrR/bZ22uFrlFAIi4+KrGTHVQXj3F9JTShvhm6fOTEZ2
         ElM022M2VdjXprgv9vCjtVcwiGIGLQ/2JHShrDjjdxtUWyuq1BDfnrcvyauAqilK5GA6
         bCFa1VUHevtG5kjcF6KNvqEdEc0kTj99aIg1EbDNq305y5uLBRf00+xJfRDqFB4gh4Sn
         MIfZLrwNDb64qvGE3hoJSiUsd5moNXk8fJowkYq1BXRpKKVnKhBoLTg+5EG4Z/8BbVr+
         00Yg==
X-Gm-Message-State: AOAM533zlrCt0MT8AhX98tIBsFm2H8COVLCY7S2po19SaACHSdFVWqKD
	3gGRY3nSwU/QkVA4mCppIcPfp7S99/bC4A==
X-Google-Smtp-Source: ABdhPJyPoRRSpp2BwAz5XkpMz3lTivAT+uV0OLjngnMXEocJYUDT7N4y3Xq77SbrGFLNMo7gJZ1yZg==
X-Received: by 2002:a17:906:3647:: with SMTP id r7mr22797776ejb.124.1636095393576;
        Thu, 04 Nov 2021 23:56:33 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	paul@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v4 01/11] vpci: fix function attributes for vpci_process_pending
Date: Fri,  5 Nov 2021 08:56:19 +0200
Message-Id: <20211105065629.940943-2-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211105065629.940943-1-andr2000@gmail.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

vpci_process_pending is defined with different attributes, e.g.
with __must_check if CONFIG_HAS_VPCI enabled and not otherwise.
Fix this by defining both of the definitions with __must_check.

Fixes: 14583a590783 ("7fbb096bf345 kconfig: don't select VPCI if building a shim-only binary")

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

---
Cc: Roger Pau Monné <roger.pau@citrix.com>

New in v4
---
 xen/include/xen/vpci.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 9ea66e033f11..3f32de9d7eb3 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -247,7 +247,7 @@ static inline void vpci_write(pci_sbdf_t sbdf, unsigned int reg,
     ASSERT_UNREACHABLE();
 }
 
-static inline bool vpci_process_pending(struct vcpu *v)
+static inline bool __must_check vpci_process_pending(struct vcpu *v)
 {
     ASSERT_UNREACHABLE();
     return false;
-- 
2.25.1


