Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E364227C401
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 13:11:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.34.169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNDX8-00081z-Di; Tue, 29 Sep 2020 11:10:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34.169; Tue, 29 Sep 2020 11:10:58 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNDX8-00081a-A7; Tue, 29 Sep 2020 11:10:58 +0000
Received: by outflank-mailman (input) for mailman id 34;
 Tue, 29 Sep 2020 11:10:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MQRb=DG=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kNDX6-00081G-Bi
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 11:10:56 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.81]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23801a4b-b7a9-49f8-ab5f-fc4ea02d64c3;
 Tue, 29 Sep 2020 11:10:53 +0000 (UTC)
Received: from DB8PR04CA0016.eurprd04.prod.outlook.com (2603:10a6:10:110::26)
 by VE1PR08MB5021.eurprd08.prod.outlook.com (2603:10a6:803:108::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Tue, 29 Sep
 2020 11:10:50 +0000
Received: from DB5EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::e2) by DB8PR04CA0016.outlook.office365.com
 (2603:10a6:10:110::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.24 via Frontend
 Transport; Tue, 29 Sep 2020 11:10:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT052.mail.protection.outlook.com (10.152.21.82) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.21 via Frontend Transport; Tue, 29 Sep 2020 11:10:49 +0000
Received: ("Tessian outbound a0bffebca527:v64");
 Tue, 29 Sep 2020 11:10:49 +0000
Received: from 4c72f0eee717.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 62B9A77D-3313-4CA0-A2EE-A6F36225B90E.1; 
 Tue, 29 Sep 2020 11:10:12 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4c72f0eee717.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 29 Sep 2020 11:10:12 +0000
Received: from DBAPR08MB5702.eurprd08.prod.outlook.com (2603:10a6:10:1a3::14)
 by DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Tue, 29 Sep
 2020 11:10:10 +0000
Received: from DBAPR08MB5702.eurprd08.prod.outlook.com
 ([fe80::910f:c3ac:ef51:91ac]) by DBAPR08MB5702.eurprd08.prod.outlook.com
 ([fe80::910f:c3ac:ef51:91ac%4]) with mapi id 15.20.3433.032; Tue, 29 Sep 2020
 11:10:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MQRb=DG=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kNDX6-00081G-Bi
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 11:10:56 +0000
X-Inumbo-ID: 23801a4b-b7a9-49f8-ab5f-fc4ea02d64c3
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown [40.107.15.81])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 23801a4b-b7a9-49f8-ab5f-fc4ea02d64c3;
	Tue, 29 Sep 2020 11:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hb/LMxN1oe0p93cJ8n/sEAEhpRVl9MLUwTcDytlvIlQ=;
 b=4DdX1sZS9lTyQb6/z/JuAVecOla5WepQiDANdFDRPse4l85MBuNLMq+F/i+fhDmK6guFqTpz/XP46Z752xNEhnFEjYe3/vayZmMslhQ6p3q9pLRbj8dqGMQfCt0dc3Ejm1UFYJ/mh23ypihQT3NjKy68bP9uV+PIl4CC9TprD1U=
