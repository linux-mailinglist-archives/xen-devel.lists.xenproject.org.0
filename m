Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D32761F233
	for <lists+xen-devel@lfdr.de>; Mon,  7 Nov 2022 12:50:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439338.693388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1os0dG-0004Qe-5M; Mon, 07 Nov 2022 11:49:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439338.693388; Mon, 07 Nov 2022 11:49:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1os0dG-0004Os-28; Mon, 07 Nov 2022 11:49:38 +0000
Received: by outflank-mailman (input) for mailman id 439338;
 Mon, 07 Nov 2022 11:49:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gy2E=3H=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1os0dE-0004Om-O2
 for xen-devel@lists.xenproject.org; Mon, 07 Nov 2022 11:49:36 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060.outbound.protection.outlook.com [40.107.105.60])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ff272f3-5e92-11ed-91b5-6bf2151ebd3b;
 Mon, 07 Nov 2022 12:49:35 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7536.eurprd04.prod.outlook.com (2603:10a6:102:e1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Mon, 7 Nov
 2022 11:49:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 11:49:33 +0000
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
X-Inumbo-ID: 3ff272f3-5e92-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mTVDozjndCSY5vvdKAUNpKA0t1PtobWFV/D8ZHLroxtuFx+G9t39ywUWZT/mLgg7TXhqsRLAAc31uYaEpszmQdFq0WyihKrGqDUVhK3JRWVAh8ZPEEZZsd7/d7o9fx1qM1hY62LT/+6czQPDu+bc/06//yFToyNR+kGbDWD0o97ilbK1OXUMXyq7jGCGMFrtLdnfUurxwerxo9jE0ZaWDOk52W7KvSEg0QRR/6rvMKPKcDq3LE0UOEa5gXlPgs/pq52qAKIcvifFL5JUj97QNobAyoA8MYUPb8BoAOhvvizkk36owisfZgxXTT1UnpsMM2iQbF/viPMzHvjd6rLTEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ef+jwvv2IpWFakg4Eh2FruhFQzZc2SqsHX4LLpA2As=;
 b=kCjj1zkCkyMJ2Jzw+4UBwmRD3vVVei16XEZVJcVxc7jD5NMMEw8T/h83c8Dm1e1tWCOqMGAahchbUhEbCwV4H7aER2aChSL9+HWyUny9jP7eSgMqjMqqKqSHcTvBwPWTnyyzrxEo5/URxQ3Sk1CPUYz+rCrWpkyTXAOkgmdyMMvxlSDBygzlaPeB7WgnQsZmJ5laGZOy1MqHWjCfrZusui1KSAaU8FPxi0/8Nj/wacemqCTxJSioP2p/P5XyDljJJY2CvLVodKjMgLCcqxJQsEle4hLjyRNRBos3ArNMXamVdoL1sgpNTGK1PI7Gct7wYhM7UaYrN7UcRmKh75U2OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ef+jwvv2IpWFakg4Eh2FruhFQzZc2SqsHX4LLpA2As=;
 b=BEMGN9EhEV4tZ+09Wgzc41PpVh1Eb9sADfNr13gYTcxO/bgoDQSylmmG5kpTrcm+FSd9LyZ3ULFLO7PzCm8uQJEK9XLV3R+TthGvbhSZ7OEJd9v4Z3Cg5fkddqB+nYD/4+HV1Pck0ozpY/CdJKyAiyMjnM0YLMTVkJSwPRhN+K6FtDvKjwem09dm/uUUQM+caujLhisOD3yVyAvjoQ3qllgkp2N/c0rw6mp8Ymw0DiZxBrrXzlzwxflhCpCziv/DlSpVeXePVJ46S1POX852iiJ12Pfv64OGutuYtBnGnfHTHlACgNuOTGQnsghtewaew4nQOIkk60oyDiTrixrEaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5caf911d-e96d-39e4-d945-db6537412f60@suse.com>
Date: Mon, 7 Nov 2022 12:49:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [RFC PATCH 4/4] xen: Justify linker script defined symbols in
 include/xen/kernel.h
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221107104739.10404-1-luca.fancellu@arm.com>
 <20221107104739.10404-5-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221107104739.10404-5-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0050.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::24) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7536:EE_
