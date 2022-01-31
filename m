Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F2E4A4648
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 12:54:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263054.455609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEVFk-000154-SW; Mon, 31 Jan 2022 11:53:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263054.455609; Mon, 31 Jan 2022 11:53:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEVFk-00013D-PH; Mon, 31 Jan 2022 11:53:48 +0000
Received: by outflank-mailman (input) for mailman id 263054;
 Mon, 31 Jan 2022 11:53:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Fky=SP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nEVFj-000137-BX
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 11:53:47 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71dd4b07-828c-11ec-8f75-fffcc8bd4f1a;
 Mon, 31 Jan 2022 12:53:46 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2057.outbound.protection.outlook.com [104.47.14.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-hRGSsmZEM5yIcH1hG8WhvQ-1; Mon, 31 Jan 2022 12:53:44 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB7PR04MB4812.eurprd04.prod.outlook.com (2603:10a6:10:1f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.20; Mon, 31 Jan
 2022 11:53:42 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45%6]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 11:53:42 +0000
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
X-Inumbo-ID: 71dd4b07-828c-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643630025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cmFb5hq5X/1TPJJ152bim2bVrQUQ07lwNlLYeO5hMKI=;
	b=jQ8PdRgpa/Q0H7h4rhn6mbDXb/JzcOwVYBUHs4IT94ALaRywQc4uhr3YEDt+l8sOw8Ck6Q
	N5Q8dtzRCY/Z99i4CpTtlUCFXlmZf8tDvNumsyU2gE0aItM7wX0xWyWCQMlyjLdZ0LSbY9
	GSa8/mbR9KfRW+wiTkoS81yJooR631M=
X-MC-Unique: hRGSsmZEM5yIcH1hG8WhvQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CXgxfWaMNqrxXw56GiAos/IwAOF84x5yosXBDX6jZBHeFtDi2AUDZ06pfDykR26jaLXDmQz6iuM4zlMMD7BxnxoyXp4HgYxbj8bHHCgMvgXs1aE6tNt2U5/wAU8U0EhFxG/YsvU9XwNqsegW54t1IYc9PS8dkIL5JgV1RU1GhpzcXX/IHmMU54hdBXK5QmwTJ3GO6NCkdvCXhwKB/14hIGVPdynqlWLTGy43fkfp/39rU46OS2j62DxYZXMwHmWzqx33sTFNWPB2oGoqhjLXNWRDcW2rMsjiONlrqPfw4gjFELdUyRbN0tiV5hywiCohzTCUADTYOMCzQ+eqjI/Hlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cmFb5hq5X/1TPJJ152bim2bVrQUQ07lwNlLYeO5hMKI=;
 b=eAoSt/VbgzTPCLZWJOBR6DuFxFp7LxoHxUADrvKJXPbjdMtTjSBNiFeH8Q59q4D6H3paHu+/MRhlFny8FhrnwRg83yGTXWCJFh6CkmhvFWzgt9xV6Z7xpj3zLzBPqKQmcEiO0OSLpyZUnkK6YCSSCtRgYXWvq+f7+DVw93nLKcpvtT8R05MhuEibWSOrWoSYBPwntrJdTh6mWWjLCzt7Xd4d3ljSX+SfXEbdtK8SlMBWujeRoFr8o1X4uIkGywGK0/T0vzO+11SWoPCXSmvTbWYyuV4Buc622W1VoUtAG/ibTgq2rnhuSV9NNOZbuhbH3EtN7/RqubZS36i5smJPag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <08317caa-517f-e6ed-ea2c-84423e261299@suse.com>
Date: Mon, 31 Jan 2022 12:53:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] xen+tools: Report Interrupt Controller Virtualization
 capabilities on x86
Content-Language: en-US
To: Jane Malalane <jane.malalane@citrix.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220127160133.11608-1-jane.malalane@citrix.com>
 <20220127160133.11608-2-jane.malalane@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220127160133.11608-2-jane.malalane@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0032.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0cb6402-4bef-4adf-4021-08d9e4b053e1
