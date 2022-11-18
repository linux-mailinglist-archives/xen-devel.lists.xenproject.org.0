Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF4862F2E6
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 11:46:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445568.700843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovysi-0008ED-1S; Fri, 18 Nov 2022 10:46:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445568.700843; Fri, 18 Nov 2022 10:45:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovysh-0008B5-QM; Fri, 18 Nov 2022 10:45:59 +0000
Received: by outflank-mailman (input) for mailman id 445568;
 Fri, 18 Nov 2022 10:45:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nf+F=3S=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ovysf-0006R2-H0
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 10:45:58 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20602.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28845b50-672e-11ed-8fd2-01056ac49cbb;
 Fri, 18 Nov 2022 11:45:46 +0100 (CET)
Received: from AM6P191CA0034.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::47)
 by AM9PR08MB6164.eurprd08.prod.outlook.com (2603:10a6:20b:287::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.8; Fri, 18 Nov
 2022 10:45:49 +0000
Received: from AM7EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8b:cafe::89) by AM6P191CA0034.outlook.office365.com
 (2603:10a6:209:8b::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20 via Frontend
 Transport; Fri, 18 Nov 2022 10:45:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT041.mail.protection.outlook.com (100.127.140.233) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Fri, 18 Nov 2022 10:45:49 +0000
Received: ("Tessian outbound f394866f3f2b:v130");
 Fri, 18 Nov 2022 10:45:48 +0000
Received: from a36fd8b09b5b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 78C014BE-4453-40A7-974F-8BAE98B7C0D3.1; 
 Fri, 18 Nov 2022 10:45:41 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a36fd8b09b5b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 18 Nov 2022 10:45:41 +0000
Received: from FR3P281CA0146.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:95::18)
 by AM8PR08MB6449.eurprd08.prod.outlook.com (2603:10a6:20b:364::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.8; Fri, 18 Nov
 2022 10:45:30 +0000
Received: from VI1EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:95:cafe::a5) by FR3P281CA0146.outlook.office365.com
 (2603:10a6:d10:95::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18 via Frontend
 Transport; Fri, 18 Nov 2022 10:45:30 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VI1EUR03FT015.mail.protection.outlook.com (100.127.144.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Fri, 18 Nov 2022 10:45:30 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Fri, 18 Nov
 2022 10:45:20 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Fri, 18 Nov 2022 10:45:17 +0000
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
X-Inumbo-ID: 28845b50-672e-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TvHCs77zTKjeJCRttCK5jTM1WRW48h5RjGDiyWGaZqM=;
 b=D8WHmA9BcFu+Tlt5sILvC2wDqGxDUrNfNr6b+Dy+z2WckjKsyZlTzaZK6arz3PjGlz6mvWF1FNerc63VShxOpBWdq3zykzDJ8+MoQRb7kal+TD/6IZgh5qWf3jiB/aC/APlOdVMdBN/E+EgyKEhX03RVpjVysyOwyVbsm4Dtl2Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 55a5b162c61f6222
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=inHTS0E1ROt4ix3wImrljxvDQpsHWO4cugzuKHxm8ABjL9roXhcpua5FtsoJ9508BCa8wIkSLLzRAj93rS2C4SiWqM6DMi8LTTQewEdvrMARXwkfS17UwtQsdQ+UmL6N9mwDW1tDkR7CIYNEh19IlWQbALRKWXpqhay8u8IQUWhpphdqSTSW8W8HwEasii+vFXGOXqHLyc8zKaeAbBkje8ct8BsKLfuVpNnb1wbLIFMdl0JF2+wXjOn+pzMTWpXSL26v0qDCR7rc13rL3MrbIPwDbEbaeT8hthXQlgLVmAvA9G7llj5iFI/qKU6a4VBgagHogidla6ZdefrzBO7SDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TvHCs77zTKjeJCRttCK5jTM1WRW48h5RjGDiyWGaZqM=;
 b=LQJ4YBSqnsDU8HCg/lVfQwF2axAd9F9s+FXL1mUBb3ypbmICKR4P03eOx13uwTRUSzXZJQexoZTm8+zleKni6GFKhALf2jTG47ZE/Yk6TugN9oAQKt2eaM3FO6gluTHxdXF9qd3aq2/Ljd95gsDCqN5GYh8BImGr/5/ffEeusuL0dW3eLx79LvEG39yfqhnEMXEGoK0tlV/axjxf+KpBYXl4jHQqN9ZYJm6ASjQBfyCkHRod7g0X7s93IpfjSr4gWC/0QyCbdVPjyTyYk5Yq9Rscj2oPDGK8GYm95p/rSJqOlFuK176sAswvic6h3VqDUOk5qkiuah1drNjJDx/FMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TvHCs77zTKjeJCRttCK5jTM1WRW48h5RjGDiyWGaZqM=;
 b=D8WHmA9BcFu+Tlt5sILvC2wDqGxDUrNfNr6b+Dy+z2WckjKsyZlTzaZK6arz3PjGlz6mvWF1FNerc63VShxOpBWdq3zykzDJ8+MoQRb7kal+TD/6IZgh5qWf3jiB/aC/APlOdVMdBN/E+EgyKEhX03RVpjVysyOwyVbsm4Dtl2Q=
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
Subject: [PATCH v9 2/6] xen/x86: move generically usable NUMA code from x86 to common
Date: Fri, 18 Nov 2022 18:45:04 +0800
Message-ID: <20221118104508.768274-3-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221118104508.768274-1-wei.chen@arm.com>
References: <20221118104508.768274-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	VI1EUR03FT015:EE_|AM8PR08MB6449:EE_|AM7EUR03FT041:EE_|AM9PR08MB6164:EE_
X-MS-Office365-Filtering-Correlation-Id: 3472fa8b-54ee-4ec2-2a04-08dac9520e5c
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 orCV2S6pIt1+SlDo1gxet6kHJGCoMfSflOGKJS/M9b6wVqL9wYTOeKDQOiXzaA3pQES9++Vho5zMh2q5gH/DUJgM26yHHTdgQSU0Lfmv6kP+lzorVMo27C4DI+4696OjnSkqnJG6w6Ruv5TMZRpbhddpvjnzo+NrSDxBn3FNb4nYxMBHoETnXsl9NPTSi0pxNMT1B6Sy4NbgEXX20QCCNcKYG1J0RGpUOah1mAIHo2N6KN1XFlfcY2MmLn6IdpSqIgBsKb8loHk5p2ruBnQa/k5gK8CbWYWRW8t7URbgwVgrSNv1vTrECXYglbH9KHhXWFHyZFcdkDbIZAU4ZAkL0cm4na6ECUdTM05WqJlGXv0DbfM+qPbdJ8w6GVk0damTmpmp4Smp6SVHUhFi37Rc5Fr8Ed0eQ7cy6lLfm/NAdEJg+F20s+n2ipbVw5MTo1abFytF3XXdG3iYR4Vol0F+RJfe3g6s25pGvqF5N+CuIqQPwSD39aAE6daU3tx9CSKSOwS8fR2cI1vABXjiJzvKmYnK3SogP3+02TnsZL+RnhxydhH2Yf5uDiLQ2Ur+0GJuyaha5ENj0it9yJcCAdXHqg/sqwlyFJkFr14kbOMXD6KueXHeVFAjeBQC4NCVpNH1kkSfTJXvFdFxNjodLJbEKSJ3HwAHjRSBhAMIysp7PDn5m21jeiSpxh31Bv8i1t68/YP89iIAP8MV2Wj4+3cQFx51QSUDGMTV8gjCLZJnQbpTrMnZRu1mOVM8V+ogv78S
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(376002)(396003)(451199015)(40470700004)(46966006)(36840700001)(40460700003)(36756003)(2616005)(81166007)(6916009)(356005)(316002)(54906003)(40480700001)(6666004)(41300700001)(7696005)(82310400005)(26005)(70206006)(8676002)(4326008)(426003)(86362001)(70586007)(47076005)(83380400001)(2906002)(30864003)(186003)(5660300002)(44832011)(336012)(82740400003)(8936002)(1076003)(36860700001)(478600001)(21314003)(36900700001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6449
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	05dc9b1d-d8f2-4f75-c127-08dac952031a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2GcICMKnxLqeI47rCADDgF+OSuBJ9J2RNaS4ogZ5Uwh5HbMRP+6KtBIlHVFF/VgvSXJwWESK47EBpsQHcxH+sqHUwDLjHiOPE6X+MyvwQYsQ27FZQfoKOk/YApzkI1bwe7OqH0L5UuHH0c3UfgCI8g1W7/tx6FLw1LnC5+Z/DEkdSieXnurBtCOZlYI2hal+4nJyYBCLtOxy55cGBH8vfoMrFspglctDYOcV3Gn81bS9m8aAyq7/3Q6GP6M6IiTdWG2TbCxaIC47FD+75fhaXCtsbDnpPXATbPh7n4cIe/+uoPZrQ9uIH7V75W+xJy7L8hI3cqkhulEm67J3ZfL8R0A8Q8bCJS0SWzd/Cm+iriE0sjGk7YMdXRzGO/A71I84sdW3BgMjpHCNhmFLQ1ePjYonWeUxIWvG53EnrH0ei3gs2wU+A8adQlXVR04dAwCxduZV4K1LZp0K+Nft4Hk7gY+8fIP1dGhO5sUVFauh91aveNbHdV8otAX8a6T3H3CfQ0LX0NKPXLdJzV1e3ubBn7IiAW7dp2Q00A0nCCMHNSvosXNf7Z4b3Dlf41R928twzA0j5Zr12AIGs7BHwardORP+k7er+k06YeDv9+5165eeF1DaCmFfttSXVf36C8KRyzVZ4WxmKHK994iH1eaulK0eM8GtPpLn3Mx63Ax7Se/8JSb+88yKN1NoroJvXVbY9pzXK+53vO6R4x4n0g658YWcr9yw0rvm/xLr4CWg37DCrKt9Xy7SU9+9+YoeHrJA+1+p3lW8N6AIjQbijcAq9g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(39860400002)(136003)(376002)(451199015)(40470700004)(46966006)(36840700001)(8936002)(44832011)(30864003)(5660300002)(4326008)(8676002)(70586007)(41300700001)(54906003)(70206006)(316002)(6916009)(26005)(2906002)(478600001)(36756003)(186003)(1076003)(2616005)(47076005)(6666004)(7696005)(336012)(426003)(107886003)(36860700001)(82310400005)(40480700001)(40460700003)(83380400001)(81166007)(82740400003)(86362001)(21314003)(579004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 10:45:49.0987
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3472fa8b-54ee-4ec2-2a04-08dac9520e5c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6164

There are some codes in x86/numa.c can be shared by common
architectures to implememnt NUMA support. Just like some
variables and functions to check and store NUMA memory map.
And some variables and functions to do NUMA initialization.

In this patch, we move them to common/numa.c and xen/numa.h
and use the CONFIG_NUMA to gate them for non-NUMA supported
architectures. As the target header file is Xen-style, so
we trim some spaces and replace tabs for the codes that has
been moved to xen/numa.h at the same time.

As acpi_scan_nodes has been used in a common function, it
doesn't make sense to use acpi_xxx in common code, so we
rename it to numa_process_nodes in this patch too. After that
if we still use CONFIG_ACPI_NUMA in to gate numa_process_nodes
in numa_initmem_init, that doesn't make sense. As CONFIG_NUMA
will be selected by CONFIG_ACPI_NUMA for x86. So, we replace
CONFIG_ACPI_NUMA by CONFIG_NUMA to gate numa_process_nodes.

As arch_numa_disabled has been implememnted for ACPI NUMA,
we can rename srat_disabled to numa_disabled and move it
to common code as well.

The macro node_to_first_cpu(node) hasn't been used anywhere,
so we drop it in this patch too.

Because some architectures allow to use all 64 physical address
bits, but some architectures are not (like Arm64 allows 52, 48
bits). In this case, we use min(PADDR_BITS, BITS_PER_LONG - 1)
to calculate the shift when only one node is in the system in
this patch too.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v8 -> v9:
 1. No change.
v7 -> v8:
 1. Add Rb.
 2. Change "of shift too small" to "or shift too small".
v6 -> v7:
 1. Restore %d for nodeid_t in dump_numa.
 2. Use sizeof(page_num_node) for page_num_node size in memset.
 3. Add description for using min(PADDR_BITS, BITS_PER_LONG - 1)
    to calculate the shift when only one node is in the system.
 4. Use %pd for domain print.
v5 -> v6:
 1. Replace numa_scan_node to numa_process_nodes in commit log.
 2. Limit the scope of page_num_node, vnuma and page of numa_setup
    function.
 3. Use memset to init page_num_node instead of for_each_online_node.
 4. Use %u instead of %d for nodeid_t and j in numa_setup print
    messages.
 5. Use min(PADDR_BITS, BITS_PER_LONG - 1) to calculate the shift
    when only one node is in the system.
 6. Drop the marco: node_to_first_cpu(node)
v4 -> v5:
 1. Use nodeid_t instead of uint8_t for memnodemap.
 2. Restore to use typeof(*memnodemap) for _memnodemap, this will avoid the
    further adjustments for _memnodemap's type.
 3. Use __ro_after_init for numa_off.
 4. Use pointer-to-const for proper function parameters.
 5. Use unsigned int for variables that are not realy used for node ID.
 6. Fix code comments code-style and adjust the length.
 7. Fix code-styles.
 8. Rename numa_scan_nodes to numa_process_nodes.
 9. Use a plain "int ret" to record compute_hash_shift return value.
v3 -> v4:
 1. Restore compute_hash_shift's return value to int.
 2. Remove unnecessary parentheses for macros.
 3. Use unsigned int for proper variables.
 4. Fix some code-style.
v2 -> v3:
 1. Remove acpi.h from common/numa.c.
 2. Rename acpi_scan_nodes to numa_scan_nodes.
 3. Replace u8 by uint8_t for memnodemap.
 4. Use unsigned int for memnode_shift and adjust related functions
    (compute_hash_shift, populate_memnodemap) to use correct types for
    return values or parameters.
 5. Use nodeid_t for nodeid and node numbers.
 6. Use __read_mostly and __ro_after_init for appropriate variables.
 7. Adjust the __read_mostly and __initdata location for some variables.
 8. convert from plain int to unsigned for cpuid and other proper variables.
 9. Use __attribute_pure__ instead of __attribute__((pure)).
10. Replace CONFIG_ACPI_NUMA by CONFIG_NUMA in numa_initmem_init.
11. Add const for some functions' parameters.
12. Move srat_disabled to common code with new name numa_disabled.
13. Fix some spaces code-style for numa_emulation.
14. Change from int to unsigned int for numa_fake.
v1 -> v2:
1. New patch in v2.
---
 xen/arch/x86/include/asm/acpi.h  |   1 -
 xen/arch/x86/include/asm/numa.h  |  57 +---
 xen/arch/x86/include/asm/setup.h |   1 -
 xen/arch/x86/numa.c              | 433 +---------------------------
 xen/arch/x86/smpboot.c           |   2 +-
 xen/arch/x86/srat.c              |  10 +-
 xen/common/Makefile              |   1 +
 xen/common/numa.c                | 464 +++++++++++++++++++++++++++++++
 xen/include/xen/numa.h           |  66 +++++
 9 files changed, 539 insertions(+), 496 deletions(-)
 create mode 100644 xen/common/numa.c

diff --git a/xen/arch/x86/include/asm/acpi.h b/xen/arch/x86/include/asm/acpi.h
index 9a9cc4c240..5c2dd5da2d 100644
--- a/xen/arch/x86/include/asm/acpi.h
+++ b/xen/arch/x86/include/asm/acpi.h
@@ -102,7 +102,6 @@ extern unsigned long acpi_wakeup_address;
 #define ARCH_HAS_POWER_INIT	1
 
 extern s8 acpi_numa;
-extern int acpi_scan_nodes(u64 start, u64 end);
 #define NR_NODE_MEMBLKS (MAX_NUMNODES*2)
 
 extern struct acpi_sleep_info acpi_sinfo;
diff --git a/xen/arch/x86/include/asm/numa.h b/xen/arch/x86/include/asm/numa.h
index 237f2c6dbf..6c87942d43 100644
--- a/xen/arch/x86/include/asm/numa.h
+++ b/xen/arch/x86/include/asm/numa.h
@@ -9,72 +9,17 @@ typedef u8 nodeid_t;
 
 extern int srat_rev;
 
-extern nodeid_t      cpu_to_node[NR_CPUS];
-extern cpumask_t     node_to_cpumask[];
-
-#define cpu_to_node(cpu)		(cpu_to_node[cpu])
-#define parent_node(node)		(node)
-#define node_to_first_cpu(node)  (__ffs(node_to_cpumask[node]))
-#define node_to_cpumask(node)    (node_to_cpumask[node])
-
-struct node { 
-	paddr_t start, end;
-};
-
-extern int compute_hash_shift(struct node *nodes, int numnodes,
-			      nodeid_t *nodeids);
 extern nodeid_t pxm_to_node(unsigned int pxm);
 
 #define ZONE_ALIGN (1UL << (MAX_ORDER+PAGE_SHIFT))
-#define VIRTUAL_BUG_ON(x) 
 
-extern void numa_add_cpu(int cpu);
-extern void numa_init_array(void);
-extern bool numa_off;
-
-extern int arch_numa_setup(const char *opt);
-extern bool arch_numa_disabled(void);
-extern bool srat_disabled(void);
-extern void numa_set_node(int cpu, nodeid_t node);
+extern bool numa_disabled(void);
 extern nodeid_t setup_node(unsigned int pxm);
 extern void srat_detect_node(int cpu);
 
-extern void setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end);
 extern nodeid_t apicid_to_node[];
 extern void init_cpu_to_node(void);
 
-static inline void clear_node_cpumask(int cpu)
-{
-	cpumask_clear_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
-}
-
-/* Simple perfect hash to map pdx to node numbers */
-extern int memnode_shift; 
-extern unsigned long memnodemapsize;
-extern u8 *memnodemap;
-
-struct node_data {
-    unsigned long node_start_pfn;
-    unsigned long node_spanned_pages;
-};
-
-extern struct node_data node_data[];
-
-static inline __attribute__((pure)) nodeid_t phys_to_nid(paddr_t addr)
-{ 
-	nodeid_t nid;
-	VIRTUAL_BUG_ON((paddr_to_pdx(addr) >> memnode_shift) >= memnodemapsize);
-	nid = memnodemap[paddr_to_pdx(addr) >> memnode_shift]; 
-	VIRTUAL_BUG_ON(nid >= MAX_NUMNODES || !node_data[nid]); 
-	return nid; 
-} 
-
-#define NODE_DATA(nid)		(&(node_data[nid]))
-
-#define node_start_pfn(nid)	(NODE_DATA(nid)->node_start_pfn)
-#define node_spanned_pages(nid)	(NODE_DATA(nid)->node_spanned_pages)
-#define node_end_pfn(nid)       (NODE_DATA(nid)->node_start_pfn + \
-				 NODE_DATA(nid)->node_spanned_pages)
 #define arch_want_default_dmazone() (num_online_nodes() > 1)
 
 extern int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node);
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index 21037b7f31..ae470ea12f 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -20,7 +20,6 @@ void early_time_init(void);
 
 void set_nr_cpu_ids(unsigned int max_cpus);
 
-void numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn);
 void arch_init_memory(void);
 void subarch_init_memory(void);
 
diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index 1c3198445d..90b2a22591 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -4,20 +4,11 @@
  * Adapted for Xen: Ryan Harper <ryanh@us.ibm.com>
  */ 
 
-#include <xen/mm.h>
-#include <xen/string.h>
 #include <xen/init.h>
-#include <xen/ctype.h>
+#include <xen/mm.h>
 #include <xen/nodemask.h>
 #include <xen/numa.h>
-#include <xen/keyhandler.h>
-#include <xen/param.h>
-#include <xen/time.h>
-#include <xen/smp.h>
-#include <xen/pfn.h>
 #include <asm/acpi.h>
-#include <xen/sched.h>
-#include <xen/softirq.h>
 
 #ifndef Dprintk
 #define Dprintk(x...)
@@ -26,28 +17,13 @@
 /* from proto.h */
 #define round_up(x,y) ((((x)+(y))-1) & (~((y)-1)))
 
-struct node_data node_data[MAX_NUMNODES];
-
-/* Mapping from pdx to node id */
-int memnode_shift;
-static typeof(*memnodemap) _memnodemap[64];
-unsigned long memnodemapsize;
-u8 *memnodemap;
-
-nodeid_t cpu_to_node[NR_CPUS] __read_mostly = {
-    [0 ... NR_CPUS-1] = NUMA_NO_NODE
-};
 /*
  * Keep BIOS's CPU2node information, should not be used for memory allocaion
  */
 nodeid_t apicid_to_node[MAX_LOCAL_APIC] = {
     [0 ... MAX_LOCAL_APIC-1] = NUMA_NO_NODE
 };
