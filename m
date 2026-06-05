Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wtc2F1p7ImrUYAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 09:31:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB162645FF4
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 09:31:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=F0v+Isvy;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1329062.1593265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVP1S-0003rM-G4; Fri, 05 Jun 2026 07:31:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329062.1593265; Fri, 05 Jun 2026 07:31:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVP1S-0003oY-DO; Fri, 05 Jun 2026 07:31:18 +0000
Received: by outflank-mailman (input) for mailman id 1329062;
 Fri, 05 Jun 2026 07:31:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wVP1R-0003oS-Ig
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 07:31:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVP1Q-003ny5-OR
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 09:31:16 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a227b3f-bab6-0a2a0a5309dd-0a2a4505a170-8
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 09:31:16 +0200
Received: from [52.101.56.51]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a227b43-aaa8-0a2a45050019-34653833187b-4
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 09:31:16 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DM4PR03MB6062.namprd03.prod.outlook.com (2603:10b6:5:391::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Fri, 5 Jun 2026
 07:31:12 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 07:31:12 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NdzIDlsEJ8Q411c6Si2Gh9lzKbaiV7glEZuMhg7l9VV2I23VSVEj+9cwhpk8eqiO2gNY14zXww3sPtc7y1/YRFErDs2q5Kj766yqNLs8Uf4jWpWkQPpNRfT74D3vXeIhSJl1NUXkig7xSFTEmVZU+d9XW5LRGABIxU55XHrdjD8LO1Y+q5P2ZtwFoZfSk+7nj0osOxC6tc5TtRbSgir4HBiA06EOv1GUevXch6Lphz5sEPF57SSF8rbr506Df9ZdiSOC1Djr6b7bKetDTRSybnRrZJoR1jC43qq9z67v2K2Gwis4n7/q9e0MxwzfDn6eMkUX1gqo76ueXF/roGJWvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vEWMervWil5/lmsySHiCXcMsh/pGu6g4ybWWQMz97ws=;
 b=oOgMGN2z7HQBiECfE1eU/3HaygsXcz9HcODZyg7rhuGNhLMyBA2Nbxnv3AhZV4K4Oxr6vMtdFNT8xhHDl4n1/MR0zh7cduofm7EU3YchByCKkjYVbCOcJ+7Zdx5ETcyKyABtnd4x9wczaPbJYK9yO+04FSBV8DcJtlw9cMjGHG/xOrkalHSWWcGsz1aCtR+834odLSoMW6I8XFNML+YcpBohvblqj5PN8su5Eprwr8hy4dxgC7ByQcoG4VTk0LmqCRHJ5Ni/Azqxj5P4D5V/ZWaep/Qejwd6ZRWFyAZyEzPikAM4AuZITDdKdD/VzEAHeI3O4MwPeppDKzy3/H0lIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vEWMervWil5/lmsySHiCXcMsh/pGu6g4ybWWQMz97ws=;
 b=F0v+IsvyPfCbX3FKkUvzoduVEy7R1tKIOsaqObY7YMT0yl6ZYPL1yUqWIeYyno7tcTPYNwgzXOAoe6yqFXCLEGTybKlNeOTeeWDytuGxssyMcZ3lCo+M5Mq463AQ4w3uEuhc+aKgdi6yDr8HrPMXmBqKVDd3ebO38GVSarbDxHQ=
Date: Fri, 5 Jun 2026 09:31:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v2 1/3] xen/x86: Remove unneeded stub_page setting
Message-ID: <aiJ7Pe7o7t47rxqR@macbook.local>
References: <20260604231837.804560-1-jason.andryuk@amd.com>
 <20260604231837.804560-2-jason.andryuk@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260604231837.804560-2-jason.andryuk@amd.com>
