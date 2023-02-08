Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE19768F260
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 16:51:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491905.761260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPmjD-0002iD-Gt; Wed, 08 Feb 2023 15:51:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491905.761260; Wed, 08 Feb 2023 15:51:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPmjD-0002fo-E4; Wed, 08 Feb 2023 15:51:23 +0000
Received: by outflank-mailman (input) for mailman id 491905;
 Wed, 08 Feb 2023 15:51:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/3BG=6E=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pPmjB-0002fi-P2
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 15:51:22 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20602.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6cc8d5c6-a7c8-11ed-933c-83870f6b2ba8;
 Wed, 08 Feb 2023 16:51:19 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by SJ1PR12MB6265.namprd12.prod.outlook.com (2603:10b6:a03:458::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36; Wed, 8 Feb
 2023 15:51:15 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::a3a7:87d9:60f1:7eb1]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::a3a7:87d9:60f1:7eb1%4]) with mapi id 15.20.6064.032; Wed, 8 Feb 2023
 15:51:15 +0000
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
X-Inumbo-ID: 6cc8d5c6-a7c8-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z6xHexLB+U3bx/nrchIMkcWvCYjXZIsTMslDyH14SxUKVZpYckZFg6vj9LHJL7L8hmxVIgOoPm8DANO+f5g/zCPa9NXqaLCwCiLPLTW84uEIKVk9QPG5Cg7CXSI4AvZRld1BfPsMVQxoZakkD+KzSWZbiRJUra3LKqVQI9UXghsIgI4zd4YjCwT/4q8VA4xhA6EzNfrIEjNb2Vj67ZFTGiWDL3EqamhH1MN3tm5bnEZc4DYS2wp/AqesZG/w+S5lLon9D/jpZXSx/jDVXShY8wlj124kQC24dxgDGEj9srTvbKl0DuOgRkzl+/jIdxeeLh5Oc+/h1ZfZov1xbSWHZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jfm/pEyLeRy4g+nxOzs+DogaTR+Y6/Oh3dLy89tCDHE=;
 b=ekQiT2wJFUo+5muWM6FnYtanXcTlodII34NneJA8B+trY8pArtf4Bp+QDl9mKlMvALNhlPy3MYuTrw/EwJWRB0Qmra/9toakVDp52DU9xobqqEv3yDH2I7w0jgkKGKSj/ZulOC2M5MLIwNIOcAXc+zSe05649/fY2BKpQrOLnoPkDUiAqnlXov/Szw9AfV52gfdeLeh46C2I2CCax6D44hKNDxszpRPcIkw/9OYyfMm/SU7D2HtkvWR0qMsQZa9DvI3/iHClTznZNi01VjcgyUqRCD8YW/yl8N1fUc/nxXlqvFuSDMjupDGEdzx4nL4U1L/nnUqErxa7Wmls+aTx8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jfm/pEyLeRy4g+nxOzs+DogaTR+Y6/Oh3dLy89tCDHE=;
 b=Kkgw41Gx2om5GrCbRJTmZbFfbPQWo3kdGCS5slMPJgJsHG66IPAcB/zNWelmH+GGKQovDDHB9WmE7N+SQOiF4LYEf0JqqUPvoJ0rthl1NAx5psOrutCgxEg5bPrIRmjl/fMRwRGygQLfRDmuXbh4ogNbyNuqto+98NXYP+euY64=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <a594ba69-e4e8-5f51-f625-50171f22bc77@amd.com>
Date: Wed, 8 Feb 2023 15:51:07 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [XEN v3 2/9] xen/arm: Typecast the DT values into paddr_t
To: Jan Beulich <jbeulich@suse.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, wl@xen.org,
 rahul.singh@arm.com, xen-devel@lists.xenproject.org
