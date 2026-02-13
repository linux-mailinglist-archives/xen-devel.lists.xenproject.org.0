Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMaCGtH4jmnbGAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 11:11:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2534134E98
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 11:11:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230571.1536045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqq8f-0006IV-9J; Fri, 13 Feb 2026 10:11:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230571.1536045; Fri, 13 Feb 2026 10:11:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqq8f-0006Fz-5s; Fri, 13 Feb 2026 10:11:05 +0000
Received: by outflank-mailman (input) for mailman id 1230571;
 Fri, 13 Feb 2026 10:11:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FeGe=AR=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vqq8d-0006Ed-Rq
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 10:11:03 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4baadbfc-08c4-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 11:11:01 +0100 (CET)
Received: from BL1PR13CA0113.namprd13.prod.outlook.com (2603:10b6:208:2b9::28)
 by CY1PR12MB9700.namprd12.prod.outlook.com (2603:10b6:930:108::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Fri, 13 Feb
 2026 10:10:57 +0000
Received: from BL6PEPF00022570.namprd02.prod.outlook.com
 (2603:10b6:208:2b9:cafe::25) by BL1PR13CA0113.outlook.office365.com
 (2603:10b6:208:2b9::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Fri,
 13 Feb 2026 10:10:56 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF00022570.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Fri, 13 Feb 2026 10:10:56 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 13 Feb
 2026 04:10:49 -0600
Received: from localhost (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 13 Feb
 2026 02:01:51 -0800
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
X-Inumbo-ID: 4baadbfc-08c4-11f1-b163-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iGVf9vowBiP7GJZ4IIVBvT68+NpJTaEc7B+oomsAaDLdDqEGid9fH1LbGlMRjYbRIFiHkNmYvkGgxcOVXl/7hhuLmdNFSY7pOcBz60/yZ/mHRBgKUHKUgI0LoZ+AxyX8SE+M5FQPVq5i2unpomTL98XfGxxKjHlZJGrqIT2la1PlOFNQ2jiB81OWNXmVrI7coxnci1SXzIy1DCZS1ZHW+MyV59op56x88YpbSuDLL+RtqAk5EzXvFQFC2ORSJYReLtZK59cT5jgdUcGA9dr/6hSuItNUWLQYV3mpIImI5YG2SvBZf2DnygMTQdbiSE2mZQBqc0IqZNc8x1u1b95QqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bhlaYgiqSmwHiBP9/BuGDXVhDNIh6+cV9S9QcQoVQ54=;
 b=imSYrWW1kaeAvUcoPLcBp9rkb0lW43FDP+jdguB1BBISZ9NSXYHkG460LCAXamS77PNzaESSpZnjCZCzgQb7fs6WGrzd8HwdgSVq5dFKULZBQn1spgyicPVzi4La+tE+N56lNUEkPWvhGjZ8quJXU3sQnBz89h8RB4sM3tCrULzEmadMzOGeglsVgZQzkj+c6SSDnqQASNQeEqKGRtSHM5f8FBM8vZUc6BXVQGmPoC2bM0hEtY92xDlTj/89pryNuGdbR5/y8P2KD5cmEDRHwVvNtLRU0+IbudOgaAB4iJhsdrJwToKrS1fvXIN3lj54JIVD1kLqD/qXSpLwYWAjBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bhlaYgiqSmwHiBP9/BuGDXVhDNIh6+cV9S9QcQoVQ54=;
 b=o+uu7Drkz7235DByOTVLecKriw71giz8dUR4VP4u+4IKNFR2iU38oETtD1oz2JjWvG3RxuX9dpiT2AIozWrCSouBHOnm08FjbrqK2Q5PNQcNgggQpW/Ad2+5BmTbAW6g5BFiXlbJmgPCVj7+3pQHAFaVXW0g5bX3n19vx1emWdA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 13 Feb 2026 11:01:51 +0100
Message-ID: <DGDQX5QQGFJJ.2M0NXLA9LYHPM@amd.com>
Subject: Re: [PATCH v9] common: honor CONFIG_CC_SPLIT_SECTIONS also for
 assembly functions
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Xen-devel
	<xen-devel-bounces@lists.xenproject.org>, Jason Andryuk
	<jason.andryuk@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <a11e692c-2bfe-440d-915b-818b133874c2@suse.com>
 <bd656991-59bf-4435-b6e2-554b9ef4725e@amd.com>
 <DGD73M12VYML.SNZI1JQAXHAQ@amd.com>
 <66d789ce-8a71-4115-a2f5-356dbcb4a82a@suse.com>
In-Reply-To: <66d789ce-8a71-4115-a2f5-356dbcb4a82a@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022570:EE_|CY1PR12MB9700:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fbf2ec1-d3e5-43b2-2b05-08de6ae82dc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dlVsR0t0b2ozVVNPSnBVOWJYL3F3K1lZU2tjTjJnNXNNeG1vN0gxclhpUFZ6?=
 =?utf-8?B?S1NIUXhRb2J5bkdkTEdVWC9od0MwY1phd3RucmpyalN5ampyOGsxQTVQOUpU?=
 =?utf-8?B?SUNYNkNFb3FOdVVJMVZWQ3Vjb2w1WmRlOWVCeDNSSDFEM2JuUmJaRzZ2cE9J?=
 =?utf-8?B?Q1lmK254WHAySEJDUi9vU1d1NnBoa1c1QXhMaEtQdXlYdHVPZXRmckFsSis5?=
 =?utf-8?B?NFJaUkh6RHlWczVZek9teTY1M0l0OXk1ZnhOZmxkK2ZxL1RnNk5yc0lFNU1r?=
 =?utf-8?B?RExVUkJYZnJuNytQc1ExY2hKWWxoZGdpNFlwVk5XN0RydDArWVF5blVYVmZ3?=
 =?utf-8?B?UmZORzQrOWxNKzBHM0ZOSHBraHUyOURxKzAzWmZHVitlL2Q0U2VWeFJ5Ums3?=
 =?utf-8?B?K3B4M3Jkd01NQ0pFWnp0bzQwTHlmTW1IVTY4bDFYTVR3ZXFCQ3VUTEFjRnl5?=
 =?utf-8?B?clg4dndqa3loMGdaVy9XSFJncklqV21wdTdFbkc2RVhYdWIvVkZFakFJZkhj?=
 =?utf-8?B?ZDZwU3o2endOZzloR1puMU1HUHRxSCtXOGFlbVF6aXdlTmtaZ2ZGN2lKMi96?=
 =?utf-8?B?L0c1ZEd1NDUzQ3MwNWJ4anlWUVVJZER0dU5uWkhDK1ZoS2NyZkJxM1BnWUo3?=
 =?utf-8?B?Tlo4azBTU0hJcVBidVd0TTJFYUxET1B0RVFCSnQ2aU1GTkIwQ2Vmb0FEMzVI?=
 =?utf-8?B?MnY3d05XR2I0ZHJnT0hxK3ZGREFJRkRNZXFGcmZqVzMyZGtxUThxeTVkSEg2?=
 =?utf-8?B?WHA0czdPb0RqTEJSZWRnQ2tIV3RBMjFFRHlQVkZKQ1Zhd1llb3JzbkdEMVhS?=
 =?utf-8?B?emFyakZzalE0bmJqc2RPYzBhamFOSDE0cW1mQ3poOFNwMnRqYU1hZE11UjZE?=
 =?utf-8?B?R3RIWXFyTHpvQzNsaWRPK2pOcHVRL2dRVDZNbG5UZlF2RG9EUVZ3Z212NlVP?=
 =?utf-8?B?Uzc4ZU5QUDNTMVA3cG95eTVNREVQUm1IVzFWWENIaTBKRzR0M3cySUp4a2Jn?=
 =?utf-8?B?S0R1OEs5QU9wMXcrMENjd2ZaTVh1SDg3bGpCL0xhaEl6RVV0NjExZUJnQlIz?=
 =?utf-8?B?Q3ExSW0xN0lBNlJqSGhxeHU2RStPKzBBUXk5amVqVXRGbXV3T3hsN3JnOHA1?=
 =?utf-8?B?Tkw0OG9Fc2ZoNHRVYUdybXFwVmxKZ1FvQ1ZtTXZEaHpYUkpMaGVrVGRlSkR2?=
 =?utf-8?B?UU0rTDJra04rZ2x5S3FHajNpVXUzQUIvci9wVTBhRjJPdGNrUTJjY1Y0ZDFh?=
 =?utf-8?B?YmxXcHozQWdZYUNGR2Z1dHQ1eEdOaWVJWTNLZjc0NHRZR2JCRGwyWGxEYXBI?=
 =?utf-8?B?ank2YWI3M0VLWFk0bFQ3RE9XM2VqSnRUL3pXb0t2eEtoN2pJeEF6V3ZWQkt3?=
 =?utf-8?B?dWp1aUdKNFovK0FFK2FUT3NNYmw3NCt4Y2NoTUEyTlMyendxbkF1OGRkb1pT?=
 =?utf-8?B?QlRiKzBRWUR1WS9PcHNYengyV2VLUHZOb08xQmoyc3VraUJoRUh3VEVrcDRr?=
 =?utf-8?B?Sk1DNnhYZWo5dmZDU1VadHpBczlxT0hla3ZQd3VFRndzNlFtYUZSc0VpU0JD?=
 =?utf-8?B?OU80b1pmeG9FdHJ5dDQ5ZFpFdzRZcjdZanZyQVRRL1orQmhOVTFoaDBvWUN6?=
 =?utf-8?B?WktaQjZjc3ZOUDBta3FVdWJxVFpNY05XRCtsUDlSWS9yYTdxMzFXdE1zamJk?=
 =?utf-8?B?YjJPVDV5VXJDV0NncGFOZ25EdTBEYjJDM3hleTFxZG42YzdMcDc3TnVFdkIv?=
 =?utf-8?B?SU1rNnFGM3JEUUlwU1FhbUlXNDJibnE0S0p4Q3lSa2M2eHJabko1R2dPWFky?=
 =?utf-8?B?Y001NzRFMUZhcDExdmkzL1JlcXFRS2RPN3lFejBhS3B6M05QajlmRmpJdXh5?=
 =?utf-8?B?VXMwS1E1bVdsaERNWldYc1ZjOHNiWU9lZGNyS0tCN2lETXo2TkdYTFRISU5N?=
 =?utf-8?B?b1BJdEdoWTBwVWMyYTlZTG1EMFF6clg3WnkxSWF3NjBxelVOZ0hBa1JMWDMy?=
 =?utf-8?B?b2FZMmpUSXkzY3JCaFhYUEw4ZHBPK2RFT0orUDFBMFdubUJGbUNLdXJiUzNl?=
 =?utf-8?B?WnJpWVQwOXZzSktQMjlkQS9tcjRDaVJEOTd6OGtDWmFmWTM2S2RncWQ4N3Jq?=
 =?utf-8?B?L0kwUzNUSnlwSEJYdDl1TzVpOUFJUEluMjlCZXB1dWRmVzRFQU8zN3llekVY?=
 =?utf-8?Q?wL14ECsTX9uybzFkE31k7Dg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1VzUvyQrkS+9GL5G+uJgbx7nwRmY7OXeNNdOA7DeFmgN7R3kEkpKn71LYEwFaJXy8jbMEUv7eZgp2E/+8MgiZMs2Jonhyq9ubUXhOJaNp4iTWux2hMGqcPwNvZrfGxSLT7FK6hPl5Oc3EsFlcFb8zpw9EWXG1XUkRXRPpMsOpAJ9ySPocyUwOfrEg0XaJPjGp52H880St/r8ev/Nh3KhouBtu+0vYKbhZL9jrIDZD8dYra29xQimbJnzagHQgfbjkKBlPyTf2nFifWgG7E6by95WJV9P0Sl0xkoN5E4Cd3MyIfSnZJ7E/QrfItE9Xfsbg5JLHu7L8Cvasu9/GS7D2V6ilcohhKjoOhL2l4ISnbkz+kqAuaBGeeC1YubkC+oRP9pwkss/7Rpz3xY/5SYsAnzirsnDbZURgv0QgpEWWo57kuAv6OeT4huiI53aq//M
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 10:10:56.5736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fbf2ec1-d3e5-43b2-2b05-08de6ae82dc6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022570.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9700
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:bertrand.marquis@arm.com,m:volodymyr_babchuk@epam.com,m:oleksii.kurochko@gmail.com,m:xen-devel-bounces@lists.xenproject.org,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
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
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: B2534134E98
X-Rspamd-Action: no action

On Fri Feb 13, 2026 at 9:12 AM CET, Jan Beulich wrote:
> On 12.02.2026 19:29, Alejandro Vallejo wrote:
>> On Wed Jan 28, 2026 at 3:35 PM CET, Jason Andryuk wrote:
>>> On 2025-04-01 06:58, Jan Beulich wrote:
>>>> Leverage the new infrastructure in xen/linkage.h to also switch to per=
-
>>>> function sections (when configured), deriving the specific name from t=
he
>>>> "base" section in use at the time FUNC() is invoked.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> Tested-by: Luca Fancellu <luca.fancellu@arm.com> # arm
>>=20
>> I don't seem to have the original patch in my inbox, so I'll just answer=
 here.
>>=20
>> About the assembly modifications on the exception entry points:
>>=20
>> With split sections the linker is free to reorder all of them as it sees=
 fit,
>> which probably means we want int3 after every jump to prevent straight-l=
ine
>> speculation from allocating an XSA number for us. It's possible the link=
er might
>> inject them, but it might also not. Better to err on the side of caution=
.
>
> We're lacking such INT3 elsewhere, hence why this is the topic of separat=
e
> (existing) work.

Maybe so, but split sections changes things qualitatively in that now you d=
on't
really know what's after the exception entry point. Previously, if the CPU =
was
to speculate ahead in most exception they'd eventually hit the spec mitigat=
ions
of entry_DF before being able to reach anywhere truly dangerous. entry_PF's
straight line led to the mitigations too. Same with NMI...

Having them all in separate sections shuffled at the linker's will is way t=
oo
dangerous, IMO. We clearly need individual function markers for livepatchin=
g,
but section-wise it's fine to put everything that can't possibly be GCd in =
a
single section.

> See how, for example, we're also not using -mharden-sls=3Dall.

Hmm. I can see how -mharden-sls=3Dall might impact perf in places we don't =
want,
but surely -mharden-sls=3Dreturn can only be good?

> See e.g. [1] for a very old posting. Even in my outbox I can't find newer
> postings covering more stuff. Intermediately some of this was posted to
> security@ only, but there clearly was the plan to have all of this in pub=
lic.

Thanks for the context.

That'd address the speculation problem, but we'd still suffer branches in
avoidable places.

It'd be nice to have a general means preventing dangerous SLS, but that's
largely orthogonal to the new challenges that arise with split sections, I
think.

>
>> Though more generally, I'd just keep all exception entry points in the s=
ame
>> section. They'd never get GC'ed anyway and we're paying an extra branch =
in the
>> #PF path for no reason.
>
> Inserting a branch there was, iirc, asked for by someone independent of t=
his
> work. But yes, suppressing too fine grained section splits is an option.

My .02 is that splitting that which cannot be GCd serves no purpose and
increases the cognitive burden of an already very complex system.

>
> Jan
>
> [1] https://lists.xenproject.org/archives/html/xen-devel/2020-11/msg01542=
.html

Cheers,
Alejandro

