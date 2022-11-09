Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB3762279A
	for <lists+xen-devel@lfdr.de>; Wed,  9 Nov 2022 10:53:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440780.694958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oshlI-0006S9-N3; Wed, 09 Nov 2022 09:52:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440780.694958; Wed, 09 Nov 2022 09:52:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oshlI-0006QK-JB; Wed, 09 Nov 2022 09:52:48 +0000
Received: by outflank-mailman (input) for mailman id 440780;
 Wed, 09 Nov 2022 09:52:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xaUo=3J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oshlG-0006QC-PR
 for xen-devel@lists.xenproject.org; Wed, 09 Nov 2022 09:52:46 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2059.outbound.protection.outlook.com [40.107.21.59])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4267830e-6014-11ed-91b5-6bf2151ebd3b;
 Wed, 09 Nov 2022 10:52:45 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GV1PR04MB9118.eurprd04.prod.outlook.com (2603:10a6:150:25::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Wed, 9 Nov
 2022 09:52:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 09:52:41 +0000
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
X-Inumbo-ID: 4267830e-6014-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mIIamHjsUkeoi4K4u9Q3ihUbxwYER6L6IEGIi+ML2QJw1mqN4GB/DGqU6Qf6D36ncPDN+CYO3K7UlSx7AFBwJY+2+zIee2QQ9z4NPoiKfaFnS1HmDiUI6Ri57gzxz3WQSB5F25DbtY6C8T9zfuSO+4Je7R7+dm5eSgq9K3H52dHg7nCR/Wf+Wnikeu8o/7kuDc8WAHlbXV7HHpFBFLrIlci7sumrkRrBmuFmu2+wbMowv4rfnteAzI4QQkNWJ254D2PFRCJ4ulMjEDO0V4ZF6q6CPBIEt23DhhUWnEjbFoTwf4Bcbx3i+1iBB/2/ylRlQkojdZg2Ma+mK5kuSthdYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dygYo2ft2YbfUZF/MLaTeCHoCxPkX1HxZtZsxFYVt88=;
 b=R30zbTRgoz5H57yz4kjNFQ9AEE5WwZy4vWaY1r2iGEAM+K41kQq9zTpp9pQU9aQhA0Vr3XhFzB6R0PxV1s5jn2F88MYhgjJ+51Tu/p8Am9/Gy5X04aRqVX5TzkkTeD+TfGWqVu755WolzjBkRDsOhqvwCSeugjUpKcmhE9sPETeY64+vZvDV0cmMnrLK0jjvAZ7Yr1VkpalavxlBp7JHqmZlQBms5cy9coKAI+5aJCBtntuz/1vAjSkYTHy+Dtd7exo7OyNGGL7Da+UnULmfApgNXFrV7ozWM4V6PoUgpWEEZtf89FeebtB6GKMRMX9NJR6iE0Rl8lF6+zb10AymfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dygYo2ft2YbfUZF/MLaTeCHoCxPkX1HxZtZsxFYVt88=;
 b=knb82Yj71TX8dsy9WglLYiAfCtwi3j3F4MqyYecu1CY4GsdIDzuQMr9/wi/SFtVw9b3MQeJUYE1lsWJxLApNEAioHYDde1wUVM+s26uBNP8QiJ85IUF/M3Yt5446DhsT63YJQ9MrMq2P44kNogXeBrxMeodXTH++AEq7I/J+57FwNthwwBq7+po55pk7FI7QgDJI2pHg/Tj0xEBjAtBivD6KJbkHOmVtEKllp27O/9JajZLvh1UB840baFtA2DpueEnXCCYbGADHPALdHkYBVU27DasMXdMN/9hGPLSQGHaWxyshcUfXEtKgDdK/Yxq11tIGkCxAPNsAIhlY6zgKpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2d734f9a-0b50-8164-3fce-3efaca6d7b61@suse.com>
Date: Wed, 9 Nov 2022 10:52:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH for-4.17 v3 09/15] tools/ocaml/xenstored/store.ml: fix
 build error
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Edwin Torok <edvin.torok@citrix.com>
Cc: Henry Wang <Henry.Wang@arm.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1667920496.git.edvin.torok@citrix.com>
 <09afc07ba0ba65afc02028bd6b4950d8e51af69b.1667920496.git.edvin.torok@citrix.com>
 <AS8PR08MB79910C8281C7C356450152C4923E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <1e994604-7a3f-ef5f-63f4-d03e4abe4124@suse.com>
 <D9D3FE01-976F-4609-BBED-961BE59E09F8@citrix.com>
 <09c03186-bdfc-d931-33bb-e589b074726e@suse.com>
