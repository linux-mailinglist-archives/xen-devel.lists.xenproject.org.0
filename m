Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D19F2769ADE
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 17:34:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573149.897581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQUuK-0006TM-SO; Mon, 31 Jul 2023 15:34:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573149.897581; Mon, 31 Jul 2023 15:34:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQUuK-0006Ri-PB; Mon, 31 Jul 2023 15:34:04 +0000
Received: by outflank-mailman (input) for mailman id 573149;
 Mon, 31 Jul 2023 15:34:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bN9S=DR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQUuI-0006Rc-Py
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 15:34:02 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0612.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abc36738-2fb7-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 17:34:00 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS4PR04MB9291.eurprd04.prod.outlook.com (2603:10a6:20b:4e6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Mon, 31 Jul
 2023 15:33:58 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 15:33:57 +0000
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
X-Inumbo-ID: abc36738-2fb7-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WiE+qymxkQrGrz9L4LOA4x8/bQ/qE1Y01gxFoQfy+FTo0+lXwTdZ2bpyOMY4ccooOl9mmRUCyeJUPDyUdvfunrWHkgC6Tw98iVDmw9g5hx0f7BPiIN6ifGbci7FH1qgXSjd1txwDrjT2CTBctwP+7W0OjtHo9HFeZfJGGs+i0Xxn0dqDbxrAVs3nrHm9HeZ3ImmZTRFbgDk6H6j92GZCMSGo8r9we/MFB7vMfIdWlEGa/dtzx6HQUWGe7oea/pMWCckhJUc2oStgkbl3VgRZRnzZ31rOb4g0TJaZ92ITdbYcCgUo3b/tPLVAw2TvlmbaRfxBE6vCtAckp9uNmL7aIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QGuU2cA0djyl0WJPXqQcpX+FVfV9zrHacjGgiEzsKaQ=;
 b=c63Nvg0HNNA/BbhOepaSDrc8X6ZD1EY0qi3GKwtQBiY1Tm7EBohcFcIMc/zF+htYFDmMQGzJKldsPmwMy+itJ3IGuMk2QnFRhUw1Ffm9gENNWXlce8xd72FyVAv525f0d4GheCkeXuFYYmUZ7XFQwbd5r7uRmSk0Zm0r1kjMHnaxxZn/UORCCHmcvBibWJrHt45Yn5kmlRDYMkRFMdeXIQf3MeU57UbKBZ6ds/yd5ofCVW0ZozwHVmJgQ2uYm7mMrl4DUcqPsdnnVAOA7cZwQ0hAUcX7gaDp8O1LjFzn/pPBa+443PO/707aWj2PdJ7G7rtoHfNrCEskXBiA6KnW/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QGuU2cA0djyl0WJPXqQcpX+FVfV9zrHacjGgiEzsKaQ=;
 b=RvPY702wJ1adXkdcnwW0dIzTd25Wc/dlKOvhTUCZbgtMpqOAY7R7CQWj3lasqiV7CDtErNUSEcgJHNgZSztS0zcnIYGraqHas+thhbnirthbNfqZcYRO/95USlLziNmWVt+nEpidH0/UDhoKu/8joHfFzruirNdq75p0jkoSr8wSKPu81aodqYfqhG5pT59fP9p9vcqTe0RKyVRDhJ15oqnEBLyCAFdSdRQ2+eOP4V3aHbJq60Suvoa4W7o9r7qu0+TkHUCAv2hLEURm4n6ZVT97BFsgcAi7f7ZaHwkUTfxb+941RuKadyJ7KFFMDphKweNLjnTH6fOnmYr0L3PFWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <64540ae0-7954-38e7-42a1-2c4ff41bbf62@suse.com>
Date: Mon, 31 Jul 2023 17:33:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v2 5/5] pdx: Add CONFIG_HAS_PDX_COMPRESSION as a common
 Kconfig option
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230728075903.7838-1-alejandro.vallejo@cloud.com>
 <20230728075903.7838-6-alejandro.vallejo@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230728075903.7838-6-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0160.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS4PR04MB9291:EE_
