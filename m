Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJhBEzqJlGmxFQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 16:28:58 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D8714D91E
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 16:28:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235147.1538194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsN0F-0006ce-Td; Tue, 17 Feb 2026 15:28:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235147.1538194; Tue, 17 Feb 2026 15:28:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsN0F-0006aL-QK; Tue, 17 Feb 2026 15:28:43 +0000
Received: by outflank-mailman (input) for mailman id 1235147;
 Tue, 17 Feb 2026 15:28:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+1Z8=AV=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vsN0E-0006aF-83
 for xen-devel@lists.xenproject.org; Tue, 17 Feb 2026 15:28:42 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54b5b052-0c15-11f1-9ccf-f158ae23cfc8;
 Tue, 17 Feb 2026 16:28:39 +0100 (CET)
Received: from BY5PR03CA0003.namprd03.prod.outlook.com (2603:10b6:a03:1e0::13)
 by SA3PR12MB9227.namprd12.prod.outlook.com (2603:10b6:806:398::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 15:28:27 +0000
Received: from MWH0EPF000C6186.namprd02.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::bf) by BY5PR03CA0003.outlook.office365.com
 (2603:10b6:a03:1e0::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.16 via Frontend Transport; Tue,
 17 Feb 2026 15:28:23 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000C6186.mail.protection.outlook.com (10.167.249.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 15:28:27 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 17 Feb
 2026 09:28:26 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Feb
 2026 09:28:26 -0600
Received: from [10.71.194.215] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 17 Feb 2026 09:28:25 -0600
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
X-Inumbo-ID: 54b5b052-0c15-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z00m+dYYHVGlyRrLYlfnvNeeMm01haCMT99LcpRdk9q/wfDSVDHZqPx4a3DVXXoZNAynlILBwzasZelTL2b+0uFo7FhVZJLYSU+RUAL89sL/QV1Mg3+4aq0Xs+MwTenmJAbY4Y/LW/vit9SGXhq2mZXz+sKg+64xpZje4+xN14xFI6lzrsEZ6e4sJKK4/ceWL0+Uom3XkL7IctSNeLJvTak/LXfKhQj35UTWUl62QQLH6YhQ6zc60OE3c8XTTCd0tonhRHkBfTqk4tir2cdVqBYB0O1T+Y//tTHcnYv2vGRYi5uZJRIf2S4MnhmnbeSN5u2f5avCyzanl/E5jPNDRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OxcUDoQL252eVzIou23h+L2DSICCWKQ62YBpeBJIlew=;
 b=cZkdrMldOcErfgM1WIxHrNklyLOsmPJeGTOnpwftOXra57xI/innyHhysTAEj+uezGZN8YzTueLqK26UD9PR4RrWpubTrGwS3hhioFDFq+gtmSYJx3x0Umv5y0e51McIune9gK3ErsXeL5vDDC3UFk2rMcsbZUrIUKwtvNhhDrrfByhdJAGDjgvw0TvMlrLg79Tn3mCIN/zQpc0YyMNr34XN4yWS6oKonaMglWUrXuMytyXKY3sBbA7osO+fWaZbKKGzrjFN6mYokf3d6wwymceF48+nk9zNyJehs6Ft2LjR51G2nXf3xS0QW4dHcQl/4Smq4ByYXLs09wrYQwlbZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OxcUDoQL252eVzIou23h+L2DSICCWKQ62YBpeBJIlew=;
 b=hTedhwBqBBaNAqdyG7clUxIl5F8RdPIx5yDWH5XsexhEVZfaQlzffJ0qsdS0D4RwxW9YIo+g6jMDqAowYQHLXW67pbS4mct+1UIWxkUkAlu/FUARbtNuJF9JP04i/A0y1h9/bcwsQHir0sG+YN+yEiXiV9hMNZhmAoL15hE4Muo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <abd54c11-28fc-4487-a2f8-733007d361ae@amd.com>
Date: Tue, 17 Feb 2026 16:28:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Arm: tighten translate_get_page()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
References: <1d898900-1072-4ea6-ac4c-1262905cab29@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <1d898900-1072-4ea6-ac4c-1262905cab29@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6186:EE_|SA3PR12MB9227:EE_
X-MS-Office365-Filtering-Correlation-Id: ebf29c3d-5cad-4540-8170-08de6e39326e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YnpFcFNtcU14cGxwa0grSUxrQjFsZWt6cWRVOTJQakFyNVFEMGRlRVI1RDBI?=
 =?utf-8?B?VUlRZWdQQ0VDbEo4V0VWcW9wSWkzWjRzVXpSVnBjRFJqL0hsTkM1S0lWL0dS?=
 =?utf-8?B?ZytyUDB6Z0M3Z3UreFd2cE1SMzFhTlFVOW1YbFR0YXRiR3QyRE8vSk1LbVF3?=
 =?utf-8?B?eCtTTjI3Nys3WGQvWUNpQU52cFJic2JRZzdEbnZZMis0c1ZxZW1ITldySElW?=
 =?utf-8?B?K0pxMlJaaHhLaUpiNnhycEYyVkFENG90U0ZtbkVwVEtNVmVBSVdYY0FmSDRk?=
 =?utf-8?B?SFVOQWh1WkR3V3NWeGtSUXpEd2NvVHRzaWxrOFZlbkFPK3c1K1VsL3N4ZzRS?=
 =?utf-8?B?ZklKNWdRZVdYUmx6SjRidjRuMjNqREJXdUFsSndKSTVBL09HMzlQWVlqcUhz?=
 =?utf-8?B?NzRNRU9RZjZaQ00rckJwWE45dHhnSCtVVjBGZXI2d2FYelZ5Y1licWczcklr?=
 =?utf-8?B?b0tyNHZXZ1o2aVNpZTZra3RGTmJxRFFkOVZFNjdrK2xzTnVKZ2FpdGRFU21j?=
 =?utf-8?B?MjRucGdOOFBwcFJEdmVsR25RbVJkN1hqaUthc1Arem40cG5UVzZsTmZScXZW?=
 =?utf-8?B?aytGNzVYNDlSZ2locmlZTVBjZDljNitnQ0hXQXF5R1ltRlhLWWlGTTE5SnhR?=
 =?utf-8?B?NmpIVjNraXRPVnpha2loTFRhbjZLUkdxTWVPZ3cwTDJBTGJ2L0JDYlg5TW1S?=
 =?utf-8?B?eFN0OWRJS1RId2lEN2UybnBETzg2WkY0K1NvSUxqbmZMRU40R1RORmVFVita?=
 =?utf-8?B?dlV4VjR6dFB6bEs0TnhiVERaN3Brbk5sTkRzMm1qUkkvMG9lR2lKbTE0YnF2?=
 =?utf-8?B?VkllTkxwcDRRVlRDT2h5c0VYd1Mwc05CcnA4MllXcVhkKzNDNXpwSmdmOW5W?=
 =?utf-8?B?VEdHcTdFZ2RTL3hKRXJBS1YrOStlTmN6R0tnbCt6RnRIT1JHRzJxZUd0dHJG?=
 =?utf-8?B?UXd3WFkwTW90U3JSZ3YrNUE5b2F3d3U5eElsZm9ORkxKZktmK0I5RlUvQUNY?=
 =?utf-8?B?UjZ3RTcxZGU5MlRWUWhEcHB2RWFNbytnY3RJK09VeUdvb0J5dldhMEN1R21S?=
 =?utf-8?B?aHdqUHZiTGplVUZEZk9NeGJNY0VaZHZyRVk0SVJHaGJ2UTRFUUFET2lpYjFI?=
 =?utf-8?B?WEx4c1BSelJLTDNuWW52Rk1lZ2lKekdkME9TMm9odFFYVCtmRXNMUU4veHBa?=
 =?utf-8?B?emxpYzkzTGJtZjBwOWU3V0lsNlJCNHcvWlV0QTY1c0hmTXFZbEN3dDhpZ2Rr?=
 =?utf-8?B?K2pUS2xVSnNWb1Q0Ulp4ZTB4NFJlcVZwODYwWThmaURhaVVOQVY3QXZmWjVi?=
 =?utf-8?B?Wmc5YnptS3JOR3Q1WFZJTU5PUnlMUFdHTEhyTFU4Qi83Ym8xMXhoTHZTM2dl?=
 =?utf-8?B?TGgwYUJWNDAzM1VxVDFkbmJJclUrTFFWbWdPRU43UVdWTE53amhtNDVoeEln?=
 =?utf-8?B?Y1BmaC9RSVBLcDB2NEJyKzN5VUlXNlhRTHdQUi9nWGhGUWgvYlF6Um5jWVNN?=
 =?utf-8?B?UWMvQ2QvRnhEQm4wRFVJTWs0NE5SRzhVL3U1cHdPUjY0dVE2ZTZHb1d2TnVO?=
 =?utf-8?B?NVNuL0ZUbUlrSXh3QzJudWVrSHRvNVpyU010eW93bDMvS2doTWxvaFlua0hH?=
 =?utf-8?B?MHNJSzNWTHl2RWdjMkgyaGI1ZFd2OWRPK0ZweER4b28rMXdKL2Uwb2Q1dHp1?=
 =?utf-8?B?TXRqeS9ydytDelFzY2t5UCtsNkRYUnhEVGRjMjdSazRYbStJbVVqSUkwWHQy?=
 =?utf-8?B?cnI5TVQxK2pIMk1kdEhzRElEM0hxc204RTB6V1NVL29WQmRmRWhVb2tQQnlr?=
 =?utf-8?B?dnUvWlAzQm9KOFZ5bzVmS2d3cHFsd1YvUXdNN2V6L2lVU0VVeUpWWVZYcUkr?=
 =?utf-8?B?TFVDZUl6WDIxOW9GL0oxS2xTb2hmRk5qUlNFbVZ0QmFTenk3RW0zVGgxTnc4?=
 =?utf-8?B?SnpBQ2NjeVo3eEIxa3QxTzM2aWxKU3lpSFNKNXpSTlpzUS9QakRxbFFGNGUx?=
 =?utf-8?B?MXVaNk81bUw3SE9QVGJHRE5IU0cwZHZwZzJUWTBkamVjVUp3aWR3Q0dZN20x?=
 =?utf-8?B?VHZoc29xM1pwa0J3d3RlSWxuKzVJbUhSYlVlYnNsRG9UQVZDNUFvNEZoU3BK?=
 =?utf-8?B?UkFuMDBxUE1BeWhXbzhtMVhsS2p3KzQrdmVxb1dteDhBUjNrQ0R2MTMxQmI1?=
 =?utf-8?B?VGcyTmQ5Y0Mrdy9TRlI4QjkyTWQzaENxU3RzSFpLTXAzbVNyVThKMTBoTEZL?=
 =?utf-8?B?QnBydE9XOGxya3JZY1UwbU45SHlBPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MOuVGzpZeyMRQeA1aN16vTX29bVYCP6OXILmc8mc47pwGdlp1vmxlEhk1AOjaHQkZiwYGT8d0Eu0+l1K0G9aimE3+lXkhSGUwrx8awpE5v+LnHrKSpmJ9jMwzaV7a0+0Hen3zm5W+ckLLDevJNYH42GwO/gTLGig26c0cQayZIfZOXBvNessmX+J1Cs+sS4LZx0WMrk+truv0O73rO0BIgLMxcXkhPRIQ9T0R9gkCLXyYdjQCbvWm8+Gm3rzMOjP+q+XJwYWfavCY0/EFws3XMPZW9S5HSZIoLDW0i8xgV1OjH4V+yO9Aw07ZsDYlsoW3tWPavwXhu3GADPCDk5LGfuMq0dEfo52uikCdaG1hL9umba/afdq8TU5H8OJl1TDs2dBE1NvOodqlqQGLDUh6zhloWMfdwfoOr8x3he+k8qZHlDdATyGJQMUzzBxwCph
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 15:28:27.0152
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebf29c3d-5cad-4540-8170-08de6e39326e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9227
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
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:sstabellini@kernel.org,m:volodymyr_babchuk@epam.com,m:bertrand.marquis@arm.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[xen.org,kernel.org,epam.com,arm.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,amd.com:mid,amd.com:dkim,amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: B2D8714D91E
X-Rspamd-Action: no action



On 16/02/2026 16:20, Jan Beulich wrote:
> Permitting writes when the P2M type says "read-only" can't be correct.
> 
> Fixes: 1661158723a ("xen/arm: Extend copy_to_guest to support copying from/to guest physical address")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

> ---
> What exactly p2m_ram_ro means on Arm is unclear: The comment next to its
> definition says one thing, its use in get_page_from_gfn() says another.
> (I remember raising this point before, i.e. it feels a little odd that the
> ambiguity still exists.) The patch here assumes the comment is what is
> wrong.
> 
> --- a/xen/arch/arm/guestcopy.c
> +++ b/xen/arch/arm/guestcopy.c
> @@ -44,7 +44,7 @@ static struct page_info *translate_get_p
>      if ( !page )
>          return NULL;
>  
> -    if ( !p2m_is_ram(p2mt) )
> +    if ( write ? p2mt != p2m_ram_rw : !p2m_is_ram(p2mt) )
>      {
>          put_page(page);
>          return NULL;

The ambiguity you mention is indeed problematic. This mixes page type with p2m
type. The comment "The p2m_type is based on the type of the page" admits this
conflation for DOMID_XEN.

AFAICT, p2m_ram_ro is not used on Arm for normal domains. The only use is in
get_page_from_gfn() for DOMID_XEN. Maybe we could change get_page_from_gfn() to
always return p2m_ram_rw since DOMID_XEN has direct 1:1 access anyway?

~Michal


