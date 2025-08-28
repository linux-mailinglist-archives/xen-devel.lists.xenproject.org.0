Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1015DB3A5F2
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 18:17:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099598.1453382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urfJO-0005wC-AF; Thu, 28 Aug 2025 16:17:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099598.1453382; Thu, 28 Aug 2025 16:17:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urfJO-0005th-7J; Thu, 28 Aug 2025 16:17:18 +0000
Received: by outflank-mailman (input) for mailman id 1099598;
 Thu, 28 Aug 2025 16:17:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FxJR=3I=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1urfJM-0005tX-Dd
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 16:17:16 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75ca234e-842a-11f0-8adc-4578a1afcccb;
 Thu, 28 Aug 2025 18:17:15 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by PA6PR03MB10532.eurprd03.prod.outlook.com (2603:10a6:102:3d9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.24; Thu, 28 Aug
 2025 16:17:13 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9073.016; Thu, 28 Aug 2025
 16:17:12 +0000
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
X-Inumbo-ID: 75ca234e-842a-11f0-8adc-4578a1afcccb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pXPAF9wHF1xFcuNKPnofHDnzqgz7UBX+OHfoLkB2xktf2YTpj07dgun7hC5YIYj+PeQ5/5tmB/9fjqV1fUzdJ6eqc15G5mV0R5G++wCBYlNo516fTObgE6okHgYYpeXd9xYF7FXMSyuT3jSgVEL5jo2BDqEuuhBtrRRR7QRfPAbSWpesAgVmZkDbOS25xkRzdITV2gqCPrF7UOFu4zLnHFSQJPh62kuHg779/3O9f73mYQ78wCAduI9rdEoQ4ekUwNZEW27Uqaa32llMKYz76idGEMc1RRnxj65Abi7j9xOn4vTRPvX4l1M8JbQJkiqz0IzaJ7hz1a5QzBTwVAs0pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+BOAKc4ePu5k8MfT9JLdkRwTeGdUsTnHyAo04DW/HWw=;
 b=pqI9F5qXl1LeQ5ZKPkwpcNSAWae9BQwBFBnENah9oe1KnE9SeQFEgpNwKZJErbuO8fGTeqlP0eVQCM2rsNpUmYJe1ho/Erentyl6TIDYsVWgoZizCqvQWrC2jMBOrfSgeT8FKb2zQ0mGVr6q06kiuDTgUNpWYC96sk54HsAere/DfmaEb47tAWZIqVHcwwIme9VHU5qPgb6BnE1KEBeK71IZh1y0iXNm2p9mTfDZb0ImjKzvpMkEGHwv+xZDulJlr7raYdjYVI4A27aX9DhRoFF+fvIRQF9H2vZlKoWNCo0EiTYkznz+jvTVn/naTe1Adztc3B8kQ2n0SrZ95GsXag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+BOAKc4ePu5k8MfT9JLdkRwTeGdUsTnHyAo04DW/HWw=;
 b=vbLWrn6GvoYyUVqr+ImN5iAzC9JsPMpykRluxHbz06sqmPiRibqYA8PpqQ9/3GKuzyRL0ZKbYVkra3AgxJDZhdaNpkqxQoO4uoH7RP2W7sjFHKbbxBRkzFtc+rYBHEA0mkVVK7pvC++MPdU1ln6VhqQmNHooZnSVSHMrvcww1OBREoNDIyop3q7sHrEB+8BOJj7Ym/qcVUaUXSdriLc6E/hFoghrhTogYe9/3ui9r59jaiQedmd6oW/JxuPuXlnPsp5lrZBE/v5gq8N0DpWOBj633fXsl3ivd/piXUKMytPMnPLgna4T+M1Wo9eiP3LA4vjRXQHgxQOUTfNfirSBkQ==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 01/12] xen/arm: gicv3: refactor obtaining GIC addresses
 for common operations
Thread-Topic: [PATCH v4 01/12] xen/arm: gicv3: refactor obtaining GIC
 addresses for common operations
Thread-Index: AQHcF3/CtR1KedyUO0e9jC2sdgHn6rR396GAgABHyYA=
Date: Thu, 28 Aug 2025 16:17:12 +0000
Message-ID: <8ad7cf86-ff85-4d56-b6b1-33fcb0dc0c54@epam.com>
References: <cover.1756317702.git.leonid_komarianskyi@epam.com>
 <5f511d386c7f20b09106aa0202e0989477eff498.1756317702.git.leonid_komarianskyi@epam.com>
 <69bdbdac-4876-47de-b8db-ce6f3e1b7a24@xen.org>
