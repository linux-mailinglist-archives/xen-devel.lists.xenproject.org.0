Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B993B44708
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 22:10:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1110806.1459843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuGIC-0003PL-3v; Thu, 04 Sep 2025 20:10:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1110806.1459843; Thu, 04 Sep 2025 20:10:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuGIC-0003Nh-11; Thu, 04 Sep 2025 20:10:48 +0000
Received: by outflank-mailman (input) for mailman id 1110806;
 Thu, 04 Sep 2025 20:10:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ukh3=3P=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uuG9Z-00062f-LY
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 20:01:53 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc9a8875-89c9-11f0-9809-7dc792cee155;
 Thu, 04 Sep 2025 22:01:46 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by GV2PR03MB10974.eurprd03.prod.outlook.com (2603:10a6:150:27a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 20:01:44 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9094.017; Thu, 4 Sep 2025
 20:01:44 +0000
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
X-Inumbo-ID: fc9a8875-89c9-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BcZfJwGOeWkeZWnRHdDU98e4EBvnBTvThScltWxOeMnnTH1T9l+jfo3lWp5CVNsPqTLE7Gc9n3XtwKkEszDxp+5Fdh6VjJKT1tHIZwGT5yehnL90I/d659ugQzX2/Np1CGr1f8PMc8M0naUB7yNMLrvYyb6gV0iZH8oSDeY/Y9caj5rT0VoB0f4NOeIB0knsQ0i/jFHYEjzlX1DURjvibeLCArD4Ym8sm0vFPtQ8o2oyhunU5JIv0NPqfnCJfcQZ/HFqhsqHm8lqqCHSMDCisDWEqPe891FuzzvP+PmGioB4OaaE2Noj37w693BpK393KbDVe4V46tOjJf2uxYM9Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hSF+SSgp9NTSL/mvRgla4zB2nDCGmCDzkRuguIvCksg=;
 b=SER+UUlg2TUJULP101HWrMgJo25oMCoIrb75ERJfCl+uUbcKWTiUoEAbSJlx9HPzgKxU1YzGRz3nUVtETVOKVJCvWOyHxIW0BQgmVNfIxdD1m5ix/dm30R+2+C8XvPw1bZFdRf0QsD2MnHxt0DorM+oYDVHCkFn7wpCNsab2ccZgttqPVJjyhpdvtEJwMDkyCnJogI3ljlFOM2O4HP7joLIrhQOXDZCvY8Qvup4k6rB27CjpFEGKLez8+1ee6HH6w01uX8wAcyjeJvl0koqzBVBU1Tg+wOgS2KoNtxLDSl+aPXusFzIRCmgYnPtQAiWxEeI7XG14lRcPmYgrpR4gCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSF+SSgp9NTSL/mvRgla4zB2nDCGmCDzkRuguIvCksg=;
 b=Wzon4+wT3vQ9kqdX6RdnfT9LgmbiPeQX48IFw5v148+39YaubEyFc79cXVpAp6D4Moifrgmc/b/OZWczI0+eLnHSmIj+U+MdyVh/8bZiYPkI53l5CUbK5cME/g1YOT2MvK0Vxk32bjNRk0R7J3SWzojlMEJ2Oj7w9VwCfrt9BZMADpBU0td3MR58jTIQwyUznAfwihxxDYo+ZdqLkcqA/GV7Yzfpeh8QdGbc9Gj/bZw8alqmqW3+ANwwijn2+JoXtqLMPtNzsClNQU8OzOrL3ym/JB2J81UNivL4VDmodfm2cs95MF/bawAiBD+zbRb8S4QO3ZoCDiB3AU+EoWhztA==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
Subject: [PATCH v7 09/12] xen/arm: domain_build/dom0less-build: adjust domains
 config to support eSPIs
Thread-Topic: [PATCH v7 09/12] xen/arm: domain_build/dom0less-build: adjust
 domains config to support eSPIs
Thread-Index: AQHcHda8LDtFOW/3qkm3ftvPZ5C2DA==
Date: Thu, 4 Sep 2025 20:01:44 +0000
Message-ID:
 <fda3aa7e6093463616666b263e425592b6a4e3a4.1757015865.git.leonid_komarianskyi@epam.com>
References: <cover.1757015865.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1757015865.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|GV2PR03MB10974:EE_
x-ms-office365-filtering-correlation-id: a99e4868-fa2e-430d-c702-08ddebeddf60
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?pRpJdWAYBbkbuUjvbDvbojz0a72ckKxq0681DDRyUovYashxj5VVRzMEnb?=
 =?iso-8859-1?Q?17C4KesmQaZjOYTR1pCULSHJxYglwBU6DsGP8Xg//bLqaxFr57ceOBSR0b?=
 =?iso-8859-1?Q?SY7+L8vFWq60k02eNKfjoTrAcI1RRq2O0mntsB982WdDz5US3u5KLmDYdc?=
 =?iso-8859-1?Q?IWSFY2Wr94tkB4hJcN19HCcw7jhOxsMM+tCogHVF8U5dX2LYiDDAOTa/Xx?=
 =?iso-8859-1?Q?WRSRB6IU0ooczakoZE5xsvAmR7wR0jPPdP8dVfCGEUJLYk9bnkc4m3e7ON?=
 =?iso-8859-1?Q?PQsNrj/rSdj+d+d6ctRuGTLE4K37BfjeBULiyPokLkrxjZRa1S2Be3eG6w?=
 =?iso-8859-1?Q?EXOfNZb6bdR6/SyC37Z0UntXyIui0Bj0JyRyHFOhUEHUVVcsHdfhJabUJ0?=
 =?iso-8859-1?Q?M3nMxmUjN58tDnRwwVS5hWj545ZanfoTBIQm6LJG34EViJvuUorXQkZPhF?=
 =?iso-8859-1?Q?wuo8sQVSdpZxFKt5Sm/DIPdLBcmVfAUzGDGpIBd0PY2fhDlCDv2Ppw/sU0?=
 =?iso-8859-1?Q?8Omt/PZ7aIP+cOmBTxzAyS8eKH/avGGvOAVkchZBG63SRdGT1LdS8DcM6O?=
 =?iso-8859-1?Q?jdLyc3FoKqgvnUMWcfaxi4FF6ejQvGsrGNDDmhcnb6PRDrMNu/JB5FDCju?=
 =?iso-8859-1?Q?9jhNne8D6wVM9yAjhKx3nIb54syjYHllFDl4rYECxCJJ216SK+jk9bpTmz?=
 =?iso-8859-1?Q?V9gaXC6yYhFtYkWITWg9oKXDbied5fSvTb2IqTkEVqA3xKD4lcPGM8zx7Q?=
 =?iso-8859-1?Q?zdFjv1f7V3dBX5Har7UZVozH91HZ4dW9gUBhWnd9+32dV84HYV2rj+l482?=
 =?iso-8859-1?Q?AXVdd1VGBhh+V1l67mmeR6LNmuxC2+LC4Tziq/HNI2htnFsk7APbu/iCTl?=
 =?iso-8859-1?Q?5CEAyDm6nx7zL18/8Mk/xfsKjc+CsXOjieMIFUwgfkGzX758ooFFRXJv37?=
 =?iso-8859-1?Q?AicuoouS8/+1o0BSnhHpVqJHATOSw/ieUXKdnDXXdIn/1vThC76HePPAaF?=
 =?iso-8859-1?Q?xLusyg/k6bob39jZ13rjI9nAoAB1i/8pTPncbSr5Md0t0j7z4wPaMusLKD?=
 =?iso-8859-1?Q?R1RyPYZPEvpDg+qtNMGdq/IqiZBUv366WsrfZ7Yul9s6X0qhpKj2Mu9ghr?=
 =?iso-8859-1?Q?HuVTacYHZJ9ICVjqxY3XicZs2SWUajYBIyDzdSw9RfpeDfrQRjYo7fI3rA?=
 =?iso-8859-1?Q?n1K7N8b5hRrhXuw5IMk4zx+J8mWGMnH06XQ0fFl+mGj9/sYQBXcUJ3fAdB?=
 =?iso-8859-1?Q?UVu2YM2RPY0tRijVZdfL7PTJj1Ux28H+ddxVo/A03nJ4yNxBGzU2qf37XA?=
 =?iso-8859-1?Q?oaD/MsFf2pyvveAI9Lu1AJXNjruaBgSfMfsWYQA7UGas0zt0mVwDuEk59Q?=
 =?iso-8859-1?Q?Jf3sNR8xT8vlDW653+PyFwycETlPYmbOmfR+PRfN7KsUhFLYfqG+ed/LCF?=
 =?iso-8859-1?Q?731qNeo/c5jSBQm+ik5UxFbQlvhwB37LApjk0opIR0ooomfEYd/T/D97tG?=
 =?iso-8859-1?Q?fGeuJz4QDy7RnG5oBJ8oUeWcA5cqnFcaVeL8gEVUtwSQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?gsl4dGxxVFzZBdKXV85gHu574In6RyIDAInsAuIMiwOkvfsmIHzc8DSvq3?=
 =?iso-8859-1?Q?1EB8qPqzuwBxUk/yBdl5YUXwVD1sLGJ2kKlCudTfGjCwB49IxTtZ9msbk3?=
 =?iso-8859-1?Q?sd9hN3HAsgmWzZVTnrZIiyljfuJtb/H6VkDpXYG6e5pSrtxyHM9NGjMD29?=
 =?iso-8859-1?Q?+Z4BE+qPevlzIj9UWMZwwvsyB2V0hNcBzvGv5PZLWvyC4cbGXeFqt3+ISB?=
 =?iso-8859-1?Q?5s+B9HfHPH+Ge/SLQWydsTeRszrXqcQLKivmQEr63JcZoS26g4pusb73YU?=
 =?iso-8859-1?Q?+fs7wS588zFFYX969U4UPHY4ECEi+JXvJKzh8oVQCb7xyTtGbDzSMzZBmz?=
 =?iso-8859-1?Q?zlX+cOOl/g5ZUJG1TFWZXSqeX41sBN/8d8r4/5CfW5JOfEafyWiLFtGUf9?=
 =?iso-8859-1?Q?3sCV5zjEV5ABs5mCFqM27+F9zehtzH7R6qFRrDUpT9DbXE8FxHvxjsXp+J?=
 =?iso-8859-1?Q?xUHzDO33bXdodQ3FCybHjC2MOxbXxUOTu/NaHUkjHc2wqk/+hdrAr273T7?=
 =?iso-8859-1?Q?T2cZr4bo5KxbyAlmI8ZPYhwJ5UteEowCUrUL1pt+G+u7lJnGmvxpquxgfH?=
 =?iso-8859-1?Q?vuUSlNOgc6n76EZJ2dZ+mhnKMHwEDuCx39QwTGnIujKW7UDGftK9nULCmO?=
 =?iso-8859-1?Q?xaxMXgcCKDPoeahP3Vh6ojSN7Bl3yU8gMwj1tUbuytoX2QNtwG/KLnZFnz?=
 =?iso-8859-1?Q?lrY7pzzX3wW7hnp9FF3C2Ti355i+20325lX4c8akBxbfBj/PyM3+g7vfjD?=
 =?iso-8859-1?Q?Netxtp/ul4W8UtZmFhWDZHw0/9fafPyapWIpCc69YYQ0O9mupPLXQKGatc?=
 =?iso-8859-1?Q?NG0eANug/cRlJWz0dazu+n63QmltGqfEPrtJlVeoFIeMxf9qhMmHG/Zlfx?=
 =?iso-8859-1?Q?rVYKXXHToXleRwM1y1teT+FTMP6YI7JIrXM20UFvg0VWLRptu96c62Udo5?=
 =?iso-8859-1?Q?D1xbahs2p2Gzb4t75JLG6kPCMfuniemP38RX3gNHE/qXdhij8KDWDX19qX?=
 =?iso-8859-1?Q?mo62MD7Jzqmwy65yc3Fd+f1X7ShZaRL9dCpWRpS9jSf42N17UCNqeBG5zr?=
 =?iso-8859-1?Q?U6rCwvucIgEEFcY7ihmPZe3Fxzt8ulA0e8yrehtbFKGWZ/EiP77VStsadB?=
 =?iso-8859-1?Q?MwH5IbrUOmpJrk9fDYczW40KZY1VGnJRJqPWBvMMfKeiU73q112k+9LpNv?=
 =?iso-8859-1?Q?OVWlyLeSJF/QeRJKuDmK9ynBUCguLdVR5gHx18z1JPe5vKfXdVR1qtpTr/?=
 =?iso-8859-1?Q?kpoTTMcaY84tLySYh+F3gizfCnacgX2biWL/38upsGJWn2Ngqf7+mLSm7x?=
 =?iso-8859-1?Q?QbEvXCljp/F5/uww8JuIjsNteudUJg8Rae+pHTO306kmG1al+go9gRVYby?=
 =?iso-8859-1?Q?6e3ccErL069wVy3NOVIFQdWp1C/zSpEpJAzEHbSQKk/vfRq2WzJzJ+/yH1?=
 =?iso-8859-1?Q?0ujRUKluF8fbFMBDKrp+ZuRMKmKeyFgIne9oEllcKUCfZnTDMwlxkjUsII?=
 =?iso-8859-1?Q?FBtcTzPCr4Mo/ZGBby73alI/YSzZ2JBlyZhkqcMPLXz9BymLb5143k4OMr?=
 =?iso-8859-1?Q?pEM7XnT57qt+8srHvSmlsJSaQbjHaibCqp7zuXcqCk6SJBwx3QWhXQVR7W?=
 =?iso-8859-1?Q?THIxXia/jyx9GuqIzo1tGPSsn+DLToy2wts2X7/ibqFqlsWiLSQ+PKoJ2x?=
 =?iso-8859-1?Q?L72BnkIbjZJ6pIkg1vY=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a99e4868-fa2e-430d-c702-08ddebeddf60
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2025 20:01:44.3473
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YdS7FWtQDIArBfufOUftoTYLC4keLvfBXb2oxkVDzY4PJj7KC8c5B5jGw4uZLKPEf7pCPVqh0ydVS9Q1uD3tE6vOUq/MbAkcnsn2RPC8Ldk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB10974

The Dom0 and DomUs logic for the dom0less configuration in create_dom0()
and arch_create_domUs() should account for extended SPIs when supported
by the hardware and enabled with CONFIG_GICV3_ESPI. These changes ensure
proper calculation of the maximum number of SPIs and eSPIs available to
Dom0 and DomUs in dom0less setups.

When eSPIs are supported by the hardware and CONFIG_GICV3_ESPI is enabled, =
the
maximum number of eSPI interrupts is calculated using the ESPI_BASE_INTID
offset (4096) and is limited to 1024, with 32 IRQs subtracted. To ensure
compatibility with non-Dom0 domains, this adjustment is applied by the
toolstack during domain creation, while for Dom0 or DomUs in Dom0, it is
handled directly during VGIC initialization. If eSPIs are not supported, th=
e
calculation defaults to using the standard SPI range, with a maximum value =
of
992 interrupt lines, as it works currently.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

---
Changes in V7:
- no changes

Changes in V6:
- minor: updated the commit message

Changes in V5:
- fixed minor nits, no functional changes: updated the comment to make
  it clearer and corrected a misspelling
- added reviewed-by from Volodymyr Babchuk and from Oleksandr Tyshchenko

Changes in V4:
- consolidated the eSPI and SPI logic into a new inline function,
  vgic_def_nr_spis. Without eSPI support (either due to config being
  disabled or hardware not supporting it), it will return the regular SPI
  range, as it works currently. There are no functional changes compared
  with the previous patch version
- removed VGIC_DEF_MAX_SPI macro, to reduce the number of ifdefs

Changes in V3:
- renamed macro VGIC_DEF_NR_ESPIS to more appropriate VGIC_DEF_MAX_SPI
- added eSPI initialization for dom0less setups
- fixed comment with mentions about dom0less builds
- fixed formatting for lines with more than 80 symbols
- updated commit message

Changes in V2:
- no changes
---
 xen/arch/arm/dom0less-build.c   |  2 +-
 xen/arch/arm/domain_build.c     |  2 +-
 xen/arch/arm/include/asm/vgic.h | 19 +++++++++++++++++++
 3 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 69b9ea22ce..02d5559102 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -285,7 +285,7 @@ void __init arch_create_domUs(struct dt_device_node *no=
de,
     {
         int vpl011_virq =3D GUEST_VPL011_SPI;
=20
-        d_cfg->arch.nr_spis =3D VGIC_DEF_NR_SPIS;
+        d_cfg->arch.nr_spis =3D vgic_def_nr_spis();
=20
         /*
          * The VPL011 virq is GUEST_VPL011_SPI, unless direct-map is
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index d91a71acfd..39eea0be00 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2054,7 +2054,7 @@ void __init create_dom0(void)
=20
     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
     dom0_cfg.arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
-    dom0_cfg.arch.nr_spis =3D VGIC_DEF_NR_SPIS;
+    dom0_cfg.arch.nr_spis =3D vgic_def_nr_spis();
     dom0_cfg.arch.tee_type =3D tee_get_type();
     dom0_cfg.max_vcpus =3D dom0_max_vcpus();
=20
diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgi=
c.h
index caffea092b..24a4a968c3 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -357,6 +357,25 @@ extern void vgic_check_inflight_irqs_pending(struct vc=
pu *v,
 /* Default number of vGIC SPIs. 32 are substracted to cover local IRQs. */
 #define VGIC_DEF_NR_SPIS (min(gic_number_lines(), VGIC_MAX_IRQS) - 32)
=20
+static inline unsigned int vgic_def_nr_spis(void)
+{
+#ifdef CONFIG_GICV3_ESPI
+    /*
+     * Check if the hardware supports extended SPIs (even if the appropria=
te
+     * config is set). If not, the common SPI range will be used. Otherwis=
e
+     * return the maximum eSPI INTID, supported by HW GIC, subtracted by 3=
2.
+     * For Dom0 and started at boot time DomUs we will add back this value
+     * during VGIC initialization. This ensures consistent handling for Do=
m0
+     * and other domains. For the regular SPI range interrupts in this cas=
e,
+     * the maximum value of VGIC_DEF_NR_SPIS will be used.
+     */
+    if ( gic_number_espis() > 0 )
+        return ESPI_BASE_INTID + min(gic_number_espis(), 1024U) - 32;
+#endif
+
+    return VGIC_DEF_NR_SPIS;
+}
+
 extern bool vgic_is_valid_line(struct domain *d, unsigned int virq);
=20
 static inline bool vgic_is_spi(struct domain *d, unsigned int virq)
--=20
2.34.1

