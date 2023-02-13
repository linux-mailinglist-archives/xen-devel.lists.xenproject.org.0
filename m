Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0CE694118
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 10:28:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494290.764327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRV7l-00032h-JK; Mon, 13 Feb 2023 09:27:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494290.764327; Mon, 13 Feb 2023 09:27:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRV7l-0002zK-FU; Mon, 13 Feb 2023 09:27:49 +0000
Received: by outflank-mailman (input) for mailman id 494290;
 Mon, 13 Feb 2023 09:27:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kX12=6J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pRV7k-0002zC-96
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 09:27:48 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20601.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad1081e1-ab80-11ed-933c-83870f6b2ba8;
 Mon, 13 Feb 2023 10:27:47 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7992.eurprd04.prod.outlook.com (2603:10a6:20b:2a4::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 09:27:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 09:27:45 +0000
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
X-Inumbo-ID: ad1081e1-ab80-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IcsgTjeLb/LyqOHXZzFhp6r3UNL1eDzrkHqb9ZoqGEg/45jpS8WJ34qaNkRVNW0XzhJ6+JQxZfWrwSEZUQmjFNeVyD6uHG6RZAu1W2zE/CkPDO7r/EwLD/4xYR/DToaqAM5i4ApIsWQ+PDCrlb63yMn30XhuvQjYfSPvO15zMDtBUxGD44eT6z+0T3lE8QIFUPuNDy93dsIfxlRCZoKEbbUZkdt4CmggTqL6zpo9S6Lvn6CFryS8XfCjhFZ5+Oghw9l9TlmOFdE/OnUl5f+CXLTsvk3ubD9FWqwEIb5E9tjIaGI4zbw+ePNU7GeI/iQ9aYeP4Qcjqt6nHkrRoIbS3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fsBy0nU/hesAsokGG8TGpHf+mFJHlegQmMs09BzikFA=;
 b=FfG0byRVYX0jN2zc9PtpqbVeQR9QnuN/p3czWQNrHCT3sjZGkq1SMiszEMJ8gNIiLM5ydj4pVUJ14b5d8PdjWxbqnPGKt73yM5Q7Q8ic0b2ZgxDi0PKIZW+z3Gqh2w0q/w2zmtdZ/mR+QXKxaqkZbnYpOm+WRa6zWCg8CcIyM+1qjlp4tMkw7PfFEcQ9i0Qg99ZILGUbfKxZjjgGcg6kU+v7yMzI4tseuLEL0Ok4NKRfD3rfaXj9RuM/DXoPhQtJhS1WjNlu/c/UvTWM8jxY8QXlpE8wBJ6Nj3YMcLmWXbvzNLSNOZPe/o1XhkVitn6h0z7yVMu4yKXo+fFIFN9KYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fsBy0nU/hesAsokGG8TGpHf+mFJHlegQmMs09BzikFA=;
 b=AG13IfMPes6eGXu0Ogp8AO5Ydh2+LEGvroPWmflPTMudYkDY2i1zaaP1aDaRH0aVWorjqO23dZNG2jCA412yg+Iir5Iwe3L3hbdBA0qfwRHS0J8zfhPk3Ejp5TFEO7WKrwcnEH/AtFmCia99N2jpb0AKrS0SjejUWKFbZac7TbERvmHkX/frE4VmLpwF1JmwDo9PZs19+nwbhCbP7RrIl2OSTLC+guqoFV1rIfQI6wiYtBMTzJLfGAEiVs8k+fUrclm9mu4oej958mrBZ10lZ56u6iGmv1jtH94lus9aMCpgIc/tYsMRbulcHQIJAX3Kg9427hpGtG+aUVFuhxKtPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <34dd6673-a8b2-977c-adfd-928418cb5435@suse.com>
Date: Mon, 13 Feb 2023 10:27:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 0/6] xen/x86: Use SPDX (take 1)
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: demi@invisiblethingslab.com, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230209230020.52695-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230209230020.52695-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7992:EE_
X-MS-Office365-Filtering-Correlation-Id: fcb8b747-21cb-47c8-205e-08db0da49029
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WDCw6BxnnxC3kJJT3gwN+jITBOHG2Fp16Q3NDEVoSpyqeZVAp6Zm+izg6yq5z44AyZQZaQ7dcAL6036MmMBGLicGgbPb1NZMamdtAN8tQM4OStu5s/ibjhzr/B8gXvoAFTWzzPiM9kEEE4AEO+Q1caPmQsd+VNDyjMGkHvP8MdkZxqpJb89He9TbTiTAzh20eIa9xDJzJI2WY4V1oSQMYdMU+O9aaoJlToj5PhFFdac9FK85iMhoJlpZ6liN3PiChxV7RNdIy1O1Qh+fuym840lrvsDS/BJPFAE916I5Q8KCUR0CUYNBZ1PhiYBXJKGH7+2BhMjyOnumjp8tH7AfiB/+LccpcCOW0LAz9l9TJl6QF3uFh+z39Rmwb4wnrJ6yObxW83ao2eOd3T57lcmrZuYhkHXedvbPtVoBidT8DNye4wTHlOO3yGfaiErCa6/xGjqA+R5s0STDVi6uwA7biqcsSU0mqQQZ9TDLZTE6wuT9exFRNkjb1L1tCbsZpt6Sj0XlL93+e/bSuSQwHctCS5oiWswvFOiuE7iLpjfB5D1iNlGi/CTC/CDcUredzf9Rpvt/Sv/lviPvd6l5EntgKVU+pOJSmTosialuzmP4hXGmM1o2n9/HAjiDGxFwyCTbpkWOy7USGVfx8DA1G67xuZ08WwqMfaKRzIu5qlj9ET3IdUnEM48M7zJA/2EB+nY1x9qUuKacTdLVXaxQLEHawT4qf+dWKTmE5SH5Yrwk4d0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(376002)(396003)(39860400002)(136003)(451199018)(41300700001)(8676002)(4326008)(6916009)(66946007)(66556008)(66476007)(38100700002)(2906002)(31696002)(86362001)(36756003)(7416002)(5660300002)(8936002)(31686004)(2616005)(478600001)(6486002)(6512007)(186003)(26005)(316002)(6506007)(54906003)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a09LMlcrcDVGMkNLNThqTW4xRkNtQVFLdnZBRmkxU2FQMDk1YWFtMTlhYTNy?=
 =?utf-8?B?WWM1YlVpS0RQbjN2Z1VrMUx2V2dWd2dHOHg4VTMxMm1xZjFUZEh2eUlQN2dW?=
 =?utf-8?B?MmJWbjR6MDlPUnM4UUdUU3pLZ1FkeTZpdlhTdGFMWndZemN3NDhWMmxhR0RW?=
 =?utf-8?B?K2c3b05ybXNQaXdrTm1IUE9DMXNBeW5vblYzMGpjdG5TZkN3blZSV1V4bTFI?=
 =?utf-8?B?WnZYRUxuWEYxT0VVTVdmK3B2bHg1dWJGZmdyZWNlSXJUYjZCa3MwajJyZnpC?=
 =?utf-8?B?VUMxWm9vWUpSRmt5NDIvaCsrUkhMSWJtMnJzN2RESlh3K05rNEJicmoyMmZn?=
 =?utf-8?B?allHalEzaG8rZGZyOFhFNUlKVThmSWZ1T0hBRmJoUzUzSktFVVh6bFowb2VM?=
 =?utf-8?B?NEtaTzExTVBTNzk5SEJXa2hLOUpJQ0kzc1lneUpNVFNnYWM4VXo2SW8yMFJC?=
 =?utf-8?B?d1dVYU9Xd0RQSlZyVWFselVQNGw4akJPMW5wcmMyOEM4b0x3REVsMWxlNW5p?=
 =?utf-8?B?WjJaeG42OFplZUhqSk1tT3JBMFhTYlNRUDlzVkVqNktKK3lwL0Y2NGVGZEpH?=
 =?utf-8?B?UTF4aG5IRmpGd1paMk9lQWF4QnZWSUZzUWtJY2hCNUR6YXN3WVZkSmZmWFZu?=
 =?utf-8?B?OXI3eGphOWlnbXVIK0o5NkhlVEMvZkxRYTRRWURsZnlBNlZFTElQNlZZRE1V?=
 =?utf-8?B?cXlDQkxSR3FWWVhkZTF1T3NQVlEzUFRnbnQ1Qmp1a3FBTHdYUzdHNG1mU2FU?=
 =?utf-8?B?bEFjS3ZkTnAxY2JkNWJsRTlNUEJNb0puYldFTVN6YmQvNmNDcDB3ZXlQQlR1?=
 =?utf-8?B?TWU3VW1pcE0vcXJiQ0lmVlNDZ1h0VE1NaG44YWhxa1NmeWNtV2hxVVdKRkw1?=
 =?utf-8?B?VkQyQVZuSXYwWHNVMWR4Sm1yVkhlSXpXcmZzMi9LLzFiSXEvNGEwWXBHQjlE?=
 =?utf-8?B?Y25reVJEYVdGUUR0c1o3R3dmcURZYUwrV2VoQU4xdEZjb0lSRG1BaHdSd1NV?=
 =?utf-8?B?VGVUbm90WmJNbDFVWlB2bGdtL0Z0WXQ1SUNMVW9MTU0xNXlZL2ZaVFNXTHI4?=
 =?utf-8?B?TGY4OGsvbXFpakV4d3dmd2xwckMrNVdTS1RxZzZ2aTVZa09lS3VJSnAxMDNh?=
 =?utf-8?B?M3ZvZi9lb1pTVm9LQVg1a2JFUG9FOGc1QTBsRE5UQkZIMlRLY1BHSmhtOEFU?=
 =?utf-8?B?anBvekxlSmhiZGVXMnpTWlJlZWVWemRyUVRoS2xnWWdqUHBicU1YRHdJUHp1?=
 =?utf-8?B?WFc0TUttQ2R3ZzVrTHFWaFJidmlvQklacXlDSVNhdUQ3UXREWWRESGZnUXZP?=
 =?utf-8?B?WlBiamdmY3RtLzZnVC9peHBQT1V4OGVoQ3g0bE52SnloM0JvdXZMWXhkQ0Qv?=
 =?utf-8?B?Ymt2WG9pNWhMb3lBZ1dIdTBJemlYWUJES1kxWWFMWjN0ZUx3dThXb1NmaFZV?=
 =?utf-8?B?a2xNaFhRZUFlN3hKd1BGbk55eEdJQzJINFhxSmNubmowTlh1Vkl0NHZTWGI5?=
 =?utf-8?B?Mmw0RVFSVVJxSFY0d3dQMWY1OG5HSE1UbkpOUG9TM0xuaGRBdUI2T2YxMUhM?=
 =?utf-8?B?UVlGTUdnbWJ6c045b0k3dGRwbzB3ZGZ4WG9iNXlLVzRjdGJMZkhhSW9TNVZv?=
 =?utf-8?B?RG8rbDdrRTU4VWViWU1GaWZvN01LNTBJWDBhMXQrdDk0WmtBdldleENaVGZt?=
 =?utf-8?B?OTlQMVJmM2VvZ2k0bmdkQ245MURVNjVqbUUySS9tTFVQOVRpS0FDeG16RldZ?=
 =?utf-8?B?WjIrb0xTeFg5UDkwVmFOM0o3YlQyNUxpZklsV0JLbGdWaExoVVBUd3hSRWgw?=
 =?utf-8?B?dlJmMFpCbHhQOHFFcUNqd21kdDJ6WFgrYnNteVNtWVhHM05qN2xnOWlCWTh1?=
 =?utf-8?B?NDNRM0VSZ1orV1NUT213TzZ1c2Zmc0U3Q2hWWExEMEtjZm5Jd1BuUDZxdjQ3?=
 =?utf-8?B?OE5OR2hSbzJUMWgvK1FicHlpNFdLT1BQSHVObjhVak02cWRydE9yby9UMDFu?=
 =?utf-8?B?eVBJbDUwajFNWXZFUFhmSW9NR29XaEl1Z0xzcjJ4NmU1Qjh1SWdReXF1alo3?=
 =?utf-8?B?TFJVTFVESktaNm9uOGRGakkwOW1sRWRoMUQzT0JiMWJxdVo3dzJJY01aL2Vj?=
 =?utf-8?Q?Zb9cFowdLxZAGSOFcYO3cBEtk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcb8b747-21cb-47c8-205e-08db0da49029
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 09:27:44.9344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P1wD5yeoofkmtDlV3QUPsOmE5QHAnmrQr4Mz7Iveb3n9h2Vl/vhqRdaOSnRMp71AHruMx8rlujuvxPQV4shJ/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7992