In-Reply-To: <69bdbdac-4876-47de-b8db-ce6f3e1b7a24@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|PA6PR03MB10532:EE_
x-ms-office365-filtering-correlation-id: d04579ef-6742-4e0d-fed9-08dde64e5888
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UEZua3VsRTYybStHMWxRbnpRUHZ2NHY1ZUtIdFF6UTZadFE1TnNMU29BQ1hq?=
 =?utf-8?B?aXFyZnpjOXFCaHd6c3I1SFVmeGhUUGE1d2pFYmxNRkU5NG52WjBRRGFrZGRC?=
 =?utf-8?B?Wko5emtIVlV0cWptTGdvTDhkcUxtNGpTcktsVmJ4aDR3Z1JhYWczcS9rMllW?=
 =?utf-8?B?WGJaVW1KMjJ6d3IzRTQ2SUxUaFdJQWhWejFFN09SMTBNYTlWb2t1TWlsZkxY?=
 =?utf-8?B?SVI2dmZQS2Q5cE5oeTh3dlpsWmZWSG13VjVyK0FJbEhvMnVMaVF4dHI5S3ZO?=
 =?utf-8?B?SDNWekFFOXpRMnBKSDVReERpZDNkU3daelhLVXZqaklPdkE0dDU3Q24yWW5x?=
 =?utf-8?B?cGIyaFVUbUNVQzlXdGJOMGlmLzFDby80bXRuVGp4SnBaNnd2WEJwKzc0aHgw?=
 =?utf-8?B?eEZ1MncySWR1aThtc085dHR6ZkpPc1J3Y29TeEZENzBtMXlVMkpCUmo4UlN4?=
 =?utf-8?B?NGw2NnlrWFlPOEx6ZVZHcDRuUWlqRTZKZUp5VWRuWnNPZGJwSXRmeTVjeGo3?=
 =?utf-8?B?OUtQbEcvd2ZsKzBHaVgvMHg3YzNUQVZEeHc1c016MW1IL0FoSWxmV3dSM3RH?=
 =?utf-8?B?M3RUcWsxYmNxdkU4aVJJMnFvMEM5ZWFLRkxBeVVuR2djVlphUDBwNGNiQjda?=
 =?utf-8?B?WmhuY2NTVVllRTcyNTNKUzR0WTFBZW9MUVVlZmZad1ZLMEZweXQ4dnNibUth?=
 =?utf-8?B?WlRra2djdXBMUHY4bHU2SlNMWmhXRXZlYlVXMWE0Q1B0eFgxZjUvYnl1dFZJ?=
 =?utf-8?B?Sm53azlQSFlIQSt1UDh4a2QzMEJhWHF1bHRKRGVCTHlBdWdlcEk5ay9sRFVD?=
 =?utf-8?B?YWxYL2R4cklzak5RSjVacFg1aTVpdGE4Z0l0dmRuWGIrWFAzV0ZUREk5R0NF?=
 =?utf-8?B?dndtak0vYVFkcmE3VnRJd2REWlY1WjY3Vkg4SlF0NTJWclg0Z1Jrb2NNN3hC?=
 =?utf-8?B?b1owVG8xeFNxQkJrcG1ORFc4OVB0R2ZWTzVOSzdUVFhDVGl0eXc4dGwwN1VI?=
 =?utf-8?B?eHIxMW9oc1ROVzVTY21oTDVsN0ZrTnVsUVRrcUtma0ZCa0l3b2pmZTRVZ3lF?=
 =?utf-8?B?NFdGUXFsczJxbENYWXBQM3ZIVmNkWGVRY0ZMQnVJVDlBSlFNK2FPdEkzblo0?=
 =?utf-8?B?MEJiSURrWTlOWXZYdnlSYkF1UThMVXYxcE1QMnpZTmhGMHVZc25OSy9BSU05?=
 =?utf-8?B?Y0NOQWJqdGkwVVdXSFpMMDREZlpXalM0eDhiYmJheGdZaVJ3Y2xFSzRuSXpU?=
 =?utf-8?B?Q3hZZTRHVmJoSmRoT1ZRNTJvSzh1cnRpVkZwcVdrWTlpaUxBTU1idGdxZDJF?=
 =?utf-8?B?OTY4VnpPc1M4a3psUHJ4Y3krTWVkOE44ZWpCaGp2UUwyZ01aM0ViaURxUFhO?=
 =?utf-8?B?S2tnZnU5YlBpR3Q5Q1dGMzBkcVdXdEh1TzFwcEFDWktXaHlTenZCUGlZREMx?=
 =?utf-8?B?TnQ1MUcwY1hQRk1RS2pHbzJBWkluQWxZTWd4ay9EUTdkUFRSVnYrZytSeVh5?=
 =?utf-8?B?Y0JzakhiRUtwL3ZUelIvWVI4dG9FMC9hZ2IvQ25lKzNadU1mWkNqcGZCVS9h?=
 =?utf-8?B?ZHdCMXA2OWxod015VkRnZmxqSlQrMTlrSEd3V0VCeXRwUEluUkFHK1Q1RGxr?=
 =?utf-8?B?M0N2Rlo1NDkzQkVSWGEya1U2aGs0UkFOck1ZN2swT0YwYWVyMm9KS1F4bmhi?=
 =?utf-8?B?RWtFYXRIMnY5Z2FjK1JzTUxHK3BWOGpPNmhmbWU4MEdsNzJyQWhhN09QbEds?=
 =?utf-8?B?S3VMRkxGVDZUTC9MSnhBRGhTYkl6YmtQOXM1K0ZGbVdOVENRZlUxellxWG1o?=
 =?utf-8?B?dEpZd3gyQXVPL3FOZjZWdjdaVW1HNmtkSHJJY1ZmK0hVRE1WMjV6QUM2bWdX?=
 =?utf-8?B?QzV1Zjl4SG9INjJWM2g1Z0lvR0h1MnRLdzR0eUlPWDU0OGlZRWw2OXJZK2VF?=
 =?utf-8?B?RTVpLzVzVm9pR25IQUkwS3c5UzlYRVpyUWRORDJ3SGN2NFJzUy9YUFJlYmx1?=
 =?utf-8?B?NWQ0Y2pMZEdBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M3lkWEhwUnZ0MThpSXdtR2tkenhVMDE4KzVEQU9GelhSRHpWQm8zRG52UHN1?=
 =?utf-8?B?VlB5ZkNqU0dFUmJQcjZIeFVSNjJzR1ExY3RkK1o0VjErV3EybFg5WWZ6cVVp?=
 =?utf-8?B?Nm0xR25IZWthR3ZRLzYvUWdKQ0VheEtuLzFQanZWUG84ejN2TkErZTZMeUpk?=
 =?utf-8?B?dXZ3SWQ4Zm9lNnc4akxTUURzN1ppSmduZ0ZnSW9yOTEyaklTMWkzQmhnZXk1?=
 =?utf-8?B?OGpBQTl1UWVKR1k5VjhhNUlPT0N3NFFyYjNCQ2tUVXV0dVM5b1BsajREVlhp?=
 =?utf-8?B?SGxwLytYUEd5aGRPQkwrRnl4b1hheFVxekMyZ24yQ0hyRzhvZ2pmdHBnVzRl?=
 =?utf-8?B?OENNVXZTcmxPc3pVamwxVzh6ZDRDWE9jcjNwcWliYWZGWFJyWVNweGN2Rklz?=
 =?utf-8?B?YUxyVEJ4VGR4VEFibWtqeXNnTU1vVDdTK0gxWS8zbW5pQ3J4dW9jMGs3V3BM?=
 =?utf-8?B?cUhXakNCKzV2N2RHdjBEMm9jVVV1aWp0MmMrWG5GcEZnSDFsUkRlNmxZZ1Bp?=
 =?utf-8?B?dzk3bjRIZ2orQ3dzYUxhcHA3R1NsNlRhQ2ZKMUdWSFFBN0FMYUdvcTY3ODN1?=
 =?utf-8?B?Slo4SDJ6SnllRkw5VmV6blBlV3RtYWZSKzFpNWQ0U2M5V1Z4SUttUElOM2pa?=
 =?utf-8?B?RW5iZHFidnN0Zm0zV3VxVHRldGhIYlB4NGk1cTVRM0RtN2lKMVFKSWorUDRx?=
 =?utf-8?B?UlhSaFVTaFRSQ3ZpM1BBdEtLQkZweitESnRVdWh2WjFpUDVXK0JhUU8vY1Fu?=
 =?utf-8?B?cFRPYU5Ua1VkTmtuODNMRXB0azVoYW9naWJQc0paRlZlUEppaVE3TjhHVXUy?=
 =?utf-8?B?dm9wbUw3aDNQQnpsYlVKZ0FsbnVpcS9aTGdCazhCNjNwMTFIRGRkYXBVYkQv?=
 =?utf-8?B?MzN2bVJicnhraVl5R0VYRjRqR3k5S2ZFVnN3cEZEYjdRQS93bW80eDFIMzk3?=
 =?utf-8?B?RlQwVjU2c3QwTlZSZ1NiVnRFZnhoQ1JGQThDcUo0Zyt6YkNURlpUMEpobHRL?=
 =?utf-8?B?SStyQkJOUEkweHZaTlk2M001UzZ4L1d3bm1kLys3NWd3SWNLelRVZ1hjK0dI?=
 =?utf-8?B?ekV1dXRTdjJXb2EvZEZ4QU5kc0hNTmJzWFJyazZFcC9ML3dIYWMrZGI5K24z?=
 =?utf-8?B?bGlIYzlOQjJJM28xNTdkNWlrcUJ3VFkycDIyRWlTTnA1Zm5EazU4Q3ZCR1I2?=
 =?utf-8?B?cTNybDhIOHNDWEkxZkNPWWxUUUR3WE5rcjM1eHloUk9PK0hzSDYxTDEwbjhk?=
 =?utf-8?B?aVp3UHZUN1duL0NqN0VtczhDOHZxZ1FnbjBZdHlsNEpveVpQaW5wNDVDZVg4?=
 =?utf-8?B?QkNiTlljenZnTVhBbnBOSStMaFcwM0daTGxoRDJpTm56M1IxajBtOUhhSDdO?=
 =?utf-8?B?OWNpcGNFWW80ZTNSMkpBWDlqd0RwZk53eUV1OTB1ZmZGVjVQYlJXYmlpdVNE?=
 =?utf-8?B?QkdKQWd0eFZWQW5nT1lhUHB5T3hiL1dxNnVyZEg1dGRTckM2eGRpUlpnVW9V?=
 =?utf-8?B?dytqc3o5MG5MYUlLTlZNaG12c05oakhQSVVIaUpsRlYxOGdwamF2MHIwazJs?=
 =?utf-8?B?eU4wazlOQXhzWllmRmhSSTFtYjNocXVWVXJNY2tackxSb0daeEZLMnp2ekg5?=
 =?utf-8?B?TTQvOWM2eU1Kam9zb3NDSzllbnRxM3RtRWNRZU5jSnI3ZXNIditJZnBBS0Ni?=
 =?utf-8?B?R0hCWUFXWjEwQmE5Q0pneWw4a1oxVEY1WmZPeDJjYlo1azl2bHREd2lUSENk?=
 =?utf-8?B?a2hJMkUvRkliWEYzT3RUd3FXVW90UEJrSkZwTldXeitJazFiUlR0QnBvY216?=
 =?utf-8?B?TjBzNGMrY0tXK3lFK2FCVmxKQ0l3Vm50cUIzQjYzdDN5RVgwb2F3ZFpsQmNL?=
 =?utf-8?B?VTZTQWdwTCtucCtRY2wxc0lUbXh0RFhPN3VOWklyQVAvQnRPUU9KeGZxSEFh?=
 =?utf-8?B?U3VpUElDSTlrWUNQVzhHQlNpTjVMTzZvaG93MlRzVm81ZXFKV05QdFF3WEJN?=
 =?utf-8?B?NEliOWxIMWd0YjRtcGdjTFRlR3RaaUJweXpFVjdoNXA3ZHl5cWpSQzJ3QmV0?=
 =?utf-8?B?QU5IdlVkY0x4VzRranpUMStWMXpORUNqMDU0Z211MktSRGkxVVpBaTBlTkhD?=
 =?utf-8?B?UndIT3BqL0ZqSVQ3WHpES0liUTRSbTJFbFhIR1BFV1RhS3RWSXBJWTI4MUls?=
 =?utf-8?Q?q9L+Kx7Q4OcS+oEp4fCxfVY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F005277EEB6A524FAF39A7138B4C1E60@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d04579ef-6742-4e0d-fed9-08dde64e5888
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 16:17:12.3537
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aPk0GSUOmNav17tAhY7pnKC0atgzY5ORofFaaFMJAisHDK8FCnB8Uyr+unXHpBfuEHNy2n9YgOT50w+I4dROLzlqRp4EqXziOUX9LWpWbrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR03MB10532

