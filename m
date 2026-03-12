Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DKAMEDksmnyQgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 17:05:20 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B0F2752A5
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 17:05:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252673.1549283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0iXB-00076K-4d; Thu, 12 Mar 2026 16:05:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252673.1549283; Thu, 12 Mar 2026 16:05:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0iXB-00074f-1A; Thu, 12 Mar 2026 16:05:13 +0000
Received: by outflank-mailman (input) for mailman id 1252673;
 Thu, 12 Mar 2026 16:05:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=17Qz=BM=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1w0iXA-00071k-25
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 16:05:12 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c294d73-1e2d-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Mar 2026 17:05:06 +0100 (CET)
Received: from CH5P220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::11)
 by CY8PR12MB8340.namprd12.prod.outlook.com (2603:10b6:930:7a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Thu, 12 Mar
 2026 16:05:01 +0000
Received: from CH1PEPF0000AD83.namprd04.prod.outlook.com
 (2603:10b6:610:1ef:cafe::d6) by CH5P220CA0009.outlook.office365.com
 (2603:10b6:610:1ef::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.28 via Frontend Transport; Thu,
 12 Mar 2026 16:04:57 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD83.mail.protection.outlook.com (10.167.244.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 12 Mar 2026 16:05:00 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 12 Mar
 2026 11:04:49 -0500
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
X-Inumbo-ID: 3c294d73-1e2d-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l7WcySXcTTbN9DIT3WRgV1dLrSnat9fwtgaLHxGyVjypOnF/oB2QFOpceOVjjj7vRHSXytN699v/PYh+ES3WO+EDT0d5lpCo3dN9aTexC+O2nwAN9rosVHGFviLZtUmh2NNTKnblS+nIZvVQufJyoe7v8RokWNlUFRQkMidzPnRsw0Lf/B6F+1N+dfanmAzSIRa/35b566AgPzIq/8AB5kVEO7rkTJcKTIyfSQEnv9pxMEcdMT0R1ZIEazhmO5X140Jqyji3cVg9YMZbE7GLU/+ZhydLlP0i/qt6XvlOedkuF9I+NvZCxLhT7LtTQl7/njdZoHVNcfU+fslMUBPkUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTafdTz+0ZZlyxfGtijQUxFXhgBLGfhYtTNqWiEj30w=;
 b=Vp8l3lap3/LvOjEIaym0E5SFbfvwFct/aLTuoJsqFaJGXHuiPBykH5Yll+4WZAbXoXuECcEjJzWfgQL3P0LqyeQx+3v08FTmW+s6AIoq4EBjwbIUDYj4bsCo1gWmDd5sXTd97QbJRVq1eml85WuQw4FP6WnAxzInRjaxjpRTp2q1xCsLgvI8HvAe4sZSeKChI5aAdNqGvJuHiYT7rAoPLJIHUkKTkUu0mZ1NbOHIdbhx5Jr8/guSnLtTZAT/ZgGfZiBfSIBarEetmnYhU6iBxAPCn1kU/uJOmEShk0zecmIE/LW3jiAVgANnWpkhFG0aP11UlQ4aIDzHS47LPTUDrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTafdTz+0ZZlyxfGtijQUxFXhgBLGfhYtTNqWiEj30w=;
 b=u4PXBCsLrGkZpe9ui5H9h525FnFv51/LowQAvgIhk+8vm3uVKz/MDTQR8PQK6YhDBApHCAPJUl32PI9uHdiuIadjo7ulXUpiYH/wdMAAV+Q8HMWV8DkvFmAq7iv/Uc8I4lDsil6jSyb26LpJDmy0ZISvWUAkSffAZy4TQYn5VAc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 12 Mar 2026 17:04:48 +0100
Message-ID: <DH0XJR5GSRRF.1MP31OHI1BLQW@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5 6/5] x86/hvm: Add a non-FEP path to the #UD handler
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20260312112116.22563-1-alejandro.garciavallejo@amd.com>
 <20260312134731.38475-1-alejandro.garciavallejo@amd.com>
 <d4f81997-5e4d-4d7c-ac11-6961145e6420@suse.com>
In-Reply-To: <d4f81997-5e4d-4d7c-ac11-6961145e6420@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD83:EE_|CY8PR12MB8340:EE_
X-MS-Office365-Filtering-Correlation-Id: e8df37f3-e52b-4d13-74f4-08de80511d99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	McfsJPDci551miOer0doj84kSbgey1USkxKC5FNlK9Pz6+0fkrNDfrM5RQpXQiEajreY6tZjcd1nWPJK2o5mC7ZCZvO+gNJcAlUyxgcGNeoeZagyQ0lqPcuRUPlnzfer4q+S/VURESGuuSRQhgeAX/nl8Ll/7lZyqAMnUtOtGMbm5/8UzW2uPD1aux3ZUvHTN5VIcoIdvELoLCC+vEco6M1Wx809+P9ZPcwnakrGu7fGjJbE7GISZcsVGfmdjxA5kKbmQVJtknI3TFX+sqBEdjur7XfAnEXSXy3MuBnLRZEGHkJkQp1lZjzeGUJIs7hLJ+Jj/u2un+7v0RREvt2TUb8gBkuNgf6ef38laVaIbSSoKMWomMNvf6LsRYOz8y4OBhR3XF2V40tL7bJBj7VgTNC/Rjc+L0i4hEpuk/RjtiwQsOPF+k2JKw9NWbz3qh4z3T5NA/awbJBexxFCqq8iM1dLWkgXdlIbrcsRLPxooFEwB74aapabA3bkl+WW4RPgCGfoY5VoldWtaNXO5vwgyUVTp5x8YUBBFg2eOo6cKBJjLDpCtlHZi4/BKA2LN2oYthcwTx0OMpfaf8I6qocCRYcSL5b0BGzWbrIu06pX8nmeC6XyWw3ohlAsWNLbA9Qd5AqAl4UU1xctb95fiRTlJpZ1wsbo+e39WRpQXPqce3qwjUANXbfoGQtEJV1OtThfjmiFd8zRRNxPc69pS95cMUz7DrMMjO/9h1r6Le1wDlulGy4pUB9H3oAGkNAzC/J35MtTnFMwtWsKjXqn2ElV+Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mRm3z4yx996SywpvjRgOyOGFof+oJbaIUzcosQKVHpDMA2/AAVA/uOsWQoJRJjY7G8gj0RvzsbrbSqkAXkICn+EDKHUv7+Z1NacTP7wrlfbTJFoHWHTyFthuHSMwa/8cJLUDD9ZkJmlfZIe/S/fHCbHwKnTMvGL0NoZpOs/9EDeCiIwBShQttJaIB7UMTGMSwshA8OBfr0AA+Cn8K55qzNFkO0Z6jOXHtcSln2fjlQH9arETeivqgvkf/8sKkD7iogYdITUksBBuyxyEHn7mN/X6LGkdamPjCh3McnvM6kjdoWM6cE1tjXEqHxxIemPt2FN6v0d9GBDwWqd6atHHrYwtSDQ/RvwH8ACuOdssvpy4VjMXRfAYdNU4TajADY58vN/MjYgeNGSSq3MxexBgjCRbvl54AjSFm9fxDcaprJbDhIwPqG/WPG40hIYc8A36
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 16:05:00.9939
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8df37f3-e52b-4d13-74f4-08de80511d99
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD83.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8340
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:dkim,amd.com:mid];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 34B0F2752A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu Mar 12, 2026 at 4:24 PM CET, Jan Beulich wrote:
> On 12.03.2026 14:45, Alejandro Vallejo wrote:
>> While the #UD handler is dead code when CONFIG_HVM_FEP is disabled it's
>> helpful to keep the function around. Reinject #UD in the non-FEP case so
>> DCE can remove the rest.
>
> For the code change - I don't think this should be a separate change. I a=
lso
> didn't understand Andrew's earlier request to split the original change t=
o
> go this far.

I don't mind either way. Fold it with the prior patch if you think it's bet=
ter
that way.

>
> As to the "dead code" aspect (using Misra terminology it's really
> "unreachable code" aiui), we may need to deal with that, as we've accepte=
d
> that rule. Yes, Eclair is unlikely to be able to spot this, yet that does=
n't
> make the issue go away.

That's also the case for handlers of other VMEXIT error codes under certain
configurations. The original patch I sent fully removed the #UD handler to
restrict the unreachable part to just a BUG_ON(). But even that was incompl=
ete.

The solution is some creative filtering at the switch condition, but that's
something I haven't had time to experiment with yet.

Cheers,
Alejandro

