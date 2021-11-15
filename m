Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C990145018B
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 10:37:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225710.389804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmYQS-000793-ES; Mon, 15 Nov 2021 09:37:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225710.389804; Mon, 15 Nov 2021 09:37:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmYQS-000767-B3; Mon, 15 Nov 2021 09:37:20 +0000
Received: by outflank-mailman (input) for mailman id 225710;
 Mon, 15 Nov 2021 09:37:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mmYQQ-000761-BR
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 09:37:18 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f2ecdaa-45f7-11ec-a9d2-d9f7a1cc8784;
 Mon, 15 Nov 2021 10:37:17 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-12-UYai_V_XNfGRScNycBGm6g-1; Mon, 15 Nov 2021 10:37:16 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB5905.eurprd04.prod.outlook.com (2603:10a6:208:125::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.25; Mon, 15 Nov
 2021 09:37:14 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::387b:e76e:f981:f670]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::387b:e76e:f981:f670%7]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 09:37:14 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0402CA0005.eurprd04.prod.outlook.com (2603:10a6:203:90::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Mon, 15 Nov 2021 09:37:14 +0000
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
X-Inumbo-ID: 9f2ecdaa-45f7-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636969037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+0z9v3e7uvsSfPOf18zuGbOzN4Eybg9gba8lpFe8lVo=;
	b=HWCgJJuwQIcA1Go0WYfkWSmoh141soV5OLBy1MHPKHuWOayB5s0qaAX9jcQYnl9sMt3vzZ
	7LY1UvYDVDpU7dfSq3+o77G/v/GvPGPHnqvw8bLKWB+Cg/JsF/UsfsP36bY9OLInoJEb7y
	kCBvN3Z1JfoFRbDfmSC+Eb4H+dMuh64=
X-MC-Unique: UYai_V_XNfGRScNycBGm6g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jW7WMezZMuaW5M6epJtP4A3hOSPZnFejc4W/yjUf8qQshYnwMevdRlrLnm6zYXiKK5YVj+iHdYpKgUhfClK8TMMJayFl94RX/u/gIdMxUjbm47Td5KX0ps5TNVB6zKilFV1Mx9eVwA+G4GBjxDOWxh+DpkpplPeYwQFVI2r386D24GoAQweiAYMbGF7paJK+2eOQEkdb3Q6S4164xirBhpjtGyxIdXYuLOTCI9EeIGWDZ4RX3/zw2DlPI09wiEBG6cmkWQGiztYXav1D1+/w4ShEl680djynt6YvmF/hO7aeUOqVYUekGEWk4J1SK5zV4MibieyznRoMBZr+D7idtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+0z9v3e7uvsSfPOf18zuGbOzN4Eybg9gba8lpFe8lVo=;
 b=NxGFyTFvdDssAqZVOsV1U6vYLHx++w9bGt8YE7jywMcgxi4OO3zGDvIB2Q4p9ebUvtsPMES7Z64YIyiAaVFLuJ5vLXHU70FvCEWYRFVgBfZIGX21mE3tXmEe21ehSVABk4MUIT77H7n1EMvO472lvYOumhyRxtXB8gnQD8M574fTR6XV0+7/1c0odzsCimWK4YNhMkPNfCaJ+cGeMTubmAdrpQAjm5HS0xwPziCKAzxQ7c8wfADc7xktMxluymgyEGXzqH7LW1cOWhOO1NlgbKs/wQAHvk0+Bo6vivlu62y/8/2V/q1Jh+c7HH05d7yaSQIqx4poC3lSPAS1RKokCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <81bafc7c-673e-377c-3417-49f83ad0b284@suse.com>
Date: Mon, 15 Nov 2021 10:37:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 6/6] VT-d: avoid allocating domid_{bit,}map[] when
 possible
