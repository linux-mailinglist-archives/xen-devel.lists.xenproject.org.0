Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPS3MGJdvGlxxQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 21:32:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A562D2306
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 21:32:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257552.1551929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3K2Q-0006i6-IV; Thu, 19 Mar 2026 20:32:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257552.1551929; Thu, 19 Mar 2026 20:32:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3K2Q-0006dx-EO; Thu, 19 Mar 2026 20:32:14 +0000
Received: by outflank-mailman (input) for mailman id 1257552;
 Thu, 19 Mar 2026 20:32:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mAdu=BT=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1w3K2O-0006KY-S2
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 20:32:12 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af85ed8f-23d2-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Mar 2026 21:32:04 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH5PR03MB7789.namprd03.prod.outlook.com (2603:10b6:610:20f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 20:31:57 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9723.019; Thu, 19 Mar 2026
 20:31:57 +0000
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
X-Inumbo-ID: af85ed8f-23d2-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=muOoSoluOxzmG4OIA2HgCyZk5m90/uPBIZ2ytdXUVrZlTGMA6fbsSt0CCOuYg33t8pUUZ97dLJj3mI9AobF6bDKGc7J48m9ndTpEjhp8VHZL1wg2z+m0le51tlqTiIYtFrbew0CWr4YY/wtFjUJ/YKEOLWDJJchXG444HbbZaUdGIe+YIsNCQb2R7eO9XhzxrztRbabqffRcE5yFtZNEcR4x6O/wMF+TBSWxER0z27XyPv/pSxmI6wVgJrFxVhOp03dRUnWqIYbIbNywvkNsJPNBAKKXmlx6sUN255AjnSMhRAkLPOefSWMm73ZU6g7O+hywExxdIcqJJ/Ax+IjqTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8BKvawhqBKt6zTuvx/6FWR9p/me1eeJw0tIV+uiwXQ0=;
 b=JtXoesvW5AGdWbkjWJ45023plcPoNhyKWx8cFNSHuGejAsMAhiNks1Q91XOt0TvOiSc75e9DtWaYLHkzcrv2QF3C1YZjnybPtB+nCuvYhETOtohZzrOrjye4EUUImG/yOGURStjIJ+vAYF6vsXbmSQJ0ThLpevayx7TgdRLE/YNWZ7bL06Z8LR18aJKO9d17t1La56kmE2zpOBVCjhiQt4WwZuD4wcPQ9B1fyepJCTFW+EgJ2ugB50/6FwKg0/RfYmr3VDWD8cFWCoc4vCV9woXUqalpJruJtJg+49bP3+WQEH5N1QXRwD0fFI9Xyn9LXzue8YFLRNI8BzRyaB4XFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8BKvawhqBKt6zTuvx/6FWR9p/me1eeJw0tIV+uiwXQ0=;
 b=POSrY25uQP5HCXJ/GM9bbVZc+y4uGYZUfp72r1rxbC7IFWQtsMkx+9yEl7VxD68uIoXzNakqabPXNTNEz3cm3dMVnxzNMKFPdF9Hzj0BS22SzRyc8su5gzhQVFSN8732WhDtcXjnV5jmzepdfJcLY/oASP9boQOHaAVBVdXjyKw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b2574a87-4707-4eb1-9d1d-23caedfb5bbe@citrix.com>
Date: Thu, 19 Mar 2026 20:31:54 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 6/8] x86: Remove fpu_initialised/fpu_dirty
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20260319132924.1469809-1-ross.lagerwall@citrix.com>
 <20260319132924.1469809-7-ross.lagerwall@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260319132924.1469809-7-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0202.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH5PR03MB7789:EE_
