Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7911CB0691E
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 00:12:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044730.1414808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubnsS-0003zJ-D2; Tue, 15 Jul 2025 22:11:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044730.1414808; Tue, 15 Jul 2025 22:11:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubnsS-0003wg-AM; Tue, 15 Jul 2025 22:11:56 +0000
Received: by outflank-mailman (input) for mailman id 1044730;
 Tue, 15 Jul 2025 22:11:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iFxc=Z4=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1ubnsQ-0003wI-Ff
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 22:11:54 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20610.outbound.protection.outlook.com
 [2a01:111:f403:200a::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b206ef79-61c8-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 00:11:47 +0200 (CEST)
Received: from SA1P222CA0027.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:22c::11)
 by DS0PR12MB8564.namprd12.prod.outlook.com (2603:10b6:8:167::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 22:11:40 +0000
Received: from SN1PEPF0002636A.namprd02.prod.outlook.com
 (2603:10b6:806:22c:cafe::f1) by SA1P222CA0027.outlook.office365.com
 (2603:10b6:806:22c::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.17 via Frontend Transport; Tue,
 15 Jul 2025 22:11:39 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002636A.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Tue, 15 Jul 2025 22:11:39 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Jul
 2025 17:11:36 -0500
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 15 Jul 2025 17:11:36 -0500
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
X-Inumbo-ID: b206ef79-61c8-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NkReAGmaMQpHu7R8qbZlwEFDRoKjoYsgMLWwU9iKhZ4gZKKNnpAie49btkj+KHfJ6PrHDx7SzZFM6G/9DiL3z2ufkby4gyM6SnyYPEORUsQGMdwg77XQp5CYRK6RWVrQOljrLn7lVuWTuyQROHuVew31XDy/zuYY1nTIrnhqp43KwjcPigbmwkHh7jWMQCoipU+V5C5d8R+iMrCkFMuf9vEMoR2fq9sc02T4kouY0+MlRNY1Nux6hagF+9YVlc1Vn1KEhSEgBl+Sr5tTgjYwu/nkWxXyCrbmcrp1CgN1q+f8pCd7lAV/Dl91iotgqdR74kq3ghrItmu8nYJxd39lNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6a4Oxs8y7fl6Z/96M3EqAklYq4UzbaT9g+TKb0L47pY=;
 b=Sn56nmdcE/KH84tG3qYsIn/YoeVMXtN8vtNk3wBcU3gE5ZW84Yj3ooMm8UmyhWgUynFA89nWrSSc7vaq0RqgkbpiGGWMYu3/WJcvMOL2oyOI6TAnhNVEAceM9cq6BPzloCQQo+srlNyiM5pwhg1pLNmlXzHY8++ABJ0xFwpGe+62TU6Ej9JpWgf5LO75GYBQ5wYC+auvkAZ4fsB1eY1nNlPAfcOS+cC4+txF5ctPAFzOk1B1+X9hfZh3ROlKAU0QjrgFR5XNFB/xa06Jy2YLG7R9YBXyh9n4itmkMvbq0b26UGNF+O4334Bz7R6cyBFK/4mmMwOfiAznpjBoaN+qfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=boeing.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6a4Oxs8y7fl6Z/96M3EqAklYq4UzbaT9g+TKb0L47pY=;
 b=zU/KYxwlzkOJn5XW7e1MgTaQnDO49GFWoskGR7ttE+oxU3YtQX4UtqzdCGlUlTuRRxPBVcWAQKwFDu9C+fvG6TVLBEgnR53yTZ3i/ziRzgAHRNA0qKrzwv49L/TzyWuvP9dZwgR9AFenIkZY75kJ7mZzX5HrMyMFE3/SgpwK3IY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Date: Tue, 15 Jul 2025 15:11:29 -0700
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Weber (US), Matthew L" <matthew.l.weber3@boeing.com>
CC: "Halder, Ayan Kumar" <ayan.kumar.halder@amd.com>, "Stabellini, Stefano"
	<stefano.stabellini@amd.com>, "Orzel, Michal" <Michal.Orzel@amd.com>,
	"Andryuk, Jason" <Jason.Andryuk@amd.com>, "Garcia Vallejo, Alejandro"
	<Alejandro.GarciaVallejo@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: Xen FuSa Upstream meeting
In-Reply-To: <BN0P110MB2067352A27047E225E661D46F357A@BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM>
Message-ID: <alpine.DEB.2.22.394.2507151510510.15546@ubuntu-linux-20-04-desktop>
References: <PH8PR12MB7326CD9FC34003205B37FBE2BC122@PH8PR12MB7326.namprd12.prod.outlook.com> <BN0P110MB2067BFB5E6870C738FEC8F99F375A@BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM> <BN0P110MB20673DB329FA51DD29773BB9F357A@BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM>
 <PH8PR12MB7326F2B61DBAB3A335B95093BC57A@PH8PR12MB7326.namprd12.prod.outlook.com> <BN0P110MB2067537CFB8CE5FEE5292E39F357A@BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM> <BN0P110MB2067352A27047E225E661D46F357A@BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="8323329-1444920785-1752617487=:15546"
Content-ID: <alpine.DEB.2.22.394.2507151511280.15546@ubuntu-linux-20-04-desktop>
Received-SPF: None (SATLEXMB03.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636A:EE_|DS0PR12MB8564:EE_
X-MS-Office365-Filtering-Correlation-Id: d3412f6c-876b-4d23-7145-08ddc3ec92b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ODBWYUtpTzlIY2hpek5LdWkwcHFnZXNYZUFXbFlud0JEZFdqcFpjTldZR0JY?=
 =?utf-8?B?NUhpdkNCZW16VllueGdEaFk5SnFLTlRIcER1RGpnZkw0SndRWkZFcXdCK1Yr?=
 =?utf-8?B?YlR5b3Y1WmhOTkVjUE1pb1BvdjF1eUgrQUhFb1A4VzZ4Uk1kNUNuN2ZtT1BF?=
 =?utf-8?B?SWV1NnlJalBtSHdMVEFMV1FLdzZSaSs3WTFFZE0yVnhHUXAvbjVwMmEvSVpa?=
 =?utf-8?B?M1FPaVdsblJLeXZieEwraGZiV1NJdUJxL0lnVFErT0lpYnduZDJ3Nk0yT083?=
 =?utf-8?B?K1ZzVkw0WUw4QVROZDFVMjNFWE9uUGovK3YwZXloZWV5ck5EMmhmV1FoTDBv?=
 =?utf-8?B?WkMyTVFiVUFYUEIwd3dzVGFQbFVjTDRPamVjNXpsNFN5Y3UyVWtDOWpQaUEx?=
 =?utf-8?B?SXp1Zm5Pcy9wc3dpWkppWVBwU0dSbEo1TlE5bVVuQW9GOWlJZjFRQkk4dGk5?=
 =?utf-8?B?ZGRwV0hRVUNOT3N1YmZDR2tucHZMY3FFY2k0WU5oeTRwemU5ZWIxWW9RaWhI?=
 =?utf-8?B?a2crNFVWMDZJdWpHRXgxWTRCU2grOXVPVkx3aW9Leis2citxSnMza3BYa0Vu?=
 =?utf-8?B?bmMyazVKRGcvVTZNVDRaeW1zMWtjQVVETHZ1SUZ2Ry9ZWkovTmVGOGZHamRo?=
 =?utf-8?B?NHgrMTg3TmJRNVFXQ2dJUjBCQTk2ejZUb2VYcXh0aldoQWtMRW5SYlhCV3dY?=
 =?utf-8?B?Vk0vQW9rZDY4U2o0bFhBZzF6OW9iMUdhaERtcFhYY1RuaTV0ODRsZk5Vc1Jx?=
 =?utf-8?B?Q291RHA5YmVEZnlJSDlhSVhWeEVRWUhqZ0JNOGR0dVZCTkRZMVUzZGVaK09F?=
 =?utf-8?B?ZXFycHZESmE1bktRTDZMWmhEWWVEZEFPak1GK0pwWWJMMzFZUWZQd2N1blF1?=
 =?utf-8?B?cC80VzNIclQxRHRPUmV1TlVnVGtQVS9ma3VXUkhBZWJ0dUV6UmRJK3FLdDJo?=
 =?utf-8?B?bmd6OTZWYVVoVVE2YTE3aWFmVzVhbkJreEdOSFlvVmlKd2YxTVJVVEV4Z1RO?=
 =?utf-8?B?dEFSTUF2K1A2a1A5V0tJZnlzSFFRbU5ZQ1JBT1FDcnZxSFREMW9PaTZnV3hV?=
 =?utf-8?B?V3dtNGdxd25ZbzJHbDBCT3VJUlJZWlR0VUltT1BQUE9XZ044WlFsRVAvRlU0?=
 =?utf-8?B?S2NmVHJQZnB0SXV6RmErRjcyZXhPL0NHTGVYT1JlSkRieTRjTU92V213aThP?=
 =?utf-8?B?T0hTOUxpSDk5QVByOG15aDFidlVBeE5adm8rdHhnZ1VDRTZDOER6NjdzbHl2?=
 =?utf-8?B?MGJUM1Y5aUxNQXlEWUhZUGJ1UzN4N3RhNHQ5ejV4aHVXNFN0RnQwbllnd0pZ?=
 =?utf-8?B?UkF6ejNDV1JFcmMxSDl0K2JBeElKMzc0MzZ1WFZEWEF2S01UT2JlOHFIOTRV?=
 =?utf-8?B?M2JMT25aUnlOWEphenM5b2Z0bFM0b1h3QmhDalhaRWhLMFlSZWZjNnA3UGV4?=
 =?utf-8?B?U3hmNkZsa0VJWFQ2V2d5VG4wV0lVL2dTWmNDQU9IU0k3aTVmUmVlMk80OFNR?=
 =?utf-8?B?RHhiTVFXNjBoZ0VYSGcvU2FhTGtiKzJDZm4xdURTY0FOek9icWF0Ty9ScG11?=
 =?utf-8?B?a09NZ1ZidWI5ejN5dmllUGRqanFOSlpjVXZZWFBCUTlOdkppMUhDSkQ0NmtN?=
 =?utf-8?B?VFl5VHNLNkVncXFhaWhVdUs1TkpYTzU2YzdUaWVZaXFPNExONXduMjl2emxX?=
 =?utf-8?B?SGp0Y3dsbTBTdTlueWZkVWhPcElXNmpyM0J1K0VnalJlb1VuamF4UjlscEgw?=
 =?utf-8?B?V3IxczFKejFOT3p3UTN3TzRrS1RIdjdtbWFDWk1tSmtkdlN0N1duSEZ4RlQ5?=
 =?utf-8?B?cFBEUXFxalpGdzQxWnJMNlU5QjdLVThNYkczZ0toenVKUWFxNUdabUd6MlA2?=
 =?utf-8?B?ZjNPZG1pWmlvaVBHY1lYZ1ZZdk9HV3RxWnRrQUQ1eW14Ynh5MTZwZlhOdjNP?=
 =?utf-8?B?OTlNMkYrQ1A0dklIaC84cmdTems3cFU3SFhmOU1FQnNtZHBTb0Z2RUlPNjlR?=
 =?utf-8?B?OGRLL0tqelZBPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 22:11:39.6935
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3412f6c-876b-4d23-7145-08ddc3ec92b7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8564

--8323329-1444920785-1752617487=:15546
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2507151511281.15546@ubuntu-linux-20-04-desktop>

Hi Matt,

It looks like your configuration is very similar to the one we are
targeting for automotive and industrial with minor differences (e.g.
scheduler control). We are well aligned.

Cheers,

Stefano


On Tue, 15 Jul 2025, Weber (US), Matthew L wrote:
> Looping the list in  @xen-devel@lists.xenproject.org
> 
>  
> 
> From: Weber (US), Matthew L
> Sent: Tuesday, July 15, 2025 10:16 AM
> To: Halder, Ayan Kumar <ayan.kumar.halder@amd.com>; Stabellini, Stefano <stefano.stabellini@amd.com>; Orzel, Michal <Michal.Orzel@amd.com>;
> Andryuk, Jason <Jason.Andryuk@amd.com>; Garcia Vallejo, Alejandro <Alejandro.GarciaVallejo@amd.com>
> Subject: RE: Xen FuSa Upstream meeting
> 
>  
> 
> Thanks Ayan,
> 
>  
> 
> I think our DO-178 ARINC cert use case is very simple with a dom0less configuration that doesn’t need most/any traditional toolstack
> provided functions.  We need a thin layer on the hypercall interface (dom health management stuff, scheduler control) and some
> pre-population of data in the device trees for domU(s) that expresses static attributes of the domain which usually would have come through
> xenstore.  Otherwise everything else is static shared memory.
> 
>  
> 
> Regards,
> 
> Matt
> 
>  
> 
> From: Halder, Ayan Kumar <ayan.kumar.halder@amd.com>
> Sent: Tuesday, July 15, 2025 2:49 AM
> To: Weber (US), Matthew L <matthew.l.weber3@boeing.com>; Stabellini, Stefano <stefano.stabellini@amd.com>; Orzel, Michal
> <Michal.Orzel@amd.com>; Andryuk, Jason <Jason.Andryuk@amd.com>; Garcia Vallejo, Alejandro <Alejandro.GarciaVallejo@amd.com>
> Subject: [EXTERNAL] Re: Xen FuSa Upstream meeting
> 
>  
> 
> EXT email: be mindful of links/attachments.
> 
>  
> 
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
>  
> 
> Hi Matthew/Stefano,
> 
>  
> 
> Apologies for missing this.
> 
>  
> 
> Michal has summed up the issue as follows :-
> 
>  
> 
> Toolstack is out of scope for safety certification. This is mostly because large part of the toolstack exist to create/destroy or handle in
> general runtime domains. That said there are services like xenstore that may be required e.g. for PV drivers (Xenbus and Xenstore are
> needed here). With the introduction of split domain capabilities e.g. separate control, hardware, xenstore domains it may be challenging 
> at first to boot hardware or xenstore domain with toolstack. This is because the toolstack has a lot of cross dependencies with libraries
> relying on e.g. control capability. It's not really possible today to carve out unneeded stuff from the toolstack to only provide e.g.
> Xenstored.
> 
>  
> 
> We need to have a discussion to understand what approach we should take.
> 
>  
> 
> Michal, Jason, Stefano, Alejandro should be present.
> 
> Do we need Julien and any other maintainer (Jan) ?
> 
>  
> 
> I will be away next week.
> 
> Stefano can bring up this topic and record the discussion.
> 
>  
> 
> Kind regards,
> 
> Ayan
> 
>  
> 
> From: Weber (US), Matthew L <matthew.l.weber3@boeing.com>
> Date: Tuesday, 15 July 2025 at 02:15
> To: Halder, Ayan Kumar <ayan.kumar.halder@amd.com>
> Subject: RE: Xen FuSa Upstream meeting
> 
> Do you take agenda topics for this call?  I wondered about getting feedback on these two topics.
> 
>  
> 
> https://old-list-archives.xenproject.org/archives/html/xen-devel/2025-07/msg00531.html
> 
>  
> 
> https://old-list-archives.xenproject.org/archives/html/xen-devel/2025-07/msg00564.html
> 
>  
> 
> Best Regards,
> 
> —
> 
> Matthew L. Weber
> 
> Associate Technical Fellow / ELISA Aerospace WG Chair
> 
> LinkedIn | GitHub | GitLab | LXF Open Profile
> 
>  
> 
> [IMAGE]
> 
>  
> 
>  
> 
>  
> 
> -----Original Appointment-----
> From: Halder, Ayan Kumar <ayan.kumar.halder@amd.com>
> Sent: Wednesday, June 11, 2025 7:15 AM
> To: Halder, Ayan Kumar; Weber (US), Matthew L; artem_mygaiev@epam.com; francesco.rossi@resiltech.com; Aniket Saha; Mukhin, Denis (D.);
> NETCHITALIOUK, ANDREI (A.); Kate Stewart; David Ward; Rafał Misiura; marco.demi@resiltech.com; Bertrand Marquis;
> hisao.munakata.vt@renesas.com; Kim, Haesun; Ahn, Sookyung; roberto.bagnara@bugseng.com; Paweł Kaleta; stefano.dellosa@intel.com;
> Ragiadakou, Xenia; Hildebrand, Stewart; Orzel, Michal; fusa-sig@lists.xenproject.org
> Cc: Luca Fancellu; francesco.brancati@resiltech.com; Alex Agizim; Rahul Singh; Robert Heinen; Stabellini, Stefano; Chan King Choy,
> Nathalie; Lira, Victor M; Iglesias, Edgar; Andryuk, Jason; Miccio, Luca; Rafał Tomaszewski; Andrei Buzdugan; Eugene Nebrat; Piotr Serwa
> Subject: FW: Xen FuSa Upstream meeting
> When: Tuesday, July 22, 2025 3:00 PM-4:00 PM (UTC+00:00) Dublin, Edinburgh, Lisbon, London.
> Where: https://amd.zoom.us/j/92115684076?pwd=sKEw5EfYN6KcYhz15mbftYqAyaRm8R.1&from=addon
> 
>  
> 
> EXT email: be mindful of links/attachments.
> 
>  
> 
>  
> 
> From: ayan.kumar.halder@amd.com
> When: 15:00 - 16:00 21 January 2025
> Subject: Xen FuSa Upstream meeting
> Location: https://amd.zoom.us/j/92115684076?pwd=sKEw5EfYN6KcYhz15mbftYqAyaRm8R.1&from=addon
> 
>  
> 
>  
> 
> Hi ,
> 
>  
> 
> This is our regular meeting series.
> 
>  
> 
> Ayan
> 
>  
> 
>  
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
>                                                          Image removed by sender.
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
>                                                                  Hi there,
> 
> 
> 
> 
> 
>                                       Ayan Kumar Halder is inviting you to a scheduled Zoom meeting.
> 
> 
> 
> 
> 
>                                                              Join Zoom Meeting
> 
> 
> 
> 
> 
>                                                               One tap mobile:
> 
> 
> 
>                        US: +19292056099,,92115684076#,,,,*1507305560# or +16699006833,,92115684076#,,,,*1507305560#
> 
> 
> 
> 
> 
>                                                                Meeting URL:
> 
> 
> 
>                              https://amd.zoom.us/j/92115684076?pwd=sKEw5EfYN6KcYhz15mbftYqAyaRm8R.1&from=addon
> 
> 
> 
> 
> 
>                                                                 Meeting ID:
> 
> 
> 
>                                                                921 1568 4076
> 
> 
> 
> 
> 
>                                                                  Passcode:
> 
> 
> 
>                                                                 yV39aa%pi0
> 
> 
> 
> 
> 
>                                                              Join by Telephone
> 
> 
> 
> 
> 
>                                      For higher quality, dial a number based on your current location.
> 
> 
> 
> 
> 
>                                                                    Dial:
> 
> 
> 
>                                                        +1 929 205 6099 US (New York)
>                                                        +1 669 900 6833 US (San Jose)
>                                                         +1 720 928 9299 US (Denver)
>                                                          833 928 4610 US Toll-free
>                                                          877 853 5257 US Toll-free
>                                                          888 475 4499 US Toll-free
>                                                          833 548 0276 US Toll-free
>                                                          833 548 0282 US Toll-free
>                                                          833 928 4608 US Toll-free
>                                                          833 928 4609 US Toll-free
>                                                           +91 406 480 2722 India
>                                                           +91 446 480 2722 India
>                                                           +91 806 480 2722 India
>                                                           +91 80 71 279 440 India
>                                                           +91 116 480 2722 India
>                                                           +91 225 097 2744 India
>                                                           +91 225 097 2745 India
>                                                           +91 226 480 2722 India
>                                                           +91 22 71 279 525 India
>                                                      000 800 919 1676 India Toll-free
>                                                      000 800 001 4002 India Toll-free
>                                                      000 800 050 5050 India Toll-free
>                                                      000 800 050 2340 India Toll-free
>                                                      000 800 050 2400 India Toll-free
>                                                           +353 6 163 9031 Ireland
>                                                           +353 1 536 9320 Ireland
>                                                           +353 1 653 3895 Ireland
>                                                       1800 719 875 Ireland Toll-free
>                                                       1800 901 561 Ireland Toll-free
>                                                       1800 943 965 Ireland Toll-free
>                                                       1800 949 238 Ireland Toll-free
>                                                           +65 3158 7288 Singapore
>                                                           +65 3165 1065 Singapore
>                                                      800 852 6054 Singapore Toll-free
>                                                      1800 407 5602 Singapore Toll-free
>                                                      800 101 3814 Singapore Toll-free
> 
> 
> 
> 
> 
>                                                                 Meeting ID:
> 
> 
> 
>                                                                921 1568 4076
> 
> 
> 
> 
> 
>                                                                  Passcode:
> 
> 
> 
>                                                                 1507305560
> 
> 
> 
> 
> 
>                                                            International numbers
> 
> 
> 
> 
> 
>                                                     Join from an H.323/SIP room system
> 
> 
> 
> 
> 
>                                                                   H.323:
> 
> 
> 
>                                                          144.195.19.161 (US West)
>                                                          206.247.11.121 (US East)
>                                                       221.122.88.195 (Mainland China)
>                                                        115.114.131.7 (India Mumbai)
>                                                       115.114.115.7 (India Hyderabad)
>                                                   159.124.15.191 (Amsterdam Netherlands)
>                                                          159.124.47.249 (Germany)
>                                                     159.124.104.213 (Australia Sydney)
>                                                    159.124.74.212 (Australia Melbourne)
>                                                       170.114.134.121 (Hong Kong SAR)
>                                                         170.114.180.219 (Singapore)
>                                                           64.211.144.160 (Brazil)
>                                                      159.124.168.213 (Canada Toronto)
>                                                      159.124.196.25 (Canada Vancouver)
>                                                        170.114.194.163 (Japan Tokyo)
>                                                        147.124.100.25 (Japan Osaka)
> 
> 
> 
> 
> 
>                                                                 Meeting ID:
> 
> 
> 
>                                                                921 1568 4076
> 
> 
> 
> 
> 
>                                                                  Passcode:
> 
> 
> 
>                                                                 1507305560
> 
> 
> 
> 
> 
>                                                                    SIP:
> 
> 
> 
>                                                           92115684076@zoomcrc.com
> 
> 
> 
> 
> 
>                                                                  Passcode:
> 
> 
> 
>                                                                 1507305560
> 
> 
> 
>  
> 
> 
> 
--8323329-1444920785-1752617487=:15546--

