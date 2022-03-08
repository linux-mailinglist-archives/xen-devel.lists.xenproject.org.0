Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DDE4D1DD4
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 17:54:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287238.487150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRd6Y-0007PB-4h; Tue, 08 Mar 2022 16:54:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287238.487150; Tue, 08 Mar 2022 16:54:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRd6X-0007Mn-V9; Tue, 08 Mar 2022 16:54:33 +0000
Received: by outflank-mailman (input) for mailman id 287238;
 Tue, 08 Mar 2022 16:54:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yKud=TT=citrix.com=prvs=05922dae9=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1nRd6W-00073Z-6L
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 16:54:32 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b668884-9f00-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 17:54:30 +0100 (CET)
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
X-Inumbo-ID: 6b668884-9f00-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646758470;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=l2iltLf4HeKt6xE+aeGurQUsh4MNyRok8JiraI8Ft+g=;
  b=RPEyhkSf5Rgz9ne1TkXgZ7g6IRwtG4+qgIgpeCu2Hh7V2qe3MYXwmDE5
   1mv3C0LvpnpDo4y48GMknS6AmoNhrbNCfEKraOgZupCo1F9Howwx/un0s
   HLiUVyN30JaqhP7zNBEVF4pkj/B4ZvzlpwhYRO5TKvLKQBbVSfK7wGR3t
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66125100
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:EuEP5aJuOuNt+i0QFE+RDpUlxSXFcZb7ZxGr2PjKsXjdYENS1mYHy
 TQfXWmGbvaCMGfwLY0nbdjk/R4AuZHSyNFiT1FlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh2dY42YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 IkRss3hcFkKBerzqupDDCJVCx16GIQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsJ5hZvnhvwCvGBPIiaZvCX7/L9ZlT2zJYasVmQ6iHP
 ZdAMWIHgBLoTh8QYlE1Ms8EnPqaiHjGaj0ImRWfuv9ii4TU5FMoi+W8WDbPQfSPXcJVmk+Tp
 UrP+m3rBRdcONH34TmC9GiliqnQnCf4cIUIHba8+7hhh1j77nweDlgaWEW2pdG9i1WiQJRPJ
 koM4C0soKMuskuxQbHVUxq1qnOAlhcZUshXFas25WmlyKDZ/gKYDWgsVSNaZZots8pebTkpy
 3eAmtr7AjopvLD9dJ6G3u7K93XoY3FTdDJcI39fJecY3zX9iN1viUOed4hAK+mKvNOrRgr92
 wyOiQFr0t3/kvU3/6m8+FnGhRelqZ7IUhM5623rY4610u9qTNX7PtL1sDA3+d4Fdd/EFQfZ4
 BDojuDDtLhmMH2bqMCarAzh9pmN7u3NDjDTiEUH83IJp2X0oC7LkWy9DVhDyKZV3iQsJGeBj
 Kz741o5CHpv0J2CN/cfj2WZUZhC8EQYPY65Ps04l/IXCnSLSCeJ/Tt1eWmb1H33nU4nnMkXY
 MnHL5jzXStBUPQ6l1JaotvxN5dxnUjSIkuJGfjGI+mPi+LCNBZ5t59fWLdxUgzJxPzd+1iEm
 zquH8CL1w9eQIXDjtr/quYuwaQxBSFjX/je8pUPHsbae1YOMDxxWpf5nOJ6E6Q4zvs9qws91
 izkMqOu4AGk3iOvxMTjQi0LVY4Dqr4j9SJrZ3J9Zw30s5XhCK72hJoim1IMVeBP3MRozOJuT
 ulDfMOFA/9VTS/A9ShbZp74xLGOvjzx32pi4wLNjOADQqNd
