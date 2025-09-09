Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDC9B4A99C
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 12:09:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1116141.1462575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvvHm-0002K4-Jm; Tue, 09 Sep 2025 10:09:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1116141.1462575; Tue, 09 Sep 2025 10:09:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvvHm-0002Ge-Gh; Tue, 09 Sep 2025 10:09:14 +0000
Received: by outflank-mailman (input) for mailman id 1116141;
 Tue, 09 Sep 2025 10:09:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=noAm=3U=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uvvHl-0000yD-EH
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 10:09:13 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 080b1def-8d65-11f0-9809-7dc792cee155;
 Tue, 09 Sep 2025 12:09:11 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by DU4PR03MB10645.eurprd03.prod.outlook.com (2603:10a6:10:58f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 10:09:04 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 10:09:04 +0000
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
X-Inumbo-ID: 080b1def-8d65-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IFnXnyC044293d5HarcTYfiD6Nj17po/M4zEOOimhiDdbMe830egJmNDbe84SUmXhMmlp7Vm1I6m7M0VMq9rIvRfKnOPYl0re9oH2ZyhsSQ2CaMhX9XrmSxrD7GGM+N9S6xhHfnOwqVw4cbQISEIg2MhWrO5+VIR1Gg8lguXRtunYc9MeTyjJTUoZ+Za24CNHTFu7Kdrqfu4kcTMrkMpN0CwyxVROyLaYnpCzNkur/bztt4mO/WQ1Je/XRj7+RJxzJXPDAsAiwt1aR8pJfRC0wAMYJBeG6TAgh3bfaPVoAkitcjo7PXxoqe7u6fN+cYXP6uAKk4VQ7ZAPpXMIuQ0rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xv5ZWIsrcJ4zb7XYvjHbnGF/lBjKmuT3JyKBNigSOws=;
 b=jcAqF2RrWb7100MMCKrwEfzHr7ZxwKn0xQC+ynuTvOQPzJMCYq+jsyJGGwoMhW1IMOmEOk7uWWXIVSlTRbkCvIcxNjRHx1ypuH9wnaLR4de0EgPRoPz88cWdwt0EgtfQjVsvQCX/QJtz5EAHzaUgnQtZp83mYKrJeyJLuUBMS6roUTRFzh4xm2GJRUXYi/7iXv2/ndJ6ETA7AUlriSBb2IsW8X0Bu1g5TWDrjQHj9np16ZMHbLNiBhwwGx1nk9F4qBFcJjvmc8BVxPSXEtOVCOhZ3hAP49SqZD/2DPaDRt4R5PBmVwuP7UHYTVdGQxSNozpTGrrtTG9fzeVjIEYboA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xv5ZWIsrcJ4zb7XYvjHbnGF/lBjKmuT3JyKBNigSOws=;
 b=Td1Mc4j8txDKfAam4k0MnjKJ71eeu/+QTVMHQ4dXR0AaLc40aGuAtt4BX4K9Z9BqYz9x2GGpXqfes0DpLquJqfY3BRMbjlwVFD0ptHOZyCrpGbSh4Igat3O/iXGIhtBycS7Kzn7rK/pSieFKiFO960KuUEYjFJ+rjldyW7fcnyeJKy2IX5l1zGWibRw+vOyqvvUbWyqGABCseYYYa1TXX6+7QjglHCOIzE5V5uyuFM4s1Sb7KxBr6W+INJsNJ/75DF4EmBIyKahfRE+7K5lpnJytZHKW2lp+6jF9HJSpF/sbhjnFopmQfAuNwjrjpz3nP962FqaVTiY5yc08ABZlAQ==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v8 03/12] xen/arm: vgic: implement helper functions for virq
 checks
Thread-Topic: [PATCH v8 03/12] xen/arm: vgic: implement helper functions for
 virq checks
Thread-Index: AQHcIXHFOoWNA+Jrv0+WsW/ukByhRA==
Date: Tue, 9 Sep 2025 10:09:04 +0000
Message-ID:
 <a230361bc04feb8746d24100b6dce7464316991c.1757412099.git.leonid_komarianskyi@epam.com>
