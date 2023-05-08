Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1826F6FA31B
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 11:18:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531324.826918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvx0C-0001IT-UG; Mon, 08 May 2023 09:17:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531324.826918; Mon, 08 May 2023 09:17:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvx0C-0001FY-RI; Mon, 08 May 2023 09:17:52 +0000
Received: by outflank-mailman (input) for mailman id 531324;
 Mon, 08 May 2023 09:17:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tnRg=A5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pvx0A-0001FQ-LF
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 09:17:50 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20616.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33555c9f-ed81-11ed-b226-6b7b168915f2;
 Mon, 08 May 2023 11:17:49 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8309.eurprd04.prod.outlook.com (2603:10a6:20b:3fe::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 09:17:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.031; Mon, 8 May 2023
 09:17:47 +0000
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
X-Inumbo-ID: 33555c9f-ed81-11ed-b226-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uw4yqoCB39j7A7aQvDRriBboaP6Fc9DRv/A81ICOFTEG33FsjwY+bum04HZTgQfZbNGICFoJSiElpk79vRqrTLQTS/MrFp4CleomOk7/QBqmQENgXdWOPDCItWZHfOBw4uWbNDjZ844s5LEf5WP9Jebj+0RCKM+JIaf/013vIFb/XbNolWpozrrgze80mfBP2f+3K5DAK+ZfC2kGWcBP15Dj+mjlVzvrY9MHz2GMY9y3VAmzi764v9ZRw+Zy9WxqB0kZ3tWyXiFkB9LGYCAKT57A1hVKNf9OeMtpmaQDhKU4R2fprUnp7hDvkwEWIMov0Y/RL8IgjrbqequbDyd2Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2u83bdCLKqnnbdakJJyL+ltqn29nF2/1TNG5EbGKPzM=;
 b=c/TRlfR0otQ4K6XztKJwXeA3zj3dGQ/IFGFyBnuQfqMme8Jc7AhhY0PTy/qeXW1mWy9t7wg2fngtAsUE3X8cKTIQ6Ey9w9tjQUgNkrBc6Ln0jpSwRx9HcY6B0WyQIZQZEKf9MQwHdbRE60XxOgqPTB3Fy834APz9tfQQdJo4ZsafHJA3gacVZoau+inWtcc6fJmfWU1rfV5OqOpHfn9jWkoKS9kJVF/mOaGSF1EQhd64fxZce58+L6VUcH63fGhxwb0cgL/M5D4cB0Zs0CrmrTyRqnfd5tho65E6nNwVO5eOnCathJamqiC/KD/HwBfVIFDw9AV9xrRud5/HONz9xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2u83bdCLKqnnbdakJJyL+ltqn29nF2/1TNG5EbGKPzM=;
 b=P1QFS6PuDRoEPaOCUUI503OByZ3hqeXhdbmjh5TeKRiJ83+IVeB1SwP7hK0zYY2nW/xXnfg0CSfr/rAwbsXB8PocG1I1SQuY1hSP1Wmc1/QV2rnKpUy3ldjrfpckY0b4KUa1Xz2A5Qlbq2oL5Cuoo16jrXEqRI3++UASNj2EiVp90XOUSPrfewOocW+v4MDzgtlpc+0rT2LHHpEi9kA2RprsVkPjbi1ShCw+FwjU5QZ2HGfMQCOZTp5XuFDs3LEKxI9KPpnry/gaD/Qhb8Ib01I16vBiV6hoCWaw2OEogKMykzA6LAqxdx+FP+zOHGKZkypY00n8GRrzqem2uq9juA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <166be666-7ba2-c2c8-5b46-19d49aa90f93@suse.com>
Date: Mon, 8 May 2023 11:17:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 2/3] x86: Add support for CpuidUserDis
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230505175705.18098-1-alejandro.vallejo@cloud.com>
 <20230505175705.18098-3-alejandro.vallejo@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230505175705.18098-3-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P192CA0013.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5da::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8309:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a7c03f1-26b2-4ef3-3eb5-08db4fa5169d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QumaP+B9bD8yY9jg9gMvSwp/QqzTxVjEI06Y/qvbuDUI097zSkYh+jiriYXiKQUiKYI7/VKKdNf+cICpTGhffKDDTD2kb4U3T4/rM09xTK1/DdzRHYSDkQy/jQNza4Qy4AeXyXVn1AuSVHDWfvARnLZJxkZ36nwqN7XuWhIB7zBsbFEH4TL8WMcgbEYB9coN63eCme73VR+XHAyai6MHEC385veLbBjGBnxQseF9i0PLlg1PL+VpK4DcMeJrCPqct66ol5b2m6MACVSiOXWbgveq/MyChpQtUYGtQ1Jtbbs74DbA5GOjIJOWEYAKjYFQPurNhQ0gN/09XNsk3os9S2A3moKmjxklV/C3EbIoRjGcqhGPmGnQdLMINNcvYuKWHQiFOeirKctIoecr8JLzt6d1in9n473EaGLHZr8e8eC4lHOyKgZHpyq6pVz689nYGY6BkjgEjKD3OcU211CttBcfGguq1tP5Iykj9CybnaDvCN6B4PYRUlRHAgPUYfGuhB4Ixaay8jVb/MdOOMi63Zr/50s/C/zFcIqocFvc7Z8SSX87sZwlfFnj7ozxgtH7GMdyT+zKreYroMGIii+kkWM30VNCXd/Jrx9mvozG/HWaByaLXT0oardQVKaQEIgBSvFCVGng55HnRxY/luwHyg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(396003)(346002)(376002)(366004)(451199021)(31686004)(6916009)(5660300002)(4326008)(478600001)(66556008)(8676002)(8936002)(66476007)(54906003)(66946007)(2906002)(316002)(41300700001)(6486002)(6506007)(26005)(6512007)(53546011)(186003)(2616005)(36756003)(83380400001)(38100700002)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnhjZE9ZRTNXd2k0ZDF2SmpIWUgzS1dQdS8rdlRydlg2amFoVStVTDFOZVhw?=
 =?utf-8?B?VHZBOHdua0R0SnFYckJUNllPQS94UUZUQkY4bWkrVmx3MGFFVHBsR2ltdGhG?=
 =?utf-8?B?NGw1RDQwNG5GQiswSHNmRDdSM2ZlQTJQNHcwaG9mWUdCdmZLUWYrSmdGZEkz?=
 =?utf-8?B?WXVOazBIaTkvZE52aWpvMHZjTU14a29weHdHUFZQcUNzZEJNY0JPdDYxdDc1?=
 =?utf-8?B?ZzMwUFMvK2c1UmhXTEl2azd4WEE3VDd5cEtjWTFyblBZU2F2d2lpV3c3YUlG?=
 =?utf-8?B?Nk1UUjlNRG4wWkUxdHlXSEd2anRXQUVFYzMxQUp0cTJUU2hHVnB5NWlNVHZH?=
 =?utf-8?B?aWFObGszTi9XZmpiYjVaYlAya3lvUGplUHJNd0l3OGtZVCtjR3JTZFVEMVJW?=
 =?utf-8?B?cDZxaDJPd2F2Z0dQWnhCYXY4L0loaFk4MHZNZTdtaFhyRTRvSGtlcmRVZ2kx?=
 =?utf-8?B?SHAwdjJyZzQ2aUxtZDRSRGJpbSt2SFFCendaNkVDYTlkcFV1ditFY2dFQVZZ?=
 =?utf-8?B?bzhyUGtoMzI5K0lWR2thYmY5ZGhUMVVFUTNKS1NZdHRVU3RBcUtyQytITTVG?=
 =?utf-8?B?WEdjUEJXd0dwcGtlYUxSUjNHcFlmM3ljbE41WjhYMFhtU1NMaStGSk0xbGlr?=
 =?utf-8?B?THFUQkdoMXVFNjNYSnBKblVXeWhFaXF2VG9UU3FCYlJjelg2cDdHVU9TQXlC?=
 =?utf-8?B?dzlYRi9LdE90Q3BkdFVTL1dsZUxCVG0rR3orUjF4UGpTR0M3WTMvL0RxOXhP?=
 =?utf-8?B?bGtMSTY3ZFFUL1c3azhWZXYvTSt6R1pYOUxrQnYzV3IvSm9tdVA2NlY2TXF6?=
 =?utf-8?B?NGVzWnJFdFZ3eXZBSjZsSXNTL1JzK3pJbTV3T3hLM2tGWTQ0NFcrak9OVlZz?=
 =?utf-8?B?RWE5L3hkd1NLZkRETVdBdnRGVE5NeGNYUGVnanVGSWdJdWgxY3FvS1FPWkNl?=
 =?utf-8?B?Ujl5TFZuWjRNZHh5cSthUFVsVUFiVGlJTTQxcjgzV0FGck1MZTg2T2hCeDh5?=
 =?utf-8?B?c0wwM3hyODFFRm1FK0Vra3lIajFhdHN6VUtZakhlRXVXanEwZGg1V2xVQlZV?=
 =?utf-8?B?RXhRWEhRQUc3MTNSUFBGaWdJMXdOMVQzbjhUSmN1b3ZOSVZ0cnhaaU8zOWVU?=
 =?utf-8?B?eTJvd0krbStpY0NYY0s3Z1JPT1oyZzNxUzZTQ0NxTGtwT096L0gxQ0czL3da?=
 =?utf-8?B?U1lCMEROYVR4ajJmN3g4MHF6dlFEZzIzRE9OeTVGUlNwTFFudjlBRkIreXls?=
 =?utf-8?B?clJOY1M0SEFicTlGODB3NWtublFYdkdvam1GUTlZcVNlblV6amFzUHd6eWhB?=
 =?utf-8?B?N1k2cHlHZVBsM1ZCaFNLVzRyMFhVLzVodGplSVIwKytrQk9rc0NYYkxSR00y?=
 =?utf-8?B?N1FkeXhoYWw5QUNNZUExQnJUajlVNFNBUUZLS2ZkZ3J6TG9FVGV2NUR1cmpF?=
 =?utf-8?B?S2FIM0FOYmdIWHd4Z0V6Rkd3NFhCK2VmQzltUmlieGlmK0hFSnMvcm9jQXU2?=
 =?utf-8?B?VWpCMXlCNEsrbXJYSVVjT21uOVJsM1R1T2ZDbjFzTWllZFgreW0rZVNCL2Rl?=
 =?utf-8?B?OXF6SWxtQ3hqSllERE5zN1Z6TC81bEdibVhKTTFobWl0ekROQmZpcUtIby9O?=
 =?utf-8?B?d0NxK0tjcklzMnhXaTQvUERWUUFQVkMvWVlLTVFxWGh1YzlWZ3BROU5sTnVn?=
 =?utf-8?B?dWY2Mi92T3ZlQkpNVVI4WkFaRzFvQ1ZXVW1WMExJSElqUmtUWEFyNTRTUUdy?=
 =?utf-8?B?eFhiM29QU1pvQWRFanZQY2MrcGU2NlZSYmV5T2h2RXVML00zTk1HS2h0aEZV?=
 =?utf-8?B?NzdQbFhaZ0Y1V0hUUTQ5MmdPVGhOTUU4Q3M2VzVrV2YwUWxhZzhTVkZvMnVp?=
 =?utf-8?B?WjRpTHZCSld5emhjQ0UxK25FOHVWdjV2RXNjZ3FsY0xzWFpSRTVNZGh1em5K?=
 =?utf-8?B?OGdOaFNXV3V3UGswVGU3RFc1Q1VvTGhwSFF4NkhyMzgyRm0vL0RRM255QlRE?=
 =?utf-8?B?RVJRQzdKSENGTS90emJhMVBzd0dVL2JWZU8wOFdtanp4Y3UrTk9LRWVMWHFh?=
 =?utf-8?B?dlY0N3RISzl4UkZ0WlQvWUVOVE4zcjlCL0k1R21PU3o3ejBDREVpQk9PS3NK?=
 =?utf-8?Q?/jsPcQkgict7c/P1smZUTVPz9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a7c03f1-26b2-4ef3-3eb5-08db4fa5169d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 09:17:47.2832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RVvGFbPiKc30cn9Niek7Ioxq2VIB7JJzbHSgHV0KbfsVvlXm2VXZ8crOokPgIbX8neDW8UZ5tg3jkIlhzbPgZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8309

