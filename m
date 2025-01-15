Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEC5A123B2
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 13:24:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872427.1283392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY2RE-00065b-8i; Wed, 15 Jan 2025 12:24:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872427.1283392; Wed, 15 Jan 2025 12:24:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY2RE-00063c-62; Wed, 15 Jan 2025 12:24:00 +0000
Received: by outflank-mailman (input) for mailman id 872427;
 Wed, 15 Jan 2025 12:23:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SR+c=UH=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tY2RC-00063W-Bu
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 12:23:58 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20615.outbound.protection.outlook.com
 [2a01:111:f403:2418::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9722d257-d33b-11ef-a0e1-8be0dac302b0;
 Wed, 15 Jan 2025 13:23:56 +0100 (CET)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by CY5PR12MB6600.namprd12.prod.outlook.com (2603:10b6:930:40::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 12:23:53 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%6]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 12:23:52 +0000
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
X-Inumbo-ID: 9722d257-d33b-11ef-a0e1-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jdxVbm6IXvzzegzMjHAZzyBPpxVyE7u3QV/J5SW6NjRCt99hH25JMPxBmn6+fFEHZIfyUKchoA0/03v9budkLHBZ7ctnoCozR9+0AEbo66yil0ge+f658Itnqm3DSSSJrDRYvtQpDYogWHppzlr3jD/Td72YNUDYz+/Y0WIRkvWKS5qzoyOkgoACbsT43WOUep2XqJ5CaYlHSz/RVnu76bKYu82Lhf6lB0GjYNJFgpwd990hKZ7p1ewB7mSThh0xbXaaz2Bw1BxmBYbvmniI5DhBVoQWRhgZ3IUZ3tjHygLaas5HMx9/fkyVIS04D0+UcEIAVbSyOEGL4K/iUcaNSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BAgF3iUkqDSJ+A2tIPb5Cz9QL1wgJdBbdt94dBXwqMg=;
 b=bfRCRKVLki8iAE9vy6yOdXdkmCA0Yj/Dbmihev2wZsWpZWOWgNhrRU2Ybocvwm/QC2H437megySencfp30R/mlxa7lqboO0Vgc4gZsnfXtdS2oV9GM7TY0KV79A+yoZBkHKMMowFxCdwj/4hICKxSf6wOskJHNVfFhLLhE19RS6dMSjAaM7u+khVOvfHanIcOsjBvZu8B7Npjn8Bt+jzWvYVa/odB4FP9cZDpISH+Vyl+1XKEWy54Euf+iAkE3gBog3dpNgtSSp5EUGdVzRMvsDqdMxJVT6U4eiwOwn2Qymy4Kko3em9Ze/pn/mU8hVMzqN3qmNRLlfa5EgP4RQZEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BAgF3iUkqDSJ+A2tIPb5Cz9QL1wgJdBbdt94dBXwqMg=;
 b=5KGmh5f5AblFEj3wtYHzutt3tZKm2qF80i6oF4GVirNFHjrCzm8z4I1C8MzR9W6nLw+SxmY+oJO2GYyzaCmne8EKc+gQo1VcVOu5Ud2LAxf1VlsS3aLxm41HsBUI09jxWAuBdcYH9lcRxLpVjdiZATSZP4jjThsXN0NWrFv4Kog=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <57ab92fc-b1cf-4966-8794-cac8df8ce25e@amd.com>
Date: Wed, 15 Jan 2025 12:23:47 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] docs: fusa: Define the requirements for
 XEN_VERSION hypercall.
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Artem Mygaiev <artem_mygaiev@epam.com>
References: <20250114195010.3409094-1-ayan.kumar.halder@amd.com>
 <9653ccc0-203a-4bec-ba79-57870ed08ea0@citrix.com>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <9653ccc0-203a-4bec-ba79-57870ed08ea0@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB8PR04CA0029.eurprd04.prod.outlook.com
 (2603:10a6:10:110::39) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|CY5PR12MB6600:EE_
