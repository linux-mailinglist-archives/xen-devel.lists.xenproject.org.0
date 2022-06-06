Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEDE53E041
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jun 2022 06:10:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342288.567419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny442-00013H-83; Mon, 06 Jun 2022 04:10:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342288.567419; Mon, 06 Jun 2022 04:10:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny441-0000zl-VG; Mon, 06 Jun 2022 04:10:01 +0000
Received: by outflank-mailman (input) for mailman id 342288;
 Mon, 06 Jun 2022 04:10:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aNt7=WN=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ny440-0000w0-6t
 for xen-devel@lists.xenproject.org; Mon, 06 Jun 2022 04:10:00 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8632fe96-e54e-11ec-bd2c-47488cf2e6aa;
 Mon, 06 Jun 2022 06:09:57 +0200 (CEST)
Received: from AS9PR06CA0474.eurprd06.prod.outlook.com (2603:10a6:20b:49a::27)
 by AM9PR08MB6051.eurprd08.prod.outlook.com (2603:10a6:20b:2d6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Mon, 6 Jun
 2022 04:09:55 +0000
Received: from VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49a:cafe::ce) by AS9PR06CA0474.outlook.office365.com
 (2603:10a6:20b:49a::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12 via Frontend
 Transport; Mon, 6 Jun 2022 04:09:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT022.mail.protection.outlook.com (10.152.18.64) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.12 via Frontend Transport; Mon, 6 Jun 2022 04:09:54 +0000
Received: ("Tessian outbound 6f53897bcd4e:v120");
 Mon, 06 Jun 2022 04:09:54 +0000
Received: from 0fca4f0dc9b1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DF4E7710-73BA-4507-BD15-A56E5BEE59D3.1; 
 Mon, 06 Jun 2022 04:09:48 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0fca4f0dc9b1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 06 Jun 2022 04:09:48 +0000
Received: from AS9P194CA0025.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::15)
 by VE1PR08MB4942.eurprd08.prod.outlook.com (2603:10a6:803:10f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Mon, 6 Jun
 2022 04:09:45 +0000
Received: from AM5EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46d:cafe::b0) by AS9P194CA0025.outlook.office365.com
 (2603:10a6:20b:46d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.15 via Frontend
 Transport; Mon, 6 Jun 2022 04:09:44 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT005.mail.protection.outlook.com (10.152.16.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5314.12 via Frontend Transport; Mon, 6 Jun 2022 04:09:44 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Mon, 6 Jun
 2022 04:09:45 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Mon, 6 Jun 2022 04:09:43 +0000
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
X-Inumbo-ID: 8632fe96-e54e-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Or8Gvwh6eP/nhI4rhe6bSfH9eVwV3ynzMOy1Ai4F7/wD4v4Pi1xtMiVvGs2NaqOb/e0ukOBv4vqvJmMIENeLOhIzuAFQVS5zncnfF4gFnzYkxOJF2PrBHm7HujTq1PZQDw8ActuXdgPVYEljEesz8vlVaT4gNX8EbM99uekvzyRiPhlXLwCqgrJgrcq6Z/KJM7uH4O24iwmBCAjZyrsT9Td+0NkqdM8Apt9JgnnpOWuQSvKlodihV0Ib3w5ZcrPwOr5pKVDBDnNXELyg7Ergs6urlwz0niVUhWI7Can7tWLItSltsVAg5vPGkYxYHQLVRQXZwT0v9PSBvrngJG/dIA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YtTv1hIwjELwhmX84zR7R+LRlUkqarX1yb6jS7tn1R4=;
 b=lUWbDDIekuIfv5cOYhNyr8GFvpD9U8MBTR1ExBhp0o6OK+eOhtY9v5tfcVWaoepjq2yDK+FCgYQxFen4tfe0ea0MU48NnS7wTB69GSJeiDGMCMG4bvPagDVRgX/0hn7fIRrRlQYk7atDdXRB/xTEnx+NWz3zvPJn0wLAZAxt96WtVOybLVsu6BYlZDbgxEsY4pyaIDI2S1qW3ruZ+EwTerfriYFBS9gVxBXY6ZPfBB7kYDk/6k7fzSFAe1bwcF+fBYy3tL0/SrWebLIlLdzVBWD477aPgMfmBC89OChc9GbADbowboRKSgwDI9BuAsjlo49VareUV8I/OzZ9saGM7g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YtTv1hIwjELwhmX84zR7R+LRlUkqarX1yb6jS7tn1R4=;
 b=rTz8KZ3kHowgygU44gF8uRtJS0u2lpXJOMe2kGhCIPrndA1MqWcjioPX79Jb3KoOo4eBEc1iQKQD7COuKMkgV6BqhxYjsSZHSzU+2Dr/eOj1gMi+Ot9DIs35UgQ4Yrhr+cYBQGn7wCiBQKTAoQa+CkY0wB5/71An15NvXAC6v28=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 32512fb47f154575
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SRVGngTFAg/5lOEQ8BcWcCedd8+5W4pGihYWmzF4krg0CsixpbkyWGIB9QivV9MXAUojX7/PlmlcpknssP2hFFXIXyierRppRjymcx/i67HcZyC1OSfgAEr2aNqey8MliZU2uBP3uM8xB2FyAGtpqOH0D0TvrdPdvZ7ou+O63wXgVemTimYEy1zlBeJ3gv3e8hnSNc8dv1XSJqLAU1OI4QWJueXXHwrYWPSjRs87rVmsSLnJAdNj0WjLC1hd1J4oP9oAH6EtAlYsGJJRPNH3M7SnlQBV64IFrAsUZ3+ArmXq1aQFKbQgq+7lRfw3ia+HIxmnFTMdF+mxc4hLPzAJeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YtTv1hIwjELwhmX84zR7R+LRlUkqarX1yb6jS7tn1R4=;
 b=b8Zbj6RKDxaC2ic97HLPBmsvxQfhwNs9zHGHEOyo8bQQzWfXes5JU3YzAK2QU/MjEeY5CztFYYv48tpDcHU+wCyzBH6xEArAZq18Mw70Qpb7JPwRyKoXVsX5R9dTagXybKUXLNiTxAPgJveESMAmAu/UZekx7PX0M1HULicft9696bEU73d8MilB+cTo4nPtI+i1gTJtOC3dI0z+MSqASr3czmCFHwqW4taPjVDnw72k/6mX4i/+fIY0uuMgEslBSstn+xffc00U9qwht0tXgRvUHQR9xcHSWK3sgaUWcnA6dMPAaniq51RqtbxyUdUgW5VWtGMKOayPhDmACxUOTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YtTv1hIwjELwhmX84zR7R+LRlUkqarX1yb6jS7tn1R4=;
 b=rTz8KZ3kHowgygU44gF8uRtJS0u2lpXJOMe2kGhCIPrndA1MqWcjioPX79Jb3KoOo4eBEc1iQKQD7COuKMkgV6BqhxYjsSZHSzU+2Dr/eOj1gMi+Ot9DIs35UgQ4Yrhr+cYBQGn7wCiBQKTAoQa+CkY0wB5/71An15NvXAC6v28=
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
	<wl@xen.org>, Jiamei Xie <jiamei.xie@arm.com>
Subject: [PATCH v5 6/8] xen/x86: use paddr_t for addresses in NUMA node structure
Date: Mon, 6 Jun 2022 12:09:14 +0800
Message-ID: <20220606040916.122184-7-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220606040916.122184-1-wei.chen@arm.com>
References: <20220606040916.122184-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 2747065e-11ed-4f3f-ab44-08da47726979
X-MS-TrafficTypeDiagnostic:
	VE1PR08MB4942:EE_|VE1EUR03FT022:EE_|AM9PR08MB6051:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB60512C0EB02C1C2CA1A0FA369EA29@AM9PR08MB6051.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +oyYtJcfWxyblMmloXBIZSVBwSVAAMFVGfMwtP52kfrhsxJfUTlfvyut/+cpEho9y8t+zPOoTOHlgg34q03wxi+ajr/i7GuLsB/n7cOFVU25TcBVIUeqtd1Pj7w5pM4BxOjrbt46ERcjU6AoLAwIfU82gIFuH2szLwbRKNEuFHDg5AiXxH74DPSFCpEm5PNFbHqXCBu1DI+Pv6LkclhqALPyPkDTTlte78XZdkYToqJ3UHUWnEOjv0Yqce2EQq++OFchq5/+9v5sU5DDottGbY4cy/eXaRSOyBe4i2wm4sjTOgzKY/iynEo+CBdBgHamZa63Lm0O8NcBKmfWqEEITxrYUvpLZOWMJwNwKJXmbBPkxon4R75tD2ZakgP/DaoyEWs2yp381vbFncrMRIe/uVecm/DmWQGWX96g8IBm0BsERANJTp8hSYkXpHFkni+lSbF9fXTtt2NMi4Jh8ZwwJWSrscvngtAdkvc7ZTp18sF7tfEs9XouZ3SUvTtzChlqwAiu5SkyQ/thgw2a929VEUJWnlALo5J5Hw7YOQI6nCXbYA4ZPyVTFsFcIRMTF68T/wi5V2Nyvsdg0g3dMiCOVcZDT4UVVzJphv8+O9yuk9rywmfVFP2h65XLL2Op+VQjVe8o0ZN0a+JHH7kalFFclElGQmedfNDLgISlklCANG8vG/JrwTgLYJX20jpQnlmV
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(82310400005)(83380400001)(186003)(316002)(26005)(54906003)(6916009)(47076005)(336012)(426003)(2616005)(508600001)(36756003)(2906002)(81166007)(8936002)(86362001)(36860700001)(7696005)(356005)(1076003)(44832011)(5660300002)(4326008)(8676002)(70586007)(70206006)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4942
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	39424812-6fce-4590-2fe0-08da4772635c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	onlPedy2QptuBK4dBmRdS6XQNam6yYmAUK5pSaxTSa7e7T0hxNVNWcmgeVFNXxL2ZBeuTrqD5vOXOBvX8bOOyNIHiELcd7XsGQW8s/bhnEsHsMRtDsaWsGZlqwtMMmVX0BbwxChMT+XU2VCzTUI0jwoRrTxIeqMFqscNmuHRn2hekmwqY/MzDP94BKMUn649wki7+98WSP1gIkYFWjZOSU00UeT/SvPAJRxFgvbvMp24o4qQUrudtgJ64XF0yy3yQ5C6d5ge3DT8ti6bUamRME87C9+SiwBoyPYOl7QRigDOq+wBIT719VVrGnR1UCr1msE/m0rDjeHRSzy2MCEW64/n3En+H7OFqWXrq1esmDOJs65pnjAWW1wGxHT0XI2lXY2s244GvYp0RERfsBVhuharH+GuiZn3EilOSoF2fTP9BNdcdKZiI8F7katqUjX3tQCWNJyZvPnACLwfcBSuA0BVxJ7YsjYkNTz0jh5B/cgBOmtKC6zxOBKGzNFKatDlpi764SX9snJ86PB7sgEy0BeI6GYlS196W1DySlVUjbR3VQ/oPCbY8Z+L4yknFmpduMfBV+amqIaZ3oCvBAZGEDJmACYCCTybnyQchClgwd3WE1hjcmFnD9pvteUctYOuBGDXaRir9NjBAD8uNG8DuA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(316002)(44832011)(47076005)(426003)(336012)(5660300002)(82310400005)(2616005)(86362001)(186003)(1076003)(2906002)(8936002)(8676002)(4326008)(36756003)(70586007)(6666004)(70206006)(36860700001)(6916009)(508600001)(54906003)(81166007)(7696005)(26005)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2022 04:09:54.6389
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2747065e-11ed-4f3f-ab44-08da47726979
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6051

NUMA node structure "struct node" is using u64 as node memory
range. In order to make other architectures can reuse this
NUMA node relative code, we replace the u64 to paddr_t. And
use pfn_to_paddr and paddr_to_pfn to replace explicit shift
operations. The relate PRIx64 in print messages have been
replaced by PRIpaddr at the same time. And some being-phased-out
types like u64 in the lines we have touched also have been
converted to uint64_t or unsigned long.

Tested-by: Jiamei Xie <jiamei.xie@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v3 -> v4:
1. Add Tb.
v2 -> v3:
1. Use uint64_t for size in acpi_scan_nodes, make it be
   consistent with numa_emulation.
2. Add Tb.
v1 -> v2:
1. Drop useless cast.
2. Use initializers of the variables.
3. Replace u64 by uint64_t.
4. Use unsigned long for start_pfn and end_pfn.
---
 xen/arch/x86/include/asm/numa.h |  8 ++++----
 xen/arch/x86/numa.c             | 32 +++++++++++++++-----------------
 xen/arch/x86/srat.c             | 25 +++++++++++++------------
 3 files changed, 32 insertions(+), 33 deletions(-)

diff --git a/xen/arch/x86/include/asm/numa.h b/xen/arch/x86/include/asm/numa.h
index 5d8385f2e1..c32ccffde3 100644
--- a/xen/arch/x86/include/asm/numa.h
+++ b/xen/arch/x86/include/asm/numa.h
@@ -18,7 +18,7 @@ extern cpumask_t     node_to_cpumask[];
 #define node_to_cpumask(node)    (node_to_cpumask[node])
 
 struct node { 
-	u64 start,end; 
+	paddr_t start, end;
 };
 
 extern int compute_hash_shift(struct node *nodes, int numnodes,
@@ -38,7 +38,7 @@ extern void numa_set_node(int cpu, nodeid_t node);
 extern nodeid_t setup_node(unsigned int pxm);
 extern void srat_detect_node(int cpu);
 
-extern void setup_node_bootmem(nodeid_t nodeid, u64 start, u64 end);
+extern void setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end);
 extern nodeid_t apicid_to_node[];
 extern void init_cpu_to_node(void);
 
@@ -76,9 +76,9 @@ static inline __attribute__((pure)) nodeid_t phys_to_nid(paddr_t addr)
 				 NODE_DATA(nid)->node_spanned_pages)
 #define arch_want_default_dmazone() (num_online_nodes() > 1)
 
-extern int valid_numa_range(u64 start, u64 end, nodeid_t node);
+extern int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node);
 
