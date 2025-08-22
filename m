Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 371C7B30FA5
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 08:56:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089583.1447109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upLh9-0001kD-RK; Fri, 22 Aug 2025 06:56:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089583.1447109; Fri, 22 Aug 2025 06:56:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upLh9-0001hi-OB; Fri, 22 Aug 2025 06:56:15 +0000
Received: by outflank-mailman (input) for mailman id 1089583;
 Fri, 22 Aug 2025 06:56:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1jNg=3C=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1upLh7-0001ha-Gv
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 06:56:13 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1625d22b-7f25-11f0-b898-0df219b8e170;
 Fri, 22 Aug 2025 08:56:11 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by DU0PR03MB9519.eurprd03.prod.outlook.com (2603:10a6:10:41e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Fri, 22 Aug
 2025 06:56:08 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9052.014; Fri, 22 Aug 2025
 06:56:08 +0000
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
X-Inumbo-ID: 1625d22b-7f25-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iVB+Y5m27PHEL2jC/E42yrmJ666Nqwj3VWz/gjXc4RB7Am8ldCHRJFHXWRk38FKSGf2FJPw65TTGEDKMC21C3ax16yuYV4mBH8K+MYLDWJi43W3v9Ap1JmK23wQPQ1MgH7//W8kfzmmaiai9yTxw/gxb6XeNt7Om20IMt439XcQ6hUjTzeyjzJW9MfUJEsVT8F2wIXVoW4FBH0Wdz8hs/ExZXYQ1oXbHRpGIKjfOMesd124Z5B55nuVfgViraMEuF/wzwSuR71RE0s0+0PQb6U28BfhrGrbYNwuUv+8hskryJwHkYQYH8V0tuUhZR9uNP9hBTu+OiB5kzUHA7DL1kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJvaEhy8OZK3zjM1vTaA54SCiIfDWQoXnxotudIq/As=;
 b=ZBlZLLjDVrmu7iDdeyJdDxRUqjtyd4h0xxdfAcEj36rLmetWOeVB3SsI3oRufK3MAvApCRqk650FP38grjB2e9Rs6robRB6LYDzko/ZIoYzI2gPs4aACc8UUTrCFHQnbb7RHeL/0UZJwp2bfrfgFF/s8dSqFKpTaeJrjMqlnQMRPIbwtvXH4vohs7/BY9nVDOSMr3MoOs7qUVp8a6qlcc+xy+mOhmkzr/fawAQZRUjnaRzE4CskzLEqrhpuMDpaOpgZTT0R+ho2vV1CLcQ2+YvrLznwToIUe1lqNpuRgYOcPoVeQM2/wMoLnX3sSdEAGWw4/Au3OlELf0vyJtqLduw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJvaEhy8OZK3zjM1vTaA54SCiIfDWQoXnxotudIq/As=;
 b=TqwgJNaRxw4+lCm/PBCakIOiUqbdNHJI5305FuJdwXnGN0tKA+/r+dL0NBhKwqV5FjCTKdmSqOOCeiwR9SWewcM13TSlU7V9wN/bSmxtcmUpNRoazp1dFOrwZ9pdYqOWVgx5hZZAETSCJFQgP2xh3/9+VhIVDIb5teSMEDtGTFXO8ok7xQtFCeFug/BNZU70zNtjVV95OCNz3GMsDOoXJ33YjFmuvi8ifQ/XrXNMe+WcfQ0yIsKtz/haVx7EifOt7H+OGNnyIVVynGFsPF6KGZda0x4c4eZWAptKnj6xX4lXLF87JIM6Hh1XP7uo+Vyrq9OXi5oO6vLKN91xkNBy8g==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 07/10] xen/arm: gicv3: modify ICH_LR_PHYSICAL_MASK to
 allow eSPI processing
Thread-Topic: [PATCH v2 07/10] xen/arm: gicv3: modify ICH_LR_PHYSICAL_MASK to
 allow eSPI processing
Thread-Index: AQHcB5d8lU0HcDjyxEOVNNx+lAhf97RuVHuA
Date: Fri, 22 Aug 2025 06:56:08 +0000
Message-ID: <6290a4b0-104a-4119-8d56-7b6b3e9daf89@epam.com>
References:
 <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
 <c712d9187bb0a19ded1a8b28d2f9ba93815708a9.1754568795.git.leonid_komarianskyi@epam.com>
 <87349kej2q.fsf@epam.com>
