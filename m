Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E2FB43E8D
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 16:21:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1110288.1459596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuAqN-0006vG-1p; Thu, 04 Sep 2025 14:21:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1110288.1459596; Thu, 04 Sep 2025 14:21:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuAqM-0006sY-TF; Thu, 04 Sep 2025 14:21:42 +0000
Received: by outflank-mailman (input) for mailman id 1110288;
 Thu, 04 Sep 2025 14:21:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m40+=3P=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1uuAqK-0005ts-Sg
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 14:21:41 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7867e3e3-899a-11f0-9809-7dc792cee155;
 Thu, 04 Sep 2025 16:21:38 +0200 (CEST)
Received: from DU0PR03MB8934.eurprd03.prod.outlook.com (2603:10a6:10:473::15)
 by GV2PR03MB8751.eurprd03.prod.outlook.com (2603:10a6:150:a8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 14:21:29 +0000
Received: from DU0PR03MB8934.eurprd03.prod.outlook.com
 ([fe80::26fd:98f2:a1cc:be40]) by DU0PR03MB8934.eurprd03.prod.outlook.com
 ([fe80::26fd:98f2:a1cc:be40%7]) with mapi id 15.20.9052.013; Thu, 4 Sep 2025
 14:21:29 +0000
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
X-Inumbo-ID: 7867e3e3-899a-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fs6TctSJkznTpWPDHPMce9dPh9CwBCgXTCTnzypmreYTlSpZRRCW13q2a8oWVrdbeeUVISOwq86dbKU12HlroATrYj6KAfbYXXjzAxaB6/y/n5qTgGCcFHnkxXpby7CQV74FEnGTj525Xu8QStsln2xSx+DDPNfKhmH6XQyryF3vbx1twAuGyrku+C9uL/Ih6dv9ulOFF6OVrV/c4NvJTs2XOgavIZuwmy2KnFMxBFOqNZXqhs91JgtrukUfl5s8IGwvnMeF2zkynmgNpC+UeXlX5Pd3M6jMfILqxUPi1knH9bfFwKF+yxwB3R/LaE+FAXYSbDdmJNyJvhgBVyFUlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=teOFbImDoAuyxS7ou+OcBlhl+FQv/TEZwzgs8NJKvxY=;
 b=ZLC+/1eSYvE0LowxRh+jlJu/eljWa804S8jrSNaZfr45tTAYdottIdRmEXXZigDS4bR4bnayBGSt0MogCtjSCq/BNwMUXwq06FsRn5CRizlpUpNwYuGwvlJ3PUIb/3f4tJBndOWfhgFjF879gJRnum8h+50fuN6kum1y1+cgUKbDWi9oRa96xJHyrs669vYOA68TL9KL1a3T4w45kH93GpE7lomnpxqEHpdpO8Pdw+/Gd4NbksU7d/ahFya3Vy6OgFOMkTQOJ4cT6RlAK0jyitHBl0QLJF601Th6O86wousP3eyJBoURoKU/mGThSYfwrqgg1ca/H0GT36nXEADU6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=teOFbImDoAuyxS7ou+OcBlhl+FQv/TEZwzgs8NJKvxY=;
 b=N+k4/zcpKgSpQOtvI88ZiuKnCEx5SWcFr2h/9uVOyq2JldPeqDOvRVL6qLnaKaP3CX0MaJGwfd0sb09jRZ4cUtThNNUpcRcDZ8V1MM//G2JyQnsZfMD+8FUNGL0kT4/Zx5B+/cRa837/4E86UGkzNzlIyCtTMksYHz/a/v68Vvf4bfbnx8N38o3u08mswD+WJVYHIBOkBqqbOAUWLX9Zzyabgnh/b5sPnUKJOarE9cZWpWENZzK4/o2j6MasGDK88JFNLPW07dQ4eFsjMlr9lUU3Uq4c0m5GL9EFPlHjQH+b5FNQErl9oAPWwitXUf1+PahlVUqeNBAqasg024ankg==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [PATCH v9 3/4] xen/arm: scmi-smc: passthrough SCMI SMC to domain,
 single agent
Thread-Topic: [PATCH v9 3/4] xen/arm: scmi-smc: passthrough SCMI SMC to
 domain, single agent
Thread-Index: AQHcHacz/gTYQbUqxEKwBpOKNI4z1w==
Date: Thu, 4 Sep 2025 14:21:27 +0000
Message-ID:
 <15e6518d9413e073d1c6bbc33dc2bf721ddbfe00.1756995595.git.oleksii_moisieiev@epam.com>
References: <cover.1756995595.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1756995595.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR03MB8934:EE_|GV2PR03MB8751:EE_
x-ms-office365-filtering-correlation-id: 8cdf7f9b-e7f2-4958-ec01-08ddebbe56e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?+wzbPiLEF67njxZqz/I9UOPfK4RghEeywa1BLIJjv4Q31yArguDTnbATy3?=
 =?iso-8859-1?Q?WBM7aSjJn5qzvin2QxKEjrGEjTc48ytd3b2mPG00wVKQ0z+KPDcusnnuBD?=
 =?iso-8859-1?Q?ki22Xq/TbweDbv3QWmBhJ+1ZWOVrxo+CMCKKIFJs7TprHd7SnmaCkbFINy?=
 =?iso-8859-1?Q?0W4kKhiOr+mWMjM5VvceMnDd8syJ9JzBxIN55Gjkn0uONWcs21ybfz0ovY?=
 =?iso-8859-1?Q?/zpZMQFjJZs4WVacCV8TDnlQKFr73NwB69UeGfGs8Y+N1G+B6wNpJVXPdF?=
 =?iso-8859-1?Q?u6nmn3KDpkuqB8ZGl8C0E4+MmwZm6CQH4otQ3P6FrH5+bB1CM47DCIUhRW?=
 =?iso-8859-1?Q?/ZxNdv+KxYUURAM9l1aBPEyW4wKZIFbRF6+Xx5+hHnRZrLzU9B45eBPgLi?=
 =?iso-8859-1?Q?rEfszJjgQ7vbqFd0LMG+dRGqHfsOaH3PpjbpS/+Xv5bgGVjWWQq0Y0yMjA?=
 =?iso-8859-1?Q?ryZVInam3uu0HpS6ycFNpgti8EP0X+4IO4kxHFEbyQzwrDiz/lmjpszbQB?=
 =?iso-8859-1?Q?VZKkXpckzRWETw6uPfWPBbMJvF+5G829i/Vt++0hPjd4UHHaQ4boim29FS?=
 =?iso-8859-1?Q?lIrxcdCpCcTs0z6L4ZwqtaIjLtILZZKhEQeyz9+nsokGqfHSs14eY6hsnd?=
 =?iso-8859-1?Q?E8StlKgBYPz9D2yFzgF3b+4bt5JIwoUrUkEvjiF1HoBlv6owcCDZFjGd/2?=
 =?iso-8859-1?Q?8C1wE26Uk7WqArfk000UqEPXhawG7kSGN32Be7VF2aDByIKV0uz2Jxe+w5?=
 =?iso-8859-1?Q?Edq7Pyj0gp3zBajiqn69zvWReJyYCIhW/ZFrUtBIS5yTDKvJWM6ynatvSu?=
 =?iso-8859-1?Q?OP73W2tHyQnkB8F4KKv2hTJAvOfGTJ1w+mZh17g6cSlyTDBE6XnZnky4ee?=
 =?iso-8859-1?Q?nlGzJlREh9cfXWgBbp3PbGncjbJt1mnhsxtrQjpz1CuLXpSwT0SPSkOYdw?=
 =?iso-8859-1?Q?XF2j29fhW+y3kHoakqJ9DOjtoMQE1BderVVqYvYbVabjrO5nN3ZQzP29gD?=
 =?iso-8859-1?Q?Wr6/TiCjr0pIDwU3MCeD5zign6y0KlosufGK9e1e0fCoDc4R1l9/3qwQ6C?=
 =?iso-8859-1?Q?n21Y8OpyBZZf0uUkJQM4xuvgEM8okk79giB9QHqVXizBFoyC2vBFx/c88z?=
 =?iso-8859-1?Q?qHFLiS4LPLrLmGGX0eur+YE7lmtoXl6eXIiEW2u5gNbufocyB3oEkT+qH1?=
 =?iso-8859-1?Q?KfYuHpFUhLL7CvlYkUtjgnAkP76WOMLLh+CsIMy5sKbEaTpUC8vKbUuclD?=
 =?iso-8859-1?Q?9QNO16hJ754RDmuwoG93XY5r69yCJfEQlUNCZk0hPkfrnDUJ+86G5/KR3B?=
 =?iso-8859-1?Q?FeXQmdA+FtncZ2PMsttIcWswWaBgr1MCK1WgNqnVLI8VG0qgpNzk4sPSyh?=
 =?iso-8859-1?Q?qPzDY9FVPG5lIjXq6X6/3DpO8my2dyAh16tlKKPY8w3thsQPJClKhDi2Bj?=
 =?iso-8859-1?Q?8tr1/ZgyzpvzveivItWAGoQmK8ZQHao76Hf+cCSZ5TM2X3EoHaBj+YnPEr?=
 =?iso-8859-1?Q?+MrV3Z3uhNCUI/fHJhbxQ0m1fhtLGolwzMrzNxm+f0Zw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR03MB8934.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?5n/djyPEJ/iTKUYW8HwBZEOVHDiLSOvGypj8r6biHO4Zw/AS6595JFh98v?=
 =?iso-8859-1?Q?owkXN4oOHb3EUVAMG9avAZt0MmmUDobVQte0BMMpTFiDf3TM1IbaWzczIh?=
 =?iso-8859-1?Q?oYTLjQ8bgo1h2ly/9yalOdXi1Ql5OqaT635viWndOZ6rEM1snrrWPYswZS?=
 =?iso-8859-1?Q?0hEuy+KVO5c2omGGsdHv84/Bbh/MdmsnRW59UQJAV9NCcFmwe7dksHkJ9g?=
 =?iso-8859-1?Q?tqWCWEpnJ6aKjYCtrwXrz1TbM79IDA1sNs3icxbRHZpobpYRkXs/tovpWq?=
 =?iso-8859-1?Q?HXLY2m3bQgLE3gMu/IpBNNkX/CiQXbD6jpf2U1JJ46ww+VxDouKjjXRynm?=
 =?iso-8859-1?Q?joDrIAZzoZgnvimf3DX/z1ayy19wAoE3sUxGxZt7YOkb2JYRbthVKYNfFh?=
 =?iso-8859-1?Q?hMELwel2yg73renlaOJignpIeGD4LW0kqKidkuOyYXSIyWoIb62xaNFpwq?=
 =?iso-8859-1?Q?yJVAaWbiwQeCsCNoB6T3khd3LS3r34t0WoSCc8jFImF79cxR9epCaYcFYe?=
 =?iso-8859-1?Q?L5x6efuU8L/jtiwf8r0xc4FX4x6LmQm0bzLU9iUz9J5zWQ/IJI8BrAoe6F?=
 =?iso-8859-1?Q?hTNSssYDrs1r8FICnL8aVYi9hgd3DwF2fom/O1b/WohFamK9kK0NoeVOiB?=
 =?iso-8859-1?Q?sXf3VQsGPRFONhyVpsjzxVoSONelPgUy55/wfj2zAoX++X9coISq/sXWKM?=
 =?iso-8859-1?Q?PqmQait0CA91GgZwk/BL5AxotQ9y7C7brsHhaHGwLjQT9Gnorz1M0phbIT?=
 =?iso-8859-1?Q?1fnUYzgxN1gL8KuLOkWnxPyUnw1niPyt1dwathWudFP+NoZgPH9v7ltCiW?=
 =?iso-8859-1?Q?GyhaLJ1AfNRCn5Lf0hRNhzJ0Rc+nOQZ4olELJP3VY1YUV87Vdq20cINi+m?=
 =?iso-8859-1?Q?VhqresDP6Z6nj6qtYk0R5dfiK9wMDW7ahQSiEyREtez1EL1roBlLznHTAR?=
 =?iso-8859-1?Q?uj2gkvGo1h4m5kTOMZtd7rC1AvXHCSwL6XxtQPavLzsKU2aVv9YRCUjygw?=
 =?iso-8859-1?Q?w8Zk03AWopzlhjmBge92wO4cj6r4k754YcnkxBVLRhAeWhPvPaYaeoX1DO?=
 =?iso-8859-1?Q?szBfoXUr4C49D83r1pGHla+/uO5NwvHvTjsWtIHjw0uFnO8iCWpYjASSk6?=
 =?iso-8859-1?Q?KlCMvAdyp1Tm8Qy508J0Jj05rMTz73WXI4lBPQ/K67ydXJC616zDsDLkSC?=
 =?iso-8859-1?Q?YPrEz5IFF+XLdiJ6ApKvg0Pq4qLfQ5NYAViIERdryJPtUMAjJljpSyRGao?=
 =?iso-8859-1?Q?bIpIpufz92tqZdI2EhqKwyS4fkw9NYpk5OZuK/XMdu+00uEq3tkFKhjVr3?=
 =?iso-8859-1?Q?t/NdfHMiFbgM+nfHxViPxh61M7o5FUmTU1Ascw7IZLhBUAiKeKPllqSAs4?=
 =?iso-8859-1?Q?T+kPtJCHbT0BlzMmlgM6cT6jqBUQPo/9qzPxUnFkAEGJQedDIlWEU8hThZ?=
 =?iso-8859-1?Q?QVz/p8ZOygOvwHwHyXWBB/cLN+03aGrh2TiFTg2YXZ/N66J3nZXyogx1gH?=
 =?iso-8859-1?Q?cs0immE3eGfopomBk/Q8BwnJI64HDnoHkiDLVyUPmHpCRpgSkHZBJqEPUO?=
 =?iso-8859-1?Q?4j/ewe8cbY5W8JdoiAKIXGiE/zmMe+mJZRB/l80IRKRfTm/PvepThFWm77?=
 =?iso-8859-1?Q?YLN+ylTZMj7/oGrBOBkoUFJTz/FyiLQUva35UM5tXbdi9ktcr2FCBtnA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR03MB8934.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cdf7f9b-e7f2-4958-ec01-08ddebbe56e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2025 14:21:27.9229
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuJ7hfu6jhzbGeS23n1fsgrhLnJMAuA7t6hxzYsZyDiF+1Nk+N9QjDv6IMbiYrN32Y93rcbeK/JL6m2rkV1eZVEUu1a8DFTf45ytk7F+xo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB8751

From: Grygorii Strashko <grygorii_strashko@epam.com>

The commit 3e322bef8bc0 ("xen/arm: firmware: Add SCMI over SMC calls
handling layer") introduces simple driver which forwards SCMI over SMC
calls from hwdom/dom0 to EL3 firmware (TF-A) with a single SCMI OSPM agent
support. While it is working gracefully for hwdom/dom0 use case it doesn't
cover "thin Dom0 with guest domain, which serves as Driver domain"
use-case. In this case HW need to be enable in Driver domain and dom0 is
performing only control functions.

The EL3 SCMI firmware (TF-A) with a single SCMI OSPM agent support is
pretty generic case for the default vendors SDK and new platforms.

This patch enables passthrough of SCMI SMC single agent interface to the
one guest domain serving as Driver domain.

Configure Dom0 to enable SCMI passthrough:

 - dom0: add scmi-smc-passthrough to the Xen Command Line

Enabled SCMI passthrough for guest using toolstack in the following way:

 - domD: xl.cfg add "arm_sci" option as below

   arm_sci =3D "type=3Dscmi_smc"

 - domD: xl.cfg enable access to the "arm,scmi-shmem"

iomem =3D [
    "47ff0,1@22001",
]

 - domD: add SCMI nodes to the Driver domain partial device tree as in the
 below example:

passthrough {
   scmi_shm_0: sram@22001000 {
       compatible =3D "arm,scmi-shmem";
       reg =3D <0x0 0x22001000 0x0 0x1000>;
   };

   firmware {
        compatible =3D "simple-bus";
            scmi: scmi {
                compatible =3D "arm,scmi-smc";
                shmem =3D <&scmi_shm_0>;
                ...
            }
    }
}

dom0less case configuration:

- add "xen,sci_type" property for required DomU ("xen,domain") node

   xen,sci_type=3D"scmi_smc"

- add scmi nodes to the Driver domain partial device tree the same way
as above and enable access to the "arm,scmi-shmem" according to
dom0less documentation. For example:

  scmi_shm_0: sram@22001000 {
        compatible =3D "arm,scmi-shmem";
        reg =3D <0x00 0x22001000 0x00 0x1000>;
->        xen,reg =3D <0x0 0x47ff0000 0x0 0x1000 0x0 0x22001000>;
->        xen,force-assign-without-iommu;
  };

The SCMI SMC single agent interface can be enabled for one and only one
domain. In general, the configuration is similar to any other HW
passthrough, except explicitly enabling SCMI with "arm_sci" xl.cfg option.

Note that "arm,scmi-smc" and "arm,scmi-shmem" nodes will be removed from
dom0/hwdom DT when "scmi-smc-passthrough" cmdline parameter was provided.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
Acked-by: Anthony PERARD <anthony.perard@vates.tech> # tools
---

Changes in v9:
- update domu_dt_sci_parse declaration to match MC3A2.R8.4 MISRA rule

Changes in v8:
- reneregated {helpers/types}.gen.go, dropped unneeded parameters

Changes in v7:
- Fix commit description.
- Move scmi-smc-passthrough definition to match alphaberical order
- remove unneeded initialization with NULL
- changed u64 to uint64_t
- Send warning if iomem permit access was failed

Changes in v6:
- added generated helpers and types go files
- rename cmdline parameter to scmi-smc-passthrough
- fix goto tag in parse_arm_sci_config

Changes in v5:
- rename dom0_scmi_smc_passthrough to scmi_smc_passthrough

Changes in v4:
- xl.cfg doc
- fix comments from Stefano Stabellini
- fix toolstack code as sugested by Anthony PERARD
  - use MATCH_OPTION()
  - move arm_sci struct and cfg params in "arch_arm"
- add SCMI passthrough for dom0less case

 docs/man/xl.cfg.5.pod.in              |  34 ++++++++
 docs/misc/arm/device-tree/booting.txt |  15 ++++
 docs/misc/xen-command-line.pandoc     |   9 ++
 tools/golang/xenlight/helpers.gen.go  |  35 ++++++++
 tools/golang/xenlight/types.gen.go    |  11 +++
 tools/include/libxl.h                 |   5 ++
 tools/libs/light/libxl_arm.c          |  14 ++++
 tools/libs/light/libxl_types.idl      |  10 +++
 tools/xl/xl_parse.c                   |  36 ++++++++
 xen/arch/arm/dom0less-build.c         |  34 +++++++-
 xen/arch/arm/firmware/Kconfig         |   4 +-
 xen/arch/arm/firmware/scmi-smc.c      | 115 +++++++++++++++++++++++++-
 12 files changed, 317 insertions(+), 5 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index acff45d308..3b18bcc095 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -3123,6 +3123,40 @@ writes will be ignored.
=20
 This option is only implemented for Arm where the default is enabled.
=20
+=3Ditem B<arm_sci=3D"ARM_SCI_STRING">
+
+Set ARM_SCI specific options for the guest. ARM SCI is System
+Control Protocol allows domain to manage various functions that are provid=
ed
+by HW platform firmware.
+
+B<ARM_SCI_STRING> is a comma separated list of C<KEY=3DVALUE> settings,
+from the following list:
+
+=3Dover 4
+
+=3Ditem B<type=3DSTRING>
+
+Specifies an ARM SCI type for the guest.
+
+=3Dover 4
+
+=3Ditem B<none>
+
+Don't allow guest to use ARM SCI if present on the platform. This is the
+default value.
+
+=3Ditem B<scmi_smc>
+
+Enables ARM SCMI SMC support for the guest by enabling SCMI over SMC calls
+forwarding from domain to the EL3 firmware (like Trusted Firmware-A) with =
a
+single SCMI OSPM agent support.
+Should be used together with B<scmi-smc-passthrough> Xen command line
+option.
+
+=3Dback
+
+=3Dback
+
 =3Dback
=20
 =3Dhead3 x86
diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-t=
ree/booting.txt
index 07acc7ba64..977b428608 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -307,6 +307,21 @@ with the following properties:
     passed through. This option is the default if this property is missing
     and the user does not provide the device partial device tree for the d=
omain.
=20
+- xen,sci_type
+
+    A string property specifying an ARM SCI type for the guest.
+
+    - "none"
+    Don't allow guest to use ARM SCI if present on the platform. This is t=
he
+    default value.
+
+    - "scmi_smc"
+    Enables ARM SCMI SMC support for the guest by enabling SCMI over SMC c=
alls
+    forwarding from domain to the EL3 firmware (like Trusted Firmware-A) w=
ith a
+    single SCMI OSPM agent support.
+    Should be used together with scmi-smc-passthrough Xen command line
+    option.
+
 Under the "xen,domain" compatible node, one or more sub-nodes are present
 for the DomU kernel and ramdisk.
=20
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line=
.pandoc
index 4adcd7e762..518e42d965 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2382,6 +2382,15 @@ sockets, &c.  This will reduce performance somewhat,=
 particularly on
 systems with hyperthreading enabled, but should reduce power by
 enabling more sockets and cores to go into deeper sleep states.
=20
+### scmi-smc-passthrough (ARM)
+> `=3D <boolean>`
+
+The option is available when `CONFIG_SCMI_SMC` is compiled in, and allows =
to
+enable SCMI SMC single agent interface for any, but only one guest domain,
+which serves as Driver domain. The SCMI will be disabled for Dom0/hwdom an=
d
+SCMI nodes removed from Dom0/hwdom device tree.
+(for example, thin Dom0 with Driver domain use-case).
+
 ### scrub-domheap
 > `=3D <boolean>`
=20
diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/h=
elpers.gen.go
index 667030cbd7..8909fe8a1b 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -938,6 +938,35 @@ return fmt.Errorf("converting field Vcpus: %v", err)
  return nil
  }
=20
+// NewArmSci returns an instance of ArmSci initialized with defaults.
+func NewArmSci() (*ArmSci, error) {
+var (
+x ArmSci
+xc C.libxl_arm_sci)
+
+C.libxl_arm_sci_init(&xc)
+defer C.libxl_arm_sci_dispose(&xc)
+
+if err :=3D x.fromC(&xc); err !=3D nil {
+return nil, err }
+
+return &x, nil}
+
+func (x *ArmSci) fromC(xc *C.libxl_arm_sci) error {
+ x.Type =3D ArmSciType(xc._type)
+
+ return nil}
+
+func (x *ArmSci) toC(xc *C.libxl_arm_sci) (err error){defer func(){
+if err !=3D nil{
+C.libxl_arm_sci_dispose(xc)}
+}()
+
+xc._type =3D C.libxl_arm_sci_type(x.Type)
+
+ return nil
+ }
+
 // NewRdmReserve returns an instance of RdmReserve initialized with defaul=
ts.
 func NewRdmReserve() (*RdmReserve, error) {
 var (
@@ -1163,6 +1192,9 @@ x.ArchArm.GicVersion =3D GicVersion(xc.arch_arm.gic_v=
ersion)
 x.ArchArm.Vuart =3D VuartType(xc.arch_arm.vuart)
 x.ArchArm.SveVl =3D SveType(xc.arch_arm.sve_vl)
 x.ArchArm.NrSpis =3D uint32(xc.arch_arm.nr_spis)
+if err :=3D x.ArchArm.ArmSci.fromC(&xc.arch_arm.arm_sci);err !=3D nil {
+return fmt.Errorf("converting field ArchArm.ArmSci: %v", err)
+}
 if err :=3D x.ArchX86.MsrRelaxed.fromC(&xc.arch_x86.msr_relaxed);err !=3D =
nil {
 return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
 }
@@ -1699,6 +1731,9 @@ xc.arch_arm.gic_version =3D C.libxl_gic_version(x.Arc=
hArm.GicVersion)
 xc.arch_arm.vuart =3D C.libxl_vuart_type(x.ArchArm.Vuart)
 xc.arch_arm.sve_vl =3D C.libxl_sve_type(x.ArchArm.SveVl)
 xc.arch_arm.nr_spis =3D C.uint32_t(x.ArchArm.NrSpis)
+if err :=3D x.ArchArm.ArmSci.toC(&xc.arch_arm.arm_sci); err !=3D nil {
+return fmt.Errorf("converting field ArchArm.ArmSci: %v", err)
+}
 if err :=3D x.ArchX86.MsrRelaxed.toC(&xc.arch_x86.msr_relaxed); err !=3D n=
il {
 return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
 }
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/typ=
es.gen.go
index e26b3cdfc7..ab9d4ca7b4 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -520,6 +520,16 @@ SveType1920 SveType =3D 1920
 SveType2048 SveType =3D 2048
 )
=20
+type ArmSciType int
+const(
+ArmSciTypeNone ArmSciType =3D 0
+ArmSciTypeScmiSmc ArmSciType =3D 1
+)
+
+type ArmSci struct {
+Type ArmSciType
+}
+
 type RdmReserve struct {
 Strategy RdmReserveStrategy
 Policy RdmReservePolicy
@@ -599,6 +609,7 @@ GicVersion GicVersion
 Vuart VuartType
 SveVl SveType
 NrSpis uint32
+ArmSci ArmSci
 }
 ArchX86 struct {
 MsrRelaxed Defbool
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 185f74d8a8..bc35e412da 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -313,6 +313,11 @@
  */
 #define LIBXL_HAVE_BUILDINFO_ARCH_NR_SPIS 1
=20
+/*
+ * libxl_domain_build_info has the arch_arm.sci* fields.
+ */
+#define LIBXL_HAVE_BUILDINFO_ARCH_ARM_SCI 1
+
 /*
  * LIBXL_HAVE_SOFT_RESET indicates that libxl supports performing
  * 'soft reset' for domains and there is 'soft_reset' shutdown reason
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 4a19a8d22b..7e9f8a1bc3 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -233,6 +233,20 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         config->arch.sve_vl =3D d_config->b_info.arch_arm.sve_vl / 128U;
     }
=20
+    switch (d_config->b_info.arch_arm.arm_sci.type) {
+    case LIBXL_ARM_SCI_TYPE_NONE:
+        config->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE;
+        break;
+    case LIBXL_ARM_SCI_TYPE_SCMI_SMC:
+        config->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC;
+        break;
+    default:
+        LOG(ERROR, "Unknown ARM_SCI type %d",
+            d_config->b_info.arch_arm.arm_sci.type);
+        return ERROR_FAIL;
+    }
+    LOG(DEBUG, " - SCI type=3D%u", config->arch.arm_sci_type);
+
     return 0;
 }
=20
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_type=
s.idl
index a6030a2dbd..b53e013a44 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -551,6 +551,15 @@ libxl_sve_type =3D Enumeration("sve_type", [
     (2048, "2048")
     ], init_val =3D "LIBXL_SVE_TYPE_DISABLED")
=20
+libxl_arm_sci_type =3D Enumeration("arm_sci_type", [
+    (0, "none"),
+    (1, "scmi_smc")
+    ], init_val =3D "LIBXL_ARM_SCI_TYPE_NONE")
+
+libxl_arm_sci =3D Struct("arm_sci", [
+    ("type", libxl_arm_sci_type),
+    ])
+
 libxl_rdm_reserve =3D Struct("rdm_reserve", [
     ("strategy",    libxl_rdm_reserve_strategy),
     ("policy",      libxl_rdm_reserve_policy),
@@ -725,6 +734,7 @@ libxl_domain_build_info =3D Struct("domain_build_info",=
[
                                ("vuart", libxl_vuart_type),
                                ("sve_vl", libxl_sve_type),
                                ("nr_spis", uint32, {'init_val': 'LIBXL_NR_=
SPIS_DEFAULT'}),
+                               ("arm_sci", libxl_arm_sci),
                               ])),
     ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
                               ])),
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 90c9386f5b..af86d3186d 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1284,6 +1284,36 @@ out:
     if (rc) exit(EXIT_FAILURE);
 }
=20
+static int parse_arm_sci_config(XLU_Config *cfg, libxl_arm_sci *arm_sci,
+                                const char *str)
+{
+    int ret =3D 0;
+    char *buf2, *ptr;
+    char *oparg;
+
+    if (NULL =3D=3D (buf2 =3D ptr =3D strdup(str)))
+        return ERROR_NOMEM;
+
+    ptr =3D strtok(buf2, ",");
+    while (ptr !=3D NULL)
+    {
+        if (MATCH_OPTION("type", ptr, oparg)) {
+            ret =3D libxl_arm_sci_type_from_string(oparg, &arm_sci->type);
+            if (ret) {
+                fprintf(stderr, "Unknown ARM_SCI type: %s\n", oparg);
+                ret =3D ERROR_INVAL;
+                goto out;
+            }
+        }
+
+        ptr =3D strtok(NULL, ",");
+    }
+
+out:
+    free(buf2);
+    return ret;
+}
+
 void parse_config_data(const char *config_source,
                        const char *config_data,
                        int config_len,
@@ -2989,6 +3019,12 @@ skip_usbdev:
     xlu_cfg_get_defbool(config, "trap_unmapped_accesses",
                         &b_info->trap_unmapped_accesses, 0);
=20
+    if (!xlu_cfg_get_string(config, "arm_sci", &buf, 1)) {
+        if (parse_arm_sci_config(config, &b_info->arch_arm.arm_sci, buf)) =
{
+            exit(EXIT_FAILURE);
+        }
+    }
+
     parse_vkb_list(config, d_config);
=20
     d_config->virtios =3D NULL;
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 0094cf9e40..f00912a1ca 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -279,6 +279,36 @@ int __init arch_handle_passthrough_prop(struct kernel_=
info *kinfo,
     return sci_assign_dt_device(kinfo->bd.d, node);
 }
=20
+static int __init domu_dt_sci_parse(struct dt_device_node *node,
+                                    struct xen_domctl_createdomain *d_cfg)
+{
+    const char *sci_type;
+    int ret;
+
+    d_cfg->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE;
+
+    if ( !IS_ENABLED(CONFIG_ARM_SCI) ||
+         !dt_property_read_bool(node, "xen,sci_type") )
+        return 0;
+
+    ret =3D dt_property_read_string(node, "xen,sci_type", &sci_type);
+    if ( ret )
+        return ret;
+
+    if ( !strcmp(sci_type, "none") )
+        d_cfg->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE;
+    else if ( !strcmp(sci_type, "scmi_smc") )
+        d_cfg->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC;
+    else
+    {
+        printk(XENLOG_ERR "xen,sci_type in not valid (%s) for domain %s\n"=
,
+               sci_type, dt_node_name(node));
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
 int __init arch_parse_dom0less_node(struct dt_device_node *node,
                                     struct boot_domain *bd)
 {
@@ -288,7 +318,9 @@ int __init arch_parse_dom0less_node(struct dt_device_no=
de *node,
=20
     d_cfg->arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
     d_cfg->flags |=3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap;
-    d_cfg->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE;
+
+    if ( domu_dt_sci_parse(node, d_cfg) )
+        panic("Error getting SCI configuration\n");
=20
     if ( !dt_property_read_u32(node, "nr_spis", &d_cfg->arch.nr_spis) )
     {
diff --git a/xen/arch/arm/firmware/Kconfig b/xen/arch/arm/firmware/Kconfig
index bbf88fbb9a..5c5f0880c4 100644
--- a/xen/arch/arm/firmware/Kconfig
+++ b/xen/arch/arm/firmware/Kconfig
@@ -25,7 +25,9 @@ config SCMI_SMC
 	  doorbell mechanism and Shared Memory for transport ("arm,scmi-smc"
 	  compatible only). The value of "arm,smc-id" DT property from SCMI
 	  firmware node is used to trap and forward corresponding SCMI SMCs
-	  to firmware running at EL3, for calls coming from the hardware domain.
+	  to firmware running at EL3, for calls coming from the hardware domain o=
r
+	  driver domain.
+	  Use with EL3 firmware which supports only single SCMI OSPM agent.
=20
 endchoice
=20
diff --git a/xen/arch/arm/firmware/scmi-smc.c b/xen/arch/arm/firmware/scmi-=
smc.c
index 4c5df714c2..0835ddeeec 100644
--- a/xen/arch/arm/firmware/scmi-smc.c
+++ b/xen/arch/arm/firmware/scmi-smc.c
@@ -13,6 +13,8 @@
 #include <xen/device_tree.h>
 #include <xen/errno.h>
 #include <xen/init.h>
+#include <xen/iocap.h>
+#include <xen/param.h>
 #include <xen/sched.h>
 #include <xen/types.h>
=20
@@ -22,7 +24,11 @@
=20
 #define SCMI_SMC_ID_PROP   "arm,smc-id"
=20
+static bool __ro_after_init opt_scmi_smc_passthrough;
+boolean_param("scmi-smc-passthrough", opt_scmi_smc_passthrough);
+
 static uint32_t __ro_after_init scmi_smc_id;
+static struct domain __read_mostly *scmi_dom;
=20
 /*
  * Check if provided SMC Function Identifier matches the one known by the =
SCMI
@@ -50,7 +56,7 @@ static bool scmi_handle_smc(struct cpu_user_regs *regs)
         return false;
=20
     /* Only the hardware domain should use SCMI calls */
-    if ( !is_hardware_domain(current->domain) )
+    if ( scmi_dom !=3D current->domain )
     {
         gdprintk(XENLOG_WARNING, "SCMI: Unprivileged access attempt\n");
         return false;
@@ -75,12 +81,45 @@ static bool scmi_handle_smc(struct cpu_user_regs *regs)
     return true;
 }
=20
+static int
+scmi_smc_domain_sanitise_config(struct xen_domctl_createdomain *config)
+{
+    if ( config->arch.arm_sci_type !=3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE &&
+         config->arch.arm_sci_type !=3D XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC=
 )
+        return -EINVAL;
+
+    return 0;
+}
+
 static int scmi_smc_domain_init(struct domain *d,
                                 struct xen_domctl_createdomain *config)
 {
-    if ( !is_hardware_domain(d) )
+    /*
+     * scmi_passthrough is not enabled:
+     * - proceed only for hw_domain
+     * - fail if guest domain has SCMI enabled.
+     */
+    if ( !opt_scmi_smc_passthrough && !is_hardware_domain(d) )
+    {
+        if ( config->arch.arm_sci_type =3D=3D XEN_DOMCTL_CONFIG_ARM_SCI_SC=
MI_SMC )
+            return -EINVAL;
+        else
+            return 0;
+    }
+    /*
+     * scmi_passthrough is enabled:
+     * - ignore hw_domain
+     * - proceed only for domain with SCMI enabled.
+     */
+    if ( opt_scmi_smc_passthrough &&
+         (config->arch.arm_sci_type =3D=3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE =
||
+          is_hardware_domain(d)) )
         return 0;
=20
+    if ( scmi_dom )
+        return -EEXIST;
+
+    scmi_dom =3D d;
     d->arch.sci_enabled =3D true;
     printk(XENLOG_DEBUG "SCMI: %pd init\n", d);
     return 0;
@@ -88,12 +127,80 @@ static int scmi_smc_domain_init(struct domain *d,
=20
 static void scmi_smc_domain_destroy(struct domain *d)
 {
-    if ( !is_hardware_domain(d) )
+    if ( scmi_dom && scmi_dom !=3D d )
         return;
=20
+    scmi_dom =3D NULL;
+    d->arch.sci_enabled =3D false;
     printk(XENLOG_DEBUG "SCMI: %pd destroy\n", d);
 }
=20
+/*
+ * Handle Dom0 SCMI SMC specific DT nodes
+ *
+ * if scmi_smc_passthrough=3Dfalse:
+ * - Copy SCMI nodes into Dom0 device tree.
+ * if scmi_smc_passthrough=3Dtrue:
+ * - skip SCMI nodes from Dom0 DT
+ * - give dom0 control access to SCMI shmem MMIO, so SCMI can be passed
+ *   through to guest.
+ */
+static bool scmi_smc_dt_handle_node(struct domain *d,
+                                    struct dt_device_node *node)
+{
+    static const struct dt_device_match shmem_matches[] __initconst =3D {
+        DT_MATCH_COMPATIBLE("arm,scmi-shmem"),
+        { /* sentinel */ },
+    };
+    static const struct dt_device_match scmi_matches[] __initconst =3D {
+        DT_MATCH_PATH("/firmware/scmi"),
+        { /* sentinel */ },
+    };
+
+    /* skip scmi shmem node for dom0 if scmi not enabled */
+    if ( dt_match_node(shmem_matches, node) && !sci_domain_is_enabled(d) )
+    {
+        dt_dprintk("Skip scmi shmem node\n");
+        return true;
+    }
+
+    /*
+     * skip scmi node for dom0 if scmi not enabled, but give dom0 control
+     * access to SCMI shmem
+     */
+    if ( dt_match_node(scmi_matches, node) && !sci_domain_is_enabled(d) )
+    {
+        struct dt_device_node *shmem_node;
+        const __be32 *prop;
+        uint64_t paddr, size;
+        int ret;
+
+        /* give dom0 control access to SCMI shmem */
+        prop =3D dt_get_property(node, "shmem", NULL);
+        if ( !prop )
+            return true;
+
+        shmem_node =3D dt_find_node_by_phandle(be32_to_cpu(*prop));
+        if ( !shmem_node )
+            return true;
+
+        ret =3D dt_device_get_address(shmem_node, 0, &paddr, &size);
+        if ( ret )
+            return true;
+
+        ret =3D iomem_permit_access(d, paddr_to_pfn(paddr),
+                                  paddr_to_pfn(paddr + size - 1));
+        if ( ret )
+            printk(XENLOG_WARNING
+                     "SCMI: Failed to give access to SCMI shmem with code:=
 %d\n", ret);
+
+        dt_dprintk("Skip scmi node\n");
+        return true;
+    }
+
+    return false;
+}
+
 static int __init scmi_check_smccc_ver(void)
 {
     if ( smccc_ver < ARM_SMCCC_VERSION_1_1 )
@@ -108,8 +215,10 @@ static int __init scmi_check_smccc_ver(void)
=20
 static const struct sci_mediator_ops scmi_smc_ops =3D {
     .handle_call =3D scmi_handle_smc,
+    .domain_sanitise_config =3D scmi_smc_domain_sanitise_config,
     .domain_init =3D scmi_smc_domain_init,
     .domain_destroy =3D scmi_smc_domain_destroy,
+    .dom0_dt_handle_node =3D scmi_smc_dt_handle_node,
 };
=20
 /* Initialize the SCMI layer based on SMCs and Device-tree */
--=20
2.34.1

