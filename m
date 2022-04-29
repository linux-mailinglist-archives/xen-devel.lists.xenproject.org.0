Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A60BB5146D2
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 12:36:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317183.536398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkNya-0003XJ-Bp; Fri, 29 Apr 2022 10:35:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317183.536398; Fri, 29 Apr 2022 10:35:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkNya-0003V5-8C; Fri, 29 Apr 2022 10:35:52 +0000
Received: by outflank-mailman (input) for mailman id 317183;
 Fri, 29 Apr 2022 10:35:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iTs9=VH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nkNyZ-0003Uc-0S
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 10:35:51 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22c40019-c7a8-11ec-a405-831a346695d4;
 Fri, 29 Apr 2022 12:35:49 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2053.outbound.protection.outlook.com [104.47.6.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-rnbOR1yoO5KOP4YvR8VN1A-1; Fri, 29 Apr 2022 12:35:48 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AS8PR04MB7654.eurprd04.prod.outlook.com (2603:10a6:20b:290::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Fri, 29 Apr
 2022 10:35:46 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Fri, 29 Apr 2022
 10:35:46 +0000
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
X-Inumbo-ID: 22c40019-c7a8-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651228549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lPrOjayVsy3Kq2sWARRiRreSlaE+Mdnbbq6qDxzjrYU=;
	b=ASNIcQN3/9Pdhe063P/AfJFTI1ADamSjg+4L67jI4ubZ59q8akX/aDruFtz+acQKbJg7ux
	b+IHo1McOi4QCKNyrhtluoVlV7HLwS8cqoAlhB6Mka/Zo01VNWfOxbH/5LCas5fnRUpscm
	Xc9IR7fqF/0pxuKGpIUqdB1rXDqkoFQ=
X-MC-Unique: rnbOR1yoO5KOP4YvR8VN1A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R99VKT0mbqOcr8NfS5Ey+VDQx1uMyFT8TzmCfesdkcmQYv/MZfeY7R8hLnAunZyYix9KuL2liyxo4P9c5uLJd2j/e1lBmbl7mQQX1g5mldqQq7ZGAVFkS7Q4DLS7cwOO0RF4R3+uBtyeCrTM1lkYRiatS/O2XSYPHWD3BAFSnO14H58KL09m4uDrUGp5H/jc/59/A0QR07UFuw0IGfPQPa9ASPtjkDIWbXSxttbSjFT3EoyZ9CVJRZ1UsF3XM16ASfkVK5Wx4nJSEbP9/jwZPKGQZdJA05ogXHZT3N2UtLlynjDoCtntwWDuE0DSk3pJWLJq8hydT9raObzRYR5y1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lPrOjayVsy3Kq2sWARRiRreSlaE+Mdnbbq6qDxzjrYU=;
 b=iMWh/pBqBDvU3hcQZ1i/od9fSEJjFOHcOCMjLeZTq5+Ei4X+2H8m09TDuZWj1yKcmp9lcGQcsFl3sQ6IVYC8QdhI7SB576c+pGRyMZc4GT8sQXkOoph7EFcw+Tn3ZehvusDHJdirtpL3huvSUJhUZgntMA9BccJLkwL3HgGLM07rrnHuPkXdzwUoEZOaIZjFM0VfP0rDQdE7cOkrMN3XRKihW0YcOrrN5bXrnfkZIKye6RjwRFOTmNXZpBDA6olTJTiyXgSBA7prr1IDAiPQn7G3moVAZOUzbL7qbQX+DgiBz8PaqJHiGB0ZzssGD/SIRjIldhbecMMMnHdaOBlSEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5be2e13e-fe3b-2a53-d404-8df6a80a149e@suse.com>
Date: Fri, 29 Apr 2022 12:35:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 2/3] amd/msr: allow passthrough of VIRT_SPEC_CTRL for
 HVM guests
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220427104718.81342-1-roger.pau@citrix.com>
 <20220427104718.81342-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220427104718.81342-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0054.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::31) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2059c40f-0d17-42f4-e788-08da29cc0509
