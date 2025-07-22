Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63733B0E186
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 18:18:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052936.1421718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueFgv-0005Oq-8o; Tue, 22 Jul 2025 16:18:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052936.1421718; Tue, 22 Jul 2025 16:18:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueFgv-0005Mv-5d; Tue, 22 Jul 2025 16:18:09 +0000
Received: by outflank-mailman (input) for mailman id 1052936;
 Tue, 22 Jul 2025 16:18:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kPIU=2D=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ueFgt-0005Mp-7k
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 16:18:07 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062e.outbound.protection.outlook.com
 [2a01:111:f403:200a::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70a2755a-6717-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 18:18:05 +0200 (CEST)
Received: from SJ0PR03CA0350.namprd03.prod.outlook.com (2603:10b6:a03:39c::25)
 by SA1PR12MB8642.namprd12.prod.outlook.com (2603:10b6:806:383::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Tue, 22 Jul
 2025 16:17:57 +0000
Received: from SJ1PEPF00002315.namprd03.prod.outlook.com
 (2603:10b6:a03:39c:cafe::e6) by SJ0PR03CA0350.outlook.office365.com
 (2603:10b6:a03:39c::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Tue,
 22 Jul 2025 16:17:57 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00002315.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Tue, 22 Jul 2025 16:17:56 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Jul
 2025 11:17:55 -0500
Received: from [172.18.231.84] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 22 Jul 2025 11:17:55 -0500
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
X-Inumbo-ID: 70a2755a-6717-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yf5vpN0khV9xn0v+eoKyGycTCZiA6UvwteEpt7ek+6LLIsIHT7eaQ/W/kf/zcSDam6gRATOanP3AjS24Kc9jC8LY+9t3yDZUgKbd0JRwpceNrgs6VLv1UWXlJlbfsuqOBSOhiTwH2vi2+UgReNaMahCbeZPQdsU5f6zfncv5RtKuznDVpDB7hQZqISfuQ79AOfVqVCGefg0JxS/7HviS0dV0d/8JYJsj8m1Il7o8ZB3BksJy6+KaOVY5HGkFgyc1O88N3ILhZZDIl1R0srY5k8iqN15t4zV9myZFMEhBoK4NUwXhIq0u01xTbBhTxGQHNuF+WEqN6gNv2Iwy3Tl4+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cO39SUoplI4UOUYwkm2MrkzX7RpyaVpP9Pbw8Pmh1KQ=;
 b=h4/NF6+tfyPoiHZHqLuwYywo6Z24x/3WciYAJABDjIx4wU+dcc886P07xMiMjMngXYZEmHOg5rIliyEh5/5CuFTpoSjJwbFQtmcUhJYGnAevE2HSCYIKn7Zu0FsJtkcQyFtXAy+mb2BODTl4eJPZEZ5NU9i60+aqyQONHaQzUEA1zQJ89sezV/GfJTOtkLJPQRFx/JcIAekjaCHrxSXfpq8cZJDNT8PziKkbHG007bAhER0+Y3QgQWD1tvZKUH5E0+4AaMSbuC3cyXG113LoqoVqyhpWf45B41VN/UMnbRa2MxnYaLYRc59GFSHiH34tU602k25FgC23RGbjscPuMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cO39SUoplI4UOUYwkm2MrkzX7RpyaVpP9Pbw8Pmh1KQ=;
 b=1L1THvVxVSzidblSZUL0lisl3mv7DmDgOQm0TAKS8p1gaPGGYJfM7JORgtgULQsj9p6z8NEDRUWAJpl2M2Ep7bMB1HPfHQ7VE11oMyiaC/7N6ZNKcdU3qB6S+BxL4zadTL4ifjoKGnSkTfFkoCEB8Vlx4jAaAWGrzEGaSqfAmEU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <1d5c10bc-eb69-492c-9f1a-6a273feecdcd@amd.com>
Date: Tue, 22 Jul 2025 00:50:07 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] device-tree/kernel: Use memcpy in output_length()
To: Michal Orzel <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <20250722074645.19029-1-michal.orzel@amd.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250722074645.19029-1-michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002315:EE_|SA1PR12MB8642:EE_
X-MS-Office365-Filtering-Correlation-Id: e8d91d0d-b7fa-48ae-aefd-08ddc93b51b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cWlSa1RXWjNWZ1M4bUt2NWl5NEFCc1E4MFFCQU4rWTBoa2Irb1lLV1RkdkNU?=
 =?utf-8?B?K3YzK3liVnVrWHloTzhRK01XWTlQTmJKdTR0S3E0QnVFSmREbmhmeEhSYWZT?=
 =?utf-8?B?a1p2ZCtjRFV6VDhPMm1VS1Q4QXk5ZUdsMXhFeXI4SWJ5a3E3MktJVVp1eWV1?=
 =?utf-8?B?QlczYzNGejU1V0VCWWlwejRsL2lYQ2tCMnZhOWRBekxuRGZqRDUyUXJVMXVn?=
 =?utf-8?B?Sm8vK3pqM09CcGpkYTU4WTkxUEY0dnRtNmpheURVNEo5YnFMREZEY2twRVNj?=
 =?utf-8?B?MTlpYlYwZmJERmdHV1U5TjB5cjRrbUpOOGFhOWxVNlhmR0g1S2hsMStXUm12?=
 =?utf-8?B?eVY3QWd6VkovU1JZNExLak5SRm4yRy9xcmtOY3lBSTh5cGJWVk9rZnNrZ3ZP?=
 =?utf-8?B?ek02MFJsVGpSTGJ0TkR6Q3J2SnhmYThQT0YyckVuZS9oN3pTNWRjcktyb0oy?=
 =?utf-8?B?M1FMNmlIRUs3NzYrbnR0WUNLSmRqbUY3ZUlkM3NpWnplbmJuR0c1RTZURFlx?=
 =?utf-8?B?bEQvTG5jS09ncmpwT1JOcW1kOXBsaTU0RVdGMkxCRHBXQ0xlYS9FcUIzRmRs?=
 =?utf-8?B?VWZJWVdzRUtuMytQbk9zRUx3blFhL3djM2FRSWZNYm5Wci9Xd1ZRSEhqZFJt?=
 =?utf-8?B?MDgyMzZkVVUxRkgrWU5xYnY4dXdvOW9HU3JGZVFTdDl4R1kzMEJjOFdSemdm?=
 =?utf-8?B?T0ozS1RUMkRCaTlPalp2Y2VOaXN1N1pyUEx6VFdKT09jMjBwVkVLV0RJM3RJ?=
 =?utf-8?B?RVNBQThMeTVDcXd2NGdxZmhyQnNzN3JMQ2tHWmY4ZEc3TTBKejhaK0lRU3Bv?=
 =?utf-8?B?RWhQWWFibFBhWXdFeFpkd3lxZ0l0NGluZnlkU29NNzlsSVBBWnZoY1Nvb1Y1?=
 =?utf-8?B?NTdTK2w2UzUxY3ZHc2podFRTeGIrSm9QKzM5L1l2NXR3YmJGSUw0aEtiR1Zp?=
 =?utf-8?B?anFsNU1lQU9oRFFEbXptUVVVOS92OW1OTE14Y2dCNG1GY1FjM2JkUC90OVlZ?=
 =?utf-8?B?K2J5RDRMekZ5TktvSVBGWExJQnIxQ1FzRXBMVUV1a2FpNVFJcHE0Z1UrZXh5?=
 =?utf-8?B?alRTY093UUgwQVJhMjJ3TXpLNEcrb1BkYklRTVRXUTZIZmJDRTJBY05pM3gw?=
 =?utf-8?B?Mm03ZTl0TysxaDduWkd3bERtUk1UNk1ZVGNRdXl3aDBnMm53Ym1pOTVHdzFz?=
 =?utf-8?B?ckFCQ1BIdWhaSHpaaFEzSHU2VWZDaHlMYUF4RW5HaXVuZVl3Nkd6Qnh5a1Rs?=
 =?utf-8?B?eXpQbGJrOWk1ZmJuNTVkWmtXSldnbGp3RW5XaEFSKzFvQlAzdFZUZ29vTXdl?=
 =?utf-8?B?SlBhdXQ5dEJ0U0tkMjhVNzRra1FIcVhySHlHZW5kOWhPN1lYeFZ6YUpoRDNZ?=
 =?utf-8?B?Mm8rQ05vQ3NvcG02YTlkbS9QRWYrVU1kcHQvWVIzclFDZ2xwL2x5MjlJSGw2?=
 =?utf-8?B?NUcrWDRQaFZQK1pnckg5aFlFaUE4Zk1rZU1ldFBQbHpZVUluRnhsa0pPbVc1?=
 =?utf-8?B?WEFkSHh0ZnhEdGpxNEZNWGhwdk1pem4rWFRpWkd6Y1dZRThRSG9zbXNsVHVW?=
 =?utf-8?B?MU9oc05May9SL3FSTGVVb1ZlZnU3NzdLaWRxVUNFZlRheExMT1p3NFVSUDJm?=
 =?utf-8?B?bnpVU21Kbk9PTjZWY0h5NFdycG85YkJOanlmcDJYbnVWaFVodmNjZitGREhw?=
 =?utf-8?B?RTMyVnpJVnNDUUt1STVSNlRoMlZydkROSlhXU04wTW04dU9PL21VS29UWGts?=
 =?utf-8?B?eFViZG83endYVWJXTy9NQVpjZGJadmdtQ0hlWGZWK2JLZnZSTjRHRGFQbE1k?=
 =?utf-8?B?ZnRoWXRhbnRobWkxUC9aNkF5cHBYK0RrdEJDbFdCL3JRbjZqWmJiK2h2cTMx?=
 =?utf-8?B?cjk4OUZBMWd0U3ppb2dYWW52UXdLWkxxWDZoK2RNL1E2UCt5T0UzdmhVZ1FO?=
 =?utf-8?B?b3gxT2ZKTktoMktjeE5JamM4OUE2U1doTDRrRUJZMlZHT2NjWmswZER1OXdX?=
 =?utf-8?B?c29GQ1REZkloOWRLY2k5Q25WbzVKNnZ2ZkhKcUpXVnMrV3JGcUh0VW9odW41?=
 =?utf-8?B?Wmd0OU9nSEhmS1ByQWhyM2w4U1JIUEgxSTY0UT09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 16:17:56.5920
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8d91d0d-b7fa-48ae-aefd-08ddc93b51b0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002315.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8642

On 2025-07-22 03:46, Michal Orzel wrote:
> Trying to boot a compressed kernel with UBSAN enabled, results in the
> following warning:
> (XEN) UBSAN: Undefined behaviour in common/device-tree/kernel.c:21:12
> (XEN) load of misaligned address 00000a0040f89867 for type 'uint32_t'
> (XEN) which requires 4 byte alignment
> ...
> (XEN)    [<00000a0000529964>] kernel_decompress+0x2bc/0x5bc
> (XEN)    [<00000a000052a354>] kernel_probe+0x6f0/0x734
> (XEN)    [<00000a0000528714>] dom0less-build.c#construct_domU+0x188/0x9d8
> 
> If &image[image_len - 4] is not aligned to 4B boundary it causes
> unaligned access which is undefined behavior on Arm. Use memcpy instead
> to be safe.
> 
> Fixes: c1be0b102e0e ("xen/arm: support gzip compressed kernels")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
>   xen/common/device-tree/kernel.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/common/device-tree/kernel.c b/xen/common/device-tree/kernel.c
> index ef393182b691..28096121a52d 100644
> --- a/xen/common/device-tree/kernel.c
> +++ b/xen/common/device-tree/kernel.c
> @@ -18,7 +18,11 @@
>   
>   static uint32_t __init output_length(char *image, unsigned long image_len)
>   {
> -    return *(uint32_t *)&image[image_len - 4];

Maybe just:
     return get_unaligned_le32(&image[image_len - 4]);

You'll also need:
#include <xen/unaligned.h>

The gzip size is little endian, 
https://datatracker.ietf.org/doc/html/rfc1952:
       Within a computer, a number may occupy multiple bytes.  All
       multi-byte numbers in the format described here are stored with
       the least-significant byte first (at the lower memory address).

Regards,
Jason

> +    uint32_t val;
> +
> +    memcpy(&val, &image[image_len - 4], sizeof(val));
> +
> +    return val;
>   }
>   
>   int __init kernel_decompress(struct boot_module *mod, uint32_t offset)


