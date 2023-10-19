Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B6B7CFEFB
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 18:02:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619503.964674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtVTa-00026K-EG; Thu, 19 Oct 2023 16:02:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619503.964674; Thu, 19 Oct 2023 16:02:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtVTa-000230-B2; Thu, 19 Oct 2023 16:02:22 +0000
Received: by outflank-mailman (input) for mailman id 619503;
 Thu, 19 Oct 2023 16:02:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtVTY-00022u-9A
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 16:02:20 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e06eff0e-6e98-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 18:02:18 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GVXPR04MB10047.eurprd04.prod.outlook.com (2603:10a6:150:117::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.9; Thu, 19 Oct
 2023 16:02:15 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 16:02:15 +0000
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
X-Inumbo-ID: e06eff0e-6e98-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dnjUPWkitZaFvW2dDz0c/PEJVXmD0Gm2dnh6b60FsYHKMxZgBIq3UgmP5yQe8HMhkUE5q3b0JvsHilFKbt+MdsfLkUslvkra4oPD5Bp1fQB7ziDi9vEx8HLvyxngCY4Qeb/xu62Jb/IS3wFuu0okASsfihNAzbI++VqVHcnJvO5UXtCtNG3M7M+0qV79naSkBM1BC9F8QyoFs+dLtA0YftUzZtlo1x2XUChr8Ui+q/MMcpMzK5f/9DSQ5gmztiwMZYo/0Iy5xA5m7n3hRWh4HNIPe2fzMN0yn2iVrmyyhypNnneNspGMLWHWwKWqdEyEWlEaZSMkxTkfasVbeIX/Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D+m6EROmYhCJOGP0SLj7cRx7h4LUMWM22ivHs6SHRDs=;
 b=BkHlsfSsDIV0Yh2vNi+ARkp6phmLMT2+n+YjkXNDf4cPLdey9cEniLdijGQPJfBPosFN/JjtVhODbGaBfwQsI+UY8z4LTd2xBJSNl8r+PHz5Chis2n3d0ZvzfjwWTpAiPL/ALsJzUtq+ca1B0GxTLK3rAFuQgszXTTsAPwTqMx0vc3/9CpdeRt9PKeEPEBLdzvO4DuMYyC0oT0Ifv0qrfl52EpMWnBc7FDS88xO23aiRAWFppCnEjmcAUO0UccVH9t1Ggq8QTzzrBxGEqOnYCkj1if9AvuVggk6+xaun4tAWjiYscFquzrH2ds2seYPiwIs8BqJJ704Qd9itR0MQcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D+m6EROmYhCJOGP0SLj7cRx7h4LUMWM22ivHs6SHRDs=;
 b=oTQGFQIHkH0g7jyGR8z4mF/PKl7AWytcSpaukocM+Hd0sq1+I+MzESsEV/o9tH6stuqBxR89x49OoM1QaOhjmrILoQkA+rTI4j3WuaEc913keVnlEv6FUbTqZBXQkW3O2SFHfkLjV135cN0OvinZM1aQAXF2FB+367LZ8vIYF/JI4ZFutue1bol9/k1JT/ZdSd5RWLLYB3KHohU10NTlMfMsVW/yhhZnd18qqEgUSFCNnEDx181Blla5MbDtIXMDj9hQdE//9ZvG3XXsGBFiZJmnWKzqWe7V8EFQTI2ocL4rSiLaZVhRmYuRrgpW8GlYs/H6v1pHejdq1DQ8l/8bLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <84a840c9-30cf-8a51-89cd-a2e48da09a0b@suse.com>
Date: Thu, 19 Oct 2023 18:02:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH v8 2/3] x86/hvm: address violations of MISRA C:2012
 Rule 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Gianluca Luparini <gianluca.luparini@bugseng.com>,
 xen-devel@lists.xenproject.org
References: <cover.1697720584.git.simone.ballarin@bugseng.com>
 <e7b653d28632c8e198647e67d17c31d018f90d00.1697720584.git.simone.ballarin@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e7b653d28632c8e198647e67d17c31d018f90d00.1697720584.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0104.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GVXPR04MB10047:EE_