References: <20230208120529.22313-1-ayan.kumar.halder@amd.com>
 <20230208120529.22313-3-ayan.kumar.halder@amd.com>
 <c11f89da-9487-1e32-57b4-2ddd1142c6cc@suse.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <c11f89da-9487-1e32-57b4-2ddd1142c6cc@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0609.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::11) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|SJ1PR12MB6265:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c9b9af1-b450-48d3-7ba4-08db09ec4f38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	s1jQpE+r1lDwS2by70frrxb6EkD5aCd23cmk/UTAqq8wUKeNMAZpvJg/swbevfwl4i5t32JAQASj4UwBBZC9Ft8JdCjWIUXwKZTIEqiyaLlq8XOjLJM87wix449HIjFdfQO41w+UEcALdb5UPCXzF2b0ZDwAurdq4xO3WPjmaadQqqTyk4hhBBlwPhyHLtQmaZ9DkIA72wl1J7eB4PT0yhZH1hJLQ+EbJlf3CCs1Eh00mwxASxk8SSkWnFDQ2vXzjO3It3Atj9UGVczfQQFP159veYtr8X+6TvtXh086uVjEUf1mplmCHCJc59m7zvBhhkdGH2nq1CGMOS94AP3trE53F8sHcLZcYXeccHZTtjFTP1JEapxBLPCBeI84BVD0/lih17eYAaITnZQaVY5t0rBX+OaBEWyE1ooanvf/t1jA3Gi2Fj/gc6eajyZWdt1SIg7lk/HTSlhwbL89UaftYE8ItxJs2os4GN8B2Ia+DmA50t9n+zYQ946nxU9ux4DZdRk44bSjDQf9jstVXHvMDLk6+wYMkjIsbe4iigMXFREng4XU3Gt8eM/ClcPmmDCKsYzbyFXDkGuYU8s6Djy01vTL1k4dVtjXZvnSHBySaSgNs9n8TGmnCMt69Jq9fgPGfqLrUI4GehbutLZOMOJvTjxLjteiglqkizT1C+TX5oepDDHTARAEopmSQNIa2jAMdtaL7fAV6WelMGKFQ5hgcSvF0yIeKKrpQuOoUMacmEI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(376002)(366004)(346002)(396003)(451199018)(5660300002)(83380400001)(7416002)(31686004)(8936002)(2906002)(41300700001)(36756003)(2616005)(4326008)(6506007)(26005)(186003)(6486002)(53546011)(6512007)(110136005)(6636002)(66946007)(316002)(66476007)(66556008)(31696002)(8676002)(6666004)(38100700002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azl2Z3dyTXhob1MvWUVxeVVRZUlxVHVVeldZd2NNS1ArS2l0M3pVUVY2cTdj?=
 =?utf-8?B?L3dUK3NyWmw4YnVlaFV5Z0ozSXU4d0tnQUhjdTVjODlna3VDM0k2RS94endv?=
 =?utf-8?B?Qm5ydTZyM1Z1eGZLcy9MQkpPcUpmV25KS2ZKU2FuYnlRWndaUzRDL2JEeWNo?=
 =?utf-8?B?d2VDQzJhSlk2eDFZckFYNS9lNkQxU2JFdDdEbmxlOU5ZdzI1MlpBWktMWDNk?=
 =?utf-8?B?WWtvSlp0enlOVjIzaGRuR1h4NXpKYURyUW9ncVQ0UDRCU2ZjZlhOU2F2bzZE?=
 =?utf-8?B?bmFhNGM0S0NCZDBSR2x1dldvemN3ZGhDejRIcnJldUNTMkFtRDhOcFNSdHdh?=
 =?utf-8?B?T1AvYUdIeTN6NFpOZ0VvajdIMTZjZ28xRFMyYnlIMitjUmwzTXJJSklnd0Jo?=
 =?utf-8?B?YUxnbGhQUE1pQWJ3eGFHTkpSdWhaVFZ5ci9XTkF6SXdKSjlHTFhRMWNYNnQw?=
 =?utf-8?B?REdwTGw3WGFmRlIxdmZKbEpvdjVVeDQ4ejUwWUxYbFNObXRTamdJZjFhV0JS?=
 =?utf-8?B?NmJSTWFiZnFHM205cy9SQno3SURqR2FUSm96Zm1qdFo0RjE2aytJQ2Y3K0R2?=
 =?utf-8?B?NHkrQnUwbUsrYnA2Kzk2WFlBTmZWU1c4RVVpaWpKMG85dDFhNEs1MkloMGNr?=
 =?utf-8?B?RjZ6RndwZWdld0ZaYzBpdHRCVGl2UG1QU25wS292cG5nVjFjd2hOYm11VnBS?=
 =?utf-8?B?SUZZZG90WWRNWVdESVpIeVR1d1QzSTZxTHhVVDhzcVpIemhrNVRWaUVNblg5?=
 =?utf-8?B?SWEvNUE0RmxLaVJhM0pXRTdPRTk5TmJseHJpaDZVdFNabHJzNUYwRk5RNXdP?=
 =?utf-8?B?RnFsdDEyZ3dpWjZJa3krSDNIUlN1NFYrNGNLQU5YOTBubytpRUlvVFo0MjFQ?=
 =?utf-8?B?UjlvcjZaZlFyV1lobVJsMXdkeUVRVElHak1BQUJmVTNsWE5uY1lEOXNUZG1B?=
 =?utf-8?B?bFNVN2M3ck9HZTJiSEFWb3R5bnNKTlBjM013NFpmU24rQzM0aVBiTHJDMm5y?=
 =?utf-8?B?K0VyUkRESFN5TzBwdy9EM3U3WUlnek9HcVdyNFZDSXRjVXNHVURRdSt1ZUpy?=
 =?utf-8?B?TmxiQTg1Mkt2akZZOTFhVG5icGJrM1lqL0pSQWJaTlpVeHhuMm9oemhub0E3?=
 =?utf-8?B?anNLNTZxNTlzZTB2M2UyYkF1RStIbnNuLzBjdjcrK3ByRVVCMWR1S1NTTlN0?=
 =?utf-8?B?M01MQklvajhuMnVoZ0xEbGpIQzNITFkvZElqSlU5ejdTWGw4WlFQcFN2SFBG?=
 =?utf-8?B?L0RQakF3cW93aDRrWXI2UjczNjlzaXBGQ1UwNWRXM2tia1RueCtHQ0tuakJz?=
 =?utf-8?B?aVNNS1RyYU9EQ2JTaXV3YlNpSE9sNXRoQlRMdXdTTldSUFBDVWZTK1JjQ25Q?=
 =?utf-8?B?TzNCa2c1VjlPU1ZCUytncG1DcmdUN0I0YUkvYWJzVmFocVhRelAwNFJER3Fz?=
 =?utf-8?B?c3liRmorNDZBcE4yYVg1YnJRdWNQYVJnS2JBUDNyRk0wUm9FMHM4bXVqdWZs?=
 =?utf-8?B?STk0Y2xFNVJZT0VmeTQ3Y3pHQ3FtaGRvaWVRYllnVkdmdzNacmRXMXpDeTN4?=
 =?utf-8?B?WThieDNRNm1sS2l5WlFEZER3TUh1azlVbENVRW9IQ2w3cU5CYzA2QUtqYVFi?=
 =?utf-8?B?M2tpak9hQVFKRW9ueVpyZStpS3Z4UEdmYnk2clg2RzBMVEJHTFlESkpnRWdw?=
 =?utf-8?B?OGtEcmlDbnQ1cEd5UnNxdEI1UWI0a2FRSUZlQ244b2QzMXErYnJMVmlkdHR0?=
 =?utf-8?B?SFFKTVMySWlmWUlqUlZTbEdrWjVEUHV3dG4rVmFtbVFZcGxYUHNoMDd4UkNm?=
 =?utf-8?B?M0gxdGk5YTUrQjdVVk14cThVdG5QbXluSUxoM3hUZ05malhPSlhiblBTbmo5?=
 =?utf-8?B?U213TU1mdllzcVp6bUhhZnZ1U0Ivb3RMdC9qZE0wYm5IRzRQWHMzbzNTV3o5?=
 =?utf-8?B?Qjg2QXlVNFF1RUk1VWhnc0xheWdSK1Q0b0JYODkxNlFaZFBncGJkMGI0d0RK?=
 =?utf-8?B?aFZNVGIya3cxT3BrbEJZc2NBZEVlTjBhOE9lZlVwRm5nMTZHajJvcW9MSklz?=
 =?utf-8?B?aTRTd2thMnpyTHU4c0NNL1hoWU42cG5pYStwZmE3a2xJNkNpdjIvYVRtbFpU?=
 =?utf-8?Q?klmlhONh4EYWN8a+HapQMta+e?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c9b9af1-b450-48d3-7ba4-08db09ec4f38
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 15:51:15.1746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hM9eR5vYJdSGZfy/tU8Lt+PsraoyN1qpjQyed6fMKIie5KU4peEkVDjgIzr39crzbIIZj4UtqDapyUtUK0P2ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6265

Hi Jan,

On 08/02/2023 13:33, Jan Beulich wrote:
> On 08.02.2023 13:05, Ayan Kumar Halder wrote:
>> In future, we wish to support 32 bit physical address.
>> However, the current dt and fdt functions can only read u64 values.
>> We wish to make the DT functions read u64 as well u32 values (depending
>> on the width of physical address). Also, we wish to detect if any
>> truncation has occurred (ie while reading u32 physical addresses from
>> u64 values read from DT).
>>
>> device_tree_get_reg() should now be able to return paddr_t. This is
>> invoked by various callers to get DT address and size.
>>
>> For fdt_get_mem_rsv(), we have introduced wrapper ie
>> fdt_get_mem_rsv_paddr() while will invoke fdt_get_mem_rsv() and translate
>> u64 to paddr_t. The reason being we cannot modify fdt_get_mem_rsv() as
>> it has been imported from external source.
>>
>> For dt_read_number(), we have also introduced a wrapper ie
>> dt_read_paddr() to read physical addresses. We chose not to modify the
>> original function as it been used in places where it needs to
>> specifically u64 values from dt (For eg dt_property_read_u64()).
>>
>> Xen prints an error when it detects a truncation (during typecast
>> between u64 and paddr_t). It is not possible to return an error in all
>> scenarios. So, it is user's responsibility to check the error logs.
>>
>> To detect truncation, we right shift physical address by
>> "PADDR_BITS - 1" and then if the resulting number is greater than 1,
>> we know that truncation has occurred and an appropriate error log is
>> printed.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>>
>> Changes from
>>
>> v1 - 1. Dropped "[XEN v1 2/9] xen/arm: Define translate_dt_address_size() for the translation between u64 and paddr_t" and
>> "[XEN v1 4/9] xen/arm: Use translate_dt_address_size() to translate between device tree addr/size and paddr_t", instead
>> this approach achieves the same purpose.
>>
>> 2. No need to check for truncation while converting values from u64 to paddr_t.
>>
>> v2 - 1. Use "( (dt_start >> (PADDR_SHIFT - 1)) > 1 )" to detect truncation.
>> 2. Introduced libfdt_xen.h to implement fdt_get_mem_rsv_paddr
>> 3. Logged error messages in case truncation is detected.
>>
>>   xen/arch/arm/bootfdt.c              | 38 ++++++++++++++++-----
>>   xen/arch/arm/domain_build.c         |  2 +-
>>   xen/arch/arm/include/asm/setup.h    |  2 +-
>>   xen/arch/arm/setup.c                | 14 ++++----
>>   xen/arch/arm/smpboot.c              |  2 +-
>>   xen/include/xen/device_tree.h       | 21 ++++++++++++
>>   xen/include/xen/libfdt/libfdt_xen.h | 52 +++++++++++++++++++++++++++++
>>   xen/include/xen/types.h             |  2 ++
>>   8 files changed, 115 insertions(+), 18 deletions(-)
>>   create mode 100644 xen/include/xen/libfdt/libfdt_xen.h
> Can you please avoid underscores in the names of new files, unless they're
> strictly required for some reason?

Actually I introduced libfdt_xen.h as I did not wish to modify the 
fdt_get_mem_rsv() (present in fdt_ro.c).

So I created libfdt_xen.h to implement fdt_get_mem_rsv_paddr(). The 
*_xen.h denotes that it is derived from * (which can be modified like 
any other file).

Let me know what name you suggest.

>
>> @@ -53,10 +53,30 @@ static bool __init device_tree_node_compatible(const void *fdt, int node,
>>   }
>>   
>>   void __init device_tree_get_reg(const __be32 **cell, u32 address_cells,
>> -                                u32 size_cells, u64 *start, u64 *size)
>> +                                u32 size_cells, paddr_t *start, paddr_t *size)
>>   {
>> -    *start = dt_next_cell(address_cells, cell);
>> -    *size = dt_next_cell(size_cells, cell);
>> +    u64 dt_start, dt_size;
> No new uses of this type (and its siblings), please. We're in the process
> of phasing out their use. See ./CODING_STYLE.
Ack
>
>> +    /*
>> +     * dt_next_cell will return u64 whereas paddr_t may be u64 or u32. Thus,
>> +     * there is an implicit cast from u64 to paddr_t.
>> +     */
>> +    dt_start = dt_next_cell(address_cells, cell);
>> +    dt_size = dt_next_cell(size_cells, cell);
>> +
>> +    if ( (dt_start >> (PADDR_SHIFT - 1)) > 1 )
>> +        printk("Error: Physical address greater than max width supported\n");
>> +
>> +    if ( (dt_size >> (PADDR_SHIFT - 1)) > 1 )
>> +        printk("Error: Physical size greater than max width supported\n");
> While I assume you wrote the checks this way to avoid "shift count too
> large" compiler diagnostics, personally I think this is making it
> harder to recognize what is wanted. Already (val >> (PADDR_SHIFT - 1)) >> 1
> would be better imo, by why not simply (paddr_t)val != val?

Yes, makes sense.

I will use "(paddr_t)val != val" to check for truncation.

>
>> --- a/xen/include/xen/types.h
>> +++ b/xen/include/xen/types.h
>> @@ -71,4 +71,6 @@ typedef bool bool_t;
>>   #define test_and_set_bool(b)   xchg(&(b), true)
>>   #define test_and_clear_bool(b) xchg(&(b), false)
>>   
>> +#define PADDR_SHIFT PADDR_BITS
> Why do we need this alias?
I could have use PADDR_BITS instead, but decided to use PADDR_SHIFT for 
cosmetic reasons.
> And if we need it, on what basis did you pick
> the file you've put it in?

I wanted to put in an arch independent file (where we have defined 
macros related to data types).

- Ayan

>
> Jan

