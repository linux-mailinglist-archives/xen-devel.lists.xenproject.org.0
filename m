Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 809D55448C3
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 12:25:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.344948.570594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzFM1-0007q8-0A; Thu, 09 Jun 2022 10:25:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 344948.570594; Thu, 09 Jun 2022 10:25:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzFM0-0007o1-Sa; Thu, 09 Jun 2022 10:25:28 +0000
Received: by outflank-mailman (input) for mailman id 344948;
 Thu, 09 Jun 2022 10:25:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jWvP=WQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1nzFEF-0000Tp-NL
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 10:17:27 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062a.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c263a2f-e7dd-11ec-b605-df0040e90b76;
 Thu, 09 Jun 2022 12:17:26 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB6297.eurprd04.prod.outlook.com (2603:10a6:10:cd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Thu, 9 Jun
 2022 10:17:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 10:17:25 +0000
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
X-Inumbo-ID: 5c263a2f-e7dd-11ec-b605-df0040e90b76
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e7rHyLtlrpWi5R0XdyzjaEKcOE7LTFYo+BWVNTEciVbNS5hjkWdVxWfmbfCZ+VDfVZ/AISGuXbDP/Z+rdPcWEWAR19TMtH6v/svZ/gecHsnH3/B+j4Ej8eISkL1S7sr44ZsDVYdB+3pV/ZCaoJYPwoCIHFRJFUPK7CawlrgkoE+lwcJ9Kqj31hd+33jRkcIxOQ+jTTVfcsgPuwPVb02F4nuRgcXnejTj7910VWRqNROzFcjqrZrOcMH59s6ZtWByr0dcXDyojJ7JrqHMkCVBCt17hFwHANFoEeAggN9JFXDw30G4kbP7iCoofyTZuyEQLG3pNFzQfLqPgGIiHTnZlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g2qWJv01a2c4+rYUCaFJsVUw5bwP3FyDZ7zpU5yOzbI=;
 b=jHl1LIl4L1BbsWyarVD2X7Od4GSoygFZZHEzJvBwdW1boDqVmjEwpV+j2axBvUcd8/xD2nm8t1uavUJ7LyQuGiKCGOwLjC/uK9C25FMeQK5MjGcrRUn+mn7XQZRKwE1yFoIBJ4twYxQmdxyS/wCBazQP1N0rCwF3R3GUITNWPHj+Xa0u+jHUaxYVlzc4xMim3FwYcNltEV8n0c0ccpTEJveC7MG8trjglMX8vwF1T9NttuUZGg2WerqCL1bAkPzEt5VkPL0T3PGchLPh+b5RF5nhh/iBEC6VUwT0f6bxIBzAVeCYDy1y0IDGPNDu+nDUw4jCuVFQUnKXPWex2VL9cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2qWJv01a2c4+rYUCaFJsVUw5bwP3FyDZ7zpU5yOzbI=;
 b=rsxK6MCO8GU9dgOs7R/kYyqbOaImxEuTQ5B2Kvd63TNjSrQmObEh5axSxE7RmePJygjT7hei+v/0YLjR4eQ0rILfZvsrYAY5oebEVBcvyfLEdqB8n6ZnxcipYUHkcN4cGwWluk9CgDSmTNSnsYixd+pUGkW5LlPfLLAKTqDGQ+HHUeemK6+fwlvxZkvmD2N2IMdqGT104AhOrSBqs4HPo4j1fgntW1Ke07Asm8scNQ3qQvgvc3qX83WvGWEyAch8h1iwbffNRUctO2vpB3gHSc4z21V/HCrYLxSlfddrleWvzWq5CbYgY0XM5n1bFPAubAVWJP9kLNaXeyNoGtiNdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <99086452-43a8-2d93-ab4d-0343a0259259@suse.com>
Date: Thu, 9 Jun 2022 12:17:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: [PATCH v6 02/12] IOMMU/x86: new command line option to suppress use
 of superpage mappings
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Kevin Tian <kevin.tian@intel.com>
References: <e873e30c-7a04-a8a3-2fe5-0dda30e654fe@suse.com>
In-Reply-To: <e873e30c-7a04-a8a3-2fe5-0dda30e654fe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR0202CA0061.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::38) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b7d5f78-bdeb-4b7e-a227-08da4a013fb2
X-MS-TrafficTypeDiagnostic: DBBPR04MB6297:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB6297FB1B3BAD6C11DBFD2C1FB3A79@DBBPR04MB6297.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oEmrcC25lCjyViFTbCFB7piXd1+8puPHZ73LujkTIM6HrlMlBqJvi0FNwFoixdQWqBxatpejFSNUnzM3gXr83oUo1jUXG8e9mvvX3dX2+YwyibN+8zPcoYc0BxFer2n1AKO1rNYC9+Kecpe54T2NNsfoDAN8p1ifrNRpxxQ4qEHUzC4o2e2Hzw0rjxMV1CK+BycksacoBi9KoXv4SahomNSL0k2iIDTSIpwrwInmf3nswRp7pzaBshA79HDVr7n4Y9L+7Q9U4h9xq8d3R5bs6ymOhzsYYLbT4O1x/KlPh1LWBwi9VMGRLIjs8L3HrV96kq4MakmwTTppTjyQm16dMj7RyVvbsJXA0jqt1v9ikKegAZYDHBxmQdaUA2ycn62zwo5v2i72ICYyYzYiKYvraJSQInWO1TVxJfptKi6wtaRYJKOqViZAed1aoPX9L07t81eJbx/dBif4Vwqz0LgLvgkspUbKGRxQQpu1pdNaA/IddTvKWJa6CUgAgV8+7kPW9dYa5haXeVsoVS+AfJsD4q6sKFdzfo1LI+uVZE88D3ZWHbfdrntrUoyr0VkbUYvJxPX1rt+w9F0ZoS35/dtdgh49maAmVGnXp8ErFMyDYpsRZWenpH02L3NSJZRoZWdyT7Jr+AM0KWey+uE1w0BYTrt5t7FKrKI4aAE1KDkXDumCqpeP9oQY81qfeBVGbGxU61orYChIGO1I4Oebq1FN63PMaTIJEfNdhcAMgQSDVDjbNknHMP038EeK+iDL3bAj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(36756003)(83380400001)(31696002)(26005)(31686004)(6512007)(6506007)(2906002)(4326008)(54906003)(8936002)(5660300002)(316002)(6486002)(6916009)(38100700002)(508600001)(86362001)(186003)(66556008)(66476007)(8676002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0JjeWMyN0V2UTBWZWowVXN1Z1NxOTFmdURFc2g2UnFITzl5b1M4Rnc3Vk1k?=
 =?utf-8?B?b21JUHRvYVBRay9BdVg4KzVxMkdkbjdGanAxTjZBWlk0NmExdnBLUk9zRU1x?=
 =?utf-8?B?UmhPcFU3clo1M1RrTjM3MmxoMm93YVIrV1JLaXlLOC9pc3kzb3M5d3VIRTVz?=
 =?utf-8?B?NDU0ZnNxMDd6dWN3NnBHUUZLamhNL1RpemdRRHY4VkQzVmpTa1o2OC9HVzFs?=
 =?utf-8?B?VUNnejd6MHMrZ1NxaUo0VXR1cVJRM1kwQ0dZSEp3UXN1VUd1b3JDNlFYTDVU?=
 =?utf-8?B?ZXQyWTVNaWNnV2RETmdXK3BaS3JMd3RJem5qSjJacTNxM3dZL3ZqakZaVjVt?=
 =?utf-8?B?SW5YN05abEc4TitsZGd5SUhMVmpTUHVnQS9QU2RQNTdTeENZemtZcHhKeGlR?=
 =?utf-8?B?OVpqYzZUMGY4SlEvTDUvUzJTNkJvMytHRytKc1MvcE1SVmpzNmdSc0lBWDht?=
 =?utf-8?B?ZVZTM08rSkI2SUxLL3lGY0o4K0Z1dGNjWmNtSmFXVDJOVjZMSW4zWUVjb0Iz?=
 =?utf-8?B?WTFLV1laeDMvcEZmVEgxbis2K0E4Zk40azNOaTZ6RHZKVjdJMDhlNzEvRWxu?=
 =?utf-8?B?enRGWlhJODJSU2xlUi9tWXpQYkFjN1NiY21aQkpNVEpFaTBBNFBXcktxdlZE?=
 =?utf-8?B?V0dISDhmZ1pXM0hiQ0gxU3VqdTBkbTNvNmxGVlZ6N0JUYkRVMkU3T1FsMzFt?=
 =?utf-8?B?WGowR1JMZUxYYnZUd3NIb0orRnpTeS9jbTdGV0NqaElNd3dUa3Vad0pjckI2?=
 =?utf-8?B?SnJWS09idjdCOGtqTWF6NVJLazJ6TS9ZRVFkdEo1akdRMHpidHRyL093K3lh?=
 =?utf-8?B?elBiUkF4TVY2bWQ1VGxUS0xaNEhEM3RsSmJlNzM1bFIydVBrZzZGaHRKNEkx?=
 =?utf-8?B?bEYwUElGbERSN2RSWXcvdEw1NEpGcFMzRFdNS0h1dXZraW1qY05ILy9GQ0h1?=
 =?utf-8?B?TmtvWkhDVXQ1anZtMjJlMU12WXFjbzhrZmdIMUF3MzNmM3JNZnlhRmE1TmlS?=
 =?utf-8?B?RUtyeXcvWDlNODgxVk1aZHJsOVVsT2Y1RjlFVEZaWkpGU3pCNkJ0Yi9QNGRk?=
 =?utf-8?B?TE1qdEl6eFRUMU1oQXZFYlhaNDRocnpRMGdhRUVBZjAvZ2VpLy82MXJzaVFn?=
 =?utf-8?B?Ujh1UnlBK2tXa2w2MFBWQzBKaXh2cm0waGV5NTZsMWZobmJsR0NxR1k5SGRt?=
 =?utf-8?B?QmYzanJJRGNXOE5ka2JDTUE4NFRGb2E3SVJtMm5kbmNsL2k5d3prR1d6bXNh?=
 =?utf-8?B?WGdyRVlNd1dLcFpid2lHdTJOWnRvUmVnMmRsOTJsNnQ4SW5XLy9kT2N2SWZB?=
 =?utf-8?B?OGJSMlpHTklYS0ZvWGpibTdIWUJGS2IwS3VoalZsYVZXdmtBcG9oZCtSTUlS?=
 =?utf-8?B?clBEYk40akF2Y1FWdXNjZzJKbks1NTNjKzZ4YlAvZTJ5WGpva0dxYUF4ZTg0?=
 =?utf-8?B?NVovbm9qditRb1Bjbjh5MEk1bDFacHhROVFSUnlxK3V1QjdwOTYwUFlqQkFC?=
 =?utf-8?B?TkwzcjdjMHVQang4alJ0WkdQRnlhejBSN0F4bCtOU3RXRWZINitpZnFjWUVW?=
 =?utf-8?B?dDFKZXp4cHRXSHhKRG0yam82Q1p0REdLeUZsSUREckFndFh2cjJWQmdLSTY1?=
 =?utf-8?B?aWNZYVpQazdKd1NucHNiSjl0YXBMTkFjSVhuOVlOV3RudGNDOGE5bmlSSHlz?=
 =?utf-8?B?cmF2SXp4N2g3RGlmTjBNZUFzQXBVYXpvbUZaaUJYWVFlVTlNbVdtYVpXRHBG?=
 =?utf-8?B?RzBVWkkwTFJGZmdCYXFLWE91bGthV2ZZS1I1WXpxL3BZTjhrbGF5Rk1rZk1i?=
 =?utf-8?B?N1A1K0Nla1RhME1IQVg5Zzc3THBxWjVpOXYwKzZXTVQ3QjdOdVZ5N3phc2J4?=
 =?utf-8?B?NFdBVWdlNjJENk94SzF5dXREVzdneDFRRHltME03Qy96QjBwc25SSlBmUGJL?=
 =?utf-8?B?dC9oRnNMV0p4elJEMkFDelZTTWxYUHhKYTJuNHJxWmZRdCtzK05wSlJiL2pW?=
 =?utf-8?B?RmtIYTFJdDdwWHNZZDZJQVYrT3piblpGelV2WUFLcTI4ZXBZMjVyYTBwWHZ6?=
 =?utf-8?B?Z1FWdExjUlVjU3lIUyswU09RaVVZVFNSMDhhbUhoeFlqVjhsd1RBdEwzKy9O?=
 =?utf-8?B?bFIzWFlYUUpFR3BMdER1Qmk5SDIvZENrdnRTY3NNVU04Q2xhQjQ4NHBDNk1v?=
 =?utf-8?B?N1hqdk45dEM3blVWZ3RUVGhOblhpWVVIYnpYSmpHcWpubEUvYk9wTW5XejJ5?=
 =?utf-8?B?VDVSb0pkNjdXNkgvTVRZdVNPSmdTaGt5djh6TEhvMEdUVW1VQTBQODJ5c0pO?=
 =?utf-8?B?MEliM05RU1B0d1I3c0RFQ084MzN4dG9Ca2dsMG1FQ2R5bXVkQ3JKZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b7d5f78-bdeb-4b7e-a227-08da4a013fb2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 10:17:25.1846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yz2dJUtuY39TSqr5sOyPWELuQHHZQ3pI5v2/1N5qV1Nz/GupZVBZR/om0UjH+QDRvwKU5CqpbDaWJ5SaBuN0KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6297

Before actually enabling their use, provide a means to suppress it in
case of problems. Note that using the option can also affect the sharing
of page tables in the VT-d / EPT combination: If EPT would use large
page mappings but the option is in effect, page table sharing would be
suppressed (to properly fulfill the admin request).

Requested-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v6: New.

--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1405,7 +1405,7 @@ detection of systems known to misbehave
 
 ### iommu
     = List of [ <bool>, verbose, debug, force, required, quarantine[=scratch-page],
-                sharept, intremap, intpost, crash-disable,
+                sharept, superpages, intremap, intpost, crash-disable,
                 snoop, qinval, igfx, amd-iommu-perdev-intremap,
                 dom0-{passthrough,strict} ]
 
@@ -1481,6 +1481,12 @@ boolean (e.g. `iommu=no`) can override t
 
     This option is ignored on ARM, and the pagetables are always shared.
 
+*   The `superpages` boolean controls whether superpage mappings may be used
+    in IOMMU page tables.  If using this option is necessary to fix an issue,
+    please report a bug.
+
+    This option is only valid on x86.
+
 *   The `intremap` boolean controls the Interrupt Remapping sub-feature, and
     is active by default on compatible hardware.  On x86 systems, the first
     generation of IOMMUs only supported DMA remapping, and Interrupt Remapping
--- a/xen/arch/x86/include/asm/iommu.h
+++ b/xen/arch/x86/include/asm/iommu.h
@@ -132,7 +132,7 @@ extern bool untrusted_msi;
 int pi_update_irte(const struct pi_desc *pi_desc, const struct pirq *pirq,
                    const uint8_t gvec);
 
-extern bool iommu_non_coherent;
+extern bool iommu_non_coherent, iommu_superpages;
 
 static inline void iommu_sync_cache(const void *addr, unsigned int size)
 {
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -88,6 +88,8 @@ static int __init cf_check parse_iommu_p
             iommu_igfx = val;
         else if ( (val = parse_boolean("qinval", s, ss)) >= 0 )
             iommu_qinval = val;
+        else if ( (val = parse_boolean("superpages", s, ss)) >= 0 )
+            iommu_superpages = val;
 #endif
         else if ( (val = parse_boolean("verbose", s, ss)) >= 0 )
             iommu_verbose = val;
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -2213,7 +2213,8 @@ static bool __init vtd_ept_page_compatib
     if ( rdmsr_safe(MSR_IA32_VMX_EPT_VPID_CAP, ept_cap) != 0 ) 
         return false;
 
-    return (ept_has_2mb(ept_cap) && opt_hap_2mb) <= cap_sps_2mb(vtd_cap) &&
+    return iommu_superpages &&
+           (ept_has_2mb(ept_cap) && opt_hap_2mb) <= cap_sps_2mb(vtd_cap) &&
            (ept_has_1gb(ept_cap) && opt_hap_1gb) <= cap_sps_1gb(vtd_cap);
 }
 
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -31,6 +31,7 @@
 const struct iommu_init_ops *__initdata iommu_init_ops;
 struct iommu_ops __ro_after_init iommu_ops;
 bool __read_mostly iommu_non_coherent;
+bool __initdata iommu_superpages = true;
 
 enum iommu_intremap __read_mostly iommu_intremap = iommu_intremap_full;
 
@@ -104,8 +105,13 @@ int __init iommu_hardware_setup(void)
         mask_IO_APIC_setup(ioapic_entries);
     }
 
+    if ( !iommu_superpages )
+        iommu_ops.page_sizes &= PAGE_SIZE_4K;
+
     rc = iommu_init_ops->setup();
 
+    ASSERT(iommu_superpages || iommu_ops.page_sizes == PAGE_SIZE_4K);
+
     if ( ioapic_entries )
     {
         restore_IO_APIC_setup(ioapic_entries, rc);


