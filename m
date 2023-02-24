Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5E16A1D0B
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 14:37:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501052.772639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVYFt-0004dH-Am; Fri, 24 Feb 2023 13:36:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501052.772639; Fri, 24 Feb 2023 13:36:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVYFt-0004ao-7T; Fri, 24 Feb 2023 13:36:57 +0000
Received: by outflank-mailman (input) for mailman id 501052;
 Fri, 24 Feb 2023 13:36:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iPiP=6U=citrix.com=prvs=412d30f06=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1pVYFr-0004LB-SG
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 13:36:55 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d67cd02-b448-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 14:36:55 +0100 (CET)
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
X-Inumbo-ID: 4d67cd02-b448-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677245815;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+p41LuGA6ZH/mH4WZJzQfHg34IdLZsNOgxsII11jPNw=;
  b=NS5Y681LWvY5qmQWxLoSdmHfbIxB8XJdQWa5oIfrks3Y0b1qCno0//VI
   lAkcVy5FvS6wlcMp8em5f8naDm8WEC7KJ2cLskr7W+tgGHorY8+SeNOeS
   i0TvlOe1w5mPdYtYgcEc5MUqiADhy988JH6xYDYfu+YY+rrXjcsjlgzAd
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 98414697
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:VkUb7aNvXiD9M5TvrR2tl8FynXyQoLVcMsEvi/4bfWQNrUon1DZRz
 mMaCG+DM6yJYGLyKowkPIu+8EtS6p6GyIRjSQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv3rRC9H5qyo42tC5ABmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0slYLEpQz
 6E1EWFXUjCutsCkzq6KF9A506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLozkPmpgD/jdCdfq3qepLYt4niVxwt0uFToGIuFJoXWG5QK9qqej
 jP+zkjwKwpLDfy092aPrSiombbzugquDer+E5Xnr6U30TV/3Fc7ChIMUkCgieKkkUP4UNVaQ
 2QL/gI+oK5081akJvHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpVTA9nJZoH3pwj
 AbPxo63Q2U169V5VE5x6J+7gh6ZJxJIAFZTPxMkYDon8df/kdwK20enoslYLIa5idj8GDfVy
 j+MrTQji7h7sfPnx5lX7nic3Wvy+8Ghohodo1yOAzn7tl8RiJuNPdTA1LTN0RpXwG91pHGlt
 WNMpcWR5ftm4XqlxH3UG7Vl8F1ECp+43NzgbbxHRcRJG9eFoSTLkWVsDNZWdS9U3j4sI2OBX
 aMqkVo5CGVvFHWrd7RrRIm6Ft4ny6Ptffy8CK+LN4UROMcsJV/WlM2LWaJ39zqw+HXAbIllY
 cvLGSpSJSty5VtbIMqeGL5GjO5DKtEWzmLPX5HrpylLIpLHDEN5vYwtaQPUBshgtfPsnekg2
 4oHXyd840kFAbKWj+i+2dJ7EG3m2lBiX8iu9JYIK7/TSuekcUl4Y8LsLXoaU9QNt8xoei3gp
 RlRhmcwJILDuED6
IronPort-HdrOrdr: A9a23:Ib6Edq9yrJCVMQYRarJuk+DiI+orL9Y04lQ7vn2YSXRuE/Bw8P
 re5MjztCWE8Qr5N0tQ+uxoVJPufZqYz+8Q3WBzB8bFYOCFghrLEGgK1+KLqFeMdxEWtNQtsp
 uIG5IOc+EYZmIbsS+V2meF+q4bsby6zJw=
X-IronPort-AV: E=Sophos;i="5.97,324,1669093200"; 
   d="scan'208";a="98414697"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>
Subject: [PATCH v1 2/2] backup_ptes: fix leak on realloc failure
Date: Fri, 24 Feb 2023 13:36:46 +0000
Message-ID: <2f23492a3861a3ebddbf1f811296e98143b9b8f4.1677245356.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677245356.git.edwin.torok@cloud.com>
References: <cover.1677245356.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Edwin Török <edwin.torok@cloud.com>

From `man 2 realloc`:
`If realloc() fails, the original block is left untouched; it is not freed or moved.`

Found using GCC -fanalyzer:
```
|  184 |         backup->entries = realloc(backup->entries,
|      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|      |         |               | |
|      |         |               | (91) when ‘realloc’ fails
|      |         |               (92) ‘old_ptes.entries’ leaks here; was allocated at (44)
|      |         (90) ...to here
```

Signed-off-by: Edwin Török <edwin.torok@cloud.com>
---
 tools/libs/guest/xg_offline_page.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/libs/guest/xg_offline_page.c b/tools/libs/guest/xg_offline_page.c
index c594fdba41..a8bcea768b 100644
--- a/tools/libs/guest/xg_offline_page.c
+++ b/tools/libs/guest/xg_offline_page.c
@@ -181,10 +181,13 @@ static int backup_ptes(xen_pfn_t table_mfn, int offset,
 
     if (backup->max == backup->cur)
     {
-        backup->entries = realloc(backup->entries,
+        void* orig = backup->entries;
+        backup->entries = realloc(orig,
                             backup->max * 2 * sizeof(struct pte_backup_entry));
-        if (backup->entries == NULL)
+        if (backup->entries == NULL) {
+            free(orig);
             return -1;
+        }
         else
             backup->max *= 2;
     }
-- 
2.39.1


