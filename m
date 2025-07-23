Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 873E9B0F551
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 16:32:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054255.1422986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueaVj-0001vO-NI; Wed, 23 Jul 2025 14:31:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054255.1422986; Wed, 23 Jul 2025 14:31:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueaVj-0001tx-Ja; Wed, 23 Jul 2025 14:31:59 +0000
Received: by outflank-mailman (input) for mailman id 1054255;
 Wed, 23 Jul 2025 14:31:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CE//=2E=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1ueaVi-0001tr-Ar
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 14:31:58 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8a7fe08-67d1-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 16:31:56 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by GVXPR03MB10778.eurprd03.prod.outlook.com (2603:10a6:150:217::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 14:31:53 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%6]) with mapi id 15.20.8943.025; Wed, 23 Jul 2025
 14:31:53 +0000
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
X-Inumbo-ID: c8a7fe08-67d1-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kJtBUPeCuYJbdpvjiYFRMCYboi+3j2PayW0i2DTXzXwQqvUo7Yng50BGR79HqWo+mXA5Mfy4HPEjaBxVsPMCiCQByWvFbsWyR3Cm9kv2uG17pEng+uE/FkLHxEt5Ox5ez/0E38EEJJXyIh5rg8BYgYa8+b3K9G28e0NcyRIyJb0RpVeDLTBqrjpsDI0z4qmIDdsoMxlcouoArUWCOjhWIQvH97wC19TVZxbQLuvLAZpzWVCNHkAts+KHkLOA6zoFwSGwAMaCqrVU8TXHIyZvqlw4NnJFfWXk1G5uJeGwRmwvGTGpPigzb2hi6q/XKR/k96mwkjEuKTE35MPzS8+liA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fdkqiFOhbSlg4XrJ0IJr9dKdcSKYdYg/US6JN10P5DA=;
 b=FKgUni6hUKQ2dyU24cn1sqwk0pvoXTovri1X0/U7ouqqnTBHKVJa+V5JmBFOfqfS5svGx6Jy6ejKyQNVtafIWcqo4wnqplIxbkHlWnFX4E5LnvX4xYCbjWX8y0dDAJprHeMmhqmX5XLDWfXuQH3JZ+ettVTN6YZbYs8aeMqhTy4iWX9OvHiCFMjE4jcVXAgOEcaxRqRQtdzClhqaQGDla4J4vbGixaEyHLqlpRKe4Onz7YaoDHp8tRStFpZ5JYWRk0kPXA28RbQM6a03RltZCStI2IIDookoIbaLOegAMBGIHBLZhxtY1wz56LKThtgxiqHYHtkXhIWs5AEgX2DRyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fdkqiFOhbSlg4XrJ0IJr9dKdcSKYdYg/US6JN10P5DA=;
 b=dmvFyNuio5iFFA9E7mXRs5COo4FW1FKeNYlWWTqxYWhuSyfLB65NeXTyAgTeoEiD/EdhNySEM8sooEdqKWn4oQunRNYKmQS40o7T7lhgDvyB3k8lgyzBxkRqq5gw7tJQyeVB6ZcbDC7mUDrqxYGFDzJujMC9tdoMgwXDj+WC/OR1JQOsDgW8l+TNzX23yxd1AUWoSoditF/SWSmf3D7LeFizXPGwIknLLPUXo2mud4v+ZGMWNFKNbJWccwdXNzg5zzAUZXOQJOt/9ekoP2JcB+hSYxLVbkBBm38kCy5Ha4/bzaDTog9EScDroD8+K09k2U2fvyq0zf35HdsOXLRmZg==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>
Subject: Re: [PATCH] xen/arm, xen/common: Add Kconfig option to control Dom0
 boot
Thread-Topic: [PATCH] xen/arm, xen/common: Add Kconfig option to control Dom0
 boot
Thread-Index: AQHb+9rNCD0pdC1VhE+OyU7cYZL/l7Q/xMEAgAAAjwA=
Date: Wed, 23 Jul 2025 14:31:53 +0000
Message-ID: <3fbfed94-1de9-44cd-a7da-c60c0a88bfc2@epam.com>
References:
 <9c1169345d916cb542bf3f28ddf854f6308a402a.1753279365.git.oleksii_moisieiev@epam.com>
 <96575ed2-b1aa-4be7-bccb-3f8914677eb6@suse.com>
