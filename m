Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 710BD60CBC6
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 14:26:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429841.681110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onJ0Y-0003VW-Lq; Tue, 25 Oct 2022 12:26:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429841.681110; Tue, 25 Oct 2022 12:26:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onJ0Y-0003SR-Ic; Tue, 25 Oct 2022 12:26:14 +0000
Received: by outflank-mailman (input) for mailman id 429841;
 Tue, 25 Oct 2022 12:26:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t1VE=22=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1onJ0W-0003SL-MF
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 12:26:12 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2061.outbound.protection.outlook.com [40.107.212.61])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33c6c753-5460-11ed-8fd0-01056ac49cbb;
 Tue, 25 Oct 2022 14:26:09 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by CH0PR12MB5300.namprd12.prod.outlook.com (2603:10b6:610:d7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35; Tue, 25 Oct
 2022 12:26:04 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2%7]) with mapi id 15.20.5746.028; Tue, 25 Oct 2022
 12:26:04 +0000
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
X-Inumbo-ID: 33c6c753-5460-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AHzj1V/JiVtD41t8ghVGgCO9aS3XXwlWQh6AYJkBJRS5fm4NOW9yVqWMd362UINtcmqPlrHzbtMiOfQY5oGts6+G2fiiO3R5RHpZbY0QfTuk8o+ulR7bVIarunKqyHUseyy0uzLb0J7+wMXLxJ3DCc9/syzA855Ni2NIPso3p3bCOQUXBMIrS2No12pP3xM0xJlfBFT6yJOYX9awj1Uazhn5eKdUjHp5HRlhoqmKOoZTl5TfU2pWNnaFPSN/oZIXdOUitU8+qgVchpIMYHs71asXqcBrpGPt6uwmHIIYHLJcd2vL5nCZSa251gS4j62K69U5z7jfjeW86Awm7/Y3Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=42aTLoPmUHQxgqfWtrsiFWxqbzPntR9zF8FGdEgh8tQ=;
 b=ZkKHW4FTTbJY8+8Z5ByF/eWiOCCsj4xQvSaCnngQ13jrv75gM/YKyNGUQP0H65MDgpYN9WLa3rJhpWtnI2zv+1Lr6xaA9M749eq2U+uJBqP/PqjEDvBHij2FMMn7YKYHuOJEtdToVZaMWf2MhxmWeObqZyL2EgOSGoP9qAuIVrg+oMGMMRzF5fTqP5t0/qW5yEFFHdl1VdJg8G7srGQ5VvRrOYzlk7mZxgpANVOsi6ZhNaIBsI9fADNcq6BpUFLVbshGAQvGHyYfZkNPRDpW6adZ/ZPwpSiPJkXdEewqwaxwqIpRGnP/wPn08O7ANrV3pbAD5OnC6UTUFGh6I4iSJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=42aTLoPmUHQxgqfWtrsiFWxqbzPntR9zF8FGdEgh8tQ=;
 b=JDI1JMTkjZ9TRBz8zJ3YesmmXRBotAw9YKEA9t/A83J6IvWuPZRIA43nHIYSZhz5/PqOQfsNxrqa9uQ9in+f9o/CjcHkkynQMprBG6S8oS6gixEDprOIFjrw+aYk71c3H1DlVzxOhkF3aff4DuiiA+918iHEeRWbYmlmvilH+vk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <bedc03b9-e6b9-c85b-27d6-33860ba7bdd7@amd.com>
Date: Tue, 25 Oct 2022 13:25:52 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
To: Andre Przywara <andre.przywara@arm.com>,
 "stefanos@xilinx.com" <stefanos@xilinx.com>, Julien Grall <julien@xen.org>,
 bertrand Marquis <Bertrand.Marquis@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
