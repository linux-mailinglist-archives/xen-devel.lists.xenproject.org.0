Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B1D4B4034
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 04:21:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271068.465397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJRvP-0007Cx-5O; Mon, 14 Feb 2022 03:21:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271068.465397; Mon, 14 Feb 2022 03:21:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJRvP-0007BQ-1a; Mon, 14 Feb 2022 03:21:15 +0000
Received: by outflank-mailman (input) for mailman id 271068;
 Mon, 14 Feb 2022 03:21:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aDlx=S5=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nJRvN-0007B4-CJ
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 03:21:13 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on062e.outbound.protection.outlook.com
 [2a01:111:f400:fe02::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2402e16b-8d45-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 04:21:05 +0100 (CET)
Received: from DB6PR1001CA0035.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:55::21)
 by AM0PR08MB3522.eurprd08.prod.outlook.com (2603:10a6:208:da::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Mon, 14 Feb
 2022 03:21:01 +0000
Received: from DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:55:cafe::fe) by DB6PR1001CA0035.outlook.office365.com
 (2603:10a6:4:55::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Mon, 14 Feb 2022 03:21:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT010.mail.protection.outlook.com (10.152.20.96) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11 via Frontend Transport; Mon, 14 Feb 2022 03:21:01 +0000
Received: ("Tessian outbound 741ca6c82739:v113");
 Mon, 14 Feb 2022 03:21:01 +0000
Received: from 29a95deb44b5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7D6E3D34-46F9-4CCF-A540-6101C6E372DC.1; 
 Mon, 14 Feb 2022 03:20:54 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 29a95deb44b5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Feb 2022 03:20:54 +0000
Received: from AM6PR10CA0065.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::42)
 by AM8PR08MB6372.eurprd08.prod.outlook.com (2603:10a6:20b:369::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Mon, 14 Feb
 2022 03:20:53 +0000
Received: from AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:80:cafe::8) by AM6PR10CA0065.outlook.office365.com
 (2603:10a6:209:80::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Mon, 14 Feb 2022 03:20:53 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT013.mail.protection.outlook.com (10.152.16.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Mon, 14 Feb 2022 03:20:53 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 14 Feb
 2022 03:20:57 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.20; Mon, 14
 Feb 2022 03:20:51 +0000
Received: from penny.shanghai.arm.com (10.169.188.91) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Mon, 14 Feb 2022 03:20:55 +0000
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
X-Inumbo-ID: 2402e16b-8d45-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KaO+t7pfgDgfgVk5Xeps2SUiiu2wKmJ9Hqjc8YeTY+w=;
 b=kPBtWJgbmqx6J1msk7lKSF3P/vNVXN/bvU0duOIYjUWMbfXrLhNLQo9oDTj2/OVUAsjYgo4B4zEiPbHLZBX2xuCfBiuSPMJ4ID6dvGQEek+ud6v8Hqd1O3DOUv/U15lBc2FzkrsFxSRn2e6v+6bSH+IjFRrCoP8hDAbNhWIEssM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4b4342021d747928
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V1mxeHl49bzGYc0hJsxksiv/nVtBZQj3h9vunh742Ei7AALSO6yvRew166G2ATa1Y/ZWtpNC0Ygoh2/efA+p3LIrKOvBSt7zbUrUZLx5DHYfdxKCxKwD6AdnovDoERFvNSWqOTIWv748iS0ldsOPpSutVVH7ghnf9p2IEzCkcwm38buQ7ecJy3ekJqr7fyaqgkxS9WZojCvCWqtd/7ODxyBXFR0jiSudpF9wbe3ucGvMIQS+VI1Gm/FSWSE68LSbcRSNPlNgr+wzQ6wHiIp6GL1EaXityfcgLUAMA8HvxMD+e5Neog6VShHwERSgDykQqN9fMUPcUEujdN+MCSMtIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KaO+t7pfgDgfgVk5Xeps2SUiiu2wKmJ9Hqjc8YeTY+w=;
 b=e0nSGtSLHqE+0RBZDpJY6YpKRcmxtHb8tHfBy1GPYMIkAX0If9hemHWhfPIyE1IeztcCrsTZg45IJagy+ntHhDUQnVAE0DsBeocwDuwwC6+nJfCZypohzoM8IDxOnEhrznhGywu5lW9V33JoRsmPWrPHelU1YnrPHXdmw6buJQ+zb/yUZnluTeTFdVlcUtggK+X/JSUANcGVQ+YSj/Dt5VQDCskJDujaOig15fK7P+7Sfty3DtWQcqoySApjXMDJ41wgWcz6r86xD3ETW8+REFlsJzaaxc9l21XdI6uGeexD+8A/DNjzvrH1gbIV8ZNJDSYuF8owZ06SGCYEDt+1Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KaO+t7pfgDgfgVk5Xeps2SUiiu2wKmJ9Hqjc8YeTY+w=;
 b=kPBtWJgbmqx6J1msk7lKSF3P/vNVXN/bvU0duOIYjUWMbfXrLhNLQo9oDTj2/OVUAsjYgo4B4zEiPbHLZBX2xuCfBiuSPMJ4ID6dvGQEek+ud6v8Hqd1O3DOUv/U15lBc2FzkrsFxSRn2e6v+6bSH+IjFRrCoP8hDAbNhWIEssM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <penny.zheng@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>
CC: <Bertrand.Marquis@arm.com>, <Wei.Chen@arm.com>
Subject: [PATCH v6 00/11] direct-map memory map
Date: Mon, 14 Feb 2022 03:19:45 +0000
Message-ID: <20220214031956.3726764-1-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 8d3f9a44-d17b-4112-394b-08d9ef69069d
X-MS-TrafficTypeDiagnostic:
	AM8PR08MB6372:EE_|DB5EUR03FT010:EE_|AM0PR08MB3522:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB3522CF27A57A922EED347A1CF7339@AM0PR08MB3522.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /TlwEO26+1DPxL2wsE6oWBDxRvmfKPbJ8otX1/h6ireDSQlVD86UcvP19lA3SqEtso5e4DOMuJc+2TCkXjhhupvZ9ihIC9MwJT4kHI8GOKE6cKJKLHH8zchyxqiyzgzxu8OIj88lZ1yZdsZy9pFDwoT0kdwE++1ZaJ+1Smi0LFKUujt2WP//zKpipoAq7Ciy7xWrLNm2AdKCtuy3Lu9fxarg/Crn3k6/x4H2nvbwnad+3GduaJw43TNAOg3gauOUzWZmmLITHXqx82TYaygvz37CXlndaS41nqPFLscN8Ak14NDbhCbpFisX/pvh4DUeGqFcv1XwqUU//Z9lhIaWfmqZP1E1SaEwEdWMmZURTyixaC/gdeTDp8hDadF1ZuhtE/2QlQTWH74O1fUCq9JAEeiUHKhqn0Jmstg0E1yWPeCOX5FRM4rIkF2s9Ckjzg/d52H7R9YRsZYORu6O6pa0F3hA5dNtJo4tReOHlukqOdBMKArQGRRgzHRVOWIhOtJbdVA7QQmwehS7Cq39mj7UdSJt85ElNBvsir/i7eeGuYxPsb6X3FaygAWwjMUM70YSY0ZDJ13BqnGYX5I/u2JIyurhFTMLhGK5Zwoxo5xYSltXfMZm3RdkVCm1qjegnyT+wOViwp9JPMOTtGcxkXUS2ifiKi6bcLbNAqhXA1koLEAtuN9zbgTeciTzvCR3nQh1qxO9tn1PwYAszGeuQaNriDZac+ehdFGxDsezSzibpAvux3p+Aqe1G7FfLi7Q9L4XKv+wZFPMOwKYcDqbKHy1H0VlpZ8ORFTXz5XQ0pTlut+YGgzMj18uaotG4eaz50Ymx6DCsGVAaS9py9a9IvOVtRZGit6O376xpG+oFhZAXKk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(4326008)(8676002)(966005)(1076003)(8936002)(336012)(36756003)(54906003)(70586007)(316002)(40460700003)(426003)(508600001)(70206006)(36860700001)(26005)(83380400001)(47076005)(110136005)(82310400004)(2906002)(5660300002)(6666004)(44832011)(7696005)(186003)(86362001)(81166007)(2616005)(356005)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6372
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	da9a677f-7035-42d0-a382-08d9ef6901d8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W7Wc+FIGRhCcwWo3xpcc7VQtF4cFo/fyK4L43fzJwfkoa72QqK0oTAF3USmJKJ/kDZYflB+VDeLGvcif4lnyu1s8ouIATENV8bQKk2fkQHNrgXoMKilNh8bpA0WJHOcoIR8LUHTpsdnrAWWNZlO5cm+TEC+OQWmGG+GoyOZnz9rLekOfTZUQyrDOQJPTiswWukxOsFq9LU+yLIaFj3Ev/wOesd+3p3qr4UonirZ4Ye08tVtGqTJJH7X7txhJjyWFEGIcxqBs6OEKOOfEJMzoZBGgKgmW8gfhca/dCUos+LxpJsWnC12ghCA4nO3n+tTdvBliV7N0tp50LOzh2EzF9/qUEki8QgbJvUfUUx1/5v/NDkCyCaL//l1K9q54aiptNNvHK8YDUGOLbxNU7fNppwZz/+r6O2J5P3zSmk2WFlVhxWYI72kV/Agrl72tM+kfwV5EITMdL4pOGx0MuORx2m4dFzjTiTmndBM6L3tGJNwTEdlZjMuEmc4f/WCVqVX4HFLEcyK7iDEV8ZW686HAkTkNE7oaakv+VvDlWTP/PImfhpP2fNDyO92bpdNFMzRJ0sv1pCIEUa1YOIYz7KBrnbvK1d0OEhyuBQB2DXL4FtFFmhlwN8RvQ9E/2wakzKprGGR5oJw0mfbi/AaeArxweEeYvw9I8lkc1gFDV2FNa0MQBu56DQzFU+lsNnrXsI23apNllpguVFXBtbOjyj7GaUh8XT//p5iqsQm25fv0ariN34NHTJFhEXGN0fCLJstQ5BCNzd+Rw9MDjMvSSMn9DYpGoAHmV69oLs+frqxRfv4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(82310400004)(47076005)(336012)(7696005)(316002)(83380400001)(81166007)(426003)(6666004)(2906002)(54906003)(110136005)(8936002)(5660300002)(508600001)(36860700001)(966005)(4326008)(70206006)(70586007)(8676002)(36756003)(26005)(44832011)(186003)(2616005)(86362001)(1076003)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 03:21:01.1051
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d3f9a44-d17b-4112-394b-08d9ef69069d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3522

"direct-map" property shall be added under the appropriate domain node,
when users requesting direct-map memory mapping for the domain.

Right now, direct-map is only supported when domain on Static Allocation,
that is, "xen,static-mem" is also necessary in the domain configuration.

Looking into related [design link](
https://lists.xenproject.org/archives/html/xen-devel/2021-05/msg00882.html)
for more details.

The whole design is about Static Allocation and direct-map, and this
Patch Serie only covers parts of it, which are direct-map memory map.
Other features will be delievered through different patch series.

See https://lists.xenproject.org/archives/html/xen-devel/2021-09/msg00855.html
for Domain on Static Allocation.

This patch serie is based on
https://lists.xenproject.org/archives/html/xen-devel/2021-10/msg00822.html\
---
v6 changes:
- comment, commit message and coding style fix
- protect CDF_directmap with #ifdef CONFIG_ARM
---
v5 changes:
- remove const constraint and strict "static allocation" check
- fix coding style
---
v4 changes:
- introduce internal const CDF_xxx flags for domain creation
- introduce internal flag CDF_privileged
- introduce new internal flag CDF_directmap
- add a directmap flag under struct arch_domain and use it to
reimplement is_domain_direct_mapped.
- expand arch_domain_create/domain_create to include internal-only parameter
"const unsigned int flags"
- use mfn_eq() instead, because it is the only value used to indicate
there is an error and this is more lightweight than mfn_valid()
- rename function allocate_static_memory_11() to assign_static_memory_11()
to make clear there is actually no allocation done. Instead we are only
mapping pre-defined host regions to pre-defined guest regions.
- remove tot_size to directly substract psize from kinfo->unassigned_mem
- check kinfo->unassigned_mem doesn't underflow or overflow
- remove nested if/else
- remove ASSERT_UNREACHABLE() to avoid breaking compilation on prod build with
CONFIG_GICV3=n
- comment and commit message refinement
---
v3 changes:
- move flag XEN_DOMCTL_CDF_INTERNAL_directmap back to xen/include/xen/domain.h,
to let it be only available for domain created by XEN.
- name it with extra "INTERNAL" and add comments to warn developers not
to accidently use its bitfield when introducing new XEN_DOMCTL_CDF_xxx flag.
- reject this flag in x86'es arch_sanitise_domain_config()
- add ASSERT_UNREACHABLE to catch any misuse in allocate_static_memory()
and allocate_static_memory_11()
- add another check of validating flag XEN_DOMCTL_CDF_INTERNAL_directmap only
when CONFIG_STATIC_MEMORY is set.
- simply map the CPU interface at the GPA vgic_v2_hw.cbase
- drop 'cells += (GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS)'
- rename 'is_domain_use_host_layout()' to 'domain_use_host_layout()'
---
v2 changes:
- remove the introduce of internal flag
- Refine is_domain_direct_mapped to check whether the flag
XEN_DOMCTL_CDF_directmap is set
- reword "1:1 direct-map" to just "direct-map"
- split the common codes into two helpers: parse_static_mem_prop and
acquire_static_memory_bank to deduce complexity.
- introduce a new helper allocate_static_memory_11 for allocating static
memory for direct-map guests
- remove panic action since it is fine to assign a non-DMA capable device when
IOMMU and direct-map both off
- remove redistributor accessor
- introduce new helper "is_domain_use_host_layout()"
- explain why vpl011 initialization before creating its device tree node
- error out if the domain is direct-mapped and the IRQ is not found
- harden the code and add a check/comment when the hardware UART region
is smaller than CUEST_VPL011_SIZE.
Penny Zheng (4):
  xen/arm: introduce new helper parse_static_mem_prop and
    acquire_static_memory_bank
  xen/arm: introduce direct-map for domUs
  xen/arm: add ASSERT_UNREACHABLE in allocate_static_memory
  xen/arm: gate make_gicv3_domU_node with CONFIG_GICV3

Stefano Stabellini (7):
  xen: introduce internal CDF_xxx flags for domain creation
  xen: introduce CDF_directmap
  xen/arm: Allow device-passthrough even the IOMMU is off
  xen/arm: if direct-map domain use native addresses for GICv2
  xen/arm: if direct-map domain use native addresses for GICv3
  xen/arm: if direct-map domain use native UART address and IRQ number
    for vPL011
  xen/docs: Document how to do passthrough without IOMMU

 docs/misc/arm/device-tree/booting.txt |   6 +
 docs/misc/arm/passthrough-noiommu.txt |  52 +++++
 xen/arch/arm/domain.c                 |   5 +-
 xen/arch/arm/domain_build.c           | 308 +++++++++++++++++++++-----
 xen/arch/arm/include/asm/domain.h     |  19 +-
 xen/arch/arm/include/asm/new_vgic.h   |  10 +
 xen/arch/arm/include/asm/vgic.h       |  11 +
 xen/arch/arm/include/asm/vpl011.h     |   2 +
 xen/arch/arm/vgic-v2.c                |  34 ++-
 xen/arch/arm/vgic-v3.c                |  30 +--
 xen/arch/arm/vgic/vgic-v2.c           |  34 ++-
 xen/arch/arm/vpl011.c                 |  60 ++++-
 xen/arch/x86/domain.c                 |   3 +-
 xen/arch/x86/setup.c                  |   2 +-
 xen/common/domain.c                   |  12 +-
 xen/common/sched/core.c               |   2 +-
 xen/include/xen/domain.h              |  11 +-
 xen/include/xen/sched.h               |   2 +-
 18 files changed, 494 insertions(+), 109 deletions(-)
 create mode 100644 docs/misc/arm/passthrough-noiommu.txt

-- 
2.25.1


