Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A38D93F831A
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 09:26:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172744.315224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJ9mO-00037Q-M0; Thu, 26 Aug 2021 07:26:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172744.315224; Thu, 26 Aug 2021 07:26:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJ9mO-00035G-I6; Thu, 26 Aug 2021 07:26:28 +0000
Received: by outflank-mailman (input) for mailman id 172744;
 Thu, 26 Aug 2021 07:26:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HXzX=NR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJ9mM-00034u-PT
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 07:26:26 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eb64cb52-063e-11ec-a9d2-12813bfff9fa;
 Thu, 26 Aug 2021 07:26:25 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2055.outbound.protection.outlook.com [104.47.9.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-0P5mbWwxObeMj1qUTn_XCg-1; Thu, 26 Aug 2021 09:26:23 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3118.eurprd04.prod.outlook.com (2603:10a6:802:a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Thu, 26 Aug
 2021 07:26:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Thu, 26 Aug 2021
 07:26:22 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0169.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1c::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.20 via Frontend Transport; Thu, 26 Aug 2021 07:26:22 +0000
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
X-Inumbo-ID: eb64cb52-063e-11ec-a9d2-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629962784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R/goTfdL/PnsbevthFatCZoj5EcMqD86D+FWqPE8dDw=;
	b=PSHXpg5AwBL8sJhYy6AZXUg+gpwlLpJmMcJ1ERqT6spMX4WbgXgRopCIN9lyDTx/GLRghI
	ZZ8MtcqNRKFI7VE2+oDeqwKw8PzjCx/nqMb2LEHpYqUTzPRPb26VF1kGECydvnLBO1L+pN
	Ag0hPnlzgUNymOULOVmnc+X775nVSvQ=
X-MC-Unique: 0P5mbWwxObeMj1qUTn_XCg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=beRlLcbUnmYBT6jI4YMYPP+lNq0kFlP+nYpDF2f89Qh4y8kjGptKpQrQcdeY4ai6I/f5GNTz6LsFW6sqOlCI6o/HV4O3W+okj/+3Tr6cXT1yc6JY0jnywEoRO59RnRY8SotMsb6wVh8zdrdyZDChBZuiPYcxxBBm4yzqZEGpPo0SfGTtlv+6WreEA1nO9WxZTc/m8Pww5L3+qXMo38MqZ0eFaXXBSp2zSBHmmw/sDNGJ2sFD8Cwik29zTfHLE+vBbLZbCnEc+YZ7v/aETCrfcmz1tCuSqNVo3UtbyIkuYl9uOPC4akhi7Zj2T9apyoIu3w62vuoc3j+trYTU5YAuaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R/goTfdL/PnsbevthFatCZoj5EcMqD86D+FWqPE8dDw=;
 b=cVb4rPMaKnR7WMywKYzQqgyiuY5od/9wx7CGFB+iYG0WPNaJGmBslNlUOZNITfZel9YoWkIuvUKKOENhnM8YaZjZLOi2GlTo5KH+85uLWt622NoP6DPbX5cfYVokwDZP5P1/rj31GbujF/la1HNafeD9K2rbRQUNgNkllQHfas7gSIGrR0kLu0c3LMU9zUolO9xbRY0lpMf8r3kM9oYKO7/Fc2+vnSgVIImFtpMcMVj3f9RJqdlBpdXXF2tC39b3KshPrKERZ6pAfEA/ATakbYb0LUjrHMGyOas/uD4f0TnefACL5i/3DoaAwyGyfNJcmes2DkSDsIQl3BwKgODclA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v7 8/8] AMD/IOMMU: respect AtsDisabled device flag
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <bf4b3be9-1274-9750-7340-08b29dcecfd3@suse.com>
Message-ID: <6807e3ab-375c-884c-db01-0c25f76b8f02@suse.com>
Date: Thu, 26 Aug 2021 09:26:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <bf4b3be9-1274-9750-7340-08b29dcecfd3@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0169.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63ba91d2-cd07-41f2-942b-08d96862ce27
X-MS-TrafficTypeDiagnostic: VI1PR04MB3118:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB31181F8C3410DD1F58742F17B3C79@VI1PR04MB3118.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qqKcYTtTq4F9UAfJw5zxa+rwK9/sQ8FONK+wSjPN6aFbWXJ0sks5M6JpKi7tWJqaV97PzgSoxu+JycL02lpiflXqHDVT3MxutkbiEczQZ+p4v6oOF1eGl1S2EEzGh5K/SEd1fzjhD3+QyfZneIO5q6AU43Ez6MPjyteFb8Gr0A6hTtYSiEQa4N1ZRpJqLQva+zqlI41ZMAPsgmVp7b3I7iMCrSWziy5rIR8qGAbU+VjrVTSWZPq/j2NiPw1EzienNXjaLerz240brAmx5MpA5GHpgQ9OrYzLihFqtF4WzWRwVC6fT8xJje9rNWI3rX9qtaUlc9EsfrBXMmqED1R+COJF9F0vAm9CltNBkkYGc3Gwo0UTrMseH0DAsySiDqO89XLeK1C5rvIkG80rKeQup4b/zgo9F7ZuXaA5awqhA4NEe1AQ2mgjWJgRb1RW2c+VJcg8VSfu3KvZ4Usj1FxN6jHi+iRZdQms9D9nb8u+bpvvc9OX5YOFtVtRgJjls38NVw5jEE/ef3OTcVSKM2lVb6E/TMzdRLHYAEAduoS5fnkW9jTZnyCzG9dcEh8CGwmJQEWcxL7HfGYkT4hP/Km1+k6NQysx20HZ/bRV0ufhudqKSj1I5et4Xbbm+rvcF53pErhehfyurf0aN0cpgjFAKjJtpPovT3jvoXL5QCZOsYiNpe1flQyYP8Gmtr4MEHn2Y8put83D0TWxF1rJHJC3GPfMWtkYCEyeHr1UDKtB/ig=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(8936002)(66556008)(31686004)(66476007)(956004)(2616005)(2906002)(8676002)(66946007)(38100700002)(498600001)(5660300002)(36756003)(54906003)(16576012)(31696002)(26005)(83380400001)(4326008)(6916009)(186003)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wk5XZzNnQW9CMzJPOUVlM2xPaHlNSEh0Z2YyejRoV09adDRzeUUrRTZJZ0dq?=
 =?utf-8?B?b2lxQmQxaFIzVEY5Nk00KzhkcGQzSzRRS0Iya1FOdlB5SS9mVUJOUVhyc0V6?=
 =?utf-8?B?ZlUzN1FRQWhXV2daSHB0a2J6MVg5cTl4M1lTa2lHMmZLaWZPbEoyemxpMXhV?=
 =?utf-8?B?MWV0a3BPejMxMDY0ZkU0dWZpeGVTenlENUxlMVM4SXhIOHQxYXBqTmN2WVFC?=
 =?utf-8?B?TWszU1d1S2NYSXlyeVBNOGliVkRwN2ZvV1U5anpjMlFiN3J1N3JQV3dBc0Nk?=
 =?utf-8?B?dXkrZ0g0ODY4a3A5ZEtpcU9YVDVBVll2aCtHRXA0eWtYQzh4cFAwUXljUVJD?=
 =?utf-8?B?Y01mN0czV3lTcTlwSU1OL2xGM1kyd0dHQUFJRWIxdnpJT20rUkhkeFZTcVk4?=
 =?utf-8?B?RncyQ3MrNE0ycHI0cENMenlFd1ZlQithZlZHUHpwOFNPajRZUDRSc2c5RDVC?=
 =?utf-8?B?dUNzeVlic2wwcUlQQmlVV0RnQTI5cVpGMUFYdWVoeEVDd2ljbFFSS0lML1M3?=
 =?utf-8?B?SEhBT29RTFJKZjMwZWxGUjk5czc5WU5NVHdYNW1XNVVWc1VzWldVMU9DM0Jw?=
 =?utf-8?B?NEFwRmdnc0U1NkpXNnVsR3pMRFRncHJ4ZUMvVjVDUHZ4TWRwejloVmJQVENK?=
 =?utf-8?B?R29aY2dKZnQvZXE0NWxXWVZEc2JEb1QwWmY4SzBLaHRZUjBPUERWNTc3MUlD?=
 =?utf-8?B?Ymg3c01sT2k1dlE3d2lNY28zVGo5eVpFWjF2bHhVcUl3RWoyN1Y3Qk5WMlNz?=
 =?utf-8?B?ZTROVUg1QjJ1UG1HTkZ3MGZtYU1TVEdyNk5reURyUzZDRW1sRU1pK2JjT1Nw?=
 =?utf-8?B?dmI2ZnFIcGN5endiOWg5N3VkcFlzK3dLTjhmR0ZYWmMxUTEwM1JjV2p0TkZz?=
 =?utf-8?B?TTJ3aHp3TVIwSzRiUStBOXlyeUgxR2VXSlYzSE5mUGpveUJkdElSRFB2S2p5?=
 =?utf-8?B?dnY5UmhDdmxKSHdnbXh5dGRwZFR1dkc2ZS9Wd0NpdzR0dzFWdXArVmVteE1C?=
 =?utf-8?B?V0V3YlJEYWRaMnh5SWR0Ym9mVFgra2FPK1NDdmdYUjVCTTZva0xUT1dsR1Vy?=
 =?utf-8?B?Q0NpTldreURrb0xPb2E5eFJMTGVnWHRJbkZUaVNscDJldjFxcWdORjVILzhN?=
 =?utf-8?B?WURuRVRSK1A5QStVT1hDeFNSeFFMcC9pNXdueWhkSEVxQzVkN0RHbUwvZmZN?=
 =?utf-8?B?WS9yVzZDak5BWEM1TkVHKzlYNTRvd21xUXAxdFpObElWZEpiS2JZcDRJZ0ox?=
 =?utf-8?B?YnJ5Mk5SNWQzdVpaWUhxRWRuOHFpMkwvTUUxMUtwZThYZkJDUDdDeXh5SzJh?=
 =?utf-8?B?V3pXTUxSbnZVK3R6WnFjbjk5ektkdXJEWm9IUjNjTHJpYm40bGlhZ2dDV3dz?=
 =?utf-8?B?ZEJHY0V1aTM1blZWMEVzdzBoNXhPV2xQYUZyMys1c2Nvdk55N20rNmVMSHRn?=
 =?utf-8?B?cVlkV0h6RXBac3gwWjQ2aXhRQjJmbjVQeURVVTUzMTJLNlVGa3Bkejlkelk5?=
 =?utf-8?B?MXM0TFI5Rnk1VVVlOFg1cm04VHRGNllqZWRRVjUxaUh3MVNOTHJhWXRQSS9s?=
 =?utf-8?B?MHZrUXYrRkFMZzFKUmNiZ3RwcmFLQ2hYUUtDTFg3MnpFNFVPQUh6a1ZrOGdh?=
 =?utf-8?B?aHdZaTA3YjYxWjhGNSsrNS9HaVdsR1QwUFZjdHViQTZEaUdWY2tGWGJTVFFi?=
 =?utf-8?B?eHlhSHBCWVRUZDBaVHU4TTN1aFlXOEVTaXlVOWxxVUMrL05wcDlWRHFpMjlV?=
 =?utf-8?Q?zBPp2WgPe0Hk5aX/0msVSHx4EAFiDga5CS+1brJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63ba91d2-cd07-41f2-942b-08d96862ce27
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 07:26:22.5689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cDHIZFBOe/5payTgM2ioAsIfvEyT2k+DiA11g/LQCN24VAsM0eYg1Xwc7uH2QbGQJHNEGlFr/T5cNx5Kh3G1rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3118

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
TBD: I find the ordering in amd_iommu_disable_domain_device()
     suspicious: amd_iommu_enable_domain_device() sets up the DTE first
     and then enables ATS on the device. It would seem to me that
     disabling would better be done the other way around (disable ATS on
     device, then adjust DTE).
TBD: As an alternative to adding the missing IOMMU capability check, we
     may want to consider simply using dte->i in the 2nd conditional in
     amd_iommu_enable_domain_device().
For both of these, while ATS enabling/disabling gets invoked without any
locks held, the two functions should not be possible to race with one
another for any individual device (or else we'd be in trouble already,
as ATS might then get re-enabled immediately after it was disabled, with
the DTE out of sync with this setting).
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
 


