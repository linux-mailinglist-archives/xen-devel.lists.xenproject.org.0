Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 488376F41B2
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 12:35:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528470.821657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptnLa-0001S1-HP; Tue, 02 May 2023 10:35:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528470.821657; Tue, 02 May 2023 10:35:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptnLa-0001QK-Dg; Tue, 02 May 2023 10:35:02 +0000
Received: by outflank-mailman (input) for mailman id 528470;
 Tue, 02 May 2023 10:35:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ptnLY-0000rl-8h
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 10:35:00 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061a.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc38dc79-e8d4-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 12:34:58 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7323.eurprd04.prod.outlook.com (2603:10a6:102:88::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Tue, 2 May
 2023 10:34:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 10:34:55 +0000
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
X-Inumbo-ID: fc38dc79-e8d4-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QxBayhTqCq0MCoE3vWzmlDwvCQWYI9X1gEybsZapi8KRUBLwOgtJQf4HtcR4qkDCGuZZ8OFIQYS8G4qvbxrfFYeVryjVSYqC+6qfgfwXHCZa8JEzjKD/ZAZsOs9WsnCsd1zUmspgrjshLSRPbbB6g9Hm7vE1VaOC3eUKfZU30sd0Jw8B1xfwUaDIWkcakwqSad5A82KkwMt2ie2WxdQVFfCsmge5XJv+xAnctnHiSulTE4qOeljSKYaKW2oKG0/OuO6vm6rI8jyufUHbi/VyUAVUy20erttOTAytvBmgD9iz0qKjUdd+zoPLqm7j3d+IcabsCC90W6YWHkXi8nxYkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d7BwD3nBy3IrkV7OT7lKA7OJfSsO4zE9CNbhIE0PTCM=;
 b=lhCIcastGiIvCz1c6MR7uQEHKyjlFR6sNDkLRVuuj5aohdtqZTaEgzg6Nm4ZF2rjGPm3KldGeQQ40BFUy5QtZsPI7zq34jc2CTCRsOrhaNPG+3GhMXnhEm/CamJ/HzIrLIZtAGHEOS8M7emENYwn3Toka+F7rHuQWl7FjCLy1AeN2238D11AbgOm52XpVGqcouv5xDIal+GStngJLAbTHn61PdK34sGxG2xhgzeULcyqg53YJs0yNoPiPH4HVApk/i/grmh3mj9hTsBcaT+cALC10WsE0xplJiCp9EQ0LPkBiADe6U+wd6M+9D2AOFiCYooNAPUMufGpwgIIM1xnUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7BwD3nBy3IrkV7OT7lKA7OJfSsO4zE9CNbhIE0PTCM=;
 b=t54zU0UAhhEYHFPHE0FuTBGn4y4kTjH4tLgAtCtRQfYWU5igA7uo6zv6D14kEznIRhIPseh6386muAAd/5tm1Fveh4b9JqBp4POQSVZUSzcMJrEjDxeus8O9A5ohe8VepzawtnNl/LQwTvBOXsnvtoQ8fs7nWnjqieKzFQrR/Y34ygvQjBSwBEHwGcVy04o2VmpyepAtjn2a6yjN8EgBbhv2o18KRAa3ijFLWMRSYVpoOcRcf+ijcIwv80UnTacTQ1Zst2N8Yh5T4+zo1C0qWsmCiW7urs4AawBQS+lozFhzh1cnC0DP5hmo7m5c9YkYlpo4Ll7KnNA1B4IVYq9w7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3154d046-7ba4-63c7-e2c0-9a7e06128ebb@suse.com>
Date: Tue, 2 May 2023 12:34:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/2] x86/head: check base address alignment
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20230502092224.52265-1-roger.pau@citrix.com>
 <20230502092224.52265-2-roger.pau@citrix.com>
 <89389465-f32c-7dfe-f62b-b957e2543cb8@citrix.com>
 <ZFDl6rSYRzNEoVX6@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZFDl6rSYRzNEoVX6@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7323:EE_
