Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F4159B7D2
	for <lists+xen-devel@lfdr.de>; Mon, 22 Aug 2022 05:00:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391100.628826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPxfA-00063p-AW; Mon, 22 Aug 2022 02:59:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391100.628826; Mon, 22 Aug 2022 02:59:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPxfA-00060d-6K; Mon, 22 Aug 2022 02:59:40 +0000
Received: by outflank-mailman (input) for mailman id 391100;
 Mon, 22 Aug 2022 02:59:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t9b2=Y2=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oPxf8-0005Ul-4b
 for xen-devel@lists.xenproject.org; Mon, 22 Aug 2022 02:59:38 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2089.outbound.protection.outlook.com [40.107.20.89])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74be8c09-21c6-11ed-9250-1f966e50362f;
 Mon, 22 Aug 2022 04:59:36 +0200 (CEST)
Received: from AS9PR06CA0772.eurprd06.prod.outlook.com (2603:10a6:20b:484::27)
 by PR3PR08MB5737.eurprd08.prod.outlook.com (2603:10a6:102:8d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Mon, 22 Aug
 2022 02:59:34 +0000
Received: from AM7EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:484:cafe::24) by AS9PR06CA0772.outlook.office365.com
 (2603:10a6:20b:484::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16 via Frontend
 Transport; Mon, 22 Aug 2022 02:59:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT030.mail.protection.outlook.com (100.127.140.180) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Mon, 22 Aug 2022 02:59:34 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Mon, 22 Aug 2022 02:59:34 +0000
Received: from ca020a6e207d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 372FA09C-0247-4A83-847A-B2CC17F85686.1; 
 Mon, 22 Aug 2022 02:59:28 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ca020a6e207d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 22 Aug 2022 02:59:28 +0000
Received: from DB6PR07CA0170.eurprd07.prod.outlook.com (2603:10a6:6:43::24) by
 VI1PR08MB3694.eurprd08.prod.outlook.com (2603:10a6:803:b6::26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.19; Mon, 22 Aug 2022 02:59:19 +0000
Received: from DBAEUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:43:cafe::60) by DB6PR07CA0170.outlook.office365.com
 (2603:10a6:6:43::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14 via Frontend
 Transport; Mon, 22 Aug 2022 02:59:14 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT033.mail.protection.outlook.com (100.127.142.251) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.15 via Frontend Transport; Mon, 22 Aug 2022 02:59:14 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Mon, 22 Aug
 2022 02:59:13 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.9 via Frontend
 Transport; Mon, 22 Aug 2022 02:59:11 +0000
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
X-Inumbo-ID: 74be8c09-21c6-11ed-9250-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=XxCwp9zwUP5YJ+iQI+85TRKgDfCjzzSzy8fRglf6ICguYEV+cDp9C1VK2zbAjhyMz1MlT5tvf7X2k5VQRuiYJliY06NKuSPQea41cGkQJnqYAsygsIlBxomW+rUy0Wrv4UJlwVM1vhH1sGuck1Dstr/88le1RTjRXlEjrWcjgRaxXz9E2Be1OmjqbdHv7UKjR4Ge90o2/EzxxFAbIVCShPn12yHUO5Pa3RR/EE0BumFWsRfQgLylfB+0dyvrCFj3L+rsFx5XTrd6CUQjm4DLFIRN394Rl4UTu6D1AKazQ3n9Xu+FuDMnJHoRe84YFDnLvMzeCEFQlwPBmHXJ/U7g4Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vsZz+zwRqqwdxZH2PQ4STiUALl22N6YfskYmd2UrzdY=;
 b=oNYkjCr4YpXJGoNBwfmrAXuagXxN44Wv+8kQcQdy5eHe1gfTAB0VYWGhCqNJZuxPUJEfsVo96v6F9HQzfvr+l0PP4sDa1NHcThaoacUOaS55PDgjXU7w7aBh5TxU9SJITAbiFOxtqAqXkya6iwS0SX5KHMAlueZ78INpEVAer+SsARvM8dhOMT30hTWcnZC7Zb+XnAGxb63V18ygY4dhWYFjt382+hbSjRyxWBdKbhKCST9DhDgo4W2jDbt5cGY8OhKflmmrZ8qnAw+PZAxC8FvRTEDnQJtrdDyALWIcaPBbnwZsq/bTFGGhPBjug9pVag2mMJfPAqSyaEM7HxSQyA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vsZz+zwRqqwdxZH2PQ4STiUALl22N6YfskYmd2UrzdY=;
 b=kpihTtV3pteiXz9A6b+XHK1FygaaanMs2FKli3BHWFs1l1QtA7ZS7VOKA9r34NYn7214/6WLyQ2kj6QVrH1NvKkMRUknXRF5uTjl4MOMDMQp1Ds+RksdzVxXrOoGBvpQ56b/h/ETiiGv358qMP1PtemvKSm3hMtIc8wfr17wbEg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4e1f8129fd23bd2b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+d1a5F/2bb5Y4gJBtjxZyIAdSWmePORMMYpeSqlI6DDx1xPgtgZ+RlBw/Sr2LGgzqeQulerWaqkw/mfFpWse6Lcp4ew7uWBn9T5cTt95hBjZd6YJ01XeQXxu2rxzUWjq4QAZDz1MOdiPrE2Ovmbm5r7bncBBepJQg31rslX3+JHd/f0E7DpoyFd4p0bibjsNz0F7v4QJOw2pC1k+dN2sVCIS5GTr/IpMcUFUKh/W/oKuKn4fYxb7oqtqyENCJ4fsOkYIta88V1mA5E09vWLiUXyr6ozWNoXINkEsMqLeBat229Lj2Zzv1ob1SEoVuRXFCsUZfljtMJZEMYQnaOH7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vsZz+zwRqqwdxZH2PQ4STiUALl22N6YfskYmd2UrzdY=;
 b=O2rdmZ4bSh8/smKkBLM+Dft424XMDixEhaRVaGh7jSKXcYk8uYZuuH0dsFJPswR13K8eJSu4nthrcLJd6rDBnwwFOAhzml5QbQ+m7Oy/Z5XRM31c6qiBRrStpkVF+l9yWxkBQW52yYV8H06BESoeNISjSQKxq2ZJBMxRhVXcEjD7Dc6eRGGrcQIntGuELdDIAi8Z2kM0NfdPMDx7daJ3K45GLpZM4GBPkM1aA4wO+rjgOB7a3qFG46eT/9YJ8I77ljlLslk+4DtxMPMSvM7kQ5BswO2gPzTas4RqE2r0aFMLzetyfdlqRNYKZZ5G2+i+sG0zcl1OPEoZO6t7356bEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vsZz+zwRqqwdxZH2PQ4STiUALl22N6YfskYmd2UrzdY=;
 b=kpihTtV3pteiXz9A6b+XHK1FygaaanMs2FKli3BHWFs1l1QtA7ZS7VOKA9r34NYn7214/6WLyQ2kj6QVrH1NvKkMRUknXRF5uTjl4MOMDMQp1Ds+RksdzVxXrOoGBvpQ56b/h/ETiiGv358qMP1PtemvKSm3hMtIc8wfr17wbEg=
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
	<wl@xen.org>
Subject: [PATCH v3 1/6] xen/x86: Provide helpers for common code to access acpi_numa
Date: Mon, 22 Aug 2022 10:58:05 +0800
Message-ID: <20220822025810.2240707-2-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220822025810.2240707-1-wei.chen@arm.com>
References: <20220822025810.2240707-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 52c5f024-446d-4371-9dde-08da83ea57a1
X-MS-TrafficTypeDiagnostic:
	VI1PR08MB3694:EE_|AM7EUR03FT030:EE_|PR3PR08MB5737:EE_
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 lKFnOl8cUYxlmylXgJbplORz7PSGECox7Q5LveAmbAwjfCAEfyA1yxj0COcjzGxaBxBRoDCIkVJS8lRKaS7r63w4BMKTyTfj5iItiy9w0MBkfCzzIc0qKfVxby4JyNuf6XdVUMM3zmR6tYZDaLZ7e3j+QEhwDhvu1P3H5T/URGRTI7innrdKGxIq5xyy+NHaQOiWO/glYzOMyGZ4UdA4OLMQJBoDMk9rszKkJfeG+AIssRjLJwUpPHuGGmjT+qXBWxn0F8z9iQJ+Jap6GXN8skzyK3aY8EHsRdf+84F9rPBspkfGeTUJdCjp+wIEE08DR5ZJA+p81dPF4aVB4LPSS4B3rRhU57qNoUrIOiNQ6AV4DR8atorNxwFAHNW9WyV0vLE1Nd0/M7qx7X8UGMcP/O76da7T+Abq4YOtY7e3QQQj6S6CJ5/VWlMSAwo6TturLzfvgRf5u4bo5ldMeYiBFXbg0PC++/LFL4rw4ro2ZFQ2e9/FN7LGvU1RmH6EIMHTvvonR1/N2WP9nSgcMZb0HYxRoXt7Fp2Z51mjzfSCFS2RCBiC1KMejKwAejbGQTZgSO6jhy3JUEEXG+t8e0xDO9akX9Y9UgNE7zos1vtp2kjbMwuYPdccY+JZEYih5aWWfLCIjJtsAjadJG1MEOXZdwFoowrMgvVP9ifQv0p450RMWPhxGFjlhqlXboC2F3+mcIco7n1KSzQe0X4t+/XpCfZBIA+kl1QO685kKNWmbgiZDaXF0GQDHm8vezoZ3lUacjBapz+zBPSmbMMHTlE40A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(136003)(39850400004)(396003)(346002)(376002)(36840700001)(46966006)(7696005)(6666004)(41300700001)(478600001)(426003)(47076005)(186003)(1076003)(336012)(8936002)(83380400001)(26005)(2616005)(2906002)(5660300002)(44832011)(82310400005)(40480700001)(316002)(54906003)(6916009)(70586007)(4326008)(8676002)(82740400003)(70206006)(86362001)(356005)(36860700001)(81166007)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3694
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6e096d98-ba7a-4ccf-ca4f-08da83ea4bc0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qYEtA9LFYMN3PtIvatSZoVQgubGSc9M8KoFFlNxzh91AXybnpnldW5YSwdyyetJ6pWwpice8SXRYYiphYrPiqcOEgOfgAHtTgVj2G79cvpa/7Sxp//UqWgzdW1o/sMTyMNgbEPBHSavxyfBjGIKZb0WnXkvIfzXXi7moiSzQwWda7UTMPSpc5blopaamMjnkS/UkdhauF8v33K99mfLJtY4uGohG4xSftJO764uxPOLkD0ZdvfKZVGFhlTLYSQym9OOVgrmXZ3dgfmaY+/Jrl8gS96yjC0URRvJJ6STSs42eVdQsPO0KXZNaAIu67XDZ8T+K5PKc9Iu3TeviQ2XTIvOu/HJnVGg8scEDNvJba8UQBL6avcc8qKq8HfzInyACnj6fOKNZUkgdFsnLFYYOcx0p5+AUYtGE1ZNwdkJjjghutb3R/M0Igew1EkHghWwrY6vJsGBn2ir9w35m80qbNl8splTMs2327vNymXTS832bdn8wpzV3TztZ54M4pMK1Mg1ftG0KCwIvAdH8JG7vA4UoslYiPdpmTfQZYfWvdVWlQTua1izwLLLyn2XCqy26sveN5MZGDCkW1dPy3nmXv9XqsZs+JWQlFiE8I1WSCxx5334Ke7lyE0ZEiahA7MWmA6vVcLDvtornsWkjGC4+X4LGfpMc4nkKeRt3jtT/FOwqCNrc9yR6JKOX9VPv0PXT2UHMbOpcV4GZnL2O4Noc1A0uWR/ynNjrSjwOIAe2eXkQNMouRtd8BaRu3pBCiw2p
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(39850400004)(346002)(376002)(136003)(36840700001)(46966006)(41300700001)(478600001)(6666004)(7696005)(86362001)(81166007)(36756003)(26005)(83380400001)(2616005)(336012)(47076005)(1076003)(186003)(426003)(82310400005)(70206006)(70586007)(40480700001)(2906002)(8676002)(4326008)(316002)(6916009)(54906003)(82740400003)(44832011)(36860700001)(5660300002)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 02:59:34.1673
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52c5f024-446d-4371-9dde-08da83ea57a1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5737

acpi_numa is a specific NUMA switch for ACPI NUMA implementation.
Other NUMA implementation may not need this switch. But this switch is
not only used by ACPI code, it is also used directly in some general
NUMA logic code. So far this hasn't caused any problem because Xen only
has x86 implementing ACPI NUMA, but now Arm is implementing device tree
based NUMA. Accesssing acpi_numa directly in some functions will be a
block of reusing NUMA common code. It is also difficult for us to replace
it with a new generic switch, because it is hard to prove that the new
switch states can guarantee the original code will work correctly.

So in this patch, we provide two helpers for common code to update and
get states of acpi_numa. And other new NUMA implementations just need
to provide the same helpers for common code. In this case, the generic
NUMA logic code can be reused by all NUMA implementations.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v2 -> v3:
1. Drop enumeration of numa status.
2. Use helpers to get/update acpi_numa.
3. Insert spaces among parameters of strncmp in numa_setup.
v1 -> v2:
1. Remove fw_numa.
2. Use enumeration to replace numa_off and acpi_numa.
3. Correct return value of srat_disabled.
4. Introduce numa_enabled_with_firmware.
---
 xen/arch/x86/include/asm/numa.h |  5 ++--
 xen/arch/x86/numa.c             | 41 ++++++++++++++++++++++-----------
 2 files changed, 31 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/include/asm/numa.h b/xen/arch/x86/include/asm/numa.h
index c32ccffde3..f41fe20f9b 100644
--- a/xen/arch/x86/include/asm/numa.h
+++ b/xen/arch/x86/include/asm/numa.h
@@ -32,8 +32,9 @@ extern void numa_add_cpu(int cpu);
 extern void numa_init_array(void);
 extern bool numa_off;
 
-
-extern int srat_disabled(void);
+extern int arch_numa_setup(const char *opt);
+extern bool arch_numa_disabled(bool init_as_disable);
+extern bool srat_disabled(void);
 extern void numa_set_node(int cpu, nodeid_t node);
 extern nodeid_t setup_node(unsigned int pxm);
 extern void srat_detect_node(int cpu);
diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index 627ae8aa95..3d3081c967 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -50,9 +50,31 @@ nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
 bool numa_off;
 s8 acpi_numa = 0;
 
-int srat_disabled(void)
+int __init arch_numa_setup(const char *opt)
 {
-    return numa_off || acpi_numa < 0;
+#ifdef CONFIG_ACPI_NUMA
+    if ( !strncmp(opt, "noacpi", 6) )
+    {
+        numa_off = false;
+        acpi_numa = -1;
+        return 0;
+    }
+    else
+#endif
+    return -EINVAL;
+}
+
+bool arch_numa_disabled(bool init_as_disable)
+{
+    if ( !init_as_disable )
+        return acpi_numa < 0;
+
+    return acpi_numa <= 0;
+}
+
+bool srat_disabled(void)
+{
+    return numa_off || arch_numa_disabled(false);
 }
 
 /*
@@ -291,28 +313,21 @@ void numa_set_node(int cpu, nodeid_t node)
 /* [numa=off] */
 static int __init cf_check numa_setup(const char *opt)
 {
-    if ( !strncmp(opt,"off",3) )
+    if ( !strncmp(opt, "off", 3) )
         numa_off = true;
-    else if ( !strncmp(opt,"on",2) )
+    else if ( !strncmp(opt, "on", 2) )
         numa_off = false;
 #ifdef CONFIG_NUMA_EMU
     else if ( !strncmp(opt, "fake=", 5) )
     {
         numa_off = false;
-        numa_fake = simple_strtoul(opt+5,NULL,0);
+        numa_fake = simple_strtoul(opt + 5, NULL, 0);
         if ( numa_fake >= MAX_NUMNODES )
             numa_fake = MAX_NUMNODES;
     }
-#endif
-#ifdef CONFIG_ACPI_NUMA
-    else if ( !strncmp(opt,"noacpi",6) )
-    {
-        numa_off = false;
-        acpi_numa = -1;
-    }
 #endif
     else
-        return -EINVAL;
+        return arch_numa_setup(opt);
 
     return 0;
 } 
-- 
2.25.1


