Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2021AB2E50C
	for <lists+xen-devel@lfdr.de>; Wed, 20 Aug 2025 20:33:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1087574.1445552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoncM-0003Ys-QC; Wed, 20 Aug 2025 18:33:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1087574.1445552; Wed, 20 Aug 2025 18:33:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoncM-0003Wj-MR; Wed, 20 Aug 2025 18:33:02 +0000
Received: by outflank-mailman (input) for mailman id 1087574;
 Wed, 20 Aug 2025 18:33:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BRi6=3A=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uoncK-0003WY-Br
 for xen-devel@lists.xenproject.org; Wed, 20 Aug 2025 18:33:00 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20629.outbound.protection.outlook.com
 [2a01:111:f403:2416::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 173c6804-7df4-11f0-a32b-13f23c93f187;
 Wed, 20 Aug 2025 20:32:57 +0200 (CEST)
Received: from MN2PR01CA0043.prod.exchangelabs.com (2603:10b6:208:23f::12) by
 CH2PR12MB4215.namprd12.prod.outlook.com (2603:10b6:610:ab::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.14; Wed, 20 Aug 2025 18:32:50 +0000
Received: from BN3PEPF0000B069.namprd21.prod.outlook.com
 (2603:10b6:208:23f:cafe::76) by MN2PR01CA0043.outlook.office365.com
 (2603:10b6:208:23f::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.14 via Frontend Transport; Wed,
 20 Aug 2025 18:33:23 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B069.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.0 via Frontend Transport; Wed, 20 Aug 2025 18:32:50 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 20 Aug
 2025 13:32:49 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Wed, 20 Aug
 2025 11:32:49 -0700
Received: from [172.31.85.68] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Wed, 20 Aug 2025 13:32:49 -0500
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
X-Inumbo-ID: 173c6804-7df4-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HgrDCB+QedkDFO0arpUeO8NRDeJzruT8Ad0ZFfNWiAH6orMmPVeI7p4aTTsZ9/mcFcKt6Id5vgausLQ08lNdJFe+85Tiz/CwlcwGf+PbYV+pM0yUY8wpHqmqE9Zcvr+e5VVlvDsItwD/J4Y6M7OafACuy52nEk/x/dIzc3hh2401xpRqDhj4RjOEX2L0uzozEP+ixK8+J/E/MtI/LSPEXH+XdPPFww7ActAGUUpq01QGL/Ha6Yd79ScOJiKY1wBSSQxNzb9Q72sApF01KJr8lot6nvyL/GBFHaHvxDwiCszczt3burMDmEC5c3xlpz9K2Oqst0v3PoXgB2LtHCfw3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/NgI6/QAGcQLG5GR+/UestV8rbSuNATaGqSMOGwCvrE=;
 b=LHin1GSElLWzGjThixruPxKa0hHAQfNPHNLNhGfvXuFigOv0ugAdon0ubovD1/oz+2Lx96ac6g2UJkvuQc99Rl2VuWvZe/A5isDM08yhqsozhkCcz9+R+uICJxsIj5wNokBdYNpK3tPS9zZUMeZU6hRjyiKarpuJ7BELwQ38Z62ULVgLx4LKH7t9KyFctZtMs36dnMG2+zV4QkVpvlaCXmg2TthBgO0F8adxmwf1DxUsCpE7+jb14VVz/9eBSxzgJWle513C7ViYQaqyupPhSlRj4uHJ1zpghdBMAPo567vS/TO9j/t3xNnW45DnNyY/aQ4r8U8YkDy6TleuS1zFXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/NgI6/QAGcQLG5GR+/UestV8rbSuNATaGqSMOGwCvrE=;
 b=1rKF26oK9JKekdqZfYTA2XQ8XcI4A7HGMV7ubk0VGLcGxVcbF62EJ+xmH7LlqZqUW5M8GV/Ckl3wido+MWa1iCWC2dcqjv+SmsnPycCHwq7ZOsXDfKUZl4JnF7lllzUSqPeEUtlcDPGZS7YFdi1ZvdVK6fIKtM1nE48nd5CxKPM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <85aa0d98-8909-4c44-8b2a-83b5b37dab51@amd.com>
Date: Wed, 20 Aug 2025 14:32:48 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] xen/vpci: make BAR mapping more resilient for the
 hardware domain
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, <Jiqian.Chen@amd.com>,
	<jbeulich@suse.com>
References: <20250814160358.95543-1-roger.pau@citrix.com>
 <20250814160358.95543-3-roger.pau@citrix.com>
 <269db2aa-9ca1-446b-98f7-60ea2386fc03@amd.com>
 <aKLZbNSltqqbXWk0@macbook.local>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <aKLZbNSltqqbXWk0@macbook.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B069:EE_|CH2PR12MB4215:EE_
X-MS-Office365-Filtering-Correlation-Id: d8520873-1b00-4d78-da06-08dde017f7d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d1AxTmUveGpvNkYwcTBlcUpqdUVDZ0hUTHRQaTM1VFRGdGxLVHBld2owaGY2?=
 =?utf-8?B?b1BNY0tHWUE3WjNmM2loZ2IvQ3RGQzlqbWw4a09iOEVSOEx0WlAvMXN3c0Z6?=
 =?utf-8?B?RDZueG1lOURtSHo3OTFuRmo3blVHQ0dJVG5uYzdNQVBFbmVzM1BKOXJ6N1pw?=
 =?utf-8?B?TGxxbS9ZTURyVzNHSjUwMXNqbUwrd0gyS1BrNnBTZlU2UHFOSjhya0VKR2NF?=
 =?utf-8?B?b0htV1FjRGNGRUNiWGJlTHBoQ0lJeVFxZDRFdi9HSmpudmkzQm9wcU9MMitl?=
 =?utf-8?B?V2NjdnFUcHpraEsvRFRmYVpveEZQbFVyekNLak9LRmFLdHI4cFJqL3BxQWxo?=
 =?utf-8?B?S2RkWktMaS9URVo4NkNOZG9MeFF1YXVhenFnSkZBZEN0QXpBVmc1VVNiUmVC?=
 =?utf-8?B?dFlrbW5nL1FzVkUxU1V6Rmxrc0huNXZIbk50b3ZtT25YYW1vajdFekVmMHNy?=
 =?utf-8?B?dXZmY1luMEk3eEthWER2VHp6Q1VGMUpLaTByU2pTR2NOclpzU0FzSGFPT3R2?=
 =?utf-8?B?K2JFaEdMbEpRYTZJK0ROTzBUTVZoQ1l0a1Zib0U3eU54c0RMVUN2NW83T1dM?=
 =?utf-8?B?MlIyNXlZL3RuVlpNWWFWeGFid2RRbHI4WExqQkc0elBtcnJKeitIU2NBTDRR?=
 =?utf-8?B?bDRtQ0Y4cjhQS09scFYxQ2YrZ1BsRUdhMlR0RXNvSXg1K3Iza1N0eExMNWNW?=
 =?utf-8?B?RzdzU0hQakgrSC8yTkVWVmZhVUUvVGt1b1FVR3NVSXFFb0dqbTRZM2RxYWQw?=
 =?utf-8?B?Ny9velE5eUJtc21uMzNraEpnYU8vQWl3RUJWOEpzZ1RsaWpRaG1xaTNhRTlS?=
 =?utf-8?B?WWpydkZWc0piU2tmT2UyOTl0QWh4NlRzWW10WVd6VGpEV0tmdEN3dTNNYmk0?=
 =?utf-8?B?aHQxeEh1RHhyYWFsN083eFVDSzBrWmJuK2ZuY2NrcVhzSk13SlFKTXpBNGkx?=
 =?utf-8?B?Z3dNYmFsdHNGVUFmaVpuNW15OXgwNVMycURoUG1ROW9UVmQzdE5abENQdXIz?=
 =?utf-8?B?b2FqeXN0NG54TUNzcU9vcnJNaXBMNTdpYzh1Sk82cVZVazRTellnK0QrbTN4?=
 =?utf-8?B?QlBEZnpQOVRVbllSY3U2cUk3WUFwcVZGNHdGdmVSWFo3OFdoU2JnSWxzRVJB?=
 =?utf-8?B?MEMzNklwNm0rZ0tPaURyc1N6Qm85RVFUQnowTkNNWHdwd0M4dEhZbzdENVJk?=
 =?utf-8?B?d2RoL05jYS9JS2dQVm0zWmIzSXdPZFhBcGoySkpSdzN0R2VmVlVnalN1QWMx?=
 =?utf-8?B?THR3b3E3dXBCZXYwUmZESHBRcVlYbk5UTTV3UXEvMmJVMjNJWGtXQXlvYzhw?=
 =?utf-8?B?bDJQcm01dFJmOUxUVjhGNDhZRmZBWDdGWXJUNTBWdkxYQjJuWTE1K1V1ajM5?=
 =?utf-8?B?akgwaGp5YXpDN0k3MUFvNXNSV0VMY0wxNW9KVWJKUzlTY2UwNEQ2QUlIbXJo?=
 =?utf-8?B?NXVtWXpIeW51UTNjNHRENDBuQ0sxdWtwbG56OS9IYXNNUEhYTUJVNDExVWhR?=
 =?utf-8?B?bXNNeEJHZE1nSUNHV05WZzZNS25PL085eWpsY1dSQmFKdnNrNTFBR3J4bm11?=
 =?utf-8?B?MXFUbWxIdEpVeWxoMGx1SGlRK205OWdxaCt2cUpQcHZqRmNWY2N5RjRaWEha?=
 =?utf-8?B?WFVlbUZlV2NIZ1VnT2lhSFcvZVMrNVUrU2VxSnl0SkFrOXpBdFdEbFVWR3Zy?=
 =?utf-8?B?bC9TZ3pLQ3lySHEzMGhDMThmdjlFV2V6c1FkWVJ1VzFONENNYjExNS9zK09j?=
 =?utf-8?B?a3VPVFhFaUR5eVZyNDdXMHRmSUIvaTBxZS9ESHduZG13UTVpd3RjTnpCSERW?=
 =?utf-8?B?MmxHRnp2UDhXUnJvTjNRb2kydXExRWZtalJSc1FPd0t2VjZWUXB6T2VjU29a?=
 =?utf-8?B?L2pLbDdZaUNPU1h4M0tFdHNJMTZ4QmVnZlV1enc4SW5Ca21qMVdwY3hLNGY0?=
 =?utf-8?B?ejJFTnN1ZmIrNUVLT0FpZFFPeTJWZTh0cUxPcDNxT0UyWWgrR2hqa2lwMUM2?=
 =?utf-8?Q?aUKdUASnF1YUkOnihS6e9M58zCHuJo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 18:32:50.2716
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8520873-1b00-4d78-da06-08dde017f7d2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B069.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4215

On 8/18/25 03:42, Roger Pau Monné wrote:
> On Fri, Aug 15, 2025 at 02:53:35PM -0400, Stewart Hildebrand wrote:
>> On 8/14/25 12:03, Roger Pau Monne wrote:
>>> The logic in map_range() will bubble up failures to the upper layer, which
>>> will result in any remaining regions being skip, and for the non-hardware
>>> domain case the owner domain of the device would be destroyed.  However for
>>> the hardware domain the intent is to continue execution, hopping the
>>> failure to modify the p2m could be worked around by the hardware domain.
>>>
>>> To accomplish that in a better way, ignore failures and skip the range in
>>> that case, possibly continuing to map further ranges.
>>>
>>> Since the error path in vpci_process_pending() should only be used by domUs
>>> now, and it will unconditionally end up calling domain_crash(), simplify
>>> it: there's no need to cleanup if the domain will be destroyed.
>>>
>>> No functional change for domUs intended.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>>  xen/drivers/vpci/header.c | 51 +++++++++++++++++++++------------------
>>>  1 file changed, 28 insertions(+), 23 deletions(-)
>>>
>>> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
>>> index b9756b364300..1035dcca242d 100644
>>> --- a/xen/drivers/vpci/header.c
>>> +++ b/xen/drivers/vpci/header.c

<snip>

>>> @@ -213,28 +224,22 @@ bool vpci_process_pending(struct vcpu *v)
>>>              return true;
>>>          }
>>>  
>>> -        if ( rc )
>>> +        if ( rc && !is_hardware_domain(v->domain) )
>>>          {
>>> -            spin_lock(&pdev->vpci->lock);
>>> -            /* Disable memory decoding unconditionally on failure. */
>>> -            modify_decoding(pdev, v->vpci.cmd & ~PCI_COMMAND_MEMORY,
>>> -                            false);
>>
>> This path could be taken for either map or unmap. Do we still want to disable
>> memory decoding in case of unmap?
> 
> Does it make an effective difference?  For the hardware domain we
> should never get here, and for domUs the domain will be destroyed, so
> disabling memory decoding is not helpful?

Since the domU will be destroyed, the PCI device will get assigned back to hwdom
or put into quarantine. In case of quarantine, it shouldn't matter. In case of
assignment back to hwdom, I think by keeping memory decoding enabled it could
potentially trigger additional p2m operations.

In any case, I don't have a strong opinion on disabling memory decoding vs not,
but I think the commit message ought to mention something about it.

