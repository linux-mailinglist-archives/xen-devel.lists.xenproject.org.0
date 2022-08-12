Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA91590CD3
	for <lists+xen-devel@lfdr.de>; Fri, 12 Aug 2022 09:45:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385375.621001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMPMR-0001kA-Lg; Fri, 12 Aug 2022 07:45:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385375.621001; Fri, 12 Aug 2022 07:45:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMPMR-0001gi-Ib; Fri, 12 Aug 2022 07:45:39 +0000
Received: by outflank-mailman (input) for mailman id 385375;
 Fri, 12 Aug 2022 07:45:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yzoh=YQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oMPMP-00012b-Qy
 for xen-devel@lists.xenproject.org; Fri, 12 Aug 2022 07:45:38 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10081.outbound.protection.outlook.com [40.107.1.81])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0dd67ef-1a12-11ed-924f-1f966e50362f;
 Fri, 12 Aug 2022 09:45:36 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8646.eurprd04.prod.outlook.com (2603:10a6:10:2dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.25; Fri, 12 Aug
 2022 07:45:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Fri, 12 Aug 2022
 07:45:35 +0000
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
X-Inumbo-ID: c0dd67ef-1a12-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hGvgD2r6ZNAfYasNMrXQBINNYU87OJrAmodE7FeFl41+oIiIc7EXcc8OI8sZHiXKcJNV+LJG4YohiVCLPwZT0IJIjIC/8KruTN2U+mpp40JDbNRA/Owo+lfH7g2xb4Pyma5KTxcpJS511oYO6332EmSgrUlAYAkopOQldak2ezPJ2Wszx3sRhkEQ9OYdvXweYHKfK8bZyd+A2xltZ5CJ7XA8wHsqaizNhmhch1ChZ9HP08wrAlBkAbhH00Z2+yqvtecpDm24Y4GIXLTQgeI2NLcIva2E8SgyKjPf4KZV9o2ek1q/lUd/vlmqbCHJCzeqZucfiNt/1hmQQ9uSHJq7FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wMkmvOzz2gve8PQhJ5TEoDWHfH+EBc0eAdwOWdZ75oc=;
 b=VpuzxLIjEz/ne8+SPoVeomw9e+1jLbOYkbSns1YwrWLwXhH+f8f7mmiWzPjBx/QhYte2+i1dqjFRjKzWXzBFz0LG/prhwkyq+menlkon0ik4jB3pRD4H/+lx1xr67tUelHFnJV2t+Ug11AgoSc8rnNupXEdgJOfVYLcFM/hps5YcRoR1x6T9olcONTTs/bttnwNv8tmCvb1SFnibTmMK6mC6AofWgiyvoqh57cF7BUUODtNRuxvGc8iYqqAx3Twcq5o98j0JlAjqUC6XdzUCxNBlYo2IU45ixXnkAcog7mrP4M0+ZCCrVSDbEvujtljSu3U0xcWKX9Z+df47FQIiKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wMkmvOzz2gve8PQhJ5TEoDWHfH+EBc0eAdwOWdZ75oc=;
 b=lPi2lAe8UhE/VSDInXcSScwRdTImiWAXPwwTvQlNPnyVKsNS34DyKPHzRm1JeUfcpuyKZIGrM9GIkXy0jw65L6mIs1Y8jFbdjNOY2W1tuRspapCugZdsYvhCnpPC4P8fyP9DfUxaorwLiao9wxcVWsjFvALYI2ZzAyqyZbqDFJRXysua782gceymVPgv4uq2+bD87d1QU1tN8CCptc0rbeATwXXuWw6nyes04ImGg9RH7PHL1WDupFRitYU5+UTismpK9BGdsxL/dPj4r2JGeCB8xctPXevMuuvGJz/PLrZJhlveGE2m8ERBQD+KoqVrJF+rvMhtoNGPReG3E7tiMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b2798fb7-9bcf-e67d-1cf5-6de1fcd24ddd@suse.com>
Date: Fri, 12 Aug 2022 09:45:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: [PATCH v3 4/4] x86/P2M: allow 2M superpage use for shadowed guests
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <1522137d-cfa9-22e5-64e8-b1795ddbce21@suse.com>
In-Reply-To: <1522137d-cfa9-22e5-64e8-b1795ddbce21@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0105.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 318036f0-2e04-4fa0-803f-08da7c36a43d
X-MS-TrafficTypeDiagnostic: DU2PR04MB8646:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mZnERGyHS3czO3rCsIL8JtEGYkIQtibNakxWUScwOTj8/mlX+/sIeZezcvpmv/xjVvYVHZ50KWVBz1w30+DclRxyd4dfksyeJTCxL4eDEwOKVSLcYkrtCA5HE7LR9Sh2UD/rqYV86wZg7D0nz7nK0WP6vuGKp3T1dcCDZpXRcX+qdA7yykStDLS3R/7WamE8nfcPPx7ilhRlepzYIPdUhxeNH4h+3jO8cHzN2V16E//HWhu+vQ8vjZnE0AIdqD2P4Rgzn2z8C9xC8gB5ySqi2awCk4onBEu7xLLfCQkUpX13+RQd2wtOy8ijnI+1WYrC2nYVqWIONpr/NMmxQtcBjmGNzeKZfeVvl8bhtZRY3JomD1G9y2ddwZSOZBb0fzPhTnqwz9MbflOCB5lQUkxQqpeAxFrKXw6LNtjW86h9XUzFO1MlesCC9gzZAct7n9H++jaaSyCHszJEsby2i/pPTbjG3g3vci4caQZD8h/eDx57iQww0hgl0RH7Lb0a6Nz/2XfxfOe8C6ZmZ+c1PiglhosDGkD63+ueRsnB5M7wRDQpfj4Ig7SSOGyhiVoheZ1OQN93jvjlhyfXl40q7FIUceKG8bi9Fnn+6aMOG6dOw2/o6FyXTW0gL1e+ajvjS5g1hHqSjKFxN9K1VNyx1b2nKmOGRn6gI6zbgQ5Ad6zqn5hCW1FbOv84+p+I2y+2oFZkPcRH5m9yEIzGKtHcIl4J6XGRmsCpTGJiSZQq87kIjb8PNxlj7BowrUEJGr0d0E7cGxW1LkMWscmz6WW0fuugWmkKTGveSTepS4ojN/9xmO8+fIczZ2aK+w5AYs/dD7PIOkiITn2Io8nRJs5Fps7Xzw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(39860400002)(136003)(346002)(396003)(366004)(6506007)(8936002)(26005)(6512007)(54906003)(6916009)(2616005)(5660300002)(41300700001)(6486002)(86362001)(31686004)(36756003)(478600001)(186003)(31696002)(83380400001)(316002)(2906002)(38100700002)(4326008)(66476007)(66946007)(66556008)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlpMNHlvbzhvNGtMOUQ3QmN5d0tFNm9URVR5QVh0dnBma29nMkt3OVFqYWNO?=
 =?utf-8?B?eFN1U3ozSzZNMElFeTZ4ZHhyMGZlVmoxMnZJblVvbUpvVnlRQmhDdG9zbXhW?=
 =?utf-8?B?R2xuT2tEVnJ4V0ZSalNTa1RuandnL1VPSzEvZjVGUEsyL3luU0NHaENQTjd1?=
 =?utf-8?B?WFd6NWpLYUIzRzdGa3RYVWU1Q0lQNmVuOVdHelBWSkJjdUhxZTdSNmI2T2tC?=
 =?utf-8?B?TGNPMDNhSzJ5WWxyTUpLVHNXY0trUEEzd1FKSlhRVXYxdTlvVnV0WkRLcTVK?=
 =?utf-8?B?NStCd3dodERCeFc5YlRxVVFTSzRnM1Q1UGFBcjJwU2pLMFU3SHdOOGRpZDlu?=
 =?utf-8?B?RXNkRjBEaTV4R3haaWZWOTkwMnVVMWJoTGErQ1Y5L2ZNbFUvcGFxd2U3bzZx?=
 =?utf-8?B?MGpNTDdnLzhFcGZzZm52d0cvNytGR2g5WS9WeEZRd3NiMjBkckg1cFpGYjZH?=
 =?utf-8?B?S1Z5OEtWRU54QnRpSkFXcGd0NDkydzkrRXFrSkQrS3ZEeDdXWGo1NHY4VlBW?=
 =?utf-8?B?cm4wVlRUWjcwSXZGQk10RnZTYVJ1U2c1VisvZVo5YVl1TzRtKzM5Sjd0TTdx?=
 =?utf-8?B?UUxySGVWTExMOEgvMXhHc2V6N1Ewa0srcEFwTmZNemQwaEFHWUlDTGR0WmlT?=
 =?utf-8?B?Y3JyUkU3eUtPbXVxQjFyc1FZVWFRb0R3VWRvWHVqVXpmYk1FY3hXcmNFcUk1?=
 =?utf-8?B?RXhWUFRkeWtRZ3dYRVlrakNVZ05SOWZ5endBRlBQVW80NHVQb2N4QVpTaGhN?=
 =?utf-8?B?aXZpVzJ6YjVBbXdHRWZTRzNOVTMwMW5rRktkWE5MMml2L1ZFMURZNCsvaVBG?=
 =?utf-8?B?dWtqbVV1VEJXaE4xOVJ5WTdEQkZBNnBOMWxiV3A2V1hXTThLa2IxbnpBajNy?=
 =?utf-8?B?UXVRZGpMVkxLYlNoNHcyOW1ZbHJMM2JsYXY2SklKbkFtMS9WN0I5d29CSUtV?=
 =?utf-8?B?bzF0aEpaWVlpOWVHQmxXdlMyREQ5RjNKRVJJaHRYTzhKN096dTBQZkFBZDRD?=
 =?utf-8?B?dkxndEtCY1pLN2VaSE5QWWhpSnhlODJFc1p5VmN3WEFWRHJ6ci9qc1RDTjly?=
 =?utf-8?B?bHFWVTFtRVBKWG9QSjJqazZ3ZlI3b1IzczlOdHVGRlNkdVduUTdTV3B1dmVo?=
 =?utf-8?B?Rmd1dWJ3OUhzU0IrQUk1Q3BKUTR4SUhLYWVOTUpvT292Y1NSdWhRblJidGRM?=
 =?utf-8?B?U2RmdHpDTDJlTUwvTExRVy9udWh2UXZ4aEtvSnJPUkZJSEt2c21vOHl5QzJX?=
 =?utf-8?B?M0R2Tm5VNktUQzArMDRpOVhxU2ludHZJdmFkajNsczNOWG1HVmpXOWdoTGpa?=
 =?utf-8?B?Y2J6TkNiYjBIMFdzZmRRZlZtN1Y2dTZ0N2lqR2lBbWhQV25IVXE0a0xaNnFJ?=
 =?utf-8?B?Zzh5UGdrS0VpRWY4REhvZkVWS0h2K1QrdVR3ZSttd3llUEFXVzA4YzhvUjVL?=
 =?utf-8?B?eFZLK3hxaXZEWHlLSXBoY2F3V1VoSGIya2gzeUNzbGdsZFl6cXRpd1Zmelh0?=
 =?utf-8?B?VzViQmZRQ3Ria0MyYVlMMEEyQkZ3aldDYlZ6NFFDZm1JZFh5MTB5Zm8vemZR?=
 =?utf-8?B?bk9GRFFkSEU3d05WWVRFZmJraXBYSmNWelJXSDVNNGxpekJURkdHbXdDQjMy?=
 =?utf-8?B?blQwSGhRdkw0RStUeXFoVHh3YmdqV2ROU002V2JrQ1BRcTF1elJWaGJBWVp0?=
 =?utf-8?B?VDNiWTJvTjBLZnEzTDBZcWs2NWdPZHV0NTRTRE9xQ0pBK281WC8rWkdUSGs1?=
 =?utf-8?B?N01oQjZBVlZHY0FoekNOaGtjdkd2dXc0L0U4Tkc1MCtnc3FrUWRvdXV3dlBm?=
 =?utf-8?B?SGw1VGFDL25qVGpWVUc4NVkxb2I0dnF2dityaTVVeHZaOHUxOEU0ZTFoTzc4?=
 =?utf-8?B?dmRUMWF5U0E5YmhMREI1RU5uaTdtQVZPem8zRjc4alMwR21KYjdGM2FrUDFY?=
 =?utf-8?B?SGx6NFNodlpxcEluaElUT3FpV1cxeFRsUm03MitBYlhPa0U2MW1pd0cwcjI4?=
 =?utf-8?B?eDNYQkNhbFM5dEV1VXE2ck9BUEVrV0FCcjFLZXdWbjVDdlJlNmk4ZEZTb25o?=
 =?utf-8?B?QnJhTWJncTFOc1lYS092aWRoSzRkQ0d4NWRFRzVxUm14Mi95c0dEYklNcWhG?=
 =?utf-8?Q?OCGl1eP0w3oXw0P/aUP2CHqxv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 318036f0-2e04-4fa0-803f-08da7c36a43d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 07:45:35.3012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G9s0/V8ZjsnIAj0wfQpmEN9dv2+8j0SswHwMY60jwnDZdrOe/n27WYpubOPJPa5S83ks9mD87HAmHQKcAwu5sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8646

For guests in shadow mode the P2M table gets used only by software. The
only place where it matters whether superpages in the P2M can be dealt
with is sh_unshadow_for_p2m_change(): The table is never made accessible
to hardware for address translation, and the only checks of _PAGE_PSE in
P2M entries in shadow code are in this function (all others are against
guest page table entries). That function has been capable of handling
them even before commit 0ca1669871f8a ("P2M: check whether hap mode is
enabled before using 2mb pages") disabled 2M use in this case for
dubious reasons ("potential errors when hap is disabled").

While doing this, move "order" into more narrow scope and replace the
local variable "d" by a new "hap" one.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Extend description.
---
Strictly speaking "fn_mask" could also be "unsigned int"; I wasn't sure
whether changing that would cause objections.

While at least sh_unshadow_for_p2m_change() presently relies on this
behavior, it is somewhat odd (and inefficient) for p2m_set_entry() to
split even non-present mappings.

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -403,28 +403,22 @@ struct page_info *p2m_get_page_from_gfn(
 int p2m_set_entry(struct p2m_domain *p2m, gfn_t gfn, mfn_t mfn,
                   unsigned int page_order, p2m_type_t p2mt, p2m_access_t p2ma)
 {
-    struct domain *d = p2m->domain;
+    bool hap = hap_enabled(p2m->domain);
     unsigned long todo = 1ul << page_order;
-    unsigned int order;
     int set_rc, rc = 0;
 
     ASSERT(gfn_locked_by_me(p2m, gfn));
 
     while ( todo )
     {
-        if ( hap_enabled(d) )
-        {
-            unsigned long fn_mask = !mfn_eq(mfn, INVALID_MFN) ? mfn_x(mfn) : 0;
-
-            fn_mask |= gfn_x(gfn) | todo;
-
-            order = (!(fn_mask & ((1ul << PAGE_ORDER_1G) - 1)) &&
-                     hap_has_1gb) ? PAGE_ORDER_1G :
-                    (!(fn_mask & ((1ul << PAGE_ORDER_2M) - 1)) &&
-                     hap_has_2mb) ? PAGE_ORDER_2M : PAGE_ORDER_4K;
-        }
-        else
-            order = 0;
+        unsigned long fn_mask = (!mfn_eq(mfn, INVALID_MFN) ? mfn_x(mfn) : 0) |
+                                gfn_x(gfn) | todo;
+        unsigned int order = (!(fn_mask & ((1ul << PAGE_ORDER_1G) - 1)) &&
+                              hap && hap_has_1gb)
+                             ? PAGE_ORDER_1G
+                             : (!(fn_mask & ((1ul << PAGE_ORDER_2M) - 1)) &&
+                                (!hap || hap_has_2mb))
+                               ? PAGE_ORDER_2M : PAGE_ORDER_4K;
 
         set_rc = p2m->set_entry(p2m, gfn, mfn, order, p2mt, p2ma, -1);
         if ( set_rc )


