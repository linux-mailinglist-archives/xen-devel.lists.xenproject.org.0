Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA505A756B
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 07:06:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395166.634958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTFv6-0007p3-1o; Wed, 31 Aug 2022 05:05:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395166.634958; Wed, 31 Aug 2022 05:05:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTFv5-0007ho-Oc; Wed, 31 Aug 2022 05:05:43 +0000
Received: by outflank-mailman (input) for mailman id 395166;
 Tue, 30 Aug 2022 21:49:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0IG=ZC=flex--surenb.bounces.google.com=36YUOYwYKCU48A7u3rw44w1u.s42Du3-tuBu11y898.Du3574zus9.47w@srs-se1.protection.inumbo.net>)
 id 1oT96x-0008Cd-9f
 for xen-devel@lists.xenproject.org; Tue, 30 Aug 2022 21:49:31 +0000
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [2607:f8b0:4864:20::b49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0275f40-28ad-11ed-bd2e-47488cf2e6aa;
 Tue, 30 Aug 2022 23:49:30 +0200 (CEST)
Received: by mail-yb1-xb49.google.com with SMTP id
 v5-20020a2583c5000000b006964324be8cso713972ybm.14
 for <xen-devel@lists.xenproject.org>; Tue, 30 Aug 2022 14:49:30 -0700 (PDT)
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
X-Inumbo-ID: a0275f40-28ad-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc;
        bh=nkzMCqKgjBTn+NwznXGF4FkMKBv5sNXeON2LIxVXB6M=;
        b=kJlmMVVbY7IXNl91XGcBvO3YBT3quRQF4WCS0SiH4LOLG/e+9p2jaPHVw9E6t43+lu
         d4/47XlZrYUEtJ7XQ4VgzKUrbfj5xy9BOKDP//VyLPwp6hXR8zYzPt3dQTar5Wyr4GYS
         iZIbWUJ75o4n7+UgTsXC+An80tm2UyPOQgFq5wJiP9bNIbl98o3r9SGFN0OGKpWzVCwL
         D90b1H3jXLeXTLKjKOyg3XK2WfiVlhvPG/TS9Z+MZLclTKFSEr9IlFYU0A0pKe+sQn6L
         rk2/ZWVdc/gD2rOE75MuQ1Xdte4UkYIWIQjcJTwqiH4rcTqyxgiTvaJazxYK/g79dGii
         T0zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc;
        bh=nkzMCqKgjBTn+NwznXGF4FkMKBv5sNXeON2LIxVXB6M=;
        b=5r8v6Rh1odhB+sCnciBhWoA/u3jzoipztFjgKS3TmHyYJd892Rnh5iF7StBxHTjnmA
         yoENcXEiuGeh/p5rA2GVetOQC/71kRQxLpKN3xExzEieImoPsRlegX8XswFRwYvLuARg
         69i59XQ43ZjZRUkbjMn5WyTONxLhFJHGG4uaCIlysZoMNHd6CmywdulZih96fzhVeo3b
         TQTxOIdr3KOGNnPp6CeyQnY+rZo1onc+udWkzUupKCwjXMfNSdAN+unR5tMKzm/karUL
         0sJ0pY0da1h6kWkotvZVd1usWHlOK4p7pNez1v4bMhLGGIAQ5uNEVf5jbYz7Nd5wgkja
         qTwQ==
X-Gm-Message-State: ACgBeo2vuSQnvCrwX0u1L2tCk3LuyG/VZitzlL/YQlX9jEC+POPL60ed
	49aYOFPJBEgkCZW+KoXopWzuh0HmcJs=
X-Google-Smtp-Source: AA6agR58VLI71n7hWTuP/n58j09zS0GpQ603/kDNR321OvTW6NJyNZKRSs+4OQb0POQ9FkLHMKokHnLGLkM=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:a005:55b3:6c26:b3e4])
 (user=surenb job=sendgmr) by 2002:a25:e90e:0:b0:695:64cf:5d2 with SMTP id
 n14-20020a25e90e000000b0069564cf05d2mr12975575ybd.541.1661896169455; Tue, 30
 Aug 2022 14:49:29 -0700 (PDT)
Date: Tue, 30 Aug 2022 14:48:51 -0700
In-Reply-To: <20220830214919.53220-1-surenb@google.com>
Mime-Version: 1.0
References: <20220830214919.53220-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220830214919.53220-3-surenb@google.com>
Subject: [RFC PATCH 02/30] lib/string_helpers: Drop space in string_get_size's output
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: kent.overstreet@linux.dev, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	void@manifault.com, peterz@infradead.org, juri.lelli@redhat.com, 
	ldufour@linux.ibm.com, peterx@redhat.com, david@redhat.com, axboe@kernel.dk, 
	mcgrof@kernel.org, masahiroy@kernel.org, nathan@kernel.org, 
	changbin.du@intel.com, ytcoode@gmail.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	bristot@redhat.com, vschneid@redhat.com, cl@linux.com, penberg@kernel.org, 
	iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, glider@google.com, 
	elver@google.com, dvyukov@google.com, shakeelb@google.com, 
	songmuchun@bytedance.com, arnd@arndb.de, jbaron@akamai.com, 
	rientjes@google.com, minchan@google.com, kaleshsingh@google.com, 
	surenb@google.com, kernel-team@android.com, linux-mm@kvack.org, 
	iommu@lists.linux.dev, kasan-dev@googlegroups.com, io-uring@vger.kernel.org, 
	linux-arch@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-bcache@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andy@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Paul Mackerras <paulus@samba.org>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	"=?UTF-8?q?Noralf=20Tr=C3=B8nnes?=" <noralf@tronnes.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: Kent Overstreet <kent.overstreet@linux.dev>

Previously, string_get_size() outputted a space between the number and
the units, i.e.
  9.88 MiB

This changes it to
  9.88MiB

which allows it to be parsed correctly by the 'sort -h' command.

Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: "Noralf Tr=C3=B8nnes" <noralf@tronnes.org>
Cc: Jens Axboe <axboe@kernel.dk>
---
 lib/string_helpers.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/lib/string_helpers.c b/lib/string_helpers.c
index 5ed3beb066e6..3032d1b04ca3 100644
--- a/lib/string_helpers.c
+++ b/lib/string_helpers.c
@@ -126,8 +126,7 @@ void string_get_size(u64 size, u64 blk_size, const enum=
 string_size_units units,
 	else
 		unit =3D units_str[units][i];
=20
-	snprintf(buf, len, "%u%s %s", (u32)size,
-		 tmp, unit);
+	snprintf(buf, len, "%u%s%s", (u32)size, tmp, unit);
 }
 EXPORT_SYMBOL(string_get_size);
=20
--=20
2.37.2.672.g94769d06f0-goog


