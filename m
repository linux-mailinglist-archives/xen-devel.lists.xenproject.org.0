Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A45C52C04C2
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 12:41:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34049.64901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khADh-0004Mj-Iz; Mon, 23 Nov 2020 11:41:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34049.64901; Mon, 23 Nov 2020 11:41:21 +0000
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
	id 1khADh-0004MK-FW; Mon, 23 Nov 2020 11:41:21 +0000
Received: by outflank-mailman (input) for mailman id 34049;
 Mon, 23 Nov 2020 11:41:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sKME=E5=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1khADf-0004MF-T1
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 11:41:20 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.42]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f11d01f2-cf40-4b58-a9b7-82036ed10515;
 Mon, 23 Nov 2020 11:41:17 +0000 (UTC)
Received: from AM5PR0601CA0072.eurprd06.prod.outlook.com (2603:10a6:206::37)
 by AM6PR08MB4803.eurprd08.prod.outlook.com (2603:10a6:20b:c4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 11:41:14 +0000
Received: from AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::ef) by AM5PR0601CA0072.outlook.office365.com
 (2603:10a6:206::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21 via Frontend
 Transport; Mon, 23 Nov 2020 11:41:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT019.mail.protection.outlook.com (10.152.16.104) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Mon, 23 Nov 2020 11:41:13 +0000
Received: ("Tessian outbound 814be617737e:v71");
 Mon, 23 Nov 2020 11:41:13 +0000
Received: from 606f07e76f97.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CF5C4126-6716-40F7-A5D1-8031FDA1008B.1; 
 Mon, 23 Nov 2020 11:41:08 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 606f07e76f97.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 23 Nov 2020 11:41:08 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DBBPR08MB6233.eurprd08.prod.outlook.com (2603:10a6:10:204::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Mon, 23 Nov
 2020 11:41:07 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef%2]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 11:41:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=sKME=E5=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1khADf-0004MF-T1
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 11:41:20 +0000
X-Inumbo-ID: f11d01f2-cf40-4b58-a9b7-82036ed10515
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown [40.107.20.42])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f11d01f2-cf40-4b58-a9b7-82036ed10515;
	Mon, 23 Nov 2020 11:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VtD46QMeINkduY2XywzbAXnHVDQRRObMhdnVyogng64=;
 b=FV+jnDKMNpLR7omwhNds4kzScKQfb7jN4lx+Fmeb+q0ZU4ug5g604Xq/EnOpmhykpPtfiwa0D8+rWy5IDozIpLpFfHQrqqbqye/SiW2AiyF1y1t/WWuU3RHe+jbiORrylmyrW3SKpetyHGtN9TDn0JoKJ+vwlEImNZwK/6zfHVk=
