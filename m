Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5AC67D204
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 17:45:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485136.752135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL5Mb-0001W1-7H; Thu, 26 Jan 2023 16:44:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485136.752135; Thu, 26 Jan 2023 16:44:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL5Mb-0001Ti-3C; Thu, 26 Jan 2023 16:44:37 +0000
Received: by outflank-mailman (input) for mailman id 485136;
 Thu, 26 Jan 2023 16:44:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=71dA=5X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pL5Ma-0001TM-4e
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 16:44:36 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2043.outbound.protection.outlook.com [40.107.6.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b689a550-9d98-11ed-a5d9-ddcf98b90cbd;
 Thu, 26 Jan 2023 17:44:34 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9075.eurprd04.prod.outlook.com (2603:10a6:102:229::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Thu, 26 Jan
 2023 16:44:32 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 16:44:32 +0000
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
X-Inumbo-ID: b689a550-9d98-11ed-a5d9-ddcf98b90cbd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ojmv1VtyFUFgcDx2SEtOnLgMu/igI+C5JlLBttAPqmJKAx+SkhbS1JgL16P+r7iI3/4i1pvheghcIwFWEFWIMfB2VP6DafAdz7lbs742r/PycqmRwJs/iLNIifsM/SvDmcNVRIt2PHA5gMFZIeND9wu8a2nIPW5TMs3bu3Gtxbr+JZzgjllNZhh0Rc8A19KcLftyH0/EJxtghWrbAdDLW+ObMmVyJ6r3rBofatG//a4wt45lQkquo5evn0ZYGQLR90rJpRs0HuT9uRDoyr7OVOBMhc2GJwuGl6O7+l2wW7s9oUs/WCsE3F+Yb/uy8DD0loZz/AggKD2S/zUXYnmkzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oemARvIFtOwswuNzV3njIwrpUKIuh/DvcovG4shLT0U=;
 b=X0i1Q+9N1clSLPg5SQ/sYeNrUn1z3+HBraOvE+U/tazc/9heJp+0Vw/nxGJLXDfIIcFBAI/YXILxFBfn3KrtFJKnumsFH+8HvvbJ8SLq77OSjrTP9b3E3hiH4UfGKsezGYzQZYtkFToH5eutQTij83buzhaSr/qcW150Newrv40NrQLQYIMz91UA+3Ku9fbGAH1FGCQRuz6//AOHU8UrZ2orE6sk8Co3yhe8aIXag+ovjc9Bc/6ZnOgcn9h/gq6wjO039dk26NfylDj8RWmwDbtbdLWhpJZ++Eu5gT9nwiIBSpa2vYicEb/iPSHR4gVjt8AUvK+YPiuHn/B43aROSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oemARvIFtOwswuNzV3njIwrpUKIuh/DvcovG4shLT0U=;
 b=3x+o0haWNB/ZZ7Z94ubaoFSKpK6XmusWcoObXDlma5ZXH5wgK5KkLURH1xlDmlJLXCY+Y1uqB5X9QWXLTvuEn27LcwqZOLWKEq1H2urC7dauHKKoYPk0GHoWgV3youWlEFpJwft+W+xV3MGJAANjK065GuHgtaf0nLkxoxuIwsyri9YFj/dYvVV/gZhhmweSXLP00P3luUPm+iDfjz0pTRRk+Vo+YcbBIVOxS/piUy6rSApl9rb/dGm2rGOrjDtbUAmkMn9NF3krqUZzXFLmkLo1FeWRuTF/Su0ieoqGn3oOW8qJ1kpWek0xSi8JJuAfW8vS5IvAGnmcqrwGIEIu/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5a3ef92e-281f-e337-1a3e-aa4c6825d964@suse.com>
Date: Thu, 26 Jan 2023 17:44:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] Add more rules to docs/misra/rules.rst
Content-Language: en-US
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, george.dunlap@citrix.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Bertrand.Marquis@arm.com,
 julien@xen.org, xen-devel@lists.xenproject.org
References: <20230125205735.2662514-1-sstabellini@kernel.org>
 <9d536cec-726d-4a39-da36-ecc19d35d420@suse.com>
 <alpine.DEB.2.22.394.2301260749150.1978264@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2301260749150.1978264@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9075:EE_
X-MS-Office365-Filtering-Correlation-Id: d7ec4fc6-b245-46e0-ab55-08daffbc9980
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ScWyUv9k/KrqIlapT0rT7P87HG90vu/KdMdy7FeXMXRAuYXdNFPmQ+cRK9qfOXVImbpS34fPKGjAYGGiBR21/EZN9UNwichtu1cREMVHugIZNM3uqWXlYV580L/ATGvbk9LvdJbELvIDd/Fw1Ps4tTSeDIZYqIs3BG5KPIBWGciCVIWTIRI7yDGzamDNtfv9+dO2f5WZ/DgSgNnA5PXARoGP//nXS42AF2DlnoYCm921GuHt/arfW3t9AVFKzjyiEzpCx0sJoVrPEcfCso7tClZBI94AI1wAl5J5kIvhAxyHzcI75KhU+IsGZsUgArJCKevbTLq7ppZW70WuXBxq3mubrSxTOEb4+weXZv+01nEL/m5vB0Il3dYKsqD8/83ecrB2j46ONMX4zmhzlpkdxmMcpAELcWZOYCMP/wmV6gJwLpqqS99YBAVsNbFYjyIXEVrsSWm4DYsMidsOb1pZGfHa5pZbGVIlAFCLdrQf1Rhftgg3uqd1DeOsI658NWh8n41VYbmyqYsigtSg4tiJbaSDSsxHEuX0KTX+cxjJfArNY0M+l50t+gDVtrfdylL1nBxAIw9vVPT1ulCYBM7ydVGn7pM4QfCSp8yt2x0/+OVc4yQ0EJI5SCc7rOjz3GfkVi3rGEyFIRFhGrBQvzNckM1YHulyKBmUNHdkhBc44/PEOVkHUgPgeeImfmg+H69FgtkXaA5G0IGejSsfzXSk+oZ7ZAIHlQEbhyQ/82Bc9xc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(396003)(136003)(39860400002)(366004)(376002)(451199018)(8676002)(31696002)(31686004)(316002)(6512007)(41300700001)(4326008)(86362001)(6916009)(66476007)(2906002)(66946007)(66556008)(6666004)(478600001)(6506007)(6486002)(8936002)(83380400001)(2616005)(36756003)(38100700002)(5660300002)(26005)(186003)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGM5ZFF0enZzR3dWSlZYcVBPZlFQU1R4NWM1NXpwc3FWYzdLQXJ6aldUdUhY?=
 =?utf-8?B?MXZkR3RNbERZaVQvZ1prR1NnWmZQeTRWWmNRUk5rNGlaLzZjN1dXOWFIK2Np?=
 =?utf-8?B?MGpFekc0ZTFHaVp1MEl3dm9jR3U5eVY4eWRnSzRnc2ZCdlhNbmlYdjhnazBa?=
 =?utf-8?B?WU9ZZDBKbDZrbkFhaDdPM0xvcEhZSFpvbGlXMTFTQXhqRWp0TDdJQitHbjg5?=
 =?utf-8?B?aStzUnBkbXg1b3N2di9TU08xL1Yxakd0bUJUcWtmaGVHUThhNnd3cDA5RUZO?=
 =?utf-8?B?MHhaZVFPa3c4dklaUnFFMlJabzRRN1c3VkVHc3RHTTg2WXpXRXFrRzhrZjZp?=
 =?utf-8?B?amFaTlpKQ01mdTdlVDZZQjdiclErTGFQNkUyNkkrUmJrekpRR284VHZaVlhp?=
 =?utf-8?B?K1VqQ3FkR21iYms5eTJJbENWeEdHRGFpM29rNHJHTTB4VFJiUk9tdkxwYnpX?=
 =?utf-8?B?dFU3cnNabUlUTWhCNUUwRWpLSDlXZWZGb0pMbnlqQlhXMlhzdUZQK01tTWpR?=
 =?utf-8?B?K2tZVnpTOEZiNXh0OUYxaWFzbkF1U2NHdGhJQmZGSTQra1F2a0ZHR1Y1YU5v?=
 =?utf-8?B?ZlpyOU9jZzdBOERzT25kM0crakxSV3FCN0FRRkRRWHZQQ0FHUm9RY2FRRFpC?=
 =?utf-8?B?TTlmUm0vVWxEckh4K2FTZ2d6WTl6Tno2cG9wNFZqT1dIQkk2cUNVWVpkNGV5?=
 =?utf-8?B?cHRSOUM0QklaRnkxa2lUM3dOSGtTVERET25TNVJkdmRDSU0xK3JNVFNGSTM3?=
 =?utf-8?B?U0dvOHJKVFg0cXlGNVZ3cUkwdnFqTWc3b1YwNHJmMFBwRFBKV1IxY3ZLMnVL?=
 =?utf-8?B?WTB3azg4aUgzOTVWQU1sSDJ3MHhyaFd5a2hreW1WbGFGWm9CWG92TUZzWndL?=
 =?utf-8?B?V3V5M2hZdFdmNElZTDBNNGVoSUNVVnQ4NzVIQzRuc0NuQ3Q4dklzM0VKODN5?=
 =?utf-8?B?bW1aeDcxckJjYjVJM3c1YnRsWUp2TmIyWVdlUVFvVUJwdEhralRDY0cwQUNS?=
 =?utf-8?B?OFd5WUlISW10N3VOTVJnVEtqL2RFL0tNZ0l5a2tmaVFWazdIa1hNTUZQc01w?=
 =?utf-8?B?cWR4akJoQTY5Yjc0SGQ3UiszMm1RRlMzd1N4Z3FoOWMzclZHWVM2Q0s3L2d5?=
 =?utf-8?B?ajBwdVF2U0RqeStib09OUWJzYjl3V2lBb1ZtNzkwVVh4RnB0dDU0NUtHa0pT?=
 =?utf-8?B?b1luSlFvMVJKSXRPYTBXOFZXMGc5cFk1MTNzZEhoYVZaZ2hJSXhzcUlVUVZZ?=
 =?utf-8?B?OC9IMFF1MDNGcmFkUVRKN05JV1dSbFN2LzJtRzVhd1Z5RE42QUZXTEUwQ1Nk?=
 =?utf-8?B?T2s3M0xpbHlRSG5FNERjYTZQbXp0a0hZN1hBY0lLbXp4aEN0OVVPODZFK2hr?=
 =?utf-8?B?T3hoaGkyYkR6djhMOWtoejdjZmlHNXZOTnNOM3VMZVFOeDJ2Q01EUkxsenN6?=
 =?utf-8?B?V3lWeXFJdGcxaEJZdFV5SVBNTnFsUStYMmFPNmhWaFYrUFRXaGxVa1RjRm9j?=
 =?utf-8?B?dkFOTkV4UHJJWW1DTXgxckh6U3pucmloRm00OTE2WXdBVjNZcFBQUVRwaTRK?=
 =?utf-8?B?KzBwS1k2dlNkcHdCZ1RmUUVFTWt1bTk0WktpL1J6VnZ0SUM4eG5WR1RzRGNL?=
 =?utf-8?B?bVhPYlVNdzA4dUloUWFYUzkzbkozTW0wN05NdXAwOWdMdm9TcUt3b0RQN0E0?=
 =?utf-8?B?bE1RZnBTNUVrazdBOTF3VFBXUEVYRVRmM1Y0ZUVZMk45VStkU0pVQlFJQ21a?=
 =?utf-8?B?MDgrMG44UFJhbC96TFBOVzZCZTdpK1loY05FTTFncThlWjdYdVMrUGRTZVRy?=
 =?utf-8?B?dFFOUHdhRUJwbGZJUTNCNlFUWHByVEhnQzhjWWF2Uk1STHdtOUdTMkkwSnUv?=
 =?utf-8?B?dndPM3BZUjhuWW5RRGsyYUt3RUxKYjVwMWsvdkc5YWRxWk90TFlEdWsxMXJG?=
 =?utf-8?B?ajFwb01HL3FVQjZ6S05yUDhSSGdEZ3lhNXdHRDhOZjNQcXl6NmNLd082ZFRS?=
 =?utf-8?B?bkxRUzF1Q2RYZUpRZGxnUjBUNUkxTGtCYUREaTkvb1pvQmg5c2huSWFmeFg1?=
 =?utf-8?B?blE3enhkVS8zWDJ5bzZCdElWajlSZGYrSHFxRkI1aWlQOEdXeDNaZWxlZWhh?=
 =?utf-8?Q?h3WhMhAdIu8uqUW0+4ZbTVHBH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7ec4fc6-b245-46e0-ab55-08daffbc9980
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 16:44:32.3127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: boO8fsNwJbpfzWjUWscDfyI5gg0VpSmYKiSg2dbM4nF0OvM6oUEjraH0aXsN0vng1iGhosstxiuT098GDYF6HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9075

On 26.01.2023 16:59, Stefano Stabellini wrote:
> On Thu, 26 Jan 2023, Jan Beulich wrote:
>> On 25.01.2023 21:57, Stefano Stabellini wrote:
>>> From: Stefano Stabellini <stefano.stabellini@amd.com>
>>>
>>> As agreed during the last MISRA C discussion, I am adding the following
>>> MISRA C rules: 7.1, 7.3, 18.3.
>>>
>>> I am also adding 13.1 and 18.2 that were "agreed pending an analysis on
>>> the amount of violations".
>>>
>>> In the case of 13.1 there are zero violations reported by cppcheck.
>>>
>>> In the case of 18.2, there are zero violations reported by cppcheck
>>> after deviating the linker symbols, as discussed.
>>
>> I find this suspicious.
> 
> Hi Jan, you are right to be suspicious about 18.2 :-)  cppcheck is
> clearly not doing a great job at finding violations. Here is the full
> picture:
> 
> - cppcheck finds 3 violations, obviously related to linker symbols
> specifically common/version.c:xen_build_init and
> xen/lib/ctors.c:init_constructors
> 
> - Coverity finds 9 violations, not sure which ones
> 
> - Eclair finds 56 total on x86. Eclair is always the strictest of the
>   three tools and is flagging:
>   - the usage of the guest_mode macro in x86/traps.c and other places
>   - the usage of the NEED_OP/NEED_IP macros in common/lzo.c
>   the remaining violations should be less than 10
> 
> 
>> See e.g. ((pg) - frame_table) expressions both Arm
>> and x86 have. frame_table is neither a linker generated symbol, nor does
>> it represent something that the compiler (or static analysis tools) would
>> recognized as an "object". Still, the entire frame table of course
>> effectively is an object (array), yet there's no way for any tool to
>> actually recognize the array dimension.
> 
> I used cppcheck in my original email because it is the only tool today
> where I can add a deviation as an in-code comment, re-run the scan,
> and what happens (see the number of violations go down.)
> 
> However also considering that Coverity reports less than 10, and Eclair
> reports more but due to only 2-3 macros, I think 18.2 should be
> manageable.

That's not the conclusion I would draw. If none of the three finds what
ought to be found, I'm not convinced this can be considered "manageable".
Subsequent tool improvements may change the picture quite unexpectedly.

Jan

