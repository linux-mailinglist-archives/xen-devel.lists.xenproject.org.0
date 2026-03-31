Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCICL/Moy2nLEQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 03:52:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4998236330D
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 03:52:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268240.1557623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7OHA-0001zc-E4; Tue, 31 Mar 2026 01:52:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268240.1557623; Tue, 31 Mar 2026 01:52:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7OH9-0001qk-T1; Tue, 31 Mar 2026 01:52:15 +0000
Received: by outflank-mailman (input) for mailman id 1268240;
 Tue, 31 Mar 2026 01:52:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1w7OH6-0001BV-98
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 01:52:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7OH5-00G5Gh-Kt
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 03:52:11 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69cb28c1-2eae-0a2a0a5409dd-0a2a4501906e-20
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 03:52:11 +0200
Received: from [52.101.69.92]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <milan_djokic@epam.com>)
 id 69cb28cb-6400-0a2a45010019-3465455c2a2c-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 03:52:11 +0200
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by GVXPR03MB11035.eurprd03.prod.outlook.com (2603:10a6:150:287::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 01:52:09 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%4]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 01:52:09 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UD2VyR2vsNvq14AKn80qkDi+Z+Aynfkl7tXyro/6zyMOGhX5/0s5bdQ+kpyDjTCkHY786rRrpe+AogBLASh62OrBajxIeyuBjbxnwaNrTuL2RS2ALBQaxAG3SBHobAhY5DJxgePYiOBw26Q1xxR0oLtBnhvFlTPoO61NA/C4HN8lLAZL7bdpZYOAsGQOGNE7u2LkrR6ampc7xNyltJNDuK+q+YGEll7m9NdTUZnHIga6uYCp9GUUBisIGkIDzI7DCDB/wPQ+ik6uwx4+u4j9ifReHeJEa16euLkZQgpPArNzDOL/64eAHWlyoEmYSTsj9WgIlecC7n2NLcOBNlJ+7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mw4q6XBgRnsKY1XYisbZ29/1x6QfAmZRONL0vS18R8c=;
 b=zEdR6Zcckh/D6hTVL9aGh9SfJlNJyEOSc9IaqQPWAe4yH3yD3sP+Ors/ntbeF+oeJUOhF7DDwci+6CofqgYdTG35Lp31V9/KZFzcWYVJ+CH8udhrezCrGU4ZZshT/870PZDJok/Q/tPIeG51jkzVdk/ncdaTVrgtU/UVCJzXcTLJonZkTY5/11X1MBIBcurvDq+xmdAvJozL7xoHTgdowccbdl5ww0h+vil40sgbV5+TKUwAmbtOIFC6rMvP46LEP77FCIz15f5FmaRHd0S8vQdIdNnh+6+92kpfUae910W7Brxi0rPz9Ngk1IO9HRIOHX/F6se2sMbf1zVL8k1JxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mw4q6XBgRnsKY1XYisbZ29/1x6QfAmZRONL0vS18R8c=;
 b=BIHUK4dWh1wDLvywfUYcd2E14HUdi7dTgR0HEPB15DmOzLIpeXqZLRGJuuatQ5/GtGB+Q92D7+bEHNee2AidC3tAxwJYRDJjUPgmdSECiWJvaeuH10MamSulNzRa8UqF9wzmLTsIUi8FgWgxaEml5SHfheUEJE34QN7r8kSzexmTTqykH7nihqGjGquMDSo1kosg7pLM+4zdvuO0y0G2rIeWjpVuijhZoiBIQ32dONrfrh7LmA2PTbwCvD2ahO0nAYgDQxcxCue8pt1kK6F3PYwYlsTMx6Tq2XreIZxfPmBXdg7HU/V35HGDWF9IZROj9PnDqMdFhONebL4ijzGFrQ==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH v3 12/23] xen/arm: vsmmuv3: Add support for event queue and
 global error
