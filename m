Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F5E28143C
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 15:40:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2124.6330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOLHm-0001uY-Qt; Fri, 02 Oct 2020 13:39:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2124.6330; Fri, 02 Oct 2020 13:39:46 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOLHm-0001u5-MO; Fri, 02 Oct 2020 13:39:46 +0000
Received: by outflank-mailman (input) for mailman id 2124;
 Fri, 02 Oct 2020 13:39:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3+am=DJ=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kOLHk-0001sI-OP
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 13:39:44 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.87]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b6f9c6a3-d29e-49cb-b837-85fddd82ccf8;
 Fri, 02 Oct 2020 13:39:43 +0000 (UTC)
Received: from AM0PR10CA0076.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::29)
 by VI1PR08MB2672.eurprd08.prod.outlook.com (2603:10a6:802:1c::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.36; Fri, 2 Oct
 2020 13:39:41 +0000
Received: from AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:15:cafe::bd) by AM0PR10CA0076.outlook.office365.com
 (2603:10a6:208:15::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35 via Frontend
 Transport; Fri, 2 Oct 2020 13:39:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT064.mail.protection.outlook.com (10.152.17.53) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Fri, 2 Oct 2020 13:39:41 +0000
Received: ("Tessian outbound 7fc8f57bdedc:v64");
 Fri, 02 Oct 2020 13:39:40 +0000
Received: from a6a43c6ac990.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9B899E1B-AFA1-4D63-9ACE-D52B78EF4AA9.1; 
 Fri, 02 Oct 2020 13:39:33 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a6a43c6ac990.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 02 Oct 2020 13:39:33 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0801MB1799.eurprd08.prod.outlook.com (2603:10a6:4:3a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38; Fri, 2 Oct
 2020 13:39:32 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e%6]) with mapi id 15.20.3412.029; Fri, 2 Oct 2020
 13:39:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3+am=DJ=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kOLHk-0001sI-OP
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 13:39:44 +0000
X-Inumbo-ID: b6f9c6a3-d29e-49cb-b837-85fddd82ccf8
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown [40.107.8.87])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b6f9c6a3-d29e-49cb-b837-85fddd82ccf8;
	Fri, 02 Oct 2020 13:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+S3Vu23I+R+RrBoxjqBi0zqDdivtx/4Um+qF6Mi2hE=;
 b=R0B8H9IKCyVh/ZhRQZlAMgsDmKOMXzfIsI+v6U7PufjUCYRb0tADfVRj4VDPxabLwB9607R7ESzo2bI4mhGOsADQyiGojjwgD+FBs3S7/hTw6HfeePN1oEqcO6hBx6rb5Y/J7Do8t1sw/lRFKDfoDguEtfkCpBVVXAZ1JvcwoKo=