X-MS-TrafficTypeDiagnostic: AS8PR04MB7654:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB7654960D00BCA5425D0D8997B3FC9@AS8PR04MB7654.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KOxAKxOI69EgGyTOTz60wF1Z21cN3sC0dbapXJmeRqThP6c5Lc2Z9lYg2aA1fwWQJRCVrPJW2jiPBbnnyWmMe2YrP/mwAHBuriMjxBy/usIJ2b/VbQ7s3S+CtQ3DfCjCg5gLCKJ7L21hfT5jCmKokunk2ropaJO9NC+ApMqdUiCb0AndRGJth5Qu5s0INykkqRGb05HyDrcexhwc1KbTHQurtzdTVrDL58pYByX0+spIYqoMRTCLrCgtHaO/jZlgOzQYrJCytg36lddkG1ZrNOIZtmaYP4eUuZBEQvp85rzUB+jQLbVxBW5iT6FFWSMuyFDCGaSM8jWNeALrqqwxkLnNRNd8Me4lWrm7LephrMyQRMx7nUZYMF8mV38vH1UxHj5et8DZJ9/EFGckt8ssJgOMekurgI9gkniehewMSY4EwTJFCWOTr+Rd1SY63rETKur+2rCW10tyi4irTrtZRxO1PnLPHr936RiG7+/uo5+6cW7lSJETfMue76a1pB6Gj/OkgukdLXNm13NggyleWcWzpA5jGlZKxhcuP5KmxpAhQGdofUFuIcxoJ6AxLaW4d9rGD5yavAdZm5ce3Q6o+kMmlUxbikdTXvbaYEDdtKJLCu3Fy5ITAg9hZccH5VlfjMMpM7+bE2vVvFtodmsikirWLC27g/udXIdnKzYG6CRx6xKga9RL7G2m52jwHhkkQ8d4GeD9julaee8T/wLM73IXrsqDabi16waEWD6WfyM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(508600001)(31686004)(6486002)(8936002)(53546011)(6506007)(316002)(5660300002)(36756003)(26005)(2906002)(31696002)(8676002)(4326008)(83380400001)(186003)(66946007)(66476007)(66556008)(2616005)(86362001)(38100700002)(6916009)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUlQMkhLVlVMeDVNU2QzeUhNMlRDRDlsdGZ5RDU5M1d0WUxGbmQ5bFZBSDdP?=
 =?utf-8?B?dnliSFh4MHFyUTdjYnhKL2Fwc0ppaGF0MFNPUDREa2NGdmtqbXI0NVN6ZzZq?=
 =?utf-8?B?TFY5MnpoM2tSTHJTd1A1d29uR0ZaQTB2UHFjU0xOVXMrcHF1aTdzb2VWd05N?=
 =?utf-8?B?R1ZnSVYrc1Y3WTBETklvdkZRcGlZenYxUm9WTVhHRHphKzJJNmVkYTdMbmJv?=
 =?utf-8?B?T3RFZk9saHpIZWtBMFdJcVpGR3E4QjRBODFVM3NmMUEwTm1USHI1cC9OM2Q5?=
 =?utf-8?B?dTZDZFltaUdVNTgweHBKSGNrZ0tESVpLQ2gzbFRpQ0w5bVMzeUVxWW5PcjFM?=
 =?utf-8?B?T0hzcjdkcElzSHZ3Nlo5UWsxQXVNV2R6S3ZDV0cxS3dSYXZMbUpoVEhDNzZX?=
 =?utf-8?B?TWh0Y21SWGNrZ0Jhakd2TVg3aDVldHQ5SExzU3Bqb1UzSVpDSEx4cklBZ08w?=
 =?utf-8?B?Z1B4UnFWRWNRbko0NkI0VnQzanJ1QWlBYW5VZ0JMcDVJUlRXbWRtQmFBTEQz?=
 =?utf-8?B?RElSM2dFVE5PRmg1YWhLTFRKNkVwOG9UN0x5WjZWdS9tL0M0Z3hTT0JCK1h2?=
 =?utf-8?B?cUVmenBWd2NiUTNzUmx6SHdnRmtxRkFkMUl3STlUU2hrVlhXVElLMW5RdXF3?=
 =?utf-8?B?TExOVzFFTzgrUnMwcm9yWnRaUHM1aEdmTHJ4WUMvMEdYVFN3bEVPWlVUZFpq?=
 =?utf-8?B?VGxoUzhVdDJxN013Z2JMcDJxak85UFhqUUU1dHhuMkQxTzNWSXNWck9wUnZS?=
 =?utf-8?B?ZEVza0tPbVZwYjYxQnpwdzlDalJ1VEVJM3QxQVdXU3dGZndRSmVzbGtNbEY1?=
 =?utf-8?B?cUNOTTNhQmh3WFphTkRXUm9Od25PRy9YWnhpRGNJUndJTHk5dmFmdDlxZk45?=
 =?utf-8?B?OHNsMWpmWFZPeHJyVU9OSHlYTGNUTU45aHJac3FGc2M0Q0J2SUU4a29PWFBL?=
 =?utf-8?B?WjhOUFhDdWplTmlCZUYxeCtsNUZFTmd2TURZRHBENGJlMENHNk9XdkV4R0FI?=
 =?utf-8?B?NnBhWmg5YUsyOG14MVREWVBYOEszUUxWWCtMTjJKZ29IWTZXc1kzR2dTWGwz?=
 =?utf-8?B?NDJnUzZxVStMZE1QZ1dYbXdOb3I3RUlWU1dtNkJraDNza0Z6UHJLVlRmN2J4?=
 =?utf-8?B?TjU1MThiZ29lSm5iTlN5dHdJSExIZWRnTFd4QS9zT3RoYmRNbkhKRWxmUWNo?=
 =?utf-8?B?SEJKQTU3YmYxVWZzbUxFKzRnbWliTkpLeEk4SklDS1NGbThuL095c0lpeXRh?=
 =?utf-8?B?K3lxaXJrMlgvWHNwUHpYZUhqUWlyYzRtQmRPK21vVFJNdWwzTkpUc2FPWXNr?=
 =?utf-8?B?T2pBbTFJUjVhZXpWb1BuSE5vWFZEU0QvdW1TVHZIeGg3NEFXY2lORWYzRlJk?=
 =?utf-8?B?WkFSNkZkYmI3d0ROS2llS2VBQjJLblk0OUtUTUpUaUZzN1JNcUJsZ1pLNjRQ?=
 =?utf-8?B?ZzVrVi9YUWlaU3R1ZnhPMmlra2NyY3p5YVdxY2VIVXYwUVk2UmtBbWk5RFRG?=
 =?utf-8?B?d3JmZ2UzTWxRZkNZSXpCRTluOHg4MDJvbm1HVHk5MVN2QWkyUkxVNUZlc2JW?=
 =?utf-8?B?M09RdlgyWDVYb0dDVlZBYllaV2RkZ3hOR0pBRG1mRGlQUWFHNEw3REpSeVNq?=
 =?utf-8?B?VEdtLy93ck5WcTVhSUVRVnpWK2ZwNUFBL2lnOTczbW5MVndzNkZkbmN4cnBF?=
 =?utf-8?B?b1J4LzJTL2ZoOCtTUG1KbVhxYTZIRStZOVJDcEVaR0V6azlOaGsvTDlJOVJh?=
 =?utf-8?B?OTI2Qm4xK21ScHlLRVZ4dTVzS1VwY0ZzTUZBNFByM25mOEFWVWg1a3BsOElr?=
 =?utf-8?B?QXRxaUd0eTA3dnpjTmJ2QUVSWG9OM2pzL1VkajVtWHBjOWRROEs4MmN2RVhC?=
 =?utf-8?B?NUpmRHQ3NW1hUGlzZ2RURU5JaXBiR1ozcDBrTjBmNDRUSGJxbUlJRnhUUHpD?=
 =?utf-8?B?OEdFelNPREZ2aE9OS1pEVk1ndEx1UmZ2Tm1oSW0wbjQvMHRDQU00dStHM3Uy?=
 =?utf-8?B?M2JZQXFUM1Q4VGFiWVZUT0hoN2tQZitxVXRQM1hqNCtoR2R3RzUwOG5RTHc4?=
 =?utf-8?B?VU1KSGV0bnQ1WXhmTC9Oa0x0WEhhUjBqZ3JKbnE5eTVOenZLVCtvN0FSWk5l?=
 =?utf-8?B?Qk9UODFkcmtMcEt3MU5EMG8wemlmRHZHcUkrM3h4UGIxMjdLb1pvZ1VQV2NK?=
 =?utf-8?B?V0RJTEc0MGNrN0VaM1UwNXQ4VEZRL2hhVm5LSW5WdWV2Qm1kTG9RMU0rWlpM?=
 =?utf-8?B?Y3MwSDN6Z0pZUkxiMnliUVpSYjI3ZHRpc3JJVzhRZ0E3R0NtODN6MlRKMTkv?=
 =?utf-8?B?M1NBK3Vrc2VVamVKdkdlL01td0NoZitsdFlCYnhiekFtMjNPVWRFdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2059c40f-0d17-42f4-e788-08da29cc0509
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 10:35:46.2042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EkATRrrpOx9RPtlkxFHBFzJyT5pEcbGauy0hBUfzFxa7gbrA71blGIf+QPLURx5s/Zp4nZsQ7VAxNpZOa6L5kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7654

