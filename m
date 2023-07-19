Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BED758D7F
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 08:13:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565580.883828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM0RL-0004FC-G0; Wed, 19 Jul 2023 06:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565580.883828; Wed, 19 Jul 2023 06:13:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM0RL-0004Cg-Ce; Wed, 19 Jul 2023 06:13:35 +0000
Received: by outflank-mailman (input) for mailman id 565580;
 Wed, 19 Jul 2023 06:13:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qM0RJ-0004CD-WD
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 06:13:34 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20610.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 624d6e1d-25fb-11ee-8611-37d641c3527e;
 Wed, 19 Jul 2023 08:13:31 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBAPR04MB7223.eurprd04.prod.outlook.com (2603:10a6:10:1a4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Wed, 19 Jul
 2023 06:13:30 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 06:13:29 +0000
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
X-Inumbo-ID: 624d6e1d-25fb-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZzajBYHtEypvanAvT4ILeLWDNtWAJ2x8Zh06hKCHGr4CsJso8CMdEHRVDXXjEWqoo5bOP/zOKvf9GNx4252WqMppTYY8kHFueFgs6hJIRtPCj4+jSzCzzr3DhOSDa7RfuZW+yUdpvknuJ7IuFw1eaH2WzMnA0chreALYKJ3xBu+5qxblaagEUAuoMS8dW491P+3WqIBD0v8xA/eMpaORfmoYFZXZk6kZ2XzgYD5poz5H6b8sFSb++vh5r+16NRJMSI8PD5ZSfK9snjDv17sNocqey3RRv+X2QFB2W2MX7L/QwEGIAb7z88y1GI1Jl5D80PiTpZc60cWryVZBFqGvJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EkWYARiSVOLsksrPhMJk5Smy0GzNf2Gmjw33xbrrDSc=;
 b=SMaZ8G4e/G//RmQrlkPC0A73InHux4eOaVS6yeEb50HrhSESpJLPaAl0N8lfuhnuLxXmd8btJQ2idXBrsCCORHkvp3wVvRfR5dB1nt/TbmLDmm8rzxUXuwl2ILgzoSkx2IEJoJlU42yivg/yHRNchef+1ZfQ2NrmlL4retSi6rKOw5xRXpO195fj3qnN82VBQM1olltvU78eHfw6qdhcnvon3fd4g3F+xlnIru3wxEvIv+HXxDyHJ5hKFIbWDDsmeXigwefTYykDyUxZV0vy7hlY1gAKy1GftJkQEifVHHEjiK22tuS7UqF23yjCIQI82SSIifgMe+ovagKPQOfKGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EkWYARiSVOLsksrPhMJk5Smy0GzNf2Gmjw33xbrrDSc=;
 b=ujiyHNbKUqgyPpWH0/W1d3H1A2ey5kSck/+Uh7zufAErVcTyTQVlBFPlyURd7njgL/hrS6f6fb8J1IOfLWBOxWJVkifHB3BZyKNk5ptZxop7ABZn82PjdQXqLYf+JwCCSLTCxF82SwN+Xnuvgdz+38w2ChoKyCkO0Rcwdu5HSGNvR5iYgIKcOX9zjk1McFs6q39bobqqIsa/XTNgzXhdYBDEQ8l30cRFS4fZI8PXOnucGD2iu6fykdAg+uWDwE/GsiQc6zpn8uiz6SIhartSjhx0IbF22ENewISVjA1+z3guUINi0TkFEoGjpmq2ZCDkw3Hoqh47mVS+1oKhI9ocsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3c087e81-73f2-b284-d035-807f64b78e6d@suse.com>
Date: Wed, 19 Jul 2023 08:13:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 3/3] x86: Add Kconfig option to require NX bit support
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230629121713.1211-1-alejandro.vallejo@cloud.com>
 <20230629121713.1211-4-alejandro.vallejo@cloud.com>
 <386eb540-8688-1a95-1e75-133bb21223fc@suse.com>
