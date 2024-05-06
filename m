Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C92928BC72B
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 07:52:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717204.1119208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3rGT-0003ID-Ub; Mon, 06 May 2024 05:51:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717204.1119208; Mon, 06 May 2024 05:51:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3rGT-0003Fw-Ru; Mon, 06 May 2024 05:51:53 +0000
Received: by outflank-mailman (input) for mailman id 717204;
 Mon, 06 May 2024 05:51:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pn4q=MJ=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s3rGS-0003Fq-HA
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 05:51:52 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2412::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bae8db28-0b6c-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 07:51:50 +0200 (CEST)
Received: from PH7PR17CA0014.namprd17.prod.outlook.com (2603:10b6:510:324::29)
 by CH3PR12MB8582.namprd12.prod.outlook.com (2603:10b6:610:163::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 05:51:42 +0000
Received: from SA2PEPF000015C7.namprd03.prod.outlook.com
 (2603:10b6:510:324:cafe::83) by PH7PR17CA0014.outlook.office365.com
 (2603:10b6:510:324::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42 via Frontend
 Transport; Mon, 6 May 2024 05:51:42 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015C7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Mon, 6 May 2024 05:51:41 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 6 May
 2024 00:51:41 -0500
Received: from [10.69.48.49] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 6 May 2024 00:51:39 -0500
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
X-Inumbo-ID: bae8db28-0b6c-11ef-909c-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WjKRRowkLLIY0qAijMRkK7blyZ7g19YORdlmSsECMHOWaK2XgtgsZEMG6lvdEvBLaP7BZrLFpxxcvgSJtbjCDU6p26jeC4P71RtpYsI17ouKuiFbErsRfskQ5jVZ/6gk7UPPxuX/E2gbpoIivkCdNdqTbLDM6/XOpn1Q1Q64OKgECRGICGl6QieCFw+scdaiF0/npt5+qs9CmdXr+bN3URXX2hc6feNGRQ4u3pTMEqEsawZpEUgne3l1LIyqr1L9LxoHdXiA7mZpFBT/G6cIwxWEySolFbCt0J7rs8x+mo5SJxD2Utxv0+LfyClN9gWHKL6xLaKqlJu/lGZcmOxWEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wvIWJc+cE+dWxpio20Uhn1m2SQAmGfkqcv+wkxPCj4o=;
 b=Hqa3iEZOC3i69nAA4zpKeqlsqYqe1iW12YGcCjkxpe3xw7qbVGwH4TIphVnDe/jKdJo9Bp3H2esL1lcoYAOzfn5GvVOY8QIW2JVuWV7Rsy7e4NWkxdtrrylDF5CCs4WaOQqgQ8PW08AbdqYZGss3WOHPTCeqbXWpXnx9tcJbuvMwBxLPTN5gCDJFOuDLB7jr9RWqqso64rNxruJpYAd+Y05QJuTmOF8hxhIv9l/pbFNqmf/TvRU1ZW8051FWdzIuGB5GECD35ccFpaAr7lmSHHjrgjXp8VNmaAEmqpA7aOyDglDeXI+5RrIoudb88O+YTd2Nk94NBizckjMrr/syeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=cloud.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wvIWJc+cE+dWxpio20Uhn1m2SQAmGfkqcv+wkxPCj4o=;
 b=G5Xn19NSoYGq4o1NwW6HgOjF83LTa/EEnMI5mXamxfmONt24GnjuT7bNzcP52l77up4vK50MlB/SIjaripcknZFxlva81o66+h5nBZ8cSM6vuNWrusgwVFVsd5GdSgP/kDbdFw6v8yGNIKncTIj8tqCGppZ23C6vePfQd4tyKFo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c2519443-1b22-496b-8cbc-0df29b55caf2@amd.com>
Date: Mon, 6 May 2024 13:51:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/15] tools: Add domain_id and expert mode for overlay
 operations
To: Anthony PERARD <anthony.perard@cloud.com>
CC: <xen-devel@lists.xenproject.org>, Vikram Garhwal <fnu.vikram@xilinx.com>,
	Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>
References: <20240424033449.168398-1-xin.wang2@amd.com>
 <20240424033449.168398-9-xin.wang2@amd.com>
 <eaea1986-a27e-4d6c-932f-1d0a9918861f@perard>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <eaea1986-a27e-4d6c-932f-1d0a9918861f@perard>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C7:EE_|CH3PR12MB8582:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cee19e7-b166-43f8-77ca-08dc6d909ace
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|82310400017|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QVplWEwrOEJ6U01LNjZ2UXdqUjdpQ2xYVnJKVW9NUGhmSkRWb3hoY1lramIw?=
 =?utf-8?B?WExVa1QxN3Z3ZUtVT3FDZGg0bXNzWmJrS0xrWFpRbFI5MFhOQXlaUm1jeVNV?=
 =?utf-8?B?aDBtZUNXRnE0YlMwcnptMnhlUlEwd0FBMk9XSzlYakpuNENqb3ZGSVNnVGdL?=
 =?utf-8?B?U0xYWnUzUWpUQzB0eHNpWSsxdkNIdllsLzBUNzJncyt1eVU1QjQ3cW4rOUpa?=
 =?utf-8?B?aHY4NENHZ0JLSHB0c2NHVVB4MjlrcWs2cVI0cjFhMWhDYndpNHNKa3NWNHRs?=
 =?utf-8?B?bEQzTUVUZXNLdTdncDk2anhZU3RBZyt5bGpmTzFsaG5IcVVIZkRXQmgrcjRI?=
 =?utf-8?B?bjNvZ2xqMEhJN1dxUlpPc1lnaEdUZ0ZoTU1vdGQ2UitoVUpyYUFWcEg2T2xx?=
 =?utf-8?B?REp3L3poVnlmMWdwUVVQKzY0M0ZBREdBRHBCbnNPejVuZk55VzZDcExNY2Fq?=
 =?utf-8?B?dFpDdXFSOExHdUxlUUYxbXdSejZTQ1VxRnNwakZuQnVHUW5YZHJFZDRFZVN6?=
 =?utf-8?B?dVZyNjg2YjV5WmFLamZCaklBWHV6Und5Z1BZS0VPZ1gxWGVCdnZmdUdqOGtG?=
 =?utf-8?B?QjYycUlxWWtPajNIVWptOHpxMGV4V3pGMDBsc2FsMzZqc0ZNTSs0cm43cEdx?=
 =?utf-8?B?Q2RENm1Qc0x2VXROaWwwVmVTSG5MS3VnTm5aSmcyL0k2MTVQbkE4dnNEUjZN?=
 =?utf-8?B?MTVBN2xWS3VvSU14T1ViK0FWb3doOVVJc2xYRGszZHZFMFJyY0xQam5wUkJK?=
 =?utf-8?B?bzRqV0MvSDR5NkF2Y3E1V0ovRmx6RGwzb0ZJYURlS1Nta0E4Z0VPQ2xHUUZm?=
 =?utf-8?B?eCtRajI0U2RHRGNpWVdZWm8zMnFQYmxvTDdvQjlYaFkxM0VTb3psSURkbUx2?=
 =?utf-8?B?Y01XMnRqQ0UxR0F2dzhia1ZhSDhDQWR5UGwxVkZhTk9ROEVCLzIvMUI2clQ0?=
 =?utf-8?B?Vmh3UnhYZUw0SkpLbGlFcDhjODZTaVNXV2JZZHhLWmhLV3VITkhlT3ZBSmZD?=
 =?utf-8?B?WURwT0VSOGpmdWo2M090Q2pQUStDMisyRjVvSnoyN1UyQTV0OEdvVHdybXJq?=
 =?utf-8?B?eU12UDhjbTVJcHJOY1M2UDZvMnUzMWF6VUlIWmxwQUU5KzRuMmUzUjJlc2VN?=
 =?utf-8?B?eXRyUnczQmNLaEFlengwa1R4eGJpMmdmeThBc01vOFNyRFBrUURnVW9RUjlM?=
 =?utf-8?B?WHdUN3VtVVZLa1pFWnUrR29URUhmN1hyTGlRZ2E0VEZhWEJZUi9ZVmhXSjFD?=
 =?utf-8?B?ZGtYTnFwL0kyT1JqempocWgrTnhnaklQY1J2OU1MNHN1TnBxajlpRmJxWFdV?=
 =?utf-8?B?VXpNQlE1WEZSMlZVNnk1c0xDNDJuVkN1aGVzSnpxeElVZXYxUUpDemhWS2ty?=
 =?utf-8?B?UlNtczd1TjczNytlRUxWMjFrcGVHUWRsVVY2S0xxc1NOZWJra1pEbjVOaDlu?=
 =?utf-8?B?NGxaenE4dE9GTS9ERTJrTHZzVjgxZmhoYTR0bnQybkRWNXNwVC9HVUFMM2pT?=
 =?utf-8?B?bmthaFZnbmN5SStEZEhmQXNQaHpkckNRRXVvK1hyMU94cTR6cTdhcVB4NXha?=
 =?utf-8?B?cktZTVlhK0g2bTlRV0VSSVljWi9EWmRGcUtnWXZvMVdTVzd5NnQ5UkgxVjJC?=
 =?utf-8?B?c0wwS0tONW03eTl1eVRRbGc4K1ZmdFNXbGdqUCsxdDBuOGVMeFQwL3ZoRWdn?=
 =?utf-8?B?TFlEb3lNOUFUMU9RTVJkZVVZcnZHNHVFZ2EyOTNCQnBuWW9GRENlcE5pNU9l?=
 =?utf-8?B?eS9mbGozQWhBcDFSajV4aTg5MnZiRnh2OE9oSXNBTkVGTUM4OHRjekl5SDc4?=
 =?utf-8?B?b3JNU1JlM3FjSVlNZEpTMHpqSzB1OEFYcDcwQUo2QWhNaUtoK3dsUnJPSDZH?=
 =?utf-8?Q?HFVBihZ9dj87o?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400017)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 05:51:41.9083
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cee19e7-b166-43f8-77ca-08dc6d909ace
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8582

