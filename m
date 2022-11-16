Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC4762B5B2
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 09:55:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444232.699215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovEBp-0008HP-OQ; Wed, 16 Nov 2022 08:54:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444232.699215; Wed, 16 Nov 2022 08:54:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovEBp-0008FH-LW; Wed, 16 Nov 2022 08:54:37 +0000
Received: by outflank-mailman (input) for mailman id 444232;
 Wed, 16 Nov 2022 08:54:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ql+j=3Q=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ovEBo-0008FB-37
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 08:54:36 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060d.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49d47e8b-658c-11ed-8fd2-01056ac49cbb;
 Wed, 16 Nov 2022 09:54:34 +0100 (CET)
Received: from MW4PR03CA0191.namprd03.prod.outlook.com (2603:10b6:303:b8::16)
 by CH0PR12MB5300.namprd12.prod.outlook.com (2603:10b6:610:d7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Wed, 16 Nov
 2022 08:54:30 +0000
Received: from CO1NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b8:cafe::ac) by MW4PR03CA0191.outlook.office365.com
 (2603:10b6:303:b8::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17 via Frontend
 Transport; Wed, 16 Nov 2022 08:54:30 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT034.mail.protection.outlook.com (10.13.174.248) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Wed, 16 Nov 2022 08:54:28 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 16 Nov
 2022 02:54:26 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 16 Nov
 2022 02:54:26 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Wed, 16 Nov 2022 02:54:25 -0600
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
X-Inumbo-ID: 49d47e8b-658c-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MDcRJm6cFB/bZEV1nyqTTQndPkAb09INwNsSElhv8KNAMsmLwMMP48oNPGtbIiAv6/ROQL40mEaRVh5LwMjb/AGrp4jXn6z/gEZ7A3EioT9xemBjnAL3uBwylar+CaSAdCOl1S1HJG8ZKDgv3Lryu7zEId44FvF9qa5kv4+n7rEyYkEFdnIpsNLyY8oRj2Mfyxq6bBSWj+3TS6jnddiNzVbHz3Mq0nfP78bpd8TRwwRMKqRHRb/uQZ3e9w5M3va1BMbt9y38MXt7WJLC/C5/FhuW1TkrEvrF6CHOYTjFG9nVDa+4a4ojLvr2+gQCO73e8U/7oj5fr44qWOe7dimnDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ONISQ8ezoJflHfDnx3dfBWiAhcXDYNCcsPRLwe3lQM4=;
 b=jEz/MLGd5F3OaPueM9yLzUxb2vSASBTVU+juMkALnKwhTzAHtNcc54LPtcjtW+tnMUl5ySjWcY7d0mU/NPYnhu5q4vj0AcXNpVbgL3lHuH+Mhg+BUwMO0vmOEM44kKeDf28pkQbWvE3wCFq/tz4jq5+WzZcnS1aG+HhQ42fjjN7H7DWAgULb2h+VGy+7VKymAA7YSJT0HpgxrBwlSew1vVJwqhVF4NMFwdfwsB3Lf3Aoj/VTbjWxvkXItIuW448zam5rBFhZUSKWO55AEKVLOHueq8d0jOxJJywLxsCBpsATSFms19Ri13kLm9VCH3/l1YZoffMzCgl3r6x9HZdtCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ONISQ8ezoJflHfDnx3dfBWiAhcXDYNCcsPRLwe3lQM4=;
 b=WkglTATLoui1dzn5yH4oQ+bZTjtuzsf0KASkpZzz5LsRynU8D21JZTmIVEGteJ0hr9HQB8f9r9UJtKTTWQrdbYtsI9g22pAnCv3tomAjprs9fxgyXkBaIkSJ83fmv9O5ku4bc8sBQpKSzsnY79iWlve0JtNW1gZpF/VSCXTHVlE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>
Subject: [ImageBuilder] Do not set #xen,static-mem-{address/size}-cells
Date: Wed, 16 Nov 2022 09:54:17 +0100
Message-ID: <20221116085417.3159-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT034:EE_|CH0PR12MB5300:EE_
X-MS-Office365-Filtering-Correlation-Id: 321ecb25-cfcd-4f76-af51-08dac7b02bef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NyBMIBIdyNHCKka7jzIThKTfFRDKeDLXwZcbYViQZ5PmEGN0dwfKe+1/KfqCAfy3ErYBzl6kFNIe6nZdRn35aMYJx2Pas9uCA93nF29csVJ4sS4zX9Xp8+c0Y9Kpo1XTwW3F9PfQeG/bECBGp3wPwPGN1IMvFA4SGJVfwdaWR00RZpMOp/+JZAykn38aJ0KcECkKUUALqxLZ++HU+3urYOb6FzYOyGYLHkk8jUdovsAmhdsVONFTD1ZW+kQOjZj11affg2d0LB+wq+pItaYgXfMvfGMBvTLFSkHuO5zPYaRpTjU+rSS1ssEkvWJeQ6Yu3hoJil3TjNYUUzWJOP0FQ/DLnMGwwizHn5V6Fsw0zzYyOhSDy3hPmUNqHB2Oml8N7grP0iOks2k+XacymeUrwHEK6kkkhsZ8MFysyoW7efoTFKUWjehT+URGZBXJKuwxOwPEq1JZPMuE4MHkRQKc/EUPJw36Semi59manIos9EBtplrwWNhL146gnLOonxP1IYWcIy0LDX/r23HkGrdJtEyOyPbkMmja0EQdM6ecrVvhRBBLIKN/qxyawjxWtwxSio9/NpOzav3iCoO3M0S5ReKmj1cjvTZ0nkvAjucj4MO+XiBIOPnyzF6x7v++NXjhX4TLTiRVg45ZgN9inZdbBL+b7aQP/gMVfBxtciYIKmKZ1o4XNU1ZYipetfy3Ii64LqujNe5dwG7cI5ZwffP9/LJbzZNGeHPjsCyl0G5zSHdD4E5ruxWXjijemvXYJR+AHNy14Pv7cOVd+9bXAsBU8DDqyRok0iX3vs8G48QinMo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199015)(36840700001)(46966006)(40470700004)(82740400003)(36860700001)(82310400005)(356005)(81166007)(86362001)(6666004)(40480700001)(5660300002)(478600001)(8936002)(316002)(4326008)(8676002)(41300700001)(70206006)(54906003)(6916009)(70586007)(47076005)(426003)(336012)(2616005)(83380400001)(186003)(2906002)(40460700003)(44832011)(1076003)(26005)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 08:54:28.9927
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 321ecb25-cfcd-4f76-af51-08dac7b02bef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5300

Xen commit 942ac5fc15ec ("xen/arm, device-tree: Make static-mem
use #{address,size}-cells") dropped these custom properties in favor of
reusing regular #{address/size}-cells from the chosen node for the
xen,static-mem property. Reflect this change in ImageBuilder.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
The master branch of ImageBuilder should reflect the current status of Xen.
Apart from that, we might want to come up with some versioning system in
ImageBuilder, because commits like this one are breaking the backwards
compatibility.
---
 scripts/uboot-script-gen | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index 0ef89b680348..7e5cc080407e 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -181,9 +181,6 @@ function add_device_tree_static_mem()
     local cells=()
     local val
 
-    dt_set "$path" "#xen,static-mem-address-cells" "hex" "0x2"
-    dt_set "$path" "#xen,static-mem-size-cells" "hex" "0x2"
-
     for val in ${regions[@]}
     do
         cells+=("$(printf "0x%x 0x%x" $(($val >> 32)) $(($val & ((1 << 32) - 1))))")
-- 
2.25.1


