Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFE8293C29
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 14:48:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9523.24976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUr3J-0007wj-FN; Tue, 20 Oct 2020 12:47:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9523.24976; Tue, 20 Oct 2020 12:47:45 +0000
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
	id 1kUr3J-0007wK-BZ; Tue, 20 Oct 2020 12:47:45 +0000
Received: by outflank-mailman (input) for mailman id 9523;
 Tue, 20 Oct 2020 12:47:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cu2Z=D3=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kUr3H-0007wF-Lt
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 12:47:43 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.87]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3ccfaa31-2f37-436f-8b19-69d604387336;
 Tue, 20 Oct 2020 12:47:41 +0000 (UTC)
Received: from AM6P193CA0134.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::39)
 by AM6PR08MB5032.eurprd08.prod.outlook.com (2603:10a6:20b:ea::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Tue, 20 Oct
 2020 12:47:39 +0000
Received: from VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:85:cafe::4f) by AM6P193CA0134.outlook.office365.com
 (2603:10a6:209:85::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22 via Frontend
 Transport; Tue, 20 Oct 2020 12:47:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT040.mail.protection.outlook.com (10.152.18.210) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21 via Frontend Transport; Tue, 20 Oct 2020 12:47:36 +0000
Received: ("Tessian outbound ba2270a55485:v64");
 Tue, 20 Oct 2020 12:47:34 +0000
Received: from 83a7448c0371.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3CB12C91-ED4E-4603-A808-D84EF30EA363.1; 
 Tue, 20 Oct 2020 12:46:58 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 83a7448c0371.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 20 Oct 2020 12:46:58 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0802MB2168.eurprd08.prod.outlook.com (2603:10a6:4:84::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.27; Tue, 20 Oct
 2020 12:46:54 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3477.028; Tue, 20 Oct 2020
 12:46:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Cu2Z=D3=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kUr3H-0007wF-Lt
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 12:47:43 +0000
X-Inumbo-ID: 3ccfaa31-2f37-436f-8b19-69d604387336
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown [40.107.8.87])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3ccfaa31-2f37-436f-8b19-69d604387336;
	Tue, 20 Oct 2020 12:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymAY57WbRSpaYvoliG/60y285l3xgcLZeaAMKsM1xRI=;
 b=o2uuLoUjVwHm/NK+nbWUxRovmyHvgomxoBvHw646zjNlCW/1oymBGC2qu7brxFyJDGQI+Bz3Sq/nLzggdmG6zumiqvgX46bviY9X0wDVnRscna1HhgjMACIGFc6IMAu6HJ2JwEaZ0FTReLrX2/1+0NFv6ozyrAJ3Xlr9ms33rHY=
Received: from AM6P193CA0134.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::39)
 by AM6PR08MB5032.eurprd08.prod.outlook.com (2603:10a6:20b:ea::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Tue, 20 Oct
 2020 12:47:39 +0000
Received: from VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:85:cafe::4f) by AM6P193CA0134.outlook.office365.com
 (2603:10a6:209:85::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22 via Frontend
 Transport; Tue, 20 Oct 2020 12:47:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT040.mail.protection.outlook.com (10.152.18.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21 via Frontend Transport; Tue, 20 Oct 2020 12:47:36 +0000
Received: ("Tessian outbound ba2270a55485:v64"); Tue, 20 Oct 2020 12:47:34 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 38b9bef268231f6c
X-CR-MTA-TID: 64aa7808
Received: from 83a7448c0371.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3CB12C91-ED4E-4603-A808-D84EF30EA363.1;
	Tue, 20 Oct 2020 12:46:58 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 83a7448c0371.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 20 Oct 2020 12:46:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K2pDN0fYvZC4AcqXidKzY91/vE7/CoPrNDX7EwnrBvFEs+eBdedp9LE65icuIOw7oLFf1SMH+V2k2YoJwSu/x6+g0Rkn3tnQBaDOR/NzIse0KbjNPeyhDO2Mnq74Xgaa5rrjagSlGm1HwJ4kzd2RSc1tf6zeOYCUBvF92mAffOjT1kq+v/B8Cicu6pGPPnl6z76cuYSO0EKSW8Q5ARum2KMOi0gC6HjnreOmN2PYpkjJEECKk4Y1mUPrupMt6HipWyMkAQmLNJJQUrIWyQQh1+uxKmXy7MhYlEvdrF1DLcgCORXrcG/qA2vOj1fOWyFsj9rwhyw8elBe6dMkvgmOyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymAY57WbRSpaYvoliG/60y285l3xgcLZeaAMKsM1xRI=;
 b=bf9pn+9CFpa0G1UAMVe+vv33DBNfwMObwikfpr9oOgg5MKS4brBZjVs/JUlmFA+fVtHDNvN9C4F88OoFwloPuJHJeNJ0N9nVU6eihTS3cOXW1CxgMSuVjzBlwj1h4vlWXVdixixscEedUA3JShCJDkLpc0pBgU3VQTymdXgBeEOaUWhq4jp5WUTrXxMjMsb07jZVGNwUrQFeeTIKWMzMRmvRIjZT8Zgot3Mul4aUqkHXLj29JPGzafS4E+BGvYdejkfcNayDRe8G6U7U/TX7UMexO0CfBMxRdkw1ESR0lsvd0HLUZN3ljUNGhYE+1PdeFuV3ESv7/r2d1SuU9cuJSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymAY57WbRSpaYvoliG/60y285l3xgcLZeaAMKsM1xRI=;
 b=o2uuLoUjVwHm/NK+nbWUxRovmyHvgomxoBvHw646zjNlCW/1oymBGC2qu7brxFyJDGQI+Bz3Sq/nLzggdmG6zumiqvgX46bviY9X0wDVnRscna1HhgjMACIGFc6IMAu6HJ2JwEaZ0FTReLrX2/1+0NFv6ozyrAJ3Xlr9ms33rHY=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0802MB2168.eurprd08.prod.outlook.com (2603:10a6:4:84::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.27; Tue, 20 Oct
 2020 12:46:54 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3477.028; Tue, 20 Oct 2020
 12:46:53 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Print message if reset did not work
Thread-Topic: [PATCH] xen/arm: Print message if reset did not work
Thread-Index: AQHWo8Slq58ZQPuN/USs6zrkcavsmamfNYiAgAFBGoA=
Date: Tue, 20 Oct 2020 12:46:53 +0000
Message-ID: <B6E323F6-34FD-4B7D-97DF-8B7B4B0F7448@arm.com>
References:
 <74a7359983a9d25ca62a6edd41805ab92918e2a1.1602856636.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.21.2010191036230.12247@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2010191036230.12247@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6402ba4c-9456-4187-c685-08d874f652a0
x-ms-traffictypediagnostic: DB6PR0802MB2168:|AM6PR08MB5032:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB5032522EBE40CB0AC26F2AB69D1F0@AM6PR08MB5032.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1nJzqaiNS8lF1KWRYK6DKlAKtDh6sv+qkaggGnBTIweNi3nQZwVEW9N6JqXSBGe1Nk2Y22P0AzkZPFmoI2q5lCvnCpTOh6MvsAHoTN1rxApnHW55kn+Ny58NwNvHpqYQV4iJGHvQDjWw9B2YBGqSdQNA4NWPYxOFL8tEnYfqDCDeYgC4Cy6muiTo5laxSeKg5KHvD8eA4m5uarmSaTCo0yKhRjZVVPlU15Ul21mOuVIzz/d5Ywo9Ar6fZGoEaIMC9RqW4oJ6vFvV5qeg8p+72ez8N3e9MzRypcuZ6m9wn6m4FaHfBDytc2nqShRk7wQqAFw/89Ig4h33Rh5RhuWBfg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(396003)(376002)(136003)(346002)(86362001)(83380400001)(316002)(33656002)(26005)(4326008)(15650500001)(2616005)(6512007)(2906002)(478600001)(54906003)(5660300002)(36756003)(71200400001)(6916009)(64756008)(66446008)(186003)(66476007)(66556008)(76116006)(66946007)(91956017)(8936002)(6506007)(53546011)(6486002)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 0Wjl7OEV12LcJ+rTRTcPo/EZRaFmFnBRBZZtH60QWZhOcu3hSAEBKeq9Qg+Um6SCwmiXpDSuFNk977rmfOI9Gql1NJfLmGmUzxJG801xLWkLKa1zueGT0o+gFb0UQJozWOYCa1ZGhzz+6v42S0PA945CP5I0fWQE2pIPpnNjh5bLQSMiAsaxRkgAQ7x/qoDxKKgV3d1STdfZDzLh0yaABAg4PPeE0YeCgiT0dKDXffPHuWNGb1fNy3EixAKfIyf54btAxCDZdBCd6czTBkmAzsInOFr4jFNtX2gnfY0XpVNNCWDxVkChSiTFPFS2XXXMtTQzK/k2TZCKqeJHqEiqAX9Ni/myc2oo/6FLZ1RyRKphcSnxakZPuXCazwRuE3X3u75lmSAYbRZgOtfIxG3X7Xw9lz1yNACxYGJkv6hBr62CJLOoAAlSYRWG+q7lvK6vbhZM17lgLywmuhlYKiSU+TZROi7XAvz4rsJ9iTaAWo358+vif1ZYJeuD6hEXSh+Z4KgNhJkDxgvfPu65MPLmwkxIZJYueNXQXtHSR03tFQjuSXrAQaAYHIkye3BKn9sJk41Ho6Ay8QWTZ532PS/H+WV11uvvBGiaTX8rtwSLRSN38DfyenkdZKwXS8o2af46ypcVF/wXnWtb7S3chcF8cg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <62FB6FEA9B118A43B9608C7BAFD07147@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2168
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0bd6b3b4-9d1a-4705-be6b-08d874f638f8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5fp6EqmUKbZnwfqsMs40eZtL6w3MTHo1xR2t0sIF1HpMGR50+HD8zWOiOPMWwX9yVbCBRf1BC/cGhC8UVFIQmvdT/WG5PWaCQwQ7iXbg6WOzww20+aa8Q2XYaiDeRO6u7NNRoVCqTitmyvxMGYRG/bGTDfkf0Ljl8tf2evSYWP7BszKr54FkoNMu/zmOe9lLz8/m2iVLsDDt6A52h3uQl1rcVE5mqErwyK0SjzzKhp0u3+JC0YEvQoBgmM4VfmI6p1cmw0HXfaLju9lVc5efhUJsEaI1SxfuqGUzngHkpAuslj49DiAT0Wd5VUC+RyK+pSQisJlb7uZoHLlUw+TKfxgcYoOHO+xlqn/fGTjK1ndLrKatYOFHLr1RScVDGRKin7KzfoEPF1MWSuJn1ZdgcA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(346002)(396003)(46966005)(33656002)(70586007)(70206006)(36906005)(2906002)(2616005)(53546011)(6506007)(5660300002)(186003)(54906003)(26005)(8936002)(336012)(82310400003)(6486002)(6862004)(316002)(4326008)(47076004)(81166007)(6512007)(107886003)(86362001)(82740400003)(478600001)(356005)(83380400001)(36756003)(8676002)(15650500001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2020 12:47:36.8750
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6402ba4c-9456-4187-c685-08d874f652a0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5032



> On 19 Oct 2020, at 18:37, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Fri, 16 Oct 2020, Bertrand Marquis wrote:
>> If for some reason the hardware reset is not working, print a message to
>> the user every 5 seconds to warn him that the system did not reset
>> properly and Xen is still looping.
>>=20
>> The message is printed infinitely so that someone connecting to a serial
>> console with no history would see the message coming after 5 seconds.
>>=20
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>> xen/arch/arm/shutdown.c | 4 ++++
>> 1 file changed, 4 insertions(+)
>>=20
>> diff --git a/xen/arch/arm/shutdown.c b/xen/arch/arm/shutdown.c
>> index b32f07ec0e..600088ec48 100644
>> --- a/xen/arch/arm/shutdown.c
>> +++ b/xen/arch/arm/shutdown.c
>> @@ -36,6 +36,7 @@ void machine_halt(void)
>> void machine_restart(unsigned int delay_millisecs)
>> {
>>     int timeout =3D 10;
>> +    unsigned long count =3D 0;
>>=20
>>     watchdog_disable();
>>     console_start_sync();
>> @@ -59,6 +60,9 @@ void machine_restart(unsigned int delay_millisecs)
>>     {
>>         platform_reset();
>>         mdelay(100);
>> +        if ( (count % 50) =3D=3D 0 )
>> +            printk(XENLOG_ERR "Xen: Platform reset did not work properl=
y!!\n");
>> +        count++;
>=20
> I'd think that one "!" is enough :-) but anyway

True :-)
Feel to limit the exclamation to one while committing.

>=20
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Thanks

Bertrand=

