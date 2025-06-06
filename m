Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DD0ACFCAC
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 08:30:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007893.1387062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNQaR-0001Xz-RO; Fri, 06 Jun 2025 06:29:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007893.1387062; Fri, 06 Jun 2025 06:29:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNQaR-0001WA-OW; Fri, 06 Jun 2025 06:29:55 +0000
Received: by outflank-mailman (input) for mailman id 1007893;
 Fri, 06 Jun 2025 06:29:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dg/F=YV=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uNQaP-0001W4-Ma
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 06:29:53 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20630.outbound.protection.outlook.com
 [2a01:111:f403:2009::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6c4658a-429f-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 08:29:52 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by MN0PR12MB6367.namprd12.prod.outlook.com (2603:10b6:208:3d3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.37; Fri, 6 Jun
 2025 06:29:47 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8792.034; Fri, 6 Jun 2025
 06:29:46 +0000
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
X-Inumbo-ID: a6c4658a-429f-11f0-a301-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xIG+sD265Ce9bwS9m0y9/7Rl+DWEc9yuqeKJegAWpg3MCdNYnYLX/P4IxFkEzOVv1hURz0PQx1dX09DiRn23yR6tYAYM+smZLlzAMemqzKCPTSBMbv7NR+tMmMAr0YaxzkpSOixeI+DjyfbP2C2lzqjMNonnmNEhXzaRrDHi0NvIDCyaI7ZU3SPwfT/6fMcThUp4cr5POYgg/LzmPHOr8wITu+cfiHexO02GxqSN24wre92JI3rTX/g/9d23ImhVQxg+CuN0CCnj3VF9Mh2qHWF9slb6rruLYfwbMxOIHuxZeIICeTymL3mUi0c0KBaJDi7KeqzlZxk8w9Fy03L+gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ODpApV8++fZhni54UUkYqHUI2FmV1s3GyGW/3+zx1s=;
 b=pSsvbbrHDSJfw0NZ3XXep9TgkiePkhklQ5UB3dIwmVh2Yp9nqhS8+0TP4qCFnuW53MBBw0VSXrCvVzzE4ieH0oUvyB6egDI009HUPhJ9GWYRfxLEp6/eUMPSSZVGrMVFBNm3U5kjXTUlEHXGTXtzozyIgBzsLEVfSpVMpASFxewsO+OyqGBd43FbSNvxYjrF6j3PjSMwhLITKhSvov/r8zPZiPObyDivw4bJKTSbL90eeSildipoTZl9nYQeVkwMH6i69IkP/2PPw8xBZQCeX9wsFC4XTiok++kZLkL5lU14A6pL6Yyf4fbivOSehvr9Z7Koyoz8NZFZ4xg9M1jHBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ODpApV8++fZhni54UUkYqHUI2FmV1s3GyGW/3+zx1s=;
 b=eHPTA9930s7nzx5fOMY7vGRmz/QrpvLGGDuRTbP9uo3vhfHVG46I95GGNfBOlA3SA7852uvuM6D9Vnc1FFumWXQPg4Z3Wcrk29jxC2XnGL2qptO8Adl7qkWe8FKP7b8KAQNm3fU4m5iTje6xBjQuv07IJrvFkQltHHRzeWTR+Hs=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony
 PERARD <anthony.perard@vates.tech>, "Orzel, Michal" <Michal.Orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v5 04/10] vpci: Refactor REGISTER_VPCI_INIT
Thread-Topic: [PATCH v5 04/10] vpci: Refactor REGISTER_VPCI_INIT
Thread-Index: AQHbziMOHCuaHG697kCTYWoBETQpzrP0lKSAgAGsWwA=
Date: Fri, 6 Jun 2025 06:29:46 +0000
Message-ID:
 <BL1PR12MB58497C341C79658B7221A67FE76EA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250526094559.140423-1-Jiqian.Chen@amd.com>
 <20250526094559.140423-5-Jiqian.Chen@amd.com>
 <aEGSp-LKerGb-wIW@macbook.local>
In-Reply-To: <aEGSp-LKerGb-wIW@macbook.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8792.033)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|MN0PR12MB6367:EE_
x-ms-office365-filtering-correlation-id: 2beb7f04-e992-4239-51f7-08dda4c3880c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ckMxc2Q5S2RBa25GaW8rQUtDTDVpR1Fqd0xCdEg4bUNVVEIyYmdSZ1FTakNy?=
 =?utf-8?B?cVdYYU9ibHNoUkF2bkNNUGpvRmJ1WjVzakhmUjN6ekcwa211SmYxSVdRNW9P?=
 =?utf-8?B?Wk5iVU9SQWQ5WnE1TTdWTW1mL2g3R3p3eWVGeE55b1BhSG9WMHdyQUhVZkUy?=
 =?utf-8?B?cGJJVHhOZHU5VTFuTWFhblBNRldHRCtWaHVSUTRDeGNBOVM1NkN2RnQvNEht?=
 =?utf-8?B?aDh1TW9rWEhVZHlTS3RQZGZBQ0tuY0t0aDArSlpGdkRCdHlGVnRKcmIxQlB0?=
 =?utf-8?B?bjRUQWo4UnZZMzV5amdlR0o5bk5CbldrS3ZuOVlBandPNWthQXNMSTR6NC9o?=
 =?utf-8?B?cGhJWHhiMUJLdTJzUmN6Z2xISU05b1ltTGk4Y3gzcERtSUdsOFd1SmdibmRT?=
 =?utf-8?B?Q21SaHhVaGFpUHk0LzJIOUF1cXRCdGs0QmdDTGJDUGEvZkcvTkZ5ekh6WHI1?=
 =?utf-8?B?SnlwTEhWTFVTbnpwTEtoWHZPSkw3dDFBQVluR1NnTXdwZnl5cnBHR0RqRUVh?=
 =?utf-8?B?ak9vNnBzTTBTZld6R0d2eFg4QXBzaDFDaW9YQTNhNFQyUEkvUzBZK3pjcndm?=
 =?utf-8?B?b1lyUkJtWDFwMUlOeTZXT05CeWtGQWZRcE90RHJHY2RvN2tOd2NyNjNIRjRI?=
 =?utf-8?B?Nm1vR2dMZXc3ZFVabHhqVkMrZkFzRXF5THBjd21RVmQ1VXFnaFo2c1JnMWI5?=
 =?utf-8?B?NFE1UVRBMmdUWHZ3Snk1bDdwc3MrTXFrWHVZTkdML0Zmemo4clN4Qmd2MXJE?=
 =?utf-8?B?OWxjRHpmb09nWG9FclM0YThCbXlJbzFTWWVaOEZrS3FiVWl2NGNyMXV3M3Nu?=
 =?utf-8?B?TUh5OCt1ZXBWQUo4MXJTSEI2WmMrbWdkUjZ0azQ1dGsybFp6bWdGZzVIVTRo?=
 =?utf-8?B?aG5oWm9YNmhuYlhsTFZlQ2JCbHpXOUNCM2s4anZwdldkQ3dvZzJIc1Jwd1J4?=
 =?utf-8?B?T2ZwSHd5V3cyNjJkYllSaHVIU1liTldpTkdRNEQ0MHlFKzJyKyt1V2tGaHVR?=
 =?utf-8?B?RHk5WDR1U0cyL21TemVDVG5HYU1ORUl6RlRMWnhtOTcydlhTVjJnTURDQVZ5?=
 =?utf-8?B?UitsWkhEcEcrYnUrSHkvVjVQaWNZemhReVNKditRRkJ3cVFXNTRDSEdscWVN?=
 =?utf-8?B?VU9GZVkrN3pKK0hwdnBBOWNiWGVOR3dLWStjd0UzcmVOa1FadGhWU1czS0kw?=
 =?utf-8?B?TjcyOTJFaldWc1AvMXhvSFNCdlhla1R1RUlwZGlWaFpMcXdVdGc4bkI2amFH?=
 =?utf-8?B?cmRaNGEwbloxSTlXeFM3V1diTndQZUQ3LzF0Wk00WERMb05UeXV2b2hGcktD?=
 =?utf-8?B?bmhDZXpkd3FTWERBTWRaZDkrdys5ZFNGWmVqWDU0RkdDcE1ueGZOYWpPOEdK?=
 =?utf-8?B?dnl5dmFaV3FrWDRBaFlqUjFMWk1oamtuM3RkdWl2bUJrd2pnWXRYMXI1dW8v?=
 =?utf-8?B?dzQ3RFlhS3RIbWUwZTFvSmNjaXZqMmkwcXZHSnNEUTVEVHkrWVpIQkpjcWFC?=
 =?utf-8?B?LzF0TjJMNnMxdENxZ3RZTzVXd0ZMQlNWdXp2NU5JU0lUR2VIeDhUZHNaeWxU?=
 =?utf-8?B?My9Va01kZFdyT2VVMEh3a0M4RXkxcUVFYVlnb3pmZjRVYndJcWtKbWNhZzk3?=
 =?utf-8?B?SkdxYWRhWUJTOG5DaEVEWm96Q3A4OVZ3UlVtV0RyRlRCQkp1Y0pZc0hLSGxj?=
 =?utf-8?B?V0NtYy9rajRFSG9aZUkvV3Vra1pmd05tNEpwam5uZXVRUUx3bDIxV3hoTm05?=
 =?utf-8?B?THlSZWVxbGJWcjkyUnVWWURvSEpoVUNGMURpNDdWYlN2SUtMcjZPVmJBYzha?=
 =?utf-8?B?dGVwdExvS01IZndiYkFCdlRPbG5PN3hqa09sVjRHUkx1cmRaRWtOMG9WYUpK?=
 =?utf-8?B?WXlmK0g0Mk9MbG9HMjdYU3lHb0pwMlZZRG1wdGhUVkRIN3V0UDBSMkx2WWQx?=
 =?utf-8?B?TW4yZGNmTzY2ZllKRE5sZlY3eC90TmMwQ01qQ0dvRkZaUE9IL0RwYTJjL2xU?=
 =?utf-8?Q?JwmeK6jpctdnKvv8C39mh3imnVriso=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R241VFNnN1ZscEluclU4SlF0NDRuSmdBaHk2NlphVEF1WUM5Y3o5RWFIZmxk?=
 =?utf-8?B?ZFZpc3IydlhpYm5uaDJkdXZKajNLRVIxK1FsbFJqelg1Q1VmWE9QUEs3OGxF?=
 =?utf-8?B?SzBCUWpZb3VRYm1nSUIxM3VQZ1MrOGpIMjJlWHNUSmxEdG1NMzhwZEE1RHVO?=
 =?utf-8?B?TnZsQm9VQjBYeXZqYUVqK3lZUGZaLzVrWm5MMDVZby9MU3FWcHpSaHNseWpQ?=
 =?utf-8?B?Ylh6NVQyN2VTanF4UURoNzB6MmhKRC9tdzUza2l3cjV5OXRmUlBDckdmZkVn?=
 =?utf-8?B?bS9DemVBMzJoWGpXNGRIVzZhMWkxcDlWempDN1JoTUpSNFVHbCtkYVUzV2ZV?=
 =?utf-8?B?UFhXOVVZTzBreGxrdUFqQzRhc0FSMC9ndmhQalNXbGhZRTAvYjBBUUtFaFh1?=
 =?utf-8?B?dkFPK1gzRm53U0dZUzI3UkhxODJqb0dIQlNwMGxrdFkxS3FMOHBtVVAySXE1?=
 =?utf-8?B?OFpydTlWMjlhdnVwbmZ2bTdVZnVjMzVTZWRScmM3ZFB1QWU5UjhoU1dPd2hO?=
 =?utf-8?B?R0tXeGd6UlV1T0dJcFZVQytGejhNNzEzVUdoNERKVmNHL3pkQXJ6SWJvVzlX?=
 =?utf-8?B?ZnFyVm1uYTBlUTBENmd5alZhcU90cTRjYW10SWpmc3d4cEl0bU5TM000Sng2?=
 =?utf-8?B?cHR1Wk5JMmMrOHc5dGNJRXB1TGNHYU5TaW1EblFFMjJGVVdIR1ZjakIvTEtX?=
 =?utf-8?B?bUV3cnN4bWltU21LbGF4RW4zNGxuZHoxbWlZbEMxMlZuTnlhQ0ZqT3N0a0p0?=
 =?utf-8?B?Z2Y0V2tGTEp6eXdMMmEwNlByOVllUHh2RU95Z2U1cXc3amJlZVlQeXdyNGFk?=
 =?utf-8?B?NnlZZ3ZVNnVsbGdISVJ2QTY0eEJqS3Y2M1ZvQWs5enkrNjlzUjhCMjZYNXlT?=
 =?utf-8?B?dmR0NGM1QmxZRVpmZGhOUzlDMk9OK0xPcmM3WEVMZ21MN0o0L1B4cDc1VlJJ?=
 =?utf-8?B?aVBUYmxqdXBMVDllQXZKQVNRcm1ORmpORHpoVUMyY2ZnVjFXazhUcngxeHFH?=
 =?utf-8?B?Ny8rVExlZXUvRWc1dmxJbTJvZzhkaWxWMDE5OC9IUE1JM2JXWmh0ZWZwMHZk?=
 =?utf-8?B?NUpPcytzUERIUjRncEVrOFoxRHovRUVaZ1VieXoxbjducFFQcXAzbXNvdUNh?=
 =?utf-8?B?eW15VHZ6RzRYRTRpVlVqd0JKdmdwYnRtZ3BRY1UzK3FpOHZNZnBMUGE2UWY3?=
 =?utf-8?B?NFpRaUhmVlVQNVlVVFdYUkhvOWYwWDJhQzVHWkxTUGIxY2FTNmhib1BQRk9E?=
 =?utf-8?B?YUgvcGlLZ0hudC9BMGtqOXlQWTQ0c1NUc1BNZjY0amdkTHdLNlByeVh5Q3JW?=
 =?utf-8?B?ZmNuU2xVYk5hTEdJdVhrdlJvTDQxbS84OHFWaHVTLzJ0cGxZQ1d4ejRyRUV1?=
 =?utf-8?B?cGFqc0pCandhVVFaN1gxMkJtTDZYQld1S01JenUwR1hIRzVyajF4ci9CSlhQ?=
 =?utf-8?B?M2I5U0dqWVZrT0xzbHo2S0d2WTA4aEFRQlRTUjlzZlN2MkV1ZG9pL3lGMmZZ?=
 =?utf-8?B?cFpWemFhL1BGUG9lSGE5ejFuWE9VZ1ZzQmpNQWxOK1BjNmRtS2RmT1lwMGhG?=
 =?utf-8?B?cTdsK0ZLc1lLaHlSZlZxbldqZ1hDQUVNU1FmdG0rQ1JTdVF2UVowQ2RwaTdo?=
 =?utf-8?B?aWplM2RmNGNFOGYwVnpzTGlPSE9LbytnOHZ5MnRZWXJ1VktnWVQyckticFZK?=
 =?utf-8?B?VGdkZ1lySzVjMkgybnN2SEFBMFY5OVJ3YS9teTE4cSt2UTdxdjhGMkRDUmNQ?=
 =?utf-8?B?YXNrSzBPV28xNkNHd2tIRHVBeFR5WlBUeks0U0JheTY3bmpBcFZQRWpKOW14?=
 =?utf-8?B?WFYwbk5LTVd2cVM3NGdTYlhyN1loRXdUdFNCQ0xheklUSEg0UnNlY0JJTDZl?=
 =?utf-8?B?blpYaGNYQlRjcENMbm9jZ0I0dlZ0VXlwaVl3MFRlTnN1SkMzc2o4UWV1Yzhj?=
 =?utf-8?B?My9lejhhR2pac0xoVzJveDFtaFdJR2FrQ05SUWxxK3ArVkJqTTFnYTJ4RGZq?=
 =?utf-8?B?V0JMMm43MkRnSkRvTkFsbDkxc2NiMlorMmdVMmVoWkVSVXQ0azljNmdsTzBC?=
 =?utf-8?B?bEFpK0pFYm5SYzJUZzUwYkJPNmttRTFUSWl3ejczSXV0ZC9KU2EwdktQOS80?=
 =?utf-8?Q?r6cg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2504BE9D796D954AB58D55EBEFD12728@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2beb7f04-e992-4239-51f7-08dda4c3880c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2025 06:29:46.4310
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LU+OfErI7QsFpnGcTo+jhVe75TKuIfLFpUTBzwXqcVyhJVjEQuorhEy63innDvv111RbEm8doIy1cUEhqXcFhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6367

