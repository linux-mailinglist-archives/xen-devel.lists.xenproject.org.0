Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKqtI2Oa5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E09E43405A
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287504.1567956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEw9g-0002go-Oe; Mon, 20 Apr 2026 21:27:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287504.1567956; Mon, 20 Apr 2026 21:27:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEw9g-0002cj-HF; Mon, 20 Apr 2026 21:27:44 +0000
Received: by outflank-mailman (input) for mailman id 1287504;
 Mon, 20 Apr 2026 21:27:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEw9e-00027J-0q
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:27:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEw9d-001N7n-Ca
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:27:41 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69a18-bab6-0a2a0a5309dd-0a2a4508a9bc-16
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:27:41 +0200
Received: from [52.101.53.100]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69a4c-63b5-0a2a45080019-346535645076-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:27:41 +0200
Received: from PH2PEPF0000384C.namprd17.prod.outlook.com (2603:10b6:518:1::70)
 by DM3PR08MB9645.namprd08.prod.outlook.com (2603:10b6:8:1ae::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:27:31 +0000
Received: from CY4PEPF0000EDD4.namprd03.prod.outlook.com
 (2a01:111:f403:f912::1) by PH2PEPF0000384C.outlook.office365.com
 (2603:1036:903:48::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:27:31 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 CY4PEPF0000EDD4.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:27:30 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzz8x6vRvz1wdP; 
 Mon, 20 Apr 2026 14:27:29 -0700 (PDT)
Received: from BL2PR08CU001.outbound.protection.outlook.com
 (mail-bl2pr08cu00102.outbound.protection.outlook.com [40.93.4.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:27:29 -0700 (PDT)
Received: from CH5PR05CA0007.namprd05.prod.outlook.com (2603:10b6:610:1f0::12)
 by CO1PR08MB7141.namprd08.prod.outlook.com (2603:10b6:303:d8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.31; Mon, 20 Apr
 2026 21:27:25 +0000
Received: from CH2PEPF00000099.namprd02.prod.outlook.com
 (2603:10b6:610:1f0:cafe::ed) by CH5PR05CA0007.outlook.office365.com
 (2603:10b6:610:1f0::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:27:24 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 CH2PEPF00000099.mail.protection.outlook.com (10.167.244.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:27:24 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:27:20 +0200
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=elektrobit.com header.i="@elektrobit.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=elektrobit.com header.i="@elektrobit.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Wio2p18vlcL8Xnrm2kRL1DueTwn+pQ+R8SIEmjhFTM5NLUojKPet+yKbs6E8J+wrwi2NYNUZNabfL4obbyyVO0wqTlAZCnO2u0Vy4HE164uyk9d6jGVHQ01LA+6XYKxnVD03/CI89JeVLhJlrZ+ns+p7uHMNBbL2wBvfaxpO0xlncwA4SDfAH31SQQkWMhVAYP+NVE4AUg/st696PZrGq1KQjhJDtSZJlwSqwB4hH96dp4vo12gUgWcaveabCDsoG/W2iBhfTRHNVQ68GNwqiclf1iwzNwqh8noHh/pix9hBsjE6bimqfh2miKFjwNlM6cgUtRTnZ+ZOnFxaBYhIlg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lnQuy/T8mDWKqAQXnoELf5ceU1mbzwKchncHWAqAvgo=;
 b=kLldVN9VxTyr/IJLeW1VcBymIlN1NsO7L27kqb0zz5mgzc5czBrZzzNOfI25pBLhoUpusI7s8yb+l47VY1aJmMI5mGKZupoW2+jV049DvZmhjpWVD3dw/l+FZvQjx09HHUgdZ17rr84fhzo4Bm8p+WNFiVG9VjzADO7Q6RNhVahdGl8QPpTN+MBxt8quuXr1hRbBCFd1w3KWjl8yzqk9EEs/T90+al+FDaz+rN0OB9T8qUGb5jTyshm+YhI+v9exWnpvBFXCIe6PNAFMNgomwYm9WckPqZhhlF530tKrOoYtFRlscu0DNQOWbZQQMyzTDfVeiHEk0H2LfiCUgOu2tA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.4.10) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lnQuy/T8mDWKqAQXnoELf5ceU1mbzwKchncHWAqAvgo=;
 b=VPgZz86spJ12/PyiXytxnhEruLmzl6EGIHNYxiPeJB8iV4uIGN1xuNW7AhJV/iEi9km5V6GYi807tkGnAdGCMz3mAGUxBTDmwXrSUyO/xY4HfrKOL+59ctx9CEylj/7K2ebCK9ur7bvRnbcSEdmSuyGrAMmgNvMFQVwya/hU0Yk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.4.10)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.4.10 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.4.10; helo=BL2PR08CU001.outbound.protection.outlook.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ov2c5HX+8PzpEA/yWtmazk8rWBcA84G0yhxffrBBVYjJIMV/eYE5nX72mp8PK7NsCGRfR6zBl3ijx73C0rQTCJsWNSDCz7/1MRcHCmvrEJ89aSHDdFyranuZJ7penJoWZqjimpxehY2bCIb5PrBnj/hRJi6EY1TF8m57BmcsFWyiSqahOHrdOmb6DlIfy9CSd+coN95CGtWRqr/N7LIxG4DdqhQO5N4lgTE98Jzvkyggx7dyWCV/WBUgvOZbxxhDHxMMlk2gF7S7QOKDToOoJ5ZmEWvPf7ugejM73MUE/LUde+zKRs2rqu7xZGZqOata+rxNXwE3g6xFL8Cx+Ifq/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lnQuy/T8mDWKqAQXnoELf5ceU1mbzwKchncHWAqAvgo=;
 b=CeR+QOVzdzV9RZTMrp9oFRy9ZyDZhmGoQLTe4OUkPXha7J+V7G94YBORkJTncu+XF2dJ0x2a24XZ//65WZ+sAGf5Ofb0kg5m8Nu+KzxD0EEYYpMJMQ5dbLukXOt+tGkNjMVRTvZ07QrtRF/NTCaxXi8y2Ax3BcVdDDbbBAM1H+oLbUroDnZ6CxS4bCEFU7sRCikjw4I+nwl6WT/+boa/mwyCcQZ7o2PyRCQeToVILE1QDinAGa//QyLVK13YilqcMhDripQr0vtaWY80mm2If28r7oWIfnl9zxin7kYvjJblwPO4islYPwR0O9oD9RPJiD1ySpK1l4+XRsQDdXvqfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lnQuy/T8mDWKqAQXnoELf5ceU1mbzwKchncHWAqAvgo=;
 b=VPgZz86spJ12/PyiXytxnhEruLmzl6EGIHNYxiPeJB8iV4uIGN1xuNW7AhJV/iEi9km5V6GYi807tkGnAdGCMz3mAGUxBTDmwXrSUyO/xY4HfrKOL+59ctx9CEylj/7K2ebCK9ur7bvRnbcSEdmSuyGrAMmgNvMFQVwya/hU0Yk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 213.95.148.172)
 smtp.mailfrom=elektrobit.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 213.95.148.172 as permitted sender)
 receiver=protection.outlook.com; client-ip=213.95.148.172;
 helo=denue6es012.ebgroup.elektrobit.com; pr=C
From: Rose Spangler <Rose.Spangler@elektrobit.com>
To: <xen-devel@lists.xenproject.org>
CC: Rose Spangler <Rose.Spangler@elektrobit.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Rahul Singh <rahul.singh@arm.com>
Subject: [RFC PATCH v6 15/43] arm/p2m: Allocate hostp2m with xzalloc
Date: Mon, 20 Apr 2026 17:26:20 -0400
Message-ID: <20260420212648.208640-8-Rose.Spangler@elektrobit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420212648.208640-1-Rose.Spangler@elektrobit.com>
References: <20260420212648.208640-1-Rose.Spangler@elektrobit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.10.178.50]
X-ClientProxiedBy: denue6es013.ebgroup.elektrobit.com (10.243.160.141) To
 denue6es012.ebgroup.elektrobit.com (10.243.160.140)
X-EOPAttributedMessage: 1
X-MS-Exchange-SkipListedInternetSender:
 ip=[213.95.148.172];domain=denue6es012.ebgroup.elektrobit.com
X-MS-TrafficTypeDiagnostic:
	CH2PEPF00000099:EE_|CO1PR08MB7141:EE_|CY4PEPF0000EDD4:EE_|DM3PR08MB9645:EE_
X-MS-Office365-Filtering-Correlation-Id: 37284b46-519a-49e6-f973-08de9f23a111
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|11006099003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?8X+dsZBRFueReStbzPU61xPKDHp6uHutM/eUb+Ax3uKJqhgpj4/D46XSgUMz?=
 =?us-ascii?Q?em+f5RNZ/ZFQZBNSddKDWFVINdCWu0cz5n4Jkra67Hkub5GZzpUfmotspnEk?=
 =?us-ascii?Q?IgWFTKhcqpEsLxGdsG8w8kmn2v3typClXIjetCBTlF6SCsbwYqTVzurkWRG1?=
 =?us-ascii?Q?xiKQyZfBNuTpPPlCaBqHVYoXEMq52SvNgseeYqICTBNV2gh7nYSBgrytBHWI?=
 =?us-ascii?Q?sFhfPI2anUcjEKy7qIRmu0tqb/IGyix+ybPjcxXQ1MnszaePT3uYncqdFevn?=
 =?us-ascii?Q?F0jJmlalANbaTlHeIyXd1NF5Tbzn2SPdO3quJEiNYOXk1sPOjgayzWcV3CNx?=
 =?us-ascii?Q?wsznYaEfXIoRdjx+itnKSKb4j0yAuH/VPLHq5icHUSpQM5C64cbJ30Q5Jatz?=
 =?us-ascii?Q?cCjURgaKWDGnBjsEo+92KPBPWAOg1lTpFOks67cmsa8zEEpsjaCchYTUmVbM?=
 =?us-ascii?Q?6X4JA1Q8kZaUgEEFaMbIoPt4vcKEs/bS29b6bPZUc9uROi7enKYPzr2RJhx2?=
 =?us-ascii?Q?1umyBMeP9yzHT0poPn0V/XSVX1Lz8yZPDLM8kYC683x5SsVn00E4Avu1Gz4T?=
 =?us-ascii?Q?SwbWtwE85QKKoR67gkf+NLYxNYxUTCvvbl0ZJKt9RjNUJKVTQb63WxLKv8JF?=
 =?us-ascii?Q?zzGYBlzfeoxAIyowiynOQBbDe8E/ovsuCEpanoQ2XCL8nGzgff/Pueenorf/?=
 =?us-ascii?Q?yLcP6u1gaM4B440o3PJVdLV+IjdHUpFPc4ifuyFftKWhpI9QGnHv+YaWXDGu?=
 =?us-ascii?Q?0BqC/ROPaMr/kNFqj71qfD9Gh7BOBwbOqNtU9b95LyJ+nZO18BkjsG1+UrZG?=
 =?us-ascii?Q?tGJeUb38RTyDFd5XAEDe7aanH2ls+JGzj3+5X9sLvuI9i0nhBL1/pOkcT6U0?=
 =?us-ascii?Q?jAp7MZ3aMQXOuAcrAwGXHBTj+Qy9uk/LApmajQCMXTIvx6+U9Y2tc1ijkIcz?=
 =?us-ascii?Q?0Jw5vMOYj3ApOmi3EcJdlQZ5AM6yquF0x0ChpXCp4RujLt4KaHDZX2OY1HMC?=
 =?us-ascii?Q?faWaZFaQxTJ9L6IO/k76wJJybiX2nCMyV/MMOIAJa8XKzZfCELVfHYXHKXYS?=
 =?us-ascii?Q?2E41Z0S53vunqB95FoTra70sDp6gUros7NL/uq7cllsByvL27McKmrv/30FI?=
 =?us-ascii?Q?TAvgo+oaQoxhvAdcDeeNIfrLUPDydpKtjTvUMIDs4GzkcGV1sVa9GhMOz2iz?=
 =?us-ascii?Q?u4WlXYVb/EC7ARbmyWaR6mXN/VSTUu+3evSCS364EG5r5meH8eNXgWnRug3Q?=
 =?us-ascii?Q?22ivHjIljQVj5yOF6QJRkZ4S1E9oIi0h0k4ADjlAALW7y+3lqPXhOKg3zkS1?=
 =?us-ascii?Q?UvPmaRAhnDw4hI5H72NFf/z/KHqCozMfxa9hOHTdF/g2aw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(11006099003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 bnSM+Y7Rv3VdhbC2BGOcVRkccpD1KqK8rn1PkAzgvy1cDakD8khfsaXKbXClswbIrw96BzQpBjuDpK/ScPkJU47eNOuf2MGKw/MTL+dMBCmxS+jZPTYU8pHLPvyoUV+em3Hgm+PppcwXdXcM9ySthCcN1g3rvd36lk70u6IdePQ24P5kN9/vQymLSO+meCY/5Vnat7aLbShsSrpllrqse4HvIerXp8LQU+d/6PSpYLuUdpfbQ9uRtjfVyV9EsfY2ltaxYIlp0romxJgViK6QC5oduJEU1SCqiKnJ4ZwNaiP2MuOtMBxPRdRn96jvuK7gLVtDaUih39D7BPgoUiv7+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR08MB7141
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.4.10];domain=BL2PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.4.10];domain=BL2PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 CY4PEPF0000EDD4.namprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8ca7b305-fe1b-4348-0e94-08de9f239d82
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|14060799003|35042699022|376014|82310400026|156008|1800799024|56012099003|22082099003|18002099003|11006099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/4H4J85onWGMJIHBxEBiv+X7Lhgux+C+mOrTufeLzJ5Wcjl0AIFXtcSKg5tx?=
 =?us-ascii?Q?1/NMnEK5hOWlyWyM0Ss3qDdWxG64VR1jfu3KeOE2O/DFX4pX7C+XaApubBGU?=
 =?us-ascii?Q?D9m4dUTz3EokSlsZBjLL+gpTCc3IJJZ0GP3qtaLATzohSWVbXz7LrclqX1MB?=
 =?us-ascii?Q?kW128kThSPYg/s/OBCeP8dtg+oypWfvCIu/7lZYICQ+x1ip9lgvTKvxNWoF6?=
 =?us-ascii?Q?okF5Qb6ARnrduTH6AP+hW3uuwn+j/jm04SIRl/TSgSl02dwQgDPkirwy0KNR?=
 =?us-ascii?Q?qswSoAz1FIdcR1Q4G6Y/InOjBi4H+uuf6Khe+O3KoO2+x142vUJlWX4qvBAx?=
 =?us-ascii?Q?eNorrgJmM51MWni3zelcP8g7xLeTZ92ZSlh5QDG47YCrtOAEoAG77So+jHAa?=
 =?us-ascii?Q?9ELilmMoyNpf0j3jdoB8oNGYqLO3YM56DXb7qKR7ZHpAr/Rr4dbT6b+aghe5?=
 =?us-ascii?Q?m1IAiEOlNHsmC0+d+FBhsrUG/GnLr93Qtpp49gYQdCa5AHDSvahsivY55G14?=
 =?us-ascii?Q?U5xgdQxk5CCAIILURjZhB4JPxe/BSFKwDq3xz9T2pq2kTgwaHljXZw/6/Xli?=
 =?us-ascii?Q?x9dKWeS/6Frg7y4FN+bEe9TCMtY4c8wP/xolNEmhsaGuVASsKhXIyMjfZkyZ?=
 =?us-ascii?Q?4jxAVpUDvrqOyme8dTwq20niT6qqRWbmVcGsRr8jhUDOgfJLW8+3qBo1z/G1?=
 =?us-ascii?Q?EmINZ5zsFbqMKANsTdqCk4ir33ERxx6dB6S39F/mhRB2JIZkPYe2ZjODK+1x?=
 =?us-ascii?Q?sW2S+jvoMa437uq22jDyDNzK1j7IRIp/O2yXWqZ30+pWJSQK2hKpFShhPxCu?=
 =?us-ascii?Q?D/kZFjqHpJMpQ5IXrjNoTSNgLdhptyBvSc1cMbvBoXVac6nalHJqOLj4JrsC?=
 =?us-ascii?Q?plMy+FEhA54ikFQDNZpp4yth8010ya9PdqgRzQT4QeoLonolAjZl+LAzd+ut?=
 =?us-ascii?Q?eFC1xwfWG6kZ7QeItS9giZEh1boxNrhlR5aRaBmwPGuYjd23lqAoKzWmo4oB?=
 =?us-ascii?Q?D2IXvcMI+JEIwoWolJgTFDwK3enXpu7kGHbv3uJSq/Cdt7VeOFr5IeTNC+1S?=
 =?us-ascii?Q?+D/uiid7ocxK9kxKzUrD3gYISLO1y23dJhtWL2IZM6HKH5xzS2fmWdxTiNuN?=
 =?us-ascii?Q?PAf9HQ1wwKHqU5b2v0p6ED+DoZ/Xkc42bnsf+Few9+lDGUVM5PGxKglJeLpE?=
 =?us-ascii?Q?awZTgXftLS+PbI/ejaDD299Shi62RpG9mjEbK/AW+FypBjsk14wKUgAvOySA?=
 =?us-ascii?Q?CVW5dks2rD/fYIRz2aWrYkQmZrVBkrCemZA4EC1iKsQ9wWgkg6WsWmA5ybHV?=
 =?us-ascii?Q?AX2XAnElgGPGom4v/I6w2ALRfDp8ZmdOAgQL2TgRZOZJdA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL2PR08CU001.outbound.protection.outlook.com;PTR:mail-bl2pr08cu00102.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(36860700016)(14060799003)(35042699022)(376014)(82310400026)(156008)(1800799024)(56012099003)(22082099003)(18002099003)(11006099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2Fvt8Kd+xOnJoawRPR2lCMhCkX9WijTA0PWu6jPK+pBe5IW5ACIqegeHq7SVYP1aWW9Yopc18rjK02fVKPcQw7R37YULtQbyY/MJ8Wy/rXDo4XJaesHaQBLDzU3O1THL8xSLn7t2ndjjkSXpVH+r4XQMYThAyf6ZWsSskq6KKX1c9ySvwzuZFfwdCZ8D+wd/vAqxi4oEMD5484q+wHhF6iTIjrHdRR5CaSqOlKpcZgNJOznnJM1KzUEioqSqE2IEbUx0abI4clUAHw4OkIsGc7olBdhlRI012nm5oeIDWl0aM3VOKpZvcrjWc6Q0e1VlrsA4TRd29zijj+ncQ4D9h+0c57Wd2PIO8vkMbg34MZ2u/zyEjymIfnA7uHaF78IKMxN9RLdO1+9gKyC3I+KwBW/VlpfapghVIOgXgDrQjKywHGF2IHGxaJ1Is67YjjAZ
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:27:30.5364
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37284b46-519a-49e6-f973-08de9f23a111
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000EDD4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR08MB9645
X-purgate-ID: tlsNG-c1860d/1776720461-C3F7ADB1-315A97EC/0/0
X-purgate-type: clean
X-purgate-size: 7264
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[elektrobit.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[elektrobit.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:rahul.singh@arm.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[17];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[elektrobit.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.275];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 0E09E43405A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit replaces the concrete p2m_domain member in arch_domain with a
pointer to p2m_domain, which is allocated with xzalloc during p2m
initialization.

In the following commits, the altp2m_init and altp2m_teardown routines from
x86 are be moved to common code. These routines (respectively) allocate and
free the p2m_domain structs for altp2m views.

While it would be possible to have special code paths for
allocating/freeing altp2m views while keeping the hostp2m as an concrete
member, this results in code duplication and increases complexity without
any clear benefit. Therefore, switching the hostp2m to be allocated
separately from arch_domain (similarly to x86) makes it possible to use the
same functions for both allocation/teardown/freeing of the hostp2m and
altp2m views.

This is commit 4/12 of the altp2m_init/altp2m_teardown routines phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/arch/arm/domain.c                    |  2 +-
 xen/arch/arm/include/asm/domain.h        |  2 +-
 xen/arch/arm/include/asm/p2m.h           |  2 +-
 xen/arch/arm/mm.c                        |  2 +-
 xen/arch/arm/mmu/p2m.c                   | 27 +++++++++++++++++++++---
 xen/arch/arm/traps.c                     |  2 +-
 xen/drivers/passthrough/arm/ipmmu-vmsa.c |  2 +-
 xen/drivers/passthrough/arm/smmu-v3.c    |  2 +-
 xen/drivers/passthrough/arm/smmu.c       |  2 +-
 9 files changed, 32 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 26380a807cad..be824a5ba18d 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -1099,7 +1099,7 @@ int domain_relinquish_resources(struct domain *d)
          * We are about to free the intermediate page-tables, so clear the
          * root to prevent any walk to use them.
          */
-        p2m_clear_root_pages(&d->arch.p2m);
+        p2m_clear_root_pages(d->arch.p2m);
 
     PROGRESS(p2m):
         ret = p2m_teardown(d);
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index ffe5d0d9f0a6..576dbdec20af 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -72,7 +72,7 @@ struct arch_domain
 #endif
 
     /* Virtual MMU */
-    struct p2m_domain p2m;
+    struct p2m_domain *p2m;
 
     struct hvm_domain hvm;
 
diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index 010ce8c9ebbd..23df91ea13e9 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -410,7 +410,7 @@ static inline int get_page_and_type(struct page_info *page,
 }
 
 /* get host p2m table */
-#define p2m_get_hostp2m(d) (&(d)->arch.p2m)
+#define p2m_get_hostp2m(d) ((d)->arch.p2m)
 
 static inline bool p2m_vm_event_sanity_check(struct domain *d)
 {
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 6df8b616e464..46f9363ea851 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -116,7 +116,7 @@ bool page_is_offlinable(mfn_t mfn)
 
 unsigned long domain_get_maximum_gpfn(struct domain *d)
 {
-    return gfn_x(d->arch.p2m.max_mapped_gfn);
+    return gfn_x(d->arch.p2m->max_mapped_gfn);
 }
 
 void share_xen_page_with_guest(struct page_info *page, struct domain *d,
diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 51abf3504fcf..3ecb969a0369 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -5,6 +5,7 @@
 #include <xen/lib.h>
 #include <xen/sched.h>
 #include <xen/softirq.h>
+#include <xen/xmalloc.h>
 
 #include <asm/alternative.h>
 #include <asm/event.h>
@@ -1475,7 +1476,7 @@ void p2m_final_teardown(struct domain *d)
 
     /* p2m not actually initialized */
     if ( !p2m->domain )
-        return;
+        goto free_p2m;
 
     /*
      * No need to call relinquish_p2m_mapping() here because
@@ -1499,11 +1500,13 @@ void p2m_final_teardown(struct domain *d)
     radix_tree_destroy(&p2m->mem_access_settings, NULL);
 
     p2m->domain = NULL;
+
+free_p2m:
+    xfree(p2m);
 }
 
-int p2m_init(struct domain *d)
+static int p2m_initialise(struct domain *d, struct p2m_domain *p2m)
 {
-    struct p2m_domain *p2m = p2m_get_hostp2m(d);
     int rc;
     unsigned int cpu;
 
@@ -1556,6 +1559,24 @@ int p2m_init(struct domain *d)
     return 0;
 }
 
+int p2m_init(struct domain *d)
+{
+    struct p2m_domain *p2m = xzalloc(struct p2m_domain);
+    int rc;
+
+    if ( !p2m )
+        return -ENOMEM;
+
+    rc = p2m_initialise(d, p2m);
+
+    if ( !rc )
+        d->arch.p2m = p2m;
+    else
+        xfree(p2m);
+
+    return rc;
+}
+
 /*
  * The function will go through the p2m and remove page reference when it
  * is required. The mapping will be removed from the p2m.
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 0c01f37ad6b4..637d27659b20 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -984,7 +984,7 @@ void vcpu_show_registers(struct vcpu *v)
 #endif
 
 #ifdef CONFIG_MMU
-    ctxt.vttbr_el2 = v->domain->arch.p2m.vttbr;
+    ctxt.vttbr_el2 = v->domain->arch.p2m->vttbr;
 #endif
 
     _show_registers(&v->arch.cpu_info->guest_cpu_user_regs, &ctxt, 1, v);
diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
index fa9ab9cb1330..d246c5e59005 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -565,7 +565,7 @@ static int ipmmu_domain_init_context(struct ipmmu_vmsa_domain *domain)
      * Use P2M table for this Xen domain.
      */
     ASSERT(domain->d != NULL);
-    ttbr = page_to_maddr(domain->d->arch.p2m.root);
+    ttbr = page_to_maddr(domain->d->arch.p2m->root);
 
     dev_info(domain->mmu->root->dev, "%pd: Set IPMMU context %u (pgd 0x%"PRIx64")\n",
              domain->d, domain->context_id, ttbr);
diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index bf153227dbd9..a7fbe58cba77 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -1205,7 +1205,7 @@ static int arm_smmu_domain_finalise_s2(struct arm_smmu_domain *smmu_domain,
 	vtcr->tsz = 64 - p2m_ipa_bits;
 	vtcr->sl = 2 - P2M_ROOT_LEVEL;
 
-	arm_lpae_s2_cfg.vttbr  = page_to_maddr(smmu_domain->d->arch.p2m.root);
+	arm_lpae_s2_cfg.vttbr  = page_to_maddr(smmu_domain->d->arch.p2m->root);
 
 	vmid = arm_smmu_bitmap_alloc(smmu->vmid_map, smmu->vmid_bits);
 	if (vmid < 0)
diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index d63c9015510e..0975be2562bb 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -1247,7 +1247,7 @@ static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain)
 	/* TTBR0 */
 	/* Xen: The page table is shared with the P2M code */
 	ASSERT(smmu_domain->cfg.domain != NULL);
-	p2maddr = page_to_maddr(smmu_domain->cfg.domain->arch.p2m.root);
+	p2maddr = page_to_maddr(smmu_domain->cfg.domain->arch.p2m->root);
 
 	dev_notice(smmu->dev, "d%u: p2maddr 0x%"PRIpaddr"\n",
 		   smmu_domain->cfg.domain->domain_id, p2maddr);
-- 
2.34.1


