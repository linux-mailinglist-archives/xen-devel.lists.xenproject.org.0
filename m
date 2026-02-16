Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NnSNubykmlA0QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 11:35:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C1614264E
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 11:35:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1233952.1537329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrvwW-0001VD-Oi; Mon, 16 Feb 2026 10:35:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1233952.1537329; Mon, 16 Feb 2026 10:35:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrvwW-0001SG-LV; Mon, 16 Feb 2026 10:35:04 +0000
Received: by outflank-mailman (input) for mailman id 1233952;
 Mon, 16 Feb 2026 10:35:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C5B6=AU=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vrvwU-0001SA-1s
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 10:35:02 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2198f267-0b23-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Feb 2026 11:34:55 +0100 (CET)
Received: from SA0PR11CA0003.namprd11.prod.outlook.com (2603:10b6:806:d3::8)
 by LV5PR12MB9803.namprd12.prod.outlook.com (2603:10b6:408:306::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 10:34:50 +0000
Received: from SA2PEPF000015CA.namprd03.prod.outlook.com
 (2603:10b6:806:d3:cafe::5) by SA0PR11CA0003.outlook.office365.com
 (2603:10b6:806:d3::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.16 via Frontend Transport; Mon,
 16 Feb 2026 10:34:46 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF000015CA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 16 Feb 2026 10:34:49 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 16 Feb
 2026 04:34:49 -0600
Received: from localhost (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 16 Feb
 2026 02:34:47 -0800
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
X-Inumbo-ID: 2198f267-0b23-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aaFW8jf5ffYgHqQjToQYvyqkA5BR5O9Y8bK4/uTi4Kv/nwLr6Dl+LYiKVK3vytvjAjSxoCAO8ROAk9ExrN3/tKWYOWMFTGcPfNIIgAA9iitBaRVvrgBk7Cxh1+5b29WEvCDWfGdWo8if01e7WRDj4dSJoqydVSWaQu+FC/X37vqjgNPWnWxVY3HKloGeiDsWcGPapcgRNwinvWzSwYpcVv1jPuTrCf11MPRdh1p/9WKDRPCVUCHUxW1CockcNhYf4QFgYZrFA9cqwtnkZ/7OQ0fBn0Y8c+OgLxdaHNlg4HlFUNl08ryO7CGxityulSUCzOC09fyTV1PmeQdOKnh4Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/g1gBG27xa7GJOS+TNorBntEMaz1pFSeo6v2BenKOT8=;
 b=BeGe7vvwMaoyAJGXP0V7quL78mYFfk7vCzqXUxkFsI+zVv9MTYnU3YzOXppr4UcWsRCK4X/QjW8MJzJZ/Ut+iH92mXhOIhY04Ac0kMpIcQJPz+168W3ditsfcg3K02UzpmPdAK2jhO5JXL0P/wIoU8rq/fJSMU7QjXNOYZvFwZsOzSE9H+KPsPK3HWTQ7AeMvEn63jS1u07S38x6Gr6F/g9/TeTgWtJd76IckIkwA2JLHvK/N721d2Jg62kKNnMntrtTk8gPKTiKdfmoO1V5/RzL2JAEY9CVmnb5KpuGWevRVhvMQCSsY/e1mGMhnOGXyoAKqbHhMtMupQi9VdjuWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/g1gBG27xa7GJOS+TNorBntEMaz1pFSeo6v2BenKOT8=;
 b=uCkSF4TS6J7R5r2676ARvT7ppaYpQR2bG/hJs+Jq6XhX324DQ98u9iA2r0XIA7srJik87mPdBS8OCOl/ryPhK8Ei17XsXqn0roeloYo9Yz83bNnlLKnnGLFnG3Y5nQ7eneOWwQ9GxXGySdH4ulNvIxvr/+mwxGUHp2p86WNrUTk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 16 Feb 2026 11:34:43 +0100
Message-ID: <DGGBHY9HHXIA.C7GM5MX7ODLG@amd.com>
CC: <roger.pau@citrix.com>, <jbeulich@suse.com>, <andrew.cooper3@citrix.com>,
	<jason.andryuk@amd.com>
Subject: Re: [PATCH] x86/hvm: Add Kconfig option to disable nested
 virtualization
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Stefano Stabellini <stefano.stabellini@amd.com>,
	<xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20260213220205.196179-1-stefano.stabellini@amd.com>
In-Reply-To: <20260213220205.196179-1-stefano.stabellini@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CA:EE_|LV5PR12MB9803:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f35e570-dd71-4c2c-3525-08de6d47030d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UnYwOFk3ekpMb3VxUEoyYjY4ZFZjaWZTWWFNN0czNmNJMHE2Y0Y3SURwU1BH?=
 =?utf-8?B?TmxUeStHVDZwVDVvT0dBemtaMEN6ZGlOVVdiVDRKMEw0TktOUFBOZStKbWdV?=
 =?utf-8?B?ajB3ZFBjdWN0cnZKWnliU241S3IvVXlDdzFLeVlqcllYOTNkaXpsNHRLL1Q1?=
 =?utf-8?B?R3RMaE1iYjVuTkpTbjQrNTFabElaMVU1TUtNZmd2R09LNWZWMDJQSTMxQ1ZB?=
 =?utf-8?B?b2xNb290ZEg0OFV5dmpmSXRiNUY1M3J0R2xVckkzMTdqdnBzTzZ3TGpQU0dh?=
 =?utf-8?B?N0ZyZFA1UjZUUnYzNnZ0NjJMUENyekZPUVVnNGdpd25JN3JVaHhQTDBNOWFF?=
 =?utf-8?B?dUVtUjVPQ3dqZ0x5ODhOekpXM3ZOMHBwWmM3SHVITEMrWS9PaXJaU2ZPSTFC?=
 =?utf-8?B?U2VWbEp6MkJoSG5oam1DRlU1N0k2clJLRERJbzd2QVhwRy9TbTI5TmZzQ1RF?=
 =?utf-8?B?VmhJUGlKNTRDTkk1VUpUeXZlK2xNUTB2Q1BYNDdUTGVZa3kyUDhrTzh0K1Ex?=
 =?utf-8?B?REkwRzROc050VUsrT3dOcGEvTEhzQ1I3aXNlNEVSVW1wdWVOV2tQRmtndzZL?=
 =?utf-8?B?NzdmV0ZaMmtXcEpDVnhMdjIrdjRQUjVTZTl3Tmo5VzBLOUt1OXhsZTd2algw?=
 =?utf-8?B?WEt3Y0s4UDBsbkRZZ1NKNHZUbDhVOENrWmkzMlpCdUtDb3BhQXZoL0dtKzJM?=
 =?utf-8?B?ekVQYTUxbnZLMm1UeFd3VG9ZM0RZTFRkdUIrZmRDalZUY3FQQi9LK1ArUEQ0?=
 =?utf-8?B?TEVsdlRHdHR6QWtrdjFTcG1VcldqRWoybVdSRnE1WlFUcnZHYklkc3RaWitp?=
 =?utf-8?B?U2xOVWRBb0tZQjd1Rlh3bW1idFNlaEpkUlI0TEZFTlFzS2EzWVVMQ1R3MFFV?=
 =?utf-8?B?eFlMbHlDNGh6d3A3QVJUS2k4WVJlQVEvN3JrZU9HVHY2Z01RUFpuV2ZQKzFs?=
 =?utf-8?B?TEIyUDBneDdZNkJFVkw2bzVJWTRDeU9FTWhoMlNMaUQvcGRyalhReWNyQWNx?=
 =?utf-8?B?TEtGTlFrZzNQSFJMcHpDemI4ajJISWtuMm9JSUhjUktpbW92aiszb1djVzZN?=
 =?utf-8?B?S3BFMnhwZ3BEN1REYzYycWF1Q2ZmVE5kMm9EVjcrR2VtcmNweEt6aThSK2tG?=
 =?utf-8?B?TWVPWjZ5VGdOYnd5Y1FnZXR0aFV5dUlKeTgwSFpsNGd6NFg4bW5VZG96dGNV?=
 =?utf-8?B?RVY2emRBK3l3YVlEYU5GeVdubEJIZktYNEY2d1hzb2RmSXI2cEQ2ZFdzZkFC?=
 =?utf-8?B?dlRFQUt3MEtOTFlxSTg1bXFJUjdBTUdpZzBZTkpzVW0ySklCaHZnUUdXZThJ?=
 =?utf-8?B?ZTMxR0xJRHNyeGFNRnJnai9JelZXZlU1U2VWdHlqdzJ4MzU2OUtUcTFualJZ?=
 =?utf-8?B?R3hjenAwcnZ0cDZBY0ZHb3c1STZRZUxzUnVJaG5ORjh1ZTkrSHU5YUU4bDU0?=
 =?utf-8?B?WGRvSFJLanFYeTZ2RzZhendLMFgyaVNsTG9vS0FpMlFjSld3R0MweElqVzNS?=
 =?utf-8?B?b0Z3U3Rkc3ozQlFaVmlxMGRKNWhiTlFaVEZDRW9JcUJpY25wTHd4MkpDOHVR?=
 =?utf-8?B?L3J5Tk1ZMStNQk9pdFVRT2swUHZwSmRXWDV3RmpYM1Fwd201RDE4a0tPQnYv?=
 =?utf-8?B?SHQ2VWYya0t4NkRoVEhUSzkvN05naDhYdThiMUprd3M1S3RMdXVFcnZuZEoz?=
 =?utf-8?B?ak1QaHFmUnpzMXdEcml3VU9yb3I2cU9ERXhyV3lTUU5zdmlMd3ZaWURvK0FV?=
 =?utf-8?B?L0F5UHF2ZUwvTWpqeU85bHdDNzJLRDVTLzlvVHNEd2NFOTFKRktkRGRMRVJT?=
 =?utf-8?B?UXhRZHoyNDB1L0hZM1FMb1dPeW9qVDF6WTJCVXh1b2dSMTkvOHR2azFzYUwx?=
 =?utf-8?B?QmV6bW5URDlaQVIwSS8yY3pyTExPWlRXaFNtVjkyLzJ3VnVZTzNIYjZweEhX?=
 =?utf-8?B?T1RFamxKTW5Ka0xTeHhoNWFmK1hpQjFvaDMvMkQrcGY1U2hCKzRVRXh4Q1Zv?=
 =?utf-8?B?ZHl4TysxY3dHZ25kdndZbjl4WUU5UldqSGRMMHFtSXQzWjRPNTlQRXF6WmFm?=
 =?utf-8?B?dEpMbHNXVnlIcnRzcThyWEo1WkUySHB5d29Hb1l0TnltMUxqdHhiR3BIdDgz?=
 =?utf-8?B?U1lyaElwQzdnUlB4cTlDK1h4czlVRHZiR2p4ZENEY3NicXVmTTBZY1JBZ0ll?=
 =?utf-8?B?cGc3c09aWmZNWjlwbm9WMUZJcnQxOVhFbzhzYnd4Qlk0bEIrVzByWmoxUEt3?=
 =?utf-8?B?Wnlyb2ozTDArOWxreW4veWExcTlRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gzSuO+544Fa7+T57FywYeU27HVj0DfqeQBBJ4NPK5rQ08xgTBrnMkAoG5KVO1uA+G+W3dILq7r4NtmUirvRmlY1eEcxP3tmVoeDURUKXnHgJ6Ev+qZsnU6ADlHJlR8MP8qrcxY/ZrdbbSNZLn52AzznzxXa9OOPQsgDJ37b/YWtn+Y/D6+bmvRLEya3Yi9NzIeOIX0SU0FPJDTGLlOljuoAoLRx2jNCj9m9jpTo+m2NGIkpfWgnNWRBapLEzxzX250PWS7cBjHtreJACr+98RLWn6X98JPFR8bHennQXsew8jgeUILkqQQ7msdMsLdktdt6PxilUSNQEevpgLz1U1uc9usieRQecO51F9PJ5YCx3xoDNXugS2QVpLRNUxtffqTLMxp4Kr7RBMXYZX1kdYLgKxSNHM70d6RFlXAIto8qiHCY/JyKo5GdSE2fzR/m6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 10:34:49.4141
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f35e570-dd71-4c2c-3525-08de6d47030d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9803
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
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,m:stefano.stabellini@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: E8C1614264E
X-Rspamd-Action: no action

On Fri Feb 13, 2026 at 11:02 PM CET, Stefano Stabellini wrote:
> Introduce CONFIG_NESTED_VIRT (default n) to allow nested virtualization
> support to be disabled at build time. This is useful for embedded or
> safety-focused deployments where nested virtualization is not needed,
> reducing code size and attack surface.
>
> When CONFIG_NESTED_VIRT=3Dn, the following source files are excluded:
> - arch/x86/hvm/nestedhvm.c
> - arch/x86/hvm/svm/nestedsvm.c
> - arch/x86/hvm/vmx/vvmx.c
> - arch/x86/mm/nested.c
> - arch/x86/mm/hap/nested_hap.c
> - arch/x86/mm/hap/nested_ept.c
>
> Add inline stubs where needed in headers. Guard assembly code paths
> for nested virt with #ifdef CONFIG_NESTED_VIRT. Move exception
> injection for VMX/SVM instructions to the callers in vmx.c/svm.c to
> avoid header dependency issues in the stubs.
>
> No functional change when CONFIG_NESTED_VIRT=3Dy.
>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>
> ---
> Changes in v3:
> - Kconfig: Change "depends on AMD_SVM || INTEL_VMX" to "depends on HVM"
> - Kconfig: Remove redundant "default n" line
> - Kconfig: Remove "If unsure, say N." from help text
> - mm/hap/Makefile: Simplify using intermediate nested-y variable:
>     nested-y :=3D nested_hap.o
>     nested-$(CONFIG_INTEL_VMX) +=3D nested_ept.o
>     obj-$(CONFIG_NESTED_VIRT) +=3D $(nested-y)
> - svm/nestedhvm.h: Remove #ifdef CONFIG_NESTED_VIRT stubs, keep only
>   function declarations (the functions are only called from code that
>   is already compiled out when nested virt is disabled)
> - svm/nestedhvm.h: Add CONFIG_NESTED_VIRT guard to nsvm_efer_svm_enabled
>   macro to return false when nested virt is disabled
> - svm/svm.c: Move #UD injection for STGI/CLGI to the caller instead of
>   stub functions, checking nestedhvm_enabled()/nsvm_efer_svm_enabled()
> - svm/svm.c: Mark svm_vmexit_do_vmrun/vmload/vmsave as __maybe_unused
> - svm/svm.c: Remove empty nsvm_vcpu_switch stub (now guarded in asm)
> - svm/entry.S: Add #ifdef CONFIG_NESTED_VIRT guards around nested virt
>   specific code paths
> - vmx/vmx.c: Remove empty nvmx_switch_guest stub (now guarded in asm)
> - vmx/vmx.c: Move nvmx_enqueue_n2_exceptions and nvmx_vmexit_event to
>   vvmx.c where they belong
> - vmx/vvmx.h: Add declarations for nvmx_vmexit_event and
>   nvmx_enqueue_n2_exceptions
> - vmx/vvmx.h: Fix nvmx_msr_read_intercept stub comment
> - vmx/vvmx.h: nvmx_handle_vmx_insn stub returns X86EMUL_EXCEPTION with
>   ASSERT_UNREACHABLE (caller handles injection)
> - vmx/vvmx.h: Convert get_vvmcs macro to inline function in stubs
> - vmx/entry.S: Add #ifdef CONFIG_NESTED_VIRT guard around nvmx_switch_gue=
st
> - nestedhvm.h: Convert macro stubs to proper inline functions
> ---
>  xen/arch/x86/hvm/Kconfig                 |  7 +++
>  xen/arch/x86/hvm/Makefile                |  2 +-
>  xen/arch/x86/hvm/svm/Makefile            |  2 +-
>  xen/arch/x86/hvm/svm/entry.S             |  4 ++
>  xen/arch/x86/hvm/svm/nestedhvm.h         |  2 +-
>  xen/arch/x86/hvm/svm/svm.c               | 18 ++++--
>  xen/arch/x86/hvm/vmx/Makefile            |  2 +-
>  xen/arch/x86/hvm/vmx/entry.S             |  2 +
>  xen/arch/x86/hvm/vmx/vmx.c               | 31 +---------
>  xen/arch/x86/hvm/vmx/vvmx.c              | 26 +++++++++
>  xen/arch/x86/include/asm/hvm/hvm.h       |  2 +-
>  xen/arch/x86/include/asm/hvm/nestedhvm.h | 64 +++++++++++++++++---
>  xen/arch/x86/include/asm/hvm/vmx/vvmx.h  | 74 ++++++++++++++++++++++++
>  xen/arch/x86/mm/Makefile                 |  2 +-
>  xen/arch/x86/mm/hap/Makefile             |  5 +-
>  xen/arch/x86/mm/p2m.h                    |  6 ++
>  xen/arch/x86/sysctl.c                    |  2 +
>  xen/include/public/sysctl.h              |  4 +-
>  18 files changed, 204 insertions(+), 51 deletions(-)
>
> diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
> index f32bf5cbb7..af661385b5 100644
> --- a/xen/arch/x86/hvm/Kconfig
> +++ b/xen/arch/x86/hvm/Kconfig
> @@ -92,4 +92,11 @@ config MEM_SHARING
>  	bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
>  	depends on INTEL_VMX
> =20
> +config NESTED_VIRT
> +	bool "Nested virtualization support"
> +	depends on HVM
> +	help
> +	  Enable nested virtualization, allowing guests to run their own
> +	  hypervisors. This requires hardware support.

nit: If we state above "allowing HVM guests..." rather than plain "guests" =
we can
then get rid of the "This requires hardware support line". What you probabl=
y
meant is that this is HVM-only and we don't allow PV nesting.

"This requires hardware support" makes me (the user) think my hardware need=
s
something special to support nesting, when in reality I just need HVM suppo=
rt.

> +
>  endif
> diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
> index f34fb03934..b8a0a68624 100644
> --- a/xen/arch/x86/hvm/Makefile
> +++ b/xen/arch/x86/hvm/Makefile
> @@ -18,7 +18,7 @@ obj-y +=3D irq.o
>  obj-y +=3D mmio.o
>  obj-$(CONFIG_VM_EVENT) +=3D monitor.o
>  obj-y +=3D mtrr.o
> -obj-y +=3D nestedhvm.o
> +obj-$(CONFIG_NESTED_VIRT) +=3D nestedhvm.o
>  obj-y +=3D pmtimer.o
>  obj-y +=3D quirks.o
>  obj-y +=3D rtc.o
> diff --git a/xen/arch/x86/hvm/svm/Makefile b/xen/arch/x86/hvm/svm/Makefil=
e
> index 8a072cafd5..92418e3444 100644
> --- a/xen/arch/x86/hvm/svm/Makefile
> +++ b/xen/arch/x86/hvm/svm/Makefile
> @@ -2,6 +2,6 @@ obj-y +=3D asid.o
>  obj-y +=3D emulate.o
>  obj-bin-y +=3D entry.o
>  obj-y +=3D intr.o
> -obj-y +=3D nestedsvm.o
> +obj-$(CONFIG_NESTED_VIRT) +=3D nestedsvm.o
>  obj-y +=3D svm.o
>  obj-y +=3D vmcb.o
> diff --git a/xen/arch/x86/hvm/svm/entry.S b/xen/arch/x86/hvm/svm/entry.S
> index af8db23b03..7964c80750 100644
> --- a/xen/arch/x86/hvm/svm/entry.S
> +++ b/xen/arch/x86/hvm/svm/entry.S
> @@ -28,7 +28,9 @@ FUNC(svm_asm_do_resume)
>          GET_CURRENT(bx)
>  .Lsvm_do_resume:
>          call svm_intr_assist
> +#ifdef CONFIG_NESTED_VIRT
>          call nsvm_vcpu_switch
> +#endif
>          ASSERT_NOT_IN_ATOMIC
> =20
>          mov  VCPU_processor(%rbx),%eax
> @@ -39,6 +41,7 @@ FUNC(svm_asm_do_resume)
>          cmp  %ecx,(%rdx,%rax,1)
>          jne  .Lsvm_process_softirqs
> =20
> +#ifdef CONFIG_NESTED_VIRT
>          cmp  %cl,VCPU_nsvm_hap_enabled(%rbx)
>  UNLIKELY_START(ne, nsvm_hap)
>          cmp  %rcx,VCPU_nhvm_p2m(%rbx)
> @@ -52,6 +55,7 @@ UNLIKELY_START(ne, nsvm_hap)
>          sti
>          jmp  .Lsvm_do_resume
>  __UNLIKELY_END(nsvm_hap)
> +#endif
> =20
>          call svm_vmenter_helper
> =20
> diff --git a/xen/arch/x86/hvm/svm/nestedhvm.h b/xen/arch/x86/hvm/svm/nest=
edhvm.h
> index 9bfed5ffd7..5cb85410f8 100644
> --- a/xen/arch/x86/hvm/svm/nestedhvm.h
> +++ b/xen/arch/x86/hvm/svm/nestedhvm.h
> @@ -24,7 +24,7 @@
> =20
>  /* True when l1 guest enabled SVM in EFER */
>  #define nsvm_efer_svm_enabled(v) \
> -    (!!((v)->arch.hvm.guest_efer & EFER_SVME))
> +    (IS_ENABLED(CONFIG_NESTED_VIRT) && ((v)->arch.hvm.guest_efer & EFER_=
SVME))
> =20
>  int nestedsvm_vmcb_map(struct vcpu *v, uint64_t vmcbaddr);
>  void nestedsvm_vmexit_defer(struct vcpu *v,
> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> index 18ba837738..2cabc89fb5 100644
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -2165,7 +2165,7 @@ static void svm_vmexit_do_pause(struct cpu_user_reg=
s *regs)
>      vcpu_yield();
>  }
> =20
> -static void
> +static void __maybe_unused
>  svm_vmexit_do_vmrun(struct cpu_user_regs *regs,
>                      struct vcpu *v, uint64_t vmcbaddr)
>  {
> @@ -2211,7 +2211,7 @@ nsvm_get_nvmcb_page(struct vcpu *v, uint64_t vmcbad=
dr)
>      return  page;
>  }
> =20
> -static void
> +static void __maybe_unused
>  svm_vmexit_do_vmload(struct vmcb_struct *vmcb,
>                       struct cpu_user_regs *regs,
>                       struct vcpu *v, uint64_t vmcbaddr)
> @@ -2246,7 +2246,7 @@ svm_vmexit_do_vmload(struct vmcb_struct *vmcb,
>      __update_guest_eip(regs, inst_len);
>  }
> =20
> -static void
> +static void __maybe_unused
>  svm_vmexit_do_vmsave(struct vmcb_struct *vmcb,
>                       struct cpu_user_regs *regs,
>                       struct vcpu *v, uint64_t vmcbaddr)
> @@ -2465,6 +2465,7 @@ static struct hvm_function_table __initdata_cf_clob=
ber svm_function_table =3D {
>      .set_rdtsc_exiting    =3D svm_set_rdtsc_exiting,
>      .get_insn_bytes       =3D svm_get_insn_bytes,
> =20
> +#ifdef CONFIG_NESTED_VIRT
>      .nhvm_vcpu_initialise =3D nsvm_vcpu_initialise,
>      .nhvm_vcpu_destroy =3D nsvm_vcpu_destroy,
>      .nhvm_vcpu_reset =3D nsvm_vcpu_reset,
> @@ -2474,6 +2475,7 @@ static struct hvm_function_table __initdata_cf_clob=
ber svm_function_table =3D {
>      .nhvm_vmcx_hap_enabled =3D nsvm_vmcb_hap_enabled,
>      .nhvm_intr_blocked =3D nsvm_intr_blocked,
>      .nhvm_hap_walk_L1_p2m =3D nsvm_hap_walk_L1_p2m,
> +#endif
> =20
>      .get_reg =3D svm_get_reg,
>      .set_reg =3D svm_set_reg,
> @@ -3011,10 +3013,16 @@ void asmlinkage svm_vmexit_handler(void)
>          svm_vmexit_do_vmsave(vmcb, regs, v, regs->rax);
>          break;
>      case VMEXIT_STGI:
> -        svm_vmexit_do_stgi(regs, v);
> +        if ( !nestedhvm_enabled(v->domain) )
> +            hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
> +        else
> +            svm_vmexit_do_stgi(regs, v);
>          break;
>      case VMEXIT_CLGI:
> -        svm_vmexit_do_clgi(regs, v);
> +        if ( !nsvm_efer_svm_enabled(v) )
> +            hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
> +        else
> +            svm_vmexit_do_clgi(regs, v);
>          break;

nit: For readability I'd consider reversing the polarity and putting the en=
abled
cases in the first branch.

> =20
>      case VMEXIT_XSETBV:
> diff --git a/xen/arch/x86/hvm/vmx/Makefile b/xen/arch/x86/hvm/vmx/Makefil=
e
> index 04a29ce59d..902564b3e2 100644
> --- a/xen/arch/x86/hvm/vmx/Makefile
> +++ b/xen/arch/x86/hvm/vmx/Makefile
> @@ -3,4 +3,4 @@ obj-y +=3D intr.o
>  obj-y +=3D realmode.o
>  obj-y +=3D vmcs.o
>  obj-y +=3D vmx.o
> -obj-y +=3D vvmx.o
> +obj-$(CONFIG_NESTED_VIRT) +=3D vvmx.o
> diff --git a/xen/arch/x86/hvm/vmx/entry.S b/xen/arch/x86/hvm/vmx/entry.S
> index 2bfee715b3..4d62efddf4 100644
> --- a/xen/arch/x86/hvm/vmx/entry.S
> +++ b/xen/arch/x86/hvm/vmx/entry.S
> @@ -83,7 +83,9 @@ FUNC(vmx_asm_vmexit_handler)
> =20
>  .Lvmx_do_vmentry:
>          call vmx_intr_assist
> +#ifdef CONFIG_NESTED_VIRT
>          call nvmx_switch_guest
> +#endif
>          ASSERT_NOT_IN_ATOMIC
> =20
>          mov  VCPU_processor(%rbx),%eax
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index 82c55f49ae..4e3c8018d2 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -2014,33 +2014,6 @@ static void cf_check vmx_update_guest_efer(struct =
vcpu *v)
>          vmx_set_msr_intercept(v, MSR_EFER, VMX_MSR_R);
>  }
> =20
> -static void nvmx_enqueue_n2_exceptions(struct vcpu *v,
> -            unsigned long intr_fields, int error_code, uint8_t source)
> -{
> -    struct nestedvmx *nvmx =3D &vcpu_2_nvmx(v);
> -
> -    if ( !(nvmx->intr.intr_info & INTR_INFO_VALID_MASK) ) {
> -        /* enqueue the exception till the VMCS switch back to L1 */
> -        nvmx->intr.intr_info =3D intr_fields;
> -        nvmx->intr.error_code =3D error_code;
> -        nvmx->intr.source =3D source;
> -        vcpu_nestedhvm(v).nv_vmexit_pending =3D 1;
> -        return;
> -    }
> -    else
> -        gdprintk(XENLOG_ERR, "Double Fault on Nested Guest: exception %l=
x %x"
> -                 "on %lx %x\n", intr_fields, error_code,
> -                 nvmx->intr.intr_info, nvmx->intr.error_code);
> -}
> -
> -static int cf_check nvmx_vmexit_event(
> -    struct vcpu *v, const struct x86_event *event)
> -{
> -    nvmx_enqueue_n2_exceptions(v, event->vector, event->error_code,
> -                               hvm_intsrc_none);
> -    return NESTEDHVM_VMEXIT_DONE;
> -}
> -
>  static void __vmx_inject_exception(int trap, int type, int error_code)
>  {
>      unsigned long intr_fields;
> @@ -2933,6 +2906,7 @@ static struct hvm_function_table __initdata_cf_clob=
ber vmx_function_table =3D {
>      .handle_cd            =3D vmx_handle_cd,
>      .set_info_guest       =3D vmx_set_info_guest,
>      .set_rdtsc_exiting    =3D vmx_set_rdtsc_exiting,
> +#ifdef CONFIG_NESTED_VIRT
>      .nhvm_vcpu_initialise =3D nvmx_vcpu_initialise,
>      .nhvm_vcpu_destroy    =3D nvmx_vcpu_destroy,
>      .nhvm_vcpu_reset      =3D nvmx_vcpu_reset,
> @@ -2942,8 +2916,9 @@ static struct hvm_function_table __initdata_cf_clob=
ber vmx_function_table =3D {
>      .nhvm_vcpu_vmexit_event =3D nvmx_vmexit_event,
>      .nhvm_intr_blocked    =3D nvmx_intr_blocked,
>      .nhvm_domain_relinquish_resources =3D nvmx_domain_relinquish_resourc=
es,
> -    .update_vlapic_mode =3D vmx_vlapic_msr_changed,
>      .nhvm_hap_walk_L1_p2m =3D nvmx_hap_walk_L1_p2m,
> +#endif
> +    .update_vlapic_mode =3D vmx_vlapic_msr_changed,
>  #ifdef CONFIG_VM_EVENT
>      .enable_msr_interception =3D vmx_enable_msr_interception,
>  #endif
> diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
> index 38952f0696..2bb42678c5 100644
> --- a/xen/arch/x86/hvm/vmx/vvmx.c
> +++ b/xen/arch/x86/hvm/vmx/vvmx.c
> @@ -2821,6 +2821,32 @@ void nvmx_set_cr_read_shadow(struct vcpu *v, unsig=
ned int cr)
>      __vmwrite(read_shadow_field, v->arch.hvm.nvcpu.guest_cr[cr]);
>  }
> =20
> +void nvmx_enqueue_n2_exceptions(struct vcpu *v,
> +            unsigned long intr_fields, int error_code, uint8_t source)
> +{
> +    struct nestedvmx *nvmx =3D &vcpu_2_nvmx(v);
> +
> +    if ( !(nvmx->intr.intr_info & INTR_INFO_VALID_MASK) ) {
> +        /* enqueue the exception till the VMCS switch back to L1 */
> +        nvmx->intr.intr_info =3D intr_fields;
> +        nvmx->intr.error_code =3D error_code;
> +        nvmx->intr.source =3D source;
> +        vcpu_nestedhvm(v).nv_vmexit_pending =3D 1;
> +        return;
> +    }
> +    else
> +        gdprintk(XENLOG_ERR, "Double Fault on Nested Guest: exception %l=
x %x"
> +                 "on %lx %x\n", intr_fields, error_code,
> +                 nvmx->intr.intr_info, nvmx->intr.error_code);
> +}
> +
> +int cf_check nvmx_vmexit_event(struct vcpu *v, const struct x86_event *e=
vent)
> +{
> +    nvmx_enqueue_n2_exceptions(v, event->vector, event->error_code,
> +                               hvm_intsrc_none);
> +    return NESTEDHVM_VMEXIT_DONE;
> +}
> +
>  void __init start_nested_vmx(struct hvm_function_table *hvm_function_tab=
le)
>  {
>      /* TODO: Require hardware support before enabling nested virt */
> diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/as=
m/hvm/hvm.h
> index 7d9774df59..536a38b450 100644
> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> @@ -711,7 +711,7 @@ static inline bool hvm_altp2m_supported(void)
>  /* Returns true if we have the minimum hardware requirements for nested =
virt */
>  static inline bool hvm_nested_virt_supported(void)
>  {
> -    return hvm_funcs.caps.nested_virt;
> +    return IS_ENABLED(CONFIG_NESTED_VIRT) && hvm_funcs.caps.nested_virt;
>  }
> =20
>  #ifdef CONFIG_ALTP2M
> diff --git a/xen/arch/x86/include/asm/hvm/nestedhvm.h b/xen/arch/x86/incl=
ude/asm/hvm/nestedhvm.h
> index ea2c1bc328..2f8209271a 100644
> --- a/xen/arch/x86/include/asm/hvm/nestedhvm.h
> +++ b/xen/arch/x86/include/asm/hvm/nestedhvm.h
> @@ -25,9 +25,21 @@ enum nestedhvm_vmexits {
>  /* Nested HVM on/off per domain */
>  static inline bool nestedhvm_enabled(const struct domain *d)
>  {
> -    return IS_ENABLED(CONFIG_HVM) && (d->options & XEN_DOMCTL_CDF_nested=
_virt);
> +    return IS_ENABLED(CONFIG_NESTED_VIRT) &&
> +           (d->options & XEN_DOMCTL_CDF_nested_virt);
>  }
> =20
> +/* Nested paging */
> +#define NESTEDHVM_PAGEFAULT_DONE       0
> +#define NESTEDHVM_PAGEFAULT_INJECT     1
> +#define NESTEDHVM_PAGEFAULT_L1_ERROR   2
> +#define NESTEDHVM_PAGEFAULT_L0_ERROR   3
> +#define NESTEDHVM_PAGEFAULT_MMIO       4
> +#define NESTEDHVM_PAGEFAULT_RETRY      5
> +#define NESTEDHVM_PAGEFAULT_DIRECT_MMIO 6
> +
> +#ifdef CONFIG_NESTED_VIRT
> +
>  /* Nested VCPU */
>  int nestedhvm_vcpu_initialise(struct vcpu *v);
>  void nestedhvm_vcpu_destroy(struct vcpu *v);
> @@ -38,14 +50,6 @@ bool nestedhvm_vcpu_in_guestmode(struct vcpu *v);
>  #define nestedhvm_vcpu_exit_guestmode(v)  \
>      vcpu_nestedhvm(v).nv_guestmode =3D 0
> =20
> -/* Nested paging */
> -#define NESTEDHVM_PAGEFAULT_DONE       0
> -#define NESTEDHVM_PAGEFAULT_INJECT     1
> -#define NESTEDHVM_PAGEFAULT_L1_ERROR   2
> -#define NESTEDHVM_PAGEFAULT_L0_ERROR   3
> -#define NESTEDHVM_PAGEFAULT_MMIO       4
> -#define NESTEDHVM_PAGEFAULT_RETRY      5
> -#define NESTEDHVM_PAGEFAULT_DIRECT_MMIO 6
>  int nestedhvm_hap_nested_page_fault(struct vcpu *v, paddr_t *L2_gpa,
>                                      struct npfec npfec);
> =20
> @@ -59,6 +63,48 @@ unsigned long *nestedhvm_vcpu_iomap_get(bool ioport_80=
, bool ioport_ed);
> =20
>  void nestedhvm_vmcx_flushtlb(struct p2m_domain *p2m);
> =20
> +#else /* !CONFIG_NESTED_VIRT */

There's a lot more stubs than needed here.

> +
> +static inline int nestedhvm_vcpu_initialise(struct vcpu *v)
> +{
> +    ASSERT_UNREACHABLE();
> +    return -EOPNOTSUPP;
> +}

Can remove.

> +static inline void nestedhvm_vcpu_destroy(struct vcpu *v) { }

Must stay.

> +static inline void nestedhvm_vcpu_reset(struct vcpu *v)
> +{
> +    ASSERT_UNREACHABLE();
> +}

Can remove.

> +static inline bool nestedhvm_vcpu_in_guestmode(struct vcpu *v) { return =
false; }

Must stay.

> +static inline int nestedhvm_hap_nested_page_fault(struct vcpu *v, paddr_=
t *L2_gpa,
> +                                                  struct npfec npfec)
> +{
> +    ASSERT_UNREACHABLE();
> +    return NESTEDHVM_PAGEFAULT_L0_ERROR;
> +}

Can remove

> +static inline void nestedhvm_vcpu_enter_guestmode(struct vcpu *v)
> +{
> +    ASSERT_UNREACHABLE();
> +}
> +static inline void nestedhvm_vcpu_exit_guestmode(struct vcpu *v)
> +{
> +    ASSERT_UNREACHABLE();
> +}

These two can be removed. It might be good to keep the real macros hidden u=
nder
CONFIG_NESTED_VIRT though to ensure they can't be called.

> +static inline bool nestedhvm_paging_mode_hap(struct vcpu *v)
> +{
> +    return false;
> +}

This can be removed with a cleaner IS_ENABLED() check in nhvm_vmcx_hap_enab=
led()

> +static inline bool nestedhvm_vmswitch_in_progress(struct vcpu *v)
> +{
> +    return false;
> +}

Would be cleaner with an IS_ENABLED() check in the macro itself, IMO.

> +static inline void nestedhvm_vmcx_flushtlb(struct p2m_domain *p2m)
> +{
> +    ASSERT_UNREACHABLE();
> +}

Can remove.

> +
> +#endif /* CONFIG_NESTED_VIRT */
> +
>  static inline bool nestedhvm_is_n2(struct vcpu *v)
>  {
>      if ( !nestedhvm_enabled(v->domain) ||
> diff --git a/xen/arch/x86/include/asm/hvm/vmx/vvmx.h b/xen/arch/x86/inclu=
de/asm/hvm/vmx/vvmx.h
> index da10d3fa96..d0c1ae29f6 100644
> --- a/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
> +++ b/xen/arch/x86/include/asm/hvm/vmx/vvmx.h

Most stubs in this header aren't needed.

You only need nvmx_cpu_up(), nvmx_cpu_dead(), nvmx_msr_read_intercept() and
nvmx_handle_insn(). There's also a bug in that last one...

> @@ -73,6 +73,8 @@ union vmx_inst_info {
>      u32 word;
>  };
> =20
> +#ifdef CONFIG_NESTED_VIRT
> +
>  int cf_check nvmx_vcpu_initialise(struct vcpu *v);
>  void cf_check nvmx_vcpu_destroy(struct vcpu *v);
>  int cf_check nvmx_vcpu_reset(struct vcpu *v);
> @@ -199,5 +201,77 @@ int nept_translate_l2ga(struct vcpu *v, paddr_t l2ga=
,
>                          uint64_t *exit_qual, uint32_t *exit_reason);
>  int nvmx_cpu_up_prepare(unsigned int cpu);
>  void nvmx_cpu_dead(unsigned int cpu);
> +int cf_check nvmx_vmexit_event(struct vcpu *v, const struct x86_event *e=
vent);
> +void nvmx_enqueue_n2_exceptions(struct vcpu *v,
> +            unsigned long intr_fields, int error_code, uint8_t source);
> +
> +#else /* !CONFIG_NESTED_VIRT */
> +
> +static inline void nvmx_update_exec_control(struct vcpu *v, u32 value)
> +{
> +    ASSERT_UNREACHABLE();
> +}
> +static inline void nvmx_update_secondary_exec_control(struct vcpu *v,
> +                                                      unsigned long valu=
e)
> +{
> +    ASSERT_UNREACHABLE();
> +}
> +static inline void nvmx_update_exception_bitmap(struct vcpu *v,
> +                                                unsigned long value)
> +{
> +    ASSERT_UNREACHABLE();
> +}
> +static inline u64 nvmx_get_tsc_offset(struct vcpu *v)
> +{
> +    ASSERT_UNREACHABLE();
> +    return 0;
> +}
> +static inline void nvmx_set_cr_read_shadow(struct vcpu *v, unsigned int =
cr)
> +{
> +    ASSERT_UNREACHABLE();
> +}
> +static inline bool nvmx_intercepts_exception(struct vcpu *v, unsigned in=
t vector,
> +                                             int error_code)
> +{
> +    ASSERT_UNREACHABLE();
> +    return false;
> +}
> +static inline int nvmx_n2_vmexit_handler(struct cpu_user_regs *regs,
> +                                         unsigned int exit_reason)
> +{
> +    ASSERT_UNREACHABLE();
> +    return 0;
> +}
> +static inline void nvmx_idtv_handling(void)
> +{
> +    ASSERT_UNREACHABLE();
> +}
> +static inline int nvmx_msr_read_intercept(unsigned int msr, u64 *msr_con=
tent)
> +{
> +    /* return 0 to trigger #GP */
> +    return 0;
> +}
> +static inline int nvmx_handle_vmx_insn(struct cpu_user_regs *regs,
> +                                       unsigned int exit_reason)
> +{
> +    ASSERT_UNREACHABLE();
> +    return X86EMUL_EXCEPTION;
> +}

... here. This is perfectly reachable and will cause a hypervisor crash sho=
uld
an L1 try to probe the VMX-family of instructions. Even on realease this wo=
uld
behave very oddly because you're missing injecting #UD. This stub should be=
:

        hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
        return X86EMUL_EXCEPTION;

> +static inline int nvmx_cpu_up_prepare(unsigned int cpu) { return 0; }
> +static inline void nvmx_cpu_dead(unsigned int cpu) { }
> +static inline void nvmx_enqueue_n2_exceptions(struct vcpu *v,
> +            unsigned long intr_fields, int error_code, uint8_t source)
> +{
> +    ASSERT_UNREACHABLE();
> +}
> +
> +static inline u64 get_vvmcs(const struct vcpu *vcpu, u32 encoding)
> +{
> +    ASSERT_UNREACHABLE();
> +    return 0;
> +}
> +
> +#endif /* CONFIG_NESTED_VIRT */
> +
>  #endif /* __ASM_X86_HVM_VVMX_H__ */
> =20
> diff --git a/xen/arch/x86/mm/Makefile b/xen/arch/x86/mm/Makefile
> index 960f6e8409..aa15811c2e 100644
> --- a/xen/arch/x86/mm/Makefile
> +++ b/xen/arch/x86/mm/Makefile
> @@ -7,7 +7,7 @@ obj-$(CONFIG_SHADOW_PAGING) +=3D guest_walk_4.o
>  obj-$(CONFIG_VM_EVENT) +=3D mem_access.o
>  obj-$(CONFIG_MEM_PAGING) +=3D mem_paging.o
>  obj-$(CONFIG_MEM_SHARING) +=3D mem_sharing.o
> -obj-$(CONFIG_HVM) +=3D nested.o
> +obj-$(CONFIG_NESTED_VIRT) +=3D nested.o
>  obj-$(CONFIG_HVM) +=3D p2m.o
>  obj-y +=3D p2m-basic.o
>  obj-$(CONFIG_INTEL_VMX) +=3D p2m-ept.o
> diff --git a/xen/arch/x86/mm/hap/Makefile b/xen/arch/x86/mm/hap/Makefile
> index 67c29b2162..efdc91ea82 100644
> --- a/xen/arch/x86/mm/hap/Makefile
> +++ b/xen/arch/x86/mm/hap/Makefile
> @@ -2,5 +2,6 @@ obj-y +=3D hap.o
>  obj-y +=3D guest_walk_2.o
>  obj-y +=3D guest_walk_3.o
>  obj-y +=3D guest_walk_4.o
> -obj-y +=3D nested_hap.o
> -obj-$(CONFIG_INTEL_VMX) +=3D nested_ept.o
> +nested-y :=3D nested_hap.o
> +nested-$(CONFIG_INTEL_VMX) +=3D nested_ept.o
> +obj-$(CONFIG_NESTED_VIRT) +=3D $(nested-y)

Why not use plain filter?

	-obj-y +=3D nested_hap.o
	+obj-$(CONFIG_NESTED_VIRT) +=3D nested_hap.o
	-obj-$(CONFIG_INTEL_VMX) +=3D nested_ept.o
	+obj-$(filter $(CONFIG_NESTED_VIRT),$(CONFIG_INTEL_VMX)) +=3D nested_ept.o

> diff --git a/xen/arch/x86/mm/p2m.h b/xen/arch/x86/mm/p2m.h
> index 635f5a7f45..63808dddcc 100644
> --- a/xen/arch/x86/mm/p2m.h
> +++ b/xen/arch/x86/mm/p2m.h
> @@ -25,9 +25,15 @@ void p2m_teardown_altp2m(struct domain *d);
>  void p2m_flush_table_locked(struct p2m_domain *p2m);
>  int __must_check p2m_remove_entry(struct p2m_domain *p2m, gfn_t gfn, mfn=
_t mfn,
>                                    unsigned int page_order);
> +#ifdef CONFIG_NESTED_VIRT
>  void p2m_nestedp2m_init(struct p2m_domain *p2m);
>  int p2m_init_nestedp2m(struct domain *d);
>  void p2m_teardown_nestedp2m(struct domain *d);
> +#else
> +static inline void p2m_nestedp2m_init(struct p2m_domain *p2m) { }
> +static inline int p2m_init_nestedp2m(struct domain *d) { return 0; }
> +static inline void p2m_teardown_nestedp2m(struct domain *d) { }
> +#endif

Seeing how there's a single callsite I'd rather see those callsites check f=
or
IS_ENABLED(), I think.

> =20
>  int ept_p2m_init(struct p2m_domain *p2m);
>  void ept_p2m_uninit(struct p2m_domain *p2m);
> diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
> index 1b04947516..b1d865e1c8 100644
> --- a/xen/arch/x86/sysctl.c
> +++ b/xen/arch/x86/sysctl.c
> @@ -103,6 +103,8 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>          pi->capabilities |=3D XEN_SYSCTL_PHYSCAP_hap;
>      if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
>          pi->capabilities |=3D XEN_SYSCTL_PHYSCAP_shadow;
> +    if ( hvm_nested_virt_supported() )
> +        pi->capabilities |=3D XEN_SYSCTL_PHYSCAP_nestedhvm;
>  }
> =20
>  long arch_do_sysctl(
> diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
> index 66c9b65465..b4bd1dd7b2 100644
> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -100,9 +100,11 @@ struct xen_sysctl_tbuf_op {
>  /* Xen supports the Grant v1 and/or v2 ABIs. */
>  #define XEN_SYSCTL_PHYSCAP_gnttab_v1     (1u << 8)
>  #define XEN_SYSCTL_PHYSCAP_gnttab_v2     (1u << 9)
> +/* The platform supports nested HVM. */
> +#define XEN_SYSCTL_PHYSCAP_nestedhvm     (1u << 10)
> =20
>  /* Max XEN_SYSCTL_PHYSCAP_* constant.  Used for ABI checking. */
> -#define XEN_SYSCTL_PHYSCAP_MAX XEN_SYSCTL_PHYSCAP_gnttab_v2
> +#define XEN_SYSCTL_PHYSCAP_MAX XEN_SYSCTL_PHYSCAP_nestedhvm
> =20
>  #if defined(__arm__) || defined(__aarch64__)
>  #define XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK  (0x1FU)

Cheers,
Alejandro


