Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CB15FB153
	for <lists+xen-devel@lfdr.de>; Tue, 11 Oct 2022 13:18:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419579.664384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiDGk-00058K-9t; Tue, 11 Oct 2022 11:17:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419579.664384; Tue, 11 Oct 2022 11:17:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiDGk-00056J-5p; Tue, 11 Oct 2022 11:17:54 +0000
Received: by outflank-mailman (input) for mailman id 419579;
 Tue, 11 Oct 2022 11:17:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s0xJ=2M=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oiDGi-0004mj-8j
 for xen-devel@lists.xenproject.org; Tue, 11 Oct 2022 11:17:52 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70084.outbound.protection.outlook.com [40.107.7.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 573d0b69-4956-11ed-91b4-6bf2151ebd3b;
 Tue, 11 Oct 2022 13:17:50 +0200 (CEST)
Received: from DB6PR0601CA0042.eurprd06.prod.outlook.com (2603:10a6:4:17::28)
 by PAXPR08MB6431.eurprd08.prod.outlook.com (2603:10a6:102:157::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.19; Tue, 11 Oct
 2022 11:17:47 +0000
Received: from DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:17:cafe::f9) by DB6PR0601CA0042.outlook.office365.com
 (2603:10a6:4:17::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15 via Frontend
 Transport; Tue, 11 Oct 2022 11:17:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT058.mail.protection.outlook.com (100.127.142.120) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Tue, 11 Oct 2022 11:17:46 +0000
Received: ("Tessian outbound 7761be2ecf00:v128");
 Tue, 11 Oct 2022 11:17:46 +0000
Received: from 767c858d8d13.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1063E91D-D5AA-4233-AD73-F0E00D5A85C8.1; 
 Tue, 11 Oct 2022 11:17:40 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 767c858d8d13.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 11 Oct 2022 11:17:40 +0000
Received: from AM6P194CA0020.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::33)
 by DBAPR08MB5768.eurprd08.prod.outlook.com (2603:10a6:10:1b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Tue, 11 Oct
 2022 11:17:37 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::52) by AM6P194CA0020.outlook.office365.com
 (2603:10a6:209:90::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.20 via Frontend
 Transport; Tue, 11 Oct 2022 11:17:37 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5709.10 via Frontend Transport; Tue, 11 Oct 2022 11:17:36 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Tue, 11 Oct
 2022 11:17:31 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Tue, 11 Oct 2022 11:17:28 +0000
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
X-Inumbo-ID: 573d0b69-4956-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Yv0al7Ia6sFLoblssvAZqs+EV4oAyDTrU5RxWW4uQo39cNLWiaKUVT+KFEl464YePyV4zfRBWfeWPIv0K7WTAz0kL+4Usff6OD5p6YpWkECRmm7riep1qclHfVYOoQusvRNcpfbv4jXfyruwbZE5wrY1HfncSSnVG7ellU6AhgbTaYPU0SzC+Ui0FJmEnU1g+J8TL/5DdSn2n8vQw5Uk1Z3jpx7Qk23nCuP7DTRPVxPOMdDUIT4eBJv1rEHb2D9cEgBfxJMYsHnTqleARtWT7xTTMxWuJbS9FGVkdfXxquLAoFso7lQyPrRzsPK7v6u7oFIATfV2jHxKvL+rGRk92g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HTMDqPnJAO8ukxU/OyQ6SxcZEtGPj2cCfm4781eG/lI=;
 b=eC0Zn9TxUwaNt0dbUemBsjLUDFOUKUwpDnTcxkJrhY5qZHPlC3m2ow9pMV0IybabW0W3g7jCoXDyhc9/xu7WqiH2Hs6Q31vVoSH3CMfWJxIM0nUREWro0Nc5Wd7PlyvyiHGmEbbKrLcWc+mWofeH8wzWZXQxHVeikpQHFrRYtWYZOOquTzbEC5vJ1spK6M5qTK2VlxvTSEo9kBVLvlgcGnIobA5CaRi1UMXyJTYtArYZABxCqJyycyVtJIwUVLgsw4lc2nR+jmKVYmPAuePgr/zlnz5czqINGGf3oNjXc8hdG2ka5bC5E5pHpfe2swZPP07GGjUedumiUCM939o67w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HTMDqPnJAO8ukxU/OyQ6SxcZEtGPj2cCfm4781eG/lI=;
 b=hdhexpfSY1Bs2bmSwbOsWlmt/VuNrOsDTiRT7tfAr08yGKflr2zY4ktXTwY1OWBEAjnioH/2t44JWsCHWDmPJLwdgds7vFbjgEvdObotf8mnGS/G1iHmKK8MFFziB1Vx3PhQ499zRq3j2huneSS5yi0rJzogpnLs88w8K2HHjeY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: fa28ce6fddd9d7d1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M+EXJlTLIQvqTwCj+0x4xKhJvHDrHNZwDHwNjPbBP99uIM/5qbGuh7Ykp0PdLDNuNrknVrx6w07vlRduado8HgkGvOoQh+E0HY37fYfutfWTvDIg0iIW4wXkUg241HJ6mHYGi4vBcEUhiPAP43WeODXm+ZxRri1gjTh5qEVvyUWY/eK6K2I55uEyXO5knNrYTYfpr4ntqUv7Qdp81BUK87SONJYFixxOYOlV7d77YiRWgvkaFrCRk/OwGbDqUZeQRfNxx1TmDnubXOiupvwaDTC0qBz9JLudkqOnSC1FTUwz+YvS8r+zmlcO+wIM0FpU7BTvUJDoMvCN6wFDH8iqKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HTMDqPnJAO8ukxU/OyQ6SxcZEtGPj2cCfm4781eG/lI=;
 b=e0+Xe6SNtCdp8TinwG5Y3U3KWdvldohofBYJc+BvaKu4iokq7fYlVUxDQE4sEJa/sVWpp4aNGnrtgYksdA4P/zBjuesdvjAKs7v24ipM7xEMl0AoyzXkbygcyRrti6ADaSOliR61MZeZfegS4i4pGGM/MaVQQ1kZivqYzMzFCO30d2r4fFbE7x6W5wQE3Z4RGpOxHvhQzaY3OInTBJeiVGrtS5VC0j6otNiQz5LfaUxmIpb6zbNvwtw4Id6PJ9tlpK+EV1YT5ewcIPVxv6v8GfEESOJAYDcceuny9gD3jqIV71+uP/0LkEHSG0+Nk/ThU2dIqxncBVe93eJCtQXHHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HTMDqPnJAO8ukxU/OyQ6SxcZEtGPj2cCfm4781eG/lI=;
 b=hdhexpfSY1Bs2bmSwbOsWlmt/VuNrOsDTiRT7tfAr08yGKflr2zY4ktXTwY1OWBEAjnioH/2t44JWsCHWDmPJLwdgds7vFbjgEvdObotf8mnGS/G1iHmKK8MFFziB1Vx3PhQ499zRq3j2huneSS5yi0rJzogpnLs88w8K2HHjeY=
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
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 2/6] xen/x86: move generically usable NUMA code from x86 to common
Date: Tue, 11 Oct 2022 19:17:04 +0800
Message-ID: <20221011111708.1272985-3-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221011111708.1272985-1-wei.chen@arm.com>
References: <20221011111708.1272985-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	VE1EUR03FT044:EE_|DBAPR08MB5768:EE_|DBAEUR03FT058:EE_|PAXPR08MB6431:EE_
X-MS-Office365-Filtering-Correlation-Id: a5104c61-8280-436b-e18f-08daab7a39c3
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 D9GeSJ6Pzi9+EMPYyyaJ8ovrqej0tqU/SdmMSG3TFo1HoUZosEI1zzlvBbhd2prapEPDUrics1c3r+uPMu2h1H+axnPKoN20LnO1Po2rjn17FyZ0jxeGxh+Z7T971DPO7tFnMikA7BOguZD3A95XlcnNAARKdnEt8b+GdIiiUL53vdr18wYsKizaUZ3RBG9gftE2cPyevvIGXylbUuRsve5iLoDV18xWvSIoGgk8GvLdu96Jz1R3v9kJqnP6ZSpSV85X98rz/jAkU6bD/55nfcqPQJ82h2xHIcP4eUfKCnM7LvflmY/PrE0vvl/O9yeRD8sn+QP4N/3T6ihMx3gS0yfII8KZN214waqg5pDic7pm4BQpErgqQ8yv6FuvoFDfi4jkc04VhtH6XWtYi80mV1b8d0Ybd+K8AZFTxXYz15XRuzgYa43Jr07O63iR3XUlOaJyI8Qo/JghyuUEoNztO5hjCDps9TbVijr9Zr48wiQNfm43EqTkvvsVuPx9qfdYEmieSx2zYA5VxWcR4FnnK5ATMFKBx/Lotk1ySY6BO0PfkLEPtJeMcCDemT8bC3devOdHwID8+qPS+4w31Papxa4ydIhmclFTqNz0mZ0QuyQ5SkzU3PnUfCxr9zD5S6nFKRaQhgfxUAiNoo6Zh0wqnhSuGjcojJ8N7t7b8Ea4WxnGZlf0mAMsjhL+yY1sEE68YeVErQQG7fUHwVDu2uM7b9oLDiOj2xDaW8iZv2dGdzRCW5otj5VQ9+C64O/rvzoo3vez3T6nnnTdLVtWl5CgQwqzlvSTknYCjyE+QyvUapxntY7pgPrq67Px6fazWqk0WjA6gGeRxXPDHdC9EonFbw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(39850400004)(346002)(136003)(451199015)(40470700004)(46966006)(36840700001)(6916009)(54906003)(316002)(70206006)(4326008)(8676002)(70586007)(6666004)(478600001)(5660300002)(26005)(41300700001)(81166007)(426003)(356005)(2906002)(336012)(44832011)(30864003)(2616005)(186003)(8936002)(1076003)(47076005)(7696005)(83380400001)(36756003)(36860700001)(82740400003)(86362001)(40460700003)(82310400005)(40480700001)(21314003)(36900700001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5768
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	30906582-eb93-467e-a8e6-08daab7a33a7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	C8+Uz/W0IOcUJQXzKaNS6enR8gDrzv3skAEHqIsJ7ITEv8UtuttbYTADd111dWCACD0oyNkK1WDClTTbqginFbDIKfcp+vGZBH3Ljn9mwCQRxgPehh4Tw9MN0O88Btpuvq1HnxkoYa0zUp57lzLH3Lz+ND7AT/ZabSoQCEDi+QPsp+vpj4qscfmXPHgWijrbHdBr2GWcmLir4sE2d7SLahuH91JWUFNaS0OkfDv3LT5ddmGd0Ud//FGeKXyp3qWXvvLkRgFhCX2YSjBFizR9jMgwKpbbViy3+t6eszl4x+3s9lK8E66ceaxfUezfDu2sQH6fFQL5goa3qEx03Fo1wfOm+oBhKesDkVUjZPaSTIGMHpElthC6bL/W58gtdFh/I8ZwT2b8c8eQWlqI06bsaWwcQJF/RQIdu+N/MjGn5k3OAoTFn8XUswkA+Ek8x8waLexdOlxWKbCyIbIe8gCGKJZF57Dreqz6cIijPvTg7hUuo4MqYwfRDtTuVrWXlw4YKg3m+NGcvBJSOrY/gCQwR56HONGRVw761hVgPMZA1KTpcFnKmRBYNT+0zosguJU8mpTDalLzl6+hhcYgHK+f87ku+RN4K5Y70V4Ic9jBzjc/rnZLtCrb4qsC3QqI/1WNWan3FE+AH+JliCLMiuqPTSsd/w0qo0s1l/5mJVNh8p/srrZ6IuGMDI5S2QL/zLy/J/qVsD9phPvCk2ke5WE5YH/AEg23XJGyuksUY9Al1YsUKFM/3UIEzcNKu12jKAbTet/1LXIoth+XwrxJsXRVwFzsAxSOcG7TGg0+bY8ZK3w=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(376002)(346002)(451199015)(40470700004)(36840700001)(46966006)(26005)(7696005)(40460700003)(41300700001)(2616005)(8936002)(107886003)(186003)(1076003)(6666004)(36756003)(426003)(82310400005)(8676002)(336012)(83380400001)(478600001)(316002)(54906003)(6916009)(81166007)(44832011)(5660300002)(47076005)(4326008)(70206006)(70586007)(30864003)(86362001)(36860700001)(2906002)(40480700001)(82740400003)(21314003)(579004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2022 11:17:46.9844
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5104c61-8280-436b-e18f-08daab7a39c3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6431

There are some codes in x86/numa.c can be shared by common
architectures to implememnt NUMA support. Just like some
variables and functions to check and store NUMA memory map.
And some variables and functions to do NUMA initialization.

In this patch, we move them to common/numa.c and xen/numa.h
and use the CONFIG_NUMA to gate them for non-NUMA supported
architectures. As the target header file is Xen-style, so
we trim some spaces and replace tabs for the codes that has
been moved to xen/numa.h at the same time.

As acpi_scan_nodes has been used in a common function, it
doesn't make sense to use acpi_xxx in common code, so we
rename it to numa_process_nodes in this patch too. After that
if we still use CONFIG_ACPI_NUMA in to gate numa_process_nodes
in numa_initmem_init, that doesn't make sense. As CONFIG_NUMA
will be selected by CONFIG_ACPI_NUMA for x86. So, we replace
CONFIG_ACPI_NUMA by CONFIG_NUMA to gate numa_process_nodes.

As arch_numa_disabled has been implememnted for ACPI NUMA,
we can rename srat_disabled to numa_disabled and move it
to common code as well.

The macro node_to_first_cpu(node) hasn't been used anywhere,
so we drop it in this patch too.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v5 -> v6:
 1. Replace numa_scan_node to numa_process_nodes in commit log.
 2. Limit the scope of page_num_node, vnuma and page of numa_setup
    function.
 3. Use memset to init page_num_node instead of for_each_online_node.
 4. Use %u instead of %d for nodeid_t and j in numa_setup print
    messages.
 5. Use min(PADDR_BITS, BITS_PER_LONG - 1) to calculate the shift
    when only one node is in the system.
 6. Drop the marco: node_to_first_cpu(node)
v4 -> v5:
 1. Use nodeid_t instead of uint8_t for memnodemap.
 2. Restore to use typeof(*memnodemap) for _memnodemap, this will avoid the
    further adjustments for _memnodemap's type.
 3. Use __ro_after_init for numa_off.
 4. Use pointer-to-const for proper function parameters.
 5. Use unsigned int for variables that are not realy used for node ID.
 6. Fix code comments code-style and adjust the length.
 7. Fix code-styles.
 8. Rename numa_scan_nodes to numa_process_nodes.
 9. Use a plain "int ret" to record compute_hash_shift return value.
v3 -> v4:
 1. Restore compute_hash_shift's return value to int.
 2. Remove unnecessary parentheses for macros.
 3. Use unsigned int for proper variables.
 4. Fix some code-style.
v2 -> v3:
 1. Remove acpi.h from common/numa.c.
 2. Rename acpi_scan_nodes to numa_scan_nodes.
 3. Replace u8 by uint8_t for memnodemap.
 4. Use unsigned int for memnode_shift and adjust related functions
    (compute_hash_shift, populate_memnodemap) to use correct types for
    return values or parameters.
 5. Use nodeid_t for nodeid and node numbers.
 6. Use __read_mostly and __ro_after_init for appropriate variables.
 7. Adjust the __read_mostly and __initdata location for some variables.
 8. convert from plain int to unsigned for cpuid and other proper variables.
 9. Use __attribute_pure__ instead of __attribute__((pure)).
10. Replace CONFIG_ACPI_NUMA by CONFIG_NUMA in numa_initmem_init.
11. Add const for some functions' parameters.
12. Move srat_disabled to common code with new name numa_disabled.
13. Fix some spaces code-style for numa_emulation.
14. Change from int to unsigned int for numa_fake.
v1 -> v2:
1. New patch in v2.
---
 xen/arch/x86/include/asm/acpi.h  |   1 -
 xen/arch/x86/include/asm/numa.h  |  57 +---
 xen/arch/x86/include/asm/setup.h |   1 -
 xen/arch/x86/numa.c              | 433 +---------------------------
 xen/arch/x86/smpboot.c           |   2 +-
 xen/arch/x86/srat.c              |  10 +-
 xen/common/Makefile              |   1 +
 xen/common/numa.c                | 464 +++++++++++++++++++++++++++++++
 xen/include/xen/numa.h           |  66 +++++
 9 files changed, 539 insertions(+), 496 deletions(-)
 create mode 100644 xen/common/numa.c

diff --git a/xen/arch/x86/include/asm/acpi.h b/xen/arch/x86/include/asm/acpi.h
index 9a9cc4c240..5c2dd5da2d 100644
--- a/xen/arch/x86/include/asm/acpi.h
+++ b/xen/arch/x86/include/asm/acpi.h
@@ -102,7 +102,6 @@ extern unsigned long acpi_wakeup_address;
 #define ARCH_HAS_POWER_INIT	1
 
 extern s8 acpi_numa;
-extern int acpi_scan_nodes(u64 start, u64 end);
 #define NR_NODE_MEMBLKS (MAX_NUMNODES*2)
 
 extern struct acpi_sleep_info acpi_sinfo;
diff --git a/xen/arch/x86/include/asm/numa.h b/xen/arch/x86/include/asm/numa.h
index 237f2c6dbf..6c87942d43 100644
--- a/xen/arch/x86/include/asm/numa.h
+++ b/xen/arch/x86/include/asm/numa.h
@@ -9,72 +9,17 @@ typedef u8 nodeid_t;
 
 extern int srat_rev;
 
-extern nodeid_t      cpu_to_node[NR_CPUS];
-extern cpumask_t     node_to_cpumask[];
-
-#define cpu_to_node(cpu)		(cpu_to_node[cpu])
-#define parent_node(node)		(node)
-#define node_to_first_cpu(node)  (__ffs(node_to_cpumask[node]))
-#define node_to_cpumask(node)    (node_to_cpumask[node])
-
-struct node { 
-	paddr_t start, end;
-};
-
-extern int compute_hash_shift(struct node *nodes, int numnodes,
-			      nodeid_t *nodeids);
 extern nodeid_t pxm_to_node(unsigned int pxm);
 
 #define ZONE_ALIGN (1UL << (MAX_ORDER+PAGE_SHIFT))
-#define VIRTUAL_BUG_ON(x) 
 
-extern void numa_add_cpu(int cpu);
-extern void numa_init_array(void);
-extern bool numa_off;
-
-extern int arch_numa_setup(const char *opt);
-extern bool arch_numa_disabled(void);
-extern bool srat_disabled(void);
-extern void numa_set_node(int cpu, nodeid_t node);
+extern bool numa_disabled(void);
 extern nodeid_t setup_node(unsigned int pxm);
 extern void srat_detect_node(int cpu);
 
-extern void setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end);
 extern nodeid_t apicid_to_node[];
 extern void init_cpu_to_node(void);
 
-static inline void clear_node_cpumask(int cpu)
-{
-	cpumask_clear_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
-}
-
-/* Simple perfect hash to map pdx to node numbers */
-extern int memnode_shift; 
-extern unsigned long memnodemapsize;
-extern u8 *memnodemap;
-
-struct node_data {
-    unsigned long node_start_pfn;
-    unsigned long node_spanned_pages;
-};
-
-extern struct node_data node_data[];
-
-static inline __attribute__((pure)) nodeid_t phys_to_nid(paddr_t addr)
-{ 
-	nodeid_t nid;
-	VIRTUAL_BUG_ON((paddr_to_pdx(addr) >> memnode_shift) >= memnodemapsize);
-	nid = memnodemap[paddr_to_pdx(addr) >> memnode_shift]; 
-	VIRTUAL_BUG_ON(nid >= MAX_NUMNODES || !node_data[nid]); 
-	return nid; 
-} 
-
-#define NODE_DATA(nid)		(&(node_data[nid]))
-
-#define node_start_pfn(nid)	(NODE_DATA(nid)->node_start_pfn)
-#define node_spanned_pages(nid)	(NODE_DATA(nid)->node_spanned_pages)
-#define node_end_pfn(nid)       (NODE_DATA(nid)->node_start_pfn + \
-				 NODE_DATA(nid)->node_spanned_pages)
 #define arch_want_default_dmazone() (num_online_nodes() > 1)
 
 extern int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node);
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index 21037b7f31..ae470ea12f 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -20,7 +20,6 @@ void early_time_init(void);
 
 void set_nr_cpu_ids(unsigned int max_cpus);
 
