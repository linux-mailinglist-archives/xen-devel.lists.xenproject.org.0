Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C0DBA2A86
	for <lists+xen-devel@lfdr.de>; Fri, 26 Sep 2025 09:13:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1131138.1470341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v22dl-0004js-9s; Fri, 26 Sep 2025 07:13:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1131138.1470341; Fri, 26 Sep 2025 07:13:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v22dl-0004ht-70; Fri, 26 Sep 2025 07:13:13 +0000
Received: by outflank-mailman (input) for mailman id 1131138;
 Fri, 26 Sep 2025 07:13:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HxYg=4F=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1v22dj-0004hn-Km
 for xen-devel@lists.xenproject.org; Fri, 26 Sep 2025 07:13:11 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fa9b915-9aa8-11f0-9809-7dc792cee155;
 Fri, 26 Sep 2025 09:13:06 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by DU0PR03MB9636.eurprd03.prod.outlook.com (2603:10a6:10:42c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Fri, 26 Sep
 2025 07:13:00 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%5]) with mapi id 15.20.9160.011; Fri, 26 Sep 2025
 07:13:00 +0000
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
X-Inumbo-ID: 3fa9b915-9aa8-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xki7iCe14Sx7UxnMsLUuHukpQmftljYWy+dCWDAfP8EWAalsg03JE2iDa0yo+tdpYRax8rtMX30tq1LNro6AkNuOFMGEPFRaMZRACibNLk9Cw6/exSQ5cvkoY94mGtcMKRglFZF5swhNzFULpJzAQuUeQ+42Jg2EK+xPugmO/fOLqnXnODp5DqNCuUyOEIaxgwgsx2Fn50GdhWpqKFMepegSdpfHR/Kqjj8BxkhQ++iqwxBzXLG1KnooemWRnMJlqFf1efu1snd53qY5j9ei+Dld2Oj9MF1YL0/QkZGXsFKLIRXlKJ/NFEOPsx+ug/w//7up4e6mYd623I6LeYXu2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJQxmK4vy5OunDTKz5gEJ4UhncBojmgKbB4Rq8HH8e0=;
 b=stj8PUaWRz1ipxVe7Uzye5fR4Sj66c1dR5YC2UKEuUUOc8hy/ZDwCu3hZ8qtCqVgttMjvmc7cZSJh+c4Z3KnP9foyz8U22tT21++L1lY2gSwS50U9xuOzYmW03MkfmRAPpP/tR5FdJL2qrQVoObLCsWzF8YAJLZXyEQTBZka9OhZHYBOUecfkOwP9Utl4odIZKMPr95bGzGEKhIhQyR4H1P2GAd5NzXguzIgDVQW01TVBfWlmALLtzcQqKRYk2qw/pl9tL+wB2BWLXdcZr4X8vNaLPpGNZ1vjnnw7eGsvDPZjz2eOo7tRtJXNnKPgchNRaVCkxpyCeLkA8CzLkTYzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJQxmK4vy5OunDTKz5gEJ4UhncBojmgKbB4Rq8HH8e0=;
 b=id/DD39JqQgK6Dm1Nvxk9mon7D66Zg8nCGbXH7oG2alnz65ltXuCBC9KPn3tX372cniOTQJGeJP6Q6ou3qiZZFo5DEfQUBT3CSzjeyUUfFR8/b9/unmSh2EPPrBxpzvLBTOJcWB2UdshU9DlIUN544C8SYgVAa0XOHLNc2eN5nR2xAl1w/KFiSdyfyzasnb7+p9CXoOotZr+dhbbzWI4F20D+HhzpY7xQQXAS2QyAgzt1/jjf67ZEi0DeGuuy9/FMvMcjLJS5ED6xVrV7UsONBOa/NMN/4U731MyTeJWg+JSBvrmsxpt0F0dBmDUGtxnF030Y2K/LNdrGoJjuvM5ww==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4] xen/arm, xen/common: Add Kconfig option to control
 Dom0 boot
Thread-Topic: [PATCH v4] xen/arm, xen/common: Add Kconfig option to control
 Dom0 boot
Thread-Index: AQHcLiyQ3fkFbkmvJUapaW4Nz2vAh7SkD2WAgAD+OgA=
Date: Fri, 26 Sep 2025 07:13:00 +0000
Message-ID: <a2a7d49e-4f4f-42ea-bb78-634aea94a871@epam.com>
References:
 <90d39f2050e6028a2fce494381ad0df76f49e541.1758812103.git.oleksii_moisieiev@epam.com>
 <7cf80206-18da-4eae-b297-d1ab23bc66d0@suse.com>
