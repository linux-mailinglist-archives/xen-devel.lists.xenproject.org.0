Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06ADBB30000
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 18:28:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089071.1446764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up88R-0004A2-EE; Thu, 21 Aug 2025 16:27:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089071.1446764; Thu, 21 Aug 2025 16:27:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up88R-00048Y-Aa; Thu, 21 Aug 2025 16:27:31 +0000
Received: by outflank-mailman (input) for mailman id 1089071;
 Thu, 21 Aug 2025 16:27:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6kfR=3B=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1up88P-00047f-MR
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 16:27:29 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id baf8a0ad-7eab-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 18:27:29 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by DU4PR03MB10600.eurprd03.prod.outlook.com
 (2603:10a6:10:58e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Thu, 21 Aug
 2025 16:27:27 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 16:27:26 +0000
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
X-Inumbo-ID: baf8a0ad-7eab-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=khZScyQRrCmK1ggd5WuXyjDnVjol1AzbpIo6hMTdG7LHkUuq4cI0wIktjBgBKWFtkreDnbacHMhuW1SKXU2M2G1ItoD8b40Xh/P7DRyUcJl51Sd0oBCapB+fnXoa99RpGvJrDJsxBQX8r7f0bZkK/9TrQWBPt+QSKHXrbUvSkna+l4Z+/sIpZepo/doOj84fHZlZpOOpVFQFuzcMWzxYtaUOXv2M5JzlQ3Nup5Rk8Kthi5WmPbAREfbzg2l8os7eRY+nVXPqu+3NsdP+r7zXnTTFUOWpeqq8FeMOxYlg/R16Qy6uygbPO7JtU6sj/RmZnGqD65uYqe0PGnbxraA5Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pi2g9RJJIRAJzly1Btetk3fZjJYNdeVEiwRaS/1xOfI=;
 b=KL3v25kVJ8qJU2/UX1KRIwPIvsglYX98Jj9yvtxESAp+IKfYaIX2GKjmDEaEZmDCq5luTwmXPZhe80DCXDnshF3oCFDfKy0OW9lNRNj0mc+ROQmwI4cjDLl/QZHxQGK1HC2QX8KSqjhKHJqNZKOlRwC3/G+qUOJ4OYjXumrtDm75veVGKPn0sB6OHTNIHYdQCRoPEZC4tEkF5DMerXyzOnfLyggEFzJGM8k9rq2HiwT73sok6bDW8xQvelK7AwZoacqkiLKgv+stT+LPI8eexm5DZ9/mpU/khie2oJV/QqFIC5vskdR1J0WDDGD4ruNagZ7B425Qz7EuGaZKxWsYjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pi2g9RJJIRAJzly1Btetk3fZjJYNdeVEiwRaS/1xOfI=;
 b=N65asH4jNN0HiKNx/nBTYhIJypxgfRvn750q2DaoBrr4hK0ZFfuTNp5IJ0rjOYqdz6aA9kZ2vH6fvaJzpN7wt+DgZFAGEvd3hCU23mn3zRUip5BJTNJPEIlFT7i2b8t90jYUX+LGKnQ1NbvLXGG20OtHuw8PDZOpDmjZxhE+Yr+vRTONmpHTdLilx3uzbhew641PYLA7ArA+PRb2mjUDgE0UJAGCb44gG2tcZUu8g9dJmDcU6uOyAphS4MhYdeCNEWK2rPQMMU0pH5wdDkZSOldxKHNdKriyhI8nQNlZSiHU21tYdxaUXc6Sylhgalx5adEpHhyIyLTjGMfABlFCqA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 07/10] xen/arm: gicv3: modify ICH_LR_PHYSICAL_MASK to
 allow eSPI processing
Thread-Topic: [PATCH v2 07/10] xen/arm: gicv3: modify ICH_LR_PHYSICAL_MASK to
 allow eSPI processing
Thread-Index: AQHcB5d+mzEvAktxmEWCQ8jbw0fsdA==
Date: Thu, 21 Aug 2025 16:27:26 +0000
Message-ID: <87349kej2q.fsf@epam.com>
References:
 <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
	<c712d9187bb0a19ded1a8b28d2f9ba93815708a9.1754568795.git.leonid_komarianskyi@epam.com>