Received: from AM0PR10CA0076.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::29)
 by VI1PR08MB2672.eurprd08.prod.outlook.com (2603:10a6:802:1c::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.36; Fri, 2 Oct
 2020 13:39:41 +0000
Received: from AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:15:cafe::bd) by AM0PR10CA0076.outlook.office365.com
 (2603:10a6:208:15::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35 via Frontend
 Transport; Fri, 2 Oct 2020 13:39:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT064.mail.protection.outlook.com (10.152.17.53) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Fri, 2 Oct 2020 13:39:41 +0000
Received: ("Tessian outbound 7fc8f57bdedc:v64"); Fri, 02 Oct 2020 13:39:40 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 76510ece6912c68e
X-CR-MTA-TID: 64aa7808
Received: from a6a43c6ac990.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9B899E1B-AFA1-4D63-9ACE-D52B78EF4AA9.1;
	Fri, 02 Oct 2020 13:39:33 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a6a43c6ac990.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 02 Oct 2020 13:39:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gh/zgC4Wry1lNzN+PDBdeOA5pMOHIxZBBmXxUb+aE14zop5GiRzUFDMrAz0UclhZ2qhdie4a/BqLwn2M9rxLrUTRYD4FWDC+J5agCX+RLgMKI6T0X9g/EfBXuh8nDXF7MiDVrPXjoE9pL8k2KCcwc5/3OaapOCMHBdKFB1EPxQ1ygn/vvh/qEK1uq6oabypfZoPF/nPO6SR2MWt4ce+noC+uQEy1luzWDi0UVXF8RmvHfot2EfnE9YVEFMXHlMR4/mdiPU7rUGyNNtbqs7cago4xVQTsVwsN3APLLvEdOA3ge79A0rB/wdf2jbV0WA5wbck/ldaFzYs/gz8JApFL4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+S3Vu23I+R+RrBoxjqBi0zqDdivtx/4Um+qF6Mi2hE=;
 b=FxqK3ilEBAtrQfTWkEXuuLPobZ+RdltHcBnPAe4LE5KXv10h7kQIKmedk+WSBT6ldpuhIVjpI9ZHisIgB/wGgQRY0e7zpFxnJEJEfGWwpuwb0gktq4K04UY65sR+BTSM2newVbNK09RLifYgcUnKrJol3+R/kKZtFLXvdA/UMlXc7vTBpm7nFujuP9AMxFljIeuHYhajvxOzViEu9L8fjslHi7R2Ux84w5JMFDKTwAT2DRg8RUkISZrU6iYrB+nQRcjKghZGgcIaw08GsLv2IOtenb8Q2pg/i5dxjXb1T/m3KI6yHOgkXdO4cBD7qadcK4WKHaondBhTiFzEv9kmOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+S3Vu23I+R+RrBoxjqBi0zqDdivtx/4Um+qF6Mi2hE=;
 b=R0B8H9IKCyVh/ZhRQZlAMgsDmKOMXzfIsI+v6U7PufjUCYRb0tADfVRj4VDPxabLwB9607R7ESzo2bI4mhGOsADQyiGojjwgD+FBs3S7/hTw6HfeePN1oEqcO6hBx6rb5Y/J7Do8t1sw/lRFKDfoDguEtfkCpBVVXAZ1JvcwoKo=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0801MB1799.eurprd08.prod.outlook.com (2603:10a6:4:3a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38; Fri, 2 Oct
 2020 13:39:32 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e%6]) with mapi id 15.20.3412.029; Fri, 2 Oct 2020
 13:39:32 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "open list:X86" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] build: always use BASEDIR for xen sub-directory
Thread-Topic: [PATCH] build: always use BASEDIR for xen sub-directory
Thread-Index:
 AQHWmKjTj7VmlPYcLkSjqrrhNFG5S6mEOTwAgAAGTYCAAAEPgIAAAYQAgAAJbQCAAAYOgA==
Date: Fri, 2 Oct 2020 13:39:32 +0000
Message-ID: <9EE4FA49-D4A1-47A7-A6F7-F60F1BE97DCD@arm.com>
References:
 <556f6327acea2d0343c93da28f1fc17591afd402.1601564274.git.bertrand.marquis@arm.com>
 <706afc44-a414-33ff-da94-b92f7a96f1fc@suse.com>
 <31FC9BB1-F4C4-4203-94C1-1134607E49C2@arm.com>
 <e5da46d7-07ee-84b8-fbd8-e2c246c014de@suse.com>
 <547D8B47-C521-4F43-976F-D1723470AD3C@arm.com>
 <c09ae112-a94a-7b3c-f31a-46acc5098d5c@suse.com>
