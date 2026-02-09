Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLSfA5r1iWkaFAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 15:56:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BE11113AB
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 15:56:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225543.1532068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpSgN-0000KY-Q9; Mon, 09 Feb 2026 14:56:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225543.1532068; Mon, 09 Feb 2026 14:56:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpSgN-0000J7-NH; Mon, 09 Feb 2026 14:56:11 +0000
Received: by outflank-mailman (input) for mailman id 1225543;
 Mon, 09 Feb 2026 14:56:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EeIc=AN=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vpSgM-0000J1-Qf
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 14:56:10 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7653ebd1-05c7-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 15:56:08 +0100 (CET)
Received: from SN1PR12CA0058.namprd12.prod.outlook.com (2603:10b6:802:20::29)
 by PH7PR12MB6561.namprd12.prod.outlook.com (2603:10b6:510:213::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Mon, 9 Feb
 2026 14:56:01 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com
 (2603:10b6:802:20:cafe::58) by SN1PR12CA0058.outlook.office365.com
 (2603:10b6:802:20::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Mon,
 9 Feb 2026 14:56:02 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 14:56:00 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 9 Feb
 2026 08:55:58 -0600
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
X-Inumbo-ID: 7653ebd1-05c7-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L0tCCW2TnXE1rxqsDqsI0X6S1cNxACcH2pKPz30IHbQIjmTTFv6hav4z3W3ObgswYu0qqUzTaLGuY10IyBxjFnVUT4c9HJ7EoL2b39w+Mxc51Y8c+vy1pJ/AtiSOKM3WqCM442GdTENmEPH+Nq6CvVVECXYGSGYCIKHME69/AkXf+D5Ph8UlZ9C9C2ZbKswbVSqFHt8LiGHVIHL+AUENZMAqwGcyt0fiDjHUmlFDFMXtBWMK38D57vwDCuV6kYDRZStvQ2GYWtbJRjVCRnHL+UTwMKaiG80WzCNrafigIztd4J9QAEhKRIzif/QAkKBXzlph9vdtpjNc3//+k7XNUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UFeVnkscL/WhswoMvEC9z5ioUAUych1M2PAJQb3ihdU=;
 b=ItpdprWWlS3CdU8jMNo06hosIMnhWpH55gr2qQNNlX7R2pcMYBMr03GBnJTMBiCwRaBEBTrttab5qYZwRtfriP0VIKUf68O+s3iM/heeYhrZF69bOLIO3N0OoEHkKO+ZgQSJHtqDD91W+il2P7fpU4Vc/XMwKJjo+7bEWVai3QUizJzO1wpH0TlVHNP/fZhTGNoA2GX9sTfqZpGB8u7vZk0KmAIgwSPBEsF9DG0ts4ynCZheYZYV5e0TLrb9/1PPXS5khilT4DO0Kk/wDLSKJtBfBJmSLYtnjKz//b9U5zQe62anlxpX8qkvn79+cd32v07V0RmHLZKL91x7MNLDqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFeVnkscL/WhswoMvEC9z5ioUAUych1M2PAJQb3ihdU=;
 b=tdZYndlwssMYZYAuV6yJ/QjbHptXDk9V1Izo4SMa6O4NDJRE6feZVV2MCt28+1fL9GqV43qpGJSgekfHnLJmvlngoPEKXx6Bvna3SZLZ+LcNkq0keGt3TBlfyhs6XPcnPUcxeqC8sll+8ec8UkPJCWvi7i2Y3X7dlRAVNxK8Wws=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 9 Feb 2026 15:55:56 +0100
Message-ID: <DGAIO51BV4RA.1Y3G3VGPB3M1M@amd.com>
CC: <roger.pau@citrix.com>, <jbeulich@suse.com>, <andrew.cooper3@citrix.com>,
	<jason.andryuk@amd.com>
Subject: Re: [PATCH v2] x86/hvm: Add Kconfig option to disable nested
 virtualization
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Stefano Stabellini <stefano.stabellini@amd.com>,
	<xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20260206210554.126443-1-stefano.stabellini@amd.com>
In-Reply-To: <20260206210554.126443-1-stefano.stabellini@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|PH7PR12MB6561:EE_
X-MS-Office365-Filtering-Correlation-Id: 17eaec58-efb4-4180-43ff-08de67eb5717
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TUlQRWgvMW5waHlkOUNpalFXbjRySTRqSzBkMm1yRTdqMFdKUm50bUtnbWdm?=
 =?utf-8?B?aXNRWGtsTVNiNExqRk1UM0VQTWJHNDVUREx3SG5SRkUwQ1ZDVXoxc2FBeHpi?=
 =?utf-8?B?cFlvb2IxRlNtSmNyOTY4MDg5VzNJajlWUm5PekM0SzlyaHhxRkVUbDJnZmxU?=
 =?utf-8?B?NklINEswTDBoNmoxODlmTUh6eHVKakcwTHhzOVYrZkZYUHpYOVA3VTFwY3Fr?=
 =?utf-8?B?WER6YTZIcGV2eXIvSlBVTmlZY1NobFBlWHU5LzNEZXlKV3pEdGZCVENOYUxa?=
 =?utf-8?B?RXpNZjBvK2JUQjBabEQyYVh4Q1lPQ2c5VWFXUStYK3daSlVSdTBsb3M3MHIv?=
 =?utf-8?B?b08wbWc5dlhsNFo2RllWMlF5NE1zYndLTDU5OTJpbUZPVG9wOEdYTVA1TnRm?=
 =?utf-8?B?SnpXK0M0YUQwbURaN2JlR1RZN1BWM3pBQlZBT0l6VHdnSEoydTBhR1Z2UW9U?=
 =?utf-8?B?NUJlTEZBZmdVbFdacUUyakI0ZUJ1UzZaWGx6VGt5d3dzQ2FIbkJub3ZML0gw?=
 =?utf-8?B?bnMxYStjM3czaHBERitzQ2Ewa2VleFdzaUtqVFdGTUsrSE9aNTRVb3BEQVgy?=
 =?utf-8?B?cS9yL0g3WGdOb2FDOWNwNmw5YjBqVHhNK0tyUE9WeHlwMmswTnVPcGZRcXFI?=
 =?utf-8?B?cHc1RWwvbjNLdmQ0eDNNSDFYTWtnOUc5KzRYeWdLQkZ0N0xuMmgrcHdBeHZV?=
 =?utf-8?B?ZStVMDh1dnlrTnUyZmZ6Q3RJa1FiaTZyS0x5U2hNSjd4YzFtR29ZNjA5NnVQ?=
 =?utf-8?B?UUZDYm5HSGdFS2pqNll5c29URXVESmNVTDNibzh3OWVQcmsxWnpkdjhYVFJy?=
 =?utf-8?B?S09NL3hNb1kzcnZvM09mZjVTNWRkcURmamxwM25BQ3VENjVaQVFUU3Rrc0k0?=
 =?utf-8?B?RTZiSFJFUitMZE9SMmhHeHVPSXZyd2lybkRrS3AvaE9ITkdLN2F1SVFOUVRT?=
 =?utf-8?B?VHArWUU0UC82YzAxMUhIK3c3aEtTRTJ6Z1NSTk9oV3J6UEdUZ1ByV3VmSVMz?=
 =?utf-8?B?cy9ydGwya1BjbENwclRJck5RVnNIOFFmdTYvakNQK05FWGU4Qk1CYVpIdUM2?=
 =?utf-8?B?UmJyejlyRDQydVVLV1JsU0FvTVI5VmRtSXFzQlBkdlR2WkJuY3JiTzgxUmxk?=
 =?utf-8?B?cXphR1VrRGxHTFhRNHNxcGlISVZlMUJySVppbVpKQkVlUGg3dmUrcS96VEZp?=
 =?utf-8?B?QXZTOFZjdHBxaGxTTGN3VFRTd1prZkhvbFNuZ3VocEpCcnF1WEhLQWJLbkxO?=
 =?utf-8?B?N0xjMzBHeWpUV0dHVEQwRzNhajlreW1WTXg2ZXVLNGxJWkJHL2VZYmRDMHI4?=
 =?utf-8?B?cmdJdlBkcGxBYkYzVmYxWUZsdHQxMkh3WHNWc2htL2hSVWk2VlA1YnIyQ2Q5?=
 =?utf-8?B?RDdmcGVuMm15QXpzOUFORmtyRGRISXBGZ0hzTGpyV1RvSFVnNE1lRzdmSDhU?=
 =?utf-8?B?U1VJM095U3RLNmxyK25rbDBFbHJkc1g5a24vU3p0RWNLS3ZHNnZ3anAvWmtt?=
 =?utf-8?B?WFdxUWE1SVdjbW9YdmpWdmJGVzRISnZNV2JnZmhaRFViTC8rZTU1TDZOa05n?=
 =?utf-8?B?anRHU1V1YXV6dW1jMmtCWWxWVlI1NmwvSERiUlRyV2t4UHVUUno4NTF4UGZL?=
 =?utf-8?B?MnJFNnMxcXYrby9id0tDZGh1bXd5MUFrOW5Od285VlpRTFlaeTczcU93cGhZ?=
 =?utf-8?B?b3gyV3lwTFY3S3Q4aVI4NGxuekFvcUszVWlXSVRob2lXdk1kZnhIWGV2NC9j?=
 =?utf-8?B?WUllSGFiOE5DOW5kaDhDcjlaQ0k5UGgrakVxTTEralpYWnluN2pYZ3NTSW40?=
 =?utf-8?B?Mm5wakZCQUtzYmg3WnM0TjJRT0tJUFc4S2pFWUQ5S1R1WVlEL1VXRllPdjlV?=
 =?utf-8?B?UGJFZ2s0ZHFXUStWNnpaOUtocTJPdGhiNFY2dCtabElYSHRSZnBsVHNDWDVX?=
 =?utf-8?B?WTZYekRSR3VkZzl6ZkVncUM2OXZ5NU44YmpTdHNZdjh4bUs3UXdJQWFqRkRM?=
 =?utf-8?B?c2FHTzFzUy9ZTjlDa0dWWXlwdmtYZG9rUnBPcFFxbGRWZm1EaGVVRlhrMDZ3?=
 =?utf-8?B?ME5QUUtQcUs1dGF2d3A5bkp6R2dmSHdlS1JWZ1l3anQ4U3FuRGc0OGlSaEhs?=
 =?utf-8?B?Q1R5VU1UVzZPSUl4WVV5NlhFOFBKZGZyYmt4SnB5K0lRdytkYnhOb1ZyR2kz?=
 =?utf-8?B?bU9EV1hQaUFORGlDZVZiWUxKREFrdzIxdk5NYnZ5V08wTXNqb0ROUWdFYkxw?=
 =?utf-8?B?dXNmMU1oTitVQ3JKdG5Na0Q3NnJnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	keRYI0T8ocbdGdYgFsSUfytWmriaAPIAYv+Dlp/UL58MYQPje7+L+ttW/ynj2tNylP9kRAHWmP7Iy0Yp5DR1AWeYfbkwbG0EbMFmkSm9C5F+1pKXTLlpmfnT7/2d9UyiC9W14HkuOFytbZqDn524Us7/4eU8+zWl6305P5BK5KRuFeWf2MfjZ3kK6fFxdjOsrzVgRkWICSmBZNlZwuSO4XBzEEUbNG2zacuPFaDkTFBNqH01/rFC4bm4VwrFiXoGHKVqWgqMLVmah06OqviDDoUi1tpfsRikW66MoXQXZ20U8uAGkJK8ZlMwMR1p8NX6L/xhlhrh0xz/dxUVJpunU4VIk0/sIAgOqhh+ZoO/R93bh3vGjJG33VNz/LXgL0blW2x68Fgk2J0zTB7O+phmkrjso51WbAkqE2Z7e0To7xhszTn0kV7Jm+t5ORKVMXda
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 14:56:00.8699
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17eaec58-efb4-4180-43ff-08de67eb5717
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6561
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: A0BE11113AB
X-Rspamd-Action: no action

On Fri Feb 6, 2026 at 10:05 PM CET, Stefano Stabellini wrote:
> Introduce CONFIG_NESTED_VIRT (default y, requires EXPERT to disable)
> to allow nested virtualization support to be disabled at build time.
> This is useful for embedded or safety-focused deployments where
> nested virtualization is not needed, reducing code size and attack
> surface.
>
> When CONFIG_NESTED_VIRT=3Dn, the following source files are excluded:
> - arch/x86/hvm/nestedhvm.c
> - arch/x86/hvm/svm/nestedsvm.c
> - arch/x86/hvm/vmx/vvmx.c
> - arch/x86/mm/nested.c
> - arch/x86/mm/hap/nested_hap.c
> - arch/x86/mm/hap/nested_ept.c

Good riddance.

>
> Add inline stubs where needed in headers.

I'm fairly sure we can get rid much of this diff by curring off earlier.

>
> No functional change when CONFIG_NESTED_VIRT=3Dy.
>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
> Changes in v2:
> - add ASSERT_UNREACHABLE
> - change default to N and remove EXPERT
> - don't compile nested_hap if not VMX
> - add XEN_SYSCTL_PHYSCAP_nestedhvm
> - add IS_ENABLED check in hvm_nested_virt_supported=20
> ---
>  xen/arch/x86/hvm/Kconfig                 | 10 ++++
>  xen/arch/x86/hvm/Makefile                |  2 +-
>  xen/arch/x86/hvm/svm/Makefile            |  2 +-
>  xen/arch/x86/hvm/svm/nestedhvm.h         | 60 +++++++++++++++++++++--
>  xen/arch/x86/hvm/svm/svm.c               |  6 +++
>  xen/arch/x86/hvm/vmx/Makefile            |  2 +-
>  xen/arch/x86/hvm/vmx/vmx.c               | 10 +++-
>  xen/arch/x86/include/asm/hvm/hvm.h       |  2 +-
>  xen/arch/x86/include/asm/hvm/nestedhvm.h | 52 ++++++++++++++++----
>  xen/arch/x86/include/asm/hvm/vmx/vvmx.h  | 62 ++++++++++++++++++++++++
>  xen/arch/x86/mm/Makefile                 |  2 +-
>  xen/arch/x86/mm/hap/Makefile             |  4 +-
>  xen/arch/x86/mm/p2m.h                    |  6 +++
>  xen/arch/x86/sysctl.c                    |  2 +
>  xen/include/public/sysctl.h              |  4 +-
>  15 files changed, 202 insertions(+), 24 deletions(-)
>
> diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
> index f32bf5cbb7..133f19a063 100644
> --- a/xen/arch/x86/hvm/Kconfig
> +++ b/xen/arch/x86/hvm/Kconfig
> @@ -92,4 +92,14 @@ config MEM_SHARING
>  	bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
>  	depends on INTEL_VMX
> =20
> +config NESTED_VIRT
> +	bool "Nested virtualization support"
> +	depends on AMD_SVM || INTEL_VMX
> +	default n
> +	help
> +	  Enable nested virtualization, allowing guests to run their own
> +	  hypervisors. This requires hardware support.
> +
> +	  If unsure, say N.
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
> diff --git a/xen/arch/x86/hvm/svm/nestedhvm.h b/xen/arch/x86/hvm/svm/nest=
edhvm.h
> index 9bfed5ffd7..ed1aa847e5 100644
> --- a/xen/arch/x86/hvm/svm/nestedhvm.h
> +++ b/xen/arch/x86/hvm/svm/nestedhvm.h
> @@ -26,6 +26,13 @@
>  #define nsvm_efer_svm_enabled(v) \
>      (!!((v)->arch.hvm.guest_efer & EFER_SVME))

This should be IS_ENABLED(CONFIG_NESTED_VIRT) && (!!((v)->arch.hvm.guest_ef=
er & EFER_SVME))

Then DCE removes all calls to the stubs you had to add, making the stubs
redundant. the stgi and clgi handlers need new helpers like those of VMRUN,=
 VMLOAD and
VMSAVE so that svm.c can dispatch #UD to the guest rather than relying on n=
estedsvm.c
doing so. Afterwards you endup with a cleaner nestedhvm.h with no stubs and
all logic removed by DCE.

> =20
>  /*
> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> index 18ba837738..0234b57afb 100644
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -46,6 +46,10 @@
> =20
>  void noreturn svm_asm_do_resume(void);
> =20
> +#ifndef CONFIG_NESTED_VIRT
> +void asmlinkage nsvm_vcpu_switch(void) { }
> +#endif

Rather than doing this, why not compile out the calls in entry.S?

While at it, there's the hunk about p2m stealing we can also get rid of:


	        cmp  %cl,VCPU_nsvm_hap_enabled(%rbx)
	UNLIKELY_START(ne, nsvm_hap)
	        cmp  %rcx,VCPU_nhvm_p2m(%rbx)
	        sete %al
	        test VCPU_nhvm_guestmode(%rbx),%al
	        UNLIKELY_DONE(z, nsvm_hap)
	        /*
	         * Someone shot down our nested p2m table; go round again
	         * and nsvm_vcpu_switch() will fix it for us.
	         */
	        sti
	        jmp  .Lsvm_do_resume
	__UNLIKELY_END(nsvm_hap)


> +
>  u32 svm_feature_flags;
> =20
>  /*
> @@ -2465,6 +2469,7 @@ static struct hvm_function_table __initdata_cf_clob=
ber svm_function_table =3D {
>      .set_rdtsc_exiting    =3D svm_set_rdtsc_exiting,
>      .get_insn_bytes       =3D svm_get_insn_bytes,
> =20
> +#ifdef CONFIG_NESTED_VIRT
>      .nhvm_vcpu_initialise =3D nsvm_vcpu_initialise,
>      .nhvm_vcpu_destroy =3D nsvm_vcpu_destroy,
>      .nhvm_vcpu_reset =3D nsvm_vcpu_reset,
> @@ -2474,6 +2479,7 @@ static struct hvm_function_table __initdata_cf_clob=
ber svm_function_table =3D {
>      .nhvm_vmcx_hap_enabled =3D nsvm_vmcb_hap_enabled,
>      .nhvm_intr_blocked =3D nsvm_intr_blocked,
>      .nhvm_hap_walk_L1_p2m =3D nsvm_hap_walk_L1_p2m,
> +#endif
> =20
>      .get_reg =3D svm_get_reg,
>      .set_reg =3D svm_set_reg,
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
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index 82c55f49ae..252f27322b 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -55,6 +55,10 @@
>  #include <public/hvm/save.h>
>  #include <public/sched.h>
> =20
> +#ifndef CONFIG_NESTED_VIRT
> +void asmlinkage nvmx_switch_guest(void) { }
> +#endif

Same as for VMX. I didn't check the rest of it, but the same idea should ap=
ply.

Cheers,
Alejandro

