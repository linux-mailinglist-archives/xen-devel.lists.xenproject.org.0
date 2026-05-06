Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBX+NZtI+2lZYwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 15:56:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B714DB6C0
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 15:56:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301762.1575958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKcjY-0004gI-VR; Wed, 06 May 2026 13:56:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301762.1575958; Wed, 06 May 2026 13:56:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKcjY-0004dO-SE; Wed, 06 May 2026 13:56:16 +0000
Received: by outflank-mailman (input) for mailman id 1301762;
 Wed, 06 May 2026 13:56:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wKcjW-0004d4-MY
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 13:56:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKcjU-007bkp-HI
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 15:56:14 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69fb486f-bab6-0a2a0a5309dd-0a2a450b951e-16
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 15:56:13 +0200
Received: from [52.101.56.32]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69fb487c-212f-0a2a450b0019-3465382053b8-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 15:56:13 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BY5PR03MB5064.namprd03.prod.outlook.com (2603:10b6:a03:1e2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Wed, 6 May
 2026 13:56:10 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 13:56:10 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kj80v9Gy7hi+AWd59MLt8CtlfHVG6eLYzgOKkjJQUGRvmfVF8O/7B6DqR6z4Si6FG3/GB3hsSPceF6mwAzVHkgrdCxmevBQlQpwzogF6EGMpgqRjK7y6yEPnjYJNcjICvAcrSKI5ix1cvmdVqX/b3aMwWqK15pwiPAu/JQC+VG3s0gDOiC36D7Zb9h1sIOlKiEU8LlnOoHtQPAx0kQcDhxaXq/2TFQay5yNp9jpVYJUvbOn7BS3YvcxLn6pp88JZM2k6cDqHBecKoT2LdGFQWs7LXtyvklFx5JuEipO74NDjWaqJivV6RI0CjgmP3xwBTrxp7tdUQsqtAHtJeS19lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h86yfRitR+Edx+8fRFPWiKjEeDNn2k6WHpP9iqYYO4U=;
 b=N79yjc4tzCunkWv2wcD/maVElzjUYKuneVSDvqdFrb5sqQ60TqmBbC8IuAz5nTj5FPCHOWejQ+SpHaAXDhXTqdXFdGyvRNq+CgyCqnl9oyT/lo4F8coPHMHESkd2pSdKdpbeUDPPMnBVE+YD/5eNinCDzdKi7KJsIX8I/jiXr5pPmD63J82pNd3hXdG8HfPBNw0JTJAoD3HrLRdiNOVXjzALi7+p58AG6N/nA2/o6oQw3aLrIK6I/zAuwgXt1sz2/ccNfeGHYsYYjDYm4wDz5GAZP+CC2YAafhWtPbQnp9QRGBKD75YFFjyA09zeZBPEBa9eSmyFpSrDeOaNNJem8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h86yfRitR+Edx+8fRFPWiKjEeDNn2k6WHpP9iqYYO4U=;
 b=TxjmSG+bEFdZnZA+U64GRBt0ayRvVwV8HbKexn5SXS/IqLh3z3GkLgJAk3ZH7VOEfaWPYbi3+WDEwaPng8coN43OY3qA1N3XVR1qEfWGrWwBfoYI5YoZqyWxNw7BRuY3heIG0MHt2ipOACLHvSGt5lyk2ayK7FavGg2rbwyuEdY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v2 1/2] iommu/amd-vi: allow disable_iommu() against non-initialized IOMMUs
