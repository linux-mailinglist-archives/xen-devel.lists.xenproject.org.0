Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9198646782A
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 14:24:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237641.412178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt8Xi-0008U9-8Z; Fri, 03 Dec 2021 13:24:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237641.412178; Fri, 03 Dec 2021 13:24:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt8Xi-0008S9-5Y; Fri, 03 Dec 2021 13:24:02 +0000
Received: by outflank-mailman (input) for mailman id 237641;
 Fri, 03 Dec 2021 13:24:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EuM9=QU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mt8Xh-0008S3-74
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 13:24:01 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4674c357-543c-11ec-976b-d102b41d0961;
 Fri, 03 Dec 2021 14:24:00 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-N_B56hExPYu48TU-SHSAPg-1; Fri, 03 Dec 2021 14:23:58 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3536.eurprd04.prod.outlook.com (2603:10a6:803:2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 13:23:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.028; Fri, 3 Dec 2021
 13:23:57 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0300.eurprd06.prod.outlook.com (2603:10a6:20b:45a::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.11 via Frontend Transport; Fri, 3 Dec 2021 13:23:56 +0000
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
X-Inumbo-ID: 4674c357-543c-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638537839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=omDvQtMbf62t8NfugCyDhm6LIXr3IUu9OA3WrUT9o4U=;
	b=Z6XQPc28N+UB8WYem05siuZ3xX0xTk0p4hdhDaGbQG5zOM+Rp1M1h6XYqBwZWHKrarO8TN
	Dl1rQYv6f+fR8wFwmyObRPWnXBxzzRP7AQ1I/kxfTr8rU/GmU0xL1Flm18OFfrPl8FYusb
	3xvFY1DSdXLNqHskUmX91Vbcah3zN20=
X-MC-Unique: N_B56hExPYu48TU-SHSAPg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PZq8C14XO8eM2H6nJqWGIbHlm+46JJCSTz1Yh3IMU/pg34oqLF+gJAfrOtJSOp+sEvJmQvHHP4qmWEeM3E8K+aZGD3+yE6OSY1eR0HDRU/56slMMmZx4eevSNFEcIZ0cA1UfXJKkUjSuBcCs90gfbfGgfJyypC5lPZ7yPhPWViTfaD2Uh3OYNA4VqYFzJmdn1Sm5J6qgpAimFjJEOCMaWtjrOv7oYz0wCOlLIi5ngUb7bRyzM/OPMvHqSu2NOf0sEy0b7/W3CVgfNPMpoWfGyDuC6kTC/19SG3PoKPMRwsvhw03xZPHLviENrwe253NIsxhlHIts4ZrdSko+2q0rjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=omDvQtMbf62t8NfugCyDhm6LIXr3IUu9OA3WrUT9o4U=;
 b=U8fJshMIPMYzapMeRc6K3UM9JG3eDEonP8oTxWwSPksXlNaHfTpzDFzGOn7CC0DC2oQBp56uB4WrtwHBcSan+XdnGPGIwXWwM123IVGi1vzXASMQ2ldjABGMT8CRcIzLvhWIW8n2Yam/dUIi/8fw3GRtLKHv1F6es5CEgjNGC4m6TnBgClmjJ88ug/e5QIFozN3hVgd3XMWqGLR1aStzrmWcthEcoVbl87US1mCliNnNDHbNFo/+GyTBy3YovcYyocgI16N39+xmBpKflsgENjwp7//lGRhyy4mt1nXSPpPs5jNFXuUr+KwGCeoJtCl2aIW+3Yyi4orOuO785U5Ygg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c41e4bf9-e523-ec9b-aeb9-c91662685dc4@suse.com>
Date: Fri, 3 Dec 2021 14:23:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 62/65] x86/entry: Make IDT entrypoints CET-IBT compatible
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126123446.32324-63-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211126123446.32324-63-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0300.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ce17f17-818c-40c2-9121-08d9b66028f0
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3536:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3536A11FEA70008DBEDBC3ABB36A9@VI1PR0402MB3536.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ULhgh8l6lkoR/K4gu2ZOcwz5sVqPFkziZSeJ8Mje7sfJ4nKhCGCxVFRLt9f8D7tck4mi/ZfARuyPmj6Yw0POIL2LrHP4hOAuC2gY0QlOCOtJYG7QxtrpYNBbSTRHkIpbkpoylnUn/SjhyTLz7WZRr9GBphV6e7iRHqlwZEmXNAnaPgtjpPeP7MhOGpfmJ2Qq44kKJGDOqga+znpIL3oxhV4izbwWAcLvfQuPGR5xmrSFFUe5PqW5U6/W5XfrK/qsuofWzwuUxAjROiN3+Fq+uDgVSGoSIDXKiFRRZMK/3dAb14A3g5T3su8YbU7b6M/aJZ/AQqWE7LlN9182XfPtC79I2mcMFZJMm94+4N+99ojTV5KyQjvBG7x5fOQGW965ldPJQnk3nnnsZf87x1vl/UvnvBQ1xOZb3gZliwh+sPGHLitPx0sWUvRHdYawfkF+MEdC7J0ZV5b7+6jP04SXdL4MNJV7+BcySeDf03fUo6gs3YoNt6Pm7OlDI1gaZk84HZT39LqSQJ28/qXHmQXfbHOZOuygDP2A70gEqaB+p6N4XVyD1bVluhetiqCZNYSn/SMywXrej6/x7hatdmW1nbz3+S/beb17jooBfmU5+3hIo5Wgo5E2rsIdcL/AG0sYKhMh8fZiY8BGWIy8h4BdBpHcQCM1SRIR0DtGXz46crN61XddB1AakrN0JdXj3f1zh2495JvdLCKdw90Cjk1gk7cBrqgItPpkgwtv5HsWsDM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(2906002)(956004)(38100700002)(66556008)(66476007)(2616005)(53546011)(4326008)(8676002)(8936002)(6916009)(86362001)(186003)(54906003)(36756003)(5660300002)(31696002)(316002)(26005)(66946007)(6486002)(16576012)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3NFd0tOaU11ZG5YWVFvM1ZBa2tRTDN2cENTeEgxbXJlVHFyYmp1MW9JL1JT?=
 =?utf-8?B?WDFSbEN0allTMDB0OXh2emJsaDZXS0tQRjliaGhpNFYwcWduUklDNFRBSkRs?=
 =?utf-8?B?bnNHNkNicUl0bjdxRG1IZmhFdkVHenpBM1BibTRLcVc2cDEwaVdWZkVDRDhE?=
 =?utf-8?B?YUE0Y21MU3NzT1R3dHljZklGelI1VkZOeExzZDVQTStjOThBUEM4VG5Jcnlx?=
 =?utf-8?B?THdiV0wrYUN4dkFkdDV1WVQzL0ozRys3V3UxUGw5RE9BZGlFMWd2MXU1clF0?=
 =?utf-8?B?M1E0WGlCcnpCb3hGeEo3eHdTYkpSOUZwNzl6NHBySnpjWVB5bDJ0YWJpZ0Ju?=
 =?utf-8?B?S0kwaFoyVlVrVHlqZ0dORTRuMU05TjI0VUZ4a3NuaDN5VjIxeG1CS1lNNCtM?=
 =?utf-8?B?MXlmNkJ6OWZTM294c1Y5eXVwS21aQUE4WmFBU2lIMU1hVzVqVjdGTlNQQzJo?=
 =?utf-8?B?bTBhYlFpS2M1ejhnYkZPcFoxZitKc3JjZmhFa0Fmc2hUZ2tXSkEvbkxBaFBa?=
 =?utf-8?B?UzZNbndkd3FNSHptOG8yM2dFQWxFZkg0UGVrbWtVemNma3NzcXZHd1F4RmNP?=
 =?utf-8?B?cTdQeUNoaEhoZ25aOUNhWi8wQmJ2MjJ3Y09wWWhueC93TTlGSHJ3NlFJaWJJ?=
 =?utf-8?B?TU5uVnh0bVF0bVZDd0lMZ0owdnNVMnpNeUh0Z2N0Tk5jMVRiUDhGaklnTDYz?=
 =?utf-8?B?QWR0YVBLNVZFL1Rydis3K28wajVmcXZ3V1BGdCt0ZmQyWHZyTHpjVjkxWklx?=
 =?utf-8?B?Z0Y1S2dkVUp0dWlBM1UyZmdoMmV0R1FlZjhOV0NvbVBvLy9UTW9HS0Z3dlgw?=
 =?utf-8?B?Rkpja2IrM3F6Q0RXZ3V5UXlKdlFiZXVZUi9sQWZ5ZFgrYlNJb2pzUUVQK2hr?=
 =?utf-8?B?OGNzMW4xdkFxckMwSU0wSkh1U2hUZ0wzYTdNRXlIaFdEanJIR0M4bXc2RE9s?=
 =?utf-8?B?cjlBdlY1bWdicFZWcmdvNU5QK29iYVRHdEowVHhWdXZqaGZjeUV4MXdseE5l?=
 =?utf-8?B?VkdvSTdiK2FOWVp0YVNNQzU2V3FUVDlhNzVxLytGcDh4L1RjaFBNaW5xTVNv?=
 =?utf-8?B?cSs1YTdFS0hQVEUyTG9Xcm42dnZ2Vm9wclA0VmNMampiRWM2azhpMzF2VzNB?=
 =?utf-8?B?NGlld0ZmYm50djZBQ2xpNStSbU5zWUVBMklubGdjeUZ5UzFVVXNsUjFudERz?=
 =?utf-8?B?WEVPYnRpWWJPeksxZ1Bkb054bVNTdi9lS0tPRDdRQlhOTjcwQ1dOaE1wdkE1?=
 =?utf-8?B?NzMwY21XbjFXZEJodWJnQTl5RDA5UXprQjJaclk0U1ZtYUdlRmREUWJwa0Iz?=
 =?utf-8?B?TWROWVJLU0Rqdlo4d1J0OXpWVzhEWGNVRG5sUHlsd1JsT3pIc0c5ODc3VVNp?=
 =?utf-8?B?R3VaKzVOaWFmUkg5WjJWSFhGVHFydXdKNmlUVzROQXRxa0RXbW1HeWVyajZK?=
 =?utf-8?B?aVZjMy9GOEppYzNJN2liRGt5U0NkSmswYUE0WUtQRzYvM1ZMblpOR3JsOVVY?=
 =?utf-8?B?NmE1S3ZrZDBaK3ZtQ2RLMUdIMGxNaGFkN0hVbW1VdHViWHptRU1tZ3FIQ2Ru?=
 =?utf-8?B?bytnWnB3OWlKaDl6T3ZTYUMvaERNY09oNXlISVpadEJZakRDclRpNmRDYUlB?=
 =?utf-8?B?Q2xFMW5qbHMzMnNDeXNBYzRIZkVhZlVPN20xZWh2R3laR0JNbDd2OUZZOHB0?=
 =?utf-8?B?a1dFdVhmR2R1QTVWSUNHVlBPU2Q3cG4rcVZJaVA0TXZJTUN2dzhseVJCb2Q5?=
 =?utf-8?B?TXlTZmk2RE1pUldseXlOL2F6MmN4YTZnWnBuY2tRM1lnZVMxSzUvU1M4OU9G?=
 =?utf-8?B?VUpkQXBoV0VuMEJ5UHhaenlYVnpYOTlsT2huQWV0Mnl0am9KVU04d0V2cjB6?=
 =?utf-8?B?cVBXeWVSb1ZFd01XY2NKeks3R3JIcjlYZnRnMm5ReUNiZDhQWDVIMjBjWUpK?=
 =?utf-8?B?SHl5eVJqdE82Mmh5OVN2R000OEZ5a3ZzcDUzT0lCeENuWFBFS1V6Z1pKOWp0?=
 =?utf-8?B?Q055ekZDMHVuUnFrWitBRFhrQXFlRHRCaWJsUHMvT3BPL09INUl4c2QvVVdC?=
 =?utf-8?B?SngxMlZLc0QvZEw1eG9MTTUvc0MwVThXWE50aGhKZFhmbXoyQVowWDRwN2Za?=
 =?utf-8?B?aWFjUyt4NmJOM3B0RldpNWIzNjZIMjZvbHZEcXJZRzUwRE5pRkpmRU16UW9O?=
 =?utf-8?Q?x8T+O/jI++rQyd03sy/DMjs=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ce17f17-818c-40c2-9121-08d9b66028f0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 13:23:57.1464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X7CzG4DoRinnX0jsI1ULMN7WXkzxPudp1/YMnLuBFyVFvcGyUTYokGvyVS+v7GLZK3mzIdkJ355HuJHvlC9XrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3536

On 26.11.2021 13:34, Andrew Cooper wrote:
> Each IDT vector needs to land on an endbr64 instruction.  This is especially
> important for the #CP handler, which will escalate to #DF if the endbr64 is
> missing.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

One remark though:

> @@ -1136,7 +1158,8 @@ autogen_stubs: /* Automatically generated stubs. */
>  #endif
>  
>          ALIGN
> -1:      pushq $0
> +1:      ENDBR64
> +        pushq $0
>          movb  $vec,4(%rsp)
>          jmp   common_interrupt
>  
> @@ -1146,7 +1169,8 @@ autogen_stubs: /* Automatically generated stubs. */
>          .elseif vec == X86_EXC_CSO || vec == X86_EXC_SPV || \
>                  vec == X86_EXC_VE  || (vec > X86_EXC_CP && vec < TRAP_nr)
>  
> -1:      test  $8,%spl        /* 64bit exception frames are 16 byte aligned, but the word */
> +1:      ENDBR64
> +        test  $8,%spl        /* 64bit exception frames are 16 byte aligned, but the word */
>          jz    2f             /* size is 8 bytes.  Check whether the processor gave us an */
>          pushq $0             /* error code, and insert an empty one if not.              */
>  2:      movb  $vec,4(%rsp)

Like with initializers of compound objects vs trailing commas there, I
think it would help if we moved away from placing insns on the same
lines as labels. As can be seen here, inserting something always means
touching two lines instead of just adding one.

Jan


