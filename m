Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0884EC59A
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 15:27:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296332.504380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZYLw-0004ou-QQ; Wed, 30 Mar 2022 13:27:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296332.504380; Wed, 30 Mar 2022 13:27:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZYLw-0004mP-Mz; Wed, 30 Mar 2022 13:27:12 +0000
Received: by outflank-mailman (input) for mailman id 296332;
 Wed, 30 Mar 2022 13:27:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b505=UJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZYLv-0004mJ-9v
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 13:27:11 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19f61e1d-b02d-11ec-a405-831a346695d4;
 Wed, 30 Mar 2022 15:27:09 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-T7n2N4gqNF6M0GhOs0t8GA-1; Wed, 30 Mar 2022 15:27:06 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB8PR04MB7179.eurprd04.prod.outlook.com (2603:10a6:10:124::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.19; Wed, 30 Mar
 2022 13:27:05 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.019; Wed, 30 Mar 2022
 13:27:05 +0000
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
X-Inumbo-ID: 19f61e1d-b02d-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648646830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pVJq8LHd2bfEMgMFMNJ2ftY5c+6XVFKJs3cPNnVElpE=;
	b=kaies7bVsKx6XvhiA6GE4k4X4YunaT466CTTTQz37HkNkcohl57VZr4FMfMzDdk3jou2DO
	/CBRa4vFnKuHmnQeitl3Gp1Z/o6KIjVufjva//trAeM7bPlKjkThLULmx5DCCA0By/AR4O
	7uHl/jAORoFYag0GqZ1vR4Vj/mGr1Vw=
X-MC-Unique: T7n2N4gqNF6M0GhOs0t8GA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ILKzErJioAyGrXTNKBH9WOxweSLZ9kCCw0dNmJgnorYR1sSJi/VtcG5Uz+F3g/hr+edPnnvm2LIPzAJqOlpsSEIs/WssL8XBFvr1vCrHjA1ur9yS0M1dqpcn4Rl0TAyGc0E8OuMn9XHLkY9F9OK1nJoMHP4QHEQCh52kEuCY8PWDs+BPT1Xeb75U31SQfzPv15R7sAeM6P9ERq4870nuyITaUmBj43R6s9VV8nsZ4KOD+fmGw45VQZEsgxMZ7ZIKcocd1c4TG3udPue8epPqHrCnG01WMG/zY8uD6kQqvWm+7aY50bLUY63Z3hK0I393PGiQyS3wyCp+ldEcidYhyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pVJq8LHd2bfEMgMFMNJ2ftY5c+6XVFKJs3cPNnVElpE=;
 b=V52UN9JpQ51nrW+ylzYoOmpJw9cPVDdc1QKUEttogcgpvkRvf66aaOt6XBkCVBLbTMeqqcN+GHoX5qAwZfQMQXDgH0GWWRHJUeT0OALvhzwzI5XXrEkTv86yGT4QR10QgZf5vWxuJma9Tz2WqIOzIjpp8Z570u4k6Rs+8M0GbPiOer01wJgcz6iZUh7e1tGftwBItIxX/uyzz4V9ie6E2qVsCiNtSaUOMP85lWIBMvtXwcxOjgVwl8h1fxd2V2MBrVMmvWmQtBRo7r04idBHY2I4NhYG8F/L2zC1dwFSh8mDcNuL9WJZfU3/bMeilROtUq0L1GJ7r3hmEq7iVnnGWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0441f9b0-7f80-65a9-ec1e-7eee559a1951@suse.com>
Date: Wed, 30 Mar 2022 15:27:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/2] xen: Populate xen.lds.h and make use of its macros
Content-Language: en-US
To: Michal Orzel <michal.orzel@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
References: <20220322080233.53134-1-michal.orzel@arm.com>
 <20220322080233.53134-3-michal.orzel@arm.com>
 <2940b4c8-5d44-695e-4550-0a32c3a4c053@xen.org>
 <d5bccf50-c74a-40e6-843e-3ad682647efb@arm.com>
 <5121de30-644f-8a1f-ff1a-29c4d2ee7f0f@xen.org>
 <63a680c6-0086-230b-dbbd-dfe63609f9bc@suse.com>
 <b0b49926-9a70-37f1-43d4-ac4e852198ba@xen.org>
 <1013a14b-a45b-f37f-b2e0-e63b186a2956@suse.com>
 <ffa0e581-6a32-5c3c-7e63-acd5086c6822@arm.com>
 <e3a045d5-34d3-af73-89a7-7c306e7f8de4@suse.com>
 <168143f7-11e3-1acb-2de1-dba1a0db4ad3@arm.com>
 <55252ad6-021b-b96d-ae91-4ebbe4046dbb@suse.com>
 <d521854c-9aab-020d-75d6-ca085afa642a@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d521854c-9aab-020d-75d6-ca085afa642a@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::9) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 386c7783-14cb-45a5-efd1-08da1250fb66
