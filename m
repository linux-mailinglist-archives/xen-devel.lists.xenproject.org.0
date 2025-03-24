Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A4EA6DCEA
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 15:26:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925675.1328552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twikm-0003yp-1L; Mon, 24 Mar 2025 14:26:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925675.1328552; Mon, 24 Mar 2025 14:26:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twikl-0003wX-Uc; Mon, 24 Mar 2025 14:26:11 +0000
Received: by outflank-mailman (input) for mailman id 925675;
 Mon, 24 Mar 2025 14:26:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r2bg=WL=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1twikl-0003R9-D1
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 14:26:11 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2608::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id edd122eb-08bb-11f0-9ffa-bf95429c2676;
 Mon, 24 Mar 2025 15:26:09 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by VI0PR03MB10614.eurprd03.prod.outlook.com (2603:10a6:800:269::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 14:26:07 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 14:26:07 +0000
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
X-Inumbo-ID: edd122eb-08bb-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qsgvGmyGnvnW6Y+C3OLioLo/+MH8YTstEZi+wJlA+mby0GVNbvXDv+jEV2sKijLgdQYRTwJMaHXbzL0XOcdC7tgyWvNw6Ipt+YeLqQ1mGfsc9Xu+pGjF3CsmmDxGnVBDNRkk7ftPfhYfeg11T2tzbDooi4CEUg8JjiJkdzaVek/RT+dM3yz+0Mfi+B7QmMMFL+ZwNo1FPu7r+4uDsO0FJChtM1PQC1MMDyH91yc2UE/38SF0nRITaMhWNK1hno2rja1T26KbmRWMq/BsJFDCoSnhYsIFQlbX0jmJP2BZlKcwACIxdWkdnBGqbMnG9wWPhzpUsnHLTlSAJTMgin1CSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ev5Yrp6IKkRDOHqOBu41JDi2dZduy87umjASo109ChU=;
 b=ZWhwI3ibwbhD4y5Jo371rYTJEz909LkuXGQ78tkHsh3ATUSk4uLzyh3qGorjPhoWO3mA02l3GHul/rwG+Kx4c61RSCLexY8LRPnK0X44XPY7g85b03AoP+LMeEW+ZtS81JSW/RhEXwTmNUFT7Z379kVWu95FSMFnYcRGaJSQNVb3ANAQBl928GgCAnLhk6D6ab15wQFEaX2dvuHKd5N3x6laUzkwHif5KpGxa0q/ouX9n4zg6rlb6CgaJAMYw+P+hzLW/7SE7a0TnNZsrXZ2ZUg0Kn10a5FNnWjbWKjTb3/geHPY/9C9Yg/bBV+B4kE5WgmEPg9cv9tD5qYrrt5zZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ev5Yrp6IKkRDOHqOBu41JDi2dZduy87umjASo109ChU=;
 b=OUEc/yNePecS9ihH7a46l0AWowIfqn07ZAIxUzDuC5ykc6YhKC2OI8Y9x/umI5isNuEprDRyZX3RC88u+uUb32Bae1l0rDYycHoXvDQbi1IBtMgAGCRgutaMQ6kvbfvJOjWA03EMrypJSWt6cp1/q4g+CRgBoDQa2+dO8J8DDfs7x2uneJ0onQSIE2o0TeDNfQwwgIMu7ZSVrfjOHpFdzqt8LjHz6IOM+MSN+zUnwGrB7GBl+tWyiHrVxIq7SslRSI5zF4XGtALod6xawFs+23wpW8mseTYjweUknal5jkXjvGqkv7Javnw5kh1I8b15kumMRXpnUKrCQE84Sp59bg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <0067c253-77c4-495e-b671-b5423fec3346@epam.com>
Date: Mon, 24 Mar 2025 16:26:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 1/7] xen/arm: add generic SCI subsystem
To: Stefano Stabellini <sstabellini@kernel.org>,
 Grygorii Strashko <gragst.linux@gmail.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross <jgross@suse.com>
