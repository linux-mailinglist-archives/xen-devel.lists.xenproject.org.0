Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 321DF65E881
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 11:00:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471777.731770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDN2V-0006pB-FG; Thu, 05 Jan 2023 09:59:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471777.731770; Thu, 05 Jan 2023 09:59:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDN2V-0006lm-BG; Thu, 05 Jan 2023 09:59:59 +0000
Received: by outflank-mailman (input) for mailman id 471777;
 Thu, 05 Jan 2023 09:59:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GSs2=5C=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pDN2U-0006lg-12
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 09:59:58 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b39c3a16-8cdf-11ed-b8d0-410ff93cb8f0;
 Thu, 05 Jan 2023 10:59:54 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by PH0PR12MB7981.namprd12.prod.outlook.com (2603:10b6:510:26c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 09:59:52 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9856:da7:1ff1:d55c]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9856:da7:1ff1:d55c%5]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 09:59:52 +0000
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
X-Inumbo-ID: b39c3a16-8cdf-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nsVTOw4vHJEFa7Uz+G6Nx/OkRvX/htpyZ2C4dcMKZcw9w1hhcg2h9T0X1D5FyOcHtlzmepZY0y4XFNepiTfg4zzppTdO3zcw2MO7XqklyH6XFbdAHqAQq8TpJAsPSjf39pL6YnbVAJIaR/kJwzPOjXRmYERBbdC4azJoAs7eavbWEnZLcWFTj//ShRPtdHMWaKXBxZ30mhd8WmVaeUYEr7fQOBEfxUFzcOIg6WEPFrPUQVXYFR0dQtVcHSEe90wMbnANEyMMsJ+4bmdC4p7ZInd6W1P2myAT/W5qH+t+GsgjxU9o3zqFnk0dk1VJ6gGN8PeoWvrKu8XAOcyIz3nYfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jlfi8Xu69UjMjxtpqFoHVECk8dVZwxh51RO7VwTAM48=;
 b=TLmNfUTQuLWX7EhxfwEH95orLp/iaAY7w0apawK0ZkdQh68PX2GPdATL9swzssEmKpxg/snldHvv/Xrw1I9kdhL3hOh9pzmS5U04kPj+Zz1rWeEK16qgKmEssMwasZ+hSr53KvfGL1Gbv5bKrfQNiU1Cp+3FvSLg6ry/90JUoSNTQrvCQbOz+0pW/HtFFZIc9234gSUxcw1cxTobWpiA/5SrsN7rDjUMH3Ip2y+FAN16kR7HT2G6DlPHL6gyObW9ssFSYajsTVWTgCx3DD4dsgcITxTfAWGMxsCongdXDpnAF145p3mTgHyCpKu+zS5SiHhXVjd0WjEdFJrFZHQLzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jlfi8Xu69UjMjxtpqFoHVECk8dVZwxh51RO7VwTAM48=;
 b=pVEqIUntoznkKqsbVSPlQVsaOhdUA6SKcecfwgvt79X65QsBpUf0YLqHJiYhKocOfKGF/g6vt79uBRAJ1n70N9V+R1RrgtvJlPM6kjOYJsc/4ltyQZrILqj0Tdh9hA9O3DGp8EGJexy8tHOXJCFqb62wvrR4/5x9fi7azgSvzAE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <29460d07-cd43-7415-7125-6ed01f3c2920@amd.com>
Date: Thu, 5 Jan 2023 09:59:47 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2] xen/arm: Add 0x prefix when printing memory size in
 construct_domU
To: xen-devel@lists.xenproject.org
References: <20230103102519.26224-1-michal.orzel@amd.com>
 <alpine.DEB.2.22.394.2301041546230.4079@ubuntu-linux-20-04-desktop>
 <1264e5cc-1960-95d3-5ecb-d6f23d194aa4@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <1264e5cc-1960-95d3-5ecb-d6f23d194aa4@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P265CA0027.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::13) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|PH0PR12MB7981:EE_
