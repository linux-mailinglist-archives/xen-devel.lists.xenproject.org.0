Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A/DxLCWSVGpKngMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 09:22:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A79A74804D
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 09:22:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=vEuM0Ual;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1361462.1613693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjAzE-0001bZ-Rc; Mon, 13 Jul 2026 07:21:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1361462.1613693; Mon, 13 Jul 2026 07:21:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjAzE-0001ZZ-OB; Mon, 13 Jul 2026 07:21:56 +0000
Received: by outflank-mailman (input) for mailman id 1361462;
 Mon, 13 Jul 2026 07:21:55 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wjAzD-0001ZT-7n
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 07:21:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjAzC-00E7DU-B8
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 09:21:54 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a549207-5cb7-0a2a0a5109dd-0a2a4501aabc-32
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 09:21:53 +0200
Received: from [52.101.62.55]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a549210-3ea4-0a2a45010019-34653e37d5d9-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 09:21:53 +0200
Received: from CH0P220CA0025.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::20)
 by MW4PR12MB7264.namprd12.prod.outlook.com (2603:10b6:303:22e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 07:21:39 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:610:ef:cafe::6) by CH0P220CA0025.outlook.office365.com
 (2603:10b6:610:ef::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend
 Transport; Mon, 13 Jul 2026 07:21:39 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Mon, 13 Jul 2026 07:21:39 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 13 Jul
 2026 02:21:38 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 13 Jul
 2026 02:21:38 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 13 Jul 2026 02:21:37 -0500
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f+GF8xJ9UWbIwDPH/gt2dv/b3igvaOU9OsqQ1WYezntk7i+b4zqKmqwiXEZYSk9G/T571j5vReajAbvCcY4Ce329XOGBzqO+UF/IXKN6ylqMo47nTu5f9D3RxEUvlnBdHh2ysCxiWSroVofSkuOGnr4QlfJqGZctlVzK/GvUkUje8/9xkGsVpgkwlX1R7CPQpC0HDqjiSDJuJg11l4NzQrpuU1kgsZb839THRLFuJBtVmbj8lRiInb25aQ7k/6TUwLskfLqVNKTi7C6AO5uIHRzaOyBbW25T9YUGetFQ7NHOShDHInyMJ+BHHULh2WtMWxz7Ez7Zqjl3+adPMp+ylw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FW5Q+q2Sz41w6qLWwrXDZpRQBA2Xo1Udr7mE4Mmtqf8=;
 b=i/ur0t2Q0AFA0mtkAdqlYKYhNXxgyNLUcxpHsTu4qB6WJ1DzMeVdqy5NsNMyxJalAMYN7qtE+TKU7EBgN8o8LY3ny3OINAChCcNLAwKcOUfw2ptc0IOfm/fD2TmIjNykki23OkyVNClOgLBPukdVH/cg11qkkd+X2BR04kOeXLlSnFKg2aw3zdUq7GbBGmQhLRkVrengZ44qKt9rjgb1ZX5tBGod7zyYk26ax6o/wFUDRYuLTAd8HMGDNB5ZXV3aBCN6bdq6Jq7+drw09QeC9KRiupG++AUojRbuAOuWpvJttqRoRPrFu4owguZJFraQjgGWhCl/GxkIN0fOjRUvYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FW5Q+q2Sz41w6qLWwrXDZpRQBA2Xo1Udr7mE4Mmtqf8=;
 b=vEuM0UalEcD1m5xbgMxPt0IQB95VB5Kl3AoEe/WZGUWquEtI44nILuH9k9xZKB3kdgGQz6Zyc+vWPdYCYusdzYdBk83t29qzuYJ+QasMar9AXcKYQ6aYV7oUigaWQW0swDhcFiK4orF0U6D+Asx00ID9D0VtyaZsr/o4/ppcxCc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <e61f2f7e-4686-4566-8916-b22f38332786@amd.com>
Date: Mon, 13 Jul 2026 09:21:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] dom0less: Prevent division by zero in
 handle_passthrough_prop()
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Oleksii
 Kurochko" <oleksii.kurochko@gmail.com>
