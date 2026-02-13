Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JsRAPpfj2nNQgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 18:31:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 361B2138A7F
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 18:31:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1231559.1536692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqx0b-0001L5-5h; Fri, 13 Feb 2026 17:31:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231559.1536692; Fri, 13 Feb 2026 17:31:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqx0b-0001JF-2e; Fri, 13 Feb 2026 17:31:13 +0000
Received: by outflank-mailman (input) for mailman id 1231559;
 Fri, 13 Feb 2026 17:31:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FeGe=AR=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vqx0Z-0001J9-5p
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 17:31:11 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6a4174a-0901-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 18:31:08 +0100 (CET)
Received: from SA9PR13CA0114.namprd13.prod.outlook.com (2603:10b6:806:24::29)
 by SN7PR12MB6840.namprd12.prod.outlook.com (2603:10b6:806:264::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Fri, 13 Feb
 2026 17:30:59 +0000
Received: from SN1PEPF00036F3E.namprd05.prod.outlook.com
 (2603:10b6:806:24:cafe::57) by SA9PR13CA0114.outlook.office365.com
 (2603:10b6:806:24::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.10 via Frontend Transport; Fri,
 13 Feb 2026 17:30:59 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00036F3E.mail.protection.outlook.com (10.167.248.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Fri, 13 Feb 2026 17:30:59 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 13 Feb
 2026 11:30:56 -0600
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
X-Inumbo-ID: c6a4174a-0901-11f1-b163-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v4fKCc8cozK55QAuFqQl8qbztIco7EPpcqOAQoLVf+xuB8/uMIEmJWX3HbS749gd9zidEWZhwEAtNXxBS2nrFJO71zKTH6yvGL+PHYlT0gGfwuMcIlIg3OIo1B47E3Qxkxi5FTFCS3l0r2HkHA5cbmhOuxFXZu3g5sOO8w65pQnm0Cn1WUE3EyQ3mawlSDuYfrHyVdTpLODOfZJFdtFrdbMM63+yB18wgEy9x3/Gi9TIKwaJOpmtNdiF0oQAhez5ndr5plxOYAgP+bHJvRDtcWnXJCexZ2W6/Xmdo364LGw6OUqhBEtaMz7oehb2DVlp8y3qfdC/PAorepXB1Q7S/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zFGddlSG29XHVq0MQAa6rwVRPRL9FkkQytGbC6TCt7g=;
 b=KTQu8wLScTQdAx+HwRTlytYOw/4mFBWmhyl9iZEaBTw49Lo4/vMeWIGKAukkH3vN6h1+qgDH7uvTpSv0ajUkJw1l0+p6EWZyqJkthXxl683zXcO6Y0HOwRe3Ds4bXrR0CcHdbweShKyWqKWfZdw8S4xi7zCw/MPHB7KCQWrZkB4dGELdTanjaxs9RU7XbcRkR8UP5YanAncdFCjrOJQzYsPmZnUxbDAn9MurW2ZjqfWZWWIdrJhd16ojnhQKVQY/NOZGJ/giLGi96fkIb5DXwYsSlqikSGF9Ie2c6PGrZyA9Ux3odMTh4egPBoopjRrra33Saqt9q4NDek55w6jRDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zFGddlSG29XHVq0MQAa6rwVRPRL9FkkQytGbC6TCt7g=;
 b=arfKDeI1lOTXrhsdN/C1tOty/wezeR4A9VJQVS1oRbbzkvpPHD6mRSq1CQaBL0TLFQsINTq5JKKulU61uwh1pZSDT4tqNZMCnlfwbLhSDYuzaU+OOZBDu8YJD7TBCP+ZiQXe109yUrXx6eClcrJCR6P63iKVFzUFezBQVSNRW2g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 13 Feb 2026 18:30:54 +0100
Message-ID: <DGE0GZ9SPVXI.13JZK2Q4WWG8@amd.com>
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/2] x86: Force HAP to be enabled when PV and shadow
 paging are compiled out
X-Mailer: aerc 0.20.1
References: <20260213133732.132326-1-alejandro.garciavallejo@amd.com>
 <20260213133732.132326-3-alejandro.garciavallejo@amd.com>
 <aY8-wlXW6Y90vvOv@Mac.lan>
In-Reply-To: <aY8-wlXW6Y90vvOv@Mac.lan>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3E:EE_|SN7PR12MB6840:EE_
X-MS-Office365-Filtering-Correlation-Id: a800246b-bffb-4c6e-4e82-08de6b25a6f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S0FaOUY4SVFhVlA5bmVGYmkxOFVna3d2ZXFzNzMyZ2NCQzVVN2EvLzRaaXl2?=
 =?utf-8?B?NWpzQjlnZmZ1TnRDNDRsSnJ2Mk5Va2dZSXVtTFI1dlVxNmdxWFpyQjRTdk9v?=
 =?utf-8?B?TFMzemJLbHlScUdHYmVMK0grdVJzbVN5QVVnd1ltT1UvRDVmZ2p0b2RIUU8y?=
 =?utf-8?B?dGZ3UkxSSEpGNmM2cUhYck9yR3g0eUM3Y0NYeVRrRUwzTk5OQ0ZvTEM0aHlS?=
 =?utf-8?B?eWlBYkwzR3FkMFovV0tCRG1PVFBYeXpINVlqclc4NTZtR0pQckNWVkE0SmQz?=
 =?utf-8?B?ZU10bVVhUGNoZFpUZEFMYzBWSnpGYzVuelhVR2VRdWkzcVJHc0NTWHE4cnBX?=
 =?utf-8?B?WmxCV0RmS29aOWpuRXRwMG54SVg3bzJ5QnRyYmVSRUc2R3lWWlNObXp5dzFU?=
 =?utf-8?B?R210QjNDU3ZYVlBPVlZlQ0lUT3JCa0FkTnd2bGUxZW1CcTRLWTlQc3JUT1Z2?=
 =?utf-8?B?L0xPaVhqZ2xmVkMvSW4yOVJTTjFMRlJWTWxmdlYvTkt3Y1JPRW1CWVZINUZR?=
 =?utf-8?B?LzJZNW9wWUtXZVRIMi9TUS9SQTZST2thVUpsSkd3Mnh0Y2N5Qzh2TUtUdm90?=
 =?utf-8?B?YXFjdTFEOHBJdStqUnZ6cE9XS05mNkl6c2YrZXM2VTJRck55Z3E1MzBnNEE4?=
 =?utf-8?B?aThzMEo4WmtpS09oUnhtQzkzZ2w5blp3c2hWb1U0VUtwTmluazQvQ2s1UzYy?=
 =?utf-8?B?ekw5OTRQQVJWZ0VkQVRnd3NWc0lzUGlwK0s1OTJCUERCbnZ3TWNRZWxCeDhZ?=
 =?utf-8?B?SGpUMjc3SjVZbHNVTWF4eTJSdjJERHJ6NnJzMThsNlNFZzkzeGhGRk1yKzNz?=
 =?utf-8?B?by9kRXhKa202L0NQMVZUZHg5Unp0UVprc2R6SktMZTBLcEcySHcyR3FXRXJv?=
 =?utf-8?B?U3lrYVBkQ296eUxsUUJMSytnWERPYjB1blFDUGEySEdkVG1iOVovNnRWRVdy?=
 =?utf-8?B?YU53aUw4UzhjTGp4Y2txdmkvYm44amR3RlpuWHVXUFM4dDFrN3NpcHdjNHNn?=
 =?utf-8?B?VG9XWmorSUczMDBSNXAwZ091STFRWDdkRFhiSXQ3aEV4TkxGTDRzWnkvcS9Q?=
 =?utf-8?B?dHJZZVc5cmpPTk5FT1VXbFRTVFY2bCtPQnliNWJRamxrK2xjYTAwU1czcWxv?=
 =?utf-8?B?UUdtdjNYYkpqcnFsYUhGcnZPQzBEclJMbnlTMk5NcHRnK1dSZWUyQXpwNGJm?=
 =?utf-8?B?djMya2hzVHA2anJFcnNpdzBOVUxLT3l2a3ZOaDVzaWc0YjhISDF3Nndmb0Vi?=
 =?utf-8?B?ZU5sVGNyNUh4V2xzNmZEWElkWHE3SDB0NkZ3V2RkQ0g2RSt2RTYrZGJncExj?=
 =?utf-8?B?QWVYVG1PUDFaaHJ5VnNYQ1UzbC82L0J4c0xaM0l6UjlCQ2xVbUhlUzlkc3ZI?=
 =?utf-8?B?OVRUYkx4SlRMdmFpc0lLaG5aM05EOTFJN3FhSElWQTBhYTRoZFhsNjZZLy9P?=
 =?utf-8?B?aU8wSjUzZVh2SFdsUVY5cS83dGgxc3NKajBmUHFGTjhxZFdNTFA0eS9INnMy?=
 =?utf-8?B?cXRVZjVOUnR1b3dQWjl4aDlXUW1kWUZGWjhwUEJucEltNmFCRUJpYjQ3ZnlL?=
 =?utf-8?B?UmZiZWJpRCsrNlBsOUlUWmdpTHlHM3hoOEwrYW4wTStOeGM4R2VVT3hBSVdj?=
 =?utf-8?B?TnJBRnk5OEZSOGE2Ylg3dExvOTkvdEVwM0Z4SHNUM3liWkwwVkh5enptdzRz?=
 =?utf-8?B?K0hoY3NsaTBrdTErY0NTYmFpSTlnd0U1TXZJWDZtSGJJZk80S1Z6cnJXallC?=
 =?utf-8?B?QmVEOWdBWlBlUlhkSGo5U3dMeXZ4RXo2RkRVSjlUKzAyZ3hkb28yYWd4eFNY?=
 =?utf-8?B?NVZVRnpwNHJGRW5wSnozdVhBQktZTkZLaWhBd3RnQnFNZGxJUzFCVWhrdG94?=
 =?utf-8?B?VTZ3SzZ5N3VnTmJEVXR0V3lGRmc1NVBmMDRlcUVWb1AreTBXYkhVL2JOcWlo?=
 =?utf-8?B?cnBaWmtvOVFNUVd4SGZDKzNPY0Y4dlhBeDlhSWpXVWhOVXVyQ3dsYUFaQlJa?=
 =?utf-8?B?VzU3azAzbmpWWHlocWRBNnh6WlVUZ1IweTd0aTdmTEJ5N2EvTk83VFFONU85?=
 =?utf-8?B?OXY4Yk5YdnlxSXdGRTVBdnkrWmJpaUh3WjdLSXhyQTVCSW5CZTQ0cTdjZVN2?=
 =?utf-8?B?U3k2NHNEOXAxOHRFOUxIMGFCUlpFQkU0RjlKWGFQWTIvKzdJS0srelZYNTdt?=
 =?utf-8?B?WnhZQVc0OStsSngyL1g1S25FRi8xaU93U1J4V0ZVaXhpc2hreHlVSldQVlJr?=
 =?utf-8?B?dTJPR2hTaGpsUitMdFpuamVsaXNBPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qO4sDFPOM2GUyDflrU1LSanqh9GsbgU9gSJ7fvzXa5h7Nwi8GZeNv/8VDbBwwSp+Tq3HnZKg51tj4Omdua8TiEnhQ6C0zQqiiPq3O0ZW4sxzzhfge6KemDg9NF2tBevU6GWAaDVjmac2KtIncZLqHdT8Gc1DWW5DKrT91erDYYFCki3C4R/U5QCwXIz/ml6wEJY7sDGGDBs3Fj6Zj4By6xI2ZQ2hm9HgYv8eXaVPBFE0/Bdur/HnfMhP/YH98TIwmkVEimPwiGTku7q72fdq6M4kcB4C2V+b1umJ8ycMGQSJcygIaxq34SnmcqbFKqjXi7wGGr6IvyzenYCyc7kCUKtuom4DptM6xfUAUhRm4oR07hWh4uNd/Q2WI456sTxXG78PmtUBdQOnQVz4b+roNW4Hi/G72/7cAihPlED06y2+Ypo66PjhqdrW31exr4vd
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 17:30:59.1707
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a800246b-bffb-4c6e-4e82-08de6b25a6f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6840
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 361B2138A7F
X-Rspamd-Action: no action

On Fri Feb 13, 2026 at 4:09 PM CET, Roger Pau Monn=C3=A9 wrote:
> On Fri, Feb 13, 2026 at 02:37:30PM +0100, Alejandro Vallejo wrote:
>> Makes hap_enabled() a compile-time constant. This removes a number
>> of hooks that normally go reach onto shadow paging code, clears
>> many branches in a number of places and generally improves codegen
>> throughout.
>>=20
>> Take the chance to fully remove the shadow/ folder as it's now fully
>> compiled out.
>>=20
>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>> ---
>> bloat-o-meter against prior commit (defconfig:-pv,-shadow on both):
>>=20
>>   add/remove: 0/12 grow/shrink: 2/31 up/down: 67/-1609 (-1542)
>>   Function                                     old     new   delta
>>   unmap_mmio_regions                          1340    1374     +34
>>   map_mmio_regions                             211     244     +33
>>   opt_hap_enabled                                1       -      -1
>>   shadow_vcpu_init                               2       -      -2
>>   __setup_str_opt_hap_enabled                    4       -      -4
>>   _update_paging_modes                           6       -      -6
>>   _toggle_log_dirty                              6       -      -6
>>   _clean_dirty_bitmap                            6       -      -6
>>   cpuid_viridian_leaves                        728     714     -14
>>   iommu_domain_init                            291     276     -15
>>   p2m_pt_change_entry_type_global              214     198     -16
>>   paging_teardown                               91      74     -17
>>   paging_set_allocation                        384     367     -17
>>   paging_enable                                 76      59     -17
>>   p2m_init_one                                 295     278     -17
>>   ept_sync_domain                              201     184     -17
>>   arch_set_paging_mempool_size                 437     420     -17
>>   p2m_free_one                                  78      59     -19
>>   paging_vcpu_teardown                          36      15     -21
>>   p2m_pt_init                                  125     104     -21
>>   p2m_pt_change_entry_type_range               218     197     -21
>>   arch_do_physinfo                              76      53     -23
>>   sh_none_ops                                   24       -     -24
>>   paging_final_teardown                        134     110     -24
>>   __setup_opt_hap_enabled                       24       -     -24
>>   paging_vcpu_init                              41      15     -26
>>   paging_domain_init                           167     141     -26
>>   p2m_mem_access_sanity_check                   71      42     -29
>>   hvm_enable                                   449     419     -30
>>   init_guest_cpu_policies                     1247    1213     -34
>>   paging_domctl                               3357    3318     -39
>>   __start_xen                                 9456    9416     -40
>>   arch_sanitise_domain_config                  794     747     -47
>>   symbols_offsets                            29636   29588     -48
>>   p2m_set_entry                                305     247     -58
>>   guest_cpuid                                 1919    1858     -61
>>   ept_dump_p2m_table                           817     751     -66
>>   recalculate_cpuid_policy                     874     806     -68
>>   shadow_domain_init                            71       -     -71
>>   mmio_order                                    73       -     -73
>>   hvm_shadow_max_featuremask                    76       -     -76
>>   hvm_shadow_def_featuremask                    76       -     -76
>>   dm_op                                       3594    3510     -84
>>   symbols_sorted_offsets                     58464   58368     -96
>>   symbols_names                             103425  103213    -212
>>   Total: Before=3D3644618, After=3D3643076, chg -0.04%
>> ---
>>  xen/arch/x86/Kconfig               | 2 ++
>>  xen/arch/x86/hvm/Kconfig           | 3 +++
>>  xen/arch/x86/hvm/hvm.c             | 8 ++++++++
>>  xen/arch/x86/include/asm/hvm/hvm.h | 2 +-
>>  xen/arch/x86/mm/Makefile           | 2 +-
>>  xen/include/xen/sched.h            | 3 +++
>>  6 files changed, 18 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
>> index 2ce4747f6e..190f419720 100644
>> --- a/xen/arch/x86/Kconfig
>> +++ b/xen/arch/x86/Kconfig
>> @@ -67,6 +67,7 @@ source "arch/Kconfig"
>>  config PV
>>  	def_bool y
>>  	prompt "PV support"
>> +	select OPT_HAP
>>  	help
>>  	  Interfaces to support PV domains. These require guest kernel support
>>  	  to run as a PV guest, but don't require any specific hardware suppor=
t.
>> @@ -147,6 +148,7 @@ config SHADOW_PAGING
>>  	bool "Shadow Paging"
>>  	default !PV_SHIM_EXCLUSIVE
>>  	depends on PV || HVM
>> +	select OPT_HAP
>>  	help
>>  	  Shadow paging is a software alternative to hardware paging support
>>  	  (Intel EPT, AMD NPT).
>> diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
>> index f32bf5cbb7..310e09847b 100644
>> --- a/xen/arch/x86/hvm/Kconfig
>> +++ b/xen/arch/x86/hvm/Kconfig
>> @@ -92,4 +92,7 @@ config MEM_SHARING
>>  	bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
>>  	depends on INTEL_VMX
>> =20
>> +config OPT_HAP
>> +	bool
>
> Can't you define this outside of Kconfig, like:
>
> #define HAP_ONLY_BUILD (!IS_ENABLED(CONFIG_PV) && !IS_ENABLED(CONFIG_SHAD=
OW_PAGING))

