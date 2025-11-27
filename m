Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7791CC8E82A
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 14:39:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173859.1498864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOcDq-0007mi-Lf; Thu, 27 Nov 2025 13:39:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173859.1498864; Thu, 27 Nov 2025 13:39:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOcDq-0007jw-IV; Thu, 27 Nov 2025 13:39:46 +0000
Received: by outflank-mailman (input) for mailman id 1173859;
 Thu, 27 Nov 2025 13:39:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M2bp=6D=bounce.vates.tech=bounce-md_30504962.6928549c.v1-cacd861e097f4c97bf6a85a68f58cfd7@srs-se1.protection.inumbo.net>)
 id 1vOcDo-0007Up-Rn
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 13:39:44 +0000
Received: from mail132-18.atl131.mandrillapp.com
 (mail132-18.atl131.mandrillapp.com [198.2.132.18])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87cb122a-cb96-11f0-9d18-b5c5bf9af7f9;
 Thu, 27 Nov 2025 14:39:44 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-18.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4dHHbc6hNSzCf9Xss
 for <xen-devel@lists.xenproject.org>; Thu, 27 Nov 2025 13:39:40 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 cacd861e097f4c97bf6a85a68f58cfd7; Thu, 27 Nov 2025 13:39:40 +0000
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
X-Inumbo-ID: 87cb122a-cb96-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1764250780; x=1764520780;
	bh=NFHk6HqtAfIPdwrhM3fd+af+o9jmpJwjBhaopH82WXE=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=W+jCDs/2ux8HeUNhEERYJPgcYvWNPMBGLE0wvLOsMrkUV2/1G2OWVNPnyDN1gs3M/
	 C/UVICpOb/Dg1q4gjOieybpLp7qGdNCZDJBDCtbaFR/NLCOIrbH+5HDEjeI9tZ6z0n
	 JPdNuiTRVLS8KxAe4GLBmRmPu6JZj9hWbIFXJWEWwwTHIp9TH0saQLgOgrBskMT5rJ
	 8tTXCDMwV4so3u/1b8WGHMtEp85yi1ROsrb9Ey0loEBBe8K8Dm/XGrKckinLOVozmm
	 ARq5+VWJ7w+fIjqGYuZ5PZWd/MBRUXHfbBmQ9UzSCVnsyssQt58mkfoMbb1Il5Usz8
	 O88CCL8GBgzkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1764250780; x=1764511280; i=teddy.astie@vates.tech;
	bh=NFHk6HqtAfIPdwrhM3fd+af+o9jmpJwjBhaopH82WXE=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=fMEyq/5ghm7gNVxfoA6vLNd7aOjnrsDgdkfg/PBeqfT9XzUqFENBkNPwH88zMfedi
	 rQH2O5wmhc9VISVqzGzryVWYafxsI3QA8i5lR4dX47bxRoG9uMmZnB3IYFk+qMemNx
	 7yUvhX1qQl+riz7Rw+zXZYwc/DOOKaZL1zzPKPslLnx21u6xOqTqdJstRBr89iRkTo
	 hAmxR7E8mtfNS7GkPCkD5gckxqvwbc4NEwLqmrsYFn7ePa7sDWrPuFd48ptksjgZ+K
	 +w4OLEiByOEKozdChrFg8QtYn79q31nsRjfXQm+WF4+B2j25sS1b5YuPZsw5ysU2rY
	 50S4d+hdUq0hQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=203/4]=20x86/p2m-pt:=20Set=20p2m->need=5Fflush=20if=20page=20was=20present=20before?=
X-Mailer: git-send-email 2.51.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1764250779949
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <8f5a0cecba14cd38d739a9f29a5c8344c2f6bd11.1764248710.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1764248710.git.teddy.astie@vates.tech>
References: <cover.1764248710.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.cacd861e097f4c97bf6a85a68f58cfd7?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251127:md
Date: Thu, 27 Nov 2025 13:39:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Update p2m->need_flush if page was present before (requiring a tlb flush).
This causes p2m->flush_tlb() to be now be reachable, make sure we call it
only when set.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
This change is important for the next patch.
Would it be better to merge it with the next patch ?

 xen/arch/x86/mm/p2m-pt.c | 3 +++
 xen/arch/x86/mm/p2m.c    | 6 ++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/mm/p2m-pt.c b/xen/arch/x86/mm/p2m-pt.c
index 5a6ce2f8bc..1fea3884be 100644
--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -143,6 +143,9 @@ static int write_p2m_entry(struct p2m_domain *p2m, unsigned long gfn,
         if ( p2m->write_p2m_entry_post )
             p2m->write_p2m_entry_post(p2m, oflags);
 
+        if ( oflags & _PAGE_PRESENT )
+            p2m->need_flush = true;
+
         paging_unlock(d);
 
         if ( nestedhvm_enabled(d) && !p2m_is_nestedp2m(p2m) &&
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index e2a00a0efd..98f8272270 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -274,7 +274,8 @@ void p2m_tlb_flush_sync(struct p2m_domain *p2m)
     if ( p2m->need_flush )
     {
         p2m->need_flush = 0;
-        p2m->tlb_flush(p2m);
+        if ( p2m->tlb_flush )
+            p2m->tlb_flush(p2m);
     }
 }
 
@@ -287,7 +288,8 @@ void p2m_unlock_and_tlb_flush(struct p2m_domain *p2m)
     {
         p2m->need_flush = 0;
         mm_write_unlock(&p2m->lock);
-        p2m->tlb_flush(p2m);
+        if ( p2m->tlb_flush )
+            p2m->tlb_flush(p2m);
     } else
         mm_write_unlock(&p2m->lock);
 }
-- 
2.51.2



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


