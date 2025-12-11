Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E93CB5A8A
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 12:36:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183948.1506523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTex8-00070p-DG; Thu, 11 Dec 2025 11:35:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183948.1506523; Thu, 11 Dec 2025 11:35:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTex8-0006yd-AC; Thu, 11 Dec 2025 11:35:22 +0000
Received: by outflank-mailman (input) for mailman id 1183948;
 Thu, 11 Dec 2025 11:35:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=81ZL=6R=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1vTex6-0006yX-PZ
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 11:35:20 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77e75564-d685-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 12:35:19 +0100 (CET)
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by PAWPR03MB10182.eurprd03.prod.outlook.com (2603:10a6:102:334::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Thu, 11 Dec
 2025 11:35:14 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%5]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 11:35:12 +0000
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
X-Inumbo-ID: 77e75564-d685-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V+hdc7BzcXkVIkdV4/n1HENa/HjssmWHAdwwooe/QcY3fVSa8KNNNwO2rOCDnAo/23Dl1X/cGdR22ywthu2DYUmh1n4u1l7V/3ZH7GCZosCm07FaQbtQv0I7fCt3J7PV9RTC1+dW6pz+8pvrkXTqhdrtsDa0L6uZkiorG7Xy1hlRRgbkyPOWzMSfLcmZC1ccfeTlBqXYbZ/56ve7/JcHYUHzhKyq7AjrA1ZLZlB2K2KraX5Wuxgu0iprwNExxubdzPL3dODOM/bmzHLSEe6gySvk5WeBflJ+d3P5da+Emox75jvTlYrLr8dXVZEJajY2HsIX9VpurBVRyaotM1wfWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UQxYZA1XYl4u5xI8IHObiHUg9/LsSLFTLPvB6sOqkzs=;
 b=vwsarTARZ5cSRlmHzkb8AEg2PSSeseEdQgFYP6P2qsKKjQh8VtNgnYrctRYR4wLyi8H2htjBzzu+tSb1uexpw+OxUV9B5aLRe8AfbE6pKBxpQm5hZfvTWymt7r2R5roLWyPrLLNNQ33woLghRBe8xqibGiiXOWWy2GJjH0CO6bNutUCFilRIj0f+QPBckhNiSPwX6hqD+hhdlNxnVzUgwNeicOb08qF3Z0JLgMxd7olo1y6ydEj6IKjsQINaCLJpuVdGyz6snq1YmrAAZI5GBSn1mh7CYUVi9XGXKYQEj8/UZr2UGBbOdaw77knlFtQMQZltU/WYp27GbTJj0GLV3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQxYZA1XYl4u5xI8IHObiHUg9/LsSLFTLPvB6sOqkzs=;
 b=ISX9OuSxkcCGgWciMXiKLC5LF2ANIAep4GWwONpPAt8AoXXLFViiNQb4B5gD7AByugTs1TYTVRTE2j9L13R5m7H6hraCfQh9jiKbk6hfcuod1VcEKPD01QAAvf4k0nfwzJ/gXz3eO4ZfpP8uX6iSaWNi1lQo7jYONKYgnX0ltqDG+gvEr+aNQ03QQTbiSF2c+1wXUk8BkHkZ2/6Qlp1JL0iLnLg32sJpYD+uJ2jwRbtAKhyuXqTl3gnKzFyX9X6eQ8eM7zHZhuqf1s25vGVWNF8pb1JH1k7hs6frIESKSUXrDdXzbGnyFQNoeXZlII/2IZ0y14QM1x1P7/bg9sL+4g==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>
Subject: Re-send: [PATCH v3] xen/irq: Delete the pirq_cleanup_check() macro
Thread-Topic: Re-send: [PATCH v3] xen/irq: Delete the pirq_cleanup_check()
 macro
Thread-Index: AQHcFfWhxHP2kMnOQkiD7UseguEusLR0c44AgKiE8gA=
Date: Thu, 11 Dec 2025 11:35:12 +0000
Message-ID: <34f39f92-298d-41e3-b869-fa45ba2bdb09@epam.com>
References:
 <0959802e4fa73b848b2b9e47c57c6daf062e9630.1756149543.git.dmytro_prokopchuk1@epam.com>
 <1af4778e-8a2a-4fa5-a41d-0142947da137@suse.com>