T24gMjAyNS82LzUgMjA6NTAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIE1vbiwgTWF5
IDI2LCAyMDI1IGF0IDA1OjQ1OjUzUE0gKzA4MDAsIEppcWlhbiBDaGVuIHdyb3RlOiANCj4+ICsg
IH07IFwNCj4+ICsgIHN0YXRpYyB2cGNpX2NhcGFiaWxpdHlfdCAqY29uc3QgZmluaXQjI19lbnRy
eSAgXA0KPj4gKyAgICAgICAgICAgICAgIF9fdXNlZF9zZWN0aW9uKCIuZGF0YS52cGNpIikgPSAm
ZmluaXQjI190DQo+IA0KPiBJTU8gdGhpcyBzaG91bGQgYmV0dGVyIHVzZSAucm9kYXRhIGluc3Rl
YWQgb2YgLmRhdGEuIA0KSXMgYmVsb3cgY2hhbmdlIGNvcnJlY3Q/DQoNCisgICAgc3RhdGljIGNv
bnN0IHZwY2lfY2FwYWJpbGl0eV90ICpjb25zdCBmaW5pdCMjX2VudHJ5ICBcDQorICAgICAgICBf
X3VzZWRfc2VjdGlvbigiLnJvZGF0YSIpID0gJmZpbml0IyNfdA0KDQo+IE5vdCB0aGF0IGl0IG1h
dHRlcnMgbXVjaCBpbiBwcmFjdGljZSwgYXMgd2UgcGxhY2UgaXQgaW4gLnJvZGF0YSBhbnl3YXku
ICBOb3RlDQo+IGhvd2V2ZXIgeW91IHdpbGwgaGF2ZSB0byBtb3ZlIHRoZSBwbGFjZW1lbnQgb2Yg
dGhlIFZQQ0lfQVJSQVkgaW4gdGhlDQo+IGxpbmtlciBzY3JpcHQgYWhlYWQgb2YgKigucm9kYXRh
LiopLCBvdGhlcndpc2UgdGhhdCBzZWN0aW9uIG1hdGNoIHdpbGwNCj4gY29uc3VtZSB0aGUgdlBD
SSBkYXRhLg0KSSBhbSBzb3JyeSwgaG93IHRvIG1vdmUgaXQgYWhlYWQgb2YgKigucm9kYXRhLiop
ID8NCklzIGJlbG93IGNoYW5nZSBjb3JyZWN0Pw0KDQpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUv
eGVuL3hlbi5sZHMuaCBiL3hlbi9pbmNsdWRlL3hlbi94ZW4ubGRzLmgNCmluZGV4IDc5M2QwZTEx
NDUwYy4uMzgxNzY0MjEzNWFhIDEwMDY0NA0KLS0tIGEveGVuL2luY2x1ZGUveGVuL3hlbi5sZHMu
aA0KKysrIGIveGVuL2luY2x1ZGUveGVuL3hlbi5sZHMuaA0KQEAgLTE4OCw3ICsxODgsNyBAQA0K
ICNkZWZpbmUgVlBDSV9BUlJBWSAgICAgICAgICAgICAgIFwNCiAgICAgICAgLiA9IEFMSUdOKFBP
SU5URVJfQUxJR04pOyBcDQogICAgICAgIF9fc3RhcnRfdnBjaV9hcnJheSA9IC47ICAgXA0KLSAg
ICAgICAqKFNPUlQoLmRhdGEudnBjaS4qKSkgICAgIFwNCisgICAgICAgKigucm9kYXRhKSAgICAg
ICAgICAgICBcDQogICAgICAgIF9fZW5kX3ZwY2lfYXJyYXkgPSAuOw0KDQo+IA0KPj4gKw0KPj4g
KyNkZWZpbmUgUkVHSVNURVJfVlBDSV9DQVAoY2FwLCBmaW5pdCwgZmNsZWFuKSBcDQo+PiArICAg
ICAgICAgICAgICAgIFJFR0lTVEVSX1BDSV9DQVBBQklMSVRZKGNhcCwgZmluaXQsIGZjbGVhbiwg
ZmFsc2UpDQo+PiArI2RlZmluZSBSRUdJU1RFUl9WUENJX0VYVENBUChjYXAsIGZpbml0LCBmY2xl
YW4pIFwNCj4+ICsgICAgICAgICAgICAgICAgUkVHSVNURVJfUENJX0NBUEFCSUxJVFkoY2FwLCBm
aW5pdCwgZmNsZWFuLCB0cnVlKQ0KPiANCj4gU2luY2UgeW91IGFyZSBtb2RpZnlpbmcgdGhvc2Us
IGNhbiB1c2UgNCBzcGFjZXMgYXMgaW5kZW50YXRpb24/DQo+IFRoZXJlJ3Mgbm8gbmVlZCB0byBo
YXZlIHN1Y2ggcGFkZGluZy4NCj4gDQo+IFRoYW5rcywgUm9nZXIuDQoNCi0tIA0KQmVzdCByZWdh
cmRzLA0KSmlxaWFuIENoZW4uDQo=

