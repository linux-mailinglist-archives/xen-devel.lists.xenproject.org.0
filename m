Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /97hEJt0I2piuAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 06 Jun 2026 03:15:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82ADC64C164
	for <lists+xen-devel@lfdr.de>; Sat, 06 Jun 2026 03:15:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=CLouhke5;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1330210.1593887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVfbn-0002Y2-1Z; Sat, 06 Jun 2026 01:13:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1330210.1593887; Sat, 06 Jun 2026 01:13:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVfbm-0002VI-R2; Sat, 06 Jun 2026 01:13:54 +0000
Received: by outflank-mailman (input) for mailman id 1330210;
 Sat, 06 Jun 2026 01:13:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wVfbl-0002VA-9X
 for xen-devel@lists.xenproject.org; Sat, 06 Jun 2026 01:13:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVfbk-006GYF-8V
 for xen-devel@lists.xenproject.org; Sat, 06 Jun 2026 03:13:52 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a23744f-e002-0a2a0a5209dd-0a2a450bd468-0
 for <xen-devel@lists.xenproject.org>; Sat, 06 Jun 2026 03:13:51 +0200
Received: from [40.107.200.15]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a23744e-212f-0a2a450b0019-286bc80fa637-3
 for <xen-devel@lists.xenproject.org>; Sat, 06 Jun 2026 03:13:51 +0200
Received: from BL0PR05CA0022.namprd05.prod.outlook.com (2603:10b6:208:91::32)
 by CH1PPF2EB7CF87B.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::60b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Sat, 6 Jun 2026
 01:13:46 +0000
