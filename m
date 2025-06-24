Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 126D7AE5ED0
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 10:12:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023308.1399267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTyli-00032W-EH; Tue, 24 Jun 2025 08:12:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023308.1399267; Tue, 24 Jun 2025 08:12:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTyli-00030O-An; Tue, 24 Jun 2025 08:12:38 +0000
Received: by outflank-mailman (input) for mailman id 1023308;
 Tue, 24 Jun 2025 08:12:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vj6t=ZH=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uTylg-00030I-98
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 08:12:36 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20614.outbound.protection.outlook.com
 [2a01:111:f403:2417::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fbc4ec8e-50d2-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 10:12:34 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by BY5PR12MB4193.namprd12.prod.outlook.com (2603:10b6:a03:20c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Tue, 24 Jun
 2025 08:12:31 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8835.027; Tue, 24 Jun 2025
 08:12:30 +0000
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
X-Inumbo-ID: fbc4ec8e-50d2-11f0-a30f-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sH6I59s/sqPVCBHaHO/NCUswAG8SIV5IH9YAlQcgh+fpVo1hhBA8SlESuxGYjtSGs4HMxlvNT0ntjY46Cm3Jn+4ltIh5TkBWI/PGY5mxfXBBJAAXzQR3qvd6JxsIbX0jbSo6vttt+PE738Ne8SXz8T/drr+lypi/t0QmgrV7JcBwY2DGhr4g1UeewKYW4evMJPy/SlLa46FQaYGDqVDTxMasY4277usE5sKYZ6ppLZCfdMPsBDEO80R9k3E023+oYhsxiNpPuhraRqzFRtJlC6EM8wNuAyKmhAkME4SpBeVHJixFCNqrwoKbYROpHNNQtQdwMQMwT8jqyVzg+meLtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7aLn9ZAOzLv4vbwM704WJljDc9fj3fe48laNKV/vIk0=;
 b=CgY5ULCO8AkKV5BGj1MeEd5LZVGI3toWjZeDPq8kriICMIC2d23aeY+4RvGmKurxb6X4QfHoLvJ2d40QHcLtliwQOYUOXDDqH2/rPJ+WhgXyE2e0renMfqn1Tw1Zabf4fFjPaGpSm3kJLKKjVLUL7p7JtWZlIvCOfV+YcfpCoB972XDILe9zR7rWgBNzdcTXJ17ObYD9zzXpfEYJGYmVJM6UrxTF/iNXQtx2LK/19uWAyHPKJaroBdpJK8fuNUjswTiYbr9Nweiew2cdVxXsJEkaWfAkGpaZeaC4cIH/bc6Bprx3TpEyJTa5Vhc3bN2XiO6Uvvfk939yNnHuGq9Ijg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7aLn9ZAOzLv4vbwM704WJljDc9fj3fe48laNKV/vIk0=;
 b=lJcUAPDFaIvl8GvMQRUYZuLHb/o4O0Dhj6d0ArkhIlUebha4Jm6eSfGj6UfNzmuUnIq3qWkgdSVVjf5/mVaovjSxEZplRUWqmyUDF1U+6MS/PapGz/RcyqGTXm7yHysjo1d1dy7UqwVTl2ys3F073hGuMUZEsM18noYHALbg+6U=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony
 PERARD <anthony.perard@vates.tech>, "Orzel, Michal" <Michal.Orzel@amd.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v6 2/8] vpci: Refactor REGISTER_VPCI_INIT
Thread-Topic: [PATCH v6 2/8] vpci: Refactor REGISTER_VPCI_INIT
Thread-Index: AQHb23yakGdVC9XxvEWnYcnp8zrTt7QJBRKAgAGLVICAARN8gIAG6YaA
Date: Tue, 24 Jun 2025 08:12:30 +0000
Message-ID:
 <BL1PR12MB5849CE947DEEBB7B7F6C70D3E778A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
 <20250612092942.1450344-3-Jiqian.Chen@amd.com>
 <1634c18d-e54e-4105-8b30-6f3085bace22@suse.com>
 <BL1PR12MB5849F7A08629FA6E2555B05FE77DA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <23293ec5-7466-400c-87a4-1482577b91fa@suse.com>
In-Reply-To: <23293ec5-7466-400c-87a4-1482577b91fa@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8835.025)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|BY5PR12MB4193:EE_
x-ms-office365-filtering-correlation-id: 9ddacff2-c6f3-451b-0969-08ddb2f6ddb3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RGZUTFJickUyNHlwTngwTFJ3UHhaWjdncXNhRnRKMkpERmx6MVF6QVFqOUph?=
 =?utf-8?B?K2docmpXdFdVc1M3QnZENTdsb3hCVk9SMzFMRVFMWVhUYjArcVVjZ01FaUw3?=
 =?utf-8?B?WEFNSXZHd1c1bkN1bkh3YjZGNVJjM3hHSHlTWGMwM25NQkRESnViYkttVENC?=
 =?utf-8?B?OVh6ZUFYRGtKalp5RHBYRnhMc1dwU3VEZ2JKYnN1QnFiY0RvbC9iYS9tWmFn?=
 =?utf-8?B?SVJKTzluTHMycGxiK1ZZcFRhM3B6TzZhcVlVd2JRRFlHNG1IVUFZc1RzWGNz?=
 =?utf-8?B?TUlCSHhya0d6d3pUTzByZnJ4TFJ6Z1Q1bFNoY3NZbkY1S1hXYSsvbEUySEVD?=
 =?utf-8?B?bUN1TjRFcTVqRmtNb3liYXAyb01Sbis5WDIxRHpzMnNrbjhLdnZkVUJFQ2RY?=
 =?utf-8?B?REVrdmVtcnBOR2VwZG1wOURTR3Znc09KcExQaUJLSThiQ1lRRDViUTJjeHhJ?=
 =?utf-8?B?R0lXdTNZeThzNTlZclEwVlNFcWpsamdHekpMQ3Q1a0VVbHJMMnE5UlpNUEJa?=
 =?utf-8?B?aGNEdHYrTkx4NS9qeDYyRmRSVzRDNmd3cmRYbGRHVU5zVVdCanFBQ3ZBd1hh?=
 =?utf-8?B?MmtmMVd2WEk1Z1l0QjJWdVlXcGxkRlVHUVc3SVF0ZU5FZ0xzSXZrVHRzL2xs?=
 =?utf-8?B?THhqU3VmcGduZjdnK1R1a1F6eWtFNGZSRklTSkdBV01LNVlpY2FmbjdvZkkr?=
 =?utf-8?B?eWxmQzBuMS9WbkdyOXJDdXVXYXpSMzNaSE5tSnpUSndYK0tlcEZUKytjMU85?=
 =?utf-8?B?Z0NoUGN3TEN5bGIxcmM5NDVEci9pS09MV1pQL3VZamlJRVpJelVOeWh1YW1a?=
 =?utf-8?B?SHUvc3g0QXJoenJGZmY2WGp5blMwdTc2RmpVYkExTXJ1eGxmaExnQS9JUHhh?=
 =?utf-8?B?QzFzRjlGeFpYaCtUb1VwRlJHZDJ4MllsanRvZDFmRzJaUXVjZ1lkb3NMenBN?=
 =?utf-8?B?L3lWWEZtRHpCdTFCMGhlWm1oT200bitrWGlzVzNDRy91cmdvdTdONnZUbG9U?=
 =?utf-8?B?b2NiU25yOHdTeWxRb0QyaStIdGZRR2tqUXQyN3RqdXU3MG43c0xpN2dZcklD?=
 =?utf-8?B?Sm5pZk5uQWRqNjgyMnNDc2xVQVpsbjlwS2ZUUWl0WHFYejJQK3ZvUkc4U0hy?=
 =?utf-8?B?YUFRYUx4KzRlV1VpYk9zbUpUemVhVlQvakdmbEFIdzRFNGRDbCtlSzNmb21q?=
 =?utf-8?B?OWlQSktXb2YvT1hrMGRpUHZQK3FBTmtsamlVcTh3bUxUemtyVW81Nkg3YWJG?=
 =?utf-8?B?S1UrRWgxeXpuSldxdXIyWXpHanAxTVMyeUpNdDdzMmVkNGpLRjlHd1A3RFdr?=
 =?utf-8?B?YWVmdUd6WEVKZTh0NzJyYlhUT25rTFpiNHhlQk5QZVo5VllOSUNROWVPMURO?=
 =?utf-8?B?NXA5cnJnYTZ5aGp0amtVaXhCRkhWUERxOU9tdUNkWWhOU1ZENFJpMDRkZThU?=
 =?utf-8?B?QWs2cGlkVGRVTDU4RGdVNnJmbDBqdE1scHlrYlU5YmhxVWwrOUl6Qk43YkxC?=
 =?utf-8?B?czVPWTJobHpzUHA3YnlCOFVGRXhHNUYxZ21oeXdqeXNGamtBOVNZVzdsbE1t?=
 =?utf-8?B?NkFsVjA1cWhhNU93N2w1eEZrNHAxRXhmTFJpVGpsRFNoOFRhZURWRHZMRkJG?=
 =?utf-8?B?MFpOM01ON3pGd1FBdUtqYUNFc0R5aSs3VEFaOUJYNncrbStxa3VCalNZMVdD?=
 =?utf-8?B?RDgySmNyUjFVQmxWZUdwclp1UzRkRVRKWXE3WnFPWmJJV2NrMHFiVS9GVmRF?=
 =?utf-8?B?UTdFVWVaT2w4WFBHNi8wSTgrUEU3Qk9jRVg1dlVoQmIzSXJuTnVhWHd5eHFT?=
 =?utf-8?B?MWRnUmxEWTRvV2hMK0w3bG1IcW1ZYnRvNVlLVml6dTRjeTN1cnI2WUFWSWdy?=
 =?utf-8?B?c0E4K25NWFVVcW9xUkV0eXB3VGhXSlhRV2tuUG5BQWc5b0xMQ1FQN3AxQjVB?=
 =?utf-8?B?R0tsVnZxcDc3Z1lmMG50em02QUpTLzdOSnAxS3E4UTkyMm9KWFlUZU5PTG9X?=
 =?utf-8?Q?RQvIr0pUmO4iw3kEDwrV2zjvd2GDFI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K2IzNmUvdm5pS2FodE0xVk83R1h6KzErOVBvY2dZOGQxaHh2aHdHUXl1dEd3?=
 =?utf-8?B?OFJBMmZRVmZyRUVGYy9VS3NmRFRUL24wdGFRRzhJNUpBYm9LYkNBNEQvVE93?=
 =?utf-8?B?Qk9KWmNSekFTK3BPNEdhNDh3aHpDV3o1Y3FFdTNPaUxMdmNzZU4yY25nNlpx?=
 =?utf-8?B?RE5wTzdMbUUzdm1kRlo2dEx4ejJQb2R0QnJXWElUOC9sdGJ0QnJtYlZXVEFT?=
 =?utf-8?B?cUp1RkRKNGQ4VzUzeWFoWlVlYW9SK1FDa0RNMG5TSm1TRnA5V1NJN0FCMkww?=
 =?utf-8?B?ZlFpUGZVS1Q0VkNMdkZRUGdUanJVV1JlbVJzOUxrSTIwN0FwTGpTSDV1SkRD?=
 =?utf-8?B?WlY4RzFidnE5U0NkeVpaZWM4S2Q1Z1dBOTczNmloTituZmp4Ni9haFlPc3Jz?=
 =?utf-8?B?L2tDUzVVYzZJSDdETG8yUkFMdjY1RjIrRng2VUV2QVhyVWZ2azA5c0ViMkR5?=
 =?utf-8?B?b3pUamZMOW54SnNvME96cEFrU05TT055SEFPSlhIRTNBWlpabGxjd3NBWFJC?=
 =?utf-8?B?b2pzWjFicm9mcmt0UWc2V2RJeXlBTDNzTk1GUi9kOG9URDhlNndUSjNnRTB6?=
 =?utf-8?B?WjVJdUpoMkZzb3lUa0c1eGpmN2JSK2kwTWl0MHFSZ3hVYWo1NHJHcTJHQjVV?=
 =?utf-8?B?d1k0QTBCcjFWSFpYemRpTTM1elZ6ZDR3U1QwVEhmR09lRHUySDRsYTV5NDJV?=
 =?utf-8?B?RU5nYXV1b2UxUmRGLzljeWtNVlJXUDNBZTQwOE80KzZ0a28vbnRPbnF4REVH?=
 =?utf-8?B?bWxqbmYwYmp1Rjc5RXorYzgrbHgzUndudzNhU1Q1TkIzR0loQVU1SFhrL0dR?=
 =?utf-8?B?aUc1V1VJdXU4OUdhZFZ4NGVGeFNFYTlMclRtM2Y5eC9FMHFCd0wzazFOZjIw?=
 =?utf-8?B?MC9BOS9id1JWWnh2Ym1DZmhiWnhub2lMQWlmdEFUM1pkSkpQcERtU0pmUVJK?=
 =?utf-8?B?d0RmbFdUZnVHK0xCVEh3bTZiTzFpaHlpZjNnL01QWDJrWEppM0p0dUpHYWQ4?=
 =?utf-8?B?Q3Z3RnNtNkFRMWdndHVMd1czSDRUYXdvZkJvbnIwZXM2MXQwYkNjd0xSSEhR?=
 =?utf-8?B?RGN3b2o0ZmZEbVpERG05K0RWK3pURTdVeHBlSVlKR2prNGxHNUV1QlMvS2I1?=
 =?utf-8?B?VFk5a2c2c1hGR0VKM21lNG1aS1R4bUxsRVV5QndKbmZJbXpFK2JlT0RGc3RZ?=
 =?utf-8?B?STVaVjh6WDhIRy96eGt0V0FYald3V3N2d2V0N2JxMWRQRmIraE5PRjUxVmwy?=
 =?utf-8?B?U0NzcnVjelBRV3ZDMkUrQnlXVVVkTGc5djcxTlpDMUhiTzBxb3V1aU5QNWM0?=
 =?utf-8?B?VEFxbE1jN0hweGI0NFVVcmFwREtaYWNvTXRRR3o2R2tzeEVTcjBCVXZkOHpw?=
 =?utf-8?B?eFlTd3dsS2ZFOTdtUFlYZXFBdE80LzVZektjYXkrZFR4eTlxK3ZvaGdvT2dE?=
 =?utf-8?B?L084eWxuWTU2cVhFU2VLMUxXUFo1TThveW40Y204NGhlTys3MkxKYUlZbk83?=
 =?utf-8?B?enVOY3liaExNZlVkRlZ6SHF6TWoxcWdvUTlhdy8yR3RDa00yOE1ZL1oyKzg4?=
 =?utf-8?B?cGMxY1d6TGdNRk9rcUxZZW54ejkwVmEwSFRLSkk2OFF6U1k2bzVpMEthVHp5?=
 =?utf-8?B?U0ZqbjcvdGpIUXVoSVA0U3pUUmxTbFhobFhxRGMzejRSR0ppbFNza1hLM2d1?=
 =?utf-8?B?UytlNUxST2svOVJCRkNvcGVQdnQrQWtsL1ZCNVVYc3JwaFpNU3Jya0FLYzd6?=
 =?utf-8?B?eitOVU1BKzlCSXZJUFR3Nkx1L212WmYrQnNyQ1ZmV2FTN0NkWElxNlBiR3Jl?=
 =?utf-8?B?eGFBbGFDNWw5VHUyalhuM1F5dUoxak9DY1FYQTMyMHRXdFhUeFZIckFpNURa?=
 =?utf-8?B?aUc1Z09WdmNZV3hNNksrelFVU3ZxUU1MUDg1RDJJZDFuNyszU0pjdm5yTTZK?=
 =?utf-8?B?aVN6VkVCWEh4c2w5TkdtOTB1dVgyU0tzRlJuaW0wL01FYWNIUEc2WnlmQ1VD?=
 =?utf-8?B?bFA4VGwwdDg4TGlDTHpDTHZ5YXNGZjdYMnFNdUlsY2V6ZFFsOGVhcDB3dVRK?=
 =?utf-8?B?YXpKTU1VU1RzTDhSY0phWnE1dFhOeUVqQ2crNDROTWh3cmN6cjBtRTE2NXhp?=
 =?utf-8?Q?+iSE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F042B2F067B12A4AAED6313E7BF2BF6E@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ddacff2-c6f3-451b-0969-08ddb2f6ddb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 08:12:30.7436
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sP8goD9DdiDmu3RXUOlcbGJo9FmySDZF20459MUnyJ6OhOGgGkwgXaM9x1MT2vou4HEIbUJGdoaP4zE78OGbvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4193

