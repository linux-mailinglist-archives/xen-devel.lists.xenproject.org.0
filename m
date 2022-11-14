Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F436275F3
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 07:33:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443084.697493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouT28-00008t-9w; Mon, 14 Nov 2022 06:33:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443084.697493; Mon, 14 Nov 2022 06:33:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouT28-00005m-70; Mon, 14 Nov 2022 06:33:28 +0000
Received: by outflank-mailman (input) for mailman id 443084;
 Mon, 14 Nov 2022 06:33:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CFvb=3O=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ouT26-00005g-EB
 for xen-devel@lists.xenproject.org; Mon, 14 Nov 2022 06:33:26 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60086.outbound.protection.outlook.com [40.107.6.86])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3cd8c34d-63e6-11ed-91b6-6bf2151ebd3b;
 Mon, 14 Nov 2022 07:33:23 +0100 (CET)
Received: from AM5PR0502CA0020.eurprd05.prod.outlook.com
 (2603:10a6:203:91::30) by AS8PR08MB6088.eurprd08.prod.outlook.com
 (2603:10a6:20b:291::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.6; Mon, 14 Nov
 2022 06:33:16 +0000
Received: from AM7EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:91:cafe::c4) by AM5PR0502CA0020.outlook.office365.com
 (2603:10a6:203:91::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.14 via Frontend
 Transport; Mon, 14 Nov 2022 06:33:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT032.mail.protection.outlook.com (100.127.140.65) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Mon, 14 Nov 2022 06:33:16 +0000
Received: ("Tessian outbound 58faf9791229:v130");
 Mon, 14 Nov 2022 06:33:15 +0000
Received: from ecc797ed8142.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CF3ECC59-CE3E-49FF-B1B0-AB8270467EA8.1; 
 Mon, 14 Nov 2022 06:33:09 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ecc797ed8142.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Nov 2022 06:33:09 +0000
Received: from FR3P281CA0184.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a4::19)
 by DU2PR08MB10278.eurprd08.prod.outlook.com (2603:10a6:10:46e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.6; Mon, 14 Nov
 2022 06:33:06 +0000
Received: from VI1EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a4:cafe::f0) by FR3P281CA0184.outlook.office365.com
 (2603:10a6:d10:a4::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17 via Frontend
 Transport; Mon, 14 Nov 2022 06:33:06 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VI1EUR03FT010.mail.protection.outlook.com (100.127.144.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5813.12 via Frontend Transport; Mon, 14 Nov 2022 06:33:05 +0000
Received: from AZ-NEU-EX02.Emea.Arm.com (10.251.26.5) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Mon, 14 Nov
 2022 06:33:04 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX02.Emea.Arm.com
 (10.251.26.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Mon, 14 Nov
 2022 06:33:03 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Mon, 14 Nov 2022 06:33:00 +0000
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
X-Inumbo-ID: 3cd8c34d-63e6-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fa9ydqmGlydP2i1jNGbPKWp98VrSwiEtVEF4O0khvv8=;
 b=Ev+8xR3sAoIJOL2bBT/MsU/bHvq6J9TkR9BQ+ikRbIohjEv/ruA9Lio8JIGEmDE6OHyU1Frf2BF33/sa0I6C36NoKlx+Z5+wou3Sm04Z/NCd4yZxLJ8wRRtF7JnBGVwyF+4bpe+cWKZnfFBwS+PRXkio0uAIp72PjjBNmB9KKTY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a4aedd2f7361b588
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zj+MJ7QLGdLiAEnyT0/oa70HrJRVpNuNjVV5stN+tftYIkt2YAkC7jhCEvM7+tDKcknad4WS4a6xz21c4CKhrakxmcfBxQ05HiUYO3zaeZgcuB5Y50Tu5hfGUAE9URVyt4r0MNCgrbHIyYGP63MQ45cPvIjMcJKzoyPcRa+DaBPoMEl7uV3d2R+FdXWxH68QD3KufrLx95blQYQ0fW8O+8m+co1rowW2aXXu0XaeLMNLusKIQhLfmSf31q/0tfUn0H+YOq0aA6C1bOWN+dhIeuDhzgoyJUVaIKTwsUEml7xEwWQiB30/8jH2o0tGbHuAg1+8SSNE/RQ6piOOhkM37Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fa9ydqmGlydP2i1jNGbPKWp98VrSwiEtVEF4O0khvv8=;
 b=YqndY98VCCRkF9UTJLWfvIHEdNuNMHrRFh8V8DG3IQCVwp+WK5GamlAUfFXr/O3F4NYPlNsyMqjczCVkpKul9Ts1hYlBcSu7ZlV9iUfMXKEh5jha/Hd5MMXc6K4hHUbZZj52ZfKLajkemiRA9HlRMmLVr8NZbTPcj/Rr7PXJIeWtDThMSQB4LlCTMDu0UXhuFZCBr6Y0QtzRc9ekI9xfgdju+Z1QEaMhvCCVuWxHRcfiugD+NSmGOLYMAcVC6fMoX9bhT7ud38uWZnL4izTvg0oFAnNa49/Z+j9MhnRIt5rxLdkbrNJJquN6YaG8FdoNxL4L0jIErIb27odnztfDEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fa9ydqmGlydP2i1jNGbPKWp98VrSwiEtVEF4O0khvv8=;
 b=Ev+8xR3sAoIJOL2bBT/MsU/bHvq6J9TkR9BQ+ikRbIohjEv/ruA9Lio8JIGEmDE6OHyU1Frf2BF33/sa0I6C36NoKlx+Z5+wou3Sm04Z/NCd4yZxLJ8wRRtF7JnBGVwyF+4bpe+cWKZnfFBwS+PRXkio0uAIp72PjjBNmB9KKTY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <wei.chen@arm.com>, <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: [PATCH v8 0/6] Device tree based NUMA support for Arm - Part#2
Date: Mon, 14 Nov 2022 14:32:51 +0800
Message-ID: <20221114063257.473585-1-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	VI1EUR03FT010:EE_|DU2PR08MB10278:EE_|AM7EUR03FT032:EE_|AS8PR08MB6088:EE_
X-MS-Office365-Filtering-Correlation-Id: 933a4e7e-25b6-471e-cc14-08dac60a1cd1
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 wuT6hRCyynWPn6MhufH2pGPg2H9RyAaDiX89Z9EZsukXwquvhcreriutWgfydGFrWKejHRR6TWzTNhOiG/IJ11Fi0rfJn9YQqFpsn9iYnI06oFiGosWD+GYAPxOlH6tkHHQBnci8rL5X03cvKBPtmoFgylf9uwBjk6igZfFt0SQYx9NlMHs4pNkVXw5fhIxzDEISwlAkQ+1pNR8t1fHQclBfty2MtouMpgRCC/DFh5xGaHWRMqZ0tc0PuVSRl1IU46Uavn6w/H/V6F6k6NUGxpjBkmEjA+tK/L0Jvr1bD4aP05jw6p+l+ZIz8fpbIQvavUwl8EWxGqsGX4/5SPx3s6LkI0wgdh9K40/H50TO8hvVW5A6hr3YBjfzHZ+oHlANKqFdrkTjazDNrtXiHk71F9PiOw1xwjter213XAYzvwKaYhzFwGcE6nxPcNq0en7agZavO9233yV8Mm5Rw/z0hFW0+lgyHJGPhfElQyu20ht+P6yyEjM4xKsV64c6qtQ7JCaFLKFKoz9n9uwMFCiWkePnIefY/plfRvEDCFUvEkeZQsn5+KhNGexDd9mGvY0qJTFamlV8J4ZcTQOUbgZa7AB8+2sFy4qvp0jjW+dtgXL9ULSx1fNCqIwSs5a0C9DZEoLk2RLRAC/y6z7RsG9zAqxlZPhegnW1BXym58vCd3Tlip/wTHQ47WfSBdokHOaz2XzMPQAadlC6MBQ+fOv5fuEnymVLIaaO0iaYu4+CwMRP5AG7f/Mjcr090JxWGm1DTvAyNqbba9s4pYCBiJCQ0+ue1FsYTyzjoTp8h0MuqWEjLvOrI4LrZ56yG8XdVb0vPVZo/gmKd13CaCQWTzMeLU1NlGKSCm5cc6k4/sLPCmV/t9FpGuekKc2Yhf6dubH0
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199015)(46966006)(36840700001)(40470700004)(356005)(26005)(7696005)(6666004)(83380400001)(36860700001)(966005)(8676002)(4326008)(110136005)(478600001)(82740400003)(54906003)(316002)(70206006)(70586007)(41300700001)(5660300002)(81166007)(40460700003)(44832011)(8936002)(2906002)(86362001)(82310400005)(47076005)(426003)(336012)(2616005)(1076003)(186003)(40480700001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10278
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	735e4fa5-d3fe-4c05-8be2-08dac60a167d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HQIK7vZq/fJWvZQeIJLwZzVZ+m/Mcs2Abho5um+ZQn07lqTjJIkG8qtAKV7N8sL+JOOZhOTkzgmVtHW5o7rwwG2aYJ0GeulM0SPbgy/EjmyRpkTGXjbCZ8B3BAbGBRpDYO/pmvi+vnBzQ4D5oWgwH+CNisEQUYKynKdA9BvCv4/POmzAopTGTr4NFW9TK+p1wv0UQNDleUYRn4wxECyGqKdB7y4wwT9UhHB55Oa8YId7iCIY1avnoqkuMGHpenKRYOKPnrHu56GHbrOSgN1GJLLG9TZosufblc4zOOiowbH3pi89F/AL1F6/VjTAkXPrT/P4hFaRll3YXLwk+kOawXuYqjqmbvHo27ju9R8VrQDpVLzJr4yRPKI5OAJjCnrAuhuW0+ZnmTxNsMbcUIaO7MCJ+MgHrV2aBJIELqLfWakhmr46+wn0dSkMiMCxZfwxF9AhMgR/njhsbDy06rrvB0eBChgdCBu3QzXOot121ORqemBwZQhD3alShjPwV9otO5JNCEPdh9h3hhFjF/zywtbW+w+WOM/ZLjTBzK9Tmat3cWDS3CzV1VnfOs9BFS+L4jQ/uk5p51194tHK4YvlRiFIxNInrKrMYCk4MjbtYERjIoou8PyrG08Z96M0RUDwDSmpBvNxX2C/GEnlfdadcbtFYNDihB7dd8+DfrqySsCfpxisIsKmUFj97OlGdNfCg8Qr8ufS733zVBpBVIYFtClVrXhqcMDhyxVbwC7WTCxVUYtTisT3hQhh20vjXMQft9tybYGDKULZYqgPAzyL8VrfX+N8hMOtTMIbvOEJH33khhnl7RKz6GaHX0YD96QiKNReTFjuD5t7PfdJHhN1fjl6gXLSQJFh1j9GjbTMSKTUUH0MqgmcQQPtwVHojslay0Fwgs4KHbeSegAMFxoMNg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(136003)(376002)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(7696005)(6666004)(86362001)(107886003)(2906002)(966005)(478600001)(26005)(5660300002)(82310400005)(44832011)(41300700001)(40480700001)(70206006)(36860700001)(4326008)(2616005)(336012)(70586007)(8676002)(47076005)(426003)(1076003)(186003)(40460700003)(81166007)(110136005)(83380400001)(82740400003)(8936002)(54906003)(316002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 06:33:16.1049
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 933a4e7e-25b6-471e-cc14-08dac60a1cd1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6088

(The Arm device tree based NUMA support patch set contains 35
patches. In order to make stuff easier for reviewers, I split
them into 3 parts:
1. Preparation. I have re-sorted the patch series. And moved
   independent patches to the head of the series - merged in [1]
2. Move generically usable code from x86 to common - this series.
3. Add new code to support Arm.

This series only contains the second part patches. As the whole NUMA
series has been reviewed for 1 round in [2], so this series would
be v8)

Xen memory allocation and scheduler modules are NUMA aware.
But actually, on x86 has implemented the architecture APIs
to support NUMA. Arm was providing a set of fake architecture
APIs to make it compatible with NUMA awared memory allocation
and scheduler.

Arm system was working well as a single node NUMA system with
these fake APIs, because we didn't have multiple nodes NUMA
system on Arm. But in recent years, more and more Arm devices
support multiple nodes NUMA system.

So now we have a new problem. When Xen is running on these Arm
devices, Xen still treat them as single node SMP systems. The
NUMA affinity capability of Xen memory allocation and scheduler
becomes meaningless. Because they rely on input data that does
not reflect real NUMA layout.

Xen still think the access time for all of the memory is the
same for all CPUs. However, Xen may allocate memory to a VM
from different NUMA nodes with different access speeds. This
difference can be amplified in workloads inside VM, causing
performance instability and timeouts.

So in this patch series, we implement a set of NUMA API to use
device tree to describe the NUMA layout. We reuse most of the
code of x86 NUMA to create and maintain the mapping between
memory and CPU, create the matrix between any two NUMA nodes.
Except ACPI and some x86 specified code, we have moved other
code to common. In next stage, when we implement ACPI based
NUMA for Arm64, we may move the ACPI NUMA code to common too,
but in current stage, we keep it as x86 only.

This patch serires has been tested and booted well on one
Arm64 NUMA machine and one HPE x86 NUMA machine.

[1] https://lists.xenproject.org/archives/html/xen-devel/2022-06/msg00499.html
[2] https://lists.xenproject.org/archives/html/xen-devel/2021-09/msg01903.html

---
v7 -> v8:
 1. Rebase code to resolve merge conflict.
 2. Change "of shift too small" to "or shift too small".
 3. Add numa_fw_nid_name setting in srat_parse_regions after
    acpi_table_parse succeeded.
v6 -> v7:
 1. Restore %d for nodeid_t in dump_numa.
 2. Use sizeof(page_num_node) for page_num_node size in memset.
 3. Add description for using min(PADDR_BITS, BITS_PER_LONG - 1)
    to calculate the shift when only one node is in the system.
 4. Use %pd for domain print in dump_numa.
 5. Add __init for arch_numa_unavailable.
 6. Use __ro_after_init for mem_hotplug.
 7. Use "???" instead of "NONAME" for unset numa_fw_nid_name.
 8. Fix code-style.
v5 -> v6:
 1. Revert arch_numa_broken to arch_numa_disabled, as acpi_numa
    can be set to -1 by users. So acpi_numa < 0 does not mean
    a broken firmware.
 2. Replace numa_scan_node to numa_process_nodes in commit log.
 3. Limit the scope of page_num_node, vnuma and page of numa_setup
    function.
 4. Use memset to init page_num_node instead of for_each_online_node.
 5. Use %u instead of %d for nodeid_t and j in numa_setup print
    messages.
 6. Use min(PADDR_BITS, BITS_PER_LONG - 1) to calculate the shift
    when only one node is in the system.
 7. Drop the marco: node_to_first_cpu(node)
 8. Use arch_numa_unavailable to replace arch_numa_disabled for
    acpi_numa <= 0.
 9. Remove Kconfig for HAS_NUMA_NODE_FWID.
10. Use numa_fw_nid_name for NUMA implementation to set their fw
    NUMA node name for print messages.

v4 -> v5:
 1. Use arch_numa_broken instead of arch_numa_disabled for
    acpi_numa < 0 check. Because arch_numa_disabled might
    include acpi_numa < 0 (init failed) and acpi_numa == 0
    (no data or data no init) cases.
 2. Use nodeid_t instead of uint8_t for memnodemap.
 3. Restore to use typeof(*memnodemap) for _memnodemap, this will avoid the
    further adjustments for _memnodemap's type.
 4. Use __ro_after_init for numa_off.
 5. Use pointer-to-const for proper function parameters.
 6. Use unsigned int for variables that are not realy used for node ID.
 7. Fix code comments code-style and adjust the length.
 8. Fix code-styles.
 9. Rename numa_scan_nodes to numa_process_nodes.
10. Defer introduce arch_numa_disabled for acpi_numa <= 0. And remove
    the paramter init_as_disable of arch_numa_disabled.
11. Fix typo "expandsion".
12. Fix Indentation for l1tf_safe_maddr.
13. Remove double blank lines.
14. Add a space between for_each_node_mask and '('.
    Add a space page_list_for_each and '('.
15. Use bool for nodes_cover_memory return value.
16. Use a plain "int ret" to record compute_hash_shift return value.
17. Add a blank line before the function's main "return".
18. Add new Kconfig option HAS_NUMA_NODE_FWID to common/Kconfig.

v3 -> v4:
 1. Add init_as_disable as arch_numa_disabled parameter in the patche
    where use it.
 2. Drop unnecessary "else" from arch_numa_setup, and fix its
   indentation.
 3. Restore compute_hash_shift's return value to int.
 4. Remove unnecessary parentheses for macros.
 5. Use unsigned int for proper variables.
 6. Fix some code-style.
 7. Move arch_get_ram_range function comment to header file.
 8. Use bool for found, and add a new "err" for the return
    value of arch_get_ram_range.
 9. Use -ENODATA instead of -EINVAL for non-RAM type ranges.
10. Use bool as return value for functions that only return
    0/1 or 0/-EINVAL.
11. Move mem_hotplug to a proper place in mm.h
12. Remove useless "size" in numa_scan_nodes.
13. Add CONFIG_HAS_NUMA_NODE_FWID to gate print the mapping
    between node id and architectural node id (fw node id).

v2 -> v3:
 1. Drop enumeration of numa status.
 2. Use helpers to get/update acpi_numa.
 3. Insert spaces among parameters of strncmp in numa_setup.
 4. Drop helpers to access mem_hotplug. Export mem_hotplug for all arch.
 5. Remove acpi.h from common/numa.c.
 6. Rename acpi_scan_nodes to numa_scan_nodes.
 7. Replace u8 by uint8_t for memnodemap.
 8. Use unsigned int for memnode_shift and adjust related functions
    (compute_hash_shift, populate_memnodemap) to use correct types for
    return values or parameters.
 9. Use nodeid_t for nodeid and node numbers.
10. Use __read_mostly and __ro_after_init for appropriate variables.
11. Adjust the __read_mostly and __initdata location for some variables.
12. Convert from plain int to unsigned for cpuid and other proper 
13. Remove unnecessary change items in history.
14. Rename arch_get_memory_map to arch_get_ram_range.
15. Use -ENOENT instead of -ENODEV to indicate end of memory map.
16. Add description to code comment that arch_get_ram_range returns
    RAM range in [start, end) format.
17. Rename bad_srat to numa_fw_bad.
18. Rename node_to_pxm to numa_node_to_arch_nid.
19. Merge patch#7 and #8 into patch#6.
20. Move NR_NODE_MEMBLKS from x86/acpi.h to common/numa.h
22. Use 2-64 for node range.

v1 -> v2:
 1. Refine the commit messages of several patches.
 2. Merge v1 patch#9,10 into one patch. Introduce the new functions
    in the same patch that this patch will be used first time.
 3. Fold if ( end > mem_hotplug ) to mem_hotplug_update_boundary,
    in this case, we can drop mem_hotplug_boundary.
 4. Remove fw_numa, use enumeration to replace numa_off and acpi_numa.
 5. Correct return value of srat_disabled.
 6. Introduce numa_enabled_with_firmware.
 7. Refine the justification of using !node_data[nid].node_spanned_pages.
 8. Use ASSERT to replace VIRTUAL_BUG_ON in phys_to_nid.
 9. Adjust the conditional express for ASSERT.
10. Move MAX_NUMNODES from xen/numa.h to asm/numa.h for x86.
11. Use conditional macro to gate MAX_NUMNODES for other architectures.
12. Use arch_get_memory_map to replace arch_get_memory_bank_range
    and arch_get_memory_bank_number.
13. Remove the !start || !end check, because caller guarantee
    these two pointers will not be NULL.
14. Add code comment for numa_update_node_memblks to explain:
    Assumes all memory regions belonging to a single node
    are in one chunk. Holes between them will be included
    in the node.
15. Merge this single patch instead of serval patches to move
    x86 SRAT code to common.
16. Export node_to_pxm to keep pxm information in NUMA scan
    nodes error messages.
17. Change the code style to target file's Xen code-style.
18. Adjust some __init and __initdata for some functions and
    variables.
19. Replace CONFIG_ACPI_NUMA by CONFIG_NUMA. Replace "SRAT" texts.
20. Turn numa_scan_nodes to static.
21. Change NR_NUMA_NODES upper bound from 4095 to 255.

Wei Chen (6):
  xen/x86: Provide helpers for common code to access acpi_numa
  xen/x86: move generically usable NUMA code from x86 to common
  xen/x86: Use ASSERT instead of VIRTUAL_BUG_ON for phys_to_nid
  xen/x86: use arch_get_ram_range to get information from E820 map
  xen/x86: move NUMA process nodes nodes code from x86 to common
  xen: introduce a Kconfig option to configure NUMA nodes number

 xen/arch/Kconfig                 |  11 +
 xen/arch/x86/include/asm/acpi.h  |   2 -
 xen/arch/x86/include/asm/mm.h    |   2 -
 xen/arch/x86/include/asm/numa.h  |  61 +--
 xen/arch/x86/include/asm/setup.h |   1 -
 xen/arch/x86/mm.c                |   2 -
 xen/arch/x86/numa.c              | 441 +----------------
 xen/arch/x86/smpboot.c           |   2 +-
 xen/arch/x86/srat.c              | 336 ++-----------
 xen/common/Makefile              |   1 +
 xen/common/numa.c                | 803 +++++++++++++++++++++++++++++++
 xen/common/page_alloc.c          |   2 +
 xen/include/xen/mm.h             |   2 +
 xen/include/xen/numa.h           |  96 +++-
 14 files changed, 961 insertions(+), 801 deletions(-)
 create mode 100644 xen/common/numa.c

-- 
2.25.1


