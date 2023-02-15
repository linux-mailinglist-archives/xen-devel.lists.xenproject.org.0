Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF81697D8D
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 14:37:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495990.766477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSHxP-0004dH-2Q; Wed, 15 Feb 2023 13:36:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495990.766477; Wed, 15 Feb 2023 13:36:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSHxO-0004ad-Vd; Wed, 15 Feb 2023 13:36:22 +0000
Received: by outflank-mailman (input) for mailman id 495990;
 Wed, 15 Feb 2023 13:36:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7OvG=6L=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pSHxN-0004aW-F5
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 13:36:21 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062c.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7dead5c-ad35-11ed-933c-83870f6b2ba8;
 Wed, 15 Feb 2023 14:36:15 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8593.eurprd04.prod.outlook.com (2603:10a6:20b:424::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 13:36:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 13:36:12 +0000
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
X-Inumbo-ID: b7dead5c-ad35-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bs8g873QF2R1b9J1euu4c9hQFMEvwpKXhYw2YlQliZc9yihJbdFgERkoeNc4bnPVycekNgBUPg/GnRsgF+nqmGeY88SSWasB8wfcs6ORuIkqAmHT87/CNgV77oxvIvChwp+RSFylkOaFz26XqkmfBRbfxY3VOT0wO6l7d/nGuGzBX32OUFbFNER9ZWi7vClXt612qBLohUoYH1zf33ZxvM9Owa1H8mWg5XlxiAFT6JicVNDPiaFnUFUyPJfkn0/Iq/LfPk645tEw4o119XEWYcyHmV4nppe6SMCw2buK2+ylX+ye7crOIdQmmcpl/7K9OJH/gPC1CEWn2UL7MndDdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+KlP5qA89mRT2c22KFwY0e6UaOKuHAXpVAQZI0PIhA=;
 b=hizrpCi/GC+8cA1sRtwwqa7G/BJK3j/1jAanNQinX5G3QwMUwZbAExHu9y+APg+28LNrQ/yqCOYTMSar/ucA9LN1KGXg0QZ4JB4kFpfJTlZIRtxseRUbgXnlXORD0SANf92A1WGPo5Uv5Bfnw4BhAEvHXmltT2b496oHh3D4TxxPiLUZifad8OJeUeK+n8v5RVFomvG0q1/Rz3VlZHi5ZSXQ17jxQR+N3W3CN1XvDbIdu4ctEVYI9ZAtWjJu27x6ZPO+PqXL3YbOU/GimWxKebAUChmD4NqO2YDg1jq9twxNeGBbX0TnPE+AySMftIi3dO3hp164GWjspp5URqDO1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+KlP5qA89mRT2c22KFwY0e6UaOKuHAXpVAQZI0PIhA=;
 b=yuvnkVDVQdEaffXBDwDbsFp0CYCtgfCAeMYetGvw64wdKddtvBSaqRMgaqHANkhxmLwP+2BZgyOmK3f0bSfnxU23OmSGldCLgDtzYjDqDegeZnnn4u/5EzY5ElmKtI12mTIbKXSf+qk0MUOtrKO5frn8YgLPijdEVp4IWBvGVwxGAyQc/R4Y+OD12cWIWs/ubragbEhJgYRkUxSaZ/Uuj+e/rqI9S480VVb+5KwxUN43rd9GDRN5f62rI9Gelgt7N8Bs1I5Tdv84qtRS47a/+4k68PokvVkg8DKBGCiR4sfI25IFuZk1FXS8T0uhUi74zlc8xc4EL2yhsL2aD01FjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ae6aaf10-baa2-673f-50ab-4b85994eec48@suse.com>
Date: Wed, 15 Feb 2023 14:36:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] x86/Xen: tidy xen-head.S
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 the arch/x86 maintainers <x86@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>
References: <afb02f3e-3d69-07ca-c3ec-5bbeeceb5e55@suse.com>
 <28bd8aec-cd41-7b5c-0f32-12c79595134d@suse.com>
 <7b0ddd99-4093-b72d-ba5c-ea145c0bf2f4@suse.com>
 <6abdc32d-5a18-20dc-a300-754f2b164fb7@suse.com>
 <6b0b2163-a8fd-4eaa-2219-972c02aa6e49@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6b0b2163-a8fd-4eaa-2219-972c02aa6e49@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0133.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8593:EE_
