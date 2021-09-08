Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B80403C44
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 17:07:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182204.329671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNzAH-0000Ki-UF; Wed, 08 Sep 2021 15:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182204.329671; Wed, 08 Sep 2021 15:07:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNzAH-0000HV-QR; Wed, 08 Sep 2021 15:07:05 +0000
Received: by outflank-mailman (input) for mailman id 182204;
 Wed, 08 Sep 2021 15:07:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NNqu=N6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNzAG-0000HO-Al
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 15:07:04 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6b44e665-10b6-11ec-b165-12813bfff9fa;
 Wed, 08 Sep 2021 15:07:03 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-8-MG6RLw6aOzqsZi2-xEwclw-1;
 Wed, 08 Sep 2021 17:07:01 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5471.eurprd04.prod.outlook.com (2603:10a6:803:d0::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Wed, 8 Sep
 2021 15:07:00 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Wed, 8 Sep 2021
 15:07:00 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR10CA0022.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Wed, 8 Sep 2021 15:06:59 +0000
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
X-Inumbo-ID: 6b44e665-10b6-11ec-b165-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631113622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wzbd6DFR/SngT3RP4KdhWBcf+ymOUKJls4cDe7LsDGU=;
	b=N2wcSHX7Re3VuioILRzhvdKK1yeTcmgpt15HdYT3MNnu7AxBWo6aSsdRl44mm9/ab9P69b
	DvbJPHtXG3VCHPyWpr396jJBUnjRhObd2VZSFN02fIRMe1o/xpHIBa0LWklD19QPmCdVoo
	hOeb31tiGwn4PJx5+VUaYCOPkt2fPRk=
X-MC-Unique: MG6RLw6aOzqsZi2-xEwclw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AWLp0uL7uz/CKhn+2MJkjQb5yNRzpDE+36HUOyAj7+aRosFdQIhr3Le1k4I3XoaL3E5W2te9t0NB6uiMRmMjH3SHtbU77nfwM+mlvD3K3lYGBHwvgklHZRu/5Tzsrg4EUXjaipyC3f0CvxEbVw/nUNVzvi6e1zEHr1wywrAVjv83E/x4rCjxBeckZ47BxF7BLwi2CxLq4CFo0E1M1gwzh35iv7UTE+jolK520tTKjqIdHWLtIpwke80EarrzpbN8srzwtvG11GmGOrgCwACEFXkZ5yRH39MvpDVSDhTcECfbaNwL2J3ZP01w+WSv0NGdy1ehZ4R8FAlQj5910wEKsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Wzbd6DFR/SngT3RP4KdhWBcf+ymOUKJls4cDe7LsDGU=;
 b=MrdDDubrQ4khSVypUwGaR76SfuMT+Qj0IVQoCPjQRJVPPEqwjdCr2+nG8ptvMpG1U5ysWtrEt+9sjgTe0vYkybC/1Of4zVE68DwJIMMsbwmdzVwUMJwjZ9ys96OtIVK7Oet5Q16jfSmMKF8jd+3S9+WlxLANT8gnO1Ih0H4AXTBD89vuOSHTpxTwWqle3/VR7RHkYc9eyXGxEPn/7LiVhHwrAMwYT1zuCK1p/NkTjnHtaOlxRvHhW/5Vk7890eEcxXD8/8MEavH1sa7sOLgyv42tMA+Z51z82JZwELTRETOuoZeTZw3xUKB7v6TPDHwmYS4lolSAGEN1d9icCyeBdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86/amd: Introduce and use X86_BUG_NULL_SEG
To: Andrew Cooper <andrew.cooper3@citrix.com>, Pu Wen <puwen@hygon.cn>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210908135931.26275-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2289cadf-0dd6-0b5e-39f2-99ce6f522bfa@suse.com>
Date: Wed, 8 Sep 2021 17:06:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210908135931.26275-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0022.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b699a53-ba73-41f5-240d-08d972da4ecd
X-MS-TrafficTypeDiagnostic: VI1PR04MB5471:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB54719D64D0A4BB19DE03B0AFB3D49@VI1PR04MB5471.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2rFQQeZL1888TeqckB3sHYZp0+jhLV9ctvmFFg7O5xaDy+YeyW6ydS138piziMvXcHrgr1V8l1P9IbG3conEQHSL0mFnED605MpNovXubnitioTlo8/u5w63IqifVZdG89ykJOez3J2NM7bfPocPDf5Ea31CMtSBVs/yNAJJjEXh+IE5JcBZkVGctbr9ghRBy1O+fBIa8eWwM0yA73g7hjdFrNjHB7EEdDpwJOtF5WIE0PHO4r0IAckD88U+r66fqF3fu2YZu65cHzJFCB5qtpKNGDMWG8XgvTpu2Qw08K75ps+JXw2/RsQfxxBTXX7S4G1dp7qdI9g6cOStkw6iExEnJyJYF312adHk/1J9exmI/XS9w445I8puIfvkSBb9XsnknQ1q77JNzXAv7HArrOKmT2xqFWEKBiQ8hYmys0TaaHgyBoUC8TTsyx4zYIq6ZdU99tkFYcVrkE27aKwq2AEsbFjM6sr5PIq7KVloh+2VC1jPU6e9PxS10ONLs1/N5TKMpvIpi2GmVvr4a/dw+Zbg7dhPw0x3TAY4mxSqWEZol6x6cLWBZ2GcMjNw3HllhCBD2ECBS3QsWwgvOvSJDFohKONzuPXtDkCYEANb4Yy5/7nb7sjflgyyRe+PpyWZYDNmkzqWPUz21QjOzqAFCPWWrdz+Pc/EMiUJBTzX/BICWyIQDf7dBbN829FFFpD1wfnGAFqKxn0gHts8tUrPO0Ecn+10L0o/WWPo8d1Vf/sW3vPmE6jJp+oE3SITX+HL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(396003)(366004)(39860400002)(376002)(53546011)(26005)(16576012)(2906002)(66556008)(66946007)(186003)(36756003)(31696002)(4326008)(316002)(54906003)(86362001)(2616005)(8676002)(956004)(8936002)(66476007)(478600001)(110136005)(5660300002)(31686004)(38100700002)(4744005)(6486002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDBZY2pUbXVzZkxLWktGRmkrVWtSUXRrQXgzVG8zS09vc3Rha2E3VFB2Zks5?=
 =?utf-8?B?bHVCbFJobHlmNng4Z1kzUGFENktBQmkyQ1VCUTlIaE9ERkJyRHlqTm5hK3NB?=
 =?utf-8?B?VXBuNjdYUFU4dVJSbXJuY2Fsa3pyaFYrR2ljazNHVy9PUkcvUm1PcU9FblV3?=
 =?utf-8?B?K0ljMWZENnpZeFpRTWFSTG9zMlh4RFJZcE13SFpuOWtySThHdm55a1JDZllq?=
 =?utf-8?B?dUd0RUlyZHd6bUVXWVB4ZUZ2ak9EWEZuNGRkNGdTQjg2Vk1TUnltUTQzWGpM?=
 =?utf-8?B?OFVRVnNURW1zYmxpRTRQR2xmcWp1bU9UU0hSYUpjR3UxeTg2NEovb3pxRWQw?=
 =?utf-8?B?Nnh2a1pRUlNHZUxnQjhtNnNGbHlKdThXWGY2VXRpd0RaTnp5WWJHeUc2MmdJ?=
 =?utf-8?B?R1d6aGRhZzE1dkQycE5iaEhqeVA5S3VrTG9KV3NzLzFwUThFZHVtUmRDcTNt?=
 =?utf-8?B?SGZtRHA3ZnFEdXRhc1FRTHBBT3JyZEx6ZWZZWUEwdlk4VjdlWWl4L0Zicjhw?=
 =?utf-8?B?NnJGanQzZVMyOWJqaU5Bei9ndERETXlzWGZHMG1QbnNRSFZRVGZ0dE9GaDIx?=
 =?utf-8?B?Vk92RnRJc05pWHhqclFid3M2eGZPNE44aFlyY3ZEdDA5UUxvY1EwU3RnZ01n?=
 =?utf-8?B?aSsza3lrOFlmaUdSZUphYW96NnBiMzFseThMMzF6d0ZQNTI5UndRL1RETVFL?=
 =?utf-8?B?djh0bVVabW1RMUc0NEsvMDNnNlAyemN0UkFDL2JPbzI0UDR3NHFtMlhubjF2?=
 =?utf-8?B?NUFUL2xNZ3NCZS8xa1pXL2s3cXl0UnA5b1BWQ0o2K3lqd2JSQ1dGdGJ0Mjlp?=
 =?utf-8?B?K1ozay9uVldVNjlKdzlFU1MvdEMwdkFMMUtObHV4QXRXT3o5aVFra1Y1TUNa?=
 =?utf-8?B?OFY3dldjLzdwanZmeWYxYy9DZThGK1IrQ0VRYittWEtNaFNSZ2Y1aXZnbkdP?=
 =?utf-8?B?eE4rakNyeVZwTXQ3UWFmbE96WldDeEJ2Rk9MdE84Wk81YnEzUDJmQ0xvTmtm?=
 =?utf-8?B?R0g5bUZTY0RxYmVHSmc5b2VlZ2pTWElSRjZoNnJQd2Q1VnZGbEFXcW5BSHRu?=
 =?utf-8?B?VzNUc2lRY1BiVDhNYXVEY3FYd2F2aHk5OFJZVzdrZDBEWHdrWE04akU2bTB2?=
 =?utf-8?B?cWNNYmJad2N4NEE0K09nM2t6S3pGMS9wUVVUaHdubkgrcGVNRHFabXg4YnU3?=
 =?utf-8?B?RWRtalRSZ2FMYlVQeXJzWmxzaHc3T1JnU0VzVkdmUFRIaW1kQVhhREkxSDNP?=
 =?utf-8?B?RjYwLzBWcnhUSVlFd2JiQUROb3FrUXVrZzFrc1pOd0hQZnVIL3dJTW1BdVYr?=
 =?utf-8?B?NzVOQnFiRTU2YTN6MCtnbCt5bDJKK2VXN29HV2dYbE9pUWRuc0JhVC80TW5p?=
 =?utf-8?B?Mk1ETWNOYmkxbHlxMzhJd2ZvckdiUlZha1pDdFRTNlYrOHo5bWxveTg2L3pz?=
 =?utf-8?B?MHE4MkQ5SEs0Mk1laW5xQ3UxVUkxdER6blMrVkVZZHZ3R0hUK2JhVGdlaGN6?=
 =?utf-8?B?eVp0NENQWWlYckVjR241NWxRc2EwMEJtUU5iVGhSQlVmcHM0b3RqNmNxSlhM?=
 =?utf-8?B?c3FsRVpZR01UaDRPOVFVOHJsbDRtR2JXNnExbzhSaWhlSi9PcDV6eGFDNjlo?=
 =?utf-8?B?byt3Q2JQRnI2M1k0UklCWXNXUU5JaHVOSHdhVlFjVWZVbmhlb1ltcm9mSmh0?=
 =?utf-8?B?WCtSQmtMK29Ld3gxZ0dOQUVrR3VSbVhvYkp1RldBY3FRTkFMRktCV0xVbXVC?=
 =?utf-8?Q?lflWO6UA0tEcOW2j/vEtWe3elbw/GZFeW0iKPhF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b699a53-ba73-41f5-240d-08d972da4ecd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 15:07:00.0819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AIaU1nv4XwqpFyM2wP/xRbJyUSeWRi55aGtH/s/okYCT5A4+xFsROMKGZdy5r9WLHccxpMvhSJdJoRYZtG5E7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5471

On 08.09.2021 15:59, Andrew Cooper wrote:
> AMD/Hygon processors before the Zen2 microarchitecture don't clear the base or
> limit fields when loading a NULL segment.
> 
> Express the logic in terms of cpu_bug_null_seg, and adjust the workaround in
> do_set_segment_base().
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit with a question (perhaps to Pu):

> --- a/xen/arch/x86/cpu/hygon.c
> +++ b/xen/arch/x86/cpu/hygon.c
> @@ -40,6 +40,13 @@ static void init_hygon(struct cpuinfo_x86 *c)
>  	    c->x86 == 0x18)
>  		detect_zen2_null_seg_behaviour();
>  
> +	/*
> +	 * Hygon CPUs before Zen2 don't clear segment bases/limits when
> +	 * loading a NULL selector.
> +	 */
> +        if (c == &boot_cpu_data && !cpu_has_nscb)
> +		setup_force_cpu_cap(X86_BUG_NULL_SEG);

Are there any affected CPUs in reality?

And actually (only noticing when seeing the malformed context
above) there look to be indentation issues in the changes to
both this file and amd.c.

Jan


