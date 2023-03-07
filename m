Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 062216ADF67
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 14:00:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507362.780752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZWv9-0001C4-Fy; Tue, 07 Mar 2023 12:59:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507362.780752; Tue, 07 Mar 2023 12:59:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZWv9-0001AH-C5; Tue, 07 Mar 2023 12:59:59 +0000
Received: by outflank-mailman (input) for mailman id 507362;
 Tue, 07 Mar 2023 12:59:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4ndv=67=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pZWv8-0001AB-02
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 12:59:58 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20621.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5231f30-bce7-11ed-a550-8520e6686977;
 Tue, 07 Mar 2023 13:59:56 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7421.eurprd04.prod.outlook.com (2603:10a6:800:1b3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Tue, 7 Mar
 2023 12:59:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6156.028; Tue, 7 Mar 2023
 12:59:54 +0000
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
X-Inumbo-ID: f5231f30-bce7-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=juubP/Y/sD6tGGGY9Zgp0OglDeTppDmGGs51+y/e++xamogoLMyiYXhqUBW0zkgra6GuaWbS59XQ1nV/6Ff7hFv66xgA7fL4oBYH8kkcqKjE3QpITfzRQXgCWkCQhSlIeIYmUoKwzTSkqINVjTCKrBG6ZPNZQvJ1kkDmFXvCPcRrKBEmDZnfqaWJv7+85H7HEKERoOT7mhNO3EwFXjFMea/MorqEm5A7zh9nytoFiK34J74Oslz4+jRWzQEuiVRT8/PB+vNXRWe7yH9ZughUTDPbPKnqWn0nsqc50dlUtTMjq8PY5nrzh1ax6AASR1g3gMbFVn3+IY+ZI4UU5EMJhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TwF6sOp9E35LXOG1MmbNB8Hk+aAUK/sxyqHptmkkULU=;
 b=iNV9Uzxcy3ORMEVBpKSA50IVp9qvb4flJRx4ydPN8kCKaLphDAEcq5pssypNU191eDij30sxrJvDHHRtN121rWBBq9wOfqLTjJX7pjO1vyjM7ykFC4+Zj2I6UgSgIAPe+L5SSeTlwjTImXeXo5rM+uiq27EpYmwV73abAIliJsaI5LKQ9MpnbCaf5Q05Ead13IrDSA4eQqA32FvfHMKBGMj9Xv3srKi4j8o4YE+Gaim1FoZXJ3SSLmWU550cKdokggNMD4CqHRdnuPQXyYyxKw4BFwFziRG1GgbJDUvwoDuDjbMknnAIbJtR97Lb9kNeySPiC8K+RgncJ7BiskFwPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TwF6sOp9E35LXOG1MmbNB8Hk+aAUK/sxyqHptmkkULU=;
 b=pkg17BmsmfvkUy2qEl19ZbFY+K3NBvnSbBeZptuBG9yBbhVtAugS3lBSEnVUhms4OOF9oCHTVVHyBhdtSAn0ax/lKg6fuQFFHYKcYpcjIt+LGKvS0YqDVokKd3vZKO7ctuOpPHD9+TdUaONc2nxs7S30JrAb2Re4jXVDGd3vCcWllV2Y081JvNRYWAJG6HKNZmpC5W+FkVSApPhwkLnL8nExO4VS4bBG30lgHDihONaage4bk4qMKkXOVMJkElQCZfVs1PiLaBmBtsauCl3YplAfYEw4wSAICVUxMvdI+1IiWsQh/yPfC90KEWbR3zVf++R/bwWEe9/AVTI5TL2MJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9bb8c837-7aa4-ba75-99fc-5e4c079023b3@suse.com>
Date: Tue, 7 Mar 2023 13:59:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 4/4] xen/x86: switch x86 to use generic implemetation
 of bug.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1677839409.git.oleksii.kurochko@gmail.com>
 <4a478638449e66a76e1671db38ec29b9e3108201.1677839409.git.oleksii.kurochko@gmail.com>
 <8a7920d9-9622-195c-2706-2b435c2c856e@suse.com>
 <e91666a08b6cfc146123e18e634aacd979161b66.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e91666a08b6cfc146123e18e634aacd979161b66.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0160.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7421:EE_