IronPort-HdrOrdr: A9a23:AqIaa6ogzJ8ssvT9tIjiXFYaV5t8LNV00zEX/kB9WHVpm5Oj+f
 xGzc516farslossSkb6Ky90KnpewK5yXcH2/hvAV7EZniphILIFvAs0WKG+Vzd8kLFh5ZgPM
 tbAspD4ZjLfCVHZKXBkUiF+rQbsaK6GcmT7I+0pRoMPGJXguNbnn1E426gYxZLrWJ9dP0E/e
 +nl7N6Tk2bCBIqh6qAdxw4dtmGg+eOuIPtYBYACRJiwhKJlymU5LnzFAXd9gsCUhtUqI1SsV
 Ttokjc3OGOovu7whjT2yv49JJNgubszdNFGYilltUVEDPxkQylDb4RGIFq/QpF4t1H2mxa1O
 UkkC1QePibLEmhOF1dlCGdnjUIFgxeskMKh2Xo2UcL6vaJOg7SQ/Ax9L6xNCGpsXbI9esMo5
 5jxX6WuZZMEB/Mqizh+tDDVhVnkVeDu3Y5i+4UiEpeXOIlGc9shJ1a80VPHJgaGiXmrIghDe
 l1FcnZoO1baFWAchnizyNSKfGXLzwO9y29MwM/Uw2uok9rtWE8y1FdyN0Un38G+p54Q55Y5/
 7cOqAtkL1VVMcZYa90Ge9EGKKMeyDwaAOJNHjXLUXsFakBNX6Io5nr4K8t7OXvfJAT1pM9lJ
 nITVsdv28vfEDlD9GIwfRwg13waXT4WS6oxtBV5pB/tLG5TL33MTebQFRriMekq+V3OLyTZx
 9yAuMhPxbOFxqaJW8S5XyNZ3B7EwhrbPEo
X-IronPort-AV: E=Sophos;i="5.90,165,1643691600"; 
   d="scan'208";a="66125100"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CQRGOmRNat2PcHaKC2hCl1G3SdGYh50yCzAv7Ynu+p0nVrkX4Yo4+PzeO7EewafBnIKhsfYL559ucgWXVIsjySPU2wJYI0hBL2Cf6DgIwyFHGs3CdbesCtI9VWBU4GFZU5RmK4QvrQcuFr/jNMfaHPZJmFOnJMVsRHpLuZ3oNsLYfUhi0PbHk+DR9eEhKH4Ti5zXPHKRPBqDMMqshufwAinKAh3KWth/hSmZ6FAkRk8ZQpNuRsBYz3u2Avulf2zBcgr4qMIOJwYxf6Z0CPqL+SWGiNvIiJbmj4LPrsmbUj4NkJ48mXqV1N8a93MJGP7xuWDeTsNTb6mlhxfYQe+HQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FC7QdKjT9i5NWBaZkVCaWzT+y7FpGPy85enFCASv+WA=;
 b=YlJs377b5JwXiAGTqsABv+Wtq2ixhrbjafFftmT0IZbFf1267JPMZtfqRds0gR6P0bFDbOzlKgwp2ntMusmgHT9IgnBRyZAX5s5Sj+1XAfJ70j8Y5vbneuM17QAYDIR/os1kK5DR1j/PB9nMergqhmtuklO5ERAiIC3mCXtmm+RjN+G5W5TVG6/Bkcf5wLP1vk4TZrlBSfha3iutaR2sPfvOaJ7CP2PkqUmqEOjMRVSQSFbg2ymeHAd0XdoLXcT2lPsyCtu9aDwhQqSBT4Uk4pwEIt9cmea3HQ8ViWYaTjqEUOPsJGpxr0NXkleINVeemTvmolcLmRhLZyI9BIMs1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FC7QdKjT9i5NWBaZkVCaWzT+y7FpGPy85enFCASv+WA=;
 b=YV2S8YvkW4zTbOt0OlDiOHnfEkqlQT3ZFBzMYIwQzTuHHc+rixx6t33Wpw6ns8KCnACsQpeCcZmwg9HDuwVye8HeVuOoBeMq6LJ7anyU4Vp2RsJ3ds/Te7bCmcca6inMX6xU2D9eC0qhrogqbfM8dsNwILiRzoWwFm0Wouch2oU=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, Bjoern Doebel <doebel@amazon.de>,
	Jan Beulich <jbeulich@suse.com>
CC: Michael Kurth <mku@amazon.de>, Martin Pohlack <mpohlack@amazon.de>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH v1] arch/x86: Livepatch: fix overflow check when
 computing ELF relocations
