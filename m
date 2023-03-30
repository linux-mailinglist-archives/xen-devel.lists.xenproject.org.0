Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E41C6CFFD0
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 11:30:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516548.800835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phobu-0000xX-2y; Thu, 30 Mar 2023 09:30:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516548.800835; Thu, 30 Mar 2023 09:30:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phobu-0000vE-0E; Thu, 30 Mar 2023 09:30:22 +0000
Received: by outflank-mailman (input) for mailman id 516548;
 Thu, 30 Mar 2023 09:30:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKpO=7W=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phobs-0000v8-IY
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 09:30:20 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c09f2d1-cedd-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 11:30:19 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9306.eurprd04.prod.outlook.com (2603:10a6:10:36e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.21; Thu, 30 Mar
 2023 09:30:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 09:30:17 +0000
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
X-Inumbo-ID: 7c09f2d1-cedd-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M6Yx2mbnZJ1qoVf0jXDj+cscP3KiG8MXpXjwbBiIpSazoSqe2IpIZ6M7aXZdr3/4kPhT95qBOT6ZjlWjJtXtyVhJWjPTaRYoubCG3Qa8cIsVpv6ID6a/KSW8js/COerD+m0dLdLo48gZPUlq4d7bjv5FhH5ZPfUU1XvfQsVEmwMrH6bD8gJ87iFL3VDTr58pLZPuWyBYS1i1iYiqlYddOELBYQ3kXqdOEtHfTtv28wV2Kn/DmmwK2RinjKgerNiU8ayQ/g63UFpAYwBxckBNaRRgfvCc9AVFxzIo4/xbkqVvVtTDzFhKT5cdnNp6we4JS9Hk0NAKIyzpTbKDT2uRHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gNph5fBJ+JkcR9+lNUareAFqobusNg8mSVniHzK5MxA=;
 b=l1znfhALMoLU+TQ8Flv0lGj4p5UEL8yeAHu1jhrLyBWboWyDsht5XltkwpkFrFVkuznbBLGGWtNWAiACE6eQFKASqRci0Gbk2PL6vgoZt8rfKFhZwB7GSl/tg1uiVLdl/s83Hd8+UDcjtMPLY2QTRkA1r3lfGWBhR1/l6Z3p/APL0ldWH8+CaL3Bh4yHLjlZGavRp8W8idivl/kbAji2iZ9ELlX+Ps8eQkoG3FbKBu9FFR+KYA4/umv9CqKWqgexSJrNU35a+zlLzuJ/TrIoZVvrbPEN+c+DSYcivGaTq8ebhnpJYLvT24NhOHLwFHo5LHX/KWwD5Ga2SxoKbutvhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gNph5fBJ+JkcR9+lNUareAFqobusNg8mSVniHzK5MxA=;
 b=Q30ni2JjenG97QZoB90auKE1ZBb/1Hu6Bq9niFOVINvFEuybg3VxuoRxOAZHEwegUUJjp52NLPhAoQMpGs5sAd/hYqX+afihJSpmFf7o8+zdCeq6UVfprgTpxxsWUgGBGYrlwJeCKSem/RJavp7f+4sSLKa2uz4fvuN1zhFRWt+fknbAWSMjR0gANHElMCJM5Ubn3DHY9UUJIr92/7Y0IZHP0TMKj5N2mlWUGK4Iy4YM7MY2IqGTUaWsu9c+BstSgcow3sMLUsVa/+glSVy3awud7eyIZnr+ipbE8uO3UXn8cRg3CofPNSEYE11uBWpH4NWWRgrdjCfmBb6aZOPVjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <885610de-aea4-6aec-af73-28ee9147fb65@suse.com>
Date: Thu, 30 Mar 2023 11:30:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 4/9] x86: Merge struct msr_policy into struct cpu_policy
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230329205137.323253-1-andrew.cooper3@citrix.com>
 <20230329205137.323253-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230329205137.323253-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0259.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9306:EE_
