Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 337ABA05C57
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 14:09:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867265.1278720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVVoM-0008NH-0G; Wed, 08 Jan 2025 13:09:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867265.1278720; Wed, 08 Jan 2025 13:09:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVVoL-0008Lq-Tf; Wed, 08 Jan 2025 13:09:25 +0000
Received: by outflank-mailman (input) for mailman id 867265;
 Wed, 08 Jan 2025 13:09:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sbNq=UA=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tVVoK-0008Lh-Rc
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 13:09:24 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2614::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7a782de-cdc1-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 14:09:23 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PA4PR03MB6895.eurprd03.prod.outlook.com
 (2603:10a6:102:e7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Wed, 8 Jan
 2025 13:09:21 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%5]) with mapi id 15.20.8314.015; Wed, 8 Jan 2025
 13:09:21 +0000
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
X-Inumbo-ID: c7a782de-cdc1-11ef-a0df-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FKgdFlPBWHKBgce2TLf7XdWlFzGhcemWWXUzQw6JvGiCj0HBNZgTBtOofNA+r5QkazLB+YZ+xrT19ncAQ0sgV7A0x8f9nOd9O+T5IwsSxeROTYaPKAFebJreDhcg3ZtJoe9n6wQvcv8ovBD4SMu8TLTBAdzqYfiz5/fkq1l4PjXGH0i6F897lhEniltoGKdq+bFWXhS1TybZoQBKwi0PkzlGS0DVUdLWRthKYO6Wd7NsmwSEqeY0CCAtwpXcW8fWbOBhhZikTiJfVAC0DqOC64oFx6ZTvWfkbPV7nIuCE6jcApL6rM7fckUG6hewy7BWsaJNQQtbofNNkoKIhmFnqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hphcGeNQtQOWUxeiqUkslXz6ydJL35lNkX6oGygJz1E=;
 b=QUR3vI25AWWUPU4no08fLnMXk9jc6/drLEC8GiKwZ4t2F5LUZ2HkIf5Z46lwudkej7tMqHFLGWwEmbuWNzWaj4jQVJxPUNclal/cCC4Oy8Dpi6lHRYaKeENtYnaLpEr8pB6kvesA0x9Y262fsc+OXLleeb+zsWTpHsQjw8qFXV2+0rt4D3q1xRMJfnF091oKDiALnpoHrh3bB5hAPJVu5phDfCRncpeNuGDF0desLNjsKNoXZEQBgWl7M0Ovifpbllp3PKdyJw5eJ1Z2+/M+T6vGYTepRQWpcJlcJ7bQn0BPiQoYCPv/qClIVQNrkwY8FTO2AIenhlnKxY40wOAS7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hphcGeNQtQOWUxeiqUkslXz6ydJL35lNkX6oGygJz1E=;
 b=KuKoIQmA6+QeGA4dPLkOZqj/0hIjgHpuUOQl3EUPXYMhcXLkIxN/Tbipmj0E5GgyQv4dUp4iRL0RZG3kij7DYOS4tPz3yJkwWW5fDv7+J9B2yq3szOn+ao5eTs2GRoDCXQaWhMVLnt9FVXssA+DU0JxfVh93kUZxtVeo9Q0bQcS3uWtpQZFGT0RddpjIKJZUBu0vcLFL/q7UDWHHZnc1XrSJaTEkjDHFBWAZsXP5j6emkcikRwHYACsGCPUtes61BaL0ZiPn39UKeAYGD4xGgaHELscFO9QV2WmuoiPuUlN5IjiZX0k5SMD99ipIKlxEfkqPZJ+mEw/etIpU/AG9JA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 0/2] Add support for Renesas R-Car Gen4
