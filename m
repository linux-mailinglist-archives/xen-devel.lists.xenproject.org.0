Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D5D652101
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 13:52:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467002.725991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7c6A-0000ja-ST; Tue, 20 Dec 2022 12:51:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467002.725991; Tue, 20 Dec 2022 12:51:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7c6A-0000hB-PG; Tue, 20 Dec 2022 12:51:58 +0000
Received: by outflank-mailman (input) for mailman id 467002;
 Tue, 20 Dec 2022 12:51:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gzLQ=4S=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p7c69-0000h5-Nv
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 12:51:57 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2047.outbound.protection.outlook.com [40.107.101.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2da1293-8064-11ed-8fd4-01056ac49cbb;
 Tue, 20 Dec 2022 13:50:32 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DM4PR12MB5914.namprd12.prod.outlook.com (2603:10b6:8:67::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 12:51:51 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9856:da7:1ff1:d55c]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9856:da7:1ff1:d55c%5]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 12:51:51 +0000
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
X-Inumbo-ID: e2da1293-8064-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TjxcDjMT4FCUrIXTNbODy83WT7RoiH1Yojpo6V2Ndi4GLzj66H5x/nNLg7athfcRl9RG9nr7fKH09QXTx4I8FJBjFQ2MoGW7wj5Q/VJFrkTZ9BJuu9mcs6FTWAH1PYxqkgiNp4VJfTtfmyIfi8jY43jslILQ99rcBn3gahF63CycpHcgtG1sHp8fCdkI1qTqcMSuAyyTOR8yGnMSdCS1piqLwdIP6MGn4bPLjLIr+y5f6Vsx9njQeU+rkXvEFLf1HiTHUH0ix4d9zJsYnIUETvyCjrIVxMdu/DoIoL56hr6ER4KZ0Vqg6nwr+L3jPQP+ugL24gFtIJtT2x60lyKk/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RMKV+B326RtZumuiokKFM0kfwewgRomynsS6USFV6HQ=;
 b=RGF8V5Aq6G1Sk3cdjOdV+Y0yO8Zwa6tCwKV6ijSHTXHTklJsjeNK40N0+7Mykq0AZ/8D5H0PyZNN++wBRqY33tt89MptW2PH2cnXTXk/Kp+fXUukVUusN35Ex7BAM+TGUiUnW+ZUc10hCs4OS/J0q42i5UBb5tKMyOw2j6z3LFGZgxDA4Nx3KGdXy6NHgbA/2AK6Cm3Q2U+WnY+ucT29vUoWo3PVIU5g2I39cDT3NNJWgBta7ztiO5raRQrJyfXv0LDi0wcUHlC7SfvmTMjFxSxjTeTF80ysILxHQt41QVGbHw+93XWkWZfVSUUOYBmkFLi4GYInGPgb2pr27KI/oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RMKV+B326RtZumuiokKFM0kfwewgRomynsS6USFV6HQ=;
 b=vBV2pC59DrdAktjagUAWM/0N5T2ldkpJ3jDGOSKg8h1zP/udexXnUc6cknwpYuE+hY78D+hWC7aMlJbrkQtpcOfzjcB0y8KVH+Eu7o4fO27lKzVEcMlVlLr9yk1QcftUU7vH85YGBnfg4DL/94kzFuZthrSP4xh+auPFT8jZQvg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <b815229e-86da-f588-1b00-38c529504918@amd.com>
Date: Tue, 20 Dec 2022 12:51:45 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [XEN v3] xen/arm: Probe the entry point address of an uImage
 correctly
