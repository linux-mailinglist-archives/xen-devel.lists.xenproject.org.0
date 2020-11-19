Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F12C2B9A77
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 19:17:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31277.61646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfoUA-0007z2-8a; Thu, 19 Nov 2020 18:16:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31277.61646; Thu, 19 Nov 2020 18:16:46 +0000
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
	id 1kfoUA-0007yU-3H; Thu, 19 Nov 2020 18:16:46 +0000
Received: by outflank-mailman (input) for mailman id 31277;
 Thu, 19 Nov 2020 18:16:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zZym=EZ=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kfoU8-0007wu-Sz
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 18:16:44 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.66]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3fbd8aac-cb7a-4a67-8bee-3c91b337eb61;
 Thu, 19 Nov 2020 18:16:39 +0000 (UTC)
Received: from DB6PR0801CA0055.eurprd08.prod.outlook.com (2603:10a6:4:2b::23)
 by AM6PR08MB4024.eurprd08.prod.outlook.com (2603:10a6:20b:a5::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Thu, 19 Nov
 2020 18:16:38 +0000
Received: from DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:2b:cafe::5c) by DB6PR0801CA0055.outlook.office365.com
 (2603:10a6:4:2b::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Thu, 19 Nov 2020 18:16:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT064.mail.protection.outlook.com (10.152.21.199) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Thu, 19 Nov 2020 18:16:37 +0000
Received: ("Tessian outbound 082214a64d39:v71");
 Thu, 19 Nov 2020 18:16:37 +0000
Received: from 139024f62be8.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DEB8DDA8-E090-4097-B8ED-1B15336A3919.1; 
 Thu, 19 Nov 2020 18:16:31 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 139024f62be8.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 19 Nov 2020 18:16:31 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4538.eurprd08.prod.outlook.com (2603:10a6:10:d2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Thu, 19 Nov
 2020 18:16:29 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::39b7:6f9f:d046:e737]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::39b7:6f9f:d046:e737%7]) with mapi id 15.20.3564.028; Thu, 19 Nov 2020
 18:16:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=zZym=EZ=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kfoU8-0007wu-Sz
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 18:16:44 +0000
X-Inumbo-ID: 3fbd8aac-cb7a-4a67-8bee-3c91b337eb61
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown [40.107.22.66])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 3fbd8aac-cb7a-4a67-8bee-3c91b337eb61;
	Thu, 19 Nov 2020 18:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GdeZEekMGzCdA7djWe9NFePYVX0bCegyfXcvVcmjAFQ=;
 b=5mWBGa35ajBijxfh10H645djwCeva3O1+gwIH/8bY1lxQNsNApQJ1TQg9v7z1KgW/XxD5cNsCmq1LgulflbQGJpQiJh2F1kjRHsDpWVTaFL/WB3Z3TMGYs1KwyMdN9Ldm4G0bFTk6jp8GU630yodIlPsU5vJJapWFZvwsQfcHY0=
