Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A449662F2EB
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 11:46:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445566.700832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovysc-0007lG-Ek; Fri, 18 Nov 2022 10:45:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445566.700832; Fri, 18 Nov 2022 10:45:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovysc-0007hf-8D; Fri, 18 Nov 2022 10:45:54 +0000
Received: by outflank-mailman (input) for mailman id 445566;
 Fri, 18 Nov 2022 10:45:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nf+F=3S=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ovysa-0006Il-9P
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 10:45:52 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0617.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a8cc51b-672e-11ed-91b6-6bf2151ebd3b;
 Fri, 18 Nov 2022 11:45:50 +0100 (CET)
Received: from DU2PR04CA0216.eurprd04.prod.outlook.com (2603:10a6:10:2b1::11)
 by DB9PR08MB6505.eurprd08.prod.outlook.com (2603:10a6:10:23e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Fri, 18 Nov
 2022 10:45:45 +0000
Received: from DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b1:cafe::2b) by DU2PR04CA0216.outlook.office365.com
 (2603:10a6:10:2b1::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13 via Frontend
 Transport; Fri, 18 Nov 2022 10:45:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT023.mail.protection.outlook.com (100.127.142.253) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Fri, 18 Nov 2022 10:45:44 +0000
Received: ("Tessian outbound 2ff13c8f2c05:v130");
 Fri, 18 Nov 2022 10:45:44 +0000
Received: from 165182cd3568.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 93DA0F33-148C-48EA-872E-E52E8153D64D.1; 
 Fri, 18 Nov 2022 10:45:37 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 165182cd3568.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 18 Nov 2022 10:45:37 +0000
Received: from AM6P194CA0036.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::49)
 by PAXPR08MB6557.eurprd08.prod.outlook.com (2603:10a6:102:de::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Fri, 18 Nov
 2022 10:45:34 +0000
Received: from AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::c5) by AM6P194CA0036.outlook.office365.com
 (2603:10a6:209:90::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20 via Frontend
 Transport; Fri, 18 Nov 2022 10:45:34 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM7EUR03FT005.mail.protection.outlook.com (100.127.140.218) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Fri, 18 Nov 2022 10:45:33 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Fri, 18 Nov
 2022 10:45:31 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Fri, 18 Nov 2022 10:45:28 +0000
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
X-Inumbo-ID: 2a8cc51b-672e-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6DCak0YJtenRHku7K8L/gHsRORPfDEtl/CMn+1huSvk=;
 b=bgTHYGxPBjA7swnttxbhY8ZXp+ah9uxm6N9OPetzcUld5IMfeUbY6svEzcWdhyXpoIe02Ndvx7R07sT9JOJTnRMnVGOLrozcWEwjDC46A9sNcEJBh1CPXAX0nNFdA4uJQ4gjfQn2lhQ+TB2wBFooikEHWy7Vevh2GuXvZeuvDCs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 53401273d3e89ba8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJMtcncqWlnjHNUfw98IlHW8p/8VSDSJYEw5d4P/TOqTKCvxq2YLTDKPFhuOYsUTR2qEhfqG5erk5Ey+Wjtugen6Uv5MXtiEL5Dg/tnoU/s9lDMLc/nESngEYnxUY97Rk1nY/Cbi3Yq6aBL9fswx8KaluAeEidtVDM2ZjlTJtx3i9iPQSqO7Pr8cOWxHAwYdfVw15O2we5JfPBl9gemCD6uaJ3sQwFg8tzzQOptjiNtf6SM0B8x7B5nlozZgH9bxkKfTxo+fPsxXfa9FPYhn5qgOcOBtX69WZ2rSJurgPoqXoe4qleNhRwifIFz9NOG1KwbMrAWAMjUTjp3xknbZDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6DCak0YJtenRHku7K8L/gHsRORPfDEtl/CMn+1huSvk=;
 b=bGnS3q7cl7EHCcSUJXQRa8KLX82BChHPHMEMuFHcvMSuS/Lc5VuRujVfuNSH0Mc4FRAiZt8DbVB1t6MVvrWVDistZ6XhemYkdMxTvfnahEybt9IYtNKK58jmhNnTuYHy8SN9BNwfRsWOvUfdOUxJCTv1nYfYmgk8rDMrQZO7c2S0SROGmAEOQRTKxGW7nHII0h/R+M/swRxCWHC83aWmrbR3FhvK1BBODVa46BiU/zIRuWdyT5ZJ5644odaB8+V3HcQA3dot037wAnH5NboQjbWhiv4odE1iGOS9XsEcoCyU45M3lkBaqi10jsajVcBQ5amyXvNOYJpSo9dV2Cyy0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6DCak0YJtenRHku7K8L/gHsRORPfDEtl/CMn+1huSvk=;
 b=bgTHYGxPBjA7swnttxbhY8ZXp+ah9uxm6N9OPetzcUld5IMfeUbY6svEzcWdhyXpoIe02Ndvx7R07sT9JOJTnRMnVGOLrozcWEwjDC46A9sNcEJBh1CPXAX0nNFdA4uJQ4gjfQn2lhQ+TB2wBFooikEHWy7Vevh2GuXvZeuvDCs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v9 5/6] xen/x86: move NUMA process nodes nodes code from x86 to common