X-MS-Office365-Filtering-Correlation-Id: c0f23fdc-3ec8-49f7-cf99-08dac0b62335
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ra1Y5LJQgZ8XiSegDJrHMmClnrj9Zf3pHS2eU2Z3CsMaOUHbb4ZUTocYkP6G+gMatB+D5q+ZgapKeYU5XzBEZCY6er3/AS9E74AIkoYmAAB3Utn//9iqeyTQCz8Fa/Hxm1a4NXnTuHYqDI21lwC1MHVMMa+9Uv57gsk26n9B4JYZgaYlaDRl+Am7vz0oMOpZdKMhi+we8Q0RugVSlzSJN/P3/15EadO1MryhRtLGh95bGzpP0Ll5iZ1gnyQInvlYYtG/40h5BG1HUOxthtEu7S70S3eK5MXomCLUZ4dwYYmIRpL/04gX/oudGcNuoSJBdBhx/t6F0WNnkbdUNEAPin9zSrVhbHzM4q/jnqj3/IkHK6Bb+ueoSasn0Zx1uFZTvBKrX30I+wHJbQjEyYkP/0DvylKoiLOFNBVSLDgMNWEQWCJABzh8gPF3Z/NINFZSXg2xpSywsrcUrVqgJE0A6gRbl/WI9vsBujApUJAVcSgOffw1e4JmF5YGStP63dHPIy/ILkcXAb6BganYcajTncZ4MUCQJre6LnVwgUoWBYQz5T63jxqPwb7j/ktjwFcLT/EOcb5CT4A2k6m0QgYGgktiCNVufx+GE93FrdWr+YGpXdk1rUFnUgA8UJ5n3878f9p8QHA1n/KpAaxqe8bssTsBB3K+2vK66ObgKUJCdpKVDifwLcA0dBqEf9RRbPJngg5DPgV5h7gF3yWMHikCRrYL3jEE1n8AKoXpcGoZTQgAXLDpa8VOohFPJMdu0F/jD7oSmv49Mf4G0e95Oxms01DYThKGwuTspk2vozU73jA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(396003)(376002)(39860400002)(366004)(451199015)(186003)(66556008)(41300700001)(66476007)(8676002)(4326008)(66946007)(54906003)(6916009)(8936002)(478600001)(6486002)(2906002)(316002)(5660300002)(36756003)(26005)(6512007)(2616005)(53546011)(31686004)(86362001)(31696002)(38100700002)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eTJVWTBseWRkSjFiNUw2cDExdDkxZ21reEhmTmJ2ZUVZQXhCZkMwdE1BTW04?=
 =?utf-8?B?eldxWjhtakJIV2FoRkVjVG9NVFU2MTJabHpFcDI2bGZ6cXpQcnErK3NnaG9H?=
 =?utf-8?B?QjYySzRsSVhtUEJ2ZHdvZlFuTmJ4YTM4QmltYUtUaVNjd2swSTlTZEhEdklG?=
 =?utf-8?B?b0I5NmFwNXdFbWJzUlc4S1dHWHBUYmJvNnJNblU1Rk9GODEweklEWFVmbHlQ?=
 =?utf-8?B?bGo0V1EyRmNHVlhCTnU5K095MW9QT0F6ZGJKbFkzeGIxYVZFbU5mR0NWdDM1?=
 =?utf-8?B?Ky9RS0NPald3eVloN1g5cVVqQ3o5cEdsdkw4YUlrNEVrV2ZxY1d6eGtTMVhN?=
 =?utf-8?B?aCtpbERTOTBrN2xMWUVIYVJabU1FVFFmNERhOVpuOU83anN1RFJ6QzZrSFh1?=
 =?utf-8?B?a1BEVDFhRExjTC9BSzVOM3NJcjJsK0I2eXRrYU03SE5FbzJiRllFcm5NcWVO?=
 =?utf-8?B?b1dITkZYaDdBaW9XWWp1RCtTQmJHSlJaZVF0N1IvaHdnVFo1WS9GZXl5VWpy?=
 =?utf-8?B?a09ESW9ZeHJqYmx2aW10UVV4ZzBmTXhFWTRJeEZxWU5tUW85TGJBaUxRZjQ3?=
 =?utf-8?B?ZzYzVytQRG9BQlZUZVZTUWRROWZaK2psOFJCcGZvdnpqR1F5dEhIaERoTEJT?=
 =?utf-8?B?djQ4djZFd1YvYlZtd2RpSjQ5angrSG9xMlRVbGZTQTlycE5yRUZLTTZJWXVm?=
 =?utf-8?B?blVYWUVkZms2VUNNNndhSCsyb2E3UmtGK0ZkamNxYTh3UHJwbUlyUkdZeHRR?=
 =?utf-8?B?QThRY1Y5MzNxemoxRTBpSmY1RmZ3aEtyY280d1hzU2VqUEN1UjZzWHVvdGZ0?=
 =?utf-8?B?NG05dS90WmlvdnJsMk9IUjZZMVMyTytYQ0xJa3lGV2VhWkJIdTlvU1g3bnph?=
 =?utf-8?B?RGR6ZTlEaHRTZUoxYWhkbzRxN3poeGdXSjRIR0h1Ukx1Ri9QeHlCeXVlN0ty?=
 =?utf-8?B?cTJSOHhzb0dCWDBJbmI1QnhRTUZTakNDSUpQYTFqT0xHaGE5SkUzQWR6Zyta?=
 =?utf-8?B?ME5nZU5najhYalVwc1NXaHdIa2xjclFMQnF6L0xtN09LcTh3QzE0Vm5NQytE?=
 =?utf-8?B?ci93aHk1MWlhQWVwQTBrRnFNakhiVC9mL2REcllVUEQySEQxWmRXSmZ6ayt5?=
 =?utf-8?B?UXZ3RzJKcGNSNjMwUjUyUHhmWVFUM3NsSnNzeGhHNW5aV2I4SzlxNmRmQzlk?=
 =?utf-8?B?dWdrMERIc0N5UkJKcXVkR1ZWNCtLMmpOWUdNbzVubGljKzlTQ21vM25TWVNt?=
 =?utf-8?B?eXNrd3Arc3JZdlZOdzdZMmRwRTExVENmTVlXU0Z0amJ0VXZITklTTE5mU0FB?=
 =?utf-8?B?ZHhRWU9qS2s1MG1Rb21IbWp2VkRkcC9rd3dUcnFkTU84QXR0SWVldFREQ2tN?=
 =?utf-8?B?eER6bFhiYVl6UlQ3UXNRdUlaV2k1UFlQVFpsYmE2SGFTQkpKTG10RmtIVTRs?=
 =?utf-8?B?NVBxaTY4cTJNalFTNW9hY1lKT2MxbFNDVDRvUFB6bW1WRHRrVXlEelROdGRB?=
 =?utf-8?B?cnJLbGIxSlFVb3NuQXdSdFZJb2hlWWU0d2lvMktqWk54cHRqY2hBd2UvZ0t1?=
 =?utf-8?B?Q1dIWHJsYkZRbDZIVEVLU0RXTUF5OWNsaFhzU1o3YTg3RGczRXh2cThXekFX?=
 =?utf-8?B?bjE2QS85ZjFvQ1BERDNFRjB6bkk4aHQxMVkxNnZ6THNjVkZHZ2JwR1VoVlBY?=
 =?utf-8?B?MDhXSklvQnBJN3Jtb3FIM1ZiTWVPRkg1OWlYakx5blhQTzUrMFF6NS9LV3k1?=
 =?utf-8?B?VDJLWkxDNllJa05Dd014b0hGcGx4ZllnTUZaUm4zbE1OZGpIckVkMDdxUzRP?=
 =?utf-8?B?dXphbnd6THlhaVBFeVNTc3JyaTdwK3UzdUFlNGJYTVJLVWJXSm92M1pJeVk5?=
 =?utf-8?B?MkJ4TWNKT1VCTlNyUTgrL1RyZWluWXAzUjFKWHZidmV4YWc5YjltVlVjNUpm?=
 =?utf-8?B?eFJYMGNFd3FsNU9TM3BKRDRwR25ObHh2Z2pzQ0FBKzRuTnBtME1Nc2RFVmF4?=
 =?utf-8?B?d1dHRzNUVXdoYWkwbTU4NkZlQTZZRmM5SU42RjNmVndjRitDR2xLeXVLbHB1?=
 =?utf-8?B?eHR5QTA2TWhBMzNPeEluQndWNzZFYkdwOWVjcmdLWktHdVZsNlNyWWF3VG1o?=
 =?utf-8?Q?5C1HFbErgJzb1WP8aVeqkuu04?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0f23fdc-3ec8-49f7-cf99-08dac0b62335
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 11:49:33.5218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x5X0kBNOuBBC7UiA1Hy28HVMNIQaxQ3CPFqrE2alqegQpCue+Tsx9hcrtgAxeVX2EkizLJ//88TDqxUgBUTuVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7536

