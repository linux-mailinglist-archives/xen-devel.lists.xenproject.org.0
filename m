Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06983ADC2FF
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 09:15:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017783.1394776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRQXU-0005en-Hg; Tue, 17 Jun 2025 07:15:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017783.1394776; Tue, 17 Jun 2025 07:15:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRQXU-0005cb-EK; Tue, 17 Jun 2025 07:15:24 +0000
Received: by outflank-mailman (input) for mailman id 1017783;
 Tue, 17 Jun 2025 07:15:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zxid=ZA=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uRQXS-0005cC-Ny
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 07:15:22 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2412::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d349f0f5-4b4a-11f0-a309-13f23c93f187;
 Tue, 17 Jun 2025 09:15:21 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 IA0PPF6483BC7EA.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bcf)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Tue, 17 Jun
 2025 07:15:09 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%5]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 07:15:09 +0000
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
X-Inumbo-ID: d349f0f5-4b4a-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VCpcOk9HByOvKYkIdV6/Lh9SRutiZ0OxD21EDD4bpMzt5UhABPR1oj9rhZL/y+bCw1cOelFoe4aWjg0udyro4r3ZBeuJWyPjXvLSmMfprmxndjdPLBfoPF0NyTV9lhNmqhUHx4ErLiMVIUgkiAkgCxn3eTCOSlJPuOZkBbkqtuREKbNq2Qa+ezpwRcICfKH0T4hZi/04/iaPEZmnjX0uh+SwtWXP3eTQiwNS/IBPFlz0DIbFsj3UWF2Yv1J6v6wyz4Y/OGIeG0OAhjunlTxTjxpLKNwDLd0y4jZrlwWzj1ib+RxsHxELqzsWfpR3vEP6Kh5/7gAl7t7RnFeMYbGR0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pIIWYbo09XV2wspvt9ywdNSEyBMkIvQeHXjtvk3bUsM=;
 b=bmH82fIs/tMKDSOK0XrZQ+y3hpqEbnppI1eeopIC5UBYT8FHoB2VmV1w7yo8mDa96z+nO0nfILs08NikOol2Ks/73lvgVx2pmciRAkwaGkY0sfF9eCrwwP6Ckh9uqVCiUdlEhBj2MZNULcUQYxSkI4RIS1RKoO8YotOx+Q84wy1jC6B6QPjyRMYbnh+BJ0Q9Lyl+8Hvj4m3Ft5K5/iw8xG6X9eBCGoGRWXOhssihkQ3HowH+0FWJ8Dl5Q1oOavX9GZEd9K1jqDWyvWomAGbPQj1EeSffhYMh8RGx7LcB08p3qffjlhQjYYLck716J7QO+ICiszeiCHIIMYSTixLGpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pIIWYbo09XV2wspvt9ywdNSEyBMkIvQeHXjtvk3bUsM=;
 b=dQokHpL6UdmvjQp5wsDnU+W0n1jZq/TiEJWEYoYhJfPtQ/1zsFNQKoAfv/XI7b4lDu1IO4aUYh46LGpIY3cvHphOtdRA4JQ+nqhEAiqpzwT4swHj7XUI+xyB5EIJzEpqnuXDirW4rep51VTH8foWQm6vKNBL2dYWqIodlmxCMU8=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v5 06/18] xen/x86: introduce "cpufreq=amd-cppc" xen
 cmdline
Thread-Topic: [PATCH v5 06/18] xen/x86: introduce "cpufreq=amd-cppc" xen
 cmdline
Thread-Index: AQHbzuRARq8PSmkmBEm8nuMU3PtyjLP/b5OAgAeOMuA=
Date: Tue, 17 Jun 2025 07:15:09 +0000
Message-ID:
 <DM4PR12MB8451ABA583A373B1C2FBEE46E173A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-7-Penny.Zheng@amd.com>
 <3edeeff2-5728-46cc-9436-01e5e3cf2bd3@suse.com>