In-Reply-To: <7cf80206-18da-4eae-b297-d1ab23bc66d0@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|DU0PR03MB9636:EE_
x-ms-office365-filtering-correlation-id: c8650d70-37d1-4f4a-078e-08ddfccc2059
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?NExHZ3ZQZHhDZzRoTkVLNkg5YnhEa0lkcGJTZHpNbmRMRHlFVVZjMnU5Umgv?=
 =?utf-8?B?cTVmcGFvUGpVQXVNUG5kcEUyMnB3VWYwaGNGM2RmUmNmVVNqcEtORkxQUER2?=
 =?utf-8?B?U2M1TXNmU2hDTUk0blF6enVra0w4VzJBZFY0Nldkb1h1WVg5S05qMFpEK2ZH?=
 =?utf-8?B?WWVqemgyUUg3TEtybnRrTEpYeDZZb2tGOEdhcHV4OXVLcXVEOUxGanpHOW1E?=
 =?utf-8?B?QWxtUERxK2UvbjlvRFkzaTdsNHBpa3FHUlcrbjZvNzVUTFZoT1BlR0kybE9w?=
 =?utf-8?B?Nnlrd1FyT0kwOVIzOWk4cXBXRjlEdEVsS1ZYbnNiSFRsZnU2VDJHNjJVSDJG?=
 =?utf-8?B?YUpTOXU0Z3FHZWgyNU9ZM0pwTVk3dGpoU0d3RUlSbUV5bE15UXdEVDFSd05z?=
 =?utf-8?B?aHErOUlvVEVjNWNGZk45OGQ0bTE2Y1dRSTVBVGZocUZ6UGJSVmFHTklDMGFC?=
 =?utf-8?B?SVdjZi9Ya0pKNW0zQW9EQkdpL1pSRHBXZjRhWlo1d00rOWhTZVdhWmRxQ0VI?=
 =?utf-8?B?cXZiQXVaTThSY2VZOUhSUGRySys1clA4ZGNacWdIOTRibXJ6VkhVM2dZajNu?=
 =?utf-8?B?ZE44NUNGd29oZDZZNmdNR1pXaFUvN1BCdUNvK3RVenU0eUNZNDNUODFlemll?=
 =?utf-8?B?dm1MOXU1RndFdUJ6U1RrOW1XanAzZlU0RWRyeklpVklNSVhQTTgyNEVua21l?=
 =?utf-8?B?SXJ3OFlCYUZpTm5LWkQ5VEZISWdyRlNFMFc0VFBHSGNveDR3NHdaZ0xDZlpM?=
 =?utf-8?B?THVkaThQeFhlWGg4Skh0NHYxTDkxc0JJYlZsdW5JN2MrRGRUem9zT0FkQVhs?=
 =?utf-8?B?QlpzK3VXSW9nR3JCVzl6SXo1RTBMRlJhUnFYM0V2dXhsbVNQZC8rblA2eHJn?=
 =?utf-8?B?T2dGRGNlaTVWMTBlQlc1ZEV2MDU0eTdYaHF6eldpellpNDZaOUdBUzBkc082?=
 =?utf-8?B?OHJzL1M4c2hQdlZOS2VMaEdtM3lFaEZ5eWtxNnhnZTRFLzR3MTZpRHZ5Ujdp?=
 =?utf-8?B?S2hyVnArYm14WWtJelZlQVNJeDB5SjNDTmt1bWc3SHhKTFVtN2c2WXRxUGJx?=
 =?utf-8?B?dmRVNTkycXg3K1h5ZzhlU2JPbTI0NFltR2p2QWw0QzRQUHJtYW1zYkVwQ3gw?=
 =?utf-8?B?aDgrc3B3NC9VK0tzZzE3LzVuV2JGbW5vRkpiVzEwUXVUcERjNVdGQUhmR295?=
 =?utf-8?B?dnBDWHJUcHBRYWh4c0lxL3U2OGxjNjlPOGl5dkNlV3ZkQWxiNjlBeE5Dbzcz?=
 =?utf-8?B?TCtFaGdGVVZUWnhKKytSazNrYWh5YWgvVjhobFp0OTNESGtiL3Y0K1VSTVUy?=
 =?utf-8?B?cENRS3Q5YlY2SUQ3SGlFUjRCWFZIY014dHJtU2M5SkUydGlsRnNqemVsT3B3?=
 =?utf-8?B?LzZ0ZXZvQThzT05mMndRUVVBd0FTSXVvNThzeFZmYUtOV0NSc0ROQXMzM1dw?=
 =?utf-8?B?bEczM3pDNVU3RnZ5eXB3YVo3UlBDdmVOdk9TQ1FueFBRSUc0OFhnclNPMUZk?=
 =?utf-8?B?RU9yZVdnYWpSYXlFYUoxWkt4VUM3SEtiUTQzSVN5NUYxYUpvZnE2eElSMDFQ?=
 =?utf-8?B?aWFRWHJLWWZoaGdHYnM0eFFLT21ja3hOZDRQZVBYd29QSWNDdVBrQW4xamZo?=
 =?utf-8?B?eU9TTzl1Wk1SdExHQVZYRkMvdEJYaWpWcWhkQ24rMXQvNXpUWUNSNjBRM3pw?=
 =?utf-8?B?YVYwVUhzbjRrb3lZRk9QT3JoOFFnenNGZWw1VG1pcDhMeHZmTGs3WEh3dXMz?=
 =?utf-8?B?VzY0L3dxdUJXNDREdUVOdU9kWFhRenJ4cVdJWE8vcEhoVkgzbGRvSE1tSS9Z?=
 =?utf-8?B?V3phVkw1WEloUFlPeHYveW9qTEw1QUhWNzE3ZEFKajFCa0p4VFdjaDFpK01i?=
 =?utf-8?B?L0Q4TEFoWmJRcmEyV2twZXM5WDRlQXBJZnZFWG95U0NycTdueXd4NWV2c0Mv?=
 =?utf-8?B?enZzajJGNG5xSUJoY3BDYi95VWpYTVdJZiswTTNJK2huVnJRVDFlckxoV2ZG?=
 =?utf-8?Q?kj8DfzJcAtOu5RQlAgLxyMwqfAXIGA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VlZOanFPbkg2YUlsV29SNERzaGQ4S2xKOFhGVGdIWllMRFBxdnBiWUt0ZFRs?=
 =?utf-8?B?MUhZaUZzayt5NmxXTldDTi9PSzJ5TWxCSXdyOFAzODdwa0JhWVFhZ0QyaHBs?=
 =?utf-8?B?aWs1UXFSeUlEbTFsbnowcGJlTFNwV0IrSkFjTEx1bmdkRTBkWGdnL1FCRTdQ?=
 =?utf-8?B?aTJ3T01WbzFwdDduNVNOM0xMOWFHSlF2amxKcXJpMzVYTnFacS9JWmYrZ2Nv?=
 =?utf-8?B?dENmb0kwYVBWYXFmSFdxS0M5TEJKckVGUzlOWG9lLzh3U09neGliUjVwVDNm?=
 =?utf-8?B?QWYwTExYdnIrZjNHY3cxa1dyZmI2K1Fnd3JFZ1AzY1VUcXVZS3NHNkxCZmlK?=
 =?utf-8?B?OTFYbUp6ZEdKVVB5V2lJaUxOZnloQll6ZEY5WE5aa2VUS3dxajdRcThCTFIx?=
 =?utf-8?B?Y3BrR3J5VElTNE9QZy9LRHh3c0lBcUFsbnh5Umk0V3J3c0RuMzh1T0pjenNO?=
 =?utf-8?B?NFVxdFVGSkZocVpMT1VxM3YzWGZhQ3NldVkrZitlNmgvY1JLL2xzTExWT0p6?=
 =?utf-8?B?eTFaQzljUmUzdUFpRm41WkhIT3ZaNjdtL1MrSG5RUXlYUFp0OUE4UUdSRzhs?=
 =?utf-8?B?Z3ZaSlRhenJ3WUtjWjFqUHp1WThvU2krZ1MrMm45STJwLy92ejdVeGdGSU5U?=
 =?utf-8?B?MkJhbDV0ZW04UmhuMjJoMnZWNEQrSEFGWHVnVEdTT1EwWVRVakZjS1dMNlRW?=
 =?utf-8?B?a1oxR1poTkl4elh6dUszMVBMR0JxVGtsVUxBaldhTUozVDFqcW1rWFhUdEZp?=
 =?utf-8?B?YTc1ckU3Y0RWNGpGM20xYURKNTlVUnRzUzgwc1hqTk1US0l0REJyY25PZGpS?=
 =?utf-8?B?MHFmaW9WbFoxS095bDVnQVE5Mkx3YWRlaUxCL1NDWTVOeWd3NjdEdnNTUGFh?=
 =?utf-8?B?bGt6YklGN0JabjRKYmNhZXE4UXN4N3R6ZEdJOExDMDNsNzlldytmSDN1U21N?=
 =?utf-8?B?citQakhmN0VESForSkFlekJkMkhRRyt2RUp4VEFOTDZHQTFEcEdwU0s2a3c5?=
 =?utf-8?B?M0RwZXFKS1c2RCtPVlF0Skp2Q1oreXc3bmdQV1FQSndrbmcwRVBlMmxueXFh?=
 =?utf-8?B?NHRMRWxwSmphSHl5ZHZGSUNHdzJTSzNsTmo4Y1ZTZVdZZEdLTG1KblhYNU8x?=
 =?utf-8?B?ODNzb010bzlsVUUxcWlWRXlUeW1JWU1RYmVXTzB6Uy9oMUZzR0RxR3JkcSta?=
 =?utf-8?B?Ti9QMUV5RzBIbzkrSGFIWnlVT0NEb2RxQ2pkekJiQnNoWUhTbUxIazk0MGFl?=
 =?utf-8?B?eVFkWWNkWE9zQm1vNlJSeWZtQkIvanQrUXhxWjlJbWQ2bHY2dC9aVXR3Z202?=
 =?utf-8?B?L29uUU5VdXRBRC9uRTNHVUtobWZiakVyQ04vYnd6dWVWUzRTRzcyVDN6WU9w?=
 =?utf-8?B?SVplTzhxVDY1WmVSUWsrSXBPR0oveTlqaHRZZ1dWQko2QVcvWUtjeW1QRWxP?=
 =?utf-8?B?YVM2cGRmcndZbnhBRE5jdXhsOVMxVThiRTYwaW8zOVlxdm5NcUtaKzE3TjBT?=
 =?utf-8?B?UjZVSW41cm1Rc1piSEZpallJQ0tMbmtld1laSkZPMXVqcFd0b0JmaHBOdTQr?=
 =?utf-8?B?OFAwM1pobk0wSEplYytQZTFHeURtaEFFcHc3U3dBTWg1cjd4bmYvZ1VLeVNG?=
 =?utf-8?B?MnRjSEFabmF0L2wzOUJ5b2V4QWZObkIzWTF2d2hHNjduZHZxUWJuMEdDU0xh?=
 =?utf-8?B?eG9JdUhwTkM1b2kvTkxpbUhMK3FwN1MzT0tBWG43ck04SkM3a2dGVjFKSUJX?=
 =?utf-8?B?U0k0ZW0wZ25WbGJjYlg4YXRRRzhKZ0xjeVZJcDU0Yjk0TnV4SWVlVmUrME43?=
 =?utf-8?B?VnpxbGF4a1ErNllmUFFUQ1JuY3hCTG4vOEsva0hHeCtTREpKQ3ExVG1ianNz?=
 =?utf-8?B?bnlUOS9YKzZEUUllMDI2WjZTUmR2eHNkZmtIRHJGbllBZGVPY2kybytwMXAz?=
 =?utf-8?B?WnEvNXFGM2FBMmVkd24xY3NFTVdOblNvejNoQWd3Uzk0STdLQnpDSkZEeVgr?=
 =?utf-8?B?R0VUSDBGeXVKbFpQTWMwclV4STdWVEw5Mk5aQ0I0Vm0wNno5Vy85WEp5ZWRr?=
 =?utf-8?B?RzR1ODcwOGpsS2ljTHZCSzNJbzlBUFBiRHpZdDZtK0ljcUFOdzRucndMNzNn?=
 =?utf-8?B?ZG02VTV0RUp2WCtkbjgzYy9JUmd2azR2eEw0U3V0cy9SVDNZS1FVTyt0UWU0?=
 =?utf-8?B?T0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0DD3B78516822341B45CC55F20BA1205@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8650d70-37d1-4f4a-078e-08ddfccc2059
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2025 07:13:00.2447
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8sMc3A4TaLHNmQZmNbX3TjBjIqs8cU2VwEMuvtLICVGJqKy644BU9BVyO3PcxxiYY4Psbt29/1qAODFSwEEU5IF2pHWpMr48/lfGwVeHmxg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9636