In-Reply-To: <c09ae112-a94a-7b3c-f31a-46acc5098d5c@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 25d2b61e-2062-4bed-8c40-08d866d89d46
x-ms-traffictypediagnostic: DB6PR0801MB1799:|VI1PR08MB2672:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB267202E3906637C783427CDC9D310@VI1PR08MB2672.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3631;OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2SnLZ0YkAxlgnrGoJ+KOojskR80kfbzFHJkIRxTIJTRU9PoOF7AGCKu6DBPwv7oUCOaorIWjyp05Vt1OiJ3rWs+CZ83npH76vRIl4YMtXF5EKvqVf14F1GQew4LzLJ2D5ubLM04QemSpsl8M5RC5ft52Ecn4IwIltq7bxzn8qCBA5nFg6KVY2/hyA1ZYzLp6VsbLGLz+98x1lCMSMGYilHXkBh/595M8mzt4XXBMebY9m3xqr6MEQYslCeEVZdTgd2O7ZwnAqm6whf6vmJ4yL0Gi3EYZuCDiEBtrpe6a4bLCGH0SLu3SOmz+HFx9H8mIgAnxewFXIP7komkBZKRqIg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(186003)(2906002)(6506007)(53546011)(83380400001)(91956017)(33656002)(71200400001)(4326008)(26005)(8676002)(6486002)(66446008)(66556008)(8936002)(66476007)(86362001)(64756008)(66946007)(478600001)(6512007)(316002)(6916009)(36756003)(76116006)(5660300002)(2616005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 qZu4mfd9ixicFX7AChSvxbBOg1hWRO86hwuHJVRl3onAm1DAqHQtx8Lhj9ue0i5xHpaOmm1vDnHH3xorVgpIS4fZyZ2nmUV52EhTg1dAPFE6HgSOk+BMypwi2Ay0Acps/g+Rz3TyBWTiP+LqIaLCKbs8Rb0xjgtEIUZ4rnrjJ9vYfvvpCKP1YlNl3GK+qmHECf4RhlgfPaM1AQwtleqZfWSKB8wqjs4+9N8K1KXcSqgErSEveycFO9JvqXwfhyAdMgUsDEJHlINlaFtkPVutjSys0AkQjH8VYLM/a9sblEnzwhhaOZB53bwCJurhDTUfA4YJ2j0oc9HnBwJfKkOSdD6vKjvAeafYd471X9OXmdfeZsQuwN/aopH+5CwUOH50o04MZiVFH0F/y2KezKwYnyzkylaftAtUSQRhBYT5xZGVaCHTuWvRxox4BOR6ykzMosCEnLZW2742Hg0RAiH35Z5/gP3PLSw93KsjW/iU0yYdJU/bqLfCy+EB2UDjX1mRSKtYmqark3uJbdC7Ex9Bt+6ufXi2QRea5p1/YLUWYJ9fSy/M1LZ9krBgEWooYsL5shyTWI2B/zrrU4NbNPgyrkhZoY34weayu+ZIeCq4VMC+4ntrFi6L/0fwyv5VpsoJ5edtsHDYlWyoOVcdk7WTPQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <1133418347CE694FAF9D2B20F2577599@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1799
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	11cddfa8-5c61-4825-efef-08d866d89853
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	20Mx3A2MKfI4Z6bQOB8sEMwlB7zC1i6qdRaE2wth0zJmknxN4uk8UgR1p9r6WgK6TfdHTLeFTxY4W2iz0H1gcScJ45+eoRDGjX9anDpXhov5y20VnqLBWHmQkyONE0AZdkQaIMHA91OAp2RaegrLPgnWAoGYip3dJUk/J5Qdzxlb3NMXoyAkwIsv9B6HUs1SEGqBjPE3b8zmMFF59TYsw7xn+lYQ4zmkQVzyFS0+P+D63CJgXGo9yeKWWkXxnb0ZjI9XwMQzsoIlw884/x+ZGkbo0/KbWciiSf03Xn7KipM3du3wYuJENg6hXLDcfBuARkT15Dklyb2yJD9j0Ftq3oybS60SbcpQbuYTfNx45KbIbHdE4arAq2i2yCnnMO7BXDlOLM+t9nH+5PgQR6yhog==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(46966005)(2906002)(81166007)(8936002)(70206006)(70586007)(82310400003)(6506007)(478600001)(8676002)(356005)(83380400001)(6486002)(6512007)(5660300002)(336012)(33656002)(53546011)(186003)(316002)(26005)(36756003)(86362001)(6862004)(82740400003)(47076004)(36906005)(2616005)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2020 13:39:41.0000
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25d2b61e-2062-4bed-8c40-08d866d89d46
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2672

DQoNCj4gT24gMiBPY3QgMjAyMCwgYXQgMTQ6MTcsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwMi4xMC4yMDIwIDE0OjQ0LCBCZXJ0cmFuZCBNYXJxdWlz
IHdyb3RlOg0KPj4gDQo+PiANCj4+PiBPbiAyIE9jdCAyMDIwLCBhdCAxMzozOCwgSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+PiANCj4+PiBPbiAwMi4xMC4yMDIwIDE0
OjM0LCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4+Pj4gT24gMiBPY3QgMjAyMCwgYXQgMTM6
MTIsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4+PiANCj4+Pj4+
IE9uIDAyLjEwLjIwMjAgMTI6NDIsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+Pj4+Pj4gTW9k
aWZ5IE1ha2VmaWxlcyB1c2luZyAkKFhFTl9ST09UKS94ZW4gdG8gdXNlICQoQkFTRURJUikgaW5z
dGVhZC4NCj4+Pj4+PiANCj4+Pj4+PiBUaGlzIGlzIHJlbW92aW5nIHRoZSBkZXBlbmRlbmN5IHRv
IHhlbiBzdWJkaXJlY3RvcnkgcHJldmVudGluZyB1c2luZyBhDQo+Pj4+Pj4gd3JvbmcgY29uZmln
dXJhdGlvbiBmaWxlIHdoZW4geGVuIHN1YmRpcmVjdG9yeSBpcyBkdXBsaWNhdGVkIGZvcg0KPj4+
Pj4+IGNvbXBpbGF0aW9uIHRlc3RzLg0KPj4+Pj4+IA0KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEJl
cnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4NCj4+Pj4+IA0KPj4+Pj4g
QWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4+Pj4gDQo+Pj4+IFRo
YW5rcyA6LSkNCj4+Pj4gDQo+Pj4+PiANCj4+Pj4+IChidXQgbW9yZSBmb3IgdGhlIHNsaWdodCB0
aWR5aW5nIHRoYW4gdGhlIHB1cnBvc2UgeW91IG5hbWUpDQo+Pj4+IA0KPj4+PiBGZWVsIGZyZWUg
dG8gcmVtb3ZlIHRoZSBqdXN0aWZpY2F0aW9uIGZyb20gdGhlIGNvbW1pdCBtZXNzYWdlIGlmDQo+
Pj4+IHlvdSB0aGluayBpdCBpcyBub3QgdXNlZnVsbC4NCj4+PiANCj4+PiBPaCwgbm8sIGl0J3Mg
bm90IGxpa2UgSSBjb25zaWRlciBpdCBub3QgdXNlZnVsLiBJdCBzaG93cyBob3cgeW91DQo+Pj4g
YXJyaXZlZCBhdCBtYWtpbmcgdGhlIGNoYW5nZS4gSXQncyBqdXN0IHRoYXQgSSBkaWRuJ3QgY29u
c2lkZXINCj4+PiBtYWtpbmcgY29waWVzIG9mIHhlbi8gc29tZXRoaW5nIHdlIG1lYW4gdG8gYmUg
c3VwcG9ydGVkLiBJIHdvdWxkbid0DQo+Pj4gYmUgc3VycHJpc2VkIGlmIGl0IGdvdCBicm9rZW4g
YWdhaW4gLi4uDQo+PiANCj4+IGJhc2ljYWxseSBpIGRvIHRoaXMgYSDigJxjcCAtcnPigJ0gb2Yg
eGVuIHN1YmRpcmVjdG9yeSBzbyB0aGF0IGkgY2FuIGhhdmUgZGlyZWN0b3JpZXMNCj4+IGluIHdo
aWNoIHhlbiBpcyBjb21waWxlZCBmb3IgeDg2LCBhcm0zMiBhbmQgYXJtNjQgYW5kIHJlY29tcGls
ZSBhbGwgb2YgdGhlbQ0KPj4gcXVpY2tseSB3aXRob3V0IGhhdmluZyB0byBnbyB0aHJvdWdoIGRp
c3RjbGVhbiwgY29uZmlnLCBtYWtlIGVhY2ggdGltZSBvciBtb2RpZnkNCj4+IHRoZSBvcmlnaW5h
bCB0cmVlLg0KPiANCj4gQnV0IHRoZW4geW91IG11c3QgaGF2ZSBhZGp1c3RtZW50cyBhbHNvIGlu
IHRoZSB0b3AgbGV2ZWwgbWFrZWZpbGUsDQo+IHN1Y2ggdGhhdCBiZXNpZGVzICJtYWtlIHhlbiIs
ICJtYWtlIHhlbi14eXoiIGFsc28gd29ya3MuDQoNCk5vIHRoZXJlIGkgYW0gb25seSBjb21waWxp
bmcgdGhlIGh5cGVydmlzb3IsIG5vdCB0aGUgdG9vbHMsIHNvIG9ubHkgeGVuIHN1YmRpci4NCg0K
QmVydHJhbmQNCg0K