In-Reply-To: <09c03186-bdfc-d931-33bb-e589b074726e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0123.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GV1PR04MB9118:EE_
X-MS-Office365-Filtering-Correlation-Id: e2d9fcb1-b706-4d99-9262-08dac238248c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fKgo9DSbXc06ziwgqk9kwHMrhCgP3Obn6G6VfRndMDRedfuxtOFnPoe9+tAU4l3xKSJLiI6rM5C99jlQFnFK5MHmOHyJKMnUNlZJPD9LLBqJYjMfyFWyDz19W+JIyWdb8eR4bwBXhsD+b6pOIsAYAOW6hqbB3MH6Ge3JwX93m8/bf5j+5LUQRYjvus4QUw7d6OwYkqmX4Nga1Iw2OuUJs4GZo2Yq8UOHUWWRcG49PrYJ7taEtuBcYxpeTDiOVkw958i4M2IfdZbX6ogUb2oBBdmU7LvPtYRmrUoRGjiI3d9H2gUQpZC259ILBOxfQWWTaijgZ46Z8o4JwlzPf0rayfAYl/e/xIUlNncGYYGtGZVfTxrd26uL5m/8+MrpHiyuYAO9dyaIQJY8TJtWMxBip84uGOCgNat2rpW/45K18MYl/E25JFeB9hXYiXMSxKHqgpbPrqTtpl5QezJj+Dzb/o/jngJpLFzQxfFj8158NlHLx5PVuaKk8wMflpyLuUIsOww7REyMfn6T3NEVFiJduvBs2/SAQpkK1mhzQtlsAIWiZRF59wcaBRZjkUnhOEAlHL27rSldwprGPY4l5nQDDTTB0ttbF8YezAgALsoQtxOnvpk+nOJikE4w7oaOXDUdk8KiKxotN+mjKcxFaFqRuOFIArdma32vppLQNa+KcptAsDSZL4uXEUiUPW7OcdwCATbyAJyAWBH7qa+HPEl+mVbLsDTHoYwWWkRLYeKKDsd2QLzEFpU+UVx4rbBO7VU0a+pqkGKDMDroGd2JdsrLuREYhpVaBADBMZ/tt6EyUQo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(39860400002)(366004)(346002)(396003)(451199015)(86362001)(31696002)(36756003)(38100700002)(5660300002)(6486002)(83380400001)(2906002)(53546011)(6506007)(66574015)(6512007)(26005)(186003)(2616005)(31686004)(66476007)(316002)(66946007)(8936002)(8676002)(54906003)(478600001)(66556008)(4326008)(6916009)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3lwZGhtMkJsZkt0M2tMQko4Z0NtUGpucVNOMmxoRTY2N0lkMUNpdFh6SmNp?=
 =?utf-8?B?SUU2SXEyVzczWXpVK2xNM05LU0pTNlFzKzVKUS9uQk9vaWtGb0FtaTVCV1BO?=
 =?utf-8?B?NExFMm5oYmRDZXd3TnpaZ2w2ZXNSMEhVbjFkSzlhMG15UDdwWG5YR2hEd3ZY?=
 =?utf-8?B?VzdESXUwUlR6UjU2Q1l0UExiVGxQWC9zMkd1YVE4dDBrY3hxeU5neUdPaWky?=
 =?utf-8?B?eHpNQkhuY3ZJdnBiOU0xOUpsSUNzUlZhTXNpdDNXdE9CUi9SOFlIS0FQalA5?=
 =?utf-8?B?QUlnekxTOTVpQkxCQTc3OXM3V2F4UFFaM2xGLzN0cnBuMkl3WXRtaVdOTmdm?=
 =?utf-8?B?OXowRXlabUJpMm9KWXErR0hWWkVOcXdEbUkrVWtETVUyTDJrblNQYmJpWTFN?=
 =?utf-8?B?aE9yOUF6cDNPN01PTkdVaVFpazJDQnBkbzN0Rmt4Q0syUlFiZUUwbkdTWURy?=
 =?utf-8?B?WTlyRkw0c3liZStLdjNmL0RQWTYyLzE3M2VIWk10cm9XaDYwdDdzRTUzRVNp?=
 =?utf-8?B?UFRIZXhYc1FTZ095TDR6WUFQa2lTOVdOb2lpUER2cjgrY1JtKzZzb1gyRVM1?=
 =?utf-8?B?ZEJNV1lFRE11MU5UL091V2dBTW5UTXFtM2RvZXpUNEpIZExEUng1WEpzNWNL?=
 =?utf-8?B?VTIxZ29uMUxFdHI3VWdNNy93THVLYk9nLzVDZ2pCU2RpQjhTQTBZekNHVjVp?=
 =?utf-8?B?TkV0R2JjakxCcnF0cUc1Q3JVTVl3VnQxZWFlK29FajRaQnN6OGpSdXl0dXA2?=
 =?utf-8?B?V01DalBHVUdUWGdLS2JvbnBoVUFPZFNlUzJZRHp3OGtqRUlURWhqejdmOEpM?=
 =?utf-8?B?bFh5V1NNYW81Vk1PRjE4VjhhWUQ2N3hka3B0Y05FeGZzQ25TS3h2UFNGa2Ux?=
 =?utf-8?B?MXJiYkkzU0N1RDNBSUtvNlhZUG5vVkdDcDVqL3dRdVlkZVVCK1NDNWdkSUlj?=
 =?utf-8?B?ekE0UExSZ0dVUmN6ZHVaTlQrSyswQ1k4R3dmd2xRb2h2OFcvTHUxNk5QU3Rs?=
 =?utf-8?B?dmM5dHIrUkluTkJvU3RQVlB4MlhudExnSjI2ei9lOG9Jbm82NU4rV2x5eS9a?=
 =?utf-8?B?WGYwRWNwY3FodkFyc2l6UE1aNDA3UW9ZeWMrcTFrdmdaNS9WWGtsTUgxUS9o?=
 =?utf-8?B?K0FIKzRuVjBkUWNiRTFlM2RrV2JGdWxOMFloSitZUXRaZmJrMW5SdFhFVThW?=
 =?utf-8?B?SHlDV1RFVkhsODg1bk4weXo1ZnFFSWFSbVVmNW5QNGdMZkJVMDVrbkhhSXoy?=
 =?utf-8?B?S2pBdGR6WkNaZkNMOHE3S1NjSXFONFQ1T2RVbFpaUEUyUkVNRURERE9veU1m?=
 =?utf-8?B?dUpueHRoaG1nSEpucXFFN3p5SkpMcTlFUW5DTFUxS09DL1VIdXhzTlE3VnRH?=
 =?utf-8?B?SERFRTg2Tm1PYjRJQXluUlYvSVV4OHV5NnBRMVNOTE9nYjlMSzd0Z2poNmZs?=
 =?utf-8?B?am8xaTlGMWNQQnpRblhURXpmd1ZFNUxvWGg3V1RoRXcxa2lZNm1GV0xlVVlU?=
 =?utf-8?B?cFQ0LzNTSjlHZ1piS3dzclVjSGkyYjRjcXJ3Yk5mOExGWGxiWmowVzFIdXdO?=
 =?utf-8?B?NzAzbDBxaU1Yb2c2bHFRWkt5SldqZ2hLQWxjUW9xS2p6cWtPMHd3Yks3dVRR?=
 =?utf-8?B?bk9OTzBlU3ZwWmtlSWFBV1dkUjEzeUpUcDRxSHZ3UFJTL1BVNXI3U05zcUEr?=
 =?utf-8?B?dUptY3FpTUZLOXJyZXROLyswblkzVy9XeFcwSEE4ZnlDR3A0TTJraDh6Vk00?=
 =?utf-8?B?N3pIWGc1ODBrbmhoemIrL0VrRStINExkLzJ4bDRIaFM0b0xyM2UzeEl5T3RD?=
 =?utf-8?B?bGM0L2xvVSs5bzBvZGdzZnRzTDVEV0llcFg3UlduMExIZ2taa3JVdXRKOXlq?=
 =?utf-8?B?WTBPeHpEMTBrdkI0L2NtdXVQQjk0VS8xa0JRV2dxYWE2UTUyUy9sazNXcEQz?=
 =?utf-8?B?Y0VJZVdmR2hnN25MUWpFZFFTVzNZeDd2WnlHcjdLTW9WZUxURGthdUdFZXFr?=
 =?utf-8?B?a2x4ME1iVlNBVXppM3ZBTXlwa3pyQW5TeGp3di9tSUp3RkVpeUMwZFFPK1k2?=
 =?utf-8?B?VWJ5d1hKN1FpVVNqTzRzemg2cXRrZXRoVUZZRG9oYUJOQkdGMjM4cVBHU1FG?=
 =?utf-8?Q?mhxM5izpSfb+6EcAkas5x2YKg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2d9fcb1-b706-4d99-9262-08dac238248c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 09:52:41.5058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qdf5Mq5JXQps5irMYpDTgYundSBmyq7YZVIU8nfd8CzqOxI12c6QvAT3SxC/Jo2rvGudL5RnAHOAMWJrQ9yh1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9118

