Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E20F2B9631
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 16:27:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30969.61191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kflpA-0001fv-UR; Thu, 19 Nov 2020 15:26:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30969.61191; Thu, 19 Nov 2020 15:26:16 +0000
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
	id 1kflpA-0001fW-Qs; Thu, 19 Nov 2020 15:26:16 +0000
Received: by outflank-mailman (input) for mailman id 30969;
 Thu, 19 Nov 2020 15:26:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zZym=EZ=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kflp9-0001fJ-GV
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 15:26:15 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.57]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 215c975e-a20c-47b1-b676-fec54cbf2be7;
 Thu, 19 Nov 2020 15:26:12 +0000 (UTC)
Received: from AM6PR08CA0014.eurprd08.prod.outlook.com (2603:10a6:20b:b2::26)
 by VE1PR08MB5807.eurprd08.prod.outlook.com (2603:10a6:800:1b2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Thu, 19 Nov
 2020 15:25:52 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:b2:cafe::a5) by AM6PR08CA0014.outlook.office365.com
 (2603:10a6:20b:b2::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Thu, 19 Nov 2020 15:25:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT034.mail.protection.outlook.com (10.152.18.85) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Thu, 19 Nov 2020 15:25:52 +0000
Received: ("Tessian outbound 814be617737e:v71");
 Thu, 19 Nov 2020 15:25:51 +0000
Received: from 2978a1470557.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 108A4C02-FBFE-4D64-B0C3-F5C925E4E687.1; 
 Thu, 19 Nov 2020 15:25:36 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2978a1470557.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 19 Nov 2020 15:25:36 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB5323.eurprd08.prod.outlook.com (2603:10a6:10:fa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Thu, 19 Nov
 2020 15:25:35 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::39b7:6f9f:d046:e737]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::39b7:6f9f:d046:e737%7]) with mapi id 15.20.3564.028; Thu, 19 Nov 2020
 15:25:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=zZym=EZ=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kflp9-0001fJ-GV
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 15:26:15 +0000
X-Inumbo-ID: 215c975e-a20c-47b1-b676-fec54cbf2be7
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown [40.107.22.57])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 215c975e-a20c-47b1-b676-fec54cbf2be7;
	Thu, 19 Nov 2020 15:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fnRy+fxV9dnRf6NefZ4V+5c/BTUDI2EIrMkGJmEKFTQ=;
 b=lu0oU94LtRMbjz9UxcCfg4U9Y8U+MjaMaRlTo5ExXLNgXAbf3S8lqIg3LmgU1pXI3DS2rs9BN6eZ/uOdgrsHfTnDa6Izb8FWUQjblSrOOP70UMrwMRUEtKemd1AHlqLYFDrRcRQECOcqZ8/93w9SLhy+1SOTkVLm1wlK3vtvkWs=
Received: from AM6PR08CA0014.eurprd08.prod.outlook.com (2603:10a6:20b:b2::26)
 by VE1PR08MB5807.eurprd08.prod.outlook.com (2603:10a6:800:1b2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Thu, 19 Nov
 2020 15:25:52 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:b2:cafe::a5) by AM6PR08CA0014.outlook.office365.com
 (2603:10a6:20b:b2::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Thu, 19 Nov 2020 15:25:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT034.mail.protection.outlook.com (10.152.18.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Thu, 19 Nov 2020 15:25:52 +0000
Received: ("Tessian outbound 814be617737e:v71"); Thu, 19 Nov 2020 15:25:51 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 512a5cd746cca79d
X-CR-MTA-TID: 64aa7808
Received: from 2978a1470557.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 108A4C02-FBFE-4D64-B0C3-F5C925E4E687.1;
	Thu, 19 Nov 2020 15:25:36 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2978a1470557.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 19 Nov 2020 15:25:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JLIM1IEVW/g1W9lifEZe1Q42fe9uWHwiilTG3rqUOAwkRdxEQhXI7526+wNy9NQCB/tcg2Q540lLhQ9bmX5vs2IK9RztMbRP8FQNJrv44y16PeNDclAhc/M7TqMFswCHFmoJ71tdTUe6Enb36Y+voTEarWv2zH0Tf/7RfvPz6VugRXN70zvVvEzwGt6MMMOwCA1s0BMofoEaxfRaVzAA7ELblR9XuKxMLXwN1agA6/9Lrig1j0IHE+NKq7AiN0yvGZHKnkJgIL0GVbzBwhhf5JL8jucF0DFqmUXVHgcp0gJL6SwZhOL0HMALqhyuCHnskWmMiJDqfoViYt+MzTyDfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fnRy+fxV9dnRf6NefZ4V+5c/BTUDI2EIrMkGJmEKFTQ=;
 b=abENyA61P2vmdfwGM75bt20qEyXhRETyOlm26zXR6NJRfeFvYPLR6+IfQPXaJ3QFHl086YJDk+pd6WJdtLP0pg5BzkFGpSc2IsRm55DKml1ko+E8JXMfQk5QziNoWwNjreUMO/zIJYaLOMP92t7pGWazCwxnYTt3TLFSz65LeplqxH3UdcL75kuCdmLxt7TSUnJkWOun2xKxhgg1EtYmGuqZRaqEAckjU8YHYgi1x5HE/C4CfuFjBwfWnBONpWX0+yJbMoBjC8IMqzPTri/ggSGI9cRUNLOVDounnjvYZeQkmdOe0VEeGoGDDgYaRH/EJIdnD8D+jPx7OB3+phR24w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fnRy+fxV9dnRf6NefZ4V+5c/BTUDI2EIrMkGJmEKFTQ=;
 b=lu0oU94LtRMbjz9UxcCfg4U9Y8U+MjaMaRlTo5ExXLNgXAbf3S8lqIg3LmgU1pXI3DS2rs9BN6eZ/uOdgrsHfTnDa6Izb8FWUQjblSrOOP70UMrwMRUEtKemd1AHlqLYFDrRcRQECOcqZ8/93w9SLhy+1SOTkVLm1wlK3vtvkWs=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB5323.eurprd08.prod.outlook.com (2603:10a6:10:fa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Thu, 19 Nov
 2020 15:25:35 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::39b7:6f9f:d046:e737]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::39b7:6f9f:d046:e737%7]) with mapi id 15.20.3564.028; Thu, 19 Nov 2020
 15:25:34 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jorge Pereira <jorge.pereira@nxp.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: smmu-related clarification