X-MS-Office365-Filtering-Correlation-Id: b685a6d5-f40a-40cb-55b3-08de85f690b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	zq93eZDyhlAgKatdcuugq4Hu8T37gaMA3VjD7YtUlTPLacyuPjLZbmw38/Nb2eKGgpM5VAL2BIJA8Q9LyyDA8E2QShqybpcxK7VAwo7Fcl7xfkyO0SV9VFNH6gUghnPMjipkCdC2oSrc3dkDaldckKrfovCDaWvleLnycHF0VY8zpXWhzx9lKjLSboQbHBbLJ4f0bfFkKvi4i660W3vCdpHadnuxEUhhKZGzOAN7hdnQ/t5L3Dy+JdrrOFpCH1RLVRqeJc6cfVXTVGYT6Jvu3yRfMMJ56XhqmL3nfWR4m4JS9yGLbzZvwEWBd8Wi6wS0MuN1e7UoCJ9e7IGht8H/p3L77K+5YrCM4sWapbgONtWEGjPpjPhwzGMh3JwLoGtzod5OOKFu27DZL1Q2c13Bi2dCT+vBzmvgNQn2GB1eg100Uh4PrPo9keF1a16fsBk6Zlo82FGhdN02Isiw6BBF2nibJFKsxujKDUBF0T4o9HTkRTuhy/3qz3NAMxj5shLwd2ZpnISVWhrW3cenyvbfTBCyyv/yOUzeL2AqYafs6XW3NeA1VPnuj5BjjaV9faLH2hfthy8flBKQ1l/j5Z+o8ZseGWPnZc/Eqqqq9ucYZMl+yV+prKrnFYLAUNEzYRZ+zArYmUPZzIWd9YNg4C8yEe2a97qLTjvSZLsm5voO2HUvtOvSf2FovRp1Y/1xA6JjKUZU4OrQmdQL0VJRuYDOJ81kC4iCjT0gw4jXjhR/tFk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkIra1luN2d0by9XS3lkdW90NHJQR0R3SlcwZDRWUGNjdk1sWkVRMFNDWjI5?=
 =?utf-8?B?ZlNERER1Q1d1a0pxR1RvRVFLTkJOZ1J4T1g3a3MxRjBkRVoyVExpZkR1bHpD?=
 =?utf-8?B?OFVtaGZPdVFld0poM3E4dFBFRTRadDd2OStYb2JNOWtSRGNXU0NqUGhLK2J5?=
 =?utf-8?B?Q1R0UWsyeGtzL25XM2ZqcTNRQTB3QTNVVTlvN0pzOWZpRkErcVJGV0NDV1BI?=
 =?utf-8?B?UTh6R01ad2FFVHBZOHlnNmpyUVlqSWlJc2p4cldYRU5aUzZzN29Ud0E2dGxJ?=
 =?utf-8?B?dUdLdkc5VEhYdjFoVk8yZDR6WjBjRklpR0p2anVKN2pPbC94NmdSMExpUkUz?=
 =?utf-8?B?RVN5NCsvTnd1Wm94bzZKSDZWRGJiMjVTd0VwWnNZeDFPdUNFZ1NlK1k4MUMz?=
 =?utf-8?B?anFZelFjNko2MEpROE9lWmVRMFRzWlZ1ZWtzZnpoVzFJZG0vc2grcXJxSi9F?=
 =?utf-8?B?ZkxGRGs3QmJrZmRlM1M3MHhZbDU5cnE4bGo4MmpVcnN0ZEYrckdyeXFQVjdv?=
 =?utf-8?B?OWR3ZzNxajdlTzN0UEJmamVjSExVaS9tYlFLSlZPM1VSMWRkdDZSenVwbXJq?=
 =?utf-8?B?d0lKTldsVCtadGNXSUp5dkRtRjllRUZBM3lJdzYxa2ZHZTM3cG43NW1WZWhB?=
 =?utf-8?B?MzhKc2dsQUVMUWlBbzl6VTZUcDVEa0lvcjBuWmlnMXdpck5JcjRpSGI1MmJT?=
 =?utf-8?B?ZkIybmsvcGdaUlR2SCt6WkdoMHk1OEVGZWRLQTZKVFBwRURkNm10RnhSVjd1?=
 =?utf-8?B?OHVZSnlyQ0xCUUd1emdZNnc3eDJJcnJMVVgyMEwzcVcyQUkya3RPY3U5VEFh?=
 =?utf-8?B?Zit2M2w0Q2U3amMrRDdNenJPYUpTNmR6R2w5Zi9ZdlU1bnVvWk1Ebk5TbDhM?=
 =?utf-8?B?WGsxVk1XeWh1VzBEV2xKdXN2OUxSNDRBeFh1eUJTUEgvU2w2czF6ZFhhRStY?=
 =?utf-8?B?RHRvTUpyelA0eWgvTFhDSFdOQUdmQkJyMTluR2VMejArRUR3NzRlUVdrMnVu?=
 =?utf-8?B?WUhkV2dZb2svZnZHMDdzTkNBZ0RGSW52TWJGbEo1dHRwKzVEQnBoN1lRRzJq?=
 =?utf-8?B?c0luZTZSdkt5ckRPSncvYUZycEM1clIwUCt1R3JELzN0WFZLOGZGTmNacmVp?=
 =?utf-8?B?YlBTclJlRThjOUVrOUNUbjdZcEV5SE1FTnZLN2FLVkp5WElFMS83d08xeGQ2?=
 =?utf-8?B?NURqOFBzUmtxN3NrRVJ4Y205NERjRkVGU2hLN3Y4Nkw2RUd1eE11WVpyQVVy?=
 =?utf-8?B?c3pLakdjTDF0VkxmajN6U2Zwc0F5RjF5S014MEVpUFV2YTBucEdGNlVCNjRj?=
 =?utf-8?B?eHg0SlVzSHR1ekw2NEQ4VjJQQ2wrSXhQVXdCU1haZkpGdXF1ZjJxTHUxY096?=
 =?utf-8?B?a0xIWng5UlNyREV4czVUbFQ2SnQvSFppY1JSaTR3M0dkc0J5YWZwQlZ5eFd5?=
 =?utf-8?B?VjMrMEJEei9KTUFBaGZDeDhnNGprOXpYYkhoQ1UxekdUZnF2aFNPbFg1dHJk?=
 =?utf-8?B?WDFTQmZHNGFtYjB2V1J1aktWWnJUTUdLcnA2b2JmREh3SDk3cmdoTjQ0MXR4?=
 =?utf-8?B?Tk0xUXFVME1RNzFUL1RjOVV2MG9PK1ZWZW9uQ0R2YjdKTEZqOUdKd0RtZjcy?=
 =?utf-8?B?NC9DN3d1OWlHSTlPMnlCaERIdkpIMUhFOHpQS0pyVUN4RnJ4Ti9qc1B6Rzhk?=
 =?utf-8?B?VlVPaXhHU1BhYVhnVFNWSnBDeXNNZWZVc21aRG5renhxQ2puQzZOK2d2aFhn?=
 =?utf-8?B?b3VuSDkzd0MyRHljVkEyYkRuc0ZQMnVFZGtmRTlPV0VkTGdMaEd4MzFkcUxG?=
 =?utf-8?B?akxiWVNab0ZLVlU0L0RPVXJVUzArbGxhdjNMaS96aWI1VFdVVnRqM2pGSFR0?=
 =?utf-8?B?YUF1MUFVbnk2UHZuQVRmWGJFdWYrMVhRelpVWWh0TUJYUHlsVWt3UUZ4MCtW?=
 =?utf-8?B?YmI0aURYdGJPbXByNllNYXZSVXJvMTNQTmlxMndUUjBkNUc2S0tQR0VTaWk1?=
 =?utf-8?B?Tm5SbnU0RkhJaDlXa0czL0VMTUdyZFJoY29FYTM3eEFUZGs1VHE5RU00QTQ2?=
 =?utf-8?B?S2piN1VKOG9mMGNyQ2xLMjQxMVcxMUc0NEtndlFlODQzNk5ldm92VDdHOFlv?=
 =?utf-8?B?cGl0ODRWVi8wN0kyRWk4cXFxOEhmYmZJRm1hVmdsbEZVTUdkbXAyamJPell3?=
 =?utf-8?B?SWhVdGM3N1FIdGdTdE5ad0RkcGh6RWdUejJrVmRCam5uTGVUM1MrQ3QrWnh3?=
 =?utf-8?B?T0l4NllMdVFNaVRIWmhlVkZkRWtIVFlNOWw3YlEvbzh6TXd0M2FVMUFsYXFE?=
 =?utf-8?B?NnJDZDFTZHdJVjFaeTVFeXRNWU9NYXlOQTNBQXlzWWlqSlRENGNsYy8wZFRm?=
 =?utf-8?Q?C31uOrkK2wuwRbFA=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b685a6d5-f40a-40cb-55b3-08de85f690b4
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 20:31:57.0242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vE8Kc8cLdlOxzDfP5j1/izbH4WHC9hfzkdGm3NIRREnHuhYXcYiL3+h/yTDBFF3faYOhLUQqkM9ML5EO7xFSataUIxwpXfahVq9eV6Q7URw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR03MB7789
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:ross.lagerwall@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 28A562D2306
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19/03/2026 1:29 pm, Ross Lagerwall wrote:
> With lazy FPU removed, fpu_initialised and fpu_dirty are always set to
> true in vcpu_restore_fpu() so remove them and adjust the code
> accordingly.
>
> No functional change intended.
>
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> ---
>  xen/arch/x86/domctl.c              |  3 +--
>  xen/arch/x86/hvm/emulate.c         |  6 +-----
>  xen/arch/x86/hvm/hvm.c             | 15 ++++++---------
>  xen/arch/x86/hvm/vlapic.c          |  3 ---
>  xen/arch/x86/i387.c                | 31 ++----------------------------
>  xen/arch/x86/include/asm/hvm/hvm.h |  1 -
>  xen/arch/x86/include/asm/xstate.h  | 11 -----------
>  xen/arch/x86/xstate.c              | 21 +++++---------------
>  xen/common/domain.c                |  2 --
>  xen/include/xen/sched.h            |  4 ----
>  10 files changed, 15 insertions(+), 82 deletions(-)
>
> diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
> index 942f41c584d4..d9b08182ac1d 100644
> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -1409,8 +1409,7 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
>          c(flags = v->arch.pv.vgc_flags & ~(VGCF_i387_valid|VGCF_in_kernel));
>      else
>          c(flags = 0);
> -    if ( v->fpu_initialised )
> -        c(flags |= VGCF_i387_valid);
> +    c(flags |= VGCF_i387_valid);

