Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBA36FDB47
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 12:05:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532730.829013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwggg-0004ZV-3Y; Wed, 10 May 2023 10:04:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532730.829013; Wed, 10 May 2023 10:04:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwggg-0004Wp-0L; Wed, 10 May 2023 10:04:46 +0000
Received: by outflank-mailman (input) for mailman id 532730;
 Wed, 10 May 2023 10:04:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WIjz=A7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pwggd-0004Wj-Pp
 for xen-devel@lists.xenproject.org; Wed, 10 May 2023 10:04:43 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 157ac523-ef1a-11ed-b229-6b7b168915f2;
 Wed, 10 May 2023 12:04:43 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6961.eurprd04.prod.outlook.com (2603:10a6:208:180::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.18; Wed, 10 May
 2023 10:04:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Wed, 10 May 2023
 10:04:41 +0000
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
X-Inumbo-ID: 157ac523-ef1a-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vah0/qIgRCN9s7awYXgkwPrc2JScNtMeKRTJgf6vVxMnqxNfnb54MzGMewTIFfiLB6xB3NPSJSrlRXglNMH7/8bMrOKcpa2hOEawBq4FDKb3mAwyJaiXfAjAqjKiElr4EdPzYtVv8lpEutFthYOOdkTMNQO6dc41lAMTvlP5Ofi5tIM268hSPATB73HA7VmV2Z65P/+lOugnNA7btKhI5htmi3m5ugH//38zqV129rDPu96RmaIdClIOEg1Wmg62cISGiaeQ/wnL8gUSA1ZwObVXDKpspb+/RfBSPtLV/9TOaw/XwWuvlGEWoroq5Rfko9IBakP7aG3Xkef10UyjKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ynexq2RV1+AMXVOAi5/6sOtizw/fq6DNVmCMx2qfSX0=;
 b=blFM4nMitjnN4vnuxwGjcUIEaxll10oJh5M5wcqWzskxGTQNhY3gT4SQVK2h9N5AFD3NPlIqN6LMSCKtva9qZXsR8Yas3QydslH+S5oQ0I5A/TE5imwRjt/mKG8d0L0L1OcD4+uj310e5ueE7+tdzRzJJsSsVX1aELSmiLtPeIlx1VKWovZoTFVOjE9WZ33A4G0A+YSAxK7JCojOlEKhBLYB5efFG9LQQ8MfTV8umlSgZ6f/QrxKAuhL5ySUMREFxnPACj+5eEm3m3q3K+5399UgMTKbw6qZUus8/d5JE37kYk4TwqIOLFIQw5snXz1TidjFiBVoNTb4MQTiBgo2Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ynexq2RV1+AMXVOAi5/6sOtizw/fq6DNVmCMx2qfSX0=;
 b=XqCTVkI/98m8Q+u5oQoGLC2Wl6IaZs6bBIn4yZqRynWdhjl/bBAfUuumk0LI6heO+2gp82nQmQNOMvR1P8fD0+mftZ0Ge/IO6gkDnmYzK0zpMitqrJth07w4FYsLj/JALxeEJfore4KzJ0WH4bhok1FCHVg43PsqL6NAIxEeiy/XfEc++4Z5JWJsEywO6yY8E0vKSdUqJnDP4Q6X4fwKBUex+SV/w7HYGXO/Ejl4khyzVRQdm1UKTn1cg3ltZA7Ze8zoWm+xOB3THeK6596/qnmUvM15QB/uqpJdmq3Eqkpvvo8+2SNHvPlL3iemJQJHHUhZF8iNtrX1jSvVfyI8GA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0342c320-d046-a591-b41b-6cec3c6ecbdc@suse.com>
Date: Wed, 10 May 2023 12:04:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] x86/iommu: fix wrong iterator type in
 arch_iommu_hwdom_init()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20230509110325.61750-1-roger.pau@citrix.com>
 <56c5d0f1-bc47-8824-9515-239647015d47@suse.com>
 <ZFtWc3ks5f0kMAQT@Air-de-Roger>
 <3c633370-bedc-96d2-1a33-271c6588da30@suse.com>