In-Reply-To: <1af4778e-8a2a-4fa5-a41d-0142947da137@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|PAWPR03MB10182:EE_
x-ms-office365-filtering-correlation-id: c5c2bed8-a0d5-40b7-1307-08de38a9590f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?c2xkcVl2VTNmb1hMMmx6enhQMmo2OU0zUTdjKzNrdHRRemp3SExnK1pqdDc4?=
 =?utf-8?B?Y1N0dDc2YWR0ZlFNNy9JUmtObk1NZVFzcGRqM1B4OWR5UkdEQW5BMWdOTS9z?=
 =?utf-8?B?OTlLOWZTSmJzV05CeUVST3Fwc2lCVFQ1STB1VzZPelNCNmJBTW1LTmQvVmtU?=
 =?utf-8?B?TjV2NHY4RkRoS01KY3pybjBoRTZ6eDV3ZktaM0M5UHp1YVlkSkkybkdCVnJY?=
 =?utf-8?B?TS9BSGxxK0Z1NjEvQ29KVVQ3ZkI5bWNKNXBSYjE2MlM3OVQzSU5aYXQ2enlt?=
 =?utf-8?B?b3c3UmloWnExZW9tV29JOEdPUUM0bUkySk5Wd0ZYTHZlb25xUGhFUGlDWEEw?=
 =?utf-8?B?T2l6OFVFVWdmMEpoeVpraW5hT2VneE8yLzg3SUx4eExsYlM1b0hESll1cmFw?=
 =?utf-8?B?UUhLaWNJN00yWUt0SUhSeW9WUWhhSkVJYmM0dGxUS2x5c0NISFloYWhmZ1ZG?=
 =?utf-8?B?VzM1Tkhnd3o1WW1pWFRvUUduUVVYSFBKSjMydlJnb0dNT29qMWJZaUE0YW9K?=
 =?utf-8?B?QWp2Y1lJVktUMGtwbXBkMFQxaDkzNytDeDV2ejQyVzlMdUFnemtHcnoyZGVh?=
 =?utf-8?B?NGJRSklnTXpBbVZPNEJaR0I1TU5lZlRNblpDSTRoRXFyWm42WkhzT09FVWlh?=
 =?utf-8?B?WHVhZGR0WVJ0U0VMKzJqRk9tRGJrdHY1Z00yUngzdVFnMGVEVkl0MHFnM0l5?=
 =?utf-8?B?ZzVxaElVQnlpaFBtQ2pUMGlUY1JPV0lWNkRMVGR4Vk9jYjFYRnMyK3BvSFZB?=
 =?utf-8?B?Unpxa2RpS285Wmo0UjJIZGVvQXBJdEwvazAwVElSRmtiS08zTnpzbnkvVDI1?=
 =?utf-8?B?b3BTL0dVWHZtVHc1M1JqcFd4K3pldWlLRVJ2dEk2QXg4MXNYQkJJQkcxQnhr?=
 =?utf-8?B?L2pJa3ZLUlBhYlFlNVVoVGQ2dkVtKzIwc1YzUDZ6L0NPZkE3SGZPaHlLdWEy?=
 =?utf-8?B?K1ZBUTRidEdtZjVxRDd2YlJ6TVYvSXdSaWEwUU9PZnlCVHZyQ2JrSWI0UXN3?=
 =?utf-8?B?enNDb1ovL1pMZ2ZXVXFlZ24yMEFyNXNsRmdCMDNCaUwwTU1HWHY3R0QwN3RT?=
 =?utf-8?B?Qnc5TDVJTW85ZmpxNlIyZXZYcnhCY2YrVlZFMWZHVS9tSHMzWnJOaERXOFNh?=
 =?utf-8?B?bldiek9oUjdYRlhZUUIrcVh2a0s1YnFwRUlMelFXMTB4TSs5WW5wQmxKTlZ3?=
 =?utf-8?B?YXpGd2Y5RXBsU29aaS9XaWFpZ0xlT05UempuN1RQcXpRcFdOVnp5K0xjcGNM?=
 =?utf-8?B?QXBpL3VNL1l0MDF4cmd3elpRNWJkY2Y4U1RjenFaYUpLa24xbkpENVRqMkYx?=
 =?utf-8?B?Um8yTElqZVFLNFlNTFFwTFhDVTBwT2Y0ZGRSYU9vdUVoUUpzZmhSTFJXcHNz?=
 =?utf-8?B?SVdwakE3RnVuR1pKWTZ6ZVUySTNibDRnK1ZOUm9IZGdtQTdvTmhRWnFhbTBK?=
 =?utf-8?B?ZHczMUN2V3Uya1ozalB0UFdWR3k4Q2xZN04yN2lmYzRaQzdlMUphVTRPa1c5?=
 =?utf-8?B?UU8zR3B2em8vc1JZYlR4MlJGSHdjbTBaUjdOVFhBTjYwRW9lS2VUZ1Ywdnk2?=
 =?utf-8?B?SE5heTRQbG9oRzNCSVdPSjhJRWYxQ1dMeHFLWnVtUFBCTmlHdTMxNzZtc05W?=
 =?utf-8?B?UlVDZVgwY0wySkQyTXVRTzdnOVBkT004SEkzSFVFTzZvaGFTQ3dLMU5RZFVW?=
 =?utf-8?B?TkVwNHhtUVpsUU5va3U4VnhoY2FyREF0SzlaK21vRFJuZFZxeHV2VmVYZUNa?=
 =?utf-8?B?aG5vblFxZ25LZ0k3Smx4cFJFZTVwT0Q0TXVKYWVQRWEwVDIvamZ5L2hoT2Vl?=
 =?utf-8?B?NzUwWStZSTIyTVAyUTlONlEyYnBSak92bVFFQUlzSEYxc2dPcGhTb2w5MVQx?=
 =?utf-8?B?WThjN0E1WmIyZUlHRzA0am5NeVByaitjRUpsSHB3YWVieEZyWWlxQXViRUd5?=
 =?utf-8?B?Z284a2xvdWo1dmVSQlBRL25OSDhPaHZNMFJkcFBwSXcxQm5PYW1XcG1mTkli?=
 =?utf-8?B?QnduekZUbzdxQTVTRDNaYU52SlFhay9kSlkzMFR6blJLZEUwd2R3Q0F2Qjc3?=
 =?utf-8?Q?EVbRFG?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OGk1NDFBaS9JRitENDh2bGt5aU1pMDQzSmY4VWNQdGxwU3dyWGIyTGRhUWlK?=
 =?utf-8?B?czBCZkdFcURHd00vU21qQy9WdXlXZDd0Ym1Ga3d2K2hwRTBsdmRjTlp2aGRL?=
 =?utf-8?B?eDJySjdwNVU3eGk4OFkvNEZ4WTFTT3BQOC91cVhySlhyTjlmY1VIK3N0K0JR?=
 =?utf-8?B?U1RqQnZSb0VScW80V0hKdGt0K1FBZ3NxYXdLRXFmS0tmWkU5akZvblJaY1Ro?=
 =?utf-8?B?UTVOUTdreSt0ek15QzBFcWp0WGZUOGZoSEFQMzdvRzVIdlpnNVExcXlJMWV6?=
 =?utf-8?B?R3Q0akZDV1pJd0J5dWNxNzZ2dVpvTjVtQkw1SE9Za1NIMDRzcmVPdEI2bFBR?=
 =?utf-8?B?UjY0aW5aa2ZJaFhtTk93R0x5emw0WGhidzRPOTY3RFdxaXJWc2JQbzlvVE9R?=
 =?utf-8?B?RXVtdW1KaGJPSEdTUmx2SjdKb1Z1elQ1TkpxWC9NczdOWlhTWWcwbkpNUEdk?=
 =?utf-8?B?dWlFaWg1QjFnenE0cUFOcXlQQUNmYXdubjNBSXE4Zmh5cm5paWE1UXY4eTM3?=
 =?utf-8?B?a2JOOGFReFY5UVZVQ09jUnU5M05sWEMrQlp1WWFFdjVpS2VDb21sN3hOTjhC?=
 =?utf-8?B?dkRSd1JWb01WQ2xlVVFlRmxPcEg2bStvVG5SQUJFR2xGajlVVDNyM2tOc3BS?=
 =?utf-8?B?ZGU5cVNIMGRjR2dHaVhHK0VYTXpYa3VlSG00U015ODI5N2NTNjBOV3VNeUYr?=
 =?utf-8?B?aC80ZlZObmlaMEhaV1VaZ2ZrU3ZqWFBxNkYrS1ArdVFNby9VTHlnZE9GdFlZ?=
 =?utf-8?B?QURISWo3R3hHcHJEQ1BSNFFxdFh3VTlrdG9kRS9xQWtXaktuOVhvZFlpZy9y?=
 =?utf-8?B?Ujl1S2ZXZEdNdVRYcCt0STkwSXlhbURQOTdGT3BHdUVZY1V0NEpwbUhkSEZP?=
 =?utf-8?B?WmVucjhTUHgvZ05rV2luQkFOUzNTb1labXRKRDd5Nno2OGQyOTJwcEl5aERH?=
 =?utf-8?B?SkRPM1JXdHlnY2VLVHhKNHkxQTZXVlJNeFZzOXBxWTJDellJZ3VGYkNkQUx4?=
 =?utf-8?B?aUtiZ09Md1FERlJvSUs4UEwrYlo3NEt4NGIyVXNRM3BrbWVLeUVQWVZpMSs1?=
 =?utf-8?B?T2trNHVrWHlCK1FkdVRLRGFZclVtTHUxelpacWxoMi91cWF3ajVzRGRTT3pG?=
 =?utf-8?B?Q3paNTQyUFNZVWQ1eUFuQWJHa3ltcjVlU1hQaUNuRjNhMWtLaUg1Y2FNejJG?=
 =?utf-8?B?TDI2WDVzdllEVXczWW5MQUw5MmEwd3FVNEgzcDlNTjN1SFZBZGtKU29WSGU4?=
 =?utf-8?B?Wm1iSHhjNk9LRjJhVHdsSTB0TlpLRkx5MWtMWnJTTHUzR0Q3UGFWL1pJNzNT?=
 =?utf-8?B?VndaWDJvYi9jeE51QXFXcmorcVpIUUx1UDVoR1NCY01nZ0s4OVV6UkRmRXM5?=
 =?utf-8?B?THdTYUpxQzNtbHBGUHhRVFV1a2ovdkduMWtnNVFQUkNKZHVFaWxzcDVxSWFx?=
 =?utf-8?B?MXZGclY0bGpsREJqTThQZGFSU0Y1cDNXTjVYSjdCMm1mUlQ4UTBGMThyMGZX?=
 =?utf-8?B?QUFlQXhoWThBRkEyRlJacWZyVVRkanFKNGlGMk5NVzRHbDc3T0pva3prQm9j?=
 =?utf-8?B?WHhwZ2ZNeGdFcG5XTkcwOVhaazl1Z0xSeFQyWnpjK1NmbWd6czZjb2R0ZklS?=
 =?utf-8?B?b0hIa3lCcEQ1SjhBUno1QzJWanBXTjRUblM1aHJtc1VBQzZ6VUpsTWJzY2Vw?=
 =?utf-8?B?MlJiYVJSMFBxcXZsUzZMSnR1QXUzTTZFV3NLaE9ieWlNSGUyMzJqMEwzblVR?=
 =?utf-8?B?UjFMWWVEcTg0U0RCRi94RExtbTlaM0NXSFEyYUo0Ym80RnlMUmxIWC8zUkxD?=
 =?utf-8?B?UFN6L0pTQ3JtWFQ1V0I5TCtKTTFQcnNlMTJlY05UQ3MyUS9CVXFiN050a3Rw?=
 =?utf-8?B?S1VKV1R1em96M2hvTXlhVUpVRDd2NzRWcnowM3RRcVdFSU1sNHFRNnJNNWZ3?=
 =?utf-8?B?TWJTRnVtUjhpZ2doSi81TGlrb1dvaU8rc0hJN3VhcUR0dGhhY3FlR0JKRStl?=
 =?utf-8?B?VVg5NHJKdDljaUJHSy9nT2FmWVdidFFkTHJueFlNMHczWVB0YnhLUVlGNFlO?=
 =?utf-8?B?VHBTSFpVQlRJRHFzNno4S252ZFY0UWZkK1NHbVJpR2FVdzl6UnNZZHRaazZX?=
 =?utf-8?B?NkdRN05HRy9IeUR1aGJ4UDN0eTA4ZGFsQjFWOUlqam41elgvOWJMdm9TQ3dS?=
 =?utf-8?B?L2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E33BF7857E410D4DBC8E1815DB7E73C3@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5c2bed8-a0d5-40b7-1307-08de38a9590f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2025 11:35:12.7546
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tYMBkWTkPEAZSZzUv2zHOoTSaDUqF9ryjs4hoUv52lzppHa85+phYwDPG3wzjHHoaymaSoadI6nuxht9cs3jcGWc/y2A5PdLLQhsHcmreSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB10182

