Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9018177B20E
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 09:08:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583216.913300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVRgU-0006b1-Ov; Mon, 14 Aug 2023 07:08:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583216.913300; Mon, 14 Aug 2023 07:08:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVRgU-0006YG-LL; Mon, 14 Aug 2023 07:08:14 +0000
Received: by outflank-mailman (input) for mailman id 583216;
 Mon, 14 Aug 2023 07:08:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q53I=D7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qVRgT-0006Y8-F3
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 07:08:13 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060e.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54164f52-3a71-11ee-8613-37d641c3527e;
 Mon, 14 Aug 2023 09:08:11 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8966.eurprd04.prod.outlook.com (2603:10a6:10:2e1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 07:08:10 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 07:08:09 +0000
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
X-Inumbo-ID: 54164f52-3a71-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ay5htbgV/oXxoM01WF9qu2/JXrIV/xI5rHuz3ScLS8TwT7BM+WZzdF0jAoade+Z4l5dD0Z9f4iZ2LWDGX6dWQ3zDm7rsvAZ+4dHUAzuV+1TlIAk+8mTR0TyX9AEqgvTgfaWm9iQ/g0G820QK8fQwiCENscLIqHnUEIJnXUw+IeXUeJqsFJcZ5VaZF06mGw8XN1+xwcinME+V4mqfstoPZqSLHMtd2o+R2ebCLpVpz1qBO0WRtxGc6+6zptJX1jrDOWeJHPRf74SvNsiehOsRq8rm+sSaTQOQukwWCLGf03JKe60bqQJbz12rd/KJY5d08teEJzeTvZbp7Mryx3XdaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i4MT8U04pUVILJ+is/obhh2uqWpJo7Cvs7MTCjEqp0Y=;
 b=jYZ3aZCP7zqiem3k7ftcflY5fwHE8QpMYdlYjewh5FbHrGw4BMGQi49wMiuUpNDcviEG3C5CEKlLkLpvJE1+YWGAWzIu5TfBrzHQQGz2YSZE4IcE9+Kc+tQG0aVWXIaMjPO2V80lSRtxwYrzy7Ik00tYOr4grF/kkfRnNEkMPfnFziizSTU0KDFA22HpK8pGkmuz0iLcFTv2caY6WP2izdSm8uAQiVr7E/1Z0sKEQkyti7wdhgpy05cDjS3qE7JIMnCGVW3vAF/Dv/V2B2UTpv6Negg2qb//KVJ2Nx/d2Px7bUVkrKz2XEQs3VJAR+ftFIyqNjMB1EdOXhbA8JSw8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4MT8U04pUVILJ+is/obhh2uqWpJo7Cvs7MTCjEqp0Y=;
 b=rgdRX/++hm1kBZqL0NcAdgHk/J915iWxZ5E/NjntgPu0+kCyXIsTcRVZRSDs7veCMfCQyJlnDVw9avY092XzkPcq48Sl9tBP6bKPCQUCn1qmdjeAJCQAThf7AuIf4+ii4THd/T7wMECHFhxdeSb72JCeUL10q5aMg35cfv+J2smT7CEjHQyTHY7OgZYHSpTGdB3j9fsAC+LruRvMD1lBc048R0tUjuIN1rasvl7WLMZfrLCJy+dkX/mNNPcoj8oqTH9kKAU509h+Qr8IZNprdTNW9strMOYWdd67+wcre8UUBNaUy6ouhXr6KsfYnWE1Y7RnD0POkdr9PoTqt95ZhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <59478354-6805-8a91-776e-93a4cbdb4efb@suse.com>
Date: Mon, 14 Aug 2023 09:08:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v5 13/13] xen/arm: mmu: enable SMMU subsystem only in MMU
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Penny Zheng <Penny.Zheng@arm.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
 xen-devel@lists.xenproject.org
References: <20230814042536.878720-1-Henry.Wang@arm.com>
 <20230814042536.878720-14-Henry.Wang@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230814042536.878720-14-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8966:EE_