In-Reply-To: <96575ed2-b1aa-4be7-bccb-3f8914677eb6@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|GVXPR03MB10778:EE_
x-ms-office365-filtering-correlation-id: feab9850-a22b-45e0-8ead-08ddc9f5ab81
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SGJ5WVdkY0IzZGVqQmI0ZzczMlZ0bFJlUWtqclVYSVFocGozSE1POU9lVVlh?=
 =?utf-8?B?SElTRjBNVnZlYWNUeG02UG5JTjZEVlNCNTFVRXJzTkZ2UzNQSW56YmxJSHFa?=
 =?utf-8?B?cFl4OEo3YXd6ZW1WbHViY3VqWDhaSndIb1ZTN0E0dDlZRGRpeTR0UG1ZOXVV?=
 =?utf-8?B?eTU0Ri90LzJBYTVGU2NFbEpsb3lDVmJpcmVuSE5rQVByWklpanNmZGVwVVdZ?=
 =?utf-8?B?ZFFpY0lzOEF6TlBaelhiM01oQkZBTlhGU0NGZXVVY0hGS3pTc3pZazE3WnAr?=
 =?utf-8?B?d0pROGtUSGlDT0NPckZ2OC9Za3RuQzR6cWFsK3BodG43bEJYM1E0SkI3MUQ5?=
 =?utf-8?B?WU1jcWY5MXIzUUkyeDJZb3YxS25YdHFkczNCM2NYbTdiSDlEdzlaUmN5OVJp?=
 =?utf-8?B?VVJnbzMxOFJLK203V2laTnRHaHExalk4b01Ta3hQc2laN3JUMmkwRnR2ZEZt?=
 =?utf-8?B?aG1DN2NZTFZLSEJPWW54YVlsc3NDTUEvY081eFBNQ2thNUpOcXFhaVFRU09j?=
 =?utf-8?B?c25DZkV2VjBJVC95azVGeTFLVE1rb05JTGJmOGxDOVhkbklsR3J1WVUrNnNG?=
 =?utf-8?B?bHVFQ0dPU0c2aExSeVRHamRBK0sreml3U0dJaS9zazNUM0dMSEkzOG1Scjgz?=
 =?utf-8?B?YkVIeXRHK1pwMFZYbHVKejV0N0dqTS9mWmJZY0ZRWjVFejB1aEk2WHRIZ2Ru?=
 =?utf-8?B?azZ0TzhSWUlENmlMTk9vaWxTeWt6WjFLOUUraFNFdTBlYWNjL1g5dG5DVFpj?=
 =?utf-8?B?MUduN243SFVjT0FXVlpLeVkxZDV2TTR1Yy9ZRTF4aTFZNDBCSmpRM3h2MFo2?=
 =?utf-8?B?WnpqY3l5LzQzT09hR1dkOVhYY3gzWXhhU2pqbjAyZEo0Qm8zT2tvSEQrdlBI?=
 =?utf-8?B?WmFPaDJWR29WMUFNRlU0SVMzeG1jR0FMZzJYQjhVVElRQ0I2S1RJbENhaC9J?=
 =?utf-8?B?eGwyaFVFejZEZEphb0ozVndvRmFFUFd3ZXQ1THJ4N0dZZ25pV0xNVG5FNjBN?=
 =?utf-8?B?eEhjSTFjUFVqRGFJb2FJcHVQcUhCdDc1UDQxbzJ2aTlmWjZSVnBva1RhUDFi?=
 =?utf-8?B?Z3hWRjFrNlF4MWh5ejhEZFhVQU9IWlpaWFZrMTFqWkdZYnNpTXdSYk15WERI?=
 =?utf-8?B?TnVMM0wyN0g4Y2NLVGNWRG82RGtYVzRMR2cwRHRCTElPd0ZUZWRSNmt1dXN6?=
 =?utf-8?B?RGJBeEczbnZVNi9BVW54N1ltZlVVMnVlNG51Z2tydGN6enFGUTZqeWd3TnFZ?=
 =?utf-8?B?aC80MnMrS2I1Y1pJd1BBSmZwSmQ2TVRPK3hrR3AzckVMMmU5TUdYQzJmcjd1?=
 =?utf-8?B?ZDYvUkwvZkR0NHFFbzhSRXlNWVFEYWU5dStPc2hzSEh5Q0huM0t0WHhTeEpD?=
 =?utf-8?B?cjlxU25td0o5WktSemhYYTUzcjZhaEthdWNJWkNuZWc5L1pKUU41R29WdG5v?=
 =?utf-8?B?ZFpaYVFneE5Hc1RVNnFBaEFvTUsyOEhzQzAwQ3FMb2NFbUtCY2FJaWRiRmJ0?=
 =?utf-8?B?Z3lUdUZuZGYwcTJSeW5NV093RXNzdnVBNFJhRFVTOVFWUWtYRWJDSnMwWkFN?=
 =?utf-8?B?UDhZWENiSnhEOTRwb1dEWUtObmp1dHV1L3ZRZXdXZVRjMFRCb0pVNEsyN0dv?=
 =?utf-8?B?NWhZUzIvVGgvSGxwSzBzQ2RWWkFNOW1nSU83bzhPYlBFWkdzNXpQM1g3cDFI?=
 =?utf-8?B?TExhQkZFWnVoYTd3SE9xY2RWYU5pM3ZrTDNHbFMwVWo1N1J2ZWZxcUhZSFA5?=
 =?utf-8?B?SG1ENmMrWEQ0eEhNUW9lV0RTZ3dZUjY3RlBWRjIyb0lXZ3VuamtyNTE0YnVX?=
 =?utf-8?B?T1loSHBZR01CU3FPYW1wMnNLVDVQclhsYm1vZnVWb0FZb2lYZlQzUWlPRVcv?=
 =?utf-8?B?cmo2d0JFSG1yVjNveVc4V0NJVHlDdmY4c3N1Qnk0d251VGIvMmJvTUZOUU9G?=
 =?utf-8?B?Y3U2T25iMHlXbW5mWVRKT05LVE5SSkZQbjV0U3JyK3NuSWVtT0dlcmxGeWRB?=
 =?utf-8?B?L3NDL0RaT2p3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VE91VmtvYlcxekdNdHpnSzV5MjQ2MXlCN0VicUFCMkxyQ0VCZFZyRG94bVpl?=
 =?utf-8?B?V1dBNWxtOFlKb2xFOE5NOExCNlJwbGFXWWRxTXhGdGhBSzk4b0ZaZzRobWhC?=
 =?utf-8?B?c2NpRjdnYjEwMTRWTHBBQytnOHV1bEo0MGZwSzhJUHU2ZUJRZE5EOHJoSlNo?=
 =?utf-8?B?TklWR2JaTk1LTkp3YVVaSVJzLzRSdDlWWDlUTXJ5cE5QM2tNZHNoK0ZRZ3dp?=
 =?utf-8?B?WHJRTzFEaGZDTU5USW5jazNSSzdBWXJ6Q2VQT2wxNitDWE13ZmQ4U0lPWGVR?=
 =?utf-8?B?MzlKcmg3RjJhWkpZeUZuMkRiaU5HWGFtUjlidGhhZ2hjYjUyT3p1NW41cG9t?=
 =?utf-8?B?RzVXNEZubjBGODRXQ1ZOV2laekJmMFUvVk9iTC9BQjdjRVBSRHVVT2hVV20y?=
 =?utf-8?B?eWpzNVJGL1EzZFozTG9BQ0dhOHQ1VUFpM0dzaDVpOTYwdXg1RnduRjE2TTRF?=
 =?utf-8?B?a2RWdmJQdHpRUitlcFI1d3p6WGNRVS9tZ0ptM1c5dStoWnZjbFhyT2dvbjFn?=
 =?utf-8?B?SDJhV01HNXR0ZUtsRi9Cd0psZitRZzkyWXNZNzhLQzZ0RWJvaXN3WlhxZmlI?=
 =?utf-8?B?d1FSV3Z3TEpEaWNoL2N3VnJ0WFhQaXZqUjErZjQ5Y3lrbnhHRDNNV0lKU1Ew?=
 =?utf-8?B?SlgxK0RUbmtkZlFSK0FLU3dhV0tDYzFVYUlwUUd1L0xuZVZpdG40cEI0YzRL?=
 =?utf-8?B?K2pCcjlidHd6UjVvenNrNmI1T2ZZRXpmV2ZKaDBOMWowTm93M1ROY2p5Q0Nt?=
 =?utf-8?B?U2VKN2thYWloalpWTXJDSWV2NTdXakJ4eXNWbVdrZGg2VWRQb0doRVhtUEpG?=
 =?utf-8?B?Ni8vM0h0RG9PcEJQSmxQRE15ajRXRVdrLytnZUFOZFF6MFJ5SDJoZy80c0g0?=
 =?utf-8?B?R1piQm9EeWVONVFIU2FmTmhnVFcxNXdCNmVzenZTbWhwNE5MR2R5c0FsR2U3?=
 =?utf-8?B?ck4xQ1QzN0JpanNjOGZnT3R4NkR0eEtZSzZOMER1WjdhRHNLOVdJWCtHb203?=
 =?utf-8?B?a2VWK3RmTnVmelZaWWxXcDVaTkdBRTI1M0dKT3NzS1V6c3Q1UGpNRUd0eGx0?=
 =?utf-8?B?QXpIM25PVzRxaURrREFwSmFoa3hjYU5kSVV0aEYwbng3aURPNnlITE1iMnZO?=
 =?utf-8?B?bG9KTG1aNGRDaEhtTU5NSDBZVjZDTG1vVUxBano0RS9TTWxzNnlQdm9VVFZW?=
 =?utf-8?B?TmNhZk8vK2pSNTAyWVVWQzdjeFBxU3JzMGkwY3dxNEJKRkUvcnFHZmI2anc5?=
 =?utf-8?B?SEF5QnBqMEVNdkZKQ2ZrakJSc1U3YWVyWWgzMlJzeHVNZHFOQWYwek9BUXg0?=
 =?utf-8?B?RnVjb0ozeWk5Z2FSMjA0OHV5WXdkeklvVXM5YnRwV05vdWV3SjVTVUhZb3pO?=
 =?utf-8?B?eUNQVUNsV0RmVGdUMStqdlFXckJYaTNMVWk1ZHhXMTd3N3JNV0JUbTNCWkVL?=
 =?utf-8?B?b055c1c0WVMwbFlTSGx2NWFJT2NmMzE2Z3lJUVQ2VnZVMHNORkJ6dFV6K0JH?=
 =?utf-8?B?cVdYREJicWpHS0ZUTnZIdUw5ZUZrUkFDemtUbGgyWTRMdEE2SlNUTGY4ZUNB?=
 =?utf-8?B?SzF5ZmpteFc2SytLaDV3a2lhWUUyMWgrMzQwSXRIdVNlL1MrN0FlRXBmdjlt?=
 =?utf-8?B?cEM2bGtCS1lHYWNwQ1phNHJyY2x2SHFDdXRHcXBkbG9OeWJoYTg1dzQyYm1Q?=
 =?utf-8?B?Mjh2UUVJbTN5T0FJU2lBUGZjRExOYkd6VWVJcVdkVmFNR0hEcW9FdDNqUTZp?=
 =?utf-8?B?c1doNEhSajlHQUVrYWkrS3VwSVIzbDlMNFEzNHZaaUhKV1VWNENheGcrUEQz?=
 =?utf-8?B?ako3eGxlQnh5SlFqMy95b0M4U1ArNUpGTE41S05FVmVHbUl2Yi9XL0h2aGR1?=
 =?utf-8?B?aFFHeFpKSDczQmlZQnhXN1J3dy9SMHBQU0p6YU5RNEp2NUIzNjYwUFk1V1l6?=
 =?utf-8?B?SXZJemwzcTB6ZUZQUCtjMWthZTdtdlBxbGZYMFFDRThpbi9VMWhYUmZHVWpH?=
 =?utf-8?B?KzVsZ2hFUVBKK0xsU0p6WUJaNXArYkhVYjlUTVFDcWg5d1JUVGJ6c0had3ZU?=
 =?utf-8?B?cW9KNGQydVdZQnFDZEhFVUVBMzYzVjcxQ3pwYmxLODJaWmtEd3dNV2tRdUdv?=
 =?utf-8?B?KzNYdFh3SUlZTjZiOEFTUGd6ZE43R0lUZGN4R1AvbVMxeGg1eUVKbU9OSlpP?=
 =?utf-8?B?cEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F35B2B17FC013849AE78EB0F089C60BA@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feab9850-a22b-45e0-8ead-08ddc9f5ab81
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2025 14:31:53.7782
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HZbzYfUf080NaUcyY0ba93M9UQMWd0AEmuKA8GbThSr3CmCnN028kyxTu/VnaoeGYKCLn+LFYf/UMII3aqVj0nv5GPaW5EQX4OewdWP/auM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10778

