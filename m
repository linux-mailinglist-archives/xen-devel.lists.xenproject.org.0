Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEE52A97CE
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 15:41:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20867.46915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kb2vu-0005o3-VN; Fri, 06 Nov 2020 14:41:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20867.46915; Fri, 06 Nov 2020 14:41:42 +0000
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
	id 1kb2vu-0005ne-SE; Fri, 06 Nov 2020 14:41:42 +0000
Received: by outflank-mailman (input) for mailman id 20867;
 Fri, 06 Nov 2020 14:41:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a9Kh=EM=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kb2vs-0005nZ-NL
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 14:41:40 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.75]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7242ae8e-4d87-41ed-bef2-18bf3d703af1;
 Fri, 06 Nov 2020 14:41:37 +0000 (UTC)
Received: from AM6P195CA0073.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::14)
 by DB8PR08MB4106.eurprd08.prod.outlook.com (2603:10a6:10:b2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 6 Nov
 2020 14:41:34 +0000
Received: from AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:86:cafe::fb) by AM6P195CA0073.outlook.office365.com
 (2603:10a6:209:86::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Fri, 6 Nov 2020 14:41:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT044.mail.protection.outlook.com (10.152.17.56) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.17 via Frontend Transport; Fri, 6 Nov 2020 14:41:34 +0000
Received: ("Tessian outbound 814be617737e:v71");
 Fri, 06 Nov 2020 14:41:34 +0000
Received: from 4097bcb96e3b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9976F4D8-8078-425A-A73E-62C4176E9236.1; 
 Fri, 06 Nov 2020 14:41:10 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4097bcb96e3b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 06 Nov 2020 14:41:10 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB8PR08MB5097.eurprd08.prod.outlook.com (2603:10a6:10:38::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 6 Nov
 2020 14:41:08 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28%6]) with mapi id 15.20.3499.032; Fri, 6 Nov 2020
 14:41:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=a9Kh=EM=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kb2vs-0005nZ-NL
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 14:41:40 +0000
X-Inumbo-ID: 7242ae8e-4d87-41ed-bef2-18bf3d703af1
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown [40.107.8.75])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 7242ae8e-4d87-41ed-bef2-18bf3d703af1;
	Fri, 06 Nov 2020 14:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YfMjNf8TOo4lcQe5ri3R1rXhXlGGZDfS96Gxnu42Xwo=;
 b=ogGcJ0Zl+KkjN4QWPYNHm2bYGcMCF3Ig3mfM87XY5TaUlY52nPp5D1pfXGoU7Syrb+2265VdRxbXp2Kg7DEA2Qx8my+21hUpZnynxjPLrI1O7os2E8mPtFY9hnM9pfCIe2v5GQSX31UICJy4Lrkb3i5DbttINRa3gnI9cEQM0oU=
