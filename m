Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC5D50813F
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 08:34:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308880.524756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh3v5-0003QE-S4; Wed, 20 Apr 2022 06:34:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308880.524756; Wed, 20 Apr 2022 06:34:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh3v5-0003NN-Oi; Wed, 20 Apr 2022 06:34:31 +0000
Received: by outflank-mailman (input) for mailman id 308880;
 Wed, 20 Apr 2022 06:34:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YZ94=U6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nh3v4-0003NH-TC
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 06:34:30 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee456b72-c073-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 08:34:29 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-dI7dYchyNDOg793RUVKpsg-1; Wed, 20 Apr 2022 08:34:25 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by HE1PR0402MB3356.eurprd04.prod.outlook.com (2603:10a6:7:8a::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 06:34:22 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.014; Wed, 20 Apr 2022
 06:34:22 +0000
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
X-Inumbo-ID: ee456b72-c073-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650436469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MWFDDgg8Nbqzjp77dd7JQVOZiKBHZONaRwwGPMrVjrg=;
	b=Y/SXI/YoETtnguY+cY01g/s4+ymh2l3eYbEb+M14J3hwzzwWgPOcQFYo1wJsKWU2bhRbQT
	v63IId/j/nGXu8do16sWbAFs+3xQQ/3XVPwFlZWs8RxdKYqsRojg1nsEfH+4N84fKolS8R
	UMVELud643CiK3Pj3SHZpKAW+lALFAY=
X-MC-Unique: dI7dYchyNDOg793RUVKpsg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q5/MWbeK6TRJSMFnPjAE8QyR4iwHyitTOKNAYAOSudOyybkfsF6w4bv4r0tunM6RK/23RUGPo3dOb8GzhB4m1wOnJhTrRVFbx87ZNktwap+xHQvVTspaJLyFT1V4PxsNu0e1yCvHfvQ42yQAmWZD700yeZSmfnswhA9MsfOcxMg3FNfQP4A1f0J3xYLr5/i3Uu4H/V1vDafJgrflRKiCfCuL9KAqFNpH6c7ax8oEaiRMGlSepcCfQ2259rPJwHdLi2cDAem6C9LZXNzJxXeezDOurx5usLcvYzN7Kz0ZYw+BcZiQgyUbvrshScxHkRuPlzvHTu+cpQxF+srI9LiI/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MWFDDgg8Nbqzjp77dd7JQVOZiKBHZONaRwwGPMrVjrg=;
 b=a8q6rZSqHJwF7lxhbafe41OaOh+dw6iJt+TudD1tYY7xBw335o59xbJDQLuzEubJ2mfv7aGttSpXqYqnS0IAX8uKa5eDPYCuU91uCKr1LZvhp3niPFKfPfJQgsAow32cfjIwHXWx0cwgL01p3YriqEdrzI6psMVFhOlQvRZrDOrG2OFc/EejFDRPoZpgjd6oMvc38iZ9p/q/ay/RPvYK69Q0nZiRkJajuOm+1+SSygjj2zVi9j48y0AtbHWMoYwPb6oVB0xjQmB56WjiAIY7VfUYuSjuCak1KO2JIKBt0cCg37vNwxBDgDH+6uiCMeKjS9D+Znu/p6THLpfJ4sGiog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e7f51753-a113-086a-16d6-a334095dfee0@suse.com>
Date: Wed, 20 Apr 2022 08:34:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1] x86/mm: avoid inadvertently degrading a TLB flush to
 local only
Content-Language: en-US
To: David Vrabel <dvrabel@cantab.net>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, David Vrabel <dvrabel@amazon.co.uk>,
 xen-devel@lists.xenproject.org
