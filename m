Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E775A3C7E64
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jul 2021 08:12:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155925.287781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Y7I-0000UQ-Nr; Wed, 14 Jul 2021 06:11:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155925.287781; Wed, 14 Jul 2021 06:11:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Y7I-0000SJ-JQ; Wed, 14 Jul 2021 06:11:32 +0000
Received: by outflank-mailman (input) for mailman id 155925;
 Wed, 14 Jul 2021 06:11:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wM3W=MG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m3Y7H-0000SD-K9
 for xen-devel@lists.xenproject.org; Wed, 14 Jul 2021 06:11:31 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5442884a-e46a-11eb-87d0-12813bfff9fa;
 Wed, 14 Jul 2021 06:11:30 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-30-rl0QXp1qM0CrV11szODKmw-3; Wed, 14 Jul 2021 08:11:28 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3535.eurprd04.prod.outlook.com (2603:10a6:803:11::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Wed, 14 Jul
 2021 06:11:25 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.021; Wed, 14 Jul 2021
 06:11:25 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P192CA0003.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:56::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.21 via Frontend Transport; Wed, 14 Jul 2021 06:11:24 +0000
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
X-Inumbo-ID: 5442884a-e46a-11eb-87d0-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626243089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j4/sYfafgOCTOioVY7nl7Z9UsQerES2BcRUQBRBx8S8=;
	b=mKKtPVCdVSCv4TR9cTuhOk1Cmf+/MOAc6WVI0qDaXYNuv4K+jwjKJKZ7w5Rk+Ak6VITi1D
	60nZW7JGvcDffJObITx2N8UyMx5KAeJ1zk0IGPMPqAJbrKF1L0CL7pyj8IVk5cXNynsixY
	oYYcDeW6iTRktJxqijK275p3t9JkIng=
X-MC-Unique: rl0QXp1qM0CrV11szODKmw-3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fi1+rLOgMxa4lXSqoWhrhqPwljhkaLwBSOA0wYVxuGvfnLt6MQLUwh0NUoNekdDH2C9FN6jllch/ecbE3vmWCxv5m8VtJapAxxCpPmUjh0ptYbOvlLRkUm0Xz8P2esL9fA33vs2y+Jak+widwlyAhRa5UAlqphgW3DGz/HobkfwFm7ePZhNAUlnCSAtKJxS2JIkfDXGFKBoCsCz51W9p8oTVXkoyYf/pVBRk4uEbzzlfd42G5DVyPmroL3KxR8BquaZBJMAL8guSRq7jHDllD9+eRYlL28coozAPSA8a7Q5Okuf46mZ7jbuUy/PdibgA2cEyrt+L07hj4Nd7z1wj5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j4/sYfafgOCTOioVY7nl7Z9UsQerES2BcRUQBRBx8S8=;
 b=SqPu+sCd+WGEzB6yO1ZekdRffHEj1yLFO/O0OoUbOsJXvTHB1ef9QfGjvAuW14v2yMYnkg85Msc97KGC/N0F12HhtJH1bEKE1ZTr/BDDTI6G2l8g8volMal5wH0YUBNMCSDfFEp34mVtGf75lYc2NedUG7/3MyYJSOk3uy6yUSWgVQl8RVeGEybErYsVTeC/OY6HwJydaATIHpd+00h6JxUCqHoPVwHsspoqHonxgXxHdHuqJiBBbFtBCLz7JQhIG2vCnbqYwLeQWrsO0lQcIRL2Gr3OMnYxUbmvQPDbTMeSEvkaVmF7j3OhFVkTpc5sqcGKvur0/+FQ96EiVHnTHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] stubdom: foreignmemory: Fix build after 0dbb4be739c5
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Costin Lupu <costin.lupu@cs.pub.ro>, Juergen Gross <jgross@suse.com>
References: <20210713092019.7379-1-julien@xen.org>
 <0698e4b1-8fb9-919e-e9a2-1b135a808e3e@suse.com>
 <d84bb0ca-ff51-2def-3826-c0a921ec1835@citrix.com>
 <fb6cc1b7-37b4-1819-6f6f-ebf96aefe00e@xen.org>
 <756ba923-17a6-0889-cc7e-bcd43a5eb258@citrix.com>
 <3505f2da-4c41-f5ca-d775-814d038d5bad@xen.org>
 <badec201-6719-844e-2a07-6508e891ca3e@citrix.com>
 <3c819563-b354-5527-050d-f698324d6021@xen.org>
 <c299355b-c031-3efd-ef97-671bd102809b@cs.pub.ro>
 <65d35862-304c-7fe3-82de-3ff62f06529a@suse.com>
 <40c00267-60d2-c0fc-cde4-8ac4ce936f87@suse.com>
 <d7cbedf3-bb67-1eda-70e2-d15c5649c0cd@xen.org>
 <ce9e3ba3-7e1a-b592-7e9a-e35099c8d483@suse.com>
 <b27990f4-ac98-8221-ddb8-fa4699a0d43b@xen.org>
 <6c6afbc3-4444-7c3b-d6ef-2d3a2baa0b53@suse.com>
 <c7f47a50-b559-f8ba-5ad2-6868c01b6f52@xen.org>
 <51a62c3f-e3ef-f7ec-748f-75ade81f51cd@suse.com>
 <de797e4f-cab9-a31e-4cf7-5e8996cae5bc@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <06a6b8de-520f-1c62-0f5f-a28eb1d9c7fd@suse.com>