Received: from DB6PR0801CA0055.eurprd08.prod.outlook.com (2603:10a6:4:2b::23)
 by AM6PR08MB4024.eurprd08.prod.outlook.com (2603:10a6:20b:a5::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Thu, 19 Nov
 2020 18:16:38 +0000
Received: from DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:2b:cafe::5c) by DB6PR0801CA0055.outlook.office365.com
 (2603:10a6:4:2b::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Thu, 19 Nov 2020 18:16:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT064.mail.protection.outlook.com (10.152.21.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Thu, 19 Nov 2020 18:16:37 +0000
Received: ("Tessian outbound 082214a64d39:v71"); Thu, 19 Nov 2020 18:16:37 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d951ece8ce1573da
X-CR-MTA-TID: 64aa7808
Received: from 139024f62be8.3
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id DEB8DDA8-E090-4097-B8ED-1B15336A3919.1;
	Thu, 19 Nov 2020 18:16:31 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 139024f62be8.3
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 19 Nov 2020 18:16:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jcaM866MQ/7TisjluUVGNkXxCaxIQayS3mk3qk0HbMssFHqc6nZxctfO+0hBRoBhZx2A88PZFSLMKnTlyLFNTmDI6V0lJ1oQEBYU3LNqV+Om01Bc2eE14425ZNNgN0Iieo8HrOq6o2vTLwMkvZzUnPICNh3HIVmCBpkuiBROBlSpeS9t2CRy5oeIlHOISDV71bjpUXA5aLx9YZe/S6QPPwDMWghy1I2jgU8ggEuE3tGM49RGWgQgF7zR1X133lWxS+EPKsdZ7Gd6Yz19jQa6p6o9F2YOH+t7TL2AcWuGgVGfKWUq5+Y0vj4KC/bWvMMUtfKbalL3j8TQ/pgMf2TOFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GdeZEekMGzCdA7djWe9NFePYVX0bCegyfXcvVcmjAFQ=;
 b=hhYZBkSeiS7fSoiGOeQtOqbC8Fh7dkRGTALBVIB8T4LcKlp9L9QUgLvHD2uJn7nDcoxAdszZEHNWTeNRUrKQPQPRyxa3NiZJB+ibjdeNCPwWes02D+LGwyfWFoZSRZD/90SOefpRp2fSc2+JYJhgGyFvdL9sqTV6Qwq+RPW9IJzgOjlQK6+DSDHTM+oBHWNdUyii0S0HIHn4pos9xNNrFcXEKbvCE3iLxiadlZej5PWYaTp61wYz5OArtMIsqZdfiqqGW03YueFa4E8es6xSyZdogzSv/28LihmSOHCRpCtQUdEAj9+2XyFo9RkFgTHvPyhBlMPA9K5LBD1Ei1vZ7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GdeZEekMGzCdA7djWe9NFePYVX0bCegyfXcvVcmjAFQ=;
 b=5mWBGa35ajBijxfh10H645djwCeva3O1+gwIH/8bY1lxQNsNApQJ1TQg9v7z1KgW/XxD5cNsCmq1LgulflbQGJpQiJh2F1kjRHsDpWVTaFL/WB3Z3TMGYs1KwyMdN9Ldm4G0bFTk6jp8GU630yodIlPsU5vJJapWFZvwsQfcHY0=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4538.eurprd08.prod.outlook.com (2603:10a6:10:d2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Thu, 19 Nov
 2020 18:16:29 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::39b7:6f9f:d046:e737]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::39b7:6f9f:d046:e737%7]) with mapi id 15.20.3564.028; Thu, 19 Nov 2020
 18:16:29 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>, Andre Przywara
	<Andre.Przywara@arm.com>, Rahul Singh <Rahul.Singh@arm.com>, Julien Grall
	<Julien.Grall@arm.com>, Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH v4 2/3] xen/arm: gic: acpi: Use the correct length for the
 GICC structure
Thread-Topic: [PATCH v4 2/3] xen/arm: gic: acpi: Use the correct length for
 the GICC structure
Thread-Index: AQHWvpa0bDYxNRQRmUCSGRjy8i0s/KnPwwaA
Date: Thu, 19 Nov 2020 18:16:29 +0000
Message-ID: <03404C68-2415-47E9-AF4D-9B414EA07223@arm.com>
References: <20201119170829.9923-1-julien@xen.org>
 <20201119170829.9923-3-julien@xen.org>