Received: from AM5PR0601CA0072.eurprd06.prod.outlook.com (2603:10a6:206::37)
 by AM6PR08MB4803.eurprd08.prod.outlook.com (2603:10a6:20b:c4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 11:41:14 +0000
Received: from AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::ef) by AM5PR0601CA0072.outlook.office365.com
 (2603:10a6:206::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21 via Frontend
 Transport; Mon, 23 Nov 2020 11:41:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT019.mail.protection.outlook.com (10.152.16.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Mon, 23 Nov 2020 11:41:13 +0000
Received: ("Tessian outbound 814be617737e:v71"); Mon, 23 Nov 2020 11:41:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f6388205ddd3974d
X-CR-MTA-TID: 64aa7808
Received: from 606f07e76f97.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id CF5C4126-6716-40F7-A5D1-8031FDA1008B.1;
	Mon, 23 Nov 2020 11:41:08 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 606f07e76f97.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 23 Nov 2020 11:41:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jM0Ycbhc8p2Hl0iDcjWAmKWYUOoJZ/jjkh99rd7H3pSobOnw0O30C2Vh7JJnBiZ5yXhBz7Ggh5lPy1P5L9NpDo4clYL2LnwOIN3afm3mOWR/1zuoCGmOHJ78krTB9lEZYvZsnPoqxGpDCh6AqlbbG17cUc3jatNPGBoCJZn9Y5l6l8DOOF40IT+cb0uBaeIkoQI0GgUW/g0wn7CdRzAMiUr36r6Ft84wIg0GjslGXBoKpA7St5lHLUspGba8FBm07V42QfKaDfKWep6pT2fpOLNi6uUwybBbNc4vAn1erTkrSEr9yuneJxv/pjmbjOJoUytrDahZo/o3R68ZxsWfVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VtD46QMeINkduY2XywzbAXnHVDQRRObMhdnVyogng64=;
 b=EnTxXjBEjaxqjYUnJcVp5EOcWeR0yq9g1lqykw6SEgvFgP56m4qojSaAoNZ5mh7CQS0DBvQK9fvUHDK4bLyZrW46dOcEr2sj2ge7jWZRuwmZ5R6wJcMHPQdPQcBcqJ2i7XeE9KS25lZwJKFUn/ynrHNEG4S4liYG4YaM+h0nacUCKcJIy30rESNJytkr8+gjwbGMJTNMt7xVPdZamZUp3+KEACR0YxuE4xGe6AirCGdx6fDshILonJIvxt7vJ+ygz0VoDGq74bHiIJNzxGFaFSk7C8MDYZBq/SS5eg8lX261uX5BEcONyOsKvC4J0DOhgGRV0kEHZgejmPspa5J71g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VtD46QMeINkduY2XywzbAXnHVDQRRObMhdnVyogng64=;
 b=FV+jnDKMNpLR7omwhNds4kzScKQfb7jN4lx+Fmeb+q0ZU4ug5g604Xq/EnOpmhykpPtfiwa0D8+rWy5IDozIpLpFfHQrqqbqye/SiW2AiyF1y1t/WWuU3RHe+jbiORrylmyrW3SKpetyHGtN9TDn0JoKJ+vwlEImNZwK/6zfHVk=
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DBBPR08MB6233.eurprd08.prod.outlook.com (2603:10a6:10:204::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Mon, 23 Nov
 2020 11:41:07 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef%2]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 11:41:07 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Leo Krueger <leo.krueger@zal.aero>
CC: Julien Grall <julien@xen.org>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, Peng Fan <peng.fan@nxp.com>,
	"brucea@xilinx.com" <brucea@xilinx.com>, Cornelia Bruelhart
	<cornelia.bruelhart@zal.aero>, "oleksandr_andrushchenko@epam.com"
	<oleksandr_andrushchenko@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: Xen data from meta-virtualization layer
Thread-Topic: Xen data from meta-virtualization layer
Thread-Index: AQHWwY2IpqlJM9tSokSREK4Y63jM5A==
Date: Mon, 23 Nov 2020 11:41:07 +0000
Message-ID: <50B2EEEF-4BF2-4511-98D5-F165A70E2EC6@arm.com>
References:
 <AM4PR0501MB2227089FDDF0209EF6E215D9E6100@AM4PR0501MB2227.eurprd05.prod.outlook.com>
 <HE1PR05MB47941E23CE053CE72F18867C8BEA0@HE1PR05MB4794.eurprd05.prod.outlook.com>
 <alpine.DEB.2.21.2011091858010.21307@sstabellini-ThinkPad-T480s>
 <HE1PR05MB4794B5C57A54A29A48EE8EAE8BE90@HE1PR05MB4794.eurprd05.prod.outlook.com>
 <alpine.DEB.2.21.2011101842500.21307@sstabellini-ThinkPad-T480s>
 <DB6PR0402MB27608A03EC717053E392A92988E80@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <HE1PR05MB47940ED4E5FDC0BADC54C8E78BE80@HE1PR05MB4794.eurprd05.prod.outlook.com>
 <DB6PR0402MB2760CEEABA9F52CDEB27C1DB88E80@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <HE1PR05MB47944761ED6A26D3E2CE15868BE40@HE1PR05MB4794.eurprd05.prod.outlook.com>
 <alpine.DEB.2.21.2011161656080.20906@sstabellini-ThinkPad-T480s>
 <HE1PR05MB4794569AC67109AF8B6517268BE20@HE1PR05MB4794.eurprd05.prod.outlook.com>
 <alpine.DEB.2.21.2011171544380.438@sstabellini-ThinkPad-T480s>
 <5dc63ee2-f1ce-31fc-cb6a-fe4dae929fb3@xen.org>
 <HE1PR05MB4794EBDD1FE29BC69D0BCC898BFD0@HE1PR05MB4794.eurprd05.prod.outlook.com>
In-Reply-To:
 <HE1PR05MB4794EBDD1FE29BC69D0BCC898BFD0@HE1PR05MB4794.eurprd05.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: zal.aero; dkim=none (message not signed)
 header.d=none;zal.aero; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 95ff3ff2-7381-4660-809a-08d88fa4ae96
x-ms-traffictypediagnostic: DBBPR08MB6233:|AM6PR08MB4803:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB4803C2596395402549A0F59EFCFC0@AM6PR08MB4803.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:169;OLM:169;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 WF5EZsOLWZr15oxyDvMT/aGX+w8jC/KaEUuyukOR9BlPZA97Y72ijPn+bg40bcNNWZSc/dRZ9uPtYrvW6XfLbZUIzWTp7Jv7hwY8+M3ffGjvN25zONw0ONKeooCcMmCmeD8kq2vfCRGNtyD5ooV2xE0JU1ZDcOA/RiHHHt8qhueWr6jgKjCk2KGvdiaq7cmA9HPk3CQ6lE2LMC8pIYfNoVOsirJHnhceSfnPCp0y7/K6aRN8+Fi54UxbxUkP9RHfa7NP2CSyG2C6TRyh2QhsN/bA8dyFyRyv65G05W+OButhrvK9TomHzS5+En5CnsnVI/xKO/xAWxA9ajki+ZSopK7gg1fF23epWNbnRV6SXIomGrienYftC7uYCfzaegDxTsUzzUPA0kbd9Ta4yadR1A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(366004)(376002)(346002)(136003)(478600001)(26005)(66574015)(83380400001)(6512007)(36756003)(76116006)(86362001)(66446008)(66556008)(64756008)(2906002)(6486002)(4326008)(66946007)(91956017)(6916009)(66476007)(5660300002)(54906003)(966005)(8936002)(30864003)(8676002)(71200400001)(186003)(6506007)(33656002)(2616005)(316002)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 g7GXuImTdcKUZlkop8Gwb3zYxVHGoP0iKrLbwuxIAmH3FOWD35lwg8mddrrskZLqNsFSRPLz/AVemplPI2Rk3tlymEzFZf3tr62mIkQTTyvTWjckgA65LsPpOS/W1M4xab5nd8eme+HZW21wHoUxctADkz/YjHb1zjh8zojZArSxEPbBu4CcEkiBs7WKBUJ5VYQ727m4N7CAwBOSACewJNmt5A9blJhEZ1kxdvUNH7weJWXSQNJ74ayORztqoBNXHlDQJ19GnYqbe1+GARMh49kACc6L2xUyxo1/ME3Ozr5q0wV6pC7Skqdz3/1KzMn6CUQQmfcMJS+9pjd9qQMAb4KYuwspXoyO8gIPZvnHI/HeoG8q9jPNTcV9kNnqfYkjJ11WgzenVfxC8tr0njxIR/VOGQXF2bielh6a4WUWxH6tY7kJWEcn11fjLw3JN+w4xggGMYcnr2kr6YvWE24Ya75CxDwHLtBDN+Bpi00St6pJmjcymo2WPzq4ifpQJasYg4Cw95tH4Hma2ACtKiuV6Pzpya0XBTjML7ZVT19qhcoNPCMNsgTPH56u5ABV4JeJpkcAMLQ2pK9Kg/nxykXAcJtwqtO0Pfgnr4RR7zwUVlEcHwH4ZQvyj4g65fC59Tnw6paNjwZT90nifjfd4hvBrkha6ps4i+aaV+eDaU+UtZA8aEMoBS9EM960w2VP+Wa98/2Rjf2Tl7i/f6ws7xSqCfZkwAruLzbJq+WTocQ1x0jaTKdAvNpoQMNMqHBjbjIMXMVreae6i0MNLOK8y8vi7rvSwlyp+j97M6mIgOw8K/I85gh1sBFI9NnqjqRqQAFY6vdV2zL2CtKdZ7aechvhur/7JoThQYOPk/sLEJifZU5qDPzg5aX204ECZAwgbeAaTOI3UiRcACR2DBwInLOYXw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <39A058DAB3691D42B6EC3FEE89584A8D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6233
Original-Authentication-Results: zal.aero; dkim=none (message not signed)
 header.d=none;zal.aero; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	37573c1b-67f5-4bc4-c2af-08d88fa4aaa7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AiM6Vg91RUDG635EhHoBxJP1vlANYKVGzpBtUlMZLcoqmg3fGWEKWhl+ancJHuya1wDuKCzkYHvBtbg5aeJ5zHLUlnR2qiT5+QT8dfwNmDzhp092WTKSvIJEUHzVPpgfFPKFap0rt0RDQjaKCVd7ncUICQ8fcxuLUsrn/UpK5g9PJwvLeaGruX2sxzzXGzf3ZlJ1Agod/urtayJ3boAXWaJZndXRLCkekyodmEW5/tAj7J4YF4/0zQO9O7VG8vLGYsvPyXEVp0fB7dO4epS05tJ+tNR6O57aTIe1h34FRPZrIgPFD6D5FlUgXl88TS0zcV4kdWReOEjb3w3DrDENkz0C4Bv4Klr6rRlzYGYk5U/L9toIYBBKskfRDpVaUAQiRiMr0V/E8f/73Shhc8PanZQ22zuO8sQjbTEaSpyr8oBGXfSG5EE5MesNFhXHB1XVpSkP8qVYc9Aa+5DtwwdBrMNXQraCUG3OfjNIsWjbfrk=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(396003)(39860400002)(136003)(346002)(46966005)(478600001)(8936002)(53546011)(36756003)(6486002)(4326008)(36906005)(6512007)(8676002)(316002)(26005)(336012)(6506007)(2906002)(54906003)(2616005)(186003)(6862004)(70206006)(82310400003)(33656002)(966005)(356005)(81166007)(5660300002)(66574015)(83380400001)(47076004)(30864003)(82740400003)(70586007)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 11:41:13.8403
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95ff3ff2-7381-4660-809a-08d88fa4ae96
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4803

SGVsbG8gLA0KDQo+IE9uIDIyIE5vdiAyMDIwLCBhdCAxMDo1NSBwbSwgTGVvIEtydWVnZXIgPGxl
by5rcnVlZ2VyQHphbC5hZXJvPiB3cm90ZToNCj4gDQo+IEhpIEp1bGllbiwNCj4gDQo+IGZpbmFs
bHkgSSBjb3VsZCB0cnkgb3V0IHdoYXQgeW91IHN1Z2dlc3RlZCwgcGxlYXNlIGZpbmQgbXkgYW5z
d2VycyBpbmxpbmUuDQo+IA0KPj4gLS0tLS1VcnNwcsO8bmdsaWNoZSBOYWNocmljaHQtLS0tLQ0K
Pj4gVm9uOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0KPj4gR2VzZW5kZXQ6IE1pdHR3
b2NoLCAxOC4gTm92ZW1iZXIgMjAyMCAxMzoyNA0KPj4gQW46IFN0ZWZhbm8gU3RhYmVsbGluaSA8
c3RlZmFuby5zdGFiZWxsaW5pQHhpbGlueC5jb20+OyBMZW8gS3J1ZWdlcg0KPj4gPGxlby5rcnVl
Z2VyQHphbC5hZXJvPg0KPj4gQ2M6IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPjsgYnJ1Y2Vh
QHhpbGlueC5jb207IENvcm5lbGlhIEJydWVsaGFydA0KPj4gPGNvcm5lbGlhLmJydWVsaGFydEB6
YWwuYWVybz47IG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tOyB4ZW4tDQo+PiBkZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgQmVydHJhbmQuTWFycXVpc0Bhcm0uY29tDQo+PiBCZXRy
ZWZmOiBSZTogQVc6IEFXOiBBVzogQVc6IFhlbiBkYXRhIGZyb20gbWV0YS12aXJ0dWFsaXphdGlv
biBsYXllcg0KPj4gDQo+PiBIaSwNCj4+IA0KPj4gT24gMTcvMTEvMjAyMCAyMzo1MywgU3RlZmFu
byBTdGFiZWxsaW5pIHdyb3RlOg0KPj4+IEFkZGluZyBCZXJ0cmFuZCwgT2xla3NhbmRyLCBKdWxp
ZW4sIGFuZCBvdGhlcnMgLS0gdGhleSBoYXZlIGEgbW9yZQ0KPj4+IHJlY2VudCBleHBlcmllbmNl
IHdpdGggR0lDdjMgSVRTIHRoYW4gbWUgYW5kIG1pZ2h0IGJlIGFibGUgdG8gaGVscC4NCj4+PiBJ
IGFtIGF0dGFjaGluZyB0aGUgZGV2aWNlIHRyZWUgTGVvIHNlbnQgYSBmZXcgZGF5cyBhZ28gZm9y
IHJlZmVyZW5jZS4NCj4+PiANCj4+PiANCj4+PiBUeXBpY2FsbHkgd2hlbiB5b3UgY2FuIHNldCB0
aGUgZXRoZXJuZXQgbGluayB1cCBhbmQgbm8gcGFja2V0cyBhcmUNCj4+PiBleGNoYW5nZWQgaXQg
aXMgYmVjYXVzZSBvZiBhIG1pc3NpbmcgaW50ZXJydXB0LiBJbiB0aGlzIGNhc2UgYSBtaXNzaW5n
DQo+Pj4gTVNJLg0KPj4+IA0KPj4+IEJlcnRyYW5kLCBJIGJlbGlldmUgeW91IHRyaWVkIHRoZSBH
SUMgSVRTIGRyaXZlciB3aXRoIFBDSSBkZXZpY2VzDQo+Pj4gcmVjZW50bHkuIEl0IGlzIGV4cGVj
dGVkIHRvIHdvcmsgY29ycmVjdGx5IHdpdGggTVNJcyBpbiBEb20wLCByaWdodD8NCj4+IA0KPj4g
T1NTVGVzdCBoYXMgc29tZSBoYXJkd2FyZSAoZS5nLiBUaHVuZGVyLVgpIHdoZXJlIElUUyBpcyBy
ZXF1aXJlZCB0byBib290DQo+PiBEb20wLiBJIGhhdmVuJ3Qgc2VlbiBhbnkgZmFpbHVyZSBvbiBy
ZWNlbnQgWGVuLiBXZSBhcmUgdGVzdGluZyA0LjExIGFuZA0KPj4gb253YXJkcyBvbiBUaHVuZGVy
LVguDQo+PiANCj4+IEhvd2V2ZXIsIGl0IG1heSBiZSBwb3NzaWJsZSB0aGF0IHNvbWUgbW9yZSB3
b3JrIGlzIG5lY2Vzc2FyeSBmb3Igb3RoZXINCj4+IGhhcmR3YXJlIChlLmcuIHdvcmthcm91bmQs
IG1pc3NpbmcgY29kZS4uLikuIFNlZSBtb3JlIGJlbG93Lg0KPj4gDQo+Pj4gDQo+Pj4gDQo+Pj4g
DQo+Pj4gT24gVHVlLCAxNyBOb3YgMjAyMCwgTGVvIEtydWVnZXIgd3JvdGU6DQo+Pj4+IEhpLA0K
Pj4+PiANCj4+Pj4gSSBlbmFibGVkIENPTkZJR19IQVNfSVRTICh3aGF0IGEgc3R1cGlkIG1pc3Rh
a2UgYnkgbWUgdG8gbm90IHNldCBpdA0KPj4+PiBiZWZvcmUuLi4pIGJ1dCB0aGVuIGhhZCB0byBh
ZGQgdGhlIGZvbGxvd2luZyBub2RlIHRvIG15IGRldmljZSB0cmVlDQo+Pj4+IA0KPj4+PiAJZ2lj
X2xwaV9iYXNlOiBzeXNjb25AMHg4MDAwMDAwMCB7DQo+Pj4+IAkJY29tcGF0aWJsZSA9ICJnaWMt
bHBpLWJhc2UiOw0KPj4gDQo+PiBJIGNvdWxkbid0IGZpbmQgdGhpcyBjb21wYXRpYmxlIGRlZmlu
ZWQvdXNlZCBpbiBMaW51eCA1LjEwLXJjNC4gQExlbywgY291bGQNCj4+IHlvdSBjbGFyaWZ5IHdo
aWNoIGZsYXZvci92ZXJzaW9uIG9mIExpbnV4IHlvdSBhcmUgdXNpbmc/DQo+IA0KPiBJdCBpcyBM
aW51eCA0LjE5IGZyb20gWW9jdG8gKFdhcnJvciByZWxlYXNlKS4gWEVOIDQuMTMuMi4NCj4gV2hp
bGUgc2VhcmNoaW5nIGFyb3VuZCB0aGUgSW50ZXJuZXQgZm9yIGFueSBzb2x1dGlvbiwgSSBjYW1l
IGFjcm9zcyBbMF0gd2hpY2ggY29udGFpbmVkIHRoZSBnaWMtbHBpLWJhc2Ugbm9kZS4NCj4gU28g
SSBqdXN0IHRyaWVkIGFkZGluZyBpdCAocXVpdGUgZGVzcGVyYXRlIEkga25vdykgYW5kIHZvaWxh
LCBpdCBhdCBsZWFzdCBicm91Z2h0IG1lIG9uZSBzdGVwIGZ1cnRoZXIgKFhFTiBleHBvc2luZyB0
aGUgSVRTKS4uLg0KPiANCj4+IA0KPj4+PiAJCXJlZyA9IDwweDAgMHg4MDAwMDAwMCAweDAgMHgx
MDAwMDA+Ow0KPj4+PiAJCW1heC1naWMtcmVkaXN0cmlidXRvcnMgPSA8Mj47DQo+Pj4+IAl9Ow0K
Pj4+PiANCj4+Pj4gdG8gc29tZWhvdyBjaGFuZ2Ugc29tZXRoaW5nIGluIHJlZ2FyZCB0byB0aGUg
SVRTIGFuZCBNU0kvTVNJLVgNCj4+Pj4gDQo+Pj4+IChYRU4pIEdJQ3YzIGluaXRpYWxpemF0aW9u
Og0KPj4+PiAoWEVOKSAgICAgICBnaWNfZGlzdF9hZGRyPTB4MDAwMDAwMDYwMDAwMDANCj4+Pj4g
KFhFTikgICAgICAgZ2ljX21haW50ZW5hbmNlX2lycT0yNQ0KPj4+PiAoWEVOKSAgICAgICBnaWNf
cmRpc3Rfc3RyaWRlPTANCj4+Pj4gKFhFTikgICAgICAgZ2ljX3JkaXN0X3JlZ2lvbnM9MQ0KPj4+
PiAoWEVOKSAgICAgICByZWRpc3RyaWJ1dG9yIHJlZ2lvbnM6DQo+Pj4+IChYRU4pICAgICAgICAg
LSByZWdpb24gMDogMHgwMDAwMDAwNjA0MDAwMCAtIDB4MDAwMDAwMDYwODAwMDANCj4+Pj4gKFhF
TikgR0lDdjM6IHVzaW5nIGF0IG1vc3QgNTczNDQgTFBJcyBvbiB0aGUgaG9zdC4NCj4+Pj4gKFhF
TikgR0lDdjM6IDI4OCBsaW5lcywgKElJRCAwMDAxMTQzYikuDQo+Pj4+IChYRU4pIEdJQ3YzOiBG
b3VuZCBJVFMgQDB4NjAyMDAwMA0KPj4+PiAoWEVOKSB1c2luZyBub24tY2FjaGVhYmxlIElUUyBj
b21tYW5kIHF1ZXVlDQo+Pj4+IChYRU4pIEdJQ3YzOiBDUFUwOiBGb3VuZCByZWRpc3RyaWJ1dG9y
IGluIHJlZ2lvbiAwIEAwMDAwMDAwMDQwMDFjMDAwDQo+Pj4+IA0KPj4+PiBbICAgIDAuMDAwMDAw
XSBHSUN2MzogRGlzdHJpYnV0b3IgaGFzIG5vIFJhbmdlIFNlbGVjdG9yIHN1cHBvcnQNCj4+Pj4g
WyAgICAwLjAwMDAwMF0gR0lDdjM6IG5vIFZMUEkgc3VwcG9ydCwgbm8gZGlyZWN0IExQSSBzdXBw
b3J0DQo+Pj4+IFsgICAgMC4wMDAwMDBdIElUUyBbbWVtIDB4MDYwMjAwMDAtMHgwNjAzZmZmZl0N
Cj4+Pj4gWyAgICAwLjAwMDAwMF0gSVRTQDB4MDAwMDAwMDAwNjAyMDAwMDogYWxsb2NhdGVkIDY1
NTM2IERldmljZXMNCj4+IEBkYzg4MDAwMCAoZmxhdCwgZXN6IDgsIHBzeiA2NEssIHNociAxKQ0K
Pj4+PiBbICAgIDAuMDAwMDAwXSBJVFNAMHgwMDAwMDAwMDA2MDIwMDAwOiBhbGxvY2F0ZWQgMzI3
NjggSW50ZXJydXB0DQo+PiBDb2xsZWN0aW9ucyBAZGM4MjAwMDAgKGZsYXQsIGVzeiAyLCBwc3og
NjRLLCBzaHIgMSkNCj4+Pj4gWyAgICAwLjAwMDAwMF0gR0lDOiB1c2luZyBMUEkgcHJvcGVydHkg
dGFibGUgQDB4MDAwMDAwMDBkYzgzMDAwMA0KPj4+PiBbICAgIDAuMDAwMDAwXSBHSUN2MzogQ1BV
MDogZm91bmQgcmVkaXN0cmlidXRvciAwIHJlZ2lvbg0KPj4gMDoweDAwMDAwMDAwMDYwNDAwMDAN
Cj4+Pj4gWyAgICAwLjAwMDAwMF0gQ1BVMDogdXNpbmcgTFBJIHBlbmRpbmcgdGFibGUgQDB4MDAw
MDAwMDBkYzg0MDAwMA0KPj4+PiAuLi4NCj4+Pj4gWyAgICAwLjA0MDA4MF0gUGxhdGZvcm0gTVNJ
OiBnaWMtaXRzIGRvbWFpbiBjcmVhdGVkDQo+Pj4+IFsgICAgMC4wNDAxMzZdIFBDSS9NU0k6IC9p
bnRlcnJ1cHQtY29udHJvbGxlci9naWMtaXRzIGRvbWFpbiBjcmVhdGVkDQo+Pj4+IFsgICAgMC4w
NDAxODFdIGZzbC1tYyBNU0k6IC9pbnRlcnJ1cHQtY29udHJvbGxlci9naWMtaXRzIGRvbWFpbiBj
cmVhdGVkDQo+Pj4+IA0KPj4+PiANCj4+Pj4gU3RpbGwgSSBhbSBlbmRpbmcgdXAgd2l0aCB0aGUg
IiBGYWlsZWQgdG8gYWRkIC0gcGFzc3Rocm91Z2ggb3IgTVNJL01TSS1YDQo+PiBtaWdodCBmYWls
ISIgbG9nIG1lc3NhZ2VzIGZvciBzb21lIFBDSSBkZXZpY2VzLCBidXQgYXQgbGVhc3QgdGhlIG9u
LWJvYXJkDQo+PiBldGhlcm5ldCBwb3J0cyAoZnNsX2VuZXRjICkgYXJlIGluaXRpYWxpemVkLg0K
Pj4+PiBJIGNhbiBzZXQgdGhlIGxpbmsgdXAgYW5kIGEgbGluayBpcyBzdWNjZXNzZnVsbHkgZXN0
YWJsaXNoZWQuDQo+PiANCj4+IFRoaXMgbWVzc2FnZSBpcyBub3JtYWwuIFhlbiBvbiBBcm0gaXMg
bm90IHlldCBhd2FyZSBvZiBQQ0kgZGV2aWNlcyBhbmQNCj4+IHRoZXJlZm9yZSB0aGUgaHlwZXJj
YWxscyB0byBhZGQgUENJIGRldmljZXMgd2lsbCByZXR1cm4gLUVPUE5PVFNVUFAuDQo+PiANCj4+
IEhvd2V2ZXIsIHRoaXMgaXMgbm90IGFuIGlzc3VlIGJlY2F1c2UgdGhlIHZpcnR1YWwgSVRTIGlt
cGxlbWVudGF0aW9uIHdpbGwNCj4+IGFsbG93IGRvbTAgdG8gY29uZmlndXJlIGFueSBkZXZpY2Vz
Lg0KPj4gDQo+Pj4+IA0KPj4+PiBCdXQgKCEpIEkgY2Fubm90IHJlY2VpdmUgb3IgdHJhbnNtaXQg
YW55dGhpbmcgKG5vIGVycm9yIG1lc3NhZ2UuLi4pIGFuZA0KPj4gdGhlcmUgc2VlbSB0byBiZSBu
byBpbnRlcnJ1cHRzOg0KPj4+PiANCj4+Pj4gMjk6ICAgICAgICAgIDAgICBJVFMtTVNJICAgMSBF
ZGdlICAgICAgZ2JlMC1yeHR4MA0KPj4+PiAgMzI6ICAgICAgICAgIDAgICBJVFMtTVNJIDgxOTIg
RWRnZSAgICAgIHB0cF9xb3JpcQ0KPj4+PiANCj4+Pj4gKGZyb20gL3Byb2MvaW50ZXJydXB0cyku
DQo+Pj4+IA0KPj4+PiBBbnkgaWRlYSBvbiB0aGlzIG9uZT8gSSBrZWVwIGRpZ2dpbmcgYW5kIGNo
ZWNraW5nIHdoZXRoZXIgbXkgZGV2aWNlIHRyZWUNCj4+IG5lZWRzIHNvbWUgYWRkaXRpb25hbCBm
aXhlcy4NCj4+IA0KPj4gQ2FuIHlvdSBhcHBseSBwYXRjaCBbMV0gYW5kIHByb3ZpZGUgdGhlIGxv
Z3M/IFRoaXMgd2lsbCBkdW1wIG1vcmUNCj4+IGluZm9ybWF0aW9uIGFib3V0IHRoZSBjb21tYW5k
IHJlY2VpdmVkIGJ5IHRoZSB2SVRTIGFuZCB0aGUgb25lIHNlbmQgdG8NCj4+IHRoZSBob3N0IElU
Uy4NCj4gDQo+IEZvciBYRU4gNC4xMy4yIEkgaGFkIHRvIGFkYXB0IHlvdXIgcGF0Y2ggc2xpZ2h0
bHkgWzFdLCBzZWUgYmVsb3cgKHllcyBJIGtub3csIHF1aXRlIHVnbHkgaW4gcGFydHMpLg0KPiBG
aW5kIGF0dGFjaGVkIHRoZSBib290IGxvZyBhbmQgYW4gb3V0cHV0IG9mICJ4bCBkbWVzZyIgd2hp
Y2ggaXMgdHJ1bmNhdGVkIGR1ZSB0byB0aGUgbGFyZ2UgYW1vdW50IG9mIG1lc3NhZ2VzLg0KPiAN
Cj4gV2hlbiBlbmFibGluZyB0aGUgbmV0d29yayBpbnRlcmZhY2UgKGdiZTApLCB0aGUgZm9sbG93
aW5nIG91dHB1dCBpcyB2aXNpYmxlOg0KPiANCj4gcm9vdEBrb250cm9uLXNhbDI4On4jIGlwIGxp
bmsgc2V0IHVwIGRldiBnYmUwDQo+IChYRU4pIHZnaWMtdjMtaXRzLmM6OTAyOmQwdjAgdklUUyAg
Y21kIDB4MGM6IDAwMDAwMDE3MDAwMDAwMGMgMDAwMDAwMDAwMDAwMDAwMSAwMDAwMDAwMDAwMDAw
MDAwIDAwMDAwMDAwMDAwMDAwMDANCj4gKFhFTikgdmdpYy12My1pdHMuYzo5MDI6ZDB2MCB2SVRT
ICBjbWQgMHgwNTogMDAwMDAwMDAwMDAwMDAwNSAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAw
MDAwMDAgMDAwMDAwMDAwMDAwMDAwMA0KPiBbICAgMzQuMDM0NTk4XSBBdGhlcm9zIDgwMzEgZXRo
ZXJuZXQgMDAwMDowMDowMC4zOjA1OiBhdHRhY2hlZCBQSFkgZHJpdmVyIFtBdGhlcm9zIDgwMzEg
ZXRoZXJuZXRdIChtaWlfYnVzOnBoeV9hZGRyPTAwMDA6MDA6MDAuMzowNSwgaXJxPVBPTEwpDQo+
IFsgICAzNC4wNDExMTFdIDgwMjFxOiBhZGRpbmcgVkxBTiAwIHRvIEhXIGZpbHRlciBvbiBkZXZp
Y2UgZ2JlMA0KPiBbICAgMzQuMDQxMjA5XSBJUHY2OiBBRERSQ09ORihORVRERVZfVVApOiBnYmUw
OiBsaW5rIGlzIG5vdCByZWFkeQ0KPiByb290QGtvbnRyb24tc2FsMjg6fiMgWyAgIDM1LjA0MTk1
MV0gZnNsX2VuZXRjIDAwMDA6MDA6MDAuMCBnYmUwOiBMaW5rIGlzIERvd24NCj4gWyAgIDM4LjEx
NDQyNl0gZnNsX2VuZXRjIDAwMDA6MDA6MDAuMCBnYmUwOiBMaW5rIGlzIFVwIC0gMUdicHMvRnVs
bCAtIGZsb3cgY29udHJvbCBvZmYNCj4gWyAgIDM4LjExNDUwOF0gSVB2NjogQUREUkNPTkYoTkVU
REVWX0NIQU5HRSk6IGdiZTA6IGxpbmsgYmVjb21lcyByZWFkeQ0KPiANCj4gRG9lcyB0aGF0IHRl
bGwgeW91IGFueXRoaW5nPw0KPiANCg0KSSBqdXN0IGNoZWNrZWQgdGhlIGxvZ3Mgc2hhcmVkLCB3
aGF0IEkgZm91bmQgb3V0IHRoYXQgdGhlcmXigJlzIGlzIGFuIGVycm9yIHdoaWxlIGJvb3Rpbmcg
dG8gY29uZmlndXJlIHRoZSBNU0kgZm9yIHRoZSBQQ0kgZGV2aWNlIGJlY2F1c2Ugb2YgdGhhdCB0
aGVyZSB3aWxsIGJlIGNhc2UgdGhhdCBEZXZpY2UgSWQgZ2VuZXJhdGUgb3V0LW9mLWJhbmQgaXMg
bm90IG1hcHBlZCBjb3JyZWN0bHkgdG8gSVRTIGRldmljZSB0YWJsZSBjcmVhdGVkIHdoaWxlIGlu
aXRpYWxpc2luZyB0aGUgTVNJIGZvciB0aGUgZGV2aWNlLiANCkkgbWlnaHQgYmUgd3JvbmcgbGV0
IHNvbWVvbmUgZWxzZSBhbHNvIGNvbW1lbnRzIG9uIHRoaXMuIA0KDQogDQpbICAgIDAuMTczOTY0
XSBPRjogL3NvYy9wY2llQDFmMDAwMDAwMDogSW52YWxpZCBtc2ktbWFwIHRyYW5zbGF0aW9uIC0g
bm8gbWF0Y2ggZm9yIHJpZCAweGY4IG9uICAgICAgICAgICAobnVsbCkNCiANClJlZ2FyZHMsDQpS
YWh1bA0KDQo+PiANCj4+IE5vdGUgdGhhdCBYZW4gd2lsbCBuZWVkIHRvIGJlIGJ1aWxkIHdpdGgg
Q09ORklHX0RFQlVHPXkgaW4gb3JkZXIgdG8gZ2V0DQo+PiBzb21lIG9mIHRoZSBtZXNzYWdlcy4N
Cj4+IA0KPj4gWy4uLl0NCj4+IA0KPj4+Pj4+IFsgICAgMC4wMDAwMDBdIEdJQ3YzOiBEaXN0cmli
dXRvciBoYXMgbm8gUmFuZ2UgU2VsZWN0b3Igc3VwcG9ydA0KPj4+Pj4+IA0KPj4+Pj4+IFsgICAg
MC4wMDAwMDBdIEdJQ3YzOiBubyBWTFBJIHN1cHBvcnQsIG5vIGRpcmVjdCBMUEkgc3VwcG9ydA0K
Pj4+Pj4+IA0KPj4+Pj4+IFsgICAgMC4wMDAwMDBdIEdJQ3YzOiBDUFUwOiBmb3VuZCByZWRpc3Ry
aWJ1dG9yIDAgcmVnaW9uDQo+Pj4+Pj4gMDoweDAwMDAwMDAwMDYwNDAwMDANCj4+Pj4+IA0KPj4+
Pj4gIm5vIFZMUEkgc3VwcG9ydCIgaXMgdmVyeSBzdXNwaWNpb3VzLCBpdCBsb29rcyBsaWtlIERv
bTAgZG9lc24ndA0KPj4+Pj4gZmluZCBhbnkgSVRTIHN1cHBvcnQuDQo+PiBWTFBJIGlzIGEgZmVh
dHVyZSB0aGF0IHdhcyBpbnRyb2R1Y2VkIGluIEdJQ3Y0IHRvIGRpcmVjdGx5IGluamVjdCBMUEkg
aW4gdGhlDQo+PiBndWVzdC4gU28gdGhpcyBpcyBub3JtYWwgdG8gc2VlIHRoaXMgbWVzc2FnZSB3
aGVuIHJ1bm5pbmcgb24gWGVuIGJlY2F1c2UNCj4+IHdlIGFyZSBnb2luZyB0byBvbmx5IGV4cG9z
ZSBhIEdJQ3YzIHRvIGEgZG9tYWluIHVudGlsIGF0IGxlYXN0IHdlIHN1cHBvcnQNCj4+IG5lc3Rl
ZCB2aXJ0Lg0KPj4gDQo+PiBIb3dldmVyLCB5b3Ugd2VyZSByaWdodCBhYm91dCB0aGF0IFhlbiBk
aWRuJ3QgZXhwb3NlIHRoZSBJVFMgYmVjYXVzZSB0aGUNCj4+IGZvbGxvd2luZyBsaW5lcyB3ZXJl
IG1pc3Npbmc6DQo+PiANCj4+IFsgICAgMC4wMDAwMDBdIElUU0AweDAwMDAwMDAwMDYwMjAwMDA6
IGFsbG9jYXRlZCA2NTUzNiBEZXZpY2VzIEBkYzg4MDAwMA0KPj4gKGZsYXQsIGVzeiA4LCBwc3og
NjRLLCBzaHIgMSkNCj4+IA0KPj4gQ2hlZXJzLA0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBMZW8N
Cj4gDQo+PiANCj4+IFsxXQ0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9naWMtdjMtaXRz
LmMgYi94ZW4vYXJjaC9hcm0vZ2ljLXYzLWl0cy5jIGluZGV4DQo+PiA5NTU4YmFkOTZhYzMuLjhh
MGEwMjMwOGU3NCAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9naWMtdjMtaXRzLmMNCj4+
ICsrKyBiL3hlbi9hcmNoL2FybS9naWMtdjMtaXRzLmMNCj4+IEBAIC04Nyw2ICs4NywxMCBAQCBz
dGF0aWMgaW50IGl0c19zZW5kX2NvbW1hbmQoc3RydWN0IGhvc3RfaXRzICpod19pdHMsDQo+PiBj
b25zdCB2b2lkICppdHNfY21kKQ0KPj4gICAgICAvKiBObyBJVFMgY29tbWFuZHMgZnJvbSBhbiBp
bnRlcnJ1cHQgaGFuZGxlciAoYXQgdGhlIG1vbWVudCkuICovDQo+PiAgICAgIEFTU0VSVCghaW5f
aXJxKCkpOw0KPj4gDQo+PiArICAgIHByaW50ayhYRU5MT0dfV0FSTklORywgInBJVFMgIGNtZCAw
eCUwMmx4OiAlMDE2bHggJTAxNmx4ICUwMTZseA0KPj4gJTAxNmx4XG4iLA0KPj4gKyAgICAgICAg
ICAgaXRzX2NtZF9nZXRfY29tbWFuZChjb21tYW5kKSwNCj4+ICsgICAgICAgICAgIGNvbW1hbmRb
MF0sIGNvbW1hbmRbMV0sIGNvbW1hbmRbMl0sIGNvbW1hbmRbM10pOw0KPj4gKw0KPj4gICAgICBz
cGluX2xvY2soJmh3X2l0cy0+Y21kX2xvY2spOw0KPj4gDQo+PiAgICAgIGRvIHsNCj4+IGRpZmYg
LS1naXQgYS94ZW4vYXJjaC9hcm0vZ2ljLXYzLWxwaS5jIGIveGVuL2FyY2gvYXJtL2dpYy12My1s
cGkuYyBpbmRleA0KPj4gODY5YmM5N2ZhMWFhLi5lN2M1YmNkOGQ0MjMgMTAwNjQ0DQo+PiAtLS0g
YS94ZW4vYXJjaC9hcm0vZ2ljLXYzLWxwaS5jDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vZ2ljLXYz
LWxwaS5jDQo+PiBAQCAtMTgzLDcgKzE4MywxMCBAQCB2b2lkIGdpY3YzX2RvX0xQSSh1bnNpZ25l
ZCBpbnQgbHBpKQ0KPj4gICAgICAvKiBGaW5kIG91dCBpZiBhIGd1ZXN0IG1hcHBlZCBzb21ldGhp
bmcgdG8gdGhpcyBwaHlzaWNhbCBMUEkuICovDQo+PiAgICAgIGhscGlwID0gZ2ljX2dldF9ob3N0
X2xwaShscGkpOw0KPj4gICAgICBpZiAoICFobHBpcCApDQo+PiArICAgIHsNCj4+ICsgICAgICAg
IHByaW50aygiJXM6IFJlY2VpdmVkIExQSSAldSBidXQgaXQgaXMgbm90IG1hcHBlZD9cbiIsIF9f
ZnVuY19fLA0KPj4gbHBpKTsNCj4+ICAgICAgICAgIGdvdG8gb3V0Ow0KPj4gKyAgICB9DQo+PiAN
Cj4+ICAgICAgaGxwaS5kYXRhID0gcmVhZF91NjRfYXRvbWljKCZobHBpcC0+ZGF0YSk7DQo+PiAN
Cj4+IEBAIC0yMjIsNiArMjI1LDkgQEAgdm9pZCBnaWN2M19scGlfdXBkYXRlX2hvc3RfZW50cnko
dWludDMyX3QgaG9zdF9scGksDQo+PiBpbnQgZG9tYWluX2lkLA0KPj4gIHsNCj4+ICAgICAgdW5p
b24gaG9zdF9scGkgKmhscGlwLCBobHBpOw0KPj4gDQo+PiArICAgIHByaW50aygiJXM6IGhvc3Rf
bHBpICV1IGRvbWFpbiAlZCB2aXJxX2xwaSAldVxuIiwNCj4+ICsgICAgICAgICAgIF9fZnVuY19f
LCBob3N0X2xwaSwgZG9tYWluX2lkLCB2aXJxX2xwaSk7DQo+PiArDQo+PiAgICAgIEFTU0VSVCho
b3N0X2xwaSA+PSBMUElfT0ZGU0VUKTsNCj4+IA0KPj4gICAgICBob3N0X2xwaSAtPSBMUElfT0ZG
U0VUOw0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS92Z2ljLXYzLWl0cy5jIGIveGVuL2Fy
Y2gvYXJtL3ZnaWMtdjMtaXRzLmMgaW5kZXgNCj4+IDU4ZDkzOWI4NWY5Mi4uODllZjEzN2IzZTZi
IDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL3ZnaWMtdjMtaXRzLmMNCj4+ICsrKyBiL3hl
bi9hcmNoL2FybS92Z2ljLXYzLWl0cy5jDQo+PiBAQCAtODk3LDcgKzg5Nyw3IEBAIG91dF91bmxv
Y2s6DQo+PiANCj4+ICBzdGF0aWMgdm9pZCBkdW1wX2l0c19jb21tYW5kKHVpbnQ2NF90ICpjb21t
YW5kKQ0KPj4gIHsNCj4+IC0gICAgZ2RwcmludGsoWEVOTE9HX1dBUk5JTkcsICIgIGNtZCAweCUw
Mmx4OiAlMDE2bHggJTAxNmx4ICUwMTZseA0KPj4gJTAxNmx4XG4iLA0KPj4gKyAgICBnZHByaW50
ayhYRU5MT0dfV0FSTklORywgInZJVFMgIGNtZCAweCUwMmx4OiAlMDE2bHggJTAxNmx4ICUwMTZs
eA0KPj4gJTAxNmx4XG4iLA0KPj4gICAgICAgICAgICAgICBpdHNfY21kX2dldF9jb21tYW5kKGNv
bW1hbmQpLA0KPj4gICAgICAgICAgICAgICBjb21tYW5kWzBdLCBjb21tYW5kWzFdLCBjb21tYW5k
WzJdLCBjb21tYW5kWzNdKTsNCj4+ICB9DQo+PiBAQCAtOTI2LDYgKzkyNiw4IEBAIHN0YXRpYyBp
bnQgdmdpY19pdHNfaGFuZGxlX2NtZHMoc3RydWN0IGRvbWFpbiAqZCwNCj4+IHN0cnVjdCB2aXJ0
X2l0cyAqaXRzKQ0KPj4gICAgICAgICAgaWYgKCByZXQgKQ0KPj4gICAgICAgICAgICAgIHJldHVy
biByZXQ7DQo+PiANCj4+ICsgICAgICAgIGR1bXBfaXRzX2NvbW1hbmQoY29tbWFuZCk7DQo+PiAr
DQo+PiAgICAgICAgICBzd2l0Y2ggKCBpdHNfY21kX2dldF9jb21tYW5kKGNvbW1hbmQpICkNCj4+
ICAgICAgICAgIHsNCj4+ICAgICAgICAgIGNhc2UgR0lUU19DTURfQ0xFQVI6DQo+PiANCj4+IA0K
Pj4gLS0NCj4+IEp1bGllbiBHcmFsbA0KPiANCj4gWzBdIGh0dHBzOi8vd3d3Lm1haWwtYXJjaGl2
ZS5jb20vdS1ib290QGxpc3RzLmRlbnguZGUvbXNnMzc5NzA4Lmh0bWwNCj4gWzFdIA0KPiBkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL2dpYy12My1pdHMuYyBiL3hlbi9hcmNoL2FybS9naWMtdjMt
aXRzLmMNCj4gaW5kZXggOTU1OGJhZDk2YS4uZDE3NWJhNTJiMCAxMDA2NDQNCj4gLS0tIGEveGVu
L2FyY2gvYXJtL2dpYy12My1pdHMuYw0KPiArKysgYi94ZW4vYXJjaC9hcm0vZ2ljLXYzLWl0cy5j
DQo+IEBAIC04Nyw2ICs4NywxMCBAQCBzdGF0aWMgaW50IGl0c19zZW5kX2NvbW1hbmQoc3RydWN0
IGhvc3RfaXRzICpod19pdHMsIGNvbnN0IHZvaWQgKml0c19jbWQpDQo+ICAgICAvKiBObyBJVFMg
Y29tbWFuZHMgZnJvbSBhbiBpbnRlcnJ1cHQgaGFuZGxlciAoYXQgdGhlIG1vbWVudCkuICovDQo+
ICAgICBBU1NFUlQoIWluX2lycSgpKTsNCj4gDQo+ICsgICAgcHJpbnRrKFhFTkxPR19XQVJOSU5H
ICJwSVRTICBjbWQgMHglMDJseDogJTAxNmx4ICUwMTZseCAlMDE2bHggJTAxNmx4XG4iLA0KPiAr
ICAgICAgICAoKCh1aW50NjRfdCAqKSBpdHNfY21kKVswXSA+PiAwKSAmIEdFTk1BU0soOCAtIDEs
IDApLA0KPiArICAgICAgICAoKHVpbnQ2NF90ICopIGl0c19jbWQpWzBdLCAoKHVpbnQ2NF90ICop
IGl0c19jbWQpWzFdLCAoKHVpbnQ2NF90ICopIGl0c19jbWQpWzJdLCAoKHVpbnQ2NF90ICopIGl0
c19jbWQpWzNdKTsNCj4gKw0KPiAgICAgc3Bpbl9sb2NrKCZod19pdHMtPmNtZF9sb2NrKTsNCj4g
DQo+ICAgICBkbyB7DQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZ2ljLXYzLWxwaS5jIGIv
eGVuL2FyY2gvYXJtL2dpYy12My1scGkuYw0KPiBpbmRleCA3OGI5NTIxYjIxLi4yYzNiMGZjOWU1
IDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC9hcm0vZ2ljLXYzLWxwaS5jDQo+ICsrKyBiL3hlbi9h
cmNoL2FybS9naWMtdjMtbHBpLmMNCj4gQEAgLTE4MSw4ICsxODEsMTAgQEAgdm9pZCBnaWN2M19k
b19MUEkodW5zaWduZWQgaW50IGxwaSkNCj4gDQo+ICAgICAvKiBGaW5kIG91dCBpZiBhIGd1ZXN0
IG1hcHBlZCBzb21ldGhpbmcgdG8gdGhpcyBwaHlzaWNhbCBMUEkuICovDQo+ICAgICBobHBpcCA9
IGdpY19nZXRfaG9zdF9scGkobHBpKTsNCj4gLSAgICBpZiAoICFobHBpcCApDQo+ICsgICAgaWYg
KCAhaGxwaXAgKSB7DQo+ICsgICAgICAgIHByaW50aygiJXM6IFJlY2VpdmVkIExQSSAldSBidXQg
aXQgaXMgbm90IG1hcHBlZD9cbiIsIF9fZnVuY19fLCBscGkpOw0KPiAgICAgICAgIGdvdG8gb3V0
Ow0KPiArICAgIH0NCj4gDQo+ICAgICBobHBpLmRhdGEgPSByZWFkX3U2NF9hdG9taWMoJmhscGlw
LT5kYXRhKTsNCj4gDQo+IEBAIC0yMjEsNiArMjIzLDkgQEAgdm9pZCBnaWN2M19scGlfdXBkYXRl
X2hvc3RfZW50cnkodWludDMyX3QgaG9zdF9scGksIGludCBkb21haW5faWQsDQo+IHsNCj4gICAg
IHVuaW9uIGhvc3RfbHBpICpobHBpcCwgaGxwaTsNCj4gDQo+ICsgICAgcHJpbnRrKCIlczogaG9z
dF9scGkgJXUgZG9tYWluICVkIHZpcnRfbHBpICV1XG4iLA0KPiArICAgICAgICBfX2Z1bmNfXywg
aG9zdF9scGksIGRvbWFpbl9pZCwgdmlydF9scGkpOw0KPiArDQo+ICAgICBBU1NFUlQoaG9zdF9s
cGkgPj0gTFBJX09GRlNFVCk7DQo+IA0KPiAgICAgaG9zdF9scGkgLT0gTFBJX09GRlNFVDsNCj4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS92Z2ljLXYzLWl0cy5jIGIveGVuL2FyY2gvYXJtL3Zn
aWMtdjMtaXRzLmMNCj4gaW5kZXggNmUxNTNjNjk4ZC4uZGQ1MDgxZWY4MCAxMDA2NDQNCj4gLS0t
IGEveGVuL2FyY2gvYXJtL3ZnaWMtdjMtaXRzLmMNCj4gKysrIGIveGVuL2FyY2gvYXJtL3ZnaWMt
djMtaXRzLmMNCj4gQEAgLTg5Nyw3ICs4OTcsNyBAQCBvdXRfdW5sb2NrOg0KPiANCj4gc3RhdGlj
IHZvaWQgZHVtcF9pdHNfY29tbWFuZCh1aW50NjRfdCAqY29tbWFuZCkNCj4gew0KPiAtICAgIGdk
cHJpbnRrKFhFTkxPR19XQVJOSU5HLCAiICBjbWQgMHglMDJseDogJTAxNmx4ICUwMTZseCAlMDE2
bHggJTAxNmx4XG4iLA0KPiArICAgIGdkcHJpbnRrKFhFTkxPR19XQVJOSU5HLCAidklUUyAgY21k
IDB4JTAybHg6ICUwMTZseCAlMDE2bHggJTAxNmx4ICUwMTZseFxuIiwNCj4gICAgICAgICAgICAg
IGl0c19jbWRfZ2V0X2NvbW1hbmQoY29tbWFuZCksDQo+ICAgICAgICAgICAgICBjb21tYW5kWzBd
LCBjb21tYW5kWzFdLCBjb21tYW5kWzJdLCBjb21tYW5kWzNdKTsNCj4gfQ0KPiBAQCAtOTI2LDYg
KzkyNiw4IEBAIHN0YXRpYyBpbnQgdmdpY19pdHNfaGFuZGxlX2NtZHMoc3RydWN0IGRvbWFpbiAq
ZCwgc3RydWN0IHZpcnRfaXRzICppdHMpDQo+ICAgICAgICAgaWYgKCByZXQgKQ0KPiAgICAgICAg
ICAgICByZXR1cm4gcmV0Ow0KPiANCj4gKyAgICAgICAgZHVtcF9pdHNfY29tbWFuZChjb21tYW5k
KTsNCj4gKw0KPiAgICAgICAgIHN3aXRjaCAoIGl0c19jbWRfZ2V0X2NvbW1hbmQoY29tbWFuZCkg
KQ0KPiAgICAgICAgIHsNCj4gICAgICAgICBjYXNlIEdJVFNfQ01EX0NMRUFSOg0KPiA8Ym9vdC14
ZW5kZWJ1Zy5sb2c+PHhlbi1kZWJ1Zy1vdXRwdXQudHh0Pg0KDQo=