Sure.

>
> HAP_ONLY_BUILD is likely not the best name.  Maybe CONFIG_HAP_REQUIRED
> or some such?  (Seeing the usage below)

Definitely not CONFIG_*, or it'd be an accident about to happen when mistak=
enly
used on IS_ENABLED(). HAP_EXCLUSIVE?

>
> FWIW, with the current naming I've assume this was supposed to mean
> "Option HAP" or some such, when is "HAP is Optional".  We usually use

It was. Originally it had a help message and a default, but I quickly notic=
ed
that served no purpose. It has that weird polarity so the build would remai=
n
with new options being additive only.

In retrospect it can go back to a more natural HAP_EXCLUSIVE that removes
a bunch of !s in the code.

> "opt" as a shortcut for "option" in several places on the Xen code
> base, like "opt_hap_enabled".  I also think using it in the positive
> for so the variable meaning "required" instead of "optional" makes
> some of the logic easier to follow below.

It does, but in Kconfig it's nicer if an option being enabled yields a stri=
ctly
more capable hypervisor, I think. Makes allyesconfig and allnoconfig work a=
s
intended.

>
>>  endif
>> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
>> index da56944e74..ce58632b02 100644
>> --- a/xen/arch/x86/hvm/hvm.c
>> +++ b/xen/arch/x86/hvm/hvm.c
>> @@ -91,9 +91,11 @@ struct hvm_function_table __ro_after_init hvm_funcs;
>>  unsigned long __section(".bss.page_aligned") __aligned(PAGE_SIZE)
>>      hvm_io_bitmap[HVM_IOBITMAP_SIZE / BYTES_PER_LONG];
>> =20
>> +#ifdef CONFIG_OPT_HAP
>>  /* Xen command-line option to enable HAP */
>>  static bool __initdata opt_hap_enabled =3D true;
>>  boolean_param("hap", opt_hap_enabled);
>> +#endif /* CONFIG_OPT_HAP */
>
> Hm, if you nuke the option like that, it needs to be reflected in
> xen-command-line.pandoc document.

