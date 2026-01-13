Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E60C1D196AC
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 15:24:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201797.1517370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vffJw-0002Dw-BM; Tue, 13 Jan 2026 14:24:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201797.1517370; Tue, 13 Jan 2026 14:24:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vffJw-0002Bp-85; Tue, 13 Jan 2026 14:24:32 +0000
Received: by outflank-mailman (input) for mailman id 1201797;
 Tue, 13 Jan 2026 14:24:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vMW5=7S=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vffJu-0002Bj-U2
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 14:24:30 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91c64d38-f08b-11f0-b15e-2bf370ae4941;
 Tue, 13 Jan 2026 15:24:29 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS7PR03MB5624.namprd03.prod.outlook.com (2603:10b6:5:2d1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 14:24:26 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 14:24:26 +0000
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
X-Inumbo-ID: 91c64d38-f08b-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y8Q1pFL+buXQsmPKzO6AhXIwkcWIhUJsXm/87puEyr6e636T4qX5fVRpS3q8YoS8Ai6ZRVAqV7BkwEH39MVJbfnKN9rDiAPyJ0nnA6WcWZt1/TyRvNGmNGdWLfqTvIpwDME9J7JGyVhH0nRFRoQQYSfzhZJyUwPwC4PhCoOJiJVPorWpicG423KeYLQDYYAE/Oygg1AJzFkUIJOcduaDxVvf0sEDbDGdENAntRwpk3Lo/StF+xcvFYZVwsb4MlThgPSSHaPwQsMXP/h5aemnj1ybNeadLkZDB8iwQBRNot2iuZMabt7wyxH0KfNca3B2dgRQZXC2iPdlabcNoFnmqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cX5A1ANZzn9/mqtn7tzNPdPcetc2xNdNAQvgWczm29U=;
 b=toSc84IXf2VGlrOi9cOoG7BafNs0Zo68hD8KOrT9L2MkAwQ1bSx/QmsIWgsztJNTI8snwrt8j26UWOS7CPzvli12ag4RW0WVERIxpPdi6Fpt7/HDpVUa1w7ZkoumfFKJYU5txA4tJzBbh+A9MTGk5pM69zIevSXE/sNvrAeY7yofauDi8oDkY5YyQu+GZGG/th0qvArzCOlMfcrPxOzXpjTev08yUwxY77NYdcpvSh84wey2q7ySa1S36ZKkBBM3B4j1h9H4R5CPVY+m/T0tU4NPGDdoN9ynTPOSK6fOHWmFI+TuTGMo/OTGn5j0KlG7wY1WTp/lA32BKMN3JQNj2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cX5A1ANZzn9/mqtn7tzNPdPcetc2xNdNAQvgWczm29U=;
 b=qrbYzpsMSAPMloEbxF3OMPiJzws7fcORRsjRfW7WmDF9wV9CIoND+MuGUWWvCbyah0H1RXsXbnyiqZRX53Hwc1qJtfgWUl9SJZfAeH11Ys2L5TFq2na1mYAK6q8VhpWb6WATqTDL9KcQRoSViUHpc4e3LckjhXb6UaVRP9TIQco=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b28be78e-2d26-4d9d-8288-7130a64deb5d@citrix.com>
Date: Tue, 13 Jan 2026 14:24:22 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 3/4] earlycpio: lib-ify earlycpio.c
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20260113122109.62399-1-alejandro.garciavallejo@amd.com>
 <20260113122109.62399-4-alejandro.garciavallejo@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260113122109.62399-4-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0412.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::21) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS7PR03MB5624:EE_