To: Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20221217193801.19485-1-ayan.kumar.halder@amd.com>
 <75635251-5f51-fbe0-28be-a99480541116@amd.com>
 <6e2b1f97-3e72-34b9-8faa-f00e79587b39@xen.org>
 <e2101505-ef3e-59f7-be2c-351ca9363249@amd.com>
 <9bd1a0a4-5d12-6984-0eb9-ed10303d5aae@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <9bd1a0a4-5d12-6984-0eb9-ed10303d5aae@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0030.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::18)
 To SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DM4PR12MB5914:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c117f5f-1f1d-42cb-d09e-08dae288f70f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9GkmYuuSkl/+m4VApe4WCqKzI+6U/3w/WsE7YPhL5GPKoZfmcbkv7ZyXlzpcrFzZoaSZZh8mT0g+PgdaDS9mOd+Bq/NuPSlUgsQmo6JFckSOVlijQoOzmKQOZzkee54n+v0WXTn7tDKrcWH5tYgXu2CG9gVHSilelyhsnq8tNq6GbZ4oM6dBovLUgOfMndNaqIbejXYs5kACuoVPh6nW+1ng6K26wsNp1wCmQF+347Ahhp/gFoAI0Po6trXl9YI127vooH9JpK16ZvOGVLzgc8Xt1B6GSZwLhQnOTM6HrlyMlYkc6LjlLKt4ytm0HMmo5fi7Ed0u5tOY0TKu/wRY1ozvBXn9auND9C94J5siRXEh7z4MjFOrv6a+pwPjgnx30/0TBBOyyePwHh06QMTQImy4UOYvWszZ5cAD+429KCPo51b4RFoGGf6ApL1HK0dIB3aSQL3l4nKz41DTPBFxN5B8bOFdJjVD9uq5XiRGDHhQ6nG0J9KS0r14ZUaV2zaAhlF7puKWg1C/YSDeBtCBi8El+xpOUHZbbfwzYS+lwOd2sJcbaxkkhW/qgP031QO7AZDEpat/oUGPrwesgwz4n4QmSEwBi2aVRk41dnx1y6wZg+Q7r/sOaJhk2vZZlxX3SBuCzw/WlRfxQU/Jpjq6+jOqvA724mJZuk5cGrHyqov4RDI9WNOwxTsfWBIxr7GDXoOcWFgJ20apuOJ9vJrI1IUxjshLnk8mHeqKQEBF3rypJ6ub1f4kOk66Kp0x1Jqp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(451199015)(38100700002)(31686004)(41300700001)(8936002)(66556008)(66946007)(5660300002)(8676002)(66476007)(4326008)(83380400001)(2616005)(478600001)(53546011)(186003)(26005)(31696002)(6512007)(2906002)(6486002)(6506007)(6666004)(966005)(316002)(36756003)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUVvdG1ENFpuN0x4SERRWWt4N2pKak9FaGd6a0Z4VmZlZEZNNkY5Zk1XcDd4?=
 =?utf-8?B?KzR4UmVUdVlRQTZyczFxWUtKQXZTTFlNZ0NIRjdnWTlyUW8rZkloOXVyWk9V?=
 =?utf-8?B?aTlSMGpvRG5UMkRjaGRMVFZnbnNyTlpuSWVuR1FtVVpsOUV2Z3o5WHp1MnRx?=
 =?utf-8?B?VGFxRHlLSUZNUGJaTkcvWWI1aE5IeEFQN0NHRlNNWmRnU2hUTENiVHRsclV2?=
 =?utf-8?B?TjlIcjFMSi9JeFBUWDlrS00yY2lnKzFnWHhJSmlUYTdJL3hZYmMwYlR0bUsw?=
 =?utf-8?B?Y3hPSHZjVFdrdi9HVytTbHdYSUxWSGRQNUFBNGN5eEtsQ3h3ZE0vRndGYklT?=
 =?utf-8?B?Q0lxVUFXUTNMYkR5YUpBb1o5V2U4ZmJNRUpocDZ1NU9xWTJuQ1NyakVMUnhP?=
 =?utf-8?B?RXdVNEpYRGY3TG5BeEUxN0E2ZzNZTWRsaTdVdC84aUtRWXBpNGdaUzZCektj?=
 =?utf-8?B?VHNZS2tiU00zRUwwSkxrU0FWWFlpN1N4RG5JTnhhTDFHYTRsOWNNa2NXdnhP?=
 =?utf-8?B?K3VPMEtlMVVLRmJjTEx4OXhBb2l5RnZjT3pDSTFjZ0JxbHl3WStaazhweE5D?=
 =?utf-8?B?Mm1NSS9VclRKT3ErS2FtdzBJUUlxWHJHMFhDZGdDQ0VNdm5Xd2ZuNDcrQ1kv?=
 =?utf-8?B?VTNNay9IWFJKb09JNWFRUENEd2NoS3RlT1F1dU1wYXhDNHdBQnBNU1c1T09l?=
 =?utf-8?B?TlRrZDloY2RJTjZlWCt1endWd1lKM2N2WVNZN0k2Nm9tVEIrOHBFK2hINzB5?=
 =?utf-8?B?SStuejYxcTc4VW9DVVR6TWNERUFtemh0VC9OdHgyMkZWZFdDNFlCcytRQ0VB?=
 =?utf-8?B?Q2U5WnlRUHpkSkZRQjZvVlVrZVZnaGxEcGtsbCtDZkU0NWsyMkRUZ3VKL1M2?=
 =?utf-8?B?UmpjTE53WDlDSStVd3lrSGxuSGxVeTVCb2lEZE1YMVQ4K0Fjb3hHdjREcVRo?=
 =?utf-8?B?cUJvdHpKS0hpTGVlVGlyTDBXRjVRTzRyb2psbWxoaTgzYWJCa09PamExL24x?=
 =?utf-8?B?YnZqQVpXUFhnbFNNVDZVZytzMVU4aDZQQ082YTV0c3lHY0tSOGlLZlhDeGNt?=
 =?utf-8?B?Y09GMW0wcURIMzZHcjI2b3hkOHFKWWRCMEtTRVUwSDhSZlY1T2RwQWgwVWM2?=
 =?utf-8?B?NDhzR0Nmb3ZtY25LdStSdzFrVmptRnlXcDBmSkZlN2VxN0NuMWJZdFVlYU5h?=
 =?utf-8?B?Q1FnaWRoMldna3EvSHVwdDA5WXdFb3Z3STZMaFh5WDFMQ3lILzV6cHZpbUZS?=
 =?utf-8?B?NEI1ZVdJNzNXNVJPWjM5ZXdEV0lmdW5mOVdPUWcyNFFPMTdlRHpXRWFvVFdl?=
 =?utf-8?B?TmRxV3J2QUJpWm5TMVlnZ0lHbmd6SURMSS9sVTJCalJCQzliOW5LeFNuZTNo?=
 =?utf-8?B?Z1RJckFURnliMktPN3A5N3VFVDl2VnB5NEZWK1d5eWRZVlY3aWE1Qk1DUWl1?=
 =?utf-8?B?SUF1NWUrbER1T3Fzd0taZ0dzM1ZWVWxDbHg0R3dYeUF0S0JDazZiMVJYZ004?=
 =?utf-8?B?cjVQTDZWbVRXUmpZQzNzU0tNMWg4SWlTejFBYWVzUE1HVW9IY1FiaXpQYmJ5?=
 =?utf-8?B?UEsxdHNJVnZBQjB2ektNRFIrZ3k3azVReTgrWUs0cnlDbitib3c4b2NqRzA0?=
 =?utf-8?B?Z0Vod1VZN0Q1c1ZGcG9rWjVWWVFheWVOMEJyOEhzazMyeTZSRnppMzY4VXFM?=
 =?utf-8?B?VThRTVJhM2xuSWtWNTZLcXJ4VXM2MitrUWs1d2N0dWtsVCtheklRQjBRTEhO?=
 =?utf-8?B?NFVIcmY5MXlXVWdVNCtsNitIeURhUTk0MkpxZnl5UHpDcFhFaGM5TmhSaFl0?=
 =?utf-8?B?WC96bVpwcTByRUxrM3Z6VmpTVVpyQUh4ZWtUcnkxbE5EWHltNHZvWjFvenpN?=
 =?utf-8?B?TGcxZmM3Y2lKWG8zeExtVlR4c01sdlZhR2kzTDYxZUJGRTlIenBoZGc5d2Ny?=
 =?utf-8?B?VDV1MnFuVU9CZHJUTzlORzRsenplUVNLVUI0TFV5RUhpbXl6cFJTQlM1Q2dV?=
 =?utf-8?B?N2sreWJZRTJWUGVqd3hlQTJncmFxN0toZGhKcWxRdzM3Mjl0WXBoOUtld1FT?=
 =?utf-8?B?N1FUdXBLMmFLZi84SXhXeHdNdFg1TXFhdlMxZUkwYWRYRGFjcHhtZno4Y3hV?=
 =?utf-8?Q?XpdmG2fbQTxAXH9IC8uVC6zcD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c117f5f-1f1d-42cb-d09e-08dae288f70f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2022 12:51:51.6972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ooEZJsRPbDkoiIdM9XZw6fJJUlB/2QYExTMicYkRntVAbJhRCCRvp8bITVr0Gtgr1sh+enn69aVsDw1oYIpaBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5914