X-MS-Office365-Filtering-Correlation-Id: 72169607-6f3f-4f7a-ce70-08db4af8dee1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Am5vrgLOQDuYhZt/PD/FSXEOEMv/Z01pR5H0rSi2Vef+/BjJM8At9q3W20q1yx/xfo+1upEwDo4JKeeYYLipjw646KUNUuEG7gB12A+pUCHriwwBnkz5EHjVEDyOOCSx3CcpQxf4j6NkE1z0YgY3nesVVdz9S+Q6xeQd8vXWoUNL6CQr2D3OQXIeaGmCu/rltce8pAkjl4HgSiNQU4scns8Q60O2tz0e+n0Cld42rJL9Gr7GWxA/+uYBI5GemQ08kTyrbqfDzUb8Qtx0L67hvJOh+2IrlWqiXcex2pP5tCns8FtrCU1n/SM0HH7IeaxNkBsX7RJipypAw6mAbEGojvynM2jdAtxTufKsDOntMWEaqBnXN2GmDb3oWTWWZrJkksxFzJbuGCPUlU+XJAfQkOUoxuJsHGSVA3Ew/DjrhDzbjOKDonvCFyIBdKZvhAu1uIrQvxiqx+WudTitZsPntlLLTaHfL0rP0SaWK4A2HM6EdLLh12WJssDeOiiblmgTBHPj/26HKunsTXos/YQwet/7xLDdm5aARo++Tq57yhP4v96luCcCpzoJUX2uv3pwe0qej/nHG/8asAkG7mImGQfpAx3t/PkUgSeYJ2rTYb7QMyjmerafEfTYJ9V8rPJeuaw5iJO0klw7bTyN3CjySA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(396003)(366004)(346002)(39860400002)(451199021)(5660300002)(8936002)(36756003)(316002)(41300700001)(31686004)(6916009)(2906002)(4326008)(8676002)(66476007)(66946007)(54906003)(66556008)(478600001)(6486002)(186003)(26005)(6506007)(53546011)(6512007)(38100700002)(2616005)(31696002)(83380400001)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFJCMmpjVm5vNmdUejFKSFdSQml2OEhzYVhtU2lBMzhSMTVWM0xvOEdPQUdL?=
 =?utf-8?B?TWFsdU8wVTBpbWZLTndpS0piSnN6Vi92WUFZbDR4Yy91OWpTMTlvYUU4T0FB?=
 =?utf-8?B?MGZ1M1pRd3JhcDZOcUtreWN5Ny9NcytXNzNtbnU5TE01dWM4WEFhL3ZxS2ls?=
 =?utf-8?B?b1laNk1rMFp4ZG9jMWVUUER4THI2VlhHbXJGcmRrclQ2NjBzMStseTQ1ZERw?=
 =?utf-8?B?MUZUMFJNSDMzaHBwaWw2dXdpUERlWkVyQUxjRU5BZ1dGMis3UFhXbHJLMHFN?=
 =?utf-8?B?WkJ2WXFkRGxUOThCQjdtS2IwNndmMVIrNWxERVN6b29pTzZOcHNkMmpuQmhG?=
 =?utf-8?B?MXU4cGZvSnA4RG50QmxSWmtwOXdDcjlOcXgyRHV2UDVXTGYrc0kwdVNpOU9s?=
 =?utf-8?B?R0NGNDgrQ1NJeUlndUo3YU13SmtSRytuYThGalBWUExxc2tBSVpqa1UrdWhV?=
 =?utf-8?B?SnF6aEhlNmwxdk5rdGVHY1Vqcm1LNmdueEVaUlFvL0txaFJWRnBrbGtNbXNM?=
 =?utf-8?B?WUVPcmN5OG0yYlNYRW0xUjRLUzlzMk9RWUh0R1Avc1lNVG5LU3UzajFjaHNH?=
 =?utf-8?B?enR1VmxmOVp1NW9xUmppWkloS2hNdnhPM0Fjd296enpyK2FCd0RnUlQ0OTdR?=
 =?utf-8?B?UzVFbEo1TVFqSU41WTMvYUFBY1cxNlh5bmRFNmtVYXR1ekZYRDc0QS9aMmR5?=
 =?utf-8?B?eHhES3R1TFZkVGV2bUFXVlB0d2xnOGVWYkc4TllBZnJHcHg1R0lMYUN2Rmlu?=
 =?utf-8?B?VEE1WXFTNDZGUmRDdlNRempLRjNXWERVTkEwOVIyVzMvYm45YjA5NE4yS0Vt?=
 =?utf-8?B?a2I5RG5SWEZYZVV1V01iR0drKzR6QUNOWkpQbTQ4dXI5ekpyNTF0NHRsY3do?=
 =?utf-8?B?N3JvYXBqR1F5QjFIZmw2WnQ3RVZtN3hvYWFOSXYvWWVQWUVFYTF1eXpWcVVS?=
 =?utf-8?B?QngxQ0FOblBVNlFzZ0tnMnh5UVNEVGc3Vkd4TmFEdGlQQ0VFSWoxVG45Skk4?=
 =?utf-8?B?NkdiOFp0VkRTeU9qM0JjWUxGZGcxdzhuVmRuYVhqc3BqUUJLVTk4WnZ1RGYr?=
 =?utf-8?B?bmhja2JkYTVuS3FDR2tiY1lhWG5OZmhIN0Fuc1FqWnQ1OGJtRWtaY3dCbkJK?=
 =?utf-8?B?Wk5uT2NQdS9oWmVnUGJHa2s1MURnQmZZOHVoaFVHS3FjT0hZUEFyc3h2UlBw?=
 =?utf-8?B?WDR6SjVzT3phL015L0h6Y2hrQnpjbVJaN0RBZ3ExSkdZd0tNNWVDaUdOVzB3?=
 =?utf-8?B?blBlZldrNzVLM3JtamxmSGZZaFRWUzBNc2tHTkUrVHpmeHR2NFZ4OFlrVEpq?=
 =?utf-8?B?UzFOd2JKcUU5TlUySG15T3dxUWF4R1hxQ09vN1ErU05mbW1YZkRzVFlKMnFS?=
 =?utf-8?B?R3dEVTdPdk9kVHAxWi9USGdvcUNDOHorbVkzd21kdlE2Z2VyRjBSWjZGSjFu?=
 =?utf-8?B?djFPdGdxVHo5dU9SSVpqR01ZK3Y1VHJqTkJFSzIyV05OZC8xejdJaHVJMW1z?=
 =?utf-8?B?QmUxRVV6THY3RURsQUhucmY4N2xkQ3VuUjViYkQxaEgwdW9TVDEyR3JQdHVW?=
 =?utf-8?B?aHBuZ3JRVHZNVGQ3MW0xK05MSjhjZlcwQ3RiVFBUT1FJWXVzeGl6TlMyZDlk?=
 =?utf-8?B?aVlLUWloLyttSzJ2RGUxTlZJVDZPdUlsZGx0ZW8rUWQ1elZQNGNRUStqdDFV?=
 =?utf-8?B?NE5aSFQ3VEFmcjBUVGFiSXpsNlFkSEFHNjNSaHhSZmgzVStVZVVYNURSV2dj?=
 =?utf-8?B?MnRsazFqSkorWkwyb0Fwdzg0RXRNaXl2M0F5WEtUQW8zbkduQ3Jabkw2WlIy?=
 =?utf-8?B?aXdLYTdzemdoK2dmTkdrcElWTmJPQU90YXk1LzcyaDMwUGl0N1Jsa2Ezck9U?=
 =?utf-8?B?MmJJTy9tRFdzdVJWelltSFFrdEh3TW9mUHJVTUprU29QUEVNendGbkZ2ZnF1?=
 =?utf-8?B?b0lhc0hNWFYreEVscUc2VmI1T1FaVjJkTHBZVnlYNUtlUWg4dnBKZVFWbWtY?=
 =?utf-8?B?Y3dNTlVxVE01NXJSN3pTZXhzdUI0dGM2VCttT0VjYlVKYkZDZmN2VlBiMGx5?=
 =?utf-8?B?UVg2aWZYWlprekJ2ZDB1WVlyNld4SkUwTW43Q3M5NkhLcFFkWjB1amMwdE9T?=
 =?utf-8?Q?ZZP7GnbZpRzYM9J7SjZ+LxFdO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72169607-6f3f-4f7a-ce70-08db4af8dee1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 10:34:55.5963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qj1VzCQl1bBAsVexQYlsOqFxcj0EMwI6uODGarzCR6iucutfovXI9ZnWViPU3SiRBiWpF9MmJV5rU9jDiXgS4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7323

