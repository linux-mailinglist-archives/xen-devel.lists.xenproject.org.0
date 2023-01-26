Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8596367C4DF
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 08:26:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484789.751591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKwdX-0002ET-Gm; Thu, 26 Jan 2023 07:25:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484789.751591; Thu, 26 Jan 2023 07:25:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKwdX-0002BL-Dx; Thu, 26 Jan 2023 07:25:31 +0000
Received: by outflank-mailman (input) for mailman id 484789;
 Thu, 26 Jan 2023 07:25:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=71dA=5X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pKwdV-0002Aw-10
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 07:25:29 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2086.outbound.protection.outlook.com [40.107.6.86])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9abe75e1-9d4a-11ed-91b6-6bf2151ebd3b;
 Thu, 26 Jan 2023 08:25:27 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7733.eurprd04.prod.outlook.com (2603:10a6:20b:288::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Thu, 26 Jan
 2023 07:25:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 07:25:24 +0000
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
X-Inumbo-ID: 9abe75e1-9d4a-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cTipI0aJrfne+AgNwoQWsi0QbbBGD1Ehwevpi0hk6vWNkK6BVfsgXZ8zvEbXz+CqEquaM64k6n0Ar43nL3u33/eaRoRPi5UspTE7xnbHOiGHgPSTDEq4B2SRfxGbmKQvn6uIAw9TaoOIFXiYAKcxPc/Z1K4SqzS1D8lV2HLPySH+j6TVpkwfrCVloUR99EpMma3zR4V7gMAuikioqJZQfx18DUK3tM5Wonh5hOddW4xSPHUQGVOBZhHwPVEAgdJTpQoHkdo3Dj9bFIGQ+N1d0WTnN6D+ud/ZH+Lp9SSGA4mRlPaO9KdsRewuR3woWgdLIO2NJPCpymMaFwlKiTHT6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=maygO8TCv17GMyYbpi2QfNkyPw39ruWhUXIBMdNPS8w=;
 b=lrewr8mNaelIeyQl1P2HN++6phG5MfHWKVJnr8MCe3CgiZPnrBIfMUMK89chDQ9JMNAYM/lFCOULWf2ZBckaBWzJcMhsNaB9DUQKbSTbM15ChlEJmaEOVX1tIvexm0Sd0tvieI3Y3oCXpUmqIYNHGe0HLdKBA4js57IqA+UB1BP5lhfkJICr3Y+NI0OYH0DyWNFHFfEKrKzRu6iNNklAS8TKZteewcF2deD8pHdNWkrJgQB2ljbTQeRt8856EuWe12NHRTau76OWltRaAMLruScNrZGopfephd1rMTozhuHnCsfqXp/4bexDeUuJ0JXsN0xI4cvkidgM3HxdO2Pb1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=maygO8TCv17GMyYbpi2QfNkyPw39ruWhUXIBMdNPS8w=;
 b=x5Bs17O7Gny8YC1f3IHdmlVOMMQdb748kMnSpXjbOamOcwyAg3b4ra+JqRgLa7BFZbLLF/f7vVtpew+h6ftk+7WFHOvHNp14js2cPPsRnCnupkPBVkGPqgthAEuZegXwu1vfn28TUZCd6VJ3jXm/tKvMNZ69AJAwQkOBXL7fzCpFjG/MmaH0v712GfoqBpVIf/jIbwGWmlqgajRoNrh3XL5yiqxmENcA9hWWzGNb5wqTyr6jLKhLAUPsCLGNzWEjTF5OH7N4HH8PtD37AudfQu81D4TR0G5Mi5v49tRkhcTc8ClOnqfu2vMFodhaYmz41jNOIuVtQomiSizEWMRWIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4e723846-09c1-32c8-94ba-3755e6af0529@suse.com>
Date: Thu, 26 Jan 2023 08:25:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 04/11] xen: extend domctl interface for cache coloring
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
 <20230123154735.74832-5-carlo.nonato@minervasys.tech>
 <9bfee6d9-9cb2-262e-5a46-91b0bf35d60b@suse.com>
