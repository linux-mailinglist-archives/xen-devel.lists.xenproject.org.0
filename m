Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7842B7259A8
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 11:10:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544560.850432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6pBY-00057Z-Bj; Wed, 07 Jun 2023 09:10:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544560.850432; Wed, 07 Jun 2023 09:10:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6pBY-000561-8s; Wed, 07 Jun 2023 09:10:32 +0000
Received: by outflank-mailman (input) for mailman id 544560;
 Wed, 07 Jun 2023 09:10:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdix=B3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q6pBX-00055v-48
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 09:10:31 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0608.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2626d282-0513-11ee-b232-6b7b168915f2;
 Wed, 07 Jun 2023 11:10:30 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAWPR04MB9838.eurprd04.prod.outlook.com (2603:10a6:102:380::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 09:10:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 09:10:27 +0000
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
X-Inumbo-ID: 2626d282-0513-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RmDpn4wEaOcfKSvXzBUlkNubvFLF/gEKfNTYs2GA/fY+qS79neGs1BZj3Zelz7E3AXGT+krGmRoT6qnQ0iLDmHsBGBa/KTdZ0ATK8P54qaKq7R/veG3CrqSU42SOeo/01OyHxUbxub/zzZ7QusEactjHTJp1uKAZYUeDZJmSYevMtXL088CyH+t6q+T6RWMA0wHTtZJbnDQdSbMMHDiaQqwm0EQTA+BRA9KaQHyWHB4ZDS7HwdWfvHToyPYzuh9JhYMTzm43LT9MUc2ab8tD0269/p7Hkn1gpvsfR1Z7phnzGuLT5L+IllL+N3u4m5bNLRLx0B+z1BaoIVkdmaQyDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YP+IbsYJMlYC25NkZV8IWkUlH8FiUEwuE1hTTg7c8KA=;
 b=n6GniQL+WH5qyhzRRz414rk9zbBbfpwu1fq+0axos5WmOZJvBDkkTQYX4p8fzP+rkE4QK3TeSeZyTkmoeeKfIu2C1F54ygzFcwVFQkRzjoW1Yim5ncX/jpSaNIxXpEyQJlKlgdFyrSV+0CoZJ4Nfkprm9WkULWT96PCkPC26Rdes5qfulnYAQ/ySTZOHgm9jCFVVD+DixHB1+XvaHr2de9Cj3Slex2FZ2WFp+WLcTFJ/vdZU7vYexQZSjR7IZybgtSUL9uv8FIoen9w82wK9PKKJefXoK3/1bSUytg1D+AX1axk1+WFIzFvzl1KZgY1199+J4ds51ToCbwwxOyXlOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YP+IbsYJMlYC25NkZV8IWkUlH8FiUEwuE1hTTg7c8KA=;
 b=E4HWk0oTrjMwImzoeZt8cYpRErQJ3tLsl+Fgtieaatifgo39vcM5fi+i+F3N+hOSxfvQJhXJYbvICm9qjuL61A055TXPOcdNmdcHmYQrpQAMJuxhBAwFXWmcNgAhwWwEpqInP28crOMfAk29IMirLB5c1sj00H75FM/eny6PSXhV+hISIuumbcPVH8Z2+NJ+fCz6Uf3CFD40iuDKvp32WJIhl21I6hL1ggoWzOIoIArw03HxMADPaQE206TgmLlE5XPDG4i7BOEIninVPKDWMQ+XtBPKO8k5UxVuwV8vcZPYbVCsoVe16rv7OJolyTB/ltBSb96UV8etdOVhcZRMiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d8048c61-4b81-0527-444e-fdf6f38ccb3b@suse.com>
Date: Wed, 7 Jun 2023 11:10:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2] livepatch: apply_alternatives() is only used for
 livepatch
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20230607090120.49597-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230607090120.49597-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0164.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAWPR04MB9838:EE_
X-MS-Office365-Filtering-Correlation-Id: d3b61285-2ede-4a17-f009-08db673708ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6kxor8AavIRX2pRajKKjyh9qKVTmuNQa/OxdyHVcuTiHwfhws2RgBUhhLkRqZ2a8eAnppHur5xsHDey3ID5FwpZCXenkpaDktwDex67Cm1hHsxzrVtb+kWIn+k0VgPoatZIn3uZ7k7RowtgVhuL9poJu54pcwEFp5WqD0pwUUcFUnQyqVnqNJLMm4z28Lmj783/JTpsCEFZol69fMPLthH5cfMYCxHDBJTu+iS1smko3fN9zNwbgk3GLdtsxGi1GzeTFVDEs7iYySn7DHNjYPi9bb1JIlAyfvUdOJH8D9y0PZ72zLle/vz5/kFc6WTHSyoLENec2Bz4rvSKnsiAeUq258M/OUNBKo5y2gIVOCLiY47YZSQJv1ohb2qKfmVRm9xPO+7V2a4ZIG5YVJawWiwnasofttbAAM8KKFckK/lnkkbINE7U62JWkZVI6iAXDk4J/Udr3fK2xZyssgeuHIhUrQ7+JYTKgVI7L6w/yE47CpKCfDdyFp7HJ/EAVmwrKszshpkBG0Zqr5bBsMrtQ9ka4UEKTl8kZrHBxyC3e8moTT46E8whEfQ2Zd1U3yPMCusQoTNxuNSSBn0X2M+mx7747KC5CB1NUbMPkDrpoOkekxL1Zl1wgw4Xwrv3WaQ3kMKQrULb6TxJG19hhAM4t5w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(366004)(376002)(39860400002)(396003)(451199021)(26005)(2616005)(6506007)(6512007)(53546011)(66946007)(6916009)(316002)(31686004)(66556008)(4326008)(66476007)(6486002)(186003)(2906002)(478600001)(31696002)(54906003)(36756003)(4744005)(5660300002)(8936002)(8676002)(86362001)(41300700001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmovVGcrN0czcXltekZ0aFk5RkpPcE02RjR0bitIUzdDKzYrQ1NrbnphTHpV?=
 =?utf-8?B?blh1eGpGWThacW5WMG1LOW03alRueUNtdnRheXdKL2MvZVoyak96ZnYwNDBw?=
 =?utf-8?B?TnozS2MySGVzVGlpd3dvcm9jWWl1WlI5eWZkWWpvZTBIcnhtMXNwMXpIUnpm?=
 =?utf-8?B?QUU5ZE9xSmwvanhEbElTTU84NzBFWFFWU0J1QVpyWW5vR2xCZ2Z1Yk1hLzd2?=
 =?utf-8?B?VTg2U1V2TVFzVHNyaFVpaVFuYXBPWjdaeDI2RUxNSHN6OVBVSTZZZkRMNnZn?=
 =?utf-8?B?RzVuRVBjQytvbUtId0M3dWZ2VVpBV2szanBnaE51MnBGeS94ODZvNnNQQ0Fz?=
 =?utf-8?B?ZGpzYkd0STFOeExvZ2p1T0loQUlYbTQzYW9VeGZOOXpyY3J0YnQrZTEyMFZy?=
 =?utf-8?B?YmVtV2lYZkJzaTRUaXI3YkxXL2QzWlZ6UkExSC9Bcnhkbjloelc1bE9pRmU2?=
 =?utf-8?B?UTBNMTlBOHhHWlVSeDRqdmRRTTZRZmpYOVlCaUZSMGVqOU1qdGViKzBWTU5s?=
 =?utf-8?B?U3BZbUxLelNBVU9jak9NQ01Sck9COEZlOG1kUlF4UE1ianlIbXpQSnVBY0pM?=
 =?utf-8?B?YVBURlY0NG9RdFByMTFBTW55blhsQTU5SjJJYXFEYlJkTlM3U1BwY3F6SnNN?=
 =?utf-8?B?OGtxWXd6b0VhVk4zUGlMYWxlY3N5U3lsc3RqTS9reHlLY3NlRXM1L0Q4Vk9q?=
 =?utf-8?B?alp0ODZOV3loZ3E2L3NYd2ZVek1McCthNkxKcDNXblczTjNyMXpzM1FKTi9S?=
 =?utf-8?B?RFF3N2YrRG1HUnpoVktqWVRIeDhqUUhxVWF0S2Q4cll1N0dQKzZRUFVNTXlX?=
 =?utf-8?B?bjI2cjR4cTd5VWxOZ2ZqNkZieDB2V2pBejEwL3dtandtOEg3VjVCeGljS1M5?=
 =?utf-8?B?d3dFd3c5dldvNDRuYlZKRlhCOVlocGFhdEpkWUo2ekhuR0dwWUplVlhtVnZT?=
 =?utf-8?B?bEZYS00xdmZEMlJHRGg5by9pUTBPaWkwUDU4MWlhSy93WFJzekpLQWNNcjgw?=
 =?utf-8?B?a0pmVjdSQUplaHVFRVZwQldWTzFBZGdtUlRva3N1WXZ0bDM1ZnhNM0xVNlRt?=
 =?utf-8?B?ZUFHbGlNbTlYdWJ2NVBlbWhIdzhqc3JGMEZ5aERlaW90K0tGZlRnSjFORU9L?=
 =?utf-8?B?UEo5MVE0OWp1L2FhOXZ5K3ZaZlYwbmlGMEs1eU5SbFdtVktsbGRuTXlRSnFE?=
 =?utf-8?B?aDlCOVBWaWtvRzU2NVoweWVsd29hZjd2SXgrTmZxL2s3YllsQWY3bTVCdkZo?=
 =?utf-8?B?Q3RUMWV6R3p3QWhSeE85VDlBYW93OS9PelJzQXlrdHh4T2hJUHNlalNGeHl0?=
 =?utf-8?B?OG1PUnU5MkMxSldoalJJTmd6cVdmWVdQbkZyL3o5WUJ4L1huV3I3Rk5iUzNw?=
 =?utf-8?B?T3NWcTlmZGUya2JnWFhtOHNHMjcyUmhqYjlaZzF5bHhsQU9Fb2ZPRC94TlBQ?=
 =?utf-8?B?dExHR3EvOHBqdlVsWmpvUTN1TWp3U29BS01JZndSSmE1UDJRL214UzA1WDJh?=
 =?utf-8?B?YmFCbDlyR2JXWFREcmVIbmhxOW95UWN5WHdyOTF5bW5Md3BPeWEwd3hrKzAr?=
 =?utf-8?B?S3N6QWNLb01Xd3ZPcUc4TEJCRnRBd0dpb0N4Tk8xaDBacDNHdEg4cm91WUk2?=
 =?utf-8?B?YjZxV3RDVVBacmRveUxrUXZjNUhwN2svemxOVmNjcmVzemFBN0lqWXVEY1lH?=
 =?utf-8?B?Q3hoemZWblBESFhOclFMOTMydms3a1FXaWU5dXY3SHA5MXBKVjBpSXBGRDZQ?=
 =?utf-8?B?dkNib3FBZEQxNTZOcjgxbE40bEhLL1VuY0lwa3NPK0IvdjRmRTcwWDZkeHBr?=
 =?utf-8?B?eEVRNU5JeEdaaHVQVDEwaVd2NU11Ny8wV21uZzYrZEQ3cHpXUGh4L0NMMlUw?=
 =?utf-8?B?cjFib0V3SDlKajFSOGM4RkpGcitvVXRTbzEveHBwZlE5T0VPRjFHMXg5WVBV?=
 =?utf-8?B?NzRwQnlFQnFuTjNnSGdHdU1NSVRaQVAwSTRwa1puNjRyN24wRE5kZFAzL2sr?=
 =?utf-8?B?S1lIUkVqS1V0VWlvUU94a05QeW9PNUVVWGpwcUdjWEdxcTA4TTh4RFh1TzFI?=
 =?utf-8?B?UWlsalRkVy9zNUNvT25FR3Jub29yT09JL1FRRXJXdWFMNXQ3OFFhRHpzYjV2?=
 =?utf-8?Q?wU4FS3aQlkmr9VUPU2mFImtno?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3b61285-2ede-4a17-f009-08db673708ac
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 09:10:27.0672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DB3QT/w+bxgFgIBTO9zwapQioApqoiUFbR8CxUS5B1xCEI2Ymu3Biu8cwsZxm8j3uAE4wooYyM51Caop5unh6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9838

On 07.06.2023 11:01, Roger Pau Monne wrote:
> Guard it with CONFIG_LIVEPATCH.  Note alternatives are applied at boot
> using _apply_alternatives().
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit the implicit ack therein is only on the assumption that (apart
from me) it is generally deemed better ...

> --- a/xen/arch/x86/alternative.c
> +++ b/xen/arch/x86/alternative.c
> @@ -358,11 +358,12 @@ static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
>      }
>  }
>  
> -void init_or_livepatch apply_alternatives(struct alt_instr *start,
> -                                          struct alt_instr *end)
> +#ifdef CONFIG_LIVEPATCH

... to have the #ifdef than the init_or_livepatch attribute.

Jan

> +void apply_alternatives(struct alt_instr *start, struct alt_instr *end)
>  {
>      _apply_alternatives(start, end, true);
>  }
> +#endif
>  
>  static unsigned int __initdata alt_todo;
>  static unsigned int __initdata alt_done;


