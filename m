Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BD3B049A4
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 23:41:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043110.1413229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubQv5-00011V-AB; Mon, 14 Jul 2025 21:41:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043110.1413229; Mon, 14 Jul 2025 21:41:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubQv5-0000yy-6i; Mon, 14 Jul 2025 21:41:07 +0000
Received: by outflank-mailman (input) for mailman id 1043110;
 Mon, 14 Jul 2025 21:41:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jbYV=Z3=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ubQv3-0000uf-Tr
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 21:41:05 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20610.outbound.protection.outlook.com
 [2a01:111:f403:2414::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c962765-60fb-11f0-a319-13f23c93f187;
 Mon, 14 Jul 2025 23:41:04 +0200 (CEST)
Received: from CH0PR04CA0114.namprd04.prod.outlook.com (2603:10b6:610:75::29)
 by SJ2PR12MB8954.namprd12.prod.outlook.com (2603:10b6:a03:541::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Mon, 14 Jul
 2025 21:40:59 +0000
Received: from CH3PEPF00000014.namprd21.prod.outlook.com
 (2603:10b6:610:75:cafe::8b) by CH0PR04CA0114.outlook.office365.com
 (2603:10b6:610:75::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.33 via Frontend Transport; Mon,
 14 Jul 2025 21:40:58 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000014.mail.protection.outlook.com (10.167.244.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.1 via Frontend Transport; Mon, 14 Jul 2025 21:40:57 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Jul
 2025 16:40:57 -0500
Received: from [172.19.134.125] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 14 Jul 2025 16:40:57 -0500
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
X-Inumbo-ID: 3c962765-60fb-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yxcCJ5+KCUtoCcPKt7h6jqaSQfQPbEu+oU2zlGNDZlGxzLS8qZZx2/Z6P9aj5YAvHh/YyvKRoJg9dVi5f9zXnHvLDUzewuZp45tv/VWP4L/IkKO4EYxlPoYgxj8tXc1Ao/EfP2uPXgpA0JzVCVRuly1zAv6Vrf/jal6Ct5floeXTYhiybgCBrQ5vMLf1x/8xxGL5w/754wXqRuxS3J+qX1MLIAceblgsbMYO5QZbiFqmIhuOzRcwMz65pExPmdype8xhuFvBm7X6mSGJomif6qbxFa9ncl4hBYkj+4Eip8Y4LYwqWSCmebZXK4hLE/dDXBUjHgutSAthTEfpEkNY9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hpa5HewUKS4ycwBF4vCUsfJrXeoaw0Fa5tw+Z2xmSLI=;
 b=nphIjADEKLKzSSjsl4KizX1C5ucJT2MEf81lYtSiFwN4b7m9bBdPdk++1V589fBBMAqbrxQccLn9a9LMMQ3v7ZK2IlhmLT2d5FG3oYKqf7L5VqDDziTbkflMcqfSgJHz4wEak3AlEtUXT8eQlYPDzibVsncJb5fmgJlGrc+iqFYvMCyYNGbjB5oTSrcKbtBoQbWMsheeT74MTsBwRFCbiFAVdUkB6FWKd529UJzACLiVrCY4KPRircZPeN8miQzP+cUo4vL2IBUxP6C4BXOd35J6u2htxXIaZOc64510RSb4NbsJkuDdWzG7Zd477IsAC8Kj1tjh0XuTUI1Nfa49qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hpa5HewUKS4ycwBF4vCUsfJrXeoaw0Fa5tw+Z2xmSLI=;
 b=zT3kacsp69gdjspubWz/MBS4H+6HDjPyXEJ3u0aiecoHpgGAOvyQ9P2q81iVMY/c99BwPrUqC+ieuc5ciELc+35ZRQzim6Y4fOY6qyDECotJ2LfzuSzdnT2PkhCut6S1G+ci7/yNrQQ73XyPsAVrnp//i76I+5z/wO4PvAEM8/s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <63e68e44-d38f-4891-9f6f-bd771406ab34@amd.com>
Date: Mon, 14 Jul 2025 17:30:18 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [MINI-OS PATCH 18/19] 9pfs: add support to keep device opened
 across kexec
To: Juergen Gross <jgross@suse.com>, <minios-devel@lists.xenproject.org>,
	<xen-devel@lists.xenproject.org>
CC: <samuel.thibault@ens-lyon.org>
References: <20250702081254.14383-1-jgross@suse.com>
 <20250702081254.14383-19-jgross@suse.com>
Content-Language: en-US
In-Reply-To: <20250702081254.14383-19-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000014:EE_|SJ2PR12MB8954:EE_
X-MS-Office365-Filtering-Correlation-Id: 9afb4cb2-69c3-4f88-b741-08ddc31f1e83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S1MvQm5TQllVYjhWc0p0ZS9zNzdJa1MwZDN6MjNQbkZWL3UwUHFtcW1IbUYv?=
 =?utf-8?B?K29KTWlDajlPcnBhVUlCS3J2eGYyeFZWaVJlRmxkQ3VtK3h3UEx2WDhPcVJC?=
 =?utf-8?B?RkVyTDUvTXNycjNXK0MzbEJWVk9iK3Nlcy9VM0NkN2VqY2FlQlhTcW9PQyt3?=
 =?utf-8?B?UnJQWktCNi9rL095SFpYNWNXanJoeFF2T1pIUFlzclRIQlhUVWR4bFVWcmRC?=
 =?utf-8?B?djQrdmRhN0VxNUZRaGlOWWJVNHp0WHFEdnRkRWVRQ3g0dFhNK2tZc2JKZHJX?=
 =?utf-8?B?WHJOWkgyRWx3SFRVUGRVUXl2QWU5MW5xVG4rS2FQeWR4NG9qY1ZzVE9ZcFkx?=
 =?utf-8?B?N2JjSXZBalBOcmI3Y29SeUdjVi84bFVET0JCbEcwaFpNelhCc01PNmFNWVo1?=
 =?utf-8?B?ei9WamdwYTk2VDdFaE1rajlpblhhWGUwcjdnMW92TUVkNjVKcG5EU1cvYS8v?=
 =?utf-8?B?QUt6SXJwdFNZa1AxTkFwZmd1bGJpS1NwUUg4ZEJYZnF6dWZtbmtpWmRLQll6?=
 =?utf-8?B?a1Q3dmxpQnMyVnZFMVB0dnVaNXcxNlpCd0RUZ0RuaXl3dlphSWlzQVRXWEpS?=
 =?utf-8?B?Mml4UkZ0Q2s1a2pOUmRkbXhxQzNLYkx4Y1RaUi9tQkNIbThYSitmMnZubDNu?=
 =?utf-8?B?VHg4WC9EWDFyZ2wyWFlJYytNOUNuSzhKMnplQXNpQk9qUTQ2d3JmclUvZEx5?=
 =?utf-8?B?cGh4UW9NdFVGZTJ1bC8wTW5FOXE0ajVrNlNEL2NmSi9RMTV6Q1BmQWltMnIz?=
 =?utf-8?B?dXNsVFpXR0xpYUZGem05dVltUGRsK3V1TEVlaFBRVnRDdWRkOFdLUGxjQnNG?=
 =?utf-8?B?eHYwSjRnbnpSZUpuZ0R6YlpsdnBMQVlySmswcmJ5bVN6RjNBdnRRNUNXWHl6?=
 =?utf-8?B?VXQrSG13Ym1hV3FsandpMDlkMlVwdDNjaUFVd2FUeVZvb3ZnaDU5L0dPZW9C?=
 =?utf-8?B?VmRqRC9ZTEcyQnl0Y1VhT3ZVdE52ZTdXUmJFdHIzMFRhcTdMSlBiNWpGb1BN?=
 =?utf-8?B?RlBMaEU0Ymd2UVNibi9xZjNHK3gwOVh6QmtmLzQ2R0ZtZk5vcmhacGljRzF5?=
 =?utf-8?B?LzdYMjJNWFFTSHorZmFWSFAwQ3pYTGNkMFRaZDhPVWw5QnpKVE1iSDlMWC92?=
 =?utf-8?B?dFNnclJKVlI0VCtySUJDL09MdHdPK0NJb1h3RzluUTdJd3ZmK01mRllRR1B2?=
 =?utf-8?B?WS9uaENyTlViZEtvSkNmeGtCd3BXbGs1dHZsOFdyNEdNdjFHS0JhRXlUK2kw?=
 =?utf-8?B?Tkw4NldJZXZTeE5aU0lpUHZaTENCWkdpQ3dUMEVFUFc1dm1kMVBTS3JzOUdI?=
 =?utf-8?B?SGJsdk8rSmJ0c2JBNWZRdytsNkFRaTFScW44RE5SblFBTjZsUUpMQU92bCsw?=
 =?utf-8?B?aGFjamZIQmtteHhXcHVIdEhhRitEWnF5Nk44QkdxQ3gxOGcraDdqYWtmbWg0?=
 =?utf-8?B?VjJZNWZ5dFR5ZEtidDlCZVVQUlltN3N2ZVYvV3dsa0YzdTU3SnlEMVNYdFA2?=
 =?utf-8?B?aDZRVEdtRkFtcFVCVHFpOWE0eGU0amNVRWV0eGNSYmZ4TUFPLzhaVC9ud0J4?=
 =?utf-8?B?RDFwUWI5MFg2OXp1WTczSnFCZGlBd3RLS3dCREQ5T0FiNDVPVnVFRnhUZE9V?=
 =?utf-8?B?ZElDbVU2Ry9QNXJQU2F2NlcvZ2w4SjV5Y3JoNmNxcmpQQmxsTnl3N3hsNita?=
 =?utf-8?B?T295bEtXbFloM1IrSzdJQnlqVlVPczZxeHJZTVdmamtsck9BZjN0ajJGZkd6?=
 =?utf-8?B?SmN6TjV2OWtHYkZHbGR2OEhieUt2bmlncGtMTmpjQlFhOE04bHE3c2ZCMTkx?=
 =?utf-8?B?dnpSQzhZcDlpMW95enptbUw4eE01VGRPUlNMZytBV1pPNWVGc21Va1NSbG03?=
 =?utf-8?B?c3dmNFEwa3A2WjB2Z1hZaVhYbmhBTmY2MjdnWjVaVWYzR3RhUGRzLzF2WFBm?=
 =?utf-8?B?d1YvT3dudGtwaWk2R3ZabFU1ZkFKRENWUVlabkF4V3JOSmF0QkFlYVVUdFNu?=
 =?utf-8?B?eEU0SDE4Z091L294SHdsbkxqc1dFREh5ZnlKWWtYWnJvNHRYRDBUU294cks0?=
 =?utf-8?Q?K57ENj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 21:40:57.9200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9afb4cb2-69c3-4f88-b741-08ddc31f1e83
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000014.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8954

On 2025-07-02 04:12, Juergen Gross wrote:
> In order to support Xenstore-stubdom live update, the 9pfs device used
> to save and restore the Xenstore state needs to be kept open across
> kexec, as otherwise re-opening of the device using the new kernel
> would not work (this would require Xenstore to be active, which is
> obviously not possible before having read the saved state).
> 
> Add an alternative init function for a 9pfs device supporting to take
> the configuration from the kexec module instead of Xenstore. Add
> support for creating the device using the kexec module, too.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