X-MS-TrafficTypeDiagnostic: DB8PR04MB7179:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB7179F818AE0E6088F7198A23B31F9@DB8PR04MB7179.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Tx/8Ypm6cKWAiwSg7f9HqfbdwcFfJyubeEBMB/hZknwTvXioamyoR/AZd754JZRfrCUKcdhnFqd+Z89GFPkv44x7dz+zWijr5P5WAYuHVCFLU2jb9+E6Jy/Dbfc/CmZpfbemFh1K1PXNj979fjKZrbthLRhBSKN9/g7uviROrKJpCPBBCsJC51OZBiMNvqhsqoI+RcpBVbb+DU86zZihpKeqIvgZK/KRX0tvt7NI0IglCDczolguRZCC8MKvnZXYuTDE+5APJCy774YuYuyLi49mX9lrU6O0Uh6Jj+96ebQMmCyeb62mlyzhAdmhDhmumYGz0DovAW4x+kJzmt3NlSU6U3Bgl4K6pEL/RAfZd4rr8M98t4Bnj/TUEvh4LKJZX98tx9bsZ0o9KHnqfliwKJC7VSyG14zXGu4dcNxU7HXgEPXAbCzN5YVMOuniUtRSkq1EIAtYNtXZSP8ZfvK5Go6Eo2zwcD5PaMlAV9HDL5SiTzdDm0Z/RFkX9JpJ1kwMuxD4FpeOCxSnCXqgLm/vJQSztDo4P+Ccf6JOtZlvGGXvcy1Gc/hXDACZSJpxvoli2wFEexIDC5t+jWN52Z0orOQo6NdfbDNu3vaxPcXC61XbJwEghWeql4SnujkQIgMzifuhztq3BQ+0TMlV40jKN9mxK9pFGNHHC6Nz/9Po6jfOABYTIkS2VjjLHekUBkO5gRtmUH5DYFPZAP/p5ltdZeY4WegXcVl0DBjXAFlUsgs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(66476007)(186003)(2616005)(66556008)(4326008)(2906002)(31696002)(66946007)(86362001)(53546011)(6506007)(6512007)(54906003)(31686004)(8936002)(5660300002)(508600001)(6486002)(316002)(6916009)(36756003)(26005)(38100700002)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rzc5bVRmVmZtdDVrNm4vc2NLUzMrZEhXS0VPSTU5TURKRVhYMzBTa2wwVGVD?=
 =?utf-8?B?cGJvSkdjTy9hZ0xvbUdwQjV6VTFqd1FmSDduVFc1Q1R2bHlPNzkxMDRwTWxZ?=
 =?utf-8?B?bDJqZHFxd05WWG1GdnUyRi9TdXpGSDJZdlNTR2h5ZkMvQ1JCdFAzS2VEMFUz?=
 =?utf-8?B?elhDV3hRUzZhdDFHOWRKVkdaSjY1YTZlNmdudDJDdUQzVmk2Q2ZZR2hMMmVT?=
 =?utf-8?B?bEE1ejFWakFlWnlQNGxPUWFVak1xQmE2Y3M2L2x3bmltMlBhSzd5ZG9hVkxE?=
 =?utf-8?B?WDExWEJuOFc4ampvby9kVmZ5MDh3ZWVVclJtczVjdERUei9ESEZmd3VYSmk0?=
 =?utf-8?B?aldWN3NoYmkrdUNQOVBoN2Q2L1owTmVwZzNORU4xSE9ObDhuRjNpNWs4NytN?=
 =?utf-8?B?NFBvS2lLbVFJeGhnOFcxbjdDaUR0dDRGeHA0ZW9TYi8vZnFhZ3gvQlkwWEk3?=
 =?utf-8?B?VzF6a2pTNGdlTHRkaGNYbjE1bGg5QzRKZm45eHhhVDA1THIzRGYxbmdESmk3?=
 =?utf-8?B?LzVrSm1HOVREaG8wVFpkT3VWbVRBdmdYOTZmUVdTRUpjb210OXJlbjBRU1Nl?=
 =?utf-8?B?TzFudGFkN0dkNVNCbzg0eFV1ZTA0eUE4NTJxNjVSc01LYm96dFd2dTl2ZUFy?=
 =?utf-8?B?UmVYbTFwRktKSWJCY1plRDcyNEkwT3JpeDRrYjlSeHljNXlmdXh4MnpDM1Nh?=
 =?utf-8?B?bkpkb1J4MHVqS0swenhaUDJJeWpNeTk4ckw3S0NWNVVTMDhneklTc1lIZ1Nm?=
 =?utf-8?B?bmpoczQweGpHSVJROWZwd2NCeVN6WEVDWGliTXcyQlBuQmVwK3ZORU5Bck94?=
 =?utf-8?B?bm12SXhrK1czbVZBL1ZkeDBaREUwNFdnWUE1SlRWU2lrdkxDSitZK1lJRGZN?=
 =?utf-8?B?bzRsbDJmQndPQjFMNUcxajJhb2NDYS9tTkg0ZUpjWnhLdERFTFg5ZmVudzR6?=
 =?utf-8?B?ek0yZ3ZXU205Mllyc0xxNGU3T1dIV0pIT1JLeHUzMFV2WFZoRHhJZ2NSL1RM?=
 =?utf-8?B?UGxMVTJYblp6VHh3bjlSY1A3RFk0R0tQVWxxUzdUQ1VxbmNhVGV4R0NzaTJZ?=
 =?utf-8?B?cmc4Nlp5eXR2cGx3WTMzQ3o1UU5DRG1jemNIRmpqTmd5M2YxUkNVZ3U3WGhC?=
 =?utf-8?B?TmVWWktlNm10OFgrdE5DbThJS2tmOUxOSGdnMEltcEZaRE9UbVRnQjhqcUhK?=
 =?utf-8?B?ZzhhSUd3cG8zSG14Ym9Mczl2a1hXaHJUZENlQndmbGxJWStLQko4YmswNXNC?=
 =?utf-8?B?NEo1M2l2UTh0UjY3SlRaRHR4bmhWSHVFR3ZFeVNXWVNkRG9tNS9JN0ZVdTRQ?=
 =?utf-8?B?citMWFFJekFWQzFRRmt2TEVzRHZka3pyZVU3bXJnckRaNUEvRGh1RUFQaXZ2?=
 =?utf-8?B?bFYybStXUzNTbE9vaEVkN1AxNUpaaHl4R1ZYWGxvNHpaL2hXS0NjUmdjdjht?=
 =?utf-8?B?NUl3Rkhuajl5TTN0aDNDazYwbnpSTFpRR0VGdlFxYkU1c3Bsd2ZaQVJWM0Nv?=
 =?utf-8?B?REk0WXJzcXkyNWVPazlNMVdFUHk2RlFFWmRBRmVIN3NqQlYrd2w1NE5odFZm?=
 =?utf-8?B?cU00d2FjY28zNnVlcytma2UwcERtTzlVSm5UbVFGeG4ram50dTZKYWczdTRo?=
 =?utf-8?B?VCtoWEh1TmxGYXpJQnZPczdoZytCTTVDSE54OVZRQXpXd1FZdTdrejBaRUxZ?=
 =?utf-8?B?UHhzNGVoSVpmYnVMbzBVR1JMQytDZWpOR3YrZ1ZiVURrQXNEMzdhdlpUSVZ1?=
 =?utf-8?B?eUJJYi9YdGdJT290WVBSMTZGQ1hiMTRBM2ZlZFVJT0Q3akpNVXFIekQ2VmV6?=
 =?utf-8?B?amhQRUpyTWd6V1d4ZjdGcWd2Z21oU3NMOHVsMFhYUDIwRm5OQkdKYytoV0E0?=
 =?utf-8?B?OEF1bEt4NzVSN2Q4MHh6UTVKaVdiM1I5MS9QRW5OT09XK2g0VzRCMHV2QjBv?=
 =?utf-8?B?TEJCakpUd1AzK0RYSEF1dFpuTzh1a0IxM1BDRmVoU3JZOEhvMDdaNVk1N0lz?=
 =?utf-8?B?Z0VQbDJsY3JIalhNaHRBVjc4L29Sa3JEYTREWHNZcGpQSWJ6VFpxRWNaaCt2?=
 =?utf-8?B?dlJaMDlGN0RtV08rTGJJNGlNM2tiSFZhcE9jR1QyUkp3Ty9lZ21CbGE4bXJz?=
 =?utf-8?B?RFc1UGFPdlVhZUNrWlFSWENrZ2owbE1QWkN0TGhsNFJFaHVxVXNJMkJPUVdp?=
 =?utf-8?B?YTN2UG43a2xHV2REUks1RzZ2bTRBN3dXYVZReG1HR3hrcGdXWlIxTXppZi9u?=
 =?utf-8?B?dUNYR0tLdWR4Q01Jb25OemZ5Ry8xWkQweC93VDBPU0tOdXRSY2pKQ0RrNlY1?=
 =?utf-8?B?Zm5mTzhOY2NWRGIwaU5kQ0MvdStueU10VmlSaCsyQnJKNm1LM3p0dz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 386c7783-14cb-45a5-efd1-08da1250fb66
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 13:27:05.1639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e1SUXOXr5/MoFSrS0H2FC3pSH8g8vhrQsPS2syd3SZXuaWMAj8sXwNEUZYfADh53BOYzMyWAbC8QxsfGx3s/ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7179

