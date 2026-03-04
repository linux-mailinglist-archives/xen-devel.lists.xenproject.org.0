Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCa5F19SqGnUtAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 16:40:15 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6EE202F6E
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 16:40:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245666.1545018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxoKN-0008Nw-O4; Wed, 04 Mar 2026 15:39:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245666.1545018; Wed, 04 Mar 2026 15:39:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxoKN-0008LS-LE; Wed, 04 Mar 2026 15:39:59 +0000
Received: by outflank-mailman (input) for mailman id 1245666;
 Wed, 04 Mar 2026 15:39:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hSGG=BE=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1vxoKM-0007O5-0L
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 15:39:58 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 650a4211-17e0-11f1-b164-2bf370ae4941;
 Wed, 04 Mar 2026 16:39:57 +0100 (CET)
Received: from BN1PR13CA0012.namprd13.prod.outlook.com (2603:10b6:408:e2::17)
 by PH7PR12MB6537.namprd12.prod.outlook.com (2603:10b6:510:1f2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 15:39:44 +0000
Received: from BN2PEPF000044A1.namprd02.prod.outlook.com
 (2603:10b6:408:e2:cafe::ba) by BN1PR13CA0012.outlook.office365.com
 (2603:10b6:408:e2::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Wed,
 4 Mar 2026 15:39:44 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000044A1.mail.protection.outlook.com (10.167.243.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 4 Mar 2026 15:39:44 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 4 Mar
 2026 09:39:44 -0600
Received: from [172.30.142.83] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 4 Mar 2026 09:39:43 -0600
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
X-Inumbo-ID: 650a4211-17e0-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uFdiVgCPP+aJXFZ02qJTAAqeW8c2H19VtiZJsPyI2iejWuJnVeB4LAZbOjjOBt1tk9risT2wXfw+4NXYB6K8POqueW+QYQ0DOQBeE1suhiL7SuVIsEtMdbtfM2pcip0POoZXUVWGpduaD2Gj4ebiTwr/OzRbbdPOkjgg2srJExbRRtV+EqPkVTbfxs+xuiu1aWdL0zHUfulMjvdM1H/Eh9eqMwjKK3qgc46mHJF8QcTo8NqHhwi4B3DEVDlzXpJgZvbJuLs54lDnFBwJnlLTurDbyOWbce1Uk1tDIPz5PWdcBY69bZ1h3WAQto1MGddlGVqRIsnbYKSJq0fPAoLeXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vyhb4HtPgNTNTQK78/KCtQ5UY9dl0XWdx5R5IX5sM0k=;
 b=d+MKV2m4MoyiZ3gDmY2vQt6khSc84sFyeFt33YUbQMhff2erIxpiHao0g92hkqDJHBvsra9p7+lHvutMzkcS9/MwiEL/sAMolhUS707pIZ5jVM8SoVtDX4I3F4iPK10sd4DKv9O1saxDmKJ8GXdtE5wLMNQUI90lwcsyjbO2wUKMHpRS95NcVTDt8Cr4GKAut2oZ9bh3aFqXVU2NwjgJ3alpspJskKhDlMv7W3w3LeKWjQX+Q45ZRnRm24CGLkey1IIgf306vXv60aiR9xeoMjw7cJPyIj4B9MLvIUP9vPLkroIS2u3j2qfjrzpjurN98kjVI+Kw4IFOSHJIXwpWLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vyhb4HtPgNTNTQK78/KCtQ5UY9dl0XWdx5R5IX5sM0k=;
 b=jCH8dGSjyHX5Zcqmcl49Vf/0rVEV3y3w406+bFdOMLoTlOJJgvwbaRyqdhVHE+XPfthFSNUDRm515i03CTXC3JoCOdWSNzjOiwA2eaP1gJoC95jrb1OywchU8hT1aXzio2qHyLJ/yu/zQqVSEY53D7wIa5FByRPTKPFk9ESm3Vo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <1e62a5ad-f865-4477-a899-0182dec38901@amd.com>
Date: Wed, 4 Mar 2026 10:39:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] vpci/msix: check for BARs enabled in
 vpci_make_msix_hole
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>
References: <20260226025740.71673-1-stewart.hildebrand@amd.com>
 <aahOeefbhHq7IZZx@macbook.local>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <aahOeefbhHq7IZZx@macbook.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A1:EE_|PH7PR12MB6537:EE_
X-MS-Office365-Filtering-Correlation-Id: e4fae744-d7c8-458e-7712-08de7a04426f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	WBTAJ5+1pojhYvufmg98sWm9Mhj5Q2MtEQETyeIszx3yuBJaUOdrq/ry1hGUwxB61lmn1msm+WxuPEOqH9a2zfgMBFxCKHwyJF3z3aswhk/wmiD68o7g7q/sgKGryZ+dF0+yhzTe5nIQBX1fuzxCrtxyNO6dHGh1S98r8ZsS8o6AT93B0e0rMLEQW+Okpn6KM2USj2oIYjLhPytCSPLvJo8tWNVvvlouWwxys5lVhOJIdVstbBd60gzFA6H3q8h+yClRtNro7s1RFU14jhvvNaLlygOhmzmc8RudxIL8TH7Kk81+pxN7Ad5hd3u6enJrKKToCf+k9/3RjVQDunMuRzjhU/ypdOss8v8Ke5HOCogSD+kLZDlfGBERCUuBnZelPrTGYC1tNy85Lzc2+Bat0/pqsR3rALYq4kGUuInoqOMT/dSOOgcV+Aqylw6Yis7PmWKwoawcMcrozrKWAlMvpeAGgw9n2+SuONgw5aWtb23QqVBaZVVn0KrjTrDER3nBpb0zi2y9n3slRYZ4MhIBRTJSmqTg1PwgUe0ik+q1wfuaHza8l8nOqKBPOTx0f2CXTUGXJKXEN7k1szUEG8nhTvg8kEtGZBx08fngWk7+LKP+vyMeSQVwKjtW7U4e1lpLriMiIZskZTCqtgLVU6W4lLF5oeQhZTlDbSQNd1sd0h75XAPqC45B5gVFbF5IwGfHfG4Dr/O9H4R9kr+uOIp1tn7nBweIvcw/Ii3c0OtjtUEraf34m0tbIRMpuX7pV7EqmEnnvQfka1houfRKs6w0eg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hMlB5XsJDpeXmQ7Y0emgf4yyzgUsNT7QJSjwIKv6lXJt5BnL8/BGjZytkSbaJP+IuixYg7oP9P99EoGumHwRtztasDMKkkCG9j611wTDjDWyDv+7//13dHwU33qpBCdzjjVUKWzZA6UF7z0ckYzttadS4eIFsKsKowixpXEPiZZjXh2F0nnt9Z6xDX3dGwn5hHoKLzRwwouooTpe0ytEbYfoSOMyvACXhlffJThKpRi7FPQAOrO+fhvfSBOHRYJUVUUgm7j6+++9enn01lYeAE49hox7R39phAilLvLomF9RNmO0MHlpPsFD14w/uJA8j5abbXdzn1JFjyKARQE0pIeKb0LdqfjjWWY1FXLN1keCuGRTUcqQTf76tqxrz6B0J85I3KXieMi6bS8mbzRkorbm9jWdjxYWQcNLjY3AtAXp9ReiWJGRyP0i6RZmTYoh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 15:39:44.5827
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4fae744-d7c8-458e-7712-08de7a04426f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6537
X-Rspamd-Queue-Id: CA6EE202F6E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo,amd.com:dkim,amd.com:email,amd.com:mid];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Action: no action

On 3/4/26 10:23, Roger Pau Monné wrote:
> On Wed, Feb 25, 2026 at 09:57:38PM -0500, Stewart Hildebrand wrote:
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
>> As a result of the newly introduced checks in vpci_make_msix_hole(),
>> move the call to vpci_make_msix_hole() within modify_decoding() to after
>> setting ->enabled.
>>
>> Fixes: ee2eb6849d50 ("vpci: Refactor REGISTER_VPCI_INIT")
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.

Thanks!

I would like to point out that this now needs a rebase:
The helper vmsix_table_bar_valid() should be moved to the new private.h.
I'd be happy to send v4, assuming I can retain your R-b.