Date: Fri, 18 Nov 2022 18:45:07 +0800
Message-ID: <20221118104508.768274-6-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221118104508.768274-1-wei.chen@arm.com>
References: <20221118104508.768274-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	AM7EUR03FT005:EE_|PAXPR08MB6557:EE_|DBAEUR03FT023:EE_|DB9PR08MB6505:EE_
X-MS-Office365-Filtering-Correlation-Id: f9793fb4-c197-41ee-7f2a-08dac9520bc8
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mr6SKWk0souSxL2jv8fg2E25Rjq81WqI3m7uOMaDVZ5yVrUfL2eNfUigA2ci+8kiKlht7sUee2VoQ/D6M6ajJAwVMI2itGeHYQoA8ASgpzg9MzbrM/p9NpLiFaOXvrArSi6cD6MMtMp0ZD7xYwzM2Njcg/Uk+2JeaJekG3Y+vUED1/N6e11wJ0fonAuWZ3q6yezqSaukFf+dODMkN0fB0C/1ZSkhFYAdVdLY42maIJOVKtPkvIOJa9gd5wUWYUTBQydtdf4WTRMgzTfR/yXCUu7/4RyfbMIeQpZ3mDKkFnQHefKoDYmkLdj7mfyLYH6W17KwHif9IgfDiEgD2tQVLMszFHVzc+jK8MzZ62/UNFjW73AHtyOZtDlWsnO4AdR/xPwEQzOe5tV+PgIurkQEFUjr+97tscARPY7pChHpZx1C3pBonHCf4KzKUmCusX/hzOsIBz9vLB5B88psy28kPm9WCiALmU7k2HZ//KkwbBKgpVntlGNEPGa96EKxyILhRBGafUN9cnLYRRHqdM/Vw0UU7J7mEQ66tUAkALgGpV/ahSgc9juDAOVv90QS9UYRsTxVRLIeVWbcvwqeZp0jxnxSGTPfXTXW3pyUgQzIG4ZMJgMIr1lVsQ8lr/29tcTU2rw4Ll8qGhojRACc7ldBsOwuPKYtuN62DUBbjGVaemTK3SVM0RI2nAhVt9TBpF3rZcnNU1pgwwM9vlvLAf6NRBrWHUCrld9PJUrbcXrFH4A=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(396003)(136003)(376002)(451199015)(46966006)(40470700004)(36840700001)(86362001)(83380400001)(36860700001)(70586007)(356005)(82740400003)(81166007)(8936002)(40480700001)(2906002)(4326008)(41300700001)(40460700003)(82310400005)(6916009)(44832011)(26005)(30864003)(7696005)(70206006)(6666004)(186003)(336012)(36756003)(2616005)(8676002)(1076003)(316002)(426003)(54906003)(47076005)(478600001)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6557
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1861b5e6-a87a-4d06-0abe-08dac9520512
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5JbfMcTpdGw41gTZ4KPba+Dc9DsWzHBMqDv19jb8cJGR9/PfqtiPQvNnI5/J1U15GSkPMTdhWEGhelCYCNWlKfnvjdm/UxcBQpTciUy+3hLhny19xeHp1kEIgFFaGh8KywV+N+PL7h4JGNfP6PzvyMqljvUlMx2qAxpE5hn1uZvYtvIzbb9eFj70YyJoZGKYnKnLLXTVcn0rB8C2TamyfCq9KzdHWWgttBRZpukwpKTrE64drLnYWFTQ4L1l97fKlwf7PTB3mbDm2RaXDYJRlTs+93dGMI7r3LFe4rpjJbKtlk2Sy2cxR7lHV0lWgL2FPHFv/BYEETmICTFbYgRXB0X35yemaPx7cFfSud4e877zq4Jz7o1cRznnobRtwsMUTYfsPwTxcuse3Z3Bf+R8R1zmUTC3VGJdN18AjrN/bUB1WavWKpW72XbmG5nkOI1oK5JQJClkUcmcGc0rB7p0NvA5GdzWbpj4z8wGWNioczi0TDHXQWjB3CfCsEx+YrZ5b/o2IZUzx0oFn3ubLeXy6ywklj1PP3Ypu1x7XmjuoM/5Jny6qMfs3gavMJ5onif5fyzcNKe9uKl8W3uW7hjTF/XTMWbiiIuaffIkvNIHOyVLY34FxFmhuNgAfaY4fMjvgZIsssj2TsfQ/zvkx17SUuv1O7VyNBgp5zpHMeeXVMPEXLIlpd0bCMcv536MCFHAPkDbZwMGRNBs2RlnGSOSwA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(39860400002)(396003)(451199015)(46966006)(36840700001)(40470700004)(40480700001)(82310400005)(36756003)(2616005)(186003)(336012)(1076003)(47076005)(54906003)(426003)(107886003)(83380400001)(26005)(7696005)(2906002)(86362001)(478600001)(6666004)(70206006)(6916009)(8676002)(5660300002)(70586007)(4326008)(36860700001)(30864003)(40460700003)(44832011)(82740400003)(316002)(8936002)(81166007)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 10:45:44.8380
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9793fb4-c197-41ee-7f2a-08dac9520bc8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6505

x86 has implemented a set of codes to process NUMA nodes. These
codes will parse NUMA memory and processor information from
ACPI SRAT table. But except some ACPI specific codes, most
of the process code like memory blocks validation, node memory
range updates and some sanity check can be reused by other
NUMA implementation.

So in this patch, we move some variables and related functions
for NUMA memory and processor to common as library. At the
same time, numa_set_processor_nodes_parsed has been introduced
for ACPI specific code to update processor parsing results.
With this helper, we can reuse most of NUMA memory affinity init
code from ACPI. As bad_srat and node_to_pxm functions have been
used in common code to do architectural fallback and node to
architectural node info translation. But it doesn't make sense
to reuse the functions names in common code, we have rename them
to neutral names as well.

PXM is an ACPI specific item, we can't use it in common code
directly. So we introduced an numa_fw_nid_name for each NUMA
implementation to set their specific firmware NUMA node name.
In this case, we do not need to retain a lot of per-arch code
but still can print architectural log messages for different
NUMA implementations. A default value "???" will be set to
indicate an unset numa_fw_nid_name.

mem_hotplug is accessed by common code if memory hotplug is
activated. Even if this is only supported by x86, export the
variable so that other architectures could support it in the future.

As asm/acpi.h has been removed from common/numa.c, we have to
move NR_NODE_MEMBLKS from asm/acpi.h to xen/numa.h in this patch
as well.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v8 -> v9:
 1. Remove incrrect description from commit log.
 2. Add code comments for the places to set numa_fw_nid_name.
v7 -> v8:
 1. Add numa_fw_nid_name setting in srat_parse_regions after
    acpi_table_parse succeeded.
v6 -> v7:
 1. Add __init for arch_numa_unavailable.
 2. Use __ro_after_init for mem_hotplug.
 3. Use "???" instead of "NONAME" for unset numa_fw_nid_name.
 4. Fix code-style.
