Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A88A70601
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 17:05:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926652.1329489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx6mE-0005en-5j; Tue, 25 Mar 2025 16:05:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926652.1329489; Tue, 25 Mar 2025 16:05:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx6mE-0005cW-32; Tue, 25 Mar 2025 16:05:18 +0000
Received: by outflank-mailman (input) for mailman id 926652;
 Tue, 25 Mar 2025 16:05:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uFHn=WM=epam.com=Oleksandr_Tyshchenko@srs-se1.protection.inumbo.net>)
 id 1tx6mC-0005cQ-KK
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 16:05:16 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2608::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f054a4e4-0992-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 17:05:15 +0100 (CET)
Received: from PR3PR03MB6412.eurprd03.prod.outlook.com (2603:10a6:102:7d::8)
 by DB3PR0302MB9133.eurprd03.prod.outlook.com (2603:10a6:10:428::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 16:05:13 +0000
Received: from PR3PR03MB6412.eurprd03.prod.outlook.com
 ([fe80::2887:9068:38f6:8340]) by PR3PR03MB6412.eurprd03.prod.outlook.com
 ([fe80::2887:9068:38f6:8340%7]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 16:05:12 +0000
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
X-Inumbo-ID: f054a4e4-0992-11f0-9ea3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ity8eBcic7W8R/af0fJ62N+Wp49or8BDBg+NeUUHf2O6bZVxNKHitdEs3Bz/K4GfF8VcIhpyWWU9CYaliYzxJs8s7E3aEK9kHzY372TuU4CS+HGwkHSf+CLtWV2jE10J83AJqNy+55rhCYoe3K2uMtsVdb/YyK9VyGWzsSX4E+i+nGznNyv5J1NE8hRetpSKtGvm8NAJwRA47vXSan5AeiaJNYWHH5rHDNhgWmWsYvp4uaCSFNiiPNqYrhqRlxfrnc/7OnWy8YVWqUk5mKWb/WWO/dWf6bQT1VZYvicv/4kGaq3DpvQv/BiCp3bte+UQxuIduxTExxNn4QgSthqJkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n+xLwXX1S1PCgI2QGprnuobsNb2l5t9uLiOux5CQpg8=;
 b=xbWEw2Ucl76lgijTK8Ex2UGf1esZGoyynx5AmSaBg22jzzptqAwYCPfQTyXsNmnYpbqdqD8G87da0AXVR9fNRZHbboUebGmK/9Om++4E0WyGW7ZxtZ6SSnqjADQWWk7HRii6lV36ugZqaPfh97bvzc0WBWkJAsVMCiRz9CMsl5MaGvEqrPJafVJJAyEsCqkWLXqiYo5M/GWFYbv9RqpF9Abt6ewz2XbNfKXaK3VbAZtq3lKT+QL9Ve5nbgNIdtzPQED+nR6HkyVaz72DMs70JgUC64iI1BV3ip/TM3ivLVQGOox5FGzTbDGd7nK3yPFT2pgTgkIzy74OgCMm3t/uwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+xLwXX1S1PCgI2QGprnuobsNb2l5t9uLiOux5CQpg8=;
 b=VQq77x7gX5x+6oTWkqaxCcIeTng5exZU7Ma5oCW/cYTC55Rwh3QINX/fL0MOrYZZI3/pcQuf5f4hN2SPSYoNUYuTks6wpkc1U5zwQ0zdMbshK/Z0j7/v3kC0eawGYQE02cw4ZvIofgrwKJ40xFe7wG0uiyYFa5YWiJuCEY6LsXmGYV8NJVpMBP65RA8rBIyefgzC+VSTnjArfA4zxneUKx0UJPzGKw1ys3/LP12QcH4Uq5fBWR7R4GQ4BROo81SaOAn7/0+SebbBvGazzyR9F6rc0eqovbLlBRtDnGoBfr8IkHYeMbkhZqn/v2Jp/1QuO8XCF6JHnecMxqQfAr6NYA==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Julien Grall <julien@xen.org>, "Orzel, Michal" <michal.orzel@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH V2] xen/arm: Initialize acpi_disabled to true during
 declaration
Thread-Topic: [PATCH V2] xen/arm: Initialize acpi_disabled to true during
 declaration
Thread-Index: AQHbnZfMrs+h0o/uEkuTNWO41qxIcLOD+IUAgAADaoCAAAM8AIAABQEA
Date: Tue, 25 Mar 2025 16:05:12 +0000
Message-ID: <24809d8d-5d95-4527-89e1-e82889d58e3f@epam.com>
References: <20250325150842.2015968-1-oleksandr_tyshchenko@epam.com>
 <9b96395c-ca88-483b-be06-b7768b552983@xen.org>
 <4e048dad-bd12-4526-ae62-f424bdb8271b@amd.com>
 <db47de86-b2c1-4860-9212-49c051e1bebd@xen.org>
In-Reply-To: <db47de86-b2c1-4860-9212-49c051e1bebd@xen.org>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3PR03MB6412:EE_|DB3PR0302MB9133:EE_
x-ms-office365-filtering-correlation-id: 5d840703-a304-42b3-7d39-08dd6bb6d342
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SWZSTS9nRGpwTWhjTGVxOWVSSkhyd3NPbzRjL1NWRE1ac0JvcGpIdFNFMHVW?=
 =?utf-8?B?SHRWUVdxc2lrRjRXNUhHVVEvbDY1d25VWlM2bmZ2QXovRW1XS1lYODl3T05r?=
 =?utf-8?B?a0xxMURyV21kZXlQdGlJRWNTejNGQW9pZWt2NSt6SGxiK2x3U1o4T2J0Sy9X?=
 =?utf-8?B?cGdUczZTRXZEWFp1WTEwWlVIaEVheVVMQWRhU29naGRYVk80TGlGQ25NQWdC?=
 =?utf-8?B?bEhUaW1pMDNBeDBHYmloNVZBcGFHTzRRbWlsVkxkWU41VGpaVkkrT1JBZTNh?=
 =?utf-8?B?bG5BUHplVk9TWnliL1VmRlFkK0pOUXprQ1NYZXIvVzBRZHBDUmo1cXd5Qko5?=
 =?utf-8?B?Mnc0WjZrR0hxU0kyOURtU1FETkFJdTh0YnNYSFdTcHJHQnFSTXBMelZLMFRm?=
 =?utf-8?B?bXJVakEyaEJEZU4zU0dKcHJ6Mm5xSjNZa2U3ZHRyK0o4UDAzRTFsOGVWWjNB?=
 =?utf-8?B?SUtkWjVnSkZIa1gxdnVwNmZmaG9PU0pwMWVsMTdaOUZUNkJ1aGlsR3Z0RTQ2?=
 =?utf-8?B?RFlZVkg3cG1pY3ZpNXprNkVXU3dZejgvR0Z2RXRxN3JtUC9YVktRb3B6d0lw?=
 =?utf-8?B?citRU0F5Sjl0TlNLdzZvMStQUXdwT1NYRVFodnBjVzhXWmVERTJad0NXaWl2?=
 =?utf-8?B?cXkzbnFBYnZteWo2K1dVdjJsd0NldFdOTUppeU5VMGNndWRxbVB1d1VxSTJD?=
 =?utf-8?B?R3pkYUVRVlpmd2hQY0g2SHBrU2hrblpvSjBFbFNCTXNkTzVPV0ZySWp2eWtH?=
 =?utf-8?B?a3E1Q0Q0VHpzaHhtSWRFVmlkUSt6TzY2TnQ2ZUp2VDVhSHpHV2FRRHRWUjIy?=
 =?utf-8?B?V3o5SjhJclA5Q3p3azV5c3BSZE9MZkJySGRNSElnaVVRZytiVmdjaGp2ZzlQ?=
 =?utf-8?B?eG9xZmF2Y0xMcHFFSzhjZjRZcXRZYmF5MU1FZG5aTlNjMVJmNkJpRTRsZnpC?=
 =?utf-8?B?Uzl2UVZ6Q2lZSjJVQnV4TWVqR1UzaGdqVC9IeXN2TGFVeXhWK2h4YzY1dmVF?=
 =?utf-8?B?ZUxUdmhJWnpvbkkrZmdGaUJEU0tOQzFwTTZxQ2psT1VpZFU1d0ZyRnplMWY5?=
 =?utf-8?B?L00wK2NBYnVxQXk3cXlybGd0eEFsZ0J6MmVMWmpqdTYzaU56RnBrS0hhTC93?=
 =?utf-8?B?Nmd0QWdyRDVLeU1RNWtVQjJUcjhSVGtvVm1abG1uNTNOWkd1VUxDR0ROdjdE?=
 =?utf-8?B?V3d4aUF1ODFRa2IyTHNmcjJ1a0c2OFM3TDFaeEt6bVcrUStuNkhRbFZnVENQ?=
 =?utf-8?B?OHpRMXdEbkhqakppZktJZXhEaWFEUEJYd2FTQVg3bGoyVUhBQUkyM3hza2or?=
 =?utf-8?B?Q3h2SEdRMjc1cGZNTTVxdVZueGtxdlp2dFdNS1ROVlBFajBVb0hETUlLc3Zh?=
 =?utf-8?B?Qk53NE5qTXVheVNhQXNtTEJUVkUwOHhFSEhVTWgwejlUQW0vS0N1bVJIZUxn?=
 =?utf-8?B?T0lONFU5VDUwWU9GYjN3azFXMW1VeFRpV084OTdjR1ZoZ0Z3cUgwRU13dGFj?=
 =?utf-8?B?Nk11dGpnaS9zaWwwbDZ6eHV4TGwzMWpFd01uY3Z2ajJqOFEzbzRHcllTNWYy?=
 =?utf-8?B?RUpJNDhjZ0VPMXZUeHFMQnU2YVFUMitiMjArOWJlZzcrSVQ2WFVsMzFQZy9y?=
 =?utf-8?B?YmJaV21WVERKa0NDejl3bktzY2RJWWRCU2NkNW9iN3BEZk1lckliZVo5cUpU?=
 =?utf-8?B?RXlyK0FmRkw1TWkzMUVpM2dOM09ySHg5Yy90Tkh4b2Y1bW9FdUNibmR1bUl2?=
 =?utf-8?B?RkJPVWw1eURPblAvUytNQzI5Yk43L2c4Y3hnckt2TkJnZnFYNi81TUlWQzFl?=
 =?utf-8?B?cXdKajJjSmRCQnZ1N2piUFhTWC9UVG5PUDdNVHJQNDlwNkJCZ3NRZG1YZ1Av?=
 =?utf-8?B?d1dEWkRteUdwd3R0VEI1UjI4UHdNV0RhUnZLemdSZVc0V0hhYkcxajRZWGxk?=
 =?utf-8?Q?pmluEgwHzBbvaFwE2GHmCnGlkTjYfUgT?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR03MB6412.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S3VWSXhQRXpXQk9OdFdpNWQ1d2hkUFRJR1p6aTllaitEaGFwbEQ3bHM2dzh0?=
 =?utf-8?B?V3hrdjc3dDVoaldoak1vTHU3UnROaWNzTUs0cmpOUDJMekhiZStuRFYyOUpx?=
 =?utf-8?B?U2hPbWFpNnBLSFAwWm56U0Y2V0hsTnUva0RKY3BFVk1CMXI2VU9ZNVV3Mkdl?=
 =?utf-8?B?TFNMQmFhYnZpV2FGelpISlR0WThEQW1pYjVudXJkeEVodzJqcVBNUTFyckk4?=
 =?utf-8?B?bjl6d2hNZXRVWjBKeFRBRVdjZ2U4NTdWSmNCUXFtSDBZckt0Y3M5ekk0SkQ2?=
 =?utf-8?B?NG5ScFo2LzZMenc0N2R2VDV4Mnc4cHZIZi9SYjZDa3FKUkErSEZuZ0hGWDh0?=
 =?utf-8?B?M2VxOGYxZ0FrZFdocXNHUHNSYVA2OFdXMEgwSVpka3FoMVYrVlM2aGJ3cEcz?=
 =?utf-8?B?Vm0rWFdESzZFY1p5Q1RpNDVWSTI3bWNUWkVhK2ZZU3FMYW1uclVvYngvcEhu?=
 =?utf-8?B?MlA5ejZVWDQwaU1ueWFOQVFUT2h0bUxVZEljNE05RTRteG82V3ljY3JQODNJ?=
 =?utf-8?B?eHNxcGN5VHF5MEFyS3h0a25zNGkwZDdBVEJPWVhuRnNuK2lVUTRPYlVHcDhY?=
 =?utf-8?B?QVhYV0MyKy8rb01kbkNib0Rwem5sQzJOQzBwUTRSVHBIQWFYdk9oelBYRFBm?=
 =?utf-8?B?ZlJhcmloQ0lhOUNDMU9zK3kwVGFqb0lLT0VLQ1FVVGU2YmFncHFnU0c5NU9z?=
 =?utf-8?B?bzBwRjZYL1lQeTBSOUptQm5sZHJrcnNJMWxURDBHQ0tJa01mclE1RXJ1STYr?=
 =?utf-8?B?M1F1ZXBCbWxsZTU1Nkg3RkdWa2pSZmpEQXZQSTNudmt2dnE3dXNvb0pLQXJ4?=
 =?utf-8?B?enJSZzRQblFyRlo2ZCtjSnRSS0pxbWpObHo1Z05wTm56MFJxMWhKWkxock10?=
 =?utf-8?B?TloxRDV0ckl6eG1BUnNzc0tsN0VUVkZScVIvMWVlbVZ3TG9QK0krV0JSbUJF?=
 =?utf-8?B?dDQ2S2U3VTZ5Q2toelZSeW8rWEtLYmFSbk9lTEp4ZXFJWGRCR054bWRLNnZS?=
 =?utf-8?B?eDVLelVGZThka3RGTDJnT29WSld5RUVrRVZVdnY0VHFZVnZUSElyY2Rnb1Fz?=
 =?utf-8?B?UGFVNGNqbm5WZlprcERweVFZOVFiclgxaVhaREZZSHp6ald2UlFQOFZzN1V6?=
 =?utf-8?B?Z3Mwamo1Z1FJcExoUlBPRlMwRTRXaWNUSG9vaURjbFVKVGNsMWl6TzhZRzha?=
 =?utf-8?B?a1lCVjdRTFVEd3pvNDRtTmJ2T0FmR0VYUElmbjNLOGgxeWdQUU1BTTBvNkg4?=
 =?utf-8?B?U1Q4MzhpczdXWU9nKzhXUVhlc2ZlM1FudTViT0JadUd4N240Sy82MDQ4bnMv?=
 =?utf-8?B?M0N2Y1pNbnZPL2pObHJaYytkWkVuRG1TWmphcmg3S3RhOUxtamg4SUV6L2JJ?=
 =?utf-8?B?UHZ2cEVxM1hUSE9VV3U4MXdKdEFGeEQ0RkQ5MlgwVmtpUlVmazdXN21BbEht?=
 =?utf-8?B?ZnhEZG5Qd1ZzNlpMc3UzeTFUMlI0L2FVczJTOC9wQ1p1V2RubmJWRStPV1pH?=
 =?utf-8?B?SFRYTGFNWmpWYjVxVmdZNE5iRk56SHNkdHdORzF2K3lHU29ZU0xQcDZlQ21r?=
 =?utf-8?B?NjRseUZ6cHR2SDRIQ0RYbCtZbEd5ZklPUnFpWEd2bXlkcVB3V0ZsM1pmTWpu?=
 =?utf-8?B?azBCSGtxQ1BUWFZGUHBmREtkdzhTa3JTVGtJWFRqSWN4M09TODVKcWZIWk9a?=
 =?utf-8?B?VWlHejUwRHdDNWt3b1JCMTMvTW95WEEyWVFxRldYY0xxRGFtSEtxckxPSmJJ?=
 =?utf-8?B?eVBsWWJ4L0E1alhuUzVkdkk2U3BEc2VHSVpUeVlXWUUzRFVnRHFKd0ZuSjcy?=
 =?utf-8?B?Ym5YcXdSMDlSUjNKSjJxbkVoTGRzaTRnMlZKVVdvWnhudWRQWEVWL1BnMnVZ?=
 =?utf-8?B?a2xEUkZIMVJQVk1sY1ZtbXhtMzUzdGVtZDVjUElrKzFORjdMUXoyQkJ5KzFE?=
 =?utf-8?B?amtPcDZ4Y1pFY1p0UlhDbG9QWXEybURBd00rLzRBQ1pZZHVKTFFOamg3Nzh4?=
 =?utf-8?B?aWh0ZVBVdXd3MkpGeEJOMzlFQkE1VngrQ21aQ0dvalUvaGY3QXhkQzRhWUpF?=
 =?utf-8?B?aklmdTdldU9NaitFTHUxYy9yUXhaUm80dzBkR0RwbzV4ZHkrV3crSGZudDcz?=
 =?utf-8?B?VWZhRERWK0lNQWxCNnFIakZoNGk3emdtYlljUWpOSlhvTHEzUzNjWkE2c20x?=
 =?utf-8?Q?zTsCa3GYQxjkqLUIGiZxJaw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <56096ED5814E934E8BA843AF08334C2A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3PR03MB6412.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d840703-a304-42b3-7d39-08dd6bb6d342
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 16:05:12.8561
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V5Q6ah74L3P5S6LIi5hTRi2CuyKNsMCqaL8uWYFjmkKZEWb7mLgcsNeh6r1RTsVHITgMTQzvy/m91jq/TUTTjWSkjeuqPw2MAHkCUGi89nw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9133

DQoNCk9uIDI1LjAzLjI1IDE3OjQ3LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQoNCkhlbGxvIEp1bGll
biwgTWljaGFsLg0KDQoNCj4gSGkgTWljaGFsLA0KPiANCj4gT24gMjUvMDMvMjAyNSAxNTozNSwg
T3J6ZWwsIE1pY2hhbCB3cm90ZToNCj4+DQo+Pg0KPj4gT24gMjUvMDMvMjAyNSAxNjoyMywgSnVs
aWVuIEdyYWxsIHdyb3RlOg0KPj4+DQo+Pj4NCj4+PiBIaSBPbGVrc2FuZHIsIE1pY2hhbCwNCj4+
Pg0KPj4+IE9uIDI1LzAzLzIwMjUgMTU6MDgsIE9sZWtzYW5kciBUeXNoY2hlbmtvIHdyb3RlOg0K
Pj4+PiBPbiB0aGUgZGV2aWNlLXRyZWUtYmFzZWQgQXJtNjQgc3lzdGVtLCBpZiBYZW4gaXMgYnVp
bHQgd2l0aA0KPj4+PiBDT05GSUdfQUNQST15LCBDT05GSUdfU1RBVElDX01FTU9SWT15LCBhbmQg
dGhlIHN0YXRpYyBtZW1vcnkgcmFuZ2UNCj4+Pj4gaXMgcHJvdmlkZWQgaW4gdGhlIGhvc3QgZGV2
aWNlIHRyZWUsIHRoZSBCVUcgaXMgdHJpZ2dlcmVkIGluDQo+Pj4+IGNvbW1vbi9wYWdlX2FsbG9j
LmMgZHVyaW5nIFhlbidzIGVhcmx5IGJvb3QuIFRoZSBCVUcgb2NjdXJzIHdoZW4NCj4+Pj4gdGhl
IGZpcnN0IHBhZ2UgZnJvbSB0aGUgc3RhdGljIHJhbmdlIGlzIGZlZCB0byB0aGUgZG9tYWluDQo+
Pj4+IHN1Yi1hbGxvY2F0b3IgYW5kIGZpbmFsbHkgZW5kcyB1cCBpbiBtYXJrX3BhZ2VfZnJlZSgp
Lg0KPj4+PiBUaGUgcGctPmNvdW50X2luZm8gJiBQR0Nfc3RhdGUgaXMgbm90IGluIHRoZSBzdGF0
ZSB0aGF0DQo+Pj4+IHRoZSBjb2RlIGV4cGVjdHMgdG8gc2VlIHRoZXJlLg0KPj4+Pg0KPj4+PiAo
WEVOKSBDaGVja2luZyBmb3IgaW5pdHJkIGluIC9jaG9zZW4NCj4+Pj4gKFhFTikgQ2hlY2tpbmcg
Zm9yICJ4ZW4sc3RhdGljLW1lbSIgaW4gZG9tYWluIG5vZGUNCj4+Pj4gKFhFTikgUkFNOiAwMDAw
MDAwMDQwMDAwMDAwIC0gMDAwMDAwMDBiZmZmZmZmZg0KPj4+PiAoWEVOKQ0KPj4+PiAoWEVOKSBN
T0RVTEVbMF06IDAwMDAwMDAwNDMyMDAwMDAgLSAwMDAwMDAwMDQzMzQzZmZmIFhlbg0KPj4+PiAo
WEVOKSBNT0RVTEVbMV06IDAwMDAwMDAwNDM0MDAwMDAgLSAwMDAwMDAwMDQzNDAyZmZmIERldmlj
ZSBUcmVlDQo+Pj4+IChYRU4pIE1PRFVMRVsyXTogMDAwMDAwMDA0MmUwMDAwMCAtIDAwMDAwMDAw
NDMxMTFmODIgUmFtZGlzaw0KPj4+PiAoWEVOKSBNT0RVTEVbM106IDAwMDAwMDAwNDA0MDAwMDAg
LSAwMDAwMDAwMDQyY2ZmZmZmIEtlcm5lbA0KPj4+PiAoWEVOKcKgIFJFU1ZEWzBdOiAwMDAwMDAw
MDUwMDAwMDAwIC0gMDAwMDAwMDA1ZmZmZmZmZg0KPj4+PiAoWEVOKQ0KPj4+PiAoWEVOKSBDTURM
SU5FWzAwMDAwMDAwNDA0MDAwMDBdOmRvbVUwIGNvbnNvbGU9dHR5QU1BMA0KPj4+PiAoWEVOKQ0K
Pj4+PiAoWEVOKSBDb21tYW5kIGxpbmU6IGNvbnNvbGU9ZHR1YXJ0IGNvbnN3aXRjaD1heA0KPj4+
PiAoWEVOKSBwZyBNRk4gNTAwMDAgYz0weDIxODAwMDAwMDAwMDAwMDAgbz0wIHY9MCB0PTANCj4+
Pj4gKFhFTikgWGVuIEJVRyBhdCBjb21tb24vcGFnZV9hbGxvYy5jOjE0NzQNCj4+Pj4gW3NuaXBd
DQo+Pj4+DQo+Pj4+IFRoZSBwcm9ibGVtIGlzIHRoYXQgdGhlIHN0YXRpYyByYW5nZSBnZXRzIG1p
c3Rha2VubHkgdW5yZXNlcnZlZA0KPj4+PiBpbiBwb3B1bGF0ZV9ib290X2FsbG9jYXRvcigpIGFu
ZCByZWFjaGVzIGluaXRfYm9vdF9wYWdlcygpLg0KPj4+PiBUaGlzIGhhcHBlbnMgc2luY2UgYnkg
dGhlIHRpbWUgdGhlIHBvcHVsYXRlX2Jvb3RfYWxsb2NhdG9yKCkNCj4+Pj4gaXMgZXhlY3V0ZWQs
IHRoZSBldmFsdWF0ZWQgaW4gZndfdW5yZXNlcnZlZF9yZWdpb25zKCkNCj4+Pj4gYW4gYWNwaV9k
aXNhYmxlZCB2YXJpYWJsZSBpcyBzdGlsbCBmYWxzZSBhbmQgYXMgdGhlIHJlc3VsdA0KPj4+PiB0
aGUgZHRfdW5yZXNlcnZlZF9yZWdpb25zKCkgd2hpY2ggc2hvdWxkIHNpbXBseSBza2lwIHRoYXQg
c3RhdGljIHJhbmdlDQo+Pj4+IGRvZXMgbm90IGdldCBjYWxsZWQuIFRoZSBhY3BpX2Rpc2FibGVk
IHdpbGwgYmUgc2V0IHRvIHRoZSBhY3R1YWwgdmFsdWUNCj4+Pj4gKGluIG91ciBjYXNlIGl0IGlz
IHRydWUpIGxhdGVyIG9uIGluIGFjcGlfYm9vdF90YWJsZV9pbml0KCkuDQo+Pj4gwqAgPiA+IFRo
ZSBpbXBvcnRhbnQgcXVlc3Rpb24gaXMgd2h5IGFjcGlfZGlzYWJsZWQgaXMgZmFsc2UgYnkgdGhl
IHRpbWUNCj4+IFNpbXBseSBiZWNhdXNlIGl0J3MgYSBzdGF0aWMgYm9vbCB2YXJpYWJsZSB3aXRo
IG5vIGFzc2lnbmVkIHZhbHVlIGkuZS4gDQo+PiBnZXRzDQo+PiBkZWZhdWx0ZWQgdG8gZmFsc2Uu
IEFuZCBpdCBzdGF5cyBhdCBkZWZhdWx0IHZhbHVlIHVudGlsIA0KPj4gYWNwaV9ib290X3RhYmxl
X2luaXQoKQ0KPj4gY2FsbCB0aGF0IGNhbm5vdCByZWFsbHkgYmUgbW92ZWQgYmVmb3JlIHNldHVw
X21tKCkuDQo+Pg0KPj4+PiBzZXR1cF9tbSgpIGlzIGV4ZWN1dGVkLiBXaXRoIENPTkZJR19BQ1BJ
PW4gaXQgaXMgYSBtYWNybyB0aGF0IGlzIGFsd2F5cw0KPj4+PiB0cnVlLCBidXQgd2l0aCBDT05G
SUdfQUNQST15IGl0IGlzIGEgYm9vbGVhbiB0aGF0IGlzIGZhbHNlIGZyb20gdGhlIA0KPj4+PiB2
ZXJ5DQo+Pj4+IGJlZ2dpbmluZywgZXZlbiB0aG91Z2ggdGhlIGVudGlyZSBhY3BpX2Jvb3RfdGFi
bGVfaW5pdCgpICh3aGljaCBpcyANCj4+Pj4gY2FsbGVkDQo+Pj4+IGFmdGVyIHNldHVwX21tKCkp
IGlzIHdyaXR0ZW4gd2l0aCB0aGUgYXNzdW1wdGlvbiB0aGF0IEFDUEkgaXMgb2ZmIGJ5IA0KPj4+
PiBkZWZhdWx0DQo+Pj4+IGF0IHRoZSBzdGFydC4gU28sIGluaXRpYWxpemUgYWNwaV9kaXNhYmxl
ZCB0byB0cnVlIGR1cmluZyBkZWNsYXJhdGlvbg0KPj4+PiBpZiBDT05GSUdfQUNQST15IHRvIGF2
b2lkIGFuIGlzc3VlIGFuZCBtYXRjaCB0byBhY3BpX2Jvb3RfdGFibGVfaW5pdCgpLg0KPj4+DQo+
Pj4gV2hpbGUgSSBhZ3JlZSB0aGF0IGFjcGlfZGlzYWJsZWQgc2hvdWxkIGJlIGZhbHNlLiBJdCBm
ZWVscyBsaWtlIGEgYml0IG9mDQo+PiBZb3UgbWVhbnQgdHJ1ZSAoPykgaS5lLiBBQ1BJIGRlZmF1
bHQgb2ZmIG5vdCB0byBtYWtlIGFueSBhc3N1bXB0aW9ucyANCj4+IHdoZXRoZXINCj4+IGl0J3Mg
cmVhbGx5IG9uL29mZiB3aGljaCBjYW4gb25seSBiZSBkZXRlcm1pbmVkIGluIA0KPj4gYWNwaV9i
b290X3RhYmxlX2luaXQoKS4gSQ0KPj4gdGhpbmsgd2Ugc3RpbGwgbmVlZCB0aGlzIHBhdGNoIHRv
IG1hdGNoIHRoZSBjb2RlIGV4cGVjdGF0aW9uLg0KPiANCj4gSSBhZ3JlZSB3aXRoIHRoYXQuDQo+
IA0KPj4NCj4+PiBhIHdvcmthcm91bmQgZm9yIHRoZSBpc3N1ZSB5b3UgYXJlIHRyeWluZyB0byBz
b2x2ZSBoZXJlLiBJZg0KPj4+IGZ3X3VucmVzZXJ2ZWRfcmVnaW9ucygpIGRvZXNuJ3Qgd29yayB3
aXRoIEFDUEkgZW5hYmxlZCwgdGhlbiBpdCBpcyBzdGlsbA0KPj4+IGEgcHJvYmxlbSBhZnRlciB5
b3VyIHBhdGNoLg0KPj4gSSBkb24ndCB1bmRlcnN0YW5kLiBJdCBkb2VzIHdvcmsgd2l0aCBBQ1BJ
IGVuYWJsZWQgcHJvdmlkZWQgdGhhdCBpdCdzIA0KPj4gaW5kZWVkDQo+PiBlbmFibGVkLiBXaGVu
IGJvb3Rpbmcgd2l0aCBBQ1BJLCByZXNlcnZlZCBtZW1vcnkgcmVnaW9ucyBhcmUgbm90IHVzZWQg
DQo+PiAtIHdlIGV2ZW4NCj4+IGhhdmUgYSBjb21tZW50IGluIHN0cnVjdCBib290aW5mby4NCj4g
DQo+IE15IGNvbmNlcm4gaXMgdGhhdCBzb21lIHJlZ2lvbiBtYXkgaGF2ZSBiZWVuIHJlc2VydmVk
IGFuZCB1c2VkIHNvbWV3aGVyZSANCj4gZWxzZS4gQnV0IHRoZW4gYSBzZWNvbmQgY2FsbCB0byBm
d191bnJlc2VydmVkX3JlZ2lvbnMoKSB3b3VsZCBmcmVlIHRob3NlIA0KPiByZWdpb25zIGFuZCBw
b3NzaWJseSB0cmlnZ2VyIGFub3RoZXIgQlVHLi4uDQo+IA0KPj4gVGhlIGlzc3VlIGhlcmUgaXMg
dGhhdCBhY3BpX2Rpc2FibGVkIGlzIHNldA0KPj4gdG8gZmFsc2UgaS5lLiBpbmNvcnJlY3RseSB0
aGVyZSBpcyBhc3N1bXB0aW9uIHRoYXQgQUNQSSBpcyBlbmFibGVkIGJ5IA0KPj4gZGVmYXVsdA0K
Pj4gYW5kIGNhbGxpbmcgZndfdW5yZXNlcnZlZF9yZWdpb25zKCkgcHJpb3IgdG8gYWNwaV9ib290
X3RhYmxlX2luaXQoKSANCj4+IHdvcmtzIGFzDQo+PiBsb25nIGFzIHdlIHJlc3BlY3QgdGhlIGV4
cGVjdGVkIGRlZmF1bHQgdmFsdWUuDQo+IA0KPiBUaGlzIGlzIGFyZ3VhYmxlIHdoZXRoZXIgaXQg
aXMgYSBidWcgb3Igbm90LiBUaGUgdmFsdWUgb2YgYWNwaV9kaXNhYmxlZCANCj4gaXMgdGhlIHNh
bWUgYXMgb24geDg2LiBUaGUgYXNzdW1wdGlvbiBpcyB0aGF0IHdoZW4gQ09ORklHX0FDUEk9eSwg
dGhlbiANCj4gQUNQSSBpcyB1c2VkIHVubGVzcyBpdCBpcyBleHBsaWNpdGVseSB0dXJuZWQgb2Zm
IGFmdGVyd2FyZHMuDQo+IA0KPj4NCj4+Pg0KPj4+IEZ1cnRoZXJtb3JlLCB3aGF0IGhhcHBlbiBp
ZiB3ZSBkZWNpZGUgdG8gdXNlIEFDUEkgYWZ0ZXJ3YXJkcz8gV291bGRuJ3QNCj4+PiB0aGlzIG1l
YW4gdGhhdCB0aGUgc3RhdGljIHJlZ2lvbnMgd291bGQgYmUgcmVzZXJ2ZWQgZXZlbiBpZiBBQ1BJ
IGRvZXNuJ3QNCj4+PiB1c2Ugc3RhdGljIG1lbW9yeSAoYWxsIHRoZSBtZW1vcnkgaXMgZXhwZWN0
ZWQgdG8gYmUgZ2l2ZW4gdG8gdGhlIA0KPj4+IGFsbG9jYXRvcik/DQo+PiBJIGRvbid0IHRoaW5r
IHN1Y2ggaHlicmlkIGNvbmZpZ3VyYXRpb24gaXMgdmFsaWQgKGJvb3Rpbmcgd2l0aCBBQ1BJIHll
dA0KPj4gZGVjbGFyaW5nIHJlc2VydmVkIHJlZ2lvbnMgaW4gRFQpLiBTZWUgY29tbWl0Og0KPj4g
OWMyYmMwZjI0YjJiYTcwODJkZjQwOGIzYzMzZWM5YTg2YmYyMGNmMA0KPiANCj4gSSBkb24ndCB0
aGluayB0aGUgY29tbWl0IGlzIHByZXZlbnRpbmcgaHlicmlkIGNvbmZpZ3VyYXRpb24uIEl0IGlz
IGp1c3QgDQo+IHNheWluZyB0aGF0IHRoZSByZWdpb24gKHdoaWNoIGNvdWxkIGJlIGEgc3RhdGlj
IHJlZ2lvbiBiZWNhdXNlIHRoaXMgaXMgDQo+IG5vdCBzdXBwb3J0ZWQpIHdpbGwgYmUgdW5yZXNl
cnZlZC4NCj4gDQo+IElPVywgd2hlbiBib290aW5nIHdpdGggRGV2aWNlLVRyZWUgeW91IG1heSBi
ZSBhYmxlIHRvIHVzZSBzdGF0aWMgbWVtb3J5LiANCj4gQnV0IGlmIHlvdSB3ZXJlIGJvb3Rpbmcg
d2l0aCBBQ1BJLCBzdGF0aWMgbWVtb3J5IGlzIG5vdCBzdXBwb3J0ZWQgYW5kIA0KPiB0aGVyZWZv
cmUgdGhlIHJlZ2lvbnMgc2hvdWxkIGJlIGZyZWUgZm9yIG90aGVyIHB1cnBvc2UuDQoNCg0KSnVs
aWVuLCBJIHNlZSB5b3VyIHBvaW50cywgYnV0IHRoZSBjdXJyZW50IHBhdGNoIGRvZXMgbm90IGF0
dGVtcHQgdG8gDQptYWtlIHN0YXRpYyAocmVzZXJ2ZWQpIG1lbW9yeSBwcm9wZXJseSB3b3JrIG9u
IEFDUEktYmFzZWQgc3lzdGVtIChpZiBpdCANCmlzIGF2YWlsYWJsZSB0aGVyZSksIGN1cnJlbnQg
cGF0Y2ggdHJpZXMgdG8gc29sdmUgdGhlIHJlYWwgaXNzdWUgb24gDQpkZXZpY2UtdHJlZS1iYXNl
ZCBzeXN0ZW0gd2l0aCBYZW4gY29tcGlsZWQgd2l0aCBDT05GSUdfQUNQST15IChhdCBsZWFzdCAN
CnVuaW50ZW50aW9uYWxseSkuIEhvd2V2ZXIsIEkgd29uZGVyLCB3aHkgaXQgaGFzIG5vdCBiZWVu
IG5vdGljZWQgc28gZmFyLg0KDQpJdCB0b29rIHNvbWUgdGltZSB0byB1bmRlcnN0YW5kIHdoeSBq
dXN0IGVuYWJsaW5nIENPTkZJR19TVEFUSUNfTUVNT1JZPXkNCnRyaWdnZXJlZCBhIEJVRyBpbiBj
b21tb24gY29kZS4gQW5kIGl0IHR1cm5lZCBvdXQgdGhhdCBpdCB3YXMgDQpDT05GSUdfQUNQST15
IGluIG15IFhlbidzIC5jb25maWcgdGhhdCBjYXVzZWQgdGhhdCBjb25zZXF1ZW5jZSAoSSANCnNw
ZWNpYWxseSB3cm90ZSBzbyBsb25nIGRlc2NyaXB0aW9uIHRvIHByb3ZpZGUgZnVsbCBjb250ZXh0
KS4NCg0KDQoNCj4gDQo+IENoZWVycywNCj4g

