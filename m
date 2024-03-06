Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BBF87336F
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 11:01:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689021.1073922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rho5Z-0004FR-1B; Wed, 06 Mar 2024 10:01:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689021.1073922; Wed, 06 Mar 2024 10:01:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rho5Y-0004Cj-Uk; Wed, 06 Mar 2024 10:01:28 +0000
Received: by outflank-mailman (input) for mailman id 689021;
 Wed, 06 Mar 2024 10:01:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8L2d=KM=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1rho5X-0004CO-2E
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 10:01:27 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20613.outbound.protection.outlook.com
 [2a01:111:f400:7e88::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d2f18f2-dba0-11ee-a1ee-f123f15fe8a2;
 Wed, 06 Mar 2024 11:01:24 +0100 (CET)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by DM4PR12MB7766.namprd12.prod.outlook.com (2603:10b6:8:101::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Wed, 6 Mar
 2024 10:01:21 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::32a0:32b6:d5af:9ad0]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::32a0:32b6:d5af:9ad0%5]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 10:01:21 +0000
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
X-Inumbo-ID: 7d2f18f2-dba0-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KYIyOovGYcGEq4o3TmvJ2ym3tDLIKVa5EAKV7RHTffktys+fnFrE2pIHpynw9mab2BOTc1RY+gKYbL5Eq1HYt3ZwigpLUEcOj8zFz5EDs+vzGQXxpQZcMk+3YxC9E5eySf35g2XPaFJ1L6CM6Q2Fv5hk/wb0dwovoK/LRYdCNaD6y/wgjcKJDe4KkofaJ4XcJ/xglLp4IGbKw1Q8loPyYZkA5MLfha5oHWbrTdkXRP4TzLEfnB30PAIwhbDkr9m68aSRJpDCBqJTMQtG1MZrZh1NzwXVWAvxozhn2WdkLAckWBABHZUjkZ9V4GXC2rdjcO5WSKfnYHNa8YhsixIfZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oBhK/IB2GdsV13+WxPlXSYI7heqkoszeKiJGK1lctL4=;
 b=XW9m8S3Z9o/Vhvhch03GMi4s2+KIS9nJefCji5AUWJS6u0daJaVYvJqbg/ZwOECgQpJDOQtle1/wbpvX3V2JOmm7lzIswFIxQ47TB3iyVj2tbJHfDPl0lyV7bg9Vo+BbDza3PNziJ84QYn15bqg2ocPyKHPcJWbtR4fLeprAinVGDbwP+D5T1Dn5ZOdyjkBWnYrRIBmJ717ZVRfJ9PvmSQ2gSCny0JgObJIIqCkqfoYkCzPagOblu4HYw64+AlU1zDcDZeWQW1dhCSvNA0oazZcgv0g0FLXX06BihxJt4iCunt9Zjp1upj2miJp9BcTobX9furMUBznV/UpMszCPXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oBhK/IB2GdsV13+WxPlXSYI7heqkoszeKiJGK1lctL4=;
 b=s2NttSzsHTqObaLytmPhwPPpWVG0rjFYTRfQ5M9DM3tbELKVVZ9lT6dz9uVwnADIuiQCPoV+DGLJU5iWtm/nulGOb5towUiGQsT+d1Whm7+b5DnaFiLrmlcME9VHFexGVNxbV/tvDTE74pq3Mx3bNLjPowGcqBmQTYLvqLPQz5Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <5f751e78-de85-469a-9a01-ddde0ebd1db6@amd.com>
Date: Wed, 6 Mar 2024 10:01:16 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.19 release status tracking list [ March ]
To: Oleksii <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: committers@xenproject.org, community.manager@xenproject.org,
 Kelly Choi <kelly.choi@cloud.com>
