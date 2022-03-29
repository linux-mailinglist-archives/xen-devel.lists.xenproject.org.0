Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CF44EAA6E
	for <lists+xen-devel@lfdr.de>; Tue, 29 Mar 2022 11:23:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295740.503368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZ83e-0006Vi-HG; Tue, 29 Mar 2022 09:22:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295740.503368; Tue, 29 Mar 2022 09:22:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZ83e-0006Ta-D7; Tue, 29 Mar 2022 09:22:34 +0000
Received: by outflank-mailman (input) for mailman id 295740;
 Tue, 29 Mar 2022 09:22:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kdRh=UI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZ83d-0006TU-29
 for xen-devel@lists.xenproject.org; Tue, 29 Mar 2022 09:22:33 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c26e5709-af41-11ec-a405-831a346695d4;
 Tue, 29 Mar 2022 11:22:31 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-yEXLb7caPPuuCs5RWV8nDA-1; Tue, 29 Mar 2022 11:22:29 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR0402MB3485.eurprd04.prod.outlook.com (2603:10a6:803:7::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.23; Tue, 29 Mar
 2022 09:22:27 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%5]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 09:22:27 +0000
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
X-Inumbo-ID: c26e5709-af41-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648545751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oPQZP3cFKx3Szc0xvJHHNEJ6aKA3QFDHjlIcHFreOgQ=;
	b=YKjigRqCrALDosfg2n7WiLCxDcZ/OZfr0Sl/HfQHtT6BwdYgltq5Psa+2kloXLEeF7E9sv
	G8oM50tgksoS4qNTZa6fLT3ltEY7SUoeYz+/6KS8fnLLOnPB5EQH1Lytd2/DQMUv5A5szr
	/g319H95xfZlGUF6O2qNaPY0t3G+knU=
X-MC-Unique: yEXLb7caPPuuCs5RWV8nDA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eq8AzoJd7sxJQ5TsKGQTuPto0YDKpYPb+SmqSj6Cyy00CgJtcwQ0aR2obvZ7tz8XrfRcByn5s39nwoGElpGny45NpqBQdHzg0qdQUBx04e6XRKMXVZ90mKa+JETMvtp1QsfaORmzMTBkhXTWuDQJgSkEE5ZFbXjBaGCyJY6K9v8xR7oK+iZLTFhxA60AVXs0eh/ex5bFeM1sVoUe9RYdYneFoWOTeMJJuFcTNZo5x1pNNB5+WdeagRW4wIDca7nGoCLND0bT46adF3NNCqGgfxjMqLGrY6JIvXByDS24IC3Xdf1q23nRFIKKR8QaMXmtHSKLAGoiJYnBTPncEWEamA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oPQZP3cFKx3Szc0xvJHHNEJ6aKA3QFDHjlIcHFreOgQ=;
 b=OYevLuhYT43aProv/trncIda1xkYZQps7d0w6rnC1hcEsCx8toAsp4fwAaxvP+qiUcHXG/fMtdsTvlIBugC2Zq/1lnHyeA8GAvUunXqr6kr0/YgPok6FP+C/Uu3rBOglB+TaifKr2aSXdlqhu2mNTcjkZIYdHNy2Ysv2WxjgzTsVTw2j13Rc+FyOkZEYfod8tImlPNGurb+18v7xjPLeZ90U953fOugsdtdZ8yEpXUxfYU7MmKkVQ4dvFctmgWDBEQdKNrIUCbKuDc3hKSHk8KsP1VC/XCic6OtD+khrTtjZHWcUoFqrNPHNqh4Ohqtz0IJH76IYCLK8IudpFIJk1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dbcd0509-6a8a-db5d-bad7-69027256f053@suse.com>
