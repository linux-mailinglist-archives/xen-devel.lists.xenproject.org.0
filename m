Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 266699C8D74
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 15:59:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836527.1252450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBbIa-00082u-Lx; Thu, 14 Nov 2024 14:58:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836527.1252450; Thu, 14 Nov 2024 14:58:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBbIa-00080i-Hh; Thu, 14 Nov 2024 14:58:20 +0000
Received: by outflank-mailman (input) for mailman id 836527;
 Thu, 14 Nov 2024 14:58:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QegD=SJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tBbIZ-0007K7-PK
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 14:58:19 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0ecac41-a298-11ef-a0c7-8be0dac302b0;
 Thu, 14 Nov 2024 15:58:16 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-aa20944ce8cso158622466b.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 06:58:16 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e08617esm71581366b.182.2024.11.14.06.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 06:58:15 -0800 (PST)
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
X-Inumbo-ID: e0ecac41-a298-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzQiLCJoZWxvIjoibWFpbC1lajEteDYzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImUwZWNhYzQxLWEyOTgtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNTk2Mjk2LjU5ODI0Niwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731596296; x=1732201096; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tXR4cctauxXAgvzXe72aJg/wf4uD+JeIO0+1UeL6XbI=;
        b=uF09amAJXlqVYrgoAWLuUBYzKfcIc45iT0ezUuDADzGua0wyqEdMZkOKb/ABIUl8kc
         jAJmMVOTHB+fJk/urct8yo9tEcxNamIwXYBXTcHSECNeNB89KfbdhuNHnqnRrJGOdxci
         Mgvf0381fXjpVvVjvX6GMWCSNLK7cMciAcZAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731596296; x=1732201096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tXR4cctauxXAgvzXe72aJg/wf4uD+JeIO0+1UeL6XbI=;
        b=tBsijn9hFeZraqfDFQf9GpjZlyzR6Yiy21YqHsOpJ7eVsFmIiweeBvufXucr8dknth
         TrD4Svsg5n7YTJPHjRFtLB3/OH9d5jNH0NL+I5EipUs81whdEnJ0DGJ7N/nYZcjQxLLO
         oImT/wY7nz0vqp0UFBuDPRWnLMcT812/os/SxsuLN1OEfISE4Sbh4zN/yMvVFrpQbDdj
         N/sh3nQQOkorjXgQana4AB34Ekou0kZgS42Szw5FRU2zl1c7QctpvtsxK2v0jKiYPmjY
         iKyfbl+CT0HXJOnsM37I9J7E0lp3ybOTglpMGhYDmzrNAhQQhKkGPN6oSp24Af1fgR26
         PWKQ==
X-Gm-Message-State: AOJu0YyhhazsqtuHJLngsDLpwAMAJDeQGWFSRqwxo6sVvCEKbB3Fz0VE
	V9doXqQ5kU8nc6FQ3Rr87I7rvkkxBp5aHaBxw3BbRsDQ+iPF37cjk9t0bOtZfTK/p3iCtobW288
	0
X-Google-Smtp-Source: AGHT+IELVxnRGrnCdIZBOFpbty878I4Sr+GUKmoDscJGaVSHTdvBbe+YWejESTrHfW/xUoW/c+B2XA==
X-Received: by 2002:a17:907:1ca2:b0:a9a:cea7:1294 with SMTP id a640c23a62f3a-aa2077daa13mr300791866b.21.1731596295726;
        Thu, 14 Nov 2024 06:58:15 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@ctrix.com>
Subject: [PATCH v3 3/4] x86/setup: remove bootstrap_map_addr() usage of destroy_xen_mappings()
Date: Thu, 14 Nov 2024 15:57:14 +0100
Message-ID: <20241114145715.59777-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241114145715.59777-1-roger.pau@citrix.com>
References: <20241114145715.59777-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

bootstrap_map_addr() needs to be careful to not remove existing page-table
structures when tearing down mappings, as such pagetable structures might be
needed to fulfill subsequent mappings requests.  The comment ahead of the
function already notes that pagetable memory shouldn't be allocated.

Fix this by using map_pages_to_xen(), which does zap the page-table entries,
but does not free page-table structures even when empty.

Fixes: 4376c05c3113 ('x86-64: use 1GB pages in 1:1 mapping if available')
Signed-off-by: Roger Pau Monné <roger.pau@ctrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v1:
 - Adjust commit message.
---
 xen/arch/x86/setup.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 4feef9f2e05a..5da1c6a34519 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -462,7 +462,9 @@ static void *__init bootstrap_map_addr(paddr_t start, paddr_t end)
 
     if ( !end )
     {
-        destroy_xen_mappings(BOOTSTRAP_MAP_BASE, BOOTSTRAP_MAP_LIMIT);
+        map_pages_to_xen(BOOTSTRAP_MAP_BASE, INVALID_MFN,
+                         PFN_DOWN(map_cur - BOOTSTRAP_MAP_BASE),
+                         _PAGE_NONE);
         map_cur = BOOTSTRAP_MAP_BASE;
         return NULL;
     }
-- 
2.46.0