References: <cover.1757412099.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1757412099.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|DU4PR03MB10645:EE_
x-ms-office365-filtering-correlation-id: f7e14e74-db11-4f06-5232-08ddef88e814
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?PiFgSY1dSkoeCfVNHgUWJWVjy52YNzPN5ipVLTkCaq202XJPkjF6PFj1dt?=
 =?iso-8859-1?Q?NaJM+mnK4l4gkJX66+673NIUHr3nEkjT9kZLlr7YaYzckzAnkbAJvEmt6Z?=
 =?iso-8859-1?Q?7hbg+LmrAWIciK+zh51RD0gZ8lDsfU/RaHXTey9iNgKlQMzV2qXeTGXauf?=
 =?iso-8859-1?Q?ez7PzDbhEKTJ2wxd9/j9hAOzn4jv/aqJSIGnySGfZ2F/LL2e4RVo2kvJJA?=
 =?iso-8859-1?Q?ZQuRbGxgFHH09vO9mJGi735cY2+v7r/qCjaaXhjTg2ebit3T/2CxP0KSge?=
 =?iso-8859-1?Q?EAe8u0xjskpmMbtC5R7u6jhC7nixAGKiKdRrBLlIOIIDf813XSwIwqTRig?=
 =?iso-8859-1?Q?wlKRaFF4N9UXflxAhEgQHvZvdeYpIyWnMO9TIorEPQUTFuyZ8+RHXMlkmG?=
 =?iso-8859-1?Q?n3Rx1RaYcosRzlmDNITLv90DcJ9QcFVsg2OgWD/RL5ADEhjdUlwDO14UMJ?=
 =?iso-8859-1?Q?R8emaZMrejL6Db5dSfPvV6pOvvhdrKqeGgwnFf8Wvaz0p2P4BAF/7YkSoR?=
 =?iso-8859-1?Q?VaEsKXK3eAcKG9yQ3cWqBKxyknv960rK/w20Js6M14efB/gnQPWlZ1paOp?=
 =?iso-8859-1?Q?qJXph0fO7EE8XntJDm1XHmPQRUVUrJ1yXB1A4Kw9Id1uAY61SrUxzKkJkh?=
 =?iso-8859-1?Q?GQyLz+7l4rI1h7Sw/95xmxQL4yu2ii2uuizKIniAT1Zeaw7dqAM693RrWg?=
 =?iso-8859-1?Q?B6r6x0n3OvCrZkHfNrp1LIHPCrUqbyJx+mqsZ82BF3/sZKJTFCaFFbawG4?=
 =?iso-8859-1?Q?F9rDFs9zgM+e4KBPE+DBWCPCV6Pm3Ulb5lUVHH/ODShICWxNnF1XznN8O4?=
 =?iso-8859-1?Q?vM950hRMCvWBBx7gk0+dzylwWLorD2MaMFlSKmmspdWpy7plyC2ply33vK?=
 =?iso-8859-1?Q?ZlhbrGvtjHI7eLfrlU16YXrT4hFTikGu0KuKwRXnV6sCWSExIGILbIuu4M?=
 =?iso-8859-1?Q?pUfDicG9+JUzUutb9Ffu99GmMzVdfCPwIU31U1du0OOYJGk0ugT9Qo0ldp?=
 =?iso-8859-1?Q?9jyd0Ga16DMng8usBhq2i0zV8pkV+Q0b6pV+ICDGF+DAT0x0R+p9VVNkrK?=
 =?iso-8859-1?Q?teckTQxovtP6gQsw+0mhkHnCqrC7kIoHMDUcSi+ho9xvnJg1AeTKIcgL+m?=
 =?iso-8859-1?Q?YHnaBFLxRW0EWFiWD/xFs3JFiCO6zQrNNYKgxwxnJMeWNpMy2FtwjBkOqB?=
 =?iso-8859-1?Q?oP3LNGnHt+o05mEolr+kdPzx+CH1IQubh401gXZNH0PvWOgZn3wqLzzbKO?=
 =?iso-8859-1?Q?wi98T/ZclLXCgGlgWpUCdL+cPufNWukBvGxkR9qfoy58uGcaqsOIvCcdk7?=
 =?iso-8859-1?Q?NvCy1zZiQRK2DG9sn0h1x5gAZUngNub44o3Qkcmn8yortJbqFHP2lNUKea?=
 =?iso-8859-1?Q?B8dxRKmhIcbdXv1gXPRHcYs1Q4/ipLbVP6aVA4Yr+ndbpqIqpg+XBr2Q9Q?=
 =?iso-8859-1?Q?wbejJJjWgs3RmbBIn4ruLyXGIfOFmrMfFyWHb1eRmNSDDz4DISb6RIUNrn?=
 =?iso-8859-1?Q?n+9fSx/QLcj9qzoU9CvGexmYtxLkh5T75N2ddW3xRNTavCw+IpNgUrDuz4?=
 =?iso-8859-1?Q?Z/iygSE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?0bTVJUjpEwy4hA65+8J9DXveYmh9jkh+HIm1+0wegLKdSU4FlkafX0W1Dg?=
 =?iso-8859-1?Q?AnAS/HUovJWlYjPJ7NGQQ5iaRstr19yewE3l+nk0wfEo4WnmsbcwFb0I/n?=
 =?iso-8859-1?Q?PRUJ7UptFS1Y6KiNV+mRGxwnPsIZPuR1fY2YJw8i1sJ4Y+q8vJ8qgz4Pff?=
 =?iso-8859-1?Q?Zf24cSXLPUBJ6+Y653BTxN0Pg26Q/jjdRa3NiTq2Zsg48PraIFxb/iIQ3/?=
 =?iso-8859-1?Q?cejxy3bJjDAp0El8zNg2hpSjvLo6skTeZ6mRvF+v8+ZQoByxPMGf+BpdQV?=
 =?iso-8859-1?Q?YIF4bPogHWvozeq1ERKfcQCDXggYCnapwY2QRGTdF7Im/naCPrK6v3o18I?=
 =?iso-8859-1?Q?8tymuWetNvSk6kt00ln0WESiLRu2gwQGBCJb2+g12zHI+Sb+9f0tiFXhoG?=
 =?iso-8859-1?Q?jhCCG8YbpcUwD3GnlVOF5YzdGO0UQPlFQvLR4ZeeB9QEp1JA785mpZ1kFz?=
 =?iso-8859-1?Q?E6KRx6T+3mbNJR7NdiQI7qeWihaMXEdw6/+bno7lVjihg8JDOVObAK1yCF?=
 =?iso-8859-1?Q?rDpivID0WWZiUKmuckE4OuBz/6tgwD1BeHltTrdKaxxtaQ7KV6e+gEobc2?=
 =?iso-8859-1?Q?uPkNYsy5Sz271aEly06WdESjLIb/6Ug9AwV+Nz6mjiQRa7asq4AQpI5aZb?=
 =?iso-8859-1?Q?94pjX7Pm2b8SOr9XDtuxM8H5z/o1g7JUGb3TVcS64v8IQ0fmqADssnC7rY?=
 =?iso-8859-1?Q?4dEDb2KnO3tFz5B6oTXWRYGcEZEpjfyzRQyYhdteRnJTdrJCuDoHbmCEpc?=
 =?iso-8859-1?Q?BTdzRCWv2sOXvIt/6F/oWkkAKqVLX9vKtJoIx/U9cJxdzznnst5rHEVdRY?=
 =?iso-8859-1?Q?Hzvq2NUDlrKtMZqEnBn0GyPNdR5earnHusbMwzyfUkklnmzy/qkI+w6R4p?=
 =?iso-8859-1?Q?uSy6xQJ+Ih+aDGfFON/OfdM55DdnD9Tmt2fR19mSfnC9ZBqutBR5X8MFI/?=
 =?iso-8859-1?Q?tjOL7lkSjSA2c+bFmfN/CSvaeTwf2PzsaReHq39EQUd849NqalR1dI/vwB?=
 =?iso-8859-1?Q?XTDQ0IjLao7Cc1uwO32VdBE+M80x8dpdKzyC5Ndgvu3ebOuh1jvvnan+v9?=
 =?iso-8859-1?Q?nMTTV9drFPWX0xorSez49aPRgIyDW7wgperZKdoKmBkL4CMThzCzFStZBc?=
 =?iso-8859-1?Q?XcDmeojqBUavVv0B+seCw8mzNanNN4Oc9ccCJl48zVHbQxyMYA6RzYLnTX?=
 =?iso-8859-1?Q?xYnzY8gQz4hqrC92Z6ID6F1nFsSaf5zIzoO3vO5nCL20lTIvW4AfZeCgUx?=
 =?iso-8859-1?Q?LN9XkYGkmfYIsj+dUXn84CKGNoMWr4yOsIdtKnDWWivTTIOEF2vWnrq3N/?=
 =?iso-8859-1?Q?tCBBp6G/790KYMUv0K2G6SJ8eohdTA27qr1NTLutRfyMqG6a1c6Q7tIw1U?=
 =?iso-8859-1?Q?FZslRGPS6821w/Rl+PJcHCnPh+ObQJbkcS4RpaVmPj9qDEfPlbAgoy22Al?=
 =?iso-8859-1?Q?XpXhym/MJyU36mT61kWAbWcjB0zFiC6QXdv8fCJOHEDX0kcK5Z0YOr+qGv?=
 =?iso-8859-1?Q?1gMM32MD8oz2tpsVRC808RjNSB0KYI9XF9Hyl0lNWUc6RdOvyF5pf8Nmop?=
 =?iso-8859-1?Q?2RMy7g5y/QavIAtUw0yxX6BJo06k3P6Lh4D7nWh3iDjbceN9ig0MMcgV5D?=
 =?iso-8859-1?Q?KyN3Ojbly2bPHRVky2EYZieqAWgYtuQ0a+SIn7J2EB03VouR7GTTtq7MUy?=
 =?iso-8859-1?Q?LLPzgL6wJdvuvnIxWCQ=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7e14e74-db11-4f06-5232-08ddef88e814
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2025 10:09:04.4505
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nx52c8qtqhIHrRJI19+eHAZjyPHm5q5GF9R11nCi/028TsLshohcr/3Jv4BSVeK46qwdj7MfwEWKROuLf17ZY0AeI1/cWl8uWogN8oJ5kzI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR03MB10645

