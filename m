Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2528369A5F2
	for <lists+xen-devel@lfdr.de>; Fri, 17 Feb 2023 08:13:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496876.767807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSuv7-0006XM-1R; Fri, 17 Feb 2023 07:12:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496876.767807; Fri, 17 Feb 2023 07:12:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSuv6-0006Uo-UP; Fri, 17 Feb 2023 07:12:36 +0000
Received: by outflank-mailman (input) for mailman id 496876;
 Fri, 17 Feb 2023 07:12:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yqvu=6N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pSuv4-0006Ui-LS
 for xen-devel@lists.xenproject.org; Fri, 17 Feb 2023 07:12:35 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20604.outbound.protection.outlook.com
 [2a01:111:f400:7d00::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71cfd1c2-ae92-11ed-933c-83870f6b2ba8;
 Fri, 17 Feb 2023 08:12:32 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB7101.eurprd04.prod.outlook.com (2603:10a6:800:12e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Fri, 17 Feb
 2023 07:12:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 07:12:29 +0000
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
X-Inumbo-ID: 71cfd1c2-ae92-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gBwEhsp5MkIRDmbIq3q0VxCyU+rx8qb6/esxJl7rK9khnXMaArBgy1kkL5p4Zi3bM82NSXsNhmY+Gt5xICkjOIm0WRDYokhpTN7wrYs8xrTfGIJ8FkZkB85TkDhxTfefloRJQdoFrhNXnShffR3GeZ2ZU4eFBxdS7uSmrhLGYSLanTboRDqtHNMNVtnRZfpB/DFISvocUlvQqdCUjAHZ8ipHEqCVIQ6D0PWGcIYjG49/Kra1oAb5+XpMgSDq5/1FCr3QBHVYQHPQMDCDm+OUglM49qtqFhXm9fAy10Iz4XRXAjnCzcA3pdClxFr0avfd6fNEsygEtOkZaUCxPfj8XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1EOdD2wBr2TeTeg9Y1qoWwpjV8hyLFsLt3tEhEorEiY=;
 b=cp3Yl54P7Dy/BV9INBOzXK5CmiK0uwXfgM2rloSP8e6BVfwQ/aXCKZYaesMe1jRskqzEqcrqTUhDvkMjYjnHnj7BAGxt6l4qYUUAiDfNu/mVwkhs0h7Ey8wr8mpGn7csdKlact4g7JGqDpxReMDRpbTln82M8bLYwgheHB3+jgIDGLw0mkD9W5hLKE9b40i+2KGgW/KQHqekkQWuA3lwn5IV+zPFxUjSU8481qQm0t7IY3TO20rvY61rgzFfQjAkNuVL9lIf8+PK0Z3H7rA+Rw7z0CtIYMWMFgkIg4cNZbGJvldBXexvAncp2aNDSEITSkDBVdQ24RFlnN9c7leBmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1EOdD2wBr2TeTeg9Y1qoWwpjV8hyLFsLt3tEhEorEiY=;
 b=5pfLy1IJ/QdJOBVMgORYHfDkxc8ryDPy/1eXjK6T5fghfqG9UOzoYfoxO9Z7/eJVn+qoOgw3xefopmwnlD6zOFPjFOUkA1mxUL6xjM8Oz7aa1m+Y8UDTWHJQmWng011Y0ceXvlJm8Uln27o9PyBB2eK4cWSs8fFGZFa0iweFly67XpMm9GY3Q1Rirj2oc7+m8FnfZOT4C7fAepRwfDHJ8qI/kJo0oyrRqd2jc439UZMjCdBIsrntLmTmxL5OeFpFjfGyGtc0LQv9nTqkqZTAVhAKccYR6a8YbPJozGGFdwtPm1Nzi/iOfCxXRfKhHumRSJPWbkRjaT2jGu2r7hbOkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <20191ac6-3c1c-8c9f-39ed-308bc22d5b3f@suse.com>
Date: Fri, 17 Feb 2023 08:12:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v1 1/4] xen: introduce CONFIG_GENERIC_BUG_FRAME
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1675441720.git.oleksii.kurochko@gmail.com>
 <8adf4aeff96750982e3d670cb3aed11553d546d5.1675441720.git.oleksii.kurochko@gmail.com>
 <199fa5a6-ca31-091e-88e0-cae9efde307b@suse.com>
 <81fd6cf5ff59acf6ca8b66e093630e5accc45198.camel@gmail.com>
 <9cf03b23-586b-92e1-c0b1-578f3eadd2ad@suse.com>
 <00abbda808239ab74cb6c954b33e34380ac4e41e.camel@gmail.com>
 <5f6d7b8e-907b-d3eb-335c-8d4a77edf526@suse.com>
 <413b6d1439a31e24719321494971cc165bd6942c.camel@gmail.com>
 <29623e829602d0a7861785b8f0a47d6905ac89c4.camel@gmail.com>
 <4c52d703-dd7c-b316-5e37-38c9aa705725@citrix.com>
 <e00086a6b0494d30f61e295e690ecaf0aa19c4e7.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e00086a6b0494d30f61e295e690ecaf0aa19c4e7.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0190.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB7101:EE_
X-MS-Office365-Filtering-Correlation-Id: 521de334-f422-4d40-a6af-08db10b653ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A1wDP5BpHTf+czUltgzZuycRKcFevKL8dDLtlniAaJSkCVnmxVS2xukECFd33e0Ke7sU+bTzj7q1aFQRK5lQvb8c5uXd1wd6X9KQNUMlPk1l7WBlWzOdjg2SP2bmS73nEcjj1KPFjs0M7to7epbLjYlytm6Sx3aI1jG42sik6Iy4YYi0wZbzI0N0bpBwsSO5qQgYgMJa28L4iI2FsJNFdDAzrjdXgMnw+awusAnYy/7EofQDAdGJSEkynkEPFcb0ra/fX1NPTDHNSFeZBdbYwtZUHZlS+zh1lsVhkWwsoJ7blsQ3JqCaicjihaoE3AZYMFeU3gYroAednOn/uh9GbrkyxgmJ3LiMMqpuom4DQIzPmEapoJIJYabUeBmeHeH0c0ivNZvmok0ozLkZHGmG8NxWuYbPR1idDYcxC3aHMR9egPZg9px7FLEATZX18CI0GkkfXk5RD/jlilH6Oq7D19Xx50/BXdbANxvA7dRZVyvyvJJXAghz0Avk3JKBsqHbkF0VkWvCiGxXsCSFFerOxMPmwLEZFT1sVvFsuEoGNfSe6P5tKD9CDJxmeLmfleX0wiClMP66CtD+8YXNE/ENZwkLtftiRi11juwWPp5WWLeHAcvFDHH6sQmPTO9LwT96++AktZRd5c0swGfhYqhxa8w9plr3ZtuP6frn+EYut7ctuEav0fAGd+RmsN0cpacu/9GjOn0nPLnOdUV0yzx1I3scfhSl6WMxgUTXvJE5rxq2c/Gf9kMdKaIyPwemNltj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(396003)(39850400004)(136003)(376002)(366004)(451199018)(41300700001)(31686004)(5660300002)(54906003)(66946007)(66476007)(6916009)(66556008)(8936002)(316002)(4326008)(2906002)(8676002)(478600001)(6486002)(186003)(2616005)(6506007)(26005)(6666004)(53546011)(6512007)(36756003)(38100700002)(31696002)(86362001)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUNMa3lRSGNsQjZPbXRvK3ZTWEJyUnlOc0VWY2FQU1RYT09lM0lHZ25TcExW?=
 =?utf-8?B?ZlRLWVRtYWsrSU9UbnVrOWR6TzZkVVZKdkpHMUQ3TmV3cWdrcTNSb2RkRFBS?=
 =?utf-8?B?ZG8yS2Irc2ZEWGtiV0ZmdGdsdExEM3NaRTd2RDNCNnNwVks1cHNjeTMyQTlt?=
 =?utf-8?B?YW5jMEo4aTdkWHMycmxXWDZiSDZGeHRKS0NRMjVoSmhpRHM5ZkNDbEl2UjRt?=
 =?utf-8?B?N0o0RkV4cEdibVlYUXFsM0JkMC9OVTBPY2RtbnphdkRiWEZHZ0hsSUM5NERS?=
 =?utf-8?B?aTU0NHBrWDNrcThaaTZXUWlRSElxNGFBUEVpR29qSnBTeUQ1YUEyajBxME56?=
 =?utf-8?B?eWR3RkVkRXJkUWhqWitvQTFZMy9aazgzME1jMEIrRFU2Wk1DUTk2WjZFNEo3?=
 =?utf-8?B?SmZ2a2VMS3YrV3l2Ym1hSER5NGpRbmZJL0t4OTBOTnI2NEdQK1pWZUxCOWxX?=
 =?utf-8?B?aWtEMXhnSXdlbzNLaHpEbVozaTUwNmlBUGlUeiszNm8yQ3cxZ0FINUIwSGdG?=
 =?utf-8?B?Ynl3djBoZEdZMXYyNW01SzJTWmxzS2tRQ0RjNGtZMXlzUHNJckxzMXFTT2R2?=
 =?utf-8?B?WmVlWmJlcFI3aVMxMFF3bTkwdVp3c2NrNmVGQW1hc0dXRDNscTBlUEs2VGU4?=
 =?utf-8?B?Wm5zRGc2eXRUR2hqRDhHaGxyMWh3K2hqck9rMXNTenh6dzhYWFF6dFdqV2ts?=
 =?utf-8?B?YUJscmVaejJiSmNPOWdXQmVGSitFZ0FtUEtIdnpDdWdBbEsyWDVCV1lsaGVP?=
 =?utf-8?B?dUxFU3FiUXQwTCswREtTcEMvakpUWXJPYStGajhkZy85OFhpRUR5TDBOMUVK?=
 =?utf-8?B?WnRWOERwMXNFZXljMUFYMnZ6Y2E0KzlTcVNEd2svaG54djAwUmpsdnA1WTZa?=
 =?utf-8?B?YzdBU0Fkcjg1Kzc1MEQ5cWtJbmhzT0NpdHFvMnU4UG9qRkhFd09YdXRuU0hE?=
 =?utf-8?B?RXFhUmJ0OHh5NCs0ZjNHcGVHK1dhdER2VTVoZlN4U2hsb3hSTXVzb0NMSlZ1?=
 =?utf-8?B?UWMwZi83S3JHRFdCOUM2WnVkV1pmT0d4ODJNZDA0OG1jSmZoUFdsd2ovY1Fv?=
 =?utf-8?B?U2hBOHVjYVdmblExYy8zbWtiQ3lGdTU1cFY0QzQwYnhQejlRVFNsV3VSNEFi?=
 =?utf-8?B?cGwyTk56c1FQOU1YTk5XeTlFVUxGSk9KT2RBQ3RaOFhMYlNJT3BCSFBIQ05r?=
 =?utf-8?B?UGduaWNCSVFQeVBGNW1ldXJhSXI3d3JsU3NqSEdSZk1reVp4T0JiSkQvNStH?=
 =?utf-8?B?M21rZEpUbndFd0RuOW83VkpkdWxTMU4vTVF5MWtETzNPa0hiVGhTcE5Pc3JW?=
 =?utf-8?B?SWhkeWRhZWNyWW9UNzJWaVQwd05ueHlNa3REVUZwVHVjdndzYi9iczBMU1JR?=
 =?utf-8?B?cVNUVHYvaDZlNldwMTcrT1dCTTZlczBpNWsxaWlON3BkSllOTms4UUtiS2Iz?=
 =?utf-8?B?Y29lQy93a0hqVTVaMU82WXR6UHNmMnVBaGFOdzlUMUtxcFY2QnQvYS9aSUFT?=
 =?utf-8?B?YmJ2SGJBOFZKaFR2QkM5QXhvUGJwcjE3YUVLdXNEZU96SjVhbXhKWjR6d3lj?=
 =?utf-8?B?VmhqMDVBNng4N3d2SWl2RnlqSkd3SmNkYjkvMDhIMHUrSkRjU0Y5Zjdpeits?=
 =?utf-8?B?TktIbWNta2liL09lNFhMUmg4cm9KdDlHTmNWdjY2WTUxdHNreE1uN0VzaHJD?=
 =?utf-8?B?anVUSE80Q3dHWmNEQUxRK1BSVzdrRTgzWHFoSWY3ZDhRVGZvdUpjNGtLTHQ2?=
 =?utf-8?B?eTRPL2VpanVuemIzRWkzdDVOcXhtd1lTQ2VLMG54TFZPWlVvOUo5Z3F3MzdV?=
 =?utf-8?B?ZUVwQ3UydFR4UFNSeC9oNlpKRUw2SUdBR0Y0NC9Ta0dqV2djZmdETTJWS3VJ?=
 =?utf-8?B?ckFDZ1lFQTRUVDMzNzZlczlPNWhnWVVRWjAwdzc3NEYyWUpyamE4NFJUN09t?=
 =?utf-8?B?Y0c4ZFVxb0ZybTkwZFBodmc0eTR5UDgxUVFxcS9FK3M2NWdNc05kblh6NGtS?=
 =?utf-8?B?SGJUSUFRNkMwRFJhQjBWdEpvQ3JrMHBIMlRFMmR6T243cnNzdGxmQXVYam9X?=
 =?utf-8?B?YnFrK1VCeE8zdFZub3RPV29VaTRDUlpGMXpuWHdhRXJ4cGM1emxIT1pEWVk4?=
 =?utf-8?Q?oURR9sgQiJjgdESS+LUi6ffdc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 521de334-f422-4d40-a6af-08db10b653ea
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 07:12:29.0879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: COYM+vopr50Uo6Ux47KF6s8YT/DjYi4Lwq4oL7Eehcfp0kcUeitXcvZjaOw2q9l1s9ZvLF7oVyGMCgnNVmNOmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7101

On 16.02.2023 21:44, Oleksii wrote:
> On Thu, 2023-02-16 at 12:19 +0000, Andrew Cooper wrote:
>> On 16/02/2023 12:09 pm, Oleksii wrote:
>>> On Thu, 2023-02-16 at 12:44 +0200, Oleksii wrote:
>>>> On Thu, 2023-02-16 at 08:31 +0100, Jan Beulich wrote:
>>>>> On 15.02.2023 18:59, Oleksii wrote:
>>>>>> Hello Jan and community,
>>>>>>
>>>>>> I experimented and switched RISC-V to x86 implementation. All
>>>>>> that
>>>>>> I
>>>>>> changed in x86 implementation for RISC-V was
>>>>>> _ASM_BUGFRAME_TEXT.
>>>>>> Other
>>>>>> things are the same as for x86.
>>>>>>
>>>>>> For RISC-V it is fine to skip '%c' modifier so
>>>>>> _ASM_BUGFRAME_TEXT
>>>>>> will
>>>>>> look like:
>>>>>>
>>>>>> #define _ASM_BUGFRAME_TEXT(second_frame) \
>>>>>>     ".Lbug%=: ebreak\n"   
>>>>>>     ".pushsection .bug_frames.%[bf_type], \"a\", @progbits\n"
>>>>>>     ".p2align 2\n"
>>>>>>     ".Lfrm%=:\n"
>>>>>>     ".long (.Lbug%= - .Lfrm%=) + %[bf_line_hi]\n"
>>>>>>     ".long (%[bf_ptr] - .Lfrm%=) + %[bf_line_lo]\n"
>>>>>>     ".if " #second_frame "\n"
>>>>>>     ".long 0, %[bf_msg] - .Lfrm%=\n"
>>>>>>     ".endif\n"
>>>>>>     ".popsection\n"
>>>>> I expect this could be further abstracted such that only the
>>>>> actual
>>>>> instruction is arch-specific.
>>>> Generally, the only thing that can't be abstracted ( as you
>>>> mentioned
>>>> is an instruction ).
>>>>
>>>> So we can make additional defines:
>>>>   1. #define MODIFIER "" or "c" (depends on architecture) and use
>>>> it
>>>>  
>>>> the following way:
>>>>    ".pushsection .bug_frames.%"MODIFIER"[bf_type], \"a\",
>>>> @progbits\n"
>>>>    ...
>>>>   2. #define BUG_INSTR "ebreak" | "ud2" | "..." and use it in the
>>>> following way:
>>>>    ".Lbug%=: "BUG_ISNTR"\n"
>>>>    ...
>>>> Except for these defines which should be specified for each
>>>> architecture
>>>> all other code will be the same for all architectures.
>>>>
>>>> But as I understand with modifier 'c' can be issues that not all
>>>> compilers support but for ARM and  x86 before immediate is
>>>> present
>>>> punctuation # or $ which are removed by modifier 'c'. And I am
>>>> wondering what other ways to remove punctuation before immediate
>>>> exist.
>>>>
>>>> Do you think we should consider that as an issue?
>>>>
>>>>>> The only thing I am worried about is:
>>>>>>
>>>>>> #define _ASM_BUGFRAME_INFO(type, line, ptr, msg) \
>>>>>>   [bf_type] "i" (type), ...
>>>>>> because as I understand it can be an issue with 'i' modifier
>>>>>> in
>>>>>> case of
>>>>>> PIE. I am not sure that Xen enables PIE somewhere but
>>>>>> still...
>>>>>> If it is not an issue then we can use x86 implementation as a
>>>>>> generic
>>>>>> one.
>>>>> "i" is not generally an issue with PIE, it only is when the
>>>>> value
>>>>> is
>>>>> the
>>>>> address of a symbol. Here "type" is a constant in all cases.
>>>>> (Or
>>>>> else
>>>>> how would you express an immediate operand of an instruction in
>>>>> an
>>>>> asm()?)
>>>> Hmm. I don't know other ways to express an immediate operand
>>>> except
>>>> 'i'.
>>>>
>>>> It looks like type, line, msg are always 'constants' 
>>>> (
>>>> they possibly can be passed without 'i' and used directly inside
>>>> asm():
>>>>    ...
>>>>    ".pushsection .bug_frames." __stringify(type) ", \"a\",
>>>> %progbits\n"\
>>>>    ...
>>>> ) but the issue will be with 'ptr' for which we have to use 'i'.
>>>>
>>>> And I am not sure about all 'constants'. For example, I think
>>>> that it
>>>> can be an issue with 'line' = '((line & ((1 << BUG_LINE_LO_WIDTH)
>>>> -
>>>> 1))
>>>> << BUG_DISP_WIDTH)' if we will use that directly inside asm(...).
>>>>
>>> I think we can avoid 'i' by using 'r' + some kind of mov
>>> instruction to
>>> write a register value to memory. The code below is pseudo-code:
>>> #define _ASM_BUGFRAME_TEXT(second_frame)
>>>     ...
>>>     "loc_disp:\n"
>>>     "    .long 0x0"
>>>     "mov [loc_disp], some_register"
>>>     ...
>>> And the we have to define mov for each architecture.
>>
>> No, you really cannot.  This is the asm equivalent of writing
>> something
>> like this:
>>
>> static struct bugframe __section(.bug_frames.1) foo = {
>>     .loc = insn - &foo + LINE_LO,
>>     .msg = "bug string" - &foo + LINE_HI,
>> };
>>
>> It is a data structure, not executable code.
> Thanks for the clarification.
> 
> What about mainly using C for BUG_FRAME and only allocating bug_frame
> sections in assembly?
> 
> Please look at POC below:

