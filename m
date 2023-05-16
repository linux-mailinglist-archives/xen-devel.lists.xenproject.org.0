Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C764704501
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 08:13:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534951.832466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pynw7-0003C4-2V; Tue, 16 May 2023 06:13:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534951.832466; Tue, 16 May 2023 06:13:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pynw6-00039E-W5; Tue, 16 May 2023 06:13:26 +0000
Received: by outflank-mailman (input) for mailman id 534951;
 Tue, 16 May 2023 06:13:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pynw5-000397-H9
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 06:13:25 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2061b.outbound.protection.outlook.com
 [2a01:111:f400:fe12::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3154a32-f3b0-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 08:13:23 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8589.eurprd04.prod.outlook.com (2603:10a6:102:218::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 06:13:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.032; Tue, 16 May 2023
 06:13:21 +0000
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
X-Inumbo-ID: c3154a32-f3b0-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+jz019SKMC3nDMK6yMsy/FwP2FKSdaWDoTQ8pcR/uAZBoBoL8yhrZjCajomBtMQo8fcOJvAzAsHadIFzMkhzblc2KtBAcALmQOV3nkOvOJUkLgJJLL1ihHZKwxdvb20tCCM39gWKvos+9KWTa3QTSwp+wS1WyllcJEYzfEjQPLuUqv0YUxDIrdMI6BQxpYRfV/pRV49NUe7XRnBKLn8jYJEqywDRMTynrD3t7yHTnCijFYNvwKIRAJwOvmyA6uTwpFy1gPwxCdPU1OgHLAa4KPqJkNwPTeF3iRFPSwx2W/BXqiwgMkDf6qk9CldKdqkJpKqgzuFoHGYKOO1eIqF8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wCiXzKIv7wGzCx0igUFvb4QA102zBnffJyHsyygvpXk=;
 b=XfALmFiuqUgzH8d4p+Vdph+iXCr3upqBUxRNxMndg65b7ziyW/QE5DcriumwWxtY1R8mLEW5noCT4+KKmkHQ8XEvGOIK17lN+gqAEN9kObTpnXfWknjikIMqqMnMgljAPDItUtg3sj/Ayqd+9B7Y8CsqsUL++KJw8Te1Os/TVyQRUa6jkupxUnRLlaW4HQIuHFta3ofCYfTGFXmPiKzZEjGir3q42GnqtAale0N3lV8oZqfLXNofHrUDT/OLyBCulk2htyAWc7/raaopk20rdOolfvv+cfEIhwQa8vjdnSVQxcr2Vfg6+SaYHH+r5zC+2ATpZh3OF+9Abo5nSxP9vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wCiXzKIv7wGzCx0igUFvb4QA102zBnffJyHsyygvpXk=;
 b=N53v6tBDHJ87uUWRLgBflZATolxQ2oEP1rTwN7UqMxL/YLRVaTHBmTShIpJHOCfkrEJDnHQREb4byc44/3rjddv/JSzA+EnSDxvRiHhV113b92B7OVfWoNCnvu5aLd9+33WSV0ZKyfMDVC1tHNLwbtOC8MTPhYvSp6THf5mugNM8hH6FOZpX/05Hkg6Oo//lk9IYckPsNwrlKuxXHDVtknwPiz5XuobR465z+L+H7fMlpQcwiYmHYX0RQCrkM/z/rbJ9/TEBJWqrngcfxpthcXyv5ET6SWABLQfDit93ipC/buLHFnzHxetcmgPHnvjXUp6iO4p75RVHKQCKgrobmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <220f12bf-d2aa-b83b-8cf2-94ba0b49b006@suse.com>
Date: Tue, 16 May 2023 08:13:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/2] xen/x86/pvh: use preset XSDT header for XSDT
 generation
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org,
 Xenia.Ragiadakou@amd.com, Stefano Stabellini <stefano.stabellini@amd.com>
References: <alpine.DEB.2.22.394.2305121801460.3748626@ubuntu-linux-20-04-desktop>
 <20230513011720.3978354-1-sstabellini@kernel.org>
 <ZGHx9Mk3UGPdli1h@Air-de-Roger>
 <81ac6e51-6de9-5c4c-5cbd-7318cae93032@suse.com>
 <alpine.DEB.2.22.394.2305151712390.4125828@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2305151712390.4125828@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0254.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8589:EE_
X-MS-Office365-Filtering-Correlation-Id: a2cfbfba-180a-4b18-9a14-08db55d4a603
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9x2QmDu7Dv5siPT48aQdJ3sAEff+REGNEttbYWWswygA4miZG5DcnYdyqjvsGaXuZwQ7wC5mAH2SPNbnQ25Ca0xVoBriZ6Y1UqL5t60koB2Wxe35zpZOsSjVdt0VeNdRHtUDMzdH+MiEr37/ypp1UKlZGRh237ozWV8U+/Qge2wKlriYEJXi9S5kjJIjll56Nba9xalbdiElT3i4jBUG99HfB8JQMYQ6Bxt1vXRbA3GXUuQFMms/pqO7j1bjE94o63t+mOC9n0LKfTYGr4nNN+7GIL5NcQz88ohK6CH1aQQxWc9HtF0CEDlv/t0d7U60ut7v9TJyjphYtQuQPHZ+5hXIciqo4SY5vUlbdiy7OO/aKJWiRpEvTYWMk0OQnu7pw8+SH9kQmNk+5EL2smuvzDpDqFK6IuyTMq2kFDJdyRTgni4YIC29fyahKbMq4dyO8XhX5clmEGMd3WC1AGFZ6SdzZV5SluydUFlSnHDzGsKAYK8YbReqNRFtF8enERr9YZBWcaFkfVeBCOa6IZjGKK8MR3qNWhKdF9Ryj73mnRkb048iPCStgdMLf5mLTYQIGhIZha0aX2q5uXB4Ko6TskqpFr1ArZm3UJxLTBW5BOrRHzX4Vk7gPLQnhHdnpqrpVnOaQ9dalPClPP4kWYdcSg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(366004)(376002)(39860400002)(396003)(451199021)(38100700002)(2616005)(26005)(186003)(83380400001)(53546011)(6506007)(2906002)(8676002)(41300700001)(5660300002)(6512007)(8936002)(6486002)(36756003)(31696002)(478600001)(66476007)(66556008)(66946007)(6916009)(316002)(54906003)(4326008)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGs5UmxFVTd4WXpKUTRJRmdHZTlQdlVCYzJwV2pySHpZNTE0KzN0NzdwdEZC?=
 =?utf-8?B?bTY4MEdhcjNLOU93TW56YU5KNFRxbnp3UC9Vb0RPWnh1dm9vWTNsMjlEUWJX?=
 =?utf-8?B?UEhQQ091eGhnSWxHNGVCcnZIRnoraGhsRkt5cUE1eE9HNVVZRnY2TG95K3Ns?=
 =?utf-8?B?aXNxMndqNFJhbC84aEpUUDVCeVVGaHY1TGsva0t3eWRncWg5cklaMFZFVlRO?=
 =?utf-8?B?R1VBcGJJdGE2RldNNDNGeWxyN3IyOVJjOFVLZXIwdElkQ0R4S2t3RUNZVnAv?=
 =?utf-8?B?NUJsVGVvMDdGbEh4c01SMWdCYmZPUWR3MDE0aEx5eXloOTB5OXRnOXdxQXds?=
 =?utf-8?B?U1U3QmRWeDUzZXVKK2NrTGRwZTV2eEt4VEhZcXk4UG0xODZZYUdTWnJ2YWRu?=
 =?utf-8?B?RUFaNlM0Y3F0VExEaWRUbmtWN0UvL1dPaGZIMEVUdndZZXA1SWQ1VlBVOWNL?=
 =?utf-8?B?Ly9BamtNSjdKaUI2RDBzYUwxSVljdnVmQWdnM1V1RkRZRGVTNDlUVGw2NFJS?=
 =?utf-8?B?clpBako5VVZNMmcvZE1Ua00ybnpJZDcyM25QdHErU0tiTEMyQnhhVmxjT0Iy?=
 =?utf-8?B?YzFXTDRkeW1NcHNtZ3ZUOWw3NTVmbnpzNHJtMW5velVOc202dTBNTlJ4N282?=
 =?utf-8?B?a1dLV0JWblpoajg0UVh2WXZHT1BNdDdUSXZFeVRZSDRHZCt2WklQRmJuazRs?=
 =?utf-8?B?VlZFYk1XN1VJa004U2NlR0FHaHhTcC80Qmc5N25LL2NFWjFQREhGQUZKR1dO?=
 =?utf-8?B?bVNoOXRFWUs1ckJPTFJTUm44UzY0ck9McWZIdENUb09INmYrTFNJYXRjM3I2?=
 =?utf-8?B?Zk5sOWIzSFhVMmg2a0EyNjFoN1h3RS9lMEx2Njd4cGtxdm9DZ3NUNWo4TUlP?=
 =?utf-8?B?Z1hLKzIzMnhUbWZsVXZaKys5MXZCYkl6LzBSUFZzajh4a2gwbmdKNTBBem5n?=
 =?utf-8?B?SlZtZnZsSGJ0UkoyNHd1V0d6QVNtZkVhclNpNXFQRzVwMFF4cnpPLzlIQ28r?=
 =?utf-8?B?ejdyVkdMSksrMkV3ZVVkSG05cWcySFZOcnhPSVNlcFZGaGwxNUcxY2NQeFhQ?=
 =?utf-8?B?SWJidXFZYkZKMlU1NnRTbjArMVdJbVdNVjh5MXBZQmM3K3pCbytxQlZsRVJM?=
 =?utf-8?B?SWJTUXN2aDdWT0NkL0dLVEVPV2FCck5iWjFzQXk1djE3c2ZEK2F5bWNuUzRT?=
 =?utf-8?B?Q0JPcjNjbStlVTRkam1rWWxnQ1RyVWtGdC9qN04rTDNJRDhnYjQ0SXM0aHlQ?=
 =?utf-8?B?dlVmYmFBbEV5Z1JpMTltR1VxNmgrYm91cG5SdUlicnc1MGZpWm4vbWYzeWx4?=
 =?utf-8?B?VnlDT09iUFJ2b3ZEaTZMcjlhNWpKRlg5QWt5T0UrMG0vVVNQMkRFRkpLL0c1?=
 =?utf-8?B?NitwRTNlWkxNb2RGelB6ZmFPQ3N6VzFKd3FyVStlaG1xZzRHbmxlZklvUXp1?=
 =?utf-8?B?TVh0QWRqcE5yY05uMUlpazNlMjhKWUkwYU9JSXJFcFdoZ1BTY0pPQnlSemg0?=
 =?utf-8?B?K2ZpL1pLYVR6ZSt6YW5jTkFCc3pwR0NGcFR6U2U3UTFIQVc0aEpVVnI0dmI1?=
 =?utf-8?B?RUt1TGJXTE4xdCtQd0JZUmtHQVVzaHVXQ2Z2TVJwcnREcHh4VG5BbG1LSHRP?=
 =?utf-8?B?UUhPdFJEeHJmOUdCZDZWUjFxMTFTdzR0aTVVUzFGUVVWKzJmUnNhOUFUN1lY?=
 =?utf-8?B?UFFFRWpwTDZGa0svNk80VU1mRkV1TVk4K2s0SXVPb0dzZG4vNGFVWnVIM0V3?=
 =?utf-8?B?M2ZsbzNoMnZnUG1RVzRha1pYYzhQb1lhSVlXbWxYQUxHTDFxZWxPbVJ2ejVY?=
 =?utf-8?B?am9UYUpVaFBWNzJ4YnBwVnUyVmZFSU03Umk3S3loMlRFaEJNTDRqeWxuT3Zu?=
 =?utf-8?B?eFV4aVM4bndRQnJmSFB0akQxTmhNK1FvS1ZuU0QxNC9wUElOdzJGZHVpQ3pN?=
 =?utf-8?B?TDBma1pEY0NhcEFjRzNoRUZ0N2RWejgyRGZ5emptMlBNNnZUcEJWNEtRM3pp?=
 =?utf-8?B?b1Zjb08wN3pwaWtTVDNvS2UvZmE0QWhHTzY2enJBZmE4TzJ2NmRuVmRqNXlO?=
 =?utf-8?B?WW1IUFQvUG5kU2h4d1l6aEo3VnRoamNxaEtLYm1pbldpZ0NmTjVQOHZiNjkv?=
 =?utf-8?Q?cecjus0+ensD06KEmw64qjbiC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2cfbfba-180a-4b18-9a14-08db55d4a603
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 06:13:21.2118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mb41NwbMOFhqWp0Ai/3KGFQyRpfRXujfqoTG3ONqPbXBYXktFc6sv5eYQFKG7G8fZOyjlgDCbhzIFiTtaRKKLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8589

On 16.05.2023 02:16, Stefano Stabellini wrote:
> On Mon, 15 May 2023, Jan Beulich wrote:
>> On 15.05.2023 10:48, Roger Pau Monné wrote:
>>> Alternatively we might want to copy and use the RSDT on systems that
>>> lack an XSDT, or even just copy the header from the RSDT into Xen's
>>> crafted XSDT, since the format of the RSDP and the XSDT headers are
>>> exactly the same (the difference is in the size of the description
>>> headers that come after).
>>
>> I guess I'd prefer that last variant.
> 
> I tried this approach (together with the second patch for necessity) and
> it worked.

Which I find slightly surprising - a fully conforming consumer of the
tables may expect an XSDT when xsdt_physical_address is set, and
reject RSDT. We may still want to limit ourselves to this less involved
approach, but then with a code comment clearly stating the limitation.

Jan

> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -967,6 +967,10 @@ static int __init pvh_setup_acpi_xsdt(struct domain *d, paddr_t madt_addr,
>          goto out;
>      }
>      xsdt_paddr = rsdp->xsdt_physical_address;
> +    if ( !xsdt_paddr )
> +    {
> +        xsdt_paddr = rsdp->rsdt_physical_address;
> +    }
>      acpi_os_unmap_memory(rsdp, sizeof(*rsdp));
>      table = acpi_os_map_memory(xsdt_paddr, sizeof(*table));
>      if ( !table )