On 20/12/2022 12:14, Julien Grall wrote:
> Hi Ayan,
Hi Julien,
>
> On 20/12/2022 10:44, Ayan Kumar Halder wrote:
>>>>> +
>>>>> +    /*
>>>>> +     * Currently, we support uImage headers for uncompressed 
>>>>> images only.
>>>>> +     * Thus, it is valid for the load address and start address 
>>>>> to be the
>>>>> +     * same. This is consistent with the uboot behavior (Refer
>>>>> +     * "case IH_COMP_NONE" in image_decomp().
>>>> Please make it clear that you are referring to uboot function.
>>>
>>> Could we avoid to mention the u-boot function? The reason I am 
>>> asking is the code is in a different repo and the function name can 
>>> easily change without us noticing (so the comment would rot).
>>>
>>> Is the behavior documented somewhere in U-boot (or online)? If not, 
>>> what's the guarantee that it will not change?
>>
>> I could not find any documentation which states this. I found this 
>> from the following in uboot source code.
>>
>> https://source.denx.de/u-boot/u-boot/-/blob/master/boot/image.c#L458
>>
>> AFAIU when kernel_uimage_probe() get invoked, the image has already 
>> been decompressed. So, I added this as a limitation.
>
> I e looked at the U-boot code and, AFAIU, the check is merely to avoid 
> the memcpy() if the image start matches the start of the decompression 
> area. So I don't understand why we need the limitation in Xen.
>
> Now the lack of documentation (or at least I didn't find any) makes a 
> bit more tricky to understand what the fields in the U-boot header are 
> for. I have skimmed through the code and I disagree with the 
> implementation you chose for Xen.
>
> The comment for 'ih_ep' suggests this is the entry point address. 
> That's may be different from the beginning of your blob. I think this 
> is what ih_load is for.
>
> So I think we want to load the blob at ih_load and then set pc to 
> point to ih_ep. This will require a bit more work in Xen because the 
> assumption so far is the entry point matches the start of the blob.
>
> Please let me known if I missed anything.

I think you are correct. I will rework this to correctly handle load 
address and entry point.

- Ayan

>
> Cheers,
>

