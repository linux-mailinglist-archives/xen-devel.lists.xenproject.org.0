Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA61414C38
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 16:38:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192878.343594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT3Nk-0003qi-3u; Wed, 22 Sep 2021 14:37:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192878.343594; Wed, 22 Sep 2021 14:37:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT3Nk-0003np-0b; Wed, 22 Sep 2021 14:37:56 +0000
Received: by outflank-mailman (input) for mailman id 192878;
 Wed, 22 Sep 2021 14:37:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cZP0=OM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mT3Ni-0003nN-Lg
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 14:37:54 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6624fd67-275b-423e-b278-278fd68fde3a;
 Wed, 22 Sep 2021 14:37:53 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2056.outbound.protection.outlook.com [104.47.12.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-5-HiJxDSOZNc2ADWDudpIfFg-1;
 Wed, 22 Sep 2021 16:37:51 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7024.eurprd04.prod.outlook.com (2603:10a6:800:124::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Wed, 22 Sep
 2021 14:37:49 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.013; Wed, 22 Sep 2021
 14:37:49 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM3PR05CA0108.eurprd05.prod.outlook.com (2603:10a6:207:1::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Wed, 22 Sep 2021 14:37:49 +0000
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
X-Inumbo-ID: 6624fd67-275b-423e-b278-278fd68fde3a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632321472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J6zzTKAR8SOShvgrracy6yF82HzYmfEYILkFc9My6/I=;
	b=hEcNw9dxif5adIMTJ5Artx65HkYIYGNPKGpCktrd+Jrexk8BtwXMs61faakJA9wa3Gm6ED
	l1jnHyZ7eZuzy1umNAkvKfAki0uGz0YL0YKXH72xEVPJawuw7zLFb23k6MbLsJPlMG4X6J
	Ycu6NExkdiIu8h/Dt8GW3kNA6gDiaew=
X-MC-Unique: HiJxDSOZNc2ADWDudpIfFg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rm0mX7OpBYkhrujWIydQ9pQhVMCd0bQ6IYFoUvrIIvy3T+zX+yNmhntYkuxM6Qzg2SlCfLUdAy6XGkPbHmZVa1ggzFiCtRp2ZZkO/RIOTrQFKcXMqBCDaTdpc9ZTiQ2cWnh2LH6URP1kF942qawtLX3iq4ObEMI0D+SOMOpsmT0Wn2GiYsaKYHHtKKfIZyeRUz+QrlGdCfVvFGOQjhmdIVuW/eckpEY2gMAa7ybf5euvAz/jhcpBxpzyPdqfhEizyVW+tuZ0oZtb4cgYuva1pSGIui6coznSYqRGFHyz7tfm625oL6GfkTyw9cnSn2oijoRzP96EaLcGAk0hjCKY6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=J6zzTKAR8SOShvgrracy6yF82HzYmfEYILkFc9My6/I=;
 b=Mv1WVTtb+Lyn5safSIFGTcTMCh7KECT1ChcIpqsgIcWdxOfpYeNCs5IWi73Gi9hNmpqhVHTlBG+xOQsyuEbRyaP+lym6XZEVvAlRc+rjYdClq5w2F0TT0tIi8gHo4MXA4/B4UQGGONZKCr+pskFxGpcEwJG/0ykbd1KGK/hlIVVmpsVUgmmcFDqjqCSV59chcia85dKrMBAIc5u5vZibKqZHbnJ1zXVFalYcan9OuU+K4hF8wYLAl6GFecs4sM2ulVtjjmn3yzmJPTqi97SHM0zbYRnMH51yMDA6tWKxeofkhz1c5CJza1RmuE8AkLAPrtU9KtVXqvhK5PMOmmeAbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v8 4/6] AMD/IOMMU: respect AtsDisabled device flag
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <d249a759-188a-d689-316a-4743922827e5@suse.com>
Message-ID: <14d1c1e1-d2d0-d041-e206-608e876d43a0@suse.com>
Date: Wed, 22 Sep 2021 16:37:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <d249a759-188a-d689-316a-4743922827e5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR05CA0108.eurprd05.prod.outlook.com
 (2603:10a6:207:1::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27edfd07-73c3-4b02-7129-08d97dd68d34
X-MS-TrafficTypeDiagnostic: VI1PR04MB7024:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB702448BC2F93C012BD2AE554B3A29@VI1PR04MB7024.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dVysFPWQSZjjxAhHRCon4xmzgG/jsUxjqvQk28UpbmDuAQf3Sb2rE9JMlu94j4LooCGY2nbga7REy93SxRZwNMkAdL0dkjOplQrfCk5FRqg25QgYkKXwo7G5T6DnVhxTZDgBz5MCjmYHcvGbZtMol1Zt0cG1wPy177YbrM8zi8YyKBy/pd9EibY58IKulSDKuxliPHo9VcpDXuyn/bwRbgApBMx8Z8MtI/g8whoYQGTvfcwJd84av1+Q4MilmO0PJ+wjckWeG06x6mvg73AvB6bBSGVTnvwHzCx6KdMaUew06qUVl3YiHrQCNIbM59dpNKeqOx/QEEg3C8uVyOT3Xr2eK0KkJWsYLPMKhghnCYaYj/cPSOh8mTVKAYC0jNkZYJm48X6OTCOGb74S5hxzo8ugRZ8VL7gMZfeUmSduZ3Nd0XpoVix4/35tyojMEp2tzq0KoAL9x7SNWWgT9/fFUBuPpzXq6M2Ir+s//AFWXnCZpdD8Ea0x4U06A3H066ooLG0jRTHOUDYhpWaOHpW9P42T86wq38f3xyPJJrUvbz06qwPAyzGt3/7ncD5BpmwqszBTloIc6OYaHEu0JwSLangk3llf8fDY1jcqWgEMPqBn/fVFIBVhvSGcnXrCwPIJ5yA1ET6LtTYXPO4BtZVPoe/1c5+zEH8DJid8iswF7qEmfJOWDUrQF4TZRv7D1t/5S9ETWrvHXgmnD8QQH566pUQTuMXqU6WAiktvpHsfKws=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(8936002)(66556008)(16576012)(2616005)(316002)(6916009)(4326008)(66476007)(2906002)(508600001)(66946007)(86362001)(5660300002)(956004)(26005)(186003)(38100700002)(54906003)(31686004)(31696002)(8676002)(36756003)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T250cmViSm9iK2Vtb1BET080ZlMxWW4vMktFNjMyekNVL3NoT1luZXl4Umxk?=
 =?utf-8?B?NUpzMXpQbjhTSUs2NDdTUjd1SFVpd1NNR2dtSVg5Sm55dWV5MytLRnVnUGM1?=
 =?utf-8?B?Vk0rVlpxNDVVRjExcGVvbEt1czR3aysxNmJDYllEZGQ4aGxWKzdsMUxBT2lY?=
 =?utf-8?B?MGtWRTlZMkRmTW40elRmUEQ1c0dscDJzVmtHb2g0QjkrT1NEelMrL21wb2xJ?=
 =?utf-8?B?UU10SjlhUnNzbEloUjY5QTZKcUN4YmYxeXVnLzF2TE11WWlSRjdhWHhRVGVE?=
 =?utf-8?B?RmRjQnBTNjJMaU0ybzR1ZEJPeXJFaE5zbUl6SVBSck04SVc1V3Fzb0NqZVVH?=
 =?utf-8?B?ZDhYQVFod1J5azRpdVFMTnBOUzA3U0hUQ2p2VUVQL0t6VjZ1a0hQbHlMUjB3?=
 =?utf-8?B?RnNTd0ZYWERhNmR0Z2NUajVwenVsQTFrTHNReVVnbUhoZWtFdUlKcHpwUG1Y?=
 =?utf-8?B?TnhnK0doVVBjckdQOGpqYTRSajZBVVBHYjFiTmN2eU5PUEl1NHNLTytxV2VN?=
 =?utf-8?B?L1NBcEhmbFBoS2grK0FvMVNaaUVrM3M0Ni9KcHYvY3hjMVdmcHg5bzMyZWxW?=
 =?utf-8?B?Si9BdWJTUkl4dzRJbGw1S1hKSGM4VE92RkhuRWYxZmZWR2ZPcVFDVkpEMUgz?=
 =?utf-8?B?cFRTcVVqVVdRbVFJZldYUmc2RHJabnNQcER1MGZqbkhpN0dTYmdFMHRjOGR2?=
 =?utf-8?B?bjJaRElrV3p0Q1JLUmFEb2htU3F0U1lRQlZ6eHdMS2U4WlJvTyt4UnRPWnZZ?=
 =?utf-8?B?NWROUEQyTXJWVEtEK05xSkdxdU1RQXhmU3JWd21mZFRaNnhrdWFiaVZXQm1O?=
 =?utf-8?B?dEhWUWpQcnBrTW0yUXFISjlGZXlQaExzZGRhRFdQUWJianNkU3dMUUs3NTFO?=
 =?utf-8?B?UFpPTkFLbmlqTmNnVUh1MWg1UUlTdE1NcFhQQXVFVnBxK0xDUUE0TnVMcmxW?=
 =?utf-8?B?Q1g4NWdFZzBENkNCTlFyWnFUalYzSjRDejNnTm1EbHYrYW12WjQ1VURlNGNU?=
 =?utf-8?B?UG9kQ2V6TlB2YXdNSkEyaG1LUnVqSXR6blNBRFNkZmRxS2ZJR3VoWHd6VUx1?=
 =?utf-8?B?bkxraDFYR24yV2x0TDZFT1llSXJ0REhidDlIdzNWOW85U0xSckRsd0xOcHdB?=
 =?utf-8?B?TWtnWUt0ZXFwVnVhQVorbkFRZXVyVkl1aUgwS3diSmJYcTV0dmJEZnp2Nko4?=
 =?utf-8?B?N3JvUlNxZ2ZPeEI4SlhpS0JLdElkcG1oUkh6SDhFd0lPRTBENHF1Vk1wb3dv?=
 =?utf-8?B?dTFaSjJLZTRTRXJKYzNtM0k5MldVdGpKTnE2ME9GRUphRjFNdWhuYlBkZStk?=
 =?utf-8?B?aDVyWVZaelZ5TWg3VzFXbmw1OGdyNXgyYThNSUVRU3I2WHpZb09nSFVIVndQ?=
 =?utf-8?B?V1Njd2M3SlpZelVnRWpTbVNKT3Y1alhYWGpVNkRScGlQbVJRa2tPbWtyN0hZ?=
 =?utf-8?B?a1ZxRnFuTHN6UXJxZ0RBRUsyWDZobnNKS3d0a0svM3U2WllvQkZLc2NFQUNr?=
 =?utf-8?B?WGs2OGZyNGFoaWVHK0QwM0dNQkV5Q25HQzJhUmNEc2JlVmVKVGpzbVNQZkZB?=
 =?utf-8?B?NGE5WlMraVZ4ZkVHeUZHWCt1ZmRHOGFKTmR3R2pnbmp1bEZmUDhBM1Mwd2p1?=
 =?utf-8?B?dG43MDdRUUZ3czlDYkJOZ0QyYVV4TUFlSVpaRy9GS0RPamFEakYyTlYxN1Zo?=
 =?utf-8?B?RmI5TG5FQzNIWkUyazdkSDRGNTVZUFhjY0xON2w4YTJYTEhXbDBLbzZaWlNL?=
 =?utf-8?Q?/BYGJBGBCi8t/GgEF/pxZf0dU9h8z4/0VAziSif?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27edfd07-73c3-4b02-7129-08d97dd68d34
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 14:37:49.5913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d2fvotjU3HAu+neEK54noldsR/hVwwaZxWxqYqL0PFcoCE4nMS7n6UZFiWxiYLe9jpBqlRrC+Sz3l/5M8QjQTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7024

IVHD entries may specify that ATS is to be blocked for a device or range
of devices. Honor firmware telling us so.

While adding respective checks I noticed that the 2nd conditional in
amd_iommu_setup_domain_device() failed to check the IOMMU's capability.
Add the missing part of the condition there, as no good can come from
enabling ATS on a device when the IOMMU is not capable of dealing with
ATS requests.

For actually using ACPI_IVHD_ATS_DISABLED, make its expansion no longer
exhibit UB.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
TBD: As an alternative to adding the missing IOMMU capability check, we
     may want to consider simply using dte->i in the 2nd conditional in
     amd_iommu_setup_domain_device().
Note that while ATS enabling/disabling gets invoked without any locks
held, the two functions should not be possible to race with one another
for any individual device (or else we'd be in trouble already, as ATS
might then get re-enabled immediately after it was disabled, with the
DTE out of sync with this setting).
---
v7: New.

--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -120,6 +120,7 @@ struct ivrs_mappings {
     uint16_t dte_requestor_id;
     bool valid:1;
     bool dte_allow_exclusion:1;
+    bool block_ats:1;
 
     /* ivhd device data settings */
     uint8_t device_flags;
--- a/xen/drivers/passthrough/amd/iommu_acpi.c
+++ b/xen/drivers/passthrough/amd/iommu_acpi.c
@@ -55,8 +55,8 @@ union acpi_ivhd_device {
 };
 
 static void __init add_ivrs_mapping_entry(
-    uint16_t bdf, uint16_t alias_id, uint8_t flags, bool alloc_irt,
-    struct amd_iommu *iommu)
+    uint16_t bdf, uint16_t alias_id, uint8_t flags, unsigned int ext_flags,
+    bool alloc_irt, struct amd_iommu *iommu)
 {
     struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(iommu->seg);
 
@@ -66,6 +66,7 @@ static void __init add_ivrs_mapping_entr
     ivrs_mappings[bdf].dte_requestor_id = alias_id;
 
     /* override flags for range of devices */
+    ivrs_mappings[bdf].block_ats = ext_flags & ACPI_IVHD_ATS_DISABLED;
     ivrs_mappings[bdf].device_flags = flags;
 
     /* Don't map an IOMMU by itself. */
@@ -499,7 +500,7 @@ static u16 __init parse_ivhd_device_sele
         return 0;
     }
 
-    add_ivrs_mapping_entry(bdf, bdf, select->header.data_setting, false,
+    add_ivrs_mapping_entry(bdf, bdf, select->header.data_setting, 0, false,
                            iommu);
 
     return sizeof(*select);
@@ -545,7 +546,7 @@ static u16 __init parse_ivhd_device_rang
     AMD_IOMMU_DEBUG(" Dev_Id Range: %#x -> %#x\n", first_bdf, last_bdf);
 
     for ( bdf = first_bdf; bdf <= last_bdf; bdf++ )
-        add_ivrs_mapping_entry(bdf, bdf, range->start.header.data_setting,
+        add_ivrs_mapping_entry(bdf, bdf, range->start.header.data_setting, 0,
                                false, iommu);
 
     return dev_length;
@@ -580,7 +581,7 @@ static u16 __init parse_ivhd_device_alia
 
     AMD_IOMMU_DEBUG(" Dev_Id Alias: %#x\n", alias_id);
 
-    add_ivrs_mapping_entry(bdf, alias_id, alias->header.data_setting, true,
+    add_ivrs_mapping_entry(bdf, alias_id, alias->header.data_setting, 0, true,
                            iommu);
 
     return dev_length;
@@ -636,7 +637,7 @@ static u16 __init parse_ivhd_device_alia
 
     for ( bdf = first_bdf; bdf <= last_bdf; bdf++ )
         add_ivrs_mapping_entry(bdf, alias_id, range->alias.header.data_setting,
-                               true, iommu);
+                               0, true, iommu);
 
     return dev_length;
 }
@@ -661,7 +662,8 @@ static u16 __init parse_ivhd_device_exte
         return 0;
     }
 
-    add_ivrs_mapping_entry(bdf, bdf, ext->header.data_setting, false, iommu);
+    add_ivrs_mapping_entry(bdf, bdf, ext->header.data_setting,
+                           ext->extended_data, false, iommu);
 
     return dev_length;
 }
@@ -708,7 +710,7 @@ static u16 __init parse_ivhd_device_exte
 
     for ( bdf = first_bdf; bdf <= last_bdf; bdf++ )
         add_ivrs_mapping_entry(bdf, bdf, range->extended.header.data_setting,
-                               false, iommu);
+                               range->extended.extended_data, false, iommu);
 
     return dev_length;
 }
