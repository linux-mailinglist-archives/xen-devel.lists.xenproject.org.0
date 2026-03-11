Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uN7AKjY6sWkLswIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 10:47:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20772261278
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 10:47:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250933.1548265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0G9f-0002ld-Rz; Wed, 11 Mar 2026 09:47:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250933.1548265; Wed, 11 Mar 2026 09:47:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0G9f-0002ic-P6; Wed, 11 Mar 2026 09:47:03 +0000
Received: by outflank-mailman (input) for mailman id 1250933;
 Wed, 11 Mar 2026 09:47:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tK7a=BL=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1w0G9e-0002iW-1U
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2026 09:47:02 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3cc6c822-1d2f-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Mar 2026 10:46:56 +0100 (CET)
Received: from PH7P220CA0037.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::18)
 by PH7PR12MB8013.namprd12.prod.outlook.com (2603:10b6:510:27c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 09:46:49 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:510:32b:cafe::5d) by PH7P220CA0037.outlook.office365.com
 (2603:10b6:510:32b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.26 via Frontend Transport; Wed,
 11 Mar 2026 09:46:41 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 09:46:49 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 11 Mar
 2026 04:46:47 -0500
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
X-Inumbo-ID: 3cc6c822-1d2f-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h/+Vh5vxcPm3l8Yi9/0YorOu59+YBnYLadj3O5OnrML1pCTeiZjT2IcT2S5hTLEwgvolc96cbwe/oKrX5ImjG670aMEv20ogHXmnSw+ZADUaZzixmQg48w5/CcnrVTj/NcsZlVRMTBe2ZrcAKYROvVjVQkTxW3jLOqtdphKSWrR+9Sn7C7krI05cuXI/4oz/c3//HcfLmy7Py/RAfHCkIOtUTFjds9D4YpwvpAy7wH4XQS74073ZvG7LOYmNPhlfzDdFvPKAB72Yd+MUz5mAzY5PiIkCMWguQm6TnNPqMPO6V5eFaJ3AeRLychvdYGjdHvPMKnBY3uXTKGyC/nBK+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ghnJIzHCBfPPb7PJGOHx3Jgoqqxk8PgvNWQy+vwhnPM=;
 b=R8YJ9cyZ5DdklpVUy3Y+g2Ke7+hZDgCkh6i6uQJtKsFTWCXKdUCoQj87D0oap4g9fHX9lBx6ikEwQrPMKreSUc3LCZcwcsQ0uDiQDy7i2VNKshXbDpf+rnADFvTf6M2w0+oemSNS5dhUWMfIBQk5hvvKGA8ntOwvTePDrSjwxWfAojsukvo2gBIoqdusCaosMo+Sa29aah8hARouCtPoy12BZGjBQpCZhXH+L/6OTidA3+M2aRZs9MahP+gZHRNAgK1mkj1dHLDcdkE9TsbgrhBsn0dHyyXOSxxJyDNd9kgb2Mjz9P6WmgTK45UrSQt/YG5iIStowpJ2w8gvEvVcOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ghnJIzHCBfPPb7PJGOHx3Jgoqqxk8PgvNWQy+vwhnPM=;
 b=AyuxDHYLQ4bEyhI6p47UgscLh5DhSEpPyT/goIGSa9cMSbrIuAu2VMYzzOFygxjQgnXFeGAQaEBC4qCNmZOSsyMyUoH6NtczPPbsOwCXvE46x0+TTpy+H1hj8Z+jVpRvNwdOlXKCGKTy/ynRPJwlNecDGjvMCgwQGYqdSpiGuD8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 11 Mar 2026 10:46:40 +0100
Message-ID: <DGZUVOWBI677.1QXF8LMTNO886@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jason
 Andryuk" <jason.andryuk@amd.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 0/4] x86: Drop cross-vendor support
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20260213114232.42996-1-alejandro.garciavallejo@amd.com>
 <7973d3d1-8984-421f-88db-ca17ea3cb2ac@suse.com>
In-Reply-To: <7973d3d1-8984-421f-88db-ca17ea3cb2ac@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|PH7PR12MB8013:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d0a625f-3357-47af-1697-08de7f531dd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	lh3WvbS/RPgecNaSYP7Vs8rWcnRHHIrQURA78j5L+ZmNqDJwOBgF34ld1TxHOzgIG8QSKyoB6G/jqAreTFMvx5fRZdCj/XR0ukKnt3VQnmc/wNUYuxoEgPyjeScqXwX3kBWv3NvFkvG/BA/1E3cRllczHgc15gtut6zrePFUVDH5p4WIPutsfAwzG4HsWI1RVL5hOkVt51QqbfjLIRGuEKS0A2OPpxQaehYClWEHnY55Nb+9Nr1ZtgS0UCelOwwd8oUQMzUFw/tMyTmxgRk6Fs8JlYdubmYyFq0B1QgV0FdLNJvwn4/vZggtKMd4WeZUIa4gLq58a+L6mnS0QOzJ197gjEln/eWRpMrhTquW4tU71o8yABbBxKfZxo+b5obnbR0KIJGLptM3LJ85wong3kDgCGAHJ8FI3tMeEIlK+4bomJtcQuCZG8llzJEiZT2XE2U32jltbTnEeL84Pa0WNRZ82JZRCXFG+PLc44dPxA4HNzMRTQ8J7xALUco3XRDblcp+Y4lXLefKeC1EBRvszUqo8AFuYoWjGC2zSRNJfz26/nA6W5Twyf5K+5+KyIKbfB+on8/XD0YgvQ1zwcSVM4loxaqldsmlVotXt/xnv54JBbBchIOgCLdau+7B0rZiEd74ionTZkWkHmxEp0DMjfrI3sgswI4iU8EY9e2gjMlUh4nMPpcHgZd/uMt5GwQ5YMY6omRn2N6f6mg7WylRFiA5+wxxMy0ENbSksXm21QeuK4pJUuS1ElWi0o6rMNLUBYq8xwNp9JKe9E12bjo6KQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bUUMAh1dH4u+Sb5EpNwFzxmR0mfHAJ36DEm+PQVWrqNzpgm7oToK3oD/qgSb19O5bIUtT4vDWUiQbxeZYkXiMV9xbXSLoIOhXtme4y4eyHh6QULNVJegrZdHXet6J8JJtreAVWZR8RtESXqbbaX9KPYQsORG6hHdKSkEKsu8xiICBOU6BMiYCEuvb0aVSsbnZOKyqrFXOA7nqqw1Kgixm1llEiwfzB9x/eSuHqB9g2o6mUE4BbWXcI8o3Odo0S1RDifRzTejN+GoOWh6OdGBUTdmpAezHrxhJevE894w4oPyrldKpmfW6EaljtkWh2gd665xToA+SOMJ6z2zEq6r7pOLYUT5LJ0THBWpElUawij/19BukHkC8CKj7T7v7NlQk0FP+nzr+BhA/N192n59f65Kq4yVrry3e/r0QNEVP55e/vNRooJKWLMKLKIdPD46
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 09:46:49.1815
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d0a625f-3357-47af-1697-08de7f531dd5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8013
X-Rspamd-Queue-Id: 20772261278
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
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,xenproject.org,citrix.com,vates.tech,amd.com,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,amd.com:dkim,amd.com:mid];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Wed Mar 11, 2026 at 9:54 AM CET, Jan Beulich wrote:
> On 13.02.2026 12:42, Alejandro Vallejo wrote:
>> Alejandro Vallejo (4):
>>   x86: Reject CPU policies with vendors other than the host's
>>   x86/hvm: Disable cross-vendor handling in #UD handler
>>   x86/hvm: Remove cross-vendor checks from MSR handlers.
>>   x86/svm: Drop emulation of Intel's SYSENTER behaviour on AMD systems
>
> With this, do we actually want to keep emulation of SYS{ENTER,EXIT,CALL,R=
ET}
> in the insn emulator? Or at least gate that on e.g. VM_EVENT, to still al=
low
> its use by introspection? Whether to then also permit those with HVM_FEP=
=3Dy
> (but VM_EVENT=3Dn) would be a follow-on question.
>
> Jan

I can force emulation of anything by writing an instruction to an xAPIC reg=
ister
followed by RET and then CALL-ing it that address. If we want a hypervisor
capable of running such ridiculous cases the emulator must be complete. If =
not,
the question is what to do otherwise. Inject #UD? Crash the domain?

Cheers,
Alejandro