In-Reply-To: <20201119170829.9923-3-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8ca2eedf-5ca8-4cf6-26eb-08d88cb74188
x-ms-traffictypediagnostic: DBBPR08MB4538:|AM6PR08MB4024:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB402470AE59AF9AA1232862259DE00@AM6PR08MB4024.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2000;OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 o8PcLM7FweEegvLXgpfWLoH7k5gPKxbvp3oGMj6qXkvHmVSRpK3mFbWKhWu9s6Ypxb6fHUmjWDYsUrG/X8Sf56D5mlRMwxJB5KCKJm79a9ATFwT154Em/9ItYcq/ULaA/7FfRAnJ6VE9aEXTM+g4TYIqeg4sJFaFoiCgDR71v+pdjn/zzPNB4NhyoaRzdpXochtHc9rIrWcrKm1llzMh9aAo/fkK3R1DLA/1uoW95J43SJ8WPTSLlW515S2QGlwxVeadDk+3ex1l7O11KmSEinwzX4KAxX0PvEODJX/rJ7b6V0ECq1lR2rZ/1MxxfALY7/ycsdHwOGRCqMB+uQKIwA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(346002)(366004)(396003)(2906002)(66446008)(66556008)(66476007)(6916009)(66946007)(8676002)(8936002)(71200400001)(6486002)(86362001)(76116006)(91956017)(36756003)(5660300002)(6512007)(33656002)(4326008)(54906003)(53546011)(6506007)(26005)(64756008)(186003)(2616005)(478600001)(83380400001)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 oIYFOITq05s0gmLF/aCMeWRgMy4Oktmc0tU+1MORm6/DZk0Rn1ZSpEy39lTqftWVLQwvhUUqulrm4vkP1SoAVfIVsRwo4/w9/As56KvR8EGDuwjJUgL1i6kHSzk+Z81EeMCVmFJ//+v89EUdrW0zo/P/qNDwjolBDfcawnYb+wPM7m6D79AbWxtMXCTuuWqxTsxuNjuIbGL2iHvhPsnYf0/aEpJi2Z9oye5Z6QEVU4RQYvylRw4VDGivak5P9CO6JeGF5XH6oELUU4OWL/nTQPtBi3xVRC7Api7de4cmtZ0aRlsMLrvYWpjuOof4MfIKu+rN253kHSUrkw+kK7gL4Tc3SW+499OnlPWl6w6YV0crdKtm/n9jo5JZGgajsBqvRDBMlczOLxL54i5mOJ88kr3IAouvRjfxcoJTY74DUuVSOr8vaXBxxoGrwUFeE76DfTIZYuaia0bJ3Z47J6saA9iFT27pkK66KpHEJ7EjlUf5mAADEML0oavuE6635HsxM7dZu5sbu6rLOaWW1/r2v5AEkDEsCOYVPuI4OSOTmtj18fX5W8gkO7wiyVFLf18R6vlwIwakH/o4cORfGAHbTRMQRZ3hRWtngXquX9Ig9bGt2vau0S1P9yTtomkBwgpfqk2damQvKYkMqgYYWY0hSw==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <241BFCD68BAD4D48837C8C1929398CC3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4538
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f7dbd83d-b8f2-4485-757b-08d88cb73c99
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XkMPZsIYnYDzGPFeZxEUd+L++JHghJBL+eHxazcl4ra8+yUq86qJmFoBh8NTtNtOFpAYmBDAxrsvqt7zhfvqpd0BFvl/kd87HV0kHn4u35iVu+u4U7Rm9qIUpsZMhUywTBhSJaUc4E25+7v4W1iSMkHqc8bNS6TMykX3l7yNGyLw580mqTXmd8VpmqVp+hPU3mtPhXXzQlA2eQ7T4UqngwkPAZNGEB7nWxr6QlecS0Y2+SESjMzQuHtWwA+kARnP+PpqQzsEQPB5fyMG+sZKfo1ZLyQef4iyL3Vb+kjeHV4xOk7SlMB1FjN1QutC70/WEuouIUKdVsVHcQ80qMyvNtiZr8ReGvoID6C1oWcrFG/vEBJ4rMtfsOVr+RTSvahxP51v3f5lmXv4DfhbZToT/A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39860400002)(396003)(46966005)(54906003)(36756003)(53546011)(83380400001)(8936002)(6506007)(107886003)(4326008)(478600001)(86362001)(33656002)(70586007)(70206006)(6862004)(47076004)(2906002)(5660300002)(8676002)(82740400003)(2616005)(316002)(356005)(6512007)(336012)(26005)(81166007)(6486002)(186003)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 18:16:37.9200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ca2eedf-5ca8-4cf6-26eb-08d88cb74188
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4024

Hi,

