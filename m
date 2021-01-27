Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1245C305889
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 11:35:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75943.136946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4iA8-0004ut-5b; Wed, 27 Jan 2021 10:35:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75943.136946; Wed, 27 Jan 2021 10:35:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4iA8-0004uU-29; Wed, 27 Jan 2021 10:35:00 +0000
Received: by outflank-mailman (input) for mailman id 75943;
 Wed, 27 Jan 2021 10:34:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Shlr=G6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4iA6-0004uM-Ht
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 10:34:58 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6bdfdee2-3480-41a4-8539-b12f01b71552;
 Wed, 27 Jan 2021 10:34:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 54427AD57;
 Wed, 27 Jan 2021 10:34:54 +0000 (UTC)
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
X-Inumbo-ID: 6bdfdee2-3480-41a4-8539-b12f01b71552
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611743694; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gopfihQU6ZEqXxgj+QutdHMiXc1rcfFmL/6KcRas2cA=;
	b=B6JP3AvPgTg/QzDS6Lwy/RoAXENJNIMl01SZRYa5fQEr1CAI9p1Clrz/Smpe8tKNpbqWbf
	4Esfh5YHFzYvucF2buSMSVuUply6CAhKjsGpO4HuZsLkMIfg3CfpTyyhXein4PGBtCCsJg
	2Wj+djUYd4XyreIbOAEB7K7f0V69aHU=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] libxenguest: drop now unused le32_to_cpup() from lz4
 decompression
Message-ID: <72d7e54f-e0df-03e6-0752-9d8937f666f2@suse.com>
Date: Wed, 27 Jan 2021 11:34:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

While gcc doesn't warn about this because of it being static inline,
clang does, causing the build to fail there because of -Werror.

Fixes: d8099d94dfaa ("libxenguest: add get_unaligned_le32()")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/libs/guest/xg_dom_decompress_lz4.c
+++ b/tools/libs/guest/xg_dom_decompress_lz4.c
@@ -22,11 +22,6 @@ static inline uint_fast16_t le16_to_cpup
     return buf[0] | (buf[1] << 8);
 }
 
-static inline uint_fast32_t le32_to_cpup(const unsigned char *buf)
-{
-    return le16_to_cpup(buf) | ((uint32_t)le16_to_cpup(buf + 2) << 16);
-}
-
 #include "../../xen/include/xen/lz4.h"
 #include "../../xen/common/decompress.h"
 