-cpumask_t node_to_cpumask[MAX_NUMNODES] __read_mostly;
 
-nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
-
-bool numa_off;
 s8 acpi_numa = 0;
 
 int __init arch_numa_setup(const char *opt)
@@ -69,270 +45,6 @@ bool arch_numa_disabled(void)
     return acpi_numa < 0;
 }
 
-bool srat_disabled(void)
-{
-    return numa_off || arch_numa_disabled();
-}
-
-/*
- * Given a shift value, try to populate memnodemap[]
- * Returns :
- * 1 if OK
- * 0 if memnodmap[] too small (of shift too small)
- * -1 if node overlap or lost ram (shift too big)
- */
-static int __init populate_memnodemap(const struct node *nodes,
-                                      int numnodes, int shift, nodeid_t *nodeids)
-{
-    int i, res = -1;
-
-    memset(memnodemap, NUMA_NO_NODE, memnodemapsize * sizeof(*memnodemap));
-    for ( i = 0; i < numnodes; i++ )
-    {
-        unsigned long spdx = paddr_to_pdx(nodes[i].start);
-        unsigned long epdx = paddr_to_pdx(nodes[i].end - 1);
-
-        if ( spdx > epdx )
-            continue;
-        if ( (epdx >> shift) >= memnodemapsize )
-            return 0;
-        do {
-            if ( memnodemap[spdx >> shift] != NUMA_NO_NODE &&
-                 (!nodeids || memnodemap[spdx >> shift] != nodeids[i]) )
-                return -1;
-
-            if ( !nodeids )
-                memnodemap[spdx >> shift] = i;
-            else
-                memnodemap[spdx >> shift] = nodeids[i];
-
-            spdx += (1UL << shift);
-        } while ( spdx <= epdx );
-        res = 1;
-    }
-
-    return res;
-}
-
-static int __init allocate_cachealigned_memnodemap(void)
-{
-    unsigned long size = PFN_UP(memnodemapsize * sizeof(*memnodemap));
-    unsigned long mfn = mfn_x(alloc_boot_pages(size, 1));
-
-    memnodemap = mfn_to_virt(mfn);
-    mfn <<= PAGE_SHIFT;
-    size <<= PAGE_SHIFT;
-    printk(KERN_DEBUG "NUMA: Allocated memnodemap from %lx - %lx\n",
-           mfn, mfn + size);
-    memnodemapsize = size / sizeof(*memnodemap);
-
-    return 0;
-}
-
-/*
- * The LSB of all start addresses in the node map is the value of the
- * maximum possible shift.
- */
-static int __init extract_lsb_from_nodes(const struct node *nodes,
-                                         int numnodes, const nodeid_t *nodeids)
-{
-    int i, nodes_used = 0;
-    unsigned long spdx, epdx;
-    unsigned long bitfield = 0, memtop = 0;
-
-    for ( i = 0; i < numnodes; i++ )
-    {
-        spdx = paddr_to_pdx(nodes[i].start);
-        epdx = paddr_to_pdx(nodes[i].end - 1) + 1;
-        if ( spdx >= epdx )
-            continue;
-        if ( i && (!nodeids || nodeids[i - 1] != nodeids[i]) )
-            bitfield |= spdx;
-        if ( !i || !nodeids || nodeids[i - 1] != nodeids[i] )
-            nodes_used++;
-        if ( epdx > memtop )
-            memtop = epdx;
-    }
-    if ( nodes_used <= 1 )
-        i = BITS_PER_LONG - 1;
-    else
-        i = find_first_bit(&bitfield, sizeof(unsigned long)*8);
-    memnodemapsize = ((memtop - 1) >> i) + 1;
-    return i;
-}
-
-int __init compute_hash_shift(struct node *nodes, int numnodes,
-                              nodeid_t *nodeids)
-{
-    int shift;
-
-    shift = extract_lsb_from_nodes(nodes, numnodes, nodeids);
-    if ( memnodemapsize <= ARRAY_SIZE(_memnodemap) )
-        memnodemap = _memnodemap;
-    else if ( allocate_cachealigned_memnodemap() )
-        return -1;
-    printk(KERN_DEBUG "NUMA: Using %d for the hash shift.\n", shift);
-
-    if ( populate_memnodemap(nodes, numnodes, shift, nodeids) != 1 )
-    {
-        printk(KERN_INFO "Your memory is not aligned you need to "
-               "rebuild your hypervisor with a bigger NODEMAPSIZE "
-               "shift=%d\n", shift);
-        return -1;
-    }
-
-    return shift;
-}
-/* initialize NODE_DATA given nodeid and start/end */
-void __init setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end)
-{
-    unsigned long start_pfn = paddr_to_pfn(start);
-    unsigned long end_pfn = paddr_to_pfn(end);
-
-    NODE_DATA(nodeid)->node_start_pfn = start_pfn;
-    NODE_DATA(nodeid)->node_spanned_pages = end_pfn - start_pfn;
-
-    node_set_online(nodeid);
-} 
-
-void __init numa_init_array(void)
-{
-    int rr, i;
-
-    /* There are unfortunately some poorly designed mainboards around
-       that only connect memory to a single CPU. This breaks the 1:1 cpu->node
-       mapping. To avoid this fill in the mapping for all possible
-       CPUs, as the number of CPUs is not known yet.
-       We round robin the existing nodes. */
-    rr = first_node(node_online_map);
-    for ( i = 0; i < nr_cpu_ids; i++ )
-    {
-        if ( cpu_to_node[i] != NUMA_NO_NODE )
-            continue;
-        numa_set_node(i, rr);
-        rr = cycle_node(rr, node_online_map);
-    }
-}
-
-#ifdef CONFIG_NUMA_EMU
-static int numa_fake __initdata = 0;
-
-/* Numa emulation */
-static int __init numa_emulation(unsigned long start_pfn,
-                                 unsigned long end_pfn)
-{
-    int i;
-    struct node nodes[MAX_NUMNODES];
-    uint64_t sz = pfn_to_paddr(end_pfn - start_pfn) / numa_fake;
-
-    /* Kludge needed for the hash function */
-    if ( hweight64(sz) > 1 )
-    {
-        u64 x = 1;
-        while ( (x << 1) < sz )
-            x <<= 1;
-        if ( x < sz/2 )
-            printk(KERN_ERR "Numa emulation unbalanced. Complain to maintainer\n");
-        sz = x;
-    }
-
-    memset(&nodes,0,sizeof(nodes));
-    for ( i = 0; i < numa_fake; i++ )
-    {
-        nodes[i].start = pfn_to_paddr(start_pfn) + i * sz;
-        if ( i == numa_fake - 1 )
-            sz = pfn_to_paddr(end_pfn) - nodes[i].start;
-        nodes[i].end = nodes[i].start + sz;
-        printk(KERN_INFO "Faking node %d at %"PRIx64"-%"PRIx64" (%"PRIu64"MB)\n",
-               i,
-               nodes[i].start, nodes[i].end,
-               (nodes[i].end - nodes[i].start) >> 20);
-        node_set_online(i);
-    }
-    memnode_shift = compute_hash_shift(nodes, numa_fake, NULL);
-    if ( memnode_shift < 0 )
-    {
-        memnode_shift = 0;
-        printk(KERN_ERR "No NUMA hash function found. Emulation disabled.\n");
-        return -1;
-    }
-    for_each_online_node ( i )
-        setup_node_bootmem(i, nodes[i].start, nodes[i].end);
-    numa_init_array();
-
-    return 0;
-}
-#endif
-
-void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
-{ 
-    int i;
-    paddr_t start = pfn_to_paddr(start_pfn);
-    paddr_t end = pfn_to_paddr(end_pfn);
-
-#ifdef CONFIG_NUMA_EMU
-    if ( numa_fake && !numa_emulation(start_pfn, end_pfn) )
-        return;
-#endif
-
-#ifdef CONFIG_ACPI_NUMA
-    if ( !numa_off && !acpi_scan_nodes(start, end) )
-        return;
-#endif
-
-    printk(KERN_INFO "%s\n",
-           numa_off ? "NUMA turned off" : "No NUMA configuration found");
-
-    printk(KERN_INFO "Faking a node at %"PRIpaddr"-%"PRIpaddr"\n",
-           start, end);
-    /* setup dummy node covering all memory */
-    memnode_shift = BITS_PER_LONG - 1;
-    memnodemap = _memnodemap;
-    /* Dummy node only uses 1 slot in reality */
-    memnodemap[0] = 0;
-    memnodemapsize = 1;
-
-    nodes_clear(node_online_map);
-    node_set_online(0);
-    for ( i = 0; i < nr_cpu_ids; i++ )
-        numa_set_node(i, 0);
-    cpumask_copy(&node_to_cpumask[0], cpumask_of(0));
-    setup_node_bootmem(0, start, end);
-}
-
-void numa_add_cpu(int cpu)
-{
-    cpumask_set_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
-} 
-
-void numa_set_node(int cpu, nodeid_t node)
-{
-    cpu_to_node[cpu] = node;
-}
-
-/* [numa=off] */
-static int __init cf_check numa_setup(const char *opt)
-{
-    if ( !strncmp(opt, "off", 3) )
-        numa_off = true;
-    else if ( !strncmp(opt, "on", 2) )
-        numa_off = false;
-#ifdef CONFIG_NUMA_EMU
-    else if ( !strncmp(opt, "fake=", 5) )
-    {
-        numa_off = false;
-        numa_fake = simple_strtoul(opt + 5, NULL, 0);
-        if ( numa_fake >= MAX_NUMNODES )
-            numa_fake = MAX_NUMNODES;
-    }
-#endif
-    else
-        return arch_numa_setup(opt);
-
-    return 0;
-} 
-custom_param("numa", numa_setup);
-
 /*
  * Setup early cpu_to_node.
  *
@@ -381,146 +93,3 @@ unsigned int __init arch_get_dma_bitsize(void)
                  flsl(node_start_pfn(node) + node_spanned_pages(node) / 4 - 1)
                  + PAGE_SHIFT, 32);
 }
-
-static void cf_check dump_numa(unsigned char key)
-{
-    s_time_t now = NOW();
-    unsigned int i, j, n;
-    struct domain *d;
-    struct page_info *page;
-    unsigned int page_num_node[MAX_NUMNODES];
-    const struct vnuma_info *vnuma;
-
-    printk("'%c' pressed -> dumping numa info (now = %"PRI_stime")\n", key,
-           now);
-
-    for_each_online_node ( i )
-    {
-        paddr_t pa = pfn_to_paddr(node_start_pfn(i) + 1);
-
-        printk("NODE%u start->%lu size->%lu free->%lu\n",
-               i, node_start_pfn(i), node_spanned_pages(i),
-               avail_node_heap_pages(i));
-        /* sanity check phys_to_nid() */
-        if ( phys_to_nid(pa) != i )
-            printk("phys_to_nid(%"PRIpaddr") -> %d should be %u\n",
-                   pa, phys_to_nid(pa), i);
-    }
-
-    j = cpumask_first(&cpu_online_map);
-    n = 0;
-    for_each_online_cpu ( i )
-    {
-        if ( i != j + n || cpu_to_node[j] != cpu_to_node[i] )
-        {
-            if ( n > 1 )
-                printk("CPU%u...%u -> NODE%d\n", j, j + n - 1, cpu_to_node[j]);
-            else
-                printk("CPU%u -> NODE%d\n", j, cpu_to_node[j]);
-            j = i;
-            n = 1;
-        }
-        else
-            ++n;
-    }
-    if ( n > 1 )
-        printk("CPU%u...%u -> NODE%d\n", j, j + n - 1, cpu_to_node[j]);
-    else
-        printk("CPU%u -> NODE%d\n", j, cpu_to_node[j]);
-
-    rcu_read_lock(&domlist_read_lock);
-
-    printk("Memory location of each domain:\n");
-    for_each_domain ( d )
-    {
-        process_pending_softirqs();
-
-        printk("Domain %u (total: %u):\n", d->domain_id, domain_tot_pages(d));
-
-        for_each_online_node ( i )
-            page_num_node[i] = 0;
-
-        spin_lock(&d->page_alloc_lock);
-        page_list_for_each(page, &d->page_list)
-        {
-            i = phys_to_nid(page_to_maddr(page));
-            page_num_node[i]++;
-        }
-        spin_unlock(&d->page_alloc_lock);
-
-        for_each_online_node ( i )
-            printk("    Node %u: %u\n", i, page_num_node[i]);
-
-        if ( !read_trylock(&d->vnuma_rwlock) )
-            continue;
-
-        if ( !d->vnuma )
-        {
-            read_unlock(&d->vnuma_rwlock);
-            continue;
-        }
-
-        vnuma = d->vnuma;
-        printk("     %u vnodes, %u vcpus, guest physical layout:\n",
-               vnuma->nr_vnodes, d->max_vcpus);
-        for ( i = 0; i < vnuma->nr_vnodes; i++ )
-        {
-            unsigned int start_cpu = ~0U;
-
-            if ( vnuma->vnode_to_pnode[i] == NUMA_NO_NODE )
-                printk("       %3u: pnode ???,", i);
-            else
-                printk("       %3u: pnode %3u,", i, vnuma->vnode_to_pnode[i]);
-
-            printk(" vcpus ");
-
-            for ( j = 0; j < d->max_vcpus; j++ )
-            {
-                if ( !(j & 0x3f) )
-                    process_pending_softirqs();
-
-                if ( vnuma->vcpu_to_vnode[j] == i )
-                {
-                    if ( start_cpu == ~0U )
-                    {
-                        printk("%d", j);
-                        start_cpu = j;
-                    }
-                }
-                else if ( start_cpu != ~0U )
-                {
-                    if ( j - 1 != start_cpu )
-                        printk("-%d ", j - 1);
-                    else
-                        printk(" ");
-                    start_cpu = ~0U;
-                }
-            }
-
-            if ( start_cpu != ~0U  && start_cpu != j - 1 )
-                printk("-%d", j - 1);
-
-            printk("\n");
-
-            for ( j = 0; j < vnuma->nr_vmemranges; j++ )
-            {
-                if ( vnuma->vmemrange[j].nid == i )
-                    printk("           %016"PRIx64" - %016"PRIx64"\n",
-                           vnuma->vmemrange[j].start,
-                           vnuma->vmemrange[j].end);
-            }
-        }
-
-        read_unlock(&d->vnuma_rwlock);
-    }
-
-    rcu_read_unlock(&domlist_read_lock);
-}
-
-static int __init cf_check register_numa_trigger(void)
-{
-    register_keyhandler('u', dump_numa, "dump NUMA info", 1);
-    return 0;
-}
-__initcall(register_numa_trigger);
-
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index b46fd9ab18..9df08e9366 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -1350,7 +1350,7 @@ int cpu_add(uint32_t apic_id, uint32_t acpi_id, uint32_t pxm)
 
     x86_acpiid_to_apicid[acpi_id] = apic_id;
 
