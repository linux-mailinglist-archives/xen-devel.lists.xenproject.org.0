Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DA65E9CA0
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 10:56:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411527.654475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocjug-0001Xh-05; Mon, 26 Sep 2022 08:56:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411527.654475; Mon, 26 Sep 2022 08:56:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocjuf-0001UB-Rr; Mon, 26 Sep 2022 08:56:29 +0000
Received: by outflank-mailman (input) for mailman id 411527;
 Mon, 26 Sep 2022 08:56:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ocjue-0001U5-7z
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 08:56:28 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2054.outbound.protection.outlook.com [40.107.21.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13fff8bd-3d79-11ed-9374-c1cf23e5d27e;
 Mon, 26 Sep 2022 10:56:15 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8743.eurprd04.prod.outlook.com (2603:10a6:10:2e1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 08:56:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5654.016; Mon, 26 Sep 2022
 08:56:25 +0000
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
X-Inumbo-ID: 13fff8bd-3d79-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJR+h0m2hD8k4KAElssSa6hVBiiOQIwpt4LBUpmSOmsW4LRab16WM9lHfmpz+mGl97bzBRIgKD0NOvqs1sDloX0I8slRSPRtu+8xIjjZusV63RpskI/+O40r6reBNsDmvzU/2LTfQjO6Z+kb8SMKgPdo6FT/6b7rRYy8PhMaxXlvPaTFTrx/vq0IV50+lJFKy9UYbUMWQi+5mpelD9LpFcEWWJsG1eDDLDVzEP4uYg4eBoE/My7H/zn2kfPOmFOUJWiyxOPdd62f0vvtMSmgOPiaJ+isDA2gmbRY8bGQdjx8BjATuO77dsKloiTnhXOtn3bBbANfA7f1RDmuW2c3Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mAlKn9fcp3xl0kb4wQpOlyezl8sjILZZ7pZ0Ptr6wzM=;
 b=M+e0yRg19cPKsYNNJ5rl1KPxHr219P0VoHmKEwmPx9SH4znUFqDtr8tHeiIlmnaLsHwVH32Ej5fhWDAly6+rz6zq+anzC53XkaWOznM3vZlvUjjY29hM5kVbQvJW9i2+u3k+q2GfqArSX3jWwWjfKJo88Wcfizqj1wD5FfxZO0o/r4rimZw4DMbOPGdcQ+OONe4POn12hT27+lW3yrbJsst+cRtkyUuYXE7HvYhC+8kOnPkDABPLIjWrNUIwfJ+QtSFaU2JDoJL7r0okRuXg8TAc+2WMqfnzKlGczJqKSIGI9ceydxfL2UuFHmkndL93ZpqaMf4TBeM8imbOSnIsHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mAlKn9fcp3xl0kb4wQpOlyezl8sjILZZ7pZ0Ptr6wzM=;
 b=JsIyhKEaAK/RJnO6B5hCJN6RAMNSoTF/qwTocZeppSdF8FWxE+QBhGkPw3EREKftZFkpZZ/H0qxutUMHcvuBueDpflzXyyEmrO89fqOGQWaQi0HDseOmjcSbqPvtkR6oE7Zl4CIYzm+gzxTf4U+Rs68sipJo9bAOFQxqsup7Qs44du9U1PJ8CfC9fVYMimsfF5VK1QZkGTprWNWaivIn3fa71rdKWsOZDMB0VsvZV6ZCLY50xYS6Fy+zDzElUaH0k7jAf6XZ7qD5QbJpHmM6V25E/3JqboB/R9VbjsTt20MabQfTSuxTTFv49aVUU2lGhRmMqXCped3R87rOLEazJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <021abdc2-2bd6-6220-1202-12fffe090a77@suse.com>
Date: Mon, 26 Sep 2022 10:56:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2] MAINTAINERS: ARINC 653 scheduler maintainer updates
Content-Language: en-US
To: Nathan Studer <nathan.studer@dornerworks.com>
Cc: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Jeff Kubascik <jeff.kubascik@dornerworks.com>,
 Robbie VanVossen <robert.vanvossen@dornerworks.com>,
 xen-devel@dornerworks.com, Stewart Hildebrand <stewart@stew.dk>,
 xen-devel@lists.xenproject.org
References: <20220915193027.3166-1-stewart.hildebrand@dornerworks.com>
 <20220919021002.2193665-1-stewart@stew.dk>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220919021002.2193665-1-stewart@stew.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8743:EE_
X-MS-Office365-Filtering-Correlation-Id: aa7bebb1-45d8-46a0-9953-08da9f9cfdc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AQMaUkG7gRY9uC+gASDW8rWIcga9i8MU3F+Vkr5IO5PSq8SJBcoyI7e6VXGeWk3hAIvWOU4MoQYg8N9V+C+nULl8j5ZxNp15VVdXV9YaA+W4ET0rBAC+UTiMD/bBA9fq2qUNvSKGuNMGq/7hUvGeDupEHiIVCMKdPy9VjQCv5VU8ZjY+ubPag9iLtGnHDwtBj4FuCijTAibNq4F+40xbzHc98J5qKsTKvwtozRbBYFHH+Avkjogc1Z3WF+53xrJbMgb4YbxkFDT97W1ZJ5frbF7K5F21xtElmGIqlYKVHzu5oAfsURqW1Y9sgEwVPbzBnD+fy15FSdVgQByk0EU9eQhbLfFfFYYL0dHpGZgXNRNDqaK41hKN70o3G1owkhwoa8nxu0sodaGmM2+K5yuIrKel9rTfLbCrImEY0gzE7kvds+Mv7MW8xuPzRyLCfVy8KKy7MrCiZNs3ir6DIa7Zv9xPMkmpMPw8YlPOb2vr4qKHlhX9WRWFbLGN1g7wHzVVGD1xhDEMObOKc4zb9y7V1Lsy2bEiuofX9O8dyLEeP4h2wl/IGRGILkjZKXFg1CfsOJ9hYT9xgJzbes4iQFmtMt587ioM3aIKVeS5cW98hvJHJ7kFalk9uCA/gKMj5FLNA8fOziRAO6itlJiDsqsrQCY4JE1Z9xqnHiQCwTzfamtVaBlGcIGEycxta6gFqCeE4PmVpj5ygiVUeUe9/8i7lpiO8GmBQvL6M5LPasmN1eVVyYYrul5w67rhZvHJpRQ+dwF3U1C+Fo0pA0CaOkZXblLH5MBZElAV16lLhzoqNP4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(346002)(396003)(39860400002)(366004)(451199015)(2906002)(186003)(83380400001)(2616005)(38100700002)(86362001)(36756003)(31696002)(66556008)(66476007)(66946007)(8676002)(316002)(478600001)(54906003)(6916009)(6486002)(4326008)(53546011)(8936002)(6506007)(26005)(6512007)(5660300002)(7416002)(41300700001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjJyRWtENW9sc1dZUXFjOEhlUDlYTGFidXQxczl6MnVVQ3VSWGl5dEsrZnRB?=
 =?utf-8?B?bks2WFdUQVlSRVBrcUpYLzNPbGdZTGRvUkd2SkNiMSs4Q0ZvWDJ2OHdCdkha?=
 =?utf-8?B?ODg4S1hYQm5ZZmhoM0dNWUt0VHFLdmhzMjJFSGRtNnNYM2ExT2liYjZkT3hI?=
 =?utf-8?B?NVVBeHE5bjdQZjkzbC8xUUZqM1NhdG5ub25nWUJzMGpMSzY1cTNpWGNkejlN?=
 =?utf-8?B?ZnA3QnFPdFRDeFd1L3dUWVZWdGZNQTZlZVpuSXVhVUl5TGM5MTBXbTd1Ynhq?=
 =?utf-8?B?bUU2VEJ6akJSYzFlRG94T2dPK3lkd3NwTHR1ejNrTVlOK0Q4QXdWaTMrYmpP?=
 =?utf-8?B?Tm1xdVJtSFVjanVseW50VnRXYTBaQm11K1p3S0ZEaHBxV3dKOC9MaVZOUTE5?=
 =?utf-8?B?eXg3cnVPZ0R0d1B6dFlvTFErUnVvTWVrd2dFUjlnWUZhQjFRTWI3YXJURWtz?=
 =?utf-8?B?RGcvWFBZT3o0OFdlUHFmaERoVSt0REJidDFYNnk5YjNiR0p3aVExMWJIdHlj?=
 =?utf-8?B?NkhjalovcjVhRDJxajEyL0Y5Uk1wek9yT0V6cDVEKzFWTitQYVg0czN0bHNn?=
 =?utf-8?B?TmJUaEhtaklqSjg3STJMdVdLdEtTTkU0VWhJSzRGZi95RHRNUEpWNEtTMS9k?=
 =?utf-8?B?R1dDK3Q2ZU1reDNZSkpKYngvZFVaWnFxekFLVmdxRnN3aGxJdzcwV0F4WUlC?=
 =?utf-8?B?MnZLUm1aOUZKWWVkWWY4NGt5Y0pGS1NEMDFPcnhVTHkvL3lWTGpMdUd6Y0ht?=
 =?utf-8?B?S3N5Z1JuRDlUQjZ4UTk1YnZaTjBuZm12a1M4NlZUNW5yVjNmbmhMTDdBVUtK?=
 =?utf-8?B?YXFueDZISGNMdEkwaEFUVlB3Vk9kWCtObndzWWlTN3c3WHdWWU9DeVUyVmRR?=
 =?utf-8?B?RHlkaStwb3NpOGpIeDFtZyt4UkF0V1RVdkpGa1g4RktxZUNDMzI3K1FFYXVq?=
 =?utf-8?B?T1VHaVFBd0lMUy9BYVVoMExkUVB1NC81amZXUWRTM2JLT3R1aW0vdWFrSDhY?=
 =?utf-8?B?NGlKbUN4NTdmOXBBTWxxTGE5YkNMZ2JsYTNzVSszWTFKVVVBS2xaUkU0L1VH?=
 =?utf-8?B?Q20rZ3JVbzFqc3JnNW1ueXBSVFB1OUNGcEtpdmZuRmJUZEpBTXpLZFhlVHpC?=
 =?utf-8?B?ampUaUt5eFl1WjBwamw2bkpGNDl3WWNEUE9rTmpmY0YzeHNEYzRmbzczeGlO?=
 =?utf-8?B?cldPRjBDUllnRGwzSW02aFErSEpnT0t5WGU0djgvd1FBWkMwZFV0MUZZL2hB?=
 =?utf-8?B?WDl6QmpYd0dQUFZ0c2FiY3JFQys4WW1hT3JPQ1dUODNtY3QzWnhkTFRjbysy?=
 =?utf-8?B?RzhYZWpHNTZud0JydkxUaUhsQysvRjJmWlhxQmpKdnBPa0VYOXNBR3lkdncr?=
 =?utf-8?B?TEdHVEw2Q3d4emFFRkZobldmQmQzb2EyV0YzTzdpZG5iZkhWQW5mWWhIdUxF?=
 =?utf-8?B?clZMRUtxOExlR2Y5dHdzMXRqTEFRaXF0alNlTkxlWnhTcHhISkxoWDNwTHNI?=
 =?utf-8?B?MHRiVFBPY05KMjlOM01LTXFveEw0VEJsdjdMN3FEMEpoUUtncmNka25obEY0?=
 =?utf-8?B?NVRYK2RFZ0hDUlZLdG9Kdm0yMDNxcDhMY2t3ajlPSlhsVWRBQzJTbHhEVE9k?=
 =?utf-8?B?dnBJV0F6M3R2R25OelovM2llRTZ0Z1pnZ2QvcW1HMml3TG5jRmYwVnJRaFZR?=
 =?utf-8?B?SWVkdmRaQWJuZkJ4OU9aSERvZ3pHb09GVGxCVjFDcTNvY3IvN1VIQlJKSFlv?=
 =?utf-8?B?UmZyODduVDloclRvVjAwcTgyRUxYTmN6dEZrWE90elBZaGNOcTF1cDFBL1Bl?=
 =?utf-8?B?OWIxdzErNzROc2YzdENnWDRLT2dsRjFGQlgxV01nazRPRGZxRTJNenlEMndo?=
 =?utf-8?B?aE40cGhScEY5WHBNOTZSY1QvcXAvQ3NLU2JWQXIvUjFNY1dGdU9XczV4MlZN?=
 =?utf-8?B?Nkg5N01lWklvQkRQV3g2bHpLa3RiY1VzRFQ4enJYMlVCVmhMKzNUU2xpaGVw?=
 =?utf-8?B?TU12S0pGZmxEMjdacHBUbFV5VjVKcFdITVQzVWZVMHJIL0IyTWdHYVRhQnR3?=
 =?utf-8?B?RkJEa3J3RVI4aGVhZTRJZ2VXRTdNSkZzY0YvdmN4VjhKMmJhWEFDOThSdHU2?=
 =?utf-8?Q?yBgcN7WFcE2oFpGW3nMaEbX8i?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa7bebb1-45d8-46a0-9953-08da9f9cfdc7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 08:56:24.9652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Phm6pvZOVM2tuBKj77sEHcxHqWKeRrb+Iai7YWR7atgO8FzMbK/KVj810RjI6wE9VAEG063kZUM8eqqsgYDCMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8743

On 19.09.2022 04:10, Stewart Hildebrand wrote:
> From: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
> 
> Add Nathan Studer as co-maintainer.
> 
> I am departing DornerWorks. I will still be working with Xen in my next
> role, and I still have an interest in co-maintaining the ARINC 653
> scheduler, so change to my personal email address.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
> ---
>  MAINTAINERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e12c499a28..816656950a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -221,7 +221,8 @@ F:	xen/include/xen/argo.h
>  F:	xen/common/argo.c
>  
>  ARINC653 SCHEDULER
> -M:	Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
> +M:	Nathan Studer <nathan.studer@dornerworks.com>
> +M:	Stewart Hildebrand <stewart@stew.dk>
>  S:	Supported
>  L:	xen-devel@dornerworks.com
>  F:	xen/common/sched/arinc653.c

Nathan,

may I please ask that you supply an ack here, indicating your acceptance
of this role (or otherwise reply to state the contrary)?

Thanks, Jan

