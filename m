Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F11E6C2BD1
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 08:59:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512242.792100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peWu9-0004di-7E; Tue, 21 Mar 2023 07:59:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512242.792100; Tue, 21 Mar 2023 07:59:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peWu9-0004bm-4O; Tue, 21 Mar 2023 07:59:37 +0000
Received: by outflank-mailman (input) for mailman id 512242;
 Tue, 21 Mar 2023 07:59:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NAJ/=7N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peWu7-0004bc-Fj
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 07:59:35 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20609.outbound.protection.outlook.com
 [2a01:111:f400:fe13::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 511d5cc1-c7be-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 08:59:34 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8890.eurprd04.prod.outlook.com (2603:10a6:20b:409::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 07:59:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 07:59:33 +0000
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
X-Inumbo-ID: 511d5cc1-c7be-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JZBvULcIMhto7xLHrq+sRo/lV0f2S6xiEXPTBCW3sZTTMWzbQVfbTn5Si9ydGuMb3yVz4QNJx3qSGyX64vY88INQDa3L9YC/9G8A6WS1b7l9mYfxtlrlc2CfRlz2PFcIpjQh8ftKKy3Gc2wGOx0WQoWjU4EHdWyTLU23cf84NUapARlenHHJPFcPI58BxN/90N/gLGOlldSJ9lFPiWxIWUKw98kTe6IFnAYviDd+7DEkno3gly1wbiZQg0wcWEriLhADhD+EdZZS2dRJ19ok7GDVIx/IR7mlybcNARqGIoKB+Q6bX1ETgHXkFIBnUX4EaY8k7SuPq/s0bUfhGQ7F3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQYifz2OlWKxooXUkRR8VTHS7EPBZTPD+DSl5TxfZl8=;
 b=nZghbGsaasHEZIxVT9CFPgRREuxv7UMCuSAStch0bUrD0SAZEdJiZXcSbU2t7ppy/1oYwJfULZbYqDdVaSXaXesixrX/K0gocQmAG82xf22px+VkYpAfhTiR81sHR44LlKdc20rXn5ibgX0jZoODytE2CR+DXPVAvislTTDJ6LBiIha8C1/GhDkiLSHW7MQ0Usyw8PN4gMNyEp0RY8Hs6rsvGOmx2dBMsl+VJy7RtEM7oKID3jQbRLpoZqhdHm005YKicaygPw9C616MvBCRgwqjniiKVzZKoGWnySBeK/7qzNHoiiSokNiMfSGg4dVUx1fympLb/0g3crgiXT3waw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQYifz2OlWKxooXUkRR8VTHS7EPBZTPD+DSl5TxfZl8=;
 b=oFX6EaBA7gbe9Rmbc50Ax8NrYjZma0vaMJIQthfKzt2bCCxj5Je37UhjqvJ356HgK1fteNEZSOOkRIxhKUoI7pVsMT6jJIsfWaPJ2uJeOuvLnBLxSFF21TRZG/bqdjJ6U1HRLVgKc671dpwCCXJUgTfC9khg4WVdhbZ41MAJcM2Ihu+80rhFwmFRqM5xxmgyj1iIO9bjtz11/EchrgDjvrAD8lZek1bGggyaic/YMz82ImCWJ8acGrtM/64ctEgjK5tkO41dp6qiPDB4lIIyjvr37m4pQsCY0dyUZ/o1aqbXrLZjE803sFFYcFIqE7skPGuD9su2KzLsbUDkzmFXiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8e247141-a210-64c5-3831-a39f252de1e5@suse.com>
Date: Tue, 21 Mar 2023 08:59:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] x86/vmx: Provide named fields for IO exit qualification
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230320182052.1831486-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230320182052.1831486-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0008.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::18)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8890:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ef1cef8-c7c2-4c40-f51f-08db29e234bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LXOIkTmGKEcYsfCoSNMGGJgc1NbNsEuXTqxf7iB3aFv+j883RZsVtHx8/CSInhSc0fo/aBPd9BINO3nb53eh2W56jzXBKXuEXdlmAv2OqQHygoBRfWgceh/WXsPVog/t+oa7j+4RXchTanJL6to93if++bWLxIIvTUkz325lM7JrFjeUw0mgeUDzx6L3q0gXKwc7WrJOb3yCsvOUIQq7UnjZrm1xyTp/0KEGUBhTKOmRMc9qX+/h3M+1X7MqPb1y4jHzXzXzoNHEjXy6ebmYxOjlqy1yCQQxzdUIotn3B13WGLS8kSH/rLQNWr3tSxrAb9Ae6S9dPnwP1uo9GkKSrAcw/6C0Fgfzrty3HX/isyfEU7F3hpB4j+K8WP/bcjH/Sht3xNeqM/xV/1iClWpA6vlK0WFqhR7KPbY1DITQfO9Qp3t7P0rtPMMY0VTC3cgvJQKCC2pkLVOL58wq8I+22oYT3/d0d4BmJJFSQqgv4yELS3hpqFR8Nm5mOYT8VpF9/wM3StBlKTlvB4RzXBgkDmv4CNWZpEIDRj0mMw3Ta5sAfGJqKCdNTRrjFlC0uZruxCYsx9FGxUmBFu4aX+5Va8Oht41LBxG/ZzSNy31Pc7OGzwkI/Ag0aidVFqBQOV11/x/cQ4j+luOF9EC0/Vl7n+gI3TxLNOnwNDp2Hhho5oBiJshYqahLjw9KCc4+1jx9/7npzuJ2/DijwVMJvBMkyQ7Z5CLvM2R13jptosm+i64=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(396003)(136003)(376002)(346002)(366004)(451199018)(31696002)(86362001)(36756003)(6506007)(66556008)(4326008)(41300700001)(8936002)(5660300002)(2906002)(66476007)(478600001)(6916009)(54906003)(8676002)(66946007)(316002)(38100700002)(53546011)(6512007)(6486002)(26005)(186003)(2616005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1JFS0g4VHByc1ExYmpIdDN6NU5IdExhaU9SS0xQUlY0Umlwc01acU9jREhF?=
 =?utf-8?B?RDVjUkN5bzI4bHRvZ04vQUdCSEQ1aGhGUEVZMXl1QjVkZ1FIdTB3T1RrUUN1?=
 =?utf-8?B?NElPZjZnaUFveEpKYmZRakpIb2VIcWhvbDlJTW43SFFRN0o2TS9UWTJUMThX?=
 =?utf-8?B?emtUTnhiNkdYbCtDakd4UFVaOWd4NVcwUWQ5K3BlVTV1cTN3bjc0eGYzejFy?=
 =?utf-8?B?SnZIc21UcjNhN1RkWDg2TEM2MkV2V1duaVlVZFZXaHdtY0IyeTlRc0x5NDBz?=
 =?utf-8?B?MkZhNTA2SWdIbHUrK2JnWUNOS24xV0h1aHBhV2tmRHg0Z2hkdkRKWnlCTTJl?=
 =?utf-8?B?L1E4ajRXZkVqNWtQNGtBZGhDQlFCdTNCaUJjTVJOd3RuOThpeFdsTUtNWHhX?=
 =?utf-8?B?UWtIbWtpOTlXQU9Ia3p5bVhIbTZBTU1KcU1oVW13Z3JnTWZZUjZUNDE1MWRB?=
 =?utf-8?B?cDIzWHhhNVphTUt4OE1CWVE2T0liQ0RnUjBHaWJPdVM0bE1PbmQyUjI4d25U?=
 =?utf-8?B?ZmFyNUd6MHY3TmlzYmJPVjZHdUR1ZmNRSnpPZDBSL1ZFUnpJYmVxcGo1cHFk?=
 =?utf-8?B?aGpPVTZLMWx0T0QxUSthdUVNaUt6ZytQWXJzSDBiajd2V3NDSFlmVW5xdXhM?=
 =?utf-8?B?VGRybDc5UGRocTVhbndhNlNqSzdUSkp0Y0ZKV1ltd2RtSVRyd2dMcnRjdTB0?=
 =?utf-8?B?WFZHSzRMemNZOEVtVDgyZ1B6cUtCK25xNnBoRXR0VGxscFpjdGd6bUEwQ3FF?=
 =?utf-8?B?QVYwTko1N2o2RVhITS9NZlBmTFFzYng1WVJ0TGRjcGZycENTSGtKdmkyNGdT?=
 =?utf-8?B?TGVjZHhzQ1RmczNjMzI3SmFRRUVUNUFXMW9EQWUzdUcwakdFWjVQdzNTWjl2?=
 =?utf-8?B?Ny9iVEtCRmVFUEh2cHFBeVA2NU00OW9yWGtPejBLMDdkV0VTTnNZemgrQ1oy?=
 =?utf-8?B?RGlTejd0Yit5TnhvRnhZaFZ2VUt0L2M3VUJ2c2pxNkRXL0NFMkpzdWVaUlpF?=
 =?utf-8?B?S0E3SDdnM1NSNDE0WTRYTmp2UnRUWjczMjlRR1NBS2hQamhuUnd0Wm0rdU1n?=
 =?utf-8?B?VUhuYzRQODB4cE5FY3JIU201Lzd1UlFJcTUxMDZvc1ZrU0ZpaXo2aWx2WVh3?=
 =?utf-8?B?cTh4U2dMYVdhZzFHcTRVMXQzamEwYTVCc0drUjQ4WW9zWjFKblY3L3JMTk5n?=
 =?utf-8?B?TWl2UFpyTXBJWnQzMk40ekhxYlorQ0RlaGs1d2Vac2oxMWpDZENUVmJOZGVr?=
 =?utf-8?B?M1ZJdTBUZDk3RGRTbjdVbVRjc0lzYVVoamZWQllxMnl5WFZwNEphcWpNTEpi?=
 =?utf-8?B?MmpCVlc1UXNmVmc4SFN4SHFiNTlTSUlnRFhZdHIzYXZWajBMdVVEcmhCMy9M?=
 =?utf-8?B?bTdBb0ZOYlN2cmcxLzhwMndPVG5wdTRLVDlQVDNWRnIzVUhMY0h4Q2RJS3lM?=
 =?utf-8?B?RG1OZGdENzZiT0p1TXpIcnQ0OWVlNEpITDRmNVllc01lajBuTGdKNklSc2pX?=
 =?utf-8?B?QW5JczJRRk05bXRRQXFoVVNIWnY0K0hhVjQ3RGlHK21lTHVCcDNmT3g3N2xF?=
 =?utf-8?B?aklxQkQ2YUptL1NoZHYwV0tMbFZCYVhpY254K2RaZ2hMMjZHNTA3cFQrNmp0?=
 =?utf-8?B?NWtzdEZYT25jQTVCYjVqalB6OXk0Z3pHTktrWG5lc0Jhc0Jqdk1RdnBqOTY3?=
 =?utf-8?B?VTh1Y09kUWJXMERTR1IxWW93KzltY3VaakQ4WitXM1hYUEh4eC9lZlB1MHBL?=
 =?utf-8?B?V3VVY0RMdjV5VFJFU3FTUlNlT2pLdEJkc0QzYVQzcnF1cjFCWFFySFdEa1RX?=
 =?utf-8?B?RDdKekVIajZKUGhHM3BuNmJNakhBQzN3QmllbnloaGN0YmZnYnF3UVJXU0Fh?=
 =?utf-8?B?KzhoZW9PTGdZL3MvaFFBOE91VzU4RUVsU254ZnFYOUI4WVYvRnEySDFxTjU3?=
 =?utf-8?B?YjZFOW9mVVh0RlhtL1dGd0NReXlUWnNQUTFLVVJnemlPZXRQKzMvOXhaZ3E0?=
 =?utf-8?B?bDdYajNZalRTQnF3WGkrNkFKdmxaVTVCZWMwbTB6SHNLVkF6Z3lZMVJJTHpr?=
 =?utf-8?B?eGxBbzhMK2NjdEF4ck9NN0ZCWGdrS0ZKQ3lpelpuS3hRSG91ZVpPZDdIWXZ2?=
 =?utf-8?Q?LPbNfogAFFJ3ibudQ1R/64tUO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ef1cef8-c7c2-4c40-f51f-08db29e234bf
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 07:59:32.8806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p2sbTTTAAPH1jUXt8/USCnvS/UOvf1xs81fQUNvRPZuqpZlyI1O4o6IjOoElavIXUWObsy+AzReafkK1abEoGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8890

On 20.03.2023 19:20, Andrew Cooper wrote:
> This removes most of the opencoded bit logic on the exit qualification.
> Unfortunately, size is 1-based not 0-based, so need adjusting in a separate
> variable.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

In principle
Reviewed-by: Jan Beulich <jbeulich@suse.com>
but ...

> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -4560,23 +4560,37 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
>          break;
>  
>      case EXIT_REASON_IO_INSTRUCTION:
> -        __vmread(EXIT_QUALIFICATION, &exit_qualification);
> -        if ( exit_qualification & 0x10 )
> +    {
> +        union {
> +            unsigned long raw;
> +            struct {
> +                uint32_t size:3;
> +                bool     in:1;
> +                bool     str:1;
> +                bool     rep:1;
> +                bool     imm:1;
> +                uint32_t :9;
> +                uint16_t port;

... I'm not sure this is sufficiently portable: Whether a bitfield of type
uint32_t followed by a non-bitfield is padded to fill the rest of the
containing 32-bit field is left unspecified by C99; this particular aspect
isn't even "implementation defined" (afaics). Therefore I think it would
be better if either uint32_t was replaced by uint16_t, or if port also was
made a bit field (and then perhaps also of type uint32_t, or unsigned int).

Jan