References: <91cc3f76029357f34bd5ca21966c42f0acb73720.camel@gmail.com>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <91cc3f76029357f34bd5ca21966c42f0acb73720.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0378.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::30) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|DM4PR12MB7766:EE_
X-MS-Office365-Filtering-Correlation-Id: e725f417-28d5-487d-e1c4-08dc3dc45fab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jOvljIzDBP60qFCp2HIfy76YvJ6W99PFV9/vnfUyFujWTcUoY4wtmDHNqcPEGdpVT5gDDGRBZeFio1m6ruS1tLrnkGcr7g5yRyKHOn3iIqw8/uYyKpKQ3+1bxrmvaAPluwEIbUNA1SrfQ4jlqSu2ruU+ANV2wwyIVNeqcjk6gjE57ca14qKfN0Y064rQ2stwuEwVRTAuy5mzt/1Hm9HNlohEe9tkfcbTTRfIz/2VKt9XRh8F27UQAc4KMwkePHM2wy+Jvp3n4eWVlMx3xGUW0adJahVv3ivLM3BTrCH0EAS5+uTxGe73sL57rkU0b+9/pTz0WHXgI1L55vqSuyPW4Kb+tPoUXbDkBKslj/dmS/b9x6VEi08MGWyXhVXa0eOBbuxKIIinGY8z+l7+tTtXZqs/Lk+dajVR9nfTFw2ZIk2NGw/yicuT7jz7QmsEWtrDw97lzBxfXr4u30ZlKqIZxHlCshGTOf68NJdfEN/JWKn6NpRGHVbnBkbs7apxLExHvwzOBPPr/bbbKbDHMe8iiH0NlBlpQxwmvm8jspF4wywr0oLjxzAI43tcyj6r7mum3ddfUBzlXhe38g9m8Gcmk/XisnvReG0wI6CWbO6zyhYqWk1JrJ6C6PU3DlzpncSt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OU9HckpYSkZ4Vi8xQXZxZnVtZDJ4RmlFWVlKRWNHS0d0S3A2VnljaW1kZGhx?=
 =?utf-8?B?R1JtSUN2QklmL3ZiZzhhV0hmOHp2bXpmWVdxcHh1aFg3M1hCNlFjWlFDQ3RJ?=
 =?utf-8?B?WTZZbFJWNjBCRzBKVHlidDBSSjlkQUhLaE1wdFZidDZHazRvbkVEcVFNeGEw?=
 =?utf-8?B?Z28vcHhRVFNaWWJVcmwvYllsREdseDdzQzlsSERSRTlUVndZdXNHOUpnRG5G?=
 =?utf-8?B?TTRKL0UwaUIwV25nVnVEZGx6YThrZngvZUsyVmx3Y2NhbEd1NGhYRlVwQVQz?=
 =?utf-8?B?eURCWU9ZTVFqaGtVcXRHa2ZRd0sxUWJ2YUJnTlZjS1BOelFVZGdvTTJ2em05?=
 =?utf-8?B?ZDJhcHhmWWt1M2RJY1JLckx5UFdXdEVlY2lHR3RtY0QwTHlSVFdtWTJYYmxH?=
 =?utf-8?B?aHNRZ2I5UEJndHJUL1dOb0VpWlJXbkFFVGJYZkhjTGgxR05HZFZwNkw3eDl6?=
 =?utf-8?B?UTVrTU1QaEdlMXZWa0RGSU50N2IydmRwdjF2ODYxMUJIYU9ibnl1ZlppL216?=
 =?utf-8?B?ZnNwRks5SUpBZkFaMmJLdXdYYUpzQTdxNEdOMlVDb3VjOFNULzZoWS9kMDFL?=
 =?utf-8?B?TEErQnlkbTErb2xwN1M4aWpuNEU3UWg5ampuci9XWnZCRnNhS2Eyc1VjaUdC?=
 =?utf-8?B?MHhoQzA3aFVaOExqTXBaWE11UDd5ZllRUnN2L0pyeERGb2VCUUw0dGZFbElB?=
 =?utf-8?B?NURPbml6M0ZBSEhjYW52anZUb25UTjEwK3BVa0VzOVFjdkxYckNYT0FpS1lv?=
 =?utf-8?B?eTRWdHA3eWV1R3BRMzVxdk5td2lBRlZobDltbEd2ZGJhdmUzTG9udmtEdVF2?=
 =?utf-8?B?a2tLNlFrMVdlVkVSbHRpMC9jYlMrZUxjY2Z6VW50Y0NMR09qZGFabnBUb0Vq?=
 =?utf-8?B?LzQ0QkVZNjhEYUNmN3hDNkJxdFhnR2lkRllMR0F4N1VhZmtaWU44ZllkcFg0?=
 =?utf-8?B?VkxOUVI1bm45SHF2SzZxa2dZZzFXU3diNEVFVTg2Vk95bWpVU3lLUVZsT1RY?=
 =?utf-8?B?YlBReEhLc3N1aXFpbVdCQi93Q0UxbkRNYm5IRWwzT1d6RzVDUXRqd1RxRmVi?=
 =?utf-8?B?WjhFWXZ5aGZMNG5hOUpMSlg1aTUwV1hSMmhkeUhubENlcitXYkxPYS90cm9P?=
 =?utf-8?B?cFJyczU4dnhvSkFWUlRXd2d3bHg4RHk1d3lPV1N4RkRmVVRBQjlub01vbkN3?=
 =?utf-8?B?OThNaU1pS0J4Mko1ayttR2lZeEtUTTJuTnRCaWlyQzR3ekVRWDlEQ2g2U1VX?=
 =?utf-8?B?WkJzYUpYQUZaMSsrRzlpQUcrb0w0ZWhzQzk0NW1MQVJlZEI0MXBhRW83bXps?=
 =?utf-8?B?NEFKK3h1Z292Tmxqd1FPUk9PSk1ENlJyM3puQTNodmt1YWhhbmhtSlpHNk83?=
 =?utf-8?B?LzlZWFJmdnJPWC9lN0loODMzUWNtMkJ3MTNoeVNaTTRMaHdETTdkRS84V3di?=
 =?utf-8?B?ZUtVbDJaYXNBMXNOam1raVRFY3l3RENlZlE2bnMzcnRXTGZLYkt0cFNacmNh?=
 =?utf-8?B?N082UVlFTHBnRUpzUTFrTS90bTgwc2FzVVkvRHJwUGJPLzdEVG9IdGRISG9M?=
 =?utf-8?B?Zk4zTmFnaHVxM2I5OUdjRzV2ZzFSS2ZUdFlhb2N0Z3RxeVYrZVU3TXFnWEsw?=
 =?utf-8?B?ZGVVdzVnWmxNVjFDeFJ3TnVFdEExMWJJWXZTQndwYm5wQ2w3dmhyK3JKeS9J?=
 =?utf-8?B?OGV0cUc5cEcreFJXeS9scU1GMXpNS1ZiRzVFaUIzYmE5MUhSdHJYZmdaZGpQ?=
 =?utf-8?B?WU0yU29lRWVBc1AxUkpXWmMwbWo5bllMV2haK25tUndnSjQyMTc1aTRuOG1S?=
 =?utf-8?B?TUFWOTAwVEhhL2U0WG5jbWd0UTBTU0U2VW5nSlV5a0xYNDdDS1l1bHAxZ3V3?=
 =?utf-8?B?eWw0TWtxT1RPdzIwSzNKZ3JhdEw5S2ZVL2FPY1Vac0JaRlovMDhqaGhhcmpX?=
 =?utf-8?B?MnEva2EzeDI2MmwwR05yMkkwQjBPazZ5Z01MUGgxSURYMy8zSGxUTWNleW84?=
 =?utf-8?B?YW4rZGhPU0VMZnNVVStoTktEdEt1enFPUEhORDZzME5KUnVBcm9XSUp4dFlp?=
 =?utf-8?B?MGhpc1VLU2ZaREc1VHBlT0pUMlRnOExuRGVGOEw3bnVPaWFNa082K245OGFT?=
 =?utf-8?Q?EWmfDcMbZTN2JvN5/Khn7wrvP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e725f417-28d5-487d-e1c4-08dc3dc45fab
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 10:01:20.9773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TJ8XAwqHI7I4N54flGtywS76j88WPNnKYk8JfUtZv9pzdvFJOMmDfABXT19nB8p5zNuMGyA9hMxdznPxMCKTQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7766


