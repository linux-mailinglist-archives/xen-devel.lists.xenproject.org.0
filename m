Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0CDAEA1AA
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 17:00:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026605.1401785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUo59-0007OK-Ci; Thu, 26 Jun 2025 15:00:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026605.1401785; Thu, 26 Jun 2025 15:00:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUo59-0007MX-8M; Thu, 26 Jun 2025 15:00:07 +0000
Received: by outflank-mailman (input) for mailman id 1026605;
 Thu, 26 Jun 2025 15:00:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZhAb=ZJ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uUo57-0006Oi-5Z
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 15:00:05 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d427150-529e-11f0-b894-0df219b8e170;
 Thu, 26 Jun 2025 17:00:03 +0200 (CEST)
Received: from nico.tail79467d.ts.net
 (host-79-60-221-62.business.telecomitalia.it [79.60.221.62])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPSA id 1CD444EE98AA;
 Thu, 26 Jun 2025 17:00:00 +0200 (CEST)
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
X-Inumbo-ID: 3d427150-529e-11f0-b894-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=79.60.221.62
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1750950002;
	b=BVYuxEkDZl0omnkjEkxS/7On9/J1Wc8vxEQvpn92jrueueGRIxGhwv5bRxtFmbCm/wI2
	 c2ZMLCyQq8LM6QCixQh0WI/2cWCGTlIG4N/QEjJQEk4N6HJeLaJcDDLTT7zlTeRR/Eg12
	 y9HAJVypsqYQErwjmANhNSXB8lrQzzjxxP0GkM2i9LktREo2gtGp9WgjSdbR73ns/2EEm
	 xhKYTWao/v+QSTMq3LDY4sERV1agFe1/z9ZPIEXFfdhbgn1HYPcQb16Y3Jyae/q67BMQo
	 MMsOObfV/lBxMMde3UFe/HMho7HULUBYn4Q0z1N5sLun6bTPWd//e8rRUJDIKmAXHE3Mz
	 jdrNmpz0WvWiEupkeRjrmPm8tjDdOqQIihUufYyI9vZ9dmINfKvJ+l0ON56Z2x/qouHe+
	 T1LrV+r3LCo30hYXBa+Rq5TGcCnkbY6PUXIKm+7e6OdMkJuk5iiRhEmRcTYAaj2Pao5ap
	 x4KE3+HuCaAsYqLxfNvgM1T37X8aMn+p/iFZ1LoOACkJTOv6a54wp5Aum04z8twjsFIp0
	 5NbcjtB9XSZGOLNlGFtQEfF6AOdQahryWPXuQrCmIkmL8wFKADguEd4dMIXQHrplVx3+Y
	 +RvD9NQ5ecPJTb/I+zz2cNPDsDTGILwwgfL/DudObyBUNQq1JRPM8js3JKb85AI=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1750950002;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DhbZyzEvXZJwU+5fKTxJbtSSLieax0xoM5Exn3sYlOM=;
	b=wEevkCu8Cn2wyEQHbuHr6w4nj3qARxQCasBl7RSMj+xKlsWgQK4lWkUV4N9WtlUel/vF
	 eni2cpJmFQ0rEWXGiXrZCJf9sGDG3vO9em07JpmBH1wC/gx0FmpD9WMuM9LBDq/SFUEs4
	 upLy0hkj0PzqrbKGSfuHfogTKPLXQYsDhH1AWULupvrHaSlD2hCd70ByOqHGZlPtHiwNU
	 s7uWQLq/z/yOIpTiT0St/EftGu4dcezIXbakVkB5CkRN3uMcAOyytiZnbj+M36Yox0t+Q
	 G1PypYZk3jwAtWea+Yj3s08SkYFkRRfCV6uYzNM1yyH6PApDOMpzDm8vcTSY2Ra2aVuNj
	 cedRwRCY/CQouecL1t+z2d6GQLiVuva9p4r2Zif8szXKF/c6o4upf4EtZGyoKIfqEo6Vl
	 RFxcd9SPBYURnvh9kVEmSbzH5S4AFAbwS+1eHDDF6VMdaR1tjO3c1vo1XQX/IlTXw/YMR
	 vkq6vHEOlXaIsu043HlZ3P+JviSd6TvKcg1DKOVlU+fWT81e6E6gFkSrUlmP+4lkM3bql
	 knef++jw01GqihYaj+1uYkC/xvWB96cSpFtITuHO6nj2ighEfcWCHHHoW3IXZVjdcfg6O
	 Og5jp9hhXWw+3VBImXbvFoyoHhdeAhiXCAZGmW+BEtEEuTPgQlUiDCYtur0x6yo=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=79.60.221.62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1750950002; bh=GrRCNb7zRHi1VBh2VzYJ7xawetPSi5T3rUK2AAE7Lu4=;
	h=From:To:Cc:Subject:Date:From;
	b=d2JfNBhe6I1Bjo7RGjym2MErfX8ImLEj129SRScLyBUomKu8JvroaCwKRCYLp9mUI
	 BA6/+FwxHFlycV941Ed8LGDI8PAfBbbxVXfK9Iha1yguCjP5xP1aLHjaBnrWR1pf4i
	 qIfC5tk9YHS6dtk2jlyy/qcizm3iYpEZC00Y6f6Bc0BOK7KNy7HqYLqgruOtpUIOc0
	 HnsUfTYl5MN8d//rJMVO0pMyZlSZ+HfN7jaXwnpZYFI7BGyCOUobEkoU+3lqSg1OIw
	 zd7lxhNGu+gTRMv8W7k2k7TQTTm4Zl8rKhXQ47Hb84A1q/6yX8/Cx8elw+QshneoZF
	 9y8YUBQ2R/pXQ==
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH] xen: fix unspecified behavior in tr invocation
Date: Thu, 26 Jun 2025 16:59:57 +0200
Message-ID: <df5119a0e5f617ed1a2756dfca77368596e2c369.1750949938.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The result of the command is undefined according to the specification if
the "string2" argument in tr is shorter than "string1". GNU tr behaves
correctly by extending "string2" to repeat the last character.

Fixes: eb61a4fb14d2 ("xen: fix header guard generation for asm-generic headers")
Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/scripts/Makefile.asm-generic | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/scripts/Makefile.asm-generic b/xen/scripts/Makefile.asm-generic
index f6850758c54b..4e628e116adf 100644
--- a/xen/scripts/Makefile.asm-generic
+++ b/xen/scripts/Makefile.asm-generic
@@ -34,7 +34,7 @@ unwanted    := $(filter-out $(generic-y) $(generated-y),$(old-headers))
 quiet_cmd_wrap = WRAP    $@
       cmd_wrap = \
 	arch=$$(echo $@ | sed -n 's:.*arch/\([^/]*\)/.*:\1:p' | tr a-z A-Z); \
-	upper=$$(echo $*.h | tr a-z A-Z | tr '/.-' '__'); \
+	upper=$$(echo $*.h | tr a-z A-Z | tr '/.-' '___'); \
 	echo "\#ifndef $${arch}_GENERIC_$${upper}" > $@.new; \
 	echo "\#define $${arch}_GENERIC_$${upper}" >> $@.new; \
 	echo "\#include <asm-generic/$*.h>" >> $@.new; \
-- 
2.43.0


