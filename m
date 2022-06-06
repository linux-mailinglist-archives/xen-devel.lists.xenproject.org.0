Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C8853E042
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jun 2022 06:10:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342287.567404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny43v-0000PJ-FZ; Mon, 06 Jun 2022 04:09:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342287.567404; Mon, 06 Jun 2022 04:09:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny43v-0000J3-AV; Mon, 06 Jun 2022 04:09:55 +0000
Received: by outflank-mailman (input) for mailman id 342287;
 Mon, 06 Jun 2022 04:09:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aNt7=WN=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ny43t-0007op-UH
 for xen-devel@lists.xenproject.org; Mon, 06 Jun 2022 04:09:54 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0616.outbound.protection.outlook.com
 [2a01:111:f400:fe06::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8322dc6e-e54e-11ec-b605-df0040e90b76;
 Mon, 06 Jun 2022 06:09:51 +0200 (CEST)
Received: from FR0P281CA0062.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::23)
 by PAXPR08MB6970.eurprd08.prod.outlook.com (2603:10a6:102:1d9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Mon, 6 Jun
 2022 04:09:37 +0000
Received: from VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:49:cafe::6a) by FR0P281CA0062.outlook.office365.com
 (2603:10a6:d10:49::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.9 via Frontend
 Transport; Mon, 6 Jun 2022 04:09:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT023.mail.protection.outlook.com (10.152.18.133) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.12 via Frontend Transport; Mon, 6 Jun 2022 04:09:36 +0000
Received: ("Tessian outbound e40990bc24d7:v120");
 Mon, 06 Jun 2022 04:09:36 +0000
Received: from e42c15b7b331.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AC0E2A91-87D3-4EF0-96B1-62105DFA0037.1; 
 Mon, 06 Jun 2022 04:09:30 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e42c15b7b331.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 06 Jun 2022 04:09:30 +0000
Received: from DU2P250CA0013.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::18)
 by VE1PR08MB5773.eurprd08.prod.outlook.com (2603:10a6:800:1a9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Mon, 6 Jun
 2022 04:09:28 +0000
Received: from DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:231:cafe::2f) by DU2P250CA0013.outlook.office365.com
 (2603:10a6:10:231::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19 via Frontend
 Transport; Mon, 6 Jun 2022 04:09:28 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT032.mail.protection.outlook.com (100.127.142.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5314.12 via Frontend Transport; Mon, 6 Jun 2022 04:09:27 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.27; Mon, 6 Jun
 2022 04:09:29 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.27; Mon, 6
 Jun 2022 04:09:26 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Mon, 6 Jun 2022 04:09:25 +0000
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
X-Inumbo-ID: 8322dc6e-e54e-11ec-b605-df0040e90b76
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=dgFkJlv52PVEumheILJpFC6xWelZlCEtiz5sj6DxgUYO8b9T2dkLSGWliCO1hKA56h/HMkmdGNDHywzKXfBL1bj1EcSWnONxHO20jXegeJo4NvUp2YtYe6zzsOU71pUvXoyRFqfKU6UdtGMnxvdr0uqJMsTBhvf5HOEto+3pb0W5/YZxeTPZwmSFRKLBrlUjOcABqq2bTme6p3csbeIhs4x330ZMZJy5RI/0JTgQfGR+voqJR7MmKxB5kjcwJCafI+nbVmBy7S3TwkG1tWqDZ6XNv4oCJK1pNWHa8eZW0PhJmvAiPa7gLyo1ndS9La/7r0GxlYnSrlXnMB4mJJj/cw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1Mk+96NdZCuYCNVMfuYJAf8YYMD5xhqAKxBbA5l6eU=;
 b=g1RbakPyXM/1+m8jFzh5zPO7rJLzG/isLsmXkyFUBIaWSkqmqM8y/puA8uZgbVANbYlDFydvWxdBivtF0avXJAlPMIsyfzHKbOtrGuFf28aln+kk3rqhm0hPsuXZkyQnCuGi/ZVcrOgvF/3kM8wESlHppog7PNBkn9+5cvwVkp//+tI+zD+G4KVa8Ct61ZqYz3A3h47mTb4NUICyYfqEH9Zq/Sc+uCVcsN6++zqif8hQpcVeHElN+k5VRefjq5/QZKGwbVnkE05d+8tRbaoUqu0hcroNN/ub6Z9All4zhIsSXIeXnzZfzI1qoRyRG6+Yn7ufxRcett9opt820dFEtA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1Mk+96NdZCuYCNVMfuYJAf8YYMD5xhqAKxBbA5l6eU=;
 b=ubGdOVJA9FgdaZetYbrjlq0E4RcrgfAjWhYJWHzA61eLVZN8VLz8PxtWptNH5BjouvwueIzqqmdNI0Z/24SjUYKBXZxo7CmjIUdOiscgz5qMlf93dOUr+jY2JhJuvcC92Jm4vbgPkvu3VftWCNnFCVYT1tmbYW/Nuro/V4ETAAw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f36c588d85b21df3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nu9OpflSAl6SxawC2+WZmvQ/Pw0LNS4GKd+zEDpPDyxIiGFROXiuGDjut4Qk/CnbTkRgBdW4CF3uUj9TWkdeu5xqfrNVINHL1sUINur/ivuSoALA5AB1Xum6qO/cH8NDKSupqsVcZjm/TQqWXIB9vMhbrpODlIGk9bCELEyrwa+mgmSqMrmkf0OZaxJsOxbWwIkBOUosl38/K66lO1V0QQw6+0sB3q36XiOKbPKcbw/+kGckaPPFbpS20J8IT4I+ocUv+3glFC6tFb9KUimyYqW7AaF6/OvNFM9/VUYpq68hoC9/98M+/bNVGarFzZFiZdZ9ih7L/Yl3SoH6m5Jx/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1Mk+96NdZCuYCNVMfuYJAf8YYMD5xhqAKxBbA5l6eU=;
 b=btRChuysDPpjjzbT+1Dc+5mlQddD3AIRjgF3MhZn3zqmMkh+Pi0CeURXjzC/u2SOvaiACBYMqOq/lZR9y2GRB+Pcm7N1qrSpl3/1aK+1DY2Me8H5/isVWSfLMBGAPRjlSQe/yYjMMgGIkEW9KPRhsFnPZzoQBVd9BiWYp6MBY/wKfidN24pvduUzFIwNVN+Zhy99aGDV5AfQElBlME9Hl06nUYsxXpqyp8R1oAVUtt/H84OyG+z1k5M0Zs2NTGR/XuFtT3cvBb6e4XFvpI0K6qxBeR01gbzmHlwXyaBbfnrmWsIvGhzKcR3VW+tWCG0SMHb1VR4vcjb4WB1aaXMWlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1Mk+96NdZCuYCNVMfuYJAf8YYMD5xhqAKxBbA5l6eU=;
 b=ubGdOVJA9FgdaZetYbrjlq0E4RcrgfAjWhYJWHzA61eLVZN8VLz8PxtWptNH5BjouvwueIzqqmdNI0Z/24SjUYKBXZxo7CmjIUdOiscgz5qMlf93dOUr+jY2JhJuvcC92Jm4vbgPkvu3VftWCNnFCVYT1tmbYW/Nuro/V4ETAAw=
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
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Jiamei Xie <jiamei.xie@arm.com>
Subject: [PATCH v5 1/8] xen: reuse x86 EFI stub functions for Arm
Date: Mon, 6 Jun 2022 12:09:09 +0800
Message-ID: <20220606040916.122184-2-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220606040916.122184-1-wei.chen@arm.com>
References: <20220606040916.122184-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 07bb5d6d-038c-4aab-0797-08da47725ee4
X-MS-TrafficTypeDiagnostic:
	VE1PR08MB5773:EE_|VE1EUR03FT023:EE_|PAXPR08MB6970:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB69706AE1B5F1B2788C7319C79EA29@PAXPR08MB6970.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 n2v0KG/Svo6ljlfeiykmyAbmwPCLYmG/J3yXmGi6HbF+ljZuIMSmjNCLahMaRGiqS/zn2FFqMYVwQ7vRA0Hwts8yoSbj+LMKriaVbNvmYFecs8pl0eQ6pOKdyZKik4XTS52kg7PGXscdAhWSdQiVH/0U6XxOtaOF6uQxp2YFJKW1M/hKqG3Wkt4DQIv+bgWWOWT5Am3uZ6MT4YGSbJWEr8fZoksq+VsZAbq3llmYIalqzRPXErX26n+py3yxiXliEe6HlLHr1hNyZvvqxBeBLY30BU5kNOhm3y8kb7aGqikboD8IwIExZQ0i1HbOnTDAWI/dNzJVdmXK6FvJZASwnlWcpXRck0D4d+4Y7gH+06cQB+bIhJ/QtgI/s79t357Rj1vJziBgy68IS7xpc6rRj35Hn/7X2jznUFSWlzqMcDJQ5MTknYTvS5xH/ypZq6TvxQflZ2FuBxTfROlUE1HgSq2+8jQnRSDhZYWRAZu3y5/7twVYSQssWlr5TaUgl2Dz8hgF7inTkTyNl8YR8G6avK3rbqRPfYoQ87261bofSL6oFXzCPDxrXdF+SSLXvEWSBl4QmJZy0xexOwrFOEO79A8QUdE7Ns+mkYQ4IEdY/OUsV1w1vS4HYdsOPdNkiTX+M2uBxDqtBE8eYQKW0TpLJrDthncwlv/zF2T7FzgBMkdnPYuz4ayDMwionM0dFg1CH8ULfm87a7YZcu02SBS7tQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(36756003)(6666004)(81166007)(356005)(54906003)(316002)(8936002)(2616005)(70586007)(70206006)(26005)(82310400005)(86362001)(5660300002)(8676002)(7696005)(4326008)(6916009)(186003)(44832011)(1076003)(36860700001)(426003)(47076005)(508600001)(83380400001)(2906002)(336012)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5773
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0497a723-ee73-4113-0bcf-08da47725960
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+WT7gzlPM4AVimZBlxFekexvjEULyIAw1z5fqOoQkzzkYg2WbzJUtvyWZu5rYnVRKMOjlhH9hQmKUICLJyksOMglYVFvym9/FGxSaAg7sc+124RAHckLXAgGebyc85Ji8Xi40qsCHz/tkuCs2nLcwYCEFxuYFUmBhi+LPFop2OBsFlZOYd8QB2ZpeTlr6aWVY6SFbi4Nk/sSmECHSq/WO2sfJAoT71yvZHIvOzzR6dYTJW85R4WVfGay05SHApqKL6JV0BA7wCsRArfVmzuGv9Q8qG2zOj8Mk97HNdTo/FV97S+ACtRhO8uc3nP3BSCjLaQf6NMK5tzHeLL8V9FtLOesrAbdNsWKW5HE7lYWLpmXBZRMAB6+UjNH8f1IdnLZaSD20qL4qTxh0uyDVc5nV4thqVCLmruJDdneEYnq+7AXt1Fa3zAGBg2NXJdiHK1YgAyeg8O2MfRR/NY44VZsH85FVKJbnVtjpPUEzGyE2oGWmofstg+oMpwKhpVuKuSc2lVoJfzizHcClxs7i/LXmvIYJtMaVQmesDEDp9r6yf2K1dyn7waqpZQOBTvwwXPMRRXpT7Autw5IDP55/aYt16D1vkPc7ulkwxzNqOPO+P+eEbvQKPODOR+F6LE4CFN33gbXTDtSH5csoWXIcGgj92JVNTkZnB2pReF5MHTEbg0=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(6666004)(316002)(26005)(186003)(336012)(426003)(5660300002)(2906002)(54906003)(36860700001)(70206006)(82310400005)(4326008)(70586007)(36756003)(8676002)(44832011)(47076005)(6916009)(8936002)(86362001)(2616005)(81166007)(83380400001)(7696005)(1076003)(508600001)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2022 04:09:36.8755
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07bb5d6d-038c-4aab-0797-08da47725ee4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6970

x86 is using compiler feature testing to decide EFI build
enable or not. When EFI build is disabled, x86 will use an
efi/stub.c file to replace efi/runtime.c for build objects.
Following this idea, we introduce a stub file for Arm, but
use CONFIG_ARM_EFI to decide EFI build enable or not.

And the most functions in x86 EFI stub.c can be reused for
other architectures, like Arm. So we move them to common
and keep the x86 specific function in x86/efi/stub.c.

To avoid the symbol link conflict error when linking common
stub files to x86/efi. We add a regular file check in efi
stub files' link script. Depends on this check we can bypass
the link behaviors for existed stub files in x86/efi.

As there is no Arm specific EFI stub function for Arm in
current stage, Arm still can use the existed symbol link
method for EFI stub files.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Tested-by: Jiamei Xie <jiamei.xie@arm.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v4 -> v5:
1. Add acked-by.
v3 -> v4:
1. Add indent to make ln and test to be aligned.
v2 -> v3:
1. Add existed file check, if a regular stub files,
   the common/stub files' link will be ignored.
2. Keep stub.c in x86/efi to include common/efi/stub.c
3. Restore efi_compat_xxx stub functions to x86/efi.c.
   Other architectures will not use efi_compat_xxx.
4. Remove ARM_EFI dependency from ARM_64.
5. Add comment for adding stub.o to EFIOBJ-y.
6. Merge patch#2 and patch#3 to one patch.
v1 -> v2:
1. Drop the copy of stub.c from Arm EFI.
2. Share common codes of x86 EFI stub for other architectures.
3. Use CONFIG_ARM_EFI to replace CONFIG_EFI
4. Remove help text and make CONFIG_ARM_EFI invisible.
5. Merge one following patch:
   xen/arm: introduce a stub file for non-EFI architectures
6. Use the common stub.c instead of creating new one.
---
 xen/arch/arm/Kconfig         |  4 ++++
 xen/arch/arm/Makefile        |  2 +-
 xen/arch/arm/efi/Makefile    |  8 ++++++++
 xen/arch/x86/efi/stub.c      | 32 +-------------------------------
 xen/common/efi/efi-common.mk |  3 ++-
 xen/common/efi/stub.c        | 32 ++++++++++++++++++++++++++++++++
 6 files changed, 48 insertions(+), 33 deletions(-)
 create mode 100644 xen/common/efi/stub.c

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index ecfa6822e4..8a16d43bd5 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -6,6 +6,7 @@ config ARM_64
 	def_bool y
 	depends on !ARM_32
 	select 64BIT
+	select ARM_EFI
 	select HAS_FAST_MULTIPLY
 
 config ARM
@@ -33,6 +34,9 @@ config ACPI
 	  Advanced Configuration and Power Interface (ACPI) support for Xen is
 	  an alternative to device tree on ARM64.
 
+config ARM_EFI
+	bool
+
 config GICV3
 	bool "GICv3 driver"
 	depends on ARM_64 && !NEW_VGIC
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 1d862351d1..bb7a6151c1 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -1,6 +1,5 @@
 obj-$(CONFIG_ARM_32) += arm32/
 obj-$(CONFIG_ARM_64) += arm64/
-obj-$(CONFIG_ARM_64) += efi/
 obj-$(CONFIG_ACPI) += acpi/
 obj-$(CONFIG_HAS_PCI) += pci/
 ifneq ($(CONFIG_NO_PLAT),y)
@@ -20,6 +19,7 @@ obj-y += domain.o
 obj-y += domain_build.init.o
 obj-y += domctl.o
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
+obj-y += efi/
 obj-y += gic.o
 obj-y += gic-v2.o
 obj-$(CONFIG_GICV3) += gic-v3.o
diff --git a/xen/arch/arm/efi/Makefile b/xen/arch/arm/efi/Makefile
index 4313c39066..dffe72e589 100644
--- a/xen/arch/arm/efi/Makefile
+++ b/xen/arch/arm/efi/Makefile
@@ -1,4 +1,12 @@
 include $(srctree)/common/efi/efi-common.mk
 
+ifeq ($(CONFIG_ARM_EFI),y)
 obj-y += $(EFIOBJ-y)
 obj-$(CONFIG_ACPI) +=  efi-dom0.init.o
+else
+# Add stub.o to EFIOBJ-y to re-use the clean-files in
+# efi-common.mk. Otherwise the link of stub.c in arm/efi
+# will not be cleaned in "make clean".
+EFIOBJ-y += stub.o
+obj-y += stub.o
+endif
diff --git a/xen/arch/x86/efi/stub.c b/xen/arch/x86/efi/stub.c
index 9984932626..f2365bc041 100644
--- a/xen/arch/x86/efi/stub.c
+++ b/xen/arch/x86/efi/stub.c
@@ -1,7 +1,5 @@
 #include <xen/efi.h>
-#include <xen/errno.h>
 #include <xen/init.h>
-#include <xen/lib.h>
 #include <asm/asm_defns.h>
 #include <asm/efibind.h>
 #include <asm/page.h>
@@ -10,6 +8,7 @@
 #include <efi/eficon.h>
 #include <efi/efidevp.h>
 #include <efi/efiapi.h>
+#include "../../../common/efi/stub.c"
 
 /*
  * Here we are in EFI stub. EFI calls are not supported due to lack
@@ -45,11 +44,6 @@ void __init noreturn efi_multiboot2(EFI_HANDLE ImageHandle,
     unreachable();
 }
 
-bool efi_enabled(unsigned int feature)
-{
-    return false;
-}
-
 void __init efi_init_memory(void) { }
 
 bool efi_boot_mem_unused(unsigned long *start, unsigned long *end)
@@ -62,32 +56,8 @@ bool efi_boot_mem_unused(unsigned long *start, unsigned long *end)
 
 void efi_update_l4_pgtable(unsigned int l4idx, l4_pgentry_t l4e) { }
 
-bool efi_rs_using_pgtables(void)
-{
-    return false;
-}
-
-unsigned long efi_get_time(void)
-{
-    BUG();
-    return 0;
-}
-
-void efi_halt_system(void) { }
-void efi_reset_system(bool warm) { }
-
-int efi_get_info(uint32_t idx, union xenpf_efi_info *info)
-{
-    return -ENOSYS;
-}
-
 int efi_compat_get_info(uint32_t idx, union compat_pf_efi_info *)
     __attribute__((__alias__("efi_get_info")));
 
-int efi_runtime_call(struct xenpf_efi_runtime_call *op)
-{
-    return -ENOSYS;
-}
-
 int efi_compat_runtime_call(struct compat_pf_efi_runtime_call *)
     __attribute__((__alias__("efi_runtime_call")));
diff --git a/xen/common/efi/efi-common.mk b/xen/common/efi/efi-common.mk
index 4298ceaee7..ec2c34f198 100644
--- a/xen/common/efi/efi-common.mk
+++ b/xen/common/efi/efi-common.mk
@@ -9,7 +9,8 @@ CFLAGS-y += -iquote $(srcdir)
 # e.g.: It transforms "dir/foo/bar" into successively
 #       "dir foo bar", ".. .. ..", "../../.."
 $(obj)/%.c: $(srctree)/common/efi/%.c FORCE
-	$(Q)ln -nfs $(subst $(space),/,$(patsubst %,..,$(subst /, ,$(obj))))/source/common/efi/$(<F) $@
+	$(Q)test -f $@ || \
+	    ln -nfs $(subst $(space),/,$(patsubst %,..,$(subst /, ,$(obj))))/source/common/efi/$(<F) $@
 
 clean-files += $(patsubst %.o, %.c, $(EFIOBJ-y:.init.o=.o) $(EFIOBJ-))
 
diff --git a/xen/common/efi/stub.c b/xen/common/efi/stub.c
new file mode 100644
index 0000000000..15694632c2
--- /dev/null
+++ b/xen/common/efi/stub.c
@@ -0,0 +1,32 @@
+#include <xen/efi.h>
+#include <xen/errno.h>
+#include <xen/lib.h>
+
+bool efi_enabled(unsigned int feature)
+{
+    return false;
+}
+
+bool efi_rs_using_pgtables(void)
+{
+    return false;
+}
+
+unsigned long efi_get_time(void)
+{
+    BUG();
+    return 0;
+}
+
+void efi_halt_system(void) { }
+void efi_reset_system(bool warm) { }
+
+int efi_get_info(uint32_t idx, union xenpf_efi_info *info)
+{
+    return -ENOSYS;
+}
+
+int efi_runtime_call(struct xenpf_efi_runtime_call *op)
+{
+    return -ENOSYS;
+}
-- 
2.25.1