References: <351b89ba726d5524fd920cc28b7204d683fa8c43.1783856794.git.dmytro_prokopchuk1@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <351b89ba726d5524fd920cc28b7204d683fa8c43.1783856794.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|MW4PR12MB7264:EE_
X-MS-Office365-Filtering-Correlation-Id: 40416cc1-ec9b-417c-8021-08dee0af6176
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|18002099003|22082099003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	B0xUJYyWF/fR2ENBEdBiMbvrKP8PVW/MnFirhnFwq3ytdRu2vqp/+EUQo1pjdhWEjcrE0XDxRwI4vlhNJFrQKnM/zw5bJ+frDF9vH0dWUd7NU4AR4gKKvSob7XgtMz+X+fMumtBUwwCb5kp44ETxQ2c6X8+FfR2N/gEQTMLJIWwjZ1h6xRreKCQDvNCcA4N7mCCWfpJJLqsAjduOxCktcFGWbhnStCUxMzRtbE6fDggtXgRdvgw7PoqQrZEKHwsPMwl28NAQPJ7o/zcSWtLY6iRnFf/UpBBdidWzpGtHyZILttACGIhBcmLD2AonIVA+uK4Peknja0HQ82aATlkdcAdoHAELCa03ndUIvIM6swYs7/6CkjjjGfiYlY5OzP0Hh/aeiegx0/EQl0UaEXY3U9fYZ20kw1afSptcM8KiUNh258ZjFfJLqtvixnR5hEvUjD6TbqT8ix6mh19x730BCYBLZawOozFXzMA9uJq4rYpgg03OG3dE0o9BtBvL+KKRDrxXpofCs2q+ZQL96jlnw+q6qgTCz6v4moq1HfFVMbPqXwk3aGdiMmUDTzBA9OiGAeGXJVCMh4bnyKoMh1GGbSO0/3t/EGwoyaByVptUBohOUBEU5T4JbdbcdwDVsMhhww0/hXw4Usda/GwAj42J8WmCYUEr6ZN++JxMMr9UbYH6VCZ3WHLociE0N/rae5jCZS8BFz2dM8wKvyfsEugGHg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tlBwRx5vmN/vANtlPxvoh9ZbCpKwAK1PTSRHcwL93GT/x6aF5dMRXkBptd0ikZY/g+Wt0GKB0kP2LDzyiTFPwjobJi4MJlW6NlRzo6UV8w3QNXiTYPkV2EhAWw7QerR1t0GT/GEJG7GZjUNP4IT12moGri6dthrhe98dLkW4IjUGK2+5wpctjEgXJW+FJs81MbbsXvOKWsA9Za8O0kRB6z/scan/Bl3x+ZMg0ni9zbcxrjJJczwz30IUCRKrec7t1iaZ5cNdLBfYPI4o+Mu75yZdSlahTDl/ue5RlTJcMAlNJZNnn0lrP8mYU2bbUYy9ke80Xe+LiyFjkA0rQxl01dhhfaLhyInr984WsUhPAzMh4VUTmTQ6D/vRhAjb15Y8bE81F40alEX9fLmQQkZODQupVAZ4onAoIWGKvz4cG660IgkVU2eQqR6Sce/Ib1jk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 07:21:39.1699
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40416cc1-ec9b-417c-8021-08dee0af6176
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7264
X-purgate-ID: tlsNG-d62444/1783927313-3FEFE0A8-65FF3D69/0/0
X-purgate-type: clean
X-purgate-size: 3215
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmytro_prokopchuk1@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,xen.org,arm.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,gitlab.com:url,amd.com:from_mime,amd.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1A79A74804D



On 12-Jul-26 13:56, Dmytro Prokopchuk1 wrote:
> A malformed partial DTB specifying both '#address-cells = <0>' and
> '#size-cells = <0>' causes '(address_cells * 2 + size_cells)' to
> evaluate to 0. This sum is subsequently used as a divisor when
> calculating the number of regions in the 'xen,reg' property inside
> handle_passthrough_prop():
> 
>     len = fdt32_to_cpu(xen_reg->len) / ((address_cells * 2 + size_cells) *
>                                         sizeof(uint32_t));
> 
> This leads to a division by zero exception in the Xen hypervisor during
> boot, causing a hypervisor panic/crash.
> 
> Fix this by validating that both 'address_cells' and 'size_cells'
> are within the range of [1, 2] at the top of handle_passthrough_prop().
> Any invalid cell size combination is safely rejected early with an error
> message and return -EINVAL.
> 
> Furthermore, update handle_passthrough_prop() to use the sizeof(*cell)
> instead of sizeof(uint32_t).
> 
> Fixes: 9ce974c47588 ("xen/arm: assign devices to boot domains")
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

You dropped "for-4.22" subject prefix. Was that intentional (you had it until
now)?. If not, please provide pros/cons for taking it into 4.22 and don't forget
to CC Oleksii (doing so now). It is not a critical bug and it's been with us for
a while now. That said, the fix is very simple and unharmful.

~Michal

> ---
> Changes in v6:
> - move cells check at the top of handle_passthrough_prop() with a comment
> - reword commit message
> - replace sizeof(uint32_t) with sizeof(*cell) (use expression instead of type)
> Test CI pipeline:
> https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2667596761
> ---
>  xen/common/device-tree/dom0less-build.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
> index eacfd93087..9513c1c837 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -152,10 +152,23 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
>              return -ENOMEM;
>      }
>  
> +    /*
> +     * xen,reg holds flat host/guest physical addresses and sizes, so the
> +     * inherited #address-cells/#size-cells must each be 1 or 2. This also
> +     * guards the len division below against a zero or wrapped divisor.
> +     */
> +    if ( (address_cells < 1) || (address_cells > 2) ||
> +         (size_cells < 1) || (size_cells > 2) )
> +    {
> +        printk(XENLOG_ERR "Invalid address_cells %u or size_cells %u\n",
> +               address_cells, size_cells);
> +        return -EINVAL;
> +    }
> +
>      /* xen,reg specifies where to map the MMIO region */
>      cell = (const __be32 *)xen_reg->data;
>      len = fdt32_to_cpu(xen_reg->len) / ((address_cells * 2 + size_cells) *
> -                                        sizeof(uint32_t));
> +                                        sizeof(*cell));
>  
>      for ( i = 0; i < len; i++ )
>      {


