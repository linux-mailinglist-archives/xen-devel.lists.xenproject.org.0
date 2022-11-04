Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54604619434
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 11:08:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437430.691859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqtd0-0004Fr-Tx; Fri, 04 Nov 2022 10:08:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437430.691859; Fri, 04 Nov 2022 10:08:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqtd0-00049f-N7; Fri, 04 Nov 2022 10:08:46 +0000
Received: by outflank-mailman (input) for mailman id 437430;
 Fri, 04 Nov 2022 10:08:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U/tm=3E=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oqtcy-0002Y7-JR
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 10:08:44 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2051.outbound.protection.outlook.com [40.107.20.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9834fb9-5c28-11ed-91b5-6bf2151ebd3b;
 Fri, 04 Nov 2022 11:08:43 +0100 (CET)
Received: from AM6P195CA0090.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::31)
 by AM7PR08MB5334.eurprd08.prod.outlook.com (2603:10a6:20b:10b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Fri, 4 Nov
 2022 10:08:40 +0000
Received: from AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:86:cafe::2c) by AM6P195CA0090.outlook.office365.com
 (2603:10a6:209:86::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Fri, 4 Nov 2022 10:08:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT036.mail.protection.outlook.com (100.127.140.93) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Fri, 4 Nov 2022 10:08:40 +0000
Received: ("Tessian outbound 2ff13c8f2c05:v130");
 Fri, 04 Nov 2022 10:08:40 +0000
Received: from bd3c1988a2b2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F6494548-0940-46B1-A021-CBE7B3845746.1; 
 Fri, 04 Nov 2022 10:08:32 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bd3c1988a2b2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 04 Nov 2022 10:08:32 +0000
Received: from AM7PR02CA0014.eurprd02.prod.outlook.com (2603:10a6:20b:100::24)
 by AS8PR08MB6309.eurprd08.prod.outlook.com (2603:10a6:20b:29f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 4 Nov
 2022 10:08:31 +0000
Received: from AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::17) by AM7PR02CA0014.outlook.office365.com
 (2603:10a6:20b:100::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Fri, 4 Nov 2022 10:08:31 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM7EUR03FT009.mail.protection.outlook.com (100.127.140.130) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5791.20 via Frontend Transport; Fri, 4 Nov 2022 10:08:31 +0000
Received: from AZ-NEU-EX02.Emea.Arm.com (10.251.26.5) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Fri, 4 Nov
 2022 10:08:25 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX02.Emea.Arm.com
 (10.251.26.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Fri, 4 Nov
 2022 10:08:25 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Fri, 4 Nov 2022 10:08:23 +0000
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
X-Inumbo-ID: a9834fb9-5c28-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=SmjNVhBrY2a/N0QLeJvOfPZy9boen/jZdQihyW8iXtevQWMaxuBRx/3u9reilcDqn70nLXKFgC8TGDpeV9MF08Yob2y7k8oljRjP0b1TTk3vPE7ly7hos6r1YfBzaKrQPU2EkvWnVwkiKVtIDr8XU0goaTMvFwtWyaUFSyJq8TaaFN0ExXhqCRXQpEbHBiuF6FQF3LZ8asE5XJ0LiwKrMnt27eBoUo26m4NPhhTCie+5kLaAF0hojIxiomZbUmEPFKegXqSXxMPd8II2gjeYU5T1tdfyoEOI6AoHzMJwO+J/Xx1W38dH+uIZJndbnTM5dz2724bPE9lPrSTqkTc3Pg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QEGGe51xBf66cJ8lTCTtNdnFfG5UAX6eLZoV+aKMZdg=;
 b=i0im5/1eiFpjrX8O6Q6kWzlU/N2nHNgfeDS49PsppCeLv8r7MCggVaC1jHp75yRhhd3XoilHetT/vNCNXQts8gG8PGErbIaBVtPQksJ4G5xpXFAAbi/s8pNR9isEUaALzbVzv4yQCVD8WUvLposQGcE7kG3vpcKJpw51KRXIWLWekntKJOvz5CuDKUesvob14Abx1df7LNqPyd4h6YoPOJPUODGXAys3RulnKeYli/1hK4lj9Tn0UHyHwB7GPXqzGPCZrSxx9qwwyS0+k0bV3haBq4BKat0MYLJf5i5+Xw5sxsd32Lv+uNZ2lOfgDFkJ2IoQHoaJb01RDuIueJlcPQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QEGGe51xBf66cJ8lTCTtNdnFfG5UAX6eLZoV+aKMZdg=;
 b=Vq/14ZXGpx79NVs+UcDyjqwC1P6tohGTJzwMNaFQ2tYctUc9JTV0xgWxjTVTIY8loN1kx5v5wC8Q+/mRKv9W8pFIesqsTEuPCprNBY03opSzBDU72ntkwFe0oaFjwvAxjwiyatNZVtBFdFxQzDwwTyoGSedyJVUOvzZtF0YoDkU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 322a1d7af70cd862
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CliEriNERFtzP+xi5bu7V7TjxiT+bclBqw0beYqJrKKEiSgpZXY8w1Mr0vaSiPEDLWu0m80PswXpVoYYv6qC+6L/AutfwhCy66RO+Lw0hLOCo/IcWhFR5XA1bv2XwXqQGsc9DVXEvsu2yfdm+9Z0nKTkBmf3Wx3ysS6964wpUoIr4dIJKUpS1ec2ZNVX0f/Jk+kIyfaPcY8XB/s3fbroX58kErFM5T8mk89yF/QAhr6UJ1LjF/YEOHkjjbePG9+acUt5DSBId2mAfQY0hYgRJtwQ7sZtuBCkPyWTiJw34Y2FFCwJ8hGl1/XD1Qc0Y6OemGBj2Z4j4WM+9zDezV/9yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QEGGe51xBf66cJ8lTCTtNdnFfG5UAX6eLZoV+aKMZdg=;
 b=XjjTY2sBt/whTTjvB+A3dg4A64qnI/QG6FoWL5BsGR0s1FOL1wErH5yJhiC1lueJ2ZDTvbnUYqC7CQduDhd/mHNwMRT4O/niKb6/617JAlDrAXBv53gS1cJDirnK4r9VIo+HdnbEIhBNRmBksNKrcNkU88YrpMK+kJbu4yEMrlxBXzh8L+OxVk8Ieo/oC2ucU3wmYooaJKKmSmO9yW0cq6ueLtW2967oxFHRTIzGTD9ccyvnYSCkg52vOEtMZkaYpW5UehLFBMHa0iWMg6KbyEFzXTbuPDVMhr33qfCd4BS39v+3WFIg3CccAseegbTfe2Op0TC8sqS2sVQm/0/7bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QEGGe51xBf66cJ8lTCTtNdnFfG5UAX6eLZoV+aKMZdg=;
 b=Vq/14ZXGpx79NVs+UcDyjqwC1P6tohGTJzwMNaFQ2tYctUc9JTV0xgWxjTVTIY8loN1kx5v5wC8Q+/mRKv9W8pFIesqsTEuPCprNBY03opSzBDU72ntkwFe0oaFjwvAxjwiyatNZVtBFdFxQzDwwTyoGSedyJVUOvzZtF0YoDkU=
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
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v6 06/11] xen/arm: split MMU and MPU config files from config.h
Date: Fri, 4 Nov 2022 18:07:36 +0800
Message-ID: <20221104100741.2176307-7-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104100741.2176307-1-wei.chen@arm.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	AM7EUR03FT009:EE_|AS8PR08MB6309:EE_|AM7EUR03FT036:EE_|AM7PR08MB5334:EE_
X-MS-Office365-Filtering-Correlation-Id: 04129640-a6d0-4e2e-420a-08dabe4c8c22
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 wCE3wNAnJ92tAPDGB3iDN6xPwim6fG/j7ZvTuFeLH7lBZJin8dwb+4Nw0UZjT53PLR7m2eYcSHoeG8zio3U58vWsGpxFkkdq827WI+kqKj3daOL49IWb3j8OwJmdAqxPyfI7oGFjNFb1wxY9p2uWbvpr7YTGizZRDjH9Dqk3nGgHrp/6ssEY00WJx2Ofzj9Oewi5RMw5sbEPeuVifdJfG0L/kmdLNI9ZIzTrEgxqvEK9z1TP+C7CtMHJ3s3Z0TDxZAJ8XRcCwnMaqUGp7ZHDTIPXQXKwkyTgBTSz89di376A2Sg1zJIH3v+zgphRj8cypFUF7TvET+0RSJ57NSUwwTF3xuZ2MfGPUqw34JRU40cKrRgec1UbnJa0dl64WzkRGnK6SgYRzlNiJvL3V4I7VqYewC9gc9yU+pA8q0MBz9pC7kTdJuXcljWG9IhNZDwtIXDh3zJCEsbjy8/vi7sHZQCaj9uI5z77YuM82kL+pE6nS0QHUOAVBrs4cdmR1FUaaJsECZ2xXDIq3YM/aMWtgygXJ+OhLgQk/PQrmsBjQGFD7CM3CNx7HUmTaD/ikzjBYVmKQSvrzDoZjPg1RnvEi+6Naeg1RS9R03v3qyfXjvmbwLc+6eET1NhexDfQM/cSz0ldZyl1zH8wmG9rtaJxE5XmXocnPz6uhW06Dr++XgR2TTBRQJTtlkWWWONUf50McWNyCVf+iKuoCBQE8r2daSyJi3Q4WWuCJLcpXy6eNdoDbrSM/5OwjCtCX42cXHOnynOvTFJOfAxHV1KgNiPUN6zmF8VYZZ60k1fS6ruAWIsft57i3o/380aet88OcAkC
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(39860400002)(136003)(346002)(451199015)(46966006)(40470700004)(36840700001)(83380400001)(81166007)(336012)(8676002)(426003)(47076005)(36860700001)(86362001)(44832011)(2906002)(82740400003)(5660300002)(4326008)(41300700001)(8936002)(6666004)(70206006)(7696005)(40460700003)(26005)(82310400005)(54906003)(316002)(6916009)(2616005)(40480700001)(356005)(478600001)(186003)(70586007)(1076003)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6309
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	273f993d-2a4e-431d-ac83-08dabe4c86b0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qjiJjwBs3UtWp8u91GRrSKzCm4pvpkUoV4KJrhMvgjLOvAQknSHKu3PWBagqZopY+/EV/KJDCpY3ah2NX5g5OL06x8AyyeDhJxjIZ7SXz5bFx/qvpu4zFVfMmiJPsuCgvY6tvhNMz1l5JIWxzg2E3Age1LFX44T7LUyWb+ue4KzIg2NbEuYBT1LswfgvSaQRN6XQJQhewnoanNc5vuGYmVl/3NoFxwi+vWkQhb1odzB342QB1T2LYnJClgdtBb5XdbWh+spn4gSh1FQMH9R7iGvr9s1bAc/lulfS6fpsm1znaMDx6dm8AudR1tvdvNSfUtf2bdiwyKjRKInIRAUvbJ/9hcau4b9Hiao3SsZ5nVGkFh3lSJt0zX/3QSFf9uMTD892cDHhvxkkUmD+3pt66MGJYwysW/Cv+KYGsMtbUJkJA7Lsy+8vCHrPJDJ9suTMdlIhCxc/MLzgyKYgWygiCe1C7t0suA6LHlYUPXdB2UcTNO1Z/JE9f9fQfm+TbYvcey6c2R8HBaQoi90gvj+/j0TYZbU3CGl/VVs/SG3VeR0mpzalszKZPfeFIprtSiJ8DiLrMMrllOgNbZlZXysBFUo7Vn3Va/kQAdKuJ49b7IlQ96WPJEUmvYp50wcYltJmzifKKsYhiGm77f+9rS5ymLY/z8eV9WtczF9nQ3mTDp0pAVctSLyJT/hWqlxlyttOHGPHJl4TyXrlR1Ol+VnjkUyGdc38UV13j8pJu0asDZXDbx5hvl28jVuTLhcpGKq7XqiyvWUvxq+1vUoZf8TcDw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(39860400002)(136003)(451199015)(46966006)(40470700004)(36840700001)(336012)(40480700001)(186003)(5660300002)(478600001)(2906002)(8936002)(426003)(47076005)(1076003)(6666004)(83380400001)(107886003)(2616005)(7696005)(82310400005)(4326008)(70586007)(82740400003)(70206006)(44832011)(316002)(6916009)(54906003)(8676002)(41300700001)(81166007)(40460700003)(36756003)(86362001)(36860700001)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 10:08:40.3412
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04129640-a6d0-4e2e-420a-08dabe4c8c22
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5334

Xen defines some global configuration macros for Arm in
config.h. We still want to use it for Armv8-R systems, but
there are some address related macros that are defined for
MMU systems. These macros will not be used by MPU systems,
Adding ifdefery with CONFIG_HAS_MPU to gate these macros
will result in a messy and hard to read/maintain code.

So we keep some common definitions still in config.h, but
move virtual address related definitions to a new file -
config_mmu.h. And use a new file config_mpu.h to store
definitions for MPU systems. To avoid spreading #ifdef
everywhere, we keep the same definition names for MPU
systems, like XEN_VIRT_START and HYPERVISOR_VIRT_START,
but the definition contents are MPU specific.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/include/asm/config.h     |  97 +--------------------
 xen/arch/arm/include/asm/config_mmu.h | 119 ++++++++++++++++++++++++++
 xen/arch/arm/include/asm/config_mpu.h |  27 ++++++
 3 files changed, 150 insertions(+), 93 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/config_mmu.h
 create mode 100644 xen/arch/arm/include/asm/config_mpu.h

diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
index 25a625ff08..189e932605 100644
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -71,99 +71,10 @@
 #include <xen/const.h>
 #include <xen/page-size.h>
 
-/*
- * Common ARM32 and ARM64 layout:
- *   0  -   2M   Unmapped
- *   2M -   4M   Xen text, data, bss
- *   4M -   6M   Fixmap: special-purpose 4K mapping slots
- *   6M -  10M   Early boot mapping of FDT
- *   10M - 12M   Livepatch vmap (if compiled in)
- *
- * ARM32 layout:
- *   0  -  12M   <COMMON>
- *
- *  32M - 128M   Frametable: 24 bytes per page for 16GB of RAM
- * 256M -   1G   VMAP: ioremap and early_ioremap use this virtual address
- *                    space
- *
- *   1G -   2G   Xenheap: always-mapped memory
- *   2G -   4G   Domheap: on-demand-mapped
- *
- * ARM64 layout:
- * 0x0000000000000000 - 0x0000007fffffffff (512GB, L0 slot [0])
- *   0  -  12M   <COMMON>
- *
- *   1G -   2G   VMAP: ioremap and early_ioremap
- *
- *  32G -  64G   Frametable: 24 bytes per page for 5.3TB of RAM
- *
- * 0x0000008000000000 - 0x00007fffffffffff (127.5TB, L0 slots [1..255])
- *  Unused
- *
- * 0x0000800000000000 - 0x000084ffffffffff (5TB, L0 slots [256..265])
- *  1:1 mapping of RAM
- *
- * 0x0000850000000000 - 0x0000ffffffffffff (123TB, L0 slots [266..511])
- *  Unused
- */
-
-#define XEN_VIRT_START         _AT(vaddr_t,0x00200000)
-#define FIXMAP_ADDR(n)        (_AT(vaddr_t,0x00400000) + (n) * PAGE_SIZE)
-
-#define BOOT_FDT_VIRT_START    _AT(vaddr_t,0x00600000)
-#define BOOT_FDT_VIRT_SIZE     _AT(vaddr_t, MB(4))
-
-#ifdef CONFIG_LIVEPATCH
-#define LIVEPATCH_VMAP_START   _AT(vaddr_t,0x00a00000)
-#define LIVEPATCH_VMAP_SIZE    _AT(vaddr_t, MB(2))
-#endif
-
-#define HYPERVISOR_VIRT_START  XEN_VIRT_START
-
-#ifdef CONFIG_ARM_32
-
-#define CONFIG_SEPARATE_XENHEAP 1
-
-#define FRAMETABLE_VIRT_START  _AT(vaddr_t,0x02000000)
-#define FRAMETABLE_SIZE        MB(128-32)
-#define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
-#define FRAMETABLE_VIRT_END    (FRAMETABLE_VIRT_START + FRAMETABLE_SIZE - 1)
-
-#define VMAP_VIRT_START        _AT(vaddr_t,0x10000000)
-#define VMAP_VIRT_SIZE         _AT(vaddr_t, GB(1) - MB(256))
-
-#define XENHEAP_VIRT_START     _AT(vaddr_t,0x40000000)
-#define XENHEAP_VIRT_SIZE      _AT(vaddr_t, GB(1))
-
-#define DOMHEAP_VIRT_START     _AT(vaddr_t,0x80000000)
-#define DOMHEAP_VIRT_SIZE      _AT(vaddr_t, GB(2))
-
-#define DOMHEAP_ENTRIES        1024  /* 1024 2MB mapping slots */
-
-/* Number of domheap pagetable pages required at the second level (2MB mappings) */
-#define DOMHEAP_SECOND_PAGES (DOMHEAP_VIRT_SIZE >> FIRST_SHIFT)
-
-#else /* ARM_64 */
-
-#define SLOT0_ENTRY_BITS  39
-#define SLOT0(slot) (_AT(vaddr_t,slot) << SLOT0_ENTRY_BITS)
-#define SLOT0_ENTRY_SIZE  SLOT0(1)
-
-#define VMAP_VIRT_START  GB(1)
-#define VMAP_VIRT_SIZE   GB(1)
-
-#define FRAMETABLE_VIRT_START  GB(32)
-#define FRAMETABLE_SIZE        GB(32)
-#define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
-
-#define DIRECTMAP_VIRT_START   SLOT0(256)
-#define DIRECTMAP_SIZE         (SLOT0_ENTRY_SIZE * (265-256))
-#define DIRECTMAP_VIRT_END     (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE - 1)
-
-#define XENHEAP_VIRT_START     directmap_virt_start
-
-#define HYPERVISOR_VIRT_END    DIRECTMAP_VIRT_END
-
+#ifdef CONFIG_HAS_MPU
+#include <asm/config_mpu.h>
+#else
+#include <asm/config_mmu.h>
 #endif
 
 #define NR_hypercalls 64
diff --git a/xen/arch/arm/include/asm/config_mmu.h b/xen/arch/arm/include/asm/config_mmu.h
new file mode 100644
index 0000000000..444223f4a1
--- /dev/null
+++ b/xen/arch/arm/include/asm/config_mmu.h
@@ -0,0 +1,119 @@
+/******************************************************************************
+ * config_mmu.h
+ *
+ * A Linux-style configuration list, only can be included by config.h
+ */
+
+#ifndef __ARM_CONFIG_MMU_H__
+#define __ARM_CONFIG_MMU_H__
+
+/*
+ * Common ARM32 and ARM64 layout:
+ *   0  -   2M   Unmapped
+ *   2M -   4M   Xen text, data, bss
+ *   4M -   6M   Fixmap: special-purpose 4K mapping slots
+ *   6M -  10M   Early boot mapping of FDT
+ *   10M - 12M   Livepatch vmap (if compiled in)
+ *
+ * ARM32 layout:
+ *   0  -  12M   <COMMON>
+ *
+ *  32M - 128M   Frametable: 24 bytes per page for 16GB of RAM
+ * 256M -   1G   VMAP: ioremap and early_ioremap use this virtual address
+ *                    space
+ *
+ *   1G -   2G   Xenheap: always-mapped memory
+ *   2G -   4G   Domheap: on-demand-mapped
+ *
+ * ARM64 layout:
+ * 0x0000000000000000 - 0x0000007fffffffff (512GB, L0 slot [0])
+ *   0  -  12M   <COMMON>
+ *
+ *   1G -   2G   VMAP: ioremap and early_ioremap
+ *
+ *  32G -  64G   Frametable: 24 bytes per page for 5.3TB of RAM
+ *
+ * 0x0000008000000000 - 0x00007fffffffffff (127.5TB, L0 slots [1..255])
+ *  Unused
+ *
+ * 0x0000800000000000 - 0x000084ffffffffff (5TB, L0 slots [256..265])
+ *  1:1 mapping of RAM
+ *
+ * 0x0000850000000000 - 0x0000ffffffffffff (123TB, L0 slots [266..511])
+ *  Unused
+ */
+
+#define XEN_VIRT_START         _AT(vaddr_t,0x00200000)
+#define FIXMAP_ADDR(n)        (_AT(vaddr_t,0x00400000) + (n) * PAGE_SIZE)
+
+#define BOOT_FDT_VIRT_START    _AT(vaddr_t,0x00600000)
+#define BOOT_FDT_VIRT_SIZE     _AT(vaddr_t, MB(4))
+
+#ifdef CONFIG_LIVEPATCH
+#define LIVEPATCH_VMAP_START   _AT(vaddr_t,0x00a00000)
+#define LIVEPATCH_VMAP_SIZE    _AT(vaddr_t, MB(2))
+#endif
+
+#define HYPERVISOR_VIRT_START  XEN_VIRT_START
+
+#ifdef CONFIG_ARM_32
+
+#define CONFIG_SEPARATE_XENHEAP 1
+
+#define FRAMETABLE_VIRT_START  _AT(vaddr_t,0x02000000)
+#define FRAMETABLE_SIZE        MB(128-32)
+#define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
+#define FRAMETABLE_VIRT_END    (FRAMETABLE_VIRT_START + FRAMETABLE_SIZE - 1)
+
+#define VMAP_VIRT_START        _AT(vaddr_t,0x10000000)
+#define VMAP_VIRT_SIZE         _AT(vaddr_t, GB(1) - MB(256))
+
+#define XENHEAP_VIRT_START     _AT(vaddr_t,0x40000000)
+#define XENHEAP_VIRT_SIZE      _AT(vaddr_t, GB(1))
+
+#define DOMHEAP_VIRT_START     _AT(vaddr_t,0x80000000)
+#define DOMHEAP_VIRT_SIZE      _AT(vaddr_t, GB(2))
+
+#define DOMHEAP_ENTRIES        1024  /* 1024 2MB mapping slots */
+
+/* Number of domheap pagetable pages required at the second level (2MB mappings) */
+#define DOMHEAP_SECOND_PAGES (DOMHEAP_VIRT_SIZE >> FIRST_SHIFT)
+
+#else /* ARM_64 */
+
+#define SLOT0_ENTRY_BITS  39
+#define SLOT0(slot) (_AT(vaddr_t,slot) << SLOT0_ENTRY_BITS)
+#define SLOT0_ENTRY_SIZE  SLOT0(1)
+
+#define VMAP_VIRT_START  GB(1)
+#define VMAP_VIRT_SIZE   GB(1)
+
+#define FRAMETABLE_VIRT_START  GB(32)
+#define FRAMETABLE_SIZE        GB(32)
+#define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
+
+#define DIRECTMAP_VIRT_START   SLOT0(256)
+#define DIRECTMAP_SIZE         (SLOT0_ENTRY_SIZE * (265-256))
+#define DIRECTMAP_VIRT_END     (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE - 1)
+
+#define XENHEAP_VIRT_START     directmap_virt_start
+
+#define HYPERVISOR_VIRT_END    DIRECTMAP_VIRT_END
+
+#endif
+
+/* Fixmap slots */
+#define FIXMAP_CONSOLE  0  /* The primary UART */
+#define FIXMAP_MISC     1  /* Ephemeral mappings of hardware */
+#define FIXMAP_ACPI_BEGIN  2  /* Start mappings of ACPI tables */
+#define FIXMAP_ACPI_END    (FIXMAP_ACPI_BEGIN + NUM_FIXMAP_ACPI_PAGES - 1)  /* End mappings of ACPI tables */
+
+#endif /* __ARM_CONFIG_MMU_H__ */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/config_mpu.h b/xen/arch/arm/include/asm/config_mpu.h
new file mode 100644
index 0000000000..530abb8302
--- /dev/null
+++ b/xen/arch/arm/include/asm/config_mpu.h
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * config_mpu.h: A Linux-style configuration list for Arm MPU systems,
+ *               only can be included by config.h
+ */
+
+#ifndef __ARM_CONFIG_MPU_H__
+#define __ARM_CONFIG_MPU_H__
+
+#ifdef CONFIG_FVP_BASER
+#include <asm/platforms/fvp_baser.h>
+#endif
+
+/*
+ * All MPU platforms need to provide a XEN_START_ADDRESS for linker. This
+ * address indicates where Xen image will be loaded and run from. This
+ * address must be aligned to a PAGE_SIZE.
+ */
+#if (XEN_START_ADDRESS % PAGE_SIZE) != 0
+#error "XEN_START_ADDRESS must be aligned to PAGE_SIZE"
+#endif
+
+#define XEN_VIRT_START         _AT(paddr_t, XEN_START_ADDRESS)
+
+#define HYPERVISOR_VIRT_START  XEN_VIRT_START
+
+#endif /* __ARM_CONFIG_MPU_H__ */
-- 
2.25.1


