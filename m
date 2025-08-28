Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B71EEB3A600
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 18:21:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099609.1453392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urfMr-0007Td-QG; Thu, 28 Aug 2025 16:20:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099609.1453392; Thu, 28 Aug 2025 16:20:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urfMr-0007QS-Mn; Thu, 28 Aug 2025 16:20:53 +0000
Received: by outflank-mailman (input) for mailman id 1099609;
 Thu, 28 Aug 2025 16:20:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FxJR=3I=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1urfMp-0007P9-UJ
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 16:20:52 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f634b8c4-842a-11f0-8adc-4578a1afcccb;
 Thu, 28 Aug 2025 18:20:50 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by PA6PR03MB10532.eurprd03.prod.outlook.com (2603:10a6:102:3d9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.24; Thu, 28 Aug
 2025 16:20:49 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9073.016; Thu, 28 Aug 2025
 16:20:49 +0000
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
X-Inumbo-ID: f634b8c4-842a-11f0-8adc-4578a1afcccb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LOWKl12XUB4DLLyQzsE43btkK3nokvkTDu2oyGACB5qWcMufOniYfgOM6ORHf0dH4Tl3S/QcndivPbnjxl7uVjlGdP7mn1U2V14t2BsgnDmmGKAGgPE8sm2bRWA7gzP52q+VTLXv9CQHLtkQTbGhhRuhdFXQzhdM9e+5H4r6+uCtDeQXfa9rWhzcguGYWgm3BsM+1Gb/4V4eFzPqj0VywGrn1X8pPrK2pqrNXdi2rs2tGUMTWQcUCfejQD27L1wbV7K/xbLCZ+HnkRletacTo2/lBKK85TMzzEazLeG7A8464k3KiFkWqITX+jWLtOyMzT3W8KkpmnhSN0iHeoQlhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZSIbARUlkA7vUzpM9WngFR+rsOpS8Ve2Y3tL4GvBLjs=;
 b=pDpr5DNPhmnX1ktlYjqEeVHiFWKef114l6w5HHLqwbF1lF0oqZp6DHa5BMx33IdXqiAb1MUPJwORdIeg1cLhynpVXl9/ovThqwTgPYlB/Fe7ixqvZrmFH2Vylqz1n3P0uv2tdMZHD9TfGo8LS20kjiJFi6KdOjhZmFCb4OKQDYMo+2Uiqdh9TKGE5ID7BkWModlwwvcesxE/xhKpL1vetv7rMB0DgbwzS1zN3e7UEpqyYQUK8jIWD/4zpSlVFs7nj100AmlK1OXj1MQqdHqReTGS1LLpP21BdHC7WLz6j488thYeq5vVkjUsw5hhuQRTwlPP9PrkG4G5Q1OHatKUgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZSIbARUlkA7vUzpM9WngFR+rsOpS8Ve2Y3tL4GvBLjs=;
 b=XccA4o2txVcpnGFjp3T4LtcqDc8bgbKIqozrwOZ++DibIT5NcEqvldFPbPpNUIagqZcwv3WDMFmZu/SiAW8UiUq+/wkJGK4gBW8t+XjHG3TfdBU8wgkEFt6y8BFxsyCAgDiryzoXHPBD8xeNM1gh1x1BrVCAomQ54MYxT24RYNqyS1Uq27uARcsKl2JyXioAYNq7zkHcaTzMToW5cqn7xfcONC0mJ3YNHHw3KVJBLBtbCcAWuMyPi1VxwzW+sFughu2fla14H8Tvo6wKD15sBuyJiVET9W3SDOpRWSz+kt+Fc9JvI5SVz+6rxmFqoeAyUrVDPFXXgbU5W8eY6cKuGQ==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 02/12] xen/arm: gic: implement helper functions for
 INTID checks
Thread-Topic: [PATCH v4 02/12] xen/arm: gic: implement helper functions for
 INTID checks