SGkgSnVsaWVuLA0KDQoNCk9uIDI4LjA4LjI1IDE1OjAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+
IEhpIExlb25pZCwNCj4gDQo+IE9uIDI3LzA4LzIwMjUgMTk6MjQsIExlb25pZCBLb21hcmlhbnNr
eWkgd3JvdGU6DQo+PiBDdXJyZW50bHksIG1hbnkgY29tbW9uIGZ1bmN0aW9ucyBwZXJmb3JtIHRo
ZSBzYW1lIG9wZXJhdGlvbnMgdG8gY2FsY3VsYXRlDQo+PiBHSUMgcmVnaXN0ZXIgYWRkcmVzc2Vz
LiBUaGlzIHBhdGNoIGNvbnNvbGlkYXRlcyB0aGUgc2ltaWxhciBjb2RlIGludG8NCj4+IGEgc2Vw
YXJhdGUgaGVscGVyIGZ1bmN0aW9uIHRvIGltcHJvdmUgbWFpbnRhaW5hYmlsaXR5IGFuZCByZWR1
Y2UgDQo+PiBkdXBsaWNhdGlvbi4NCj4+IFRoaXMgcmVmYWN0b3JpbmcgYWxzbyBzaW1wbGlmaWVz
IHRoZSBpbXBsZW1lbnRhdGlvbiBvZiBlU1BJIHN1cHBvcnQgaW4gDQo+PiBmdXR1cmUNCj4+IGNo
YW5nZXMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogTGVvbmlkIEtvbWFyaWFuc2t5aSA8bGVvbmlk
X2tvbWFyaWFuc2t5aUBlcGFtLmNvbT4NCj4+IFJldmlld2VkLWJ5OiBWb2xvZHlteXIgQmFiY2h1
ayA8dm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20+DQo+Pg0KPj4gLS0tDQo+PiBDaGFuZ2VzIGlu
IFY0Og0KPj4gLSBubyBjaGFuZ2VzDQo+Pg0KPj4gQ2hhbmdlcyBpbiBWMzoNCj4+IC0gY2hhbmdl
ZCBwYW5pYygpIGluIGdldF9hZGRyX2J5X29mZnNldCgpIHRvIHByaW50aW5nIHdhcm5pbmcgYW5k
DQo+PiDCoMKgIEFTU0VSVF9VTlJFQUNIQUJMRSgpDQo+PiAtIGFkZGVkIHZlcmlmaWNhdGlvbiBv
ZiByZXR1cm4gcG9pbnRlciBmcm9tIGdldF9hZGRyX2J5X29mZnNldCgpIGluIHRoZQ0KPj4gwqDC
oCBjYWxsZXJzDQo+PiAtIG1vdmVkIGludm9jYXRpb24gb2YgZ2V0X2FkZHJfYnlfb2Zmc2V0KCkg
ZnJvbSBzcGlubG9jayBndWFyZHMsIHNpbmNlDQo+PiDCoMKgIGl0IGlzIG5vdCBuZWNlc3NhcnJ5
DQo+PiAtIGFkZGVkIFJCIGZyb20gVm9sb2R5bXlyIEJhYmNodWsNCj4gDQo+IFByb2NjZXMgcmVt
YXJrLCBoZXJlIHlvdSBzYWlkIHRoZSBSZXZpZXdlZC1ieSBmcm9tIFZvbG9keW15ciB3YXMgYWRk
ZWQgDQo+IGluIHYzLiBIb3dldmVyLCBnaXZlbiB0aGUgY2hhbmdlcyB5b3UgbWFkZSB0aGlzIHNo
b3VsZCBoYXZlIGJlZW4gDQo+IGludmFsaWRhdGVkIChyZXZpZXdlZC1ieSBtZWFucyB0aGUgcGVy
c29uIHJlYWQgdGhlIGNvZGUgYW5kIGNvbmZpcm1lZCBpdCANCj4gaXMgY29ycmVjdCkuDQo+IA0K
PiBJIHNlZSBWb2xvZHlteXIgY29uZmlybWVkIGhpcyByZXZpZXdlZC1ieSBvbiB2My4gU28gbm8g
aXNzdWUsIGJ1dCB0aGlzIA0KPiBzaG91bGQgaGF2ZSBiZWVuIGNsYXJpZmllZCBpbiB0aGUgY2hh
bmdlbG9nLg0KPiANCg0KVGhhbmsgeW91IGZvciB5b3VyIGV4cGxhbmF0aW9uLg0KSnVzdCB0byBj
bGFyaWZ5OiB3b3VsZCBpdCBiZSBva2F5IHRvIGxlYXZlIHRoZSBSQiB0YWcgKHdpdGggYXBwcm9w
cmlhdGUgDQp0ZXh0IGluIHRoZSBjaGFuZ2Vsb2cpIGlmIEkgZml4IHNvbWUgbWlub3Igbml0IGZy
b20gYW5vdGhlciByZXZpZXdlciBpbiANCnRoZSBuZXh0IHZlcnNpb24sIGxpa2UgaW4gdGhpcyBw
YXRjaD8NCg0KPj4NCj4+IENoYW5nZXMgaW4gVjI6DQo+PiAtIG5vIGNoYW5nZXMNCj4+IC0tLQ0K
Pj4gwqAgeGVuL2FyY2gvYXJtL2dpYy12My5jwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTE0ICsrKysr
KysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLQ0KPj4gwqAgeGVuL2FyY2gvYXJtL2luY2x1ZGUv
YXNtL2lycS5oIHzCoMKgIDEgKw0KPj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCA4MSBpbnNlcnRpb25z
KCspLCAzNCBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2dp
Yy12My5jIGIveGVuL2FyY2gvYXJtL2dpYy12My5jDQo+PiBpbmRleCBjZDNlMWFjZjc5Li5hOTU5
ZmVmZWJlIDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL2dpYy12My5jDQo+PiArKysgYi94
ZW4vYXJjaC9hcm0vZ2ljLXYzLmMNCj4+IEBAIC00NDUsMTcgKzQ0NSw2NyBAQCBzdGF0aWMgdm9p
ZCBnaWN2M19kdW1wX3N0YXRlKGNvbnN0IHN0cnVjdCB2Y3B1ICp2KQ0KPj4gwqDCoMKgwqDCoCB9
DQo+PiDCoCB9DQo+PiArc3RhdGljIHZvaWQgX19pb21lbSAqZ2V0X2FkZHJfYnlfb2Zmc2V0KHN0
cnVjdCBpcnFfZGVzYyAqaXJxZCwgdTMyIA0KPj4gb2Zmc2V0KQ0KPj4gK3sNCj4+ICvCoMKgwqAg
c3dpdGNoICggaXJxZC0+aXJxICkNCj4+ICvCoMKgwqAgew0KPj4gK8KgwqDCoCBjYXNlIDAgLi4u
IChOUl9HSUNfTE9DQUxfSVJRUyAtIDEpOg0KPj4gK8KgwqDCoMKgwqDCoMKgIHN3aXRjaCAoIG9m
ZnNldCApDQo+PiArwqDCoMKgwqDCoMKgwqAgew0KPj4gK8KgwqDCoMKgwqDCoMKgIGNhc2UgR0lD
RF9JU0VOQUJMRVI6DQo+PiArwqDCoMKgwqDCoMKgwqAgY2FzZSBHSUNEX0lDRU5BQkxFUjoNCj4+
ICvCoMKgwqDCoMKgwqDCoCBjYXNlIEdJQ0RfSVNQRU5EUjoNCj4+ICvCoMKgwqDCoMKgwqDCoCBj
YXNlIEdJQ0RfSUNQRU5EUjoNCj4+ICvCoMKgwqDCoMKgwqDCoCBjYXNlIEdJQ0RfSVNBQ1RJVkVS
Og0KPj4gK8KgwqDCoMKgwqDCoMKgIGNhc2UgR0lDRF9JQ0FDVElWRVI6DQo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCByZXR1cm4gKEdJQ0RfUkRJU1RfU0dJX0JBU0UgKyBvZmZzZXQpOw0KPj4g
K8KgwqDCoMKgwqDCoMKgIGNhc2UgR0lDRF9JQ0ZHUjoNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJldHVybiAoR0lDRF9SRElTVF9TR0lfQkFTRSArIEdJQ1JfSUNGR1IxKTsNCj4+ICvCoMKg
wqDCoMKgwqDCoCBjYXNlIEdJQ0RfSVBSSU9SSVRZUjoNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJldHVybiAoR0lDRF9SRElTVF9TR0lfQkFTRSArIEdJQ1JfSVBSSU9SSVRZUjAgKyBpcnFk
LT5pcnEpOw0KPj4gK8KgwqDCoMKgwqDCoMKgIGRlZmF1bHQ6DQo+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBicmVhazsNCj4+ICvCoMKgwqDCoMKgwqDCoCB9DQo+PiArwqDCoMKgIGNhc2UgTlJf
R0lDX0xPQ0FMX0lSUVMgLi4uIFNQSV9NQVhfSU5USUQ6DQo+PiArwqDCoMKgwqDCoMKgwqAgc3dp
dGNoICggb2Zmc2V0ICkNCj4+ICvCoMKgwqDCoMKgwqDCoCB7DQo+PiArwqDCoMKgwqDCoMKgwqAg
Y2FzZSBHSUNEX0lTRU5BQkxFUjoNCj4+ICvCoMKgwqDCoMKgwqDCoCBjYXNlIEdJQ0RfSUNFTkFC
TEVSOg0KPj4gK8KgwqDCoMKgwqDCoMKgIGNhc2UgR0lDRF9JU1BFTkRSOg0KPj4gK8KgwqDCoMKg
wqDCoMKgIGNhc2UgR0lDRF9JQ1BFTkRSOg0KPj4gK8KgwqDCoMKgwqDCoMKgIGNhc2UgR0lDRF9J
U0FDVElWRVI6DQo+PiArwqDCoMKgwqDCoMKgwqAgY2FzZSBHSUNEX0lDQUNUSVZFUjoNCj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAoR0lDRCArIG9mZnNldCArIChpcnFkLT5pcnEg
LyAzMikgKiA0KTsNCj4+ICvCoMKgwqDCoMKgwqDCoCBjYXNlIEdJQ0RfSUNGR1I6DQo+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gKEdJQ0QgKyBHSUNEX0lDRkdSICsgKGlycWQtPmly
cSAvIDE2KSAqIDQpOw0KPj4gK8KgwqDCoMKgwqDCoMKgIGNhc2UgR0lDRF9JUk9VVEVSOg0KPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIChHSUNEICsgR0lDRF9JUk9VVEVSICsgaXJx
ZC0+aXJxICogOCk7DQo+PiArwqDCoMKgwqDCoMKgwqAgY2FzZSBHSUNEX0lQUklPUklUWVI6DQo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gKEdJQ0QgKyBHSUNEX0lQUklPUklUWVIg
KyBpcnFkLT5pcnEpOw0KPj4gK8KgwqDCoMKgwqDCoMKgIGRlZmF1bHQ6DQo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBicmVhazsNCj4+ICvCoMKgwqDCoMKgwqDCoCB9DQo+PiArwqDCoMKgIGRl
ZmF1bHQ6DQo+PiArwqDCoMKgwqDCoMKgwqAgYnJlYWs7DQo+PiArwqDCoMKgIH0NCj4+ICsNCj4+
ICvCoMKgwqAgLyogU29tZXRoaW5nIHdlbnQgd3JvbmcsIHdlIHNob3VsZG4ndCBiZSBhYmxlIHRv
IHJlYWNoIGhlcmUgKi8NCj4+ICvCoMKgwqAgcHJpbnRrKFhFTkxPR19XQVJOSU5HICJHSUN2Mzog
V0FSTklORzogSW52YWxpZCBvZmZzZXQgMHgleCBmb3IgDQo+PiBJUlEjJWQiLA0KPiANCj4gTklU
OiBJIGFtIG5vdCBleHBlY3RpbmcgdGhlIGludGVycnVwdCB0byBiZSA8IDAuIFNvIGl0IHdvdWxk
IGJlIA0KPiBwcmVmZXJhYmxlIHRvIHVzZSAldS4NCj4gDQo+IEFja2VkLWJ5OiBKdWxpZW4gR3Jh
bGwgPGpncmFsbEBhbWF6b24uY29tPg0KPiANCj4gQ2hlZXJzLA0KPiANCg0KVGhhbmsgeW91IGZv
ciB5b3VyIEFCLiBJIHdpbGwgZml4IHRoZSBuaXQgaW4gVjUuDQoNCkJlc3QgcmVnYXJkcywNCkxl
b25pZA0K

