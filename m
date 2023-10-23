Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 768507D300D
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 12:36:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621295.967659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qusI0-0007yD-8H; Mon, 23 Oct 2023 10:36:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621295.967659; Mon, 23 Oct 2023 10:36:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qusI0-0007w8-5h; Mon, 23 Oct 2023 10:36:04 +0000
Received: by outflank-mailman (input) for mailman id 621295;
 Mon, 23 Oct 2023 10:36:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OVTz=GF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qusHz-0007vv-M3
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 10:36:03 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0604.outbound.protection.outlook.com
 [2a01:111:f400:fe02::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f584437b-718f-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 12:36:02 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7669.eurprd04.prod.outlook.com (2603:10a6:20b:29b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Mon, 23 Oct
 2023 10:35:58 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 10:35:58 +0000
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
X-Inumbo-ID: f584437b-718f-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LInR/SPbVBcSIcdtJMCEKaAAma4k3Lr3WvKVciPhB+JneZXvZ3a2AC3NLvN1GoVr0RjNZmPSeT5QslHfah46Gve/I/XedKfXI7Tai18G7YMn1223Qi9Rr4+lkP4x1x2dlS9ejDPK9Jmyimlax0o66orPITJzgQY227SWMEGT4JsCV0rwDkz8CJnAMLYYZytj3Y73lEyRXC3m+qx6vYLu+yMO2cvTbAfEkGiILVLN7cgIusEj1w4OAsho6VtTnGnMUWMw3uDGMMQeebWRBdEjpDEBNAADEHVEveQw3Kpw/C4yWyOi5MV0ebXTo5YMSxWF6nRbbUC2fDLOz5FPL0HOgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n/xjM4pQthFNuKbEnEZctnUokWT8FgHvVxnc84MARMQ=;
 b=Shu2T8fEMJifzlR5+mLVD+FNnUxQEO3PQ8E3q5p4joROJiqIPwWCRX5F1VbdKcuMTCOgXqG75ASVqYzkB/45ZtbQclTYu0v+W325A5EcQi+xyA8NSrg0J6vpZNSKZ0b06hpyOwke3opQXPrpLTse2UTAQTRf8mX90s7HfqcRlYDtgx399Iu0BzRxk+f60UCsDg6s0ZhaUQDj7yuqXHiplhCxRoS5NjpdfJfViKzWAueo3H8OIqpz3gxTexwTY1Aam8BsXdy4wF0KczCLjGBMvIBIOgFPDjDoCx4gzYID1sPGx0fkSmIirEuQ5xrSkTTUshAmJj9GDmBOd5OPsVfTgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/xjM4pQthFNuKbEnEZctnUokWT8FgHvVxnc84MARMQ=;
 b=CDehxgTFOlf95CJj2tF2x/7N66iyv7oPye5lGdYDZLlwCgnlhwEY/uprAhW401I1mjtIkx/nI7dDfQNVs8N9gd+dlFYk2tWjP6AlrsoDUCw1ZqJ3ru/IEyWixcGGV3rdaoL0LVwwBE9LBJm8GyVwG+boXoBJUYn87+pNHHXzopMuEF1bhcGWXr58FDU11PtTDdrG0CtYAqWgaTcfoVQZxUGbBbGrkTxHliAkIWr4qSk29LVFRfvrl59RM0UmPUOr6UtQ+pU00xLk/nQ4BOjjbaTwenRbPJ1StBoRVgwnObTeHAOMvSNsTrYxjxs4jRGD7Y4RrND0JGK5OGBxaBN3SQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2ad91fc0-43dc-632f-9c04-b5b95eb22c20@suse.com>
Date: Mon, 23 Oct 2023 12:35:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 04/29] xen/asm-generic: introduce stub header device.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
 <3cc9ecc3abcd21c5ed7276b01bf5963e6a5fd5e0.1694702259.git.oleksii.kurochko@gmail.com>
 <a20f5783-7ee3-6ed1-d4cf-379c30c64a12@suse.com>
 <17fbd1d2c9f1fb1fa5121f69c743b2cd766f7620.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <17fbd1d2c9f1fb1fa5121f69c743b2cd766f7620.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7669:EE_
X-MS-Office365-Filtering-Correlation-Id: cb95b887-7b3c-4503-277b-08dbd3b3d87a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yEIsc6hTOHsogcbDS3sMgMi84tcbCtNvW3vVLdS5pjNxOwZp5ezMPbmmnUPW8zLjxcLAsXAX5rl14Ytacz2nLbsYNmqr/t8fycdkhGCrgqi2l+CV2psEJCpZjqaHeVKi2+QN8D/E2RUum0ivB40waWDLL2W+cAna0bg+XRo0ggSATDj7q4Qr6YSlOU0yAIWpcD3JiF8PXJtcM73AruDCVuC1p8CEp/oNIvDof9X12AVcysXCcsmYKZMNteQ3U8htswxA96EhXW7yYbUvttGMdYXAwrBP81Ise8IIiJP//XmBVMXYAQlm7PfSde84vvIm/FRwlxOb/vwPTuL+56FRe89w90DCNXDQ1qg5fGX5QMZtD2TTwx93brSKW0aaEAW1HF76AGesvBJMuHCGlWyCYYaqFdovbAfseW6972OHu+Eucg7DkhrMXWWGcV5ppgyVed0yJP1fvuK8PJyu6R7S5xBRUleFRimDLTR6e4e7tKH/88I9Fd5si6VD1zHMWmipgmDSBl5btCePL+FbBAMSjhConIP/j9Qp76TtRTeftLit7XvO2VP9cVq+k/21dVWz5zllH5BIDqfJu9gEejtro7ZMa6cG6JUAvnr2/R1EYQ56RvtAgbvqoomMA/dznLIyG5AvO/pFbMonKoWwZ0WD6PKT+fInaarVX3PEHjgVk7E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(366004)(376002)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(2906002)(4001150100001)(8676002)(478600001)(6486002)(41300700001)(5660300002)(4326008)(8936002)(316002)(6916009)(54906003)(66476007)(66556008)(66946007)(31696002)(36756003)(31686004)(86362001)(38100700002)(26005)(6506007)(53546011)(6512007)(2616005)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFhrV2FBajJnR2kydlpGcEsxMmdmaTdtcm5mWUk1TDJFck4zQ2ozZEFyRmNY?=
 =?utf-8?B?eFBBSHRBRitjUEV6UmYvejI3SUtiTWdHRDBiQTZ6enorNlpVUURMeW1ZVElr?=
 =?utf-8?B?aW5KYXdYSE9ZVE96VTk5STczU1ZadzduNzJuYS91MmZoOHVTSmtIaHNObFlo?=
 =?utf-8?B?U2dtWktFOEYxTkxXRzRSam00b205Uklvb1E0SDNMZ3dMR2ZCQkNKY3VUQVFi?=
 =?utf-8?B?bW81b0lKczlsTFZQQTFPMWloOVJTTGJSVmsxaU45d3FYSHpxOHJKOWpESkZR?=
 =?utf-8?B?TFBLWlNUeS9TM0p0S21Tb2ZSMWhSRFQ0cVVtaHptOVphakJuOU8vRUxQd0Nx?=
 =?utf-8?B?cjlwdUhUNm5YVm1wNEN5T3FqaExkQzkvaHNkOUhCMTRMb0pmLzFtdnMveitM?=
 =?utf-8?B?dzh0YSs4VEphL0FlSlhFbERBUmpIam1XeUpnWUt1VmVEM2czSUM0dlZTN2lP?=
 =?utf-8?B?dEw1RjdaTEY5ZzU0dWhkcWhlT09YRE9wQlAyeVAzbXVwWEFmd21VekVGenZD?=
 =?utf-8?B?cENRQUdkSUdQUnUzcENydjNMVmNMUjhSdWZrM0REb2xQM1VqVENYVTVFSytq?=
 =?utf-8?B?WDNLWkJZTDNHMlA3YXNqSzMyQ0lZN2VyR2NRNTQyVXhnZ1pCYlZYQkNkbzdz?=
 =?utf-8?B?QWsyWlJvcGVQR01mY09BSW9kcU0rQWd5RWJVS3VSS0k3LzBHT3BqUlcxMWdj?=
 =?utf-8?B?b2dUcmNRWjZOeUxkdndhZXNPaGFqWkRSbXhnWWJ6SFc3dHNvR3RSSW9iY21Y?=
 =?utf-8?B?eUxOeWc0M2ZxS1o5dVh0SlEzQ21yUFpTWjBMRWFuWTJlc0cyRTM1TWVZVVR3?=
 =?utf-8?B?ZEdNRmY5M3c5KzJMc3JBQWNrY2t2TUJ3YW1mcWpNV2RiOXVjUzJuL2FHTm9V?=
 =?utf-8?B?Nlh5K0ZxamhmTFp4eXhrc1pDVUtHNjdwQUdUVlVhMGpYZXdOc3VqdXJJcnJ4?=
 =?utf-8?B?c0ZKRkd5amw0L0FrMURsQlp0MzJyV05MN21UQk1wVDNpb1ZoSUtKNXQwYjUy?=
 =?utf-8?B?YXMvNE0wVGk3SXFDS0J3UWlqV3FsckhUTFIrUUhVODhtSDViRFhaL1VRc2w1?=
 =?utf-8?B?UTEwekFSYWp4aXhYaXNjMnRtWUNYZHBFZGFjbmdjMThnY3g2YjRVUVdvei9o?=
 =?utf-8?B?VTNZU2lPTzBIOUtSVzAySHlLNlR5SzhmTzArT3dBcG5ONWlkTm1iUVdCSmlZ?=
 =?utf-8?B?d2NNUFlHWURJVi9OTWJ6ZjFOdlEzU1l2TnB4VHZTdTBCSFh3TUZjT3h3ZWV5?=
 =?utf-8?B?eTR4dW4rd2dwUWxIZ1JnZDA2QjNxcWVzODFDWm5jWjRacUVQN3ROb1hPQzl6?=
 =?utf-8?B?ODlDNVF0bE5uQzhiZXV6YTdVN2MyM0xNbjVqb05SQWNnVTF3ZmxIdjgrOGxZ?=
 =?utf-8?B?eUlqK2I5WkVrWm9rWG1LWnFLUTFxazNoSVdmSUh4MHV1S3FoZ2dHMlRPNFRh?=
 =?utf-8?B?aXljNy9xWjlRdGlJejBJMktaMmpXRkphQk03cGYvZEVuYXJUS2YwaG82d2FI?=
 =?utf-8?B?elp3U1ZxREwzWEVtZnFaWkVydDh5blBNMjdOMVVYUzlQY1IxUHQzK1ptSURu?=
 =?utf-8?B?clhOYzBkUHdRQktrdDhlREFPa0IvMFRYZ1htVE5HRGFqcVM5ZWJrdFN3SzJT?=
 =?utf-8?B?aW1yVlV6ZFpheldwZ0h0WEFXY014dHNpK1ZNUXNETzFpVU91eXF6YktsV0lL?=
 =?utf-8?B?Q1llNEh2YUZ6M1RxeWczdkhPeEhId29CbDg2ZTFSeUJyQ1RjWUNQc0tlQmlW?=
 =?utf-8?B?UGhRNHM3YlUydVF5ZDNaUCtNS2pFb01PeUxPWitoTEc2Y2VHVHRFWFBIRVZl?=
 =?utf-8?B?Y3FoVHlvUHlsY05Nam1GQ2hiVnM3cXRsak5nZVpsRzdjN01tbWlIVkg3OXg0?=
 =?utf-8?B?WjMwYkZlaER5S2tFOTVHYXNKMmRUK2tRcVNPUkxka09wRGwybFFsclMwdFp4?=
 =?utf-8?B?RGpVcG5yR0RFbUgxVmFtZWwxaWlPcnpOQmJNb3RBMDZJL242QUQ2em04WW1Q?=
 =?utf-8?B?aTVOdGFTcjF5UHZSQnlNSEVPbU5Ccy8yY084a0pRNEcyaGtoaHZZNTNsVlhN?=
 =?utf-8?B?dFQrT3hrcE0ybXFIeERnNG1OL0xUMWxydzRZenExWWVnZ3R0N2RlQmRpN0Fx?=
 =?utf-8?Q?B/DyFjMfkp90Xo9XIL9s0cPjZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb95b887-7b3c-4503-277b-08dbd3b3d87a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 10:35:58.8511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: laleGEVMqyFdlJPdil6LxgCdhZIn0XV1ujyXUPXZtVFTgJ0TFpzWkFYkhotF5vJLKhTyYDkQKz6gn9Qc564BMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7669

On 23.10.2023 12:12, Oleksii wrote:
> On Thu, 2023-10-19 at 11:14 +0200, Jan Beulich wrote:
>> On 14.09.2023 16:56, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/include/asm-generic/device.h
>>> @@ -0,0 +1,65 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +#ifndef __ASM_GENERIC_DEVICE_H__
>>> +#define __ASM_GENERIC_DEVICE_H__
>>> +
>>> +struct dt_device_node;
>>> +
>>> +enum device_type
>>> +{
>>> +    DEV_DT,
>>> +    DEV_PCI,
>>> +};
>>
>> Are both of these really generic?
>>
>>> +struct device {
>>> +    enum device_type type;
>>> +#ifdef CONFIG_HAS_DEVICE_TREE
>>> +    struct dt_device_node *of_node; /* Used by drivers imported
>>> from Linux */
>>> +#endif
>>> +};
>>> +
>>> +enum device_class
>>> +{
>>> +    DEVICE_SERIAL,
>>> +    DEVICE_IOMMU,
>>> +    DEVICE_GIC,
>>
>> This one certainly is Arm-specific.
> Yes, but the definition of GIC sounds common, so I decided to leave it.
> But it can be changed.
> 
>>
>>> +    DEVICE_PCI_HOSTBRIDGE,
>>
>> And this one's PCI-specific.
>>
>> Overall same question as before: Are you expecting that RISC-V is
>> going to
>> get away without a customized header? I wouldn't think so.
> At least right now, I am using the same header device.h as in ARM,

Are you? I just double checked, and I can't see yours matching theirs.
First example of a difference is them having struct dev_archdata.

Jan

> and
> there wasn't a need for a customized version of the header.
> 
> ~ Oleksii
> 


