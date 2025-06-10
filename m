Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E06AD3876
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 15:13:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010880.1389152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyms-00073k-Sq; Tue, 10 Jun 2025 13:13:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010880.1389152; Tue, 10 Jun 2025 13:13:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyms-00071A-Oq; Tue, 10 Jun 2025 13:13:10 +0000
Received: by outflank-mailman (input) for mailman id 1010880;
 Tue, 10 Jun 2025 13:13:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JiNZ=YZ=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uOymr-0006n8-MQ
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 13:13:09 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a73b390c-45fc-11f0-a306-13f23c93f187;
 Tue, 10 Jun 2025 15:13:09 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS2PR03MB9744.eurprd03.prod.outlook.com
 (2603:10a6:20b:60b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Tue, 10 Jun
 2025 13:13:05 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%6]) with mapi id 15.20.8835.018; Tue, 10 Jun 2025
 13:13:05 +0000
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
X-Inumbo-ID: a73b390c-45fc-11f0-a306-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NG44DGHGS5XCnrTHbHR1U9mlPa000Q+50Q20HFgKUqb3F5VTfUBzWBPkV3ynb1thr4QVGZxA1gwoiErZlwiJ6ia5ttXdWczg012PzJsuannZD5wzAEfjknKYAbNYLovEmLcoeiUfX6O+1MNMkxcwrdVqjC5Q8f2ss2TOKXxMCCk2EcpXeHUNkSQrgwcKUVewnlqRjBXG1EVSajoykmukWhHESpv7eU1pEm/CwTheoYt/XJX0T12MeZo/Btk0jgEp5fDQosHbyCPM96s187rCKlN1cJ1ObLUa8jQHVGmDAJc9tL6/jBjBFxF8doIsNmEnNcfcme5E++AO+VhKXIcvXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YvbcEpNN7bl73+cW3vAAIqmqz4YiOIQio4FxnJZ4xQE=;
 b=c+3JkaZq0mfRw9HRWsnlwiP70mU29by2+DQOOcfBkUbBgEvUoYFFGMf6wS/chzLS79F9Iq5lz935XZaoM69c0K18MC2JBYrpMHl7MuUkNfztSjVS2SQNujegUBTYfh9nVWAEjFp9SU0BN9y7XD5BtIHz5HZ3Fs95ltEp6CqHhP3hrcxffDjhxOylHnOyIJOxl9kp8pWTKFVpxqXvJemrd+8GCpqeitQ6PTL6zTS7G0JGPvoXHkXucQnmR75tY3raSbBcIZQqH0eLbG9aLiTrGK+J9My7y9786cwmjCWQKsP/NuN8xJq7rt/eE5glTawLsNcEq0ccUlNVkF8+ySgCpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YvbcEpNN7bl73+cW3vAAIqmqz4YiOIQio4FxnJZ4xQE=;
 b=fuiv4Ltm9zv7bPmS4itHDrnkAa1oubQAI61Ppz6crFFcjKiLwOZ84BPQupewoHQs2jsyX1mjGsv7FDwQI3Q2ykL/SfqERpizBa/jh/8/OiItjI4cAffdREzJQbuQuis6G1bYfM8WUTmtOc5CpEfHe0uOgAJ3GRoQmuhwrBO4RQgtjUvWjkXteOh/fJay6HFCbA9gLGoaWiFZ9wQtE94+S8rsrdlquzk/M4XUM8mlv9BU8YIk9CsB6JQiPjeWCJF96umhJi82k05EoK5efoOIQWBUlrrPORybhObRpmaPOpW/zFhw5CV1gjawy8cLBrqVbFqpw0gwiZowIXKqRLXOqw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Julien Grall <julien@xen.org>, Demi Marie Obenour <demiobenour@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>
Subject: Re: [PATCH v11 4/7] xen/arm: smmuv3: Add PCI devices support for
 SMMUv3
Thread-Topic: [PATCH v11 4/7] xen/arm: smmuv3: Add PCI devices support for
 SMMUv3