In-Reply-To: <3c633370-bedc-96d2-1a33-271c6588da30@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6961:EE_
X-MS-Office365-Filtering-Correlation-Id: c6ebf0d9-f0ea-4a95-fc30-08db513df8ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	izYn3TnCakb45lbOV6WkFZzV03razn1An9/Te1iBRa4rMN7nAf2bNcv8qfo7wxDmxUgdKoQlfKb+sRawjz/4KAkAz4WEpbg6fax//xxsP0LBN0YdefdF3vQpcJpyJ114TkqgxrIlIr+RmIB1eD/5bhw3DWH4J65LL47G3O3ZK8EIA43uLE936vAYcUWgOJDOAQVHmMv1pdszBlMDhh12Jw5WgwTNM6T+8Si99zp8q0I7p0jIqleJygphJv97Bsqp1kKI24ojBibYPNWPXZvJmkdkNEP5JwncuAhqBGc6dGNIAiPqqMnWf/zEHgeJ2Cn8F1gQLl2CPZ4C1VaqjGIgKfDLX7SlpLb55qS6QvAjaKn+h+tloYCU0wXgYP+zA3EQXFWNRgz7U/1n9fRYQT1JtEEPV8+mRKy+ResSY8KoAs9SwsR84BxqkikIySD3OgMZSvHyVsIAG/5Xu3Xd2fs9B4+4otOePoLSxL6RmRFvSHB+p+gEpmJVqcMQBTGsztOKx3kCOjbWDpej5FU+uJWSXxE8/XHTaE6REsmDjOh4+vA1BCEHhU3u+oBUJ3bE5GA6nWLcxiOEmTJAMuqtoHkROehhOGDpWgMKJ40m7TG/10meNd9U5N8vR5ITqlHkh/Qokr7Rfk3gurdhVLmrH0taMQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(376002)(396003)(136003)(39860400002)(451199021)(41300700001)(38100700002)(6486002)(5660300002)(8936002)(8676002)(478600001)(316002)(6916009)(36756003)(4326008)(66476007)(66556008)(66946007)(2616005)(86362001)(186003)(2906002)(83380400001)(31686004)(31696002)(53546011)(6512007)(6506007)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZE80TkIxWWRiakhwdFNjZU9kNEhBM3Z4UGsxd3YwaVA0WXNDbmZkSGpjWXg5?=
 =?utf-8?B?bUNhVnJrQzk0ZEdjell3TE9tT3NTUk1YajRSWFFvK0dqYzdMejNYTitVZmlE?=
 =?utf-8?B?a1YwblJUVkxPVHdiQ25FQk1ScldRZlJ4WmJZWmlPcTc2MnhkYWliN1MwRVFV?=
 =?utf-8?B?VkxCcmFyYkdZRE40dHovUXNTWElrdll1c3IzbHlTNmNuSk9ZZ1liTDhINjRa?=
 =?utf-8?B?RWFVOUlhZDFNakJDeWJib0Q2Rk05MVR3U1NscW1TWkRnSzJUdjRvanRvK2s2?=
 =?utf-8?B?Q3RqdTdvU0Z2Qi8rc3BNRjNNZ3lHRUI5Q1I0OFhqOG9kRDFic3ExeUdMVUlV?=
 =?utf-8?B?UDIxc29VSUJUZVlNU3pXbjVERVBDSFdCSWhZMzdyU1kwUVFyZHMyTDI5R1VQ?=
 =?utf-8?B?VFhVM2JscGJvZ0lMeTRwQ0ViVjNtNno3ZmZGMjMza3RVR3VjODgwWG90Qjlo?=
 =?utf-8?B?dlVJcy9Pa0VYZUM5WEwxYXFIa3FaMnlEZk5XS041cnRuZys1bWVVN3F2dWNj?=
 =?utf-8?B?TWF0VkRGNTFQdnkweXJUT1lJYW0wUUhzZ1pzaC9kZHdFWmcyWERYVmtlSnNG?=
 =?utf-8?B?RFdUQUMvRXFUaW5aTFpWS3J3VmJMeXZ0RXZmaHg5aWVzODk4VUNsUXAxYnlO?=
 =?utf-8?B?cEZueTBJbjYvUTRJNW1BZmZSYUpkZnpIMHhETUVTTDNXbGFCb2FaZUZTSnRB?=
 =?utf-8?B?QTlpdElRWUJ2cnh1c1k0MDFPQWNEYm8zR1NUaUQ4cEtrSHF2UWN6NjNXVmNW?=
 =?utf-8?B?Sll0eHZPNWhmRkhQSUhOWUZJVFdtMFdYREg5YUFUWTVtYmhtVXkrNnRPeUF4?=
 =?utf-8?B?NGw2ejF0aDlJZEZoUDVUc296YjZZalRtWDVLeG45ckJMOGd3QnRUajIvVEp3?=
 =?utf-8?B?cmdmN1B6eVorbXlCZEVFQW1jTDJMMHM1RWdkM015SUFPMGExR2hsY0lkMTBZ?=
 =?utf-8?B?cUlNVnRUdSsvWVJqY3pNSzNLbGU3RXlPVGhvWTVHT215UEs2TEx0Q3YvWVJW?=
 =?utf-8?B?a2tXcFQ5b3R4cVlzem5ERWJQb2U2SjdQbFA3bCt1M2xYcnZtbFZ0OXhnVlQr?=
 =?utf-8?B?QmdFbjlPUVpCUi9Zc2lpN3c1ZnJlSHZmeml1aVR1cXdJdEdueTdpZ1BnakVz?=
 =?utf-8?B?QTdhYjVOOUd6QmRlZGpFQ2t4OEVKanRySVdlYytGbFBxbmtBc0lGbllmNHA4?=
 =?utf-8?B?NmxHbDVxVnlxYzFhSFNhMFVZUEFRbFhlNTRZaHNjWDkzaVdseit0K0duMDRj?=
 =?utf-8?B?MXZpQ0ozZmZJYUZJcDJEOEYrZ3RyUTIrTFpCT2Z3YXFJdzcyOUp6bk9RclVX?=
 =?utf-8?B?bnJqZEptZnU2WGloc2d2aWtxQzRpbHBHSVhsSlc0eWI1U1hDSDF5VEFGWUdC?=
 =?utf-8?B?NWtDaEUrdzNvNEdsS1gwTVBXWXFsQS9Sd2hYdmwxNXdtYk5SM25ieVNOOCtB?=
 =?utf-8?B?bER4UmlPa1VkWEdPMXVZbi8wd3Y2OGcyK1pyZzRqL2V0djllbUFDei9yZkhp?=
 =?utf-8?B?OWtKVnBuZUI4WkNGUlViYmx2Vm9PWEJ6NFNaS2g5N2JiNzVlbDZRTkhxTnVG?=
 =?utf-8?B?Sis2TlhHR1R3UE1ybFlWbGdkaTRFUVNKNWozUUYvVk82bER4eUMxN0VoZkxN?=
 =?utf-8?B?aDVDamhKdk9GUVFvU2h4YU8zLy9BMkwzWFYyWmxzT1dlalg5WkpTU25mTi9o?=
 =?utf-8?B?Y2xYT203RklMTVNKUU90ZURhZWYxZkhWK3NjWncyOU9YRFpJQXVPNFBkM3BW?=
 =?utf-8?B?b2FtQ3NYRFBCSWIwWFhick1xbk5MUWYzOCtreFdiNWJKVzF3REJ1SHBrM2Zr?=
 =?utf-8?B?QW9TVXYvY0NGd1pSMHczRmZtOFRPVzNGdzNuakd6NEZUTDVDWmZDT1dQa2wz?=
 =?utf-8?B?SjZyNjNzT0N4bTNFUWNUVCtid2NTUnAxYmlwaE55S0lZd21FQUN1Ylc5U0pr?=
 =?utf-8?B?S1VzWG9jZDhYbFFpUStiSkMvdksvaTc1MklFRUR1MjN2YktQN2piNEkrcGVH?=
 =?utf-8?B?MlU4a3h4NFp3NUJFeDlLYkxDM3lIMWNtL2w3OUhiTFBIbUdXbDVLVUN5OFNi?=
 =?utf-8?B?NUZTS2tLU0E1MFpsOWtGdVZaWFdzbTFYU0NNQklDWHloZGxVQlNYaEh4Vmkv?=
 =?utf-8?Q?tBx4pBiNi6Rxs9IJbKZt/a2Ty?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6ebf0d9-f0ea-4a95-fc30-08db513df8ca
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 10:04:41.3572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mwW4MNlequGIe+8PADRkxAdbB3s9uu90WxeRyp5jM4lHzkJNyVqNeUR5rzZsVuCMlxWt5AkRRfskvHxL38HlOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6961

