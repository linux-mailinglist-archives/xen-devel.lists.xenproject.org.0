Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7BF64C59F
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 10:13:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461864.720022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Noc-0007M0-BO; Wed, 14 Dec 2022 09:12:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461864.720022; Wed, 14 Dec 2022 09:12:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Noc-0007J6-7F; Wed, 14 Dec 2022 09:12:38 +0000
Received: by outflank-mailman (input) for mailman id 461864;
 Wed, 14 Dec 2022 09:12:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dEbZ=4M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p5Noa-0007Iw-Op
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 09:12:36 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2077.outbound.protection.outlook.com [40.107.241.77])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72ab2ef2-7b8f-11ed-8fd2-01056ac49cbb;
 Wed, 14 Dec 2022 10:12:35 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6883.eurprd04.prod.outlook.com (2603:10a6:208:17f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Wed, 14 Dec
 2022 09:12:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 09:12:33 +0000
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
X-Inumbo-ID: 72ab2ef2-7b8f-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mFsbB22rpKv73V31mp5CSugZAgslWyBMjc4X+2xLu3jiV3CIDBjaJttP8fFoWFu1zluAbLMtfAXQcqNCaT/tQndYw45wUtPsHns/J9zuYjPGZUZZuRWxosGhK1EUTuwb+7qVnyTMBYsDv30wCV5VD2OiI3KWyWmj2kHdLvMYFbSAMX7JPb2rKtnpOc5yQXAMEXNvHSD5d+cTTCE4H8Bl/fMN0gA6oYqmtxcXDvuSoUPpWRRIlOTKaaY+p/0RyvVOPFDmSZgjaIH7AfU5skJV65jjh4xzaGeMXz44uIZ2uBmamlD95bSsET6uReUTNdbRxDxyjyx0TBspj7NAEyWCEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=frc3gGYnjpPbkoI87ym2uQ+d9o9UoAXztLkCV2dPPCk=;
 b=LuZgWVZyGdYQtLM6Dw0hRQCDPC0Mg6M6XsFVfxZ85C0e5cgvnCh/BcMdYd6i9L3ST+a2APKvfg6ATw8mu0u0c4Bp5TVGylo78ES89XTld+vqIWyEatzSSNzevbfK8NqASvouhkUMX8YKwbf1UZRByMvM91VtQBrXy5bwQjoCFwJ6hr/8ek5zwfLE956kXaJKgAqyuf+ja7IE4fRpFZjBpDtKvYp8mP5A/GW8d9aSm6bVzaWXXo+j+ZfCD9eQhafhiXdnreGcaDL8lBJDb1U50aQiqi3OtFwiZfFDQHIkYiOt3rqOtHuQlyQRwzKP7r1OQ1oXp68ROCFctwDuUa1cww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=frc3gGYnjpPbkoI87ym2uQ+d9o9UoAXztLkCV2dPPCk=;
 b=bcbY7BeGRlm5/Gh3PLs11cFmSM5FXqOfSzBEFsXkF4TiI/OJFcUEebZ6M2t4rbM3cXH5XVLQeUAp/fMbuOSy0p4EJNLG9KjtR2PrukN48OpC6qt23cMM/7z3pWPuAJiqHsAGuH1J8sgT3pg3LNLPc9hS52e6Le8PER1VoPXPK8iE3YPoyBG1adPhf/JM5qSiymczTKuJQfPwkRvV0iuDLRS+A23txIh86lhltpTKrCdOFk/OGQQ8IeRiJeUL2xNXmlp36kJB7nnI+HxwT0JEMiu1JPyLS346GELatnBGsmOE/IahaHZxvgrml4iUz5laISsn91E+ACMEhtTWGgaDDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <783285b1-d137-30e4-735b-6628f9fbdafd@suse.com>
Date: Wed, 14 Dec 2022 10:12:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH RFC 03/10] domain: GADDR based shared guest area
 registration alternative - teardown
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
 <214c9ec9-b948-1ca6-24d6-4e7f8852ac45@suse.com>
 <46fefa9d-5bba-0738-2ea9-86c07fbcfde2@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <46fefa9d-5bba-0738-2ea9-86c07fbcfde2@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6883:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c10fa6c-0e19-455b-6f9a-08daddb3558c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WJl8M8Lt4MbCvcppUMXvGY7rQ3PtXkCS27Tg+x3XLNPvl0uYV7iXjJV2Ey3TBHoQ4rO6ahRa8NywEm2HT7k12IYpeWbnQwmHILAl2udEImYt+TccyTk7ESXCsvq5DoTu3pM2o6AdhhGqsF30bS7mg/mjd1xVxPCyhaZGfj0OGHqYzwCz6nuA6EUGNZti1Hyo9rXyO9o78l3dfOGdRNaqXqu4QnsIv4PVXA94B+y5WR3hLIz8Vta69irh2fDddK6vMH5lagswJzgLjrucVkKJa+7WiIor0u7x8fxCS7w7e0V9zHEJmMbv5Cfhkai4uyxX/NxjDsmey3DYwsZ2Z2jaIklDdcAsqc/QbPCZf8EPMtlmfvFjjA9NRLFp8T08sOJnK4U2tQon4qc0YbfcOh786RcNoG7HKJxoLo/DyEqMS4lEENpl+diA3KtQla66RUxS24E3z/C21je8H8ybugmvwJBwPNRGIMW33jI22o+4NF/yVRxLghg8zCtF0icn8c80slToLBKsFUDmoNSlxYgpyWNANsLUEuqWZt5omc5GMk7qx0iG4b25snDonH2XGm5Jd5eZ/4tHfpSn3gIfa7A5LII1as0UOBqrn1aJJ2fR28QcYvaiG0l9oK31h3XAPSs8sBHPsj/fMBdHsT4G1TT+nQ/Qaba2r+ZHqmXU/NL/rK8z6Y8c/NqaoPsL1h4Uj2oDwQ9x//hqHqV/eEnwvkWiANbCELAL8v2pk0RF60qEMcA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(136003)(396003)(366004)(39860400002)(376002)(451199015)(2616005)(6916009)(316002)(31686004)(54906003)(31696002)(86362001)(38100700002)(8936002)(5660300002)(41300700001)(6486002)(36756003)(478600001)(2906002)(4326008)(8676002)(66556008)(66476007)(66946007)(186003)(53546011)(26005)(6512007)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emdCeUJuMFRDQ3NBVmUxVTNablB5R1JaVzJzZHdiWDB6YzM0T0ZQSHM3Sk9w?=
 =?utf-8?B?Q1B4SXVIajQ5M3BxVkc5RjJDaUYyMDJEeUY1YlF6Yk5NS24wNEZ2d2d4d29R?=
 =?utf-8?B?cEJKYnc1OUJSeVJWVi9wbGdCcHlkV2t5NWIzeVo0TTE3RTdHNWVUMlFuVHBZ?=
 =?utf-8?B?aE4waDJOZERwS0NBcXFNcjdrR0E5bVhYSEg1c3Z2cHJ4Q0RFYXR2V0FDYXkr?=
 =?utf-8?B?aDNtcmM2dFFZQmhiWERUNkdsekZPYmhYWHVVU2I4TUJ0cFQ0NlVRMGV0NlU1?=
 =?utf-8?B?MW0vaHI5RDA1UjVXUnZEcFhCNXNSTUp0V0tyelFQNFo1azhIVHF3ZXlxdVhS?=
 =?utf-8?B?M2RWZW9VRU0wTG9ZMnZTbFdrbUlyUnVMVExTc0lNd3ZrbVF4d2txZHhjSERF?=
 =?utf-8?B?ejVMT3MvcGNreERXb3BrQWFKUHg1RHM2TEhCdGEwbE5COEExM3hRaVFhSFoy?=
 =?utf-8?B?VkhSV0xVM2diVytjOHkyNDM2dllaT0R3TEpRWEMvYWRHMnNWRkhmQkFnOVVT?=
 =?utf-8?B?WGxtbC9rdW9VVFpXQ2E2K2JLOC8rSERqRmxwR1BXSnpESi94bFdLNkFIczQ2?=
 =?utf-8?B?Q3ZNRlhWWnRUbksyeldyY3lwcDU3NFhQWmFxUUc1elF6SWdnU1dhRFNlY1hL?=
 =?utf-8?B?VlQ4dmJiNElUQ0w4Tm4xV0puT0taUG1GYmlRMGxHTFk3YzIvcHlRV0hVWU13?=
 =?utf-8?B?bEZCQklFQWNmUHpHSVA5K1Y5MUNmeGxGcGlSVFA3NEgxQ3dBU2NZeWFNaThW?=
 =?utf-8?B?MVF3VmM5a1BkcDk1L1RXenhNWGZISnJlUm8zWFN5TmdFajlaMWZxT3FzdHdM?=
 =?utf-8?B?Zlp1bjRlakZXS1NNc2dVMU1URG5DYytHakNXWVgxWEFxRC9BaEhCMnlFYUsr?=
 =?utf-8?B?VE1EVC8rSld3bUhJdW9LQU5sQm1nY3NRTFBtSGJFKzdKZHM2cUhZVUZlTFZC?=
 =?utf-8?B?QkcrSUJJT1hnWWFiWmNSZWxnNU1KaDdwUTIxc1h5WDYxRGRxNXdXancxWksx?=
 =?utf-8?B?dWFJOGdzTGZISUNDbzhPWEhOTU5abW9YV2MwaHJCQnVFc2pOeXBDWW4yRExW?=
 =?utf-8?B?R3dRN0tKUi9WTmVlZDhja0VtWGRTemJQa1AvdTVFcjhGV2gxRXlrWFppL3Vo?=
 =?utf-8?B?R0dUdWdoQXJCc2JtQkV5VlVMVExjWEptTnBnaTZUWktMMi9BNG1KNVkrQjM0?=
 =?utf-8?B?WE1zZXRPZVhnWWxrT3lvQWFFREsxYW1zV2xPc040bUcrRkVlQ3VqcmN3UmFo?=
 =?utf-8?B?VjRkcmFQb2Vsdkh1NnFhZFpUV3RZbjc3eDJUQWdwRWErSFFBWXcvRkxIN1lh?=
 =?utf-8?B?cGZxYW1YQkF4aHlSSW4xaTRPajVnOXJobWRETmMxWGdxbUxxc2NtSVRQYTQy?=
 =?utf-8?B?TWNubnpvcDZBLzJJeFQ4K256VFBtTDJ5MUU4dTh5M2ttTXZIMmpFWmplL1ZK?=
 =?utf-8?B?cUViQ2w3bUc5SmFHZXRQRFdWVjk5WVd0eWhOMzBOME1FYnU3OFA1UzFmZ1d2?=
 =?utf-8?B?MGdQSHB0SDBDazI1RnhkZVhoajI2L2lHZzV4cENRcWdQNExPbW84Mi9iQVFI?=
 =?utf-8?B?K0dGdHg1SHFueURZT3VLTmlBSXNJd1htbTdSSnRqVjVQUGRtT3ZoYjFYTHNq?=
 =?utf-8?B?Z29sSWlDUWxsZXpUMUExOTAwV0lrRkZsbkZvK24vK3BHMi9kSVhQakFiVm5h?=
 =?utf-8?B?cnhEeDZVRExLNkc4eVJTblJRN2lDdUVieDRzc1hiRHZZZmZLaDU4bVArZFlB?=
 =?utf-8?B?KzhGTXlnMWN6eVN5ZW83YWR2MTc4LzNBMGN5dTdkbm10bzRxMDJnTmF0NFNK?=
 =?utf-8?B?YXhURTZXQlA4aXdzOGJlTWlacWlVUGsvM2xmTDkxa2M5bGNGRXNYT1E2MTNy?=
 =?utf-8?B?d0dJckN3QUFxajRuZkdwaURwOCtKRGhxeEcvQ3N3cnpFeDB6RnBpUlBVMkxY?=
 =?utf-8?B?cDlVQXF4bEc3cUFyTmN5T3RiM0g2RStGZzlRR0ZONUw2c2tManpBMHdnSW9H?=
 =?utf-8?B?OWpuancycWliblE3d0laRWxITGltMmhheFF2UWZ0dzBkem1uUDRVVWp6eWpF?=
 =?utf-8?B?Z3VtZVVOWHJYbUtzRGtEVEJHbjUwMWcrNlRZNGs4NG9PdHJuQkNDZUV4aW1W?=
 =?utf-8?Q?Q1tXb4jiUf99Wiwo6bNMFHIcH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c10fa6c-0e19-455b-6f9a-08daddb3558c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 09:12:33.2685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zkoNUt0xQ0ml9o63p8SZz3wXIpF1r7m1zd9aPc5KZTPBcG32QyhbW+iKh0zlZsq7UhsnDYdQQ6Ld8vAd4d7pkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6883