X-MS-Office365-Filtering-Correlation-Id: 36b499e7-1a0b-4332-b5f0-08de52af74ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UmtqSExBM0liN3JHODE3K0FONFA3OG1BcjZrbEpNWk9SSStlekRUdUUrNW1i?=
 =?utf-8?B?WDJDQk1xRUx1NCt2cnZRTVo1VmhHR2xIbHF2WndvRU91dmQ5cDA1K3ZNd2Rk?=
 =?utf-8?B?SUVUNk8wQys0dmRqaGQ0bGF0YlRrUGliV1RnTFhoZWh4SGE5R0hDRVczY0dk?=
 =?utf-8?B?dmVsdHEzUExWNWdHTS93bXlzUmNRb3NncjRIS1NqMUFEek1wQUpKY0ZZUXVr?=
 =?utf-8?B?ZUNBbUFFTjJPa29SOWlxdjhuNHBkQzI2QjEwU2ovd1FqVVZWNFZzcmVJczFh?=
 =?utf-8?B?UTNYRVpETmpqZytGUmpEaXNSMTArV3hBekQxTERoZG83QXc5aHloMU9BUE9V?=
 =?utf-8?B?STY2ZjJhUCtFOXJvMVVhYkhHZUdEam0wcHNEMFArQitvVW5zTlhnTEtJalJN?=
 =?utf-8?B?R3Y2aXpPbHpWdStFOUZDWXJabzh6NXFkZ2ZqOWJMVDE5QTEyNzlVaEk3ZTJJ?=
 =?utf-8?B?QnpIamlJdlQ4YWRjT2NCSDdGWGdPNzRpMERIcEdWUy91UkRwWUoyNmJraXJT?=
 =?utf-8?B?S1JwZE5ES2svN0FXYlA2UzA3YVN5Nlk4Q2tJYWZTWXFRdlhCa3JoY2NhSHh3?=
 =?utf-8?B?bHNvUElZSXNTYXNWdHg2WXpDcHdiR01pcTdUd3VubGpXalEvOUNMSnNvOUtK?=
 =?utf-8?B?dG9ZZGcrMUlSc0h3ZFhSaUkwVytmN3FCazlHSjJGa3ZGdjJEM0dlMDhCdWhD?=
 =?utf-8?B?QWpHMnljU3BDNWlkQ2dJQ0dlQlR3Y0k4Q2hiWVhmQUozWnlVWE9RQ29jSjUw?=
 =?utf-8?B?dE5KZjUzYm9qT3BHNEx5SG1ISWF0NFgrOWM2Y0JjZmhkTjhmbXdrMW5wT1lz?=
 =?utf-8?B?ZTJMRGxLRjVxRWQrajhCQW9UOTFIRlA1Q1IzR0lBaWZ0ODN0QnAvdk1tb0dH?=
 =?utf-8?B?TlJid2hsdzAxYkFYRjFxeHpheHk2eDU4YWs5R3RNYmtGc0o3dmJJWUxWL3BP?=
 =?utf-8?B?ZDRCU2F1cVNvWVRkbDI4VnFnb0FlRGRKWXhzSHB1ZDhCTWFkQU9vTzQrQWpZ?=
 =?utf-8?B?THFMZnZFQUE0U3c3SkhGS2dlcjBPbDdmYXlmTWo5R0MrU0dubkRGNmIveE11?=
 =?utf-8?B?TDNtTGtOWFljREgzWjl1a1BQMVZwTk9ZRzJ0QWpXb1kxMWxtdUEySVBNSVlh?=
 =?utf-8?B?b1JoS1FvUUM4ZDIweXh6djJYY3BDQTJpbTVFWUtoL3B4WW5INHNNNk9aQzR5?=
 =?utf-8?B?VFV4ZXdFY3UzUVBQQzdBN0NwUG43RWRoK0VOT0VhK3NrWithVjlLdVJKNWhz?=
 =?utf-8?B?RG1RZVovYlRyekZiazNBaFNJSGU0aHI4Z05lbEhtMXovczVFeElqWFhPSkFn?=
 =?utf-8?B?N083aVo2bG1OeGZSa2pjS3F6NTJSVEpXSUZJUGhETnR2dDJmc2kwMU4yRkRG?=
 =?utf-8?B?SGhRbUUzYXlFZFpQWXBEcEs2UndIampoRnpwRjNybk1qaGxGVHVudkNsb0hn?=
 =?utf-8?B?N09JQnZyYjE5TnJsUDlNanVjUEVvemJUTVJpQjBnNy9VQURPZWNQcE1qRHZK?=
 =?utf-8?B?UmM5SE5LTXM1eTFWYWliWFR1VVRTbFJsRVZJY2RLVjcrdERDcEF4NEpESTdt?=
 =?utf-8?B?c2hVYU9Cd1ZSalVvekUzLy9zdlhnTzFGd2dCMnZoZ3dyVDdIMC96LzdyQmhp?=
 =?utf-8?B?NVdSV3BvQ0pSVnZzYzduVFEwWjBLNkxWZVV1Q2dPWERqamxkZzFHR1BKa0tS?=
 =?utf-8?B?Z0xtTVhsTlJBYmUrN2czcjh1LzBhMUhwQVlGOFArcWkvWG9XVld0cjRuWngz?=
 =?utf-8?B?VWwzWHhrSjI3TlRpbHVTRUtCT1ZOYzFRVzZxZTQxeEpkL2RvV05taFJUZU1m?=
 =?utf-8?B?ZTFFbUZPdUx0N3RVRzJSZlkvZUR2ay9Fa0ZaZW8yN3BzVUhQWi8xZjZZNTVU?=
 =?utf-8?B?L1Z3TmNMcDBGT1piUU03VEhWcU9VQ0ZHSFVUc3pxcDJmU3FtYm5oNDAzNG1u?=
 =?utf-8?Q?xG9ODPCBuyWmYmwct5J0uyvfERmlrxRr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dW9nS2lSOWMrVWoxM211WnZkRCtHT01sM0lhVk45NWxsdkhHZTQ1eFdDZXFq?=
 =?utf-8?B?UU5VTFM4TjhZRHhWQWtZSkdTa1BwRDU1NzQ2elNiejJVR3o2WjM5Szl6S1Bj?=
 =?utf-8?B?R01XU2hyaEVsRVA2QS9FSEMrR0paRGJVUTBtVnRrVUlFYnMyVFNjdURxYTVu?=
 =?utf-8?B?alVaa3BiT0k2VndCd2syUTlEZ0I5L1QxeEw3clBSd0tpQ3ZzT3podVk0SkQ1?=
 =?utf-8?B?NHcxNStWT0k3aFNMdnRtREVQNmUxL2dDQWppei8xNGQwQlI5bWlpd0lhWExK?=
 =?utf-8?B?UUlqdmFuT1ZFR1BjT0ZXVWR0V09HSDNpT0xwbnc4Qk9GNStycWRhTktqLzVi?=
 =?utf-8?B?MEJZMFJOaHlZVittUTNpYWxWWmNuaWFzQ25NQlFIRVp2MU5FSk1FZ0tTMDBF?=
 =?utf-8?B?Z3Z0bmc2dHdPbDEvUFo2S1JzUWdML3M0eHl2T1VzZjEzRUl2bnQyT0doUURv?=
 =?utf-8?B?Ym5CNU1sWXZmUStOemtsWjZQYTZmcTFGUzltdlNycFZ1NHQxRzJHSnhiRlRK?=
 =?utf-8?B?M0xORFJrVFNWMHh1QlRTTE1rc1l1T2N1dDZkaXRiRm8yVTlwMWMrU3VOekdv?=
 =?utf-8?B?RzRtbUdMNlgwOUh4bitqcWxSRm5vUnhZUnBqb1I3WDMyQjFVakVtWHA4YmlS?=
 =?utf-8?B?bEdlb25QVzVHZU4xRjlRNEhDQUxySVpSSTdTcXZtYjU5L0lNb3VORjZNaGp4?=
 =?utf-8?B?VzhvR2lOY3RkUkpNNVkyZ2Fzdk9FUVVyN3E0MndTc29LYkRjeDRrSktOUzlP?=
 =?utf-8?B?SUM4aEUrbFIyakppQlVyR0VPVVFFenlBdzJRZUxEQU9jd052dzFPVkxKV1Ev?=
 =?utf-8?B?MTQvblloQVBURUNsb2swMStJSnJjSEl2N1dJMG85SlhNSElxSGFRdEhMajVP?=
 =?utf-8?B?dlMxNG54OU1VczZGd2xZdzFpUzA3dWxkcE1LMW0vVGY5dGpIRWprV0tLVVpV?=
 =?utf-8?B?Rk85M21pSGpOUWpNaDlzUzR3endYRFhMbmhPRGxnVlZwSW5RNzhsNmR1Q01U?=
 =?utf-8?B?VmdNTjBzaHJOdUhnTFZhTlNyQTJZa2RybWQzM1N6YSs1WS8zVWw2OGc3eS92?=
 =?utf-8?B?L3ZoSVQvcHAyUFRhQUNSN0c3RFVlL2xZcEx5VCs4UmkxTzNPNEpaY3E3ZUFC?=
 =?utf-8?B?NXZGRmNLUDc0T3h3bFpvakw0TDVzYnptS1BiR29xRm8vSFZDVUdaRHA2QzFD?=
 =?utf-8?B?aGFaZ0pJV05xWFFWT3lhZkNIdXMyYmtnRlFFVURYWHdBbXk4MFFVN0NPbERL?=
 =?utf-8?B?RitIbWhkd2E5ZVpPQ0N3Q0M0RlpzTUdQU3lkbVpxbW44ZS9GMGRxMlR3cGNm?=
 =?utf-8?B?NDBsTTBRdWhnWWwwT21PMG84VzNFNjh5UU4zdHEybDlReFhIdFJIZkNJVVA0?=
 =?utf-8?B?L2NIcU9MejVmajBlMDJlZVYvWHhnU2xyZERPWi91cmxMbDJFV0FEL1dValVM?=
 =?utf-8?B?QXp0aDRTZTQraUJ5ckIwYWs4bUFxR3NYcUJZQzQ5LzBxcVBCRHlFNVBNV0R5?=
 =?utf-8?B?QUNLS0ZuSTZrbUdjZVdJSGpLSWVackpCLzNxZXdvNW1pOTJCQ2t0Mkh1bHRj?=
 =?utf-8?B?RmRXVXV3WTZZNzlkQXkxVnh5ZmQwbXZFbWNoZnFHUlptODQrd2E5OEJqWnd4?=
 =?utf-8?B?cUhmd0VqWVV6TkVRam93VEtqQ0pIZjJRWGNlOVo1TmxKK3NJajY2NlExbktx?=
 =?utf-8?B?SXFTU1JLVGhOUmVib0c0bm1vUWwwUkE3UkJOTmptZGN5RmpuY0dCaTRPbjQz?=
 =?utf-8?B?UjRLWWhzeGpTa05pd2hPRVhId2xTN2NSOTVCSmM5cllvMWdseVNQeGk5QWRC?=
 =?utf-8?B?bVloQ3VlQnRQMWpZblVmTHUwS0VmUjhlSDlLMDZhdnYvQmJnZ3dxS2Z0MmVt?=
 =?utf-8?B?U3E5OGZMMmNqaEhLVENRR1UzTnErb0U2RWhuSENBdHdEKzJSM3g3M3ZtdzJj?=
 =?utf-8?B?TkF5Ni9LQkdHMHVSeVNBRXpnQ3VhOFQzbXMwbEJUbnV2WTdEa3RmT29DdEIz?=
 =?utf-8?B?MmRpTE9RMHJMaVhKN0FEblFSdVJ1Ym1aT0Y1THdIelp0QTBhUTAyQU5mYzJ2?=
 =?utf-8?B?bHV1clhnSlVpUjR3MXNsbnQzRnNhdlpSQnY0N200MTBncTBxS0dCaHhQTjhq?=
 =?utf-8?B?MU5sTS90YTVPUmxZeHdVUmFhYXZ1Uy9TcEVUVjB1VlVETWxtQ2E5VVNFSmdB?=
 =?utf-8?B?amo5MTdHaU5JNkRjaW1ORmZEMmQ0VEM2YkJnNVM0YTVISldDa2VWWVRPaEZ2?=
 =?utf-8?B?dGZvSGFsNVRDYzd6NGRkUnJaMDRJZFdqMmpJdEZrekpnYTBLMzNCWHFhUEs2?=
 =?utf-8?B?VGhSNitzeWRKWEUxNGphdUxsWXVKOFdmb3NYek1VMkdaeE1IdTluZk8waTk3?=
 =?utf-8?Q?S1gBzUMnnh5uWBt8=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36b499e7-1a0b-4332-b5f0-08de52af74ac
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 14:24:26.4150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dNVTPF8Y0MmwLOcV5EYwrKE4kLgOHYQx+M3hnohjy1YmzzC0jRBURT43pse2uOIg4IrHEqzSCZxSlmnO5cob6ClkhRHCjHnibrAH0S2Qzxo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5624