DQoNCk9uIDI1LzA5LzIwMjUgMTk6MDMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNS4wOS4y
MDI1IDE2OjU2LCBPbGVrc2lpIE1vaXNpZWlldiB3cm90ZToNCj4+IFRoaXMgY29tbWl0IGludHJv
ZHVjZXMgYSBuZXcgS2NvbmZpZyBvcHRpb24sIGBDT05GSUdfRE9NMF9CT09UYCwgdG8NCj4+IGFs
bG93IGZvciBidWlsZGluZyBYZW4gd2l0aG91dCBzdXBwb3J0IGZvciBib290aW5nIGEgcmVndWxh
ciBkb21haW4gKERvbTApLg0KPj4gVGhpcyBmdW5jdGlvbmFsaXR5IGlzIHByaW1hcmlseSBpbnRl
bmRlZCBmb3IgdGhlIEFSTSBhcmNoaXRlY3R1cmUuDQo+Pg0KPj4gQSBuZXcgS2NvbmZpZyBzeW1i
b2wsIGBIQVNfRE9NMGAsIGhhcyBiZWVuIGFkZGVkIGFuZCBpcyBzZWxlY3RlZCBieQ0KPj4gZGVm
YXVsdCBmb3IgQVJNIGFuZCBYODYgYXJjaGl0ZWN0dXJlLiBUaGlzIHN5bWJvbCBzaWduaWZpZXMg
dGhhdCBhbg0KPj4gYXJjaGl0ZWN0dXJlIGhhcyB0aGUgY2FwYWJpbGl0eSB0byBzdXBwb3J0IGEg
RG9tMC4NCj4+DQo+PiBUaGUgYERPTTBfQk9PVGAgb3B0aW9uIGRlcGVuZHMgb24gYEhBU19ET00w
YCBhbmQgZGVmYXVsdHMgdG8gJ3knLiBGb3INCj4+IGV4cGVydCB1c2VycywgdGhpcyBvcHRpb24g
Y2FuIGJlIGRpc2FibGVkIChgQ09ORklHX0VYUEVSVD15YCBhbmQgbm8NCj4+IGBDT05GSUdfRE9N
MF9CT09UYCBpbiB0aGUgY29uZmlnKSwgd2hpY2ggd2lsbCBjb21waWxlIG91dCB0aGUgRG9tMA0K
Pj4gY3JlYXRpb24gY29kZSBvbiBBUk0uIFRoaXMgaXMgdXNlZnVsIGZvciBlbWJlZGRlZCBvciBk
b20wbGVzcy1vbmx5DQo+PiBzY2VuYXJpb3MgdG8gcmVkdWNlIGJpbmFyeSBzaXplIGFuZCBjb21w
bGV4aXR5Lg0KPj4NCj4+IFRoZSBBUk0gYm9vdCBwYXRoIGhhcyBiZWVuIHVwZGF0ZWQgdG8gcGFu
aWMgaWYgaXQgZGV0ZWN0cyBhIG5vbi1kb20wbGVzcw0KPj4gY29uZmlndXJhdGlvbiB3aGlsZSBg
Q09ORklHX0RPTTBfQk9PVGAgaXMgZGlzYWJsZWQsIHByZXZlbnRpbmcgYW4gaW52YWxpZA0KPj4g
Ym9vdC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2lpIE1vaXNpZWlldiA8b2xla3NpaV9t
b2lzaWVpZXZAZXBhbS5jb20+DQo+Pg0KPj4gLS0tDQo+Pg0KPj4gQ2hhbmdlcyBpbiB2NDoNCj4+
IC0gY2hhbmdlIE1pc3JhIHJ1bGUgdG8gMi4xIGZyb20gMi4yIGluIGRlc2NyaXB0aW9uDQo+PiAt
IHJlbW92ZSBleHRyYSBkZXBlbmRlbmNpZXMgZm9yIEFSTSBhcmNoaXRlY3R1cmUgZnJvbSBET00w
X0JPT1QNCj4+IC0gcmVwaHJhc2UgRE9NMF9CT09UIGhlbHAgYnkgYWRkaW5nIGh5cGVybGF1bmNo
DQo+PiAtIERPTTBfQk9PVCBpcyBub3QgbWFuZGF0b3J5IGZvciB4ODYgYXJjaGl0ZWN0dXJlDQo+
IEx1Y2tpbHkgdGhpcyBpcyBtZXJlbHkgd3JvbmcgaGVyZSAoIm5vdCIgc2hvdWxkIGJlIGRyb3Bw
ZWQpLCBidXQgY29ycmVjdA0KPiBpbiB0aGUgYWN0dWFsIEtjb25maWcgbG9naWMsIHNvOg0KPiBB
Y2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPg0KPiBKYW4NClllYWgs
IEkgaGFkIHdvcmQgIm5vdyIgaW4gbWluZCB3aGlsZSB0eXBpbmcgdGhpcy4uLg0KT2xla3NpaQ==

