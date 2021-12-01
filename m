Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9ED464946
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 09:06:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235632.408736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msKd8-0007nx-Qx; Wed, 01 Dec 2021 08:06:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235632.408736; Wed, 01 Dec 2021 08:06:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msKd8-0007kj-Mh; Wed, 01 Dec 2021 08:06:18 +0000
Received: by outflank-mailman (input) for mailman id 235632;
 Wed, 01 Dec 2021 08:06:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gc09=QS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msKd7-0007kd-RS
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 08:06:17 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f072afd-527d-11ec-b941-1df2895da90e;
 Wed, 01 Dec 2021 09:06:16 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2057.outbound.protection.outlook.com [104.47.4.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-Q-TlA08mMyyZ42LO6U3wqA-1; Wed, 01 Dec 2021 09:06:15 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3935.eurprd04.prod.outlook.com (2603:10a6:803:1f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 1 Dec
 2021 08:06:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 08:06:13 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0196.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Wed, 1 Dec 2021 08:06:13 +0000
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
X-Inumbo-ID: 8f072afd-527d-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638345976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vVie5wls5q4W79m2RL9G501fduxg5o1eY5f0Lef2o1U=;
	b=H6N3QRqoLN9Vqb1+5tKBd/7xmszLmF2V+U6/Y6WDKqWJ7CFmAIJSX5YSoqgNBKg2KWH9JB
	/ZHfYQkJ5dceXYP30TBVyQrnBvI7MNk6FVCwCvrhJRHZ9OEFwEX76b4OKMzI+EiedelMJ0
	Gdb0TKkdgUK7rpwIAxLc9tD/eGhcQz8=
X-MC-Unique: Q-TlA08mMyyZ42LO6U3wqA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jcCacMS5EUKiWPSmw6o+fF+2WrSwNR5angMydp0ju18K0PrGNCCpmD1RL9nHEhx0iqznPCNlNooXFa7J95ll9HW2WY+ex2mNdJvYUhKDmRf5FEBSBRY5p4ufEHqIkoky/p1aPUAHFPtA5JVOO0932kyNiUZSzFKfWJ1trnbmBUs/IGJJBbd7BjeZFD6pvlhd4OsVTHSZtXz2bogOXJD+xFM+EfgcwbCK82IK5e2Vt9ZTwaqen+GU7K+aqlAavbolk7//DV+z9+JzHYI5aIdAlIaUrAmIFhVkEgZnEv8ESRHnDaQwgN34blmh5J7HEg1CqaUC1ZmBCHd4gl6EjFGLHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vVie5wls5q4W79m2RL9G501fduxg5o1eY5f0Lef2o1U=;
 b=QxMnsp62woBimHu06UjQ1e7SZLNvV3gzhTi5qAcV98NTx9gNLEPfFJ0op8CTpnFSi71ZnzyUseKOsYxm/9a9roLLy6OTE6nWszymVdsAjdfFG+EYtQVSmaBvFaLZCbOfXvh8Vp4k4k63jawAVTcvwFkB+NOjmtBkEugpdh2sUdSUVFk+ahNjQFx3Be6sm30NjJ1vzywpZa5bjrQE8IYxMN/DTqHLrrzB38oa8FOSq3vBHFlZxxsHwQ7RTc+U2l85GqAUokj3l+UOG19zYpWcLQeNqHWb/xY4zxi5z9/uonygBQUnqXVbvh+pIaejkzyO8oXntt+dBXdFOOVgtCAGtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <336d5f9d-04ea-294e-489e-208316456c58@suse.com>
Date: Wed, 1 Dec 2021 09:06:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 5/3] x86/vPMU: Harden indirect branches
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <a0212d75-fc55-89c8-7ae2-c893c187ad82@suse.com>
 <20211130220502.27624-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211130220502.27624-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0196.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2da86bad-1f2e-4da0-a6e0-08d9b4a1715c
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3935:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB39351E91905E515F817D13E8B3689@VI1PR0402MB3935.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nZGHdHxJ8k6kP1JopHeO8edcLkSwakd6eRnyYtnNr6ovQAzneMhDppO9ae8pT85PxzX3iMK93RLdoILlZUKEO0byF2+RDCRb1A3h55dJEQVGVFJuQ7JVvdDnUjYFgl2aTgQcoynC0v9V1qCZd37A4XEq7oHfQsQLYIHqpq3A2/TW8J58wrQaoZqu/zzZsVqRflokPQuZZATrA9rEouZLL4lkMHnIL+tmt/9TAWGT3MFVNmxZOm1SHks5CGMpZnpc7NPxFLKK7qi6imYYhn592UWWMjcFU8XRlKIXYUTpcRHCHP6vIUQGRCPYyN74eW9h2xmo9bTqw0amOPp1oCIN4PrXCJym8U2WKHtm7DrdhJ9X/pKk5uMOOtwTV8MiHa0wWQouEMd0VcH7ed/ibQ5TNsISg+h1cAFHc15vFFMHim1oOR1RFtiWuc75PcwYhkgZkZOUDAV3PA3A15kd5b+IAXCkdeBHEze59FLaRXJqKJrvfBc+yQjEu17YwlkjQD22JdYcmY5vbQIyg58H3oEpO+c+cwP6pdcom/jA1+T3XytQ7s3LaQNN/P/ZZXsAkUgzdu2bsDb7VbSH60e3GPrR3FXiMBPOZiXbEJZkZkc6g7OSoAi3agJ4sgvlrurPFAEwgUMBXnq5op0m2QQ8jCvXkXR4tF7u+r+hUug0dFxmnB26t3VDtmxTLKRKxLkwElG1qiOypurBLJpVMMbwKGKcmmMdk98wxqRiQirIeyGZCak=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(8936002)(316002)(16576012)(86362001)(5660300002)(66476007)(4326008)(54906003)(53546011)(31696002)(31686004)(38100700002)(186003)(2906002)(6486002)(83380400001)(508600001)(66556008)(6916009)(2616005)(36756003)(956004)(66946007)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnU5WVp4dC9rRzQ2dmI3ZDJaRitldnlIVy9aYTZoeTZJSFhIMVVOK0RMbTZV?=
 =?utf-8?B?TWNPTHF3bzcwZFprR2ZZdU9vL0s2cWZmTHZpSmsvcVI2MXZISjQrNDMwR1Ja?=
 =?utf-8?B?dzFWdnN2MzZKODVnSWFJTGhvZlZqbHh6aTdoT0xYM3l6RHlEbDdTUXROcThF?=
 =?utf-8?B?ZnBvNnA4N1d3MW1yeUlPYi9rUHUyaStUVS93ZEZJMlJWUVlFbHlqREZOSFcw?=
 =?utf-8?B?dk41ZGhST3dMTDczQ1ZwNXMvMEQzblBMRWdOUEZKUEdEV1grQlhFMkFIY2hQ?=
 =?utf-8?B?VFRyMVI0cXVLUTFVeHdONUh5ZFd5cHpRZ2kwNXlRR2g4TkYvQXBkZmpRNXhy?=
 =?utf-8?B?ek05QklXaXhmSGRiZW9hYzI0ZUJVRU1rZXo2QjRDZ0J6V3dsMHdBUko2SWxD?=
 =?utf-8?B?OHdxM0JaYXFWMU1vZmYreTk0cTZnSnF6QS9sMi9IaXhnQ3ZwMUkwMDN5MzNR?=
 =?utf-8?B?UVh5V1dMWFU2STcvMXpzOWxQblFCSEk5WkFGVi9ZY2wreFZYZ1hEY3NHbjBY?=
 =?utf-8?B?ZGhOVUUzV2c2bGRBOEdyMm1ONnA5MjZldkFRTStsd29XbXNDWEJGMTd0MC8v?=
 =?utf-8?B?ZlJ2TTVWbXozakZCRGRKc1JrVjFkWjM1YWx3c3pkdk9mSlVla3BZWWVpcWxI?=
 =?utf-8?B?YTFiVlpiNVFuVnEwczJyWUdIV0dxMm5ZTW1OSVpNMTdsVGtaZmczTmVyckVm?=
 =?utf-8?B?T01ibGpuM3N0bkhENW9rR1lMandxcGZlWm9Yb3NrNzZJcXJreG9wRzFGb2ZQ?=
 =?utf-8?B?LzluaS81L3NIdWVaeC9ydlg0RWk5eCtXTDVZOW1tazhlc1NreFFxcjl3Y21r?=
 =?utf-8?B?Ti9lQ01Nb3BRNnd0VnpNdVFYQXRQSGo4dUNvQjZpS3ppK0dOZ0oybzNQN3h3?=
 =?utf-8?B?S1VhSnlZbHpRYWJWVnk3amgwUFlGSUxHMS9sTmNnSDFsSE5KcXBvcUdrVTgw?=
 =?utf-8?B?SFpCTHp4aTdRSENVa0Y3MldwZ0ZrbFgvM2JVOXdlTDUvWnpSRjlmNW9zMUk1?=
 =?utf-8?B?cDlORkxaR0wyNlRWbmJmRW1aTERENVhNVjRES2hObGJidWJ6dGlXbWxEeGdM?=
 =?utf-8?B?d21DbnBGazVVVmwrLzFtY0xMRDVGdk11Rlo2N0VzaHJLc1U1MmQwbVdSNGlZ?=
 =?utf-8?B?OHJCaHN4WWlNWEY2NnJvcno3YU8rdVVLT2cydjJMWDJwcGFVZ3d6SDNNNnhD?=
 =?utf-8?B?NDk2YWJEdjJUMUROdnZzZmtSbHRwYVhsc1NVbkE0Q2xqM3RoQTBjT1dtZkhZ?=
 =?utf-8?B?NUFUVSt5bHdKYml1SS9yKzBaNGlMSWE4S1Y3MGNQR0VDVWVJc0RzdEJxZjJ5?=
 =?utf-8?B?T2E5MUV1dEt0VlFoSERiZXRRTm9pb2dRNWdkQjhDcENlN0tnMUpxSGMxSE5T?=
 =?utf-8?B?TXZpOHc4em9vOTRmUTluY0VlSkR2RUxOVGZEckxpWWt4d24yTEtnUHNGNk42?=
 =?utf-8?B?ZGYzTjZzeVA3aUFHSnFhajJma21OcGwxTkF1M3BQYzVKbU1hVzgzU05zcUVo?=
 =?utf-8?B?NU9nYk5mclJqeDRRczhoaUVEUUtDTTlqOGRuSldYZzY4R0ZqS0I4aHI4a0tX?=
 =?utf-8?B?eFJrNElOOXltZEw2SjdYdnBJYVBjbVR2bmtOVGRvdzFBNFM2dWxCdTNaWkZU?=
 =?utf-8?B?UGRoemorZmpiempETTRZUFpOOHdseStYWFJObGYrNks1TXpoZUVPYk1YQ3Vk?=
 =?utf-8?B?OVFrYUlaR3Y3elFtWHdLZS9tWVE5T3NXWDBXenZXdGF4aUZVK0JJSncwQWJy?=
 =?utf-8?B?ajZYSVdzTCtGWUthN1FRVXMrc2JKUlk4KytNcnpFcFlhN3dhaDBhYXZ2d0tO?=
 =?utf-8?B?cVhycGdHbEVpWGRwWnl3dyt5VitYanB6dTZZV3dBY3ppWmMzTVV3V0x5L29j?=
 =?utf-8?B?c3lMZ0JNSHVzMU5UU2d1VmxWYjVTMGxZZzJBV0p2cnJ4ci9oVDJzcDYwdTlM?=
 =?utf-8?B?WHZrUUp0WXNaU3ppRnRlZ1VjclhLUGIxTzBMVWRSRisvc0lzWXFsZjFuTk15?=
 =?utf-8?B?Nk80RlVxN05zZWx1SVBJM2wvbUdMUTl5SWxzWHBnSU5rSFoyVGwxT21ReE1J?=
 =?utf-8?B?UTJRbVRQQkhUYUdFb29BSXN6RXh6cjk2VEZyQUdJNUxOMlpyNU9yK0tUSHNQ?=
 =?utf-8?B?aE5xTGRjVWR6Z01DOHdSKzVTaWFvZXgxQTFMU1lkN2VoQ1lGV0h6ak5KUVJV?=
 =?utf-8?Q?0/Y32O+jNiuZDcgdZpcy82o=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2da86bad-1f2e-4da0-a6e0-08d9b4a1715c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 08:06:13.5516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tLJIUM0K5QCgxztOmJanHKO2asJdS0DXH07HK1pXsmvIl89vtKrXansv6aGPHAq3Ibl3XB1Om3f0laYGQRdeTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3935

On 30.11.2021 23:05, Andrew Cooper wrote:
> --- a/xen/arch/x86/cpu/vpmu_amd.c
> +++ b/xen/arch/x86/cpu/vpmu_amd.c
> @@ -518,7 +518,7 @@ static int svm_vpmu_initialise(struct vcpu *v)
>      return 0;
>  }
>  
> -static const struct arch_vpmu_ops __initconstrel amd_vpmu_ops = {
> +static struct arch_vpmu_ops __initdata_cf_clobber amd_vpmu_ops = {

This depends on an uncommitted patch (introducing the annotation)
and hence is a little difficult to review without a pointer to that
patch (which doesn't look to have "cf_" in its subject, and I didn't
recall anything else to search for in my mailbox). The main question
I see here is whether it's warranted to drop the const: I'd like to
retain it if at all possible, just to document that the structure
doesn't get modified at runtime (read: initialization time).

Later... I've spotted it in my to-be-reviewed folder; it's
"x86/altcall: Optimise away endbr64 instruction where possible".
There's no discussion there either about const. Iirc the reason we
need __initconstrel alongside __initconst is for older tool chains
complaining about section conflicts. If that's right, for CET-IBT
we need relatively new tool chains anyway. Hence the mixing of
const and non-const within a section may not be an issue. IOW with
newer tool chains all could go in a single section; we'd need two
separate annotations only for older tool chains (falling back to
__initdata or __initconstrel). Of course at that point it might be
easier to have both .init.data.cf_clobber and
.init.rodata.cf_clobber in the first place, grouped together by
the linker script.

Jan