Content-Language: en-US
To: "Tian, Kevin" <kevin.tian@intel.com>
References: <a97adc3d-2808-1c87-8fd6-d6b24b83bd2b@suse.com>
 <74734976-b5a0-3372-7c7c-9f866945777c@suse.com>
 <BN9PR11MB5433479ED71950BF52AFB8AD8C989@BN9PR11MB5433.namprd11.prod.outlook.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <BN9PR11MB5433479ED71950BF52AFB8AD8C989@BN9PR11MB5433.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0402CA0005.eurprd04.prod.outlook.com
 (2603:10a6:203:90::15) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d4ba56c-ebb7-4721-d563-08d9a81b81d6
X-MS-TrafficTypeDiagnostic: AM0PR04MB5905:
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB5905BC64DF87D26E42E10808B3989@AM0PR04MB5905.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5X96VijLLmyWkixMkT7bMz+r94iOQoxkeIWinZ7tL78KqFRfvnLDwofpVuMDlqF0RRKe1A3wRua9mCvQiACGIJly7JYNFeudoxjbWyLXilPpyd3Ol3ZwYaSdifsc3F9E7ERuAPAk8XrLpqQgMBTk4tEX0EdIhMe9iDjHVfMReDmBNl8bD0qbKwriRz82jwYpqLDhfuUIFTQwffTTf5KgKMy3s01ezwkJf/RFPxFFP8Rnq6Syq6ll3n9fGe40PsOW6WSGKqmJqrhTJEMK5GeRz9WZCnbXUrQYjlgNrPDrpyzIF49YVt5EmMZiYS80tUp2aAEY8YxZj4fIEUp0TlupTLqo8WtOHgYNGD9gvlul9RX/cuEeqzB8CPMEp4425OQ6hRGPk7z+2ThyGyoDspB6xvknJU91eHKmQz1np7x6Qq4eli6YL1maxTob8mbzXriTReu4UoYq0ww4Doxy6Ab9HG+gsco2g+dLjxnWC4UEy7czSBTQkN1fYXzLzQ+TLvkVUo9vNGdb9MW60JuEoPivIg1+E2pMg+hD4UvUn+0s7puIJ1A9EZ0H5CIYXprYhIPbdw3BTbCOCCnOwfC7SsbdGjw9p1aUAYL6fkFBP/4Jj2PHvIpuHbr77osVj/qyduZE+Nbwo1W1mStdsl2YpkLr5zKKdV/m1s/VOR4wogiztuje8V+P3UMMnb5WZXobTO2F4GOAXzDLlcCxOYbJuEJJKqgyF5dyTdjrSlV14PQLdS3B3fTVl9TDQuvELu+yR5uI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(6916009)(8676002)(5660300002)(16576012)(86362001)(2906002)(316002)(53546011)(508600001)(6486002)(66556008)(66476007)(66946007)(186003)(26005)(36756003)(31686004)(8936002)(31696002)(956004)(2616005)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFV0eitDUDI5TkRmVGpDZE5PdWEvbFVzcFBBWFQrMTFoMlF3OG5YaUVMRmo1?=
 =?utf-8?B?MTJvNlQ1MTdQY2lzMFRXY3BnY0wxMUwvUkxwSVQ0RURvZUk2b1p4R0JsRVpF?=
 =?utf-8?B?QytkMUZaTFp5Z0VFNy9kaGJXS1dKNVBnMnd3NXpla2VHdG13SkZKL25GRHpJ?=
 =?utf-8?B?Z0hsY0gyTU5pakIyTXc3RkVyV3RTai9aZDNpZ3NNdFp6SFlFWXVEalkrWFph?=
 =?utf-8?B?VXYwREJFWTAvOUpPK0pYY2RwNkYxWHZJTjF4OUdNbWZzYmxZR1o3bGRQRW9O?=
 =?utf-8?B?TXhpMndhS0NUUjFnRE1xN2tLQ0pUWmRFd3NJTC8xMGMwWW5uWDk4Q3UzYjI1?=
 =?utf-8?B?Q1RBY2d0UWtDbkNkM1VhWEhRbXMrZFNYS1l6SFYvZXhEOXczOHM0MnZJU3kr?=
 =?utf-8?B?a2V4WW0ycitaaSs3TnVXNkd3OTUvdU0yTzlEb2ZjVnFzMFlPNSt0YnZkV0to?=
 =?utf-8?B?TVhkL1Uybm1TdzVabXYreVJlOUhSc0h5RGVJV0N1RTBCeFFSTHZEaW1KSHlX?=
 =?utf-8?B?RHlDS1BIN0JiZ0ZSVCtiaGtjVUExbkJvb0t6eVFNcm1GMGFpNkFBZTJtNXNB?=
 =?utf-8?B?bzVuSGRpOUg4Rk1hZk5ncHlNblRaaUIwMDkyQzd5TGZVQW9ydFU0UXE0OHpB?=
 =?utf-8?B?QjBLekVnZmREM3IxcG1jWFI0SmgrNTlETVNBWEozWUZIbkFCMlpXVjlYRzdR?=
 =?utf-8?B?OWMxNlBDK0sveGhPUjZUU2pFb0NqeTVHSG5ENDZGaVQrd2FzdXEvZE9UQWFw?=
 =?utf-8?B?dER5a0FpaW5iZ1BsSmNvdDllMFZkQisyUUdXNEhBa1J5dms3TXM0d3R1amM4?=
 =?utf-8?B?VkxINE4zTXM5ZWZrWDExT1BySWF4TVBjVUx2c3pwNjY3YXNVUXVoU0l2aFFL?=
 =?utf-8?B?d0MrOTRtU29qVyt2VENGTHVsU3oxb3F2UXZhS1d6eEwrMDU5ZlFWbGlEVkVY?=
 =?utf-8?B?U0gwNmgyUlF2SVkrSGVjQzk5c3NyTlNnSXhpREkwU0VBZm1VTGF4bVRnNUh1?=
 =?utf-8?B?QjNuNzJGaFdtUjJkWEI0TFZpa2xNbGYvQmlLM05MSGRxNHRXRmVVcURQMzdE?=
 =?utf-8?B?OHYwY2VXQWcwYUxPbjQzS0Q3RXRad2p1ZXFjdU1XYzhiTGl4cS9FNlRnZnZv?=
 =?utf-8?B?M2pUT1hNY1dDcjh6Q1hJRTFRU2gySnVucjdWd3hhd0N6a1pyTkR2UHlMTzNu?=
 =?utf-8?B?L0hxdjhmTnZqbHArbUU5WjJkMGhtZGtVN3ArMHNXTXVPbmRZc0F2RlNtaVUx?=
 =?utf-8?B?b00rOU5xNm5DRExtek5YY0tpNVBNdzJBZzh0ZFBjWVBHZlc4dlArRks4M3Jw?=
 =?utf-8?B?eEVqc1orM0k5R3JnR25PUllrRjM4UU55Y3pvVE05YkdHRWJGU3M5V21WK1dk?=
 =?utf-8?B?VUZER0pZMFpqRFdsbmxDZkgzcG1Hall0VmJIYUE3Q1U5M0tRTnlLYkRlU1No?=
 =?utf-8?B?b0RFK1c5bGtYL2dVSTFLK3V1TzFCOFVnN0h4ck5aeXA5L08zeDRjbThFUEtI?=
 =?utf-8?B?RCtNczJ2QWlEelc0WUlna3p1N1dlb1RzdlVGRjkzOXlNdDlMRU5vWHl3emZH?=
 =?utf-8?B?emp4S014amNjRHgyTzZHOVFDQ2ZiYzdFV1BmREhWalRGdGI3VnZHWjhvNmE2?=
 =?utf-8?B?dEpNdE5SSmlGMUZ3c29MOGhNa0c5dWc4cml4SmhQYXhQa29uWHJyRkZ5TnFu?=
 =?utf-8?B?d0dWZllCeHdWRWdoSXFCVGV3WTQ0OWg2WFlMNjVaRkh6cFUraHNycUw2UFRa?=
 =?utf-8?B?eUsxZXVzeGNuRWt0Zjk1c084U3JMZWR6TGpINjNlTTZLa2xEaU5FU3JGUmdF?=
 =?utf-8?B?cjhFZmY3Q2w4RFVMVFdVMy9TZU1ScExIeDhFMlBIL0Jma2drU3lPNlVHeTla?=
 =?utf-8?B?U2RaNDZXNWljUE5RcXNGMEFQcmJxUFppd3grcHdSZGppZ2greFByUWlNcHRi?=
 =?utf-8?B?RGp2NlJWRmpZSnMrNXVaZUdXUnJBQXRadnpLK1ZHNE1HZTNDYnZQbm92eUN4?=
 =?utf-8?B?ODVLazFmUU43YzFOV2EyZHpiNXpVWTkwdUpXQWNmRTQ4cDMxMDFsZndXUUdQ?=
 =?utf-8?B?Vmh0blZLM0RjVXVYYXVOU2xFbURJWUNZaW9CRzYyN3hxbVI3NVJ2ZS91QldM?=
 =?utf-8?B?ZUZ2dkpyQkF5cnFSNkRlcHp0WmZoOGtSWE1uUGNMOXp4Zm5ENVZOMXhSdVFD?=
 =?utf-8?Q?szcGGYDp2XHeJxhMsWeBZUw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d4ba56c-ebb7-4721-d563-08d9a81b81d6
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 09:37:14.6408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tp47wacJuFYCfT5+CWNLtP685BJCpE8IKpX4bDM2qFqlgAjpZX3la4/hjA5jxv/SVtfDMAzxEfOhd03A4OXHiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5905