X-MS-TrafficTypeDiagnostic: DB7PR04MB4812:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB48122809A3A9F9997139E667B3259@DB7PR04MB4812.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wXyZeAtIjUM7U1FkFTyiozM7pH/c7DoKxZwTPX6wga4lc607TFfTjUEgl7qBC/jRR2volaKT0DwQ+uKeDhnXAzKw6kLJUWKx8eTD2mXE64IPGY323Ay8wlC88DtWCTbDDNe4xRioT2iNy6Q96C9C3/BcqdOrjTlgcotFBxWZN7/VUjucZpkj2D46Zde16GSANg3+NrcVbFg9VD9/WuEA2lLb39HOTTbiAr5Cv99QvrluveEmKwS0Bv8kbyGlWHdcQdeP89qw0LyQ8p9tg1+S+xhAxcN05fuinvgrlptnDgxVYUqubPVr9X/j3TOxC7L2TcP5RaxSWYudxzthvme08BTy/JZjqIx9f5ocLbbnTaMiQbGaifRRJzwj2/wF9l10rdx2SOnm3UzPVc8QU8BZRrNio5oQjKNVB+JXB8KPhi26BSlAZnv2Pe/o4FRVHao58dAluQGkDDPNyNDjaQ2au7FvNpaA/lT8BEPag11LFi8UgwtNExqPws4vVBqTGmNJhGa2iXFCriej1mEyRkt/UWRSs4WtGFWjYl0iXJCI4HRkmwmd6ChcgnJPpIdizq90yRU27DVTdlYUdLU74Z52uJDkIhxgg1tNDw6zBJJjiV5IzvwxbKby+HM/GQQYsMrm3+vQWcIPenyfQIdjC96462w78NwfyWMXdIo5skviU0GgPWpbGP0Q59zIvINUci1H9oR1fmlJb4jeVzYiJxPidQy5YCKANNxCf42wPJU7Q92WqgmnUe3d+K9trcbeDe+9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(66556008)(66946007)(8936002)(316002)(6916009)(86362001)(54906003)(31686004)(38100700002)(4326008)(36756003)(8676002)(66476007)(31696002)(508600001)(53546011)(6506007)(83380400001)(5660300002)(6512007)(2906002)(7416002)(186003)(4744005)(26005)(2616005)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnhTRmlVKzh6b1VlNm1XMFIxalNtL1RISTU5V0VwZlltMDM3TVppOWNlVXRn?=
 =?utf-8?B?YklJL2NtalpxdDhIRk1pUkpvdlBJZkpoTjRGV2RwL2VoM3owSVNXR3REU0pG?=
 =?utf-8?B?aGlWV1hwcFZGY3RmbUhlRnVBVHdrRFdPdzE2eVhhRHVLMlc1emlsU2NCdmhx?=
 =?utf-8?B?ZGkyZ1dUUlVleUZKU2hjMHpOVXpRTm5ybmZFU3ExNDc2QVZLL1drdVVkSW00?=
 =?utf-8?B?dTJISXNIWEFMNlUxYkV1ZEo2emFENUJpTGZaN0NNcXVHRTBWRFFsYW00a2hW?=
 =?utf-8?B?SVJKZlFUL05kMWZTZVpDOWFGd2ZUWWk0Sm90WUdPNkJ3dHo4VGJ6dzh2L1hZ?=
 =?utf-8?B?OEl0K3lWUzhXRllnOXdISWRkK1NVZExLZWg1Q2o1NlBmNFYyNWJtZ2gwUm9l?=
 =?utf-8?B?UFRtdjZDenZQVUlkTHNvaVIxaFQyTzFjeU0xL0dVV3U4eWxIZWw4NUk1RTRP?=
 =?utf-8?B?WlNQK2tGN1BXTTlKK091MGxjNGpaSUNISWJjREN2M0tLQjNyYmc3RTRzeXc1?=
 =?utf-8?B?VHRQY2dmSi9tSkprVHErZk9PZnlXOWJhQ0FOYVpVTXh1VzZVNnZWMVZQTXIr?=
 =?utf-8?B?ZzZUREMyQjMxeERJVUdpZnFuYXA4K1lBZ3hBaXFvM3BBN3Y4Z1RISHVoMWUv?=
 =?utf-8?B?N1p4OWpDRnlVb0g3TWtXMit0TW5CRjV2WG5taGxaeVhSWXl6L2Nja0RhN0Vy?=
 =?utf-8?B?N3kza2tUeVRQRUlaSUM2RFVhTVRuVGVjanlteVJXMnFkRUw2Tk5zUzBqQ0dy?=
 =?utf-8?B?eUd2SmkyeldFRm9TVzZCUjhvdmI3dHZRaXRuYm15dTdvem1tOTFqdkFvVUdq?=
 =?utf-8?B?cGZhblg4TCtRcDhVZDBrMHFLTkRIejcyUk5DUHpLYU5JS0F0Z0tLZng0T1Rk?=
 =?utf-8?B?WXdWK2Mzb3lZc2tWVUpxU1MxelRGTjZXWnA4dk52MFovU3FNTldDb1RleFRT?=
 =?utf-8?B?T3kvQmNXWXNQL2x5MFZqbFhTY29UZG0vSXc4aGhDY2gvNUFwMnFYMW8yQWh6?=
 =?utf-8?B?ZGhwdkRVOFAwVFZNT1UwT1Njc3pZamNzNlQreGJCVnhEbXMrTUJtZGpObFNC?=
 =?utf-8?B?VXVORXBCbTZuWlhXemZFTDdJUTFMNVQ3cjJrL2o0RVhxWndPNWdCZHd1UmVl?=
 =?utf-8?B?TEpJTVBHRGp0ZGc4WlRLSlpRNlkwUlJQT3luQ2wwZk54YnlnSndoRGZHT09Y?=
 =?utf-8?B?ZUhTZEY5TEdmR2FWd09vaFU4ZzNVbGdrVE9KMmk2OXVveU5MNXB6aXVjbTNP?=
 =?utf-8?B?ekc0MmxDWjgrVG5IQUh2dXI3UTBOTUN6RmhyMUtQbG04YmFMUUhRV3VPMERT?=
 =?utf-8?B?eStoN1FTOTBmV2lCUlFDS3VuYkdzOEZ6Zm05bWNmaUk4TldKcGdjM3hrU0pH?=
 =?utf-8?B?N3F2R2QxbUJ6WDZqRVZYWDNIYXM2N3RrRjBGSWRkNUFEREp6RlFMSmpnMkdC?=
 =?utf-8?B?Q21UWWFTY2lqYVRYUVBDRzE3NVpQb3A2N1dCZ2IyQWhoNitmTGZ1cDRrRS9y?=
 =?utf-8?B?cUNXMFVha1B4QUVLSzJEVjVidEZzcE05bHhkRGtsY3BLbXhwcFhzaGtkZU9j?=
 =?utf-8?B?NWRSSDFTVXNJWUdqaktlbm9kcjhPY2JLTmtaN0d6dEVJc0EyaFAzVU15Qi9Y?=
 =?utf-8?B?ajFmOHN2dGV5OXRyczJjYlZFNTN4OUUwZUllalF2WXNLM3lYWE13YTdEVUg0?=
 =?utf-8?B?REdvQzhtWlpCSFV4eklCeE9POW13UE9kNEcwczdMRTcvajBISGRYTEtoVm1O?=
 =?utf-8?B?SFROM2ZtdUJPM0x4ZVA3K2RybWY4VlVPMEQ4TFVIa2xhLzJoT0ppU1huYldv?=
 =?utf-8?B?U0s4S0gzWlVwRWRxOERNeHhvWVRFM1p4ZzE0R0xId1ZyQnRMNnVkSFM4UUcz?=
 =?utf-8?B?ZTBKRXp3RUxzTUtvWko3L2Jpblp4emVpVWdXdTNNaU1BdFpWcG5UY1FkcERX?=
 =?utf-8?B?S08zMngvWW8wTEg5NDBZNmwvVUU5NS9CY3B4SjlzMjZjSVpGdzUzVnNSbXBZ?=
 =?utf-8?B?ckhCTTIyemplQlFhajRPc0RXajJUZmRSY3ByR1o5Yk1RcjdLZWRlZHJpQXV0?=
 =?utf-8?B?QjZIT2VxWGsxZmg1allOWitOSTFPelkwWG50WFhvYVBOWWhRNTdQUWtOdzJt?=
 =?utf-8?B?NnFYRlZoa2JYRzFGUlMyK084WkRYK2Z4OW0zWDduMHNtMUkrOGQza3VycjFj?=
 =?utf-8?Q?oG5dVFcmI9eNIzjynCd6Zfo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0cb6402-4bef-4adf-4021-08d9e4b053e1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 11:53:42.3377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i7fB5ZcDAU7xpjyldSPhflRSbUgQQ83ngMsDg8szhW8yN8pXiPYXP7Ctbh9rToZ6Njtp+L1Djk1FPIabs/Ya0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4812

On 27.01.2022 17:01, Jane Malalane wrote:
> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> @@ -343,6 +343,12 @@ static int vmx_init_vmcs_config(bool bsp)
>              MSR_IA32_VMX_PROCBASED_CTLS2, &mismatch);
>      }
>  
> +    /* Check whether hardware supports accelerated xapic and x2apic. */
> +    assisted_xapic_available = cpu_has_vmx_virtualize_apic_accesses;
> +    assisted_x2apic_available = cpu_has_vmx_virtualize_x2apic_mode &&
> +                                cpu_has_vmx_apic_reg_virt &&
> +                                cpu_has_vmx_virtual_intr_delivery;

In patch 2 you modify this original related construct:

    virtualize_x2apic_mode = ( (cpu_has_vmx_apic_reg_virt ||
                                cpu_has_vmx_virtual_intr_delivery) &&
                               cpu_has_vmx_virtualize_x2apic_mode );

As a result I don't think the expression you use above is correct.

Jan