This is an API/ABI change.  Previously, creating a vCPU and instantly
getting state will hand back a record with !VGCF_i387_valid.

It's fine - I've done a bunch of API/ABI changes in the FRED work, but
it at least needs calling out in the commit message.

We have had a lot of cases where calling arch_{get,set}_info_guest()
without an intervening __context_switch() would lead to subtle
differences.  Generally I've been moving in the direction of
architectural behaviour and not worrying about API/ABI changes which
would occur naturally from running the vCPU.

That said, I think d1895441b3bad (2007) was the removal of the final
consumer of VGCF_i387_valid in Xen.  We don't even have a conditional
reset of state based on it's absence, and of course it's documented in
the usual place, so it's really unclear what the purpose of this flag
ever was. [edit, see below]

> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> index 79697487ba90..885f5d304b2f 100644
> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -289,10 +288,8 @@ static void vlapic_init_sipi_one(struct vcpu *target, uint32_t icr)
>          hvm_vcpu_down(target);
>          domain_lock(target->domain);
>          /* Reset necessary VCPU state. This does not include FPU state. */
> -        fpu_initialised = target->fpu_initialised;
>          rc = vcpu_reset(target);
>          ASSERT(!rc);
> -        target->fpu_initialised = fpu_initialised;
>          vlapic_do_init(vcpu_vlapic(target));

