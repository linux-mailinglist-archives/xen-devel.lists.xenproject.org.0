Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C557281011
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 11:47:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1770.5434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOHeI-0007kE-BK; Fri, 02 Oct 2020 09:46:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1770.5434; Fri, 02 Oct 2020 09:46:46 +0000
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
	id 1kOHeI-0007jp-7u; Fri, 02 Oct 2020 09:46:46 +0000
Received: by outflank-mailman (input) for mailman id 1770;
 Fri, 02 Oct 2020 09:46:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3+am=DJ=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kOHeH-0007jk-6G
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 09:46:45 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1a::620])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5037ee84-d2de-4787-9996-c3c74ecb5f07;
 Fri, 02 Oct 2020 09:46:43 +0000 (UTC)
Received: from AM5PR0101CA0012.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::25) by AM4PR0802MB2162.eurprd08.prod.outlook.com
 (2603:10a6:200:5c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35; Fri, 2 Oct
 2020 09:46:41 +0000
Received: from VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:16:cafe::bc) by AM5PR0101CA0012.outlook.office365.com
 (2603:10a6:206:16::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38 via Frontend
 Transport; Fri, 2 Oct 2020 09:46:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT043.mail.protection.outlook.com (10.152.19.122) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Fri, 2 Oct 2020 09:46:40 +0000
Received: ("Tessian outbound 195a290eb161:v64");
 Fri, 02 Oct 2020 09:46:40 +0000
Received: from 02b574daa939.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 82E596E6-9C02-45E1-AB2E-3A0B763E1DFD.1; 
 Fri, 02 Oct 2020 09:46:02 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 02b574daa939.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 02 Oct 2020 09:46:02 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBAPR08MB5845.eurprd08.prod.outlook.com (2603:10a6:10:1a5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Fri, 2 Oct
 2020 09:46:00 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e%6]) with mapi id 15.20.3412.029; Fri, 2 Oct 2020
 09:46:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3+am=DJ=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kOHeH-0007jk-6G
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 09:46:45 +0000
X-Inumbo-ID: 5037ee84-d2de-4787-9996-c3c74ecb5f07
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown [2a01:111:f400:7e1a::620])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 5037ee84-d2de-4787-9996-c3c74ecb5f07;
	Fri, 02 Oct 2020 09:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8dNGoh+tApqUm8hZhKiDUFKe0zCuPtvL8QZGDsOurl8=;
 b=p4t2j5g8tswN0bJ5IqzyTz3XNnyt9ZwevRTa6Mh1YB3qie1yRqovXpZ11FvfscJ5jRyxve5N9L/y2DJvlLwCwD2rPCJtcTfAMQNBhGrdBASZaq4SsuQ7Dyec9haaONEO8db3a6NN+Z6zstrukkLtXFmdysXcO0LKsJYzwufU7DI=
