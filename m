Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 769E44A479E
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 13:56:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263073.455642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEWDC-0008Fl-Sd; Mon, 31 Jan 2022 12:55:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263073.455642; Mon, 31 Jan 2022 12:55:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEWDC-0008D2-PY; Mon, 31 Jan 2022 12:55:14 +0000
Received: by outflank-mailman (input) for mailman id 263073;
 Mon, 31 Jan 2022 12:55:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Fky=SP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nEWDB-0008Cw-FT
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 12:55:13 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06615560-8295-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 13:55:11 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-j35pZeZBNsaNABDvfzjyZQ-1; Mon, 31 Jan 2022 13:55:09 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB7PR04MB5994.eurprd04.prod.outlook.com (2603:10a6:10:89::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.22; Mon, 31 Jan
 2022 12:55:08 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45%6]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 12:55:08 +0000
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
X-Inumbo-ID: 06615560-8295-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643633710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aB4KGNhgaKfqasPU+NjlvoXn4q6KhPSucs0WPvg5F3M=;
	b=TQdBIzaGRmfXzDFvVhZk9oCPRIAoydn3lD1WkJUSd/1b7/oci6ME3tWcHKLna2VWINZ01e
	qMPHOGQjJETAV9wBh3YFXn2MEVAslB5TJ3eNQvC33Mg+iphKF7E6LR1XpWCINGiUu3i65t
	9OX596OZme7Po5ig6tlZ+KC6IKym8wU=
X-MC-Unique: j35pZeZBNsaNABDvfzjyZQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yw3/tO30wlf8QtlJttmQWWLUV2KuN3bLkA2R03Ca/KzOm8Tclge+3G7I8U4BaPZP6EXsIw/bHMmvtkl0PAMxNbAuScyv9ye87UUtB58pL88oJWhurMKoRVxhPGcZrmOAUD3aXfljcwjYC5bn4OPu3ejDGQgB7QqF3OeHq7AGVAo2Sm1uGQ0SFDbP66dvVjkXSSMUIXzAN9RISfy3nvEIxzTQW0yJKlTige3h/cJrY4wRB13aAyr4XfWbH5KFHdLAxBZ6Cf+5FJvW50N98xEQU7OOsCS6zVofITwZ3Lqvw70/CkxKlWnKbDT2h1KcE4X8G94JUdeaDF4myt9mmhmwOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aB4KGNhgaKfqasPU+NjlvoXn4q6KhPSucs0WPvg5F3M=;
 b=hK7n9vFJfZICsX/FYetgzLXjv4boPCv3unwugWKUc/6G9lJ9wwHtn7X5CGLFNClOOlg0zyMu4eVD6HtaoK9pj3trG/UOSB6xuWXWMYe77IwwshoEI0vMAGn1KYcV/2NRim3pxl1RBAjYEUXU/7zv9Ly9lRcVP7YslOYD00m12hdWS3ORhdvquw5ssTeSOJWJWk4WxLx6Z1mgM79BtttB/KR9seCgyBD3C256fCCKCkprFiIyqxfdXLbpmkGh2U5R2jwQ391t40B7LcKsWCg95ypKhQaFg+LyPAm6Q0i3wyUim1/OjCw9lguGpSO4aGa+clkJmDV6DiGT7BiGV0loWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a1e8e059-b3d2-1af1-ab68-0b94dcd34711@suse.com>
