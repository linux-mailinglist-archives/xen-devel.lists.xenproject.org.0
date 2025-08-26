Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEDAB3621A
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 15:16:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094388.1449698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqtVp-00032k-Rf; Tue, 26 Aug 2025 13:14:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094388.1449698; Tue, 26 Aug 2025 13:14:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqtVp-000301-On; Tue, 26 Aug 2025 13:14:57 +0000
Received: by outflank-mailman (input) for mailman id 1094388;
 Tue, 26 Aug 2025 13:14:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pZJD=3G=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uqtVo-0002zu-Gw
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 13:14:56 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a74a1a96-827e-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 15:14:53 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by GV1PR03MB10894.eurprd03.prod.outlook.com (2603:10a6:150:202::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 13:14:50 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 13:14:50 +0000
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
X-Inumbo-ID: a74a1a96-827e-11f0-a32c-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zLgR0RXgHUWUx8bl6RlxL+e+TZDWoMWynab84FW4Mt1TOyCKzxLcu+O0Xa2sEqCKa7A0hsttO2tXsTxchRjOoZQ/wrEmNyK10BrxIPxslMxfFLqiqxl3nKdWRD++i5v+z6RlR2psmcKKt5Iku7H5vhMjVzR0+hgUAaXrbv2MUIgQE4F8xJZudrOJEiRjnVm2uoD/7rf5hfNciUN+HUUSCf5p4zNGa+pKrN8p4zeeWho0mL1fh8+0xOnutjEXlkiljxtYKAP8yM+UAgNri8YS8SM+sJZnEkPVOW0zRE99LUpVyyRcxmw7MqPXLQqjJko4apAVYs2ZXm6NHsIwDRu4ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9jVyVjiXzqcxNxQqZeMhfDy5QM7dp/C8zFY+rhrgafc=;
 b=i373He44g1uhmAPigarXJVfE3oTUYYb+QGe3HOEe9a+3h+2MxZ+tGvTtOcdS5xUiGEgVGPKupqTYh0LzLPL89EncWcG0tdujgJOs9KVEB4n5Aqa6+bqWVB/l4wk+Nl5MN2dYImyd1gypfI4em9PM8sxVGyferhWOVjUjN94aEjeP6DrcAUvS9E+CV/Hiu4GCH83FDXt0FV0mJWr5w2QbQ39jrMkmGLByKO+EHlygExzT5HTkzLfj9ixT0RsiXjIg0j57v7VmId01Mt+McgqZg1Hjg26HXg/rnfqq+C14DLwvKBHLSgu/H+nUpTnWOKa33CZZ5XXMuUoWHcxnd27L1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9jVyVjiXzqcxNxQqZeMhfDy5QM7dp/C8zFY+rhrgafc=;
 b=deXmxwhd3XowAkA74D/yNHDybwLMYPC4L3AjI5uqMIvZN9/SUABH3xGedeomLwfUDBiDOWZFETgr/cyVko8gbVlkNlYYDJk1gsaMTO8b2OjyxxyldkjDvy/J8mKdxpUdA8Nfuykk12ZNkqsoB2Xar6BNQZ8cxZ+DGpGAaLuK5FOE3GZxLCEo/vfZuUspm22/61x7Ef1+YeDkZ54c+v3MVRCVMiuYi3BGZ0W10Dv9wxZfNf/eDdnARqEUPC3AV5fmFKTlbWszP2SR0cH4qdvRSppteGYP7N5fQwjsoWEsmszDkc9Bsxv6JeZBwSuNzjAJqw0jtYt9YlL54dclzrsVgw==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>, Jan Beulich
	<jbeulich@suse.com>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony
 PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] misra: add deviation of Rule 17.7