On 30.03.2022 15:24, Michal Orzel wrote:
> On 30.03.2022 14:53, Jan Beulich wrote:
>> On 30.03.2022 14:13, Michal Orzel wrote:
>>> On 30.03.2022 13:57, Jan Beulich wrote:
>>>> On 30.03.2022 13:04, Michal Orzel wrote:
>>>>> On 30.03.2022 12:42, Jan Beulich wrote:
>>>>>> On 30.03.2022 12:32, Julien Grall wrote:
>>>>>>> Renaming to PE_COFF may help to avoid the confusion with CONFIG_EFI. 
>>>>>>> That said, it would possibly make more difficult to associate the flag 
>>>>>>> with "linking an EFI binary".
>>>>>>
>>>>>> Indeed. And EFI_PE_COFF is getting a little unwieldy for my taste.
>>>>>>
>>>>>>> I think some documentaion about the define EFI would be help so there 
>>>>>>> are no more confusion between CONFIG_EFI/EFI. But I am not sure where to 
>>>>>>> put it. Maybe at the top of the header?
>>>>>>
>>>>>> That's perhaps the best place, yes.
>>>>>>
>>>>> In this case how about the following comment at the top of xen.lds.h:
>>>>>
>>>>> "To avoid any confusion about EFI macro used in this header vs EFI support,
>>>>> the former is used when linking a native EFI (i.e. PE/COFF) binary, whereas
>>>>> the latter means support for generating EFI binary.
>>>>
>>>> No, that's the case on Arm only. As Julien suggested, it is perhaps best
>>>> to explain the difference between EFI and CONFIG_EFI, without going into
>>>> arch specifics.
>>> Could you please tell me what you are reffering to as there is no such identifier
>>> in Xen (as opposed to Linux) like CONFIG_EFI ?
>>
>> Let's call it a "virtual" CONFIG_EFI then; I think we really should have
>> such an option. But yes, if you don't like referring to such a virtual
>> option, then describing what is meant verbally is certainly going to be
>> fine.
>>
> FWICS, there was an attempt done by Wei in his NUMA series to define CONFIG_EFI.
> However as this is not yet merged and agreed, I would like not to refer to identifiers
> not existing in the code, even though most people are familiar with this option from Linux.
> 
> So by taking an example from Linux I would verbally explain it like that:
> "To avoid any confusion, please note that EFI macro does not correspond to EFI
> runtime support and is used when linking a native EFI (i.e. PE/COFF) binary, hence its
> usage in this header."

This reads okay to me (perhaps with "the" inserted before "EFI macro").

Jan


