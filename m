Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAED6C4A73
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 13:27:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513397.794311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pexZ6-0006kY-Va; Wed, 22 Mar 2023 12:27:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513397.794311; Wed, 22 Mar 2023 12:27:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pexZ6-0006id-SO; Wed, 22 Mar 2023 12:27:40 +0000
Received: by outflank-mailman (input) for mailman id 513397;
 Wed, 22 Mar 2023 12:27:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pexZ5-0006iX-5F
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 12:27:39 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0606.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0dce8cb-c8ac-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 13:27:29 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6991.eurprd04.prod.outlook.com (2603:10a6:803:12d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 12:26:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 12:26:45 +0000
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
X-Inumbo-ID: d0dce8cb-c8ac-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S45DUSBwGUAQQkHUo1CXt+hOl9MRSDcc/iA9Xfw3CTHPFI0JOhc+aIZTgblDPDj2hESpQ3Lx5aZgkINdzvfOEt8zmFGQn7TsaoErOBX5pm+ASQfpQGEAu3FJr57kao15rhSKvUTPQBMpRzDNLu45/OI+KMQSOrawI5bxiduxxEz5A+Glvi3XGh8SGMLgrbJs1cs9l4rghvSvqUXrAYPzwu+GXFYhmCuRhECf4fyflg2sKOdHUlokg50P/+rzgdVYGULohehM/OAGhqgJ0GQUaafSDvpqut/f6ycd11J0zlDJA8rb8CEtZsI7SWu+ifHv/saKayKrb+Ub/6KCQXt/nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WVhwiEF6jLwFUvLMifxCNa002nlIeYN6lCNgLUwitmY=;
 b=iDQAsFXIlF6Y1zykwpkczZ6yrOtiyCMeAmW0ZbrtfTpSBeHmZGkEfViYCCrJ9GwqQvJDJS3YHHV+iQO4+J+NZac0/Vca8eRIVtcELemRoqtyWSwIACE7Z4qMNP0oH4zrRZ1r0WXsg46fyNd7Z0u/MaP5yJWjFEewSgX16lU1ej7gxPIjr50aKV5SFYbytU3Fxc7rUJsbBGDd/bNzN68KYsRvcFVE7JyRklpaJqQR5pam5ZmXRA9vgyNdzHyb6VX2o/lt/8139PmC/D2fjVyTuPG2yt8rc/QWdX36dU2saIiSJsHskMzkJ/HE+GbOS6XW7ILrF9HJpfr1QhxCkuxCZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WVhwiEF6jLwFUvLMifxCNa002nlIeYN6lCNgLUwitmY=;
 b=5Hi5aY9QoYdpX1Y6AAlloGSVANMnLbgVX4gbcC5+/erEq5QUJT40q3NIDKm8XUGCnaOnsRvcTq6rYGmfe1Ujj/N6Q++I6N6G8DHKu5oQBDGUqT8krR2c/TJIqOF6CJBrJreFcAoS7sqdPb/F+Q313RcmStu+88IF45hXHNZDRZTeLJ0hFKjz2as2iba1G8bWYWQM8nljIhbYSzHVIoGT3+s//aKV4UhONn+iMoj4dysqjAQEyUMHyHrRgQevXBiS+LJKsRQjPrVb2D5pTtdnDJJcMTiGTTBwHkTh463qozaAYovO0XTplafaYKH6AQFAHkpQAwHOyAlNIdQJGoJeNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <771418cf-9515-cc93-14c7-4bea60c30b2b@suse.com>
Date: Wed, 22 Mar 2023 13:26:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 4/7] xen/riscv: introduce decode_cause() stuff
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1678976127.git.oleksii.kurochko@gmail.com>
 <8c7b4a5d328be8b1cd2aa99c8d9a7883e4969600.1678976127.git.oleksii.kurochko@gmail.com>
 <0b94be57-b8fb-6c38-9ed8-dc8482694153@xen.org>
 <cf883a86eac88c11d02768eb64adb2b418c6ba2e.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cf883a86eac88c11d02768eb64adb2b418c6ba2e.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB6991:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e00f052-a075-4ba4-ac49-08db2ad0b362
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n4Ba65uARDNN9uESgGooqXpTzjayGHVzuABC3V8HmzsYkBupeXNlEfVpFBFeMzndVzfwBi3cUjwWdusywvG+2KmMoUTTvYKeeWwnw++269gxQP/XCsjrGoosrABT0ABxe1rkH6rgr+C5ZSGX/87/2+GPGtJGEDplS9UfrTfWRcNbBcWH61hQTKxD4xIyWxmsCo3meBn8vxdlMn7XjGQWD2SFQWFzVkYOToSN8zn3G7myBklDwUrp0O9P6GGfWDlVu4K4Qb7dZZ/eh79G6zIDMRf0lsOXzQnhY31g/nnsRECIJ1tpKByrPzlCPukBZSDdzwYbaTjauwHHXJefO6MfbSjqIgf6zKaAdG9XuF2fDqWOJU56Nsp1FpCvf+Kw9XMsC80kyFUcHG9j6O2QonnpirZ+5RMwpPEv8juOyaE7U35y/n8EyeSwa+G8i40iAqIM8frBrjHvfB1lZP5Syb0C5HVl5ayfny3XoleaVAq55MFlpyguILy2oXnndnmKKoCIMyIDEBaqj/4Li49VaiEPwaryJWAx7veLtWCnXnyveQR37xRpRkM2Wt9+oAbaDsVvi44bp0J2L2nOTZQ03jFlxSCC3IW9YYAPoesNc2gNq4oM8axeqYtFAc9n1gEFJKrjsYGk5OMmbYxXlN0Ega0jUrguTyq+Vj7aqhiMzFzQOUnFvJpFVOxSbviKNTHsevh6D9cXCVMkiz4/tDtDb1OWQM1je0Anv4wldAGl11sbuLQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(376002)(366004)(136003)(39850400004)(396003)(451199018)(31686004)(2616005)(6512007)(316002)(53546011)(478600001)(186003)(6486002)(6506007)(83380400001)(26005)(31696002)(86362001)(38100700002)(66946007)(41300700001)(54906003)(5660300002)(2906002)(36756003)(66476007)(6916009)(8936002)(4326008)(66556008)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGlUcDZianpWQkY1WHBGb2hFc0ZCUjUxZGkwYWMwemorRXZ6c25XVktIdUVO?=
 =?utf-8?B?ZE44T2N5SFZ2bVJmeW1WRFFVWlB3QWk0NWpVcTkwRnpSaDJMd3ZtdzkxbDBi?=
 =?utf-8?B?ZTE3ek5VOGdCSENUSG9JRVBkdkdyVXJvNDFUQXBGTjhkQ1FrTkRWVnRsQ1Vx?=
 =?utf-8?B?SWNtWGFZMGVSWXJubERVdHIxYmJIZ1FhVEZuMDdRQVZDRTRMemVBRjlXTk1p?=
 =?utf-8?B?aHQ5NW5lampEQURLN0xVU3dvcUo5L2dFcjY1N0tGQkIwWlp3Q29MNVFTQ24x?=
 =?utf-8?B?a0hBZWlwekZMMlRJa0MzTXFsTU9XQTcrWm4wdlRPeWZ0Si9acU1pcnIybmFk?=
 =?utf-8?B?TU1yZXFQbDRFMnVaTStZeHdUVFdaalZQandHWkhsUUlDNE1CTk9sMWV4K2JS?=
 =?utf-8?B?eHFBUWE4eHk3aFg5cVVjejJjQ21BbUZ4VnVldVhOM1hnSTAwMzI0bzRuaSs2?=
 =?utf-8?B?U0JSZCtWYXNaa243VEhYbFQyUGZRY0djMDBRaHBOV3VaeEdMekEvVVQ1ZHQz?=
 =?utf-8?B?UjZJOXNTbVBQUndaMHFBWVZ4S1l1RkxiQ00rZ2Qxd2tLNGtpSlVJQjdLc3I4?=
 =?utf-8?B?cTRWUWZ1Wm1wOVdnV2RobVlWZ1Zadm5nMThHcjFlZ0RsK21peEdrQ1lBZXVp?=
 =?utf-8?B?UjFJdzUyYVdhTDBFVGhEL1V5b3h0L1B0c1AvY2thVklEb0tZQmFOU2VFbk5G?=
 =?utf-8?B?cTJUbFhYc2lJYXhoQUtMbjA0dWNXdFFQb0Q0TXFQcGdZRFU4SGpmdEVMcUxV?=
 =?utf-8?B?YlFZR202TkhveXk0MHA5SU5QNEpGajl5OVZDalN3cGU2cU1kZGlqNXdOV2lU?=
 =?utf-8?B?K1BpMWd1amg5Z01UY2tSejlWVU9rQU00UGhkVUVzcEI1cXV3K01SV05PVlk2?=
 =?utf-8?B?ZTJRL0FHN2Y1MnZEZmVlQlFubm1PTXRPU1RhS1d4cVIwcmdvenYxaWhzTFZD?=
 =?utf-8?B?cDZxY1hPdG4ydGEwdFYwOUxzaGFNWVVnY005dFZ0NWhTSVk4S0lBWmpCRjg2?=
 =?utf-8?B?K05GekZYeldWUElkaERCa3V5K1VMMDZuVGM2V2ZKdS9IR1ZUdHVWZ1ErUDFq?=
 =?utf-8?B?MWRMZm41SUhQYkU5RWhCVlFoVkx5bHg0N1crRW1SZVdnbHZZS2RRUWRia1J6?=
 =?utf-8?B?K2xWTzVwb1dXcXBGdkpiS1JxbzZSY2N5SnBRQURlb1B5OHpRWDU5NElFNk5H?=
 =?utf-8?B?SnVwTlB0MHlKZ0EwL2dORXdZZlAySXlGSExkZ1FWWjNlRGpZenZjMWcyc1VW?=
 =?utf-8?B?UmZLQitiam41NEs0N1VGT3V5dkVTeEtTS1ZlcklZY2ZiUFAycWU5bnI1T0M2?=
 =?utf-8?B?UGdCRld6YkhQeHBwWExnM01LVmxvZFN1N1FjSlowTjB3dElCWmpBbTZ3QWQ5?=
 =?utf-8?B?MEw5cDJSY01xbXBiSjhoWTltbjVCYzFDUUNmNFArWjg3bFUydkdRZXZKOWVx?=
 =?utf-8?B?TmYvaFNhUW9UeFlrMitPZHBPUkZzTjZDanNCRGs2NTRid3RnSng5UFdkcWdj?=
 =?utf-8?B?V1BYZGlpeFFqR2F1N0IwS0RZODl0NWhRTWt6cUxFS2dXN215VCtrZFRCUWJt?=
 =?utf-8?B?aVExNUtEeHJ0NWhKeURKdllmNmEzWFZVb3BnVjlmREYvaloxWTlVaXpTMmdM?=
 =?utf-8?B?aEZmQ1o4QjZ5azV2a2grWWorWkZHbG13TjMvT3ZoSW1hdlhKUlhYOXVGR2Mz?=
 =?utf-8?B?WUtTbmpjOW9wVkxzQkxZV2U2N0FuQUdxaXRPVmlvNkUvdFZHYkRXWTlFTHRS?=
 =?utf-8?B?aC9mNWhZOVhlWG1tcmc2b1gzWkpXeU11c0xjMVBCZlBMZGxETGNvcmgrclk2?=
 =?utf-8?B?K1NqR3ZwUklRYkhKSEtXRFJCb1BoZG0yZEdSakNxVktFWlJpc1Qxam8xbTZP?=
 =?utf-8?B?cUZSK1l2TW1mVnJWb1VDSWIzQW5Ka0hUdnM1RjZ4T3M2SUNtcWhOYy9ISFBY?=
 =?utf-8?B?eDhyVmVNZlVIRW5ob1V2TU1SNkR5SEV0V0JYQ3pNMTNOMmxoSW9QR2E5ZC96?=
 =?utf-8?B?RkFMVUFlVU5ITG1CZjNDZjNBcnB5WHVjeXMxaEtkMGdTcG5Ld0FWYXQ2N0o1?=
 =?utf-8?B?L25jNkdKQWRqajBSVUEreE1RdDMrU2FNM0NSSVI5UFFzeGtRTEpRd1Aya3U5?=
 =?utf-8?Q?fstSppRknQmFUDoTbMe7dLl2T?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e00f052-a075-4ba4-ac49-08db2ad0b362
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 12:26:45.5928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hEQhhKVbS1NSHAo/ONLOmV+fpb/QEkbTOP2Q54AdU7+XLnCQcg4Ed6V6/FfiLabbdbFsJSUGcvjWwRYKEGcHFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6991

