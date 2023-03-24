Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D18586C7969
	for <lists+xen-devel@lfdr.de>; Fri, 24 Mar 2023 09:11:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514198.796227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfcVf-0003WZ-8S; Fri, 24 Mar 2023 08:10:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514198.796227; Fri, 24 Mar 2023 08:10:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfcVf-0003TY-46; Fri, 24 Mar 2023 08:10:51 +0000
Received: by outflank-mailman (input) for mailman id 514198;
 Fri, 24 Mar 2023 08:10:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n250=7Q=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pfcVd-0003TS-2a
 for xen-devel@lists.xenproject.org; Fri, 24 Mar 2023 08:10:49 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 611cddbd-ca1b-11ed-85db-49a42c6b2330;
 Fri, 24 Mar 2023 09:10:47 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8244.eurprd04.prod.outlook.com (2603:10a6:20b:3e0::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Fri, 24 Mar
 2023 08:10:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.038; Fri, 24 Mar 2023
 08:10:44 +0000
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
X-Inumbo-ID: 611cddbd-ca1b-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OCssRc7ib16/V/M1/xVgDWXGasG+pbjn8CrBUuHub9B7cFEaHWv3M4xlvC2Ajf/wIH7H0ylWq3uqtNhBrpuOlo9zeFCDyxgsYFZ0nHoO8tUZ6XxxaeroiZyryTZ8G7gJMT7y74VfnyIJ2zYt1/tyKLQrMpb59Suf/GGXRVhvoYjTLMz+VEU7oJzHIouiDIv+7MLlhz8xnnwjJO+8lBM4N2tdKJgWdSKq+PFqQBK0yeUf+k9ulHEZnaY4hYKtJhqRusIaLVIVJW2zbHO1WmTwZWIFrqnc550jF6ILJPVE8EDsI03UBdiaguqp04C9H+rZBfkHyO8PBuoAMdLo4RBr8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jmn2JmQ8KiQWMrbnNm6jJQWPPPTIcQVfXKmORKF3PQk=;
 b=mcdpWkDsT2TZpsybFR6C6Gll0XPqsu+KyssHyDXC8yBj5rCwAEJyjl1ZKHxhL1FRMFApXjRKcuvJCg09o11kKBDRVDofFGKzvCYejPVeKAsKmrC462Bm2L++Jdl2v1gcSrYobGZFQzJBmmBkEsbZADhuoV01e1ix+JpssQbcYXBTRWtcI6u3Qc1lG/EipMvE5oShfA8pCuUdS4PcbQL+zUzaqYO8MGraWYWy4eYYp5IhLXEmsH0hrXs4Wqg6fV+SjYo2Vcu6bInKfXtVMjmN9ZhZvjtbLFYcNziIkfy1NZ37KQ1uR3I4IfIyq4iLnUhLxSY1mB4rCIzSCLRhdKyi3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jmn2JmQ8KiQWMrbnNm6jJQWPPPTIcQVfXKmORKF3PQk=;
 b=KRsLglDcsxDHp7BKfD5b9LpG12tBuvYq88jqDRcHJZgx8H/wvP3slzSjboX5+G23YlmLh0uXouRf1dRthzaw/FqK3+hQRZnOpVq284W0QDI9L6lqmVOK+UuGj486tGzv4Q/lHqby8up/7Bay/QKzaM0bELH71cu9rV4bZDLLhrYtP9NsEH1Hj1WQiZtTISTHaEgROYoYeweO/XIa1UQDz4cZHg+tNq3pRgivJDsAnb9VJVbQB3CJOk56c9zsIie8XKAUTHYmr8Ke7PmkjZzx0b1vM1jVKKu53r9PZM5C4Itc9wSb8QkNBrudT+L+heXFJ6YeFM8fcjB8xjDuK1NAlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <806d9715-718e-6d52-5393-b7f6b7986e7e@suse.com>
Date: Fri, 24 Mar 2023 09:10:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] xen: Modify domain_crash() to take a print string
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220203133829.7913-1-andrew.cooper3@citrix.com>
 <11398184-dff2-cbe1-bca3-e2862cfbb104@suse.com>
 <b883ed21-6b5b-4212-5dac-12d9691d430a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b883ed21-6b5b-4212-5dac-12d9691d430a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8244:EE_