Thread-Topic: [PATCH v3 12/23] xen/arm: vsmmuv3: Add support for event queue
 and global error
Thread-Index: AQHcwLD8TbB0vBk5KkOu1RGZU75M7A==
Date: Tue, 31 Mar 2026 01:52:09 +0000
Message-ID:
 <b3c49d35b986dff560bba8a51f85fb6b4a57c0c5.1774918270.git.milan_djokic@epam.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
In-Reply-To: <cover.1774918270.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB5088:EE_|GVXPR03MB11035:EE_
x-ms-office365-filtering-correlation-id: 8bd6f12a-a087-4993-58cc-08de8ec81ef7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 hPyzN5ucbLC2tr0Krum9+yeD0UavZGVALsJ9D3E4UQnukgfWa4DZfoCFtoWiGV/0X3GDHnc3Nix6+U+YVbWxn8ewg8IpSq9LZ79QLX4ekeTgVvYDMcA5vHhqeRCuS0zaQfieygpOBrI9hjpx6R94++L4Wruz46yegNpEKbpHXA5Ogs0YgmX8Slzk0Dyv0q5JTwvC2J9zhhKW4xVOWUj6vJpvGhyxUHDKWOB0YvQLYg5XbWaSpKDTieZmd/I6Xb0B1rZge8fMq2kACbeyJgIL3chBXGhL5xIHvkzQXFcWwAOK76Q9WMS3VxZIVpr/p6p9q7zuw6GCtOQBYuOzKn/Uifq+59g/4kJfYTvburW/VKatdhqqUknr780mN2ryF5shxN0pRrk6b9bNJghLM9Yrdj6Zpk7FTN6iR6UEfdAN1mmNLjfbOs1oGZyvIxurwoJvxo8bTdDiDLpDz+M1X9ZLUluxjqEKeuNUn/aM7eFxPw4bOiVQBFpGWB4+77x70zT6AvTIPgs5w7Yu09zcY63dkNrjj11HSn7uGVgRk3lD7PKqD0ojM4/ZLOIYib3e+/o1eoZ0DMOiRsVOsTv+ZBVAvEaYi0PGuZx1akXJdY9j9pYX9LlS4XuzXp7NmCxkWmQTX31WR0NlLNYJFgDFf9D9rvmh0OzWoYHEKrk7nFPNQ51ePLu3sHxNhYaJBe4rCbdCx34eLuHrvXtdyjkurEoyuUNyuIaph6ZtDzi1jMhuzSXHlWa1eAeRDfu9MEFAC5S31+/QUgoK3Pn/7fM0qeDH8e84uv4Z+tCQQdK7Zx0J+0c=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Zy2wrI86kIjN4JGVA2L+HJfv8rW6n3gqLIDQxRFMBfgIZCDx9Mi0Q7ZgKp?=
 =?iso-8859-1?Q?PKFngzTqDtSbScCJU2zrLR/5QJZqKuj6jSTe8ajlxBftggqiLcX0f2XUtM?=
 =?iso-8859-1?Q?/6Xou2Og6r5pfWDItNiawbnCeT0N5imZyEwz9TLZJ0WP6IdOp5aeqdzZLF?=
 =?iso-8859-1?Q?on1MGGrnEJ7g4VHQ3ZFmAYp269Yz+u4fm3H/0DRwmBZ3v/yNG84PaJoV7v?=
 =?iso-8859-1?Q?GzFgNP43yFFxqoNWfgv1iRjdBXtaookjM8Ao4e7PERKEi7BU36q2kh99C6?=
 =?iso-8859-1?Q?sQLjiv3p+fYMH7OQXWnU3GC947yJ2TbcNRrdBT9R0W7wg1lMRPpZHG7BLQ?=
 =?iso-8859-1?Q?EMCII+/Q5Tr0D+Tlk/ADvmlCuQwQqeybgMbzUPi5lGgfHznS1hIgzUKwOq?=
 =?iso-8859-1?Q?dJL2X9lWc0JrntsBoVEBaTIB/6JHDr3LOQWrm0CmjYl+rPXzXAKIi3PlkK?=
 =?iso-8859-1?Q?PlsJNojgaZnvaifgGGyckgUuraUpnXI9mW4ixzjKNAL77lyvpxECGy1Oto?=
 =?iso-8859-1?Q?ioutn4krFd0HSizx/PR0B16Iwi0pxApn4sTXLFUsS+FPvATfm2lThEju/Y?=
 =?iso-8859-1?Q?4zfW1QJFd4qw9GjBtNYjlLlDzzwA5EgVQhz1eAax8xo09e2kxKG5vhs9mP?=
 =?iso-8859-1?Q?BlVFw84lPyDMDFYnddO6sM/+33SLQfjfTp1hhTks9wY/dt/Eu/uk8EZPQU?=
 =?iso-8859-1?Q?dK/UJ5LZNd622TJOruKF3y52llB7cbTVEClkgSmDPXWGdhvSkB2x6onAe/?=
 =?iso-8859-1?Q?4MzQjE8OkfJ6eYy6V8vy0a4nUqrt65tC3MmjmaDZJ4cnOgN6+M/fh/BC0n?=
 =?iso-8859-1?Q?wTosDyzIdAzucfuqCDWFzt2rpU32BACKXZSej+k8EN4wJkwpif8+cWsDkW?=
 =?iso-8859-1?Q?2YQa1SCtUiUEJMB9R09/PS5URWvxeYfUeCPefEkX0ZzOygayQFvbQCOnrt?=
 =?iso-8859-1?Q?Xp9DDvGUk0A1hdaUy+llm9azI76+2J1Ox86Of9V7LKAZjcWTNtSbR8EvrY?=
 =?iso-8859-1?Q?X8dTYFcgUCKIpotx6n8JH/wfxq8DgUKhBr9rE1tJM0MD8kJMwqYszeHD9n?=
 =?iso-8859-1?Q?awj7szAlmS2KP9xEBcWCWJEU7sCeiqti5F7BcU8NWqpGAXW8QLloYtOcQ2?=
 =?iso-8859-1?Q?EP+cNz8X89ooksGPrdRHT12hwL+3eqrSrdjFRZhRpmcc3O0UByIaQ23h5l?=
 =?iso-8859-1?Q?ueWaQfbi/bj68raSlAHF4KJf61OGfV44Y6W/xwiPqBMZbIEtds5thxWsfQ?=
 =?iso-8859-1?Q?w6MLOYD78Kx5/c3Jc97MKp5Rz1xOqRQBJqL1bm5Hl5hvOV2rEHbILg4Nik?=
 =?iso-8859-1?Q?g1n8tEIOYpbTLqKiqdmiVdJ75ghpfH3ll1eewacORM7moH/j7dptKw+mqS?=
 =?iso-8859-1?Q?7iqgLncdQRhHLtcTi0fxmj+QCUlqdMBior7aHrCky9FwIETQJYrqLHFFgv?=
 =?iso-8859-1?Q?ms28xciNrXKAuI1UK3v0050uDw8wojkC6lZHpabeloEyBAivhr2iWe6K1c?=
 =?iso-8859-1?Q?gap43gccmCIT04ysyOpaDdi3B6Pfl5yidk1e0B4g/UcNfXfxhDnBHv9PdZ?=
 =?iso-8859-1?Q?ea1U00TeicFyGUQ4mQrtyFOzMWGVgDJM8Y7vtWNUJDCwPtfZw/08hd0oY+?=
 =?iso-8859-1?Q?oOZH6vHgulC7/w2vfmhMeX6ktIHIX3Ym1Ykqu2KnRZCGBbmrQD4u+Dy/dW?=
 =?iso-8859-1?Q?Y1vQtYL+YTKKPq+qy3/3UOEaC283Yh0tMQ6f/spBPEe49xJRzjJnU8naXv?=
 =?iso-8859-1?Q?3aHk1Ipror3k//p71Od0PvsJ1TZCn/66nSOklwfd3DpghYJwx33LtC2/IB?=
 =?iso-8859-1?Q?otI8Q1w/0hrbPXvTmRlRQR9D4y5m6HA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bd6f12a-a087-4993-58cc-08de8ec81ef7
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 01:52:09.6872
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ml2WQ9m1kPeCKiBWaCxnax2XlVIgOeNLvY3G/ZGM7la+Ja5iUcDrF+IiaqERWjyndqdzGDQhhK/xoMVfT1crSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB11035
X-purgate-ID: tlsNG-d62444/1774921931-8E0F9DF3-234B7142/0/0
X-purgate-type: clean
X-purgate-size: 11088
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:dkim,epam.com:email,epam.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:milan_djokic@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4998236330D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rahul Singh <rahul.singh@arm.com>