X-MS-Office365-Filtering-Correlation-Id: da7c516c-9f71-4ffe-9112-08dd355f78c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RXp2S0JES2tkcU55N1FIWmQ0L3F6bDVpR3BEQU9ZajhzQm9STlhCNkY5SXZF?=
 =?utf-8?B?NE0ydXJrRjRjRHdBc0REQ1pmQ1VhajdPanc4RVgyQkZBRm02eVNsMXB6Zy82?=
 =?utf-8?B?WllyRXFtcFI3OVcrdWw4dG5DeERCVzI0ajMzOEdMN0VQY2N2QkxKRU96YWdV?=
 =?utf-8?B?T1NzcSt6ZFhsUnEyT3ZrSGgzMGFwUDczUXZLK1hZQWE4endkb283MFBibjFP?=
 =?utf-8?B?UFU5a2RrWVR6NTg4TmJtWTRKcTdJS2oyQ2VNb2N0WVJhV1BnbkIwazY2UHlB?=
 =?utf-8?B?VzZJUkZKYUtrSCtJQ21wWU5GRGxydndiUW1oZUdocllWUUtma2xUbDRYV1pV?=
 =?utf-8?B?LzJ5MUZkNll5cXR2WG0zdHp4d3RtMXViT0w5WmxGWkp6U3Q5MGpXcytFcjRZ?=
 =?utf-8?B?cnoxcDB4QVBBTy9ab0poTDIwM2RZS0xjTU1pYjJ1NVhadzhSL0k0SHhwSm9T?=
 =?utf-8?B?cGkyUkhocSs4RnN3K1VpbEx0UDl5ME5tTFdyRWREN2ZYWThabHpuUzg1bFFX?=
 =?utf-8?B?d0ZyUG9wbXFNWll4cUZPcXowdmYxVExhMGZTdWtaOUo1VTIwNE5jUkVGYVh3?=
 =?utf-8?B?MDFIYnV1ZkdobkMvb1BvcHQ0bVRucDVUU3gvNXJkMU5OaFowR3FWV0ZidGpD?=
 =?utf-8?B?cW5sMUkzQitDUGU2Z2x4eGRmTWw2SnIzRnJaWW9CVXBwcURaTEMxTEVpRnd4?=
 =?utf-8?B?Zzlmejcrd2tqdnJrWU5ZeWNtVEswZFIyemkzenRJMkh5YjAzampBdSsvL2Zy?=
 =?utf-8?B?WFdmc204VmY1SDNLMk1XQ1FEcDJXZnI5R05oQ3h3VUUrV093b2NUclFZZFN2?=
 =?utf-8?B?bHJjTzBEVjMxSVB1bkwvdVBTRlNQdE43aVp6R3JsKzZ1N3lqa09VTXo5Zi9z?=
 =?utf-8?B?ejFRTzNGK09kRGdaM3pQYnNPQ2ZreXYvMmIvR0tnVi84ZlhvRUZkcW9FTTMy?=
 =?utf-8?B?TEVaZjBxV1hZa0Z4Z3RYWlhOYWp3NldlUlhHdlArMCtxTG55bGtWTDlXWnJa?=
 =?utf-8?B?VWlOS1dpS1BOWlk5UDh1K3I4MGEyK2ZqME8wQjRIdzRKRS95akduVEY4R2JV?=
 =?utf-8?B?ZXM5RDNPQTVYdzZPdUlUUnVBbTN4a254YnZacGFwRWo5OHlzaVJ2MHprUVFG?=
 =?utf-8?B?a1I2T2VWUnd2dXFGNEcvZzJrN3l6b3VXU09XQXVzVEZoazgzeEdCWjJmb1VH?=
 =?utf-8?B?T3daSW5iV0s5eWg1YUJiK2lwS0tZa3g5WjJwQXZXVXMya3JYL3dUak95bmU1?=
 =?utf-8?B?ZXc4T3FoeEpRZVhYSHpGMWdPS2JGUFhTbUtGVE1LT05vSlJCYlhOTnluUzM2?=
 =?utf-8?B?MWQ5cmRTVFpPR1MrM3NZTCtCdjFvUk9xV2crdngzeFRlMU5MMjdsWnJGRHd1?=
 =?utf-8?B?MXVjUUN2alVtaFFocVk1NWZXZWZYN1dRbXBnL2RnVW9jbSttYUg5Uk5HY1pH?=
 =?utf-8?B?a3VpTTRGeUlHbDZoZ2JHN3NSeTlubWp3bmNUQ2ZlV1VzRkFuVzZpc1NmSC9G?=
 =?utf-8?B?NjB0T2lkdUJqc21rVGwybVNIa2ZrWk05WWxRZ0lNNlZtd2RubjFSc0xEY3FQ?=
 =?utf-8?B?OStoN21SZk50WVBxc2ZnMDFhWVhIRXl5dXN5aWt3dlBDb0RpWWZZNVJaZUQr?=
 =?utf-8?B?amU3T1BMdm5RRG1ab1k3bkc5SXc4citVenZJRkJMVFl1QktVMnVKZjNKakM3?=
 =?utf-8?B?OGoxekl0RGpyNEd4V3BIWitSOTVyUnY1V3RLOGU4V2xQY3NMem5maG04WkE0?=
 =?utf-8?B?Zy9jUXAzODdINExmRmF2Wmd3N3dQcFQ1MjE4NHRPQ2VoeXNDVGJPT0QwVmd2?=
 =?utf-8?B?M2JpTTRDZXJuZ2hJLzV6dz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEpQRzZ3ejNHeVQ3T3ZUZDdPb1lxTDdUVGZnMFkwY3Y2YzJHNjJLdFM2YzFz?=
 =?utf-8?B?YkplaXlXaVFnQnI5MUtwOHdQbU9jTkJYYUJDNGplaDVLcmt0MW1BVkdtUVM3?=
 =?utf-8?B?bnk4U09tWU1tSGpNd1hSSzFxUFB4VGgxWGwybkJOcFhXTWdubXJFZ1Q1UzR4?=
 =?utf-8?B?UE83Y3RRaTYycStvNlpPbjJXV0tyQ2NBNFBQZE90TlFaSk8xS3JCd3JoUkpK?=
 =?utf-8?B?NHQxM3JGNi8ydlE5ZkFodTh2QmZ3TjlIWm5oY2NiWG80ZVBybDBvVWtnV2xo?=
 =?utf-8?B?M2RUSnJ6ZHBoRjJocmlsUENhS0hmOGcwUVl1dG9LYzFSY1gzdndBcm9tUFFU?=
 =?utf-8?B?WElpYmIrbVNXTGlFTVNSMlJBQWxvdHVOZEZNYzRLczJTeFVRdGlPOEV0d0xz?=
 =?utf-8?B?NXdLSzZlVmZhTDB5cDBpdHBIR0ROY2E2NEFPVlF0ZHNlTkVocDBKL0tKYk8y?=
 =?utf-8?B?bXlSOXZoS0NQY3dsSytHZ0lYR0JVTG1ZY0EzUDA5NDVmQzFTbGNLMEdZNlRp?=
 =?utf-8?B?QTRjWUVuV0RBTkd6akh0bk1zM2ViMnJtWmtRSnpWK0NmRG9JdDJya09vZlV5?=
 =?utf-8?B?SDhmUURNUCtUaEdhYVZWZmZ4ZnlDRmVyYXZGMEVHbWFIZUhaLzlDZG5wZyt4?=
 =?utf-8?B?eE9sZXp3N1Zib2l0YXJaNFdPdTdzUGJuMVA0TlhhRXVPYk1BaytHL3lTcGZM?=
 =?utf-8?B?cStzS2xZenNyZVBUZ2txNWdNSUJzdndMb0RFbGRVSUR3eGd0a0UvTFEwR0NI?=
 =?utf-8?B?VTJDdzNIWndxSTVzMmtpUjFIUGJmTDFSaGM0eDhnUVJCSDY3T2VUM1pnSC9U?=
 =?utf-8?B?UkNnTEtUV2Y1ZExuek96ZkJwcldpb3g2b2x3MUNWczdpYnNjcUlHMGNNbXpr?=
 =?utf-8?B?QlVuanV5SysrazRKY1FmNi9FdHlSbE0xREtqTERhWlhuMkpoanJOL0VVa2wr?=
 =?utf-8?B?V0VBMVhIZDJ1RXN3SDRUTVh0QmRHUll4T25jNGh2ZFh5dTFiajhIQ1BEOTBE?=
 =?utf-8?B?Z2Z1anhLWDNLOUJHSEZkcmhZZ0o4NWdKbExSWUFRTktPbjc2bjVIeUdkWGFB?=
 =?utf-8?B?OWo5QUlsSG4wTHZZeC85bkFIV2pOVFVKdXV1bENPd1hxWjVSR1h1RTNKMXJF?=
 =?utf-8?B?aUpzQWREbmNmcUNHMmdiTXMzeGRWOFZ3aGZ1UGFwRHF2bUZGM2tGcGFsUHFK?=
 =?utf-8?B?ZXFEd2VybTBkSzFtZGM1bGZIbjZUendtQUtNMkY1aUJDaFAxUFI0OGU2NnJt?=
 =?utf-8?B?cE1tQk8remorTWdVL2xwZlA5OHdKTTZFdWtsYkRrVHJDZURTMWo0TGozSlEz?=
 =?utf-8?B?SjlsUjB5ZFg3MG5JM3V4RHNqNjBFa2M0RW1qMjBnc2JDRFZwb0x3ZUJKVjJ3?=
 =?utf-8?B?VzNGN1JGWjJNNERJbnoyMTZJYU44b1FzTmhtWHFiSTlENldZTWhUYkFxODBY?=
 =?utf-8?B?SGhmNkNhbzVMUzZWQnNma3VyN1BUWjdBaUptQThhWVV4dng0OG9PT3lJbjFu?=
 =?utf-8?B?SGZyS3BKa1NvZWVldkN4OEVaQ2srSkpRKzZ4SG1HRjZVd0dLZmxxVXY1bEp0?=
 =?utf-8?B?b0tPak1BYlBUbjJHRHg2Rm1VVkYwa1htTXVZL0kyU2J5aUFSTVlUeW5TL3My?=
 =?utf-8?B?Qk03aDBGa1NSQVgvRlFXZE0vN1Z5VDNRMnNNMDBTb1p1N1Q5Tzh1eWFHNkVE?=
 =?utf-8?B?YjM2OUIyN08rNHhWbmFSQ000K2RheXQ4YjRGa3lManV6cHNHMXlWcUFKQVhX?=
 =?utf-8?B?VElwUHRKSmNrZlplRFgrRXdZa0NTUlY1ZXlPTEoxd2Y5VG93ckQ1UmVLTUJi?=
 =?utf-8?B?azVNVjRZdVFCVnZ6dzlzOW1Yd00ycmNneDB2TG1VQnNvWDVsVXp3UVJ6eW1k?=
 =?utf-8?B?TGNxWjljMGxMNVlCSmRQeE9oaVlGNHBkWmU0U1oyeWVTS2pvaC9lbmgxaTBl?=
 =?utf-8?B?OTMwVVNVZGVwMDB3eC9Ha3NKTnBWUWw5OE56RWlRVDhNeGEvRHFsNjNkSlJt?=
 =?utf-8?B?ck1odmkzdFVKZThhSkp2RlM4eDR2b093ZldIVWtsSEJ0d3lwRC9LOG5reG9k?=
 =?utf-8?B?dDEzRitMMmxvMGxyK1REZHpncWpxV2pXVXhLYzltaFRkVUk0OWpqZUloanFV?=
 =?utf-8?Q?RcvYp0BvfMRKZ2XGGLTFv/LoN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da7c516c-9f71-4ffe-9112-08dd355f78c6
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 12:23:52.3153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p5jymNJJDGfLzlFUV1WSQAuVbY37J7uUCwyrQ076KuSDj02p4mlcDzuvt4Nr2JchQM3eAjQhlOowyem14C37ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6600

