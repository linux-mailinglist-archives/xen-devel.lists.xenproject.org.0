Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC954619437
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 11:09:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437436.691877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqtd6-00058O-Dc; Fri, 04 Nov 2022 10:08:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437436.691877; Fri, 04 Nov 2022 10:08:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqtd6-00054A-8Y; Fri, 04 Nov 2022 10:08:52 +0000
Received: by outflank-mailman (input) for mailman id 437436;
 Fri, 04 Nov 2022 10:08:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U/tm=3E=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oqtd4-0002Y7-Si
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 10:08:50 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2041.outbound.protection.outlook.com [40.107.20.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id acb06ebe-5c28-11ed-91b5-6bf2151ebd3b;
 Fri, 04 Nov 2022 11:08:48 +0100 (CET)
Received: from DU2P250CA0022.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::27)
 by VI1PR08MB10148.eurprd08.prod.outlook.com (2603:10a6:800:1bc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 4 Nov
 2022 10:08:43 +0000
Received: from DBAEUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:231:cafe::72) by DU2P250CA0022.outlook.office365.com
 (2603:10a6:10:231::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20 via Frontend
 Transport; Fri, 4 Nov 2022 10:08:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT053.mail.protection.outlook.com (100.127.142.121) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Fri, 4 Nov 2022 10:08:43 +0000
Received: ("Tessian outbound 6c699027a257:v130");
 Fri, 04 Nov 2022 10:08:43 +0000
Received: from a42c91438bf7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 031499ED-9F8F-44FF-8D7E-DB1FE3AC410E.1; 
 Fri, 04 Nov 2022 10:08:35 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a42c91438bf7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 04 Nov 2022 10:08:35 +0000
Received: from DB6PR07CA0009.eurprd07.prod.outlook.com (2603:10a6:6:2d::19) by
 PAXPR08MB6365.eurprd08.prod.outlook.com (2603:10a6:102:156::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.8; Fri, 4 Nov
 2022 10:08:33 +0000
Received: from DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2d:cafe::28) by DB6PR07CA0009.outlook.office365.com
 (2603:10a6:6:2d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20 via Frontend
 Transport; Fri, 4 Nov 2022 10:08:33 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT019.mail.protection.outlook.com (100.127.142.129) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5791.20 via Frontend Transport; Fri, 4 Nov 2022 10:08:32 +0000
Received: from AZ-NEU-EX02.Emea.Arm.com (10.251.26.5) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Fri, 4 Nov
 2022 10:08:31 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX02.Emea.Arm.com
 (10.251.26.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Fri, 4 Nov
 2022 10:08:31 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Fri, 4 Nov 2022 10:08:28 +0000
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
X-Inumbo-ID: acb06ebe-5c28-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=BwI1AvqIHZV4Vw+TW+hJYYRrAW+xdonC1AEbdYHyyc5fvgdiyo+BaZp7TwaQ9fH0HqzAuUbRxRoxnFLngwVWvLCVemOCviSc3i18+yF/k+PN9n09A46RqD0KvSidKOAvURfdooTGAlN7ej4438Wpj0mkFP0lKc40BbLnLO+jzUKeUxHgRdeMIwuV4r5Kk6BGEHVtGPYjhw1HYdoyssDx9jD1GXkO5N+OTqRB7CfZupTWSd6ticQAYx1P+6//gXo9vYw4/5nIdrZ+BqurcjHosPwW5gpGGmWjKBoNpxvHJ+VyAqX2tRQDD+F4ujT1KtCbNQuW6P4OLvURhsOwjWw5lA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JxFUFRTByzafTsQvGgiHQen1r54AmXHs7AvHgF/hOI8=;
 b=fv/P3KmUxG0FObaz/aBBI7tVj1oWt0tLKjZUltfFiYeC0RrSm7PPCF5WXHsDwC0w61dIJ/sjfHHNC/F2eR1UFMLMhvZ86Fet9+q3+UgYqCURnt8jL6DU/n+9wzz1aJppjUCTjaXIfmkH4NhWVTAJlhR5hbbXOwPvEfcjyaJTpbh3uooxJK4vKoJpEsDiD9qtQe/bFKFohw5YIj0sny75S/e295+qUtRfagnHtnZMGPCRAQzRS9a38AHCyAWm9+ZFcb1DRMMX42iWW2wvfRvmReG+6np5Rm7tIKBOoXN8KqXp8FbQtrBxJqbyv0uj1C9IPzaqvK8p3e2YqIelzsH0PA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxFUFRTByzafTsQvGgiHQen1r54AmXHs7AvHgF/hOI8=;
 b=cC52TnJAaWyIAxUK0geNStHcqnYWTMCzW/VhdXrJfJQhA2IQ6Fh8P2MTr95trxfuX+ftAlbRX9IjejXQ9VVsUQInygitJsh06o4rTBvV8+/VO0Sb3mAxJqPKbeSWfTDxMT641BbodmHlGtYgqx7UGdW4u+6jfrypM81HPsHj8BI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 114410213fcd4c4b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UvcDROOhAJ0TSZz8GH8uDrK68hdrot5zz1BNKCt2K0uVKy/hWR1PvNudue+3TsL8EQ8O7ZNC90OA+U20akTnRUllz5/fIdGga1ZppIOP2YTz6oJfdqOosXBFPG1+Qk1XUIr2AFBg4sO7TVX56Dq/NWS6JFH3UqdGbtjBpXVKJXDsm7HhpyzUnEU+9ePd9mJ588Fk+3oiz1XyV2bWyEUdtwYyZmlMYGTd7hNgdIB+qeHB05X5eXtunlMlDdHBgSTzYc3XHyMz1BppvwWt1F/SF8MrldBNSynCpIZh82uf7f5COXOEmM1n6x4hPxk3Ael/RTYKvcp9yGxW1Xd3Aw7mzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JxFUFRTByzafTsQvGgiHQen1r54AmXHs7AvHgF/hOI8=;
 b=ocw5XTGgfRI+XySzSaSaMWQYIwh+QIcLM7rUNLHWNKMcbklP93bvNcR2JcZ+uCiXYeuEp8xjByHJSYJbGgDGyw50QS+PmXTlxT7W4U5hWCJtvGSckGNlJ1S9HK4aRbmH3yaXVs4RzPoNI5ogYkyt8b2oPbLgrPjufofKMJFoJ5mqdQfc7LHRy0k7ahoZEnO2iI/QVvdzxeOFw9K8/GuuQsnRcuz5rLAd65kDdZaPjIydYAY9ArYxo5qW23yxAkzMiN43GwMRNkhklexx8I3Llln+gxUJiYR5RX/Nd09lH2E0Jj/GBa2bawmVaXtPhg5Qgcf3e6NegDTcSn1Lzttafg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxFUFRTByzafTsQvGgiHQen1r54AmXHs7AvHgF/hOI8=;
 b=cC52TnJAaWyIAxUK0geNStHcqnYWTMCzW/VhdXrJfJQhA2IQ6Fh8P2MTr95trxfuX+ftAlbRX9IjejXQ9VVsUQInygitJsh06o4rTBvV8+/VO0Sb3mAxJqPKbeSWfTDxMT641BbodmHlGtYgqx7UGdW4u+6jfrypM81HPsHj8BI=
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
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH v6 08/11] xen/arm64: move MMU related code from head.S to head_mmu.S
Date: Fri, 4 Nov 2022 18:07:38 +0800
Message-ID: <20221104100741.2176307-9-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104100741.2176307-1-wei.chen@arm.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	DBAEUR03FT019:EE_|PAXPR08MB6365:EE_|DBAEUR03FT053:EE_|VI1PR08MB10148:EE_
X-MS-Office365-Filtering-Correlation-Id: 8822de9f-8cb4-4ee3-4804-08dabe4c8df9
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GLMKSS+p4VLEq83z1/2enYx4TBZH/nNind0YBFz0jsAFNBDS6pFqcd22cQvcx9mY+H9f2ijYMnC69VFGkr9oSKwm8g/6vgOM2XRvk+QP+myz9pin4lf0R3MC3h2HdcCiTqcneSk7ESEO6XJPXxDJiNeZD/22cy0CvtqQra5SgYC9tIGBRHpvgj+BUfXuTy9vBhJLq/Ks4DMlpQtDK/ebGJ1UZLWjD8H1TxaDCJb6SxMEAEoRtIGI2urrcjCxvXbKMm94ujg5OMa14MvToiM+dgG5/7+NG3ug5uNh2CdrCUY3ax0ZBWpMzG94bnpf7WbW1VYiiyp+wB61IfvGWxEUgVAcNCx4dCWzf3GXi2Wi+yxicHKN64lX9AuNhcIOVXN+7+AJVjVNh+pVxPkP1MuLzQRiocZMchS24P9eL5vlAmaq4AcfXjisn4A7D2yL3MRau723kAPhczKbNtE8WvXt6BhPNFre52hPQCXP+PQmk5KGrkn+Gz1hHmk7LSzpxeeTsOBfUp+pMi6hgbjL02u5MB0TdOH6dNpLmELIR4OrXzuqWfdCRgoe63KzCe7lIilxw/xkUYlmCmtpVmkimzCQkO++Xdgg99foL9asDji9GLBK3ljlGO98VuIAvuMN33NrIHS2j5EEQNLa9cMrTDXO/G8BSTzDqvtsadzQ3QYSpVzrcKDsF/8hymA7dzWVtemDS86n06tORT931AV/q18wP4ujiKPbzy2xQCYgiRIbtS87KZv1CxW/P/JxvsumAPHSVdU2RMbYeMJSNIAEnhjYsRrjhJaj93s1phGyEfT6ohFl/xH31hUKYqhNL7ur8KcC
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(136003)(39860400002)(346002)(451199015)(36840700001)(40470700004)(46966006)(81166007)(356005)(478600001)(82310400005)(82740400003)(86362001)(6666004)(36860700001)(186003)(336012)(8936002)(36756003)(4326008)(41300700001)(426003)(8676002)(47076005)(316002)(54906003)(40480700001)(6916009)(7696005)(70586007)(83380400001)(70206006)(1076003)(2906002)(26005)(40460700003)(5660300002)(2616005)(44832011)(30864003)(2004002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6365
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6e00a528-2004-48be-d5b7-08dabe4c8796
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6DZEh0znKrCuZRmcivmYDqm5RYW7LKXFW4X+2RlOCiRC/ZpSuZMOp4ZDfWnZg+e7vCefhtrXrVtZww9ox2QEGxmWMZd7fnbnPTsUz7C+UgWc+877xfurRLUPzHfP2mvu+5xxUOKF3cJ2lS2ODKhMYzCaKteYo+kD/ERHUnyUntglEubcR19WxkAHAuCY0iQYwenpiOi7512B5BgB4ChY5mj1IC1JRsmEIPTwxhX9TSpskNHs65rM4joB4mjxGZcg8Iz+uXnDya3FO22Xm7T5HrCgzqqyYYz5XTfe4oACVtBLB2qWnUHwzyC6E6HmngpI38dL67tbnNwEGe+o2+Nd8eyBGPkGzk8dnaVn4IBtXvnEfnkJ+erPG3JQ5Nlf6eCi/DgqkT9d15tk18FgKuufZr3SbpDHAOa5B2KzmLP2B03iXwqq1O7ZTW3HruROtG0iViCqgQN+kmFj4mDgNsxWUeSpqnQJLtPwXDDgXmPxAgxEg14cmrePooj/5dYvuiX/58w4VDfDGh3X8uvKSTivnKVAUdGhI1Z9NdtyMWbvfWQ6k9PJIFsj9qzVPYGUGmz83nWfuNoCIYTuNX0vyvH7xLa8H4wKiGYvIxjRqJRsJ7DX7pnqn4I5Gfa73N7WOVey1iuDr45a5SQ4v7Xbi+2iF6s8Kc4s1rivL76FtjNYmvHhKR8jMqwvR2O6J0twp4ABqmnTYCz+3aim5U7/zoUR4yfSZDDkLlQdnzT+vetujqE48kRzvQdBX1gRzEpBPsVnx9klCOczI5DYlNwSwcdqquLjd2y5PRX8HtwVogvwowk=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(396003)(346002)(451199015)(40470700004)(46966006)(36840700001)(1076003)(54906003)(2906002)(86362001)(36756003)(81166007)(82740400003)(40480700001)(5660300002)(7696005)(336012)(26005)(426003)(44832011)(83380400001)(478600001)(36860700001)(82310400005)(6666004)(47076005)(40460700003)(186003)(4326008)(6916009)(316002)(70206006)(2616005)(30864003)(8936002)(70586007)(8676002)(41300700001)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 10:08:43.5062
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8822de9f-8cb4-4ee3-4804-08dabe4c8df9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10148

There are lots of MMU specific code in head.S. This code will not
be used in MPU systems. If we use #ifdef to gate them, the code
will become messy and hard to maintain. So we move MMU related
code to head_mmu.S, and keep common code still in head.S.

As we need to access "fail" and "puts" functions out of assembly
file, so we have to export them in this patch. And the assembly
macros: adr_l and load_paddr will be used by MMU and MPU later,
so we move them to macros.h.

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/arm64/Makefile             |   3 +
 xen/arch/arm/arm64/head.S               | 407 +-----------------------
 xen/arch/arm/arm64/head_mmu.S           | 364 +++++++++++++++++++++
 xen/arch/arm/include/asm/arm64/macros.h |  52 ++-
 4 files changed, 432 insertions(+), 394 deletions(-)
 create mode 100644 xen/arch/arm/arm64/head_mmu.S

diff --git a/xen/arch/arm/arm64/Makefile b/xen/arch/arm/arm64/Makefile
index 6d507da0d4..22da2f54b5 100644
--- a/xen/arch/arm/arm64/Makefile
+++ b/xen/arch/arm/arm64/Makefile
@@ -8,6 +8,9 @@ obj-y += domctl.o
 obj-y += domain.o
 obj-y += entry.o
 obj-y += head.o
+ifneq ($(CONFIG_HAS_MPU),y)
+obj-y += head_mmu.o
+endif
 obj-y += insn.o
 obj-$(CONFIG_LIVEPATCH) += livepatch.o
 obj-y += smc.o
diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index ccedf20dc7..d9a8da9120 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -25,17 +25,6 @@
 #include <efi/efierr.h>
 #include <asm/arm64/efibind.h>
 
-#define PT_PT     0xf7f /* nG=1 AF=1 SH=11 AP=01 NS=1 ATTR=111 T=1 P=1 */
-#define PT_MEM    0xf7d /* nG=1 AF=1 SH=11 AP=01 NS=1 ATTR=111 T=0 P=1 */
-#define PT_MEM_L3 0xf7f /* nG=1 AF=1 SH=11 AP=01 NS=1 ATTR=111 T=1 P=1 */
-#define PT_DEV    0xe71 /* nG=1 AF=1 SH=10 AP=01 NS=1 ATTR=100 T=0 P=1 */
-#define PT_DEV_L3 0xe73 /* nG=1 AF=1 SH=10 AP=01 NS=1 ATTR=100 T=1 P=1 */
-
-/* Convenience defines to get slot used by Xen mapping. */
-#define XEN_ZEROETH_SLOT    zeroeth_table_offset(XEN_VIRT_START)
-#define XEN_FIRST_SLOT      first_table_offset(XEN_VIRT_START)
-#define XEN_SECOND_SLOT     second_table_offset(XEN_VIRT_START)
-
 #define __HEAD_FLAG_PAGE_SIZE   ((PAGE_SHIFT - 10) / 2)
 
 #define __HEAD_FLAG_PHYS_BASE   1
@@ -82,73 +71,22 @@
  *  x30 - lr
  */
 
-#ifdef CONFIG_EARLY_PRINTK
-/*
- * Macro to print a string to the UART, if there is one.
- *
- * Clobbers x0 - x3
- */
-#define PRINT(_s)          \
-        mov   x3, lr ;     \
-        adr   x0, 98f ;    \
-        bl    puts    ;    \
-        mov   lr, x3 ;     \
-        RODATA_STR(98, _s)
+.section .text.header, "ax", %progbits
+/*.aarch64*/
 
 /*
- * Macro to print the value of register \xb
+ * Kernel startup entry point.
+ * ---------------------------
  *
- * Clobbers x0 - x4
- */
-.macro print_reg xb
-        mov   x0, \xb
-        mov   x4, lr
-        bl    putn
-        mov   lr, x4
-.endm
-
-#else /* CONFIG_EARLY_PRINTK */
-#define PRINT(s)
-
-.macro print_reg xb
-.endm
-
-#endif /* !CONFIG_EARLY_PRINTK */
-
-/*
- * Pseudo-op for PC relative adr <reg>, <symbol> where <symbol> is
- * within the range +/- 4GB of the PC.
+ * The requirements are:
+ *   MMU = off, D-cache = off, I-cache = on or off,
+ *   x0 = physical address to the FDT blob.
  *
- * @dst: destination register (64 bit wide)
- * @sym: name of the symbol
+ * This must be the very first address in the loaded image.
+ * It should be linked at XEN_VIRT_START, and loaded at any
+ * 4K-aligned address.  All of text+data+bss must fit in 2MB,
+ * or the initial pagetable code below will need adjustment.
  */
-.macro  adr_l, dst, sym
-        adrp \dst, \sym
-        add  \dst, \dst, :lo12:\sym
-.endm
-
-/* Load the physical address of a symbol into xb */
-.macro load_paddr xb, sym
-        ldr \xb, =\sym
-        add \xb, \xb, x20
-.endm
-
-        .section .text.header, "ax", %progbits
-        /*.aarch64*/
-
-        /*
-         * Kernel startup entry point.
-         * ---------------------------
-         *
-         * The requirements are:
-         *   MMU = off, D-cache = off, I-cache = on or off,
-         *   x0 = physical address to the FDT blob.
-         *
-         * This must be the very first address in the loaded image.
-         * It should be linked at XEN_VIRT_START, and loaded at any
-         * 4K-aligned address.  All of text+data+bss must fit in 2MB,
-         * or the initial pagetable code below will need adjustment.
-         */
 
 GLOBAL(start)
         /*
@@ -497,296 +435,6 @@ cpu_init:
         ret
 ENDPROC(cpu_init)
 
-/*
- * Macro to find the slot number at a given page-table level
- *
- * slot:     slot computed
- * virt:     virtual address
- * lvl:      page-table level
- */
-.macro get_table_slot, slot, virt, lvl
-        ubfx  \slot, \virt, #XEN_PT_LEVEL_SHIFT(\lvl), #XEN_PT_LPAE_SHIFT
-.endm
-
-/*
- * Macro to create a page table entry in \ptbl to \tbl
- *
- * ptbl:    table symbol where the entry will be created
- * tbl:     table symbol to point to
- * virt:    virtual address
- * lvl:     page-table level
- * tmp1:    scratch register
- * tmp2:    scratch register
- * tmp3:    scratch register
- *
- * Preserves \virt
- * Clobbers \tmp1, \tmp2, \tmp3
- *
- * Also use x20 for the phys offset.
- *
- * Note that all parameters using registers should be distinct.
- */
-.macro create_table_entry, ptbl, tbl, virt, lvl, tmp1, tmp2, tmp3
-        get_table_slot \tmp1, \virt, \lvl   /* \tmp1 := slot in \tlb */
-
-        load_paddr \tmp2, \tbl
-        mov   \tmp3, #PT_PT                 /* \tmp3 := right for linear PT */
-        orr   \tmp3, \tmp3, \tmp2           /*          + \tlb paddr */
-
-        adr_l \tmp2, \ptbl
-
-        str   \tmp3, [\tmp2, \tmp1, lsl #3]
-.endm
-
-/*
- * Macro to create a mapping entry in \tbl to \phys. Only mapping in 3rd
- * level table (i.e page granularity) is supported.
- *
- * ptbl:     table symbol where the entry will be created
- * virt:    virtual address
- * phys:    physical address (should be page aligned)
- * tmp1:    scratch register
- * tmp2:    scratch register
- * tmp3:    scratch register
- * type:    mapping type. If not specified it will be normal memory (PT_MEM_L3)
- *
- * Preserves \virt, \phys
- * Clobbers \tmp1, \tmp2, \tmp3
- *
- * Note that all parameters using registers should be distinct.
- */
-.macro create_mapping_entry, ptbl, virt, phys, tmp1, tmp2, tmp3, type=PT_MEM_L3
-        and   \tmp3, \phys, #THIRD_MASK     /* \tmp3 := PAGE_ALIGNED(phys) */
-
-        get_table_slot \tmp1, \virt, 3      /* \tmp1 := slot in \tlb */
-
-        mov   \tmp2, #\type                 /* \tmp2 := right for section PT */
-        orr   \tmp2, \tmp2, \tmp3           /*          + PAGE_ALIGNED(phys) */
-
-        adr_l \tmp3, \ptbl
-
-        str   \tmp2, [\tmp3, \tmp1, lsl #3]
-.endm
-
-/*
- * Rebuild the boot pagetable's first-level entries. The structure
- * is described in mm.c.
- *
- * After the CPU enables paging it will add the fixmap mapping
- * to these page tables, however this may clash with the 1:1
- * mapping. So each CPU must rebuild the page tables here with
- * the 1:1 in place.
- *
- * Inputs:
- *   x19: paddr(start)
- *   x20: phys offset
- *
- * Clobbers x0 - x4
- */
-create_page_tables:
-        /* Prepare the page-tables for mapping Xen */
-        ldr   x0, =XEN_VIRT_START
-        create_table_entry boot_pgtable, boot_first, x0, 0, x1, x2, x3
-        create_table_entry boot_first, boot_second, x0, 1, x1, x2, x3
-        create_table_entry boot_second, boot_third, x0, 2, x1, x2, x3
-
-        /* Map Xen */
-        adr_l x4, boot_third
-
-        lsr   x2, x19, #THIRD_SHIFT  /* Base address for 4K mapping */
-        lsl   x2, x2, #THIRD_SHIFT
-        mov   x3, #PT_MEM_L3         /* x2 := Section map */
-        orr   x2, x2, x3
-
-        /* ... map of vaddr(start) in boot_third */
-        mov   x1, xzr
-1:      str   x2, [x4, x1]           /* Map vaddr(start) */
-        add   x2, x2, #PAGE_SIZE     /* Next page */
-        add   x1, x1, #8             /* Next slot */
-        cmp   x1, #(XEN_PT_LPAE_ENTRIES<<3) /* 512 entries per page */
-        b.lt  1b
-
-        /*
-         * If Xen is loaded at exactly XEN_VIRT_START then we don't
-         * need an additional 1:1 mapping, the virtual mapping will
-         * suffice.
-         */
-        cmp   x19, #XEN_VIRT_START
-        bne   1f
-        ret
-1:
-        /*
-         * Setup the 1:1 mapping so we can turn the MMU on. Note that
-         * only the first page of Xen will be part of the 1:1 mapping.
-         */
-
-        /*
-         * Find the zeroeth slot used. If the slot is not
-         * XEN_ZEROETH_SLOT, then the 1:1 mapping will use its own set of
-         * page-tables from the first level.
-         */
-        get_table_slot x0, x19, 0       /* x0 := zeroeth slot */
-        cmp   x0, #XEN_ZEROETH_SLOT
-        beq   1f
-        create_table_entry boot_pgtable, boot_first_id, x19, 0, x0, x1, x2
-        b     link_from_first_id
-
-1:
-        /*
-         * Find the first slot used. If the slot is not XEN_FIRST_SLOT,
-         * then the 1:1 mapping will use its own set of page-tables from
-         * the second level.
-         */
-        get_table_slot x0, x19, 1      /* x0 := first slot */
-        cmp   x0, #XEN_FIRST_SLOT
-        beq   1f
-        create_table_entry boot_first, boot_second_id, x19, 1, x0, x1, x2
-        b     link_from_second_id
-
-1:
-        /*
-         * Find the second slot used. If the slot is XEN_SECOND_SLOT, then the
-         * 1:1 mapping will use its own set of page-tables from the
-         * third level. For slot XEN_SECOND_SLOT, Xen is not yet able to handle
-         * it.
-         */
-        get_table_slot x0, x19, 2     /* x0 := second slot */
-        cmp   x0, #XEN_SECOND_SLOT
-        beq   virtphys_clash
-        create_table_entry boot_second, boot_third_id, x19, 2, x0, x1, x2
-        b     link_from_third_id
-
-link_from_first_id:
-        create_table_entry boot_first_id, boot_second_id, x19, 1, x0, x1, x2
-link_from_second_id:
-        create_table_entry boot_second_id, boot_third_id, x19, 2, x0, x1, x2
-link_from_third_id:
-        create_mapping_entry boot_third_id, x19, x19, x0, x1, x2
-        ret
-
-virtphys_clash:
-        /* Identity map clashes with boot_third, which we cannot handle yet */
-        PRINT("- Unable to build boot page tables - virt and phys addresses clash. -\r\n")
-        b     fail
-ENDPROC(create_page_tables)
-
-/*
- * Turn on the Data Cache and the MMU. The function will return on the 1:1
- * mapping. In other word, the caller is responsible to switch to the runtime
- * mapping.
- *
- * Clobbers x0 - x3
- */
-enable_mmu:
-        PRINT("- Turning on paging -\r\n")
-
-        /*
-         * The state of the TLBs is unknown before turning on the MMU.
-         * Flush them to avoid stale one.
-         */
-        tlbi  alle2                  /* Flush hypervisor TLBs */
-        dsb   nsh
-
-        /* Write Xen's PT's paddr into TTBR0_EL2 */
-        load_paddr x0, boot_pgtable
-        msr   TTBR0_EL2, x0
-        isb
-
-        mrs   x0, SCTLR_EL2
-        orr   x0, x0, #SCTLR_Axx_ELx_M  /* Enable MMU */
-        orr   x0, x0, #SCTLR_Axx_ELx_C  /* Enable D-cache */
-        dsb   sy                     /* Flush PTE writes and finish reads */
-        msr   SCTLR_EL2, x0          /* now paging is enabled */
-        isb                          /* Now, flush the icache */
-        ret
-ENDPROC(enable_mmu)
-
-/*
- * Remove the 1:1 map from the page-tables. It is not easy to keep track
- * where the 1:1 map was mapped, so we will look for the top-level entry
- * exclusive to the 1:1 map and remove it.
- *
- * Inputs:
- *   x19: paddr(start)
- *
- * Clobbers x0 - x1
- */
-remove_identity_mapping:
-        /*
-         * Find the zeroeth slot used. Remove the entry from zeroeth
-         * table if the slot is not XEN_ZEROETH_SLOT.
-         */
-        get_table_slot x1, x19, 0       /* x1 := zeroeth slot */
-        cmp   x1, #XEN_ZEROETH_SLOT
-        beq   1f
-        /* It is not in slot XEN_ZEROETH_SLOT, remove the entry. */
-        ldr   x0, =boot_pgtable         /* x0 := root table */
-        str   xzr, [x0, x1, lsl #3]
-        b     identity_mapping_removed
-
-1:
-        /*
-         * Find the first slot used. Remove the entry for the first
-         * table if the slot is not XEN_FIRST_SLOT.
-         */
-        get_table_slot x1, x19, 1       /* x1 := first slot */
-        cmp   x1, #XEN_FIRST_SLOT
-        beq   1f
-        /* It is not in slot XEN_FIRST_SLOT, remove the entry. */
-        ldr   x0, =boot_first           /* x0 := first table */
-        str   xzr, [x0, x1, lsl #3]
-        b     identity_mapping_removed
-
-1:
-        /*
-         * Find the second slot used. Remove the entry for the first
-         * table if the slot is not XEN_SECOND_SLOT.
-         */
-        get_table_slot x1, x19, 2       /* x1 := second slot */
-        cmp   x1, #XEN_SECOND_SLOT
-        beq   identity_mapping_removed
-        /* It is not in slot 1, remove the entry */
-        ldr   x0, =boot_second          /* x0 := second table */
-        str   xzr, [x0, x1, lsl #3]
-
-identity_mapping_removed:
-        /* See asm/arm64/flushtlb.h for the explanation of the sequence. */
-        dsb   nshst
-        tlbi  alle2
-        dsb   nsh
-        isb
-
-        ret
-ENDPROC(remove_identity_mapping)
-
-/*
- * Map the UART in the fixmap (when earlyprintk is used) and hook the
- * fixmap table in the page tables.
- *
- * The fixmap cannot be mapped in create_page_tables because it may
- * clash with the 1:1 mapping.
- *
- * Inputs:
- *   x20: Physical offset
- *   x23: Early UART base physical address
- *
- * Clobbers x0 - x3
- */
-setup_fixmap:
-#ifdef CONFIG_EARLY_PRINTK
-        /* Add UART to the fixmap table */
-        ldr   x0, =EARLY_UART_VIRTUAL_ADDRESS
-        create_mapping_entry xen_fixmap, x0, x23, x1, x2, x3, type=PT_DEV_L3
-#endif
-        /* Map fixmap into boot_second */
-        ldr   x0, =FIXMAP_ADDR(0)
-        create_table_entry boot_second, xen_fixmap, x0, 2, x1, x2, x3
-        /* Ensure any page table updates made above have occurred. */
-        dsb   nshst
-
-        ret
-ENDPROC(setup_fixmap)
-
 /*
  * Setup the initial stack and jump to the C world
  *
@@ -810,41 +458,14 @@ launch:
 ENDPROC(launch)
 
 /* Fail-stop */
-fail:   PRINT("- Boot failed -\r\n")
+ENTRY(fail)
+        PRINT("- Boot failed -\r\n")
 1:      wfe
         b     1b
 ENDPROC(fail)
 
 GLOBAL(_end_boot)
 
-/*
- * Switch TTBR
- *
- * x0    ttbr
- *
- * TODO: This code does not comply with break-before-make.
- */
-ENTRY(switch_ttbr)
-        dsb   sy                     /* Ensure the flushes happen before
-                                      * continuing */
-        isb                          /* Ensure synchronization with previous
-                                      * changes to text */
-        tlbi   alle2                 /* Flush hypervisor TLB */
-        ic     iallu                 /* Flush I-cache */
-        dsb    sy                    /* Ensure completion of TLB flush */
-        isb
-
-        msr    TTBR0_EL2, x0
-
-        isb                          /* Ensure synchronization with previous
-                                      * changes to text */
-        tlbi   alle2                 /* Flush hypervisor TLB */
-        ic     iallu                 /* Flush I-cache */
-        dsb    sy                    /* Ensure completion of TLB flush */
-        isb
-
-        ret
-ENDPROC(switch_ttbr)
 
 #ifdef CONFIG_EARLY_PRINTK
 /*
@@ -868,7 +489,7 @@ ENDPROC(init_uart)
  * x0: Nul-terminated string to print.
  * x23: Early UART base address
  * Clobbers x0-x1 */
-puts:
+ENTRY(puts)
         early_uart_ready x23, 1
         ldrb  w1, [x0], #1           /* Load next char */
         cbz   w1, 1f                 /* Exit on nul */
diff --git a/xen/arch/arm/arm64/head_mmu.S b/xen/arch/arm/arm64/head_mmu.S
new file mode 100644
index 0000000000..1a3df81a38
--- /dev/null
+++ b/xen/arch/arm/arm64/head_mmu.S
@@ -0,0 +1,364 @@
+/*
+ * xen/arch/arm/head_mmu.S
+ *
+ * Start-of-day code for an ARMv8-A.
+ *
+ * Ian Campbell <ian.campbell@citrix.com>
+ * Copyright (c) 2012 Citrix Systems.
+ *
+ * Based on ARMv7-A head.S by
+ * Tim Deegan <tim@xen.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <asm/page.h>
+#include <asm/early_printk.h>
+
+#define PT_PT     0xf7f /* nG=1 AF=1 SH=11 AP=01 NS=1 ATTR=111 T=1 P=1 */
+#define PT_MEM    0xf7d /* nG=1 AF=1 SH=11 AP=01 NS=1 ATTR=111 T=0 P=1 */
+#define PT_MEM_L3 0xf7f /* nG=1 AF=1 SH=11 AP=01 NS=1 ATTR=111 T=1 P=1 */
+#define PT_DEV    0xe71 /* nG=1 AF=1 SH=10 AP=01 NS=1 ATTR=100 T=0 P=1 */
+#define PT_DEV_L3 0xe73 /* nG=1 AF=1 SH=10 AP=01 NS=1 ATTR=100 T=1 P=1 */
+
+/* Convenience defines to get slot used by Xen mapping. */
+#define XEN_ZEROETH_SLOT    zeroeth_table_offset(XEN_VIRT_START)
+#define XEN_FIRST_SLOT      first_table_offset(XEN_VIRT_START)
+#define XEN_SECOND_SLOT     second_table_offset(XEN_VIRT_START)
+
+/*
+ * Macro to find the slot number at a given page-table level
+ *
+ * slot:     slot computed
+ * virt:     virtual address
+ * lvl:      page-table level
+ */
+.macro get_table_slot, slot, virt, lvl
+        ubfx  \slot, \virt, #XEN_PT_LEVEL_SHIFT(\lvl), #XEN_PT_LPAE_SHIFT
+.endm
+
+/*
+ * Macro to create a page table entry in \ptbl to \tbl
+ *
+ * ptbl:    table symbol where the entry will be created
+ * tbl:     table symbol to point to
+ * virt:    virtual address
+ * lvl:     page-table level
+ * tmp1:    scratch register
+ * tmp2:    scratch register
+ * tmp3:    scratch register
+ *
+ * Preserves \virt
+ * Clobbers \tmp1, \tmp2, \tmp3
+ *
+ * Also use x20 for the phys offset.
+ *
+ * Note that all parameters using registers should be distinct.
+ */
+.macro create_table_entry, ptbl, tbl, virt, lvl, tmp1, tmp2, tmp3
+        get_table_slot \tmp1, \virt, \lvl   /* \tmp1 := slot in \tlb */
+
+        load_paddr \tmp2, \tbl
+        mov   \tmp3, #PT_PT                 /* \tmp3 := right for linear PT */
+        orr   \tmp3, \tmp3, \tmp2           /*          + \tlb paddr */
+
+        adr_l \tmp2, \ptbl
+
+        str   \tmp3, [\tmp2, \tmp1, lsl #3]
+.endm
+
+/*
+ * Macro to create a mapping entry in \tbl to \phys. Only mapping in 3rd
+ * level table (i.e page granularity) is supported.
+ *
+ * ptbl:     table symbol where the entry will be created
+ * virt:    virtual address
+ * phys:    physical address (should be page aligned)
+ * tmp1:    scratch register
+ * tmp2:    scratch register
+ * tmp3:    scratch register
+ * type:    mapping type. If not specified it will be normal memory (PT_MEM_L3)
+ *
+ * Preserves \virt, \phys
+ * Clobbers \tmp1, \tmp2, \tmp3
+ *
+ * Note that all parameters using registers should be distinct.
+ */
+.macro create_mapping_entry, ptbl, virt, phys, tmp1, tmp2, tmp3, type=PT_MEM_L3
+        and   \tmp3, \phys, #THIRD_MASK     /* \tmp3 := PAGE_ALIGNED(phys) */
+
+        get_table_slot \tmp1, \virt, 3      /* \tmp1 := slot in \tlb */
+
+        mov   \tmp2, #\type                 /* \tmp2 := right for section PT */
+        orr   \tmp2, \tmp2, \tmp3           /*          + PAGE_ALIGNED(phys) */
+
+        adr_l \tmp3, \ptbl
+
+        str   \tmp2, [\tmp3, \tmp1, lsl #3]
+.endm
+
+.section .text.header, "ax", %progbits
+/*.aarch64*/
+
+/*
+ * Rebuild the boot pagetable's first-level entries. The structure
+ * is described in mm.c.
+ *
+ * After the CPU enables paging it will add the fixmap mapping
+ * to these page tables, however this may clash with the 1:1
+ * mapping. So each CPU must rebuild the page tables here with
+ * the 1:1 in place.
+ *
+ * Inputs:
+ *   x19: paddr(start)
+ *   x20: phys offset
+ *
+ * Clobbers x0 - x4
+ */
+ENTRY(create_page_tables)
+        /* Prepare the page-tables for mapping Xen */
+        ldr   x0, =XEN_VIRT_START
+        create_table_entry boot_pgtable, boot_first, x0, 0, x1, x2, x3
+        create_table_entry boot_first, boot_second, x0, 1, x1, x2, x3
+        create_table_entry boot_second, boot_third, x0, 2, x1, x2, x3
+
+        /* Map Xen */
+        adr_l x4, boot_third
+
+        lsr   x2, x19, #THIRD_SHIFT  /* Base address for 4K mapping */
+        lsl   x2, x2, #THIRD_SHIFT
+        mov   x3, #PT_MEM_L3         /* x2 := Section map */
+        orr   x2, x2, x3
+
+        /* ... map of vaddr(start) in boot_third */
+        mov   x1, xzr
+1:      str   x2, [x4, x1]           /* Map vaddr(start) */
+        add   x2, x2, #PAGE_SIZE     /* Next page */
+        add   x1, x1, #8             /* Next slot */
+        cmp   x1, #(XEN_PT_LPAE_ENTRIES<<3) /* 512 entries per page */
+        b.lt  1b
+
+        /*
+         * If Xen is loaded at exactly XEN_VIRT_START then we don't
+         * need an additional 1:1 mapping, the virtual mapping will
+         * suffice.
+         */
+        cmp   x19, #XEN_VIRT_START
+        bne   1f
+        ret
+1:
+        /*
+         * Setup the 1:1 mapping so we can turn the MMU on. Note that
+         * only the first page of Xen will be part of the 1:1 mapping.
+         */
+
+        /*
+         * Find the zeroeth slot used. If the slot is not
+         * XEN_ZEROETH_SLOT, then the 1:1 mapping will use its own set of
+         * page-tables from the first level.
+         */
+        get_table_slot x0, x19, 0       /* x0 := zeroeth slot */
+        cmp   x0, #XEN_ZEROETH_SLOT
+        beq   1f
+        create_table_entry boot_pgtable, boot_first_id, x19, 0, x0, x1, x2
+        b     link_from_first_id
+
+1:
+        /*
+         * Find the first slot used. If the slot is not XEN_FIRST_SLOT,
+         * then the 1:1 mapping will use its own set of page-tables from
+         * the second level.
+         */
+        get_table_slot x0, x19, 1      /* x0 := first slot */
+        cmp   x0, #XEN_FIRST_SLOT
+        beq   1f
+        create_table_entry boot_first, boot_second_id, x19, 1, x0, x1, x2
+        b     link_from_second_id
+
+1:
+        /*
+         * Find the second slot used. If the slot is XEN_SECOND_SLOT, then the
+         * 1:1 mapping will use its own set of page-tables from the
+         * third level. For slot XEN_SECOND_SLOT, Xen is not yet able to handle
+         * it.
+         */
+        get_table_slot x0, x19, 2     /* x0 := second slot */
+        cmp   x0, #XEN_SECOND_SLOT
+        beq   virtphys_clash
+        create_table_entry boot_second, boot_third_id, x19, 2, x0, x1, x2
+        b     link_from_third_id
+
+link_from_first_id:
+        create_table_entry boot_first_id, boot_second_id, x19, 1, x0, x1, x2
+link_from_second_id:
+        create_table_entry boot_second_id, boot_third_id, x19, 2, x0, x1, x2
+link_from_third_id:
+        create_mapping_entry boot_third_id, x19, x19, x0, x1, x2
+        ret
+
+virtphys_clash:
+        /* Identity map clashes with boot_third, which we cannot handle yet */
+        PRINT("- Unable to build boot page tables - virt and phys addresses clash. -\r\n")
+        b     fail
+ENDPROC(create_page_tables)
+
+/*
+ * Turn on the Data Cache and the MMU. The function will return on the 1:1
+ * mapping. In other word, the caller is responsible to switch to the runtime
+ * mapping.
+ *
+ * Clobbers x0 - x3
+ */
+ENTRY(enable_mmu)
+        PRINT("- Turning on paging -\r\n")
+
+        /*
+         * The state of the TLBs is unknown before turning on the MMU.
+         * Flush them to avoid stale one.
+         */
+        tlbi  alle2                  /* Flush hypervisor TLBs */
+        dsb   nsh
+
+        /* Write Xen's PT's paddr into TTBR0_EL2 */
+        load_paddr x0, boot_pgtable
+        msr   TTBR0_EL2, x0
+        isb
+
+        mrs   x0, SCTLR_EL2
+        orr   x0, x0, #SCTLR_Axx_ELx_M  /* Enable MMU */
+        orr   x0, x0, #SCTLR_Axx_ELx_C  /* Enable D-cache */
+        dsb   sy                     /* Flush PTE writes and finish reads */
+        msr   SCTLR_EL2, x0          /* now paging is enabled */
+        isb                          /* Now, flush the icache */
+        ret
+ENDPROC(enable_mmu)
+
+/*
+ * Remove the 1:1 map from the page-tables. It is not easy to keep track
+ * where the 1:1 map was mapped, so we will look for the top-level entry
+ * exclusive to the 1:1 map and remove it.
+ *
+ * Inputs:
+ *   x19: paddr(start)
+ *
+ * Clobbers x0 - x1
+ */
+ENTRY(remove_identity_mapping)
+        /*
+         * Find the zeroeth slot used. Remove the entry from zeroeth
+         * table if the slot is not XEN_ZEROETH_SLOT.
+         */
+        get_table_slot x1, x19, 0       /* x1 := zeroeth slot */
+        cmp   x1, #XEN_ZEROETH_SLOT
+        beq   1f
+        /* It is not in slot XEN_ZEROETH_SLOT, remove the entry. */
+        ldr   x0, =boot_pgtable         /* x0 := root table */
+        str   xzr, [x0, x1, lsl #3]
+        b     identity_mapping_removed
+
+1:
+        /*
+         * Find the first slot used. Remove the entry for the first
+         * table if the slot is not XEN_FIRST_SLOT.
+         */
+        get_table_slot x1, x19, 1       /* x1 := first slot */
+        cmp   x1, #XEN_FIRST_SLOT
+        beq   1f
+        /* It is not in slot XEN_FIRST_SLOT, remove the entry. */
+        ldr   x0, =boot_first           /* x0 := first table */
+        str   xzr, [x0, x1, lsl #3]
+        b     identity_mapping_removed
+
+1:
+        /*
+         * Find the second slot used. Remove the entry for the first
+         * table if the slot is not XEN_SECOND_SLOT.
+         */
+        get_table_slot x1, x19, 2       /* x1 := second slot */
+        cmp   x1, #XEN_SECOND_SLOT
+        beq   identity_mapping_removed
+        /* It is not in slot 1, remove the entry */
+        ldr   x0, =boot_second          /* x0 := second table */
+        str   xzr, [x0, x1, lsl #3]
+
+identity_mapping_removed:
+        /* See asm/arm64/flushtlb.h for the explanation of the sequence. */
+        dsb   nshst
+        tlbi  alle2
+        dsb   nsh
+        isb
+
+        ret
+ENDPROC(remove_identity_mapping)
+
+/*
+ * Map the UART in the fixmap (when earlyprintk is used) and hook the
+ * fixmap table in the page tables.
+ *
+ * The fixmap cannot be mapped in create_page_tables because it may
+ * clash with the 1:1 mapping.
+ *
+ * Inputs:
+ *   x20: Physical offset
+ *   x23: Early UART base physical address
+ *
+ * Clobbers x0 - x3
+ */
+ENTRY(setup_fixmap)
+#ifdef CONFIG_EARLY_PRINTK
+        /* Add UART to the fixmap table */
+        ldr   x0, =EARLY_UART_VIRTUAL_ADDRESS
+        create_mapping_entry xen_fixmap, x0, x23, x1, x2, x3, type=PT_DEV_L3
+#endif
+        /* Map fixmap into boot_second */
+        ldr   x0, =FIXMAP_ADDR(0)
+        create_table_entry boot_second, xen_fixmap, x0, 2, x1, x2, x3
+        /* Ensure any page table updates made above have occurred. */
+        dsb   nshst
+
+        ret
+ENDPROC(setup_fixmap)
+
+/*
+ * Switch TTBR
+ *
+ * x0    ttbr
+ *
+ * TODO: This code does not comply with break-before-make.
+ */
+ENTRY(switch_ttbr)
+        dsb   sy                     /* Ensure the flushes happen before
+                                      * continuing */
+        isb                          /* Ensure synchronization with previous
+                                      * changes to text */
+        tlbi   alle2                 /* Flush hypervisor TLB */
+        ic     iallu                 /* Flush I-cache */
+        dsb    sy                    /* Ensure completion of TLB flush */
+        isb
+
+        msr    TTBR0_EL2, x0
+
+        isb                          /* Ensure synchronization with previous
+                                      * changes to text */
+        tlbi   alle2                 /* Flush hypervisor TLB */
+        ic     iallu                 /* Flush I-cache */
+        dsb    sy                    /* Ensure completion of TLB flush */
+        isb
+
+        ret
+ENDPROC(switch_ttbr)
+
+/*
+ * Local variables:
+ * mode: ASM
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/arm64/macros.h b/xen/arch/arm/include/asm/arm64/macros.h
index 140e223b4c..462dc70335 100644
--- a/xen/arch/arm/include/asm/arm64/macros.h
+++ b/xen/arch/arm/include/asm/arm64/macros.h
@@ -32,10 +32,60 @@
         hint    #22
     .endm
 
+    /*
+     * Pseudo-op for PC relative adr <reg>, <symbol> where <symbol> is
+     * within the range +/- 4GB of the PC.
+     *
+     * @dst: destination register (64 bit wide)
+     * @sym: name of the symbol
+     */
+    .macro  adr_l, dst, sym
+        adrp \dst, \sym
+        add  \dst, \dst, :lo12:\sym
+    .endm
+
+    /* Load the physical address of a symbol into xb */
+    .macro load_paddr xb, sym
+        ldr \xb, =\sym
+        add \xb, \xb, x20
+    .endm
+
 /*
  * Register aliases.
  */
 lr      .req    x30             /* link register */
 
-#endif /* __ASM_ARM_ARM64_MACROS_H */
+#ifdef CONFIG_EARLY_PRINTK
+/*
+ * Macro to print a string to the UART, if there is one.
+ *
+ * Clobbers x0 - x3
+ */
+#define PRINT(_s)          \
+        mov   x3, lr ;     \
+        adr   x0, 98f ;    \
+        bl    puts    ;    \
+        mov   lr, x3 ;     \
+        RODATA_STR(98, _s)
 
+    /*
+     * Macro to print the value of register \xb
+     *
+     * Clobbers x0 - x4
+     */
+    .macro print_reg xb
+    mov   x0, \xb
+    mov   x4, lr
+    bl    putn
+    mov   lr, x4
+    .endm
+
+#else /* CONFIG_EARLY_PRINTK */
+#define PRINT(s)
+
+.macro print_reg xb
+.endm
+
+#endif /* !CONFIG_EARLY_PRINTK */
+
+#endif /* __ASM_ARM_ARM64_MACROS_H */
-- 
2.25.1


