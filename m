Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0545F04D0
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 08:31:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414016.658060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oe9YT-0006Z9-5i; Fri, 30 Sep 2022 06:31:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414016.658060; Fri, 30 Sep 2022 06:31:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oe9YT-0006Vs-2p; Fri, 30 Sep 2022 06:31:25 +0000
Received: by outflank-mailman (input) for mailman id 414016;
 Fri, 30 Sep 2022 06:31:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bHGM=2B=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oe9YS-0006Vm-Di
 for xen-devel@lists.xenproject.org; Fri, 30 Sep 2022 06:31:24 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50057.outbound.protection.outlook.com [40.107.5.57])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8094a03e-4089-11ed-9374-c1cf23e5d27e;
 Fri, 30 Sep 2022 08:31:23 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 06:31:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 06:31:21 +0000
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
X-Inumbo-ID: 8094a03e-4089-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R2zc8z6T1/veP371HRPmaA2UVSDyKVLdtthIck+D+xSuEW9sLEGMv93BqvO5pkHp9MYn3vfPHfXHep78HAiBaXj8xHNBfxtZwABxiyfV0IcDHdjJVWqWqnp1mDXtlgC+QvKoxx+VdcRJTEG2/dZNPn+/F3joNzYyYjU2oHJb++xnvnH9RV6Og1jlFBGfm+4k6zOR9ZauuaESLMt0xu7Z9QvJaMpLAsBfVzLj50sSbVzhrSQwJmKORrOj4itSZZY3DUKDeLCK4Livk7QDlHv/mqXuGKdDjfRzorsheVwKOGpA4wcOq98aOnew5miy941KC4RljM+c2ZpOYe2KVFzmxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=voDLLDHCY6rNgMrvMGlmbiyaLN/WryVYRRTD6zoVL7E=;
 b=jlJE5MVU9rJ1gh+r7yByZyLYERQbOgkALPmeSyqE9ikm0no3YZ1Kc5sTdJ1DiK/1g5m7PLGhxN0slgOusHdu7eymbLSxG+ACBsIxOsUmPUHVfAQE6sw9Fjwumne73fHLXiX/VCbbho8NIaJ2LozlUpITLUafLCrJjdzozL8cSVLn9O4cw7sRJ7CGzNEGvcnYGNyDnGF1MUER/leGXoDjBaJ0nrp/KF5oJq5h9E1cKZCLNYIC2dcBRraChOLG6xYwDfSfPyo1PRILsjPBsdEE8K+Np5eS8lIJttCPqFdfGruSA1TRVV67y0zzToVMNA9BgclsxzQm14edKIXU/cy2Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=voDLLDHCY6rNgMrvMGlmbiyaLN/WryVYRRTD6zoVL7E=;
 b=ZFKmyJe/JRHvoBnIq2DjpzuLzkMmkXkZQI2wG683/oZ0NS0NFI45awQiCwhGzQsXdwQkQGaJkuB9oJu/IlYcuHN642ooH+9AsrDPGv4bpUt12rHIcIjh8ZvsM6l+6Ii0rcG+Ti8t7A6wKP0HO2QKWs/tjLiza8UJRYqDyyZYvuJTu1LzGWGo0GYr57a17GbuxqXswWZNyjRM0QemZY55lhPME00yS46gJ1dP1lm4VY+gwt13+9P8LUd6Kl/A+w+JApEwHBey6ER5t1nfaJ1N7OySj+Sn4hOC+3diJ+Au1jn9x98Z8NAM45WtVureduiHClMrlQ1TjUWFdHZSiJKB/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b3242791-3d30-ce72-010c-c31db05b175e@suse.com>
Date: Fri, 30 Sep 2022 08:31:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [xen-unstable-smoke test] 173362: regressions - FAIL
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>,
 osstest service owner <osstest-admin@xenproject.org>