T24gMjAyNS82LzIwIDE0OjM0LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTkuMDYuMjAyNSAw
ODoxNCwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24gMjAyNS82LzE4IDIyOjMzLCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAxMi4wNi4yMDI1IDExOjI5LCBKaXFpYW4gQ2hlbiB3cm90ZToN
Cj4+Pj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3ZwY2kuaA0KPj4+PiArKysgYi94ZW4vaW5jbHVk
ZS94ZW4vdnBjaS5oDQo+Pj4+IEBAIC0xMywxMSArMTMsMTIgQEAgdHlwZWRlZiB1aW50MzJfdCB2
cGNpX3JlYWRfdChjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdW5zaWduZWQgaW50IHJlZywN
Cj4+Pj4gIHR5cGVkZWYgdm9pZCB2cGNpX3dyaXRlX3QoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBk
ZXYsIHVuc2lnbmVkIGludCByZWcsDQo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVp
bnQzMl90IHZhbCwgdm9pZCAqZGF0YSk7DQo+Pj4+ICANCj4+Pj4gLXR5cGVkZWYgaW50IHZwY2lf
cmVnaXN0ZXJfaW5pdF90KHN0cnVjdCBwY2lfZGV2ICpkZXYpOw0KPj4+PiAtDQo+Pj4+IC0jZGVm
aW5lIFZQQ0lfUFJJT1JJVFlfSElHSCAgICAgICIxIg0KPj4+PiAtI2RlZmluZSBWUENJX1BSSU9S
SVRZX01JRERMRSAgICAiNSINCj4+Pj4gLSNkZWZpbmUgVlBDSV9QUklPUklUWV9MT1cgICAgICAg
IjkiDQo+Pj4+ICt0eXBlZGVmIHN0cnVjdCB7DQo+Pj4+ICsgICAgdW5zaWduZWQgaW50IGlkOw0K
Pj4+PiArICAgIGJvb2wgaXNfZXh0Ow0KPj4+PiArICAgIGludCAoKmluaXQpKHN0cnVjdCBwY2lf
ZGV2ICpwZGV2KTsNCj4+Pj4gKyAgICBpbnQgKCpjbGVhbnVwKShzdHJ1Y3QgcGNpX2RldiAqcGRl
dik7DQo+Pj4NCj4+PiBJcyBjb25zdCByZWFsbHkgbm90IHBvc3NpYmxlIHRvIGFkZCB0byBhdCBs
ZWFzdCBvbmUgb2YgdGhlc2UgdHdvPw0KPj4gV2lsbCBjaGFuZ2UgdG8gYmUgOg0KPj4NCj4+IHR5
cGVkZWYgc3RydWN0IHsNCj4+ICAgICB1bnNpZ25lZCBpbnQgaWQ7DQo+PiAgICAgYm9vbCBpc19l
eHQ7DQo+PiAgICAgaW50ICgqIGNvbnN0IGluaXQpKHN0cnVjdCBwY2lfZGV2ICpwZGV2KTsNCj4+
ICAgICBpbnQgKCogY29uc3QgY2xlYW51cCkoc3RydWN0IHBjaV9kZXYgKnBkZXYpOw0KPj4gfSB2
cGNpX2NhcGFiaWxpdHlfdDsNCj4gDQo+IEVobSwgbm8uIFRoZSBxdWVzdGlvbiB3YXMgZm9yIHRo
ZSB0d28gZnVuY3Rpb24gKHBvaW50ZXIpIHBhcmFtZXRlcnMuICJjb25zdCINCj4gb24gc3RydWN0
IGZpZWxkcyB0aGVtc2VsdmVzIGNhbiBiZSB1c2VmdWwsIHRvbywgYnV0IGZvciBhbiBlbnRpcmVs
eSBkaWZmZXJlbnQNCj4gcHVycG9zZS4NCk9LLCB3aWxsIGFkZCBjb25zdCBib3RoIGZvciB0aGUg
c3RydWN0IGZpZWxkIGFuZCB0aGUgZnVuY3Rpb24gcGFyYW1ldGVycy4NCg0KPiANCj4+Pj4gK30g
dnBjaV9jYXBhYmlsaXR5X3Q7DQo+Pj4NCj4+PiBBcyB5b3UgaGF2ZSBpdCBoZXJlLCAuLi4NCj4+
Pg0KPj4+PiBAQCAtMjksOSArMzAsMjIgQEAgdHlwZWRlZiBpbnQgdnBjaV9yZWdpc3Rlcl9pbml0
X3Qoc3RydWN0IHBjaV9kZXYgKmRldik7DQo+Pj4+ICAgKi8NCj4+Pj4gICNkZWZpbmUgVlBDSV9N
QVhfVklSVF9ERVYgICAgICAgKFBDSV9TTE9UKH4wKSArIDEpDQo+Pj4+ICANCj4+Pj4gLSNkZWZp
bmUgUkVHSVNURVJfVlBDSV9JTklUKHgsIHApICAgICAgICAgICAgICAgIFwNCj4+Pj4gLSAgc3Rh
dGljIHZwY2lfcmVnaXN0ZXJfaW5pdF90ICpjb25zdCB4IyNfZW50cnkgIFwNCj4+Pj4gLSAgICAg
ICAgICAgICAgIF9fdXNlZF9zZWN0aW9uKCIuZGF0YS52cGNpLiIgcCkgPSAoeCkNCj4+Pj4gKyNk
ZWZpbmUgUkVHSVNURVJfVlBDSV9DQVBBQklMSVRZKGNhcCwgZmluaXQsIGZjbGVhbiwgZXh0KSBc
DQo+Pj4+ICsgICAgc3RhdGljIGNvbnN0IHZwY2lfY2FwYWJpbGl0eV90IGZpbml0IyNfdCA9IHsg
XA0KPj4+DQo+Pj4gLi4uIF90IHN1ZmZpeGVzIGdlbmVyYWxseSBkZXNpZ25hdGUgdHlwZXMuIEkg
ZG9uJ3QgdGhpbmsgd2Ugc2hvdWxkIGFidXNlDQo+Pj4gdGhhdCBzdWZmaXggZm9yIGFuIGlkZW50
aWZpZXIgb2YgYSB2YXJpYWJsZS4NCj4+IFdoYXQgZG8geW91IHRoaW5rIEkgc2hvdWxkIGNoYW5n
ZSB0bz8NCj4gDQo+IFdlbGwsIGlmIHlvdSB0YWtlIG15IG90aGVyIGFkdmljZSwgdGhpcyBxdWVz
dGlvbiB3b24ndCBuZWVkIGFuc3dlcmluZywgYXMNCj4gdGhlbiB5b3Ugb25seSBuZWVkIHRoZSAu
Li5fZW50cnkgb25lLg0KPiANCj4gQnR3LCBub3RpY2luZyBvbmx5IG5vdyAtIHdoeSBpcyBpdCBm
aW5pdCB0aGF0J3MgdXNlZCB0byBkZXJpdmUgdGhlIGlkZW50aWZpZXI/DQo+IFdpdGggdGhhdCwg
aXQgY291bGQgYXMgd2VsbCBiZSBmY2xlYW4gKGxlYXZpbmcgYXNpZGUgdGhlIGZhY3QgdGhhdCB0
aGF0J3MNCj4gb3B0aW9uYWwpLiBJbW8gdGhlIG5hbWUgd291bGQgYmV0dGVyIGJlIGRlcml2ZWQg
ZnJvbSBjYXAsIGFuZCBpdCB3b3VsZCBiZXR0ZXINCj4gYWxzbyByZWZsZWN0IHRoZSBwdXJwb3Nl
IG9mIHRoZSB2YXJpYWJsZS4NCkkgY29uc2lkZXJlZCB0aGlzLg0KSSB0aGluayBpdCBpcyBlYXNp
ZXIgdG8gdXNlIGZpbml0LCBhbmQgZmluaXQgY29udGFpbnMgdGhlIGNhcCB0eXBlLCBhbmQgdGhl
IG1haW4gcHVycG9zZSBvZiB0aGlzIHN0cnVjdCBpcyB0byBpbml0aWFsaXplIHRoZSBjYXAuDQoN
Cj4gDQo+IEphbg0KDQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