Date: Mon, 31 Jan 2022 13:55:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 7/9] x86/svm: VMEntry/Exit logic for MSR_SPEC_CTRL
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220128132927.14997-1-andrew.cooper3@citrix.com>
 <20220128132927.14997-8-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220128132927.14997-8-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0202CA0020.eurprd02.prod.outlook.com
 (2603:10a6:203:69::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01630e26-da8e-4fce-628c-08d9e4b8e89a
X-MS-TrafficTypeDiagnostic: DB7PR04MB5994:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB5994A5800B68EB5AE2BB84B0B3259@DB7PR04MB5994.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4xXljQRCrpQVHWJ23hp3Tv/4XXouuJuXgZm+hTUclRzxmYMV+zWcsPBiIUzjaeRpsZivb4Pmc3Uswum8almHfRdJJR0ppAJ5pYIQcoE7n2m9BvRKp+/XV3rs0/sLixD5aVP7vKryAkibol4of7ntajpyYNgyWg8tMaaY0RDQZQv6Z/WLLcX6tjAiqADXUSoT5qThOoT0pR8PcCxl6cB4ooFsegBZ6pIzlm+yNrFft41w6W8z+jqOek7kInL8TARF9OmU6KU1lXoC1iGsmTIw/AcKwYzVXIdUS50LqLirc6TVQFy+it59ZcVSdKNtif9KFph9JsVHZBMzeO3uLkZuHDJBAxVcB+GE1W0bo842f0sxKXPkie8EIFO7QfajKkh5VCWZz0lcbtLAzZS+f/a/MSasGjiwc66IML2b1g5ndAac7NAYJo46VQi7hPndwfzDlY8pfHhT+TbizECl8fPEsE2w8GorF1OqJNmW0uD+HFCE1ig5zNaaDR+8uj6yQoNza0+KjhjsyPcD0508LBLN6gARoXlydhlKAQ4Q8UgxdrJfaK77fu0N0BXpC7D/nLavI2xq6Q9BP7JTdmjFadD29PJ1Uf4jvkso8Y34PcrNsAbNeoaI2F1jm6DwYu0LxG/K0Eie9fSEPfLFTcGbOekJTiAwbLlg3CUKcO0MnRPLjY48V0Pp4PiUvKssuo4g5GXuJhjDqBBtZMafGeNo7Y/DMd5dYwM0c9XU0opTgAECpQ8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(86362001)(8936002)(508600001)(66476007)(66556008)(38100700002)(2616005)(66946007)(186003)(31696002)(36756003)(53546011)(6486002)(6512007)(6506007)(54906003)(6916009)(316002)(83380400001)(4326008)(5660300002)(31686004)(2906002)(8676002)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cE5UQ2FQd0hrdFlTLzlEL3JpckFIc05nNzRnOVprdU1IOWorOXFaNDJERDJu?=
 =?utf-8?B?aklJcGVCSkR6ZTNmY0JIUVhyRm5mRTV6VVpncHl1V0JCTFIxM1BFZVEyVi9Q?=
 =?utf-8?B?WGxRajBjSWZRdHJzVFFQT0M3cUVZOUV2RVdzdmw3dzdqTUxyNHFKb3JIdFR0?=
 =?utf-8?B?Qjh6amZkNDlVeVhkUm1nRE1FbGJiSVJiZkJqcjZVajZVcHptaUVBUlRHbFNI?=
 =?utf-8?B?dDc0QWd0YUV5VWNTU2VQUndWYzdiWHpZbytqZDBKR1hvcDRZb044aDdoQ01a?=
 =?utf-8?B?ZVZJZ2RWMFo2cnJSRVFpR0Fmd1BoMThzMWZsQldsN0Y4VG1YN1pKaXlyOXFJ?=
 =?utf-8?B?bTVEVGtmbGErbGFTQ01iUE83WFV1a3RnaHNzemViVzcxMVVrZWFMK3h2WGgr?=
 =?utf-8?B?Yi9JWGNJZ0FBQzJQdWJMd0dJLzhrQUs0K252T0gwbCtOcmNITGt4YXp2Wjg5?=
 =?utf-8?B?dndLTkZuckxwcGNqTFRRazlrUy8xRmhheTNaNGg1cUF6eVhaTzlkOUZNL2I5?=
 =?utf-8?B?eExOWldEM25aMTUzZ2R2TVEvUmp2bGpiOWl5Mmk0WE1XRXNuODE4eVNaMnhG?=
 =?utf-8?B?VHJ4YS9UR2FiVE5ZSlZQU0hpLzdRQm1VVzJmYmp4WkQydG54WGhTYXdTbDgr?=
 =?utf-8?B?V1lMUWZwRjlkbjVjWklTUGh0WjFHR0lnRWlSeDFiSjhQRmpoS1MwMTRxMklH?=
 =?utf-8?B?Nko2ZDhtWXc1V0x5RlMxaHF6K0FLYUZub241UHcxaTdEWC9UdElnOGZwZEdO?=
 =?utf-8?B?emczbURkaTdscWFiSGxUTWxReEVQbDY4ME80WXJnOFY3KzdnWXU5UG5JdGpr?=
 =?utf-8?B?TERvUnVPeUs2TFFGa3B2WjFId253d1lhbXFyUm5hZWdiYjArVE1JcllyeEJT?=
 =?utf-8?B?eWp6TnNTWUxpaElTQ0V4MzFOUlhsZjhXd1B4N3dHTjkyWXFXWjJnbldqdzZq?=
 =?utf-8?B?NFpPQXRhYTZtc21ZMHdJTzhEcUc4M0trSVpxdnRIcGw0WEpWMGRzeW9IcUZN?=
 =?utf-8?B?MTVabkpwYjRxeC9sN2w3cDVYcEhxVGkvT2Q3K2xCRVF2RWZuMHZjaUM0Rnp3?=
 =?utf-8?B?RVJqaXZBTjJMTDRKbXJ6dHo3aVJ0ejIvNWp6TWZDcHU2YmRzWDFuWDNJb0pP?=
 =?utf-8?B?UTBSMVpLK21JQlkxMXlXSXFZZlltOUxTVnc0cWlNSFFJVEwyeWp5RE9NRzVO?=
 =?utf-8?B?RnRpNk9SMThybUI2N0grM0JRNVBjWHA3Ly9LbU95SXM3YnhHZnRta3ovR1dN?=
 =?utf-8?B?U2RsSHdiSVZ3Q2M3eWFkY1Fya0t2Y0tHZ3FiTTNWSFgyVjZxK2h3ZEYwRVh5?=
 =?utf-8?B?TnMyWHoxQ2FKRVM1eTlVUFQ2U3RwdlQ3TTl4UGtnKzh5R082WEp6a0QyYVdF?=
 =?utf-8?B?R1BZVkRtWHRMb0FYNXBNMFVXUEt0d0wwcC9FcHkxWEc3K1RHeEh1ek9tWTJW?=
 =?utf-8?B?alEwVDZxcFFWSytQS2EwNnlTMkFlb1V5L0FrQnY0R2tJMTBoajR6ZlZKSWFy?=
 =?utf-8?B?SW5meHRzRzl0VWwzYzlBL1kwN0hkS0QzUUQ4bFd5OTdHNzNENHozK0hjSUk2?=
 =?utf-8?B?am8xYTFoUWdVT0xQSTM0czlZc2RtM0JiUHhDUDRWYnhSa3R6bnZvMEV4cXlo?=
 =?utf-8?B?NGpHWng5SXB5OHpaNmtLSkhuMVVHdkNXVm5pcGgveU80T1U0T0g1aTF3T3Mv?=
 =?utf-8?B?djJIZDErcXB3TmdsV203Wkd5NWI0NEJYbkpHWW9Ba1I5c0l0ZStZTWJENWZY?=
 =?utf-8?B?UHZvRVQvR3F0WFVqVE9Cb3U0UGVDdlM5aEtsc3B0ZWNLNE9VbFA0bm5zOC9D?=
 =?utf-8?B?M3c1dkZRdndaclNPYkN6eGpPUXpkTWJiWU5FUWE2RGFnNWJoMDVJSEpoMnJ3?=
 =?utf-8?B?a2ZaRURMQUFCUjVZWTNUeGRqVGhBYm9udHlUQ0xqR0Z4dHd4MExDUU4vOG85?=
 =?utf-8?B?TWpsT3picHJFalg3SmFSelhqRzRFK0pOcHNFWXlLSDdvOGVGVVRrZXFoYkhi?=
 =?utf-8?B?c1p2bFllWi9FQytlQ2szQ3ZIZThUcGtQMWJrSHduQ1o4ZUk3c2pQeVArOFEz?=
 =?utf-8?B?SGllN1FwdDZPVFAycHNkTmRoL2xaYUttZjNtSlJFS25hc1JHMkJFdFNYQnhn?=
 =?utf-8?B?NEZ6UmVKVCtiMm9ZRDVjczl0S1ZOUDA2alBIMkZwc3JTTy90dGgyTTJ2bXU4?=
 =?utf-8?Q?TFRyBI7aplvpagwbsPSX2Ks=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01630e26-da8e-4fce-628c-08d9e4b8e89a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 12:55:07.9995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HKGmv7UuCUFvnIdLjJdrbbWQ5sYgIDxtMyo8/TRmXVQCmJ3OTPcjrmZqxLjdfSP3jFJA/9C9MqB1iIewI0zD0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5994

On 28.01.2022 14:29, Andrew Cooper wrote:
> --- a/xen/arch/x86/hvm/svm/entry.S
> +++ b/xen/arch/x86/hvm/svm/entry.S
> @@ -55,11 +55,12 @@ __UNLIKELY_END(nsvm_hap)
>          mov  %rsp, %rdi
>          call svm_vmenter_helper
>  
> -        mov VCPU_arch_msrs(%rbx), %rax
> -        mov VCPUMSR_spec_ctrl_raw(%rax), %eax
> +        clgi
>  
>          /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
> -        /* SPEC_CTRL_EXIT_TO_SVM   (nothing currently) */
> +        /* SPEC_CTRL_EXIT_TO_SVM       Req:                           Clob: C   */
> +        ALTERNATIVE "", STR(mov %rbx, %rdi; mov %rsp, %rsi), X86_FEATURE_SC_MSR_HVM
> +        ALTERNATIVE "", STR(call vmentry_spec_ctrl), X86_FEATURE_SC_MSR_HVM

Both this and ...

> @@ -86,8 +86,10 @@ __UNLIKELY_END(nsvm_hap)
>  
>          GET_CURRENT(bx)
>  
> -        /* SPEC_CTRL_ENTRY_FROM_SVM    Req: b=curr %rsp=regs/cpuinfo, Clob: ac  */
> +        /* SPEC_CTRL_ENTRY_FROM_SVM    Req:                           Clob: C   */
>          ALTERNATIVE "", DO_OVERWRITE_RSB, X86_FEATURE_SC_RSB_HVM
> +        ALTERNATIVE "", STR(mov %rsp, %rdi), X86_FEATURE_SC_MSR_HVM
> +        ALTERNATIVE "", STR(call vmexit_spec_ctrl), X86_FEATURE_SC_MSR_HVM
>          /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */

... this now effectively violate what the warning comment says, as there
is a RET involved in the C call. If this is not a problem for some reason,
I'd like to ask that the comments be updated accordingly.

Jan


