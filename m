Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFLzAxz8b2mUUgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 23:05:16 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D90D4CB35
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 23:05:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209351.1521391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viJpf-0002k8-9e; Tue, 20 Jan 2026 22:04:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209351.1521391; Tue, 20 Jan 2026 22:04:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viJpf-0002iN-6K; Tue, 20 Jan 2026 22:04:15 +0000
Received: by outflank-mailman (input) for mailman id 1209351;
 Tue, 20 Jan 2026 22:04:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nzue=7Z=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1viJpd-0002iH-JP
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 22:04:13 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f21d6194-f64b-11f0-9ccf-f158ae23cfc8;
 Tue, 20 Jan 2026 23:04:10 +0100 (CET)
Received: from BN9PR03CA0147.namprd03.prod.outlook.com (2603:10b6:408:fe::32)
 by SN7PR12MB7299.namprd12.prod.outlook.com (2603:10b6:806:2af::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 22:04:05 +0000
Received: from BN2PEPF0000449D.namprd02.prod.outlook.com
 (2603:10b6:408:fe:cafe::7d) by BN9PR03CA0147.outlook.office365.com
 (2603:10b6:408:fe::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Tue,
 20 Jan 2026 22:04:02 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF0000449D.mail.protection.outlook.com (10.167.243.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 22:04:05 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 20 Jan
 2026 16:04:01 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 20 Jan
 2026 16:04:01 -0600
Received: from [192.168.244.38] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 20 Jan 2026 16:04:01 -0600
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
X-Inumbo-ID: f21d6194-f64b-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G2KzZ0Jv8hb7SJ/gN9vshAlVokMB9v5cLCw7cly7oHKx+P2cGEIc7u5cgalhxAY5Oos87yBXPPR44AV9mICs5w+3wzWJj5D4+sX/XP/Cb8PRa69/7zXBrudyXJYxbpJZoskNB1jvd47F9vfUuv3gZhPZoa4VWj/GIVoCmcMUUO+BD4C6vTTNOZ8DrpWx0AZRPwuU45JIiHy595Ex/uMPHyrKJPvtBTItclvuH270Vjp40fMYmKWivjXZnE+gvIAm6u4CS6ll1Hz3FGa2RES0PUktvkRcaHxICcdAhWvhYfDewUeUYduZK6yayaJdalL8nF6TOnWSR4aJgHz1XFm4lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2CZ1dnt1lNwrbVox00zyWzt2jGmgrmLLiOCyztI1bBI=;
 b=ZfYzV0MsJtwxW+oNbEv5wrPohec1yvevYvKTdXRfrPo3cH3VKxLCdb+G+/tyb9ojIImtWhPVbatO/4OHGqAhPryzSxLEHE3sng20xe61ELu+YUyGV9qWonZ3CkXa+8SagQpGD7Nv3d7xWRmfHh7VanPKuvHpjhEL1W8QuIBICQLn05EA4gEH+4w5uErfTuRmnytqdJTX4R7I+Dg6SqLhE4IGLXNz9EibjYFcWx7mg2LTOoTlYdu+tPg56IGF0uu/dOKqBi4QvpToFsBTYhrR3mrlUHhMvEBQTY9ES5qfq3qRwpMePMAzf0TuDW4FRHkuZoluVgfv1eaaJBm61jp4Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CZ1dnt1lNwrbVox00zyWzt2jGmgrmLLiOCyztI1bBI=;
 b=akwJP73T3yKmzcrIiL686vzUCDByWKEgKL2kdDREPEYTqjevTPzNVfaTe9qZysJ2ZBztdjRFmhNOFUxDtgkp1Xd6HWQtZkLYGr2x10y2hREMED/5iunN5ayN7xJwON9RPoYCMFcd67u1bzZMfQ5Kg5hPM/a5iVCAkx7EAg/iHJc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <57308b26-8a52-4914-a0f4-7fb8446252ad@amd.com>
Date: Tue, 20 Jan 2026 17:04:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Strange symbols_lookup() behaviour in test-symbols on arm64 CI
To: Jan Beulich <jbeulich@suse.com>, Mykola Kvach <xakep.amatop@gmail.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <CAGeoDV_YS8hV2+FXVgXxvHLw=MQOAoJZwrP1Ypw8+ZUjKB9GSA@mail.gmail.com>
 <a5361a51-128d-47e0-b5ed-58bfd0d9e8ad@suse.com>
 <CAGeoDV-vfiKECmvWzJ4dnzicXDL7XJDxwEy_Z737k+234Gkzpg@mail.gmail.com>
 <CAGeoDV8VZ1m6CQAkKK-9UDz4npXm2V+Up+BBo=+NyzgLJMW+3g@mail.gmail.com>
 <b4013cae-f27a-4c69-b136-d33db2d22725@suse.com>
 <CAGeoDV91W24tu6MOuM6a9B1jDjJ_8oNdsMYaxNA-ehbxn3xLoA@mail.gmail.com>
 <10aaed6d-6cb1-4bed-aa8c-5f9761f04fde@suse.com>
 <CAGeoDV_bTFNMS_XbEyfB0xNmpi=Yhr5VzszDBPTS5yYtjo1hnQ@mail.gmail.com>
 <e38c24dd-1acc-4d9a-b6f6-5e1964753840@suse.com>
 <CAGeoDV8QDBeqTPv30hcbd2giGRJp_1h+JgeGuTodhP3m8qHpHQ@mail.gmail.com>
 <b30ecffe-f696-4777-8e85-2fe30407534d@suse.com>
 <CAGeoDV8US=pPHN-jYCKDLJpjJGwLg7jm2FaBCRwv-zmQ3rUUkw@mail.gmail.com>
 <35819233-07ba-4e00-8939-74b2f4454250@suse.com>
 <CAGeoDV_fN84JPxLJfE0uWujYfeb+7t5HnFhK-up1Oymk0VT2MQ@mail.gmail.com>
 <d237b414-eec7-4cf2-bf1c-0c12b0f9f364@suse.com>
 <a6798348-35e9-406e-b6ef-4f88b7da84ac@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <a6798348-35e9-406e-b6ef-4f88b7da84ac@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449D:EE_|SN7PR12MB7299:EE_
X-MS-Office365-Filtering-Correlation-Id: 58f05c4a-f9fb-46a7-1946-08de586fd415
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RmlNKys4T3ZTdEhiVW9WZ082UndzTnhuRVE4MitPbWFxSEZXdVQ3Zkx6SjJ3?=
 =?utf-8?B?ekJ4RnpHVVVRdDYxMktSeTF5WEd5aTBFRERGKzNLZVgvckFOc0UzK0pzckdW?=
 =?utf-8?B?T0ZGb052R2Mya0doTE1VL0gybE44RWhScTJLU0M3ZEpNT0dBeWJyQUtoYWh1?=
 =?utf-8?B?bTVDSW03a3h6cWNDQ0pNK0p1M1p6VGQzcnVwYWhRN1pvVVhoZEUxT3hod056?=
 =?utf-8?B?TFlDQ1c2Y0pQU3VibHZIYThHVzMwaVlPbS80WU5xM1dHQjlCZ2RxS3FsVHF4?=
 =?utf-8?B?Q3VCb3huZkwzMzFCTnoyL0dUQVhtZnNBV0RrQ295UHdEZmNiZW5MTzVmZTVP?=
 =?utf-8?B?dVFqeFNjZFlLMjN4cHB3d3RVMkdsVXZydkx0LzRJVnZic1Znb0hKeCtZc1oz?=
 =?utf-8?B?VCtRZkNIaHVqYW4zbnFseGNiS3RPdHpFZXpQaVgweGhEZDhKdk51VzZTVC9r?=
 =?utf-8?B?V0cwenJoVnpITzJSOVN1TUUxV2t4cFFVRnU4bW9UVGxRZmxlOFhHaWVsaVBr?=
 =?utf-8?B?L0M4SDlZRS9OdmxIOVY5VnJxb00rdXB2UGFJTWpaNUhCaE56N0w2eFp1VmJl?=
 =?utf-8?B?bkRmNTVEM3lRd3kxVXRuWVg1S25zWk1DUU45ajFBREF4eURmWUJmVG92UXU1?=
 =?utf-8?B?SlE3OGVqTUQwcElnenR3Vy84OTc3WkdVY1gyOHhHbXVQdHh5TGNOaFN4U0J4?=
 =?utf-8?B?VkEzWW02ZnliQ0p5ako4dmx6dUppYzRYV2NzcmdCVzVtNlRUT01xUEM0aDBq?=
 =?utf-8?B?RWdhTVBUYTJsRUtqT1N1RzdHVFJMdDh1SEZOWEJPQk9QZ3U5U3YrbVdKVnJS?=
 =?utf-8?B?Lzc3a0VxS3NqTWFqcmdDOWhYZHpiZGxQaW1hc0RIMU9sSHV3MWFpZGgzL0or?=
 =?utf-8?B?S1F3SzFvTUc4d2Q2cHltaG5jS3cyZzRCTTJnS3ZVUlpON2k4b3BESnVseE1N?=
 =?utf-8?B?Wmd0ZENSSzFkdWY2cldwczlzczlBZWg5Zi9adVRwRjR4ZXJrOVhwcUVyUXZK?=
 =?utf-8?B?cUFUL0VvTWxiT2dwQTJlbExVK2djbm9OaFoxNFBYUFdKM3lPTDdOVWo5UGx4?=
 =?utf-8?B?dFNDQ0VIVmd5MEFqSkxURUx2SFRsbUdkUzNjeTJrNHRqMUJRU3FZMFYyZnZ6?=
 =?utf-8?B?UW9mZzh5SElUZVdHQWllbnJmV0gxK0tOSEJjMUlOZHFJZmkwSzdPcUhBZ0kv?=
 =?utf-8?B?Rmt4UmxxVFlZanFkaEZqR0dpT2hIUGNabzRla3dFdk1tMHE1YjFTT0FMU1Mw?=
 =?utf-8?B?NFlGRytLMU1iQStkZ3BDOVFEQ1VHbXlKcUNCN1UwNHV0bG1WWnd6VWI4bzY5?=
 =?utf-8?B?MitEOWJlTldjS09YZjZVNENBVVBWbmJEa3psL0NaazcycVcyOGZjcnhydXVE?=
 =?utf-8?B?dDZURHpwdzZBWUVDQUdZdFpuTHEvQ2pDYXp1RE5XMVk3VWVXT3VtSzNBRFkw?=
 =?utf-8?B?K0lPKytUL3JSdklaMDVVMXNVYk5TR0I3ZzdNdGhtSWszejRzekdwVW42ZEZG?=
 =?utf-8?B?MlIwQ2s0RldtUjlxVDA0M3RrY1VCd0xtbDRhV08yQ1F1eFBCTFNQSXlCVVUr?=
 =?utf-8?B?TVNscWhHUmNncFl6V0ZvVEJxaGVONGdQQno4WmNxTWJNcFNmTC8vVWs5aWgv?=
 =?utf-8?B?cVdZV2F2Q09MT1FxUXhxRmJEZU9jVlZIdGR6M3M1ZTdnSWtleWNyMDBSSlFW?=
 =?utf-8?B?U1UzNFZhNXp6RkJ4L1lSSnp3MmxzeEltakV5U0crMTZUYU1rbTNIL1Y4NEtL?=
 =?utf-8?B?clh5RitiWHBRRHc3TW5oMERKdGpDQ1BQQW82L0xjNFA5Yk0vWHd0U1lyS2Ew?=
 =?utf-8?B?dW5vOVM5RGducXBtdjhyUjF4dk1xV25TcGE0VmdLdHhZZmpNZjZaVmpEYkdy?=
 =?utf-8?B?cHpaQ1NlYmRwMTV3N1c0d1NvN2VYb3ZieHNUNTc1SFRLR2Z2MTlLamNodU9E?=
 =?utf-8?B?Y0d5amRkMGVMM1hPQ1BoNTl0QzRZdTNUbGR5dFlFUzJCdS9UY0ZzcHdIY2NY?=
 =?utf-8?B?WGJRbXJSTzU4MURjWE5LOEFUcHZlbWpDOCtmN2FNVzBBRzVUdjY5cEFIOURT?=
 =?utf-8?B?ZWZMcWVrL1ZzQSs4ZXZaVEV1Vm1URHBCVC95cE5KRGtVTkovc24yVWp5RXNa?=
 =?utf-8?B?bUxDWWlnQ09wS1JtSzBHQ2VvRTZTbUdtSnRkc3ZzK005RHNrZXYzRk0xaXZo?=
 =?utf-8?B?WHBWSEtBOEt2dnBOYmRBNnVmb0grVTRHVmgwdnNJSmNmNThqeFhCRktZbTBw?=
 =?utf-8?Q?phRWY2xsQGeZzjB9pFV0ZYEr4Df7s8t1OjtluAvpVA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 22:04:05.5542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58f05c4a-f9fb-46a7-1946-08de586fd415
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7299
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_TO(0.00)[suse.com,gmail.com];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email]
X-Rspamd-Queue-Id: 5D90D4CB35
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-01-15 11:57, Jan Beulich wrote:
> On 15.01.2026 16:33, Jan Beulich wrote:
>> On 14.01.2026 07:00, Mykola Kvach wrote:
>>> On Mon, Dec 15, 2025 at 1:27 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 15.12.2025 12:00, Mykola Kvach wrote:
>>>>> On Thu, Dec 11, 2025 at 6:40 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>>>> On 11.12.2025 17:30, Mykola Kvach wrote:
>>>>>>> I have now attached the corresponding build log.
>>>>>>
>>>>>> Okay, so indeed not a table size change issue here. Then I fear some instrumenting
>>>>>> will be needed to at least know what exactly is going wrong. Alternatively you could
>>>>>> arrange for the intermediate binaries to not be deleted, and make them available
>>>>>> somehow / somewhere for me to see whether by inspection I can gain some clue.
>>>>>
>>>>> I prepared a small patch to keep the intermediate artifacts instead of
>>>>> deleting them.
>>>>>
>>>>> It removes two cleanup commands:
>>>>>      xen/arch/arm/Makefile: drops rm -f $(@D)/.$(@F).[0-9]* (keeps
>>>>> .xen-syms.* intermediates)
>>>>
>>>> This alone should be sufficient.
>>>
>>> Understood. I have rerun the build with the cleanup line removed
>>> so the intermediate .xen-syms.* files are kept.
>>>
>>> The build artifacts are available here:
>>> https://gitlab.com/xen-project/people/mykola_kvach/xen/-/jobs/12707528457/artifacts/browse/xen/
>>
>> Apart from the intermediate files there's a file named xen there, but xen-syms
>> is missing. I'll see what I can do without that.
> 
> Actually, can you give the patch below a try? That would explain the 24-byte
> difference (albeit I'm struggling with some other aspects of a proper
> explanation).

I had qemu-smoke-dom0less-arm32-gcc-debug-staticmem fail in CI with:
test_symbols: non-zero offset (0x48c) unexpected

https://gitlab.com/xen-project/people/jandryuk-amd/xen/-/jobs/12787541697

With your patch added on top, it passed:
https://gitlab.com/xen-project/people/jandryuk-amd/xen/-/jobs/12788189122

Tested-by: Jason Andryuk <jason.andryuk@amd.com>

The branch includes --gc-sections and associated changes, fwiw.

Thanks,
Jason

> 
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -87,13 +87,13 @@ endif
>   $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
>   	$(objtree)/tools/symbols $(all_symbols) --empty > $(dot-target).0.S
>   	$(MAKE) $(build)=$(@D) $(dot-target).0.o
> -	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
> +	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
>   	      $(dot-target).0.o -o $(dot-target).0
>   	$(NM) -pa --format=sysv $(dot-target).0 \
>   		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>   		> $(dot-target).1.S
>   	$(MAKE) $(build)=$(@D) $(dot-target).1.o
> -	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
> +	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
>   	    $(dot-target).1.o -o $(dot-target).1
>   	$(NM) -pa --format=sysv $(dot-target).1 \
>   		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
> 