-void numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn);
 void arch_init_memory(void);
 void subarch_init_memory(void);
 
diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index 1c3198445d..90b2a22591 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -4,20 +4,11 @@
  * Adapted for Xen: Ryan Harper <ryanh@us.ibm.com>
  */ 
 
-#include <xen/mm.h>
-#include <xen/string.h>
 #include <xen/init.h>
-#include <xen/ctype.h>
+#include <xen/mm.h>
 #include <xen/nodemask.h>
 #include <xen/numa.h>
-#include <xen/keyhandler.h>
-#include <xen/param.h>
-#include <xen/time.h>
-#include <xen/smp.h>
-#include <xen/pfn.h>
 #include <asm/acpi.h>
-#include <xen/sched.h>
-#include <xen/softirq.h>
 
 #ifndef Dprintk
 #define Dprintk(x...)
@@ -26,28 +17,13 @@
 /* from proto.h */
 #define round_up(x,y) ((((x)+(y))-1) & (~((y)-1)))
 
-struct node_data node_data[MAX_NUMNODES];
-
-/* Mapping from pdx to node id */
-int memnode_shift;
-static typeof(*memnodemap) _memnodemap[64];
-unsigned long memnodemapsize;
-u8 *memnodemap;
-
-nodeid_t cpu_to_node[NR_CPUS] __read_mostly = {
-    [0 ... NR_CPUS-1] = NUMA_NO_NODE
-};
 /*
  * Keep BIOS's CPU2node information, should not be used for memory allocaion
  */
 nodeid_t apicid_to_node[MAX_LOCAL_APIC] = {
     [0 ... MAX_LOCAL_APIC-1] = NUMA_NO_NODE
 };