-void srat_parse_regions(u64 addr);
+void srat_parse_regions(paddr_t addr);
 extern u8 __node_distance(nodeid_t a, nodeid_t b);
 unsigned int arch_get_dma_bitsize(void);
 
diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index 680b7d9002..627ae8aa95 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -162,12 +162,10 @@ int __init compute_hash_shift(struct node *nodes, int numnodes,
     return shift;
 }
 /* initialize NODE_DATA given nodeid and start/end */
-void __init setup_node_bootmem(nodeid_t nodeid, u64 start, u64 end)
-{ 
-    unsigned long start_pfn, end_pfn;
-
-    start_pfn = start >> PAGE_SHIFT;
-    end_pfn = end >> PAGE_SHIFT;
+void __init setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end)
+{
+    unsigned long start_pfn = paddr_to_pfn(start);
+    unsigned long end_pfn = paddr_to_pfn(end);
 
     NODE_DATA(nodeid)->node_start_pfn = start_pfn;
     NODE_DATA(nodeid)->node_spanned_pages = end_pfn - start_pfn;
@@ -198,11 +196,12 @@ void __init numa_init_array(void)
 static int numa_fake __initdata = 0;
 
 /* Numa emulation */
-static int __init numa_emulation(u64 start_pfn, u64 end_pfn)
+static int __init numa_emulation(unsigned long start_pfn,
+                                 unsigned long end_pfn)
 {
     int i;
     struct node nodes[MAX_NUMNODES];
-    u64 sz = ((end_pfn - start_pfn)<<PAGE_SHIFT) / numa_fake;
+    uint64_t sz = pfn_to_paddr(end_pfn - start_pfn) / numa_fake;
 
     /* Kludge needed for the hash function */
     if ( hweight64(sz) > 1 )
@@ -218,9 +217,9 @@ static int __init numa_emulation(u64 start_pfn, u64 end_pfn)
     memset(&nodes,0,sizeof(nodes));
     for ( i = 0; i < numa_fake; i++ )
     {
-        nodes[i].start = (start_pfn<<PAGE_SHIFT) + i*sz;
+        nodes[i].start = pfn_to_paddr(start_pfn) + i * sz;
         if ( i == numa_fake - 1 )
-            sz = (end_pfn<<PAGE_SHIFT) - nodes[i].start;
+            sz = pfn_to_paddr(end_pfn) - nodes[i].start;
         nodes[i].end = nodes[i].start + sz;
         printk(KERN_INFO "Faking node %d at %"PRIx64"-%"PRIx64" (%"PRIu64"MB)\n",
                i,
@@ -246,6 +245,8 @@ static int __init numa_emulation(u64 start_pfn, u64 end_pfn)
 void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
 { 
     int i;
+    paddr_t start = pfn_to_paddr(start_pfn);
+    paddr_t end = pfn_to_paddr(end_pfn);
 
 #ifdef CONFIG_NUMA_EMU
     if ( numa_fake && !numa_emulation(start_pfn, end_pfn) )
@@ -253,17 +254,15 @@ void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
 #endif
 
 #ifdef CONFIG_ACPI_NUMA
-    if ( !numa_off && !acpi_scan_nodes((u64)start_pfn << PAGE_SHIFT,
-         (u64)end_pfn << PAGE_SHIFT) )
+    if ( !numa_off && !acpi_scan_nodes(start, end) )
         return;
 #endif
 
     printk(KERN_INFO "%s\n",
            numa_off ? "NUMA turned off" : "No NUMA configuration found");
 
-    printk(KERN_INFO "Faking a node at %016"PRIx64"-%016"PRIx64"\n",
-           (u64)start_pfn << PAGE_SHIFT,
-           (u64)end_pfn << PAGE_SHIFT);
+    printk(KERN_INFO "Faking a node at %"PRIpaddr"-%"PRIpaddr"\n",
+           start, end);
     /* setup dummy node covering all memory */
     memnode_shift = BITS_PER_LONG - 1;
     memnodemap = _memnodemap;
@@ -276,8 +275,7 @@ void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
     for ( i = 0; i < nr_cpu_ids; i++ )
         numa_set_node(i, 0);
     cpumask_copy(&node_to_cpumask[0], cpumask_of(0));
-    setup_node_bootmem(0, (u64)start_pfn << PAGE_SHIFT,
-                    (u64)end_pfn << PAGE_SHIFT);
+    setup_node_bootmem(0, start, end);
 }
 
 void numa_add_cpu(int cpu)
diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index cfe24c7e78..8ffe43bdfe 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -104,7 +104,7 @@ nodeid_t setup_node(unsigned pxm)
 	return node;
 }
 
-int valid_numa_range(u64 start, u64 end, nodeid_t node)
+int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node)
 {
 	int i;
 
@@ -119,7 +119,7 @@ int valid_numa_range(u64 start, u64 end, nodeid_t node)
 	return 0;
 }
 
-static __init int conflicting_memblks(u64 start, u64 end)
+static __init int conflicting_memblks(paddr_t start, paddr_t end)
 {
 	int i;
 
@@ -135,7 +135,7 @@ static __init int conflicting_memblks(u64 start, u64 end)
 	return -1;
 }
 
-static __init void cutoff_node(int i, u64 start, u64 end)
+static __init void cutoff_node(int i, paddr_t start, paddr_t end)
 {
 	struct node *nd = &nodes[i];
 	if (nd->start < start) {
@@ -275,7 +275,7 @@ acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *pa)
 void __init
 acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 {
-	u64 start, end;
+	paddr_t start, end;
 	unsigned pxm;
 	nodeid_t node;
 	int i;
@@ -318,7 +318,7 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 		bool mismatch = !(ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE) !=
 		                !test_bit(i, memblk_hotplug);
 
-		printk("%sSRAT: PXM %u (%"PRIx64"-%"PRIx64") overlaps with itself (%"PRIx64"-%"PRIx64")\n",
+		printk("%sSRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr") overlaps with itself (%"PRIpaddr"-%"PRIpaddr")\n",
 		       mismatch ? KERN_ERR : KERN_WARNING, pxm, start, end,
 		       node_memblk_range[i].start, node_memblk_range[i].end);
 		if (mismatch) {
@@ -327,7 +327,7 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 		}
 	} else {
 		printk(KERN_ERR
-		       "SRAT: PXM %u (%"PRIx64"-%"PRIx64") overlaps with PXM %u (%"PRIx64"-%"PRIx64")\n",
+		       "SRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr") overlaps with PXM %u (%"PRIpaddr"-%"PRIpaddr")\n",
 		       pxm, start, end, node_to_pxm(memblk_nodeid[i]),
 		       node_memblk_range[i].start, node_memblk_range[i].end);
 		bad_srat();
@@ -346,7 +346,7 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 				nd->end = end;
 		}
 	}
-	printk(KERN_INFO "SRAT: Node %u PXM %u %"PRIx64"-%"PRIx64"%s\n",
+	printk(KERN_INFO "SRAT: Node %u PXM %u %"PRIpaddr"-%"PRIpaddr"%s\n",
 	       node, pxm, start, end,
 	       ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE ? " (hotplug)" : "");
 
@@ -369,7 +369,7 @@ static int __init nodes_cover_memory(void)
 
 	for (i = 0; i < e820.nr_map; i++) {
 		int j, found;
-		unsigned long long start, end;
+		paddr_t start, end;
 
 		if (e820.map[i].type != E820_RAM) {
 			continue;
@@ -396,7 +396,7 @@ static int __init nodes_cover_memory(void)
 
 		if (start < end) {
 			printk(KERN_ERR "SRAT: No PXM for e820 range: "
-				"%016Lx - %016Lx\n", start, end);
+				"%"PRIpaddr" - %"PRIpaddr"\n", start, end);
 			return 0;
 		}
 	}
@@ -432,7 +432,7 @@ static int __init cf_check srat_parse_region(
 	return 0;
 }
 
-void __init srat_parse_regions(u64 addr)
+void __init srat_parse_regions(paddr_t addr)
 {
 	u64 mask;
 	unsigned int i;
@@ -457,7 +457,7 @@ void __init srat_parse_regions(u64 addr)
 }
 
 /* Use the information discovered above to actually set up the nodes. */
-int __init acpi_scan_nodes(u64 start, u64 end)
+int __init acpi_scan_nodes(paddr_t start, paddr_t end)
 {
 	int i;
 	nodemask_t all_nodes_parsed;
@@ -489,7 +489,8 @@ int __init acpi_scan_nodes(u64 start, u64 end)
 	/* Finally register nodes */
 	for_each_node_mask(i, all_nodes_parsed)
 	{
-		u64 size = nodes[i].end - nodes[i].start;
+		uint64_t size = nodes[i].end - nodes[i].start;
+
 		if ( size == 0 )
 			printk(KERN_WARNING "SRAT: Node %u has no memory. "
 			       "BIOS Bug or mis-configured hardware?\n", i);
-- 
2.25.1


