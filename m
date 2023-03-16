Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B16E6BC93C
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 09:34:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510369.787885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcj49-0003RE-Bm; Thu, 16 Mar 2023 08:34:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510369.787885; Thu, 16 Mar 2023 08:34:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcj49-0003Ov-8X; Thu, 16 Mar 2023 08:34:29 +0000
Received: by outflank-mailman (input) for mailman id 510369;
 Thu, 16 Mar 2023 08:34:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ta6a=7I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pcj48-0003Ol-7m
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 08:34:28 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20619.outbound.protection.outlook.com
 [2a01:111:f400:fe13::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c13ab16-c3d5-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 09:34:26 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8966.eurprd04.prod.outlook.com (2603:10a6:10:2e1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 08:34:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 08:34:24 +0000
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
X-Inumbo-ID: 5c13ab16-c3d5-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U4UdGw++7KBdLMAlMud12utVsUi9mQD4v/JNvNtHnDtK7eTh5YzQNRCe8NmBrS4WE49befyBKPJDMDllhIE2eLfPJ7QTnHo/Hnl4ejCG18wV+nWEsOnfQNoyLxt8dNGCYSvwBJ7/FRwoaIPRluU3tRw1AQhf169oceH6bhGNZyjJccIXF6brvPd4z0Mi8JXkz7gSDd2d0zRBsDIfpnMWEKGqUlnICNMRCMDfZgAM+/1pvdKzgHnrOwD1o5UUYEx/9V49wQ0z+9QyOQXSpHG4SU5SLlaUDxxqtcjsVBdySE0cYzmL0TJaYT69qQSUqTcTY07qpthVqatlcScIktWJ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1c5FVRhNzAiNy4LVaNatua8+smXZRblsdmTxCuZOdiQ=;
 b=FJlYL8o3ixqc243nit8R7atTSNUJnRwu7m6YR7fudy4pzshl/i10m+hsVmmHDDGTd/mmgbThgX3AjB9HypdvM+UQWcmjc2/2ok+vgwy07PmJjMGR8Dkc8/8hTVbzrnDuacbZ75ea4T3+Xq2vrv4mdUZ1NzNZZpH7lexhmlFq9cBPDXoYf4v54DsAHL+Gep8zF7yF5UVOli0136/E74UQRS3faNqFe9BQX/f+modY7ys4tydyJvgGs+159GdHWDrA5z4vpK9tqgm7fE3KTfSJYrlHJBlZ/y8qGhmIC31HJfpQRAF9QuOwBUdsfxhx3iJfptj9IDXDFNdcD+YoWzF26Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1c5FVRhNzAiNy4LVaNatua8+smXZRblsdmTxCuZOdiQ=;
 b=a9kDft83HZX6pyxgWW50VbB67rcM0GeWMOwLTjtNwyBJYP4afmMMSnXHOkL9zErWCTzLx9nIBKADFMaOd76NPRD1p8DSIZrwvAcyFPpDqvU0jWGu7MpdlIpigaYI3hkrjeyvxy4A1ITFqtaTKUbgRSzo4BN08rX9wH00l1T72qT67yoDInPysq8d0FuWE0TEurn5Ht+iWOZRlwPDFptDuJIIwCIYlwDULJGTd7R3NDR6kifXQXOFhBQ8536Qb5XX581x0vSNVD3bompraq/lFYGnMHkpP1k+Qvnygs61tDNZr6E0arPKTR2g5SjVEXxrinsNWQs9fv77aSn9jtG1Rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8c4fc31e-43ff-7d17-5d7d-33753e83c1ce@suse.com>
Date: Thu, 16 Mar 2023 09:34:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1] xen/riscv: make calculation of stack address
 PC-relative
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <ad2249c1b5be01f99ef9c294a3264da0c9715bab.1678809641.git.oleksii.kurochko@gmail.com>
 <9c5ec3f3-c909-8f45-4460-1b29ce333d10@citrix.com>
 <e7c42fc7561b88b1a18463b9b28d0b09cd6553c4.camel@gmail.com>
 <966c19e3-d255-db73-9bb4-7abe0a745396@suse.com>
 <b81cddfce06628dc1e0cf373c323c74d1b256313.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b81cddfce06628dc1e0cf373c323c74d1b256313.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8966:EE_
X-MS-Office365-Filtering-Correlation-Id: 1051f314-0088-45ee-5e5f-08db25f93f44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hbYWEN4lXT4ThrtMnUM42EBtOQI9D2cUe+Ql4vo7p6Aj4NvxZnJGLWrWMwacLSo6MtP8Usk65bUtUEOOaIAR5hyD3oQILU/KSeZ2C4OeLMoanIxTDj61+lQtbRvcSIxPNCvYhli6BV6V7BV4UWfcq/IpFmm+PQ5CW38ULDIHbq7P0Fj+TVb/k55LNXSW17htzLuAD2GpbIl7BCww6vOSvfVrhXP8wpP5gjlAf6A0B3fWgo0i+86xMJGDJnh1RyWdjRzP5OnLwjbjvP4FR6YAcli1q2cNt9azL/Gmi1r0VQLAmp3KTWAtrZqbQAFcZihur9quk8wZ4togaa64N6kXd5cpuK7O9gVwy0Pt84nZGM2q05wRnSIsrt+JgokdBDNQzxzUR2JhfKwPUq8Ksm4FAWVd9oo5sEPa92a4yUukbFpmGKiM1xri5rmkzxQF9tEGtzaakYiiy7tYajJPcZmgacI/oba+TROlR1uG4KXTgHkH6I40O/ScWwmX5SzAmKQ8KVCh/BIdZkP1F98n2OVV/o1qgg4Oe+dWOXala1DC7GRY4hE8b4vdtlGQGH+54okp6BlAOs0Ao8du1Orv0ikF/up+MQ4zfnFFoPIHgwgnx8hgelIpaM9jAp6ZzSmgJuFAXXg+CifAUy/m2svRwkAdp4FCTTaRbsJ2yN6oWOtxDKJqAhsl2qJa90jnSCQ4kQlckmU4jRr1I6H+KsrJFln6IqVMHJrtc7DC0SSQ6jP+Htk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(346002)(39860400002)(376002)(366004)(396003)(451199018)(31686004)(36756003)(5660300002)(41300700001)(8936002)(2906002)(31696002)(38100700002)(86362001)(478600001)(6486002)(66556008)(66476007)(6916009)(8676002)(66946007)(4326008)(6506007)(6666004)(2616005)(54906003)(316002)(186003)(6512007)(26005)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGkvdGN2aFlKMVNsaHFuU1Q4emk2V25Bb2lCaTBkNC9jSVdsODA3ZkhmMndo?=
 =?utf-8?B?djBLY0J4Z2FRNXVBajhYdkh4eHZOWnQwMFlNOGJKekg5cGdEUThpTEJ1SS9Y?=
 =?utf-8?B?dU1sNEVqNWxDV0dUQ3RHcGpZdDFCZm9zQmNpRmZ0QWt3Wm5hL20rSWNpY3VY?=
 =?utf-8?B?NVl0Z3hTalhBb1d1bkswNFpGQk5lYTdPcVI0ckpuaFYrVjk5dXYxUW9FSkRV?=
 =?utf-8?B?aGExTGFXQ3dJY1pFU0RmU3ZQQXdjeDA2M3Z5dHhzYUNyamlab0cyNEQwTmVR?=
 =?utf-8?B?MDJCRmorcEhhNjBKOEpxMjRLd2NNeVRqT3RFRldIMllOcW5UY0F5NURoQm4r?=
 =?utf-8?B?RjhWdW1iRkVVNVFaYjZRSUIwN2pST1h6S0VTWDBvNGY0R0tLU3ZydzVVMXpt?=
 =?utf-8?B?MFd6RUJFSXByems5YmpXbU1xUVNJb0M0R1lCemdRcmRRcDVyaUZqUW5aUkpR?=
 =?utf-8?B?VzNYQStia0RKcjh2NHJWdGtLd3FIb0Yzc2lmaDBXOXU1Sk9neXcrUDhOaEx3?=
 =?utf-8?B?NG1HQ1NzVDNMS3lwYVE1VlNWM3hWQVZtbHZsdjhSYjhTdXNGYkxHUGxSSVlk?=
 =?utf-8?B?aHBUNTF2SldnTEFaSlhLRjhqLzBWSlpjK0xqbzQ5VVZhOWVSVGJwNE9JNzdS?=
 =?utf-8?B?OXQycVFHaStqYVBROHlDQW1UcldrZnJ5eUFyazYvQlZkNUZPNXFUMTdPTnpn?=
 =?utf-8?B?OWNtQkdncU9LdzNaSU5kdTZybjQxRjFWY1R4aEIwZE9xa085MTBjcDhNOXJC?=
 =?utf-8?B?ZHowbUt0TlJYRUM0VjFCUHF2UnFEN3FwMVBDSm8zWWxkcE9mSVVwZ091VUxX?=
 =?utf-8?B?Z1ZlVDg3TFdDVXlKRjMvNmxMWFVWRm1oMHpLSWhFVDJ2U2VRVVJ6UlJnYU9t?=
 =?utf-8?B?ZGNQYjRKKzlOR2UzRVoyODd1M0pOVStqZEFTbkJ2UXFoZkI0L0ltUjBiTVQv?=
 =?utf-8?B?ZHJFMlZLdW81VEk0NmFSSGk0UHY2amlBSDR6cUZaS1RhMWNWM2tWc0xVcWM4?=
 =?utf-8?B?NFJtVGZFNWRhbnFxUThZeHl1UWlBWllQTlVFTUZpMjFUczVMenUrRE9wcjAw?=
 =?utf-8?B?VjNWYlNjUlRPc0hFWi9odTBzQUFFcXFGWE9NejdiVWUyUFJlUCsyeVEyWlly?=
 =?utf-8?B?SXpOTDg0WFh0K1d4NTBURERQMXRZSTBOeGdyTERaUlpoeTR0ZU5QM1BUZ29l?=
 =?utf-8?B?dUtYQnN0b1FBUFlKMW1nSHY5R2d2REZSR2dBSVR1NkxMa3h2T0hwRFlsT21n?=
 =?utf-8?B?NU5Hb1VNeHFDTUJydzRVcmFBYWxUdDdSTUcrNk1VSWRYTlpwSGdCb2VrbnRn?=
 =?utf-8?B?dXF6Wjg5YlkzNHl4SWg2OEQ1a1o4a3NkSllKNnVab3BFdTVnaHpUYjJLbFdi?=
 =?utf-8?B?dWJWelNnczlxN1BhTU9jWWU3Mk1RM1czSU9ZYVNuZUo1QVNYSnRWQmoxRHdz?=
 =?utf-8?B?ZkRSaTBjU3lCVFc4QURXck82ckdvcWlCc25WamNzZm9RdkllVUY3bjNnTkNu?=
 =?utf-8?B?L3lycE01QXBsaWkzOXNNSzVGeEh3NkVQR3A0dDJuY1kxSHY4TGtydDk1M2N6?=
 =?utf-8?B?Y1JSZWxBcWVaMDlPS1dTY0JCNGwwVE9KeFM0bmk1NlIrT2QvbHJPcE8xVmtN?=
 =?utf-8?B?TGVuR2pObWsxMEdNM3duaEtQZThZc0RmQUVPcFFEQ25BMHdKb1RhUnYvVEti?=
 =?utf-8?B?NTNBZndHVzNUMnR2VitUTU8rUHpVMU9pQlNkU3NIU3h1UVNCeFJSNm5XQTU0?=
 =?utf-8?B?Qjd6bDNEbkZTVEJackJWMUtDb3JlMTlmU1E1emtyU2hjZ2ZRUzdJcWI3cG1S?=
 =?utf-8?B?ZlMyS2FFU3VDYkNaZFRIcGErVWNvUDNSTUJ6V2VvZlk5WDNLQndLa3ZINnQ3?=
 =?utf-8?B?RFovTGg0SDJWSDRtM1ZKZmVsQWFZQTlVdkYwWGtwR0Q0MU5yR2kyUjd2cHRZ?=
 =?utf-8?B?T3I5dlRkR1Bmb3VvRS9YQUxQL3M5L2dqVzFzRFArUFVnVURvRUpBejdmbGxU?=
 =?utf-8?B?bHltdW9nZzRhWDZmSkFYQTNJRGRuTXZXc1cyeVArQzl6TEFvMnRMaWtQb29u?=
 =?utf-8?B?YW96VC9mWUFhU3RiK0Y4dGpQZzBqNFlRRlJIVy8wbTQwdEg4TUsrUUVSTzRB?=
 =?utf-8?Q?T0RVshKitQlR3JpdyYwfjeyzp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1051f314-0088-45ee-5e5f-08db25f93f44
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 08:34:24.3774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: avlXHlBpCexdHbheWXyASWRWLbB4MFsqeuqlgzHT7EOPFnGg7GbzSZ0+tqSzOdz+gS+qiQ7ivnYZS0VGIlRrDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8966

On 15.03.2023 19:23, Oleksii wrote:
> On Wed, 2023-03-15 at 08:59 +0100, Jan Beulich wrote:
>> On 14.03.2023 21:16, Oleksii wrote:
>>> I checked in Linux binary how 'la' instruction is transformed, and
>>> it
>>> looks like it is translated as I expect to auipc/addi pair:
>>> ffffffe000001066: 00027517 auipc a0,0x27
>>> ffffffe00000106a: f9a50513 addi a0,a0,-102 # ffffffe000028000
>>> <early_pg_dir>
>>>
>>> I checked compiler flags between Xen and Linux. The difference is
>>> in-
>>> fno-PIE (Linux also adds -mabi and -march to AFLAGS):
>>>
>>> 1. Linux build command of head.S: riscv64-linux-gnu-gcc -Wp,-
>>> MD,arch/riscv/kernel/.head.o.d -nostdinc -isystem /usr/lib/gcc-
>>> cross/riscv64-linux-gnu/9/include -I./arch/riscv/include -
>>> I./arch/riscv/include/generated -I./include -
>>> I./arch/riscv/include/uapi
>>> -I./arch/riscv/include/generated/uapi -I./include/uapi -
>>> I./include/generated/uapi -include ./include/linux/kconfig.h -
>>> D__KERNEL__ -D__ASSEMBLY__ -fno-PIE -mabi=lp64 -march=rv64imafdc -c
>>> -o
>>> arch/riscv/kernel/head.o arch/riscv/kernel/head.S
>>>
>>> 2. Xen build command of head.S:riscv64-linux-gnu-gcc -MMD -MP -MF
>>> arch/riscv/riscv64/.head.o.d -D__ASSEMBLY__ -Wa,--noexecstack -
>>> DBUILD_ID -fno-strict-aliasing -Wall -Wstrict-prototypes -
>>> Wdeclaration-
>>> after-statement -Wno-unused-but-set-variable -Wno-unused-local-
>>> typedefs
>>> -O1 -fno-omit-frame-pointer -nostdinc -fno-builtin -fno-common -
>>> Werror
>>> -Wredundant-decls -Wno-pointer-arith -Wvla -pipe -D__XEN__ -include
>>> ./include/xen/config.h -Wa,--strip-local-absolute -g -mabi=lp64 -
>>> I./include -I./arch/riscv/include -march=rv64gc -mstrict-align -
>>> mcmodel=medany - -c arch/riscv/riscv64/head.S -o
>>> arch/riscv/riscv64/head.o
>>
>> Looking into why you see different code generated than I: Nothing in
>> here directs gcc to pass -fpic to gas; in upstream gcc (consistent
>> from gcc7 through gcc12, which are the versions I've checked; the
>> actual range may be wider) there is
>>
>> #define ASM_SPEC "\
>> %(subtarget_asm_debugging_spec) \
>> %{" FPIE_OR_FPIC_SPEC ":-fpic} \
>> ...
>>
>> Can you check whether your gcc passes -fpic to gas even when there's
>> no -fPIC / -fPIE (or alike) on the gcc command line?
> I am not sure that I know how to check specifically if -fpic flag
> passes to gas.
> Could you please tell me?

Just to answer this question here (the other aspect fit better elsewhere):
You can pass -v to gcc to make it report what options it invokes other
tools (including gas) with.

Jan