-cpumask_t node_to_cpumask[MAX_NUMNODES] __read_mostly;
 
-nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
-
-bool numa_off;
 s8 acpi_numa = 0;
 
 int __init arch_numa_setup(const char *opt)
@@ -69,270 +45,6 @@ bool arch_numa_disabled(void)
     return acpi_numa < 0;
 }
 
-bool srat_disabled(void)
-{
-    return numa_off || arch_numa_disabled();
-}
-
-/*
- * Given a shift value, try to populate memnodemap[]
- * Returns :
- * 1 if OK
- * 0 if memnodmap[] too small (of shift too small)
- * -1 if node overlap or lost ram (shift too big)
- */
-static int __init populate_memnodemap(const struct node *nodes,
-                                      int numnodes, int shift, nodeid_t *nodeids)
-{
-    int i, res = -1;
-
-    memset(memnodemap, NUMA_NO_NODE, memnodemapsize * sizeof(*memnodemap));
-    for ( i = 0; i < numnodes; i++ )
-    {
-        unsigned long spdx = paddr_to_pdx(nodes[i].start);
-        unsigned long epdx = paddr_to_pdx(nodes[i].end - 1);
-
-        if ( spdx > epdx )
-            continue;
-        if ( (epdx >> shift) >= memnodemapsize )
-            return 0;
-        do {
-            if ( memnodemap[spdx >> shift] != NUMA_NO_NODE &&
-                 (!nodeids || memnodemap[spdx >> shift] != nodeids[i]) )
-                return -1;
-
-            if ( !nodeids )
-                memnodemap[spdx >> shift] = i;
-            else
-                memnodemap[spdx >> shift] = nodeids[i];
-
-            spdx += (1UL << shift);
-        } while ( spdx <= epdx );
-        res = 1;
-    }
-
-    return res;
-}
-
-static int __init allocate_cachealigned_memnodemap(void)
-{
-    unsigned long size = PFN_UP(memnodemapsize * sizeof(*memnodemap));
-    unsigned long mfn = mfn_x(alloc_boot_pages(size, 1));
-
-    memnodemap = mfn_to_virt(mfn);
-    mfn <<= PAGE_SHIFT;
-    size <<= PAGE_SHIFT;
-    printk(KERN_DEBUG "NUMA: Allocated memnodemap from %lx - %lx\n",
-           mfn, mfn + size);
-    memnodemapsize = size / sizeof(*memnodemap);
-
-    return 0;
-}
-
-/*
- * The LSB of all start addresses in the node map is the value of the
- * maximum possible shift.
- */
-static int __init extract_lsb_from_nodes(const struct node *nodes,
-                                         int numnodes, const nodeid_t *nodeids)
-{
-    int i, nodes_used = 0;
-    unsigned long spdx, epdx;
-    unsigned long bitfield = 0, memtop = 0;
-
-    for ( i = 0; i < numnodes; i++ )
-    {
-        spdx = paddr_to_pdx(nodes[i].start);
-        epdx = paddr_to_pdx(nodes[i].end - 1) + 1;
-        if ( spdx >= epdx )
-            continue;
-        if ( i && (!nodeids || nodeids[i - 1] != nodeids[i]) )
-            bitfield |= spdx;
-        if ( !i || !nodeids || nodeids[i - 1] != nodeids[i] )
-            nodes_used++;
-        if ( epdx > memtop )
-            memtop = epdx;
-    }
-    if ( nodes_used <= 1 )
-        i = BITS_PER_LONG - 1;
-    else
-        i = find_first_bit(&bitfield, sizeof(unsigned long)*8);
-    memnodemapsize = ((memtop - 1) >> i) + 1;
-    return i;
-}
-
-int __init compute_hash_shift(struct node *nodes, int numnodes,
-                              nodeid_t *nodeids)
-{
-    int shift;
-
-    shift = extract_lsb_from_nodes(nodes, numnodes, nodeids);
-    if ( memnodemapsize <= ARRAY_SIZE(_memnodemap) )
-        memnodemap = _memnodemap;
-    else if ( allocate_cachealigned_memnodemap() )
-        return -1;
-    printk(KERN_DEBUG "NUMA: Using %d for the hash shift.\n", shift);
-
-    if ( populate_memnodemap(nodes, numnodes, shift, nodeids) != 1 )
-    {
-        printk(KERN_INFO "Your memory is not aligned you need to "
-               "rebuild your hypervisor with a bigger NODEMAPSIZE "
-               "shift=%d\n", shift);
-        return -1;
-    }
-
-    return shift;
-}
-/* initialize NODE_DATA given nodeid and start/end */
-void __init setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end)
-{
-    unsigned long start_pfn = paddr_to_pfn(start);
-    unsigned long end_pfn = paddr_to_pfn(end);
-
-    NODE_DATA(nodeid)->node_start_pfn = start_pfn;
-    NODE_DATA(nodeid)->node_spanned_pages = end_pfn - start_pfn;
-
-    node_set_online(nodeid);
-} 
-
-void __init numa_init_array(void)
-{
-    int rr, i;
-
-    /* There are unfortunately some poorly designed mainboards around
-       that only connect memory to a single CPU. This breaks the 1:1 cpu->node
-       mapping. To avoid this fill in the mapping for all possible
-       CPUs, as the number of CPUs is not known yet.
-       We round robin the existing nodes. */
-    rr = first_node(node_online_map);
-    for ( i = 0; i < nr_cpu_ids; i++ )
-    {
-        if ( cpu_to_node[i] != NUMA_NO_NODE )
-            continue;
-        numa_set_node(i, rr);
-        rr = cycle_node(rr, node_online_map);
-    }
-}
-
-#ifdef CONFIG_NUMA_EMU
-static int numa_fake __initdata = 0;
-
-/* Numa emulation */
-static int __init numa_emulation(unsigned long start_pfn,
-                                 unsigned long end_pfn)
-{
-    int i;
-    struct node nodes[MAX_NUMNODES];
-    uint64_t sz = pfn_to_paddr(end_pfn - start_pfn) / numa_fake;
-
-    /* Kludge needed for the hash function */
-    if ( hweight64(sz) > 1 )
-    {
-        u64 x = 1;
-        while ( (x << 1) < sz )
-            x <<= 1;
-        if ( x < sz/2 )
-            printk(KERN_ERR "Numa emulation unbalanced. Complain to maintainer\n");
-        sz = x;
-    }
-
-    memset(&nodes,0,sizeof(nodes));
-    for ( i = 0; i < numa_fake; i++ )
-    {
-        nodes[i].start = pfn_to_paddr(start_pfn) + i * sz;
-        if ( i == numa_fake - 1 )
-            sz = pfn_to_paddr(end_pfn) - nodes[i].start;
-        nodes[i].end = nodes[i].start + sz;
-        printk(KERN_INFO "Faking node %d at %"PRIx64"-%"PRIx64" (%"PRIu64"MB)\n",
-               i,
-               nodes[i].start, nodes[i].end,
-               (nodes[i].end - nodes[i].start) >> 20);
-        node_set_online(i);
-    }
-    memnode_shift = compute_hash_shift(nodes, numa_fake, NULL);
-    if ( memnode_shift < 0 )
-    {
-        memnode_shift = 0;
-        printk(KERN_ERR "No NUMA hash function found. Emulation disabled.\n");
-        return -1;
-    }
-    for_each_online_node ( i )
-        setup_node_bootmem(i, nodes[i].start, nodes[i].end);
-    numa_init_array();
-
-    return 0;
-}
-#endif
-
-void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
-{ 
-    int i;
-    paddr_t start = pfn_to_paddr(start_pfn);
-    paddr_t end = pfn_to_paddr(end_pfn);
-
-#ifdef CONFIG_NUMA_EMU
-    if ( numa_fake && !numa_emulation(start_pfn, end_pfn) )
-        return;
-#endif
-
-#ifdef CONFIG_ACPI_NUMA
-    if ( !numa_off && !acpi_scan_nodes(start, end) )
-        return;
-#endif
-
-    printk(KERN_INFO "%s\n",
-           numa_off ? "NUMA turned off" : "No NUMA configuration found");
-
-    printk(KERN_INFO "Faking a node at %"PRIpaddr"-%"PRIpaddr"\n",
-           start, end);
-    /* setup dummy node covering all memory */
-    memnode_shift = BITS_PER_LONG - 1;
-    memnodemap = _memnodemap;
-    /* Dummy node only uses 1 slot in reality */
-    memnodemap[0] = 0;
-    memnodemapsize = 1;
-
-    nodes_clear(node_online_map);
-    node_set_online(0);
-    for ( i = 0; i < nr_cpu_ids; i++ )
-        numa_set_node(i, 0);
-    cpumask_copy(&node_to_cpumask[0], cpumask_of(0));
-    setup_node_bootmem(0, start, end);
-}
-
-void numa_add_cpu(int cpu)
-{
-    cpumask_set_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
-} 
-
-void numa_set_node(int cpu, nodeid_t node)
-{
-    cpu_to_node[cpu] = node;
-}
-
-/* [numa=off] */
-static int __init cf_check numa_setup(const char *opt)
-{
-    if ( !strncmp(opt, "off", 3) )
-        numa_off = true;
-    else if ( !strncmp(opt, "on", 2) )
-        numa_off = false;
-#ifdef CONFIG_NUMA_EMU
-    else if ( !strncmp(opt, "fake=", 5) )
-    {
-        numa_off = false;
-        numa_fake = simple_strtoul(opt + 5, NULL, 0);
-        if ( numa_fake >= MAX_NUMNODES )
-            numa_fake = MAX_NUMNODES;
-    }
-#endif
-    else
-        return arch_numa_setup(opt);
-
-    return 0;
-} 
-custom_param("numa", numa_setup);
-
 /*
  * Setup early cpu_to_node.
  *
@@ -381,146 +93,3 @@ unsigned int __init arch_get_dma_bitsize(void)
                  flsl(node_start_pfn(node) + node_spanned_pages(node) / 4 - 1)
                  + PAGE_SHIFT, 32);
 }
-
-static void cf_check dump_numa(unsigned char key)
-{
-    s_time_t now = NOW();
-    unsigned int i, j, n;
-    struct domain *d;
-    struct page_info *page;
-    unsigned int page_num_node[MAX_NUMNODES];
-    const struct vnuma_info *vnuma;
-
-    printk("'%c' pressed -> dumping numa info (now = %"PRI_stime")\n", key,
-           now);
-
-    for_each_online_node ( i )
-    {
-        paddr_t pa = pfn_to_paddr(node_start_pfn(i) + 1);
-
-        printk("NODE%u start->%lu size->%lu free->%lu\n",
-               i, node_start_pfn(i), node_spanned_pages(i),
-               avail_node_heap_pages(i));
-        /* sanity check phys_to_nid() */
-        if ( phys_to_nid(pa) != i )
-            printk("phys_to_nid(%"PRIpaddr") -> %d should be %u\n",
-                   pa, phys_to_nid(pa), i);
-    }
-
-    j = cpumask_first(&cpu_online_map);
-    n = 0;
-    for_each_online_cpu ( i )
-    {
-        if ( i != j + n || cpu_to_node[j] != cpu_to_node[i] )
-        {
-            if ( n > 1 )
-                printk("CPU%u...%u -> NODE%d\n", j, j + n - 1, cpu_to_node[j]);
-            else
-                printk("CPU%u -> NODE%d\n", j, cpu_to_node[j]);
-            j = i;
-            n = 1;
-        }
-        else
-            ++n;
-    }
-    if ( n > 1 )
-        printk("CPU%u...%u -> NODE%d\n", j, j + n - 1, cpu_to_node[j]);
-    else
-        printk("CPU%u -> NODE%d\n", j, cpu_to_node[j]);
-
-    rcu_read_lock(&domlist_read_lock);
-
-    printk("Memory location of each domain:\n");
-    for_each_domain ( d )
-    {
-        process_pending_softirqs();
-
-        printk("Domain %u (total: %u):\n", d->domain_id, domain_tot_pages(d));
-
-        for_each_online_node ( i )
-            page_num_node[i] = 0;
-
-        spin_lock(&d->page_alloc_lock);
-        page_list_for_each(page, &d->page_list)
-        {
-            i = phys_to_nid(page_to_maddr(page));
-            page_num_node[i]++;
-        }
-        spin_unlock(&d->page_alloc_lock);
-
-        for_each_online_node ( i )
-            printk("    Node %u: %u\n", i, page_num_node[i]);
-
-        if ( !read_trylock(&d->vnuma_rwlock) )
-            continue;
-
-        if ( !d->vnuma )
-        {
-            read_unlock(&d->vnuma_rwlock);
-            continue;
-        }
-
-        vnuma = d->vnuma;
-        printk("     %u vnodes, %u vcpus, guest physical layout:\n",
-               vnuma->nr_vnodes, d->max_vcpus);
-        for ( i = 0; i < vnuma->nr_vnodes; i++ )
-        {
-            unsigned int start_cpu = ~0U;
-
-            if ( vnuma->vnode_to_pnode[i] == NUMA_NO_NODE )
-                printk("       %3u: pnode ???,", i);
-            else
-                printk("       %3u: pnode %3u,", i, vnuma->vnode_to_pnode[i]);
-
-            printk(" vcpus ");
-
-            for ( j = 0; j < d->max_vcpus; j++ )
-            {
-                if ( !(j & 0x3f) )
-                    process_pending_softirqs();
-
-                if ( vnuma->vcpu_to_vnode[j] == i )
-                {
-                    if ( start_cpu == ~0U )
-                    {
-                        printk("%d", j);
-                        start_cpu = j;
-                    }
-                }
-                else if ( start_cpu != ~0U )
-                {
-                    if ( j - 1 != start_cpu )
-                        printk("-%d ", j - 1);
-                    else
-                        printk(" ");
-                    start_cpu = ~0U;
-                }
-            }
-
-            if ( start_cpu != ~0U  && start_cpu != j - 1 )
-                printk("-%d", j - 1);
-
-            printk("\n");
-
-            for ( j = 0; j < vnuma->nr_vmemranges; j++ )
-            {
-                if ( vnuma->vmemrange[j].nid == i )
-                    printk("           %016"PRIx64" - %016"PRIx64"\n",
-                           vnuma->vmemrange[j].start,
-                           vnuma->vmemrange[j].end);
-            }
-        }
-
-        read_unlock(&d->vnuma_rwlock);
-    }
-
-    rcu_read_unlock(&domlist_read_lock);
-}
-
-static int __init cf_check register_numa_trigger(void)
-{
-    register_keyhandler('u', dump_numa, "dump NUMA info", 1);
-    return 0;
-}
-__initcall(register_numa_trigger);
-
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index b46fd9ab18..9df08e9366 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -1350,7 +1350,7 @@ int cpu_add(uint32_t apic_id, uint32_t acpi_id, uint32_t pxm)
 
     x86_acpiid_to_apicid[acpi_id] = apic_id;
 
