Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E8A5113A2
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 10:40:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314546.532648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njdDa-0008Sr-CR; Wed, 27 Apr 2022 08:40:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314546.532648; Wed, 27 Apr 2022 08:40:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njdDa-0008Qv-8C; Wed, 27 Apr 2022 08:40:14 +0000
Received: by outflank-mailman (input) for mailman id 314546;
 Wed, 27 Apr 2022 08:40:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PTsb=VF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njdDY-0008Qp-La
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 08:40:12 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6269c87-c605-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 10:40:11 +0200 (CEST)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03lp2173.outbound.protection.outlook.com [104.47.51.173]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-JWBsU11sMNiWZiIqB3pU4g-1; Wed, 27 Apr 2022 10:40:09 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB6PR0401MB2488.eurprd04.prod.outlook.com (2603:10a6:4:35::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Wed, 27 Apr
 2022 08:40:08 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Wed, 27 Apr 2022
 08:40:08 +0000
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
X-Inumbo-ID: a6269c87-c605-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651048810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y5QjRMoLiHAlv2i4iqi7JlyFkL8HZ1i6/D6f562725Y=;
	b=nyqMid5SnUMLlcgSGHZYzeKIooGtBDfQcTq3uE54IM0xmT7/bzGwp5/1+ZSIWn6LrkpwYV
	EjB05WCFILc5fKhIsMDAu4xJ6EcrTP3JR5fgG+eTnP2D1+fJTgXVvR35CLvYCAiZwDIZXD
	NP1WikXstppvLpC4/d2zUZqvV/IQF3E=
X-MC-Unique: JWBsU11sMNiWZiIqB3pU4g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PHRZL/zTLQJd/RfbH5zDXMZBvOZUoTJN/P+HOnDi+QZynkZ6LlZ4kZ+6rKcNk8ZqMsFLbC0+VjnZ0pYyIFpzV41BO19faN3cxnU5GA2VB/b3whG46/b/CM7LIkcM8m+/fQOlI8qWOxMX3ha7ixBoDIR80MDmMXCD3VCEqCtINRd8S6RapVVv4wnjyvoaluwfeJ3nEIT0x9i2AxJu/tK5pLIVinkn5MIlaMwdeLwW1oKlI7MUnf3q24kYXy3IWflDbWPxNBL3d6KLy4hYOy6ffZzMl6ZGSVTWotYcqnJVwUMBN6/BC6bdL3f1bsR4Slit/gyIrSLxmTyGvZF32S1aYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y5QjRMoLiHAlv2i4iqi7JlyFkL8HZ1i6/D6f562725Y=;
 b=Qb8xsDx8jJWf3K6qAD6OsTIrP3Cs0+0xfHRCWQjatkHPIJ5LsbPDIz+NCkzWTrWQ6sdkSv+fewd7jHXL9g7Wz2ZdIgz+b2ZZJC/Pfv7A5+P9a/imOdSN82uZgJ9ugRVdX8yjBzxuJTO7AZfb9pB5hXT+6qSMPdaE2suKw6DXaK2FA69UxcSf6zaLB6a4lzX5eqeqcrEAtIZnDGq2DSjn2YljW2wlgUwvU1T1a+oHL5gc4hiVgZ2ZypZQ3JcDcr1Qyybw+rzyOTtCMHh1evd/Bg5MqoOMNlh0vv1PPN0b54IoM2HxqhWDNOUlODHd6YNiiIm8vl4E8sGrlwoNzfOozQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4ab7cc30-73b4-e08c-3731-94c7bbb25adc@suse.com>
Date: Wed, 27 Apr 2022 10:40:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 2/4] Add a dedicated memory region for the ESRT
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <Yl7X/dT39vvhZmho@itl-email>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yl7X/dT39vvhZmho@itl-email>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0076.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::17) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfb7216f-a037-48b4-8ee8-08da282988d3
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2488:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR0401MB2488E3BA6FF52C6CE887F583B3FA9@DB6PR0401MB2488.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HfhnaQtclaVZFBnjCcgkZxCvzj85dpFg6v55D2EG6Ewzfa0QUGMAiiVE/hu429jA9WVCweCaPSqwjXwfTlmfPP/WKabgyqHw0Cc3UOivlMoHjy+8vYp4uwFafhopbs7LqyY869JrYEM0QKG4YUPoMNjaclsDsPIwsAQR3DoUV64D9Xcs4JOY2Uh8eHW3YykqjbFdwmSJFbJW0dlKOHs0HTarNPLnr+r0ruqnvmF8QRZXKgePzuVdotXCdOWgUb/dSbWl5fbDictLOxiF15ahREr7uf7Om+H5SBH6CmKismbGiaBzXPuEiyUmlWxddoNyoTqFc7agKAU3F6uVkekfVYkKhaku42nlYsWkZu3vhv+4sTZgqBFJVSJvLD5Bo9tKp7zi03yKPr4etEeSCaK1wxjw2oEZM/vj6dxfSLLTqd6pyD8Kz6hN8fSCVdos/L1zeGsW7Ch06JRp7YLLsl1rHs+MYotm9jeGGfm3GKWwdkXY6CvSDzkD7ofs8mu+RSR1MMLxyOnc1Rhrz3IpcbDJRrhU+gzaVCr/W0palgVNjMwtMz97NF8EJBstdupr3tPK5QZrYS/0KKCl89uJdx7ZvVSDYpU1kQOgefYQQf0KEZ6Srdr0tdG2KI3Df/zgwd777zQJe/B0CqkWHPMRSPblC3ML7v9pPeYDl6rwkb76fjwjGvuz5dCGODLFb1/xYuqbCushUUpXO4icSkOCZGwN6/uH2Qsn2/o1jfWr5RXi9BnNDYt/zmrFX/51B8a5tDsi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31686004)(66946007)(66476007)(66556008)(186003)(6512007)(31696002)(8676002)(4326008)(86362001)(36756003)(26005)(6506007)(2616005)(508600001)(6486002)(53546011)(6916009)(316002)(2906002)(54906003)(83380400001)(38100700002)(8936002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmhVaytlNlRTUFZxbm1hVkVLUE4yQ1VUMHJwaGJHZmdORklyeDNEcXJJYmpB?=
 =?utf-8?B?U1Z3cHpYUE50RytKazVCN0xxMy9tRVo4c2ovZmJTSldsWXh5OENHSnh2SVhS?=
 =?utf-8?B?bU1zNWVDS0hwVzFYazl4N0RyM1hic0xWREtrT3ptYmlWaWwvQmZOTm04TXhk?=
 =?utf-8?B?T1ZUUDMzZldmSUZZM0FKUTFhcm1TV0dXaDFJR3pWY2NmbjBCc0RIRklTdW13?=
 =?utf-8?B?OG9vOXY1a0VlWC84WjI2aGZRZSt3cVN6cjAxRkNZbkRQcWtXRXZ3WHlFTEl0?=
 =?utf-8?B?Z3FsZkwvalhKL3AvREVaZGhhSUx1WXppNU5yTjZ4d05mWmZkdnVZVXFTUmZa?=
 =?utf-8?B?UjJZQ2pyMTNGQ3FGR3RjREdmNTVpeHI2dngyTGY3KzkzaW9HS0lFaXRhY3BZ?=
 =?utf-8?B?enF5TXhvOFpydU1XWUcvQzhsc1BHTFAzYzQyVWROclJ5ZEpNaDduR3E0UTBR?=
 =?utf-8?B?WVJCWXQzTWJGRmpzcG91RzdQYk1LYjU0TiswckNZZS9nYU8vRlY3NzM2aFdI?=
 =?utf-8?B?NUpDVmxiSENMb0JBSWVUYnZ6d3A3UG5oRFNpbW1EOFA0SUp1VDJBV21Fb29o?=
 =?utf-8?B?NTVnSkNUSytTd1ZZbnBSdDZBTFFyNWh3cS9ETmdHOXpMUzR4bVZRUllsVW5r?=
 =?utf-8?B?bUhQTEhYREZHR0VVYXllY01scWNJNE4wOWQ5R2ZsUHVTRmdobFpxNFFGZndR?=
 =?utf-8?B?U0tRL3hFcUtMMTNhQnQrSkpMUyt4NTYvMDJuV2ZpYVNOdmJleFJEQmRaQm5m?=
 =?utf-8?B?SXRHUlBySG5sSTRjblNQTmdvc2cyOHBhMkpMbXVnaUFWNFAxcmNsenZGYk80?=
 =?utf-8?B?N2dxVjBjZTk2Y2VwMmVvSzlQUE9BQ2dEV0JTM0xxSmQ2eTF5MkROZEprK2Qx?=
 =?utf-8?B?WGljUk1YckV6UndIN3JpdGZoZjF3UzNkZW9jTW1icVprNFE0SlF5SVRLWG1j?=
 =?utf-8?B?UWswTGFUSDVJNFlVcDlRN1l2and5bXRzWWVmNjVrZld6aHpEdDlRZEk2N25P?=
 =?utf-8?B?a09rTlNEY2Evd2RTeUtBQkZwSk5wYmRLRXFIbUZzY0MzUWZTOWczSE5wQW5N?=
 =?utf-8?B?UXJLc0ZzRmNRVGFNRzd3Znl1dHQwaXdZQi85bjVHT1VnL0xqQytWVnpWWnVG?=
 =?utf-8?B?Mjk0RjZEenFHY2tRVXRMeWhPZm5sNERRdWc0QXk5YjlMTmdsbCtpUk1EbG9Z?=
 =?utf-8?B?emVadExMd21ZMUNDdXlNMUVDL05VdHpGYnFuODBXQU9wZUJWMHlLZzFEek9T?=
 =?utf-8?B?RUREQktha3J5dHBqSXZ2d1Y2MXF1b2E3S0lUUmR6Q2JTM0xFSzRqNG1IV2RD?=
 =?utf-8?B?THF5cUZqMGVKS1NGdGJtQ3ZsUmgyLzFlUndSR1dKc05tRlplblEvdWVEcWw0?=
 =?utf-8?B?WHptYm9PY1pRNEpUNjAzT0MrdWlnbXVUSDl4L2VMQmpkYUgwTU1wTzlWN282?=
 =?utf-8?B?Z2JjQ1BCbFBYRmVKNmtENFdtcDJBbUpreXNmU1R1alFjbkhOMzFQWlBNTldq?=
 =?utf-8?B?K282VUdmZjVDVjd4YStmMGJ0SFRUby9kQk5TYXlvSElKbEFSUFdLWDFlOU9z?=
 =?utf-8?B?dkhKb0hqbHJmbTY4K0ZUV2c4MFliWGk1a0FScXQ0cmpGaG1SYlc3NXV5YTQ2?=
 =?utf-8?B?VWRZWWQ5WXRKdEZmYkJhblRUZnIwWlBpazAyZnBFVElvUDU0U0FsUVlVYUdv?=
 =?utf-8?B?YUx6Z2o2TU9uOVVQbXowWGdxdDNQOFIvbmlsaWFkZ0p5a1A5WEZvZlFEbTNl?=
 =?utf-8?B?N21oMUdiMGFycWhWdHpCdnRmYWROcy9peWZuMVFwNVlDSk5EZ1k0RFVlQk9S?=
 =?utf-8?B?YXh3bFphekc2c3E5bGJYNmVWNi9yQXYwSWVLSi9oSXRQUHpBTk1rM3NVNGQz?=
 =?utf-8?B?bUJKUFpmTnJuRXpUYit1TXdtSjhCUENscmljQUhqck1ObVIrYmNtM0E1alRl?=
 =?utf-8?B?ZnJNZnZSNGJBdWI5Vy9jMFhsVmxOekE2UmJuMWdxRlpxVkVNM3NGcnlhWmRP?=
 =?utf-8?B?WWZNVGRHYWdUbEM3WkFTMmlpUDU2RlVlbGRpWUJIWE9uTHNoV09Za3NsK0Rt?=
 =?utf-8?B?YVdQVlNtMEhMMWtzaFpGRFJhRTdveGdKZUZ6ZExyV3FmclFlbDUzZzFOQlpq?=
 =?utf-8?B?eVpFQldSNXBmYWxBMkdFSS9SUTVvZ1ZlMHJjaHlPOUhSYWZhK1g2QlFDcEM3?=
 =?utf-8?B?RDY4NmtCNGJ1WUpNSDg4SmQwNTRWUDdUYWNScm5SUkhUOHRZUFdpTEh5MFIx?=
 =?utf-8?B?b3NvT1J0VXUvSXlhbndWMEwvYjRFcDg0WHVBR1krWFVpbFA5TkhiWlY2SzA0?=
 =?utf-8?B?akRoWm45azZ5c1EzWVpNRUF6bUhNZWh4bjlVWE5Pd1N5azlRU3ZPQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfb7216f-a037-48b4-8ee8-08da282988d3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 08:40:08.2401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wRj41nujdnXFOfUFHrUosb5xC6GK5b0aL7zYu6hYf+v11954O2GgbRY2xSBG9q3Dv+K6/3BtEtdxvFl5+0gCQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2488

On 19.04.2022 17:40, Demi Marie Obenour wrote:
> This allows the ESRT to be marked as reserved without having to waste a
> potentially large amount of memory.  This patch assumes that Xen can
> handle memory regions that are not page-aligned.  If it cannot,
> additional code will need to be added to align the regions.
> ---

This lacks an S-o-b and perhaps also a Suggested-by or Requested-by.

As to the mentioned assumption, I'm of the opinion that you as the
author would need to check whether the assumption holds or whether,
as you say, more code needs to be added. Or else I think such a
change would want tagging as RFC.

> @@ -198,21 +199,57 @@ static void __init efi_arch_process_memory_map(EFI_SYSTEM_TABLE *SystemTable,
>              type = E820_NVS;
>              break;
>          }
> -        if ( e820_raw.nr_map && type == e->type &&
> -             desc->PhysicalStart == e->addr + e->size )
> -            e->size += len;
> -        else if ( !len || e820_raw.nr_map >= ARRAY_SIZE(e820_raw.map) )
> -            continue;
> -        else
> +
> +#define ADD_ENTRY(len, type_, physical_start)                           \

I think the order would be less unexpected as (start, len, type),
especially when actually seeing the macro in use further down.

> +        if ( len )                                                      \
> +        {                                                               \
> +            if ( e820_raw.nr_map && (type_) == e->type &&               \
> +                 (physical_start) == e->addr + e->size )                \
> +                e->size += (len);                                       \
> +            else if ( e820_raw.nr_map < ARRAY_SIZE(e820_raw.map) )      \
> +                continue;                                               \
> +            else                                                        \
> +            {                                                           \
> +                ++e;                                                    \
> +                e->addr = (physical_start);                             \
> +                e->size = (len);                                        \
> +                e->type = (type_);                                      \
> +                ++e820_raw.nr_map;                                      \
> +            }                                                           \
> +        }                                                               \
> +        else                                                            \
> +            do {} while (0)

This is odd to see. What we usually do in such cases is to enclose
the whole construct in do { ... } while (0), or to convert the
statement to an expression, by enclosing it in ({ }).

> +        if ( desc == (EFI_MEMORY_DESCRIPTOR *)esrt_desc )
>          {
> -            ++e;
> -            e->addr = desc->PhysicalStart;
> -            e->size = len;
> -            e->type = type;
> -            ++e820_raw.nr_map;
> +            const ESRT *esrt_ptr;
> +            UINTN esrt_offset, esrt_len;
> +
> +            BUG_ON(physical_start > esrt);
> +            BUG_ON(len < sizeof(*esrt_ptr));
> +            esrt_offset = esrt - physical_start;
> +
> +            BUG_ON(len - sizeof(*esrt_ptr) < esrt_offset);
> +            esrt_ptr = (const ESRT *)esrt;
> +
> +            BUG_ON(esrt_ptr->Version != 1);
> +            BUG_ON(esrt_ptr->Count < 1);
> +
> +            esrt_len = (esrt_ptr->Count + 1) * sizeof(*esrt_ptr);
> +
> +            BUG_ON( len - esrt_offset < esrt_len );

Nit: Excess blanks immediately inside the parentheses.

> --- a/xen/arch/x86/include/asm/e820.h
> +++ b/xen/arch/x86/include/asm/e820.h
> @@ -16,7 +16,7 @@ struct __packed e820entry {
>      uint32_t type;
>  };
>  
> -#define E820MAX	1024
> +#define E820MAX	1026

Why?

Jan