That's still using statements (assignments), not initializers. We expect
the table to be populated at build time, and we expect it to be read-only
at runtime. Plus your approach once again increases overall size (just
that this time you add code, not data).

Jan

> #include <stdio.h>
> #include <stdint.h>
> 
> #define BUG_DISP_WIDTH    24
> #define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
> #define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)
> 
> struct bug_frame {
>     signed int loc_disp:BUG_DISP_WIDTH;
>     unsigned int line_hi:BUG_LINE_HI_WIDTH;
>     signed int ptr_disp:BUG_DISP_WIDTH;
>     unsigned int line_lo:BUG_LINE_LO_WIDTH;
>     signed int msg_disp[];
> };
> 
> #define bug_loc(b) ((const void *)(b) + (b)->loc_disp)
> #define bug_ptr(b) ((const void *)(b) + (b)->ptr_disp)
> #define bug_line(b) (((((b)->line_hi + ((b)->loc_disp < 0)) & \
>                        ((1 << BUG_LINE_HI_WIDTH) - 1)) << \
>                       BUG_LINE_LO_WIDTH) + \
>                      (((b)->line_lo + ((b)->ptr_disp < 0)) &          
> \
>                       ((1 << BUG_LINE_LO_WIDTH) - 1)))
> #define bug_msg(b) ((const char *)(b) + (b)->msg_disp[1])
> 
> #define ALLOCATE_BF_SECTION(has_msg) do {                            \
>     asm (".pushsection bug_frames                  \n"                
> \
>          ".long 0, 0 \n"                                              
> \
>         ".if " #has_msg "\n"                                          
> \
>          "\t.long 0 \n"                                               
> \
>          "\t.long 0 \n"                                               
> \
>          ".endif\n"                                                   
> \
>          ".popsection" );                                             
> \
> } while (0)
> 
> #define MERGE_(a,b)  a##b
> #define UNIQUE_BUG_INSTR_LABEL(a) MERGE_(unique_name_, a)
> 
> #define BUG_FRAME(type, line, file, has_msg, msg) do {                
> \
>     unsigned int line_lo = (((line) >> BUG_LINE_LO_WIDTH) <<
> BUG_DISP_WIDTH);                                                      
> \
>     unsigned int line_hi = ((line & ((1 << BUG_LINE_LO_WIDTH) - 1)) <<
> BUG_DISP_WIDTH);                                                      
> \
>     ALLOCATE_BF_SECTION(1);                                           
> \
>     *(signed int *)(&bug_frames) = (unsigned long)
> &&UNIQUE_BUG_INSTR_LABEL(line) - (unsigned long)&bug_frames + line_lo;
> \
>     *((signed int *)(&bug_frames) + 1) = (unsigned long)file -
> (unsigned long)&bug_frames +  line_hi;                                
> \
>     bug_var.msg_disp[1] = (signed int)((unsigned long)#msg - (unsigned
> long)&bug_frames);                                                    
> \
>     UNIQUE_BUG_INSTR_LABEL(line):                                     
> \
>         asm volatile ("nop");                                         
> } while (0)
> 
> extern char bug_frames[];
> 
> static struct bug_frame bug_var __attribute__((section("bug_frames")));
> 
> int main() {
>     BUG_FRAME(1, __LINE__, __FILE__, 1, "TEST");
> 
>     printf("bug_loc: %p\n", bug_loc(&bug_var));
>     printf("bug_ptr: 0x%x\n", bug_ptr(&bug_var));
>     printf("__FILE__: %s\n", (char *)bug_ptr(&bug_var));
>     printf("bug_line: %d\n", bug_line(&bug_var));
>     printf("msg: %s\n", bug_msg(&bug_var));
> 
>     BUG_FRAME(1, __LINE__, __FILE__, 1, "NEW TEST");
> 
>     printf("bug_loc: %p\n", bug_loc(&bug_var));
>     printf("bug_ptr: 0x%x\n", bug_ptr(&bug_var));
>     printf("__FILE__: %s\n", (char *)bug_ptr(&bug_var));
>     printf("bug_line: %d\n", bug_line(&bug_var));
>     printf("msg: %s\n", bug_msg(&bug_var));
> 
>     return 0;
> }
> 
> Do you think it makes any sense? In this case, all BUG_FRAME can be re-
> used among all architectures, and only bug instructions should be
> changed.
> 
>>
>> ~Andrew
> ~ Oleksii


