Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51866792106
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 10:34:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595454.929019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdRVF-00009l-S1; Tue, 05 Sep 2023 08:33:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595454.929019; Tue, 05 Sep 2023 08:33:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdRVF-000085-PB; Tue, 05 Sep 2023 08:33:41 +0000
Received: by outflank-mailman (input) for mailman id 595454;
 Tue, 05 Sep 2023 08:33:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JoEh=EV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qdRVE-00007z-AW
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 08:33:40 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on061e.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8ffd685-4bc6-11ee-8783-cb3800f73035;
 Tue, 05 Sep 2023 10:33:38 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS1PR04MB9559.eurprd04.prod.outlook.com (2603:10a6:20b:483::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Tue, 5 Sep
 2023 08:33:36 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 08:33:36 +0000
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
X-Inumbo-ID: e8ffd685-4bc6-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XDLmTLNqwDJnasTHu3aBkj3XRBXjANmmACmp7HkgEggXxPe8WSHR2hAuzquK4ht++121aW2TqZy65Iz0XjT1Ny+Cgz6g/paIrB6uwq1ScBhb6wl+t/EwS3PjBqP0GO8GvvTPzSCy8N5dW4w9tThfdzO6i5pf5zUYFwsTgklSbuheOHFjJOZRyD14AP6Bzj/zfXlEIHAa5hLDd6z0jdGQ4Yslzcac0BKv6SsBtKJ40RTTLXeti/uVxE7GuVLEiTKYOiSv9+z/W+P87DAGoHXB5gW3eeUMRbGKXOIYqw2chqhmCp2ZiWFcWrEIHTxRIpISTsXbIa9SCJnt+VXCyuRbUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q/HHToEkMe3B2XFg/++0EV4xoD2cdz82tE7Z3UpIYz0=;
 b=Bx99OgosU35OI1m61OzUbSo3+soCa9xvroolo0y6V1BtwawRqQCXvNTUEjMZTuSrrS1J85IY0P7WAA3aFd133SWz+QF/yFjiU2Zr7hnxMAcG5u1qrF0ND3x0w0M/p7LzMW6DLy+Isj9rWVcfzbmEjoIKKh1pgzqDzcp4jmkqJB17RppXvJMJVFcbFh1KHI9XW5yG29nCzkoy1Oy/TAE7I6bjXiNGDYMqCIvfpgJZnegg0LpMEuaOzZVI/ht4iZjLr8+HenPocbtndHuQYYCaFVO9TUu0yehHEbO+T07UTqh7tCqPqtbCoyc/2uIT5mHPeuZCEnXExiPuH+T8pjV9hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q/HHToEkMe3B2XFg/++0EV4xoD2cdz82tE7Z3UpIYz0=;
 b=EgiY3pTBG6XwGpCKKKTI7oOTW04VTQK3FtJ5DU3+H1K0vp5MRwRXVRb8CRzWAutgHCAPUC0nh+bl814b4BNyrUCLWHZ09zt4P0pKyikNi1AODQOYycYBJ3UndbyGI3foiKlhBBHW0QWzCitxaEVE07eFWpnj+4s2YGIYLhaVUyaGwANKUeJRhNCnfbxOdFA3PQsFhTnVOb8FsTDgYVQGvZyV1LYMlWlbZBo1HVVQbmXfwrgOI9Opk5CWs2dCg6VsgH1Zxc3V79Kb9ng8ueLYb9xX/OcipIZG8wp7ZhjtJMQcaOJqPFAQePgn6On3OJlZ20VObg/7l+xaby6PSliIxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9b673dec-f391-9948-3ce9-25ddff8c9d7b@suse.com>
Date: Tue, 5 Sep 2023 10:33:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH] xen/types: address Rule 10.1 for macro BITS_TO_LONGS
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <b3aaaf5265c7e7ce6228ba2146f57aaae09f55e6.1693899008.git.nicola.vetrini@bugseng.com>
 <540ae128-a934-8c4c-6fec-e475dd072c3e@suse.com>
 <aa2084eb925ade9caa4e1dfbfb425537@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <aa2084eb925ade9caa4e1dfbfb425537@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS1PR04MB9559:EE_