Received: from BL02EPF0002992C.namprd02.prod.outlook.com
 (2603:10b6:208:91:cafe::9f) by BL0PR05CA0022.outlook.office365.com
 (2603:10b6:208:91::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.9 via Frontend Transport; Sat, 6
 Jun 2026 01:13:46 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0002992C.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Sat, 6 Jun 2026 01:13:46 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 5 Jun
 2026 20:13:46 -0500
Received: from [172.18.181.126] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 5 Jun 2026 20:13:45 -0500
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
 b=MOM5gpdVh6BCd2il7J8VoG8Gk1hiiCXWV0tuE/Joa6oip4X34VioZbtRsELzlIWZ/tYGLiSDNPp4uPobetIfcw4OV/n+FZY0m6QPs/Mn3PekAlH1iAUljl4xUXK7WmDPBLjMca37Ja6H667MLXIac6VPqBP9LPIvogS+IocCZ8XskD0L30zL7OfBAQfC1M8RsaBQFZ4cV3sCqJ62q4ob+/sWCHy2g3qi+6D/IkhnX9UoySM5nhllTuhnsCh4wdmMsqR8x33IxL5f6sNDGUB3BNfLvow71+PYdD/JBttm6ciyf5BwrInuw0K89OQje3hHvJjFg9Kup/N8603N4m6itQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NljL38Gi4X+C7yIEC/9vfZVXxPAfHVT51ATgJVI9ums=;
 b=YnTgRvcNoC41qfd7STIm747F5RL2y2U86/DIHqCbbdfTJLLwVLXXuLXv/go88mWi9VGRmSRREgF+hTdXcF8Hnr2a2pUb5XaiLzcVlQVxaktT6Bvn/QVFf620HqJ/7JQCDdYSQxl7DB8BXt4YLs6VeD1GUwDn9pA+Hwoo1F6bTZwkRnLy6K9bUQxXQ4h7lNjEG1F09Yq1Hj92v40Y7DIj2yLgqJ4jad4yoIhEiz+OkA/J6ve7NIoGrcEZiJW/8jyKupWTwv/brp03DdO7UBbF2NaxCjLvMrlXYkD6DgcO/63Dp1NEGfyAPK9I/EjaMXnV03TCc4shrdn/mP06y6taKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NljL38Gi4X+C7yIEC/9vfZVXxPAfHVT51ATgJVI9ums=;
 b=CLouhke50XJdc8/AvO2SJL5/IUyIgLIRxg4T0xFBCV2Wt0JwzRd4xpwubmLGIlAfsvAuB2psH5UHS4d14bP2MwXBcRdD4D/HVgwjFhCxx4Q0NOhglUnkgO10QEdh7Myk6Xut35j6fr81lvE3zuoO/eNgJwc3deb0tKisBCsTUfY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <8dc5f6be-0276-4b12-ba1d-22682c4350cf@amd.com>
Date: Fri, 5 Jun 2026 21:02:43 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] x86/hvm: Partially revert ("xen/mem_access: wrap
 memory access when VM_EVENT=n")
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Hady Azzam <hadyazzam@protonmail.com>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Teddy Astie
	<teddy.astie@vates.tech>, Tamas K Lengyel <tamas@tklengyel.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20260605194157.2762581-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20260605194157.2762581-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992C:EE_|CH1PPF2EB7CF87B:EE_
X-MS-Office365-Filtering-Correlation-Id: ec07d74f-cd40-46bd-1b4b-08dec368dbdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	/ZJhsKCOx9mSL5etTq4DbkenFOk7F0XTdJXAoEe9iINBA1Bcm1u4wM1y4YQrn5pcY/aj1UpvB4ouOWuY2+R4DY4eIbkrCS8KrYy1c7Ah4nIuG1xk+58VAdxP3R34ttSoxgILa6nmyz27TMtC38hTL5e+vqQ5Cre7GMHIlOuXRPgbZLRDVyXaXt/hufp2v2X1Unh/E2/v47CJTH7oVI6MHIQq8aE6CzKyTbPkUAIKNCT8n9cBQ7/jy6MuYrmfr2L2wstu5B8Ml7LvEIS9GmWEUz8mll+RSmRit/OEikhuksnpvzBJ8ttfXpm9d+4jMnc89FQNw7sfqHCXoaE7b948elATchMJ1DxQcZuiDnVCirw/8qTaMO5ws54JflfxzMw+qgaiyH82U830be2ULkUCdLKmP3PDjVZfu9E5StoZc6fK9wcWtdkkwm+ANxpHw+OBvAA+dLNNx+07FcdmrgmDeVGwwlcVHRc/ShId5BOzJSdjnpI47rybyV10dvIdwdo+/+uRGc23vbNkPyrFKboX9qAZSZ1gRDJAtGSPHIK0cZfTJOY4+vZsA7e3eaXgfMVg8OxYi/vJPH4nkXj1gQthGYsJAFRYKFUDyPZ2k5xPA3q3eOlHiVsvbMphdbbQp6ewUxsFOMlxrVfX034I+H7QYLWLoq0YD7uaZcmzUrN/X0YtWPAghVuXROSByvPuaa3YIxo77SCweFhCK0GmoWvBSOP4JlB0Ie/XYmoR0a+zkrs=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ceTBzNlA6mZgi+5EbSGFXLeOlLLjW0ae/oVlEfZ4ve1xxA21rdXMjP8vlQBTkjZqsfzroGnMxfgLt2uCngeaULfpk9AUWhkWxTdlgm+xNUdB5C7MSlv5+W6l7yKzHH0I6RXcmnFk9xpONKyLsbpANi9LpnHvf8bVxQF3KvqaVP7BbQrsqmfeHyfTWq0Ed/Venyl4n363zbLPZSG5oqsatmJYTn5KN51h1wF6C5dzgwwN18dNxBM44VDarlYKKmwQEWuBvhc4aNRivivvsPBr4stBf+JybSI8VBJ4G4GuWS0co/AlNZsSHOBQXV1FYHM/DhbEXWfcDLM6SeLzmY1trXL5HjFnGwJP66QqKBbg96xhRhobtbP5BsVkE7lxfwwoV7zLhDp7kivzzHnVxe+NvK/nJqj9XLqQYyTUuOvx3et/f7EOIIkPlWgYEF0b4FCE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2026 01:13:46.5329
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec07d74f-cd40-46bd-1b4b-08dec368dbdb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF2EB7CF87B
X-purgate-ID: tlsNG-42698a/1780708431-1AD77F3B-5D206BFE/0/0
X-purgate-type: clean
X-purgate-size: 543
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
	TO_DN_ALL(0.00)[];
	FREEMAIL_CC(0.00)[protonmail.com,suse.com,citrix.com,vates.tech,tklengyel.com,amd.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:hadyazzam@protonmail.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:tamas@tklengyel.com,m:Penny.Zheng@amd.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 82ADC64C164

On 2026-06-05 15:41, Andrew Cooper wrote:
> It is erroneous to check current like this.  e.g. Dom0 does not have VM_EVENT
> active when it's introspecting domUs.
> 
> The use of vm_event_is_enabled() is only for the IS_ENABLED(CONFIG_VM_EVENT)
> short circut, so just use that directly.
> 
> Reported-by: Hady Azzam <hadyazzam@protonmail.com>
> Fixes: b18e38e42da6 ("xen/mem_access: wrap memory access when VM_EVENT=n")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

