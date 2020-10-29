Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A14CD29F263
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 17:58:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14362.35511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYBG9-0008UA-NC; Thu, 29 Oct 2020 16:58:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14362.35511; Thu, 29 Oct 2020 16:58:45 +0000
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
	id 1kYBG9-0008Tl-K0; Thu, 29 Oct 2020 16:58:45 +0000
Received: by outflank-mailman (input) for mailman id 14362;
 Thu, 29 Oct 2020 16:58:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tRsB=EE=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kYBG8-0008TU-5H
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 16:58:44 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1b::620])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1735df1-2f6f-4213-9d17-b528081c2819;
 Thu, 29 Oct 2020 16:58:38 +0000 (UTC)
Received: from MR2P264CA0009.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:1::21) by
 DBAPR08MB5845.eurprd08.prod.outlook.com (2603:10a6:10:1a5::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.19; Thu, 29 Oct 2020 16:58:36 +0000
Received: from VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:1:cafe::5c) by MR2P264CA0009.outlook.office365.com
 (2603:10a6:500:1::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Thu, 29 Oct 2020 16:58:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT054.mail.protection.outlook.com (10.152.19.64) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Thu, 29 Oct 2020 16:58:34 +0000
Received: ("Tessian outbound 68da730eaaba:v64");
 Thu, 29 Oct 2020 16:58:33 +0000
Received: from f9b6f271de3f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 186C52E8-2B1B-43CA-BD3E-A284BD05D655.1; 
 Thu, 29 Oct 2020 16:58:20 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f9b6f271de3f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 29 Oct 2020 16:58:20 +0000
Received: from AM6PR08MB3496.eurprd08.prod.outlook.com (2603:10a6:20b:4e::31)
 by AM7PR08MB5463.eurprd08.prod.outlook.com (2603:10a6:20b:106::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Thu, 29 Oct
 2020 16:58:16 +0000
Received: from AM6PR08MB3496.eurprd08.prod.outlook.com
 ([fe80::dc5:9a53:a6b1:6a5a]) by AM6PR08MB3496.eurprd08.prod.outlook.com
 ([fe80::dc5:9a53:a6b1:6a5a%4]) with mapi id 15.20.3499.027; Thu, 29 Oct 2020
 16:58:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=tRsB=EE=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kYBG8-0008TU-5H
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 16:58:44 +0000
X-Inumbo-ID: e1735df1-2f6f-4213-9d17-b528081c2819
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown [2a01:111:f400:7e1b::620])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e1735df1-2f6f-4213-9d17-b528081c2819;
	Thu, 29 Oct 2020 16:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwmvJxEH7BLwjJAT9lkSUzA36bu5zsN2kgvd1zbkEBQ=;
 b=ySE0p2rM2plDooVE12svvQ2bEvGgyX7N2KGnfDggaIJAmGCeUBBezglev26zKe2ayPEtXJJzGkOklR0uavIfTXVVSHXaGHPaXXyV8pvvJF3YnhN7I2qa9lSpVm47tkEJeIcVMkzWydk3w7HddIer85NPcGy52hd8ziSrC5UUm+I=
Received: from MR2P264CA0009.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:1::21) by
 DBAPR08MB5845.eurprd08.prod.outlook.com (2603:10a6:10:1a5::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.19; Thu, 29 Oct 2020 16:58:36 +0000
Received: from VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:1:cafe::5c) by MR2P264CA0009.outlook.office365.com
 (2603:10a6:500:1::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Thu, 29 Oct 2020 16:58:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT054.mail.protection.outlook.com (10.152.19.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Thu, 29 Oct 2020 16:58:34 +0000
Received: ("Tessian outbound 68da730eaaba:v64"); Thu, 29 Oct 2020 16:58:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ff0a1e33f986aa30
X-CR-MTA-TID: 64aa7808
Received: from f9b6f271de3f.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 186C52E8-2B1B-43CA-BD3E-A284BD05D655.1;
	Thu, 29 Oct 2020 16:58:20 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f9b6f271de3f.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 29 Oct 2020 16:58:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f6i/oJHPzCMS7eQB1Zu4IVsw/xWXhf/25q0IXuscezF+IQdXzJfyOgYZol4c/pcC/rTffaujT1BgT8URASX37pxWD9qBIXA9QGE1o7zCQRhQQ2sP9gY89LHqoCu22efpX9ILNrL9PZWJH997ZbUfXxCIj0h+0wJnBB1u0bTv7qMFB9Wde6YJR+gSBcqV/EtCQx7M6o9+DVTECJzJf8qctYOSgvhHAfcKIhL/KCiimmBO/OICqzxm5VUuE/CzXUNR+cbK7MiemC9gU5BLxHP3NVe+aYF78o86GaoZfg60KrQdC6I+NZjAQXS3mScv2iY2cO9YtHZGU/Fa83MrqxULFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwmvJxEH7BLwjJAT9lkSUzA36bu5zsN2kgvd1zbkEBQ=;
 b=AFiDhUFlMftqxHysEAXW7tPO8ViEerayQQ7UFm23dhXChkpvM9/FDaN8+pFKJRU1JnmAvcmFeTTatICi9x+KjGogPTeaVuUnXmt+X4Ubb02NpRDr2EutYxbv1hGG06WgM6k6Z8u+31t91FVZGBpvheVJuULJot/pXM5dY3g17ZUa0Gp7071GDG+CwFhNhv3F0LoR3OXzOVNMsnLf0rvbN3AOhvYk5h4mRELbNmlXyT5CPDmm8FykqZJQ6uR2POxZQeWXnMT8GBgIfRZlEzs+i6380g+GxAdjXm5bgUTvIIX6DHDBm8i0NRZL8Tw3lBrGJ+25PrFCkWuy5IGfly2fIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwmvJxEH7BLwjJAT9lkSUzA36bu5zsN2kgvd1zbkEBQ=;
 b=ySE0p2rM2plDooVE12svvQ2bEvGgyX7N2KGnfDggaIJAmGCeUBBezglev26zKe2ayPEtXJJzGkOklR0uavIfTXVVSHXaGHPaXXyV8pvvJF3YnhN7I2qa9lSpVm47tkEJeIcVMkzWydk3w7HddIer85NPcGy52hd8ziSrC5UUm+I=
Received: from AM6PR08MB3496.eurprd08.prod.outlook.com (2603:10a6:20b:4e::31)
 by AM7PR08MB5463.eurprd08.prod.outlook.com (2603:10a6:20b:106::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Thu, 29 Oct
 2020 16:58:16 +0000
Received: from AM6PR08MB3496.eurprd08.prod.outlook.com
 ([fe80::dc5:9a53:a6b1:6a5a]) by AM6PR08MB3496.eurprd08.prod.outlook.com
 ([fe80::dc5:9a53:a6b1:6a5a%4]) with mapi id 15.20.3499.027; Thu, 29 Oct 2020
 16:58:16 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Paul Durrant <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 4/4] xen/pci: solve compilation error when memory
 paging is not enabled.
Thread-Topic: [PATCH v1 4/4] xen/pci: solve compilation error when memory
 paging is not enabled.
Thread-Index: AQHWq7wn1E1TPrUt3EyifJVqFrVmIams60gAgAA3GICAAa+LAA==
Date: Thu, 29 Oct 2020 16:58:16 +0000
Message-ID: <77495A6D-D1D8-4E62-B481-6AE59593CFAD@arm.com>
References: <cover.1603731279.git.rahul.singh@arm.com>
 <dc85bb73ca4b6ab8b4a2370f2db7700445fbc5f8.1603731279.git.rahul.singh@arm.com>
 <b345b0d4-8045-1d5d-b3c9-498311cfb1ac@suse.com>
 <14328157-D9C5-428E-BD1C-F4A841359185@arm.com>
In-Reply-To: <14328157-D9C5-428E-BD1C-F4A841359185@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.38.125]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5c65c6ef-ee3a-4aa8-cf83-08d87c2bdf78
x-ms-traffictypediagnostic: AM7PR08MB5463:|DBAPR08MB5845:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DBAPR08MB58455095B03B37C26D0F0D62FC140@DBAPR08MB5845.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6108;OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ft6gD+56MQFFsD/h/sGNj7HArlatslp7DpYoQ/T7QtRXh/p+lF5uegneaNzYLowPufIW/uNp6R2gQwA+ry1V6TyqQGeN7qWZLTUSiCH0MzuME4mSexvqVy+0XCEbSWRz8cBnz6jLy1aaowAVBWKDbZdhXKYv9rfLhYspTO8hZVpMKMaSJ9Jwhgp2qr6SkkzeXqVZPgglqPG8S8EyuggPdKGRpSO0TNfkrGJsxM0L6VJlKvxZs9gLOSltPA0IP1Sdlh6OdKolDur9yhb8WKgiQn+gMpKB3zM3MooB6WCBEy+Ksw/UxwkwN17q3W9K3coCoEcaZTdA+KAzmZI9liv9XA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3496.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(366004)(346002)(39850400004)(316002)(478600001)(4326008)(55236004)(64756008)(66446008)(91956017)(66946007)(66476007)(76116006)(8936002)(66556008)(36756003)(8676002)(5660300002)(2906002)(86362001)(54906003)(2616005)(26005)(186003)(33656002)(71200400001)(6506007)(53546011)(6512007)(6916009)(6486002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 x9EO5SzVqYUb32D5v84ieUWT77/guDWkVFutNv+YEzNjD+PzJk8jDZxs20pkoZn7nRHRWsknjx7a+J+iCIHO3PFaZvsB5CklEMlk63G1QNehZ7gK7NIF/qN4bJJyQd9+Fv5RS80JsevhU3c6SK4TDrYSumqDqSJPftdbwlBpIRC1eIWHibeZMDBoqpKm4WVYNQkUBREnHdmedmMVKopwtsSJismnjdlTygixPGXsfhWWSbzQlsQgKv/xj1UTTMYUh3Z8afqb+QSCmpEThH0mOuqyHnu2l4sIsWHvYt0ptMf/ZIYDvhKWA/yCUGgQNF36S0uvjHu1RMdReGE/lYNz1CF9QsNPhdIX8Y8sOpy1XKoVOgniF7Cohc+9Uq2pT3ebORZDxaM9mIXiffh8Thzj8/rPa5L89SQ7UjKabHMWLzGncU7pAMwc/bm+C/QjsL+jSAz54CQsPEiPDbfUcfzdc1Ndraa0nsFCrEiXeBtx/iHg8mCrbHv8bgbUls5Pvo1mG/EZySsFLrlk2vOZohll5upoAx1hHYf6KzTnm/mu7oYv/X2HPo9DGvINO171WCz8tMPNe40WHbaoqIHqxHPOUg0t5cYNQLGyQp6UuJaaakkdy1/0nwcH03nCx1zQtl05b4yhKkTeNwbO/G/v6/wmFQ==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <59FEF0793B0AAD4DB7077E5EB4B6FA6F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5463
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7f92f996-1562-455b-d55f-08d87c2bd4b2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EqD9Hf2aoT6nyIMLUb7oS37iyTAMSG1zPzv2OqxjTtU9JUp26H5upMQ4ZfH+FKPt/kUXIrqlzcDNWoAbYJa4fCMwNA7ONHcyVvE1vqmf+8qMlB8pNBkg03aDjv9Wdz0FM7WyKxjK83EgNrp6SOvTRzl+lvjn6jXMT8hfyxqvxAtS3E3xK/5WiOyyDzVyLrxYgp/wUQvaS718SSyn0AM8TTO2FeiZCJWEoyasLqTphAm5JXB6wS7DPxb+V4TQcU2gxO2mnsCo86UktOuF8WP02n9Q91W4FRz2nqhDipmcXXLTmVV1QXys3DJ1+m+yVZbFouy+0ZMnRbVUtCg6uUExrbiwpaGgREtbkB3zaSI4Y0bDU5qmJR76UjOSlofUjgEdRKwwQM4V9BOMis3GJhUyKw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(39860400002)(376002)(396003)(46966005)(54906003)(316002)(55236004)(8936002)(6486002)(478600001)(6862004)(356005)(70206006)(70586007)(36756003)(86362001)(5660300002)(2906002)(33656002)(47076004)(82310400003)(336012)(26005)(4326008)(82740400003)(8676002)(6512007)(81166007)(186003)(6506007)(53546011)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2020 16:58:34.5460
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c65c6ef-ee3a-4aa8-cf83-08d87c2bdf78
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5845

Hello Jan,

> On 28 Oct 2020, at 3:13 pm, Rahul Singh <Rahul.Singh@arm.com> wrote:
>=20
> Hello Jan,
>=20
>> On 28 Oct 2020, at 11:56 am, Jan Beulich <jbeulich@suse.com> wrote:
>>=20
>> On 26.10.2020 18:17, Rahul Singh wrote:
>>> --- a/xen/drivers/passthrough/pci.c
>>> +++ b/xen/drivers/passthrough/pci.c
>>> @@ -1419,13 +1419,15 @@ static int assign_device(struct domain *d, u16 =
seg, u8 bus, u8 devfn, u32 flag)
>>>    if ( !is_iommu_enabled(d) )
>>>        return 0;
>>>=20
>>> -    /* Prevent device assign if mem paging or mem sharing have been=20
>>> +#if defined(CONFIG_HAS_MEM_PAGING) || defined(CONFIG_MEM_SHARING)
>>> +    /* Prevent device assign if mem paging or mem sharing have been
>>>     * enabled for this domain */
>>>    if ( d !=3D dom_io &&
>>>         unlikely(mem_sharing_enabled(d) ||
>>>                  vm_event_check_ring(d->vm_event_paging) ||
>>>                  p2m_get_hostp2m(d)->global_logdirty) )
>>>        return -EXDEV;
>>> +#endif
>>=20
>> Besides this also disabling mem-sharing and log-dirty related
>> logic, I don't think the change is correct: Each item being
>> checked needs individually disabling depending on its associated
>> CONFIG_*. For this, perhaps you want to introduce something
>> like mem_paging_enabled(d), to avoid the need for #ifdef here?
>>=20
>=20
> Ok I will fix that in next version.=20

I just check and found out that mem-sharing , men-paging and log-dirty is x=
86 specific and not implemented for ARM.
Is that will be ok if I move above code to x86 specific directory and intro=
duce new function arch_pcidev_is_assignable() that will test if pcidev is a=
ssignable or not ?

>=20
>> Jan

Regards,
Rahul