In-Reply-To:
 <c712d9187bb0a19ded1a8b28d2f9ba93815708a9.1754568795.git.leonid_komarianskyi@epam.com>
	(Leonid Komarianskyi's message of "Thu, 7 Aug 2025 12:33:32 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|DU4PR03MB10600:EE_
x-ms-office365-filtering-correlation-id: 047d7178-15ef-4e8c-17f7-08dde0cf9dda
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|42112799006|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?8XeAKVytJVoOUXwoeeMp4mxRoW/9UwK+20KCZbNyVFFCodxfdT8mTTXPm6?=
 =?iso-8859-1?Q?xP+IY5QfZq0EO3yV+aEy4/+oCF7NBuASb5PzwGsUAwlAwdvmK3RVHVdxMC?=
 =?iso-8859-1?Q?b5b93QQfjDlouX5iF3tcX6g1Y51WE0UqO9O52Gw+gPElpBSOnNnze7S/S5?=
 =?iso-8859-1?Q?drIO2sjEdKvE/+C/x8XzJJQMHcpDxHKI9OgLEMUv+VTCydm85VrQiQo+DF?=
 =?iso-8859-1?Q?Me9FD+AYIXnQ25x1RC5jK7dQZ6yb0ll+gfmuhVtIO0q7NjVa4mbpxN0UYw?=
 =?iso-8859-1?Q?FgmMr7+YNidbCqgweCw7aYmFJB40UQGdJeGMVX5g9hYkhPEBeNZEJhq4RR?=
 =?iso-8859-1?Q?NXo0J4d2P0WOuzXr0ZGcbsL3G2d2e0f1ckqwb5X9ilfRPTM1TAtYB5HlPS?=
 =?iso-8859-1?Q?ncm0s49LN+YTrGRue1Bm+vA1snzUMPGTuW7uIH5uCNQkeRRFYqjnv1IRMs?=
 =?iso-8859-1?Q?+8Xrb7JAgLnGnrv8XLSoVjbhjexVa+y+5kzcSf1+pwoLW+xieQ9MaCxmk/?=
 =?iso-8859-1?Q?p9ZCkS8Oub9BWhzviITmVjem+eiN0rBwXRjgMsl+90X297goMRiJU6sRc9?=
 =?iso-8859-1?Q?zyG58tRUMFNiQbrplWK1o8YJsm0JlHw5aIZNH6D4gqrt0TReoiIGIlOZ83?=
 =?iso-8859-1?Q?EwfNpjRexK3oCRShUHtewDJ4PS4Eushd/iyZawxMKuWbLWTq9tN+0J3xbg?=
 =?iso-8859-1?Q?vlpajOHUBiAZwEdkHrkFcirVbw09zgmdIlty8avpx3jsmWw0UOMmmCgL4n?=
 =?iso-8859-1?Q?G8VopHn7dc5ceaozUwENNAojwQHVzWOWS6xuBUntH6MV6nvZQMKqQRHeRm?=
 =?iso-8859-1?Q?BLanA/ra4L2V4H8/GKQ9a3N2no2lsvrX6qC0YP/EhL5j+D5OH/9dvGBs8f?=
 =?iso-8859-1?Q?OlPMiHKhAXQ8diQZmu+UDoMXHPEHAny0mseBidgjwW38oYS0R7CL29ymx7?=
 =?iso-8859-1?Q?aOKOEFDSsCSg8XptcMX+uykA7So5kegvCWX69PUMltWU9kkSIqtCuZ8+9y?=
 =?iso-8859-1?Q?kVjL9zPtRkbhZUnYmqlrG/Q7YJLD9ySsDaaFIAYbVzStI56M8tBU8oP0p6?=
 =?iso-8859-1?Q?QN+3lN4uGnYls5Fb408kNmtWF7uq6I6noUeIZvxx0MohWCLvRD5YJyTmqo?=
 =?iso-8859-1?Q?X1xPlwJReDPSN5I3vn2xjjcACAzodAvvia/p2Zrq916tFtDAjtUOfSjdoo?=
 =?iso-8859-1?Q?YqkWEsa31GhcfAK80enS4sP6lgb+sF4zYoah/vqcHzaMsZM9Awzmw9mnar?=
 =?iso-8859-1?Q?JjRCm+EAjby6Y3jzgwVPi4eLowsWrTdlFW11+uB/iT5SJ0jP0iePHsb/qf?=
 =?iso-8859-1?Q?VHb3ap//tqbqXHrPZ/7tmkzzkZYmhsuM2/dsonKtr2ARPOfaOdx7V4AMXf?=
 =?iso-8859-1?Q?WQDOTkAh9CT/qyimoHnTwQRpLacBfe6wRPKhV5DEgHjjamD/2K7Fch0uq8?=
 =?iso-8859-1?Q?DqBcPogqdJAQCvZD/EUxXYRlHorK9rNwgb75HOckbVAGuGn7oP6ITR+6xV?=
 =?iso-8859-1?Q?i0JMVmMhz9tkXpxbczbXSXu9qIKRW6dkq0wMyba4AWVQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(42112799006)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?jj2/ZDb4om8ANRI9haUvNxX6CpJHaMyhkWFs8E1wf/YdHfnqSfv2u9qUq8?=
 =?iso-8859-1?Q?7zxadxR+W4DWj71pqQUdlEzf5W4v6/sAK5zl78XiyIX425Hi5KygZT2AN7?=
 =?iso-8859-1?Q?EDP3UXKV+QVHPmSbyTReBbq4ZuZt6ehQ5MfJCjI70ApMa/fGYV7mhk0HXA?=
 =?iso-8859-1?Q?Ri4wDYFHCatgmdML8DVw90+yBxQVxx9p5JL8y26Ti/kH3DSIeYi7LZ7F4w?=
 =?iso-8859-1?Q?kVPsf7k9KUVw8dj7Dn83mJ/7KB69krBnJ4pZQkpFyG8Xw/SKx+VfOQxnqi?=
 =?iso-8859-1?Q?VUZxSB1BjW8mkSpu7pILWBHPhy8QrEeid7umk3aAw7Jn23saJZDGKYPG4I?=
 =?iso-8859-1?Q?ywzjcob+0kMDOdTZns5fgCe28EZv+gsAIRVa6yCfiX5NWc4NKRMWjwUGMc?=
 =?iso-8859-1?Q?olwVMLMXQDt+zp6merXPsLUfR+hhsAWUMhtXqFDWNMBH2MGs6fSjQpIkS4?=
 =?iso-8859-1?Q?C0/ylPvf//c9AuyV9vWXHFJOhin42HG95+s3Ayuti/2VFWF5ad1Xg5accB?=
 =?iso-8859-1?Q?PLU+WHFMUHK1iHFxxh7E5RDVG2NC14K8/7Lq95WSHF9yEkG1QRwZJ8stPY?=
 =?iso-8859-1?Q?65WoID7Wb2YeG7o3y0HJJOc38NJe29yQ45XSxY5ibUmJBoGzMAeDa6yFlN?=
 =?iso-8859-1?Q?o/hTSnI8Lq9CbbcAnT8ZWaVxs5uXVB9S2aTxnx09A4k4KMt5RPljDWIcHL?=
 =?iso-8859-1?Q?Mnp0bJWF57oP7se98I8bqZy6P7U/U4trDlCrcS81UXAbfUYdI5VOR7ydRD?=
 =?iso-8859-1?Q?7ud+Ml6EZIEUKHgtRrqyT5q+QiFLmPndsMKVFuJuPhRrSmUCBtUHiAfaOw?=
 =?iso-8859-1?Q?xdm9LMNRT4DNcGNbcbaPF/XETrPoF+ghLjRu7xxd1k24X/b8VAkecCtcSa?=
 =?iso-8859-1?Q?qHlTsQvHvu7R1Q1T1o0pVdy2P/pOHfzXero9t7loaJnxYGExV4OuGTK8bb?=
 =?iso-8859-1?Q?rd59uXCtx0MK1yMl3WDz5H9ubVQBsrpoRKD6T/jBDUuUGaXu5tq9KHvgU0?=
 =?iso-8859-1?Q?g+PNHBCNSpcTKcA1yLaWqJujX0Izd0R19zm1SgQcCuHBjNpYyN6wwD+qvL?=
 =?iso-8859-1?Q?NjQbxvTvZoxY3yfa6kZcKiWfKoeY5gfT8o/wghFv5K62ATkOatKmBykwRw?=
 =?iso-8859-1?Q?2TxjN+KkHokqtMGTVTPj4MmeebBdOLAWHVe5Ek1IZ/cq4qd/XAuzuqoa6h?=
 =?iso-8859-1?Q?+8K2lD7gUBP8zGS6LQM1asYW7caEdlbwZ14vBRERlG3d9Az8mbDiFEuMfT?=
 =?iso-8859-1?Q?DiRIYHJxRjrmeKQn+FFWPk4L0x3Awqp6W3btPLskKSn9NlCTffIB0lpMfs?=
 =?iso-8859-1?Q?LJXS/PGLY7bixHxJwS3Px1qNSuzm7pBXTxblnSAK/DwAD25mtgl9opjQ32?=
 =?iso-8859-1?Q?viAT6KLplxicf6hT7MHrMx0THrLpdvxwNZm9pojwrufDj9g1zn4GeTeBga?=
 =?iso-8859-1?Q?9xEHOdLZkKev0KNAUCAxJo87q12iqZV42FIMzEsqL2doK/ZUMfrlN0DbnH?=
 =?iso-8859-1?Q?VuLQ+7YrZXE1Z6JR+OrHNmW9T3lLADc1OTZKAP0WPI9P99IaBq6YdvPUxF?=
 =?iso-8859-1?Q?SoR0EMaJ2OkrkvuDZ204nnhvAFdB/WmHHirVDLbSuS24bSpEa5vrPvJpWO?=
 =?iso-8859-1?Q?kb+n+NxYrdRl2vhjkKlrtEV5QqcKCptQBNY/BUXvam6TP8GHLUYmnWcQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 047d7178-15ef-4e8c-17f7-08dde0cf9dda
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2025 16:27:26.7606
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O7iXew6lUfyPtSBfSjm1TvMtQ+wd9QZjNoAL4iGIPfCyk0o/ymAgnQUYQmdq2dzpe78S2BrY+RZKbrUYxOgY/x+1xihjR7DqlW1eDXP+P0s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR03MB10600

Hi Leonid,


Leonid Komarianskyi <Leonid_Komarianskyi@epam.com> writes:

> To properly deactivate guest interrupts and allow them to be retriggered
> after the initial trigger, the LR needs to be updated. The current
> implementation ignores interrupts outside the range specified by the mask
> 0x3FF, which only covers IRQ numbers up to 1023. To enable processing of
> eSPI interrupts, this patch updates the mask to 0x13FF.

I am not sure how this supposed to work. According to the arch
specification, pINTID field in ICH_LR<n>_EL2 is only 12 bits wide.


--=20
WBR, Volodymyr=

