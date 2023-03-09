Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 754ED6B2085
	for <lists+xen-devel@lfdr.de>; Thu,  9 Mar 2023 10:47:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508211.782632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paCr4-0000Jo-TM; Thu, 09 Mar 2023 09:46:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508211.782632; Thu, 09 Mar 2023 09:46:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paCr4-0000Fu-Ps; Thu, 09 Mar 2023 09:46:34 +0000
Received: by outflank-mailman (input) for mailman id 508211;
 Thu, 09 Mar 2023 09:46:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wtzB=7B=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1paCr3-0000Fo-18
 for xen-devel@lists.xenproject.org; Thu, 09 Mar 2023 09:46:33 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7d00::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 448c6979-be5f-11ed-956e-85ef70e17bfa;
 Thu, 09 Mar 2023 10:46:30 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8420.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Thu, 9 Mar
 2023 09:46:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 09:46:24 +0000
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
X-Inumbo-ID: 448c6979-be5f-11ed-956e-85ef70e17bfa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RKqr9EP25H3yR5iEJd7+e8mZUxNNSF7Vnm8aw5l/iZ49noKJy8fRZHMl5nBxMO4XMwj5bsGRYsdnEEKqo5pnZGehUZk0S0wgQ/5sqOz09xp+MkmxIbWe1Y7v8qVQoMlsyIkIx3nOsKnndx3Ncdl+K/QGpFMEEQm2Ni1SZfjCdjIDbdhMivVmsLYEkJnMkni4HUFSrM7OmhlepKVI0paExij+vHqUYnADMKEUFS5iNAmzz410C81pMHxPliRrm2tIMh2MJsQBK0cvbl1Pb3ZHBD2VG1Tg8/zrVyrhT32/NGwIMYOieK1U6AKGgbR73bynPMMLekVrtR0JiCgyDfCKSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DyjlJUEAqbxwjICjXleh+ZXpoM0HbQSIcxRcZhQSyfI=;
 b=mEwC/24iey/4OHDEV0E8nEP03o9DqONdzgVJMB5FlakGLQsuR0OwzSBECiVT9vyNzqxz2o+A+APJTLSducE7YgxJD7NyzuOpxn+wroZbzOIXQc3s24TWlJ9nysJUBfcB/J+r5gdUi2Zsx25i15YerBxYsgRdzqEqh8K0bcmNUWGVl1AanhPbtvt+sWaOAPZkZ0fFo5zrqIPDPoABv6g9B94acXzyMHyqxJl/ZtOQRzIjCjfNfIgIGFSyb8kDUaLqPjRZdyTiUtgyLa+f3lbw7fPOIkkVXP9aFEiM5aGwJTerHTi3vIaKWupFzFjnAXaQPGwXSH7HhO9Jm9Atf/nZpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DyjlJUEAqbxwjICjXleh+ZXpoM0HbQSIcxRcZhQSyfI=;
 b=dAws9VG41mf2NYCXleLXDUPP6P2CVyQhTErpAkWuUWpfH5SiH1zPYUSjzU8uZZ3R31xIPUYTPy3vPcTUdlekFDL5/Cz8ZFEv+vaROfxmcbbDf/MmofT9nGtAHUsKmpGQ8IIAy+dstky764I6Q8ev5KZe3qzD27D8q8Wat3CXFsx5cUPXRXZYHPffZkqeje9ewDyaYRHrzZ5ecJtyjglOcnTfM50N+Ql+Av8X9cW3btjuzmCjIKxmDNmkvF78ZMVFPuXEU5Bkegn+KxpnIK0ECbF2cn/MnTHstYQJ5fAbtszL6J9+/ct2yM4TpGyhJpTT8fR3bMvvSIALLl8Ik8e5oA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e724aac7-1ea0-0d71-c0da-5c01e37f864c@suse.com>
