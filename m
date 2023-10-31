Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DD97DC825
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 09:27:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625511.974846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxk5e-0002lj-6s; Tue, 31 Oct 2023 08:27:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625511.974846; Tue, 31 Oct 2023 08:27:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxk5e-0002iz-3U; Tue, 31 Oct 2023 08:27:10 +0000
Received: by outflank-mailman (input) for mailman id 625511;
 Tue, 31 Oct 2023 08:27:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yzb5=GN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxk5c-0002it-Jm
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 08:27:08 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 473952c7-77c7-11ee-98d6-6d05b1d4d9a1;
 Tue, 31 Oct 2023 09:27:07 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GV1PR04MB9103.eurprd04.prod.outlook.com (2603:10a6:150:22::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.16; Tue, 31 Oct
 2023 08:27:03 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Tue, 31 Oct 2023
 08:27:01 +0000
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
X-Inumbo-ID: 473952c7-77c7-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XKBAYJLpn8wgESexsayI5JCgHsbPqCep3pYX0DX1eV/GLRujJFEujFTyxmr+uayMvS7l6KhlQkXPDz2uNDcnoK1uyKUrxSRVyVox01drtYdleQXAe6dYU0/3GNoNkYha4ot+ReAXbgVOblXdbZJuZw1L6yxJ5JCCSpXyizG8edWFuXrkc2l1rfMSE+BXScHvxiUanPeJOy8lz6Wnl8E5Nd9ThqNz6ILr1ah/hbhhDSvX7LQlVP7mxbd1xgyuKGEsyWsoWM3TPni5JFdAHpgjhdcQ/z0lncyh4dZTlaWTbbEm9KOBXMfuv0wGDKQKsdeYafotdMi9aGRB9hfC/8gHmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hrga80tquEQ+dISSCnrS4LHWXksW7tVYEjiF4NNaW4U=;
 b=cFxHIF4NTuZ4uwTBvEVtNPL3vdm7Otfhb+e6+nWLgm+CVMynNhqID4Qdi8etNyjQn2rqq4eXi9leUvYDdOYbrvXvBbuQBhr8op4ZhCgqx3QEZ4QzLBy2TW5JWqOpFAzb6T9p5buHR/wvb63GBsq6dxnw2CtUjOKVhWC/K2o5vJyRXJ8pdD6Q0Mw40pwt2lSqMFZGxPX2Gp5Ys1GRFzzKhO1VJJxB/UiwVpHFhG2qakmf7ngeeJIMI+e5AqH26IeviUZIszu7lAD3HIaz3WD/OJnWZ0Zv98FTxekV5sEOCO4Q1kprFrrx9vl9z4WHevcgQ+yGUOwZipWnUjhvAB9QdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hrga80tquEQ+dISSCnrS4LHWXksW7tVYEjiF4NNaW4U=;
 b=pyUMWki55zd7v/LtwG4AKMAR7ybp3VepTjONzZnegewU0B8QovS/Gn35+HNabGsXi2kdeTCOToEZNUOzzjjC5dwIKeVHZWjsGej8/WEC67f0Kp38ABnCkRd8GIt6maXaDzPqx6oXWvEqYTywY3ymUAqHpjArZCJtp/sOhu0x3IAVjHvbwpIYkR695rN18F3U9neAvXkRKMiga6t3qRRop/UmtnGcN9Axg3htKkMA02FX2k6pc6g82JV4n1gw+F2BjbvlukQO0xOcaTXKOt5FWuDzsdR0kuyqyi+GnC47lUGydCyb6BHlnY6u30VevY4pNsuf+U9W9HH87zDUVRXmmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cb448439-6966-4bcd-1aec-4cbfd1aeedf4@suse.com>
Date: Tue, 31 Oct 2023 09:26:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v5 2/8] x86: add deviation for asm-only
 functions
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <cover.1698655374.git.nicola.vetrini@bugseng.com>
 <79091a4e450b522aedfdd903ad671e705a933c49.1698655374.git.nicola.vetrini@bugseng.com>
 <20677a35-37ee-d959-78d5-d8f95f443912@suse.com>
 <0e96a194d77d89fbd65537b464664429@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0e96a194d77d89fbd65537b464664429@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0205.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GV1PR04MB9103:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d5ca7d1-b0fd-495a-d3ae-08dbd9eb282d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ct3kET6LMIsHJuOYswsclajeiA25FBgW01NwENx4yndcjazxX22QXfvnqV5JVFHn/jG7LZsTAu0M2yTSVxndVhGwrPz9lt43DqF3NycDfH3uItI7F9gfhMm7EJKxkkS3XNLn9E6FvV85yk9K7x68sLo8e5iRJe4fDUuG/oALlSzVTzKtE7gNlvhNl50lwOSA8dvAbcPz1CpYTHySTbPoWGI8espXuVvDAq1cW+6oh1yN7VFCz+YR5/mht7sgNqEu+5TAgt/U44KNwiXMiff5RcWgkEudBD4yWd1tJHgyCg8gVG7MBRI5/AnGbOE/SeU2b2OXFQUK3AGcds40RML9Xj0+VC1WYHZM+if3o51YDyT0ijoNGlbZ5lMdVZrMFIDfuytZHQbcM0DVTSqwb/1GWNq0NGNPfo+pBtMeA9jGKLQLwSuzPlJTkPdxU7T0FJPVJLrMTXYLU/+xkALZ1mhN7Xa+cgIqVAI+/hQobs7Wl3eAFFUvv143F6PQ8abcArx2VJKSDMH06E8LnRVLuXc8G7/nhLVOZ1NS1ZV2ZpbkIsWR8HU1HkxCTD1hcGfpNP2Pb2EqVwZVA1JCL0WWhK64bCSf2bf7OjOMT500rzw+WHc/0G8LLo8eyJ8G6248+WnGt0ZwMONQKzO2Zvdi9GoeDg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(39860400002)(346002)(136003)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(31696002)(2906002)(7416002)(66946007)(54906003)(66476007)(66556008)(31686004)(5660300002)(6486002)(6916009)(316002)(478600001)(4001150100001)(8936002)(8676002)(4326008)(41300700001)(66899024)(6506007)(2616005)(53546011)(26005)(83380400001)(6512007)(36756003)(86362001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVQ0ZytkU21WeTRmZ2p5SGYwTzh3ZUd0eHYrM3owU0xnL3NHZGpOZGRnSThU?=
 =?utf-8?B?ZVhGUEpzWnBIV3lCRXdJQXIzQmZaRDRQUlFIcDJPRU4xd2g4MnZiYUJwOGZZ?=
 =?utf-8?B?bmd5bWllTWluTlpzYnJBQi94Wjg5NndMK2ViaVhmQ2NzQzE3Q2xlT0loUlM0?=
 =?utf-8?B?T09ocjJoOWpESnlVeVN4SGJrVUZOdEt4UFNuWGU0QlVkaCtqYTBVVGx0TnE1?=
 =?utf-8?B?VmZUT3lxeWdvQW53TlE5Q3hpQjdPNzV3c1kwbWhDOVp6QUQza1BRTmdWK3d5?=
 =?utf-8?B?TFVCbkNtejYwZHNkZzdua2Y0TVBNWkpvZ3NHOU9JR2NPblBHK29wYzFvWUpZ?=
 =?utf-8?B?dzB6Z0JtZFB3d2hXN0hDcVZmTDZwZDNReW5Ya2NldGpXdjVzNTNOVTFCYnQ0?=
 =?utf-8?B?cFlvYURZaDdBc3JUVVFJd1o2eU5TMDVvL2YrRlEyRHBVSjhZQUZvN1R6Nm5T?=
 =?utf-8?B?OTM3YmdJSWpXV1RmL2xYR2pFQ2dYUE5od0hiamdKZURLcGs2ZEZ0T1FTcnFr?=
 =?utf-8?B?NlJickt0OW5NcGwzejRHOTFibmgwSEQ1UlI0OW02OUFORnhrUWNWMkpwUVlp?=
 =?utf-8?B?bWw4V05OaDR3Mjl6TzllOVJRUHJZQ0c2OGh6MWpzTXdzUm04RkZmVWZxUTly?=
 =?utf-8?B?Zk5RM0RJcUk5OEVuK1ZhRUhxd09Eb2s5MDdWV0c2Wm1LUDdlaHBtTHNWaTJM?=
 =?utf-8?B?dForRGFLZEZZWHVLenc3M2ZaaVN1NDJyNWJ5c3p5TkZaTmtGWk1qdlFIQ0xs?=
 =?utf-8?B?OURGS2ZCdCtlQWZhZjRXaVpsaW5iYmdzbGd3amxXVTFJTndVMU0yQzNBdVh3?=
 =?utf-8?B?WTdRaG9jWWdqVHZrdXFKczlEZURDK0NFbVhaMk11THFmVHdDM1lKeFlqaUk2?=
 =?utf-8?B?ZXIxenM2ZFM5UVBVeVJGU01RRG5ZZnZrWVFTVTlyby9VZXYvZXZrOXpuUDV5?=
 =?utf-8?B?S0NqRzdGZy9IN1ppS1JUaFM0aElJOEx3ZXRpWXl2c3RrMW5PVGRRWlBBeVM2?=
 =?utf-8?B?YmNERmxLRHh5aGYxNE5VSU9BdUViaWxEUUN6VlVkYkh5eHN2RjVybEsxOXIx?=
 =?utf-8?B?RDNYakFGbWN5RDNMWHVqNVRVNjcyWnFtanFzK1pBMWVVY0h6TjBmclZOR3ZR?=
 =?utf-8?B?Uk5NMW1veUJ0M21Eakhrb09OWHBzcGFCUUhtcE1JSFZXcmpJZDNCTUtKYUt2?=
 =?utf-8?B?Unl1elVPbnZqcURtamxTRkRyWFZOMTJHVU90V25XbjFETEMrU01RWGVkNGtk?=
 =?utf-8?B?WkxycThvekVlM3ZvUWorTDgrTy9BT29RZlFtcmpoR3pHcnF2c0tZd3RSc08y?=
 =?utf-8?B?WGpoS2cyVkREVHRaeWl3TTJYbUtpK2ZMbG9hWmdFMFh0VzR0RHJ0a2hJMEVD?=
 =?utf-8?B?Zm1DRTZPcjZQUGsrTDdVYUJoTDI4eTFySENiT0pHTEp6T3l3OStxbENmUjFo?=
 =?utf-8?B?dE5hVmxVc3hnN0dqTUx3cktzR1dqODFRSlI2WEdMakloekpzWFpodVEyRSt2?=
 =?utf-8?B?M01KS080Y2RHaUtoVnNZczlQaDJLMlFoMEF1a2NLNGRmMno5dnhjRTd2bGdI?=
 =?utf-8?B?em91bCtxaTF1cDUwWE9raUp5OFZtc1JYcVkrcTd3anhnb3JCcncrWUpEUjN5?=
 =?utf-8?B?SHdSc1FBemNJSTBmWmp0c2NSZVRTWjdjSTFSMUVIajdSdUFWUng1cXF1aEJ5?=
 =?utf-8?B?RXR4bEMwNU1yMFB5OFh4bmRpOS9RR0JtTURwOVE5U0tEMzFSejZaZlJabUpF?=
 =?utf-8?B?b1U0SHZoVWp2dm9IZVhoUmNVVWZBWFdwQVRXSFlyYkJ0MUNpRnVVUzg4QVpE?=
 =?utf-8?B?RzZFZjIzYk1CeUVnVVppTGthVjlVM0VnUDlwSGdLanFDaVVFSHFpcVFPV2Zv?=
 =?utf-8?B?OWZhY2diRjdMTDBqVXB4MnphVGQrR2wrNDlhKzBXR0tUOUVCcHIrUjBkUlJw?=
 =?utf-8?B?MmY3ZElCVjdNa2hWWWlIY3BaV09HbnlXWFRzUW1LTUNuTXNySWkvcEZnbU9P?=
 =?utf-8?B?bU0xTzJ6ekVhODYzVk13M1VqakhYSDZVRjM5NkovNFZGaTU2RGYwTitISmlr?=
 =?utf-8?B?K1NpT1RmVkZ6ZW5XN1Qva0Q2Z0phZkUyR1JBcUFhRWRzbzdTUEdpRDlzWmY4?=
 =?utf-8?Q?MEcxEBRTln3cc71KUOeAaGNXw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d5ca7d1-b0fd-495a-d3ae-08dbd9eb282d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 08:27:01.8942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4mKJWGfBKWH6xM0VAafnYYRvw7AhBJa7SIsHyBj+EMIafp6u7pMStkejPVso4vXcBxNN4cSWZRF6E/D3f/i/Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9103

On 31.10.2023 09:22, Nicola Vetrini wrote:
> On 2023-10-30 16:12, Jan Beulich wrote:
>> On 30.10.2023 10:11, Nicola Vetrini wrote:
>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> @@ -163,6 +163,15 @@ Therefore the absence of prior declarations is 
>>> safe."
>>>  -config=MC3R1.R8.4,reports+={safe, "first_area(any_loc(file(gcov)))"}
>>>  -doc_end
>>>
>>> +-doc_begin="Recognize the occurrence of current_stack_pointer as a 
>>> declaration."
>>> +-file_tag+={asm_defns, "^xen/arch/x86/include/asm/asm_defns\\.h$"}
>>> +-config=MC3R1.R8.4,declarations+={safe, 
>>> "loc(file(asm_defns))&&^current_stack_pointer$"}
>>> +-doc_end
>>> +
>>> +-doc_begin="asmlinkage is a marker to indicate that the function is 
>>> only used from asm modules."
>>> +-config=MC3R1.R8.4,declarations+={safe,"loc(text(^.*asmlinkage.*$, 
>>> -1..0))"}
>>> +-doc_end
>>
>> In the longer run asmlinkage will want using for functions used either 
>> way
>> between C and assembly (i.e. C->asm calls as well as asm->C ones). I'd 
>> like
>> to ask that the text please allow for that (e.g. s/from/to interface 
>> with/).
>>
>>> --- a/xen/arch/x86/hvm/svm/intr.c
>>> +++ b/xen/arch/x86/hvm/svm/intr.c
>>> @@ -123,7 +123,7 @@ static void svm_enable_intr_window(struct vcpu *v, 
>>> struct hvm_intack intack)
>>>          vmcb, general1_intercepts | GENERAL1_INTERCEPT_VINTR);
>>>  }
>>>
>>> -void svm_intr_assist(void)
>>> +asmlinkage void svm_intr_assist(void)
>>
>> Nit (here and below): Attributes, unless impossible for some specific
>> reason, should always go between type and identifier. Not all our code
>> is conforming to that, but I think a majority is, and hence you should
>> be able to find ample examples (taking e.g. __init).
>>
>>> --- a/xen/include/xen/compiler.h
>>> +++ b/xen/include/xen/compiler.h
>>> @@ -159,6 +159,9 @@
>>>  # define ASM_FLAG_OUT(yes, no) no
>>>  #endif
>>>
>>> +/* Mark a function or variable as used only from asm */
>>> +#define asmlinkage
>>
>> I appreciate this being an immediately "natural" place, but considering
>> what we know from Linux I think we ought to allow for arch overrides 
>> here
>> right away. For that I'm afraid compiler.h isn't best; it may still be
>> okay as long as at least an #ifndef is put around it. Imo, however, 
>> this
>> ought to go into xen/linkage.h, as is being introduced by "common:
>> assembly entry point type/size annotations". It's somewhat a shame that
>> this and the rest of that series has missed 4.18 ...
> 
> An #ifndef around what, exactly?

The #define. That way at least an arch's config.h can override it.

> Anyway, making (part of) this series 
> wait for approval
> until the other has been accepted into 4.19 (for which I have no 
> specific timeframe)
> does not seem that desirable to me.

It's not ideal, but you or anyone else are free to help that other work
make progress.

Jan

