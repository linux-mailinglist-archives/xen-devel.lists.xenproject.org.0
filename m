Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC95AE8EF4
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 21:48:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1025497.1401039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUW5P-0000ae-9M; Wed, 25 Jun 2025 19:47:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1025497.1401039; Wed, 25 Jun 2025 19:47:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUW5P-0000Z6-5b; Wed, 25 Jun 2025 19:47:11 +0000
Received: by outflank-mailman (input) for mailman id 1025497;
 Wed, 25 Jun 2025 19:47:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dzS6=ZI=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1uUW5N-0000Z0-IC
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 19:47:09 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c003ca1-51fd-11f0-b894-0df219b8e170;
 Wed, 25 Jun 2025 21:47:05 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by AS8PR03MB6869.eurprd03.prod.outlook.com (2603:10a6:20b:23f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 19:47:03 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%4]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 19:47:03 +0000
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
X-Inumbo-ID: 2c003ca1-51fd-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iK7Yxtun2i6o05Wd1ERXr/9bIYZscElpKQjzz4zhqyDSBD87Nqed6gE7a0y3OPlPyX2tG7C6EWeQm1vAy4F2nUAJuoi9tgYBEO+FB+YPE4W5rAU48vFCyj2t2Tmsr1UhXjTE/MoLx3/xyZG6p5FcQwccC/fnZiIR5ZkOCV+Cuh14TB3YujaRU3DLD5h0lUQ7dK1cNJTLLtzWx0w0dUFLXPkWH2CWj/Md4caxMVvvav9gyp/28Uywzbafgm34H+4nlrZlAu63jZz4PvXMkPfx90LhZbEXyH0EI8MxwrLYbqhtY+MP5i0Xa4U2C4AUU/lbxns1ZKaIpepvFkLYUU+IYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pq0deBK2atO06y7P8Q70iCCGe0BtI6RVI0qpn1FQ574=;
 b=SrGpbJ87hgH3Uoml7WpONy54Dd1PaxsR/PXkQOt5cXdayL8fNPxZlliZnPC9rP9KhHITG1N6hrsKXoFO5oAAOzAD5Zj3z6ecLlk0xQjvUwtLI60rswJp/SRmf2SjyX1rIR5Unk/F6+vNhUljAPJCSsHFEpMccUStDxuEDbr/J1q7YO8uKiXG43oqU8E100nPhZj8MFXQQOyuimHB0M6sEfK2AZ2RT7dHnmCtEhv8d2Aq6rxr0J9U/FjDA1Pn47LeJ8d/P3a5k2ZxTlXcevJ339fAWB/14qiZ1+86e1mRL4x6TepNw7MoPM3i5l/Xpp4BrvcgD1YtvbXSUE8LhRewIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pq0deBK2atO06y7P8Q70iCCGe0BtI6RVI0qpn1FQ574=;
 b=daV5ezEewnldWJHzUtK7ckISaW+FGcECZd+FOoQl6STuM1NXM9fJtEWlSpy0Js718Y7+GoRmCZYRJQzjM2j6HpZe+WUWKYYSpedsBEICJlRKON/ADbcaxxaHqJLPpFnG/s4uyMS9bcrQfvmN0P3kua1ntAL41lvm1uEAGiFC0dEgzlnz0JZ89I4Z/tj7ukblthIppoC9yyCp4KQICiI1EvavioakB3lVp/wWEnUL20sDB1M8WSQ6JeGKWIw6qT2HYQBdbaFze5Z+53J64UiQnl+mjSxSZcHMxTProTayAWVHrAxdDlJiqd13C6RwVnRPB+u7j8DCX2OiGfo+J5guBg==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: Re: [RFC PATCH v4 6/8] xen/arm: scmi: introduce SCI SCMI SMC
 multi-agent driver
Thread-Topic: [RFC PATCH v4 6/8] xen/arm: scmi: introduce SCI SCMI SMC
 multi-agent driver
Thread-Index:
 AQHbyNXPHUV4T01ZEEC9Uxm0LaLKHbPgqpIAgB7nygCACJlwgIACrSiAgAUbw4CABI1zgA==
