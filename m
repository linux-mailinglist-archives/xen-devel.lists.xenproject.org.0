Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA0B364599
	for <lists+xen-devel@lfdr.de>; Mon, 19 Apr 2021 16:02:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.112936.215355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYUTT-0006G1-8y; Mon, 19 Apr 2021 14:02:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 112936.215355; Mon, 19 Apr 2021 14:02:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYUTT-0006FK-38; Mon, 19 Apr 2021 14:02:03 +0000
Received: by outflank-mailman (input) for mailman id 112936;
 Mon, 19 Apr 2021 14:02:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3l5R=JQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lYUTR-00061N-8E
 for xen-devel@lists.xenproject.org; Mon, 19 Apr 2021 14:02:01 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 665d3f7c-ab3f-4023-ab3e-e0dc9239117f;
 Mon, 19 Apr 2021 14:01:51 +0000 (UTC)
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
X-Inumbo-ID: 665d3f7c-ab3f-4023-ab3e-e0dc9239117f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618840911;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1jko2KVCpjzrndGXx0YAEFP0pnOv6quT6EsQagA40cw=;
  b=AHNLTHPdaI0BZhchszAI9lV3MSwZnS1EHxVEMnuKJ1dbjjVOjtDe13xN
   KVGH7CR/b06qQHkvbScwNhkRNNzCb/K3ck14hpyd0VUCctHMwPBuCCQvt
   BhBTpAdAlXyJtNBNlGeDM4TZpetbBL0X5YBtd+WHgw8reWjFJflqSTy/W
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 4dw8FPQQdflBDRcafRhL0AdCLPex3/yZ9EWa56O9Ip9Lx67CF9Puw1pAF6geEP8bZYpRBLFagD
 EsRqPZHTaZGt0poXjK79QmTWY611BSqyBKPxwQVNz00N4ZC8TbwXPtKvXLJdQYaOAJdq1c3w2N
 BdUSskXTOvp9ormIvJY2RFppqJZko8MdrmOghVKlRYu90jU/QufkCWG05Tig5pCsCeymO9MLfR
 Ga34BGL+ZeB+xtr2nmbtAsVPFsn/6VEVal/O1nTKxjq1Ake/zQQSUpDPPEKY743ab6EOGIvHpf
 +VI=
X-SBRS: 5.1
X-MesageID: 41892066
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:t6oF1qgSpEjUF7F8VFLowa1vMHBQXwh13DAbvn1ZSRFFG/Gwv9
 yynfgdyB//gCsQXnZlotybJKycWxrnmKJdy4N5B9efdSPhv3alK5wn0Jv6z1TbaknD38N+9Y
 MlSahxD9XsEUN35PyR3CCUG8stqePpzImGnuHbpk0CcShPS4VNqzh0ERyaFEoefngiObMcGI
 CH7sRK4xqMEE5nDfiTPXUOU+jdq9CjrvuPDSIuPBI79BKIyQqh9b+SKXOl9y0DWDBCy6pKyx
 mmryXF4MyY0s2T+1vn+EL4q79Xn9bgzdUrPr3wtuElbg/CpyztSIBoW7iptC04rue1+D8R4a
 XxiiZlBetfwTf8eXy0vAvM1mDboUkTwk6n83C0qz/CptH0Xz0zAcYpv/MmTjLpr3AOkfs59Y
 Aj5RP/i7NnSSnusQ642v3zEzZtrUawqWpKq59ps1VvFbEwRZUUkZYS5ypuYfE9NRO/0q8LOs
 90AvrR4f5HGGnqFUzxjy1UzNugUm9bJGb+fmEy/sic0z1hlHtk1UcvxMsGgnca9J4mIqM0n9
 j5Dg==
X-IronPort-AV: E=Sophos;i="5.82,234,1613451600"; 
   d="scan'208";a="41892066"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, "Jan
 Beulich" <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 6/7] x86/shadow: Make _shadow_prealloc() compile at -Og
Date: Mon, 19 Apr 2021 15:01:31 +0100
Message-ID: <20210419140132.16909-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210419140132.16909-1-andrew.cooper3@citrix.com>
References: <20210419140132.16909-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

When compiling at -Og:

  In file included from
  /builds/xen-project/people/andyhhp/xen/xen/include/asm/domain.h:4:0,
                   from /builds/xen-project/people/andyhhp/xen/xen/include/xen/domain.h:8,
                   from /builds/xen-project/people/andyhhp/xen/xen/include/xen/sched.h:11,
                   from /builds/xen-project/people/andyhhp/xen/xen/include/xen/ioreq.h:22,
                   from common.c:23:
  common.c: In function '_shadow_prealloc':
  /builds/xen-project/people/andyhhp/xen/xen/include/xen/mm.h:252:55: error: 't' may be used uninitialized in this function [-Werror=maybe-uninitialized]
       return page != head->next ? pdx_to_page(page->list.prev) : NULL;
                                                         ^
  common.c:933:28: note: 't' was declared here
       struct page_info *sp, *t;
                              ^

I'm not certain the analysis is correct.  't' is a temporary variable, and is
clearly initialised before use in foreach_pinned_shadow().  Either way,
initialising it to NULL placates the compiler.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Tim Deegan <tim@xen.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/mm/shadow/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm/shadow/common.c b/xen/arch/x86/mm/shadow/common.c
index b99ca14e71..737e6b365a 100644
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -931,7 +931,7 @@ static inline void trace_shadow_prealloc_unpin(struct domain *d, mfn_t smfn)
 static void _shadow_prealloc(struct domain *d, unsigned int pages)
 {
     struct vcpu *v;
-    struct page_info *sp, *t;
+    struct page_info *sp, *t = NULL;
     mfn_t smfn;
     int i;
 
-- 
2.11.0