Received: from AM5PR0101CA0012.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::25) by AM4PR0802MB2162.eurprd08.prod.outlook.com
 (2603:10a6:200:5c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35; Fri, 2 Oct
 2020 09:46:41 +0000
Received: from VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:16:cafe::bc) by AM5PR0101CA0012.outlook.office365.com
 (2603:10a6:206:16::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38 via Frontend
 Transport; Fri, 2 Oct 2020 09:46:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT043.mail.protection.outlook.com (10.152.19.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Fri, 2 Oct 2020 09:46:40 +0000
Received: ("Tessian outbound 195a290eb161:v64"); Fri, 02 Oct 2020 09:46:40 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0eab010db4de8e86
X-CR-MTA-TID: 64aa7808
Received: from 02b574daa939.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 82E596E6-9C02-45E1-AB2E-3A0B763E1DFD.1;
	Fri, 02 Oct 2020 09:46:02 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 02b574daa939.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 02 Oct 2020 09:46:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CDnuQsdEuRlFypqwBxCO5T6pPlvQBByFzKsn6FjW6qybMRNGnF6ysd67svi4g0asux20k7yBfvDKL/AdLAkC78dxzbOB9c2l5KXUIP5s4ppovM9uZ7FY9qd9bUZ+14KfkO7wgILldXSIQxK8m73PFlqZqZgBKm8cF24geWrIS9RolAfO15DFhUvJSDfIAa4m+4nb7dzAD3l2CH1beuVGpfHOUnX/+LgyZtcXiabwU+7LYwvIa9Lz+2pU4LRw6MQdMaIyX+Gr6opSSVWR2tBCapxBdbSLVDWmZqWX5SRQLtPvJNcXP7teVb0na9fbdOBniDaLVisecCxTL+0MPNjoPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8dNGoh+tApqUm8hZhKiDUFKe0zCuPtvL8QZGDsOurl8=;
 b=RVXlfCFMD/1zgVSQkUGJE529hP3g/NZ5bBUrgKn1u+bRhZYdTh/y1uzAShFu5db6KXYzNjUAEVA3URHNSfkLrOXpKGChaU8WjkQ1JA8qY2r6L22HB/OMk9nZDYa9+9+Dk7Q2Q9saVvJnlKKP3UIYQ58RZ5h/chqxt1zY8phuZ686DvqBRDmIWMV0TmSxsjO3XqQvpdvwyDZztnXkrcBATgk2qE4YDSh2IqkmexuzPfWO7TIyblb8bL6omm/8dYwYJkF5g8IZaaJY214YH5CMa3pRC6DUCnRT65MWd0x2TcjGCcRejLQarXJmDh6cWfOVplwngqYwpVrhF6abhIUm9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8dNGoh+tApqUm8hZhKiDUFKe0zCuPtvL8QZGDsOurl8=;
 b=p4t2j5g8tswN0bJ5IqzyTz3XNnyt9ZwevRTa6Mh1YB3qie1yRqovXpZ11FvfscJ5jRyxve5N9L/y2DJvlLwCwD2rPCJtcTfAMQNBhGrdBASZaq4SsuQ7Dyec9haaONEO8db3a6NN+Z6zstrukkLtXFmdysXcO0LKsJYzwufU7DI=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBAPR08MB5845.eurprd08.prod.outlook.com (2603:10a6:10:1a5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Fri, 2 Oct
 2020 09:46:00 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e%6]) with mapi id 15.20.3412.029; Fri, 2 Oct 2020
 09:46:00 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
CC: Jan Beulich <jbeulich@suse.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: Ping: [PATCH 0/6] tools/include: adjustments to the population of
 xen/
Thread-Topic: Ping: [PATCH 0/6] tools/include: adjustments to the population
 of xen/
Thread-Index: AQHWh2uA51KvLc+DNUCjQhMwaVDUdqmDCd+AgAAHWYCAAAQLgIAAxK+AgABY4YA=
Date: Fri, 2 Oct 2020 09:46:00 +0000
Message-ID: <A4993E3A-6529-4239-ABF8-DD89A01A54D1@arm.com>
References: <2a9f86aa-9104-8a45-cd21-72acd693f924@suse.com>
 <673fdaf3-e770-67c8-0a6c-6cdec79df38a@suse.com>
 <9F53B61A-5A50-46DD-BF5B-75F48C91FCFC@arm.com>
 <6B9403A3-66DC-4A69-8006-096420649768@arm.com>
 <dea68b56-990d-a13f-a2c4-171e67eaaf73@suse.com>
In-Reply-To: <dea68b56-990d-a13f-a2c4-171e67eaaf73@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 42ce254b-7702-4ddf-72f6-08d866b81054
x-ms-traffictypediagnostic: DBAPR08MB5845:|AM4PR0802MB2162:
X-Microsoft-Antispam-PRVS:
	<AM4PR0802MB2162A778EC4B6669454B53EF9D310@AM4PR0802MB2162.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ouyY/0yEYlaxxWepTl4LSRtxk9DM7O93Tuah61Fdp3DWZaca7Snl7rx2O/OKlfLMjHlg9HJ3s9qh4MpG6oDr2JuLc6jguHylGovHGehIQpqJGfhSHXzNSC3yNA4Wjp7cCz8oKT186GWQ6ntCVTze9++NGRAwYH9x+nu713v7Lew/+3KRsah7roMyRqbN8SvFy3fer8FV4gvRxsCIOipKfTFHSOvewmON9YK6oDsEMsHwkWcoSZv5KhkMpZ17HITLTVxoaM+QA/wSHRlvxPt2sZvv9sqxtMrgZ4CPgrz2/kfdimJDKEvQL6nwOwJbgkgp
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(6486002)(5660300002)(71200400001)(76116006)(2906002)(316002)(91956017)(64756008)(66946007)(66446008)(66556008)(36756003)(66476007)(6512007)(66574015)(8936002)(53546011)(478600001)(86362001)(54906003)(2616005)(8676002)(26005)(33656002)(4326008)(6916009)(83380400001)(186003)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 Tk8UG03BQFlC11AM9SYWrNE89mBLhRSfOrhBCFf+vhGd3MJSV2Vt4yG4MsiSOEsCoSNZS4KGkgpBXxT46oNDC2WquLc03ZKokJdONYbHxiNBh4TBzuUqOqf4OQYd6tgNLlL2CMaqNnqe9f6VvF4HEzakViEonTtmCkQRpFi1NNXjh4zB7zDryd8JH1wPduRt8pH6OxUzB99FkWVyzFeNP6G12dWXCnGARs3XBsjZcEzssvZyiaXtwjV27WcOSheZTgeAnjSjQuIAvK+qdN9pFy1Lz43cs3Dg1s7EcLll1kOHfZASmi7eDCasnN4rdxYQ0aOCK9rK9dz0kBRsM+4r6PTPYZGizQlHKS2ZCDqnUtvVypHY6AI44esbJc+KFu/YPUIiuJdvHG9427cN4mSTX0zqvuHS6ZP5gPKbJbDkSFRznhuT5Z/B55O/JSgcy3sK/kZfFsdssW6/mZ02UpOjAhq/XpPi6Rx6HkMQ+6DddglNItKlc+VbC7Q4MSW1oM6eKi7ScSBtvNsNvTM4fqMO9PCZ3yOCgTmCumedLCdBZ5GAYOCO7fCtkHRZhNjGcHg5Xb7GNJkGMfJBtDjAE9lr2b8iUqvEHOz0QXC4CGo1vuXT6/wUprYYvPo4W2dA2Gpm7qT8siGCde1bhbvOk1MkaA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <43E708A7CE2FFF48BAD5992C2CD31ADC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5845
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	01d2dcbe-842e-44b1-4274-08d866b7f834
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	giW6cNh/m0rWd1FevfF6punC9AyuIBmUZ7hCy7QqwVxJfOB47Q8MqpuwfqCx3IcxYk1crgBuEBvCHLU6mYNELZJKkSZO2x1neLdZKJ62TpywPdAmued4h6GVbexSHSeggNgR0mnXe+kM2kkgxxV70L25uOjYBfPDCVtv7ZRQ6y3GHuEaMcEueh78bboAZ18ltO06oiyp9kHr5ADXAIGKaVs/RrmIWwKtCo5YO9SoT14Am7IP4JMyxGOORVaeuDNZPj9gpT9tQgdv/3z25dyEPoJdA0g6/jDlliUPicpzirY6A0ZqGfXcHKCHf9Ub7L4U1M7wZylz4I0Jiw7gF53Z0H2h6MzKvATS2v+VYIUrGftMX0EZWI45+RbaJBxa/2s/VJkAXXza642OgV/zp8S9vA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(136003)(396003)(46966005)(6506007)(316002)(36906005)(82740400003)(54906003)(47076004)(186003)(2906002)(53546011)(82310400003)(478600001)(6512007)(86362001)(26005)(6862004)(356005)(70586007)(8676002)(336012)(81166007)(33656002)(70206006)(2616005)(6486002)(8936002)(66574015)(5660300002)(36756003)(83380400001)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2020 09:46:40.5791
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42ce254b-7702-4ddf-72f6-08d866b81054
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2162

DQoNCj4gT24gMiBPY3QgMjAyMCwgYXQgMDU6MjcsIErDvHJnZW4gR3Jvw58gPGpncm9zc0BzdXNl
LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwMS4xMC4yMCAxODo0MywgQmVydHJhbmQgTWFycXVpcyB3
cm90ZToNCj4+IEhpLA0KPj4+IE9uIDEgT2N0IDIwMjAsIGF0IDE3OjI5LCBCZXJ0cmFuZCBNYXJx
dWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IEhpIEphbiwN
Cj4+PiANCj4+Pj4gT24gMSBPY3QgMjAyMCwgYXQgMTc6MDMsIEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4+IA0KPj4+PiBPbiAxMC4wOS4yMDIwIDE0OjA5LCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+Pj4+IFdoaWxlIGxvb2tpbmcgYXQgd2hhdCBpdCB3b3VsZCB0YWtl
IHRvIG1vdmUgYXJvdW5kIGxpYmVsZi8NCj4+Pj4+IGluIHRoZSBoeXBlcnZpc29yIHN1YnRyZWUs
IEkndmUgcnVuIGludG8gdGhpcyBydWxlLCB3aGljaCBJDQo+Pj4+PiB0aGluayBjYW4gZG8gd2l0
aCBhIGZldyBpbXByb3ZlbWVudHMgYW5kIHNvbWUgc2ltcGxpZmljYXRpb24uDQo+Pj4+PiANCj4+
Pj4+IDE6IGFkanVzdCBwb3B1bGF0aW9uIG9mIGFjcGkvDQo+Pj4+PiAyOiBmaXggKGRyb3ApIGRl
cGVuZGVuY2llcyBvZiB3aGVuIHRvIHBvcHVsYXRlIHhlbi8NCj4+Pj4+IDM6IGFkanVzdCBwb3B1
bGF0aW9uIG9mIHB1YmxpYyBoZWFkZXJzIGludG8geGVuLw0KPj4+Pj4gNDogcHJvcGVybHkgaW5z
dGFsbCBBcm0gcHVibGljIGhlYWRlcnMNCj4+Pj4+IDU6IGFkanVzdCB4ODYtc3BlY2lmaWMgcG9w
dWxhdGlvbiBvZiB4ZW4vDQo+Pj4+PiA2OiBkcm9wIHJlbWFpbmluZyAtZiBmcm9tIGxuIGludm9j
YXRpb25zDQo+Pj4+IA0KPj4+PiBNYXkgSSBhc2sgZm9yIGFuIGFjayBvciBvdGhlcndpc2UgaGVy
ZT8NCj4+PiANCj4+PiBUaGlzIGlzIGdvaW5nIHRoZSByaWdodCB3YXkgYnV0IHdpdGggdGhpcyBz
ZXJpZSAob24gdG9wIG9mIGN1cnJlbnQgc3RhZ2luZw0KPj4+IHN0YXR1cyksIEkgaGF2ZSBhIGNv
bXBpbGF0aW9uIGVycm9yIGluIFlvY3RvIHdoaWxlIGNvbXBpbGluZyBxZW11Og0KPj4+IEluIGZp
bGUgaW5jbHVkZWQgZnJvbSAvbWVkaWEvZXh0ZW5kLWRyaXZlL2Jlcm1hcjAxL0RldmVsb3BtZW50
L3hlbi1kZXYveW9jdG8tYnVpbGQvYnVpbGQvZG9tMC1mdnAucHJqL3RtcC93b3JrL2FybXY4YS1w
b2t5LWxpbnV4L3FlbXUvNS4xLjAtcjAvcmVjaXBlLXN5c3Jvb3QvdXNyL2luY2x1ZGUveGVuZ3Vl
c3QuaDoyNSwNCj4+PiB8ICAgICAgICAgICAgICAgICAgZnJvbSAvbWVkaWEvZXh0ZW5kLWRyaXZl
L2Jlcm1hcjAxL0RldmVsb3BtZW50L3hlbi1kZXYveW9jdG8tYnVpbGQvYnVpbGQvZG9tMC1mdnAu
cHJqL3RtcC93b3JrL2FybXY4YS1wb2t5LWxpbnV4L3FlbXUvNS4xLjAtcjAvcWVtdS01LjEuMC9o
dy9pMzg2L3hlbi94ZW5fcGxhdGZvcm0uYzo0MToNCj4+PiB8IC9tZWRpYS9leHRlbmQtZHJpdmUv
YmVybWFyMDEvRGV2ZWxvcG1lbnQveGVuLWRldi95b2N0by1idWlsZC9idWlsZC9kb20wLWZ2cC5w
cmovdG1wL3dvcmsvYXJtdjhhLXBva3ktbGludXgvcWVtdS81LjEuMC1yMC9yZWNpcGUtc3lzcm9v
dC91c3IvaW5jbHVkZS94ZW5jdHJsX2RvbS5oOjE5OjEwOiBmYXRhbCBlcnJvcjogeGVuL2xpYmVs
Zi9saWJlbGYuaDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQ0KPj4+IHwgICAgMTkgfCAjaW5j
bHVkZSA8eGVuL2xpYmVsZi9saWJlbGYuaD4NCj4+PiB8ICAgICAgIHwgICAgICAgICAgXn5+fn5+
fn5+fn5+fn5+fn5+fn5+DQo+Pj4gfCBjb21waWxhdGlvbiB0ZXJtaW5hdGVkLg0KPj4+IHwgL21l
ZGlhL2V4dGVuZC1kcml2ZS9iZXJtYXIwMS9EZXZlbG9wbWVudC94ZW4tZGV2L3lvY3RvLWJ1aWxk
L2J1aWxkL2RvbTAtZnZwLnByai90bXAvd29yay9hcm12OGEtcG9reS1saW51eC9xZW11LzUuMS4w
LXIwL3FlbXUtNS4xLjAvcnVsZXMubWFrOjY5OiByZWNpcGUgZm9yIHRhcmdldCAnaHcvaTM4Ni94
ZW4veGVuX3BsYXRmb3JtLm/igJkgZmFpbGVkDQo+Pj4gDQo+Pj4gWGVuIGlzIHVzaW5nIHhlbmN0
cmxfZG9tLmggd2hpY2ggbmVlZCB0aGUgbGliZWxmLmggaGVhZGVyIGZyb20geGVuLg0KPj4gQWN0
dWFsbHkgdGhpcyBpcyBub3QgY29taW5nIGZyb20geW91ciBzZXJpZSBhbmQgdGhpcyBpcyBhY3R1
YWxseSBhIHByb2JsZW0gYWxyZWFkeSBwcmVzZW50IG9uIG1hc3Rlci4NCj4gDQo+IC4uLiBhbmQg
Zml4ZWQgb24gc3RhZ2luZy4NCg0KSSBjYW4gY29uZmlybSB0aGF0IHdpdGggdG9uaWdodCBzdGFn
aW5nIHN0YXR1cyB0aGlzIGlzc3VlIGlzIG5vdCBwcmVzZW50IGFueW1vcmUuDQoNClJlZ2FyZHMN
CkJlcnRyYW5kDQoNCg==

