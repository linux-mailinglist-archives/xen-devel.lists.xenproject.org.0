Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E94E2704D40
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 14:02:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535141.832766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pytNe-0005CI-7V; Tue, 16 May 2023 12:02:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535141.832766; Tue, 16 May 2023 12:02:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pytNe-00059y-4b; Tue, 16 May 2023 12:02:14 +0000
Received: by outflank-mailman (input) for mailman id 535141;
 Tue, 16 May 2023 12:02:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pytNc-00059s-Qh
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 12:02:12 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2060c.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d1fc134-f3e1-11ed-b229-6b7b168915f2;
 Tue, 16 May 2023 14:02:11 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9623.eurprd04.prod.outlook.com (2603:10a6:20b:4cd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 12:02:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.032; Tue, 16 May 2023
 12:02:09 +0000
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
X-Inumbo-ID: 7d1fc134-f3e1-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E8walw5CQquGVOWeyXPsaEr+Xx6HIVQ6ZT2jEmXYxJKmbQ4eGiO2tyMHgnG+DyajBrik/64wTe50rBL0qRtwTyO84UcT38BI6aZTsGe91vduW4nxfd7mm6Ev/mIYw6e9bRu2Lj9yywKizvNd4rThVdf4WdPhHaKL4sGAEmh7NK9/2AWmdrSCP4vkZyPrvCcKkThY5jfzVUb9KD+RFWFQge2uqlzbj+tVwYYDTGGYJF2Q4R0lWt889xSAZnIJtuQkJVeyjndCB5Gw0F5RdnzcXyP6kPm3f4ZTlhYNJiKuDxKpJc5k2WYSUdwdZSY7jye0Enj0haI26aKcMZcRs4GdxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FI+GX9LyzdYreaRhLZ0JN05S1nJBy9Ec7jzMujIlx60=;
 b=mLN+iPW0OR0NxXS1tNcKqI5nf9WJhJk58jsdToh4oJI34gusRJoZXKPhQ7TdR9TpKDgn54df5qjHSHU5b7STqF5QJ01jWSc+grnITUc4rTmH0E4J2j/j6UDpTncBj3eCKw01tC5ZeQ6NW8BLbkHKzspw7Bir1n2ffOI/KTecitMaR0wV6ig4lc5NmGt63yFeLf369AdITk6H/ybtAmLwYfVokTULy6X9C3pzSgcDEDZf8msH0hDway0Av2+fr/0/w5zIJcs3HQeKDWOw/IgSY+kdAu8GduuuhE7wRYUC+D6+SrirGlIH3HbWm2UVSbm2cJSrvZervopTqwzPtcYpbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FI+GX9LyzdYreaRhLZ0JN05S1nJBy9Ec7jzMujIlx60=;
 b=zBUkF4z1HX2U34REquTg6839nUvIAmuXrWehoz+4lcBwEEMH7emN4+XYwehgwfbrEP8Qpea8PIDxN78AxUPYopb10r+32jPM4U807Asl6xSbQMEMhL9Wt8RLA0dFLBU/h6MULUAV8k/LBh2n9htnTxeZtqpszHjGSRYkRMgTotKLdG+4mjb4Z7BCaB/NogLfTUtmdoOs6NL6SjQJ7ncuR1An5y0e8HLW7dDDCdzC21xkjSNvdNIClFzpVmoQQy0XxoYCj0rRhNgCny706hNwwZYH9OztrIDf/AVNAypf3vjASlxeOnOqXM4c7yRwjZGQllEWLl2GYkZg+X8f/L7eBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <347219e4-6c3a-a0ad-b010-4dbd7282c7ad@suse.com>
Date: Tue, 16 May 2023 14:02:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 3/6] x86/cpu-policy: Infrastructure for MSR_ARCH_CAPS
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230515144259.1009245-1-andrew.cooper3@citrix.com>
 <20230515144259.1009245-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230515144259.1009245-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9623:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aeb2b41-4abb-4424-3b7a-08db56055ffa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nVNIyxHSdgDh2zA3r7p+X4to6n+C8NzuekK2T1JEb3D6nQEbntSoeZVeFEopDKFgxP35kcZz2lOnaVT2xjNsNUPoYMFRUbOsPGmM0uu+w05PtGV+5CUeddPEKraWmfIvelN0S2ZwPZI2Z+NK3SKSAMoeV2bCOGbCRWMo1iZVqTFYxLpL4eHAnwBOouwztPnWCTaaAKBJ5Ak1aAED6aVVgrL16PI6FWaas8HjOZ6BeMKRRnn6VYAb8U1fkKd8Yd1Lb11zVmR98YrVhW7ZDTw+NbFm41YPFWFzEH4WpjlTfc/wiSMm3lSrfKuZpPXmbA/LqdewKOLxIBMOGv/PrM2U07k90cxAEXF2SWrM6wCOOIveOjlnZ1PX4QrBM2y7GTmAcnnDm24vBnqp1jyfL7phmMuTOObAK284mXi1TDrBfLbR7R0Sh1x9PC+ZQriPTeRqGm98W/7ZqSAMW9DiyZGtmvHuhzzofbX/VK/zPtLJjRG5gSxfg0nz2J7rXzYdDAc9FVPTpvy9ly/uLY7NL9exXyD/qqAkf2GxGCM9EYiGF+ck8gddCevpLcOakCU/Bv3ckmerscOCjK4s6PvwuoiSSdBiaQmA81v2igVJOKoMR8J3Wvg9v6aYWtD8nmxVhiIXFdm8MGu6j/uRpzjky83PDA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(346002)(366004)(136003)(376002)(451199021)(66556008)(66476007)(54906003)(6916009)(4326008)(478600001)(66946007)(6486002)(316002)(6666004)(8676002)(8936002)(41300700001)(31696002)(2906002)(5660300002)(26005)(86362001)(2616005)(6512007)(186003)(53546011)(6506007)(38100700002)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzlhbFdUTVRsR0o0djVOMHhxalhRSm1ncWhyNnM0Wno4aEhFb2dLMG9TelBw?=
 =?utf-8?B?UDFpK1F0R1dxcHhiZk9RVndNeWIzU3dnYjNUeFlHMlRSZmh4UzQxMnM0UE1J?=
 =?utf-8?B?eGxJbXluWk1kenNkb0VZbUVlWlZvY3pnaGlYMk1FbEUwL3FzS0VnMXJHWWpk?=
 =?utf-8?B?bG1MeU9RSnN4Z3Y3bllzcFNaaUpTdW91bWJUdHFON1IrMElDeTZ1RVk2blRa?=
 =?utf-8?B?TCtYblJnbjlqQkllV2QwYzhNY3EwbFNLS2JrUzZmWFJjUm9NMThrdDB5a0tC?=
 =?utf-8?B?VzQ2VVJjaDJKRGttME42UXp2NDYvMjhsWFNacjVrUmRRMGxzWFZZaEpVTjNH?=
 =?utf-8?B?VHA2ekNIamc3Ry9FS1BLWTlTVHl6cU9BVG55aHZCbEtLRUNZME9yUXoybnhS?=
 =?utf-8?B?SHdTaHNBcS9Ka0JacEhxR2w2SFYwUWdraXhsc01GaTJRL082OEFBaW5UTUN1?=
 =?utf-8?B?cEpzS2E4ZHZMYUFzbUtCMmNMd2thK3hmZWY3dkhPSzdFRnF2K0x3RVlIajM2?=
 =?utf-8?B?aVpWWVFYR1ZWeEd2QXV0dGhtK3VRZ25mMkRITmlmenNtWXdVeEROK09nSGpZ?=
 =?utf-8?B?V0dkZmtWeVhFTkFxZlhnSEo1WGEwaGQ0S2FIZjdEMit2d28zV3pxRmNMUEN2?=
 =?utf-8?B?c1hoZHRmQTE4a0ZWWUs2QUc3YnlTMU52U3Q5TGNyR1RzdnRKL2pzZFdaL0oy?=
 =?utf-8?B?NnJsSXV2cGNCMWlRbTZzOGxjdGFISFp5RWVFVXlwemxIVG1yaHlLRmtSSUx1?=
 =?utf-8?B?UTc0dWtJZ3dLcklCWS9CRXRDVDEweDJsSENPYzk2R3NjYnRid2NicUs3SFlB?=
 =?utf-8?B?dUJmT21JV1Yvd3BnZTRtQ2NCbVBzVUs1RmVLVFhMSEJmL3VJaUZGaGpRL3Ba?=
 =?utf-8?B?R0RRMnBsVTN5VitZdjJZemFUc2Y3ZmI3bWJ5ZHRjZm44SnVKV3ZlWWpxdnVG?=
 =?utf-8?B?aWNnTDdXUmZvdGdrVDlJYjRJeEpFSjh6bHB0bW1yU0oxSjhzN2IxRVN1TmlJ?=
 =?utf-8?B?Nlg3TTBSdis4L0M2c2hJYmQ0WDdNYXlYeVN0RkhNc0RqRlpSQTJTeWt6cU5O?=
 =?utf-8?B?Tkt5YWVoNVdrNWc0aFNlMGRVTGFuS3RMRDJiOTFpVjFFV3NKZjFSclc1cDlT?=
 =?utf-8?B?enYzOUVLYmFNWTl0MzhuKytIb1BKNW93TnlUWGlKNW9TWmpLTVhiV2orOHQ1?=
 =?utf-8?B?MEIvdWFzMmNXOXpudzJ2MUtPM2xqZXNiTGlOOGdsS2lBZExpRFJ1V3k0Tk9Y?=
 =?utf-8?B?L2kwbkpMcEwwUm92VW9vN0JYM20yWm5LalFhRWRrdEJZc0R0VituM0VsWG1R?=
 =?utf-8?B?TXg3VitkUERER0MyVm1NQkpuZ0orN3NWbG4yVTVtRjBDN3RuandwVGVabm0v?=
 =?utf-8?B?Q0hGd3laMklCY2tITjlvRWNSOERhVUZNQVlDc281SEhGaUpOVzZLT0JBTHYw?=
 =?utf-8?B?ck9sQnZVY090eDdKWnhqM0g0OTc1OTRnZ1BXd2IvSlkwZHBuZ3BOdzY0YUJW?=
 =?utf-8?B?a1ZwcEc0SmV1TDBoTnc4MUVjTndyMTVKTzcrL2RDZTAvS0pQUnZUK09JSUJa?=
 =?utf-8?B?SUNLZm56R3dyeGUreUxJVHFpaVVnQnZqaFVYRnBwWG5zSWNmWFRXVEwvUWN3?=
 =?utf-8?B?Y2RqQm41bUw1SW9hWXkyNW13L1FiTGtRSVJNVFBESm9uVmdWY05BWXBxY2Nu?=
 =?utf-8?B?NGRBaVA3Ry90VktHaDRDRVVNSVMvRldmU3BFaU5NMlpoZ3pzZWZFMXpVRlkr?=
 =?utf-8?B?VGgybjR3TVJSZG43emVCZTI1OFkySjRUTytCTGJGaE41eDBRWUovdUxpZUUz?=
 =?utf-8?B?WWtOdHFmWHNRYStXTWZVeUxNOHZSOU5SczR4UG5GN0UwKzZNQy9Eb3RLWDZ2?=
 =?utf-8?B?RjFoMFNFSXpHUnJTMk1mVDZ3VWl3WW1oWURyL0lpdzllckFCdjZ6MVBud01n?=
 =?utf-8?B?VVBDQlVEZXF0Y0hjWUtxWGFGQ1BPU1RzRHhpTURNZjV5NWIrN1pwc1cyNFp6?=
 =?utf-8?B?S3RrYTU0a096aXFvWGhpNVlvQWlrelZDK0hsQm40RGk1aE4zSDRvNGgzb1Bv?=
 =?utf-8?B?MnF6QmY3aUU3bUZwSm5ndWJ2YlRZck9DK3k2cWdtYUptR1JncnY1SjVobkJR?=
 =?utf-8?Q?FYFkF1LIZHMQA1945jbwjV4Hm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aeb2b41-4abb-4424-3b7a-08db56055ffa
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 12:02:09.0179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ustMed+ZUX4jByj29cJ0KSgVKiibJDnRrJULVhGo6SphWqXZDP6j2Rgjx+KHGggaz7oCTzVd/9fR7VPPa+Alg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9623

