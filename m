Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4AC3EA7A6
	for <lists+xen-devel@lfdr.de>; Thu, 12 Aug 2021 17:37:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166520.303921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEClO-000735-2P; Thu, 12 Aug 2021 15:36:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166520.303921; Thu, 12 Aug 2021 15:36:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEClN-00070T-UD; Thu, 12 Aug 2021 15:36:57 +0000
Received: by outflank-mailman (input) for mailman id 166520;
 Thu, 12 Aug 2021 15:36:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QHFb=ND=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mEClM-00070K-FU
 for xen-devel@lists.xenproject.org; Thu, 12 Aug 2021 15:36:56 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1f32d616-fb83-11eb-a1cd-12813bfff9fa;
 Thu, 12 Aug 2021 15:36:55 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2052.outbound.protection.outlook.com [104.47.4.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-5qoWwU5XPdylvL9TnHbp8A-1; Thu, 12 Aug 2021 17:36:53 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5327.eurprd04.prod.outlook.com (2603:10a6:803:5c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Thu, 12 Aug
 2021 15:36:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.017; Thu, 12 Aug 2021
 15:36:52 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0044.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.7 via Frontend Transport; Thu, 12 Aug 2021 15:36:51 +0000
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
X-Inumbo-ID: 1f32d616-fb83-11eb-a1cd-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628782614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KIjJYMM+luisI8ZoY4bFx47BA3/mHXMPG72vy79//f4=;
	b=MkradBnWLqqjlKKVZbSanR87wV+K9QiyVISCZ9uSWWEzfYdPBM6ayn75AkOcTuMowS9+hh
	7V81YKQHpp5rdNoATDVixRQ0+8sUQgiVqWl8YEoTZAD88LaTNlKzfgWuoo2/SjbfrgI2WO
	/Ud6g2t1m3yp35jRl1UT7/aOJCSPO3M=
X-MC-Unique: 5qoWwU5XPdylvL9TnHbp8A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RkHPfR3t5fr6Ff05tXK8mOXgIoHgQxgek+poB7o1St3km7W6BGNxa1q5cC9B4aKi8ijBYyjevk7mKRRkHTzljVKFOUjexcJlLbBOmGrDaNGcFckTM4rz/viVaVlOOaoyTft3nNpB8fKYAsnqIWC/1APVMtJMrvN0B0uKE5tI3zVMLFLTYcaaL3qvbyy70ppqBl8L6lL51sixd2bDmweQaV9sfw9dRr3s48jEMpvBWVEUKL2uocpef1x/D7178RZg8vjg99bAJEm2MXngdQR7KJ/HSFH/c2+qLb9GgpYbRfYkQ2+lYkIxvrBkVv4cwuyKxQbtQz6qRayM8PLB8Jb+Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KIjJYMM+luisI8ZoY4bFx47BA3/mHXMPG72vy79//f4=;
 b=EcownSIR0BU2VTvzDK6y5A2L7LBb6IaVKqa1A0p8m9SbadMlp7rDAvQwWnXpICUidkJhz1Z8TSYtsV/7tixpG/p6ZSwpY0uvJfzR+CRH5eLdNnV7TJj9ytHh/FohBJCTiC/PTnLifZVUA8nkltPBEF9rVoBwOCP6105NVv+hKSvUZqZkGgYDlNOS+YaE8IHlvnqrVkuJzgg3u7o7hvY5rNQFbXJVA/CCi6C/wWT1YyNRMAzlZB7uI+2rP/6Xlcl0GnxfUfnhwHUvO3sDeyvti7Y+cJt1ZO+USf3FvBLX+AC1IFQsnaFX1BzDHiBi4ilXLoNv7Hm7DiGCLLfjnE8KqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [XEN RFC PATCH 06/40] xen: decouple NUMA from ACPI in Kconfig
To: Wei Chen <wei.chen@arm.com>
Cc: Bertrand.Marquis@arm.com, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, julien@xen.org
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-7-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d7d52c5e-6c55-4491-3794-681b0e8df9ab@suse.com>
Date: Thu, 12 Aug 2021 17:36:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210811102423.28908-7-wei.chen@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b65c06a-9153-4ef9-f0fc-08d95da701dc
X-MS-TrafficTypeDiagnostic: VI1PR04MB5327:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5327D77305F4E2FD4F4F5F2FB3F99@VI1PR04MB5327.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x4y7ctbn9iOvkaHNqr4abihkV4TevZPt4CoLkbjFlTxHWdrtwlVZQaBooRsjysYKQDSKRpyrhZtS/u3tmf1owK2d0/4hhl4erzIwAXqqkowjK9AQB9MPkzoqnH32y7S23Fly9nA/G3e8yABGGKmvJZGNc0NHqP4KJUC3+XphTJWw9kAyrlCk5oqmt1s8ncsq/lZ1cna2mMnWrSFHtnwPN8D8Y0pBjlKfjC19NY/9yC6h0PNvlO9IZ3uqsbXujv59LH/eWxfsRKKMGOk65YMahl1iJUseKxk4MEd+cyOCiOw1uMbsqUpNHL/InWctS1XZqz2isr7lWEtGJcY0/O8OLfPWGAw7BvjHvlhTL+/yBTyrO0vTHmH8UMA4PW+PAUjJvnKxuPQsDWTD8So19axYMN4Na+8j6rKMd5RLMoOmKtLIUT8zM512OSY+ItO1WkGa08RQua2ynccjsTaz3LZe7RW1KxaIjg3B5CExEKXQD6QCfYbC9f5CIbxyTykIzq0BvPRSX1qcmSXtwcelY4/DBAtn8Csrwd0AQjYJ1RuX4BIS/L0KrRzxhFvrF9zbAEQOlhehHi2dj4m40m3GkK/a9/zyD7NGWxMBJfyoRon9orK4kryF2XUZwSJj7q6l6TPXg1QSD1yqne4XSRLMFqPZ35LpeF60Rdc1/7f1A6mYoM0gIMlUAMl2m31qxjRpRdT93yewiOgg6IDvzgNVuWqez0RvMXfHS3TeT5rPSKG1NRo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(39850400004)(396003)(136003)(346002)(4326008)(316002)(38100700002)(66556008)(16576012)(36756003)(31696002)(66946007)(2906002)(66476007)(8936002)(186003)(26005)(2616005)(5660300002)(478600001)(31686004)(86362001)(6486002)(53546011)(8676002)(6916009)(956004)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWJaNW1saHVSc2JUbDEzNllUMWR2UW1FZVlwWXFXN0pzMEdOeU1IZHU0STZq?=
 =?utf-8?B?aU05MUhPLzJuVUNJckwwYmpJV1QwSXNnUzFYQWZBVFVuek5jSFJjSDZCUndm?=
 =?utf-8?B?M2ExeEYyWFBNMThib0FEOGxGTUJLMXFhVndVVW5GUWZDRUxCNytpNnp6OGIz?=
 =?utf-8?B?SW5LRFdjanZBc1BmWUJvenFBaUMvVTM0ZUlwS3F4SCtBS2h6Ny9BcFppNjdK?=
 =?utf-8?B?b3NOODQzbVZjRElkbm1PbHdMRzRjb3lWRnJwdDZzR2E5NTV3YURmRlQzbU1V?=
 =?utf-8?B?Qmt1N05JUW5mUHowN1V6VlgvNENBckFYMWRmMmNuUzRYclhOL3IxVGI5UTAx?=
 =?utf-8?B?NUU0Y2gwNEZYaFFBajhGM2tIcnB2UHI1Z3FIZUhSa3l6cmJYL0FuTCtLeDdR?=
 =?utf-8?B?M2FkYlhXeXVhYlBlVS81eVZYajN3dndZbGcwc2hYQkZpd1lIMWNueWw4NW9r?=
 =?utf-8?B?bVNXKzdmUk56SzZZNGNCSE4ybWIxcjgyaU80SWpvWk56czFVcnhCVkd2a2R2?=
 =?utf-8?B?eXRVSFB6OXVrQUE2ZzV3c2o2RDJCekV1Z0ZGM0ZCbUR3QUkwUFJUNzBNdzNn?=
 =?utf-8?B?dGdjRGl4dnRLQ2RzUWQ0bGxySm1hR1NidGE0NGd6M0NrQkt2VjZOOENabDVj?=
 =?utf-8?B?VHpVTHgzczlLSFNWV1k5TFpFWjhiMVFJWEJ3dVgxWklqTG1mYm5yb0NuR00v?=
 =?utf-8?B?TWh2TFBoOEg3bUkwZnY4QXhYY0I0V2thQUZuZEY3ZExZbG1zUlFkYkNYeFFl?=
 =?utf-8?B?ODNmNzAvRGtxSTZEWENZaUNZZDBWYVdIOHM3Vkh5R1dHMkRyZU5xOWFueTdn?=
 =?utf-8?B?bWt5QnRQd0xiaEdxK1NZL2VyZ1JYK2NkZ2grMWFYMS8zSmN5aU54eGt1TGFs?=
 =?utf-8?B?LzlSZi9PVjFBa3lKN0VMNFRLUjNXSHJFdE9zbWxTaFpSeVRKR2RpclRyUGFi?=
 =?utf-8?B?UEQ0am8yYVIrdXQ4UCtSdzRzUzNhWmVDb1g2dllVc0loSmY1RVhNbnVXT0U1?=
 =?utf-8?B?UGFOYktQVXNhQlh4ZmxuZVFROXcvYkxzbDhLNkQ5OU1uc1JxaDZDUDNWOGUr?=
 =?utf-8?B?NWR0UHJrYUF1K1hWc0s5WEVvajB4N1RZcnRXVEptcytzRkJSVGF0cm9LQ1RI?=
 =?utf-8?B?MEZ3eVhXZmZSZHpSNmUvSVlCcHVKWFpobVZENkNJa2RQNFhaMVpxeVhwOTBN?=
 =?utf-8?B?UUpVa1U5eDFTbExzU0cwWHlsNDhtSzNLc3F0MnVlTlhMZFhmVkZXZy81ejFG?=
 =?utf-8?B?WG0zeHpSekJpM05JNm9ITXl3Q3FoRC9YM3UzOVBCN2VvbGVQZzJXeC9TdDFr?=
 =?utf-8?B?RlFOY0kyYWtpaW8xT3JGSm5QUlo1VjN0dUcwbTlPbmlvUmF6VlNtdnBvUlJH?=
 =?utf-8?B?cGdQanl2UlIvbzNLK0w5UGlQZi9kUHRjMHpaak90WFN1NjNGL24xRE0wR2V5?=
 =?utf-8?B?c0V3U3VOQXBzZW83VXM0TElYYTIvaExNM2VuSm9mNkd3VkdVRjFFc05GVlYv?=
 =?utf-8?B?MUVwQ0U5N05FdmoxeE45YXNmZ0h6SjRpTSs5Yytaa005MjVJU2ZWWmd5aHhP?=
 =?utf-8?B?T2Foam9QOGdHRENJVkZRZjNmSnRSZThiZ1o2aExRMG90d2pqa0RNSCtJVkhU?=
 =?utf-8?B?dHRhTVdLdm1RY1FneVVOcHJkNW8wZkNiamo1dm1MbUtnYlZZMHdwZ0FoNEx1?=
 =?utf-8?B?enplcXJXNDkxeE9OWjB5UkpFMHdOT2gzempXS1ZYYnNSRkhBblNjRXJhT0hu?=
 =?utf-8?Q?+JaqL5x1gWjRyuVEkD4X+Hfe9PVe2kie0Sxooth?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b65c06a-9153-4ef9-f0fc-08d95da701dc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2021 15:36:52.2423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9hHAjH7XrpLpO9UXCF8TCou+FHGsePo2vZJizLKmisFcUxWmblFzAuMOJ7V/Pjsx1Uk9MyE52CvlUeSpWnQPCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5327

On 11.08.2021 12:23, Wei Chen wrote:
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -24,7 +24,7 @@ config X86
>  	select HAS_UBSAN
>  	select HAS_VPCI if HVM
>  	select NEEDS_LIBELF
> -	select NUMA
> +	select ACPI_NUMA

We try to keep this alphabetically sorted, so please move up the
replacement line. Then
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