Date: Wed,  6 May 2026 15:55:13 +0200
Message-ID: <20260506135514.47310-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506135514.47310-1-roger.pau@citrix.com>
References: <20260506135514.47310-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0060.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::21) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BY5PR03MB5064:EE_
X-MS-Office365-Filtering-Correlation-Id: 80daeafb-2843-4d92-8f5e-08deab773a58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	K0BigEKWt+Ll2pSKRoPbGizE6lCGfuHGkVOVtbfFJCemQiWRH1rkSIGCE8JyOEnNFG3nyZ6TodTQyVgLlRqEtjmp3CNZXUy4yMtvgv9RJcPreyOLC5gobt2qCZ2NtLc24xAVeMhx2bp56R54Br2tkkat0CLbsQAwPIRsoweMtSajPYkZ56I1xsnMFdeRFfGoYZ3laaF5Sdbw4BAhGOKaowFS8wAqjhuPalh+mQZzICu2In053tQ20taDE6+8GUkySABxguuNDTcKO/miOEtmfqNQ9gVipaNqeUO59SyszrIKwWawlUw/SluozcH3oUavrHPsbVrRBDMz/gY6k7chGvFB9NIoQqFhxMDdaHLRXEkMrpw5Zl0woEA1Q7YZLoOmPnMiMlkSvMxeieoadCV7VGphDK9jtQhCdQwN6zu10seSVFGzlEa/U8YbyQmOVMEGbI0cNSMP23rZOU0VxCP1FS+ciGXCY7POi0xrNbou5sOFgWxCP9Gm5WqXPoiwB8rnCb6Tm89RQTWqXDv7xCdiXs9TqIwtIsfcX01P4Pwiw7wfhR/fV1r2rqwyg82ACpzD4FlVHhegTovzM9MGr21GMfwDo/RDdjyxFOC9obPlgECJZ5vCKeNQWIXANI4AsO3VwCB8P4NKId8z9PHR5RZrUy1+eZc/sNguoXsWZYV6FFqdDszj3VqomL4M6eQ/E59X
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3FPY29NZStzemJlRkJFTC9waTA5L0lmazgvVGFtckM2ZDYrWGpXaVZncFo4?=
 =?utf-8?B?SDl0TUc5a3BIV1BycnJtVi9VVTVSRkloRTV4SEd3cTVBL3hLZzBxekZJNlkr?=
 =?utf-8?B?b1hOQ3MzVktnOFNLQTRvcXVwV2lMdE5nUFZqaUFzUmJEUTc5K1ltQUNjQnZ1?=
 =?utf-8?B?RytqQ3dyTGRBTkdFenI3YkdWWVZ1NGVXTml4Rm55SkN1Z29wRDN5UnRKMms3?=
 =?utf-8?B?c1g3bFpTVURTQ3lZMXF6OTcrTyt4TnlLRWNGSHFYOEoxM0M1UkEwSGVwOWdi?=
 =?utf-8?B?bWp0MGJlaEoxNlZLWnRJMElsdHk1L3liS3hQUjZ1WGlERDVYYVI1S2ZRaHNQ?=
 =?utf-8?B?b0pCQndtTXBaR09Ma2UzVk92RmNaQ0c2OENvNGc5V1hSbWd4b1BRdzBXR293?=
 =?utf-8?B?Ull4SVd0N2lvbEM0cDdaMEhCMkw5dEdrSkR4QmFSNnBkY0hmOHlFVHZHTEkw?=
 =?utf-8?B?MUdBQXdDc2laQmVtRnhab0hVN2xWV1p5Vnk3dTkvQmVPbExoSkRYWEl5WHdJ?=
 =?utf-8?B?V1l0WW1HWHhwK1F3TTV0cG1UWnd2cHRGczJmOFlyQk1SWUhUejZVYlZwY0h2?=
 =?utf-8?B?dWJuUTlVb0pUUlNYdDZxWXpYeVF6amlLb25jejk4bG01V05wZzk2V1NZb2Zv?=
 =?utf-8?B?V0tjbmVLazRxa1lKNDVkNXJKcTNOdVRUQ3B2OFVzT0svNzM4dHNPeFBZVm5t?=
 =?utf-8?B?RVloRlJUR2Y0NGJSZGpvWm5rNkFuSkFwdEY4Qm50ekIvUXEzTUJuM1ZkdXoy?=
 =?utf-8?B?NWk5amJTdGdMekx3Rk1iamVHdU13eUlRUkRmK3kyZDlTMXBPdlF6dU1LTmwz?=
 =?utf-8?B?OERPNzQ4Y2x6czZ0UGxHTnZ5YmUxNWhySU9qeW9rd0dmNHRJbXRFZGVFdUNq?=
 =?utf-8?B?R0IrNXRzTnJpMFpZTHNzQjh1U1U3MUZRYXNiY3BlNlVMU1NUckV0Z0x1RjdH?=
 =?utf-8?B?a04rV1ZxbDNGSzVMMm05MURDM3hSMjM2dEFzNElITDBscXdCei9TRWJuQUFz?=
 =?utf-8?B?b0tXSlBpK3FRM0xYeHFwWnhoa25hdzZoTUw2ekhFbXpyL0V5QXJsZ29TemRB?=
 =?utf-8?B?TDNEZzhWcjR3bFplajY3Nnk3ZmZQdTRORk94M1RtN1RkQWJuOEtVME9HN0tq?=
 =?utf-8?B?akdCeml0OS9jTk9jdFBnM1Zvb0dBTTJzQ2lPWU1OYUZlY3VxZ2IrMWZZeVJS?=
 =?utf-8?B?Zm1objAwOUU4bnJlSU9FVG0reGdUc2E5MlZOTy9pdkFLNFdzTUk5Z1pOUXh4?=
 =?utf-8?B?K2JhOTFrS0V0RWtlR0xnYjBYeG9ycjM0d3VhQkg1TDFEMmJqWGJ1Q0tmK3Zm?=
 =?utf-8?B?bWtYUGQ3MTBwWTcva0lBRTBVMkxOL1BLNzEwd0w2N0k0RlZ2TElVVk5aNW1N?=
 =?utf-8?B?SWFmdmtrS2pXbTJMVHNvV3NpdFhQdXpyOE9Gc3FmRUJXVjJZbHAreGZubWVW?=
 =?utf-8?B?bWdZbDNXSDErdVRodUJzT0IxY0I2QXdTLzhCcDRzZi94U0s3WFBFM3dGdkFM?=
 =?utf-8?B?SmROR1dYWmlxNU1RaFIyN1RpV1pWNkxVdGNqdXZDdHhQem5TRTJKVkhpcUhI?=
 =?utf-8?B?a0JIRDZOVm0vUzJyTEF3M2hTQUd4ZTRpb2l6V3lQTkJSMHMzdmplLzdIK3ND?=
 =?utf-8?B?Q240Qk95UU5NQ29BZWZmWWkyYVBFOTBydzVYNmw4NWFndS9VKzIyd3NnajVl?=
 =?utf-8?B?QTlHdGpoclpDdEdLZk5uRWNDZ2lDWlNOQnpWRHdmSlBzZ0tmY09WVWo4MHlI?=
 =?utf-8?B?YUhHVGxsYmpOOGd0YzBJaWMvdXBYS05VUzVPNkd4RVhKZVVaOW5wUGFtbEJj?=
 =?utf-8?B?TW5wYzBURUV6VjliU2hIZjZsZlkwU1IxWGJzK3laSW4zTTFXVExtZDBMSy9z?=
 =?utf-8?B?L0lNOGdVQTRyMjdndURKb2lhdEZZRDBrMFpYWHhUVnlyK0NIbm85bzBob3Rh?=
 =?utf-8?B?VHBoWDlscnE0VUpIckFCTTQ1Rk5EWkx6T1BlTTJVSnRiUjNoRVdQazdVUGlm?=
 =?utf-8?B?NXIyMk45TDhSejNnWC83d1NoTHkxT2FSdGVoc0hzRzVnbjQzaGwvTGxFcjBK?=
 =?utf-8?B?Nmc0U2JpMkdNNXkxdGE4WFVwWXhxRFRLMEREQWg4U05sV0VPVFRER2NZbHQw?=
 =?utf-8?B?WGVtMTQ1cGNJZUIwditQdEM1Wk4wOWtYK0Y3ZkF3WHArcStNLzFYdVZwMWxi?=
 =?utf-8?B?M0RDMWM5cW81aWFyK3o3RHVOTFZGd3VXSHBLTW4zRWpzUkdaU3o4eTgwRkRw?=
 =?utf-8?B?Z2dIcnVYYVdhbDU0SFJpVUJJVVJuYjlvVHBPREc2TUVoYys1QWpleXB6dUYv?=
 =?utf-8?B?RWlhTm9CTVdhNW9WdDV5K0VSdmdhelpMbWdGVWovWmtJZ2FpMTBUdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80daeafb-2843-4d92-8f5e-08deab773a58
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 13:56:10.3891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gwDz8mZi7Yiw3BLYoz8W/oiAPN7qbcOKvZagJWg6uvggHFQhkGvmn50iyUhLeFtkov8PaGvY6jJHXInTO6gGdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5064
X-purgate-ID: tlsNG-42698a/1778075773-1A16DF3B-FA86CAA0/0/0
X-purgate-type: clean
X-purgate-size: 2177
X-Rspamd-Queue-Id: 43B714DB6C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]