Event queue is used to send the events to guest when there is an events/
faults. Add support for event queue to send events to guest.

Global error in SMMUv3 hw will be updated in smmu_gerror and
smmu_gerrorn register. Add support for global error registers to send
global error to guest.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/drivers/passthrough/arm/smmu-v3.h  |  20 +++
 xen/drivers/passthrough/arm/vsmmu-v3.c | 163 ++++++++++++++++++++++++-
 xen/include/public/arch-arm.h          |   5 +-
 3 files changed, 183 insertions(+), 5 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthroug=
h/arm/smmu-v3.h
index df3b7ec1b5..8d3e1877aa 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.h
+++ b/xen/drivers/passthrough/arm/smmu-v3.h
@@ -354,6 +354,26 @@
=20
 #define EVTQ_0_ID			GENMASK_ULL(7, 0)
=20
+#define EVT_ID_BAD_STREAMID		0x02
+#define EVT_ID_BAD_STE		    	0x04
+#define EVT_ID_TRANSLATION_FAULT	0x10
+#define EVT_ID_ADDR_SIZE_FAULT		0x11
+#define EVT_ID_ACCESS_FAULT		0x12
+#define EVT_ID_PERMISSION_FAULT		0x13
+
+#define EVTQ_0_SSV			(1UL << 11)
+#define EVTQ_0_SSID			GENMASK_ULL(31, 12)
+#define EVTQ_0_SID			GENMASK_ULL(63, 32)
+#define EVTQ_1_STAG			GENMASK_ULL(15, 0)
+#define EVTQ_1_STALL			(1UL << 31)
+#define EVTQ_1_PnU			(1UL << 33)
+#define EVTQ_1_InD			(1UL << 34)
+#define EVTQ_1_RnW			(1UL << 35)
+#define EVTQ_1_S2			(1UL << 39)
+#define EVTQ_1_CLASS			GENMASK_ULL(41, 40)
+#define EVTQ_1_TT_READ			(1UL << 44)
+#define EVTQ_2_ADDR			GENMASK_ULL(63, 0)
+#define EVTQ_3_IPA			GENMASK_ULL(51, 12)
 /* PRI queue */
 #define PRIQ_ENT_SZ_SHIFT		4
 #define PRIQ_ENT_DWORDS			((1 << PRIQ_ENT_SZ_SHIFT) >> 3)
diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrou=
gh/arm/vsmmu-v3.c
index 6d3636b18b..7a6c18df53 100644
--- a/xen/drivers/passthrough/arm/vsmmu-v3.c
+++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
@@ -44,6 +44,7 @@ extern const struct viommu_desc __read_mostly *cur_viommu=
;
=20
 /* Helper Macros */
 #define smmu_get_cmdq_enabled(x)    FIELD_GET(CR0_CMDQEN, x)
+#define smmu_get_evtq_enabled(x)    FIELD_GET(CR0_EVTQEN, x)
 #define smmu_cmd_get_command(x)     FIELD_GET(CMDQ_0_OP, x)
 #define smmu_cmd_get_sid(x)         FIELD_GET(CMDQ_PREFETCH_0_SID, x)
 #define smmu_get_ste_s1cdmax(x)     FIELD_GET(STRTAB_STE_0_S1CDMAX, x)
@@ -52,6 +53,35 @@ extern const struct viommu_desc __read_mostly *cur_viomm=
u;
 #define smmu_get_ste_s1ctxptr(x)    FIELD_PREP(STRTAB_STE_0_S1CTXPTR_MASK,=
 \
                                     FIELD_GET(STRTAB_STE_0_S1CTXPTR_MASK, =
x))
=20
+/* event queue entry */
+struct arm_smmu_evtq_ent {
+    /* Common fields */
+    uint8_t     opcode;
+    uint32_t    sid;
+
+    /* Event-specific fields */
+    union {
+        struct {
+            uint32_t ssid;
+            bool ssv;
+        } c_bad_ste_streamid;
+
+        struct {
+            bool stall;
+            uint16_t stag;
+            uint32_t ssid;
+            bool ssv;
+            bool s2;
+            uint64_t addr;
+            bool rnw;
+            bool pnu;
+            bool ind;
+            uint8_t class;
+            uint64_t addr2;
+        } f_translation;
+    };
+};
+
 /* stage-1 translation configuration */
 struct arm_vsmmu_s1_trans_cfg {
     paddr_t s1ctxptr;
@@ -82,6 +112,7 @@ struct virt_smmu {
     uint32_t    strtab_base_cfg;
     uint64_t    strtab_base;
     uint32_t    irq_ctrl;
+    uint32_t    virq;
     uint64_t    gerror_irq_cfg0;
     uint64_t    evtq_irq_cfg0;
     struct      arm_vsmmu_queue evtq, cmdq;
@@ -89,6 +120,12 @@ struct virt_smmu {
 };
=20
 /* Queue manipulation functions */
+static bool queue_full(struct arm_vsmmu_queue *q)
+{
+    return Q_IDX(q, q->prod) =3D=3D Q_IDX(q, q->cons) &&
+           Q_WRP(q, q->prod) !=3D Q_WRP(q, q->cons);
+}
+
 static bool queue_empty(struct arm_vsmmu_queue *q)
 {
     return Q_IDX(q, q->prod) =3D=3D Q_IDX(q, q->cons) &&
@@ -101,11 +138,105 @@ static void queue_inc_cons(struct arm_vsmmu_queue *q=
)
     q->cons =3D Q_OVF(q->cons) | Q_WRP(q, cons) | Q_IDX(q, cons);
 }
=20
+static void queue_inc_prod(struct arm_vsmmu_queue *q)
+{
+    u32 prod =3D (Q_WRP(q, q->prod) | Q_IDX(q, q->prod)) + 1;
+    q->prod =3D Q_OVF(q->prod) | Q_WRP(q, prod) | Q_IDX(q, prod);
+}
+
 static void dump_smmu_command(uint64_t *command)
 {
     gdprintk(XENLOG_ERR, "cmd 0x%02llx: %016lx %016lx\n",
              smmu_cmd_get_command(command[0]), command[0], command[1]);
 }
+
+static void arm_vsmmu_inject_irq(struct virt_smmu *smmu, bool is_gerror,
+                                uint32_t gerror_err)
+{
+    uint32_t new_gerrors, pending;
+
+    if ( is_gerror )
+    {
+        /* trigger global error irq to guest */
+        pending =3D smmu->gerror ^ smmu->gerrorn;
+        new_gerrors =3D ~pending & gerror_err;
+
+        /* only toggle non pending errors */
+        if (!new_gerrors)
+            return;
+
+        smmu->gerror ^=3D new_gerrors;
+    }
+
+    vgic_inject_irq(smmu->d, NULL, smmu->virq, true);
+}
+
+static int arm_vsmmu_write_evtq(struct virt_smmu *smmu, uint64_t *evt)
+{
+    struct arm_vsmmu_queue *q =3D &smmu->evtq;
+    struct domain *d =3D smmu->d;
+    paddr_t addr;
+    int ret;
+
+    if ( !smmu_get_evtq_enabled(smmu->cr[0]) )
+        return -EINVAL;
+
+    if ( queue_full(q) )
+        return -EINVAL;
+
+    addr =3D Q_PROD_ENT(q);
+    ret =3D access_guest_memory_by_gpa(d, addr, evt,
+                                     sizeof(*evt) * EVTQ_ENT_DWORDS, true)=
;
+    if ( ret )
+        return ret;
+
+    queue_inc_prod(q);
+
+    /* trigger eventq irq to guest */
+    if ( !queue_empty(q) )
+        arm_vsmmu_inject_irq(smmu, false, 0);
+
+    return 0;
+}
+
+void arm_vsmmu_send_event(struct virt_smmu *smmu,
+                          struct arm_smmu_evtq_ent *ent)
+{
+    uint64_t evt[EVTQ_ENT_DWORDS];
+    int ret;
+
+    memset(evt, 0, 1 << EVTQ_ENT_SZ_SHIFT);
+
+    if ( !smmu_get_evtq_enabled(smmu->cr[0]) )
+        return;
+
+    evt[0] |=3D FIELD_PREP(EVTQ_0_ID, ent->opcode);
+    evt[0] |=3D FIELD_PREP(EVTQ_0_SID, ent->sid);
+
+    switch (ent->opcode)
+    {
+    case EVT_ID_BAD_STREAMID:
+    case EVT_ID_BAD_STE:
+        evt[0] |=3D FIELD_PREP(EVTQ_0_SSID, ent->c_bad_ste_streamid.ssid);
+        evt[0] |=3D FIELD_PREP(EVTQ_0_SSV, ent->c_bad_ste_streamid.ssv);
+        break;
+    case EVT_ID_TRANSLATION_FAULT:
+    case EVT_ID_ADDR_SIZE_FAULT:
+    case EVT_ID_ACCESS_FAULT:
+    case EVT_ID_PERMISSION_FAULT:
+        break;
+    default:
+        gdprintk(XENLOG_WARNING, "vSMMUv3: event opcode is bad\n");
+        break;
+    }
+
+    ret =3D arm_vsmmu_write_evtq(smmu, evt);
+    if ( ret )
+        arm_vsmmu_inject_irq(smmu, true, GERROR_EVTQ_ABT_ERR);
+
+    return;
+}
+
 static int arm_vsmmu_find_ste(struct virt_smmu *smmu, uint32_t sid,
                               uint64_t *ste)
 {
@@ -114,11 +245,22 @@ static int arm_vsmmu_find_ste(struct virt_smmu *smmu,=
 uint32_t sid,
     uint32_t log2size;
     int strtab_size_shift;
     int ret;
+    struct arm_smmu_evtq_ent ent =3D {
+        .sid =3D sid,
+        .c_bad_ste_streamid =3D {
+            .ssid =3D 0,
+            .ssv =3D false,
+        },
+    };
=20
     log2size =3D FIELD_GET(STRTAB_BASE_CFG_LOG2SIZE, smmu->strtab_base_cfg=
);
=20
     if ( sid >=3D (1 << MIN(log2size, SMMU_IDR1_SIDSIZE)) )
+    {
+        ent.opcode =3D EVT_ID_BAD_STE;
+        arm_vsmmu_send_event(smmu, &ent);
         return -EINVAL;
+    }
=20
     if ( smmu->features & STRTAB_BASE_CFG_FMT_2LVL )
     {
@@ -156,6 +298,8 @@ static int arm_vsmmu_find_ste(struct virt_smmu *smmu, u=
int32_t sid,
         {
             gdprintk(XENLOG_ERR, "idx=3D%d > max_l2_ste=3D%d\n",
                      idx, max_l2_ste);
+            ent.opcode =3D EVT_ID_BAD_STREAMID;
+            arm_vsmmu_send_event(smmu, &ent);
             return -EINVAL;
         }
         addr =3D l2ptr + idx * sizeof(*ste) * STRTAB_STE_DWORDS;
@@ -183,6 +327,14 @@ static int arm_vsmmu_decode_ste(struct virt_smmu *smmu=
, uint32_t sid,
                                 uint64_t *ste)
 {
     uint64_t val =3D ste[0];
+    struct arm_smmu_evtq_ent ent =3D {
+        .opcode =3D EVT_ID_BAD_STE,
+        .sid =3D sid,
+        .c_bad_ste_streamid =3D {
+            .ssid =3D 0,
+            .ssv =3D false,
+        },
+    };
=20
     if ( !(val & STRTAB_STE_0_V) )
         return -EAGAIN;
@@ -217,6 +369,7 @@ static int arm_vsmmu_decode_ste(struct virt_smmu *smmu,=
 uint32_t sid,
     return 0;
=20
 bad_ste:
+    arm_vsmmu_send_event(smmu, &ent);
     return -EINVAL;
 }
=20
@@ -577,7 +730,8 @@ static const struct mmio_handler_ops vsmmuv3_mmio_handl=
er =3D {
     .write =3D vsmmuv3_mmio_write,
 };
=20
-static int vsmmuv3_init_single(struct domain *d, paddr_t addr, paddr_t siz=
e)
+static int vsmmuv3_init_single(struct domain *d, paddr_t addr,
+                               paddr_t size, uint32_t virq)
 {
     struct virt_smmu *smmu;
=20
@@ -586,6 +740,7 @@ static int vsmmuv3_init_single(struct domain *d, paddr_=
t addr, paddr_t size)
         return -ENOMEM;
=20
     smmu->d =3D d;
+    smmu->virq =3D virq;
     smmu->cmdq.q_base =3D FIELD_PREP(Q_BASE_LOG2SIZE, SMMU_CMDQS);
     smmu->cmdq.ent_size =3D CMDQ_ENT_DWORDS * DWORDS_BYTES;
     smmu->evtq.q_base =3D FIELD_PREP(Q_BASE_LOG2SIZE, SMMU_EVTQS);
@@ -612,14 +767,16 @@ int domain_vsmmuv3_init(struct domain *d)
=20
         list_for_each_entry(hw_iommu, &host_iommu_list, entry)
         {
-            ret =3D vsmmuv3_init_single(d, hw_iommu->addr, hw_iommu->size)=
;
+            ret =3D vsmmuv3_init_single(d, hw_iommu->addr, hw_iommu->size,
+                                      hw_iommu->irq);
             if ( ret )
                 return ret;
         }
     }
     else
     {
-        ret =3D vsmmuv3_init_single(d, GUEST_VSMMUV3_BASE, GUEST_VSMMUV3_S=
IZE);
+        ret =3D vsmmuv3_init_single(d, GUEST_VSMMUV3_BASE, GUEST_VSMMUV3_S=
IZE,
+                                  GUEST_VSMMU_SPI);
         if ( ret )
             return ret;
     }
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index ebac02ed63..1b606e20fd 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -527,9 +527,10 @@ typedef uint64_t xen_callback_t;
 #define GUEST_EVTCHN_PPI        31
=20
 #define GUEST_VPL011_SPI        32
+#define GUEST_VSMMU_SPI         33
=20
-#define GUEST_VIRTIO_MMIO_SPI_FIRST   33
-#define GUEST_VIRTIO_MMIO_SPI_LAST    43
+#define GUEST_VIRTIO_MMIO_SPI_FIRST   34
+#define GUEST_VIRTIO_MMIO_SPI_LAST    44
=20
 /*
  * SGI is the preferred delivery mechanism of FF-A pending notifications o=
r
--=20
2.43.0

