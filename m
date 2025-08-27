Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5927B38440
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 16:00:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096153.1450944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urGh0-0003Lm-Px; Wed, 27 Aug 2025 14:00:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096153.1450944; Wed, 27 Aug 2025 14:00:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urGh0-0003Go-M7; Wed, 27 Aug 2025 14:00:02 +0000
Received: by outflank-mailman (input) for mailman id 1096153;
 Wed, 27 Aug 2025 14:00:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n4tM=3H=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1urGgz-00036L-6y
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 14:00:01 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061e.outbound.protection.outlook.com
 [2a01:111:f403:200a::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ded3632-834e-11f0-aeb2-fb57b961d000;
 Wed, 27 Aug 2025 15:59:59 +0200 (CEST)
Received: from BYAPR01CA0020.prod.exchangelabs.com (2603:10b6:a02:80::33) by
 CH3PR12MB7761.namprd12.prod.outlook.com (2603:10b6:610:153::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.13; Wed, 27 Aug 2025 13:59:55 +0000
Received: from SJ1PEPF00002315.namprd03.prod.outlook.com
 (2603:10b6:a02:80:cafe::69) by BYAPR01CA0020.outlook.office365.com
 (2603:10b6:a02:80::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.16 via Frontend Transport; Wed,
 27 Aug 2025 14:00:57 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002315.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Wed, 27 Aug 2025 13:59:54 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 08:59:54 -0500
Received: from [172.31.63.243] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 27 Aug 2025 08:59:53 -0500
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
X-Inumbo-ID: 1ded3632-834e-11f0-aeb2-fb57b961d000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UMtfl8ZaV/sAWiqP2AV3PllARO8engtEJxKYBWykT9lXHvO6Le+hgmJL1RmQPCW+QsvSgytHsoKEIU+2/6RmVlcsHVP58zUCeSKIiR3tEUDFEknREmbh8OgWoUu0KkLN+HIX6reVqx2UnADH+/Lc+NbqWu8zyYSCKyS25QX2/NCc4I0tF1PUCN7mBfIMfnPoKILgUF/weBtZWPK34dTl9qy6Teh4N78aNfBlri2qxGaD1KxEt4dv4NNRu+UahosETH7k2z+cDKjwA+RA7hA1p1kiNZR1ScqTV4TKcDUZkRj+BiAj1OGxqlUManMSRjKioM9sVwf6kwARKD5LsgEHeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bl9UBhq5Xzhz6YxyZDO6gE47MqshMlgfDdo4nvt3U14=;
 b=khLFoOYPcCSyQuOHOxClRDB5mSSgnJwtwrFuckbGdaR9IBbAD8DIZyhtVN0o1+BvgDZtOghzdwS6VA1H7F6nlpiQ2htqEAg9tg2tmAJKPxyv0ih7KCy5rWR50OYm/ikYr6kS4oI4kpo/diOQguHgMGAW5oz26pTjv398XpD2EycxHSjSFTS6nkv9heO3MXr0nuU7/zvHsifVEZDgfNU4wztJE0zOSPRcmeAZhSUxvOiSd1Z6+xXBNXIJ8Fqq7dcUjyslcJmi7gpVX7kVqmQc2ZMadUH7FiPttKKLL5XgW3dfmEr4qNtARUlQr9/pfMtWJ+7dhY/I60f2FjC++wtI0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bl9UBhq5Xzhz6YxyZDO6gE47MqshMlgfDdo4nvt3U14=;
 b=OTcu6qo4JRgl6bmkmHsWCPS7s6dfte2eC4+4Oy3rb7E1TVfULI3LbHjSnwfcRwCKLqEMqliRwjnBoMPihIrtEMFcJmJKFdW8kuqno7cyilm2awOZUX7YB58GDka++39EJ+qd9RL3WtFjshLqpIOnmDKZp3Ll0memdWjr871B+u0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <39e7bafa-652c-4ee7-80b6-1edb97640d73@amd.com>
Date: Wed, 27 Aug 2025 10:00:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen: replace XENFEAT_auto_translated_physmap with
 xen_pv_domain()
To: Juergen Gross <jgross@suse.com>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>
CC: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner
	<tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin"
	<hpa@zytor.com>, Stefano Stabellini <sstabellini@kernel.org>, Oleksandr
 Tyshchenko <oleksandr_tyshchenko@epam.com>, <xen-devel@lists.xenproject.org>
References: <20250826145608.10352-1-jgross@suse.com>
 <20250826145608.10352-3-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250826145608.10352-3-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002315:EE_|CH3PR12MB7761:EE_
X-MS-Office365-Filtering-Correlation-Id: 9552ac1e-ccb6-4d30-da98-08dde5720047
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VE1kMzB0MWlpeXNYSE5XdmdEYlphakNkWnNFWW5FaGlOYTh2aWZtMCsxanlR?=
 =?utf-8?B?SERkcjVYNjN4SDgxWGtSN3ZLUUNLQjB0QzRjS1VWU1duR0pzbytNNm9JOVl5?=
 =?utf-8?B?YXJQMTQ5ZWovVXJKeUNIbmdidGpCMTdRam85b1FSVnFpZnBYTVBHUWVjNFhP?=
 =?utf-8?B?eDg5bmVWc3R0TkhYVzVEc01QbVNCci9SbkVBQjdLR1pPTGdQN2w1RCtsb1lx?=
 =?utf-8?B?S09OWGFVRHpKQXdvOXNiZzZscGRONWJuUXgycVQzcDJOZG9nTFdtU09IOS95?=
 =?utf-8?B?SkdJbURBZFRBeEJHZjVYMnI0WEZxNDlxOGNZUVZ1YTJIdTdDVkFWZWtRK2hl?=
 =?utf-8?B?NWF4eVd3UGo1RTdaRm82dWVZNCtxdnQySk10cDVYbEl2ZTZLTC9FMFEzQVFO?=
 =?utf-8?B?RTFaUW9nMVpBM1VqdTRRSldyeWVieXFyZ0ZPZHY4RFV0SXhpa2JodHFvd0lE?=
 =?utf-8?B?eTJuaWRGYVJVc3RBY1BrRzAwajRkZ2gxc0lzY01GZm03YVptQVB1Zm5oR0h0?=
 =?utf-8?B?NVUyTHg2Nk1ERFRzVzZybGM2NjlhU3FCR3lkajdKdGo2R3FDVFZkL2VqK0tY?=
 =?utf-8?B?Q08xUXJ5d3ZsdWczdEk5dXM2YlYyeUVhNXNzZGg4cE9WUG0wSHlDV284YnFK?=
 =?utf-8?B?QllqZGo2MXp2alJZTi9qdTk2Skt6Y3cwQXRLSlFjNjhvSHJjYjZneHBTdFdi?=
 =?utf-8?B?UGhSeXlGcXFQNS9wOUsvcDA2amVXK0w2SEV5Rzl5OWtKMUhVMjRweHFtTEx4?=
 =?utf-8?B?WnQyZDM0NEFscnlnWkZEUkZQRm1VRnpxOHJDQW9uRklpYzg3M2Q3Wi9nT0hm?=
 =?utf-8?B?U0kyZGVvVmpTeUZ6bDdTZWEzUFU2eUVnL0Ntb3F3VGV6dTZDaTlTYTRFSFJh?=
 =?utf-8?B?aVJ0SithTU1UdUJlQVQwNXV0S2pLUkFhcVVFUmY5RlpEZlMvY2tvRlpURXFT?=
 =?utf-8?B?eDhUbXpGTklnWkoxTmI1VUdjVzVBR29rN2p6My8xb3RhcC8xN3RMampNMTdz?=
 =?utf-8?B?UDJxSDYwL2hWVnIvb1BMNE9XV04zdkxvVFBCcGgrSnNUdGVZZkluZFpTazE2?=
 =?utf-8?B?NmxCV2c5aVBlanFobzY2M3FaNVgzcDQ2SDBhbUMyM0VxY0htcUkzUTdmeHRl?=
 =?utf-8?B?K1NacnB5K2hpVXF3ZW1IMnVLbEhJcXQzNE1qTDQvbC8xZXZhL3hiT2VEdkRZ?=
 =?utf-8?B?ak5yeVN3SmhheW1YWUxoM0VZSUoxQlNwRjNMVEFYZUZacWdCVlhKcTNvWHFl?=
 =?utf-8?B?c2s1bXhlMTAyZFgwZXUvKzlJSGRXTVAzWGxVS2JBejV3UVgyM1FpaG96Mmxq?=
 =?utf-8?B?ZmFOaWlBc0FNQzlTVFhHZFFwa3pCRUlHbUc1ZGUrOWtFRlhSVjVaYlE2S3Rl?=
 =?utf-8?B?VnlWOHhkNC9OTCtuYWZPSHpXNFlRaHdXaGt5NFMxQmJIRlRDaFNDd2p2ckhB?=
 =?utf-8?B?cFk3R3Y1eUZGb1pQWndDaFBuOHNtMHFOdStLb1RmRm5iQ3JGb3ZMb29VQjZG?=
 =?utf-8?B?RDNuU0dkMmF4K3Q0Sjdkb0xxbE5INEVnVG82NTVweWNUZlZnU3VmamZZM0Nm?=
 =?utf-8?B?Z0QwY3Q4WWZEcDF0V1QreGtWNFFXbDM4eEZTNzhqMGx5UVpaazFCbmQ1MHJ3?=
 =?utf-8?B?bitZMi9RclZDMTFVOFVBOVFZMndQK2U5dnQ1UlgrV0cyM2pYNFlkSkQyd1FB?=
 =?utf-8?B?SnVVOGlnWTRFQTFsaDI4dkFEY2VScUNhekRqOUZBUDVyR1VEZHZVTE51WXhv?=
 =?utf-8?B?NjdObWNNQ01vRjdZZXY3VE1OMFBIR1dpTGtzWWhLcjJwbjZMWUd3N1NUMjNK?=
 =?utf-8?B?dGhXcE80Z1ZZdnYwb2I1bVpiTnc3bUE4dTl2UEJJL2VQdzk2U0lHRHFsZFA3?=
 =?utf-8?B?VTJMNk1FUFdnSzkxRjRaWW1PWHlIUk9UOWJFTVlBdE40RUJkUUxYS1QxWXNS?=
 =?utf-8?B?SFRNd0crUXcvQWdxNktyd280NlJBQVVqVFVrNW5OTnlFMFpIMlhsSmZlYTNB?=
 =?utf-8?B?N0FZVzI5YkdaQ1RnNVQ4cHUyd3ozZDhocUxIcGFWVkV2RkRjd1I3ZURMMmpi?=
 =?utf-8?Q?MUHwAY?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 13:59:54.8869
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9552ac1e-ccb6-4d30-da98-08dde5720047
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002315.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7761

On 2025-08-26 10:56, Juergen Gross wrote:
> Instead of testing the XENFEAT_auto_translated_physmap feature, just
> use !xen_pv_domain() which is equivalent.
> 
> This has the advantage that a kernel not built with CONFIG_XEN_PV
> will be smaller due to dead code elimination.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

