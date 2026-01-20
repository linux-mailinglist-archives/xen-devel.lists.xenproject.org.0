Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEqwAzW0b2nHMAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B9348272
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209178.1521287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viDrV-0003tG-Pu; Tue, 20 Jan 2026 15:41:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209178.1521287; Tue, 20 Jan 2026 15:41:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viDrV-0003qs-NF; Tue, 20 Jan 2026 15:41:45 +0000
Received: by outflank-mailman (input) for mailman id 1209178;
 Tue, 20 Jan 2026 15:41:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fwra=7Z=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1viDrU-0003qf-P4
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 15:41:44 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8285e378-f616-11f0-9ccf-f158ae23cfc8;
 Tue, 20 Jan 2026 16:41:40 +0100 (CET)
Received: from SN7PR04CA0179.namprd04.prod.outlook.com (2603:10b6:806:125::34)
 by BY5PR12MB4065.namprd12.prod.outlook.com (2603:10b6:a03:202::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 15:41:35 +0000
Received: from SA2PEPF00003F63.namprd04.prod.outlook.com
 (2603:10b6:806:125:cafe::4e) by SN7PR04CA0179.outlook.office365.com
 (2603:10b6:806:125::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.11 via Frontend Transport; Tue,
 20 Jan 2026 15:41:34 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003F63.mail.protection.outlook.com (10.167.248.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 15:41:34 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 20 Jan
 2026 09:41:32 -0600
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
X-Inumbo-ID: 8285e378-f616-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pixu8xJkCFNmzG+2p5EtmVacX7LQDczeA3QBZjUx2zW7opSFd3vJN6Aah0pSSotyyY4EqWqigDyGJW2mICPedYTfPOiLetZexXKkO7AZSGjn8zi/Dn5NAea8zyNERMoqc0S+2TpxsBO/lP1hy1Q4StRpyAzc/DCjrEtjVZuUXjZhSQ2QAnQ8tL8NfGV+4q2ar6z6A5Ucmktoy+VsKSwPNEMtZIum4m9X/ALVrBQd2eo9pELuS6hOUaN790vWyZjqrcobs1BIxkfj4UDVnxdaTxRKShh2wBnSwhH567LdwM7Y4Dd0JSnQDe3oDjHgfHYMIcJibPp+9oI/AuiAvcGYKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBG90rR2/J7jngo9T9ZlDK3DYeox/fWTuf/UqvJHEF8=;
 b=BIpBx2ujeW3DfIJb1vlhE0gyWs7jpQVHDbhlYt9ioJHak0jH01sHqnJL4DnU2QzGGZ4nw2oZlDe93SCNoZDP8bgXchBBw4StzxY5lRYjQGm44jnwqIVwuTVzvub5imliXqvnpsfgNx+G0jT4/dNkOilsjRfPI16OcEFGR8piznBo5EhlmJZkcKh8t/O1YvF78FlL53MRDICyh6vrHbK4kuAKRH9GyhvA/1SUp4AVdlN4YEogWhWyWHmwyPthsrq54h7mkGS4z4FL/+6sqwyVJfqjsAG/W692yYH26a/M88otmIkofYCCFhmES05d0ehRkFgBxLDUJ62dlLi9HCw/lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBG90rR2/J7jngo9T9ZlDK3DYeox/fWTuf/UqvJHEF8=;
 b=GIqAr4fbzouty+q7OmJoZiLF4lpWcICpP/zHidWf2VmFLyoU+iOPo7zjbxNC3PlEC0YvmTsP3A748izh+XEMIOQEdK+rbWSf8s1FcD19znhRTKF8d7MYlggq0dvo8QUnV+KDHqLxKSS7XxjKn8isJ8S3tXtSO0Vij+H90ZYkyds=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 20 Jan 2026 16:41:31 +0100
Message-ID: <DFTJ45D49RX1.19R31RN35VYMR@amd.com>
CC: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, <xen-devel@lists.xenproject.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Xen-devel
	<xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH 2/2] x86/svm: Intercept Bus Locks for HVM guests
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
X-Mailer: aerc 0.20.1
References: <20260120095353.2778-1-alejandro.garciavallejo@amd.com>
 <20260120095353.2778-3-alejandro.garciavallejo@amd.com>
 <5a4aa1d9-dafb-453c-bd4c-8da860519f01@citrix.com>
 <00f36b33-65d5-4681-84d5-e1b2cbd8830d@suse.com>
 <b8df289c-a770-4186-b922-dbfba1bbbfc6@citrix.com>
 <b92c9a26-dd84-4298-adcb-5b1066e2174f@suse.com>
 <ced1c404-6170-4275-b0e3-be851bf03c3d@citrix.com>
 <da99461f-aa69-4a15-b8ec-e49728fc3db5@suse.com>
 <4ec779cb-3cbf-42cf-b744-80145d3cd54c@citrix.com>
 <48ccad85-8b6b-40ae-938e-b6ef9dae0ccf@suse.com>
 <DFTITYPYGHMY.1096HGJFT1HNB@amd.com>
In-Reply-To: <DFTITYPYGHMY.1096HGJFT1HNB@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F63:EE_|BY5PR12MB4065:EE_
X-MS-Office365-Filtering-Correlation-Id: 048e6fb7-3dc5-4503-0cfc-08de583a6424
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ODZySFQyTWNScnMzcDRUZzV4T0Z1cklJVkszbThUc244UGZhc1JjT29jOTQ1?=
 =?utf-8?B?R0pKbzlOM2NjbURoV2w1M2Yya01vSFJTTTZUc090N2lIUWh3M0l2VC9LN1Zl?=
 =?utf-8?B?N3U0ZEhzdFlhWnhuM0JqRFV1T2lsL2JIM0twQUVncWw0SHREcnRNUWRacHl3?=
 =?utf-8?B?R2VYREJDRkJwNVNwbjMrZHBFSlFrQW9ITDNFeFZmTy9qVjRHcEpyS1JjYUFE?=
 =?utf-8?B?NWVSdE9uR1YwVVdSaGVxeFhXV2pLb0djU0lWOUtCb05VeWdzKzhCY3ZYeG5p?=
 =?utf-8?B?aXc4NHNLV3lFUFRxZjdhN29NeVlTanBBUmxCejRsdTR6RThlTldxRG45aGRJ?=
 =?utf-8?B?RWJ5eEdhY2FKbTI1T0s2emdLRmYwc1VsVXVNaGlraFlteGZ0VzA5SVJ1S1lL?=
 =?utf-8?B?eTFab3EzdndWNmZiUmU2STgyYXFmN1JnbUZMMlVoenpuOXlWK3RoNnJOZXlZ?=
 =?utf-8?B?czZYM1Y1c1JkSitxZDI1ZWR6Rnl3L1FiTFA5SU9qRXdUYlhVaUx3ai9zUlVm?=
 =?utf-8?B?T2kydG91TWwxSkFoakNMK2RWUWJIQUZTSHRXek5LT21xblBKcXVrRHI5THpZ?=
 =?utf-8?B?b09JOFZWV3NpSUNYc0dtcHFHYlhZeW1yNExCR1c4ZUNERzh4OG53b1BueFZo?=
 =?utf-8?B?emlJSWZGODF5S2VGTlhYUTF5NEdXNGdtaUQ3Z29KSTFJelBWR29UQ2ZDRThG?=
 =?utf-8?B?eXhZZFg3M0Z2RDdaZGQzK2RwclBaWWZBeXpFN1VuS0FYcjRkMSs1azQrQjFy?=
 =?utf-8?B?UXlVVUlKU0Q2SmdoZnJuL2QydkdFRFNNRmJmWmR5NzB4YzRjSndKWk41UlpU?=
 =?utf-8?B?KzlLYXdVRENObUcwVVR0R1lCZlBBZlJvNzF0dThVMXV3aFU4OW5HeXlEZW5o?=
 =?utf-8?B?Ry9YQ3NLSXNzdWVySm9hTHJEakZ2YXVqS0JJbHJFQjdkK09DbTN6eUNUVEpu?=
 =?utf-8?B?R2syRDZQWjFIWWdYZWZqVHQwSEZOYWRZeTl0M1M1MWVCS2ZweFF3WW83Sk9B?=
 =?utf-8?B?WG9kODRCSG1vQWZIdXJ3aE1aWFZhL3pPdnJJNE9jUmRnOUNidkkzRlhBUXR0?=
 =?utf-8?B?ekZJRFdUaGZJdFJtMkZnU1FJNWZ5MjArMVM0QUJEdjNoU0pMditqbmFCSXV5?=
 =?utf-8?B?a1VTb3FlTVdxbHhRcW1tdGxOYXdsaFlJdURXL1dTYkdjWE9PU0s5S3h2ejVp?=
 =?utf-8?B?dmc0cHJXQVNTdUxtL1FUdHZvMFZGUXl6alppL1ErSHBJNlV3R2pvM1dZOXIr?=
 =?utf-8?B?ZE1EY0pweTkyU3lJMXc1eGdyOHo2bmpLZHA2YkhyNTk5a200dTI1bWpUcWcz?=
 =?utf-8?B?Y1ErQTBJdFhPSVdWNUt5anlZeGhSZ0xGSUZ1MjVnanE2N0oxWURqM0ZxVnZE?=
 =?utf-8?B?OVg4OG9mNVlJbUVoQmR1dE8yak80ZzRFTjV3YUR5MlIvdmduSDg2YnN0RHM2?=
 =?utf-8?B?S1BGNE13NEdSUWZDRDdwYTc1U1FmTERhRVN4L2x4ZjVIcVF3TlA1UDVOZTJ0?=
 =?utf-8?B?YXVyUTR0NGlPR1QwVWlEclppUmRBcS8vNGJsVHh0RFVwY2ZaV0RmcnFSSVFH?=
 =?utf-8?B?R3hvQTl5SXFtK1JDeXo1djNUWjFuNlNNQkxSdmowb2JZQ1hBczNRMzNVVlNU?=
 =?utf-8?B?S084aXljMDlmcVRreDlxZlBPUGhjMDQ5U1g1c3k5UkFZMDFvTmg3YkNlQTd1?=
 =?utf-8?B?d3Y2eTlkZmdBak9aNjdxUUlKK0RLVTFCeU03eGM5bnRtQmJyRUJ0RjBLUnJy?=
 =?utf-8?B?NFhQa0lvY0hubUU3c3owcll2U2M2NU5GaGtad3FBVVhpbndobnJWZGlhUVZ6?=
 =?utf-8?B?Mk5kZE9obnZhc3B0cmxtN0I3NFZvQ3ZMSkplUSswRlVqekNyMWZmUTFObUVj?=
 =?utf-8?B?SUk1UjdxMy9ZL2w2ZDlWRC9SR09NVEJzTzBYRnQ4UTNtMWs3eDdmZ2tUdFBo?=
 =?utf-8?B?bWxEV08vRVY5eUN2ZkFhMm9BR1V2SENvMzFrTERVQmlJNWpreXFvZG1uOVI4?=
 =?utf-8?B?RlptT2tneTk1Ni9lZlFNQVJTdUx5eWlpakpJeDRxM2I4YjA5WEhVU3NVZU5S?=
 =?utf-8?B?QmJtRmY4LzFXVmRxYkNBNk93NVhuVEhLMTgxcThmQk9YMnIza055cHRrWDJ6?=
 =?utf-8?B?WG04bWxlNHlhVW81aTErNGUzWGN1OXBJeW9Za3NSbzZwbjVsN1hwWno3TlVQ?=
 =?utf-8?B?b3VNVkszYUE3dmNVNlBxUmtWbiszNmtBRFdEVmhJelRsbzZkcmFYQkdHZjVn?=
 =?utf-8?B?a2FSeHlHUjdESXViUVN5Mk9HNzdnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 15:41:34.4001
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 048e6fb7-3dc5-4503-0cfc-08de583a6424
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4065
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:xen-devel-bounces@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 86B9348272
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue Jan 20, 2026 at 4:28 PM CET, Alejandro Vallejo wrote:
> On Tue Jan 20, 2026 at 3:32 PM CET, Jan Beulich wrote:
>> On 20.01.2026 15:26, Andrew Cooper wrote:
>>> On 20/01/2026 2:16 pm, Jan Beulich wrote:
>>>> On 20.01.2026 15:11, Andrew Cooper wrote:
>>>>> On 20/01/2026 1:34 pm, Jan Beulich wrote:
>>>>>> On 20.01.2026 14:29, Andrew Cooper wrote:
>>>>>>> On 20/01/2026 1:27 pm, Jan Beulich wrote:
>>>>>>>> On 20.01.2026 14:18, Andrew Cooper wrote:
>>>>>>>>> On 20/01/2026 9:53 am, Alejandro Vallejo wrote:
>>>>>>>>>> --- a/xen/arch/x86/hvm/svm/vmcb.c
>>>>>>>>>> +++ b/xen/arch/x86/hvm/svm/vmcb.c
>>>>>>>>>> @@ -66,6 +66,12 @@ static int construct_vmcb(struct vcpu *v)
>>>>>>>>>>          GENERAL2_INTERCEPT_XSETBV      | GENERAL2_INTERCEPT_ICE=
BP       |
>>>>>>>>>>          GENERAL2_INTERCEPT_RDPRU;
>>>>>>>>>> =20
>>>>>>>>>> +    if ( cpu_has_bus_lock_thresh )
>>>>>>>>>> +    {
>>>>>>>>>> +        vmcb->_general3_intercepts =3D GENERAL3_INTERCEPT_BUS_L=
OCK_THRESH;
>>>>>>>>> |=3D
>>>>>>>>>
>>>>>>>>>> +        vmcb->bus_lock_thresh =3D 1; /* trigger immediately */
>>>>>>>>> Really?=C2=A0 The APM states:
>>>>>>>>>
>>>>>>>>> On processors that support Bus Lock Threshold (indicated by CPUID
>>>>>>>>> Fn8000_000A_EDX[29] BusLockThreshold=3D1), the VMCB provides a Bu=
s Lock
>>>>>>>>> Threshold enable bit and an unsigned 16-bit Bus Lock Threshold co=
unt. On
>>>>>>>>> VMRUN, this value is loaded into an internal count register. Befo=
re the
>>>>>>>>> processor executes a bus lock in the guest, it checks the value o=
f this
>>>>>>>>> register. If the value is greater than 0, the processor executes =
the bus
>>>>>>>>> lock successfully and decrements the count. If the value is 0, th=
e bus
>>>>>>>>> lock is not executed and a #VMEXIT to the VMM is taken.
>>>>>>>>>
>>>>>>>>> So according to the APM, setting the count to 1 will permit one b=
us lock
>>>>>>>>> then exit (fault style) immediately before the next.=C2=A0 This a=
lso says
>>>>>>>>> that a count of 0 is a legal state.
>>>>>>>> But then you'd livelock the guest as soon as it uses a bus lock. A=
re you
>>>>>>>> suggesting to set to 1 in response to a bus lock exit, and keep at=
 0 at
>>>>>>>> all other times?
>>>>>>> I should have been clearer.=C2=A0 I'm complaining at the "trigger
>>>>>>> immediately" comment, because I don't think that's a correct statem=
ent
>>>>>>> of how hardware behaves.
>>>>>> In turn I should have looked at the patch itself before commenting. =
The
>>>>>> other setting to 1 is what makes sense, and what ought to prevent a
>>>>>> livelock. The one here indeed raises questions.
>>>>> Setting it to 1 here is fine.=C2=A0 This is the constructor for VMCBs=
, and
>>>>> *something* needs to make the state consistent with the setting we ch=
ose
>>>>> at runtime.
>>>> But the setting at runtime is generally going to be 0
>>>=20
>>> First, we need clarity on what "Initialising as zero is invalid and
>>> causes an immediate exit." means.
>>
>> +1
>
> The exit is not an VMEXIT_INVALID, if that's your fear. Let me clarify:
>
> The TL;DR is that the commit message is the unfortunate side effect of tr=
ying
> to remember why I did something a while ago and not remembering very well=
.
>
> Initialy I had zero at both the initialiser and the reset. That doesn't g=
et
> very far until you notice the behaviour is a fault and not a trap, which =
the APM
> states as:
>
> ```
> If the value is 0, the bus lock is not executed and a #VMEXIT to the VMM =
is
> taken
> ```
>
> Then in order to go past that boundary the reset must be set at 1, or the=
 guest
> loops. The initialisation may start at either (though zero would be more
> consistent).
>
> I guess over time I just internalised a bit too much "I can't exec vmrun =
with
> a counter of 0".
>
> I'll send a v2 with the initialiser set to zero and an amended commit mes=
sage.

... pending a hardware test, because the board I have with me ATM doesn't
support the feature and need to get ahold of one.

>
> Cheers,
> Alejandro