This whole code block irks me.  x86 has two architectural events, #RESET
and #INIT which are well defined, and this is using the former to mean
the latter.

We are going to need to fix this, and it's going to be some fairly
invasive renaming, but the result will be better. [edit, see below]

> diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
> index 88018397b1ad..5e893a2aab94 100644
> --- a/xen/arch/x86/i387.c
> +++ b/xen/arch/x86/i387.c
> @@ -265,7 +240,6 @@ void vcpu_reset_fpu(struct vcpu *v)
>  {
>      struct xsave_struct *xsave_area = VCPU_MAP_XSAVE_AREA(v);
>  
> -    v->fpu_initialised = false;
>      *xsave_area = (struct xsave_struct) {
>          .xsave_hdr.xstate_bv = X86_XCR0_X87,
>      };
> @@ -282,7 +256,6 @@ void vcpu_setup_fpu(struct vcpu *v, const void *data)
>  {
>      struct xsave_struct *xsave_area = VCPU_MAP_XSAVE_AREA(v);
>  
> -    v->fpu_initialised = true;
>      *xsave_area = (struct xsave_struct) {
>          .fpu_sse = *(const fpusse_t*)data,
>          .xsave_hdr.xstate_bv = XSTATE_FP_SSE,


Hmm, looking at the callers of these two, we find that Xen has
VGCF_I387_VALID too, and does have a consumer of this flag.  (This needs
deleting for sanity reasons.)

It also means that this patch does introduce a bug here.  Calling
arch_get_info_guest() prior to scheduling will hand back a block of all
0's, claiming it to be valid.

We need to arrange for vcpu_reset_fpu() to be called during vCPU
construction (i.e. so we've never got a bad FPU state), before this
patch will be safe.

~Andrew

