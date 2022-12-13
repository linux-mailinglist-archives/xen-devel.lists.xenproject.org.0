Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4977B64B41E
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 12:25:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460524.718447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p53Oo-0008Pi-N6; Tue, 13 Dec 2022 11:24:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460524.718447; Tue, 13 Dec 2022 11:24:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p53Oo-0008NE-It; Tue, 13 Dec 2022 11:24:38 +0000
Received: by outflank-mailman (input) for mailman id 460524;
 Tue, 13 Dec 2022 11:24:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F6Pn=4L=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p53Om-0008N8-SO
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 11:24:36 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2045.outbound.protection.outlook.com [40.107.8.45])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10d21fb4-7ad8-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 12:19:53 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8381.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Tue, 13 Dec
 2022 11:24:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 11:24:33 +0000
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
X-Inumbo-ID: 10d21fb4-7ad8-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=afUxU+Za2NXX6tjgSnljSxhr3zm38InO44sh9Y4X7hUX6pXomJLRcWrSv4LT1UuyjOkVyrG+nJHRH3Z08Kivu+W1UvUCOmVx9v0fKK74VFuDvpZdcMzXbgVSMHFF6oUS+/MuY2htUt+woLuXoMwJ1dUR+1PsXYmYe0z+GqqeR/i1+lnf1jAiw2Sc5xf/umruxvzFLnhiBKp6/mhrRlVdwVzU9dt+QS+SSYzTWMD15w7eNf5uriXkst7TFpzHMLN3VRt09tSJLDUP+ZARBVlK4f3qoqtrJqcKg4KciGVnYZAG2o5ZfwtSNbZinWgmPlEWJk8pTI6rfGg5ldEo12dFMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l386G49r1IlBCqfuP/pobRRCl5ZQMkNUQKj+vlaBwAU=;
 b=EVyZtow/FLfsupxjo7viKbZY2b2luhhmPRJDyWWXkiOF3yjZzTJRUDwsNydUSDW7ROeL7HaNVHNlflBE+o/mbPq/Tagwqoj5gfZMgCw9zLk9FmT6lk0dAjJ2YFyDPOKCawn4WxlrwbL6SELlI9LZK44DDNCvbRRIYiSJ+uBCqs12yZCbe4PzJTH1WAkoPIIZyatXbjkrI9WEj5bJ/OZK/Wz8U+TZmk38LzNNpqsryfo7wXQsf7C7skonxAi90Zo4rmUp5bUBx5+JoeWw943y82D2kPP8M/B8xR1tvFcHsY6i/1+FMnNff+HPPRasVW9/8CjbVD7aBqBv66vPPgK/bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l386G49r1IlBCqfuP/pobRRCl5ZQMkNUQKj+vlaBwAU=;
 b=Cw65NpIRySuwcFeLydG3933HDORbWNZRQX8iS1dlq90cb8bVtyG4utm/rdPvzbm+wKP85hWkQCWAzo9K3PkeQkvldDtlYEzrl+dwzF9nRWmkAnu5iPSzAXesYD8f3pEbkM6drOHLH+aakXIeE9vF2cyrYKKpkZrZU41JsOO6xBqly0G7WKH7tmXcEgD6X6Lu6i0wVtf3UEslopIFOVW8KZu6lZ/pF5R1f96qVHFuLSzzPsS/J5XQ355HQksxqJU1JHlUha9zpHkcuNvCsIOO24bdNNSsyHTmnwrqQFLbioqpZYZU8sFv9/dhTcYbRMiAdr348Qya31qdXyRU9vla2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2df82668-2d41-6b19-1a78-91ecb60ce187@suse.com>
Date: Tue, 13 Dec 2022 12:24:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v9 3/6] xen/x86: Use ASSERT instead of VIRTUAL_BUG_ON for
 phys_to_nid
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
Cc: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Jiamei Xie <Jiamei.Xie@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20221118104508.768274-1-wei.chen@arm.com>
 <20221118104508.768274-4-wei.chen@arm.com>
 <6f04f1e7-4fd9-8ab5-0ea0-b6cf5925ca29@suse.com>
 <PAXPR08MB7420A426B6159B3669AC32A29EE39@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB7420A426B6159B3669AC32A29EE39@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0199.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8381:EE_
