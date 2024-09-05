Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F0196CFA3
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 08:45:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790935.1200713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sm6F4-00083v-FF; Thu, 05 Sep 2024 06:45:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790935.1200713; Thu, 05 Sep 2024 06:45:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sm6F4-00080n-C5; Thu, 05 Sep 2024 06:45:18 +0000
Received: by outflank-mailman (input) for mailman id 790935;
 Thu, 05 Sep 2024 06:45:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bB8V=QD=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sm6F3-00080g-BK
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2024 06:45:17 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2414::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6826b3ca-6b52-11ef-a0b3-8be0dac302b0;
 Thu, 05 Sep 2024 08:45:15 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by IA0PR12MB8975.namprd12.prod.outlook.com (2603:10b6:208:48f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Thu, 5 Sep
 2024 06:45:11 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 06:45:11 +0000
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
X-Inumbo-ID: 6826b3ca-6b52-11ef-a0b3-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mVCfFzOj4OwIQIJE1tt8xYw6XYA84L0YqcAlapIjV8XZNkAqr1DZJCZTgW6xiYk3ckAKQfsq8gTKqe9DxAukxriIHBt6/uLvo5Wv6GmM0cKiOWVnsR/dz8qFvbyEO4uPjhMrDPrjPH8X1h0DngxIzz5HbHiDH9hx+KQklmUEsD/jByjyFIiSFoo4w/GBN9hkhTpEFKivzoN1d0dkaEnGaqGmAyj+FqjWPACXQ510zrKifmEEcmHv6tYOiEvjyaysb7xnWOVgATRxABtpOwi2FY9amFB3hq2IfIDviT/7Kp5SIo3T4jbdTRzJJQQTow5lJwbyFHKnoQv4AhbjTh8D0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QNWMir+5MfLiQ7r6OTniHrpDGO3p/i1LAkfWantVCjo=;
 b=QKl8HEL+MaWTBjl/sjNKHvI+LkOGrMmc6uRVOA7EWyiXRsrEK2T5B1c7FU/K6YX5WQxNkXrlowwEu9DoJH5QlV7pFZBLNsAu4nGX9RSYgRfF3AjV1cyLKEqbIpGISGHJcVqbSMx7/kVlp4Ttlt7cJYM7nuSN+YOkDiBaH2OWFcCrqiYsGk3S4Bi7XQL4h/lOv+yM0Cyhwcq2/MBYrryJBFUKnkRcAhDaSIbFLehT1WbipfQQYSPJSeGYnch7QtrMsZ/3cS3RFCkEJmRQS8wBKQtj/brfKzJnJEvZYUwI8MU9CpME090okKHLNRuZW1v83wx+bAbvSoCP8eKqxaCRnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QNWMir+5MfLiQ7r6OTniHrpDGO3p/i1LAkfWantVCjo=;
 b=xrUxp2CK2FXP09vc9c+i+UzvcO/OY3eQzTqKmgWhflD5MOQURYoq9fz6FMV6XzoA4JbWi0P4oklH2ErEZnt/cwHYWXmA9fht730EqhbwfsDoEjhXL+sfOtcUq+Ovw9xLJdxQHn9uA7pCECSv62QwM3AbTY/ecJG1IB5zXOd56G0=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George
 Dunlap <gwd@xenproject.org>, Julien Grall <julien@xen.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v14 2/5] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Thread-Topic: [XEN PATCH v14 2/5] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Thread-Index:
 AQHa/c+T1Q4Qq6O9skmV9EceghcgI7JFrg2AgACIPoD//5R3AIAAnXgA//+zNYCAAMCRAIAASOkAgAIZ9gA=
Date: Thu, 5 Sep 2024 06:45:11 +0000
Message-ID:
 <BL1PR12MB5849E69A83D4BABAF544C22EE79D2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240903070424.982218-1-Jiqian.Chen@amd.com>
 <20240903070424.982218-3-Jiqian.Chen@amd.com>
 <e8db9a54-fcbf-4f4c-803e-7b11838e22a4@suse.com>
 <BL1PR12MB5849C65CAC35890158F6A32FE7932@BL1PR12MB5849.namprd12.prod.outlook.com>
 <905fe9ef-d311-4956-b862-49f2f588afcd@suse.com>
 <BL1PR12MB58492EE11D404B2E09DA0210E7932@BL1PR12MB5849.namprd12.prod.outlook.com>
 <b2b7b716-974c-4172-ba68-261453a96932@suse.com>
 <alpine.DEB.2.22.394.2409031839550.53815@ubuntu-linux-20-04-desktop>
 <ea41eb5d-f8a1-4120-b5c1-70bdf02d8038@suse.com>
