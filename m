Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F044AFDA14
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 23:41:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037398.1410062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZG4N-0003CE-0J; Tue, 08 Jul 2025 21:41:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037398.1410062; Tue, 08 Jul 2025 21:41:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZG4M-0003Ad-TO; Tue, 08 Jul 2025 21:41:42 +0000
Received: by outflank-mailman (input) for mailman id 1037398;
 Tue, 08 Jul 2025 21:41:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qd/v=ZV=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uZFv4-0006hl-CC
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 21:32:06 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20612.outbound.protection.outlook.com
 [2a01:111:f403:2418::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd7cc1b3-5c42-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 23:32:04 +0200 (CEST)
Received: from BN0PR04CA0161.namprd04.prod.outlook.com (2603:10b6:408:eb::16)
 by DS0PR12MB9038.namprd12.prod.outlook.com (2603:10b6:8:f2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Tue, 8 Jul
 2025 21:32:01 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:408:eb:cafe::35) by BN0PR04CA0161.outlook.office365.com
 (2603:10b6:408:eb::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.27 via Frontend Transport; Tue,
 8 Jul 2025 21:32:01 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 8 Jul 2025 21:32:01 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 16:32:00 -0500
Received: from [172.19.134.125] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Jul 2025 16:31:59 -0500
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
X-Inumbo-ID: fd7cc1b3-5c42-11f0-a317-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mlaWPyXY6xiPb0yKh/HXPC2S3SB4gCWbFSy2MXZp7EmRuvZTh56xSiX/FtWEOzRPBBpC3tobKv5km/aMMqU6aOzbZ/HQlp+W2N/Yw2oSZpDGVCavHsZ9zF9lsi2KZ+SyfIv0nWI/ON7hU6tsk5utP0Ov2cRRB+tz37gTEzCsyzYuOX56MhHbJ80ACl16ifC7Ix4ZYs5ydXyUITcw4PbeILK0odFeNehKfb3UiUfXfkWMbMGE16qSSbTPt46MUXAuKvFuNABjcorpEnt4jf1MPUMakYMRtKl6hLxc902K+h5H9pxfNyNrCotL5ztTREJTXED413VefXFO6CRib/c/dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mbmJPp+fuhXAPyS7o+C1hFxdZ62A0iAL7FtMyuBSruo=;
 b=qILMEOfetZObEY55zIvYw64jpG8Wib5OHl+w+79NRLduUvyFNCvTVHEbiVHKbDZu23+ohN/e11nQFVSwhxS9SmGzMhWk7RF7Aco6yAOWe4IDo7v6vwS5g4pPtRiCX3vMIMahmnMjCPWStFSHlnlXYmQft+GIxF2ZmAlslmdsMJiW51JNapDEaFbXGupwlOAENJp/pdeSlvw+RgxGvdnP9Xdam2LOPMb+kwv9QIVHczllsn2n/+tCLUMmF1UKpsSIKonc100YLaciVcGhJGK58mXPtXjOaD1984YShJs/swVyLXi7Bw/iom9fJOEBjXTQgTUG73blJ7vdO/ByK/M5vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mbmJPp+fuhXAPyS7o+C1hFxdZ62A0iAL7FtMyuBSruo=;
 b=u8SN4qE+r86epFDKg4hV+3wKabSHWQF/RdpBThQQZyHlreOTNaJAVQB3BqbzIlZTD2PSC8JErwh9JiulakCL1/PMfVLDqqmL8BmHcUHSlw3e2+GkNx9QDXk6NDY53hqwSKd+H9FJGKEJy+SFLcJTVmNLLoanD3kP1gx5IPqCyPw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <513ef9f8-bb20-42e9-be85-0065e67d76f8@amd.com>
Date: Tue, 8 Jul 2025 17:14:47 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH 09/19] kexec: restructure building the start info
 data
To: Juergen Gross <jgross@suse.com>, <minios-devel@lists.xenproject.org>,
	<xen-devel@lists.xenproject.org>
CC: <samuel.thibault@ens-lyon.org>
References: <20250702081254.14383-1-jgross@suse.com>
 <20250702081254.14383-10-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250702081254.14383-10-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|DS0PR12MB9038:EE_
X-MS-Office365-Filtering-Correlation-Id: 45ea5dc9-0bf9-44df-dfcf-08ddbe66e045
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R2IyazEvQWFFb2FBeXRrK2VEaG9pbVFOYVVLZS9uMzl4QzY2VVJZKzlhWjU0?=
 =?utf-8?B?b2MydkxYMWN0dlZvWWthelE3cGJpK0JqV3NBczVncFFETXRPNkdVSmxFdHZv?=
 =?utf-8?B?Z2dTVUVVVXpIWjVUZnVTWEJlYkY4dnVJRHd4a2lMdXdLL0JIYkZDbUNkRGhG?=
 =?utf-8?B?MXR1c1I5d1JXY3c3OUtFU2ZGL1JJNGs0cWgwZTZsZ2Q3VURwZXBwS0FQRitt?=
 =?utf-8?B?ZUxGMTQ1YmIwNWNBaWZwOVZPN0EwUDQ2MEF6MkUydjZ3WDVjU056T1p5Y1Uy?=
 =?utf-8?B?SHJyYTNuVTZXMytJK2dTeUVjWklDOFhGSlNGekk0SlI4RHFRL1pyMFR3d0dT?=
 =?utf-8?B?bVp4MTloLzFVVXNud0hRS25mQktNQzN2Qkd0bUtVMDBHaTRkcCtGcVk2VnVW?=
 =?utf-8?B?cVJtZWd6STkyNXYyTmZYY0RxYnlhajg5N0wyYU1GUjNWWVBWUXdxTHdLSlBr?=
 =?utf-8?B?TGFkd0xiKzJqejFjQTc1c1N3V3hpV1pVd29DVkZFU25RT0xRZnlIRnRwclVN?=
 =?utf-8?B?c1IzS2V1emZMdTBGZVJVMFFTR2oyUmc0dG55aXRSbnlESGprRFYxRW01QzRG?=
 =?utf-8?B?bHkySVB1c1l1cmVuK2ZjaUhCVlJ0OHRiWUV0VmE4M3E2eWJiOXBVWDlxUDgz?=
 =?utf-8?B?cUFMNWVKdlJRTlVrZnZnQzU0ZE05T0wzRFJwSkM4a2VJSG5QbUt2ZTAyUUFr?=
 =?utf-8?B?YlBFb0lIOGkxR3YzZVJCbFBoQS9mZ0RteThXQy9TWVJqSHl5YkVFUDBVQVdi?=
 =?utf-8?B?dmI0RlNaRmxHZmVlYmg5N1Q1OGx4T1hlWGRoT3lYQ2QrYXVHM1oyOFRmS2lW?=
 =?utf-8?B?RndESWovNGxJYWZyK0JCTFBzR08xVHJGQWc3WGVsenNzM0VuNjFBZnBpeklm?=
 =?utf-8?B?UHc1OUpBTkE3U1BMWG9UYWxxbStaeGw0eHVzczZ6WjNUVmpqcGN2K3o2MDJz?=
 =?utf-8?B?YlltT2ROQWJ6MERyenpJMjk3MzcyYVVuSklrSWJ6TjBTbWlsYnR1YmxTNWUv?=
 =?utf-8?B?RjNxS2trWE00eTh5SHlSeWNOUmVmNlhiRG03STJ0bm5Rc3RPZlI5U015MHdU?=
 =?utf-8?B?Uk85TmRUVFBPeERtNDg3ZUxBY21aNTdRdjFXNytVYlA3bnZKd250WUk3YnUz?=
 =?utf-8?B?ZldJdG55OHlJMVF6eVNWNW1MOS9YTGgwSmFMMFNzTlM4dVhpRWhTY0hOSUEz?=
 =?utf-8?B?MW1qZjJaUXNRREYrSFN2VmFjV1UvQ052UWpIY1BqR2hZNVhhWkYvQTIwRWRF?=
 =?utf-8?B?YzJ1OE1GSEowVnJNQVdVVlFUT1JzZkxlOElXalFnWk9ZWGkvVU5CdEI1OWFt?=
 =?utf-8?B?V3FwcEsyRzF1d2RCelZkTFZ1SzdLc3JkYkZkdTJ6VkQ4L3QydW5vRXVwMnpl?=
 =?utf-8?B?VExxWFJMVzdNdzR2VlIvYnlNNWp3YlRIQ2RxbXdRL203aVhsZHZMcmFWaDMx?=
 =?utf-8?B?Y0lpUHdObzJWTEZCWTFjandtbC9POWt1WklFcFdKTGVMRFY3Zlk4amRPa29r?=
 =?utf-8?B?WlJUZXBUZkd6WlpXV0o0OTc3UFZ0VjdUcWc1end1MThrWFBCTzNlVTgvOGNT?=
 =?utf-8?B?Q0haU25HVGgzZEpoWXBaUkdlRnVtTkswOEpmWGFrQUtNRG4wQit0bS9Bb05o?=
 =?utf-8?B?V1JyUHJSNHgrbSt5YXY0bUhlT243TUtNNXdPaUFFTGoxRlFQVEhkVVdXRExk?=
 =?utf-8?B?TjBzNWw0azRrbW9Da2dhendYNjFoRkI0RlFqMWkyU0pEM2hZYkh0QnlRL2to?=
 =?utf-8?B?TzZFT3hhSk1TcGF2RWxhWVFBNUdWRlUvK3hLL0V2VEx3VkF6bWNGc0Y3OXZn?=
 =?utf-8?B?K1Q5RHFkQXhCK0VMNG5DclFEZTJQZ3dIbUloVndxRjVaRDc2ODhRa3o5RGJ6?=
 =?utf-8?B?MzhMY3lJZEdtemZ5MGNkVTRjMjZwa2o1cnRwdFZpNjg1Wm9RdFBPckUwUXI2?=
 =?utf-8?B?ajNOMXBtTHB0QzYwblYrRDNYSU4wUzFqcmYweU5nTmZaenNibXYwZEVITkhh?=
 =?utf-8?B?cjZuKys1Q2QrV3NITHpFM0xnaXM3VDlZMlJucFI5Vnh2cFNHZjFjUmlMOFF0?=
 =?utf-8?Q?HRFSl4?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 21:32:01.4654
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45ea5dc9-0bf9-44df-dfcf-08ddbe66e045
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9038

On 2025-07-02 04:12, Juergen Gross wrote:
> Instead of setting most of the struct hvm_start_info fields first and
> then building the leaf data, restructure kexec_get_entry() by
> using an opaque "next" pointer where the next leaf data will be stored
> and handle that leaf data together with the associated hvm_start_info
> fields.
> 
> This will make it easier to add new data items without having to
> rewrite large portions of the function.
> 
> Signed-off-by: Juergen Gross<jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