Ack.

>
>> =20
>>  #ifndef opt_hvm_fep
>>  /* Permit use of the Forced Emulation Prefix in HVM guests */
>> @@ -144,15 +146,21 @@ static bool __init hap_supported(struct hvm_functi=
on_table *fns)
>>      if ( !fns->caps.hap )
>>      {
>>          printk("HVM: Hardware Assisted Paging (HAP) not detected\n");
>> +
>> +        if ( !IS_ENABLED(CONFIG_OPT_HAP) )
>> +            panic("HAP is compile-time mandatory\n");
>
> From a user perspective, it's a weird error message IMO.  I would
> rather say:
>
> "HVM: Hardware Assisted Paging (HAP) is mandatory but not detected\n".
>
> Not fully convinced about that wording, but I would certainly drop the
> "compile-time" part of yours.  A user is not likely to care/know about
> compile-time subtlety of the error message.

Sure.

>
>> +
>>          return false;
>>      }
>> =20
>> +#ifdef CONFIG_OPT_HAP
>>      if ( !opt_hap_enabled )
>
> You could possibly do:
>
> #ifdef CONFIG_OPT_HAP
> /* Xen command-line option to enable HAP */
> static bool __initdata opt_hap_enabled =3D true;
> boolean_param("hap", opt_hap_enabled);
> #else /* CONFIG_OPT_HAP */
> # define opt_hap_enabled true
> #endif /* !CONFIG_OPT_HAP */
>
> Above, and avoid the ifdefs here?

