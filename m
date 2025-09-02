Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBB8B40EED
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 22:55:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107528.1457930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utY2A-0004Uw-06; Tue, 02 Sep 2025 20:55:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107528.1457930; Tue, 02 Sep 2025 20:55:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utY29-0004SP-Sd; Tue, 02 Sep 2025 20:55:17 +0000
Received: by outflank-mailman (input) for mailman id 1107528;
 Tue, 02 Sep 2025 20:55:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V/Ey=3N=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1utY29-0004SJ-5N
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 20:55:17 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 207b55f1-883f-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 22:55:15 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by DU6PR03MB10942.eurprd03.prod.outlook.com (2603:10a6:10:5c3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 20:55:12 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 20:55:12 +0000
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
X-Inumbo-ID: 207b55f1-883f-11f0-8adc-4578a1afcccb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QpHKkXgRsCMc5+wubH/XlB2kLZKR7dURo9nMjLmrSrK0G7mGIT2kPa+K19ZbDVlIUsqSVuwpzCQ2KhAgEJCIite8imTVkLeVcwdRVeQjZmXQxmf273bomevTYceJb//NhcU2AW0XeLTwJZlZDoOI6Ec/D1lHwW9tt+U2DECCVp6tsunrGr8v2t5+8ofgqQ3xx0VhF5S2pOz2413Vkve1Vvvc3uXC2WeOlkFjaI93TdUbc4UJakKcxBbE+m93H5Buab0ov9fDKscUDTqsTxTbPeLD8OCgN1htUEyuoEYLCS8+/czC24V/XywVF+6brScLN2n0GH2VKmqP9gGK/Wb9Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bN/MR7wiZDcyYcAlpQvmaGF4GxqF1x0A4lpNK/Q18eo=;
 b=Ir+BXWP8emf0NlsOLkLfysznOoZB2CNUD8mLhWb1C/tn44lB/QAydUaKurEjBjmQvImhSnWBRhV0Shbm3lNE0yTPew4zn3b3B7KNqX8YwKiCmuOnwV3BctLbc1WObOpn9TyRhpgAf7VrXMEnavSb/xQ1jsUCR2EN9gkZnLinb6yTGvvWmOSa8Gb7TH9zp3dkLGIa/6B1x1ZA9x2OcNEdw9m0SlccG+1rNE5EBFh38kvYJtOriN860cAZE6Ok93HbBzM9PUcrybS5+iL7WRHC3H/8ub3YCkY4qu28L2QPERbe8KpWjG/IFGqBTYAY0QiIeImLD1qQoxZr/D1JDYNNkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bN/MR7wiZDcyYcAlpQvmaGF4GxqF1x0A4lpNK/Q18eo=;
 b=s6lvxEdg6N2aqTY3NcAd0nHjDXolppYMeZxfFF9elQth8ycWeBsZYzcE1w9gXrtM4obZ87DUsFHeHnSsq/AbVxitv5IPlO5J2Vs8rIzvqPJIRMn+y58Psl6XrL0rKMItWoRZR2YYSyZznLGdNxkbUWcYdqOKO6OkEyEyW8DhhSztbOZWIO+LtSzTmW5OwnBRRgrsAcUnqJKnFE+anh9reSvPdxTMVPy7ASEzNI/hU5kIIWpN+7elm7yMGBR9liJ9qDEGLa3f9Ib07H/s8slJNlqbdwTXpEuTnMbIl0VXYK53dAHoqf1kSalBnxhOEbmpepA3M1unwsIt9T1zieOV1A==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 10/12] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI
 registers
Thread-Topic: [PATCH v5 10/12] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI
 registers