Date: Wed, 25 Jun 2025 19:47:02 +0000
Message-ID: <842fe403-5350-4bae-8fbc-736322b156d7@epam.com>
References: <cover.1747669845.git.oleksii_moisieiev@epam.com>
 <318044ae12f13b6b297b3f5fda577a1a6cd143da.1747669845.git.oleksii_moisieiev@epam.com>
 <alpine.DEB.2.22.394.2505231114050.147219@ubuntu-linux-20-04-desktop>
 <6080ff71-2634-4269-8a63-fdafdf03f01b@epam.com>
 <alpine.DEB.2.22.394.2506171556520.1780597@ubuntu-linux-20-04-desktop>
 <769aad0a-8bee-45c6-8c5c-35f9d47ed8ae@epam.com>
 <alpine.DEB.2.22.394.2506221432421.8066@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2506221432421.8066@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|AS8PR03MB6869:EE_
x-ms-office365-filtering-correlation-id: 060120dd-2752-4b34-5634-08ddb4210eb0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?M3BHR0hjQnQ2clBGWTczSWF4bXRweWIrZzlGN2R5RTd5Y1JHOXN4enlsVExI?=
 =?utf-8?B?cU1RNFg4ZFQ0eE51c29XTTNiN09PZDRCdW81VnJCRW5kUFhKLzAyT3VXck1X?=
 =?utf-8?B?K0hwcjhBc3UzeUZ1aW5vLzlGR0puRFFCQWt1MlAySnByL0ROYkRNT1pmM1lL?=
 =?utf-8?B?ZWlsRXVIdEJsMmtWSjM5REs0anlrTDNUYmZ0N0xGdlhtZThQNXV5VFQ3Mkox?=
 =?utf-8?B?NGV1bWp5YW1wcUZvMlQyZlpOangvNTZETHU0c1dzUG1lT3RDbGpHMUI1cWxt?=
 =?utf-8?B?T0pjNTJ5ZHkxUVk4QmszQ2U3Nm1GK29WT3pzWitCR0lMSGUxbGN2UVJFa0N4?=
 =?utf-8?B?YVlLSjBzK295anVhRUhZSyt4SFNWd3JrRmZJWTBYcjNVaEV3eTlObnk1Z0V6?=
 =?utf-8?B?NnZrd0dSUkdXcWhmSitDaHBybHpXSzFxZmN0OWpUUU16Y25neldDY1hNNG1S?=
 =?utf-8?B?QVZneG1UMzFIVCtJUGpJSkxKMlJ2Y20xRk9Jb01rejIwN3VtT0I0UURXVXdu?=
 =?utf-8?B?QzV1Z2ZGZDZ4aitidlN2UndnV1hlcjRZeVY5V0Q3WWYrWVMvWkVwSTJmV0Mr?=
 =?utf-8?B?REFwSWxNbG5YR1NaMHFEdlFFYzVvdUg3c3hXeE5iclNJL0tHT0NxL1V6Rmho?=
 =?utf-8?B?YmlLVG1yR281M01kdzVlMnFOUEFXTzBnWHBWUmlLRXVmL3ptVGxQdERqM0Fy?=
 =?utf-8?B?QlorMTVGUkJDc1h3S0dqdlNwMEVWK0E5TnZSMmczM1BvZzlFd1MrS3RpYkZa?=
 =?utf-8?B?M2JyNkpNSmMrNnl5aUhMZGhrNUNFZHhBQm8rYi9BUlc1UXRWL3V2UFZ0T1J2?=
 =?utf-8?B?UFgyZUJEOUF0QUNnaFBWdXBZTWlWeGd5SUVPak90T215WmlMWWl4YStRS1o0?=
 =?utf-8?B?a2x1ZEN2WUVyV1pDNndRRkJWWWEzQ1lPNjNKZmdXSDk5ekh5UkFMVUlFNW5X?=
 =?utf-8?B?ajFmUEF1dWFhMlVvWktmcGFLRjgrN3BMYnBMSExiamZYNkI1S25TZDEwdzc3?=
 =?utf-8?B?T2pnNzJNR09lczh2VVQ5cHdLT2M3dVZIRG5vMmdoVm5mRUhyeURyVSs3VWZZ?=
 =?utf-8?B?UXVLeGM5ZlcvYXAzMFJiam55SzVJSmErK0hJcTFYN0VJcHhPV0tNektZUG9w?=
 =?utf-8?B?b1BhcGFNRDN1REtGakRZNjFEa1drZ1h2QThQMlNpbzVQVS9MQm9Cc2l1Unps?=
 =?utf-8?B?WHpMSkYveHpZU05sWDBoRmliY25XbmZRekhuaHo1dmNmUDF1ekI5b1hRUEJG?=
 =?utf-8?B?MWJ0MGc3SUlGaSszbHBFdDF1NzE3VFpHalBJVFRpV1EwSkNQekZOZWNKMkVE?=
 =?utf-8?B?a3pjL2ZzWFJDUENVVG5HN0RPeUJ1ZDBpR3hWOU9FL2krWS9iZTdXaXA3ZFJw?=
 =?utf-8?B?TkV3T0Z5UzFpU3VKa3BPVHltOC9QVmRuSFk0bGNXSmRKVExvSVAzY0JNdENU?=
 =?utf-8?B?WmppMGdBdytEVnRLMzM1S3orc3dxaldyRHZRcy9lVzlxZXBoNHUybjhKQjhG?=
 =?utf-8?B?dElwanBLRjNFSllUS3A0MlVSeWVOdkZsZHBiZjJuYVRWUTQzQ3lndHpySGFt?=
 =?utf-8?B?R3BlU2xaOW1HZ3BuTmdmTjJWNUxzelBCWTc0WFFjcGdRZk5kUnNaY3g3TGF5?=
 =?utf-8?B?MTc0QUliTGFnRzdZUnZxUGJVd1RBUmgxZjNjVjJ3bHNkSXFpNmIxTHVsbTdV?=
 =?utf-8?B?TWtLRVBTM1hrUFRjaGN3cDhWUmgrUEZOWDZMdW5mU0ZFQlAxMWVPdHYrUDhP?=
 =?utf-8?B?UjRvSHhyOTFtUTN5VFN3eDRkSmc2RU9SU1hiZ2REK2YvdXRHcUNyMUhFZE45?=
 =?utf-8?B?RTZ6cUFQb2gxam5lTlo0d3lnVWd6Rm1PRkEyd0k2WjVzQnhIcW44NEx4VCtO?=
 =?utf-8?B?OG4xS3pMVFJJU09aYmZtNFRuU0NOYnAza1NCcW9ZdXJKdXZlUGNEY2VwYWdT?=
 =?utf-8?Q?bHclW8dTCFc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NUJKQmtGcnhoUGk0WnZkYlowV2lodzZQNU5jeSt6bHRBY1RkWlh5UkpkTi90?=
 =?utf-8?B?TFJIVStVaWJOSEpKN0diZ3lXTTJQWGo5U3Z5T1NYeDZidmMrOVM2b0RDWWpl?=
 =?utf-8?B?SDBvbEZ2Z1ZFZmlLOVF6S1dyNDc3MWV4TlFiTFlQdWp6SWdQOU5BcVBuRms3?=
 =?utf-8?B?aUd3c0VtU0ozQ1NIcWJRY2wzNVM4bGM5ZVkyV3dhdVdOWHZiTm5POE1ybHpy?=
 =?utf-8?B?TEc4bXlMQzluVGNyNFYrZ0lEaFdDREtkV3FpNkkxSERDQmZvWEFiQnl1MGpM?=
 =?utf-8?B?US96RUVDc1Roc0J3OXhtV3BwVzg0MmVWMU1tL05FS3lORFlDb0ZLMUU0TGVh?=
 =?utf-8?B?TnZLb2d5VmMzZEE0cktOSXpRWnpDZ0JKT1NjUVcwV2g4L1gwZnJJSjFRcXc5?=
 =?utf-8?B?VnFkUmo4VFRmc3MxUnJpbU5iZGc5ZDV3VU5DdnBoam9IcnJMa2R6a3hXR1Ns?=
 =?utf-8?B?blp5ckJhVm1hMUFkZTRUQ1M0ZEx5R0Njc1BlNS9NRFNkUEUvekdJL3NXZXdM?=
 =?utf-8?B?QVlEeXFnRWlNTDBZdHdTdndvRHc4SmhOS2loREdycnpiUUpIUDZPRDZ6WnZz?=
 =?utf-8?B?akduRW1QZmpQNno2RDEyWkVZZHduNmFhRldLdUhvTml0Z2ZYRVlhZ3p3SUtZ?=
 =?utf-8?B?NDFnNWs0MGNXZEYrbU1kUXZCRHQyR0FSTlIxQm15YkhIMUZpbitUYmhoeitE?=
 =?utf-8?B?NVR3cVFKWmxyaEdZRy9RU3J0T0h4R3lMZzkySUt4QXozQW8zcU4xc3VrRDBY?=
 =?utf-8?B?OXhhOCtlVUt3cURkVW8zWUZQUHkrZnhyMC9mMkI4WUxOK3hHN3BmYlYyMElT?=
 =?utf-8?B?dWxhaUdya2QrMlh6a0pyVEo0bEV5NVZ2S0MxZFYxTEtsWUV2ZElDb3gyQklo?=
 =?utf-8?B?M1VCVWFBbXVlc2F0YXA5cklUeVlKSklZdU5tQk54dGxXSW1nUkxPbXdvNnRh?=
 =?utf-8?B?MTdOdkM2eHJMQXZmSUwzSnd5WTJwekJESTNWOTdlUkFON000QVNEdC9uZW5j?=
 =?utf-8?B?UVlZZDJoRnkxa01DYWkyQmRWWTVpdHB3QWtNMEJmeWdKWTZIdkphZEl6SXh0?=
 =?utf-8?B?OXZlTEoweE9ncEx6WDFlekJXZUI4RjFrcHhzNTRhdlAwRllRYjhMa1h5ZzVj?=
 =?utf-8?B?aGVjL0VPTFBQeUFJUldkeEJ6Vkc3T1Fyd25sYTZIN1ExYSsvaDlNcThwaXJX?=
 =?utf-8?B?OVB2dk8ybUZDVnNsVlNibTQwNkY1ZVBqa1krelhLZ3RDVXVvdjhPVjZMOVdl?=
 =?utf-8?B?ekhacGViN2w2R2J3OC9tdjFyaVNweFFpOUYxTUNrd2Z6bGpPc1RXK0NaV05l?=
 =?utf-8?B?QmJlODVGeC9keUFSZVBHWTNYNUNjM0NiTkt6ai9UTU56N0hiaGhxQ1NvK2JQ?=
 =?utf-8?B?T0lIZjFlSnZiQnBqOWdCUm5sTVNxMndXazJ4SWcxOHhQY2VQWkFwbC96WVVw?=
 =?utf-8?B?cUhyRXBERlloUVVZeXNzS3lZanZGUnR4dkhYTTV6OFFSSlNQbXZIcDFoN1M5?=
 =?utf-8?B?WW4zRVJqcElVQ25UdTNtWkVhWHRxbXJaNGhlYlM1TXdUeDFvd09JMytTMGt1?=
 =?utf-8?B?SXlKZ24ySFRvQ3V5ckJhdktROUtDZTFFcklkQmxVOWQ5N2F4V082czF2dUtk?=
 =?utf-8?B?NGswbEh2K0VhOEdKY0xHcTB2dkpMNmY2ejZZaS9LRHArVTlJeFNoMG4wcVBU?=
 =?utf-8?B?QlI3VHJrZjJ5SHdVQTdmSHJQVkltcHAvWEg0ek0zQUNacm5uSmpyRnJ2emdX?=
 =?utf-8?B?ZmJHMnlEUDVHUDZGUkNDZlJMc21OaWl6V2RoajNVZDhlRzAvalhicEVqV2hB?=
 =?utf-8?B?WHpZZGNtVEgydFJNYkQ4WkpJaWtSK1B4SWhYci85MUxoMjB4ZkdEdGo1azFv?=
 =?utf-8?B?ZkhyL0w5dm5CY1h0bnZZQ3pWZk40TjhDaG9OYksrMjVqYjJNTEI5Um5VWTlR?=
 =?utf-8?B?TVBVTFpMRlBBZ2hjam8rMkZ4bVk2YnNLU01PZngwTXlFUERkeEs1cjFnd3kw?=
 =?utf-8?B?VTdLRUhqbzlQMEtKWXEyMU1iaXZoRGM4V2lPNVk4NjY2a3dpUy82WDZGS0t2?=
 =?utf-8?B?Z3N4cWRtRVRIdjJxdnpNZXRDVmFzMjFPM1o2NS9rYUJaeGRCR1VPZkN6TmdZ?=
 =?utf-8?B?czd5bHJEb0d6Z3hwSlZraFc2V3dpc2JPWnNJT3N1MU9FNjFwNjZuNnF5OVBX?=
 =?utf-8?B?WGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D72B03DE4A454F45807D3CFF2C8B06F0@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 060120dd-2752-4b34-5634-08ddb4210eb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 19:47:02.9754
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HIuWQbU3ulxLjc1wxj/UmrAK0FlorpxctTOB5bNOxN2Gqy0aLE2cAzbZ3cvDhglpolGvUEU7/BwDU1xflnOoBshczRy5lNAECvLowPYnWq4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6869