On 02.05.2023 12:28, Roger Pau Monné wrote:
> On Tue, May 02, 2023 at 10:54:55AM +0100, Andrew Cooper wrote:
>> On 02/05/2023 10:22 am, Roger Pau Monne wrote:
>>> Ensure that the base address is 2M aligned, or else the page table
>>> entries created would be corrupt as reserved bits on the PDE end up
>>> set.
>>>
>>> We have found a broken firmware where the loader would end up loading
>>> Xen at a non 2M aligned region, and that caused a very difficult to
>>> debug triple fault.
>>
>> It's probably worth saying that in this case, the OEM has fixed their
>> firmware.
>>
>>>
>>> If the alignment is not as required by the page tables print an error
>>> message and stop the boot.
>>>
>>> The check could be performed earlier, but so far the alignment is
>>> required by the page tables, and hence feels more natural that the
>>> check lives near to the piece of code that requires it.
>>>
>>> Note that when booted as an EFI application from the PE entry point
>>> the alignment check is already performed by
>>> efi_arch_load_addr_check(), and hence there's no need to add another
>>> check at the point where page tables get built in
>>> efi_arch_memory_setup().
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>>  xen/arch/x86/boot/head.S | 9 +++++++++
>>>  1 file changed, 9 insertions(+)
>>>
>>> diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
>>> index 0fb7dd3029f2..ff73c1d274c4 100644
>>> --- a/xen/arch/x86/boot/head.S
>>> +++ b/xen/arch/x86/boot/head.S
>>> @@ -121,6 +121,7 @@ multiboot2_header:
>>>  .Lbad_ldr_nst: .asciz "ERR: EFI SystemTable is not provided by bootloader!"
>>>  .Lbad_ldr_nih: .asciz "ERR: EFI ImageHandle is not provided by bootloader!"
>>>  .Lbad_efi_msg: .asciz "ERR: EFI IA-32 platforms are not supported!"
>>> +.Lbag_alg_msg: .asciz "ERR: Xen must be loaded at a 2Mb boundary!"
>>>  
>>>          .section .init.data, "aw", @progbits
>>>          .align 4
>>> @@ -146,6 +147,9 @@ bad_cpu:
>>>  not_multiboot:
>>>          add     $sym_offs(.Lbad_ldr_msg),%esi   # Error message
>>>          jmp     .Lget_vtb
>>> +not_aligned:
>>> +        add     $sym_offs(.Lbag_alg_msg),%esi   # Error message
>>> +        jmp     .Lget_vtb
>>>  .Lmb2_no_st:
>>>          /*
>>>           * Here we are on EFI platform. vga_text_buffer was zapped earlier
>>> @@ -670,6 +674,11 @@ trampoline_setup:
>>>          cmp     %edi, %eax
>>>          jb      1b
>>>  
>>> +        /* Check that the image base is aligned. */
>>> +        lea     sym_esi(_start), %eax
>>> +        and     $(1 << L2_PAGETABLE_SHIFT) - 1, %eax
>>> +        jnz     not_aligned
>>
>> You just want to check the value in %esi, which is the base of the Xen
>> image.  Something like:
>>
>> mov %esi, %eax
>> and ...
>> jnz
>>
>> No need to reference the _start label, or use sym_esi().
> 
> The reason for using sym_esi(_start) is because that's exactly the
> address used when building the PDE, so it's clearer to keep those in
> sync IMO.

Hmm, while I see your point using sym_esi() here merely means
subtracting __XEN_VIRT_START. Which would better remain 2Mb- (and
even 1Gb-)aligned (and if you wanted to guard for that, you could
add a build-time check instead of a runtime one, e.g. for sym_esi(0)
to be suitably aligned).

Jan

> That's also the reason for doing the check here rather than earlier,
> so it's closer to the point where the value is used and not being
> aligned would lead to corrupt entries.
> 
> Thanks, Roger.


