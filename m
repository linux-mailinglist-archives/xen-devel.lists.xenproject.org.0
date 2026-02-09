Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AThL3v4iWl7FAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 16:08:43 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2B111199C
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 16:08:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225576.1532109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpSsI-0004DS-JS; Mon, 09 Feb 2026 15:08:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225576.1532109; Mon, 09 Feb 2026 15:08:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpSsI-0004C4-FY; Mon, 09 Feb 2026 15:08:30 +0000
Received: by outflank-mailman (input) for mailman id 1225576;
 Mon, 09 Feb 2026 15:08:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EeIc=AN=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vpSsG-0004Am-Dv
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 15:08:28 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ede6946-05c9-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 16:08:26 +0100 (CET)
Received: from BY1P220CA0024.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::9)
 by MN2PR12MB4455.namprd12.prod.outlook.com (2603:10b6:208:265::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.13; Mon, 9 Feb
 2026 15:08:23 +0000
Received: from SJ1PEPF000023D0.namprd02.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::f7) by BY1P220CA0024.outlook.office365.com
 (2603:10b6:a03:5c3::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Mon,
 9 Feb 2026 15:08:22 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023D0.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 15:08:22 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 9 Feb
 2026 09:07:01 -0600
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
X-Inumbo-ID: 2ede6946-05c9-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AvugacQntXAb/QpydDpSMzW98Zl8mbWqji0AymP64+8L7xQuCcPFk/pU3oEQcuUv5fFuMi3J9JoUX18bwzHs1Dvc4mclGSLVEckBi08GnpXdsAg+DraRztKwbvH7nJUusWZWxzCrrUcHwSmr0nVLeea1XBckYE85hxZuqzq6oekY1VwAGck7JMMzbQBtHr1vUFWAaq73W9pflL5ZdmaNJlFMp+lKD59mxNKT+3Dqo1bKA5c0HTxcU3u7ZdY0GDKT75pz4N/0kTW1oSXQu0ATDA/oDQI55yf2gODxSG38r5lAq9irs8w7tUyvA1TXYo+wi0nna0q8wMlVS1PzO1MEVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZACJAMIXm9fqBihO1qHxx44lQPPNDIw2L15Y3Sh9xok=;
 b=A/RAdJH6ABD/adWj211XhNMMTiy6PwUwf0q4mW5iqVIsZsgklVhrSl9fhE6kmKYENxprWwRwie6OHPEVDiY1l87PHNjF8pheXY9AJxzxIMr861ON33dM1kSKf4b/IWq+cdqAJ3yPJ/JId7Cg127HsyEz5iMo6N5nAgwLmNjO77xn3W4vhEYDKqYk93DuN2yvnGS4fGBHdEj78/efG6U1MNLMezfwPqMd4E/v/YIoVZFZRM02mMMe+wXq+ZSrp0lkXyYVTPPUks3gSn6e8/LkQZDH/LZkCPeGDqr8cQgjcUF09MqvITujYEILIgCeUxIhu+RGO9DerMm4RhdxVCewKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZACJAMIXm9fqBihO1qHxx44lQPPNDIw2L15Y3Sh9xok=;
 b=0VmroLvEj8PDovekTLkOz9OugzZ822fdxHL/P77q6aBwTo884u2aMoIQSEWEEPtlhNDk+ZzdwZEHYB+pWvhKSdOHRSmDF/Vg12tRbZSjfoBrw//3G/duOjs9u4MBkqH/urClIoOTZGNCfmFhO5M0IEksfd1voCrMs858FvYaXig=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 9 Feb 2026 16:06:59 +0100
Message-ID: <DGAIWLL4CNGJ.22MBOK3KETJG0@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Tim Deegan
	<tim@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/shadow: Delete the none.c dummy file
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
X-Mailer: aerc 0.20.1
References: <20260209104104.7840-1-alejandro.garciavallejo@amd.com>
 <fcbdc4bf-249a-4495-b0fb-434c0e793484@suse.com>
In-Reply-To: <fcbdc4bf-249a-4495-b0fb-434c0e793484@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D0:EE_|MN2PR12MB4455:EE_
X-MS-Office365-Filtering-Correlation-Id: 78074416-145c-44a6-b7b1-08de67ed1119
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UGhYbzJGY1BoSTB6YnlHUUp0aTNPYUc0RFhva2h1V1Z4Z2t6ZW1xbGxYUFBy?=
 =?utf-8?B?cFgvRmg0YmZRdm9Lb2FsYWZYMTJlL0ZPYjhyT1BSbnRCVFlFUnhjY3Z4Mndo?=
 =?utf-8?B?M0pEQTdDTVVzZXFRbndWNFhTY0I0YksvUmdmWTQrbzZkZ25ibDUyc3pxR0NS?=
 =?utf-8?B?S0pWRTlva0VtNTNudWppOUdOUitPT3pFYmI5eHlYdEUvcFpXSmE5ZVppVHlJ?=
 =?utf-8?B?ZTF4bGFWSUJLam5uNmVQOU01V1hobTNRdFJmMzEyZFk5L1JpWWlNTngyTFVZ?=
 =?utf-8?B?dmcydnVqL0JucFR1dlJYNmwzUFdRRVFHeW51MTYzOGlTVTFSV3VTN0l6RzhM?=
 =?utf-8?B?UDZYODE1a3pzS2pZRkhyMFo3OFNvb29PSjROM3RiaVF3ZlhuRTNCMTlFampY?=
 =?utf-8?B?Y1lCb3I5cmVOLzBqUDQ1b1YrRldvRUJnUUY3dTBoK1NGblUyYVRDb2RxMnN4?=
 =?utf-8?B?b1Rkd3FleXdvWnZ3NG5DQTVidG4zSUxLcmpaaUY5SHFxdmxGQk5PU2RreVZW?=
 =?utf-8?B?Z2VjbGdRc1BmeGxKdG1sU0pvd0ZNWTN5MWRlMTNpcnRXOEJ0cW9BZ1FhN1Fj?=
 =?utf-8?B?RVdyMExvUXJUTTBEMk13a3U2WnpBdEIrWnMyRmNkekFmL1J0SWdmVzNaMlhT?=
 =?utf-8?B?N2JBMlBsaHpocEVMY0VFcmpOcDZHRFpmNC84SkFmZHJxM2ZielB0VmxpckR5?=
 =?utf-8?B?VDdveHpWMS8rd1IyVlJpTjJnVjh5eU5JUk43b200NE5hUm9oL05VVUtvZk5v?=
 =?utf-8?B?UHBZNGxCRVA3cTNLQklneW1YTEJ6cVlESXRQWThWMTJMNlliRGI1MGl0cVFh?=
 =?utf-8?B?TW5ucVlNSGJiajIvR3pqK3dxMzRUZUNZaVVRSmp4Zzh5YUVCMXZXUHdlRDZt?=
 =?utf-8?B?TDB1ZHlHSEdBQUxmeEVNS0JyYnNTVWpOYmo4Ni9nK01NR0x2blBuVE15c1Rh?=
 =?utf-8?B?d3lkd093U1RENHBVOFMxUUVGWE9ISnNLQ3lyOFJiVFc2dVhEMkQvczlBaDBF?=
 =?utf-8?B?RExJZ0RCdHBtYkFzNGUvZGtQdjJka0dkK3NYUjlCYnhZbmhSYys2S0FZVlc2?=
 =?utf-8?B?VGhSYlMzc3NycUt1Y2FHK3M3NmRWYkZ5aVRLRTl0YTNwSUpQdUorbmd4cDRD?=
 =?utf-8?B?NUlCMDkvSm0vUUl1TVB2ZHp6Sy9MUUhsNjh4YVkzaVh4L05kTFJNMnlmbW82?=
 =?utf-8?B?ZUpTTnA0MURuQ1R1VHo2T1c1SVl1UHdpMUxsc3c0S2g2V3pvZTN4bVpOaE5Z?=
 =?utf-8?B?YllCanp6a3hWYUdKNENtaHhNOUpRVEpna3pLVmdTdHlGc3pSMG1paWZndEhj?=
 =?utf-8?B?Z3NzcllyWWhEZVhiUGsvTEpNNEtyWFgvMlR1dGFRam52SGY4NzBkMVZ2RHNI?=
 =?utf-8?B?cHdveTRvcUN4R0RFeVJ5dXp1ZDFpbjg1bnVmM1IxbHB4OERXRGwzOEdBU1oy?=
 =?utf-8?B?R1NDcndDZWxwNnlvRGtySW1UYnpsekZqaWM2bVAycjZZQ0lQTXA5bkgwMlR3?=
 =?utf-8?B?OHRpNVJqL1lBaWdHb2VsUkpSSU9FOXdtN0NTK1lPOXlxUEU0NjhUYyswT3VS?=
 =?utf-8?B?cW1rNEdDd3dTOXdieC9hSWxWOTl3NTNpUzZycFBnVUZyOHFhM1BDczc0SXpi?=
 =?utf-8?B?dVNMOVRPbitHamhsMitydTBMVjVPTGVPMmJ6Q0ZsUng4WjBBSldaald6Ujhn?=
 =?utf-8?B?S1Jqc1N4RnBsWFJRNDVFM2lXakpNanhobTRLUEtsYUxSemttRGs1am1qZkpP?=
 =?utf-8?B?TFpIVk5EVGkydDNpNFZwYmRaWEtYcEJrbXlRRkc5RFNXTWdBK3lkWFpZOHZJ?=
 =?utf-8?B?V3hIVlZ0MzlJK0R0b1N4TElBRlI1VEZqQ2M0bmI1VlQxMVFTQ0k3em44Q0JE?=
 =?utf-8?B?Y0p1Wi9IeTZhNm4yUmQvQVZkU3hHaEppNlBNNXdhMW1JRndsQ0RhN0lzWjRY?=
 =?utf-8?B?Ly85Vk9CcXdwNXZJRHczL21yZUtrc1crZ05obW9KMUlZTDBPWWVXakJnUnBI?=
 =?utf-8?B?V2JUaXhRWmFFMjdPUjNsZXdpUzlNbWxFWjVhcE9qa3Y5Rmp1YVV1aVpWOVln?=
 =?utf-8?B?d0ZueHhPeC9wMzQ2aXpXYnVrRGp6eEtSckpndWdPS3A1algyNitoRTIyTyth?=
 =?utf-8?B?T3dZamQzUGxWRjBtME1YWVFRZ1RuRG82dlhtM1VqL0NnNDJTVjR2eGo4djk3?=
 =?utf-8?B?WG5HSkRhaHBFSWhWZUc4K2hzbU9RVlB2bnFEaVFkYVBpUmJkNzhKUzRXWTBK?=
 =?utf-8?B?bE95cldEOWZBbnkzWTFCNUFZSGZRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JufWAUGwlCjuhj7r5CvbfTRJyHGQgJaQR0qkPMcyojG+mlOv3YaeGzgmTykAihtLbOfRhCwCBGM3qclDpIW9L7kv8BZXfhdFH25tbipS0bwiRQRY97u8ufHO4q814rmD1cJ5A4xK5h47UM9rk+MTP307XIXCgEId7TUlXs5Z/XRS5mJo6eCJsEaOOw7IvqNATJHC84s2lp2XMEhDoEpghlVkze7EIGprPr1gYG4DfigripQyZqdM5HdtRcdMLi3WK546oTEgFlA5ZY0LTKAkzpbR1pDgv7YueqMlqZqrIsvFvDGV1f0dLzmLeg195P8lGKuEcO6L1RoK/+FRA9by9ism/nYnYvS1r0BKs0jTpEZgL8KEwz/VdLyH3rhGc4OX0x+YJVsSSzjonjZ1yfHnVeZo2lzq7iHvfP2dyL5Yy9TWwqZfvwl8HVHRS3ApXNRx
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 15:08:22.3895
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78074416-145c-44a6-b7b1-08de67ed1119
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4455
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:tim@xen.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2A2B111199C
X-Rspamd-Action: no action

On Mon Feb 9, 2026 at 3:36 PM CET, Jan Beulich wrote:
> On 09.02.2026 11:41, Alejandro Vallejo wrote:
>> It only has 2 callers, both of which can be conditionally removed.
>>=20
>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>> ---
>> I'd be ok conditionalising the else branch on...
>>=20
>>     IS_ENABLED(CONFIG_SHADOW_PAGING )|| IS_ENABLED(CONFIG_LOG_DIRTY)
>>=20
>> logdirty patch: https://lore.kernel.org/xen-devel/20260209103118.5885-1-=
alejandro.garciavallejo@amd.com
>>=20
>> ... to avoid the danger of stale pointers, with required changes elsewhe=
re so
>> none.c is only compiled out in that case.
>
> I'm not sure I understand this remark. Is this about something in the oth=
er
> patch (which I haven't looked at yet), or ...
>
>> --- a/xen/arch/x86/mm/paging.c
>> +++ b/xen/arch/x86/mm/paging.c
>> @@ -634,7 +634,7 @@ int paging_domain_init(struct domain *d)
>>       */
>>      if ( hap_enabled(d) )
>>          hap_domain_init(d);
>> -    else
>> +    else if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
>>          rc =3D shadow_domain_init(d);
>> =20
>>      return rc;
>> @@ -645,7 +645,7 @@ void paging_vcpu_init(struct vcpu *v)
>>  {
>>      if ( hap_enabled(v->domain) )
>>          hap_vcpu_init(v);
>> -    else
>> +    else if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
>>          shadow_vcpu_init(v);
>>  }
>
> ... these two hunks? In this latter case, I don't think the bigger condit=
ional
> would be correct.

It'd be about these hunks and the inclusion condition for shadow/. I sugges=
t that
because...

>
>> --- a/xen/arch/x86/mm/shadow/none.c
>> +++ /dev/null
>> @@ -1,77 +0,0 @@
>> -#include <xen/mm.h>
>> -#include <asm/shadow.h>
>> -
>> -static int cf_check _toggle_log_dirty(struct domain *d)
>> -{
>> -    ASSERT(is_pv_domain(d));
>> -    return -EOPNOTSUPP;
>> -}
>> -
>> -static void cf_check _clean_dirty_bitmap(struct domain *d)
>> -{
>> -    ASSERT(is_pv_domain(d));
>> -}
>> -
>> -static void cf_check _update_paging_modes(struct vcpu *v)
>> -{
>> -    ASSERT_UNREACHABLE();
>> -}
>> -
>> -int shadow_domain_init(struct domain *d)
>> -{
>> -    /* For HVM set up pointers for safety, then fail. */
>> -    static const struct log_dirty_ops sh_none_ops =3D {
>> -        .enable  =3D _toggle_log_dirty,
>> -        .disable =3D _toggle_log_dirty,
>> -        .clean   =3D _clean_dirty_bitmap,
>> -    };
>> -
>> -    paging_log_dirty_init(d, &sh_none_ops);
>
> How do you avoid d->arch.paging.log_dirty.ops remaining NULL with this
> removed?

... as you point out, the ops don't get initialised. Adding the log-dirty
condition ensures there's no uninitialised ops (even when unreachable).

>
>> -    d->arch.paging.update_paging_modes =3D _update_paging_modes;
>
> Same question for this function pointer.
>
>> -    return is_hvm_domain(d) ? -EOPNOTSUPP : 0;
>> -}

Oh. This was a hard miss, true that.

>> -
>> -static int cf_check _page_fault(
>> -    struct vcpu *v, unsigned long va, struct cpu_user_regs *regs)
>> -{
>> -    ASSERT_UNREACHABLE();
>> -    return 0;
>> -}
>> -
>> -static bool cf_check _invlpg(struct vcpu *v, unsigned long linear)
>> -{
>> -    ASSERT_UNREACHABLE();
>> -    return true;
>> -}
>> -
>> -#ifdef CONFIG_HVM
>> -static unsigned long cf_check _gva_to_gfn(
>> -    struct vcpu *v, struct p2m_domain *p2m, unsigned long va, uint32_t =
*pfec)
>> -{
>> -    ASSERT_UNREACHABLE();
>> -    return gfn_x(INVALID_GFN);
>> -}
>> -#endif
>> -
>> -static pagetable_t cf_check _update_cr3(struct vcpu *v, bool noflush)
>> -{
>> -    ASSERT_UNREACHABLE();
>> -    return pagetable_null();
>> -}
>> -
>> -static const struct paging_mode sh_paging_none =3D {
>> -    .page_fault                    =3D _page_fault,
>> -    .invlpg                        =3D _invlpg,
>> -#ifdef CONFIG_HVM
>> -    .gva_to_gfn                    =3D _gva_to_gfn,
>> -#endif
>> -    .update_cr3                    =3D _update_cr3,
>> -};
>> -
>> -void shadow_vcpu_init(struct vcpu *v)
>> -{
>> -    ASSERT(is_pv_vcpu(v));
>> -    v->arch.paging.mode =3D &sh_paging_none;
>
> And the same question yet again for this pointer.
>
> Jan

However, on the whole. Under what circumstances are these handlers invoked?

They are only compiled in for !CONFIG_SHADOW. But these are only applied wi=
th
HAP disabled. Are they for PV or something?

Cheers,
Alejandro