Received: from AM6P195CA0073.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::14)
 by DB8PR08MB4106.eurprd08.prod.outlook.com (2603:10a6:10:b2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 6 Nov
 2020 14:41:34 +0000
Received: from AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:86:cafe::fb) by AM6P195CA0073.outlook.office365.com
 (2603:10a6:209:86::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Fri, 6 Nov 2020 14:41:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT044.mail.protection.outlook.com (10.152.17.56) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.17 via Frontend Transport; Fri, 6 Nov 2020 14:41:34 +0000
Received: ("Tessian outbound 814be617737e:v71"); Fri, 06 Nov 2020 14:41:34 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e70a9345d59a9acd
X-CR-MTA-TID: 64aa7808
Received: from 4097bcb96e3b.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9976F4D8-8078-425A-A73E-62C4176E9236.1;
	Fri, 06 Nov 2020 14:41:10 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4097bcb96e3b.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 06 Nov 2020 14:41:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NMbIbbLInBmB0kNcHF9dHrwZAhHv0QkKt064OnsWjJrj9MfmugumNzcQgF0zAV3Ze0FMIcq9TxX/omwbrpF2g1yXyCDSMQnVT3b9F95M+K7BrXJfB9NFNAsrzPpp8MPFO3weP5HbxZ5ZB0ZaQEk2Y8ZUuw0lE/FMIUmHG8fCRT5aQ+2SsgCf08JNGNInoQHMYfe9+ey9xTi+L1mY4plzxJy6bHelkAPKM4XS8LVqub9SVuW18mK9yNWKQc7ygBmkgkBB3pyQDMbA5BrL1+VHOq2PWVsEEffFh3Vz8qNHwDeQh0nW1a69J64S+yzlLTgBxaZ8VTKmfF/OBfshH9otCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YfMjNf8TOo4lcQe5ri3R1rXhXlGGZDfS96Gxnu42Xwo=;
 b=iXT2AX8ugQzUAH0bSvGEexb6SNl8uvjTBYLuBL+mopgz/0NeT6xYBVCAW8R2+/LRKV8SvVli2pIkD2qyJqLGzsLVO6Mpxw926HGNADrZmyi0iscV4thC8juMYWh3cY/ftSsK/sDVaJvkN/RwV/CTQBgd1+0sBF8x7YAQfBzCGH+CvNDlNw6gttLRUX1ePH6x6RKXuAxK+WLajSrEQ7C3LEqDg8ipv9NKTxBUelu9YPf3dFRf/3eWy4q2ZNVN7LbZ2pEpr1W3FBlkudDMa/vVKgILo2elbpTEoxsT+5eElShEVRxRVNywuCSdNypWazZ/123afehHAD6h8bPX7TcZtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YfMjNf8TOo4lcQe5ri3R1rXhXlGGZDfS96Gxnu42Xwo=;
 b=ogGcJ0Zl+KkjN4QWPYNHm2bYGcMCF3Ig3mfM87XY5TaUlY52nPp5D1pfXGoU7Syrb+2265VdRxbXp2Kg7DEA2Qx8my+21hUpZnynxjPLrI1O7os2E8mPtFY9hnM9pfCIe2v5GQSX31UICJy4Lrkb3i5DbttINRa3gnI9cEQM0oU=
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB8PR08MB5097.eurprd08.prod.outlook.com (2603:10a6:10:38::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 6 Nov
 2020 14:41:08 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28%6]) with mapi id 15.20.3499.032; Fri, 6 Nov 2020
 14:41:08 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Oleksandr Andrushchenko
	<andr2000@gmail.com>, Julien Grall <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Topic: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Index:
 AQHWoVvrkmJwOYERdUOadvid1OghFamwEIWAgABuPwCAA/gngIAAQvMAgAAErACABnTvAIAAA4IAgAAQNoCAAAa2AIAABRmA
Date: Fri, 6 Nov 2020 14:41:08 +0000
Message-ID: <1390C05F-445F-4349-A672-4D7373C301B8@arm.com>
References:
 <b085e894773842ac320b818aa6f84289d0a128ed.1602591365.git.rahul.singh@arm.com>
 <09cfc160-3490-0aeb-f872-04fb4ce04364@epam.com>
 <76593217-c7e2-2963-9cbe-d6cc38830710@xen.org>
 <d83f6859-6737-0da8-7c1d-a236e8313869@gmail.com>
 <B8E54A16-8FD4-48E4-82D5-2205EEEB5D2C@arm.com>
 <1001ace5-c6a2-4a81-ba3d-edabeeea9336@epam.com>
 <5F09F481-DC27-4FC3-8CE5-F4F97FDF6DF9@arm.com>
 <2f62f34b-f47d-3472-511f-a89ec1cd36c3@epam.com>
 <20FF6A26-41CF-4888-901A-0FF0ABCC6E64@arm.com>
 <d2eb2db3-7038-3850-310b-4676102e0a55@epam.com>
