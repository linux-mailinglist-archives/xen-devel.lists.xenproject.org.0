Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B30A6D6D2
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 10:01:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925101.1327972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twdfL-0005dI-W6; Mon, 24 Mar 2025 09:00:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925101.1327972; Mon, 24 Mar 2025 09:00:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twdfL-0005at-Sq; Mon, 24 Mar 2025 09:00:15 +0000
Received: by outflank-mailman (input) for mailman id 925101;
 Mon, 24 Mar 2025 09:00:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dvQq=WL=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1twdfL-0005am-43
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 09:00:15 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20608.outbound.protection.outlook.com
 [2a01:111:f403:2608::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 647512d6-088e-11f0-9ffa-bf95429c2676;
 Mon, 24 Mar 2025 10:00:11 +0100 (CET)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by AS8PR03MB6856.eurprd03.prod.outlook.com (2603:10a6:20b:29f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 09:00:09 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%6]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 09:00:09 +0000
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
X-Inumbo-ID: 647512d6-088e-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nKJxHA7DYR4chjUsDiF+wCovfCntSH2tsVnYbjlzcBKEtZMxBEspRxK9PRfkUhl4xgf1V6Fg/yE+75K+61qs1ltaQeaQOkg4CIDx8v+s6bn8UjlMloAyuWREEOVZivs9f1h1w+kigta/WubBcdJW7H5Lx1EgPGet112u9J9bh3E97EEY+uUiT9a6Ub/cdHCh1bNfj4Z9ePD4vQJl9BMXQqYkzwMf+Vkje6tETMuoHLL1MLmjxdpED962EJyWZz+VbrFfFDkACX1GrpnI+18aelIAj9fKJXjPDQd2WqPlrCN8gjv4XBuqPDLwNWbFt6X61NjKEGyLYNCuI+f97ClWdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=80stQLBiN5QiJJ0lXbBVgPSxMFkYOSWVxy9NS7XJBwg=;
 b=IKE7KMVA1Yc/Bb55Ipz6x8brOj4RXOQ8k93vcCScsnx7x5nl+yMZU45oinddW8UEQdPPrA0zUdNqFXPwmXBd71+VfMMcjo0Yz04+IAXHBP5MDMqP3T1FWBX8Pq2Xzoj39MRFQuyfskTDMxIvIlpNzixY3uOlTAM5sL6HuuBd3VoNdLB2Yh5hEj2YjwQZ4WS0w6vUhltCE6Z47P7msEg7xy4RlLyRLl1u6oVObTJ8kjEBaHGoU67EokKn0s66B225MvGNVmd0EjdWiMdQ25RqG/09jaGYN88cg2Daq5xSa5nr19pkrBVs2/C72s0FZ+XCIycafVOS6QqAa89f9WnIBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80stQLBiN5QiJJ0lXbBVgPSxMFkYOSWVxy9NS7XJBwg=;
 b=qQnpzK/znW7/2lQobdk1BUGmy9qwxuU4N+iGhpX15RuG0dToWpOQOnf8iE401YAjlvQ3A6owPoPyCWL/hXk9ho9dw3DTrJu78Q+8vnrpDxzlXQ+0MmBqpzfPgweGLpLVCip8Rdzifnwg8i+Zz2847FwRCYJKZhWwNdk2Em//6NGyeKluseogXvL7qKTazYGTv38ttbHD3wYUkk6oGXfARe9HAnNIkjyQUpjLJVpmYzqtAPzxm2HIOyc96yXmZP+cMU9njmeVe9SRzC8GuPDH4ZDG5bcCyqk0tT4QP/6SZpae7x3d7QLPX0MGFLmqST4+tOKalhgiHOn0sWFgfRXQgw==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Jan Beulich <jbeulich@suse.com>, Grygorii Strashko
	<gragst.linux@gmail.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Michal Orzel
	<michal.orzel@amd.com>, Roger Pau Monne <roger.pau@citrix.com>, Anthony
 PERARD <anthony.perard@vates.tech>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Juergen Gross <jgross@suse.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH v3 1/7] xen/arm: add generic SCI subsystem