In-Reply-To: <9bfee6d9-9cb2-262e-5a46-91b0bf35d60b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7733:EE_
X-MS-Office365-Filtering-Correlation-Id: 54978596-43d1-4853-00c8-08daff6e7d6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RJv+qOBHDdc/aOJDtWT/SmGzuY/L9BhinVRZKg2qUUHIauAj4vIgMqnUmpuFiuOVVBEhCERsfMB2CEKczyUcsZ9CpEIV92JyMkK0Gg1oXQoPw18rymIW/vs5wbr6vl/UgS0OYs81l8m0fMnhEualIeTQANmX34O3IVw1LETNusk6XH6dOhXcALTp3eKmLI5LjAARuo1KHgv7+oGwmZDTj3NHHuzUxJSKw9DztuLX1ZSgbA7J19rAP5HQIHt87haDhOmFG76qDB/kHrD94CM3llzpFv92nYZgEceB1O/ZkF1zLsHEomtKHU4TCurmGiYYYq7/ZFTEDKxhXNJ3HJX5pVHO6YZ/2E3ByXaAlTbU6/QChOGnNuNZysEbUd+mxp7h4JRG4ZWWNhCpWGyw/2dNIS8fnG+x6ob1Vlw6IZBWFW6OMNsCsoArk4fOTbyJoWhfAaF7WTeX642Ie2ZQ0S84bbS6VpHfZxU2hCr0zbRnUSqf1EB2YSza8b5OJIaOa+4IjOiHBGLZzKpdzjrRBhQ9xKjlwhaABiDCTL3OmZ75mgXStgJyCiUHm0YH9i8PLPhT6YTJFjVwZ/EzLkOR2RkYNqL20MUnqAwIAoOAkA9Sra+QmdVNW37buSwsj8ql+3FGRdJ902K2emaTx7JguWdE2RjYOYBRx3O0MT+Jb1WBXQgdAJKkuXcVyzX7/1TakQuLU8CmiPm5pauvlNdpupFgjUPaxPh5BoWo76zMONEAwhs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(366004)(396003)(346002)(376002)(136003)(451199018)(31696002)(86362001)(38100700002)(36756003)(66476007)(5660300002)(6916009)(8676002)(41300700001)(4326008)(316002)(8936002)(54906003)(66946007)(66556008)(7416002)(2616005)(6486002)(478600001)(2906002)(53546011)(26005)(186003)(6512007)(6506007)(6666004)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2lJaHRpMXZxczZ5ZkZxckg1WnNUKzVqdTZjYUxVL2VaZlBCNzVReDAzaXZl?=
 =?utf-8?B?ZDk0WmdjdkkwV3R3eTRFdExzdUJTZ1RvMWhuUUhYYk1pRmJVbnNPb0hsblN4?=
 =?utf-8?B?MHZ3VGZFT1htSkU3RjhjTXVVUWdiaTRhZDM0K05lUUMrTVdQM0NNQ1g5K3pT?=
 =?utf-8?B?ZDJndllJcUNIYVFhZ1J6clJMVTNPTW5vOEhrWG5PU0MzSmNQVVJEbCs5bXc1?=
 =?utf-8?B?R2hqbXRsL0xWWStiaEJJbGtmdkFOSkxScGpPTHFwUXQxR1pLVmNVblh2aFB2?=
 =?utf-8?B?RFUxZW45WXBibExnUVNkbkNHaWFFK0hib0ZSUUN5Z0dnTytvRVBUc3l5TnF3?=
 =?utf-8?B?NDFLYlVtNkRUOFZzTjE5UWlic29TTHYzL3hsb1A1ejRNSUFuaFJ3RHNTV3l4?=
 =?utf-8?B?dm9zOFJhZWp0d3ZJdG1QQjU2Z3pvdHpMOC9kRUFoRWtxYWJDa09lcE5salc3?=
 =?utf-8?B?L01jV2VDSFJkMXd3YUhhVEhOWFZIU2FYeTcra21BOENSNkI5NWFUU0VRTWVL?=
 =?utf-8?B?cVlaQjdjaURvRGxPeE9aTXMwTjdabkIrV0ZWZHZzVkpRZS9xKzd2SCs4YW9r?=
 =?utf-8?B?M2dhc0NXQUtEd0t4MWRiQjZYLys1ZGhFZy9XQ0l2K1hpeUlsc1VDVkhSZko1?=
 =?utf-8?B?U1ZFL09HVy9xQjlQbXdnL2dacE5OSWdNTmY5Q05lajFYMUkzUWlwLytrYlhD?=
 =?utf-8?B?MWZkSExDNHcweE5QeGRnV0F5VEFNbVo2S3c1cFFBQ1BGZVRPeFhNL2ExT1Bv?=
 =?utf-8?B?S29WL1NJZTJaNDhOUk8rU055Zlhtczl5dS9YNFliL0pmeEdkcDgybDJoS0ZQ?=
 =?utf-8?B?VEhRWnhoOHcyQ0NLaXFNUnY1NVJxN1l1NWgyS1MxUk02L1RlRGtxSWFGdGRD?=
 =?utf-8?B?YWlaOHBpNW5HN0pZcTMyeTJCRWNtNTZ6L0NUN0MxNGhqTHFmUkVtdUFMemwz?=
 =?utf-8?B?OG5CYWhoSjdrclYybVh5VjZ2UDVBSVpVc1ZyaW5PRDFWNm5BMmI2QlduVUI0?=
 =?utf-8?B?TzJTT1pybGdpZVROK0JyR0pOSkI3SGx1SzQvU3dSTVg5cjdDd214OGVINHRw?=
 =?utf-8?B?ZllGbCtJVGdKSTQ0WlMza0wyQUR0bW1NMjJrU1JSMjdBVjVsMzRTdW1xL0ph?=
 =?utf-8?B?SDgxN0JMZG00a0xQRlNxOXo1YnJtSWJqS09UNkVRU3VjUWx6dDNVRkxON1Iy?=
 =?utf-8?B?OWYwT3JvMzFlMUl4QjhmR043UWs5T3ZVSzNwQmVJMUFsVTFoQUlRRWZEYkdp?=
 =?utf-8?B?WnJUV1BLdlZWUjhMZHRWempOU3VZaTl5WGRhNVJQa0hOc0NTVkpQbTNoSFZz?=
 =?utf-8?B?aHFoVWplTzBwQmxFaWtYMGNVWkp4ZHBaZ24rSlJuRGQ2dWRZaVJNZDZjZ2tP?=
 =?utf-8?B?cHgyRklQQ1hyK2EvckNobkMva1ZUaEF1b2pvMEhjQkczQjBvMVk5YjZDL3Jl?=
 =?utf-8?B?T0lGZGRNcXVhZkhFUXJ2YVBLSFRmNU8vVGp1a1Bpdkt0aTdiWFJOQ0o3Y1o5?=
 =?utf-8?B?YjBmWnE1emF0bWFKWVdqWEN2V2JXVUd0T2xPb3d3U3ZUbWRQYklFZkZVanlN?=
 =?utf-8?B?NEN1R1NNNUFhOTdYUkVBSDJYVG4reXR1MUYyTzBUdlhCa3JPaHQ0Ulkzb21B?=
 =?utf-8?B?TEV4Sy9wdWZBZko4T0lwSmJoNkRsS1M0Y3llSVU3eUlsczRzS1JZalc1Z3BE?=
 =?utf-8?B?UjJPeEQ5Q2JaNHp0Y0d6Nm9mUmh6U3EyM2c0ek9weFh1cWNML2pFMVp2QklJ?=
 =?utf-8?B?dUJSOG9hMEMrUjZ4eHp0d09lQlJWYmptdEprK1JVZm4wc3FOdnYwT1JmZGtp?=
 =?utf-8?B?ZlhSVldnQXRKSzcrSWdPZGo1QXpsRnh5dlArWU9COHMrR1lWdk1wKzhQMEZO?=
 =?utf-8?B?Y2pZczA0L0RJR1dYdytNK2JuRVV1TVR4UUZIVE5VQkxGb3V1VGZ5RDdJeW1L?=
 =?utf-8?B?VExLQ3U2T1d3WVpWY0swaHEyUytEYzI4aFk5eGkrSmczUXYrWjdFaTNQNFBD?=
 =?utf-8?B?REJGV1J4WWJ5NVZLdmZRVWVhOE1sNlZPZTZDcEJhTEhQcGc0R2dOU2hkaFRQ?=
 =?utf-8?B?V3FoVjNudzMrMTVaY0VTek9tU0d4OUdCeU1mOEwzQnpwTkdsMGF6Ly9JVmFm?=
 =?utf-8?Q?h0vs2BjOXpII3aecDOQshZASJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54978596-43d1-4853-00c8-08daff6e7d6b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 07:25:24.5902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5VRIq8ddhBCOUB2lFY5UG7ZuxDk66dM0sv3sH5sYnOBxCReZ2ZJpDHfymJeVaHXln8Y/MlxsQU+E6UK/P4Yo5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7733

On 24.01.2023 17:29, Jan Beulich wrote:
> On 23.01.2023 16:47, Carlo Nonato wrote:
>> @@ -92,6 +92,10 @@ struct xen_domctl_createdomain {
>>      /* CPU pool to use; specify 0 or a specific existing pool */
>>      uint32_t cpupool_id;
>>  
>> +    /* IN LLC coloring parameters */
>> +    uint32_t num_llc_colors;
>> +    XEN_GUEST_HANDLE(uint32) llc_colors;
> 
> Despite your earlier replies I continue to be unconvinced that this
> is information which needs to be available right at domain_create.
> Without that you'd also get away without the sufficiently odd
> domain_create_llc_colored(). (Odd because: Think of two or three
> more extended features appearing, all of which want a special cased
> domain_create().)

And perhaps the real question is: Why do the two items need passing
to a special variant of domain_create() in the first place? The
necessary information already is passed to the normal function via
struct xen_domctl_createdomain. All it would take is to read the
array from guest space later, when struct domain was already
allocated and is hence available for storing the pointer. (Passing
the count separately is redundant in any event.)

Jan


