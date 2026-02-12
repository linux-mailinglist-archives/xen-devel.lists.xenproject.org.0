Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +F+aEjvyjWlw8wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 16:31:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7E612EF39
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 16:31:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229307.1535273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqYeY-00089S-Px; Thu, 12 Feb 2026 15:30:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229307.1535273; Thu, 12 Feb 2026 15:30:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqYeY-00086Z-MG; Thu, 12 Feb 2026 15:30:50 +0000
Received: by outflank-mailman (input) for mailman id 1229307;
 Thu, 12 Feb 2026 15:30:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zRx/=AQ=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vqYeW-00085h-OA
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 15:30:48 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd698df8-0827-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 16:30:47 +0100 (CET)
Received: from BN9PR03CA0148.namprd03.prod.outlook.com (2603:10b6:408:fe::33)
 by MN2PR12MB4094.namprd12.prod.outlook.com (2603:10b6:208:15f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.12; Thu, 12 Feb
 2026 15:30:44 +0000
Received: from BN3PEPF0000B076.namprd04.prod.outlook.com
 (2603:10b6:408:fe:cafe::17) by BN9PR03CA0148.outlook.office365.com
 (2603:10b6:408:fe::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Thu,
 12 Feb 2026 15:30:34 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B076.mail.protection.outlook.com (10.167.243.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 15:30:43 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 12 Feb
 2026 09:30:42 -0600
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
X-Inumbo-ID: cd698df8-0827-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IizX33aNwiYnphUScEe1gQw+aBVQS7jSrbAIW73Ni6ZTugtepGQ+GuBSjdcM4zCacs6etkT4/F5L/lgDedw9u+G7fpbxl0aCgQgV9pAVCCHzqgSmJMkwnndmvlAFrxNV/K8UudP++jcfHVk4ZVdSpbC21j5sqhKCAltHrdHqZ2p+9OWB5RYyMDhkS340YTtU1F6OMhvpkdYgW0elYGAbgP+fEabnxQOB/J5GrnTOgrmzT6IGlbA0Djm9oQqp/dTk2PFBzNjI6odyy1qrvxjOBq10T6ZPAXEfH4gN7jY1BHZ985KcwmnqdDAFUBwNP0AtoLvO9g38bXpaIAurjoRP0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6cDebRGkm34pd9mJO+KNI2LAX1ZOpM1ipc+be2TXkAg=;
 b=USx/+QD38o9C7scDj11frxeGRK7saLHpSsRcA+agMReSxIfIl3uW+PrJoyIG6xDday+/KT1YxiLUZn5YdVIqEaxBxQKC8rFP1gyIIA0L8YpzkriafI0PI5sEAUBK2OYm+dYqM9XqiWEcMCaCM/FIDd55iRhkR77+gKZ8dyl66szVTgP7DReOjfrn6l5h8Egr2glOUOnS86LxP4RAzjKF1o6ZJZnSixG/Gh1IX0PdDbERqV+3g9Ring64nkwUzTduI85P4viWEcwzItUox74YXbOfgX+pOxB9xnLVlEo7OZpHPhtjBjeAZdCoWjYvp1r72mOrfRWkwbfQszrNYBRlIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6cDebRGkm34pd9mJO+KNI2LAX1ZOpM1ipc+be2TXkAg=;
 b=pvV7PJvVEg68out2JBIoPfbLdS649nDYhCHTAUQPW1zskCYtRlGecblwjatTuP1QdgYAEgZj5QbGCBsiEowjHwr8UpLjhi0mqD+LtelHK9KITacUXacMh7mL/xYnr/j5iZ2Z6qHcFbVcTCTak1vUu/AD13dMAb95JPXIDmsBFkw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 12 Feb 2026 16:30:41 +0100
Message-ID: <DGD3ADTLUYLG.21O7BF43L408X@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 07/12] x86: Migrate x86_emulate/ to use cpu_vendor()
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
X-Mailer: aerc 0.20.1
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
 <20260206161539.209922-9-alejandro.garciavallejo@amd.com>
 <f2abd192-27c7-4011-95a3-848e1c4e1427@suse.com>
In-Reply-To: <f2abd192-27c7-4011-95a3-848e1c4e1427@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B076:EE_|MN2PR12MB4094:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c35425b-8fb3-4089-0eec-08de6a4bafea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OStVODJlaG9YbENqcVFDSk1wVkxmNlM0UUdmVjlTVFFKYWx1dVZVMFViZG12?=
 =?utf-8?B?N2RRakt4bVN3ZHZxMWpDWDRVMWpCVTk0M3FXZlJKZmdHYkhpY3RLOG5MYmNY?=
 =?utf-8?B?NTVZZDUzeFE5T1BXVW9vTGpTVXRTZGc2Q1dkNGpQMzVQejBsUFNOSlYwbTV4?=
 =?utf-8?B?R250dEJ0NDVtbjU3M09GalJOalBYUzl0VEo5V2MzKzNqck02VVVtT0kwalJy?=
 =?utf-8?B?Y0UxOTkyOGRpNE9MS2owcTFCNFRwUmJ1ZElXS0lrZVZiNlYvSFdBajFzb3BZ?=
 =?utf-8?B?R3VGZzdDZDg1SHlzekY4SzVwWUtkdkZzc3BVMzc3Yzh2ZUVrS05PTTBNalp0?=
 =?utf-8?B?RjAvVFh1UnRrQ0ROWXdKRzBsUG9jcVZ4bjlPK0RUQldDdWMyQlA5NE5kQlp3?=
 =?utf-8?B?MkdpNS9xUGRwQ2VNWDlUWmZlWEtEVmR2QzRtQTNVQ292dmtjTTJPM3IwQk14?=
 =?utf-8?B?ZkhaT09ydEJVdVBwUm81WXJhWEVBVXlDVVJDdEtlbndjWURKRzdTUHJSeTF1?=
 =?utf-8?B?Zmc4UklkR0wwN0Z6Vjg5OG5sMnZueEI1dDVTYWtSZEJWYVFuTzFlOXhDVUxT?=
 =?utf-8?B?QVVFMG1ZVW5Nd0x6VHU5bUJwbCtma01ybWthK2VlYVR5elNORHB1c0NxZWVG?=
 =?utf-8?B?akxFTEdLdGVWNUFpYmhuaGd2MlM1VE5PV3B4cytCeGl0NEc4QmIyZ2JJb0pM?=
 =?utf-8?B?RkVhMjRMQVFUQ1JvY2g4QjBwcEtIbVFJSGJiU2lwYjFtVjFHSlhjdHpadGU2?=
 =?utf-8?B?TDVYakN6VnRleFlBMGcyNHZiVnN0c29qN1JHQ3oxU1c5UDlmMGp1eHdGMHl4?=
 =?utf-8?B?SGNOa2dNeFAzejBFMU9XTGFFVmVmbHp6OTlSaVZkaWxkTFRLTE02cldSc2ow?=
 =?utf-8?B?R0YwUW5rczF1QzY3bGpFSVpUZjVSb2EwQkFwdlFtcGdGNHBYdkJSQy9vTlFX?=
 =?utf-8?B?ZFJwUGRpT2ZaMGZiN1hBQXVqeVBTNkVpSWVHVUlPRHhCREFvOW9QdmFMSXBu?=
 =?utf-8?B?Tlp6cVpFd2lZOTc4Q2lFdUFjVTJvUlNTa2d6eWNBZ1VsSlhyb2xIZjVmZSt4?=
 =?utf-8?B?cEs1QlJSamwrRThPYWp2R2Zzb1BPK1diRHRPUWY4akFlYWRHNVlGUEsvcklC?=
 =?utf-8?B?b1hRdXBWTTYrVkVRdWZqSVRhTHIwSHNudC9kaFQyUWw4UFpkZm56T3krMFYw?=
 =?utf-8?B?OGZCWjVRWnhnUjBCTVZxdFNRcC90Qy9kWmgzZXRyazVIcjlYRTVyeUZDYkZy?=
 =?utf-8?B?OFpSVkN5Mkl1ZG1lenBZTlhiUS9iVi9YTm1PL0dEaXNCUVd5a2FPb2E3S2dx?=
 =?utf-8?B?RzB0cEVkK2srYkhVVWJSczZBaUVwZy8xdHZiY0hPZXQwN2N3N2lXRUNsTDcy?=
 =?utf-8?B?dGNoQTdaNlZNWFg4U3g0U3VjemJRUG9JdVJQS1pnWFhlKzd6aGRzNU9PSnk1?=
 =?utf-8?B?OWFkTnlGSzNOKzRwbldLUEpOUi9SaXZMWjd5YVhZbldTYTYzNzRORDAwbVlU?=
 =?utf-8?B?Z1B5c3NYMWZDOVJqMmFYdHBYQjFGenVPSjJqMk5LWGVaMVNWVVRvaUk4RHFr?=
 =?utf-8?B?UXlMNnY2VkgzUXQxTkZPUnc5Q0FrRG4xWCtBd0JRVThVRUNWeFkvSmZQcEZj?=
 =?utf-8?B?ZW11L1pyTFZIZVo1OHVZMFFSa3lsb256elhPa05Nc1NCTy9neTN3Wm8yUm9R?=
 =?utf-8?B?ZEdueU1ZNVR2ZTdPYW96MDYycS9PUlRRU1FDckEybzVCUnFQclFENm5yYTR3?=
 =?utf-8?B?ajJrTWJBMXEvaXZ6aHJNb3kwZkJ3cExtQjRIYkYyeFZJZEs2dUVmblV6aUUx?=
 =?utf-8?B?RWw4V2pQMHIvTElFQnh0ZDNieG5XNmRyM0lVVkgzMTkxOVhiZE9oUFNYQWhY?=
 =?utf-8?B?eVdGeFEyZVZnSTFOSERlYWhUR0tjb2UxWkMvK0xQY1VybjRjbDF5amllY2JL?=
 =?utf-8?B?RmVobmJuUk4xRlNpaThSSWdpUUVJSDNaN0pMY1daTjVZdmF2NGZwbWd6cnZU?=
 =?utf-8?B?Z2J3Wmp1TUw4bzRlSkV1WXA1Q0Jxbkl1RW1MbGthSktkWGttNHZGMzd3U1dj?=
 =?utf-8?B?WUk2VjQ2Mm12Q0x0emw2cVV5M0JYc1ZNbEYzYlkxdHRVcTZCQ0xxdHNoZHk1?=
 =?utf-8?B?RUlQSjF4bnhxZ1dDYVpNd0hEYk1YNHg4ejFGcUl0UFVyYlJ4MHBKZExXK1Ey?=
 =?utf-8?B?eEd6LzN3VUtMRUdNUk5pcW1XOVl2QnRzakU1RTd4WUUxV3ZHcjZzaWVUTnMw?=
 =?utf-8?B?dHpCZ2hSL3JYVTZkZ1ZqWjVBZTNnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CQICf4Epo80p+5+lSWkI88QMX4W64pNCYHNVv+6qC+mcf/z7fOELVAyo2dqcprBSdjvenzQRj18MCo/MeOrfqASfe5oEkfXNNWz8hIaSjkx8FX8ZnsiSlofmFrvEtYJKaM5GwCEB5xovitBrXF9iy3qgCYDiGZeRKjgSYKQPgUllTH6Bc2hM7LyyZVzxlV9Nq/ftEKWceTddwlltM47v03N73Ac8/s0Svpz08lneYnMqrEctQj6A14I65oPWdlLZxarvQTgiXDgz09KVOBAh1GdOh1p6S5GPeqyXGmtS2jRZ2wKp24z2wNCRzz1XLLMKvR9tzyVE+hQt04bHT7F6sOR5n1flFVVPt5ZBfxqHFdOpPhtYzC9EemGpMzUMPyfB6J7ii3AXBtj1Yp6k2ivDG1T4tp7Qmtk4rwlISgvEpJV1xmyHJBYB8P1uw1cFwLgY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 15:30:43.7508
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c35425b-8fb3-4089-0eec-08de6a4bafea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B076.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4094
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: AC7E612EF39
X-Rspamd-Action: no action

On Thu Feb 12, 2026 at 12:31 PM CET, Jan Beulich wrote:
> On 06.02.2026 17:15, Alejandro Vallejo wrote:
>> ... but keep the current behaviour of using the policy vendor when
>> compiled for userspace, where cross-vendor configurations are expected.
>>=20
>> Not a functional change.
>>=20
>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>
> Hmm, ...
>
>> --- a/xen/arch/x86/x86_emulate/private.h
>> +++ b/xen/arch/x86/x86_emulate/private.h
>> @@ -15,6 +15,7 @@
>>  # include <xen/kernel.h>
>> =20
>>  # include <asm/cpu-user-regs.h>
>> +# include <asm/cpufeature.h>
>>  # include <asm/endbr.h>
>>  # include <asm/msr-index.h>
>>  # include <asm/stubs.h>
>> @@ -30,8 +31,11 @@ void BUG(void);
>>  #  define X86EMUL_NO_SIMD
>>  # endif
>> =20
>> +# define x86emul_cpu(cp) ({ (void)(cp); cpu_vendor(); })
>> +
>>  #else /* !__XEN__ */
>>  # include "x86-emulate.h"
>> +# define x86emul_cpu(cp) ((cp)->x86_vendor)
>>  #endif
>
> ... this looked familiar, yet different at the same time. It was only aft=
er
> some eyebrow raising that I noticed that patch 07/12 appears twice in the
> series, with different titles.
>
> Jan

Arg. Leftover patch in my patches folder. Please, ignore this patch, and
apologies.

Cheers,
Alejandro