U29ycnksIG1pc3NlZCB0aGF0IG9uIG15IHNlbmQgc2NyaXB0DQoNCk9uIDIzLzA3LzIwMjUgMTc6
MjksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMy4wNy4yMDI1IDE2OjA1LCBPbGVrc2lpIE1v
aXNpZWlldiB3cm90ZToNCj4+IFRoaXMgY29tbWl0IGludHJvZHVjZXMgYSBuZXcgS2NvbmZpZyBv
cHRpb24sIGBDT05GSUdfRE9NMF9CT09UYCwgdG8NCj4+IGFsbG93IGZvciBidWlsZGluZyBYZW4g
d2l0aG91dCBzdXBwb3J0IGZvciBib290aW5nIGEgcmVndWxhciBkb21haW4gKERvbTApLg0KPj4g
VGhpcyBmdW5jdGlvbmFsaXR5IGlzIHByaW1hcmlseSBpbnRlbmRlZCBmb3IgdGhlIEFSTSBhcmNo
aXRlY3R1cmUuDQo+Pg0KPj4gQSBuZXcgS2NvbmZpZyBzeW1ib2wsIGBIQVNfRE9NMGAsIGhhcyBi
ZWVuIGFkZGVkIGFuZCBpcyBzZWxlY3RlZCBieQ0KPj4gZGVmYXVsdCBmb3IgQVJNIGFyY2hpdGVj
dHVyZS4gVGhpcyBzeW1ib2wgc2lnbmlmaWVzIHRoYXQgYW4NCj4+IGFyY2hpdGVjdHVyZSBoYXMg
dGhlIGNhcGFiaWxpdHkgdG8gc3VwcG9ydCBhIERvbTAuDQo+Pg0KPj4gVGhlIGBET00wX0JPT1Rg
IG9wdGlvbiBkZXBlbmRzIG9uIGBIQVNfRE9NMGAgYW5kIGRlZmF1bHRzIHRvICd5Jy4gRm9yDQo+
PiBleHBlcnQgdXNlcnMsIHRoaXMgb3B0aW9uIGNhbiBiZSBkaXNhYmxlZCAoYENPTkZJR19FWFBF
UlQ9eWAgYW5kIG5vDQo+PiBgQ09ORklHX0RPTTBfQk9PVGAgaW4gdGhlIGNvbmZpZyksIHdoaWNo
IHdpbGwgY29tcGlsZSBvdXQgdGhlIERvbTANCj4+IGNyZWF0aW9uIGNvZGUgb24gQVJNLiBUaGlz
IGlzIHVzZWZ1bCBmb3IgZW1iZWRkZWQgb3IgZG9tMGxlc3Mtb25seQ0KPj4gc2NlbmFyaW9zIHRv
IHJlZHVjZSBiaW5hcnkgc2l6ZSBhbmQgY29tcGxleGl0eS4NCj4+DQo+PiBUaGUgQVJNIGJvb3Qg
cGF0aCBoYXMgYmVlbiB1cGRhdGVkIHRvIHBhbmljIGlmIGl0IGRldGVjdHMgYSBub24tZG9tMGxl
c3MNCj4+IGNvbmZpZ3VyYXRpb24gd2hpbGUgYENPTkZJR19ET00wX0JPT1RgIGlzIGRpc2FibGVk
LCBwcmV2ZW50aW5nIGFuIGludmFsaWQNCj4+IGJvb3QuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTog
T2xla3NpaSBNb2lzaWVpZXYgPG9sZWtzaWlfbW9pc2llaWV2QGVwYW0uY29tPg0KPiBPaCwgYWxz
byAtIGNhbiB5b3UgcGxlYXNlIGF2b2lkIENjLWluZyAob3IgZXZlbiBoYXZpbmcgYXMgVG86IGFz
IHlvdSBoYWQNCj4gaXQgaGVyZSkgZW1haWwgYWRkcmVzc2VzIHRoYXQgd2lsbCByZWplY3QgcmVw
bGllcyAoc2VlIGF0dGFjaGVkKT8NCj4NCj4gSmFuDQo=