Date: Wed, 14 Jul 2021 08:11:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <de797e4f-cab9-a31e-4cf7-5e8996cae5bc@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P192CA0003.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d628c139-df86-4d36-cd8a-08d9468e35ad
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3535:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3535B694A28ECEC2219C5626B3139@VI1PR0402MB3535.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OgMsOaPwfSbNjiuMIIoidaQZJk/sNFVQnuQRYlngeyjvQPpy4/06adMfHNpB9+UVHX+uDGpLE/6MH+GnTkETJxcCFcRwIif+PWh0YqoludGPsELkJgVeMHzIJfkUUekfSxZb+LeZ5y0iiuvou1IypHt/ZGR0onH8BmdZXMzFVUpEq+Yj6cq+wzxsnYGnij5u1MfoiuIXZBmljvRWEv0TqrGwGxigaFiCvl89paVSI+onF0OQZXE3ty85B7/b0WdTHuvtqco8nPZXQ7GHA9zeAoYb8cdunWyrM6MKZ1ZaByImFhIdif7XDrZrDx3HP3jrlfNfFW1z7G015JnAqDeVr8xynJQ2vEZJGx8qu974BOug9QYbbHha7gcb/FLH5PLNK09ZXALG0eIsGQLRfpB6C1u3kE3jumI5FpTjGncCurF4jZemq9cPiRd1MhIlcpSLOanJWheZRcVcHCrQwgE4dD3y4xK7QBNWVPQBj3vU6g98eyMeRHkSHDgHTHXNPZkvbe5kYRAFAs8y60u4KiEX/KaFAdtNeGqJhv6aECAcMW4vxwWl5D5qLsG59p0ZLO4LOFeqSLLr7JXnmIuBmSAhGCxuT5f30Tc9bM2nBRb38LClbMTUgPyTpicla7j+u1uq16thlthkW4vbcVDCbu5CVSXpAAzpYjHd2LFgNO001IL/zvi1k2CWEYPIhitT7FGeJZWdX/tRPPRFj0Pi71erx5iX7QwFDCLk6bidaN5ICk7HqMH75qlDAgD0csLCW9bP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(39850400004)(366004)(346002)(396003)(136003)(38100700002)(36756003)(31696002)(8936002)(26005)(186003)(66946007)(956004)(83380400001)(5660300002)(2906002)(66476007)(6916009)(66556008)(4326008)(2616005)(53546011)(107886003)(54906003)(16576012)(316002)(31686004)(86362001)(478600001)(6486002)(8676002)(98903001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFFIbzJUaTQySi9naVdQaGFnNGoxSGFpa2g4eFlpU1JYS2ZMUFp6UDZ5S0Zu?=
 =?utf-8?B?bzRJQlVGQVRkNHpwWnYzQldRSG9od0VOaDlqTjUvVXZmc3lzcE4zVzE3bk0v?=
 =?utf-8?B?bU8wbENDU0kvUktGQ2RTcjFuQ1ZEVkpMdENkZGhlYWh6TmplV2hkNFJBWWF0?=
 =?utf-8?B?WWE1NVFhTEpEckE2ZTcyak5yaDlmWFFhclMrL0k2aGZLVTRsTnZQaExXOC94?=
 =?utf-8?B?aEExY1JVR09FSGVUT3dzRmV6R3A3V04xb01Zb2V2bWFWOHMwYmprNHVIWVBt?=
 =?utf-8?B?Y3ZvYVVuU0R3eVJwQ1NSQkFENXYrYzVRSVBtM0RRcDhxT1MwK2VZKzB0dnlt?=
 =?utf-8?B?eUxoMzcrVUEzNmtBTVlnbFFqMUg2UWhOY0NvT2d1aGxSMlNQY1BWZkV5ZUE4?=
 =?utf-8?B?M1BYNFlSSEpRUDVLdU5JRms1N1N6aUx5ZmNjRllUbERiVkVWd1diVnlWamFj?=
 =?utf-8?B?aWQrdDlCVWRjOEtMWXJXbFVQZWZER0pKT1ZLZEhRLzN5Q3VGd2FxWlpYVkhL?=
 =?utf-8?B?dGYwa3ovdkZGVlptWUF4NEFJYVRTR1Z0NWI0TnBybDhKakR2VjdOemVDUWpH?=
 =?utf-8?B?RE1zWGxEd0p5RGFIT1Q0WDBqa2pGOE5uaGk3MjhBS3FsV05rRThqTVI1akdZ?=
 =?utf-8?B?Z3h6MFM1SWdNdWZSMjd3Z3VuWC9oMGJ4dzhxbGZia240KzhCL0ZTNTUzL2Z1?=
 =?utf-8?B?MmdScW45a1FKaTI5bzRzQzJBSFBKbCs1TzRBN2tIbk55WitFVWVUYkYrYkp3?=
 =?utf-8?B?UVdSUWFuMHlERGM0ZGF1dVJXQ1NhbVJ1amxTQlFuelhPNkVIbkYwVWRyUDVK?=
 =?utf-8?B?TUh0VkQ5UjhtVnZ6WDR0STBsQUdZeUt2SU5pTkxrL0hHMGpqUHpiVmlTR1Vk?=
 =?utf-8?B?Q3VwSks2eXozQU0vTmtMYnRkQW1Ca0xDa1VBdFFwa3krekFXREw0TUV6Q1Vs?=
 =?utf-8?B?L2kyR0pJTDFLYll5ZXhRSHlrMFBGOFRuTUFOQWorVGRIalFPWmtkaExiUGNz?=
 =?utf-8?B?YTZ0SVcxaWhVcVNEL20zNXNmR0xObUtPSkhvclkzcGhRTys3Z1ZiV09UN1Fj?=
 =?utf-8?B?SWpWT0pyMmRBcHlCS0RMRzY2dncrSjNuWGVmeFJsYU9WK004Y05yT1h5NEs3?=
 =?utf-8?B?T1ZsdGlEaDZiQ2dTVUdUZFVUZHZMSmZZeHdpdm5YeU5BZGcvYWlYR0FhYStX?=
 =?utf-8?B?NmxFTENNYVBQazFYY2xjbExENkxOUEp4aDZIaTVkNnFMeFhrWG95UkIzdTFq?=
 =?utf-8?B?UncwSUhSeFA4azlWRTNzWHZPRnlRWGVNNTJpQllFTU8yejBBMldWMElMNG84?=
 =?utf-8?B?bEpIbFloL05KejNVQ3UvTzdLOTFhVlRDdWFyVjBkTEJBR25hd2p3QjZIS2l4?=
 =?utf-8?B?L2NHcWhWUFRNcE5sZUtrZ1FmZEQ0dUdOdXlGQjJRMkZiL3JOVEo5cy9VcjdD?=
 =?utf-8?B?aXN3VFFRT3JLMVJNY0RFOEM2RVYyb29VZmx0bk1XQ2gyUzE0K3RMc094bXVI?=
 =?utf-8?B?WGZ1aXlYSE1mOGRGb05HWkIxaVlNdG1MenlDaUxkZ3g0VEZ3K1FKWmpNcHYv?=
 =?utf-8?B?T25CSVhnM2xkaWxKTCtZRHo3ZUFWWmoxZVVMck54WUJkVERqZjI5RFBja1dN?=
 =?utf-8?B?enIzQ2s5T3pERjJBcDQzczVESmJVMytqaXFSM0NMQU5LaWxLVHJpd2tiOExT?=
 =?utf-8?B?bjFlc3VlZGpxSWYrek9XZGp2YzVmT0RRWjlPRi9pUUJNWklHcHR1Y2pDQzRy?=
 =?utf-8?Q?thQrBz9M8a7Lv2I91O17waZFzctT57I3qwbqENl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d628c139-df86-4d36-cd8a-08d9468e35ad
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 06:11:25.1547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3NYJTziu6M1FiGn9qhWlee2S5FRP4gcqdMCSMpkdkez3yXxtQzNt0c+kzF6fr1GaaG4iO7TptT+2o4y42ndyDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3535

On 13.07.2021 18:33, Julien Grall wrote:
> Hi,
> 
> On 13/07/2021 17:27, Jan Beulich wrote:
>> On 13.07.2021 18:15, Julien Grall wrote:
>>> On 13/07/2021 16:52, Jan Beulich wrote:
>>>> On 13.07.2021 16:33, Julien Grall wrote:
>>>>> On 13/07/2021 15:23, Jan Beulich wrote:
>>>>>> On 13.07.2021 16:19, Julien Grall wrote:
>>>>>>> On 13/07/2021 15:14, Jan Beulich wrote:
>>>>>>>>> And I don't think it should be named XC_PAGE_*, but rather XEN_PAGE_*.
>>>>>>>>
>>>>>>>> Even that doesn't seem right to me, at least in principle. There shouldn't
>>>>>>>> be a build time setting when it may vary at runtime. IOW on Arm I think a
>>>>>>>> runtime query to the hypervisor would be needed instead.
>>>>>>>
>>>>>>> Yes, we want to be able to use the same userspace/OS without rebuilding
>>>>>>> to a specific hypervisor page size.
>>>>>>>
>>>>>>>> And thinking
>>>>>>>> even more generally, perhaps there could also be mixed (base) page sizes
>>>>>>>> in use at run time, so it may need to be a bit mask which gets returned.
>>>>>>>
>>>>>>> I am not sure to understand this. Are you saying the hypervisor may use
>>>>>>> at the same time different page size?
>>>>>>
>>>>>> I think so, yes. And I further think the hypervisor could even allow its
>>>>>> guests to do so.
>>>>>
>>>>> This is already the case on Arm. We need to differentiate between the
>>>>> page size used by the guest and the one used by Xen for the stage-2 page
>>>>> table (what you call EPT on x86).
>>>>>
>>>>> In this case, we are talking about the page size used by the hypervisor
>>>>> to configure the stage-2 page table
>>>>>
>>>>>> There would be a distinction between the granularity at
>>>>>> which RAM gets allocated and the granularity at which page mappings (RAM
>>>>>> or other) can be established. Which yields an environment which I'd say
>>>>>> has no clear "system page size".
>>>>>
>>>>> I don't quite understand why you would allocate and etablish the memory
>>>>> with a different page size in the hypervisor. Can you give an example?
>>>>
>>>> Pages may get allocated in 16k chunks, but there may be ways to map
>>>> 4k MMIO regions, 4k grants, etc. Due to the 16k allocation granularity
>>>> you'd e.g. still balloon pages in and out at 16k granularity.
>>> Right, 16KB is a multiple of 4KB, so a guest could say "Please allocate
>>> a contiguous chunk of 4 4KB pages".
>>>
>>>   From my understanding, you are suggesting to tell the guest that we
>>> "support 4KB, 16KB, 64KB...". However, it should be sufficient to say
>>> "we support 4KB and all its multiple".
>>
>> No - in this case it could legitimately expect to be able to balloon
>> out a single 4k page. Yet that's not possible with 16k allocation
>> granularity.
> 
> I am confused... why would you want to put such restriction? IOW, what 
> are you trying to protect against?

Protect? It may simply be that the most efficient page size is 16k.
Hence accounting of pages may be done at 16k granularity. IOW there
then is one struct page_info per 16k page. How would you propose a
guest would alloc/free 4k pages in such a configuration?

Jan