X-MS-Office365-Filtering-Correlation-Id: 8941006e-b9ad-4b90-df1e-08db9c95377e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V4tnhDKIaLuPdycVZVsXus4PFFtFIQ8syOgsyt7z+EyJoY3jbIlljhwa360apM3RrVOLPgTKdXD1ES1MTXbZFqvryA8zetV2ls8UBOHSUfMl0swhgsZ1UGzfQZR7PUz9AW2R/5hWCxz45hVYzVjWMHkb/twGQvdL+EftLDyeQAxarV22EaZtuiFl8G+Lap/BQOJoXu+Bmp508crQTuTWHUGTQpJ+FbPtfDYcKM+lhC0PR2vUsX3ZHNaps6B1+kkHQGbQaecRsraXupHxXFudmdT16P+aR5ILGf+RTbaO1Alx8uYbuDKVwuLxvrCGak1QWfsel9b4lH6N0fFiRm6CjAzPdmaD8XXFTM1bQwuY8vilgHofhT8edo0OKiKC4FJbBqOqdDGwCDrOqF4BhQKYRzBARlUvPPKMiluujYK9gKzknGMK5MVR/3atIfBnfg9pX7dYroikVXrvnGD3BM5EGhZz5I1BxegsM/+q7XVxDjEulZkaMpaUMZsxzx2v1eX9EjoC2XiX+KlGHp3UlAJcqXrwyQiW9pmLu24s3vv1Hw6HDpYOtCCQyi82b9/eYsgwhDQIksUefVWWHBonvkkwu55hI0/NACO22LgMc6xrAtMfcxHRka5tg7+SMuu4BEuB0cV12HokErqa0RMF1RcqbA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39850400004)(376002)(366004)(136003)(396003)(1800799006)(186006)(451199021)(53546011)(26005)(6506007)(41300700001)(8936002)(66476007)(66556008)(66946007)(316002)(8676002)(6512007)(31686004)(2616005)(83380400001)(6666004)(6486002)(478600001)(38100700002)(54906003)(31696002)(36756003)(86362001)(4326008)(6916009)(5660300002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUx4SklYeHA3OVkxQ1BFc2FoazNFUHNLL1VnZ2VRMG12MDRITGY0d3diaHdh?=
 =?utf-8?B?VGpwSEp6cVpMR1JRMEkxSEw0Tk5UdlNaZW1pa2lkTzV3ZmpYL0dMN0Q5N2ZN?=
 =?utf-8?B?SkdKREQyNnlKOHBoMmhZTkJuYUE4eWVsQjg5WGlGRkFsK0VrR2pwMk1sVjk2?=
 =?utf-8?B?NE1PeTdROGxIS245Z2VlSFpMaS9XdVdMdHZxU0UwOFphT1ZNYW1CMHZTOURV?=
 =?utf-8?B?UFQvYm5KMlc0RWVNUlAxOFMwY3FNblFXWmpxYXlpTHQwYlhFY2toczlHNHph?=
 =?utf-8?B?ZE5lby9BUHRnckk5cmNqZG9vOVpjWlBERVQxYlJLMGFMdFIxRjdnRFlaQTNL?=
 =?utf-8?B?eksvelFSVzB3alhjN09RTlQrR2RoNW9DWTFTN0ttL25NamlHV1RHNGxOUkUx?=
 =?utf-8?B?NFJGVGg3bkNJYmFjUXltY1VJb1NoNUJKTFdRYTFFeGFrU1JUZE1IOHc4MEhN?=
 =?utf-8?B?cHM2aGJTZ1M2Rmtpa2lCejZNQXhYbnNETElpMmtWakJweG1CSXBYSnJqdERC?=
 =?utf-8?B?WnF2SUtDaG8zUEFDN1NPd0hVU3gzQzBwREpkZ3hPQTlLSytFSE9QTEV2aHA1?=
 =?utf-8?B?WUVOa3MrSFJnS3E2bFMwbTM1ejdKN290YWFVRlVaZHVySTRVYUk3UnY5OUsz?=
 =?utf-8?B?OXJyVGFERlQ0WGNxWVNKWS8vMFovWmYzbFpjNXRyL1B0NllyQ2hCN0NJcmc0?=
 =?utf-8?B?NVdQZzhNTk9mdW9iRnM1TXdnbkEvR3dDODFFRmZ0ZVZLczR2MGxKak5BbHlD?=
 =?utf-8?B?SGljejBTZnVQVVA3cHl2NGp0V2RmQ1BnT1lyR05lLzdHWm1SSGMvUHVISnAv?=
 =?utf-8?B?dTBScnFJQlBUQ0h2Y1BzSXFxbURXRmoyQnBQOFJQK0FhZjFMN2x6elRzMDRI?=
 =?utf-8?B?WTRVRU5JRmc2aUtWZ0FHMjJ2bmR4enY5cHlteURQSmVLNmhXRzFFaUpjU3Bw?=
 =?utf-8?B?RndvU2JwRW5tK25jRE1XVCtROG16VXlHTzJEaFpCWHdVNCtuYWRpU0FCTUpq?=
 =?utf-8?B?bWdldmJLNEkwaDl1NC9Yam5pWWhkdGkvS2Z3T1A0T2V1b0JSU29LenlEK3d3?=
 =?utf-8?B?RnZJa1lJQ0xiem1ldDFPTDVibklGYWMzSG03ZkJmSHppd2ZiRnU2Qytoc0hv?=
 =?utf-8?B?NDltakZXSzVaQkRDVTU2ZE9SaVFqS0VQaTFkNzVqRzFFNE9PUW1rR0wrZld3?=
 =?utf-8?B?aTZFSXowR21TTXJvRjYrRWd1MERiSmJieHpvU3NHV0N5WHJ6MEU1SE5nSXln?=
 =?utf-8?B?QzJQVnNNSWJ5VStEc0tCaThKeUppRzlUSVFtL20yQTdjYTl5VW1wa3dHR0R4?=
 =?utf-8?B?WFV2YkRRUmhpSFp3ZXpXaUNubjZlaHNhcHVZUGVYbyt5WkFwMTZnekJjZEpI?=
 =?utf-8?B?dUFocnJzNlBtTEpCeWJYR3ozWjEzZGI4REN6VGJIcm81cVJ1V0VoTGxZWVpV?=
 =?utf-8?B?cXZOM09pTzBlQ1RjM3Q3QnNYTFcreWZGTGlsQkNxQnRFd3d5RGt1SjlEZXFK?=
 =?utf-8?B?R0lEVjJXcDVXem5JenVQREV6U1E5VUViY2NHVFltTDBxdFpqSHQrdDlWOXpo?=
 =?utf-8?B?Qm94S3huMWFtQ3JBRzdmQ3ljVTZDL2lhMjNrc1N1cFl2dklzWmNoMlhvSExh?=
 =?utf-8?B?c3dtbWFlOGhMbUFnZHZxOXkyYTNoME9oTndEaTFObzVqS25lUzRYQlFmNUMw?=
 =?utf-8?B?VWNFeitMOTBNcU9rS2RQSk1DUVpieFZKdlNXT1BqU3hzdStHbHVWLzNHYlNJ?=
 =?utf-8?B?ZVBRdmZGUlZqc3V6NXRhSWovYS9LU0dBU3N5Y29oQ2dPU2VWK0ZhQXBWY1BT?=
 =?utf-8?B?VkRLamxZTmpNQXI4QW9BWFFYUGVqZEMrelEzZHlyTFZHRXE2azBIZ2dmQVMy?=
 =?utf-8?B?MVM1aUd3dVR1aFB2RjZLc2poZWgyNEdLeEJqZDQzY0pXS2h4RktzUDE5b21F?=
 =?utf-8?B?dmlTN3I4SkxPWUJwTUNPcldIUGpPanhSNWwzNDNGbTJnU3N3Y2hEc0k4WUZv?=
 =?utf-8?B?RTRUNFVTazhvTjdJYjNEWWdwcFdWUWNLa1RvaUlZNERZbjREcWNwWEs5QXMy?=
 =?utf-8?B?RjlyOWREMmNERElMY1VuU3ZXNVdSKzZHdE1BZVBJN1ViZ1Y4MkZFck5GaDZz?=
 =?utf-8?Q?pkKJ5mkYh3v/4vAhVPeoLU1z/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8941006e-b9ad-4b90-df1e-08db9c95377e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 07:08:09.9292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YbH9IcFsI1swV18gXNmRYgPWTOdN/KaECmNQ8EHnAVloUqKSmt8/PUZuSXZwo/DmnxFEocDhKS3o5MER5swmWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8966

On 14.08.2023 06:25, Henry Wang wrote:
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> SMMU subsystem is only supported in MMU system, so we make it dependent
> on CONFIG_HAS_MMU.

Nit: Stale "HAS" infix?

Jan

> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> ---
> v5:
> - Add Acked-by tag from Jan.
> v4:
> - No change
> v3:
> - new patch
> ---
>  xen/drivers/passthrough/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kconfig
> index 864fcf3b0c..ebb350bc37 100644
> --- a/xen/drivers/passthrough/Kconfig
> +++ b/xen/drivers/passthrough/Kconfig
> @@ -5,6 +5,7 @@ config HAS_PASSTHROUGH
>  if ARM
>  config ARM_SMMU
>  	bool "ARM SMMUv1 and v2 driver"
> +	depends on MMU
>  	default y
>  	---help---
>  	  Support for implementations of the ARM System MMU architecture
> @@ -15,7 +16,7 @@ config ARM_SMMU
>  
>  config ARM_SMMU_V3
>  	bool "ARM Ltd. System MMU Version 3 (SMMUv3) Support" if EXPERT
> -	depends on ARM_64 && (!ACPI || BROKEN)
> +	depends on ARM_64 && (!ACPI || BROKEN) && MMU
>  	---help---
>  	 Support for implementations of the ARM System MMU architecture
>  	 version 3. Driver is in experimental stage and should not be used in