Thread-Topic: smmu-related clarification
Thread-Index: Ada+dgwvLpGgRoDvTYGCt70DgFD1qgAEi0YA
Date: Thu, 19 Nov 2020 15:25:34 +0000
Message-ID: <0686AEE9-0597-4AA0-98CE-60CC816ABDC3@arm.com>
References:
 <AM6PR04MB58630B20435EEDF65D2577E2F0E00@AM6PR04MB5863.eurprd04.prod.outlook.com>
In-Reply-To:
 <AM6PR04MB58630B20435EEDF65D2577E2F0E00@AM6PR04MB5863.eurprd04.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 967a7b14-b51b-4a79-9d7f-08d88c9f66a0
x-ms-traffictypediagnostic: DB8PR08MB5323:|VE1PR08MB5807:
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB5807514450F17506260F52F69DE00@VE1PR08MB5807.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8pRDqGOJBX1Inq/oFSXRxCOyrJhwB1twd7yDBTEx8GajtdHsg6MMWv8SpPOdFIasQDp/NbeFFQHbSsQMEa3g17HX7RKLsHdu5d/aM2c+j77ESNHfeqEQDpSNnizxVZkqWFU/5/KHkk6zSuchkrePoOyXb3MX/Q9nbMNaoaW+hF7F8xOvOm3dwEWrbgJYuO10KfpOS6UU/RjcuNQPU+sbuHDQfREW2TH+E3/wxG5fEDz32Rq0VC4OnZaBU2dAqyj0bvK9ke2g/0tJRrX33rT4ybo8FW1LcgfrIy1Npxtqy/qONlplSGLEBhTrW70svv3RGejZBoq73H8hTuWao7GEaA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(39850400004)(396003)(136003)(346002)(33656002)(316002)(86362001)(2616005)(66476007)(71200400001)(2906002)(8936002)(3480700007)(66946007)(66446008)(76116006)(91956017)(6486002)(66556008)(64756008)(4744005)(6506007)(83380400001)(186003)(6916009)(53546011)(4326008)(8676002)(6512007)(26005)(478600001)(36756003)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 Fzwc6c677siGj3P46jH1N4PyvU2a1hSYiThZfLdw+JRaDEkExwtotRu5Va1IVQhIje1ZTsB7mrGbWVcP2QZOnnkvohfNCwpZ0JGGJJpIuIrKcUbj2mJyUoHNtG1Bt2UfVH3tT+PPg4Gy3iDWuEVX06sUPvBuZ1htCHpbTOI6LRQdguo51J9R3LsPnCoZ/mjuu5myqtjhrO3plSerVaJIcwU6HwQv/cwDq+VHMA+s042XyKElji2byiCkKPhNpZNXM3jB4fTr+OrmFGXcjluZsQjX6TUkYXMLrLMCLW3B6S4KjB2SnB49ip2p1DUYa7V+vBgC4e9dIbxF/YBExdCwzhICAC2UFwQBlhhyzTinxp+xr5hqamlsYSL+EQWBGoclZ3Rem19TnYSompD+q4ssL9O3BYvy2Ezda52cvmLPaBbF3v8cI05PDyjMdJYjHBjPEW+Wo3YMzvSNvyfbMGLmbtiQfet/MjKpTLqZFisJmLvcLqJZhN+aGWdM2p0uemzDbc+Z+mX2S/PKoBFqcSOu/wuE/zLOPIdY09Pm2QJgwaZo55AFHx2SK1npz9E8hns1YmY819aEAqpa31yNHPnhA4iDrcRdqXUoNkiGEImZrpbUh7re0uB55dlvbnCiEwqCVTF90TlWyBi22IMmfarfjg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <C2E6F6A287E59942B279D2838AC850B6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5323
Original-Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f80d5604-c193-4162-0d9d-08d88c9f5c2d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pCbMA41JDfd9tXVgurqgNyvo0hItBFmIlzWV0U84VXZaZyNbM9y1Gqlb5GURcAYqJZ+UaP22v6f9M8QEPRaN9UiysGAEmeAkSo15dQWeest2QXz/lC7ha1/xCtkTDhyWcxRoTWqgw2XikXm4HleJIqmRPlcm7x2dwgpPiyuBWNCWKSb9HvLH/cZI6hjAVSL2OuICsXUe69RvAEaRj7BRBJnM//KF5Db2ecl1X7h8L/A0q+s6WKAs+J03fUHPMkRShXTakrkHnZ0gY2R+WNsCJhK1JWzN5Iz3fmMA8sgR60MAYDLqGTINyDdKDJije8ND/eIUkUgsZL8w/qrYOs6sivpZTfXHaWekBUVCshkXyNcQQunloNAHjIemDrC44mQZ/Mddhb6tp5LqEGl7iaMcjw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(39860400002)(376002)(46966005)(6486002)(33656002)(4744005)(336012)(47076004)(2616005)(83380400001)(6506007)(53546011)(2906002)(82310400003)(82740400003)(81166007)(8676002)(8936002)(478600001)(26005)(36756003)(86362001)(356005)(3480700007)(70206006)(186003)(5660300002)(6512007)(316002)(6862004)(4326008)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 15:25:52.0696
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 967a7b14-b51b-4a79-9d7f-08d88c9f66a0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5807

