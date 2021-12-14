Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D95C474203
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 13:06:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246650.425376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx6ZF-0004YX-E8; Tue, 14 Dec 2021 12:06:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246650.425376; Tue, 14 Dec 2021 12:06:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx6ZF-0004Tn-9y; Tue, 14 Dec 2021 12:06:01 +0000
Received: by outflank-mailman (input) for mailman id 246650;
 Tue, 14 Dec 2021 12:06:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jWHN=Q7=renesas.com=yoshihiro.shimoda.uh@srs-se1.protection.inumbo.net>)
 id 1mx6ZD-0003Iz-Qz
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 12:05:59 +0000
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20731.outbound.protection.outlook.com
 [2a01:111:f403:700c::731])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31e444f8-5cd6-11ec-9e60-abaf8a552007;
 Tue, 14 Dec 2021 13:05:59 +0100 (CET)
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB3436.jpnprd01.prod.outlook.com (2603:1096:404:d7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Tue, 14 Dec
 2021 12:05:56 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b0dd:ed1e:5cfc:f408]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b0dd:ed1e:5cfc:f408%3]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 12:05:56 +0000
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
X-Inumbo-ID: 31e444f8-5cd6-11ec-9e60-abaf8a552007
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jEqrX4fa5cjv3+NJvtMcDUQZ8jkvJfIudNLBhy8r/D9Zp2M1NFslyA75s0SyaGlOWqf8BYinM7p7AomKdyMDbyoNfzVYdZOKWkbbCoY4VMCUDhQwXEQ5NqH3yLx0PIz14lR0A2RQqJ8n0kShJEEKSbUKGUpOsTXDnUEod4JSrRzFecyiyuI4MVLrTN+ZrAMub/UABG9MHm5A4RMDbwWsASmBRbrehdFiaAkv6i1RHxntVr6NuOyBjWMHZ9v14TL8Yy7Fo6SmyD1BZLU9sTWMo9CnwhR1xT2jToEMZFFpCfYpKDnZGTW5slaPts4YZosYnwbka9Px8ePKvuh+uMNx0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Zi0ScpQv+Pk0yCO8VpXPoAyBXpW6xs9wjgk1+H+o4g=;
 b=a6zMcTjNuuGsZG6haRenu3WsD+AMalMJpeewnTLxE2F+m7xaoZHkqFo/IOmgcZTOJqFYkWArJ6x2ZS2S16gc/1kYg+1R1uQoABwaricwnnzpL9EGqeNz+/6NxI/QR8R0nBn9JQPo1BtfPmFd9Rblz82EGckSSoqlOff89m31ErRNIO2Z1ip5CqXH7WT+BqUbjraVcIkNaOaO7AQJMEBTyfPis+zm8sqC00aAr+WGfH97wRCdwhuabaz/j9w8bATG2MkgKZeZaqTvNY7N9AaYyjJbQrANPpJV8GENgiKjesZpfWbU/Frumd4aHu39P3ey7Wqbt7cXpde50CFCjnaX2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Zi0ScpQv+Pk0yCO8VpXPoAyBXpW6xs9wjgk1+H+o4g=;
 b=KgrwrifX0VZp32QdPlEqkY8OINF/4F2qbfb4PWwXqQn9u7r33FIVkV3XWXso7quwvWRRCH72Zi+2LVLyLSiDRL17STNXKqm5b5OiIffdRHyghPdtwma4V6PqAIondE8WpTonCvJ/U5s3jEHklJ2992ukXeZ62bd9ZLmQYQYqM6E=
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: RE: [PATCH 04/10] iommu/ipmmu-vmsa: Add light version of Linux's
 ipmmu_features
Thread-Topic: [PATCH 04/10] iommu/ipmmu-vmsa: Add light version of Linux's
 ipmmu_features
Thread-Index: AQHX47d5KD29OXhbPEy75XHCjn67uqwx+H8g
Date: Tue, 14 Dec 2021 12:05:56 +0000
Message-ID:
 <TY2PR01MB3692ACF84DD7938E620B8267D8759@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1638035505-16931-1-git-send-email-olekstysh@gmail.com>
 <1638035505-16931-5-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1638035505-16931-5-git-send-email-olekstysh@gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0127962b-c815-4430-be8b-08d9befa1589
