Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1CB3892F3
	for <lists+xen-devel@lfdr.de>; Wed, 19 May 2021 17:48:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130211.244046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljOR2-0001Hz-2x; Wed, 19 May 2021 15:48:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130211.244046; Wed, 19 May 2021 15:48:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljOR1-0001Ea-W2; Wed, 19 May 2021 15:48:35 +0000
Received: by outflank-mailman (input) for mailman id 130211;
 Wed, 19 May 2021 15:48:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fOiY=KO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ljOR0-0001EE-GF
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 15:48:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 04dff2c3-9e11-4aea-9a04-23a82a85d2bb;
 Wed, 19 May 2021 15:48:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 817D6AEF8;
 Wed, 19 May 2021 15:48:32 +0000 (UTC)
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
X-Inumbo-ID: 04dff2c3-9e11-4aea-9a04-23a82a85d2bb
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621439312; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9Wp1XDNH3tqp0mzl2nSP1h1Pe8UcGfBsHR7PAJ3dlQw=;
	b=bTvX/CXb1Ey/bPwWbAexDHxyJ4RYbqcOurLagfxT4FovkK1kArJWsscooIpgj0tPhxQDbm
	GjVEdW5Fal2SDMInBLiqBLCyO15U9ovU5Hmc0LleNlR3EMNYH4+sryW23/pHF/uB/lDvke
	aEgx9k5UiJwgSj08aHwoQe1QY93xJqM=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/tboot: include all valid frame table entries in S3
 integrity check
Message-ID: <e878fd86-2d82-ce3c-1dc4-d3a07025f1d4@suse.com>
Date: Wed, 19 May 2021 17:48:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The difference of two pdx_to_page() return values is a number of pages,
not the number of bytes covered by the corresponding frame table entries.

Fixes: 3cb68d2b59ab ("tboot: fix S3 issue for Intel Trusted Execution Technology.")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/tboot.c
+++ b/xen/arch/x86/tboot.c
@@ -323,12 +323,12 @@ static void tboot_gen_frametable_integri
         if ( nidx >= max_idx )
             break;
         vmac_update((uint8_t *)pdx_to_page(sidx * PDX_GROUP_COUNT),
-                       pdx_to_page(eidx * PDX_GROUP_COUNT)
-                       - pdx_to_page(sidx * PDX_GROUP_COUNT), &ctx);
+                    (eidx - sidx) * PDX_GROUP_COUNT * sizeof(*frame_table),
+                    &ctx);
     }
     vmac_update((uint8_t *)pdx_to_page(sidx * PDX_GROUP_COUNT),
-                   pdx_to_page(max_pdx - 1) + 1
-                   - pdx_to_page(sidx * PDX_GROUP_COUNT), &ctx);
+                (max_pdx - sidx * PDX_GROUP_COUNT) * sizeof(*frame_table),
+                &ctx);
 
     *mac = vmac(NULL, 0, nonce, NULL, &ctx);
 