SGkgSm9yZ2UsDQoNCj4gT24gMTkgTm92IDIwMjAsIGF0IDEzOjE2LCBKb3JnZSBQZXJlaXJhIDxq
b3JnZS5wZXJlaXJhQG54cC5jb20+IHdyb3RlOg0KPiANCj4gSGkgQWxsLA0KPiAgDQo+IEnigJlt
IGhhdmluZyBzb21lIHNtbXUtcmVsYXRlZCBpc3N1ZXMsIEkgbmVlZCBoZWxwLiANCj4gIA0KPiBT
bywgaW4gbXkgdXNlLWNhc2Ugc2NlbmFyaW8gSSBoYXZlIHR3byBsaW51eCBndWVzdHMgcnVubmlu
ZyBpbiBwYXJhbGxlbCDigJMgZG9tMCBhbmQgZG9tVS0uIEkgaGF2ZSB0byBlbmFibGUgdGhlIHNt
bXUgYmVjYXVzZSBJIHdhbnQgdG8gcGFzc3Rob3VnaCBkZXZpY2VzIHRvIGRvbVUuDQo+ICANCj4g
V291bGQgYmUgZ3JlYXQgaWYgeW91IGhlbHAgbWUgdG8gY2xhcmlmeSB0aGUgZm9sbG93aW5nIHF1
ZXN0aW9uczogIA0KPiAJ4oCiIGlmIEkgZW5hYmxlIFNNTVUsIGl0IHdpbGwgYXBwbGllcyBub3Qg
b25seSB0byBkb21VIGJ1dCBhbHNvIHRvIGRtYS1jYXBhYmxlIGRldmljZXMgYXNzaWduZWQgdG8g
ZG9tMD8NCg0KeWVzIGl0IHdpbGwgYXBwbHkgdG8gYWxsIHlvdXIgZG9tYWlucy4NCg0KPiAJ4oCi
IERvIEkgaGF2ZSB0byBhZGQgYWxsIHNtbXUtbWFzdGVycyAgb2YgZG9tMCBpbiBkZXZpY2UgdHJl
ZSBhcyB3ZWxsPyBPciBzaW5jZSBkb20wIGhhcyAxOjEgbWFwcGluZyBJIGRvbuKAmXQgaGF2ZSB0
byBkbyBhbnl0aGluZz8NCg0Kc21tdSBpcyBub3Qgb25seSB1c2VkIGZvciByZW1hcHBpbmcgYnV0
IGFsc28gdG8gcHJvdGVjdCBETUEgYWNjZXNzZXMgd2hpY2ggbWVhbnMgZm9yIGRvbTAgaXQgd2ls
bCB1c2UgMToxIG1hcHBpbmcgYnV0IHdpbGwgbGltaXQgRE1BIHRvIHRoZSBtZW1vcnkgYWNjZXNz
aWJsZSB0byBkb20wLg0KU28geW91IHdpbGwgbmVlZCB0byBhZGQgYWxsIHJlcXVpcmVkIHNtbXUg
aW5mb3JtYXRpb24gdG8gYWxsIGRldmljZXMgeW91IG5lZWQgb3RoZXJ3aXNlIGRldmljZXMgd2ls
bCBiZSBkZW5pZWQgYW55IERNQSBhY2Nlc3MuDQoNClJlZ2FyZHMNCkJlcnRyYW5kDQoNCj4gIA0K
PiBUaGFua3MsDQo+IEpvcmdlDQoNCg==

