Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5583F879B
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 14:36:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173015.315696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJEcH-0002wg-VO; Thu, 26 Aug 2021 12:36:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173015.315696; Thu, 26 Aug 2021 12:36:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJEcH-0002uk-SI; Thu, 26 Aug 2021 12:36:21 +0000
Received: by outflank-mailman (input) for mailman id 173015;
 Thu, 26 Aug 2021 12:36:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HXzX=NR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJEcG-0002ue-N4
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 12:36:20 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dfafd7b1-e0cd-4dae-ba01-f1b97dccae2f;
 Thu, 26 Aug 2021 12:36:20 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-19-bN7BRzLgN3mWYaCSzNUcig-1; Thu, 26 Aug 2021 14:36:17 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7150.eurprd04.prod.outlook.com (2603:10a6:800:12a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Thu, 26 Aug
 2021 12:36:16 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Thu, 26 Aug 2021
 12:36:16 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM9P193CA0028.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Thu, 26 Aug 2021 12:36:16 +0000
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
X-Inumbo-ID: dfafd7b1-e0cd-4dae-ba01-f1b97dccae2f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629981379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=24GvBSz44Z4/ZIPIAoyecQ8t5HGaUPkCz/TIDdKwSuE=;
	b=SpVKJAoVhLMRoIuMj+lutNdrsT/JVYaS70gHU3UMTkJoC8eoKwnoezgl5cUvDZDhTWEoyA
	c3qopOSLk3kktpocSKwC9ATqnN4gIbyEWlbcWLCvwyKhupcLt+mCyeEVtHMB/O5rfxseIa
	uLTja5NaQ49Kk48UriLbyAf62CBQjeU=
X-MC-Unique: bN7BRzLgN3mWYaCSzNUcig-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kpfc7ZhypjDJhAJxQF5NeZ6JuEj0qyjkul2WqVd5sRA2FYMNop5kZzsX0X2dwcBn4t6PGY552hF0GZvHpqw4Ek24N7a0tPpSY7FqgCQ7kGRM4Sna85HYMmuB8ZET9UFP+4IDMRE+rvOv8Hyp4hnR3u2CvLX81k/kJOKRkF0v+P6GW7QPdp+iczr6CSCIvrHlz/FV+P0sT6B75FKpU1K8HWBymsIuq9iFXLX/SZtgq7wBwAc2IrmFB/viDTNGr5bjmbz/ergumX13cElY38knxC3uytgDr58d80oFeEBxEMb6DhmnqszUY8WljNP1edHkaFgS68j1jybHr+2kK5om+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=24GvBSz44Z4/ZIPIAoyecQ8t5HGaUPkCz/TIDdKwSuE=;
 b=QbE4fmlMmsqRQ5ud6uqMag8toe+ldHFBDfR5daEg6lP9+T7XI8Zi7ucjMRv/sXVTC0FTUhGZKnjMiE13Q1zM71sxJAto06HkvucOMmq50/bUqkDkxpsk6OlkP9vsj9f1CXB3afQTn0YuARuOLkSr0ByUuxM/RzwVVF5SjPZ5vWKK05a4ddAyCn+I+VASqqAbMxuGffRQzruTVa3rWwDLC+xEQ3PBfKGSQfMirVxg9aRw28TIjuj1dVyLaj3j/O5Jldmrch2KOMYngoHmL1lOOpirHnthlIDf1691Wu52bBg5h6Uy4ejY0WDNJQ9RpBIEW/Y3vwMT/oqJ3epc12PIPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 17/17] IOMMU/x86: drop pointless NULL checks
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
 <25ad2429-df7d-95c6-ec70-4b23e6a023a2@suse.com>
 <e0092044-be36-800c-5909-6bd21de9b5e3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b17332b4-f3a3-f922-477c-01e4afd36c7d@suse.com>