Thread-Topic: [PATCH v2 0/2] Add support for Renesas R-Car Gen4
Thread-Index: AQHbYc6IhXIawRtJ8UKmLGhtEwL49w==
Date: Wed, 8 Jan 2025 13:09:21 +0000
Message-ID: <cover.1736331828.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PA4PR03MB6895:EE_
x-ms-office365-filtering-correlation-id: f9fd4a7b-920f-4b5a-401d-08dd2fe5aad2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ztZMi01JQcb47k/l86ZgTp+aAXiSJld4NYbablPojzivlDCKG6xrFC2zEC?=
 =?iso-8859-1?Q?NbEilrMqCVOMjoJK+IFezbA2TFPp4z0AfFTvj1FceETpAC3EzEV1qI0Ipf?=
 =?iso-8859-1?Q?h6jvl1vSL+jfEUykkCsgxXAqxEdpHSRDt2OW3MNo2VG1MwkRWdo61IZ0o5?=
 =?iso-8859-1?Q?yVN0J7a5BPhQvrusuLPiJ/nGZg/Uwffv0K7dpPsKQJsOx2tLJZcf04JDiv?=
 =?iso-8859-1?Q?SniW4axEWNZXX8kc9HC2YeDET1IcnI24OqV7y+LyRYBZNwTWxAFar3qwHt?=
 =?iso-8859-1?Q?YWMe7IprUPa5VjVEisy/VdwTMlnYfQDW8QjRJFHfIX1+t9jYCt6qmT0/TC?=
 =?iso-8859-1?Q?54NUQkYmHEZx6P35jlbrPwWhOmou0833wJOVXrm6qCBsZgIL2jlMJZK7x+?=
 =?iso-8859-1?Q?rx2ivmiY35xZw30yu9B3AXR66vuQ49XtWa7oiZuqfIxJE5b2KjtVt+RLIn?=
 =?iso-8859-1?Q?fMAX8xYtQwtIi8y8WhfX3/QnWsbx63y4eTNo/7JuIh+uxM/+sVBuhesAFv?=
 =?iso-8859-1?Q?zHNBFlTPtVrVwE0QHkPY00X/byinH/VyS3jNEmifprLmJRMC7mn/pB5YxV?=
 =?iso-8859-1?Q?Ps8JtVkrZRW3udUvN4lfCE6CHTLlyser2efvlXpylET/7NwfsEBfJNWBo5?=
 =?iso-8859-1?Q?IBRsZkHAQxQuXMGfQ9K+aIVuGXxSSPGjBaZ23bdExgxfBCIxe6VLVRPCjT?=
 =?iso-8859-1?Q?/6K6n2ALvuVP5P8qcsRN5WMZpZ/y1UdMkAVkLQOUX/mjDHjmHBFhilwSYU?=
 =?iso-8859-1?Q?s6W1lamiB28BLRLcGU9VBHe3FP+BcgpwQ+Jom/g2ss17jE+4sSNyS0GfAu?=
 =?iso-8859-1?Q?YpoEhMjOa/uC2ECQdclzQjWqFn1dRdXsrjMhuOeslGczDMqS3ij1FO7a3y?=
 =?iso-8859-1?Q?EYmK42fWSKbFw6w4xQqAwj4XRJjzGdM0KwIxJM3AwbxfZoaRdFDFYPzBxb?=
 =?iso-8859-1?Q?uB+SI/xYdOYaqwm7ymtkULypERSO1iVsBjRkZ+ayoycbGueZGVetEdgtE3?=
 =?iso-8859-1?Q?8LHOLsuQOPYEHJjT5TW/qTIxuymHWbYDJJQEyYAugvl5tegFcwCib52Rbe?=
 =?iso-8859-1?Q?sFrsLcYbztrLh9rpg1gr/HBOS12/rmDFeBEIFHSKrReW/p8QhmUvE6TjnN?=
 =?iso-8859-1?Q?cadL6oE2Fv+h+pW62ttH4xs016hfJyoVHFxzSa9hb+UiNLH4SpX914/v2w?=
 =?iso-8859-1?Q?wcWzLHAl3SRHvuQxXQSkbZzMN26hv+6DKtcl6DHltktQqBYoin3ZY+kSRz?=
 =?iso-8859-1?Q?O19pOWjbQJDGDckHDX0DuJGx1qMnXYmKYHDfc25M7U5dF92g5hkVzqBz2/?=
 =?iso-8859-1?Q?h5iY2ZR9dyKPFcrli62t8jWEeTRhV6jmOtLMeNn9oAZX2hGkf/Pd3ROlgo?=
 =?iso-8859-1?Q?+Rfw/v+jk3n98f7ItMJts6Cwm5gw92DeUvchKvKJbqSQX4bHsfuuEeRPma?=
 =?iso-8859-1?Q?Ku0/nnivoKeFvXTEuhdDvTym2jxlAEI384D29nosqmbLD/r+ePjh6USiIl?=
 =?iso-8859-1?Q?cXTeShNi6y+rTIQCYmuj5d?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?lsP4Ad/lAIDi0kyfwNUep7W6i3RaVnT2pUQm2lP2ZJOQGaMePNGcKmAERv?=
 =?iso-8859-1?Q?00q2VTub97Im5k1J4wV3pd1PybPzhSv9CrMq+BkgzpU+265VF70aJyNnbg?=
 =?iso-8859-1?Q?2WLujurJFhcQMOU1aXW/81m9myoim6MtxsJSD0C11OTDBSwtURNGR/nLyw?=
 =?iso-8859-1?Q?5Zri5hit1/PuJWDdZlwQnM3DKSHLDmy8PATeqxxuN8uN5eiuIdcTZ5sAkq?=
 =?iso-8859-1?Q?2NFvk2dTyfZjgkjB2DkHV2cdOx3ozTirx/0IKHGi7ufd7OdWrTDjkonZtK?=
 =?iso-8859-1?Q?CM5OiLnGz6Y99zPwk3BEL5OxDwu9h9No6EHcThgeA1NRKVjiT9SURia7TF?=
 =?iso-8859-1?Q?K7CkDeuCabOUf0keyDf3kHx2nQR7iGmZkD73gzZBFQWxHsH8MvBbJYIK/y?=
 =?iso-8859-1?Q?a07XH2m0VdQ4QLDHXeU6N8SOE2icxpFJpWTXZeqWGH5g7LWzGi8K8ITr0t?=
 =?iso-8859-1?Q?CAuPqySajT8uaLUciYtAavFP0s5i5LlHw+4r7UDlD57cOGm60DLi6mTvwp?=
 =?iso-8859-1?Q?qUQzkx21+6JaZ9Meee07KQzsRtdQxkevb5baHa3/jDKJVI9rU443u6EKwm?=
 =?iso-8859-1?Q?I+0/mUT1iM5aQKOlrrRz9bCssYa8ZbUNe1nmZEro2bc53rni6ru6+U3iZb?=
 =?iso-8859-1?Q?EQXEAKFLKCpoCQjG3zAXCwX9xT3GK6EU2xmknMynadAMEYR8Q3+D5FymW4?=
 =?iso-8859-1?Q?IUs2HJCt0urPI5XdvFsQzB28yeGtP+O/sN9xgEEBd9+JaXbRkX/1G7K7KJ?=
 =?iso-8859-1?Q?F1cGHvbzywU4+8T/bqhU0YLOHaAwt/F23CLlV3Hc1N7rwMJgIkVHB8GuvL?=
 =?iso-8859-1?Q?95qJ8hWY+mRQBbPa4ncxb6pfYFcTO/jBRc3noaR9omFMk5JQ2QrjIL0mAl?=
 =?iso-8859-1?Q?gmb5yhsqt89kmlw7hl5VBteXcA/uy29Tngtb/ir5EEsd1/KUlK6d3ZAHn8?=
 =?iso-8859-1?Q?/X3OFAeLcI3G7VHN9JE9qCzOVrT5eNXDj72OYfjp0JDYDUpBoHZ/K9xi3w?=
 =?iso-8859-1?Q?xUu5KKtl7xblVrDZmGXNg5Dh+BHa/XfMoFWbjlJhTLGyAYG6+yTZuBa8gh?=
 =?iso-8859-1?Q?xgFKVNKBx90CpLZbMLwoYzwTHQWQUZs06U18x01VKfdQq9pngNaPCiwjCO?=
 =?iso-8859-1?Q?EbM+Na3FIAHgo/5Jyzz6UhoGvuDljv6coAKeJN5wTH+jwntjGzp82sVYie?=
 =?iso-8859-1?Q?g7ZyDMr7X+QoRTFIn376UKFFYTT1oiLUyQwJqK0ZmzAjZ1pEMk4nkXNkBh?=
 =?iso-8859-1?Q?rH/3ZH7rw5Rh6cCICB6nbp0KK8GJa3sXHKufRPagaP6Wh3duZcWHQadECs?=
 =?iso-8859-1?Q?TR81B3TdFdJw1aavQkwwKvPO1AHTJEJ3iIIV4lf9ZBEBXBe6txPDPyAjmE?=
 =?iso-8859-1?Q?udJXVjf5CD6+7A2tOEkJTD8y9Ym5V8whN1EJAXoppVu/BHbv7H65Y2g6Yu?=
 =?iso-8859-1?Q?fgCUalK6WknwEdbTbmBC9FcsoE6PfVOqvoTBILnhEeJJ1cPUXYnz+3jjlO?=
 =?iso-8859-1?Q?dUYWOJwYqP0ha0sAkVq32pTJzRIM1ciVCsr8qsbleWxgHyykLjZzbor1wb?=
 =?iso-8859-1?Q?FcmP5Evt1a7Dwa1Q4dnCh09amnRRvH89peefGzB5AEjXllZIvKsE8D6Usc?=
 =?iso-8859-1?Q?lTYNah+R+08g9E04uKD8cbVW7ugoINPRKLQW6ajFV8L3+IVklZn1rSfw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9fd4a7b-920f-4b5a-401d-08dd2fe5aad2
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2025 13:09:21.6092
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tFdInGf24KyTKCYWF7v6MGCShl2C6tldmrzFrHrove2dgeb+Vw/srh4aoPzgjuqMV/WiZOg6+SJytF9UHHrTkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6895

Add support for Renesas Gen4 boards such as S4[1] and V4H[2] by adding the
appropriate confing option, and support for the Gen4 ITS.
Tested on Renesas R-Car V4H board.

[1]: https://www.renesas.com/en/products/automotive-products/automotive-sys=
tem-chips-socs/r-car-s4-automotive-system-chip-soc-car-servercommunication-=
gateway
[2]: https://www.renesas.com/en/products/automotive-products/automotive-sys=
tem-chips-socs/r-car-v4h-best-class-deep-learning-very-low-power-system-chi=
p-automated-driving-level-2level-3

Oleksandr Andrushchenko (2):
  ARM: ITS: implement quirks and add support for Renesas Gen4 ITS
  xen/arm: platform: Add support for R-Car Gen4

 xen/arch/arm/gic-v3-its.c             | 141 +++++++++++++++++++++++---
 xen/arch/arm/gic-v3-lpi.c             |  20 ++--
 xen/arch/arm/include/asm/gic_v3_its.h |   8 ++
 xen/arch/arm/platforms/Kconfig        |  10 +-
 4 files changed, 159 insertions(+), 20 deletions(-)

--=20
2.34.1

