Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1D951144C
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 11:29:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314618.532787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njdyw-00020Y-FQ; Wed, 27 Apr 2022 09:29:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314618.532787; Wed, 27 Apr 2022 09:29:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njdyw-0001yC-C9; Wed, 27 Apr 2022 09:29:10 +0000
Received: by outflank-mailman (input) for mailman id 314618;
 Wed, 27 Apr 2022 09:29:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ksbQ=VF=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1njdyu-00015W-SB
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 09:29:09 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20610.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ce389f7-c60c-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 11:29:08 +0200 (CEST)
Received: from AM7PR03CA0014.eurprd03.prod.outlook.com (2603:10a6:20b:130::24)
 by AM0PR08MB5347.eurprd08.prod.outlook.com (2603:10a6:208:17f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 27 Apr
 2022 09:29:06 +0000
Received: from VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::72) by AM7PR03CA0014.outlook.office365.com
 (2603:10a6:20b:130::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13 via Frontend
 Transport; Wed, 27 Apr 2022 09:29:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT031.mail.protection.outlook.com (10.152.18.69) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12 via Frontend Transport; Wed, 27 Apr 2022 09:29:06 +0000
Received: ("Tessian outbound ac9bb5dd84f6:v118");
 Wed, 27 Apr 2022 09:29:05 +0000
Received: from 561f0d3f7380.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7981905B-B85C-4EA6-9582-316B10F5BBC5.1; 
 Wed, 27 Apr 2022 09:28:59 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 561f0d3f7380.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 27 Apr 2022 09:28:59 +0000
Received: from AM6P192CA0107.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::48)
 by DB6PR0802MB2503.eurprd08.prod.outlook.com (2603:10a6:4:97::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 27 Apr
 2022 09:28:56 +0000
Received: from VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8d:cafe::49) by AM6P192CA0107.outlook.office365.com
 (2603:10a6:209:8d::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13 via Frontend
 Transport; Wed, 27 Apr 2022 09:28:56 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT021.mail.protection.outlook.com (10.152.18.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Wed, 27 Apr 2022 09:28:56 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Wed, 27 Apr
 2022 09:28:49 +0000
Received: from a011292.shanghai.arm.com (10.169.190.94) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Wed, 27 Apr 2022 09:28:40 +0000
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
X-Inumbo-ID: 7ce389f7-c60c-11ec-a405-831a346695d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=HfhCtJnwBt2pArU8TSVp6ZpUqeJ6J/UwQmD085e9c1UPnLTKkn0WCBwxeKajleyCO3qw+QGQ0EAv2ZYNJI8Ii7qen6wLncCZoJKfW02uh6DHPXCzs7ksmq/GYTuOfKPCjcvZHzXXCXHs1/0eMsuM2m7rzNZs1q3hsfpi/2gXylR2ZsGScnuZNxzDbyQfMJ4heY9P78hNtUtS8+vYpCNozbVuEW9XgB4eby4+i0yfvbj9hoeRVOyK3UAgvBBNSCYMLK1mxqxd03w5Zv0kRFSvzJETCXe8RNMGB7IxbQRkUKZhhlaBn3+Xtbrhlq5Fi2fV6S6dsAvas6xbLq6cNcmyZw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tc8bIziiDz6ap/XVy6bFd+Wj+r4OC2m3pmrld4YMMWs=;
 b=c6MavAhP3pQhqZTHg/lHz0VNXg2URbwNGXkoOK/v9gUt8sjVCmmrkJSPu78Cv4MmIZrxvPAb/r1E8n1eA7AFrEkepLxrldL70BDv7ujptA48EYB1iLA9sc+whXs+awzhWUezsfT4OtaJ1UwSBn3emtc5BcGys6Gz376EOLp1HAoB7+JHUAntHC73RpLsSow9UQbpLVERwPbMe5UTrGqqifP6F/2eVTJOUE/wsIi0NO1swP1gX96dHmel79U3LCi73v6w/gWDhIGDPxffh3/0Dd0onB3D+j+8ifKTKtqlLWGpGFBy/sIYjB5jqRfsvcOdoKTQkpd+cgm/XX0Yyg15Qg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tc8bIziiDz6ap/XVy6bFd+Wj+r4OC2m3pmrld4YMMWs=;
 b=7RG4tWEsQW3NIPjwW4pcs/oC2d8R1dWDgACz9tTHTnFiTmB/CBoxapq02dHGxR5V+z2fcW6DFyxHf6oG+uP2ns2hDlrCTwLOIiiYwrmwViHlC0jqoRy2WT4/6uNf3R/ip4vEwsy7XRyPVjbxexkPDFe4KcaQqxiAnvG6zPFmmL8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 10335ee396b426b7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aH//NYMbAvLuGgJ/sm1XUff/yS1pY3tckyIsUDdmF8xKdo835V3dAfU87+8T7yoEeLX5XadkcnpufcatcX2jjpxtTuDe7G5IMJtqMMfUV/gxwrdC6KM3IVOStiYlEshI5joKKHGZEcEHFOs8IB5melE3GLssooOi3yDOnKUnezfWDDWG1wF5fj2176pR/XlQkODIJ6blyF76rcMs7+O/ebySeYAFNThwi0vdoChXuJKU1ewkPsOyEoTZiF9KhPmgYqbd9XRTi5tZ+Oxmlgl6dhTFebMtQ/H1AA9T5yo9ZPST26p0SDpeU4KBfIzUserAz+0retsW9s0RVEdfTUNVTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tc8bIziiDz6ap/XVy6bFd+Wj+r4OC2m3pmrld4YMMWs=;
 b=LpTS85ObVdYtRSONaujt9ujFWoDXizGd7S0gIe4A4ynK4pVQ+MPT7MDG1BwYV8cRcn+onbHoYQBWx+N17uNK3r683qqImPRC57CMqjLxwa1N8hv/Jz4nfx8tNtjeSumPdD5KZxPq52IQv1lm9sqjeeuBWyoSwhlbugdQTeVeG4umLLD/UF++uP0yRoIxQq0Y/0DK0Yo+QRPUPA5hHLwAIw/Ty4/lEsRy1SJq8cKj6EvlUel4mPeTo+KBCsPalAvIEQzNEaHEV4k7vR5t38IHYXOeXODxHqUpIT4S0wKXCWoVq6NDq5vPAReLrUtzBedGyxYbWkqeZV945K64JvANBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tc8bIziiDz6ap/XVy6bFd+Wj+r4OC2m3pmrld4YMMWs=;
 b=7RG4tWEsQW3NIPjwW4pcs/oC2d8R1dWDgACz9tTHTnFiTmB/CBoxapq02dHGxR5V+z2fcW6DFyxHf6oG+uP2ns2hDlrCTwLOIiiYwrmwViHlC0jqoRy2WT4/6uNf3R/ip4vEwsy7XRyPVjbxexkPDFe4KcaQqxiAnvG6zPFmmL8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <Penny.Zheng@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, <henry.wang@arm.com>, Penny Zheng
	<Penny.Zheng@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Penny Zheng
	<penny.zheng@arm.com>
Subject: [PATCH v3 4/6] xen/arm: introduce CDF_staticmem
Date: Wed, 27 Apr 2022 17:27:41 +0800
Message-ID: <20220427092743.925563-5-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220427092743.925563-1-Penny.Zheng@arm.com>
References: <20220427092743.925563-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 50ef8318-7abc-4890-77da-08da2830601a
X-MS-TrafficTypeDiagnostic:
	DB6PR0802MB2503:EE_|VE1EUR03FT031:EE_|AM0PR08MB5347:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB53479AD255EBC9565E14CFDCF7FA9@AM0PR08MB5347.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 hvLdJQuIGXtdgN1+lpJUggGxQq09Vc9J7Y10f+zhmSJVU3k61A9mj/FCBmJwceM4dI54kVJoG/AtGRPoFDp+Tp0+zk77WGGzHbxuuVJN7l5DZyorbSregzNQGOz4aF1qdWfwy82jjMAEH/SnHg2xyvRAOwYehTJyPdrJsiQs68WxZbUZtnDSnpxmb2uWZd4sVXhBQYqZa9KVeoyjjlBM5/lQdtbxggGljoG6g0dlGiUBOyTU8iII4w/4HM5bY/ctcqZlhOacPsQZtKGjBi6Wvl8cev75zajHyhBLv7HyLwHC4PBTofwMl1IU7KZC8Gzk8umGPpOgQ4Wwrq7RIAeNukD4Ay97VcDKDwJJ1OoxT49olc8wwRuw3dYivq3kXaTAwLhLaLMK/mhJuyMZ5N1N/phqNcOKWvV0JrldetK0AQ9RHvNna95ReWY2WT6yHBQ+Ty5YBzepTnU6EJlrRDfMskmI+ZKFGUd7lpAUsZvtv13f3rBjm+NxUMG2cbbOyQm4IlnZ2hTANeN3nSK5ccMeLaPZPhOwTK0Mk2itmyIgK5iP3T8RiJrkUUSZeOV2Hnz/C9o9MRXB+iIswF9DV98K+r+mD79tTIlxqmBqzQTHxyrh0ICiKwdIdPbhwoMie3VXv24ZEQz4e9GfEapnS8So23mfa/EHHeZps7jPX+g52b43sFqPxLiPF43BiYrojwYFDWPHlTg2VR9RWfsVZQBtbQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(86362001)(26005)(82310400005)(36860700001)(70206006)(70586007)(8936002)(36756003)(54906003)(356005)(316002)(81166007)(6916009)(40460700003)(4326008)(508600001)(8676002)(5660300002)(2906002)(186003)(336012)(426003)(47076005)(1076003)(83380400001)(2616005)(7696005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2503
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	df0ac107-1037-4f61-bc3d-08da28305a1e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gkdHmxSDSsLUbrY1LLxOo5/uoGWtPiu8gowBhQhZO69roIGNhaQySzLSmBYzB/7QiNJDY0Aj9I5FicfE2VHZW+gR5xVPIiob6QdcYhRdxj9iOYU7Id6m5pmceByAaVPt/PlMae1OGHb7q9fjMWpS2kFSo/Juhwp/nN4bFTj8xY3ob9GuUiNefEyu5SOqASJMvA4aqfmO+2ULb0Z3jz5XJXmEbwjU3Tfw0B73WljlkVsXVa+isEHikDJlV1D+rU/Jg/obExJROyVhr+CNhedT5gX4l1a7mEbtTwmNRkVXg9zOlz5LStnyMyCKQaFqQ7axfavF0EJEfEGTbh5ujFX7moUqhyQbCu2911LgzjcrMMojsrA+xzvIPfwaR9jUHpz2EyBxDqE/AM0ga2do68JHsh5TB3UPPFI4D2j1Vmks1+KoLSzDmon59VQUxbh+UvcUaB9dSvWRpdNGUPB852a2p87xZ+zOjTKuA+BJGdUuIyVJL+wqT7nzFI3EL6vKh8TzH3EiT6Fg9yaZxezkoKZTZw5/pXEk4CsFbfftHGkiP7hHrhOH8uu3G0y4RgrAHzgTcUJx2t1qVH/WTwTxamkCV8QI9I9Wg1m2MN4a0Rg5sd36gw8OXeu/krmVY24EJfwCCSVzPChaRQyUkKKDvan1vflrdqGCcguovtDptJriTOcppXqQsOF+Dk3/QrUvw+/a
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(508600001)(26005)(40460700003)(81166007)(2906002)(5660300002)(82310400005)(36756003)(36860700001)(8936002)(7696005)(70206006)(2616005)(8676002)(4326008)(70586007)(83380400001)(1076003)(47076005)(186003)(336012)(426003)(54906003)(6916009)(86362001)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 09:29:06.1297
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50ef8318-7abc-4890-77da-08da2830601a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5347

In order to have an easy and quick way to find out whether this domain memory
is statically configured, this commit introduces a new flag CDF_staticmem and a
new helper is_domain_using_staticmem() to tell.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v3 changes:
- change name from "is_domain_static()" to "is_domain_using_staticmem"
---
v2 changes:
- change name from "is_domain_on_static_allocation" to "is_domain_static()"
---
 xen/arch/arm/domain_build.c       | 5 ++++-
 xen/arch/arm/include/asm/domain.h | 2 ++
 xen/include/xen/domain.h          | 2 ++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 1472ca4972..6830a282a0 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3190,9 +3190,12 @@ void __init create_domUs(void)
         if ( !dt_device_is_compatible(node, "xen,domain") )
             continue;
 
+        if ( dt_find_property(node, "xen,static-mem", NULL) )
+            flags |= CDF_staticmem;
+
         if ( dt_property_read_bool(node, "direct-map") )
         {
-            if ( !IS_ENABLED(CONFIG_STATIC_MEMORY) || !dt_find_property(node, "xen,static-mem", NULL) )
+            if ( !IS_ENABLED(CONFIG_STATIC_MEMORY) || !(flags & CDF_staticmem) )
                 panic("direct-map is not valid for domain %s without static allocation.\n",
                       dt_node_name(node));
 
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index fe7a029ebf..110c672589 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -31,6 +31,8 @@ enum domain_type {
 
 #define is_domain_direct_mapped(d) ((d)->cdf & CDF_directmap)
 
+#define is_domain_using_staticmem(d) ((d)->cdf & CDF_staticmem)
+
 /*
  * Is the domain using the host memory layout?
  *
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 1c3c88a14d..35dc7143a4 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -34,6 +34,8 @@ void arch_get_domain_info(const struct domain *d,
 #ifdef CONFIG_ARM
 /* Should domain memory be directly mapped? */
 #define CDF_directmap            (1U << 1)
+/* Is domain memory on static allocation? */
+#define CDF_staticmem            (1U << 2)
 #endif
 
 /*
-- 
2.25.1