X-MS-Office365-Filtering-Correlation-Id: bb3f2315-5ae1-4647-197d-08dadcfc9bf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RYCtlPaITE4jJSA1qaG7pDTrXG5uvdA14MMQ2eo9rFX5skf2DvWAXcBXzFh/rF1z8xAsybXzH/sljex/cOwhopAUTeH4n9KrQPDfHpmbtwOmbXH5gywlgf4fFz5MmHPcYKcoXR5M7uF4dSrYQaUNIi7qbvEExKn/9AabVTO/fLms6aNY7D2U5PiqnrXTKN9LWlX32G34A8L2b4i+wiovews4L/ZTdj2scs5XsO5+m9tvGpkRndYFdPqyFzvHWuG7iULriqD4Gfg6ucbMiOAGroUJPYQVpooSF/if3v2KDXEmqe+T7p9S3bVZ6ENLpmEFA1EUcVuuRcDZjlkr9RhQD3nqhScZr+bbiHurDn7sBn895+RhxgYRkutELa5q9EntuPv7D5moL611V4rr188VxlLOrXRxBrkviVuKQlBRYJDdN9qGtdb8VPj93J4BJvB1s+TfJlbTcbGwSeQCt68QWNAyFBfblbihbaF2BGYzJIYbv5OgmoY/fwfi7CScXHLheFuiEUjBERm3nA+liGrhiLQzh/XvIrvwo5otaaAS/gq/cgOfO+ncxgVbHrLEZYR72njOF1Q8L6Z4gIuPg48p6hUKkGt2n2nGZC9ni4e39mcFJ8gutrmqeUdWx6wHRh79wyCPHcXuVG8nmGmlgXIKlK4zFT/2SYOMyj/XKyQ6H0tUS+Ik/p7xKfQpyv37Tkd1Ku69KxY3P2LDtIG/X65uzW2jWo5k9cz0LjBu6qbaYCs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(39860400002)(136003)(366004)(396003)(346002)(451199015)(6506007)(53546011)(54906003)(7416002)(316002)(6916009)(6512007)(6486002)(31686004)(478600001)(2906002)(41300700001)(8676002)(2616005)(66946007)(66556008)(66476007)(4326008)(5660300002)(83380400001)(8936002)(31696002)(26005)(186003)(36756003)(86362001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmFpRzY0OStrRzNwOFhWYW1laFJVdnhSdzhIbHZ2VkZvY0pyWnE5ZWJDMGIy?=
 =?utf-8?B?RWpRblVCZ3pocGhVSTNBUFFuTGd6OHo5d2FxWU1WQW5LRkNiTmE0REtsbG9m?=
 =?utf-8?B?eURmeEJMK1J4eWhkV1JEN3VuQ0RIaDhmWk1SNjJFZTVVR0czMzZlZ3FDcXA5?=
 =?utf-8?B?dkVRYXFMTVFLOWptMTNqQjh4L2MycmtoTUZxbDFRYnliWVZuT1pQanFRalBD?=
 =?utf-8?B?R3pCY3R0ZWNmanJ6S2tRM0I1czkvWC9XcndCOENrS2FLWHp4dkFlOGptN1dQ?=
 =?utf-8?B?OGFQNTJzb0JOOURNNEs1eHJkbmIyNm13L21rYitPR2tlQTNpRmpFWEJoV09j?=
 =?utf-8?B?K2Fkb3R6WFNBeUQwM29BeUlsS1kzREZnckJmeUp4Y2NPcExrSnBxOUU5Qy9t?=
 =?utf-8?B?L0NLV1lnZEMxQnRuYXk0ZjBic09GbnZnUmh1cDBWSmptQzFhWVcyY0J6NUdM?=
 =?utf-8?B?S1ZLZnY4RGUxR3RvazV4OVRVTWc3QlEyODRlMWJIMkhxN3E1SFlmb24xWmth?=
 =?utf-8?B?UVJRWThEVnJxRFh1eHJkT3Q2Z09wUEtVRFkzT29NZjFkTXR4cHBqMDNwOTB1?=
 =?utf-8?B?enBlcXE3eGtDT3pYL2R4cDZWb3gzU2hpMlhBT0Q5YVloK3VTbkM1dWxVVXlI?=
 =?utf-8?B?M0JnWGh6SXF2WXFXeEdDNFpPOGdhWjlTZkI0bENPZ1ZZem1HcmR1WjAwS0NW?=
 =?utf-8?B?SFlMdWJKQXNuQ1ZGVmExNmJYM0J5RUZTak4xQVpDb3ppdkJKeXQ4T09qcjdJ?=
 =?utf-8?B?c0pwMEtaVFF5RFIrNjNXV2QyclNLdDdUN0E4QjB3ZitPcDJlK1NlaWYzRGxB?=
 =?utf-8?B?R2pGL2JYV1Y2SkRGQSszQ0k4aHN4bHlxQjVMa3BBQzF1K1Rxdy9qbmcwTHVv?=
 =?utf-8?B?aXl3RjZ6c29KMVpiRDZnMW91Smlrc2xsWWtGQlJibStzWDNkOTJwOVdGYzU2?=
 =?utf-8?B?bFRmc3M2ajRFUkxKQlpDd0NNZC9qUDQ2OEZFaXM3R0FCaTR6dGU1UUVvZ2da?=
 =?utf-8?B?TUtBOWFkMUdsK2VsZW9Ec1QzN0V6RHlqUktxQWZrbm1aY0xXeUZXWG1pS09Y?=
 =?utf-8?B?bmFmRlNPd2lrbVh5TkxvVEtUYXRCTVJWczdWZUc3WmNrdlg0MWZQWXMycnA0?=
 =?utf-8?B?Sk5qNnMvTXo4Zjd3VWxUU2dWNklMMWMvRVI0QlZQeFkwcU9QUlJ2aW5qd3V2?=
 =?utf-8?B?bzhZbmFnZkZFM3JtYnpGQjdkc1IyTVJCR0F0d1laZzdGclFuTjZ6ZlA5MlJh?=
 =?utf-8?B?VG1WS0JUVXA5ejQxMld2cjRXU08vcnVCeHpCM0NjMFlJTmo5THJYRGcwYWo4?=
 =?utf-8?B?c2o3UENEcnV2aUd5OGNwMjFxaWdrZVl4UXFMT0ovTnhRbWZHSk1uRGhQbWFK?=
 =?utf-8?B?YzRNbHZNUmFnNEtFNFBBZjdjZ0VwbG1Dd3QwclFDcTl0eUZrdElrUEVxWFNn?=
 =?utf-8?B?QlFyN3BvM0d2Ump6T0JZaW5FdktTQ254VFpJOTFFT3NRQTdSTWdkelJqMFJn?=
 =?utf-8?B?aVpNZFcvclBrZDhvWVB0djVkZ0pwM1kxZTRMK1RLdDVPa1ByV3YxZW91N3R3?=
 =?utf-8?B?WkdSZTdWWGdndzliZWYvekRyN2prbEgxcTdkZUdjR1pIOUZuWm1Qa1dwV1Rh?=
 =?utf-8?B?cit0SkhMUC8ycHpjMHp5bS9KbHNITTZ0U28ybGRvaDJxdW9FUUhmZVRaWldX?=
 =?utf-8?B?R0hrQU84NnJjTUcyVnN2OGxZSU45ckNRL1R2RU1sVzhvekZYSm9tQk9PVHB1?=
 =?utf-8?B?K2g5TUFTOUVJaUNBZ05QZWRTT0xDcytIZlJTYlhCOG54bjNrNW1NUDlOeWtN?=
 =?utf-8?B?endITmZaNVl4OW84dmVKM0Vzc2hzcVB0NmlLck9ST29JV1dVT3UvUExKb1pw?=
 =?utf-8?B?eVZpSWhJbHY5WER0bG1DVXNOMTdJQ0JlcGhiUXh1NHlEZE9NQXR0VzJDV01B?=
 =?utf-8?B?N3hGOCtnbklFODZ2VE0vOWdJdytWc1RWWVdxN3BObWx6ZzRTdlloSk9nYXp6?=
 =?utf-8?B?T3ZaaFRpSnhzZ1N5Y3lqM1BldnIwLzJkQjI2REQzRWdsOUVvYWQxUmhUQzM2?=
 =?utf-8?B?cnh3N0Vsb2k2YVZIU3JyNUlEbG50RldvclllYWhDQWtZREFkdmNzaTE1UERR?=
 =?utf-8?Q?SATX/dzHGGmqej4D1wMuJvjJm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb3f2315-5ae1-4647-197d-08dadcfc9bf3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 11:24:33.4178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6uvSoTbTxFkTj7xYBD62TMbVqQE+xPPytG3H1SdWcgeEzOTnWuXvOt8L3mR2HuH7xB8MXHeol9bnAco2iz5b8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8381

On 13.12.2022 11:40, Wei Chen wrote:
> Hi Jan,
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2022年12月13日 17:47
>> To: Wei Chen <Wei.Chen@arm.com>
>> Cc: nd <nd@arm.com>; Andrew Cooper <andrew.cooper3@citrix.com>; George
>> Dunlap <george.dunlap@citrix.com>; Julien Grall <julien@xen.org>; Stefano
>> Stabellini <sstabellini@kernel.org>; Wei Liu <wl@xen.org>; Jiamei Xie
>> <Jiamei.Xie@arm.com>; xen-devel@lists.xenproject.org; Roger Pau Monné
>> <roger.pau@citrix.com>
>> Subject: Re: [PATCH v9 3/6] xen/x86: Use ASSERT instead of VIRTUAL_BUG_ON
>> for phys_to_nid
>>
>> On 18.11.2022 11:45, Wei Chen wrote:
>>> VIRTUAL_BUG_ON is an empty macro used in phys_to_nid. This
>>> results in two lines of error-checking code in phys_to_nid
>>> that is not actually working and causing two compilation
>>> errors:
>>> 1. error: "MAX_NUMNODES" undeclared (first use in this function).
>>>    This is because in the common header file, "MAX_NUMNODES" is
>>>    defined after the common header file includes the ARCH header
>>>    file, where phys_to_nid has attempted to use "MAX_NUMNODES".
>>>    This error was resolved after we moved the phys_to_nid from
>>>    x86 ARCH header file to common header file.
>>> 2. error: wrong type argument to unary exclamation mark.
>>>    This is because, the error-checking code contains !node_data[nid].
>>>    But node_data is a data structure variable, it's not a pointer.
>>>
>>> So, in this patch, we use ASSERT instead of VIRTUAL_BUG_ON to
>>> enable the two lines of error-checking code. And fix the left
>>> compilation errors by replacing !node_data[nid] to
>>> !node_data[nid].node_spanned_pages. Although NUMA allows one node
>>> can only have CPUs but without any memory. And node with 0 bytes
>>> of memory might have an entry in memnodemap[] theoretically. But
>>> that doesn't mean phys_to_nid can find any valid address from a
>>> node with 0 bytes memory.
>>>
>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>> Tested-by: Jiamei Xie <jiamei.xie@arm.com>
>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>
>> This patch is what is causing the regression found by osstest. The
>> previously silent (dead) checks no trigger when paging_init()
>> encounters a hole in SRAT-described space, as is the case e.g. on
>> the himrods:
>>
>> (XEN) NUMA: Node 0 PXM 0 [0000000000000000, 000000007fffffff]
>> (XEN) NUMA: Node 0 PXM 0 [0000000100000000, 000000087fffffff]
>> (XEN) NUMA: Node 1 PXM 1 [0000000880000000, 000000107fffffff]
>> (XEN) NUMA: Using 19 for the hash shift
>>
>> The node ID for 0x80000000 (slot 1 of memnodemap[]) is NUMA_NO_NODE,
>> which of course fails the left side of ...
>>
> 
> I am sorry, I had not triggered this in my testing machine. I'm a bit
> curious, on NUMA platforms will there be memory that doesn't belong to
> any node? If not, why the space of 0x80000000 will be used in paging_init?

The space isn't used (see the full memory map in the log collected by
osstest), but the function is called early to calculate memflags (which
then isn't used in that particular loop iteration).

Jan