In-Reply-To: <d2eb2db3-7038-3850-310b-4676102e0a55@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.38.125]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 62d31641-8f96-435c-1911-08d882620f32
x-ms-traffictypediagnostic: DB8PR08MB5097:|DB8PR08MB4106:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB4106C8C17CA0DB70BB2ED451FCED0@DB8PR08MB4106.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 JF+JzPbelXoxoDj+NVN4Uiwrbj6/1E65OmcojqFy6o6ZuqGKxEhaOvDC/VPcDzIH9BwF39Qk9pa983ctlVNKUiRfagqZzuYfO86d0w6p9/bl5naBbCinh31IhylfhjcijgN7kdECRI7NawHlUq7Dfdjqd3/mibX0CIVtYnmzrsaUZNY671e4P/BcX0x1LGzyw4DUhWkwGrjciwChTbDHHRR+EORiHK6hXdHQNQIlNHZWVoSVtZ8z9Egp8bAfcoVmzTizn6lyGsfe76JaJuJKyVdAixbxFAoH4CsmsvEdlfE6a+vJRqUfaD3RWOcU2eqZ+TEzTWOH7CMIq6di5owUWQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(136003)(396003)(39850400004)(86362001)(83380400001)(6512007)(33656002)(36756003)(54906003)(6486002)(8676002)(186003)(5660300002)(2616005)(8936002)(4326008)(91956017)(66556008)(76116006)(66446008)(64756008)(66476007)(26005)(478600001)(55236004)(6506007)(66946007)(53546011)(6916009)(316002)(71200400001)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 MdG9aGWDPalYA4EiXMHS/MwUh6QlvDvbwKhSYXQXhIjgHDeR8g5KGySrbq3xs4+8RdoUKgjpgVdrn/D8B7P1Rj99r03f4MA6ZdnJzN+IoiQFXAI6oY401cVuuv4FUsNj3EZK6kM9PAnRLQzPd06nmj99e8o434Bgm6jJ7V2IH3VS7GWZ7Rf7dUDFfa9ppXaiOz9M4uxn1r/1wZLxDrXOHkLW7ikEGGKr2p7w/zuZDI59iChLPbha1fZedZbO2EnvygLU5TdbJ27NZnWKiWL4IGmYZaT7CvvuKcn0Cq/MgAdH3M99rK2KTX2CmvspoWGcKokk5Dgn61HKmDcgyZnpZaubdxrq0w/ImubTIfPfrATZPvK2n4v9VDqnQnwuDIv/UVKX/sb1ruuljFrPTOwwP3sRXVKmdhBtQlQu/HkOG8YCkeOgvjiTMZKsEXtKlCbrIjT9VlLtOkAD2JTAczzwrsKOzjJqEs0qCUX621uWLEU5FLaY/R/Pl1Wu+MQb6pYslH0Iadbd1mx/CeWZNQeVxT3ufDFKqPWRjVy/REo9ZM914oFYsLte+BUFDHdo09UviozYriffsGHA9LX5rct8VVsbyd21QCppnNPbp0hGq5GCa8PdcE7uiUzQoGIBlXrmekkVFrq4tW69vNrnKYlCKg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <9FF9AD37F545F04FB4E95CCDBC616729@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5097
Original-Authentication-Results: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c861c12e-cfb0-44ae-9019-08d88261ff79
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EO1w9pY+soGZj4EY+N7IpsAYtN5BEcm8+IIJzAa7pc0L/2N4Z3/MDOCaoeRfFTSnHgvFvkLcyqxMaW6ZqdniaUNCKNArmGX7PW9Q33MrHXu17b05zvmUb6vzlFaUvkEiaU9yjcK0D0rI0jt4ZMR1d02P0pnesLwFT3lB2pkFpjmVP/ph67UtobJ1CySTnpy6VPeRZvvCTLWI9V5HPnkLB9JfAWI76C/42fSBwT97ivqm+Tz7a7ucNu8d8xzeMLR1Wo2pcmql+b7Ew5gYz1m67ldHqEA6r2e2pqhNbjt0InOl/hABUMp+1LpebYXVVsciNmbikOQ8OU01qWKrrbQYgIQ3wqfi5QuPCvy8qtO8HxqP9LxFqwlLLGWTvxKIVn+gb6rnE+W88tC4z2qJPVx/Dw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(346002)(396003)(376002)(136003)(46966005)(70586007)(5660300002)(2906002)(70206006)(47076004)(478600001)(6486002)(356005)(81166007)(86362001)(4326008)(83380400001)(82310400003)(82740400003)(6512007)(107886003)(6862004)(33656002)(2616005)(55236004)(53546011)(336012)(26005)(36756003)(36906005)(316002)(8676002)(8936002)(6506007)(54906003)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2020 14:41:34.5472
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62d31641-8f96-435c-1911-08d882620f32
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4106

