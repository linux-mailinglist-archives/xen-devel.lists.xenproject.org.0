Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 705A3428871
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 10:17:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205456.360757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZqUq-0001sT-Ai; Mon, 11 Oct 2021 08:17:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205456.360757; Mon, 11 Oct 2021 08:17:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZqUq-0001p9-6z; Mon, 11 Oct 2021 08:17:20 +0000
Received: by outflank-mailman (input) for mailman id 205456;
 Mon, 11 Oct 2021 08:17:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mZqUp-0001p3-BG
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 08:17:19 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 671325fb-1786-4ed3-966e-f7f52a0c2140;
 Mon, 11 Oct 2021 08:17:18 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2052.outbound.protection.outlook.com [104.47.8.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-hC1tHEK1MMKu2X_HYlsy0A-1; Mon, 11 Oct 2021 10:17:16 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3294.eurprd04.prod.outlook.com (2603:10a6:802:3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Mon, 11 Oct
 2021 08:17:07 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 08:17:07 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR10CA0043.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.25 via Frontend Transport; Mon, 11 Oct 2021 08:17:07 +0000
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
X-Inumbo-ID: 671325fb-1786-4ed3-966e-f7f52a0c2140
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633940237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bbzjxS4qY50/XnkwKGtENFSe+EZtCGIvL27KlVUOC14=;
	b=bXyRNL/G48JEMnnZCnJlKVcR0AG1K5TP4aAEKTWfaJHu9DpbGKhJezoNglxh359maPGJ8d
	2mRSktLbR/+C84Ch/qTIPpoIg3L8Mk/J/sWp6VBfWPkO1a/Nw7/XqL7MLZ7xfPaPKQYhtO
	xxhVyo4toPwTZIgU0tHYggj33vbhNHs=
X-MC-Unique: hC1tHEK1MMKu2X_HYlsy0A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hb2UiGnWRMRdHZFdlZb4ofb+A+PJPHzeYBtU3r5DdqjVbgQRNE98gtboG7Hp3az486UVg+W0Wco7ierQCBrHdH8i4nroBcApWni4oNcIUcHQxaxP41Mi/HG3zX49oeI8dXnnquvC3HuBQ9K5bpvwZgCBKRN4nVCsDJkGvAlFgQbzb09pobl/woojd2+LyokNCPncL2MY/dx6oEJa/78NgZ/WiY41ZE7ODpg8iMseR+jk4faiofYJFC6AxI+aXWEq4/zXhZ9fRfnvcDbxbeJbxqhEF08NNHOyaO9NnhWKjyGVsfpHBraKDKliIVBbxOyrKByxzZigru4UqBturUB8TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bbzjxS4qY50/XnkwKGtENFSe+EZtCGIvL27KlVUOC14=;
 b=kya5usjX21BqFNYotaISEVvUF0isU77K+Off3pT3dc+jTfSuZBGHDx3P0HSGFdeq8ZDo0iHYK6zcqXhIb9HV5lZJYO5rwQTxtH7/xjt6Ul/NxlaURS94BuAGguKGYTXQT6MZjwrr7unUAknhGyN5MuFPnk1ZP1rtHWCny/5B4V84ZyXfoK+coySLRDZWbkO+IwCD2XGXGtcAZIfsfmIZx6hDj9mSOzpdXJA9v0c2iKbdY9ULJKGIrgR0F7L6ayRfg+fkGjI+Mt2YiV7eHrYc/bszSk/aOtJDaWVpQxKHMajfcr6bq79NtrczZmTLKRmz+niugItv+rM8vwjAVlh+jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/PoD: defer nested P2M flushes
Message-ID: <e47d51c6-1b4b-2f72-6e12-070df66c30e2@suse.com>
Date: Mon, 11 Oct 2021 10:17:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0043.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: feb38551-ab79-4cca-170b-08d98c8f844e
X-MS-TrafficTypeDiagnostic: VI1PR04MB3294:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB32943512D6E9B7B3FF5FD2EAB3B59@VI1PR04MB3294.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x/HLLbZh1Q5L9qG00GcL5AqmOaJ775KjecVxJjC8gGa7p/8LGGsGw9nnZ5p7npVxccsZmca/nEBqBTSjcFrlJY/2z7Yhem4wa9QXYQhluzl/qGzBPg5Jmx/NZ0sNohqFS3V5hazaZ9Swll01CHTea/xA0uK3Kk5XwmfF6fKTdauVSUwTfM1bhhco0Y/SFWF1fGjJ3NEzt8mohlYVpxEHUKUQEWikXo3nrr9qh05gb5UVY4rjfw9kkOR6GVQ0yvPJmSDlFAX7Tu9KFywTqwGPnz5O1ZJOYDFBsa0xfBopBj2ei6T81ycPIGoehLfywFOmuZ0kCRqfDiJ8LOLKcdT/Hygk0ZePxQYruU9Phure2z29YMSjwIQD9B/zaEt4atsa6aOLy0uvEz+lKcZpHJGUndttnLPdGqY6R4KrVHIuiEQ0bL/M5+qucy4uIm3W2yQNumaTyGIIrmIE3/acm2jz4GJgJjWVqe9CkuVE8OQ2BzHJfmX6n9vYLgL6XS6E4xHQVZJ9bF0WknGrWrWUR1pFt3Wp8i0CD9d+JmWaJ5rToJHBiK4jGF0+ycl5dRH89jAMs5WpJp8ztTH37bn+dfI/OF94B/O2L3x3RAORh9o8qjzZP5H4gV/MjJpyQ6OzD37p5uFQPBv+2U/laJgvuFSeHvgwldalJaUJHuey4lhVbVsBM52Uj05IH6R/Lymi14sC07u75tFusXCSUouVq77/Shc9g/ybZJvHbb5j/CC/lXVEWZ6Q87xdE0VmJa0tQniB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(66476007)(66946007)(31696002)(956004)(2616005)(5660300002)(54906003)(26005)(8676002)(6916009)(186003)(4326008)(8936002)(316002)(66556008)(508600001)(38100700002)(86362001)(6486002)(36756003)(2906002)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c28zZGFQM0dtbnB0VjFlS1ZMdXZiOSs5VzBZdEpzQS9kNzQxMDI5bDZMdlkv?=
 =?utf-8?B?RTdNYWloNkFYYTJwWmE4YTJRaGIxM25TWUdFNjRlZ0l1TkhlMXNCZFN1UXVW?=
 =?utf-8?B?Y0tOMytNUmJ2S1hiNkJ3Z1p6ek9wcWpQcWJicTRDbE1CY2xDamJOTUxIbW14?=
 =?utf-8?B?ZGhtYjViTHVrU0FMSHphbVRSdjE4OHZ3RG9FbDNxTlprSXBXN3RXd0dzRmV4?=
 =?utf-8?B?clNxM0NzSXlWVGtjejQydDhZbndDSVpmdytaV1dodzd2OEp0Tk8ySmNyZS8y?=
 =?utf-8?B?SWQ3bE1VV1huY1FDb3ZJVUpJVWhwOHNqUTFaVDQ2SjZwTDR1clVWUWlneVJ0?=
 =?utf-8?B?ODFDTS9waStoTmc3SCtFSVNxT01namRCcXVFNEJXd21melFnQWVlMm1HL0p4?=
 =?utf-8?B?OEJ1QS9QUjFidzZObkxkNmZKenRMYXMrbnpSbVVtWUNLcEJwNUFtNWx2R0wz?=
 =?utf-8?B?Q1BxWUNoVmQvaDRTeU8wd0pwaVR4Zjd3c0plSTk5T0FlRk10bnlkTDQ3c3hS?=
 =?utf-8?B?VW1SS0l0dWpONHhkSHlvTzRZbFZOaTBSLzRVQXV0R2QxZFRvTmpCWGlEd3dz?=
 =?utf-8?B?VjFjWCs5b0lZUkk0NStUeWpXUDZvc2cweHlWNTlrMmdFTTZxdFBJOTJaSXcr?=
 =?utf-8?B?b2xtcjJGczhMV052OGVjS3ArTjZoVi8yRW1PbnozRDZwb3VxN3VONHloaHB6?=
 =?utf-8?B?MUY4ZGFYTTJMN0pFME9saldPYUJHQVpScnY2K0Zxa3RYN2E5bjQzUFQxakRz?=
 =?utf-8?B?M0lFQ1lQTlJ0ajlyNDVLYTVKdWRxUGdUd1c3SzFUKzNVMGRJcTJ5U1JoR2FY?=
 =?utf-8?B?MjhDVXpXTS8vQUdJY0xsbnJNcmRrTG8xNmk5emxuZ2UyRlYwbUNUamV1cFUv?=
 =?utf-8?B?cDBJY1VCWDliK1V4VE9uRUdvYkcwVVFCMkZvS3Z0eXVKZ25VTXBZL3RZd01M?=
 =?utf-8?B?aVFQV1I2UEx2MThiQ3Z5V2ZLU2FkRGJQZVlFSERxMWRwQ2dXTkZPS0doQlJS?=
 =?utf-8?B?V3NrbElqWXhkZmhuZjFxclJTeFZjUHNPbmtaUXhRUHZleFU3dlBRZXVCMHdi?=
 =?utf-8?B?TlhoZm00RDBUQ25sS3pYK3dOWGZudUdpYmFmNUcxcDR1TW1BdEU0ZUZuNC80?=
 =?utf-8?B?dTZTMjZFaGpsZkFVOHNGOTlTVCtvVWJ4UzNqcFd6VXcwNzRpOWM5MDdSYXdQ?=
 =?utf-8?B?RHY1QjM0TFlCOEdYbUpSS2hwb1dyUVBoODExUEtNK2tmUUdVQ1E1emFOWWlR?=
 =?utf-8?B?UXloU2tqZU9FcTdyL1pIcHVMVEpyRzNDZVdXRTRGYnB1bTF0WmFoL0U3eEcx?=
 =?utf-8?B?Rmd0UlJtR2xTemNxUG1YNk1TM2FXYkRmWU9PQnJPd2xhcnVaWms4SlhTMUlF?=
 =?utf-8?B?dDhWM0pDdlg2d3FjTWpGbU5UTmpLa2ZQajA4USt5bVJIZThua2RtNUQ4TTgx?=
 =?utf-8?B?bU9GdnFnam5rdHduNDVScmRyVHprUmhvd3VwVzEyT1JER05vUVRKTUdUeHVD?=
 =?utf-8?B?cG1NRTk2MGdFNStiblBMVnhpcmxwQmsrL29aMFVnM252blVlTy9QU2ZWb21v?=
 =?utf-8?B?SU94L0xhQVlBQmlDNXk4SlMrTWpEclB1bS8wSGVVeTRwZkFUNTVWNkdFckZJ?=
 =?utf-8?B?SXNLV1R0RG1IWDY1R0pTazR4M0xwWXd1bVJoTVlWVEwzRTVmUTBNUW92MXRC?=
 =?utf-8?B?cGwwNnlJTGdUbnVDMmcvYk9XRXBoSkJSOUdyNnBTbVFXZm1KK3poUEpiLzBo?=
 =?utf-8?Q?oMfMrDQF63wmMO/E/P08/2pmjcbvvplEKsHOC1/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feb38551-ab79-4cca-170b-08d98c8f844e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 08:17:07.8167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5A7nzKvorqqPYhwovpPkRuPigSvPN8cJANwLTZGbTzpe5nEH/PROIfH1av4xsiSjh4VqH2lUCKIvhIE/uIJclw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3294

With NPT or shadow in use, the p2m_set_entry() -> p2m_pt_set_entry() ->
write_p2m_entry() -> p2m_flush_nestedp2m() call sequence triggers a lock
order violation when the PoD lock is held around it. Hence such flushing
needs to be deferred. Steal the approach from p2m_change_type_range().

Similarly for EPT I think ept_set_entry() -> ept_sync_domain() ->
ept_sync_domain_prepare() -> p2m_flush_nestedp2m() is affected.

Reported-by: Elliott Mitchell <ehem+xen@m5p.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -24,6 +24,7 @@
 #include <xen/mm.h>
 #include <xen/sched.h>
 #include <xen/trace.h>
+#include <asm/hvm/nestedhvm.h>
 #include <asm/page.h>
 #include <asm/paging.h>
 #include <asm/p2m.h>
@@ -494,6 +495,13 @@ p2m_pod_offline_or_broken_replace(struct
 static int
 p2m_pod_zero_check_superpage(struct p2m_domain *p2m, gfn_t gfn);
 
+static void pod_unlock_and_flush(struct p2m_domain *p2m)
+{
+    pod_unlock(p2m);
+    p2m->defer_nested_flush = false;
+    if ( nestedhvm_enabled(p2m->domain) )
+        p2m_flush_nestedp2m(p2m->domain);
+}
 
 /*
  * This function is needed for two reasons:
@@ -514,6 +522,7 @@ p2m_pod_decrease_reservation(struct doma
 
     gfn_lock(p2m, gfn, order);
     pod_lock(p2m);
+    p2m->defer_nested_flush = true;
 
     /*
      * If we don't have any outstanding PoD entries, let things take their
@@ -665,7 +674,7 @@ out_entry_check:
     }
 
 out_unlock:
-    pod_unlock(p2m);
+    pod_unlock_and_flush(p2m);
     gfn_unlock(p2m, gfn, order);
     return ret;
 }
@@ -1144,8 +1153,10 @@ p2m_pod_demand_populate(struct p2m_domai
      * won't start until we're done.
      */
     if ( unlikely(d->is_dying) )
-        goto out_fail;
-
+    {
+        pod_unlock(p2m);
+        return false;
+    }
 
     /*
      * Because PoD does not have cache list for 1GB pages, it has to remap
@@ -1167,6 +1178,8 @@ p2m_pod_demand_populate(struct p2m_domai
                               p2m_populate_on_demand, p2m->default_access);
     }
 
+    p2m->defer_nested_flush = true;
+
     /* Only reclaim if we're in actual need of more cache. */
     if ( p2m->pod.entry_count > p2m->pod.count )
         pod_eager_reclaim(p2m);
@@ -1229,8 +1242,9 @@ p2m_pod_demand_populate(struct p2m_domai
         __trace_var(TRC_MEM_POD_POPULATE, 0, sizeof(t), &t);
     }
 
-    pod_unlock(p2m);
+    pod_unlock_and_flush(p2m);
     return true;
+
 out_of_memory:
     pod_unlock(p2m);
 
@@ -1239,12 +1253,14 @@ out_of_memory:
            p2m->pod.entry_count, current->domain->domain_id);
     domain_crash(d);
     return false;
+
 out_fail:
-    pod_unlock(p2m);
+    pod_unlock_and_flush(p2m);
     return false;
+
 remap_and_retry:
     BUG_ON(order != PAGE_ORDER_2M);
-    pod_unlock(p2m);
+    pod_unlock_and_flush(p2m);
 
     /*
      * Remap this 2-meg region in singleton chunks. See the comment on the


