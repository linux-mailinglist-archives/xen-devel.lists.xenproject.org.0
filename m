Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8957E530988
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 08:26:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335352.559528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt1WB-0008TK-W1; Mon, 23 May 2022 06:26:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335352.559528; Mon, 23 May 2022 06:26:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt1WB-0008QY-SV; Mon, 23 May 2022 06:26:15 +0000
Received: by outflank-mailman (input) for mailman id 335352;
 Mon, 23 May 2022 06:26:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eb4B=V7=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nt1W9-0007pn-Rf
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 06:26:14 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03on060d.outbound.protection.outlook.com
 [2a01:111:f400:fe08::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3deefd84-da61-11ec-837e-e5687231ffcc;
 Mon, 23 May 2022 08:26:12 +0200 (CEST)
Received: from DB6PR0501CA0014.eurprd05.prod.outlook.com (2603:10a6:4:8f::24)
 by AM9PR08MB6802.eurprd08.prod.outlook.com (2603:10a6:20b:308::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15; Mon, 23 May
 2022 06:26:11 +0000
Received: from DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:8f:cafe::6d) by DB6PR0501CA0014.outlook.office365.com
 (2603:10a6:4:8f::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.22 via Frontend
 Transport; Mon, 23 May 2022 06:26:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT037.mail.protection.outlook.com (100.127.142.208) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14 via Frontend Transport; Mon, 23 May 2022 06:26:10 +0000
Received: ("Tessian outbound 3314dea8c23c:v119");
 Mon, 23 May 2022 06:26:10 +0000
Received: from 789b36f4b8f4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 037BA0AD-56EC-4408-BEA3-BCB4ECA73B7A.1; 
 Mon, 23 May 2022 06:26:04 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 789b36f4b8f4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 23 May 2022 06:26:04 +0000
Received: from DU2PR04CA0262.eurprd04.prod.outlook.com (2603:10a6:10:28e::27)
 by DBAPR08MB5590.eurprd08.prod.outlook.com (2603:10a6:10:1aa::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Mon, 23 May
 2022 06:25:59 +0000
Received: from DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28e:cafe::9) by DU2PR04CA0262.outlook.office365.com
 (2603:10a6:10:28e::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.22 via Frontend
 Transport; Mon, 23 May 2022 06:25:59 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT019.mail.protection.outlook.com (100.127.142.129) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Mon, 23 May 2022 06:25:58 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Mon, 23 May
 2022 06:25:57 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Mon, 23 May 2022 06:25:54 +0000
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
X-Inumbo-ID: 3deefd84-da61-11ec-837e-e5687231ffcc
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=VkdGOfwZCpAxM9Jzo5tGmJ5BViErXu0puJe9N2mjh4G0nxpAUnRc9BcQeoqbhoHE/hlNWHXtABLhepIxmFN/RYBMZlD6OuHtQ8jy9Cxa5ySbPM9kp/gSvYh6R872VzMRQMn1VnpuM6Jx6zz47NsPCQfabXmTT/Cx7UpPidbmhv9yPD9F67sBZekyqS+qPCTcfWonxa1iY8ycdT9tNjw4QuZuHCcT7coa/tEudh1eeFoKn8BsQ3zzi8Sa4o9nZ6gMnz9YnC0uICxoUYZmDVHFYxm66KOm3i+oO71IHrp7i1QSKtZYjaJg8HwU3LmdbJD5GIi23ecjBZEPECHbsiBvTw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+h4lby9uhtIt+w9bPcDu7mqnxP5TtPdNw4xy2M6UuS8=;
 b=c9wVCdFX+x/8ZbqpgR2iJhL6Sz+AiYwlybcQNVLi6KnNt+L/dwuqSvV9hNuhqEsJgnAtwAa/xtPLo6Uh0mCBQk+Y362QC+o5GpVm8wZ905ldcB9eWBDs6YdQnxe3TAxrbmFNx4VLh1XEMY68JFNqvalK52dimqx/7mCscQwfntJi9WuJlym4vdTLZc+7vqiIuzsbfC3woOtFM38HW+MATKoieIJD6e7uNYlD60j3vnJ0JrHfYTfoyu3UrYLvxTV5W8ENgzJbGAlGcWx/sWEmFOJokpkGc7TYKpc/u29NnH+9H8AEY8JC+DgzfD65zu76x+vlLQH9pFViXUodI8Z95A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+h4lby9uhtIt+w9bPcDu7mqnxP5TtPdNw4xy2M6UuS8=;
 b=XdW+R8RNyJMX5YmOufsq/CthT6YyujFW95cvy2ueGGrkpDblMBEF5/1BR7M/z4jDCmE7X/EdalaouqIGeV1lLx4bpF//zvck9NVbGfp6oHYXTAslN+ejJK9cYqK+MOBeadaNMOI/gUHYx9uwUHMoR1+Rm3rlXebWYbVGaOek4bk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 04c0b99e10f7ac77
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hwWWL+gfuMnP8wkhlWCzKDJuxK82tndhDUkbQAxXWyXNR3BuxTphMA/OtvKbIr8qXCN0vO96i6pd7WGhdmyRfN5nMVwBOK/GeFwFwSMgRyoVKCvIygRCKFdY2xHjO1yVBYonfGYxu/gSo/gjsP/S5KORRk6KJQ6SkBVgoJijDcfVBehmihvqOMcV9hs3wzGUDPncGJQF62KaTcR0LMT/kbmGOkuLClfiErdHU0Ef0xUn6Z5CHFddULILlMBHeIBJeaTpJYhefK+KWM2E1CrK8kl8J8eIHgpT1gyd1M+25p/11QIDoXalZ2OIPHFJu3issC4lBfq9GtjiqMEU53EX6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+h4lby9uhtIt+w9bPcDu7mqnxP5TtPdNw4xy2M6UuS8=;
 b=T6ULq8KwbsvABEefPWX1df52oUJpOa7i8Z9tQ43P3acddPp5nNo2x9Mon9U4wHlQROFOHPO5/mc941yZ3rpHYSV8vSbGlGGh2+bLht0CY2K9xihXhOew1e/GZ7vq1jrNZDbtoz5cgRE4K6QkaQDB1dWbShYqHpdwuYnpURp8mOyaiQHYk8/zGBtEiHuryDp7/3A8isbGBf/b3Cj9xciX38Xp9n8GkqYf8er/6bZudrSKG1Y73jbba4QGwgQqV+y6ZHSXN5EMd2mOIV4v4zwzzZSczzP/NePsQKR9NKliK8QWzpVEPhY1ILklOZUlXIHBhsA+BVzqB7LUULglQJpydw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+h4lby9uhtIt+w9bPcDu7mqnxP5TtPdNw4xy2M6UuS8=;
 b=XdW+R8RNyJMX5YmOufsq/CthT6YyujFW95cvy2ueGGrkpDblMBEF5/1BR7M/z4jDCmE7X/EdalaouqIGeV1lLx4bpF//zvck9NVbGfp6oHYXTAslN+ejJK9cYqK+MOBeadaNMOI/gUHYx9uwUHMoR1+Rm3rlXebWYbVGaOek4bk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jiamei Xie <jiamei.xie@arm.com>
Subject: [PATCH v4 3/8] xen: introduce an arch helper for default dma zone status
Date: Mon, 23 May 2022 14:25:20 +0800
Message-ID: <20220523062525.2504290-4-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220523062525.2504290-1-wei.chen@arm.com>
References: <20220523062525.2504290-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: a81e30a7-b06e-49ce-bca8-08da3c8520fa
X-MS-TrafficTypeDiagnostic:
	DBAPR08MB5590:EE_|DBAEUR03FT037:EE_|AM9PR08MB6802:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB6802F0CCE84E25AD9FA18CC59ED49@AM9PR08MB6802.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ivJGpZea3Qu0DD8urVw0nJNA7nL5PLjtKmYfDwqWnLw1mXouGP3j50P6sSm5a62F9p3NaiB2hReaQfD6+CxPxOnqjK/WHEfUfNoec7MJ9kuSfJ0UFBIlIkvhxdH5Ob2BxFKEltYIek0Oyhde81YbbFWWrpmdu+8iXRAN1o+tG1dlUMBLh7vPP2VrSpPC5qh+qvJxxn6VofABR/Y+cYCk4M/IAMIP2bkAekikk1FGANnPjytAJMY1gAGt4QvAtRjWWbrtAQv5AX9Z7KMAUT1BPfCv+Snbt13SW3nhzTT/ZmAcqNMWegNCWZG3raZ8SlWOPr29JU9abioH+ucVWNlnp1CV3hQ0PDMXpdGNH58Km8XgLf92FwpPZZLX0cwstvCvVmF7UyFZPXY3ZFxMP/MsAc7vpj/pY9RjulxmCMskC8HDlYdattQ9y0A+ktICOCG4nzST/MuloWFyjlfclCBwxanhYMkjmdbKhCpuzrlEsFUF7b5q/Gd9BC2MmOgHYeUbCVoR5QkBzuczDupchFMMEvyzroH1Tid6ZX+l6UrxobmoMuvqHZ1w0atr6Ie6uvaCUadAauaAZH11kRnHGpJJ/Z6EOAgERy/8Ipc8E+2OVst/AasYUG3c8JXmn7bfABswcqlIQ4wj43aAtruNAD4KjVxuAxn4pwfW85bza4xbZfD553nnK6Szm8O1U5YY7JSg
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(26005)(54906003)(2616005)(6916009)(316002)(336012)(426003)(47076005)(1076003)(6666004)(186003)(7696005)(36756003)(83380400001)(82310400005)(508600001)(8936002)(70586007)(2906002)(4326008)(8676002)(86362001)(70206006)(81166007)(44832011)(5660300002)(36860700001)(356005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5590
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	11e4956e-f20c-44a4-4d7c-08da3c8519d2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kZvuxfR7IYHI1s7M6yMwAWuuzSgf7bS7zHoZw3nqJwS0Rc6h9mLjNXH6yFN3jL+kej/mhulxlPulhwVuO2ul7P1hYqGndyihj2ngJxCZfz2FYRO85UnYy14LqjJGaY7evGbKhNoLXvcNeUgvs4V34y4kp6BTJcN3xZcAD6cBQE3TzDseONUMCa0pY7YCJcJxaZDz9yRdTwfBzYeRMgcIxy95nausYBEeq+X5gIMoVCQ7yh+Bv6nHF5YKD3KoTKPnAWvFoqC3YNohZZS0+G9PuizbfWqM+kS+NZirPjoc8/kOLgBkCpoGGGdEps6M1ZQGWE7pupfXG599K01ZiSj6DryE1ttCKUlq+cKHyk08jMUOi7UG3ox3TKzUTC3Te5K5kfyrba1eG8CaIC62LHnYc7ooRsKtHEr176RkVvRIrY7hB+TK9Smuj7eYvhY4uY533c3C8IViDvPbexXjaDCqmR8V/MsDc0BrBv6sCO2BdqgfhGhVmztfCMQ3x+qus08XJ2g8ibfFVPKn2a5PXRdqPl34A2u1aNl+z9AtT+oI1N++1312XKj2/LIbBPonLmZAla09iM+c8UcFLowByVzo5cNHOlvYrSIca8QYneOYN8l4WtYCjRXAmTrOTthvP6JAZJVZGnNUnC+y2n0JHH63WAiyw6EIckMy36lzOM+7OMZvWDmCzhRUdgKQM9vtrlUi
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(44832011)(6666004)(82310400005)(40460700003)(36756003)(86362001)(5660300002)(316002)(36860700001)(26005)(2906002)(7696005)(83380400001)(8676002)(4326008)(2616005)(6916009)(54906003)(47076005)(70206006)(426003)(186003)(81166007)(8936002)(508600001)(1076003)(336012)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 06:26:10.7966
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a81e30a7-b06e-49ce-bca8-08da3c8520fa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6802

In current code, when Xen is running in a multiple nodes
NUMA system, it will set dma_bitsize in end_boot_allocator
to reserve some low address memory as DMA zone.

There are some x86 implications in the implementation.
Because on x86, memory starts from 0. On a multiple-nodes
NUMA system, if a single node contains the majority or all
of the DMA memory, x86 prefers to give out memory from
non-local allocations rather than exhausting the DMA memory
ranges. Hence x86 uses dma_bitsize to set aside some largely
arbitrary amount of memory for DMA zone. The allocations
from DMA zone would happen only after exhausting all other
nodes' memory.

But the implications are not shared across all architectures.
For example, Arm cannot guarantee the availability of memory
below a certain boundary for DMA limited-capability devices
either. But currently, Arm doesn't need a reserved DMA zone
in Xen. Because there is no DMA device in Xen. And for guests,
Xen Arm only allows Dom0 to have DMA operations without IOMMU.
Xen will try to allocate memory under 4GB or memory range that
is limited by dma_bitsize for Dom0 in boot time. For DomU, even
Xen can passthrough devices to DomU without IOMMU, but Xen Arm
doesn't guarantee their DMA operations. So, Xen Arm doesn't
need a reserved DMA zone to provide DMA memory for guests.

In this patch, we introduce an arch_want_default_dmazone helper
for different architectures to determine whether they need to
set dma_bitsize for DMA zone reservation or not.

At the same time, when x86 Xen is built with CONFIG_PV=n could
probably leverage this new helper to actually not trigger DMA
zone reservation.

Issue-Id: SCM-2240
Change-Id: I08c5d463995322ecaf7e6755d417c814825010eb
Signed-off-by: Wei Chen <wei.chen@arm.com>
Tested-by: Jiamei Xie <jiamei.xie@arm.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v3 -> v4:
1. Add Acked-by.
v2 -> v3:
1. Add Tb.
2. Rename arch_have_default_dmazone to arch_want_default_dmazone.
v1 -> v2:
1. Extend the description of Arm's workaround for reserve DMA
   allocations to avoid the same discussion every time.
2. Use a macro to define arch_have_default_dmazone, because
   it's little hard to make x86 version to static inline.
   Use a macro will also avoid add __init for this function.
3. Change arch_have_default_dmazone return value from
   unsigned int to bool.
4. Un-addressed comment: make arch_have_default_dmazone
   of x86 to be static inline. Because, if we move
   arch_have_default_dmazone to x86/asm/numa.h, it depends
   on nodemask.h to provide num_online_nodes. But nodemask.h
   needs numa.h to provide MAX_NUMANODES. This will cause a
   loop dependency. And this function can only be used in
   end_boot_allocator, in Xen initialization. So I think,
   compared to the changes introduced by inline, it doesn't
   mean much.
---
 xen/arch/arm/include/asm/numa.h | 1 +
 xen/arch/x86/include/asm/numa.h | 1 +
 xen/common/page_alloc.c         | 2 +-
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/numa.h b/xen/arch/arm/include/asm/numa.h
index 31a6de4e23..e4c4d89192 100644
--- a/xen/arch/arm/include/asm/numa.h
+++ b/xen/arch/arm/include/asm/numa.h
@@ -24,6 +24,7 @@ extern mfn_t first_valid_mfn;
 #define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
 #define node_start_pfn(nid) (mfn_x(first_valid_mfn))
 #define __node_distance(a, b) (20)
+#define arch_want_default_dmazone() (false)
 
 #endif /* __ARCH_ARM_NUMA_H */
 /*
diff --git a/xen/arch/x86/include/asm/numa.h b/xen/arch/x86/include/asm/numa.h
index bada2c0bb9..5d8385f2e1 100644
--- a/xen/arch/x86/include/asm/numa.h
+++ b/xen/arch/x86/include/asm/numa.h
@@ -74,6 +74,7 @@ static inline __attribute__((pure)) nodeid_t phys_to_nid(paddr_t addr)
 #define node_spanned_pages(nid)	(NODE_DATA(nid)->node_spanned_pages)
 #define node_end_pfn(nid)       (NODE_DATA(nid)->node_start_pfn + \
 				 NODE_DATA(nid)->node_spanned_pages)
+#define arch_want_default_dmazone() (num_online_nodes() > 1)
 
 extern int valid_numa_range(u64 start, u64 end, nodeid_t node);
 
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 319029140f..b3bddc719b 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1889,7 +1889,7 @@ void __init end_boot_allocator(void)
     }
     nr_bootmem_regions = 0;
 
-    if ( !dma_bitsize && (num_online_nodes() > 1) )
+    if ( !dma_bitsize && arch_want_default_dmazone() )
         dma_bitsize = arch_get_dma_bitsize();
 
     printk("Domain heap initialised");
-- 
2.25.1