Thread-Topic: [RFC PATCH v1] arch/x86: Livepatch: fix overflow check when
 computing ELF relocations
Thread-Index: AQHYMwJZT6OrTo6ebU64Rq0PJcoA5qy1oRQAgAAIYICAAAMNAIAABoB6
Date: Tue, 8 Mar 2022 16:54:11 +0000
Message-ID: <PH0PR03MB6382C8D14D8923497D8899ABF0099@PH0PR03MB6382.namprd03.prod.outlook.com>
References: <b74a68b038c31df4bb94a5b5e87453f5a249cfe2.1646753657.git.doebel@amazon.de>
 <c625d90c-ec0b-a2c3-cf93-08c99cc2f3ce@suse.com>
 <YieBJTHJBiUUqMCU@Air-de-Roger> <YieDtMqn+z5Aydkp@Air-de-Roger>
In-Reply-To: <YieDtMqn+z5Aydkp@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: 66eece14-4597-27b6-5bde-ba02e6652242
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 204a603f-86e3-4509-8b27-08da01244554
x-ms-traffictypediagnostic: SJ0PR03MB5471:EE_
x-microsoft-antispam-prvs: <SJ0PR03MB5471B5E5066B25B437B54260F0099@SJ0PR03MB5471.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LxzEIZg4m0khy42vpqp71v0N7AwkIA+/zGKntLr4ZjXoRSSLdIwZoJrUZg/McM+8ShRvnEQ2fFspAJhjoZoYdRVBAIg7vDmEsGbCAmzDRMhkB9ahk8oXJKhABuUeHNdCFsVaD2vYQHhB/HN+oZG+wtZE0KZcsOS8nsTyXdDdIwGHb7Inm1iA6OmHOL8KMl47tPutFn/IkKCb6qH7U5YtbQA1xCqAQQaPduPK/sNhSQik66aFr/oV34lHRxo4fI2FGZcJAFkHR78CUgbfVpF46XpjZUxuNYbDJS3Dyu/xmdaCuweKq7ekUKGbzjY3byjng8xkCyIv29ec2LKikhaBWUpaHtfyl9BHiiLFmGy0s7aXmrefnYO1GlMqwr8BVJHq+/Mxu7Gls4i1U2AgWrbu+JZpy89vx5/Y9nOrmWqA/UrFuChycAnrhTYlw+J/vBEzJ9qjhTDAPxe0YIdFMzzzkOlq0wOmFyqJP1/U8cEu/VN7vorBjfMUTsGYc+yloWI7N3ppPk8WXAgiWLqv0y2HF7K2cfcGrS2bKrROHdQh35aHI4dgjQhl0WLOQQrsSSktXlHOvk17VgpGAQUn4pieqXFECmT1WN8G1XGeT5JwTpleDI8yQY2vLQ9IT8LtPDUrJBb9/4WeW8nWuSj30uQ5QlnawevgQzNkuuv/PMo8/5zFe9edWhejptPQzaDhEQteJ0r1/VerSkEXIfaYq2m+PA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6382.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(508600001)(71200400001)(38070700005)(7696005)(6506007)(76116006)(54906003)(110136005)(38100700002)(86362001)(66476007)(66946007)(64756008)(66446008)(8676002)(91956017)(4326008)(66556008)(53546011)(122000001)(9686003)(82960400001)(186003)(26005)(316002)(33656002)(55016003)(44832011)(2906002)(83380400001)(5660300002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ujl48eF/0cFlWtGTYxOwrL6w7FDsbaQOwQlrks+NFSU6cWKqPIDL0cQzGb?=
 =?iso-8859-1?Q?tlrLQ6gU8XOZbpgsunj1wh0Q8Va5QBkgCyUI0SGZvEP7JiRPqyC8rtveLq?=
 =?iso-8859-1?Q?o6qzpZgWNQJhdc5YGXw2B7JAgbZxhYddD/qX2bhXb3dTFnM0YoieKxpgbb?=
 =?iso-8859-1?Q?uU047gKVivNQKr1YB2yTRY2O8XAD5RrhbBnERFjXlX0/GMQmhQf1TJpV+n?=
 =?iso-8859-1?Q?MFBRAuf2IxesUUfZo251q4r5JL2yIih8W2eH6Nx8HoxSQepZ/VmwUC3ZDv?=
 =?iso-8859-1?Q?nruxRcsTWqPub9Cv6rTWJ7GW9+tW2fi5GVkQ3GTQfYA1plkRXLo/7Hokgn?=
 =?iso-8859-1?Q?G4s7xyysXQpF7JvfJ+Zb5Fcs5Okgc+ZMxPElrfTGJdO8o++QcwOutMuhzC?=
 =?iso-8859-1?Q?adqClXUN7mRq//KIf5AHLkzKMPCS8K2aNWJsAfi2Z+zHz3Ezw3x3CErrsk?=
 =?iso-8859-1?Q?wQldmOyM43GWZ6ZUqFX542YA+1PF0PZY3/yppx6Oyf6q0v67OBItW3vb73?=
 =?iso-8859-1?Q?Pfwu2k4BFG2EEzGDTbnRewU59bXAMV9oG8IsXYdj0AFpjWcEDkzSEClcZI?=
 =?iso-8859-1?Q?n6hXqX0K18I+hKA6SG/5YQRiWFsUmt0jjYvNjjgQiJ6yRVT02hB4Rid73D?=
 =?iso-8859-1?Q?GSJR6PBF0n4RTSG6pUaN9cR5FZQnTZ3vG+4i3W/XXrlxW9SnSzmqxfyWDD?=
 =?iso-8859-1?Q?/xtML+/BqbTetFjv6PzV6KCa0oRkE/xGSs0mzvjcn9KXUaD1wfHiSN65TB?=
 =?iso-8859-1?Q?V2qORZfzS4eFyZeFf4ufk94Fpp9PoRltmNYcQpqL8LsP8syWoyV4c/D8Mi?=
 =?iso-8859-1?Q?SpATczDA6BBJM91pGNrla7SvMaceYzNWP8W/cHTZy3NdWsN/iXfh400kn4?=
 =?iso-8859-1?Q?dYLu76Eb0m8aUMl2WNjKC56PNnhHm9FR+Cdh0BjrCwvdtlepQXpYtMZUSJ?=
 =?iso-8859-1?Q?7JzsPWC9T4u+mYFojRUz+v0WpMZT/LEURk9x5DCHEhbYcN4P+8fNav4Wwx?=
 =?iso-8859-1?Q?8LWu3UYVwiEq9Y1vpNEw4gHSZqVXAcJwVuziofR8tGIOBHw/fv+uicd1cy?=
 =?iso-8859-1?Q?ldoTlbMlqGmlmhPz15t6LdemWzXDa1oXR0Wi1K8hA6htXJyPA4D7uUJ4ef?=
 =?iso-8859-1?Q?YbptXR6ay8rTkDGDaaTKg1smlZt9v8Ybse9ocANPutF07mattI7gNJRHVF?=
 =?iso-8859-1?Q?/R4HzmwgdSWHGsMAVUKbtMYf168oXkKCLy6wND64oeG9qledH3AGAkaRmW?=
 =?iso-8859-1?Q?KYyRBPZ8o8g5fjlIJXxvxh5SpTdLfxqFJEnOOq5IMBGiEEJi1ZfpkVUPYa?=
 =?iso-8859-1?Q?WGbzb+hk9pk7lK2dKdRPFw6ojeGiwEOmDpChzEnRuvULSrx4gPil0LtU06?=
 =?iso-8859-1?Q?/yuK5oeBrPWgD8TUmKVEKOG8X9Lfv1CKzy1uzWDyT0Zu4oSm04Kz+Yqbj4?=
 =?iso-8859-1?Q?UlMc3PHqGDJu409xZ3yycIopSSfWAQNa93RcW7pBogSpmp4zdQOqu01i5D?=
 =?iso-8859-1?Q?6rcXJS4MjAOoOxljmWUUooeouO+4Zs7ggj5A+PNG9EJZjwq6ZhLTY0ZBSn?=
 =?iso-8859-1?Q?p1IWSXziNJSuIC4ULPR7E4oo14DIb+AnIazjavuQfLRIzd/5rImDHUB+HL?=
 =?iso-8859-1?Q?pdHVtEHNgxT4LDcrLr3tAth6M3yuii4mU6EfRcaaWCXQToZS7YurBfzbQS?=
 =?iso-8859-1?Q?s1+U0aI0KkOQzVJZHGIluoYDuWrSQIn3Ahr+5pjIw4GvboAKBxj/Dcl2Dy?=
 =?iso-8859-1?Q?iIEg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6382.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 204a603f-86e3-4509-8b27-08da01244554
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2022 16:54:11.8703
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8ciixVHZGMgIcnVSgjX5dkoOrGEyaCHkbTYTNl6x+qad6lNlRE3V6AWBou3sUYToxWFQ2u71otWSeOthO/hpSM08AFzbIM0kWZTxnmUCb7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5471
X-OriginatorOrg: citrix.com

> From: Roger Pau Monne <roger.pau@citrix.com>=0A=
> Sent: Tuesday, March 8, 2022 4:26 PM=0A=
> To: Bjoern Doebel <doebel@amazon.de>; Jan Beulich <jbeulich@suse.com>=0A=
> Cc: Michael Kurth <mku@amazon.de>; Martin Pohlack <mpohlack@amazon.de>; K=
onrad Rzeszutek Wilk <konrad.wilk@oracle.com>; Ross Lagerwall <ross.lagerwa=
ll@citrix.com>; xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.=
org>=0A=
> Subject: Re: [RFC PATCH v1] arch/x86: Livepatch: fix overflow check when =
computing ELF relocations =0A=
>  =0A=
> On Tue, Mar 08, 2022 at 05:15:33PM +0100, Roger Pau Monn=E9 wrote:=0A=
> > On Tue, Mar 08, 2022 at 04:45:34PM +0100, Jan Beulich wrote:=0A=
> > > On 08.03.2022 16:36, Bjoern Doebel wrote:=0A=
> > > > --- a/xen/arch/x86/livepatch.c=0A=
> > > > +++ b/xen/arch/x86/livepatch.c=0A=
> > > > @@ -339,7 +339,7 @@ int arch_livepatch_perform_rela(struct livepatc=
h_elf *elf,=0A=
> > > >  =0A=
> > > >              val -=3D (uint64_t)dest;=0A=
> > > >              *(int32_t *)dest =3D val;=0A=
> > > =0A=
> > > Afaict after this assignment ...=0A=
> > > =0A=
> > > > -            if ( (int64_t)val !=3D *(int32_t *)dest )=0A=
> > > > +            if ( (int32_t)val !=3D *(int32_t *)dest )=0A=
> > > =0A=
> > > ... this condition can never be false. The cast really wants to be=0A=
> > > to int64_t, and the overflow you saw being reported is quite likely=
=0A=
> > > for a different reason. But from the sole message you did quote=0A=
> > > it's not really possible to figure what else is wrong.=0A=
> > =0A=
> > It seems Linux has that check ifdef'ed [0], but there's no reference=0A=
> > as to why it's that way (I've tracked it back to the x86-64 import on=
=0A=
> > the historical tree, f3081f5b66a06175ff2dabfe885a53fb04e71076).=0A=
> > =0A=
> > It's a 64bit relocation using a 32bit value, but it's unclear to me=0A=
> > that modifying the top 32bits is not allowed/intended.=0A=
> =0A=
> Urg, I've worded this very badly. It's a 64bit relocation using a=0A=
> 32bit value, but it's unclear to me that modifying the top 32bits is=0A=
> not allowed/intended and fine to be dropped.=0A=
> =0A=
> Thanks, Roger.=0A=
=0A=
I'm not sure what you mean by that. The value is computed based on the=0A=
load address and the address of the target symbol - i.e. it is a=0A=
PC-relative relocation, and the code is checking that the computed=0A=
relative value hasn't overflowed the 32-bit destination in memory=0A=
e.g. in the unlikely case that the live patch is loaded far away in=0A=
memory from the hypervisor.=0A=
=0A=
The code looks correct to me. It needs investigation to find out why this=
=0A=
particular patch is causing an issue since the code is unchanged since v7=
=0A=
of the original xSplice patch series.=0A=
=0A=
Ross=