X-MS-Office365-Filtering-Correlation-Id: bbaeaafc-d97c-4c3d-b1b7-08dbd0bcc36c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	brZeoXUA+y82LUUgs749i/ZuAlaiqCES2StxtoAqZxhLjCnhTD25AXFvGy0LnPlCIpcCY04+Fo987+aGRE5/Fv3MkCJDXcUufyfW2g96VVbqmTktrUoo2PNF3GIgXvNrVZ455lDrsAMEph2vx2cQwP2xcrHgcec87tKsCmaf5RUl5tSumKKcWCwPqf+uEUUeyPHhCd0fFznMb6SBCu1vfSNYLSTzGiSad9EEqBZElUyfx3ueJp5t91kkZ+U+nM9gcLRV3A4fUDjpxnS3hO/oD1uBIm9Hr9vWNDvbah/7zKTWw19GSOJax6fWgOzfh+Yw+VqJNK3hIj8FUMK6YJvs951lPvVSdX3DOOtaZaJCyT/vMp6HbNOWDuZT637P/yirQR3pVVbKp6aWkOX32di5mZdzNTVIt1oDdDr2NhDumwLCzOXsa6NBikuSSILoS7pEYUhDr1fLyqbrjhMGPVd8gzRs4LCBZPz6Y5ybuQNclT/+JDWNPP+M5zO5QifPBDD/eHAg0MG8Jxu9u85kCv3jOHsh3ktEBd5QSC3YSqp9C5NMr9yNmNwWKEhFNALRizP+sIk8PvXsm+qBNLJP4TCm8u8BFhVyAP3dTt9508Wlkbkl7kfdQH8JnEjJU+6Yq81m4+22X8LAfkjCtKcv402QzQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(376002)(346002)(39860400002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(6512007)(26005)(6506007)(53546011)(41300700001)(4326008)(5660300002)(8676002)(2906002)(6486002)(8936002)(478600001)(316002)(66946007)(54906003)(6916009)(66476007)(66556008)(31696002)(86362001)(38100700002)(2616005)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGhGWWhwdmxrSytRVkl3RHdTMlExNEFIU1pMYVExZzFlbk9EVEM3dnBRVlRn?=
 =?utf-8?B?Mk4wMFpLTlhEWmlWL042Rmtrd2h3Zlp6emdCaWFZS1BtMXdkUytkTmhMaEFG?=
 =?utf-8?B?WENNUmpqNWI4c3lvMVJrTDVBMkIrT21La0kzNm1ITnJKdS9Nc1RvVS8yYzJi?=
 =?utf-8?B?N05oQkhaT0tpMlZOYUY4QkZ3cCt5OWt1ZWg0WHA0ZDBGSEVKdml6dk0zS0FO?=
 =?utf-8?B?aEliM1kxWnVsTVVZanNRUGpjSDdpcWhXWEtKempwV3lEWUlpSHRQZm5aRzhv?=
 =?utf-8?B?VmxtVEdoQkN1bjE4cmZrMzd3eE55T250Y0NoclArVlRwUGF2ZFZONmVNU1dm?=
 =?utf-8?B?TUdpd0s5d0JiT2xhVElEN1pKM1FadTdwbjJDNjVOb1FmQVdtQzFZMGF6eXhi?=
 =?utf-8?B?V3VpT1VMUys4R1I4eHRINlpBZXJyQStFVW9sQ3EzYklLaGEzZ0RrOGdYdEZY?=
 =?utf-8?B?M0pRVVR4SDliWERtZHQ2ei95eTY0REkvMmkwSHRNbDFNS0ovaXdHREZvaXBm?=
 =?utf-8?B?N0RPMDNDVHFkMkM5YUYxbWRYT2xHNXc5VDhUSURySCtpeEFUYkJ4a1JVWEc2?=
 =?utf-8?B?aU1qQzA1RlREQlpCU2tua3Q2SG00VWh0RklIUGlrdU50a0Z3REVnZytzMlFL?=
 =?utf-8?B?NU5zK0VpaXVyWGgzMGhsZFUyczIvdmUyZVQ3K1BEZ3M5NndhbTVCUWoxQy9Y?=
 =?utf-8?B?eG1ZT1R5M05kYXdzLzFWSzB5ZzhaQzRScUt3MS9PdFNCK0pxbnNncEVHelZw?=
 =?utf-8?B?SHQzSElxZnVqT2pONUYzZktlbVhsdTgxTnVIK2c0SWxEN3VHNy9VVUc5UkRq?=
 =?utf-8?B?VzRwelBZSWpvVlpCQWg4SDZkRFJOWXRDVVg4V3RKMkhxM1VnMGFnRUxJb2VR?=
 =?utf-8?B?UVdlajNuTk1NS1pSV2QxQWJDLzFHM1g2OGJjWGxybmVURkNaREZaTVp3ZmNY?=
 =?utf-8?B?bXJmRmNqV0ZUaVYvdURLbmZuTmM0NHVxOG5UTnFkSUtBa3JXUzhKZ0V3TFJK?=
 =?utf-8?B?amxyQ2g3UnZBb3MybmdtUWlSMCtRb1l4alNxcFhKNjRZQlNYS1ZzWXpSVE9E?=
 =?utf-8?B?WWU2WlVESC9DbWtCY2dzYUZwcUpHdHNnWHQ0TjU0c1FtU3g1Wi9hYlp4Y0Z0?=
 =?utf-8?B?WUlpWE1hRmt1cTJyVzBEM29UckQ0RHpySCs0aGN0TENwaHFiV1ppYWFkaXov?=
 =?utf-8?B?L1dMczdzWmdKejZqVlN4bE8xYUNjMnhqSmdKbFdsWHBGZDRBNkIxRWVkTGdq?=
 =?utf-8?B?Mk1KUkFkblJFNnZuT3BMMFVNYnF4NENwUklYRmJQUDhVUU1CeDNUdHJXeEdn?=
 =?utf-8?B?TXM4YVBDaWFPamQzdkt4dTVPMW5RRStsaVlYeDhrRUt3ZEJJVllEeVB6R0FV?=
 =?utf-8?B?NFB5NlZCekRwWnVacHNJaFpVejl6d2JuRWtrOW1ZS25iS0FETjNKdkNac1NZ?=
 =?utf-8?B?eWhCdGhiRVFWNEo2Zng5VHhTdDczSW5NcEhVUzdyNVlPNTlnd3J1dURnZHFr?=
 =?utf-8?B?YVN5UlVKRmdUUFRZYlQ5YzhwT3MxcVZGT1A3V2pRUTcwdDRpUkE5R0FCaU1X?=
 =?utf-8?B?QWxlVlllYkV4c1Rlb1o3RUNGMFk0RCtUbnVpbDJBZHNqdThFYXVhQ1l2SkFq?=
 =?utf-8?B?R3VjSm1QbkJPaHpvejhxQUVBVHB5NGYxVjQ3ZkZVYnVBdmdvWE1KWktUenpk?=
 =?utf-8?B?UE1ZaWFrdlNJaEoycTNiK1RjSU96RlJON2xKMXRIM3pyKzU3WHBkY2lERTM1?=
 =?utf-8?B?U0VjT24rczFnZUtHTkdnNnhSa05zV1ZnVmk5em5EWWkyMzloQjA4eUlON1cz?=
 =?utf-8?B?NGdhZTdZd0hBdFNXUEswQTNIUjI5U01pUUNUZTlYdHhCUGZKV3hxeVNyaXl2?=
 =?utf-8?B?alRpL3Z4NnJ3Y3A3eVpwYnBuY0lOQ0ZodHJpcHA0cE5tOEs5S3RjVTA3NW1p?=
 =?utf-8?B?dTZUazJMbE5JcUpLUzRmeHRpVkFXd0ZyMk1yaUJtaWQvY25kVU1RdE4rQlZr?=
 =?utf-8?B?SHlMK29nRTBLNENKbHJKRW5yZTkyOVRMVzRuNHZRc3Z6Nzd2ZTRjUDlTUGFu?=
 =?utf-8?B?NHFnTmpSelpRbWpWN3VVdDM3MlkvQ3hGUkdtTzFUQTlreFZzVEg2Ui9FWHF6?=
 =?utf-8?Q?BsuzvkPMpSiLQu81vlJ59EVm6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbaeaafc-d97c-4c3d-b1b7-08dbd0bcc36c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 16:02:15.5156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KlTE6wzXNvPrEigsQYWis/t32LnTgkfle8jANWsQF1DTMPQqgR/TB6f3CDI37KwWQBeauwa5uXMx0RekBfML/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10047

On 19.10.2023 15:11, Simone Ballarin wrote:
> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
> headline states:
> "A 'u' or 'U' suffix shall be applied to all integer constants
> that are represented in an unsigned type".
> 
> Add the 'U' suffix to integers literals with unsigned type.
> 
> For the sake of uniformity, the following change is made:
> - add 'U' suffixes to 'mask16' in 'stdvga.c'
> 
> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>
albeit ...

> --- a/xen/arch/x86/include/asm/msr-index.h
> +++ b/xen/arch/x86/include/asm/msr-index.h
> @@ -22,7 +22,7 @@
>  #define  APIC_BASE_BSP                      (_AC(1, ULL) <<  8)
>  #define  APIC_BASE_EXTD                     (_AC(1, ULL) << 10)
>  #define  APIC_BASE_ENABLE                   (_AC(1, ULL) << 11)
> -#define  APIC_BASE_ADDR_MASK                0x000ffffffffff000ULL
> +#define  APIC_BASE_ADDR_MASK                _AC(0x000ffffffffff000, ULL)

... this looks like an unrelated (but benign) change.

Jan