-    if ( !srat_disabled() )
+    if ( !numa_disabled() )
     {
         nodeid_t node = setup_node(pxm);
 
diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index fbcd8749c4..ce507dac9e 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -238,7 +238,7 @@ acpi_numa_x2apic_affinity_init(const struct acpi_srat_x2apic_cpu_affinity *pa)
 	unsigned pxm;
 	nodeid_t node;
 
-	if (srat_disabled())
+	if (numa_disabled())
 		return;
 	if (pa->header.length < sizeof(struct acpi_srat_x2apic_cpu_affinity)) {
 		bad_srat();
@@ -274,7 +274,7 @@ acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *pa)
 	unsigned pxm;
 	nodeid_t node;
 
-	if (srat_disabled())
+	if (numa_disabled())
 		return;
 	if (pa->header.length != sizeof(struct acpi_srat_cpu_affinity)) {
 		bad_srat();
@@ -314,7 +314,7 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 	unsigned int i;
 	bool next = false;
 
-	if (srat_disabled())
+	if (numa_disabled())
 		return;
 	if (ma->header.length != sizeof(struct acpi_srat_mem_affinity)) {
 		bad_srat();
@@ -543,8 +543,8 @@ void __init srat_parse_regions(paddr_t addr)
 	pfn_pdx_hole_setup(mask >> PAGE_SHIFT);
 }
 
-/* Use the information discovered above to actually set up the nodes. */
-int __init acpi_scan_nodes(paddr_t start, paddr_t end)
+/* Use discovered information to actually set up the nodes. */
+int __init numa_process_nodes(paddr_t start, paddr_t end)
 {
 	int i;
 	nodemask_t all_nodes_parsed;
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 3baf83d527..9a3a12b12d 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_MEM_ACCESS) += mem_access.o
 obj-y += memory.o
 obj-y += multicall.o
 obj-y += notifier.o
+obj-$(CONFIG_NUMA) += numa.o
 obj-y += page_alloc.o
 obj-$(CONFIG_HAS_PDX) += pdx.o
 obj-$(CONFIG_PERF_COUNTERS) += perfc.o
diff --git a/xen/common/numa.c b/xen/common/numa.c
new file mode 100644
index 0000000000..a135154c3e
--- /dev/null
+++ b/xen/common/numa.c
@@ -0,0 +1,464 @@
+/*
+ * Generic VM initialization for NUMA setups.
+ * Copyright 2002,2003 Andi Kleen, SuSE Labs.
+ * Adapted for Xen: Ryan Harper <ryanh@us.ibm.com>
+ */
+
+#include <xen/init.h>
+#include <xen/keyhandler.h>
+#include <xen/mm.h>
+#include <xen/nodemask.h>
+#include <xen/numa.h>
+#include <xen/param.h>
+#include <xen/sched.h>
+#include <xen/softirq.h>
+
+struct node_data __ro_after_init node_data[MAX_NUMNODES];
+
+/* Mapping from pdx to node id */
+unsigned int __ro_after_init memnode_shift;
+unsigned long __ro_after_init memnodemapsize;
+nodeid_t *__ro_after_init memnodemap;
+static typeof(*memnodemap) __ro_after_init _memnodemap[64];
+
+nodeid_t __read_mostly cpu_to_node[NR_CPUS] = {
+    [0 ... NR_CPUS-1] = NUMA_NO_NODE
+};
+
+cpumask_t __read_mostly node_to_cpumask[MAX_NUMNODES];
+
+nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
+
+bool __ro_after_init numa_off;
+
+bool numa_disabled(void)
+{
+    return numa_off || arch_numa_disabled();
+}
+
+/*
+ * Given a shift value, try to populate memnodemap[]
+ * Returns :
+ * 1 if OK
+ * 0 if memnodmap[] too small (or shift too small)
+ * -1 if node overlap or lost ram (shift too big)
+ */
+static int __init populate_memnodemap(const struct node *nodes,
+                                      unsigned int numnodes, unsigned int shift,
+                                      const nodeid_t *nodeids)
+{
+    unsigned int i;
+    int res = -1;
+
+    memset(memnodemap, NUMA_NO_NODE, memnodemapsize * sizeof(*memnodemap));
+
+    for ( i = 0; i < numnodes; i++ )
+    {
+        unsigned long spdx = paddr_to_pdx(nodes[i].start);
+        unsigned long epdx = paddr_to_pdx(nodes[i].end - 1);
+
+        if ( spdx > epdx )
+            continue;
+
+        if ( (epdx >> shift) >= memnodemapsize )
+            return 0;
+
+        do {
+            if ( memnodemap[spdx >> shift] != NUMA_NO_NODE &&
+                 (!nodeids || memnodemap[spdx >> shift] != nodeids[i]) )
+                return -1;
+
+            if ( !nodeids )
+                memnodemap[spdx >> shift] = i;
+            else
+                memnodemap[spdx >> shift] = nodeids[i];
+
+            spdx += (1UL << shift);
+        } while ( spdx <= epdx );
+
+        res = 1;
+    }
+
+    return res;
+}
+
+static int __init allocate_cachealigned_memnodemap(void)
+{
+    unsigned long size = PFN_UP(memnodemapsize * sizeof(*memnodemap));
+    unsigned long mfn = mfn_x(alloc_boot_pages(size, 1));
+
+    memnodemap = mfn_to_virt(mfn);
+    mfn <<= PAGE_SHIFT;
+    size <<= PAGE_SHIFT;
+    printk(KERN_DEBUG "NUMA: Allocated memnodemap from %lx - %lx\n",
+           mfn, mfn + size);
+    memnodemapsize = size / sizeof(*memnodemap);
+
+    return 0;
+}
+
+/*
+ * The LSB of all start addresses in the node map is the value of the
+ * maximum possible shift.
+ */
+static unsigned int __init extract_lsb_from_nodes(const struct node *nodes,
+                                                  nodeid_t numnodes,
+                                                  const nodeid_t *nodeids)
+{
+    unsigned int i, nodes_used = 0;
+    unsigned long bitfield = 0, memtop = 0;
+
+    for ( i = 0; i < numnodes; i++ )
+    {
+        unsigned long spdx = paddr_to_pdx(nodes[i].start);
+        unsigned long epdx = paddr_to_pdx(nodes[i].end - 1) + 1;
+
+        if ( spdx >= epdx )
+            continue;
+
+        if ( i && (!nodeids || nodeids[i - 1] != nodeids[i]) )
+            bitfield |= spdx;
+
+        if ( !i || !nodeids || nodeids[i - 1] != nodeids[i] )
+            nodes_used++;
+
+        if ( epdx > memtop )
+            memtop = epdx;
+    }
+
+    if ( nodes_used <= 1 )
+        i = min(PADDR_BITS, BITS_PER_LONG - 1);
+    else
+        i = find_first_bit(&bitfield, sizeof(unsigned long) * 8);
+
+    memnodemapsize = ((memtop - 1) >> i) + 1;
+
+    return i;
+}
+
+int __init compute_hash_shift(const struct node *nodes,
+                              unsigned int numnodes, const nodeid_t *nodeids)
+{
+    unsigned int shift = extract_lsb_from_nodes(nodes, numnodes, nodeids);
+
+    if ( memnodemapsize <= ARRAY_SIZE(_memnodemap) )
+        memnodemap = _memnodemap;
+    else if ( allocate_cachealigned_memnodemap() )
+        return -1;
+
+    printk(KERN_DEBUG "NUMA: Using %u for the hash shift\n", shift);
+
+    if ( populate_memnodemap(nodes, numnodes, shift, nodeids) != 1 )
+    {
+        printk(KERN_INFO "Your memory is not aligned you need to "
+               "rebuild your hypervisor with a bigger NODEMAPSIZE "
+               "shift=%u\n", shift);
+        return -1;
+    }
+
+    return shift;
+}
+
+/* Initialize NODE_DATA given nodeid and start/end */
+void __init setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end)
+{
+    unsigned long start_pfn = paddr_to_pfn(start);
+    unsigned long end_pfn = paddr_to_pfn(end);
+
+    NODE_DATA(nodeid)->node_start_pfn = start_pfn;
+    NODE_DATA(nodeid)->node_spanned_pages = end_pfn - start_pfn;
+
+    node_set_online(nodeid);
+}
+
+void __init numa_init_array(void)
+{
+    unsigned int i;
+    nodeid_t rr;
+
+    /*
+     * There are unfortunately some poorly designed mainboards
+     * around that only connect memory to a single CPU. This
+     * breaks the 1:1 cpu->node mapping. To avoid this fill in
+     * the mapping for all possible CPUs, as the number of CPUs
+     * is not known yet. We round robin the existing nodes.
+     */
+    rr = first_node(node_online_map);
+    for ( i = 0; i < nr_cpu_ids; i++ )
+    {
+        if ( cpu_to_node[i] != NUMA_NO_NODE )
+            continue;
+        numa_set_node(i, rr);
+        rr = cycle_node(rr, node_online_map);
+    }
+}
+
+#ifdef CONFIG_NUMA_EMU
+static unsigned int __initdata numa_fake;
+
+/* Numa emulation */
+static int __init numa_emulation(unsigned long start_pfn,
+                                 unsigned long end_pfn)
+{
+    int ret;
+    unsigned int i;
+    struct node nodes[MAX_NUMNODES];
+    uint64_t sz = pfn_to_paddr(end_pfn - start_pfn) / numa_fake;
+
+    /* Kludge needed for the hash function */
+    if ( hweight64(sz) > 1 )
+    {
+        uint64_t x = 1;
+
+        while ( (x << 1) < sz )
+            x <<= 1;
+        if ( x < sz / 2 )
+            printk(KERN_ERR "Numa emulation unbalanced. Complain to maintainer\n");
+        sz = x;
+    }
+
+    memset(&nodes, 0, sizeof(nodes));
+    for ( i = 0; i < numa_fake; i++ )
+    {
+        nodes[i].start = pfn_to_paddr(start_pfn) + i * sz;
+
+        if ( i == numa_fake - 1 )
+            sz = pfn_to_paddr(end_pfn) - nodes[i].start;
+
+        nodes[i].end = nodes[i].start + sz;
+        printk(KERN_INFO "Faking node %u at %"PRIx64"-%"PRIx64" (%"PRIu64"MB)\n",
+               i, nodes[i].start, nodes[i].end,
+               (nodes[i].end - nodes[i].start) >> 20);
+        node_set_online(i);
+    }
+
+    ret = compute_hash_shift(nodes, numa_fake, NULL);
+    if ( ret < 0 )
+    {
+        printk(KERN_ERR "No NUMA hash function found. Emulation disabled.\n");
+        return -1;
+    }
+    memnode_shift = ret;
+
+    for_each_online_node ( i )
+        setup_node_bootmem(i, nodes[i].start, nodes[i].end);
+
+    numa_init_array();
+
+    return 0;
+}
+#endif
+
+void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
+{
+    unsigned int i;
+    paddr_t start = pfn_to_paddr(start_pfn);
+    paddr_t end = pfn_to_paddr(end_pfn);
+
+#ifdef CONFIG_NUMA_EMU
+    if ( numa_fake && !numa_emulation(start_pfn, end_pfn) )
+        return;
+#endif
+
+#ifdef CONFIG_NUMA
+    if ( !numa_off && !numa_process_nodes(start, end) )
+        return;
+#endif
+
+    printk(KERN_INFO "%s\n",
+           numa_off ? "NUMA turned off" : "No NUMA configuration found");
+
+    printk(KERN_INFO "Faking a node at %"PRIpaddr"-%"PRIpaddr"\n",
+           start, end);
+
+    /* Setup dummy node covering all memory */
+    memnode_shift = BITS_PER_LONG - 1;
+    memnodemap = _memnodemap;
+
+    /* Dummy node only uses 1 slot in reality */
+    memnodemap[0] = 0;
+    memnodemapsize = 1;
+
+    nodes_clear(node_online_map);
+    node_set_online(0);
+    for ( i = 0; i < nr_cpu_ids; i++ )
+        numa_set_node(i, 0);
+
+    cpumask_copy(&node_to_cpumask[0], cpumask_of(0));
+    setup_node_bootmem(0, start, end);
+}
+
+void numa_add_cpu(unsigned int cpu)
+{
+    cpumask_set_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
+}
+
+void numa_set_node(unsigned int cpu, nodeid_t node)
+{
+    cpu_to_node[cpu] = node;
+}
+
+/* [numa=off] */
+static int __init cf_check numa_setup(const char *opt)
+{
+    if ( !strncmp(opt, "off", 3) )
+        numa_off = true;
+    else if ( !strncmp(opt, "on", 2) )
+        numa_off = false;
+#ifdef CONFIG_NUMA_EMU
+    else if ( !strncmp(opt, "fake=", 5) )
+    {
+        numa_off = false;
+        numa_fake = simple_strtoul(opt + 5, NULL, 0);
+        if ( numa_fake >= MAX_NUMNODES )
+            numa_fake = MAX_NUMNODES;
+    }
+#endif
+    else
+        return arch_numa_setup(opt);
+
+    return 0;
+}
+custom_param("numa", numa_setup);
+
+static void cf_check dump_numa(unsigned char key)
+{
+    s_time_t now = NOW();
+    unsigned int i, j, n;
+    struct domain *d;
+
+    printk("'%c' pressed -> dumping numa info (now = %"PRI_stime")\n", key,
+           now);
+
+    for_each_online_node ( i )
+    {
+        paddr_t pa = pfn_to_paddr(node_start_pfn(i) + 1);
+
+        printk("NODE%u start->%lu size->%lu free->%lu\n",
+               i, node_start_pfn(i), node_spanned_pages(i),
+               avail_node_heap_pages(i));
+        /* Sanity check phys_to_nid() */
+        if ( phys_to_nid(pa) != i )
+            printk("phys_to_nid(%"PRIpaddr") -> %d should be %u\n",
+                   pa, phys_to_nid(pa), i);
+    }
+
+    j = cpumask_first(&cpu_online_map);
+    n = 0;
+    for_each_online_cpu ( i )
+    {
+        if ( i != j + n || cpu_to_node[j] != cpu_to_node[i] )
+        {
+            if ( n > 1 )
+                printk("CPU%u...%u -> NODE%d\n", j, j + n - 1, cpu_to_node[j]);
+            else
+                printk("CPU%u -> NODE%d\n", j, cpu_to_node[j]);
+            j = i;
+            n = 1;
+        }
+        else
+            ++n;
+    }
+    if ( n > 1 )
+        printk("CPU%u...%u -> NODE%d\n", j, j + n - 1, cpu_to_node[j]);
+    else
+        printk("CPU%u -> NODE%d\n", j, cpu_to_node[j]);
+
+    rcu_read_lock(&domlist_read_lock);
+
+    printk("Memory location of each domain:\n");
+    for_each_domain ( d )
+    {
+        const struct page_info *page;
+        unsigned int page_num_node[MAX_NUMNODES];
+        const struct vnuma_info *vnuma;
+
+        process_pending_softirqs();
+
+        printk("%pd (total: %u):\n", d, domain_tot_pages(d));
+
+        memset(page_num_node, 0, sizeof(page_num_node));
+
+        spin_lock(&d->page_alloc_lock);
+        page_list_for_each ( page, &d->page_list )
+        {
+            i = phys_to_nid(page_to_maddr(page));
+            page_num_node[i]++;
+        }
+        spin_unlock(&d->page_alloc_lock);
+
+        for_each_online_node ( i )
+            printk("    Node %u: %u\n", i, page_num_node[i]);
+
+        if ( !read_trylock(&d->vnuma_rwlock) )
+            continue;
+
+        if ( !d->vnuma )
+        {
+            read_unlock(&d->vnuma_rwlock);
+            continue;
+        }
+
+        vnuma = d->vnuma;
+        printk("     %u vnodes, %u vcpus, guest physical layout:\n",
+               vnuma->nr_vnodes, d->max_vcpus);
+        for ( i = 0; i < vnuma->nr_vnodes; i++ )
+        {
+            unsigned int start_cpu = ~0U;
+
+            if ( vnuma->vnode_to_pnode[i] == NUMA_NO_NODE )
+                printk("       %3u: pnode ???,", i);
+            else
+                printk("       %3u: pnode %3u,", i, vnuma->vnode_to_pnode[i]);
+
+            printk(" vcpus ");
+
+            for ( j = 0; j < d->max_vcpus; j++ )
+            {
+                if ( !(j & 0x3f) )
+                    process_pending_softirqs();
+
+                if ( vnuma->vcpu_to_vnode[j] == i )
+                {
+                    if ( start_cpu == ~0U )
+                    {
+                        printk("%u", j);
+                        start_cpu = j;
+                    }
+                }
+                else if ( start_cpu != ~0U )
+                {
+                    if ( j - 1 != start_cpu )
+                        printk("-%u ", j - 1);
+                    else
+                        printk(" ");
+                    start_cpu = ~0U;
+                }
+            }
+
+            if ( start_cpu != ~0U  && start_cpu != j - 1 )
+                printk("-%u", j - 1);
+
+            printk("\n");
+
+            for ( j = 0; j < vnuma->nr_vmemranges; j++ )
+            {
+                if ( vnuma->vmemrange[j].nid == i )
+                    printk("           %016"PRIx64" - %016"PRIx64"\n",
+                           vnuma->vmemrange[j].start,
+                           vnuma->vmemrange[j].end);
+            }
+        }
+
+        read_unlock(&d->vnuma_rwlock);
+    }
+
+    rcu_read_unlock(&domlist_read_lock);
+}
+
+static int __init cf_check register_numa_trigger(void)
+{
+    register_keyhandler('u', dump_numa, "dump NUMA info", 1);
+    return 0;
+}
+__initcall(register_numa_trigger);
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index 7aef1a88dc..5b3877344b 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -18,4 +18,70 @@
   (((d)->vcpu != NULL && (d)->vcpu[0] != NULL) \
    ? vcpu_to_node((d)->vcpu[0]) : NUMA_NO_NODE)
 
+/* The following content can be used when NUMA feature is enabled */
+#ifdef CONFIG_NUMA
+
+extern nodeid_t      cpu_to_node[NR_CPUS];
+extern cpumask_t     node_to_cpumask[];
+
+#define cpu_to_node(cpu)        cpu_to_node[cpu]
+#define parent_node(node)       (node)
+#define node_to_cpumask(node)   node_to_cpumask[node]
+
+struct node {
+    paddr_t start, end;
+};
+
+extern int compute_hash_shift(const struct node *nodes,
+                              unsigned int numnodes, const nodeid_t *nodeids);
+
+#define VIRTUAL_BUG_ON(x)
+
+extern bool numa_off;
+
+extern void numa_add_cpu(unsigned int cpu);
+extern void numa_init_array(void);
+extern void numa_set_node(unsigned int cpu, nodeid_t node);
+extern void numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn);
+extern int numa_process_nodes(paddr_t start, paddr_t end);
+
+extern int arch_numa_setup(const char *opt);
+extern bool arch_numa_disabled(void);
+extern void setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end);
+
+static inline void clear_node_cpumask(unsigned int cpu)
+{
+    cpumask_clear_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
+}
+
+/* Simple perfect hash to map pdx to node numbers */
+extern unsigned int memnode_shift;
+extern unsigned long memnodemapsize;
+extern uint8_t *memnodemap;
+
+struct node_data {
+    unsigned long node_start_pfn;
+    unsigned long node_spanned_pages;
+};
+
+extern struct node_data node_data[];
+
+static inline nodeid_t __attribute_pure__ phys_to_nid(paddr_t addr)
+{
+    nodeid_t nid;
+    VIRTUAL_BUG_ON((paddr_to_pdx(addr) >> memnode_shift) >= memnodemapsize);
+    nid = memnodemap[paddr_to_pdx(addr) >> memnode_shift];
+    VIRTUAL_BUG_ON(nid >= MAX_NUMNODES || !node_data[nid]);
+    return nid;
+}
+
+#define NODE_DATA(nid)          (&node_data[nid])
+
+#define node_start_pfn(nid)     (NODE_DATA(nid)->node_start_pfn)
+#define node_spanned_pages(nid) (NODE_DATA(nid)->node_spanned_pages)
+#define node_end_pfn(nid)       (NODE_DATA(nid)->node_start_pfn + \
+                                 NODE_DATA(nid)->node_spanned_pages)
+
+#endif
+
 #endif /* _XEN_NUMA_H */
-- 
2.25.1


