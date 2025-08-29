Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25872B3B43D
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 09:29:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1100730.1454060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urtXu-00037O-21; Fri, 29 Aug 2025 07:29:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1100730.1454060; Fri, 29 Aug 2025 07:29:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urtXt-00034Q-Vd; Fri, 29 Aug 2025 07:29:13 +0000
Received: by outflank-mailman (input) for mailman id 1100730;
 Fri, 29 Aug 2025 07:29:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Upt9=3J=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1urtXs-00034K-BL
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 07:29:12 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da78a94f-84a9-11f0-8adc-4578a1afcccb;
 Fri, 29 Aug 2025 09:29:10 +0200 (CEST)
Received: from DUZPR01CA0079.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::16) by AS8PR08MB9388.eurprd08.prod.outlook.com
 (2603:10a6:20b:5ab::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Fri, 29 Aug
 2025 07:29:06 +0000
Received: from DB1PEPF000509F1.eurprd03.prod.outlook.com
 (2603:10a6:10:46a:cafe::5d) by DUZPR01CA0079.outlook.office365.com
 (2603:10a6:10:46a::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.19 via Frontend Transport; Fri,
 29 Aug 2025 07:29:12 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F1.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.11
 via Frontend Transport; Fri, 29 Aug 2025 07:29:04 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by DU5PR08MB10755.eurprd08.prod.outlook.com (2603:10a6:10:519::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.14; Fri, 29 Aug
 2025 07:28:31 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::ab1e:55db:9d8:afbc]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::ab1e:55db:9d8:afbc%3]) with mapi id 15.20.9073.016; Fri, 29 Aug 2025
 07:28:31 +0000
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
X-Inumbo-ID: da78a94f-84a9-11f0-8adc-4578a1afcccb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=rdnMa1Y6gJ9VcwXuMaonpi15egv4qwTRTmUA+JyjdpwSCiAqcM1N7+XqrQPgaoQWJQUhihje2MjyMJwzsKbFXUUladbFuG9MlYhmT6H01ulcC8Q/K6vqQtSvrc3IB1hgvHfFl+y6tHk4j13QgM/b6wCcDffL8wZz2Jgmq8fm21+fXx+UL94mngYb9emEeuetD5fiDljTmugxRN3oAL0bhjC3SO8T6SkLrgEL5htZLtHSbyESwis2I5eBxJ9fMXK5eB3fVTRgRZz6dHpDtPdIDGQSnn0J4i2aor5mD3lkyAOwD9JnSVIUaJbDHWS9EstYyG79JM9MLO4SrPRemk4Eog==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9d+LnO75aiLEZm6n7AaGsqYnxJQtF2jybGmQaNj3WhE=;
 b=KvMEna1U3nRJsHw4jawLT6nYryI/1o6vyGiyzBlLQ2NjrJrJI97YJyHdU1dnHheJn7SBoQWNOOKuF59F087JAlcm3RrVqNERoN1f7xyp8yAOZV3wXr2gspVSWkyNYeCDQQyIzugig47blc9OwJYkXk+TcGDgjaG0aQi5H32WQBgjY787WvHmj9jtaUBaXGN0KELEn2Ja1IJGE8CntEjMKivuESR35of/xVj8P2D0Cty0Lq0mmh5F3eaBc2l52U0wRH1bK6LCwZKaJh3GAXg1fNheOBrro8R2wIOYxge/ktS2ylrz/rS2Lb7rI1kgFPWhavqkyrmX4zAQkIT7aR+xLw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=xen.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9d+LnO75aiLEZm6n7AaGsqYnxJQtF2jybGmQaNj3WhE=;
 b=oLgHaDB76bbLe4utDiD60Y5k9TW5QEViLn88xXgiHnCQNgwT75vbfeyYL6Xk4SBZlenTGWLjOphAgJd/vkC6VRyFc0oOR5t80x1l4yKSQteLyyzfdcfmxHLL+ytvIU3Tu/v/ra3mAxBpUdI8IqV1zl0DSP6uUytYIh5M5ISDYFM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GcWFYhUtokCH4jt+mV9WZCYoS21wZrVCxJNhsm70psZHK19Y/Wh627OC43c+qrumNJV89ZP4X4Dj/ZZ+DTtaF8wdvfxLUZ1/wQHcjtq809rMhjzYv8zLdf0W+Eno8rnV8S/TpSomqdqqSDmqtz5UObo92Akg82koXx+1rjwIof9/zDIpK9SYBQODIoPbvCFypoUU+QgLxUKYUdradziT8NqyuRx5JSaxuA0eti8PZBe+aRzB3v/7YgB1O/k8+Zjy1LAvzjOvqS5qYPalruJ1WQxE8h9JXqI0i3R4BxGaVbM3YVU4HG+MVUcyvjDnjr14FhqSDIGT4kOLrd4dphCXbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9d+LnO75aiLEZm6n7AaGsqYnxJQtF2jybGmQaNj3WhE=;
 b=ow8mShJfmD7LWmo8p5DleBGMZOTiW9NyWFy1Ofx/XSRXyw/CnIIg3CelB7afkcvr16OSiM3fRuohiCA5n1IxDqAdPzneiGc2hOMM80NUPEV1C7YEQTem4SWX4Vj7xCUQOE1RzDJDFJhFWaOeyrsaq7YEoFDv4GQa+YbS7pig6NCQMalgcE8kC9oXGzlME1s0VyJOEAwHZmTw1OneaIpwzP1r7q7XfpwSq/41ThpiMMl/xOSyS8QfF+vWcw4YUJuOJZPG/ADVLeDkS7Ud/5IlWhsxwlLK23SD3/+Vi2Sr0oN1+ssSCI6fXaoVY4EH37q7KbeRfXcYCfVScJUacdLFyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9d+LnO75aiLEZm6n7AaGsqYnxJQtF2jybGmQaNj3WhE=;
 b=oLgHaDB76bbLe4utDiD60Y5k9TW5QEViLn88xXgiHnCQNgwT75vbfeyYL6Xk4SBZlenTGWLjOphAgJd/vkC6VRyFc0oOR5t80x1l4yKSQteLyyzfdcfmxHLL+ytvIU3Tu/v/ra3mAxBpUdI8IqV1zl0DSP6uUytYIh5M5ISDYFM=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Hari Limaye <Hari.Limaye@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Penny Zheng <Penny.Zheng@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH v3 5/5] xen/arm: map static memory on demand
