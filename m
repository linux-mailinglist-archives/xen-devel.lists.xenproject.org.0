Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 251346BC7C6
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 08:53:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510337.787839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pciQX-0004FB-2f; Thu, 16 Mar 2023 07:53:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510337.787839; Thu, 16 Mar 2023 07:53:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pciQW-0004Cv-V7; Thu, 16 Mar 2023 07:53:32 +0000
Received: by outflank-mailman (input) for mailman id 510337;
 Thu, 16 Mar 2023 07:53:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ta6a=7I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pciQV-0004Cp-8k
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 07:53:31 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0620.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a38ee86a-c3cf-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 08:53:29 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8087.eurprd04.prod.outlook.com (2603:10a6:20b:3fb::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 07:53:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 07:53:26 +0000
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
X-Inumbo-ID: a38ee86a-c3cf-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KcVJXrOij27CRM1Ma1ByYVdphZWiYuDZfmnTFlfT32vrTkS2Ttu5QJi8pQOQAj3jesZ77LzmGRUJISJl47BUzs53ipD14xPOuuIC4ved+2orrg9BOC7SLsuiUm28mW0fL/y7gvDKK/lmmBD+uHDR8Yw+EouVb56Paq3+CkEijgD1tztVA5kZC5/lfj31DVZ4hcyz4qQaUT443xiP2Ott6O9Whxe6VHELFCYPJP0gtShOIumxDdge2POE3p60roD7ux87lO3ZFQi340sz0hacZinrc0Z+YkzDnqy4bfcO8WcbD2qQRWAnSNCKY5ec17rhHh/0b75FuwedYo97kEYpsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QgnTS2V/cnHcRV9gjGbY9SvpHC/75SaEU0mGvl3YWTk=;
 b=FL1h7JwuQaUBVAZpwVWjqkRGzgkdbbsfws0pywCt/InkiadBFX96+pqzslAhylTnjHMBGLPRUxbR8EYGCeuBwv/5dsSRcyX7xuZw2rbWwb3nkDfnd6rXRLgxbiS1c8hijofRj5tosGGuE4G47nQFfZfzQkY068RSsKejRrbZfD98sHq40s7Sd3erSgfaVrS2sgD2xARrUdAsr2pB8AZbMl7m8wGXBU7xUgjmniNeW91Fg9nJb2DcTQO+Ve2ANLFGUJXcFMpXuX7B+9JHjlVW8G5XjX/VyOAWV7IZGovYk9ZSkdozWQ/vDTf6A0UuEt+MRVftJypGL4qqgWyZSxnbBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QgnTS2V/cnHcRV9gjGbY9SvpHC/75SaEU0mGvl3YWTk=;
 b=mg/qQbVgRqtyTgITJYAjrlQljMQ41ZWEPVVWxIXwA2e0Qgx8lYXnp61jvA5NSIwhFirSMWb5JqZ+qWsZtvPs1A8MqqzXF7g/YpBZhACEFcv3pVMsEzflAj1Yr/ORd/QQ0n+qnr+mAXsIhKuFWH3lal3L0pjZK9C0TqrYV4m9+UdJYsCc47AkGooBtKlLmaFOKtJ1B+O/SdZ2RDv5HBGsjQ3KXcp2QKao69/csTkzgeaNL5YNu8Ba2z5bSWufCF0Ltkb7GtSkJZt+A58Fw76NMaXTpV4gjrh8f17hIgmozxjpFa35pUU2uXsKIWvygyeGZkfAqCos/De+zuWHUoK9Lg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d3da0ece-a65a-89f7-85ba-5de31472bdcc@suse.com>
Date: Thu, 16 Mar 2023 08:53:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 0/3] libxl smbios support
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>, Henry Wang <Henry.Wang@arm.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20230306204024.124882-1-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230306204024.124882-1-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0009.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8087:EE_
X-MS-Office365-Filtering-Correlation-Id: 79cb8eef-e83b-440f-1581-08db25f38647
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FWOyA/K6cEKiQElo51pbqUdTLad82W3E6ZW2N4BnQ1YI6i2Ib5T+B+TBKKJRoTyndjRJb6SBpvZuKFiw7c9FP4QIcLULaeTTDuO+l4U8O+Sb2pPuLRdyLJPg7xiK1Q++LvIoSVsXlj1iIGrEvWT6i+qZXELr7VmtxcnqtanMUXBM9BMqtwN6OQhCNvsnbkLPW5dO7+dFzOYQ0Ez/Kuq+fWkbXeC9skk71UehOT2E3WcHX0gzoCFn+JrSZt36Ng4dtC9P7uobhbSr/wJzHsm/c2Tv0T7GTZHrvQBXu23NGCw4xWw5awem5///7dHz82tvOdyMeV9NX3a+EqpJtaycT9zlaY2fedtHGadDDmElsOGiX4BhmlIBdOcKSrpXodtan9xdnNLkLjhIaLeToNU9m4ev2QnG0YsBurDNUGmKuNFB3WNbIa48f/dIoHhG6DaQ8Iua7qHh6TbkDvjggRroga2s9zsIFm5Qvk0OTFl2Lao4qbFTXbxeY+w4pQN52+TDCfrQ59qyYb8JVQH/shuLZO9QYgs8YewS2qq+IlKsyHwJxkTUBgEbHPJlgd0xw5QTByufGTVR0PpJFjDN4UzZqqU3smy3j/PjsknZVXWI4POcCRvQPnhBB5IpcA8q83MUNbea98ty4afhjyxhzrEcagCc6Gp2yxCna8eUwj2e5fT5bYPBa+TM73H6luqfqrrXvnQOjKc5ScRLcCLk22wo+WlRyszQXFBKEWVwbrAaESQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(136003)(346002)(396003)(366004)(376002)(451199018)(86362001)(38100700002)(31696002)(36756003)(2906002)(41300700001)(5660300002)(8936002)(4326008)(6512007)(6506007)(2616005)(26005)(186003)(53546011)(83380400001)(316002)(54906003)(110136005)(66556008)(66476007)(478600001)(6486002)(66946007)(8676002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDFYMWxaWWp5RHNDeno4WXRxbno4QlM0aS9zcGpOMk4xVWFHMHozbGJzcDNj?=
 =?utf-8?B?R0JRSnJoMUNrOGQyUWF4S3A0NTRCMEVqendRTWRlUmFjOUErOHlkNldobVVk?=
 =?utf-8?B?TUd0RTNIZFVyVGpHTEtvYkpXWUhzclBNaEtCUE5hTjlIMlZlV2l2OTRrYmVW?=
 =?utf-8?B?bThqdmdNd1dqSHY2Si9DUUVxMjVBYXJvZFRqR0p6WWt0SmYvSlowMFNJUUVO?=
 =?utf-8?B?TWNPMTFpUVZuMzk3VEZSSU5LSWYxN2ZLV1hXa1ZYcVNKSytyc2Vad3UxNWlG?=
 =?utf-8?B?dE1NQlpsSS9UVGZ2TkZ0dWh3dktrL1ZIbHRTdU1EdC9WcFFYZ1lxMktvQkVH?=
 =?utf-8?B?citScmJ6eXlpaFlqaGpROHVZK25iZTJXTlN2RlpPWXlUUE5yajJESklzQXZO?=
 =?utf-8?B?OWczQmlCMy83cHJiYXhGbUhUNUcvUVBtWkdISmN3aW94K0NoT0VHN0ZoVSsw?=
 =?utf-8?B?RTVVQzlTWHhRWlJ3ZDAvTlRrRmVzMmZsNVpoNG1qTmo4YlgzY1B6VmVKa2xD?=
 =?utf-8?B?bGJka25kajdCV1VNTkFxN1Q3dXIrZVBjWkFtalJYbGY3L2lLVWZhS01KSWpD?=
 =?utf-8?B?dTFGcW9GeTZVT3h6YjJYWnFhZk8vR3cwTVN4WktQeVI4aEt0RkFnNVBGNW1u?=
 =?utf-8?B?MEY0TG1PNWsydzNRbG9GNVdEWWxrREw1ZkFFaEdoZFFlQTNFTkprVU5SRHZG?=
 =?utf-8?B?cjJ0TDdJSTJIU0NKcElPMFB3NVVUSUNwTk82bHhzeXhBUEJmOHNqdG9pSnZ5?=
 =?utf-8?B?VkhrNjlYSkNHZVdSZ2x5U0EzYlpKZkx6MjVxTk14OUNpa1RJUW84cmljd2ZK?=
 =?utf-8?B?dlBxK3IybGpscVVjT1VFTVZkSm1aejZKczdPU3lPRDdRTFhhNHV2ekIzcVNz?=
 =?utf-8?B?anJkbkYxV2w4VHAyaFErN1ZsNUZIeFZGdXhJcGd6RHlQZ3g3eEdVQ0I1RHRJ?=
 =?utf-8?B?MUhyVXJ4Nk15WTVrVnYwUUNsY0hGc2FDcGdNalFxMjhUc0ZsaHVrRWx0RjhV?=
 =?utf-8?B?bUowdklUa3lZakZ6eXQxR2tlS1lMY0d4NW00a1Nsangzck5LUzA0Rmt3SFhq?=
 =?utf-8?B?aG5JQmh6OU9GMzd2cGllZWVZUnpRYVMrcFhyR05nbWJtbzFtK1hJeWF3M2tY?=
 =?utf-8?B?T3gxTmdlbmIxcGNETUxvdG1LWS9QVTQ0ZTJ1cVJieHhBTmVySUwveGwydXdK?=
 =?utf-8?B?N1hVL2ZXL0dXTkVvSHg3THptVzBqcGlLS0R1U3Nmc0JwWVlTdzVIM1JuaUtp?=
 =?utf-8?B?cXhnM1RGYTVxTmMrRnIvbTV2WFN0Z3RWaGtKaVoyOU1JdFBDcEQyWEhsbmdh?=
 =?utf-8?B?dGdvZlZicTFHaHJKRmhOUnIvQXBKK05tZ1p3R1JpVys3MUxpaFJsbmZuRTdl?=
 =?utf-8?B?TnE0RENyRWJIS2ljMm8xR2NaNThCZ0FvWEdEdXdkNnA2azBNa3d3Y0kzTGpK?=
 =?utf-8?B?V1FIVmNDdThCTXpWM3JyU3JsTzRwenlYV2JjL1B4MTdFb3RwQkc2ZWx4MHJL?=
 =?utf-8?B?T3dTcERmWnFhSk52WmJqUXlGWEtwWTgvSjBqL2w3dXNXWGNsbStpQjJZTjhQ?=
 =?utf-8?B?VWorbm1xR3c4VnJ0R3NBYUJVYkJrMGVrMlRRbnlYMEJrVUorQkluamRmQTRm?=
 =?utf-8?B?N1MyQmVUTGVQVUZydUJselRhS0pmWU82M09iUDR3VmFVaFNMTjFOS0tTVFJw?=
 =?utf-8?B?U2pQWnJZTEtWVkthOVZjK0VkREhBVDdSYVlsUHFuTERWVUtYWFIyNi9McTRK?=
 =?utf-8?B?RHhkSXM1SHF0SlUrZnJLMURwc1J0VE5WRWpVdERvRm9DRXFyOWs1NDhTNElN?=
 =?utf-8?B?alpNR2FKc3N5cEEzdW5iWjlkeDlpdW1Rb0Zod05sS0MwdDBWR1pJbkw4a1VP?=
 =?utf-8?B?WHp2enhYYXVRSUx1NnZPTVVwZDk4Z3pQN0dQaWJ4eENXK2pNS1Joa3NtR3Bw?=
 =?utf-8?B?dndBaWE2d3FXNlpxV0dKaUtiSzd5RWNvUExORkxCT3VnTEZQQXE1Y0Jwa0Qw?=
 =?utf-8?B?SC82eklzZzJXQWtPOTE2ZE5BNjdJS1U0V0dJZnBtNHRXcjE0QnFLNUhOVmdo?=
 =?utf-8?B?NE9YVnJKa3RPUDQzUm4rbXFGb2lkVlNueWxCaW9zMGtBZGpxTWFwV1JwRWxj?=
 =?utf-8?Q?3QZg6ZG/CP2U/vRhdoSoMKrc4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79cb8eef-e83b-440f-1581-08db25f38647
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 07:53:26.5330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BhLc6Iu1uPtI+hMxew+GIc3kd8gKvLhMCC4EsI78fGWjOf0Hq8KgIbO/H0BmYzsilvfr2SsX3lwg7/8GPQFAmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8087

