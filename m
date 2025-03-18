Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8D7A66F5A
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 10:11:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918707.1323355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuSyS-0007zT-DV; Tue, 18 Mar 2025 09:11:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918707.1323355; Tue, 18 Mar 2025 09:11:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuSyS-0007wy-9s; Tue, 18 Mar 2025 09:11:00 +0000
Received: by outflank-mailman (input) for mailman id 918707;
 Tue, 18 Mar 2025 09:10:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/gWK=WF=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tuSyR-0007ws-1n
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 09:10:59 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2614::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6bab890-03d8-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 10:10:57 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DU0PR03MB9031.eurprd03.prod.outlook.com
 (2603:10a6:10:47e::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 09:10:53 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 09:10:53 +0000
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
X-Inumbo-ID: e6bab890-03d8-11f0-9899-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hcs5Qn6SdE7l/1dUF3FxLTIIfhrRnjyLNM12Kf7N88Fxy25suOhYJ2wRLETplmf5HubpeMy39A6OCkx2bCh+3RECWbmZpg5zLosBP7TGZlDfEzXikTnedTaqhlDoFW4AOaXpIOnFbDKwJ2JbwwIVut7Sapy1hHRvS+H4sWPE+j+0RIQ6rUT081ryDde2Tu/fCSMnhvenKO5BSngVH7rKFlfdcV79ry5WDD4kiAPTy9sFyFzgtOqrlDhUhUU8IF4yDiQsGNwdSaSn5uuYX6y2Pak7Zm86BRTUWolMaQac2OgvYAAZ4879dpZAs9FJEYyS9jHH908nfjeIPtWvJ6jG0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g7qzA0JPm2wgHSuhNzotUZoZfUebMo43h+G7IRulgvA=;
 b=g2z+ml3emVSsrBmUB4bVJlu3Y9cHvazmFOjI4f0Pw6uW9z12F9QCKRqI/JwRdnXNUVJf+ZEN2dlxbRlh6qlUqoyM4RHGUT6PHSqQRtF59izzfoKfNLfDqa6/Tw9mn8D6inWBY+B/E5t5fScgrgK6njWtZjWr9Vi36xdhoZgQa73DNXeZbTqh+uPByXsEep9vkE/gglm8RfzOY17xpNthkFgoay6W8Ij0C5Js16Dl56u+J7XSyNh9Nw07NawFHbVlcwIJs+HxKIjON4KTAafpdCDUOqKziARnomQQRKjgMu0D0hu2EtHSbLOhoz4wxuAmwqlsz0e0rg7AnFLvbNKiVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g7qzA0JPm2wgHSuhNzotUZoZfUebMo43h+G7IRulgvA=;
 b=Leb7/PUzghU/TqnHHaDFBIIXG6Z7Lz03nWvPkq/jgLWJE1D+xfpmlFP9JWL1kvnpgvVmQod53TEaTNPdL9UXb4hrxewxPthchS4XKnSVJseLJTTchg/iXEz4Caxkg5NRUkmEtj9yZnahVKT5ad/nH78ZLUmTsU2p8F2LF7CE4ByiYaF7d0yNuhdrYZ3SHOCCgeX8XRLErQ00V2shRwctMdu4HILzLoOfSAXeEL/8qu0k4jXmAAVDyJc0KcZRAfVAaF5o8NPe68Exeax+x1st5d2ilcKYwuNcRkcPxKzFwadyhXt+ALuFWRmnt1UC1aAFhxqUNI39ExiUM4wUY0pLuw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen
 Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] xen/dm: arm: Introduce inject_msi2 DM op
Thread-Topic: [PATCH 2/2] xen/dm: arm: Introduce inject_msi2 DM op
Thread-Index: AQHaRWELmXttIq3ydUeKyfZPAZRMh7DaobyAgqCezQA=
Date: Tue, 18 Mar 2025 09:10:53 +0000
Message-ID: <495906c3-9937-4b54-ae3a-8e8ad2b9814f@epam.com>
References: <cover.1705066642.git.mykyta_poturai@epam.com>
 <6c551b03796fbf091b22fcde96d894cd5308ff91.1705066642.git.mykyta_poturai@epam.com>
 <1793f158-ed83-46f9-be12-68c5ce86e4c4@suse.com>
