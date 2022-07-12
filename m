Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9EF571CCD
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jul 2022 16:34:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365764.596091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBGy4-0001ly-Af; Tue, 12 Jul 2022 14:34:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365764.596091; Tue, 12 Jul 2022 14:34:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBGy4-0001ju-7j; Tue, 12 Jul 2022 14:34:28 +0000
Received: by outflank-mailman (input) for mailman id 365764;
 Tue, 12 Jul 2022 14:34:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n9Yz=XR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oBGy2-0001jo-U0
 for xen-devel@lists.xenproject.org; Tue, 12 Jul 2022 14:34:26 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50056.outbound.protection.outlook.com [40.107.5.56])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8d1baab-01ef-11ed-924f-1f966e50362f;
 Tue, 12 Jul 2022 16:34:23 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR04MB3049.eurprd04.prod.outlook.com (2603:10a6:7:18::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Tue, 12 Jul
 2022 14:34:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.025; Tue, 12 Jul 2022
 14:34:22 +0000
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
X-Inumbo-ID: b8d1baab-01ef-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lHvRRJ6reAYX61sG4F8u8llbd1VSS4/uljXaaiaXxtoeu9FOJxHRy2jfodwebqraH1Z/bWiOz8PwREOZ+7CikCoDaG3z69HeluWXJNQUH/4UFrOvvj4iCEY58mQu+zbdZqm3q+aKI7W5paXei/AuaEBqZ7pDmlqO9OfG2TGaC7nStch51TPtZAp586q/HlCuFsPJXM7fCHkRozrZ/ju9I9v1zp86m9jpEqxhSo84ctVdzcANN6RgH+Os1NklzSqvtx2GYf2jg5ggjR5DBfNLsCEm6pLk1iy2AfLwWDvRUPSoDRra0oSfmCoXp/VFSfpTnF9JMQnPp+jo9yYwzmHqRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1UQmCyms89YdEei4/5r4TKQHX9dwAudCy+K65B1AbcM=;
 b=EqGoLlKbItvTf+1sIBOPMBXwkO4SkMvVsJFgRanHK+bE3A/aHEISi0En8nUq64prB7XyE2nULJi1daftZ+4Kd1jYIdIVV5jOFzfkVd3QW98wWSCPBw6FRBE0385mxXF8aB/yQ8NOp8iqpDSt70y1l4HwSLHh1RPT+a1vracVb10LOBTlNVvGrvliUKwSrgelptBuqd3MawbDQWHlgMzxUukrQZ1nbgY3L41Gl2A8EKbSNitOPn7NnFaAczmiidbf3RHl/1U5kGO2JBVOJ5ctTkcyzJcaUh5oaF0rdHi33d5XXYeT20g6eO+HyuTpHFZLc6Ybt+kgDib+q8q1YkuzbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1UQmCyms89YdEei4/5r4TKQHX9dwAudCy+K65B1AbcM=;
 b=qo2pAcYrHVScbrkoiIrD0PO8+dh4JIJLjZ2zCv1dSVcO2U8Xg6fDExSGqsosFESmu/LsCLmIQ0OHE/u7iCPG134c7E6VQOscWb/RZTCJKLNCLWfie4sXelwDcbgGj+PKrhPXxjNJ1UCSBEiQUnmsOOdJkN20TBuM0XN5bqK34jc4iD2iu/Pxuj9gbJyIYq6Vo5R4QVylkdBXDE3+SYbEg0NPwNTxvvoBZCMSzU9/fYXmFDHPotjkbusuiwOe7KCQfenQgrkf0htTwn2uOVq+POTqRwM/ovHpTTwZy/0ST+/LXATBS203/qUCqKK37erXHyLfZd6c/uk6NCscdD4CNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b7d914bc-a2d7-d12e-15ac-ae7389d8bcd2@suse.com>
Date: Tue, 12 Jul 2022 16:34:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 9/9] xen: introduce a Kconfig option to configure NUMA
 nodes number
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220708145424.1848572-1-wei.chen@arm.com>
 <20220708145424.1848572-10-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220708145424.1848572-10-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68430275-24de-4d65-a86a-08da64139ce7