Received: from DB8PR04CA0016.eurprd04.prod.outlook.com (2603:10a6:10:110::26)
 by VE1PR08MB5021.eurprd08.prod.outlook.com (2603:10a6:803:108::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Tue, 29 Sep
 2020 11:10:50 +0000
Received: from DB5EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::e2) by DB8PR04CA0016.outlook.office365.com
 (2603:10a6:10:110::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.24 via Frontend
 Transport; Tue, 29 Sep 2020 11:10:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT052.mail.protection.outlook.com (10.152.21.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.21 via Frontend Transport; Tue, 29 Sep 2020 11:10:49 +0000
Received: ("Tessian outbound a0bffebca527:v64"); Tue, 29 Sep 2020 11:10:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d46770dfbb4064ac
X-CR-MTA-TID: 64aa7808
Received: from 4c72f0eee717.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 62B9A77D-3313-4CA0-A2EE-A6F36225B90E.1;
	Tue, 29 Sep 2020 11:10:12 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4c72f0eee717.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 29 Sep 2020 11:10:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SHsXl2IDak1UQsxf0TeZA4XalzvgGNPxI3lWP1rznZP9LBcUJutZvlDpQXaDPh5+h+5RGsf1f0xnb2ZICWcKYa9hrX/IO+TPmSRJLKG5oP+lLzNKl0NU8EOUXdWMpBGhdgMAm9pfAV/WgcGyvfNPNsGCQdO0jZBdPXxOe0B6X/M4XtkhckwV5XpDr0Zteu0OpzaYJYg4drOcH4PC8U6R6MI+lpicCAllVorcuuK8nYHSBT5Zmrvi/wwr2SkTJ07kXl9pSqj7GmbfsVfU6KpB/5X6OiWsOnPBSzytolJROUoq3ngHQtwUi/uTJdXSSaZtbIR5McwUqOMIdFqZx/f6LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hb/LMxN1oe0p93cJ8n/sEAEhpRVl9MLUwTcDytlvIlQ=;
 b=T9fMF+ctCWM/s7uNBT86VBaFm8LB666p+YzElwtf6GNYXPPRfeMwOR7KzOrGxmiHvw1tPs4pq+zHB3TgfWy3icHs0TMg0PDY6Qbxa66UQludI4jOK1cHZS1tq3lwZjYZIr3+VUEuTSWY8u0y1XKLYXGxu3xPwgMx4T3jF/tXtLVY7Q2DTw3Hvve6zNx6/JWqWxsOpBXDs0VI0x762/RgKKigh9Gxtfg8ZRfEPyC3/4oKc+JnTQ2xoEyUFnEdxzFP16Ck2sMyfEa8yk8SKJsx0LGN8g8VsksZD5N9Bx5mgDfYgPVi+mJhYsKEPDaf1bq3zEJNc34EKY9GoZA7C0JM5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hb/LMxN1oe0p93cJ8n/sEAEhpRVl9MLUwTcDytlvIlQ=;
 b=4DdX1sZS9lTyQb6/z/JuAVecOla5WepQiDANdFDRPse4l85MBuNLMq+F/i+fhDmK6guFqTpz/XP46Z752xNEhnFEjYe3/vayZmMslhQ6p3q9pLRbj8dqGMQfCt0dc3Ejm1UFYJ/mh23ypihQT3NjKy68bP9uV+PIl4CC9TprD1U=
Received: from DBAPR08MB5702.eurprd08.prod.outlook.com (2603:10a6:10:1a3::14)
 by DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Tue, 29 Sep
 2020 11:10:10 +0000
Received: from DBAPR08MB5702.eurprd08.prod.outlook.com
 ([fe80::910f:c3ac:ef51:91ac]) by DBAPR08MB5702.eurprd08.prod.outlook.com
 ([fe80::910f:c3ac:ef51:91ac%4]) with mapi id 15.20.3433.032; Tue, 29 Sep 2020
 11:10:10 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>,
	"masami.hiramatsu@linaro.org" <masami.hiramatsu@linaro.org>,
	"ehem+xen@m5p.com" <ehem+xen@m5p.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andre Przywara <Andre.Przywara@arm.com>, Julien
 Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 0/4] xen/arm: Unbreak ACPI
Thread-Topic: [PATCH 0/4] xen/arm: Unbreak ACPI
Thread-Index: AQHWlEepyIutvb0zuEycmzpL14SOt6l/eH4A
Date: Tue, 29 Sep 2020 11:10:10 +0000
Message-ID: <E08BB025-8D3F-4D8B-BAF4-C94898DAC91F@arm.com>
References: <20200926205542.9261-1-julien@xen.org>
In-Reply-To: <20200926205542.9261-1-julien@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.38.125]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 42b9d2bb-f82b-49ed-f4dc-08d8646852a2
x-ms-traffictypediagnostic: DB7PR08MB2987:|VE1PR08MB5021:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB50213EE4A6C3705E6AAC125EFC320@VE1PR08MB5021.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 v0SLDzd0e3sepAiibiU74mS4ZFUIyxhW9hlqM6/xXHW6Hr0fDiEgZ864cFNDLDsyvx1XGMJObR/gKeoAXx5Ts1v2Qy4T6ns0Tkx85/XfrDEZ3PBoiadL80oI5oTI+f3eGrdNkoXPrtlJx2NOVP1KPqg7eUJakIEBlV2cq1FqHYBVKDw3fxMszhNCTGBeqQeFJdeEl9oxuKtSeyEgsJM1eIWwUPRCJ8XXwaDM79toZJ5ubtQQckxym63wFadpfjrNjZaeH8SWY+UBceWPzGrY4FcF/t8Z28NiuksEdrGrcIlCAfu0YmmTU8cQT6C/16b0zbBJi1IKIlxAIkAgtRzijwWPWoAZAi2O+WkOVM1t/F7GPaG4v1f0LR6qDulxGe72
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5702.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(66556008)(76116006)(6506007)(5660300002)(7416002)(54906003)(6512007)(83380400001)(71200400001)(186003)(26005)(55236004)(53546011)(91956017)(2906002)(4326008)(36756003)(86362001)(66946007)(64756008)(66476007)(66446008)(8936002)(478600001)(8676002)(33656002)(6916009)(2616005)(316002)(6486002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 uThfoQjCFPwFPVh7cDKHZm549IXLABfNiizafxuOKaF6FQ7Pbf4Vx+e9xDRivMwU2Bp7y/PB5krGDu4vsReZAvgcq+Cl98zyKlRBSnfXuBZs7+px6fTz5f1lOK1J7hW0nrn124KbFfS0+CdLtNpZc0nazne3MDVQ+kdbg4zm/Qlnq99Hpfr7fahEZygzWYbeAwM5slPdSBKkF0112jGI2dLJxt1a85b/6tZA/8WMsw2emuQr2Fu45ctg4j2sKeZ16WEmZgdz34RK8iTl5jAPXUzJRluoqD2UAL6bgvhckyD87FFJRmHh7buwBPBHbEk3XJD9ALJMrIw9y52P09yOYRkmPr+1Og7uRuTx1To8wwcdJNB8gWjjM9HW+5mP92WLRLb16An21bHwuo2UYiCfOrT36IXkmhW3AD9aDIUHDwl3gzWmDPMH0rnp2MNjvNf4odAO4KnEBvU9PYkzp0HjSSN+uB6JkDLVTHf0JnSCtUhM9oB9Cz/IoapIv1H1/GZ3lFPpsRxcKgV+64R7YPBGPobIATfQtGmCnv5Nj2/uE3vs+6UTR1RD7siMJa8IZqQajm3aol7G3li3cXGSdZ2JN7D/9LgrjyprMo4PzRR9OCy3zJ7920mUaJv23lRuwEME70O55dLgoinJMy9172dbHA==
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <3A64D061B5F558438DD3CC8E452192FC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB2987
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a70745ea-2430-499b-922b-08d864683b26
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	C3nL//Vk1CXWcVj8gBK0J8PX6kJqjMFD0aCuG2o1pOTz1fng7CWrkODsBap7ohvXHb/dRYB2oR46vY+Lcf+yrl5e5ESlYsUdaXDH5HBTOM2HsCa0cLbXLHPBzYUTGY4pGdHc0YzH1Z75MhVSAEjP+FTa/LWQEz+VYZ6snOAM/6JisK8DxuOd/gABPMMaoy3MlEW/ultVtlYXqsP7hSu4kL+AVydKD1TMnZmB3gitoPRONVyDKAwxL9L1yGremH0u2dsdaKxBLeJrwE+HWD7VJhwZqzQ9nkBIGNDx26NcwIPB5f6FZjFsbmZOWn2yPsbiMtxI+U6LFLPURVcKDhd0kEYmO5cX93OD+GLDnmpV1CBCckbCOmrkKhIsmn9rwzHZzfRFvwywLGb58fV+w1Yscg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(346002)(396003)(46966005)(36756003)(336012)(70206006)(2906002)(47076004)(70586007)(8676002)(2616005)(82740400003)(86362001)(6512007)(186003)(26005)(316002)(54906003)(6486002)(107886003)(6506007)(83380400001)(33656002)(6862004)(4326008)(8936002)(55236004)(478600001)(356005)(53546011)(81166007)(5660300002)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2020 11:10:49.8143
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42b9d2bb-f82b-49ed-f4dc-08d8646852a2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5021

Hello,

> On 26 Sep 2020, at 9:55 pm, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Hi all,
>=20
> Xen on ARM has been broken for quite a while on ACPI systems. This
> series aims to fix it.

We also observed the panic after enabling the ACPI for ARM N1SDP board earl=
ier.

(XEN) Xen call trace:
(XEN)    [<0000000000271b24>] set_fixmap+0x28/0x2c (PC)
(XEN)    [<0000000000271b18>] set_fixmap+0x1c/0x2c (LR)
(XEN)    [<0000000000267d58>] __acpi_map_table+0x38/0x94
(XEN)    [<00000000002501a4>] acpi_os_map_memory+0x18/0x64

After applying this patch series panic is fixed and XEN is able to boot wit=
h ACPI enabled.=20

>=20
> Unfortunately I don't have a system with ACPI v6.0 or later (QEMU seems
> to only support 5.1). So I did only some light testing.
>=20
> I have only build tested the x86 side so far.
>=20
> Cheers,
>=20
> *** BLURB HERE ***
>=20
> Julien Grall (4):
>  xen/acpi: Rework acpi_os_map_memory() and acpi_os_unmap_memory()
>  xen/arm: acpi: The fixmap area should always be cleared during
>    failure/unmap
>  xen/arm: Check if the platform is not using ACPI before initializing
>    Dom0less
>  xen/arm: Introduce fw_unreserved_regions() and use it
>=20
> xen/arch/arm/acpi/lib.c     | 79 ++++++++++++++++++++++++++++++-------
> xen/arch/arm/kernel.c       |  2 +-
> xen/arch/arm/setup.c        | 25 +++++++++---
> xen/arch/x86/acpi/lib.c     | 18 +++++++++
> xen/drivers/acpi/osl.c      | 34 ++++++++--------
> xen/include/asm-arm/setup.h |  2 +-
> xen/include/xen/acpi.h      |  1 +
> 7 files changed, 123 insertions(+), 38 deletions(-)
>=20
> --=20
> 2.17.1
>=20
>=20


