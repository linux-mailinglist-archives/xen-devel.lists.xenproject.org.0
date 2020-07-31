Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A289234616
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 14:47:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1UQz-0000Ex-SJ; Fri, 31 Jul 2020 12:46:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wy6+=BK=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1k1UQy-0000En-CA
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 12:46:48 +0000
X-Inumbo-ID: e4db022a-d32b-11ea-8e30-bc764e2007e4
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0e::615])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e4db022a-d32b-11ea-8e30-bc764e2007e4;
 Fri, 31 Jul 2020 12:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQl4wNDKcbTGDFmi+x4LzPFfB0nI4NfrbsFPh62FtZg=;
 b=RGbVCkbRMjS87Lz7Juf8G3oVMR4yiFB2KJXXtDOWyZlrTrJtYfNSD6vJ3Vr7Q6nm82fFem/HGx12j3I9JmriGlhPoXi6x5uzXBX5xT7iUtjDv3soc+Ok3rwVQqgF+WhkynlCWVyrYbldhmzilzSStdS9v9WvDmllO4TwMBiJqMw=
Received: from AM6PR05CA0020.eurprd05.prod.outlook.com (2603:10a6:20b:2e::33)
 by VE1PR08MB5134.eurprd08.prod.outlook.com (2603:10a6:803:110::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21; Fri, 31 Jul
 2020 12:46:44 +0000
Received: from VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::94) by AM6PR05CA0020.outlook.office365.com
 (2603:10a6:20b:2e::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17 via Frontend
 Transport; Fri, 31 Jul 2020 12:46:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT055.mail.protection.outlook.com (10.152.19.158) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.20 via Frontend Transport; Fri, 31 Jul 2020 12:46:43 +0000
Received: ("Tessian outbound c4059ed8d7bf:v62");
 Fri, 31 Jul 2020 12:46:43 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ea6a28545ffd0d9b
X-CR-MTA-TID: 64aa7808
Received: from d457ff977885.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 70BFEE85-DD18-4456-AE45-4D817FFBD66B.1; 
 Fri, 31 Jul 2020 12:46:38 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d457ff977885.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 31 Jul 2020 12:46:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZHcRYos/s2YchWMhzLYHYwAl46TvA7YpzbpXnys2i5adjCAeOYzh9YMjR8V1oMI4BRnlW+jzwM3NqRDUyy/utd8RbCRz9buVz3B8sIsNelpKcuc5Y1hvxCUvTuo8Ons3Od71Wcn3U4tn/O3P6PhBDjz74hDVqOBGrzEkwC6sw0od7gqXnv1Cz38O+TbX47n2xJwyu4Jitlg4EDKLvkYzIElqGdcPd7YLbvr1T4Aq52jhyN+0JVd7Pcl9fv6SDg3sfWUFy63eOiRasxS7grF7xRl4JEcyV7587CrXM4xAGORu41zo2x0h2jtCBg23hqsOpKTeRXf6aso2Xn5RywSAZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQl4wNDKcbTGDFmi+x4LzPFfB0nI4NfrbsFPh62FtZg=;
 b=BU9IdyMkfkuxC43+JNOW4Z1aOQDuchsA/ykGbHlg+MtWGdGzmH0xzOQ82I+MybFqmxSPpS0Gpo3+iDgYvO/hj8W6l4g+gkEzEtTsIu/g9r1NM2q4oblnptvD2l+71IAuY1JCCjFZZHulPYj7H0jOKgTfc1+SfIQfQ3R4Jvt66OvUeHK7DggCzItCfQa6iRNpeYtAJFCQP8Q6CkykNfPT4apI5Jfj3ZvdsryFFY43DzAesiAs/IvdNgTjrCnSFAUr8gN/DaV/R2T1nbsqh0pgeNlCwYykJM/fGLIifok3VknxQQkKvgq7wvcLJ+/ny0oUJMnKkeuAwcm8XP57ywNWxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQl4wNDKcbTGDFmi+x4LzPFfB0nI4NfrbsFPh62FtZg=;
 b=RGbVCkbRMjS87Lz7Juf8G3oVMR4yiFB2KJXXtDOWyZlrTrJtYfNSD6vJ3Vr7Q6nm82fFem/HGx12j3I9JmriGlhPoXi6x5uzXBX5xT7iUtjDv3soc+Ok3rwVQqgF+WhkynlCWVyrYbldhmzilzSStdS9v9WvDmllO4TwMBiJqMw=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB5323.eurprd08.prod.outlook.com (2603:10a6:10:fa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.18; Fri, 31 Jul
 2020 12:46:37 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3239.020; Fri, 31 Jul 2020
 12:46:37 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [RESEND][PATCH v2 7/7] xen/guest_access: Fix coding style in
 xen/guest_access.h
Thread-Topic: [RESEND][PATCH v2 7/7] xen/guest_access: Fix coding style in
 xen/guest_access.h
Thread-Index: AQHWZp4mnyA5b3r8N0qp4y2QMyc1KKkhpAQA
Date: Fri, 31 Jul 2020 12:46:37 +0000
Message-ID: <B4708E9E-BF20-4B02-803E-FDC7F97C55A1@arm.com>
References: <20200730181827.1670-1-julien@xen.org>
 <20200730181827.1670-8-julien@xen.org>
In-Reply-To: <20200730181827.1670-8-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [90.126.203.125]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4a71dec4-b7bf-44f0-0eb4-08d8354fc75b
x-ms-traffictypediagnostic: DB8PR08MB5323:|VE1PR08MB5134:
X-Microsoft-Antispam-PRVS: <VE1PR08MB51347BC92DEBE64F2D20A4A69D4E0@VE1PR08MB5134.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:972;OLM:972;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 7zOlsZzVS6lqiZ0u5PHSImPqOMKqUGFX6qrSuKXem5NyyXvUDgEqalI444YizNM2qRzqexZ4zQ0ve1Sh2ehKBFVfKrxeDQl87BtEA5Bdif5xQylqbSnd85xe8LNHf39Ptseg7TGKslypwOWLtZV0W5TCA8+yPNCJxRqB9jPCs+QY72kk24XevVF4SdiXUwpvBvrSZOvkb+uh1AivlpYsRHnJqn344pY1DoJbgovyxa9SaAIHUMQHqutTgbI1+qZ4HgVsQmKCFgiob71l88vy1nL5HloyuVEXQtJo6L+e0ciV1NzAKoXxFFesuF/U8btg
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(6486002)(478600001)(54906003)(71200400001)(76116006)(66946007)(8936002)(316002)(53546011)(6506007)(91956017)(36756003)(86362001)(8676002)(6512007)(5660300002)(83380400001)(2906002)(2616005)(33656002)(66476007)(66556008)(26005)(64756008)(66446008)(186003)(4326008)(6916009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: crnMAH6tvbyBaMqQ3xKoR2Mi0qC5NGbmkxe7xBQ9Xs1sVEFmAAK3/77STObQXy9bai64IobOTRHduv1xYZadYRJtjlzmChlfCaeWtAmL5lJbh0Wcx4o82E3w2plpBbFnKzw3NZtpiY1T1n/IBKWtL49QpGpdfNeXDOC4IQfhoz/d1V1JYnM3clanC8YF5GvsAvDymyShd/eQ0Rmx8ij4tNxSw2ve0E6YsdWJXWo+XQ/oZDTQ72fLJJJ+DWUfBAe935gRm2rOdn7sJEBLyz+wJMmpAB/osPsYHLeZHOEcCvXapUF0UDg5XTgyvyuIqZ+OUwJ4ZAfoMh+Ly8HFqMHm9ZnwOQsQRXpCODod5ab+Bh/e7yW56hcz/Etc9z4Qj25TPnHUxUg44ttbyaJI12lcTnHyGsnhEY87qy7Z9dGBJwM2f5oo8QD34bm1aAPojQCBeQtVPbI/fkKT/3HiSratvD0k1ClKZ5IYhiQFT+7SFCIhq+UJ0QKWx+M4Slf957ghGZBAfQyUDTdEdLEuagDHtboT+7ZHiO06v4swA/+8orGNw1X28zk/VA/GTF0u+rEfX1+PNnzFTKPEHh7LxkeShF7hlelbDkueLKJ2nP+p1RrqS6UNI8Nx8df8jD7YQVXdWwqHB78f5BP5Cc670qOi4A==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <25AC9BD07B6B664AA7FA8C1080E4FAF4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5323
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: fc886a2a-71b0-46d1-b52c-08d8354fc3ad
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h/rEb/O8UJmy3EtPjFyvq6xji2HHOxpbAlHH0zmp6pTooRetioNvR1Z2/atZm6GHl+zzT/MsjInJCCBaBSdSvXUr5zvbSoGGCSdrktQflhSdfokldmA+hDf0S74uoyOWqSUXEmXKPSjrZ3l3UmlecdXJT9w9Umsu31AXhOODn4CwsE+y50XEZK5TsveAVm5oT+btAgdXcMcRqF5LSpLYnCNgYZb3M6LThKSZ3U1s89WoXOnrAumxT5r8QU6jf8nKgdWafxbh6uLQU0MP2CSzwKwNv9BtJYhcQr2+Hl1nVCX5iMSD8HB1P2fHL/D/4ZTts/7f5tr7f1sWxVVANM73930qZwiJ9qIs4zOOPLNN2MInCYRtMhKCVp+/hbUESHS8+pi9Wp7BMlfw1Rnxkb522A==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(136003)(376002)(39860400002)(346002)(46966005)(86362001)(2906002)(83380400001)(81166007)(26005)(186003)(70586007)(6506007)(70206006)(53546011)(82740400003)(54906003)(6486002)(356005)(82310400002)(47076004)(36756003)(336012)(36906005)(316002)(478600001)(33656002)(2616005)(5660300002)(8936002)(6512007)(8676002)(6862004)(4326008);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 12:46:43.5064 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a71dec4-b7bf-44f0-0eb4-08d8354fc75b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5134
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On 30 Jul 2020, at 20:18, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
>    * Add space before and after operator
>    * Align \
>    * Format comments
>=20
> No functional changes expected.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

> ---
> xen/include/xen/guest_access.h | 36 +++++++++++++++++++---------------
> 1 file changed, 20 insertions(+), 16 deletions(-)
>=20
> diff --git a/xen/include/xen/guest_access.h b/xen/include/xen/guest_acces=
s.h
> index 4957b8d1f2b8..52fc7a063249 100644
> --- a/xen/include/xen/guest_access.h
> +++ b/xen/include/xen/guest_access.h
> @@ -18,20 +18,24 @@
> #define guest_handle_add_offset(hnd, nr) ((hnd).p +=3D (nr))
> #define guest_handle_subtract_offset(hnd, nr) ((hnd).p -=3D (nr))
>=20
> -/* Cast a guest handle (either XEN_GUEST_HANDLE or XEN_GUEST_HANDLE_PARA=
M)
> - * to the specified type of XEN_GUEST_HANDLE_PARAM. */
> +/*
> + * Cast a guest handle (either XEN_GUEST_HANDLE or XEN_GUEST_HANDLE_PARA=
M)
> + * to the specified type of XEN_GUEST_HANDLE_PARAM.
> + */
> #define guest_handle_cast(hnd, type) ({         \
>     type *_x =3D (hnd).p;                         \
> -    (XEN_GUEST_HANDLE_PARAM(type)) { _x };            \
> +    (XEN_GUEST_HANDLE_PARAM(type)) { _x };      \
> })
>=20
> /* Cast a XEN_GUEST_HANDLE to XEN_GUEST_HANDLE_PARAM */
> #define guest_handle_to_param(hnd, type) ({                  \
>     typeof((hnd).p) _x =3D (hnd).p;                            \
>     XEN_GUEST_HANDLE_PARAM(type) _y =3D { _x };                \
> -    /* type checking: make sure that the pointers inside     \
> +    /*                                                       \
> +     * type checking: make sure that the pointers inside     \
>      * XEN_GUEST_HANDLE and XEN_GUEST_HANDLE_PARAM are of    \
> -     * the same type, then return hnd */                     \
> +     * the same type, then return hnd.                       \
> +     */                                                      \
>     (void)(&_x =3D=3D &_y.p);                                    \
>     _y;                                                      \
> })
> @@ -106,13 +110,13 @@
>  * guest_handle_subrange_okay().
>  */
>=20
> -#define __copy_to_guest_offset(hnd, off, ptr, nr) ({    \
> -    const typeof(*(ptr)) *_s =3D (ptr);                   \
> -    char (*_d)[sizeof(*_s)] =3D (void *)(hnd).p;          \
> -    /* Check that the handle is not for a const type */ \
> -    void *__maybe_unused _t =3D (hnd).p;                  \
> -    (void)((hnd).p =3D=3D _s);                              \
> -    __raw_copy_to_guest(_d+(off), _s, sizeof(*_s)*(nr));\
> +#define __copy_to_guest_offset(hnd, off, ptr, nr) ({        \
> +    const typeof(*(ptr)) *_s =3D (ptr);                       \
> +    char (*_d)[sizeof(*_s)] =3D (void *)(hnd).p;              \
> +    /* Check that the handle is not for a const type */     \
> +    void *__maybe_unused _t =3D (hnd).p;                      \
> +    (void)((hnd).p =3D=3D _s);                                  \
> +    __raw_copy_to_guest(_d + (off), _s, sizeof(*_s) * (nr));\
> })
>=20
> #define __clear_guest_offset(hnd, off, nr) ({    \
> @@ -120,10 +124,10 @@
>     __raw_clear_guest(_d + (off), nr);           \
> })
>=20
> -#define __copy_from_guest_offset(ptr, hnd, off, nr) ({  \
> -    const typeof(*(ptr)) *_s =3D (hnd).p;                 \
> -    typeof(*(ptr)) *_d =3D (ptr);                         \
> -    __raw_copy_from_guest(_d, _s+(off), sizeof(*_d)*(nr));\
> +#define __copy_from_guest_offset(ptr, hnd, off, nr) ({          \
> +    const typeof(*(ptr)) *_s =3D (hnd).p;                         \
> +    typeof(*(ptr)) *_d =3D (ptr);                                 \
> +    __raw_copy_from_guest(_d, _s + (off), sizeof (*_d) * (nr)); \
> })
>=20
> #define __copy_field_to_guest(hnd, ptr, field) ({       \
> --=20
> 2.17.1
>=20
>=20