Date: Tue, 29 Mar 2022 11:22:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/2] xen: Populate xen.lds.h and make use of its macros
Content-Language: en-US
To: Michal Orzel <michal.orzel@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220322080233.53134-1-michal.orzel@arm.com>
 <20220322080233.53134-3-michal.orzel@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220322080233.53134-3-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0043.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::18) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5dee91c1-2bbc-4568-3396-08da1165a446
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3485:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB348527521097ABB2F5D3C333B31E9@VI1PR0402MB3485.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iyYc9Jrd/59ziSouGEBJ43owPSuaUuNZCYl+Ml6tMX6cprMHc4/FyWU7/McBtheZzhz5Tx8k4NmHAUIOp+LDB6EO9Rvj9U2SM7/9udxIBiPor3oHVdtieCiuod1PdH5QmcNz1UVR//P7JMmcYVZs8X/QwNTTO1vqGyPtaLDWRVTslpIG3YN7jkis8pE0Z/MFDyaldpvW7M/cMOegebD24MV3nMKvXHHizjSLWBvn11rPQq9AKvsCU8Ulmd1ux76bAD9ABMuCpmyYfqqRDH3skcRJeQOzevYSnaX+LZaRLfWD2ev1H4NQF6X8q5H3pvXQr1je3IWwzfJXmAAYzUAQxWPLzShbFaqdJy+R1PUnoyxwi4km5JuJ90qvHhxj4CO7qgX1J2uX9rNqgJrU8gV00oklxOpnYSXKjVe8JadgYbxg5oebIEFlwXXmAGOWLrcI09WjR0jNnkfzBqMyDBOeByZAtP3oy2hov2TzoOAoA+gPLje+ZI6U/du8t+RtuMKS9iyC9tSa8mv6G8iuaQsScwpo3rqcoxqzkHNqlsDSyNyu2KCVBnkLqM9i5LCQOw3BIVTjtoQmJ2/n2eM0LBDwOxCgxrKvUJddtHo7gA4QiA5a4d5dEv2BWyWSZPF0PvIxsTYr7r0cxdVbKwaZarQ5nw6LprvQjs9vF80d/cx/DqRpXCcYTR1V1RV1pTjaI30YDBtnYTUzctZpREOdJWurQ3aJSsD4MKB+za3nfyVAGc4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(6486002)(38100700002)(36756003)(31696002)(86362001)(4326008)(66556008)(66476007)(8676002)(5660300002)(7416002)(508600001)(66946007)(31686004)(8936002)(2906002)(54906003)(6916009)(186003)(26005)(53546011)(2616005)(83380400001)(6512007)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2VaZVZ0QlNNVkJucWhNNVc4VnNmY1liOEo3Tmk0VkhZWjlQOEtZSjJuRW5z?=
 =?utf-8?B?dEdiWWlXUXdSVlIxUW5Nc0t5Zm9rcVVUbjAzZC9KdThOV285VDJYT1hLR3Q2?=
 =?utf-8?B?cHd1WmpYbDJ2TVdGbnRIbFgwSHFlNDRVRkdTVGV0LzdISGFtaUE1di9UQ0FS?=
 =?utf-8?B?RWxLZHc2eHB1OHJiUks0aEQ0M1R1dmt2bDd3T1VnMVA4Y2M1ZkRQZzY0SFNa?=
 =?utf-8?B?ZkFKM2M0bU1SdU1Kdk5hVjl3MzhyZGRaam5ZazFEbGZRajg5c1crRjZVZVpQ?=
 =?utf-8?B?dWw5a2tXQjRpZjBONkgrOGcvNENDQW9UZHZ4RlJBbzU0SFoyQ3llaU1aY0t3?=
 =?utf-8?B?U3VObVp1Y3haZFJnVTNEQlFRN0ZrYUVoSURlZStyenRkR0tWL0lVamlzTTNq?=
 =?utf-8?B?ZXppSGNkN3dHRjVMakRwQTcrYkhZOFB4cTRJRHpTR2NTS0R3ZzNVNE40UTJ6?=
 =?utf-8?B?YWtnNDhCVTJZUEhkZThYSnh5Tnl4UmNYblFRVVdiM0RDV25WSzNOM2tHWVJy?=
 =?utf-8?B?MzdlK0h6RVkwSk9YWFcvcG9Qbk52L3gvcFUxcHBQRTZBOXcrR2FNN3FnN2tX?=
 =?utf-8?B?dGZXVUZmSllGT1hBM1VhZWNlS1RLT2MycmZValFoWEowMG5zRG85L3lBUytn?=
 =?utf-8?B?enJGcHdjZ1h2dnhQYmxFWUZBcHBsT1ladjl5QlVSNm55M0FTaWFFNDZCQm1D?=
 =?utf-8?B?OVdRNWFEd2pIdUhSL2VPVDVCa3dCbEdTR29aOW5aTWc1QVY0Ujl1eS9tTGMx?=
 =?utf-8?B?ZzNhTEkrT0owa1JRMTlXSzBESm9zTi9hSU1iTlNyYnRkWi8vcTVXU2tNMHVq?=
 =?utf-8?B?dXJRTkFRRkhuTnN4VjdSM1R5WnZKZzZ3K3A3cUhvVjlDeXpsdWJkTVBhSnpp?=
 =?utf-8?B?ajN2Y1IxRzdRL0RKc1dXSjNvWjdCc0kxNThZQzBob3E0VS9DYVVrMHJnbkYy?=
 =?utf-8?B?cDJBR1A4a3RuMlc2NCtvNzdYc2pRdTJUS0RickU1eWJ1NEtrQ2NtZVBhRmNa?=
 =?utf-8?B?Ty95UlpySDdzRlpiU1BFTUJkc2lra2VyQTZZMlJxUHJUdWpHbXV2SjdoMzFi?=
 =?utf-8?B?cE9MRlFPMG5yN3pwWGQ2OXhXT0pzV3pGWUlHRVgranVXVVBQUEozcmNRa2Vw?=
 =?utf-8?B?b1ZNeEFwM2Rod3o0UElxKzVpVEpzVndmMjlXRVhUd2dQbi8rMEFydDdWNVE5?=
 =?utf-8?B?SmNYZURaNlJWb21MZGxPTmh6RnBHUFlxUUNSWDh3eG4vM2duQWpkL3BRSzRp?=
 =?utf-8?B?K2pKSzVSeUgvbTBiYXVENHduSHVtejZLU3hJYlhMYU56c1NqbjdkVGE1ZS9l?=
 =?utf-8?B?anpzRTJQeXZBZUpTYjQ0ODZBUWFlRHdQSTBnQkMzSVRXSk9WS3ExZFFtdG1x?=
 =?utf-8?B?aGZqRVowUUkycFQ4T2NwQWJBVTJ0bllUb0x4Z2hOdGJLK2RkcmJGaEJsWGNX?=
 =?utf-8?B?YXNwVVkvYmdxQjJkc1UybXJPOGlHRmRFY0FnTDk4TFgvUERrQWMyQUNBaDc3?=
 =?utf-8?B?RTZlU3pjVDdZZ0FaR3dGMzdpSzFNZDFmQ1VmSi9Na1k0Nk9ROUNmWHVRTzk5?=
 =?utf-8?B?eWF6TzluaVJvelJQZWg3aGIrclZidVF6T09Lb2FNb1VwRktjSWFqeWk5QVlw?=
 =?utf-8?B?bUFLN1dyZWxUSFdRMGJZcHZzeENZZzNwY0oxN1Y4a05ZbCttVXFRak5xRmR1?=
 =?utf-8?B?d0RVTU1UYXhsMUZtdVR2aTFlZmlTRmdPYWYwMXVjWnlkbjdXTFVHZUFkVkFx?=
 =?utf-8?B?NVZNNk8xc0VjZWloaW5oU1Q4ZlRpd1phNS93cnlta3VTR0ZrNXIzYXprTW4v?=
 =?utf-8?B?Yk1ONlhjVmhienZQdWdtTkdIajJiNDYxS1hpSkZFbjB2NWZiMlRTUTZNbmox?=
 =?utf-8?B?ZFA3N2d4QmR5NFc0QlV0a1k1TEM1N2dLMVdqb1YzTUVMenQvSmRYVUVRS0Vw?=
 =?utf-8?B?a1FzZlVkUVVjZ1NBRldOZXpHMU9xVHFTcVNiYmdiT1lNVy9uazd4dlM0dndJ?=
 =?utf-8?B?QzRDWWVYdDV4UmQ0WHQ2UVBLVlJCSExFTTR1aU1iN1FBU2QwMlNlNzVqMitE?=
 =?utf-8?B?UWxGd29ySzY4ZGt1WGtWZjFVNDBOQXFKa3Nna0dGOHNhUGN2NlZRcVl3bUxo?=
 =?utf-8?B?anRFMzlFRGVna2EvZ1pSeWJtRCs0TmJyTXBYR3dHbzlJOTZCeUU0TzJuaFN1?=
 =?utf-8?B?SzlubSthK2tZWHVWenlmdUtGdDNxQXpWUEg5MW9uN1A1dDVsWUxNenBieUc1?=
 =?utf-8?B?elFucnhoYzhkMlBuWkZLUVB5c3NMVld6RDR3VThscFk0WHJCLzU1WmxmRmZR?=
 =?utf-8?B?WVJueHVNRU1sazRXMXhrc3Frbnl4S29wemNnOTB3OHBBcDQzV3Nzdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dee91c1-2bbc-4568-3396-08da1165a446
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 09:22:27.3966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TrD/ONjNg5QDk00lPE3wgzN6JOw/FDEjQ5WWrbnfyN9B49D0zjHH8ocNby8fsTGzbQiqFo6iTly5Hl3n4/2Ynw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3485