On 27.04.2022 12:47, Roger Pau Monne wrote:
> --- a/xen/arch/x86/cpuid.c
> +++ b/xen/arch/x86/cpuid.c
> @@ -541,6 +541,10 @@ static void __init calculate_hvm_max_policy(void)
>           raw_cpuid_policy.basic.sep )
>          __set_bit(X86_FEATURE_SEP, hvm_featureset);
>  
> +    if ( !boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) )
> +        /* Clear VIRT_SSBD if VIRT_SPEC_CTRL is not exposed to guests. */
> +        __clear_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
> +
>      /*
>       * If Xen isn't virtualising MSR_SPEC_CTRL for HVM guests (functional
>       * availability, or admin choice), hide the feature.
> @@ -597,6 +601,13 @@ static void __init calculate_hvm_def_policy(void)
>      guest_common_feature_adjustments(hvm_featureset);
>      guest_common_default_feature_adjustments(hvm_featureset);
>  
> +    /*
> +     * Only expose VIRT_SSBD if AMD_SSBD is not available, and thus
> +     * VIRT_SC_MSR_HVM is set.
> +     */
> +    if ( boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) )
> +        __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);

The earlier patch sets the bit in "max" when SC_MSR_HVM && AMD_SSBD.
This patch doesn't set the bit in "max" at all (it only clears it in
one case as per the earlier hunk), thus leading to "def" holding a
set bit which supposedly cannot be set. Irrespective of the feature's
'!' annotation I think we'd better not violate "max" >= "def".

Everything else in this patch looks good to me.

Jan