Thread-Topic: [PATCH v3 5/5] xen/arm: map static memory on demand
Thread-Index: AQHcGLWqZ0Mx4e+sDU+SZKlpnxj7ELR5O3kA
Date: Fri, 29 Aug 2025 07:28:31 +0000
Message-ID: <14107953-172A-4B6C-A25E-7EC747069105@arm.com>
References: <cover.1756379422.git.hari.limaye@arm.com>
 <30cbc79f765c21759d74377e55cc471210fc2575.1756379422.git.hari.limaye@arm.com>
 <3e97a88c-4b5e-4735-bbb5-2515dedb333b@xen.org>
In-Reply-To: <3e97a88c-4b5e-4735-bbb5-2515dedb333b@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|DU5PR08MB10755:EE_|DB1PEPF000509F1:EE_|AS8PR08MB9388:EE_
X-MS-Office365-Filtering-Correlation-Id: b696cd1f-8f30-44e3-8ca6-08dde6cdbbda
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?eZ/FKtPzZOcig0kegSyx6Ae0OfsrxgX5Bnsg+ptdCDQIvLC2SmSvXBLIP3?=
 =?iso-8859-1?Q?iGE9zHa5cEBHBi4xNu+/JEEXkh2BLWBAI3NCTWKNXqRPZZCAhNZqA3DRtJ?=
 =?iso-8859-1?Q?kWkQcSbN/akyi0hhRTVmDdSo+Ast6Mi/ezefzLxJjgUqEOq4nAqtX3NPEy?=
 =?iso-8859-1?Q?WNlsDONVzirk9qxuKf5lwXdTzxqCwRFkHiI1iDB8DgeGF1NuXyoKvNU34t?=
 =?iso-8859-1?Q?R3q6exW8s6louJiJedEw4BXjJyjujwlKV83zvDTFv73UGh2Z0CrzFWhbMn?=
 =?iso-8859-1?Q?wDQLfB1x16ZYb4pgt/EpMmFxKP7Ygb5+/o5e2C5sGNzMPr3pVYw4tVU5ik?=
 =?iso-8859-1?Q?xfw6kVK8Bj/NRLuVM0t09IPy/4VuWBytW3sY8Y3UqQUSmgaUFo1q+Igfqx?=
 =?iso-8859-1?Q?Y2GsNRQITJnyMgSmZ/GF5I6KJEAbY5eEHQzpeOE+uiw0cUF5/cn28VSoce?=
 =?iso-8859-1?Q?jC9BKBYNt/MCIQ1RGSKcfhCNGJ19CIN7lWgD+/MnXsxU1lkDjSB3MoAJHY?=
 =?iso-8859-1?Q?KU5vCkQjCosxlUafARoeBfPwn1fHpJQ4jRbw8Qto/+iytRoIjgITjSqlSn?=
 =?iso-8859-1?Q?TjiQCR1bp5vRC0bUokh6jvhwirLs/lX4NxGkojpXQRSlHYKaDVds4PwMLM?=
 =?iso-8859-1?Q?fppV4uo3a2TxnukaaeIMmKcg8JxsgIOD2zVKXxEMLs5zEBW8YKJVE0wW9k?=
 =?iso-8859-1?Q?5dr9E4DoiHdH0RnS+qszTUkir6hO5TOLZZxP4nqrZpr8mlQ/iZu9m6pLPj?=
 =?iso-8859-1?Q?4Vj6Kqtc7TLAZ7bdwSSxVVx4m5BScehf9KXdJsf5+GZz2B5TI1yk7KqrLz?=
 =?iso-8859-1?Q?vqYx3peE+WALn4CXyw9uKm1xmJAb3vtg5a+yv3/qOyE3xlUIRFDjTBwRWx?=
 =?iso-8859-1?Q?KjakL103z1ReWVqRfLBGfDBYOWsRJ0OWoa6GpON0e0fHL65Is92eL98Hca?=
 =?iso-8859-1?Q?CvFC8oKxvVjyQWucxhezZU3nlbXtD7XA0zZC8+I5HB0gXaFsYsh0e0E+Dd?=
 =?iso-8859-1?Q?LKubrncOBc/yXxCIp37ioZZQJ2djxeu7XDoXmTVWsxxhmCvH92b3TzX9S5?=
 =?iso-8859-1?Q?mmeHKOs9d4WsIz+W/leCtz+UBwnVpsqViphVdS+N40Fuc4DX/xafmNGmHt?=
 =?iso-8859-1?Q?IRkwrz7JUAcmWXtLtFCfN/7F++CDmlEWlC3JsOmWst6IK2W92jK618gWiY?=
 =?iso-8859-1?Q?NZ5mT7AlIk+A8AA0QCiQ5FLwvai25gGe3OKe27cA62Hgl/SnR1oLN2w8zW?=
 =?iso-8859-1?Q?6e4uxyeuCAPWsoR0zyCCx2DaX5j7D9iy4XMupo5v326OWX1j3K1CH61Lja?=
 =?iso-8859-1?Q?tt8LjDvEuXFhvMVMTYZPEB+nj692xxwfzjfn4Lm9370cTprKBx8xmg1/ht?=
 =?iso-8859-1?Q?LKSfuxTIasgNhIvSyFF5q/711v0sSo+c1B3NEuduVP3TOgGWrcNxnjDL9P?=
 =?iso-8859-1?Q?+VjkuEO2Fyd30kMec2PBd/5VBxau0N0inkmBArsDdFusyzWuBJqRL+VjRj?=
 =?iso-8859-1?Q?UO9UpZTDuhkCPef0WuERsmlXgpTuYVOfzXEL/zYLzl8g=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <F0EEC3B3B2DF4740A0F9DE49F95CD259@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10755
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F1.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	36bed72f-7f97-46c2-77d2-08dde6cda7ab
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|35042699022|36860700013|14060799003|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?9XOd/aw2KdLkwFMnNmcIb5tfJvTFr3vqXWI+fiH8j9aApVGbDmJqP6A21T?=
 =?iso-8859-1?Q?TwpOOAbbzw+HRuTzt3xXsm+MzDvyXgMONSsF+k+e5XbzJqZuKE4VD+TI2+?=
 =?iso-8859-1?Q?2w5YfWPAvwHd+fHiCLv358CXavWLTwqLIG5wDfOCId6p8xq3GvJyPJ7zMG?=
 =?iso-8859-1?Q?8WaAsq0AwfaeU+lQFO+bcQbrCUEhGQruFWsIu9x1/Ln1DAT0Sh/1PNi04v?=
 =?iso-8859-1?Q?O2CSfue5TU8qIISO0RJMfLMP/kd0JEcSSTpA0YJJp/b/71gKUmOWbrZ8gy?=
 =?iso-8859-1?Q?XbumDyCB2Zr3oF3c1YXY8VluWNeMFdifZWgN447qb8i19H4HBfpwNJMUQs?=
 =?iso-8859-1?Q?qESvSrqHJ7UfsWjGYC98QRZMcVFJajkpx5IIlPsUNBatbrj+5VkF8vcrHo?=
 =?iso-8859-1?Q?WLL37sw7VBy+O+jeUiFtguiWq3sQsSu2bjIsl9yqFDPelhtSi4qSaogZIl?=
 =?iso-8859-1?Q?2ZB0gMfF/6s2hOnmFqEVGxDZZ2ZcPrn7IhAzmF7aRRD6e2/gNLpl9mGjLG?=
 =?iso-8859-1?Q?qxo6SHPraZ4VuElKtn9pZQovujgORHDaoSQl6E2kftJkWJh8oJFMmhcian?=
 =?iso-8859-1?Q?pm9dvwhhwebH6EIf7rAIca6U07U+QkRXr0JGivq93sEy04ZGWhOKjNcNUG?=
 =?iso-8859-1?Q?rNH4bBQ3QkYUjG1sH/Cqs6xBTFP2xaQb0cQguOg/J6nljwinadMBV50eMo?=
 =?iso-8859-1?Q?wlBRdIYUI4cToe0FQth4Ux+vtE5l9wIH5vhnGb6oCU0YAWeSu5rwyJGV3Z?=
 =?iso-8859-1?Q?Vham3cbECjRfCgUDB99XTHbz1/fUWSiqhnsIJlFUk27c/CAtCBdWRV3Gco?=
 =?iso-8859-1?Q?whEboAyCqA7eDutF7q3TjvRmyopa+bAzmKvf5eznikHbOO8iXRG/4VGR9R?=
 =?iso-8859-1?Q?leS3jWXm2MzvZk/g7Cm3TkmF68Sb30uVNYT8SYVwoNk7IObQxLad070GoP?=
 =?iso-8859-1?Q?LzIXikz3gmxtnA/MfjU5N1MullI4usP0DblYWrpKlhB/hJTeBBg+KuiaDD?=
 =?iso-8859-1?Q?QntaNbbowAe/pPxoJi2n6oog3x8D3O1E8t4+fmhoP5bxtRdTrBX9dtYQqQ?=
 =?iso-8859-1?Q?s522GVf8vk1dtwq9O6UwGllBoJysV+qPKyo7Lau3l87zsOY4fkC8oRaVoJ?=
 =?iso-8859-1?Q?zu3SurP68reFtJ6OWo22Zn9aGI1Sy6q2T9DjXGUOkejxqgMvOVUcnGFnRI?=
 =?iso-8859-1?Q?YCDOdC3HKHXEp9B0NmfSLRHr+i11SLIqK2x0e+aJXPt5W0mXAuskOtF9p4?=
 =?iso-8859-1?Q?/Skb1UK1Md3rGPOiXuHg5eBUVGQn7bLheawAo/KkyIqhYRZQzIfu0VrJi6?=
 =?iso-8859-1?Q?V+zFSx0O0NF5vhams5E9uGqpVMn+2fq4tp6xSIPKpIptWt5UZns1HtCmcN?=
 =?iso-8859-1?Q?Mg6j6JwAjXHGkPWxJegH9kjcDrLAHY8xCkK6Y8p7eL9jR4mYIywtYIUdoh?=
 =?iso-8859-1?Q?7ijOo5EypTkymLsFZnH9Q8lvfdvyT6DGOlXMBetcg0wMnfC620I4PgSABT?=
 =?iso-8859-1?Q?lynZZB745J/B3+MNEuRUSn7V9IBvMvYCkScF8dUqk/KM+YI+/B/qSacwbp?=
 =?iso-8859-1?Q?5Ulkddn6/eMML7teSiU7sK1IOKBb?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(36860700013)(14060799003)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 07:29:04.9705
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b696cd1f-8f30-44e3-8ca6-08dde6cdbbda
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F1.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9388

Hi Julien,

> On 29 Aug 2025, at 08:22, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Hari,
>=20
> On 28/08/2025 12:12, Hari Limaye wrote:
>> From: Penny Zheng <Penny.Zheng@arm.com>
>> In the function `init_staticmem_pages` we need to have mapped static
>> memory banks for initialization. Unlike on an MMU system, we cannot map
>> the entire RAM
>=20
> Even on the MMU system we don't always map the full RAM (for instance on =
arm32). This is why we have infrastructure like map_domain_page() (Temporar=
y mapping) and map_domain_page_global() (more permanent).
>=20
> on an MPU system as we have a limited number of MPU
>> memory regions. To solve this, transiently map the static memory banks
>> for initialization.
>=20
> I am guessing you implemented the helper because in unmap_staticmem_pages=
_to_xen(), we are calling scrub_one_page(). This will be using map_domain_p=
age() and unmap_domain_page(). I am a bit confused why we end up with brand=
 new helpers rather than implementation map_domain_page() and unmap_domain_=
page()?

yes I agree, scrub_one_page is already using {un}map_domain_page(), we will=
 investigate about it.

Cheers,
Luca=

