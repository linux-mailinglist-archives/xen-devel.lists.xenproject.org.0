Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A504B2331
	for <lists+xen-devel@lfdr.de>; Fri, 11 Feb 2022 11:35:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270296.464535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nITGb-00086q-JR; Fri, 11 Feb 2022 10:35:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270296.464535; Fri, 11 Feb 2022 10:35:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nITGb-00084u-FK; Fri, 11 Feb 2022 10:35:05 +0000
Received: by outflank-mailman (input) for mailman id 270296;
 Fri, 11 Feb 2022 10:35:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jrYj=S2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nITGa-00084o-6o
 for xen-devel@lists.xenproject.org; Fri, 11 Feb 2022 10:35:04 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45194c67-8b26-11ec-8eb8-a37418f5ba1a;
 Fri, 11 Feb 2022 11:35:03 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2055.outbound.protection.outlook.com [104.47.1.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-SNc-5iT9ONypeaEG8Vhh_Q-1; Fri, 11 Feb 2022 11:35:01 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR0402MB3512.eurprd04.prod.outlook.com (2603:10a6:209:11::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Fri, 11 Feb
 2022 10:34:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Fri, 11 Feb 2022
 10:34:59 +0000
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
X-Inumbo-ID: 45194c67-8b26-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644575702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XBxIgWuFIZ4NRX8iR9jLvUoZxw/GDZu4YlYw4MoH5N4=;
	b=EBEV6kyo3gPVaGCV5bv8iZK3lRLBlL7NjDv2uxfaJMcdJmFMLI+/GQb7N11RkRbIxcw0EW
	Fy+HzJkAzOd5MdjvvwpomYuu/MI0XEISUXUBC0OzJsXYPEygnhOiSPxVW8RTTAT4H2OIYJ
	eCpv+fDy+qmdMIfmJcgaOpJpak5BTpg=
X-MC-Unique: SNc-5iT9ONypeaEG8Vhh_Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NiiK29wtUtO/CxX+MeHBYQJjvIUXNtHoDhL+ch7LqkipoNTKX5+Q+mC3kOTtBvF12D1URck67BArWy4h/GHWdnKopTAHZXH8ADS6XP3qFrb9rhtID1YB4f30uxZDBC4wXfJ+rLkRRqmC4e1CPQGxLxMA63Y/LOGCxhgidwo4+X1k/IMM60xWmes/gUmcSHhTrDdJLCYVfwEggmm1PRN0FnZVNENZkH9+OwERyWEuOcqwKLZILYev/3A56Vmgi3Jb1NPej6LGDR/7l2oqJrmD0fpGlQ1FBr/VT3FHA8sco1Et/XEkhxJrB6eDpGiDii5KSVsvjgpFr9L0Y5+YBYojmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XBxIgWuFIZ4NRX8iR9jLvUoZxw/GDZu4YlYw4MoH5N4=;
 b=exSN2sNyRamPX18f+xZ1VmxCdV6Vn2Az8QcR2sIVsLpjCyO2rzufrfCpg9m3jxSDg6fECPmLQ2guB30AgXqLknwLMHDg6b9/qsR3oYMjwaH3IqGGTjDqdX2w3e8fnBFC7fkVhkoDBWQeC7jf63wsD/fwSjU6HC+DbHjdMKRqKAmJoHX0IcgeqsQEh3RJAd5NljXSFicNs0LqIfZmb5hctzVW9NuRN0av0fv6iuRqu0FSw/ZcuP12VUV6zuiRK/g1OPWjbgBNq5sEby4lZVFQ3QXNu+HFK0/+yy/qIVsCuA2t348Gt5OYRL35R4QrSMre5F1CVoeUFQA1B/rWW0ieGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c10ec679-258a-f983-7c5d-b9f536b7ca26@suse.com>
Date: Fri, 11 Feb 2022 11:34:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH CPU v1] cpuid: initialize cpuinfo with boot_cpu_data
Content-Language: en-US
To: Norbert Manthey <nmanthey@amazon.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20220211072327.1213-1-nmanthey@amazon.de>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220211072327.1213-1-nmanthey@amazon.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0014.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0425470-6430-428d-a22d-08d9ed4a2767
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3512:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR0402MB35128B5C85C2AB988197F705B3309@AM6PR0402MB3512.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IPiEM/syVm6O2pKgfb1U+d45atCZf2KeaPxwf7B7glmn6Sv0zSbOg+Mk0WYglCJseIZVntT8v7n5jplCTjB0+RWvGKOENnfL4OskOxQqudaNsVH7Ec5VKvVqYAeSVTrD2TtJz3SJPisQ8KL/knWYBqktZ4SofGl9SNtglI2uzfdadc6Di80vO0x0mzGBT9QM30mg6bXkWmYiRvwU9WOifDKaO4nra7nNTM1/X5eEeMuEvbHg5sC5CBp614Q0wPe625wSlI1znlpTLXuFSt1SmPr/5p5AnaxqHW8kB/bEQ7nWzSv8ze/hkg+to+BrKW/FeKUIqT6mgNWBhQJZcxNUi1cOYzN7XIqlSvdSakWew4947FFRNClLofzNV0KHu9EyHTiQUkyGcohyccHDolJm2m2epdU7IP8svsCvsqCzvX54jHEqAUVpHQAHtrkAub2DZ66sl/ZcRpjAPb7kTD1Zkx9brcNdV+gj6gO0/UUFP9WuPtHCoXNKfAOnsny4IWkxH7vWn6YVQwnwXQkq8yEFVwvngrLFfa6o2D/pdJxRSWlbE3geJnyk+EiiGsdI0kM3nwhKt7OtKkLJqUuRhSIHQ1wzD9xMc0rqIlraxHW4cZqBYhpjoVrG05k3Xq1YK0YU2TlIMbkvZsCq1qRLU8InXwDRhUnRg7gfp4BD8iHJ7C8aBXO8+lbARkJhW3mDvoqZr5/ONLYpH2t4bUegv+082k/cHT1x+J0OjIWs0li/HNbKMqEsKRQVabZ2ShS4xP7e
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(36756003)(31686004)(316002)(4744005)(2906002)(6512007)(54906003)(8936002)(6506007)(8676002)(5660300002)(66476007)(66556008)(86362001)(66946007)(38100700002)(508600001)(6486002)(31696002)(26005)(186003)(6916009)(4326008)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlZHZlRpUUtRbElKMU9PTTg2RUdnbzJ4blZqamI2QWR4OHo2aE9weXQ1MUlH?=
 =?utf-8?B?WDYrZjBtWldobE1zNnFjWExXQ09vSWpIa0c3R3MrRTRwWUd5OUlvcE9keEdE?=
 =?utf-8?B?M1ZBd3liZzVnMWJXVlpSLzAzZ0k2K1RaZ0dWSXZpWlBVdTFEd0ZjaTZvVGZU?=
 =?utf-8?B?U2JVWklidEIrdVZzM29Md3pQMjhockFwOG44a1Mwck5DWVlVeHBXdzJPeEV6?=
 =?utf-8?B?VXBCVWVpR2F1YVBCZCtMdXg2NENUbVVjS3JqRDFxTjNsL0dDMTFnNjNqTkVu?=
 =?utf-8?B?dkJwZ3p0RVQ1OEwydmtQZnhack1ZRkRZU0llZWtHcE45VnY3OEVPSFBzYytm?=
 =?utf-8?B?SXNOYml2VjZLZ1UyeUVoU1ozamUyVWhaWU1KcDVhc3lYbGRqR0dvMUtEb0ZR?=
 =?utf-8?B?d3IrMTVLakJQL2grM2FoZ2ZWSmNRSlFsRmMrQ05HamVYd3BESUVpYytmZWU3?=
 =?utf-8?B?VFRBcHJQd0FKVU5pakFoRS94anF2ZTZtRXFaUWNuQ2dlcjJKaDI1Qjh1QkJF?=
 =?utf-8?B?c1ZPZFJ3WWpSS0lad0hEVkVRYTM4RGVEVGNRWUNTeTN1K1puZXFFZkdQb21O?=
 =?utf-8?B?QWlxcEhJb1VVemdZQ2RZMU9UTlMvOTRCQWJ4WXBmTTkrWEVWZnBDUjdMa1Zh?=
 =?utf-8?B?bWdnVWtrUHhzejdlTm56ZXZDOW1LOHMrWXNjZ1d4VFBRWmlSWm16bjNnWU4x?=
 =?utf-8?B?VmZYRFYvSkU1UHM1cTc2cEhVYzQwQ2RxZW1jZTJIbGdsUGpxNFRPN2NDTmlX?=
 =?utf-8?B?RjVNSzZML21GNXRTaG9kRndPcnZLMjhjK2ZQV2xDQjNWUEt2cmVoVDZkRk9K?=
 =?utf-8?B?Y1d4dm8rRUdwcXZGdUZoQVkzVGYvU1Irc2lUNVMzVzdmaysxQnQvMTB2Rk43?=
 =?utf-8?B?Qmk1b3RoSTlhVjhjVUFockFJbzhNRnBablRGTCtNcHQrR2Y3VHNaL3VTMktJ?=
 =?utf-8?B?ZEthMnA5KzZ0OUVkVFlYWXc5RTRuZHlUVzAyQjAwSkdUbXE1Q3A5Zm5QY2hK?=
 =?utf-8?B?YitVdVN4UW1GVjRlbWVHcjNkbTR6UmlqS25tRmw3aGVQR3VwNnZlYXhqUmNX?=
 =?utf-8?B?aGtyNFVEN1NFSGJnWE1zWEQrRy9DaGpVL0lpZU5jdFJSaHVyZ285cWY0TThh?=
 =?utf-8?B?TUltVDZ6T1RmQjN0K3NqdUh3VkFXZXBCN1JuM3lvdHk3aXRwb0VCQUFtTjVt?=
 =?utf-8?B?ZkZUTnltV25aOWJYMm9Ca3pkelBNZDNkZHRBSEE5L0I5VWEzZTViMVgrVVNt?=
 =?utf-8?B?K3QyMXJOUjdKZk9JajZ3QTRwQ1U5dXhHbHZzRkZwSmVNcHpUWHhZRE8xaW9N?=
 =?utf-8?B?MUErSUNVb3ZvbGpQQVRXQVF1UVY1YWhVdi95cHV5bFluK3hkeERJNi9LNU5a?=
 =?utf-8?B?RjRKdE04MFY4aFVUb2I5VUw0czVNWUJyRTRTQmZwUnp2YVdpSlA5VFVYajZu?=
 =?utf-8?B?TWNBNnhXd3NuNVJzN05JZW1BVkRCQXpaSHJvZjltZ3BSVGVPRXM5WkVGalRV?=
 =?utf-8?B?VVFTc0pTaXMya3MwTzNmei9ucTFUMkNGdGRPV0tORjhHd2R2Vm9BZGloeFJ5?=
 =?utf-8?B?RDgxRzR6Mk1hYkcxTGdjejdjNW9BeEo3YzVxYmtTbmRPU0ZCSTFNQ0w2dENo?=
 =?utf-8?B?dTFxbDkwUnVBSTk2TUpIQjErSUc5YjJPaTBrL2lkeFZKTVlRMjloOVhCRERh?=
 =?utf-8?B?cHFncHRld0E1RlBBRFRpdjBidUlxSC9CS2NydWcwRFdkbVpsMktJcTBzdHFB?=
 =?utf-8?B?R09RRUN4Yi9tL0d3NUd0S05KdVl2VXVmblFxemVXQk1MTlVTMXkzaXFaVkhF?=
 =?utf-8?B?SEJ3TGROQXBLdG1UUk5OQmdOZEZJbTVtcHZ5MzgyWjh5VGhZS0o1Q3JqcGN3?=
 =?utf-8?B?UGRZZ1VGeDlWZzZ3NnRFNEQvT25EbXdBY3JEYXZwcmFsSnQwcHBVQlN4d2VM?=
 =?utf-8?B?T3hDdjJ6dFh2RE9CNWlhQWcxMEIzTW9GYkdBbDMweWt2UUxyZ0NKa3VoNXhI?=
 =?utf-8?B?M2JIWlNFK2VzR2dYQldGZW1hWTlsbmxDVjc5Q0QydEdYOHU1dmdGdmtYZkJP?=
 =?utf-8?B?UWlTbjI4YlhacmluZjl6Yjcva1ZEYW1KVEZyN3ZUbjRiSTZqNituZDNZSVhs?=
 =?utf-8?B?amlxbGoxNUF0NzUrVWRyRmhxQWNHb295dDYyRmNQcjlVNStUbVd4ZFJRN2tV?=
 =?utf-8?Q?q4HlQvjA/S0TwHPTJDrYoAY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0425470-6430-428d-a22d-08d9ed4a2767
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 10:34:59.5664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7S1lIkAfI9Fz4476h2f0azpqP9gDpNdHsxXJWAIRjrgdjz/07BAmwl1DWTwiEtop+RPpFqiCzVT3Gy/SqA2HWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3512

On 11.02.2022 08:23, Norbert Manthey wrote:
> --- a/xen/arch/x86/cpuid.c
> +++ b/xen/arch/x86/cpuid.c
> @@ -609,7 +609,7 @@ void __init init_guest_cpuid(void)
>  bool recheck_cpu_features(unsigned int cpu)
>  {
>      bool okay = true;
> -    struct cpuinfo_x86 c;
> +    struct cpuinfo_x86 c = boot_cpu_data;
>      const struct cpuinfo_x86 *bsp = &boot_cpu_data;
>      unsigned int i;

While I agree with the need to initialize the local variable, I
don't think it should be pre-seeded with previous indentification
results: This could end up hiding bugs. Instead I'd see it simply
be zero-filled.

Jan


