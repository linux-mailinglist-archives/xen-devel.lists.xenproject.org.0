Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B825234611
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 14:46:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1UQ4-00008I-Hb; Fri, 31 Jul 2020 12:45:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wy6+=BK=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1k1UQ3-00008C-Ld
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 12:45:51 +0000
X-Inumbo-ID: c30a8878-d32b-11ea-8e30-bc764e2007e4
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.75]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c30a8878-d32b-11ea-8e30-bc764e2007e4;
 Fri, 31 Jul 2020 12:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IC0wdRqlD+X+NTgBdv+ZJU48FRWliKfhdryxchVH1vA=;
 b=qceycvUIXnCon2Jid+yCN/HP2TptC7qoDGlWhCRSd/G3vareln/NiOlA5tWSmeIQaO2dB0jbXBGSTS8MBZFN+sOvjypkG4J2sxalnZ0uIsooJ6oht4kdP8tAxkff3qCIhbNzsJFoM3L/8utAKpjHnXbhPUgkEcKA183GyO12jjI=
Received: from AM6PR0202CA0048.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::25) by VE1PR08MB4799.eurprd08.prod.outlook.com
 (2603:10a6:802:ad::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Fri, 31 Jul
 2020 12:45:47 +0000
Received: from AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:3a:cafe::d5) by AM6PR0202CA0048.outlook.office365.com
 (2603:10a6:20b:3a::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Fri, 31 Jul 2020 12:45:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT027.mail.protection.outlook.com (10.152.16.138) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.17 via Frontend Transport; Fri, 31 Jul 2020 12:45:47 +0000
Received: ("Tessian outbound 1c27ecaec3d6:v62");
 Fri, 31 Jul 2020 12:45:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 64d9592e3f24aece
X-CR-MTA-TID: 64aa7808
Received: from 91b45e3dd659.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 123D7306-C593-4828-B77D-9C3B6A60C2B5.1; 
 Fri, 31 Jul 2020 12:45:41 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 91b45e3dd659.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 31 Jul 2020 12:45:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M7Pl4tMcdi3jdsUxi59YIUUxv4naKqlGlniVnzMQ8PRS1AjOsoepTW2WOU+JFkj+isZuYf9eN+oLHOqdKYecpE+HbJasEi6YVNL++2z+msUVdg8B2d4uYdS2IasO3tzjLGl/magTtHB3svqlxHZ5IQdbxvcwJlm0PR+gVsGWzme9hqHdtJwQhocrz2Ei9xB2+Pqyto8Wn032Iyu+U1rncCElhS4NoUC25mKj9jIOgrH0I4f9RrOkwTIW/daGkb6BTg6mkGjTx7Qh627gewylyBFOK1CvrraFP9BdNhU47zA9390Ob8ZiXwqXLt3T6H/Cb0CSQWjF0F+GPIOlS3HpMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IC0wdRqlD+X+NTgBdv+ZJU48FRWliKfhdryxchVH1vA=;
 b=Pgx06HUmIUpWOklOPf1J24HKbtwEtC5JFxnQNSFX2GYieuJQM1mF3ioIrtur0wG/IB5V9rMupgQzTyscfVwk3p2uvgAqSqAZ1xWOuP9vX1SkF0nDjpBVZ6WaHDrGVJlYDOcHMZhZkqQyAVrQ7HquYalR4MZP7M//Lt8AC0Ov6I2YKI94LCde5HP9xLcXttYUPOzB6GdZW0MEh+npzLv6xvWNoCD5HYJTqUcNFNWSNQIEDOJrDgQ7Ya6QYegWCIjBV8JumIEENqdYl48fmiS3RlKZG+Bab3rYYLPLVZXFPnAwNXkfr+J8YnzFvsnRy//9tiJduCeVtKhOPrz7oe4mCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IC0wdRqlD+X+NTgBdv+ZJU48FRWliKfhdryxchVH1vA=;
 b=qceycvUIXnCon2Jid+yCN/HP2TptC7qoDGlWhCRSd/G3vareln/NiOlA5tWSmeIQaO2dB0jbXBGSTS8MBZFN+sOvjypkG4J2sxalnZ0uIsooJ6oht4kdP8tAxkff3qCIhbNzsJFoM3L/8utAKpjHnXbhPUgkEcKA183GyO12jjI=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3850.eurprd08.prod.outlook.com (2603:10a6:10:7b::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.18; Fri, 31 Jul
 2020 12:45:39 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3239.020; Fri, 31 Jul 2020
 12:45:39 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [RESEND][PATCH v2 5/7] xen: include xen/guest_access.h rather
 than asm/guest_access.h
Thread-Topic: [RESEND][PATCH v2 5/7] xen: include xen/guest_access.h rather
 than asm/guest_access.h
Thread-Index: AQHWZp4X4KUogf6E0E+1j1OVzKuR+6kho78A
Date: Fri, 31 Jul 2020 12:45:39 +0000
Message-ID: <63792F54-60FD-41C0-A28A-0C3673349CFB@arm.com>
References: <20200730181827.1670-1-julien@xen.org>
 <20200730181827.1670-6-julien@xen.org>
In-Reply-To: <20200730181827.1670-6-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [90.126.203.125]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 94086750-2ea6-407f-bb10-08d8354fa5ab
x-ms-traffictypediagnostic: DB7PR08MB3850:|VE1PR08MB4799:
X-Microsoft-Antispam-PRVS: <VE1PR08MB47993881BC82A4ABF0586B5A9D4E0@VE1PR08MB4799.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: DIW0nmLnpJBA6+Qc5ESTsE61xTU0VJvHlMv3WsLG1Znp/nrgujg7SWLsUZ4I2+cmrs265cZ5sgI909R+8so8cMZSsf0qOtboXIeOnWim6NAvPpHU4eGRGhT8/me2XKx2aZT5A0NseytjhcV1bMb7Gzdt/NFaaKbkCjOrsUmCaWLprvypUtL3X4gEGziVT9+OsM/td9MlbPZ0fe5aCmVgBjo+5iwhZSox/6VOkT5nKqGMOwngFwtTKyMU0z8Y6UrOphRdGGlcsMX5C+HEgxeGCd4Y7AeKwaZdU06DP1nBlqJIV8rLRle0kk8ws5itnGB/4xGMUYgHdLzhR+zWusufI3z4eHrTz0YNzSqPprIWiO1kRgSGW2It5P5DOkRQJ2LuqimmTKCqBkBt2qS5IWfl1Q==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(6486002)(478600001)(54906003)(71200400001)(76116006)(66946007)(8936002)(316002)(53546011)(6506007)(91956017)(36756003)(7416002)(86362001)(8676002)(6512007)(5660300002)(83380400001)(2906002)(2616005)(33656002)(66476007)(66556008)(26005)(64756008)(66446008)(186003)(4326008)(6916009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: VlpwYGpnJw4uO41M+OPmPT6mrYOmO3b1hqjebSn470CRsra2X+q9OSUFqDdciPguHBUQu3O4+JoSy6GLSN2nH1PFPb49FfvOL/W5pTxGoVi9LFASD3EgRfJA2UibGxswli/oj/MzJ9a63upfzx1Yf+VwEG9b7tmExGM/CCuZrav648c8jKg7pzm2ChrqkuDjtYaPJ+eCQccL9pgyyG+yVBCj3ppjImK666fFm4ElS4283f01yADezH8r4gqpeDY+LVnvJLN9f2dazm+vnLS9gt6OuazI47744nUQKvBT3vY3dVgghb9K/HZYm2s2JRgphIkjNm8QIdNlMju54lgEBAs6+wwqcW+cNi0c1zaRs/5FdGVzmwmDfnzqzd9JoHD1w4selfAwkINKTXEUemwhsQSJMd6uwQkXxkv2DTbCGflPZiqP8cOa36ggFS3E/gZJxe7IGPe4bpH50l/p8xCxUixtndvi8BIAJ99vI9HwEmlRIqrWuEh+KM6LBFbQQ5/7sR/u0oQt3RZSrFowLhTHrFDnEwBG7Pl5Wy69bys6tKrlj9JG3Fd5oi2nAx3YzIdRMl9sayvmXxuxrdyNJRFAbaoovbWpYPmiT/koZNFlv5Wc8UT7TfHSNZGxt1pNrEsv2FIKRUjc5dmAxVrj3+2RYw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <68B2DDD0622C1D4BA3A8AA7212506F52@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3850
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: f7c30a50-b27f-4ccc-9842-08d8354fa0ed
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ugIzJN0rvIIk35rHe2A7oUMQKhT890brSgeQkmqELSn2FvguF8nyNRHTLtOAOLxXi638TuxOLV575B9ntThNL0nYP6cOEksix8tpN8fzagbgifxRjwcaeuiWPzNq1rvfO4Ksi1KsuqvuiIKEA9xbQm2vEGVWgegtZu8CWMQIL6M40hIfts85iz13r8J/G42WiBuu1r332t7LRBN1gIqiEXvrhBmrLPd5KtJRCr6vVqQD+QjUs0fM8XSHwqqUDxUBz1I42dAEjDW9w2Oa+b+T/I2yPNd/9xmz2W+xsrvXonzRsXc1icnfPN+/jHwinAhhVXNGeyo+hAYn5zaYIF6/qNPrNRuHiO8T8YOHjEjA667jUZNWNsTedRVQsER3W5S/c5Vd03ZHu3x7xpAHguVu7vZQ7j3UUBfEIaBlgJtHDcSqIswEOdDq1J2ZMQLSg3jySOCaIKUWjMWYQ4rIEXPXEXbnAaixbsoeXF8eew2C5dg=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(46966005)(6862004)(82740400003)(47076004)(81166007)(36906005)(478600001)(83380400001)(36756003)(356005)(2906002)(4326008)(82310400002)(6486002)(316002)(70206006)(70586007)(6512007)(5660300002)(8676002)(86362001)(8936002)(2616005)(186003)(26005)(33656002)(54906003)(336012)(53546011)(6506007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 12:45:47.0519 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94086750-2ea6-407f-bb10-08d8354fa5ab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4799
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On 30 Jul 2020, at 20:18, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Only a few places are actually including asm/guest_access.h. While this
> is fine today, a follow-up patch will want to move most of the helpers
> from asm/guest_access.h to xen/guest_access.h.
>=20
> To prepare the move, everyone should include xen/guest_access.h rather
> than asm/guest_access.h.
>=20
> Interestingly, asm-arm/guest_access.h includes xen/guest_access.h. The
> inclusion is now removed as no-one but the latter should include the
> former.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

(sorry forgot to remove the disclaimer in the previous one)
>=20
> ---
>    Changes in v2:
>        - Remove some changes that weren't meant to be here.
> ---
> xen/arch/arm/decode.c                | 2 +-
> xen/arch/arm/domain.c                | 2 +-
> xen/arch/arm/guest_walk.c            | 3 ++-
> xen/arch/arm/guestcopy.c             | 2 +-
> xen/arch/arm/vgic-v3-its.c           | 2 +-
> xen/arch/x86/hvm/svm/svm.c           | 2 +-
> xen/arch/x86/hvm/viridian/viridian.c | 2 +-
> xen/arch/x86/hvm/vmx/vmx.c           | 2 +-
> xen/common/libelf/libelf-loader.c    | 2 +-
> xen/include/asm-arm/guest_access.h   | 1 -
> xen/lib/x86/private.h                | 2 +-
> 11 files changed, 11 insertions(+), 11 deletions(-)
>=20
> diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
> index 144793c8cea0..792c2e92a7eb 100644
> --- a/xen/arch/arm/decode.c
> +++ b/xen/arch/arm/decode.c
> @@ -17,12 +17,12 @@
>  * GNU General Public License for more details.
>  */
>=20
> +#include <xen/guest_access.h>
> #include <xen/lib.h>
> #include <xen/sched.h>
> #include <xen/types.h>
>=20
> #include <asm/current.h>
> -#include <asm/guest_access.h>
>=20
> #include "decode.h"
>=20
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 31169326b2e3..9258f6d3faa2 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -12,6 +12,7 @@
> #include <xen/bitops.h>
> #include <xen/errno.h>
> #include <xen/grant_table.h>
> +#include <xen/guest_access.h>
> #include <xen/hypercall.h>
> #include <xen/init.h>
> #include <xen/lib.h>
> @@ -26,7 +27,6 @@
> #include <asm/current.h>
> #include <asm/event.h>
> #include <asm/gic.h>
> -#include <asm/guest_access.h>
> #include <asm/guest_atomics.h>
> #include <asm/irq.h>
> #include <asm/p2m.h>
> diff --git a/xen/arch/arm/guest_walk.c b/xen/arch/arm/guest_walk.c
> index a1cdd7f4afea..b4496c4c86c6 100644
> --- a/xen/arch/arm/guest_walk.c
> +++ b/xen/arch/arm/guest_walk.c
> @@ -16,8 +16,9 @@
>  */
>=20
> #include <xen/domain_page.h>
> +#include <xen/guest_access.h>
> #include <xen/sched.h>
> -#include <asm/guest_access.h>
> +
> #include <asm/guest_walk.h>
> #include <asm/short-desc.h>
>=20
> diff --git a/xen/arch/arm/guestcopy.c b/xen/arch/arm/guestcopy.c
> index c8023e2bca5d..32681606d8fc 100644
> --- a/xen/arch/arm/guestcopy.c
> +++ b/xen/arch/arm/guestcopy.c
> @@ -1,10 +1,10 @@
> #include <xen/domain_page.h>
> +#include <xen/guest_access.h>
> #include <xen/lib.h>
> #include <xen/mm.h>
> #include <xen/sched.h>
>=20
> #include <asm/current.h>
> -#include <asm/guest_access.h>
>=20
> #define COPY_flush_dcache   (1U << 0)
> #define COPY_from_guest     (0U << 1)
> diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
> index 6e153c698d56..58d939b85f92 100644
> --- a/xen/arch/arm/vgic-v3-its.c
> +++ b/xen/arch/arm/vgic-v3-its.c
> @@ -32,6 +32,7 @@
> #include <xen/bitops.h>
> #include <xen/config.h>
> #include <xen/domain_page.h>
> +#include <xen/guest_access.h>
> #include <xen/lib.h>
> #include <xen/init.h>
> #include <xen/softirq.h>
> @@ -39,7 +40,6 @@
> #include <xen/sched.h>
> #include <xen/sizes.h>
> #include <asm/current.h>
> -#include <asm/guest_access.h>
> #include <asm/mmio.h>
> #include <asm/gic_v3_defs.h>
> #include <asm/gic_v3_its.h>
> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> index ca3bbfcbb355..7301f3cd6004 100644
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -16,6 +16,7 @@
>  * this program; If not, see <http://www.gnu.org/licenses/>.
>  */
>=20
> +#include <xen/guest_access.h>
> #include <xen/init.h>
> #include <xen/lib.h>
> #include <xen/trace.h>
> @@ -34,7 +35,6 @@
> #include <asm/cpufeature.h>
> #include <asm/processor.h>
> #include <asm/amd.h>
> -#include <asm/guest_access.h>
> #include <asm/debugreg.h>
> #include <asm/msr.h>
> #include <asm/i387.h>
> diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viri=
dian/viridian.c
> index 977c1bc54fad..dc7183a54627 100644
> --- a/xen/arch/x86/hvm/viridian/viridian.c
> +++ b/xen/arch/x86/hvm/viridian/viridian.c
> @@ -5,12 +5,12 @@
>  * Hypervisor Top Level Functional Specification for more information.
>  */
>=20
> +#include <xen/guest_access.h>
> #include <xen/sched.h>
> #include <xen/version.h>
> #include <xen/hypercall.h>
> #include <xen/domain_page.h>
> #include <xen/param.h>
> -#include <asm/guest_access.h>
> #include <asm/guest/hyperv-tlfs.h>
> #include <asm/paging.h>
> #include <asm/p2m.h>
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index eb54aadfbafb..cb5df1e81c9c 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -15,6 +15,7 @@
>  * this program; If not, see <http://www.gnu.org/licenses/>.
>  */
>=20
> +#include <xen/guest_access.h>
> #include <xen/init.h>
> #include <xen/lib.h>
> #include <xen/param.h>
> @@ -31,7 +32,6 @@
> #include <asm/regs.h>
> #include <asm/cpufeature.h>
> #include <asm/processor.h>
> -#include <asm/guest_access.h>
> #include <asm/debugreg.h>
> #include <asm/msr.h>
> #include <asm/p2m.h>
> diff --git a/xen/common/libelf/libelf-loader.c b/xen/common/libelf/libelf=
-loader.c
> index 0f468727d04a..629cc0d3e611 100644
> --- a/xen/common/libelf/libelf-loader.c
> +++ b/xen/common/libelf/libelf-loader.c
> @@ -16,7 +16,7 @@
>  */
>=20
> #ifdef __XEN__
> -#include <asm/guest_access.h>
> +#include <xen/guest_access.h>
> #endif
>=20
> #include "libelf-private.h"
> diff --git a/xen/include/asm-arm/guest_access.h b/xen/include/asm-arm/gue=
st_access.h
> index 31b9f03f0015..b9a89c495527 100644
> --- a/xen/include/asm-arm/guest_access.h
> +++ b/xen/include/asm-arm/guest_access.h
> @@ -1,7 +1,6 @@
> #ifndef __ASM_ARM_GUEST_ACCESS_H__
> #define __ASM_ARM_GUEST_ACCESS_H__
>=20
> -#include <xen/guest_access.h>
> #include <xen/errno.h>
> #include <xen/sched.h>
>=20
> diff --git a/xen/lib/x86/private.h b/xen/lib/x86/private.h
> index b793181464f3..2d53bd3ced23 100644
> --- a/xen/lib/x86/private.h
> +++ b/xen/lib/x86/private.h
> @@ -4,12 +4,12 @@
> #ifdef __XEN__
>=20
> #include <xen/bitops.h>
> +#include <xen/guest_access.h>
> #include <xen/kernel.h>
> #include <xen/lib.h>
> #include <xen/nospec.h>
> #include <xen/types.h>
>=20
> -#include <asm/guest_access.h>
> #include <asm/msr-index.h>
>=20
> #define copy_to_buffer_offset copy_to_guest_offset
> --=20
> 2.17.1
>=20
>=20