X-MS-TrafficTypeDiagnostic: HE1PR04MB3049:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Gb3UnUD59GsiwMbreUkqvR2lT+QSvw+tyTvxiT/UTjrsLtFjQE1AxNHw8hBC+fm5F0gWF0HL08WAhvjzxY8lHASvJtdFInEUaZrYgejrVUd4i4R6vW5i2PDvkq9MF9zspUtm+kkNwHshcHrQWYWBDLWP70B9w2cASciH7KOrQfSdGbkugIdU3sE+twwYUFvZMJHIZjdPNS7WmsLx4zQmrsK+V4tf9VFYBUL6aloPxbvhGk5QsE2qUgVUcb0fvFZwokcZ9kckRnLv5xTTlmZ7RzL8x3AkOU01ASMWlK3Ekxt+r7Ai1khYmno69mXOBr5DtY6UUTtm9wLY/q9Oe/xXifkC+BV6Dm4DHaHrBKTgyHH/29GZFFps6CL81xigGOe1JNXEMEtz/2eINRtlwQyFkEAVQFIKIsMYX9mqeye5m1DIVp3It3T1pDi/bhSe77NrDmDKNuPfjcSpK8k/kPbVh8DXPomyVfqKhooBC0yhSL5Trfk5+BBpnWJOwPYBjbjrjV9D71PqTFpBcVf9o0ofUIp4FK3HTJfONROh7T3GL+eRWom0ByTaT8QyqYecybHuO0sliMEE8MxQVJjsyktxYceX73l4AkPPiCwwWySmpAg9kTg4xW1TrFg5ga3pFN/KnAdR5ZDdBPR94CiOdkarZRzcwndXkzCyFQT7CH9KSAdYTXsrv0YiV5WOY4QtK4xOrEJOG0VUo5RSUafWvhChLRPDKz6fqfag9uwJgC+xkeZqK0Yz0IOqMchy2wHtky6V70PEy2etRPMDup/2mr2uC+n61qXSYuaXQKOji/G1GaImRJOPeSjVyaeDC5kLnBkaRTS6e568IMJXVsaK8bBB9puuLHJqIZU41bKRra3wx6k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(376002)(39860400002)(346002)(396003)(6506007)(86362001)(38100700002)(6512007)(41300700001)(66946007)(4326008)(8676002)(31696002)(36756003)(31686004)(66476007)(2906002)(66556008)(316002)(478600001)(186003)(26005)(54906003)(8936002)(6916009)(53546011)(5660300002)(2616005)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGY1b1UyZjZNeGpWMU5SM1QxeE5NMFVEQXhEMzJWZVUyT2dQM0xlWU0vZUYw?=
 =?utf-8?B?Z0R0TXRGOUQ4VVBqUWY5VG1FcWJWK0x1K3hGbzdRTFV4RmtuRUdrcHc2UlQ5?=
 =?utf-8?B?TFlNaXNTODN0dXUxdytIaDFrZmlXUFBaSEs2NnBHNkRYUEkxMHAweW1JR0ts?=
 =?utf-8?B?NkttQ0h2TWFZM1d5eEVMbEZLZ3FhVTRrR2I3VmV0WU5nVi85UHl4M0sxMms0?=
 =?utf-8?B?S2l2bTNhbFphL3V3cnh6WlBFdnVjYmNCbTFOWEpuVGFUL0FmVFlNdFpEdndH?=
 =?utf-8?B?eHFXbUhMcHhPZlJ2bExKaTZNRGZJYnBoQUZvQlV5NE83VCtlbnRwVXlNdk9k?=
 =?utf-8?B?M1AzRzlDUThLWmIwaitmMUNtZ3JMbEpsQWlyODU5dzIzVlYwNlhsU0E0cDJY?=
 =?utf-8?B?enhscUxIZ2hFNW1JbEVMZFJFazl3Mkw1R0F4WmZ5bVZXaFpyVStmUkhGUEtB?=
 =?utf-8?B?L05EbitDWVEyRnFJeHQzd1o5RDI4ZlVZeG9aOEt5aE9wZXViNEU5SWZCMWRE?=
 =?utf-8?B?UndiZDRyeFJ4QVh2R2hSQ01BeDlxdFlFUHZmVWRNSG1RVjdWQ0o2aHNQVnZU?=
 =?utf-8?B?aEczVmFLOTYyRkxOamlrUHI4cGNhTnFlWmd6YjJyeW5yZ3FaejdYdFNESlNy?=
 =?utf-8?B?VUZlNkQ0Q3dUWU5sbUJpZi9pcm1ET0Z0MWg0QW1MVWJHTWJMMFZrc1lwdkg2?=
 =?utf-8?B?WFAwYVg2U1RZM0tRbWM2T2NmYUtRejkxZVozdkx1WUV1eXBNNXlDdFB5MXBH?=
 =?utf-8?B?QXJkWFJ2aFl1QXdLVnhHV0lvRURSQk5EalUwVTA1bW1YS2FaWkthczZBQ2Nj?=
 =?utf-8?B?VnJMSGIyby9pY0pIS2lGVXNMUEhoVjhZMWZ1cVJpOXB2ZzZRTDNvUERDQWNz?=
 =?utf-8?B?bGdaaERIUkpaUFJDN3RxTnQ1NWZJUFpXSXlUeWVOS1FSb1RIUmIvS2lkYSsz?=
 =?utf-8?B?SG1KakZxZ29UVklGSUZCaWVCaGcxK2oyRXd1UmJEL25MVk1kV1B2K056Tm1v?=
 =?utf-8?B?dml5VHZaTEdhU0xWQkx0ekVZaFh5WG9ZOStaQzZYNmd2bEpKSWtydnZPRGZz?=
 =?utf-8?B?L3orWC9KUTNKU1dLK2M4M0hqYmFKSjVsTWNDUTI0UnVNbmUraWIyVGNYcWNH?=
 =?utf-8?B?alAyVzIrcEgrUEUvSWFrWmg1d1NvYkZ4ZGFHZ2tYZmZ0RGI1NXRJemFMa250?=
 =?utf-8?B?Si9FeWlzdzZ2WkYzOU1FaFBCSWg3U0FIMUxtSUFXaWI1K3pnRzRiS1FGeWRz?=
 =?utf-8?B?ZWdJRVdPK2tadzkvcTR3NzU2dm1CNmFoU05BVmd6dnNHS2E0S0lVeXpBZHVz?=
 =?utf-8?B?eFFoV0Zpc3VNZ2hYanI3YVkwcHp6R0s0b3pBUFV1KzE0eUhKOEFOQkhZVGN2?=
 =?utf-8?B?VTd4dDc3OVRLdVYydDFPNzF3MTRhc3V5cDk5M2dmZWhCWWNJZmJCVjNWNGVW?=
 =?utf-8?B?RTFGMW5naGlwejlZY3BqcVVTaVZoU2NldlhZL00vTnlvOVo3S3kvOW8xZGd3?=
 =?utf-8?B?T0NuQ3pCVWcyOVRUdTY0NDMwU2pLWVVmZEVmM0RBN3lOb01yMUxJeTJ1V0Nt?=
 =?utf-8?B?UEV5eE5MZTJYRlhDMUdhc3Yxa2ZINkdlNTR6Y0Vpa3RSTFg1bE5qb3BrVzFP?=
 =?utf-8?B?eUZOS0NJd0NGYzBpcCtEVERaZkZMWGZndVpreFhBcnc0dWp6VmY4QkNFYTBG?=
 =?utf-8?B?VmdGdXZ1cUZ2b29RYXVrTXRLblQ0REMyclJNMWFNQXBidlhuejN0U1ZIVFhs?=
 =?utf-8?B?L0w0L2ZtVmdmZG50cjlpMVNJdEpjMkhKbDczV25sdEFxVHhxVlN3RXp3Z29y?=
 =?utf-8?B?TS9kcmdJSTIrUFladnNVV1U4bjh4QzdiNXJEaUxqZmoxczhSYkxDd1Y0TFlV?=
 =?utf-8?B?dWw1TWNUcnMyK0xINFhzTW81c1QzeENQNkF2UW9odk9RZWY0SGRodUx4UVpI?=
 =?utf-8?B?VGtpZVJmTW1lV3V4N0xtaERCZU1LVWxnZ3gzbzh4OWlHVWlOQVR3bVNjZ25J?=
 =?utf-8?B?REFRa2w2cTBubm5sdjVXN2lGdlNVNmhJS2lNdDE1TjdBalErSmw4OGwxQXFD?=
 =?utf-8?B?VCtVdGFKdTd2dG1Ebk5qcnJrNkdTVWpSSTZpVWFEdERyTmtFSXBjSHZQcnVi?=
 =?utf-8?Q?CZ1hqMA5fxvGTdwaOR3L5Ngo5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68430275-24de-4d65-a86a-08da64139ce7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 14:34:22.7336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mQazVShEXzXhmWoyRcFusnEufw9CSgkr8UExHP4ltDhkwbLagF0wwrf5cgdMHadK1EYlkzaImyTgfCfiVOXu8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3049

On 08.07.2022 16:54, Wei Chen wrote:
> --- a/xen/arch/Kconfig
> +++ b/xen/arch/Kconfig
> @@ -17,3 +17,14 @@ config NR_CPUS
>  	  For CPU cores which support Simultaneous Multi-Threading or similar
>  	  technologies, this the number of logical threads which Xen will
>  	  support.
> +
> +config NR_NUMA_NODES
> +	int "Maximum number of NUMA nodes supported"
> +	range 1 255
> +	default "64"
> +	depends on NUMA

Does 1 make sense? That's not going to be NUMA then, I would say.

Does the value being (perhaps far) larger than NR_CPUS make sense?

Why does the range end at a not-power-of-2 value? (I was actually
going to suggest to have a shift value specified here, until
spotting that NODES_SHIFT isn't used anywhere else, and hence
you're rightfully deleting it.)

> +	help
> +	  Controls the build-time size of various arrays and bitmaps
> +	  associated with multiple-nodes management. It is the upper bound of
> +	  the number of NUMA nodes that the scheduler, memory allocation and
> +          other NUMA-aware components can handle.

Nit: indentation.

Jan