X-MS-Office365-Filtering-Correlation-Id: 74735f8f-dad6-46c0-c43e-08dbadeacbed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c8G29NReXPz4FppqPj2dOWV7AbhwSAStqZlO8/2CviP2qJXpB1gkcay39vgwLbdMEYbvB38H2l3PrYJAvq5qkUFTuH1/xnIXBsjHX3/Qz3pRdz1KXnRU2cuwN+8T/dkEob6MSozydrfAt7Z0hIefUG6rArqJwVnQ1S7oJ9NcbdfrxffpZ4xdd/Fgs96BbIPFfS6gDaFBpVqvkeCWjTfIX/wgnRjyvpQyg4UMZuUjN99N94NhaxjS7SlLkiGH1oiUmM2m8cdILjWHzMA0c2FNoqbhsteGTKSu5qvSd1SiU82btzCr226YkyB27z9s9Kccvd7BHEiUyiaeSJqvzLBFxAtLgpMmbLCB3JWrF6A88poAVOt6B0JCcnsib/9rxPAhXzJZAW3hULckA751rLRGnxZqHe0cNLnJH/2HnLCl9m3OQt4LNzkGy4bNbOhTWV5W+bdSWAQ4EQP3sxNgUgKuHnVmfoKiW3rD9Rn15qFXEzCwy5BAk+sRxFrmezQ4XYWBAlOnsdtICLXwwR7AQTPA9YiIg7nS4OFo1dKL43j8tRz/goxmNga2r8oDyH/0/BZoaHZTZhwgYe5QpoIQgXENQBWw/SdW5W9C2b+e03h4/cBovlAMeo4s4Hgf+EQF8TWLn533a3w4JViF0jBRin0yuw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(136003)(39860400002)(396003)(1800799009)(451199024)(186009)(8936002)(31686004)(5660300002)(2906002)(6916009)(36756003)(316002)(54906003)(66946007)(66556008)(66476007)(8676002)(4326008)(7416002)(41300700001)(6506007)(53546011)(6486002)(6512007)(26005)(478600001)(6666004)(38100700002)(2616005)(83380400001)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1IxTGgvQmdlTjdoRzRTdWFwS0l1WDg1bEEweXNiS3FEM0tpeFJpOE5XeTly?=
 =?utf-8?B?RHo2MjltN2xmQUw3cTJPVUprUjZUWG9uZnAxZ2pNUCs4UjRaYkJmWEFFNVhz?=
 =?utf-8?B?VHZmVVZtc3A1eUQ4S3M5SmVVcjhpaEdkRTBWNFJFbVR4OGJDQkYzZUU1SDRF?=
 =?utf-8?B?TmxvM0tyNFlHbksycjdocndEZU5xZnpNdzVKdW5ad0pNUm9ZMU5wK0F0SWl5?=
 =?utf-8?B?bW4xbTJOVmFlSEtWT1Y0dVMyMjl3WUo4Rm8wWjBuZnZlZlIwWUFjeFErbFdv?=
 =?utf-8?B?MTNaVWNCTDVrY3ExMzBHZHlGeUh2QmJlU3BuZ2YrQnlmcWMrVnZTcE9XdXNN?=
 =?utf-8?B?eTF4RGpXNEtMZEQ3ZnBncnNKUjIycnNsMncreHpSeXlEY2hDVHg2SnIwSGE4?=
 =?utf-8?B?eEVEMmRVMXpaZnZZeXNvcW8rR2FIOCtDem0wQWRvSzNUeVhaV04rLy9HYVBG?=
 =?utf-8?B?akxlek9STnlwaUJkellPT0t2bEI1S0txSDZONVlITkFJNHROd3YzaWJZOTd2?=
 =?utf-8?B?RWZHRFFNQWNTUXlEeXlWRXo0bkRXVm9Vd3ZXSmMxbWtNS01IaCtJR1hta1Jl?=
 =?utf-8?B?dUtyenliOTNqR1plSUpMdnA3ejUyK1JGdDhhMVppL01kQ2lvYzl1V0xpK0ZK?=
 =?utf-8?B?UG05WW9GNkhtbHF2TUpjM2pzZkxlM0ZURGIva1pKNWtQYmpPT1lvRTA2OWlS?=
 =?utf-8?B?aTFoMHdOMGRwbWRyQStIYUJla2xwTEl6Mmo5YnBpSHBRM2QzN1NIeVY0bkFP?=
 =?utf-8?B?Mm4yRzRyQnF2QmZNUDd1dmZLYkR1cmFVVlozYXZVM2puMXU2UStCaWxYbWpZ?=
 =?utf-8?B?TDJTQ2p0UGdHc21VdnZoYUxZd2pidE9kcm5CWTdBZ3RYWTg4ZG0wTGdRNm1j?=
 =?utf-8?B?dXo2b1l0dWJackJlcUtwVm5pTFE3a0pvQXZBcmY1ZXJzenpLNlVDb3p6bnd1?=
 =?utf-8?B?dzVZM2cwZXcyUWxlcmNXWHB3amJTb0pXU1dqTnY1d1YrWG9yQ1VLQVdJVUo0?=
 =?utf-8?B?dmJhZTlJRm1pZEo1QnVYOTloQ1FIaFRQT0cyM1lsaEFLZlpHQ0NLb1poRzVs?=
 =?utf-8?B?T3UwYm9jSThLS083cFBpRVk1ODNGbWpyQklhK1EzWUdRMkUvVjhxQUlGT3NB?=
 =?utf-8?B?T0JoSmxCcGJ2YTVIN1o1Um91bHdSWlN5K2duRGpDNFgxV1N3MzZNM3NLSUY1?=
 =?utf-8?B?cGFQSzdlWmdBVnNJc3lpMjZHdlFRL2J1SzJmVk9VaXJSS25hZHlGdEtobmRz?=
 =?utf-8?B?NSswV1dNbG5WZjNGWVRsT2YvRklOTU1Vcm4yZld6Z2I3K0p5eHJHRzc5L2Iw?=
 =?utf-8?B?NnJaaVdyakppZW56TDZkVERBYlphWW1QUUhieHAxS3dCWnZpQnRNZnZnMDFE?=
 =?utf-8?B?VUIxR1prMFFLWk5UVlVHRW9NQnBZVzBDbVF2MERIdWI5V1puN3BGLzFFRWN1?=
 =?utf-8?B?c0c3M3BTZ3FHeC9TQkdURXBOd2U2NnFFeFNmYjVULzJCWENyQzlhTFpocFVM?=
 =?utf-8?B?UGMyVDZmV2ZMZWdBOGVwY01DcEIydGtCVStkblFMZHdlSXIyR3Z1dmQ5YndQ?=
 =?utf-8?B?WXlUYUJQNktJeWJxSTYzc2ZhVjRnM1RLNUtDSGhEMDZKTXI0VG9uRHpjV296?=
 =?utf-8?B?WTFwQUM5SVZaZjd0L25ZbjZrTmpPTWtGamd4VU5waWIwL1piTk1kWVZwU082?=
 =?utf-8?B?NGJvYjNCaHZMRGpBQlU1NTBzZ2JCS25VK3QyOW5VdjlCYnJ6Qi90VEYzYkVD?=
 =?utf-8?B?R3FGV0N1d1hhL0E2SzFEZEVTeW5Cd0o1akpVbVc2R1RnNGNrd09IcFRTMGx6?=
 =?utf-8?B?TU4vdnlZOVM2R1ZmM3I2UE1Vamw0RXNLM2JYdHZ3c3dzaEJrYnFEYTlISFU3?=
 =?utf-8?B?bWM3bytYd1hEVDVMT2FmOStRcVJCTmxzZVRFdU5hYXZCS3FHYkFObEVwN1Fx?=
 =?utf-8?B?LzhoZHZBSWhKWUNNWkYzNDNjSHNVOWsvSHkrN2Qrd3lOR1lHZ3V3QjFaVzhB?=
 =?utf-8?B?cE1uZEs3REJRVFZSWkRadS8xRDBKT2JmbFRwd1FweHZldmZBa1c3c0JWQ1kr?=
 =?utf-8?B?Tnc3Skk4RmlJY1dnT2ZxMGEyOUFBSjBCV2YvWm5uZUFwZ0t3ZE9MQ3NCa1RW?=
 =?utf-8?Q?kuEYI9fVdAycNETjZOqUEhNnF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74735f8f-dad6-46c0-c43e-08dbadeacbed
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 08:33:35.9716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nDD3zysotLcY5aekVtXrZIW7R6WsVDve/XqIAuPaKoMjfsBNUCJ/6xO52JvIhuSWDai9uj8CkRpFtplkSA7IRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9559

