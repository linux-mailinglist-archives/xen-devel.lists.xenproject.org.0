Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4999E0F54
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 00:31:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847131.1262261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIFs2-000593-Pu; Mon, 02 Dec 2024 23:30:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847131.1262261; Mon, 02 Dec 2024 23:30:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIFs2-00057a-Lu; Mon, 02 Dec 2024 23:30:26 +0000
Received: by outflank-mailman (input) for mailman id 847131;
 Mon, 02 Dec 2024 23:30:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iA98=S3=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tIFs0-00057U-JT
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 23:30:24 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20604.outbound.protection.outlook.com
 [2a01:111:f403:2406::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65aef7bc-b105-11ef-a0d3-8be0dac302b0;
 Tue, 03 Dec 2024 00:30:22 +0100 (CET)
Received: from CH0P220CA0017.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::34)
 by SN7PR12MB8027.namprd12.prod.outlook.com (2603:10b6:806:32a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Mon, 2 Dec
 2024 23:30:17 +0000
Received: from CH1PEPF0000AD7E.namprd04.prod.outlook.com
 (2603:10b6:610:ef:cafe::c4) by CH0P220CA0017.outlook.office365.com
 (2603:10b6:610:ef::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.18 via Frontend Transport; Mon,
 2 Dec 2024 23:30:17 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD7E.mail.protection.outlook.com (10.167.244.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Mon, 2 Dec 2024 23:30:16 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Dec
 2024 17:30:16 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Dec
 2024 17:30:16 -0600
Received: from [172.25.146.163] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 2 Dec 2024 17:30:15 -0600
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
X-Inumbo-ID: 65aef7bc-b105-11ef-a0d3-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NKi/vrtKO2hxxM/BDXL0thDUAdrlWI2Bx9ujQkaZ4g9OBBQA68/btaLFfHTl4BzZoVECaPDnk49abHYnVxtxhRYOr2HvAQGD4LgXW9YluZeiN4cxv6l5t6xLROiNbpgqSQS0KDdLFBmTS359+yjYthQsFxCaaZmbZi/fmVWb78uynNJMJmJ926TYoRxM551xl3jPCKbj0Qy+OWdUmEoaV6wsDad1scxQgAasxW9DgrRwiNWRtEwN5rGv2MR9OVchvDkSLxWwdFnG2Oghx6Af1bvnMgXxYYpSgEtxIBl2qn2RpzpTueyffF0C1lgn8LXExB2YeYYnhMOu1R3xs8IQLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yr4+xPwlByZzVA0fa5bri/NPFAgZZCBLCSr7JMRSsUw=;
 b=Dn/6WH2FNVauIj2v/3MapWtgSwL11AyNLOSEWPD/ze5oKSPOzu2IkmP531Pwo0t3Rl3YWdZr26Kb1igA2lVJA0yWmPrsPGV2q9UfFSkKFQ1a+Y3sfLFBWr3LGW/R2dyJgMfurVmy4EWXhGfusqf8Uc0EyttIze5eq40XYJADAv0ARbkot+pkmupPHaEgsJaTIVcG6XoEa+7Xnfb4LLl0sOdfTpk9yNwLbAid10c51YB8k/3Ki8wUg0UzDQM1ki4e9oV+//rP95AQIAl84LKcHMFk85168/yLMou0DCrs3p/KNKuSUSJ0fZUtvqbIZelpIsFHpmpHUX5LoeAvcAFyYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yr4+xPwlByZzVA0fa5bri/NPFAgZZCBLCSr7JMRSsUw=;
 b=Ak6QMlX41qHjs4DgVTZWxCarlElRz1o9nP/d+ZI0FuNeTRhabA1Of60Y92XlZl2F/O+7JF9SGaO1SZqGYBCscNEzXm/efJWGkTJJVciCPUWUM6pDjG3mCBRdtTr7onrpWSoXBtOURhrHJxm1O6U0FUEW7K5d8zz1tmY3ZFri4BE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <f82fdbc8-c77c-4551-88af-495c7d1db95e@amd.com>
Date: Mon, 2 Dec 2024 18:30:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v2 1/2] xl: Keep monitoring suspended domain
To: Jan Beulich <jbeulich@suse.com>, Anthony PERARD
	<anthony.perard@vates.tech>
CC: <xen-devel@lists.xenproject.org>
References: <20241126171941.170897-1-jason.andryuk@amd.com>
 <20241126171941.170897-2-jason.andryuk@amd.com> <Z0ieLBwYt2jm_WAa@l14>
 <95754086-9c90-4765-b386-299baf2b5f94@suse.com>
Content-Language: en-US
In-Reply-To: <95754086-9c90-4765-b386-299baf2b5f94@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7E:EE_|SN7PR12MB8027:EE_
X-MS-Office365-Filtering-Correlation-Id: ca6d7622-5f95-46de-7010-08dd13294776
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WTFDMEoxMklXR0FQeXdoK3c3K0IrWWdrTnRDYkk3dC9JTVEzb0NHODhtdTd6?=
 =?utf-8?B?cTcrVkw2REdld2NWNG9jZkNBMmhKQVhOUk1LblhSUjRqbXBEdm9xWUNhQlY2?=
 =?utf-8?B?TGJhbVlYMGhvUzRkOEdLL3VQVWo5TkQ5ajk4KzZ2WnNyMERTWHJxOTJ6UDlo?=
 =?utf-8?B?Zm9VTlZ5TjkxbzFmTEdMcXJyZzE2c2RRWnBwL0ZsNnNua1g1SndId1VrSS80?=
 =?utf-8?B?VzZaN0xMT1MxaG5ML2JzUzVQalo4SFpNbnR4SWp0cDBGRG9Kb2VJN2ZIcko4?=
 =?utf-8?B?dUdJbkdSSXhwSVhOZnE3Q0FoMmkxdHREeGNVZGlrYTJtSFp1YllLdjl3ckRG?=
 =?utf-8?B?UHAwdXBuQ2VES0tZRkRkbitVMk9MRzR2MTV4aW1xQmY4VXlQbXZQbU9wYVFP?=
 =?utf-8?B?ejdwZzVJa0tGQzZjWkJTUWgrZlY1OHcydStjMnp6SDYzZ3NkUks0RStLa3d1?=
 =?utf-8?B?V2FZOUYzZytBbUNSSjdKSDVmU0I2QjJqUWgxYk53UGhzRkQ3SmlORG5JUWlS?=
 =?utf-8?B?bDZjL0w5OVVRWGN6bmFhNFBtZ0w2NS9mTXBoSWNpVytVeW9OQ2thZXRNRVNF?=
 =?utf-8?B?TFNMSlYveEU5ZWV5cllXUWNONXFpemF3bEMzazhETUtZREl2WUJjTUFrUWZr?=
 =?utf-8?B?RndYZ1NKQjRYVGZ3blNmcmRTSG8vODRCTXNaWmt2L0RBSjJxdjh4cmVBaVhw?=
 =?utf-8?B?UENqNFkyb2czSnlVcU9nMVpzRDJDVTVDM1ZFRC9ma2tDV3ZaSlhlZkNtRUV0?=
 =?utf-8?B?VEZtSHZuSlhGQUVjTHZCSi9wT2pZTjNia2d5dDFzWDZJanI3Q0tQU214UWZh?=
 =?utf-8?B?YXE2Rmx2Q1FoL250dXR6QUhOUC9LNUMzU0FIRDB4alZPeGdiNWo4ZWo5dklK?=
 =?utf-8?B?N3NodllKWjhhWWxmNkliUk1rL1B1YktRY1JpbG90UHJnbkhGbG9ybzRRZitS?=
 =?utf-8?B?VXZ4clNRZkpLUEV4UjBOZ3J5Ym13djNTY1ZLNURvUTFGVXcrKzlTbS9NTWNF?=
 =?utf-8?B?SEtPM21LZ2RoVllXdE5QT3R1dHhnQzNTZTdCT2xmcHdSdS80NXpCYjlJc2lh?=
 =?utf-8?B?M2hRTG1MWHZhcnYvWXdtRE9OY1lIRHJyL01oSS9zSDNhbll0RUJsK1ZXb1JX?=
 =?utf-8?B?a2hJaHBGWFQvbjJWemdYbTNYcnFZakduYUo3bjhzM0RWUjNJVEN1KzV6SDUz?=
 =?utf-8?B?MU5lZmEyK1dwdmQ0WlhXK0xMcDhOTEk2MFZkMjJvSFovZzVCdHpCdWJTWFdP?=
 =?utf-8?B?K0g2azVVTG1NWU5vTHNUQnR4djgydGQ4eC9HSVJTaWoxd3pxckZUalFrdnBE?=
 =?utf-8?B?ZUpPa3lTVlJqN2FPZVJjbkRIenc2N1UxdmxTQ3B3V2RNbFFBaXB5NzloK3lH?=
 =?utf-8?B?WWpkakxzR1hXYVEyQnJLQW4xYWJMc3hmY3NMV2w0YXd6T1E1UjhlYjlYWDdG?=
 =?utf-8?B?VExkY0h6bG5NRUxyd0RDTURUbTNtV3E3NXBxcHF2eEkxcFU5T2ViYzhETC9k?=
 =?utf-8?B?L2ViMklmUEdOdFJsM0lURGxLZTNlbFpsS1VZZjFHQkRuaDJLMjEvUVJ5ZlFS?=
 =?utf-8?B?dGRWTUcwRmZ4aU9GVFVwcVBObXZNWmgrbzdVYk9mbG1nQko5b1RJWUR2dmxL?=
 =?utf-8?B?WUFCNXF5Vmswc3d0Q1lhTHdVL1F5ZkkxTWt2OWtOVHREaFRFRktpUEhDWjFT?=
 =?utf-8?B?R1dQOThjN2tQR3ZadjVwMjkxZVFBT0N6aDFMbEk1OUpyM1IvUmQ2K0lPa3VK?=
 =?utf-8?B?eHUyL0pSeHVtR1FXZEROenlLQk16bUh2amRreWNrb1B6VmV2YmN0TkE3TmQ3?=
 =?utf-8?B?VFVOeDdsRENLSVNEQ0I3czVMRGdoamRlZFBRWDJPM0FPNmtwcmZ1dHIxQ3RE?=
 =?utf-8?B?L0l6eHgxMzFpeTRTSU4ycVMrU1VtSm5BUVVQMm5NWHRBc2U4eDNaSVJOT0Qw?=
 =?utf-8?Q?RHmgg67/qoWo/bQYv4wQPXRx1iwNYtY4?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 23:30:16.8603
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca6d7622-5f95-46de-7010-08dd13294776
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8027

On 2024-12-02 03:53, Jan Beulich wrote:
> On 28.11.2024 17:45, Anthony PERARD wrote:
>> On Tue, Nov 26, 2024 at 12:19:40PM -0500, Jason Andryuk wrote:
>>> When a VM transitioned to LIBXL_SHUTDOWN_REASON_SUSPEND, the xl daemon
>>> was exiting as 0 = DOMAIN_RESTART_NONE "No domain restart".
>>> Later, when the VM actually shutdown, the missing xl daemon meant the
>>> domain wasn't cleaned up properly.
>>>
>>> Add a new DOMAIN_RESTART_SUSPENDED to handle the case.  The xl daemon
>>> keeps running to react to future shutdown events.
>>>
>>> The domain death event needs to be re-enabled to catch subsequent
>>> events.  The libxl_evgen_domain_death is moved from death_list to
>>> death_reported, and then it isn't found on subsequent iterations through
>>> death_list.  We enable the new event before disabling the old event, to
>>> keep the xenstore watch active.  If it is unregistered and
>>> re-registered, it'll fire immediately for our suspended domain which
>>> will end up continuously re-triggering.
>>>
>>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>>
>> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
> 
> While committing I was wondering: Does this want/need backporting (and hence
> was it perhaps lacking a Fixes: tag)?

Thanks, Jan.

I don't think it's really worth backporting.  Mainly, it hasn't been an 
issue in the last 14 years.  A Linux domU doesn't suspend itself - it 
only does so in response to a xenstore watch.  A domU *could* suspend 
itself without the xenstore watch, but that doesn't seem to happen in 
practice.  Since xl has not been able to generate those xenstore events 
prior to the `xl suspend` introduction, this code path hasn't run or 
been an issue.

The tag would be:
Fixes: 1a0e17891f ("xl: support on_{poweroff,reboot,crash} domain 
configuration options.")

Regards,
Jason