X-MS-Office365-Filtering-Correlation-Id: 7565c6a9-afae-4924-8c4c-08db31015f43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OuKdbVecJQP1JmiaEKURnbk5JawNUb7zCYWbNsGXVUtQOz7ixV9lDmDqxJEr2ck4mY8Qxn2ipRucmxST8bWxi+zQqvojmGuqRO52Z0KrENYrcapUHZnx2YXt++pfX/tSnU01r1VQ7ahg4IwQK1HnQEnKyuhtA0ucgbp/SWEMFNFgpXuPJPEnAi227nwndc2kcsXcNq/YU/vhRH2MdeIdDErqqsbYpuQ1QZ6S4YH1pOIe26iE/3CnQ6Ok771AvsB8q91Aw8nG4y3tT57pd3pphw0PFSqBYF2UotRBOT21OIiwSVeKDo09PY19S+2u4kD7JU4hZvnTbPMwkQN4tEjUhlBGY2CbW24kRJc59ZU2qnJjjXZuBm3f2Xrh24Aeke/adUdV91qy8+VuPKT0zvi4Mt57kb7YtL31s8zLhGi+fWtnIDjDV27B7nKAff2o+ZWqPdX4RaiQRqMkxMMj/ppcRZFqAxRefeTEAMwn7EWqdiLlzPWhQCR3J/WMcgKqLcle5XReATHIwvhd8nDaEIKZ6sCA2NqY2eksm7qKM9T04VwFy3fSxLY05vPVrbI9Z0OOmePE8S1xafPHZfENaLGndXalG54OhEkFyKfTvgmooSP5Z0MoJdpQmtO0eMtYhc6yX5KuH5CR14PKdwWK75Z1FfV0phEYtnA0+eKbRKmrb2syIu/6aUWWbq+obOvOhEGF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(396003)(136003)(366004)(39860400002)(451199021)(6916009)(66946007)(66476007)(4326008)(54906003)(66556008)(5660300002)(316002)(38100700002)(8676002)(8936002)(41300700001)(186003)(83380400001)(6486002)(53546011)(6506007)(6512007)(2616005)(478600001)(26005)(86362001)(31696002)(2906002)(36756003)(31686004)(43740500002)(45980500001)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y05tWDVuZ0dSNGNqcmlpbzRQa3poU3JuTDhDQjNCcVNNQ3QvdTcwRmROdXVR?=
 =?utf-8?B?UW94SDFKbUJBYk5majYvYTJWSTE2MHBiNU5sTjFwOUxUTUYyNkhXMTgvTTMy?=
 =?utf-8?B?bHh5MnhDMUpidGhFZUM5amZOOXlJOTR6Zm9kZ1M4L3hKTHRsRVZxR0dkS25p?=
 =?utf-8?B?ckdiQUpvMDhQSzUvRzBzaldJeE55UHh2UUI5MHZHUnBSYWZoa2ZmaE0vS1Y5?=
 =?utf-8?B?c3pwQURHMjFZbGJFbEcxOTcxR0lKdWxpblZMdnZRSkFzSzc2TFJDcWQ0RkZN?=
 =?utf-8?B?OUtxczJJQlNmK3E5cUlGMFN6dlpVbnBMVU5tSkMzaVpiQThWU2NoK1dzcGVI?=
 =?utf-8?B?SXNBUFNBZWh3cGF2Ny8zVFdPejVpNVU3aGdXdGVrdWhFSEFXM1JEa0JFR3di?=
 =?utf-8?B?amVidGluenV5TnJTN2dsRW5jbFhCUWR1SXJ0Y0dZUlB2Ykx2SGhaR1gvOWlL?=
 =?utf-8?B?cllGTXByNFEyOVMyaTZLdUJpZ3Y1V1pyN2M0WHRveWVJd0VrSFZOQ1NXSmhk?=
 =?utf-8?B?b21uUzI3NU1GMXFJOHJJVlVCR2hxd29nRzRlaDZJblV3cDQvN0tjd1lYK2M1?=
 =?utf-8?B?anB0THRHa0RlMzJQNFkzUGVUa1pQUGd5bVYvR0NjaTkzamJERU9yZnZ5c1FY?=
 =?utf-8?B?SzFFRmV2L2pqNTRrNkdOQzNlZUtLYzAyZkkrT0pZNWRHRWh0SkFwYURJbEI5?=
 =?utf-8?B?TGFKRE9zVVZBeWF2NUI3dzhXMWZCTE5UNXEyeUE2M2VEVTZ4S2JHR1NvcEs5?=
 =?utf-8?B?K0lRb0FEZFFubE1abm5qOWxyZ2ZoOTVOS3pvc3YrM3QwV0RwZWVYV1RndTYz?=
 =?utf-8?B?Wjc4UnJuODAzMnZEZld6c094OVYya0UzT2tyT2FuMmpvS0RKaHQ3ZFpnbEtr?=
 =?utf-8?B?MUtTcDhoU3RaRThITFRjbU1hZ09nL0lpOU12cE9OTVc4Q20yc2U1RTdDRWs5?=
 =?utf-8?B?a2s1cWt5WTBKVXd3L3o4aHRuWW53YmVpWk9CWEFxMEU3VnBOL0lmaFJqcjcz?=
 =?utf-8?B?RDM0ZHJwQjl6QURaTWVsY29oTFc5OWNScDJZdFFNMUV4TDFScThkYVlqRmtU?=
 =?utf-8?B?SXJxZXhWaFJFRXB3M1FHaVk3OE9xN0hwTVgvdFJ0eitHOXlRaituMDZ1M283?=
 =?utf-8?B?QVRYb0dNUkIrK2xIUllRV2k0dHNOZXBleVJhbkhtS2FNMzRzb2gvWDdmaGtI?=
 =?utf-8?B?NVRXVGh0dmVWdjYzVVNWVDA1ZENVSGc5bzdraGdYd1hTRXdPa2x1N1AvYnNl?=
 =?utf-8?B?OUsyT1N1UkoyRFBGSEVwODFNVnEzSjErTm9FOCtuVEI2N0hmUktxdWRpY0lS?=
 =?utf-8?B?UXFxSGhOTDd4OXZjSGlaSEZUdGo0aXZvckJpQTMrYkVaRWQ2MXBBYm1ZT3V4?=
 =?utf-8?B?Um5PNWw0b21mTmU1dm82amNmNEg1cDlMci91aVFxZWlvc2pMYVJHWDZtYVN0?=
 =?utf-8?B?cW1kOTVSUEliZHRRV1BWMENIcmQ3VXdVVWJvT1ZUNFd1M1NnQi94N3YzbXZi?=
 =?utf-8?B?RGNXcWpaOXpNMW5jRXlTcmVCckR0UU9LSHZTNkdKeEJNdk1YWFN5bnlYTTRq?=
 =?utf-8?B?VW5oWWZENDdINmhUMVBjK2VWY2c3cGlXYThRcUVZRFZicmNIWEsxWHMwNUxk?=
 =?utf-8?B?OUJkTmdIUmpQc2ZLYnhzVzAvSTV2Lzh1RG1HZ0I0T3ozSmxnbUhDQURXT2pC?=
 =?utf-8?B?YVllaUMwVFZPR0VFYjlscWhtSDJNUnhtd1djY1AwYUh6YzQ1R29HbzJnbkxC?=
 =?utf-8?B?MGp4akFvYlBRTHpwZWJiQkFRTE5ub0NsRk13ZldtU0JoNDQ2Mm5JdnlJTmNs?=
 =?utf-8?B?VWsvNnJjU2prUERhbW1CRytuVFVEZGU5b280aVZISEt1dlJtNUVMZ1RBTWVJ?=
 =?utf-8?B?cDBIN3dtNkZoVHY3cm9GU0tNcmNibGNSZ09kbG96Ly9MZjhCZ3gzN1M3Sm5s?=
 =?utf-8?B?VGZEUGtJaGhXT0p5ZVdiVWM4eDBUUHJPZUZscjEwQWJRYkhXdU9DMlZTa2ti?=
 =?utf-8?B?Myt1S0hRQVU1Zk1xNDd0THF4K3lXaVB6M1FUem4zMzZTcTVrZm9LOTZVUkJy?=
 =?utf-8?B?MFZPU2EwRC9YNVB3TlN6NFoyVjlaWkdpRXRZdG9vOHZrSlhVNk5xakpVOVRU?=
 =?utf-8?Q?U0uGWaiHPD/OKTlkk08HYaWxn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7565c6a9-afae-4924-8c4c-08db31015f43
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 09:30:16.8193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P5NUhwytGHkbNJNl2otEL8NpFGE/Cq0zqZwhDQJ4Slzw5DM/cqnmAkl+7bY/myLn4IPlrFFN1UJYI31h9cst0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9306