X-MS-Office365-Filtering-Correlation-Id: a210d681-ce04-42f6-4668-08db0f599a89
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7VjvBdKiNlLZKRKibSN+y8NDlOCcsX2KxvEppGXvnzLJcPvdbtKDEittNrYOxMp5WHA4ziutPavKHxE8Uz+U38cYnijZ6gMD3rxXEQ5moxJbqOSQBMq6Ue139D0k9G0Bx8fAX+5xzVcdwURPHu6F0+UCRVKEutqJ7K7lBR1pMI7kGltNfbT1fQ5WxYz/SJycJCMuexsTVLY1MQvDmE2E1uIC/L1VrcbxvRRHzpzd6z9gas0Fxp4opKedGCCQLWP3kU3ds3E0NKm0OSgEn1kgzpJVENwKDfPhsKgoYyLJQS0QNf/KfJsDlNiqpBMRfyejitsvREeUTkS8DMuUydahZdvD8UTIZ76qI/KkUkkOY7vI2Dn2MWorrK70Jrtn5z/rHq4f2XQzoB3hZZyD2jckmssMdVIvbvCF+w67pn/BIMtlWIX5Tk8aTD/bDnbOvdCYjXpPU6oRGoddLPdh2rTmWl+V8D2/VnCBDAgtXWDYTmuZ6GUOFFF78XO5uzKCWit8lkWM3HxXVaf9TN/7fgivM5q2R5f7FP8YNTX+3yQL2hzoMuQ5fSWcBTrrFBpQ7x8TRLZQ4mD2WTu/AZLrzZYw3D+ecclFWB+G66pU4cKkNd4UQ0vDLMso128NDrIZ/6SqQpHps6jB1lVZhGE/8rkzFo7i8bbokVDsgqGWdLCGlZ5DnikJ1zFjYJWy7UMDR+wOpQMRDZoIbVSlu8R4sa84WnptHCmuU5N6Wmr8HRUv8rw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(136003)(346002)(366004)(39860400002)(376002)(451199018)(31686004)(36756003)(38100700002)(86362001)(6486002)(83380400001)(2616005)(53546011)(6512007)(31696002)(6506007)(107886003)(186003)(478600001)(26005)(66946007)(66476007)(66556008)(8676002)(4326008)(316002)(54906003)(5660300002)(2906002)(6916009)(41300700001)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RS9vVlBOdTdRTkM3OFYyTTQ2NjJPc3NEcVlIcmpBWVhzeDY3Yldld2ZSL21C?=
 =?utf-8?B?RURMQnVVMi9zZjUrNmF4czBzektaV0U0a1QzaTlyQWpMS1Y1L001MjlaRTRM?=
 =?utf-8?B?RENhTkVxb1cydE5MZW45U09INFkzZWYrc1hRL3BCTFNnbmJZT2FTZ0cxZ3Nj?=
 =?utf-8?B?bWNLM1Aza2JXU3ErZTRXU0dud3h5ZE8vNmxLRjVXeTMzclNhd3NTbDgwdHFq?=
 =?utf-8?B?UWhTZUJjQjl5Mk8zZTg0T2wrdFdYcHRSRW1za2szaStXMFpUQjJMNnJhL2Ns?=
 =?utf-8?B?YkNWQVlhU2N4QXBFUGQvSkZtNFFPRFIzM1YrTThEQ3NXM1pnbXZaK0IxRE1I?=
 =?utf-8?B?cEh6M0c4UWpSMEtZTGxKRnY0ZVFDaG55amhoZmVmSm05WUFoSlVrQVN2VnAw?=
 =?utf-8?B?aXNNWjhPcnNxcHNXM0xmTE1HdDg3d3FqaEdEUXZPamxONjQrVVQ1V3dFbGtU?=
 =?utf-8?B?VHY4WWpKdklTcW1ManJiRkx1TjZpa0J4L1hTT3YrRjVSdU9lRVEzVUFvUnhI?=
 =?utf-8?B?cjNlVlIzLzdKTGs4S3VSNzdKMTlmSmp2cHZwYkFBSFp4K2ZpdkExak5mQ1pz?=
 =?utf-8?B?TkwzazFMRUM0RG5BNnljWTkwRTJhUkJmNGtVdFl5blQ2UmlyYXUzcXorUElt?=
 =?utf-8?B?bTVWQTNCWiswbUNOOEFnR252cFViOVJzcjEraDBMSHRPWE55VVROV0REL09q?=
 =?utf-8?B?RmQ4NE95QXd6MHI3VlNlYitGdnd2Q3UwSG5weUE1UzBRTFRzSC9ZYXVzR0Zw?=
 =?utf-8?B?NlZSOVlmUHpoc0pHK1FOV2dFdEFBT2lYV2g1M1ZaUFVGZ0NnVFhJMUhrVEIw?=
 =?utf-8?B?dWtyQ0Q2WlMvN1BzbkRra3EzZGFkVFJRaGhkWVNuZ3RYaUlyTG00YlIrVGpu?=
 =?utf-8?B?K0dka1dIcHRoSGtXSG1KMTM3S3UvSDdwVEs2amlTRGJUa0ozYnNLRm5sZlRL?=
 =?utf-8?B?ZlEyUmdWRERxWk53YkVWT1oyaEtaSWlVckdYUEFMV0E4QkRyZlRORFBadVZY?=
 =?utf-8?B?clpTYkNBZDlPNU16d3BmN0IvU1k3bkdDL3BjeGsxZVZZNzFiSThueVZVeWkz?=
 =?utf-8?B?WEpIWldVUG12VnlxNFJ0QTMxc3hOdHFFdVVrVVRXVWJkRndzYWptRGlGUitZ?=
 =?utf-8?B?aWFjcDUrUFFBcFQ5Tkg4TCtnblNnL1hYNnp6di9VRFZWUDRBZlIxUVdiRFZl?=
 =?utf-8?B?Y1pGU3hPenlldXBXVjNLZUc1REZocW4vdzhjdGxPYkhLcnREb1Z3SU1zNzRv?=
 =?utf-8?B?YkhvNHFTS3hpZHAvYWo3dk14LzI2SlREelZaQmcyUG1TRDEwNDMvNjd5YVZk?=
 =?utf-8?B?VjhBMzJMMnZ2S0J0ZnpyNnRTbUJPVmdqZkw0b092M1dzOWtGZ2J3V0lIekIr?=
 =?utf-8?B?REJpWFJzZlJ3TzlEakpBNEhwYVNrL2dLQXhnQ3VJT3Y5cEFyRXRTTExXY3Ax?=
 =?utf-8?B?WE52Nk9iSWxHTEZXcW9uVXBSL1NncW9lVVlrNzNmb0hJbStzTklMdVQ2VXVI?=
 =?utf-8?B?ZGI0S2NQQU94NEdjN08vK2ZwRWRHcHJuMGM5Z3hGbjlvc00zVThzSFdvMkdJ?=
 =?utf-8?B?WEtseTBSZk91d1owdHdCb0RFZHNQZENodkhTYTVxdC9odFlxcFpWNU9qOW1l?=
 =?utf-8?B?R1dQUkRsZ0JjajQrcGZ3SmRseFRCQmJHY1NaTUpJQnBtdDM5cW5kb2Y1MGNO?=
 =?utf-8?B?WUJRVklwRU81L2VRalAyTlNXQ2VZTk5iSUg2T0g4U0dSUitIdzgvbk1xTkxt?=
 =?utf-8?B?T3lsSjVxa3l6MnY5RWRaTEpCS056UjhoU3VxdlppWWczRXRJMlJHcG5vT0RN?=
 =?utf-8?B?Z1IxZlRCSU1FZERQYlkwZE94T1V0QUlaN1FadDlOdDFsSFFOT2dXVjRFaU4x?=
 =?utf-8?B?MjFJS0ZkMUtnaEEyWE9FczVzNDZlMEhIRmEvSHFMOGtzSVFlZVZwR3FjUm1o?=
 =?utf-8?B?RFRDMHoyeUxWNkJuSWphcHhvOEhIT2xkUnpFY0pZNFhXNnQ2NEVqV2hNVktY?=
 =?utf-8?B?dUVXWG9sTml0b3RqUmlFdjdGeWFRUVI1TW12WldEaVd2bFUrbG9FODM4NktI?=
 =?utf-8?B?SGNBMUlQRG5UL2pXMzB4aXRrZGRVU1VMR2lZdjhsNTFKcDN1MEwwbUtEY1g1?=
 =?utf-8?Q?sNTDKEf6hTwMq1zjj/Zp8YVyC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a210d681-ce04-42f6-4668-08db0f599a89
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 13:36:12.5531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ex1ACWwI4yQn0wqvD0W2TcEf963iXl8O1rOyXca68TVwiplqIkO+aBC6U+Pj5JEtl/HCA6WWyhDojcVrOBSug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8593