X-MS-Office365-Filtering-Correlation-Id: 60671af0-5172-4eef-b952-08daef0396fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U4+Gu5nLXaIGuEav96iRWDJwNL5AQ9JLlm/T5mCm5Yli8ZdDtzRvmr5y2YY4RHE0SrFSaSnB9pkDusHlxe6vMQ+aFJ5WhAsW8xLFfrW3WVQE1RAYSjndSOTaN4c6SWFsOYMYIi1B8FsrCr5IEyr3V74+U+Mhp4ujQo1KpqqIEoseexUl8EDVtm6qRkG8OjVzkYNpWYardoYr7+ueY3u1HWDGh/0BgeB6B2BVnKyxnVRjmrZfflwlpp4IBWVeK0G3l+iDSBrTUFVMV9DtHxlKB3hpFltJ5CHez/o9gvA1s9g7zgGLT+jc30dlRmwZVBaRLhrVQt4l4ZnOWJY53Vz0+BcVGW4lrz/I7SPpHAa/h2+SfwOu14R/rwCBDlif1sn4+bAT4wCuYkYwaQ77182+ISQYlant9HijqzhuzGmW7s9B3Zm2eKXkbwwlVJyWYCtY+Tp7sgyjQoZtR3PNvKckrFbCglVDAHItddMPgUDIwMQLAkjifyMSTVuRS/BaPXSJ9+81hAylqQHm+1aIoRHhGnltUe5ESI24QnunluqMQ2dtUGHkEKRi3KU++U9KkQvSOtYAPjKC1heBa/+UdcBD52a9OYkfCuchxbIqJ42P8FBGNwgt0jSx9QiOaIcExnqBClnGgvdLk6+8O+ZiXvIjv2tlzUP0meRdd7yfFjJfkGT2IcFyyWiNDXygCo7iYsGmcDPnN0Zs3EUZRw6e6I4ETq9C3Ousf4ibji32yLB0KDk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(39860400002)(366004)(396003)(376002)(451199015)(53546011)(66476007)(66946007)(66556008)(41300700001)(6666004)(6506007)(8676002)(316002)(2906002)(6916009)(26005)(31696002)(186003)(31686004)(83380400001)(478600001)(6486002)(6512007)(38100700002)(8936002)(36756003)(5660300002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmlqNnVsZXYrSnBEcTdjdzV1VE45TlpwRW1PanBVd3liekV2Rm9aWmJuVitS?=
 =?utf-8?B?LzNhbjBXR1ZSNVFKNGVsTC9yT1lqck5YcTZUb2toenhrbURON3FLUDNZUEkz?=
 =?utf-8?B?YWtlN3Vjd0dNQlM1L0p6S2Yzd2pHa1IxS0JWWWpGMDFDZ2t1aDFoa2tVODU0?=
 =?utf-8?B?TXVDSEdSbmVXWHRZcy83czdjNXllV3pPUlpVMTVRdllEc1BGbzVPYTl0S1JZ?=
 =?utf-8?B?OFA5SjNrTTBncDBWVThQZ1B1Z1BzdEhvTUlQNnZQSDVsL2dtYzVVaENRdnNm?=
 =?utf-8?B?SVJxR28rZy95ZTJCdGE3eGY0Q01sTnhHOUkrZWFEZndBR3gzT3ZqR0t5bmVN?=
 =?utf-8?B?cTA3Skg2NmhPRzZDTlB4ZldqZ0hROTNyK0FuT00wdlFoMTEwc0F1MEpaSDRr?=
 =?utf-8?B?eW94SytBSFBmbXd2R1pXb2hPYzJ5bG5vMXdWWkJkOWJERXZldW14c1ZTV0ZG?=
 =?utf-8?B?R3JVMDk1c0hMc0pURnZHVWRZNUFkZldjRkNreG0zbUtSTGxhRWlkVm5VNmxW?=
 =?utf-8?B?dFB5MlNHYzVnVXZyMFp0eDc2OU5QUkVzeGZwQ0VSMGUrWnpmV3ZuTlltaXFk?=
 =?utf-8?B?dXhxb2J2N1BXTnpZQVlOOC9KMW9KWGpneVJwYnVVRDhRZU40K0xPSUIreVBj?=
 =?utf-8?B?NHorcml6ei9kOFpNRCsvZmlDSHZERUIvTy9UUHRYMFRXaitFL21mckdiWmlF?=
 =?utf-8?B?L0tQMzdqZXJ6ZzgwdEd0NWpVZ1NmYjBNc0FkVko3QTJLdlRXS2xVMnY0aDIv?=
 =?utf-8?B?NGdZdlN5cXRKOG9weDBqNUlCWkdWQnkwYTRVVC9Zd3hVUzBpd0ROcWxmSTho?=
 =?utf-8?B?YnpIVjJxNjVjZlZjMVUrZHhDYk55cm5VU0gwL3VldzlIV0pGditKK3B2RWtn?=
 =?utf-8?B?aUJ0Z3JENEQ3L2NtQ0tBZ2VOdTV2SmJvNGk4VURORms5QWhlYUk5S3dHaFh2?=
 =?utf-8?B?OGV1YlVyc25PR3NIOW1Ca290ZFkrTGRiSi93WjBxZXdkV08xaDZ2NGViRDFU?=
 =?utf-8?B?dEQvRmYyRTlwTlhBMFlFN1V2WVpydlNvTlBBUHJVeFFpbkhhSmVsOHlKNExt?=
 =?utf-8?B?Wk80T3lQSFp0N2pWbU9VM09JWk1mb3RBVUxWdml1M0RqNW96WTF4cko1MzNN?=
 =?utf-8?B?UkVoVSsxNFlVSHlwdlpjMmR2T0lxNmFDQlVMRVJBa28ySUE0TDZNN3k2bkI3?=
 =?utf-8?B?ZVdudHJxTGFJeksrWGk2MFdZa2lqaTRaN0hzMWl1NGdqbDVPM3pwV1ZsNEth?=
 =?utf-8?B?di9aMExzZzgzRE45d1BDZ0dFS0FBYTZLcHoyQ2pRbHhUbGRqZ2lOUjR6Q0RK?=
 =?utf-8?B?SVFNRUNXU1hVckoweUw4OTdjMldFa3FwTUFiOXFLbjZLWmJEN1l1QUhzNHdJ?=
 =?utf-8?B?TmpjUzE5VENRc3RPZUFZNXFmZXluQnIzR1ZrZXB1NFR1Uk9RNjlmLzVGckRr?=
 =?utf-8?B?dDdZemxGRlRCUzE3dk1QQTFXNzlWZHYwQUNsQTZSRmpKYU1Ta3RxS1FuRG51?=
 =?utf-8?B?Nm5NU2orazZXQnhxZENZL2oyQUtGeDIwYU56WWdIVGtsbkRHT0ptaCtDWmRG?=
 =?utf-8?B?dmNOcHhSeVBBTFBrWk5qdUtuOEpGemVNSjArL3NLZ1p5M1krbCtxYWVzZFk5?=
 =?utf-8?B?R21rQVlKWlY2U3V0aVNSdVZXeWJSNDRhNXFnRUhKUGRWekFNVkt3Si90aS9k?=
 =?utf-8?B?dmhYQm9jcTdseStSNHJRUU9BeU5aTWhSK1hSNTMwWXZCYUF3SUk1N1lseko4?=
 =?utf-8?B?dWl6M2VZT05qek9KRjF4bUpFbzJwWnhyb0dtNldYSitiMHZ1aFMwbUdDalQ3?=
 =?utf-8?B?b2N2SVp2NXhkWm9UWFB3dHFJVlhkemdJQnJNS0dhSGljUHJnQkRHeHkyc0VN?=
 =?utf-8?B?eU5QUUEyRks2dTIvK0ZJTjkvTE9MMDJnOURuSnVGclRlb1hpY1JzTkcvdDhS?=
 =?utf-8?B?MkZsQnJLSVg4TU5QTEdGWUdVV29KajVSa1FCbGxKTkcxeUlrWGpiemswQ0w5?=
 =?utf-8?B?TFQ2bEsxcU1YelFKalg1Z09admZuMkltYjhqUnpLZHQvdFdzR1Rkb1RvSFRJ?=
 =?utf-8?B?ODVyTWZLaHd1ZmU2Z0ZMVDUydTdISEdhSzdFRDk2ZUIrRVFZWkcxRGhwMXox?=
 =?utf-8?Q?zTPCD2FhxYdybkkSqlIXSZm15?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60671af0-5172-4eef-b952-08daef0396fc
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 09:59:52.5462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9nSbIm7CBpnYpx+Czi4GWGKvVAlPjD2pDf4SClN9Gfr6J7J7q68+CnrCCkNeRCvn1NdInQpTrZU/icojQKmVFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7981

Hi Julien,

I have a clarification.

On 05/01/2023 09:26, Julien Grall wrote:
> CAUTION: This message has originated from an External Source. Please 
> use proper judgment and caution when opening attachments, clicking 
> links, or responding to this email.
>
>
> Hi Stefano,
>
> On 04/01/2023 23:47, Stefano Stabellini wrote:
>> On Tue, 3 Jan 2023, Michal Orzel wrote:
>>> Printing memory size in hex without 0x prefix can be misleading, so
>>> add it. Also, take the opportunity to adhere to 80 chars line length
>>> limit by moving the printk arguments to the next line.
>>>
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>> ---
>>> Changes in v2:
>>>   - was: "Print memory size in decimal in construct_domU"
>>>   - stick to hex but add a 0x prefix
>>>   - adhere to 80 chars line length limit
>>
>> Honestly I prefer decimal but also hex is fine.
>
> decimal is perfect for very small values, but as we print the amount in
> KB it will become a big mess. Here some examples (decimal first, then
> hexadecimal):
>
>   512MB: 524288 vs 0x80000
>   555MB: 568320 vs 0x8ac00
>   1GB: 1048576 vs 0x100000
>   512GB: 536870912 vs 0x20000000
>   1TB: 1073741824 vs 0x40000000
>
> For power of two values, you might be able to find your way with
> decimal. It is more difficult for non power of two unless you have a
> calculator in hand.
>
> The other option I suggested in v1 is to print the amount in KB/GB/MB.
> Would that be better?
>
> That said, to be honest, I am not entirely sure why we are actually
> printing in KB. It would seems strange that someone would create a guest
> with memory not aligned to 1MB.

For RTOS (Zephyr and FreeRTOS), it should be possible for guests to have 
memory less than 1 MB, isn't it ?

- Ayan

>
> So I would consider to check the size is 1MB-aligned and then print the
> value in KB. This will remove one order of magnitude and make the value
> more readable in decimal.
>
> Cheers,
>
> -- 
> Julien Grall
>