Introduce a force option to disable_iommu() that allows it to disable the
IOMMU, even when ->enabled is not set.  While there remove the unlikely(),
this is not a hot path anyway.

No functional change, as there are no current callers that pass force ==
true.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/drivers/passthrough/amd/iommu_init.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
index d77dd8511288..76ae78e5ea53 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -929,13 +929,13 @@ static void enable_iommu(struct amd_iommu *iommu)
         amd_iommu_flush_all_caches(iommu);
 }
 
-static void disable_iommu(struct amd_iommu *iommu)
+static void disable_iommu(struct amd_iommu *iommu, bool force)
 {
     unsigned long flags;
 
     spin_lock_irqsave(&iommu->lock, flags);
 
-    if ( unlikely(!iommu->enabled) )
+    if ( !iommu->enabled && !force )
         goto out;
 
     if ( !iommu->ctrl.int_cap_xt_en )
@@ -1139,7 +1139,7 @@ static void __init amd_iommu_init_cleanup(void)
         iommu->ctrl.int_cap_xt_en = 0;
 
         if ( iommu->enabled )
-            disable_iommu(iommu);
+            disable_iommu(iommu, false);
         else if ( iommu->mmio_base )
             writeq(iommu->ctrl.raw,
                    iommu->mmio_base + IOMMU_CONTROL_MMIO_OFFSET);
@@ -1584,7 +1584,7 @@ void cf_check amd_iommu_crash_shutdown(void)
     struct amd_iommu *iommu;
 
     for_each_amd_iommu ( iommu )
-        disable_iommu(iommu);
+        disable_iommu(iommu, false);
 }
 
 void cf_check amd_iommu_resume(void)
@@ -1598,7 +1598,7 @@ void cf_check amd_iommu_resume(void)
         * To make sure that iommus have not been touched 
         * before re-enablement
         */
-        disable_iommu(iommu);
+        disable_iommu(iommu, false);
         enable_iommu(iommu);
         if ( !iommu->features.flds.ia_sup )
             invalidate_all = false;
-- 
2.53.0