On 01/03/2024 17:21, Oleksii wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> Hello everyone,

Hi Oleksii,

Greetings

>
> I would like to share with you a list for status tracking based on Xen
> ML and community members comments:
>
> Arm:
>    * [PATCH v6 00/15] Arm cache coloring [
> https://lore.kernel.org/xen-devel/20240129171811.21382-1-carlo.nonato@minervasys.tech/
> ]:
>      new patch series version [v6] was sent
>
>    * [PATCH v13 00/14] PCI devices passthrough on Arm, part 3 [
> https://lore.kernel.org/xen-devel/20240202213321.1920347-1-stewart.hildebrand@amd.com/
> ]
>
> PPC:
>    * [PATCH v2 0/7] Early Boot Allocation on Power [
> https://lore.kernel.org/xen-devel/cover.1702607884.git.sanastasio@raptorengineering.com/
> ]
>
> RISC-V:
>    * [PATCH v4 05/23]  Enable build of full Xen for RISC-V [
> https://lore.kernel.org/xen-devel/cover.1708962629.git.oleksii.kurochko@gmail.com/
> ]:
>      a bulk of patch have been merged already and a new version was sent
> to ML

There is one more series

https://patchew.org/Xen/20240220121743.3680715-1-ayan.kumar.halder@amd.com/