Hi Anthony,

On 5/1/2024 10:46 PM, Anthony PERARD wrote:
> On Wed, Apr 24, 2024 at 11:34:42AM +0800, Henry Wang wrote:
>> From: Vikram Garhwal <fnu.vikram@xilinx.com>
>>
>> Add domain_id and expert mode for overlay assignment. This enables dynamic
>> programming of nodes during runtime.
>>
>> Take the opportunity to fix the name mismatch in the xl command, the
>> command name should be "dt-overlay" instead of "dt_overlay".
> I don't like much these unrelated / opportunistic changes in a patch,
> I'd rather have a separate patch. And in this case, if it was on a
> separate patch, that separated patch could gain: Fixes: 61765a07e3d8
> ("tools/xl: Add new xl command overlay for device tree overlay support")
> and potentially backported.

Ok. I can split this part to a separated commit.

>> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>> Signed-off-by: Henry Wang <xin.wang2@amd.com>
>> ---
>>   tools/include/libxl.h               |  8 +++++--
>>   tools/include/xenctrl.h             |  5 +++--
>>   tools/libs/ctrl/xc_dt_overlay.c     |  7 ++++--
>>   tools/libs/light/libxl_dt_overlay.c | 17 +++++++++++----
>>   tools/xl/xl_vmcontrol.c             | 34 ++++++++++++++++++++++++++---
>>   5 files changed, 58 insertions(+), 13 deletions(-)
>>
>> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
>> index 62cb07dea6..59a3e1b37c 100644
>> --- a/tools/include/libxl.h
>> +++ b/tools/include/libxl.h
>> @@ -2549,8 +2549,12 @@ libxl_device_pci *libxl_device_pci_list(libxl_ctx *ctx, uint32_t domid,
>>   void libxl_device_pci_list_free(libxl_device_pci* list, int num);
>>   
>>   #if defined(__arm__) || defined(__aarch64__)
>> -int libxl_dt_overlay(libxl_ctx *ctx, void *overlay,
>> -                     uint32_t overlay_size, uint8_t overlay_op);
>> +#define LIBXL_DT_OVERLAY_ADD                   1
>> +#define LIBXL_DT_OVERLAY_REMOVE                2
>> +
>> +int libxl_dt_overlay(libxl_ctx *ctx, uint32_t domain_id, void *overlay,
>> +                     uint32_t overlay_size, uint8_t overlay_op, bool auto_mode,
>> +                     bool domain_mapping);
> Sorry, you cannot change the API of an existing libxl function without
> providing something backward compatible. We have already a few example
> of this changes in libxl.h, e.g.: fded24ea8315 ("libxl: Make libxl_set_vcpuonline async")
> So, providing a wrapper called libxl_dt_overlay_0x041800() which call
> the new function.

Ok, I will add an wrapper.

>>   #endif
>>   
>>   /*
>> diff --git a/tools/libs/light/libxl_dt_overlay.c b/tools/libs/light/libxl_dt_overlay.c
>> index a6c709a6dc..cdb62b28cf 100644
>> --- a/tools/libs/light/libxl_dt_overlay.c
>> +++ b/tools/libs/light/libxl_dt_overlay.c
>> @@ -57,10 +58,18 @@ int libxl_dt_overlay(libxl_ctx *ctx, void *overlay_dt, uint32_t overlay_dt_size,
>>           rc = 0;
>>       }
>>   
>> -    r = xc_dt_overlay(ctx->xch, overlay_dt, overlay_dt_size, overlay_op);
>> +    /* Check if user entered a valid domain id. */
>> +    rc = libxl_domain_info(CTX, NULL, domid);
>> +    if (rc == ERROR_DOMAIN_NOTFOUND) {
> Why do you check specifically for "domain not found", what about other
> error?

I agree this is indeed very confusing...I will rewrite this part 
properly in the next version.

>> +        LOGD(ERROR, domid, "Non-existant domain.");
>> +        return ERROR_FAIL;
> Use `goto out`, and you can let the function return
> ERROR_DOMAIN_NOTFOUND if that the error, we can just propagate the `rc`
> from libxl_domain_info().

Sure, will do the suggested way.

>> +    }
>> +
>> +    r = xc_dt_overlay(ctx->xch, domid, overlay_dt, overlay_dt_size, overlay_op,
>> +                      domain_mapping);
>>   
>>       if (r) {
>> -        LOG(ERROR, "%s: Adding/Removing overlay dtb failed.", __func__);
>> +        LOG(ERROR, "domain%d: Adding/Removing overlay dtb failed.", domid);
> You could replace the macro by LOGD, instead of handwriting "domain%d".

Great suggestion. I will use LOGD.

>>           rc = ERROR_FAIL;
>>       }
>>   
>> diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
>> index 98f6bd2e76..9674383ec3 100644
>> --- a/tools/xl/xl_vmcontrol.c
>> +++ b/tools/xl/xl_vmcontrol.c
>> @@ -1270,21 +1270,48 @@ int main_dt_overlay(int argc, char **argv)
>>   {
>>       const char *overlay_ops = NULL;
>>       const char *overlay_config_file = NULL;
>> +    uint32_t domain_id = 0;
>>       void *overlay_dtb = NULL;
>>       int rc;
>> +    bool auto_mode = true;
>> +    bool domain_mapping = false;
>>       uint8_t op;
>>       int overlay_dtb_size = 0;
>>       const int overlay_add_op = 1;
>>       const int overlay_remove_op = 2;
>>   
>> -    if (argc < 2) {
>> -        help("dt_overlay");
>> +    if (argc < 3) {
>> +        help("dt-overlay");
>>           return EXIT_FAILURE;
>>       }
>>   
>> +    if (argc > 5) {
>> +        fprintf(stderr, "Too many arguments\n");
>> +        return ERROR_FAIL;
>> +    }
>> +
>>       overlay_ops = argv[1];
>>       overlay_config_file = argv[2];
>>   
>> +    if (!strcmp(argv[argc - 1], "-e"))
>> +        auto_mode = false;
>> +
>> +    if (argc == 4 || !auto_mode) {
>> +        domain_id = find_domain(argv[argc-1]);
>> +        domain_mapping = true;
>> +    }
>> +
>> +    if (argc == 5 || !auto_mode) {
>> +        domain_id = find_domain(argv[argc-2]);
>> +        domain_mapping = true;
>> +    }
> Sorry, I can't review that changes, this needs a change in the help
> message of dt-overlay, and something in the man page. (and that argument
> parsing looks convoluted).

I will rework this part to see if I can make it better.

>> +
>> +    /* User didn't prove any overlay operation. */
> I guess you meant "provide" instead of prove. But the comment can be
> discarded, it doesn't explain anything useful that the error message
> doesn't already explain.

I think your comment is correct, I will just drop it.

>> +    if (overlay_ops == NULL) {
>> +        fprintf(stderr, "No overlay operation mode provided\n");
>> +        return ERROR_FAIL;
> That should be EXIT_FAILURE instead. (and I realise that the function
> already return ERROR_FAIL by mistake in several places. (ERROR_FAIL is a
> libxl error return value of -3, which isn't really a good exit value for
> CLI programmes.))

Thanks. Will use EXIT_FAILURE.

Kind regards,
Henry

>
> Thanks,
>