On 22.03.2022 09:02, Michal Orzel wrote:
> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -69,10 +69,7 @@ SECTIONS
>         __proc_info_end = .;
>  
>  #ifdef CONFIG_HAS_VPCI
> -       . = ALIGN(POINTER_ALIGN);
> -       __start_vpci_array = .;
> -       *(SORT(.data.vpci.*))
> -       __end_vpci_array = .;
> +       VPCI_ARRAY
>  #endif

Here and elsewhere I think the #ifdef should move as well, or to be
precise VPCI_ARRAY (in the specific case here) should simply expand to
nothing when CONFIG_HAS_VPCI is not defined.

> @@ -222,22 +213,18 @@ SECTIONS
>    /* Section for the device tree blob (if any). */
>    .dtb : { *(.dtb) } :text
>  
> +  /*
> +   * Explicitly list debug sections, to avoid these sections being viewed as
> +   * "orphan" by the linker.
> +   */
> +  DWARF_DEBUG_SECTIONS

Considering the comment, perhaps better to move ...

>    /* Sections to be discarded */
> -  /DISCARD/ : {
> -       *(.exit.text)
> -       *(.exit.data)
> -       *(.exitcall.exit)
> -       *(.eh_frame)
> -  }
> +  DISCARD_SECTIONS
>  
>    /* Stabs debugging sections.  */
> -  .stab 0 : { *(.stab) }
> -  .stabstr 0 : { *(.stabstr) }
> -  .stab.excl 0 : { *(.stab.excl) }
> -  .stab.exclstr 0 : { *(.stab.exclstr) }
> -  .stab.index 0 : { *(.stab.index) }
> -  .stab.indexstr 0 : { *(.stab.indexstr) }
> -  .comment 0 : { *(.comment) }
> +  STABS_DEBUG_SECTIONS

