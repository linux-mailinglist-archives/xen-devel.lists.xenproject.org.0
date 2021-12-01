Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0966E464C46
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 12:02:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235882.409154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msNNJ-0005cj-2B; Wed, 01 Dec 2021 11:02:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235882.409154; Wed, 01 Dec 2021 11:02:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msNNI-0005aK-Uj; Wed, 01 Dec 2021 11:02:08 +0000
Received: by outflank-mailman (input) for mailman id 235882;
 Wed, 01 Dec 2021 11:02:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gc09=QS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msNNG-000517-RJ
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 11:02:07 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92bfb4eb-5294-11ec-b945-1df2895da90e;
 Wed, 01 Dec 2021 11:51:01 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2059.outbound.protection.outlook.com [104.47.8.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-UvxS7umGOc2QSbh9K0jT4A-1; Wed, 01 Dec 2021 12:02:05 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5743.eurprd04.prod.outlook.com (2603:10a6:803:e0::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 1 Dec
 2021 11:02:04 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 11:02:04 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0176.eurprd06.prod.outlook.com (2603:10a6:20b:45c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend
 Transport; Wed, 1 Dec 2021 11:02:03 +0000
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
X-Inumbo-ID: 92bfb4eb-5294-11ec-b945-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638356525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ivkhnbVo3ZCtO6SLZl0Vo9tL62ytjpIHAIb5DwwD2SU=;
	b=lqKO+gWfBDOP+FH+WfU8TKHNpTSlSdNcGhYOxHwtRVaw5xcc9uZIWz7Y3SJ1FEkWn5ga0g
	AQf78LCkwQDUdRlldQNv/1v0k+RuakNYWDcd43DChZMU0rZLXUUxiBHEmlgJG/WOv99Gm5
	fjLbXihFf+dUU8kGCZd/G5kUBfC4dKM=
X-MC-Unique: UvxS7umGOc2QSbh9K0jT4A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cpqTe3gdzd7o0uiY5ZdnN56bEskD5gwkMKpHARtNPmGMzx6QgPv8qCJzS4h5I8yEsc4R8S9wNuOZ9XnWYjuqkxl6mFEUKTDeEUyBOfIPBE1hQBKrKzj2Zx+Ape6Ha3XsqK3R8bByd//U23mPJK8FUoS7ZjXNeGQwbMRZZvZgWQds8oUwG2SBRh9LZnF5c0ofFe6PZ4Wtspva9tJdozN1zOu3caJHqKldby8Ts7PTxPpddEz0a1Gxst+H0xHQPBfg+RD8OtlXPtTDjrtwu3w0IxrPRHJN3XJk5MVlIwfG/Zs36H/lKP8rsHZ+e19KsHJd4i0YT4LUvKejhxdBELomjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ivkhnbVo3ZCtO6SLZl0Vo9tL62ytjpIHAIb5DwwD2SU=;
 b=Zuyc23ovwhDkp2BkGyoRLyrwsVdX7ypqsBBcqcWXadTsmV7LVqnADQ/p9NmV4T1V0F8mWZ/V6f9RJopgyWfZ3gF7PcUR1+jnwDK2ogxzFbXXfFuS+eBhH08Jg3pQsrFQMIVDNUDPQUoqCXISeS+MjkIXYjIymujELKV3hePA9lu5Rrg56/E+ixU6CSqCc4UoXbjBQAa+0TWGzGcKgot4XrlUbuMdDGfVyYqRiOyhui052Poa7PD7+hduWJB46EehtC6cbEr4YKtG4DtQuUl2sAA54JiLtTxrztGPB6RF9SGUCTX/Ry5et/G3N+vrpLyJ/2T4DspmhpfCoj8tfgTDfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d92ec1b7-6cde-7efc-2c6a-3dc3696b957f@suse.com>
Date: Wed, 1 Dec 2021 12:02:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH 2/2] x86/PoD: move increment of entry count
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <ac46f25b-e669-f309-b36e-c4760e10479e@suse.com>
In-Reply-To: <ac46f25b-e669-f309-b36e-c4760e10479e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0176.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d86fb32f-bcdf-4551-b1b1-08d9b4ba0200
X-MS-TrafficTypeDiagnostic: VI1PR04MB5743:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB57432FF503517F2FF6621940B3689@VI1PR04MB5743.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yZFGFSP4dr64oFGenfI1p9dKJ6IrHd81hFtyNjLrR3+heI9NpNWqOPA2Moxg+X+hexOWoZ/M1UUpow+C6Ur52wxU0IIjkq4PCnoM6+TNn25fvH4d632o4c+qfxdVWSFowjHsqOXxQi8v0+EvYU4OmhI4OwQaJm2N6UeMrOr0TWMbsV979PMmIhRQvvqi6MI0y6x7cbYt1v5k+VkaAsw0Z6Q9rUmVtj6IR0KPoZrTaNq2Q5mrDDU9tssKhmk1JmUyFb60E2F9D8ygQCk39E0MYLxYvTSmrWZiCkpWeMRYM4D4xqFfCscg7sIXamdJ1sCyEtDo/gey3g2yquUKpx08808k1wMnYnABzoAuks8+SLfepnfdPKK9/xFDdUm+nii5CJSXRmhI5P+jKUNNSfBKTkLR4DYeC4JdJLoNzXGGmEH1GNltjy35O1MJADJJAAXUb8ezVz+ysHXaMHbRQVvu5KJudP2M1Kr4qFRtuTgudBy+qIcH8BmK7+7Iqt91LSnDYbvuOYpuO8cUX3n44Ezt15K/k4IQCugxtxCtDVv8TxSGn8mUMQoFSrMOtdWwQkC2dzJxXB86rxkzo1QWgN0fKkATC/MfsucwP5TqUYMSwx+xTSSVQKB1y0rimSYv1R0Pp8rH0AMSW0hzcKLWfIxOA/VoJsnunyikd/+ilLRg0yEIW/NLrk/DU4JvAXreNpChgmXmN/2Y4oKcAOp4J5lLgPRNLDPJuaS6Gj0xRDQFVRM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(8936002)(16576012)(316002)(36756003)(6916009)(31686004)(66476007)(66946007)(83380400001)(38100700002)(31696002)(5660300002)(2616005)(956004)(54906003)(6486002)(186003)(86362001)(26005)(508600001)(4326008)(8676002)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGMxTmRCQTRtRExCcmNQbDVVand6YjJqaVpkM0MwZWpYT1JsSi90bXJxRURn?=
 =?utf-8?B?VkM0TVJiUHdDZ1BhVnlEWWhGendRZzNMeTMwbngrRHZ4K2E5SEgrUk9sTGFi?=
 =?utf-8?B?WXJ6RjBJZWM2bTVZenkxL0p6VXQ2SUJFSnlwTUUzUm5xdndwZktGeTFXYnBs?=
 =?utf-8?B?bW1XN3VuUUdTeEVISWJhbGVzMFJrVjRkN3F3ZG5XUm1QRXdVVFd2ZHZlNXcr?=
 =?utf-8?B?R3N4ci9tS01LNWh6N0R3VFRKNEdCbmE0YTFEcFNrZDNWQTEzd2NOMk0vemFa?=
 =?utf-8?B?ZEgvclQ1QTZNVXhxeGgyYVM1ZVlFaU1jdU5rRUhOUVpSbjdvOFVrL21yWWR6?=
 =?utf-8?B?K01CWUhRMUE1OWJMc2RKWmlZMVVQek5XaHpUYWdHWG9pOFhMK3U5UVF3bGJM?=
 =?utf-8?B?R1F0ajRnYklTTWFuL1JlOUJhL2sxeDBDVjk4dDZYSzFhZDJOeE9uNDhJRUIv?=
 =?utf-8?B?aEVUaklBWElpVUZRdHF3dGZnWG5uY0piYnRlTzJlbVJzYXVsSDV4bVZiOTJo?=
 =?utf-8?B?RzY2K3FacXFxUlhjNnhPblBkd0dwcUJVcUVsbWgwZVZlM2REcXF3dE9PbVJE?=
 =?utf-8?B?QlRwWkJncVZwc25EaEt1cE5OY1AwNTZ5d2drWVFCZTNvN0srSTdYMWhCUzZX?=
 =?utf-8?B?cUpGRkpPVGJzV0xaWC84Vm1LMkQ1Q0pQK2Q0WVg1YmlCTXN3MUx3S3hUR05N?=
 =?utf-8?B?NkJPNk44SnZhcENtdTR6QWtBVXVsTm0wcGc0VW1yWEUrWkRuTnJhNUZmeGh0?=
 =?utf-8?B?eWl5Y1lFSkhkTnMxcEZwdnVBVlJQVFJqd3NKRGNBRGJzbFEzT1dJam03QU52?=
 =?utf-8?B?SFJaNTJ5czZRUTNIMGFIZ3ovMGw1UVp0THUzekg4TkJKN3BWYmpoWW52VGda?=
 =?utf-8?B?eDNJaUpBSCtCNFhFR1ZuZ2lMZVg4NjQxUjhBeTJVYmE3YXlVckRKZmFCaFky?=
 =?utf-8?B?ZmpYcGkvMnBiT0RZYzhId3p3YzM2RGxNV1pmR1l4YjJmbG44VlpDSUhXV0hT?=
 =?utf-8?B?cmltVE9KeWFHY284aUZzZmFMS2tscjJVQTdMbTM1emtyYnRxTXhlLzFLbHU3?=
 =?utf-8?B?clpNR05nTWp3RHFsNk9PNWwxd3R0b2lBOXl2L05NQ3BNZXhMcVlQbUpBZVIv?=
 =?utf-8?B?bHcrOXFrRGl2cXAxRklqcnhNWGpWSjF1cmdzNXMwVWtNdmhKVWhPSU5vaFRr?=
 =?utf-8?B?ZWx2N1l1SmFBTzNWYU9WYlRJME9CWHBZUjVKQ2J5ZjVUOXVsNUFoRW5YR1Nm?=
 =?utf-8?B?ejRHTUM0c0FvRW12MytEbXpUakdwNytRb1pLOGpwMUdoZm1sMWhpNmM4WUJa?=
 =?utf-8?B?U1pxUnFCU0tzSzBJTXVBVmN2ZjMvdHY5RmtVSStGL3lCTWFnN094NThDTk9B?=
 =?utf-8?B?anNreThhZlBHTWpKSWN5blRXU2dVb3JJUmdLTFErMUIwaTZVZmlxQ1RDM0Nn?=
 =?utf-8?B?ZklpUDZJUnRMajQ2WkVZUGM2eDIyRGtPZk1FQ0NGdEN4WjFYOEhrZm04OC9z?=
 =?utf-8?B?UlcwNkRtRTRHZXBaOS93UkpDR05VTmUrckpkbzZZY3I2VWxnMHp3L3pudHpk?=
 =?utf-8?B?ejFYNUNvTVdQcFBleDMxRUFnS2w1NUk4WDNCUWN0UXhEcCtSU3JMeE5mL3k3?=
 =?utf-8?B?akNYaHptVHBELzc4anJJTDZmbVhhbU1BZEhFOVUrMVgySHRyV3lveWJxdFVn?=
 =?utf-8?B?ZklXeFBjRHFWRlk0V2hxWUdpeWVkR09XRFZQMzRjWlNlLzJCYitGaFVkM0dO?=
 =?utf-8?B?Qmo3T21hRkNQRWh1U1p1VE8wUWIrOW1LOHN3TVZkV3BwV1NsTVRiTzd3c1NU?=
 =?utf-8?B?WElmQ2hwelpoWVRsaTZyN2pSTVNVbDhzREpuclFkM0JOdW93T3ZEOU9wMVc3?=
 =?utf-8?B?RWIzbVBTMEwrSmNKTFMzZGNhYTlzZzdJWHJYT1Z4UjRLeFdQVWZ1M29qZVV5?=
 =?utf-8?B?SkRZcU13TW50V1Vva2dTOVBJc1p3MWdublFHaDdDSVRFNlVMSWpkTmkyRFYr?=
 =?utf-8?B?ZmdXdkNHcHM2Y256Zmx4Z0ZqcG01U3ptYWxkTGovWnJIblhNcnAyU0FqZVNq?=
 =?utf-8?B?clcwQXpjdElqZk5wZmRtMUJUKzJEN21xMjB5c3ZFVmtPVUgwZlo3RXNmdlZi?=
 =?utf-8?B?VGJaZDBCRlhoMHlkWTFsdlN4VGZYWDFtMUdqLzIzTENlRFdybFhPaWI4azh0?=
 =?utf-8?Q?jRE3K2/QY6Ep1UcufiJbDho=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d86fb32f-bcdf-4551-b1b1-08d9b4ba0200
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 11:02:04.1151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uGPST0ygLERJYiuaYAd9+uo4laZ0hLvPExHaGbF+DGp29d5mt9lHVdqbT+BOccHcRo6DMx3358yDrvrW0Ce5AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5743

When not holding the PoD lock across the entire region covering P2M
update and stats update, the entry count should indicate too large a
value in preference to a too small one, to avoid functions bailing early
when they find the count is zero. Hence increments should happen ahead
of P2M updates, while decrements should happen only after. Deal with the
one place where this hasn't been the case yet.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -1345,19 +1345,15 @@ mark_populate_on_demand(struct domain *d
         }
     }
 
