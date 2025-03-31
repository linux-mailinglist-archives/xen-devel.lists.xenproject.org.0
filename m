Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01577A76CC1
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 20:11:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932901.1334958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzJbA-0006EE-9b; Mon, 31 Mar 2025 18:11:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932901.1334958; Mon, 31 Mar 2025 18:11:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzJbA-0006Bt-70; Mon, 31 Mar 2025 18:11:00 +0000
Received: by outflank-mailman (input) for mailman id 932901;
 Mon, 31 Mar 2025 18:10:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Diii=WS=epam.com=Oleksandr_Tyshchenko@srs-se1.protection.inumbo.net>)
 id 1tzJb9-00069o-D8
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 18:10:59 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20621.outbound.protection.outlook.com
 [2a01:111:f403:260c::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f08204b-0e5b-11f0-9ea7-5ba50f476ded;
 Mon, 31 Mar 2025 20:10:58 +0200 (CEST)
Received: from PR3PR03MB6412.eurprd03.prod.outlook.com (2603:10a6:102:7d::8)
 by PAVPR03MB9017.eurprd03.prod.outlook.com (2603:10a6:102:2fe::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 18:10:55 +0000
Received: from PR3PR03MB6412.eurprd03.prod.outlook.com
 ([fe80::2887:9068:38f6:8340]) by PR3PR03MB6412.eurprd03.prod.outlook.com
 ([fe80::2887:9068:38f6:8340%4]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 18:10:55 +0000
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
X-Inumbo-ID: 7f08204b-0e5b-11f0-9ea7-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ns7dyX28l4SD8Tcdwn18id3WvotiCeiv8GvmgzBIE/ENzi8YzJ/azfUIPMdSldv40solMgoUEu4pSC3PqYnW6rXZsH12F69rZk3EfJhN+C1tWx7jgaxTT89nVmsM1OhBZ3TMWJLcykpR4pXXlIZxFCGCTqGH8wwrE9V499s+XnPWAqjCITHAfdMmAjPF6hfwbY5lKUlgZq8Rmz8T7z/Mqc8n9XwloD7B8VwfA6QYdWSZh18N6OPXKk17BpduWY1YRPswUn6ULbRTccqXoI7aThOKM+DlRY6Lrv047P3ZxLppb61NYJ4W6AbFW4KfmUaqoRgOfsPRA+xhVZ4wyY9n9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lPJ3QfqLaaMc4q9iByVBD+YBC2j9M93QspyxbXFm49U=;
 b=RedZuFEL+SSA11s6ibj+GBdrPJtE8bkIUhBxVBDhHyXuh3Mv5ShJYk5OJ4PjYIIm3frkbBiFTNl/jPku5E2JGyWuqSSRgWKZasInC2CcYsbmSfu9yo/BnaGaPG+mrGNgDgg6kmPlQKi8RVgxwA19GyhGK5BwMc6lX+CKPBjN7njIm9598Mgf5X2osL9qv2ntBD8BxviGbbHWsumrcgIuT7PKH7qKVRtOsV2dhXlNeWylv3g5vWpizKwMJM4jM+Z4omwGx26J/Exsm+rIcAp6AckAz3OtqBH3dAStEK46kZtJQJ7EDOPyNDqeb3G0LrlA98MKc9vOFjpGsHyxGc7hhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lPJ3QfqLaaMc4q9iByVBD+YBC2j9M93QspyxbXFm49U=;
 b=rZl3iQ3GG6hWnu6HruW8tAsPoTIiAMXxQj0jkIeo+c1x84AVvyPVEzKDZy8H7Q07AjW9VjvbZApj/EGTB2510trkVvm6GgDqgmxP5EGM+vr/v54EtuJ6dWTBBvSVp0fN0sv2PvFBGg0ygG2MhDwt0u9ogl/rhjHIE+JiV/ylbWJzFzfGKfFvLdfV1YEjlaI3yUggaJ5df4NLbVcLFV5Euz/p5BrU54udwhja0ZQiVJMsuvEAtVwqWjGNrqO6RXa5yDTDozL6eSXvUmTqnbBQBGeagsPv+1ee0MBbBMBcdv69Z6K4WyHR9mxjEZTNQr8LDM/tNllzBxfZSlrbcTwCxA==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, "Orzel, Michal"
	<michal.orzel@amd.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH V2] xen/arm: Initialize acpi_disabled to true during
 declaration
Thread-Topic: [PATCH V2] xen/arm: Initialize acpi_disabled to true during
 declaration
Thread-Index:
 AQHbnZfMrs+h0o/uEkuTNWO41qxIcLOD+IUAgAADaoCAAAM8AIAABQEAgAABHgCAAAyVAIABDTwAgAAu+YCAALafgIAHkJqA
Date: Mon, 31 Mar 2025 18:10:55 +0000
Message-ID: <2f906610-2b6c-4458-b3d5-62f0ce2051fb@epam.com>
References: <20250325150842.2015968-1-oleksandr_tyshchenko@epam.com>
 <9b96395c-ca88-483b-be06-b7768b552983@xen.org>
 <4e048dad-bd12-4526-ae62-f424bdb8271b@amd.com>
 <db47de86-b2c1-4860-9212-49c051e1bebd@xen.org>
 <24809d8d-5d95-4527-89e1-e82889d58e3f@epam.com>
 <180d0f62-cab1-4fb5-a09f-c82b117ff554@xen.org>
 <340d58e8-b4f0-43ce-8925-e509282bccf0@epam.com>
 <48c3c175-8249-4e9c-91b2-babc227f68fc@amd.com>
 <b3a91dc6-0133-4b9a-bc15-7f1e1272f940@epam.com>
 <1f72a6e2-c573-43b1-b1e9-b7bf16e07bd2@xen.org>
In-Reply-To: <1f72a6e2-c573-43b1-b1e9-b7bf16e07bd2@xen.org>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3PR03MB6412:EE_|PAVPR03MB9017:EE_
x-ms-office365-filtering-correlation-id: 42f94d7e-d1f2-462b-9c8c-08dd707f618a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WkNmN2pBZVp6Y2lHc1RkUGxFbzdJTUgwZ0RnVGlMV2dtUUx5cTBlWmNVek0y?=
 =?utf-8?B?aVB3MmFTV3FHUWZqZWF3c2pDZHF4dktSV3l4eUZtVmtobjVvdzhvRzhBeE1F?=
 =?utf-8?B?V2FSZTZvVkkrc0Z3Yk50UjNQV25DNWpzbSt0cFJwQTFHa3VLSEFONWthUmkz?=
 =?utf-8?B?cUVCcVdDRnJYMHN6ZDREUXlSR1c3NUpGb1JucGRBVjlucURKWkszbUo3ZXhD?=
 =?utf-8?B?S1lQYXNVOFlweVhmZjNjaFBLRWdocFFwaklCQWVPQVEwcXlNVExXT2swTTdl?=
 =?utf-8?B?dUk0NGtHNzk1WGc0SFpuZWczRlkxOGpDZmVSYnFkMHNuZHdjZHljdW5URlRh?=
 =?utf-8?B?S0grTkdyczJESSt1S09qZkpZR1c2SW5JY1AzTVA3NTJTQklFS3h6NHhOUHpT?=
 =?utf-8?B?WFdONmtEQWV4L3U0eVBiT28veWFhb0RYYk5wTGRISHlQYUhqM1RkMUVqMHBF?=
 =?utf-8?B?RjdJQWM3d0l4T2M0cHhGVVpKTXBEMnl0Q0hRdFF1QU1yN0pTdnRNWVNjRVpG?=
 =?utf-8?B?T0FRRGhXNFFFL0d4S1ozYjVvR1owc3ozSTBiSWtCM0lRcTl2L1JHQnl1bS9y?=
 =?utf-8?B?NWJFL01ZZFNmWVY0VjkxTno3YnVIZWlYZzJycnI3UUxFQTJ6dHN2YXdHSklS?=
 =?utf-8?B?RFVoWVl0OUc4Z0hRMlFjc3RaTDMyaTYrbW5qZEtEdDZUWmxhTmZselFQak5O?=
 =?utf-8?B?Q0NZOUx6Qld6TzhtWG5Fc0VjK1pkNFU5eUMxYUdLSlg1OGpXYXcxWEQ1MmYx?=
 =?utf-8?B?RWFWTklDU3dzdnprYlBOaWpSSk01RXpEblZ0NVh5QTV5cGZHb0dXTy9MYS9j?=
 =?utf-8?B?S3piMTBnSnh3aEZHbUZMZ01jeUZ6MXg5UHpjcGdrcW4zUWdad3NSMEJCRW5T?=
 =?utf-8?B?cTVEVWpUTVVHWHM5dTl2QjYxbDRLeFFOak9QU0V1VmZVR28wNHdTWnFDRFkz?=
 =?utf-8?B?MGErUGJHZldvbmtzaUpRblJCWDhnSHZZcTdnUWlSbnJWL3BuVkdQRlJkU2p2?=
 =?utf-8?B?dUV3MmJXQzhDb2tCM2h1djM4WkQzS1BQLzNieEo5WEJWMFBEQXJNVTE1RGp5?=
 =?utf-8?B?ZzJIY2I0T0ZuUzFINnErL0FQb3o5NkFJMkxrSHR4eDZZb0Y2LzByZGc2YTNQ?=
 =?utf-8?B?Qko2MzZRVlNzb0dSTFBXelkrN0wyQ1p0WDRvUmo1Q1FHZXk4OS9JbDhER2lK?=
 =?utf-8?B?c3k0N3ByRnVqRlUvZG9CS3hwekhoMjBQSXJqMUJheHFPK0dyMWdUVGRNQmk3?=
 =?utf-8?B?NUU5MFhlRnUrTlB1dFM2WGY2T2luQ1ozaTJRNFN6eFhkd25zOW9HeDdUdVN6?=
 =?utf-8?B?cGR1MHZOcGpwZmtQa2NiOVZlcWhONEU0dEFaZE5oSVlpT1JKRkhXaE1nTDVL?=
 =?utf-8?B?VlFLc0dDaTFldURIYStQcDZ6UzBDN0xNK3Nqa09NcVFnb0J4VS9Bc2NlK21I?=
 =?utf-8?B?alFlZnBNUXRTV2h3Y2pRZHVHZEVoS0VwYnRtS05EZ1NlVWY3TC8yL0RNSkNt?=
 =?utf-8?B?dWFuUnZFeUdEdWhDZlhOeGlFWkdjdkF0UzdINXNMeERRRng1Zk84c01BMURS?=
 =?utf-8?B?R2xpQWR3dlAxT0RCYVhJUGdXTkdSV3NqWnJKUnpKTGErTUhjcHhZbXB6ZFFk?=
 =?utf-8?B?ajhpa0VNS08wM2NUWDlGQUNZaUpuay9RZ0VDbkhNVUptZWRkRTJRRUZYbTRY?=
 =?utf-8?B?UHQ4UCtvaGc5b2kvTE5WZHNvVlJSMXNheXRzQTViU0wrWmFseTRGSW1MdnVV?=
 =?utf-8?B?aTlaVmYxakFmWHY0a0M5T0trdVJhWnlwNXM2WW5oWG9SOTVkcytqcnVWZXJQ?=
 =?utf-8?B?dHlTNWJFK1MvTXN0ZzY1RFg1aGJ2Wm9hK2NSR1dWOTZ0YXVyUWtsZ3UzMmw3?=
 =?utf-8?B?Ui9UTGszTElaUkkzOGRwbVFVZjF6b0VoR1hUZ2prUktnSkV0eGUxWHdodHU5?=
 =?utf-8?Q?MNHEsT6Ozd/BMgn6RquPMxzZI39rUdVd?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR03MB6412.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d0w5NHMxVFJJanVhS0xjS3l5eWFNSTdTckVsYVBrN0Q3Z2d2STJQTjhFV2JT?=
 =?utf-8?B?V2M0SnpUSjVCVVlaMCtQd0xib0krUWRPQTdoOG5naDBaWTY3MlZaRjRkQUhR?=
 =?utf-8?B?Vy96d3gzbnlkWkZSbUVjb0Z4V2FnVmlCeElYNGZ3UVE0TVdDb1Zld0NtV2dJ?=
 =?utf-8?B?Tk1pWnAydXByK2Q3Z29zM0poNXR1MkJZYy9PT3F5am93aWpWSE1JcVBMYnNo?=
 =?utf-8?B?MEpGL1YvYm5PUTROUlVKQy9YNklhSnoxbnNvOUlobjRmYnpmMEtSTDJHOGQ2?=
 =?utf-8?B?eGRpcSt3emw5b1V0cGZGMHZXTnpudEpDYTRycEhHQ2FHc2doZHNoZHlaM0FP?=
 =?utf-8?B?UmEwL0xPSTRwZXVMak1tYWlBWTNwUlUwS05kUUpONC9RSitHQk4rR0JxWlNB?=
 =?utf-8?B?cnMxTmw3MkZEcVRxZHZjQVpEZklMQWk0RDJqSkhtZmVGUm14OURZaTA4VGZU?=
 =?utf-8?B?WHVwVUF3a2dGR3EyUFdDa29mRURFRVgrNTMxSE4vdVZsTXBaTDFTa3JCdUZi?=
 =?utf-8?B?a3hlTmVwMGFkdFNyeG05QWRJc2YvV3BEL3ROYnBZV3NJYXpoZzBmdEhhSlBr?=
 =?utf-8?B?dUJiMFloRXZZc3NiN2FTZ3JIQnlpTFpTbnNpTWNmZWQ1bFozVDlhQTlFcjgy?=
 =?utf-8?B?WG1MRG1LYWpiaEsvSE9zUXZsZHFOR2g3eU02RVBxc3BKMlN2UGo5TDVYSXZC?=
 =?utf-8?B?Qy9pQ0ZQZldqMU1uYTRwQXlRdG44SEJGWlppa1hadWNVbGtVQ3pYbzhJZmlQ?=
 =?utf-8?B?ODlPbUtkc2JNT2ZFaWIwdWtBU2FMdFIraGpjcEY0SVZhWE5MWWJWTVpUYzVl?=
 =?utf-8?B?aHhRZDU3TzhCWW1xYnRwUzdpeWlrbVBudWtkSEVad09YMGRZVTU0MkhoWUR2?=
 =?utf-8?B?SUJKL215cnlqUVhCWmZkYmNmWHEyNTI4cGhWK0ltREVEck8rVXZId2grWnBt?=
 =?utf-8?B?aDI2TmZDZC9WU1UxODhxOVhwZDBlbTZrMGpKM3RFRXhjcjVUUG1nL3JMaHFH?=
 =?utf-8?B?dXhEdGMvem1pZVZzUXNTOXBqNVpyUDhxaUJNajl1bFdaSlZLRGJqcjY5Zkxs?=
 =?utf-8?B?aGdGVjdFMmxsMzdYbE1aRktqV0xndCtsaFNsc20wTmc0SlpkVlltRUlzeCtP?=
 =?utf-8?B?cy9Zczc2T3d5Wnk0Z3F2ZXc1ZTY2Kys2eTVESnVJdU9KKzRrMnFMQk5Id1R5?=
 =?utf-8?B?V1JNZmxOV0dnQ2trc2lIWUo1UE5HUTdHT0xIbnVhTjFBUnpCcDg0anlyUWpQ?=
 =?utf-8?B?RC90ckg3VDYwMVVyaXJCcEo3VmpwWGp2MWJnaktqb3Rqc3dlbFFuNTVCcTd1?=
 =?utf-8?B?OUdvTHR5Z3I2ZDh1MkVBU05qYWlZUTRqQ2ZpRUNnU3lCNWdSejhQSWx2eHVi?=
 =?utf-8?B?VFVOTE5Yc2JrcHdNUnhJZUNpcWxYN1ZIQ3pCZVRnQmpIdklYTDFJdEdjcUZy?=
 =?utf-8?B?ZXAvQzUzV2xYRGkwaGp5Sys2N2MrTkExa1NSR1R4THRwSE5zVG16MlVCUlAw?=
 =?utf-8?B?YnRnWTFDWmJQT3lCRjFFOTN3WSswbnNydTEyS3lzL0YyTWVWc2didDRFOEJT?=
 =?utf-8?B?ck5mTmh5WVlneHlTakdPeHFzcW5yTE5yQmYxbVdOSCszeC9mazJoZVI2ZzJN?=
 =?utf-8?B?akdud3Q0SWQycEVKMDBKLzhlVEt6WWxtN2wraFhua2IzdHIvSEpWaXRnS2F6?=
 =?utf-8?B?MDJHR3pEUTdnZ2xGUVJsdFYyUUFiN2tEMytlWEFiYnZpbGdDY3RLbDVFQlls?=
 =?utf-8?B?SFRRWGEzMEt6bGQ1WFFxbFRHWGQ0MnRwYVN5Q0xjM0pVSVRPYUYrQ3dnbE9X?=
 =?utf-8?B?V0lmMG0yN2dBRjdtdC8vM0lMano4MXlSL3Bab2pTU3lFNDhMdXlBNFFnODJi?=
 =?utf-8?B?OFBXM0kwdWdFbFBtcXFsd1dTTWE4Qi9mdStqaFlrQVdvN0tpM2gvdUJ5RmRm?=
 =?utf-8?B?Yng5Y2N5NzIzNlphemE0SmtxWXFIZFBOR0dxa1hWcGRFQmtWZXRleE5oOHNh?=
 =?utf-8?B?ZDhOS0dzejhCaXBJU1crUWZZRlpBVWw0VTJ1Mk5Uc0FkRG9ydlBRNWdSZll4?=
 =?utf-8?B?SUFDdXVjRVdwSzcvY2ljb0w2SmpwTzd6a2l2eStmMWxXeTNlY2hpQjBkSWEx?=
 =?utf-8?B?M1lVWk9uOEJUYUhtRFJQc2IzbC9SWXJVMGFXNkhncUNZZ2pVRVRxdVNRVFVo?=
 =?utf-8?Q?pGv2RFZnn1WSCOxD57qY0N4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E4C3154433A8E04386E869D8CEC7D3EA@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3PR03MB6412.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42f94d7e-d1f2-462b-9c8c-08dd707f618a
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 18:10:55.5585
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NBWy9jya+ew5lPV4MMh/15g74QSNMUCJw8WlF+CeyCmLTxHleuCwe/qCUpwFfb9OdzlDFvUbxb6Qr+rVoaOy1wz8ZMZuCLUsI0SuRZlbRok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9017

DQoNCk9uIDI3LjAzLjI1IDAwOjM5LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+IEhpIE9sZWtzYW5k
ciwNCg0KSGVsbG8gSnVsaWVuDQoNCj4gDQo+IE9uIDI2LzAzLzIwMjUgMTE6NDUsIE9sZWtzYW5k
ciBUeXNoY2hlbmtvIHdyb3RlOg0KPj4gQWxzbyBpdCBpcyBub3QgZW50aXJlbHkgY2xlYXIgd2hh
dCB3ZSBzaG91bGQgZG8gd2l0aCBhY3BpX2Rpc2FibGVkPXRydWUNCj4+IGR1cmluZyBkZWNsYXJh
dGlvbiAod2hhdCBjdXJyZW50IHBhdGNoIGRvZXMpLCBldmVuIGlmIHdlIGRlY2lkZWQgdG8gZ28N
Cj4+IHdpdGggc3BsaXR0aW5nIHNob3VsZCB3ZSByZXRhaW4gdGhhdCBjaGFuZ2U/DQo+IA0KPiBJ
dCBzaG91bGQgbm90IGJlIG5lY2Vzc2FyeS4gDQoNClRoYW5rcyBmb3IgdGhlIGNsYXJpZmljYXRp
b24uDQoNCkJ1dCBJIHdpbGwgbGVhdmUgdXAgdG8geW91IHdoZXRoZXIgeW91IHdhbnQNCj4gdG8g
dXBzdHJlYW0gdGhpcyBwYXRjaC4gQWx0aG91Z2gsIEkgd2lsbCBuZWVkIGEgY29tbWl0IHJld29y
ZGluZy4NCg0KSSB3b3VsZCBwcmVmZXIgbm90IHRvIHNwZW5kIHRpbWUgb24gdGhpcy4NCg0KDQo+
IA0KPiBDaGVlcnMsDQo+IA==

