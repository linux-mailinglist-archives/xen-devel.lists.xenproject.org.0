Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIfJETnDjGkmswAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 18:58:17 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D641E126C13
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 18:58:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1228183.1534528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqETZ-0002Vz-Kw; Wed, 11 Feb 2026 17:58:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228183.1534528; Wed, 11 Feb 2026 17:58:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqETZ-0002UL-HI; Wed, 11 Feb 2026 17:58:09 +0000
Received: by outflank-mailman (input) for mailman id 1228183;
 Wed, 11 Feb 2026 17:58:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZNQR=AP=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vqETX-00026u-FI
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 17:58:07 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36e7e5cc-0773-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Feb 2026 18:58:05 +0100 (CET)
Received: from SJ0PR03CA0185.namprd03.prod.outlook.com (2603:10b6:a03:2ef::10)
 by DS0PR12MB7745.namprd12.prod.outlook.com (2603:10b6:8:13c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 17:57:59 +0000
Received: from BY1PEPF0001AE18.namprd04.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::1b) by SJ0PR03CA0185.outlook.office365.com
 (2603:10b6:a03:2ef::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Wed,
 11 Feb 2026 17:57:50 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BY1PEPF0001AE18.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Wed, 11 Feb 2026 17:57:58 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 11 Feb
 2026 11:57:58 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 11 Feb
 2026 09:57:58 -0800
Received: from [172.25.238.194] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 11 Feb 2026 11:57:57 -0600
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
X-Inumbo-ID: 36e7e5cc-0773-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S/fBXw6PfKklBYCO1j1D7UW6W3aG57pk7l0RpnZpn0Ej9trTnesy+G/J/O/TMU1oqrZfbaUpjOIacXhnzRVTw+q7p7/swXmfr2s+ohj1/uzguSKiuxKnsCjhLZThh6jPtCBXysD9S6d5xps64VFFlwc1ziYQwAjGAyadDppEd3FSjY2gO7qSYzGjuOkGQ2h9eSSxgBajy/LwvcOY2NZyV2+3Pqi4HUTHAHKevon2ob1DT9a2JV71YTFv2PhrpBZC/v35i39EpS28lZB4MEunLqV6HCcPy4Tj9F5SV2Rvr88DTcEumKLDa0Z+GfsKPbUuD5TC8ysqHrP5GYcc82lsQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cuxChwQnYs1S+LdwdTX/HlOeyWPTe+gDwEfHWFxVZys=;
 b=MtH0MkSn0T0RgDTPtGL101Yqn3VWRr3P+XLRrp8ODzJ8XQPZbQQv2SV3MyCjIBgFgCZxywVnS/65rnR0KUolzF2BuJ/ixcxARKy67L5dKmpbB8wG6D92P89dc1+MvKmM/DVrn8e3+AZyMOyfyFYSrrc2Wrcg0Z2tVhO64VMYkIwEF59AA8ZxnUTw6Mn48JEsFGbqJ0Y51rCw4Z3Af0WQYKau4rhkihCxtepg3b0+CLL8tKJqWIpKEHEm5ukKRBFbS1PO8MOGzlysS9xY53ZcYp5CoEzv5wvUyT6cUPPpZm92bOHUX5skF6iEgfGCoMfc8Q8LxEHD//87mabiUYyAgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cuxChwQnYs1S+LdwdTX/HlOeyWPTe+gDwEfHWFxVZys=;
 b=cZ7OWEj5ruOMi3n4xNpUwWshqCi2TelMAup8yAN85pdcWVvc/VY74AfWz77tRXIXMWz4/0Nk/AhfyJlM512M2IHc4KPly1nenvm6uHl8BaMERVziRRdjldhhj82Zp0JD18KHEK2Ml0RoFBn14UsrHWJW4KijqFodIn21q9TRcKk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <8fb08e1f-a0d4-45b5-ac7f-3b14db81b8a3@amd.com>
Date: Wed, 11 Feb 2026 12:57:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Put wait.c behind CONFIG_WAIT
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Michal
 Orzel" <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
References: <20260211170118.109946-1-jason.andryuk@amd.com>
 <73bf621d-0795-4fbe-b926-71be3525b4c7@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <73bf621d-0795-4fbe-b926-71be3525b4c7@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE18:EE_|DS0PR12MB7745:EE_
X-MS-Office365-Filtering-Correlation-Id: ae6b61b5-6639-4b13-1d4a-08de69971798
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UGlGanNlSWJDWDBXdE9CN3l4bFhYb2xpZ0NDcnpZNC9TTCt3SVdCNmFrMC85?=
 =?utf-8?B?MFFGRFRyTU8rZDgxMzFZTlR4bUdibk1pckhMd0VOY1MrRDc5WFpwQ1BQTS9G?=
 =?utf-8?B?VmFHS05yMDFSVURTV3JWUjJoa1BSbWxaNEFiUmZtRlQwT2VzNzlzbEtuVTFM?=
 =?utf-8?B?cFJrV1dsNWR2OXV1eGQwaG5DNnBUTVJvK0xoNUlNZkp6K0Vnb3JiaXE4T2Fa?=
 =?utf-8?B?cUVlQjRZdHBRT0doK01IbTFYYjV4dWpRVjJFb0ZOZ2ZSM1pKWmdZdHFOUXVv?=
 =?utf-8?B?TW8wUWh4NW5LN2FrMHZ6SVpoRFZQQ0tsa25KU3BzQ25JV2FHMFNxQ2xvWHEr?=
 =?utf-8?B?QmNuZ1pFc0F3TWQ4Qmx3WnVZbTNBTm5QOEUwTU8wbGJZcEIyazYraXhHQkNH?=
 =?utf-8?B?andyUlVkaEo1bExiMUhPZ3J0b01zVVhSd1p0VjFsdjRvYXpMR1VwK3I4bkJu?=
 =?utf-8?B?dTBrbWRGZ2czNTdVbm5CRGUzV2I5dXhWdzVESy9BZHpVM3JUdjErSld2UUZN?=
 =?utf-8?B?eGdWRDFKWEVZRDVzd1NXOEthNjNnckFWTFRvWEtpSmNWemhZWDIwNWZLdXBG?=
 =?utf-8?B?bkEzdTdrVTcwR0pYQVBtVHU2a1N2SG9abjhPSW5UWmFkUkJicDlJZ0x1VWdx?=
 =?utf-8?B?M3gzUVAyWjJBVUFpeDlZN3UxSjBvU2VMVDcrVC9LakJUN2NZWi8vNWlOY0tU?=
 =?utf-8?B?eUhTVmtBTGh0Z3lIamQ4NXYybXUxSmJGQ3pac1liOWFnN1p2K085Y2ZSY2Vl?=
 =?utf-8?B?THR2R2NKeVhGRlpaN1pzSHZ4VUFDVEJlT29aNm1FVUhnWnlkWHYzOVF6eUw0?=
 =?utf-8?B?N1BoTExNb1dqM3gvQkdQaGpUOFMyQ2Nnby9NeGhJNkMrV2hqZGhubUk3K0Z4?=
 =?utf-8?B?V25DVXI5UTM2QkIzVU9DMWJBOVNOeDBYLzdiS3A3VmFqTEljRjExNVQzdVM5?=
 =?utf-8?B?d1VtTStSRTM4TFRVbmtZZzg3RHJ5ZFFCTkdmMjNvTEhML054NkQ2WXFvOG5F?=
 =?utf-8?B?MEFlUVU4K21GY1RWMWJwZEl6VmdOQWxqay82eGJxbTNmcDIwem9ubngrRVhx?=
 =?utf-8?B?QWZ0eFFYd2s1SnEra0lOMm44SE12Uit0em1qQ2NERXJ6NEZnTGttQW9kTE9r?=
 =?utf-8?B?MXFHWmZrOTZwUi9YMEdkTWwxTjlwbkR2Sk9TRkJoRjZmU2hOQTlyNmlFdGp0?=
 =?utf-8?B?R2hNNU45b29RY1k1MjU0cnVidUJDV3B6RGxieC91ck1meFlaY1NkNHhYTlNY?=
 =?utf-8?B?ZGNsQmJNNk1oSEFNOWsxTHlnOGdVSkRlYzFXSTJtZlFNbjkrbTFtSzI4OWxr?=
 =?utf-8?B?ZlBtalRuTWN2UDZON29qR1BIY2k0Uy95MmRNMGV3UW9nTURFdDBRS0FyQWFl?=
 =?utf-8?B?ZzdadmhXbGpJSk9KTFYzcmQ1RHY2Q0F3TUhkYUZzYm9hMFJSMVhlN082ZUc5?=
 =?utf-8?B?VFZYTFhNbGJkSFBQQTAvNm1OS3k1akdjdlNZMkVIZVV2cVJzazNjTmlWU2N3?=
 =?utf-8?B?WUgwWWZjSktCVUl4NkU4b3NzamM3MmRvL3NpT0JSdXNVdzNaeUNXR2dqeTBI?=
 =?utf-8?B?S1FZNDA4cm9pK1dvb2ZPVkg2cXIydmt4YkdyYk84b3prY3g0VVNVTFFMOStm?=
 =?utf-8?B?dFVoSzlpY012NXh6UUFRdi8xSGFic2JtTkN5Z0RuSUtaWS80Q3Y5YllZY0x2?=
 =?utf-8?B?MEVwbCtOYnZBT1h5YW9pNGtOSW01MkcxVmg2S3RDeG5WMlNyWjBpbDRuSmF1?=
 =?utf-8?B?cVdmaGtYc0NzZU5kVXRVWjZBL1NBRWVaRDVYdlA0eUxsRDNlbzllRTZlekth?=
 =?utf-8?B?UnpWcVJGcGREaGJCMDRvWFQ5ajZDeUc5ZExJb2dYL3NPRE92bUgrWTRxU2xC?=
 =?utf-8?B?VDl5WVc5NC8rbkhQaSsxaE0reGpFbnFrT0hnbURlNk9sY0lzQ1gybTVvajNx?=
 =?utf-8?B?ZVpUZENaRU5BRndYaWZPOVhIcHpERFlJMElKR0dXbUpRR2VxSGMyOHVwVFQ2?=
 =?utf-8?B?YlJWYmlxL1Z2MjJQcnZsK2hpbG9nQi9OWGt6bytlTjQ2MlArcDdCaUhNb3hR?=
 =?utf-8?B?Ukhad2REd0dkVVZrbFAxUTREc0g1bDlFVjlmN3B5TG81bGZCRWdkTE4xaWZn?=
 =?utf-8?B?SHVERFJhWnkvWDJBUjBObTA5NWphMHllbUdWTnFsZzlKSHNUeXBMOEZyNlpH?=
 =?utf-8?B?a1JQSlBLOU5yeGVOYzZFNWJEVnBXcXZsOFJ1eStjM0NRbXNzeWF3V1M2NFBN?=
 =?utf-8?B?MlR1eTZwMUc5dTk2Q204cmV5MXhnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZbKVMAqpkGWLsTKwt0MA3Q5BrwzlEYBcoBXCJ8r1KlfbSINRzIkABNoEa+QOhfoavV2a9mBT5hAP04zT8wGnzcdzR8fFN12b8xeTr05QhjN920PMCxPxGp/TMJ9aekDFTlid6/a7+86U2U5DCkmYsKUNj3NvEQ/xAV5LksZ7GzVtO9JyPp/fCaj9MxE/OGfDI0Vm0XTAnIHR8cMBMBhyLY1Kca5MkgF8PUprIBVPvplbUjt2apWE4U5t+bD437iqLhurxZv9TyVT8zIoJiY6tnG2wfwaod3wTOqs05QfJqMOBkiNrU3pxk3YLns7ik8JwqYdgUUM8mWWyGCKXy4zRRjvDPNhJgGVgueuFDieW1E+s/QjzGfMVdcpn0+A41t90oBSlhLPUibexOWwAEXQQoJcaRgkOy+YzooWBF493di32Cu1/Fn0AFy+F6ZfABlu
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 17:57:58.8673
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae6b61b5-6639-4b13-1d4a-08de69971798
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE18.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7745
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email]
X-Rspamd-Queue-Id: D641E126C13
X-Rspamd-Action: no action

