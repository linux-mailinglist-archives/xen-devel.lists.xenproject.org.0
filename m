Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F0FB43E89
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 16:21:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1110284.1459555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuAqG-0005vt-Ln; Thu, 04 Sep 2025 14:21:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1110284.1459555; Thu, 04 Sep 2025 14:21:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuAqG-0005u5-J7; Thu, 04 Sep 2025 14:21:36 +0000
Received: by outflank-mailman (input) for mailman id 1110284;
 Thu, 04 Sep 2025 14:21:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m40+=3P=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1uuAqF-0005ts-5N
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 14:21:35 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 738afa84-899a-11f0-9809-7dc792cee155;
 Thu, 04 Sep 2025 16:21:32 +0200 (CEST)
Received: from DU0PR03MB8934.eurprd03.prod.outlook.com (2603:10a6:10:473::15)
 by GV2PR03MB8751.eurprd03.prod.outlook.com (2603:10a6:150:a8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 14:21:27 +0000
Received: from DU0PR03MB8934.eurprd03.prod.outlook.com
 ([fe80::26fd:98f2:a1cc:be40]) by DU0PR03MB8934.eurprd03.prod.outlook.com
 ([fe80::26fd:98f2:a1cc:be40%7]) with mapi id 15.20.9052.013; Thu, 4 Sep 2025
 14:21:26 +0000
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
X-Inumbo-ID: 738afa84-899a-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HzYTTyIzkMz75hspOv4c8PL41TdIzkkZsfKTCB8NJMRyy9rnCAeLK92wwvI3n5/awN4LdhMdBy5uGMsYuDOdGegKcm8iVpg06Vd7LBda4CfQQiPGr7bjfvW6DZ7muGg3iLP/+xCX9XjJlI1Jz+oxL4P/hvL+ffoKn1G/xepfxO4RdEvu7Cc6DldNnfq6HMDSZp9a+9R4KZVt7zjXLHY0n3Q67R5V4+3yQS2xyc8oKDhnNRAoNa+5i2TMtLJP4rvoPwirZ3MNNzhcxqwHxtmryWndTeWWpPajo2bhYK/ZbE2VoO+VN3Za2wxIhzuBsb7sWMx5F+51RARkxZbKolZtmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fyzgNUPMD4DoamZnO5QjUZVFClHUGb02FXxvOb3EUcc=;
 b=SQJWuGo1lGVXFYDAkg+Igbl/JoaAmWXzf6YSaSP8H3yCrOrg3k9hJd3HoGRxEAgpYisoGxVx5vEi0JH+W+9y6VdhgqGrNeA9GIQ38ZUrilXnEP5Bw1WdyNWMsUBEkZMlEufIiqKcmfCysIq8UM5PhjsiwXj5KlhIBGJW0O37UbzlQUqZkHIzO413+eSzgCh/8Q2RF8tw2P+e73eF02HD+5WIH/VbVqB9YGRSjCRAg5o9jzWKeRMpWF1TDyR8U3QVm5HND/M+SWioCEfjsyMNTQFoqA9zKzuog1vIE+q/EylYb+IrPNqT9qI2cNhKTPINahAp/AzO5zP4xPPWw27fPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fyzgNUPMD4DoamZnO5QjUZVFClHUGb02FXxvOb3EUcc=;
 b=h9y10R9DAYEVedbVzb9e/lnxtLBvN3dTtCxXRlMuNBGbluJS5MA0qvq854FlBqHxAnXP/Uyjym5/YUSrm5FlZ/Yj598UFC+0zvwZJK4erS/3KbWsaz/N8TGeBTy5mUH0ek4QrG1/Ygz5T6OF5ux5iJhVfW5mktR424ECBRp/XaHiZD1jRoom/1kRVkL310cOiQonDTMr1pr8dqJ4YfGJ9BQAY+c1nBEA+0D8132UtG9H2tb2nbIr5QUQs0Q07R7y7LSkVgfVVTxTP5WcS3YHOZP48bZdNdOp/ng8rDAlujV9Bp8WjO6daMzYAuekxmqIMa2i8UP8M2R+EXkswQIteg==
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
Subject: [PATCH v9 0/4] xen/arm: scmi: introduce SCI SCMI SMC single-agent
 support
Thread-Topic: [PATCH v9 0/4] xen/arm: scmi: introduce SCI SCMI SMC
 single-agent support
Thread-Index: AQHcHaczzFSreK7re0KgM50DbxoBaA==
Date: Thu, 4 Sep 2025 14:21:26 +0000
Message-ID: <cover.1756995595.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR03MB8934:EE_|GV2PR03MB8751:EE_
x-ms-office365-filtering-correlation-id: a68bc284-838e-4af6-e6b3-08ddebbe559f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?2CCDtJogPV1VWgzcMHrCbBZTiIXjpJe6glcoT0Aqqv3uQII5Q7q28c42WD?=
 =?iso-8859-1?Q?rzLey+TUVszpXZJyFKnXlL1FdlIrwp+kiu81tO+nuOWYwfv3SbMV0nJh03?=
 =?iso-8859-1?Q?B3A/O+WYZr3RuC7SJAPJ1mBCxDNC/q3/x2cJIhHNFS2WcKP+HMfrCktCFT?=
 =?iso-8859-1?Q?iuSEj0jW3szDyd3oTHWspgNN50CtPXVJnicaQ0vE1NMNm6y7cIhee7dOU0?=
 =?iso-8859-1?Q?tEg+RbHtkP3SETK1Ae3c9hKf3n2alVOo8nXLu3QW/i0Y411wuEJMn6DYrT?=
 =?iso-8859-1?Q?/9J5h3BCZ4Kk82rxihfqkObgSD9EStfH0vpm73qO+irQYd0l0MFHwgR9OD?=
 =?iso-8859-1?Q?07iMV6a3ikC8IRZw5DX9IAtF+yv6J8Nh+JNF6SVlrdr+oFUDYQtbyVEEII?=
 =?iso-8859-1?Q?/ddj/AXdGa2i3byUi68yUi/55SkMxDkgFm2Mr7lmO78HDMSK0S80tlBvuB?=
 =?iso-8859-1?Q?/IrG+sHtqfO/WIgcZQi40MBwgFeFQbrcVvKWvILVgKe6WGkv3OHcojScgO?=
 =?iso-8859-1?Q?oF6GsHvYBeldcW3scZBw64diAeBn5G6COM8/NY5My7NGnzuq317l2/yBhF?=
 =?iso-8859-1?Q?PaRQXES58g64KTKs09tko0cTrUA5BgugVK4uqMiJ6eGfkDCWKkX5fffXBD?=
 =?iso-8859-1?Q?BBCaZ9VTzr/Yo+ZSqwSp9stVulfZcEHJ3dvFvNWcVmeGjckCWRPe05M3Bf?=
 =?iso-8859-1?Q?W77DsSXVWkJOYd0ORVQ1SknWoOdSXhd15FuS+NH1Rl6rmIdkuEu9XZtZEm?=
 =?iso-8859-1?Q?MEP5hSyTh9tFD1fH5PG//RCnro+BbpjPpQt4utWZFIVLkjvVgpTKekqlMx?=
 =?iso-8859-1?Q?2vcr9hHWNzXk19msTlTTHaKoSx0c3EV95WOXyEvhLhEJB49WZioU7NMj37?=
 =?iso-8859-1?Q?H47T+ast7hgZd9B7NoZOX9oJNNBKVeIfa8lxYYU8HRMcvEFyqNjZobvzxX?=
 =?iso-8859-1?Q?2KteTPdp1RoQMk2qtuQqPmvhr50AnJ2GGbBIzoVRFwbxBNE19s7qqINcuf?=
 =?iso-8859-1?Q?f8RFnlLfeh3Cl02AnGe6MB7HO0jUV8A4kNt4lAwWpqWKYjZubCgx7BL2fT?=
 =?iso-8859-1?Q?BOJOCtK5p7Zrg4w1iONTJw9AfgEpD0ksPDLhOLz/hHA00ewfCY1MgdOyYK?=
 =?iso-8859-1?Q?X42OXFpTZYv89mv34J1osR+KBs55kMECaM1SHIIbZfMircOelk4OzGIxX7?=
 =?iso-8859-1?Q?0+jSCZdO3ChopnH3AvVP7hIR2casEQhMnFy3HWqrainJbfdbuQI4hSnnzU?=
 =?iso-8859-1?Q?jjH0hSRemKtsfxPDhK7TGlRtUys/yh4oYA8+5Q8FgJG8ZzKgdJPB+/IiRs?=
 =?iso-8859-1?Q?3NKIlhlRevbe2KiGjCQJ8lDBdQguQXy7jRgSFORfy22htY5k6N6sEJtRpj?=
 =?iso-8859-1?Q?Ng/oqPDEvEPvkZpyxxEzBD0gWIYd7X+Ku/weGF4q/BNLbygdfOGYFGwZbw?=
 =?iso-8859-1?Q?yDuQpUxJgDVI35WZxjz+CMqzD1pk1Mj29TxdtLIk8BaiXW/sxR6+Qq2MLA?=
 =?iso-8859-1?Q?s=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR03MB8934.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?nwE2rOA/1GgFiRK/DYgfgxBUXkpoZzER4BLbPKgU/962lv70gYUeV2Gble?=
 =?iso-8859-1?Q?IO0AyGtfCwO0e9t315RZZuGx89KyWHTSpkn05iO2B/lPqsw1FKRjpeiHaO?=
 =?iso-8859-1?Q?CY8waRZV3l3vni6BCHv/UbE2nw1hEDNfysaf/Suo3HnPgKBbHkdkmivoot?=
 =?iso-8859-1?Q?E3D62ItvP7a7N5cJEYIkY38dTvGnzMZV+8bBNWa2mfcqzB3btonWqNqbdK?=
 =?iso-8859-1?Q?hwWmuaA/R+nCAwMgyoXRIAPdyme+/A+qTMTiX6SFr8cGYm4iPxZRGfjr6D?=
 =?iso-8859-1?Q?iPOoknWJOjUDi3FJsirwG76s2KTT6zxQHL0yby5a0b99sexJKYQxih/B0h?=
 =?iso-8859-1?Q?5xFgg5Py8O6wgWvjLEP0gQdxp9LnwPg0sQxcUFTZ5H4MnkldBKbGd6N5AY?=
 =?iso-8859-1?Q?OXlpLGXWWz6mHEI8RpNTErkYd23w4Otg44gMwf6aIr7aFDfUep0kBBwIPm?=
 =?iso-8859-1?Q?q23WwRk2uIhfivFldPyw8jsCT0hIWYhNtZzA1LgVaQsy9zjXUmZao4KlxZ?=
 =?iso-8859-1?Q?v1LahOaAetH5cgfU+B3dh+R1GzFkDK+f8pfyZnk8Y7xsKQCxzZLmfpnFKV?=
 =?iso-8859-1?Q?LPtYmrEn9Cg2ai9KWzwjVdp6nG9rGYTG0U2zWy7iOrtzNv8Ch/Nfbk6hQJ?=
 =?iso-8859-1?Q?51cCYtsLn4z1VCszjyU8WywGv2HLMEinO4Ck+Wy81eJVr3z8LnE9d6x5dS?=
 =?iso-8859-1?Q?/u0txh9mjlqoow7ENlQWAjzyqatv34U5YM619TSygd3+BusBVscR9K65hf?=
 =?iso-8859-1?Q?3+OspMh1JL8eehfRWn75f9BDFPQj+GAGFyXIrtx6CFyMIjt7UQKc3pH8Gu?=
 =?iso-8859-1?Q?uyVEbtj57SFKy7hPlyxaoraKGSlZEPZcOWk/ZOL43JVrHzXWsMPZHXJzmj?=
 =?iso-8859-1?Q?Gcor9zNLQJ04e30WzqA/r384Mtoe391xzq9RDiNV+xJsTPyMB5CAuP6KTq?=
 =?iso-8859-1?Q?dNWMCzFBkZcYxDmcZU01TLtxq9Q2ktLNGlvgh/zTk+mtnwyxiIRizrLhT4?=
 =?iso-8859-1?Q?Dyj3W/WuN3ZAAZ21BYhJSjIGOyUyfdJwWKHzLrepBBcJfAj7IQlZMKywK+?=
 =?iso-8859-1?Q?FYgikiaE1n5xZDQnJeg6YcDa3kvRwGoTD8Osjbj9wR6hbAr6nQ3DDRfCSP?=
 =?iso-8859-1?Q?TKMgJ9uhlCnAElKfmWoKFJPlV5vRDzEEaOj8JEpKRp+36DieU02hH1f56A?=
 =?iso-8859-1?Q?4zTIMUCp149YhttED5H8o1qmvxq2AH4bfYDnp4qPg1uGgktXFTeRB7p1cj?=
 =?iso-8859-1?Q?609Ih6z4i0mD8e8/GjEUHy4R4aUJEhTOGa+LWofDcVr+X9P6fGzz5kLc+R?=
 =?iso-8859-1?Q?UccdHwVLnPTanos7/uMqdoFymdqvYiaVDlbpMRs12oaKqPCduNy4qY4buv?=
 =?iso-8859-1?Q?J7h4B4nCxSWp9lpoPSLCA+y3p7iUoGYlGZgKGFJbAO51w4Vkv3MqI1yu6T?=
 =?iso-8859-1?Q?VGqwpb39ue/vRkYN9Z+T7tjLz6EH8ZXBbuQY3K3i9sEnJutRKZg7Nco03N?=
 =?iso-8859-1?Q?ODaq70/uN1JKLvvoUKxs1ipTQUgkMcBsmobn9YvCymiycUR1wGcROj8p7W?=
 =?iso-8859-1?Q?gmL5K75OVPFm32N8HN32+dnzKnmgd90waI7HOxdXKwmAfLt0w87aM9kAOl?=
 =?iso-8859-1?Q?5AgWZGS5ZaE524neXtuLgdEQA8iwDssfemDiAY5TlLrXmlXZBJTuNiHw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR03MB8934.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a68bc284-838e-4af6-e6b3-08ddebbe559f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2025 14:21:26.8881
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ewIZWWM4yckn/vCGGMIAvVPs8GsNZ9WjMyGQOtMagcmM/XMHEgwvS9kuMZeuAgm/1LkCJlJK45gTicwZuEDDLK+qTIv7satbdD8aOv97r+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB8751


Inroducing V9 patch series  on top of the Xen version 4.20-rc2
which includes implementation of the SCI SCMI SMC single-agent support.

This patch series is the first chunk of the
"xen/arm: scmi: introduce SCI SCMI SMC multi-agent support" which can
be found at [0]

SCMI-multiagent support will be provided as the followup patch series.

[0] https://lore.kernel.org/xen-devel/cover.1753184487.git.oleksii_moisieie=
v@epam.com/

Patch 1 "xen/arm: add generic SCI subsystem"
- rebased and refactored
- introduced DEVICE_ARM_SCI DT device class and used for SCI drivers probin=
g
instead of custom,
  linker sections based implementation.
- added SCI API for Dom0 DT handling, instead of manipulating with ARM arch
dom0 code directly.
- RFC changes in XEN_DOMCTL_assign_device OP processing
- Introduce arch_handle_passthrough_prop call to handle arm specific
nodes

Patch 2 "xen/arm: scmi-smc: update to be used under sci subsystem"
- update driver introduced by commit 3e322bef8bc0 ("xen/arm: firmware: Add =
SCMI
over SMC calls
handling layer") be used under sci subsystem.
- no functional changes in general

Patch 3 "xen/arm: scmi-smc: passthrough SCMI SMC to guest domain
This is new change which allows passthrough SCMI SMC, single agent interfac=
e to
guest domain
cover use case "thin Dom0 with guest domain, which serves as Driver domain"=
.
See patch commit message for full description.

Patch 4 - docs: arm: add docs for SCMI over SMC calls forwarding
driver
- add documentation section for Simple Arm SCMI over SMC calls
forwarding driver.

Code can be found at:
https://github.com/oleksiimoisieiev/xen/tree/scmi_upstrv5

[1] RFC v2:
http://patchwork.kernel.org/project/xen-devel/cover/cover.1644341635.git.ol=
eksii_moisieiev@epam.com/
[2] RFC v3:
https://patchwork.kernel.org/project/xen-devel/patch/20250311111618.1850927=
-1-grygorii_strashko@epam.com
SCMI spec:
https://developer.arm.com/documentation/den0056/e/?lang=3Den

SCMI bindings:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/devicetree/bindings/access-controllers/access-controllers.ya=
ml

Reference EL3 FW:
RPI5: https://github.com/xen-troops/arm-trusted-firmware/commits/rpi5_dev/
Renesas v4h:
https://github.com/GrygiriiS/arm-trusted-firmware/commits/rcar_gen4_v2.7_v4=
x-scmi_upd/

base-commit: dbe60f244c (Update Xen to 4.21, 2025-02-21)

Changes in v9:
- change input param name for sci_handle_call function to match MISRA rules
- update domu_dt_sci_parse declaration to match MC3A2.R8.4 MISRA rule

Changes in v8:
- reneregated {helpers/types}.gen.go, dropped unneeded parameters

Changes in v7:
- fix sci_handl_call to make changes more readable
- fix build error when DOM0LESS_BUILD is disabled (removed
 arch_handle_passthrough_prop from the header)
- sort headers in alphabetical order in sci.h
- sort headers in scmi-smc.c file
- Fix commit description.
- Move scmi-smc-passthrough definition to match alphaberical order
- remove unneeded initialization with NULL
- changed u64 to uint64_t
- Send warning if iomem permit access was failed
- fixed typos

Changes in v6:
- rebase on top of the latest master
- fix return value of sci_dt_finalize() call
- add R-b tag
- added generated helpers and types go files
- rename cmdline parameter to scmi-smc-passthrough
- fix goto tag in parse_arm_sci_config
- add link to the scmi bindings used in the doc
- remove mentions about HVC calls from doc
- rename cmdline parameter to scmi-smc-passthrough

Changes in v5:
- update Maintainers file. Set role as a Reviewer
- rebased on the latest master branch
- Introduce arch_handle_passthrough_prop call to handle arm specific nodes
- rename dom0_scmi_smc_passthrough to scmi_smc_passthrough
- rename dom0_scmi_smc_passthrough in documentation

Changes in v4:
- fix SPDX-License
- rename DEVICE_ARM_SCI DT device class to FIRMWARE_DEVICE
- move XEN_DOMCTL_assign_device code in separate patch
- Add documentation for SCI SCMI drivers
- xl.cfg doc
- fix comments from Stefano Stabellini
- fix toolstack code as sugested by Anthony PERARD
  - use MATCH_OPTION()
  - move arm_sci struct and cfg params in "arch_arm"
- add SCMI passthrough for dom0less case

Grygorii Strashko (3):
  xen/arm: scmi-smc: update to be used under sci subsystem
  xen/arm: scmi-smc: passthrough SCMI SMC to domain, single agent
  docs: arm: add docs for SCMI over SMC calls forwarding driver

Oleksii Moisieiev (1):
  xen/arm: add generic SCI subsystem

 MAINTAINERS                                   |   6 +
 .../arm/firmware/arm-scmi.rst                 | 180 ++++++++++++++++
 docs/hypervisor-guide/arm/index.rst           |   9 +
 docs/hypervisor-guide/index.rst               |   1 +
 docs/man/xl.cfg.5.pod.in                      |  34 +++
 docs/misc/arm/device-tree/booting.txt         |  15 ++
 docs/misc/xen-command-line.pandoc             |   9 +
 tools/golang/xenlight/helpers.gen.go          |  35 +++
 tools/golang/xenlight/types.gen.go            |  11 +
 tools/include/libxl.h                         |   5 +
 tools/libs/light/libxl_arm.c                  |  14 ++
 tools/libs/light/libxl_types.idl              |  10 +
 tools/xl/xl_parse.c                           |  36 ++++
 xen/arch/arm/device.c                         |   5 +
 xen/arch/arm/dom0less-build.c                 |  40 ++++
 xen/arch/arm/domain.c                         |  12 +-
 xen/arch/arm/domain_build.c                   |   8 +
 xen/arch/arm/firmware/Kconfig                 |  25 ++-
 xen/arch/arm/firmware/Makefile                |   1 +
 xen/arch/arm/firmware/sci.c                   | 154 ++++++++++++++
 xen/arch/arm/firmware/scmi-smc.c              | 194 +++++++++++++----
 xen/arch/arm/include/asm/domain.h             |   5 +
 xen/arch/arm/include/asm/firmware/sci.h       | 200 ++++++++++++++++++
 xen/arch/arm/include/asm/firmware/scmi-smc.h  |  41 ----
 xen/arch/arm/vsmc.c                           |   4 +-
 xen/common/device-tree/dom0less-build.c       |   4 +
 xen/include/asm-generic/device.h              |   1 +
 xen/include/public/arch-arm.h                 |   5 +
 xen/include/xen/dom0less-build.h              |   3 +
 29 files changed, 982 insertions(+), 85 deletions(-)
 create mode 100644 docs/hypervisor-guide/arm/firmware/arm-scmi.rst
 create mode 100644 docs/hypervisor-guide/arm/index.rst
 create mode 100644 xen/arch/arm/firmware/sci.c
 create mode 100644 xen/arch/arm/include/asm/firmware/sci.h
 delete mode 100644 xen/arch/arm/include/asm/firmware/scmi-smc.h

--=20
2.34.1