On 15.11.2021 07:18, Tian, Kevin wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Friday, November 12, 2021 5:50 PM
>>
>> When an IOMMU implements the full 16 bits worth of DID in context
>> entries, there's no point going through a memory base translation table.
>> For IOMMUs not using Caching Mode we can simply use the domain IDs
>> verbatim, while for Caching Mode we need to avoid DID 0.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> For the case where the memory tables are needed, xvzalloc_array() would
>> of course be an option to use here as well, despite this being boot time
>> allocations. Yet the introduction of xvmalloc() et al continues to be
>> stuck ...
>>
>> --- a/xen/drivers/passthrough/vtd/iommu.c
>> +++ b/xen/drivers/passthrough/vtd/iommu.c
>> @@ -62,11 +62,32 @@ static struct tasklet vtd_fault_tasklet;
>>  static int setup_hwdom_device(u8 devfn, struct pci_dev *);
>>  static void setup_hwdom_rmrr(struct domain *d);
>>
>> +static bool domid_mapping(const struct vtd_iommu *iommu)
>> +{
>> +    return (const void *)iommu->domid_bitmap != (const void *)iommu-
>>> domid_map;
>> +}
>> +
>> +static domid_t convert_domid(const struct vtd_iommu *iommu, domid_t
>> domid)
>> +{
>> +    /*
>> +     * While we need to avoid DID 0 for caching-mode IOMMUs, maintain
>> +     * the property of the transformation being the same in either
>> +     * direction. By clipping to 16 bits we ensure that the resulting
>> +     * DID will fit in the respective context entry field.
>> +     */
>> +    BUILD_BUG_ON(sizeof(domid_t) > sizeof(uint16_t));
>> +
>> +    return !cap_caching_mode(iommu->cap) ? domid : ~domid;
> 
> If DOMID_MASK grows to 0xFFFF (though unlikely),

I did consider this too unlikely to warrant taking care of. Now that
you ask for it anyway, ...

> then it translates 
> to '0' when caching mode is true. We need extend BUILD_BUG_ON() to 
> check DOMID_MASK in this case, since caching mode implies
> total_size minus one for available domain IDs 

... I guess I'd rather replace the BUILD_BUG_ON() than extend it or
add a 2nd one.

Jan