SGVsbG8gT2xla3NhbmRyLA0KDQo+IE9uIDYgTm92IDIwMjAsIGF0IDI6MjIgcG0sIE9sZWtzYW5k
ciBBbmRydXNoY2hlbmtvIDxPbGVrc2FuZHJfQW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4gd3JvdGU6
DQo+IA0KPiBIaSwgUmFodWwhDQo+IA0KPiBPbiAxMS82LzIwIDM6NTggUE0sIFJhaHVsIFNpbmdo
IHdyb3RlOg0KPj4gSGVsbG8gT2xla3NhbmRyLA0KPj4gDQo+Pj4gT24gNiBOb3YgMjAyMCwgYXQg
MTowMCBwbSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPE9sZWtzYW5kcl9BbmRydXNoY2hlbmtv
QGVwYW0uY29tPiB3cm90ZToNCj4+PiANCj4+PiBIZWxsbywgUmFodWwhDQo+Pj4gDQo+Pj4gT24g
MTEvNi8yMCAyOjQ4IFBNLCBSYWh1bCBTaW5naCB3cm90ZToNCj4+Pj4gSGVsbG8gT2xla3NhbmRy
LA0KPj4+PiANCj4+Pj4+IE9uIDIgTm92IDIwMjAsIGF0IDEwOjEyIGFtLCBPbGVrc2FuZHIgQW5k
cnVzaGNoZW5rbyA8T2xla3NhbmRyX0FuZHJ1c2hjaGVua29AZXBhbS5jb20+IHdyb3RlOg0KPj4+
Pj4gDQo+Pj4+PiBIaSwNCj4+Pj4+IA0KPj4+Pj4gT24gMTEvMi8yMCAxMTo1NSBBTSwgQmVydHJh
bmQgTWFycXVpcyB3cm90ZToNCj4+Pj4+PiBIaSwNCj4+Pj4+PiANCj4+Pj4+Pj4gT24gMiBOb3Yg
MjAyMCwgYXQgMDU6NTUsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxhbmRyMjAwMEBnbWFpbC5j
b20+IHdyb3RlOg0KPj4+Pj4+PiANCj4+Pj4+Pj4gSGksIEp1bGllbiENCj4+Pj4+Pj4gDQo+Pj4+
Pj4+IE9uIDEwLzMwLzIwIDc6MTggUE0sIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+Pj4+Pj4+IEhp
IE9sZWtzYW5kciwNCj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4gT24gMzAvMTAvMjAyMCAxMDo0NCwgT2xl
a3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+Pj4+Pj4gT24gMTAvMjAvMjAgNjoyNSBQ
TSwgUmFodWwgU2luZ2ggd3JvdGU6DQo+Pj4+Pj4+Pj4+IEFkZCBzdXBwb3J0IGZvciBBUk0gYXJj
aGl0ZWN0ZWQgU01NVXYzIGltcGxlbWVudGF0aW9ucy4gSXQgaXMgYmFzZWQgb24NCj4+Pj4+Pj4+
Pj4gdGhlIExpbnV4IFNNTVV2MyBkcml2ZXIuDQo+Pj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+PiBNYWpv
ciBkaWZmZXJlbmNlcyBiZXR3ZWVuIHRoZSBMaW51eCBkcml2ZXIgYXJlIGFzIGZvbGxvd3M6DQo+
Pj4+Pj4+Pj4+IDEuIE9ubHkgU3RhZ2UtMiB0cmFuc2xhdGlvbiBpcyBzdXBwb3J0ZWQgYXMgY29t
cGFyZWQgdG8gdGhlIExpbnV4IGRyaXZlcg0KPj4+Pj4+Pj4+PiAgICAgIHRoYXQgc3VwcG9ydHMg
Ym90aCBTdGFnZS0xIGFuZCBTdGFnZS0yIHRyYW5zbGF0aW9ucy4NCj4+Pj4+Pj4+PiBGaXJzdCBv
ZiBhbGwgdGhhbmsgeW91IGZvciB0aGUgZWZmb3J0cyENCj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+PiBJ
IHRyaWVkIHRoZSBwYXRjaCB3aXRoIFFFTVUgYW5kIHdvdWxkIGxpa2UgdG8ga25vdyBpZiBteSB1
bmRlcnN0YW5kaW5nIGNvcnJlY3QNCj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+PiB0aGF0IHRoaXMgY29t
YmluYXRpb24gd2lsbCBub3Qgd29yayBhcyBvZiBub3c6DQo+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4g
KFhFTikgU01NVXYzOiAvc21tdXYzQDkwNTAwMDA6IFNNTVV2MzogRFQgdmFsdWUgPSBldmVudHEN
Cj4+Pj4+Pj4+PiAoWEVOKSBEYXRhIEFib3J0IFRyYXAuIFN5bmRyb21lPTB4MTk0MDAxMA0KPj4+
Pj4+Pj4+IChYRU4pIFdhbGtpbmcgSHlwZXJ2aXNvciBWQSAweDQwMDMxMDAwIG9uIENQVTAgdmlh
IFRUQlIgMHgwMDAwMDAwMGI4NDY5MDAwDQo+Pj4+Pj4+Pj4gKFhFTikgMFRIWzB4MF0gPSAweDAw
MDAwMDAwYjg0NjhmN2YNCj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+PiBbc25pcF0NCj4+Pj4+Pj4+PiAN
Cj4+Pj4+Pj4+PiBJZiB0aGlzIGlzIGV4cGVjdGVkIHRoZW4gaXMgdGhlcmUgYW55IHBsYW4gdG8g
bWFrZSBRRU1VIHdvcmsgYXMgd2VsbD8NCj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+PiBJIHNlZSBbMV0g
c2F5cyB0aGF0ICJPbmx5IHN0YWdlIDEgYW5kIEFBcmNoNjQgUFRXIGFyZSBzdXBwb3J0ZWQuIiBv
biBRRU1VIHNpZGUuDQo+Pj4+Pj4+PiBKdXN0IGZvciBjbGFyaWNhdGlvbiwgeW91IGFyZSB0cnlp
bmcgdG8gYm9vdCBYZW4gb24gUUVNVSwgcmlnaHQ/DQo+Pj4+Pj4+IEV4YWN0bHkNCj4+Pj4+Pj4+
IFlvdSBtaWdodCBiZSBhYmxlIHRvIHVzZSB0aGUgc3RhZ2UtMSBwYWdlLXRhYmxlcyB0byBpc29s
YXRlIGVhY2ggZGV2aWNlIGluIFhlbi4gSG93ZXZlciwgSSBkb24ndCB0aGluayB5b3Ugd2lsbCBi
ZSBhYmxlIHRvIHNoYXJlIHRoZSBQMk0gYmVjYXVzZSB0aGUgcGFnZS10YWJsZXMgbGF5b3V0IGJl
dHdlZW4gc3RhZ2UtMSBhbmQgc3RhZ2UtMiBpcyBkaWZmZXJlbnQuDQo+Pj4+Pj4+IFNvLCBpdCBp
cyBldmVuIG1vcmUgd29yayB0aGVuDQo+Pj4+Pj4gT3ZlcmFsbCBpdCB3b3VsZCBtYWtlIG1vcmUg
c2Vuc2UgdG8gc3BlbmQgc29tZSB0aW1lIGFkZGluZyBwcm9wZXIgc3VwcG9ydCBpbiBRZW11IHRo
ZW4gdHJ5aW5nIHRvIG1vZGlmeSB0aGUgZHJpdmVyIHRvIHN1cHBvcnQgUWVtdSByaWdodCBub3cu
DQo+Pj4+Pj4gDQo+Pj4+Pj4+Pj4gV2UgYXJlIGludGVyZXN0ZWQgaW4gUUVNVS9TTU1VdjMgYXMg
YSBmbGV4aWJsZSBwbGF0Zm9ybSBmb3IgUENJIHBhc3N0aHJvdWdoDQo+Pj4+Pj4+Pj4gDQo+Pj4+
Pj4+Pj4gaW1wbGVtZW50YXRpb24sIHNvIGl0IGNvdWxkIGFsbG93IHRlc3RpbmcgZGlmZmVyZW50
IHNldHVwcyBhbmQgY29uZmlndXJhdGlvbnMgd2l0aCBRRU1VLg0KPj4+Pj4+Pj4gSSB3b3VsZCBy
ZWNvbW1lbmQgdG8gZ2V0IHRoZSBTTU1VIHN1cHBvcnRpbmcgc3VwcG9ydGluZyBzdGFnZS0yIHBh
Z2UtdGFibGVzLg0KPj4+Pj4+PiBZb3UgbWVhbiBpbiBRRU1VPw0KPj4+Pj4+IFNlZSBiZWZvcmUu
DQo+Pj4+Pj4gDQo+Pj4+Pj4+PiBSZWdhcmRsZXNzIHRoYXQsIEkgdGhpbmsgWGVuIHNob3VsZCBi
ZSBhYmxlIHRvIHNheSB0aGUgU01NVSBpcyBub3Qgc3VwcG9ydGVkIHJhdGhlciB0aGFuIGNyYXNo
aW5nLg0KPj4+Pj4+PiBZZXMsIHRoYXQgd291bGQgYmUgbmljZQ0KPj4+Pj4+IEZ1bGx5IGFncmVl
IGFuZCB3ZSB3aWxsIGxvb2sgaW50byB0aGF0Lg0KPj4+Pj4+IA0KPj4+Pj4+IEFueXRoaW5nIHlv
dSBjb3VsZCBzaGFyZSBzbyB0aGF0IHdlIGNvdWxkIHF1aWNrbHkgcmVwcm9kdWNlIHlvdXIgc2V0
dXAgd291bGQgYmUgbW9yZSB0aGVuIGdyZWF0Lg0KPj4+Pj4gTm90aGluZyBzcGVjaWFsLA0KPj4+
Pj4gDQo+Pj4+PiBxZW11L2FhcmNoNjQtc29mdG1tdS9xZW11LXN5c3RlbS1hYXJjaDY0IC1tYWNo
aW5lIHR5cGU9dmlydCAtbWFjaGluZSB2aXJ0LGdpYy12ZXJzaW9uPTIgXA0KPj4+Pj4gDQo+Pj4+
PiAtbWFjaGluZSB2aXJ0dWFsaXphdGlvbj10cnVlIC1jcHUgY29ydGV4LWE1NyAtc21wIDQgLW0g
MjA0OCAtbmljIHVzZXIsaG9zdGZ3ZD10Y3A6MTI3LjAuMC4xOjIyMjItOjIyIFwNCj4+Pj4+IA0K
Pj4+Pj4gLW5vZ3JhcGhpYyAtc2VyaWFsIG1vbjpzdGRpbyBbLi5zbmlwLi5dDQo+Pj4+PiANCj4+
Pj4+IEkgYWxzbyBzZXQgaW9tbXUgdG8gc21tdXYzIGluIG15IHRlc3RzLCBRRU1VIGVtdWxhdG9y
IHZlcnNpb24gNC4yLjENCj4+Pj4gSSBqdXN0IGNoZWNrZWQgYW5kIGNvbmZpcm1lZCB0aGF0IFFF
TVUgaXMgYm9vdGluZyB3aXRoIFhFTiBTTU1VdjMgcGF0Y2ggYW5kIFhFTiBpcyBhYmxlIHRvIHNh
eSBTTU1VIHRyYW5zbGF0aW9uIGlzIG5vdCBzdXBwb3J0ZWQuIEFzIFhFTiBzdXBwb3J0cyBTdGFn
ZS0yIHRyYW5zbGF0aW9uIGFuZCBRRU1VIHN1cHBvcnRzIFN0YWdlLTEgb25seS4NCj4+Pj4gDQo+
Pj4+IA0KPj4+PiAoWEVOKSBTTU1VdjM6IC9zbW11djNAOTA1MDAwMDogU01NVXYzOiBEVCB2YWx1
ZSA9IGV2ZW50cQ0KPj4+PiAoWEVOKSBTTU1VdjM6IC9zbW11djNAOTA1MDAwMDogSURSMC5DT0hB
Q0Mgb3ZlcnJpZGRlbiBieSBGVyBjb25maWd1cmF0aW9uIChmYWxzZSkNCj4+Pj4gKFhFTikgU01N
VXYzOiAvc21tdXYzQDkwNTAwMDA6IG5vIHRyYW5zbGF0aW9uIHN1cHBvcnQhDQo+Pj4+IChYRU4p
IEkvTyB2aXJ0dWFsaXNhdGlvbiBkaXNhYmxlZA0KPj4+PiANCj4+Pj4gT25seSBkaWZmZXJlbmNl
IEkgb2JzZXJ2ZWQgaXMgdGhhdCB5b3UgaGF2ZSB0byBhZGQgb3B0aW9uICItbWFjaGluZSB2aXJ0
LGlvbW11PXNtbXV2MyDigJwgd2hlbiBsYXVuY2hpbmcgdGhlIFFFTVUuDQo+Pj4gSSBkbyB1c2Ug
dGhlIG9wdGlvbg0KPj4gSSB1c2VkICItbWFjaGluZSB2aXJ0LGlvbW11PXNtbXV2MyDigJwgIG9w
dGlvbiB3aGlsZSBjcmVhdGluZyB0aGUgdmlydC1kdGIgYW5kIHdoaWxlIGxhdW5jaGluZyB0aGUg
UUVNVS4NCj4+IEkgYWxzbyBvYnNlcnZlZCB0aGUgc2FtZSBlcnJvciB3aGF0IHlvdSBvYnNlcnZl
ZCBpZiBJIGFtIG5vdCB1c2luZyB0aGUgIi1tYWNoaW5lIHZpcnQsaW9tbXU9c21tdXYzIOKAnCBv
cHRpb25zIHdoZW4gbGF1bmNoaW5nIHRoZSBRRU1VIHNvIEkgdGhvdWdodCB0aGlzIG1pZ2h0IGJl
IGNhc2UgZm9yIHlvdSBhbHNvIGJ1dCBhbnl3YXlzIHlvdSBoYXZlIHVzZSB0aGUgb3B0aW9ucyBp
dCBtaWdodCBiZSBvdGhlciBpc3N1ZS4NCj4gDQo+IEhtLCBwcm9iYWJseSB0aGF0IHdhcyBvbiBt
eSBzaWRlIGFzIG5vdyBJIGNhbiBzZWU6DQo+IA0KPiAoWEVOKSBTTU1VdjM6IC9zbW11djNAOTA1
MDAwMDogU01NVXYzOiBEVCB2YWx1ZSA9IGV2ZW50cQ0KPiAoWEVOKSBTTU1VdjM6IC9zbW11djNA
OTA1MDAwMDogSURSMC5DT0hBQ0Mgb3ZlcnJpZGRlbiBieSBGVyBjb25maWd1cmF0aW9uIChmYWxz
ZSkNCj4gKFhFTikgU01NVXYzOiAvc21tdXYzQDkwNTAwMDA6IG5vIHRyYW5zbGF0aW9uIHN1cHBv
cnQhDQo+IChYRU4pIEkvTyB2aXJ0dWFsaXNhdGlvbiBkaXNhYmxlZA0KPiAoWEVOKQ0KPiAoWEVO
KSAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqDQo+IChYRU4pIFBhbmlj
IG9uIENQVSAwOg0KPiAoWEVOKSBDb3VsZG4ndCBjb25maWd1cmUgY29ycmVjdGx5IGFsbCB0aGUg
SU9NTVVzLg0KPiAoWEVOKSAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
DQo+IChYRU4pDQo+IChYRU4pIE1hbnVhbCByZXNldCByZXF1aXJlZCAoJ25vcmVib290JyBzcGVj
aWZpZWQpDQo+IA0KPiBTbywgc29ycnkgZm9yIHRoZSBub2lzZSwgSSBtaWdodCBoYXZlIG1pc2Nv
bmZpZ3VyZWQgc29tZXRoaW5nIGl0IHNlZW1zDQo+IA0KPiBXaGVuIHlvdSBzYXkgIlhlbiBpcyBi
b290aW5nIiBkbyB5b3UgbWVhbiB5b3Ugc2VlIHRoZSBzYW1lIHBhbmljPw0KDQpZZXMgSSBvYnNl
cnZlIHRoZSBzYW1lLiANCg0KV2UgaGF2ZSB0byBkZWNpZGUgbm93IGlmIGZvciBTTU1VdjMgdGhl
cmUgaXMgbm8gdHJhbnNsYXRpb24gc3VwcG9ydCBkbyB3ZSBoYXZlIHRvIHByaW50IHRoZSBsb2dz
IGFuZCBtb3ZlIGZvcndhcmQgIG9yIGFzIGFib3ZlIHJldHVybiBlcnJvciB0byBpb21tdV9zZXR1
cCB0aGF0IHdpbGwgY2FsIHBhbmljKCkuDQoNClJlZ2FyZHMsDQpSYWh1bA0KDQo+IA0KPiBUaGFu
ayB5b3UsDQo+IA0KPiBPbGVrc2FuZHINCj4gDQo+PiANCj4+Pj4gUGxlYXNlIGxldCBtZSBrbm93
IGlmIGl0IGFsc28gd29ya3MgZm9yIHlvdS4NCj4+PiBXZWxsLCBJIHNob3VsZCBoYXZlIHJlcG9y
dGVkIHRoYXQgZWFybGllciB0aGF0IEkgZG8gbm90IHVzZSB0aGUgc3RhZ2luZyBYZW4gYXQgdGhl
IG1vbWVudCwNCj4+PiANCj4+PiBpdCBpcyA0LjE0LjAuIFNvLCBjYW4gdGhpcyBiZSBhIHByb2Js
ZW0gd2l0aCB0aGF0IFhlbiB2ZXJzaW9uPw0KPj4gSSBkb27igJl0IHRoaW5rIHNvIHRoaXMgaXMg
dGhlIHByb2JsZW0gd2l0aCB0aGUgWEVOIHZlcnNpb24uDQo+Pj4gQW55d2F5cywgaWYgaXQgd29y
a3Mgd2l0aCB0aGUgc3RhZ2luZyB0aGVuIGV2ZXJ5dGhpbmcgbG9va3Mgb2sNCj4+PiANCj4+PiBU
aGFuayB5b3UsDQo+Pj4gDQo+Pj4gT2xla3NhbmRyDQo+Pj4gDQo+Pj4+Pj4gUmVnYXJkcw0KPj4+
Pj4+IEJlcnRyYW5kDQo+Pj4+Pj4gDQo+Pj4+Pj4+PiBDaGVlcnMsDQo+Pj4+Pj4+PiANCj4+Pj4+
Pj4gVGhhbmsgeW91LA0KPj4+Pj4+PiANCj4+Pj4+Pj4gT2xla3NhbmRyDQo+PiBSZWdhcmRzLA0K
Pj4gUmFodWwNCg0K