On 05.09.2023 10:20, Nicola Vetrini wrote:
> On 05/09/2023 09:46, Jan Beulich wrote:
>> On 05.09.2023 09:31, Nicola Vetrini wrote:
>>> Given its use in the declaration
>>> 'DECLARE_BITMAP(features, IOMMU_FEAT_count)' the argument
>>> 'bits' has essential type 'enum iommu_feature', which is not
>>> allowed by the Rule as an operand to the addition operator.
>>> Given that its value can be represented by a signed integer,
>>> the explicit cast resolves the violation.
>>
>> Wait - why would this lead to a change to BITS_TO_LONGS()? And if that
>> was to be changed, why plain int? I don't think negative input makes
>> sense there, and in principle I'd expect values beyond 4 billion to
>> also be permissible (even if likely no such use will ever appear in a
>> DECLARE_BITMAP(), but elsewhere it may make sense). Even going to
>> "unsigned long" may be too limiting ...
>>
> 
> You have a point. I can think of doing it like this:
> DECLARE_BITMAP(features, (int)IOMMU_FEAT_count)
> on the grounds that the enum constant is representable in an int, and it 
> does not seem likely
> to get much bigger.
> Having an unsigned cast requires making the whole expression
> essentially unsigned, otherwise Rule 10.4 is violated because 
> BITS_PER_LONG is
> essentially signed. This can be done, but it depends on how 
> BITS_TO_LONGS will be/is used.

It'll need looking closely, yes, but I expect that actually wants to be an
unsigned constant. I wouldn't be surprised if some use of DECLARE_BITMAP()
appeared (or already existed) where the 2nd argument involves sizeof() in
some way.

>>> --- a/xen/include/xen/types.h
>>> +++ b/xen/include/xen/types.h
>>> @@ -23,7 +23,7 @@ typedef signed long ssize_t;
>>>  typedef __PTRDIFF_TYPE__ ptrdiff_t;
>>>
>>>  #define BITS_TO_LONGS(bits) \
>>> -    (((bits)+BITS_PER_LONG-1)/BITS_PER_LONG)
>>> +    (((int)(bits)+BITS_PER_LONG-1)/BITS_PER_LONG)
>>>  #define DECLARE_BITMAP(name,bits) \
>>>      unsigned long name[BITS_TO_LONGS(bits)]
>>>
>>
>> Furthermore, as always - if this was to be touched, please take care
>> of style violations (numerous missing blanks) at this occasion.
> 
> Then the whole file needs a cleanup.

Perhaps, but going as we touch things is generally deemed better than doing
a single cleanup-only patch. First and foremost to not unduly affect the
usefulness of "git blame" and alike.

Jan

