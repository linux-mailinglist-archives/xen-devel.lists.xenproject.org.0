Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FEC6C1018
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 12:02:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511834.791136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peDGn-0002Xe-VT; Mon, 20 Mar 2023 11:01:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511834.791136; Mon, 20 Mar 2023 11:01:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peDGn-0002Uu-Qr; Mon, 20 Mar 2023 11:01:41 +0000
Received: by outflank-mailman (input) for mailman id 511834;
 Mon, 20 Mar 2023 11:01:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AUe7=7M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peDGl-00028q-GX
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 11:01:39 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20607.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95c85066-c70e-11ed-87f5-c1b5be75604c;
 Mon, 20 Mar 2023 12:01:38 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9582.eurprd04.prod.outlook.com (2603:10a6:20b:471::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 11:01:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 11:01:31 +0000
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
X-Inumbo-ID: 95c85066-c70e-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CNNGcXlpiSCh9GDeHXzcU6sbCf8ogufd8ldLwIhm7dea18VKouer9JAwjFsBcb+nki6Lv3la1sgKklR4i7zwhkfuJ1GDHFBfmL7HHKGiIJyaW7VkzzJO0tnaXxEuWIGAvhNQ1V0G1dZThkvF+eX1kIzrtstpYdgPr2WcNHSRgDFt9Q03sDToY/CCTpBU1D4JTyLAl+MajliOQRPkuj2imgHAKC8XTxvZqfqS9xQzK8PR1VgfHyncGrNiw+xvjXm9w7OEFWOKg8hc49unOOyV+CbTvWnoS+ETAYxodI88boynYQyA1GOx8XN6os6tnTFH9YegsMdhAatH7B2+Yd9nAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7euEy04DWu7SHJGAnJXvrE74ZCROgb3Jl6BV4SgQmyE=;
 b=EOvFfMfAYhuLUFUwyTlgppkd+i6/H9rfA6MW7cUNRSmn04K9RtVSm4gT/IB/8OBkh0upuFoWNVv20ufGS6K+HqcIdAn5KDpvmf5vWg6Gp66dKzShdLy6hAGcDoHhQFo1Xs/f5wXbEWrmXXcuwjtGciAjchzJ/x3czTjdIBekrKfPBmWuQNJtJRAm4jd5AwLo9ZlPVD5kLJQLXYQhVREgtgkzJeHLSnpQZssf1qtUkS9VUpnDz1A3VmGBAlK0bxzuvsqQJp++qRrrXD6aSPTO2Qyz47IU9aIT3N3NfSoySTlAdV6tdYSAF00Nss7Ngl96+8ABnknsX6epC3Yohp5mgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7euEy04DWu7SHJGAnJXvrE74ZCROgb3Jl6BV4SgQmyE=;
 b=zYbsY31xDA/TbTQ/r7gNPjD1MvvMJ6tJjEjmGEnutwXqSRma8Hjcvtg4tW898qxaaupAAkCOm4n3AF9CRaVijSu0uo/l3m0/G4QQO382+OS27g4xafKUIYiVZ/HV+YSquUZGKQkTEbTzIbH/aJKq9F1lTKc4JOYEzC/Im6JK1UMdmzJEU7ErVBkvIkfiS9eJzynleTWcW1lGLoEGLV9OHKKxYM4EvxPtOtq9NXIod7LeXGW1cQsz602x4XrVwP9j4XBBVJe4FC6ZkW6DVQC81umaq67cEhbDsArlVveK3RmvX37QvoOeUKWNp4W7Sxe5ItAFLxw5ZvUvkD1jlSORqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8aeee329-460f-0f79-a381-2dd0559e01d6@suse.com>
Date: Mon, 20 Mar 2023 12:01:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [XEN PATCH v3] x86/monitor: Add new monitor event to catch I/O
 instructions
Content-Language: en-US
To: Dmitry Isaykin <isaikin-dmitry@yandex.ru>,
 Tamas K Lengyel <tamas@tklengyel.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Anton Belousov <abelousov@ptsecurity.com>, xen-devel@lists.xenproject.org
References: <858e4c67d14ec9d9c6737dd0b33056e3610c00f6.1679054228.git.isaikin-dmitry@yandex.ru>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <858e4c67d14ec9d9c6737dd0b33056e3610c00f6.1679054228.git.isaikin-dmitry@yandex.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9582:EE_
X-MS-Office365-Filtering-Correlation-Id: d96799fa-a603-413d-c9f8-08db29327646
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CmzU6W0VnJOEeb9PE9EKeokZzlZf3pxNZEX4/+Q3eqEtG52AA8aef1kgo6O6elVoZGpQdHGiRPmGo3QzIJLC+71LiOg1Uvva6bOA+K9QKag50CmOKY2rl0zkD0XQNeB4gv08Zt7cwqHR7BezGub60/slu2K6hvDuPIcZM8NTQkBxlB69QXqYJYZNYdQiQCYz3ilfyOu3ZS4eHytq9HMjY7J3e0NfwO1q23J9olRWTQhslAUXUCdpPsL9QLPVB1NeYV9GC5zeRGVFV1lDpglKhqVwM0SPa0n445Mr0zxentGv9WUDsvhpG2+0XAaXNQCb8uQ5Gw5rmusnsjP9yq8kVetCVFbKllaXhxxZtj6rPd0B8kK8MlZhEwyIIEkCXF+rCsfBE+plIC06Aoe7jr0j295unCHmf6NJ5lfEl0IvfaSE8QodKi5Ix2qH4VfOWjz23n1Ug1Oqnz68LooNcBQj5y7X7H2NqVMjuX6ULVf43zm1VHgTm2uE/CiZB0HeIROmjD7qrAxBtxBsVhjiZSiv252bgQTLiuL06MoU2Im1D9ynVSGsF5FJ7zAhf+20tAtelKwwi5BbO625hPyIamAsMCUpIqKmI6Bsr1Ao0VvXttdI670Vsj00oAxaYoSgpZytl3mF2X8T0Sfx4LLEFxzu2PdTGkfDTC2mcES83AFctNotYm60VrZuYv311T5u/jcs+t/3OtsoyWt0lHqO1vT/QjhQwEf9V3yDgwi4gQWFR6g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(366004)(346002)(376002)(136003)(39860400002)(451199018)(6486002)(2616005)(478600001)(83380400001)(316002)(8676002)(66556008)(66476007)(66946007)(186003)(26005)(6512007)(6506007)(54906003)(53546011)(110136005)(31686004)(4326008)(7416002)(41300700001)(5660300002)(8936002)(38100700002)(2906002)(31696002)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXRxQ0MwWXVZQkRLMTNiNytXSlcyTzR0T0pWQVluWG9lZHZ1MTV2MU9kaTZo?=
 =?utf-8?B?ZHV2Ym9Ya2JucHVRMWw3ZjgxbWhEUUxUUVQzODlpU012dkNpMDNodkZtNXps?=
 =?utf-8?B?dFdsb28veUI5blJZRkRoM3RUTU5hWXBia2xoOHd4K3VmQzBudUVqbVBaQnpP?=
 =?utf-8?B?Rnc1MVVQTXMxV09EY3Z5RUdvTU5SNzZHSkdqYjJzUTl5L3RTd3FkRHBFU0VI?=
 =?utf-8?B?aDFKQlhBSmJQaS8xZ05uU0s5Q3YwYUo1Qk1KS3dTVGpVWWRLSkdnUE9COVB3?=
 =?utf-8?B?UVNSeFdXNERMb2tQeFZ4Z0VwREx2RTczWklWbm5udW9JOVVHZCs3Q2JJenhL?=
 =?utf-8?B?cXZCVm5BS29nMUVEZlBUb3JFd0NLcTM1aDRNZGQ4bHpSMjNieUdxMVE3SGxm?=
 =?utf-8?B?NURDUVh2SHRlRkdBemZVOVMxbUJxbWxzRzJrYkZ0d0JzMzZpUjRneU9kUVFV?=
 =?utf-8?B?akd1bFdETWM1S0tEa1dQYnRuVklQenZlR2FqVks1Q1NxTlkzeFE2Qkg1NmRy?=
 =?utf-8?B?V2luS0wzellDQi84QXEvWGdzVWFYYUQyZDFFUlRjWmdYbGRJRm5wOGF1SlVX?=
 =?utf-8?B?UUNsZk1ZYVpVVERMazFERVVTKzFESno1YUprRDFwRC9jUGVlYjdiazdKL0ty?=
 =?utf-8?B?WkJnZUIzNG1vVzIwZXpPNm93RjBDeEtNbE9TQTJHK1hkZVFNei9UZUthT3V5?=
 =?utf-8?B?TFFHQ3BLTHZIT2srRXo5YVIyZHpWdTNBSGlNeGZnaTNhN0RtUUhWakMzZ25B?=
 =?utf-8?B?Tk00Mzd4Qmc0US9rdHhHbVNwZWMwdXhxNUhTTVMwbVR5VXp6eldFZEU3S25y?=
 =?utf-8?B?Q2pvMU9zNGZPM0FqRGxaZzNEMUF3WjFZYTdIcktXZ3NiZVdyQWhidGpiNWgy?=
 =?utf-8?B?VUtzTjNhZ0lVMElyeHJMb3UzSHRxUTJBd0cwZnp4RzVsWS9MUitocDdjSUVw?=
 =?utf-8?B?ZCtxR2FkN0hLT1kxZGM5UFA3RjAxL0g3Y2JtOEQzdVh4T2MvcnB5QXZOR1JQ?=
 =?utf-8?B?d1hjWVZEVGdPb1FiRVhNOU9DS1JXSDZlU3VrNW41Vi9ZZGFGWmJ4bm56Kzhq?=
 =?utf-8?B?cmJkaHJ5NTdXREE5ek81RkJ6djJZTG5ON29NMzhLRFUrQ1V2VlhoZkNOUTVa?=
 =?utf-8?B?T0NweVRURHhKekNRam9US3I0b2d5eHlQNml5YVI5MkhkOFByVU8rSWdUckIv?=
 =?utf-8?B?RjkwMUtUZzhVREtKWnp4ZHA2NDBzZnk2NElPcnYwcnl3ZEkxOUZub2lRZ0pE?=
 =?utf-8?B?NFdKNU5tbVE2TGVtZUVtMUl0NElOWXBJNy9rb0lkOGwyeUxEc1lxVWtUc3Nk?=
 =?utf-8?B?WDlwL2VLQ3JDOFJOVFo3R2pHblBQN0ZaRUk4czRtV01iNXo1V2tLTXllOURK?=
 =?utf-8?B?NjYwVXRiS1dWbEVrclBOOFFzbzBUa0VXTmFLR01YYldLZFZwdjcyV25MM3V0?=
 =?utf-8?B?akRiRWdxcFRUTTlIR2tKYnpNcmRJdFpGNUZma2owYzg0djQ2Rk1sNlplRkJv?=
 =?utf-8?B?aCthOHpNM3hsMzVaUjd2Yk42NExvSmFXOCtUQjBTTHBkOXpaaHArVXpCVGo5?=
 =?utf-8?B?cVJYMzRGNmppcGtRSUxTcDgxOFVad0E0ZWJYY0NTbXZHcVZvYWlpYXVKYkhr?=
 =?utf-8?B?OFBIWjF6MDVMaytVeXUrZlpGTzV1NitKSEF5VFNTOTBJMURUTTRuZ2tLbWwv?=
 =?utf-8?B?Wms3aGpYNTJUdTY5R0IzVGErRG1rOFp6SG5OVkVVTjN3dUJNMnAydzUvQW1Y?=
 =?utf-8?B?eTBMaTRFSmxlMFZMRUg2WFc2Z04zSGxKR3kwbTJ0bDJvMFRQZ2oxR0N0VHF6?=
 =?utf-8?B?UlJ5MER2NzBlRGNwbzJDNXpZUnQxc28rUU1TYWpiN21OK2QxUTMvSFp5Y1p1?=
 =?utf-8?B?R1ZJd0RaYVdHdFgrWCt2VVNMNlFoZnFTWWZPU2hOMW8vMEY0U1lFdU9EcWhO?=
 =?utf-8?B?cTIzT1hjQnlRTVdSOVQzNkFENWFybFVFcHZONWE0b3RZV2d6anVSQytxZ1c5?=
 =?utf-8?B?a3hUeFNqN2VYSTRpT05PdkE0anBHZ0lhcmZRWlozRzhoSUFLTjQ0VjJ0Znhl?=
 =?utf-8?B?YndRRmhnaDFoYW4yUFZZblhSU21meDZ5Um04aHRrTkhnMXJjQzFicCtIMHps?=
 =?utf-8?Q?T2Zf6/+mV/thmCW2cjre2Q3lv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d96799fa-a603-413d-c9f8-08db29327646
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 11:01:31.3761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6xCk4e80XyAAHUJdDugNfPYb6PM96loXQNB0wq/363XDE+s8OW8biK2ZCFo3lg36hggiYpNFshy3246wWJOvkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9582

On 17.03.2023 13:01, Dmitry Isaykin wrote:
> --- a/xen/arch/x86/hvm/monitor.c
> +++ b/xen/arch/x86/hvm/monitor.c
> @@ -346,6 +346,27 @@ int hvm_monitor_vmexit(unsigned long exit_reason,
>      return monitor_traps(curr, ad->monitor.vmexit_sync, &req);
>  }
>  
> +int hvm_monitor_io(uint16_t port, unsigned int bytes,

Please avoid the use of fixed-width types where not really necessary. See
./CODING_STYLE.

> +                   int dir, bool string_ins)

"ins" is an ambiguous abbreviation, even more so when anyway talking about
x86'es I/O instructions. You might consider simply omitting the suffix, or
alternatively I'd like to ask for "insn" (my preference) or "instr".

> +{
> +    struct vcpu *curr = current;
> +    struct arch_domain *ad = &curr->domain->arch;
> +    vm_event_request_t req = {};
> +
> +    if ( !ad->monitor.io_enabled )
> +        return 0;
> +
> +    req.reason = VM_EVENT_REASON_IO_INSTRUCTION;
> +    req.u.io.data_size = bytes;
> +    req.u.io.port = port;
> +    req.u.io.dir = dir;
> +    req.u.io.string_ins = string_ins;

Having these be the variable's initializer would probably be more in line
with what we do elsewhere, including in many cases right in this same
source file (yet sadly it's not really consistent).

> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -4560,7 +4560,24 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
>          break;
>  
>      case EXIT_REASON_IO_INSTRUCTION:
> +    {
> +        uint16_t port;
> +        int bytes, dir;

Since you move it, "bytes" wants to be "unsigned int" (together with "port").
At which point "dir" ...

> +        bool string_ins;
> +        int rc;

... can share a declaration with "rc".

>          __vmread(EXIT_QUALIFICATION, &exit_qualification);
> +
> +        port = (exit_qualification >> 16) & 0xFFFF;
> +        bytes = (exit_qualification & 0x07) + 1;
> +        dir = (exit_qualification & 0x08) ? IOREQ_READ : IOREQ_WRITE;
> +        string_ins = (exit_qualification & 0x10);
> +        rc = hvm_monitor_io(port, bytes, dir, string_ins);
> +        if ( rc < 0 )
> +            goto exit_and_crash;
> +        if ( rc )
> +            break;
> +
>          if ( exit_qualification & 0x10 )

Please either use the new local variable here then as well, or omit it
in favor of using the same expression in the other function call.

> --- a/xen/include/public/vm_event.h
> +++ b/xen/include/public/vm_event.h
> @@ -160,6 +160,8 @@
>  #define VM_EVENT_REASON_EMUL_UNIMPLEMENTED      14
>  /* VMEXIT */
>  #define VM_EVENT_REASON_VMEXIT                  15
> +/* IN/OUT Instruction executed */
> +#define VM_EVENT_REASON_IO_INSTRUCTION          16
>  
>  /* Supported values for the vm_event_write_ctrlreg index. */
>  #define VM_EVENT_X86_CR0    0
> @@ -388,6 +390,13 @@ struct vm_event_vmexit {
>      } arch;
>  };
>  
> +struct vm_event_io {
> +    uint32_t data_size;
> +    uint16_t port;
> +    uint8_t  dir; /* IOREQ_READ or IOREQ_WRITE */

Are you actually sure you want to tie the vm-event interface to the ioreq
one (this is also a question to you, Tamas)? It would look slightly better
to me if this was a simple boolean named after its purpose (e.g. "write"
or "out" when it's meant to be set for OUT / OUTS and clear for IN / INS).

Jan