x-ms-traffictypediagnostic: TY2PR01MB3436:EE_
x-microsoft-antispam-prvs:
 <TY2PR01MB34362D30FC73C5196C4DE5B1D8759@TY2PR01MB3436.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 uLlfFTyzke0tRXAqcjhRijuUSqc+JV2BwtBDoQFU5MDnS3EzebzcEaY8sqta5ZUPOQzux5pU2dBhpxCbv+Mf3TqZXBjCBxD1UZ2QvHTTL4IU2lLAaHT8KpqoG0GBURmzrxBmltsIWgv9k6pVTflTjo4ry9D7A5Wcn3bO12RUNff0SAc/8iG4cnC8kTI3KfpSt92o4J/nFiaqn8oCDRrq+pFQeyYw+10BzFgyFRQOqLuCjblY0hn78EyjDyHP6/ikfYmsi6XjT9jBZ2O4KqifChyZ0snxKqzeVLj/KdqxMiiud7dwAq6qaYGCk1zz5gqOlc/yemfdWxyKmwqX425dv4zEavM6+aRyAdVqaThEzFOmDhLaNjk5yQuSgibMyEmAAGB00jQ6NZ7Lnf7tsH4d6OwDB/Yhd077xXLX37wqX4wSSKzjpwzQk3MXUC1HA+y9gleGasctFlHsriT5IDBiEPHpDM93NVcz7CSJy/pRFJY32R93jbk2NpgRPQWIFD7/PYZ+YC+6W2+cZpCrYkBW7aquILYPHdHlniywS4nTGJPlXrrldXkRzSrVKadHC6m38zQa/BdGrt830v3vXIgml54sdz2C43gwAHjjra/J3OxGC6qhth9wRf6pQ3XTlNgBKc6uCHqlUDQjnb5G2zJghvWOtcCM2u6m2+sM7rAJdddOWWswMDFT8+fqnm9v+Ck2VYmm+cGXGHXL9lwMUtPdFA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(54906003)(110136005)(6506007)(38100700002)(508600001)(186003)(8676002)(5660300002)(55016003)(64756008)(71200400001)(66476007)(66556008)(66946007)(38070700005)(76116006)(66446008)(122000001)(52536014)(4326008)(86362001)(7696005)(4744005)(2906002)(8936002)(33656002)(26005)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?dDfkwVuPYP6fBiPXRnJGbDg+68yUsXiCNH01CaVbOuRIZUvzHAHeSEIGuV+W?=
 =?us-ascii?Q?TlVVCNtejtjB1SZ7jNoWnBnZzdG7QJJ5HBjov9GX3nUCGv7FKTjZVvLL5PLa?=
 =?us-ascii?Q?YAuT6ZG0PXdQqQl75dyubUg4nY56hu7KjVeguXHVgQBlJrIDxMlklasx0W6b?=
 =?us-ascii?Q?02S1yV9s5uwO8jkWNVeesv3QaRPXkxfNzkGlcVfeaTZH8PZ9wOsH7B5CzI/P?=
 =?us-ascii?Q?YiDqge0JcAgxYtwEELuGeecU0eHNf5Xjn/ncxljn265fjaf0mbHZL0Lw2Ypg?=
 =?us-ascii?Q?fGBuLW9c9dENNWm10UOQAD0LsOsQqZPObJZj8CG+DC141Fwcg9MN4UpX9fVL?=
 =?us-ascii?Q?AJ+9Vrju9mHckOYufjiqi4BUvRVIjBBH7L6VRA/YzZ2bBJPa3eo7h49qb/9u?=
 =?us-ascii?Q?rDoi9y9gjXYYZpkS8I0Id98RuYFg4ltOMJ5We7xeSF0obpFeRBTFWm8QQMpB?=
 =?us-ascii?Q?a/p3OpU7SID8QVYf5QeCOH0rpV4IiddCh9JKl5DjlOeAZON+XhgpnUGBFqGA?=
 =?us-ascii?Q?ZWdyr+L3ErqfLzeTnt71Nvyct6lMeNYfacUK1bEnM2TLzYCa1BnoErGPm9Bw?=
 =?us-ascii?Q?GSkzKJG9h0lmEGLRB5u3wL22UXl53A6jorVpsbJ8bsUHnHu6Bib7C3Fl+oKZ?=
 =?us-ascii?Q?5Ejk+s+zHwQOWD0e3CPf9HZa7bTlCsSE3ttWg6Qc0Wx48scm13m5jBDOGYh9?=
 =?us-ascii?Q?uiZZuhEeLbRCmuoW55RH/L7cQ0UUReHeLULRFHHPanPOz0oqjfUYhhhDvAJC?=
 =?us-ascii?Q?tuNnyTcK4kE4zH+B2xZ0wL2oLpazs61wYflYvEc+AHpW78O47Gdm4QxNcDn/?=
 =?us-ascii?Q?qujxuKLP49zrWIezGydl7NB8gEMU46czTJ1ZRIsr3Tz1NMAKt93PLF5kc1Q2?=
 =?us-ascii?Q?XWpzfojGQuq6EVE9B2Jz7Gk9iB7mAptSCqsLive+2sQGTQXW1jcquNSnhsUL?=
 =?us-ascii?Q?ylJcY/JIut+MeUpm2xJgOheiFJGFkOZX7e5Lz6CNjFGaByqJnO3oOiHL6Bxt?=
 =?us-ascii?Q?ee96vHxrZnEkzMuZ36HNlrcY01dViKQvzXy17sCajlijcUD+g/UvhTIXmp+T?=
 =?us-ascii?Q?q/Rhti9oJZSNLmnKfcv7ejPVpATLTHP+bB7yyCsu7nr7iNT20ikjHcGaWcxI?=
 =?us-ascii?Q?Y49erHS0J+b96LhSH4xb4Vmc2/Sxwa6spoU/A82Kr+f8Ltez+IrrsYJJivMd?=
 =?us-ascii?Q?Y4CeioGnQwbIN4q4dv+Qm/P8EyAdGJuls1SXyJfE8USlO9BBKa/Jb4k2XfMP?=
 =?us-ascii?Q?n0hrMHvAS/yvK6i1EegEtQn9j0vxLB4Izybae/wjSJF6PMgPev1rol68CkQN?=
 =?us-ascii?Q?WXdad487IGNnUUZ2cAAYeKGqcAC2LA0FSbkXdd5ReFVqOUfvqzCFa15FHN6R?=
 =?us-ascii?Q?U+sXTtPw+2KPk7iILDU+X+4VpnltGjN7ldaU54FZT83WtDsL/ZEu5PcA2BEO?=
 =?us-ascii?Q?xKQgr7WVUB5uVp91D/PqAOW8GgbITR+o3LrE5Btx93Uw/tlBQhSJYCYcpZi6?=
 =?us-ascii?Q?TT3U9h7F4E5D2hcji60RdcdlkjVZkedWhN3tC7tJ1WAJZ/iPbSw7iYBBhjNh?=
 =?us-ascii?Q?jRGoBcHNg/j3/+em00BreC7swa2BCEleb9NihT5il2AwGS63D2f3XRDCiWz6?=
 =?us-ascii?Q?lRxEUNSeAIO1tJxgzYlNxAvH/qV+bE0SAMW4ZbIBiaz1Z3QnV//SrQdptzgP?=
 =?us-ascii?Q?yVtU/pnpWvA/Rxii3QgkZloQETcg/azxmTOmr4vSYxhzwt8jx6/8IBcuLfKr?=
 =?us-ascii?Q?Lu/Uyt+vsA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0127962b-c815-4430-be8b-08d9befa1589
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2021 12:05:56.1306
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mJljCHMcTUHfqlav/y/6u7hJifkLhfCaTINcu1skFq7wfOUoCHraglPnuB/N3Zi2PCa9AShL/kkBhNIkiJR8g5F4To0N/qF5igs+RemxhAE2BO2IGUpj8h7pLMVAuE8o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3436

Hello Oleksandr-san,

> From: Oleksandr Tyshchenko, Sent: Sunday, November 28, 2021 2:52 AM
>=20
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>=20
> This is a prereq work needed to add support for S4 series easily
> in the future.
>=20
> We don't need to pull the whole struct and all instances as Xen
> driver doesn't support old Arm32 based Gen2 SoCs, so there is no
> point in keeping all differences between Gen2 and Gen3 here.
> All what we need is a minimal support to be able to operate with
> Gen3 and new S4.
>=20
> Add Gen3 specific info with only two fields (number_of_contexts and
> num_utlbs) for now, the subsequent patches will add remaining bits.
>=20
> No change in behavior.
>=20
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda


