Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEPwJpwccGkEVwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 01:23:56 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 785564E77A
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 01:23:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209389.1521410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viM0X-000336-EO; Wed, 21 Jan 2026 00:23:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209389.1521410; Wed, 21 Jan 2026 00:23:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viM0X-00030Z-BZ; Wed, 21 Jan 2026 00:23:37 +0000
Received: by outflank-mailman (input) for mailman id 1209389;
 Wed, 21 Jan 2026 00:23:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ocOU=72=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1viM0W-00030T-3C
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 00:23:36 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6bf5e4ca-f65f-11f0-b15e-2bf370ae4941;
 Wed, 21 Jan 2026 01:23:34 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AS8PR03MB8692.eurprd03.prod.outlook.com
 (2603:10a6:20b:561::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Wed, 21 Jan
 2026 00:23:31 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%7]) with mapi id 15.20.9520.012; Wed, 21 Jan 2026
 00:23:31 +0000
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
X-Inumbo-ID: 6bf5e4ca-f65f-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zHleMKmTI4G4/DCNuTSKk5SZYySChP5TtjuG7fJggejwqW1A4DSWFSqBWQjTl4vVBk40b0IdGNph2+6iKEKJ8/+uC86bmLBFeBHZygZVi7XZQJd1jLP99ABWW2gyx/Apo0HykTHD46xlm2RCaGEhQPYeVBsABBLCS59XRMgMO2BSytMSM6ozup0ROibgmul8JUk92dpX00vyS3vE3aV6tDgSJY/oomhaEeFVdWqx3eH0kO04SvEszDbeRAnk3YgvD5KKPeyWjG+1M0bZxpX08eBv8dbItcKwUdLaULjTkrLPyfxUOv+c3m9AFty2pH5bir9lqG2qaWhh45xKcJnlIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pz6fcZmmXaisVHNt9FM7kTrs2YMShlGtjjiiWGKLvVw=;
 b=yx9Y2i3G6EHX1/v3MhAMPrC0hecaFYf9qsPgZS2+eTXGgs8ABkGtHw/OKlxoI9bFisKtyGy8xQzj984lX2M2Sg1f2fzYPH6fKjWnHbFDZXs0ObSTwrkuQRDvIC/ZdNUNuOda3G1prFifFUDU1fJgUqevPGD6zez7DaZhmKZhFthPcMV32M1KOKBz6Qt7wSZR9EUCiD6m1Lgi3t5wTzNgXU+2WaNtKODIn7xZ36P46x7L9JLGg7BiF8ooV/FikoZ9bajHJfR1jptfKg5H+Y4TmqiVbVYl4PO1upUB68rJehFX0JX5TluWQysGPql1byIog3NqITgYPkGVolrrbkmhQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pz6fcZmmXaisVHNt9FM7kTrs2YMShlGtjjiiWGKLvVw=;
 b=Y8+SctKjEUX9JOGjDbgiIwH3ao57FtrdzPLQns9yIhf48Aqohiyxe1l1b9+WH8H4S0Wo6vkMtyKx5CJ1GXv4sOihJta21HYztyvS6qAWUKUxFtEGaJAljbMbokOwnTvliYtlxc1X9CP4ovf5zvda1hWTcXLWvHfndrGFmIQjYgXUCGwlf8v7FW5gabFiuY9Az9lCAIxWFUBKO8mATecqd5LPg2CfadRHT5Yh9MDybwi3cT8ZcSlSKVJmiuZ7PHbhU0o1pER9n7HFXwBEPaughlr1biWyKI7bwQCyqJoyvYAfo4IguN3qBvOlHXwYo7x487mzocRVjCmfZohKZzT/PA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>, Michal Orzel
	<michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Alistair Francis <alistair.francis@wdc.com>, Connor
 Davis <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [Arm] Re: [PATCH v1 11/15] xen/riscv: introduce ns_to_ticks()
Thread-Topic: [Arm] Re: [PATCH v1 11/15] xen/riscv: introduce ns_to_ticks()
Thread-Index: AQHcdPdXiMhfHHwKbka54SohlbcU+g==
Date: Wed, 21 Jan 2026 00:23:31 +0000
Message-ID: <87bjin6cgd.fsf@epam.com>
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
	<e4e36ed2d02b760c925014db986041b82fd9b943.1766595589.git.oleksii.kurochko@gmail.com>
	<369eb1d7-864e-4432-9729-57786d0c191f@suse.com>
In-Reply-To: <369eb1d7-864e-4432-9729-57786d0c191f@suse.com> (Jan Beulich's
	message of "Mon, 12 Jan 2026 15:59:13 +0100")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AS8PR03MB8692:EE_
