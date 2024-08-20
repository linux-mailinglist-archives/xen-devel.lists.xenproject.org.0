Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F11958FDA
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 23:43:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780779.1190385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgWcS-0003dj-GP; Tue, 20 Aug 2024 21:42:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780779.1190385; Tue, 20 Aug 2024 21:42:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgWcS-0003c5-DL; Tue, 20 Aug 2024 21:42:24 +0000
Received: by outflank-mailman (input) for mailman id 780779;
 Tue, 20 Aug 2024 21:42:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i0f1=PT=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1sgWcQ-0003bz-SP
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 21:42:22 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20628.outbound.protection.outlook.com
 [2a01:111:f403:2409::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13aea140-5f3d-11ef-a507-bb4a2ccca743;
 Tue, 20 Aug 2024 23:42:21 +0200 (CEST)
Received: from CH2PR16CA0027.namprd16.prod.outlook.com (2603:10b6:610:50::37)
 by LV3PR12MB9331.namprd12.prod.outlook.com (2603:10b6:408:219::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 21:42:14 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:50:cafe::53) by CH2PR16CA0027.outlook.office365.com
 (2603:10b6:610:50::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Tue, 20 Aug 2024 21:42:14 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Tue, 20 Aug 2024 21:42:14 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 Aug
 2024 16:42:14 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 Aug
 2024 16:42:13 -0500
Received: from [172.20.142.25] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 20 Aug 2024 16:42:11 -0500
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
X-Inumbo-ID: 13aea140-5f3d-11ef-a507-bb4a2ccca743
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ArYDWR54BQ0nsLQTsEJQC2EJ5E6jcAoB+sJRby2iZ0gaXa6sW5aYKDnmpBEchnZM4MsQJ9opLsxnIU2M+PJ8dLGIHCkPNKDF0XvfqQ0OidxZsoX5d2Wvt4hJgQeVV0h/T6KIpwlVjRGj3zCeM9sxt3jwQH5Gzm5eupMe9zKAfT1xAHq2qFs2PHJ7wb5qP+933x+J6Sv/6BJ+JDQCrw2bHRYZPcjhqmU3HAPB6Kvi6opFcPnQE9Bb/Nf25Zrs92PZMpPUjvODcksDUAPG/hOGVlP6xYefpGYHxrYja0QOTunmRCaOLsV4Gob0QTYvU/c8/CAAZNdQ9Jvc219qwJ+GgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jE80Bkm6ycuFwFJslkV5hWhCP6gwB7g4HytrCoZfcPE=;
 b=L73ZmAbWS6a8iPLp+qpn7ZADOmA1RH8AqjgvYksiEfv57/fCnFMx/XE5D2NN/5TT+kS2Msa6241P4k6+wrS/tWxQNL7Xp10GoqxQleuNgcVuPE+AZK7744t/5j88ahqKbN3UDUUrL9Ei/a+9Yp3u4WAeqq6vtHnqVIQbGuJZEMYPME0ccyEjv0izYvvYAPPTLJavuJloToicl1JGmdfKDCw3ulYVonVnAaa2FGnpJ5U/2f7iAwWK/RqtIIvTnVxZhJVnu607+7bbhp0qUwyxyslO3+r+/I66VOuvHn5lhit7v55E6Kx/j3icqNLKBEc1pQEqL2Ot5gwerW2zv8zT4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jE80Bkm6ycuFwFJslkV5hWhCP6gwB7g4HytrCoZfcPE=;
 b=LszqxFfaQWQ1yK49sdX/LbC/EYbfBPgCOnYx/ziYhIHMS1rP+a81nF3hzoT5inXvb0QqC++wFl7Hfg0YouoqGDWG5FfKzWBxUy+8wLsUQTFNty2vOzeeiG6wx2ESZsLcxy/0mYvuVbSGARrkEh+wcPd2Q2Ke/7LD0BbpKPjphOk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c8f84256-dfb8-4f42-a71c-30373bafab23@amd.com>
Date: Tue, 20 Aug 2024 17:42:11 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v13 1/6] xen/pci: Add hypercall to support reset of
 pcidev
To: Jan Beulich <jbeulich@suse.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, "Rahul
 Singh" <Rahul.Singh@arm.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <gwd@xenproject.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20240816110820.75672-1-Jiqian.Chen@amd.com>
 <20240816110820.75672-2-Jiqian.Chen@amd.com>
 <50717151-3098-491f-9dfb-71ebaff4b684@suse.com>
 <BL1PR12MB58498DC98719ED77DA950478E78D2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <1e0eee6c-0dcd-4ed4-970f-3d7e569cec09@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <1e0eee6c-0dcd-4ed4-970f-3d7e569cec09@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|LV3PR12MB9331:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d3069ba-ccaa-4e12-d846-08dcc160f4cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YkhHeUFmbXRFeVBJaDQ3MDVhMWpBOE1keFVQRnExVVl0ME1PUlJMRStrTmp6?=
 =?utf-8?B?U0xpTHM4NHg1WlBrenBLQk9rL1hEb1E4YUlmQTVDU3Q0MVZtTlpCK1BwOW83?=
 =?utf-8?B?U29NeGREL0dHckRGVGhMOU1xU2NsKzM0M1ZORjdGUDNwSnVsMTNlY2IrcllQ?=
 =?utf-8?B?Q0lBRWlHS0NQekNyWWRBeVRPekhaQjJvRVlhZzh5VTBENDdSeThNQi8rRHBJ?=
 =?utf-8?B?MTFScmdwQlZvQ0RPWnZHdmloZUVyRjlvMzZvUWxNemQ2ZlZCRUExV1BTSGlD?=
 =?utf-8?B?cGJ1cXpUUk1ZV3VNSmx2S1I1a0JnY0hzdUlRN2RNbWkxU1IxNmhHdFR2ckdy?=
 =?utf-8?B?RzBHSVhzdEhhTnVNejZOcFRINkdUVG91VGx4bW1Fbk0rK3dOTTVMVTByVGtm?=
 =?utf-8?B?QVhzY3ZGd1o4a0M4bWhXUkc4NEZ3U3g2VCt6b3FaU2VQSHU4aUNtU0M2TGJV?=
 =?utf-8?B?N0JHRnB0Wit5QWRzUUs0SmVSMHZPSmZHaW1nZ0pvQ2UrWUZONjFKTEhQUnZF?=
 =?utf-8?B?TnZsWTZycU02NTRBcEdxVDJwWU43TnBNV1lOcXVHb2xVK1lKVXYvN1AycXFk?=
 =?utf-8?B?TG5TSWVMalh0WGU4c29rNVBtMWhuZ283dE1VSmlweWxYcEJsL3lpTngwQWxH?=
 =?utf-8?B?WFpCRXlvV0pCNlA4WlpKSmVQWVVubC9nTXVQN3NlVHJ2NTJjYm9MdXpoQkFu?=
 =?utf-8?B?NG43N1hpaEZ2MnArbDZwQ0c0d3F5M0FyU3FiRURXVHhBODFUU1pPcEM2eER2?=
 =?utf-8?B?dTUrS25UK2ZTMzZzZ0VuRWtWbkhmNVBmMGU5VVloYzNCYUdhb1ZndWdENEhV?=
 =?utf-8?B?MjVkWGJuYnh0QTA5bjNBaWI1dHBwckJTUDQ0LzZCS3ZzYUE4M0RDVjN1UXBM?=
 =?utf-8?B?amJCRGhrOTdoMWl4Yi93VmlmTjNQU0E0WDZMSjhrQ1VNVTN3Z3h2Zkg5aTJi?=
 =?utf-8?B?U1VzUldzMVdZd21pRytqSERTYkZrR1UrT1hoblNRQ3d2MVVQUElIVUYzb3Ro?=
 =?utf-8?B?SmdFZlk3QmxrcWRISFl3YXVzdFJ0a3Q5bFhKaGZ4dHp0a2NFakYvcHh4cUx0?=
 =?utf-8?B?aElvM2tHV1NFV0hRZCt6enhSZjF4c3NqQ2tJOEltRG9JL1Jyem9TMnQvazA1?=
 =?utf-8?B?QVFVTm9ZSmNjS0FGNkkwTk1GR0t1dC9xSkhydzIyemorODg1UHAzM3VTNWcz?=
 =?utf-8?B?bk9neVlJcUd2Q2g4bWRiU09UQWhGNHRFY3A2bWEyMXNJM0pFdlVhV0FwNTJ0?=
 =?utf-8?B?bmxGYVppWm53VVpTL1k2M2lMTEVHQmJodkdHUUZsK0RRZFlWV0lxTFRORy9k?=
 =?utf-8?B?UFk3bzMxRGVpSm0yTE4xaFp1SjAvaktRV2Y5MXJZc0V3Ty9laytEOFp4YVNi?=
 =?utf-8?B?aEFYSFAzZFoyamxYK05WbUEwR0cvZFp5VUhhSEhGMXk5TW4zcVR2Z2l6SVFI?=
 =?utf-8?B?eVo2RkYrNExYdDVIZlhXaDVkaXB3R1g5ZmxHSXBLRTd6RmhaL1A2TC9xdFpM?=
 =?utf-8?B?cXJaa3VWRlRQR2ZGZm5nUHBIU0I5UnZNVXM5R21NSGRObFREMjZVbG1mNUEw?=
 =?utf-8?B?OVVuaHhoM0V1OFdQZm4xeWJVVkFiK2M5WUZUcFJkUm4yRHZJU3ZEL1VzcTBU?=
 =?utf-8?B?MFBZRkJCVGtXbmUza0ZTMWFrZ1RkY2dlanFOVXpZM0Z5S1BsdUhEYjhTV1VR?=
 =?utf-8?B?aW5Ha3hqVHpUdTZRZjZnUklIbDRDTE1aOHhHWEEvVjgya1A3cm5DVXBsUjdm?=
 =?utf-8?B?bXA0WjBFZGN1a1c1eDhacklhS1V4MWN5ekxiUlpWa1I5akdnbTdjUytSYUJI?=
 =?utf-8?B?ai9XZ1VKSzJxTjRTZHZhcDVqMDAxcnNoL2FieU1RbjFET1pHU1c2cnRUcWJO?=
 =?utf-8?B?dE05MEwxZTdPZlBpY01pSmdlcmZKNUs1QUJXKysrN3BJNEE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 21:42:14.7073
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d3069ba-ccaa-4e12-d846-08dcc160f4cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9331

On 8/20/24 03:01, Jan Beulich wrote:
> On 20.08.2024 08:00, Chen, Jiqian wrote:
>> On 2024/8/19 17:04, Jan Beulich wrote:
>>> On 16.08.2024 13:08, Jiqian Chen wrote:
>>>> @@ -67,6 +68,57 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>>          break;
>>>>      }
>>>>  
>>>> +    case PHYSDEVOP_pci_device_reset:
>>>> +    {
>>>> +        struct pci_device_reset dev_reset;
>>>> +        struct pci_dev *pdev;
>>>> +        pci_sbdf_t sbdf;
>>>> +
>>>> +        ret = -EOPNOTSUPP;
>>>> +        if ( !is_pci_passthrough_enabled() )
>>>> +            break;
>>>
>>> It occurs to me (only now, sorry): Does this case really need to be an
>>> error? I.e. do we really need to bother callers by having them find out
>>> whether pass-through is supported in the underlying Xen?
>> I am not sure, but for x86, passthrough is always true, it doesn't matter.
>> For arm, this hypercall is also used for passthrough devices for now, so it is better to keep the same behavior as other PHYSDEVOP_pci_device_* operation?
> 
> Despite seeing that I did ack the respective change[1] back at the time, I
> (now) view this as grossly misnamed, at best. Imo it makes pretty little
> sense for that predicate helper to return true when there are no IOMMUs in
> use. Even more so that on an Arm/PCI system without IOMMUs one can use the
> command line option and then execution will make it past this check.
> 
> I further question the related part of [2]: Why did the stub need moving?
> I'm not even sure that part of the change fell under the Suggested-by:
> there, but I also can't exclude it (I didn't bother trying to find where
> the suggestion was made).
> 
> In any event - with [1] PHYSDEVOP_*pci* ended up inconsistent on x86,
> even if right now only on the surface. Yet as soon as this predicate is
> changed to take IOMMUs into account, the latent inconsistency would
> become a real one.
> 
> An alternative to changing how the function behaves would be to rename it,
> for name and purpose to actually match - is_pci_passthrough_permitted()
> maybe?
> 
> Thoughts anyone, Arm / SMMU maintainers in particular?
> 
> Finally, as to the change here: On an Arm/PCI system where pass-through
> isn't enabled, the hypervisor will still need to know about resets when
> vPCI is in use for Dom0. IOW I'd like to refine my earlier comment into
> suggesting that the conditional be dropped altogether.

I agree on removing the condition for the reason you mentioned. I'd
like to remove the other instances of the condition in this file as
well, but that is the subject of a separate patch in the works [3].

[3] https://lore.kernel.org/xen-devel/20231109182716.367119-9-stewart.hildebrand@amd.com/

> 
> Jan
> 
> [1] 15517ed61f55 xen/arm: Add cmdline boot option "pci-passthrough = <boolean>"
> [2] dec9e02f3190 xen: avoid generation of stub <asm/pci.h> header