v5 -> v6:
 1. Fix code-style.
 2. Use arch_numa_unavailable to replace arch_numa_disabled for
    acpi_numa <= 0.
 3. Remove Kconfig for HAS_NUMA_NODE_FWID.
 4. Use numa_fw_nid_name for NUMA implementation to set their fw
    NUMA node name for print messages.
v4 -> v5:
 1. Introduce arch_numa_disabled for acpi_numa <= 0 in this patch.
 2. Remove the paramter init_as_disable of arch_numa_disabled.
 3. Fix typo "expandsion".
 4. Add const to proper varibales.
 5. Fix Indentation for l1tf_safe_maddr.
 6. Remove double blank lines.
 7. Add a space between for_each_node_mask and '('.
    Add a space page_list_for_each and '('.
 8. Use bool for nodes_cover_memory return value.
 9. Use a plain "int ret" to record compute_hash_shift return value.
10. Add a blank line before the function's main "return".
11. Add new Kconfig option HAS_NUMA_NODE_FWID to common/Kconfig.
v3 -> v4:
1. Use bool as return value for functions that only return
   0/1 or 0/-EINVAL.
2. Move mem_hotplug to a proper place in mm.h
3. Remove useless "size" in numa_scan_nodes.
4. Use unsigned int or const for proper variables.
5. Fix code-style.
6. Add init_as_disable as arch_numa_disabled parameter.
7. Add CONFIG_HAS_NUMA_NODE_FWID to gate print the mapping
   between node id and architectural node id (fw node id).
v2 -> v3:
1. Add __ro_after_init to proper variables.
2. Rename bad_srat to numa_fw_bad.
3. Rename node_to_pxm to numa_node_to_arch_nid.
4. Merge patch#7 and #8 into this patch.
5. Correct int to unsigned int in proper places.
6. Move NR_NODE_MEMBLKS from x86/acpi.h to common/numa.h
7. Drop helpers to access mem_hotplug, we export mem_hotplug
   from x86/mm.c to common/page_alloc.c
v1 -> v2:
1. Add code comment for numa_update_node_memblks to explain:
   Assumes all memory regions belonging to a single node
   are in one chunk. Holes between them will be included
   in the node.
2. Merge this single patch instead of serval patches to move
   x86 SRAT code to common.
3. Export node_to_pxm to keep pxm information in NUMA scan
   nodes error messages.
4. Change the code style to target file's Xen code-style.
5. Adjust some __init and __initdata for some functions and
   variables.
6. Merge two patches into this patch:
   1. replace CONFIG_ACPI_NUMA by CONFIG_NUMA.
   2. replace "SRAT" texts.
7. Turn numa_scan_nodes to static.
---
 xen/arch/x86/include/asm/acpi.h |   1 -
 xen/arch/x86/include/asm/mm.h   |   2 -
 xen/arch/x86/include/asm/numa.h |   3 +-
 xen/arch/x86/mm.c               |   2 -
 xen/arch/x86/numa.c             |   5 +
 xen/arch/x86/srat.c             | 337 +++----------------------------
 xen/common/numa.c               | 341 +++++++++++++++++++++++++++++++-
 xen/common/page_alloc.c         |   2 +
 xen/include/xen/mm.h            |   2 +
 xen/include/xen/numa.h          |  10 +-
 10 files changed, 386 insertions(+), 319 deletions(-)

diff --git a/xen/arch/x86/include/asm/acpi.h b/xen/arch/x86/include/asm/acpi.h
index 5c2dd5da2d..c453450a74 100644
--- a/xen/arch/x86/include/asm/acpi.h
+++ b/xen/arch/x86/include/asm/acpi.h
@@ -102,7 +102,6 @@ extern unsigned long acpi_wakeup_address;
 #define ARCH_HAS_POWER_INIT	1
 
 extern s8 acpi_numa;
-#define NR_NODE_MEMBLKS (MAX_NUMNODES*2)
 
 extern struct acpi_sleep_info acpi_sinfo;
 #define acpi_video_flags bootsym(video_flags)
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index d723c7c38f..2c5f856067 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -456,8 +456,6 @@ static inline int get_page_and_type(struct page_info *page,
     ASSERT(((_p)->count_info & PGC_count_mask) != 0);          \
     ASSERT(page_get_owner(_p) == (_d))
 
-extern paddr_t mem_hotplug;
-
 /******************************************************************************
  * With shadow pagetables, the different kinds of address start
  * to get get confusing.
diff --git a/xen/arch/x86/include/asm/numa.h b/xen/arch/x86/include/asm/numa.h
index 6c87942d43..2ca3475271 100644
--- a/xen/arch/x86/include/asm/numa.h
+++ b/xen/arch/x86/include/asm/numa.h
@@ -10,6 +10,7 @@ typedef u8 nodeid_t;
 extern int srat_rev;
 
 extern nodeid_t pxm_to_node(unsigned int pxm);
+extern unsigned int numa_node_to_arch_nid(nodeid_t n);
 
 #define ZONE_ALIGN (1UL << (MAX_ORDER+PAGE_SHIFT))
 
@@ -22,8 +23,6 @@ extern void init_cpu_to_node(void);
 
 #define arch_want_default_dmazone() (num_online_nodes() > 1)
 
-extern int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node);
-
 void srat_parse_regions(paddr_t addr);
 extern u8 __node_distance(nodeid_t a, nodeid_t b);
 unsigned int arch_get_dma_bitsize(void);
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index db1817b691..68f9989e1f 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -157,8 +157,6 @@ l1_pgentry_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
 l1_pgentry_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
     l1_fixmap_x[L1_PAGETABLE_ENTRIES];
 
-paddr_t __read_mostly mem_hotplug;
-
 /* Frame table size in pages. */
 unsigned long max_page;
 unsigned long total_pages;
diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index fa8caaa084..4b0b297c7e 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -46,6 +46,11 @@ bool arch_numa_disabled(void)
     return acpi_numa < 0;
 }
 
