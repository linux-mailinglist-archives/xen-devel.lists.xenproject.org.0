Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B17F3CCF54
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jul 2021 10:20:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.158197.291336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5OVf-0003JQ-OX; Mon, 19 Jul 2021 08:20:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 158197.291336; Mon, 19 Jul 2021 08:20:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5OVf-0003Gx-LV; Mon, 19 Jul 2021 08:20:19 +0000
Received: by outflank-mailman (input) for mailman id 158197;
 Mon, 19 Jul 2021 08:20:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTRW=ML=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m5OVd-0003Gd-SE
 for xen-devel@lists.xenproject.org; Mon, 19 Jul 2021 08:20:17 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 24d00413-e86a-11eb-8af0-12813bfff9fa;
 Mon, 19 Jul 2021 08:20:16 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-LmqIy_HvOcGLYS9xExP_JQ-1; Mon, 19 Jul 2021 10:20:14 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2703.eurprd04.prod.outlook.com (2603:10a6:800:ae::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 19 Jul
 2021 08:20:12 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 08:20:12 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0033.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.24 via Frontend Transport; Mon, 19 Jul 2021 08:20:11 +0000
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
X-Inumbo-ID: 24d00413-e86a-11eb-8af0-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626682815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+pzUDLabhAU1CElnoW/t1BEgFFiv9swMoUtBn9WmeSA=;
	b=HxWlwkqBXpjOJSvp2gllraM/wIcD0U4zUb6n+ukkpLARp0G3eMg7wkIyadKuW/RReS65Xr
	72d6bgtv45pnekzX44gmYDrqHuFa0VCvetEO41eOvXVj/gp8ni+/4FZcfl9DiX17lnKWI4
	pAHgZ3rpYwJE8uIXQNpVgAVc2k22QUs=
X-MC-Unique: LmqIy_HvOcGLYS9xExP_JQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DTRmFhm3W4Kd6M2EIjbXgYfGOUv+aGmZzt2b1WXFKgW91sKSYx+1rHu6TE6xy4H/1D9e/qpyZFkzckdJbw9Y01QrBLN3LcfxUVbZOfIdhu7DKr2+dMqhbZA1z6b3colV7rtvJY4lDnf+bYKPo/aAM6TrcvZRHH9jb3/Gb3Cx94xjl8DoYw9DavQSByp5plbrMqAp4iri4ZdbxNjkFON0QnZP8I4bYPyEUMaB3HATG4TRVoKeDR966Id6QcYONb/pwfBKmUocsFJPMkEaCjGQRMHpbF1vICEoIqYF5YpZuaMQ8Bg53ggisOKxJ/RmPQPNiDTlxMOsXdTvwOTyXEHIYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+pzUDLabhAU1CElnoW/t1BEgFFiv9swMoUtBn9WmeSA=;
 b=gqY4NwVyF9eTfj78U6SzaoJ0WMc2Cg3dr59oF+2j05US4WSox67iOuTMlLAbYkbjJgSwc76cu3r0SSHKZIHnSYuLRx4d9k9rFR9xx5S4D4snZO/WhdJx8ZhHcyV0btUdj1KAqAUzu+UzevNft7iSVNMGyWQuJyRxYH2d5nfC1nGw5iGz1bBpJyorOH/a51LWXylRzsiC7fDVoLeunODdQpctSNWzVda4yNeMVyf8oKPhHARnkkgRC8YcMssnd2Rjnbv6g+u4oVNdec5bP35zyaxRA0YXFo9EIgDLm4g26uVjTRp4dD0Od3oB2Uh+zQdl96HDqsS1Av54JuwIDYNoeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH V3 05/10] xen/arm: static memory initialization
To: Penny Zheng <penny.zheng@arm.com>
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org
References: <20210715051819.3073628-1-penny.zheng@arm.com>
 <20210715051819.3073628-6-penny.zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <295913d9-5727-2ec7-ca20-70b94c53309d@suse.com>