DQpPbiAyMy8wNi8yMDI1IDAxOjE1LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+IE9uIFRo
dSwgMTkgSnVuIDIwMjUsIE9sZWtzaWkgTW9pc2llaWV2IHdyb3RlOg0KPj4gT24gMTgvMDYvMjAy
NSAwMjoyMiwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPj4+IE9uIFRodSwgMTIgSnVuIDIw
MjUsIE9sZWtzaWkgTW9pc2llaWV2IHdyb3RlOg0KW3NuaXBdDQo+Pj4+PiBBcmUgeW91IHN1cmUg
aXQgaXMgd29ydGggdG8gZ28gdGhyb3VnaCBhbGwgdGhpcyB0cm91YmxlIHRvIG1vZGlmeSBGRFQg
aW4NCj4+Pj4+IHBsYWNlIHdoZW4gd2UgY291bGQgc2ltcGx5IGdlbmVyYXRlIHRoZSBEVCBub2Rl
IGZyb20gc2NyYXRjaCBsaWtlIHdlIGRvDQo+Pj4+PiBmb3IgZXhhbXBsZSBmb3IgdGhlIEdJQz8g
VGhpcyBzZWVtcyB0byBiZSBtb3JlIGVycm9yIHByb25lIGFzIHdlbGwuIElzDQo+Pj4+PiBnZW5l
cmF0aW5nIGl0IGZyb20gc2NyYXRjaCBpcyByZWFsbHkgZGlmZmljdWx0PyBJZiBpdCBpcyBkaWZm
aWN1bHQgdGhlbiBPSy4NCj4+Pj4+DQo+Pj4+IEluIHRoZSBsYXN0IHBhdGNoIFswXSBvZiB0aGUg
c2VyaWVzLCB0aGVyZSBpcyBhIHByb3Bvc2FsIHRvIHNlcGFyYXRlDQo+Pj4+DQo+Pj4+ICAgICB0
aGUgWGVuIHByaXZpbGVnZWQgYWdlbnQgZnJvbSB0aGUgRG9tMCBhZ2VudC4gVGhpcyBlbGltaW5h
dGVzIHRoZQ0KPj4+Pg0KPj4+PiBuZWVkIHRvIG1vZGlmeSB0aGUgWGVuIERldmljZSBUcmVlIEJs
b2IgKERUQiksIHdoaWNoIGlzIGEgcG9zaXRpdmUNCj4+Pj4gaW1wcm92ZW1lbnQNCj4+Pj4NCj4+
Pj4gc2luY2UgdGhlIERvbTAgYWdlbnQgbm9kZSBpcyBhbHJlYWR5IHByZXNlbnQgaW4gdGhlIGRl
dmljZSB0cmVlLg0KPj4+Pg0KPj4+PiBIb3dldmVyLCB0aGUgaXNzdWUgd2l0aCBTQ01JIG5vZGUg
Z2VuZXJhdGlvbiBsaWVzIGluIHRoZSBuZWVkIHRvIGhhbmRsZQ0KPj4+Pg0KPj4+PiB0aGUgbGlz
dCBvZiBwcm90b2NvbHMgdGhhdCBhcmUgc3VwcG9ydGVkIGFjcm9zcyB0aGUgc3lzdGVtLg0KPj4+
Pg0KPj4+PiBJZiB3ZSB3YW50IHRvIGdlbmVyYXRlIHRoZSBTQ01JIG5vZGUgZm9yIERvbTAsIHdl
IG5lZWQgdG86DQo+Pj4+DQo+Pj4+IENvcHkgdGhlc2UgcHJvdG9jb2xzIGZyb20gYSBjZW50cmFs
aXplZCBvciBwcmVkZWZpbmVkIHNvdXJjZS4NCj4+Pj4gU2V0IHRoZSBjb3JyZWN0IHBoYW5kbGUg
Zm9yIGVhY2ggc3Vibm9kZSB3aXRoaW4gdGhlIFNDTUkgbm9kZSwgZW5zdXJpbmcNCj4+Pj4NCj4+
Pj4gYWNjdXJhdGUgcmVwcmVzZW50YXRpb24gYW5kIGZ1bmN0aW9uYWxpdHkuDQo+Pj4+IFRoaXMg
ZXh0cmEgc3RlcCBvZiBtYW5hZ2luZyB0aGUgcHJvdG9jb2xzIGFuZCBwaGFuZGxlcyBhZGRzDQo+
Pj4+DQo+Pj4+IGNvbXBsZXhpdHkgYnV0IGlzIG5lY2Vzc2FyeSBmb3IgZW5zdXJpbmcgcHJvcGVy
IHN1cHBvcnQgZm9yIERvbTAuDQo+Pj4+DQo+Pj4+IFswXQ0KPj4+PiBodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMjUtMDUvbXNnMDEwNDEuaHRt
bA0KPj4+IEkgd2FzIG9ubHkgY29tbWVudGluZyB0aGF0IHJhdGhlciB0aGFuIHRyeWluZyB0byBt
b2RpZnkgdGhlIERUIGluIHBsYWNlDQo+Pj4gd2UgY291bGQgY3JlYXRlIHRoZSBub2RlIGZvciBE
b20wIGZyb20gc2NyYXRjaCAoYXJ0aWZpY2lhbGx5KSwgYmFzZWQgb24NCj4+PiBob3N0IERUIGlu
Zm9ybWF0aW9uIGFzIHJlcXVpcmVkIChmZXRjaGluZyBkYXRhIGZyb20gdGhlIGhvc3QgRFQgYXMN
Cj4+PiByZXF1aXJlZCBhbmQgY29weWluZyBpdCB0byB0aGUgRG9tMCBEVCkuDQo+Pj4NCj4+IFRo
ZSBwcm9ibGVtIGlzIHRoYXQgc2NtaSBub2RlLCBhcGFydCBmcm9tIHRoZSBkZWZhdWx0IHBhcmFt
ZXRlcnMgaGFzIGENCj4+IGxpc3Qgb2YNCj4+DQo+PiBzdXBwb3J0ZWQgcHJvdG9jb2xzIHdoaWNo
IG1heSBiZSBkaWZmZXJlbnQgZm9yIFhlbiBhbmQgRG9tMCBzbyB0bw0KPj4gZ2VuZXJhdGUgRG9t
MCBub2RlDQo+Pg0KPj4gZnJvbSBzY3JhdGNoIHdlIG5lZWQgdG8gY29weShvciBldmVuIGdlbmVy
YXRlKSB0aGVzZSBub2RlcyB3aGljaCB3aWxsDQo+PiByZXF1aXJlIGNvbXBsZXggaW1wbGVtZW50
YXRpb24uDQo+Pg0KPj4gSW4gY29udHJhcnksIGlmIHdlIGdvIHdpdGggaW1wbGVtZW50YXRpb24s
IHByb3Bvc2VkIGluIHRoZSBsYXN0IHBhdGNoIC0NCj4+IHRoZW4gd2UgY2FuIGhhdmUNCj4+DQo+
PiBtb3JlIGNsZWFuZXIgWGVuIGRldmljZSB0cmVlLCB3aGljaCB3aWxsIGxvb2sgbGlrZSB0aGlz
Og0KPj4NCj4+IGBgYA0KPj4NCj4+IGNob3NlbiB7DQo+Pg0KPj4gICAgICAgc2NtaV94ZW46IHNj
bWkgew0KPj4NCj4+ICAgICAgICAgICAgIGFybSxzbWMtaWQgPSA8MHg4MjAwMDAwMj47DQo+Pg0K
Pj4gICAgICAgICAgICAgc2htZW09IDwkc2htXzA+Ow0KPj4NCj4+ICAgICAgICAgICAgLi4uICMg
bm8gcHJvdG9jb2xzIGRlc2NyaXB0aW9uIGhlcmUNCj4+DQo+PiB9Ow0KPj4NCj4+IGZpcm13YXJl
IHsNCj4+DQo+PiAgICAgIHNjbWkgew0KPj4NCj4+ICAgICAgICAgICAgIGFybSxzbWMtaWQgPSA8
MHg4MjAwMDAwMz47DQo+Pg0KPj4gICAgICAgICAgICAgc2htZW09IDwkc2htXzE+Ow0KPj4NCj4+
ICAgICAgICAgICAgIHByb3RvY29sQFh7DQo+Pg0KPj4gICAgICAgICAgICAgfTsNCj4+DQo+PiAg
ICAgIH0NCj4+DQo+PiB9Ow0KPj4NCj4+IGBgYA0KPj4NCj4+IEluIHRoaXMgY2FzZSwgd2UgZG9u
4oCZdCBwcm92aWRlIGFueSBwcm90b2NvbCBpbmZvcm1hdGlvbiBmb3IgdGhlIFhlbg0KPj4gYWdl
bnQgYW5kIGluc3RlYWQgc2V0IHByb3RvY29scyBmb3IgRG9tMC4NCj4+DQo+PiBUaGlzIGVuc3Vy
ZXMgdGhhdCBlYWNoIG5vZGUgaGFzIHRoZSBpbmZvcm1hdGlvbiBpdCByZXF1aXJlcy4NCj4gTGVh
dmluZyBhc2lkZSBob3cgd2UgZ2VuZXJhdGUgdGhlIGRldmljZSB0cmVlIG5vZGVzIGZvciBEb20w
LCB3aGljaCBpcw0KPiBvZiBtaW5vciBpbXBvcnRhbmNlLCB3ZSBoYXZlIHR3byBwb3RlbnRpYWxs
eSBjb25mbGljdGluZyBnb2FsczoNCj4NCj4gMSkgbm8gWGVuLXNwZWNpZmljIGNoYW5nZXMgdG8g
RGV2aWNlIFRyZWUgb3V0c2lkZSBvZiAvY2hvc2VuDQo+IDIpIFdoZW4gWGVuIGlzIHByZXNlbnQs
IFhlbiBzaG91bGQgYmUgdGhlIG9uZSB1c2luZyB0aGUgaW5mb3JtYXRpb24gaW4gdGhlIEhvc3Qg
RGV2aWNlIFRyZWUNCj4NCj4gV2l0aCAxKSwgSSBtZWFuIHRoYXQgdGhlIEhvc3QgRGV2aWNlIFRy
ZWUsIG91dHNpZGUgb2YgdGhlIC9jaG9zZW4gbm9kZSwNCj4gc2hvdWxkIGJlIHRoZSBzYW1lIGZv
ciB0aGUgQlNQIChubyBYZW4pIGFuZCBmb3IgWGVuLiBUaGF0IGlzIGJlY2F1c2UgaXQNCj4gc2hv
dWxkIGRlc2NyaWJlIHRoZSBwbGF0Zm9ybSwgbm8gbWF0dGVyIHRoZSBzb2Z0d2FyZSBydW5uaW5n
IG9uIGl0LiBBbHNvDQo+IGF0IHRoZSB0aW1lIHRoZSBEZXZpY2UgVHJlZSBpcyBnZW5lcmF0ZWQs
IG9mdGVuIGl0IGlzIG5vdCBrbm93biBpZiBYZW4NCj4gd2lsbCBiZSBydW5uaW5nIG9uIHRoZSBw
bGF0Zm9ybSBvciBub3QuDQo+DQo+IFdpdGggMikgSSBtZWFudCB0aGF0IGlkZWFsbHkgd2hlbiBY
ZW4gaXMgcHJlc2VudCwgWGVuIHNob3VsZCBiZSB0aGUgb25lDQo+IHRvIHVzZSB0aGUgaW5mb3Jt
YXRpb24gdW5kZXIgL2Zpcm13YXJlL3NjbWksIGJlY2F1c2UgWGVuIGlzIHRoZQ0KPiBwcmluY2lw
YWwgU0NNSSBjbGllbnQuIFRoZW4gWGVuIHdvdWxkIGdlbmVyYXRlIHNvbWVob3cgdGhlIFNDTUkg
ZGV2aWNlDQo+IHRyZWUgbm9kZXMgZm9yIERvbTAgYW5kIHRoZSBEb21Vcy4NCj4NCj4gMSkgaXMg
bW9yZSBpbXBvcnRhbnQgdGhhbiAyKS4NCj4NCj4gPkZyb20gd2hhdCB5b3Ugd3JvdGUsIGl0IGxv
b2tzIGxpa2UgdGhlIFNDTUkgZGV2aWNlIHRyZWUgbm9kZXMgYXJlDQo+IGRpZmZlcmVudCBiZXR3
ZWVuIExpbnV4IGJhcmVtZXRhbCBhbmQgWGVuLiBJZiAvZmlybXdhcmUvc2NtaSBkZXNjcmliZXMN
Cj4gd2hhdCBMaW51eCBiYXJlbWV0YWwgc2hvdWxkIHVzZSwgdGhlbiBpdCB3b3VsZCB3b3JrIGZv
ciBMaW51eCBiYXJlbWV0YWwNCj4gYnV0IGl0IHdvdWxkICpub3QqIHdvcmsgZm9yIFhlbidzIG93
biBTQ01JIGNvbm5lY3Rpb24uIElzIHRoYXQgY29ycmVjdD8NCj4NCj4gSWYgdGhhdCBpcyB0aGUg
Y2FzZSwgdGhhdCBpcyB1bmZvcnR1bmF0ZS4gV2UgbmVlZCB0byBjb21wcm9taXNlIG9uIDIpLg0K
Pg0KPiBJIHdvdWxkIGtlZXAgL2Zpcm13YXJlL3NjbWkgYXMgdGhlIG9uZSB1c2VkIGJ5IExpbnV4
IGJhcmVtZXRhbCBiZWNhdXNlIEkNCj4gdGhpbmsgd2Ugc2hvdWxkIHVwaG9sZCAxKSBhYm92ZSBh
bGwgZWxzZS4NCj4NCj4gVGhlbiB0aGUgWGVuIFNDTUkgbm9kZXMgY291bGQgYmUgcGxhY2VkIHVu
ZGVyIC9jaG9zZW4uIFRoaXMgaXMgbGVzcyB0aGFuDQo+IGlkZWFsIGJlY2F1c2UgL2Nob3NlbiBz
aG91bGQgY29udGFpbiBYZW4vTGludXggY29uZmlndXJhdGlvbnMsIG5vdA0KPiBmaXJtd2FyZSBp
bnRlcmZhY2VzLiBCdXQgaXQgaXMgdGhlIGJlc3Qgd2UgY2FuIGRvIGluIGEgZGlmZmljdWx0DQo+
IHNpdHVhdGlvbi4NCj4NCj4gSSB0aGluayB0aGF0IHdoZXRoZXIgdGhlIERvbTAgZGV2aWNlIHRy
ZWUgbm9kZXMgYXJlIGFydGlmaWNpYWxseQ0KPiBnZW5lcmF0ZWQgYnkgWGVuLCBvciBjb3BpZWQg
ZnJvbSB0aGUgSG9zdCBEZXZpY2UgVHJlZSBzb21ld2hlcmUsIGl0DQo+IG1hdHRlcnMgbGVzcy4N
Cg0KSSBjb21wbGV0ZWx5IGFncmVlIHdpdGggeW91ciBwb2ludC4gVGhhdOKAmXMgd2h5LCBkdXJp
bmcgdGhlIGRpc2N1c3Npb24gb2YNCnRoZSBsYXN0IHBhdGNoIGluIHRoZSBzZXJpZXMsIEkgcHJv
cG9zZWQgYW4gYXBwcm9hY2gNCg0KdGhhdCBrZWVwcyB0aGUgL2Zpcm13YXJlL3NjbWkgbm9kZSB1
bmNoYW5nZWQgaW4gdGhlIEhvc3QgRGV2aWNlIFRyZWUNCihEVCkgYW5kIHBsYWNlcyBhbGwgWGVu
LXJlbGF0ZWQNCg0KY2hhbmdlcyBpbnNpZGUgdGhlIC9jaG9zZW4veGVuLGNvbmZpZyBub2RlLg0K
DQpJIHBsYW4gdG8gZm9sbG93IHRoaXMgYXBwcm9hY2ggaW4gdjUuDQoNCkhlcmXigJlzIHRoZSBs
aW5rIHRvIHRoZSBtZXNzYWdlIHdoZXJlIEkgcHJvdmlkZWQgYSBEVCBleGFtcGxlIHRoYXQNCmVu
c3VyZXMgdGhlIC9maXJtd2FyZS9zY21pIG5vZGUgcmVtYWlucyB0aGUgc2FtZSBhcyBpbiB0aGUg
SG9zdCBEVDogWzBdLg0KDQpbMF06DQpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hp
dmVzL2h0bWwveGVuLWRldmVsLzIwMjUtMDYvbXNnMDE0MjEuaHRtbA0K

