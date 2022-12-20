Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BEE651E1B
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 10:55:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466875.725837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7ZLE-0000RG-S0; Tue, 20 Dec 2022 09:55:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466875.725837; Tue, 20 Dec 2022 09:55:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7ZLE-0000Pk-Oz; Tue, 20 Dec 2022 09:55:20 +0000
Received: by outflank-mailman (input) for mailman id 466875;
 Tue, 20 Dec 2022 09:55:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I7dU=4S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7ZLD-0000Pe-Nn
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 09:55:19 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2057.outbound.protection.outlook.com [40.107.247.57])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68de51a8-804c-11ed-91b6-6bf2151ebd3b;
 Tue, 20 Dec 2022 10:55:18 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6819.eurprd04.prod.outlook.com (2603:10a6:208:17f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 09:55:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 09:55:17 +0000
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
X-Inumbo-ID: 68de51a8-804c-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DlKuKtD6lLvdm/4NVcOD/1Fw7ByFRs57v6rLpQkoOjx89w/zuSlJ7AeAoghGUq+cZpUZruTRsQHIj7PTh5r9Iwg5HzrPUIAS7MxoZiJn3hvQrkTSXnHbkXmi0p3TiTFXMHSu1Dedq7FRwE/4oquIDbPlUwOsJXAgxyI0uHbtufeI/oaerN1SrtGssH5zdUnXnPQDpulslJUi5NWC1kdG0AWpqRqvhGO4py7BC/QomUGoSEKv3SwDhCP6hSKpdQIbmwf6AUu53k1yCcY6mYcWpXynlbsrISfjWJ2VGN34049mxOO2lOr2F7FuJ3KVR6fCHhEdLyB1mhKJ2OXdGt/Tlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ei6zyklD4yY9mJ8hfzymc5Ul7oPdTCckog4gmv7mtB8=;
 b=dNsV8bkBh5CcyZOtjVY7ohvsx6o3j4gk+UMo17aAJPoxaw1GS/kQ+02J19uwflOGWcWUkqw+wbqfr9aR5vS8gGJ/ASrq4Z/+msQqIogRK0PTkpYgtWeEqrb1kTvPUxAYMHmK7j2GBKM8Yi6LdfDc7SrG1+w0MX6Gcst4VPNGOb0gckzBwBeJdKqST4FX7Awfas4DoS3TJnSgxTxuHmuVPEnHnLf1akkOjaBKuWm0UQzy7rNSuYmW19THq4ejH9W97SdM6GDnVbt/UcieRs/sh4KqqoFv+vGXmIk6AYTWGdqQ8iIewPM3P+lqCu8W0n4cGkS8T12KG+TkMciuPWkb0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ei6zyklD4yY9mJ8hfzymc5Ul7oPdTCckog4gmv7mtB8=;
 b=C2fkwzLM20K8woSzERrYeWOTpPwWS4ouyB0T3UoJFfrCj17pgrY6IKFucc9qE9AmlEuroxGvEu2Ox4HedhcHimHpsxeMi5q32ZE4kAFxoH4chpl0WV6qSaztH/qBUIZFHW6eS7MJ03r6f3LZSKofWSj5FfMt+2KdcxpPkJk71EzJW/Vi0UhtnabR5cyspogIvGPvBzi3xC3W4G1HNd/U2uGOWkZFT7M748iRLEd/quOAWYUw8WLhnXlrKcZfYjA1Nxf3Ib3Yv/0jlpGnIRpzTb4xMoVWMD8OHXHDEeqkNlX3cMMVW9+Zjl0m2l0NXSZlqo12dq35YnDoOhhU+3T8WA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <28180048-87c6-c0b5-dcdf-34fa10580145@suse.com>
Date: Tue, 20 Dec 2022 10:55:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH 00/18] cppcheck rule 20.7 fixes
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20221220085100.22848-1-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221220085100.22848-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0187.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6819:EE_
X-MS-Office365-Filtering-Correlation-Id: fb66416a-819e-4166-d129-08dae2704c51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/myXG/0dxVSnYl5LkeLwCwBnMbovR3kn88/vmSWmPsHFPEG5uZDCYzFipBXX7WOHy/D1ycUJWrTCsRaj+PXX+Jd+LRjiAMYPsahq51XFcZPNK700yEK2P5R4AzS2yKWBdUzbE8NkWAUVXSwX8GI+c3i5UIxsCKyvxjve6ls1i8ECeGaSTacsGC5unD9Ka7uLAu0TUfvi40WFhGGnrf9gomX8asFIjzM+wyi8crm2mw/TmzKgwr1ND6UaQT/V6+vhpTYtUWJiMv06HcHKET8h25A0ap6bgOEW8DhBC5Q8mjQ+x3MrApBo565cmCzxc8Ja6j6788C67kbIRAl3nlnb8CMFG3+Op+Kv9Xu7rQgKMR8XjYD+cYnkqAxCKaJDBspdFidMrmsB2VUyN4tADQbe3c0wwLk6mnjhPe0wDMPlumctfoj4uiADxTE6A4MOt2mJYqMWw9i0hx0pbBSINQtxtzDzQJwDxUgK3OFllCAnlvrz/wO2bbzvbkzTLFev4TVVMMvFiJ+ydjSbuiUzEvckvNl7C0VwzikWY3eXz6dkxzNmx3KTgGRxcMgIjVvNy/ZkKomHcWx6qj6ibSxp8Xy3xjYFLiAWnvjfs2YRBvjGRrR3RcOaAQ6W28ztB8nWBabYWMFH4C5yYdvsqj1BRLh3JEqa9KRbHww4RhRcfT6M7k8A0+aXorrQ3vWjoHolB9XPFVAlHbsrl6nAg9dnhzbERTYseY2xs1V/+yK2mr/IQW8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(376002)(366004)(346002)(136003)(396003)(451199015)(31696002)(86362001)(36756003)(6486002)(186003)(478600001)(26005)(6512007)(6506007)(66946007)(66476007)(7416002)(66556008)(4326008)(5660300002)(2906002)(41300700001)(54906003)(316002)(6916009)(8936002)(53546011)(38100700002)(8676002)(2616005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHd4ZGVKRGlQTTI3eWZPWlQ0bFhEaVBLSWk0WWo1NlBramJBVmVMVFY2SEc1?=
 =?utf-8?B?U0lqODJpYzl1TEFVUHZzYXVnbVBKeHNjZ3BVcTQ2eWlhVFhsbjFmcXR0NElM?=
 =?utf-8?B?NlJ4cFpWcnpYbzVhSHh5dTJBUTAxWE95dWpFUWFwSlhHSzBhdUZJMmNFMDBn?=
 =?utf-8?B?dStiUm9zWHFheVIrSXRsc0Q3SXpockhQWFRIdGVlOGVPNFpuNWVldW5saTlS?=
 =?utf-8?B?L3FiZGdiTW1jZ1R6VDBRa3JEZjZmNkh5TytUVCtxTjVHejZWazlZblVBaER4?=
 =?utf-8?B?dzR0M2ROVTNKMUZUM0hxdzZLOFYvK2o2K1hWeFgyd0hLanJPV1pDNlN2eGpt?=
 =?utf-8?B?NDN5alBvVTJRUHYwSGdPWVBJS0tnRXRuRFJydkJiR1QzMEdGNkZ6WVFkTm5z?=
 =?utf-8?B?SHBFWTBySjhtb2VSWTMzdVJVMXpsdkxYS2l5L3lxa3RkbWZlblVsKzdaajlZ?=
 =?utf-8?B?cWdVL2hnTk9VTjdjdnlMUXVwVE04Y2hpejFPN3RCc3phVlJydUN6cXR5M2xZ?=
 =?utf-8?B?L3ZDSlpSMzllQUxzVEx5OFJWR25iblV0OFMycUdzZkVqZFlCR3BaYUY1WWt3?=
 =?utf-8?B?ZEdOOW5PRXpRaitBQUlqUE5qTFJySzRIS1JsNmR1dHAzVGg5aWtQRDRVYnVj?=
 =?utf-8?B?aWg3a1NucjRhaWRzOGJwM2FYRFRnUTVLN0daNUt6akFYZnZkcFhraE14TGVT?=
 =?utf-8?B?Zk1vTlp1R0l3YTRpdlRRSjAxcFdJb2NQa3JWVmJndEt1ekwwQnVHcmdWMW5x?=
 =?utf-8?B?OGR0VW14bys2K2l1WmFSbmFtWUdmdUtNOGJTYzdIYndwVHdiRFNPcmtIQ1Iz?=
 =?utf-8?B?NUpjcVRXcUpRQ0ZBcksranVxYWVETmEyQnQ5WmwwOFVJaUV6T1doNFNFZWJw?=
 =?utf-8?B?Szg2TmFjMkt2SDNKanlBVzhaRlV6WDI3TVo3QWN0d0ZDYU5naHNYN203T20y?=
 =?utf-8?B?Y1dIM25YbmRHdW5vOGIrK2FkMzU5U2xoN21UaTFKZWU3MnVIelRVWldQWFZr?=
 =?utf-8?B?SXdJWDJsdS8zd2ZDcVBHemwybzIydTZMY01tRDNoWVBTNzNYQlJoRDZGd0tG?=
 =?utf-8?B?eFdJSU9OMzNCakczQ2xsdmg2MDRjaldwaUtGTmFYTVM3L2QvbloxQmdHNnRP?=
 =?utf-8?B?RGtUV0lad1NkK294azRmOFQzbXlvKzN5VTRxanpjZXdBWG5JY3QweHR4V214?=
 =?utf-8?B?OVJ2UTBWNzIwa1lSNER0cjdBcEVVMXdPdjhKRzd2K3Q1MVp1amR6cXdkZGtU?=
 =?utf-8?B?OHhHUlRVd2NhQ0RZVUtWcEdVcU5XMTlXazR4UFJydXZHU1BGQ2xyNFBHMnFW?=
 =?utf-8?B?MFJpdkVPdVFDTDRtdzZmY0o2SWJpRmpHR2ZiQ29qU0RFdlNCeEU0bjA5QXJ5?=
 =?utf-8?B?MkYzekxGYjNBOHk0OGp2bmdQczEwRkpSci9DZCtrSDI3dFlFMEUzTlhXa2cy?=
 =?utf-8?B?czgydE9IclNSb1k5N1pYWGRiTkNVRG1uazNQcTNHZzgwSitscnRiT1V1R2xv?=
 =?utf-8?B?ajNiS0ZCalJNMytONGxuRHp0Y0laVGJocHo2OTZucGxJYVQ3dWZTOTB5T3Fw?=
 =?utf-8?B?eGZabFVZeVE0TVNTeEVPOWFXYWNXUUxpYWdYaUREK0RLT1BSVjVOQ1haVnF2?=
 =?utf-8?B?SkMrTytYV3NBdzNmNEhKQUNUZzJIVUFjRVdZSk0wUisvZkRiekVZSHNQK044?=
 =?utf-8?B?STRxa3JjMnZ4UkxIR3A0SmNveml0bnRPVDBuQzNQbnlOVTFzdGdNL3BseW9m?=
 =?utf-8?B?cDIwOXNpQ0tETkpkVkNwV0o5bllIaWZBdVJKT1lRUFJ1RGYrRHJpRHprckt1?=
 =?utf-8?B?TWFsUEt6Z2laQmpyVGxVWHM4Rm8vdmVmc1dnbmhSeFpJM1ZyQTVTSlhMZnYx?=
 =?utf-8?B?SmlYd1N0dkNyWS9VaDZXS0hyN1pDZEg2NnZ0MFV2Q3g0ZzZobUt6MjlhcEUy?=
 =?utf-8?B?RXBWRW0vNlVJbTd3NmFmNDZMQk1SanZVbGRYK2FURmVlYXR0SlB2RS9zVjZ4?=
 =?utf-8?B?cWV6ckNKSWpWU21paStIMVFLREsrWlRMNXR1Vmw4VThGcVdiNyswWXpuUjZY?=
 =?utf-8?B?V3lENERKam1OYzg5ZlhZd3RoREJIRXRMMStudDJqMk5rMFczUmxrMWwyNnFK?=
 =?utf-8?Q?j2Szv2nadBJmehOD/XhMdlYL8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb66416a-819e-4166-d129-08dae2704c51
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2022 09:55:17.2085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YWCA+iEadBxX3isXcFAQ5xYpbcJKWech4fkZsmiQpORXjMFu6/UxFTAwNgthnWfvvliAmp9sllKE6QIA3it1rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6819

On 20.12.2022 09:50, Luca Fancellu wrote:
> In this serie there are some fixes for the rule 20.7, mainly violation found by
> cppcheck, most of them are false positive but some of them can be fixed.
> 
> The analysed build is arm64, to reproduce the reports here the command:
> 
> ./xen/scripts/xen-analysis.py --cppcheck-misra --run-cppcheck -- CROSS_COMPILE="aarch64-linux-gnu-" XEN_TARGET_ARCH="arm64" O=/path/to/artifacts_folder
> 
> Luca Fancellu (18):
>   arm: cppcheck: misra rule 20.7 deviations for alternative.h
>   arm: cppcheck: misra rule 20.7 deviation on processor.h
>   arm: cppcheck: misra rule 20.7 deviation on asm_defns.h
>   arm: cppcheck: misra rule 20.7 deviation on config.h
>   arm: cppcheck: fix misra rule 20.7 on arm/include/asm/string.h
>   public: cppcheck: misra rule 20.7 on public/arch-arm.h
>   xen: cppcheck: misra rule 20.7 deviation on compiler.h
>   xen: cppcheck: misra rule 20.7 deviation on init.h
>   xen: cppcheck: misra rule 20.7 deviation on kconfig.h
>   xen: cppcheck: misra rule 20.7 deviation on types.h
>   xen: cppcheck: misra rule 20.7 deviation on xmalloc.h
>   arm: cppcheck: misra rule 20.7 deviation on asm/arm64/sysregs.h
>   public/x86: cppcheck: misra rule 20.7 deviation on hvm/save.h
>   public/x86: cppcheck: misra rule 20.7 deviation on xen-x86_32.h
>   public/x86: cppcheck: misra rule 20.7 deviation on xen-x86_64.h
>   public/x86: cppcheck: misra rule 20.7 deviation on arch-x86/xen.h
>   public: misra rule 20.7 deviation on errno.h
>   public: misra rule 20.7 deviation on memory.h

Like Julien I object to the massive addition of false positive markers
just because of very basic shortcomings in cppcheck. I find this
particularly bad in public headers - imo no such annotations should
appear there at all. I would suggest that you split off the actual
code changes, which are likely going to be less controversial.

Jan