On 09.11.2022 10:36, Jan Beulich wrote:
> On 09.11.2022 10:21, Edwin Torok wrote:
>>
>>
>>> On 9 Nov 2022, at 07:10, Jan Beulich <jbeulich@suse.com> wrote:
>>>
>>> On 09.11.2022 03:47, Henry Wang wrote:
>>>>> -----Original Message-----
>>>>> From: Edwin Török <edvin.torok@citrix.com>
>>>>> Subject: [PATCH for-4.17 v3 09/15] tools/ocaml/xenstored/store.ml: fix build
>>>>> error
>>>>>
>>>>> Building with Dune in release mode fails with:
>>>>> ```
>>>>> File "ocaml/xenstored/store.ml", line 464, characters 13-32:
>>>>> Warning 18: this type-based record disambiguation is not principal.
>>>>> File "ocaml/xenstored/store.ml", line 1:
>>>>> Error: Some fatal warnings were triggered (1 occurrences)
>>>>> ```
>>>>>
>>>>> This is a warning to help keep the code futureproof, quoting from its
>>>>> documentation:
>>>>>> Check information path during type-checking, to make sure that all types
>>>>> are
>>>>>> derived in a principal way. When using labelled arguments and/or
>>>>> polymorphic
>>>>>> methods, this flag is required to ensure future versions of the compiler will
>>>>>> be able to infer types correctly, even if internal algorithms change. All
>>>>>> programs accepted in -principal mode are also accepted in the default
>>>>> mode with
>>>>>> equivalent types, but different binary signatures, and this may slow down
>>>>> type
>>>>>> checking; yet it is a good idea to use it once before publishing source code.
>>>>>
>>>>> Fixes: db471408edd46 "tools/ocaml/xenstored: Fix quota bypass on domain
>>>>> shutdown"
>>>>
>>>> Nit: The format of this "Fixes:" tag might need to be fixed?
>>>>
>>>>>
>>>>> Signed-off-by: Edwin Török <edvin.torok@citrix.com>
>>>>> ---
>>>>> Reason for inclusion in 4.17:
>>>>> - fixes a build error in a previous commit that is already in master
>>>>
>>>> Yes, given this is a simple enough patch:
>>>>
>>>> Release-acked-by: Henry Wang <Henry.Wang@arm.com>
>>>
>>> Afaics this patch was previously posted in isolation, and it was
>>> already release-acked. What's lacking there is a 2nd maintainer's
>>> ack or a proper R-b. When it now is patch 9 in a series, it isn't
>>> really obvious whether this could also be committed in isolation
>>> (it looks like it does, but a clear statement to this effect
>>> would have been beneficial).
>>>
>>
>>
>> You're right it already has both acks, it just hasn't been commited yet: 
> 
> Oh, that's only because I overlooked Christian's ack. Will commit this now.

But, sigh, I had to fix up the patch: Even the one submitted standalone
used space indentation when the file in the tree uses hard tabs. And
even if I had wanted to pull from your github tree I would have had to
fix up at least the Fixes: tag. So I ended up hand-editing indentation
...

Jan