X-MS-Office365-Filtering-Correlation-Id: a28a6de5-9700-426a-decc-08db91db8e77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oyeokBMQd7y/JcwSz6pbjYC6wVEhrU43O30FqPMSzfH+HRxznr+fbzgeSpBWQfaZVmMaX0GcImQ5DsZq7wMC4tMOiDeTk0HTvEFxL7PmxfDL1r4x9fQfFhMJOEPytGqo92TgWr01rPV3iVSqjlXPgMyO8TC2TxXw31cdKlHm5GdrqpCN4buoCFXzRJHsrbq/inQW2+HrSMv8QDvUcaXyrPT6nNQ+quXdVz7dLakYqBvuzHKXXJx9HPtRSEK74mAdbqJjiLROoQOcPgfJ43G3r9vmOs/6opNwXF2KvfM8DNDHUk8J5w0yYV8U2P1HdlxTB+J/AONyg0sesL/Lj+CyPM38jJOB68rvt1ApLXP3todb7zNhe0YoeJETAMbfHWbRhmhkMxii6P0+7cSUcVgmkSzrT/vv6rkaNqOS3k8cgKrd7w1IJqCcB8WN5bmyhg+lLqmUIeVB1GTyg/qXtD41Suvi87pvt8VR2hRDBJ59Vq5XKqF3tLqSjwV2P1MWIXq+ApCLbl6nQXE6F+pyjyDvcZojsI9aEP6kRx1v7fpk9CHYgfS+jM0kQHExnRVEAXKsnYyLu+fM8hGdG96QMqn+tWG8QHpzreqIQSX4QAO19BGUmDvNJ7uLDcVHCc/hmpUDAlny5UBf98T918mttZaMuQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(136003)(396003)(376002)(366004)(451199021)(31686004)(2616005)(5660300002)(38100700002)(36756003)(2906002)(31696002)(83380400001)(7416002)(316002)(26005)(478600001)(8676002)(6506007)(53546011)(8936002)(186003)(6512007)(41300700001)(6486002)(86362001)(66946007)(66476007)(6916009)(66556008)(54906003)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDZlNmMzNlpINDY2K2lZYzdrZ2l2Q1M5SlM2dFB6Q29XZ1BTWlBUcDluTEcx?=
 =?utf-8?B?dk93dnlKcXFLNTNlRzkrRDk4UGZOc1lxVklvUi8vN2FPeTdIdFAwdFBWZ081?=
 =?utf-8?B?dmFWY3FCaDFjSno4U2cyUzlCVzNUanV6Z3FiUzhsRTZCSEIzRGZYazdTTUor?=
 =?utf-8?B?K05ZU2lIWFdUZk1lc1RQa1hNbXJqWU9ETHl1bW9aVVF6a0dIK1l4eWttM1BD?=
 =?utf-8?B?VFV5ajd0N3lzNFZJN253YXpoLzFXK0ttNEdSdVZMVGNqckdhNUlocTd5QzR2?=
 =?utf-8?B?MUhUdTlBYUxhYVlHemxyTFhtcnVvODZCOElDS3htV3psVzFvTEhpTE9Jek1t?=
 =?utf-8?B?cnc5eGxaZ3VUT2ljWXBCTkh6UHlHM3E2NEpucFRzYWgwMGNQSW1FWDNsSUhQ?=
 =?utf-8?B?LzcyaGZEQmZ5MlZaS1E2VzVsRlpRcmJ0T0JQeWRBdnZyYmpQekVPeThaV1Bl?=
 =?utf-8?B?VjJLNEZkSitrTWxFM3MvSzZzdFZBaWtlRWlUZHpGaWM3VzU1NDQ4VmRzRS9l?=
 =?utf-8?B?WEd4UTNsb1RIK09DN3E4NGhKNlNYbjk4aThQM1ExU2NGR3ZmR0VJeWhQYkNn?=
 =?utf-8?B?TkpxZ1o0VTlpdVdTUTNyWDcrU01CSUNFNGptVlhrSnZBRWVMeXBqTlZRSmNY?=
 =?utf-8?B?WGZQVWw1WnZBcmhvQXk4MXorSTYxT1ZMWE80bnhEdzdVb25nWDJyMkdmZTht?=
 =?utf-8?B?VHFzYno5bTBNTlBKQlhKeFJKN3FyVzBnZm5id1JSSjFLWUt0TzVEQW1KcCs0?=
 =?utf-8?B?dFZEMG1ZdVVKTlV1SVkzaVU1aUlhRUNxMEc0QUIzNDZ3UjN4M1JDWHIyTzFw?=
 =?utf-8?B?dUpRZ296TUdMdWF5N2dwdWRESjJSRElwbkIzWklSaXFUdDdPeFVpVnFFeitv?=
 =?utf-8?B?YWJWMkdKeG93Wk1rUjhlL21hWjlNcnJERXoxcGZ0QTBBSlk3ck03YnVCakgw?=
 =?utf-8?B?UEErcXFnOWxSM05KT1J4V0NzWENiT3UvWHNwTXhBQlgvNnRkN3h6STFGNW1F?=
 =?utf-8?B?UWdqT1hvamlvd25DTXFNMzdFQW4xSkp4SlBDSFFCR1hvMnBOK01HZkpLS1B6?=
 =?utf-8?B?aHIva0RvVjNSaXMwUGFidStYNDRaZnc2bnVhN1FlQ1dPTkEzaGNLS0l4MERM?=
 =?utf-8?B?cHptNFZZblJmSldKMXgvTDdvQmllb0xGYzdkbFFwZVB4bDd3a3B1c0ZKYTlF?=
 =?utf-8?B?aU5lTENFbFJyQ1loTlVtcmM3aGZBeVAzNnRuZTlIdDZRRnpQcDJCRVpVV3p6?=
 =?utf-8?B?ZEJhbHd1UWlDRHBGWFlvSmpJbXE2ckxZa3F2elNzeDQ3MDhYSUwxdlVtWEhH?=
 =?utf-8?B?NFcyNzZCN3p0R3ZEVWt5NVNFb1IzMTFpNks2dnp5S1E5WWF2eGV4bVNHaUY0?=
 =?utf-8?B?WFQ2QVU0NWxmUEhKT1FEUVdhNUlEeUVhQWxHTUtZQVVyS3hSTmttZFlxbXJo?=
 =?utf-8?B?dFpEdWl5dUw2WFVEZGtMeTM2eXV4L1U4NmxKZ0dGYTNEMkg5U0RDeGw4R1Vv?=
 =?utf-8?B?bFd6RWpPTkxDa2lFTERkYXBQV3JHY3k2K2o3dWJiSnd3VDdRU0N3d3pnelVE?=
 =?utf-8?B?SmJQbm5lczB2ajh0S09mZ3pFN0xCSEczbUowdW45WmE4V1NQNmtXUzQxRk51?=
 =?utf-8?B?bHFRZ3p4ZUJOeGdLQ3c0M1JpNzVTQjJvUzkyWU1VSW1xd3Bmb3VwSndhN2F2?=
 =?utf-8?B?TC9WZ2RFK2lHeXdXckw1ejMrOWQ3L2MzVXprekFsL2Y4WllSTWNuaUV0UWtR?=
 =?utf-8?B?YS9ROXB2MTVrbk9vaUtJQXdlUXZFRFA2ai9CUnpuZ0pWTDU0cjcvRnlqYSs0?=
 =?utf-8?B?TktycWhLZktHdnpyS1JaM2RneVFrVzRmSkR2ZnNTdjNGZ0JVanp4QzVyV2dm?=
 =?utf-8?B?eEY0Rnl1eGp1L2wzY1BUa1FjYStCWFpDVjY2M2MrMXd3N1BsZUxOT3ZvMEFz?=
 =?utf-8?B?ZWNlUHhuM1ovL3RaTGNIcFcxOHpmMzVxN2xHZk90RDV5eVFBclFhcFQ4Mmh3?=
 =?utf-8?B?c1RuU3AremQzNVB1MHdMbGNRanlSUlExenUranIwcG9FYzNJcjlPT3ZCSnUy?=
 =?utf-8?B?NEVjZ0ZsQjF4S2s4V2QrVGtPSmtCc2NNWWhJSTFudEtkTVNhbDNuMlRhY3Y0?=
 =?utf-8?Q?+z1yIWqh5y1k+1WAP0W+XXBNv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a28a6de5-9700-426a-decc-08db91db8e77
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 15:33:57.8432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WuzF7JXDxhv4p0OyYYKm6BVs0LjaqUwv4p6cV2TOe0vzmCvJN0GFGF+QUoN31qhVArzVZRYkvaz8sB4tZK41bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9291