Thread-Topic: [PATCH v2] misra: add deviation of Rule 17.7
Thread-Index: AQHcFlwdO9JZfbniJ0qkcPaDWppdx7R0jhQAgAADC4CAAFj1gA==
Date: Tue, 26 Aug 2025 13:14:50 +0000
Message-ID: <dc6d7445-3abb-485b-9651-15e3aea9ca52@epam.com>
References:
 <812b78119cee801662a31d39b556cb453aa69508.1756192362.git.dmytro_prokopchuk1@epam.com>
 <204a1526-7e3f-4b91-b1ee-95f3d89ff756@suse.com>
 <112a4ab83bf2abce09d4ff1b67671847@bugseng.com>
In-Reply-To: <112a4ab83bf2abce09d4ff1b67671847@bugseng.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|GV1PR03MB10894:EE_
x-ms-office365-filtering-correlation-id: bfbe4c06-fa1d-49d2-a14a-08dde4a289f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|42112799006|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dEJzTERVR2huL0dlb3RhNytIOVp5TlVZK3hyeDQvd3pDNmNSMnV0SE9lVVJ1?=
 =?utf-8?B?aFU0bnlicGJzbk9KR3p6VzVCTGJYM3R4c3V4akwxaUs5UlRLQUZvYVpPZ2Rz?=
 =?utf-8?B?Zjk1cDFRbUZTc2V5ZjJLYmxSS3dIQTZmNE01RU9sQTRFUDE0Y0VIandqeEVu?=
 =?utf-8?B?ZnpqZHpubEhxMndJMHFmOUZXVXhqQjhwbmRSYi9vMlFRVldpdVV0MnBad3Bw?=
 =?utf-8?B?WmVGbGRNalBSbUV4U29SbTNDNHFGTktjc2hiaUVDVXdUd2JzWTZvMW1hbWVi?=
 =?utf-8?B?TlFSOWhJMEpIcnZyR3owM0FQWU94dnBMNHRmeUhhSGFKS0J5SGp1YVZKVzhN?=
 =?utf-8?B?OHhudU1hZDRHMGVnNGhieHJ2VTBUYjNpL3dyOTFUT0RtdEFQVHF3NEpka3J5?=
 =?utf-8?B?UUYvU2RKQm84KzVBeWdpUnJtUWNFTXpQRUFabE5oWnpyRVhiSklZL2xCY2Vi?=
 =?utf-8?B?UC9xYmhtWGpLZTBqanhlVGQxa3BwYUhVcTJKWDVIZ0J2WW82MklEalptTzJP?=
 =?utf-8?B?YU5waVgyVElBZjFUUjB4MDVSOUxPd295VVlvU0FBWE1TeWxJcU1iemxMa1VQ?=
 =?utf-8?B?K0ZMZjhTbURFN0hSS1EveE5FUnpYRWVXYUFLK3VEdWdRSzN5YmQrSmZ0K1dW?=
 =?utf-8?B?OFd0SHp1SG5mOW9teERqS1hCekJpZXlvMDNLbGwrVU9xeEtRcEJlbGZVNWM5?=
 =?utf-8?B?QXRLZFNCTWE2RXFQZ2Y3cGV2bUtkQUREZ1hXQTBHaWdFYzFiQzNEUHBmL3A2?=
 =?utf-8?B?MU9UVWs5eWVmcXNYQmNpU05tUldkazNSWHlxVkgrV3dUTjVjM0V6eStyWmZI?=
 =?utf-8?B?SFRpRjJpYXdjRlJadUc0TzRTRDU0VVNXN09MZ2hKU3hWQlFiRHRQaDREZ204?=
 =?utf-8?B?Q0l6UVpUd2Jqeko2NjNOd1Z1dnFRSGh3SUxDbGlqWnNtN1Rjd013MjZaK1dS?=
 =?utf-8?B?bUFDcE41bFRRU2R1ZHNRTlpHR1gyVmZzSUFWOTJXQ1ZJZ010aHRkcjRIUENI?=
 =?utf-8?B?Nm1SQ1ozZGZwdmpoU3k4RU1oRHNlcEVTTUNpTjNhVEtaZy90c1RaQXpLUnBV?=
 =?utf-8?B?Z1VwOHJPVUxUbVdOb09RSHMvemFXL0FEeFRrVjJ1TUlsdnBLUEVzQUtCRVJL?=
 =?utf-8?B?dlBFLzJDNFFmSmwwUCswWVJlVFJSTDA4OENQTnZJS2JIbWFJM0VqeGhMYS9z?=
 =?utf-8?B?b2dHNXZDaGZORTBzMWxVMGE1MnRnVXdkWW5ndWpHVkMyaHVTbXJGbmd3VzBU?=
 =?utf-8?B?RDBxa2ZUcDdTempPMGpqeTF1a2N6aDZnNG56WUtQNUdHbnA4dnFiM2tUakwz?=
 =?utf-8?B?a1RPVFM4bFJCcFlvTUhaaHRlRnhkUmJ5UElETE1nbUZ0Zll4TnpVNWhpWVhn?=
 =?utf-8?B?eklQNFFGYkZFVlg0R1doVWx3eStXc1hJYTRiTE9jZ3Q3Z2JYSUhOUWsydXpV?=
 =?utf-8?B?d1VIS3RDMHdyV1JIU1N3NnZzSVlzR1Q4NmQ5Nk5mUUVXU24xL3N3TnpzT2kr?=
 =?utf-8?B?cS9oK3BGYWtHbGZRdmpoMWVtY2tsQTZQUzdxZVl1QjZBOEhzamZteGhjSmY1?=
 =?utf-8?B?em9NMlcvWEtDeGRnQ0J2M0llcmNkREtVV2dHb3Q3ZDdDQkRaVzVJbHdxdXZz?=
 =?utf-8?B?VExCcStUdkNRYkZGK0U3OERLSFByZXAybXZRdWxkL3E5Q0x0dGFRVk16bVhR?=
 =?utf-8?B?MG1na09lcm5kdmdaR01DRWt1d2JXVmdicDVLL1BZVzdidUpUbktzWkxpYkZU?=
 =?utf-8?B?U2cyWVVvclZKOVg5eER1V29PMkkrYUpDbFpQUTRDbFNYa0t4MU9UNnhZKzFD?=
 =?utf-8?B?cmRXVzl5ZnYzUXJmZTFjamxLSVhVbmx5R3ZDWUJINUgxcmJETWdvVmlQakxI?=
 =?utf-8?B?azM3R1kxSmIrWEVXaEIvSjJLUnAweEJrRkFhRDNISk4xRnJ5RVhvY2Zmblha?=
 =?utf-8?B?eUhidnhRczRmaEV3ZmhlRHV1dmhpZHVhM01WRE83VEZXbHlsUXEvb1FLUUE1?=
 =?utf-8?B?Z0NJS2JaaTZnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(42112799006)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WUNvOXg1eGtRdVZRVU1nL2ZwZWJIdENMWkx1c2Q3bWx3QWdMOGQ0Rmt4dDBh?=
 =?utf-8?B?Y1FQZWJQZnA0U3MzRm1PTFgxcXp4bUhlRXFucVpielZBcjYxZU1JaFE5anVq?=
 =?utf-8?B?S2lVSjRISzBJTlhSYk52eU1FMWtBSDFjVnFnU3RCMUhMRGpzVjIrY3MraWNs?=
 =?utf-8?B?WGNMdUdrK1hReU4yaXg0ZGRRZnRSTVNyN0w3OGY0V2NqZllKUUdXSTBvSlFJ?=
 =?utf-8?B?cDJXc3hZQWhJbVpURjMxOWJGRVlXa3ZyRkVESEhSdmd1VUNYUTBCQXl1NGdt?=
 =?utf-8?B?dlhzczFNMVJwa3hoQ3hRTU4vVUk2ZzFjM3NabUpQdHdtc3UwN1NPRlJPMTg3?=
 =?utf-8?B?VEdSUTcxR1BPaitRTXNjbFFrK0xEaER4NmtEaUowU2xWeWNnZDJYbEREMWFU?=
 =?utf-8?B?UmQ2WTQ3cFFHcWlveGp6bFd5N0hUVS9WdFlGNXFSN01hL09ZeWU3TFBMa3FF?=
 =?utf-8?B?TU1OYlcrY01FZTRNMUkvbFFKUEdBaktQY0N2N1hNOURXblIvc1Y0YlREK3Nw?=
 =?utf-8?B?Q21TWjJiRVlRS09hWVBraCsvTExoZTlUcEFuZGNrdVQ1cFMyejhwNWR5MElI?=
 =?utf-8?B?ZkhqTWx0Y21JSHZMeG8xMTlwaUhtU0kxdjQwU1pxdU9sYjlOZ1IrU285cFBY?=
 =?utf-8?B?Q3Z0WDFsTjVmZG1zYWdvRzhkLzhMbVhUZWlQbmlkL3l3S2JxeG5WcG5pTzk2?=
 =?utf-8?B?WVJ1dmZZV2FNTHVhWXoyQnVmMk5FamRQQi9wYmxuQ1hOTUFaTEpTNkpuVEFl?=
 =?utf-8?B?ZHVualZUVjZoUVV0K1VTUDhXMWxyeS92M1JPdndrMzRSUGZtTHg0MWFYT0dw?=
 =?utf-8?B?TS81SXhJZ0p6ZWRrR1A1S0tZQ0kxbTNxNWt0UzRIWk9zVGR5UU91ekRHbzhi?=
 =?utf-8?B?NjdjT1hPaDhjVk1vcmxydTdhR09XTGlpWEliR2M5NkZUOWdGeXJSa2w3R3BZ?=
 =?utf-8?B?MjBSYUQ5Z2dFcThzQWpKMEZ3QURwZE0xNWJGVGtoNktObkdsYi8yMUpxc0U0?=
 =?utf-8?B?QkMrQlVoS3Nsa2NrRXhObTdxOXVwek10WXl3WkVwa2NRUDFLTG5lbUFxZkRp?=
 =?utf-8?B?bjYrMDZ1d0pqb0x6RTd4SXJ2c1pQblMzV3ZjWEMwaEFxN2sySHZSeXRsb2JH?=
 =?utf-8?B?QTdDQTdzUmxPbGdvYXZtMkxRUHNhRWxLdzgyYWkrenViQjBjRGdUd3BNUUJw?=
 =?utf-8?B?cjladDd5VEE0Z1RkV2tEWko5eEFuakRDY3p6TVhIeHB1ZVN2RlB1VC9tQWox?=
 =?utf-8?B?ZGlDdEVsK1hHK0ZKZnAwc3ZCbEFYRkdTanRYRVFtd3g2YWk5bWlUVXd6Q2tt?=
 =?utf-8?B?dmpOOFQ5Q1Nic2hudlJrRjJYQkhoZkdkNVYyUU90MHB6Yy9oWU1ZbGYxVXhL?=
 =?utf-8?B?SWliaXo4VjNlWXpTMUZBa3VzSWtYZTN5YktpWGxnSGFZZUpYa0VBaWw0dmMz?=
 =?utf-8?B?MFR0OEdrcmIzSDhRSU8vWC90VzhNZ2d5SjRnRXIvZUxGRkJTaExJY2VVVXpG?=
 =?utf-8?B?dzBaNnNTOURJT1VvWW5CbWlKZEY0SU5iMUhaVjBkQTdOaEE1K2M1WndGd1o4?=
 =?utf-8?B?TFNJYytvQ3Q5aTdJSnMxRVc4OXBKVWN6NTUrZHlHQ1JuYjNPQzB0WEppMHUv?=
 =?utf-8?B?RGlnSHRnbUVmeklyeUJGK2JpK3cxVWJrcTgxSEV0dWNtWkxza1BoeGM0WHU5?=
 =?utf-8?B?QXFpU2dXN2xRa2tDMytlRmVMa2VrTGRHRTNQY05Ueitld3QxYkJmelVBK1A0?=
 =?utf-8?B?SE5zdDZkaVZncTl6VnlYcCtITzhLNjZXVEFHd3JjTFp2ZlRYWWdSZCtQOVV5?=
 =?utf-8?B?SWhFR0hXVzhXWEMydFdZQkFpa2NEdDNNd1pPaG1NcGZjV0I5UUh6S1kvaENX?=
 =?utf-8?B?SUJ0eXJKdWVDRjlHT1YwaUdOL0VrbG9WOHZaYStQWWl4TGhWSU9XNG4vOWxq?=
 =?utf-8?B?cW1QQXpvSUhEa0t4Vnk1RXRYaHREOWZhMDExbWdQMUJ3aU9sUzlhL0I5aU5k?=
 =?utf-8?B?TXB4VEMrNElzc1Nza0hjWXZGZ25TQnpPYXR6d1FQOFNFVFdGUXo2aVZXR1Y1?=
 =?utf-8?B?bEg1L1FhWUZjc0dYU3NIZng0dkM2OGhZRFUrTnhMc2dLb3AwNzFuNEd1dTZk?=
 =?utf-8?B?WVdMeVlyVHNtSjh0NzN2VHNhMFFhK1RXNXhGYzArSU4xTkk5K1cyY0ZZS3p0?=
 =?utf-8?B?U1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F973438477E8C240945CB90FD27A3A69@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfbe4c06-fa1d-49d2-a14a-08dde4a289f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 13:14:50.6222
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3UtNQkrgI+9oZeDlnsujP/OWoC3TzVkspeiT5Y331Wj9jz7WgEP3RUZAh+Lc2dlqgi+6CobOiNTlNOz166v/5O34KQherDjfiwNepY/dyFY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB10894