References: <20220419150320.64783-1-dvrabel@cantab.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220419150320.64783-1-dvrabel@cantab.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0049.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::26) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32075c38-4289-424a-de1d-08da2297ce69
X-MS-TrafficTypeDiagnostic: HE1PR0402MB3356:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0402MB33566E07D25C9EDD65CDF314B3F59@HE1PR0402MB3356.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L5Z3k4TAA8wYq7AwKtPMLBg2l1p/3b0pLhcX4Asv+v616bjlF3lu6i2f8O/DzlCD1Avg82MSAfnLyPxn9Omh5JsnAp39qnuBwkUI+NRty8zT9WiAwKX2nRdRBHhY/grzWSZEy5jIPH0qVJJV0awoSyKJJFsMj5DoEJO39a5xNWPKunuYralAQt3VbwmjJgljizkHs/M9qCniSlCPKhsiUFRQWjhGBEuRwbb3FTX9zVCkQjH/nYbdN4Z/YGo5X1vaVNUaOa0Bk9EUiFhMS0WhWO8ErQDKb2b7J4pkPgcNwB0nXr+MB5+GlymV5M1afGwjB5BsNDwM1cDk59NIHtspfa8Q3hJJX4gy5TvzjHtc5qbYTkHFguD83thj2BI/8EbBABisubauErCEX/JlA3MeRUW248bFWyX1fJ7/QHr0GbdO8YxkDBeN5IY/Ff6aTBrgijGnZubF4UWIthb75HFSbVb8t5Ez+rRWE9BaRrvgMgPHhMM1ekCmL4ZeuxVvseQgFL7hTZVlV/OxIz6ke4FmOOXNgK8N/4Okd+7aPTbxRwk7C2vqwPi67i4ua0QfWy2zJeib5GLuh6aKQKoOUHg9HAhUBZbQyvYrCP+iCiIaq3e5z9qBx95Eq8e2BmXXlo10mZbEnhWt9qaNdAx/KclR/H4ClDF6D2BQsXlQEADI19q1tNpjK1dqvVmZwl03LVBxQ6bwAcBE4oWMwiJiuMmVk2D6rSBdZsNuLBwI0dXHrLBoIPLTTUFshKDCu8mR9Pc2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(26005)(2616005)(186003)(86362001)(38100700002)(31696002)(66476007)(66556008)(5660300002)(66946007)(4326008)(8676002)(83380400001)(31686004)(54906003)(8936002)(6916009)(53546011)(2906002)(6506007)(316002)(6512007)(508600001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXQ3TVZkZTN5VHVpekhNdjJML3d0RExLTDY2L1dKSDBLTTVVTGMwN1BlME9X?=
 =?utf-8?B?emZWSnVMM0dYcDc0WXZwSFgxZG9wSG1mdFZIVmFYSG5RcXFvNlZyOXNVTXYy?=
 =?utf-8?B?ZWZwa296NGpSa3Q0ZkVkbEpmWjZCNm9YZlUvc3lacDYrcnVpSkhMZ2xwaHFP?=
 =?utf-8?B?c1g3VlBDRnVTOGpudmVkMjQ4OVNDNndJeWo2SmpCRlVxL2NWWTA4NnZ2YWpK?=
 =?utf-8?B?ZXpPQjFoK2MvY3NpOVh4VEpTN2NpUnNha1FJa2wyWnRZVExieDhKNng3NmNa?=
 =?utf-8?B?MnZIZElVaU5xODBKUlBBWFdsRE14QlBMdUtBMGF6NjgvZC9WMmUwNzJsbkZN?=
 =?utf-8?B?dGpicklxQ3pGWnY5c2xEK3FCU1o5S3h2SnNnQVlnRjZhWjIzZmFJenpLZTlw?=
 =?utf-8?B?U2xMdVNscTQvS2RuNVk5UWJoVFpsMUpna3hOekZ1ckx4SWIralA2Y1lyN09V?=
 =?utf-8?B?VG9jVnZ6UTdBMHl1UEdWUVhHTEdVUmtQYkl1TVpVSi9YWFZneWVHYVhTbVBF?=
 =?utf-8?B?a0lTK2t0VWEwVWRtOVJvQTZzaUN1dkJLanFoQXR2NS9Kb2FjVUYvUElwRHhF?=
 =?utf-8?B?TENDMXJodXVjcFlFN3JXOFZxTklYUW9UeDN4MHhSL0xhWkNyZk5ZUlJpdW5j?=
 =?utf-8?B?RTE3TE1IaGNjRjdac3U2anZ2TG9SS1BIQnFOSkZza2prSjFZUGJsdER3QTg2?=
 =?utf-8?B?bjh3WE9wYzhLY1FGNEJXaVlKU2IyY3hYd2xuQ0RGeVNkNUQ4ak1CZjcwVlB0?=
 =?utf-8?B?dC9UUldKYWxCc3lweHNWR3RzY2FYbkt3YThPVlBFclVWYlBoR2o2VTBnNWZH?=
 =?utf-8?B?YjVzWWxkZmdMYzRKQXcyTEhlL3RmN1pNU2MwaDRGc1B1a2J2TEF2RWxyVVQx?=
 =?utf-8?B?dFUyalFoTng1VG53eVBRcHJKOExLMklpSFpJdHE5UnpudWJtcVM1enRRc3V1?=
 =?utf-8?B?TDhmNUt5SkNpamRMY0hYQW5mbG9JTVpNeFNSTXJGZ3VXVVo0Yi85U2c0ajRq?=
 =?utf-8?B?eE95Qml1NEJGZEdHd3c4TjI1SlVOZXZxT0padGg2ZzJqeUpxSmtEejRnTGF4?=
 =?utf-8?B?TStJNkxCWnpyNHc1UUdvdE1xUGloV1FnNmplZ1lDQi93dnhiekJaU3phcHhT?=
 =?utf-8?B?Q3Y3TE5SOFN0bzJsZ1J3RVEyNmtsdkV6QkdHMEg1NmFWdnIyZDZiMU8wZW1m?=
 =?utf-8?B?U2luZkFVQmxwaWhxcG5tY1B1QkhUc1ZUQ0hrRWJkTXdvenBqSjJGaHk5Q0Y3?=
 =?utf-8?B?YU5MSFh0MmFsZjRSUlFTZGdoVUYxdnM4V3pSWTZJcXR6Z3JlVjdLYTVFL0Vw?=
 =?utf-8?B?eGxTS0FIZFc2VG1nVUJiampLR0V2T1lEbWdTRkVKK2ZLait4aVp0Ym9xaXhH?=
 =?utf-8?B?cjZOYVZxV2d1dkgwaC9uNXQrQUt6RVFwaks0QXZoSWlWL0NTSUJuMnQwRXhT?=
 =?utf-8?B?VWVmeUllVEUrVXZ4SnZGbTUzSWNQL2xWZldUb3d0R1FNSkp2aXNnWVpoOEpz?=
 =?utf-8?B?ZUZmYWdhaTB4NGdNREVWbVNQNml5bDNSUHZLTFRKbkFmMnN2dUxEbEtDZVJ5?=
 =?utf-8?B?SERGUzNEUi8yRHZNNm5PS1lRUDJmTnJlbE5mOXNURGtDNFNQTUliTkFPZ29a?=
 =?utf-8?B?N09WRThMZ3JVT25sOUdBeDRxWnJRcHdPUVJ4UVZHZTJTMkhvR2JVZUFRbTVk?=
 =?utf-8?B?RlUyQ0ZBbkFGWEJEUTdXTWI4TWVLM1c3WHg1dFNlTXp5R0xRQWZSVW0vOUh6?=
 =?utf-8?B?WFh4bEp1dEZRSzduSjJJTFV3Y0VudGxxOUo5NEVvOW9jWS90ZExMWW1QampN?=
 =?utf-8?B?S2U1QnU4OFI0b2l2N1RMKzRheXhrMWtURHlzTk80TGR1dENONHlsMWhhbUNj?=
 =?utf-8?B?S2RMdFJrNGdQOFprSGoweC8wOUkzZFNnYmZHNFdXd3BkVWFtSzJNWWZ1OUt1?=
 =?utf-8?B?NGVoT005YW84eU9SUVZ6RnZ4dERMYnJQNFR0VXRNdFl4N0IvTktSU1RlZ1Vn?=
 =?utf-8?B?cUNMOHl6NGJLLzJZQVluNnNPVHl6Q21uWnFrK0lNU0w1ajdwNWxrTE0yNklu?=
 =?utf-8?B?MGY5TlQvbFQxZDhHV0hNajZMZ2ZFK3hjQzM4RVl0S2JzRmZCZWZsWU8vWGRF?=
 =?utf-8?B?RHp4TEN4TlVHK0cvMGgyRWt2d2RXTWhuZTAyNEthTWVwd1RtUFdMS1RwNjBI?=
 =?utf-8?B?UVhoTnZXcTZ0V2VMYW5UTTgwb0lPQVY0Sm8zTkNkZEFLWkNwTXdqYjBFOUhX?=
 =?utf-8?B?Q0Z3RkxFZ1BYRi9BV0ZiSjJldjRHcHFjZFNNT1R5N3Axanl5Q0FRQ2g4eXYw?=
 =?utf-8?B?RitkUm43NnlKWklLcFU0NHc0UiszTGZaT3B1OEhNdldFWHU0SnFJUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32075c38-4289-424a-de1d-08da2297ce69
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 06:34:22.6359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zng3WHmqrmm08/BvAXXV8tqbnch5Jd8Fa6jt6KgBRbGb8AvrINIAufgM/ASxKSj6dBR/s7GZ+be43EabSLz/8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB3356

On 19.04.2022 17:03, David Vrabel wrote:
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -5071,11 +5071,10 @@ l1_pgentry_t *virt_to_xen_l1e(unsigned long v)
>  #define lNf_to_l1f(f) (((f) & _PAGE_PRESENT) ? ((f) & ~_PAGE_PSE) : (f))
>  
>  /*
> - * map_pages_to_xen() can be called with interrupts disabled during
> - * early bootstrap. In this case it is safe to use flush_area_local()
> - * and avoid locking because only the local CPU is online.
> + * map_pages_to_xen() can be called early in boot before any other
> + * CPUs are online. Use flush_area_local() in this case.
>   */
> -#define flush_area(v,f) (!local_irq_is_enabled() ?              \
> +#define flush_area(v,f) (system_state < SYS_STATE_smp_boot ?    \
>                           flush_area_local((const void *)v, f) : \
>                           flush_area_all((const void *)v, f))
>  

I agree with the change, but I wonder whether it wouldn't better be
accompanied by an assertion proving that IRQs are enabled. But wait -
flush_area_mask() has such an assertion, so all is fine.

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