On 13.12.2022 22:44, Julien Grall wrote:
> On 19/10/2022 08:40, Jan Beulich wrote:
>> In preparation of the introduction of new vCPU operations allowing to
>> register the respective areas (one of the two is x86-specific) by
>> guest-physical address, add the necessary domain cleanup hooks.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> RFC: Zapping the areas in pv_shim_shutdown() may not be strictly
>>       necessary: Aiui unmap_vcpu_info() is called only because the vCPU
>>       info area cannot be re-registered. Beyond that I guess the
>>       assumption is that the areas would only be re-registered as they
>>       were before. If that's not the case I wonder whether the guest
>>       handles for both areas shouldn't also be zapped.
> 
> I don't know the code enough to be able to answer it.

Right; I hope the original shim authors to be able to shed some light
on this.

> The code itself looks good to me. With one remark below:
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Thanks.

>> @@ -1555,6 +1559,15 @@ void unmap_vcpu_info(struct vcpu *v)
>>       put_page_and_type(mfn_to_page(mfn));
>>   }
>>   
>> +/*
>> + * This is only intended to be used for domain cleanup (or more generally only
>> + * with at least the respective vCPU, if it's not the current one, reliably
>> + * paused).
>> + */
>> +void unmap_guest_area(struct vcpu *v, struct guest_area *area)
>> +{
> 
> IIUC, you will add the ASSERT() we discussed in patch #7 in this patch. 
> I would be fine if you keep my reviewed-by.

And thanks again. Indeed this is what I have pending for v2:

/*
 * This is only intended to be used for domain cleanup (or more generally only
 * with at least the respective vCPU, if it's not the current one, reliably
 * paused).
 */
void unmap_guest_area(struct vcpu *v, struct guest_area *area)
{
    if ( v != current )
        ASSERT(atomic_read(&v->pause_count) | atomic_read(&d->pause_count));
}

Jan