In-Reply-To: <1793f158-ed83-46f9-be12-68c5ce86e4c4@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DU0PR03MB9031:EE_
x-ms-office365-filtering-correlation-id: 5db47840-9e3e-439c-29b9-08dd65fcc8bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZFhwQTBTN2NjcWo2bXhQMzNLTWdNUzBxR3VrUG0wUER0aFgwenlpSkNKamRx?=
 =?utf-8?B?NWkwRUFtckJOdVVUMCt4bzJqcDJLU2dXYnFSTmZERFZHSlRzd2ROMkRPbklC?=
 =?utf-8?B?K1M3ZmFWTVVzcjVmdU9RZGVEcGlEVmFGNy9MVDhPQnlHVGdhOUVIL3UxbnAv?=
 =?utf-8?B?dXF5cUFQT2d1MVp1UzBjVlhMTXlCM3Z0cEl6T0hIMU5qcVRFb3FDZUZsTWF0?=
 =?utf-8?B?djQ5WVl5Um9jd0FQOTg3L1BvejZGVmZwM3l0V3dwTTJXK2VOdmh6MlcwUlFt?=
 =?utf-8?B?QUZyVCtRSWVUUytydnhwUjRSRWd4VE5PYmZycWZVT21YV3ZWV1h1WnQrN2lh?=
 =?utf-8?B?RnRVR01aN2hBOWUwSlN4V3dmcElBN1dobWlNWUxXRUFrS3RVWXMzYmNpdUdr?=
 =?utf-8?B?ekM3T2k2bFRNeGIyK01ZZWwyZ1JlTitUam5wa1FNZmtQa1MrWHllbEVwaFB5?=
 =?utf-8?B?N3Nvakxvb0NjSllyL2ZFMC9VeG5DUnRKcmZhS3RnRGRwdUdqVWJuWEd1SWxT?=
 =?utf-8?B?cm1JUmZkRUVrelZ4cS9HczRQVTd4aXNuQmlZSTB0bDZpVFAvUDd5VGpsQkw3?=
 =?utf-8?B?Y0FHZGpmUGJOV2YwVGJ5WVFiRk1sNlJ1Tko2K3d6bTlqMjFzN0YrWmZLWDhP?=
 =?utf-8?B?STNwSkp0TVZqQWdKRHozY0xzWHRtYW9MdHNQWEpIdnZEaUkyVEVyd3IvaGNC?=
 =?utf-8?B?MDY1NCtLSXU0RDk5M09OZ1YrNkJlZGovUm5NWlFIbGJxWkRRYWdKenpLcm5l?=
 =?utf-8?B?S09xYUhYUDVWWGdtU2JQZkFlUFVMSThEQlIvaW55ZDU1U0pxYktoTjFlNHF3?=
 =?utf-8?B?S3Zvd3NlZldzNjRFUUUzeEJ4R2VOb3YzaXFYUDR4NW1uajNqMTc5cWpIbC9K?=
 =?utf-8?B?TXRUbnBlcmljUm9zQ25jM1NlRE82SzZ2WFZjcGRDTlQ1R1RFZEFpVE1LbUZU?=
 =?utf-8?B?Sk9XR3EwWVhWb0pMaHBXS29yRGxzQUlUTGp5QWNNYm0rNDVaY2VkMUgzdUsv?=
 =?utf-8?B?bTIzMi95RHROdURIN2dlODN6d1VpTTJlaDJieWtnbkExeHFRbUpaaGFyUXlj?=
 =?utf-8?B?RDJTZVpWMjJjMUFmaDF6b2hFRHZXY09jYlEvL0YyNzA0alhhY01CTmdPYWFV?=
 =?utf-8?B?UEhwOU94NWc3TGEvY0RybFlJQTl2ay9PTUhLL2N6R2xCTEZVclNxRnAwUWpC?=
 =?utf-8?B?NWZNV3BoNXQ0UXRUNmRjUG1xK2xQWFIrS05mdXo0SXY5NXVxZWIvdm9yMnZY?=
 =?utf-8?B?bzZ4S3dHckJ3bHNRMWVrbVB5UHgyV3N0c1IyR3QwVUo1MXNMeEtQamZZVm9N?=
 =?utf-8?B?a0pxdjloSU5IQWRUL0poK0lTdlFYdUhqYldRMThCU3V1WkRNbkd5eWQxb0hr?=
 =?utf-8?B?Y1M5T080djVHMHEzakx2RWF1RWxwTk5UK1JhS1ZxcnRCbXhEeGVJYStEc3FV?=
 =?utf-8?B?YmhJU0FiVGtCRVJ1R3NtbmJUMGJjSEZyS1JTSDdvNitXQVoyUlhYZk5yUFpL?=
 =?utf-8?B?QkdZZ05sQlM3QmhqWEV3YmhkVDcwY25XVjVkNDFqL3lvem5vZGlCQ3lpalRp?=
 =?utf-8?B?MEYrWktrOUN0YXRGM3BQMStaSTlnUHpwTjRKakNHZTZnV3FYTTZ2bDFGOUN0?=
 =?utf-8?B?S2ExQnA4cG51aVUraWhYUVcyTVpTYnkwU0tjaXZxOFB3TUl0ZTZIN0UyYjNL?=
 =?utf-8?B?WUdwS0EyZWM1OHBXWk9JdHJrc3YyUjMrNkZWdnJYZVZzMkVkdkRreFcrczUy?=
 =?utf-8?B?UGR5NXplUHhWZkNhRDJWMEtmcnB2ZjBHclpFTURGTngxWXlCNE5nOHdONyth?=
 =?utf-8?B?VVhsV0UyN1A1VXBSVkJjQkxSNW5yd2wwYzBYU1ZvTlp5QlZLRFFSNGlWTmVI?=
 =?utf-8?B?SDRxbnZvU284dnpCWjYzbTNBZVFFbTlEKzBKeEVvaXdkYTV2K0czUHdiaUFa?=
 =?utf-8?Q?UBO083ZNEpvWthLqdAr9Bi0XeP65jV4A?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UnJaR3RUcm5yZ1E3Znlac3N5bzFVMWJxYy9RZWl0WkVDU3ZGOS85VXpUdlJh?=
 =?utf-8?B?aUZ2ay9iZUFXVnVXZlVGWUZNUHppYWZNWHhyelNoSUhxbFgxSjJmTUk2OU1k?=
 =?utf-8?B?MWxia01Qa0FtbnlpeDBwOVNuOThqTUx5QlBXTFlPb3ZXcWZDTFBNWklMclJa?=
 =?utf-8?B?NGI5TzMxZmlPNWNBYk5za3U0Y01ub2s0bms3NHhLeElhejQxMmlkalZvd1RW?=
 =?utf-8?B?S0w4QzZtVW1LS2JOa2dBZUlUK0ZsbVYyS3lpRnQzTkRRd0E5K2pmTCtNT2lJ?=
 =?utf-8?B?NnJNdE03RXVmbTdiM28yV2JEbDFnR0IwaWFRR0dOVStwc1pSMkdITWxuVStB?=
 =?utf-8?B?ZVo5cEprdjRMeFNUVUR6Z0g0emI5azk2eDYvMFZNc0xQNFpIOU5lczFQSm1o?=
 =?utf-8?B?NlR3ZTc1TEZGMThHNzVqb09jK0dOWURRd2Q5TDFmVFFxS1lWaHhJdlhGeE1t?=
 =?utf-8?B?eVBta0JqeFNpeUdnbzU2WlBqRzN0dnlpTUFGY0YzdEo1UVZhbU04OE9KUUNG?=
 =?utf-8?B?d0xvQzBNNDcyajUwTktUQU5XUWJCVmZrMlVXQUhQVFROZWlFUjRQMTFYWVZr?=
 =?utf-8?B?aTRtNDRLZmpLaGI4bEFJa3VyM1JrbU8rSkhDbzYrK20wN2NSZ3hSZS9IRTFo?=
 =?utf-8?B?SzNPUzRSNkdnTHI3ekJDZ1lFT2FFUXc0c3JPTytycGZaVVRhRUs3Y3RWUmxC?=
 =?utf-8?B?MVl1d1hUYlAzRDUvdU9LT1RyVGkwYWFKZXRuZWxTTng2Z0Zqb2h1V21aYk1X?=
 =?utf-8?B?Z0JoTGwxcFh1YWxBZFNkMk4vZVoyMHZWMXc4SlVtYWliKzkwMEtXVmRTdzYy?=
 =?utf-8?B?V24raUxZMSsyZitUYjBiZWxUaC9JcDBTWm1YNklOcnViNzhOeVFYZTlzNkxv?=
 =?utf-8?B?YUYzMnlzaGZ1TVQySG8wVlR1WVVaQ3d5Z3A3V240cDJCTGxlK0JNaGhITUxr?=
 =?utf-8?B?dFNiK1VEWlN3Uy85OVZpVXhSNStBMnArOGUySFhZWTNHb1FkZTlkSCt0TnZl?=
 =?utf-8?B?NFNRMW9JQ2pqZHBERjNCenRXY2w2alBINU9zeVdGMEtUbGtjZE5CMmE5Z2hP?=
 =?utf-8?B?OUhIeW1URk1zOTFpMEhzUlBxTHp4ZHQ4Y1hYQjZkU0FpMjhjbnNRZk50WmxS?=
 =?utf-8?B?UDZqVWJDTGlCcmFiMm8rWlZSdXhMSmZCcmdHTzg2VzFOajlQY05tL3R4a091?=
 =?utf-8?B?NDQ1V2JMZE5FSGg3Tkx3cVh3eGtCdVpwckd4NUZmM3lKaVBrTnBlVzYrY1A5?=
 =?utf-8?B?TUR6UFhqTzUrTERaYXNTaGliWCtqRXRjNGhkK25lY012UHJmK2k1ZmRjOE5Z?=
 =?utf-8?B?ampNY291c2xHMmhyMzZQWFV0MDlGcmFXRGxMb2p0cjZHUHB0NmtkU2tOQXgw?=
 =?utf-8?B?NTJkV2JDYTEvZE1tQWwvQzVKOXdvZ1o1dVdMdGNvY1VyTFFwR05yNENydjlB?=
 =?utf-8?B?aksvQ0pBSTZHa0VJYTZwWHY2eWtmeGdRUXhJV1BSUHp5WHBXWmI5SnJkcS9H?=
 =?utf-8?B?emhtbWFEcGxJR0FiUEhFeXdaSXFmSTU0emlJTkgrL0tTcW1vcmdFdUEvNU5p?=
 =?utf-8?B?dmxMR20wVXFTSVZ5V1BqckJMRFZoVWIvOFpSN1paMUNxTUVkNDR3K2NRY2hN?=
 =?utf-8?B?MnRPYm44ZmVGY01XSjdNS3hZRDV6VlZUdDZHcmFGNklrLzNnbVJlQjArcDB1?=
 =?utf-8?B?U3pweTBjZlhEQU15dHJhckNkNVpMRWdQODduYjExTVNJZnQyYjZmQzdSTWhm?=
 =?utf-8?B?SmUzN1F6dFUySHNhS1BlUDlkNW9NcHdyVldFSnJIeWRsU1pvR29VVzVCb2lW?=
 =?utf-8?B?NDZvT0h5MkVxaDZLaHdBU1hxVjF6ZGYrcnBZTEEyTXl5YWs0YWdSbVpCT1hn?=
 =?utf-8?B?SjBZZEsveWRpN1ZhK1ljelBYMWNLRUZ6dHBYdU9Pc3EyK3N4RFY1WVpMdG9u?=
 =?utf-8?B?cFd6NlhPUjNvN2lLTFZZcjJqOUlrQS9MS2hucEd5cFdTUW4wSHJNQW1iYU85?=
 =?utf-8?B?M0hEemVoWkNlM0wvZW83NllSK2xPUDZMMVp2RmJJRHE4VDU0bE1BeFRvRStn?=
 =?utf-8?B?UzBjcm14dlRlUjhFNWphUG42cFFjN3Q3eE9QTi96MzRpaWJwa3J4T1dZRndZ?=
 =?utf-8?B?VVJvNzV3eThrcW1ZWDNqbHI1S2N0bnViNm10ZDVWSEorNDhsYlkxZDA5bzZY?=
 =?utf-8?B?M3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <24B3B5F32A4C6A46A9FB214F72B12813@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5db47840-9e3e-439c-29b9-08dd65fcc8bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2025 09:10:53.0276
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tsKtzmhFwXhhS9sAVj/Tw6UZ4DPZKe0KSGEYOxqWFgcFPtOTVnYJ6LoKm2zZa11DTnEFRLLq/+oVvdN+T0Tc1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9031