On 2026-02-11 12:30, Andrew Cooper wrote:
> On 11/02/2026 5:01 pm, Jason Andryuk wrote:
>> wait.c is only used by vm_event.c.  Make CONFIG_VM_EVENT select
>> CONFIG_WAIT, and use CONFIG_WAIT to control building it.
>>
>> Provide stubs of functions called from common code.  entry.S needs an
>> ifdef to hide the symbol from the assembly.
>>
>> Also conditionalize .waitqueue_vcpu in struct vcpu to save space.
>>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> I'd really rather see the API/ABI changes required to purge wait.c
> entirely, but I guess this will do in the short term.
> 
> Two things want further thought.
> 
> First, because ARM uses per-vCPU stacks not per-pCPU stacks, it doesn't
> need this infrastructure in the first place, but it looks like it's
> still compiled in and half wired up.  I suppose you don't notice because
> you compile out VM_EVENT on ARM too?
I was focused on x86, and didn't realize this was used by ARM.  I think 
I noticed the lack of check_wakeup_from_wait() calls on ARM.  What did I 
not notice?  Are you saying wait.c should only be built for x86?

> Second CONFIG_WAIT isn't great name because there are many things it
> could be.  I'd be tempted to just reuse CONFIG_VM_EVENT and go without
> CONFIG_WAIT.  I do not want to see any new users of wait.c, and it will
> disappear at some point.

Yes.  I used CONFIG_WAIT since it matched wait.c.  I considered 
CONFIG_WAITQUEUE, but went with the shorter option.  Re-using 
CONFIG_VM_EVENT would be fine with me.  I didn't use it in this 
submission since the waitqueue functionality is more generic.

Regards,
Jason