Thread-Index: AQHbz7Cb+Z/yNKbLOEOjir1VN7bH5LPo3kyAgAogQYCACXTdAA==
Date: Tue, 10 Jun 2025 13:13:05 +0000
Message-ID: <f3630689-71cd-477c-abd4-4386b4e6af2d@epam.com>
References: <cover.1748422217.git.mykyta_poturai@epam.com>
 <71741747bdc0cfcacbe86e66ddd6239ea2f5a3af.1748422217.git.mykyta_poturai@epam.com>
 <9bfc305b-602e-4c96-bd7a-763075e506d7@gmail.com>
 <56e44ec8-c9c0-4d58-98f3-730cc1c1bb86@xen.org>
In-Reply-To: <56e44ec8-c9c0-4d58-98f3-730cc1c1bb86@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS2PR03MB9744:EE_
x-ms-office365-filtering-correlation-id: 5cf19e65-024d-4727-16cd-08dda8208981
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?OXBZZ0ZyY05SbTlPVmtmcFZCWHc4ZXlpZFZnbzNYRml4YUkwUFJ2VjlRUlZ6?=
 =?utf-8?B?OGV1bFNycGgvbERLeXhYOHdBN2xkSHlCcUVWYVZMaWkzMEdobzMyL0twTDJz?=
 =?utf-8?B?VmJQS3E2WTZtelJuUWhES28xUkFMUXRmZmNoV3FpRng5bFBRSjlFUStUampk?=
 =?utf-8?B?c2MrdUR4ckhZa0lLaXArNmY2WmZmbFJUMWFhbmxwb3BkSXVXaFgxcmxQazAw?=
 =?utf-8?B?cUE4RHFnY09wZ29QbEtZLytacDBSQi9pc0FvT09ZaEFZVmJISFd5ak5TZmpx?=
 =?utf-8?B?dE5XNFZaZWlFNFJoTGFoMXFndnRsR3crajBTZThtRGZTdXA2ZFF6THNwS1U4?=
 =?utf-8?B?N29DSWJLNXVSOWxLLzU0QjNqQklRcG9VZGh2Vm91RnpLYVhOQTFBOGdsbG1C?=
 =?utf-8?B?Qm01cm82Z2djZ1kvbzdIUXJpV2NMZXlGK0JLZzFyOUFPSEJKL2cxTTN0eWlz?=
 =?utf-8?B?eFdEQ1VrK0FNUU5WRjYwdzIvemJQSExlRHlFMXhVNUFhQjRZVWM5d2IxdkhU?=
 =?utf-8?B?WkVpNzBVWWNLeVRQNnIxNStnUmFYY2RHcWZ6RHJGVnRjNkFRbkZCQ2ppQ05w?=
 =?utf-8?B?OVowZ0ErWGw4NUx0dFMyN3dEM01Ld1pQU2VDK0lrcmw0NkpBaUoxTm1ENkgr?=
 =?utf-8?B?aWx4U3A1OHdRaCtBYy9aMGx0Y2tQOU5mOWxMbWhjYkpPMnJNZUNvQzlBOHE5?=
 =?utf-8?B?alJyd284MnMvSU5LMmxSc25NaXhrcFA1WEpBcFluRHBqaU1pN0tnZDdWTG1i?=
 =?utf-8?B?am1OZWdNSzZvL2JOQ1BXeTNBK200M0dsV0JkamIyYjV3b0szR3hNTUdETjBV?=
 =?utf-8?B?TEtjbmkyUXg4OXRwd1JRc1h5ZHFhNHgrM2ErNWw4VTZPTE1jNytGY0RWSGhN?=
 =?utf-8?B?bVdjdlpvMjE0Q0dHa2FkWXgra0REQ3FraE93cHNBVW9jV0hGcUtKbDQxdDJR?=
 =?utf-8?B?Z3NhUWhZbnYvS3hJZVYwOEtwZTRMVTdnV0dIU1g3MjBtWmc5bVI3YWcreEww?=
 =?utf-8?B?TmowVW5LY05qS2RRRzE4Qm5mcjdRS2xOdSswanQxSFMwaHNDeGt5TEF1dEgw?=
 =?utf-8?B?V3RrSlY4TzJ4ZkgxNFdwMWtlend1R0d6dytFOFRsZ1BpWThPRERJTVNFUzdh?=
 =?utf-8?B?TStjVytaOWNUL3lGaUJFWHVyMFYxSFJMR1ZKR0lQOWZ3aGpueWxGNjJvNmxH?=
 =?utf-8?B?dTFwY3lxVkg4VXBHcU8vNGNqSVdLNlNvWHU1UEVkRDNlZUI1bFIwRTJmZEpE?=
 =?utf-8?B?eDdJSnc5M21lbXdjY1VIRUhQMnVISEk0Vm5RLzRjWlUwMDRYUVJIT09PNFdU?=
 =?utf-8?B?Um9UaldjYW5IWkN1cHdXY3RPbHJnUEpBL3RWQkkyU0FkanBqOE9DRmpxU01B?=
 =?utf-8?B?czJBZWVyaHlGYkxJYnlqQ0pqZ0Q5SE04NVQvblJzZTc3bHNxaGZhQjhtQ1ky?=
 =?utf-8?B?dStub0tIT1ZUcDNwRGo1WTBQb3J5YWZyeEdNRUNTcjgycDRZOFlyYVpHQWZa?=
 =?utf-8?B?NVBLWFhRUks3K3d4NzR4cWdyaUJGRUdzUlJ1RXFHSlVJMWNXLytJMWhGNWVv?=
 =?utf-8?B?T2taZ3EzaGtDR2VNZ3FhaGQ1NUNSdmZCU3I4VWtuaDdzd1JIUFB3V0dJM0Y1?=
 =?utf-8?B?clhCRWFNSGhKTjdlMmZseVBXMXVRQXhWY2ZzbmV6alFCaGtWbDFPVEZGYk05?=
 =?utf-8?B?QTl3VFErQ281VWsya3RuQld1YzJVenZra1BZbmg2NkFpa2dhckcrV0U4WHRC?=
 =?utf-8?B?RjBLOGZPWVh3NnRQL3dQK3RMSlFvQ1R3WmQ4TDJkelNpdTIvYm45aHVPUXo0?=
 =?utf-8?B?ZWJHQlBkRHV1MThqcXMwRzdyMUgwaE1kVlY5cnJxN2NObUxqTlMzaHRETmR5?=
 =?utf-8?B?WmFpb1ZGQTNlVWtVemZ3U3lTakJ4cjVXZllqT3JrZ3F6dmtiRUFNNW5TQVpi?=
 =?utf-8?B?RGpnUy9YcDE5cm1ZMCtySGtCQWwxWGVFRTNYd0JySnBFK3o4NkpSZW9zb2kr?=
 =?utf-8?Q?fqdAad1tVQ9b5NNLgqdMQ+CSqtO0Jg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V1dtM3dXOEdtMUoxOGlQeDZxWm5OU3ZQTmpnWUYvM1IvbDN0eitFendXRnFD?=
 =?utf-8?B?N0tzTzExdlp5Qjl2djFQNXd3bkEvT3B3WEcrdkhPcWoyTDJUMFVvbGtmdGpu?=
 =?utf-8?B?ZUtDV2puT0IzVDhJZ2NmMUg2S3ZWRDdrN1FjSnlPS1dDUGtMVkRGbjM1U3Y4?=
 =?utf-8?B?UDZDOERTQVNmanEwOXZQSjZLeTlTTzFkamNubklLRHJkSnA4ZDJIVmVBYkZy?=
 =?utf-8?B?M3pVZzRpeUtjd3d2S0d2alJTRE5MbzNPa2JHN3M2WDlWTTN2NU16UkRnKzZj?=
 =?utf-8?B?cEE0VDJvd3lrUHg1WjZEc2V3RzVZWGhTNUNkQkJZTXdWME80ZjRiV216bDN1?=
 =?utf-8?B?d1RLWUxiMTVYOCtoaTkzdjNBc3d4ZHVFRWtYWCtRYlh6TVlHQ21vRlh5cXU2?=
 =?utf-8?B?TTd6bVNMTDY1b244MzZpNndVRHJ5b1JscEJzUnJGYXMzTzBCQWJFLzlUcVUr?=
 =?utf-8?B?VTdIaHRBQ2lGRURCaGpEWGVmSzAxeVQ2R29pcjVyeXZXUDc4YTNsWEhSVTY5?=
 =?utf-8?B?SmI3Sy9rR0F6TVFiSDgydDFKaEs0djFRaFNjbTBLeEhpQmdNdHBqcEdRckd2?=
 =?utf-8?B?V1BlUm90WUszeCt2aDNNaW9qeGhHMXVTUTFXQ0JpblVqa3RLOVhqdXFTcTJj?=
 =?utf-8?B?b053alJBdHl4TzBmZnN4OHRSeFZ5MXdoREtiYjdGRlB2RmQyNXZ1eGQyNHZu?=
 =?utf-8?B?M3kxQlBEeUFqU2pWUjdoc3lJQXZTNWJXZFZWQXpxZW9XK29peDhXcWVQbGMz?=
 =?utf-8?B?dzZEeWVDcnNRWEdqaEw4TWR2WGJBdzZHZ0RQNmJyYThFc3RwL2ZINjhpYzdm?=
 =?utf-8?B?QU1pNDhYZnFaOG9VUXNmQi9RZ05TUkRDMVloaFU5N3hZc3RxNU9wVjNrdEp3?=
 =?utf-8?B?eXMzVU1HNzc1aTEwNHpUaDdJZmdKMXJJYVVpU041TGNhVDFzVEMyV3g5d0gv?=
 =?utf-8?B?Qm5RK1pyNGhBZkJ4dDhjc3JqZFR2aVdobVUxVkdLZXlXbGFjOE5XeVZuU2Fy?=
 =?utf-8?B?V204RGF5UzNFTzRnUmxUK05mNFlRSzN6QXZiSE1GL2RsWlgzYTRXTE5PcytT?=
 =?utf-8?B?Rkdkd0FENkVuRUQ3YUdHZWtpRkZYbEVvcU1QRGJJZ2VmZDhETTNkOHp4S3lU?=
 =?utf-8?B?dGo1MTZia0xzcTFweGVxQkRpekhjV1hLZTBtWTZUMGsweW1YOWdBVDNRVXB6?=
 =?utf-8?B?dmtvbXlTUlAwa051M1BiNkpSc3NtQUQzYVNtNFNhV283MWpGTEVjYmU1MGww?=
 =?utf-8?B?Rzc3SGRHeGFxamhWS05lT1BnUE9sVjkxNVRnK0Vqc2VCSjA3Z0d0Zm9kYUxj?=
 =?utf-8?B?NmFLWkhZUDg1eXlsYWlOdE5ibTA5NFllWTVXK3U0SkNycThhMnFxdkxrcmIx?=
 =?utf-8?B?aVplSG5wdFV1V3B4b1NRZU45Wml6N3VxV0dqOHRRNEZrMkREUEhNSzB0US8r?=
 =?utf-8?B?Z1FyRk02VDA4TmdDY1NWWEg4YzhYYk80dUVocXFNRTBuN0E2SmlCK0pib2gz?=
 =?utf-8?B?Tmo5VnM0UTdPUXBUcjhjSnhuNWN0ZHE3UUQyRGtLQ0RXbitJbHBySi9rQWNT?=
 =?utf-8?B?cDl1NVZGS254bGhCWHJDd1F1S2dPZDk4VGxiMzJQZFdWTnRjK1NYNHJMMGVl?=
 =?utf-8?B?cGVyOXNaamFoL0JTeXBlYzBVbW5EY29BV1NJY215eTA2OGxkRmhKRkNZNXpC?=
 =?utf-8?B?SXI0VnlBWFpZa1FBckVwN0ZnbWMzN2NzaThrRzFka1luZVZ6aldmTUVaY3hK?=
 =?utf-8?B?K2hrT0dPK29Xazk1dzlodVdvTE1CNjluM1kyRkdhYmVDczg5dEx0Q0M5NFJM?=
 =?utf-8?B?VEpqMHhRbzBpNEhuSHcrckJmTXpEOTlYWCtkRlZLSG8xY2dHckJpaW00WEwv?=
 =?utf-8?B?OXpoQ1pKbk9ldStMdnQzUmIxTVpaRDFzTXNPd2JQN0xnZTFFL0ZlMEwweE9p?=
 =?utf-8?B?VEhQdFlDOFphOGllV0Y1YnhPUjR1bitOcWEvMWdXQjNFZDMzMGVCTVl3M0tB?=
 =?utf-8?B?aGEycWQ1b3hDZVNVcENJdm9FbkVJNDg1eHRRcDdPSG1idU9aZXdmMU5SV3Vu?=
 =?utf-8?B?cEVJMmJFcDBUMUZpb3JseGN0Sk5LQ090bm5lZGVXbHBEUlEzUzNINndYWG54?=
 =?utf-8?B?ZGxhVy84c1VBNkVCWEV4VDZPSURqditaaTIwYVNGd3lmeC9tUkpnU1BaQW5P?=
 =?utf-8?B?dWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <14181DB20FB32C428FBDC9BF608B9AE5@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cf19e65-024d-4727-16cd-08dda8208981
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2025 13:13:05.5772
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C1LU7AoTOSzpQeOpN2j2az9nN7illrbHGZjohnqPGUd/KpAAmyRDsS/i3GAmovGrTVVrn7Xk8oRmeN4e4f136g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9744