References: <osstest-173362-mainreport@xen.org>
 <200b2ad7-8cf9-4ca5-cb54-6e72ced7d7d9@srcf.net>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Henry Wang <Henry.Wang@arm.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <200b2ad7-8cf9-4ca5-cb54-6e72ced7d7d9@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8642:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a4e07f1-320e-49ed-cfc4-08daa2ad63d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gA+KJuT200mXY2R8nJg9nATe6/d7UBpCtTU3v5jcqXr0lpViRbKO1WBM56dyWB9Fukb1qYzEebH1+SVyMR8V0/uwYhnOGYW6lqI7Aw7leKHtJy0Ql9AohAHsPa2bmmX7PQXee2I1tGM37Y2BUk9K293Y0tK3Kx6WFxhTW9bENKhH5Bo0zoOLc4YXodm5mlrmOavBtKuRhjKcoawWfE2h78vezP6ROky+pkJEYGoZ1W7UqeZlPGoqh8RYx4pOOjBqpn1N0/e07enf4yt3R4+B2uQijKImJN7iZMXzf0FuG7/UU7dNUhW8L0HUUcKXotgzHyhjQWEA6L/n50lHYdyp1dOWG05nrU0g72dg+4UoXRGOWcWRmpH+wT6XcpasMxU3rU7HD1I2lmUVShQX/4DWWCUEytDCHwAVtHctRp51K9RJl90xuIzdkcnHBDO7s8PFDYebTQ50lxpCHMjTvvt1D41Cr6CkpGAchI80kUbcydQ+GmT/0NGsAWfYWuMcQhpPBFs6ULCMkkmX6Tib6ubflrzFM5BR7RJQIejpdAhjFzUmKnc78Sdf6s/p7xVrfyzEkAB214cD3MBT+ZMu5PCaFvH3LmW6bI9TNH60IfeDVOha2SE8CV8R7+WDt2ejAaPkgWYFiaD+j6mRFApFlo8ZNVVF3yyqJbkA1K0IpVsJ4rtL9aWn4yD+mbLKTkdhi6OgpqZHpWdWykKVyKdJGK8DN6quMXOEKSGJ1jpmRh1WRinnNTVSCl+B6HNy7Vi3bFM3FH2DOYRdMhvjotVCQtO+t9Uqjxe2Cw90Ua+So55hzrEA2zlMUDSPmWKZdecB4yeJApjPa5y75C9zc59lsFI3gA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(136003)(39860400002)(376002)(396003)(451199015)(316002)(110136005)(966005)(54906003)(6486002)(478600001)(31686004)(4326008)(66476007)(8676002)(2906002)(66556008)(66946007)(186003)(38100700002)(41300700001)(6512007)(2616005)(53546011)(5660300002)(31696002)(86362001)(26005)(6506007)(36756003)(8936002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2NZV1J0TzBrNlpuVWZjUWxMMG4relpOdWtkZEhUSmZ2d2I0eGZVMnM2S1h0?=
 =?utf-8?B?MzFwSDR2bnhTRnJ4cjVabWtKVUdkUzVyZlZNU2xCQWJKOHZ1QWl0b1FOeVgv?=
 =?utf-8?B?cjhaWlFUa2h6OGRBRFRZSnpCTlE0bkpWYjlGcWlvTWlwV1Z0OVlic3ByQWxx?=
 =?utf-8?B?cDZPUVhGeVpFNXJwZDQ4WXZUcXpQNnkwZFVHcVJSRmYrVXdDemU2YkVJaUNs?=
 =?utf-8?B?VFU2RUhUdFBvNktheVNmM1hHb2x5ZUM3U2dHbmpSWlNFN0hVa3hrdkI3TzNK?=
 =?utf-8?B?VmY1WVNoMElRdEtjTFRxK3l2bmlQQ2lMc2VrRnBqb0Y3M25NTjduUytiMjFi?=
 =?utf-8?B?VkJtRG5kbzdYTWltZlN1U2NoaUQxOXlNL2EvT2trY2xUbDJGRTY4RE53SlQr?=
 =?utf-8?B?bUdHMm5IUEFRVFVCSlU0VkR6M2Ria1drbVRBNXoreXFVWnpWd054c2FVSjRF?=
 =?utf-8?B?ek5BT3l1eE9lZUxmSng2Q2pFdmJvMzF5RG5BYzRyUy85SkdnS0g0RmgzSTZy?=
 =?utf-8?B?bU1iVmRKeTBEdmJOMEtwMWdTc2lSUkUyVHF6OHFwY1BQalhNaWJvUSsrRnJ4?=
 =?utf-8?B?eE4yMk8ra25CVzVTQTZ0SHZkS0VNWWhiZU51b1J2WTJvOXVqdTZRd3dzMjJ4?=
 =?utf-8?B?SU1lMUNNaHhnQWNKenYxV0Nmb3FCYVpYQ3hvOG5FbS90NzFCYndnYThNSS92?=
 =?utf-8?B?T0hwZjkvK0s4aFhrQjI3amQxK2psUmh4anJEWlhaWnd1VGtxeVY3eGxoNkd2?=
 =?utf-8?B?WXQwNFpLWCt2SzZxWTBVRFRyQ1RxeEpmanA0ZnNCd3YwQmJheUhkWWtUUi85?=
 =?utf-8?B?azEzdWhzNXRpbTNWb3NvZEI0K2tCdDZIUlE2TkVwTWJubzduMExKbHk0VnQv?=
 =?utf-8?B?eWlzVGtwZytOL0FBaEJRZFFEd3dpYzcyak1GdGNUTStYbmRvem1Ka2E3OEh5?=
 =?utf-8?B?REtiQkNpZ2laVStQQTR4UFB4dzdHME5HNUpVMHN6N1BwNnlmNkU2bi9GMjhy?=
 =?utf-8?B?S3NZTzlQQlNWd2RWNVFTUitpRU9NWkVNYWtZSlo4VURRek5wSEl3SGY0RjBs?=
 =?utf-8?B?NmxyY0tRMno2UnFEM2MxT25qcjZ4YW81eC9WTUhRU2ZRYSswRXdmTFN3bjhm?=
 =?utf-8?B?ampJZm5ROW9ya3N3YjMvc211T3J1M1NlYUl2cnhVK3AzZEM2U2ExTkR1RnFM?=
 =?utf-8?B?b2xJTURseEo2WVNKL1lBcVM3Q1loazRRc2dQQ0pYZlpVUUd1WEltN1RldXp2?=
 =?utf-8?B?WWVmQ0RkU0Q2Q0Ywb0oxZ0Nyd0tnWVRNRFNnVkFKUzJobXcweENqNE4rM1Qw?=
 =?utf-8?B?K3RsMWc3c2YyenlzaHZKZFl5TExGNmpCKzlUcWhwZDd0NVJEUjRNSjRKOTZv?=
 =?utf-8?B?Qjd6bHAyV3A1QXNHM0VtRjhRS2RwZnU5VXd0M2N0bEpBelJyOHZ6K3hpMTk1?=
 =?utf-8?B?ejZGelBadHM5blhrTjRXejQ3U2IyNXM4V2Ricmk4K2ZDRFJ5ODU1aUp6N01L?=
 =?utf-8?B?VnNkc09xOVlQOE0rMFRpeGU4VWJITHdBbnpiTXlic3BkVmFmTXppNWFCWlhm?=
 =?utf-8?B?WjBEamZPRTAvdXlKNVgwV0tackV0TEllUXlmOUtNWEFrSHB2enJwMGN0MmNp?=
 =?utf-8?B?S2Z2cUg1aGNiS2VyckNzZGEvRE5sU09oTHJ1M0UzV01zNFplYmJWVjliRHBO?=
 =?utf-8?B?bzRIN2gvQjBaN3l5YWdSSUZpYVlTNU1NVkZFRnpOSm1VckZBYW5BdDBzcmVM?=
 =?utf-8?B?M0F2WHlYYmZsTERiREVFV1QvU0pMeTBwQ2hoelRtZWg0dnRDUGM1RjFBOFFt?=
 =?utf-8?B?YlNwQ2g2VENKd3BZUGxWbk5tUDhBMUFBajRyYW5PYnNTaGNkUXRiK2ZZMVl4?=
 =?utf-8?B?RS9UZm1uVllKamVGV05TNmJQS3VNRkRPNkUzUWcvL2lFeXhtNzI2dG0wN1BH?=
 =?utf-8?B?bXBPa2cxMmtrTHU5cE5uZTB6emNCNTBWT0VFNmpsUEFSbnl3TEIxbFhaeEp6?=
 =?utf-8?B?bHJ4WWNRQVZiR2hEcE1FT2Fic1F1WTdTVVlESjcvVHgzUGcxcUI0S09aMUh5?=
 =?utf-8?B?Rk14N3djUyt5Ky9YQ3N2S1JZZWN0OEI4M1g4R2hRR1BrRXViUFByQ2tkWUZ4?=
 =?utf-8?Q?xi4swyaa9EsqhCwmB8b3JN8Zh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a4e07f1-320e-49ed-cfc4-08daa2ad63d6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 06:31:21.7066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ideM6g4h6DDrOL2/ncw44gayvRwQ1JJ+Pnl7fXmsTmvfL2NZRG1CdgG4/5WAgHTLCQPRkH1+atJNr4i3CIwjWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8642

On 29.09.2022 18:25, Andrew Cooper wrote:
> On 29/09/2022 17:22, osstest service owner wrote:
>> flight 173362 xen-unstable-smoke real [real]
>> http://logs.test-lab.xenproject.org/osstest/logs/173362/
>>
>> Regressions :-(
>>
>> Tests which did not succeed and are blocking,
>> including tests which could not be run:
>>  build-arm64-xsm               6 xen-build                fail REGR. vs. 173347
> 
> arch/arm/gic-v3-its.c: In function 'gicv3_its_deny_access':
> arch/arm/gic-v3-its.c:905:32: error: passing argument 1 of
> 'iomem_deny_access' discards 'const' qualifier from pointer target type
> [-Werror=discarded-qualifiers]
>          rc = iomem_deny_access(d, mfn, mfn + nr);
>                                 ^
> In file included from arch/arm/gic-v3-its.c:24:
> ./include/xen/iocap.h:32:52: note: expected 'struct domain *' but
> argument is of type 'const struct domain *'
>  static inline int iomem_deny_access(struct domain *d, unsigned long s,
>                                      ~~~~~~~~~~~~~~~^
> cc1: all warnings being treated as errors

I've sent a patch, but this raises another question: Why does the smoke
test (try to) build an unsupported configuration? HAS_ITS (which is
necessary to be set for the issue to surface) has its prompt depend on
UNSUPPORTED, and (implicitly) defaults to N.

Jan

