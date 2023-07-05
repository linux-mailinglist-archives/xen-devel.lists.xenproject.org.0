Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9C4748640
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 16:25:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559240.874057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH3R8-0005Gi-6Q; Wed, 05 Jul 2023 14:24:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559240.874057; Wed, 05 Jul 2023 14:24:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH3R8-0005Er-3K; Wed, 05 Jul 2023 14:24:54 +0000
Received: by outflank-mailman (input) for mailman id 559240;
 Wed, 05 Jul 2023 14:24:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIgq=CX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qH3R7-0005El-4k
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 14:24:53 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20630.outbound.protection.outlook.com
 [2a01:111:f400:fe12::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b420f75a-1b3f-11ee-b237-6b7b168915f2;
 Wed, 05 Jul 2023 16:24:52 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS4PR04MB9338.eurprd04.prod.outlook.com (2603:10a6:20b:4e6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 14:24:49 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Wed, 5 Jul 2023
 14:24:49 +0000
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
X-Inumbo-ID: b420f75a-1b3f-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J99eCFFdYfNAfb9lgMeJOHlqkJ9gjtodwn3QNiLcIME6/v8mgkYyox82H47If5Q9xrAaDcjRv9BMDffvlsqvotzt+ERwT/iMpw6BBiX7muOaS8V+yiI7XSqTuSACbr/iqaSU25eNV8MrXlIBWkAw6LAcorX+Ykz29TNztcDv3DYyzQPOtIHO+9aaeqkyuHwS1kBrIXTaN60PNIXbCJ1JRZOn4fZrFbpqPGNvX/XzrhM/HFr8pSlIjstguEwYtpVY2QnfR0yS5isHcVL8+3iGt0Jkf/xXgFWlKERHr1F/3AflIdEPHTi4rxlz+I1STD88nyZGfL/1+BMIuJyZiePU/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pHTD7xr08KeyYTp781kIA9UvGB/ybvIaCBq3czqtgSU=;
 b=WnEE4d/QYkhFTGsajT3Y8HoD1T1iiZkQ/HpkH2bUyDp8Jk9LHwZ0QhqJZ+AEZbl9gt/YITp2qKbbMvnYyZ6FI6tzI6rk27kDfaDtzr8J3SrdrRpJ8BlNibXsLC+g+NGq/gM7Q0KBvItpWhI6nIbP/62gR1PoMUmwHyaB6TyhE4XutZTNGOBJxTCGcXOXS7RFCF2sp5L9OoeQ5fn+XLH1weWW3QY3S3/Bho+/nMKNt26HTnZ1oG/GyZQtAyOgEz5h1ctXa5ircL+Uk8WltvUEy4n6i0AxFbjE1TUjUZETeDzw8bndZOO7UJNI1lEZ8wVSvIiTFfwfIRM3MCinbKbe1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pHTD7xr08KeyYTp781kIA9UvGB/ybvIaCBq3czqtgSU=;
 b=WhojixWDw3+DkbDQRWo6sxzRKnycrj+lfXmTxEJqHmvTLaGAAzGym/yLBVjnCjlWHmWknpC2zUdLbrSNsuKK3yXefUE9LJjoAfeWoSb3XxvBIgAllI/BaOqsVFKbGK3IPYwIDHTlsuBGlnjxkYaaWFUJMtIURh6uXC9g8u4Frgs0O4V3vr884i/x2asI7cCBJmzQP4XI2dPUh1RWeIvJQ0ArJQ9hVi9D/ueCQRRxn8mASxl8UBH7ZCAN5vafWmcEBTZwD4zomcQwMkJ1KDN6dCzKigkXaP2jvBbaE6NlxcfFk8l92mdEz1nFG5aOfykX8WluGRj0/CcbL4yMROfjjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <33af8ca2-dc65-0167-5569-c35744ea4f0d@suse.com>
Date: Wed, 5 Jul 2023 16:24:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 2/4] x86/microcode: Ignore microcode loading interface
 for revision = -1
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
References: <20230629152656.12655-1-alejandro.vallejo@cloud.com>
 <20230629152656.12655-3-alejandro.vallejo@cloud.com>
 <d498ba69-564d-8232-5f5b-da52050772d8@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d498ba69-564d-8232-5f5b-da52050772d8@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS4PR04MB9338:EE_
X-MS-Office365-Filtering-Correlation-Id: ffabd376-ee5c-46d6-fae3-08db7d6396fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xn61blvcv8F2uv6mq0i0OS0IpkRbwSOC33XzNs1Lq914Zkk2rD6LWu6Xop5KDA3ihzz/vZxzbKsf1YV/J5Kkhk7EyDsVBj3vCkGdOMeGddd9BMlq7QLnHUvjtF1vsH+NTZY03rCLMjTFEql03fBFyuhR6xoCAsXC7pOOoGEE9iggIhC3VYnQnzeXgPqMKLzPzFDxQtlc2wVlSAkiHORzgDTQv3byX8bDCODUr5TqKDuKuUHWtgxeJvQjxyQvEFT26x0tNSoGghoFYiQLUCYr8wuktKuU4f19wkj8kChML2fRsaQQeVgaa1q6mBsT1tz3kGRZSD8RkfZ+Gutp855sxUHWnGwfvHPTS1vdo9HZUuLJ1u6GaHBgph9Pm7T84SprT3YB3ZwTQwicdKkSc+WWeK3EbHWfeaOEwMOxD0PFU65SsS0DJSI3GhbBzZCz01xStP3qd4pAF2AHXLhNvB2lXiLGeaQm9TJbX34MkEnwH3YPuILWKgevC78+SSPel08LIyZ5aIYq55pYV0T5ZIs5P7frrc8Hpks7Xsjb9MSEOGHt0tO0p7D5fwBHZXksutlcXvTBRD5aoR+FJsdZolJmQ1ESXtBReeyUXUSb72m6RFFeVjEVh9hR7J7HycX00PZk+0DokIXBUr2zKBu146FBoQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(376002)(396003)(366004)(39860400002)(451199021)(5660300002)(186003)(31686004)(6506007)(2616005)(2906002)(8936002)(8676002)(26005)(53546011)(41300700001)(6486002)(6916009)(4326008)(83380400001)(66556008)(36756003)(66946007)(316002)(66476007)(54906003)(478600001)(6512007)(38100700002)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGtxWUJVU3ZkRkJHMnUyM0V6clpDY2IrR3A2NXA0R1pFWTVGSWtUTFNDRWVR?=
 =?utf-8?B?aFB4a21SK3JVblVUcFVKRGZDMmxKaTNiL0ovRjM4NTdodURwMWtzQ1lnNkRE?=
 =?utf-8?B?akY2ZDFSb1JVTkxobXRSZkdhVDhuYTJqc3BlN3ZJYU8weFdrS1d1N2RodlNs?=
 =?utf-8?B?aVRkK2piZFF0cTNDaUNoYVE5NXYrTnZmTFVaemRod3pDajdEY2NoWHByeDZs?=
 =?utf-8?B?Q0RjKzVqS0t3RTBNTWlWY2lGaTlFMDQ4NUVQZjdKQ01VUmVSOVpobzdNMGNp?=
 =?utf-8?B?QzY5V3FMeGZKMGZGK015V1ViYmxKS0NOWS9CeGJ6Q24xbUlSQTVlS1F6allU?=
 =?utf-8?B?aE5QQkp1UHpRczFCT0pPcTFCWHkrUVBkTThFMW4vc0pPaE5UbDcvREpKT1B0?=
 =?utf-8?B?QTVQMitvbTRjL1Y3Mk5RN0ZYbUJacC9wbVRQTGlraWV1T3NjeDNPM0NnN2FJ?=
 =?utf-8?B?Wlg3NnZ3TExuWVhXWVYxcmFBWTN0T0FwWEU5SzJkcUdqNC9sM1J3NFdCTzVz?=
 =?utf-8?B?TkRscmU2VG9wVVIxWVhxUWRoRDNxWWR6SSsrQmFQTlF4ZW1FeW0vSzNQS3pj?=
 =?utf-8?B?cTdlcmt1UTdvdTFqT2g1cUJTZjh3eE83V3BsL0UwbXFyUzVhSjBnaENZMDZ6?=
 =?utf-8?B?U0VYZVlwRnpidWdNcjdFS3NmYjRHOHVBSHBEOTZ0OHRQSk5yU0R0WTIxWUgr?=
 =?utf-8?B?YVRxbTRzQk5SSmRrYnFvVzc2WGM1R3RxVWtqWGRieWplZTlPbm5GeENJOHZE?=
 =?utf-8?B?RHFKek10MmF1WmtTaW9PY0NZZGJ0T2V3K2EwRHp4clFVMjZpQXpOdGI1Ukpy?=
 =?utf-8?B?WTBIMHJVSFAwaUdnUlRJNTFSb3R3QXlNTWhDbXlyczdndWM3bE5zVXBTcXJE?=
 =?utf-8?B?N0o2RkF4K1lhakx5dnR0V0dwb3lQQW4zSWthNm9VWXprNTRnT2pHcGRIazVm?=
 =?utf-8?B?V0ZGOUIzbUkwcGphUEZKbWVDVTVUUTkzWS9OSG8vU09zMzM0Q3RJTXFBU2t1?=
 =?utf-8?B?QXVXVkI2cEZ3UVhhL0RaVmFJUk9qUmlqNVdUSmFHcm9XOXBoMy9nY1dwM05U?=
 =?utf-8?B?WXBXWDc5NUN4Ukx0RjJlNWpuMm9NbmtSeW9HNGtiSTJkaHRHYkZ5NHNvZUJX?=
 =?utf-8?B?b3YyblpXZkVlSDEyeWszcFYrRDJpd1ZMSVBNQUpNN3dCVnR3TGd0WHFHV1pU?=
 =?utf-8?B?QUNQSWlvSWg4ZFFsWERUaS8zYjFIc3BubHU1Zit2TE5BUVdYT2ZVdXdSVjBK?=
 =?utf-8?B?WnlscC9Sa09pdm1sZGNhanNxQWVBaHRMdmlwZnFxVVlySHhhMG12UEhIOVZ2?=
 =?utf-8?B?UlVtenVFd2xlY2pSZFJFVlROdkgxa1doQ2V3MXd4NUtuNWZ4RTNoY1ZHTEFI?=
 =?utf-8?B?ODJsTExoYS9XMG5BSXZweFI4K1VCV29kSWNldlp5Y0J4RkE3Zk1PZ2R5RWh1?=
 =?utf-8?B?M2dRdHh1Z2FNbzEvUHF6TG1mZFd4dGZ1Yk1JL1V1OHBveFhVU1NuNkVsN1pF?=
 =?utf-8?B?SUpRVnVqRDNTcGYzMDVMUWhzQW14MmgxWEg3NEljeEl2SjlVZzFNWjY1bGtv?=
 =?utf-8?B?NmlQZnh1NXBFVzFONlRRNG1SRjNmTmVlVHk4TWRnQWdCUmNHU2Fid3E3eldv?=
 =?utf-8?B?SE9XbDZ6dnF1eGRxWGJ6T0NuczlkMlRtSXBndGJBOGprcVRQM0xlUlpIREd1?=
 =?utf-8?B?T0paRFdzNFVVUVlGWkFiWVZZQ1pMUVZmWVZCSXdmZzh5aXcrSWNFSTBCTUVx?=
 =?utf-8?B?MnNXS3NpU21ZZjJzYytaT2xxQlk2Z0tPREwwUEY1Qm5XVkJWd1psOEVHOFRF?=
 =?utf-8?B?SGMwV0NtTzNMNHoxM0JSazh1N1hCMzdzUkRZY1RHeTZCK3hjTmhwY3VYUjZm?=
 =?utf-8?B?N0pUVE1WampycUpSazV6UGlMRzNEeGVvT3M2Ull1MDJmTjF4UUx5dW9WeFNG?=
 =?utf-8?B?blZCclpwSEZHWDQ5Nld0MmtUUzZBa3U4R2ZwL1ZUODNtVHlIMlIrTmNiTWNF?=
 =?utf-8?B?YVprR3NsdS8reDN1NU1idjVscFo2UTViZVhIcm9adVpNcm4xY0RXeWRxenZm?=
 =?utf-8?B?QWRHWDV5KzBCUDcyQldUYmpWV0lLU1BORnF2eElJdzN3bHhOR0tHSXRsU2ZK?=
 =?utf-8?Q?8vWbJDYo3W4qUmht5AVpZJGwV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffabd376-ee5c-46d6-fae3-08db7d6396fb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 14:24:49.2531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: deI3xUZOhMiVGz40oh/w2RbSimcUUOuVESyClnFQwrJpGzv/xiLYNcV87WB71ZFayQXtGGOCH611sKzCd9pOeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9338

On 05.07.2023 16:13, Andrew Cooper wrote:
> On 29/06/2023 4:26 pm, Alejandro Vallejo wrote:
>> diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
>> index bec8b55db2..b620e3bfa6 100644
>> --- a/xen/arch/x86/cpu/microcode/core.c
>> +++ b/xen/arch/x86/cpu/microcode/core.c
>> @@ -867,10 +867,22 @@ int __init early_microcode_init(unsigned long *module_map,
>>          return -ENODEV;
>>      }
>>  
>> -    microcode_grab_module(module_map, mbi);
>> -
>>      ucode_ops.collect_cpu_info();
>>  
>> +    /*
>> +     * Some hypervisors deliberately report a microcode revision of -1 to
>> +     * mean that they will not accept microcode updates. We take the hint
>> +     * and ignore the microcode interface in that case.
>> +     */
>> +    if ( this_cpu(cpu_sig).rev == ~0 )
>> +    {
>> +        printk(XENLOG_WARNING "Microcode loading disabled\n");
> 
> XENLOG_INFO "Found microcode revision ~0;  Disabling loading because of
> virt\n"
> 
> It's normal (and not a warning) when running under other hypervisors,

Except that INFO won't be visible by default in release configurations.

Jan

> and just "loading disabled" is too little information.
> 
> Happy to fix on commit.  Everything else looks ok.
> 
> ~Andrew


