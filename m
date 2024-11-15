Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 381269CDDFA
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 13:01:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837296.1253295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBv1C-0001Re-FL; Fri, 15 Nov 2024 12:01:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837296.1253295; Fri, 15 Nov 2024 12:01:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBv1C-0001Ok-C7; Fri, 15 Nov 2024 12:01:42 +0000
Received: by outflank-mailman (input) for mailman id 837296;
 Fri, 15 Nov 2024 12:01:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Akm3=SK=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tButB-0005UF-NF
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 11:53:25 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 350c12ee-a348-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 12:53:20 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a9a850270e2so324784966b.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 03:53:20 -0800 (PST)
Received: from localhost.localdomain (0545937c.skybroadband.com.
 [5.69.147.124]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e0860afsm173492766b.188.2024.11.15.03.53.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 03:53:18 -0800 (PST)
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
X-Inumbo-ID: 350c12ee-a348-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzYiLCJoZWxvIjoibWFpbC1lajEteDYzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjM1MGMxMmVlLWEzNDgtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjcxNjAwLjA4ODQ4NSwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731671599; x=1732276399; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5TtGZQt/o/0voOaBWuW5frWebRPJ5tcYXUj7qWmm5UM=;
        b=cByWrLaV4JZ+ej7rI5qyHE/Jj5wvQ8+cyeb2H/byDHR97euSJeHkIipRqL+JBhwJeW
         WGRfD1Zy83Sv2j9oibcdcW4M8SciMYtaM0NNhGGBM/CYVSZags2rUUcyn2CE4Ws8pHtl
         WT9PaZXP7pGjSjRFrBRRqGEKlzOYMRwdvDmwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731671599; x=1732276399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5TtGZQt/o/0voOaBWuW5frWebRPJ5tcYXUj7qWmm5UM=;
        b=aSYzGy+3xjSKx4Nqq7lg9l8EfpcLhJHPbStjGTxY/dQhMtsr8j4/0Z2nSP1sFwTWYy
         2aZ1gXYk2u15zp+nhul19D0YI9Jsj9hGHPKTwFrXtkLXUNbwwjr5v4+qOqxkw+nCyvLa
         2/j8vOLCHP14YkP+SD1dZdJioyjqi1150+F1qE+xOms40b8MdIhJ06Y/UKyg6f9I0foD
         2MPFlOJrC9KsaSXnvkZ6sAuGhQxSZOPt4i2Z6ZkQyvXBbr9PKxMrz7VxCpHAxUyOc7uK
         CupBQecGM9tMlB40SNWHrzfWEbqZS9RaC/xdhmcXmNWlbRBwFaLQlC+nhgKt+mlpiVC6
         mHFA==
X-Gm-Message-State: AOJu0YzdRsFHSKCeF4G3kucaPWEi+1mPNDWD5e8tj0MXNtzmkDpObU8I
	31xUVee/px5zKgE9ZjgnXNWxaOuaP1HnVGej3urVQ/H7ONnpAx61T2AfSlOpLjB8QhFb3BtHek7
	x
X-Google-Smtp-Source: AGHT+IHqwuL6u7ZjChl11XwFW1ENcCh75yYnxH+6nO4Gf2UMXhuGEEd24iwFQNwokjSfqH88fD717Q==
X-Received: by 2002:a17:907:9802:b0:a9a:1778:7024 with SMTP id a640c23a62f3a-aa483421c64mr210075266b.20.1731671598808;
        Fri, 15 Nov 2024 03:53:18 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC PATCH 23/25] licence: Add Unicode-DFS-2016 to the list of licences
Date: Fri, 15 Nov 2024 11:51:52 +0000
Message-ID: <20241115115200.2824-24-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It's transitively reached by Rust code.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 LICENSES/Unicode-DFS-2016 | 56 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 LICENSES/Unicode-DFS-2016

diff --git a/LICENSES/Unicode-DFS-2016 b/LICENSES/Unicode-DFS-2016
new file mode 100644
index 000000000000..eca277f05e0e
--- /dev/null
+++ b/LICENSES/Unicode-DFS-2016
@@ -0,0 +1,56 @@
+UNICODE, INC. LICENSE AGREEMENT - DATA FILES AND SOFTWARE
+
+See Terms of Use for definitions of Unicode Inc.'s Data Files and Software.
+
+Unicode Data Files include all data files under the directories
+http://www.unicode.org/Public/, http://www.unicode.org/reports/,
+http://www.unicode.org/cldr/data/, http://source.icu-project.org/repos/icu/,
+http://www.unicode.org/ivd/data/, and
+http://www.unicode.org/utility/trac/browser/.
+
+Unicode Data Files do not include PDF online code charts under the directory
+http://www.unicode.org/Public/.
+
+Software includes any source code published in the Unicode Standard or under
+the directories http://www.unicode.org/Public/,
+http://www.unicode.org/reports/, http://www.unicode.org/cldr/data/,
+http://source.icu-project.org/repos/icu/, and
+http://www.unicode.org/utility/trac/browser/.
+
+NOTICE TO USER: Carefully read the following legal agreement. BY DOWNLOADING,
+INSTALLING, COPYING OR OTHERWISE USING UNICODE INC.'S DATA FILES ("DATA
+FILES"), AND/OR SOFTWARE ("SOFTWARE"), YOU UNEQUIVOCALLY ACCEPT, AND AGREE TO
+BE BOUND BY, ALL OF THE TERMS AND CONDITIONS OF THIS AGREEMENT. IF YOU DO NOT
+AGREE, DO NOT DOWNLOAD, INSTALL, COPY, DISTRIBUTE OR USE THE DATA FILES OR
+SOFTWARE.
+
+COPYRIGHT AND PERMISSION NOTICE
+
+Copyright © 1991-2016 Unicode, Inc. All rights reserved. Distributed under the
+Terms of Use in http://www.unicode.org/copyright.html.
+
+Permission is hereby granted, free of charge, to any person obtaining a copy
+of the Unicode data files and any associated documentation (the "Data Files")
+or Unicode software and any associated documentation (the "Software") to deal
+in the Data Files or Software without restriction, including without
+limitation the rights to use, copy, modify, merge, publish, distribute, and/or
+sell copies of the Data Files or Software, and to permit persons to whom the
+Data Files or Software are furnished to do so, provided that either
+
+  * (a) this copyright and permission notice appear with all copies of the Data Files or Software, or 
+  * (b) this copyright and permission notice appear in associated Documentation. 
+
+THE DATA FILES AND SOFTWARE ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
+KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT OF THIRD
+PARTY RIGHTS. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR HOLDERS INCLUDED IN
+THIS NOTICE BE LIABLE FOR ANY CLAIM, OR ANY SPECIAL INDIRECT OR CONSEQUENTIAL
+DAMAGES, OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR
+PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS
+ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THE
+DATA FILES OR SOFTWARE.
+
+Except as contained in this notice, the name of a copyright holder shall not
+be used in advertising or otherwise to promote the sale, use or other dealings
+in these Data Files or Software without prior written authorization of the
+copyright holder.
-- 
2.47.0


