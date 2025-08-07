Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 836AAB1DB4E
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 18:07:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073281.1436187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk39R-0004eB-Gj; Thu, 07 Aug 2025 16:07:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073281.1436187; Thu, 07 Aug 2025 16:07:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk39R-0004bC-C2; Thu, 07 Aug 2025 16:07:33 +0000
Received: by outflank-mailman (input) for mailman id 1073281;
 Thu, 07 Aug 2025 16:07:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SGIa=2T=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uk39P-0004b6-4A
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 16:07:31 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e2111ba-73a8-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 18:07:29 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by GV1PR03MB8768.eurprd03.prod.outlook.com (2603:10a6:150:a1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.23; Thu, 7 Aug
 2025 16:07:26 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 16:07:26 +0000
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
X-Inumbo-ID: 9e2111ba-73a8-11f0-a324-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QMtWCnGsCOwCQKnfGXnpPZSrkvCaMaDYrtqMYQWtf6vWUnoJSM4eDtwaFkOdfSpheIKL9XoGR5fupNmgJYql3Vc0I1w1JySeDkA8BwO6jt7LCT7OWnxp3XXG+nCf3nJtaNQZkYZryo7ugApDpNtdRqPbTLnw2RfyVri69hapoyY5bIqjy1G67hTox0mfEVp8wK2GNZo7uaZB3NYpmdaZqKtpbWHLuI6o0/jzKLVnUBlkU/O0ZVAgxooOK58fwireHkfqqov4j7+5+krJNBGwT8jy9an09LiXnEOe9j7WIAeYKoOWLJai6z1q3UA2/rjYA28lv5fm9Wc3ISHRQ4593A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1v4TyX7Fkos21dkAeeP06ZyOtoV2uiciVjCXVJGvUek=;
 b=s04Y6Q3PemhtPlsk1s+L3yFuWJ/7QLFmXtqH03YlY3ZP6dI2Pk9qL+UunocIIJPTafZlDNiL3Fyct0WQncHMQdJeJ2B5JAv0SAejwc1G5IqUYb1Da5mBPNUk+awerFgqIUYisY/hKzGqLCtunhS47HLDLc11aGnC+5qzllLdy7duPITd8AWrCqEw+nG+zoEO3EwAyZ+lGjLCXinUKWy+mwEgdK/IvajR0YWu0lld0CeimQiK/K9aP8ajbZqOsr/CRyEFeLre88JU8hsEXVye7EyvWAdf73q9q0u4fmrS7QKpMATX8c6I464oX6ILy4g48NjVSa+dWRFSPxmjcuHRdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1v4TyX7Fkos21dkAeeP06ZyOtoV2uiciVjCXVJGvUek=;
 b=JaLA0uzvbT+Tir0mqTOUMDW+uE2ACV7e3wGZ+NwOP+BN9+rnC6gGK+i1i+THYtAbczxwLJrigRHnZRmVuoLZrKOwGnpDU4+KVSSExETCn/Uzq2NFP9Ma41SgjajE9pp8uTsdEZyArxLj8Qbc6eko4RB5PAN6uG0ZnPCHfk/E5qifK46EeRHn5EA0u9rdKjP61zftwznvI1832n1plQe6K76xtuuFgZdHPSRXZi0gmaMEZ/EIZFO1ro5MvZZIv7bd7kAP07U5qg2j5OEOG7FtIcRqNLxUz4vuJMq5DW1Sppqkk87+/wEyDRTb5pWdz+UWoZT2itKZS7rXhVC900BPSA==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>,
	Juergen Gross <jgross@suse.com>, Teddy Astie <teddy.astie@vates.tech>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Luca Fancellu
	<luca.fancellu@arm.com>, "Jason Andryuk," <jason.andryuk@amd.com>, Alejandro
 Vallejo <alejandro.vallejo@cloud.com>, Sergii Dmytruk
	<sergii.dmytruk@3mdeb.com>, "Penny Zheng," <Penny.Zheng@amd.com>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpLA==?=
	<marmarek@invisiblethingslab.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, "dmkhn@proton.me"
	<dmkhn@proton.me>, Mykola Kvach <xakep.amatop@gmail.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Grygorii Strashko <gragst.linux@gmail.com>,
	Alejandro Vallejo <agarciav@amd.com>, "committers@xenproject.org"
	<committers@xenproject.org>, Community Manager
	<community.manager@xenproject.org>
Subject: Re: Xen 4.21 Development Update [June-July]
Thread-Topic: Xen 4.21 Development Update [June-July]
Thread-Index: AQHcB7VdyMkZhhqGnEisplRAacP5HQ==
Date: Thu, 7 Aug 2025 16:07:26 +0000
Message-ID: <97ea4947-5212-4fc0-82b0-866deac3befb@epam.com>
References: <ae2c2e35-72df-40ed-bffe-391f3c11b826@gmail.com>
In-Reply-To: <ae2c2e35-72df-40ed-bffe-391f3c11b826@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|GV1PR03MB8768:EE_
x-ms-office365-filtering-correlation-id: 0bae70ff-3cbb-4e09-de90-08ddd5cc80ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aGlaMUVRdG9sN2dEcG9VVVEyMUtxTDNwd05lamlGZjNxRVpmbGRDY3oyZ3Nt?=
 =?utf-8?B?V0IySEp6QnA1VlFML1hzVlN6S3k4WFV0cExJK1ZZbWlyNGtJaFZ0VEFJMWV0?=
 =?utf-8?B?bmNobHZuaVlENXRsVDZpNlFXUHFhOXBtN0RiL3RYMHNLaHFvNXpjM2EwTllP?=
 =?utf-8?B?Q3AvbXZDUkRmZm1GM0tyNWxaSVhkelExWWlCMzNSRFhXcGJnekc4M05EM3J0?=
 =?utf-8?B?aTVHWXNvbklkMUNUTkZpNWNOMHg2RHltbDdJTEhSZ3MwNzRlbGp4bXhjd1lI?=
 =?utf-8?B?eE1ZQW1UakxSYm16VDRUSXRrMDNnTmQ1ckdHVUhFUExlRE1aay9nd0g0dHU1?=
 =?utf-8?B?V1doaHdXYlNYY2R6NnEvYzI0VHlZVUMrNFcvaXYzQkFrNSs3aDVTNXc0eVpw?=
 =?utf-8?B?bkJYbG1jbytNeTA1L3hGSlk1a3ZpVTQyRnZncG45U0FsR3ljVXRVNndDN01R?=
 =?utf-8?B?b1FTalZoRWYrcFgzdXdjWkhIbXNHWitDQmxObzJvV2o4VUJGUHc4VllqZFlu?=
 =?utf-8?B?UmF3Ynd2bWtmaVBjSktqcmNSRHpJa0dJdUJTcUt4Wmh1N1BBalBTUVlTM04y?=
 =?utf-8?B?SEZqRkdIbFBYR1FGY1kyZ2VMa25GWjh4OGVmcE55TWkyYUFjZ3pUWm9wQVRF?=
 =?utf-8?B?dlJsQW5UNG9BOG9jTGFLQUJwQWVrZ0I2dGZURGJqcVZmS2lWdlhTejhOTzNp?=
 =?utf-8?B?MjMwS3lhbkM2aW9scFpzTkhSaHdTQW1NMzJUQStFbERKTG8rOVpxM3duM3Q5?=
 =?utf-8?B?S3pUWDJBRlN1V0JJOSt0TXkzcXJ4d1RkNktxWDRZQkhXU1hudFN5eEhNSHF5?=
 =?utf-8?B?bUhURFBoZm5CY3FSRSszWTVTWTZNMk9va2RXeGt5NThjN3IzSGhYUXRGRmV4?=
 =?utf-8?B?eldnUXBtUTh1ckUwczJXZFZzcHIvTTdWMzVxYnh0aGl2UnhDdDgzdmxZWERG?=
 =?utf-8?B?UHVyeU04eGlQbGh5OWtKbXd4K2JmUUUraGpqYnpobS8zWXVaSFdTN1dCWmZT?=
 =?utf-8?B?QWNuenhlZlBiMFZWK2dmRlFZa2F6MFF2VG5CUWRycGdUMHYxZmlYdXdLZ0hW?=
 =?utf-8?B?Qk0zSk9UU0cwbE8wNUtXS1dwS1UxSWJrYW9zejVwY1JkZjEzT3h0MXNFZlBn?=
 =?utf-8?B?VnFGTHk0aVg2aSt1T0ZPRmY1K0ZheDkrZGFqMldNeVNjOHZKdnpJb1ZLSjdk?=
 =?utf-8?B?WDBTSWNJekM2UGdoNThBQXQ5Y1dlRmw1NGcrVGc5NkpBdDY0TEwxYmRwTThv?=
 =?utf-8?B?NUtOYXlBaDFoVTNRdkZnVE1CcHZMeVEzazcwc0wzWGphajlsQWJTNy9UaHFM?=
 =?utf-8?B?UEhvMGtwRDMydURVUlcxYk9EdnIySitOcU13U21WQWwxQnNXSlpONDFBRDBu?=
 =?utf-8?B?WW1qeE9zT3FxVHVVOGFyOVE2clJBSWhVNXlaOUlNNjdwOVNxOWJ2QkVLaGwv?=
 =?utf-8?B?RVZPS2RZY1czbmtJaG05dm01aG4vTWl0bnY2MnhCemxlZlJtZ2RwVzdSK2dF?=
 =?utf-8?B?RFo2bVE2NU1LeUNCSnkvTHFYLzZlNTZuWWtyQk9DeGpKZGIrTnJpTWFJYlI1?=
 =?utf-8?B?VUcrVXZpYStyM2xHU3lzcm8zNlVwV1VZeTBLV0kxVjJHTE1qUWUzZUJuN3FO?=
 =?utf-8?B?SHMxVzN3dm11bS80czQ5bjV6YUEvdTlIWFRNQkg0eGhCckZkSXprdkpudDMr?=
 =?utf-8?B?RUJweENsaFhhQkVqQlQ2TnYrTEVUbG1ZWmo2NFhRWTRsMGxXQ25kQWFQY3RP?=
 =?utf-8?B?NDNDM25UWkJTTDVBNXdzOUVHTmIzQU5TM1VOZXJYLzhVTEs3K1pLNncyU2NX?=
 =?utf-8?B?dDEyWTVHNWJvMGFuZng1UFoySCtXU3FGKzdaQkxyNkpwZU5CZnR5KzdZeDdp?=
 =?utf-8?B?cWl4aWFXclJJS3ZLelhORVNEemQrT2xGMWNMaCtOTHpSUGtXSlRYVDBDK3c3?=
 =?utf-8?Q?TsCwGasIaJo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MUNwdTZ6SmpXQWwvT0xybEU1eXNDQXpadm5ORmtSTTdlUjcwbkowREw1a1pj?=
 =?utf-8?B?Wlp2TlU3YVh3SzU0ZG5LbWZBUURtUWpvTWhxM3NVWkZYUXJsUjlrVTRLV1No?=
 =?utf-8?B?Y0RCKzQ4bFc5VjY4UVpSMVNWaGp3NGdUZTFTZlR6aWxGS0czbnRlc3RSbEVk?=
 =?utf-8?B?SGZTRWxHVmNuWXRmYWNCNXQrOHJDTXdTREthcjRHdTcvUEJqeG9wSFFoVUUy?=
 =?utf-8?B?STNyNUswRVZsNkhkWVJGc2R2NjNhQ1FDMUx2enU4ZHl4QnB3L1A3N29PUG13?=
 =?utf-8?B?SmFESlA1QmkvUUVDNEVtZ29mUDQyanF5OElqeEFZb2xNenBUQkEyUEhnZ1k2?=
 =?utf-8?B?b2cxSGVmaEdQWXlHOTRlRE1TZmVMY09tbktTOGFUZ0R2RzlFbnRhejBpdTNX?=
 =?utf-8?B?WlJpcGFiSHRsYlBJLzE0TklIc0NQWGU2V3hSc3Q4NUk1Yi9IQVQ3QUZ1SUdx?=
 =?utf-8?B?djk4WXdPRC9tUUNXZWhDRmNKTmluRWZxeTdHM2ZYTWs3UTlBWksxYm9IZWZT?=
 =?utf-8?B?R2F5MUNhZ0ZKNk1IMkxjSWJ2cC9EUTI5RmhsdGdHeWRWVENqN3pGdHY3Zk5W?=
 =?utf-8?B?VXhLaldUTXRyU2Vmemx1OXFVbTJ0bSsxZWNyYURZRU1uVWpiYmpjaE9XdFlO?=
 =?utf-8?B?Wi8rTDFUcDdhRkFDbXNvdVREeVN3bXZLSkFRN3FyWWN4L0JGck5aNU1SWjdU?=
 =?utf-8?B?RXJlcWcvdDNNVW5ITG1aK0tabDVpbFJwYzJyd3N5dTRhMndweU1VdzNnMTBG?=
 =?utf-8?B?S1ZmR01VazNpdkJ3VGRDQVNMSUU3NFBiSjVQMFgrai9QMnBzWFV2TVczcTFn?=
 =?utf-8?B?TW5VQitsdVVrMlAvZVV0ZkNKK2c0ampSMzQzeTFQUzRiZ1lnQ2F5UzVkL3Jo?=
 =?utf-8?B?QXdlNWdmM0N5RGlOYS81RUdPaGVzMk4wVGw0MW8weXlyNkY2TDBpWkVUUUV0?=
 =?utf-8?B?VFJ5U3hSREZJNkhBdjU5UHpUWkltSWc0N0l3V0JDcHBvamFiZm1HVEFjOFVO?=
 =?utf-8?B?SlVKUTdnbkxTWDNkL3pxRWtCOVk3UnVzMWwxR1FsY1dTbTZlemY5aHp0eHoz?=
 =?utf-8?B?WnRwbEJzNUh3ZWVxWkE4Z3lURm45WjRoWDkwUUdkY1N6bGpVY3VuZEN5SExo?=
 =?utf-8?B?Q1pNb2VCNEFndmFkWXB4TW9yNmJhbFU0ZVJoNmNWdU5jN2g4NW1WeUMwQTlW?=
 =?utf-8?B?a0VvTDJDaDJNNHZCU0Z5MmpmZ0xwUUVKTko0TzJjZnpZd2hQWjVBcGhGaG1S?=
 =?utf-8?B?ZnpNUGlzK21SeitUUWZHZUlrOGh4RU5RSG5SWW50anlDQ1JDV3NUMDZObzU3?=
 =?utf-8?B?RTNhdkZ2S1FmT1FoaHlwVE4rMFFETURUV0o5T1NEN3ozaVFIQjVmUUp4c1J2?=
 =?utf-8?B?czFiTUJqZlcwdVVoNEY1OXpValZDc2JmejBVYmMrTlZWcHZnWGRIbXJwMnRr?=
 =?utf-8?B?V2VZb1pUWkY4Zjh0UGs1bkFHSkMwbHZOWXB2RTlzd1lDbGdqZjdjMFRLVmRS?=
 =?utf-8?B?ZmN2WWp5NFdxQUlSSmFLYmFsVEUzQlZ1NjcyM0R2eExJMUl6WVNmN3ZwYjN5?=
 =?utf-8?B?TzlNVXhhZkNqMG1GVU1Vb0xmV1NTa2FjcUFDemxubmVENmFHU0R4VldaV3lq?=
 =?utf-8?B?NnZEK04xSGowcW50SjM0WW5tdXoybXZ6Q05sSFZheENob3gwc3N3NkxpSHdm?=
 =?utf-8?B?RkhOSjN1M3JFelNPaTZkd3l3TTFvaEFrNDFZem1laFJiZUUzWnpSZGpnVDE4?=
 =?utf-8?B?cVpxYU5XdVlzSTBleFc3QXpyYzg4N0s1d0IzU2p4cFFtYitYOUlvaHpsZnFN?=
 =?utf-8?B?aGduaDAxcnh3bGg2RFJqVGtwdWhNTE1rQ1FNZkpDWVQzMVJKZVZ6UThOdVNo?=
 =?utf-8?B?M3EzdDVFa2dJNUNBWUNsWThyeWFFcHJXaXhBYjlJS0prZjlFWTQvWHlpSUV3?=
 =?utf-8?B?NDFEK2FKMXRrV0MrbWdLUlBKbEQxMGYybjdHeEVxeEZGTEpvQlhCczB5RHBX?=
 =?utf-8?B?dCtBZWtBUXRtRTY2TGNGOWhETkh4NDdEa1l5bThjcHJjZHFnekxBaXRzYVpw?=
 =?utf-8?B?RkN4VDZOVThlelRSWXpjTysvSk1uUkY0YVBYUHAzMHg4cDVoMUZPSWRhRVBB?=
 =?utf-8?B?Q2tkek9JeGlqMjc4eXdHaFQ5RmxkV3RNeXdhYkRCRWNyZkNtSmx2QVZSL2Ja?=
 =?utf-8?Q?KXcm9M9p5czSGdEmGesH8qY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <65F2F0E34BFEA9458DDDF4ACC37C9D3F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bae70ff-3cbb-4e09-de90-08ddd5cc80ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 16:07:26.7417
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uFxd37SQ5rIfXbJVIHZ/nh4NNx7Q/NA5nz3aT2mUc8WewRK012/K55/h31s5nzAW1xo83tGym21MGi4vfvaoGBPDbTDpgGP4h/e7WxBS8zA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8768

SGkgT2xla3NpaSwNCg0KT24gMDUuMDguMjUgMjE6MTksIE9sZWtzaWkgS3Vyb2Noa28gd3JvdGU6
DQo+IEhlbGxvIGV2ZXJ5b25lLA0KPiANCj4gVGhpcyBlbWFpbCBvbmx5IHRyYWNrcyBiaWcgaXRl
bXMgZm9yIHhlbi5naXQgdHJlZS4gUGxlYXNlIHJlcGx5IGZvciANCj4gaXRlbXMgeW91DQo+IHdv
dWxkIGxpa2UgdG8gc2VlIGluIDQuMjEgc28gdGhhdCBwZW9wbGUgaGF2ZSBhbiBpZGVhIHdoYXQg
aXMgZ29pbmcgb24gYW5kDQo+IHByaW9yaXRpc2UgYWNjb3JkaW5nbHkuDQo+IA0KPiBZb3UncmUg
d2VsY29tZSB0byBwcm92aWRlIGRlc2NyaXB0aW9uIGFuZCB1c2UgY2FzZXMgb2YgdGhlIGZlYXR1
cmUgeW91J3JlDQo+IHdvcmtpbmcgb24uDQo+IA0KPiA9IFRpbWVsaW5lID0NCj4gDQo+IFRoZSBj
dXJyZW50IHJlbGVhc2Ugc2NoZWR1bGUgY291bGQgYmUgZm91bmQgaGVyZToNCj4gIMKgIGh0dHBz
Oi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL1hlbl9Qcm9qZWN0X1guWVlfUmVsZWFzZV9Ob3Rl
cw0KPiANCj4gQW5kIGFzIGEgcmVtaW5kZXIgSSB3b3VsZCBsaWtlIHRvIHJlbWluZCBhdCB0aGUg
b2YgdGhpcyB3ZWVrIHdlIHdpbGwgaGF2ZQ0KPiBMYXN0IHBvc3RpbmcgZGF0ZSAoRnJpIEF1ZyAw
OCwgMjAyNSkuDQo+IA0KDQpPdXIgdGVhbSBleHBlY3RzIHRoZSBlU1BJIGZlYXR1cmUgdG8gYmUg
aW5jbHVkZWQgaW4gdGhlIDQuMjEgcmVsZWFzZToNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3hl
bi1kZXZlbC9jb3Zlci4xNzU0NTE0MjA2LmdpdC5sZW9uaWRfa29tYXJpYW5za3lpQGVwYW0uY29t
Lw0KDQpDdXJyZW50bHksIHRoZSBzZWNvbmQgdmVyc2lvbiBvZiB0aGUgcGF0Y2ggc2VyaWVzIGlz
IHVuZGVyIHJldmlldywgYW5kIEkgDQpob3BlIEkgd2lsbCBmaW5pc2ggaXQgYmVmb3JlIHRoZSBG
ZWF0dXJlIEZyZWV6ZS4NCg0KQmVzdCByZWdhcmRzLA0KTGVvbmlkIEtvbWFyaWFuc2t5aQ==