@@ -800,7 +802,7 @@ static u16 __init parse_ivhd_device_spec
 
     AMD_IOMMU_DEBUG("IVHD Special: %pp variety %#x handle %#x\n",
                     &PCI_SBDF2(seg, bdf), special->variety, special->handle);
-    add_ivrs_mapping_entry(bdf, bdf, special->header.data_setting, true,
+    add_ivrs_mapping_entry(bdf, bdf, special->header.data_setting, 0, true,
                            iommu);
 
     switch ( special->variety )
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -105,6 +105,7 @@ static int __must_check amd_iommu_setup_
     int req_id, valid = 1, rc;
     u8 bus = pdev->bus;
     struct domain_iommu *hd = dom_iommu(domain);
+    const struct ivrs_mappings *ivrs_dev;
 
     if ( QUARANTINE_SKIP(domain) )
         return 0;
@@ -122,20 +123,18 @@ static int __must_check amd_iommu_setup_
     req_id = get_dma_requestor_id(iommu->seg, PCI_BDF2(bus, devfn));
     table = iommu->dev_table.buffer;
     dte = &table[req_id];
+    ivrs_dev = &get_ivrs_mappings(iommu->seg)[req_id];
 
     spin_lock_irqsave(&iommu->lock, flags);
 
     if ( !dte->v || !dte->tv )
     {
-        const struct ivrs_mappings *ivrs_dev;
-
         /* bind DTE to domain page-tables */
         amd_iommu_set_root_page_table(
             dte, page_to_maddr(hd->arch.amd.root_table),
             domain->domain_id, hd->arch.amd.paging_mode, valid);
 
         /* Undo what amd_iommu_disable_domain_device() may have done. */
-        ivrs_dev = &get_ivrs_mappings(iommu->seg)[req_id];
         if ( dte->it_root )
         {
             dte->int_ctl = IOMMU_DEV_TABLE_INT_CONTROL_TRANSLATED;
@@ -146,6 +145,7 @@ static int __must_check amd_iommu_setup_
         dte->sys_mgt = MASK_EXTR(ivrs_dev->device_flags, ACPI_IVHD_SYSTEM_MGMT);
 
         if ( pci_ats_device(iommu->seg, bus, pdev->devfn) &&
+             !ivrs_dev->block_ats &&
              iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) )
             dte->i = ats_enabled;
 
@@ -166,6 +166,8 @@ static int __must_check amd_iommu_setup_
     ASSERT(pcidevs_locked());
 
     if ( pci_ats_device(iommu->seg, bus, pdev->devfn) &&
+         !ivrs_dev->block_ats &&
+         iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) &&
          !pci_ats_enabled(iommu->seg, bus, pdev->devfn) )
     {
         if ( devfn == pdev->devfn )
--- a/xen/include/acpi/actbl2.h
+++ b/xen/include/acpi/actbl2.h
@@ -851,7 +851,7 @@ struct acpi_ivrs_device8b {
 
 /* Values for extended_data above */
 
-#define ACPI_IVHD_ATS_DISABLED      (1<<31)
+#define ACPI_IVHD_ATS_DISABLED      (1u << 31)
 
 /* Type 72: 8-byte device entry */
 


