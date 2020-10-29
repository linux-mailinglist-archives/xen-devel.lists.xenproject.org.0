Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1995829E7E5
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 10:55:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14096.35069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kY4ek-0001mF-QA; Thu, 29 Oct 2020 09:55:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14096.35069; Thu, 29 Oct 2020 09:55:42 +0000
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
	id 1kY4ek-0001lt-MV; Thu, 29 Oct 2020 09:55:42 +0000
Received: by outflank-mailman (input) for mailman id 14096;
 Thu, 29 Oct 2020 09:55:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sh/s=EE=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kY4ej-0001lo-01
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 09:55:41 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.53]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eea2b81a-53e7-4399-b9ea-a3bc850ad0b4;
 Thu, 29 Oct 2020 09:55:40 +0000 (UTC)
Received: from DB6PR0402CA0009.eurprd04.prod.outlook.com (2603:10a6:4:91::19)
 by AM9PR08MB6274.eurprd08.prod.outlook.com (2603:10a6:20b:2d5::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Thu, 29 Oct
 2020 09:55:32 +0000
Received: from DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:91:cafe::37) by DB6PR0402CA0009.outlook.office365.com
 (2603:10a6:4:91::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Thu, 29 Oct 2020 09:55:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT013.mail.protection.outlook.com (10.152.20.105) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Thu, 29 Oct 2020 09:55:32 +0000
Received: ("Tessian outbound c189680f801b:v64");
 Thu, 29 Oct 2020 09:55:31 +0000
Received: from 2af84ba5829e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9B6D1991-ED96-42F0-8898-5CBF1A03D10E.1; 
 Thu, 29 Oct 2020 09:55:16 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2af84ba5829e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 29 Oct 2020 09:55:16 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3034.eurprd08.prod.outlook.com (2603:10a6:5:24::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 29 Oct
 2020 09:55:15 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3477.028; Thu, 29 Oct 2020
 09:55:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=sh/s=EE=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kY4ej-0001lo-01
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 09:55:41 +0000
X-Inumbo-ID: eea2b81a-53e7-4399-b9ea-a3bc850ad0b4
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown [40.107.22.53])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id eea2b81a-53e7-4399-b9ea-a3bc850ad0b4;
	Thu, 29 Oct 2020 09:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Utgxc1gYS05fnkTtMDjRM647ko6/E1RfiZUyMuo/lg=;
 b=Ma03aF2jF+HuKomvsjrBvO7i9FjszEfVcMqqZdhQRKjYjYx1YBUSvjSK4M2gjfyCmewpCwQZIjADKrde1EZRl1sllGTfku/7UNttAoaT+2TgW7yjslXr2vfDeLufMEq/LOGDB5fm54nWUdVz/PmgmjeuQFVoPME2FozAFdMz5l8=
Received: from DB6PR0402CA0009.eurprd04.prod.outlook.com (2603:10a6:4:91::19)
 by AM9PR08MB6274.eurprd08.prod.outlook.com (2603:10a6:20b:2d5::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Thu, 29 Oct
 2020 09:55:32 +0000
Received: from DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:91:cafe::37) by DB6PR0402CA0009.outlook.office365.com
 (2603:10a6:4:91::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Thu, 29 Oct 2020 09:55:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT013.mail.protection.outlook.com (10.152.20.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Thu, 29 Oct 2020 09:55:32 +0000
Received: ("Tessian outbound c189680f801b:v64"); Thu, 29 Oct 2020 09:55:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d935657349f6c042
X-CR-MTA-TID: 64aa7808
Received: from 2af84ba5829e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9B6D1991-ED96-42F0-8898-5CBF1A03D10E.1;
	Thu, 29 Oct 2020 09:55:16 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2af84ba5829e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 29 Oct 2020 09:55:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CTqxJ5A17c1AppxU8Ty9usC6Cul2ng6OaePjnTKQfTqYuVuO5kH+/8UcU9nuHrP68RV9DgEPAZbGPRgtm7xzhIuwKkOlsZPFKMdt5N4wQH+RLz1Cm+bzfhhG1OCKMTEFFp0QIyTEIjdSzcEk1u6zBIRz1hqroN+QQ+xmoz6wcLhVWho8wpAYuhoY9c+UwOdRCitPXIUq0KVCr9n8sEYxLSUqNY8A3a1uW11SkzEcxWMmnPigh+2MAA5JPY03OxeA5GEVqTJBVwAq227j3DChPxRVE7HDMql5pf9/3LKlBkL0IuwjGKgPeuYencMWaWf1jVnE+/E/OIA4OGUjClAzyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Utgxc1gYS05fnkTtMDjRM647ko6/E1RfiZUyMuo/lg=;
 b=YVTd1bxdYtUm65d8XGDRa5ROusDy2sowtOPvV2bx/TBWxHwE2qevOTqjMsw2HNVG4vup0oZgJR/eIiX3Yc3+AQXTCOdzXBLZ1SmijqE39bKg0tOOHl7kCgakkNIEkhxR64Jl3QgmFjsn1Qpdn1vbjLz7CwW8orrzdJRdW8iKfSIxeuYx9Fc1q9Zna5xwZRrOwYnDIrPi86YZqVQHVQTDfZKWL/7Oi3Z5ox/PM6fGNpuSKVXyCQpzeifWSk86CnpS4VI1ru7H/6Q/lVIwZwjp3UzfErDKTp0x3TMOWCzSbzMIEEVTH/psuThIO7A6g/9zn09bF0RX15qGDAcmpCtqbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Utgxc1gYS05fnkTtMDjRM647ko6/E1RfiZUyMuo/lg=;
 b=Ma03aF2jF+HuKomvsjrBvO7i9FjszEfVcMqqZdhQRKjYjYx1YBUSvjSK4M2gjfyCmewpCwQZIjADKrde1EZRl1sllGTfku/7UNttAoaT+2TgW7yjslXr2vfDeLufMEq/LOGDB5fm54nWUdVz/PmgmjeuQFVoPME2FozAFdMz5l8=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3034.eurprd08.prod.outlook.com (2603:10a6:5:24::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 29 Oct
 2020 09:55:15 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3477.028; Thu, 29 Oct 2020
 09:55:15 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 3/3] xen/arm: Warn user on cpu errata 832075
Thread-Topic: [PATCH v2 3/3] xen/arm: Warn user on cpu errata 832075
Thread-Index: AQHWq7RKM3lRt4XRXUWYGPT9/eCkOKmtW9sAgAD/7gA=
Date: Thu, 29 Oct 2020 09:55:15 +0000
Message-ID: <DFD994CA-C456-468C-8442-0F63CE661E78@arm.com>
References:
 <a6fc6cfd71d6d53cf89bf533a348bda799b25d7d.1603728729.git.bertrand.marquis@arm.com>
 <4d62bc0844576b80e00ea48e318be238a4d73eae.1603728729.git.bertrand.marquis@arm.com>
 <c6790d34-2893-78c4-d49f-7ef4acfceb96@xen.org>
In-Reply-To: <c6790d34-2893-78c4-d49f-7ef4acfceb96@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4b7103a0-f8a7-427a-589d-08d87bf0c630
x-ms-traffictypediagnostic: DB7PR08MB3034:|AM9PR08MB6274:
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB6274149F99E61B6DF8E2C2729D140@AM9PR08MB6274.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 xUBKE3jFKPKzayjOzFiSgOxrMh+ePEb3076dYwiCQzOESVNWFO5U3tPyPwWFpCi6hSb9L+EpuzrIoqhuzD70mzXfzOWIe1PkDTv8ccP2WLgssBbPw5wkhJZMcZE9tkznVE0AR+wvKCpCen8JtPrpEUwl0bH+KrD8ZLrtLS4gTJzyVkrGZizXNLlBvR9WQaYy+9KkitKsZk0ECVllDiD76jLUxS59RRh9JFYYL7j52rY5h1Q5TeoO6A6Vu3ySLsMOnSBGzUQ3UuQTVHNT+ma/rYyN9RQ/YBFUplOMDp0bOCuugL3QZEgndNwD3S8iTl5VWZ9GIWtpXsN+A4iCXZn0+w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(366004)(396003)(39860400002)(346002)(6512007)(8936002)(66446008)(5660300002)(4326008)(71200400001)(91956017)(66946007)(76116006)(66476007)(64756008)(66556008)(86362001)(36756003)(478600001)(83380400001)(316002)(2616005)(6916009)(54906003)(26005)(8676002)(53546011)(6486002)(186003)(6506007)(2906002)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 PGMGO8a9OFTdCXUCA6e2ZD2zqSUcLkBX0A4l7h53iKx3cFUH6rWpvJg2+kB8ePwjF9GIEOzDU0ZjP44HS4UpB5ABOsYwkeRTexENDBz8w1uufQvnTeuWWLzWmWYDXwgGOoVBSxH9V/b48bQxm9XMpYa2Tx3O/p4fV4CtJ0VNHg5xE86voAwVANQI2CUnR7bl+pi0GUd7y4+WBcNcy/2RW4EN7Fcxi4menKuhK7SeyDxRy8YwRtbZxwgwZ+MZs3deM/6iCfJgNNn400pAXkpsoBeFfhnl6aoGVpnC/SWAYCs8qwBRfPZ39acFvNylWFV4+jeg8jhX38nPHI7VxqwOTAAO9wcEKBZVHO6BapgQT/tb1Go2vfCp68/mF0qPXyn66ct2qKvrt8tTUdFbhB1pJufPrKShRL4bz0e3EfxdT/3dybMT57vZz7RU1J1n54fx9OCWRetGZl0Sg1/sroc/zHRyEwt96jgsN7mhbwvur27IkWJ38ZCViYrWMWkSlC2FG9SrsK7tkdZayfpkUsHZAEA1v7dDDT5pattAQNOoJCkc5dy0G2jqtIYm/4yEyonWX00I/h8xHJP5Ho4XYhWUJg8AvdSLLB11ROVXtjAHXcLtcyQr2trHmHkwHWFpze6iqxvmnceoN63K7ym/ae+wpg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1FAF3F81E7FDC3499FD908A83E58482E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3034
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e832afca-666c-469b-6d79-08d87bf0bc30
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gs3JeG89J3Ryfmq8or/WLVbuA+OZ7CqsprQbQ7edIEDEqRQl9XBEDUmXAvaPDuCIqkEy3Qo/SBMtnxxR8QRChvc8xybfbOHwIfNf8GfWXcg9Spa+ZnZeyYwAyc+cPsqMQ0pFm1PV5N0p3Uk67qhwFdxQ2aeqQJ8gqZR/w0pNRLf4jdfYyW+M41MDCFf/h1+1gW3ehLEhra4iGH17QRHYzBOwjnhh0rKXCom0j8j6Z8rQ2oPsS2w0kaejrodtnVaUROaw50A0ebKrmtClv/12mtZLPXqbHa+B+m7e5nQMWy0/OdH1Ig8wKHHNbSk9uu0faoWkqmOMhZsUDMHxyS2sEaddVw++kND08xzFFq2dJy8FNdX6YgFlWezHFCY+llcge5jhHPvtN/Q6Fptauasezw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(39860400002)(376002)(396003)(46966005)(70206006)(2906002)(8936002)(53546011)(6862004)(54906003)(83380400001)(81166007)(82740400003)(6506007)(107886003)(4326008)(70586007)(478600001)(356005)(6512007)(8676002)(47076004)(36756003)(6486002)(2616005)(316002)(26005)(86362001)(336012)(186003)(33656002)(82310400003)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2020 09:55:32.0209
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b7103a0-f8a7-427a-589d-08d87bf0c630
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6274

Hi Julien,

> On 28 Oct 2020, at 18:39, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 26/10/2020 16:21, Bertrand Marquis wrote:
>> When a Cortex A57 processor is affected by CPU errata 832075, a guest
>> not implementing the workaround for it could deadlock the system.
>> Add a warning during boot informing the user that only trusted guests
>> should be executed on the system.
>> An equivalent warning is already given to the user by KVM on cores
>> affected by this errata.
>> Also taint the hypervisor as unsecure when this errata applies and
>> mention Cortex A57 r0p0 - r1p2 as not security supported in SUPPORT.md
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>=20
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Thanks

>=20
> If you don't need to resend the series, then I would be happy to fix the =
typo pointed out by George on commit.

There is only the condensing from Stefano.
If you can handle that on commit to great but if you need me to send a v3 t=
o make your life easier do not hesitate to tell me

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall
>=20