> On 19 Nov 2020, at 17:08, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <julien.grall@arm.com>
>=20
> The length of the GICC structure in the MADT ACPI table differs between
> version 5.1 and 6.0, although there are no other relevant differences.
>=20
> Use the BAD_MADT_GICC_ENTRY macro, which was specifically designed to
> overcome this issue.
>=20
> Signed-off-by: Julien Grall <julien.grall@arm.com>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> ---
>    Changes in v3:
>        - Update the commit title as we also modify GICv3 code
>        - Use the correct length in more places
>=20
>    Changes in v2:
>        - Patch added
> ---
> xen/arch/arm/acpi/boot.c | 2 +-
> xen/arch/arm/gic-v2.c    | 5 +++--
> xen/arch/arm/gic-v3.c    | 6 +++---
> xen/arch/arm/gic.c       | 2 +-
> 4 files changed, 8 insertions(+), 7 deletions(-)
>=20
> diff --git a/xen/arch/arm/acpi/boot.c b/xen/arch/arm/acpi/boot.c
> index 30e4bd1bc5a7..55c3e5cbc834 100644
> --- a/xen/arch/arm/acpi/boot.c
> +++ b/xen/arch/arm/acpi/boot.c
> @@ -131,7 +131,7 @@ acpi_parse_gic_cpu_interface(struct acpi_subtable_hea=
der *header,
>     struct acpi_madt_generic_interrupt *processor =3D
>                container_of(header, struct acpi_madt_generic_interrupt, h=
eader);
>=20
> -    if ( BAD_MADT_ENTRY(processor, end) )
> +    if ( BAD_MADT_GICC_ENTRY(processor, end) )
>         return -EINVAL;
>=20
>     acpi_table_print_madt_entry(header);
> diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
> index 581ea5ba6b2c..b2adc8ec9a64 100644
> --- a/xen/arch/arm/gic-v2.c
> +++ b/xen/arch/arm/gic-v2.c
> @@ -1136,7 +1136,8 @@ static int gicv2_make_hwdom_madt(const struct domai=
n *d, u32 offset)
>=20
>     host_gicc =3D container_of(header, struct acpi_madt_generic_interrupt=
,
>                              header);
> -    size =3D sizeof(struct acpi_madt_generic_interrupt);
> +
> +    size =3D ACPI_MADT_GICC_LENGTH;
>     /* Add Generic Interrupt */
>     for ( i =3D 0; i < d->max_vcpus; i++ )
>     {
> @@ -1165,7 +1166,7 @@ gic_acpi_parse_madt_cpu(struct acpi_subtable_header=
 *header,
>     struct acpi_madt_generic_interrupt *processor =3D
>                container_of(header, struct acpi_madt_generic_interrupt, h=
eader);
>=20
> -    if ( BAD_MADT_ENTRY(processor, end) )
> +    if ( BAD_MADT_GICC_ENTRY(processor, end) )
>         return -EINVAL;
>=20
>     /* Read from APIC table and fill up the GIC variables */
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index 2a344393a0e4..ac28013c1967 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -1499,7 +1499,7 @@ static int gicv3_make_hwdom_madt(const struct domai=
n *d, u32 offset)
>=20
>     host_gicc =3D container_of(header, struct acpi_madt_generic_interrupt=
,
>                              header);
> -    size =3D sizeof(struct acpi_madt_generic_interrupt);
> +    size =3D ACPI_MADT_GICC_LENGTH;
>     for ( i =3D 0; i < d->max_vcpus; i++ )
>     {
>         gicc =3D (struct acpi_madt_generic_interrupt *)(base_ptr + table_=
len);
> @@ -1558,7 +1558,7 @@ gic_acpi_parse_madt_cpu(struct acpi_subtable_header=
 *header,
>     struct acpi_madt_generic_interrupt *processor =3D
>                container_of(header, struct acpi_madt_generic_interrupt, h=
eader);
>=20
> -    if ( BAD_MADT_ENTRY(processor, end) )
> +    if ( BAD_MADT_GICC_ENTRY(processor, end) )
>         return -EINVAL;
>=20
>     /* Read from APIC table and fill up the GIC variables */
> @@ -1628,7 +1628,7 @@ gic_acpi_get_madt_cpu_num(struct acpi_subtable_head=
er *header,
>     struct acpi_madt_generic_interrupt *cpuif;
>=20
>     cpuif =3D (struct acpi_madt_generic_interrupt *)header;
> -    if ( BAD_MADT_ENTRY(cpuif, end) || !cpuif->gicr_base_address )
> +    if ( BAD_MADT_GICC_ENTRY(cpuif, end) || !cpuif->gicr_base_address )
>         return -EINVAL;
>=20
>     return 0;
> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> index fe60619e99cf..3b0331b53830 100644
> --- a/xen/arch/arm/gic.c
> +++ b/xen/arch/arm/gic.c
> @@ -454,7 +454,7 @@ unsigned long gic_get_hwdom_madt_size(const struct do=
main *d)
>     unsigned long madt_size;
>=20
>     madt_size =3D sizeof(struct acpi_table_madt)
> -                + sizeof(struct acpi_madt_generic_interrupt) * d->max_vc=
pus
> +                + ACPI_MADT_GICC_LENGTH * d->max_vcpus
>                 + sizeof(struct acpi_madt_generic_distributor)
>                 + gic_hw_ops->get_hwdom_extra_madt_size(d);
>=20
> --=20
> 2.17.1
>=20


