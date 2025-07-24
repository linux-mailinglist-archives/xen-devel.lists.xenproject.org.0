Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D347B1151B
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 02:18:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056676.1424697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf68c-0001qD-V5; Fri, 25 Jul 2025 00:18:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056676.1424697; Fri, 25 Jul 2025 00:18:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf68c-0001nN-S8; Fri, 25 Jul 2025 00:18:14 +0000
Received: by outflank-mailman (input) for mailman id 1056676;
 Fri, 25 Jul 2025 00:18:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TFeG=2G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uf68b-0001nH-W6
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 00:18:13 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2413::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d87fbd04-68ec-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 02:18:11 +0200 (CEST)
Received: from CH0PR04CA0116.namprd04.prod.outlook.com (2603:10b6:610:75::31)
 by BL3PR12MB6521.namprd12.prod.outlook.com (2603:10b6:208:3bd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Fri, 25 Jul
 2025 00:18:07 +0000
Received: from CH3PEPF00000010.namprd04.prod.outlook.com
 (2603:10b6:610:75:cafe::e2) by CH0PR04CA0116.outlook.office365.com
 (2603:10b6:610:75::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.23 via Frontend Transport; Fri,
 25 Jul 2025 00:18:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000010.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 00:18:07 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 19:18:05 -0500
Received: from [172.18.231.84] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 24 Jul 2025 19:18:04 -0500
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
X-Inumbo-ID: d87fbd04-68ec-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YjKAUGrpxBeVUvTTyopCcoUu/xeChxEG7+IccW2nBZEu6dhgbiGIWReye/T1Im+Boo69QdHp6S8E5i7maSoQPRUKL37cEpgondbkTUrv2JdLxakwYiievMWB7Lbs8APa4KEL3L5k2o6PSPAQFxf/Qqx3hdKDCZ+KhLY9KNHCelXcKY1pFuxWqCfyMjbF3Bkjgv7neCJZDlzp6Er7zcUONh/YXVNmeyComq2ooj4M+0bhcBoDQ0+o8BY2LP92ux1VoRhZPGh/pAvmrT+bVdvdTiXQDuYGGzdeuHb5Ek7QxiEUGu2hvpRuOyqZ47dEeyIN4aTIoQs3qr0q/vm8npFLpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ccg+dWf50oux0bDJauihww3DDVDf2Jg4ARYyWP7IRpw=;
 b=kcj2TyDNnyYsiwXLfeDb1Uz+ndGQeKj1GZE7lCQCvG81jFM5YiM08eiS1nIomjUzOwiZV+ptJjP/A1aKYExqPGoVZwCkE54xQ8ebvKLAfftlfup1qBGDywBZe3FVHKxKBw1BMVFR6BJq2Xe4iutTnAYlyi5TrwGlsGnO11kB6rNKfRzy8GONdZMYlYqKpuHaVesaDvnxdVLyHNBe63895c4QvQP0MryqU5gQuxVlMv1/nZOHCpsOqsgWmaluNf+l52KokLn6R3yUVUX2N1oM83Gmie0x+/OkPDccomYy6nE9rJq0PsZceNChlclxCiMmCb2mrOnpIESIBZS6EADKFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ccg+dWf50oux0bDJauihww3DDVDf2Jg4ARYyWP7IRpw=;
 b=Fzm91ok2EcwOz1wkkbiEv2Ct5mDrqEhC4Rjjl7u4IKoV+GkatD1l/2zSQtV2rqfby8l6kLIwgJ9lndjBbe4QYK65g7EVn/6b2Ddj6swrfbSybTmO+pUFoUJlwLlOj4qMi1vTJsQ2wUa45RTnLTwpfSR1Bp6ftmB+kgg4ZXrgLZ0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <882f7ef7-e7e0-43d2-80c8-ef1716e1579d@amd.com>
Date: Thu, 24 Jul 2025 18:35:12 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] tools/xenstored: support specification of migration
 stream version
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250722140628.28947-1-jgross@suse.com>
 <20250722140628.28947-3-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250722140628.28947-3-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000010:EE_|BL3PR12MB6521:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cbad89f-a042-4fa3-9c6c-08ddcb10bae8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ajl0R0hFUy9tckNOMHBkME0wSytkRHU0bHJ4bVhVV2l0aXo1L2QzWG9hM212?=
 =?utf-8?B?cFhpcmFzQUpmRlpKamROWXRSVmYzZ2F6Z05jMDhZRmJ2SXhmU0lDZGRSMll6?=
 =?utf-8?B?ZFE3WWdGcFB2THBxMU96S0lzOUpqdDVNZ3lRZXlQOVRIMnBKSEZYbmdnb1Qz?=
 =?utf-8?B?THdrSFgrMzBtOUxKYjFFQVR4Wnd4SU1OeXVKUXNkZVVJb1Fsc1pXdUpaK3Nx?=
 =?utf-8?B?SDJUWTR1T3R5V2s1eUJDR1RnMU5RM0pXZTZSS2hXMFV1TEFxVTVwZU0wWnlp?=
 =?utf-8?B?cERYUnllRHJyWWt4NDNrY1R3LzNEUDlQRE5RSGlUL3dqbFRYUXN3bmpnTnZv?=
 =?utf-8?B?WFJJZHBvVXEzOURKd0czazVBSUhLRnJZWDVLMkowM0VIUkNEYUhWZmtOSVpD?=
 =?utf-8?B?SGVGS3NsT0NmVWtjMEhXeTdoZ3ZFaW1qUEVPRWp4Y3JmSHduVnNkbnJZNDdm?=
 =?utf-8?B?MnpiSXB3R2dpSFNOMjl0L1ozbGVPVStZeXFwdGlOdU5WM3VEcFRsMVNQZzZv?=
 =?utf-8?B?NWY1K2EwWUlVeXBwbnRsV0xNNlIyL2kycG9OWVpPTGROY09hNmRQRzE5MGp1?=
 =?utf-8?B?emJMWHRBaVFWUVVseExlQVJsQUxVQ3NkejRMa2NiMzhVRWViSHRMbC9sbVlQ?=
 =?utf-8?B?SHNXLzVUZ211M3FXMEwyZzArY21ldTBzSHpXb0JGTzFtUjlJSUllL1ppdXJP?=
 =?utf-8?B?aktuYUpkcEdoU25jOHhoaExVTjkyN0RJeGFCVjlCdnA2dlRaMjFIdGQ3bWJE?=
 =?utf-8?B?VHhMeTZ3L3B6UG9BTk5oSGRJZ2ZmTlQ2VmRnLytmTkY4N2Z6U0thZ2N0Zmhx?=
 =?utf-8?B?UXJJWTUxa3hzMWpWZGwwQVhBMVV1MnJveDhHUzJWNkVKdlNua1VQdHl0NnNL?=
 =?utf-8?B?aFF1d1dDR29OQ2VseDMxN05TcnhtVTg3MjdWZHM5bTNOcWorcWo3djhMMW9x?=
 =?utf-8?B?eTVrUVp5TVo5blF5QkQ2akZBK2Z2NnpMQ1JyY25WWTVlR0ZjLzM0eUpRS1Fn?=
 =?utf-8?B?aFZLVlhxdVkzRkVsdU5nUEUrOFBudWNpOWxhZDZkQWlnWWJGUEZLZnRYY1ky?=
 =?utf-8?B?NE1NQ3doTXFTRUJ6M0VHcXpsT3UrYWEza2FjNTNBYkRnU0YyaFBwR3hUM1lC?=
 =?utf-8?B?blAwd1BTVVZaTXNjbXJGcUpwOERlQ2c1c1RFNTRrZUlTUGhta0EyNG53VTg1?=
 =?utf-8?B?U2FzSDY3TmNqakkyYWl5VmtuT09NejZEN3dDb0xQRkxxNUptTFZvM2FHZFFt?=
 =?utf-8?B?NVFGNGk4NVpNd0pqV1JoQnZhYzVESXl4K0E0K2xyNDh4QkRUTzNKQTJiZTkw?=
 =?utf-8?B?ODFnNWx0UnVJalVsZmNLbFdNV2lUNHZJL1A4QWFXeTUvVCtzVGFzb1F0L2NH?=
 =?utf-8?B?OHVPOVRZaVhiTGJjMDlFZTAranBmMWJ2ZjNueU8rZkJvNHgxS1JONjFnSkhj?=
 =?utf-8?B?QzVBS3RJNkZIWGlMWGZ3aCtWdFlZNDVjREJtb2ZuVGxqZmlxOHlNb3Q4bkxh?=
 =?utf-8?B?Mk1MN3dwYlg1T3cvcU5sZWpYYUxKdnR0aUFzSFpnT1VSWTcwNWw1YVk4T28z?=
 =?utf-8?B?V3Fab1FEQWFpR29xQmhLTE94NG9Kc0ZqaGRLYlN6N1RJSDlVZGZSdlMvQTBN?=
 =?utf-8?B?UGNXeVBkQnh6Yzg3RUlDQ2FhR2ZHVnY0T1pBSTllN3hUckRqYTVTaG4wZ0ow?=
 =?utf-8?B?MUZqTnAzcHVxeWdndS9CSGk3WEEvS3RlR2ZFMCs5T3E4cTVBNTBsRGlCbjhG?=
 =?utf-8?B?eG9PMDlNTzY5ZTBPb0E5V2pFcVhKUmF3WnhMSkpNQnB5TnNPZlZtUitlWWpZ?=
 =?utf-8?B?eVRpNDlkeW9KNXlLT2RZaWpNajQzM05mVHhvQXdxRktYMUYyOFE3bUM3bEg4?=
 =?utf-8?B?R29HOVFPdUhvQWt5V3dZeDBtZEpiOVpKWEJwTDNqWHRpcFlDWlZrd0t3aUx0?=
 =?utf-8?B?Z0NwdTg4Zmc5bnRZRGR2aFZ1ckczaUxkTThHUGVxRkwzUFJkL00xQitrVm1U?=
 =?utf-8?B?azN6UXR0M0RmbE16a1E3R1JlMURqK3A2cUl5elFCNUs3d1BHaDFSZmhZZy9q?=
 =?utf-8?Q?ylDYHE?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 00:18:07.1645
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cbad89f-a042-4fa3-9c6c-08ddcb10bae8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000010.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6521

On 2025-07-22 10:06, Juergen Gross wrote:
> In order to prepare xenstored supporting migration stream versions
> other than 1, add a parameter to the live update command allowing to
> specify the version of the migration stream.
> 
> This will allow going back from xenstored using version 2 per default
> to a xenstored only accepting version 1.
> 
> For now only version 1 is supported.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