DQoNCk9uIDgvMjYvMjUgMTA6NTYsIE5pY29sYSBWZXRyaW5pIHdyb3RlOg0KPiBPbiAyMDI1LTA4
LTI2IDA5OjQ1LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IE9uIDI2LjA4LjIwMjUgMDk6MzYsIERt
eXRybyBQcm9rb3BjaHVrMSB3cm90ZToNCj4+PiAtLS0gYS9hdXRvbWF0aW9uL2VjbGFpcl9hbmFs
eXNpcy9FQ0xBSVIvZGV2aWF0aW9ucy5lY2wNCj4+PiArKysgYi9hdXRvbWF0aW9uL2VjbGFpcl9h
bmFseXNpcy9FQ0xBSVIvZGV2aWF0aW9ucy5lY2wNCj4+PiBAQCAtNTc1LDYgKzU3NSwxMSBAQCBz
YWZlLiINCj4+PiDCoC1jb25maWc9TUMzQTIuUjE3LjcsY2FsbHMrPXtzYWZlLCAiYW55KCkiLCAN
Cj4+PiAiZGVjbChuYW1lKF9fYnVpbHRpbl9tZW1jcHl8fF9fYnVpbHRpbl9tZW1tb3ZlfHxfX2J1
aWx0aW5fbWVtc2V0fHwgDQo+Pj4gY3B1bWFza19jaGVjaykpIn0NCj4+PiDCoC1kb2NfZW5kDQo+
Pj4NCj4+PiArLWRvY19iZWdpbj0iSXQgaXMgc2FmZSB0byBkZXZpYXRlIGZ1bmN0aW9ucyBsaWtl
ICdtZW1jcHkoKScsIA0KPj4+ICdtZW1zZXQoKScsICdtZW1tb3ZlKCknLCBhcyB0aGV5IHJldHVy
biBhIHZhbHVlIHB1cmVseSBmb3IgY29udmVuaWVuY2UsDQo+Pj4gK3RoZWlyIHByaW1hcnkgZnVu
Y3Rpb25hbGl0eSAobWVtb3J5IG1hbmlwdWxhdGlvbikgcmVtYWlucyANCj4+PiB1bmFmZmVjdGVk
LCBhbmQgdGhlaXIgcmV0dXJuIHZhbHVlcyBhcmUgZ2VuZXJhbGx5IG5vbi1jcml0aWNhbCBhbmQg
DQo+Pj4gc2VsZG9tIHJlbGllZCB1cG9uLiINCj4+PiArLWNvbmZpZz1NQzNBMi5SMTcuNyxjYWxs
cys9e3NhZmUsICJhbnkoKSIsICJkZWNsKG5hbWUobWVtY3B5fHwgDQo+Pj4gbWVtc2V0fHxtZW1t
b3ZlKSkifQ0KPj4+ICstZG9jX2VuZA0KPj4+ICsNCj4+PiDCoCMNCj4+PiDCoCMgU2VyaWVzIDE4
Lg0KPj4+IMKgIw0KPj4+IC0tLSBhL2RvY3MvbWlzcmEvZGV2aWF0aW9ucy5yc3QNCj4+PiArKysg
Yi9kb2NzL21pc3JhL2RldmlhdGlvbnMucnN0DQo+Pj4gQEAgLTU3Niw2ICs1NzYsMTMgQEAgRGV2
aWF0aW9ucyByZWxhdGVkIHRvIE1JU1JBIEM6MjAxMiBSdWxlczoNCj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgLSBfX2J1aWx0aW5fbWVtc2V0KCkNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgLSBjcHVt
YXNrX2NoZWNrKCkNCj4+Pg0KPj4+ICvCoMKgICogLSBSMTcuNw0KPj4+ICvCoMKgwqDCoCAtIEl0
IGlzIHNhZmUgdG8gZGV2aWF0ZSBmdW5jdGlvbnMgbGlrZSAnbWVtY3B5KCknLCAnbWVtc2V0KCkn
LCANCj4+PiAnbWVtbW92ZSgpJywNCj4+PiArwqDCoMKgwqDCoMKgIGFzIHRoZXkgcmV0dXJuIGEg
dmFsdWUgcHVyZWx5IGZvciBjb252ZW5pZW5jZSwgdGhlaXIgcHJpbWFyeSANCj4+PiBmdW5jdGlv
bmFsaXR5DQo+Pj4gK8KgwqDCoMKgwqDCoCAobWVtb3J5IG1hbmlwdWxhdGlvbikgcmVtYWlucyB1
bmFmZmVjdGVkLCBhbmQgdGhlaXIgcmV0dXJuIA0KPj4+IHZhbHVlcyBhcmUNCj4+PiArwqDCoMKg
wqDCoMKgIGdlbmVyYWxseSBub24tY3JpdGljYWwgYW5kIHNlbGRvbSByZWxpZWQgdXBvbi4NCj4+
PiArwqDCoMKgwqAgLSBUYWdnZWQgYXMgYHNhZmVgIGZvciBFQ0xBSVIuDQo+Pg0KPj4gSSByZWFs
aXplIEkgbWF5IGJlIG92ZXJseSBuaXRwaWNreSBoZXJlLCBidXQgaW4gZmlsZXMgbmFtZWQgDQo+
PiBkZXZpYXRpb25zLiogSSBmaW5kIGl0DQo+PiBvZGQgdG8gcmVhZCAiSXQgaXMgc2FmZSB0byBk
ZXZpYXRlIC4uLiIuIEkgZnVydGhlciBmaW5kIHRoZSB1c2Ugb2YgDQo+PiAibGlrZSIgb2RkIHdo
ZW4NCj4+IHlvdSBlbnVtZXJhdGUgdGhlIGNvbXBsZXRlIHNldCBhbnl3YXkuDQoNClVwZGF0ZWQg
d29yZGluZyAocHJvYmFibHkgZm9yIHRoZSB2MywgaWYgaXQncyBmaW5lKToNCg0KVGhlIGZ1bmN0
aW9ucyAnbWVtY3B5KCknLCAnbWVtc2V0KCknLCBhbmQgJ21lbW1vdmUoKScgcmV0dXJuIHZhbHVl
cyANCnByaW1hcmlseSBmb3IgY29udmVuaWVuY2UuDQpUaGUgY29yZSBmdW5jdGlvbmFsaXR5IG9m
IHRoZXNlIGZ1bmN0aW9ucyAobWVtb3J5IG1hbmlwdWxhdGlvbikgcmVtYWlucyANCnVuYWZmZWN0
ZWQsIGFuZCB0aGVpciByZXR1cm4gdmFsdWVzDQphcmUgZ2VuZXJhbGx5IG5vbi1jcml0aWNhbCBh
bmQgc2VsZG9tIHJlbGllZCB1cG9uLiBUaGVyZWZvcmUsIGRldmlhdGlvbnMgDQpmcm9tIHRoaXMg
cnVsZSByZWdhcmRpbmcgdGhlaXIgdXNlDQpjYW4gYmUgY29uc2lkZXJlZCBzYWZlLg0KDQpEbXl0
cm8uDQoNCj4+DQo+PiBJIHdvbmRlciB3aGV0aGVyIHRoZSBkZXZpYXRpb24gd2FudHMgZ2VuZXJh
bGl6aW5nIGFueXdheTogDQo+PiBJbmZvcm1hdGlvbmFsIHJldHVybg0KPj4gdmFsdWVzIGFyZSBn
ZW5lcmFsbHkgb2theSB0byBpZ25vcmUuIFRoYXQgaXMsIHRoZSBFY2xhaXIgY29uZmlndXJhdGlv
biANCj4+IHdvdWxkIGJlDQo+PiBsaW1pdGVkIHRvIHRoZSB0aHJlZSBmdW5jdGlvbnMgZm9yIG5v
dywgYnV0IHRoZSB0ZXh0IC8gY29tbWVudCBjb3VsZCANCj4+IGFscmVhZHkgYmUNCj4+IGJyb2Fk
ZXIuIFRoZW4sIGZvciBleGFtcGxlLCBvcGVuLWNvZGVkIHVzZXMgb2YgdGhlIGNvcnJlc3BvbmRp
bmcgDQo+PiBidWlsdGluIGZ1bmN0aW9ucw0KPj4gd291bGQgYWxzbyBiZSBjb3ZlcmVkIHJpZ2h0
IGF3YXkuDQo+Pg0KPiANCj4gV2hpbGUgSSB1bmRlcnN0YW5kIHRoZSBwcmFnbWF0aWMgcmVhc29u
aW5nLCBmcm9tIGEgTUlTUkEgY29tcGxpYW5jZSANCj4gc3RhbmRwb2ludCBpdCB3b3VsZCBiZSBi
ZXR0ZXIgbm90IHRvIG1ha2UgdGhlIHdyaXR0ZW4ganVzdGlmaWNhdGlvbiBhbmQgDQo+IHRoZSBh
Y3R1YWwgZGV2aWF0aW9uIGRpdmVyZ2UsIGFuZCB0aGVuIHdpZGUgYm90aCB0aGUgRUNMQUlSIA0K
PiBjb25maWd1cmF0aW9uIGFuZCBpdHMganVzdGlmaWNhdGlvbiBzdWl0YWJseSBvbmNlIG5ldyBj
YXNlcyB3YW50IHRvIGJlIA0KPiBkZXZpYXRlZC4gT3RoZXIgdGhhbiB0aGF0LA0KPiANCj4gUmV2
aWV3ZWQtYnk6IE5pY29sYSBWZXRyaW5pIDxuaWNvbGEudmV0cmluaUBidWdzZW5nLmNvbT4NCj4g
DQo=