Date: Thu, 26 Aug 2021 14:36:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <e0092044-be36-800c-5909-6bd21de9b5e3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P193CA0028.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43192981-70be-4c60-c3cc-08d9688e1923
X-MS-TrafficTypeDiagnostic: VI1PR04MB7150:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB71505250F1362EB87970D47CB3C79@VI1PR04MB7150.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vCSBzLVO/8bKVP+lQ2jBCeTvv/EXvquocuyDwqIyjQDFn3n7Lki8FA8GmoBZwbeqpVfrbc/QhLpy1Lptbsit0LudqUG3VWOjMJOiS4ViKsXbtNbu0ObOtvINGOcn4QER0thpfiwy+t7YnNbGt/mM7EivpLKnUIpsVsECvBiqRgVm5DnWcoVDQIwlhSBvXU78Uqj05e2D+b9VwuMtacFvK/UOF9q8SOCbty+zW6RDox/ZCTxFSccx/YfMcWL7ZoVejjV2RbytMvLEkJNofeSbfpu4kr3JNdW1fHGfahirzajImh2cMpZN8N9G27kBr0tegLzzGVvoqgMiTYOItZpXi+G2qKtTMGhbizc0vN7iP7Zq2t1PZdfcb6uZxWBOOqlR+Lj9ZTZcVcfudP3lDy5CDpH6RH9dfQVSFsv9Y9N2x8o489pEl5grCyLRlJaC6x/dJL1TX4HDGzmDuysgL8wMtKfnJVr+7WdK3x6a0uBCLG2Z9KyejR+T6go/i+URuURACOqlPzz49Njgm8I7Rx/2lgT3NTqDTt1yUwHua4AzKp/XM1LjOt9eWMufWaFaK/C3uOQONcKzvCEHK+e8l3rCACAXTfQcZ/yFMK47wvEo+YhvuX4qitYwHWRDPfP39Cwg5ked9BKLs85dFYgleuFFqFqkpCVur2SusFzDUeimgKZFCm3aiMltQi/49ffYJkAEIDmioYuaBW/K+lkZBqKHe756CaljVTFm0v+Ld4IljIc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(396003)(39860400002)(346002)(136003)(6486002)(66556008)(31686004)(53546011)(36756003)(66476007)(2906002)(26005)(86362001)(66946007)(5660300002)(4744005)(956004)(8676002)(2616005)(31696002)(6916009)(8936002)(478600001)(16576012)(186003)(4326008)(38100700002)(54906003)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmN1ZkY3NXpqRmdreS9kenVUang5SlZDbmhxWlNKbW8xMlFibjNDSmFDMkJJ?=
 =?utf-8?B?UmtiUHhnbGZ3UzJ6bGpkM3JkUlgvOGVYQ3RqOEF1QmlCRzFiT01VZWZPRUcw?=
 =?utf-8?B?ZkhDdzd0Z0pNbjl1T1BmTE5kMCswcVNZTUU5N0hyOHZUQks5WGFhQlhZdmE1?=
 =?utf-8?B?Yi83UE82TmRhZ01FVC9HcEJ1MFJCVmx2ZGc3aGpqdjhpcGlhMDMrclA1U2FI?=
 =?utf-8?B?SUs1TDdIMUtKL1lGcURiWVgyNjRuZm5PbWlpNEx4WUZodzRJZkRsbFEvUStV?=
 =?utf-8?B?ekZ5THA5cEFIWFVVM0kvTVUreC9BTDNTVjZaSEtVdnpzbHpSamtZTElBaHk2?=
 =?utf-8?B?M3RaeG12L3hsUndFdktESGpxam5aanBBVHBNMkkva1AwazBHcEh5Zkt3ZGZU?=
 =?utf-8?B?dXlFdnRnejRqRlZqenU2YU5CM01yWlV2VFBIaXEyNEg0R3lKTXRlMFVxdm81?=
 =?utf-8?B?dWY5U0ZkNEJFOWkwSTkwaXVkb2JkR0JnWHc4eWhrY0FQMW5GQW8xWWlnS0M4?=
 =?utf-8?B?TFVEbTFWRWVtODhjMWpQV1ExdHBTODdaMWhlakZSanNyalhqR0MrVm4rc1py?=
 =?utf-8?B?K3FhSlNGaHZyMlVrWXpURS8yYm9NeEdSRW9LTFBmc1VkYm1SbDAxQTNjb3pm?=
 =?utf-8?B?WVJwZW1RWEFBQ2JhSVp5NFNSUnJGT3E0NWFJUnBIYU85K3pBZGFFQktCWmEr?=
 =?utf-8?B?Z09NdGRKZzlSNW9LVGRvVzV3WDdTRnEybkxXQUNjMGNyMGZzWC9pY2h5dHg5?=
 =?utf-8?B?c2UweWhnTGRsWWt3MjdnVkRJTS91TWFHZkVETUkwQnMzYkJxajJ3bmg0K1hE?=
 =?utf-8?B?QXdBeG52TTRxaWRDQjdMV2NUNnFiUnMzSHV2RFJjRTRBcVFEQjNiRkd4SURB?=
 =?utf-8?B?dEdwcjVYYXlibGc5RU5LR1A5TzRxYTFsaVludEMvdDNmQVpDN0t1NTRyeEU1?=
 =?utf-8?B?OVFkekJzL001VDA3MitlOU90SU8wV1RsNzlLRm0za1V3VGYxenRWRytvb2ZS?=
 =?utf-8?B?MzgyY04rT29Kb0xlM2J6S2w1cGVGSU9NNFV6aW5NZWZlbXIwQmIzRmJhYnRu?=
 =?utf-8?B?Q2prcXdHYU40SWZJeTFDYmM4MkYybTU0V0JaSEtTQjlGTnhiMGVmM1AwNUNs?=
 =?utf-8?B?S3QycEhzTnBDRm52MlFOWlRkNmdidlRvbGpzM2VYMmttd29hMGdwZkxXMGZO?=
 =?utf-8?B?WmxHRmxSa0lud0lUa3RScTRlRlZ0UTA1cndnaGVNd2tyMUd3b3RFYllpVDB6?=
 =?utf-8?B?YnB0UjNFUkE3S1VVaHROMVdkYUxwejZwWVBpYlF5MnpQa215NWNqbTdQUG1I?=
 =?utf-8?B?dHRuQ0tSNGJMOVJKQXROSTlPUzFUYlprWVBtekhxUWNiOUVYbGpWaTBTUFFo?=
 =?utf-8?B?U3AyZ0Q2UmgzRERkRVdYK0VYUjdHbHN3SkNBc21RSTdHN3NtUTBXR2JtWUUr?=
 =?utf-8?B?c0k1cHZOVHFWWmtBaFZLS0kzVXJ4MG5oZHUxMXpMQzZ3WmhZdXV5ZXd2VUlz?=
 =?utf-8?B?VmtVMGszNC92bTZ1NVAya3pNRVZCL25neUNJTGRLVVp1RnRWd2VtbFBZcUxl?=
 =?utf-8?B?RllxbXJsVXhQcEhGNUljcWNTSm50NHV3Wnpqc2ZqSUhtamRLdkpvUU5Yd2xU?=
 =?utf-8?B?ZFIydEpXY2ZCY0FQRmEwdzVSMjZwRStYc05tT282VFZtQjFBbThROGI1Vm9t?=
 =?utf-8?B?VHY4TEtiRW5RanMzMnc0NkZQNG9BUmhPdlVYZFFNQlluL2pxQjFSMGxKVHVQ?=
 =?utf-8?Q?UgdbQ7Xj0hCioX/JoilZ+PMZ50yS2hZlO9OPdMN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43192981-70be-4c60-c3cc-08d9688e1923
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 12:36:16.7264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GP9XQ1EYbtmUc+1Ptd+8NCC8nKA7xUvECbbmMDzGIWnVY6BZqVboJrPKYYKq9OCVkTQtPdSLibD1DXFqiIGRrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7150

On 26.08.2021 14:05, Andrew Cooper wrote:
> On 24/08/2021 15:27, Jan Beulich wrote:
>> --- a/xen/drivers/passthrough/vtd/utils.c
>> +++ b/xen/drivers/passthrough/vtd/utils.c
>> @@ -106,11 +106,6 @@ void print_vtd_entries(struct vtd_iommu
>>      }
>>  
>>      root_entry = (struct root_entry *)map_vtd_domain_page(iommu->root_maddr);
> 
> Seeing as you're actually cleaning up mapping calls, drop this cast too?

There are more of these, so this would be yet another cleanup patch.
I didn't get annoyed enough by these to put one together; instead I
was hoping that we might touch these lines anyway at some point. E.g.
when doing away with the funny map_vtd_domain_page() wrapper around
map_domain_page() ...

> Either way, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

Jan


