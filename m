Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC52234610
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 14:46:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1UPR-000053-4V; Fri, 31 Jul 2020 12:45:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wy6+=BK=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1k1UPQ-00004w-AM
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 12:45:12 +0000
X-Inumbo-ID: ab701f48-d32b-11ea-8e30-bc764e2007e4
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1b::615])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab701f48-d32b-11ea-8e30-bc764e2007e4;
 Fri, 31 Jul 2020 12:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8m4EYduCEPARetGLysx6gxGJAn3u1iVSamjefshBK2o=;
 b=c2wEwem+kipdArpzpltTF+8sLFrKbJfbUcW0s9ADJ642bznGIFGzopjbq3nOJ5cZGa3JrtaipW0/h8GwUu/B3XYPIm3cT7NB7qbRkqdGVpXQ90AvPxi1v1IEZcNqM5SJrBuYBUdViVItrsyJTsfX+f1HICkRAq/rfa6SYiBG3Y8=
Received: from AM6PR05CA0004.eurprd05.prod.outlook.com (2603:10a6:20b:2e::17)
 by DB7PR08MB4219.eurprd08.prod.outlook.com (2603:10a6:10:34::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Fri, 31 Jul
 2020 12:45:09 +0000
Received: from VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::c8) by AM6PR05CA0004.outlook.office365.com
 (2603:10a6:20b:2e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Fri, 31 Jul 2020 12:45:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT033.mail.protection.outlook.com (10.152.18.147) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.20 via Frontend Transport; Fri, 31 Jul 2020 12:45:08 +0000
Received: ("Tessian outbound 2ae7cfbcc26c:v62");
 Fri, 31 Jul 2020 12:45:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: fe9ad90011b12fde
X-CR-MTA-TID: 64aa7808
Received: from 201af4206fbb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 59B4E25F-F342-4937-9B20-B1505AED559E.1; 
 Fri, 31 Jul 2020 12:45:02 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 201af4206fbb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 31 Jul 2020 12:45:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WkAbiiDGMuDTw47XV46EqWA2eXOCPd/tyna9MsGQbRq8guW/45+cpzUnY566aAFa52EBLnEistYMzF8sQFTWoF9havYnlJ3rQ8ydCC8T8zyD2GPmscA+YWNBvbUjncDCAL+RgAhomFFFskyaaKPAQS4d0DYXrCqm7Kxq01lVUxhEkLU+E+mMEabUhOeN5Tv6pWzfeM4x9vGYZ38GEaV99BOZJiMbxvJLTSOiDxXgXp6yoW9Mnl3B0utGLZUMae7KCtAAlo+Hi3s9QyAqwykifgEA253puYEtEfy8gVxo79DBShbhWRE1NvRlW0rUyXIPvDBiTIW6w779Puw3cRBiaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8m4EYduCEPARetGLysx6gxGJAn3u1iVSamjefshBK2o=;
 b=hGfTsF+LuFBNC/Sc0+V1r+n8mGif+cUzzVlMpW9rUA5adRWO8/KAaxjreM356ruHEjbP0rWEIoPTTo86NRXawJgeKQKFm84zEeHBJ6i3LeDgOpmuWw/j/XXJHLQZqqq4fv0vbvHGk+TV+3xvW5JYpNdx6wMf9TQuAGCJe+uAr9RwV3I0KGcsUkXsZL+ntQZqwajYi05c967y2LbHEWzThJipMuTjiUSLdNlHDfR8/QRrHsLVqHomXODWGauvAYfiCWiZzthOQBUY2IWYBS2gFiaWiUsniqOq4/r2wSgj2OAqBSO1Aw3eFZmjOqzxOfgBbjOjGBtLeraXza5Je47RdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8m4EYduCEPARetGLysx6gxGJAn3u1iVSamjefshBK2o=;
 b=c2wEwem+kipdArpzpltTF+8sLFrKbJfbUcW0s9ADJ642bznGIFGzopjbq3nOJ5cZGa3JrtaipW0/h8GwUu/B3XYPIm3cT7NB7qbRkqdGVpXQ90AvPxi1v1IEZcNqM5SJrBuYBUdViVItrsyJTsfX+f1HICkRAq/rfa6SYiBG3Y8=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3850.eurprd08.prod.outlook.com (2603:10a6:10:7b::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.18; Fri, 31 Jul
 2020 12:45:00 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3239.020; Fri, 31 Jul 2020
 12:45:00 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [RESEND][PATCH v2 5/7] xen: include xen/guest_access.h rather
 than asm/guest_access.h
Thread-Topic: [RESEND][PATCH v2 5/7] xen: include xen/guest_access.h rather
 than asm/guest_access.h
Thread-Index: AQHWZp4X4KUogf6E0E+1j1OVzKuR+6kho5CA
Date: Fri, 31 Jul 2020 12:45:00 +0000
Message-ID: <4111782C-4E92-442E-BAE3-A9F697FEA91B@arm.com>
References: <20200730181827.1670-1-julien@xen.org>
 <20200730181827.1670-6-julien@xen.org>
In-Reply-To: <20200730181827.1670-6-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5e19f2f3-77fb-4254-85c1-08d8354f8e95
x-ms-traffictypediagnostic: DB7PR08MB3850:|DB7PR08MB4219:
X-Microsoft-Antispam-PRVS: <DB7PR08MB4219369288A67DD21899E9079D4E0@DB7PR08MB4219.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: OvEG+GdgwhyyLIOirQd2HxhdIfplGfBVw1Zr8AtSgzpg/zCQx1nDiKiU/F53wCdhcDQB3Iv8lZ8VTOrFA86a75lzinwTQu2VJOB7A++eG1+rrSEoQNWn0Sid3ioqZBqn4QURzE/JwG/HLkoKmal5xg0swu2Gb1Hbtpc0dxrlZg80+k2vEOjSu0FOUByn+FxBbu0oHPnycNz2GlIPm/fSw2BlR6ZP34edT7cRhazXA6+oIy7iUBVj/QuZE9ydgtn6nrR3UoDeo4E1QxfHUyVrhGKI5JNJB2wr8Ep6xDCVKEzNsZu1+WtYZBRLJnKkwGY4sXqg9qA0ke/SoyQYnesx6cRmfDjAsU0Om0muzSXHdjnpojjk6ytLewn/r/DUHOijr6kvknjVQUP7vP3BRS0zig==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(6486002)(478600001)(54906003)(71200400001)(76116006)(66946007)(8936002)(316002)(53546011)(6506007)(91956017)(36756003)(7416002)(86362001)(8676002)(6512007)(5660300002)(83380400001)(2906002)(2616005)(33656002)(66476007)(66556008)(26005)(64756008)(66446008)(186003)(4326008)(6916009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: cjK2klzyuvwP9nLpWl2k02VADcke8MZjZXH78FF0yuBDwUXJVJj61JBGoKhdSrYQ+mQcaYlSh0syqiRwnWX1zzf6sHWnnh1z00RQvZdH5woY0jmjzeSfsjl91nvRGbkzNUBEo8b0oFEvr+43Bn+rvBcetCLTikr7Et18TpkVqDXeJT3YFXjqXJSaJ18gEjIu1Ue+GBg69V1LImXMroFWZ1EW3kngydruCMxDrOFR7C2yGagL2rC3cCCRamotXF4RoR4it2U7JryGg7eZMuv4t/SH+K0ckEKofR+znx4QutBxLbtnK47RP11qhVI14dFAINj3lDVggXYl+gPCJVfsXxslCLSW5Xh69rtXEpNHDc5aE3Pl5hxa4nqso7chamdYm3jNJQcPt8DDM2wM5aC773tXciFysrz4dS7wZnOUjemDjbIKDHufe46OggEBzzxgAD0j2R1itQhIpocID7+uABNZBUGwv9yL3mGlHYOyuotaKK0GPTGE3TLq26IcoWggKifUc11eiOjBT3kqKPHpc1BKuEoYJ5dFSfM1mRFfgPiJMywEuA3HAusm4UNbJPzqGcZDec65UCKs9+jhKo2YD5iaygg63GZZ+2pVVMesZZuRtF3qruiQhBE4yvOmGtPzlvyrGPONHzRPxTZ5bUtwfg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <A81B98BFB5592C4780B007BC3068CF7A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3850
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: b21035fd-2552-4956-a98b-08d8354f89ad
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lcX8cAn/I2TsYi1GL8ruI3MlvfJm1YbXTKZmnlVnrsWtkrdBYLvC7lGc14D9L7UNwws+oVdejrFr94pYR/NL1Jgrb0LSjQZKTgOurTYQ+YNe5ZaZAd+BxYGY88A+5Ny3OhG2h5uundL603PIxi1lovRMdWIdzDdr2FNhAMf8fLVdAiU2qNaBsM7wt3M409Yr3ZDopLswbbgXcR7RH0cLnN68vx01xntg3kbAyH2oRYGOg86lTWiwguo5jT6kTOXH/6QKWoYiGKmWVxd4vQq3X4WRK7O7hQ1uI4NidPj909a5hZ5MH0vA/23/wiaKI3tgrMZ/x8+PccYRMp7UStx5u8sisCYKJMgvmu2+U4opd4yQsEp2zdr6i7DU6J1P0dxehBt533U1vLYOTbcCptwhCmts7J/PTy18cSfUWK+Cv1c8x7wA6Zm+7Anwcu1dhpQOp5wQ/8Rj0gnaJlZ4pS5fZePdeH86cIaJRO21IdPg6Ok=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(346002)(376002)(136003)(396003)(46966005)(478600001)(81166007)(82740400003)(47076004)(2906002)(83380400001)(356005)(70586007)(2616005)(70206006)(82310400002)(86362001)(36756003)(33656002)(5660300002)(54906003)(6512007)(336012)(26005)(186003)(6506007)(53546011)(8676002)(8936002)(36906005)(6862004)(316002)(6486002)(107886003)(4326008);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 12:45:08.2225 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e19f2f3-77fb-4254-85c1-08d8354f8e95
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB4219
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
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On 30 Jul 2020, at 20:18, Julien Grall <julien@xen.org> wrote:
>
> From: Julien Grall <jgrall@amazon.com>
>
> Only a few places are actually including asm/guest_access.h. While this
> is fine today, a follow-up patch will want to move most of the helpers
> from asm/guest_access.h to xen/guest_access.h.
>
> To prepare the move, everyone should include xen/guest_access.h rather
> than asm/guest_access.h.
>
> Interestingly, asm-arm/guest_access.h includes xen/guest_access.h. The
> inclusion is now removed as no-one but the latter should include the
> former.
>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

>
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
>
> diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
> index 144793c8cea0..792c2e92a7eb 100644
> --- a/xen/arch/arm/decode.c
> +++ b/xen/arch/arm/decode.c
> @@ -17,12 +17,12 @@
>  * GNU General Public License for more details.
>  */
>
> +#include <xen/guest_access.h>
> #include <xen/lib.h>
> #include <xen/sched.h>
> #include <xen/types.h>
>
> #include <asm/current.h>
> -#include <asm/guest_access.h>
>
> #include "decode.h"
>
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
>
> #include <xen/domain_page.h>
> +#include <xen/guest_access.h>
> #include <xen/sched.h>
> -#include <asm/guest_access.h>
> +
> #include <asm/guest_walk.h>
> #include <asm/short-desc.h>
>
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
>
> #include <asm/current.h>
> -#include <asm/guest_access.h>
>
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
>
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
>
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
>
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
>
> #ifdef __XEN__
> -#include <asm/guest_access.h>
> +#include <xen/guest_access.h>
> #endif
>
> #include "libelf-private.h"
> diff --git a/xen/include/asm-arm/guest_access.h b/xen/include/asm-arm/gue=
st_access.h
> index 31b9f03f0015..b9a89c495527 100644
> --- a/xen/include/asm-arm/guest_access.h
> +++ b/xen/include/asm-arm/guest_access.h
> @@ -1,7 +1,6 @@
> #ifndef __ASM_ARM_GUEST_ACCESS_H__
> #define __ASM_ARM_GUEST_ACCESS_H__
>
> -#include <xen/guest_access.h>
> #include <xen/errno.h>
> #include <xen/sched.h>
>
> diff --git a/xen/lib/x86/private.h b/xen/lib/x86/private.h
> index b793181464f3..2d53bd3ced23 100644
> --- a/xen/lib/x86/private.h
> +++ b/xen/lib/x86/private.h
> @@ -4,12 +4,12 @@
> #ifdef __XEN__
>
> #include <xen/bitops.h>
> +#include <xen/guest_access.h>
> #include <xen/kernel.h>
> #include <xen/lib.h>
> #include <xen/nospec.h>
> #include <xen/types.h>
>
> -#include <asm/guest_access.h>
> #include <asm/msr-index.h>
>
> #define copy_to_buffer_offset copy_to_guest_offset
> --
> 2.17.1
>
>

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