On 06.03.2023 21:40, Jason Andryuk wrote:
> hvm_xs_strings.h specifies xenstore entries which can be used to set or
> override smbios strings.  hvmloader has support for reading them, but
> xl/libxl support is not wired up.  This patches adds a new xl.cfg option
> and libxl support to write the xenstore strings.
> 
> The xl syntax looks like:
> smbios=["bios_vendor=Xen Project","system_version=1.0"]
> 
> The Go binding generation needed extending to support Arrays inside a
> KeyedUnion, which is what the first patch does.  The generated go code
> builds, but it is otherwise untested.
> 
> There are also oem strings, oem-1..oem-99, that HVM loader supports.
> xl parse multiple oem strings like smbios=["oem=A,oem=B"], libxl then
> iterates over them and assigned to the oem-%d entries.  Both xl and
> libxl check that the 99 string limit isn't exceeded.
> 
> The rendered man page and html don't have a newline at the end of the
> new section after patch 2.
> """
>            battery_device_name=STRING
>        ms_vm_genid="OPTION"
> """
> 
> however the txt format is correct:
> """
>         battery_device_name=STRING
> 
>     ms_vm_genid="OPTION"
> """
> 
> It goes away after patch 3 is applied since it adds text about the "oem"
> option in between the two lines above.  I'm at a loss as to why this is
> happening.
> 
> v4 is a rebase and resend of v3.
> 
> Jason Andryuk (3):
>   golang/xenlight: Extend KeyedUnion to support Arrays
>   xl/libxl: Add ability to specify SMBIOS strings
>   xl/libxl: Add OEM string support to smbios
> 
>  docs/man/xl.cfg.5.pod.in             | 49 +++++++++++++++++++
>  tools/golang/xenlight/gengotypes.py  | 41 +++++++++-------
>  tools/golang/xenlight/helpers.gen.go | 51 ++++++++++++++++++++
>  tools/golang/xenlight/types.gen.go   | 28 +++++++++++
>  tools/include/libxl.h                |  5 ++
>  tools/libs/light/libxl_dom.c         | 33 +++++++++++++
>  tools/libs/light/libxl_types.idl     | 27 +++++++++++
>  tools/xl/xl_parse.c                  | 71 +++++++++++++++++++++++++++-
>  8 files changed, 288 insertions(+), 17 deletions(-)

Is this work something that's worth mentioning in CHANGELOG.md?

Jan

