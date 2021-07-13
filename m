Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AE33C6E54
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 12:22:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155274.286675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3FXV-0003dF-5D; Tue, 13 Jul 2021 10:21:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155274.286675; Tue, 13 Jul 2021 10:21:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3FXV-0003ac-0e; Tue, 13 Jul 2021 10:21:21 +0000
Received: by outflank-mailman (input) for mailman id 155274;
 Tue, 13 Jul 2021 10:21:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G3ja=MF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m3FXS-0003aW-S1
 for xen-devel@lists.xen.org; Tue, 13 Jul 2021 10:21:18 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b97abda5-57cf-4e77-a560-f79e43d45cb7;
 Tue, 13 Jul 2021 10:21:17 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2052.outbound.protection.outlook.com [104.47.4.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-8-O-m_LBK0OwS0UEUFC7sWAw-1;
 Tue, 13 Jul 2021 12:21:14 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2448.eurprd04.prod.outlook.com (2603:10a6:800:52::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Tue, 13 Jul
 2021 10:21:12 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 10:21:12 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR02CA0210.eurprd02.prod.outlook.com (2603:10a6:20b:28f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22 via Frontend
 Transport; Tue, 13 Jul 2021 10:21:11 +0000
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
X-Inumbo-ID: b97abda5-57cf-4e77-a560-f79e43d45cb7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626171676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YPogjXGnneTfopHremv1nQK2ZA0ZEzkrqvTgoUvG+No=;
	b=ia9X4C7iIANT7Q56sDwsUGn2FtP4ZnVKViTCofiVfHLoaboTovKG3UowgwrcVv9Ng7zRhc
	/UlX0fEiK7JL2V/f2VrY4QomtNcudwGthFbuqqbH4FlfzJVj7BplO/9bssbLVfgwA5hjYX
	YAF4o+i5ihrEFZuGTbPi/mprobBOuPY=
X-MC-Unique: O-m_LBK0OwS0UEUFC7sWAw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vuzqk5t5i55oceFN4lsD8S8OjcNHlBsMbJSm4xioe0CAqudPSg5w7RH5Oo9n3HENFqcYVLRc/Fv8Knw5qNiPSgfhcdsqdmV/In5oiX4YX3lZ4kJWYMRJPpoa3lYE+b2FmenCBapBls3mYJik0+uU5b/JeBEJGp+QTQSdBG/2iQXtmjjJosGijr2eeQBvrrgnUQSoSq2YmJDcvl+BQ9LCq8AsYsETsB2Wv6dtUP5Sqz3ZFwhymg4UPn6caYBnIdPEqh3f4ed43xMMA9NWA0DcAFvs7vSP+ujx01WziaiJoGkd4PnQKBHGIf3ZOPz1FLidoBhIEVBOZ3y1E2xXR1L2xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YPogjXGnneTfopHremv1nQK2ZA0ZEzkrqvTgoUvG+No=;
 b=YmVOdv1G7dDWRN3lT7S3Xq1mxMuw8qa+ddgesEbxEIwIgbCTZxgTZRGL4rPB/cuMplMLtD+uCHm1FxmBlQpIBsiiJBX9GmVXgOd2AwOhsfw7CIl71gKLYMygFP2DlppP2nkQHpGugbY8nHL3TTFUxwlAXdWJj16qU2n/FNIVAyskxb44vRgcdP1iep4sswZ+5AvYeqfVBYuA0XPXKH7aCQL4OqC5gOM/XZRJ8X0e1mTMC4NB4Q1afszY1AE+G+AV3EVH/hi59v+lcLVS69/Ir2bEnfGolhVbhlnp4AB1z7CbG1w3pJo4/ydZDcWVqF3ESl6+WLFkGle34e7IPN53jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: DMA restriction and NUMA node number
To: Julien Grall <julien@xen.org>, Wei Chen <Wei.Chen@arm.com>
Cc: Penny Zheng <Penny.Zheng@arm.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <DB9PR08MB68573DE6333A36646EDC75409E149@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <89025168-bf55-5dff-db61-989b95934775@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <080cf741-7a11-4df5-5f24-cc7680f92151@suse.com>
Date: Tue, 13 Jul 2021 12:21:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <89025168-bf55-5dff-db61-989b95934775@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0210.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 160c9035-d322-4cb8-a5c9-08d945e7f04a
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2448:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB24480B019B08E1DD9DD23E27B3149@VI1PR0401MB2448.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1ReSOgYQg5wUvC1W2dDYL+pFYIpYhElHgrIlWUDqOAxQnnfnZjqOMn+Yb+T4yAYL3l5yx1pOFFkQBIuIPoT9JveH18CqaSoqSDcnRygypDpv25crcN47lsLd/nnTW7RTJ2pjyxP5YnTdNl91dB4PPBicmUOftXoiyuyA4INdWiTa+o1MzOhTXD0kKsQqzpIYmCFVP7WYHncl+jaCMs8plDfoSsQTcFqPtCwlD4mfUqKqPd+EffNkRMN7L20JpPYIUsyQUHYkeeyuX7S0BUvgH5aWq9PuqiT6tjm5N5iUCefUPCjZTNUOfyO4CuYf961jwmiwM6HzRaaakSz29yXzvr4mRC/D0ZG7Dj2V899UWnS2vZcP1W3gxBWzyWvFLwug5L7gaxinepDAUY2QTIJFoLlptG1C08tk0j4GQS7wuVZT1xgc8zGB4Prl/srNiBbwr3d87n8Sf+lq2X0cC1el10F2MygasO1vUrKN4YZd7SgJDuLmYc7oS29cc3SBVCUF4GHb78px6DRiIrn+yuMfbNGa0vz6JOjqnXQaElB6Oc3yEIO9ar8QtaJ4tCvLaCEiIStbQVYFtmIIsP0YL5NMdZHdzFS5tmtd6b6H3dcEMdNMkf7A/Q4f4llbCHsIiBKB6X+QJ2tKkEUiZhsY/0gG3Ig8zPAeBd7qH47NYC0piU1PioVIVoffP3Nb06chifGQZ7m7WV+b4/7YjD2AA5Qbp3fUvtg8p/GI6wVgWDi5Ke0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(346002)(396003)(376002)(366004)(16576012)(316002)(83380400001)(956004)(2616005)(4326008)(110136005)(54906003)(8676002)(53546011)(6486002)(36756003)(31696002)(26005)(186003)(86362001)(8936002)(478600001)(5660300002)(31686004)(38100700002)(66556008)(66476007)(2906002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUsvOXVSb3hNRlhucU1aUERDcGdQM2lDb2l1WncrMXFoaUYxYUJpTXNIZVky?=
 =?utf-8?B?TlJsM2VoeXVINTBUU0RJV0xqK0tpZ09qSk1ZNEZkeGlVTkw1NFpCbFZiN1Bs?=
 =?utf-8?B?ci9rOHJuUU1acTRHMnlVU2NQSnZFNFFsNG5lbzhCTDMxakdmTXRrTlhYQjYr?=
 =?utf-8?B?MnM5OGxUeUl5U1VQY3ZhOG5xWGxjNE9YdGp3MWhOeTlXYW1SaEZYQS9pLzJX?=
 =?utf-8?B?MHRoTnVNbFZIcGJQK3paU0RIKytRMDFyVC9zOTlFUWF1aFZHRFk5VHdtcWRN?=
 =?utf-8?B?Z1RMRFAyQjQ3NDZGbzNZb2M3MEhrSVQ0dGduTkZOSmtZcDBRS2hReUpSb0g4?=
 =?utf-8?B?d1NRVEVtaTNvSklTeHpSVDVydkdFbzlLU1QwQjZwVTNwVlF4OGdFWWhZbkZj?=
 =?utf-8?B?ZFZEZ0t6S1BVbHdtcG9CTDJWR1J3RnFvY3FIRnFRbE1kVHp5cUN4VVhHRGtN?=
 =?utf-8?B?bUFXVndLWjVCZU5sVkw1ak5LWllLQjFSMXZlY1A2VjRSSEIvNVRGTFREVmxl?=
 =?utf-8?B?QjJEUnp2OVpTa2VRbEhDYXNJSS81NU0yazhVcVd3VDlVSERxYkxDaUdEVEo0?=
 =?utf-8?B?MHpwTEN4R2poRFBTSENIMDB3Uy81YzdGMUozL24vK3htSGZDUlRGTTV3Z2lv?=
 =?utf-8?B?b0NwZVFuWnFRKzFnOElvOWdQUWl5WkYyL1ZuS1ZHQTVyWnVUYjQ1dmxnc0VW?=
 =?utf-8?B?VzhqOXVXMkhQMWJ6T3RBajVsUkdmbThRU1RUM3ByM0NISHJ0bXdTd0Fhaysw?=
 =?utf-8?B?ZytIZnpTR2VOV0huOXZBQWR1bU5iSkdKNHBHSG84TjJDbk1pT0NySHVVNkJh?=
 =?utf-8?B?SndrOFNVZ01nT3VUZmphcVdmRHRSUktnTm1sbHpRTmJ1czJhOWk4T3RIOU9s?=
 =?utf-8?B?QUNYcUxTS09XdENFM3U2SDB4WmRsLzFvSWZEeU5XQzlCbEt2eEgzZ29ZNmRk?=
 =?utf-8?B?cTZVcXd4d3AzQU9mdEllZlJaR0QwZnZjOENTZUFOeDVaL1JEZHhaNWtiR01C?=
 =?utf-8?B?M0EyclEyeVZzRGtmMnN2b0dlZnI5clR0QkhMNlQvKysxN0pNSDhRYWRld1NE?=
 =?utf-8?B?TlVsQ3pRV2p4Nm1HbmhCVVZpTDFCampBNWYvYmlrL1hpMUMwcHN1YjM5K29V?=
 =?utf-8?B?clcvNGQ2SEdYQmo5YkVheHoyekExc1BGWGQ0aThOVGtVOUxKMXUxK01lTzBn?=
 =?utf-8?B?VVcyaDYvblYxWFJDWlhLZHdma3NYUUZkUXF2UXFJRWJMYWpYRzZ1Q1p5N1Ja?=
 =?utf-8?B?L3ZhMEhxc2V0OUdFQVNldXdiSS9LY25HVzFhdnhHN3pMVElIc3VrZytGQWk1?=
 =?utf-8?B?aXk3eUUwMGppZEFXbnp4c2luVFJGaFdvcDFWS3RVcTFMai9iWFA3blpOWHFi?=
 =?utf-8?B?bndyeG5CelZ6TFMxVGR3MlE1Y0R6OTV6a0xrMG85aXJZbmxDbngzTW1sOTFj?=
 =?utf-8?B?ZWFrNmdkVldSOGVWNXlrcU53bHNzOExZSTRkQ3lZcDdCZUFSUldEckcxclJS?=
 =?utf-8?B?WmdxSEhuelF4RXBPMTFGK2pxZEZLWnlYQXJFR3BnRjRCZFhyd0tFMXA2SFlj?=
 =?utf-8?B?MmhWNHIyZzNKNFhiN2pEdXgyWC9RWUEwbWNUTGxmQzJCdGxLSlJ3WDdiRGJr?=
 =?utf-8?B?bFF4c083TEVCUERBVFZYMmpJVXFPMU8zemt5U2tQY3BmOG9ka1k0S0VrbGNa?=
 =?utf-8?B?NFZsUGFIWnJXQ2hWZmNQcVNQZkhwbmFFTnN3Vm1WU25USW5lK3FGb1BFOUNK?=
 =?utf-8?Q?M4QNY1X+QshGm5QSxP5JuMGN9UdWVPBReNJsju1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 160c9035-d322-4cb8-a5c9-08d945e7f04a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 10:21:12.2031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: POmMLbiCR1+crF6naT3iK5BObrt8UVjZa3MF+bJVZThB9rp5FJaAcgdg1fpy0sOX4KuNsbjGsJykAJuH0STXog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2448

On 13.07.2021 11:26, Julien Grall wrote:
> On 13/07/2021 04:19, Wei Chen wrote:
>> I am doing some NUMA testing on Xen. And I find the DMA restriction is
>> based on NUMA node number [1].
>>      if ( !dma_bitsize && (num_online_nodes() > 1) )
>>          dma_bitsize = arch_get_dma_bitsize();
>>
>> On Arm64, we will set dma_bitsize [2] to 0, that means we don't need to
>> reserve DMA memory. But when num_online_nodes > 1, the dma_bitsize
>> will override to 32. This may be caused by the Arm64 version
>> arch_get_dma_bitsize, it may be a simple implementation and not NUMA
>> aware.
>>
>> But I still quite curious about why DMA restriction depends on NUMA
>> node number.

So really do you mean "node count", not "node number"?

>> In Arm64, dma_bitsize does not change when the NUMA node
>> changes. So we didn't expect arch_get_dma_bitsize to be called here.
>>
>> I copied Keir's commit message from 2008. It seems this code was considered
>> only for x86, when he was working on it. But I'm not an x86 expert, so I
>> hope Xen x86 folks can give some help. Understanding this will help us to
> 
> It is best to CCed the relevant person so they know you have requested 
> there input. I have added the x86 maintainers in the thread.
> 
>> do some adaptations to Arm in subsequent modifications : )
>>
>> commit accacb43cb7f16e9d1d8c0e58ea72c9d0c32cec2
>> Author: Keir Fraser <keir.fraser@citrix.com>
>> Date:   Mon Jul 28 16:40:30 2008 +0100
>>
>>      Simplify 'dma heap' logic.
>>
>>      1. Only useful for NUMA systems, so turn it off on non-NUMA systems by
>>         default.
>>      2. On NUMA systems, by default relate the DMA heap size to NUMA node 0
>>         memory size (so that not all of node 0's memory ends up being 'DMA
>>         heap').
>>      3. Remove the 'dma emergency pool'. It's less useful now that running
>>         out of low memory isn;t as fatal as it used to be (e.g., when we
>>         needed to be able to allocate low-memory PAE page directories).

So on x86 memory starts from 0, and we want to be cautious with giving
out memory that may be needed for special purposes (first and foremost
DMA). With the buddy allocator working from high addresses to lower ones,
low addresses will be used last (unless specifically requested) without
any further precautions when not taking NUMA into account. This in
particular covers the case of just a single NUMA node.

When taking NUMA into account we need to be more careful: If a single
node contains the majority (or all) of the more precious memory, we
want to prefer non-local allocations over exhausting the more precious
memory ranges. Hence we need to set aside some largely arbitrary amount
allocation of which would happen only after also exhausting all other
nodes' memory.

I hope I have suitably reconstructed the thinking back then. And yes,
there are x86 implications in here.

Jan