+    pod_lock(p2m);
+    p2m->pod.entry_count += (1UL << order) - pod_count;
+    pod_unlock(p2m);
+
     /* Now, actually do the two-way mapping */
     rc = p2m_set_entry(p2m, gfn, INVALID_MFN, order,
                        p2m_populate_on_demand, p2m->default_access);
     if ( rc == 0 )
-    {
-        pod_lock(p2m);
-        p2m->pod.entry_count += 1UL << order;
-        p2m->pod.entry_count -= pod_count;
-        BUG_ON(p2m->pod.entry_count < 0);
-        pod_unlock(p2m);
-
         ioreq_request_mapcache_invalidate(d);
-    }
     else if ( order )
     {
         /*
@@ -1369,6 +1365,13 @@ mark_populate_on_demand(struct domain *d
                d, gfn_l, order, rc);
         domain_crash(d);
     }
+    else if ( !pod_count )
+    {
+        pod_lock(p2m);
+        BUG_ON(!p2m->pod.entry_count);
+        --p2m->pod.entry_count;
+        pod_unlock(p2m);
+    }
 
 out:
     gfn_unlock(p2m, gfn, order);
When not holding the PoD lock across the entire region covering P2M
update and stats update, the entry count should indicate too large a
value in preference to a too small one, to avoid functions bailing early
when they find the count is zero. Hence increments should happen ahead
of P2M updates, while decrements should happen only after. Deal with the
one place where this hasn't been the case yet.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -1345,19 +1345,15 @@ mark_populate_on_demand(struct domain *d
         }
     }
 
+    pod_lock(p2m);
+    p2m->pod.entry_count += (1UL << order) - pod_count;
+    pod_unlock(p2m);
+
     /* Now, actually do the two-way mapping */
     rc = p2m_set_entry(p2m, gfn, INVALID_MFN, order,
                        p2m_populate_on_demand, p2m->default_access);
     if ( rc == 0 )
-    {
-        pod_lock(p2m);
-        p2m->pod.entry_count += 1UL << order;
-        p2m->pod.entry_count -= pod_count;
-        BUG_ON(p2m->pod.entry_count < 0);
-        pod_unlock(p2m);
-
         ioreq_request_mapcache_invalidate(d);
-    }
     else if ( order )
     {
         /*
@@ -1369,6 +1365,13 @@ mark_populate_on_demand(struct domain *d
                d, gfn_l, order, rc);
         domain_crash(d);
     }
+    else if ( !pod_count )
+    {
+        pod_lock(p2m);
+        BUG_ON(!p2m->pod.entry_count);
+        --p2m->pod.entry_count;
+        pod_unlock(p2m);
+    }
 
 out:
     gfn_unlock(p2m, gfn, order);


