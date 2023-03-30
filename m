Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A482F6D02C2
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 13:15:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516610.801006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phqFc-0003UQ-W2; Thu, 30 Mar 2023 11:15:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516610.801006; Thu, 30 Mar 2023 11:15:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phqFc-0003Rp-St; Thu, 30 Mar 2023 11:15:28 +0000
Received: by outflank-mailman (input) for mailman id 516610;
 Thu, 30 Mar 2023 11:15:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKpO=7W=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phqFb-0003Rd-9a
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 11:15:27 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20628.outbound.protection.outlook.com
 [2a01:111:f400:7d00::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bbd15cc-ceec-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 13:15:26 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9867.eurprd04.prod.outlook.com (2603:10a6:10:4c0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22; Thu, 30 Mar
 2023 11:15:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 11:15:24 +0000
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
X-Inumbo-ID: 2bbd15cc-ceec-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L3s+f/aXBNajv/bHTzE7npn8+EQIGx+SGWnLWB14imVPatVhyLP3P3NYqiitxrbogdGemavSnSYLpFd2/pj9v0TeEWEBVOhVbH4duuAKUnkHb5npRnjWiqrmNk8ZY7RH0ePZgEFwwnsiAEnFnMHMqU9COaqDjSAg/GhtgFVSoJgYUYSBcLF0gk0dKeryXGL1jjC2csjKSpkHSkmiV1WSmxVMbzjiMcWqCzg0r7awXQwpE3Pl5RuXeYfj+p+RjG6DeGg2Yq1s1yrzXaA/5TvmZ1NZnxzT7OaUWTYtbgBDwwhoEtuec4NOE9Y5bwtpq2pIKYF+WeeBe13k9UEdt/2lcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVacTh1tgBBQFKPNc8Ong3WaUVzSlbPo+5vRH0B1E6M=;
 b=F7noyuWesR+U6forgICvMMrFKI84tD2iSy+HqnODvP3WGHut5K8tJTAgeKqn/6BwxqrYqQsgXQj5BuK5NVAHuWbpPFfpcSE1aQBy+hW0+717cp08e+gOZvm6Yh7GrgCkOW/9qbqP5IiO3q5lszRY+ax3VrslpFvMjt7h4YsDxVqIdGF+21Ck50qGzmC+fYYheV3r7na37bFXL4y+foP5dUlsFRIDy3SjiDAo6FRlyC/v38hAc5rfGyyEDbnOPIErFHWvGxRzkqrr+pfLP1UHubd7wvnF6d5WmJWf097zeX7Dr1E5Ysd/SQO6xYqPe1qJ0aaf48gd6a4REbO4x5xsYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GVacTh1tgBBQFKPNc8Ong3WaUVzSlbPo+5vRH0B1E6M=;
 b=2B5o/ot3edXR2b6t3DusOKkxb+bRJ/qkXAIOmtP3zttbfsDR6PHGATHXwZDMQhqNF6YfCXqB5IKWI1glj/pFZR2eGeMBGwLGsHHnueEopeWMiWsPjxDag/BR3rkvG/S0ANDwfdOn2xlrz2/hb5OrwjPyqwJQYJMrXTMjiVbb7ODpwAEVLZVYdBMdCAwZZLn8eGRiLuv+pb9sAn6Hf7yWkmu7Dh6gDY0XTXr/ot8XI6BE0eHOQtUgxd1s+Qa6Qmrt+n4LAks4tc2wegVI8ZNhndGyashNP15QF2/jAcsJ3SHYH5CSSIloHeY/WvAza6eIIi0JjAFe+AYDYPxF7TDfqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6354e5c4-f438-0ae0-0153-3bd1001b6198@suse.com>
Date: Thu, 30 Mar 2023 13:15:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 4/9] x86: Merge struct msr_policy into struct cpu_policy
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230329205137.323253-1-andrew.cooper3@citrix.com>
 <20230329205137.323253-5-andrew.cooper3@citrix.com>
 <885610de-aea4-6aec-af73-28ee9147fb65@suse.com>
 <bacda91d-a371-ae30-5ea8-19a452e54381@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <bacda91d-a371-ae30-5ea8-19a452e54381@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9867:EE_
X-MS-Office365-Filtering-Correlation-Id: c49a03d3-88ff-4882-d56e-08db31100ee2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rFjWm4YNG9UMEKqpFiMPJUdUMpmHIKrVIo/f0nZNdUi0Yzfrqy1KURp0BOeJODJUqLfkxL8T7SFSdGo7OPEzZkBk8hyaCaoZeGFXqe9uqf1FGbN6g+B4zr2Z7Ne0eMq+RkQF80Ndal8AzR119N0BbbvY5gOXcOCLFbFVBvpGoTGIDlw34b/ORqZOUqrNjzUuFvBztYy4XDtFPhnoQvVSPI7Eds5jwU2gJlU4CK29Gxqljeshgui30jDYkZ6odIHGe1iUG4m9xpWaAHSMOD0SZyTcuRPflljshUsjkuiHVBQlk+ksHJ0lRgZFedrZFAbqvxd7H9LmnyMH8ZCu1SAHiSy7//q+uO+xOc2O9+gPRViSw1V4ycULKVuoNfBRUPJvUc3Ih4VN7mj8Id7JzoIxXku77Wdv5uNCBd9G1p2V/81M1zYYxFsYx/vmzbouhXe083tAZwxDJ3cJrWRMEOWTfv3zpehSsQ0tjfILJggFi0fuPT/8Nb5Un+8zvN6KmIS6mAZTWYsprA46hrO3OmBthVlTdembJ7vHtGC+jgLO8q4mkv0mg0Ep5HaEkrmogaX2uzi86TEdam4zqxyXechOCznikPU28mL5rYH3o22v+iMmt+Mrdj8H0KZVt400aWUyVYg3PGAIlTp7VeYGSUU3idofTDA+W/Bp1Od3Hf4WpjT92q9tbB8XJLsN8Wjxd436
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(346002)(366004)(136003)(396003)(451199021)(54906003)(478600001)(83380400001)(31686004)(2616005)(6486002)(6506007)(6512007)(66946007)(316002)(66476007)(66556008)(6916009)(8676002)(4326008)(53546011)(26005)(186003)(5660300002)(41300700001)(38100700002)(8936002)(2906002)(86362001)(31696002)(36756003)(43740500002)(45980500001)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2RkaE1QNm04NUliallrTk1lWTdwQTV0a0ZwS1JYSnp3REM2YVRwWWNEWHkz?=
 =?utf-8?B?T0YrV3pWYXRvek1GNnNzWnVzaEE4VjZqb1hrdGxESTFNYWVqWDNMWmNka2Rz?=
 =?utf-8?B?bkE5ZENmbmkrYWlIbUdmNHdodDE1RkpMZ0pBQlZrZlZBYmVNOFRMVUwyelpi?=
 =?utf-8?B?RVlIWFpxVDBTRUpOOVJqbm0zN0cvOFpDTEROaGltQnFKeS9FSEtvcFpZemNN?=
 =?utf-8?B?Lytzb1pqazB5MDRHMmlTRmhoV29ZMVFiRFR4Rzc2OE9ucitGRVpya0RMc1NX?=
 =?utf-8?B?OE53TmtUMUNwSmlzbXg5VVd1eTlQMVNhM2dUbjVHbjk4L2RGdWNYalpQYS9L?=
 =?utf-8?B?dUgvN1VxTXNXNWQzajQ0Q0lkcmJzQWxXRUx4RVcySG9YMXQyOVIrL015bUZY?=
 =?utf-8?B?bFFrTzF3eGFGaWloUkhRNm42OU5MRjRYTHJNUXBodW1UVkdkMzJmeVYrTW1F?=
 =?utf-8?B?YVoyVHBRNHU2cVgvY0NPbGt2QnpYMDQ5eXNkQU93NTVBYnpxemF0dWd6YmRs?=
 =?utf-8?B?Sk9IeHMxVHV2QXBISU42M21MOXpoSVQzclZWRFhiTFBYMmREZEY2bVB5elVM?=
 =?utf-8?B?VFhrMnFWcXcyQnlBTXMySmdHdzlHT0plT0JyQ0xjWHYxV3VtZXFmNFBBNVRx?=
 =?utf-8?B?MGcvdHJrVTluRm5qZEdmdkNTcDRYMGl4VDRMblNycHN4UDBwdXhHYkM4dDJG?=
 =?utf-8?B?RGx3czRqb3NvanhwZE5qMW5nbGpVa0ZhUkF3NHB0UmpRRjFyaGwrZTFjUEFl?=
 =?utf-8?B?NSthOENBUmJObm43a3piNFp6SCtrVklvTFc2Zm94MDlDTTFZLzJveFlVcyt4?=
 =?utf-8?B?R3hlQjNwSGViam9reDVLU1JscUNpY2RUTlFhY0h4Rlg2M29XZ2wxRzFwdEpq?=
 =?utf-8?B?QXB6VEducmFFVWk3SE9MR01xZWdtQWd2YXVmTDdvRmF0WTJ4ZUdCUWdKZVU4?=
 =?utf-8?B?WUV5a3dNMFhneGVpRFc5dTVEZDB1bDVrRHhUMmprNE5MTUJiemFNbDMyelV1?=
 =?utf-8?B?N1IyVzFEOVhwY1ZiVmwzVFdIUHJweXkvdHNwci9TREk3Vi9CQnMyQ29EZjly?=
 =?utf-8?B?d0Fqd3RrbjZrYldWSTd6VEpLM0JXQ2VtN1YrZHVQNndDUjV1TUp5OE1vZVN5?=
 =?utf-8?B?dXNtaDB6UWhXY2VGOHRsZmVSRzh4VUFOSEU5QXB3cnI4WVpQN0tVblJWU3Nm?=
 =?utf-8?B?cFkyRXZrWVVLRG1ZWVlTTGE0clVZV200ZU5jTUZyRVk3QjVSSUVidngzaG9F?=
 =?utf-8?B?N2E2Z2UzQ2JqN0RXTDJXdDRVY0hNSUhrYmhyWldUbVh6S3FaTDYrZDlDTmdW?=
 =?utf-8?B?Y2ZhUlBZMEdlYi9NQ3FIUDg2WGFtY1lVWnUyQ3JLUW5jaitlRERudWhLTnN5?=
 =?utf-8?B?RjVlREI3SFhFNnZGWllpZXJWaGRWNVNPSnN3MjIxcEFTRElxVDZHdHJxOVZQ?=
 =?utf-8?B?eUVqaEdHVXpyaHVBanB0THB4dVllQUFoRWo5RTR1YUNtMWlpYzUrZTkybXFv?=
 =?utf-8?B?UCtwYkNMRW9TdnhXLzh4NU1KZkZQdXMrbEFBWkR1eWh3MG1KdW9aaVhsYkJ2?=
 =?utf-8?B?bDZTNEYwL2p6TnhSdFBuN1pSQ0JHSDVlR0ROOTBaWjRlNDRFVnRqUWUyM3Nr?=
 =?utf-8?B?akx2c0RDQ0lwS1dtcTc5VEJkL2lSWWpoOSt3c1lSRkdQSmVFRlBuU1Irc3ZI?=
 =?utf-8?B?ZjVyTDNyVFAydTZSZTBkQ2J0aG1IYmcvWVdramhEN1hhaTA0RGtKQkpSOTMv?=
 =?utf-8?B?d2JqTXBzcXRnMFVIZlpYRWxBN0g0cXE2bmExSSt4TVMzU01tNHpmeU1pL043?=
 =?utf-8?B?M1pMV3JpNmhPVEpndzRwVTl5MEJEU0lwL29UUm5HdUROZGltR1NvcEZYY3NX?=
 =?utf-8?B?akUrT0JtVE4rOVNOQVZLWWl1dGw3WklGM0x6TzU2Vkh1WmdrOXU1YWMwSm9l?=
 =?utf-8?B?cUV3VCsrRUNMMjUwNFY0VmdXZzRmWldFOE9HZWVQWWpBeGJ4WFBPOFRWOXBi?=
 =?utf-8?B?NVJkbDVKNHI2YVA1YnhwVThUTDNRRndZWUdBSWdQVlVpV09Sc3JqcGozZktv?=
 =?utf-8?B?RzRBVG43UWJhNm5zS2JzdldmSVdkejlnL0NLQlUzeTNaUWVySE83YUdIM1Bz?=
 =?utf-8?Q?hFSD7cM84pnkSbivSV0wf22rJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c49a03d3-88ff-4882-d56e-08db31100ee2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 11:15:24.3541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KS/s+fBOWqxHOQ09SnzFB/hTxwecMeKX5mzZxH88+oFxoU+HwMIEzWSsaEBvGdJzcwEAt/i+J+arbgjNMH3V+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9867

On 30.03.2023 13:11, Andrew Cooper wrote:
> On 30/03/2023 10:30 am, Jan Beulich wrote:
>> On 29.03.2023 22:51, Andrew Cooper wrote:
>>> --- a/xen/include/xen/lib/x86/cpu-policy.h
>>> +++ b/xen/include/xen/lib/x86/cpu-policy.h
>>> @@ -3,7 +3,6 @@
>>>  #define XEN_LIB_X86_POLICIES_H
>>>  
>>>  #include <xen/lib/x86/cpuid-autogen.h>
>>> -#include <xen/lib/x86/msr.h>
>>>  
>>>  #define FEATURESET_1d     0 /* 0x00000001.edx      */
>>>  #define FEATURESET_1c     1 /* 0x00000001.ecx      */
>>> @@ -107,6 +106,9 @@ const char *x86_cpuid_vendor_to_str(unsigned int vendor);
>>>       CPUID_GUEST_NR_XSTATE - !!CPUID_GUEST_NR_XSTATE +  \
>>>       CPUID_GUEST_NR_EXTD + 2 /* hv_limit and hv2_limit */ )
>>>  
>>> +/* Maximum number of MSRs written when serialising msr_policy. */
>>> +#define MSR_MAX_SERIALISED_ENTRIES 2
>> The comment better wouldn't refer to msr_policy anymore, I think.
> 
> Ah yes.  (There's so much comment and library cleanup still to do)
> 
>>  I also
>> wonder whether the comment wouldn't better move ...
>>
>>> @@ -324,6 +326,44 @@ struct cpu_policy
>>>          };
>>>      } extd;
>>>  
>>> +    /*
>>> +     * 0x000000ce - MSR_INTEL_PLATFORM_INFO
>> ... e.g. above here, to increase the chance of it being spotted that
>> it needs updating if another MSR is added here.
> 
> I'm not sure about that.  In its current position, it's next to it's
> CPUID partner.
> 
> The unit tests in test-cpu-policy cross-check that we never get -ENOBUFS
> for a MSR_MAX_* sized destination, so I'm not worried about it actually
> getting stale.

Well, I wasn't worried so much about ending up with a bad commit, but
rather that something you could spot on the first pass while writing
new code might cause you a build or test failure later on, resulting
in extra hunting. But this was merely a thought, nothing I would insist
one (the more that your CPUID sibling argument is of course also
relevant).

Jan