On 22.03.2023 11:20, Oleksii wrote:
> On Tue, 2023-03-21 at 17:33 +0000, Julien Grall wrote:
>> On 16/03/2023 14:39, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/traps.c
>>> +++ b/xen/arch/riscv/traps.c
>>> @@ -4,10 +4,95 @@
>>>    *
>>>    * RISC-V Trap handlers
>>>    */
>>> +
>>> +#include <xen/lib.h>
>>> +
>>> +#include <asm/boot-info.h>
>>> +#include <asm/csr.h>
>>> +#include <asm/early_printk.h>
>>>   #include <asm/processor.h>
>>>   #include <asm/traps.h>
>>>   
>>> -void do_trap(struct cpu_user_regs *cpu_regs)
>>> +static const char *decode_trap_cause(unsigned long cause)
>>> +{
>>> +    static const char *const trap_causes[] = {
>>> +        [CAUSE_MISALIGNED_FETCH] = "Instruction Address
>>> Misaligned",
>>> +        [CAUSE_FETCH_ACCESS] = "Instruction Access Fault",
>>> +        [CAUSE_ILLEGAL_INSTRUCTION] = "Illegal Instruction",
>>> +        [CAUSE_BREAKPOINT] = "Breakpoint",
>>> +        [CAUSE_MISALIGNED_LOAD] = "Load Address Misaligned",
>>> +        [CAUSE_LOAD_ACCESS] = "Load Access Fault",
>>> +        [CAUSE_MISALIGNED_STORE] = "Store/AMO Address Misaligned",
>>> +        [CAUSE_STORE_ACCESS] = "Store/AMO Access Fault",
>>> +        [CAUSE_USER_ECALL] = "Environment Call from U-Mode",
>>> +        [CAUSE_SUPERVISOR_ECALL] = "Environment Call from S-Mode",
>>> +        [CAUSE_MACHINE_ECALL] = "Environment Call from M-Mode",
>>> +        [CAUSE_FETCH_PAGE_FAULT] = "Instruction Page Fault",
>>> +        [CAUSE_LOAD_PAGE_FAULT] = "Load Page Fault",
>>> +        [CAUSE_STORE_PAGE_FAULT] = "Store/AMO Page Fault",
>>> +        [CAUSE_FETCH_GUEST_PAGE_FAULT] = "Instruction Guest Page
>>> Fault",
>>> +        [CAUSE_LOAD_GUEST_PAGE_FAULT] = "Load Guest Page Fault",
>>> +        [CAUSE_VIRTUAL_INST_FAULT] = "Virtualized Instruction
>>> Fault",
>>> +        [CAUSE_STORE_GUEST_PAGE_FAULT] = "Guest Store/AMO Page
>>> Fault",
>>> +    };
>>> +
>>> +    if ( cause < ARRAY_SIZE(trap_causes) && trap_causes[cause] )
>>> +        return trap_causes[cause];
>>> +    return "UNKNOWN";
>>> +}
>>> +
>>> +static const char *decode_reserved_interrupt_cause(unsigned long
>>> irq_cause)
>>> +{
>>> +    switch ( irq_cause )
>>> +    {
>>> +    case IRQ_M_SOFT:
>>> +        return "M-mode Software Interrupt";
>>> +    case IRQ_M_TIMER:
>>> +        return "M-mode TIMER Interrupt";
>>> +    case IRQ_M_EXT:
>>> +        return "M-mode External Interrupt";
>>> +    default:
>>> +        return "UNKNOWN IRQ type";
>>> +    }
>>> +}
>>> +
>>> +static const char *decode_interrupt_cause(unsigned long cause)
>>> +{
>>> +    unsigned long irq_cause = cause & ~CAUSE_IRQ_FLAG;
>>> +
>>> +    switch ( irq_cause )
>>> +    {
>>> +    case IRQ_S_SOFT:
>>> +        return "Supervisor Software Interrupt";
>>> +    case IRQ_S_TIMER:
>>> +        return "Supervisor Timer Interrupt";
>>> +    case IRQ_S_EXT:
>>> +        return "Supervisor External Interrupt";
>>> +    default:
>>> +        return decode_reserved_interrupt_cause(irq_cause);
>>> +    }
>>> +}
>>> +
>>> +static const char *decode_cause(unsigned long cause)
>>> +{
>>> +    if ( cause & CAUSE_IRQ_FLAG )
>>> +        return decode_interrupt_cause(cause);
>>> +
>>> +    return decode_trap_cause(cause);
>>> +}
>>> +
>>> +static void do_unexpected_trap(const struct cpu_user_regs *regs)
>>>   {
>>> +    unsigned long cause = csr_read(CSR_SCAUSE);
>>> +
>>> +    early_printk("Unhandled exception: ");
>>> +    early_printk(LINK_TO_LOAD(decode_cause(cause)));
>>
>> The use of LINK_TO_LOAD is the sort of things that is worth
>> documenting 
>> because this would raise quite a few questions.
>>
>> The comment on top of LINK_TO_LOAD suggests the macro can only be
>> used 
>> while the MMU is off. But I would expect do_unexpected_trap() to be
>> used 
>> also after the MMU is on. Isn't it going to be the case?
> Yes, you are right. it will be an issue now. It was not an issue before
> when it was used 1:1 mapping. So I have to add a check 'if (
> is_mmu_enabled ) ... ' inside LINK_TO_LOAD macros.

I don't think that's going to be enough: What decode_cause() returns
may be a link-time value when a result of reading from trap_causes[],
but - as Julien did say already - it can also be a runtime value when
coming from any of the "return <string-literal>", calculated in a PC-
relative way. I guess you will need to apply LINK_TO_LOAD() to the
trap_causes[] access itself.

But as said before - I'm unconvinced this approach will scale, because
you'll need to apply the wrapper to anything which can be reached prior
to you enabling the MMU. Whether you can contain this to RISC-V-only
code is unclear; I don't think it'll be acceptable to change any part
of common code to meet your special needs.

Jan