(Support for HVC_DCC registers).

- Ayan

>
> x86:
>    * [PATCH 0/4] iommu/x86: fixes/improvements for unity range checks [
> https://lore.kernel.org/xen-devel/20240201170159.66330-1-roger.pau@citrix.com/
> ]:
>      * almost patch series have been merged already except the patch:
> [PATCH 4/4] iommu/x86: make unity range checking more strict
>
>    * [PATCH 0/8] x86: support AVX10.1 [
> https://lore.kernel.org/xen-devel/298db76f-d0ee-4d47-931f-1baa1a7546cf@suse.com/
> ]
>
>    * APX support?
>
>    * [PATCH v4 0/8] x86emul: misc additions [
> https://lore.kernel.org/xen-devel/9dd23064-c79e-4a50-9c71-c0e73b189944@suse.com/
> ]:
>      * [PATCH v4 3/8] VMX: tertiary execution control infrastructure -
> was merged
>
>    * [PATCH 0/7] VT-d: SATC handling and ATS tidying [
> https://lore.kernel.org/xen-devel/25506838-b818-4686-8c16-3a198338af44@suse.com/
> ]
>
>    * [XEN PATCH 0/9] x86: parallelize AP bring-up during boot [
> https://lore.kernel.org/xen-devel/cover.1699982111.git.krystian.hebel@3mdeb.com/
> ]
>
>    * [PATCH v2 00/12] x86: memcpy() / memset() (non-)ERMS flavors plus
> fallout [
> https://lore.kernel.org/xen-devel/8f56a8f4-0482-932f-96a9-c791bebb4610@suse.com/
> ]
>      * [PATCH v2 01/12] x86: introduce ioremap_wc() - were merged
>
> common:
>    * annotate entry points with type and size" series:
>      The bulk of this has gone in, but there'll want to be follow-ups.
>
>    * limit passing around of cpu_user_regs [
> https://lore.kernel.org/xen-devel/ebc330a9-eafa-4858-b5cf-5694c4da911d@suse.com/
> ]:
>      new patch series version was sent.
>
>    * [PATCH v2 (resend) 00/27] Remove the directmap [
> https://lore.kernel.org/xen-devel/20240116192611.41112-1-eliasely@amazon.com/
> ]
>
>    * [PATCH v9 0/7] Introduce generic headers [
> https://lore.kernel.org/all/cover.1708086091.git.oleksii.kurochko@gmail.com/
> ]:
>      Almost fully patch series were merged except several patches:
>         * [PATCH v9 1/7] automation: introduce fixed randconfig for
> RISC-V
>         * [PATCH v9 2/7] xen/asm-generic: introduce stub header
> monitor.h
>         * [PATCH v9 6/7] xen/ppc: switch PPC to use asm-generic/device.h
>
>    * [PATCH] move __read_mostly to xen/cache.h [
> https://lore.kernel.org/xen-devel/f25eb5c9-7c14-6e23-8535-2c66772b333e@suse.com/
> ]
>
>    * [XEN PATCH v2 1/3] xen: introduce STATIC_ASSERT_UNREACHABLE() [
> https://lore.kernel.org/xen-devel/42fc6ae8d3eb802429d29c774502ff232340dc84.1706259490.git.federico.serafini@bugseng.com/
> ]
>
>    * MISRA rules updates:
>      [PATCH v2] docs/misra/rules.rst update [
> https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2402131431070.1925432@ubuntu-linux-20-04-desktop/T/#maded3df1bebe68d0fe53c73e89f996ec395a39e5
> ]
>
>    * [XEN PATCH 00/10] address some violations of MISRA C Rule 20.7 [
> https://lore.kernel.org/xen-devel/cover.1709219010.git.nicola.vetrini@bugseng.com/T/#t
> ]
>
>    * [PATCH v4 00/12] xen/spinlock: make recursive spinlocks a dedicated
> type [
> https://lore.kernel.org/xen-devel/20231212094725.22184-1-jgross@suse.com/T/#t
> ]
>
>    * [PATCH v2 0/5] xen/livepatch: fixes for the pre-apply / post-revert
> hooks [
> https://lore.kernel.org/xen-devel/20240227112528.4540-1-roger.pau@citrix.com/T/#m620c827bd097522d9d87b7f6511bc1599f6a8c84
> ]
>
> Completed:
>    Arm:
>        * [PATCH v1 repost 0/4] xen/arm64: Rework the MMU-off code
> (idmap) so it is self-contained [
> https://lore.kernel.org/xen-devel/20240116143709.86584-1-julien@xen.org/
> ]
>
>    x86:
>        * [PATCH v9 0/6] tools: enable xenstore-stubdom to use 9pfs [
> https://lore.kernel.org/xen-devel/20240229124830.13680-1-jgross@suse.com/
> ]
>
>    common:
>        * [PATCH v2] NUMA: no need for asm/numa.h when !NUMA [
> https://lore.kernel.org/xen-devel/94cffa48-5e31-4557-827d-c6dec6031d05@suse.com/
> ]
>        * [PATCH] xen: move BUG_ON(), WARN_ON(), ASSERT(),
> ASSERT_UNREACHABLE() to xen/bug.h [
> https://lore.kernel.org/xen-devel/4887b2d91a4bf2e8b4b66f03964259651981403b.1706897023.git.oleksii.kurochko@gmail.com/
> ]
>        * [PATCH] xen/lib: introduce generic find next bit operations [
> https://lore.kernel.org/xen-devel/52730e6314210ba4164a9934a720c4fda201447b.1706266854.git.oleksii.kurochko@gmail.com/
> ]
>
> Please reply with items you would like to see in 4.19 so that people
> know what is happening and prioritize accordingly.
> You're welcome to provide a description and use cases of the feature
> you're working on.
>
> Have a nice week!
>
> Best regards,
>   Oleksii
>

