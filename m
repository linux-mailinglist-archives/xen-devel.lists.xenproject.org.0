Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KonIlg2lmkkcQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 22:59:52 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E039715A7F3
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 22:59:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236009.1538813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vspZM-0003aK-UJ; Wed, 18 Feb 2026 21:58:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236009.1538813; Wed, 18 Feb 2026 21:58:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vspZM-0003Y7-Rf; Wed, 18 Feb 2026 21:58:52 +0000
Received: by outflank-mailman (input) for mailman id 1236009;
 Wed, 18 Feb 2026 21:58:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nwpa=AW=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1vspZL-0003Xw-GW
 for xen-devel@lists.xenproject.org; Wed, 18 Feb 2026 21:58:51 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0063ea83-0d15-11f1-b164-2bf370ae4941;
 Wed, 18 Feb 2026 22:58:48 +0100 (CET)
Received: from DS7PR03CA0308.namprd03.prod.outlook.com (2603:10b6:8:2b::31) by
 BL1PR12MB5801.namprd12.prod.outlook.com (2603:10b6:208:391::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 21:58:39 +0000
Received: from CY4PEPF0000EE3E.namprd03.prod.outlook.com
 (2603:10b6:8:2b:cafe::f8) by DS7PR03CA0308.outlook.office365.com
 (2603:10b6:8:2b::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.15 via Frontend Transport; Wed,
 18 Feb 2026 21:58:39 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EE3E.mail.protection.outlook.com (10.167.242.16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 21:58:39 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 18 Feb
 2026 15:58:38 -0600
Received: from [172.17.121.74] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 18 Feb 2026 15:58:36 -0600
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
X-Inumbo-ID: 0063ea83-0d15-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gtsSqDmgAiSvW43Qmwxuv6RWmpQwc9r/nj7+/sMRpBqifRLkng5ZL1hAd+hKfarX0RteRh9Ueg1Gcwr3Ih68o3STP3GHrgV8XgfQprL0c4mXLltcXEcDNbDevpz+0QPdZ2gBL4WDhh9sw1yBVMALl2J2d+yrKRI+qHXt+l3x3PeHu1EuQI+9n1Na7qccU3dvoGo82Ot1wxRSw/uMs0kvjbc8qKGUNEqgDq716vyvUg/8eUJRzhR2IfB0j+ii2R2pFJVLvh0t7wTVRvF9/VZ5aN/eSbnPF7+O5jKWd36vFFKPNLQFncbJxC6reSCjhLVpHWxdyv5/G94N1QNk6o4IsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ABkrx97HXuyxoaYIfUhogiitLDbx8qZvT+AMeE6TcHY=;
 b=cZVe709WdR/Te0MG4hhHs+gDIParUoYSjlHK/k+60W4QylfubI4P4hZaZyCxmu0xIq9+CIBPe9OtVSqgriA3jFDgtz+3WhZLU3J6P9gZhFnfQ4eOL3kA3enBMuKRziYl/Ogbmu9dK4Pi715wygdxWlEAs39W9HQAbZgljxIS4liqqtJ5kNYVmGTlMQBJASJMpZ6hF9M3LVrV9huwdPcO5GsviPQruV/hGSuV+O7dbLGjunJRXrVLORpXPw8AxU2KwpCMGeXszdHnYmGi+b/bzjc54SkXuHZ+1Pe4zaJ+/zC1g24dIY2XG8PhzF4cvZiLHbMUfk9N1B7bOZhrGagg5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABkrx97HXuyxoaYIfUhogiitLDbx8qZvT+AMeE6TcHY=;
 b=3mrX/8TSqHJ89frwjE5ShwSd1SbH13xbDvI6/zBNBKWird1BVETgxRqfv0h8aOF/q/d4xL1cmQ3191zOTdAzGZ8OGe5BvbYuQs3xZ9V8aoGY2ws4vgHIh4FA203x3EKOiu6kUVZ0GP+8wAobaE7Q7z3CfmucVuGKtgDz7lFB/nc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <997450bd-3c01-47d9-a0db-21b58fdbc8c6@amd.com>
Date: Wed, 18 Feb 2026 16:58:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] vPCI: introduce private header
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <25c65557-c97c-499c-a698-571e40cde563@suse.com>
 <4fda7acb-e1a4-4a24-982e-4cae90048018@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <4fda7acb-e1a4-4a24-982e-4cae90048018@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3E:EE_|BL1PR12MB5801:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aaf5f5a-b5d8-447c-559a-08de6f38df78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dFNoQUhYU0dsTmNWSzd5TjBLZmMxclhjczZya2h1VzVhcy9zMUNsOUZZTkJS?=
 =?utf-8?B?WFhRc1hmRjUwMy9kNmJRbFBSYjFqVm9ZbVY3aHo4WjB2V1k0Mm81RGl2VmhZ?=
 =?utf-8?B?a0hvNkNuNjVoRG9Sam1JN0hFM1d0ZVFDaTNqVS9DQzZpUUJlVm4wMnQ5bWxr?=
 =?utf-8?B?VWp0VnhQdm1iWHQyNHFKcWphTVFYekl6Z0phZWJzOWU2TFZWSnpHakNGNmdN?=
 =?utf-8?B?QXRsVU9LWnZMT2tFZ3pMcktBcE5aVGFCRzlmbURKVmd0NVl6c1dnS2t1dXFI?=
 =?utf-8?B?czl6alBzSlJIMnhYUDdSMTNUcys4Sit3eDVyTjExNnNHeG5QblpxR2NPMjZE?=
 =?utf-8?B?YUFhZUVyaTFLd2RuNGF1MGgzK1RmaFNzaXZ1VlYxeVFxVWFZOGx1elRmcWQ4?=
 =?utf-8?B?N29hcGtjdEdzbEhNOW9MQUVCMEJiRTJ6TnhnMlBnc2JkUVdYZGJLaW9rMTlo?=
 =?utf-8?B?QzhDUmdhcURLditiWFkvU2hISXlER284eFRORWFuWWpFY2lWaXd3NVdKMDJv?=
 =?utf-8?B?bTdwdGhScmVpZEErYmlPMGZLRXJjSFNJQU1SV0xtRVdtK2xZZWpmSUZtQXNX?=
 =?utf-8?B?ZWN6eGVxclhYTmtDeldUM2ZCb25JUWtRdEduTlczVVhwd0FGTkZNNDlJMzZo?=
 =?utf-8?B?UFJPbzAyVzNVbllRdzl2NmFYRjFYZUFFTlBsRzBzQmtPMmZDVTU2R3puTHVF?=
 =?utf-8?B?Q1hRaWo2NlFWdmZPL2l2bFp1VjIwMjZaWWZ4RTJrVEppc3RMUWNNWGJ3SmZ6?=
 =?utf-8?B?SHE0dnBZTE5IVTNhcGRvR3JCYlNkY0Q5Y1VlV2trWUduSVphdXgxeGl1SVln?=
 =?utf-8?B?cUo0ZjZVZjY0dmtxTTltS2p4QXBoZDFwTXNKS24vL0s4OXZJWURYdHZjT1dY?=
 =?utf-8?B?RTJMTTNvVkU4T3haQXRWQmIrQW00RWZLYnBMbmRtYWFsK3JlaFloTXVNU3hl?=
 =?utf-8?B?U0I4YkJ3VkZYc3QzMmV4ZnRtT2twRHdzYXB2MnFsYWZLakdQU0tqYmJpR2o4?=
 =?utf-8?B?aHZZTkZQR0JBQzgxTU0vanJQSk5NZUJkbm9sTHgwMzJvcXFiNDc0WjZ0NVJk?=
 =?utf-8?B?bzFuWXUwdjF2RWoyUEdpL3RPOUo0YThlcUVmSjk1OTFvdG02OU9qd2RNdWZ2?=
 =?utf-8?B?Y2lHVE5PMFRSaEV3bi9KM0FtcmVERXlrdzdjZDJWN2pUUnpGZ2x1V3hGSWpu?=
 =?utf-8?B?Z2JRYlNueWNPMHJueXR1aUV1ZnZxNEZZb2pCMTVJa213UlAwQU1CaWZ1Q0lN?=
 =?utf-8?B?VUdSOG4rcXZPSW9jbXc0c2VsYkxwamtjWEd0dWNZaHhnT3BEUjhucmg2aFpW?=
 =?utf-8?B?ZE9BSXJBOURySnBnMU5pc1BEN0dpS25UWWwzcXJrMkV3MXI4Vzc1KzBUTzNW?=
 =?utf-8?B?QnhtcVBpL1FjMGhjZ3l3QS84ZGV3dkhmUHZ4dUwvL21IWFJYY2RJamlTWGh4?=
 =?utf-8?B?MTl3enI2MUxpRHJvTGJwVWt1QmpFeXBZbDkzb204TnJGNkExa1RlQlhpVEtW?=
 =?utf-8?B?OFc2YnZMUjVkb1RFSjJiSVpReEl4Y3BiQ1ZiSDNPQU5mSVJKYm9oUDk4VjFh?=
 =?utf-8?B?MnhaWGNSbHNqY2lIMnloWUdqL0F2RWxRblNQZi9yL2FGTnZoeElOY0p6cnA0?=
 =?utf-8?B?RTF3S3F3UVAzWFN4VVFyeTNSWUs0MEd5bmk4RzZ4VVhjTXpqU3JJcmw3ZENq?=
 =?utf-8?B?bUQwUldTNkFUME1Eb2thWTZLbU5jcEtYcXJHa0xXZ2hneTI3OWFSQ2gydnVX?=
 =?utf-8?B?L1FmNkZoTlREZkNIMWMzL0Z0MnpGMzFjRkdJSDNRa0JuUzdEcy82cTVqY3pV?=
 =?utf-8?B?R1ZueDI3ZnlvNVhJRnZoSlJxZGRqNkhuOXJhdE15TC9Idm4va2pHVjVteHA3?=
 =?utf-8?B?ZGkyV01oK0piSmMzblpYbUhZNkF6VlMvaUxnbjc2cUp6ZXF2OHBzYUtoTUkz?=
 =?utf-8?B?dkFkM2pXTXcrSnhQcUJjN0FhMy9sZWNFRExPVDU3a1pIcWpTdVowQS9mN0Ex?=
 =?utf-8?B?TUlaMCszNzcybWV4UnAzZFdHQkV5QXNQbWhKTEN5SkpBcENIaSt6M1JlZk5Q?=
 =?utf-8?B?OEFTK2IvaWJnekQ0b0F4c3R3cUx3SCt5a1VFRmhzVmk2SG8veFpvNE1SaWY2?=
 =?utf-8?B?NUlmK25SeVNUdHdqbFptbVdqVlVIVEdWajlDZkRzU3J6VEQvSGRrVFQxTmI2?=
 =?utf-8?B?cTh6QU9UcWlwd280blhsd09hN1NKU25hZVJhLzNxZlVPLzBrSDREUEhEbFhX?=
 =?utf-8?B?UTN4dXQrTlcrcDFoZWFkdzVkLzFRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fTgqEJ9TaBoDaEEwDqIICcAJJTHpbZgbvseOrVCEUGktPYBVEeo1awkyiaEcdcfst61VRqLajT3pjxGzxx2x0QOuHf64F0lolxsy4kzdAYgCVq1jI6M8qHWfilz8vvEJ3HfeyuYA0TcBiyUT27+U4NC80IfXJ7NrXdz0TuQ9kFntCUupxoF0LQxV135mLkD/QtsunY1ffSUZJxF/yUeIHaCGSPpphpmvFRwgNQsChZbFyfd0pXZT8AJasJXy6WL/MzICz7lac2ceV7xbgLbCuis5cAi/tDqOLPoK0Alex6e6Sxc73Yn4TiKG+CAyRt12MYq0RlSrWn1eYogMV4ljCB0nWkx1YhgWIxU2pfHDhYGhZCEpkdsg7CxU6OSxFH/gg+V7G6VNJBpRAoTpC6i2bUgulCWxETKrahvlnNerzU+ykIH5oyPOFRzY6yFxjnn+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 21:58:39.0379
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aaf5f5a-b5d8-447c-559a-08de6f38df78
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5801
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:bertrand.marquis@arm.com,m:volodymyr_babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: E039715A7F3
X-Rspamd-Action: no action

On 2/10/26 05:53, Jan Beulich wrote:
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -30,20 +19,6 @@ typedef struct {
>   */
>  #define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
>  
> -#define REGISTER_VPCI_CAPABILITY(cap, name, finit, fclean, ext) \
> -    static const vpci_capability_t name##_entry \
> -        __used_section(".data.rel.ro.vpci") = { \
> -        .id = (cap), \
> -        .init = (finit), \
> -        .cleanup = (fclean), \
> -        .is_ext = (ext), \
> -    }
> -
> -#define REGISTER_VPCI_CAP(name, finit, fclean) \
> -    REGISTER_VPCI_CAPABILITY(PCI_CAP_ID_##name, name, finit, fclean, false)
> -#define REGISTER_VPCI_EXTCAP(name, finit, fclean) \
> -    REGISTER_VPCI_CAPABILITY(PCI_EXT_CAP_ID_##name, name, finit, fclean, true)
> -
>  int __must_check vpci_init_header(struct pci_dev *pdev);
Nit: I suppose vpci_init_header() could also move to the new private header file

