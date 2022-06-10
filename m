Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4953A545BEB
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 07:54:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345795.571510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzXap-00088F-6b; Fri, 10 Jun 2022 05:53:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345795.571510; Fri, 10 Jun 2022 05:53:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzXap-00084u-1Z; Fri, 10 Jun 2022 05:53:59 +0000
Received: by outflank-mailman (input) for mailman id 345795;
 Fri, 10 Jun 2022 05:53:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B4Vh=WR=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nzXan-0006br-4D
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 05:53:57 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2062d.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6dd9b8d-e881-11ec-bd2c-47488cf2e6aa;
 Fri, 10 Jun 2022 07:53:56 +0200 (CEST)
Received: from AS8PR05CA0001.eurprd05.prod.outlook.com (2603:10a6:20b:311::6)
 by AM4PR0802MB2275.eurprd08.prod.outlook.com (2603:10a6:200:63::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Fri, 10 Jun
 2022 05:53:45 +0000
Received: from VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:311:cafe::20) by AS8PR05CA0001.outlook.office365.com
 (2603:10a6:20b:311::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.15 via Frontend
 Transport; Fri, 10 Jun 2022 05:53:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT026.mail.protection.outlook.com (10.152.18.148) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.12 via Frontend Transport; Fri, 10 Jun 2022 05:53:44 +0000
Received: ("Tessian outbound 6f53897bcd4e:v120");
 Fri, 10 Jun 2022 05:53:44 +0000
Received: from c852e8c72b8f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 99BE106C-8132-402C-B53A-215209236EB4.1; 
 Fri, 10 Jun 2022 05:53:38 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c852e8c72b8f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 10 Jun 2022 05:53:38 +0000
Received: from AS9PR05CA0005.eurprd05.prod.outlook.com (2603:10a6:20b:488::12)
 by PAXPR08MB7623.eurprd08.prod.outlook.com (2603:10a6:102:241::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14; Fri, 10 Jun
 2022 05:53:34 +0000
Received: from AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:488:cafe::bb) by AS9PR05CA0005.outlook.office365.com
 (2603:10a6:20b:488::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.15 via Frontend
 Transport; Fri, 10 Jun 2022 05:53:34 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT003.mail.protection.outlook.com (10.152.16.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5332.12 via Frontend Transport; Fri, 10 Jun 2022 05:53:34 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.27; Fri, 10 Jun
 2022 05:53:29 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.27; Fri, 10
 Jun 2022 05:53:28 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Fri, 10 Jun 2022 05:53:26 +0000
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
X-Inumbo-ID: b6dd9b8d-e881-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=fG43HVGRzqgv268RgH4ZlslKXSyLWt+AjAAzjwzu/88XreU0HjoZ1HiIQY43wgnEOaZOG2jG+d1l+2u8+MN9ts6LohKPgslEfYhhOa0ofVKx5OrM9CMXgbkvqeImRr8PzAMyvX+Ric4wid8e/Joq9LlSPr2dzHe0K3Q1QiuM6sxOGZdJCc4oFjcFSrg61nb+KSzJibK1WIZ1QHXXSWJsOvT6oUZ6UpZqXNBRykB05MK7uEdahhv0hsZAoZRQJcPA9CEl+nSGfqrYPhX7jHr70Oigh8OLQKLMG64QN6OareLiicHheuPoe8fuHhWPWR98mz7aVzXsaxWakR0jzNiBYg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fe/7SCgP8Par+1oz7XY3pgQuiN9XdtDg0NAdMEO3/oI=;
 b=OlC9r1/ueG6jm8gcw95bdK8Z7Zd2N7RdOjjsuu+vs69MqQhcGfJSQG93zqv2oAcco5DquPDRVtOW73i+YD7F5Uv7DhbFR5XtspbG4mZ0lsfY/VkwYzBJ4pnmra1+CTCEhD6NfKTLMmguuAAuBf+TkT9DVHSY/9afynxohCgRIxuyoJWHmOa7V7DDRxebJ2FmsSDWyyaO3YzGiWIbxMkJCK/gdAYxlv3eDuCt+G8AmtNW4VI196GKWj7ph2mq+OVRQahfxVY9ywE8O9ifxs5hnz2cm1be2vePFaYbb7bQndPSIen30BpKNpiAprqNMWG9MOzWQHBCdCbliCh/DNaUhQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fe/7SCgP8Par+1oz7XY3pgQuiN9XdtDg0NAdMEO3/oI=;
 b=xL6oTVx1ND7vOKqNFhfazXVx4p1w9pO0FxHvDrc2vwwn1OcFsBdCMMHdH5rveBqbiHirUl900js6GHSFfwUnOIYdiswN0vWogY9lqYXTOH5KEXStixjodpxTIDGGMYZBz3BzFiGSo+Z3qwGNGRJI/8UNobRHVJ04aPoLOcPL8Yc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f2fc4f47abb0d7fd
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ddq0wSrEF0nEyvtRkGTdBTBFasFvFEJ/2RpAiQy4FzzM4Diz8aixV+ow9uRVMqPqg5O7TqkPmF0dgN7++UToo+qhuJ2oqpZU7W3Nmdj16+ACDzKtUoS7k6zU14kjFSXkBDD54RR8yn1y309NG28C8sGsiWhVYNxAwwr/LZxH0yl3025yXHGneY1vsnFGamesDIaNkKFLHSxnSLk15+67MOCFeZj1YUj6/X9W3jNAfSm2MSeW6HhEJO30Yj+K+5SuOuuMgpKjBZEo/Cvcji3E+eRKEgTqHprI7pNd+P+S0TKku44DVReQq2FLdZk5D4O0lFZGTKm11ctH7mCJg8xryg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fe/7SCgP8Par+1oz7XY3pgQuiN9XdtDg0NAdMEO3/oI=;
 b=ne7FhMXp4O3E3hp7VmY8xSKeyWXP310ReNPJ1i4bflH7pbDw5sAxO8omrbvxrDFse1OkiRYovzW44cNlXKU1weIY2oa8ad0XR55R9EEL4yzHOsgVD8QsRRBDvO36RU20dtvHPj1VQdeswUbMtjDCeWyvhSAoEGrRWLoXOCazA/T0vTdUV5TxPCf2NzzZpjlrqvkQfieJGYFUJH+nBgao03lq4LLkgMOJF27JdecFuNba4ElSwoVuCIQG54YATvzj3OAeHOYksDERzw+QfsMfErkoSyhrFZ71Qie68B/xhX7Ih0P4K7rucKowWQFNGXD1JsZeGIVh3PbK57+tRIAXdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fe/7SCgP8Par+1oz7XY3pgQuiN9XdtDg0NAdMEO3/oI=;
 b=xL6oTVx1ND7vOKqNFhfazXVx4p1w9pO0FxHvDrc2vwwn1OcFsBdCMMHdH5rveBqbiHirUl900js6GHSFfwUnOIYdiswN0vWogY9lqYXTOH5KEXStixjodpxTIDGGMYZBz3BzFiGSo+Z3qwGNGRJI/8UNobRHVJ04aPoLOcPL8Yc=
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
	Jiamei Xie <jiamei.xie@arm.com>
Subject: [PATCH v6 2/8] xen/arm: Keep memory nodes in device tree when Xen boots from EFI
Date: Fri, 10 Jun 2022 13:53:10 +0800
Message-ID: <20220610055316.2197571-3-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610055316.2197571-1-wei.chen@arm.com>
References: <20220610055316.2197571-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 171d5972-bd2d-4ed6-b68f-08da4aa59463
X-MS-TrafficTypeDiagnostic:
	PAXPR08MB7623:EE_|VE1EUR03FT026:EE_|AM4PR0802MB2275:EE_
X-Microsoft-Antispam-PRVS:
	<AM4PR0802MB2275290B3803D7A71E4136049EA69@AM4PR0802MB2275.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 xqbBZG49TMPTCKs6rgn64JU+WscbTrWspYtSoyrw6puiiJ3/GI9+WB2DIxc/rlXK9rMdhkUtzf6bDk5CEnQZh1pKHozyVMPi2ItA3AkpCCWPhKatOOtIf6Zc5ac8zpx11QQvvbzsY+CbW6DZyyQHcNMmwse/gdYcyMxO6o5O1Ex80TZjsty3pa9rf6TT1YIxJ42EyC8D887KweUa7MuSeTumxmUgXalyZ5pkksBsbLmJH8GPU2xmf6mozAc30X5/GURz7UCgUrNDM0OAj0Wg+6SRxqXsoNnIRniJsWHCAB4pF6h51JepdDX0V9YplDxxktwXQwaGxaX0bOU4ukGjrBl7kaqiQN2Lif7wfgbBviAeFIhGzZpZNa2JYNi5pmhAMV4eD1pkDdONuzTgdw9cbFmSZJUeDro7vOPjnV6rGX/GdsIqXGn/XkgsV1WjcT4/eiEOs72jOTeTTdKaeD+ivZDsgt5wFGTkphVcNJTcMb5gDPKBtuIzSAhzZIke1f/7JpvlDxSh+MydCxJ3nBXqWiFvvleK4TAQ9Uvkf4SV4T0vqeV8FzdtzycliGgp7wPrR2DMXyeSA8Ihy5JrB+xFwrUf2+UH02tgcyCubM2g+JLXkLLlrCG5mBamgTuSsnKLLMnjve5x2RMeJLN22Oi7jP0IzY9nfjmjF+OiBSFfn8AbND1+nmyCKml12o0S55EAWiOVK81A7DIVs2xVvL+smA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(26005)(7696005)(86362001)(6666004)(2616005)(426003)(47076005)(336012)(2906002)(6916009)(54906003)(8676002)(4326008)(70586007)(36756003)(316002)(82310400005)(70206006)(81166007)(44832011)(36860700001)(83380400001)(40460700003)(1076003)(186003)(356005)(8936002)(5660300002)(508600001)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7623
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5c68f653-54d1-4ece-5c64-08da4aa58e67
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rRmdD7QZJH6a0xhH7O+JB7iGrlvMeHvQy7k2UW5H3VVWDnSgL4GBGWuQc7nIlaxrtcZwoTVNK5EYglknivZNJAiG06jjKRxKQ5SbiAuY2TwJP+bmTtl8HlDqc/BJyrqSO1DsxrpjpeIIUR7ocOOVVxySITmu7hPf35I9qp/H+cA3G5VBv6iMmLofG8UouIDAKI6NqXQi+kkohqtRG7HKgzWx6Vl5KkcYCQuIbQtW4pJW1ukkeHpuqHHoEGeH7K/o1fLK1WmBh83+mSeFsI1Y1YP6QiXbF9soUGCuRHxZN2Ubsv/sAiKzVWNG/RQeuXCbzUzrW7Oix65kbe5xVEasjHhPsS7mp2Bh4sB++IIv4hFtBpY56id8a1/JuKA2EJxwY47nsUQd0ZesU8GypUA/lpYGtlMQJ1OWiCHK3LB7PydYhmjmwEl8ZseSa1hvea+AypTfcRgYsXuaUV5tsTYEY1PIE5y2qILeQ7CJeuTuPVJMGC7lEnfjG/fb3n0ptiwki9UtU0+U+XBLF9WKN668Zc9p2sYyeflwnY49QM0Jffznro0j9jYltodZs423rLFn9wvVjy2nJFn2DwoKKUdni54e7FmR5QlWowzmF4QB9cwDsHFmPT9u560IH7FItjkhfIGmuzehFzSRrZhY0Y+fLCtZ/0Z4xqRPaQGRGIpnef2wcetX/seVBjO0nT9rC/3T
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(5660300002)(508600001)(82310400005)(44832011)(47076005)(6666004)(426003)(336012)(2906002)(83380400001)(40460700003)(36860700001)(54906003)(6916009)(8936002)(4326008)(2616005)(81166007)(316002)(7696005)(186003)(70206006)(70586007)(8676002)(86362001)(36756003)(1076003)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 05:53:44.4874
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 171d5972-bd2d-4ed6-b68f-08da4aa59463
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2275

In current code, when Xen is booting from EFI, it will delete
all memory nodes in device tree. This would work well in current
stage, because Xen can get memory map from EFI system table.
However, EFI system table cannot completely replace memory nodes
of device tree. EFI system table doesn't contain memory NUMA
information. Xen depends on ACPI SRAT or device tree memory nodes
to parse memory blocks' NUMA mapping. So in EFI + DTB boot, Xen
doesn't have any method to get numa-node-id for memory blocks any
more. This makes device tree based NUMA support become impossible
for Xen in EFI + DTB boot.

So in this patch, we will keep memory nodes in device tree for
NUMA code to parse memory numa-node-id later.

As a side effect, if we still parse boot memory information in
early_scan_node, bootmem.info will calculate memory ranges in
memory nodes twice. So we have to prevent early_scan_node to
parse memory nodes in EFI boot.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Tested-by: Jiamei Xie <jiamei.xie@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v3 -> v4:
1. No change.
v2 -> v3:
1. Add Rb.
v1 -> v2:
1. Move this patch from later to early of this series.
2. Refine commit message.
---
 xen/arch/arm/bootfdt.c      |  8 +++++++-
 xen/arch/arm/efi/efi-boot.h | 25 -------------------------
 2 files changed, 7 insertions(+), 26 deletions(-)

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index 29671c8df0..ec81a45de9 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -11,6 +11,7 @@
 #include <xen/lib.h>
 #include <xen/kernel.h>
 #include <xen/init.h>
+#include <xen/efi.h>
 #include <xen/device_tree.h>
 #include <xen/libfdt/libfdt.h>
 #include <xen/sort.h>
@@ -367,7 +368,12 @@ static int __init early_scan_node(const void *fdt,
 {
     int rc = 0;
 
-    if ( device_tree_node_matches(fdt, node, "memory") )
+    /*
+     * If Xen has been booted via UEFI, the memory banks are
+     * populated. So we should skip the parsing.
+     */
+    if ( !efi_enabled(EFI_BOOT) &&
+         device_tree_node_matches(fdt, node, "memory") )
         rc = process_memory_node(fdt, node, name, depth,
                                  address_cells, size_cells, &bootinfo.mem);
     else if ( depth == 1 && !dt_node_cmp(name, "reserved-memory") )
diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index e452b687d8..59d93c24a1 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -231,33 +231,8 @@ EFI_STATUS __init fdt_add_uefi_nodes(EFI_SYSTEM_TABLE *sys_table,
     int status;
     u32 fdt_val32;
     u64 fdt_val64;
-    int prev;
     int num_rsv;
 
-    /*
-     * Delete any memory nodes present.  The EFI memory map is the only
-     * memory description provided to Xen.
-     */
-    prev = 0;
-    for (;;)
-    {
-        const char *type;
-        int len;
-
-        node = fdt_next_node(fdt, prev, NULL);
-        if ( node < 0 )
-            break;
-
-        type = fdt_getprop(fdt, node, "device_type", &len);
-        if ( type && strncmp(type, "memory", len) == 0 )
-        {
-            fdt_del_node(fdt, node);
-            continue;
-        }
-
-        prev = node;
-    }
-
    /*
     * Delete all memory reserve map entries. When booting via UEFI,
     * kernel will use the UEFI memory map to find reserved regions.
-- 
2.25.1


