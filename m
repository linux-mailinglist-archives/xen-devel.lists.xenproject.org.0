Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6938E686CD2
	for <lists+xen-devel@lfdr.de>; Wed,  1 Feb 2023 18:24:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488377.756424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNGqA-0000ro-Tj; Wed, 01 Feb 2023 17:24:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488377.756424; Wed, 01 Feb 2023 17:24:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNGqA-0000p4-QD; Wed, 01 Feb 2023 17:24:10 +0000
Received: by outflank-mailman (input) for mailman id 488377;
 Wed, 01 Feb 2023 17:24:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tMue=55=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pNGq9-0000oy-2K
 for xen-devel@lists.xenproject.org; Wed, 01 Feb 2023 17:24:09 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7e88::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a7d7f8a-a255-11ed-b63b-5f92e7d2e73a;
 Wed, 01 Feb 2023 18:24:06 +0100 (CET)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by SA0PR12MB4381.namprd12.prod.outlook.com (2603:10b6:806:70::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25; Wed, 1 Feb
 2023 17:24:03 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::f803:f951:a68f:663a]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::f803:f951:a68f:663a%5]) with mapi id 15.20.6043.038; Wed, 1 Feb 2023
 17:24:03 +0000
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
X-Inumbo-ID: 3a7d7f8a-a255-11ed-b63b-5f92e7d2e73a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eGSW8OWujuZuGjZcsqsXLG0eUR/hLu8bvGEbQN/Buo+/mrNMXVTkdM1dZbmtg6s1zOqEBV6iO4XCuRmrCxNkGGiNhl5tILGdwsmbKVY0Mjo4sj9Z9ovzMUg8MrNDWvOlg+5eRwsw8pSGVDlgMu4fj/giElSGrMrLP2vjxYpF9mLRjUPxKejY6xkBU4s4aK31Qc48msfTO+yBuAiyq5+DX+WS8lvwzZF+RcV21AmBsMVMmznKs26F0BTzxUkgt5Uxv0xS8mn94KbwvVN1cs58Hut7g58mBapVUVpWlNSlDRwFlMxCTHrDD6srNkqSB9VZRLeSmooOeUQYywqouqQyWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OexwS3EpqzFx25dS57WVA010nSmNvsdKxI61GuOTzQg=;
 b=InrT+1M84HNstYAFzufkW1F9RsdX+R2MiHuBR4Z8nRzz010QmR6RMpzfa34O7B+ylE/YCei/xq3FxOj+OZsRz1Wovf4aCJ47/S7jRzFKUdvJVzlTTnXlA/6zwubsrQqxjWNxCFpjczCNGfOpsJPOps+eJi8ML8GEgB1BRIyANmQWbDuS7ULyAoWwTUyLcei/vwFD38Cs/d8ciarC+P8bhE7AwAfySNMifjFJBKJXjNzpZuE3/Q88z4FHHhAh5R6JM8myyyN+jH7fsTIpacDFAeHFE+gU2q4M/JBoLrSFtcUqUd9S0EmjtjsUeHGHT8e8eTrGkm5mfNlXREL6dZfl6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OexwS3EpqzFx25dS57WVA010nSmNvsdKxI61GuOTzQg=;
 b=rYSKEMWpb8NKXZKUoWYzlDTNIpttq9rHBXdpvW5T6CR76Mo4PejsIfHXYNYoVHEfsO3ZHf7cbXEDvr6txjLsx9t98+BaOyfxRRKzHas0+3fKAQG4W35QCupm+4yFwNiXaoeHqBmpLmhVk1RMzKoEdrGsK2qU9s5jY82XOIDW7o0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <2f6df3dc-acdb-3625-5724-4e61da99270f@amd.com>
Date: Wed, 1 Feb 2023 09:24:01 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [XEN][RFC PATCH v4 16/16] tools/xl: Add new xl command overlay
 for device tree overlay support
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org,
 Luca.Fancellu@arm.com, Wei Liu <wl@xen.org>
References: <20221207061815.7404-1-vikram.garhwal@amd.com>
 <20221207061815.7404-10-vikram.garhwal@amd.com>
 <Y5N2lU8f3PVOTNSa@perard.uk.xensource.com>
