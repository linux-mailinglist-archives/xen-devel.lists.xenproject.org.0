Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAB932525D
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 16:26:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89813.169556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFIWj-0006TT-Dr; Thu, 25 Feb 2021 15:26:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89813.169556; Thu, 25 Feb 2021 15:26:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFIWj-0006Sp-AK; Thu, 25 Feb 2021 15:26:05 +0000
Received: by outflank-mailman (input) for mailman id 89813;
 Thu, 25 Feb 2021 15:26:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yJgK=H3=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lFIWh-0006Ig-U1
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 15:26:03 +0000
Received: from mail-ot1-x330.google.com (unknown [2607:f8b0:4864:20::330])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2d3e7a19-c73b-4d5d-91ec-0ba3d8d4e8c0;
 Thu, 25 Feb 2021 15:25:52 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id d9so5962992ote.12
 for <xen-devel@lists.xenproject.org>; Thu, 25 Feb 2021 07:25:52 -0800 (PST)
Received: from localhost.localdomain (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id l4sm1047292ooq.33.2021.02.25.07.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 07:25:49 -0800 (PST)
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
X-Inumbo-ID: 2d3e7a19-c73b-4d5d-91ec-0ba3d8d4e8c0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Do1GcU7RuDyB1+LZXwivBdKq5nGfBzBt9V9qtSs00zM=;
        b=H8ENibihTuhlK3Xw63b8w6JRznQPzGooXd8JHRdERiFZ5AxRjVSjuHI6SHfNOvBtDn
         wybd8pQNY+iQNQz+OpMJZOHghR9rkloZ1g0m0g9QUroMU66Ni5hpja7CLCC2KeoTM9yg
         ACEnCb+fwmztmvzxcLK7YK0xPuha0sa1L3ELQAD7lxg2L0Ct69WnOfXS7+tMzE6KtflG
         /fFFpIJNVvKmjqoHm/A94dIeoHsPzmfKeE5rbjeuwpKGeEr+jvjVU7zfa6ULjMg5QMZn
         xLBvP8FOwACS/6jBG31mCR8r1L/jRixlC4XuzV47AQS85qYAmCqo7yijtR7uEV8HvlIJ
         zH2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Do1GcU7RuDyB1+LZXwivBdKq5nGfBzBt9V9qtSs00zM=;
        b=VsMFlnbvXsPfw1Gt3kiNQKBi8fA2V/oJOWGFwkg3mwkAwvXDYlyPxvnNmGBudlbqpy
         /iu+f+RDsntdKhv1A1KteNiZq7aTRTyXjvqbonHBOZRg2zoDswSgG3mLIi4uAVKjTxD5
         86Y/vj/FIFBKgwYdvM/ZsRWxr0Az8u+F7MSfHnY/+ZA7qpe6EGKMQfY0fwUrtMy2J5+d
         kstwNipBhheXeYRxafDSFw+xE7rtcullrpNJMLwEOuNx2jKR5ugpwPY6g81/vn8ikwGY
         b/BeYT3Wxq2dBTz+TcKWpfFdF8HKrGyXWNZfs7nzKc79vB2aGQSItaqTCGogjrW01GRa
         dBSA==
X-Gm-Message-State: AOAM531AdoNo4G7lLgUcxYqeww5+bex+FWdI1GacfTA74cwgRxAZT6Bc
	kG7pLjrAGHOo+h9buamX22sLE9xFoVT1Irbi
X-Google-Smtp-Source: ABdhPJyF8FKJXVVBU51bxVTaQUYzOAGv8map21rtIn+aTAQAQPLP01Vev8hOtXXVuTcM15xvoVJPDQ==
X-Received: by 2002:a9d:798f:: with SMTP id h15mr2704210otm.277.1614266750070;
        Thu, 25 Feb 2021 07:25:50 -0800 (PST)
From: Connor Davis <connojdavis@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH for-next 4/6] xen: Fix build when !CONFIG_GRANT_TABLE
Date: Thu, 25 Feb 2021 08:24:03 -0700
Message-Id: <eb2d1e911870f1662acfbc073447af2d29455750.1614265718.git.connojdavis@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1614265718.git.connojdavis@gmail.com>
References: <cover.1614265718.git.connojdavis@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Declare struct grant_table {}; in grant_table.h when
!CONFIG_GRANT_TABLE. This fixes the following:

/build/xen/include/xen/grant_table.h:84:50: error: 'struct grant_table'
declared inside parameter list will not be visible outside of this
definition or declaration [-Werror]
   84 | static inline int mem_sharing_gref_to_gfn(struct grant_table *gt,
      |

Signed-off-by: Connor Davis <connojdavis@gmail.com>
---
 xen/include/xen/grant_table.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/include/xen/grant_table.h b/xen/include/xen/grant_table.h
index 63b6dc78f4..0e5f6f85c7 100644
--- a/xen/include/xen/grant_table.h
+++ b/xen/include/xen/grant_table.h
@@ -66,6 +66,8 @@ int gnttab_acquire_resource(
 
 #define opt_max_grant_frames 0
 
+struct grant_table {};
+
 static inline int grant_table_init(struct domain *d,
                                    int max_grant_frames,
                                    int max_maptrack_frames)
-- 
2.27.0


