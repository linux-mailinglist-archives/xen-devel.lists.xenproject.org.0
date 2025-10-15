Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B828FBE0C1C
	for <lists+xen-devel@lfdr.de>; Wed, 15 Oct 2025 23:06:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1143985.1477536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v98gK-000832-WF; Wed, 15 Oct 2025 21:05:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1143985.1477536; Wed, 15 Oct 2025 21:05:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v98gK-00081a-Sy; Wed, 15 Oct 2025 21:05:12 +0000
Received: by outflank-mailman (input) for mailman id 1143985;
 Wed, 15 Oct 2025 21:05:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nzz5=4Y=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1v98gJ-00081U-8G
 for xen-devel@lists.xenproject.org; Wed, 15 Oct 2025 21:05:11 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0507e1e-aa0a-11f0-980a-7dc792cee155;
 Wed, 15 Oct 2025 23:05:08 +0200 (CEST)
Received: from BLAPR05CA0018.namprd05.prod.outlook.com (2603:10b6:208:36e::13)
 by IA1PR12MB6164.namprd12.prod.outlook.com (2603:10b6:208:3e8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 21:05:02 +0000
Received: from BN3PEPF0000B36F.namprd21.prod.outlook.com
 (2603:10b6:208:36e:cafe::29) by BLAPR05CA0018.outlook.office365.com
 (2603:10b6:208:36e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.5 via Frontend Transport; Wed,
 15 Oct 2025 21:05:02 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF0000B36F.mail.protection.outlook.com (10.167.243.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.0 via Frontend Transport; Wed, 15 Oct 2025 21:05:01 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 15 Oct
 2025 14:05:00 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 15 Oct
 2025 16:05:00 -0500
Received: from fedora.mshome.net (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 15 Oct 2025 14:05:00 -0700
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
X-Inumbo-ID: a0507e1e-aa0a-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OyyUoNgAIKUpuuAa14Cv5wqZT75D4G2YEu+C8VIo7A6gL58UXCUqV+oZ0AFFr6ApStZav0Py/z3Lsc+9md+RLa2AWYPB5aCUA32WzYd75Jd/DXKoJbFtI+LV8iOAUYksG+Zj/nhUNAKuD4RxqXEBsPkcYTciTWOaZJ/g+z6LRIox1cLdTaEFq2hfVPNQeF4gOr3KjWxwg+3++H9klNPFhopicJ9SsaRY/RKTHNJq6bIVjzI+K0wJiK0OIupeQjZpwr1lJLB8BTmFyj5XZ4HuF2uk2By2GySSvdTUlZwfJJsOI1qo/K4JWj3q2GMPoHv7LqisiqR66D8O7cAljXLgyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rH4M3114CKSr59YHF7TVZ3l3ebO8ra5rgkSKIU2aCZI=;
 b=G89uAPyMv+ji/T6+XllIpD1ICaODJIg6W4QlKOxjRaU2qKJnmZYB4S8dkC53B/KY6NbN18iePgABZWfLdb3TBFEyENK//uAoNEtWDbh/bHaqALNmDgc/YY/3nu3IZXuxr+N/CpfBLgIWpfRKSMT81u8LIHMvMe4/A3WvQV7gCYrt49zytN1tQnL8uJ/ZZbYxPczEm9KkLJshnen5xn6n4wwuwGLJ8M7QmxdthE3GdjBDyyYqowM7JnSUXHU6mwc7TWS33RhTVDgtbBIHkXiu6bMkmvlpJ+uoYxCVK6jOaYcmh7YEg2rlPcv6MEaYvb5czYajs7euQU94sGl3//GFyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rH4M3114CKSr59YHF7TVZ3l3ebO8ra5rgkSKIU2aCZI=;
 b=Janla3mQSqaasW4fu3kf04lBUpTgZ2fY+kFTu8mtbZpUSQhxRA5ZXAnBXNTuqbtaegyEIdzlyv1SbWzvkWz7w4dWXf8YUaVHyjdj0UdHzKlybgTDIRHMDbDUjXrJqssRkuty8VJFX8A7aOLbHkiZPv2PGBgPWvO17EPDG3nQyic=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 0/2] x86/io-apic: Loop changes
Date: Wed, 15 Oct 2025 17:04:52 -0400
Message-ID: <20251015210454.95381-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36F:EE_|IA1PR12MB6164:EE_
X-MS-Office365-Filtering-Correlation-Id: d4883ea6-4568-4ad0-51e6-08de0c2e81ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VZNo7cDNqgmDV1CIbIKaU5m3ayTFDS19bYJM7NV7FMPv4U4LPMMOHmB901zS?=
 =?us-ascii?Q?bj418/5Q2F+2uIwzKn4eLriV4QHyxf8smwHoLXbAOV3hFJwVJj1c+fCqMoV3?=
 =?us-ascii?Q?o6V9CePvjN9ap+/eZXdlf/udKbmQrHklKPoyoJYh/21KM2xRRYQ0SKvCQCXk?=
 =?us-ascii?Q?lNCqaxz0aMILP2PdWVXqy0euhR/ik9L26QAZTee41f62XeXEGpl4iZkfYytS?=
 =?us-ascii?Q?2Ljk0ljYPSnncOqubv9MqjkE1kMq0LPZO3MQRGTWXFPQJGKKCecuYFO9Qau6?=
 =?us-ascii?Q?WIWc42SeQxIOIqPJB/JHF4ntYhuRVGsaFpPIQdlxaDEsob52+l0VVG9Kyf5h?=
 =?us-ascii?Q?/iq3U1+8PqE3upY1tybqHpwFdXVy/WmPvV+obXwQ3K2/7eaPnmmSad+Wv+oi?=
 =?us-ascii?Q?28vVufBLHSXqa6drLM8jOXdvfUCj1LaLZAo8GeyhsDvevQ+bLA5mybY9/cqU?=
 =?us-ascii?Q?5hkyo0OBbJuzIb/czKpN1aseCoP3A/3vdnKnTeUqKFesgUvo/CTv+2JvWmVr?=
 =?us-ascii?Q?AxOGba57S89iiygY1dIcjSpVWOBIdd6KIJJ2VXmEnr6W/GhbtCCtU1YmWqiJ?=
 =?us-ascii?Q?ZT3rTRULD3MNUfvbLIc01I5WcdOF6mn1BMYjludyjVuXQQUuJ+taRWPkxV7W?=
 =?us-ascii?Q?zmQ5GwN38EX/MUtZQ1YtMoib3AN/G6Sc0Agj+v7wNTtZdAUBHY8CSe5HBcBv?=
 =?us-ascii?Q?+FUn1Lfm0eHHN+Dzf9pKOJ+1DVazey4NVogznGz+fI+dCZjecsSwBYawM8OS?=
 =?us-ascii?Q?m8BCTWDyZ2A4D/R6hB92rXq0DSUqGTqnT28yMcGz2A8av4ITZaHBKwsVs3ng?=
 =?us-ascii?Q?bOKqcoiKBU4fl87YCKowDhFhFJ/NnHD/E3E9Fu5EX6mEtKduwbOUgqJw+c3M?=
 =?us-ascii?Q?KNb//wJpkGgqzgXqsVS4JERy0dX4qS4SI+hrxu/3LjAMB2eT1qY0ZaMQNi4u?=
 =?us-ascii?Q?bBNyrEeV6HnWqJe36diyXvojZVFY5CGgcyMMqODlPAPCAFMmMDWVGtfg+hPT?=
 =?us-ascii?Q?JPGkJ48IneKXxUJva1ufW0xMLWDWxvgjLGFlw52YwoXCjOSagfDxkC/VtpGJ?=
 =?us-ascii?Q?sRVw4JOX9ME9mq6hg9WWe0bhP63zL3W6dBuVolDYBJeVHs6FRq1UFNp1PKBo?=
 =?us-ascii?Q?nq89uN3JK9hds+M3pGgfMwX4AvVf9yv+K5T3WspxaolCh0aeE/n1bTa0YZDC?=
 =?us-ascii?Q?Rus9Tuc2BswG6RK5m7jt70TggPzQ08PEBhFSQXiBV6ziH0h691smHRKyh/N/?=
 =?us-ascii?Q?mcxYhG5UPd3YnnfkuLxTB3ZRRaIU/64gp6sof5rCUVuVAm2omTIp6fzUzQQK?=
 =?us-ascii?Q?aVm0Cyr7/kqBoiNPlEpW/hcauEH8GTKe4qvvv0xBNELQZ/qOAVAl0AxdKbQ9?=
 =?us-ascii?Q?jm2RXhTW3QTpRV8wTifJHSmTCPhcJ3LDji/KUtLTLeus+TKmauDa8y1jQ+F0?=
 =?us-ascii?Q?GMLvPR6vkPX/+v+dJIVN9yC1z/vFEkS3/bh0wKEJ0ZDDPycPv3hKXCfXZdxY?=
 =?us-ascii?Q?IJ3iHcTseSz/roWU8REVXQGaeA9QEK+s65Ymc1MxTehgXzRfFyNRoq11oDOO?=
 =?us-ascii?Q?Fio30zdnChvqwtVb8KM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 21:05:01.6484
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4883ea6-4568-4ad0-51e6-08de0c2e81ae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6164

The first patch is the v3 resubmission for 4.21.

The second patch shows the conversion of the rest of the file to use
next_entry() in the loops.  It is targetting 4.22.

$ bloat-o-meter xen/xen-syms.baseline xen/xen-syms.patch-1
add/remove: 0/0 grow/shrink: 1/0 up/down: 4/0 (4)
Function                                     old     new   delta
io_apic_level_ack_pending                    218     222      +4
Total: Before=3419485, After=3419489, chg +0.00%

$ bloat-o-meter xen/xen-syms.patch-1 xen/xen-syms.patch-2
add/remove: 1/0 grow/shrink: 0/7 up/down: 31/-62 (-31)
Function                                     old     new   delta
next_entry                                     -      31     +31
setup_IO_APIC                               3435    3430      -5
__print_IO_APIC                             1010    1004      -6
set_ioapic_affinity_irq                      288     281      -7
io_apic_level_ack_pending                    222     214      -8
eoi_IO_APIC_irq                              128     117     -11
dump_ioapic_irq_info                         850     838     -12
modify_IO_APIC_irq                           132     119     -13
Total: Before=3419489, After=3419458, chg -0.00%

Jason Andryuk (2):
  x86/apic: Avoid infinite loop in io_apic_level_ack_pending()
  x86/io_apic: Use next_entry() in loops

 xen/arch/x86/io_apic.c | 50 +++++++++++++-----------------------------
 1 file changed, 15 insertions(+), 35 deletions(-)

-- 
2.51.0


