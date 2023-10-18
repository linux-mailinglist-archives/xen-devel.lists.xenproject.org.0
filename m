Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A00607CE07A
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 16:57:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618662.962595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt7yr-0004PF-7h; Wed, 18 Oct 2023 14:57:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618662.962595; Wed, 18 Oct 2023 14:57:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt7yr-0004Md-4z; Wed, 18 Oct 2023 14:57:05 +0000
Received: by outflank-mailman (input) for mailman id 618662;
 Wed, 18 Oct 2023 14:57:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EezS=GA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qt7yp-0004MX-CD
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 14:57:03 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2053.outbound.protection.outlook.com [40.107.13.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 978dd7b3-6dc6-11ee-9b0e-b553b5be7939;
 Wed, 18 Oct 2023 16:57:01 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7818.eurprd04.prod.outlook.com (2603:10a6:10:1f2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.22; Wed, 18 Oct
 2023 14:56:28 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Wed, 18 Oct 2023
 14:56:28 +0000
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
X-Inumbo-ID: 978dd7b3-6dc6-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gxwgm2Fso3dUsMlbK1z50APGPX8GSrTl5OqqG9R51yOlsQdyN4BbZeWC4aAnEszf2hLEBfLKcgyH2WOLufRpw+8/j1VJOz8nx577wEnV+WmYe7ipwKz3A+3qjNqUICXPz4fAiXubL6dr8aVg1q3VlXf5W+BAtAgAarrTNNmlr8ivZQKT/J7BCLoI0+w7sJToGnm+4I4Ro8CSG3hZOmYBkq0zJIEQgH0n3lIMi2F8UQ2RbK2u3RCGALon/8JpRaCQ96G9CozQ26zEN+gsoqYksCDOZtWFRnAlvb7IB7dv1aR4pjDMKyTPNPah/LGNrqJ+//gJqZ6uEOYp579dODCT8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zZ1eItpsS2xyc9gqC0IhP4f2MW+FAhdSuboapcw+6lA=;
 b=Y6fuMfScywe0z9m0WrZZJYqdwWB3W2ft0OxOQuq8kWes6WWUYZXOKzpHBGuUwkFgH4RrTN7r3y1EdwmngOeZR1xI6Pyfhoir+EqpdHDqKFP0hBlBGxbV0RNKW+C8s+xnIexfEUi87hdsn04FOKxYGhRhoWPBNym+O5sGjBpgd6HxjpmrNzvkCnGeAP7FLX3Oj7Tw4KMQiaRu60Pfl4NSw+ALh4hjGDaJ46UOipmBGcEHKW/DexXS0++9i8jOKGxqQ7X/edH+Ox+bvYzFBTAxCxYhVPL+H1D6+qFyDEb/fUQZWy9TXae1COuM1YixjcwBLyOU9x7P5AOwjJnrFVqUUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zZ1eItpsS2xyc9gqC0IhP4f2MW+FAhdSuboapcw+6lA=;
 b=3/ogQ0+UKuVn7Q3/lAzITWSk0mjeHDU3fFkdgdN+XOcH9S+NhNyyJtAO/u8j7i+xLE5hJWriVhBa4IVwghWfrcC3q1qsG7BPpIhqNq+JVCD7ahebqoSvwlpcI9KhDaGTExK6IchZirTaMo7NYTFnmXZw6GOXTELhEyzOT3BZhSlFirg2pDpkp1WrO0Q8FNCvhnpYsGnXX0qU/O35P/BjznRAZJyClCOeXIhfJgPD80xm6TPtuC8Ty9uJV8j7c78r3fLHZsbkd4iX+cGwmTI+BeGqz6z3tPbvCmV6F1qflZY2/4GCQHIAHCfzMaIcXUz8OZiMETab6w63iQUVLX2SlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4b96ba28-f2c9-68b5-7c7f-f4ca946022a4@suse.com>
Date: Wed, 18 Oct 2023 16:56:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH v2 2/7] x86: add deviations for variables only used in
 asm code
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1696833629.git.nicola.vetrini@bugseng.com>
 <5131b75996d0b91d4a98466f11dd927be910d7e5.1696833629.git.nicola.vetrini@bugseng.com>
 <afbb7307-50e0-047a-807a-1bcf0139f5d3@suse.com>
 <b652c60c8b5179e31b9032c5e65e9498@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b652c60c8b5179e31b9032c5e65e9498@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0188.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7818:EE_
X-MS-Office365-Filtering-Correlation-Id: 3718a50d-7cfc-483c-86b2-08dbcfea68a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MMDOp/cUKjPDW8VUlPZVz/KnI4elJ/oKkvHQpOLBb7R9eh3q7Fmuzruurimgoan+DRDAiOXr1655qYCFweqOrLbuolRd7P0ZfV88ld6csWMIm0vw2yEfRoWCEm7vCBVte/To9Bvp7Qsgvx74FqvolRIqSbTlm5nx39T4EChbU/FubqT46+cvRa/3tq304ObTDdMjNHdQtv6YbodUHz9fnSRaUybgai502HmOMZyYYBonwHox3RGJth8RpXTCqxx1z+tU6cZPXV9b2MZkby/EWvrFFLxWfDEp2Sr8DZ/0MAzyiGaeqPpudAblGgzympderzLxn1V/dti4IfEnb0RiAihmrzIc/xGSkyIAX3/QpQinx6ZZebmtCJcbrEQ3F+v8BQf0ILNng1hnjbk9EuJv2JqVou2E1ncc3TWmsFcDGOBFGfLM7X6troIxU13HdHDi/Oopr3Q+1oJn/8Sxq3Q+IS+QeBqu8Gr7Rm9GV+E80zmUa4ng4/yOKMtZhEMZIOtjUj8XpmIIB6U1ZY6ckFNaDp4fZQoDqPdAe00MYasytJk2h/mMspZlsF1FTELkYfx4Vm2Kql56DyRDG9teubogPESPQVbhGBQJq0IMU8K+Pkl0lYHhC362NDJshYznnWxXoRXc/vHos++ROnKr6HFdcQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(396003)(346002)(39860400002)(366004)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(7416002)(2906002)(4744005)(31696002)(86362001)(4326008)(8676002)(66556008)(316002)(6916009)(66476007)(8936002)(66946007)(41300700001)(5660300002)(36756003)(2616005)(26005)(6506007)(53546011)(6512007)(38100700002)(6486002)(31686004)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amI0M29OZWlLRmlKUi9BQzQ1QlhqcE1IZWpzYitOd0Z2QXE3UmJSWlBrUGZJ?=
 =?utf-8?B?RlptTE9OQlJaYlpialFjVmVSTG5nZDV2M3Q0bUh4Q3JVemtiNDQ3R2Z2cGRn?=
 =?utf-8?B?dlBBUGVjQ1pzSUZaZ1c0S1FaaEQyRFQzdTJZVGFhdjExR09Ta3A3M05lb25T?=
 =?utf-8?B?M2QzeURUb3ZLRElLRW1LNGJhTExpcFBFWkJLNXpubnVFS2JNMHBRWll2YTA3?=
 =?utf-8?B?UkcwVlZaQnlhOGFCRzJHSVpSVUF5ZnAzMlM4TkRSbHhpQmpCcTlucGJmd2Qz?=
 =?utf-8?B?RHF6VzZuQ0s1R0VPemVPR2hUZU9WL1AzbCsrOFNBWmw3cThuVVBtdnl2T0hp?=
 =?utf-8?B?NVhYTDA4dHBhYTVnZDU3ZUIyanRHZytsc0FBd1JHT3ZJN1RRZUN5QmxUbWtB?=
 =?utf-8?B?cGhpdGdxamQyVlVxeW1ia3ZmY1A5ZXJLM1oxalhnL1FqcFRYemJzZ1ByWmlY?=
 =?utf-8?B?R3cvdUVVNkI4QjNFamptcU9ZM25zNElncGtoY3RCK0xDY3ZYVHJPUDZDckYr?=
 =?utf-8?B?aExBVGJPTHRkZlBHdUpDZ2NRSHlXSkx0VXRldmY0cldVemFlSEhjeUVjdVQ4?=
 =?utf-8?B?T3htS08yb1grL3NMM1d5ZWQvM2hDLzk4QUJGRC85V3VDWkxwUkJOSktCVzd3?=
 =?utf-8?B?UnZBSmJWaEkzYjlTZG1rZ01QSDRvcGx4RmhXUGh1TWFwaVl6V0VreE5mNHlk?=
 =?utf-8?B?N2dwVStuMmNXYXB3Sm1nUDNXN0trYzduYlMxYmR3TjRUbXU1K1Z4c3ZZQ2Jj?=
 =?utf-8?B?UlpyWFM1VFhWMEVYeTM5ZFVuSDVBMS90N1hEbWJsV0pWTnRTT1MxMWJGN3J4?=
 =?utf-8?B?MDBqV3BmMzFHcFlBcjd0UDZPdGw2aW1NUGVKcWZZYlJ3N1R5VitISjVhKzJh?=
 =?utf-8?B?czh2Ni9RZUdHbHE5VzhhWHpHbDFEMTVlZStuNGk5bWRYZEM2SHNycWRqdDB5?=
 =?utf-8?B?U3VGcDZjSnRrV29Qc1VvUjhuT1ozY2RpSk9xZXlubUdaMTVYQjRyWUtsZmZh?=
 =?utf-8?B?aUJpZjRKSGxwN0RrbVYweUhVWEh6Y2M2d0FDbzJMQTJVZU5UYzVoUkJMZzJL?=
 =?utf-8?B?cERvS0k3dnVBVTR1MGtxQzFRMzVYOVNnaFM4Mzhuem4xUEw1eGYrN0ZrdTEr?=
 =?utf-8?B?K3h6cDA1SytzbzZ1V1JJa2R0d0lXSktoaXo1YU4ydCtaQlZPMVVjSGhNcE5O?=
 =?utf-8?B?Vk4weWRjTzhndmo3bWR1emQ2WEtycVpJMk1ZdzRYQ0dKelRqNmJjM1pVUEZl?=
 =?utf-8?B?aG9XeXVUT2JUN2xpUVlSZFZlcm1UcG03TGVEVGZheityM1pZV2kzbmY5V2I1?=
 =?utf-8?B?SHJlOVJ2K2pTQ3J5OTM4dktBQjJlQW9nN1RXbEV5VFh0WjNxckRPcnlqQ1VO?=
 =?utf-8?B?OHpIVm9iWlVnbFMyNlR6dnM2dm5vaWJ6bWJJOGVMOHczdEFpcmRFOUU0dlIw?=
 =?utf-8?B?VDV5MEt5aUova29MVjZoRXBnZE0rYlNlVGpFamtGVmZmM0FQTGFFdklWYmlM?=
 =?utf-8?B?ZlZSNWtTWnpzS1dvcEZLbWVkSkZ3dFRjb3VOMHhxOEtxUkdsM2dqNmhNbEEr?=
 =?utf-8?B?eWU1QjQ0ZWZURlhQNFZVNHlJSmg4N2dyTm9hMGxNSE1ZekhnQ0xEU3hYYVNz?=
 =?utf-8?B?ajRtQUkwMStNWEpveVJlcVQ3WUFRem80UU1JWDNuRHE3SHMxaVg3M2draDF0?=
 =?utf-8?B?N2NwUkExdUpzTzA0MDBCR0Z0a3NJNzkrYUNmSGlwOEJiU3JDSWJIQzJhU3VR?=
 =?utf-8?B?UjlxK2tqcWJ1c0p5Y1lNVFJYMTlHTWs2dTdYSjBLa1lHWGx4WEROZk1nUkxS?=
 =?utf-8?B?L0w5SUNvYU1IbjBoVjhwQ0pKZkx5Q0VISkxrY1hrWXBWNlRpWms4aFJHVzly?=
 =?utf-8?B?a091R2Y4LytrUmFxVWtxVVN1MGJpalZYMk95R0wxamdvdkRRc3YrRTFsTFBs?=
 =?utf-8?B?VWY4bGczS05uYXFjKzFRWGt0Wlp0N0NHQTBqWGhnalRYTGZNUk01dWF3QlJH?=
 =?utf-8?B?LzNKd1V0L1ZRaDdMSkZqMlNGNjMxOUNnSm1qazdLTVhEYThtTkJ1d1g1N0U2?=
 =?utf-8?B?NVhEblF6YThJR0hkdFd1L2ZLcFFNWEpFVEdvVU1US3ZyT1RzRXRreUNZdXVS?=
 =?utf-8?Q?eXXpnMoLibY7tB1KGbJVb/tJ8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3718a50d-7cfc-483c-86b2-08dbcfea68a3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 14:56:28.8988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r3KHwlE3rFKopEV+1czRHkX+2dRf40V5NRSRVuY4/Wip2gPfRGCcbJC7jipDr+dq1NQ5OphHo2dk6RnPMhmWWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7818

On 18.10.2023 16:28, Nicola Vetrini wrote:
> On 16/10/2023 16:58, Jan Beulich wrote:
>> On 09.10.2023 08:54, Nicola Vetrini wrote:
>>> These variables are only used by asm code, and therefore
>>> the lack of a declaration is justified by the corresponding
>>> deviation comment.
>>
>> Hmm, you say "declaration" here, but according to my understanding ...
>>
>>> --- a/xen/arch/x86/include/asm/asm_defns.h
>>> +++ b/xen/arch/x86/include/asm/asm_defns.h
>>> @@ -31,6 +31,7 @@ asm ( "\t.equ CONFIG_INDIRECT_THUNK, "
>>>   * gets set up by the containing function.
>>>   */
>>>  #ifdef CONFIG_FRAME_POINTER
>>> +/* SAF-1-safe */
>>>  register unsigned long current_stack_pointer asm("rsp");
>>
>> ... this is a declaration, not a definition.
>>
> 
> It has automatic storage duration and it's not defined afterwards

Mind me asking what makes you derive "automatic storage duration"?
I also don't see how "not defined afterwards" matters here. This is
a special construct, not covered by the C standard.

Jan