On 07.11.2022 11:47, Luca Fancellu wrote:
> --- a/xen/include/xen/kernel.h
> +++ b/xen/include/xen/kernel.h
> @@ -65,24 +65,28 @@
>  	1;                                      \
>  })
>  
> +/* SAF-0-safe R8.6 linker script defined symbols */
>  extern char _start[], _end[], start[];
>  #define is_kernel(p) ({                         \
>      char *__p = (char *)(unsigned long)(p);     \
>      (__p >= _start) && (__p < _end);            \
>  })
>  
> +/* SAF-0-safe R8.6 linker script defined symbols */
>  extern char _stext[], _etext[];
>  #define is_kernel_text(p) ({                    \
>      char *__p = (char *)(unsigned long)(p);     \
>      (__p >= _stext) && (__p < _etext);          \
>  })
>  
> +/* SAF-0-safe R8.6 linker script defined symbols */
>  extern const char _srodata[], _erodata[];
>  #define is_kernel_rodata(p) ({                  \
>      const char *__p = (const char *)(unsigned long)(p);     \
>      (__p >= _srodata) && (__p < _erodata);      \
>  })
>  
> +/* SAF-0-safe R8.6 linker script defined symbols */
>  extern char _sinittext[], _einittext[];
>  #define is_kernel_inittext(p) ({                \
>      char *__p = (char *)(unsigned long)(p);     \

Why the "R8.6" everywhere here? Didn't we agree that the in-code
comments should be tool-agnostic?

Jan

