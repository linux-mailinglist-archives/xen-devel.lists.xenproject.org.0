Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DF75E8008
	for <lists+xen-devel@lfdr.de>; Fri, 23 Sep 2022 18:40:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410879.654034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oblj0-0004HZ-Ee; Fri, 23 Sep 2022 16:40:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410879.654034; Fri, 23 Sep 2022 16:40:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oblj0-0004Fd-Au; Fri, 23 Sep 2022 16:40:26 +0000
Received: by outflank-mailman (input) for mailman id 410879;
 Fri, 23 Sep 2022 16:40:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kfh5=Z2=gmail.com=asml.silence@srs-se1.protection.inumbo.net>)
 id 1obliy-0003zv-9l
 for xen-devel@lists.xenproject.org; Fri, 23 Sep 2022 16:40:24 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b7673d7-3b5e-11ed-9647-05401a9f4f97;
 Fri, 23 Sep 2022 18:40:23 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id e18so582025wmq.3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Sep 2022 09:40:23 -0700 (PDT)
Received: from 127.0.0.1localhost (188.28.201.74.threembb.co.uk.
 [188.28.201.74]) by smtp.gmail.com with ESMTPSA id
 x13-20020a5d60cd000000b0022af6c93340sm7717399wrt.17.2022.09.23.09.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 09:40:22 -0700 (PDT)
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
X-Inumbo-ID: 6b7673d7-3b5e-11ed-9647-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=uIbjcfAGyfInoLm/OvWITyB0RrSdYYX1RircUBZVOuM=;
        b=CKI/w9qlPppvR3tyBdHeNFUn52RNE+MeZLNbpK6WQHJMNQ7f3vkWFTdLCCcM+xWq3t
         88EF5j5pTqPAB2s3p0pS1p4UUk241RhmRK9VMkOzQijAnB5okJgircXsRKhYPwGleM3N
         de//MuiWg86ofbLfaub6s67iv1uESid4nF14NOWOT5jY3SBRpR7/H12eiO/oxBSXm0/P
         ILfCI77hYYZ+7YxxAz7yP8DxSO8h0V/lXa2Gih0fct6VL2AJNREKCz2Xt1ycpc+sJE2Y
         VHG/A+GqTB4qZ5Cxq9oyDzh1hyfFvfD0o3F+uWIc7yGHB2I5tBiyMFhHzB0o6nFg5XwE
         pLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=uIbjcfAGyfInoLm/OvWITyB0RrSdYYX1RircUBZVOuM=;
        b=QiqFvgBoN22BiAb9rl9XqFF8gSLp95y00aPnhiXM4TL6QdUGzVOzKyXXyfi8JIuCEK
         G5WtbXKkTv8xQlTeOHbiBLlCTZBKK6oPA7dODH/ZYx4pn5368B+8ddjUnYElziQJrKYr
         SLuwIsLpWHX8fGSI2j8AgBErrH4pdCw6ousUX+KM9cX5t7pfgsjrwmqHH3NID+iJzWid
         OMvZy0iBl5lVLFak1vNg5yUBvoQCmzU4jE4i2j/PzRDcLzD9Ky6vhzKRCQwK0v+wg+ja
         /YIyJ6e+cDFq+baYThN84WhsCPizOlhf+P42N4MXdId4mvSZgFPo7ljsbKnJ14Q2fKbG
         fYvg==
X-Gm-Message-State: ACrzQf0s13VVGGQnbT5kRbddcpEvEIGINxL2yynEuVOs+gzE9D8GDDpy
	JkRo1LM/RlwXvJkmjUxK5S8=
X-Google-Smtp-Source: AMsMyM4CW6l8pZR3BmCcj39hcl6rGI9MDfbfk8pAVz7vOj4J8jOaapYhvNsZhT0FZMIxSSMOhL5SAw==
X-Received: by 2002:a05:600c:3d86:b0:3b4:b65f:a393 with SMTP id bi6-20020a05600c3d8600b003b4b65fa393mr6744885wmb.0.1663951223070;
        Fri, 23 Sep 2022 09:40:23 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Wei Liu <wei.liu@kernel.org>,
	Paul Durrant <paul@xen.org>,
	kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Pavel Begunkov <asml.silence@gmail.com>
Subject: [PATCH net-next 1/4] net: introduce struct ubuf_info_msgzc
Date: Fri, 23 Sep 2022 17:39:01 +0100
Message-Id: <641bb6844e67e639a9403b8eab96c3fa34659e2a.1663892211.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <cover.1663892211.git.asml.silence@gmail.com>
References: <cover.1663892211.git.asml.silence@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We're going to split struct ubuf_info and leave there only
mandatory fields. Users are free to extend it. Add struct
ubuf_info_msgzc, which will be an extended version for MSG_ZEROCOPY and
some other users. It duplicates of struct ubuf_info for now and will be
removed in a couple of patches.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 include/linux/skbuff.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index f15d5b62539b..fd7dcb977fdf 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -554,7 +554,28 @@ struct ubuf_info {
 	} mmp;
 };
 
+struct ubuf_info_msgzc {
+	struct ubuf_info ubuf;
+
+	union {
+		struct {
+			unsigned long desc;
+			void *ctx;
+		};
+		struct {
+			u32 id;
+			u16 len;
+			u16 zerocopy:1;
+			u32 bytelen;
+		};
+	};
+
+	struct mmpin mmp;
+};
+
 #define skb_uarg(SKB)	((struct ubuf_info *)(skb_shinfo(SKB)->destructor_arg))
+#define uarg_to_msgzc(ubuf_ptr)	container_of((ubuf_ptr), struct ubuf_info_msgzc, \
+					     ubuf)
 
 int mm_account_pinned_pages(struct mmpin *mmp, size_t size);
 void mm_unaccount_pinned_pages(struct mmpin *mmp);
-- 
2.37.2


