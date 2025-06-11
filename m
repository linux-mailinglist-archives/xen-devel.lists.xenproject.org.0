Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D15FAD5F88
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 21:55:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012143.1390689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPRXr-0007r6-CG; Wed, 11 Jun 2025 19:55:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012143.1390689; Wed, 11 Jun 2025 19:55:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPRXr-0007oa-8H; Wed, 11 Jun 2025 19:55:35 +0000
Received: by outflank-mailman (input) for mailman id 1012143;
 Wed, 11 Jun 2025 19:55:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YTnm=Y2=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uPRXp-0007oU-HM
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 19:55:33 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20629.outbound.protection.outlook.com
 [2a01:111:f403:2413::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06ce5a29-46fe-11f0-b894-0df219b8e170;
 Wed, 11 Jun 2025 21:55:31 +0200 (CEST)
Received: from BN1PR12CA0006.namprd12.prod.outlook.com (2603:10b6:408:e1::11)
 by CH3PR12MB9028.namprd12.prod.outlook.com (2603:10b6:610:123::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.35; Wed, 11 Jun
 2025 19:55:26 +0000
Received: from BL02EPF0002992A.namprd02.prod.outlook.com
 (2603:10b6:408:e1:cafe::29) by BN1PR12CA0006.outlook.office365.com
 (2603:10b6:408:e1::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Wed,
 11 Jun 2025 19:55:26 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0002992A.mail.protection.outlook.com (10.167.249.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 19:55:26 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 14:55:25 -0500
Received: from [172.26.5.4] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 11 Jun 2025 14:55:25 -0500
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
X-Inumbo-ID: 06ce5a29-46fe-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lCdjCgi37SzLkFZTZpDxilUvp01UX2+HCp0GX73hoIpqV+8np7f5KxFBuOX67R6J3gEAUukTNP52fs/sekNCZroYVsUsakWOKKGoKClAWbMvXDvcesvu9dI8t6doh31Gl0Xvi5An41JFsVXNL1uifCaPra8d+1nPVo0lltPec82z/iXG04OcczyikQKwwx0Of8078WwSrirID1pkmbM9EQtS2epU0SAyLZqqtfcqCWkvpap78S5HQBBZe6BRym+SXwzPYvms24dObXb9rBUf2HX36Yv6DpGdvUmu1JP1rQVDCDfPRWOhgbXTBFE5MjpFwqz1iOd+FUMtGtEc8UpSzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqDqO7m2gZiOVJMSEy0MJAlh7VWIlSB5xMSayXQlDBo=;
 b=mUyMTG75P9bZ13TGUl6GZK4LuO74EaZUreAhDrN4ojdBunMR9RPdX082DvB+dkqjNmYE51AYrI0E/UBQ9sPG8QWlMqi2Ru07C0q2KQ+UtXtC2GS6+x6Gi/ih3hLMUUnSfvg7MOzlhUTC61fROuVXCzpndTfp14Y+7qII3tL1IzG8DroGYqkiTVKsPzKe9FceKXMufvSmx8eFEMzKQfLdlO1wrVU17SSS45nItDaLk7gmsRTbKqmghtblC9H8cTVhmpFV3TQEDEtRmcCNjrOUbbFD7asL+wElZw4bAN+W5Y/2sLnlpnABupgz6JQzZrIVwKTaiQN4/wrz836GZl3qDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lqDqO7m2gZiOVJMSEy0MJAlh7VWIlSB5xMSayXQlDBo=;
 b=EIaUp+zqKMM9myk94UuXOEswC28/t8gdqhpYn1uu2ViP7x80MgmjBvr+K73VMyda3+uQe7mo8QFVC1n0iUT9njldMWC2EJA6qFkWYEfuPmL4qreef+GJFVYhhZ/kpJstmZj7Z2LiNSeL0nB4sjuxqu5jN2bRNAhP+P4zr2HbPZA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <ac318f2d-c678-4f84-8166-a48affd617cd@amd.com>
Date: Wed, 11 Jun 2025 15:55:24 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/5] vpci: introduce map_bars()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>
References: <20250531125405.268984-1-stewart.hildebrand@amd.com>
 <20250531125405.268984-4-stewart.hildebrand@amd.com>
 <aEFuiGq5KjrdNUE7@macbook.local>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <aEFuiGq5KjrdNUE7@macbook.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992A:EE_|CH3PR12MB9028:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c17ee2c-2243-4372-596e-08dda921e8ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bTdGMHphbXd5Y0xnYWc5azdwZURvM3N0TGdEamdoanZvVVRTVUtwNkM3SG5t?=
 =?utf-8?B?b3l5cUtHeFVYYW1uRExoSWRnRTNKcjZtVlJuWHBubzJwUXc1QTNEcjZBWFFo?=
 =?utf-8?B?SFpFQWQ1eDhHQXRRdDgyb0xrNjFLb0VQT3c1RjVDeTNIRU51bjJPVHdUOVJO?=
 =?utf-8?B?cTQwOXhYRFAwcVBuZkEzU1BFK0RMSjRJWkRDWWd1VUJmM3REVkNHTlpOQ3BZ?=
 =?utf-8?B?YmNnTGRtMkJFcDB1OWFyNFRVOFhzdDZGVko0MjFpaVlZY0JaRlJWMkNpWVhS?=
 =?utf-8?B?UGk2TWJ1S21zQVljOUtoRWRDaEQ1QWMxMG5rN2Rtekl5dzMxa0xyNG1TalVC?=
 =?utf-8?B?ZTFwS0liTHZnaU04b25uRXdEQ2lDSUkzK2ZoR1ZEZFk1VVA0TEl5Qmx1c0E3?=
 =?utf-8?B?SFVOMlFKSWo3R0hmdE5ydkVqck1yY0VESlFOWFEzNHgrTkIxSGV3SHZ1RmQ2?=
 =?utf-8?B?K1VhbXNMTXI1UGdmZ2NDVDBlVlE1ZnRPcGFBbXRMMnVtTXQrUDN2UDdlenlW?=
 =?utf-8?B?emNDSnBvYVRoQkk5Zm04UXExbnFvQnRGR29NcElYL2NOU3UyM0VNd0RYTllE?=
 =?utf-8?B?QkFyRWJnME15MDlsSHR4ZU84a3NYN3R4OWFRS3RqbVJLampUYzVsK0tFSkZL?=
 =?utf-8?B?VGJET2dwem5FOVFPTG01a1RGYXc4dVcvcE52ZTNFWXNYOTdCMTlhc2VoazVV?=
 =?utf-8?B?ZmxadWxkYWw1MFFxV0Z0ZWVRWndSaWRrZjU3WUNvdDRYVnN6SkJYM0tPYzc5?=
 =?utf-8?B?UXlvWThnRURKaVhLZnN2NXRxUUY5TEd2R2lGQ3JOSEoxZkNwazJVazNKcTRR?=
 =?utf-8?B?TlhrSncvdk5aMnRQMDJraThsMjZnSm5ETVdEc1czYzNKU3ZZdE0yWUJ2RG0w?=
 =?utf-8?B?cXhsbm9DYkFPckp0VnNRangzU3phY3lZWXdWMyt6ZU1kczhhS1VqUlFFMnhG?=
 =?utf-8?B?SzlkRHhVUkhvL1piU0hHZjVKbzMwcjVqV1NaNUlsTElOdTdGcE9KT3crSWE5?=
 =?utf-8?B?ektHQzNIVW83YlVTM3JKcUgrSzBUNjA5VDRnUXpZeWl0SFJhVzMvNTZsZEZQ?=
 =?utf-8?B?OWRicysxcTlvZFRFQ1NobHljekpCcTRnYW1ZOWZUV3VZdWw2YXQ3ODNMcnU1?=
 =?utf-8?B?NDQ5Ti9OZ25kcE5pdURTTktXa3hDbDMvRnM0RzhIK0E5SmtKWWFRUUt3MXBV?=
 =?utf-8?B?K0N1R2MyQVBnNG01bmdNTU9MTkRDRWl3dUNDenJGRmRRN2JPcE5rbng1Z29W?=
 =?utf-8?B?L1N0ZStKOGV4MnViM1h3TXgrMW8rVHFXTmRvbkFNN1Nrdzdha0p1SE11elJq?=
 =?utf-8?B?bUM1bmt5RDJLVHZOcEVDZC9sT0x6czZIcDFqb0JiZzBhUStDa25GbFhlODRj?=
 =?utf-8?B?aVo3clcrRDBoRE5ZUEZBVVl2K0RKTC9GRWFzNWpvbEZTUVBSdWZmallNSFNQ?=
 =?utf-8?B?MWxjMndwMWhLeVpxa2p1TFBFd0w1RzM4bG5GU0QrR2p0S1RsS3FhUUpvM0Y0?=
 =?utf-8?B?VG9pSEprT2JvaVFVcFlSR2J6K2pGeHd5WDNXOFY2TkYvSittdmxXUjBGbENU?=
 =?utf-8?B?UHRadVJqOHVEUEhsWS9ZQ2prTEF1SUo3YW9vWk54NTBEL1JvVG01b3N3Y0hV?=
 =?utf-8?B?U09UVlJSVWVLQWc0T0NocDJ6eUJacXBhOU5JRi9tQ3lPbWg0TG5tQUZrSDVY?=
 =?utf-8?B?ckdsSGFtNWJpU0llN3dvaU1VaXhnd1BBZUNGMXVJaGl0T2R6NlZPdmdnUHdP?=
 =?utf-8?B?Nm4ya0RmajlkbGViNmpEYzA0YWl3alBFUk1WQzFVVlJkVFJEWmVYNFB4ZjJw?=
 =?utf-8?B?dUl1ZkFYWEwxb1dUZ2ZoMXJGdXVmN2ZPNFBTT0dGek11U1RsMU5mQ2Uyb3Z6?=
 =?utf-8?B?UWlRaU1ySmtqVU1ia1U3cnVNUW92Y2RmT3FSQTBjRkgrNkl2aU9iUmdjQWl4?=
 =?utf-8?B?MTdhMHU3OGo0VFdsSVIzYVgrdTZieDdPU0JiblgySXRNNHhHVWliWHNhV0cr?=
 =?utf-8?B?a0UzL1dSa0RTbnJRN0NSUnhwSmhtNUY2OGpTNVo1eVIwaStKeGVsb1VPbHFk?=
 =?utf-8?Q?A5pch5?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 19:55:26.0632
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c17ee2c-2243-4372-596e-08dda921e8ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9028

On 6/5/25 06:16, Roger Pau Monné wrote:
> On Sat, May 31, 2025 at 08:54:01AM -0400, Stewart Hildebrand wrote:
>> Move some logic to a new function to enable code reuse.
> 
> Like with the previous changes, it's helpful if you explicitly note
> that no functional change is intended in the commit message (which I
> think it's the case here).

OK, will do.

>>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>>  xen/drivers/vpci/header.c | 56 ++++++++++++++++++++++++---------------
>>  1 file changed, 35 insertions(+), 21 deletions(-)
>>
>> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
>> index c1463d2ce076..b09ccc5e6be6 100644
>> --- a/xen/drivers/vpci/header.c
>> +++ b/xen/drivers/vpci/header.c
>> @@ -173,11 +173,38 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
>>          ASSERT_UNREACHABLE();
>>  }
>>  
>> +static int map_bars(struct vpci_header *header, struct domain *d, bool map)
>> +{
>> +    unsigned int i;
>> +
>> +    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>> +    {
>> +        struct vpci_bar *bar = &header->bars[i];
>> +        struct map_data data = {
>> +            .d = d,
>> +            .map = map,
>> +            .bar = bar,
>> +        };
>> +        int rc;
>> +
>> +        if ( rangeset_is_empty(bar->mem) )
>> +            continue;
>> +
>> +        rc = rangeset_consume_ranges(bar->mem, map_range, &data);
>> +
>> +        if ( rc )
>> +            return rc;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>  bool vpci_process_pending(struct vcpu *v)
>>  {
>>      const struct pci_dev *pdev = v->vpci.pdev;
>>      struct vpci_header *header = NULL;
>>      unsigned int i;
> 
> Maybe I'm missing something, but don't you get complains from the
> compiler here about i being unused after this change?

No, i is still used in the error path.

