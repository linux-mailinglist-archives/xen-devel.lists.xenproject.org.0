Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E57B43365B
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 14:53:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213150.371279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcobc-0000Ag-51; Tue, 19 Oct 2021 12:52:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213150.371279; Tue, 19 Oct 2021 12:52:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcobc-00008C-14; Tue, 19 Oct 2021 12:52:36 +0000
Received: by outflank-mailman (input) for mailman id 213150;
 Tue, 19 Oct 2021 12:52:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gzZp=PH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcoba-000085-KX
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 12:52:34 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6a8d6c4f-9ddb-4b5d-afbd-773410be9ff7;
 Tue, 19 Oct 2021 12:52:33 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2053.outbound.protection.outlook.com [104.47.5.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-36-XBA-h1sFNVKL0DLYSyfNFg-1; Tue, 19 Oct 2021 14:52:31 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6672.eurprd04.prod.outlook.com (2603:10a6:803:127::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 12:52:29 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 12:52:29 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR08CA0031.eurprd08.prod.outlook.com (2603:10a6:20b:c0::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 12:52:28 +0000
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
X-Inumbo-ID: 6a8d6c4f-9ddb-4b5d-afbd-773410be9ff7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634647952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=J6uEHd9m49ZImhQ66YKOzPW7dyQfpUbMytSt7KlyfCo=;
	b=kcLllc7YxKTaRcjZkKnFrh86Ove0fGaNETNtfj86ZLf9b0lZJn357w+MyOZbs1Z21CY5W+
	DP14TMp0bpYz7R9zCu1eAw3Cke3US1PxPYEFsrXuUhQPjwFdgKhMhiPIFOaO9eaGMW43ES
	ltRBKo4urPW3PAIPG81B+FibaZcV8HQ=
X-MC-Unique: XBA-h1sFNVKL0DLYSyfNFg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mxl6j1Yatiqn8hiWMX/ORRIb9mgJKourLEWRGijuh+YEjSh9056MhvB2Xlea/j+ESucvaU42UvQAdPn4gVIMRi4lmD3D6jFxXPs6mPyRvUFv6ObfK+IDRRAD6gjDqhU5pEUoCaBm6Zsj65X7bRhbtYMqrV6GCMDMzhWWwgg6VKcmXywQzvCRFwaxp//1scoNcN3BjV4nnHrYj3BP6LZD5uBk2HW2NPcG2jsrkM6niHt6ICF+OXRYxLWN6Ou53w7jWaRj7c6XWsH50m8X3dd7kM1ENm9Q730AXRw5Q/pI5HsLScHWOJ4eSUyIZiOB74DYEkiIR4SteoR5vKQRMdiXGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J6uEHd9m49ZImhQ66YKOzPW7dyQfpUbMytSt7KlyfCo=;
 b=gSOQyhrdUMgyPMMmEnOyy7M+JwrdKRXYpzUi56lmWYiwRSwljFa3K7TMWmNJu6aSJWJJKAGszDptiUbPH/NF3o144CQxrvXW3V/DwhHkt2M5lhKfFSM/ww1kehysB+LioAjpxovgG8k9w+vk4zTko1WX5GupwfRevlwRK7dz7pHvrrJTy6S8Y+6Mjkqy8QA03yDetd+K6rn0sZuwLzCSQt7iN8MF1tjgxI63wKySLEPYbs8KIKCiJ1KYiBHaotqe8k5NNmIqXsyRnXmXupMYDD60bQFaqGpUk/uwpzIUyZ5o0TiPTQHTu+qmrd4+PLcllgXKz1ayfU4/xqWPZfsegw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=suse.com;
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86/PoD: defer nested P2M flushes
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>
Message-ID: <c6f2dcd7-81e6-3fb6-0e13-3ffb95e12bc1@suse.com>
Date: Tue, 19 Oct 2021 14:52:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0031.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1ffd7bf-af3d-47ee-f14a-08d992ff4f02
X-MS-TrafficTypeDiagnostic: VE1PR04MB6672:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6672C9E198494919EF507693B3BD9@VE1PR04MB6672.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Myas+4x6aUH//NtNEq8J2tbdDLk37RSEBZfT68ZhejiVYPLhnk64rPAm0/fSpp50YTTqXrfP7EamFLmWu6nFu1ZhRn80eK2BPwJSC0r8DLrcPzFewItIakME3i+tcHUZ1ABRpUF1/uMZ5JX8KW41DScvIPBGzS/lIVt8mpipOCw7r5Gqqs098TqAsjlTPYF3V0I8wTRDNwGvk9VWSodP8DHwAlk02luEmAdvZwSfV6O/QRAWI6Mhhto2H4hrOzw0U11rcW/1ZgTS+7zUhWtjcVNnylqJMLWkNtl5gscp68GIJ+N95qsvVTWgOZFfWcqHIs+N1Zi5kk9irjWhQRnJ4G2RPch/BSsVoW7hA378Hh6nLsMQLiv7Fey6L2rzSm36yF5o2JzAODd2irdvGsy2JobfH7bPDCaapP9ogskan5w2X9U4+5m/nNb0+eiDne7zX0ttQtBU0AFFK1uy5q1t8t9esXKSDVbYeUc+sa42LxtExEXLuj1cOiVg7BikmMyHgskdJWpXtoMTzf8VcgdSIP0rrl3OureD1ddqWe9himt2EcOJ7me1ftIIy5YjyjUugGfj3oGUoMMPaKKgSJMnZ2ipu0Gtwhdt0273B6bQ1zXkujBpUEyCRnJ8XAny3pFQdL8n886/Cl3SJzW3PRkvslYcadYGReG9HeyFS2znpIoFkGsmFuhzQDnNsXL9R50xspsR9OHGqEdaE+EddB98I7Ehi4jffjXYQ3ijpcHFEoY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(6916009)(26005)(66476007)(956004)(5660300002)(16576012)(2616005)(316002)(2906002)(8676002)(508600001)(66556008)(31686004)(8936002)(186003)(54906003)(66946007)(31696002)(4326008)(86362001)(83380400001)(38100700002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjIxcm81aDcybGxzZDYzRjBhQkVQQjNkWTZvSmE0MnV5MkVsWFVtMVdydnha?=
 =?utf-8?B?OVR5WDJhZk5KOW1yeEM4M2tXTlBQcmRIOVdQVy9SYTdqelpMWFI4NWM2b3VE?=
 =?utf-8?B?RHdvbGl0YWoza1oxZkN1UDZyMEMvTlM2SlJxY2Vuc2wzNitKbmtLcFd5dWkx?=
 =?utf-8?B?c1BwSjFrWGtvQWhXdThIOUFQUWU4T3o2a2lXVTFlWndDQVczZSsvbHMzWU1X?=
 =?utf-8?B?V3FBYXRsWlJaUFZXZUM2Ykx1U2h2RExLbSs3NUVKT1pjWXFTTyt5MERkVXN2?=
 =?utf-8?B?WDJycjBhL1JqR2s0OUljaktuMlpLd1ZTQWY1Q2hnWElHUTdSakt0a3pRbm4x?=
 =?utf-8?B?OW5KbmVvQ0dJQ3hzMUpXZHlpOSs0VWw0QUMxVmRQNVV1V1pwcDMrTUd2RW5E?=
 =?utf-8?B?Z3lDVm00WjZDbCs1b2swWHNNUEljb1dVRmZpNE9mb1hmZUdScmpDYjMyZGdN?=
 =?utf-8?B?V2dPK3IxNkhVV0VlWm4zd1c2V1JPQmxEaVY5Zk1uNHlmM0VWRzc4TDFWRzhq?=
 =?utf-8?B?UExXMGVOb1VXcWJ5ZmdmQ0N0M2RKSUhEbnRXYngrdnFuZTMyOHZQY3krYk5p?=
 =?utf-8?B?czNOeEZCd1kvczU3OFVBUHJrKy80SHpyUzNqdlp0QTZwaFM1SDV0YUtHdXo5?=
 =?utf-8?B?Zk1ZRktnUWErY0prUk0zcHZkSkE4SnlOQU56cGJkM2xVVXErVnMrRXplZEJx?=
 =?utf-8?B?Qy82VU5WWVhNemZJL1pBd3YydE5obVZyTmlXb2I2WFlmZTNDT092aU93NVpD?=
 =?utf-8?B?dWFSMXhlMXpuajA3bHRNdTFaNXJXSmxCZVZWc2xwQy9GY2o1QmN2Mm5tN3Fx?=
 =?utf-8?B?WUpicDRucldtd002L3pEMWFxUnBNRW5aMzJnKzdZZ1RJV0JWa2NXTW83ckZG?=
 =?utf-8?B?NGNvWTdyeFQ1Qk80bHFISldQUytBSno3MHl4NVdVVUhQUXZxSDdnc2NJV2hu?=
 =?utf-8?B?Mm1iajRHNXU3eHNSTytSVFY4Q0dnY0VWWGZiWkdjSVFRcGMvNnJKRTJkM2JU?=
 =?utf-8?B?RHJqWFZFMkRJNlF2dFN0a2t5c0NnRlZXMUQ1bHdwSnptRFQycWd4UURVWktm?=
 =?utf-8?B?UFovM1NkTjdEbmRRVXY1b2VUK3BYK0VpYzJNdDhuWDBML2Z0cjBQNXlBZGJB?=
 =?utf-8?B?S0c2ZGN5OWFHcVdSejFielBadzlZYXFEZWJtS2o0WS9wZVdBQy9QVUxnSmZT?=
 =?utf-8?B?Y3g2aEhkaFc2K1ZSL3lLVlh1clhZemJ4NFppVlRwRWVxWitybXVLYjFweVlY?=
 =?utf-8?B?bGhDcmxoazQxQ3hFSU5HbDhsM1NMTEhaVHVRaGp3dUhNSUJwS1FFQTd1MzRX?=
 =?utf-8?B?U3d1QjFxRXE0Uzl2MHpncko3cG01MG1vcVhpd29IUDIyRy9oOVlEOVRNRUpj?=
 =?utf-8?B?ZXpiNG1xVExGS2FlT2h4NkR6dDJoSTZEeW9ZOWxTVEsvNWI0Z2Z0Tm5xUnRp?=
 =?utf-8?B?a1ByVGtkQWVFTU9HdjZnOFVHQTUwSVpsQ0E1cmdneWxicVl4SGdOSXZMQjEy?=
 =?utf-8?B?dHcwM2cyOFhaNUJ6MldNQU9BbXZPM2pDY0RrbENJc2ZaMEFJRG8xa0dGTEgv?=
 =?utf-8?B?R2NYOGhzVTNkL0dqMlFGbzI5RkcrOE1SdUNtMjJPRDR4Vy8vVmtMMnhpOVho?=
 =?utf-8?B?NDBZNjcrY0xxR041Z2t4VDBqbHV5cDJBSEhCT3A0TjR1MWFQdVJLZ1c4MkhC?=
 =?utf-8?B?WHBpc1JzV3Q0VElTdks1R2FTU01EbEY3V0h4cGJ4KzNUT2dvSFBnQS9MVTF4?=
 =?utf-8?Q?Led4mPWJBjtykftu8XLXVwa/oGLYJ/Y4Lyq+9t4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1ffd7bf-af3d-47ee-f14a-08d992ff4f02
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 12:52:29.0424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9BrpslF+kiLIRZa82eR4x1NSuDbannwVueG858N0Ft1ARmybyiI3jDDc+d+A2beJEKdgMkoSdsKq3LrQWiBF2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6672

With NPT or shadow in use, the p2m_set_entry() -> p2m_pt_set_entry() ->
write_p2m_entry() -> p2m_flush_nestedp2m() call sequence triggers a lock
order violation when the PoD lock is held around it. Hence such flushing
needs to be deferred. Steal the approach from p2m_change_type_range().
(Note that strictly speaking the change at the out_of_memory label is
not needed, as the domain gets crashed there anyway. The change is being
made nevertheless to avoid setting up a trap from someone meaning to
deal with that case better than by domain_crash().)

Similarly for EPT I think ept_set_entry() -> ept_sync_domain() ->
ept_sync_domain_prepare() -> p2m_flush_nestedp2m() is affected. Make its
p2m_flush_nestedp2m() invocation conditional. Note that this then also
alters behavior of p2m_change_type_range() on EPT, deferring the nested
flushes there as well. I think this should have been that way from the
introduction of the flag.

Reported-by: Elliott Mitchell <ehem+xen@m5p.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Also adjust ept_sync_domain_prepare(). Also convert the flush at the
    out_of_memory label. Extend description to cover these.

--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -1253,7 +1253,7 @@ static void ept_sync_domain_prepare(stru
     {
         if ( p2m_is_nestedp2m(p2m) )
             ept = &p2m_get_hostp2m(d)->ept;
-        else
+        else if ( !p2m->defer_nested_flush )
             p2m_flush_nestedp2m(d);
     }
 
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
@@ -1229,22 +1242,25 @@ p2m_pod_demand_populate(struct p2m_domai
         __trace_var(TRC_MEM_POD_POPULATE, 0, sizeof(t), &t);
     }
 
-    pod_unlock(p2m);
+    pod_unlock_and_flush(p2m);
     return true;
+
 out_of_memory:
-    pod_unlock(p2m);
+    pod_unlock_and_flush(p2m);
 
     printk("%s: Dom%d out of PoD memory! (tot=%"PRIu32" ents=%ld dom%d)\n",
            __func__, d->domain_id, domain_tot_pages(d),
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