X-MS-Office365-Filtering-Correlation-Id: 06e28f64-1424-4be6-0372-08db2c3f4433
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0/XTmTywGbdufpvbLUO2vSwWlx4RTETzY7QDSp7joO9s2rPX1JRb/3Z41G475HqVO1c+l1CwOxxhK1Y1l/tSVsPR/wHqlEp6vdP+v2r6SPUtTH/WjpjP5cjFkZpcJ3TJHhHUVeV/IlklNrMMkv6vI1iK/roov97uofrCLSUv3Mg0YqFvJZL0XxJoYjgYFs61GXnzdKbCrzYIJApCN0pQXVCQFke3Ayq6fCdDnfWExuCr7FAQVJYWJD3n5fLJmSMhRS1CO6yeSRsiHCpVolcvhntuqwQAkHKhtfQIZRJH4Lumspb4bhIoGIL4qNykopuFTw7zFXqC9FIfDLhsXDx1Tnr8lzy7lpB/WFjNTdiKcOXdRPwcpdrixHtgvUo5bQsZ9DAjKVN7Y4YImB8hTr3+lBxXDYipuXgRV+xFph7V5jNyUr08fUr67itxDGrp1Hnh4qDmi+0C8OSsVou7lIeRKF8vPAVzmSsAKDV4NE+Ls3tLIyAXGS97uT/mK5T4NtH/VmEab1H+o8GuvzmO3SZagP77Cf4mH1XMFhNJsnzvLP/Qv+PgKJC5aeAgjyteawP2jQb+73j2u+jFrXMh/D5YHoCMn04IX/cUVo9gI8lEjqebwiOIjKtKEHiNv4Yky6CNIkjGUKSJ/Gy6SdswBZqMgg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(346002)(136003)(366004)(396003)(376002)(451199018)(66946007)(66556008)(66476007)(8676002)(6916009)(4326008)(316002)(54906003)(41300700001)(26005)(6506007)(6512007)(53546011)(5660300002)(8936002)(6486002)(186003)(86362001)(478600001)(2616005)(36756003)(31696002)(2906002)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WG11bmhBeTFQRFhQYlVjd21QV1FocVFBY2JrUnBRU1BtRmJ5Nk9yRTcrUVJC?=
 =?utf-8?B?bXhKQ3laek12UmNVL3l1bVdwTFViOE1Kd3l0UjFLVVA4LzZvd3ViV29lZ1VC?=
 =?utf-8?B?NGxhc3BZaUl2Z0lOMTYwLzd0SVRzZWJLZGk0ODM2NlVaSXJ4VmNiTVVSenY0?=
 =?utf-8?B?UlVvY01RYktia3B0cDduems0RnlEalZudHNkRkhaRjN2SDZPT2pMQWs1c09y?=
 =?utf-8?B?WGZQSkhrb0h3WkZWVk50VTEwU1JMVldjTEx3NmdYZWM1d2gxZmFoOUpSdTFl?=
 =?utf-8?B?Rnk5aEVmdUZyVWdVQ1Rxb2RCcnpwckNiSnhVUGtteDU2bzc5UlFiaXFEcEYv?=
 =?utf-8?B?d2hXSXk0d3ZtSG5EQ0p1cVNDMXhydVdFL05aWW5KR3RpaGwvdUdpSDJNWVFE?=
 =?utf-8?B?eC94dUQ4VWhIWW82SXM2WEdsaTZWWEhDcTdrRmJYNXJRWjc0Ync5aENWZEVu?=
 =?utf-8?B?elFXeTByWjVJNUdEMTQ0a2QyS0svaytCZmNmYXVPbUxKZFppWW01dFliN002?=
 =?utf-8?B?TGNOaVMrTmEzUFRTSkkrVlcxK2g2V0NYRFVFaDFVYURQMVBnQVV0VExyWisw?=
 =?utf-8?B?RG0vTFFSczNoaGNRYlhZTFJRd3FESWdYR3BXUURKUnVUVkRmVmdoQit5VWRN?=
 =?utf-8?B?Y2dTTmF0MkJBeVEwUWV5YkpiODdJR3JCeWNlNE1FV1FtYkZtYk92c2xpcE00?=
 =?utf-8?B?NTJqVXZ6REEva3lNNTFVcUtkdkdCM2JJWDhUMU85RHBkRzBqVW9haE8rWlpM?=
 =?utf-8?B?NXlFOENaWmZadHh5bG5ROGVwUWI4NzBrdTZmbFBjT3l0T2FVSUpUMEI5WGlW?=
 =?utf-8?B?OUorSUROWWl3WVh3MmxwVzBDVm5OVGMrK2hvUFIvRmlqN0pnZWZENlVzd3NJ?=
 =?utf-8?B?M1JhN1RmZ3l4aG14K3l6VysxajlhVit6L0NwK0YvODBhajJNOVdqczFnWk16?=
 =?utf-8?B?UmVnTzhBa2p5WUJObldCdVZRM3YrQmtEbDVSblNsbmlXNTk4MlF5V2d1QUQ3?=
 =?utf-8?B?Nld0a2lPZ3hncnJIaVNleFAreGZ3Q2tHc2NMZUxVZjNKSUNuM2dnMTVBQ2dy?=
 =?utf-8?B?dkJTOS90MXE3STlSRFE5b0htTzVXdmtpdURjMHJLeTFhUVozVDZDUUZUODFG?=
 =?utf-8?B?dG9qSjErSVhhMEZKcys5WmozYUVNUHlVRFBmaUdQREk0TFM3YTBpbnJNRUJ1?=
 =?utf-8?B?ZXlYTDAyU00yMC9RQnlYSm9XQU1rb1k2allJdjRHQW1TMkNzbURtQXpvY3p5?=
 =?utf-8?B?SjZzK0owOXBSdldLYldxYlIxUEl0eFFhMnRhZHMwbFZvMXYvbUdKMzhlNVNW?=
 =?utf-8?B?SHhQN1Fnc0ZqYzhSTlJTVS9YcG5vRWRFdzlIOTdpTTR5L0EzSFhHVlRzdFhJ?=
 =?utf-8?B?MkZSd3VscnB1N3QzdDZEbUhpeUorRVh5L2pSRm1QbnEzdnRkSWJLeUpCS3c4?=
 =?utf-8?B?U1cyKzZBUGlnVkUvd0g4eUU0SVVHQnR6QlZZRUdEVTd6TFJDdXV0RU5UV0lx?=
 =?utf-8?B?c2tDV1dDV1hUb1JtTlRVM0J3MHNBS3p2VUV0S05haFZacXlPRlJvK0FlRkUw?=
 =?utf-8?B?TURqaERrbDJVSjRFRGxzZ0V1RkNJV2FtL1hMQmlwVjFtSFY1WWRLaHphdUFo?=
 =?utf-8?B?UENJWmliOGg3VGhyU3VZWGljSDVFRy9CbG81UWxicTNZRHpXcHpha0FDMG1V?=
 =?utf-8?B?YzNaQndJYU9jU3ZxWGNQMzQ1S2dudEFCcisyRHpRek9qZ2NyOGFJcUk0YmJz?=
 =?utf-8?B?NEFGQnM4ZUdRdnYwSi9COUpvQnp1ZnNST1pJMitVZ3JTWjJ2SkFTZXVRVUdJ?=
 =?utf-8?B?dTBxUWFSY3BNZjRqRzJXQ3VjL0lsZWNEM3hkL2dWSEMwOHJBdTRJNVd4bEVM?=
 =?utf-8?B?cTdncFVHazFpcHAzR3RrbFNwc3FIZlJUdzdnYkRJNmd2U0xnL2N6c0UvcFNn?=
 =?utf-8?B?UUgvdlhBdjNtWVNLVzZnNTBTK21oY0d5MEdHRUZRU1RrekxLZXJJbG1RMEhR?=
 =?utf-8?B?a2Y4Y29Fbnh4Z0xoM2JKQXYyQlphRlI3Zk8xeDdlSmUvOUg5cDUzcjlQdURO?=
 =?utf-8?B?alFFR3hleFFzYXVuVnRocEp6TmFKaVVacjE1dFphaXJmYnFuNTljVWpMMUNI?=
 =?utf-8?Q?Mzu3WD2p2rZgdV4Q0rllvZUaj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06e28f64-1424-4be6-0372-08db2c3f4433
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 08:10:44.3531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5g517eHojdDZqFXzNWEZtQX7Tx4OP6UtfWZsgLJCSsNKDOac2MbEZqXXIhsbrIVN+lGokpxKxxJ13NIBHv4JTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8244