Introduced two new helper functions for vGIC: vgic_is_valid_line and
vgic_is_spi. The functions are similar to the newly introduced
gic_is_valid_line and gic_is_spi, but they verify whether a vIRQ
is available for a specific domain, while GIC-specific functions
validate INTIDs for the real GIC hardware. For example, the GIC may
support all 992 SPI lines, but the domain may use only some part of them
(e.g., 640), depending on the highest IRQ number defined in the domain
configuration. Therefore, for vGIC-related code and checks, the
appropriate functions should be used. Also, updated the appropriate
checks to use these new helper functions.

The purpose of introducing new helper functions for vGIC is essentially
the same as for GIC: to avoid potential confusion with GIC-related
checks and to consolidate similar code into separate functions, which
can be more easily extended by additional conditions, e.g., when
implementing extended SPI interrupts.

Only the validation change in vgic_inject_irq may affect existing
functionality, as it currently checks whether the vIRQ is less than or
equal to vgic_num_irqs. Since IRQ indexes start from 0 (where 32 is the
first SPI), the check should behave consistently with similar logic in
other places and should check if the vIRQ number is less than
vgic_num_irqs. The remaining changes, which replace open-coded checks
with the use of these new helper functions, do not introduce any
functional changes, as the helper functions follow the current vIRQ
index verification logic.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Acked-by: Julien Grall <jgrall@amazon.com>