x-ms-office365-filtering-correlation-id: 3355b6b1-e7d0-4c1c-f916-08de58834e66
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|42112799006|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?EEgiTyWNDHrgYrDzQWXvcGFUHXW2XGNxPm470mYnnGwoMltgF0SgX9DyiV?=
 =?iso-8859-1?Q?wzn2vDt8ZwwKhXt22tu9Jc1haSgS3pZq5igs8CKepg/YnwsQ5EVYVrspAR?=
 =?iso-8859-1?Q?icwMgrEJXmzma28lGEKd76q4+tKEPT+qtUWxnBDqc2CyHL2cYEk/tV+kGW?=
 =?iso-8859-1?Q?Xwmy/pEGHBPC3c/JVmxt16bgL/CGQNcMmPEllxr5o0wf4f26TXOX9RM4Eq?=
 =?iso-8859-1?Q?igPPT8KSU8lA5/dxTylZ9OGNPWeXCcLa4jhSlS4yiozkziGm/lv8G1gNq3?=
 =?iso-8859-1?Q?/cdFpvgSucqBYgnosvoZ8a0o5KQcOwdIociLxnIcAofdWFrVVnWPahaHoa?=
 =?iso-8859-1?Q?sMQ4OyasKKfCInBIr6aRihPNvzalxUrnnd9JoTW0DD8qf4SqmdMOlStpYY?=
 =?iso-8859-1?Q?pE85GS7/QDIDoX7OU1PW6tDQrl89v78nGHP7+Q7JMYMfKTnxvM3uuPCAnS?=
 =?iso-8859-1?Q?O7Oe8IoEfWYj51mVavzMW7SCk41pGSgxfJ5TljKi8a8ESWRUXX+rA7p2ob?=
 =?iso-8859-1?Q?f1dIlmA5ZiayScrJsBKospiMzJAs7UyPPzgDPHe4EsJFRtfhSHeKCY3YMs?=
 =?iso-8859-1?Q?UuPn5t25WAjfIF7LHzB4QVyjEidt+O/e5VXBylwa7VQjKcSql7NvjygTgJ?=
 =?iso-8859-1?Q?ND1ydknsLUIJvVzXbqg5jM/m9ZB7937QRelaMRs+X/ZsjsfaT5ZPgMkO09?=
 =?iso-8859-1?Q?+2Akd6tHbzpp9dhznhJEtiM3lIhmBy0DgDg9JUcZs0AXBLsM+dT8tQqJpM?=
 =?iso-8859-1?Q?lCqNt0sQ9W8hEqk3oKniNE5AMJjeauot6zYDfA9GSKaJRQq5CUlu3ksemK?=
 =?iso-8859-1?Q?oSgLl3FFfRRfMd7xx6QEAlSRCvkPP3MjGwJAzMQo4VeArCLLNnU/hK8NQd?=
 =?iso-8859-1?Q?fWxHZx3jQVdBBjJIOcQJ5mmiK9YytxqSpJoHvFp1UX70oxn5CvL4u0RJC/?=
 =?iso-8859-1?Q?s8CFAxF4gCmwe0eB96nstGvSoNHhBZO/plSTpx9o1I2YVl+Hnk2AzcB7OR?=
 =?iso-8859-1?Q?pTkLQIkrW1KrNzagNAcJVLXTtcB9NFFBLYgpinDDsseFH6RiSBtp6xcdEx?=
 =?iso-8859-1?Q?R5utzC6Dhkc7QySqm2lxij9RHlDFS+9kwwUSVAhFpATbjAdHYWCIPh/Y21?=
 =?iso-8859-1?Q?U14d0WM8WqgWz5kVPfdeSnhq4kh9/f5CSJk0AtU48l4l3xkkeLcevk05S+?=
 =?iso-8859-1?Q?2K4F5EgyMMaYry3dlV4AIJzqtEN7EqD1jXZ9SZv+WlMf7VTlTzWCCG3nmh?=
 =?iso-8859-1?Q?hDLDCC8Mly7bsosh4tgUh/Ut5dc3IkaqAGsR1C9FYn4kGla7k+evgS4y9h?=
 =?iso-8859-1?Q?iTjlJXloJqcQI6vuQjIHDJBsCDfCyDwU/57IPiD8EQsHmEy8nB7keoFYzJ?=
 =?iso-8859-1?Q?TaWibjCOVeAqON9pwZ2VHLhLJjKnoWcsgdxAc++X348pqPIJOFAgubCbtR?=
 =?iso-8859-1?Q?EhvMG9qfCky2j8RphZvUFlgFPx5caXvzPYHTiLUub4iEvWlb1WkttBkxYe?=
 =?iso-8859-1?Q?vp31G5SoORJC0iI3OGAs7cEAdkHRaUbITA2Nj5s5m7wPJ4CLDSWa4AiBN3?=
 =?iso-8859-1?Q?bRXVPFsyYu6QExc2JZnt+8sNDb7TJIoTUzbdmtHt6kL+mhcaI3/e6plvFT?=
 =?iso-8859-1?Q?I9inNIa6I0cWQVy9lv2/1vQhboLmagKQXlFfUkz5KEBfbBgKPSrT8SO8fo?=
 =?iso-8859-1?Q?oNtN5SmcDNnzLL7GyaY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(42112799006)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?+5jrbJgW4tcXlVUe9dUIF+ygKfe9x+VK5cCT1o0hup5h3R55bl/94pf1nS?=
 =?iso-8859-1?Q?1q1yS8i/m1k5Pzx4xDy/QbiaxW80C/FbygqjtmZ1Ls2BRs98Ym5/R/U115?=
 =?iso-8859-1?Q?MFNc8DweOdzLmsT3pYUtWut+0AxhgpAGILgr816FZr1v8O0u7XLzTjLwE1?=
 =?iso-8859-1?Q?fsoPYVYhLS8b29gMaFIvabDKPmLtk7WrbWli925qPwUDnWD+mwsJfy2QGM?=
 =?iso-8859-1?Q?NwE9Rky9xPgweCorept3kWcinZPLFOSLr6p6sbVbE/twRf0RXqufTO1+Yz?=
 =?iso-8859-1?Q?ue8gUm1JvO0A5hBLT2E128qKNy1rSSDTG5+7fQYW4ehtrykwxTNOf2Y2dg?=
 =?iso-8859-1?Q?I+Od6KPIA2fmj5X5SDF5DxS0bxIMknsJB3vtxKxFFOlw3HNLSl5Z42hPXp?=
 =?iso-8859-1?Q?3MZIojkpac4k0rBC84eFRuRWS4wMPzsCwT9w91j0uwVoNLUWkMAT8bsFcR?=
 =?iso-8859-1?Q?kcjLDRL8QNyu2UksSCkBcowBl71ZeeLfZYosoKjLzxySRkXsKaf+QsFxU7?=
 =?iso-8859-1?Q?lQvURU97k9Y0dheSA9E+u0FZnm1f02m7Jeb8W8Nd6ZtxD4eZD0/asE3hgh?=
 =?iso-8859-1?Q?dEM2gtAQWJ2CUX+OadJAnLyKD/g7D3zSxR/YWFM4WmUvDll6L5pTmfLaxI?=
 =?iso-8859-1?Q?LQY2pwPLyyK79/B+nUJIZLg37LaDTP41P1dhm4Cg/DKSbOnR9/BfIAvHMx?=
 =?iso-8859-1?Q?gyreCPIJbQl18zVG65H3F2/T9KOS3bWQLQqbiXPta9PG0Zi/HNRu1A3UX9?=
 =?iso-8859-1?Q?1hH6rRJk8tmBVbugzuU+Kxk4gajxzl7Y7JVQCNo4GNY0whWol0uGv+KbCw?=
 =?iso-8859-1?Q?WOu/Q8NqrWcQeEsgMyIS8bSNWf+AT52d8+VUGmh5yWY+vfjotl8fTak1li?=
 =?iso-8859-1?Q?kCVdIaeET0QpyCx18C5yN9JqRUc+FpPj4W2gXbd/hn4TSvq8duLMc8tGLj?=
 =?iso-8859-1?Q?elWT5wiQe+pFKcbTnDIqdJmNAuAeppkLaXmpeT/80FSKDSaG8piCrm3Z2t?=
 =?iso-8859-1?Q?dDU+iq6t9JuqRkm/NKtusIjHR/iHWINcdADOjQoLgdQHwhv/FOE3Sybtbd?=
 =?iso-8859-1?Q?yhWzZUhOB6z7lpM5SW0y6jRB3tD+aKMT5GKJn5u+r1dIpsvw3qBr2Qo/9u?=
 =?iso-8859-1?Q?g3IPnfQczUSFT4+vGph/uCbA0C4HhRXudW5jwu+QWleZQz7cOfnSCZ4bHU?=
 =?iso-8859-1?Q?6E+ZvYVu7SKXaToqEEJM+t5CTmaxROdoNRdbevtYsAfmXciVJp6aoZWje8?=
 =?iso-8859-1?Q?G6BCHyxmdXIU4HE8+JgGTizQ/IxX3E42qq5GYsnFvRW3EwXNXpCt6sn3Ma?=
 =?iso-8859-1?Q?Dw1/NGzDcbHW3wO2lKsWTR4+HwO7PHPX/qHsegG1ChtynZnFsQwcV00vAB?=
 =?iso-8859-1?Q?CBC89aRHuMxse4/OamUZ9endiYnl/LxmNreCZPmc0FHCmYmvrqdaByyFi5?=
 =?iso-8859-1?Q?SR9HzgnS9Ut51pUXLFsigIzIwP+tjRAnLUgoT9L0UuaXzyPRu1xeP1cfV3?=
 =?iso-8859-1?Q?SA5ZTb2XbDnfLCkejegzbKsPKMGBhtz09hYFkNdB1LPh3Bsr34Kehp3Nch?=
 =?iso-8859-1?Q?xAsFYTBEiuap6kGM6ac60Lcuphu+Di07toeADdPjc2pdoNwDoW8UFGcVIm?=
 =?iso-8859-1?Q?Kd9gImREXYEasVKEXcHpcBIFB2WoWX6qqrVEFpHZXfOicBQmyEm3VCs1vz?=
 =?iso-8859-1?Q?RyeWGAAev/lpSppsTQLT96C2d4BviWTs4EkZBnujsX9/R8lvyVZ+GxibnB?=
 =?iso-8859-1?Q?Nu0dkH0yGRwtlRCh06vLMT/0O77sX1D9/hA4n0zbJaEvN3KdvXuDqNjqg3?=
 =?iso-8859-1?Q?imaOshW2DlZM4IoF+QN8qHJgmdG1GDs=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3355b6b1-e7d0-4c1c-f916-08de58834e66
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 00:23:31.2464
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rB/Carb+TEC0vUrasIH1Tvk1GqHtx3XA9HfNkvNCManbmcQrCTvxJvgsxcUGvLEDVD1VwrhJ4+5aQHrlSBv/gZBN3EE8i15LJ4ZQ6ltQGzI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8692
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,amd.com,xen.org,kernel.org,wdc.com,citrix.com,vates.tech,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:oleksii.kurochko@gmail.com,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Volodymyr_Babchuk@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Volodymyr_Babchuk@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 785564E77A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jan,

