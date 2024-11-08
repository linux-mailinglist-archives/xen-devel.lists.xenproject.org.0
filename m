Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FE29C221B
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 17:30:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832725.1248005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9Rrs-0006mg-4b; Fri, 08 Nov 2024 16:29:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832725.1248005; Fri, 08 Nov 2024 16:29:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9Rrs-0006k2-1J; Fri, 08 Nov 2024 16:29:52 +0000
Received: by outflank-mailman (input) for mailman id 832725;
 Fri, 08 Nov 2024 16:29:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K99Z=SD=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1t9Rrq-0006jm-Co
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 16:29:50 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20621.outbound.protection.outlook.com
 [2a01:111:f403:2409::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a78b58ca-9dee-11ef-a0c6-8be0dac302b0;
 Fri, 08 Nov 2024 17:29:42 +0100 (CET)
Received: from DS7PR03CA0254.namprd03.prod.outlook.com (2603:10b6:5:3b3::19)
 by PH0PR12MB7907.namprd12.prod.outlook.com (2603:10b6:510:28d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Fri, 8 Nov
 2024 16:29:33 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:5:3b3:cafe::1e) by DS7PR03CA0254.outlook.office365.com
 (2603:10b6:5:3b3::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20 via Frontend
 Transport; Fri, 8 Nov 2024 16:29:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Fri, 8 Nov 2024 16:29:33 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Nov
 2024 10:29:32 -0600
Received: from [192.168.59.65] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 8 Nov 2024 10:29:31 -0600
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
X-Inumbo-ID: a78b58ca-9dee-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQwOTo6NjIxIiwiaGVsbyI6Ik5BTTA0LURNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImE3OGI1OGNhLTlkZWUtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMDgzMzgyLjQ4MzQwMSwic2VuZGVyIjoic3Rld2FydC5oaWxkZWJyYW5kQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hiTqGOnc0dEWZQYF/lYUmMZ30q2iR39SYU3ut6om+hakN/vJSJSkbkrOKE8b2ETcGXWi0jHvrPTf+l8HHtrZINFNMSCkHrHC0ETqSPHZXtPcOyHZ98E9ho+Cl988x8Or+JZINeKwKO5rHZ35kNj3/f4JtzbnT+lCnF2t8dLkUq6NjhP5jGppbJziMKtg4pA+zB3oTEt3AvbW3URgI1J2+WpSa0NNToGmGVEJ7nOSLf7djqpwubceHRAtvw/+j5jXgoi/3ZgixYwo9N8sh4Sz5Cl93JMgtFBIUfYV9hBdZcZpFq279jKA/S+h5ba/sZhMYCTkZxo3ikel3RZWYAV6CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sbZBgVmUGPMICijMrrBrHw0Viq1K+Ua8gb+RrZwVJOU=;
 b=B6NeWRGo7F3jIsBDEYRIL2Hu/JPqvCkuSaHNm900f+V4ggnA5nyMFZ+HdJdd+zo3LVIto337QGNgngTjm0umN4IE+t0iz/wga+RaID/8BWr4bhG1cxfIyaD+orTISuhhWpnb+QaW+dNGeQWHUbq9Fx5njHYB/YkcpwLXzTr/CTxF+yu7yTpnlmknsYlMs0EO6py17nsHT3NJxzR3m0HyvHptrs0Bs86DJU4xsfunSGDwA+Sb7pZGWjJB4V1qTr4tMHAh1gacAbOSU5CcAWqpJ6ucZnD5UDJUJ0ifYeEkeIoMPKct7UHvZIr55R0Fq/Zo4kFSdD3x6t9jhkqtRrZYUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sbZBgVmUGPMICijMrrBrHw0Viq1K+Ua8gb+RrZwVJOU=;
 b=2MHWpVHt2IAQsmwoS7GkDBYL1NHc4B4z0LP7Yh5iE+10TmMuSpgzkfvqTahOVw30yDCV2lNiRNspxXTykU1jdXL6aD9Uqt1YFZ/EtjfYHj0Z3B+imbXai0vPh1cbbgeeOjZxlhs8UfzQvaFPf/xUj1E99agI68NuX2OgtvS4pTU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <ec9dd718-ef25-4a23-8080-8081ef2facb9@amd.com>
Date: Fri, 8 Nov 2024 11:29:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] xen/pci: introduce PF<->VF links
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>
CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20241018203913.1162962-1-stewart.hildebrand@amd.com>
 <20241018203913.1162962-3-stewart.hildebrand@amd.com>
 <56b5a45b-871d-41a4-8e1d-74d72020054f@suse.com>
 <9ab19f1b-0dee-490e-b4f6-b07e6ae6223b@amd.com>
 <9625de28-f05b-4317-89cf-d1fe843a43a8@suse.com>
 <D5GT0NR29WEF.216KE5GCTH1TL@cloud.com>
 <39b2a334-1298-4e83-b7b7-393c79964539@suse.com> <Zy4sG915LicXNmIV@macbook>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <Zy4sG915LicXNmIV@macbook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|PH0PR12MB7907:EE_
X-MS-Office365-Filtering-Correlation-Id: c1954aea-9900-49a9-8df3-08dd00128736
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OHA4dXNpTS9xK3JLYldTOEdaUWw5RjZPNXlGNDJzbng2b2xaaGJnZFZ5akpE?=
 =?utf-8?B?RHVDL2lGeU5TWFpZbTkxYlJNRnNQTld6d0JzcTBhQlo1WitpUUV5RUZVNytv?=
 =?utf-8?B?UjdtUk4zczhzanprMG9nK1FTQ1k2bWxiY2ozUFRYMzNBOFVGRmJ4NjRNV0g1?=
 =?utf-8?B?ZHlSNTZ0ZHN3TlRxaEVwSE5aZTJRUk5ER1J2bzMwUFk2VmdINXRpL1FtczhU?=
 =?utf-8?B?MDRTVkRRZzFMQWxqN2J6cEJCNXA0UERmYWdlMFZ2bEY5Q1lWem5SYkViUjl5?=
 =?utf-8?B?dFRjQW9xR3I5S3JvTnZtWVVLM1prWSs1U2lLTGp0VzNSQ2huQkhkODFSRlly?=
 =?utf-8?B?b3dGWk5FSzBnTmRkMDJWUExSdGg2dExmMC9Lbi9MVVN4Wk9vMnFWcmZFOFFI?=
 =?utf-8?B?dVg0bm9YUUNNRlRSUC9Na21rRVkzWWtnS0xXdHI2dlVzTTBGUzQwTHQ5QnVy?=
 =?utf-8?B?R0trbWRIb0VJNUo5dlVsRmltVWJCeE5sZkczbUQ0YjYzN2FNTFQ3OHY1ZkUy?=
 =?utf-8?B?bzhhb1B1bEN6OXM5Qmc1dEZyeWhsM0JPcFdjWHp1aE9EWjE0VldOVFo2dUo3?=
 =?utf-8?B?U3U5YThXd2oxTjkySG5yajdwakk3aDErVVdvRkVKTW4yQXdmNXRzMW5IOStv?=
 =?utf-8?B?TTMrWkNmQ3ZheVhoZFhEKzlKSHVaNGIyTHViVkc3OGF6dVlva0lhQXlCbXlU?=
 =?utf-8?B?d2x3aWw3cE8vQkpUYTJ6b0t0cVFJTkZJRkUxd3NxMnlYU3daNklTTnR1KzdP?=
 =?utf-8?B?TkVucVNXcU9SZlBIQ1ZzU0lkRUQ4ZGJWRVl5a2dTLzJIREh6WmdXWTcxZ2VO?=
 =?utf-8?B?S2ZQVUhBeS9mM0t6SnNGR1F5ZnNvYUg4aWxaSWNpbzMvTmFscVRmU2g0cXNI?=
 =?utf-8?B?TkVjcnV5ZVNBR2Z4dXFYMThDeEtnL0IvaGNvdnJxZjkzdzA0clNwcTA2empL?=
 =?utf-8?B?emNIelVyeUVKRzE0UXJWbERLWVQxUnpISXR3VGpxaUFJYkxSQkdWanJMTVg0?=
 =?utf-8?B?a1NQSU1QRSthcE5BdFlRaVVaZ1VTZjdWRVNualp3Tm5vVlgzQ3d2RWRmWWF2?=
 =?utf-8?B?Z3R4RUk1SUFMK3MzazU1SWhCQUczLzZMQmRWOU56M3EwT0cweDZuYlBua09R?=
 =?utf-8?B?QzJFZGwyQ2xwOGd3OEdzT1NxZ1IvbTdTNmZJOXM4V3grbnl4cm5OdXMzbjZQ?=
 =?utf-8?B?WUdRRnJhZWxpU3d2RFlWanRDUUJaeWRjRk1nZk45SExKQzJnUFUvdWxlR0NI?=
 =?utf-8?B?MSswaHpVSlhjcGpJTVVPZEF3S3pxVVdzZmtPU0d3anYxcUxuWVNYS2pqbjZV?=
 =?utf-8?B?MXpReERZOWhHYTE0TXI5TDlyMlE1Ymc1TkovaVFDTlg5TjZ0ZlgzMmFVdE9r?=
 =?utf-8?B?U1lHOFh2Q2dyQ2x3TnlpcytTZ3p6aDNHa1JGSmZsWHRNZkU1OW1yeGVFcTg5?=
 =?utf-8?B?by81UFdYRjN0UjZ4QjE1YmV5MVNCY0lYOVpRa29DMWpseGtRTVZOWDhISTE0?=
 =?utf-8?B?bDNvdVZ3SEQ5Q1crSkdra25vSlJMWjdaZC9wUGVJRzJhZFU0MG5uS0ZLZHM4?=
 =?utf-8?B?UHJJM1hnRi9oSU5EYzdLQVZZbW91TEloVzRYcm9ZVy9OOW5tVmNyS25DU1l6?=
 =?utf-8?B?RmZTZ3Z4aGYrbFp2aVh3MFRSZFpxWUx0UCswUUhvbllLczhIYnJEdWMrVGlP?=
 =?utf-8?B?N2pUaktiSGZyeHhxeCtkeFVRMEtjWE1HejRsRUt5V0ZKSjNjc2FISE8zaFFw?=
 =?utf-8?B?UmpVV0I5eVA2WW84ekNiMHk5UlZ0aXBHSm5ndnBOdXBLNS9Dc29KQklJZlh4?=
 =?utf-8?B?Y0xaTU51azZJSEZpcDdReEgxbkdBaVJrdU1tTTZSazcrZXV1U2w1SW4zdjJp?=
 =?utf-8?B?MmtZVnpDR3AzNlZFSytzSW1QdjF6ZTRoK1FKSjNTNHgyOGc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 16:29:33.3451
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1954aea-9900-49a9-8df3-08dd00128736
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7907

On 11/8/24 10:19, Roger Pau Monné wrote:
> On Fri, Nov 08, 2024 at 02:17:40PM +0100, Jan Beulich wrote:
>> On 08.11.2024 13:42, Alejandro Vallejo wrote:
>>> On Mon Nov 4, 2024 at 7:44 AM GMT, Jan Beulich wrote:
>>>> On 01.11.2024 21:16, Stewart Hildebrand wrote:
>>>>> +Daniel (XSM mention)
>>>>>
>>>>> On 10/28/24 13:02, Jan Beulich wrote:
>>>>>> On 18.10.2024 22:39, Stewart Hildebrand wrote:
>>>>>>> Add links between a VF's struct pci_dev and its associated PF struct
>>>>>>> pci_dev. Move the calls to pci_get_pdev()/pci_add_device() down to avoid
>>>>>>> dropping and re-acquiring the pcidevs_lock().
>>>>>>>
>>>>>>> During PF removal, unlink VF from PF and mark the VF broken. As before,
>>>>>>> VFs may exist without a corresponding PF, although now only with
>>>>>>> pdev->broken = true.
>>>>>>>
>>>>>>> The hardware domain is expected to remove the associated VFs before
>>>>>>> removing the PF. Print a warning in case a PF is removed with associated
>>>>>>> VFs still present.
>>>>>>>
>>>>>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>>>>>> ---
>>>>>>> Candidate for backport to 4.19 (the next patch depends on this one)
>>>>>>>
>>>>>>> v5->v6:
>>>>>>> * move printk() before ASSERT_UNREACHABLE()
>>>>>>> * warn about PF removal with VFs still present
>>>>>>
>>>>>> Hmm, maybe I didn't make this clear enough when commenting on v5: I wasn't
>>>>>> just after an adjustment to the commit message. I'm instead actively
>>>>>> concerned of the resulting behavior. Question is whether we can reasonably
>>>>>> do something about that.
>>>>>
>>>>> Right. My suggestion then is to go back to roughly how it was done in
>>>>> v4 [0]:
>>>>>
>>>>> * Remove the VFs right away during PF removal, so that we don't end up
>>>>> with stale VFs. Regarding XSM, assume that a domain with permission to
>>>>> remove the PF is also allowed to remove the VFs. We should probably also
>>>>> return an error from pci_remove_device in the case of removing the PF
>>>>> with VFs still present (and still perform the removals despite returning
>>>>> an error). Subsequent attempts by a domain to remove the VFs would
>>>>> return an error (as they have already been removed), but that's expected
>>>>> since we've taken a stance that PF-then-VF removal order is invalid
>>>>> anyway.
>>>>
>>>> Imo going back is not an option.
>>>>
>>>>> While the above is what I prefer, I just want to mention other options I
>>>>> considered for the scenario of PF removal with VFs still present:
>>>>>
>>>>> * Increase the "scariness" of the warning message added in v6.
>>>>>
>>>>> * Return an error from pci_remove_device (while still removing only the
>>>>> PF). We would be left with stale VFs in Xen. At least this would
>>>>> concretely inform dom0 that Xen takes issue with the PF-then-VF removal
>>>>> order. Subsequent attempts by a domain to remove VFs, however
>>>>> (un)likely, would succeed.
>>>>
>>>> Returning an error in such a case is a possibility, but comes with the
>>>> risk of confusion. Seeing such an error, a caller may itself assume the
>>>> device still is there, and retry its (with or without having removed the
>>>> VFs) removal at a later point.
>>>>
>>>>> * Return an error from pci_remove_device and keep the PF and VFs. This
>>>>> is IMO the worst option because then we would have a stale PF in
>>>>> addition to stale VFs.
> 
> I'm thinking probably this is the least bad option, and just force the
> owner of the PF to ensure there are no VFs left when removing the PF.
> 
> What sense does it make anyway to allow removing a PF with VFs still
> present?  Not sure exactly what the owner of the PF will do before
> calling pci_remove_device(), but it would seem to me the device should
> be ready for unplug (so SR-IOV disabled).  Calling pci_remove_device()
> with VFs still active points to an error to do proper cleanup by the
> owner of the PF.

In normal, correct operation, right. The PF driver is indeed expected to
disable SR-IOV (i.e. remove VFs) during its removal, prior to calling
PHYSDEVOP_pci_device_remove for the PF.

> Returning error from pci_remove_device() and doing nothing would seem
> fine to me.  There should be no stale PF or VFs in that case, as the
> caller has been notified the device has failed to be removed, so
> should treat the device as still present.

But software has no way to guarantee there won't be a physical device
removal.

In test scenario #2 described in the first patch [1], the PF (the whole
device, actually) has already been physically unplugged, and dom0
invokes PHYSDEVOP_pci_device_remove to inform Xen about it.

[1] https://lore.kernel.org/xen-devel/20241018203913.1162962-2-stewart.hildebrand@amd.com/

That said, test scenario #2 would only happen when a buggy PF driver
failed to properly clean up the VFs before the PF. But the point is that
returning an error does not guarantee there won't be a stale pdev in
case of a buggy dom0.

I guess as long as we trust the owner of the PF, this approach is fine.