DQoNCk9uIDgvMjYvMjUgMDk6MDcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNS4wOC4yMDI1
IDIxOjIyLCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+PiBGcm9tOiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPj4NCj4+IE1JU1JBIFJ1bGUgNS41IG9iamVj
dHMgdG8gYSBtYWNybyBhbGlhc2luZyBhIGZ1bmN0aW9uLCB3aGljaCBpcyB3aGF0DQo+PiBwaXJx
X2NsZWFudXBfY2hlY2soKSBkb2VzLiBUaGUgbWFjcm8gd2FzIG9yaWdpbmFsbHkgaW50ZW5kZWQg
dG8gZW5zdXJlDQo+PiB0aGUgY29uZGl0aW9uICdpZiAoIXBpcnEtPmV2dGNobiknIGlzIGFsd2F5
cyBjaGVja2VkIGJlZm9yZSBpbnZva2luZw0KPj4gdGhlIGZ1bmN0aW9uLCBhdm9pZGluZyBlcnJv
cnMgYWNyb3NzIGNhbGwgc2l0ZXMuDQo+Pg0KPj4gVGhlcmUgYXJlIG9ubHkgYSBoYW5kZnVsIG9m
IHVzZXJzLCBzbyBleHBhbmQgaXQgaW5saW5lIHRvIGJlIHBsYWluDQo+PiByZWd1bGFyIEMuIERv
aW5nIHRoaXMgc2hvd3Mgb25lIHBhdGggbm93IG5lZWRpbmcgYnJhY2VzLCBhbmQgb25lIHBhdGgN
Cj4+IGluICdldnRjaG5fYmluZF9waXJxKCknIHdoZXJlIHRoZSBleHBhbmRlZCBmb3JtIHNpbXBs
aWVzIGJhY2sgdG8gbm8NCj4+IGRlbHRhLCBhcyBpdCBmb2xsb3dzIGFuIHVuY29uZGl0aW9uYWwg
Y2xlYXIgb2YgJ2luZm8tPmV2dGNobicuDQo+Pg0KPj4gV2hpbGUgdGhpcyBjb21wbGllcyB3aXRo
IE1JU1JBLCBpdCBzaGlmdHMgdGhlIHJlc3BvbnNpYmlsaXR5IHRvDQo+PiBkZXZlbG9wZXJzIHRv
IGNoZWNrICdpZiAoIXBpcnEtPmV2dGNobiknIGF0IGNhbGwgc2l0ZXMuDQo+Pg0KPj4gTm8gZnVu
Y3Rpb25hbCBjaGFuZ2VzLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBEbXl0cm8gUHJva29w
Y2h1ayA8ZG15dHJvX3Byb2tvcGNodWsxQGVwYW0uY29tPg0KPj4gLS0tDQo+PiBDaGFuZ2VzIGlu
IHYzOg0KPj4gLSBhZGRlZCBiYWNrIHdvcmRpbmcgZnJvbSB2MSwgb3JpZ2luYWxseSB3cml0dGVu
IGJ5IEFuZHJldy4NCj4gDQo+IFRoYW5rcy4gSnVzdCB0byBtZW50aW9uLCB0aG91Z2ggLSB5b3Ug
Y29waWVkIGl0IHZlcmJhdGltLCBpbmNsdWRpbmcgdGhlDQo+IHR5cG8gKHNpbXBsaWZpZXMpLiBD
YW4gc3VyZWx5IGJlIGFkanVzdGVkIHdoaWxlIGNvbW1pdHRpbmcsIGlmIGFuZCB3aGVuDQo+IHNv
bWVib2R5IGFja3MgdGhpcy4gKEkgdGhpbmsgaXQgaGFzIGJlY29tZSBzdWZmaWNpZW50bHkgY2xl
YXIgdGhhdCBJJ20NCj4gbm90IGdvaW5nIHRvLikNCj4gDQo+IEphbg0KDQpIaSBTdGVmYW5vLA0K
DQpwbGVhc2UsIHRha2UgYSBsb29rLiBNYXliZSB0aGlzIHBhdGNoIGlzIE9LIGZvciB5b3UgKGl0
IHJlcXVpcmVzIG1pbm9yIA0KdHlwbyBmaXgsIG1lbnRpb25lZCBieSBKYW4pPw0KDQpUaGFua3Ms
DQpEbXl0cm8u