Whatever poison you prefer. It's just ugliness motion.

>
>>      {
>>          fns->caps.hap =3D false;
>>          printk("HVM: Hardware Assisted Paging (HAP) detected but disabl=
ed\n");
>>          return false;
>>      }
>> +#endif /* CONFIG_OPT_HAP */
>> =20
>>      return true;
>>  }
>> diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/a=
sm/hvm/hvm.h
>> index dc609bf4cb..b330d65d6d 100644
>> --- a/xen/arch/x86/include/asm/hvm/hvm.h
>> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
>> @@ -703,7 +703,7 @@ static inline bool hvm_is_singlestep_supported(void)
>> =20
>>  static inline bool hvm_hap_supported(void)
>>  {
>> -    return hvm_funcs.caps.hap;
>> +    return !IS_ENABLED(CONFIG_OPT_HAP) ?: hvm_funcs.caps.hap;
>
> return CONFIG_HAP_REQUIRED ?: hvm_funcs.caps.hap;
>
> IMO is easier to read (same below for the hap_enabled() early return).
>
>>  }
>> =20
>>  /* returns true if hardware supports alternate p2m's */
>> diff --git a/xen/arch/x86/mm/Makefile b/xen/arch/x86/mm/Makefile
>> index 960f6e8409..64fde82c50 100644
>> --- a/xen/arch/x86/mm/Makefile
>> +++ b/xen/arch/x86/mm/Makefile
>> @@ -1,4 +1,4 @@
>> -obj-y +=3D shadow/
>> +obj-$(CONFIG_OPT_HAP) +=3D shadow/
>
> I think you can use:
>
> obj-$(findstring y,$(CONFIG_PV) $(CONFIG_SHADOW_PAGING)) +=3D ...

Hmmm. I guess I shouldn't just include it twice, like we do for other .o fi=
les.

Cheers,
Alejandro