Jan Beulich <jbeulich@suse.com> writes:

> On 24.12.2025 18:03, Oleksii Kurochko wrote:
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>>  xen/arch/riscv/include/asm/time.h | 5 +++++
>>  1 file changed, 5 insertions(+)
>
> Looks okay and read to go in as is (no dependencies on earlier patches af=
aics),
> but:
>
>> --- a/xen/arch/riscv/include/asm/time.h
>> +++ b/xen/arch/riscv/include/asm/time.h
>> @@ -29,6 +29,11 @@ static inline s_time_t ticks_to_ns(uint64_t ticks)
>>      return muldiv64(ticks, MILLISECS(1), cpu_khz);
>>  }
>> =20
>> +static inline uint64_t ns_to_ticks(s_time_t ns)
>> +{
>> +    return muldiv64(ns, cpu_khz, MILLISECS(1));
>> +}
>
> It's hard to see what's arch-dependent about this or ticks_to_ns(). They'=
re
> similar but not identical to Arm's version, and I actually wonder why tha=
t
> difference exists. Questions to Arm people:
> 1) Why are they out-of-line functions there?

That's interesting question. According to git blame this is how it was
introduced in 2012 and after that no one touched this part. Original
patch had cntfrq defined as `static`, this explains why these functions
were declared out-of-line.

> 2) Why the involvement of the constant 1000 there? 1000 * cpu_khz can
>    actually overflow in 32 bits. The forms above aren't prone to such an
>    issue.

Patch "xen: move XEN_SYSCTL_physinfo, XEN_SYSCTL_numainfo and
XEN_SYSCTL_topologyinfo to common code" (096578b4e48) changed hz to
khz. This added that 1000 multiplication. Also this patch removed
`static` qualifier from the counter variable.

Anyways, latest ARM ARM suggests that timer frequency should be fixed at
1GHz, which is shy of 32-bit overflow. So most new platforms will be
fine. And older platforms had much lower frequencies.

> If the delta isn't justified, I think we'd better put RISC-V's functions =
in
> common code (xen/time.h). They're not presently needed by x86, but as
> inline functions they also shouldn't do any harm.

I'm mere reviewer, but I agree that proposed approach is better and more
resilient.

--=20
WBR, Volodymyr=

