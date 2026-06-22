Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yLNbLzbgOGoJjgcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 09:11:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 126CA6AD286
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 09:11:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=Ukc99H7e;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1343490.1602802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbYnm-0003Aa-0f; Mon, 22 Jun 2026 07:10:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343490.1602802; Mon, 22 Jun 2026 07:10:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbYnl-00037o-UF; Mon, 22 Jun 2026 07:10:37 +0000
Received: by outflank-mailman (input) for mailman id 1343490;
 Mon, 22 Jun 2026 07:10:36 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wbYnj-00037i-Tg
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 07:10:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbYnh-00CbJN-00
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 09:10:33 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a38dfe2-5cb7-0a2a0a5109dd-0a2a4508edb2-4
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 09:10:32 +0200
Received: from [52.101.53.51]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a38dfe6-9ee7-0a2a45080019-346535339a1e-3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 09:10:31 +0200
Received: from CY8P222CA0007.NAMP222.PROD.OUTLOOK.COM (2603:10b6:930:6b::22)
 by DS0PR12MB7747.namprd12.prod.outlook.com (2603:10b6:8:138::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Mon, 22 Jun
 2026 07:10:26 +0000
Received: from CH3PEPF0000000C.namprd04.prod.outlook.com
 (2603:10b6:930:6b:cafe::7f) by CY8P222CA0007.outlook.office365.com
 (2603:10b6:930:6b::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.14 via Frontend Transport; Mon,
 22 Jun 2026 07:10:26 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF0000000C.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 22 Jun 2026 07:10:25 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 22 Jun
 2026 02:10:25 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 22 Jun 2026 02:10:24 -0500
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
 b=DQ6IKH6CR9r4UmVNN70E0Sz1bg/aBtDhbEC7tJEygOSy6ZbNnor8KCIk9eii7q6M//mzHy0ApM5JWjZveKwjs7wKCnVbXxzBSCbKILrgtOKg7HCaazCRo9wl97ksy5kmXf0zD54v3VGxU9FfI+rGzyEyudpY5bw0uI9fwrDWlobyeFqPZaHn3vb4joJ8ExOkcaIPrSp22C0jlnHJTuaV46Vcxx1OSSFn/w1QDKOV4jUBpHXKhA5okARy6W+HS5QUZyshGEwVwXdS6M8Zl2FPf9zPna0w1t+Aws66cDEDDDdzHJDiGaC6/+a2NMFyHddrPw+YzI4zZJqDIiP1lO/+NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+fArgSlxOuXpuVI2pl8L3ubFJaU7ii1NeLYbwqJBLpg=;
 b=nqgYxuzDZcc+6RYulyFSkDNpXAenYQKEPkHNC4aTti0yLA3OZakLGwC2/5qIDFikHY2FM2/UVJt7GjjOj0KVfiv4CCchoJ7sf5IuLAWiJtLQOYyqqbgXmlrBslGNmxWWDutzMTFYc855zNkQ9QySsHJCjVCqAU4u0yOJ7Bn/c/0oJdY4DjvKBgphtFLhXxzxr6dmzvIllXVuYBx8m2NavvTMYFiQNf67cQkywVnZjGovqdYDz1AJPqPdfEwIiLoQYkkchY+DGRjcJuVByGvHMeHFmR2hZFE7uY3Io85OXY0NbNr/+ogBVoN7alfTyX5Ic2ScWErQdwohRjjZSh54uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+fArgSlxOuXpuVI2pl8L3ubFJaU7ii1NeLYbwqJBLpg=;
 b=Ukc99H7eOYJ1PMab+K24z1mytntZjPkzhV6BNOlmaPlXq6P5zPQTC9aJxuujTxI8eO+Z3qxzpyz2UyFZMRCsovpaI0v20i48244sX7vfYMCfQ0PO2lqe3FoABAjZPBHK4G74gKTPNIKEJBTPb5LMNN+05N6sTq6yaEZxs4USzg0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <50068b88-c7f7-4a66-a5a3-afbb2d2b6fb0@amd.com>
Date: Mon, 22 Jun 2026 09:10:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bootfdt: Fix infinite loop in device_tree_for_each_node()
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>
References: <8836494cb51f6e1f4b094fc690876d344adb47f3.1781955521.git.dmytro_prokopchuk1@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <8836494cb51f6e1f4b094fc690876d344adb47f3.1781955521.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000C:EE_|DS0PR12MB7747:EE_
X-MS-Office365-Filtering-Correlation-Id: b63acfad-c0a1-4320-a380-08ded02d558b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|36860700016|1800799024|13003099007|6133799003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	PATG8KcfTndhA3ME8NW0YIr2ChLSwRPcSQZ6fLMLWishb/UIPmr+qxH6+vswxWI/xeottihj/HxDsu2zNgIBvlaLdFla77XtMQjp+ept6LuWWqOcjsMiOk1xGguHgGCQ+WGtnz3jU36lJXumJH2e3SXhZ6Vto3gPoa+/+d60Awu75TxM4x9mh7LdwmhlpsEMYNMRY6Tg/HEGbDR66PhI4si7kaWnxL3DUhrqM2on6Xq+l+kx/Cqq8X662EkGzCjkURGUuYFDgrGAAqNUcAl38PuZt/0mhdJxUFC39kQCpHKSJMEiPmWXIxKGMUTSpnXQG7kvDftPBMeWy+XBtL29SW8YD7/M4V3crYegwodnIyaDguAFU44S1evcxdyfNWP+k9rqLBgKcKJ3VNbvjjC1zQ/ldR2xycc3ceaIOYrA1vUNPMRhBCGHcCjygwZDioI9IogRyh98fnZ8SoVomQb8e0/SxNK4dJHSaAZzg2USH/Lab3U9vqBUsgAAC4hOs3qCIK9GC8MEG8vPMVfnbKY00cUbgR6JN4uvKLQJxOIcfXUVqoXae5U1/iJ6qAZ1sOgxYbFvr9otFFwTSNmiESEL5rwYTxUwqkb7ltp0kDJ2YKUN263cyMBhauHtYsT1vTGZXNMZCN3U9oAB+gHbnD17RFw6ODVm+9WglBmnVjEfel9NYoBY8v3eG3+u77mD06v+TLCGqkNYIboZ6NZajsyRAg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(1800799024)(13003099007)(6133799003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WDMqbyV0WFOhLWQiZD76b3aR39+Vqg6Ps1r4PVmJOrlUItX5dfalFzErO8HLd6ZxgPMfyifSGXSB3VvwvsMQNPES9LChZB9UUhR+8tlAqtcBCVmHALSHjK6VfxdG1wv1DH0uHADwys1QOzGJih8ROQMJAw0EkO5qxrf2vV3c4ehvj1uBMvZqiGKTKe1irLYvVHeCXZRZeUgtoMAqepvrk5jE5kk29sy750XjI86h4Pr7PgnzhrwuOkQmL47iNSuUZzYRJ7qBiBUQy8qvaQM1V1JltArZ+7mX/b4Q42szwwEA4+PTvjrOCr6wPwjQqY0wHDVQ7TeJ/asDS14UoeyrBdqWCy4hQhdlO28zsAhFks79Tn8Ldd4pmqK2+qJYfuPFVLF9YadionMlxQamhnocwoKniQzeXrvEjKc6jh2Tf8t/HXyjA3FYwJsS1MlRS7lH
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 07:10:25.9943
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b63acfad-c0a1-4320-a380-08ded02d558b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7747
X-purgate-ID: tlsNG-c1860d/1782112232-5EFED0FA-AE24DC18/0/0
X-purgate-type: clean
X-purgate-size: 5593
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
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
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,gitlab.com:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 126CA6AD286



On 20-Jun-26 13:49, Dmytro Prokopchuk1 wrote:
> When a node's depth exceeds DEVICE_TREE_MAX_DEPTH inside the
> device_tree_for_each_node() loop, the code prints a warning and
> executes 'continue;' statement, which jumps to condition check,
> bypassing the iterator update step:
> 
>     node = fdt_next_node(fdt, node, &depth).
> 
> The node and depth are not updated, the loop repeatedly evaluates
> the same too-deep node, causing a hang.
> 
> Fix this by wrapping the node processing logic in an 'else' block.
> This ensures the loop update step is executed on every iteration,
> safely skipping deeply nested nodes and doing the traversal.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
Please add a fixes tag:
Fixes: 40f2ea3df2e2 ("xen/arm: pass node to device_tree_for_each_node")

> ---
> 
> Test CI pipeline: https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2615174670
> 
> Local tests.
> Tests were based on "qemu-xtf.sh".
> In the "/chosen" node were added these "levelN" nesting nodes:
> 
> 	chosen {
> 		stdout-path = "/pl011@9000000";
> 		kaslr-seed = <0x6ae81a67 0x26e92d62>;
>         level1 {
>             level2 {
>         ...
>                         level19 {
>                             level20 {
>                                 compatible = "test";
>                                 value = <1234>;
>                             };
>                         };
>         ...
>             };
>         };
> 	};
> 
> Without a patch Xen stuck printing the same message in a loop:
> 
> (XEN) Checking for initrd in /chosen
> (XEN) Checking for "xen,static-mem" in domain node
> (XEN) Warning: device tree node `level15' is nested too deep
> (XEN) Warning: device tree node `level15' is nested too deep
> (XEN) Warning: device tree node `level15' is nested too deep
> (XEN) Warning: device tree node `level15' is nested too deep
> (XEN) Warning: device tree node `level15' is nested too deep
> ...
> 
> With a patch these too-deep nodes were successfully skipped and Xen
> continued to boot:
> 
> (XEN) Checking for initrd in /chosen
> (XEN) Checking for "xen,static-mem" in domain node
> (XEN) Warning: device tree node `level15' is nested too deep
> (XEN) Warning: device tree node `level16' is nested too deep
> (XEN) Warning: device tree node `level17' is nested too deep
> (XEN) Warning: device tree node `level18' is nested too deep
> (XEN) Warning: device tree node `level19' is nested too deep
> (XEN) Warning: device tree node `level20' is nested too deep
> (XEN) RAM: 0000000040000000 - 00000000bfffffff
> (XEN) 
> (XEN) MODULE[0]: 0000000043200000 - 000000004337afff Xen         
> (XEN) MODULE[1]: 0000000043400000 - 0000000043402fff Device Tree 
> (XEN) MODULE[2]: 0000000043000000 - 00000000430ef7f6 Ramdisk     
> (XEN) MODULE[3]: 0000000040600000 - 0000000042f4ffff Kernel      
> (XEN) MODULE[4]: 0000000040400000 - 0000000040412fff Kernel      
> (XEN) 
> (XEN) CMDLINE[0000000040600000]:domU0 console=ttyAMA0
> ...
> 
> ---
>  xen/common/device-tree/bootfdt.c | 31 ++++++++++++++++---------------
>  1 file changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
> index 7c790b9a4d..4d10013b2d 100644
> --- a/xen/common/device-tree/bootfdt.c
> +++ b/xen/common/device-tree/bootfdt.c
> @@ -90,23 +90,24 @@ int __init device_tree_for_each_node(const void *fdt, int node,
>          {
>              printk("Warning: device tree node `%s' is nested too deep\n",
>                     name);
> -            continue;
>          }
> -
> -        as = depth > 0 ? address_cells[depth-1] : DT_ROOT_NODE_ADDR_CELLS_DEFAULT;
> -        ss = depth > 0 ? size_cells[depth-1] : DT_ROOT_NODE_SIZE_CELLS_DEFAULT;
> -
> -        address_cells[depth] = device_tree_get_u32(fdt, node,
> -                                                   "#address-cells", as);
> -        size_cells[depth] = device_tree_get_u32(fdt, node,
> -                                                "#size-cells", ss);
> -
> -        /* skip the first node */
> -        if ( node != first_node )
> +        else
>          {
> -            ret = func(fdt, node, name, depth, as, ss, data);
> -            if ( ret != 0 )
> -                return ret;
> +            as = depth > 0 ? address_cells[depth-1] : DT_ROOT_NODE_ADDR_CELLS_DEFAULT;
> +            ss = depth > 0 ? size_cells[depth-1] : DT_ROOT_NODE_SIZE_CELLS_DEFAULT;
The added indentation level pushes these two lines over 80 columns (the
ss= line was within 80 before this patch). Please wrap them while you
are touching them. With that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>


You don't carry [for-4.22] prefix, but I think it is simple enough to take it
in, so we can ask Oleksii for his opinion to take it for 4.22. @Oleksii?

~Michal

> +
> +            address_cells[depth] = device_tree_get_u32(fdt, node,
> +                                                       "#address-cells", as);
> +            size_cells[depth] = device_tree_get_u32(fdt, node,
> +                                                    "#size-cells", ss);
> +
> +            /* skip the first node */
> +            if ( node != first_node )
> +            {
> +                ret = func(fdt, node, name, depth, as, ss, data);
> +                if ( ret != 0 )
> +                    return ret;
> +            }
>          }
>  
>          node = fdt_next_node(fdt, node, &depth);