On 15.05.2023 16:42, Andrew Cooper wrote:
> Bits through 24 are already defined, meaning that we're not far off needing
> the second word.  Put both in right away.
> 
> The bool bitfield names in the arch_caps union are unused, and somewhat out of
> date.  They'll shortly be automatically generated.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

I'm largely okay, but I'd like to raise a couple of naming / presentation
questions:

> --- a/tools/misc/xen-cpuid.c
> +++ b/tools/misc/xen-cpuid.c
> @@ -226,6 +226,14 @@ static const char *const str_7d2[32] =
>      [ 4] = "bhi-ctrl",      [ 5] = "mcdt-no",
>  };
>  
> +static const char *const str_10Al[32] =
> +{
> +};
> +
> +static const char *const str_10Ah[32] =
> +{
> +};
> +
>  static const struct {
>      const char *name;
>      const char *abbr;
> @@ -248,6 +256,8 @@ static const struct {
>      { "0x00000007:2.edx", "7d2", str_7d2 },
>      { "0x00000007:1.ecx", "7c1", str_7c1 },
>      { "0x00000007:1.edx", "7d1", str_7d1 },
> +    { "0x0000010a.lo",   "10Al", str_10Al },
> +    { "0x0000010a.hi",   "10Ah", str_10Ah },

The MSR-ness can certainly be inferred from the .lo / .hi and l/h
suffixes of the strings, but I wonder whether having it e.g. like

    { "MSR0000010a.lo",   "m10Al", str_10Al },
    { "MSR0000010a.hi",   "m10Ah", str_10Ah },

or

    { "MSR[010a].lo",   "m10Al", str_10Al },
    { "MSR[010a].hi",   "m10Ah", str_10Ah },

or even

    { "ARCH_CAPS.lo",   "m10Al", str_10Al },
    { "ARCH_CAPS.hi",   "m10Ah", str_10Ah },

wouldn't make it more obvious. For the two str_*, see below.

> --- a/xen/include/public/arch-x86/cpufeatureset.h
> +++ b/xen/include/public/arch-x86/cpufeatureset.h
> @@ -307,6 +307,10 @@ XEN_CPUFEATURE(AVX_VNNI_INT8,      15*32+ 4) /*A  AVX-VNNI-INT8 Instructions */
>  XEN_CPUFEATURE(AVX_NE_CONVERT,     15*32+ 5) /*A  AVX-NE-CONVERT Instructions */
>  XEN_CPUFEATURE(CET_SSS,            15*32+18) /*   CET Supervisor Shadow Stacks safe to use */
>  
> +/* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.eax, word 16 */
> +
> +/* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.edx, word 17 */

Right here I'd be inclined to omit the MSR index; the name ought to
be sufficient.

> --- a/xen/include/xen/lib/x86/cpu-policy.h
> +++ b/xen/include/xen/lib/x86/cpu-policy.h
> @@ -20,6 +20,8 @@
>  #define FEATURESET_7d2   13 /* 0x00000007:2.edx    */
>  #define FEATURESET_7c1   14 /* 0x00000007:1.ecx    */
>  #define FEATURESET_7d1   15 /* 0x00000007:1.edx    */
> +#define FEATURESET_10Al  16 /* 0x0000010a.eax      */
> +#define FEATURESET_10Ah  17 /* 0x0000010a.edx      */

Just like we use an "e" prefix for extended CPUID leaves, perhaps
use an "m" prefix for MSRs (then also affecting e.g. the str_*
above)?

Jan