In-Reply-To: <87349kej2q.fsf@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|DU0PR03MB9519:EE_
x-ms-office365-filtering-correlation-id: fdedb841-d81b-40df-7f4d-08dde148f8af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dm1ibjByZ25GR0ZKU2RRcnpxVG1hS1IvQVdEU1FKUFBNeVEwbjlzaysvNm9C?=
 =?utf-8?B?OFBOejhieEFzQlp0MEZvRmM0NEhhcE5pdHJXQnRWODIzbzkrQUNxUlNyTlNk?=
 =?utf-8?B?cGR2bnM2aXUvUkhRZUxURWc5WTUvMmpVd2tiQnl5b3dIMWJtcnEvUWJiRHN2?=
 =?utf-8?B?ekRqMmZ5L2pJdk43dGdITkFUOGwrS3FzTTVJOTVkeUpremVWUUFUNkhEaVpT?=
 =?utf-8?B?Wk9WNGVaZ1ZYNytMVGFRZXphY0QxeWVUNjRPUjc0a3hnT3pDTHk2RzJHNTRX?=
 =?utf-8?B?dk5ISUhLbHNzUzk2OVBiL2lsU2RzdVpnYVdEWnVxMWpWdmJSKzBUeWcrd1RC?=
 =?utf-8?B?NUdnQmtnYkZjSG40aUgvL3NOaUxMdzRUcERyNTM1TGdvT2FxaFFCNlZFSzk2?=
 =?utf-8?B?cmJhVStzMTlUNWdOSkY3VE9aekFqMUNVd1JOYmVseHdXTytaL1JpdzNUWHls?=
 =?utf-8?B?Tk56RW9hZjNoNjB1ZnFXT04wa1l0YkJNTWZpQmNHRGlCZHBETDJNdno2LzI1?=
 =?utf-8?B?L1R1bENwTVh0THhGeUVDaURxVGpXYkpjYXRqOFUrQnQyK1VCSXhiY1lYSTFw?=
 =?utf-8?B?dm10bC93SndLN0htUmROUi83bG45RHRzWktTam85aUFkN01MWjdTaGJWZlV1?=
 =?utf-8?B?djAxcjYrR0thcEZWcnVrL2FVRW1yNFpPSGRpTlBvSVVKYmREa0FEbllNc2Na?=
 =?utf-8?B?OFdwWlRzRUl2Mmc0QTJuZGpJS0dGYmN5eFVQK0lkZFNvOEF4Lzd5Um8wd240?=
 =?utf-8?B?K3lXUTRzK1N6VVBUNVh4MVpnV1ppanVBNllVTG5zYm9na0NVamxmNTk4ZHJo?=
 =?utf-8?B?WTBYaHkyelB0ZjJneTJqMGp0WDV2TGg5eGxzWFN0MXRNNFpsbGFpRk5wU2J5?=
 =?utf-8?B?WmRvTWFFMktQemJMK2gzZWV5c1BVMWJEQWVuYWJFaHlWV05SeXNmWitpNXhB?=
 =?utf-8?B?QWVZUEVkeXUzNGtGRGxyY2RjLytNbWJTQVd6UXNDQWJsVDYvTHRvMDZGK0hI?=
 =?utf-8?B?a1JOZUtBUk1kWXhIZ0VHMjZzeElMOTdQREZHdVZMbTU1c1YxZ3BmaERzbEFB?=
 =?utf-8?B?T1lsL2drR3plSE55S2JtRHJaNjUwaUU2WTc5WTYzaks5QXcrVCtrTWkxVVhm?=
 =?utf-8?B?dkRUNWJ1bmdxWlpHRWt4Y1RtVHErZGRidnIrQjdacG1OMEtTNkZFdk1DaThV?=
 =?utf-8?B?YU5UREtkZW1FNjNhN0pHbTRVczFodXY5UUJJK0NUMjlzbi91Y3MzeE1KTTVB?=
 =?utf-8?B?VmZqamhwYmpyYVpFZ3A2NjJkK1dweUM0bTcwVmpIS0JCUW1CeldBbW5WRXhn?=
 =?utf-8?B?ZUJwTEp1blBnTXQ5RzFKbndCQ040RUhVcVBWUHljSE1rMnpNRkc1WTBoTXla?=
 =?utf-8?B?WVh2V1ZON09rV1BBM1A5T2hxVWloSllINy84S25OajJYNStSdHZDeFBkMEZp?=
 =?utf-8?B?Mnp4TVdJeXdZUktiNTBwNjFWS3FlWVJkK2MrM2VnR1NleFVEVG1RSkFiekdO?=
 =?utf-8?B?Z3VLUU80Y0haeithOHd2a3BQMnVKOVhCNVc1SGk0WEhzcFRCZTZiWllraTVw?=
 =?utf-8?B?UkRwNSs2c1hEWmxtYU5NWFZ2anVEVkJXR3NMOWJnNnA5ZGdLbkVnMWZYckgr?=
 =?utf-8?B?Uy8vL1ZMdVduTzJqdlplTm5wYjdQZExJMGF5Y3c1QU9nMUUwaG90L3JMcUVw?=
 =?utf-8?B?RnIyYlZMSXNVMUNVSnJpRmo2dVFnVFFYUlVwNTE5NWgwQ2ZrWTBsWDdrQzNT?=
 =?utf-8?B?TjFBSGJmVVYzTjZoSkVTMHpxT0R0QVZ6VEk3MmZKVGs3RE1vN1VXS3FCNGx2?=
 =?utf-8?B?T295SkVMbEFIRVk1MnhjZ0RLRCtsd2Zma05zVEhoTDJLRy9jeXRxT3dmdWIz?=
 =?utf-8?B?RCtRQkZFUnIwYk9hRytQYnFWZkVmYmQ0SlBldGh5cGlvZ1JEUkJ4eDZBU2pQ?=
 =?utf-8?B?QStXcGlIcFhhbnllMHhkdHhGeVFpMlhqTEtMWjMraWo2azdEdG5aUGc4R0g5?=
 =?utf-8?B?U25xbTh5djNnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UjdVZjl2L1RvanlEN0I0SnJZQWJCbTJaKzNTZXFSd2FmaHlqaG1YUkZ3bm5S?=
 =?utf-8?B?cW9sUHBMSzYwUlNCcXRvWmZ1MTd0aFNzamkwNG9iRkxNbjBGdW5leWphbDZP?=
 =?utf-8?B?ZyszOWVyQkxrekMvMndZQnBJN0JObXVDOGVPWjdQd0xVY3FoRmhTbCtLNWE3?=
 =?utf-8?B?UDliaHF4Ti9BWHVsQldUbmNKaXVvOFdZK21KTUZTSFlLdTJqemhxU1FUcUti?=
 =?utf-8?B?cHFsVDZsM2pyeERzUEtnSWI5akRNdGM3dlRLOWY1QTFvdXh5RHdqc3dFdFNh?=
 =?utf-8?B?MVpiK1pJQlUwR1lFNU5pWUhWa2o4MExzNWpCU05vc1BlNWVCYzArOEljWEM4?=
 =?utf-8?B?ekUxMmNxRTVQeE5KWnVnKzRNY21WU1JvZG5QOWVEaXg2S3hPSG1Rd1Y3WmpD?=
 =?utf-8?B?UlR5dWw4TEp1MFJ6OXptdGtwVWplYnhGMTNqZWpqTnI5ME1NNUEydVhWeEhD?=
 =?utf-8?B?WGo3dk9DV2J1azgwWDhKM04rWUFFSlRxblZ1YWJFaVdqNUpqenVadFJFK1d0?=
 =?utf-8?B?NkxHdk9FU1ZhYmkwdzNBTUFURTNvdm1WSjkrejU4OXRua3hOckpuV0V5Tnpj?=
 =?utf-8?B?T3UwK3V5V20wcVJpd21KcUN2ZmYzK3JiY1dTMGRYVWhxWHJuenEraHp4Ymxq?=
 =?utf-8?B?M1ZZQ0U1YjdzUVlMREZEeTd2T0ZnVEVQL2I0NDN5WVVmM2gxZ0k5UkhkOVZB?=
 =?utf-8?B?enluRmJvN3ZULzVQeTNOTCtielJGRTVBZ3NoVUlyOTFkMU9GcmVBUjgxZU82?=
 =?utf-8?B?dzJ2YVd0Y3RRNE5JNk5ZOUpqMzYvZm9vR3V6WGpTdHJ1b0lwTWQrbDkzMnps?=
 =?utf-8?B?cFVaMFJXM05Ockg0YlY3aVpPaXNQbGlKTzBZOU9ENkNaRTJjNE0yTkZIL3NF?=
 =?utf-8?B?YTVSTURKd092eTk0ZllmckhkeW56S0FRQ1ZZbXFvMUkwQ3d5ckkwbjNrUm9Q?=
 =?utf-8?B?NVR0WHliZGx3czJVM056Qm1DSE9PMHVhYkJrelhvZWpxTDBEcDFsZjlpakln?=
 =?utf-8?B?L1FvWk1iMDYxL1gvRE5rMThXd0dmekxXNDF6QjZzMkhSUEI2UXAxVXdIdURE?=
 =?utf-8?B?aG4weDZiUlhhOHFnZzk1N3AwclZmdUZLWUlXbGkvRVpTbUpKdGo1SzAzQ2d5?=
 =?utf-8?B?MTlpYS9PZllFTWV0cDUrUk40TmdRR01ZWXRvUUR1L1dpTWh2R0xnNGVWY0F2?=
 =?utf-8?B?M0tWckFXMm1wYjBOK2MraHI3aTV0L3NBTUdISnBZRTVPVU5JWmFONCtRWW1F?=
 =?utf-8?B?WDcyTm5oWDJxN3V0MDFOL0lRcnhDVGJsWnJTRnYwdUhPQisvZWVJcHJqc0ox?=
 =?utf-8?B?S1RiQ3VhbHMwQ3dnV1JGZmNoUWRpTkZ0bGxodURvTzl5WHprSTZaTlhDWGVs?=
 =?utf-8?B?NU5iUzNXNGw5bkQ1Sk5sRHpMbSs2ZWVOU1Uyd3ZORGFIWHIzOHpUZk8xc3k4?=
 =?utf-8?B?KzhFT0g1QlZFOE1NU1RrZ1RuU1Zpc0NvM0lJWUc5QkR0ZHhUS0hlSUt0MUVR?=
 =?utf-8?B?M1dGZHJwM2UxbHQwM3ZJNHBWczJSTXVRNjVNMFNyVXRoemIyNVNPUjV0YTVT?=
 =?utf-8?B?U3Z2ZWZZZG1zcjVpOVZ4VjI0R25Ua3ppcTR5eHhiMmI0UkZRZ3E3NU0xdURQ?=
 =?utf-8?B?ZjFtVS9LNUt2RWFEbTJySXVwSEs5YlpPSG9JRjJhTXZjTnlHN3hCQVlFTlhy?=
 =?utf-8?B?SWx6Ykk4aWZXNkpvbXNSSytoM09pY1BwR1I4WE0zSCtRS3VpWWZwc2NwdGlq?=
 =?utf-8?B?elBpblBLeU9DYzFrc1pXekZmWkl0dC8yNWdOMmdJcGZEaXFVNC9vdmdOcGJS?=
 =?utf-8?B?VHl3eWQ2bTB1R0VxNllSVEl3S0ZjL1loMXYwc1BjV0V4eDd6T012S1hPTnYr?=
 =?utf-8?B?YXkwckZqZTFuMzkwWnJxQVlteWdidnVKcHlnbWlPRW4wMlZBZVBCaVE3T1hr?=
 =?utf-8?B?RklQdllURUZhNnlDNW9wVmFSTlFZM3ZRUkVBcExFSkJLRkRzTXU2Y3FUYWhD?=
 =?utf-8?B?V3ZBNkJaTDhkR2RzSmZ4OFhLVngxRXU2SzBYRUhxWUFtcWlzZ1pSUkhWcWNz?=
 =?utf-8?B?Z01mWTVVVkppRjhBVk42Z2JBZ1ZoZUlVd2lXVGhXZldIZ29zcHp3eGR4MUUv?=
 =?utf-8?B?UmhLUDViOHhXS0NOZTNmR1RXdFh6S0kxcWhIYy9jSEsrMndKTzRLNGxqU1kr?=
 =?utf-8?B?NUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5FB56F983357AD47B31437F17C631D27@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdedb841-d81b-40df-7f4d-08dde148f8af
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2025 06:56:08.2223
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lKFNg11aB3InIH4htv77tlka3PvCdHJ7IymN6lCBsygSGFrnxP35FS3uvtzsqDxaWUn4zF5Wsa8IF6Mnjn00lPKOplpn8NcSrkDw35c2CwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9519

