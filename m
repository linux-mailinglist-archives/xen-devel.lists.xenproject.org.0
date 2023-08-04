Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC4A76F8D3
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 06:12:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576782.903354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRm9W-0005q1-Vr; Fri, 04 Aug 2023 04:11:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576782.903354; Fri, 04 Aug 2023 04:11:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRm9W-0005nA-T6; Fri, 04 Aug 2023 04:11:02 +0000
Received: by outflank-mailman (input) for mailman id 576782;
 Fri, 04 Aug 2023 04:11:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZNcn=DV=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qRm9V-0005n4-9N
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 04:11:01 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2061b.outbound.protection.outlook.com
 [2a01:111:f400:fe12::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea1a206c-327c-11ee-b26a-6b7b168915f2;
 Fri, 04 Aug 2023 06:10:58 +0200 (CEST)
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM9PR08MB5940.eurprd08.prod.outlook.com (2603:10a6:20b:281::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Fri, 4 Aug
 2023 04:10:55 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6652.021; Fri, 4 Aug 2023
 04:10:54 +0000
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
X-Inumbo-ID: ea1a206c-327c-11ee-b26a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RUL1Ouf7mHKPGnI7q0BM4bgRGqEPkNaUOoRoxEWQ9F8MVKtuGW7JuJIbiMyRvsHFdQDAP5wFrAvGMDCwoU/eTSs/chVuUKRN0jVo3WGpQsIqSfYC4AbRBGVGBqMVuTCyEerFd8aMxjv8rbPMoKGmLG4IQbPGxzP4G+ISg/E80CSL48o8j7fh2rEVPcmXfWNHfSlJh8FAKPYr7jKv1q4uTCVmL5Vf/s9WSgPS7lxFMQQF/A9E/UijJE4f20K2PHzA2/haec0nxcYaJdBcJbOdfV8/G0e5qFhpjhjGyrsiHasuPdMEmZke03jec19ym3fYstBpK479jjGZAi8jW4M1Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8xqu/UcUCBDBaKDUDCHrvXv0JXe2qen/EqNo7YXWLY=;
 b=IzuQKL5IsxxilSjyA+qb9T4K0pBDC7hXrQxlGrNQnNwXKeupqYu+WqaoshN5vL7pAiz7p592bUegbQNx39dK6UWL33rzNcyrjg8oyoLuWbZ/3AdXmg3f4udf6WNabDYluCAfqkoqwjvYQ/h452EfstrS+TcNMxFApyttuUhk7Lz2MKd+Ogz+Cny64Bqxis6q5F/bEzd4irdgl471vrBwQ+znSxeOf6nP3jI83G9mEj2IM5Ex7DKmX1aLE2TSpO6oTGrTOnU7ZRrWaAHd8VtKaedBNM5Nx09jnYYYrD5CKJ9JeFPfYMBbl3QcTfwENIciNpedExFYh1ar7WObXJlqLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8xqu/UcUCBDBaKDUDCHrvXv0JXe2qen/EqNo7YXWLY=;
 b=2eAgeLmtEdkczu3I/bvLFGg9NH149itwyB3Wt3f/FIS5/JukW7L6f4pHNRw+vvnMfr2Nx3NfwoOWxCVaHjrO89K8R1e6u4CR1iYN2Ar9XTs+1rac+5GvJdaJ2FFjW3NJVLIYfHkgDvioB3GGW4wUNPBcM+iW6XFpDjDPQnq5uUw=
From: Henry Wang <Henry.Wang@arm.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [PATCH v2 2/2] fdt: make fdt handling reusable across arch
Thread-Topic: [PATCH v2 2/2] fdt: make fdt handling reusable across arch
Thread-Index: AQHZxfe0sdxLBCk0m0eqfbJm59//E6/ZhneQ
Date: Fri, 4 Aug 2023 04:10:54 +0000
Message-ID:
 <AS8PR08MB79912C0FD1E3B1AA5988175B9209A@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230803104438.24720-1-dpsmith@apertussolutions.com>
 <20230803104438.24720-3-dpsmith@apertussolutions.com>
In-Reply-To: <20230803104438.24720-3-dpsmith@apertussolutions.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 9A6AEE420277C5488F584A3AB5447E13.0
x-checkrecipientchecked: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR08MB7991:EE_|AM9PR08MB5940:EE_
x-ms-office365-filtering-correlation-id: 81cc23de-1256-4002-7446-08db94a0cc63
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 8DDRolHa8/AeRYzp7YCFgjYho5fh8ktK2DF5qdzKyD/sQ7UosS5o2tKoZVcM8RVNkcDlIpWbfafaM7So0k84PjEW3t6hodPJMYjvsWF2mVi9wDG8+j9LrbGtiLjRxkvyXLhNqIQPqz/Gb+PEQgVea3fzT7YUAbclI4JRbiQHscvP9oJz8CnWQ083G1WjzpKSQOJgR7Cxr30UJtkWGANnWVJdVCjUe13PRUruospJeM+L17DNKfSByJvVkNZKoolZ1lEwjQ/jwCk+aiC9GSzV6JOjfD+GM+C2WF94WBubJj1hO7n0QQ/7z6QPW17MohZKbkxXi3TQYUrdmNQd3/AVWQC0xCkBs/roXxbHcWvzkVj8EfrKuYvq40HP5b31XXzL6ioO+uZ9BOYNq59fd4rZO0Pbf091/zCRPUUoqjK25VeZKYP5X5xDt9mJjAwP5w019MP3sJgVZZZQxFS4YjT9e/2a8MjYrDQv1zSPZ1FaLrLk3JL5ljQf0PtFufYsTY9IziHXgqSHjHsbu/r27dJc6SCAGEG/mGNy3h9czYagE4Bt8u3VM94F6lsjQ680jgAPSK2v37uPDpqOD77o/uDbXL9u7jyOXQ7jQnvF/IWaDhEFqkvV/gsscFlAt0UTbttH
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(136003)(366004)(396003)(451199021)(1800799003)(186006)(8676002)(26005)(6506007)(83380400001)(66476007)(2906002)(316002)(76116006)(4326008)(4744005)(66946007)(5660300002)(66446008)(64756008)(66556008)(8936002)(41300700001)(7696005)(71200400001)(52536014)(9686003)(110136005)(478600001)(55016003)(54906003)(38100700002)(122000001)(33656002)(86362001)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?RZI/5GiDw10BouSgtexTXZlJxIWhoF+VCFZcqhxYEB0Qu1kcv1I5ydkdsfNm?=
 =?us-ascii?Q?QzGZgVjgKPzcx36jHUyc0qFbCvDYkmWAhbbdlKYCoeGkVwLETRmJYjjSRD1U?=
 =?us-ascii?Q?yJb5EprPTZRn3e+KHM/FTNRFEz6HvuB4ggCWwXea+VpmGjsA69pQY/vC5xGV?=
 =?us-ascii?Q?jlnoG2tT7+HuFogAsb45jZJUx/I8qGfF3o2PGdz9iBN5saU7PxQfLl/eYyUj?=
 =?us-ascii?Q?jaaQ77UPldi/9uc5cIpb1LwVgCa7QvX7m+gyD4e8y471whYtXkOJBlTGkHAC?=
 =?us-ascii?Q?dxBoPztZJ+x6ryn3dZ9yJ3UFyVQqUqp9mafNy/kqiQb7O9wBb29EQiEtThCu?=
 =?us-ascii?Q?QX9negJ2MI/2tX0L+ZveGjcXpsmqNnUD8YYaBrTyFKz638Uc1YUpwBAV9P5d?=
 =?us-ascii?Q?o3oDuE/oRpvEjWbPYllXBE64ftepfCvz3rWvJ9+C4B4NocFjbWsw2K1s7nKe?=
 =?us-ascii?Q?2Rk+3ljTD6W1MCXz3tBFSw1GKgZ99vEDwt7KDGdZSSzvcagr07E5uhGsZoWu?=
 =?us-ascii?Q?p1H9+sHhB4a+NR2368k4scBv1fIm55LnOkReZBpKItL65Iem6J6hUkYdyKwI?=
 =?us-ascii?Q?BXrnsdXhzSFHnsfrZcf1hV+wyGGwCATmaKt2KU4NQWas5Y36vA879Uxtmc4/?=
 =?us-ascii?Q?3Sz78THrII89n41jZgjbxBiOjx4cbBBPtt4Y/qQUx3K1d40pWwWq/drzcniW?=
 =?us-ascii?Q?uBY4PZd1YWSMQrSyEH/hQF+k8M8XryTgGihVsbNKB4rAxteRPm8/Rg7ZMfUF?=
 =?us-ascii?Q?d4KFOijQeiilbDqJ1c7nrkSn2+uQv+UBOSvUJXhQTGrMB792NyZyWDPE4gUD?=
 =?us-ascii?Q?o6WyzN0uXuzxPFgCwdOjWcVguVB0shFcj/nKA7GqkqN/9P/i7uNQxJI6uI9S?=
 =?us-ascii?Q?JYYhwfD2t3Fq5KdUr4rKbSQv3/StdpUsv9a/b4M8taWQ2XyaDEVLVG9Bdb8s?=
 =?us-ascii?Q?Z3609oTMh/y0OW2cJK/y+yoKJR6EbnFSgaZFROPtydqEcp9wtZBuiYLiBxX2?=
 =?us-ascii?Q?ZANXlSoTKwBI8c9S/fokAo2Sonj+EFnlMZvpD5OTs2rVR2prCMZHi7uKjj4D?=
 =?us-ascii?Q?624bN6oVHJySDS4gRXyiom6+6pdCJ/X7/gtHBUDr3IDWRZCkLm1gE2Z6RUTK?=
 =?us-ascii?Q?/0JPqkrllaP5oPKe6vHR80sd0NqB255rBALW+KWjyvxZHjc7BANLDgRFjhyB?=
 =?us-ascii?Q?A/1TThNF23h7n87iwcxsNS3BPDx3Cef+V2g7RGmQiJnxrNYHqE+Mu4CkqOEs?=
 =?us-ascii?Q?uFoGVEod0LsYIiVLfVxXuAfBhdKY4ZiYOflSBqgoEfu1Cm4St63WAvRx/r5C?=
 =?us-ascii?Q?lx1kogBDNX31RwVhA/p/w9D0RAbfL1EW4+tEdZhOSdvq3PkT1Vbjsqg3bL4x?=
 =?us-ascii?Q?aPx3zXoJX9eWqvMbiQ8e1Lo3EFXpZJq3YUKgE1MmJuggKz2L9a2ZnesEe+XT?=
 =?us-ascii?Q?twzlHm59TZZWkOeHqV5JvXL/hP9MxjmvCHxJCYv4X8y+jYe32tkn0yLaUxal?=
 =?us-ascii?Q?E2+lZnO5DiJCC576cHqm/8PUcUzSIb4vPksDh/4QjsiWqaAIcBQHfaClKqwL?=
 =?us-ascii?Q?0oZX5L4xpqTCoTOKLDU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7991.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81cc23de-1256-4002-7446-08db94a0cc63
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2023 04:10:54.7460
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G2HkTlXQsell1nalLoWvN3j1eqQXyXDm+ksF33rDjcs9zJSW06dxk1vD5o/9JDd+fjMTUKhZHsDlyU6JL2XOCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5940

Hi Daniel,

> -----Original Message-----
> Subject: [PATCH v2 2/2] fdt: make fdt handling reusable across arch
>=20
> This refactors reusable code from Arm's bootfdt.c and device-tree.h that =
is
> general fdt handling code.  The Kconfig parameter CORE_DEVICE_TREE is
> introduced for when the ability of parsing DTB files is needed by a capab=
ility
> such as hyperlaunch.
>=20
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

As said yesterday, I tested this patch and can confirm this patch will not
break any of the boards we used for our testing. So

Tested-by: Henry Wang <Henry.Wang@arm.com>

(But I saw there are some comments from Michal and Luca about this
patch so I think these comments need to be addressed)

Kind regards,
Henry

