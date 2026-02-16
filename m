Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIKdOu72kmlx0gEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 11:52:30 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DCE14281F
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 11:52:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1233973.1537348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrwD5-0005Ph-Cl; Mon, 16 Feb 2026 10:52:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1233973.1537348; Mon, 16 Feb 2026 10:52:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrwD5-0005N7-AB; Mon, 16 Feb 2026 10:52:11 +0000
Received: by outflank-mailman (input) for mailman id 1233973;
 Mon, 16 Feb 2026 10:52:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C5B6=AU=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vrwD3-0005N1-KD
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 10:52:09 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88e64baf-0b25-11f1-b163-2bf370ae4941;
 Mon, 16 Feb 2026 11:52:07 +0100 (CET)
Received: from IA4P221CA0009.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:559::11)
 by DS4PR12MB9659.namprd12.prod.outlook.com (2603:10b6:8:27f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 10:52:03 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:208:559:cafe::8e) by IA4P221CA0009.outlook.office365.com
 (2603:10b6:208:559::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.16 via Frontend Transport; Mon,
 16 Feb 2026 10:52:10 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 16 Feb 2026 10:52:02 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 16 Feb
 2026 04:52:01 -0600
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
X-Inumbo-ID: 88e64baf-0b25-11f1-b163-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L46grKqYJF/AuJg0EW2IvoOS6asz0QhLsJMjKS4PtVTyn1cYYle2he56XoxPZymwsBXt6Mryzg5BgK3zqemijLtinVF2kj5ufJbuu6bHNwZg6t3HaRqmt/+rWPGpRkYlELWI8H8/OymrQR+Vd93tRYUdR6bPvTyFGFpgQ5CAvljjkYh8SC+MPKHRrNhJ7AWonvD30bjV9e/Cvm1Eul70c1UjtHXWTqbrVSlMfVyWoMyiK9C6cM4h58E8cQd+ELDTMUwxYW9R/XjJbTzh8lrxC9nzJJELsuobwib3J0SCWJKPi3Z8BNZMRooB8oueiuKKlMn8mT6v1dJYWnCbs9Pvbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qz6DU6iJmz6+r6yX9lYorP/ALvuQk1srp2tcSOIvpSc=;
 b=rW6dl5Y3gaU3rGNHNzfD/6itcR/Q7lXbFl0Jyr7tUvocqtZ4zzgN7Orim42pJ2nBh3WlGZDchc53Az41+WlhWzxeU6bg9xnqXJZewWLRK4Cm7ffinQ5uo3EnP4Gdu/bJGxKCnu0HKIEUHdgocB/Z3fFVpSdzAl0HNLl5AZiXWPUDZ0v2hagfxTwetehAlhl/qIwQOVttDdRbzlNnyGr5q2PjFyCt6wqAO8tMa8tv8RWucZ2zJvMR78SFcwDqZ5cWnRl1IYOQMbV1VAdjuezgDudoOII0NUMWZETlpc3Ezbq+ywIQTyh1jRrga1DMU+eA3QaU9El/kp1jcpwZq+Dr5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qz6DU6iJmz6+r6yX9lYorP/ALvuQk1srp2tcSOIvpSc=;
 b=aZRSpG8gwy5gQtkcYPvmvkkhA74t8VVUlJnCj7l8pA4OaXXWThGCCSDAzRMMD09Tbl/ZtRxwDXvZ2cTHbQI84bQt9UiBJNrEgFNzP8EKnnS8xD4n5DfDGysB1qPrNryCfkEvUkJjoZPQ2HGPbKKSrVeKHkfPxa1pYq+EQ1e2ugU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 16 Feb 2026 11:51:59 +0100
Message-ID: <DGGBV66XKGMH.1A45QMIALDYXM@amd.com>
CC: <jbeulich@suse.com>, <roger.pau@citrix.com>, <jason.andryuk@amd.com>
Subject: Re: [PATCH v3] x86/cpufreq: Add Kconfig option for CPU frequency
 scaling
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20260213222818.271685-1-stefano.stabellini@amd.com>
 <d1765cd9-b95a-4032-bc0b-ada50e1a05d6@citrix.com>
In-Reply-To: <d1765cd9-b95a-4032-bc0b-ada50e1a05d6@citrix.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|DS4PR12MB9659:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eb7128e-aaf7-41e2-2567-08de6d496b1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VnBuYStaVzA1QW5td01PbjFZbFMwWFA3L0xEbG5VV2RBYXlseDFROVVZa1BW?=
 =?utf-8?B?S2JhbjlFSDR0WURORG81TFdJZEgrajhBK2ZPNTZpMExlSnZtSTBrR2Y5dy9E?=
 =?utf-8?B?clBzMExpVmt5V1ptb1ZETU1iRWhleklQc0FoSzJ5WmF4dE9YZ3VpMU56akdS?=
 =?utf-8?B?elV1Z1k1SFRlaHg2V2YrbVpoVy9wQWRzMWtQZzJ3OHdIbFZhZC9Uc2t6WGhq?=
 =?utf-8?B?aldvYk9KdHhoMUpkRmpmTUQ3UnZrelkvUDVBbVhZTmNPQkFxZzdJUTJOUVdm?=
 =?utf-8?B?azZieWZkMTdWUlo1U0lQZG9zTTNkVmsyUDV1QVRqWEcyUGt1cmMwMFRrK1Y1?=
 =?utf-8?B?VkROUFMyK1FVRGkvSUhZUVl4SW40MWpkWHFFWHluNHlaU2kyYndQVGRTekdw?=
 =?utf-8?B?cXFTSnVXRnVLWVAyUGZIY1ZyajJRSWR2dUhHVyt6a3NXalRpRVBqcmFsUFRr?=
 =?utf-8?B?ZDgxMTB0dG40SkRKT2pmaDdlb01pampUYUsyMjNLQml5M2tHMzZlKzd1U1lw?=
 =?utf-8?B?b1FvbWdJTy9zQjJ1OTd3eHpjcFZtV2RzVk9zbWZlRG1TamZrRkVFZ3dGdXoy?=
 =?utf-8?B?RkJOWVBPd3NBQS9CRU9GZjY1WTFiZE9UcTdYNDY5VHQ3OUFrTGxKSlBIZjRk?=
 =?utf-8?B?QXB2N29PVm5oSmhiNkY3Q2VCMVhZeWE0S3ZhQ1NvUUZWQjNBbjZ2VWFGb2th?=
 =?utf-8?B?MmFCV3F6dUorK2NQWnZ0MHVJM0R2NHpHbjJXS1FsRG5IU1p6RnN1MHVBOGFm?=
 =?utf-8?B?UVloSjZrZm84SGo0WXNvamJZcUluRmVjWEFEUXMvMUtLNUZCeCt1b05NU3M0?=
 =?utf-8?B?dENCS3VUME03OFI2UTB0SHFFaGdmS3FYazV6bmJQcFZYaGhaWC9tanNCSGNY?=
 =?utf-8?B?c1gvUkFmNkpEZTEycEdFSXRzN0Z5QStzMUdRWUV0ZFk2OHN2SVdsQWYzQldZ?=
 =?utf-8?B?aURyTytzcmxaYWdDNzBmdEE3cThKdmErZGhtTVhsWGcySGtpbUF3Q05pM2l4?=
 =?utf-8?B?RnQ5M0ZrbnNkeVRIRm9jNStjODJSbUZBZGgwUHJBZUJFL0dDREQ4VWJZRThs?=
 =?utf-8?B?eklRQVJpZ3BrVnNSWHNkbGVDRHBRQWlieEQ5UEUrUjc2M0xDOElpdkJ5M05j?=
 =?utf-8?B?Z3hGMTJOYTE4c0NtVG9kY253R1c1eDI1VTB1NG1KNlNhVWRpcXlzUjJyMHBr?=
 =?utf-8?B?UXFORmk4bWM0MGRPR3hTdGhVTHBTTzFoRGg0T2pPSDhOWDdZMVh5U2JjY1Br?=
 =?utf-8?B?emowMHRaZ3BkK3BiQ0tGazdSd3JDaXdJbWJqdGkxZTl4bjNlQTZDY1lCK1l1?=
 =?utf-8?B?aDJmZGlCVzlGNkhIRFBYWTFISEplbzhwWkxoR2duQVdzdXhYRUVPblVSTFZy?=
 =?utf-8?B?Y2w4eXpudlNqVnRMTGhZVDl4TkVFM2hnaGd1SFBKdTdLTHdVUGZobDFHVlox?=
 =?utf-8?B?SnMzVnRIalNqSEl2K0RmVjVXdEYvTnFtSlh2d3VobUhLVzJzbExPK1dVWGZm?=
 =?utf-8?B?RlpGdDM1UzN1SFZsczMwNmk4bG1rY0VSVWZ4bXZJMHVIcFJkYXBLVFpjZUpo?=
 =?utf-8?B?amVmRkdONWV2ZWxlemJjVEgzQkFya0hwTXA4Y0dBMlFESlJMek1YbldrSHpp?=
 =?utf-8?B?OUdPZTJGZVN2S3IyQmZmYld1YngyYW5Ya3J5L1BtNG9qeDB1UGdFTjNDNEdP?=
 =?utf-8?B?RXRISUo2TGhFYlo1WXBLTHp6bWFRNUJaNjhtUGo1eElLSmw5UFdBejF2bVJo?=
 =?utf-8?B?K3V3bWFxaEJKZkZ1b3p0RlpoRGVqV21xRFVpRzRxQU9uaXdXeHh0cm01QVBW?=
 =?utf-8?B?Y0JlTVdQOHpkVnJEWnRPZXZZQm5zS2VOc1g3d284MHRuQjMxMnc5dEdIZ2du?=
 =?utf-8?B?UlVVQTA0UWxPM2drQXpVWGhwSzlBRDNDWEFneGtnbGUrczZIeGdpRXlUc2dL?=
 =?utf-8?B?ZVozY041a2tYcER6aWVKdDFDV1pFTnNBR0YyUVkxdWNnL2JZNEgzSUV3MGNY?=
 =?utf-8?B?cnlqUm9YK0NLSjltVG5ZOW0rWmtHTHphTVVQNGRPeFRUaUJKMkp2U0c3eUEy?=
 =?utf-8?B?dmQ1dW5zaFpmL1FlVkVnVHBKVU9jYllXYlR5TlFvWWRkUEwxL0xxZTN6ZC90?=
 =?utf-8?B?eC9SdWJ0cTFSUmNTNHdyRGEvaC9pMnJubHJuWHZDbytEM2I4eWdMUzZVcUZM?=
 =?utf-8?B?MVBRRFJrNytpNDlndWZGd2VTWmxQMDYwUGRLaTdmZzBWclpmRlNVTDB4QTNq?=
 =?utf-8?B?bHVnM2g4VGhOMzFRZGlTTytpRU53PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	e3OLr7MURJsFHT+dljw8/SyDpRjHF5RLMPZjzq3VXfsCYBBtUIK/J1oSvIH/JvP0rbAzlQTiQw0a+ZOFdLmPxvCHHvf9SMI8EOMXX2WIscqwR6Vk+Nx5FUa09r/r1TViXCe7BL9xW6gkD5eMiryGBjZv8Cnk7bd0+hpOjLV+fop5bmiiuPdAz211/+ICvEWD4MDDQ8mm0NjpCH2oUcvEZ/+gB6lGquHvbkriaU6ZvIyzkfEdIkrV6/RJwwWmeBrHX6BBkPilLlxsNEg4Bnv6QyC0wSaLMbGaW4JYwawXBRkTbT4dmWqCQDXjW9hHnr/JozpnneQqNXotfRWsdZSxo0Lrj7Cv+jIwM+Wt1P6q0pjyNFyCX++bz4F0YGxzyyKLaAhdKuo3MsyVcTF8wGC3FOmEhGI+biaSbSLXz8NhAAqlB2tQHiwUqJCkUcc/CopS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 10:52:02.9923
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eb7128e-aaf7-41e2-2567-08de6d496b1e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9659
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:andrew.cooper3@citrix.com,m:stefano.stabellini@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
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
X-Rspamd-Queue-Id: 50DCE14281F
X-Rspamd-Action: no action

On Sat Feb 14, 2026 at 12:29 AM CET, Andrew Cooper wrote:
> You won't get a compile error for typo-ing a name inside IF_ENABLED(),
> but it won't function correctly either.

There's beauty in having a typo explaining the effects of a typo :)

Cheers,
Alejandro

