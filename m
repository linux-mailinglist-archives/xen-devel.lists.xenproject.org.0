Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A031174979D
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 10:40:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559790.875107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHKXL-0008U0-Iw; Thu, 06 Jul 2023 08:40:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559790.875107; Thu, 06 Jul 2023 08:40:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHKXL-0008RM-G4; Thu, 06 Jul 2023 08:40:27 +0000
Received: by outflank-mailman (input) for mailman id 559790;
 Thu, 06 Jul 2023 08:40:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdui=CY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qHKXJ-0008RG-JE
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 08:40:25 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20624.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bfed5ba6-1bd8-11ee-b237-6b7b168915f2;
 Thu, 06 Jul 2023 10:40:24 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7967.eurprd04.prod.outlook.com (2603:10a6:102:b8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 08:40:21 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Thu, 6 Jul 2023
 08:40:21 +0000
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
X-Inumbo-ID: bfed5ba6-1bd8-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GcBtOM98e0n9JDSDnLmLJeR1F0E21sQ/sgRU/iR6LiCfGSwoeoyND+xWlylt/9E6W+3MylZ3c57oSD9/rpNu84+lf0jIILAbwhdZ6HQ9fyNFSWvzYkQmBD1zvTn8kcFzGTdLJnBkIWPiF4KvgQiQJrbKl2iIqSDhqkT6wSjsgcGZws3ZpeU1jYASk4b7m987l5VP9oKKGL9BW0AxCwnAJWkFYSBGP+SYXeYte2PmNoaBttUz+MbObWiub0+y7lAnwrikqRkdzjAfXYO0ACb3vmNrXjXgFCaf8ek1qnKJLHc5N5k5lUQKdnvsjJPvysbQkAsSbz8uMcaC0Nl/PnuEcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sc/VbG+Q/mz9bj7O0eceK15ZM3WOZVJH7ScrdEB2dlI=;
 b=TwhfveldVZmkMatMCsYCAF7yN1Ojv5yGZA0Zyz5sT8IwE4W/01BrqEDdW8eQXVnfCXpz2LPftbb2tfBYuaFQD9tugmFyBYyHIURxOdF3VOUGlolrSDLlovroTzs0r/IyLaC3G4Y7tNrptCuWPLZX8w82ctgpY9fpXpx2y9HKSIYrXfaL293ZEXf9BGNx7VN4bHWUniPouYpsEcoVhpTOp555/3CmaKYFPwUflmxLfnC6rKZjx8csfzdNE402VbGXGFfGNT9ltfU3ygkbU3DqJIjhd9YL5LmFp3kx0vHfYOoJKifFBX6uhwPtfyFCTb5DUfLs6YOWmZ67EG7UbBj0HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sc/VbG+Q/mz9bj7O0eceK15ZM3WOZVJH7ScrdEB2dlI=;
 b=llbajvfh/iNXR2cpENDicrRwz463+Engs0SnFF133qkxdw6n4aEGB+k83hjCvcc/UwrSvz57KOAEeD+VtaM5eF/pSwI1kl5U47v8MovRCmsejJNQY4ZDA8Ho/c2UbH3RZpuyAjryOaMnZ8TOTde/qUZ2aMtlXqHGdABrQ11cwSk4CoHuAL4D1Lz55wLsx3BTGk5LHJ2D6RTN+qsnDQGE4ZjE4qWSV4nQt2XNNGzXyhHJr8H3F4oeERHUm3Ixl9anUp70MCXhzFajVVTOQxhhTsgxg4qcHhrMN1H2lfcGQ04fYFiZCCqZAX43CoBW+Sv+63XZcrA9Xw6yE51wx4XDqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <56c15732-1917-dd05-6f98-d02ff5c8dad0@suse.com>
Date: Thu, 6 Jul 2023 10:40:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v2 13/13] xen: fix violations of MISRA C:2012 Rule 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, Gianluca Luparini
 <gianluca.luparini@bugseng.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1688559115.git.gianluca.luparini@bugseng.com>
 <76cf70cb43492966fbcf77d7a2d67d90fe0a32d4.1688559115.git.gianluca.luparini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <76cf70cb43492966fbcf77d7a2d67d90fe0a32d4.1688559115.git.gianluca.luparini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0207.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7967:EE_