X-MS-Office365-Filtering-Correlation-Id: 4376df90-14ee-4d62-4f39-08db1f0bd87a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dM8mr0VwJZroIMq/VTjygbsZV/dE60N41i14zLrID7wFvST+7lBcrTEFwcrPKQgW01v+Di/7Cz0jHL3RO2QZgjK3yFVNX6ozrPURBAfFdSJQ45Q8EZUrQPvyIeLFGn/3rBl7de0Cold4VfxtYPODG1DPEOvI45yk00E2KFGpjvdGZ2P3odFWQYIvbfdw6CPmhIc4jZoM2DNqPX8EzI4D5j+WCkry30ro0cJWzoG7PIubsRe2ml/QJRPhiOznBUyulZm39t/0TRuWJFfJsFLPmmIc7DX9jvQOVg/2LZU57VjPTXQ0vS4q3zeT4gmKayy5ipG5IeYAC/kNlLrYO8WCQ45rn1I+ZTidvFa3GXt2S7SudKdnAkpPXnssKqlE3uZyOqMzpO41QStHzXpW5OXazfdCRAYRmhc0mq6nranRlw2NqsMXg3LkBN1rwH9IjqdT7S3X+WkOqEDTs1nEpwgOOtb5w2hb5SkA9FXSisol9ngBgLul9JK1wgVvdPMijlpn8dOk31lKKXzRyZPRTzcCIz2lAYfDQhYUoJxI8KQ+XIf5Lxo6P/cjVFiwE5cx8SljqAtmfV8VRODEy+V9LaagjV6cuOfjONdoBFX6vHksER7Z98Zvxe2jYZlXISq0jxl3sBMkLXN1f+5dwECFNcJfuGYmFPI56t01q8DIB45bJINxl5udAXmAEQxH81ajN+yQfJcPClxPkh6ICtxGvXHkbhVA/RFzxYFywhP53KYXkUnQP8sRbzCtRRqRf16YR771
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(366004)(136003)(39860400002)(376002)(346002)(451199018)(186003)(2906002)(5660300002)(38100700002)(6916009)(8936002)(66946007)(8676002)(41300700001)(66476007)(4326008)(478600001)(66556008)(6512007)(26005)(2616005)(53546011)(6486002)(36756003)(54906003)(316002)(86362001)(31696002)(31686004)(6506007)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TSs3RUJ4cjhHdXJLSzFkVHRsVE1rVTAwTDZTeEI2MjQ2MWQyUE1meWl5MTJz?=
 =?utf-8?B?MjRLM1l5YXpCU2xsQ0d2RTVhTkh4YWUxOEtPckt0RXlBcExIYndBN3NYUGdC?=
 =?utf-8?B?MGdlQi9OdjF4b056TnVEUmRET055SVY3cHU5M3ZlTUl0V2dERFpnZ0dieno2?=
 =?utf-8?B?SUZIS3M3UVlxWStsUmt6aGFWYVZnamNBaG90cjBkaDdwSzlicGYwWGxDT0J2?=
 =?utf-8?B?RUpHMCtaOVpzR0dMaDdyVzAzR2FSOGVhOU9vRlBrcFZtcEhZdjh1M0wwVE1r?=
 =?utf-8?B?WXNvQjN2Vmdjbko5U3BNZHRyZ3AyUmtTcmo0Y1lBRlBVVmVyeFNydjZQeEhM?=
 =?utf-8?B?Zm5QUzFEbktIb1NNMEMwczdJd3pSUEJlSHRwcUFocmpBVGF6STM3eUxnZS9a?=
 =?utf-8?B?Z1dwTmFXOHVuL1lrZ2RBWE5LNFhJRkRjeXlMdHpPQTZkUHpuT2c5TlJRSVc3?=
 =?utf-8?B?N2ZRbndQZGJwWXF3WFZTODV0RXMvMXRtSjZuVVpNNktPNWNOc1JsUXRTSkJx?=
 =?utf-8?B?WkhHSHQwSnRhUzNlNFdFZFpOYnlScUFUS0pCWVM3RGJja2NaQXF3d2Q1MXRM?=
 =?utf-8?B?L1REQWI1di9hbFBOTjFIR0FZZ0lGNHE0OGhjZ0dLSFNLQ1Mwa24rV3pKdXlF?=
 =?utf-8?B?bEV3d3BxWm5zSnNsajVqRS84dWNGeEpheExQL1NiRjJIV084RkptRDhuU0FZ?=
 =?utf-8?B?UGpNOUVNeDlEdXFUMi9mZHE1NDAyQlBUTEdqK0xadHpKUGw1SU1SMGVNRWg4?=
 =?utf-8?B?TGFOcndmVWkzRzZkeHNDZE5jN2tjUzJrRysxTDlYSllpdG9tZGxmQWd0SzFl?=
 =?utf-8?B?bVM3UU9LSDBKcFYvUUFHcnVxdGx1djJyZ09hTTdzZUc4RkdCWXFzMzFnZnFH?=
 =?utf-8?B?Sy9VYnZXbnpPWExYSEJaanJ1VFRNNXhmanFycXBBYmlJQzhPeUsya01jSncr?=
 =?utf-8?B?Q3F6RlpCalNhOTh4QTZFM3RrdHk3QmRrZmFvVytyWTlkMVhXdjd3R3RYNjFq?=
 =?utf-8?B?YUZ1OHhaa1Nja3F0QVpVMHY3M2QvSEVqdjNFRTBuZ0Rxa29zcUVSdGx6MnJK?=
 =?utf-8?B?azRZSld4bklVM0luL0xteGR4dk9lSWFnSFZZa3NBZFlwaHhZVjZwUFpqYVNy?=
 =?utf-8?B?a0NML1F6T3VKcUp1L2hOSVhGbEI3amUzNWVTb1NMZmw5YWdFeFUxdS8xQ05W?=
 =?utf-8?B?YXZFbmV4QkRYS0UyMnpCZnMzS1NRa0FGVmhUdWo2TGNCWG4vT3crbGk3RHhz?=
 =?utf-8?B?U3RwVVRLZk9sRzg5bmYvUkhhWUp2TVBjUkRtTVJNakREamVlUENUa3gvcEI2?=
 =?utf-8?B?VGlaekNKWHRoZ0c5RzBDamVYa3JMeFRqblV1TzZobTJSaEhCVkUzSzZvSGps?=
 =?utf-8?B?L1ZENXgvbzR3cDFscng3OVNUNVNtd2Z2RXR2MG1saUFRNkw2eWpwb0tQTTZR?=
 =?utf-8?B?ZVMvQmFNQmJPZjhDRyt5WlU0WnpoVGVmQmxjbml2S0pOMnVzZTFSMDVyZ05i?=
 =?utf-8?B?eUR5aU9FK0U1cVdtM29xK3VtRnoxdnd4YkJwQ2lheDFNcHYxSytTZ3pHYU1m?=
 =?utf-8?B?Y2xYWDliRkQ1bUNQejh4c0E1OGp0bGVKcnFoOHRISlRuTHBxSGl5dm90NUkw?=
 =?utf-8?B?NnlPWHlOdUp3QllWdVNVSEZaV29CUzlva1pyWG5DdEZFamlMZW4xMEwrSW5N?=
 =?utf-8?B?Q1QwRU5mTjRHZGFWZVA3TmNMeEdCRmgvb0NuQjJEZFVZUHU2aUR3cFJqSkg4?=
 =?utf-8?B?YXZNRXdoK0h6TUtRU1ZFWW1zSU5sWFppa0FQTXJ2RTE1WXkzZ3RXRmZqdE5i?=
 =?utf-8?B?d21VL1RCZ3RTampGRDFmK2NQMEUybzB2NndYMXA4TlpCNWhGZk5jczg3TzBS?=
 =?utf-8?B?MTIrbVQzWmt0bTNTRHZYTDBGZndTMmNOUmZMMDlYMXlFUHVueVRUN2c3elov?=
 =?utf-8?B?VHVKTW82SmgyaWtSSTR6ZXl6dG92cGdlNytRb01GcG5CVnFpTGVFK2I1ODVV?=
 =?utf-8?B?ZldZQ2dOT2NuajQwMmhiVmx5cU93R1hHb2lGOXVnR2FZSnczRGF4b2FwZmdI?=
 =?utf-8?B?VFZOcm5OODlVRmVPSS9nWkU1NFRnQjk2WUxXTEMzeFQ0MVRkdHJ5RkU0RVpt?=
 =?utf-8?Q?1ZK9eStfKyArjSeUQSoFos7Lo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4376df90-14ee-4d62-4f39-08db1f0bd87a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 12:59:54.1458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BssyI5E2ZyZT4tVORl6klta+emu6cQ7BS58TCMCrIroeKInsYIvqhWugCWJMV3q7yUMqnM7j2GSo3xlyzIsETQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7421

