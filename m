Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9427ABD247F
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 11:25:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141880.1476048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Enz-0005IU-0K; Mon, 13 Oct 2025 09:25:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141880.1476048; Mon, 13 Oct 2025 09:25:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Eny-0005GF-TU; Mon, 13 Oct 2025 09:25:22 +0000
Received: by outflank-mailman (input) for mailman id 1141880;
 Mon, 13 Oct 2025 09:25:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gL+L=4W=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v8Enx-0005G2-0Y
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 09:25:21 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86732734-a816-11f0-980a-7dc792cee155;
 Mon, 13 Oct 2025 11:25:15 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 CY8PR12MB7564.namprd12.prod.outlook.com (2603:10b6:930:97::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.12; Mon, 13 Oct 2025 09:25:11 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2%3]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 09:25:11 +0000
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
X-Inumbo-ID: 86732734-a816-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uh7gA6qfJDWO37uRep2cpW7eVlaz6HbMNxr+iqs/ScaC+y50bOj1m+ZQlIbJBSflkqH61wh+zRjUNvWQrWh2uEnSmYvqu3qbH7IC3TGMfBRb3QxmiDIjYc9+hpW+vK7GB03aKdcerY/imt+IjRfP8GTAHu+7W5t09eSXrsJzcIuRihoLoNfSvSwTk7m4+MaxhH1Kq6Db12qtC/zGw3WnNNbHiKW20kFPgqRy6bfQWrjBs2E6bXWeP4Cd0qlpwJClemCaDZjE/K/jn+cO9nFWj4CZBPoXq8i0qF4JHsMPg5d3TH7lcb8R+KXe5ZP5IuDVo3IGBN6mDkZ4VeafVF0f9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ntwKeyXM4XE6rPHPWuVjaMwwVqub8b9fVCuoN/Np8IE=;
 b=A/HCAbJQ2P5J7F5oqC5/o9/C69k+ZnepiM2XIhVe0yU0sUGbfZa84yWKXVNLmOsSf3LfnIf7D9QZSxns5S+VbjkyIZz3Pik1a7lVKNp5KtKaRv90+sdfPmyhArjMnIACHLKSXePCMOZwL5H2Yog5uGotnMEriwpHCkMc4/6u+N+fK7tZYGpCHFsv28aSOOgiVlnUlDUbN3760di3QzCPoSyXVzQOlpzaVnLEmfzd/4vw/HmWNtO+/y91AHeA644ZG4jNu994Juxx1Z806YuM0956uFbWw5v7Ta5uY5gsj6r/NbjLYdfbrcVul9QyZ9p7ZPBBPrZbNVpW8Ur/NXyC9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ntwKeyXM4XE6rPHPWuVjaMwwVqub8b9fVCuoN/Np8IE=;
 b=x0xNULvC3uBWwwR/zN2o1If1KDR977DAnx+ZgX+bmxIJf0x/As2WYBP23woJqvStHLWbHsmSkKU6Xd2QUlM2UGAJ1FDPnM+vgBpaVEruggXn4p0P9hcymB/084unS03gbeok4ZHBmTYZryItDi/E9c740iqAjrWHzwZ+8ihw7zY=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Tamas K Lengyel <tamas@tklengyel.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 24/26] xen/domctl: wrap arch-specific domctl-op with
 CONFIG_MGMT_HYPERCALLS
Thread-Topic: [PATCH v2 24/26] xen/domctl: wrap arch-specific domctl-op with
 CONFIG_MGMT_HYPERCALLS
Thread-Index:
 AQHcIiYjKV/PcPIAQEuJ6TZ/Q8rQNrSN9F6AgC6RCYCAA08OAIAABX1QgAAY8ACAAAaosA==
Date: Mon, 13 Oct 2025 09:25:11 +0000
Message-ID:
 <DM4PR12MB845126F036734F07A462AF54E1EAA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-25-Penny.Zheng@amd.com>
 <56024eb0-b30f-43fd-84b7-6070a1d79cf0@suse.com>
 <DM4PR12MB845153811FA7748CA058EB9AE1ECA@DM4PR12MB8451.namprd12.prod.outlook.com>
 <fa709d35-8c7b-4c27-9bac-52a48f5b3fb3@suse.com>
 <DM4PR12MB8451A7C97D812B25A553985DE1EAA@DM4PR12MB8451.namprd12.prod.outlook.com>
 <b24ca9a0-f388-4e02-b998-d0f9cbb9c5e1@suse.com>