Thread-Topic: [RFC PATCH v3 1/7] xen/arm: add generic SCI subsystem
Thread-Index: AQHbkncOeD3VtJHazEm60TGwzYlR9LNt0I6AgBRAzAA=
Date: Mon, 24 Mar 2025 09:00:09 +0000
Message-ID: <5190f71c-4a93-4f66-91d0-aec43a97ddab@epam.com>
References: <20250311111618.1850927-1-grygorii_strashko@epam.com>
 <20250311111618.1850927-2-grygorii_strashko@epam.com>
 <6a0a3b3d-9bbd-49da-a37c-eb1cbad94cc1@suse.com>
In-Reply-To: <6a0a3b3d-9bbd-49da-a37c-eb1cbad94cc1@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|AS8PR03MB6856:EE_
x-ms-office365-filtering-correlation-id: 229dbfb0-2786-4c47-c923-08dd6ab247a9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?b25ydmE4TkdER2dPZjdoRXdQb293L2JYbE5lOGpOMDBwUVYvWm96QXozRE9k?=
 =?utf-8?B?U2JKVCtqZ1g3Mk00VEpUNUxnb1NnOHFBUlZyV1lvNE1qUXlsRXZEVk5XOEtr?=
 =?utf-8?B?YVJZbXpVZ0xiVlA5cGJhOVRxaG56OXZDWXpHRWl3SmlkLytVeEIzbmcyNjIx?=
 =?utf-8?B?TjhZTEVWd0RSMHovWE41cll1dWpoNENieUF6cVBqSGhIUGhOMStsTG4vQUpL?=
 =?utf-8?B?WGVzb3hqV1d2UFh3WlFMY2NMeDc1dlNPWC82ZE82dmtIUWttT2s2OGtrS29P?=
 =?utf-8?B?RmRKSFdHYmEraEp5S1gzZGFHeHNmSW1Rc3VtaGxvTm02MStxUGljWVRaZlZl?=
 =?utf-8?B?eFpDSGwyYkREa3ZJcUFiQnNsMGJTeTlHNWhoZ2pKWjJORVB0c1BMYk8wQmlp?=
 =?utf-8?B?YUd3Qk1xMG0yR0J1UUpoV0toSFlLd2ppZ05PSm9CR0tzeFF0d3dtYitTVEZH?=
 =?utf-8?B?dDY1ZkRqT0R4a0hXVWJnbUdYNFNySXRTVkdHQml6ZFI5bmpoZUN0RWZjR2NC?=
 =?utf-8?B?cVVDMm9aQkx0Y2JOOTBxV0RPL1pqcGtPcDRsRmtoLzl4cjRvazJoUUM1YzIy?=
 =?utf-8?B?V1dCeC91ZEhTaEdUMnNjMmtndUNQdGh6aHY2dCtJMkxITDNKNXBya1I5V2ht?=
 =?utf-8?B?VVBBS3ROWDJjSWNuRGUyQ0JOaklNL3YxcGNxYlFmMDZ0MGtzblg5YUVOZDBz?=
 =?utf-8?B?dzh6WDZPKzQ3SXVWU1U4ampYNXEvS05lOGxtem5ubkJQVWFDckt5cGJsRDVk?=
 =?utf-8?B?R216Q1d4WWs1dDNaRnJGckI2dFVKVU1tNk1PQmp1QzBQV1NCZmZYTzdzS1h4?=
 =?utf-8?B?aEUrOTUwajdGcWhRMFgxdlFpMHNqTEE2TC9UUll5TkRIbHI2a3ZPWEZXTEda?=
 =?utf-8?B?ajR6Mld2Vm82VE1QemZNRE5MbmM0a2w0K21xdEF2SG1nWkEwNmlBbXlFRk56?=
 =?utf-8?B?d0hjamQ4QWpvcHQ1eTJwVEIrUGtoTDRnTGZCUzQvWGZReGNWODVCZFppcW9E?=
 =?utf-8?B?V0UvYnhvSVljTUdYK08rWmxDM0tPMmR6T2w5RWZrcjAyck9mR1dPdDk3cE1n?=
 =?utf-8?B?NGRsM3dBVXM4eEEvR1JWODBrY3BqT2RQNm9LV1AxZStpby9vMGpTOXh5Ym5o?=
 =?utf-8?B?eGc2WitHMHVNck5NZXpXWjZMSXNhTCtNNGtWNHN5T2RhQTFBTGJZMWN0TlIr?=
 =?utf-8?B?Rmg4ZzJEenV6L2Fqa2dLWlJFc1dWbjhsQmdZV2VzUHlkQzE2VWxQa1hOelZP?=
 =?utf-8?B?bDNONlcxWGF4NEw0UDFSOVpTOGpWWVlENVNvYldncmt1clZLSDhibHI4WEJt?=
 =?utf-8?B?Q1R5NWl0MCtaK00rT2x2ZkRmdVlTalBFQlZ1eXgrK2hRUUdwZVc1Um5qdVVV?=
 =?utf-8?B?dUlFd0dLNE40U1ppNmVHbkVWSmlEQ3pTWE9DK2NOWk5UMTB6bzJZNzZHTlBM?=
 =?utf-8?B?VHJtTW1VZmdGVGVKTDJjM2lwaW5nVUQ5bk9Qa3FrOGRaUE9jUmFMalEvc1kv?=
 =?utf-8?B?V1JBMFhvN2FmRW1FM2tIWVc4bVBQMTV0UnJJbHJLZ2RueXQyRklWbWdNRkM0?=
 =?utf-8?B?Mm10WFBtK3FyK2VqTTdxbGZ5S3A2bHRyMkdRNHRTWHFpRDI2d1JsU011TkFi?=
 =?utf-8?B?b2NHems5Ung5aytDekw1TTlMakNpbnhtVFVnMFhZMzFYcnBpb0xDc3A3T09R?=
 =?utf-8?B?b3RheFp3NjNIaXpKKzcybmtNN0F2K3NnUTFWbnpScFVOdDlWbmkwZnoxcHNM?=
 =?utf-8?B?Z0NuaUVDUnNRSnh2cGJPVEVBaE9kMm5QVmVoaGt2aGdJYVlaN3pUWVBaVW4w?=
 =?utf-8?B?OEI2bkJlS0Y4WjRCZ1EwaXowODNDYmJhdG1kMFRGVXo0Wk9qelROOUxrMU5j?=
 =?utf-8?B?ZmdBZU5idkRPamo2VDgwM1hUMHo5cndWajZ1Zzgycy9FaW0wSDFpalBzcWhy?=
 =?utf-8?Q?EnKAz7LdbW9UT+HabripiPwBHUlL9cRb?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MTRwZmVXK2VIbmtuUW1XUlBYT2I4eWczV3dEMmJWUWZIZnYyRHo0Z3ovdk94?=
 =?utf-8?B?MzRLNjZDZk1BMzNCSzRacDVwazdsbWcvSlF2ODQwcW96VUgzdnNndG9mQ0sy?=
 =?utf-8?B?MFQ2bjhrcm9Ba055TjdoVldCcFB2WWZoc2RmMGhtZ2pCanJERlBqM2V4OE84?=
 =?utf-8?B?U3hQWC9GTDV0S3J1VnJsN1hhUFR2dmIzRzk4MzhDdXdOdk05NmdybUV0WXZK?=
 =?utf-8?B?czNpNmVBR01wdWcwN0p0T2gwL0VOWFk1MWpBN2xSbXV4OHBCYndrZURTc0ZT?=
 =?utf-8?B?VnZ2NDU3NHhCQjA5M0h5RllWUWFuaithcTYxQnVMSTEwV1g5SDIrc21DQUtY?=
 =?utf-8?B?ZElBMlNRQkNhOXJPaTlIMUc3amhBUzlId0REajNPRi95MURPenlIaXZqdlRK?=
 =?utf-8?B?Qk84bEx1WmJOcXpWV3UraDBzSHFxbHhhMDNRR1BQSXErcm5Ib2xaMTFNMGwv?=
 =?utf-8?B?cHY2SktwaUdESDEzNnNIcGlKTjV6eElYQ0JSbFJNWXdUdEJURGZHNnhSS2V4?=
 =?utf-8?B?dU92bEdoYlFFbUx2djIva1lVOHZPQS9ZMWtDYUx6Zno2bk9sT3R4QTRXVGk1?=
 =?utf-8?B?UTZVQzhMcmNCSytOUGtMVUFKUVNhN1pBNGxjYjl6YkhFZU1BQng5bEZ2L2VQ?=
 =?utf-8?B?bEVXay9oRnN4eG50YkFmckM2OWp2bFU2b2k5OTY2OW42UHlXR3IxRkowbjJN?=
 =?utf-8?B?OTZOYUgrZVNZZG5zYTBBQm5QZ2RVYmRZZVFwK3VLZElxbzRkaFNYYWMwWThP?=
 =?utf-8?B?VjUxb1NpM1d5OTUraHhSQnN6Y0Z5Ykl0aXZaKzl5YXVUdVQ4bVJJV0c1a1Ay?=
 =?utf-8?B?WW1xSkR0SlpTZE5HeHhPMG1ZV2ZZNUcxbFUwNkk4eS96RExmUythbXp0ZTQv?=
 =?utf-8?B?Zkk1dUwzdEhBbDRDOVo0d1pnTWcxUUhIS3dWaVBlRW9JTHgvdTVhMFB5blAx?=
 =?utf-8?B?RDBNMHpvODUwajE3QkIyNWg2WmpCVmE0a3VlV3lZMGFkdEVYNG1aalVXbHFQ?=
 =?utf-8?B?eVhlaWR6M2lkWndvTTBaYW8ydFdRWXFMU0VuK2VQQkRCOGNKZThndU0vV0tV?=
 =?utf-8?B?bk1QYjQzdGdzNjRUaEpIZ282d2ZabXNJVlFaT3hoU3BrT3ZvQjU4SjcxWkw1?=
 =?utf-8?B?NHZmWDBMamxNdjdWMHgxTDZxYWE1RnpCK2lFdWJpUjNYamxiVmhUTzBmZUli?=
 =?utf-8?B?UCtxQ2Q1am5YOWVicnlTblROYUdXUzJ5V2dodXRQSzVPTElacVZMbS9lTU16?=
 =?utf-8?B?N05pZDZmTGFwa1hSSXc1NXRBKzJaZGo4ZytRZldyZ2xoSkwzZGlxOFhMZFVo?=
 =?utf-8?B?ZUZhTjhBWmdMQWdNbk4xbmxjcnF0SzhrR1F2M2lycWlDdEtFdzNwa1hWcThQ?=
 =?utf-8?B?bFR2NGUxdTdidzNUMzZyRlkrNm9XNVhIbWkwWnc2cGwvdG56dmlYZnRJZERU?=
 =?utf-8?B?TFJ3S0JQcng4SCs3M3ZkdFBsSGE5VzJCcEZXcUl3OWJCNmVFbE80MzYrWm9M?=
 =?utf-8?B?cjdtdFJuQmJhb2ZxYmhXNjN3R0dqZkF5eFhZUkJDVHZDcWsxK2dkY3ZtaGJG?=
 =?utf-8?B?cE1RbWVCTnBZc0pWbkRBRk00ZklvTVdMb2g3V2tGM3VkdTZaaWNqU3NGa2Q3?=
 =?utf-8?B?bjM0N01TS3RPRUJ6OFBOaktJRXlFZ1lKbkE2S0w2U3Jqby9DQjFzS2R4d1BW?=
 =?utf-8?B?SmRDUzdoWmtVbXhleFphTmROZ2hsbUE2YmtuSjMvOXNxU21MeUN3UDArT1dG?=
 =?utf-8?B?VTRtY3pKQUNKUXJTOWRlNzYrUytrY1lqS3g4TG9PNnRTdUtseUZBKy9WRytq?=
 =?utf-8?B?SXJKcWJMa0VIaTFwSWxwQUVqR3Znajhha2FZV3ZmZlA5TSszSjVwQys2SzBH?=
 =?utf-8?B?emp6cXI3SUhFL2VKRDY4aG5tYktRSXBWSi9YMjA5dUxGNCtlOXJMUGROdDdI?=
 =?utf-8?B?d2IzMjFKUytkb1EwTFR5WDZldmYzQUFQZjlDRFpiNWNudXJVOHM0Ly9ISlBt?=
 =?utf-8?B?emRNZktNN1R1K290Um4yZmh3UTd2UlNrWFNEajdpOGhsWUZEYWpiajJ3NFNh?=
 =?utf-8?B?K1dscnFnR283aDhDUVJTck9qaGEzVk1MSHU3S1N6THpwcGNmMUo0U1JiaEl4?=
 =?utf-8?B?OHJlaXByZXRlcU9uWk5rclI5bmpCc3psMUhvcHpTaEw3L1J4elgrU0JmWXhN?=
 =?utf-8?B?Y1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <26C482B051FAAC4FBE061E970D46E1CB@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 229dbfb0-2786-4c47-c923-08dd6ab247a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2025 09:00:09.5049
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QvsgdCG3NcDLAoQm/gyeFSc/NMoQLx0UDcB4KE7oi1Yfg5dHPmlz8t7NIAb5+Rq+bKVfOwaHuryQL6jy9hpp2yHtaHUI7QKkIoUoWHRvIgE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6856