On 24.03.2023 00:15, Andrew Cooper wrote:
> On 04/02/2022 12:54 pm, Jan Beulich wrote:
>> On 03.02.2022 14:38, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/domain.c
>>> +++ b/xen/arch/x86/domain.c
>>> @@ -1693,11 +1693,8 @@ static void load_segments(struct vcpu *n)
>>>                   put_guest(uregs->fs,   esp - 5) |
>>>                   put_guest(uregs->es,   esp - 6) |
>>>                   put_guest(uregs->ds,   esp - 7) )
>>> -            {
>>> -                gprintk(XENLOG_ERR,
>>> -                        "error while creating compat failsafe
>>> callback frame\n");
>>> -                domain_crash(n->domain);
>>> -            }
>>> +                domain_crash(n->domain,
>>> +                             "Error creating compat failsafe
>>> callback frame\n");
>>>  
>>>              if ( n->arch.pv.vgc_flags & VGCF_failsafe_disables_events )
>>>                  vcpu_info(n, evtchn_upcall_mask) = 1;
>>> @@ -1732,11 +1729,8 @@ static void load_segments(struct vcpu *n)
>>>               put_guest(uregs->ds,   rsp -  9) |
>>>               put_guest(regs->r11,   rsp - 10) |
>>>               put_guest(regs->rcx,   rsp - 11) )
>>> -        {
>>> -            gprintk(XENLOG_ERR,
>>> -                    "error while creating failsafe callback frame\n");
>>> -            domain_crash(n->domain);
>>> -        }
>>> +            domain_crash(n->domain,
>>> +                         "Error creating failsafe callback frame\n");
>>
>> I assume it wasn't really intended to hide potentially relevant
>> information
>> (the subject vCPU) by this change, which - by way of gprintk() - did get
>> logged before (since we already have n == current at this point)?
> 
> The information is not lost.  __domain_crash() prints current too,
> albeit in a long-winded way.

Oh, right - n == current guarantees the middle path to be taken there.
Considering the other sub-thread also ended up okay-ish:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

