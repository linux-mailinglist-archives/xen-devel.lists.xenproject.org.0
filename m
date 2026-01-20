Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFpUJBnMb2mgMQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 19:40:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0016F499D6
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 19:40:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209287.1521350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viGdc-0002YH-JY; Tue, 20 Jan 2026 18:39:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209287.1521350; Tue, 20 Jan 2026 18:39:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viGdc-0002Vp-Gw; Tue, 20 Jan 2026 18:39:36 +0000
Received: by outflank-mailman (input) for mailman id 1209287;
 Tue, 20 Jan 2026 18:39:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tce1=7Z=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1viGdb-0002Vj-Nt
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 18:39:35 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b639f81-f62f-11f0-b15e-2bf370ae4941;
 Tue, 20 Jan 2026 19:39:33 +0100 (CET)
Received: from PH5P220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::15)
 by IA0PR12MB7601.namprd12.prod.outlook.com (2603:10b6:208:43b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 18:39:26 +0000
Received: from CY4PEPF0000EE35.namprd05.prod.outlook.com
 (2603:10b6:510:34a:cafe::c0) by PH5P220CA0005.outlook.office365.com
 (2603:10b6:510:34a::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Tue,
 20 Jan 2026 18:39:28 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE35.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 18:39:26 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 20 Jan
 2026 12:39:24 -0600
Received: from [10.71.192.102] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 20 Jan 2026 10:39:23 -0800
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
X-Inumbo-ID: 5b639f81-f62f-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WuHoWlyxnhlT2dGfXDLLHmYJ/GRmO2SYy14uQhtGYl+IbUFlSYTrcNRvLnqdCljBJUbiRxpKi6umr6LFbAOD4FCNfaU+if1fcZKGyg/qRhTeZYTkTNLw3u7uvgwYKlqSB6GeHoCMlmr7GgteyuYzBF3/igmne1RmfaViTG7tZl7P8gA78RGQVibHq2cXJ0ijBt15g0rEMBXqggvloaYczyJO3qGUbbaGHuO4ePTQjhtkI+I8MLJRDpuQsiUzbhmaJ7VQmQVq1pJKg1zsmyCLz1SUf6RxR182nd36FL0exVNuK5gaPbJW7QJ8QesE+/hoN5i2Rl0dGKDg6yo15T00Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9lrCCxiD8hJQD3hxgO2twKCy00V5+OdjsauUV3ipJiE=;
 b=VUp+45hxqqbCJwQ107tU4Ego3RgcgIISDZv8+Yi/eWOdeM2HQPNsJOydMF3EDRyq7z1T721dHQwuwgGNAEkxcTraeO6xTgAfZuFAltqbO2JXFGxWCWF0gtFwV9jbzz5UFEIxCq0V4ceegYzoJOU366LlBv9fFuGmnpFx9FBJ1nEnMYGLhykd6WSp6W8JDfqJSvJu+AHvmBKV+956nlDulGrbDpZoLh0otjFEBTwNpO3VRO+LQgnghP+Eu0QY9e8/cE8ayUrduRP6kTvoA3u/v5hPQQs7z/VssuYUlJQuzyAFkKjOJXdYCkXKAEei3wvDmfnzalCBkHUKtZZ+b5aS5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9lrCCxiD8hJQD3hxgO2twKCy00V5+OdjsauUV3ipJiE=;
 b=C2z1fxeZk7KFUarHhNQiSxR3DK2zmDXRPyX+nRyhKcTgZfoIgvLR8V2nFcIx+QDL8SvCSay79hiey0MoNZpyG+RvhChRF0sReMUVG2vuZS0L1vNYTmqBTwNWq1UGhYr1f34wZT1QkSpqgsef2voRq8AmsCCXeiehDpGRtZAZyQk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <7dfe66e7-73ae-4420-8e3e-e7acf814ddf0@amd.com>
Date: Tue, 20 Jan 2026 18:39:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ImageBuilder][PATCH] uboot-script-gen: Add support for
 specifying domain P2M pool size
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>
References: <20260120182346.114435-1-oleksandr_tyshchenko@epam.com>
Content-Language: en-US
From: "Halder, Ayan Kumar" <ayankuma@amd.com>
In-Reply-To: <20260120182346.114435-1-oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE35:EE_|IA0PR12MB7601:EE_
X-MS-Office365-Filtering-Correlation-Id: 83864497-bd64-4643-9455-08de58533d26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bzRnZE8rRzFGZkc2amZDMHF3YTM5SldwVmN0ZkhrTWhJQTVWVFpEbkhwUVhu?=
 =?utf-8?B?N0FuMy8vV0ZDZ2plcWtNOHU3KzZlcC9OV2tCM2h4SmljSjRpSHdZdTB5anRV?=
 =?utf-8?B?OGxJY0x4aTJ4ZEpsWS95Z2dDK0ZnQ0NaeU4xSlN0bWFISy9sZTJMa0NkWTJS?=
 =?utf-8?B?V0R2d0ZDVTRsM3ZWTU1Xbk1FWUJvWlFNdm9UdXV1RlNpYkJ0R091RTAzdzln?=
 =?utf-8?B?TXQ4WDY0Q2VxTmFIRERLK0pJMFRENkV4clhPcGdFN1g2RHh1R2k3Ulg2Zjcr?=
 =?utf-8?B?TUhNc045TW4zSWdwZVpSZzNRNUtsSmZ5ZjUwRjRqOTk5eERHYUZnTzJReG5E?=
 =?utf-8?B?UElWSXBZcGhuTVk2WEtYcklEQWYzY0o0L3BIaEExbTUvZ3RPWEI4ellWTEJa?=
 =?utf-8?B?SGZ5MFc0eWh4OEFVQzhGK1l6WVRLbkxSV1duZ05zMXZwRk80R1ZUMmlDT013?=
 =?utf-8?B?dlJkalJWTXlWL1IyZ3BlQ1FQZ3BaUGZBV04waXBCakltSzJLSlZORDRDWHdB?=
 =?utf-8?B?UUlGVmZ1cWYxeWlXdG9tMWloemQ2c1QyWURKVUVFK1FIbzFIajFlRlY1b2lN?=
 =?utf-8?B?S1FIUU5ML0ZXRGtpeDJhZjlDNWltM1ZLcGZuZGxmbXlwTGRCR3E3Z1RqUnRL?=
 =?utf-8?B?dk0zN3BMTGN5Tmc4ZU1tRFhSdFBuSEdqaDFkY1dHdk82akkyZ0dRUEJTNHE4?=
 =?utf-8?B?eVRoejk3VVRBUHRnK3hibzJ1MHV0RFhGbnlMNUZIdmJqaFV1V0swLzBZamZw?=
 =?utf-8?B?RkR5b2taUmhkOVUycWI1ZWpSa2hMeHpEZmpYekpRT2pHNXV5TUhjcC9JWVdE?=
 =?utf-8?B?YWsrOThSdWdGTlJGSEJOL1ZKRzZqYzEvTmI2b2UrZWtZZktYQUordHphQnJB?=
 =?utf-8?B?em5IanVzdkNCYlFhd04rMXJScDVRNnY1MkNkMnBKZ0VBclp6MkdVdVNCUWpO?=
 =?utf-8?B?V3puOFVESENjUG5PVXJqbVlJcUhoWjN2NGlTVXBZeGIwVi9ldGV4bGJHWC9y?=
 =?utf-8?B?UkR4dkF6SE9NV2FRY2tmRWpPSU1GTWh2MVQweDZHQlhteTRJckZaMVJaekZ3?=
 =?utf-8?B?N2NwL1lDYUs5NnZpQnIyemRxblV4MDNoT0N2M1Bnem1MYkVUVVJvbDRHUFJO?=
 =?utf-8?B?ejJpTmRhMEVPZXBHREQ5QmxMTkJsWTFSRS9wM3FYc0dzSTEycm1FdEZzS2Vk?=
 =?utf-8?B?NlZ1cmZJa1hJVkI3UXM3Y1R4QkdKQ3lRcmhBZU0yVFpTU3dpdEFtNW9aREFY?=
 =?utf-8?B?MTlvSTJxR296enppR3dCYzdTdiswdThyelJ4Y3FhVzFFV0toS0Jnc2V2dUFC?=
 =?utf-8?B?WGhSYzU1Z1luYld4S05USzMzNG5tSUU1VzNCdTB5QWdhQTk1dUYxbmVVWnZz?=
 =?utf-8?B?Zmh0QnNZZUFZdjc5d21LYU9BbGlld1AvdytMYXluQ3BiTjhwdXFRQmZZREU1?=
 =?utf-8?B?dDRncWpNelJUUmNNVTVpMGd0ellERTljVTB3ejFZeWw3eTNnZGpSMmprTWRH?=
 =?utf-8?B?NXhYM1VpZnR0ZG5YUmh6eitmSU52OHVabTFwOG9NQU9tRmVKWGpHSTBGbSt6?=
 =?utf-8?B?bUh3V1JXOU5CT1RGVklKckZobjJQcDF4NUZPNmpnZmEwdDdtcEdvbXhGM2Vj?=
 =?utf-8?B?aEZueGh6QjRqelFrTENicUJNQk5mZ2JKS1piQ01tRFZPcGtjTldncFdjNnhX?=
 =?utf-8?B?Ylphc3FRUWMxWVJtN2x3c1pJSWJuMTNCWVdqOHdNMy9GVmFXN3RsTnUvTzcw?=
 =?utf-8?B?V2hMaVBza1dXYUJ3cW5kT3ZEN3dJc21qNDl4WFdYQUhHMmp2OUhLUFVHb056?=
 =?utf-8?B?cEgvVXdLYkcyalZ6MjJXRHRUa2w1aHZwOHE5Tm5HS3BqTitsZXFmVTZocVNj?=
 =?utf-8?B?bjRxWXdjbFhsQWg3WE1Qd1duUldnamFrZFlEM3hVVE9yck1TSC9UZ3JjZ1Bi?=
 =?utf-8?B?ZHpQRXFyaDBQRmlGQnZwRHhHSkltL1h5UUJoU3pERHBQSkhnMTRkNjRwNUMv?=
 =?utf-8?B?MTZPYUFiZSt2TDJudDNCczJDYjB2VFE1b3J2eDNBMWRQREs1SWFOOWp6anRE?=
 =?utf-8?B?RjFsSHJpaGNJNFN1Kzc4NzZQbklWckJteXBGaEFLd05VbnZiblR0WHdXNWxs?=
 =?utf-8?B?dGJJUi8ybTRxU2VUTTN3SWdjQUJ1SVpkTGllRmZxZmZGdFJlYXg5bWFERW42?=
 =?utf-8?B?clFzbWdoTUEzTkZYbUlOTVhaeHgxZnVjN0wybTJjNjVLb0NnRE9BRG0xemVn?=
 =?utf-8?B?d0FRK2psUkRhVk1LNEgwYmpiUm1nPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 18:39:26.4255
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83864497-bd64-4643-9455-08de58533d26
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE35.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7601
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[readme.md:url,epam.com:email,amd.com:email,amd.com:dkim,amd.com:mid];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[ayankuma@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Oleksandr_Tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:michal.orzel@amd.com,m:stefano.stabellini@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ayankuma@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 0016F499D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Oleksandr,

On 20/01/2026 18:23, Oleksandr Tyshchenko wrote:
> The DOMU_P2M_MEM_MB configuration option is used to specify
> the amount of megabytes of RAM used for the domain P2M pool.
> It allows users to manually define the memory size reserved for
> P2M structures in non-hardware domains, overriding the default
> value calculated by Xen.
>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

with a question

> ---
>   README.md                | 7 +++++++
>   scripts/uboot-script-gen | 5 +++++
>   2 files changed, 12 insertions(+)
>
> diff --git a/README.md b/README.md
> index 983cbbc..c7ae98e 100644
> --- a/README.md
> +++ b/README.md
> @@ -203,6 +203,13 @@ Where:
>     NOTE that with this option, user needs to manually set xen,passthrough
>     in xen.dtb.
>   
> +- DOMU_P2M_MEM_MB[number] is optional 32-bit integer specifying the amount
> +  of megabytes of RAM used for the domain P2M pool. If not set, the default
> +  size is calculated by Xen.
> +  Note that the P2M pool is used to allocate pages for P2M structures for
> +  non-hardware domains. For the hardware domain, P2M pages are allocated
> +  directly from the heap.
> +
>   - DOMU_MEM[number] is the amount of memory for the VM in MB, default 512MB
>   
>   - DOMU_VCPUS[number] is the number of vcpus for the VM, default 1
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index d18ac55..0c86c2d 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -514,6 +514,11 @@ function xen_device_tree_editing()
>               dt_set "/chosen/domU$i" "passthrough" "str" "enabled"
>           fi
>   
> +        if test -n "${DOMU_P2M_MEM_MB[$i]}"
> +        then
> +            dt_set "/chosen/domU$i" "xen,domain-p2m-mem-mb"

Was this property recently introduced in Xen ? If so, it may be good to 
refer Xen's commit id.

- Ayan