-    if ( !srat_disabled() )
+    if ( !numa_disabled() )
     {
         nodeid_t node = setup_node(pxm);
 
diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index fbcd8749c4..ce507dac9e 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -238,7 +238,7 @@ acpi_numa_x2apic_affinity_init(const struct acpi_srat_x2apic_cpu_affinity *pa)
 	unsigned pxm;
 	nodeid_t node;
 
-	if (srat_disabled())
+	if (numa_disabled())
 		return;
 	if (pa->header.length < sizeof(struct acpi_srat_x2apic_cpu_affinity)) {
 		bad_srat();
@@ -274,7 +274,7 @@ acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *pa)
 	unsigned pxm;
 	nodeid_t node;
 
-	if (srat_disabled())
+	if (numa_disabled())
 		return;
 	if (pa->header.length != sizeof(struct acpi_srat_cpu_affinity)) {
 		bad_srat();
@@ -314,7 +314,7 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 	unsigned int i;
 	bool next = false;
 
-	if (srat_disabled())
+	if (numa_disabled())
 		return;
 	if (ma->header.length != sizeof(struct acpi_srat_mem_affinity)) {
 		bad_srat();
@@ -543,8 +543,8 @@ void __init srat_parse_regions(paddr_t addr)
 	pfn_pdx_hole_setup(mask >> PAGE_SHIFT);
 }
 
-/* Use the information discovered above to actually set up the nodes. */
-int __init acpi_scan_nodes(paddr_t start, paddr_t end)
+/* Use discovered information to actually set up the nodes. */
+int __init numa_process_nodes(paddr_t start, paddr_t end)
 {
 	int i;
 	nodemask_t all_nodes_parsed;
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 3baf83d527..9a3a12b12d 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_MEM_ACCESS) += mem_access.o
 obj-y += memory.o
 obj-y += multicall.o
 obj-y += notifier.o
+obj-$(CONFIG_NUMA) += numa.o
 obj-y += page_alloc.o
 obj-$(CONFIG_HAS_PDX) += pdx.o
 obj-$(CONFIG_PERF_COUNTERS) += perfc.o
diff --git a/xen/common/numa.c b/xen/common/numa.c
new file mode 100644
index 0000000000..3ad3a5138b
--- /dev/null
+++ b/xen/common/numa.c
@@ -0,0 +1,464 @@
+/*
+ * Generic VM initialization for NUMA setups.
+ * Copyright 2002,2003 Andi Kleen, SuSE Labs.
+ * Adapted for Xen: Ryan Harper <ryanh@us.ibm.com>
+ */
+
+#include <xen/init.h>
+#include <xen/keyhandler.h>
+#include <xen/mm.h>
+#include <xen/nodemask.h>
+#include <xen/numa.h>
+#include <xen/param.h>
+#include <xen/sched.h>
+#include <xen/softirq.h>
+
+struct node_data __ro_after_init node_data[MAX_NUMNODES];
+
+/* Mapping from pdx to node id */
+unsigned int __ro_after_init memnode_shift;
+unsigned long __ro_after_init memnodemapsize;
+nodeid_t *__ro_after_init memnodemap;
+static typeof(*memnodemap) __ro_after_init _memnodemap[64];
+
+nodeid_t __read_mostly cpu_to_node[NR_CPUS] = {
+    [0 ... NR_CPUS-1] = NUMA_NO_NODE
+};
+
+cpumask_t __read_mostly node_to_cpumask[MAX_NUMNODES];
+
+nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
+
+bool __ro_after_init numa_off;
+
+bool numa_disabled(void)
+{
+    return numa_off || arch_numa_disabled();
+}
+
+/*
+ * Given a shift value, try to populate memnodemap[]
+ * Returns :
+ * 1 if OK
+ * 0 if memnodmap[] too small (of shift too small)
+ * -1 if node overlap or lost ram (shift too big)
+ */
+static int __init populate_memnodemap(const struct node *nodes,
+                                      unsigned int numnodes, unsigned int shift,
+                                      const nodeid_t *nodeids)
+{
+    unsigned int i;
+    int res = -1;
+
+    memset(memnodemap, NUMA_NO_NODE, memnodemapsize * sizeof(*memnodemap));
+
+    for ( i = 0; i < numnodes; i++ )
+    {
+        unsigned long spdx = paddr_to_pdx(nodes[i].start);
+        unsigned long epdx = paddr_to_pdx(nodes[i].end - 1);
+
+        if ( spdx > epdx )
+            continue;
+
+        if ( (epdx >> shift) >= memnodemapsize )
+            return 0;
+
+        do {
+            if ( memnodemap[spdx >> shift] != NUMA_NO_NODE &&
+                 (!nodeids || memnodemap[spdx >> shift] != nodeids[i]) )
+                return -1;
+
+            if ( !nodeids )
+                memnodemap[spdx >> shift] = i;
+            else
+                memnodemap[spdx >> shift] = nodeids[i];
+
+            spdx += (1UL << shift);
+        } while ( spdx <= epdx );
+
+        res = 1;
+    }
+
+    return res;
+}
+
+static int __init allocate_cachealigned_memnodemap(void)
+{
+    unsigned long size = PFN_UP(memnodemapsize * sizeof(*memnodemap));
+    unsigned long mfn = mfn_x(alloc_boot_pages(size, 1));
+
+    memnodemap = mfn_to_virt(mfn);
+    mfn <<= PAGE_SHIFT;
+    size <<= PAGE_SHIFT;
+    printk(KERN_DEBUG "NUMA: Allocated memnodemap from %lx - %lx\n",
+           mfn, mfn + size);
+    memnodemapsize = size / sizeof(*memnodemap);
+
+    return 0;
+}
+
+/*
+ * The LSB of all start addresses in the node map is the value of the
+ * maximum possible shift.
+ */
+static unsigned int __init extract_lsb_from_nodes(const struct node *nodes,
+                                                  nodeid_t numnodes,
+                                                  const nodeid_t *nodeids)
+{
+    unsigned int i, nodes_used = 0;
+    unsigned long bitfield = 0, memtop = 0;
+
+    for ( i = 0; i < numnodes; i++ )
+    {
+        unsigned long spdx = paddr_to_pdx(nodes[i].start);
+        unsigned long epdx = paddr_to_pdx(nodes[i].end - 1) + 1;
+
+        if ( spdx >= epdx )
+            continue;
+
+        if ( i && (!nodeids || nodeids[i - 1] != nodeids[i]) )
+            bitfield |= spdx;
+
+        if ( !i || !nodeids || nodeids[i - 1] != nodeids[i] )
+            nodes_used++;
+
+        if ( epdx > memtop )
+            memtop = epdx;
+    }
+
+    if ( nodes_used <= 1 )
+        i = min(PADDR_BITS, BITS_PER_LONG - 1);
+    else
+        i = find_first_bit(&bitfield, sizeof(unsigned long) * 8);
+
+    memnodemapsize = ((memtop - 1) >> i) + 1;
+
+    return i;
+}
+
+int __init compute_hash_shift(const struct node *nodes,
+                              unsigned int numnodes, const nodeid_t *nodeids)
+{
+    unsigned int shift = extract_lsb_from_nodes(nodes, numnodes, nodeids);
+
+    if ( memnodemapsize <= ARRAY_SIZE(_memnodemap) )
+        memnodemap = _memnodemap;
+    else if ( allocate_cachealigned_memnodemap() )
+        return -1;
+
+    printk(KERN_DEBUG "NUMA: Using %u for the hash shift\n", shift);
+
+    if ( populate_memnodemap(nodes, numnodes, shift, nodeids) != 1 )
+    {
+        printk(KERN_INFO "Your memory is not aligned you need to "
+               "rebuild your hypervisor with a bigger NODEMAPSIZE "
+               "shift=%u\n", shift);
+        return -1;
+    }
+
+    return shift;
+}
+
+/* Initialize NODE_DATA given nodeid and start/end */
+void __init setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end)
+{
+    unsigned long start_pfn = paddr_to_pfn(start);
+    unsigned long end_pfn = paddr_to_pfn(end);
+
+    NODE_DATA(nodeid)->node_start_pfn = start_pfn;
+    NODE_DATA(nodeid)->node_spanned_pages = end_pfn - start_pfn;
+
+    node_set_online(nodeid);
+}
+
+void __init numa_init_array(void)
+{
+    unsigned int i;
+    nodeid_t rr;
+
+    /*
+     * There are unfortunately some poorly designed mainboards
+     * around that only connect memory to a single CPU. This
+     * breaks the 1:1 cpu->node mapping. To avoid this fill in
+     * the mapping for all possible CPUs, as the number of CPUs
+     * is not known yet. We round robin the existing nodes.
+     */
+    rr = first_node(node_online_map);
+    for ( i = 0; i < nr_cpu_ids; i++ )
+    {
+        if ( cpu_to_node[i] != NUMA_NO_NODE )
+            continue;
+        numa_set_node(i, rr);
+        rr = cycle_node(rr, node_online_map);
+    }
+}
+
+#ifdef CONFIG_NUMA_EMU
+static unsigned int __initdata numa_fake;
+
+/* Numa emulation */
+static int __init numa_emulation(unsigned long start_pfn,
+                                 unsigned long end_pfn)
+{
+    int ret;
+    unsigned int i;
+    struct node nodes[MAX_NUMNODES];
+    uint64_t sz = pfn_to_paddr(end_pfn - start_pfn) / numa_fake;
+
+    /* Kludge needed for the hash function */
+    if ( hweight64(sz) > 1 )
+    {
+        uint64_t x = 1;
+
+        while ( (x << 1) < sz )
+            x <<= 1;
+        if ( x < sz / 2 )
+            printk(KERN_ERR "Numa emulation unbalanced. Complain to maintainer\n");
+        sz = x;
+    }
+
+    memset(&nodes, 0, sizeof(nodes));
+    for ( i = 0; i < numa_fake; i++ )
+    {
+        nodes[i].start = pfn_to_paddr(start_pfn) + i * sz;
+
+        if ( i == numa_fake - 1 )
+            sz = pfn_to_paddr(end_pfn) - nodes[i].start;
+
+        nodes[i].end = nodes[i].start + sz;
+        printk(KERN_INFO "Faking node %u at %"PRIx64"-%"PRIx64" (%"PRIu64"MB)\n",
+               i, nodes[i].start, nodes[i].end,
+               (nodes[i].end - nodes[i].start) >> 20);
+        node_set_online(i);
+    }
+
+    ret = compute_hash_shift(nodes, numa_fake, NULL);
+    if ( ret < 0 )
+    {
+        printk(KERN_ERR "No NUMA hash function found. Emulation disabled.\n");
+        return -1;
+    }
+    memnode_shift = ret;
+
+    for_each_online_node ( i )
+        setup_node_bootmem(i, nodes[i].start, nodes[i].end);
+
+    numa_init_array();
+
+    return 0;
+}
+#endif
+
+void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
+{
+    unsigned int i;
+    paddr_t start = pfn_to_paddr(start_pfn);
+    paddr_t end = pfn_to_paddr(end_pfn);
+
+#ifdef CONFIG_NUMA_EMU
+    if ( numa_fake && !numa_emulation(start_pfn, end_pfn) )
+        return;
+#endif
+
+#ifdef CONFIG_NUMA
+    if ( !numa_off && !numa_process_nodes(start, end) )
+        return;
+#endif
+
+    printk(KERN_INFO "%s\n",
+           numa_off ? "NUMA turned off" : "No NUMA configuration found");
+
+    printk(KERN_INFO "Faking a node at %"PRIpaddr"-%"PRIpaddr"\n",
+           start, end);
+
+    /* Setup dummy node covering all memory */
+    memnode_shift = BITS_PER_LONG - 1;
+    memnodemap = _memnodemap;
+
+    /* Dummy node only uses 1 slot in reality */
+    memnodemap[0] = 0;
+    memnodemapsize = 1;
+
+    nodes_clear(node_online_map);
+    node_set_online(0);
+    for ( i = 0; i < nr_cpu_ids; i++ )
+        numa_set_node(i, 0);
+
+    cpumask_copy(&node_to_cpumask[0], cpumask_of(0));
+    setup_node_bootmem(0, start, end);
+}
+
+void numa_add_cpu(unsigned int cpu)
+{
+    cpumask_set_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
+}
+
+void numa_set_node(unsigned int cpu, nodeid_t node)
+{
+    cpu_to_node[cpu] = node;
+}
+
+/* [numa=off] */
+static int __init cf_check numa_setup(const char *opt)
+{
+    if ( !strncmp(opt, "off", 3) )
+        numa_off = true;
+    else if ( !strncmp(opt, "on", 2) )
+        numa_off = false;
+#ifdef CONFIG_NUMA_EMU
+    else if ( !strncmp(opt, "fake=", 5) )
+    {
+        numa_off = false;
+        numa_fake = simple_strtoul(opt + 5, NULL, 0);
+        if ( numa_fake >= MAX_NUMNODES )
+            numa_fake = MAX_NUMNODES;
+    }
+#endif
+    else
+        return arch_numa_setup(opt);
+
+    return 0;
+}
+custom_param("numa", numa_setup);
+
+static void cf_check dump_numa(unsigned char key)
+{
+    s_time_t now = NOW();
+    unsigned int i, j, n;
+    struct domain *d;
+
+    printk("'%c' pressed -> dumping numa info (now = %"PRI_stime")\n", key,
+           now);
+
+    for_each_online_node ( i )
+    {
+        paddr_t pa = pfn_to_paddr(node_start_pfn(i) + 1);
+
+        printk("NODE%u start->%lu size->%lu free->%lu\n",
+               i, node_start_pfn(i), node_spanned_pages(i),
+               avail_node_heap_pages(i));
+        /* Sanity check phys_to_nid() */
+        if ( phys_to_nid(pa) != i )
+            printk("phys_to_nid(%"PRIpaddr") -> %u should be %u\n",
+                   pa, phys_to_nid(pa), i);
+    }
+
+    j = cpumask_first(&cpu_online_map);
+    n = 0;
+    for_each_online_cpu ( i )
+    {
+        if ( i != j + n || cpu_to_node[j] != cpu_to_node[i] )
+        {
+            if ( n > 1 )
+                printk("CPU%u...%u -> NODE%u\n", j, j + n - 1, cpu_to_node[j]);
+            else
+                printk("CPU%u -> NODE%u\n", j, cpu_to_node[j]);
+            j = i;
+            n = 1;
+        }
+        else
+            ++n;
+    }
+    if ( n > 1 )
+        printk("CPU%u...%u -> NODE%u\n", j, j + n - 1, cpu_to_node[j]);
+    else
+        printk("CPU%u -> NODE%u\n", j, cpu_to_node[j]);
+
+    rcu_read_lock(&domlist_read_lock);
+
+    printk("Memory location of each domain:\n");
+    for_each_domain ( d )
+    {
+        const struct page_info *page;
+        unsigned int page_num_node[MAX_NUMNODES];
+        const struct vnuma_info *vnuma;
+
+        process_pending_softirqs();
+
+        printk("Domain %u (total: %u):\n", d->domain_id, domain_tot_pages(d));
+
+        memset(page_num_node, 0, sizeof(unsigned int) * MAX_NUMNODES);
+
+        spin_lock(&d->page_alloc_lock);
+        page_list_for_each ( page, &d->page_list )
+        {
+            i = phys_to_nid(page_to_maddr(page));
+            page_num_node[i]++;
+        }
+        spin_unlock(&d->page_alloc_lock);
+
+        for_each_online_node ( i )
+            printk("    Node %u: %u\n", i, page_num_node[i]);
+
+        if ( !read_trylock(&d->vnuma_rwlock) )
+            continue;
+
+        if ( !d->vnuma )
+        {
+            read_unlock(&d->vnuma_rwlock);
+            continue;
+        }
+
+        vnuma = d->vnuma;
+        printk("     %u vnodes, %u vcpus, guest physical layout:\n",
+               vnuma->nr_vnodes, d->max_vcpus);
+        for ( i = 0; i < vnuma->nr_vnodes; i++ )
+        {
+            unsigned int start_cpu = ~0U;
+
+            if ( vnuma->vnode_to_pnode[i] == NUMA_NO_NODE )
+                printk("       %3u: pnode ???,", i);
+            else
+                printk("       %3u: pnode %3u,", i, vnuma->vnode_to_pnode[i]);
+
+            printk(" vcpus ");
+
+            for ( j = 0; j < d->max_vcpus; j++ )
+            {
+                if ( !(j & 0x3f) )
+                    process_pending_softirqs();
+
+                if ( vnuma->vcpu_to_vnode[j] == i )
+                {
+                    if ( start_cpu == ~0U )
+                    {
+                        printk("%u", j);
+                        start_cpu = j;
+                    }
+                }
+                else if ( start_cpu != ~0U )
+                {
+                    if ( j - 1 != start_cpu )
+                        printk("-%u ", j - 1);
+                    else
+                        printk(" ");
+                    start_cpu = ~0U;
+                }
+            }
+
+            if ( start_cpu != ~0U  && start_cpu != j - 1 )
+                printk("-%u", j - 1);
+
+            printk("\n");
+
+            for ( j = 0; j < vnuma->nr_vmemranges; j++ )
+            {
+                if ( vnuma->vmemrange[j].nid == i )
+                    printk("           %016"PRIx64" - %016"PRIx64"\n",
+                           vnuma->vmemrange[j].start,
+                           vnuma->vmemrange[j].end);
+            }
+        }
+
+        read_unlock(&d->vnuma_rwlock);
+    }
+
+    rcu_read_unlock(&domlist_read_lock);
+}
+
+static int __init cf_check register_numa_trigger(void)
+{
+    register_keyhandler('u', dump_numa, "dump NUMA info", 1);
+    return 0;
+}
+__initcall(register_numa_trigger);
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index 7aef1a88dc..5b3877344b 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -18,4 +18,70 @@
   (((d)->vcpu != NULL && (d)->vcpu[0] != NULL) \
    ? vcpu_to_node((d)->vcpu[0]) : NUMA_NO_NODE)
 
+/* The following content can be used when NUMA feature is enabled */
+#ifdef CONFIG_NUMA
+
+extern nodeid_t      cpu_to_node[NR_CPUS];
+extern cpumask_t     node_to_cpumask[];
+
+#define cpu_to_node(cpu)        cpu_to_node[cpu]
+#define parent_node(node)       (node)
+#define node_to_cpumask(node)   node_to_cpumask[node]
+
+struct node {
+    paddr_t start, end;
+};
+
+extern int compute_hash_shift(const struct node *nodes,
+                              unsigned int numnodes, const nodeid_t *nodeids);
+
+#define VIRTUAL_BUG_ON(x)
+
+extern bool numa_off;
+
+extern void numa_add_cpu(unsigned int cpu);
+extern void numa_init_array(void);
+extern void numa_set_node(unsigned int cpu, nodeid_t node);
+extern void numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn);
+extern int numa_process_nodes(paddr_t start, paddr_t end);
+
+extern int arch_numa_setup(const char *opt);
+extern bool arch_numa_disabled(void);
+extern void setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end);
+
+static inline void clear_node_cpumask(unsigned int cpu)
+{
+    cpumask_clear_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
+}
+
+/* Simple perfect hash to map pdx to node numbers */
+extern unsigned int memnode_shift;
+extern unsigned long memnodemapsize;
+extern uint8_t *memnodemap;
+
+struct node_data {
+    unsigned long node_start_pfn;
+    unsigned long node_spanned_pages;
+};
+
+extern struct node_data node_data[];
+
+static inline nodeid_t __attribute_pure__ phys_to_nid(paddr_t addr)
+{
+    nodeid_t nid;
+    VIRTUAL_BUG_ON((paddr_to_pdx(addr) >> memnode_shift) >= memnodemapsize);
+    nid = memnodemap[paddr_to_pdx(addr) >> memnode_shift];
+    VIRTUAL_BUG_ON(nid >= MAX_NUMNODES || !node_data[nid]);
+    return nid;
+}
+
+#define NODE_DATA(nid)          (&node_data[nid])
+
+#define node_start_pfn(nid)     (NODE_DATA(nid)->node_start_pfn)
+#define node_spanned_pages(nid) (NODE_DATA(nid)->node_spanned_pages)
+#define node_end_pfn(nid)       (NODE_DATA(nid)->node_start_pfn + \
+                                 NODE_DATA(nid)->node_spanned_pages)
+
+#endif
+
 #endif /* _XEN_NUMA_H */
-- 
2.25.1


