Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHAEKpYgnmm/TgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 23:05:10 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4D018D062
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 23:05:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240301.1541736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vv0WU-0000tS-OL; Tue, 24 Feb 2026 22:04:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240301.1541736; Tue, 24 Feb 2026 22:04:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vv0WU-0000rS-LL; Tue, 24 Feb 2026 22:04:54 +0000
Received: by outflank-mailman (input) for mailman id 1240301;
 Tue, 24 Feb 2026 22:04:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UmFV=A4=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1vv0WT-0000qu-K7
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 22:04:53 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7592d96-11cc-11f1-b164-2bf370ae4941;
 Tue, 24 Feb 2026 23:04:52 +0100 (CET)
Received: from SA1PR03CA0018.namprd03.prod.outlook.com (2603:10b6:806:2d3::29)
 by CH3PR12MB8709.namprd12.prod.outlook.com (2603:10b6:610:17c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 22:04:45 +0000
Received: from SN1PEPF0002636D.namprd02.prod.outlook.com
 (2603:10b6:806:2d3:cafe::3f) by SA1PR03CA0018.outlook.office365.com
 (2603:10b6:806:2d3::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 22:04:38 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002636D.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 22:04:45 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 24 Feb
 2026 16:04:44 -0600
Received: from [172.24.237.99] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 24 Feb 2026 16:04:44 -0600
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
X-Inumbo-ID: d7592d96-11cc-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H5XuStMpbiFwQYpZKRaMQNlh+5j+CMUl3nqYBZT+s0EBRjklfhW6wq90sYkLfJOD5XSZKLje/8Td9//uS4wpYi3R2x1CDSvzXyGr6+qG040KVo8vogtOey9MB0OV3PkfpKv8QpYrDFHa64WkLmHtRGrqMc2a0fQ2byPJeH1Xdta/mt2hDWF3ojUZW+KQVzREyA3PFEZsB0n70BQD5qmK60vfYxuQxld5UzIB2Piqj5Q9phYHR+5JhupD6sFAyp7ymIEMR4G5/9sqYEodKpA0CfTU5FsAaHzOOTzN/qyfvRt3+y0C4eJlNDqtG7YnfFQHSs5ZQUolKpmTBeC+HegVRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6vQHplJ48zyA5Tgzvn+0UK5H1Jz87rTVE0KLPy34eo=;
 b=KJdxeUbcG08Fzl39/kBMmMs+T52i+eQTwGhgI02/EtZJ9CrewtPfi0RhEz1puWrpodL7AiI8nXBYMMmBRK4PfaElF9rcB+UYSy4z1JmUMSEePeUM1LqpLbqo1rgj6Yz/AqtJZYITpudGqucUkrJcPOO5JnKDOADZ4sssS/PaeEx6l9XtjUGEorZzVNFqlWScZWStUhy6a3JAOay+/xN8/TfkCpyI5onPXKF2UC309Gs4/8E36jgLICHtGpvGUUDOmbpjHWr+ydcKjUlcmO7FVi19Q8yWev/lmPhXqYn5cAIKbcPffKl1UusYvfgsTrGqpQi38lWFwetci8GVZ8DHPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6vQHplJ48zyA5Tgzvn+0UK5H1Jz87rTVE0KLPy34eo=;
 b=fBaVime2o04t0QyRdwWOOGgq65ANIv8bbLIHt6xkM/h2pRH1d6+gFrrXYUqMvJT29i3OPC/K9+DuWXyl/EFthh2F11iHGeEHVPEmzo7+T1F3feIFCE6IeMdDMfEwQDVuxRJj09wWU9bnRioQmaTwEV9xlF3Wu7d0xKNKRq/YpXA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <c9bc8e1b-8e94-48ba-bc0e-194e11fb4bf0@amd.com>
Date: Tue, 24 Feb 2026 17:04:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] vpci/msix: check for BARs enabled in
 vpci_make_msix_hole
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>
References: <20260224025626.26909-1-stewart.hildebrand@amd.com>
 <aZ2EFPfdv-_1IT-R@macbook.local>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <aZ2EFPfdv-_1IT-R@macbook.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636D:EE_|CH3PR12MB8709:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fa1d240-f373-4778-e43b-08de73f0b830
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R2NaNTZLNTdmRXFqYmRjWHUzNW5LWHl6SGwwdDhLQ0ZZVGxzZ0trbmNmdEhr?=
 =?utf-8?B?RW95STRVaG9XSjA1V2k1QWdEV2JJQmszU3VPVGFJYndWZW90REJWRWVzV3cz?=
 =?utf-8?B?NmZXN2xjdFdPVmlrTWlBUWN0NUpDQkZKWmNFNmRIL3ZYZTdRRWdhY1lsWE1R?=
 =?utf-8?B?Rnp0SjMybUQ3Mi9HbWJJVnZMMnV3MXZNVDBJUnJYUVZ2QnFKY1dISVZmM2ty?=
 =?utf-8?B?TXV5bkdkYUkxblF1TkhvWUJsVVNNY1dhNDFKbDd2dERnZEFDd3dOd3VRWGFk?=
 =?utf-8?B?akpubFo3Z0hobUN5VEtPakxsRFFvZjAxV3JnLy9rNldqcEkzUmVsQjN0V21h?=
 =?utf-8?B?eUJGdmVXRFQ5cXBlR3dma1pEYkpTdWo0dUZKODlTdXB4V0Y3OFBIRmdTazAx?=
 =?utf-8?B?M2h6U0lSYkc0UVc3TWNRVVNNajBEMVhRZUh6Zm5Nd3UrMlZGWUl2aXpwRnBB?=
 =?utf-8?B?TmxHQzltU0V6VHdGQnQybXhzaFBnNTFaRXNIRElaaXJHaS9BSXY0a0gycFhw?=
 =?utf-8?B?NzlLQUhLNmhWL3FpTzV6eGZpM2FTWUprdkQxMS83VG1hT0d2eDZrNUlqbWp4?=
 =?utf-8?B?NmFCY0ZuM2ZqZG41YTdVSjg4eXRQV3JybHdNZVcwajB3cFE5T2RYd0pWbm5s?=
 =?utf-8?B?ZE9rNHVyR2NNMHVUNzhvWnBOWkV5dlBqS0xQWTBIMzltZkkwV3d6T0hiekg3?=
 =?utf-8?B?Y0RXc0cyMkxKSkFzNmtGcGxvNWduVTlJT1Nha2xlalZReTBGZE5EanlEQ2FL?=
 =?utf-8?B?b3NRV3I3OFBuWkZORXFIN0dqT2NqL1VmZEN6cUhMejhCQ0VzeGlDQ3Q2bzJD?=
 =?utf-8?B?RHUya2wvOWlYeWxIM0JQV2t6VlIxQk1SbjdwNngrWjdnRmZqYVFyR1NTRjFm?=
 =?utf-8?B?TysrTndkYkpVckZZcXRKaTVENkJXNVR4c08yTTdlQWIvMFJ2U2xpempUWFAy?=
 =?utf-8?B?TldFS0lVdHAxd29nem1VNDFLbDZ0Vy8vYWIza0lyTmJMOGVaQnlDcllXL3Mr?=
 =?utf-8?B?dEtVSWc5WTZsMmo0dks2VFFTbnREYk84YjdKYURwanluN0tZNlgxUmZXRytO?=
 =?utf-8?B?ZmZwZjhHUEkvdmt5U2duTVpWMkVwWEwrN0JBeUxIQi9JWGZTTDZON1FGNHRl?=
 =?utf-8?B?SWRWdGc4VGRJdXJvc3lVNHBpNkZEa1BDWGlmeW8zWGVVVEpDZmRiOHhaUVRs?=
 =?utf-8?B?VXBpdW95Z0ZtbU5mai9kNGUxSUtiUzNPVDBNMWN3TzFwWU05ck1CK0grTHBm?=
 =?utf-8?B?a1FSbnhkamJ4MEE3ZG4zWFpMSTB5ZDg1Uk5YNTdCakMyZ3U1N1NtNldrR0Ry?=
 =?utf-8?B?MERFQTdxb1hjN2t5YmxUenFneVFNTU9iN2hNN2hZQUhObGhYZUZKTGlseEY4?=
 =?utf-8?B?TnBwbjNZdlRBQ1M3WmFkYTIxOXZsWUhrU1pySWZKb2NaV2lPcXBNb3NZdHVE?=
 =?utf-8?B?cklaTUxncENWRVBqYzlpVzBtcEhlL1hiSGFPcE55U3RSWkliRUZnMkdKYnZP?=
 =?utf-8?B?c2Ria0xoZGc2ZTdWTE1maEhXTlRNZmVzeTJaQVJpRUhwM3R3RmRRTDJ1a3Fa?=
 =?utf-8?B?NzI5ZC9oRldPNlRNdjhHTWF1cDV4cSswUmFQNjN2TFhFOWJVckJBTHp1OEg3?=
 =?utf-8?B?WW5SZkJ4QjhkMVdzWTBzdTFxamFqd3lleUlCZnBlUVFpL2RxYUtxU0hNQkxz?=
 =?utf-8?B?L1ByZC96VUs1aXBTMm5QcnplK1MrY3pValFDaUlzQUg0Z0Y0ODdjazRqR1Va?=
 =?utf-8?B?d0R2NVBPb0htWUY4UXdnQktIeGFCc0k4NHl3V3l1S016R2RYRFI4VHNoeWU2?=
 =?utf-8?B?VTMxeFJXcVUvUVlORisyYkpNZS9zb1FNdkpFd3NYTnBlTVJUQU9GOGl1NjZz?=
 =?utf-8?B?TGk0ZTN6YkpVRE5UdW5ic01MN1lDbUxaLzgxaTdSa1dVOC9GOHM5T2tEVkQy?=
 =?utf-8?B?VjRLQjRnc3dCR3QrQVBhRDBzcVVkNFV3eGhSRkNzSnNMTHRPMGNKYjhPRjdj?=
 =?utf-8?B?T2RFQjZHQTM1L3BnWitsdXNWNDVrTWNEV3c4alFiTS9mT0I0OHZVV25PcmJk?=
 =?utf-8?B?QnA4MklLaTZNVnUwd2lNbGtodTNpSGd1QWk0M09sOWJlaWpUWEhDMjdQNzY1?=
 =?utf-8?B?cHNJZW51QmdLLzZ3T2FRcHpuRTdoTVNSWVJ2dmRDSXhEVW5UM3ZVRzBDa2lp?=
 =?utf-8?B?YWVnZFBLQWNFb2ROaGVIWnpmY3JiNzZ1b2R5b1VDM0ZqQWVxZkJWWmVKdE41?=
 =?utf-8?Q?GsHDUwUTVpT1w42XJMCKvnT1LuWRAX34sdS5WrQHI4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Wzf03sVXyvb2zQzvFYhcAjsyFNkG8bj0xn/WoYnA0iuEks+Kop7KpBL8lOfykFWTgJrcxLQ430hPQgp867ZTTb7zNolBUsKWOZPwURkvksV7TeIHP7kHPQGOMMcn8LxbIO55ladn+Jz24LmTFgmlkQubZty4AuAGPnUEj38Z2soGOkCn9Ij1qHZoR0KBEragelmggtgdSX0o5c5BJdUd53KKzuaD5FG6udnlM5Lq95YUXrXR1s5Bpedch9ASlzYH1Gqfv7z79MNuv7kRaNQNSS3ujJarAygG4IJQ71F1rkyusAha/9ZbLurL9DCwXBEza9F6xFpIAT0YSWTrR013EO4G3GeEw0GE8mzb9LF2wO6CbH4ipXZkD2ZBgbtTL3okWBdiNZSgQWt7OkAVLPVmjBiiZ6Aeb2SEuZhGsPthbT45PQ9IhJzsAfFoIh3xoze+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 22:04:45.2079
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fa1d240-f373-4778-e43b-08de73f0b830
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8709
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 1A4D018D062
X-Rspamd-Action: no action

On 2/24/26 05:57, Roger Pau Monné wrote:
> On Mon, Feb 23, 2026 at 09:56:24PM -0500, Stewart Hildebrand wrote:
>> A hotplugged PCI device may be added uninitialized. In particular,
>> memory decoding might be disabled and the BARs might be zeroed. In this
>> case, the BARs will not be mapped in p2m. However, vpci_make_msix_hole()
>> unconditionally attempts to punch holes in p2m, leading to init_msix()
>> failing:
>>
>> (XEN) d0v0 0000:01:00.0: existing mapping (mfn: 1c1880 type: 0) at 0 clobbers MSIX MMIO area
>> (XEN) d0 0000:01:00.0: init legacy cap 17 fail rc=-17, mask it
>>
>> vpci_make_msix_hole() should only attempt to punch holes if the BARs
>> containing the MSI-X/PBA tables are mapped in p2m. Introduce a helper
>> for checking if a BAR is enabled, and add a check for the situation
>> inside vpci_make_msix_hole().
>>
>> Move the vpci_make_msix_hole() call within modify_decoding() to after
>> setting ->enabled.
> 
> I would maybe make it clear that the movement of the
> vpci_make_msix_hole() call in modify_decoding() is due to the extra
> requirement added in this patch that ->enabled must be set before
> calling the function.
> 
> "As a result of the newly introduced checks in vpci_make_msix_hole(),
> move the ..."
> 
> Or something along the lines.

Will do

>>
>> Fixes: ee2eb6849d50 ("vpci: Refactor REGISTER_VPCI_INIT")
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>> Pipeline: https://gitlab.com/xen-project/people/stewarthildebrand/xen/-/pipelines/2344925375
>>
>> v1->v2:
>> * new title, was ("vpci/msix: conditionally invoke vpci_make_msix_hole")
>> * move BAR enabled check to inside vpci_make_msix_hole()
>> * introduce vmsix_table_bar_valid() helper
>> * move vpci_make_msix_hole() call within modify_decoding() to after
>>   setting ->enabled
>> * split typo fixup to separate patch
>>
>> v1: https://lore.kernel.org/xen-devel/20250812151744.460953-1-stewart.hildebrand@amd.com/T/#t
>> ---
>>  xen/drivers/vpci/header.c | 26 +++++++++++++-------------
>>  xen/drivers/vpci/msix.c   |  4 ++++
>>  xen/include/xen/vpci.h    |  6 ++++++
>>  3 files changed, 23 insertions(+), 13 deletions(-)
>>
>> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
>> index 739a5f610e91..6a28e07a625b 100644
>> --- a/xen/drivers/vpci/header.c
>> +++ b/xen/drivers/vpci/header.c
>> @@ -122,19 +122,6 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
>>      bool map = cmd & PCI_COMMAND_MEMORY;
>>      unsigned int i;
>>  
>> -    /*
>> -     * Make sure there are no mappings in the MSIX MMIO areas, so that accesses
>> -     * can be trapped (and emulated) by Xen when the memory decoding bit is
>> -     * enabled.
>> -     *
>> -     * FIXME: punching holes after the p2m has been set up might be racy for
>> -     * DomU usage, needs to be revisited.
>> -     */
>> -#ifdef CONFIG_HAS_PCI_MSI
>> -    if ( map && !rom_only && vpci_make_msix_hole(pdev) )
>> -        return;
>> -#endif
>> -
>>      for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>>      {
>>          struct vpci_bar *bar = &header->bars[i];
>> @@ -164,6 +151,19 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
>>              bar->enabled = map;
>>      }
>>  
>> +    /*
>> +     * Make sure there are no mappings in the MSIX MMIO areas, so that accesses
>> +     * can be trapped (and emulated) by Xen when the memory decoding bit is
>> +     * enabled.
>> +     *
>> +     * FIXME: punching holes after the p2m has been set up might be racy for
>> +     * DomU usage, needs to be revisited.
>> +     */
>> +#ifdef CONFIG_HAS_PCI_MSI
>> +    if ( map && !rom_only && vpci_make_msix_hole(pdev) )
>> +        return;
>> +#endif
>> +
>>      if ( !rom_only )
>>      {
>>          pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
>> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
>> index 516282205a53..142cfbae59d5 100644
>> --- a/xen/drivers/vpci/msix.c
>> +++ b/xen/drivers/vpci/msix.c
>> @@ -598,6 +598,10 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
>>      if ( !pdev->vpci->msix )
>>          return 0;
>>  
>> +    if ( !vmsix_table_bar_valid(pdev->vpci, VPCI_MSIX_TABLE) &&
>> +         !vmsix_table_bar_valid(pdev->vpci, VPCI_MSIX_PBA) )
>> +        return 0;
> 
> As Jan pointed out, this needs to be moved inside the loop.

Will do.

Thanks!