From: Vikram Garhwal <vikram.garhwal@amd.com>
In-Reply-To: <Y5N2lU8f3PVOTNSa@perard.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0160.namprd03.prod.outlook.com
 (2603:10b6:a03:338::15) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|SA0PR12MB4381:EE_
X-MS-Office365-Filtering-Correlation-Id: bfd26ae1-54e9-4679-5651-08db04791d84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6Viw+BU3U38Q1aW9JcN2JBpaE6y+GPFzwMLrkhZTa8P7NdQZ8DkQxcX7z4xIt8X3DDywr0Dp+GqPcFTSHB2dtsu1WlpPGgbwy7md8U/bl2oEJILIBfu3/1hX3hx3jpzNgNFbI9bZmCpwZqITDPaPSjVNH1xlsxs3Rbe12h309ZFjLkR55rDFsdSSv/Tqm8VKNlW5OXSoMoy5OU+z3LjdmyBnhZrJCKzWTp7EngnKNGkRVQNgFSV3LqMn1oZXzLl59tZ+MwekC7FnRIza2JIAh+P8Kyd1Pk7GK8hEyMIcd2dPrxcIsV9nLx+tTS3MRYYCyE+7YkeZxldnPdNZKlu+2c0SOkpDgghgrR1J6B4LLerESiHVofxeLwZs7RsqCLZ2P2h4uf6qx867fF8oDSaPOPVqJ+DKrnO3t1hzgnt0ISqP+oYJqfMGC6BODP01CAhbvBWzjvwtrteDKvz2o9IqOdEGQax0zi4SZpx7p5Sfc/+BSErAqNBfyssclRRgwE7uHPayKMJYC95wDTL1kUvy7h0Jpkbc42cE2lB4svVedeOPzSZzIE38CzY/PmHjJa2lc1Pb893WSrbfCaRTFKSlAunqwZSuSFXwCFQ/gFKmxotO05PXFWZkjWHkBTs6ExVmI+pY3NPzADM5pW8Z09LTyH7F8C28IJU+xtCBPV4yGxsL8zbhVrSBJ9FVlnU0Gy/HDzJeFiA+/oaMVBj+5dPgMvVyLOUXLHcmKB2TB59THi8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(346002)(366004)(39860400002)(396003)(451199018)(5660300002)(31686004)(44832011)(41300700001)(8936002)(66556008)(66476007)(6916009)(4326008)(31696002)(66946007)(8676002)(478600001)(6512007)(26005)(36756003)(53546011)(6506007)(186003)(83380400001)(2616005)(2906002)(38100700002)(86362001)(316002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnplaTJ2aHJlcVZOa0R3WUNCTlpoaWI1WXA3dkppODRwVDNOM2p6STVYQ2JW?=
 =?utf-8?B?SElMVGZnSkhUbjBEY1FLTHhOTzF6RHlIbGQ2cVh5MWtOVWJXUXZ0MW85QVFh?=
 =?utf-8?B?S0VyanZPUzVTcmpwMXJDYUhHbzhmb1d0VWY2blhZcGROVzM4NWc3TkxDc3E4?=
 =?utf-8?B?NEVuOTlDV2V1MC9DblNpeWtzeFFrTDdycUpYQUVSdW5Ob3NBVlpNZlJDRUN6?=
 =?utf-8?B?SkFRS29oY1hvNXlSNXl0N0RVZUN1bkxFbHVleWk5REZRcG5Kd1pDRXBic1Yw?=
 =?utf-8?B?bFdSMloxdGYrdWNGbm45WGRybnlHc1BSekpiWDk1ZWt2cjhJVS95WFZnNHM4?=
 =?utf-8?B?UFc4QUI1c0ZvZ1FTQkdZcGw4ZjlnVjJuL01hRE5RMm03NzZjZ1ZGcUtkTTVO?=
 =?utf-8?B?WXhTRzZaYml5Wk91THlyR3gwOTlueXltWDBzYTRwYVNIK1FEbm1QRVZVTVpM?=
 =?utf-8?B?dTkzZkU3dG9BcUFNSWNabEtndVFSa2c2Nm1GMUtPSWhYMmMxMkJMOWd0NmI3?=
 =?utf-8?B?bUhiYW9lRzlIUFJWNDZpUmdIalpMeERZbkU5LzdkR3kxWTJsUEhGVHk2am1m?=
 =?utf-8?B?Sjh0ci9ITE5OVklaODlSMGowWXRrVGdxNjhzdDdMenZuTk5xOXNIMlp3ZE9n?=
 =?utf-8?B?aVhaWGVxWU5iSVV1cEZCdEVRRlA5eGpKOUhBaVNDTG41VktvLzU3Z1p1S1FI?=
 =?utf-8?B?V2p0NzJnWnFlMStQU3pTeUtlMTRFTDc1L0N3YUVLamg5YmY0VXNsNWdGUWRT?=
 =?utf-8?B?UFVISE12Snk2ZFhOUVdYS2FYU0E2VW02UXpyWlkwMXBLVmY5Vys0YTVrenVu?=
 =?utf-8?B?YlpPSlNuQzBoLzVZOVJhNGM0M2xMZkFTRzMvMGV0akVnTElyRjBxVjhGblNO?=
 =?utf-8?B?bWVPYmxuSjhQYldibjd3U3dlVVVnRTA4MGFuRU9wNkdZZmNoUHBGYkd3dHB3?=
 =?utf-8?B?Q1pUWEF4OGM0VUkwVFRIV21CNVFRQU9vaXpLdXdlb29PQlBxdE8wZUJxRW9m?=
 =?utf-8?B?eDFLZVNYNDcvK2hlQnhyWDRnWWpqM1l1RXo4VXdKaU8raHBpSXF1ckdBa0k4?=
 =?utf-8?B?M1JKUktRUEs3UVZMQnlPMG00VG9YdmVkMHl2M0Qxd2xTSjZwaGtXZ1pYSndm?=
 =?utf-8?B?V2lEclNHaWkzd25xTEhYUVZQZ1NUVXNRSFY5cldyOW03aUxndzd6Rm5QUUt2?=
 =?utf-8?B?bjcxZXhTcnhKdFJkVEtEaHVoZHdvc2NENERVRFJMbTdiaXEwcnJVVmZTa0VG?=
 =?utf-8?B?SWd3QVR4eGdLQXR5V3pMeFd4RWpuUUxmQnIzaXE3UlNHNzRmcWZiV2Zybity?=
 =?utf-8?B?OFU5VUdrb2FvS25nNGFWMGg5SE9TMFJlQUo4RktrU0ZxNXJNbzg5NFV2Vk9y?=
 =?utf-8?B?VHVld1ppTnNiMzllY3pKT3RxNmVmS2ovY3psbWhhVXByRjZFSUpLVmQxRXVF?=
 =?utf-8?B?SWtRa2pMemZqdzQzN01CSTNEN1o0cDNWcGUzdVFTZHlIMVlIVmF6R3FldlVD?=
 =?utf-8?B?WmdnbHE2NkpsKzZIU0ttMDh1KzZONnl6ZlZpeVJPZU13UUxwTkEvMklkNHFO?=
 =?utf-8?B?UHhqc3p1d2JHcHBjQmhxcC84aTE1UmlTVmJ3dU85cGZwb201ZnlnUC80dlJk?=
 =?utf-8?B?Ri9JSlBGc0pRanNVakg0TzNmdmM2SGl2QWhveHB4WGxlYkFGb292Y1N1Ry9C?=
 =?utf-8?B?NE9EWFB4ZmZVZ2syZnphY0thVHl3ZmJhNVhnWmRIZTJSZ2xxQ2xDU1hjTTFJ?=
 =?utf-8?B?YTBMcndMM0RPL0NVUFF0Mi9kK3ZpZ3Z0MmNWdGc2M0l0U0VYQ2dzbG9ZbFR4?=
 =?utf-8?B?NkJZWmRseEkzSUcrcldORnRzamxYKy9qRXEwUld0VnRFcEplYmgrWDdsR25V?=
 =?utf-8?B?VUI1YXd5Wi9CVXJobVlVaDFNTkY3YngrcHdKUjZhQXBhNDVqVkU2bzRiaTgy?=
 =?utf-8?B?M1h0c1UyWWh1TVJCWERhM1Z5UWZtb3BUSXE0V3pYNkpLc1p5RWw4SlJQb2xa?=
 =?utf-8?B?em9hSDNTT1cvRWJMeFpoeVpzYy9aZFVXaXo5MDFaVnJQTGNMRXI2eGIxS01m?=
 =?utf-8?B?UHMzTVh6SnZLbTh2cTFjNC9nV3J4ZkNvWXFiUm5RRjdOdmNpbkdXUUJPQ3c2?=
 =?utf-8?Q?1Jsb+6KJOcPukEhY5WzT9NsR/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfd26ae1-54e9-4679-5651-08db04791d84
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 17:24:03.7385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6FTMpZ3k09d6DhdECWmrqvssmJkSMXI517qfHsAZiU+pnOtCC8bMwPHHciBaAfpINjvOLXhqZU1fQ+XwXcBIMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4381

Hi Anthony,

On 12/9/22 9:55 AM, Anthony PERARD wrote:
> On Tue, Dec 06, 2022 at 10:18:15PM -0800, Vikram Garhwal wrote:
>> diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
>> index 35182ca196..868364c58d 100644
>> --- a/tools/xl/xl_cmdtable.c
>> +++ b/tools/xl/xl_cmdtable.c
>> @@ -630,6 +630,12 @@ const struct cmd_spec cmd_table[] = {
>>         "Issue a qemu monitor command to the device model of a domain",
>>         "<Domain> <Command>",
>>       },
>> +    { "dt_overlay",
> Command with multiple words are using '-' instead of '_', could you
> rename the command to "dt-overlay"?
understood.
>
>> +      &main_dt_overlay, 0, 1,
>> +      "Add/Remove a device tree overlay",
>> +      "add/remove <.dtbo>"
>> +      "-h print this help\n"
>> +    },
>>   };
>>   
>>   const int cmdtable_len = ARRAY_SIZE(cmd_table);
>> diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
>> index 5518c78dc6..b5f04e2741 100644
>> --- a/tools/xl/xl_vmcontrol.c
>> +++ b/tools/xl/xl_vmcontrol.c
>> @@ -1265,6 +1265,54 @@ int main_create(int argc, char **argv)
>>       return 0;
>>   }
>>   
>> +int main_dt_overlay(int argc, char **argv)
>> +{
>> +    const char *overlay_ops = NULL;
>> +    const char *overlay_config_file = NULL;
>> +    void *overlay_dtb = NULL;
>> +    int rc;
>> +    uint8_t op;
>> +    int overlay_dtb_size = 0;
>> +    const int overlay_add_op = 1;
>> +    const int overlay_remove_op = 2;
>> +
>> +    if (argc < 2) {
>> +        help("dt_overlay");
>> +        return EXIT_FAILURE;
>> +    }
>> +
>> +    overlay_ops = argv[1];
>> +    overlay_config_file = argv[2];
>> +
>> +    if (strcmp(overlay_ops, "add") == 0)
>> +        op = overlay_add_op;
>> +    else if (strcmp(overlay_ops, "remove") == 0)
>> +        op = overlay_remove_op;
>> +    else {
>> +        fprintf(stderr, "Invalid dt overlay operation\n");
>> +        return ERROR_FAIL;
> ERROR_FAIL isn't really a value to be used when exiting the programme,
> it's value is -3. It's from libxl API.
>
> Instead, could you return EXIT_FAILURE?
Will address this in next version.
>> +    }
>> +
>> +    if (overlay_config_file) {
>> +        rc = libxl_read_file_contents(ctx, overlay_config_file,
>> +                                      &overlay_dtb, &overlay_dtb_size);
>> +
>> +        if (rc) {
>> +            fprintf(stderr, "failed to read the overlay device tree file %s\n",
>> +                    overlay_config_file);
>> +            free(overlay_dtb);
>> +            return ERROR_FAIL;
>> +        }
>> +    } else {
>> +        fprintf(stderr, "overlay dtbo file not provided\n");
>> +        return ERROR_FAIL;
>> +    }
>> +
>> +    rc = libxl_dt_overlay(ctx, overlay_dtb, overlay_dtb_size, op);
> Value returned by libxl_*() are going to be negative when there's an
> error, so not something to be return by main(). Could you check if
> there's an error and return EXIT_FAILURE instead?
Okay.
>> +    free(overlay_dtb);
>> +    return rc;
>> +}
> Thanks,
>

