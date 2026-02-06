Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEJZOeIThmm9JgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 17:16:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDA710023E
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 17:16:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223522.1531047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voOVO-00088H-Bq; Fri, 06 Feb 2026 16:16:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223522.1531047; Fri, 06 Feb 2026 16:16:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voOVO-00085j-0M; Fri, 06 Feb 2026 16:16:26 +0000
Received: by outflank-mailman (input) for mailman id 1223522;
 Fri, 06 Feb 2026 16:16:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lgBG=AK=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1voOVL-0005HV-Pm
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 16:16:23 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c394f35-0377-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 17:16:21 +0100 (CET)
Received: from PH7PR10CA0002.namprd10.prod.outlook.com (2603:10b6:510:23d::28)
 by CH3PR12MB8484.namprd12.prod.outlook.com (2603:10b6:610:158::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Fri, 6 Feb
 2026 16:16:16 +0000
Received: from SN1PEPF00036F42.namprd05.prod.outlook.com
 (2603:10b6:510:23d:cafe::a7) by PH7PR10CA0002.outlook.office365.com
 (2603:10b6:510:23d::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.16 via Frontend Transport; Fri,
 6 Feb 2026 16:16:11 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00036F42.mail.protection.outlook.com (10.167.248.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 16:16:15 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 6 Feb
 2026 10:16:09 -0600
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
X-Inumbo-ID: 2c394f35-0377-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iJs/IXKnHokLBUkyrcXT4LXAPNblUkv9tyyMWBqGNunADWNR0935ThMdQfr0lVo1sttgEYk3hT7sKQ9WDBMly6oOJdrd6pN6JpE7M4/FOyVU8HRaWOgOxCiEuB59bQzapN19S0n292EPzn0Ptt37+aDY8tes06v3cyvpIo+JeqSDYxtfEUcNsrJ6ZZRdDreBgGoGTCf9FjRrXi0ZFdvGW51icNYiQLMQzRbcRbU4d6QyQOIkdFvNdUt0YqFiiiowR7zAAylSGaNHrNphQNeQ/FOXRZCpADq9rvjaH3LIl+YQISMV72OcsCwLKoROEK7ZjvtT+7e1ISsjelmvpjROhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aADzh42OJMUzlOI8zR0cG226+X401FT8r8Ytx3iigag=;
 b=HNlWpKqtRrhi9QxmfZEa6gwfhgFAWOjYSs5apd+Qqh6npyIxusdigI35o4gbNYHKYHhzKGD2Yd7bcCcoo+BOp723YyqOfYnVbdTjq5hatvWMCnkXA9MBnUTfh66LTBwa9MiMClm6EcDZXWqMjHlHLG3301ka5Uow0Cp2QvgjOVEA5AknWBZ8ngdUunZ3C+R/DHzkjpRlw69KHsKTP6Vdi5+4t52zHqCHk6yUPTIzPBsBCxioZ/94TiI8h1WwqtpezWy7dB9JEWaTzgNiz8twvar/3msXDTVmh8I46SRJDHOAwHycOLAZG9849cEWs6Mdn3MWJEjKdbTgZLTjBGO5wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aADzh42OJMUzlOI8zR0cG226+X401FT8r8Ytx3iigag=;
 b=mThHTxbbbDdptS4A0kx051M3IMjEPgPPp5n16UKx0/aoXbBdSSVkAsRCQ+S4l8BNycfDPvBa4iFRFl2yMcjL5NBOQdXfIUSBlxvqSs620yMdJlriBMZxBog0utWTshonwJm/kPYzvYOoWPXSH90hv2QXeuB+b7FyQ40uyA3Nbt8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>
Subject: [PATCH 09/12] x86/pv: Migrate vendor checks to cpu_vendor()
Date: Fri, 6 Feb 2026 17:15:32 +0100
Message-ID: <20260206161539.209922-11-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F42:EE_|CH3PR12MB8484:EE_
X-MS-Office365-Filtering-Correlation-Id: be55931c-a880-466e-4a93-08de659b0d89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DkFt7Qg6cNkOB4AZMYP0uYpPksqutZIrmpaLb8djRVDgQyf6zM/PK5LD9MRi?=
 =?us-ascii?Q?s6INeOe7TJtZNDOAKjOD8c8Efl+A7UpSY3293fND564KkxfeUbrerdVmRqtU?=
 =?us-ascii?Q?RBsQtKCUFGYlnUYLTdNbGaichX8O8Y+V7HRl+ax/gX+Q0HQ/MEM48xwjc2dg?=
 =?us-ascii?Q?K+XmjlUTO6dIXAnF4g3OAyJaTXkqq/iqOzNbX+Op4TBdveQq+qbNkEekuptq?=
 =?us-ascii?Q?MFShscL6vw++R+Tg/+ZAcbcpTE3Tw2J2N6JV1XIxD6quXWJ89N/LEKZgYohF?=
 =?us-ascii?Q?o23VOwiCi2/Uwmp4We9S/yfSVVRm3168wGw12u+e7BCoYEBfwrm7vX5Qoc5U?=
 =?us-ascii?Q?rhJIEJyZu8C4E1Wrl/BRfLfMKyH/4hzilTgg4UENf0jJppVF9iDKDbt5oRxG?=
 =?us-ascii?Q?lBfr8LON7qRj2HkPs2XuKJ9rFWWc4q+nbGs1I5nZfCfD0/6Nmet9mmf+BBTl?=
 =?us-ascii?Q?G6xs9Zp0MVY7GOyAC9im/YLvkjIRa7v5qZZkLBe8mfrDQhgSDheltfm9JfvK?=
 =?us-ascii?Q?ND97tdh15bPLPw145JUYciUd1PSEKV/0zJ/GFUAuiwpR4N6W2lH78r8RbTvL?=
 =?us-ascii?Q?PbhbpwRSg2YztYTd2cAnWcrjYOHTsiNrK9DyiD863X1/DRcGZlYVBR2v1EXZ?=
 =?us-ascii?Q?F37yvuQeXnWiqQdWfOx1mLiOHyqjMPnzLrYDx3n6C0siGfVspfQQyONbUE3x?=
 =?us-ascii?Q?3RGZkiqGNAeRxZY2MMLYN6Rh0vtJQ+N7UGUYvNANDxx/PRNUvPeVCC0lKiV6?=
 =?us-ascii?Q?+VNNthKCAk0TJR9EPARYFqvjn6OGNvflCDZ2Jc9FtTbLiYfyloNkP5GmHhAy?=
 =?us-ascii?Q?andVi0If2TN+U9dp4lg4iayrQRqacuVRyoDUeRvA/h65lzADKIU34uUEqYHx?=
 =?us-ascii?Q?Q1HbEY6c5u4REfWu0AljW2zAzWjM8y/TiSOtWRsAEfJ0lN0m3PjHXQFTr191?=
 =?us-ascii?Q?mHvqveXzTEp9oZXSeJTrNlq0USlXvrOh3E6lCelt6OFWTUSHOlvfYNSpUjhY?=
 =?us-ascii?Q?7EwPbPlVaXmEPCy/o21/QWWuFmk+YmY/i6T5iGNKEbjHHxJfGj8tzdajBWVJ?=
 =?us-ascii?Q?ZumfaLMkiWMvKMQ2bNtJWjsJ7xeeM2fhoCsrENEs7nECeL3O427DGDzcWTcz?=
 =?us-ascii?Q?DU+NQcNp2csSDtrM3aqE5UJa+Wulbt6E9we1hwzyQrS5I+NA7mHL8SD6yT3o?=
 =?us-ascii?Q?D1WxtWjHA7N3pH41Hu4/nwaI6S131qjKeiJiqbpilyOxG3TeY65FlscYwiPt?=
 =?us-ascii?Q?HRYGv6Sus9IfDndlm8dh2Jci2sApFAOmzGvEp2FIn311f96ZVRSM7ek5bfyz?=
 =?us-ascii?Q?jwCZtY3tFcPFuhWsUGLoRu86eTRuadn5pPM/yMWpzoWXYsGWB8H5xazOm7Kd?=
 =?us-ascii?Q?QH/lX+LSsu9tvBGp0sDVEfG3ybsencuyvCwrXPAb7FeynxM5WPt9XH8ge8sD?=
 =?us-ascii?Q?kNXGqpuuudu2NI6qiiLixEsD1KjDP2Gj+tIDnZKC/S2wwnve7625JPoBAEgQ?=
 =?us-ascii?Q?zAE+cl+B8vyU28kiqjDX0rR0vqvulCnnldUrqJvtRC+OpO7lb9Arv21B1utL?=
 =?us-ascii?Q?4xq5ve/ZnDzuMXgpkky9dkqu1143pF+VSecHkTdWABAcSLL+JwJXEuFxB2Yw?=
 =?us-ascii?Q?KF+p4CRuGBN3MA5KtL7EszGYoUc8zIy2ZEazNTKy42gcn7TAXuoG79STTJ1y?=
 =?us-ascii?Q?rUj6Yw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QkIm/o6xEoS3jZneaH2bjEEPUjgRedO7IQbwUZuiWMXV7TUQOZOKjpWOPk0BRxlUFPTsN2xqB6CAF/PNcmr0dHrwYMG0sBmNqthzCUNebjnJIFGpUaiQgv4WSmR+8q8yltiaLN+U8qsVoqsr3WG5/brvgy+CuHcE3sD3XfrI/aKE5kiwF10NLdXbgzUVpD4hNpPEIEJNqOj4ahElIiQTu7lBOE0LHAXE5QZJLeeUl+HtCx26UDtvNQM9cs2Bdbm0e3RND1D66FReoysvr7XwZu0mdusU4TF4KNQahqUrE4UuvbhdRp9cMcq3ko5kRibsMByoxDjX9Ev8x8qwiA/0sM/f2Tz66W9T7JFVckdU8vaJOG/LFF1VeA9vElkOx+ryeN7Zsj8jDTxUuEWDdtoeMd6KICahHSWF2TV128AfbuKBwD1d18cjMy56UT//menS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 16:16:15.3732
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be55931c-a880-466e-4a93-08de659b0d89
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F42.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8484
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.965];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9FDA710023E
X-Rspamd-Action: no action

Not a functional change.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/pv/domain.c       |  2 +-
 xen/arch/x86/pv/emul-priv-op.c | 27 ++++++++++++---------------
 2 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index d16583a745..7084274dff 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -174,7 +174,7 @@ static int __init cf_check pge_init(void)
 {
     if ( opt_global_pages == -1 )
         opt_global_pages = !cpu_has_hypervisor ||
-                           !(boot_cpu_data.x86_vendor &
+                           !(cpu_vendor() &
                              (X86_VENDOR_AMD | X86_VENDOR_HYGON));
 
     return 0;
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 1d9e57ad27..02b6e8f01f 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -243,8 +243,7 @@ static bool pci_cfg_ok(struct domain *currd, unsigned int start,
     }
     start |= CF8_ADDR_LO(currd->arch.pci_cf8);
     /* AMD extended configuration space access? */
-    if ( CF8_ADDR_HI(currd->arch.pci_cf8) &&
-         boot_cpu_data.x86_vendor == X86_VENDOR_AMD &&
+    if ( CF8_ADDR_HI(currd->arch.pci_cf8) && (cpu_vendor() & X86_VENDOR_AMD) &&
          boot_cpu_data.x86 >= 0x10 && boot_cpu_data.x86 < 0x17 )
     {
         uint64_t msr_val;
@@ -869,8 +868,7 @@ static uint64_t guest_efer(const struct domain *d)
      */
     if ( is_pv_32bit_domain(d) )
         val &= ~(EFER_LME | EFER_LMA |
-                 (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL
-                  ? EFER_SCE : 0));
+                 ((cpu_vendor() & X86_VENDOR_INTEL) ? EFER_SCE : 0));
     return val;
 }
 
@@ -958,7 +956,7 @@ static int cf_check read_msr(
     case MSR_K8_PSTATE5:
     case MSR_K8_PSTATE6:
     case MSR_K8_PSTATE7:
-        if ( boot_cpu_data.x86_vendor != X86_VENDOR_AMD )
+        if ( !(cpu_vendor() & X86_VENDOR_AMD) )
             break;
         if ( unlikely(is_cpufreq_controller(currd)) )
             goto normal;
@@ -966,7 +964,7 @@ static int cf_check read_msr(
         return X86EMUL_OKAY;
 
     case MSR_FAM10H_MMIO_CONF_BASE:
-        if ( boot_cpu_data.x86_vendor != X86_VENDOR_AMD ||
+        if ( !(cpu_vendor() & X86_VENDOR_AMD) ||
              boot_cpu_data.x86 < 0x10 || boot_cpu_data.x86 >= 0x17 )
             break;
         /* fall through */
@@ -991,13 +989,13 @@ static int cf_check read_msr(
     case MSR_P6_EVNTSEL(0) ... MSR_P6_EVNTSEL(3):
     case MSR_CORE_PERF_FIXED_CTR0 ... MSR_CORE_PERF_FIXED_CTR2:
     case MSR_CORE_PERF_FIXED_CTR_CTRL ... MSR_CORE_PERF_GLOBAL_OVF_CTRL:
-        if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
+        if ( cpu_vendor() & X86_VENDOR_INTEL )
         {
             vpmu_msr = true;
             /* fall through */
     case MSR_AMD_FAM15H_EVNTSEL0 ... MSR_AMD_FAM15H_PERFCTR5:
     case MSR_K7_EVNTSEL0 ... MSR_K7_PERFCTR3:
-            if ( vpmu_msr || (boot_cpu_data.x86_vendor &
+            if ( vpmu_msr || (cpu_vendor() &
                               (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
             {
                 if ( vpmu_do_rdmsr(reg, val) )
@@ -1100,8 +1098,7 @@ static int cf_check write_msr(
     case MSR_K8_PSTATE6:
     case MSR_K8_PSTATE7:
     case MSR_K8_HWCR:
-        if ( !(boot_cpu_data.x86_vendor &
-               (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
+        if ( !(cpu_vendor() & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
             break;
         if ( likely(!is_cpufreq_controller(currd)) ||
              wrmsr_safe(reg, val) == 0 )
@@ -1119,7 +1116,7 @@ static int cf_check write_msr(
         break;
 
     case MSR_FAM10H_MMIO_CONF_BASE:
-        if ( boot_cpu_data.x86_vendor != X86_VENDOR_AMD ||
+        if ( !(cpu_vendor() & X86_VENDOR_AMD) ||
              boot_cpu_data.x86 < 0x10 || boot_cpu_data.x86 >= 0x17 )
             break;
         if ( !is_hwdom_pinned_vcpu(curr) )
@@ -1148,7 +1145,7 @@ static int cf_check write_msr(
 
     case MSR_IA32_MPERF:
     case MSR_IA32_APERF:
-        if ( !(boot_cpu_data.x86_vendor &
+        if ( !(cpu_vendor() &
                (X86_VENDOR_INTEL | X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
             break;
         if ( likely(!is_cpufreq_controller(currd)) ||
@@ -1158,7 +1155,7 @@ static int cf_check write_msr(
 
     case MSR_IA32_THERM_CONTROL:
     case MSR_IA32_ENERGY_PERF_BIAS:
-        if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL )
+        if ( !(cpu_vendor() & X86_VENDOR_INTEL) )
             break;
         if ( !is_hwdom_pinned_vcpu(curr) || wrmsr_safe(reg, val) == 0 )
             return X86EMUL_OKAY;
@@ -1168,12 +1165,12 @@ static int cf_check write_msr(
     case MSR_P6_EVNTSEL(0) ... MSR_P6_EVNTSEL(3):
     case MSR_CORE_PERF_FIXED_CTR0 ... MSR_CORE_PERF_FIXED_CTR2:
     case MSR_CORE_PERF_FIXED_CTR_CTRL ... MSR_CORE_PERF_GLOBAL_OVF_CTRL:
-        if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
+        if ( cpu_vendor() & X86_VENDOR_INTEL )
         {
             vpmu_msr = true;
     case MSR_AMD_FAM15H_EVNTSEL0 ... MSR_AMD_FAM15H_PERFCTR5:
     case MSR_K7_EVNTSEL0 ... MSR_K7_PERFCTR3:
-            if ( vpmu_msr || (boot_cpu_data.x86_vendor &
+            if ( vpmu_msr || (cpu_vendor() &
                               (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
             {
                 if ( (vpmu_mode & XENPMU_MODE_ALL) &&
-- 
2.43.0