On 28.07.2023 09:59, Alejandro Vallejo wrote:
> --- a/xen/common/pdx.c
> +++ b/xen/common/pdx.c
> @@ -31,11 +31,15 @@ unsigned long __read_mostly pdx_group_valid[BITS_TO_LONGS(
>  
>  bool __mfn_valid(unsigned long mfn)
>  {
> -    if ( unlikely(evaluate_nospec(mfn >= max_page)) )
> +    bool invalid = mfn >= max_page;
> +#ifdef CONFIG_PDX_COMPRESSION
> +    invalid |= mfn & pfn_hole_mask;
> +#endif

Nit: Declaration(s) and statement(s) separated by a blank line please.

> @@ -49,6 +53,8 @@ void set_pdx_range(unsigned long smfn, unsigned long emfn)
>          __set_bit(idx, pdx_group_valid);
>  }
>  
> +#ifdef CONFIG_PDX_COMPRESSION
> +
>  /*
>   * Diagram to make sense of the following variables. The masks and shifts
>   * are done on mfn values in order to convert to/from pdx:

Nit: With a blank line after #ifdef, 

> @@ -175,6 +181,7 @@ void __init pfn_pdx_hole_setup(unsigned long mask)
>      pfn_top_mask        = ~(pfn_pdx_bottom_mask | pfn_hole_mask);
>      ma_top_mask         = pfn_top_mask << PAGE_SHIFT;
>  }
> +#endif /* CONFIG_PDX_COMPRESSION */
>  
>  
>  /*

... we would typically also have one before #endif. In the case here
you could even leverage that there are already (wrongly) two consecutive
blank lines.

> @@ -100,6 +98,8 @@ bool __mfn_valid(unsigned long mfn);
>  #define mfn_to_pdx(mfn) pfn_to_pdx(mfn_x(mfn))
>  #define pdx_to_mfn(pdx) _mfn(pdx_to_pfn(pdx))
>  
> +#ifdef CONFIG_PDX_COMPRESSION
> +
>  extern unsigned long pfn_pdx_bottom_mask, ma_va_bottom_mask;
>  extern unsigned int pfn_pdx_hole_shift;
>  extern unsigned long pfn_hole_mask;
> @@ -205,8 +205,39 @@ static inline uint64_t directmapoff_to_maddr(unsigned long offset)
>   *             position marks a potentially compressible bit.
>   */
>  void pfn_pdx_hole_setup(unsigned long mask);
> +#else /* CONFIG_PDX_COMPRESSION */
> +
> +/* Without PDX compression we can skip some computations */

Same here for the #else then.

Jan

