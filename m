Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F9B6692CD
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 10:23:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476943.739401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGGH1-0007QS-AZ; Fri, 13 Jan 2023 09:22:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476943.739401; Fri, 13 Jan 2023 09:22:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGGH1-0007Nw-7c; Fri, 13 Jan 2023 09:22:55 +0000
Received: by outflank-mailman (input) for mailman id 476943;
 Fri, 13 Jan 2023 09:22:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=grKZ=5K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pGGH0-0007Nq-64
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 09:22:54 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2040.outbound.protection.outlook.com [40.107.8.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da6e05ff-9323-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 10:22:52 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7826.eurprd04.prod.outlook.com (2603:10a6:20b:234::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Fri, 13 Jan
 2023 09:22:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Fri, 13 Jan 2023
 09:22:49 +0000
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
X-Inumbo-ID: da6e05ff-9323-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fKNvTp7e5dVmVgOUTTvVrKoRus+Sx6Tb37yxoEJIcOEudNqDPF0x8w7GLIJ6YsG//L0MZaGUKkDTBp8bmH1NzSNkzbCHvfqXZCqo7bQPmFlA1P5LzYiWcf1kwOCqcH+pPKPGHCZar0WxMRf226igflCuKakmo3yzHLm42FGCvEmzJjLn4DlaJLvWIamzQE8QYHioAXmBTsMukXao220U5kSkLIO4f/zTXQRJeFy3VD/tkzQnm83IoSMBo0Z6wF7whEYjTSHgnMPMdCg1QQ3hiJeRS+SyO35Q5RWWNjIDpfhNdKT8ifpWnYcDir+pMSuXyFfKEaMwazPHCgUtRk9IJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wDB8wfV51oHCbqMgc/qPmfMU7RxBN/N8M94+yck2TJs=;
 b=ZZ5fGDpDL5dkl6QoIpnJB/bcVgdGLXaNMukJnMb57BB87xUibpPuGn3mkeDfJfX/rGoC/GCBSMvV7ICmMI1wgOVnMZIe7PAX/7BhG8LyqWMUx8amA7KofPmqvQ4elxS+NDC7MiJFQlp9N5MUTvpcnu7ZVXhoSOFz/nHLjCTHffzBQwXf8JQ1GnDg3TxsmEz9ikD5wUVWd2nInruyIvHpn+c2G79+UXrQuTJMllJES8ln/8PIuHl/4xACAuInEx1TahLXLvZRMH5maaXhxqtSyRxMUmxVMojLPZMWUVkio7nnuo/BBMj6yYvgNM8YJ+Or2lY/OGUHTn0h36pRVvQfTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wDB8wfV51oHCbqMgc/qPmfMU7RxBN/N8M94+yck2TJs=;
 b=RL3TP5H2LHuLcc/CTGCGRVVtTM5gT/lqpW7eK7/Ot2804Iw0BI2HlE9C9PJ2lTS6Fa9xSE96l7PsHDhDdABZ1XwXncDkUmrn2SEYM9NwwrUeHPS4itjVO9VIOnZ6WfOKNzmBqXcpHDN/YVpvMi364lKGEWzHonvTMINWSV1Ud5tcIduKMiJ2wXfhNlH8+CPU3UHoHaFX42EAga14Eu4dNL1j/yMSuz/ceS+wThgg5ZzuN03J/0MIe5cp/Air1IsuxAQ4clbBIJlnSE7IzR2nENRVijymexzWkVvN10FpQtqP9UlfNumigWEi6ibqzfqAOVoR4hx06Df3rr64FZMlVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <aa2c8649-4acd-bcf4-d547-e3609bb1a0a2@suse.com>
Date: Fri, 13 Jan 2023 10:22:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 06/22] x86: map/unmap pages in restore_all_guests
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Hongyan Xia <hongyxia@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <jgrall@amazon.com>,
 xen-devel@lists.xenproject.org
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-7-julien@xen.org>
 <478e04bc-6ff7-de01-dfb9-55d579228152@suse.com>
 <f84d30cb-e743-60f8-a496-603323b79f37@xen.org>
 <01584e11-36ca-7836-85ad-bba9351af46e@suse.com>
 <a99a8246-bc80-07b9-dacc-f117ace37027@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a99a8246-bc80-07b9-dacc-f117ace37027@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7826:EE_
X-MS-Office365-Filtering-Correlation-Id: babb946d-7a03-42bf-fd93-08daf547bd4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RhYmXyd6BpMDp8vW9RKyo7ik18Gh2BEpCOWpzls/Jr+APNCZaYVhEUL4vCoUjGuurn+dp2UG/U6N7ZaHwxZtplXda13y+/rJdjgtekF0suJ4vfaAX0jUhDhjITjSC33CNdORQZ8W6HEWqGFIlMo4tOZBqZSS3XxDV4yx5P46F757ig2wju3roibB3TXjj/z5b4djln2ROj2ku7LABngi0WLZz2ERw0onWInftz4kw7hjbPTl6zFK4fgLZFciwdldit+5rO5Rg2AIhYUKSpy+GXM5H8/Z8qgI1mjoDSLE/oYvNj6fX8DUsLKZTfh2m8+16FqFf26kW1FEV+tZvR1EJzVpZL8fGzTiktQEm0+FB0lP3+n3FL4YjSmkUlkc3wGc+O+/xjFrcbox1XwZFPEpfAeci3EbL16oYNZ/nXSHqn26keo0AXAue4oD1MwrbtfHX+3dX5/yHiZhZ0AcfEqF0TMTor3IScg6Esr9AAK6dIN6GZk7/yu4sdtaAc0kBh422eDPGmuQ5hbo8gmSsNjn2kQCOyg71uY3mxI4RF7oVgFCiR0xIFfB+mCasZGPD/HvDE2oMTYS9ABLpCdzJ5Hdix0o1d37FvlFzN1f9JSXUO2RyfSieqqmY5JeaWRExnvF8t9Djh7LlDo261bg4ofs/XbAA1qKnRCDxa2GtNZ/5DeWgWN9ItW09pBFDL/NBCLFeS/4UBb4kPAfekYNTc0azvFz2WORdZLv5vJ3ye3/v2Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(366004)(376002)(136003)(396003)(346002)(451199015)(53546011)(66476007)(8676002)(66946007)(66556008)(6486002)(478600001)(26005)(6512007)(186003)(6506007)(4326008)(6916009)(83380400001)(41300700001)(5660300002)(8936002)(2906002)(38100700002)(36756003)(31696002)(2616005)(54906003)(316002)(31686004)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckJtZHJGVmxOVTc3ekExOEp2cTZnZEwvdTFTazRjKzJTZklmR3FXU0krTUpr?=
 =?utf-8?B?THdaMDdOQnF3ZnNOaXNNbEpTeDhGRDJWQ1gvcVFNZWNEUkNtZWJ5aUNFSUsy?=
 =?utf-8?B?NUZ2cXI2TlZnMVFuYkhPbGJ6TkdMWjZjRFdFUFJUa3lMZGRTY3hSTll0M1dF?=
 =?utf-8?B?TDBmTlBXK2IvbVVZM0Z2aWpCL0RlTVV3bWlSczlCc0pDZEtubGNncmNhN1lD?=
 =?utf-8?B?dW9qdEdNeFRpQTBnaHExZ1hRSGtWRnRmNE1aRnprRjRBV3lzVEtTeHd3UzFn?=
 =?utf-8?B?dlJyVitzZ3NGL1oxbldmNVBoV05uTVdETnZMTUpMTWx1L2VNdGJ3Q2xVcjBy?=
 =?utf-8?B?NXRxL0NBSFVySzFiMDFPUjRtTXl6RFFodXhkeTd2eHM0TWN3L1liNzk4MTBJ?=
 =?utf-8?B?clJkZXJKaXVYb3BIUzhJZ2diUXdwY255S2VhenNSNndkUTc1MUdkTzJ4NEYw?=
 =?utf-8?B?UlJnYjNyOGJwR0FNejBVSStxTCt0Sy95Ung3WktubVF5bHY2cUsyVXE3Yk5x?=
 =?utf-8?B?OG5mbmlLK2kwNE8xeTlMS2FGSkYwTnlBODY3a09JV01PWGd4TUE2akNlTFdE?=
 =?utf-8?B?ZlQ5UjBRVTZoUS82ams4WG51SDdTQUNJb2piMjJXNS9kbzNEbGJJeU9BNGtx?=
 =?utf-8?B?STJiNFZpUnBKb0FQRVREdnk2ZWVCeXR5cnhKa3RMY0owNnpIbVVSRGNWS1Vn?=
 =?utf-8?B?dXJjQVNXL1pFK1ZTMDJVeWVjRjNjRHBNK1RPRDNPbDNKZFB2bzdXN3lMYnlH?=
 =?utf-8?B?TG85cTFVYlNsUE1FS2djV2Y3dW1kQUtIUi90cWZpVWRxZW5sL3B3WmZJTXlj?=
 =?utf-8?B?Q2dRYUwwYzJZRm1FNGJzMTAvTitkRE5UUitNVkRIUHQrdzF2ZGVjYldXWFVQ?=
 =?utf-8?B?dGg1Ymo2VnI3Zm9rczIvTExReklPdHJWekF6cFEwVHFnNHZlM1dKa3JoNjNm?=
 =?utf-8?B?Y1hWZlZSTW1raldjVDJ1Y1k3WDRWUEI5b0xXVndJZEY3NEpLb3ZtaVRCa3dw?=
 =?utf-8?B?Ukg1cCtuS0cyVXZLRUhFU1BDT3hDSVd0Y3ExbDV0MzRvc1BISU9DcWdOeFlu?=
 =?utf-8?B?YTJWTjlKVjdhaFpaY2F0NGtNZ0hEd0tlRytoTFpiTURPWDdkWUdFdThtWWVO?=
 =?utf-8?B?Z1ZjNHYrbkZ4ZlM2dVdyZnlmaXBEOG01ZWR5VWxXUjY1RFRhNFZ6d0R0R3po?=
 =?utf-8?B?anBDbldKdnJGbFpsNkc1UlVUV2VNUXpxS1FjMjJVMnk0NjJNSUcxd2k5UC9B?=
 =?utf-8?B?eUcwSlBJSXQ3M0pPR3E3MnB6bmc4S2NzT3hMYi8xUzdjcVBVZXB2RDIza2xF?=
 =?utf-8?B?Sk1FK2pUMDJ3Q3BubmZLcVlnUWJ3ZStna1RFbFFRN0hWdE84SWdHMjZrMzdZ?=
 =?utf-8?B?Z000bEJ3d212S3NUUlNNb2Z6aVd6aEpKblhseTJFTUxBeG44S2ZLRm52UFdZ?=
 =?utf-8?B?VG1jMmVWUXNUV1dLemJUMHR2ci9Cc2wwRnVqRUVxOHZPTU90azlWWi8rSk0w?=
 =?utf-8?B?UEthdjgyLzFRUVQ2UVB2MG9QUHF0cGhtVWI2T3d0VmZSYTJmZ3orSEdGc0Zp?=
 =?utf-8?B?eHBBNmlaejJLK056NVMzM21FYWtWOHpLanNSNm91QUhyTTNuSlJ3aG9NZGNn?=
 =?utf-8?B?bmNzcTRIczZqTkFKVnpEcnl0ck9jbnlHN3BxS2R6T0hycXVjYkVMTHNFWE5t?=
 =?utf-8?B?eUtlVEJmaExxNXBMZENhbGVYSHplbysvOUJPZDFzZmppYlhGTndCWlMrRWpL?=
 =?utf-8?B?NmdVbGpBMUNJOXUwVkRZTjJWc0hldGRIcklKR09zSWxFcy80UjBCWWVSZk9i?=
 =?utf-8?B?bGtWZnNneERIVFBuSlVjSGpLQTZoT0Y3TG1lZkRyYStoUXFvUzFUWnh0ZkVT?=
 =?utf-8?B?VWNEcWJvNjd2cDRvdlNZMnVHSlAxem1uejNzTlIrcTkvN3A2ZlYrVHZKUU9Q?=
 =?utf-8?B?Mld3VEZpemxnbU1iajlHUlA3ZWFhOGd1Z1JxOUQ3Z042UlBNV05xUnRSSDBm?=
 =?utf-8?B?ZVdoenkyMFdKSmorcHNmMjFCMHNkd2dxcUI3STFCaXIzZ1I0WklyYnNqdUFZ?=
 =?utf-8?B?UUY0a3NzNUFiVDZyQVMyODJlUyt5NTVjRk9oTWFEaVdpYUp5SUFlYVZVQ3ll?=
 =?utf-8?Q?eK1pnC6yvjFXx6+5fenXDRIoQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: babb946d-7a03-42bf-fd93-08daf547bd4c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 09:22:49.5643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pgipjtgocTbwMMNNGZGKU2LxI4JUZdRr93ZVsIVeoxFa2JOWMoOOA26Lpf0/5HakLhy/Aj0bM0zmn1Gcbth8HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7826

On 13.01.2023 00:20, Julien Grall wrote:
> On 04/01/2023 10:27, Jan Beulich wrote:
>> On 23.12.2022 13:22, Julien Grall wrote:
>>> On 22/12/2022 11:12, Jan Beulich wrote:
>>>> On 16.12.2022 12:48, Julien Grall wrote:
>>>>> --- a/xen/arch/x86/x86_64/entry.S
>>>>> +++ b/xen/arch/x86/x86_64/entry.S
>>>>> @@ -165,7 +165,24 @@ restore_all_guest:
>>>>>            and   %rsi, %rdi
>>>>>            and   %r9, %rsi
>>>>>            add   %rcx, %rdi
>>>>> -        add   %rcx, %rsi
>>>>> +
>>>>> +         /*
>>>>> +          * Without a direct map, we have to map first before copying. We only
>>>>> +          * need to map the guest root table but not the per-CPU root_pgt,
>>>>> +          * because the latter is still a xenheap page.
>>>>> +          */
>>>>> +        pushq %r9
>>>>> +        pushq %rdx
>>>>> +        pushq %rax
>>>>> +        pushq %rdi
>>>>> +        mov   %rsi, %rdi
>>>>> +        shr   $PAGE_SHIFT, %rdi
>>>>> +        callq map_domain_page
>>>>> +        mov   %rax, %rsi
>>>>> +        popq  %rdi
>>>>> +        /* Stash the pointer for unmapping later. */
>>>>> +        pushq %rax
>>>>> +
>>>>>            mov   $ROOT_PAGETABLE_FIRST_XEN_SLOT, %ecx
>>>>>            mov   root_table_offset(SH_LINEAR_PT_VIRT_START)*8(%rsi), %r8
>>>>>            mov   %r8, root_table_offset(SH_LINEAR_PT_VIRT_START)*8(%rdi)
>>>>> @@ -177,6 +194,14 @@ restore_all_guest:
>>>>>            sub   $(ROOT_PAGETABLE_FIRST_XEN_SLOT - \
>>>>>                    ROOT_PAGETABLE_LAST_XEN_SLOT - 1) * 8, %rdi
>>>>>            rep movsq
>>>>> +
>>>>> +        /* Unmap the page. */
>>>>> +        popq  %rdi
>>>>> +        callq unmap_domain_page
>>>>> +        popq  %rax
>>>>> +        popq  %rdx
>>>>> +        popq  %r9
>>>>
>>>> While the PUSH/POP are part of what I dislike here, I think this wants
>>>> doing differently: Establish a mapping when putting in place a new guest
>>>> page table, and use the pointer here. This could be a new per-domain
>>>> mapping, to limit its visibility.
>>>
>>> I have looked at a per-domain approach and this looks way more complex
>>> than the few concise lines here (not mentioning the extra amount of
>>> memory).
>>
>> Yes, I do understand that would be a more intrusive change.
> 
> I could be persuaded to look at a more intrusive change if there are a 
> good reason to do it. To me, at the moment, it mostly seem a matter of 
> taste.
> 
> So what would we gain from a perdomain mapping?

Rather than mapping/unmapping once per hypervisor entry/exit, we'd
map just once per context switch. Plus we'd save ugly/fragile assembly
code (apart from the push/pop I also dislike C functions being called
from assembly which aren't really meant to be called this way: While
these two may indeed be unlikely to ever change, any such change comes
with the risk of the assembly callers being missed - the compiler
won't tell you that e.g. argument types/count don't match parameters
anymore).

Jan