SGkgVm9sb2R5bXlyLA0KDQpPbiAyMS4wOC4yNSAxOToyNywgVm9sb2R5bXlyIEJhYmNodWsgd3Jv
dGU6DQo+IEhpIExlb25pZCwNCj4gDQo+IA0KPiBMZW9uaWQgS29tYXJpYW5za3lpIDxMZW9uaWRf
S29tYXJpYW5za3lpQGVwYW0uY29tPiB3cml0ZXM6DQo+IA0KPj4gVG8gcHJvcGVybHkgZGVhY3Rp
dmF0ZSBndWVzdCBpbnRlcnJ1cHRzIGFuZCBhbGxvdyB0aGVtIHRvIGJlIHJldHJpZ2dlcmVkDQo+
PiBhZnRlciB0aGUgaW5pdGlhbCB0cmlnZ2VyLCB0aGUgTFIgbmVlZHMgdG8gYmUgdXBkYXRlZC4g
VGhlIGN1cnJlbnQNCj4+IGltcGxlbWVudGF0aW9uIGlnbm9yZXMgaW50ZXJydXB0cyBvdXRzaWRl
IHRoZSByYW5nZSBzcGVjaWZpZWQgYnkgdGhlIG1hc2sNCj4+IDB4M0ZGLCB3aGljaCBvbmx5IGNv
dmVycyBJUlEgbnVtYmVycyB1cCB0byAxMDIzLiBUbyBlbmFibGUgcHJvY2Vzc2luZyBvZg0KPj4g
ZVNQSSBpbnRlcnJ1cHRzLCB0aGlzIHBhdGNoIHVwZGF0ZXMgdGhlIG1hc2sgdG8gMHgxM0ZGLg0K
PiANCj4gSSBhbSBub3Qgc3VyZSBob3cgdGhpcyBzdXBwb3NlZCB0byB3b3JrLiBBY2NvcmRpbmcg
dG8gdGhlIGFyY2gNCj4gc3BlY2lmaWNhdGlvbiwgcElOVElEIGZpZWxkIGluIElDSF9MUjxuPl9F
TDIgaXMgb25seSAxMiBiaXRzIHdpZGUuDQo+IA0KPiANCg0KVGhhbmsgeW91IGZvciB5b3VyIHJl
dmlldy4NCkFjY29yZGluZyB0byB0aGUgc3BlY2lmaWNhdGlvbiwgdGhlIHBJTlRJRCBmaWVsZCBp
biBJQ0hfTFI8bj5fRUwyIGlzIDEzIA0KYml0cyB3aWRlIChbNDQ6MzJdIGJpdHMpOg0KDQogPiBB
IGhhcmR3YXJlIHBoeXNpY2FsIGlkZW50aWZpZXIgaXMgb25seSByZXF1aXJlZCBpbiBMaXN0IFJl
Z2lzdGVycyBmb3INCiA+IGludGVycnVwdHMgdGhhdCByZXF1aXJlIGRlYWN0aXZhdGlvbi4gVGhp
cyBtZWFucyBvbmx5IDEzIGJpdHMgb2YNCiA+IFBoeXNpY2FsIElOVElEIGFyZSByZXF1aXJlZCwg
cmVnYXJkbGVzcyBvZiB0aGUgbnVtYmVyIHNwZWNpZmllZCBieQ0KID4gSUNDX0NUTFJfRUwxLklE
Yml0cy4NCg0KMHgxM0ZGIGlzIGEgMTMtYml0IG51bWJlciB0aGF0IGZpdHMgaW50byB0aGUgY29y
cmVzcG9uZGluZyByZWdpc3RlciANCmZpZWxkIGFuZCBjb3ZlcnMgdGhlIG1heGltdW0gZVNQSSBJ
TlRJRCB2YWx1ZSAtIDUxMTkuDQoNCkJlc3QgcmVnYXJkcywNCkxlb25pZA0K

