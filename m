Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5770076E437
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 11:20:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576136.901947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRUVf-0001uD-QS; Thu, 03 Aug 2023 09:20:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576136.901947; Thu, 03 Aug 2023 09:20:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRUVf-0001pw-Mw; Thu, 03 Aug 2023 09:20:43 +0000
Received: by outflank-mailman (input) for mailman id 576136;
 Thu, 03 Aug 2023 09:20:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qRUVd-0001ST-M5
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 09:20:41 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03b7f1d8-31df-11ee-b268-6b7b168915f2;
 Thu, 03 Aug 2023 11:20:40 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8678.eurprd04.prod.outlook.com (2603:10a6:10:2dd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 09:20:39 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 09:20:39 +0000
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
X-Inumbo-ID: 03b7f1d8-31df-11ee-b268-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJlx66OZkNQHDNQEHHKfhZow7njOA8UR1ijunZRTJmTw5dLxCXYu53CAXp/fQoZmpPN+Zw0Il+80AKJIoEtOnhaK78//kjyKsLFRKG98ncIOD9Q7HfLppKYdu/GF455bUtSQhnyK1hdcUFVdq6/paY6RwTLcVeALfYCAxkVkUyEbu4Or3oEZZ06Dun+DGWPiJiGgKiOJDt9oCczDD2+XcZPqjjR8v7KBxwCBgOJSaxOKFGsniocRqHvQkyYPvJY9aJOvFQDwP9mKOjNWbl9U+8hT02HXT0XUsDqFY4njUMSQ5EMJ5VWS+ESyjBBFQNf302DV88Y5YdZhc4TSbQcdtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tA1PdkAWBB6c0y72UrfcTIBqgkop7cNxizi7uWeUh6w=;
 b=R4r7Ubpbde8JAo4mxXescEVAVuJgrmPQbB+3uMjZmjMi4lQyrPvmOXwolPhl6S2EfrbxQLuh9DexSfc/RNBiKuBU3suE+LEJ2WxgIl5blakCTcjM9K8Pv6w/z+hUwDJ0U3ZiXA3GerWtjQR4vvSVfYC4ZrkKONWlxfFZKrDaYKXx0LoW56h2RO+ynms5o5FMks78XjqR8X5AJscuEEtekRiCW2jKRnelInXGcU+svCeCXm5eXWsRB6Rm7fkyMqomezka1HbXVL1ONxIxAmwsXjtxotir7zZtg0KNv5PJLrSvWkA0dZKGs5WMb8hWCgpn7Q4PYOtEl6fRFEGFbcuT/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tA1PdkAWBB6c0y72UrfcTIBqgkop7cNxizi7uWeUh6w=;
 b=oyQC8SZ6iKQfCngEL0lnc9wFZwuCVXxmZJxQkX4R6uVevSN2KASHuqAasjm/utNLjcHeYazPEuoW/Dvn9nVL5t31YLQNoVH96O7JYSeLrCX6sZHaGf8Jy3CX1XcWWWc3WwWLCXeADEqBvZPlr48vqLA0rbgxPJcVl8QkOnIj8bsryDa/28RM6iBVyZp1izZ9zzmaoU6oqcqubHxiaotp1lQw6cJtbS8roClrRPCixpEPAeUCCspT5r8w8MNJiVgkQ4m1IYH6ciumbtCQGNvd2M758+uY7vPASv1qW+LZi/hOCgBih4vCSsklKYNEi4lVLRwnXyvYLZa9dAI12CWb0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0ba36273-33ad-753c-06a5-be117b6658e0@suse.com>
Date: Thu, 3 Aug 2023 11:20:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [XEN PATCH 11/11] x86/mm: Add assertion to address MISRA C:2012
 Rule 2.1
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1690985045.git.nicola.vetrini@bugseng.com>
 <91b2f2c9e728c1f19f7baab301299d995a074279.1690985045.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <91b2f2c9e728c1f19f7baab301299d995a074279.1690985045.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8678:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f333f81-b4a1-4895-ea92-08db9402e74a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/l0MpECWaENy9MOPbCNbji8bWyg+031oRhtBoori8dJBIZnXEatrmBOx9rvqjJwog5nh+0ZWrVfHyZMf7Uzn8Uby142URyznsps4lLQFqlCa7q0fVcZOXZkrUu8AgUAlpecdMXH3fbdFEdSXURy3g5+p+528fH7SblZVIt/dUBdgBzVWH0nQd4aHsUFWb8DFwjC7C5TJuLf9swVD77g0gwZmwxiYKKPQehST1YUgzd5UPHYSxbL1npH63cEpRz2Yv6/OEc6YAYfe1KHeFJPXZLc+wB+nUd75TgxUyd8gB2k0L0qAJCqmiaqE3Vil9K/OmfEzh9ZK2I2FYz8gMbZTo23bcbjSo/BSbA/BoqO4Dj+uFsRAV0+hC9VWZ92i5//4JasVSbQ4zAVoyQqCPLpARwNezIZJV57FS4fisgJL4POIndnWBz8f2L7z4Qm/brzB+MjrH+opGi+T41mqiizfcTVpvp8gjAJFi0SvN2BubkG8DZNEtnWNjsUBsEWd37pgOUGsKctgK+0xdKgnCS3tpLZq2tKQQeHLUCVnaEGPH9onb/+UUnTLUDKb+H2n2cTcl4CEERg9Pr2hVPs1ORV0BY4/sMEvBU9HnjCGmMRA32kWPCBldycuLZHL1Votsc+01SUmvsG80c8R1aJtjePDWA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(346002)(366004)(396003)(136003)(451199021)(2616005)(53546011)(6506007)(26005)(186003)(4744005)(316002)(2906002)(66946007)(4326008)(66476007)(66556008)(5660300002)(6916009)(7416002)(41300700001)(8676002)(8936002)(6486002)(6512007)(54906003)(478600001)(38100700002)(36756003)(31696002)(86362001)(31686004)(66899021)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUd0TzlJckZLMHRIQVdvS2pZc2MxTEgzMW40eUJjNU9TZVo2cVE5RXNxOGZw?=
 =?utf-8?B?c2pXdDhtMHM1RGR5QWtzdW9UczZQc3NUdXRpSHJyVVZiQUZyQmd6S25sOTdo?=
 =?utf-8?B?QVo5bjNzczNmUlVmUkRlTHF3OWNyeVVpMVVJeURLMndMMlJaNmVaNVVaWGV5?=
 =?utf-8?B?bzVUNzhSNm5WWHhGZEQ0U29nazZkMEpGUmhQdmdUKzlVNnFlVnhRQUZDODZR?=
 =?utf-8?B?QVk1RjV1eTE0aVh2cVB3dndkQTBaeG9ZVklNZDl4eHQ2Q08zejlWanFjM3pD?=
 =?utf-8?B?M0tVNVpLbnFGbmUvQ1FyRVFOVUdPalFsaXpSNlRMT21BUWZQemRnVFBQQVVy?=
 =?utf-8?B?U1d4eWFGZlMyTHh3eVFua3phcmdDUjg0VmFBMnNPem1zWDVnKzVKeGtHV2F0?=
 =?utf-8?B?WGQ3akpEWkV0b3ZEd05PdG80RXZLTVcwU1hTS3BMQmttWWxGWTlJSkFGM3Bi?=
 =?utf-8?B?UVVSYkg0Y2QrT2ErY204c0lzbUF6UzlVNVc4MU82V3Zic2ZjUHBEamN0bVNi?=
 =?utf-8?B?U09FMlJWcWxvdnBRa1FESlVEcnJSRzlTbTdZMXcyT3EvTHNxMUQ1eFRReWVm?=
 =?utf-8?B?L3FtUk9oZkFiRmNTeERoUm1ad2tsNWxVV3p1d3lHdWp0VWNoVWFFL3Z2L1ZR?=
 =?utf-8?B?alluOVl2NEtYdmZSTlY2ZGp3WXZyNDNUWnFNVXhUOHhZNC9GaGprUE5pR080?=
 =?utf-8?B?ZCtZaHA5dnZ3UncxYWRsZGlNbnI1VE90YWxqK0dPNmFramtnS20yaHk4RmV5?=
 =?utf-8?B?d01jb2wwTzY3a0JlTTgxTk90amhoWFdVOElDRzhtMDdmTG9QeDBLWGVkRURx?=
 =?utf-8?B?bnUrNkdweTA3UWdRVzA0MWoydlFLYnZiandEbENlUFVBTm5hSEVJUnBCVE5j?=
 =?utf-8?B?a2VoRUU5Z29rcVJ3ZE9jc3NDSE5BeWltbjQ1cTFFdkpCWG9TSzc2clNKMkdE?=
 =?utf-8?B?V3RMR05jKzNydE5rUmpzSkpac0JMN2pHYkZiOW0wVkt4dTVBZWErVlYxU3M3?=
 =?utf-8?B?Qis3djBRcDZtZ0VvRTJyR0ZobDk0WkxTZm13Z1F2RTZPaG5WWTFra091U3NI?=
 =?utf-8?B?K3BybzRacGQrZ1R1V1BLek8xZUtPNHA3Z1F6SFZGb0pzZEdGMWZIN0Y3c0da?=
 =?utf-8?B?d3IwWkpkaW9BUVpGOXhML3ZVMlg2OHQramNJSWpXbURuYUcySGpQVy9Ddlpi?=
 =?utf-8?B?c1NNNElWaTQ4RFAvOU5aZEVTWDFLeGNsWGNoeDNmeG93U0VWaWpXb1FweHFK?=
 =?utf-8?B?U0VSYU50RVh5TVNiZHhxa1pwUWFhSTBjN2xtdnhDQ3FOTkYwL3hGQXFlb1lV?=
 =?utf-8?B?Z0RxVzlSeTBFTUhBZktURFgwTlRrT0M0UzF5V29Od2dRUkYyY243OGlhS1gx?=
 =?utf-8?B?U0w5MVZQWktmWG13NXlRMkxzZXFxeC9XLzF3L1FlOUwxOVZHaUlwekJKOVhS?=
 =?utf-8?B?Uy9RWHBiVmEwSFE2NDZ3S0hoc2tvVlBCSHlaTGpmYkcyTmFxZ2tFdG5iZ3Iy?=
 =?utf-8?B?SWw0Smh4bmQreU52ck9kSlJvTGUyenhrRG1BcDN4U29pRStzdklOUVMzVTNI?=
 =?utf-8?B?b2JiQXc0Tml4YXFoYyswbmVQU0ZjYUVjd3R5elovU0xmMGs2V3dvNlRVSHZ3?=
 =?utf-8?B?ZjZJSkZNYjhMNk9FMnkzanB5UjJaWEdyMnFFRHFMSUt5RVZPM0I1Q2w1YnJK?=
 =?utf-8?B?elRJWVk3RVF6TVJuVzZDOG43elhxdStoUVl4L0VGZ3R0ekxWNVFGUWMrRi81?=
 =?utf-8?B?SjJrQVJHbTZ4R09sem9wLzVpM1VzZTdXVCtXQTlIamVYQlM2Tkk2TWlucG9F?=
 =?utf-8?B?ckxKZzI1U0t5SU02MmNlRGhmMDI2NDlFUXJ1T29uSGlYeStwaUM0T1hOU2Qz?=
 =?utf-8?B?b1FENHd6S1NzSnFrTVhvQWt2cVVoM3IzTWZSNnRnL1g5aUFOc0NGY0hESXJa?=
 =?utf-8?B?UmUxcEZsb0ZiQlpReEtSRFk0VEd2VmdEdThuZWlmM0ZlNThCcVZOMU1OUTJz?=
 =?utf-8?B?QXAwV3lRaERyQ0RKSUJnNWc2M0p3VTg5SHRkc2ExSlpkck80NTRNQjlkVVlE?=
 =?utf-8?B?a2ZrY3d6Q29CSk9YNzNRWDV6K09YNjNXa29MRnFyV1VTTjBWN3RpbWJKSWxu?=
 =?utf-8?Q?kIyCZHIjrFAxauwvV59qLFrAN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f333f81-b4a1-4895-ea92-08db9402e74a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 09:20:39.5325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uL8qXNx1tNHC25H65FU8H9vznNENzjGLkWdPAO6nQiy+D6XFVTRzyTJ5iGhMcTWh/3ImUdG2oKdWdFNrYGOYWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8678

On 02.08.2023 16:38, Nicola Vetrini wrote:
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -4879,6 +4879,7 @@ long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          return subarch_memory_op(cmd, arg);
>      }
>  
> +    ASSERT_UNREACHABLE();
>      return 0;
>  }

I'd prefer to instead switch earlier "return 0" to "break".

> --- a/xen/arch/x86/mm/p2m-pod.c
> +++ b/xen/arch/x86/mm/p2m-pod.c
> @@ -1045,6 +1045,7 @@ p2m_pod_zero_check(struct p2m_domain *p2m, const gfn_t *gfns, unsigned int count
>      }
>  
>      return;
> +    ASSERT_UNREACHABLE();
>  
>  out_unmap:
>      /*

In the description you say "before", but here you add something _after_
"return". What's the deal?

Jan