In-Reply-To: <386eb540-8688-1a95-1e75-133bb21223fc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0267.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBAPR04MB7223:EE_
X-MS-Office365-Filtering-Correlation-Id: c69cab06-4577-4207-5f4f-08db881f459f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V4nwnJIFQfuLFMtvMCds0ncbyhRsYQevn4zmqqbGI7eT5wH5kD/bdDCYveOAzg6U7mzHgoIf5xK7aqZGC3AKlJzL7SeI0qchwcCLJv67U1Sl3Nbj2KljtaLIbR1bJ9YHuUrW12nVkYveBJkyxYnp2OxzBUaleI+UNxLtvaHdmLlNOJC9wgyrgU0sYmtOXf8SrjJiv9BpOY099dmUy8t50dFUVEO6Jw2UmqDdcOJIk1+3qGOueGbVhjWZ9QHmRH1NVnJg2XMWhkyUoYVjYplHIVL6HzLuE5CLQhYpxlrY9WJZJF1LkD2/9ZnqWddizZup60N5TIdHxYIBD8wCi93O4k7iC7x7GkAmduLjg0C2PjXWZsY26foVhytDgy/mgr43i9qfcTgQrtQQxsX7rc9ShbHhJc6sCpLDGFfrARmwgDVTBzKQVb4gftPbmEotHQZ4d2bV5n5ZToq1MOmu1E5jkur7+q5VYWIWgNIUrfK+6BZvie3wsvUD3EvRfCS9MyJL52ulaJDrLBGfEl91bJSvA+cvJyTfB37c0lBkWsFWty0fTMECNW3FgvaX4IdTykGs1mefmhiaxKxx1gqomZcf4qFRThZX+7Gytd/7Xt35oH5Xu16RbG1wQMQqElyP813lWXiW9shoiYjKZVLHo6OsIQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(366004)(376002)(346002)(39860400002)(451199021)(8676002)(31686004)(66946007)(66556008)(66476007)(38100700002)(2906002)(8936002)(186003)(5660300002)(41300700001)(316002)(2616005)(54906003)(6512007)(31696002)(86362001)(6916009)(4326008)(478600001)(26005)(6506007)(53546011)(36756003)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVd1UTU0bHRjUFhsbWVkeFdWVkFPRGFWQmJGUkVhKzllL2p5N1NOUDI1dGp2?=
 =?utf-8?B?RE9uZ0xWTU9Dc3dpWXltSlZNTVA2Q0Mra0dSZGtZbEQyc04rZGZnWG81T3Bx?=
 =?utf-8?B?aXBXckJxelFFQ1FhSEdQT2FFb3I1eXpwaTNobVc1ZFNBTHhjblgxTjBwY0Iv?=
 =?utf-8?B?bHQwb0ZVQXZJNzJjRE1MV1dkK21qVS9Fb1Bkeko3czdQOWRkOWVUdUJtMDA5?=
 =?utf-8?B?a3BXeFBVMFovOCswMVNIclVOS3BWNkkzWi81bVhybjNlNGVFSGtQbDZIZ3hz?=
 =?utf-8?B?RVVoKytxM3N2cStISk1QcDhCOUVuN3JZcHprWkxaaDZZckJTQVlZMFNWTHVY?=
 =?utf-8?B?Z2VERFdNQklaU1hjMkkzVlA2NHBjREMzODNoNFJUcUludjJQQzlyMmhiVmUy?=
 =?utf-8?B?cGRRdjJEWWkvc1ZFR3JSZUFEVXJxbE9BQUxEbit1dk9jQ3hieFQzbUxQcURS?=
 =?utf-8?B?K3Z5c2srWFY1NHAvZ09xYlBiZ25Bayt1NXZnTUZDQjdOMWtyRVdvQlZJVkdC?=
 =?utf-8?B?bjEzaUtOMkxsUTZEekNQVWNkVmFRY25ZS2hndVlyb25JNHhRTWFRbi92Ynov?=
 =?utf-8?B?c2JkY0pEOGlubWlmRldLaVo5Y1hEdFFIYjRhMVFRM0pOUnhTQ3ppTTVCMUhD?=
 =?utf-8?B?WmFYVlFBRHQxMnNDZHcvNWZZdlFyN0VCMTRTK2krQWUwR2M4OTVWeThKM2sv?=
 =?utf-8?B?WXFkMGVFd1lnS25JcDlUSythcGhPVEUxQVVCNkk3ZnkzeWpGVDkrL1A1S3Zh?=
 =?utf-8?B?OVZzeTVKeURlT29NQlVFdmtwdnhmY2poeXArbjU4cDQ4T3hZaUJyRU9TZVRp?=
 =?utf-8?B?NnQ0L2pBenY0U1UzVWs3Mitod3ZIMmNZOTQ2clFtenJHaS8vNlpPM01kT0gz?=
 =?utf-8?B?VE91T3hhT0VLRTNqNFQ0MUZWUFUwR01UcVI0eCtRTnhRMVhqWGZVeTFUQmFu?=
 =?utf-8?B?a0dnS3QyN1RtenZNTHBpODJCa21hbFIrKzVjb2tJRmU5QkZWVnNwb240cjUy?=
 =?utf-8?B?Y21NVk15UnBtSjFtR1JCUDdURmRpblAwZUw4b3F3NVpsRG5VbTk2S1Z6RUpE?=
 =?utf-8?B?M3NUb0xmbWpaRU5ySFBTUkMrNHhRemJYVHFJNnAvL1pPaHZJdzd0eVNOcW10?=
 =?utf-8?B?dnpjckkyWE5TOHB1YmErSEtBS1pwemFPM2p0OWpoZFVLMlpmK2NnNU56bDhO?=
 =?utf-8?B?YTlFZEF5dkE0SVJEaGV6TmltN3JMcEZKL3hsYjZxV0hEdUt4NFZoSjRxVlUw?=
 =?utf-8?B?UTh3aWVLQzJxV2g1bHpybXQ3dysvUWxKVlhGUXdKSVJxREFMME95eDNZVUVT?=
 =?utf-8?B?Z3UyMHk4MmpHc0NZTklBeGlydU9veHpTR0Z1azdvdXplMlNuSjEwMUtrTnBS?=
 =?utf-8?B?QU40L3FkUEtQOWpxaWU1ajBFQklWcVBIVngvTWpJbWI2TnplTFJsTFBJYjNs?=
 =?utf-8?B?Wi9GMnQ4di9OQnh1KythUVpwcWxidFY3ZVZmcjVvbHdxOE9EZmFqNkJZUkNE?=
 =?utf-8?B?V2dtWDliMm93WUtJWW45OTlhN3FnOEJWd05XOXhON25vMUlSU29EckVja3JH?=
 =?utf-8?B?ZlJud3liZXhuWDJ6TkhqVkpVNGREMWZoSldGRW1hTXhOckQydmhuaExscVZY?=
 =?utf-8?B?RHNvdXBQeWwxZGN5VmRWWGlMaFgyUTlpWjgzVGw2WG1nWW5xNVVqdlhiRDh3?=
 =?utf-8?B?Vnc5eXExUnlXTjNQdlhoRllTSWJ3S05OdTVKQTVlekxNNUx0REVOY2l3Vk92?=
 =?utf-8?B?d3hicDE3VnVoWlE4aVZSa0srWENnNkVOYU5kUVByUVppYmVPTldmMzZ2M1hw?=
 =?utf-8?B?eFZiV1hEVnJzRzVVTkxGZ0Q2aGJCTnZVcG5vc0Y1VWF5Qm9YUkNjMG41RFNq?=
 =?utf-8?B?aW9OSWMybE5naXRGVnFqc2hQQkkwVllodXZXL1lPdFF3cmtrWEhPdXNGQVhT?=
 =?utf-8?B?bHdQL0xtUGl6NzE1Z09ZZUFab2hXVGswajV5YWhUTXVsSTVwTDFaNHI3d0NQ?=
 =?utf-8?B?dmZVdlM0QUNxc05KVDMyQ0xEUTRrTWNYYmpZZldQbjZVYW9HMGpieVVTanJh?=
 =?utf-8?B?ZnBtV0lDaHRRMDI0Q0JGajBhVDNsWXppaFM3SXhVeTJrZmVOOUt3K0hXakpq?=
 =?utf-8?Q?+q7YjArsOUwJnR3M+QH6vAKhM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c69cab06-4577-4207-5f4f-08db881f459f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 06:13:29.7984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z6j7O4X4qN3PpeSo+e+ga6pzaSKcUpSSTToSX5I5h7M2BanW8S9xKutX6ipKG97AucJRt4M8yObEVkMPlJfLTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7223