In-Reply-To: <b24ca9a0-f388-4e02-b998-d0f9cbb9c5e1@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-10-13T09:25:05.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|CY8PR12MB7564:EE_
x-ms-office365-filtering-correlation-id: 785d3c6d-f817-4878-2a4a-08de0a3a68e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?d1B6bVJzUWdIaHpsZWQwSHJhZHpLR1pUaTM3SWhGSTVHWWdVQS8wMUlRSnRX?=
 =?utf-8?B?cjl3RmEza1F5K2JxcUtBRnVRbXpJdzVoL25vem1ZOFdNS3BFVzA0OTNkZnE2?=
 =?utf-8?B?di9FUWw3OWpyWTIxM1FGU3hzY1FraXMvT2gvUnJxcU82eDdTZmhoNEtsTHB5?=
 =?utf-8?B?QWFxUm1nL2ZKUndWV1NNVkdGSVVjT2RXT1kzaEZvbUFIVE9PODRsU1diQitu?=
 =?utf-8?B?UGJnS3dUWmRCcnhiQ09oWHdQNHVMVnNIaEg0RldNM2JNNHo5MzFMMXkvUDRO?=
 =?utf-8?B?QTdDZzBYeHFpSy9vRXhsUGd4Yjh5R0xoQ3NmTmxnOUZ2YTM4aW1NN21jK1dG?=
 =?utf-8?B?VU4yZ0NBa3pIVDJKeVordHdPNlJRZHZlb29PSmJaa2N1Tms5aEtJK1pMbjZL?=
 =?utf-8?B?cmtaWXhOK1RRa1pSWTgzQkJpNEQycVYyelpzdUd2KytKekt1ZE9QZGJOTFBO?=
 =?utf-8?B?VysvM2RtazJVdHV1TmdseS8yRkJFVjRQQ2t0QVZHSG9BZTdpNHMvb0xjSkxt?=
 =?utf-8?B?Y2gwV1pSSG9YbHFMQ3Bya0wxK1Z3NHAzYm0zb2ZheXFqdXVLR2E5SWxOZVJG?=
 =?utf-8?B?QzljVjJ5elplbVJkbXpjYnl5WWRSamcwQkxLL0tjV0pYYUQ5aUVZUHgzQnps?=
 =?utf-8?B?Z0tsbm4zRzdFM1ZvRFgvOVBFem54ekIyM3BVVnNwSGFKc2R2M1ZHZkhJbllZ?=
 =?utf-8?B?eXlqK0VCTjVuV0lEN2FtL3BBVjh0bWdTZ3haN2E5TUk1M2RNekc5Q0pmVkFl?=
 =?utf-8?B?bVE1ZitsaTl3dUw5RUtmRGtOQmNCYXp0UzVDWlVLRzIzYy8zTlByMVo1dmFw?=
 =?utf-8?B?ZkFKMlZQZUJSbVdJYTZ4M2c5MTFHaExaS2cwQVBxbXpHNWJXNXA4aHdwaTlR?=
 =?utf-8?B?d1lDd0xTV2NFMm1jdEhITE5VTVp6STlKOEp3S3lLQmxkSkNWR3hIQzduaEl2?=
 =?utf-8?B?V3lEZjkrTjZwb1hWMnQ4bVlRcEk0TlNjNEo4S2NxWjFGTnF3MWluc2NCamsr?=
 =?utf-8?B?NzIvcFNiTy94em96dWVhY3FyRkdXVkZsUjVPcEdIcmNJTkJzMFJvTjJRU2Y0?=
 =?utf-8?B?REh6Uk9nTVFkVEVtOGd2RmJIQ040WCtKKzlEdjhhNDdvWGRzditYVXhaalpx?=
 =?utf-8?B?dC9XOTZxK1h1eFF0Tm1KTWhuWER1Y1lXUWNzb0ROV2JhZTcvRDJBZ1R5TTRF?=
 =?utf-8?B?NW8wcTZpVWVjSHFIUHQrMjFkNk9kdFFpMjQ2TEVLYmJERmRBTnVlenY4S1JO?=
 =?utf-8?B?QzdrQlJyVWpXbVhEZ2tjV0ZPYlMvK1FqVk91SGRtejJPanNzeUpSYUQzQWpH?=
 =?utf-8?B?MmhJbkk0eGtmSGRTcUFoVVBuaUg0d0lyRnhFaE0vcjVlY0haWmQvYlY4VGhx?=
 =?utf-8?B?bnI0Uk1LZWExc3gvWG55Y1NVTVo2WXVubnBwY0RhS2JhYmxGQ3NGY2QvNW92?=
 =?utf-8?B?bWQ3bWdoRXNISXE2UmNCajkyUnI5TkhUeTQ5RmtlZGlIamVhQ3Y2VzZqWUp2?=
 =?utf-8?B?aHNERTh1SG9QTXU3VXpORmkzN09ia21kTnZ1Vkk4Q0hEUTlYNitpbFIwN0t6?=
 =?utf-8?B?ajBUd1I4RnAyUGFjZURpT0UyaVN1Wk9VUzhKODljbUY4TEVVM1NKVnJrM2lT?=
 =?utf-8?B?Y0FOYStUNCtGdzJHSFBzRjlLTVd0SndKN3RZbnJHYzR5M21NbCs3aHdiL3pO?=
 =?utf-8?B?WElZTTI4UXlObHFxdVlMSFMzdFFISWo5Yi9KNTFoeGUyb1NXaFlJem5RSloy?=
 =?utf-8?B?R2o2TzUvQU0vS2VGd0o0WnlvdldRdG8zRng3V1dtbGJnSDdWdmpnMzFMN0RI?=
 =?utf-8?B?czVFZUhGd2YxUEJOcmRjeUdwTEU5OCtzQ09vaVJIL05QSzFWTVoybGQxckt6?=
 =?utf-8?B?OFluQ3ZjTmtScWpoNm9Ta1dkSmx1TGpCWUdORzVydDBIRm5sbDAyaFEwU0RK?=
 =?utf-8?B?OVNNVWgyM2c0ZFNENG1LS3liYlpGblRXbHpEWGFhRyttY2Z3akJmTS90Mmlw?=
 =?utf-8?B?WTFiL25iSEF3aWRRVy9TU3lEUzFYUGRHWjVPK0RUQSt4ZWoyZnZJdUZhVFpk?=
 =?utf-8?Q?PgSLWs?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dGg1RWRYSFJaM21xbENkMmkxTFp5V1k4VEMzU1V4ZVBGbGNmVUpNQ3BnRFNE?=
 =?utf-8?B?ZzFNaUliZWlUMUVWWmV3dHZHN2hSYi80M1ZubU9SM0hKenVJUXBISGJIbWVs?=
 =?utf-8?B?YUt1UHl5QnVKTkxibUQ4RGU5Mm9icm9LNVE3NkREOFZaTy9xTGhnUG1FaHBk?=
 =?utf-8?B?TS9PVWpFdkdwcW1Xcm1Oc01SbUhSc1NOcDZiYVNrMnBQSVoyZGQvc014dFcx?=
 =?utf-8?B?eGRINmZFOW9UNitMQldnU0ltVCtVUVpEbGdBMyszcm91a2hoaTZQZWJ5dEdt?=
 =?utf-8?B?ZGNsczE5eG9YV0hrNFNhZFZiL2dOdlUxN29KRC94U25FTGQwY0xwNmtjY2ZZ?=
 =?utf-8?B?bFMrbHYzNTZJbzJUSWFiRHZEa2JaVjVsN2dlTHBTTEFQbVNwWEpUdWYvOWV4?=
 =?utf-8?B?a3o2SEsxQVc1cHo1QmI5encxclNwMnZZYkU2RnRnY29kdUNpMGdSNG1BZDlK?=
 =?utf-8?B?Vmc1SHBmaDhLeGROajdOMEZDZUFjY3FkVGI5TFNqTWpGd0puUDZhaWJJamZC?=
 =?utf-8?B?U25GOEpXVHNuM0d5V1NsVEYvRDdiaVZLOVNBOXRhMURYSHp4K0Z1RFlNUkJh?=
 =?utf-8?B?aEpOcU5uOVZUTmFRcWRRdVFLeDFMVDFIWURqTU94ZW55QVVtUXhHeGUxclND?=
 =?utf-8?B?NGJRL0RkL3VDcktRbEdNamkwZ21KVW9VZnF4L1hXY0kwTjEybEhDSEhubEVr?=
 =?utf-8?B?NXp6MmZvVE5oVlk1OVRvMXNXVWZKZzVMMSsyclFFZjcveVQwdkxtclIzMjhN?=
 =?utf-8?B?enlXRTUxOVZmdmk1TUljc3F4MG9EZmttZjZzVm5uT2Ftc0ROZDBEcXpzczRo?=
 =?utf-8?B?MVg5QVBSNzNSOEZCWk1aUXhKclliRXdQL3dYSDVZejZyMldmZ1dKTklQMU81?=
 =?utf-8?B?Q3lvSk9HbEg1UWd6c3dQK2szL0RzbGdwMThralQ1MG5ManRRSDdpQUtJV1gy?=
 =?utf-8?B?V3RpVHhHa2ZMaHF1RjNMSzJBdGJ6QmxpUVNUMy9tS1UzSnluYzl1dWFCNXlV?=
 =?utf-8?B?Wm9iT0FiK2lrNU1FdHlmeGNITUcyK1dXZjBzRnhid2ZYeHhuQ1Y4NjlZOEpG?=
 =?utf-8?B?UnF3RWprKzFnUVloOEw3dVNhWUZzaUNRUlFZU3Qva1U1L2F4M3NNVzRvbW41?=
 =?utf-8?B?aUJwSzYzdENuRm9vM0JkclNtZnBZNUlxV0MzWE1Nalp1K3M2bXdhRnpuVGVP?=
 =?utf-8?B?WHJFRWdZeGdhWTMyNnVoM3NQTC9oNUx2c2JkYnBaMHZxaWI2azhKeTh6Zkxn?=
 =?utf-8?B?clQ0a3ZYSFJiUjdRQldJaUh2cmg5VGZjdUNIcFFUdC9LV0lXd0VWVDdPWEpn?=
 =?utf-8?B?ejdWcmJrL0xRQzhFTkNaT2ZZSmlUbHFzTUhGMHR4SnJ1aHRyOWFhOE9sZ091?=
 =?utf-8?B?RXJOWUg1VTJrYkdSRTBjZVFscy9BL1pJN3JXQTAxMGIyT2JpZEkzWG5FcklD?=
 =?utf-8?B?RWJSNjh2MkNyT2dtNjN6M21vQ2xTM1JBRE52Y3p1QzNmaGc1blFrWC9BWTE1?=
 =?utf-8?B?NUhETVN3YmJ1dkFhamlRSU4zWU54Rkd5UkF2R09xU0pTeHBxT01qbU1VWnNQ?=
 =?utf-8?B?TUswUkN5bmIwOEVUamVaZjFyV0Y5aEl3dGRtVU40dU44Zmk4UU5ERzJtM0da?=
 =?utf-8?B?TFdZbnJYOXdrdUlJUm1QYWplK21QU28wRDZnbkhoN2hYVW1tMmM4bnUrcC9X?=
 =?utf-8?B?bnNtTnh2dUl5UGhIS21BampsVUVBWlN5MWpqT3MrejRkbmF3aUVVNmVVc1hq?=
 =?utf-8?B?YlJNK2g4azRGRUJhSFdieFhiKytEWVVaODkzWXdRaWxzTFNRY2dMQnpNR1lo?=
 =?utf-8?B?QnI1NExGek5nc3lBNDkzdmRkV0lPeWxSSHVYRTlpNW5DbGpOWU1EVnQ5cjE4?=
 =?utf-8?B?cW9BVFZDNkphZXFQaGhSVnZ5bXh0UlF2aDRCbHVwclhSVUcwZlZnenI3bTlp?=
 =?utf-8?B?dUJtWHdVM2lDK01qVnJ6Z1dTSDdqT0xEaXhEVHEwZklheDV1cXdyWHdQc1JQ?=
 =?utf-8?B?eXdVRlJDNXNrTktSTkxXbW1RRGNkaFdLZzh5NWU3aEZ6NXh3Ry9tZ3NkUGhK?=
 =?utf-8?B?cG5vQkhIeExWbC9IbHVGQlZ5K1hyT2tLTFJGSlV2bDVQRWtxNThJd2c1TWxS?=
 =?utf-8?Q?tPm4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 785d3c6d-f817-4878-2a4a-08de0a3a68e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2025 09:25:11.7300
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M43elAH8q55s0xyqJX7ts7Pt/cKMTMMY75Ad3ceKkQkutdxdrwmkbEZASO4tHlqkIIkj1kz3hk07w8ZAv4Bs+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7564

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwgT2N0b2JlciAxMywgMjAy
NSA0OjMwIFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+DQo+IENj
OiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEFuZHJldyBDb29wZXINCj4gPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+OyBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAdmF0
ZXMudGVjaD47DQo+IE9yemVsLCBNaWNoYWwgPE1pY2hhbC5PcnplbEBhbWQuY29tPjsgSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IFJvZ2VyIFBhdQ0KPiBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsN
Cj4gQmVydHJhbmQgTWFycXVpcyA8YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPjsgVm9sb2R5bXly
IEJhYmNodWsNCj4gPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPjsgVGFtYXMgSyBMZW5neWVs
IDx0YW1hc0B0a2xlbmd5ZWwuY29tPjsNCj4gRGFuaWVsIFAuIFNtaXRoIDxkcHNtaXRoQGFwZXJ0
dXNzb2x1dGlvbnMuY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjIgMjQvMjZdIHhlbi9kb21jdGw6IHdyYXAgYXJjaC1zcGVjaWZpYyBk
b21jdGwtb3Agd2l0aA0KPiBDT05GSUdfTUdNVF9IWVBFUkNBTExTDQo+DQo+IE9uIDEzLjEwLjIw
MjUgMDk6MTgsIFBlbm55LCBaaGVuZyB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gPj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+PiBT
ZW50OiBNb25kYXksIE9jdG9iZXIgMTMsIDIwMjUgMjo0MSBQTQ0KPiA+Pg0KPiA+PiBPbiAxMS4x
MC4yMDI1IDA4OjQ0LCBQZW5ueSwgWmhlbmcgd3JvdGU6DQo+ID4+Pj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gPj4+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
DQo+ID4+Pj4gU2VudDogVGh1cnNkYXksIFNlcHRlbWJlciAxMSwgMjAyNSA5OjAzIFBNDQo+ID4+
Pj4NCj4gPj4+Pj4gLS0tIGEveGVuL2xpYi94ODYvTWFrZWZpbGUNCj4gPj4+Pj4gKysrIGIveGVu
L2xpYi94ODYvTWFrZWZpbGUNCj4gPj4+Pj4gQEAgLTEsMyArMSwzIEBADQo+ID4+Pj4+ICBvYmot
eSArPSBjcHVpZC5vDQo+ID4+Pj4+ICBvYmoteSArPSBtc3Iubw0KPiA+Pj4+PiAtb2JqLXkgKz0g
cG9saWN5Lm8NCj4gPj4+Pj4gK29iai0kKENPTkZJR19NR01UX0hZUEVSQ0FMTFMpICs9IHBvbGlj
eS5vDQo+ID4+Pj4NCj4gPj4+PiBGYWlyIHBhcnRzIG9mIGNwdWlkLmMgYWxzbyBiZWNvbWUgdW5y
ZWFjaGFibGUuIEFuZCBhbGwgb2YgbXNyLmMgYWZhaWNzLg0KPiA+Pj4+DQo+ID4+Pg0KPiA+Pj4g
SSBqdXN0IGZvdW5kIHRoYXQgdGhlIGZ1bmN0aW9ucyBkZWZpbmVkIGhlcmUsIGFzIGhlbHBlcnMv
bGlicmFyaWVzLA0KPiA+Pj4gYXJlIHVzZWQgaW4NCj4gPj4gdG9vbHMvbGlicy9ndWVzdC94Z19j
cHVpZF94ODYuYyB0b28uIEVtbW0sIHRvIG1ha2UgY29tcGlsZXIgaGFwcHksIEkNCj4gPj4gc3Rp
bGwgbmVlZCB0byBwcm92aWRlIHN0dWJzIGZvciB0aGVtIHdoZW4gTUdNVF9IWVBFUkNBTExTPW4u
IE9yIGFueQ0KPiBiZXR0ZXIgc3VnZ2VzdGlvbj8NCj4gPj4NCj4gPj4gSG93IGRvZXMgdGhlIE1h
a2VmaWxlIGNoYW5nZSBoZXJlIGFmZmVjdCB0b29scy9saWJzL2d1ZXN0Lz8gV2hhdA0KPiA+PiB3
b3VsZCB5b3UgbmVlZCBzdHVicyBmb3IgdGhlcmU/DQo+ID4+DQo+ID4NCj4gPiBMaWtlIEZ1bmN0
aW9uIHhjX2NwdV9wb2xpY3lfaXNfY29tcGF0aWJsZSgpIGluIHRvb2xzL2xpYnMvZ3Vlc3QveGdf
Y3B1aWRfeDg2LmMNCj4gaXMgYWxzbyB1c2luZyB4ODZfY3B1X3BvbGljaWVzX2FyZV9jb21wYXRp
YmxlKCkgdG8gZG8gdGhlIGNvbXBhcmlzb24gYmV0d2Vlbg0KPiBob3N0IGFuZCBndWVzdC4gSWYg
bWFraW5nIHhlbi9saWIveDg2L3Bsb2N5Lm8gZ3VhcmRlZCBieSBNR01UX0hZUEVSQ0FMTFMsDQo+
IHdlIHdpbGwgaGF2ZSAidW5kZWZpbmVkIHJlZmVyZW5jZSAiIGVycm9yLiBJbW8sIGl0IGlzIG5v
dCBzdWl0YWJsZSB0byBndWFyZCBmaWxlcw0KPiB0b29scy9saWJzL2d1ZXN0L3hnX2NwdWlkX3g4
Ni5vIHdpdGggTUdNVF9IWVBFUkNBTExTLg0KPg0KPiBDb3JyZWN0LCBidXQgSSBzdGlsbCBkb24n
dCBzZWUgd2hhdCB5b3UncmUgZ2V0dGluZyBhdC4gVGhpcyBNYWtlZmlsZSBpcyB1c2VkIGluIHRo
ZQ0KPiBoeXBlcnZpc29yIGJ1aWxkIG9ubHkuIEluIHRvb2xzL2xpYnMvZ3Vlc3QvTWFrZWZpbGUu
Y29tbW9uIHdlIGhhdmUNCj4NCj4gaWZlcSAoJChDT05GSUdfWDg2KSx5KSAjIEFkZCBsaWJ4ODYg
dG8gdGhlIGJ1aWxkIHZwYXRoICUuYyAuLi8uLi8uLi94ZW4vbGliL3g4Ng0KPg0KPiBPQkpTLXkg
ICAgICAgICAgICAgICAgICs9IGNwdWlkLm8gbXNyLm8gcG9saWN5Lm8NCj4gZW5kaWYNCj4NCg0K
T2gsIHRydWUuLi4NClRoZXkgYXJlIHNlcGFyYXRlbHkgY29tcGlsZWQgd2l0aCBkaWZmZXJlbnQg
TWFrZWZpbGUuDQpJdCBpcyBmYWlyIHBhcnRzIG9mIGNwdWlkLmMoeDg2X2NwdWlkX2NvcHlfdG97
LGZyb219X2J1ZmZlcikgd2hpY2ggZ290ICJ1bmRlZmluZWQgcmVmZXJlbmNlIi4gTGV0cyBvbWl0
IHRoaXMgcGFydCBvZiBjaGFuZ2UuDQoNCj4gSmFuDQo=