---
Changes in V8:
- no changes

Changes in V7:
- no changes

Changes in V6:
- no changes

Changes in V5:
- added reviewed-by from Oleksandr Tyshchenko and from Volodymyr Babchuk
- added acked-by from Julien Grall

Changes in V4:
- removed redundant parentheses

Changes in V3:
- renamed vgic_is_valid_irq to vgic_is_valid_line and vgic_is_shared_irq
  to vgic_is_spi
- added vgic_is_valid_line implementation for new-vgic, because
  vgic_is_valid_line is called from generic code. It is necessary to fix
  the build for new-vgic.
- updated commit message

Changes in V2:
- introduced this patch
---
 xen/arch/arm/gic.c              |  3 +--
 xen/arch/arm/include/asm/vgic.h |  7 +++++++
 xen/arch/arm/irq.c              |  4 ++--
 xen/arch/arm/vgic.c             | 10 ++++++++--
 xen/arch/arm/vgic/vgic.c        |  5 +++++
 5 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index 4bb11960ee..9469c9d08c 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -134,8 +134,7 @@ int gic_route_irq_to_guest(struct domain *d, unsigned i=
nt virq,
=20
     ASSERT(spin_is_locked(&desc->lock));
     /* Caller has already checked that the IRQ is an SPI */
-    ASSERT(virq >=3D 32);
-    ASSERT(virq < vgic_num_irqs(d));
+    ASSERT(vgic_is_spi(d, virq));
     ASSERT(!is_lpi(virq));
=20
     ret =3D vgic_connect_hw_irq(d, NULL, virq, desc, true);
diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgi=
c.h
index 35c0c6a8b0..3e7cbbb196 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -335,6 +335,13 @@ extern void vgic_check_inflight_irqs_pending(struct vc=
pu *v,
 /* Default number of vGIC SPIs. 32 are substracted to cover local IRQs. */
 #define VGIC_DEF_NR_SPIS (min(gic_number_lines(), VGIC_MAX_IRQS) - 32)
=20
+extern bool vgic_is_valid_line(struct domain *d, unsigned int virq);
+
+static inline bool vgic_is_spi(struct domain *d, unsigned int virq)
+{
+    return virq >=3D NR_LOCAL_IRQS && vgic_is_valid_line(d, virq);
+}
+
 /*
  * Allocate a guest VIRQ
  *  - spi =3D=3D 0 =3D> allocate a PPI. It will be the same on every vCPU
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 7dd5a2a453..b8eccfc924 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -442,7 +442,7 @@ int route_irq_to_guest(struct domain *d, unsigned int v=
irq,
     unsigned long flags;
     int retval =3D 0;
=20
-    if ( virq >=3D vgic_num_irqs(d) )
+    if ( !vgic_is_valid_line(d, virq) )
     {
         printk(XENLOG_G_ERR
                "the vIRQ number %u is too high for domain %u (max =3D %u)\=
n",
@@ -560,7 +560,7 @@ int release_guest_irq(struct domain *d, unsigned int vi=
rq)
     int ret;
=20
     /* Only SPIs are supported */
-    if ( virq < NR_LOCAL_IRQS || virq >=3D vgic_num_irqs(d) )
+    if ( !vgic_is_spi(d, virq) )
         return -EINVAL;
=20
     desc =3D vgic_get_hw_irq_desc(d, NULL, virq);
diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index c563ba93af..2bbf4d99aa 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -24,6 +24,12 @@
 #include <asm/gic.h>
 #include <asm/vgic.h>
=20
+
+bool vgic_is_valid_line(struct domain *d, unsigned int virq)
+{
+    return virq < vgic_num_irqs(d);
+}
+
 static inline struct vgic_irq_rank *vgic_get_rank(struct vcpu *v,
                                                   unsigned int rank)
 {
@@ -582,7 +588,7 @@ void vgic_inject_irq(struct domain *d, struct vcpu *v, =
unsigned int virq,
     if ( !v )
     {
         /* The IRQ needs to be an SPI if no vCPU is specified. */
-        ASSERT(virq >=3D 32 && virq <=3D vgic_num_irqs(d));
+        ASSERT(vgic_is_spi(d, virq));
=20
         v =3D vgic_get_target_vcpu(d->vcpu[0], virq);
     };
@@ -659,7 +665,7 @@ bool vgic_emulate(struct cpu_user_regs *regs, union hsr=
 hsr)
=20
 bool vgic_reserve_virq(struct domain *d, unsigned int virq)
 {
-    if ( virq >=3D vgic_num_irqs(d) )
+    if ( !vgic_is_valid_line(d, virq) )
         return false;
=20
     return !test_and_set_bit(virq, d->arch.vgic.allocated_irqs);
diff --git a/xen/arch/arm/vgic/vgic.c b/xen/arch/arm/vgic/vgic.c
index 6cabd0496d..b2c0e1873a 100644
--- a/xen/arch/arm/vgic/vgic.c
+++ b/xen/arch/arm/vgic/vgic.c
@@ -718,6 +718,11 @@ bool vgic_reserve_virq(struct domain *d, unsigned int =
virq)
     return !test_and_set_bit(virq, d->arch.vgic.allocated_irqs);
 }
=20
+bool vgic_is_valid_line(struct domain *d, unsigned int virq)
+{
+    return virq < vgic_num_irqs(d);
+}
+
 int vgic_allocate_virq(struct domain *d, bool spi)
 {
     int first, end;
--=20
2.34.1