On 18.07.2023 15:19, Jan Beulich wrote:
> On 29.06.2023 14:17, Alejandro Vallejo wrote:
>> --- a/xen/arch/x86/boot/head.S
>> +++ b/xen/arch/x86/boot/head.S
>> @@ -123,6 +123,7 @@ multiboot2_header:
>>  .Lbad_ldr_nih: .asciz "ERR: EFI ImageHandle is not provided by bootloader!"
>>  .Lbad_efi_msg: .asciz "ERR: EFI IA-32 platforms are not supported!"
>>  .Lbag_alg_msg: .asciz "ERR: Xen must be loaded at a 2Mb boundary!"
>> +.Lno_nx_msg:   .asciz "ERR: Not an NX-capable CPU!"
>>  
>>          .section .init.data, "aw", @progbits
>>          .align 4
>> @@ -153,6 +154,11 @@ early_error: /* Here to improve the disassembly. */
>>  .Lnot_aligned:
>>          add     $sym_offs(.Lbag_alg_msg), %esi
>>          jmp     .Lget_vtb
>> +#ifdef CONFIG_REQUIRE_NX
>> +.Lno_nx:
>> +        add     $sym_offs(.Lno_nx_msg), %esi
>> +        jmp     .Lget_vtb
>> +#endif
> 
> Since I'm in the process of introducing more such paths (for the x86-64-v<N>
> series), I'm curious: Have you actually had success with getting any output
> from this code path? I see unreadable output come through serial (provided
> it's the normal com1 I/O port location where the serial port is), which
> likely is because baud rate wasn't configured yet, and hence I might have
> success by changing the config of the receiving side. And I see nothing at
> all on the screen. While kind of expected when in graphics mode, I wonder
> whether this ever worked, or whether this has simply bitrotted because of
> never actually coming into play.

Pretty clearly this was broken in the course of adding MB2 support, by
b28044226e1c using %esi as the "relocation base" after already having
clobbered it. I'm working on a fix.

Jan