+bool __init arch_numa_unavailable(void)
+{
+    return acpi_numa <= 0;
+}
+
 /*
  * Setup early cpu_to_node.
  *
diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index 1a108a34c6..56749ddca5 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -24,10 +24,6 @@
 
 static struct acpi_table_slit *__read_mostly acpi_slit;
 
-static nodemask_t memory_nodes_parsed __initdata;
-static nodemask_t processor_nodes_parsed __initdata;
-static struct node nodes[MAX_NUMNODES] __initdata;
-
 struct pxm2node {
 	unsigned pxm;
 	nodeid_t node;
@@ -35,19 +31,6 @@ struct pxm2node {
 static struct pxm2node __read_mostly pxm2node[MAX_NUMNODES] =
 	{ [0 ... MAX_NUMNODES - 1] = {.node = NUMA_NO_NODE} };
 
-static unsigned node_to_pxm(nodeid_t n);
-
-static int num_node_memblks;
-static struct node node_memblk_range[NR_NODE_MEMBLKS];
-static nodeid_t memblk_nodeid[NR_NODE_MEMBLKS];
-static __initdata DECLARE_BITMAP(memblk_hotplug, NR_NODE_MEMBLKS);
-
-enum conflicts {
-	NO_CONFLICT,
-	OVERLAP,
-	INTERLEAVE,
-};
-
 static inline bool node_found(unsigned idx, unsigned pxm)
 {
 	return ((pxm2node[idx].pxm == pxm) &&
@@ -110,78 +93,7 @@ nodeid_t setup_node(unsigned pxm)
 	return node;
 }
 
-int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node)
-{
-	int i;
-
-	for (i = 0; i < num_node_memblks; i++) {
-		struct node *nd = &node_memblk_range[i];
-
-		if (nd->start <= start && nd->end >= end &&
-			memblk_nodeid[i] == node)
-			return 1;
-	}
-
-	return 0;
-}
-
-static
-enum conflicts __init conflicting_memblks(nodeid_t nid, paddr_t start,
-					  paddr_t end, paddr_t nd_start,
-					  paddr_t nd_end, unsigned int *mblkid)
-{
-	unsigned int i;
-
-	/*
-	 * Scan all recorded nodes' memory blocks to check conflicts:
-	 * Overlap or interleave.
-	 */
-	for (i = 0; i < num_node_memblks; i++) {
-		struct node *nd = &node_memblk_range[i];
-
-		*mblkid = i;
-
-		/* Skip 0 bytes node memory block. */
-		if (nd->start == nd->end)
-			continue;
-		/*
-		 * Use memblk range to check memblk overlaps, include the
-		 * self-overlap case. As nd's range is non-empty, the special
-		 * case "nd->end == end && nd->start == start" also can be covered.
-		 */
-		if (nd->end > start && nd->start < end)
-			return OVERLAP;
-
-		/*
-		 * Use node memory range to check whether new range contains
-		 * memory from other nodes - interleave check. We just need
-		 * to check full contains situation. Because overlaps have
-		 * been checked above.
-		 */
-	        if (nid != memblk_nodeid[i] &&
-		    nd->start >= nd_start && nd->end <= nd_end)
-			return INTERLEAVE;
-	}
-
-	return NO_CONFLICT;
-}
-
-static __init void cutoff_node(int i, paddr_t start, paddr_t end)
-{
-	struct node *nd = &nodes[i];
-	if (nd->start < start) {
-		nd->start = start;
-		if (nd->end < nd->start)
-			nd->start = nd->end;
-	}
-	if (nd->end > end) {
-		nd->end = end;
-		if (nd->start > nd->end)
-			nd->start = nd->end;
-	}
-}
-
-static __init void bad_srat(void)
+void __init numa_fw_bad(void)
 {
 	int i;
 	printk(KERN_ERR "SRAT: SRAT not used.\n");
@@ -241,7 +153,7 @@ acpi_numa_x2apic_affinity_init(const struct acpi_srat_x2apic_cpu_affinity *pa)
 	if (numa_disabled())
 		return;
 	if (pa->header.length < sizeof(struct acpi_srat_x2apic_cpu_affinity)) {
-		bad_srat();
+		numa_fw_bad();
 		return;
 	}
 	if (!(pa->flags & ACPI_SRAT_CPU_ENABLED))
@@ -254,12 +166,12 @@ acpi_numa_x2apic_affinity_init(const struct acpi_srat_x2apic_cpu_affinity *pa)
 	pxm = pa->proximity_domain;
 	node = setup_node(pxm);
 	if (node == NUMA_NO_NODE) {
-		bad_srat();
+		numa_fw_bad();
 		return;
 	}
 
 	apicid_to_node[pa->apic_id] = node;
-	node_set(node, processor_nodes_parsed);
+	numa_set_processor_nodes_parsed(node);
 	acpi_numa = 1;
 
 	if (opt_acpi_verbose)
@@ -277,7 +189,7 @@ acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *pa)
 	if (numa_disabled())
 		return;
 	if (pa->header.length != sizeof(struct acpi_srat_cpu_affinity)) {
-		bad_srat();
+		numa_fw_bad();
 		return;
 	}
 	if (!(pa->flags & ACPI_SRAT_CPU_ENABLED))
@@ -290,11 +202,11 @@ acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *pa)
 	}
 	node = setup_node(pxm);
 	if (node == NUMA_NO_NODE) {
-		bad_srat();
+		numa_fw_bad();
 		return;
 	}
 	apicid_to_node[pa->apic_id] = node;
-	node_set(node, processor_nodes_parsed);
+	numa_set_processor_nodes_parsed(node);
 	acpi_numa = 1;
 
 	if (opt_acpi_verbose)