In-Reply-To: <ea41eb5d-f8a1-4120-b5c1-70bdf02d8038@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7918.023)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|IA0PR12MB8975:EE_
x-ms-office365-filtering-correlation-id: 32f8695a-62fa-4680-9cff-08dccd764a04
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dURmYVJOeVB4S25xZGFyK3JGZDNHQTU5Q3VCZi91dlBtUVkrM3JaRlVEeHVG?=
 =?utf-8?B?SCtmenR6V2s4bE5hUjR5N0R6RzhHaDlsa2I0bGVxc0ZqNWI3RjB1NExMSy9P?=
 =?utf-8?B?SkV6d1FPd0tyL2pyWmVrUTkzRWIyMndCMVpTKy9YYmU0aUQ0U0NBdnByNzFo?=
 =?utf-8?B?aDJzcFZCc3FRSjJHQ2FtS200REkvOVRkb3JUM3JFYkgvb0RsSGhZcGNydjFV?=
 =?utf-8?B?QktEZkxoSkk0YnlqOXZQaHd6OXRoYzJ1cTM3RW54VUhxdlA4QThaZHh2dTdt?=
 =?utf-8?B?ZVcxY211UlV4SnlwVDc1NGw4dVJJcEtpZTRsQmcvV25tRy8wUjRSbzU2SC9P?=
 =?utf-8?B?S0VwM3Q4L3E0Z29UZnhReDFUYk9tYmZtdEJ0K3BiZk9TcnpvM1dtWXVWY0xP?=
 =?utf-8?B?cThSMUw0UXlxMXlmM1JhOEdhd293bDlvSU15UzhGeUlOdVlNVG14MVlhY3Zt?=
 =?utf-8?B?SUlML1hkYTFKTC9JWHdodUdrZ29XaGx2WDlpVS9KcVdzQWpDcXpwNUlGRlBL?=
 =?utf-8?B?R3FmUHFpekhoUmdCeGFCa2RJenoza0xuMlRReHIzMGZCTlpJNkdyRUdNQWo1?=
 =?utf-8?B?RHVEcWVGaTdFank1WEdBMEtEUjI1a3dqTTVSQXFFWHgrbC80dG5FeFh6WDk2?=
 =?utf-8?B?VWRJL3Z3WmhPN3RXUHBTUEFWWnRqZ2h6bTY0RkVtRHpvdW4waW9nK1loUUdv?=
 =?utf-8?B?bGJWZGhCWFRDTk90cHl1cEFTNzIwdHdFTEpaWjZuOWhJSkd6bjUvTk9Cc0hs?=
 =?utf-8?B?UXZSVFl1VXFuamhGV1dYVTFUM2tQdDQwQ2wwVW1uTHp0bXIzUWh1RkxmQnZx?=
 =?utf-8?B?VE5lZmloWFdyYlQ3UjdvZ1V0Yk90ZTBhRGs0TlVmMnhnMEEzRW1nKzBYem9w?=
 =?utf-8?B?RnA3cHdFVnVJV2dEbDhFcHF4MG1SdW8wK01HZW1OUGtIeUFGN3dHcG9HZ2tD?=
 =?utf-8?B?R2d0Mk95RkVGeWhYQUI2V2g3bzNDa01hb2liK1k3eEE0YVB6ZGFNdmJwcG5E?=
 =?utf-8?B?aFcxYWlFK1RuT2g3YkxDbFI2L0NDeVlZZnB1bXg5cVg0WFRLcWhHdi8xOFl0?=
 =?utf-8?B?L29VL0lCYnJtSUR6ZWZEQTVkejJteTZWZkhyZnhGazR2MzlqdjQ0WGZrMmtj?=
 =?utf-8?B?amVZcCt1QUdBQ2txdXlsNzE1L2JLdUFVZWhjM0dYUDc5Q20rQmJqOGtHS1FD?=
 =?utf-8?B?RlBsZ2NTNkZwWmFhUFF0QXNHcXZ4MXFWdDEyQ3FQUytjdkYxWVNVbHdwRGgv?=
 =?utf-8?B?ZDFVT25RUm0raXFMK2FJSjBaeEh1cHdYQTlsZnZOSTZYZXRhc09HQzZhdUxi?=
 =?utf-8?B?L1k5eUt6eE9LMVVTazI4eGZHUHlSZ05lNW11ajNSZ2dUMHBaNys3bU8rSHd2?=
 =?utf-8?B?T3l3dCtDd05JS284MVNJUzg5TGhaT2wwd0MwRVRWS1dUclNkOEUvQjR6dFph?=
 =?utf-8?B?VCt0VkZFQjRqOTFkSDl6azBxUjlFWEpjdE4rNEUyMmxxcVoyQkYwMUFWSFdH?=
 =?utf-8?B?OTZCOTJldkE5cDMycUt2dEdURkdTNW5TQjJnYkpIQ29jWHlvKytweGV1ZzBJ?=
 =?utf-8?B?RGo4Y1I4WndobW1zaWM2V2NjM0U3bHhQbkRIWGhTOHExeTBCb2VNcDdTbzNX?=
 =?utf-8?B?WUhodVNpanVWN1hVaDV3L2xQdktaVzhUNFhIekJqV1JvbEJBdWV5TUFsYW51?=
 =?utf-8?B?OSs1Z1B6RW9XRE1GOGxDbG9UczRqQ3JLb3BoOXRzNUhzMHNEQjFpUWpDNExz?=
 =?utf-8?B?NTNKQnppVTNRSXNENVk5VmEzMDhySTVJK0NrOUExSWVnT1RvbmhSYXVvb0JE?=
 =?utf-8?B?KzNacU1XT3M1bExaaUIySzdEbzhqZjFhamV4bEN3L28xM2dDMkFFWHI2ZHdT?=
 =?utf-8?B?Q2VDRjZyWnFudWZCQUdlb1BZVVhQdHVLaHd4ZVI1UVZ0eVE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NnJYcDdLSXpyVGRzK2toclpxSENqREVtY05jZVZTbFEvSnA2enpSUjRIR1dE?=
 =?utf-8?B?TVcySWkwMEZaVlBwV1MvOXdyaWpxQ05tYWpETHdHaldhUlVvcVg3cnJ4TWs1?=
 =?utf-8?B?WmRNd2t5c01iT01jaTRNb3FQbXlDSUxxeHN0SGR4R2hzM1dwcTVRRXV4NWVm?=
 =?utf-8?B?M2QvZ2hxbUhZanJRbkF6ZlZUdTAxdnFGcUZFUkhmS2VlRVJqWUpHUmxiVnE0?=
 =?utf-8?B?YWVneFd2ckpoWFJ6WGMyaEdMZjFRM000UWVMczhsZEtvSlpad1RSUVVTamdn?=
 =?utf-8?B?YVVYV0RNQktSSnlpSngvaC84NEQ3Z0pEK083YmpMSUV3M0tCeVMrRG1rUUNS?=
 =?utf-8?B?ekxPalRrWWpCMitKWnJ4azZSd3hoaGJKK2hjc0JUSGhxR0pYZWRab0VYTWx3?=
 =?utf-8?B?ek1NendOU2ZiUzJLa096ekVCVTBkcmZ0WGx4STNoWEw1cGJhUHJqSUpmakc4?=
 =?utf-8?B?YlRMaVFicjBGeWM3NUhVdmE1K1dCbXhsazNERi9yeTVLeVVUWWZFRUJpd3dT?=
 =?utf-8?B?YkdlQ1kzRTZXRkUvWml5Z0JSVzcxUm1tbEZSM1BkUXpNVFRHSDB3eW4rNi9n?=
 =?utf-8?B?c2Q2LzdTczJuak9TUHdTUDRJVm9tT05uQVNvTDl5NzFqQjVhRGNjSmZJc0xs?=
 =?utf-8?B?Vm5kV3BtUWV0UXpKbDVtRlZJbU1JYmJSeFIvdEh2QjBjV2NBdHgwQlFPWGdv?=
 =?utf-8?B?ekxVVW5vZ1RZNzdtbGhHTGtieTl3T1NacndOR0tKV2lwSloyNzBTWTdEcU1p?=
 =?utf-8?B?NUswak03dDVlOFk5YXI1ckM4T1dEaDhvakxsTXAzZ0hDbk1ORHg5TU1DYkJV?=
 =?utf-8?B?RWZmN2w0dTFIaVMwZG1KRGg3TnoxR0IwK3NoK3g5MnR2Qk9xWWZnNWJuQ3Nw?=
 =?utf-8?B?RFFqOE1aVzk5MW1ydzJUblo2Njh5b2VUbDA4SWRYck5HSWhIczZJVEVUYW42?=
 =?utf-8?B?UHBVU2p6amJKYkRoYVhRcGFucWhrTjY4TnJBb0ZJNmI3elhXTi85K2dHTVlj?=
 =?utf-8?B?WE1OQVBxRi9JNHp5MVRWU1NjSE1yT3kwdFFRNWhtZGZ1NGcyY1dIS0xDSjRP?=
 =?utf-8?B?b01YRzB3bW9ENVNYU0xnL3Vwd3lXMndXa2s2VVpyZXp4bDVZSGw5dS9hOEZS?=
 =?utf-8?B?MUVZZVRCOExTWWt2US9EbnRyODdhNENUMzdWcFpIQ3dvckZ1NG1SeWZqYm9X?=
 =?utf-8?B?TlRaSUNvdHh2S01FRG9rTEpjM21mMzBmVmdCc3lVaUJXM1lEcEVBQm9GWlhU?=
 =?utf-8?B?VUJHRzQ1WXlOYmhpYmtWZis5aGFIclZEWUwxWHROU3krU243dytjdzNveDdr?=
 =?utf-8?B?ZVY2cWY0RGY1NUt3bDVTOWwrTDg1ZWlWemZiRktDZUlZcjFFclo0WDZsOXBM?=
 =?utf-8?B?VUx2VHZCM25UaUZwR1FIWmJQckVEb3QyQXRUajNabk5oMjIxdzVuZno1M1M3?=
 =?utf-8?B?UEJ6VmE1d1hLTmlDcUxNRVVJek9uSjU5eTZIMmsrOG9KR0pKTTliRXR0ZmND?=
 =?utf-8?B?dE92SVdXSW9oOTJRdUMrdVNXTC8rdFpXWlRxZTdXYklPN0Fldi9QblNOUHVW?=
 =?utf-8?B?QndXK3ZHckpTUHFiemViY2pXRU9uUEREVzlXZkE0bEVVa0FCQmVuR2gvSmg0?=
 =?utf-8?B?blI5SUl2UGw1dURSTktNNjRWSUJ1TnRyWVRUS2lsQjI4UGxaN1pDSzMvRFd0?=
 =?utf-8?B?RHZBdDlkdnZKbVVJdXdaY0Y2UWJ3eE1IT21HTlh1Mlh5RzdiZHZhbmtoY3pS?=
 =?utf-8?B?bFRKWEtSck9JdkMxbFdGNUtvemJkNm81RjR2ZkNwbExmRFNtSDZPWlM1cXFm?=
 =?utf-8?B?TWJuYi9Jb2FZWDNORGtTd2RIZnk4c0xkRm5FN2pzYjlvNmpLS2dFdWZkYzBE?=
 =?utf-8?B?ZjdpWHNJeVBOYU5Ib2w1SC9lZ25aekxET1g0UlFWVTc0cnFUbmZDMmJvSjB6?=
 =?utf-8?B?alZ6YVBEVUtyK1hDdHUweXh3MUFqSmZUa1haN045S3ZTRkxJNjVBQnFBeHpp?=
 =?utf-8?B?dkR5OEZiRktKY3F6Y1pybDVLVjBHbzk3cmVMeXU1Z1ZLOHZCVENVMmgvV2hE?=
 =?utf-8?B?NW81RG5oWmNSQmwyK3ptc2llVm5sUmt5Y2xsQ1J2R2xnQlBrZXU0a1VTa1VC?=
 =?utf-8?Q?5sv8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B949E4ED23D81441BE5CF878FA8BA1D4@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32f8695a-62fa-4680-9cff-08dccd764a04
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2024 06:45:11.1229
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qYoKE9y7Cyr/RGHbzktCf1Mc50dBP9jKvySoxarP9djwTqnMFHEykX/IMPX+ezcEfVLhhsKZB9A6lB9tHbu4+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8975