References: <20250311111618.1850927-1-grygorii_strashko@epam.com>
 <20250311111618.1850927-2-grygorii_strashko@epam.com>
 <alpine.DEB.2.22.394.2503131525460.3477110@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <alpine.DEB.2.22.394.2503131525460.3477110@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0186.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::20) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|VI0PR03MB10614:EE_
X-MS-Office365-Filtering-Correlation-Id: dbf3f999-7eaf-4669-c846-08dd6adfd0f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dWtZY09tcG0rRUNmdHAzWnk4WjB2OW5ZVUM1STdjbTF1b1lHZTIrSWo1SE0z?=
 =?utf-8?B?U1gzaDlNeFdjdUx4M2ZQbWRwSUlybklKK0ZaTk1GV0t3WTNIWFArWEpZdGVt?=
 =?utf-8?B?bjlidzlxRDkyMW1KRjZCYmVFWUtQVlQ2UlpDSGJuUUN1ZDQrSmFTZHJjbndC?=
 =?utf-8?B?M05mc3VnRGtJdDU3bjNuT3BRZ1QyN05tZXBxd3BXdnJ4aUlBZWZTVHVoM3pu?=
 =?utf-8?B?ZnZ1cTR3L3VJcU1YWng2cXVQdVJObWw3dVJEdjc3a3o0MlhOYVlMZWM3SmZN?=
 =?utf-8?B?ZWpKWTgxb2tVZlFtdnVPQ3FyU3g3bU1qNGNaV2YwS0luMURaKzQzS21QVGtq?=
 =?utf-8?B?RSt3VnhjdnlhTFkvNGxVQnBQNTJNczd1NmJWVlJMajRmWXF5eU1KOGNjNThH?=
 =?utf-8?B?VlE4UUlwWlpTS20wKzRENCtyM0xpQlR5MHdYdCtFVW54c25rRkFBN1pyREp5?=
 =?utf-8?B?M2UzbzlMRjdXVjg3SWswU2JEMVJaNHVxUDdCQlNmMHAwK3JUdEFMN0RUNmNk?=
 =?utf-8?B?TDdYQTdhYTRONHVkcUF5SFoybTdzM1QvRzNTTHgyZzZaakx2RklZZ0VPeDIy?=
 =?utf-8?B?a0trbmlIUnRod3UycHp3ekFMVUMrTFl0VXJ2MTg0QTUvRkx4UytqWm9pWmtt?=
 =?utf-8?B?N2dyV0dIVzhhR0pScE4zbUVRSUVRZXdpNVJxL3ZqS0ZQOEQ1QTczejUzTW01?=
 =?utf-8?B?eTBWd1pyV1htRnRRbUR3S29aSTlzOGwvNjk2NE1UMTY0MjVLZnovY290Zlh4?=
 =?utf-8?B?TzVMR1RkVEVjdkFVVEJiOTVEb1MzeUhJNXJlOTU0NDFpd1B6OXFGTnlFODF0?=
 =?utf-8?B?amcvbFo2SmZrbkxCcWdKbFdMMjdzZjVoeWZ5cHlhelRCNDFtTHhWaWxCYklp?=
 =?utf-8?B?VGtlbWpHNm5KVHdMbWxvR2xTUlcxWFlRdVZkL2c3djNmWXh5dHZQbGVoOXJk?=
 =?utf-8?B?OTVNSVYzSVF5YXJQWXNETVNlNlUwblozNHhKdHBOckRQc3o2YnZlVG1WZFVG?=
 =?utf-8?B?MWZmaG5HV0ErSjRTcTdER1VHUk40amF2bFpWNWhUWHNTVndSdFBJdVp6bzBx?=
 =?utf-8?B?d1B3S0pPaGRxc0hlRGNHTTBoRHZ5MEJUWjNvM1Y5UFAzZW9iMVR1bllzSUVn?=
 =?utf-8?B?RCtRdVg2YVR4dTVJV2hmM3pFUUZrZ2ErVjJhbzJQSnd0MXBaQVg2cHk5OGJW?=
 =?utf-8?B?UHM0ekxPQitUcTRvcDlpaTA1dEt5eUxHcFJPMXlYRThUZzBVM05hMjM0cnUx?=
 =?utf-8?B?anp4MVVqMTJDWEV6U0UxbDdLRldoRHI4dlBhZkZ0QVBmdmo2Wm1jL1h0MDNF?=
 =?utf-8?B?TzlyRlNoMlBJKzZEb3RXcnZCRi9yUVIvYUR2WnJLaFBhOENqNlhvbGR2WndY?=
 =?utf-8?B?MnpDcXZuOVc2aktPcTAvZHFzWTBPOEFrU054WVNDTnFlajF5UVQzWGtFckty?=
 =?utf-8?B?bGNaZGQ1TkVkeHlFTHgwUmFqRjFoeXZxbWUrM2djNlE3MkltYmNpZlFmUUhE?=
 =?utf-8?B?alFGNHhpRzBQMUs5S3dSK0xkOWlzb0laUDZGTGUzZm9pcEJXMlRMVnBZTlBJ?=
 =?utf-8?B?UndSMkNjSzAyVEpFZGU0YzhLNmlNS0dUYTVtUlFBMWxoK0ZPaTZoRC9iMXVl?=
 =?utf-8?B?NjZUUE9MeE5ETlpLY1o5aGQvQXlSY0p3WXZXR0w0TUE4Wi85ZUV5a3U1aXh0?=
 =?utf-8?B?aHpiYUNQZU9xcVlBSEpEVmo1WStSZjF2ak1ucUVxTndvdGlQN1RVbVB5Smhh?=
 =?utf-8?B?T0hUNlJiY2pHTFB5ZG9FSzh3VnRmQVF1QnQrd0ZydURpaFJvd3NyMHcrcUQ5?=
 =?utf-8?B?cGptS2J0RFpVUDRyYjhJajNSOWFFRVhPdFo0dFBtN3BQZHl3VkhZcklBeGkz?=
 =?utf-8?Q?tHnEQEuGo9auL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDQyNXo1VG9xME85VnpKYi9kSHpPaXh2ekhVVHdNZTNmekJmZ0t2QTlsdkR3?=
 =?utf-8?B?czIzc1BwSnhBN0tFZHl2UnIvUlAwQlRPbXI4WUZ0NVRQVW4wSUtRYjhUNS9w?=
 =?utf-8?B?eGkzRHJyOW50dEVZbVlnMDYyUnFSUlZsZ08xaWY1S3VpZFNQTFRUckVJaGVS?=
 =?utf-8?B?a0kvNFcxWUdqcVNwS0tENmRXK1JscDUyQ2w3MGZwWmlGYmNCREczSkR6U0tz?=
 =?utf-8?B?TzlsV2NoMUZPekRLb21RUkpZSlZLK2Vpektsc2VZeW9HV1pKVFFNNlZVdTE5?=
 =?utf-8?B?Njh0M2d6Y1FLOGFFcXRmdWZFS0MvUkhjbjhtaXdCRFd2ZytrVmY0T0xCb055?=
 =?utf-8?B?Vm9MbU9meTk1ZTJsWU9xZ2FrNm5LQzVKWmpKaER2aDA5VHBOSGxPRnJxTlkw?=
 =?utf-8?B?OXVZVmhRd2QxK1cydkZlQzVGY0FlUFVMZmQ4SWwwWVVLb1lOUHpoa1B6TXd6?=
 =?utf-8?B?aG5TQ3pra2xxczNlQlRFQksrSHVSeXN3bSt5bEdYc1hjcVJrS2RMeU5kbSs1?=
 =?utf-8?B?L2p2QytZWmNoNytHUktQTEpzcVQvL3dJZC9wSjRxdDgwbnJUeTVpUlpFQW1l?=
 =?utf-8?B?cFFzN09RRTVqaGx6RUkwSGNZVnN1SE8zbGRncm9WNGhtWnYzYWFuY0xLUUZR?=
 =?utf-8?B?aDh5M2dsQU5DVXYzbWNKb1dUWkF3aEZxOFUvaVE3cTBOUUpVVnJKbDI3VTBy?=
 =?utf-8?B?T0J3NHhOMFdHZHNUQStrRjRXMnNDNTRHeHFOSGo0Q0JWL1AvckE5eDZ0QUxn?=
 =?utf-8?B?WVJuak1JNlFLQ2tLbkJGSGJsM0hZdERqYVpldnlhTm1tdFZwNzkvbUxpN2dM?=
 =?utf-8?B?ajNjU24rd2lEb1N5NXZUa0U5WTJjUTQwek41WWJXQ1Vha3BIdVFNYkFlMUlL?=
 =?utf-8?B?NWJvNjUrL0tQcWJiY0V3aHhOOEsxVkwrQVZSaVIrZGRueFlBMXJZU1RONmRX?=
 =?utf-8?B?ZWFHNjFqUmVXTk9zUFNBUThjS0lEWldJa1pmR3RxZ2RnNnVaNnFhUUZxYjN1?=
 =?utf-8?B?OWRzY29ESnZjVWwyQ0dLSXpSQUFGZnhjOFNrQlhObDZaVlphSnlSTWJHVGRP?=
 =?utf-8?B?WmQ1ZDFQZDMrelZiTkovejZOUmE3NStzb1dIYy9scm9uZjRlRXJTS1F1Qklt?=
 =?utf-8?B?VXY3MVhjR3JLOHlUc3IvNmFZSGFTMUFsTDBTNFBYS2RHVkpib0pITnc4OTZJ?=
 =?utf-8?B?S0UyVE1yVk9sdW5KOVgzQytmTlE3V1g0TVlxaVdnT0o1eFZBY3BWQnU3M1dm?=
 =?utf-8?B?NUF5YkRFNnRrZUJKSG9DelhSMzR4WXcyVXl0UVNxNmh2SWZpa01TdDA4K2VP?=
 =?utf-8?B?cXVGN0ZIQXF3dDFOQ25qUlhEV0RkTHF3Rk1MLzZxd0o3UTlJWWN0TUhvUWFN?=
 =?utf-8?B?S054ZkVIKy84SmRZdnBtMEdnSStiS2ZVanNETm1VVENQVGV2RDhieWJRV3JF?=
 =?utf-8?B?S2lzWWN4TjJ2T3d0SFRLRW01U3QrZG5RUzBKSXJTN3VjcGphV014Wi85b2Jo?=
 =?utf-8?B?dXIyMmlURkhvQU1SWlB6amE2d2hnb0JWTzExZ0o1SEFuNEh4REtSc0V6MXRO?=
 =?utf-8?B?cXdaTlJtY1ZVQnBocnlPelh3RTZ3bDRhUWpJbnVOMGJzWWhHRFE3bmd0N0hZ?=
 =?utf-8?B?YnBoVDQ3WTgyMC9OK0IrUGJFWGp0bysvczdvZTR0YVF1TGg3dlpxZkNjZEdq?=
 =?utf-8?B?c21rK09WbVg5eUFua05hOE5xeGhFVyszWDdWbHpKSE9yc2ZYdWozYkNSUTl3?=
 =?utf-8?B?ZUo0allSZmtpRXdkNDJqNzd1c3VEMFExc1dQaXgvSGdjVE44VERUS1c5d3Q0?=
 =?utf-8?B?cHptZ2J3OWlxSUpYZFVMdFFKRFNkODV3c2piZHk3eER4QnhLN01RT3VTVW9K?=
 =?utf-8?B?TWY3L01BbkgvUGNqVlBYYWwraDY2bHJ0S2JHdmQ2bHdFUGlqNHBDUnNHaUFP?=
 =?utf-8?B?YUZzSjFhNmlhN1VGWlZ0ODRkczZmaEpjUDJxTFFsb3ZXSHZpY3BCZHJyZTVx?=
 =?utf-8?B?WUZyTGRNWDNDT28yYWQwZmFRNlJtSjVreUJ0RU12c2lFUWJkMEI2ZWpadmZ1?=
 =?utf-8?B?YXVockh2QlR0dlVZc28wcUYvcmY0djE1Y1VmUkhoOFhXTmtnMXI5RG9aVVcz?=
 =?utf-8?B?OHZiYTR3WU04c3ljNmpiekJSR1ZtdjF5bU81RFJzdTVlY0wyd3NMcUhxYlZZ?=
 =?utf-8?B?Tmc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbf3f999-7eaf-4669-c846-08dd6adfd0f1
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 14:26:07.3392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hIg9M28Hz+8PJRb84AEpJ93q/8zYX/tj/rcTjGlu69vK13QupStHJ7Z3kVmo0mtGudeEaF3iqeKmmWneJm9VFGWPU/Qf+o5OKiTsG8CHgRM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10614