On 05.05.2023 19:57, Alejandro Vallejo wrote:
> Includes a refactor to move vendor-specific probes to vendor-specific
> files.

I wonder whether the refactoring parts wouldn't better be split off.

> @@ -363,6 +375,21 @@ static void __init noinline amd_init_levelling(void)
>  		ctxt_switch_masking = amd_ctxt_switch_masking;
>  }
>  
> +void amd_set_cpuid_user_dis(bool enable)
> +{
> +	const uint64_t msr_addr = MSR_K8_HWCR;

Nit: No MSR index is ever a 64-bit quantity. I'd recommend using MSR_K8_HWCR
directly in the two accesses below anyway, but otherwise the variable wants
to be "const unsigned int".

> +	const uint64_t bit = K8_HWCR_CPUID_USER_DIS;
> +	uint64_t val;
> +
> +	rdmsrl(msr_addr, val);
> +
> +	if (!!(val & bit) == enable)
> +		return;
> +
> +	val ^= bit;
> +	wrmsrl(msr_addr, val);
> +}
>[...]
> --- a/xen/arch/x86/cpu/intel.c
> +++ b/xen/arch/x86/cpu/intel.c
> @@ -226,8 +226,17 @@ static void cf_check intel_ctxt_switch_masking(const struct vcpu *next)
>   */
>  static void __init noinline intel_init_levelling(void)
>  {
> -	if (probe_cpuid_faulting())
> +	/* Intel Fam0f is old enough that probing for CPUID faulting support

Nit: Style (/* on its own line).

> +	 * introduces spurious #GP(0) when the appropriate MSRs are read,
> +	 * so skip it altogether. In the case where Xen is virtualized these
> +	 * MSRs may be emulated though, so we allow it in that case.
> +	 */
> +	if ((cpu_has_hypervisor || boot_cpu_data.x86 !=0xf) &&

Nit: Style (blanks around binary operators). I'd also suggest swapping both
sides of the ||, to have the commonly true case first.

Jan