In-Reply-To: <3edeeff2-5728-46cc-9436-01e5e3cf2bd3@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-06-17T07:15:03.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|IA0PPF6483BC7EA:EE_
x-ms-office365-filtering-correlation-id: e11c47fe-07a5-4cce-b9be-08ddad6eb1ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eUhVQ0U4b3VHT0JSSDNVT1dnU3puSVYxRzJkc1NlQWpyZmdJQTgwOXZRRW9s?=
 =?utf-8?B?eHJGOWx3OHBBdFB5enB5dTNqTStqbE1yZGswSytOWldSTGd6Q3p2UnRRVmpU?=
 =?utf-8?B?Qll3Rkd6TSttazdsMVhFWGYvNlZjcmdyTzdLd08rT3VETDltOUJWVnhIakxL?=
 =?utf-8?B?akVzdUNFZjVQQzZ4RXZLeDVKNEhkdm9qcGZIMTd5aHN6bUUwUGVLZVI3Qmk3?=
 =?utf-8?B?TlpZR2pNemgrekFlZkMrZ0YyaS9iYWFtdzB3NDgyQW5rVEdsUldIMEpNMEla?=
 =?utf-8?B?YUZXeXJZdU5wbkJYR3NjalBway9ZbzdqUktFQm9Ra29hYUlRd2JvN0tSZ2ty?=
 =?utf-8?B?TzZQOGlOakU1WW8remh4RExRMXBDZ0lUR29sdmdweHFHa2haa2dLQkdDd3dS?=
 =?utf-8?B?ODUvdFhwNmVEckUyN2JVbXJ2cGV5ZmhJTXRuWTlub3EvMTNqZ3ZTb3l0VUph?=
 =?utf-8?B?WGxEWHNBbkNJZ0didnF0QUw4ckhXVG5INXhzSmszVVNVZ1NGOVFnd09ybm9k?=
 =?utf-8?B?N25YYUlOd0xGanNYbGthR3NUVXBXTVBZU2VlUUpPemJtcmtKZFg4QklLWUtO?=
 =?utf-8?B?ODFFVTNNV21odmdmUjJFSWo0RWJ2Nm5ZRStGamtjZjMvbkIwQ3NjdEZicE5y?=
 =?utf-8?B?OUFEMXVaa2N3YkJVZE9GdmpoV1I5aXh5VStxNnlSMzJiWjZXazhnNE1CZHli?=
 =?utf-8?B?SCsrSmROT2JUTUdrdXAycGREaHQwTWFmcHQxQnVRUUV5akl0aXd1VFFxVmtn?=
 =?utf-8?B?YjE5QUVGTVVPUzRwZndIYW9OUHgxU213WmwrKzRGcllsSU9WcHhUcTQvVUVS?=
 =?utf-8?B?T3plSnJmcmdCdGN6UEl4a05IbmVCRGJZTW1lT210OWRUeHJuTzIzeCtQb2F0?=
 =?utf-8?B?bFU5M3BXeHUwRjhpamZCYkxzZWJSQzZiQmtMdndMT0Foc3poV1ZraW92ZjZK?=
 =?utf-8?B?MzlySzczY0dmY0h6ZllMQ2gvYW1FMDFhZHVyVnhOVDl1RU8wYk5GN0JWK3lP?=
 =?utf-8?B?N1M0UEZVUlBEaXFBNDAwVDJacWVVbTgweTJtK3BGRU5UQnQvQjJVcklxbnBP?=
 =?utf-8?B?c05GUFJzTWJ4RFBOTkdqWTdZVDBPeGo5U0pWdGpMUkk1YittdzlRMFhTL0lO?=
 =?utf-8?B?VlV2Q3o5cVJ3TjMrRU04dGNoS2hKR0l0YmRQMTc4UUl6bE5rd0YweTlPQ21C?=
 =?utf-8?B?T09EelZRbW0rMDdMTTlVdjFYR1hmRFhwZWQzNzdibFplN1BiUDV0cmFYOHV1?=
 =?utf-8?B?K01BeFh2UGRZTGc3YTNEaGYrUkQyNmJEeVVkaXBSN1M4MlJxSUYzSDdnbWx1?=
 =?utf-8?B?NWx3R1lQNllRVFA0UEFnRzlkeFh2Y2I2Ny83cUN4a1YxMVdvb21pY3RGZVo5?=
 =?utf-8?B?MHZVYW10UXFtdlJaUWEwcElJdm5hTW1NUHA0RjZUYURNYzhzaTdSakRITGZ4?=
 =?utf-8?B?K0NLWkV3b1ZiNjMvclMwNkMvdytnTWNua2pFK0VTNTBzWjlnZHF4Qnp0aDVJ?=
 =?utf-8?B?dS9XS2lnKzJWek8yUjZGYzYvVUFGUGRUbTh2WDJaZ0FNY0VnQVU3WUg3cFFB?=
 =?utf-8?B?N2hrNEJBODlyeUc1Nk9nUHdrQjBrekY1SmJvN0hTM2JjSmswNWVLVGlRUnU4?=
 =?utf-8?B?N2ZiRVdlNXB0NTEraHFrMUducFY0YlpvYVg0cjk0RTlDM3ZEdk95ZHlTSGg0?=
 =?utf-8?B?eUtmWHFFNEJMQjFRNE9kT2VjRGdJRmNOU0tFSGxuUHpVZzhzR3hVeC9sZUda?=
 =?utf-8?B?SmpXQ1cwT3hKTGh3WklIVHB6OS85NUVZQ25CcVNoNDdPcSs4UzJ3NXNZTDJk?=
 =?utf-8?B?ZVFxdi9sSmNTZE5HVlhvUlhJUEZpam14N0tpQ0g5STBTbEx1Zlc4M21oaVds?=
 =?utf-8?B?dkYxVDM5TkVPMjBCWFFtOWxxUW85N3BhNVRQK0IzeCtFWkd2L1A5c09QSE1P?=
 =?utf-8?B?YWZaYzd0bjI3TjY5cVBYSmF3RlBPK1lCSXh2bFJlVmVzS1k2V0J4SnR3NCt1?=
 =?utf-8?Q?UcnHSffQ8O+GZcU33/qNviaYSyYoOU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UHgyaXozdzRSbFhTVWhDOTV0K3p3MkdvMmVMdW9iT0hBdjZRNnNMbTQxZ0FF?=
 =?utf-8?B?RE5QcWRVb05JazlvTHozY3JKZ0ZzT0dIYSszUWI3TDVucEs4SDNMb2NJSklv?=
 =?utf-8?B?cndJVjYvQWM2T0R0R3JHSHUyVTlMY2htSjhUNHdTb3JjL2FTTGNCeVA4UEE4?=
 =?utf-8?B?WVdoQWg2T2lpWk9sNlZDQXV2VXJzazBJNzhUU2hydTBBVVpWanlLVzRuMitE?=
 =?utf-8?B?dUlBYlZjcDE0NllXelVGV05YaE9sUTFzWUtSR3Y0bHpYZ1hQWWZ5Z09Ta3F3?=
 =?utf-8?B?cElMQkZHQUNoU3ZYRXhIelhpcE40V2xQMk1nZi9LWlo2QSt1Z3pyQWszT3Vj?=
 =?utf-8?B?a1dxZ0hqOUJEOCs1TTFqNEEzZmYyeFRBbFN5Y0oyNTFZazR6MjJ6bHA4cGVs?=
 =?utf-8?B?V280bDBwTWtOdFhWL0NnUXNGbUw0TWhNSXNUQTVNZXcxZ1V0c3Z5V0hnVUNP?=
 =?utf-8?B?M2t2b2oranFIZ3BjVDM1eUZoTS9FWFJLY0ZXNFFYUGk4UDdoSmhuVnlJQzZX?=
 =?utf-8?B?a2tlU0ZEdCsva1ptcVV6U1NKMHlUc2Z0c0xTaGtJOVdHSVl6dFQwTnZYa3Ur?=
 =?utf-8?B?ZWxSMUkvSmI0QUkxYjhaZ25jVVpRRXM0L2lIRVRRRzBTV2hUejBOMWNBeDZh?=
 =?utf-8?B?cjc1NHlRcEQzUnNMYkQxbWcyR0ZMK1RnSWJRT3BTTUU3RmZVYSsrWE5nY3Iy?=
 =?utf-8?B?eHEwRTVqRFhsRyt3ZkpPSEx2QTBnTXdRWmthUWFWbmsxRE1INW1hL2lGY3oy?=
 =?utf-8?B?NVc4aWMzQ29JWGxZYjVOU1c5UmxZY1NTNjY5eHRDOCttbGYyRzhuL044T1k4?=
 =?utf-8?B?OGNtUGN4QStxeC9wdTFXb0d2NEVWYWY5ZHEvYW5vYzJuZnZsa2h4cFBwdlh4?=
 =?utf-8?B?WmxIUmlqc2dMa2I3cmRwN0dmeXF2aTBMdUVvOEszdkg5aEtmdFRmOWVVdDlr?=
 =?utf-8?B?SzM5SUppUGQzM0VEam9JaUMzSTJZVXZGN1R5Vm1PMkJzVmI1Yjg5Sm1hYm82?=
 =?utf-8?B?UzNJMWcvdGc0T2tlRUdVSkUxcmVwSUMwSkxiYktvUW1wNE9ERTcvNm9LVklJ?=
 =?utf-8?B?Zk4wWGxDZU5jbUlRY1NqdHA1dzd3cWo2clVYeWFSeHFPOGNZWGF0OUZtVi9T?=
 =?utf-8?B?WTUreWNvU01iQXh5MUxXVmpaYVB6Y1NGYkdkYXpqemdZZ0M1YmwydnBhRDFa?=
 =?utf-8?B?SjdxZE5LMjJvWkxwWXNoODFEMEJONnRhQThPRDJ4Z0pUVCtoN2pZZTB6T1gr?=
 =?utf-8?B?dHV4OENUeVNqTWFjWnl1UzBWQjZoN1VDZEFEY0loSzZPS1NFWmxLYW5Kb3h0?=
 =?utf-8?B?cDZmRVBkVmxBRWR1OWNsUEF5elQ3ak1oWFkrSXhPNnJFMVI4R2VoWitYNStB?=
 =?utf-8?B?R0tRV0IvNEVCckl2MGpodEFoSmt0NmJjcnkyWlVmclh2c0pUZnIrR000WGEr?=
 =?utf-8?B?VTZ4Y0E1S3dYSjg1TmkzYkw4eGt4c3U3YWM2RnJYZi9MR09Ud3RyZ2lSTFZS?=
 =?utf-8?B?ZFdmWEV0NDhqQzIxMEw5ZGdRU3NXTVJxbDBWcFB6eHZRRTR3L0lURlR1MFBx?=
 =?utf-8?B?MzdzT1cxbDB0UXNHOUhGRjBpZGxOenBCQ1VXdHBmM0VLZzdJOHI1NVVhMlpE?=
 =?utf-8?B?Snc3SGowdC8ybmd4N1BxQXhKUWJxQms4WXhQM1R6MVFhTFY0M25OQUJYeFVr?=
 =?utf-8?B?c0hRNDVFTC93T3pONDUyVFZIRjNmOVQ1VWpMVWt0eGpqVFB6QTdQMDZidi9t?=
 =?utf-8?B?b3VFc0hwL2JkOVZvOHJ3c1ZnMjU4YjNiWTFCVUhaTUo3dWVjcjVZcFBZdlZF?=
 =?utf-8?B?Q3lYNmUraFNHRUNJdzNXYU4rblF1Z1RONm1NMmx4cStuOUVuZ0FpTHo5RDk2?=
 =?utf-8?B?b0p4NEROTldwVXhXOTRpei9YNG9mdFJaa1V1bWR0ZEhwdlVOUHozeFlRbzZ1?=
 =?utf-8?B?eWJ1VDdIV0g3S3A3K2JRYk5LSlJUQTJObkJuY013ZGtKeVUyYUFyaFZlc3N4?=
 =?utf-8?B?T3lRdVBWelFDRVRnRzl6d0lIV0J4V1I2ZlQwR0xiMmQvVDhpTnU5NXVGZnc4?=
 =?utf-8?B?Qm5SWWFrM1FYaEp4THMzbXcySXFPQ1VEbTRtMzlhMjdYNUh3bFhnd1NtYVQ4?=
 =?utf-8?Q?6nu8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e11c47fe-07a5-4cce-b9be-08ddad6eb1ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2025 07:15:09.4828
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6lzcNOgeMB0Ue12aVKvwhlDwAwLoURyC2WDhPHA4W6RLq5ShxWHfBXAXodbZaUeGcbv7dOEwM81lWYIGHxGTfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF6483BC7EA

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBKdW5lIDEyLCAyMDI1
IDY6NDIgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4NCj4gQ2M6
IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgQW5kcmV3IENvb3Blcg0KPiA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT47IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEB2YXRl
cy50ZWNoPjsNCj4gT3J6ZWwsIE1pY2hhbCA8TWljaGFsLk9yemVsQGFtZC5jb20+OyBKdWxpZW4g
R3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgUm9nZXIgUGF1DQo+IE1vbm7DqSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyB4
ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djUgMDYvMThdIHhlbi94ODY6IGludHJvZHVjZSAiY3B1ZnJlcT1hbWQtY3BwYyIgeGVuDQo+IGNt
ZGxpbmUNCj4NCj4gT24gMjcuMDUuMjAyNSAxMDo0OCwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4g
VXNlcnMgbmVlZCB0byBzZXQgImNwdWZyZXE9YW1kLWNwcGMiIGluIHhlbiBjbWRsaW5lIHRvIGVu
YWJsZSBhbWQtY3BwYw0KPiA+IGRyaXZlciwgd2hpY2ggc2VsZWN0cyBBQ1BJIENvbGxhYm9yYXRp
dmUgUGVyZm9ybWFuY2UgYW5kIFBvd2VyIENvbnRyb2wNCj4gPiAoQ1BQQykgb24gc3VwcG9ydGVk
IEFNRCBoYXJkd2FyZSB0byBwcm92aWRlIGEgZmluZXIgZ3JhaW5lZCBmcmVxdWVuY3kNCj4gPiBj
b250cm9sIG1lY2hhbmlzbS4NCj4gPiBgdmVyYm9zZWAgb3B0aW9uIGNhbiBhbHNvIGJlIGluY2x1
ZGVkIHRvIHN1cHBvcnQgdmVyYm9zZSBwcmludC4NCj4gPg0KPiA+IFdoZW4gdXNlcnMgc2V0dGlu
ZyAiY3B1ZnJlcT1hbWQtY3BwYyIsIGEgbmV3IGFtZC1jcHBjIGRyaXZlciBzaGFsbCBiZQ0KPiA+
IHJlZ2lzdGVyZWQgYW5kIHVzZWQuIEFsbCBob29rcyBmb3IgYW1kLWNwcGMgZHJpdmVyIGFyZSB0
cmFuc2llbnRseQ0KPiA+IG1pc3NpbmcgYW5kIHdpbGwgYmUgaW1wbGVtZW50ZWQgaW4gdGhlIG9u
Z29pbmcgY29tbWl0cy4NCj4gPg0KPiA+IE5ldyB4ZW4tcG0gaW50ZXJuYWwgZmxhZyBYRU5fUFJP
Q0VTU09SX1BNX0NQUEMgaXMgaW50cm9kdWNlZCwgdG8gYmUNCj4gPiBkaWZmZXJlbnRpYXRlZCB3
aXRoIGxlZ2FjeSBYRU5fUFJPQ0VTU09SX1BNX1BYLiBXZSBkZWZpbmUNCj4gPiBYRU5fUFJPQ0VT
U09SX1BNX0NQUEMgMHgxMDAsIGFzIGl0IGlzIHRoZSBuZXh0IHZhbHVlIHRvIHVzZSBhZnRlcg0K
PiA+IDgtYml0cyB3aWRlIHB1YmxpYyB4ZW4tcG0gb3B0aW9ucy4gQWxsIHhlbi1wbSBmbGFnIGNo
ZWNraW5nIGludm9sdmluZw0KPiA+IFhFTl9QUk9DRVNTT1JfUE1fUFggc2hhbGwgYWxzbyBiZSB1
cGRhdGVkIHRvIGNvbnNpZGVyDQo+IFhFTl9QUk9DRVNTT1JfUE1fQ1BQQyBub3cuDQo+ID4NCj4g
PiBYZW4gaXMgbm90IGV4cGVjdGVkIHRvIHN1cHBvcnQgYm90aCBvciBtaXhlZCBtb2RlIChDUFBD
ICYgbGVnYWN5IFBTUywNCj4gPiBfUENULA0KPiA+IF9QUEMpIG9wZXJhdGlvbnMsIHNvIG9ubHkg
b25lIGNwdWZyZXEgZHJpdmVyIGdldHMgcmVnaXN0ZXJkLCBlaXRoZXINCj4gPiBhbWQtY3BwYyBv
ciBsZWdhY3kgUC1zdGF0ZXMgZHJpdmVyLCB3aGljaCBpcyByZWZsZWN0ZWQgYW5kIGFzc2VydGVk
IGJ5DQo+ID4gdGhlIGluY29tcGF0aWJsZSBmbGFncyBYRU5fUFJPQ0VTU09SX1BNX1BYIGFuZA0K
PiBYRU5fUFJPQ0VTU09SX1BNX0NQUEMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQZW5ueSBa
aGVuZyA8UGVubnkuWmhlbmdAYW1kLmNvbT4NCj4gPiAtLS0NCj4gPiB2MSAtPiB2MjoNCj4gPiAt
IE9iZXkgdG8gYWxwaGFiZXRpYyBzb3J0aW5nIGFuZCBhbHNvIHN0cmljdCBpdCB3aXRoIENPTkZJ
R19BTUQNCj4gPiAtIFJlbW92ZSB1bm5lY2Vzc2FyeSBlbXB0eSBjb21tZW50IGxpbmUNCj4gPiAt
IFVzZSBfX2luaXRjb25zdF9jZl9jbG9iYmVyIGZvciBwcmUtZmlsbGVkIHN0cnVjdHVyZSBjcHVm
cmVxX2RyaXZlcg0KPiA+IC0gTWFrZSBuZXcgc3dpdGNoLWNhc2UgY29kZSBhcHBseSB0byBIeWdv
biBDUFVzIHRvbw0KPiA+IC0gQ2hhbmdlIEVOT1NZUyB3aXRoIEVPUE5PVFNVUFANCj4gPiAtIEJs
YW5rcyBhcm91bmQgYmluYXJ5IG9wZXJhdG9yDQo+ID4gLSBDaGFuZ2UgYWxsIGFtZF8vLXBzdGF0
ZSBkZWZpbmVkIHZhbHVlcyB0byBhbWRfLy1jcHBjDQo+ID4gLS0tDQo+ID4gdjIgLT4gdjMNCj4g
PiAtIHJlZmFjdG9yIHRvbyBsb25nIGxpbmVzDQo+ID4gLSBNYWtlIHN1cmUgWEVOX1BST0NFU1NP
Ul9QTV9QWCBhbmQgWEVOX1BST0NFU1NPUl9QTV9DUFBDDQo+IGluY29tcGF0aWJsZQ0KPiA+IGZs
YWdzIGFmdGVyIGNwdWZyZXEgcmVnaXN0ZXIgcmVnaXN0cmFudGlvbg0KPiA+IC0tLQ0KPiA+IHYz
IC0+IHY0Og0KPiA+IC0gaW50cm9kdWNlIFhFTl9QUk9DRVNTT1JfUE1fQ1BQQyBpbiB4ZW4gaW50
ZXJuYWwgaGVhZGVyDQo+ID4gLSBjb21wbGVtZW50ICJIeWdvbiIgaW4gbG9nIG1lc3NhZ2UNCj4g
PiAtIHJlbW92ZSB1bm5lY2Vzc2FyeSBpZigpDQo+ID4gLSBncm93IGNwdWZyZXFfeGVuX29wdHNb
XSBhcnJheQ0KPiA+IC0tLQ0KPiA+IHY0IC0+IHY1Og0KPiA+IC0gcmVtb3ZlIFhFTl9QUk9DRVNT
T1JfUE1feHh4IGZsYWcgc2FuaXRpemF0aW9uIGZyb20gaW5kaXZpZHVhbCBkcml2ZXINCj4gPiAt
IHByZWZlciAhIG92ZXIgIj09IDAiIGluIHB1cmVseSBib29sZWFuIGNvbnRleHRzDQo+ID4gLSBC
bGFuayBsaW5lIGJldHdlZW4gbm9uLWZhbGwtdGhyb3VnaCBjYXNlIGJsb2Nrcw0KPiA+IC0gYWRk
IGJ1aWxkLXRpbWUgY2hlY2tpbmcgYmV0d2VlbiBpbnRlcm5hbCBhbmQgcHVibGljDQo+ID4gWEVO
X1BST0NFU1NPUl9QTV8qIHZhbHVlcw0KPiA+IC0gZGVmaW5lIFhFTl9QUk9DRVNTT1JfUE1fQ1BQ
QyB3aXRoIDB4MTAwLCBhcyBpdCBpcyB0aGUgbmV4dCB2YWx1ZSB0bw0KPiA+IHVzZSBhZnRlciBw
dWJsaWMgaW50ZXJmYWNlLCBhbmQgcHVibGljIG1hc2sgU0lGX1BNX01BU0sgaXMgOCBiaXRzIHdp
ZGUuDQo+ID4gLSBhcyBEb20wIHdpbGwgc2VuZCB0aGUgQ1BQQy9QeCBkYXRhIHdoZW5ldmVyIGl0
IGNvdWxkLCB0aGUgcmV0dXJuDQo+ID4gdmFsdWUgc2hhbGwgYmUgMCBpbnN0ZWFkIG9mIC1FTk9T
WVMvRU9QTk9UU1VQIHdoZW4gcGxhdGZvcm0gZG9lc24ndCByZXF1aXJlDQo+IHRoZXNlIGRhdGEu
DQo+ID4gLS0tDQo+ID4gIGRvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYyAgICAgICAg
IHwgIDcgKystDQo+ID4gIHhlbi9hcmNoL3g4Ni9hY3BpL2NwdWZyZXEvTWFrZWZpbGUgICAgICAg
IHwgIDEgKw0KPiA+ICB4ZW4vYXJjaC94ODYvYWNwaS9jcHVmcmVxL2FtZC1jcHBjLmMgICAgICB8
IDY4ICsrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIHhlbi9hcmNoL3g4Ni9hY3BpL2NwdWZy
ZXEvY3B1ZnJlcS5jICAgICAgIHwgNjMgKysrKysrKysrKysrKysrKysrKystDQo+ID4gIHhlbi9h
cmNoL3g4Ni9wbGF0Zm9ybV9oeXBlcmNhbGwuYyAgICAgICAgIHwgMTMgKysrKy0NCj4gPiAgeGVu
L2RyaXZlcnMvYWNwaS9wbXN0YXQuYyAgICAgICAgICAgICAgICAgfCAgMyArLQ0KPiA+ICB4ZW4v
ZHJpdmVycy9jcHVmcmVxL2NwdWZyZXEuYyAgICAgICAgICAgICB8IDE4ICsrKysrLQ0KPiA+ICB4
ZW4vaW5jbHVkZS9hY3BpL2NwdWZyZXEvY3B1ZnJlcS5oICAgICAgICB8ICA2ICstDQo+ID4gIHhl
bi9pbmNsdWRlL2FjcGkvY3B1ZnJlcS9wcm9jZXNzb3JfcGVyZi5oIHwgIDMgKw0KPiA+ICB4ZW4v
aW5jbHVkZS9wdWJsaWMvc3lzY3RsLmggICAgICAgICAgICAgICB8ICAxICsNCj4gPiAgMTAgZmls
ZXMgY2hhbmdlZCwgMTc1IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pICBjcmVhdGUgbW9k
ZQ0KPiA+IDEwMDY0NCB4ZW4vYXJjaC94ODYvYWNwaS9jcHVmcmVxL2FtZC1jcHBjLmMNCj4NCj4g
PiBAQCAtMTU3LDcgKzE2Miw2MyBAQCBzdGF0aWMgaW50IF9faW5pdCBjZl9jaGVjaw0KPiA+IGNw
dWZyZXFfZHJpdmVyX2luaXQodm9pZCkNCj4gPg0KPiA+ICAgICAgICAgIGNhc2UgWDg2X1ZFTkRP
Ul9BTUQ6DQo+ID4gICAgICAgICAgY2FzZSBYODZfVkVORE9SX0hZR09OOg0KPiA+IC0gICAgICAg
ICAgICByZXQgPSBJU19FTkFCTEVEKENPTkZJR19BTUQpID8gcG93ZXJub3dfcmVnaXN0ZXJfZHJp
dmVyKCkgOiAtDQo+IEVOT0RFVjsNCj4gPiArICAgICAgICAgICAgdW5zaWduZWQgaW50IGk7DQo+
ID4gKw0KPiA+ICsgICAgICAgICAgICBpZiAoICFJU19FTkFCTEVEKENPTkZJR19BTUQpICkNCj4g
PiArICAgICAgICAgICAgew0KPiA+ICsgICAgICAgICAgICAgICAgcmV0ID0gLUVOT0RFVjsNCj4g
PiArICAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+ICsgICAgICAgICAgICB9DQo+ID4gKyAgICAg
ICAgICAgIHJldCA9IC1FTk9FTlQ7DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICBmb3IgKCBpID0g
MDsgaSA8IGNwdWZyZXFfeGVuX2NudDsgaSsrICkNCj4gPiArICAgICAgICAgICAgew0KPiA+ICsg
ICAgICAgICAgICAgICAgc3dpdGNoICggY3B1ZnJlcV94ZW5fb3B0c1tpXSApDQo+ID4gKyAgICAg
ICAgICAgICAgICB7DQo+ID4gKyAgICAgICAgICAgICAgICBjYXNlIENQVUZSRVFfeGVuOg0KPiA+
ICsgICAgICAgICAgICAgICAgICAgIHJldCA9IHBvd2Vybm93X3JlZ2lzdGVyX2RyaXZlcigpOw0K
PiA+ICsgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+ICsNCj4gPiArICAgICAgICAgICAg
ICAgIGNhc2UgQ1BVRlJFUV9hbWRfY3BwYzoNCj4gPiArICAgICAgICAgICAgICAgICAgICByZXQg
PSBhbWRfY3BwY19yZWdpc3Rlcl9kcml2ZXIoKTsNCj4gPiArICAgICAgICAgICAgICAgICAgICBi
cmVhazsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgICBjYXNlIENQVUZSRVFfbm9uZToNCj4g
PiArICAgICAgICAgICAgICAgICAgICByZXQgPSAwOw0KPiA+ICsgICAgICAgICAgICAgICAgICAg
IGJyZWFrOw0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAgIGRlZmF1bHQ6DQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19XQVJOSU5HDQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICJVbnN1cHBvcnRlZCBjcHVmcmVxIGRyaXZlciBmb3IgdmVuZG9yIEFNRCBv
ciBIeWdvblxuIik7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQo+ID4gKyAgICAg
ICAgICAgICAgICB9DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICAgaWYgKCByZXQgIT0gLUVO
T0RFViApDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQo+DQo+IFRoaXMsIEkgdGhp
bmssIG5lZWRzIHNvbWUgY29tbWVudGluZy4gSXQncyBub3QgcXVpdGUgY2xlYXIgd2h5IHdlIHNo
b3VsZG4ndCB0cnkgdGhlDQo+IG5leHQgb3B0aW9uIGlmIHJlZ2lzdHJhdGlvbiBmYWlsZWQgd2l0
aCBvdGhlciB0aGFuIC1FTk9ERVYuDQo+DQoNCkkgZm9sbG93ZWQgdGhlIG9yaWdpbmFsIGxvZ2lj
Lg0KTm93LCBJJ20gdHJ5aW5nIHRvIHVuZGVyc3RhbmQgdGhlIHJlYXNvbi4gSSByZWFkIHRoZSBy
ZWxhdGVkIGNvZGUsIHRoZXJlIGFyZSB0d28gY29kZSBwYXRoIGVycm9yaW5nIG91dCBvdGhlciB0
aGFuIC1FTk9ERVYNCkluIGNwdWZyZXFfcmVnaXN0ZXJfZHJpdmVyKCksIGVpdGhlciB0aGUgZHJp
dmVyIGl0c2VsZiBpcyBicm9rZW4sIGxpa2UgbWlzc2luZyBtYW5kYXRvcnkgaG9va3MsIGV0Yywg
eWV0IGluIHdoaWNoIGNhc2UsIElNTyB3ZSBzaGFsbCB0cnkgdGhlIGZhbGxiYWNrIG9wdGlvbiwN
Cm9yIHJlcGVhdGVkIHJlZ2lzdHJhdGlvbiwgVEJILCB3aGljaCBzZWVtcyB1bmxpa2VseSB0byBt
ZS4gY3B1ZnJlcV9kcml2ZXJfaW5pdCgpIGlzIGEgcHJlc21wIGNhbGwsIHNvIHJlcGVhdGVkIHJl
Z2lzdHJhdGlvbiBkb2Vzbid0IGNvbWUgZnJvbSByYWNpbmcuDQpUaGVuIGlmIHdlIHN1Y2Nlc3Nm
dWxseSByZWdpc3RlcmVkIGEgZHJpdmVyLCB3ZSB3aWxsIGltbWVkaWF0ZWx5IGV4aXQgdGhlIGxv
b3AuIEhvdyBjb21lIHdlIHdpbGwgcmVnaXN0ZXIgdHdpY2U/DQpPciBhbSBJIG1pc3Npbmcgc29t
ZXRoaW5nIGZvciB0aGlzIGVycm9yIHBhdGg6DQpgYGANCiAgICAgICAgaWYgKCBjcHVmcmVxX2Ry
aXZlci5pbml0ICkNCiAgICAgICAgICAgICAgICByZXR1cm4gLUVCVVNZOw0KYGBgDQoNCj4NCj4g
PiArICAgICAgICAgICAgICAgICAgICBicmVhazsNCj4gPiArICAgICAgICAgICAgICAgIH0NCj4g
PiArICAgICAgICAgICAgfQ0KPg0KPiBXaHkgZG9lcyB0aGlzIHBydW5pbmcgb2YgeGVuX3Byb2Nl
c3Nvcl9wbWJpdHMgc2l0IGluIHRoZSBBTUQtb25seSBjb2RlIHBhdGg/DQo+IElpcmMgZWFybGll
ciBvbiB5b3UgaGFkIGl0IGluIHRoZSAqX3JlZ2lzdGVyX2RyaXZlcigpIHRoZW1zZWx2ZXMsIGFu
ZCBteSByZXF1ZXN0IHdhcw0KPiB0byBwdXQgaXQgaW4gYSBjZW50cmFsLCBnZW5lcmljIHBsYWNl
LiBJdCdzIGNlbnRyYWwgbm93LCBidXQgbm90IGdlbmVyaWMgKGFuZCB0aGlzIHdheSBpdA0KPiBj
b3VsZCBhcyB3ZWxsIGhhdmUgcmVtYWluZWQgaW4gKl9yZWdpc3Rlcl9kcml2ZXIoKSkuDQo+DQoN
ClRydWUsIGJlZm9yZSwgSSB3YXMgd3JvbmdseSBhc3N1bWVkIHRoYXQgWEVOX1BST0NFU1NPUl9Q
TV9DUFBDIGNvdWxkIG9ubHkgYmUgaW5pdGlhbGl6ZWQgaW4gQU1ELg0KV2UgY291bGQgYWxzbyBw
cm92aWRlICJjcHVmcmVxPWFtZC1jcHBjIiBpbiBJTlRFTCBwbGF0Zm9ybSwgeWV0IHVuZGVyIHdo
aWNoIHNjZW5hcmlvLCB3ZSBzaGFsbCBzZXQgcmV0IHdpdGggLUVOT0RFViBlcnJubyAocmlnaHQg
bm93IGlzIC1FTk9FTlQsIG5lZWQgdG8gZml4KSB0byBrZWVwIGxvb3BpbmcgYW5kIHRyeSB0aGUg
bmV4dCBvcHRpb24uLi4NCknigJlsbCBtb3ZlIGl0IG91dCBvZiB0aGUgQU1ELW9ubHkgcGF0Y2gs
IGFuZCBwdXQgaXQgYWZ0ZXIgdGhlIHdob2xlIHN3aXRjaC1jYXNlDQoNCj4NCj4gSmFuDQo=

