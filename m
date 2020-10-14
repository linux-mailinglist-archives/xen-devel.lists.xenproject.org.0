Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7525028E3A7
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 17:55:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6806.17932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSj7U-0001GW-Ub; Wed, 14 Oct 2020 15:55:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6806.17932; Wed, 14 Oct 2020 15:55:16 +0000
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
	id 1kSj7U-0001GA-Qu; Wed, 14 Oct 2020 15:55:16 +0000
Received: by outflank-mailman (input) for mailman id 6806;
 Wed, 14 Oct 2020 15:55:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JG+m=DV=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kSj7T-0001G5-IQ
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 15:55:15 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.74]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ffc447e3-215f-4cdc-81bc-beff4f21a70c;
 Wed, 14 Oct 2020 15:55:13 +0000 (UTC)
Received: from DB7PR05CA0018.eurprd05.prod.outlook.com (2603:10a6:10:36::31)
 by DBAPR08MB5591.eurprd08.prod.outlook.com (2603:10a6:10:1ae::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Wed, 14 Oct
 2020 15:55:12 +0000
Received: from DB5EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::e1) by DB7PR05CA0018.outlook.office365.com
 (2603:10a6:10:36::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23 via Frontend
 Transport; Wed, 14 Oct 2020 15:55:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT040.mail.protection.outlook.com (10.152.20.243) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21 via Frontend Transport; Wed, 14 Oct 2020 15:55:10 +0000
Received: ("Tessian outbound 7c188528bfe0:v64");
 Wed, 14 Oct 2020 15:55:10 +0000
Received: from cd05838f7509.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8C3E78A7-7546-4D70-998F-DC51775CF148.1; 
 Wed, 14 Oct 2020 15:54:37 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cd05838f7509.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 14 Oct 2020 15:54:37 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4538.eurprd08.prod.outlook.com (2603:10a6:10:d2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.26; Wed, 14 Oct
 2020 15:54:36 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3477.021; Wed, 14 Oct 2020
 15:54:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=JG+m=DV=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kSj7T-0001G5-IQ
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 15:55:15 +0000
X-Inumbo-ID: ffc447e3-215f-4cdc-81bc-beff4f21a70c
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown [40.107.4.74])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ffc447e3-215f-4cdc-81bc-beff4f21a70c;
	Wed, 14 Oct 2020 15:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OPJ4JDGdfSEEPY+sdPSqpfvJrXxoA9gK1629yUz9FtI=;
 b=oB6m6rmKn2KpB/R+N2WjcCaJxHzhJhDHMmcevKBoxUH461le/tfKxpBM0tR+H1So0MUgOChHZm27n53VsHwutJsJfB3q5ZyBDeyMFy8rhY1YMfEdaSK9rWPQRgOXhc4Rd0hBuYZkL8S8QvuuCWVvThP2LdBgAhI0hXVM6xIxfCQ=
Received: from DB7PR05CA0018.eurprd05.prod.outlook.com (2603:10a6:10:36::31)
 by DBAPR08MB5591.eurprd08.prod.outlook.com (2603:10a6:10:1ae::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Wed, 14 Oct
 2020 15:55:12 +0000
Received: from DB5EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::e1) by DB7PR05CA0018.outlook.office365.com
 (2603:10a6:10:36::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23 via Frontend
 Transport; Wed, 14 Oct 2020 15:55:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT040.mail.protection.outlook.com (10.152.20.243) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21 via Frontend Transport; Wed, 14 Oct 2020 15:55:10 +0000
Received: ("Tessian outbound 7c188528bfe0:v64"); Wed, 14 Oct 2020 15:55:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5f753e88ab794ec3
X-CR-MTA-TID: 64aa7808
Received: from cd05838f7509.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8C3E78A7-7546-4D70-998F-DC51775CF148.1;
	Wed, 14 Oct 2020 15:54:37 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cd05838f7509.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 14 Oct 2020 15:54:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QvsRFy0QKGsdNdcPjrLIQJznDwVHdnXGX++PRFBZ1dcOxDsNN68BffUrRpoSzcKI3q8ivsbPw8DvsddbjpMIgg5bLMVTaUkeY5Hm5SCBrc+kJf2poS1pHZ9P4Q8sDSnaa20j63KnWwjW2GrFb5HvJpuy03HFiE/gUhC448NaQEsIm5aGs/4now4ykOcCdb/aXWyn7/1yUgB6c+X5T79gGHG51n8Xkdd6uxqVO6OlzS77U6naqVxfzwyKrGyMJLscjOhj4KTwFB3BGEa6yGKGhszx0wH+OtsZVY2pGuYx1x+kkkeNIGnQDaYwX7ln5OU0v1wHQ4N1JaLILGlNecSaSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OPJ4JDGdfSEEPY+sdPSqpfvJrXxoA9gK1629yUz9FtI=;
 b=aXWR9rgnlIiGFrFIwZmsfg5kxm/MEqVGVEP7SNwcvF8s6irWNRFLeF1b2avLZdgVnJRMDtxLILqDs/O/6psMlV9Z4i62bdsJrB67mArF2/mYaDscg/1L6RDhzvKdhKYgSkwn1AEifDVMVhpxC9vMIQe3Chac4wyMQD/SDVNXLSYvmMaQM5BuNQP85qqzhjPh7tW74Fmr9E9r1ovTItTCAQU6CWZ6Om228mzkveDYEGiWQiUS3DFBN+V5FZZhhdUHdsc5iSRVBXUhBuLQYeOu4GFjg1izyLJ5aJlUGagNEW8AyZaaTWa7VHpNTgfvTEMIc4tjofdtHcggZsW62HQR1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OPJ4JDGdfSEEPY+sdPSqpfvJrXxoA9gK1629yUz9FtI=;
 b=oB6m6rmKn2KpB/R+N2WjcCaJxHzhJhDHMmcevKBoxUH461le/tfKxpBM0tR+H1So0MUgOChHZm27n53VsHwutJsJfB3q5ZyBDeyMFy8rhY1YMfEdaSK9rWPQRgOXhc4Rd0hBuYZkL8S8QvuuCWVvThP2LdBgAhI0hXVM6xIxfCQ=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4538.eurprd08.prod.outlook.com (2603:10a6:10:d2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.26; Wed, 14 Oct
 2020 15:54:36 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3477.021; Wed, 14 Oct 2020
 15:54:36 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Wei Liu <wl@xen.org>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, "jgross@suse.com"
	<jgross@suse.com>, Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH v3 1/2] tools/libs/stat: use memcpy instead of strncpy in
 getBridge
Thread-Topic: [PATCH v3 1/2] tools/libs/stat: use memcpy instead of strncpy in
 getBridge
Thread-Index: AQHWnLHiDj1hArywQEGBhk10fWLXEamW+IUAgABQzQCAAAHqgA==
Date: Wed, 14 Oct 2020 15:54:36 +0000
Message-ID: <94190674-32DB-4317-9368-7F5E9906160D@arm.com>
References:
 <4ecb03b40b0da6d480e95af1da8289501a3ede0a.1602078276.git.bertrand.marquis@arm.com>
 <A6CDE62A-13F4-491B-BE0B-180657136504@arm.com>
 <20201014154744.j56skud26v5iwenx@liuwe-devbox-debian-v2>
In-Reply-To: <20201014154744.j56skud26v5iwenx@liuwe-devbox-debian-v2>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9afdb485-d845-4a4a-5023-08d8705987c8
x-ms-traffictypediagnostic: DBBPR08MB4538:|DBAPR08MB5591:
X-Microsoft-Antispam-PRVS:
	<DBAPR08MB55915A31912E7ABE3736D6CF9D050@DBAPR08MB5591.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:1775;OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 tJJYkYsrouoQmvk0hSPl/mq49Mc2dBn1OJC/MA9O/BvhGLfLlRWLs574y5ZcfbBkBEKSvlx2G3uIpa6iE9X1MnVKBLi7Aa4YTlwpSG7CpKFuWzm/hUl9jAURu/jJWbq73R6cxB9ZG9/Xqz/QGFunIAzh7ZxtUf0DQzMGIgk9/vUGTkZkjqSxJBhGnsBHmlQ1cnbZOwqZTGoBTkYxyc6tyXA3OXZYHC95kDhsoxkAnM7rt4SRKb1o4xo76l1gXynRxCPaFu+ENhlukTf0CSXIvH9QaUMP2eYrOnQh1VskVzr/N2d4WnJs7epZYPSP+8CFIT8KulbEpe2HN4HXL3iqyA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(346002)(136003)(376002)(396003)(36756003)(6512007)(558084003)(33656002)(4326008)(26005)(53546011)(186003)(8676002)(6506007)(8936002)(2906002)(478600001)(66946007)(76116006)(71200400001)(66476007)(66446008)(64756008)(66556008)(5660300002)(2616005)(6916009)(86362001)(54906003)(316002)(6486002)(91956017);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 dd9RDhcxJTRTUAekTQLymt37Mgz06xz+V9rOddndOfsiDHlPbF6oOQ6tnOQ7nGn+aR+/TcXO98XNfplTR64D9/BAp3glrace076SIpWSzWCvjOufo19/2cPcwurn3pvhJOq5Oli0ajL5mw98ze6DzefnCbLNdnqp9LCL4/0ZxajVNHJNBZzjp7H+zpAhzTK6phpHm/e/h1kvx0yZYhkkRFlyBtZxUe0s0QXNyY2FAofhjmpAMZyz5eJcaGpRapj6YH7rMbwMkyGgKWuR0fOpmlL+rBNFHlsM/Dw+KeOA+xLeNaR+AMLRdIt3LOsa2s2eERi+1Ym9ngAwJxhub1hQbrU4ZzuFEShyCzhQ4bwZP7O31uYdT9zvOqD5HyLvc77kL5GHKgS0bRoJE/3wH3SEhBY+UhqwvUOJ1slirzYkSipbmbo00g7lb/CabW3jERkVb4Acg/APsqmEa1Or8Wb0PvxblVCaBSgLah8evUd46w4+cUBmQhdXGur0RSLhbZGgv1rNgUY9gVxrKDaMlVIkGZZNahSDM2Pd0M8KF576bHsYyaGTAIryilY/p4u29QmoM49i1tB+oeowdCKhMUMdR+J6KKbZBxHpAQyLI4DmP9U7CRxmwHzQ9vTo5xNzH/kySybFaje2+qDCiETpdPUtow==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D439CB9BBC0F3D4FAD83DF3DBFCB9566@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4538
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d1192e51-e6bb-43e3-57ff-08d87059734a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Mjl1P3t14itDTgj3WidtQTlpc7j2IbAqBg/8T15e/5jUXL/j9ltJQKaQYWoY6OV02fp5CQTjyilkbHFIXhQzHmhr4umUKfL6siRGr3jus/VZ0z76MklYbOkp3P6zPvej096v0I6h+lKzg32GiDGkONJK7MZORMHxtwHnTPWvibRTYlz1Ax4Y8mbca4x/jYB039F9JYh7sEfGbKDEM4uhshCrHQ00Ei7EoLg7bNsLfloS1N6H0CUUueC0NHEmaByJoBHmG70xHmzCmFJz/ciP0BIPz9guyYMxwwFG3QcGhQDZst1u09gwy47NycVcwHojI+BKnMRa/oxzAS5k1uCiTecdtwe1kdTBdZvi74QsGDh1yV1wXrOqTe40a9rUoYbMTSFrzz6DxUDB8GUsj4gTDA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(39860400002)(136003)(46966005)(5660300002)(8936002)(6862004)(36756003)(54906003)(8676002)(33656002)(316002)(6486002)(478600001)(558084003)(6512007)(4326008)(2906002)(2616005)(336012)(53546011)(26005)(6506007)(186003)(47076004)(82310400003)(70206006)(70586007)(81166007)(356005)(86362001)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2020 15:55:10.5307
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9afdb485-d845-4a4a-5023-08d8705987c8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5591



> On 14 Oct 2020, at 16:47, Wei Liu <wl@xen.org> wrote:
>=20
> On Wed, Oct 14, 2020 at 10:58:33AM +0000, Bertrand Marquis wrote:
>> Hi,
>>=20
>> Could this be reviewed so that gcc10 issues are fixed ?
>=20
> I think Juergen's comments have been addressed.
>=20
> Acked-by: Wei Liu <wl@xen.org>

Thanks :-)

