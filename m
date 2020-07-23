Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4A022B2EA
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 17:49:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jydTh-0006Jp-CS; Thu, 23 Jul 2020 15:49:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9kJt=BC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jydTf-0006JL-3V
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 15:49:47 +0000
X-Inumbo-ID: 21bfac62-ccfc-11ea-a2c7-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 21bfac62-ccfc-11ea-a2c7-12813bfff9fa;
 Thu, 23 Jul 2020 15:49:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9BB3FAC83;
 Thu, 23 Jul 2020 15:49:53 +0000 (UTC)
Subject: [PATCH v3 4/8] x86/dmop: add compat struct checking for
 XEN_DMOP_map_mem_type_to_ioreq_server
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <adb0fe93-c251-b84a-a357-936029af0e9c@suse.com>
Message-ID: <a3ecc8d7-10b6-4678-e7c9-9900d4d008c8@suse.com>
Date: Thu, 23 Jul 2020 17:49:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <adb0fe93-c251-b84a-a357-936029af0e9c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This was forgotten when the subop was added.

Also take the opportunity and move the dm_op_relocate_memory entry in
xlat.lst to its designated place.

No change in the resulting generated code.

Fixes: ca2b511d3ff4 ("x86/ioreq server: add DMOP to map guest ram with p2m_ioreq_server to an ioreq server")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau MonnÃ© <roger.pau@citrix.com>

--- a/xen/arch/x86/hvm/dm.c
+++ b/xen/arch/x86/hvm/dm.c
@@ -730,6 +730,7 @@ CHECK_dm_op_modified_memory;
 CHECK_dm_op_set_mem_type;
 CHECK_dm_op_inject_event;
 CHECK_dm_op_inject_msi;
+CHECK_dm_op_map_mem_type_to_ioreq_server;
 CHECK_dm_op_remote_shutdown;
 CHECK_dm_op_relocate_memory;
 CHECK_dm_op_pin_memory_cacheattr;
--- a/xen/include/xlat.lst
+++ b/xen/include/xlat.lst
@@ -86,15 +86,16 @@
 ?	grant_entry_v2			grant_table.h
 ?	gnttab_swap_grant_ref		grant_table.h
 !	dm_op_buf			hvm/dm_op.h
-?	dm_op_relocate_memory		hvm/dm_op.h
 ?	dm_op_create_ioreq_server	hvm/dm_op.h
 ?	dm_op_destroy_ioreq_server	hvm/dm_op.h
 ?	dm_op_get_ioreq_server_info	hvm/dm_op.h
 ?	dm_op_inject_event		hvm/dm_op.h
 ?	dm_op_inject_msi		hvm/dm_op.h
 ?	dm_op_ioreq_server_range	hvm/dm_op.h
+?	dm_op_map_mem_type_to_ioreq_server hvm/dm_op.h
 ?	dm_op_modified_memory		hvm/dm_op.h
 ?	dm_op_pin_memory_cacheattr	hvm/dm_op.h
+?	dm_op_relocate_memory		hvm/dm_op.h
 ?	dm_op_remote_shutdown		hvm/dm_op.h
 ?	dm_op_set_ioreq_server_state	hvm/dm_op.h
 ?	dm_op_set_isa_irq_level		hvm/dm_op.h