On 07.03.2023 13:52, Oleksii wrote:
> On Mon, 2023-03-06 at 11:36 +0100, Jan Beulich wrote:
>> On 03.03.2023 11:38, Oleksii Kurochko wrote:
>>> --- a/xen/arch/x86/include/asm/bug.h
>>> +++ b/xen/arch/x86/include/asm/bug.h
>>> @@ -1,79 +1,12 @@
>>>  #ifndef __X86_BUG_H__
>>>  #define __X86_BUG_H__
>>>  
>>> -#define BUG_DISP_WIDTH    24
>>> -#define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
>>> -#define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)
>>> +#define BUG_DEBUGGER_TRAP_FATAL(regs)
>>> debugger_trap_fatal(X86_EXC_GP,regs)
>>
>> Along the lines of a comment on an earlier patch, please move this
>> ...
>>
>>>  #ifndef __ASSEMBLY__
>>
>> ... into the thus guarded section.
> But it was defined there before the patch series and these definies are
> used in "#else /* !__ASSEMBLY__ */"

Since you use plural, maybe a misunderstanding? My comment was solely
on the line you add; the removed lines are there merely as context.

>>> @@ -1166,12 +1167,9 @@ void cpuid_hypervisor_leaves(const struct
>>> vcpu *v, uint32_t leaf,
>>>  
>>>  void do_invalid_op(struct cpu_user_regs *regs)
>>>  {
>>> -    const struct bug_frame *bug = NULL;
>>>      u8 bug_insn[2];
>>> -    const char *prefix = "", *filename, *predicate, *eip = (char
>>> *)regs->rip;
>>> -    unsigned long fixup;
>>> -    int id = -1, lineno;
>>> -    const struct virtual_region *region;
>>> +    const char *eip = (char *)regs->rip;
>>
>> I realize "char" was used before, but now that this is all on its
>> own,
>> can this at least become "unsigned char", but yet better "void"?
> If we change it to "void" shouldn't it require additional casts here (
> which is not nice ):
>        eip += sizeof(bug_insn);

Arithmetic on pointers to void is a GNU extension which we make
heavy use of all over the hypervisor.

>>>      switch ( id )
>>>      {
>>> +    case BUGFRAME_run_fn:
>>>      case BUGFRAME_warn:
>>> -        printk("Xen WARN at %s%s:%d\n", prefix, filename, lineno);
>>> -        show_execution_state(regs);
>>>          fixup_exception_return(regs, (unsigned long)eip);
>>>          return;
>>> -
>>> -    case BUGFRAME_bug:
>>> -        printk("Xen BUG at %s%s:%d\n", prefix, filename, lineno);
>>> -
>>> -        if ( debugger_trap_fatal(TRAP_invalid_op, regs) )
>>> -            return;
>>
>> This and ...
>>
>>> -        show_execution_state(regs);
>>> -        panic("Xen BUG at %s%s:%d\n", prefix, filename, lineno);
>>> -
>>> -    case BUGFRAME_assert:
>>> -        /* ASSERT: decode the predicate string pointer. */
>>> -        predicate = bug_msg(bug);
>>> -        if ( !is_kernel(predicate) && !is_patch(predicate) )
>>> -            predicate = "<unknown>";
>>> -
>>> -        printk("Assertion '%s' failed at %s%s:%d\n",
>>> -               predicate, prefix, filename, lineno);
>>> -
>>> -        if ( debugger_trap_fatal(TRAP_invalid_op, regs) )
>>> -            return;
>>
>> ... this return look to have no proper representation in the new
>> logic; both cases fall through to ...
>>
>>> -        show_execution_state(regs);
>>> -        panic("Assertion '%s' failed at %s%s:%d\n",
>>> -              predicate, prefix, filename, lineno);
>>>      }
>>>  
>>>   die:
>>
>> ... here now, which is an unwanted functional change.
> Oh, you are right. So then in case we have correct id it is needed to
> do only return:
>     switch ( id )
>     {
>     case BUGFRAME_run_fn:
>     case BUGFRAME_warn:
>         fixup_exception_return(regs, (unsigned long)eip);
>         break;
>     }
> 
>     return;

Except the "return" needs to remain inside the switch; unrecognized id
values should still fall through to the "die" label.

Jan