On 10.05.2023 12:03, Jan Beulich wrote:
> On 10.05.2023 10:32, Roger Pau Monné wrote:
>> On Tue, May 09, 2023 at 06:25:05PM +0200, Jan Beulich wrote:
>>> On 09.05.2023 13:03, Roger Pau Monne wrote:
>>>> The 'i' iterator index stores a pdx, not a pfn, and hence the initial
>>>> assignation of start (which stores a pfn) needs a conversion from pfn
>>>> to pdx.
>>>
>>> Strictly speaking: Yes. But pdx compression skips the bottom MAX_ORDER
>>> bits, so ...
>>
>> Oh, that wasn't obvious to me.
>>
>>>> --- a/xen/drivers/passthrough/x86/iommu.c
>>>> +++ b/xen/drivers/passthrough/x86/iommu.c
>>>> @@ -406,7 +406,7 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
>>>>       */
>>>>      start = paging_mode_translate(d) ? PFN_DOWN(MB(1)) : 0;
>>>
>>> ... with this, ...
>>>
>>>> -    for ( i = start, count = 0; i < top; )
>>>> +    for ( i = pfn_to_pdx(start), count = 0; i < top; )
>>>
>>> ... this is an expensive identity transformation. Could I talk you into
>>> adding
>>>
>>>     ASSERT(start == pfn_to_pdx(start));
>>>
>>> instead (or the corresponding BUG_ON() if you'd prefer that, albeit then
>>> the expensive identity transformation will still be there even in release
>>> builds; not that it matters all that much right here, but still)?
>>
>> So far the value of start is not influenced by hardware, so having an
>> assert should be fine.
>>
>> Given that the assignation is just done once at the start of the loop
>> I don't see it being that relevant to the performance of this piece of
>> code TBH, the more that we do a pdx_to_pfn() for each loop
>> iteration, so my preference would be to use the proposed change.
> 
> Well, okay, but then please with the description also "softened" a
> little (it isn't really "needs", but e.g. "better would undergo"),

And in the title then perhaps s/fix wrong/adjust/.

Jan

> alongside ...
> 
>>> In any event, with no real bug fixed (unless I'm overlooking something),
>>> I would suggest to drop the Fixes: tag.
>>
>> Right, I could drop that.
> 
> ... this.
> 
> Jan
> 


