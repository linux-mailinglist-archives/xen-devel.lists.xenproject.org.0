Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPrfNTYYnGmq/gMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 10:04:54 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 470861737AD
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 10:04:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1238563.1540176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuRrw-0005Ou-8f; Mon, 23 Feb 2026 09:04:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1238563.1540176; Mon, 23 Feb 2026 09:04:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuRrw-0005Mz-50; Mon, 23 Feb 2026 09:04:44 +0000
Received: by outflank-mailman (input) for mailman id 1238563;
 Mon, 23 Feb 2026 09:04:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r2fJ=A3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vuRru-0005Mr-MI
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 09:04:42 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af3c7815-1096-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Feb 2026 10:04:39 +0100 (CET)
Received: from MN2PR15CA0038.namprd15.prod.outlook.com (2603:10b6:208:237::7)
 by DS0PR12MB7680.namprd12.prod.outlook.com (2603:10b6:8:11c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 09:04:34 +0000
Received: from MN1PEPF0000ECDB.namprd02.prod.outlook.com
 (2603:10b6:208:237:cafe::da) by MN2PR15CA0038.outlook.office365.com
 (2603:10b6:208:237::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 09:04:18 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 MN1PEPF0000ECDB.mail.protection.outlook.com (10.167.242.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 09:04:34 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 23 Feb
 2026 03:04:34 -0600
Received: from [10.71.194.215] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 23 Feb 2026 03:04:32 -0600
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
X-Inumbo-ID: af3c7815-1096-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bcESkNInzBg6yod+EcfnkiexyfI/rPnzIzMzhRC+m4/egkxUTWSxIbPMfhRLBB5j8zIyeD7kKT7mss+WbcYStNPcB3elGhMbbRmCKjNihvGyDqbecK7qBFlGahCV1aP/hLXdBHSzgXsjRsq/Vv0s3ZAgtmf+WY2hJ6+fUFtNH3HWOduXJH+dp5UpS8xlMkh/fcZFbH71dFs/0AkrFvy0UKSiC+Q4M0AKSlnRtr3ekDO3kPp2Y5NeXzjMMlLm0/MBHL6mpVbnN+aub/lefg2kbelCRrdrXwqJL9jhbfP9W05IqAYTAnye+r/JxsRWV8L0RmMIu39oVdM8EQgif0E5Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/WslnBlJVT/iOwR3QlwkjRiZxNKUPxhK5H+scCwM+gE=;
 b=Z13M0PDFDjeXmUsyskrUblI5GOcwQ8odxbKzhpgJuPeOuCLttdhRHBY42yO9PY9Djc8BzloltFjaJ+lo6R0MBuXj48ffis3NYtW9Cuo0SKEFit/Cg9Hpmr/i1VliAVHqn8fgJ4PRKakExfCBgR2mZJ/VjkDmQtHsi8j51Be38ceqIicT+UT+wh6rvER9nZ5lAVKF6KjNoSL45KbMq1aWdQj8Lb5uvZhJPztaWwnMLJmCf1P0/9ogBjDC6zBsCEnwE3dS2FDjmcr2iWLs6G388aXqsZsL0hArUpHmh+sx1sVoCT8AKbmaov3KJldG6DChXD0RMR3IxBvk55WqK6NSkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/WslnBlJVT/iOwR3QlwkjRiZxNKUPxhK5H+scCwM+gE=;
 b=nqgssUDljo9bcdchIq0Ul/0bh6hvPOtvJPHh+9PBforBBLXKPJmBD33b9gxqlUsB3P+hMVbFMVnZc8Bscke454q1/b3sIB5xBPDgNr1t4lN4wLcqvBR/+dxJlvFUEXehNBYoXkq/Oqh6CyTk9DzW6wh1FpEtQa/Xla2+FFBeU38=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <d3a54b3b-7457-474e-9bfd-ab6f0b35331e@amd.com>
Date: Mon, 23 Feb 2026 10:04:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/12] xen: Bracket uses of macro parameters
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, "consulting @ bugseng . com"
	<consulting@bugseng.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <20260220214653.3497384-1-andrew.cooper3@citrix.com>
 <20260220214653.3497384-12-andrew.cooper3@citrix.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260220214653.3497384-12-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDB:EE_|DS0PR12MB7680:EE_
X-MS-Office365-Filtering-Correlation-Id: 213bdec1-4a34-4c06-c22e-08de72ba9057
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R3pnbnd6MnJrNUdKWm5iVlBZZ09NUjRkWHQ2QzRYQnFnc01mMS9RaWZjWmxp?=
 =?utf-8?B?ZVdXdFRHellibnd6QVNqM05ObDVmZGt5cTBtQmhVd1NLWGxMem9lQXY2b1RS?=
 =?utf-8?B?QnF5NVduV1BYZ1Z4RGQ4Y3haNE84a0c0MkZJQ20zRjdENVBha1hkL1hYMFpV?=
 =?utf-8?B?VjloUW5qODBVWUpLTHFBclYwNnJkUUVmdy90NVZqbzN1T0xJeEtXeTZOdTAw?=
 =?utf-8?B?a2ZERzVlSm5lWE9hZkhzNno2bHJLRWZpaFZrQnpVTittQmZ1dHprcVo0Ui8z?=
 =?utf-8?B?YlgyU2J5S3lqYlV2c1VnalkyQVBUanZ2QWo1THZ4VEZ4Rmt5bUFmd0ptQ2c4?=
 =?utf-8?B?dS81QU1BbGVHMGozeElzR0J2WGN0cVJvZTZoa2FpWGtPVE1EQjk4MStTL0Ex?=
 =?utf-8?B?RHhvR1Z4QmZvc015cmp1V3NHWk5xSTE1dWFYK244cDB1ZEg2N0pQZjV2ZWZR?=
 =?utf-8?B?ZUMzaitZcWovQ1FCaTdtZzVBNFc2ZC81ZHhQVjJFbmNuZ1pZWGNnaFdoMTd2?=
 =?utf-8?B?KzRjTXBYNTFhTW5GUitqVDhOUjM0c0xnaXJBMFF6ZHNkanpKdnZuK2dWNTJ6?=
 =?utf-8?B?aFJjZG5XMWl2dERIUkpXWmwzalp0NTdUb0xnNStaUGZoQTdNakRKSEhqZHM3?=
 =?utf-8?B?bGxvNmJQdUdxWVVac1BBUitSbTdPQzUzRld3ZlIxUldqUW5rTzVsYldlaWVF?=
 =?utf-8?B?c050Y01HTnM5ZCs1QVRUMVRHajVEMWVMOG1vdExkWW5IcXpUSGFRZG5XS0Ez?=
 =?utf-8?B?bjRZZ3Fnbi9aYVJydXJHeDh1NjhFSi9KcGdkbXQwY0pzNGNySllFSVpybU5v?=
 =?utf-8?B?cjhIdExFYzU2ZU80eWtmRVlBSkl4QVhpODBNVjJBTnhhMG8rMEhTOVpXMEsv?=
 =?utf-8?B?SkFIeDU3cXpIcTU4VXprZW80S0pKbEdzMzE5QTB0WVBNZFVobTRnSDBCWGhJ?=
 =?utf-8?B?RU1Kd1U1NDhGZTJFN21kQkk3UVZWN1dqbEp6WmtPelVQYzNMN2plM1U5TEFJ?=
 =?utf-8?B?TFhmeHA4NklaSVU3RklMbDFhME85K3lhczNqdFhpR3MrNVN3SlEzZUZjQ0x0?=
 =?utf-8?B?SWEvR09VWStwaDJCTEFzQ0tHT2FlZS95d0MrUWNZL25xSzJsM1Z1NDhJb1BU?=
 =?utf-8?B?cklmcWZaa0lZbUtCcStnbXV1VFhXVFRuczlmcmJjOG5TYzVhVEJSeGVZeWQr?=
 =?utf-8?B?REZBR2hqMUZFNWgvcGJraDJuZFRaaWtJVzNTTzliTk91ZlZGTTd4dlE2RE4x?=
 =?utf-8?B?d0E5YUl6andrYXpPL3hOZFNncVZFZWY2QnFCOGFlcXhWdWFRUDRWU2NvL3Zw?=
 =?utf-8?B?VnA0WkNyM213ZnZUOGt0Rlc2OGQ5VXpJdm5BMlQrSjVkallsMGJDbDMrVHh5?=
 =?utf-8?B?Q1pJRXBJRFk5b2tOOXdaQnhQeUw0MVBYNVp4aDROcDR5cFRiODlwOWxzZ003?=
 =?utf-8?B?NkIzeU54eVBrcXNhYXZpRjdzZ05ma2V0SThBWXcyelhkRGQyU1BSbndlaGtK?=
 =?utf-8?B?VkRRRVRYRXZNR0FkY1NLamMzRWl1aVRZYUNFZ2RjUVB0TDBZaG83OWZVeUI4?=
 =?utf-8?B?bHQ4TG9FeXpEdGI3YWdFbC9GNVc3dmJzUHZlZTIyOU5TdjlDM0YzUW1zOTUx?=
 =?utf-8?B?VStWUEY2ZEVnOXovK2VCa0xsU0VuYmJmVHA1N2NJbzl2K3l2U0NDY3dHMk5J?=
 =?utf-8?B?SEx4MVFYQkJjTlIyQnpJcWZBbFpwRUVuWTNZck1BS1Zyc0lndU01dGEzQlJB?=
 =?utf-8?B?SDR6MVVrSHcxcmhuMWtqRVU2aHp1aCswSjh3SzRvektVS1QxajZodFRlUVRZ?=
 =?utf-8?B?UWI1bW1LdXd3dGVkSzUvZ0IybzM1anNqR1N2ZnZZWXh3S0VjdTlFQlFWNno2?=
 =?utf-8?B?YU1YTG9JTVN3L1VycEdKcFFQNEtKQzNOeFdjYWFUamd0L2NlRlZDVzFmRElx?=
 =?utf-8?B?UTFpY1Mxank3clBEYnZKZ3o5K1lNSDJIbTJHaHhrcXI3d0RuenRtQmh2aDlG?=
 =?utf-8?B?dHZDVDVLbUc3YU5wdEZPZzVCSmxiV3JCSnpqZ1RUK1g4TEI0U3dJbTdBd2xt?=
 =?utf-8?B?Y3BzMk9xazRpT091TlZ0a0pKU3pScXlvQ291aWtPaHphbkhNYU9uQTA5bVN0?=
 =?utf-8?B?WDlCYzFGcmpmZnpzS05JV1o5NnpNcml2aUFidzN0djJORGk4cWFYbE9NU1BE?=
 =?utf-8?B?WWhhTE9mRTB3NHVVaWpucU40a1pxN0xmR0F0ZnlESVpRL1RuSFFDQStDSFVs?=
 =?utf-8?B?Vm41Nm9jY0l5SjRwSDdXb2tpaExBPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/Pv2BIzERN9cL4txojgaq8Ogo0ayes0FuierRiDOBlzD866WlGCYUZB2YG2Q0+yjxudvRl9O+X76cxxc/m0eGvl6GDgMY4S3jlrs6wPddjic821jXCuoANM5q+wVbl8hx77ud4QGjVlv87uaLd6xqvRKgO8zUL7cgDdw6bTNahL3TEtnuX7wlJ6QmmD/eI2z6BPZKaH9ecoHJd12SjbxryGErkhBg60Ln7TuJh4USAhfbnoY4Jx8GopAqgoJgJpec1kCnqgm4Pf/dSbagHdLdxPYkmwoee0c8lkIxheBMC/jOFONs2FW7IncHQCUkBE6C31PybMkARrQ7unVLzIwJtOqokFT0pxTDvn3HqV5MBDrtCMu7YKM2twrnpu5falguivKEVW7IFv7xC5n/lUIIH/lwvWf9dZ7fPZhorXplyk97OdGA3HgNPiLUdszD84v
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 09:04:34.3911
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 213bdec1-4a34-4c06-c22e-08de72ba9057
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECDB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7680
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:consulting@bugseng.com,m:nicola.vetrini@bugseng.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[amd.com:+];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 470861737AD
X-Rspamd-Action: no action



On 20/02/2026 22:46, Andrew Cooper wrote:
> Fixing Rule 20.7 violations.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


