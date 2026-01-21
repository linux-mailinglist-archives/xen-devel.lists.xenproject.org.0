Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOf5K0ztcGk+awAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 16:14:20 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF3C59007
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 16:14:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209888.1521774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viZuM-00061b-DR; Wed, 21 Jan 2026 15:14:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209888.1521774; Wed, 21 Jan 2026 15:14:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viZuM-000608-A1; Wed, 21 Jan 2026 15:14:10 +0000
Received: by outflank-mailman (input) for mailman id 1209888;
 Wed, 21 Jan 2026 15:14:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D6Gw=72=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1viZuK-0005zn-DF
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 15:14:08 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2dace9a-f6db-11f0-9ccf-f158ae23cfc8;
 Wed, 21 Jan 2026 16:14:05 +0100 (CET)
Received: from SJ0PR05CA0131.namprd05.prod.outlook.com (2603:10b6:a03:33d::16)
 by LV2PR12MB5920.namprd12.prod.outlook.com (2603:10b6:408:172::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 15:14:00 +0000
Received: from MWH0EPF000A6734.namprd04.prod.outlook.com
 (2603:10b6:a03:33d:cafe::d5) by SJ0PR05CA0131.outlook.office365.com
 (2603:10b6:a03:33d::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Wed,
 21 Jan 2026 15:14:00 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A6734.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 15:13:57 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 21 Jan
 2026 09:13:53 -0600
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
X-Inumbo-ID: d2dace9a-f6db-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jLIq2Hm4ZG+f99+mZb/W7TyqRT1FHjZ3+m1dzGNThKhzJAb4A6xR72QYs1+jaraac82Ys4NXODCmXwZzSSJ0MqyNJt41BDAo0t2K4ZV8BAoecl4OBfbBrJTam64tCq8ou64wp/Nn1RHqt7ZyAReogjLMXjjk2awZm7/aSWkPca/BCjx3/RUuOWuzY6vs4GybqwauUnabgeOWzwS8ClW9baHOe1mDk8YHMxn7Km65ZkJzo2fSH0y5JXz9pmGXalLkdA94HlZbwJGpD+B/qlEKCyjOXkN5k96q1rg7IgnKvs3uQm3dQmVNIG0qYboYriDqBJNpohILV19WOmbxbehyQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bLvqchy5GUHxBItgzBiidBSNDV6sdsLnkBQ6qcWBSDw=;
 b=xJB79TGwugCzWJhb7TSeiC+lvB+ma8lgLMw+mnWOPUWptXmKOX7BLq3mcKGtkrqnA6CWfy1TtPiQ0z/hl+ogpKFfTla15eRfRJ3det8UmCPzAJxCiawiapp7YmXyIZFrJ5b4cJL97kxjgo4ttR5NxNVVwVZd+bHjbVO6tA2iBJS/c+OG3kBNPUW64B+SMDvJdNTeL0VRRc4lHL8RWin9HMPiBrwGuV2zfb9QFWJJXB/wqSKxUid6WhcSKB3nVw2r7qGJsyYRWrkLMyxuBylHaLr/98jC4ctaE1Gd22ynWZyE0rrBAGZkCJDX3KVb/FDhiIWUZ0DUft3CTvABdBV/UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bLvqchy5GUHxBItgzBiidBSNDV6sdsLnkBQ6qcWBSDw=;
 b=3ZGuqqb5Jh7iB3zXzPyuiVajwr0lLsMJRc94SUUZhW3rA21BxrwBtayF59E9eEzKtBify618GWKF0F3DCHCIbIPpz/M+Lf27BFZFYMmEUu/HHyEViYQ6A5Twgd5Eq5q9t9qMjlUwp/NyK0gayna4bbKUfp0M2nfZTybp90oz8s8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 21 Jan 2026 16:13:51 +0100
Message-ID: <DFUD5IE041QA.HOEHGB68NZED@amd.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie
	<teddy.astie@vates.tech>
Subject: Re: [PATCH v2 1/3] x86/svm: Add infrastructure for Bus Lock
 Threshold
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
X-Mailer: aerc 0.20.1
References: <20260121142857.39069-1-alejandro.garciavallejo@amd.com>
 <20260121142857.39069-2-alejandro.garciavallejo@amd.com>
In-Reply-To: <20260121142857.39069-2-alejandro.garciavallejo@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6734:EE_|LV2PR12MB5920:EE_
X-MS-Office365-Filtering-Correlation-Id: 83b471ce-d714-48ab-147e-08de58ffb2c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TEhZQ3k5ZlBpNDY5KytzVCtYUXpWZVcwSGJGSmF2Z3B0RFo5Zk1zK3ZZYXdy?=
 =?utf-8?B?OWNMaUZEUjRoUmZqLzRvbG0relBHVUplSXJ1Z1FyVEpXUUlPdDk2UDhtWnNl?=
 =?utf-8?B?cHlWaFRtempSbDhOOVRSYWhGMTdLWS9QOVFoRlQ1ZTg5b1NnRUIyWDJIdUFw?=
 =?utf-8?B?T0lhVUV4M2E2NTRaUDhOY2pRZVVGOElDSXQ5dDQ3U3ErVmwwTWNXY0ZyTFQ0?=
 =?utf-8?B?cTFtVUdTRHJlR0FIYXd5SXVsNklHTS90eVF5WmR0cGd2NEtIWnhlTXJaZmNs?=
 =?utf-8?B?VllCQUVBcTZFUkU3K2tqRXBEN29sYkp3ZENJa3JYZDlpLzUvcHFqeTlSdW5Z?=
 =?utf-8?B?VVR0YUxLTXo3MVlFTjdGMktkLy8wVjlMNTA0dmRtUTRyK2hVS1pVR2VBNTF1?=
 =?utf-8?B?U25salk4a0JvSXBNYXdzTDlrM01tbUJhZkEyaHVmR0JlaGJKeHA4OS8rdmVW?=
 =?utf-8?B?SVR2RHNBUWYyczBvdmVES2h0TmdPeTcwUjdnMDJ6TlpTYnE2ZnMxWlBoZ1pD?=
 =?utf-8?B?dXd5MWhiSGFaWFV6NjBVLzJ2bUlZeVpwcS9URjd4VzV3K0xGeWFFWTRVUTJ6?=
 =?utf-8?B?dEtCMi9YRUlQTkZFUmdycGsvN093c0FLM1VzT1ZMTkc1anh3R1dJSnU5SUgy?=
 =?utf-8?B?Zm5aVngxWEZkQk93czJscFl4MXJCeFA1VWhHNnRnQTBFbjg2a0dCbXUxeW53?=
 =?utf-8?B?SkMvSzROa2hhajhMdTg3bGJzTVphdFdGcm1GMUtxZWFWVC84S2RJK0lMdkhM?=
 =?utf-8?B?a2cwZ2JrZGk1TmFkY2MwczFqcGpwbVBXNWpkK3ZmcW15c09CUDdkbmVIQXZ4?=
 =?utf-8?B?NDBFK0owZGdObTdPY0lFQURaZkc4bnQyT0FHeGpnZWU0K2FZMmRSSmc5Sk8z?=
 =?utf-8?B?TS9ZUnRidWp0Vng0UmlsSnVmOEJZeVBZdm1GTHZYVWYwVmVYNHlhUStqZExY?=
 =?utf-8?B?V3orZVVGcGRoYUZOWTlXNlA4d0FBYkoybEVFZDZSZExqTW1ER1NNNWZPUnpH?=
 =?utf-8?B?SE1vRFBZTHkzM0YrWlMwQ2FjcnNzZW5GWnJjZmpObDlveXRQeFBEM3dHaVRU?=
 =?utf-8?B?d01hVkZlOUZlamV4R1A3MnpDSzVwVmhRQVk5eDlJcXVScGRTZmx6cUtkN2Zu?=
 =?utf-8?B?UnBqd3VmdkFhT0JteWVod1NFazBDU1IxalkyU3dtWWFGRFlkcGFZQVpuamxG?=
 =?utf-8?B?akdxTlhobVV2U0xRQXBRNWJONmVxcnNUNmdvbmFQL3JDVXpOeDVPOWVteFlF?=
 =?utf-8?B?SkprT3lTZHMwQjhjM0p2TVVRS3J2YTNaS1NkU3d5d0hUbzhDaWcvdjZhUkVz?=
 =?utf-8?B?b1FjQ1V3R3pRM3RBc0cxOVBWZjU1ZXI2bnI3d1dVdmtZYWhsV3hLYUdOZXVt?=
 =?utf-8?B?cGxydHdHU0VTSm9mV01UWTBlcEYvTk5kd0NYakRYVFUxOGlWTURkOERJUXc5?=
 =?utf-8?B?VWl0UWJkeEsyS2JJeHY4NXlXZUVHbUZJYXlCNFNqOHp2TTlEaFIzUTlVU3ZG?=
 =?utf-8?B?bmVTT2ZqcmZqUElnVzRIYis5cEk0RHY4cmZDTFdJZEMrMmxDV05YL2kwczRh?=
 =?utf-8?B?UUNaenlSYlYybFp1aE9QWFF3RU1NUWxHV3JBVVRGT0tWcExyNjdadWdraTNt?=
 =?utf-8?B?cUJ4N3ZMUUd2b3R5SWJVWDFrTUVGZ2FHUGVvRTdYdzZWVDFhTjRBeEdiODBC?=
 =?utf-8?B?YmdMSWNpSEtQMCs5TlRPZTkwQTMwY3lMR2tzNmNaZ1BXeW51dThNY0lkS3ZV?=
 =?utf-8?B?Zm5FcWZrUktmcHZmTGsyc0w3MG9Scm1EbEJoUWJManptemY2MGlqckJJTStx?=
 =?utf-8?B?YUxmQ3ZlTkdzVUV6ZS90akVXc1g0TmVOWFFSZ1NvZ2J1aThsWmtxTVN6L3Bw?=
 =?utf-8?B?QWdINTFTR3ZoY2FRVHdQWDZ6MGliZlVrRllpU0JiUFllakdCNURoNzRycGxj?=
 =?utf-8?B?NmVQMUNPdTlJRlRnd0lEVTBZMVZOYTd3aytPUjFYaU84UmxqREo3NE1uTTBM?=
 =?utf-8?B?Y1BkeWF6WlZ0NE9paG91dnBZd0NLdE5JTGZ2OFJTVFNCbTZZWmpaN3FUZTFj?=
 =?utf-8?B?bFFwNUVROVgySGhISi9MRVNJbDJ2aUxOaEJFL3NrQ2RzTlRWRGwvQ0VINzZ3?=
 =?utf-8?B?ci91V2E5cy9sNC9uN0NDbzdUaW1ERFJ3Wm5NWmx0L29IU0h4aG1UM2pTcnN3?=
 =?utf-8?B?bVpuTTRMdVdzajBScVBlOHlaalY5QWJyNmJCcTEyS1JZOFVpUzU4d2RUeHBl?=
 =?utf-8?B?Wko0bHhBbld4ZERTSmRqWXdWd2NRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 15:13:57.0953
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83b471ce-d714-48ab-147e-08de58ffb2c4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6734.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5920
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,amd.com:email,amd.com:dkim,amd.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1CF3C59007
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed Jan 21, 2026 at 3:28 PM CET, Alejandro Vallejo wrote:
> Add missing scaffolding to enable BusLock Threshold. That is:
>
>   * Add general_intercepts_3.
>   * Add missing VMEXIT
>   * Adjust NPF perf counter base to immediately after the buslock counter
>
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> Reviewed-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> v2:
>   * s/general intercepts 2/general intercepts 3/
>   * removed _thresh suffix
>   * added missing _svm_ infix in the SVM feature
> ---
>  xen/arch/x86/hvm/svm/vmcb.h           | 15 +++++++++++++--
>  xen/arch/x86/include/asm/hvm/svm.h    |  2 ++
>  xen/arch/x86/include/asm/perfc_defn.h |  2 +-
>  3 files changed, 16 insertions(+), 3 deletions(-)
>
> diff --git a/xen/arch/x86/hvm/svm/vmcb.h b/xen/arch/x86/hvm/svm/vmcb.h
> index ba554a9644..231f9b1b06 100644
> --- a/xen/arch/x86/hvm/svm/vmcb.h
> +++ b/xen/arch/x86/hvm/svm/vmcb.h
> @@ -65,6 +65,11 @@ enum GenericIntercept2bits
>      GENERAL2_INTERCEPT_RDPRU   =3D 1 << 14,
>  };
> =20
> +/* general 3 intercepts */

I had already sent v2 by the time I noticed the request to capitalise G. Fe=
el
free to fix on commit or let me know to resend.

Cheers,
Alejandro