On 13/01/2026 12:21 pm, Alejandro Vallejo wrote:
> It's only used for microcode loading on x86. By lib-ifying it we can make
> it go away automatically when microcode loading becomes an optional
> feature in follow-up patches.
>
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> ---
> v3:
>   * New patch. Subsumes earlier conditionalisation of earlycpio.c on
>     CONFIG_MICROCODE_LOADING.
> ---
>  docs/misra/exclude-list.json    | 8 ++++----
>  xen/common/Makefile             | 2 +-
>  xen/lib/Makefile                | 1 +
>  xen/{common => lib}/earlycpio.c | 0
>  4 files changed, 6 insertions(+), 5 deletions(-)
>  rename xen/{common => lib}/earlycpio.c (100%)
>
> diff --git a/docs/misra/exclude-list.json b/docs/misra/exclude-list.json
> index 388397dd3b..2b874dfd3b 100644
> --- a/docs/misra/exclude-list.json
> +++ b/docs/misra/exclude-list.json
> @@ -121,10 +121,6 @@
>              "rel_path": "common/bunzip2.c",
>              "comment": "Imported from Linux, ignore for now"
>          },
> -        {
> -            "rel_path": "common/earlycpio.c",
> -            "comment": "Imported from Linux, ignore for now"
> -        },
>          {
>              "rel_path": "common/gzip/*",
>              "comment": "Imported from Linux, ignore for now"
> @@ -225,6 +221,10 @@
>              "rel_path": "include/xen/decompress.h",
>              "comment": "Imported from Linux, ignore for now"
>          },
> +        {
> +            "rel_path": "lib/earlycpio.c",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
>          {
>              "rel_path": "lib/find-next-bit.c",
>              "comment": "Imported from Linux, ignore for now"

Honestly, I think this needs simply dropping.  "ignore for now" isn't
going to cut it with any competent evaluators.

By libryfing it, it's no longer part of the AMD target build, but it
does want covering by *-allcode.

Given that you noticed it for v2, I presume there's something in the
file that Eclair doesn't like?

> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index 92c97d641e..4fc0c15088 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -65,7 +65,7 @@ obj-y += wait.o
>  obj-bin-y += warning.init.o
>  obj-y += xmalloc_tlsf.o
>  
> -obj-bin-$(CONFIG_X86) += $(foreach n,decompress bunzip2 unxz unlzma lzo unlzo unlz4 unzstd earlycpio,$(n).init.o)
> +obj-bin-$(CONFIG_X86) += $(foreach n,decompress bunzip2 unxz unlzma lzo unlzo unlz4 unzstd,$(n).init.o)
>  
>  obj-$(CONFIG_COMPAT) += $(addprefix compat/,domain.o memory.o multicall.o xlat.o)
>  
> diff --git a/xen/lib/Makefile b/xen/lib/Makefile
> index efca830d92..60cfda4dfc 100644
> --- a/xen/lib/Makefile
> +++ b/xen/lib/Makefile
> @@ -3,6 +3,7 @@ obj-$(CONFIG_X86) += x86/
>  lib-y += bsearch.o
>  lib-y += ctors.o
>  lib-y += ctype.o
> +lib-y += earlycpio.o
>  lib-y += find-next-bit.o
>  lib-y += generic-ffsl.o
>  lib-y += generic-flsl.o
> diff --git a/xen/common/earlycpio.c b/xen/lib/earlycpio.c
> similarity index 100%
> rename from xen/common/earlycpio.c
> rename to xen/lib/earlycpio.c

What's wrong with .init here?  There's only a single string which will
end up unmerged so I'm not worried on this side of things, but we now
have series doing safety things getting tangled with .init and I want to
get it fixed.

~Andrew