Thread-Index: AQHcF3/Ff+oSmGvjakq9bpLMhjgPlLR3+pEAgABF3AA=
Date: Thu, 28 Aug 2025 16:20:49 +0000
Message-ID: <76e7bc4c-8f7d-4ca8-9a13-9ff652f7a0b4@epam.com>
References: <cover.1756317702.git.leonid_komarianskyi@epam.com>
 <684757e6710826200bcc153e4c711b27483ee796.1756317702.git.leonid_komarianskyi@epam.com>
 <1221fa50-0e17-405e-88fe-c57db905fa4a@xen.org>
In-Reply-To: <1221fa50-0e17-405e-88fe-c57db905fa4a@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|PA6PR03MB10532:EE_
x-ms-office365-filtering-correlation-id: 7a3ffcc0-0227-4de1-c324-08dde64ed9ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?c3FGOUt5ZG9UVU9TZEd1R1FvQmFvTW54UmNHN2orZkhiMktpWTZLbEdEV282?=
 =?utf-8?B?OUJJUHNLQTR2SlBQVXpyTDlVUDZCeW1pVk50VENNdjNaVDlwenpta282cjB3?=
 =?utf-8?B?T296SGVvRy9NYTFiV3dmS1F4SzhnZXRHSUxuY1JVeGZleHZQRDNrOWNid01s?=
 =?utf-8?B?RWpIOHE1QTVmUStCcUxYMWYzQXNMc1dMR28yMWxpTjAxQlppRnVPSFVSa0hz?=
 =?utf-8?B?UDY0NFY3MjhPTjl0bzN4WHBxaUhTWWlmS0dNb2FZOU9ySVJidzkrOFlUZ29s?=
 =?utf-8?B?b2x4YTVVUHlNcFJVVVhjeWRGVFBTQVNkQnBBM1dDUHZ6VzJMWThYb245RGZF?=
 =?utf-8?B?Ti9vRlAza1hHT05FVHpNLy8rbEVlMGRyMnZEaERUb2tQdmdHdVMyV0lXakI0?=
 =?utf-8?B?VjFOdEEraEV6bmpNTGMwdlAxaVJySUFRRlhGOEUwRG03aUpQeGZESjRla2g0?=
 =?utf-8?B?REFueUdzSEhYMDZPZUo5VU4yQnlwQ2hYNG16RjRtMFBUdk9WQXUxSW1RSThF?=
 =?utf-8?B?NnVUa3JHY0dRRDFWU05zRmJ2WTRONVh1cE54ZmxmWS9GOGhraGpWSWJsUU1l?=
 =?utf-8?B?RjNiSXFzSTBYdjlkeWMweHRjOXJwNUViaCtENWU5aUx1WHA1cXAxRnhVSWw1?=
 =?utf-8?B?b3RUQ1oySUhMM1BLYVRHd2FYY1dZWEgxcmNVdkxycmsyWEpQalBPNXozaFNl?=
 =?utf-8?B?bCtNK2FORytxek1lRjd4Wk9jRUU5bDJVL2c2dDc3eEdYSzJPaDN3SVA0M3hj?=
 =?utf-8?B?bElZSTFhYzhVdlJ4UHdGSkpDOGh2Y0ptS1hKY05UbUhWczlaMy96UVBLT01W?=
 =?utf-8?B?dDlOVHhqaFA2UFlNekJJZm9NUURnRFkwT3ZBYWpBVlc3aW5Za2FKRmpoUnV3?=
 =?utf-8?B?Z2dQWGVDSE1RS2ZDUzNNK2FNZm0wYm5BMkpPSU5scE9sbG9rN3U1RGd4UG9u?=
 =?utf-8?B?RWtsQWMweXNQZ0tWdXZnVjJOKzNaZWpoRURVZVBxY3NEZUFlOUpZVHgrWnhR?=
 =?utf-8?B?UFdKSnhsRzl4T1A4UTVvSXl4TTE3Mnl6emIxQWEvdXphTEFNVXU5bE9qbVd5?=
 =?utf-8?B?T2duNDNBT2hrYzF5SmovdHVNTC8wMmFxQ1NVUTdmZmZkWXNyaGZjYnBGbE9G?=
 =?utf-8?B?RVJ1M0RKdjdXTFkreFdnUktJRURhcTRNWTNHKzdXcHQ1QXAxV1h1R3R2a2NK?=
 =?utf-8?B?NjNQZ2t0T25Gc2hYeklBL2dJaE1oVlVWazBXa0VVYU9sUnJqeUgvc0ZiakRs?=
 =?utf-8?B?ZU1uOEJUSHRrWEZQNnBlZW5xTXFtQkM4QndzNmpuQVBJK21CSUUyZVZBL2Zz?=
 =?utf-8?B?WWQrQkdTcGo1R3dCRjZ2OHVidGNIbzUvMlg2dmFzYnFFUEpOYzcxa1haV1cw?=
 =?utf-8?B?aStLYy8wRXdiaXU4Kys3bnA3Q3dMS0I2V1lpZkxaM1J1d1BYR21ONzM2b2FV?=
 =?utf-8?B?NzB3cmVhcnlMRlNRa1N5U1h6M29EQWtmcjJVRHZBQURGVnh3L0FSM3RraWUy?=
 =?utf-8?B?aWt4ZnlFYTJnZU5TS2laK0hRUloyZVNYSy9zS3pNZ2tBT05DUDlzRnJMQ29h?=
 =?utf-8?B?blNlWFRyNmwxcFZEVCtBa3dGREFNWk1wUmhPZnIzRjFTdkJIaVpyVExlT0lB?=
 =?utf-8?B?b3BMczNEcFNIeWdkVy90b2pSL0I1OWVtWjJhY0YxRE1PTGJ4NjljZlJ6QUpk?=
 =?utf-8?B?aWFqcFJlTityc2kvdmhoN3NZdlJmQ1RVRE1tQjFENXEraExDSjRaZ0xvOWNr?=
 =?utf-8?B?OEJOZ0pqM200WXJlTVZXUm43dXZVSS9sL29KK0w3aDlJSlRNdDJLYzVrdVlt?=
 =?utf-8?B?a1JkYThULzhIbHl1cmdjWk1lN2M1MFVGQk1iU09lNDEwaWUwdHhDWG5mNjRx?=
 =?utf-8?B?Y01GQ0ZYSDh5RVBMTXd6M0FXd1ZrejBkNmVhb0N6VVAzVzlOVElFWFFmZ1BB?=
 =?utf-8?B?RmV3aDlZUXpOR2Z4U0dQZzZhdjhrOUlERWo2TTVQNjAxSWhXY1UwUDZrUFRY?=
 =?utf-8?B?WlFGMDVVemFRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bTdnVXVpcVRzTGdqUVN0T1dVSVJUM0J0d01oM0JkVlBIRVdWK1hKZTBjdXdR?=
 =?utf-8?B?RnVDYUlWUFhOUjJ1UjNoLzNCMGkvOGw2TXA1UHVZQ2sxZ3NXQ2FZWTRBekJm?=
 =?utf-8?B?RDg5djlxbk8rZmttZC9QNUFwOU5aUEZHLzl4cS9YRkt0NngwbDVYU3VuaDVF?=
 =?utf-8?B?N0JqL0tQUEU5QVZEdzg5ZElHODdacWdvR281dHZVcU5vZml6M24wOUhnM0hm?=
 =?utf-8?B?eFl1eEN0SG5DZkx0TUJpK1Z1ZE9xZ0ZKQjJOcmpNa2NZem1mYUIyMGJCYnZU?=
 =?utf-8?B?Y1RXck9oUEhCZWs4TTBXY3QxZyt4aHVyVFgwUXRRSEs3eDJ3Q3dnMlQ0NGJa?=
 =?utf-8?B?SFZ2NDc4bDlhZW1qOFd1Skd1cWRDcGcwWlNXamwyK2E0dy9vdmFRNlk1TmxU?=
 =?utf-8?B?Y2s3b2RsVUxUc2pVVzJXbk9iVEQ2NDBMUUhzZ1ZlQjBmUTFOUDUxOGQyOWh6?=
 =?utf-8?B?QVhueHU3YnpSSk16YWgybWxrL3RBK1UxSlZheW9nRG9CMUtON2wrcFF5Qm9Y?=
 =?utf-8?B?Zy92c0dhTnBwTGV5bVFzR1pEaXkvUDQreStqZ3pUVFBGcGpFSSszS3g4ZmNS?=
 =?utf-8?B?NmVvbHgyTmx2c2lVSDRRd3FmOXRrc0kxaEVsTkRORjErMjF0MjRiRUJhQ2Rr?=
 =?utf-8?B?OWN5RWh3Qm9MUEFod1lKQ0EvVmdoeFAzdEpRM08wZUQ0N05DZFpkanJDM01Y?=
 =?utf-8?B?VmVLWHBJZ0srdGlIU01pR2lJdXcySVZqVms1a1RTNTJhdSszMnBPbkhmTmJ3?=
 =?utf-8?B?dXVTNVE2ajNCUkdod2dOQ0FoUHBiUzBHRnM3TlNzdEJRanpESEgvekFzY1Fq?=
 =?utf-8?B?SzNMTElVKysvYlVUVG1RNVZRcDNidUo5NjVXeW5aT0xjZE9RcFJ3QUNEUjg2?=
 =?utf-8?B?YkNXWDhaY2FWQTR2L2lvTFpzUHpEKzJ5a0N4L1JyMkYrK2lvbGh3eXRGQ0x1?=
 =?utf-8?B?S0F2dndaQjRSNDI3SGVIRXN5alppd25CM2t2K1Job1FRV3NxN1ZCTE0yUmVD?=
 =?utf-8?B?aG1kMXQ4ZjV5Vm5nb1pVSW52VEJaamF4QnJEdnJ1b28wSDVObXNkQ0RKRTFm?=
 =?utf-8?B?R3pvSnpZR0ltWG96dUIyenlTN2ZuckFGYSs4aVNObXNVd214SDJKem9qazht?=
 =?utf-8?B?ZnhIemVuOVdodDJwVkx1bXJWeGUzRUcwM2V4WHFXd1FLQzVNN2thOFZ4b2hO?=
 =?utf-8?B?b3kyTUk3M0NSQjgvNzlZY01IRFBoQmlDWUNEY3E0VURtb3dZNkdiME5Gb1J4?=
 =?utf-8?B?SlBkbEoyM01JcUJaUmNVb2wyYUYxeWtCWVhsQWo5MnhUYnVrTlR5aURua3JO?=
 =?utf-8?B?Smc1UWJkaDU1WUJ3WGNMMDdHblhwMHl3bFdYR0wyWmZNWWxTRlBZSUFxbmRS?=
 =?utf-8?B?dTQzSW5iMzJZNE4zYnMrcXFiczlZRitTa1dKRm9zNCtrZE4wMDZQeUw4QjRv?=
 =?utf-8?B?NTJMTzFrNzB2b1JuekdzRUZOdGlzRmlEV3pZZFA5cFc2b2U1TmhUTnVwUVYv?=
 =?utf-8?B?SUgybXRrZGozUzBNWXBnaEp4KzRJZklmSGhaYzVhdFhpWW5CZVZEUlZWRFVG?=
 =?utf-8?B?SFNaanlNYkp6dUlCS1ErTTNSdi81bWFrOHlIQ0NOejU4OSsrb1RVb2FXb3Q3?=
 =?utf-8?B?OGxhWnJsMG5Md0p1Y0JDdWZ0bU1TRUcrb3pHRUtUL2MrODRhZk1tYnFlQjZm?=
 =?utf-8?B?RjVGY2JzMkZZeWtYY05uWG8xeXNTdjFRQUUyc0RYUHhXN29reXNadmRyOExt?=
 =?utf-8?B?L2pJRVV4a3c0aXBJUnFrVVBYN2ZiZk1qNkErZVVISFFQY1FiNHhNdHIwSUgy?=
 =?utf-8?B?OVFPNjdHVENWa00vZDZJMXVUZ2gySnBzRzNBc01EcGVEc1ZIV1kwSXBFUUEz?=
 =?utf-8?B?Y0x5M3MrTndycW1yVkFCazIxdnhrR3hHQUlFS3dkbzFwakJ6Y3VJcExqdERq?=
 =?utf-8?B?eFp2ZnJ0SVNUS2hnTkJCRlJGeTlySGM5dmZoT2N1OCtKRi9Ea3d4dWpPNk95?=
 =?utf-8?B?RWZxcXUyOTdCVlNaVGFreW1qbDJiSnRPSTVsUHoyK0FxMEpBV2lyb1ZyNWRq?=
 =?utf-8?B?MW5LRURlWDhrQUdhSWdjaFMvVGlwVjlZeHNaS2hJTFZIUE0rVGxxeERwMUth?=
 =?utf-8?B?MU9NU2duaXMyNEY0VXl0Y3VWY2NpQUNJYW1MVE0wa2hienl6R09kQjhYb3ZY?=
 =?utf-8?Q?fmQ7pLCXGZURgNtXcCSGU/s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <526D8B1114244D468458BEB39E202373@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a3ffcc0-0227-4de1-c324-08dde64ed9ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 16:20:49.3943
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C+l6qvb6Ey4JnTxX8WVdeIPPwi6sHk63hbQoR7qOcG3oAUgr0X8OuXwU9Jr5QLh5v9ENCL5xEbthqfP1poDJjOZiIC2nvzJ0NWqMrZ3aDXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR03MB10532

SGkgSnVsaWVuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3Lg0KDQpPbiAyOC4wOC4yNSAx
NToxMCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBIaSBMZW9uaWQsDQo+IA0KPiBPbiAyNy8wOC8y
MDI1IDE5OjI0LCBMZW9uaWQgS29tYXJpYW5za3lpIHdyb3RlOg0KPj4gSW50cm9kdWNlZCB0d28g
bmV3IGhlbHBlciBmdW5jdGlvbnM6IGdpY19pc192YWxpZF9saW5lIGFuZA0KPj4gZ2ljX2lzX3Nw
aS4gVGhlIGZpcnN0IGZ1bmN0aW9uIGhlbHBzIGRldGVybWluZSB3aGV0aGVyIGFuIElSUQ0KPj4g
bnVtYmVyIGlzIGxlc3MgdGhhbiB0aGUgbnVtYmVyIG9mIGxpbmVzIHN1cHBvcnRlZCBieSBoYXJk
d2FyZS4gVGhlDQo+PiBzZWNvbmQgZnVuY3Rpb24gYWRkaXRpb25hbGx5IGNoZWNrcyBpZiB0aGUg
SVJRIG51bWJlciBmYWxscyB3aXRoaW4gdGhlDQo+PiBTUEkgcmFuZ2UuIEFsc28sIHVwZGF0ZWQg
dGhlIGFwcHJvcHJpYXRlIGNoZWNrcyB0byB1c2UgdGhlc2UgbmV3IGhlbHBlcg0KPj4gZnVuY3Rp
b25zLg0KPj4NCj4+IFRoZSBjdXJyZW50IGNoZWNrcyBmb3IgdGhlIHJlYWwgR0lDIGFyZSB2ZXJ5
IHNpbWlsYXIgdG8gdGhvc2UgZm9yIHRoZQ0KPj4gdkdJQyBidXQgc2VydmUgYSBkaWZmZXJlbnQg
cHVycG9zZS4gRm9yIEdJQy1yZWxhdGVkIGNvZGUsIHRoZSBpbnRlcnJ1cHQNCj4+IG51bWJlcnMg
c2hvdWxkIGJlIHZhbGlkYXRlZCBiYXNlZCBvbiB3aGV0aGVyIHRoZSBoYXJkd2FyZSBjYW4gb3Bl
cmF0ZQ0KPj4gd2l0aCBzdWNoIGludGVycnVwdHMuIE9uIHRoZSBvdGhlciBoYW5kLCBmb3IgdGhl
IHZHSUMsIHRoZSBpbmRleGVzIG11c3QNCj4+IGFsc28gYmUgdmVyaWZpZWQgdG8gZW5zdXJlIHRo
ZXkgYXJlIGF2YWlsYWJsZSBmb3IgYSBzcGVjaWZpYyBkb21haW4uIFRoZQ0KPj4gZmlyc3QgcmVh
c29uIGZvciBpbnRyb2R1Y2luZyB0aGVzZSBoZWxwZXIgZnVuY3Rpb25zIGlzIHRvIGF2b2lkDQo+
PiBwb3RlbnRpYWwgY29uZnVzaW9uIHdpdGggdkdJQy1yZWxhdGVkIGNoZWNrcy4gVGhlIHNlY29u
ZCByZWFzb24gaXMgdG8NCj4+IGNvbnNvbGlkYXRlIHNpbWlsYXIgY29kZSBpbnRvIHNlcGFyYXRl
IGZ1bmN0aW9ucywgd2hpY2ggY2FuIGJlIG1vcmUNCj4+IGVhc2lseSBleHRlbmRlZCBieSBhZGRp
dGlvbmFsIGNvbmRpdGlvbnMsIGUuZy4sIHdoZW4gaW1wbGVtZW50aW5nDQo+PiBleHRlbmRlZCBT
UEkgaW50ZXJydXB0cy4NCj4+DQo+PiBUaGUgY2hhbmdlcywgd2hpY2ggcmVwbGFjZSBvcGVuLWNv
ZGVkIGNoZWNrcyB3aXRoIHRoZSB1c2Ugb2YgdGhlIG5ldw0KPj4gaGVscGVyIGZ1bmN0aW9ucywg
ZG8gbm90IGludHJvZHVjZSBhbnkgZnVuY3Rpb25hbCBjaGFuZ2VzLCBhcyB0aGUgaGVscGVyDQo+
PiBmdW5jdGlvbnMgZm9sbG93IHRoZSBjdXJyZW50IElSUSBpbmRleCB2ZXJpZmljYXRpb24gbG9n
aWMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogTGVvbmlkIEtvbWFyaWFuc2t5aSA8bGVvbmlkX2tv
bWFyaWFuc2t5aUBlcGFtLmNvbT4NCj4+IFJldmlld2VkLWJ5OiBWb2xvZHlteXIgQmFiY2h1ayA8
dm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20+DQo+IA0KPiBXaXRoIG9uZSByZW1hcmsgYmVsb3c6
DQo+IA0KPiBBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCj4gDQo+
PiAtLS0NCj4+IENoYW5nZXMgaW4gVjQ6DQo+PiAtIHJlbW92ZWQgcmVkdW5kYW50IHBhcmVudGhl
c2VzDQo+PiAtIGFkZGVkIHJldmlld2VkLWJ5IGZyb20gVm9sb2R5bXlyIEJhYmNodWsNCj4+DQo+
PiBDaGFuZ2VzIGluIFYzOg0KPj4gLSByZW5hbWVkIGdpY19pc192YWxpZF9pcnEgdG8gZ2ljX2lz
X3ZhbGlkX2xpbmUgYW5kIGdpY19pc19zaGFyZWRfaXJxIHRvDQo+PiDCoMKgIGdpY19pc19zcGkN
Cj4+IC0gdXBkYXRlZCBjb21taXQgbWVzc2FnZQ0KPj4NCj4+IENoYW5nZXMgaW4gVjI6DQo+PiAt
IGludHJvZHVjZWQgdGhpcyBwYXRjaA0KPj4NCj4+IENoYW5nZXMgZm9yIFY0Og0KPj4NCj4+IENo
YW5nZXMgaW4gVjQ6DQo+PiAtIHJlbW92ZWQgcmVkdW5kYW50IHBhcmVudGhlc2VzDQo+PiAtIGFk
ZGVkIHJldmlld2VkLWJ5IGZyb20gVm9sb2R5bXlyIEJhYmNodWsNCj4+IC0tLQ0KPj4gwqAgeGVu
L2FyY2gvYXJtL2dpYy5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMiArLQ0KPj4gwqAgeGVu
L2FyY2gvYXJtL2luY2x1ZGUvYXNtL2dpYy5oIHwgOSArKysrKysrKysNCj4+IMKgIHhlbi9hcmNo
L2FybS9pcnEuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDIgKy0NCj4+IMKgIDMgZmlsZXMg
Y2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvYXJtL2dpYy5jIGIveGVuL2FyY2gvYXJtL2dpYy5jDQo+PiBpbmRleCBl
ODBmZTBjYTI0Li45MjIwZWVmNmVhIDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL2dpYy5j
DQo+PiArKysgYi94ZW4vYXJjaC9hcm0vZ2ljLmMNCj4+IEBAIC0xMTEsNyArMTExLDcgQEAgc3Rh
dGljIHZvaWQgZ2ljX3NldF9pcnFfcHJpb3JpdHkoc3RydWN0IGlycV9kZXNjIA0KPj4gKmRlc2Ms
IHVuc2lnbmVkIGludCBwcmlvcml0eSkNCj4+IMKgIHZvaWQgZ2ljX3JvdXRlX2lycV90b194ZW4o
c3RydWN0IGlycV9kZXNjICpkZXNjLCB1bnNpZ25lZCBpbnQgcHJpb3JpdHkpDQo+PiDCoCB7DQo+
PiDCoMKgwqDCoMKgIEFTU0VSVChwcmlvcml0eSA8PSAweGZmKTvCoMKgwqDCoCAvKiBPbmx5IDgg
Yml0cyBvZiBwcmlvcml0eSAqLw0KPj4gLcKgwqDCoCBBU1NFUlQoZGVzYy0+aXJxIDwgZ2ljX251
bWJlcl9saW5lcygpKTsvKiBDYW4ndCByb3V0ZSBpbnRlcnJ1cHRzIA0KPj4gdGhhdCBkb24ndCBl
eGlzdCAqLw0KPj4gK8KgwqDCoCBBU1NFUlQoZ2ljX2lzX3ZhbGlkX2xpbmUoZGVzYy0+aXJxKSk7
LyogQ2FuJ3Qgcm91dGUgaW50ZXJydXB0cyANCj4+IHRoYXQgZG9uJ3QgZXhpc3QgKi8NCj4gDQo+
IEFzIHlvdSBhcmUgdG91Y2hpbmcgdGhlIGxpbmUuIEl0IGlzIG92ZXIgODAgY2hhcmFjdGVycy4g
Q2FuIHlvdSBtb3ZlIHRoZSANCj4gY29tbWFuZCBpbiBhIHNlcGFyYXRlIGxpbmU/DQoNClN1cmUs
IEkgd2lsbCBmaXggZm9ybWF0dGluZyBpbiBWNS4NCg0KPiANCj4+IMKgwqDCoMKgwqAgQVNTRVJU
KHRlc3RfYml0KF9JUlFfRElTQUJMRUQsICZkZXNjLT5zdGF0dXMpKTsNCj4+IMKgwqDCoMKgwqAg
QVNTRVJUKHNwaW5faXNfbG9ja2VkKCZkZXNjLT5sb2NrKSk7DQo+IA0KPiBDaGVlcnMsDQo+IA0K
DQpCZXN0IHJlZ2FyZHMsDQpMZW9uaWQNCg==