@@ -306,33 +218,27 @@ acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *pa)
 void __init
 acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 {
-	struct node *nd;
-	paddr_t nd_start, nd_end;
-	paddr_t start, end;
 	unsigned pxm;
 	nodeid_t node;
-	unsigned int i;
-	bool next = false;
 
 	if (numa_disabled())
 		return;
 	if (ma->header.length != sizeof(struct acpi_srat_mem_affinity)) {
-		bad_srat();
+		numa_fw_bad();
 		return;
 	}
 	if (!(ma->flags & ACPI_SRAT_MEM_ENABLED))
 		return;
 
-	start = ma->base_address;
-	end = start + ma->length;
 	/* Supplement the heuristics in l1tf_calculations(). */
-	l1tf_safe_maddr = max(l1tf_safe_maddr, ROUNDUP(end, PAGE_SIZE));
+	l1tf_safe_maddr = max(l1tf_safe_maddr,
+			      ROUNDUP(ma->base_address + ma->length,
+				      PAGE_SIZE));
 
-	if (num_node_memblks >= NR_NODE_MEMBLKS)
-	{
+	if (!numa_memblks_available()) {
 		dprintk(XENLOG_WARNING,
-                "Too many numa entry, try bigger NR_NODE_MEMBLKS \n");
-		bad_srat();
+			"Too many numa entries, try bigger NR_NODE_MEMBLKS!\n");
+		numa_fw_bad();
 		return;
 	}
 
@@ -341,159 +247,18 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 		pxm &= 0xff;
 	node = setup_node(pxm);
 	if (node == NUMA_NO_NODE) {
-		bad_srat();
+		numa_fw_bad();
 		return;
 	}
 
 	/*
-	 * For the node that already has some memory blocks, we will
-	 * expand the node memory range temporarily to check memory
-	 * interleaves with other nodes. We will not use this node
-	 * temp memory range to check overlaps, because it will mask
-	 * the overlaps in same node.
-	 *
-	 * Node with 0 bytes memory doesn't need this expandsion.
+	 * In an extremely unlikely case, srat_parse_regions might not
+	 * be called. So set the variable here just in case.
 	 */
-	nd_start = start;
-	nd_end = end;
-	nd = &nodes[node];
-	if (nd->start != nd->end) {
-		if (nd_start > nd->start)
-			nd_start = nd->start;
-
-		if (nd_end < nd->end)
-			nd_end = nd->end;
-	}
-
-	/* It is fine to add this area to the nodes data it will be used later*/
-	switch (conflicting_memblks(node, start, end, nd_start, nd_end, &i)) {
-	case OVERLAP:
-		if (memblk_nodeid[i] == node) {
-			bool mismatch = !(ma->flags &
-					  ACPI_SRAT_MEM_HOT_PLUGGABLE) !=
-			                !test_bit(i, memblk_hotplug);
-
-			printk("%sSRAT: PXM %u [%"PRIpaddr", %"PRIpaddr"] overlaps with itself [%"PRIpaddr", %"PRIpaddr"]\n",
-			       mismatch ? KERN_ERR : KERN_WARNING, pxm, start,
-			       end - 1, node_memblk_range[i].start,
-			       node_memblk_range[i].end - 1);
-			if (mismatch) {
-				bad_srat();
-				return;
-			}
-			break;
-		}
-
-		printk(KERN_ERR
-		       "SRAT: PXM %u [%"PRIpaddr", %"PRIpaddr"] overlaps with PXM %u [%"PRIpaddr", %"PRIpaddr"]\n",
-		       pxm, start, end - 1, node_to_pxm(memblk_nodeid[i]),
-		       node_memblk_range[i].start,
-		       node_memblk_range[i].end - 1);
-		bad_srat();
-		return;
-
-	case INTERLEAVE:
-		printk(KERN_ERR
-		       "SRAT： PXM %u: [%"PRIpaddr", %"PRIpaddr"] interleaves with PXM %u memblk [%"PRIpaddr", %"PRIpaddr"]\n",
-		       pxm, nd_start, nd_end - 1, node_to_pxm(memblk_nodeid[i]),
-		       node_memblk_range[i].start, node_memblk_range[i].end - 1);
-		bad_srat();
-		return;
-
-	case NO_CONFLICT:
-		break;
-	}
-
-	if (!(ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE)) {
-		node_set(node, memory_nodes_parsed);
-		nd->start = nd_start;
-		nd->end = nd_end;
-	}
-
-	printk(KERN_INFO "SRAT: Node %u PXM %u [%"PRIpaddr", %"PRIpaddr"]%s\n",
-	       node, pxm, start, end - 1,
-	       ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE ? " (hotplug)" : "");
-
-	/* Keep node_memblk_range[] sorted by address. */
-	for (i = 0; i < num_node_memblks; ++i)
-		if (node_memblk_range[i].start > start ||
-		    (node_memblk_range[i].start == start &&
-		     node_memblk_range[i].end > end))
-			break;
-
-	memmove(&node_memblk_range[i + 1], &node_memblk_range[i],
-	        (num_node_memblks - i) * sizeof(*node_memblk_range));
-	node_memblk_range[i].start = start;
-	node_memblk_range[i].end = end;
-
-	memmove(&memblk_nodeid[i + 1], &memblk_nodeid[i],
-	        (num_node_memblks - i) * sizeof(*memblk_nodeid));
-	memblk_nodeid[i] = node;
-
-	if (ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE) {
-		next = true;
-		if (end > mem_hotplug)
-			mem_hotplug = end;
-	}
-	for (; i <= num_node_memblks; ++i) {
-		bool prev = next;
-
-		next = test_bit(i, memblk_hotplug);
-		if (prev)
-			__set_bit(i, memblk_hotplug);
-		else
-			__clear_bit(i, memblk_hotplug);
-	}
-
-	num_node_memblks++;
-}
-
-/* Sanity check to catch more bad SRATs (they are amazingly common).
-   Make sure the PXMs cover all memory. */
-static int __init nodes_cover_memory(void)
-{
-	unsigned int i;
-
-	for (i = 0; ; i++) {
-		int err;
-		unsigned int j;
-		bool found;
-		paddr_t start, end;
-
-		/* Try to loop memory map from index 0 to end to get RAM ranges. */
-		err = arch_get_ram_range(i, &start, &end);
-
-		/* Reached the end of the memory map? */
-		if (err == -ENOENT)
-			break;
-
-		/* Skip non-RAM entries. */
-		if (err)
-			continue;
-
-		do {
-			found = false;
-			for_each_node_mask(j, memory_nodes_parsed)
-				if (start < nodes[j].end
-				    && end > nodes[j].start) {
-					if (start >= nodes[j].start) {
-						start = nodes[j].end;
-						found = true;
-					}
-					if (end <= nodes[j].end) {
-						end = nodes[j].start;
-						found = true;
-					}
-				}
-		} while (found && start < end);
-
-		if (start < end) {
-			printk(KERN_ERR "NUMA: No NODE for RAM range: "
-				"[%"PRIpaddr", %"PRIpaddr"]\n", start, end - 1);
-			return 0;
-		}
-	}
-	return 1;
+	numa_fw_nid_name = "PXM";
+	if (!numa_update_node_memblks(node, pxm, ma->base_address, ma->length,
+				      ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE))
+		numa_fw_bad();
 }
 
 void __init acpi_numa_arch_fixup(void) {}
