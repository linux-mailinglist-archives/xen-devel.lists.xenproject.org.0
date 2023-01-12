Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F85F667113
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 12:38:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476014.737986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFvuA-0003Li-Qd; Thu, 12 Jan 2023 11:37:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476014.737986; Thu, 12 Jan 2023 11:37:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFvuA-0003J1-Mp; Thu, 12 Jan 2023 11:37:58 +0000
Received: by outflank-mailman (input) for mailman id 476014;
 Thu, 12 Jan 2023 11:37:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmgi=5J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFvu9-0003Iv-A7
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 11:37:57 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2075.outbound.protection.outlook.com [40.107.247.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8df43904-926d-11ed-b8d0-410ff93cb8f0;
 Thu, 12 Jan 2023 12:37:55 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8186.eurprd04.prod.outlook.com (2603:10a6:10:25f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 11:37:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 11:37:53 +0000
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
X-Inumbo-ID: 8df43904-926d-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bm2TzNmG86VyTb+YkVJHeWy7eZjV+fMTAt4aEfXTZ+/jCWWJAq5vZUrICDvPBNHyPCBK2C9OE+nTmKv3/1nAycAZrhwE6yGfuzRvMrvwlUMc0T0RiedEEKA1+M0A5s4YckAW1CyqePLBCh0y4nBxcoV757ovESQ+Tn60+KmcaPPFLqQz5XSlBIW+Fxi2hkPE3JyHA3seaHJTVSHXMuDD4jmudOWuVXD/pN02Ip0LqqkkhegHb/hVrsWoxoNSaVo0vYR+6D9A2VO6z4m5aARtqszWW8hNK844o7bSrc2YxyJQLUcH47Eb94VGmFEsJbu28j5xbDrRb3REFhedmEjEYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LFq1SuO2v0RB+u4AyJ9axFl5wmBeX6LwrzPowh4qFCw=;
 b=edGQJ2Ix2jOeUZDmKzyX1V5mHduawwr87FSehtRjuR3yykEch0q6N/YUDJvlyCsUtxFj9xQnYZBvPrjgWlrfOeGKaToXm75K2ZVI4xAoJ2NqmuoYvayC/nbx3DRCeXBjrex3xQkEdMEyhvnIXN69uV0+L3NkY8BdyWtLJU42c0fsQyq50cSb7us+GWW72465lWwQx+8OQMypVzptfrf2KBN4izhG2jHH6dyATBPCwAn88Q1I4kwzyC980NO23F3efBoD7JlRO5xHklRTxcpnoFO9mQ7qtRn5Rc6Vc2g538zAMTrKFtzF6NwzXNSiKKY4dVtvoDZXurWu/MLQxCw+Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LFq1SuO2v0RB+u4AyJ9axFl5wmBeX6LwrzPowh4qFCw=;
 b=2iIS3n1Jpy8713XJREnMS6DXyP/3Qt1l+wc/Zd6GQEjH3vOe96SYBeu+ZPlasdWYhTE1/Y9mO+711J6Jl/a0iSYF5jrD1A+eVTdtq7e0jhept9D0H/2B+CgPeYiCEpeG+VINVZhZInyadDS9H5NqxRijJyyKKZ8Xy/FtAiLyrPkGa3ew7bMNztfG2mKOaR0n5si5CN0fjVVaXeelo2cWmPi0/pLXHKGBd/NpRRCE35eY8v+tVZdAPgdjAOJIQgY7zX/3LVlHpkRqqd2ls+zQpHpVa5/qCVXgK1q4B+nyNuDwkvdsxRWWy/ejUwO4moc20xcm7cp3TPGpLYPKlPrIDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b73afacf-a23a-7e51-9bd3-b90b3eb484bd@suse.com>
Date: Thu, 12 Jan 2023 12:37:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 4/8] x86/acpi: separate AMD-Vi and VT-d specific
 functions
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20230104084502.61734-1-burzalodowa@gmail.com>
 <20230104084502.61734-5-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230104084502.61734-5-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8186:EE_
X-MS-Office365-Filtering-Correlation-Id: a1a08cc4-2ac2-4f17-73a5-08daf4917121
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mbe29RhmPzt2j7O++JTtuamRvA4vrzmlpo/zpw5/FlI7EMWoVkGHb+8OqZ4hAvmu/twSTRWjbxzL8ioLxh+WcLsOn3mFjntZwuDmGqEvIeX4UmXHZf2HBQCKRj8917fhr8SH7fzKHAMcu00FHA9KmzbqBkcqqKnkfwABNGjtDbuD1fX6pMK7Ui0sU1cbYStRJp54HHotXqN4iKBqeoG7BzjHqWMn8eweneZ1l3ad82sRtducI6tVIC18vgO9zTibau39b0d1zLjoMtj9r0V74rBzkLpKPP/momp/oPVQn6BioPpCYNoDapASYngFe+yoHxF/Lw9nVYP2kzL/hwUpwPdoyD4XrxxIqZNvtQM3usVcTBlzYsCf+Ygz5av0zAcuZRGVn2l4AVv8FIW1KHI3DPllyRWqWSDJfepXQtX1Yx1CbLVGJ6mGRL4mQ/H1Z+xM9K3Tg2Xy0eeojzO2C5PpL8VWowyR9SyqSx/nBtfyoK64ymp3FMXJVl07yohuvMTp5DfBFJIKygu4/EefWGHrdAXnVCFnj+xr0L8Ln1CSMejcVRLzWP96NurJgmZcsozdPAd/aYq0SfAHSKA+Ba/qj0+AwgTwGUcQHbBSvX8NaWBQ7Z1w3sSV37kh6HulDnpaPvx2JKMeAOz/N7T1Rg/Pu1TDoXGwgTI89oXcGsxzDs3GNzMfDc9eT2zeGYzYCubdYlfnPgMQuzYRcMdBmE1aXq/nf7kKbrT2WYxnL6pNj3I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(376002)(396003)(39860400002)(136003)(451199015)(2906002)(83380400001)(478600001)(66476007)(66556008)(5660300002)(66946007)(8936002)(53546011)(26005)(36756003)(186003)(6916009)(6506007)(31686004)(6512007)(6486002)(2616005)(41300700001)(38100700002)(8676002)(54906003)(86362001)(316002)(4326008)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1pEUGUySUhNWXdrYWduYy9Nc0ZFaFVrVzFIK0FiV2xhZVF5cnZDcVhUZ1Fu?=
 =?utf-8?B?dkFLb1lOb3dWZTlXdTFINkZVeVNMbXBqYUxRRC80KzdBanBJSXBrYkpmWjdX?=
 =?utf-8?B?WlF4NTg0SkM5UDQ0UklSajFDMkdSSGhhQzVYMGpESFVObm1zMmhSbVNwc3F3?=
 =?utf-8?B?cVpOQk9mVzJzckVidENpci9hNll4WGN3L2hZL0lYazBSdUZUNWdYOEJjc3JP?=
 =?utf-8?B?RFdsT3dLRHJJL3YwZmpWRTFSOVRGRk0zZk5ia2xuNTVURXdDMnVkS3FoL0x1?=
 =?utf-8?B?WjAyQlRpL3FYdDlvdVpsRytsVGd0ZS9ZYnF2NUhSOWVlZHVDeGVCWnI2SGVP?=
 =?utf-8?B?MTd0bzhuTzNTUkRjQ2ZlN0dmeVY1UHAzc0NjS3BaaUl6TXZ3emNIVyt5WXRi?=
 =?utf-8?B?ejZMMXRWS0FHVzNaNk1OSHdGVzhRRUM3d0pLRGhMNU1ERjJuVFA5czhzanBS?=
 =?utf-8?B?RTV3V2hkeUxGQzU4UFI2WGVwRWh6VnBNdjdJeEowazdsK2NLQnNZSFpGaEhu?=
 =?utf-8?B?TXRLMTEreUNjVkgrR29mb2t2SEdtdVRQakwvZ01kekVHaHhtVXRCWDBEVGg4?=
 =?utf-8?B?SVJCQURsQ3N5MDExcU5oWEZqZ041YkViQWtXa2R3OXlTdTNqc0w5S2lKaFNh?=
 =?utf-8?B?aTdxNU01Nm1obTNqU0Z6TmtZV0JYQ2o1TjdBUzZNZytqbEY0ak1YSTJKNVNy?=
 =?utf-8?B?OU0wUEM0UlJ6dUxPVzhza3lKbDRKU1FKYjR2TDdXcXp2Z0c1My84TDBvTDhC?=
 =?utf-8?B?V0tYRDdxTk9KbUpYSU50WWY0VkVId2lRMHRYbzlmakZNWTNENnc2a2RLZWll?=
 =?utf-8?B?TEg4eGhXVzk5Wm1ENUxIeGo3dDlEYlczUGwvRjYzQkx5QXBZTlhFRDE0Tmlh?=
 =?utf-8?B?a1pQaUZpWHJoc0liMDNiN3FVekVIZEJ3a1FEUjVmUjluQlIyQTVqSk11V05X?=
 =?utf-8?B?cFJmZ3UxSUhsMnVEOVNCdEdIS21PSG0zaHdoK2xkSW11U2p1WHh0ekIwS0hH?=
 =?utf-8?B?cjh0TkpUazE5RERnZ1hXT2tJeGY5ZFN5VDZjVVdmSkRjdmh2QlR6aGU1QWNW?=
 =?utf-8?B?ZnpVM01ENjVvSm1EUmhveFExUmNPQncrYlgxd2dGS0FyOFphSjkwSWZYUzlD?=
 =?utf-8?B?bW1Pak5ZMUtzeGtNMUFMelJNbHVJMlk1YkJtSlZMd09oQmZycDN1ODN4TTdD?=
 =?utf-8?B?Z000K2E5KzJ0VGxKSHdLalNXWjRISWUzNSt4V2wvNFJmdHNoV3hFdWcwUkgx?=
 =?utf-8?B?ZTByUXF2Y3dFYjF1ZEptWWVmTjExV0NrV01aenFqc0RjMnN2cGQyRnllUkxZ?=
 =?utf-8?B?bHBOOVdkc0NwcnpmdjdxME9mOHg1R3RGbkREN2RHcUY3VDBWYmhTQXp0RStk?=
 =?utf-8?B?U09saFpZOE5PU210YURDWVVRZTZMYWxxV1ZRS29saC9VQVp0aFplOU4vSjZj?=
 =?utf-8?B?TEVRK3hnUXk0SXVkTGFRM0dMblpTSElmV0grSis4eDBTTi8yWDdBd1loTS9E?=
 =?utf-8?B?bkYxa0FwTWNvT1V5VjN1cmIwRWVEZldhanRKcUVNazkxMElUQkVna0FjYUZ3?=
 =?utf-8?B?NEErcXpPWXkyMHloRXVZRit2QjduUzJPY09rMytsV21mazJBSXFFanJNS0Zz?=
 =?utf-8?B?U25wVTUvdFNhZUFpSm5FWEZGb3pqaGVJcVFQZGR6OUszTWVBRzdMbkpoWDI2?=
 =?utf-8?B?aWQxeEttay9aZ2JzTkNJYkVXcys4alhobFRMRFFIQzZraGJlV1J0NFFZN2dz?=
 =?utf-8?B?OXlHNnRpL3BJZ0NyemNCU3VONG5Yejltd1BXblhZZ0ZwNkRLUWJWZXFvWW84?=
 =?utf-8?B?UGFLN2xFQzN4My9wVTk5bUJjNStEV21DRHF3SktmUm15MDRmaWlKU1BydWVE?=
 =?utf-8?B?M1Y4Z09ldDNPTUVyK1hBOVJiRDFhMUEzOXEraC8zczZ4ZHpNOUpUL3huYnRX?=
 =?utf-8?B?UW90dFpHQXFqRkxyUFNsSFBFeW84Zms1KzNsdmNIcXBXdlBZOXZ5bFQ3SGVt?=
 =?utf-8?B?cmtmZDlxdXV4dG1DTnhXL2YwNEo0Z0NpZTdia0E2cmxXQktMR2M0V0FYMjFS?=
 =?utf-8?B?T3RuRDlCbW9mYW9XYjBoOVF2UUZPQVpyejQyaDdVVGxLdnlOaDhMdUJxdmhU?=
 =?utf-8?Q?veqpPRF/ogqiaMzWarBhxV6/b?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1a08cc4-2ac2-4f17-73a5-08daf4917121
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 11:37:53.3674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wWOIxg5dTJgIQzsVyOyUtjLbU2auARFFDECXVdCuxW1pS5h0Kh88cyAYeF9wV//Wvx0w9N3MsGQRqqPXlBvh6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8186

On 04.01.2023 09:44, Xenia Ragiadakou wrote:
> The functions acpi_dmar_init() and acpi_dmar_zap/reinstate() are
> VT-d specific while the function acpi_ivrs_init() is AMD-Vi specific.
> To eliminate dead code, they need to be guarded under CONFIG_INTEL_IOMMU
> and CONFIG_AMD_IOMMU, respectively.
> 
> Instead of adding #ifdef guards around the function calls, implement them
> as empty static inline functions.
> 
> Take the opportunity to move the declarations of acpi_dmar_zap/reinstate() to
> the arch specific header.
> 
> No functional change intended.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

While I'm not opposed to ack the change in this form, I have a question
first:

> --- a/xen/arch/x86/include/asm/acpi.h
> +++ b/xen/arch/x86/include/asm/acpi.h
> @@ -140,8 +140,22 @@ extern u32 pmtmr_ioport;
>  extern unsigned int pmtmr_width;
>  
>  void acpi_iommu_init(void);
> +
> +#ifdef CONFIG_INTEL_IOMMU
>  int acpi_dmar_init(void);
> +void acpi_dmar_zap(void);
> +void acpi_dmar_reinstate(void);
> +#else
> +static inline int acpi_dmar_init(void) { return -ENODEV; }
> +static inline void acpi_dmar_zap(void) {}
> +static inline void acpi_dmar_reinstate(void) {}
> +#endif

Leaving aside my request to drop that part of patch 3, you've kept
declarations for VT-d in the common header there. Which I consider
correct, knowing that VT-d was also used on IA-64 at the time. As
a result I would suppose movement might better be done in the other
direction here.

> +#ifdef CONFIG_AMD_IOMMU
>  int acpi_ivrs_init(void);
> +#else
> +static inline int acpi_ivrs_init(void) { return -ENODEV; }
> +#endif

For AMD, otoh, without there being a 2nd architecture re-using
their IOMMU, moving into the x86-specific header is certainly fine,
no matter that there's a slim chance that this may need moving the
other direction down the road.

Jan

