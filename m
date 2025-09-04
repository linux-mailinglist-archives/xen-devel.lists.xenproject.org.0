Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8D4B43E8B
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 16:21:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1110285.1459565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuAqH-0006AM-V3; Thu, 04 Sep 2025 14:21:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1110285.1459565; Thu, 04 Sep 2025 14:21:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuAqH-00067g-Qz; Thu, 04 Sep 2025 14:21:37 +0000
Received: by outflank-mailman (input) for mailman id 1110285;
 Thu, 04 Sep 2025 14:21:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m40+=3P=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1uuAqF-0005ts-QV
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 14:21:35 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7501f5db-899a-11f0-9809-7dc792cee155;
 Thu, 04 Sep 2025 16:21:33 +0200 (CEST)
Received: from DU0PR03MB8934.eurprd03.prod.outlook.com (2603:10a6:10:473::15)
 by DU0PR03MB8290.eurprd03.prod.outlook.com (2603:10a6:10:31c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.18; Thu, 4 Sep
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
X-Inumbo-ID: 7501f5db-899a-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K1h/HTSJh7gr2ZIJZCnyDO166So+wPA6iUjDi5K5ZmcjpxcFSwddRQwsCksC/8dhQ3u8150eXwtvmkYFQX466m8vwk9465mHxyXIAB2E8alfqAf7TSjzIquCMowv/rIu6jpoHnUe2U6sXOHI99eiB07eHiP0eG/LAXksew7394ROLCQwmxm49gJBAjKFfoReigNtr9bJYXJVnmf0pq8Nn8mJrQ9Qom1zukFg0lwXLF2PWDD+PBMPPr++/8VJjaUn+ZNo+OeNZTsE9++jlXOMK+/3Ijta4uFLXgPUD9zFAmPcPfrHgW1zFsoAgyIm7oU+PyM/ZKqsY5bp6bGFYzSsUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AaHCelQ59jKtKWLwfwblTdez/+Ey8JJ4o/qqx28tWCs=;
 b=t0SZ0KLzi5XjpCMaldxP7p+gaz65zBbZojdotruPZw1hfZTRtnYZwSPOn3NB3w42JQ8pndnVkhm5/xItXw73YAQA5wSj4RJdWiP/m3I79sq1oEuijJ7gcuN9iqgYKKed/mz8247PrJ5Qu0VI5YzEwUzx9c2lmkP6KQLNdSRnb9Z0RsaD2sApqJquW3FG9H+hEwSbQOGQ0rKRffwlo4tWQplyX/Mxg+ZMy7G1VgAa5EyE1FD1Dnc1iAXz/D4XFqkt7LrHxs5vjJ0dJ3RkIaXUcJYdZ4tSFE1NVFeAI+tjJ2kMSsJR5pAZulWP4uhwRwLPCjkeQnmYm35aXd2/4c9/uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaHCelQ59jKtKWLwfwblTdez/+Ey8JJ4o/qqx28tWCs=;
 b=sb6b8uDV6LSHwtb7PO7wDsAn2iMKvs6UiRyl2kkPZOwbuDrbHu36FQNWENVMUl3yfJLe0Sc2aPqVfCeFSzWY74nlcu+2A6/+5U36SyU/Mol16oEfBs3birU2hi3Z3UXiCYzhSoAntKtVdoepMh3WCAZMQxDaTEVBcvCQMsy0PmCRVrP54QkDOkW5/pgVLE5DIZ1/gJPWOKx/WxyHkvg5IUsoxQm9KxMP9OtWdArtVHZmk1TgfvVJtX0mec28SeZWriSAiCE+VM9KY2HVqLbwiIO3JtF7oYZbq7pG9GCH10QemdkCh6cZiUW6gErhBFC4JhQzPeFcYsOepOJMxKeCkQ==
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
Subject: [PATCH v9 4/4] docs: arm: add docs for SCMI over SMC calls forwarding
 driver
Thread-Topic: [PATCH v9 4/4] docs: arm: add docs for SCMI over SMC calls
 forwarding driver
Thread-Index: AQHcHaczJu4B0gXzU0Kn/cb9yNa3XQ==
Date: Thu, 4 Sep 2025 14:21:28 +0000
Message-ID:
 <eeb93a37a5b90abd36ab05663ff013e11ae273cf.1756995595.git.oleksii_moisieiev@epam.com>
References: <cover.1756995595.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1756995595.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR03MB8934:EE_|DU0PR03MB8290:EE_
x-ms-office365-filtering-correlation-id: bfe85a21-0b65-43d1-e573-08ddebbe571c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?gwF1j6gsXeE3x/HcVzW9nv/qqvnnyZT1YD8ZoMtop954CVCRLoFo3f5ojh?=
 =?iso-8859-1?Q?8IRszZYLMalMP6WdV5dPT4JxmP0XAH8UAJnqqlZFDc4h80a43S4+ep92ed?=
 =?iso-8859-1?Q?aDO3YfDde4YOaBiDC9ouZ6DZR/P0pA5EaJtq6fD4raAutB8Q8EfZTDOV6K?=
 =?iso-8859-1?Q?xLTtgmlFpZvT3+0Pm3NLyqKN9g5xBNqeLXe7IFXmFhLJSban8TL7q/mx8p?=
 =?iso-8859-1?Q?JQ/1tGE93Z9HUJt41Pg1OwMfpRzh4P/3A0xyVr4RlUYvURB7Na+wFOUsEU?=
 =?iso-8859-1?Q?bRkCTwMGsEw8IWQx0zGWzBFLyOg1SIlZuYrZAdEW4b0TJf7XcWQVJI0BCJ?=
 =?iso-8859-1?Q?JNwBt0b3f+F6Qjo9fW7omdk4un/j9+TiGfZNKLQynrM7dvNnDyhMn8hMr5?=
 =?iso-8859-1?Q?SICMZHaop3jct9an6o0eQ+ZCxugOSAeMkWC2dt4BkfNWXI3BkAUXZdZVY+?=
 =?iso-8859-1?Q?vRFMYmOEZLywTa6nqTttY7pPsLTkRQJF8wTXVu8wQn1glI6iaNgeRADJ2d?=
 =?iso-8859-1?Q?91UznIRtA81kbKYo4MmbCwOAi4bOU126NPkL6X/gCtlbkRJyPTVzaB+i/G?=
 =?iso-8859-1?Q?x+HN/rjWbdiB0dT5d5XNvjyL2cFwEB6wx563clL5mV4M+kpUOS8YiLhUOo?=
 =?iso-8859-1?Q?mB6z50BjrPuR0SNKcJoRl3O1Lg5U8B4El5Dl1ujN1Z0lG7hZbsKaqnnS8d?=
 =?iso-8859-1?Q?okqJerQjEqJb9WDwEDPCOHInJYLjjEqueoMIxJv+IkWrEmyGlMHpYrrz5x?=
 =?iso-8859-1?Q?zyH7L8goFS7g1OB73UCFmISu550JsjDiaipEjjacgGep5fmxCQ9kGwujyO?=
 =?iso-8859-1?Q?Wf9A23oclEhwTAXz7o2vu61c5W4NulM+yB9zk595qYmOxMbLik67Jsig1S?=
 =?iso-8859-1?Q?DqOcGH8Pi9uba/n6sBkf+U9k+ZWyAJXMKNBOZRVj8OCdRht4EmJHyFpzOm?=
 =?iso-8859-1?Q?O9SYWD4R047s89t4jdPPcncOyRWOai5sv4NhhAjwCi4xDftBdkGzlW7mpx?=
 =?iso-8859-1?Q?0oLZpoDmocGJ4ApAO8luizgTaCLkNzr/pbuPmmHWT8dW8Nl0oH55Q/K+9R?=
 =?iso-8859-1?Q?W6ARQW5ty97vCQUOBJLkqtEOyfebMJkb/i58cbE423NSyShIHpr/gnyMWB?=
 =?iso-8859-1?Q?X860uDK79wdXpfZYq1L99HrNV/w2/Pzh2NcuzqBAvb+HPCtj9Cc+JCQffP?=
 =?iso-8859-1?Q?UZgGy/PNm2W3dlWL/6CJpDGBxjtWJMRcONzH+85fKCK62EqQ7smBRcw9VH?=
 =?iso-8859-1?Q?cb65WxDs55f8tGvjAgOyii5+CkCZhFs9x1SjB0C8refWzNHxmE1Jd1P0TH?=
 =?iso-8859-1?Q?79PHLjTAVHkLG3oFwy4Xy4/hq+f/0w6fVKOGNhr0LY3N1DQ5og/6ZNO5/6?=
 =?iso-8859-1?Q?DYcKAmVPolsD0C5eAK3B7mPV0Drxox8zLmSi3IpI9N5XWDE01DsufI/4Wj?=
 =?iso-8859-1?Q?Efr1BV43hWAK9MH73JvC3261r+ZG2ncuUaL3gSBejh/xPE3axoSRU0bZ4g?=
 =?iso-8859-1?Q?c=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR03MB8934.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?CbWxF8axaGdst0B+kaObiUS+DfhCRYe95kmcaDQya1rKFtguXVdkZyQzPr?=
 =?iso-8859-1?Q?QCip1hzwXZAeKlVDNGoxdO5WuNNfo3NikrU06Zc7RQBVWB+4PbpwgEpQuJ?=
 =?iso-8859-1?Q?dak/Ptuz/9pOVeEfOjCeFM7S9mHZ9XyIiqrTSqIAdU65vu9Xl1HyEzRcS7?=
 =?iso-8859-1?Q?SrKgsxwME8hHgmxbo6LmobLyasillSPgYQwXbvk9tXSg5GmC/aIqilXsq6?=
 =?iso-8859-1?Q?uwSXlV13sw8i4bvRDODZ+N49TAqHpn2+rAmZLwgFXesTqZirjA1omiXkYD?=
 =?iso-8859-1?Q?UeajE+CPTgZfzaIKOHomAK2skqDW3KXxdbjkhcHQY38GgQ8kcB6i0aa40j?=
 =?iso-8859-1?Q?AYNsH5hbf9o0ZRTdEdU/bR6W1K3ZxUh9tB7Y3M+/4c8oWHFyVO2V8qIYt5?=
 =?iso-8859-1?Q?O1LHpNSM7WKjd04YxCKg++AA7imQP6GWf0fwGbDs0fdGpDDzRhmsiazm5H?=
 =?iso-8859-1?Q?H654DToTHUy2ojhFeM/72LTk7+aHybaHKrfQ5BRWSqO98w+T3Gyayxv2rn?=
 =?iso-8859-1?Q?sdnwV/dfmB7OE6fn0d1BYUKCl1zYZYwaMW7folfctx66yyxgLmegxXvFgr?=
 =?iso-8859-1?Q?+fp5uyU+qiEpNFUrPNNm3wV9UkQ8/OrKg35xuBHbOq2vgQmUHfzHZI6QrG?=
 =?iso-8859-1?Q?Kb8++7wlPGeQlfdKWYQaXj99CK1bCNSF55/mxPL8OL9aMs7zOEYwYtm4A5?=
 =?iso-8859-1?Q?w5u5lKMPOF4qPYiC3qT0rEiI0/WIL6IK9HJY9mXSL12T/Aizww7gW+8+Q9?=
 =?iso-8859-1?Q?AkNPe255jKPxErcqlP81D18hIA7yQz+a/fBpQ21CZf48eSrPokSrxdQw2x?=
 =?iso-8859-1?Q?aRG5Uotb+TujQroMMcNuM3V8l4EA9M8HTgNxSSVhsuXWui2Vgn43S7m/vD?=
 =?iso-8859-1?Q?hYoUag11VYp9MY1B1d7SLkR+1C+VkH0E4AjEPH3+BAX1ydnP4tBKRX4Onm?=
 =?iso-8859-1?Q?X868HvESGRLgYW2RCvdSJ5/zxHo/c0UzzZkq7FaoBLP+68DxSYOvBCUUP8?=
 =?iso-8859-1?Q?KiuodVVrCmsiZUgXyddUMNaPKqp+l0A0UhnBedtJ2saz+1p1j2oie300DT?=
 =?iso-8859-1?Q?nw2wsi/2uuc3oudnA1vciUmhLnSeiGxWCOw8ZelRXthwt4F4nw40R2evKK?=
 =?iso-8859-1?Q?Fx0Hv9achHCI3aoBySSjsXoD4F/GWedITQR2vQ8SmwQAidlyhdG4/VgRgc?=
 =?iso-8859-1?Q?3B/pNig3XS2xjRjA2FcBMQWsXOBe3Lngwm1FjoGcXYRR8RcXBnP0f7smMX?=
 =?iso-8859-1?Q?V6oUOhqSAa8twvQgHOPtSjbUdmHjMllr/41Rxa+rxO1XLWiEFzncL9hreM?=
 =?iso-8859-1?Q?ZpacoJRtxSd3rAawFBttYammHzRndRPMfiBLglZFlD6OIBJHjCIn3aCRXo?=
 =?iso-8859-1?Q?UwQeTXdkj1OwvlZoXT17elMwcC/K3MqvxG7yK4Rk94F2MVGF90YBA4HpXL?=
 =?iso-8859-1?Q?KAu0dxNMtVUPYBjpHkvrTIytnr3ewP3ZFd+7eSp9rBJr3RxElExkt44EHx?=
 =?iso-8859-1?Q?LeZNj3dqxZoawJiacpJ5SdxFdEjvaGVn7iUZ6iowwJNZMGZTfdiq0DvbPV?=
 =?iso-8859-1?Q?oq7CZiUIgfQ1+InZM71HF7QvApujWiCi4xqNhNZMzeEOWY2toGHtBDjUl7?=
 =?iso-8859-1?Q?MO0PY0/ZaK+KZrEQyJUJoUQx2lL3E3GaVBrh8xDxuGH0g5tI3M8HixoA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR03MB8934.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfe85a21-0b65-43d1-e573-08ddebbe571c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2025 14:21:28.2367
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zJR6n9bf+6oFtLnhLcwuR850GVmi4nxhBLBsfAAaH602cglmwDfyp579dl2VSP+63pOemDbhd/7OaK4Z4uUSWjvPCcRUL6LxpZm27lTLpm8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8290

From: Grygorii Strashko <grygorii_strashko@epam.com>

Add documentation section for Simple Arm SCMI over SMC calls forwarding
driver (EL3).

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---

(no changes since v7)

Changes in v7:
- fixed typos

Changes in v6:
- add link to the scmi bindings used in the doc
- remove mentions about HVC calls from doc
- rename cmdline parameter to scmi-smc-passthrough

Changes in v5:
- rename dom0_scmi_smc_passthrough in documentation

 .../arm/firmware/arm-scmi.rst                 | 180 ++++++++++++++++++
 docs/hypervisor-guide/arm/index.rst           |   9 +
 docs/hypervisor-guide/index.rst               |   1 +
 3 files changed, 190 insertions(+)
 create mode 100644 docs/hypervisor-guide/arm/firmware/arm-scmi.rst
 create mode 100644 docs/hypervisor-guide/arm/index.rst

diff --git a/docs/hypervisor-guide/arm/firmware/arm-scmi.rst b/docs/hypervi=
sor-guide/arm/firmware/arm-scmi.rst
new file mode 100644
index 0000000000..d65ce35acb
--- /dev/null
+++ b/docs/hypervisor-guide/arm/firmware/arm-scmi.rst
@@ -0,0 +1,180 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+ARM System Control and Management Interface (SCMI)
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
+
+The System Control and Management Interface (SCMI) [1], which is a set of =
operating
+system-independent software interfaces that are used in system management.=
 SCMI currently
+provides interfaces for:
+
+- Discovery and self-description of the interfaces it supports
+- Power domain management
+- Clock management
+- Reset domain management
+- Voltage domain management
+- Sensor management
+- Performance management
+- Power capping and monitoring
+- Pin control protocol.
+
+The SCMI compliant firmware could run:
+
+- as part of EL3 secure world software (like Trusted Firmware-A) with
+  ARM SMC shared-memory transport;
+- on dedicated System Control Processor (SCP) with HW mailbox shared-memor=
y transport
+
+The major purpose of enabling SCMI support in Xen is to enable guest domai=
ns access to the SCMI
+interfaces for performing management actions on passed-through devices (su=
ch as clocks/resets etc)
+without accessing directly to the System control HW (like clock controller=
s) which in most cases
+can't be shared/split between domains. Or, at minimum, allow SCMI access f=
or dom0/hwdom (or guest
+domain serving as Driver domain).
+
+The below sections describe SCMI support options available for Xen.
+
+| [1] `Arm SCMI <https://developer.arm.com/documentation/den0056/latest/>`=
_
+| [2] `System Control and Management Interface (SCMI) bindings <https://we=
b.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documenta=
tion/devicetree/bindings/firmware/arm,scmi.yaml>`_
+
+Simple SCMI over SMC calls forwarding driver (EL3)
+------------------------------------------------------
+
+The EL3 SCMI firmware (TF-A) with a single SCMI OSPM agent support is pret=
ty generic case for
+the default vendors SDK and new platforms with SCMI support. Such EL3 SCMI=
 firmware supports only
+single SCMI OSPM transport (agent) with Shared memory based transport and =
SMC calls as doorbell.
+
+The SCMI over SMC calls forwarding driver solves major problem for this ca=
se by allowing
+SMC calls to be forwarded from guest to the EL3 SCMI firmware.
+
+By default, the SCMI over SMC calls forwarding is enabled for Dom0/hwdom.
+
+::
+
+    +--------------------------+
+    |                          |
+    | EL3 SCMI FW (TF-A)       |
+    ++-------+--^--------------+
+     |shmem  |  | smc-id
+     +----^--+  |
+          |     |
+     +----|-+---+---+----------+
+     |    | |  FWD  |      Xen |
+     |    | +---^---+          |
+     +----|-----|--------------+
+          |     | smc-id
+     +----v-----+--+ +---------+
+     |             | |         |
+     | Dom0/hwdom  | | DomU    |
+     |             | |         |
+     |             | |         |
+     +-------------+ +---------+
+
+
+The SCMI messages are passed directly through SCMI shared-memory (zero-cop=
y) and driver only
+forwards SMC calls.
+
+Compiling
+^^^^^^^^^
+
+To build with the SCMI over SMC calls forwarding enabled support, enable K=
config option
+
+::
+
+    SCMI_SMC
+
+The ``CONFIG_SCMI_SMC`` is enabled by default.
+
+Pass-through SCMI SMC to domain which serves as Driver domain
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+This section describes how to configure the SCMI over SMC calls forwarding=
 driver to handle use
+case "thin Dom0 with guest domain, which serves as Driver domain". In this=
 case HW need to be
+enabled in Driver domain and dom0 is performing only control functions (wi=
thout accessing FW) and so,
+the SCMI need to be enabled in Driver domain.
+
+::
+
+     +--------------------------+
+     |EL3 SCMI FW (TF-A)        |
+     |                          |
+     +-------------^--+-------+-+
+             smc-id|  |shmem0 |
+                   |  +----^--+
+    +-------------++------+|----+
+    |Xen          |  FWD  ||    |
+    |             +--^----+|    |
+    +----------------|-----|----+
+              smc-id |     |
+    +-----------+ +--+-----v-----+
+    |           | |              |
+    | Dom0      | |    Driver    |
+    | Control   | |    domain    |
+    |           | |              |
+    +-----------+ +--------------+
+
+The SCMI can be enabled for one and only one guest domain.
+
+First, configure Dom0 to enable SCMI pass-through using Xen Command Line
+**"scmi-smc-passthrough"** option. This will disable SCMI for Dom0/hwdom a=
nd SCMI nodes will
+be removed from Dom0/hwdom device tree.
+
+**Configure SCMI pass-through for guest domain with toolstack**
+
+* In domain's xl.cfg file add **"arm_sci"** option as below
+
+::
+
+    arm_sci =3D "type=3Dscmi_smc"
+
+* In domain's xl.cfg file enable access to the "arm,scmi-shmem"
+
+::
+
+    iomem =3D [
+        "47ff0,1@22001",
+    ]
+
+.. note:: It's up to the user to select guest IPA for mapping SCMI shared-=
memory.
+
+* Add SCMI nodes to the Driver domain partial device tree as in the below =
example:
+
+.. code::
+
+    passthrough {
+       scmi_shm_0: sram@22001000 {
+           compatible =3D "arm,scmi-shmem";
+           reg =3D <0x0 0x22001000 0x0 0x1000>;
+       };
+
+       firmware {
+            compatible =3D "simple-bus";
+                scmi: scmi {
+                    compatible =3D "arm,scmi-smc";
+                    shmem =3D <&scmi_shm_0>;
+                    ...
+                }
+        }
+    }
+
+Please refer to [2] for details of SCMI DT bindings.
+
+In general, the configuration is similar to any other HW pass-through, exc=
ept explicitly
+enabling SCMI with "arm_sci" xl.cfg option.
+
+**Configure SCMI pass-through for predefined domain (dom0less)**
+
+* add "xen,sci_type" property for required DomU ("xen,domain") node
+
+::
+
+       xen,sci_type=3D"scmi_smc"
+
+* add scmi nodes to the Driver domain partial device tree the same way as =
above and enable access
+  to the "arm,scmi-shmem" according to  dom0less documentation. For exampl=
e:
+
+.. code::
+
+      scmi_shm_0: sram@22001000 {
+            compatible =3D "arm,scmi-shmem";
+            reg =3D <0x00 0x22001000 0x00 0x1000>;
+    ->        xen,reg =3D <0x0 0x47ff0000 0x0 0x1000 0x0 0x22001000>;
+    ->        xen,force-assign-without-iommu;
+      };
diff --git a/docs/hypervisor-guide/arm/index.rst b/docs/hypervisor-guide/ar=
m/index.rst
new file mode 100644
index 0000000000..7aae4a0a03
--- /dev/null
+++ b/docs/hypervisor-guide/arm/index.rst
@@ -0,0 +1,9 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+ARM
+=3D=3D=3D
+
+.. toctree::
+   :maxdepth: 2
+
+   firmware/arm-scmi
diff --git a/docs/hypervisor-guide/index.rst b/docs/hypervisor-guide/index.=
rst
index e4393b0697..520fe01554 100644
--- a/docs/hypervisor-guide/index.rst
+++ b/docs/hypervisor-guide/index.rst
@@ -9,3 +9,4 @@ Hypervisor documentation
    code-coverage
=20
    x86/index
+   arm/index
\ No newline at end of file
--=20
2.34.1