@@ -534,6 +299,8 @@ void __init srat_parse_regions(paddr_t addr)
 	    acpi_table_parse(ACPI_SIG_SRAT, acpi_parse_srat))
 		return;
 
+	/* Set "PXM" as early as feasible. */
+	numa_fw_nid_name = "PXM";
 	srat_region_mask = pdx_init_mask(addr);
 	acpi_table_parse_srat(ACPI_SRAT_TYPE_MEMORY_AFFINITY,
 			      srat_parse_region, 0);
@@ -549,59 +316,9 @@ void __init srat_parse_regions(paddr_t addr)
 	pfn_pdx_hole_setup(mask >> PAGE_SHIFT);
 }
 
-/* Use discovered information to actually set up the nodes. */
-int __init numa_process_nodes(paddr_t start, paddr_t end)
-{
-	int i;
-	nodemask_t all_nodes_parsed;
-
-	/* First clean up the node list */
-	for (i = 0; i < MAX_NUMNODES; i++)
-		cutoff_node(i, start, end);
-
-	if (acpi_numa <= 0)
-		return -1;
-
-	if (!nodes_cover_memory()) {
-		bad_srat();
-		return -1;
-	}
-
-	memnode_shift = compute_hash_shift(node_memblk_range, num_node_memblks,
-				memblk_nodeid);
-
-	if (memnode_shift < 0) {
-		printk(KERN_ERR
-		     "SRAT: No NUMA node hash function found. Contact maintainer\n");
-		bad_srat();
-		return -1;
-	}
-
-	nodes_or(all_nodes_parsed, memory_nodes_parsed, processor_nodes_parsed);
-
-	/* Finally register nodes */
-	for_each_node_mask(i, all_nodes_parsed)
-	{
-		uint64_t size = nodes[i].end - nodes[i].start;
-
-		if ( size == 0 )
-			printk(KERN_INFO "SRAT: node %u has no memory\n", i);
-
-		setup_node_bootmem(i, nodes[i].start, nodes[i].end);
-	}
-	for (i = 0; i < nr_cpu_ids; i++) {
-		if (cpu_to_node[i] == NUMA_NO_NODE)
-			continue;
-		if (!nodemask_test(cpu_to_node[i], &processor_nodes_parsed))
-			numa_set_node(i, NUMA_NO_NODE);
-	}
-	numa_init_array();
-	return 0;
-}
-
-static unsigned node_to_pxm(nodeid_t n)
+unsigned int numa_node_to_arch_nid(nodeid_t n)
 {
-	unsigned i;
+	unsigned int i;
 
 	if ((n < ARRAY_SIZE(pxm2node)) && (pxm2node[n].node == n))
 		return pxm2node[n].pxm;
@@ -618,8 +335,8 @@ u8 __node_distance(nodeid_t a, nodeid_t b)
 
 	if (!acpi_slit)
 		return a == b ? 10 : 20;
-	index = acpi_slit->locality_count * node_to_pxm(a);
-	slit_val = acpi_slit->entry[index + node_to_pxm(b)];
+	index = acpi_slit->locality_count * numa_node_to_arch_nid(a);
+	slit_val = acpi_slit->entry[index + numa_node_to_arch_nid(b)];
 
 	/* ACPI defines 0xff as an unreachable node and 0-9 are undefined */
 	if ((slit_val == 0xff) || (slit_val <= 9))
diff --git a/xen/common/numa.c b/xen/common/numa.c
index a135154c3e..4948b21fbe 100644
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -13,6 +13,21 @@
 #include <xen/sched.h>
 #include <xen/softirq.h>
 
+static nodemask_t __initdata processor_nodes_parsed;
+static nodemask_t __initdata memory_nodes_parsed;
+static struct node __initdata nodes[MAX_NUMNODES];
+
+static unsigned int __ro_after_init num_node_memblks;
+static struct node __ro_after_init node_memblk_range[NR_NODE_MEMBLKS];
+static nodeid_t __ro_after_init memblk_nodeid[NR_NODE_MEMBLKS];
+static __initdata DECLARE_BITMAP(memblk_hotplug, NR_NODE_MEMBLKS);
+
+enum conflicts {
+    NO_CONFLICT,
+    OVERLAP,
+    INTERLEAVE,
+};
+
 struct node_data __ro_after_init node_data[MAX_NUMNODES];
 
 /* Mapping from pdx to node id */
@@ -31,11 +46,335 @@ nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
 
 bool __ro_after_init numa_off;
 
+const char *__ro_after_init numa_fw_nid_name = "???";
+
 bool numa_disabled(void)
 {
     return numa_off || arch_numa_disabled();
 }
 
+void __init numa_set_processor_nodes_parsed(nodeid_t node)
+{
+    node_set(node, processor_nodes_parsed);
+}
+
+bool valid_numa_range(paddr_t start, paddr_t end, nodeid_t node)
+{
+    unsigned int i;
+
+    for ( i = 0; i < num_node_memblks; i++ )
+    {
+        const struct node *nd = &node_memblk_range[i];
+
+        if ( nd->start <= start && nd->end >= end &&
+             memblk_nodeid[i] == node )
+            return true;
+    }
+
+    return false;
+}
+
+static enum conflicts __init conflicting_memblks(
+    nodeid_t nid, paddr_t start, paddr_t end, paddr_t nd_start,
+    paddr_t nd_end, unsigned int *mblkid)
+{
+    unsigned int i;
+
+    /*
+     * Scan all recorded nodes' memory blocks to check conflicts:
+     * Overlap or interleave.
+     */
+    for ( i = 0; i < num_node_memblks; i++ )
+    {
+        const struct node *nd = &node_memblk_range[i];
+
+        *mblkid = i;
+
+        /* Skip 0 bytes node memory block. */
+        if ( nd->start == nd->end )
+            continue;
+        /*
+         * Use memblk range to check memblk overlaps, include the
+         * self-overlap case. As nd's range is non-empty, the special
+         * case "nd->end == end && nd->start == start" also can be covered.
+         */
+        if ( nd->end > start && nd->start < end )
+            return OVERLAP;
+
+        /*
+         * Use node memory range to check whether new range contains
+         * memory from other nodes - interleave check. We just need
+         * to check full contains situation. Because overlaps have
+         * been checked above.
+         */
+        if ( nid != memblk_nodeid[i] &&
+             nd->start >= nd_start && nd->end <= nd_end )
+            return INTERLEAVE;
+    }
+
+    return NO_CONFLICT;
+}
+
+static void __init cutoff_node(nodeid_t i, paddr_t start, paddr_t end)
+{
+    struct node *nd = &nodes[i];
+
+    if ( nd->start < start )
+    {
+        nd->start = start;
+        if ( nd->end < nd->start )
+            nd->start = nd->end;
+    }
+
+    if ( nd->end > end )
+    {
+        nd->end = end;
+        if ( nd->start > nd->end )
+            nd->start = nd->end;
+    }
+}
+
+bool __init numa_memblks_available(void)
+{
+    return num_node_memblks < NR_NODE_MEMBLKS;
+}
+
+/*
+ * This function will be called by NUMA memory affinity initialization to
+ * update NUMA node's memory range. In this function, we assume all memory
+ * regions belonging to a single node are in one chunk. Holes (or MMIO
+ * ranges) between them will be included in the node.
+ *
+ * So in numa_update_node_memblks, if there are multiple banks for each
+ * node, start and end are stretched to cover the holes between them, and
+ * it works as long as memory banks of different NUMA nodes don't interleave.
+ */
+bool __init numa_update_node_memblks(nodeid_t node, unsigned int arch_nid,
+                                     paddr_t start, paddr_t size, bool hotplug)
+{
+    unsigned int i;
+    bool next = false;
+    paddr_t end = start + size;
+    paddr_t nd_start = start;
+    paddr_t nd_end = end;
+    struct node *nd = &nodes[node];
+
+    /*
+     * For the node that already has some memory blocks, we will
+     * expand the node memory range temporarily to check memory
+     * interleaves with other nodes. We will not use this node
+     * temp memory range to check overlaps, because it will mask
+     * the overlaps in same node.
+     *
+     * Node with 0 bytes memory doesn't need this expansion.
+     */
+    if ( nd->start != nd->end )
+    {
+        if ( nd_start > nd->start )
+            nd_start = nd->start;
+
+        if ( nd_end < nd->end )
+            nd_end = nd->end;
+    }
+
+    /* It is fine to add this area to the nodes data it will be used later */
+    switch ( conflicting_memblks(node, start, end, nd_start, nd_end, &i) )
+    {
+    case OVERLAP:
+        if ( memblk_nodeid[i] == node )
+        {
+            bool mismatch = !hotplug != !test_bit(i, memblk_hotplug);
+
+            printk("%sNUMA: %s %u [%"PRIpaddr", %"PRIpaddr"] overlaps with itself [%"PRIpaddr", %"PRIpaddr"]\n",
+                   mismatch ? KERN_ERR : KERN_WARNING, numa_fw_nid_name,
+                   arch_nid, start, end - 1,
+                   node_memblk_range[i].start, node_memblk_range[i].end - 1);
+            if ( mismatch )
+                return false;
+            break;
+        }
+
+        printk(KERN_ERR
+               "NUMA: %s %u [%"PRIpaddr", %"PRIpaddr"] overlaps with %s %u [%"PRIpaddr", %"PRIpaddr"]\n",
+               numa_fw_nid_name, arch_nid, start, end - 1, numa_fw_nid_name,
+               numa_node_to_arch_nid(memblk_nodeid[i]),
+               node_memblk_range[i].start, node_memblk_range[i].end - 1);
+        return false;
+
+    case INTERLEAVE:
+        printk(KERN_ERR
+               "NUMA： %s %u: [%"PRIpaddr", %"PRIpaddr"] interleaves with %s %u memblk [%"PRIpaddr", %"PRIpaddr"]\n",
+               numa_fw_nid_name, arch_nid, nd_start, nd_end - 1,
+               numa_fw_nid_name, numa_node_to_arch_nid(memblk_nodeid[i]),
+               node_memblk_range[i].start, node_memblk_range[i].end - 1);
+        return false;
+
+    case NO_CONFLICT:
+        break;
+    }
+
+    if ( !hotplug )
+    {
+        node_set(node, memory_nodes_parsed);
+        nd->start = nd_start;
+        nd->end = nd_end;
+    }
+
+    printk(KERN_INFO "NUMA: Node %u %s %u [%"PRIpaddr", %"PRIpaddr"]%s\n",
+           node, numa_fw_nid_name, arch_nid, start, end - 1,
+           hotplug ? " (hotplug)" : "");
+
+    /* Keep node_memblk_range[] sorted by address. */
+    for ( i = 0; i < num_node_memblks; ++i )
+        if ( node_memblk_range[i].start > start ||
+             (node_memblk_range[i].start == start &&
+             node_memblk_range[i].end > end) )
+            break;
+
+    memmove(&node_memblk_range[i + 1], &node_memblk_range[i],
+            (num_node_memblks - i) * sizeof(*node_memblk_range));
+    node_memblk_range[i].start = start;
+    node_memblk_range[i].end = end;
+
+    memmove(&memblk_nodeid[i + 1], &memblk_nodeid[i],
+            (num_node_memblks - i) * sizeof(*memblk_nodeid));
+    memblk_nodeid[i] = node;
+
+    if ( hotplug )
+    {
+        next = true;
+        if ( end > mem_hotplug )
+            mem_hotplug = end;
+    }
+
+    for ( ; i <= num_node_memblks; ++i )
+    {
+        bool prev = next;
+
+        next = test_bit(i, memblk_hotplug);
+        if ( prev )
+            __set_bit(i, memblk_hotplug);
+        else
+            __clear_bit(i, memblk_hotplug);
+    }
+
+    num_node_memblks++;
+
+    return true;
+}
+
+/*
+ * Sanity check to catch more bad SRATs (they are amazingly common).
+ * Make sure the PXMs cover all memory.
+ */
+static bool __init nodes_cover_memory(void)
+{
+    unsigned int i;
+
+    for ( i = 0; ; i++ )
+    {
+        int err;
+        unsigned int j;
+        bool found;
+        paddr_t start, end;
+
+        /* Try to loop memory map from index 0 to end to get RAM ranges. */
+        err = arch_get_ram_range(i, &start, &end);
+
+        /* Reached the end of the memory map? */
+        if ( err == -ENOENT )
+            break;
+
+        /* Skip non-RAM entries. */
+        if ( err )
+            continue;
+
+        do {
+            found = false;
+            for_each_node_mask ( j, memory_nodes_parsed )
+                if ( start < nodes[j].end && end > nodes[j].start )
+                {
+                    if ( start >= nodes[j].start )
+                    {
+                        start = nodes[j].end;
+                        found = true;
+                    }
+
+                    if ( end <= nodes[j].end )
+                    {
+                        end = nodes[j].start;
+                        found = true;
+                    }
+                }
+        } while ( found && start < end );
+
+        if ( start < end )
+        {
+            printk(KERN_ERR "NUMA: No node for RAM range: "
+                   "[%"PRIpaddr", %"PRIpaddr"]\n", start, end - 1);
+            return false;
+        }
+    }
+
+    return true;
+}
+
+/* Use discovered information to actually set up the nodes. */
+static bool __init numa_process_nodes(paddr_t start, paddr_t end)
+{
+    int ret;
+    unsigned int i;
+    nodemask_t all_nodes_parsed;
+
+    /* First clean up the node list */
+    for ( i = 0; i < MAX_NUMNODES; i++ )
+        cutoff_node(i, start, end);
+
+    /* When numa is on and has data, we can start to process numa nodes. */
+    if ( arch_numa_unavailable() )
+        return false;
+
+    if ( !nodes_cover_memory() )
+    {
+        numa_fw_bad();
+        return false;
+    }
+
+    ret = compute_hash_shift(node_memblk_range, num_node_memblks,
+                             memblk_nodeid);
+    if ( ret < 0 )
+    {
+        printk(KERN_ERR
+               "NUMA: No NUMA node hash function found. Contact maintainer\n");
+        numa_fw_bad();
+        return false;
+    }
+    memnode_shift = ret;
+
+    nodes_or(all_nodes_parsed, memory_nodes_parsed, processor_nodes_parsed);
+
+    /* Finally register nodes */
+    for_each_node_mask ( i, all_nodes_parsed )
+    {
+        if ( nodes[i].end == nodes[i].start )
+            printk(KERN_INFO "NUMA: node %u has no memory\n", i);
+
+        setup_node_bootmem(i, nodes[i].start, nodes[i].end);
+    }
+
+    for ( i = 0; i < nr_cpu_ids; i++ )
+    {
+        if ( cpu_to_node[i] == NUMA_NO_NODE )
+            continue;
+        if ( !nodemask_test(cpu_to_node[i], &processor_nodes_parsed) )
+            numa_set_node(i, NUMA_NO_NODE);
+    }
+
+    numa_init_array();
+
+    return true;
+}
+
 /*
  * Given a shift value, try to populate memnodemap[]
  * Returns :
@@ -261,7 +600,7 @@ void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
 #endif
 
 #ifdef CONFIG_NUMA
-    if ( !numa_off && !numa_process_nodes(start, end) )
+    if ( !numa_off && numa_process_nodes(start, end) )
         return;
 #endif
 
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 62afb07bc6..07df36d475 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -159,6 +159,8 @@
 #define PGT_TYPE_INFO_INITIALIZER 0
 #endif
 
+paddr_t __ro_after_init mem_hotplug;
+
 /*
  * Comma-separated list of hexadecimal page numbers containing bad bytes.
  * e.g. 'badpage=0x3f45,0x8a321'.
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index a925028ab3..9d14aed74b 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -147,6 +147,8 @@ int assign_page(
 /* Dump info to serial console */
 void arch_dump_shared_mem_info(void);
 
+extern paddr_t mem_hotplug;
+
 /*
  * Extra fault info types which are used to further describe
  * the source of an access violation.
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index 9da0e7d555..04ecaf7769 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -11,6 +11,7 @@
 #define NUMA_NO_DISTANCE 0xFF
 
 #define MAX_NUMNODES    (1 << NODES_SHIFT)
+#define NR_NODE_MEMBLKS (MAX_NUMNODES * 2)
 
 #define vcpu_to_node(v) (cpu_to_node((v)->processor))
 
@@ -36,14 +37,16 @@ extern int compute_hash_shift(const struct node *nodes,
                               unsigned int numnodes, const nodeid_t *nodeids);
 
 extern bool numa_off;
+extern const char *numa_fw_nid_name;
 
 extern void numa_add_cpu(unsigned int cpu);
 extern void numa_init_array(void);
 extern void numa_set_node(unsigned int cpu, nodeid_t node);
 extern void numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn);
-extern int numa_process_nodes(paddr_t start, paddr_t end);
+extern void numa_fw_bad(void);
 
 extern int arch_numa_setup(const char *opt);
+extern bool arch_numa_unavailable(void);
 extern bool arch_numa_disabled(void);
 extern void setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end);
 
@@ -92,6 +95,11 @@ static inline nodeid_t __attribute_pure__ phys_to_nid(paddr_t addr)
  */
 extern int arch_get_ram_range(unsigned int idx,
                               paddr_t *start, paddr_t *end);
+extern bool valid_numa_range(paddr_t start, paddr_t end, nodeid_t node);
+extern bool numa_memblks_available(void);
+extern bool numa_update_node_memblks(nodeid_t node, unsigned int arch_nid,
+                                     paddr_t start, paddr_t size, bool hotplug);
+extern void numa_set_processor_nodes_parsed(nodeid_t node);
 
 #endif
 
-- 
2.25.1


