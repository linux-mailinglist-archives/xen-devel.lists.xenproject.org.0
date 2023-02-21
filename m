Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EFC69E1AC
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 14:49:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498938.769903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUT1I-0001hm-2E; Tue, 21 Feb 2023 13:49:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498938.769903; Tue, 21 Feb 2023 13:49:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUT1H-0001ey-Ve; Tue, 21 Feb 2023 13:49:23 +0000
Received: by outflank-mailman (input) for mailman id 498938;
 Tue, 21 Feb 2023 13:49:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pUT1G-0001es-89
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 13:49:22 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060c.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ae406f0-b1ee-11ed-a089-e9535cc0f9c3;
 Tue, 21 Feb 2023 14:49:21 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8163.eurprd04.prod.outlook.com (2603:10a6:20b:3e8::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Tue, 21 Feb
 2023 13:49:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 13:49:19 +0000
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
X-Inumbo-ID: 8ae406f0-b1ee-11ed-a089-e9535cc0f9c3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DzQ5Q5kQegwMlaA1ufnT6EUWuZshvTddGzTKiaNetFS5gT0BCpZ/xPCTwjP6J4+k2+eJSPryjUnRWSma10DDmV8w1pXEZJFehxIXy6EIRAkSLP9oJyc7TvC0UrYKWtotZvKwiC6CTrOsgswnsxiyYFljqhpDPRuc05j3w8CZroqoZJ6Ep2C94Mxsh8BH1ZyuOXK4lCyPAWwp1muMUOBfwIGNmWMnpuCUSj2/ymJfuYK09t8ksf3NFO3v6bECoAjEbRwbwaoE+KxbiEEwOInNze6DmeSvPGVIFEakZinDbz5En2GNVcF8MyleYw+8zcn2p6vuGYpqsBStJekAwYmXoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LEmawrD/VsVa9EqwTbkEfCkcw4oEGdNj9/RTJNDBNqI=;
 b=cNV80TpRngt3stEOSjxRU/oF7XFWS4OOzEGaRLc0XwMklKFFLV0Rsi3+gtR9KMiGFDEVOyPK3rb57+6s55y4YMcCpCgBdlzn6xYHwZHgtwxxvEUlESmOoQR7k0AokUTBIjbT4eBiqwnMUXVYa8Smf7hZy7KOSvHP4xsHxnpnb789CwOK2Rst8H80Lk+JAmdO2L0RLs80ry+ZAbfMnQLzHGRw3hx/0inTT/Sev3zUq56e1L5EwuXr8+bGdWtnxvu9Y+EsBi0L6bSx6w9rwrjXP9hIiGFJ9blI2OV6vInaWAJBp9+pxWQ5aRn3uO/NgfVTOOwfnL4v4boqHFqZtoAWmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LEmawrD/VsVa9EqwTbkEfCkcw4oEGdNj9/RTJNDBNqI=;
 b=EJWeS/MYGSoNTnoia2k4nUHBvM35p5u/PqwRfOUoBen5ybECGr5qaNP2xWQo42nYglokiX8hMdfz2naqo4Rvpa8MlUjFPYT9Fi3vu28ogXvuvgZGviy8S1IJHO5EAshX4AhXkZNsMmH1vSZ8lveDSrimu+KrsJv4FdZwgB+xS84lbcT3HMwF2qOA9tSEx+xSJqwcpCfs6Z3C+/TSXgC3A5x4n5yTFNyGMVhi+MwUWDQJXMJJCuchXLn/pFvo/Xn4MTkLAeVvnnhSHi1GB+pWwvEYCQO6l6El7EpLzDlg1DndjQIYlnAI4UGLwhnO2QiPp8/FrYOmbI2oHVhRuq5ZFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <10e72c5b-7e32-f459-2d95-db3b1c7c2be4@suse.com>
Date: Tue, 21 Feb 2023 14:49:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] x86/irq: Improve local_irq_restore() code generation
 and performance
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230220194702.2260181-1-andrew.cooper3@citrix.com>
 <20230220194702.2260181-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230220194702.2260181-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0146.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8163:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cbc7c3a-6848-4e9e-3fdc-08db14126de1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AouxYZYZcRQhWADi4qjC0jFQjWTqUFGdrji0rrRz1yOMEnPr7+F0GI03TJAmr3tK9wECFyfpbAq4Ybo9VpAE6N7YDuUdsCTK6+ZpRaMvodOlBalbVOFvUWx9xOInPy6pX/LLjq2j+f1zSz3F11mYtM3lV/Ssi/37nO0b0/N/c755LI2VKWXcRuOnfbQtRyuHCeTQhUTM8n9Lrj0BwBjxAxvLzq4FAfvID3HS1BueMMSKtqzTFeOIsF+3ISPTZf5AE8zfLdvfsvDTskVsAlkxYxOPbY+79k/SdP5CtKJtg1Ch704zzG9wA/y00IKWAE+K3tUAtc4bHqczTU14/lXiQtwk2j7BXMXCbVe9pil3CrThnNciVEcih0aa0E2yk0eAzSmoZiBsUIE65nGxCYM3DGz2k7Se4fErYLzPuOu0jiTtEOTixKMOcoVgAG9m1XFHYRYOn6ZDoIEKcSYXK4McbpuuZmneqi7NXCZXGS888vcF9iYbme78PEmmuPpB+QQT1MQ8sYWueN3nmrgmlKz7OhBw1rft3RCZ2MTsJvJg4ZqBQQovhjxy+IWsc2/Wd/bmFHMmL5vNXieOrCnePc/ayYMmvgKxgt1AyUagQycMW+ltUqYIJCseeUSK0nY9eFk2EwPkb3baepRT02q3aYSWpYtSmVtCH5h9e5gjeWfk6EvY+lO/+/5qX6WYFEn8cZiob7ZrSn3iVvIeBYQ+fg43xlePbJPNGtASbayaC8FQAUA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(396003)(366004)(136003)(376002)(39860400002)(451199018)(31686004)(38100700002)(2906002)(8936002)(4744005)(5660300002)(186003)(6512007)(54906003)(26005)(83380400001)(41300700001)(2616005)(6916009)(8676002)(36756003)(66476007)(66556008)(66946007)(4326008)(86362001)(6506007)(53546011)(478600001)(6486002)(31696002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZC92WDRleExNbmg3bURYT2RDM25IUzJEb0krdWltWVY2TVZCQXhCbHVBamw5?=
 =?utf-8?B?bGFObEI4R0IwS0dtZGJpOTdtMkEzeVY1b2hXcnlHa2E1T3lxb0tYNGNLVDU2?=
 =?utf-8?B?T1BCWXE3SUFpRFE2b1BOZjRrM09yVHRseHFOamRuaXFHQURoRWtvVC9OOVFL?=
 =?utf-8?B?UzVCOUpzRDJOQmlOU1ZRaS9vaVd5bUxXYjhXdy9KK202ZExMU1dDN1N2MFh5?=
 =?utf-8?B?RC9wL2I2QlNWZHRJVFhXU3VHOUtjU0JWUmNFdW5LRE53eXBodTd4Zy9MaHVS?=
 =?utf-8?B?eE53RUV4ZHJnMG4zdkk5U1pxWXMvS29nQWdlR1Q5eDQvU3U0RDNQVEEyWmV5?=
 =?utf-8?B?bFk2OVdkd3AyaVFCL1ZsbVFraWJ0OUNERm5KYzFleWw0Ylk1NUl4bnJKbHU2?=
 =?utf-8?B?aHlDZldkQ2NsQWx2WVd2alhZcUhKT29hbENFM3NpeHBXMENNSGRzaCtRQ2or?=
 =?utf-8?B?VUdUZWtueVNyNjJFeWpneWFZZzcvRjZjYWwyUVVKeG1uTnVrL2J6RXBxSTBu?=
 =?utf-8?B?YkthcFNnZDlkSVlGcCtDMXZxZklhcGR0R0tmWmZDSmJiQ1FaUFNuUk1iY0VW?=
 =?utf-8?B?bjlUTUlmZ1h1R2dpNENUTjFFQWdrSnpVdWowdjUySGZaTzhJYVBpVk5vTE4r?=
 =?utf-8?B?OWlwamVCVkJjbFcxbE1XR2F0U0g1UkNYNjhFWlVYQ0tHbENKV3ZqSGZvQVFs?=
 =?utf-8?B?SWpOR0kxTStvb0ttKzJJdlo0WERKSVVZN01YcGhxVXU2cXZ1TlVjSDczbTNT?=
 =?utf-8?B?dGk4ZFhsbUJHUTZTTFZkNzRwU3BvN1lYV3hjZ21RT3U1dUFnVXIyN1l6a2ZW?=
 =?utf-8?B?SnB3dDdmSDNuYmx5eDgrcUpmRktEVmFxdExZV0F6ZjZJUElLMDd3MlNLa2Qy?=
 =?utf-8?B?UExhdHJ3UVlsTXZjQU95Y1J6eURHdXVhbkFURGtGSVVQN2dlQm9UTC9xajlk?=
 =?utf-8?B?S1VKVXlxSkFvNXhCNDhSQTdIeFg4VzRRVE13eGpvcitHV1NZdUlpUzVtR0J2?=
 =?utf-8?B?ZUJTK2NrMjhOYmc5VFRRZ3FXZUFLemx2U2lJbjBIOFJTaEF1RUFLZU1FeEFK?=
 =?utf-8?B?RVJvRGtSWFNUSU5USUZSa2xpM0ZxNklBSzJZazhST1h3bTFON1k3RlYvS1F1?=
 =?utf-8?B?Zkg4eGJDcTA2MWlQT2F0NElEdEtLSElLeXhWWlp5N1BLeU1GVWQrRTJ5MnE2?=
 =?utf-8?B?WlNMTjlmcVBCdlI3MlpwYWFCSVE2OVN3WmFBOFZiVHJhVzhxdXhyd0ZXcmZN?=
 =?utf-8?B?eW53U2dOaWJTU2VNWjl4V28yM0laWElGYW5ZV2RNaGM0d09JRElpMmNRUFB4?=
 =?utf-8?B?Z2wvN1JDK3dQL1QzTHFYaHI1aGk5UHhWWjk2L3lLVWpIN0lhZVdnb0s3R3Ro?=
 =?utf-8?B?L1dVeDJqQkdJQ20zcVBoZEhpbHZqaEFCQVhtaWxGV0Y2aGVGZGlyZFJjZVU4?=
 =?utf-8?B?dUlEU0cvY1FHRHp1WFh5SmlCazZ3b3VObHphaW1zUVhteGVtTHpWMVhsRFc0?=
 =?utf-8?B?c2RZaVc4a3p4Wit3aWVzakVWcjZLRVdZbU1DdTNNcDdpT1dhMWFCM1E4aVR1?=
 =?utf-8?B?ckxJbFR6RGhtSW15VmxsamVDL2U5OE15a3BXS1Q0cGZxQ2VxZHdzOG1id3Er?=
 =?utf-8?B?TXE0aFBGTHY5cWZpVElwbHp2QjBYamxNMzFiNGM0Y09WbHBsL1RJRVcxeUZK?=
 =?utf-8?B?NGhxcGRKYkNrSy9FRFdrTXlGUE1wWkJvOVZSakUrQmxMK0hNWUhqQ2tkM2xG?=
 =?utf-8?B?UVFKY1RaZXJySDhrTGhVVldFclZpalhiTUMxK0VJSGNTeTRoZzlicldKWVpk?=
 =?utf-8?B?bjFCVXdzZHRjeHpKY3BDR1lGR2ZHMDlVTHh4bXlyZGpHZnQvQlVUMWVyZnBn?=
 =?utf-8?B?bFVkMDFITFpmY05CaDg5cDMxS1M3b2EzWlRZL0t2cHZXRFNid3kwWENlclY0?=
 =?utf-8?B?eldvL2hHWGdVYnloU1RWYkFaY3RPZjJocm9GZjFrSUxHeStGZEZQc1d0c21z?=
 =?utf-8?B?ZWZjQ2dwNkgvazVnU25wenN0QWt4SVd5Ky8vOEtscm5qcTNiUGwvRnl3Smh0?=
 =?utf-8?B?R3ZPOHI2dVVFNjRLYkhDRENXbUx1VFhRQjBzSFN5b281aDROK1YySGhUQ0Y0?=
 =?utf-8?Q?lExlGBoZ6bAMyXEqGaT3e+4xK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cbc7c3a-6848-4e9e-3fdc-08db14126de1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 13:49:19.0064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tYAPQogHMP0MyzYVM0LXsjIt4bDPAh59t4DcbQ6RbLQ1sflw4joNgNfUbNcfd/wI10AtJOp3jFrhwYtNUvhIYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8163

On 20.02.2023 20:47, Andrew Cooper wrote:
> --- a/xen/arch/x86/include/asm/system.h
> +++ b/xen/arch/x86/include/asm/system.h
> @@ -267,13 +267,8 @@ static inline unsigned long array_index_mask_nospec(unsigned long index,
>  })
>  #define local_irq_restore(x)                                     \
>  ({                                                               \
> -    BUILD_BUG_ON(sizeof(x) != sizeof(long));                     \
> -    asm volatile ( "pushfq\n\t"                                  \
> -                   "andq %0, (%%rsp)\n\t"                        \
> -                   "orq  %1, (%%rsp)\n\t"                        \
> -                   "popfq"                                       \
> -                   : : "i?r" ( ~X86_EFLAGS_IF ),                 \
> -                       "ri" ( (x) & X86_EFLAGS_IF ) );           \
> +    if ( (x) & X86_EFLAGS_IF )                                   \
> +        local_irq_enable();                                      \
>  })

Without it being written down anywhere that IRQs cannot be turned off
this way, and without there being a reference to that documentation
in the description, this is introducing a plain bug; I'm sorry to say
it that way. With both of the above fulfilled I'd of course be happy
to see the improvement take effect.

Jan