Hi Andrew,

On 14/01/2025 20:15, Andrew Cooper wrote:
> On 14/01/2025 7:50 pm, Ayan Kumar Halder wrote:
>> diff --git a/docs/fusa/reqs/product-reqs/version_hypercall.rst b/docs/fusa/reqs/product-reqs/version_hypercall.rst
>> new file mode 100644
>> index 0000000000..fdb8da04e1
>> --- /dev/null
>> +++ b/docs/fusa/reqs/product-reqs/version_hypercall.rst
>> @@ -0,0 +1,61 @@
>> +Return Value
>> +------------
>> +
>> +`XenProd~version_hyp_ret_val~1`
>> +
>> +Description:
>> +Xen shall return 0 in case of success or one of the error codes as defined in
>> +https://man7.org/linux/man-pages/man3/errno.3.html.
> Xen's errors live in public/errno.h
Ack.
>
> They share a lot in common with Linux (for historical reasons), but they
> are critically not Linux errnos because Xen supports OSes which aren't
> Linux.  xenstored for example sends errors as text rather than numbers.
>
> Also, that's not the return value ABI of __HYPERVISOR_xen_version.  Some
> subops return a positive value instead of 0 on success.

Yes, my bad. 'XENVER_version' cmd will return the actual version number 
on success. I should reword this as

"Xen shall use the error codes defined in xen/include/public/errno.h , 
as a return value in case of failure."

And a separate requirement will be

"Xen shall return a non negative value in case of success."

Let me know if this sounds ok.

>
> And if you're wondering "hey, isn't that ambiguous in extreme cases",
> yes it is.  Xen's hypercall API/ABI are a disaster.

Ack. :)

- Ayan

>
> ~Andrew

