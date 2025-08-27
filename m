Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DD9B3897F
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 20:24:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096740.1451419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urKox-0001i3-0J; Wed, 27 Aug 2025 18:24:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096740.1451419; Wed, 27 Aug 2025 18:24:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urKow-0001eQ-R4; Wed, 27 Aug 2025 18:24:30 +0000
Received: by outflank-mailman (input) for mailman id 1096740;
 Wed, 27 Aug 2025 18:24:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+iP=3H=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1urKou-0006ki-AI
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 18:24:28 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f8c82e1-8373-11f0-ae26-e363de0e7a9e;
 Wed, 27 Aug 2025 20:24:25 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by MRWPR03MB11023.eurprd03.prod.outlook.com (2603:10a6:501:76::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Wed, 27 Aug
 2025 18:24:23 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9052.014; Wed, 27 Aug 2025
 18:24:23 +0000
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
X-Inumbo-ID: 0f8c82e1-8373-11f0-ae26-e363de0e7a9e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HAqwLuIe/9cusClOKPBD9ey2jRYMcr9WOJSPJUooRp9zrYUA4axSCuQd0U/EeHsxxmL2VXeqyZXOrTBcfqObGDC+rFiaRlBh7jB9FROYKcJ9nP9b+5Nj8QJXTU/war38UDJ8t/yqSdWTlyBk9f5WyxKTqpuUE0QMDXdg28w/QJmU1wV+JKpr93L5choFXWCd8sww74hfevy6u2h42SQh45Gq/0p8pf7w1wP6PoMqlyl2RQFJFKk0jBHdLbpckSuJ/BHXOJAdHBofrE60NS3F5SAiQyoDWZCI+VcUDReYcYOtbTBntRBx/V6IJp+vMsYcdYol4VhhSZhqThKsGNljCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=anilZOdhlS2ZHLYSyDc2Ak0Qj1UUYrMkpewbdPgEXe0=;
 b=PsYRhvTZ9b0n0/PpSPQBmuUm4cL8gbxM64DRTrliwiav00Rev99CD+5d1tHb/BGt1xa9dmbHCvvGCthpuCac5yvY9EzocST/7KBxgqEx4r2xPF1cU9IP5vMdJ9S/RSvoU9yThWRtwPDMQpy3kGJJpc7cZN93U2PqjyaAj/Nl8QquJZam5W8SQ2hr13j4rTAhMz16K4C8IprlLP2JETRTlJHue8xxK00ytDO9CnXF7FeXRcylA1dqUEgDAWsgccEjxXuRXeKb3C+1cPQtgUqKa3dSIOfkxnaTB3pfPDp2XmlLCLNFRhVkhuRR2EN4c49uFqPgvsMx6c5a7wMGL8TS6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=anilZOdhlS2ZHLYSyDc2Ak0Qj1UUYrMkpewbdPgEXe0=;
 b=WlE9oY0CKmPrH8e0op2MOUjkEmxaRjx+c+7wYY5wByicTfJ97br3b5+MC0DMvInhfUreoMXFU4RItPvkSjowFSRPqm/SALitQAVCSqmcuqxZ4PpMpBt830zaCE3jZ9JBAtdfSp7ju9yohxhBtIgKaLumiHMB2Z+RVnkDns/Yf1bSR81t2SYaKyWjDlUWVZQrdW3bfJNXIqgysAadipNe1IMnGR43xiiTFj0KIprPr4SSUaDpprMtCc0ncvevq+A6rnyXrxj4Ne2QKCoZxD7Vxn1jKAR2GBZI9xSmbLV//YUOhWGiQ/eq1tdRuH6SS/0bwkn67eqtZqP8iUSe+L9vQA==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 10/12] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI
 registers
Thread-Topic: [PATCH v4 10/12] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI
 registers
Thread-Index: AQHcF3/PMGQJ9ZKjmEOWPrVRdE59HQ==
Date: Wed, 27 Aug 2025 18:24:22 +0000
Message-ID:
 <6b312e1997da5abdf592f66d16067f4330431ded.1756317702.git.leonid_komarianskyi@epam.com>
References: <cover.1756317702.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1756317702.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|MRWPR03MB11023:EE_
x-ms-office365-filtering-correlation-id: de8081e7-0b1b-45a3-cd37-08dde596f24b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?e+u4IVGPpXV1olKhW59UZxK+rvtwkteGzSjXofWHFVLVha/Kxj5k8QyG59?=
 =?iso-8859-1?Q?V/CKfbvHggRbYms45/wy4wYn5pvOYIIUbhxq7OYuzst98BOcAMZfGTpRDp?=
 =?iso-8859-1?Q?+9HVSTXqKnGbTIb/0glLl4oOY+Z7sYntmlD2xpUvtYx82Na2YZhSzM9vf7?=
 =?iso-8859-1?Q?V8hB5OeNO1wO4HDZ6ObqHqE/imqc3pJhsSzv+LhC3N6000xN00GjySMuLS?=
 =?iso-8859-1?Q?yOIYRo0b8t/Q20ixTLZs1Z/vQ+eXqHcW96Wqf++0ksON32//7ZjhIUcCW6?=
 =?iso-8859-1?Q?domtkoZnEqejnLTCKcLVjswGzg/WBr5ZPqls3NwZgQzVXcFdFlqX1qrczr?=
 =?iso-8859-1?Q?eadOY6rmtLrIYuKiww0NxiUVjkq/Nj06zhP/TuHFruisqpRrXcaCTtgzC5?=
 =?iso-8859-1?Q?+FhYBiFPCjG2IN2IJk6oLSgjQ9N7E7cCfqcFgKdjHkRR4CLR5X3SnM5LDY?=
 =?iso-8859-1?Q?ijmBkntqo/HSONYKkZ1wt3nsJ5lJ+Uke80r8ajGM4BUcgt7V7itP0VBbC9?=
 =?iso-8859-1?Q?pyhzuRSIH6WsbAmxeyh9iUORpB3Lx8+Hy4LLprrVu6v5X2EAbgffdhEaj1?=
 =?iso-8859-1?Q?wI5V4zIjWccz/ugNpqaDC53mg4CA5nzrOFRxyF2hixKZfppIfKe6b9NCbg?=
 =?iso-8859-1?Q?RKCPSj5eIH/xB7/bRhVKEqmEiAJV7W44Ltn+BUMDMPn424gef82BeQO5yN?=
 =?iso-8859-1?Q?mFy+WG/MS+I743Vv15NMGIp/MiZI35A6l+xC5RmDMpBdF8pYVff4W3uTSR?=
 =?iso-8859-1?Q?1l3xOPcqfdmMs9s28wioKqllvC6ZLIJq5mOtmoEqr/pdawzgzH1GZ4Wrsk?=
 =?iso-8859-1?Q?RjpPORyZFKe/dbJ6tVWcg9L+OMcieAE1GhinIWMUQ3jpy+yZVjrbNtgKOH?=
 =?iso-8859-1?Q?shwIJ6M0K5z5Njy8tbd9jl+JlgYYGgAYWOkgO5CvUWv50c84/8Bs5g7zHI?=
 =?iso-8859-1?Q?4eNdPOz0MqEXolLWC3+DgOXFL6+Og/xprr3hUyAfsRCv4LVdM2yTz+z+Nv?=
 =?iso-8859-1?Q?+jBjAJIoQEvcJlNs25C/ayL/4ZJWYnTcr+Vv8FuxJZ7bm43G0H6ie6SsBy?=
 =?iso-8859-1?Q?Ri2cnktVKMcxWnwt2xIKI7Lvc81M7Db4npvrshjCfXsRjIjEonOFsq21KD?=
 =?iso-8859-1?Q?7SEWTQXVSFqGLXcUfT79tGK2AyF42PwNltso7nU3EeAA+QowgiXdTB5RAG?=
 =?iso-8859-1?Q?Rg2uS3xklpMJWOzKj3ljWGakzJ7g78tUfvtIpQKn1rlWBEZSCtzzSVzCEG?=
 =?iso-8859-1?Q?T4iXO7IK0G1+4qiq8nj7kEYi/GacYpkTccWH7ObF/djaVyOTdRhIOCQeA6?=
 =?iso-8859-1?Q?75KkiS881bRtm3hk6Wubti0RG9yHGeiwhtJMEFXF0KMyPsQu8XWBU0rUnZ?=
 =?iso-8859-1?Q?rGfUCgr+TqRkF9ePp23efvaEa4tMtQAvfjiu2hmw22lri0NDGBalfMF8p0?=
 =?iso-8859-1?Q?HurMkw8qIPYzwWyFcFpEKLTuKj7s/WHBXdtPwq1X4Lhc9Kv0hG7xoCq/rk?=
 =?iso-8859-1?Q?4TREI/B9TNSm6TKbcDhe/9VFqXPUX9WHXdTx/ip/4oag=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?9vGwg9RgUTIqN8GkUiQRu65hy5h0POUjroC40xqbK+LtCp1tbuTmpw8B6h?=
 =?iso-8859-1?Q?i7lJQm86rShWLKHnVBk1LnySmpmd7U0bW9rrq27E1OYgYKKBCsrQvdJ/ti?=
 =?iso-8859-1?Q?xqJ9izcgqj4WpQOFQrnPuaMrmTIrMtyB7nwgVi0tcYJuJSfBKwzXmdpnXs?=
 =?iso-8859-1?Q?K0M3a4mEzXqbeAQqsuwrj8VYAGSMMCXCZI3SmT/iR723e2gu8Z3/gqTara?=
 =?iso-8859-1?Q?yZqUZlegCvApXh6UQ5Ms4kQGPq3j4nF24PEWAqMJlheSeekExsbXO56ZwH?=
 =?iso-8859-1?Q?7j8g+DDfPFlBI5qJEAO+fOCe8AVVHWcjMOk8AYvbDVzoQ8VhniSolYYIpU?=
 =?iso-8859-1?Q?IVlS3SZqUg5d/p79PDCOiENZQv7FLc+nuC34wPS4ajx+aSD2n+wrfzFKB8?=
 =?iso-8859-1?Q?kdmQMofPEbaIQpB0m3iG8SQuPXSTIDkzBgLk+Uw1+RYaL0IigWLiblJJmE?=
 =?iso-8859-1?Q?oceiGtULSEkfF+bDOXV1LjEMytlblugty6FV4wtDWq5+wFxlbKYsPiF3IE?=
 =?iso-8859-1?Q?1To+Lc7+KGsHuoBy1BhxZ3vHEXb8ZlsXSXPlhvi5PXtE8xksLU61ZgDVKr?=
 =?iso-8859-1?Q?GFgqaps/KOHCFl4SVUJKJwog6QYxS6gLsI6PhIZNu3w94v79E3xyiTupSB?=
 =?iso-8859-1?Q?v68+m5ltgK2odDQeHTsf/xCp8QDq80h+OmcRy8xNq4vHW3BFoFpBeIlDQl?=
 =?iso-8859-1?Q?qjd7kfjMYWucaXEuznXha1+Qx/pWVq56AbwjvuOJYZ9DrEKN6Dhc9+Xsd8?=
 =?iso-8859-1?Q?ZI0u7VcYEFhJ36K5NJeOjydNO7m19k8TCLYKn2Z27LqDCN78mrmn2NTf3b?=
 =?iso-8859-1?Q?uOajuMOjogMmDp5xiPm5Q/L9vSvPHga8g5OutULWgAJRrWVTqRS7BNnB+l?=
 =?iso-8859-1?Q?I4+UT8UpAi6itYSc1L2Ii/ZYXsEwY7Rribqg66dX95jUJ0j+nv3zMYKD7n?=
 =?iso-8859-1?Q?B96yKQnVHtSLh08B8dj4B994DLx/6jwYKMEIAziNwFKXZiDuI7RmMQ0BeR?=
 =?iso-8859-1?Q?zH94XAbXh3EB3Xr/mKToDUCHkH85+QY04IvqKP7/LzabPoMX7WbZasBjAS?=
 =?iso-8859-1?Q?XLQ5noSsbMrar74PXBW+hjM8W/CPkPmO3oomZwmTktqeVKSAk7iLDMNJig?=
 =?iso-8859-1?Q?nQvSn9JtGfWJq1hLOEK8cYwvN9Z1zrLL89226KeuhfHbY+az7K2DO8GQeY?=
 =?iso-8859-1?Q?P9ptym1j02k/zPZvMY2+gfNFltQxQ5jYlneAAbjMU1vqbBKWus7vJj2SgD?=
 =?iso-8859-1?Q?/fCTuLY5xrO/9/O7iIgXwoYJVPbFITcsRvhXtIZ7EVtxlUqoWGeUJEu0YJ?=
 =?iso-8859-1?Q?9dy5sDak/vifA0Iz/0zxodbMzci24RDZF8aaNLyxBKbTU4GdcQjt+mKcH+?=
 =?iso-8859-1?Q?fDNJ6i0Aq8PeXkcJUEfMRmQGW+XD6s7yb5pv/e7TbbuUBovN+2QygG9Un+?=
 =?iso-8859-1?Q?WwLgdT7pE16UN1RjZy4/nGvxzB0GLfEWSIjs8Gsa+aMuYk+AiSz4oGN1dc?=
 =?iso-8859-1?Q?2X3mavYuDmFvRpFD8MGR4nzXK1HcGaWwI6dDvQ6YzJnQhxFNWY66tlYekh?=
 =?iso-8859-1?Q?R1e+jX9MRlKQhSKGgM6PdipusNY3AtaG7G7jHI3fG0B3HrRgYyvL5AKMgk?=
 =?iso-8859-1?Q?ELckUgvfMxmoX9hCBr2OLZ6wXY0qZ0IrqksB8TcxGdqvn0KDPMSNO8JblS?=
 =?iso-8859-1?Q?Tm/n5B0rZEu5sCqivSI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de8081e7-0b1b-45a3-cd37-08dde596f24b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2025 18:24:22.9072
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GoqBeuoZjLMHB1czKuKjzCPpDuCLgSkYsj6BItliSBQqeiYqbG//L5snxWgDk2WV8fRUwnsER98aTE86lmD+lhr3bLDf+H67Y7QGfPdKJGs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR03MB11023

Implemented support for GICv3.1 extended SPI registers for vGICv3,
allowing the emulation of eSPI-specific behavior for guest domains.
The implementation includes read and write emulation for eSPI-related
registers (e.g., GICD_ISENABLERnE, GICD_IROUTERnE, and others),
following a similar approach to the handling of regular SPIs.

The eSPI registers, previously located in reserved address ranges,
are now adjusted to support MMIO read and write operations correctly
when CONFIG_GICV3_ESPI is enabled.

The availability of eSPIs and the number of emulated extended SPIs
for guest domains is reported by setting the appropriate bits in the
GICD_TYPER register, based on the number of eSPIs requested by the
domain and supported by the hardware. In cases where the configuration
option is disabled, the hardware does not support eSPIs, or the domain
does not request such interrupts, the functionality remains unchanged.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>

---
Changes in V4:
- added missing RAZ and write ignore eSPI-specific registers ranges:
  GICD_NSACRnE and GICD_IGRPMODRnE
- changed previously reserved range to cover GICD_NSACRnE and
  GICD_IGRPMODRnE
- introduced GICD_RESERVED_RANGE<n>_START/END defines to remove
  hardcoded values and reduce the number of ifdefs
- fixed reserved ranges with eSPI option enabled: added missing range
  0x0F30-0x0F7C
- updated the logic for domains that do not support eSPI, but Xen is
  compiled with the eSPI option. Now, prior to other MMIO checks, we
  verify whether eSPI is available for the domain or not. If not, it
  behaves as it does currently - RAZ and WI
- fixed print for GICD_ICACTIVERnE
- fixed new lines formatting for switch-case

Changes in V3:
- changed vgic_store_irouter parameters - instead of offset virq is
  used, to remove the additional bool espi parameter and simplify
  checks. Also, adjusted parameters for regular SPI. Since the offset
  parameter was used only for calculating virq number and then reused for
  finding rank offset, it will not affect functionality.
- fixed formatting for goto lables - added newlines after condition
- fixed logs for GICD_ISACTIVERnE and GICD_ICACTIVERnE handlers
- removed #ifdefs in 2 places where they were adjacent and could be merged

Changes in V2:
- add missing rank index conversion for pending and inflight irqs
---
 xen/arch/arm/vgic-v3.c | 333 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 319 insertions(+), 14 deletions(-)

diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index 4369c55177..ca19f24634 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -42,6 +42,36 @@
  */
 #define VGICD_CTLR_DEFAULT  (GICD_CTLR_ARE_NS)
=20
+/*
+ * Common start and end of reserved ranges for
+ * both eSPI and non-eSPI builds
+ */
+#define GICD_RESERVED_RANGE1_START (0x0F30)
+#define GICD_RESERVED_RANGE2_END   (0xBFFC)
+
+#ifdef CONFIG_GICV3_ESPI
+
+#define GICD_RESERVED_RANGE1_END   (0x0F7C)
+
+#define GICD_RESERVED_RANGE2_START (0xA004)
+
+/*
+ * In case eSPI is enabled, there is an additional
+ * reserved range after the eSPI-specific registers
+ */
+#define GICD_RESERVED_RANGE3_START (0x3700)
+#define GICD_RESERVED_RANGE3_END   (0x60FC)
+#else
+
+/*
+ * In case eSPI is disabled, the range with eSPI-specific
+ * registers is marked as reserved
+ */
+#define GICD_RESERVED_RANGE1_END   (0x60FC)
+
+#define GICD_RESERVED_RANGE2_START (0x7FE0)
+#endif
+
 static struct {
     bool enabled;
     /* Distributor interface address */
@@ -111,13 +141,10 @@ static uint64_t vgic_fetch_irouter(struct vgic_irq_ra=
nk *rank,
  * Note the offset will be aligned to the appropriate boundary.
  */
 static void vgic_store_irouter(struct domain *d, struct vgic_irq_rank *ran=
k,
-                               unsigned int offset, uint64_t irouter)
+                               unsigned int virq, uint64_t irouter)
 {
     struct vcpu *new_vcpu, *old_vcpu;
-    unsigned int virq;
-
-    /* There is 1 vIRQ per IROUTER */
-    virq =3D offset / NR_BYTES_PER_IROUTER;
+    unsigned int offset;
=20
     /*
      * The IROUTER0-31, used for SGIs/PPIs, are reserved and should
@@ -685,6 +712,10 @@ static int __vgic_v3_distr_common_mmio_read(const char=
 *name, struct vcpu *v,
     {
     case VRANGE32(GICD_IGROUPR, GICD_IGROUPRN):
     case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
+    case VRANGE32(GICD_IGRPMODRnE, GICD_IGRPMODRnEN):
+#endif
         /* We do not implement security extensions for guests, read zero *=
/
         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
         goto read_as_zero;
@@ -710,11 +741,19 @@ static int __vgic_v3_distr_common_mmio_read(const cha=
r *name, struct vcpu *v,
     /* Read the pending status of an IRQ via GICD/GICR is not supported */
     case VRANGE32(GICD_ISPENDR, GICD_ISPENDRN):
     case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
+    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
+#endif
         goto read_as_zero;
=20
     /* Read the active status of an IRQ via GICD/GICR is not supported */
     case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVERN):
     case VRANGE32(GICD_ICACTIVER, GICD_ICACTIVERN):
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
+    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
+#endif
         goto read_as_zero;
=20
     case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
@@ -752,6 +791,69 @@ static int __vgic_v3_distr_common_mmio_read(const char=
 *name, struct vcpu *v,
         return 1;
     }
=20
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
+        if ( dabt.size !=3D DABT_WORD )
+            goto bad_width;
+        rank =3D vgic_ext_rank_offset(v, 1, reg - GICD_ISENABLERnE, DABT_W=
ORD);
+        if ( rank =3D=3D NULL )
+            goto read_as_zero;
+        vgic_lock_rank(v, rank, flags);
+        *r =3D vreg_reg32_extract(rank->ienable, info);
+        vgic_unlock_rank(v, rank, flags);
+        return 1;
+
+    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
+        if ( dabt.size !=3D DABT_WORD )
+            goto bad_width;
+        rank =3D vgic_ext_rank_offset(v, 1, reg - GICD_ICENABLERnE, DABT_W=
ORD);
+        if ( rank =3D=3D NULL )
+            goto read_as_zero;
+        vgic_lock_rank(v, rank, flags);
+        *r =3D vreg_reg32_extract(rank->ienable, info);
+        vgic_unlock_rank(v, rank, flags);
+        return 1;
+
+    case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):
+    {
+        uint32_t ipriorityr;
+        uint8_t rank_index;
+
+        if ( dabt.size !=3D DABT_BYTE && dabt.size !=3D DABT_WORD )
+            goto bad_width;
+        rank =3D vgic_ext_rank_offset(v, 8, reg - GICD_IPRIORITYRnE, DABT_=
WORD);
+        if ( rank =3D=3D NULL )
+            goto read_as_zero;
+        rank_index =3D REG_RANK_INDEX(8, reg - GICD_IPRIORITYRnE, DABT_WOR=
D);
+
+        vgic_lock_rank(v, rank, flags);
+        ipriorityr =3D ACCESS_ONCE(rank->ipriorityr[rank_index]);
+        vgic_unlock_rank(v, rank, flags);
+
+        *r =3D vreg_reg32_extract(ipriorityr, info);
+
+        return 1;
+    }
+
+    case VRANGE32(GICD_ICFGRnE, GICD_ICFGRnEN):
+    {
+        uint32_t icfgr;
+
+        if ( dabt.size !=3D DABT_WORD )
+            goto bad_width;
+        rank =3D vgic_ext_rank_offset(v, 2, reg - GICD_ICFGRnE, DABT_WORD)=
;
+        if ( rank =3D=3D NULL )
+            goto read_as_zero;
+        vgic_lock_rank(v, rank, flags);
+        icfgr =3D rank->icfg[REG_RANK_INDEX(2, reg - GICD_ICFGRnE, DABT_WO=
RD)];
+        vgic_unlock_rank(v, rank, flags);
+
+        *r =3D vreg_reg32_extract(icfgr, info);
+
+        return 1;
+    }
+#endif
+
     default:
         printk(XENLOG_G_ERR
                "%pv: %s: unhandled read r%d offset %#08x\n",
@@ -782,6 +884,10 @@ static int __vgic_v3_distr_common_mmio_write(const cha=
r *name, struct vcpu *v,
     {
     case VRANGE32(GICD_IGROUPR, GICD_IGROUPRN):
     case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
+    case VRANGE32(GICD_IGRPMODRnE, GICD_IGRPMODRnEN):
+#endif
         /* We do not implement security extensions for guests, write ignor=
e */
         goto write_ignore_32;
=20
@@ -871,6 +977,102 @@ static int __vgic_v3_distr_common_mmio_write(const ch=
ar *name, struct vcpu *v,
         vgic_unlock_rank(v, rank, flags);
         return 1;
=20
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
+        if ( dabt.size !=3D DABT_WORD )
+            goto bad_width;
+        rank =3D vgic_ext_rank_offset(v, 1, reg - GICD_ISENABLERnE, DABT_W=
ORD);
+        if ( rank =3D=3D NULL )
+            goto write_ignore;
+        vgic_lock_rank(v, rank, flags);
+        tr =3D rank->ienable;
+        vreg_reg32_setbits(&rank->ienable, r, info);
+        vgic_enable_irqs(v, (rank->ienable) & (~tr), EXT_RANK_IDX2NUM(rank=
->index));
+        vgic_unlock_rank(v, rank, flags);
+        return 1;
+
+    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
+        if ( dabt.size !=3D DABT_WORD )
+            goto bad_width;
+        rank =3D vgic_ext_rank_offset(v, 1, reg - GICD_ICENABLERnE, DABT_W=
ORD);
+        if ( rank =3D=3D NULL )
+            goto write_ignore;
+        vgic_lock_rank(v, rank, flags);
+        tr =3D rank->ienable;
+        vreg_reg32_clearbits(&rank->ienable, r, info);
+        vgic_disable_irqs(v, (~rank->ienable) & tr, EXT_RANK_IDX2NUM(rank-=
>index));
+        vgic_unlock_rank(v, rank, flags);
+        return 1;
+
+    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
+        if ( dabt.size !=3D DABT_WORD )
+            goto bad_width;
+        rank =3D vgic_ext_rank_offset(v, 1, reg - GICD_ISPENDRnE, DABT_WOR=
D);
+        if ( rank =3D=3D NULL )
+            goto write_ignore;
+
+        vgic_set_irqs_pending(v, r, EXT_RANK_IDX2NUM(rank->index));
+
+        return 1;
+
+    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
+        if ( dabt.size !=3D DABT_WORD )
+            goto bad_width;
+        rank =3D vgic_ext_rank_offset(v, 1, reg - GICD_ICPENDRnE, DABT_WOR=
D);
+        if ( rank =3D=3D NULL )
+            goto write_ignore;
+
+        vgic_check_inflight_irqs_pending(v, EXT_RANK_IDX2NUM(rank->index),=
 r);
+
+        goto write_ignore;
+
+    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
+        if ( dabt.size !=3D DABT_WORD )
+            goto bad_width;
+        printk(XENLOG_G_ERR
+               "%pv: %s: unhandled word write %#"PRIregister" to ISACTIVER=
%dE\n",
+               v, name, r, reg - GICD_ISACTIVERnE);
+        return 0;
+
+    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
+        printk(XENLOG_G_ERR
+               "%pv: %s: unhandled word write %#"PRIregister" to ICACTIVER=
%dE\n",
+               v, name, r, reg - GICD_ICACTIVERnE);
+        goto write_ignore_32;
+
+    case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):
+    {
+        uint32_t *ipriorityr, priority;
+
+        if ( dabt.size !=3D DABT_BYTE && dabt.size !=3D DABT_WORD )
+            goto bad_width;
+        rank =3D vgic_ext_rank_offset(v, 8, reg - GICD_IPRIORITYRnE, DABT_=
WORD);
+        if ( rank =3D=3D NULL )
+            goto write_ignore;
+        vgic_lock_rank(v, rank, flags);
+        ipriorityr =3D &rank->ipriorityr[REG_RANK_INDEX(8, reg - GICD_IPRI=
ORITYRnE,
+                                                      DABT_WORD)];
+        priority =3D ACCESS_ONCE(*ipriorityr);
+        vreg_reg32_update(&priority, r, info);
+        ACCESS_ONCE(*ipriorityr) =3D priority;
+        vgic_unlock_rank(v, rank, flags);
+        return 1;
+    }
+
+    case VRANGE32(GICD_ICFGRnE, GICD_ICFGRnEN):
+        if ( dabt.size !=3D DABT_WORD )
+            goto bad_width;
+        rank =3D vgic_ext_rank_offset(v, 2, reg - GICD_ICFGRnE, DABT_WORD)=
;
+        if ( rank =3D=3D NULL )
+            goto write_ignore;
+        vgic_lock_rank(v, rank, flags);
+        vreg_reg32_update(&rank->icfg[REG_RANK_INDEX(2, reg - GICD_ICFGRnE=
,
+                                                     DABT_WORD)],
+                          r, info);
+        vgic_unlock_rank(v, rank, flags);
+        return 1;
+#endif
+
     default:
         printk(XENLOG_G_ERR
                "%pv: %s: unhandled write r%d=3D%"PRIregister" offset %#08x=
\n",
@@ -1129,6 +1331,16 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, m=
mio_info_t *info,
             typer |=3D GICD_TYPE_LPIS;
=20
         typer |=3D (v->domain->arch.vgic.intid_bits - 1) << GICD_TYPE_ID_B=
ITS_SHIFT;
+#ifdef CONFIG_GICV3_ESPI
+        if ( v->domain->arch.vgic.has_espi )
+        {
+            /* Set eSPI support bit for the domain */
+            typer |=3D GICD_TYPER_ESPI;
+            /* Set ESPI range bits */
+            typer |=3D (DIV_ROUND_UP(v->domain->arch.vgic.nr_espis, 32) - =
1)
+                       << GICD_TYPER_ESPI_RANGE_SHIFT;
+        }
+#endif
=20
         *r =3D vreg_reg32_extract(typer, info);
=20
@@ -1184,6 +1396,21 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, m=
mio_info_t *info,
     case VRANGE32(0x005C, 0x007C):
         goto read_reserved;
=20
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
+    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
+    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
+    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
+    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
+    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
+    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
+    case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):
+    case VRANGE32(GICD_ICFGRnE, GICD_ICFGRnEN):
+    case VRANGE32(GICD_IGRPMODRnE, GICD_IGRPMODRnEN):
+        if ( !v->domain->arch.vgic.has_espi )
+            goto read_reserved;
+        return __vgic_v3_distr_common_mmio_read("vGICD", v, info, gicd_reg=
, r);
+#endif
     case VRANGE32(GICD_IGROUPR, GICD_IGROUPRN):
     case VRANGE32(GICD_ISENABLER, GICD_ISENABLERN):
     case VRANGE32(GICD_ICENABLER, GICD_ICENABLERN):
@@ -1200,6 +1427,11 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, m=
mio_info_t *info,
          */
         return __vgic_v3_distr_common_mmio_read("vGICD", v, info, gicd_reg=
, r);
=20
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE32(GICD_NSACRnE, GICD_NSACRnEN):
+        if ( !v->domain->arch.vgic.has_espi )
+            goto read_reserved;
+#endif
     case VRANGE32(GICD_NSACR, GICD_NSACRN):
         /* We do not implement security extensions for guests, read zero *=
/
         goto read_as_zero_32;
@@ -1216,7 +1448,7 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, mm=
io_info_t *info,
         /* Replaced with GICR_ISPENDR0. So ignore write */
         goto read_as_zero_32;
=20
-    case VRANGE32(0x0F30, 0x60FC):
+    case VRANGE32(GICD_RESERVED_RANGE1_START, GICD_RESERVED_RANGE1_END):
         goto read_reserved;
=20
     case VRANGE64(GICD_IROUTER32, GICD_IROUTER1019):
@@ -1235,8 +1467,32 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, m=
mio_info_t *info,
=20
         return 1;
     }
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE64(GICD_IROUTERnE, GICD_IROUTERnEN):
+    {
+        uint64_t irouter;
=20
-    case VRANGE32(0x7FE0, 0xBFFC):
+        if ( !v->domain->arch.vgic.has_espi )
+            goto read_reserved;
+
+        if ( !vgic_reg64_check_access(dabt) )
+            goto bad_width;
+        rank =3D vgic_ext_rank_offset(v, 64, gicd_reg - GICD_IROUTERnE,
+                                DABT_DOUBLE_WORD);
+        if ( rank =3D=3D NULL )
+            goto read_as_zero;
+        vgic_lock_rank(v, rank, flags);
+        irouter =3D vgic_fetch_irouter(rank, gicd_reg - GICD_IROUTERnE);
+        vgic_unlock_rank(v, rank, flags);
+
+        *r =3D vreg_reg64_extract(irouter, info);
+
+        return 1;
+    }
+
+    case VRANGE32(GICD_RESERVED_RANGE3_START, GICD_RESERVED_RANGE3_END):
+#endif
+    case VRANGE32(GICD_RESERVED_RANGE2_START, GICD_RESERVED_RANGE2_END):
         goto read_reserved;
=20
     case VRANGE32(0xC000, 0xFFCC):
@@ -1372,6 +1628,23 @@ static int vgic_v3_distr_mmio_write(struct vcpu *v, =
mmio_info_t *info,
     case VRANGE32(0x005C, 0x007C):
         goto write_reserved;
=20
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
+    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
+    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
+    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
+    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
+    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
+    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
+    case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):
+    case VRANGE32(GICD_ICFGRnE, GICD_ICFGRnEN):
+    case VRANGE32(GICD_IGRPMODRnE, GICD_IGRPMODRnEN):
+        if ( !v->domain->arch.vgic.has_espi )
+            goto write_reserved;
+        return __vgic_v3_distr_common_mmio_write("vGICD", v, info,
+                                                 gicd_reg, r);
+#endif
+
     case VRANGE32(GICD_IGROUPR, GICD_IGROUPRN):
     case VRANGE32(GICD_ISENABLER, GICD_ISENABLERN):
     case VRANGE32(GICD_ICENABLER, GICD_ICENABLERN):
@@ -1386,7 +1659,11 @@ static int vgic_v3_distr_mmio_write(struct vcpu *v, =
mmio_info_t *info,
          * Manage in common */
         return __vgic_v3_distr_common_mmio_write("vGICD", v, info,
                                                  gicd_reg, r);
-
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE32(GICD_NSACRnE, GICD_NSACRnEN):
+        if ( !v->domain->arch.vgic.has_espi )
+            goto write_reserved;
+#endif
     case VRANGE32(GICD_NSACR, GICD_NSACRN):
         /* We do not implement security extensions for guests, write ignor=
e */
         goto write_ignore_32;
@@ -1405,26 +1682,54 @@ static int vgic_v3_distr_mmio_write(struct vcpu *v,=
 mmio_info_t *info,
         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
         return 0;
=20
-    case VRANGE32(0x0F30, 0x60FC):
+    case VRANGE32(GICD_RESERVED_RANGE1_START, GICD_RESERVED_RANGE1_END):
         goto write_reserved;
=20
     case VRANGE64(GICD_IROUTER32, GICD_IROUTER1019):
     {
         uint64_t irouter;
+        unsigned int offset, virq;
=20
         if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
-        rank =3D vgic_rank_offset(v, 64, gicd_reg - GICD_IROUTER,
-                                DABT_DOUBLE_WORD);
+        offset =3D gicd_reg - GICD_IROUTER;
+        rank =3D vgic_rank_offset(v, 64, offset, DABT_DOUBLE_WORD);
         if ( rank =3D=3D NULL ) goto write_ignore;
         vgic_lock_rank(v, rank, flags);
-        irouter =3D vgic_fetch_irouter(rank, gicd_reg - GICD_IROUTER);
+        irouter =3D vgic_fetch_irouter(rank, offset);
         vreg_reg64_update(&irouter, r, info);
-        vgic_store_irouter(v->domain, rank, gicd_reg - GICD_IROUTER, irout=
er);
+        virq =3D offset / NR_BYTES_PER_IROUTER;
+        vgic_store_irouter(v->domain, rank, virq, irouter);
         vgic_unlock_rank(v, rank, flags);
         return 1;
     }
=20
-    case VRANGE32(0x7FE0, 0xBFFC):
+#ifdef CONFIG_GICV3_ESPI
+    case VRANGE64(GICD_IROUTERnE, GICD_IROUTERnEN):
+    {
+        uint64_t irouter;
+        unsigned int offset, virq;
+
+        if ( !v->domain->arch.vgic.has_espi )
+            goto write_reserved;
+
+        if ( !vgic_reg64_check_access(dabt) )
+            goto bad_width;
+        offset =3D gicd_reg - GICD_IROUTERnE;
+        rank =3D vgic_ext_rank_offset(v, 64, offset, DABT_DOUBLE_WORD);
+        if ( rank =3D=3D NULL )
+            goto write_ignore;
+        vgic_lock_rank(v, rank, flags);
+        irouter =3D vgic_fetch_irouter(rank, offset);
+        vreg_reg64_update(&irouter, r, info);
+        virq =3D ESPI_IDX2INTID(offset / NR_BYTES_PER_IROUTER);
+        vgic_store_irouter(v->domain, rank, virq, irouter);
+        vgic_unlock_rank(v, rank, flags);
+        return 1;
+    }
+
+    case VRANGE32(GICD_RESERVED_RANGE3_START, GICD_RESERVED_RANGE3_END):
+#endif
+    case VRANGE32(GICD_RESERVED_RANGE2_START, GICD_RESERVED_RANGE2_END):
         goto write_reserved;
=20
     case VRANGE32(0xC000, 0xFFCC):
--=20
2.34.1