On 10.02.2023 00:00, Julien Grall wrote:
> This is a first attempt to replace all the full license text with
> SPX tag in xen/arch/x86/. For now, this is only covering files with GPL 2.0
> and 3 different patterns.

For clarification - the three patterns mentioned here are the three slightly
differently formatted/spelled versions of effectively the same text, not ...

> I have used the script below to remove the full license and add
> an SPDX tag. The script is based on the work from Anthony [1]
> 
> 42sh> cat replace_license.py
> #! /usr/bin/python3
> ## We are opening/writing to files using the binary mode to avoid
> ## python interpreting the content (reading ./drivers/video/font_8x14.c
> ## will throw some encoding error otherwise).
> 
> import sys
> 
> if len(sys.argv) < 4:
>     print("./replace_license <licence-file> <spdx> <file> [debug]")
>     exit(1)
> 
> licence_file = sys.argv[1]
> spdx = str.encode(sys.argv[2])
> file = sys.argv[3]
> # HACK: enable debug if there is a 4th argument
> debug = len(sys.argv) == 5
> 
> with open(licence_file, 'rb') as f:
>     licence = f.read()
> 
> licence_spdx = b"/* SPDX-License-Identifier: " + spdx + b" */\n"
> 
> print(f"reading {file}")
> with open(file, 'rb') as f:
>     whole_file = f.read()
> 
> try:
>     licence_loc = whole_file.index(licence)
> except ValueError:
>     print("licence not found. Ignoring")
>     exit(0)
> 
> # Replace one the below pattern with nothing
> ## Pattern 1
> # * <license>
> # *
> whole_file = whole_file.replace(licence + b' *\n', b'')
> 
> ## Pattern 2
> # *
> # * <license>
> whole_file = whole_file.replace(b' *\n' + licence, b'')
> 
> ## Pattern 3
> # /*
> #  * <license>
> #  */
> whole_file = whole_file.replace(b'/*\n' + licence + b' */\n', b'')
> 
> ## Pattern 4
> # *
> # * <license>
> whole_file = whole_file.replace(b' * \n' + licence, b'')

... referring to the (really four) patterns here?

> Julien Grall (6):
>   xen/x86: Replace GPL v2.0 copyright with an SPDX tag in *.c
>   xen/x86: Replace GPL v2.0 copyright with an SPDX tag in *.c (part 2)
>   xen/x86: Replace GPL v2.0 copyright with an SPDX tag in *.h
>   xen/x86: Replace GPL v2.0 copyright with an SPDX tag in *.h (part 2)
>   xen/x86: Replace GPL v2.0 copyright with an SPDX tag in *.c (part 3)
>   xen/x86: Replace GPL v2.0 copyright with an SPDX tag in *.h (part 3)

With the one further adjustment you did spot yourself:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

