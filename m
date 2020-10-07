Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E95286054
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 15:39:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3516.10095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQ9ex-0008WD-Fb; Wed, 07 Oct 2020 13:39:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3516.10095; Wed, 07 Oct 2020 13:39:11 +0000
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
	id 1kQ9ex-0008Vo-CO; Wed, 07 Oct 2020 13:39:11 +0000
Received: by outflank-mailman (input) for mailman id 3516;
 Wed, 07 Oct 2020 13:39:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MWE0=DO=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kQ9ev-0008Vj-RA
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 13:39:10 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1f::623])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0c5804a8-3a8c-4509-bd6b-467308179d7a;
 Wed, 07 Oct 2020 13:39:07 +0000 (UTC)
Received: from DB6PR0802CA0030.eurprd08.prod.outlook.com (2603:10a6:4:a3::16)
 by DB6PR0801MB1718.eurprd08.prod.outlook.com (2603:10a6:4:2f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Wed, 7 Oct
 2020 13:39:05 +0000
Received: from DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a3:cafe::22) by DB6PR0802CA0030.outlook.office365.com
 (2603:10a6:4:a3::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23 via Frontend
 Transport; Wed, 7 Oct 2020 13:39:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT030.mail.protection.outlook.com (10.152.20.144) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Wed, 7 Oct 2020 13:39:05 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64");
 Wed, 07 Oct 2020 13:39:04 +0000
Received: from 14f441f6c012.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C9942248-C7EB-455B-BFC3-EEACB07D8A39.1; 
 Wed, 07 Oct 2020 13:38:37 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 14f441f6c012.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Oct 2020 13:38:37 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0801MB1799.eurprd08.prod.outlook.com (2603:10a6:4:3a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Wed, 7 Oct
 2020 13:38:35 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3455.023; Wed, 7 Oct 2020
 13:38:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MWE0=DO=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kQ9ev-0008Vj-RA
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 13:39:10 +0000
X-Inumbo-ID: 0c5804a8-3a8c-4509-bd6b-467308179d7a
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown [2a01:111:f400:fe1f::623])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0c5804a8-3a8c-4509-bd6b-467308179d7a;
	Wed, 07 Oct 2020 13:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PK77OV8/GB8TglcADKjZCm5195Qv3S+HIUiX4hwY+sg=;
 b=zPa97zxbWDOCkhZRb7fQJD8oBRB3O49XIDsnFdZlnZJUNHcFnSResCCga6xJrUhOECaSEATRd8XrFwgK7S6vt0ItZTfvwMdNj+TJjsTm9d9UvzMlbdANIDkiub0YvcyWHjqLSmbYY2akAnPA51lHfb8DH1skvGNyjQSkHJxCmqc=
Received: from DB6PR0802CA0030.eurprd08.prod.outlook.com (2603:10a6:4:a3::16)
 by DB6PR0801MB1718.eurprd08.prod.outlook.com (2603:10a6:4:2f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Wed, 7 Oct
 2020 13:39:05 +0000
Received: from DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a3:cafe::22) by DB6PR0802CA0030.outlook.office365.com
 (2603:10a6:4:a3::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23 via Frontend
 Transport; Wed, 7 Oct 2020 13:39:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT030.mail.protection.outlook.com (10.152.20.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Wed, 7 Oct 2020 13:39:05 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64"); Wed, 07 Oct 2020 13:39:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 065025cdfa2faf93
X-CR-MTA-TID: 64aa7808
Received: from 14f441f6c012.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C9942248-C7EB-455B-BFC3-EEACB07D8A39.1;
	Wed, 07 Oct 2020 13:38:37 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 14f441f6c012.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 07 Oct 2020 13:38:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=It/dmHnwcPXuvLjP2DNIFaY9dmuoOK1OK+GHV+pO4NpfXBcR7kMUyU7gckZTFNr4GXuHX5mj0EnbYO1pVAo3jAiiyhJFzchoI8J+T5WQ/wEQ/XYRMls+5T9s9214zisi+N00KoMaGL8N+FV1mUGtoWn8Oe1jJ4ZQUzpHOpP2Bhp7KoqxkavfexZOoOqPDqxKbyHvv9qyGxebdVKkNy+bMXhLoN1Mtnm3pHjKzi4SEq56HNAf0tdKuDIxPU49FjE3vHKCSJ1OdXRbMv6FahuzDrb0QfhX3dMipBVuKHhe914fhABbTpbqD6+ueE92IBfXsx8HnqMptb/vZ743FBkdog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PK77OV8/GB8TglcADKjZCm5195Qv3S+HIUiX4hwY+sg=;
 b=V5kyYx+X7/pP3KuR8nUibta5rjPJuCUyy5fnqQbmLcq8ZELocOiDqUrtuMFfiFjq+gKM8cTdmGXaJSBWth/ohLXwwMf1Uh7xqeLPXKh6QBPk+Cl7/bVSoPWpEzW6wsBmPqbIKxiRJ7da+30YSEKew4KAUctzNjQoycsBxIe+8uKjZ7KebMNigSFVS1YDffcx1589UyaEwrbhqLKeiQt4qMkoXXNySglDcAOZnCFQBEDALxpq4YCvTx8bA35pPAizHNsU3544R7LgKHmrV5YUfFGrTC04yM37K+JdE/SYcd1zNWgyf0z0oH6f+Vaq/MLjxpsgr9uc/sKYMDQTjzWuvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PK77OV8/GB8TglcADKjZCm5195Qv3S+HIUiX4hwY+sg=;
 b=zPa97zxbWDOCkhZRb7fQJD8oBRB3O49XIDsnFdZlnZJUNHcFnSResCCga6xJrUhOECaSEATRd8XrFwgK7S6vt0ItZTfvwMdNj+TJjsTm9d9UvzMlbdANIDkiub0YvcyWHjqLSmbYY2akAnPA51lHfb8DH1skvGNyjQSkHJxCmqc=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0801MB1799.eurprd08.prod.outlook.com (2603:10a6:4:3a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Wed, 7 Oct
 2020 13:38:35 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3455.023; Wed, 7 Oct 2020
 13:38:35 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: print update firmware only once
Thread-Topic: [PATCH] xen/arm: print update firmware only once
Thread-Index: AQHWnJnyoImxa+IrX0SG4dJuPztv2amMGmgAgAAKsQA=
Date: Wed, 7 Oct 2020 13:38:34 +0000
Message-ID: <ED56185C-10BA-4A33-9273-8DBD68900AAB@arm.com>
References:
 <09d04b34e6b3b77ac206a42657b1b4116e7e11f3.1602068661.git.bertrand.marquis@arm.com>
 <4b3135ff-4795-e189-0430-da5627419e4e@xen.org>
In-Reply-To: <4b3135ff-4795-e189-0430-da5627419e4e@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 833f6051-dbc3-4ea6-7927-08d86ac65bdb
x-ms-traffictypediagnostic: DB6PR0801MB1799:|DB6PR0801MB1718:
X-Microsoft-Antispam-PRVS:
	<DB6PR0801MB1718A85139C60A83858D73AB9D0A0@DB6PR0801MB1718.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 AUE5o99U5ZoDixyfuo5NCkTywmKlTf0AJ4wRxtPtMUjde6OagGlzj+2eoMBRGBlkcSITZYGyuzt82Ry6CZzmImhm/8ZBzAFJjJjjQoZ3dJD7w01pl/RqLaBvaTpeHqbiZi5ZneJWrgr7Sc/+e9+K1fDUscgByCLyzP4dMWff+cdu3zXmYljZzLEMweUi3UlyyffygJDFuKJQLfxfw++Nw6Eg3ih7rasN7Fzxhl0Hing+0p0gT0ug9wT0P1xY5PzEv67gOJhPWjFMAiSqgbsEMbcZVCX+ZXcARu5GblyxWb7NlJB2z2+IbxlvGsEYzHe1
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(26005)(186003)(71200400001)(316002)(2616005)(91956017)(54906003)(5660300002)(2906002)(76116006)(83380400001)(6506007)(66446008)(64756008)(66476007)(53546011)(66946007)(66556008)(8936002)(478600001)(86362001)(36756003)(8676002)(6916009)(6512007)(15650500001)(33656002)(6486002)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 Ah619DZ42B8asoykGnlfiI6lHoUQ6ckBAHyDmwLehDVONWlrTFwQ8DV1oNiB7lRD/q48BgIx68O68UNQCxisiDqXLf+eFUcLe/XmRXhQQ6SdsjQ1NakAxZXsbxdwz2oN12iFKUint1AgkErBanJkN6w3xnzx0kpRjaflFzVMqv7+UMGgokqd4OjaGvkirWmialg0f3NMTwE+b37FRYFBvluf/3O0SzEw47ea4o79fMdIdoVK2oxEIsxTMGyav1jisylH4JTZfA3e+oXgcDThCsrUd5chsUB/4dJE1nwLqd7dfyZcdnUr15BBlqzuIgYGrsJx6vkeMmOsxvaMVPgltWX2ajCLKHZU2sMlvTvJprL4+pO+q7nHMc490d1gjH8dalSCf67Yh3DZuSUG1enwAgRa5PwzvIidoJlcIzoHzYPLPZwXkvJVVjbxMVrJv/HZ4NoLbwMF+O6O5uQOgSBoVyej8Mn2DBDJNllRvEcZrxcP2Pj0ZNINEcCb1sxjB0nAQkyhsyUIhVAPlh489TdchpHL8MTzrGBf9zdF5M5HpLD7kVHPw1AnTzOEwuMIIQL5/hD4Yzw2EsrofMeqWNOGep7ZDXDu4vSdcgGHSnKxULeMoNWe4X9U841q9OwnAZ86hTBZbE8HHhuLqj9WYqbjuQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C0C7928BC2C2D94EA5FC4BA61F50E475@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1799
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0f27e7ae-38a5-46a2-d464-08d86ac64a11
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uW2YUZ3OFP0i7Mtpp2J5QdYzaskz/WKbejhIoPX9IXB1PriGg0Lj3G8QvMTFrcVLcyetymMhybBdv+7bXLu6z0Gu7SemFOGbTeDCOgYTXxgtK2f3L3XtU0M8uMNHpRFutg7BgSO1JD9zPxJfiSX67u+pWJWCFkNeRr0e6m3xg17tM+hjv67SFnncP1LCD/5l3vkOx6nms7RUqhJI1BUC8MNWygZxDz6vMci2QBgb7cgmCaV2zW1WBsFTFTgOmI+lWntTqetS/ROVs7NdBfytNO8/+p5y+c+zW5zbvV/nkXVrQ0+kITQqRoGoEJeFkKT/Vwr3/jzVQa3ExlJGnaGz+/nzgJthtC5hOKeLoz20Om+WqXkFmJMJJ0dBH0Q/UB3nT9ep0Ug+rbU2oZC/CQzvCA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(39860400002)(136003)(46966005)(6486002)(2616005)(186003)(107886003)(8676002)(6512007)(82310400003)(336012)(316002)(4326008)(6862004)(8936002)(54906003)(53546011)(26005)(6506007)(33656002)(83380400001)(47076004)(478600001)(70206006)(70586007)(81166007)(86362001)(5660300002)(2906002)(356005)(36756003)(15650500001)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2020 13:39:05.0034
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 833f6051-dbc3-4ea6-7927-08d86ac65bdb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1718



> On 7 Oct 2020, at 14:00, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 07/10/2020 12:05, Bertrand Marquis wrote:
>> Fix enable_smccc_arch_workaround_1 to only print the warning asking to
>> update the firmware once.
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>>  xen/arch/arm/cpuerrata.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
>> index 6c09017515..0c63dfa779 100644
>> --- a/xen/arch/arm/cpuerrata.c
>> +++ b/xen/arch/arm/cpuerrata.c
>> @@ -187,7 +187,7 @@ warn:
>>          ASSERT(system_state < SYS_STATE_active);
>>          warning_add("No support for ARM_SMCCC_ARCH_WORKAROUND_1.\n"
>>                      "Please update your firmware.\n");
>> -        warned =3D false;
>> +        warned =3D true;
>=20
> Thanks for spotting it. It looks like I introduced this bug in commit 976=
319fa3de7f98b558c87b350699fffc278effc "xen/arm64: Kill PSCI_GET_VERSION as =
a variant-2 workaround".
>=20
> I would suggest to add a fixes tag (can be done on commit).

If you can do it during the commit that works for me.

>=20
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Thanks

Cheers
Bertrand