On 15.02.2023 14:25, Andrew Cooper wrote:
> On 15/02/2023 1:12 pm, Juergen Gross wrote:
>> On 15.02.23 13:42, Jan Beulich wrote:
>>> On 15.02.2023 13:05, Juergen Gross wrote:
>>>> On 15.02.23 12:33, Jan Beulich wrote:
>>>>> -#endif
>>>>>    #ifdef CONFIG_XEN_PV
>>>>>        ELFNOTE(Xen, XEN_ELFNOTE_ENTRY,          _ASM_PTR startup_xen)
>>>>> +    ELFNOTE(Xen, XEN_ELFNOTE_FEATURES,       .ascii
>>>>> "!writable_page_tables")
>>>>> +    ELFNOTE(Xen, XEN_ELFNOTE_PAE_MODE,       .asciz "yes")
>>>>> +    ELFNOTE(Xen, XEN_ELFNOTE_L1_MFN_VALID,
>>>>> +        .quad _PAGE_PRESENT; .quad _PAGE_PRESENT)
>>>>> +# define FEATURES_PV (1 << XENFEAT_writable_page_tables)
>>>>> +#else
>>>>> +# define FEATURES_PV 0
>>>>> +#endif
>>>>> +#ifdef CONFIG_XEN_PVH
>>>>> +# define FEATURES_PVH (1 << XENFEAT_linux_rsdp_unrestricted)
>>>>> +#else
>>>>> +# define FEATURES_PVH 0
>>>>> +#endif
>>>>> +#ifdef CONFIG_XEN_DOM0
>>>>> +# define FEATURES_DOM0 (1 << XENFEAT_dom0)
>>>>> +#else
>>>>> +# define FEATURES_DOM0 0
>>>>>    #endif
>>>>>        ELFNOTE(Xen, XEN_ELFNOTE_HYPERCALL_PAGE, _ASM_PTR
>>>>> hypercall_page)
>>>>> -    ELFNOTE(Xen, XEN_ELFNOTE_FEATURES,
>>>>> -        .ascii "!writable_page_tables|pae_pgdir_above_4gb")
>>>>>        ELFNOTE(Xen, XEN_ELFNOTE_SUPPORTED_FEATURES,
>>>>> -        .long (1 << XENFEAT_writable_page_tables) |       \
>>>>> -              (1 << XENFEAT_dom0) |                       \
>>>>> -              (1 << XENFEAT_linux_rsdp_unrestricted))
>>>>> -    ELFNOTE(Xen, XEN_ELFNOTE_PAE_MODE,       .asciz "yes")
>>>>> +        .long FEATURES_PV | FEATURES_PVH | FEATURES_DOM0)
>>>>>        ELFNOTE(Xen, XEN_ELFNOTE_LOADER,         .asciz "generic")
>>>>> -    ELFNOTE(Xen, XEN_ELFNOTE_L1_MFN_VALID,
>>>>> -        .quad _PAGE_PRESENT; .quad _PAGE_PRESENT)
>>>>>        ELFNOTE(Xen, XEN_ELFNOTE_SUSPEND_CANCEL, .long 1)
>>>>>        ELFNOTE(Xen, XEN_ELFNOTE_MOD_START_PFN,  .long 1)
>>>>>        ELFNOTE(Xen, XEN_ELFNOTE_HV_START_LOW,   _ASM_PTR
>>>>> __HYPERVISOR_VIRT_START)
>>>>
>>>> Are XEN_ELFNOTE_MOD_START_PFN and XEN_ELFNOTE_HV_START_LOW really
>>>> relevant
>>>> for the non-PV case? I don't think so (in theory
>>>> XEN_ELFNOTE_MOD_START_PFN
>>>> could be used, but the main reason for its introduction was PV
>>>> guests IIRC).
>>>
>>> I wasn't sufficiently certain for MOD_START_PFN, so I'd prefer to
>>> leave it
>>> untouched for now. HV_START_LOW might be 32-bit PV only really; I'll
>>> check
>>> and then maybe drop (or move).
>>
>> Fine with me.
> 
> HV_START_LOW is PV32 only.  It's the negotiation for the virtual address
> split with Xen, and was never implemented properly for PV64.

Not the least because there it would be the upper bound that could
be moved down, not the lower one that's movable upwards for PV32.
I suppose we'll get there once we have 5-level paging support and
can shrink the hole needed for 4-level PV guests.

> MOD_START_PFN is PV only.  It's not applicable for HVM/PVH.

It isn't right now, yes. I continue to be uncertain and would
prefer to leave it as is.

Jan