On 29.03.2023 22:51, Andrew Cooper wrote:
> --- a/xen/include/xen/lib/x86/cpu-policy.h
> +++ b/xen/include/xen/lib/x86/cpu-policy.h
> @@ -3,7 +3,6 @@
>  #define XEN_LIB_X86_POLICIES_H
>  
>  #include <xen/lib/x86/cpuid-autogen.h>
> -#include <xen/lib/x86/msr.h>
>  
>  #define FEATURESET_1d     0 /* 0x00000001.edx      */
>  #define FEATURESET_1c     1 /* 0x00000001.ecx      */
> @@ -107,6 +106,9 @@ const char *x86_cpuid_vendor_to_str(unsigned int vendor);
>       CPUID_GUEST_NR_XSTATE - !!CPUID_GUEST_NR_XSTATE +  \
>       CPUID_GUEST_NR_EXTD + 2 /* hv_limit and hv2_limit */ )
>  
> +/* Maximum number of MSRs written when serialising msr_policy. */
> +#define MSR_MAX_SERIALISED_ENTRIES 2

The comment better wouldn't refer to msr_policy anymore, I think. I also
wonder whether the comment wouldn't better move ...

> @@ -324,6 +326,44 @@ struct cpu_policy
>          };
>      } extd;
>  
> +    /*
> +     * 0x000000ce - MSR_INTEL_PLATFORM_INFO

... e.g. above here, to increase the chance of it being spotted that
it needs updating if another MSR is added here.

Jan

