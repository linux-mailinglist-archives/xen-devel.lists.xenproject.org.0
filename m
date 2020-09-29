Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C9027C4DE
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 13:18:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.70.205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNDdx-0000BO-5z; Tue, 29 Sep 2020 11:18:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70.205; Tue, 29 Sep 2020 11:18:01 +0000
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
	id 1kNDdx-0000Ax-2T; Tue, 29 Sep 2020 11:18:01 +0000
Received: by outflank-mailman (input) for mailman id 70;
 Tue, 29 Sep 2020 11:17:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MQRb=DG=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kNDdv-0000Al-Mz
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 11:17:59 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe07::602])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 60178be7-c51e-48d7-81f8-5243b00911ae;
 Tue, 29 Sep 2020 11:17:57 +0000 (UTC)
Received: from DB7PR03CA0096.eurprd03.prod.outlook.com (2603:10a6:10:72::37)
 by HE1PR0802MB2457.eurprd08.prod.outlook.com (2603:10a6:3:df::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.24; Tue, 29 Sep
 2020 11:17:55 +0000
Received: from DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::a8) by DB7PR03CA0096.outlook.office365.com
 (2603:10a6:10:72::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend
 Transport; Tue, 29 Sep 2020 11:17:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT025.mail.protection.outlook.com (10.152.20.104) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.21 via Frontend Transport; Tue, 29 Sep 2020 11:17:55 +0000
Received: ("Tessian outbound bac899b43a54:v64");
 Tue, 29 Sep 2020 11:17:55 +0000
Received: from 98f374e03e86.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FA1F7A04-4134-4D47-8259-23506E240D96.1; 
 Tue, 29 Sep 2020 11:17:17 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 98f374e03e86.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 29 Sep 2020 11:17:17 +0000
Received: from DBAPR08MB5702.eurprd08.prod.outlook.com (2603:10a6:10:1a3::14)
 by DBBPR08MB5548.eurprd08.prod.outlook.com (2603:10a6:10:c1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22; Tue, 29 Sep
 2020 11:17:15 +0000
Received: from DBAPR08MB5702.eurprd08.prod.outlook.com
 ([fe80::910f:c3ac:ef51:91ac]) by DBAPR08MB5702.eurprd08.prod.outlook.com
 ([fe80::910f:c3ac:ef51:91ac%4]) with mapi id 15.20.3433.032; Tue, 29 Sep 2020
 11:17:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MQRb=DG=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kNDdv-0000Al-Mz
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 11:17:59 +0000
X-Inumbo-ID: 60178be7-c51e-48d7-81f8-5243b00911ae
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown [2a01:111:f400:fe07::602])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 60178be7-c51e-48d7-81f8-5243b00911ae;
	Tue, 29 Sep 2020 11:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gLt3vkj86JLmXzJIEcEx/M/UEnaL/3OUIRG+nGV7ckY=;
 b=hxIi5SF073Yv5EHM5ameMQgQoAW6fh3vpNUbAxd5/QZms+ernSkyqhFYo5Cp6OM4fukI9Z9izP0z2T9mrxq4+X3yHsFtq/7uyKdFNGldmItHpf6yy2lKntFdNgt+tjgwPe9XoWxZczeawvZP8EiolewWhK+J0l3vTQ9a6WTuKEc=
Received: from DB7PR03CA0096.eurprd03.prod.outlook.com (2603:10a6:10:72::37)
 by HE1PR0802MB2457.eurprd08.prod.outlook.com (2603:10a6:3:df::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.24; Tue, 29 Sep
 2020 11:17:55 +0000
Received: from DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::a8) by DB7PR03CA0096.outlook.office365.com
 (2603:10a6:10:72::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend
 Transport; Tue, 29 Sep 2020 11:17:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT025.mail.protection.outlook.com (10.152.20.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.21 via Frontend Transport; Tue, 29 Sep 2020 11:17:55 +0000
Received: ("Tessian outbound bac899b43a54:v64"); Tue, 29 Sep 2020 11:17:55 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f1ca619b140a3794
X-CR-MTA-TID: 64aa7808
Received: from 98f374e03e86.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FA1F7A04-4134-4D47-8259-23506E240D96.1;
	Tue, 29 Sep 2020 11:17:17 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 98f374e03e86.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 29 Sep 2020 11:17:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GL1tvGQ1MinQCD+yIiopyO0V/vPvTUu2HDD4iuKsgMuYNWApHanjnxE/v6XGljFXbxSHR1uGx31eWzWkuvZ6IQzUqMuxDv6gHPi2Oe3W1tECkioTjo9vTz4SfqrUaaPvWd4Ce74KHRB5kRmeGgg4Al3IjLW2UCFOJXsaPnd4w/vtPhPCgTzNDqvB63G/4BJspuacZFRf2BSmMJ9m4SluTl2DKTz0sv+8OwgmlNpS3DDxPlhyAs1mrvpW9rGPIQw59xu4yhCYpiYf0sUklAEJ7t8YiBCqmWHAXxVjPznU3cgKEYduW8qf/QIdB+W5efd+cKeijfB3z45FEiWAtvkLbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gLt3vkj86JLmXzJIEcEx/M/UEnaL/3OUIRG+nGV7ckY=;
 b=L+H48jsdC5SJM4/Z9YColwZTG29pps3Yw/TNWBCeJIwcCdiKnLjd94gkAnNzL3IMU0J9bV7ci/R3sJxfndGcAC9g83Sw28KXQWTjkTPHa5mM4awq4B7q5hcVMoBuyj7XLe0ONNRI+eQe0HZbBQIYrsJK4t9GzEZJVnQJUiifIqrASvn76yniXbjV39t72iShRvgWto3QkL2cAyfeRNDrWULZ/4J44owVA0zKNdRODG/HOWuY9QUwqcmcYa/Pnu1JdHy3Y7lOdoBdf6FTjnt7hkZq3T6jCenHk1SZUM31LE4eu/epgiuxEKNEhtNBI+KjhKDEgF1AsL7eJdwFWXHnrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gLt3vkj86JLmXzJIEcEx/M/UEnaL/3OUIRG+nGV7ckY=;
 b=hxIi5SF073Yv5EHM5ameMQgQoAW6fh3vpNUbAxd5/QZms+ernSkyqhFYo5Cp6OM4fukI9Z9izP0z2T9mrxq4+X3yHsFtq/7uyKdFNGldmItHpf6yy2lKntFdNgt+tjgwPe9XoWxZczeawvZP8EiolewWhK+J0l3vTQ9a6WTuKEc=
Received: from DBAPR08MB5702.eurprd08.prod.outlook.com (2603:10a6:10:1a3::14)
 by DBBPR08MB5548.eurprd08.prod.outlook.com (2603:10a6:10:c1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22; Tue, 29 Sep
 2020 11:17:15 +0000
Received: from DBAPR08MB5702.eurprd08.prod.outlook.com
 ([fe80::910f:c3ac:ef51:91ac]) by DBAPR08MB5702.eurprd08.prod.outlook.com
 ([fe80::910f:c3ac:ef51:91ac%4]) with mapi id 15.20.3433.032; Tue, 29 Sep 2020
 11:17:15 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>,
	"masami.hiramatsu@linaro.org" <masami.hiramatsu@linaro.org>,
	"ehem+xen@m5p.com" <ehem+xen@m5p.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andre Przywara <Andre.Przywara@arm.com>, Julien
 Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 3/4] xen/arm: Check if the platform is not using ACPI
 before initializing Dom0less
Thread-Topic: [PATCH 3/4] xen/arm: Check if the platform is not using ACPI
 before initializing Dom0less
Thread-Index: AQHWlEesX+v/cDvKNkKA7E4bt1Fvbal/e5oA
Date: Tue, 29 Sep 2020 11:17:15 +0000
Message-ID: <0CE8D339-9C76-42C9-A72A-0EA96FED24B1@arm.com>
References: <20200926205542.9261-1-julien@xen.org>
 <20200926205542.9261-4-julien@xen.org>
In-Reply-To: <20200926205542.9261-4-julien@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.38.125]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c83ec35a-be4d-4fd0-478d-08d864695035
x-ms-traffictypediagnostic: DBBPR08MB5548:|HE1PR0802MB2457:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<HE1PR0802MB24575401AEAF8B57E21CDE8AFC320@HE1PR0802MB2457.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:1751;OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 P08geFoJ+1poqbqpTJInePe+ue/lTj3nDrubqwjbyFt1qDvQMn7Hw4c01nJGYLDurhXmMdbh1gUb9aiuruKi4Nb2VFrH+xg/yeg9+1QGMk3uxb3ddfF+HY8c50rrny5RuIKYBTIfadVEl2OPl8hJJFFpI7y6F57U3MpVA8j9y5W36O3C8ZUB5WZjcp4whnexqHaH7nS6MOLIGfA8cDu7OUigGGCfBFK38TFRQ4jY5u2wCoGSywUm8cZuUMqYwZFst1qhgrX3RH/TIxMAUqfhW0QGtKdFGK+xfqHTbOFessKTBOf0O4ZRdtY/d0UZJcZTrD2499pWQ0Xs1Ja2YtziuqKuj8XnQp+lHupMldHsA5E23PEtOE2FpcM8LfIBLESlNrBu2ErVrGlWNHG8889M3H+aYTvvy5ZXRRrojsTq0A0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5702.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(54906003)(83380400001)(4326008)(66946007)(71200400001)(86362001)(8936002)(36756003)(33656002)(5660300002)(316002)(91956017)(76116006)(66556008)(66446008)(2616005)(8676002)(6486002)(66476007)(64756008)(6506007)(478600001)(6916009)(186003)(53546011)(26005)(6512007)(55236004)(2906002)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 hxiNQQXQqDjBaAj8WokgJ3htkFuAxv3bEDBUvUYAHpep9AKwG++pqoUYJ2wrsYlOt4Yf0F2MV1pRxIFRfzDwC1vsN58Th+9fooqUcsg5N+Fd7D6KqR8h+c1YAgVqU+H/Xqccg4g0RiKrnLUoZ0OczCJRJ2LLYCstD89fOvJexVgaW98Uyc6awpqsxzdl4TgYLQUFtAI7eXBG3dWchsDSRBViJAuBldUNtMoEikGFbIIRz9DSNFaJmCsFbGFII+BVI3yNWI7qyTgKlWpCdzf/nnmrh3WVz5Ws1RFvSXE4d7oeUJE9OxiUXLRkbgyQ+pWqFaq4wNW4x2SjPei1Q5EV1EDbcFZuKpUViJ+yI0witfCx3GR9K4AEUm2RGgGz8Jp/ftxJRifz4le8FxGoyTsgADky8Og5QeYhKegSq2rozewN5t5mU6Z79+rlda8u3gBdqwB8LvLVHqEsBMmfr6sBd7BwAm9/hDbOQCfS1mIo+LEOe4ZaNLPKfVeRRk0YItRTX1CyJOH9bQ7hDuLDDhomean4XiUV+NdpftVRuoFWnbGfkKBT/lndqs0C77yCo6UopZvJ5FUzqKIb5BzuKFQLApORL7fj052xH4+JN2QISEmsnvJisTXI42MSQ9AE2bFORTIIJNGG1cZiiiZj1RRgpg==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B296CCD1D1936F408F77044DED2EC1F1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5548
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	95c885b2-3b36-4f14-e030-08d864693894
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rp5Ike2ywoXNN1aWx75+YB8wCy1k4X6Sz5cmispwCaJNoUn1t9TFQqnHvdpmC9iRTcsq5bt/76kj6DITBsObNaSrIfn19FrhTKXlP8GFnBdCwAFrkq/VvmfUi64Q85mVd7gcsV8MV+VmtrPQDFpURW+EVKtZPpa7t4BTJCqxV49Volyf+fR6ZnTEGuvB6RhjeuZnwfkJ8CH0uKOAga9yBDbLNcwhXOIl3t4xpEfcCHK5Wk0Fc3QNBFe0YojrIMAtsctjNBIW84elQl/iNZOLntHvtdJnLfDc3wvJi+7Ecy1MIokbaqUBAlmja1cuMBg0VQbBTBXjGNzByJTVMatUXa4Xbr6Wu1m8ODMAa3jpApyTLV8JNOvPjMetMvwSRLqTOpeIfh0obYyL8C6oLcUX+ZrNDpPRIZtOyaSmvOGRhS36KE0cEDROOSK54ElMDa9E6XjCdbf1sL6QbwedcC2FsA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(46966005)(107886003)(2616005)(478600001)(4326008)(33656002)(8676002)(36756003)(2906002)(54906003)(26005)(316002)(186003)(6506007)(53546011)(55236004)(6862004)(8936002)(82310400003)(81166007)(83380400001)(336012)(356005)(82740400003)(70586007)(47076004)(5660300002)(6512007)(70206006)(6486002)(86362001)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2020 11:17:55.2877
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c83ec35a-be4d-4fd0-478d-08d864695035
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2457

Hello=09

> On 26 Sep 2020, at 9:55 pm, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Dom0less requires a device-tree. However, since commit 6e3e77120378
> "xen/arm: setup: Relocate the Device-Tree later on in the boot", the
> device-tree will not get unflatten when using ACPI.
>=20
> This will lead to a crash during boot.
>=20
> Given the complexity to setup dom0less with ACPI (for instance how to
> assign device?), we should skip any code related to Dom0less when using
> ACPI.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Tested-by: Rahul Singh <rahul.singh@arm.com>
> ---
> xen/arch/arm/setup.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index f16b33fa87a2..35e5bee04efa 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -987,7 +987,8 @@ void __init start_xen(unsigned long boot_phys_offset,
>=20
>     system_state =3D SYS_STATE_active;
>=20
> -    create_domUs();
> +    if ( acpi_disabled )
> +        create_domUs();
>=20
>     domain_unpause_by_systemcontroller(dom0);
>=20
> --=20
> 2.17.1
>=20
>=20

Regards,
Rahul


