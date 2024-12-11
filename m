Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA2D9EC72E
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 09:29:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854087.1267376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLI5c-0000fD-PB; Wed, 11 Dec 2024 08:29:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854087.1267376; Wed, 11 Dec 2024 08:29:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLI5c-0000cd-M5; Wed, 11 Dec 2024 08:29:00 +0000
Received: by outflank-mailman (input) for mailman id 854087;
 Wed, 11 Dec 2024 08:28:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6HwW=TE=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tLI5b-0000cX-94
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 08:28:59 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2417::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f72b463d-b799-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 09:28:57 +0100 (CET)
Received: from CH0PR03CA0093.namprd03.prod.outlook.com (2603:10b6:610:cd::8)
 by CH3PR12MB8331.namprd12.prod.outlook.com (2603:10b6:610:12f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 08:28:54 +0000
Received: from CH2PEPF00000099.namprd02.prod.outlook.com
 (2603:10b6:610:cd:cafe::4f) by CH0PR03CA0093.outlook.office365.com
 (2603:10b6:610:cd::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.15 via Frontend Transport; Wed,
 11 Dec 2024 08:28:53 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF00000099.mail.protection.outlook.com (10.167.244.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Wed, 11 Dec 2024 08:28:53 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Dec
 2024 02:28:53 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 11 Dec 2024 02:28:51 -0600
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
X-Inumbo-ID: f72b463d-b799-11ef-a0d5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NKv36r8ipnZ6AKp1hKmHwtEZ4xRg7frw1YXSDNeDFaQD1x3ZNAz1jPCIAP54o/+zCKxw4bMKWDmeSB4+Lh8iuCSLzKFAZbI5NjNlMtOLNF/pypQctOskGAjft/iAmJBXEocKQPkFTIAFCbKOSFe8uoaByphdQmw4r4syD9bjystEte61Lg5dDPaHEts2O6hqm24zQCSHzMfxmOMJJiJvnwAPE6ev1pNnZ6Z7lPp8VlPAmwi6O+cEynw5sMmL6jSFjPx+YQ3nIwm+3OOswyL8tzpfo8bmOjaFCeiX+QnGI2Vgarwp2gumk7wvZRpWx68xL2SMKNu3qAiIMFLxoBPq1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eLzfNi0grz/VmUoUxhLB8I2Zxu5Hrcj1Raz7s7mg02s=;
 b=POb56IF3ad2CU/uNWG9bhdHO1Gu5oaah1bwGoYuse64TpjddhovYJc0TBbufrlCxvvxuDQtuDSOA/IBdQVxTrrGr1SjkbE/28jPJ453ZlvZ+lQmQwGITbrtxXR/oaQLR5nuATle7F8CmruYwRZGPUcOM3n4uaaOKtM2aOyxIjOq4wAugxWw/RcZ59qC/XaPr5kOVQl/BEcFRlNRYGiu/yNDyZL/cQAez1dKVil1gNk7X87aV+bjK9h0WkK+6LiAttDS0rfm/6YgLCpDjJOmxc6ulQlz6r7U8+MYZmZCVT0duIJI6i3ZiCDIO2ulmf8uii99rXeVUOMkz9n5lta7A1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eLzfNi0grz/VmUoUxhLB8I2Zxu5Hrcj1Raz7s7mg02s=;
 b=AQafi4/Tfj0sj6uiOPVnu2yZjwM0hcvOu40twmy4iAupECW9JhpxqD/lc00Vz+awSZptIatoWfwF//blRuyzA7AybNLqWx7VAQvUGE1uYsVjofSUtQlTVoJ0z0Qs1BxXY1kYtqWqMyvET7jHwbF0wJ3q+tNXbiQ91ZtOPnFPHm8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <b39c4355-7b13-49b9-b336-ae4f0fa68956@amd.com>
Date: Wed, 11 Dec 2024 09:28:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add Anthony, Michal, Roger to THE REST
To: Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
CC: <kelly.choi@cloud.com>, <anthony.perard@vates.tech>,
	<roger.pau@cloud.com>, <committers@xenproject.org>
References: <alpine.DEB.2.22.394.2412101558000.463523@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2412101558000.463523@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000099:EE_|CH3PR12MB8331:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b513a57-85b4-49c1-d7ef-08dd19bdd91e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N2NEU2FzSyt4UmJwMmNJb0N1TTZJRkYvc1M3dkUzczRHdDFVTVNRTjYrZ2ZP?=
 =?utf-8?B?d3dnK1BvOUFhQWZTNksxU3FyME41Z0tmZlBYc0JXeUJvcXNqeVYva0dyblpP?=
 =?utf-8?B?VnlTYUFiNWNnNTB0Tk0zeHJTRFB6TG5kb2oxdklDNGZKUjMyNlcvcmtPYVkv?=
 =?utf-8?B?Q2JUU2FUY0Evc1VOQzdUTzZDODBvcnFkTitMQ1Vib3RZVGtDbWsxTEZ6MmJm?=
 =?utf-8?B?a3lNZ1YyTW42UGttNlA4N2JXbmxaQWpRcENCaVJabExVR2YvWHZWc0VXNVVi?=
 =?utf-8?B?N21kV0RPTTlWMnY5S01ZZloxVkdPUEhlMm1zRk1ocDRxV0Ywd0NnbVlYdmx1?=
 =?utf-8?B?aVp2N01xeHBpMTVMdkRhU1V4MnF3cDk3OGVHM1BJVmhOVDE3dzZGSHo5dllw?=
 =?utf-8?B?bXhnTGh6V3I4b1FNczhLVkh0VkRyTjVTdGUyRnpSai9yRnM2Szc0NWhqUXB1?=
 =?utf-8?B?aDBFVGlZRU16WDJkTFE1UEY3Rk1sdUhlWXUxMXdINWdHSlRnbm5vWklhNytB?=
 =?utf-8?B?Mk1abW8vWVZlZ3puYk5TajNpT2QwaHpxRFUxUzRqMmhRZm02Tlc0dmlzREcv?=
 =?utf-8?B?WmJ2cmlncFhkK0hjNmhnYXB2VTZDc1M4TCtSRUg1VlZpQTZ4OUF5R2RxR2NX?=
 =?utf-8?B?Ui9kVEVHSHowUzB6NjN6SDV1TlovVUFHVFNCVGxpNzErQlZNUE9BUDl1NmNn?=
 =?utf-8?B?eDdpSkxvNlUwKzI0SDJ6WHp2RFpuc1hMWUtydkJXUTdkTXowTWt3bTN4eDFy?=
 =?utf-8?B?aEd0aXRUWWJMdkV5bkl3MFhmL2p2K2MwbmZENldyMXdzbmFwSzVHTWFha2tE?=
 =?utf-8?B?OHlyZHFlTW1aeEllL3EyN2FVUGFXdnQvWFNveHFxejUvQUJLcm5NclZJeTdW?=
 =?utf-8?B?aExwTitxTW9yYWw0S2hJcktIR3d5RXNrQnJ3aWx4RlRoUmtuYm81NlpjVnRs?=
 =?utf-8?B?RXNWdTRjSWwrZnJzWVBtSWpjMzFudjZBanRpbzRoM05uL3RvNUlEOUc4b1pL?=
 =?utf-8?B?dDJjYmNZN0k4UnVsbUIvYWF6SkgyRjltRWg3KzJ4dU1hY0Zid3I4YW9YU1JE?=
 =?utf-8?B?ek0vZUU2RFhyWWNJZzVVemM3bDNqbnZlSVRoUkk1Z3ZVMUV2aWVNY01raExq?=
 =?utf-8?B?cUN6TVhUa0NZK0t4dlMwSkg3aEdOTDdHb3Fja200NlBXTnc2ZGtwLzlnMjNZ?=
 =?utf-8?B?TlJDbkFOOG1TQ2JjRDYzWEFkSDdvRVNPekREWk8xRUFrVkN0bXdLOHNjR1Qr?=
 =?utf-8?B?WEFTbHl2T0tOSnlPV0J2Zlc1Q0JiMDJnRVZnU2NCOXpqWUJ3Qk1IM3lZSDlq?=
 =?utf-8?B?R0ZjUlNHQTdzbGNNZ3Z6anlVdERTRTNhdU5sc3NrQUc1WlVKMG1iMGJXUHhi?=
 =?utf-8?B?Q0ViUCtJL3E1M1VSL2xVTmpFUjJHVmdPRFlTQ3JVNjRhTWxGSXV4akJSVUYy?=
 =?utf-8?B?R21KUll4Sk5ReTBXZWxKV2hjbG5WRDhIUFBBN0ZaUmRJUDQ4M2xYTEEvT1Ar?=
 =?utf-8?B?MExya3NFamgxOEovL29ERSt0QzJ5OVN0ZXZYVDZxeTdLeXVRbmw1ZEJJOHNt?=
 =?utf-8?B?ZmJuaU1vQlA3NzkrTFl3VDFLdVBCVE1jMUdiTVQyZFZOZmpjT0p3Z2kzNTMx?=
 =?utf-8?B?cGxwREVmaHFPMFZtdDRXZFVVbHhLSTlmQXBmTzN2UmxHNUxLMHAwNmxiMGt3?=
 =?utf-8?B?V2dFOW1SUm5LNkNSVUlWaStZZHBVWWkwc0IrN0tkeFZJM3dHZjNBOGJibWQ1?=
 =?utf-8?B?YmkyQWZZR1VtdURydk9NQ2xsaFdpZmtCUkVRb1J0L3BnUmJqWEgySUpaaDhq?=
 =?utf-8?B?czQ1ZlRVeUhwNHRPeFFUbWFiemZJS2s5T2JhRW5PcW8wSTk0aTFVVVZwWlZN?=
 =?utf-8?B?TUdBd0ZVYndvbU5LWmsxWHdtU2pHdk8wUlVuN1JzOHVHaHZiSVlReXA5cWRP?=
 =?utf-8?Q?I1qJPqqu7VXj/SJtEHNvICRKE36PFYvm?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 08:28:53.7887
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b513a57-85b4-49c1-d7ef-08dd19bdd91e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000099.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8331



On 11/12/2024 00:58, Stefano Stabellini wrote:
> 
> 
> In recognition of their outstanding work and years of service to the Xen
> Community, please join me in welcoming Anthony, Michal, and Roger as
> Committers and REST Maintainers.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