Thread-Index: AQHcGP7lSnKp01vKiUyg8GCh+goOA7SAIt4AgAAIk4CAADCcAIAACbGA
Date: Tue, 2 Sep 2025 20:55:12 +0000
Message-ID: <9d784bea-7ae8-4b0d-aa54-155dccd3f533@epam.com>
References: <cover.1756481577.git.leonid_komarianskyi@epam.com>
 <6fda233a1a2f0362062ff9a6e80ee223d33815cf.1756481577.git.leonid_komarianskyi@epam.com>
 <06ff285f-39d5-4ffd-b842-6d776bb793ac@xen.org>
 <a10ae626-126d-4afc-acce-1e699a9d68e2@epam.com>
 <fac231ba-3d79-4eaa-9a23-4ae7aebc62f3@xen.org>
In-Reply-To: <fac231ba-3d79-4eaa-9a23-4ae7aebc62f3@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|DU6PR03MB10942:EE_
x-ms-office365-filtering-correlation-id: 1623fd42-b581-4d7f-944f-08ddea630282
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cEFSeEpvaklQTU9FblBHZnN6WUxEZTVUWXVRZzU3MFV5OWI4ZFhXaXNYSVlH?=
 =?utf-8?B?VC9pMDR2VFJ2bjAwcHlSeGwyQXJvQkxuckd6RFc5N2dYT0tDQit4R2FSSTlP?=
 =?utf-8?B?VWJrY0RLeFJaV2M1cnU5dTFoWmlYSlYzS3FSVmpZMG90MUFaVWlDS0wyeXpz?=
 =?utf-8?B?aU1hL2hJdFhJU3FaUlBBRzNmS1AyQVRBZG1PRVNLc3ZRcmdmVHY4SUt2TGF1?=
 =?utf-8?B?ZnNnZWtXbDVMZ0JKOEprRnZjd2puWVNCSnFJQU04TTEyWVNtb1Z0QkZxUDBk?=
 =?utf-8?B?VmVEcktDdFQ1eDRjaXMycXVmNEZCbGVjNGRlcnc1OWdQOHhUaWZ1NXFkN3VV?=
 =?utf-8?B?VUZ5d1BmWm1vMUhHUkw1N2ZZS25mZVNuT0lrdFkxam9TV0lFNjdOZDMwRWZo?=
 =?utf-8?B?Z29Eemt6K2xTak41UTh5cU9kZGF4SlVvSGhTREdQak1JcEZ1Q2xVMXlpQ2w1?=
 =?utf-8?B?d0greUhqRXBLZmNrZGRaVWlBWFdtakxWODFuM3pDWFI3eCsrYXFGcFNCQ09w?=
 =?utf-8?B?c080MWEySWUxNGgzcWtOR0xweThVUTF4Qms2a2dOYXd1Vk1IU2d4d1lHV3Bm?=
 =?utf-8?B?MXdydGtXZUVvSGRlUk9KQzFCM2lzT1ZpWjZyMXZJRFRRd3ZmZFRJWWM1MVls?=
 =?utf-8?B?MVVNNDdWS2tYZC9TM2hOLzZlc1pWVVpxMnRsS0JsM0tEOUJnLzVnR1VSNmR4?=
 =?utf-8?B?Vjd6K0VieUlQOTQ4VUhJb1pObythYmwrQSt3MzhsRGxQSmUvR0ZNdVQ1bDBk?=
 =?utf-8?B?bFJDazh3ODdzOUxjbFplQ3BwZlRHMER4WU9TblR0WUtMUmtJKzlrdTUwQTNQ?=
 =?utf-8?B?N2tJTENDZjFBa0FMMVFGNi9OaHZsVzJnQndVQTVtQnlXMVlRQ09Rd1VUN1kx?=
 =?utf-8?B?RUdsZTFSMi9BemRYUm9Bd2hoNis4dDhIQVptZkV6empWejFWMUk2YXI3bks3?=
 =?utf-8?B?WjFxR2NXRTUzdmRsazdJU05WRUFDa0p1VlZVVUQ2SXdVdWRWOVBPSDlhTitp?=
 =?utf-8?B?clB0Qjh4RTRHWXlGMFZkUlUrVDhKcXd4UzNkeDFLN0NDVEdNWXlxRE5HVi9u?=
 =?utf-8?B?Y3Y0TTNTQjFVaUJqd25DWTlTSkxnak9hd1A2UnBJb1BUOENQc3hlV0xvbEtk?=
 =?utf-8?B?Snk3Q2d3RS9DVjZENTM4RVo2UGpyYTRxRjdCTXBvY2NhUHBhVXR0cjZpZzdp?=
 =?utf-8?B?b2I0cUM1THRtUEI2aFVFbkJCT3U4T1l0dU9nRnZUOVJHYWtQUEgwTGNobEpX?=
 =?utf-8?B?ZXE0NDNuYlhNMlgrNXBVVGkrOUFBWTFqRHFVU1hFeVdmTDBpeFRYRUF6OG02?=
 =?utf-8?B?Q1IyYW40ZzNIY0I3NXNhS2ttWWV0ZktTZXpDQVJVc0F5a2NKVFpRNEFNR2Zl?=
 =?utf-8?B?Rm1GdUZ6alRUa21KYUpXcmdkYXZ0V2NFNWxsMzdHM3FuUmVRTG1QaWtaelQr?=
 =?utf-8?B?NmZRR2xYYnNMT0wzeHFlbHRaV2pTK2k2aFA1N0F4SGd0bEp1RFBGV2pNSmFi?=
 =?utf-8?B?QXdBam55aGtNb3JzbnM0SXFVVDFBWXBPZ1JRVFUxaUVnQjdhN3cvaStXMElm?=
 =?utf-8?B?OTRoeHNDYW1TbUZrTFR6Y0hwUnpIWUYyTERuQ2FLL3VpLyt5aUgzdnFQWTYy?=
 =?utf-8?B?a0ZWczgySFRHTFE5ellDQ0FEZTVONG56RFc4ZnJZSGZZbWlraFNXSXZnUkRK?=
 =?utf-8?B?VUdjZG5aMXZTUG9oeXdYNUprTjJsK1hHVHZQUHRjZjdEeHpGRG1iMGU3aXFP?=
 =?utf-8?B?NzZzTDIvR2VGaThLMUNxajNjT0ltbEtTbTBiNTZvalhHSStIMjlOQmowYWt3?=
 =?utf-8?B?ZXNRU3BGanZSbVU4RDlMR2NhcWt2bUM1ZHY2bk10ZlZBMnVGTzk3dExRSnV6?=
 =?utf-8?B?aGpwZmRMK29PbUowSTRyMkdubm1Gek1QWXp3MnNsUTFmNXl0V1Vlc0FrWHBN?=
 =?utf-8?B?WEgyazJaT2VCSEhMSFZTL1Q4eUNheDZPVjIyZDFUYjJHTnBVLzFpR0tRY2NS?=
 =?utf-8?B?M2gyYUxJbENBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L0RtOUl2SktTS1AzeVhLM3VDSDdaK0h0UzRPeHlWSFNmSG1NbnBVNTBGdll0?=
 =?utf-8?B?ekJvR3Q4YlJZZERuTnllTEczWWVhdVBSYzE4VkZTK01sQkZ6Tm5RN25JYjQv?=
 =?utf-8?B?WU9lOEJ4RDYrQlB1WG9wSFdEKzViMUs5cVZVbXMzQ0tSNlZqVU16S1ZlUStL?=
 =?utf-8?B?SXN4aGMrbEE5bXBQQ2s5NDl3VU1EdkN5a3NXa2Z6QWwzOXl2dE1nbVh3TDU4?=
 =?utf-8?B?ZEZFWTBBdFFiTGptU0Y3MS9FR1VCcFE1ZmpkTE1lUzFsSG44WmtJcHlJOXBa?=
 =?utf-8?B?ZHc2Rm9mZnk1eDNsV1QrZURJZXZTeEpma3NvTk5CTGxZOEZzeFB2REdoeUk3?=
 =?utf-8?B?YnFkVXppSTNKdmtybnZvVXg4VlYwbjlNRy9udnBlK1YyakZ4RmExNG9ENlpu?=
 =?utf-8?B?VG5yYXA0dTRrZ1lXR2NRL1ZCYTRhOTR1SFBWY2ZaYWM2ZkVKOUZaQlU1elJ3?=
 =?utf-8?B?T0puejd3WUppMk5Ya2JabjJnSWhkMVdZaEZocnEyR1F4RmpoTG1ybFlXNlZR?=
 =?utf-8?B?WmxXbjdlNW54anE3aGoxOHZzMXdnejYrNUZreUVpVHVmMThnYld1dWtWNEI1?=
 =?utf-8?B?Q2N6VDhNN292OUdtY0diekhpVm9FdE1kRVJ0eEVVT1NoU0NuNEx3Vkg2cTdj?=
 =?utf-8?B?M1NBQjR2Vkx1dWZ3cWlSTDNHSVRyVkc2TTNzZXNVeGtoWWR2YlhxQXdMeVND?=
 =?utf-8?B?WnNVRVMxN2lxY3podUhCTXZDTElwWlNhZkJPN0ZKRGd4U25QV2J5YWxrZXZY?=
 =?utf-8?B?SitnVlJqNk1oczVZZWZSbDR6Mmo1N2JMdjd6WDBjbEdOd3J5OGNsdTVVcDE5?=
 =?utf-8?B?elQ3cmpVN3FWRm14WTQ3MU1ZeG1WY2R1b0xQRXhiRXl2WTE2NXA0Y3o1VDZt?=
 =?utf-8?B?bGcrRjV2RXpudm81MjFpWWtqaWR1ZHRtRGYrYSsya0taYWRMVkpOYnZMc2hU?=
 =?utf-8?B?TjhpUC9BZEdkQmY5UFNUTzhoOVE0WnZmUURteFhTNDMxVWJMaTB3aE5tb25I?=
 =?utf-8?B?MFpEUlVOZjhvSmtZU1NTMzF0QWF5ekRlMkxOcHNlbHRYV3FwSFNmdVp6bXpE?=
 =?utf-8?B?SW4xZ1IxRkFKTXdsNFEvVkdIb1hJRHNIV1N2Ui8raytMR01rVVljdCtFMVVh?=
 =?utf-8?B?RG9QMHgrYjkvVVBIM0R4M3ROMG1KaUJXUFZJQ0l3K1VsUlVOTGJyTFZvdUJO?=
 =?utf-8?B?ME9oYUZEaURnMkRLeE9pRG9kL294ZkVVWG1CVWIxcHNDWUZLbnBtZzRXYlh2?=
 =?utf-8?B?VGtTYlFqTTVEYXhhcUJpQmdsNk1VWGlQZTBJN2JZRXQ0aHRTc1JxVUpGS2lh?=
 =?utf-8?B?aGVwcGo3WWUrRHNxUmpyaWo2RGx4Q3Z2cU1WNlZnNHlTZTZmWjNrVnV1V2dU?=
 =?utf-8?B?U0JWcGJzUW1pclJFRnoyQWFQaENma2dPQWZpb29TbjFMaEg1d3Ixall6RkVt?=
 =?utf-8?B?MU4zTHZOdmtSZ3dKY1ducW9ERHMzdk5xbVQ4Yk9QdzN5aDZUazFxRmVpVVpz?=
 =?utf-8?B?Y2xTQ3JjOUE5cXA1MTBzMTUxbjBqZ1NZYUJBNDd2Q0hXZkUxY0xsb1h6WTd0?=
 =?utf-8?B?MjVmK0QvMWdaa2ZWMXFaditkT2tTKzBYWi9BTTNCZWlaWkRwdDAyRFJTNFg1?=
 =?utf-8?B?blo2SXhxT3pwSC81WTdzdDZidjJEellyU2Q1REQyajAvWEhuUFEvMUFsVVY3?=
 =?utf-8?B?VDBBbVRXalJxTlE3MDdaaHRFcWNHSVBwbDIxcmVMT0lMczBNWVhENkFvZnYy?=
 =?utf-8?B?cVdSUnV5TlNVS0U3VDIvU2xBRlJMMG5VWUdGd3UxRHp3dkxrRkc0WXNlOVZN?=
 =?utf-8?B?YjlSSy9rQWp1VCtBYTJQRUsxRjErdy9QUmdUY2huUWZIZWcwcjYxS2RDS2pM?=
 =?utf-8?B?TkhZRGduNWpvZi9aZkpVMTVaU0NHMGVJK2YwL2oyYndZMm91eFkySVhnQ1Ew?=
 =?utf-8?B?QWxNY1dnSlQ1S1lBTUJycDUrd2FxNGxIcmhUeVpiK0xNVzdEZFZmWjZHck5w?=
 =?utf-8?B?QS9ZbkoyNW03Q3ZZVUxrQlhKSXpKVVBXbHV2UGlFUGJNWjhsdGtEemduZDdL?=
 =?utf-8?B?TGlybjcyeGZwdHJsb2lsQk1CcGtQSFlzb3R3K2lzUnJ6aW5VeTIrdnpNUFdy?=
 =?utf-8?B?RHpMOURkYWtHWTlSQnhlYnU0aHhQWWhhR2Izd0l6eWRFUXlCejV1MmhRMXBN?=
 =?utf-8?Q?ktsVvCWCvLmGFGrC9IIoa+c=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <188523B599C13D498C9EC806BE4AD546@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1623fd42-b581-4d7f-944f-08ddea630282
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2025 20:55:12.1175
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EZ8+BsjYQnfuoRSE24mG8eo9xJAdwPR7iOCi1rfiBHOymDQKMKvIhJFnr/BYFZz2prOmmZ24k7d/Yi/xjPWMFYDS4vhqj0jns9kKz3rSHHs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR03MB10942