Date: Mon, 19 Jul 2021 10:20:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210715051819.3073628-6-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P191CA0033.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64211b6b-0ff0-4a8e-93a1-08d94a8e0777
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2703:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB2703168E0A928117B2C6E141B3E19@VI1PR0402MB2703.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:345;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+E0wOlrj6UozndZjLDCgrfFq5AEeZhJeD2nwMbnNbXaRaFXGPclN0PdMRNUsBHynpJrks43CUH2GysTTbfEbce8lbkcyjf0YWUVdESLNbc0w93MVJNx1shyOGP0CRz6B48ygazr1pvCWh3zazERp316Hx5mSCurNDHPWmaODr/+bsdBY7+6tcES151ZgfhizbTf9rXJLy8dh497DXildQ25K7dzpnXuB/9ZMydroIFVKK7JqB1/vZ7bDqkRcAaouAJHYtSwzxTSh0sL7MT3fpHq4p/eUa7qGVC2Sm1roNdIZWb0SyS6wXXLQOvckr08ywSd3ZTHUlG8zfZlbz7z7tykVJt+lI2TXvFNiA05OutEpzNq/mg1Wict9CZbooZduVMFnlSzWQIWKQAyky73PvARUzlUZgTV3aPPSFvZWPUOGtm6CoiOSNu/+VzMMjewk1PK/ZBmtCahywn9jBBpnffdrh4u/cYbBffg3iXRrwoND5BEfRkb0w+5ZSfyH7GeCgGUXLrGg/FNJnpTd/f0aorDJbXd0aXoltW65uSAd2QSLj5nYtN/gzCUJv0cELrxH7sLMbdaesLpvVvzV2pCV3qI8/pBSC5Ht6Tjyo13v/7TLJLymNnpC9qefclATXD6P6vW27k2R2gXDlMAzQgMBVgUptUInDwcJkRu8jXc2NGEguZOGRE9O725ovIke/gEDsftw0T9RuFmpaxnK5j6d7CkVu8IT28TkBtkalX6SNbE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(396003)(346002)(136003)(366004)(376002)(26005)(53546011)(6916009)(186003)(2906002)(86362001)(66946007)(66476007)(66556008)(316002)(31696002)(8936002)(5660300002)(4326008)(16576012)(83380400001)(478600001)(38100700002)(2616005)(6486002)(956004)(8676002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rm9yRFMrRFNnaTRwRnRnbjBlZk5IeHV4WDRIMGYwbTBBQUtXczdxaFp4K29p?=
 =?utf-8?B?eHdpd0J5Y2pqbyszMmpGeTRpK3FhU0svTTQ1NEVKaGhNYjBCY01YUUZ5dys2?=
 =?utf-8?B?SXdXN1FmQlZpUWJibFNxQ091MHBDOGlONkgvcTZrNTVnVVBmbTZhcjVZVFJQ?=
 =?utf-8?B?OWpvMFh6ZUFmKzNzQkd6MGRoRndhYllsbDBEWU1QZWtiQlpzYVYzaWg3QmJ2?=
 =?utf-8?B?ZmxIZlNLbjlFVEpFVWhJVElsMXIwLzZvT2NQNGFkQnQyclFCUHVDVXZZUmdS?=
 =?utf-8?B?OUpyOCtZTEpMSEJub2pFVFNwRmdJSUVYcTVXZ1VHNUlMZzRnRi9Rc0NRUldi?=
 =?utf-8?B?azM5SFljRXFyL2VIWWwxZzlZeVZKQ3M1TWt4czZoWVNIZVlQd0diODQwanBB?=
 =?utf-8?B?NVdNZTEzcFJHQzFVUmxabmVZbno2MFBRWUNhL0pUNDV2eW4zS2grbjBrWGEy?=
 =?utf-8?B?Q2NPREJ6bmhQaElQNWhYRXZVQ2RmUlllSG93SStTUHVEbHRsbDAyWkhxRVZ5?=
 =?utf-8?B?K1dxcWNMTC9UYVd4QUkxY3dqWjJqWXlVYzFWM2JlY3lVSEF4WjlnRGJ5dHdI?=
 =?utf-8?B?MllKVU5lbjBweG91WkRyM3BZTzdaS2lQK283SjFKbnJldXplWHJ0cktYT0s3?=
 =?utf-8?B?amh5N1RGSm5yWndjYiszaUt4SEJyQ1BsNGZJejJKNmxyU0JUU2hISEIydXhG?=
 =?utf-8?B?YTVkVHorWnJMdFN1Rk1QWTRzaDUrOWI4THg4S1ZNT1RSaWFwNWxCdkpPMndz?=
 =?utf-8?B?dVpuUHdlalAybHFHZVZ2bVhsSXJrNzJIWkczREI4RDNVY1g1ZzZxVldJQ3JG?=
 =?utf-8?B?Uk5nQkNHMWhTRTNPQUNlREpqdXFqblRBRlg2Y3pLNXFScmxUbTRQZGh4NDUv?=
 =?utf-8?B?UTZkaWl6dUdoaVlTb3lMN1pZS0hTVXJmWHpjMUpaQXAyYUxIMW1vOG1mRnpC?=
 =?utf-8?B?SmcxL0dQNENYRlZjT0JzY3pkdnkvb2dRUTR6K1R2aHViS0pnMGdDY1ZEcmxE?=
 =?utf-8?B?Ry9RL3BUblo5cUNmbVU4Q0NBZEZQY0pET09oQ3kwV01CMG42ZVppU1NtM3ht?=
 =?utf-8?B?Z3hKNGlxNjRVYlZYSU5Zb3J0VDJTRzRldnlwMUlheTRRd2lISTJBYXk0SlB6?=
 =?utf-8?B?ZVNYVWhuSzAxYkhOZ3ZlRGtNamJ4Um9LdUlKdXJBOFV0UzVhWjZaUTlydEtK?=
 =?utf-8?B?SXVpdGpOdFJaRVVFcXdlbFdXd2dsVFNaN1BmWmUrckNnUDBIbE9GL2lPQW9G?=
 =?utf-8?B?U2RaUjA1b2pzWjZkcnVLRTd3U09FN2gwWVE3YllSVEhBTnduN0ZWbVdpVUo0?=
 =?utf-8?B?SUZvd21WRk5OK2wyaHRFWUlWbDAzWkkyaXkvejdEYVJqbTdjSjdaWmhZOWY3?=
 =?utf-8?B?L1pyenNTU3FqVDkrc1FISEw2NEVMYzRyVUdYZ1NrN2RUSkdjaCtPNmxFMVF6?=
 =?utf-8?B?aWNOVFE4SnovbmM0RzUrNHVqOHdZUTJHQ2hOendIdW00TXpveENZeTZubHJN?=
 =?utf-8?B?UW5Vby9nT2FCM3JYbmdYQ25OTkVydXVhMTNzOSt5NjhRTTFPeWlHWHFkWmN4?=
 =?utf-8?B?ME9zU3RWSGlFangvRW1KQ283eitSbnJoMC9Jd2puMUdHTHVPb1FpenN3SDRK?=
 =?utf-8?B?T1FUdzc5dnRWR25yeitUMXo1Z3Y0NHUvQjVDM3M3blZFQk4wLzRCempPd2My?=
 =?utf-8?B?dFplVmd1TzRtZWpKZWFseGtHdi8rVVhNWFZGdElWazA5RkJEbW94RnpNd2Uv?=
 =?utf-8?Q?sL8B2HUYCPBVzvCENgLqeeSa0bOz0DKch6pCcz1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64211b6b-0ff0-4a8e-93a1-08d94a8e0777
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 08:20:12.2183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yxq1a/xr9napseJ0fjs3wgR+L5TNiQHnWB6U0CyIAP9P5u4Lg2DjsyDP7geufD71gzTWTr+c1j2fgZL/VXH7EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2703

On 15.07.2021 07:18, Penny Zheng wrote:
> v3 change:
> - include addition of CONFIG_STATIC_ALLOCATION in this commit, where it
> is firstly used and also change the name to CONFIG_STATIC_MEMORY
> - Fix TAB typo in Kconfig

Not sure what this relates to, but ...

> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -106,6 +106,9 @@ config TEE
>  
>  source "arch/arm/tee/Kconfig"
>  
> +config STATIC_MEMORY
> +        def_bool y

... this is (wrongly) using spaces for indentation.

I also wonder about the placement: Shouldn't the option live in common
code, with Arm "select"ing it?

> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -622,6 +622,28 @@ static void __init init_pdx(void)
>      }
>  }
>  
> +/* Static memory initialization */
> +static void __init init_staticmem_pages(void)
> +{
> +    unsigned int bank;
> +
> +    /* TODO: Considering NUMA-support scenario. */
> +    for ( bank = 0 ; bank < bootinfo.static_mem.nr_banks; bank++ )
> +    {
> +        paddr_t bank_start = bootinfo.static_mem.bank[bank].start;
> +        paddr_t bank_size = bootinfo.static_mem.bank[bank].size;
> +        paddr_t bank_end = bank_start + bank_size;
> +
> +        bank_start = round_pgup(bank_start);
> +        bank_end = round_pgdown(bank_end);
> +        if ( bank_end <= bank_start )
> +            return;
> +
> +        free_staticmem_pages(maddr_to_page(bank_start),
> +                            (bank_end - bank_start) >> PAGE_SHIFT, false);

Indentation (one too few spaces). Perhaps also consider to avoid
open-coding PFN_DOWN() here; in fact it and PFN_UP() could be used
in place of round_pg{down,up}() above.

Jan