T24gMjkvMDUvMjAyNSAwMzoxMCwgRGVtaSBNYXJpZSBPYmVub3VyIHdyb3RlOg0KDQo+PiBPbiA1
LzI4LzI1IDA1OjEyLCBNeWt5dGEgUG90dXJhaSB3cm90ZToNCj4+PiBGcm9tOiBSYWh1bCBTaW5n
aCA8cmFodWwuc2luZ2hAYXJtLmNvbT4NCj4+Pg0KPj4+IEltcGxlbWVudCBzdXBwb3J0IGZvciBQ
Q0kgZGV2aWNlcyBpbiB0aGUgU01NVSBkcml2ZXIuIFRyaWdnZXIgaW9tbXUtbWFwDQo+Pj4gcGFy
c2luZyB3aGVuIG5ldyBQQ0kgZGV2aWNlIGlzIGFkZGVkLiBBZGQgY2hlY2tzIHRvIGFzc2lnbi9k
ZWFzc2lnbg0KPj4+IGZ1bmN0aW9ucyB0byBlbnN1cmUgUENJIGRldmljZXMgYXJlIGhhbmRsZWQg
Y29ycmVjdGx5LiBJbXBsZW1lbnQgYmFzaWMNCj4+PiBxdWFyYW50aW5pbmcuDQo+Pj4NCj4+PiBB
bGwgcGNpIGRldmljZXMgYXJlIGF1dG9tYXRpY2FsbHkgYXNzaWduZWQgdG8gaGFyZHdhcmUgZG9t
YWluIGlmIGl0IA0KPj4+IGV4aXN0cw0KPj4+IHRvIGVuc3VyZSBpdCBjYW4gcHJvYmUgdGhlbS4N
Cj4+IFRoaXMgaXMgb25seSBzYWZlIGZvciBkZXZpY2VzIHByZXNlbnQgYXQgYm9vdCB0aW1lLiAg
SXTigJlzIG5vdCBzYWZlIGZvcg0KPj4gaG90cGx1Z2dlZCBkZXZpY2VzLCB3aGljaCBzaG91bGQg
YmUgcXVhcmFudGluZWQuDQo+IA0KDQpIaSBEZW1pLA0KDQpDb3VsZCB5b3UgcGxlYXNlIGV4cGxh
aW4gYSBsaXR0bGUgbW9yZSBpbiBkZXRhaWwgd2hhdCBkbyB5b3UgdGhpbmsgdGhlIA0KaXNzdWVz
IHdpbGwgYmUgaGVyZT8gQXMgZmFyIGFzIEkgdW5kZXJzdGFuZCBxdWFyYW50aW5pbmcgaXMgb25s
eSANCnJlbGV2YW50IGZvciB0cmFuc2l0aW9uaW5nIGRldmljZXMgYmV0d2VlbiBkb21haW5zLiBN
YXliZSBJIGFtIG1pc3NpbmcgDQpzb21ldGhpbmcgaGVyZS4NCg0KLS0gDQpNeWt5dGE=