Hi Stefano,

Thanks for your comments.

On 14.03.25 01:48, Stefano Stabellini wrote:
> On Tue, 11 Mar 2025, Grygorii Strashko wrote:
>> From: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
>>
>> This patch adds the basic framework for ARM SCI mediator. SCI is System
>> Control Interface, which is designed to redirect requests from the Domains
>> to ARM specific Firmware (for example SCMI). This will allow the devices,
>> passed-through to the different Domains, to access to the System resources
>> (such as clocks/resets etc) by sending requests to the firmware.
>>
>> ARM SCI subsystem allows to implement different SCI drivers to handle
>> specific ARM firmware interfaces (like ARM SCMI) and mediate requests
>> between the Domains and the Firmware. Also it allows SCI drivers to perform
>> proper action during Domain creation/destruction which is vital for
>> handling use cases like Domain reboot.
>>
>> This patch introduces new DEVICE_ARM_SCI device subclass for probing SCI
>> drivers basing on device tree, SCI drivers register itself with
>> DT_DEVICE_START/END macro. On init - the SCI drivers should register its
>> SCI ops with sci_register(). Only one SCI driver can be supported.
>>
>> At run-time, the following SCI API calls are introduced:
>>
>> - sci_domain_sanitise_config() called from arch_sanitise_domain_config()
>> - sci_domain_init() called from arch_domain_create()
>> - sci_relinquish_resources() called from domain_relinquish_resources()
>> - sci_domain_destroy() called from arch_domain_destroy()
>> - sci_handle_call() called from vsmccc_handle_call()
>> - sci_dt_handle_node()
>>    sci_dt_finalize() called from handle_node() (Dom0 DT)
>>
>> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>> ---
>>   MAINTAINERS                             |   6 +
>>   xen/arch/arm/device.c                   |   5 +
>>   xen/arch/arm/dom0less-build.c           |  13 ++
>>   xen/arch/arm/domain.c                   |  12 +-
>>   xen/arch/arm/domain_build.c             |   8 +
>>   xen/arch/arm/firmware/Kconfig           |   8 +
>>   xen/arch/arm/firmware/Makefile          |   1 +
>>   xen/arch/arm/firmware/sci.c             | 187 +++++++++++++++++++++
>>   xen/arch/arm/include/asm/domain.h       |   5 +
>>   xen/arch/arm/include/asm/firmware/sci.h | 214 ++++++++++++++++++++++++
>>   xen/arch/arm/vsmc.c                     |   3 +
>>   xen/common/domctl.c                     |  13 ++
>>   xen/drivers/passthrough/device_tree.c   |   7 +
>>   xen/include/asm-generic/device.h        |   1 +
>>   xen/include/public/arch-arm.h           |   4 +
>>   15 files changed, 486 insertions(+), 1 deletion(-)
>>   create mode 100644 xen/arch/arm/firmware/sci.c
>>   create mode 100644 xen/arch/arm/include/asm/firmware/sci.h
>>

