Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eP2wJFYcjmmG/gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 19:30:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CE913041B
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 19:30:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229772.1535575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqbS9-0005QI-2I; Thu, 12 Feb 2026 18:30:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229772.1535575; Thu, 12 Feb 2026 18:30:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqbS8-0005NY-V1; Thu, 12 Feb 2026 18:30:12 +0000
Received: by outflank-mailman (input) for mailman id 1229772;
 Thu, 12 Feb 2026 18:30:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zRx/=AQ=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vqbS7-0005NL-G9
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 18:30:11 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da664158-0840-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Feb 2026 19:30:07 +0100 (CET)
Received: from BN1PR10CA0010.namprd10.prod.outlook.com (2603:10b6:408:e0::15)
 by DS7PR12MB6093.namprd12.prod.outlook.com (2603:10b6:8:9e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 18:29:58 +0000
Received: from BN2PEPF000044A2.namprd02.prod.outlook.com
 (2603:10b6:408:e0:cafe::37) by BN1PR10CA0010.outlook.office365.com
 (2603:10b6:408:e0::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.12 via Frontend Transport; Thu,
 12 Feb 2026 18:29:55 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044A2.mail.protection.outlook.com (10.167.243.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 18:29:58 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 12 Feb
 2026 12:29:56 -0600
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
X-Inumbo-ID: da664158-0840-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o3Dlbk2k5lnegglSS8YAykS+fBTxIO+UPtp5k06GscSVx9DtTJtolbvL/ZN/O4DViFE8nLQTZJXGFrRDvmPhs9RIV2xN+HsLkfnaruxH0Fgj+NOaPpRqZDl6S+7pUIn+uEk+XbEFl9MC3ALHiPxxs5XYQwWaYxk4fvuiZ4dEeeI9eKpebzByUskTYV03nX/j1GLuBycK7rq67qxXJ7kybCecCebDXUke+bLLtvgNHyGKRhTjP7a9Fb+my0Ka0bNPFJR6QKKuOwVOtUCpxyT2D4c4+4TtEIzXsFLbKKXZb6LcsMnA6wjTq+spoEX7FlBcGMemJm0mpqVFgMPtfPgCDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YNKkKIyYpWFFC41c+bUZedvXnny+kAmHMsF6G5Ou5rw=;
 b=GNHWE9ZGVTZ3Mhm7N/NXEJLl4F/U6yAHQhcD8W1nIKWsbyQRw0bToCdOt/h4gJ5fdzjIuRSOEosHST1Meto41tmW9S4nlYsDdx2aSGlp3aFRRHnx/f2M/NjUxwvTM6DQ5cb8AYCSd6LM4CHp8v8T8x7gDvubsmjCGEx+8i28dqjjqEqzIHazyXMwa83RmqIHSHLF8B0L7mMXn+iFA5P+4N87ThKB6+gmf8IuogATIXfcj8GO1thLUbmTh8O55Ds5dTzdzPocDnXZsNti95GcEITjDh6MfQ3ZCexHifp5c10ccP8MZorLwEU5Me51ZijwOzDIcMKy4r3qJ4Pttrc5VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNKkKIyYpWFFC41c+bUZedvXnny+kAmHMsF6G5Ou5rw=;
 b=Q34b2QT0IIhSavnyaNTEEC9/ATWr85mrutItvBwIDGkJf5Kly1woD5CJV35NN72FNNRJNdmZVQxEZFj6HdeQa3TqgmrKtPQyaENIc0OzXQfejU+o4WvICKFFUBk2JfO5fFt6+1MrtXRlt85VcQPsLTlG0zh4zE6rTUF42YDnBn4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 12 Feb 2026 19:29:55 +0100
Message-ID: <DGD73M12VYML.SNZI1JQAXHAQ@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Xen-devel
	<xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH v9] common: honor CONFIG_CC_SPLIT_SECTIONS also for
 assembly functions
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <a11e692c-2bfe-440d-915b-818b133874c2@suse.com>
 <bd656991-59bf-4435-b6e2-554b9ef4725e@amd.com>
In-Reply-To: <bd656991-59bf-4435-b6e2-554b9ef4725e@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A2:EE_|DS7PR12MB6093:EE_
X-MS-Office365-Filtering-Correlation-Id: 20f572ce-c7e7-44f7-df3e-08de6a64ba14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dkRFeHZxdFg1bXlHN1ovMXVqNHpVWjl6RUlja2lxVWpiUFNQMHhXWkZaYUN6?=
 =?utf-8?B?UTZnK1B4amVSWDh4RzE5Wk1INC9vK3F1ZGJKN29SWU5GT2lFaGRxb0IrOE9n?=
 =?utf-8?B?eERBdnNicUdEbnlmZHlDVVU2U1BDWTJUeXprTFZEcEN3SHhrczVPTWZEbmFO?=
 =?utf-8?B?ZDIrbzFubC96Z28vQTVUVmdWWlRzRURGenZSNWZsREZEZ1NiNkgvTUg2YzJE?=
 =?utf-8?B?aWJLK3VSaUhCN3k1NWdFcGlvaXBZRjdkdWVIdEJNNUhUdDdaTUlaeElZeTZY?=
 =?utf-8?B?WnBZV2U3Z3AxVnoydzBrUzltT2VrOUwrbUVNWVI0bkpNaS9MVUQ4V3dGNy90?=
 =?utf-8?B?cXBkQWhSTW9MbldrQ1BuUzh0QkFVVFQ2cjY0RlZMbG93WTdMeExYRUFreWt2?=
 =?utf-8?B?S0RQMVFKdDhKUFBKS0d1SkttQmZEODQ3bGpubkxOUlhITHltMkFqaXpHZmhV?=
 =?utf-8?B?NjJ1bXh0V1J1b3BJRUsyQ1Fxa0VqQ3ROWXQ2TjFXRGswMHVtYVRrb08zQVp1?=
 =?utf-8?B?YzJDOE51UExsbHRDY1ZOZzJ2aXFucE1mWXl0eWdsc3dGQmZkMkIxTFlaQlRW?=
 =?utf-8?B?aUNHdFVqSUpQMGpEU1dSQlZranJhMklSYXc3SFRVTjJqc3JMS0tWc3RTTkVq?=
 =?utf-8?B?S1oxd2w3ZmxmSUxxak5VWldFL01IZkoyTlBOWmxISDN1QTMwdzEzeDhCdUJE?=
 =?utf-8?B?SjZPVHIwb0dsMzJTdkE1R1grcU9JaEcrOENFWEZndDBDZmVuSWMvOThzYUZh?=
 =?utf-8?B?YmtOQTNjd2tWSlVaOExOeEkwZUpqc0tNMzg1OGMxTGdQSlZVVXBTZzR4T3d3?=
 =?utf-8?B?cVY2S2ZqR28rMjBZanV5dDljZVVRUmZNME1YS0x3MUVlanp5UUxRQlk3SEtj?=
 =?utf-8?B?RnpGL0EySFBBRkxsblZZZXZBMDRlcFhZa1Q3TnRjR3E1dVl5RXhpb2pMaHFE?=
 =?utf-8?B?WXFqMjcxWGxVWU1DbWhBK1AwNW15QmY3aG9iU2tQa2NCWllpNFJwemJyd2Q5?=
 =?utf-8?B?Q3A0K1owbDcwOU4yMmFzMGwwTWYvS1prdjFKNmk0UEJFMDhxTHNnZjFHVHpQ?=
 =?utf-8?B?RnlDN0l4NER0K01qTENMa0gzUlErTEpPejVZU0NmTXhOc0dZTFFrRldDVWdP?=
 =?utf-8?B?bGFHd2w3RnFhUWhkc25sVUtsVnQxWXJNQUxiTnREZFY1RVhXOUkyc21ZeXZy?=
 =?utf-8?B?UVRsait3VURrbXVvS1JnV3YwQXNlcjdaNWFBcXNrWk4rdWR5c2xTZWIzeVB1?=
 =?utf-8?B?RHd6Rko5YXZtQmJvdGpBb2g5MkUxdWxEbWFYUmVRbU81SFhSZkdiNkJTM2F5?=
 =?utf-8?B?cTRKM2h2bGFQeHdHVFJ1TUxNakFOWEgxZUZScjhXQWVMZGYvRjZITDNodjRi?=
 =?utf-8?B?MUNUL3pCTFQwSk02RWRRSzFyVDAraUVJZXZ4cGVSV2djbWNKbHdLYnh5RFp5?=
 =?utf-8?B?ekpPUXVoa1pucXhBZUNvUktsM01sZ0YwOURsSGtuUjhjUlpPeXBGYi9Iamw4?=
 =?utf-8?B?TklZUkNoVjM0NVV6c2ZpOEwxSGc2TzZmTXpUTVBXSTBhdmVPSEx2VUlFTkk5?=
 =?utf-8?B?TTJROE5SMWJ2b05BRUs2OG92WkM1L1h5ZWpjRThKTGEvRTBpb0NqQ1p4TGxQ?=
 =?utf-8?B?bjVLeWkvdUFvSTUxRTFmcmFNSmh6NmNrYUE3UnpaUm9RZXdxaGpYWDUvRnF0?=
 =?utf-8?B?NHh3SG9ZVjVjd3BrRE83NVNwcHl2UndNVWw5U3FJZ3EwVURPNjE2K29DTmdF?=
 =?utf-8?B?MFpuaEtBcEE3M1ZsbkpQSzFzRnhkSEZBZXlyWGVuckJTYjdMK0Zua2VsYUFU?=
 =?utf-8?B?UkN4WVNJbEltUFRJTFBVYkJ5ZkVDOHFhdFlpcE9uVDFBNUpvcHdrdnhyVm9V?=
 =?utf-8?B?dm94NUttUnl1SWtiZUdieFVzcmRic2dPRCsrWTh3YWx6MGQzd0Y5UkJDSG5S?=
 =?utf-8?B?SWQxdHlLUHFidWhKU0pFMzIwSzN0aER3QVVBV0FiL2NUdFl3L1lwODhOa2l1?=
 =?utf-8?B?bGphQ2N2WUtEU0VOdDFZT3ArMElCOVdudGNJckVoS01nOGhKaWFDeW9rTGxk?=
 =?utf-8?B?SFBXTlZORXVtR2xnU25HbFd1aTU1NlV1aDNRcmJ6TWxqbHQ2Wk9pdkFxSDkx?=
 =?utf-8?B?ZG9uWDRSNkNoVXFUNTU3a2xoUTc4eXdBWWlhK3h3SHo5QjJuS0VmbW93clNG?=
 =?utf-8?B?Zk01RklKVVc1a28wbTd2dUFhamlGOWNwd1VPYzgybFBVdmFUUGwweXRnajFT?=
 =?utf-8?B?ZGpaNXNTdmxtNXNZZzFoRjdjK1VRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wZ0l0eQELZE2fpdmk9X8juLMTeA8semYcwsSCfyDu8rzQU0RqZCyHvvSikK1XdA8U0X0MIF4zHguAaAIQy26KN6U2/F9KStHHkOo3H//bsgNXGSyHGnrrtu5gabJnhMkZPFFLLJu2L5KfgLZsJeQ+nB5BEZXx9EHa70CktVLr77sY/C4JSJpX6tF9j3hDH8Un/PbZKXTjSNmGuvX3Qt5NUjO9AkI2W6TvNwH13r3a8xgqVnR7cAxYkz6FwPiN9rmHYvYKdGDwYsuUf0Zg4QRIlU6ESLKB4YZEzyPe13Wh79w5etIshFGpR94+yXB/AmO9TAwCazIbX7NzHdS10N+Zc7qZVAkNiNbX4zALXoo0vlKYbgL3vvZm0qZnWxbKjpUOq6c6VNs3mOneBd4KBsBwpibTs2tIejaLPwdJ7vTsJznBc0db8YugeehQcKK4Y/h
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 18:29:58.3965
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20f572ce-c7e7-44f7-df3e-08de6a64ba14
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6093
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:bertrand.marquis@arm.com,m:volodymyr_babchuk@epam.com,m:oleksii.kurochko@gmail.com,m:xen-devel-bounces@lists.xenproject.org,m:jason.andryuk@amd.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,xen.org,kernel.org,vates.tech,amd.com,arm.com,epam.com,gmail.com,lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D2CE913041B
X-Rspamd-Action: no action

On Wed Jan 28, 2026 at 3:35 PM CET, Jason Andryuk wrote:
> On 2025-04-01 06:58, Jan Beulich wrote:
>> Leverage the new infrastructure in xen/linkage.h to also switch to per-
>> function sections (when configured), deriving the specific name from the
>> "base" section in use at the time FUNC() is invoked.
>>=20
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Tested-by: Luca Fancellu <luca.fancellu@arm.com> # arm

I don't seem to have the original patch in my inbox, so I'll just answer he=
re.

About the assembly modifications on the exception entry points:

With split sections the linker is free to reorder all of them as it sees fi=
t,
which probably means we want int3 after every jump to prevent straight-line
speculation from allocating an XSA number for us. It's possible the linker =
might
inject them, but it might also not. Better to err on the side of caution.

Though more generally, I'd just keep all exception entry points in the same
section. They'd never get GC'ed anyway and we're paying an extra branch in =
the
#PF path for no reason.

Cheers,
Alejandro

