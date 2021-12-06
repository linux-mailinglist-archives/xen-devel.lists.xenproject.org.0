Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A27684696F9
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 14:25:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238900.414047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muDzx-0000nQ-M1; Mon, 06 Dec 2021 13:25:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238900.414047; Mon, 06 Dec 2021 13:25:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muDzx-0000j2-Hl; Mon, 06 Dec 2021 13:25:41 +0000
Received: by outflank-mailman (input) for mailman id 238900;
 Mon, 06 Dec 2021 13:25:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muDzv-0000iL-QU
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 13:25:39 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 007edb62-5698-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 14:25:38 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-30-NzfYniWuOsyPEm1yDV4NTw-1; Mon, 06 Dec 2021 14:25:37 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6176.eurprd04.prod.outlook.com (2603:10a6:803:f6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Mon, 6 Dec
 2021 13:25:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 13:25:36 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0070.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Mon, 6 Dec 2021 13:25:36 +0000
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
X-Inumbo-ID: 007edb62-5698-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638797138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6gE0gFOUnMMz5JyRTUC/L9rSE2loRh2H07DZe6ZHJT0=;
	b=cDx9psvM1o531StI9NxrEojqhQh4KCf9pt2EX9Fnfk7SYXXbbCupuo0dV+vPhS6HvaBtOu
	XkufHmmnR5rpDBDnnLHQIVx7Y7Us9l60Du3wnzqQpKPiw7BB6zuVyVsa+Zc1V5RRTQBytn
	L8ok7+BMdlnt+45hvmXyptAlT9+XVvQ=
X-MC-Unique: NzfYniWuOsyPEm1yDV4NTw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kYXd/9OAYsq7kQVzWjWRcc3CDz1grDcbXCpknTmUpl17SaGVJshsZeTavCOCmGDMNe30as1GZugtnEgc7iTJFQMRH0CudLrx/KMpTY7oreZWwIQJUaRk9Rnw2USqRUKU2GSpBrfquVsz+dHs2aAmX5JIKuL95S4keTvyDTU78l0WSqA8auEg9BT11N8+JFZKcey0UGkiIefOIbcx95koMdWVyC3HHLvasR8z4NuFUC+wa9TsgGQQmqreMAw8zdmd7YTMGGQkvoSsV8pxy0N0MKMDF+blFTMYAqMRJsmmk0lhPh0vI7VVUmzQ7fy/roLGcEokSw4oFKjAzLDCt0xXtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6gE0gFOUnMMz5JyRTUC/L9rSE2loRh2H07DZe6ZHJT0=;
 b=D+HCphIiP77AqoxzaIgPIvGsxTTaIbFtrkggcLQe9Gx9CWIkYyeIFSbDafgv+uSy4DoqzdG+cpX0hzrmL6P10Fuf3mCbyIQe8IYrOmxrvCeRqROHLR+RJ+CHw1ewkeXpc2qiKnu6sOhJ/cJjyoeZrs0/tX08T16JK6zpRO/w+f2Ca77Eh4kGe+IczDb/OZcaOBko3dgS+uu6Nl09jhzNTkAqzdNH0kYPeTwHrwQKFyAFpbnLzGlIqqIUJYj79yDucx/A86SaYs42FzuMZSPYjzPCG2SM7bYBc8WTUoHN+KGXLDNKsbG4EbfO4hFJc+fSYj/s7kmdsahswgwQTH6IGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fe8a690e-9305-c512-9d2f-4256c5c9b910@suse.com>
Date: Mon, 6 Dec 2021 14:25:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH v2 2/2] x86/paging: replace most mfn_valid() in log-dirty
 handling
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <61c1d38c-65a6-e150-ed53-b565d30c18c9@suse.com>
In-Reply-To: <61c1d38c-65a6-e150-ed53-b565d30c18c9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1bee3bb-4837-4d16-995b-08d9b8bbe368
X-MS-TrafficTypeDiagnostic: VI1PR04MB6176:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB61764BD7F6232A80E256C090B36D9@VI1PR04MB6176.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:243;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/fuYhG/LT1tcpXo9PFYUHZUEbKl9lzXxVYUt1CwPGjFN+EbhqLQ1nSrLwwRYcEEICUzz26E9JcIx8jL+gBoT2SUfmS/hzKs/qvhEM93r23Bz+nHNj0c12UxJaeKxtH3cQo2nfc9fbzy3au2NWhhF37s/omOzvy/QTW/FEG6Ciy4V04nV/RiNTZehOCdjKF4cnhHwGblzv8Umpy+XpU5GDWhlGkG7LUss1Sdw9d9ocBUo7KEDTlqeOHvJ/wG5E8Af12cmAcZKC2IiKJEz4aMH2WRNghUe7foMFlXGr5z1Pur108N4PtsSO0Ywnyl7rR1iS+BBZ2EMOy9pnUstTgsdc/qTERc4unXIAPRwD0udy6yTnwx09DklP9qKBQhxlP6UixPqlho4LZd9ZlxObVnF8h6egqlEXRxezym9RdpKoIB8De3j5OaYRyxtr5BUWSg8oM06cxLQe9tmvPm/qi/0KnJgL2/sFwb1ZtWNiNfDASwXuwSYyOM/qIHGVYPpUoZvWhcLYxTcXhhgyEqTuAcaQvlCP1zoURsqbvxlpyPBI3g+wMLAh2jA5UXqpWYjjuERJugPTsqQbk3nmwG3ZF4tt9hRxjSRW/dudMcfNUAku4l8+6J37iaSTnWEOaAdJ130lkyQ5OmWUmgT7M6qJhWa35j0RoYYFY/r4taLBD1gi+SW4OT+dGsz9kAfG067cr8LmjlzFZJ5Lvrmrf4Kq1IMIZB67NAJ9jvb8/f2Q88Im3hFrG5Y4HQTKdpesaI2S5q+KVSfoEqCzc4T2yl421kWKQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(86362001)(6486002)(6916009)(31686004)(508600001)(66556008)(2616005)(38100700002)(66946007)(4326008)(66476007)(54906003)(31696002)(8676002)(83380400001)(186003)(316002)(16576012)(2906002)(26005)(5660300002)(36756003)(8936002)(14143004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnBrdXQyR0xRa2RGNXJuR09sRWhDMEhNbmYydUczTm1kRFdkY21TTjFWZWZT?=
 =?utf-8?B?UmpGeW8vMkwxeEd2ZHR1M2hod0J3bWxXVmtEYm9YWWVVM280bVZVaXVNSUt5?=
 =?utf-8?B?OFZLRXh6L25XTC8xWXBmZzhkUHl6OEpQK1ZMbUk3MytKWThzSytoYXpJaHZB?=
 =?utf-8?B?S0R1eGswUEV3YlJPa3ZLNlRWTjVKUXh4ZFVQcXVyNFJtcDVpSTVHby9vS3pr?=
 =?utf-8?B?YWNXa2ZLWEh1VDczZ09qWWR6Unc4T09ONlFnOEgraGNkVEtMVVV3QzI1bFps?=
 =?utf-8?B?dG5pWlRWV0pxYUlCTkZvRW9yQmwvWmFtMUVOQ1NEdUxDSWtPZHBhdjVSU2tw?=
 =?utf-8?B?RmF0MlNGWFoyWDVTeC9FK1BZeFZWbEpHaFNTVnhsSUgxMUhnWE11RnBxQ3JF?=
 =?utf-8?B?NUlKV3h4WllXVDJlRVJRT1dkUVlITUowaFY4Q0pqSjVua0g4UWFQNmtlSnBh?=
 =?utf-8?B?SWtlSmRLdVhBem5wU0h3YjBDbXBIRmR6a0xqR2p6YXVNQm5vcHBleUoybkZC?=
 =?utf-8?B?VENaUWdETGhLVytETEJzSGxPZHp4K2VuZ3R2UlppaHNvYTRJTWtwdEF6NjlW?=
 =?utf-8?B?N0trSTlqdG5FUGsraExUcDFVd2JnSElEUzdqRWF6K3JSOVNoVzVUYXd3UGFW?=
 =?utf-8?B?d21XWkR3aStDZ3RnSHdqU0RPb05GcFdSREw3N09LczB6aWF1TEJuMW16eHkw?=
 =?utf-8?B?Z0NNbUJ3Rnc4Q2hLc0dlLzdsN2RjYlBRZzQyR2dUSW1vOWxXVllYQVNtVWxE?=
 =?utf-8?B?cFhsbDBEdjZQeVVjeUpQU2p1aklRY1l3Qy9Ea1hBbmVHbk1nUTg0Q1Fhdjg0?=
 =?utf-8?B?UTA0RFczd3ZnbUlPNHNKRFdWcWhZbGNDYWc2dDNFRWZWT1ExbWJpTUNtNU8r?=
 =?utf-8?B?VmllcjZPS1hEYVJKNzNod3NPZDIyVU16bks4UnNBWU00YmJ0cWVzeXN3RWZI?=
 =?utf-8?B?SnRkcG1PSTFOa2dKaHdLb205clVYL05RNTBpT1FiOEZ1Z3o3RERxQnZQMjZt?=
 =?utf-8?B?eEpld0NHTFlhUlE4RVdNKzM1czNkUzc4LzRTL013QjExZ2xaMnVqeWZZUjFz?=
 =?utf-8?B?N0c4b2w1c2FWMjJmRXNxZStlNzZZbXdSZ1NUSU9oZEN4djhyN21HZGlScDk2?=
 =?utf-8?B?YnQ0TjExY3oxNHV5Qld5eEo5R25ZMXE2d1ZxWmQ2TGU3TlBRVWxmeDJrV0Rl?=
 =?utf-8?B?dzVaWFBybm9aQXF2bTRxY2FIbHdQRFNpQytMemRVeVpQYkFuNm1yc1RmaFhh?=
 =?utf-8?B?ai83VmV2RVZKMFZFbVoyUks0NEcyOE5VWlh2QlhzMHU1cCtRQVNhVERWcmdS?=
 =?utf-8?B?Z25jdEp1U1ZlaUZaU0x4dkMzN2RhL1NDSExXVEFlSXBENVlUYkxJOVZmUS85?=
 =?utf-8?B?SUUydDJINWcrM3lZNW1JQnRHd09sWTU5alREdkhSSWtwNDhjbUk1T0VkT28r?=
 =?utf-8?B?MlZ6b2U5eHE3cytjWjBwMlBWYzB3VTMyZlJRSGxaYWYxVVJUTXhZL1FvZi85?=
 =?utf-8?B?eVhRSHR2QldvZXdLTCtOZm5OU1VVbU1uNmMxMDBYR1hRUUlNOVdEZmhMMTA2?=
 =?utf-8?B?SGRCZjZBRGJ2bU16dS9kMzQ1bjR4azJpbTUxUEhoeDRqMEVYWFpqVVE2aFJ0?=
 =?utf-8?B?WkZDdWsvWnRpaTZpVjl2TVNDa0ZxVlZwRVVkZzZLMzVTVkdUTnBBZTAxVFZX?=
 =?utf-8?B?R3ZSV0JTVnZKY014SEpyVXpibkZqN2t6blk0Y0p3ZW5BaStFVkIzQ0pHODdz?=
 =?utf-8?B?UlIrNDl3QzBvQlZ5SDR0L0k2UW93Q2VyczczRUtDR09Kc0Y4SkdscGlibGEw?=
 =?utf-8?B?VVh0V2dRTUFFQjhkTlM4NXlIUG1jdmMvY3pNMUM0NXYyaitBbUora2RpZWE1?=
 =?utf-8?B?aVg4M2pUMFR4MFY3OUlkYmRMdFE4cWNVbU9ZcHhlTUZUdlM5YnczVUExbjZW?=
 =?utf-8?B?VFhBM0IxUXcxSmNDTmVSelF5UWpXNDdMVTBjUjdUbW42OCtValA5QzNON2tq?=
 =?utf-8?B?YlhwbWV6cFRFbWZ4NVBYY000RFhDTmt0SmFRWkNaeTFmeHBYUjVlamprdUZ0?=
 =?utf-8?B?STlZOU96REtPb0puQmV2d1hLeHVsaU4xa3NxZ0tieTBRTGZldUcvU0I0SklN?=
 =?utf-8?B?YXpmdjI4cFN2dnRRVGpyRFFYZm4xdFNMK2JPbXRkTGViNE14STZneXZCMSsx?=
 =?utf-8?Q?uePtL/meDc0PWzMZjoH17ro=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1bee3bb-4837-4d16-995b-08d9b8bbe368
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 13:25:36.4473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NRNmn+2DA8uNRsTNpn2FP24qwh5oefY++JtlnzcwRi2+hmYCZRi2KmmSOdUc1LvZr5rvRgIxiz44ySKcjWTDvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6176

Top level table and intermediate table entries get explicitly set to
INVALID_MFN when un-allocated. There's therefore no need to use the more
expensive mfn_valid() when checking for that sentinel.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -74,7 +74,7 @@ static mfn_t paging_new_log_dirty_leaf(s
 {
     mfn_t mfn = paging_new_log_dirty_page(d);
 
-    if ( mfn_valid(mfn) )
+    if ( !mfn_eq(mfn, INVALID_MFN) )
         clear_domain_page(mfn);
 
     return mfn;
@@ -84,7 +84,8 @@ static mfn_t paging_new_log_dirty_leaf(s
 static mfn_t paging_new_log_dirty_node(struct domain *d)
 {
     mfn_t mfn = paging_new_log_dirty_page(d);
-    if ( mfn_valid(mfn) )
+
+    if ( !mfn_eq(mfn, INVALID_MFN) )
     {
         int i;
         mfn_t *node = map_domain_page(mfn);
@@ -98,7 +99,7 @@ static mfn_t paging_new_log_dirty_node(s
 /* get the top of the log-dirty bitmap trie */
 static mfn_t *paging_map_log_dirty_bitmap(struct domain *d)
 {
-    if ( likely(mfn_valid(d->arch.paging.log_dirty.top)) )
+    if ( likely(!mfn_eq(d->arch.paging.log_dirty.top, INVALID_MFN)) )
         return map_domain_page(d->arch.paging.log_dirty.top);
     return NULL;
 }
@@ -116,7 +117,7 @@ static int paging_free_log_dirty_bitmap(
 
     paging_lock(d);
 
-    if ( !mfn_valid(d->arch.paging.log_dirty.top) )
+    if ( mfn_eq(d->arch.paging.log_dirty.top, INVALID_MFN) )
     {
         paging_unlock(d);
         return 0;
@@ -143,20 +144,20 @@ static int paging_free_log_dirty_bitmap(
 
     for ( ; i4 < LOGDIRTY_NODE_ENTRIES; i4++, i3 = 0 )
     {
-        if ( !mfn_valid(l4[i4]) )
+        if ( mfn_eq(l4[i4], INVALID_MFN) )
             continue;
 
         l3 = map_domain_page(l4[i4]);
 
         for ( ; i3 < LOGDIRTY_NODE_ENTRIES; i3++ )
         {
-            if ( !mfn_valid(l3[i3]) )
+            if ( mfn_eq(l3[i3], INVALID_MFN) )
                 continue;
 
             l2 = map_domain_page(l3[i3]);
 
             for ( i2 = 0; i2 < LOGDIRTY_NODE_ENTRIES; i2++ )
-                if ( mfn_valid(l2[i2]) )
+                if ( !mfn_eq(l2[i2], INVALID_MFN) )
                     paging_free_log_dirty_page(d, l2[i2]);
 
             unmap_domain_page(l2);
@@ -288,35 +289,35 @@ void paging_mark_pfn_dirty(struct domain
     /* Recursive: this is called from inside the shadow code */
     paging_lock_recursive(d);
 
-    if ( unlikely(!mfn_valid(d->arch.paging.log_dirty.top)) ) 
+    if ( unlikely(mfn_eq(d->arch.paging.log_dirty.top, INVALID_MFN)) )
     {
          d->arch.paging.log_dirty.top = paging_new_log_dirty_node(d);
-         if ( unlikely(!mfn_valid(d->arch.paging.log_dirty.top)) )
+         if ( unlikely(mfn_eq(d->arch.paging.log_dirty.top, INVALID_MFN)) )
              goto out;
     }
 
     l4 = paging_map_log_dirty_bitmap(d);
     mfn = l4[i4];
-    if ( !mfn_valid(mfn) )
+    if ( mfn_eq(mfn, INVALID_MFN) )
         l4[i4] = mfn = paging_new_log_dirty_node(d);
     unmap_domain_page(l4);
-    if ( !mfn_valid(mfn) )
+    if ( mfn_eq(mfn, INVALID_MFN) )
         goto out;
 
     l3 = map_domain_page(mfn);
     mfn = l3[i3];
-    if ( !mfn_valid(mfn) )
+    if ( mfn_eq(mfn, INVALID_MFN) )
         l3[i3] = mfn = paging_new_log_dirty_node(d);
     unmap_domain_page(l3);
-    if ( !mfn_valid(mfn) )
+    if ( mfn_eq(mfn, INVALID_MFN) )
         goto out;
 
     l2 = map_domain_page(mfn);
     mfn = l2[i2];
-    if ( !mfn_valid(mfn) )
+    if ( mfn_eq(mfn, INVALID_MFN) )
         l2[i2] = mfn = paging_new_log_dirty_leaf(d);
     unmap_domain_page(l2);
-    if ( !mfn_valid(mfn) )
+    if ( mfn_eq(mfn, INVALID_MFN) )
         goto out;
 
     l1 = map_domain_page(mfn);
@@ -370,25 +371,25 @@ bool paging_mfn_is_dirty(const struct do
         return false;
 
     mfn = d->arch.paging.log_dirty.top;
-    if ( !mfn_valid(mfn) )
+    if ( mfn_eq(mfn, INVALID_MFN) )
         return false;
 
     l4 = map_domain_page(mfn);
     mfn = l4[L4_LOGDIRTY_IDX(pfn)];
     unmap_domain_page(l4);
-    if ( !mfn_valid(mfn) )
+    if ( mfn_eq(mfn, INVALID_MFN) )
         return false;
 
     l3 = map_domain_page(mfn);
     mfn = l3[L3_LOGDIRTY_IDX(pfn)];
     unmap_domain_page(l3);
-    if ( !mfn_valid(mfn) )
+    if ( mfn_eq(mfn, INVALID_MFN) )
         return false;
 
     l2 = map_domain_page(mfn);
     mfn = l2[L2_LOGDIRTY_IDX(pfn)];
     unmap_domain_page(l2);
-    if ( !mfn_valid(mfn) )
+    if ( mfn_eq(mfn, INVALID_MFN) )
         return false;
 
     l1 = map_domain_page(mfn);
@@ -477,17 +478,18 @@ static int paging_log_dirty_op(struct do
 
     for ( ; (pages < sc->pages) && (i4 < LOGDIRTY_NODE_ENTRIES); i4++, i3 = 0 )
     {
-        l3 = (l4 && mfn_valid(l4[i4])) ? map_domain_page(l4[i4]) : NULL;
+        l3 = ((l4 && !mfn_eq(l4[i4], INVALID_MFN)) ?
+              map_domain_page(l4[i4]) : NULL);
         for ( ; (pages < sc->pages) && (i3 < LOGDIRTY_NODE_ENTRIES); i3++ )
         {
-            l2 = ((l3 && mfn_valid(l3[i3])) ?
+            l2 = ((l3 && !mfn_eq(l3[i3], INVALID_MFN)) ?
                   map_domain_page(l3[i3]) : NULL);
             for ( i2 = 0;
                   (pages < sc->pages) && (i2 < LOGDIRTY_NODE_ENTRIES);
                   i2++ )
             {
                 unsigned int bytes = PAGE_SIZE;
-                l1 = ((l2 && mfn_valid(l2[i2])) ?
+                l1 = ((l2 && !mfn_eq(l2[i2], INVALID_MFN)) ?
                       map_domain_page(l2[i2]) : NULL);
                 if ( unlikely(((sc->pages - pages + 7) >> 3) < bytes) )
                     bytes = (unsigned int)((sc->pages - pages + 7) >> 3);