[...]

>> +/*
>> + * Generic part of the SCI (System Control Interface) subsystem.
>> + *
>> + * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
>> + * Copyright (c) 2025 EPAM Systems
>> + */
>> +
>> +#include <xen/acpi.h>
>> +#include <xen/errno.h>
>> +#include <xen/init.h>
>> +#include <xen/sched.h>
>> +#include <xen/types.h>
>> +
>> +#include <asm/firmware/sci.h>
>> +
>> +static const struct sci_mediator_ops __read_mostly *cur_mediator;
>> +
>> +int sci_register(const struct sci_mediator_ops *ops)
>> +{
>> +    if ( cur_mediator )
>> +        return -EEXIST;
>> +
>> +    if ( !ops->domain_init || !ops->domain_destroy || !ops->handle_call )
>> +        return -EINVAL;
>> +
>> +    cur_mediator = ops;
>> +
>> +    return 0;
>> +};
>> +
>> +bool sci_handle_call(struct cpu_user_regs *args)
>> +{
>> +    if ( unlikely(!cur_mediator) )
>> +        return false;
>> +
>> +    return cur_mediator->handle_call(args);
>> +}
>> +
>> +int sci_domain_init(struct domain *d, struct xen_domctl_createdomain *config)
>> +{
>> +    if ( !cur_mediator )
>> +        return 0;
>> +
>> +    return cur_mediator->domain_init(d, config);
>> +}
>> +
>> +int sci_domain_sanitise_config(struct xen_domctl_createdomain *config)
>> +{
>> +    if ( !cur_mediator )
>> +        return 0;
>> +
>> +    if ( !cur_mediator->domain_sanitise_config )
>> +        return 0;
>> +
>> +    return cur_mediator->domain_sanitise_config(config);
>> +}
>> +
>> +void sci_domain_destroy(struct domain *d)
>> +{
>> +    if ( !cur_mediator )
>> +        return;
>> +
>> +    cur_mediator->domain_destroy(d);
>> +}
>> +
>> +int sci_relinquish_resources(struct domain *d)
>> +{
>> +    if ( !cur_mediator )
>> +        return 0;
>> +
>> +    if ( !cur_mediator->relinquish_resources )
>> +        return 0;
>> +
>> +    return cur_mediator->relinquish_resources(d);
>> +}
>> +
>> +bool sci_dt_handle_node(struct domain *d, struct dt_device_node *node)
>> +{
>> +    if ( !cur_mediator )
>> +        return 0;
>> +
>> +    if ( !cur_mediator->dom0_dt_handle_node )
>> +        return 0;
>> +
>> +    return cur_mediator->dom0_dt_handle_node(d, node);
>> +}
>> +
>> +int sci_dt_finalize(struct domain *d, void *fdt)
>> +{
>> +    if ( !cur_mediator )
>> +        return 0;
>> +
>> +    if ( !cur_mediator->dom0_dt_finalize )
>> +        return 0;
>> +
>> +    return cur_mediator->dom0_dt_finalize(d, fdt);
>> +}
>> +
>> +int sci_assign_dt_device(struct domain *d, struct dt_device_node *dev)
>> +{
>> +    struct dt_phandle_args ac_spec;
>> +    int index = 0;
>> +    int ret;
>> +
>> +    if ( !cur_mediator )
>> +        return 0;
>> +
>> +    if ( !cur_mediator->assign_dt_device )
>> +        return 0;
>> +
>> +    while ( !dt_parse_phandle_with_args(dev, "access-controllers",
>> +                                        "#access-controller-cells", index,
>> +                                        &ac_spec) )
>> +    {
>> +        printk(XENLOG_DEBUG "sci: assign device %s to %pd\n",
>> +               dt_node_full_name(dev), d);
>> +
>> +        ret = cur_mediator->assign_dt_device(d, &ac_spec);
>> +        if ( ret )
>> +            return ret;
> 
> I am confused by this: we are passing a reference to the controller
> rather than to the device to be assigned?

At this moment the Host DT is parsed as specified by access controllers bindings

	access-controllers = <&sci_fw [parameters]>;

and "ac_spec" contains
- np : access controller node, which should correspond SCI FW device node if it serves as
   access controller.
- args_count/args : DT device parameters to be passed to access controllers

In case of, SCI SCMI that's enough to perform device assignment - args[0] == device_id


> 
> 
>> +        index++;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +int sci_do_domctl(struct xen_domctl *domctl, struct domain *d,
>> +                  XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>> +{
>> +    struct dt_device_node *dev;
>> +    int ret = 0;
>> +
>> +    switch ( domctl->cmd )
>> +    {
>> +    case XEN_DOMCTL_assign_device:
>> +        if ( domctl->u.assign_device.dev != XEN_DOMCTL_DEV_DT )
>> +        {
>> +            ret = -EINVAL;
>> +            break;
>> +        }
>> +
>> +        ret = dt_find_node_by_gpath(domctl->u.assign_device.u.dt.path,
>> +                                    domctl->u.assign_device.u.dt.size, &dev);
>> +        if ( ret )
>> +            return ret;
>> +
>> +        ret = sci_assign_dt_device(d, dev);
>> +        if ( ret )
>> +            break;
>> +
>> +        break;
>> +    default:
>> +        /* do not fail here as call is chained with iommu handling */
>> +        break;
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +static int __init sci_init(void)
>> +{
>> +    struct dt_device_node *np;
>> +    unsigned int num_sci = 0;
>> +    int rc;
>> +
>> +    dt_for_each_device_node(dt_host, np)
>> +    {
>> +        rc = device_init(np, DEVICE_ARM_SCI, NULL);
>> +        if ( !rc && num_sci )
>> +        {
>> +            printk(XENLOG_ERR
>> +                   "SCMI: Only one SCI controller is supported. found second %s\n",
>> +                   np->name);
>> +            return -EOPNOTSUPP;
>> +        }
>> +        else if ( !rc )
>> +            num_sci++;
>> +        else if ( rc != -EBADF && rc != -ENODEV )
>> +            return rc;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +__initcall(sci_init);
>> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
>> index f1d72c6e48df..fa0898b7cf80 100644
>> --- a/xen/arch/arm/include/asm/domain.h
>> +++ b/xen/arch/arm/include/asm/domain.h
>> @@ -118,6 +118,11 @@ struct arch_domain
>>   #ifdef CONFIG_TEE
>>       void *tee;
>>   #endif
>> +#ifdef CONFIG_ARM_SCI
>> +    bool sci_enabled;
>> +    /* ARM SCI driver's specific data */
>> +    void *sci_data;
>> +#endif
>>   
>>   }  __cacheline_aligned;
>>   

[...]

>> diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
>> index 62d8117a120c..51b3c0297314 100644
>> --- a/xen/arch/arm/vsmc.c
>> +++ b/xen/arch/arm/vsmc.c
>> @@ -12,6 +12,7 @@
>>   #include <public/arch-arm/smccc.h>
>>   #include <asm/cpuerrata.h>
>>   #include <asm/cpufeature.h>
>> +#include <asm/firmware/sci.h>
>>   #include <asm/monitor.h>
>>   #include <asm/regs.h>
>>   #include <asm/smccc.h>
>> @@ -300,6 +301,8 @@ static bool vsmccc_handle_call(struct cpu_user_regs *regs)
>>               break;
>>           case ARM_SMCCC_OWNER_SIP:
>>               handled = handle_sip(regs);
>> +            if ( !handled )
>> +                handled = sci_handle_call(regs);
> 
> Isn't there a proper funcid range for SCI calls?

Unfortunately no. The ARM DEN 0028B "SMC CALLING CONVENTION" spec only defines the
range

Table 6-2
0x82000000-0x8200FFFF SMC32: SiP Service Calls
0xC2000000-0xC200FFFF SMC64: SiP Service Calls

And in Linux Kernel mainline I can see:

./arm64/boot/dts/freescale/s32g2.dtsi:		arm,smc-id = <0xc20000fe>;
./arm64/boot/dts/freescale/s32g3.dtsi:		arm,smc-id = <0xc20000fe>;
./arm64/boot/dts/freescale/imx8ulp.dtsi:	arm,smc-id = <0xc20000fe>;
./arm64/boot/dts/amlogic/amlogic-c3.dtsi:	arm,smc-id = <0x820000C1>;
./arm64/boot/dts/st/stm32mp251.dtsi:		arm,smc-id = <0xb200005a>;
./arm64/boot/dts/blaize/blaize-blzp1600.dtsi:	arm,smc-id = <0x82002000>;
./arm64/boot/dts/rockchip/rk356x-base.dtsi:	arm,smc-id = <0x82000010>;
./arm64/boot/dts/rockchip/rk3588-base.dtsi:	arm,smc-id = <0x82000010>;
./arm64/boot/dts/rockchip/rk3576.dtsi:		arm,smc-id = <0x82000010>;


> 
> 
>>               break;
>>           case ARM_SMCCC_OWNER_TRUSTED_APP ... ARM_SMCCC_OWNER_TRUSTED_APP_END:
>>           case ARM_SMCCC_OWNER_TRUSTED_OS ... ARM_SMCCC_OWNER_TRUSTED_OS_END:
>> diff --git a/xen/common/domctl.c b/xen/common/domctl.c
>> index 05abb581a03d..b48ad20a6e2b 100644
>> --- a/xen/common/domctl.c
>> +++ b/xen/common/domctl.c
>> @@ -27,6 +27,7 @@
>>   #include <xen/vm_event.h>
>>   #include <xen/monitor.h>
>>   #include <asm/current.h>
>> +#include <asm/firmware/sci.h>
>>   #include <asm/irq.h>
>>   #include <asm/page.h>
>>   #include <asm/p2m.h>
>> @@ -851,6 +852,18 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>>       case XEN_DOMCTL_deassign_device:
>>       case XEN_DOMCTL_get_device_group:
>>           ret = iommu_do_domctl(op, d, u_domctl);
>> +
>> +        if ( ret >= 0 || (ret == -EOPNOTSUPP) || (ret == -ENODEV) )
>> +        {
>> +            /*
>> +             * TODO: RFC
>> +             * This change will allow to pass DT nodes/devices to
>> +             * XEN_DOMCTL_assign_device OP using xl.cfg:"dtdev" property even
>> +             * if those DT nodes/devices even are not behind IOMMU (or IOMMU
>> +             * is disabled) without failure.
>> +             */
>> +            ret = sci_do_domctl(op, d, u_domctl);
>> +        }
>>           break;
>>   
>>       case XEN_DOMCTL_get_paging_mempool_size:
>> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
>> index 075fb25a3706..f2ee0a72f541 100644
>> --- a/xen/drivers/passthrough/device_tree.c
>> +++ b/xen/drivers/passthrough/device_tree.c
>> @@ -318,6 +318,13 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>>               break;
>>           }
>>   
>> +        /* TODO: RFC allow assignment of devices without IOMMU protection. */
>> +        if ( !dt_device_is_protected(dev) )
>> +        {
>> +            ret = 0;
>> +            break;
>> +        }
> 
> This should not be needed, there is a similar check at the beginning of
> iommu_assign_dt_device

Unfortunately no, as iommu_assign_dt_device() checks it as

     if ( !dt_device_is_protected(dev) )
         return -EINVAL;

and returns -EINVAL for DT devices which are not IOMMU-protected,
while iommu_add_dt_device() returns 1 in such cases (few lines above).
Therefore this change which in combination with do_domctl() change allows to
pass DT devices in xl.cfg:"dtdev" for processing.

In general, there are three places where DT IOMMU is configured for ARM

1) arch\arm\device.c handle_device() - used for Dom0/hwdom init and dt-overlays
2) arch\arm\dom0less-build.c handle_passthrough_prop() - used for dom0less DT devices pass through
3) drivers/passthrough/device_tree.c iommu_do_dt_domctl() - above

In cases (1) and (2), the code will not fail if DT device is not IOMMU-protected and
there is the following calling pattern:

         res = iommu_add_dt_device(dev);
         if ( res < 0 )
             return res;

// if DT device is not IOMMU-protected res == 1
// and dt_device_is_protected(dev) == false

         if ( !dt_device_is_protected(dev) )
         	return 0;

         res = iommu_assign_dt_device(d, dev);


The case (3), reviewed here, has different calling pattern:
iommu_do_dt_domctl():
         ret = iommu_add_dt_device(dev);
         if ( ret < 0 )
	   return ret;

// if DT device is not IOMMU-protected ret == 1
// and dt_device_is_protected(dev) == false

         ret = iommu_assign_dt_device(d, dev);

and will always fail if DT device is not IOMMU-protected.


  
> 
> 
>>           ret = iommu_assign_dt_device(d, dev);
>>   
>>           if ( ret )

[...]

-- 
Best regards,
-grygorii