X-ClientProxiedBy: MA3P292CA0067.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::8) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DM4PR03MB6062:EE_
X-MS-Office365-Filtering-Correlation-Id: cf958d12-0259-4728-8d3e-08dec2d46b71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	z0TljaFdCV9l8HM2GzVUC+S3wt3Fz052D1CiFtaku7IEhX2zl11F7OTOtMXHPKfVA7l8g1bQT+4pYt6rF6dPOgurEr5oLTHGOLXO0oSfuOU5eAhQKfElI4OJylNYozNvIp9DIGU6fOhtDRTtUmXBYi1VQl9nK1SZqYoDgLKeCA3BJQOalPw5G45LO3wfTFP/ixQ4xnKl51MtJGuULN0I8HQ+bfHNPoRU2cG3ZMGuTlL5q5G4cmPi5Ojug7DbkI14UdStZwHyj4Ncwjo6xQ80+CNc/bTE1f7qrtUf0dPIySeK2BXYQf4FPU7Ya8xc2qTv7tQag51bJvwvXANFuQQGZxQmdoR69us0n8litX0gFwgTkRRLaWrb7J3F9tGZ6nXjBDRKQsesNCdw26in2wrKBctUf/NxdzvVNSpXiRFUePeroQGfucGmKRPJ3gb+li6n5GmVDodSAtbx9o1dfg2wrmwuSQQBwzD2g4QqXEvH8ilvHAn8FM0dAiWf+eazlgMc6IZ3i3oLPVXkB9KRInWRp+sBKw3w+N8+8UgELyuSihUFhewQgLp/O3aHaSpI4qvk7Osho0oWv1ra+T4jmwVZTxu6pc+VQfGcF82sZVVR1Z/vwVr5v8TPO3r87ncd+/wFEvl7cvYbYTc4r8FPRb0b6HuRb47lULB+iV4w0FTl89W0EBmDXEEXw4HVZSWQxi2l
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yk96RExMUXQ1akhESUJ1QlN3RGNGOTExY3RaK0tPbWVRaDhzUWJ5Yk5CUXVq?=
 =?utf-8?B?RkRPUE5CUnZaR1hpdmM2ZVRFQTZ3Tk5RRWRoNGRaYURMcCtnRzdra2c5SCtT?=
 =?utf-8?B?OWJBTElOeEtoZWh6VFZSNlB5dFJ5ZzRaWnFEZW9FWWVia1JWK0dXblJMRkp4?=
 =?utf-8?B?SS9KWGxwQUs0QlVDeHhvc2hwdjVTSDN3QnYwaUdOZEd2OEh6eTF4OTBiczdD?=
 =?utf-8?B?NFk1M2VqcjFmTWFyR3Z2U05xUVdxQWllZFZjWFVJOXBFaGMvekk5ZndmYWI4?=
 =?utf-8?B?RFVQK1dUTjJVZVRPVWM3bExGQmNsQlErbWxjMGV6MnZRcHkrS0RlSkdTVlcr?=
 =?utf-8?B?N29odGZka0tFWXQ4aUFrNFk3VFlmbkRSOHFoTURmRG11SHNmMkhDU0hZOS9w?=
 =?utf-8?B?SnY2cTRaZXA0dmcyTHF1YW03NGdSQ3dYa1hTRUFZUjVhU3BCNkZiVjlGUnc5?=
 =?utf-8?B?ZURFNUwyV1VKTGtPcTJ6OTU2RitKSkJBMEJMQ0RTazZCV0R3S1Zxa3dzZW85?=
 =?utf-8?B?TFNhU2lMODg2Z0oyZy9NT0FXelJyQ2N2dEZZVFJTZGNzQUpJd2RHR0N6SGNt?=
 =?utf-8?B?anRzWmZ1bzRta2NpcmNCUWZXRlMwUDlsTUtvY0lMWGpLM2Z6bXM0eldHakFI?=
 =?utf-8?B?S0VmUzJtYkFlNUlLMmZpU2JLZnJzYXNXcXNPZkZIK3FaRFhaMUhYZi9ZdEZT?=
 =?utf-8?B?U3V6QjBOemZDMjVGSjVYb2h0UTJFd2pTODFvcjZKTysxcEZsNitjd0RnU0xj?=
 =?utf-8?B?dGVxMWhBeWNFMDRYKzFjMEtWV1k1Y2hHWTNHcmZGK3R5YlpudTdFSVRXM3FE?=
 =?utf-8?B?UEtaQ0o2N3AvWjlKa0dmaUV5b053UGpsY2c0MVQ4K05HZjRFWWVtZzhxVHRH?=
 =?utf-8?B?YzM5ZmFtNE5Vd2JpZ3VxUEg2cGp3VjBzWVEwU3h1YURvckx5bFV3cUJCUEV0?=
 =?utf-8?B?L1dJZDFxNS9GR2xsOHB4dm5QdW0vcUxQVktwYW85TmMrUFN2M2ZjRzhaQ0w5?=
 =?utf-8?B?RHdCT3B2dTl3dFZsN1pDSWw0NDVwUGQzN092b3RzcnJwODVMbVlYZXpuRkY3?=
 =?utf-8?B?d1lETGtsbDkzZ2lIVmJpcGRqRDVXelBraS9aZXF4Z2dnemFCcmI5a0dqVzda?=
 =?utf-8?B?aUZFRVNYcjRHK0VPYzZxWXZuUkd3c3RHdlAxcnhuMWVOT21MNmp2TG9SMGZB?=
 =?utf-8?B?bE9lSXZFNjVFQ0dqWFdxeFFXYUJDUGlUdUZ0a2VmVTc2T3I3MzhxZmNEMEtN?=
 =?utf-8?B?Rk5yUFlWUjlCUkVGZWVBVHg5aFk1dnFTalQ5dXA3WUQ5YXdjZFFvQ01QcnNy?=
 =?utf-8?B?M0pBMlk0R25CRklOUFkzU0w5dVB2NDQyRDJOUWdHcHdDVVJJQlNjaVF3Tmp5?=
 =?utf-8?B?dEhMa1QzS0E1RWxIaWFJMXNaME9PbUZuKzB3UHN3ZlpzbW5YTExWU0FJWENN?=
 =?utf-8?B?UGdJRHFvUFkyTzBTY2M3QW9sQ09oajlJeDBtRkV1L2hrY2RobFFlVHorZU9J?=
 =?utf-8?B?aVhkSEV5OVhjT0xoUVNxZ0FjUTE4VEpabUZKMVI1S01GRUVYenorQUxOdkZX?=
 =?utf-8?B?eFRGSHFNM1VTbDlMR3dwUTYvS1NiNUc2dE9NVGY4ZlFqVi9XTTJxNVA4aGNM?=
 =?utf-8?B?V0tLZU13bW9vZFBDUmZGUEl1akF4TjE3Tm9aclNaWHdJbURQTnV4bDdhczFR?=
 =?utf-8?B?NHNmRkRMT1Q4TXljdGVvUzNwNktNSXRBL3NRMGViYXZrc0tuYW5DcXpNZWM3?=
 =?utf-8?B?MjRSQUNDUmJXejZmSlJhdmZHTU1OcDNsMndhcm91dWpha1dpNUpSVytEM096?=
 =?utf-8?B?czgyWExqQlEyOEIwbHlWQ1M2bVZ6VU5VMlNIMVRVcVAwTEdsSVNKQkhVdjN2?=
 =?utf-8?B?cTh5cmtETUxFL09FS1JSMG9aTFF0bTVPSWpEN3pYU0VQd0g3SHBqWmFpaXRV?=
 =?utf-8?B?R3hpSkpkU2tTeFAxK1JGNkRuS3I0a0NMWUNWaTMzSi9FaCtyYnowVU1lb2Nr?=
 =?utf-8?B?azNmb092RWhYZnlvSU5aZms2KzNEZTI1K3ZZWVlSYzVTUW1hUEF1b3JZVkxu?=
 =?utf-8?B?aWRoOGVFd2JyNzJJNU53UVR2M3U5UFpmMjBLbG9Wb2Iza0xKMHRoU2hqNkNL?=
 =?utf-8?B?aTlPMjY1enRTSll4Q2Erc3greGJVZkxYejc4bVNyNis2TU9iaVZhdFVKVk9I?=
 =?utf-8?B?R1ZEMWtxeVB2c1VXWTNSNTZyc3BHTnMvRWdBZE5DMEZOVjBBTDA0SGFubCtK?=
 =?utf-8?B?WndBZ1FPNDlyaisxaGJQVDZoSGdaSDhtYzBaY0lTYVhSVmdHU2JLMWNJYndW?=
 =?utf-8?B?VzArUGRHUy9TNDRtYjVXYmU4NnEyWFY2aVhjQnI4Q3VoUURmeW1Hdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf958d12-0259-4728-8d3e-08dec2d46b71
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 07:31:12.5936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ueXPunXBMlk8r8S6rw6FUJAznsPs5icQI5i+96efeVI3RF3CM4uAwPPTIT0dxzL2odRbSYBNrCxT3A2k0wj1Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6062
X-purgate-ID: tlsNG-c201ff/1780644676-DA969443-EC329B36/0/0
X-purgate-type: clean
X-purgate-size: 395
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,macbook.local:mid,citrix.com:dkim,citrix.com:from_mime,citrix.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AB162645FF4

On Thu, Jun 04, 2026 at 07:18:35PM -0400, Jason Andryuk wrote:
> stub_page is not used in the for loop, and it unconditionally set below
> just outside the patch context with:
>     stub_page = alloc_stub_page(cpu, &per_cpu(stubs.mfn, cpu));
> 
> Remove it.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