T24gMTUuMDEuMjQgMTE6MzUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNC4wMS4yMDI0IDEx
OjAxLCBNeWt5dGEgUG90dXJhaSB3cm90ZToNCj4+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9o
dm0vZG1fb3AuaA0KPj4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL2h2bS9kbV9vcC5oDQo+PiBA
QCAtNDQ0LDYgKzQ0NCwxNyBAQCBzdHJ1Y3QgeGVuX2RtX29wX25yX3ZjcHVzIHsNCj4+ICAgfTsN
Cj4+ICAgdHlwZWRlZiBzdHJ1Y3QgeGVuX2RtX29wX25yX3ZjcHVzIHhlbl9kbV9vcF9ucl92Y3B1
c190Ow0KPj4gICANCj4+ICsjZGVmaW5lIFhFTl9ETU9QX2luamVjdF9tc2kyIDIxDQo+PiArI2Rl
ZmluZSBYRU5fRE1PUF9NU0lfU09VUkNFX0lEX1ZBTElEICgxdSA8PCAwKQ0KPj4gKw0KPj4gK3N0
cnVjdCB4ZW5fZG1fb3BfaW5qZWN0X21zaTIgew0KPj4gKyAgICB1aW50NjRfYWxpZ25lZF90IGFk
ZHI7DQo+PiArICAgIHVpbnQzMl90IGRhdGE7DQo+PiArICAgIHVpbnQzMl90IHNvdXJjZV9pZDsg
LyogUENJIFNCREYgKi8NCj4gDQo+IFNpbmNlIHRoZSBjb21tZW50IHNheXMgU0JERiAobm90IEJE
RiksIGhvdyBhcmUgbXVsdGlwbGUgc2VnbWVudHMgaGFuZGxlZA0KPiBoZXJlPyBBdCBsZWFzdCBv
biB4ODYgKFZULWQgYW5kIFYtaSkgc291cmNlIElEcyBhcmUgb25seSAxNiBiaXRzIGlpcmMsDQo+
IGFuZCBhcmUgbG9jYWwgdG8gdGhlIHJlc3BlY3RpdmUgc2VnbWVudC4gSXQgd291bGQgZmVlbCB3
cm9uZyB0byB1c2UgYQ0KPiAzMi1iaXQgcXVhbnRpdHkgdGhlcmU7IElPVyBJJ2QgcmF0aGVyIHNl
ZSB0aGlzIGFzIGJlaW5nIHR3byAxNi1iaXQgZmllbGRzDQo+IChzZWdtZW50IGFuZCBzb3VyY2Vf
aWQpLg0KPiANCkhpIEphbiwNCg0KSSdtIHBsYW5uaW5nIG9uIHJlc3VtaW5nIHRoaXMgc2VyaWVz
IGluIHRoZSBuZWFyIGZ1dHVyZSBhbmQgd2FudCB0byANCmNsYXJpZnkgdGhlIERNIG9wIGludGVy
ZmFjZS4NCg0KV291bGRuJ3QgaXQgYmUgYmV0dGVyIHRvIGtlZXAgdGhpbmdzIGNvbnNpc3RlbnQg
YW5kIHVzZSANClhFTl9ETU9QX1BDSV9TQkRGIGFzIGl0J3MgZG9uZSBpbiB4ZW5fZG1fb3BfaW9y
ZXFfc2VydmVyX3JhbmdlPyBBbHNvIA0Kd2l0aCB0aGlzLCB0aGUgdmFsdWUgY2FuIGJlIGVhc2ls
eSBjYXN0ZWQgdG8gcGNpX3NiZGZfdCBsYXRlciBhbmQgc3BsaXQgDQp0byBzZWdtZW50IGFuZCBC
REYgaWYgbmVlZGVkLg0KDQo+PiArICAgIHVpbnQzMl90IGZsYWdzOw0KPj4gK307DQo+IA0KPiBK
dXN0IGxpa2UgaW4gc3RydWN0IHhlbl9kbV9vcF9pbmplY3RfbXNpIHBhZGRpbmcgd2FudHMgbWFr
aW5nIGV4cGxpY2l0LA0KPiBhbmQgdGhlbiB3YW50cyBjaGVja2luZyBmb3IgYmVpbmcgemVyby4N
Cj4gDQo+IEphbg0KDQpXaWxsIGRvLg0KDQotLSANCk15a3l0YQ==

