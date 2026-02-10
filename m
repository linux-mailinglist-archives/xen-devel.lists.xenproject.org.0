Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCCFGUpui2lhUQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 18:43:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C41A011E0A8
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 18:43:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226790.1533272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vprlW-0005pP-ED; Tue, 10 Feb 2026 17:43:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226790.1533272; Tue, 10 Feb 2026 17:43:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vprlW-0005n6-BV; Tue, 10 Feb 2026 17:43:10 +0000
Received: by outflank-mailman (input) for mailman id 1226790;
 Tue, 10 Feb 2026 17:43:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iBUt=AO=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vprlV-0005n0-F7
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 17:43:09 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f367a497-06a7-11f1-b162-2bf370ae4941;
 Tue, 10 Feb 2026 18:43:04 +0100 (CET)
Received: from BN9PR03CA0791.namprd03.prod.outlook.com (2603:10b6:408:13f::16)
 by DM4PR12MB5915.namprd12.prod.outlook.com (2603:10b6:8:68::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.8; Tue, 10 Feb
 2026 17:42:57 +0000
Received: from BN2PEPF000044A6.namprd04.prod.outlook.com
 (2603:10b6:408:13f:cafe::7f) by BN9PR03CA0791.outlook.office365.com
 (2603:10b6:408:13f::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Tue,
 10 Feb 2026 17:42:56 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044A6.mail.protection.outlook.com (10.167.243.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 17:42:56 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 10 Feb
 2026 11:42:54 -0600
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
X-Inumbo-ID: f367a497-06a7-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JsnvWNQDIwEBRAC4oJVCUckhdsjuZIG/z8tHKzxciYiI5e5xxsziVWfuvA4mkhp6AJBhYtDY7LgjX771T7+iOwJU/9QFWYIqygy3x2ArVZ3hxT+mDJrrZ+7Jl3wC5j+4SDH/IdwzFwUQwyU078vOei8JHtCQhjDysMPK943K5tQn9vssQh6YKSCmDkI8beMYPIo5dmIZDqRxAXfIsXL0cZUOZ4QmU1XJVwYop7RoGxvMcORkv0tiKew0RrsK3XFPiubDrRkt/mGUQ6me03nUG8Z/r8noWIRcqjkvEVT6ql67dPyNiXTvEC/I6G+qRzL4gbyJtyKzlNwPSGqGRIevVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wnL1BC8U3rMzvorEm/ZD9bVsRk3dyobt9WUHgma9G18=;
 b=e7wIfLbRYWMXfcoxqTAV3I7Vk2/J4tsypwmcWPDPeNTve4HovXBqMSZ1wLB/iC66luZeeo21BJR6W8ExtFF42x+u5DXXRpeYtCN1NoUcYydnzCU5IkI/PPuaEtURYICHhBM1qrRi4x4pXMThMbP+C2l+1OxYutHWkGftp7IpG8X1ee1io0bdBtf1JS78emkGSD1B/TP23s9DanDaCdggOLXMCJuRb6AWhIJ+nWrA/xtwieKTfh2VYJdl0OUzVTHmuQkocPQsqd7sshTKQUmcB06jwCCBnZVfOYsd+SBucH7zWeQllg2XYQg8cSaP+7hF5MRntWtYi+i8UORlaOHqqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wnL1BC8U3rMzvorEm/ZD9bVsRk3dyobt9WUHgma9G18=;
 b=5tykJ+O8EV2IqPFx1TBggF+6k9j8dMGylrtSeOHQe4jmbeM0TqiPsi0QeA+OpMkh6NxFOVgHPwZ++vKdwbPvPvM/FoS8nQxHVqOrSF6u+NeDVcwagTqizj3ZOUH8MiuRvnFnhEgCIGpxtcrgl/PKyMWdtASJHX8bL6XRZ6ywQcY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 10 Feb 2026 18:42:53 +0100
Message-ID: <DGBGUIAF6Y1E.1G3GWLHDZ0Y26@amd.com>
CC: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86: Add Kconfig option for log-dirty tracking
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20260209103118.5885-1-alejandro.garciavallejo@amd.com>
 <c5a9075b-6ed0-4778-b3ad-fe6647dad8b7@suse.com>
 <DGAJ9XN03HPS.TC0OLO5PJN6H@amd.com>
 <1c33beef-f638-4e62-b38a-8b79575adf18@suse.com>
 <DGBB4JCFAPUT.GTAWF68EZP9Q@amd.com>
 <71b236bc-beb9-4fec-ac33-6d877ce91dd2@citrix.com>
In-Reply-To: <71b236bc-beb9-4fec-ac33-6d877ce91dd2@citrix.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A6:EE_|DM4PR12MB5915:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d872495-e911-4cad-5c9f-08de68cbd38a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZEpsZWYwbDRMSDFXWkxRdlRzcENGOTNVQ2ZLYUlrU2w1bjh3ZU04QjB0Wjlq?=
 =?utf-8?B?YnlFSzZnRzRQQzNFaWpsT1d2YjJiZndpNVJqVUV2UUhnZjlYWTBzajRZdGh3?=
 =?utf-8?B?M1hsejREdk95RDJMRk8wUEtIdHV1NjBIeUJKTGR3N1dQSzZQNnpnWlpyT0dx?=
 =?utf-8?B?ckRSenBWeE9vSS91KzJrUzFUQ0lEaXlNZjYvRUk1cXFBN0FGRHVlQXpTSXlK?=
 =?utf-8?B?MG9rQlYyZjliZ3YzN2k3bHRJUHducTBLZWhKMWk0NHJ4dUhwTXFGWnNsWUMv?=
 =?utf-8?B?T2czRFNKdUFYV1IvZTVuRVRBWWo1VTRYTnhUQ2RIQy9VcWV0TmVCOUtkbGEz?=
 =?utf-8?B?UFcvZ0YrQXBwWGxTWW83TzBTL1pNV0cvbGtQS3RJSDFlSS9LNUExcURsU21i?=
 =?utf-8?B?bGhuL2FTOGJidUgxdFRoZkhvQS9yOElsMm5KQ3BvNitnWnVMNUVQMGtuUFVC?=
 =?utf-8?B?UGdZRVhYc2Rva3JSZjZKVjVWUjRMaFhBN3NmcnlJeXpyS1dXdnBhelBXNGtp?=
 =?utf-8?B?RTFQQkMwK2Q0Q1VXbm5uaFpxMVQvbUlCUjh6em9UcU9tVVhsazhGM1pGVDZH?=
 =?utf-8?B?cEE4Y1lXbWJIVnlzbmZEUDl0NzVXaERhZytwa2ErNmZBQ1o0QVY3ZGcxWG1K?=
 =?utf-8?B?MGdFYXpnVGJNNU92dHpGbVFqa3d1WDNFSWRnTnFjYW1sWUYzeWxaTnVoa3I2?=
 =?utf-8?B?WkZ2enk0Y3NGVFRNQmJrckpHL0h5TXlxWWE0R3FaUDFZd2VBMzIrK2lxOGpK?=
 =?utf-8?B?clNFQVlQVDJpcG5mVFRmbGZTUERVWk5PaytHT2pHRWhjV1ZZaktyRHRCcGYy?=
 =?utf-8?B?dFhQMHhvL0FqSnJJY3lBSTJ3VDkyNkI2OEE3VzVkY1NPVkxpanRKUFhKbDRi?=
 =?utf-8?B?T2Nla3VWV3E0dEh6QmtER2MxNDJGUi96RytxeTlTdUJIVTNxVWJjREpGTjRv?=
 =?utf-8?B?bElvTVZkT2RKMFY3K05RK3lXWFMxN1pZYmk5TVR6VWRNVm1JWGtpRng2VjZG?=
 =?utf-8?B?RnZqdGNWdGEybExKWnNsa0VBeTRWQWd4UEhBMWIydTdyUkFDZVJ0dkp4M1Za?=
 =?utf-8?B?eCtyYitJTC8yblRZUG11TURQS3ByTUxQSUU2MndkeGFMN3AxMGtxRmhQYmRQ?=
 =?utf-8?B?cDlTZ2oyQVg1ajc0K2V5bzNOMWVPaFVCY0FlTG1mUlhjTzNKMHA2Z3VjeHFD?=
 =?utf-8?B?Rmp6bVduWnQzOHBnVDY1d0JBUFc2SzV1WERpZ3BQZHBSLyt4NDRxci9JS0xl?=
 =?utf-8?B?YXArM1h4VjRsOWNzdjB4a3YvR09ZRWdWWTVJZ1ZDVWlwWGpYbTN2ZEg1OHlm?=
 =?utf-8?B?ZDIwM3JIbHhpcVRQMkFRM3N3aUoySzhyc0NBRml5RjBJZ0VVQ1hUT09uNEtq?=
 =?utf-8?B?akE4Y0o3emJORzBBWTNGV3BRa2RLbTdDUHRNckIzRU9zajQzUnVjOUlLaklm?=
 =?utf-8?B?eFJPWEM5UUV4MGwxNXk0cHQyd0ZXU2hJQXRwQ0pKTmM2N1hldVRSekgrSzJE?=
 =?utf-8?B?ZEdpSmp6Q0NSN2pxMFJ2TTM1eUQzSjY4NVBoT2U2U3dxdVZpQUhSWFJUMG9Q?=
 =?utf-8?B?dk5zRFBQMXpDVVRTK3F1ZGZJTHZnMDhWVzA5ajhnSXF4cEpxeWpQOGdFK3Rr?=
 =?utf-8?B?NFc3aXMxQjB2WHJiQ0pHTjN5cERuKzVZSWxZY2ZLM2ovQTVNNTUyVXljYUxI?=
 =?utf-8?B?MkJ0M3MvN0pnRkxybE5uWUhXUGZHZytQZUQzZjlOUEtaSDBlb3pmNUpSdUU3?=
 =?utf-8?B?Qzg1Q0FhTjZuL2ovTVhZUDJ2ekRjb3JpcGwvSUlUbW5NZXN3Tm1ibTBMOGdh?=
 =?utf-8?B?b080U3J2UTFWUmR4Wnh6R1dHY1hSR0xxalF3bmtIdmZPNkFzMG9HVVFETmVX?=
 =?utf-8?B?K3NnYnpiSEhOUGtoSWIzc2g4d3BHRC9TMVdOcHd2OVpQdWM2VHEyc01kMEpo?=
 =?utf-8?B?eGRIWFI5N2cvMktoY0pPcU9USDE5b3JwMCtvamtIaGdhd2Q5cW04R0VOeDBC?=
 =?utf-8?B?Q1VPaitMdUNtZ2JBQll5b0pETFZXZ0M0K2I1TXNJc1g2TWFycGlzUEpqNVdo?=
 =?utf-8?B?TVBNL0ozVElyTDF0ME5HSHAvV3lGb1UyZTVNV2JrQXBXZ04rSWdIQ2pxVmVj?=
 =?utf-8?B?MGQ4UnordG5pVC9Bc05wRVMyK1haRVJnU0F5eC9SQWtJb0lCV3NVVmFwRG4x?=
 =?utf-8?B?VFAvZWdCd3JlUTBvVnV3Uit0eTh1VHR5akNXNHR1a1IxWmZUaDBhK3ZISTgx?=
 =?utf-8?B?VE9kNkNVdWRhYmFjQ2gxeTdGRHZ3PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mk07TQyFB1f04kEZL+7oRq7L1eTlLaGJiH35keKp5OtTcIo8eTuntVdLChadgUmJvhmaPxf97XCIXGsGoT5QdX2RMXv2pJnFf6FnIEW2pjgh5yFcDJlJZoSMxaAvyx/c7hd77h5NEc4vuqpEtFc/8RW1cmPpKeKXTSOaaDojSzUuijSVMl6ggm8jh1i7yqB3xJmEn5O7hhqkZaHHgU9AjAZ8J/o1bji1osCfZXgkRKRD9xV1s1Vk6wI5oN8fy6HRKiHEkRgUzwlO113wo/Webplk9yI+7rp+X07FdCn0ahvQ2H3tq8FQ9LWYbdb9yI2+bxiAmOSq23KgN89aL7igY27DseORjra+HrmGzWZY1GETpatoRxf7ejYABSpY9Pr6/Ku0uVtD9yhWDk8fn0UQ/gbwbvDKVH/HDlDBjwYkzXyyPoVtsWN8CVihOOYyr6UR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 17:42:56.9477
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d872495-e911-4cad-5c9f-08de68cbd38a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5915
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: C41A011E0A8
X-Rspamd-Action: no action

On Tue Feb 10, 2026 at 2:21 PM CET, Andrew Cooper wrote:
> On 10/02/2026 1:13 pm, Alejandro Vallejo wrote:
>> On Mon Feb 9, 2026 at 4:55 PM CET, Jan Beulich wrote:
>>> On 09.02.2026 16:24, Alejandro Vallejo wrote:
>>>> On Mon Feb 9, 2026 at 3:48 PM CET, Jan Beulich wrote:
>>>>> On 09.02.2026 11:31, Alejandro Vallejo wrote:
>>>>>> --- a/xen/arch/x86/Kconfig
>>>>>> +++ b/xen/arch/x86/Kconfig
>>>>>> @@ -146,6 +146,7 @@ config XEN_IBT
>>>>>>  config SHADOW_PAGING
>>>>>>  	bool "Shadow Paging"
>>>>>>  	default !PV_SHIM_EXCLUSIVE
>>>>>> +	select LOG_DIRTY
>>>>>>  	depends on PV || HVM
>>>>>>  	help
>>>>> Why would this be? IOW why would shadow imply log-dirty, but HAP woul=
dn't?
>>>> The logic is rather opaque. I admit I'm a bit fuzzy on the uses of log=
dirty.
>>>>
>>>> I know what it's for and I could navigate the code if a problem arose,=
 but I'm
>>>> less clear about which other elements of the hypervisor rely on it (po=
d? nsvm?
>>>> vvmx? shadow? hap?).
>>>>
>>>> If it's strictly toolstack/DM-driven maybe it'd be more apt to have a =
separate
>>>> LIVE_MIGRATION and SAVE_RESTORE configs where LM selects SAVE_RESTORE,=
 which
>>>> selects LOG_DIRTY. That's also improve some defaults auto-downgraded f=
rom the
>>>> max policy just in case a VM is migrated.
>>> It's save (not restore) for both PV and HVM, and VRAM dirty tracking fo=
r HVM
>>> only. Ordinary HVM guests will want VRAM tracking, so compiling out sup=
port
>>> for it will imo want mentioning in the Kconfig help text.
>> ack.
>>
>>>>>> --- a/xen/arch/x86/domctl.c
>>>>>> +++ b/xen/arch/x86/domctl.c
>>>>>> @@ -220,15 +220,15 @@ long arch_do_domctl(
>>>>>>      {
>>>>>> =20
>>>>>>      case XEN_DOMCTL_shadow_op:
>>>>>> -#ifdef CONFIG_PAGING
>>>>>> +        ret =3D -EOPNOTSUPP;
>>>>>> +        if ( !IS_ENABLED(CONFIG_LOG_DIRTY) )
>>>>>> +            break;
>>>>>> +
>>>>>>          ret =3D paging_domctl(d, &domctl->u.shadow_op, u_domctl, 0)=
;
>>>>>>          if ( ret =3D=3D -ERESTART )
>>>>>>              return hypercall_create_continuation(
>>>>>>                         __HYPERVISOR_paging_domctl_cont, "h", u_domc=
tl);
>>>>>>          copyback =3D true;
>>>>>> -#else
>>>>>> -        ret =3D -EOPNOTSUPP;
>>>>>> -#endif
>>>>>>          break;
>>>>> Can a HVM-only hypervisor create any guests with this? I simply fail =
to
>>>>> see how XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION would then make it throug=
h to
>>>>> hap_domctl().
>>>> xl doesn't seem to call it at all. hap_set_allocation() is implicitly =
called
>>>> through paging_enable() -> hap_enable() -> hap_set_allocation()
>>> xl must be calling it, at least in the case where the paging pool size =
is
>>> explicitly set in the guest config. The important point is - not all of
>>> XEN_DOMCTL_shadow_op's sub-ops are log-dirty related.
>>>
>>> It's also odd that you did make changes at the call site here, but then
>>> left the called function (and its sibling paging_domctl_cont()) in plac=
e.
>>>
>>> Jan
>> That goes through DOMCTL_set_paging_mempool_size.
>
> This DOMCTL was added in an XSA because ARM needed the functionality,
> hence no cleanup.
>
> I didn't get around to cleaning up
> XEN_DOMCTL_SHADOW_OP_{GET,SET}_ALLOCATION, but please do.=C2=A0 We should=
 not
> have multiple ways of configuring this, and it simplifies the your patch.
>
> ~Andrew

I have a separate patch for that, but I won't add it here because it does n=
ot
simplify the patch at all. hap_domctl() ought to remain to return EINVAL on
unexpected ops anyway, and there's lots of loose ends to tie (python/ocaml
stubs).

Cheers,
Alejandro