Subject: GICv3: Aarch32: Need guidance on the atomic access of "union
 host_lpi" or if ITS is supported on R52
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0007.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::19) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|CH0PR12MB5300:EE_
X-MS-Office365-Filtering-Correlation-Id: 454836bc-ca3f-4d9c-50a9-08dab68415b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kosZ5u/NRrwwpAXow4yaIgu+jrg6PsdqB7wXsYDJmkPVE8Y+TmZW1b+CxVcfBU981kXGUW7zqR6iKCK8R3BhSVVsUOIj+9d3RV8O/XalK+1dRVmyPoBVn1z6mPZ3VMLbBgZyh+jUV2mBbqapGH7nFDG3RSuWS69jsMuQ/1ylQ1bFSEfy/ISRC0s9shgfe82nddMx5hF8J6p2q6VRqV+Ky2fWPzAd5q/RasO3i5wPY981ou7v5UmCq1UYhdGIBKOmZbgIDgg2irrtREtIJlYIAReiCAsR0/bGa7w9GyJ++9/ZJZBV23nQuXQDPATicxL+IzgnVcJZtUiWjzuCWR1OyMwHY4Sa8DlvWnV4LlKMhi3NCAMqB6ocnOOkw6ehmgJJ5Wame6Jl+uKSaEmpUd1yp8K3WANkXMc9SVljXp+Wizx22s6TCMLPS3R7q82mRRhz7z0BMgOILB+ory1M2l+S1sJxl4MoD4BBdGNRoHYF/exi4yh7thDk1mDYibYR51a/3XtbiJ6kdvrBY21KsGalGHwSzMzo4Fs6heAp7elAM86VhyaWyzgoX83cekuwnisfBpvHt8fz2lHPW0NlM1TMxPluVLHTYa+/qkGdrcRujt7VWvwqlKw26F6OPStHyxpDkG90JIScV9buMwHKMZRL8IIhChoh8yBuDEHPTqj83TnXvbK2jlNXalqnROI71BmMzjXoTml3U/WFVoKgIJ1J6Uqs8zfc55fTT+X/2Dq36KvK1f32u0l8LiGytecBhThXKoSPD2ViwVS5ULri964bdbXQdqxOSEqVQqvJa7XPYbw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(451199015)(66946007)(110136005)(4326008)(6506007)(26005)(66476007)(41300700001)(36756003)(5660300002)(6512007)(8936002)(8676002)(6666004)(66556008)(316002)(83380400001)(186003)(31696002)(2906002)(38100700002)(2616005)(31686004)(6486002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjJiTSs4Uk90VUtFSWd3STY1NzRXQm5UZ1gwZm9kNWZ0NFluaFJwRzkxZHlP?=
 =?utf-8?B?TG4zSFdVcHhCK3V6Y1NOK01vT09xUXNhaEhQVWYvQ3paMnBEL2FIYnpVcWRt?=
 =?utf-8?B?czV3YTN5UlNacVpRRndsc3pDL01lUTNQV1hoaXlRL2pzNWNING05OERTeGM4?=
 =?utf-8?B?QWdmNncwK2kxZmI1N3AzVnJRejBTSlpLQ3ZrTG8rS1owd1V5dUpOUHRkY2pE?=
 =?utf-8?B?enRxcXlpa2FGYnk5Q1JiTUZOUnlxZFRkc1RNaXZQQnl3VjdQZzArNFVhTmx5?=
 =?utf-8?B?RTdzMkh0QU9lUk13OTBwSEdGMUZrVjFyQVdrT3pXZlVZTkhZUVd0OHV6RklH?=
 =?utf-8?B?d1F0SENURW9iOG8vaWlZMFM2YVVxYmZ3c0RWOU16NjkrWUtiZ3hpLzJrSGlC?=
 =?utf-8?B?VUtBOGhQOVdIdlFaTW5GTWxYQnhCdWdUbzYvSlZna2NLQWpHZElCVW92VDFX?=
 =?utf-8?B?NDZzTXBTa1B3VUFLd3l1VXVXS1Z4eHZEd3lEbDREWnNuUE9KLzB5eHQ0M3l2?=
 =?utf-8?B?SjhYeHZDOUtTVkpvLzIreXg5eS9UNnBxN1hLVHJXTFo2T0VobzF4Y0VlMEFs?=
 =?utf-8?B?aHFvemR4T1UxNlpMMzYxcnlacTZGTmMyVUlpWHRIM0p6bUxjdVM5Vk4rRGdn?=
 =?utf-8?B?SG9sNmc1U1JadXNncjBsWDFTZk5BTWVQSkZ6MStCZVlYQ2YrZE5xMjl6UmtE?=
 =?utf-8?B?ZjNzbU4wQVJGcjBYR2xpNFZ6SWlEaGdFeHV1Q1RxTkR4TU9abVgxb0QydjFS?=
 =?utf-8?B?UGNGeE4rWG44QlVlNWR3YWhhK0pYYkFhOUkwOXpRZFhmSjhnQllkM2VrTUZG?=
 =?utf-8?B?ckdFOE5zalNtOHNpSHZxQkVGU05nUnNzM1g2NGZqUUlDVTllQ0dCVDJsamlR?=
 =?utf-8?B?cUVaN2lWSG9IQ3Vyb0pxRXFGSjB2RXVaMERsYzhsR0preDFIdnlQZFAyOHVu?=
 =?utf-8?B?OHFaZGRDdUhpQzhNWGlBOEg2UGIzMjdmS3M3NmJHV1I1b1pwbmx5bXhyNHgz?=
 =?utf-8?B?NFVUSnVKUkkxN1BHYk1kaHpXRlM2TVJnQnlDNlM3QkJoRmpIenNEb3JJUHB3?=
 =?utf-8?B?N2xqS3lxeTh0bzA4N1pFTVh6UXlodW5jMVZhVXFpcVR0NGVTZ2FNaStVbHBM?=
 =?utf-8?B?NW00WWxjdUk0UENLYVB3NHZ4RDhrVEUyVmpqZDJ2Z3JqSURkeEQ3VVhCajVO?=
 =?utf-8?B?OW00c1VEeXZlTHp0SjhlSmkzbTduR0NaSG9aWkpmdy83dzhseVZKL05sZk9n?=
 =?utf-8?B?Q3VxR3ZVdEpXN0pPcDZxMVdZRjk0MU8yRjRIYzFqV1EzZjlDS2t2L0lHZXdp?=
 =?utf-8?B?aUNrdVVIOHdTRGs5RDhUT2FLUTdCMDh6cUxWYTdndEJsVEY5Zi82RFpNV2FX?=
 =?utf-8?B?MXY1RFRIckI5anpmRk1sdjFob0M5VmtNeXN0NEMvOTlrT1pDdk9rcWFlTW9R?=
 =?utf-8?B?YWRoaFZwbDNTbmRBamM5dS9HZGtCVkp5WVdLa2llQVRsTlFvN3hmOW5aOGFP?=
 =?utf-8?B?VnRaQnFtV0txVGVkNktXMnQ3QTZRQ0xNTWNhVlFsamQzNnE3ZHEvTXpBWUVU?=
 =?utf-8?B?bVNPb1NWS3VmTDJDTU9qeVZEYno5Mjdib0lGU0Z3RWwwNUM4ZTNmNDBSN1Rm?=
 =?utf-8?B?N1U0Vnc4Q1RBc3ZqVEVNTWdEMUJzRVF1eUdpbzlBMWUvQnk1Z3d4YXBrTzR2?=
 =?utf-8?B?cTFFRE5vQUE2VzVNcXRjWTlSTVB3M0tYTTgzSXdpK3p4U0pMS3FnTkF6c2l6?=
 =?utf-8?B?OHM3bDd2N2RxNlhvY3N4MFdLMDlXK1RHOTFBZy9jUTc1UHB5V2pZa3VLb2N4?=
 =?utf-8?B?ZU05ekJjUnZKZUkwaVVTazJ5cEloRmhIcU1ReldYQkZXck5ZUWZwQUREOUlM?=
 =?utf-8?B?SElkeWVUTlVHR3dqL1U1L0pQMjJsWDRpZWwrb09qWnBVQU1uMFY3dC9yelVI?=
 =?utf-8?B?OFlMVFpZZ3dSemdyR1ZEeXllbUpraG42NVQxMWJPR2RleDNodlNNS28rWFZK?=
 =?utf-8?B?UEkzb2hVSGhnbnFrc0NzWmFxOXgxTkVrK1NENEU5THZNVmFqOUxhclF0bmJC?=
 =?utf-8?B?UnAzbllOa1cyWU1CRElrcnZtb2NKWUxMNDE5bEt5S2RhQnpvSUZSWkNLZ2FM?=
 =?utf-8?Q?A5dc2rAkxu7JRk5qfQfcHrtFQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 454836bc-ca3f-4d9c-50a9-08dab68415b6
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 12:26:04.4741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +8FQosNSKBLmBwQef1j+BRTymyhS/WrXZK6zzUaDdu9X8hqzjp4Kvy/N8SGOF+Sw8pajKRnSDG4iR+mwzqzUFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5300

Hi Andre/All,

This came up while porting Xen on R52.

Refer "ARM DDI 0568A.cID110520", B1.3.1

"A Generic Interrupt Controller (GIC) implemented with an Armv8-R PE 
must not implement LPI support. "

Does this mean ITS is not supported on R52 ? I am assuming yes, please 
correct me if mistaken.

If the answer is no, then my next query is follows :-

diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
index 9ca74bc321..dea60aac0d 100644
--- a/xen/arch/arm/gic-v3-lpi.c
+++ b/xen/arch/arm/gic-v3-lpi.c
@@ -423,7 +423,7 @@ int gicv3_lpi_init_host_lpis(unsigned int host_lpi_bits)
      int rc;

      /* We rely on the data structure being atomically accessible. */
-    BUILD_BUG_ON(sizeof(union host_lpi) > sizeof(unsigned long));
+    BUILD_BUG_ON(sizeof(union host_lpi) > sizeof(uint64_t));

"unsigned long" on Aarch32 is 32 bits. So this bug gets triggered.

Is it fine to change it as above ?

Reading"ARM DDI 0487G.bID07202", E2.2.1, "Requirements for single-copy 
atomicity".

"LDRD and STRD accesses to 64-bit aligned locations are 64-bit 
single-copy atomic as seen by translation table walks and accesses to 
translation tables"

Does this imply that atomicity will be retained (with the above change) 
? Os will this require ldrexd/strexd as R52 supports MPU (not MMU, so 
translation tables are irrelevant).

Kind regards,
Ayan