SGkgSnVsaWVuLA0KDQpPbiAwMi4wOS4yNSAyMzoyMCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBI
aSBMZW9uaWQsDQo+IA0KPiBPbiAwMi8wOS8yMDI1IDE4OjI2LCBMZW9uaWQgS29tYXJpYW5za3lp
IHdyb3RlOg0KPj4gSGkgSnVsaWVuLA0KPj4NCj4+IFRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXcg
YW5kIHN1Z2dlc3Rpb25zLg0KPj4NCj4+IE9uIDAyLjA5LjI1IDE5OjU1LCBKdWxpZW4gR3JhbGwg
d3JvdGU6DQo+Pj4gSGkgTGVvbmlkLA0KPj4+DQo+Pj4gT24gMjkvMDgvMjAyNSAxNzowNiwgTGVv
bmlkIEtvbWFyaWFuc2t5aSB3cm90ZToNCj4+Pj4gQEAgLTc4Miw0NiArODA0LDgxIEBAIHN0YXRp
YyBpbnQNCj4+Pj4gX192Z2ljX3YzX2Rpc3RyX2NvbW1vbl9tbWlvX3dyaXRlKGNvbnN0IGNoYXIg
Km5hbWUsIHN0cnVjdCB2Y3B1ICp2LA0KPj4+PiDCoMKgwqDCoMKgwqAgew0KPj4+PiDCoMKgwqDC
oMKgwqAgY2FzZSBWUkFOR0UzMihHSUNEX0lHUk9VUFIsIEdJQ0RfSUdST1VQUk4pOg0KPj4+PiDC
oMKgwqDCoMKgwqAgY2FzZSBWUkFOR0UzMihHSUNEX0lHUlBNT0RSLCBHSUNEX0lHUlBNT0RSTik6
DQo+Pj4+ICvCoMKgwqAgY2FzZSBWUkFOR0UzMihHSUNEX0lHUk9VUFJuRSwgR0lDRF9JR1JPVVBS
bkVOKToNCj4+Pj4gK8KgwqDCoCBjYXNlIFZSQU5HRTMyKEdJQ0RfSUdSUE1PRFJuRSwgR0lDRF9J
R1JQTU9EUm5FTik6DQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIFdlIGRvIG5vdCBpbXBs
ZW1lbnQgc2VjdXJpdHkgZXh0ZW5zaW9ucyBmb3IgZ3Vlc3RzLCB3cml0ZQ0KPj4+PiBpZ25vcmUg
Ki8NCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byB3cml0ZV9pZ25vcmVfMzI7DQo+Pj4+
IMKgwqDCoMKgwqDCoCBjYXNlIFZSQU5HRTMyKEdJQ0RfSVNFTkFCTEVSLCBHSUNEX0lTRU5BQkxF
Uk4pOg0KPj4+PiArwqDCoMKgIGNhc2UgVlJBTkdFMzIoR0lDRF9JU0VOQUJMRVJuRSwgR0lDRF9J
U0VOQUJMRVJuRU4pOg0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIGRhYnQuc2l6ZSAh
PSBEQUJUX1dPUkQgKSBnb3RvIGJhZF93aWR0aDsNCj4+Pj4gLcKgwqDCoMKgwqDCoMKgIHJhbmsg
PSB2Z2ljX3Jhbmtfb2Zmc2V0KHYsIDEsIHJlZyAtIEdJQ0RfSVNFTkFCTEVSLCANCj4+Pj4gREFC
VF9XT1JEKTsNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmICggcmVnID49IEdJQ0RfSVNFTkFCTEVS
bkUgKQ0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByYW5rID0gdmdpY19leHRfcmFua19v
ZmZzZXQodiwgMSwgcmVnIC0gR0lDRF9JU0VOQUJMRVJuRSwNCj4+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBEQUJUX1dPUkQpOw0KPj4+PiArwqDCoMKgwqDCoMKgwqAgZWxzZQ0KPj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCByYW5rID0gdmdpY19yYW5rX29mZnNldCh2LCAxLCByZWcgLSBH
SUNEX0lTRU5BQkxFUiwNCj4+Pj4gREFCVF9XT1JEKTsNCj4+Pg0KPj4+IFdoaWxlIEkgdW5kZXJz
dGFuZCB0aGUgZGVzaXJlIHRvIHRyeSB0byBhdm9pZCBjb2RlIGR1cGxpY2F0aW9uLiBJIGZlZWwN
Cj4+PiB0aGlzIGlzIG1ha2luZyB0aGUgY29kZSBhIGxvdCBtb3JlIGNvbXBsaWNhdGluZyBhbmQg
aW4gZmFjdCByaXNraWVyDQo+Pj4gYmVjYXVzZS4uLg0KPj4+DQo+Pj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGlmICggcmFuayA9PSBOVUxMICkgZ290byB3cml0ZV9pZ25vcmU7DQo+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHZnaWNfbG9ja19yYW5rKHYsIHJhbmssIGZsYWdzKTsNCj4+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqAgdHIgPSByYW5rLT5pZW5hYmxlOw0KPj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB2cmVnX3JlZzMyX3NldGJpdHMoJnJhbmstPmllbmFibGUsIHIsIGluZm8pOw0KPj4+
PiAtwqDCoMKgwqDCoMKgwqAgdmdpY19lbmFibGVfaXJxcyh2LCAocmFuay0+aWVuYWJsZSkgJiAo
fnRyKSwgcmFuay0+aW5kZXgpOw0KPj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCByZWcgPj0gR0lD
RF9JU0VOQUJMRVJuRSApDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZnaWNfZW5hYmxl
X2lycXModiwgKHJhbmstPmllbmFibGUpICYgKH50ciksDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBFWFRfUkFOS19JRFgyTlVN
KHJhbmstPmluZGV4KSk7DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBlbHNlDQo+Pj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHZnaWNfZW5hYmxlX2lycXModiwgKHJhbmstPmllbmFibGUpICYgKH50
ciksIHJhbmstPmluZGV4KTsNCj4+Pg0KPj4+IC4uLiB5b3Ugbm93IGhhdmUgdG8ga2VlcCBib3Ro
ICJpZiIgdGhlIHNhbWUuIFVubGVzcyB3ZSBjYW4gaGF2ZSBhDQo+Pj4gdmVyc2lvbiB0byBhdm9p
ZCAiaWZzIiBldmVyeXdoZXJlIChtYXliZSB1c2luZyBtYWNyb3MpLCBJIHdvdWxkIHJhdGhlcg0K
Pj4+IGNyZWF0ZSBhIHNlcGFyYXRlIGZ1bmNpdG9uIHRvIGhhbmRsZSBlU1BJcy4NCj4+Pg0KPj4+
IENoZWVycywNCj4+Pg0KPj4NCj4+IFRoZSBtYWluIGlkZWEgb2YgVjUgb2YgdGhpcyBwYXRjaCBp
cyB0byBjb25zb2xpZGF0ZSBzaW1pbGFyIGNvZGUgYW5kDQo+PiBrZWVwIHRoZSBwYWlycyBvZiBy
ZWd1bGFyIFNQSXMgYW5kIHRoZWlyIGVTUEkgY291bnRlcnBhcnRzIGluIHRoZSBzYW1lDQo+PiBw
bGFjZSB0byBzaW1wbGlmeSBhbnkgZnV0dXJlIG1vZGlmaWNhdGlvbnMgb2YgdGhlc2UgcGFpcnMu
IElmDQo+PiBlU1BJLXNwZWNpZmljIHJlZ2lzdGVycyBhcmUgbW92ZWQgdG8gYSBzZXBhcmF0ZSBm
dW5jdGlvbiwgaXQgd291bGQNCj4+IHJlc3VsdCBpbiBjb2RlIGR1cGxpY2F0aW9uLiBBZGRpdGlv
bmFsbHksIEkgdGhpbmsgaXQgd291bGQgYmUgZWFzaWVyIHRvDQo+PiBtaXNzIHVwZGF0aW5nIHRo
ZSBjb2RlIGZvciBvbmUgcmVnaXN0ZXIgb2YgdGhlIFNQSS9lU1BJIHBhaXIgd2hpbGUNCj4+IG1v
ZGlmeWluZyB0aGUgY29kZSBmb3IgdGhlIG90aGVyLi4NCj4gDQo+IEkgdW5kZXJzdGFuZCB5b3Vy
IHJlYXNvbmluZywgYnV0IGluIHRoaXMgY2FzZSwgd2UgbmVlZCB0byB0cnkgdG8ga2VlcCANCj4g
dGhlIGNvZGUgYXMgY29tbW9uIGFzIHBvc3NpYmxlIGFuZCByZWR1Y2UgdGhlIG51bWJlciBvZiBp
ZnMuIExvb2tpbmcgYXQgDQo+IHRoZSBwYXRjaCBhZ2Fpbiwgd2Ugc2VlbSB0byBvZnRlbiB1c2Ug
IkVYVF9SQU5LX0lEWDJOVU0ocmFuay0+aW5kZXgpIg0KPiBhbmQgdGhpcyBpcyB3aHkgd2UgaGF2
ZSB0aGUgc2Vjb25kICJpZiIsIGZvciBpbnN0YW5jZSBoZXJlLiBJIHRoaW5rIGl0IA0KPiB3b3Vs
ZCBiZSBwcmVmZXJhYmxlIGlmICJpbmRleCIgc3RvcmUgdGhlIHByb3BlciB2YWx1ZS4NCj4NCg0K
QWN0dWFsbHksIHRoZXJlIGFyZSA0IHNwZWNpZmljIGNhc2VzIHdoZXJlIEkgbmVlZCB0byB1c2Ug
RVhUX1JBTktfSURYMk5VTToNCnZnaWNfZW5hYmxlX2lycXMsIHZnaWNfZGlzYWJsZV9pcnFzLCB2
Z2ljX3NldF9pcnFzX3BlbmRpbmcsIGFuZCANCnZnaWNfY2hlY2tfaW5mbGlnaHRfaXJxc19wZW5k
aW5nLiBUaGUgcmVhc29uIEkgbWFkZSB0aGlzIHRyYW5zZm9ybWF0aW9uIA0KaXMgdGhhdCB0aGVz
ZSBmdW5jdGlvbnMgYXJlIGdlbmVyaWMgYW5kIGNhbGN1bGF0ZSB0aGUgdmlycSBiYXNlZCBvbiB0
aGUgDQpyYW5rIG51bWJlciwgZS5nLiB2Z2ljX2NoZWNrX2luZmxpZ2h0X2lycXNfcGVuZGluZygp
Og0KDQp1bnNpZ25lZCBpbnQgaXJxID0gaSArIDMyICogcmFuazsNCg0KQXMgYSByZXN1bHQsIEkg
ZGVjaWRlZCB0byBpbnRyb2R1Y2UgRVhUX1JBTktfSURYMk5VTSB3aXRoIGlmcyByYXRoZXIgDQp0
aGFuIG1vZGlmeWluZyB2ZXJ5IGdlbmVyaWMgY29kZSB0aGF0IHdvdWxkIGFsc28gYWZmZWN0IHZH
SUN2MiBhbmQgYmUgDQptb3JlIGRpZmZpY3VsdCB0byB1cHN0cmVhbS4uDQoNCj4gQW4gYWx0ZXJu
YXRpdmUgd291bGQgYmUgdG8gcHJvY2VzcyB0aGUgM3JkIHBhcmFtZXRlcnMgc2VwYXJhdGVseS4N
Cj4gDQo+IFRoZSBuZXh0IGJpZyBvbmUgdG8gdGFrbGUgaXM6DQo+IA0KPiBpZiAoIHJlZyA+PSAu
Li4gKQ0KPiAgwqDCoCB2Z2ljX2V4dF9yYW5rXy4uLiguLi4pDQo+IGVsc2UNCj4gIMKgwqAgdmdp
Y19yYW5rKC4uLikNCj4gDQo+IElkZWFsbHkgSSB3b3VsZCBsaWtlIHRvIHByb3ZpZGUgYW4gaGVs
cGVyIHRoYXQgY2FuIGZpZ3VyZSBvdXQgd2hldGhlciANCj4gdGhpcyBpcyBhbiBlU1BJIG9yIG5v
dC4gTG9va2luZyBhdCB0aGUgcGF0dGVybiwgSSB0aGluayB3ZSB3b3VsZCANCj4gaW50cm9kdWNl
IGEgbmV3IGhlbHBlciB3aGljaCByYXRoZXIgdGhhbiB0YWtpbmcgYSByZWxhdGl2ZSBvZmZzZXQg
dGFrZSANCj4gdGhlIHJlZyBvZmZzZXQsIHRoZSBiYXNlIGZvciBTUElzIGFuZCB0aGUgYmFzZSBm
b3IgZVNQSXMuDQo+IA0KPiBDaGVlcnMsDQo+IA0KDQpIbSwgdGhhdCdzIGEgZ29vZCBpZGVhLiBJ
IHdpbGwgdHJ5IHRvIGltcGxlbWVudCB0aGlzLiBJIGFncmVlIHRoYXQgaXQgDQp3aWxsIHJlZHVj
ZSB0aGUgYm9pbGVycGxhdGUgY29kZS4NCg0KQmVzdCByZWdhcmRzLA0KTGVvbmlkDQo=