Date: Thu, 9 Mar 2023 10:46:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 2/3] xen/riscv: setup initial pagetables
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1677250203.git.oleksii.kurochko@gmail.com>
 <83444f8f90cf2adf431762d919ba958a25ff8ce4.1677250203.git.oleksii.kurochko@gmail.com>
 <52072f1b-0cf8-a218-eefc-a8c1b4cecf43@xen.org>
 <e2a1968767e7a0f1535920ada14ec2f323e0f9c5.camel@gmail.com>
 <b8dd2333-5f3b-10ea-7ddd-47bd5f84ca5f@xen.org>
 <94f5059a4e31ddd29141fa8fe5156b560575ab1e.camel@gmail.com>
 <9e6a76f1-73c6-9a6e-3444-f3e1cb2d71dc@suse.com>
 <70c292e708708463ed83ebaf562d51179e9f7f99.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <70c292e708708463ed83ebaf562d51179e9f7f99.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8420:EE_
X-MS-Office365-Filtering-Correlation-Id: 38f49a76-1b3a-4637-89e6-08db20832521
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jJSFe76F6P5qoxv1ZFPteMBQPcQ8OXET0to7ifB1j5lNcR8x1W7uHNQbB4drrAGulpUhZytPo0UkGSLlGFusVLh8Gn1+taTWKNkCPLmYjRUXcHROd/MKcYVtwbzvYmyh7s/4nJYtQp+QIyMOpRCnX0ccbs1c3KDCpJIKaz6esMgwK80HFS2Xk1c0s/0aNYOfSV9sSN5rITZkWfsQiL7wAGpWET25X9qV1hmENqorrpQu5oK2ooDjv/xNBKYarwwInVzjWFaTI/L8qGI6u2PscwLpu2S3qv4XSRhnsiX5Jv9DO79nrbcjgvZOTxFKXU1yyD5/+sWVw4bykwn3UWHAPfvp8xxkln0LR9eacgM2QREL6gQBitezgV8Q5v+cm3a9xUrG31oSyRYN/w05PUxDfK/gNMUatve6vCMOU4srbrs0WhzTdS0xAGofZZNi8H1TrI8IKC2YCjG1gXjj3zars+ZBK/iHWnzOITksl+n1MBmqnlO8FZRhhJUT9DaVetCOHoHiyBPy3nNhF8kxMHbiVJ6NSyfZVBUQ29M8ZlndkQEnznosAWOIGHZMfggJAx7JNQ7FhOmQB5VbczUHLAybBoQUP/15iCTRcZED6hNOZCqLvOO8meQ5ayrttGz5ACrW5ODVpasZRwDcab7GhR6Si9qdgD1sDDuvAEjomGK6SZVZS8RZaAdaILtgUx/u95VH8fH782OszZfbKE4UM14IJHEoAxdtICnRNwG75MKZaNY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(366004)(396003)(376002)(346002)(136003)(451199018)(31686004)(316002)(54906003)(36756003)(86362001)(38100700002)(31696002)(26005)(6506007)(53546011)(6512007)(83380400001)(6666004)(186003)(2616005)(8936002)(5660300002)(6486002)(478600001)(41300700001)(2906002)(66946007)(6916009)(66556008)(8676002)(4326008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjJURVBMM0ZPMkVXTGlvenZMN1FyU2k4Z2VNRzB6S0lTd2lGUEpLOXkwOVE0?=
 =?utf-8?B?a0JEdm9peXBhTS9Wd3VYSWxJNnBRcTU5aE1MbTdkSWJXKzA3TDFLWEdpdUFy?=
 =?utf-8?B?eHJNU2t4bUhKZGZaVnN3b2VTWFZiampxNXE5MGtjcU5QOTZvV1kzTjE3bkk3?=
 =?utf-8?B?RDZ2S0dFM2NQaHdHR2FKbUN2Nm9NUHloZ3lhSlFLVHF2NSsxM0hrM0RNWUdD?=
 =?utf-8?B?bXp3U0RLb1NVMDhvVWdJeTZ3Q0tobGlqZWZvUXh4aVRUYmQ4bzMzM0pxTitN?=
 =?utf-8?B?VGwxKy95amFzWE4yZElsbFdMeG1vRE1La3FwUkE1V2Z3Q1NjVm5DRXIvOUhq?=
 =?utf-8?B?bEtRYUxJUVBXNUl2TjZDaWNRR0g5eWhyS1ZnbWN3OWNnYmdqSTlxYThTRVIw?=
 =?utf-8?B?aXRuWDlsRHo1ZDNEVGlXSXVOT3BlS0FSdVhnR1R1NllCZENtb3F1RHRzSnFo?=
 =?utf-8?B?RU8yVjVDWlFmRGZ4cWtyNllYRWRqMVNaNDZJZ2JrMGRsbldsUFV1ZHZRSytl?=
 =?utf-8?B?UkUzRmEvblo4Ymt4c2NFendPNkd3aFFNdE9qZ2d6RC9zT3ZIcUMwSlZPMjFn?=
 =?utf-8?B?bDd2blJMWXZWN1NtKy9VdXh3WGZpeDAveisxcHhoWEI3MmQ2bXlITk4rV3Zu?=
 =?utf-8?B?RjdicU1kZUtWbTBTNTZwd2twWVNOdTBRbW4xZUlVa2h0YmlVNHY0NzV5b05B?=
 =?utf-8?B?VUVKRGR3TTBPZm5oWDM4bmozYWY1amlublEvRmI0d3hndU52TlVNVUUxVmNj?=
 =?utf-8?B?R09xeXUvVmFER2ZXVzJBYmNDb1kzbDRlZ0hWRUVySXE0YnVHTnIwVTRYN1Aw?=
 =?utf-8?B?Vis4SkpSNGpwWkVDN1hIK3o0WW1kOXJkcFI3RFBTVkNJWnY3Qmo3Sis3WXRs?=
 =?utf-8?B?bENtbTdsTGVDc0JlSjhRQWNMbjFPeEpOQWwwUFBHSEdHV3AxWTFCOVNHZlJC?=
 =?utf-8?B?c3ViYm9xdm9NZXJvZjBObGFGQ0xETmptMUFjNDhGUXRGaHNjVUJMbmRnb2Jj?=
 =?utf-8?B?VjZaWjNPVHAvTXpKalVKTXhjM3dtWGVLYWRqdUg3alkxUk5sZ2xjNXY5SjVv?=
 =?utf-8?B?NVFrWFdqVVptSlZ2bm55NnVBbmpYRk0wRWJQN0lNeWRKU0x4MUpJWnlETmxw?=
 =?utf-8?B?aWh3NzY0cEdLcGRrZ2JNclVmNjJiaS9raVNHZWNXRVkySGVKZFhLemt4Y0oz?=
 =?utf-8?B?SUtnRVlsNEJSV2UydllJdEJZSkZJM3cvNUNsMm1VazBHUXdqVkt0bk5TRUFF?=
 =?utf-8?B?Tlo0bW1OeTQvL3dGL3MrMnUrYmtqQXNlS29IVi9qR1l5b2F0eDlnRXdUM1dn?=
 =?utf-8?B?YW9IdERzVVBFY0lVZm9qaS9BTzVXQmkraFgwcjRkNVB3OGk1aFAwYkU0bDhy?=
 =?utf-8?B?OEgzYjlILzAwSVdCTU9TVGdWU0o5d1VCY0lxUE5nY01sdDhQK3dRQUI2U2M4?=
 =?utf-8?B?cmZVRkFYUHFhRVA3MDlXUzhJRTArQ0xzczVialk5UURpNzA0Y2pkdUNuTCtW?=
 =?utf-8?B?c0NWMTBrdm1vb1lBWDdhYVRvTEpQUkhFQllJQzJMQUVnVjVaczZORGc2WTV6?=
 =?utf-8?B?NzJBNE16V1d0QWZPL1ZDY1RHa2h6cTgzRzc1TldCdVhiLzZlTjBlVUwxczZu?=
 =?utf-8?B?eTJRL1RlMXE2ZVZzQmMrN3k1WHNoSGhlR0tkNDZMMEllR2JqZlV6WnJKZW9Y?=
 =?utf-8?B?TnZqRG01dGFRSFhTUXI3OWdJTktXeFUwVWdXa3VsM2NKd1F2a1JRWlpKOUFM?=
 =?utf-8?B?b29XZkVkanpHNDViU096Unpva0VSU0tUd0t4dzQ5MTl5ZjQwaFVyYWpNWU9R?=
 =?utf-8?B?elR1cFhrdTgwZFhKOXAySEQ1b1VXS1RTVHIvMy9NOVhVSXZZeFg1UG9hMUFy?=
 =?utf-8?B?S0x6aUxKVDNUbzBxZGFFVW1SMjB1OVgxNGtPUlBRSDJaZ0toMGg5bmg0ZEZY?=
 =?utf-8?B?M0Z4MzJwbjMvdytJZHlWcEk4Q3Jha09ORU9yeEswejNDL1NKMERaNHJxQ2JB?=
 =?utf-8?B?Y2o0UlhHQXdXSjgzUGNiVk5sZmdwZUtqWDBaV29laHd0b29tKzJoZTFCdUoz?=
 =?utf-8?B?SDBZNVpIc0VTSCtZUmZiN0RFQ0VzRnZmUkpTdENkdm43YnM2Y0RiSWRHNWZv?=
 =?utf-8?Q?LD43nDamNjmz1jJVEl2jaDHNg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38f49a76-1b3a-4637-89e6-08db20832521
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 09:46:24.8034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HJcc3nHZWo3BThL4LI9pl7ja//uTntp0TdOZkaHxEPpE20DnfDSnae0QJo9zyYnd6V0ZuUQJvp6OrdXLGmEXKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8420

On 08.03.2023 17:16, Oleksii wrote:
> On Wed, 2023-03-08 at 16:17 +0100, Jan Beulich wrote:
>> On 08.03.2023 15:54, Oleksii wrote:
>>> Actually after my latest experiments it looks that we don't need to
>>> calculate that things at all because for RISC-V it is  used
>>> everywhere
>>> PC-relative access.
>>> Thereby it doesn't matter what is an address where Xen was loaded
>>> and
>>> linker address.
>>> Right now I found only to cases which aren't PC-relative.
>>> Please look at the patch below:
>>> diff --git a/xen/arch/riscv/include/asm/config.h
>>> b/xen/arch/riscv/include/asm/config.h
>>> index 763a922a04..e1ba613d81 100644
>>> --- a/xen/arch/riscv/include/asm/config.h
>>> +++ b/xen/arch/riscv/include/asm/config.h
>>> @@ -39,7 +39,7 @@
>>>    name:
>>>  #endif
>>>  
>>> -#define XEN_VIRT_START  _AT(UL, 0x80200000)
>>> +#define XEN_VIRT_START  _AT(UL, 0x00200000)
>>
>> I think this wants to remain the address where Xen actually runs, and
>> where Xen is linked to. This ...
>>
>>> --- a/xen/arch/riscv/traps.c
>>> +++ b/xen/arch/riscv/traps.c
>>> @@ -123,8 +123,14 @@ int do_bug_frame(const struct cpu_user_regs
>>> *regs,
>>> vaddr_t pc)
>>>      const char *filename, *predicate;
>>>      int lineno;
>>>  
>>> -    static const struct bug_frame* bug_frames[] = {
>>> -        &__start_bug_frames[0],
>>> +    /*
>>> +     * force fill bug_frames array using auipc/addi instructions
>>> to
>>> +     * make addresses in bug_frames PC-relative.
>>> +    */
>>> +    const struct bug_frame * force = (const struct bug_frame *)
>>> &__start_bug_frames[0];
>>> +
>>> +    const struct bug_frame* bug_frames[] = {
>>> +        force,
>>>          &__stop_bug_frames_0[0],
>>>          &__stop_bug_frames_1[0],
>>>          &__stop_bug_frames_2[0],
>>
>> ... array would better be static anyway, and ...
>>
>>> The changes related to <asm/config.h> are  only to make linker_addr
>>> !=
>>> load_address. So:
>>> 1. The first issue with cpu0_boot_stack in the head.S file. When we
>>> do:
>>>       la      sp, cpu0_boot_stack
>>>    Pseudo-instruction la will be transformed to auipc/addi OR
>>> auipc/l{w|d}.
>>>    It depends on an option: nopic, pic. [1]
>>>    
>>>    So the solution can be the following:
>>>    * As it is done in the patch: add to the start of head.S
>>> ".option  
>>> nopic"
>>>    * Change la to lla thereby it will be always generated
>>> "auipc/addi"
>>> to get an address of variable.
>>>
>>> 2. The second issue is with the code in do_bug_frame() with
>>> bug_frames
>>> array:
>>>    const struct bug_frame* bug_frames[] = {
>>>         &__start_bug_frames[0],
>>>         &__stop_bug_frames_0[0],
>>>         &__stop_bug_frames_1[0],
>>>         &__stop_bug_frames_2[0],
>>>         &__stop_bug_frames_3[0],
>>>     };
>>>   In this case &{start,stop}bug_frames{,{0-3}} will be changed
>>> to     
>>> linker address. In case of when load_addr is 0x80200000 and
>>> linker_addr
>>> is 0x00200000 then &{start,stop}bug_frames{,{0-3}} will be equal to
>>> 0x00200000 + X.
>>
>> ... this "solution" to a problem you introduce by wrongly modifying
>> the linked address would then need applying to any other similar code
>> pattern found in Xen. Which is (I hope obviously) not a viable route.
>> Instead code running before address translation is enable needs to be
>> extra careful in what code and data items it accesses, and how.
>>
> I modified the linked address only for the experiment ( when load_addr
> != linker_addr to emulate situation Julien told me about), so it's not
> something I planned to send as a part of the final patch, and I
> probably forgot to mention that in my previous mail.
> 
> It is only one place where we have to do a kind of 'force' and is
> needed to make the current state of RISC-V Xen work in case we don't
> have MMU enabled yet and linker_addr != load_addr. All other cases
> where it is used something from the range (linker_start, linker_end)
> will be managed by MMU.
> 
> If we can't use mentioned above solution, we still need to handle the
> situation when linker_addr != load_addr and MMU isn't enabled yet.
> Other options to do that:
> 1. add phys_offset ( | load_addr - linker_addr | ) everywhere where
> bug_frames array is used: bug_frames[id] + phys_offset

Well, that again special cases a certain data structure. As said before,
you need to be very careful with any C code involved before translation
is enabled. Unless you want to retain relocations (so you can "move"
from load-time to link time addresses alongside enabling translation,
like we do on x86 in xen.efi), you want to constrain code paths as much
as possible. One approach is to move enabling of translation to early
assembly code (like we do on x86 for xen.gz). The other is to amend
involved code paths with something like what you say above.

> 2. Check somewhere at the start if linker_addr != load_addr, then throw
> an error and panic().

That's not really an option if the boot loader isn't required to place
the image at its linked address (which would be odd if translation
isn't expected to be enabled yet at that point). Plus no matter what
linked address you choose, I guess there may be systems where that
address range simply isn't (fully) populated with RAM.

> Other options might exist. So I would appreciate it if you could
> suggest me some.
> 
> Could you let me know if any options are suitable for handling a case
> when linker_addr?

Main question is how tied you are to doing this in C. x86 and both
Arm flavors do it in assembly, with - as said - the exception of
x86's xen.efi where instead we retain (or generate) and process base
relocations (see efi_arch_relocate_image(), called by
efi_arch_post_exit_boot() immediately before switching to the "real"
page tables).

Jan