... this up there?

> --- a/xen/include/xen/xen.lds.h
> +++ b/xen/include/xen/xen.lds.h
> @@ -5,4 +5,104 @@
>   * Common macros to be used in architecture specific linker scripts.
>   */
>  
> +/* Macros to declare debug sections. */
> +#ifdef EFI
> +/*
> + * Use the NOLOAD directive, despite currently ignored by (at least) GNU ld
> + * for PE output, in order to record that we'd prefer these sections to not
> + * be loaded into memory.
> + */
> +#define DECL_DEBUG(x, a) #x ALIGN(a) (NOLOAD) : { *(x) }
> +#define DECL_DEBUG2(x, y, a) #x ALIGN(a) (NOLOAD) : { *(x) *(y) }
> +#else
> +#define DECL_DEBUG(x, a) #x 0 : { *(x) }
> +#define DECL_DEBUG2(x, y, a) #x 0 : { *(x) *(y) }
> +#endif
> +
> +/* DWARF debug sections. */
> +#define DWARF_DEBUG_SECTIONS                      \

May I suggest to call this DWARF2_DEBUG_SECTIONS, to make clear no
Dwarf1 section is included here (and we also don't mean to support
such debug info)?

> +  DECL_DEBUG(.debug_abbrev, 1)                    \
> +  DECL_DEBUG2(.debug_info, .gnu.linkonce.wi.*, 1) \
> +  DECL_DEBUG(.debug_types, 1)                     \
> +  DECL_DEBUG(.debug_str, 1)                       \
> +  DECL_DEBUG2(.debug_line, .debug_line.*, 1)      \
> +  DECL_DEBUG(.debug_line_str, 1)                  \
> +  DECL_DEBUG(.debug_names, 4)                     \
> +  DECL_DEBUG(.debug_frame, 4)                     \
> +  DECL_DEBUG(.debug_loc, 1)                       \
> +  DECL_DEBUG(.debug_loclists, 4)                  \
> +  DECL_DEBUG(.debug_macinfo, 1)                   \
> +  DECL_DEBUG(.debug_macro, 1)                     \
> +  DECL_DEBUG(.debug_ranges, 8)                    \
> +  DECL_DEBUG(.debug_rnglists, 4)                  \
> +  DECL_DEBUG(.debug_addr, 8)                      \
> +  DECL_DEBUG(.debug_aranges, 1)                   \
> +  DECL_DEBUG(.debug_pubnames, 1)                  \
> +  DECL_DEBUG(.debug_pubtypes, 1)
> +
> +/* Stabs debug sections. */
> +#define STABS_DEBUG_SECTIONS                 \
> +  .stab 0 : { *(.stab) }                     \
> +  .stabstr 0 : { *(.stabstr) }               \
> +  .stab.excl 0 : { *(.stab.excl) }           \
> +  .stab.exclstr 0 : { *(.stab.exclstr) }     \
> +  .stab.index 0 : { *(.stab.index) }         \
> +  .stab.indexstr 0 : { *(.stab.indexstr) }
> +
> +/*
> + * Required sections not related to debugging.
> + *
> + * LLVM ld also wants .symtab, .strtab, and .shstrtab placed. These look to
> + * be benign to GNU ld, so we can have them here unconditionally.
> + */
> +#define ELF_DETAILS_SECTIONS     \
> +  .comment 0 : { *(.comment) }   \
> +  .symtab 0 : { *(.symtab) }     \
> +  .strtab 0 : { *(.strtab) }     \
> +  .shstrtab 0 : { *(.shstrtab) }
> +
> +#ifdef EFI
> +#define DISCARD_EFI_SECTIONS \
> +       *(.comment)   \
> +       *(.comment.*) \
> +       *(.note.*)
> +#else
> +#define DISCARD_EFI_SECTIONS
> +#endif
> +
> +/* Sections to be discarded. */
> +#define DISCARD_SECTIONS     \
> +  /DISCARD/ : {              \
> +       *(.text.exit)         \
> +       *(.exit.text)         \
> +       *(.exit.data)         \
> +       *(.exitcall.exit)     \
> +       *(.discard)           \
> +       *(.discard.*)         \
> +       *(.eh_frame)          \
> +       *(.dtors)             \
> +       *(.dtors.*)           \
> +       *(.fini_array)        \
> +       *(.fini_array.*)      \
> +       DISCARD_EFI_SECTIONS  \
> +  }
> +
> +#define VPCI_ARRAY               \
> +       . = ALIGN(POINTER_ALIGN); \
> +       __start_vpci_array = .;   \
> +       *(SORT(.data.vpci.*))     \
> +       __end_vpci_array = .;
> +
> +#define HYPFS_PARAM              \
> +       . = ALIGN(8);             \

Since you're generalizing this, you mean POINTER_ALIGN here, not 8.

> +       __paramhypfs_start = .;   \
> +       *(.data.paramhypfs)       \
> +       __paramhypfs_end = .;
> +
> +#define LOCK_PROFILE_DATA        \
> +       . = ALIGN(POINTER_ALIGN); \
> +       __lock_profile_start = .; \
> +       *(.lockprofile.data)      \
> +       __lock_profile_end = .;

While for *_SECTIONS I don't care as much, for these last three items
I think it would be good if we (maybe just informally) established an
ordering rule, such that we can ask further additions here to not occur
randomly. Once we've grown a few more of these, this would also help
quickly locating the perhaps just one construct of interest when
looking up things. Personally I think the only sensible ordering
criteria is the name of the construct being defined. This could be
mentioned in a comment ahead of them, and that comment would then at
the same time serve as separator between *_SECTIONS and any constructs
also defining (enclosing) symbols.

Jan


