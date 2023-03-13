Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 589176B726A
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 10:22:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509203.784527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbeN1-0001Yx-Cm; Mon, 13 Mar 2023 09:21:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509203.784527; Mon, 13 Mar 2023 09:21:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbeN1-0001XE-9t; Mon, 13 Mar 2023 09:21:31 +0000
Received: by outflank-mailman (input) for mailman id 509203;
 Mon, 13 Mar 2023 09:21:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ddKj=7F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pbeN0-0001X8-HV
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 09:21:30 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2062e.outbound.protection.outlook.com
 [2a01:111:f400:fe12::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f9d0287-c180-11ed-87f5-c1b5be75604c;
 Mon, 13 Mar 2023 10:21:29 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6985.eurprd04.prod.outlook.com (2603:10a6:10:11e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 09:21:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 09:21:27 +0000
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
X-Inumbo-ID: 6f9d0287-c180-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FMLnTgXqr73ouykBMtShKIQidlZfk+G9LIAm8tWXQKy7QkmI3TerNLlI44Y5wbqmFd8FtkM0K9hB76fqxBgBjUm29ck9+1DD42TVFWB4cRDpUhRUUzoQfh4/NupDEVhmSExJeuR6Rs2TDAPXdcnKImXf7rjgX/Bmti54gCYM5DW7vBOj+S0z710YrnBvOCwuufkmMO5tZfaJLN8sZEk6jJXG99hdmO8OGIfvmujb3ZhZseolV7bid1Cg6m6S9Wzmtqpj19It2AGkw0GR0wekzaZtwVEgrA1yr5OiFlKqZX3AhdhS3+PQLLRw9rMo5x+t3Y59tuZkFacvl1pj8Mx6Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dFdZLRtd+hJaLYLJDRWwBx81Jv0PYYIFppRf3w+um9A=;
 b=fTGiO5wGs94dTkoZ2bx9KJlxZvDE7N4Q6j1/5UUVYOM3k94+F6BNqJK1X9C4VQctYZQqVlLn5ruiFi9X+K+nApoG009j5QPuJzHQjR6gLlpk0joJOzgl8HSDwnFKyzB3qQLmQW9gSvrNmhRxlrZaLmHtCrDONKabAYNBemBS5jDCQ5ZEXBYEGrEBj/jkS7LdMrOxFFyhHCVF0jQjPikxYe2p5SHkHHtl4JO1suYJvgstgQaNMmNrV/TdKSekZWj5fE/9UW6Ou7aVGJntY4V2+kGfX+ARz0aQkKkSt18IoH2mVL2EuCK40TNyPsnFcHXB+FhEl7xNKYihTAFMLsv6Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFdZLRtd+hJaLYLJDRWwBx81Jv0PYYIFppRf3w+um9A=;
 b=aAIDNFjVZSTOaVY4j3+b9Z4I3IAz7qWyNgW5SAj+wJFLOnv/ZRD11GelL/RBKBryWsew/QnOcDHVuzVixE4VAWaojXFUwhFwh8g7msUriR+vtk7HEci6aO12iaPA6v4kQBDPN/YBiVpGFvp7y6U/CjruRLWKqrNuK2Z9/tDhO0KccvpFXBwxWqv6RBNyIcqfwDaVcqIOKZashMMMRfS9j1hB7fzaBkV8A9kmh2yqj98sJnP4wN91B9VS5RdSnBwZM0xWryDU3LAVu7e4K7QdkEVcdMTcKO5JanISfOAny/conCuokdoNNPSDerNY7pMYCNLvecXaxITNQUT7ZhuWQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e0463968-22ff-b2de-c878-63526b981de8@suse.com>
Date: Mon, 13 Mar 2023 10:21:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] x86/spec-ctrl: Enumerations for DDP controls
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230310160238.1321765-1-andrew.cooper3@citrix.com>
 <20230310160238.1321765-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230310160238.1321765-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0151.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB6985:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f9f5b5c-ddf2-4c91-1511-08db23a4529b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qsU0WLphRRTK1R6YEecrJtd/uFEItH/wG1k68zX7CTAAQfGt9NIuRLO1eXVzAvbzMWzRuS9row4JK7ufOwdb8PHYCxn+GzExSVCbTVngkkOJGbIdV5F2cRYD54bvCcuc2ONO1mvSIhaHkkaymAKSyqs19xwhk8JwiPWSlgURW12xSPAIM9XM00PzCB0igz4wBtxoD9xQJW/Pz1pXfU+Qqp08y/x5eYJtsaskjz/4HsFL7mn7gL9fYsMgQUKwOzXxzzBssuQCTXm24B8OAV+u+4qJmMnv0mIYMQMXxEyLyVNdgHyi80GDWYs24cbMigIojJBEQayE3pcYcJvmrZ22FzKyM/+01sUGUokUKetN8lpY9mmkqDMuibCRWl8jG0C8VGvT3PumjLdBZRMQYq8sgNfyGmSw3cM0EZzXrjVY77T4CcBQFhpMVyMkpT5kGNG7QyyPoUp+NeibzIzpDXu8aMi8nGANLvFdoGsSqHhcFlhCVNSa9WPHP44qQRD75KiJ4KiZY+EEWI/XcRzY94MzSOEgs0CTvVzVNn7zlCfJG5F2beoztF+avubxsDkwtOwkVCOWgL+4H2V1MIBBRvrmGgqBNcjZAHqhyRhNEPiU/mnN8LgpmSzGvCaqMvRIrkMhIwpHGA5MREZ6kTf8WJbjncHLsSOnc5gPQdAN5hW84H0RisAOl1cfhbVxNlzzxmw9PCdaN6oxhaP0b4PGKiPnEw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(376002)(136003)(396003)(39860400002)(451199018)(36756003)(5660300002)(41300700001)(83380400001)(478600001)(6506007)(26005)(966005)(6486002)(6512007)(2616005)(53546011)(6916009)(4326008)(66556008)(66946007)(8676002)(66476007)(54906003)(8936002)(186003)(31696002)(86362001)(316002)(38100700002)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWs0cTM0UXNVM25KLzBRSXpPNTVVVVVIRU5xbXVCR3M0d0lNdU5FL2x3Y2J3?=
 =?utf-8?B?Qm13emJpV2N3V2lKd1d3UnVDRWxJUzlEYjlJYmRpdTgyNzY3L0JTU3ZPbE5a?=
 =?utf-8?B?dzhoTDhvVldtRUVQV0lETDNwTW9QYzd0M1FTVGFhb292LzNaMnhaSzNjbURz?=
 =?utf-8?B?anZpSGZjN0FWenF6dmZKY3BwWTZsdDZhZEx2Wmc5Zm9qQmRHOWRpbnZDdGxt?=
 =?utf-8?B?QnM2NkJjUGdFUGFVMHBXQVorYXBQaFNXdC9NK0xzbGlkRi9Lc3ovSXBsTWQ3?=
 =?utf-8?B?K3lqV0hUUWx5TmxSNmpiQ1FMb2RxNGhIdjNJZk9wMkd3ZHc2UkpiR1c0WDd5?=
 =?utf-8?B?YWtKcHF6Q3JtRFFhaTlxcEN5MUxQSEo5TS9XeXFCcXpTbUVrOGJZdWxXMDVK?=
 =?utf-8?B?RlpWR3Jjd0lWeHJmUnRodFVoUytKYWxtYk1aNHVNTUpUQk83UnY5WjZyaEFq?=
 =?utf-8?B?U0lRSnZNeG9HMHJuY1Q3ekp5eUdSWWRrRGJsN0h0blJMRUFSRjIrZndHbCt5?=
 =?utf-8?B?WkR2REZ5UjI2Zzg5MEkzT1JCTE5Xd1FGR0xkelQ1U3VLK3ZDMnNEcDh0cDB4?=
 =?utf-8?B?MlYxZzgrM3FFVlpCYW9RbU5LZ1RWWW1NeXZMbDNZUmFkc3Y0ZUFGSFZqUWZR?=
 =?utf-8?B?UFFoRlJOM3huWE0rUlVZc3IyU2dvYUZ4dUphY0pWL3F1b21yNFN4U2U4N0Iv?=
 =?utf-8?B?YlJDSHlDckZJNlpkSkpjTHdZdDZ5ZFBWeWYzcHFscXZlbVV0cHB0ekpZbTcz?=
 =?utf-8?B?dkFDbjhXNzNSbUJIV3RtQXdmSnQxTHJIaHdpMFlHcnAwdDBaUDNBdVB3L3hp?=
 =?utf-8?B?TkJEa2J0Y3ZMRm1tZEtWRTZzeDNaUXJLcnRvZ0JpVlF2YUZKTlIvZGZmM3dF?=
 =?utf-8?B?ZGdrMks1ejBpQUdUaHRlNk9UVFdYait2eGVXSjZ2N3FiUEkrQndSSVo2Rnd3?=
 =?utf-8?B?UjBRQnZIdFZFRDM3K0Fyby9oSkJRd0YyM0R6ZVUrL01sUGx4dkx6WnY3NCts?=
 =?utf-8?B?bEpORmhrNkIvamRJVEdrUndac1ZPQURoWmd3SCsvUThnajVsUFpwN2l3M0w3?=
 =?utf-8?B?NGJ0bkhVNXhucFZyTy90dksvb2p6YzVzeS9VaURFSEtsRzZZQUZ3czJib3g5?=
 =?utf-8?B?Qk5ZcngwZGJTTHREdlBiNytNWm1wT0JUVW4xODd5NzFITjV0K2RyUTBqcjVE?=
 =?utf-8?B?YkZmUm1xK3RBRWt6RjlIOWVBYklOOXVzNGhRUWRTaC9UUFRIQkM4K0lIMUp3?=
 =?utf-8?B?cmN1SHZXNjRETitQc2pkcVNCUHJBdnBBR096MkRiQ0tKTWd3bXI3T3cxT0pS?=
 =?utf-8?B?dkJqSXllVjhSMXltL3pGQ05iem9YV3hPaWw2c1l1L2hyTWxVdVBSK2lUUGpu?=
 =?utf-8?B?MTRUdmp5ai91SWplN3BTcWhYendSTEJvM0xNdURLcTVmeGhUdjhhQ1dOYkZS?=
 =?utf-8?B?dEU4V08yNWVva1NqVGFMaktKQ05YTFBsanRGUy9ocDNmN1RPdVJLcVJZbXpa?=
 =?utf-8?B?RVpSb1hhM0lBYityTElOdk5UbzBhOFl3NXdhSm03YjM1eHNNRGJhYXhVTndJ?=
 =?utf-8?B?UnphYzRuSDdvZTMrTlFEQm00V0o0cFJ6Y0M0dkZGK2QwVGJOTkhPaFJGUG1F?=
 =?utf-8?B?QXo4TFhHSzRJT21CWVR6REpRT2xMNXNCQnN6aW8rSDM1OWJJR2l6S0syU3Mz?=
 =?utf-8?B?UlliazQ0TkZLSU80bVgzWTBiaklaeXNIZTRic1ozRkpBL2s2TlVDQWg3dEdR?=
 =?utf-8?B?a29mN2JaVTNUWFhjUDZQZHpFV2ZIQVdiZmtBRlRyOE5LbC85SytwaWhWU0Z2?=
 =?utf-8?B?Mzd0TjFBcEI0ODJCbHAvTEF5NzJsU1J2Mm5iOGZmTGFMUVVKM3BDUGU0SEFh?=
 =?utf-8?B?ZDltTzljbXJBeGhmSjhvU0VaQW1KTEtmRFNPR2ZvdUxJc3UxYk9HYUV5bkp1?=
 =?utf-8?B?ZEpnYUJsT1BRYklZVTFMVXp5Qnd1MWtZR0VGZnd2S1RlSmMyaGtuUXF3VmdC?=
 =?utf-8?B?NXM5NDFCVlhZZ1dwSmM5VzY5ZXZVd0k3YlkvK3Fwb2ZoNmJCVXNieWtrSTl2?=
 =?utf-8?B?d1UrYy8vdnAzVHZDUGZpTGVMVWZidEhRL21ldlQySERVSHY5WWdhVXZ1YVhi?=
 =?utf-8?Q?W6yKA/g78S1hY7zE/vhfqWEJh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f9f5b5c-ddf2-4c91-1511-08db23a4529b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 09:21:27.3060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x8en4aOODmpoQoC55pur5aZs9kWaFuumNJqCIWhCGZOUs2nszzcQ17XVDfpiIWelE0las1uG/OYo9eC+p19ANQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6985

On 10.03.2023 17:02, Andrew Cooper wrote:
> https://www.intel.com/content/www/us/en/developer/articles/technical/software-security-guidance/technical-documentation/data-dependent-prefetcher.html
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

In the cover letter you mention that we should enable use of this by guests.
Perhaps also mention this here?

> --- a/xen/arch/x86/include/asm/msr-index.h
> +++ b/xen/arch/x86/include/asm/msr-index.h
> @@ -41,6 +41,7 @@
>  #define  SPEC_CTRL_RRSBA_DIS_U              (_AC(1, ULL) <<  5)
>  #define  SPEC_CTRL_RRSBA_DIS_S              (_AC(1, ULL) <<  6)
>  #define  SPEC_CTRL_PSFD                     (_AC(1, ULL) <<  7)
> +#define  SPEC_CTRL_DDPU_D                   (_AC(1, ULL) <<  8)

The doc calls this DDPD_U - typo, or do you happen to know that the doc has
it the wrong way round (and is going to be fixed)?

> --- a/xen/include/public/arch-x86/cpufeatureset.h
> +++ b/xen/include/public/arch-x86/cpufeatureset.h
> @@ -295,6 +295,7 @@ XEN_CPUFEATURE(INTEL_PSFD,         13*32+ 0) /*A  MSR_SPEC_CTRL.PSFD */
>  XEN_CPUFEATURE(IPRED_CTRL,         13*32+ 1) /*   MSR_SPEC_CTRL.IPRED_DIS_* */
>  XEN_CPUFEATURE(RRSBA_CTRL,         13*32+ 2) /*   MSR_SPEC_CTRL.RRSBA_DIS_* */
>  XEN_CPUFEATURE(BHI_CTRL,           13*32+ 4) /*   MSR_SPEC_CTRL.BHI_DIS_S */
> +XEN_CPUFEATURE(DDP_CTRL,           13*32+ 3) /*   MSR_SPEC_CTRL.DDPU_U */
>  XEN_CPUFEATURE(MCDT_NO,            13*32+ 5) /*A  MCDT_NO */

Looks like an off-by-1 in where you add the new line.

Suitably adjusted
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

