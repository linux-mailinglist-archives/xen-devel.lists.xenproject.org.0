Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE7765F0AF
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 17:00:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472002.732088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDSfQ-0002tq-Ry; Thu, 05 Jan 2023 16:00:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472002.732088; Thu, 05 Jan 2023 16:00:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDSfQ-0002rb-Oj; Thu, 05 Jan 2023 16:00:32 +0000
Received: by outflank-mailman (input) for mailman id 472002;
 Thu, 05 Jan 2023 16:00:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lIpW=5C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pDSfP-0000Ja-JV
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 16:00:31 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2050.outbound.protection.outlook.com [40.107.103.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 134a6360-8d12-11ed-b8d0-410ff93cb8f0;
 Thu, 05 Jan 2023 17:00:29 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB8046.eurprd04.prod.outlook.com (2603:10a6:102:ba::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 16:00:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 16:00:27 +0000
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
X-Inumbo-ID: 134a6360-8d12-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fxAjOOLrji3RG5UA1diO5HQwpPpZmwtgl/I4YEhiFwdGWMqONKqxCWXTBeHzm3iPhlRWZIUXQq+llrbVlocHN00J1vrSs/hwR+wuweTW101hIuS/eDiRbGmjrCrE/41lSrCNx5abbvpy63aL88EBK4aua1/7ZxLnJusC5ePjiqXU8P+M4660veGwJ42/lZ4Ibb3nWQL6M+c/RdZj6wjIN7UODCG/dzYpgnfDeez+KJw/PlnEo+giB1nI8lixJi41IjB/oLdLxpK+fDj0r6to6djr15Mi3uSvyBptWvBk5NSHdZIh39lXodr46vLXOqEs0tdbWaKUHCn+hhFdeaplQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ccVaAbNoDzT3PDnX15GWyJdkpvb9ChZOySArZobL5pY=;
 b=J16Pr14Zty8dPH0kjaQ69LVW9oK8wGdnE/S5ZtL2VbqsJIPuXyReoOn9IUCFKPM5iLXz2505wNnMrhJE8DEHO8FzrZokXtcbiTPPcQhWQqepMpEk2Z+6Lk7wEWiZak4TNXasxUnoh0tdejQXQ3xKbZr0SkSxnVoFnG/LjXLqL3liB66pq7K7+QCbYxqYeQxWzva0h+b0EHjRbtXeJdjR9wb/XC8ISXa0+SBg4Izm/dX8BCPkm9a96HQMg7IQhHq9bkfAPhwY8YoP3T4cDx7ayB4RIOIxnfbexqSDv6NtikyVE6Nr+9duJHTrSpRMsB7KVsobsPrFY8BToS11C02zEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ccVaAbNoDzT3PDnX15GWyJdkpvb9ChZOySArZobL5pY=;
 b=uleiPKAIJvQhzEH51SiiGkOKvGwSELn6D7nRQ9CCD0VnznoAgXMhBwgFl5AHV0CIEjTJt6z5A3aer9+hBOf4vc6JjCk6EHkUyQcEA1wffN910+82DhrV2MG+PTjqZcFxh2bHzMVqxJ+WfqracXALtAKuvC77oOAy3+w8hOItEAzxIMN20RSiQLG7ioRR4jSqSkHl+zpP+j0TCYdsfmW5mseq5MJDuuiogsm+qP0GEMvNK5lqucotzmrmnfhvzMxHcYQcAYn4ueidfwa+96mXnUHCJTSPuRr9A8WcxERLKVmcgpdQ1Lr+19ZCE5uG6w881pQwLoNahH49i/elBOgL1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <46233ea3-9bce-b23f-3e6c-887b2c21ee71@suse.com>
Date: Thu, 5 Jan 2023 17:00:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH 04/11] x86/shadow: rename hash_domain_foreach()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <074dc3bb-6057-4f61-d516-d0fe3551165c@suse.com>
In-Reply-To: <074dc3bb-6057-4f61-d516-d0fe3551165c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB8046:EE_
X-MS-Office365-Filtering-Correlation-Id: d2f29f5c-f0f0-4bd8-8ee4-08daef35f633
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oVbbK8g/mC5+HMlDJhWTg9A8eqdUUCE2nqSxOCWajgyL7w6Y5i/r9tnK0rmkLutZADeYLKt7rYUGVXDiC533QhzA1U2mO8xLAabf/w28n+zj9cKmVPj6b/4htYwOgkUFwaxG5V/FuV8XWa8d4fOv2St6aqvV93EJfqwJZKcayJ82vaS6Rn1JespxPHfHDlBZN0ox8+r2B9u9ANVuuTsrNNbL0h1Dib/SBFFDsVz4fRuV82sDf416kJZPyN05ADT6rjedAu38ViyDeAWlG+ItxJuQZ1E3IGtoujgb3vrFJyJ9TX5crEViDFfVcgNzDDsDYKS6ssvtbYovR6dBaHYTFAaAiSUMjxzmdoFY7Gy1FWbCWnkpmaJotZlpkV5WuURfuKesESKkwTe7878KjRsWxMMO9ZXNHH9/6BmwhiFTJVWPRdQrJqb9Ga3+/8fBjR8wMXLDhQkV3Gdf/VBudCQDx3bEz3LKj952QsLBejEWOyK+7w0pqL/sWsJ+pf7AD29gE5seFExlVf+IXG/Dc6lbX9qESQy2uqDh6ev2dOJbYVmM1Z+ewyY13Oj47zenVB8DGKgQOfxAEpcH2YZbiumBxgp/AOaaVjJUiMjFmhf/w74Jbq1OvQoloc7/YpBh0EPA9s7HiKgwco9qcczG24vIhNMZN5DEzs4kTXkeAs4RhmdkcrkCUG/YYuQrNGWSHyRCUyBDI/IYPvWi9YamLbVwZF6gVZ4rSKQe70Tht7GVobo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(396003)(346002)(366004)(39860400002)(451199015)(38100700002)(6506007)(316002)(83380400001)(31696002)(4326008)(86362001)(66476007)(66946007)(5660300002)(8676002)(2906002)(66556008)(41300700001)(8936002)(6512007)(26005)(186003)(2616005)(6916009)(54906003)(478600001)(6486002)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUFhL0dZWWFwbXMvMzVRTHlVaGg5SGIyMmcvc0dJcWFqTzNpaExmN2RsNG9K?=
 =?utf-8?B?RER2TlFyTlpZeWlWWjZ3aEd6dC9nYXdWb0JmNVduQzNqK005eEk4cCtPdGxh?=
 =?utf-8?B?MDhaMUZVZlA4L20vb29rSEZOWDR4NDllZWJic2g2cmtGeTUvSm53b2lCVDlq?=
 =?utf-8?B?c2prOUdDU0dCNHNFNlU0R295ZXdQU1pTMWVTUDN4Q0JIa2hEcjNKU1NwZFVu?=
 =?utf-8?B?c0NrQVg3WEU3Nk5wWStwekNHMm5rWE9nUEp5UTJFRGQrZGU4WE9hQ0xBN3Mw?=
 =?utf-8?B?R1FZbi9ieWZ3QkFjVnRwdVozVmxIUDlMYTFWSHBZZFExRTlUTFkxTVYxRlRZ?=
 =?utf-8?B?Z3NVRTJhdWNYUk5CUzRsOFUrdUcxdk9VYTFQYjg1S0txcWthMnZUZ0ttR1Z2?=
 =?utf-8?B?UGNPekR6T1hvelBabnRWVHc4ZVhGcjY4enpwc2R3QWZ3ZWthT2dTNDVZVklj?=
 =?utf-8?B?WlJ6V1Q2WDZYSzBwSC9BRzdVYjJ2VkwwT24zSXRRbHZYRDJhZ0x0V041VUpX?=
 =?utf-8?B?Tm5ia0UvS01pTTNydTJTbDNUVVI5ZkJycitNeld5MzVCalhIeXg5LzhPRnV0?=
 =?utf-8?B?bDRHdEpIQlZCK3Z3MFAwUmV0MmROYlE2WW5TRENZZmw2aE9UbHVpTnZtNTI2?=
 =?utf-8?B?S3ZET1ZXeTlsUGxkeDc0LzlCU3NjQ2xwZDY2R3JhZzg1NnBjQVlIeDEvTXAr?=
 =?utf-8?B?enNMRjF4VHlhaUtueE5QY0FyUVpndGlIUmRXTHNsZTB4YjlWTXRNZGtaUW84?=
 =?utf-8?B?R3RRTzlVd0dxM2FjK2d1dmRwRmNpdGNqd21IZlJ0T283KzdrTmptakRXWkYy?=
 =?utf-8?B?blFBQjArVUkrUWgxczU4WVdITDhDVCtSa0dpSHRrRGF6R0FmVkVZWnFaZDMz?=
 =?utf-8?B?bVhSNFBRYXludDA4bWZaajJDZ2FHNUE2Q1NiL0N0MUpQeitwNUs0YngvRk03?=
 =?utf-8?B?RTg2alBudnlhR0lNUzlSaTJZWERGTThjY3dnZFQ2SjhraitsL21ISkZsSHhY?=
 =?utf-8?B?MWtnY3g4ZHVUK2FyZ3ZQTlpEZmNEWjhFQ2dVOVk0ZXhDWTdVbjV5N3pjYThJ?=
 =?utf-8?B?Vm9qTyt1M3JhbGUrKzZHZzUxMVBWK2NaV3V4Ymxxc2I2eVVPbjdKZmJ2dlZU?=
 =?utf-8?B?NFUzd25RMVV2YXJzbnlLR3J4QlpicDRyd3luRUNMek1YTmpjUUc2NG85QXMz?=
 =?utf-8?B?cXR0MXRPVEt4WE5nNE1sS2lZam9FVEZCeVk5ajloYlNwc3JhbUg4bnJ2d3Mr?=
 =?utf-8?B?SVRHZzBuMHVIVEtpT2w3bGEvYlpnQm42cnpGOVFjQ3RaU3pwNWFaWkRqUTRk?=
 =?utf-8?B?MTdMbHVDN3pFaVBLQXIxeEF4TUVTSjJ1Zkd5aHVRdDFMSkY2SEVEL05ZZ0p6?=
 =?utf-8?B?SS9tNFlFS3FvVEdSTUdNckhDUnYvazBBQWRjZE5UMjhoNWkzUHUzWnFEM3J0?=
 =?utf-8?B?VysvQml3YWhYVXJiaFJRTnFWSkNyWWp3Z0N5Y2pwTW4rZzdtSUFCem53d3pJ?=
 =?utf-8?B?c0tod1Qrei9DNTZYSHB4STc0ZEVzN2tqRmcwQk9DbnA5VWg1UGFaS2lNaytB?=
 =?utf-8?B?NVd4ZHkxZlVzTjQvbzBuQkRqbjU3dWdqdm5jam1wTW96alc5L3JRdVoyS1lD?=
 =?utf-8?B?NnBaSWM3aXpLdDlmKzRab1FTZlo5cE5BMVkvazBYdEc3UjZLWVRJNHRqcjI4?=
 =?utf-8?B?cU9oVU1yL3prVkpZSjFMbnBqTDg0YTZDdUhLL3BZdXNha3ZrQ3VGTlEvdlNt?=
 =?utf-8?B?STRKc2RTM2Y0R0VGWmVvZk0wNWx6SE9OWGhkMmgrY2kwWHR4c2h5aGFyZENC?=
 =?utf-8?B?ZS85ZzliLytHcnVBOE42NTZlRU44NFF6clhWeUo3Mk5oZUNIU2p0cDZmTElO?=
 =?utf-8?B?a2hZd3gxbTVHOEI3VTJ0SVdaMW5JQnp6anJmS1Y2MURhckR1SG1xVmZqWVdZ?=
 =?utf-8?B?SURXMmpEanUrc0UyRjl2NHJteStMeUpoRzlvOVlMWW9RRFNYWTQ3V0VyaUg4?=
 =?utf-8?B?RFk2VHlOdEVTeFpqcm9TcWNtUVE5eXlHVG9YTmVIb1pxTHhwS0x1bEVIUGd4?=
 =?utf-8?B?K0d6QSthcFIvRkQvWDh3ckF2djQ5bHFqTDdvaXZhVjRyK2l3RHo0RDBMc2xE?=
 =?utf-8?Q?SbGAA+/PE/ZQFLQYh4kZN6S+6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2f29f5c-f0f0-4bd8-8ee4-08daef35f633
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 16:00:27.1413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +l6KEO+gl/jpLOR3lQpqLK0F4Xt1P139pvE6qzAXAjshO2TnaAlMetrMwu3MQEf3oheEFvV/Pxw8I/sh/L1Cbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8046

The "domain" in there has become meaningless; drop it.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -1640,15 +1640,15 @@ bool shadow_hash_delete(struct domain *d
     return true;
 }
 
-typedef int (*hash_domain_callback_t)(struct domain *d, mfn_t smfn, mfn_t other_mfn);
+typedef int (*hash_callback_t)(struct domain *d, mfn_t smfn, mfn_t other_mfn);
 
 #define HASH_CALLBACKS_CHECK(mask) \
     BUILD_BUG_ON((mask) > (1U << ARRAY_SIZE(callbacks)) - 1)
 
-static void hash_domain_foreach(struct domain *d,
-                                unsigned int callback_mask,
-                                const hash_domain_callback_t callbacks[],
-                                mfn_t callback_mfn)
+static void hash_foreach(struct domain *d,
+                         unsigned int callback_mask,
+                         const hash_callback_t callbacks[],
+                         mfn_t callback_mfn)
 /* Walk the hash table looking at the types of the entries and
  * calling the appropriate callback function for each entry.
  * The mask determines which shadow types we call back for, and the array
@@ -1784,7 +1784,7 @@ int sh_remove_write_access(struct domain
                            unsigned long fault_addr)
 {
     /* Dispatch table for getting per-type functions */
-    static const hash_domain_callback_t callbacks[SH_type_unused] = {
+    static const hash_callback_t callbacks[SH_type_unused] = {
 #ifdef CONFIG_HVM
         [SH_type_l1_32_shadow] = SHADOW_INTERNAL_NAME(sh_rm_write_access_from_l1, 2),
         [SH_type_fl1_32_shadow] = SHADOW_INTERNAL_NAME(sh_rm_write_access_from_l1, 2),
@@ -1969,7 +1969,7 @@ int sh_remove_write_access(struct domain
     else
         perfc_incr(shadow_writeable_bf);
     HASH_CALLBACKS_CHECK(SHF_L1_ANY | SHF_FL1_ANY);
-    hash_domain_foreach(d, SHF_L1_ANY | SHF_FL1_ANY, callbacks, gmfn);
+    hash_foreach(d, SHF_L1_ANY | SHF_FL1_ANY, callbacks, gmfn);
 
     /* If that didn't catch the mapping, then there's some non-pagetable
      * mapping -- ioreq page, grant mapping, &c. */
@@ -1998,7 +1998,7 @@ int sh_remove_all_mappings(struct domain
     struct page_info *page = mfn_to_page(gmfn);
 
     /* Dispatch table for getting per-type functions */
-    static const hash_domain_callback_t callbacks[SH_type_unused] = {
+    static const hash_callback_t callbacks[SH_type_unused] = {
 #ifdef CONFIG_HVM
         [SH_type_l1_32_shadow] = SHADOW_INTERNAL_NAME(sh_rm_mappings_from_l1, 2),
         [SH_type_fl1_32_shadow] = SHADOW_INTERNAL_NAME(sh_rm_mappings_from_l1, 2),
@@ -2024,7 +2024,7 @@ int sh_remove_all_mappings(struct domain
     /* Brute-force search of all the shadows, by walking the hash */
     perfc_incr(shadow_mappings_bf);
     HASH_CALLBACKS_CHECK(SHF_L1_ANY | SHF_FL1_ANY);
-    hash_domain_foreach(d, SHF_L1_ANY | SHF_FL1_ANY, callbacks, gmfn);
+    hash_foreach(d, SHF_L1_ANY | SHF_FL1_ANY, callbacks, gmfn);
 
     /* If that didn't catch the mapping, something is very wrong */
     if ( !sh_check_page_has_no_refs(page) )
@@ -2132,7 +2132,7 @@ void sh_remove_shadows(struct domain *d,
 
     /* Dispatch table for getting per-type functions: each level must
      * be called with the function to remove a lower-level shadow. */
-    static const hash_domain_callback_t callbacks[SH_type_unused] = {
+    static const hash_callback_t callbacks[SH_type_unused] = {
 #ifdef CONFIG_HVM
         [SH_type_l2_32_shadow] = SHADOW_INTERNAL_NAME(sh_remove_l1_shadow, 2),
         [SH_type_l2_pae_shadow] = SHADOW_INTERNAL_NAME(sh_remove_l1_shadow, 3),
@@ -2177,9 +2177,9 @@ void sh_remove_shadows(struct domain *d,
 
     /*
      * Lower-level shadows need to be excised from upper-level shadows. This
-     * call to hash_domain_foreach() looks dangerous but is in fact OK: each
-     * call will remove at most one shadow, and terminate immediately when
-     * it does remove it, so we never walk the hash after doing a deletion.
+     * call to hash_foreach() looks dangerous but is in fact OK: each call
+     * will remove at most one shadow, and terminate immediately when it does
+     * remove it, so we never walk the hash after doing a deletion.
      */
 #define DO_UNSHADOW(_type) do {                                         \
     t = (_type);                                                        \
@@ -2203,7 +2203,7 @@ void sh_remove_shadows(struct domain *d,
          (pg->shadow_flags & (1 << t)) )                                \
     {                                                                   \
         HASH_CALLBACKS_CHECK(SHF_page_type_mask);                       \
-        hash_domain_foreach(d, masks[t], callbacks, smfn);              \
+        hash_foreach(d, masks[t], callbacks, smfn);                     \
     }                                                                   \
 } while (0)
 
@@ -3167,7 +3167,7 @@ int shadow_domctl(struct domain *d,
 void shadow_audit_tables(struct vcpu *v)
 {
     /* Dispatch table for getting per-type functions */
-    static const hash_domain_callback_t callbacks[SH_type_unused] = {
+    static const hash_callback_t callbacks[SH_type_unused] = {
 #if SHADOW_AUDIT & (SHADOW_AUDIT_ENTRIES | SHADOW_AUDIT_ENTRIES_FULL)
 # ifdef CONFIG_HVM
         [SH_type_l1_32_shadow] = SHADOW_INTERNAL_NAME(sh_audit_l1_table, 2),
@@ -3214,7 +3214,7 @@ void shadow_audit_tables(struct vcpu *v)
     HASH_CALLBACKS_CHECK(SHADOW_AUDIT & (SHADOW_AUDIT_ENTRIES |
                                          SHADOW_AUDIT_ENTRIES_FULL)
                          ? SHF_page_type_mask : 0);
-    hash_domain_foreach(v->domain, mask, callbacks, INVALID_MFN);
+    hash_foreach(v->domain, mask, callbacks, INVALID_MFN);
 }
 
 #ifdef CONFIG_PV