SEksDQoNCk9uIDIwMjQvOS80IDE0OjA0LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDQuMDku
MjAyNCAwMzo0MywgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPj4gT24gVHVlLCAzIFNlcCAy
MDI0LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+PiBPbiAwMy4wOS4yMDI0IDEyOjUzLCBDaGVuLCBK
aXFpYW4gd3JvdGU6DQo+Pj4+IE9uIDIwMjQvOS8zIDE3OjI1LCBKYW4gQmV1bGljaCB3cm90ZToN
Cj4+Pj4+IE9uIDAzLjA5LjIwMjQgMDk6NTgsIENoZW4sIEppcWlhbiB3cm90ZToNCj4+Pj4+PiBP
biAyMDI0LzkvMyAxNTo0MiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+Pj4+IE9uIDAzLjA5LjIw
MjQgMDk6MDQsIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4+Pj4+Pj4gV2hlbiBkb20wIGlzIFBWSCB0
eXBlIGFuZCBwYXNzdGhyb3VnaCBhIGRldmljZSB0byBIVk0gZG9tVSwgUWVtdSBjb2RlDQo+Pj4+
Pj4+PiB4ZW5fcHRfcmVhbGl6ZS0+eGNfcGh5c2Rldl9tYXBfcGlycSBhbmQgbGlieGwgY29kZSBw
Y2lfYWRkX2RtX2RvbmUtPg0KPj4+Pj4+Pj4geGNfcGh5c2Rldl9tYXBfcGlycSBtYXAgYSBwaXJx
IGZvciBwYXNzdGhyb3VnaCBkZXZpY2VzLg0KPj4+Pj4+Pj4gSW4geGNfcGh5c2Rldl9tYXBfcGly
cSBjYWxsIHN0YWNrLCBmdW5jdGlvbiBodm1fcGh5c2Rldl9vcCBoYXMgYSBjaGVjaw0KPj4+Pj4+
Pj4gaGFzX3BpcnEoY3VycmQpLCBidXQgY3VycmQgaXMgUFZIIGRvbTAsIFBWSCBoYXMgbm8gWDg2
X0VNVV9VU0VfUElSUSBmbGFnLA0KPj4+Pj4+Pj4gc28gaXQgZmFpbHMsIFBIWVNERVZPUF9tYXBf
cGlycSBpcyBub3QgYWxsb3dlZCBmb3IgUFZIIGRvbTAgaW4gY3VycmVudA0KPj4+Pj4+Pj4gY29k
ZXMuDQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gQnV0IGl0IGlzIGZpbmUgdG8gbWFwIGludGVycnVwdHMg
dGhyb3VnaCBwaXJxIHRvIGEgSFZNIGRvbWFpbiB3aG9zZQ0KPj4+Pj4+Pj4gWEVORkVBVF9odm1f
cGlycXMgaXMgbm90IGVuYWJsZWQuIEJlY2F1c2UgcGlycSBmaWVsZCBpcyB1c2VkIGFzIGEgd2F5
IHRvDQo+Pj4+Pj4+PiByZWZlcmVuY2UgaW50ZXJydXB0cyBhbmQgaXQgaXMganVzdCB0aGUgd2F5
IGZvciB0aGUgZGV2aWNlIG1vZGVsIHRvDQo+Pj4+Pj4+PiBpZGVudGlmeSB3aGljaCBpbnRlcnJ1
cHQgc2hvdWxkIGJlIG1hcHBlZCB0byB3aGljaCBkb21haW4sIGhvd2V2ZXINCj4+Pj4+Pj4+IGhh
c19waXJxKCkgaXMganVzdCB0byBjaGVjayBpZiBIVk0gZG9tYWlucyByb3V0ZSBpbnRlcnJ1cHRz
IGZyb20NCj4+Pj4+Pj4+IGRldmljZXMoZW11bGF0ZWQgb3IgcGFzc3Rocm91Z2gpIHRocm91Z2gg
ZXZlbnQgY2hhbm5lbCwgc28sIHRoZSBoYXNfcGlycSgpDQo+Pj4+Pj4+PiBjaGVjayBzaG91bGQg
bm90IGJlIGFwcGxpZWQgdG8gdGhlIFBIWVNERVZPUF9tYXBfcGlycSBpc3N1ZWQgYnkgZG9tMC4N
Cj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBTbywgYWxsb3cgUEhZU0RFVk9QX21hcF9waXJxIHdoZW4gZG9t
MCBpcyBQVkggYW5kIGFsc28gYWxsb3cNCj4+Pj4+Pj4+IFBIWVNERVZPUF91bm1hcF9waXJxIGZv
ciB0aGUgcmVtb3ZhbCBkZXZpY2UgcGF0aCB0byB1bm1hcCBwaXJxLiBUaGVuIHRoZQ0KPj4+Pj4+
Pj4gaW50ZXJydXB0IG9mIGEgcGFzc3Rocm91Z2ggZGV2aWNlIGNhbiBiZSBzdWNjZXNzZnVsbHkg
bWFwcGVkIHRvIHBpcnEgZm9yIGRvbVUuDQo+Pj4+Pj4+DQo+Pj4+Pj4+IEFzIGJlZm9yZTogV2hl
biB5b3UgdGFsayBhYm91dCBqdXN0IERvbTAsIC4uLg0KPj4+Pj4+Pg0KPj4+Pj4+Pj4gLS0tIGEv
eGVuL2FyY2gveDg2L2h2bS9oeXBlcmNhbGwuYw0KPj4+Pj4+Pj4gKysrIGIveGVuL2FyY2gveDg2
L2h2bS9oeXBlcmNhbGwuYw0KPj4+Pj4+Pj4gQEAgLTczLDYgKzczLDggQEAgbG9uZyBodm1fcGh5
c2Rldl9vcChpbnQgY21kLCBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHZvaWQpIGFyZykNCj4+Pj4+
Pj4+ICAgICAgew0KPj4+Pj4+Pj4gICAgICBjYXNlIFBIWVNERVZPUF9tYXBfcGlycToNCj4+Pj4+
Pj4+ICAgICAgY2FzZSBQSFlTREVWT1BfdW5tYXBfcGlycToNCj4+Pj4+Pj4+ICsgICAgICAgIGJy
ZWFrOw0KPj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4gICAgICBjYXNlIFBIWVNERVZPUF9lb2k6DQo+Pj4+
Pj4+PiAgICAgIGNhc2UgUEhZU0RFVk9QX2lycV9zdGF0dXNfcXVlcnk6DQo+Pj4+Pj4+PiAgICAg
IGNhc2UgUEhZU0RFVk9QX2dldF9mcmVlX3BpcnE6DQo+Pj4+Pj4+DQo+Pj4+Pj4+IC4uLiB0aGF0
IG91Z2h0IHRvIG1hdGNoIHRoZSBjb2RlLiBJT1cgeW91J3ZlIGFnYWluIGxvc3Qgd2h5IGl0IGlz
IG9rYXkoaXNoKQ0KPj4+Pj4+PiAob3IgZXZlbiBuZWNlc3NhcnkpIHRvIGFsc28gcGVybWl0IHRo
ZSBvcCBmb3Igbm9uLURvbTAgKGUuZy4gYSBQVkggc3R1YmRvbSkuDQo+Pj4+Pj4+IFNpbWlsYXJs
eSBpbW8gRG9tMCB1c2luZyB0aGlzIG9uIGl0c2VsZiB3YW50cyBkaXNjdXNzaW5nLg0KPj4+Pj4+
IERvIHlvdSBtZWFuIEkgbmVlZCB0byB0YWxrIGFib3V0IHdoeSBwZXJtaXQgdGhpcyBvcCBmb3Ig
YWxsIEhWTQ0KPj4+Pj4NCj4+Pj4+IFlvdSBkb24ndCBuZWVkIHRvIGludmVudCByZWFzb25zLCBi
dXQgaXQgbmVlZHMgbWFraW5nIGNsZWFyIHRoYXQgd2lkZXIgdGhhbg0KPj4+Pj4gbmVjZXNzYXJ5
IChmb3IgeW91ciBwdXJwb3NlKSBleHBvc3VyZSBpcyBhdCBsZWFzdCBub3QgZ29pbmcgdG8gYmUg
YSBwcm9ibGVtLg0KPj4+Pj4NCj4+Pj4+PiBhbmQgIHdoZXJlIGNhbiBwcmV2ZW50IFBWSCBkb21h
aW4gY2FsbGluZyB0aGlzIGZvciBzZWxmLW1hcHBpbmcsIG5vdCBvbmx5IGRvbTA/DQo+Pj4+Pg0K
Pj4+Pj4gQWl1aSB1c2Ugb24gaXRzZWxmIGlzIGxpbWl0ZWQgdG8gRG9tMCwgc28gb25seSB0aGF0
IHdvdWxkIG5lZWQgY2xhcmlmeWluZw0KPj4+Pj4gKGFsb25nIHRoZSBsaW5lcyBvZiB0aGUgYWJv
dmUsIGkuZS4gdGhhdC93aHkgaXQgaXMgbm90IGEgcHJvYmxlbSkuIEZvcg0KPj4+Pj4gaGFzX3Bp
cnEoKSBkb21haW5zIHVzZSBvbiBvbmVzZWxmIHdhcyBhbHJlYWR5IHBlcm1pdHRlZCBiZWZvcmUu
DQo+Pj4+DQo+Pj4+IENoYW5nZWQgY29tbWl0IG1lc3NhZ2UgdG8gYmVsb3cuIFBsZWFzZSBjaGVj
ayBhbmQgdGhhdCB3aWxsIGJlIGdyZWF0IGhlbHBmdWwgaWYgeW91IHdvdWxkIHNob3cgbWUgaG93
IHRvIG1vZGlmeSBpdC4NCj4+Pj4gew0KPj4+PiB4ODYvcHZoOiBBbGxvdyAodW4pbWFwX3BpcnEg
d2hlbiBkb20wIGlzIFBWSA0KPj4+Pg0KPj4+PiBQcm9ibGVtOiB3aGVuIGRvbTAgaXMgUFZIIHR5
cGUgYW5kIHBhc3N0aHJvdWdoIGEgZGV2aWNlIHRvIEhWTSBkb21VLCBRZW11DQo+Pj4+IGNvZGUg
eGVuX3B0X3JlYWxpemUtPnhjX3BoeXNkZXZfbWFwX3BpcnEgYW5kIGxpYnhsIGNvZGUgcGNpX2Fk
ZF9kbV9kb25lLT4NCj4+Pj4geGNfcGh5c2Rldl9tYXBfcGlycSBtYXAgYSBwaXJxIGZvciBwYXNz
dGhyb3VnaCBkZXZpY2VzLg0KPj4+PiBJbiB4Y19waHlzZGV2X21hcF9waXJxIGNhbGwgc3RhY2ss
IGZ1bmN0aW9uIGh2bV9waHlzZGV2X29wIGhhcyBhIGNoZWNrDQo+Pj4+IGhhc19waXJxKGN1cnJk
KSwgYnV0IGN1cnJkIGlzIFBWSCBkb20wLCBQVkggaGFzIG5vIFg4Nl9FTVVfVVNFX1BJUlEgZmxh
ZywNCj4+Pj4gc28gaXQgZmFpbHMsIFBIWVNERVZPUF9tYXBfcGlycSBpcyBub3QgYWxsb3dlZCBm
b3IgUFZIIGRvbTAgaW4gY3VycmVudA0KPj4+PiBjb2Rlcy4NCj4+Pj4NCj4+Pj4gVG8gc29sdmUg
YWJvdmUgcHJvYmxlbSwgbmVlZCB0byByZW1vdmUgdGhlIGNoYWNrIGhhc19waXJxKCkgZm9yIHRo
YXQNCj4+Pj4gc2l0dWF0aW9uKFBIWVNERVZPUF9tYXBfcGlycSBpcyBpc3N1ZWQgYnkgZG9tMCBm
b3IgZG9tVXMpLiBCdXQgd2l0aG91dA0KPj4+PiBhZGRpbmcgb3RoZXIgcmVzdHJpY3Rpb25zLCBQ
SFlTREVWT1BfbWFwX3BpcnEgd2lsbCBiZSBhbGxvd2VkIHdpZGVyIHRoYW4NCj4+Pj4gd2hhdCB0
aGUgcHJvYmxlbSBuZWVkLg0KPj4+PiBTbywgY2xhcmlmeSBiZWxvdzoNCj4+Pj4NCj4+Pj4gRm9y
IEhWTSBkb21VcyB3aG9zZSBYRU5GRUFUX2h2bV9waXJxcyBpcyBub3QgZW5hYmxlZCxpdCBpcyBm
aW5lIHRvIG1hcA0KPj4+PiBpbnRlcnJ1cHRzIHRocm91Z2ggcGlycSBmb3IgdGhlbS4gQmVjYXVz
ZSBwaXJxIGZpZWxkIGlzIHVzZWQgYXMgYSB3YXkgdG8NCj4+Pj4gcmVmZXJlbmNlIGludGVycnVw
dHMgYW5kIGl0IGlzIGp1c3QgdGhlIHdheSBmb3IgdGhlIGRldmljZSBtb2RlbCB0bw0KPj4+PiBp
ZGVudGlmeSB3aGljaCBpbnRlcnJ1cHQgc2hvdWxkIGJlIG1hcHBlZCB0byB3aGljaCBkb21haW4s
IGhvd2V2ZXINCj4+Pj4gaGFzX3BpcnEoKSBpcyBqdXN0IHRvIGNoZWNrIGlmIEhWTSBkb21haW5z
IHJvdXRlIGludGVycnVwdHMgZnJvbQ0KPj4+PiBkZXZpY2VzKGVtdWxhdGVkIG9yIHBhc3N0aHJv
dWdoKSB0aHJvdWdoIGV2ZW50IGNoYW5uZWwsIHNvLCByZW1vdmUNCj4+Pj4gaGFzX3BpcnEoKSBj
aGVjayBoYXMgbm8gaW1wYWN0IG9uIEhWTSBkb21Vcy4NCj4+Pj4NCj4+Pj4gRm9yIFBWSCBkb21V
cyB0aGF0IHBlcmZvcm1zIHN1Y2ggYW4gb3BlcmF0aW9uIHdpbGwgZmFpbCBhdCB0aGUgY2hlY2sN
Cj4+Pj4geHNtX21hcF9kZWRvbWFpbl9waXJxKCkgaW4gcGh5c2Rldl9tYXAtbmlycSgpLg0KPj4+
Pg0KPj4+PiBGb3IgUFZIIGRvbTAsIGl0IHVzZXMgdnBjaSBhbmQgZG9lc24ndCB1c2UgZXZlbnQg
Y2hhbm5lbCwgYXMgYWJvdmUgdGFsa3MsDQo+Pj4+IGl0IGFsc28gaGFzIG5vIGltcGFjdC4NCj4+
Pj4gfQ0KPj4+DQo+Pj4gVGhpcyBpcyBiZXR0ZXIgdGhhbiB3aGF0IHlvdSBoYWQgYmVmb3JlLCBh
bmQgSSBkb24ndCByZWFsbHkgZmFuY3kgcmUtDQo+Pj4gd3JpdGluZyB0aGUgZGVzY3JpcHRpb24g
ZWZmZWN0aXZlbHkgZnJvbSBzY3JhdGNoLiBTbyBsZXQncyBqdXN0IGdvIGZyb20NCj4+PiB0aGVy
ZS4gQXMgdG8gdGhlICJleGNlc3MiIHBlcm1pc3Npb24gZm9yIHRoZSBzdWItb3BzOiBUaGUgbWFp
biB0aGluZyBJJ20NCj4+PiBhZnRlciBpcyB0aGF0IGl0IGJlIGNsYXJpZmllZCB0aGF0IHdlJ3Jl
IG5vdCBnb2luZyB0byBpbnRyb2R1Y2UgYW55DQo+Pj4gc2VjdXJpdHkgaXNzdWVzIGhlcmUuIFRo
YXQgcmVxdWlyZXMgYXVkaXRpbmcgdGhlIGNvZGUsIGFuZCBtZXJlbHkgc2F5aW5nDQo+Pj4gImFs
c28gaGFzIG5vIGltcGFjdCIgaXMgYSBsaXR0bGUgdG9vIGxpdHRsZSBmb3IgbXkgdGFzdGUuIEZv
ciBEb20wIGFuDQo+Pj4gYXJndW1lbnQgbWF5IGJlIHRoYXQgaXQgaXMgb3Zlcmx5IHBvd2VyZnVs
IGFscmVhZHkgYW55d2F5LCBldmVuIGlmIGZvcg0KPj4+IFBWSCB3ZSdyZSBhIGxpdHRsZSBtb3Jl
IHN0cmljdCB0aGFuIGZvciBQViAoSSB0aGluaykuDQo+Pg0KPj4gSGkgSmFuLCBmb3IgY2xhcml0
eSBhbmQgdG8gbWFrZSB0aGlzIGFjdGlvbmFibGUsIGFyZSB5b3Ugc3VnZ2VzdGluZyB0bw0KPj4g
Y2xhcmlmeSB0aGUgY29tbWl0IG1lc3NhZ2UgYnkgYWRkaW5nIHdvcmRpbmcgYXJvdW5kICJEb20w
IGlzIG92ZXJseQ0KPj4gcG93ZXJmdWwgYWxyZWFkeSBhbnl3YXkgc28gaXQgaXMgT0sgc28gdGhp
cyBpcyBPSyIgPw0KPiANCj4gWWVzLCBwZXJoYXBzIHdpdGggImRlZW1lZCIgYWRkZWQuIA0KT0ss
IGZvciBQVkggZG9tMCwgSSB3aWxsIGNoYW5nZSB0byAiIERvbTAgaXMgZGVlbWVkIG92ZXJseSBw
b3dlcmZ1bCBhbHJlYWR5IGFueXdheSwgc28gaXQgaXMgT0sgIg0KDQo+IEFuZCB0ZXh0IGZvciBE
b21VLXMgc2ltaWxhcmx5IGV4dGVuZGVkLCBhcyB0aGUgcG9pbnRpbmcgYXQgdGhlIFhTTSBjaGVj
ayBpcyBwcmVzZW50bHkgaW5jb21wbGV0ZSAoc3R1YmRvbS1zIGNhbg0KPiBwYXNzIHRoYXQgY2hl
Y2ssIGFmdGVyIGFsbCwgYXMgY2FuIGRlLXByaXYgcWVtdSBydW5uaW5nIGluIERvbTApLg0KU28g
c29ycnksIEkga25vdyBzbyBsaXR0bGUgYWJvdXQgdGhpcywgSSBjYW4ndCBleHBsYWluIHRoZXNl
IHNpdHVhdGlvbnMsIGNvdWxkIHlvdSB0ZWxsIG1lIGhvdyB0byBkZXNjcmliZSBvciBoZWxwIG1l
IHdyaXRlIGEgcGFyYWdyYXBoPw0KDQo+IA0KPiBKYW4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpK
aXFpYW4gQ2hlbi4NCg==

