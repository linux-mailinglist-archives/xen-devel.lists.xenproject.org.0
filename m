Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC37ED236CF
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 10:21:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1204445.1519102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgJXZ-0005r4-4M; Thu, 15 Jan 2026 09:21:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1204445.1519102; Thu, 15 Jan 2026 09:21:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgJXZ-0005oK-0A; Thu, 15 Jan 2026 09:21:17 +0000
Received: by outflank-mailman (input) for mailman id 1204445;
 Thu, 15 Jan 2026 09:21:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wE43=7U=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vgJXX-0005n3-As
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 09:21:15 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 883e2efb-f1f3-11f0-9ccf-f158ae23cfc8;
 Thu, 15 Jan 2026 10:21:12 +0100 (CET)
Received: from BY3PR05CA0054.namprd05.prod.outlook.com (2603:10b6:a03:39b::29)
 by SA1PR12MB8966.namprd12.prod.outlook.com (2603:10b6:806:385::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 09:21:06 +0000
Received: from SJ5PEPF000001D5.namprd05.prod.outlook.com
 (2603:10b6:a03:39b:cafe::9e) by BY3PR05CA0054.outlook.office365.com
 (2603:10b6:a03:39b::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.2 via Frontend Transport; Thu,
 15 Jan 2026 09:21:06 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001D5.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Thu, 15 Jan 2026 09:21:05 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 15 Jan
 2026 03:21:05 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 15 Jan
 2026 01:21:05 -0800
Received: from [10.252.147.171] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 15 Jan 2026 01:21:03 -0800
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
X-Inumbo-ID: 883e2efb-f1f3-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=amq7dK9pBvq/KUPbFzURMfwG04OEuxCQJHgqZxkQxCGW9a7WakwHJcTFOIg2R6sOtSRN9h6M0R4BohJR8l0MXhuElm5Um8eBmgtrUpFuRlhs/YPXvHpYASb3k6pWolexd+XmMAglGDgz5T4W3WNcUTxh0uVMXhxfQ8fmdnGhabNiJ5LE66hpB6kXtj55OZfdjUlPhf+o/0Geu7QKCi76U3eYOqrE04TFRGTL/QtcM5JxrpQGZRF+HXp+bFAilTQ2EnBbqsJK+uHomCtACrzxs3OD+puKv0A51Dycsn51kFx6rlU2KpLZq4yonmCP7OUC9gs9G+X5YuKEAngcJhnung==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VKkNSgMzWHcJZYy4NMjFwvu9jND2h6b0owm5FGSZ6cw=;
 b=hx0munzyp9rigZLnW8g0qC3N07Oh5DEtSTiNtZfcOohYOwMwLCKiNyK9743zlpFVDbhqJPgV9oyYRSACmXAdizEJ2UeI/PlI5bTvnb7FZtb8aWLpkZy1bDtW/Mu5+4jJURlLw0qnLyAKiS+UrkAmrcL9ZgkkdDaQQXh8pCX7hi1kp+JUPHli/H6wWLy31f45w6CLT2VTgwlaIDlfX1ULGkYwNRXrrWUSbc+3Cq8goFOGheoAjFPqJqYBn6bRXh3/lVI2i2dKeZbG/0wuQCiuTAR/WNs8WLQV4UyruyHxYaToa9SCya73sL5wT5j40XufFZK033n8AXv0SLk+6e6e8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VKkNSgMzWHcJZYy4NMjFwvu9jND2h6b0owm5FGSZ6cw=;
 b=vs4/TgjhZPSwpGJR3+Ep54WfyUwBo3lauEFPbmEfFqW8G4qcl7AaKezIfe+aQTB/d0KnOKzfXRn2/FDNzld7UkrMYZiUGxBcPJNzfx1wUX/GzbAIRt3K+rR3EcpQEV7RpA69zgMmu6Wmn2ECf3qV/vteZFn1YsxYSquYxdJ9rE8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <26fe13ea-c613-4d39-8f77-a363805e8872@amd.com>
Date: Thu, 15 Jan 2026 10:21:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] arm/mpu: Map domain page in AArch64 MPU systems
To: Luca Fancellu <Luca.Fancellu@arm.com>, "Halder, Ayan Kumar"
	<ayankuma@amd.com>
CC: Harry Ramsey <Harry.Ramsey@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Penny Zheng <Penny.Zheng@arm.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
References: <20260114142734.239197-1-harry.ramsey@arm.com>
 <20260114142734.239197-7-harry.ramsey@arm.com>
 <c9330c5d-1cbe-4277-b784-9be86b87f149@amd.com>
 <4EEAE5C4-59C7-4FA2-9B90-764C754420E1@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <4EEAE5C4-59C7-4FA2-9B90-764C754420E1@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D5:EE_|SA1PR12MB8966:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a1a1c0b-b59e-48ce-75b7-08de54176953
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?allXUytpZVNtK3lrcUttYkVKMS8waG1vbE5RY3A2b2dHV1A2Rk1icUhSeVp4?=
 =?utf-8?B?YUMzT0JnK1ZaU3RiYklDQUtKb0thelBIeUtld0gwSmdlM3IyYnVRczIxR2NX?=
 =?utf-8?B?UGc2UXVxaVg5NytodmZaelU5RkIzdG9nUVppWDVValNtWWZvaEpjakxOUFdn?=
 =?utf-8?B?UjROOEQxSWxwRkFaeGxhOERyTjZMREJEaUw4L2NhTFhYbmsxaVI3dXppZ0xY?=
 =?utf-8?B?ejlobi9HOXBrWG9PTDN5S3BlY2lHMWRBM0hlQjBUalN4ZzlYaS9iMHpRaU10?=
 =?utf-8?B?RjJEOUZTZGNhbUJMK1ByOEN3c2ZHNXAycmhEMVZvTDFSSVpoVnp2QmxRS255?=
 =?utf-8?B?N3hJclBuWXFhcU9CWWRNNXVuUFJOVVJtZUdwZHZQYk02MjBZY05saXZhWWNo?=
 =?utf-8?B?SUExblBDOTdHaGxiR0FKSnVLVzVoT0h0NkpzUkhETzdQNFdobDZERG93UG1z?=
 =?utf-8?B?UVJNUHhGNlRiN1ZtWlIxcnFYUGZsSCtHS0ZBNkxVaHAyN1pDTFBjcmNjZG81?=
 =?utf-8?B?eStmWmlpajNzTmxkRUpwU3p2MGoyU3NtWEJmbEkvS3kzVGR0b0czU0Ziamtu?=
 =?utf-8?B?OUwzV3FmQU0rOFVRb2ttaDVab1JVa25jS1k4aXZNVG1rNmpxRk14NWFvNUJh?=
 =?utf-8?B?UWdqY1F4Y1lTSEdvRC81M2VCcU9razFVSFBoVGd4QmMzV1ZmNyt5TGd1YWZZ?=
 =?utf-8?B?eVFuU2p6djR0ZFhPdmF4Smg5MWcydjVvRUZoUXJKRlpTT0dGMVhwVFNtVktF?=
 =?utf-8?B?T2Vja2JrMlNuekNldFFVb2xqQ01IU0dyT1F3WEtvT3FVaDdKTnU5Rm1GdEJo?=
 =?utf-8?B?azFHYUhCdEViazVYNDY2ZnBhVEViN3dmRTVsT1lLZDJQM3RGejh4NmYyRmpC?=
 =?utf-8?B?YjJ4VDNweGVaWkVPalZ1VVVORmxJT09NcGx4ZDhHZDBhWHZlMi85MWFEQ1A1?=
 =?utf-8?B?R2wyTWE0NCs3ZG43MzJabHZrNFFDdVJuM1Z2RTlCSjlxWURPN0ZCa3JENTlC?=
 =?utf-8?B?UUJnOEhiek4ySmxBUjlxUkVtVkRScWp4SjVRTE4yNUROUVUwTHBESnliMWp5?=
 =?utf-8?B?MUNqTVlFeUVKdGpnRmxuYjE1Q2hwMmdrSXdwQ0cwT2lhcXhGNzdIcU5RQWtL?=
 =?utf-8?B?d0I2bEErZUl1MEdxQjdvSG1qUkF0Mzgza3hqSDVRVXF5Z3NwRXdPOUlObDVs?=
 =?utf-8?B?alBOcS9KMEt0SkI1enBFQWdIK2RYam1kazhSZUVlZys5MHlNdmtVNXhNVFRT?=
 =?utf-8?B?bWptSW9TOXBRdlEvUGpUZWVPZWtVVk44UStnK2RDWXVWd2x1WWVzMzl5K2Ri?=
 =?utf-8?B?KzY0S1krQ2dQZFFOYWNpN2xta2tNNnVRYTNTNjMyN2dzY0xHWlAwQnM1Qkl1?=
 =?utf-8?B?dTJvbTVBa3lrRjZ4SjhvM0dmZ25paEY1bTVTQ0tNb0lxeWxsY3pTQlkyZUVt?=
 =?utf-8?B?aEppYVorcm9WZzRRaUs4aytvUW1ucjZtK2RoMngwbGFjcTBkVUtkaDBLdWRE?=
 =?utf-8?B?cWUxMUxsRCtLNHA4ZWVPMDZRV2M3ajVGT0lvSFlQZ0U5LzdNVTQ0ZkFXZTZo?=
 =?utf-8?B?SGxtSTZXTkhHTUJwNytyRUoxcG9QTmtScEV5NnE0TGVqZC8yZDB5bm41Z1ht?=
 =?utf-8?B?L3U2Wlk2cGFLdTBFUDhYNkJqaWg0Nnlic2trMHV2RlYvazd2cTZKazAxelBU?=
 =?utf-8?B?dkRoWlM0ZjVIUnhaNkNhTmw0ZE5qbnk2MkozZW5zaUhQdzA5dXhUZWxURkly?=
 =?utf-8?B?cEtrRnNXMTJOUmM0QTFuUVJFY3lkZXc2K1hiY3gwUSt4M2dXS0FqRmxyRytp?=
 =?utf-8?B?aklTYjNCQVRLQ3hKQ0VsWERGSG5KSHJNOUxMRmNxcDBZOTU5THJLVzdPTnpn?=
 =?utf-8?B?dDJPSnVWSlVJa0c2S3hNcnFHK3ljNmx1V213OThtcGpWeXpFeDF5WERDQUNp?=
 =?utf-8?B?MkpNL3dZQzJrb2NOQXIxYnZiL2dEYUVMdE9tL0ZNMkVQVkZXN3NGYVhPQzZU?=
 =?utf-8?B?akUrUEp5cVAxMHVJbDZURktxbXUyNm1jSzNacUpCVHdTc0l4aE1OTHpLSklW?=
 =?utf-8?B?eVpKQ0pTVUcySXZRN0E3SURiUFkra2k1Qk5lbndiMzkwaXlxZ3pMUytxb3Bq?=
 =?utf-8?B?Nkg4TVE4SW1Qd3NIdlpOWlQ0bTZ2bFgvUGdBUkxyNlkya2VhRDM0akNVTXhZ?=
 =?utf-8?B?cTh4ZVlhVjh0eFZjS20yTGlXM1ZTRUVoZ0Vwb3ROcjdvRzhOSERFalBQRHlW?=
 =?utf-8?B?LzVzUUtvTUkvRGVOSGRCdmJDNzNRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 09:21:05.9911
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a1a1c0b-b59e-48ce-75b7-08de54176953
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8966



On 14/01/2026 16:59, Luca Fancellu wrote:
> 
> 
>> On 14 Jan 2026, at 15:55, Halder, Ayan Kumar <ayankuma@amd.com> wrote:
>>
>> Hi Harry,
>>
>> Can we expand this to cover Arm32 as well ? I did some test and both Arm32 and Arm64 get to the same point.
> 
> The only problem is that we don’t have an Arm32 setup to test these, if the maintainer are ok we can do it,
> but then it should be you to test on arm32.
> 
> Also, in case, could it be done while committing? (provided that the maintainer give their ack)
I can do that later on when committing.

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