SGkgSmFuLA0KDQpMZXQgbWUgYW5zd2VyIG9uZSBvZiB5b3VyIGNvbW1lbnQuIFBsZWFzZSBzZWUg
YmVsb3c6DQoNCk9uIDExLzAzLzIwMjUgMTM6NDMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAx
MS4wMy4yMDI1IDEyOjE2LCBHcnlnb3JpaSBTdHJhc2hrbyB3cm90ZToNCj4+IC0tLSBhL01BSU5U
QUlORVJTDQo+PiArKysgYi9NQUlOVEFJTkVSUw0KPj4gQEAgLTUyNiw2ICs1MjYsMTIgQEAgUzoJ
U3VwcG9ydGVkDQo+PiAgIEY6CXhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS90ZWUvDQpbc25pcF0N
Cj4+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLWFybS5oDQo+PiArKysgYi94ZW4vaW5j
bHVkZS9wdWJsaWMvYXJjaC1hcm0uaA0KPj4gQEAgLTMyNyw2ICszMjcsOCBAQCBERUZJTkVfWEVO
X0dVRVNUX0hBTkRMRSh2Y3B1X2d1ZXN0X2NvbnRleHRfdCk7DQo+PiAgICNkZWZpbmUgWEVOX0RP
TUNUTF9DT05GSUdfVEVFX09QVEVFICAgICAxDQo+PiAgICNkZWZpbmUgWEVOX0RPTUNUTF9DT05G
SUdfVEVFX0ZGQSAgICAgICAyDQo+PiAgIA0KPj4gKyNkZWZpbmUgWEVOX0RPTUNUTF9DT05GSUdf
QVJNX1NDSV9OT05FICAgICAgMA0KPj4gKw0KPj4gICBzdHJ1Y3QgeGVuX2FyY2hfZG9tYWluY29u
ZmlnIHsNCj4+ICAgICAgIC8qIElOL09VVCAqLw0KPj4gICAgICAgdWludDhfdCBnaWNfdmVyc2lv
bjsNCj4+IEBAIC0zNTAsNiArMzUyLDggQEAgc3RydWN0IHhlbl9hcmNoX2RvbWFpbmNvbmZpZyB7
DQo+PiAgICAgICAgKg0KPj4gICAgICAgICovDQo+PiAgICAgICB1aW50MzJfdCBjbG9ja19mcmVx
dWVuY3k7DQo+PiArICAgIC8qIElOICovDQo+PiArICAgIHVpbnQ4X3QgYXJtX3NjaV90eXBlOw0K
Pj4gICB9Ow0KPiBZb3UncmUgbm90IHJlLXVzaW5nIGEgcHJlLWV4aXN0aW5nIHBhZGRpbmcgZmll
bGQsIHNvIEkgZG9uJ3Qgc2VlIGhvdyB5b3UNCj4gY2FuIGdldCBhd2F5IHdpdGhvdXQgYnVtcGlu
ZyBYRU5fRE9NQ1RMX0lOVEVSRkFDRV9WRVJTSU9OLg0KPg0KPiBKYW4NCg0KDQpXZSBhcmUgcmV1
c2luZyBhbiBleGlzdGluZyBwYWRkaW5nIGZpZWxkIGluIHhlbl9kb21jdGwsIHdoaWNoIGlzIGRl
ZmluZWQgDQphcyBwYWRbMTI4XS4NCg0KVGhlIHhlbl9hcmNoX2RvbWFpbmNvbmZpZyBzdHJ1Y3R1
cmUgaXMgYSBwYXJ0IG9mIHRoZSBmb2xsb3dpbmcgZG9tY3RsIA0Kc3RydWN0dXJlczoNCg0KLSB4
ZW5fZG9tY3RsX2NyZWF0ZWRvbWFpbg0KDQotIHhlbl9kb21jdGxfZ2V0ZG9tYWluaW5mbw0KDQpU
aGVzZSBzdHJ1Y3R1cmVzIGFyZSBpbmNsdWRlZCBpbiB0aGUgdW5pb24gd2l0aGluIHhlbl9kb21j
dGwsIHdoaWNoIA0KZGVmaW5lcyBwYWRbMTI4XSBmb3IgcGFkZGluZy4NCg0KSW4gdGhlIGZvbGxv
d2luZyBleGFtcGxlLCBJIHVzZWQgdGhlIHBhaG9sZSB0b29sIHRvIGluc3BlY3QgdGhlIGN1cnJl
bnQgDQpzdHJ1Y3R1cmUgc2l6ZXMgZm9yIHRoZQ0KDQp4ZW5fZG9tY3RsIHN0cnVjdHVyZToNCg0K
ID4gcGFob2xlIHhlbi1zeW1zIC1DIHhlbl9kb21jdGwNCg0KVGhlIHJlc3VsdCBpcyBhcyBmb2xs
b3dzOg0KDQogwqDCoMKgIHN0cnVjdCB4ZW5fZG9tY3RsIHsNCiDCoMKgwqAgwqDCoCDCoCDCoMKg
IHVpbnQzMl90wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNtZDsgLyrCoMKg
wqDCoCAwwqDCoMKgwqAgNCAqLw0KIMKgwqDCoMKgwqDCoMKgIMKgwqDCoCB1aW50MzJfdMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbnRlcmZhY2VfdmVyc2lvbjsgLyrCoMKg
wqDCoCA0wqDCoMKgwqAgDQo0ICovDQogwqDCoMKgwqDCoMKgwqAgwqDCoMKgIGRvbWlkX3TCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkb21haW47IC8qwqDCoMKgwqAgOMKg
wqDCoMKgIDIgKi8NCiDCoMKgwqDCoMKgwqDCoCDCoMKgwqAgdWludDE2X3TCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX3BhZFszXTvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAvKiAxMMKgwqDCoMKgIA0KNiAqLw0KIMKgwqDCoMKgwqDCoMKgIMKgwqDCoCB1bmlvbiB7DQog
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDCoMKgIMKgIMKgwqAgc3RydWN0IHhlbl9kb21jdGxfY3Jl
YXRlZG9tYWluIGNyZWF0ZWRvbWFpbjsgLyrCoMKgwqAgDQoxNsKgwqDCoCA3NiAqLw0KIMKgwqAg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHhlbl9kb21jdGxfZ2V0ZG9t
YWluaW5mbyBnZXRkb21haW5pbmZvIA0KX19hdHRyaWJ1dGVfXygoX19hbGlnbmVkX18oOCkpKTsg
LyrCoMKgwqAgMTbCoMKgIDEyMCAqLw0KIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKg
wqAgLi4uDQoNCiDCoMKgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1aW50OF90wqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBwYWRbMTI4XTvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyog
MTbCoMKgIDEyOCAqLw0KDQogwqDCoMKgIMKgwqDCoCDCoMKgwqAgfTsNCg0KQm90aCBzdHJ1Y3R1
cmVzLCB4ZW5fZG9tY3RsX2NyZWF0ZWRvbWFpbiBhbmQgeGVuX2RvbWN0bF9nZXRkb21haW5pbmZv
LCANCmRvIG5vdCBleGNlZWQgdGhlIHNpemUgb2YgdGhlIDEyOC1ieXRlIHBhZGRpbmcuDQoNCldC
UiwNCg0KT2xla3NpaS4NCg==