X-MS-Office365-Filtering-Correlation-Id: f96b9878-e32d-42f8-59a2-08db7dfca2ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Kkd+VmpR/b9XE5+9wQ67OedShFydCJwpIk3Mm5XOU0O39HeIinjLtMsM1KPfV7jZFXbrA90bIhU3HR0+b/5saHgXb5qc+DF73nAAH72TiNK5es2Pe4yL1IwfhpiDWTw36MpzSOJmW4ENtCAQ3zvKDgV0sGy1r37FZT1XgRqEOxLvCrxVXPaewlj+sY2G07lLuKclGJFrV38w6XtfCg1GpaF/eaasoF8kPiZUh8bY0Ub/gYS92HlW7ARe/icJSf/pLbUxdmAB3J6SDLI+1IO9oYlUmtfce+LUJ8TIue+qC/37hMaziLiQs2wWoOUC4m0vJGN91maZ8BPWn3Sla0eYh9otPBw1dtMNl7s++f6rDK/rUF7NtCClWXdFBPrlyvFO8qLW167xHJVaSh7ooVLTY3KclVlwkV+RoAPyGHcbHmyr/DhUr7gvUgonRQSfWCHhky+ydfM6CCPsmb1CShxTYI2ByAu1ZeWWHzDuTpbDOpRuUQ4AQ7OnGpmGatePlrq42ij4yE4BJlhAPYf1OA10nx8S/YecLm0sKBMKrvwSnDawk9NptYFJuBhAC06IJcPhF1XjlLmpDvGe8pZ88OZMaAW4V60cKSgTvqbOmg8si0btUJO1zbGrZxQKTGz1oSaSJL7b2gO+BnF5V0fZZub2zQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(396003)(366004)(136003)(39860400002)(451199021)(6916009)(54906003)(6486002)(478600001)(66476007)(66946007)(41300700001)(8936002)(8676002)(66556008)(38100700002)(4326008)(2616005)(316002)(186003)(6512007)(53546011)(26005)(6506007)(31696002)(86362001)(5660300002)(7416002)(2906002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGU4TndVL0dvVlptOWNPaHhrTWZsMkN3bUJLQTlFell4Q09wRWI4MCtoZTJl?=
 =?utf-8?B?R3FqZW1KRGk3anJVT3N3eEFBTURaR2lzQjZqbHVicmRmSUdHM2ZHZHk0WmVp?=
 =?utf-8?B?UWE0Ulk4Y0RLYStjY2tJaEl6V24wbnRsbWl5TllTangvRnZQNG9NMDd2SnFv?=
 =?utf-8?B?WldzcjdsVWNad2JBT0EzWFVGL3dUOERmTWFJbytVcFNHTyt2cjhPS0NKODB0?=
 =?utf-8?B?YndBRGlnSmFmNGp3RmdLYlY4ejdia2dFM08rb1JudVlYUEFVdHExblVZNUl5?=
 =?utf-8?B?WjdTbE9udm1uY09aSkthY0ozL2RONjVQMForY2RpUElUd0xXb2RrTHlIa3ZT?=
 =?utf-8?B?bFA0OEhXdm5vNk5FdEVJeEpLd3NBUmwrWWl0ZTFhYm1YQkNkOFVlM3o4TnlH?=
 =?utf-8?B?V0p5R2t6Rzg4RndpVGloRWI4RVI0Y3AwZ0lSekZ5dTc4NGRJd09VMFNNUmNw?=
 =?utf-8?B?R0RkMzIrQzRZT2tSVGlyWFE2U2preGFucXpCcldLUEkzejdhMnNRSmpCbk5w?=
 =?utf-8?B?dWFFZTRFcWQ0cE8yMlNLL2lOb0Y0NEZqUWx5b2ZUdU9WTmtRazRibFpROWdv?=
 =?utf-8?B?UVZjQzVLZ21OcERydGZhQnFCam12bDA5ZnhaVXIyajh6NWxwY1ZGNzQxb2Rn?=
 =?utf-8?B?Q2Q2R1IvL21PRU9jQTJVWWdMY0FQK1VJeUZkVmRUcUxIWG4zSTZnUk9KSFd5?=
 =?utf-8?B?MmNPVUZxY1NvT2lIMkFiV0ozYmFKMHNCYmJRYlZCMDd3U1p4RFhxdHVTaWkw?=
 =?utf-8?B?dy93c09VekpXWXlFOTNKY1gvL2ZZWXBBT2FrbWxQa3JNT010YUlHVjVIK3lp?=
 =?utf-8?B?ajE3Q2hHc25oelBrR0RCbXNLMWRMM1l3bkNGR1V5NDdUSWp2MEd6d0NwK3Bq?=
 =?utf-8?B?ak9sNnhUSVVJM0JieE1BUHlHK3JFSXo4Z2pJQkdzcEtiZSsxcDlsdEFmOVVU?=
 =?utf-8?B?d0t2emhWZmVkR0dvVmJucnhSZnM2eUljZ0x5emEzOVJRTUQ5WXJFNHZHY2Jn?=
 =?utf-8?B?RDIzN0N1a2s4MGV1a2JaOERORUt6WXVXY2dxK1FPdExxT3kwMXNtSmNNQkcr?=
 =?utf-8?B?SlhvSVpDVUdBaFNNWU9WTTZEci9pK3ZaSUl2N1dob3lxVUhOL2pBOE1oVjFQ?=
 =?utf-8?B?NTZxNlRYSkx2VjlNazgwTGk3cEovc3RKVlpKNnp6WHhIbmVrSHRDRlc0azVP?=
 =?utf-8?B?enZLamh6SGRjVkV1ZzBTTW1wUWthWmhRemJ2ZWg0cFlMK1FIM1B2a04wdVVW?=
 =?utf-8?B?TEx3cE9qMVQvaGFKN2NRTFVoSU15N0hKZ3dMR1czSzRvTzYvd003WTY2cXFD?=
 =?utf-8?B?b0ZyM3IzOVBFa29OUkxDVFp0emN4Qnd6cm1rWDdIZDlOaFVudTl1eGEwbUhG?=
 =?utf-8?B?YmFPTFErNXByK0dKaG9LOStpSGZ0UkE4dzNlY29sNHZaQWN4bWRZS1A1NUFw?=
 =?utf-8?B?a0hDRzdST01URThsd3hYcDJtKzFnR0tsdXN0M3JwK21LNERqbXF2UzBKVHhP?=
 =?utf-8?B?NEQ4cnhXL2Y2QVhnMzhTMEhua0VQUlZ0TXdac0d6UDZ0M25TQnNNUjRGSUw0?=
 =?utf-8?B?VTM1V1AvNm5OWkRLK0toVEkxT1pKeFRoRkRucis3bVdjbndIQlVuVm9IcFNj?=
 =?utf-8?B?QW1XSDAxSTY1VitmaUZuOUVzL3ZzNmZiR3lGNzBpVFFIZ3lWNkQ5d3pVdDlz?=
 =?utf-8?B?Vi9jc3krcFg2QVg3SEhsN1FzWGRKMXFUSmdBNTVjU2RmUGh3UVRjVHRsZkpK?=
 =?utf-8?B?aXUwbzFGVjVQbXhhZ015WXdoQ0MrcC9TMUhIWWNtdklualU5cmhucHZFU1RH?=
 =?utf-8?B?Uk1OQkJRVWd6VXVKTzNWSTkxZTRHbmZhQzFIVVZXZHYxQTBwNzBHeVc2UUZE?=
 =?utf-8?B?ZWt3WU83TS90L3E5ZEtkSGFCRC9NSHVWb2t0WnlxM1JSQWRUMC9FZTF6NEsr?=
 =?utf-8?B?QVFQY1dBSE9EMzUyWVZsZHlrSGJadkhSTStWMkJsYXM1ZDQzTXFHdFVMcjVL?=
 =?utf-8?B?MlRQRnlGRmppUTdxK1E4akxKQ2tVNFFyVXhGaEFUdkttVFdoTGFoTFNoU05X?=
 =?utf-8?B?MFp2VmJ6eUhGb21UU3hFdnJUTk9HcGZNV1R2SG9ST2ttNWdBUHpUUk8rVW5j?=
 =?utf-8?Q?w8ipydD9UZPAH9KNDZsn93xcz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f96b9878-e32d-42f8-59a2-08db7dfca2ab
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 08:40:21.8955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OF9IG7muwM2l4zRd6SRmCzstr5DYHuCTx75BOv3gYXQ062j1MoQBzbtDS2ApIvTechW9cJD99niF6l7yhUWNAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7967

On 05.07.2023 17:26, Simone Ballarin wrote:
> @@ -80,36 +80,36 @@ static inline uint64_t cper_next_record_id(void)
>   * Corrected Machine Check
>   */
>  #define CPER_NOTIFY_CMC							\
> -	UUID_LE(0x2DCE8BB1, 0xBDD7, 0x450e, 0xB9, 0xAD, 0x9C, 0xF4,	\
> -		0xEB, 0xD4, 0xF8, 0x90)
> +	UUID_LE(0x2DCE8BB1U, 0xBDD7U, 0x450eU, 0xB9U, 0xADU, 0x9CU, 0xF4U,	\
> +		0xEBU, 0xD4U, 0xF8U, 0x90U)
>  /* Corrected Platform Error */
>  #define CPER_NOTIFY_CPE							\
> -	UUID_LE(0x4E292F96, 0xD843, 0x4a55, 0xA8, 0xC2, 0xD4, 0x81,	\
> -		0xF2, 0x7E, 0xBE, 0xEE)
> +	UUID_LE(0x4E292F96U, 0xD843U, 0x4a55U, 0xA8U, 0xC2U, 0xD4U, 0x81U,	\
> +		0xF2U, 0x7EU, 0xBEU, 0xEEU)
>  /* Machine Check Exception */
>  #define CPER_NOTIFY_MCE							\
> -	UUID_LE(0xE8F56FFE, 0x919C, 0x4cc5, 0xBA, 0x88, 0x65, 0xAB,	\
> -		0xE1, 0x49, 0x13, 0xBB)
> +	UUID_LE(0xE8F56FFEU, 0x919CU, 0x4cc5U, 0xBAU, 0x88U, 0x65U, 0xABU,	\
> +		0xE1U, 0x49U, 0x13U, 0xBBU)
>  /* PCI Express Error */
>  #define CPER_NOTIFY_PCIE						\
> -	UUID_LE(0xCF93C01F, 0x1A16, 0x4dfc, 0xB8, 0xBC, 0x9C, 0x4D,	\
> -		0xAF, 0x67, 0xC1, 0x04)
> +	UUID_LE(0xCF93C01FU, 0x1A16U, 0x4dfcU, 0xB8U, 0xBCU, 0x9CU, 0x4DU,	\
> +		0xAFU, 0x67U, 0xC1U, 0x04U)
>  /* INIT Record (for IPF) */
>  #define CPER_NOTIFY_INIT						\
> -	UUID_LE(0xCC5263E8, 0x9308, 0x454a, 0x89, 0xD0, 0x34, 0x0B,	\
> -		0xD3, 0x9B, 0xC9, 0x8E)
> +	UUID_LE(0xCC5263E8U, 0x9308U, 0x454aU, 0x89U, 0xD0U, 0x34U, 0x0BU,	\
> +		0xD3U, 0x9BU, 0xC9U, 0x8EU)
>  /* Non-Maskable Interrupt */
>  #define CPER_NOTIFY_NMI							\
> -	UUID_LE(0x5BAD89FF, 0xB7E6, 0x42c9, 0x81, 0x4A, 0xCF, 0x24,	\
> -		0x85, 0xD6, 0xE9, 0x8A)
> +	UUID_LE(0x5BAD89FFU, 0xB7E6U, 0x42c9U, 0x81U, 0x4AU, 0xCFU, 0x24U,	\
> +		0x85U, 0xD6U, 0xE9U, 0x8AU)
>  /* BOOT Error Record */
>  #define CPER_NOTIFY_BOOT						\
> -	UUID_LE(0x3D61A466, 0xAB40, 0x409a, 0xA6, 0x98, 0xF3, 0x62,	\
> -		0xD4, 0x64, 0xB3, 0x8F)
> +	UUID_LE(0x3D61A466U, 0xAB40U, 0x409aU, 0xA6U, 0x98U, 0xF3U, 0x62U,	\
> +		0xD4U, 0x64U, 0xB3U, 0x8FU)
>  /* DMA Remapping Error */
>  #define CPER_NOTIFY_DMAR						\
> -	UUID_LE(0x667DD791, 0xC6B3, 0x4c27, 0x8A, 0x6B, 0x0F, 0x8E,	\
> -		0x72, 0x2D, 0xEB, 0x41)
> +	UUID_LE(0x667DD791U, 0xC6B3U, 0x4c27U, 0x8AU, 0x6BU, 0x0FU, 0x8EU,	\
> +		0x72U, 0x2DU, 0xEBU, 0x41U)

Same remark again regarding excess uses of suffixes. The changes to this
file may want splitting out anyway, as this is an ACPI (APEI) header (and
could hence do with saying so in the subject).

Jan

