Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A80EAA78186
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 19:32:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934721.1336341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzfTJ-0000lc-IC; Tue, 01 Apr 2025 17:32:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934721.1336341; Tue, 01 Apr 2025 17:32:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzfTJ-0000jC-FU; Tue, 01 Apr 2025 17:32:21 +0000
Received: by outflank-mailman (input) for mailman id 934721;
 Tue, 01 Apr 2025 17:32:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=neKF=WT=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tzfTH-0000iq-R3
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 17:32:19 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2416::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4144244d-0f1f-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 19:32:18 +0200 (CEST)
Received: from BN9PR03CA0634.namprd03.prod.outlook.com (2603:10b6:408:13b::9)
 by SJ1PR12MB6050.namprd12.prod.outlook.com (2603:10b6:a03:48b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 17:32:11 +0000
Received: from BL02EPF0001A0F9.namprd03.prod.outlook.com
 (2603:10b6:408:13b:cafe::71) by BN9PR03CA0634.outlook.office365.com
 (2603:10b6:408:13b::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.54 via Frontend Transport; Tue,
 1 Apr 2025 17:32:10 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A0F9.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Tue, 1 Apr 2025 17:32:10 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Apr
 2025 12:32:10 -0500
Received: from [172.29.45.113] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 1 Apr 2025 12:32:10 -0500
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
X-Inumbo-ID: 4144244d-0f1f-11f0-9ea7-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=imLlrInLe2cbyIusN30b/rgwdxYJtLyHExfeo36zogDnGd0IwD/gdfo59WOkkXdV9bVgJ/y1WAAsNap0JXrcbdDSaaEWwmzBUGHS4bcBmQpucnHnxFHnDw1Ych2hkQZRl1IOOTsOwY4w2CxCnPMKiclVcrfm8s/aXcJzLRL8SP7cVDcBcJQC1AZfL6Ot36vXB4AWPIt1eBDXYaXR1xMQTiM+hv0gxz3gEmmnsZc3mgeXJRkdcG0xbdTz73UPDzdGTSJEL98Xp8bhM2PV+rXXNfSZTj09sGlvPtFTXPdSq+lFJeqm+iYnLjvxoCGyK5rPtJzGhsAusOU5UleWo23NkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kTmMEaNdYEZu6AqoZQ69ySOHy1dmC9tej6Z7zHKl08w=;
 b=N/ASOGWVQCdbpeYhoNVBIKjDg6LsLUtJdsKMrbooVGSQyaOth+RT2MG3fJ6/yaTgzonNeUFQtTo4VjTAijRcmydF1DEyyIgHwWdu9TloqLPilC0BKkd51DQSCeL/dim6islVDz5lqG9p19BANnPHgRjpINcACFFMT4pBaWhwBpwAJ7+iuRR6ZzVFWxLRyQM4f6zbk6jjjxYpettuNwDLZ3W996AJLWBfalppBkVYyIiBr3tlaJpB3O9Mzi3+sybWEfoN+HTjd2ulX1O0synS7d/UOiKeaU10lZzyn5Zs6wpkPyDGZQZA8fcyQf7vBB0s5YSI9hIc5qFlkmhiPycgNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kTmMEaNdYEZu6AqoZQ69ySOHy1dmC9tej6Z7zHKl08w=;
 b=eTp7MiNZ+b7BVb/J6mJ32lrBCLTZVRiZhUfCHC3Ip9jm7VJYGWCsJ+Av38xrCBG9zsARBKATojUk4Y5eppW2sIcMVePbJYXEnwxcnUekCZZEIrfiBtxKBKiWwTnFisI/CM410pwYUjRLDy6Q3tZeUe6uAZkN43RXDTwb3By6D+A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <8e2ecb31-6fea-46b4-b236-65a663510973@amd.com>
Date: Tue, 1 Apr 2025 13:32:06 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Domain IDs and Capabilities
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>
References: <0dd25ebd-34f2-4391-aa08-3d873ec72347@amd.com>
 <cc53bc20-51f4-49f9-b35c-77805147e603@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <cc53bc20-51f4-49f9-b35c-77805147e603@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0F9:EE_|SJ1PR12MB6050:EE_
X-MS-Office365-Filtering-Correlation-Id: a6912451-a4a6-4838-c708-08dd71432251
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WmJJekR1YVZJekFXRUtRakc2T3ZDQjJRcTBjQVAwb0hGTCsrd3cvYmFKdXoz?=
 =?utf-8?B?VFFZSkttTjY0Z2dKMjczaWRUbE9Xa0d3cVFZMkowdnhPWnpweTc3a3p0Sk5J?=
 =?utf-8?B?eVgvelNwemRNOW1kanlsVUNBQnJUL2p6TXFkMFh5ajlZbjJNZkVQNURaeVFz?=
 =?utf-8?B?OVRRYXZLaFNHZEs1RmluMHdzWHNHeTFhakczY3Y4N3lrdmc3bWdBL3ZEcFho?=
 =?utf-8?B?dXkxaVV3aHlzOWtFTTRaMUtmazJDNzZ0Qm51TGk0UnNKNjNoNDY0ekszMlVM?=
 =?utf-8?B?Z0YvSGFSamtyQk9FQmdod0pXV1ZjOUdCVFVyWndpYVJOMzA3WWtSV0t0clNj?=
 =?utf-8?B?QUkxNVJkZmpmUXJ5Ry9ta2RFOU5wb2xyRU9rY0NMYUFTR3ZlamU4WmlRWitx?=
 =?utf-8?B?VmxJVm44U2xmcjJLczdxM2JaT2lLbnIvZTM4eWpZQi9EM2FwajRXWjVlZDkv?=
 =?utf-8?B?aGNMeHdhUjZTMVFzVzJNRG9ncC9rcFp4RXVjNUFscVQ3dEZRS3ViQmp2NVNi?=
 =?utf-8?B?QlA1Y0RLOXpqaXdjQlJyd1RTcFJybGRDN1U3UWVONzJSSXcza3d6NDNmTFVv?=
 =?utf-8?B?blVOS3BCcFNEelNJMVZFZEtOcjVrUTNRQ3RqRGZYQXYxdWYvMlN5RTdSZlUw?=
 =?utf-8?B?bkFvemNuWSszN2RWZjR0QmU5SG9XVzNUdDhhWjcvVXgvOWJYWjdaSkJqc0dn?=
 =?utf-8?B?YUpJRlRYMS85Z3U3WkJwenhRTERTd1lwc1pJeEg5UFVzMWloYTk3bWg0Mmxn?=
 =?utf-8?B?eUJ6bUFvUXVtZnJMcCtrZWZDZkZlT0FGUzZrOUdZODNDNzdiSGlScVpwV3h1?=
 =?utf-8?B?UjRZdmNoT21oUXJ6bEduaUdQbGQxeG9lRXduWEd5UTVBOUJvTWI1ZCtrT1Vh?=
 =?utf-8?B?Y3I2d1VYT0xXbVdMeUFqWThTcnNrTm1DOXhDMER3aGdKcUoxMzl4T3krWW5m?=
 =?utf-8?B?cW4vU2YyZXNZSWdaUGNwdWlXQnRCMXZ2b1BhQWRsZjAxc3BxNnJNRVV3cFRW?=
 =?utf-8?B?NTY2M054Z3R6eUFYdXNoaktFZXo2TnVVQVl1akkzeUNwbTZXMk5QaWR5WFBa?=
 =?utf-8?B?ZmNaSCtNdmVaSkhNZHcwTzhpOFZqeDBxNm04R0djdGRTdTNIRmZlUVRaazhN?=
 =?utf-8?B?dEZ5VGdNVEJVSW9lRGtHbjdMT0FWamZ2U1M3V3IzcmxOWXRuTCtYK3RHQUw0?=
 =?utf-8?B?SHlLUXpOSzJiUWhreXNFem5nSml2RDBKM1FycFdESVQvQ1JveW01cTNydllq?=
 =?utf-8?B?MXpaTkEwVmJQTFRaaGtYV1IzUlkrVDVld0twRldkNFNZRTEwQVJoRFNXdEsv?=
 =?utf-8?B?UkhxUzNDQ3FBK3dyTXFDYlZrTkRXc2tQMTc5eExiUHNvQWxNV2xYVWFOVTF1?=
 =?utf-8?B?czI4UDFlV3RzaTdDcjZwNUowRFBqN1NldHA0aXI5RVBmeWQ5dFJ1VWFQRDBP?=
 =?utf-8?B?c2F0SFdISDFVUXZaUi8vVW9GcXJybVZtNHpZcE9iWUNlSFBvSU9Ed0pMdW1n?=
 =?utf-8?B?dUFNVzMxQ3lwWUVZdnl2aU80VFQ3cXdYU1JiR0IxV20vQkhZaCs4QTRBRXI4?=
 =?utf-8?B?UDMybVoySTVBLzQ1NkNnak5UWVVaY3ZhZ0ZMdk5RRitUUmQrVVp2d1Rrc2h5?=
 =?utf-8?B?YmF4ZHdDVUplTmNydmhrYzZNSVNsS1I5ZUYzSzdwSitaempZQmRoTlJpZzh6?=
 =?utf-8?B?bWtYRFBLNXpCcCt1SHFRMVlmQWhRcUhLa3lORnlMWVB4eklIdklLK21DY1pz?=
 =?utf-8?B?T3h5eVJwRFVVSG1sZkdUSVB3YUtya00zUDlqMFk3SHlOMktHNXpndlhOOTA2?=
 =?utf-8?B?aHRienR4b3NQd01wOVkvWmNUZzE3MGpnYkdNUGEzT3pRaytQek5qUVh4dzJx?=
 =?utf-8?B?bmwwSWhNWWdQaGF1dGtWODVFdW5xU1FwUWtxRWJPUGVqTTc5U3JhcHZybjNG?=
 =?utf-8?B?RXZiVjhzVjB5K3NYVGxpTW1wWG5PV2tubHJ4b29wVWs4NExvYmlMaEVubnZG?=
 =?utf-8?Q?kvnueCx5ymedoAZABabsdtIWsnlobI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 17:32:10.8698
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6912451-a4a6-4838-c708-08dd71432251
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0F9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6050

On 2025-04-01 04:07, Jan Beulich wrote:
> On 31.03.2025 23:46, Jason Andryuk wrote:
>> It is useful for a domain to know its own domid.  Xenstored has command
>> line flags to set --master-domid (the local domid) and --priv-domid, but
>> it would be better to autodetect those.  Also, domids are necessary to
>> set xenstore permissions - DOMID_SELF is not supported today.
> 
> Setting permissions for oneself?

Any call to xs_set_permissions(), AIUI.  Say you have two domUs, dom1 & 
dom2.  dom1 wants to create a shared xenstore node with full permissions 
for itself, but read-only permission for dom2.  dom1 needs to know its 
own domid to set the permissions:

  *  struct xs_permissions perms[2];
  *
  *  perms[0].id = domid1;
  *  perms[0].perms = XS_PERM_NONE;
  *  perms[1].id = domid2;
  *  perms[1].perms = XS_PERM_READ;

perms[].id doesn't handle DOMID_SELF

> Since guests have ways to figure out their IDs, there's probably nothing
> wrong with having a dedicated means for them to obtain them. It just needs
> to be made very clear that the ID can (and, at least for now, typically
> will) change across migration. As to the mechanism thereof, I stand by my
> views voiced in that earlier thread you point at.

Thanks,
Jason

