Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37545A81FBE
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 10:27:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943615.1342303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2QmE-0005AQ-Gm; Wed, 09 Apr 2025 08:27:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943615.1342303; Wed, 09 Apr 2025 08:27:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2QmE-00058S-DS; Wed, 09 Apr 2025 08:27:18 +0000
Received: by outflank-mailman (input) for mailman id 943615;
 Wed, 09 Apr 2025 08:27:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tnZY=W3=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1u2QmC-00058M-K8
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 08:27:16 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170130004.outbound.protection.outlook.com
 [2a01:111:f403:c200::4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6fa94003-151c-11f0-9eaa-5ba50f476ded;
 Wed, 09 Apr 2025 10:27:12 +0200 (CEST)
Received: from DU6P191CA0005.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::18)
 by DB9PR08MB7868.eurprd08.prod.outlook.com (2603:10a6:10:39f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Wed, 9 Apr
 2025 08:27:04 +0000
Received: from DB1PEPF0003922D.eurprd03.prod.outlook.com
 (2603:10a6:10:540:cafe::43) by DU6P191CA0005.outlook.office365.com
 (2603:10a6:10:540::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.36 via Frontend Transport; Wed,
 9 Apr 2025 08:27:04 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF0003922D.mail.protection.outlook.com (10.167.8.100) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Wed, 9 Apr 2025 08:27:04 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 AS8PR08MB6037.eurprd08.prod.outlook.com (2603:10a6:20b:29a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Wed, 9 Apr
 2025 08:26:32 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%4]) with mapi id 15.20.8606.029; Wed, 9 Apr 2025
 08:26:32 +0000
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
X-Inumbo-ID: 6fa94003-151c-11f0-9eaa-5ba50f476ded
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=MKsg88LeBcjWuM+22NBl4scSryjUue1QQaTTvhzjDp9ZsxsNEP4wjR3Jcv0PRqtMsuBaUazGJLg6J7/ZFhIaTH9mnnpGMYv4uhpkrzsVHb4DVJEIJVK2aKW2+cY1IaXcOb5vrsIsVSrwzCrEb7vpGkToLJynhfQc1SW5sSc8BN3c6JmR40H4tFoL/9WgQmvERgOuwEKiw3Ql/KSiztSwpaLZVMe6XusnMUFTuDkMArtulLWXJgJHPVUJdE4ezA6RLlvkYxbsCSgH3iKbHTrqzmVY71DkTx2u7DIEbIOcjGH8fk1UhNSCABpZgmabQQQqER6w7fvri6f0qF8BtXukPg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EbPCZadm6JtEV7dELgAlGfuloMTsM/KJ7BFrD5JOZ0w=;
 b=zTQCc8XxqqtPh55gMXzyuyl+63ZnuCjXfhv+K9XjfuIB+MKeEIRQip5egTMGnxB4eZJ5+fheXwgIPSHjCUCgcFZGCJ1Az4T3+FcTppKVFlhVi6GeMY1IzWm8xkBAHDGdDRh+0XP3YyqFEuOGIlo7sPIQk4Vr2BCduVGcXQNXv33WqCEUjC510MoXB+7KhmNzgPHsyyHxbwy3W4ZQlSYlgG87fcxtIwjvzSqhCVVaJkO+WIueewS0nw1/Gcq7AZMFdbPZ0cCF0hpFFUyUe8Ns5q6Tu3XwWL2GACUAGOyFcm5Sp2Wnewb1dNJLtLy5ihz63RrKRAMbYvf1PLYor3AM/A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=permerror (sender ip
 is 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbPCZadm6JtEV7dELgAlGfuloMTsM/KJ7BFrD5JOZ0w=;
 b=B8WbqBIpl1ZFZz+ptfu8F4A5tQtkTyRVznCxub0IWEE5qBIW+6AdAZlMIV7pPG4Yy53JFbdjjTcvaYJWq0SDS9OCO30KSM+mb0NT0q4M4jrDP+6RWe/oKpDYlQaXtl4PEm7TA/Pnz3NG4yR6V5xoGMRBb9YXjyl3YVEaNx2Jxfc=
X-MS-Exchange-Authentication-Results: spf=permerror (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: PermError (protection.outlook.com: domain of arm.com used an
 invalid SPF mechanism)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ysaYY6gYQr2lo+JqfzfaOCglvDEQqncgUkIyyxcfqzDq6T7IODbKql9gdZuDwH7KhNzhGGKrRZuqeUsDS509elP9YedIXsVy3wBWl1HNlyiX26d+VjQzxovHlYDreHp4E1VWK2ZhrotOMovrhg2lkd7dDqba02ZVH9OmQ3u6GbanRpOxYVSmns+gtHPStHz3ZZTuoAO96ZvWZ8X1UHTkEE6yUJRSzW631J9e8wEqWKyjLIPNAA3Ay78hqneyALYCKmk9MDsipoxExC94gq6p3rC3xjpww5Jni+bLdSkWFaQyLAIbiqjDx//fgKEB58HbdpurymK7Nl/FZn9DHst/Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EbPCZadm6JtEV7dELgAlGfuloMTsM/KJ7BFrD5JOZ0w=;
 b=kIkPJTPABxwIVu0m7FXpnq3jkljeqxs7UPXKDlprWTCnICNxPHzg0I5yqDb18orbaK3+PYCIF3jB6ZfGv6ZR+fkV5gQ0DbiPaQkvr23EWW9VOkGTGguFMYMXrAubgYHoMXKTwQf7QYnEfHAeUiczRRifRXFgZTJQO8MF32FZiXmwpDwqYYvw/zGIyPnTNv44PNci0c+Xbzal2DPze1dOM6rWKsKQKZJs5dkj89jqoqmHNGeN1NxhSrrIfdNSRhDjpthZjfyZ/XsXsML+JgCo6AiGEjL6Muk9lhJ8B2EYVL3QxI+XB0w+B3JLxNU5kQjQNgLOzag+Fkhtr3H+C+dBDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbPCZadm6JtEV7dELgAlGfuloMTsM/KJ7BFrD5JOZ0w=;
 b=B8WbqBIpl1ZFZz+ptfu8F4A5tQtkTyRVznCxub0IWEE5qBIW+6AdAZlMIV7pPG4Yy53JFbdjjTcvaYJWq0SDS9OCO30KSM+mb0NT0q4M4jrDP+6RWe/oKpDYlQaXtl4PEm7TA/Pnz3NG4yR6V5xoGMRBb9YXjyl3YVEaNx2Jxfc=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 2/7] arm/mpu: Provide access to the MPU region from the
 C code
Thread-Topic: [PATCH v2 2/7] arm/mpu: Provide access to the MPU region from
 the C code
Thread-Index:
 AQHbp52Ro+Yg+pQClU+WnJSxei+hH7OZzl8AgAAHm4CAACKVAIAABC6AgAAEEwCAAPj6AIAACQkA
Date: Wed, 9 Apr 2025 08:26:32 +0000
Message-ID: <F2C6FC52-386A-4417-B592-151ECE079E52@arm.com>
References: <20250407091430.2342709-1-luca.fancellu@arm.com>
 <20250407091430.2342709-3-luca.fancellu@arm.com>
 <0acf63c0-267e-44c0-b629-fa576307497c@amd.com>
 <1AC85CBD-02B1-4AA4-B9A3-68DFC06137AA@arm.com>
 <4f860a56-5536-455b-9490-196bfc220556@amd.com>
 <40C7A4DC-0216-4981-A501-AFDA0E8671DD@arm.com>
 <9f637d98-c8f8-49e0-9f0a-002cdfefc296@amd.com>
 <EABA5C5E-4FE3-4E7A-8E29-B37A4CFCC18D@arm.com>
In-Reply-To: <EABA5C5E-4FE3-4E7A-8E29-B37A4CFCC18D@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|AS8PR08MB6037:EE_|DB1PEPF0003922D:EE_|DB9PR08MB7868:EE_
X-MS-Office365-Filtering-Correlation-Id: f9eea8c2-7842-4c31-7297-08dd77404f1c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?QXJCZi9mQ3g1VTJyVUkxQXN5bTF6YmhXaTluS0NHZitwcGR0UVJjdlZYWStj?=
 =?utf-8?B?QlJxK3JrTVBCNTM1czNsaUNFc0w0eVE2aUQwanJmOEh6S3hURGRxTWQvWGY2?=
 =?utf-8?B?TlpYNlMzZStzbHdoRGRhWDgyeTh6Yk42dmpQbmxNUVAvUmVBOXVSckRmb1Ry?=
 =?utf-8?B?YWpKdlQ0VGVneTlIZkYwamFaS2tyT0JQY3hNVHZTcFVHSmtzZ2h6QU0yc0RE?=
 =?utf-8?B?akw5QldjN3NTVHRNNktsalI0a09jYkZodER3Yk04LytYUmNPTS9NcTkrVXF1?=
 =?utf-8?B?R0xRc0dMNHVVQlVVeG12K2trRGhOQTlSTll0ZU5LYktuT3hQSGowK3k5cXk2?=
 =?utf-8?B?OXprSTlqK05aVVNrS3cwTjFqQmVkays1K0dxY0kyTmZlaGE0dm9qemYyYmVu?=
 =?utf-8?B?SWtIMFcxMkV3SVhZQkVCWmtsdzh4eUQ1c1pqdnRVRDBONXVpNTlyZXRpUG5x?=
 =?utf-8?B?MUxvZlIvcCtVMHB3a2sxbkFFKzcrd1Z4TURDUCt3R2lqQWVYTkRsbE02Vzc5?=
 =?utf-8?B?d3N1OGduU0IxTExGZk9GZHZiVkdjdk5mU3c1MW8vbm5Zazc0OGVJRDgxblV3?=
 =?utf-8?B?RVR5VzQ3R2VyL3VYQVJ0VU5JTFZGTFlBT0JWWkZtMDFTQ202bDJnT0NZVFBZ?=
 =?utf-8?B?Z0hqekUvNG1MR05WZjczakFLWkxSMytmdG41UVpTM1U3cWxKWjU1ODh2Slgy?=
 =?utf-8?B?QjRyeWFpOTNQdm9STUNNeHNWVkJRSnBiWGk0MkFkOERnWDAvOFNIc3hPdXhL?=
 =?utf-8?B?ZjFybjZZSFQ4NHJnUERQd3E3ZjZSaGllQkFaNTdoNXpPWUJ3Sml0OWpaNWxX?=
 =?utf-8?B?dTVWbWtCZGdaaTZNeXV5YVdBVGt0VkdMeU11ejFaSW1tYll6NDFTVDZnZVg3?=
 =?utf-8?B?b0trSzNVVmVXN29FQ29XMW0xcVl6Qm1ESktXdWk4VnJEZmYrTEpyYTdYb3NK?=
 =?utf-8?B?bzlzdUViOWlLdnZwTVR5WEFEZUliT0gzVHk2allOWW5zUW0rSjVzTFJRRzlR?=
 =?utf-8?B?S2U0SExyNkhvUjJVVzZuUXNaQ281RFdOejdPc1VHRG9wV3JDeGlCRmJIVEJL?=
 =?utf-8?B?V1VJczNWTEZXSHljRm8zV25WYW5kSFlhNU1OZG9oNlpCOEJqcE5PaHJ1ZVVJ?=
 =?utf-8?B?SXQrL0tyVEVtTkVsTmwwQVlBMzFvWXRtQzVGT2JNcWQrblRjRG5Ec01zNXJv?=
 =?utf-8?B?bDIxKzNOWU9OU3d6RVBxZHNoWUhXNHU1NHR1WVBmSEZqVFNwR2IybVVjSjdC?=
 =?utf-8?B?em9SQ3BhZzUxR0NFeFNOMDRiUXpBTWtlblNhUFBBVkNFR3NnQjdJTjE5dURl?=
 =?utf-8?B?SnQ0emhaeENUaXZQYUZsMWE1K0l3dmdscGJIdHl2L0FtYlNLRE5hdTJkU29t?=
 =?utf-8?B?NGdCUXFWY05uUW5DLzhOd2FtSmtjVVl6bmczUUlEczJlQTVsK2xaS283dTNY?=
 =?utf-8?B?VVFMV2VrMTlnYVVlWVBHYzZJdHIrUDVuOEhMUW40NTJPMEdYMkh0MmIzaFFC?=
 =?utf-8?B?V3Nkem1ndEF6QWpJdVBmZHNUS1BMQk4wc2c4bDhhbzNWdzJLZk1BSWtzOStx?=
 =?utf-8?B?VVVhNFVJMHRtUUcxRkFtdzFuTHEra2xQam50OWZTMy9kQmtVUzJkVWNJZmhn?=
 =?utf-8?B?aDZSMzlQdlk4R09JcXJCekxLaUY1MjJaY1RXNmRPbkRNWGJzVnpqRXJMT0Fo?=
 =?utf-8?B?LzIzbEl6VXhXSnNvUU45NFR3ZlM2Z0tjaURTWGZqRWhjaDdJWlIvamxRQ2t0?=
 =?utf-8?B?T0I5akdnUnJ6T0pKSkN6NEtrempYSklSZWJib1RCQmxMVG5rV2tkV3pXKzJT?=
 =?utf-8?B?L1ZsSXVYMjRvVThNenpVQURxdHNZZ3FnL3NNbmZPMkVEUDBxL1VEY2JWOGdq?=
 =?utf-8?B?dnZzUmRZU2VmMUthcEtVem1kd1VaZ3JFcHRESUVXbG1ENW5QOVVjYWtTZzJm?=
 =?utf-8?B?QkNNMkdBelZlSWpvWU53bEJqbTBpRjBIZmxJMi9KWENrVUxXalk2dTlyemVT?=
 =?utf-8?B?amtjWTAycTd3PT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0D88DF97F18AAE48BC77F73308504D72@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6037
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF0003922D.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ba668be0-68fa-41e7-ea9e-08dd77403bf8
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|82310400026|376014|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?elJLa3gvckhhS3U0UFplT0J3dXNsL3NGU2dGT1JJWnlBeXZ6NmRhejMycXJU?=
 =?utf-8?B?bXZRQW5XNE5oZUdESXl3Vk5Sb0Y4czd5b1c1QXIzNkFESzZNdnd1MmdqUmxX?=
 =?utf-8?B?c0VmR1FVb3Z4YyswZGJlNTdvWTlnYkZFZDE5WUgvdyt1eTZDMS8veWZoR01N?=
 =?utf-8?B?WlRCK0oyc2grdmNWWHRjM2tQRUxXSnlwQTBnbkh4ZXhvVE05aW1ZYnMrY1hT?=
 =?utf-8?B?aVpBVHFYZ2I5eGU1REdZMHczK2NLQWYwUGlvMHpraEtmcmtrd0xIQ29iRHdu?=
 =?utf-8?B?Q2gwQ3lleU1JMHVUbEpwc1h4SW8yaGlaOHl4dFFMZXRUUitmMEx2VkdlUnZz?=
 =?utf-8?B?QktoalNDZUc3cDFOem1WeFFlenQ5cUxjc1k2YnJUOU12d2xBa0NBdzFxSk1z?=
 =?utf-8?B?MmJyYXFzYmFHNDZGbThnbWV5YklDYThCeEdGaVBvRjNHNWdsYWdNZXM2ZkRo?=
 =?utf-8?B?OSsrdlBkS0F2TlpZQWEwck1pcVlPSkM3bkRnQWM1cWhrYW1BSDRPblRZOGVT?=
 =?utf-8?B?cWpSS09FTXlXa2ZNbEJnWXdndjh2Z0g4QlZNek9RQlRHZnJnb1ZEUzNjTGFL?=
 =?utf-8?B?dm5ObHpIWUs2R1hkYkxhdkl0SXdVZTdIbTU3blQxMmdYbzlsZlN5U0JWeFV2?=
 =?utf-8?B?dDJyYnM2c0pSQmozTHl4aWEzem1rZURJa1F4WW05b1ZveWh6eEMxeTh2cWxZ?=
 =?utf-8?B?dnlJYmE0WTlVNWFqKzZvSmdueDN5TU1OMkMwdldkSEVBcnp1QWNYRXlGdUhi?=
 =?utf-8?B?dEZRQWlobzhEQ1dPUmRzeTFxbmVaaDlWZ2txOVFRc1djVHhkR0xRdzdDc1B1?=
 =?utf-8?B?ckNmL0s2bXdGNDA0aVdRR0lDMFhZcGx5N0ZvVmg5ZjMvTDBObWlmZ29vc3RW?=
 =?utf-8?B?RFkxSWErend3TXIzY0pIdCt5LzlxNEdzdytEblpMcGd2cjBCSEtpU1M4ZFJt?=
 =?utf-8?B?bnRpY0tNMW52c2ptWmZwYS9IYm1ETStzU3pNcmdtOHg2eTlZNzFydnBySUhj?=
 =?utf-8?B?dFN2VGd4MWtCZ2hLa1plaElaWWhFeW56VWdoNWhhaHJCeXlFbm81cXdSdzlm?=
 =?utf-8?B?bjRKVUw5TTFnRURScG5Da0NyQWlRQ3Y0cGFYbmNrdjM5dzNWeTZlQ2FVZkg3?=
 =?utf-8?B?TGUzMy9SV3FtWnJvMU9OUXgxVFQ0L1NwVmFqelVuL1F6M2N4NzRBb3QzMUNn?=
 =?utf-8?B?ZldUbTVoeGpLc0dRYTlnNkdTM3JUNEE1b2h6TFNQWC9nVCtqN1VueFpTNHVG?=
 =?utf-8?B?ZW5XcmQ0M1pOditnSEpXai85SlZvL3N3OHg0MGg3V013bWMzR0lZZGFwRHZN?=
 =?utf-8?B?TXY0ZDBVbGFGcUZzVzZoUTF2OG41ZUVqVDNacmxOcEh2bVhPc2U0WHE4QXdj?=
 =?utf-8?B?K0twUWZzUno4MUpGZjFIY2JkaFV5UjE5aGFwaVNCVEJQL3hDOFV5VTJRTnZZ?=
 =?utf-8?B?OXRXT0FGNDZqL3I5ZFJUUnhNdTdWdnRxSTBFbWdzNG44MXN4YjIxMHpCSE5R?=
 =?utf-8?B?MExkYzBxak0yUG4vM3NLcGhWZ09kS25XQ0I2c2Z0TGdFU09GRkZkeG1HTlB6?=
 =?utf-8?B?b0ltU0d0RzNTMVpjSkFiN2s2RzVzR0JHb3lNS1hUL0VoWEpEMCtaYmhuUXpp?=
 =?utf-8?B?Zi9neWNNMlFZaW5jUENjbW9HK1JSQzJveE1Ga1hKaHdzV3hTOXdhc1ZxYStI?=
 =?utf-8?B?OE1lRFg4em5MS3E0cCtoalVoOVc3R0JuOE8vYldRK2dkVncvVEJES2p6QVZa?=
 =?utf-8?B?d0RZak51WmlmZWMvdStuUUV6MktxdE0vZnNBaFFLa2RSUGNTOWUvUGljZlBv?=
 =?utf-8?B?SUtjUXM3YVcyZ2k4b2ozcEZFbE5zcGNiSjFiU0VUOXBQS2JOanQwM0VSemJS?=
 =?utf-8?B?VWUxeHJIdUQ1U09mZVhlOG9wT3E3OGFnTG5oSi93SEMzUkxJcjFwZ3ZlWTA3?=
 =?utf-8?B?TDVPYXFnS2Flam9NUUVlVHk5dUtvT3RsYUdzd1A2Vnc2eVlUbHBkNjAwOWdK?=
 =?utf-8?B?RE5aQ1RiYTFxMTNsTkNvNG1vcktoa3NTM2wwS3RCcmtrVzdlVmVITGF2TUJ3?=
 =?utf-8?Q?6faRsq?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(82310400026)(376014)(36860700013)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 08:27:04.4261
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9eea8c2-7842-4c31-7297-08dd77404f1c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF0003922D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7868

SGkgQXlhbiwNCg0KPj4+IFRoZSBwb2ludCBvZiB0aGUgY29kZSB3YXMgdG8gZG9u4oCZdCBpc3N1
ZSBhbiBpc2IoKSBldmVyeSB0aW1lIHdlIGNoYW5nZSB0aGUgc2VsZWN0b3IsDQo+Pj4gb2YgY291
cnNlIHRoZSBjb2RlIHdvdWxkIGJlIGVhc2llciBvdGhlcndpc2UsIGJ1dCBkbyB3ZSB3YW50IHRv
IGRvIHRoYXQ/DQo+PiANCj4+IE5vdCBzdXJlIGlmIGl0IGlzIGJlbmVmaWNpYWwgYXMgeW91IHdv
dWxkIG5lZWQgdG8gdXNlIGlzYigpIGZyb20gcmVnaW9uMTYgb253YXJkcy4NCj4gDQo+IFRoZSBp
c2IoKSBpcyBpc3N1ZWQgb25seSB3aGVuIGNoYW5naW5nIHRoZSBzZWxlY3Rvciwgc28gd2hlbiB5
b3UgZ28gZnJvbSByZWFkaW5nL3dyaXRpbmcgcmVnaW9ucw0KPiBmcm9tIDAtMTUgdG8gMTYtMzEg
Zm9yIGV4YW1wbGUsIG9mIGNvdXJzZSB0aGVyZSBpcyBhIGNhc2UgdGhhdCBpZiB5b3UgY29udGlu
dW91c2x5IHdyaXRlIG9uIHJlZ2lvbiAxNQ0KPiBhbmQgMTYgeW91IHdvdWxkIGhhdmUgdG8gYWx3
YXlzIGNoYW5nZSB0aGUgc2VsZWN0b3IsIGJ1dCBpdOKAmXMgdGhlIGxlc3MgaW1wYWN0IHdlIGNv
dWxkIGhhdmUuDQo+IA0KPiBhcm12OC1SIGlzIGV2ZW4gYmV0dGVyIHNpbmNlIGl04oCZcyBhYmxl
IHRvIGFkZHJlc3MgcmVnaW9ucyBmcm9tIDAgdG8gMjMgd2l0aG91dCBmbHVzaGluZyB0aGUgcGlw
ZWxpbmUsDQogICAgICAgICAgICAgICAgIF7igJQgYWFyY2gzMiA6KQ0KDQo+IHNvIEkgd291bGQg
c2F5IHdlIHNob3VsZCBleHBsb2l0IHRoaXMgYmlnIGFkdmFudGFnZS4NCj4gDQo+IEnigJlsbCBz
ZW5kIHNob3J0bHkgaW4gdGhpcyB0aHJlYWQgdGhlIGNvZGUgSSB3b3VsZCB1c2UgYW5kIHRoZSBj
b2RlIEkgd2FzIHRoaW5raW5nIHlvdSBjb3VsZCB1c2UuDQoNCkhlcmUgdGhlIGNvZGUgSSBoYXZl
IGluIG1pbmQ6DQoNCnN0YXRpYyB2b2lkIHByZXBhcmVfc2VsZWN0b3IodWludDhfdCAqc2VsKQ0K
ew0KICAgIHVpbnQ4X3QgY3VyX3NlbCA9ICpzZWw7DQogICAgLyoNCiAgICAgKiB7cmVhZCx3cml0
ZX1fcHJvdGVjdGlvbl9yZWdpb24gd29ya3MgdXNpbmcgdGhlIGRpcmVjdCBhY2Nlc3MgdG8gdGhl
IDAuLjE1DQogICAgICogcmVnaW9ucywgc28gaW4gb3JkZXIgdG8gc2F2ZSB0aGUgaXNiKCkgb3Zl
cmhlYWQsIGNoYW5nZSB0aGUgUFJTRUxSX0VMMg0KICAgICAqIG9ubHkgd2hlbiBuZWVkZWQsIHNv
IHdoZW4gdGhlIHVwcGVyIDQgYml0cyBvZiB0aGUgc2VsZWN0b3Igd2lsbCBjaGFuZ2UuDQogICAg
ICovDQogICAgY3VyX3NlbCAmPSAweEYwVTsNCiAgICBpZiAoIFJFQURfU1lTUkVHKFBSU0VMUl9F
TDIpICE9IGN1cl9zZWwgKQ0KICAgIHsNCiAgICAgICAgV1JJVEVfU1lTUkVHKGN1cl9zZWwsIFBS
U0VMUl9FTDIpOw0KICAgICAgICBpc2IoKTsNCiAgICB9DQogICAgKnNlbCA9ICpzZWwgJiAweEZV
Ow0KfQ0KDQp2b2lkIHJlYWRfcHJvdGVjdGlvbl9yZWdpb24ocHJfdCAqcHJfcmVhZCwgdWludDhf
dCBzZWwpDQp7DQogICAgLyoNCiAgICAgKiBCZWZvcmUgYWNjZXNzaW5nIEVMMiBNUFUgcmVnaW9u
IHJlZ2lzdGVyIFBSQkFSX0VMMi9QUkxBUl9FTDIsDQogICAgICogbWFrZSBzdXJlIFBSU0VMUl9F
TDIgaXMgc2V0LCBhcyBpdCBkZXRlcm1pbmVzIHdoaWNoIE1QVSByZWdpb24NCiAgICAgKiBpcyBz
ZWxlY3RlZC4NCiAgICAgKi8NCiAgICBwcmVwYXJlX3NlbGVjdG9yKCZzZWwpOw0KDQogICAgc3dp
dGNoICggc2VsICkNCiAgICB7DQogICAgICAgIEdFTkVSQVRFX1JFQURfUFJfUkVHX0NBU0UoMCwg
cHJfcmVhZCk7DQogICAgICAgIEdFTkVSQVRFX1JFQURfUFJfUkVHX0NBU0UoMSwgcHJfcmVhZCk7
DQogICAgICAgIEdFTkVSQVRFX1JFQURfUFJfUkVHX0NBU0UoMiwgcHJfcmVhZCk7DQogICAgICAg
IEdFTkVSQVRFX1JFQURfUFJfUkVHX0NBU0UoMywgcHJfcmVhZCk7DQogICAgICAgIEdFTkVSQVRF
X1JFQURfUFJfUkVHX0NBU0UoNCwgcHJfcmVhZCk7DQogICAgICAgIEdFTkVSQVRFX1JFQURfUFJf
UkVHX0NBU0UoNSwgcHJfcmVhZCk7DQogICAgICAgIEdFTkVSQVRFX1JFQURfUFJfUkVHX0NBU0Uo
NiwgcHJfcmVhZCk7DQogICAgICAgIEdFTkVSQVRFX1JFQURfUFJfUkVHX0NBU0UoNywgcHJfcmVh
ZCk7DQogICAgICAgIEdFTkVSQVRFX1JFQURfUFJfUkVHX0NBU0UoOCwgcHJfcmVhZCk7DQogICAg
ICAgIEdFTkVSQVRFX1JFQURfUFJfUkVHX0NBU0UoOSwgcHJfcmVhZCk7DQogICAgICAgIEdFTkVS
QVRFX1JFQURfUFJfUkVHX0NBU0UoMTAsIHByX3JlYWQpOw0KICAgICAgICBHRU5FUkFURV9SRUFE
X1BSX1JFR19DQVNFKDExLCBwcl9yZWFkKTsNCiAgICAgICAgR0VORVJBVEVfUkVBRF9QUl9SRUdf
Q0FTRSgxMiwgcHJfcmVhZCk7DQogICAgICAgIEdFTkVSQVRFX1JFQURfUFJfUkVHX0NBU0UoMTMs
IHByX3JlYWQpOw0KICAgICAgICBHRU5FUkFURV9SRUFEX1BSX1JFR19DQVNFKDE0LCBwcl9yZWFk
KTsNCiAgICAgICAgR0VORVJBVEVfUkVBRF9QUl9SRUdfQ0FTRSgxNSwgcHJfcmVhZCk7DQogICAg
ZGVmYXVsdDoNCiAgICAgICAgQlVHKCk7IC8qIENhbid0IGhhcHBlbiAqLw0KICAgIH0NCn0NCg0K
dm9pZCB3cml0ZV9wcm90ZWN0aW9uX3JlZ2lvbihjb25zdCBwcl90ICpwcl93cml0ZSwgdWludDhf
dCBzZWwpDQp7DQogICAgLyoNCiAgICAgKiBCZWZvcmUgYWNjZXNzaW5nIEVMMiBNUFUgcmVnaW9u
IHJlZ2lzdGVyIFBSQkFSX0VMMi9QUkxBUl9FTDIsDQogICAgICogbWFrZSBzdXJlIFBSU0VMUl9F
TDIgaXMgc2V0LCBhcyBpdCBkZXRlcm1pbmVzIHdoaWNoIE1QVSByZWdpb24NCiAgICAgKiBpcyBz
ZWxlY3RlZC4NCiAgICAgKi8NCiAgICBwcmVwYXJlX3NlbGVjdG9yKCZzZWwpOw0KDQogICAgc3dp
dGNoICggc2VsICkNCiAgICB7DQogICAgICAgIEdFTkVSQVRFX1dSSVRFX1BSX1JFR19DQVNFKDAs
IHByX3dyaXRlKTsNCiAgICAgICAgR0VORVJBVEVfV1JJVEVfUFJfUkVHX0NBU0UoMSwgcHJfd3Jp
dGUpOw0KICAgICAgICBHRU5FUkFURV9XUklURV9QUl9SRUdfQ0FTRSgyLCBwcl93cml0ZSk7DQog
ICAgICAgIEdFTkVSQVRFX1dSSVRFX1BSX1JFR19DQVNFKDMsIHByX3dyaXRlKTsNCiAgICAgICAg
R0VORVJBVEVfV1JJVEVfUFJfUkVHX0NBU0UoNCwgcHJfd3JpdGUpOw0KICAgICAgICBHRU5FUkFU
RV9XUklURV9QUl9SRUdfQ0FTRSg1LCBwcl93cml0ZSk7DQogICAgICAgIEdFTkVSQVRFX1dSSVRF
X1BSX1JFR19DQVNFKDYsIHByX3dyaXRlKTsNCiAgICAgICAgR0VORVJBVEVfV1JJVEVfUFJfUkVH
X0NBU0UoNywgcHJfd3JpdGUpOw0KICAgICAgICBHRU5FUkFURV9XUklURV9QUl9SRUdfQ0FTRSg4
LCBwcl93cml0ZSk7DQogICAgICAgIEdFTkVSQVRFX1dSSVRFX1BSX1JFR19DQVNFKDksIHByX3dy
aXRlKTsNCiAgICAgICAgR0VORVJBVEVfV1JJVEVfUFJfUkVHX0NBU0UoMTAsIHByX3dyaXRlKTsN
CiAgICAgICAgR0VORVJBVEVfV1JJVEVfUFJfUkVHX0NBU0UoMTEsIHByX3dyaXRlKTsNCiAgICAg
ICAgR0VORVJBVEVfV1JJVEVfUFJfUkVHX0NBU0UoMTIsIHByX3dyaXRlKTsNCiAgICAgICAgR0VO
RVJBVEVfV1JJVEVfUFJfUkVHX0NBU0UoMTMsIHByX3dyaXRlKTsNCiAgICAgICAgR0VORVJBVEVf
V1JJVEVfUFJfUkVHX0NBU0UoMTQsIHByX3dyaXRlKTsNCiAgICAgICAgR0VORVJBVEVfV1JJVEVf
UFJfUkVHX0NBU0UoMTUsIHByX3dyaXRlKTsNCiAgICBkZWZhdWx0Og0KICAgICAgICBCVUcoKTsg
LyogQ2FuJ3QgaGFwcGVuICovDQogICAgfQ0KfQ0KDQpIZXJlIHRoZSBjb2RlIEkgdGhvdWdodCB5
b3UgY291bGQgYWRkIGZvciBhcm0zMjoNCg0Kc3RhdGljIHZvaWQgcHJlcGFyZV9zZWxlY3Rvcih1
aW50OF90ICpzZWwpDQp7DQogICAgdWludDhfdCBjdXJfc2VsID0gKnNlbDsNCg0KI2lmZGVmIENP
TkZJR19BUk1fNjQNCiAgICAvKg0KICAgICAqIHtyZWFkLHdyaXRlfV9wcm90ZWN0aW9uX3JlZ2lv
biB3b3JrcyB1c2luZyB0aGUgZGlyZWN0IGFjY2VzcyB0byB0aGUgMC4uMTUNCiAgICAgKiByZWdp
b25zLCBzbyBpbiBvcmRlciB0byBzYXZlIHRoZSBpc2IoKSBvdmVyaGVhZCwgY2hhbmdlIHRoZSBQ
UlNFTFJfRUwyDQogICAgICogb25seSB3aGVuIG5lZWRlZCwgc28gd2hlbiB0aGUgdXBwZXIgNCBi
aXRzIG9mIHRoZSBzZWxlY3RvciB3aWxsIGNoYW5nZS4NCiAgICAgKi8NCiAgICBjdXJfc2VsICY9
IDB4RjBVOw0KICAgIGlmICggUkVBRF9TWVNSRUcoUFJTRUxSX0VMMikgIT0gY3VyX3NlbCApDQog
ICAgew0KICAgICAgICBXUklURV9TWVNSRUcoY3VyX3NlbCwgUFJTRUxSX0VMMik7DQogICAgICAg
IGlzYigpOw0KICAgIH0NCiAgICAqc2VsID0gKnNlbCAmIDB4RlU7DQojZWxzZQ0KICAgIGlmICgg
Y3VyX3NlbCA+IDIzICkNCiAgICAgICAgcGFuaWMoIkFybXY4LVIgQUFyY2gzMiByZWdpb24gc2Vs
ZWN0b3IgZXhjZWVkcyBtYXhpbXVtIGFsbG93ZWQgcmFuZ2UhIik7DQojZW5kaWYNCn0NCg0Kdm9p
ZCByZWFkX3Byb3RlY3Rpb25fcmVnaW9uKHByX3QgKnByX3JlYWQsIHVpbnQ4X3Qgc2VsKQ0Kew0K
ICAgIC8qDQogICAgICogQmVmb3JlIGFjY2Vzc2luZyBFTDIgTVBVIHJlZ2lvbiByZWdpc3RlciBQ
UkJBUl9FTDIvUFJMQVJfRUwyLA0KICAgICAqIG1ha2Ugc3VyZSBQUlNFTFJfRUwyIGlzIHNldCwg
YXMgaXQgZGV0ZXJtaW5lcyB3aGljaCBNUFUgcmVnaW9uDQogICAgICogaXMgc2VsZWN0ZWQuDQog
ICAgICovDQogICAgcHJlcGFyZV9zZWxlY3Rvcigmc2VsKTsNCg0KICAgIHN3aXRjaCAoIHNlbCAp
DQogICAgew0KICAgICAgICBHRU5FUkFURV9SRUFEX1BSX1JFR19DQVNFKDAsIHByX3JlYWQpOw0K
ICAgICAgICBHRU5FUkFURV9SRUFEX1BSX1JFR19DQVNFKDEsIHByX3JlYWQpOw0KICAgICAgICBH
RU5FUkFURV9SRUFEX1BSX1JFR19DQVNFKDIsIHByX3JlYWQpOw0KICAgICAgICBHRU5FUkFURV9S
RUFEX1BSX1JFR19DQVNFKDMsIHByX3JlYWQpOw0KICAgICAgICBHRU5FUkFURV9SRUFEX1BSX1JF
R19DQVNFKDQsIHByX3JlYWQpOw0KICAgICAgICBHRU5FUkFURV9SRUFEX1BSX1JFR19DQVNFKDUs
IHByX3JlYWQpOw0KICAgICAgICBHRU5FUkFURV9SRUFEX1BSX1JFR19DQVNFKDYsIHByX3JlYWQp
Ow0KICAgICAgICBHRU5FUkFURV9SRUFEX1BSX1JFR19DQVNFKDcsIHByX3JlYWQpOw0KICAgICAg
ICBHRU5FUkFURV9SRUFEX1BSX1JFR19DQVNFKDgsIHByX3JlYWQpOw0KICAgICAgICBHRU5FUkFU
RV9SRUFEX1BSX1JFR19DQVNFKDksIHByX3JlYWQpOw0KICAgICAgICBHRU5FUkFURV9SRUFEX1BS
X1JFR19DQVNFKDEwLCBwcl9yZWFkKTsNCiAgICAgICAgR0VORVJBVEVfUkVBRF9QUl9SRUdfQ0FT
RSgxMSwgcHJfcmVhZCk7DQogICAgICAgIEdFTkVSQVRFX1JFQURfUFJfUkVHX0NBU0UoMTIsIHBy
X3JlYWQpOw0KICAgICAgICBHRU5FUkFURV9SRUFEX1BSX1JFR19DQVNFKDEzLCBwcl9yZWFkKTsN
CiAgICAgICAgR0VORVJBVEVfUkVBRF9QUl9SRUdfQ0FTRSgxNCwgcHJfcmVhZCk7DQogICAgICAg
IEdFTkVSQVRFX1JFQURfUFJfUkVHX0NBU0UoMTUsIHByX3JlYWQpOw0KI2lmZGVmIENPTkZJR19B
Uk1fMzINCiAgICAgICAgR0VORVJBVEVfUkVBRF9QUl9SRUdfQ0FTRSgxNiwgcHJfcmVhZCk7DQog
ICAgICAgIEdFTkVSQVRFX1JFQURfUFJfUkVHX0NBU0UoMTcsIHByX3JlYWQpOw0KICAgICAgICBH
RU5FUkFURV9SRUFEX1BSX1JFR19DQVNFKDE4LCBwcl9yZWFkKTsNCiAgICAgICAgR0VORVJBVEVf
UkVBRF9QUl9SRUdfQ0FTRSgxOSwgcHJfcmVhZCk7DQogICAgICAgIEdFTkVSQVRFX1JFQURfUFJf
UkVHX0NBU0UoMjAsIHByX3JlYWQpOw0KICAgICAgICBHRU5FUkFURV9SRUFEX1BSX1JFR19DQVNF
KDIxLCBwcl9yZWFkKTsNCiAgICAgICAgR0VORVJBVEVfUkVBRF9QUl9SRUdfQ0FTRSgyMiwgcHJf
cmVhZCk7DQogICAgICAgIEdFTkVSQVRFX1JFQURfUFJfUkVHX0NBU0UoMjMsIHByX3JlYWQpOw0K
I2VuZGlmDQogICAgZGVmYXVsdDoNCiAgICAgICAgQlVHKCk7IC8qIENhbid0IGhhcHBlbiAqLw0K
ICAgIH0NCn0NCg0Kdm9pZCB3cml0ZV9wcm90ZWN0aW9uX3JlZ2lvbihjb25zdCBwcl90ICpwcl93
cml0ZSwgdWludDhfdCBzZWwpDQp7DQogICAgLyoNCiAgICAgKiBCZWZvcmUgYWNjZXNzaW5nIEVM
MiBNUFUgcmVnaW9uIHJlZ2lzdGVyIFBSQkFSX0VMMi9QUkxBUl9FTDIsDQogICAgICogbWFrZSBz
dXJlIFBSU0VMUl9FTDIgaXMgc2V0LCBhcyBpdCBkZXRlcm1pbmVzIHdoaWNoIE1QVSByZWdpb24N
CiAgICAgKiBpcyBzZWxlY3RlZC4NCiAgICAgKi8NCiAgICBwcmVwYXJlX3NlbGVjdG9yKCZzZWwp
Ow0KDQogICAgc3dpdGNoICggc2VsICkNCiAgICB7DQogICAgICAgIEdFTkVSQVRFX1dSSVRFX1BS
X1JFR19DQVNFKDAsIHByX3dyaXRlKTsNCiAgICAgICAgR0VORVJBVEVfV1JJVEVfUFJfUkVHX0NB
U0UoMSwgcHJfd3JpdGUpOw0KICAgICAgICBHRU5FUkFURV9XUklURV9QUl9SRUdfQ0FTRSgyLCBw
cl93cml0ZSk7DQogICAgICAgIEdFTkVSQVRFX1dSSVRFX1BSX1JFR19DQVNFKDMsIHByX3dyaXRl
KTsNCiAgICAgICAgR0VORVJBVEVfV1JJVEVfUFJfUkVHX0NBU0UoNCwgcHJfd3JpdGUpOw0KICAg
ICAgICBHRU5FUkFURV9XUklURV9QUl9SRUdfQ0FTRSg1LCBwcl93cml0ZSk7DQogICAgICAgIEdF
TkVSQVRFX1dSSVRFX1BSX1JFR19DQVNFKDYsIHByX3dyaXRlKTsNCiAgICAgICAgR0VORVJBVEVf
V1JJVEVfUFJfUkVHX0NBU0UoNywgcHJfd3JpdGUpOw0KICAgICAgICBHRU5FUkFURV9XUklURV9Q
Ul9SRUdfQ0FTRSg4LCBwcl93cml0ZSk7DQogICAgICAgIEdFTkVSQVRFX1dSSVRFX1BSX1JFR19D
QVNFKDksIHByX3dyaXRlKTsNCiAgICAgICAgR0VORVJBVEVfV1JJVEVfUFJfUkVHX0NBU0UoMTAs
IHByX3dyaXRlKTsNCiAgICAgICAgR0VORVJBVEVfV1JJVEVfUFJfUkVHX0NBU0UoMTEsIHByX3dy
aXRlKTsNCiAgICAgICAgR0VORVJBVEVfV1JJVEVfUFJfUkVHX0NBU0UoMTIsIHByX3dyaXRlKTsN
CiAgICAgICAgR0VORVJBVEVfV1JJVEVfUFJfUkVHX0NBU0UoMTMsIHByX3dyaXRlKTsNCiAgICAg
ICAgR0VORVJBVEVfV1JJVEVfUFJfUkVHX0NBU0UoMTQsIHByX3dyaXRlKTsNCiAgICAgICAgR0VO
RVJBVEVfV1JJVEVfUFJfUkVHX0NBU0UoMTUsIHByX3dyaXRlKTsNCiNpZmRlZiBDT05GSUdfQVJN
XzMyDQogICAgICAgIEdFTkVSQVRFX1dSSVRFX1BSX1JFR19DQVNFKDE2LCBwcl93cml0ZSk7DQog
ICAgICAgIEdFTkVSQVRFX1dSSVRFX1BSX1JFR19DQVNFKDE3LCBwcl93cml0ZSk7DQogICAgICAg
IEdFTkVSQVRFX1dSSVRFX1BSX1JFR19DQVNFKDE4LCBwcl93cml0ZSk7DQogICAgICAgIEdFTkVS
QVRFX1dSSVRFX1BSX1JFR19DQVNFKDE5LCBwcl93cml0ZSk7DQogICAgICAgIEdFTkVSQVRFX1dS
SVRFX1BSX1JFR19DQVNFKDIwLCBwcl93cml0ZSk7DQogICAgICAgIEdFTkVSQVRFX1dSSVRFX1BS
X1JFR19DQVNFKDIxLCBwcl93cml0ZSk7DQogICAgICAgIEdFTkVSQVRFX1dSSVRFX1BSX1JFR19D
QVNFKDIyLCBwcl93cml0ZSk7DQogICAgICAgIEdFTkVSQVRFX1dSSVRFX1BSX1JFR19DQVNFKDIz
LCBwcl93cml0ZSk7DQojZW5kaWYNCiAgICBkZWZhdWx0Og0KICAgICAgICBCVUcoKTsgLyogQ2Fu
J3QgaGFwcGVuICovDQogICAgfQ0KfQ0KDQpQbGVhc2UgbGV0IG1lIGtub3cgeW91ciB0aG91Z2h0
cy4NCg0KQ2hlZXJzLA0KTHVjYQ0KDQoNCg0K

