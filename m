Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D19AB941A
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 04:33:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986214.1371870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFksy-0000aj-5I; Fri, 16 May 2025 02:33:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986214.1371870; Fri, 16 May 2025 02:33:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFksy-0000Z6-2R; Fri, 16 May 2025 02:33:20 +0000
Received: by outflank-mailman (input) for mailman id 986214;
 Fri, 16 May 2025 02:33:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JpLp=YA=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uFksw-0000Z0-W4
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 02:33:19 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20601.outbound.protection.outlook.com
 [2a01:111:f403:2408::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ed14744-31fe-11f0-9eb6-5ba50f476ded;
 Fri, 16 May 2025 04:33:16 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SA1PR12MB8919.namprd12.prod.outlook.com (2603:10b6:806:38e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 16 May
 2025 02:33:12 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 02:33:12 +0000
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
X-Inumbo-ID: 1ed14744-31fe-11f0-9eb6-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c4QfWh27naPFYKhwhhV0fUv9rBAtEPZN+623FtsUUP20cT6NWDl1B5qlTFpKOaT/fv6R9cvKmoc07xsSeY/oYjVzaXFVmoTHFsO3Qkov6ztzq5DgVZJ7BgTaN/ECQcrsAqbDR5dnecpyR/rzfpRntOaI4zgqFc46y6KmFFVZoI6HO/qGvJOjx0HS5VN3SfsEaa/leCSNpPm7sOwRhgMLVq7rAiEbj973y61awB9WZq1vMiSZH6/vjW8yTJYnUwjeDnzTtY7e9wrTOL8Q8+doweNJDWMqGSLrJu5qM+r7HHVVuLnuSEM2MR2IQrT4mRtvHmMP0yvXS4zdzEr/1kUsWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ZqNs414xL42DZ7mgbjBvRRvoYPvUF7v77FMMIzldLQ=;
 b=TCIt4HQsFGYcoVpMH7IxW8y1oKvspmv/wTAd2Nswbar1GFW6MjSmIOLVLRBMqCgmPLLGu/oWqf/NGrbfAVP9lsxcCjlF/AbhZ9aNbiP4I79ebQNPPyHavrB0W8xBqU4y6e9PS3/QnbtV09CNW/vUaSMnzCMbAaXAZpmd6zPnVscFVcAd0nQ190/qhODOQxHA6AVyJ9JLJx+AUGxoshJv47excTTyHRYfmyabC6/KtppA/xqm5fIyRGyGDAw/5Uy3BbLUArx8hQpAw2R4dVX4Ra5iEdGLBl7SaPIkiTlaD+QW1ayyW8DnPepnio/x9Xq3HDmcMNxS6WqlaGw8oMd9Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ZqNs414xL42DZ7mgbjBvRRvoYPvUF7v77FMMIzldLQ=;
 b=yNujdZQksDMeCWLielbmSF8eM2pC+DHP+KkM7lUsj+n1Tn4xA0dh4fPhhSjFy1S3q55gNQBUCYp4ZGTXIc5wCK5Glgc5WVtoKTUeqgtZxN+d9IbzI2hkcEedHMlV6J1JYN1irPAcyJVra6I7In3QZz97mUK9129ZhMA0wFq9oq8=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v4 02/10] vpci/header: Emulate legacy capability list for
 dom0
Thread-Topic: [PATCH v4 02/10] vpci/header: Emulate legacy capability list for
 dom0
Thread-Index: AQHbwMGa1FMptcF6w0qNJxVZG2xD+7PT664AgAEtSIA=
Date: Fri, 16 May 2025 02:33:12 +0000
Message-ID:
 <BL1PR12MB58494D81C47B84CAD395B70EE793A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
 <20250509090542.2199676-3-Jiqian.Chen@amd.com> <aCYWhmUBa_AyYh6N@macbook.lan>
In-Reply-To: <aCYWhmUBa_AyYh6N@macbook.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8722.027)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SA1PR12MB8919:EE_
x-ms-office365-filtering-correlation-id: e8ffcd90-3950-451d-0d86-08dd942200ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?azdFOWtUelgyMXN6T054WmtNZjJiN0ZmVnRMOGJPaHUxeDl4dTcvTEJDTGtI?=
 =?utf-8?B?ZEhKMGtyWHF0T3pWOHd2WC9ZRWlyRG91bWdpVXFMSFF6Y1lvQS9HR1NuYlBa?=
 =?utf-8?B?NW1YSlh0VGhMWHhBVk8vMDZESGY5eGs5NWt5UHk5S3ltUnRwVUh1OVJ2SWF1?=
 =?utf-8?B?eXl3VGZ5R2xHSVZ2UE1rY2QzNFVrVi9sb28xUHU5S3hicS82ZWlGbk5JRjkx?=
 =?utf-8?B?d0h5R1U2TTFuSEd0QlI3M0J0bXg0K1hOQUtrWlBHNEpxTUxDMlNTM3RacjZk?=
 =?utf-8?B?UCtFUEpSdENWaUdWUFZWVktXZGpvNVBUMVdWcVh0Q0xHTmpJb3RaY0U2bkt2?=
 =?utf-8?B?aDJTZ24rbU5YTEJUakVmZzNVNHhmM3krSDdHR2pubkRUWjRnSGNTTHpWZUVv?=
 =?utf-8?B?SGhSdkJNeXozV2F4a2R0b3hmUFA5bFJ0Z0hrQkZjVS9YbFROWTRTb21lTmg3?=
 =?utf-8?B?a0pHOGp3eEZ5WUlpeTRUZjg0ejJ5ZHZGV3h1VVFhand0a1dqV2xyaE1wekJS?=
 =?utf-8?B?Qzhud0xwNHl1T3V3dXVnS2VjZngrMTBZbHJpQlo2TmRsVFdGMUxGQTA2aTJp?=
 =?utf-8?B?UGltbW1Uc2xuaW05ekFJdDNPQXNqVGNnTjJ1Q2Vzc09ESmEwdEtuT3Q0NzlU?=
 =?utf-8?B?MnZ4T0lKL1BwUFYxdk9ON29oZWpSYlR3ZzgzZWpLTGRQTStFYllFVnZGUTJ6?=
 =?utf-8?B?dFJ6NU95QWJUODJlcGxOcUhBdFNpV0UwZVowT2JNN1VaczBaa0UxMGY3amFF?=
 =?utf-8?B?TFJCbjllT0wydUZsclpSc0F3TTc0dXZ4Q2pGanllQ1hSR3hjUjZMaWpQRE5p?=
 =?utf-8?B?czNmYWZLZUM5TWdsMnZ4OHBjTnlQblNrSzg1Zmd2aDh0enh6NVJNR1RPdTdX?=
 =?utf-8?B?bEltL0MrcUhlMkFQZlU5a094L09PU0VIa2YyODluazRydmZIVk5YV0lMYkVF?=
 =?utf-8?B?NkZkaDI3Uk1FWGo1bDJHMHVXVEtlM1RKUnJDNkFrdlRaTDJvbHo5SXB3cEtw?=
 =?utf-8?B?c0E4SmhneGhlbFVUS05SWkJHTXNHTFNBNG9OZzFyZ1NadkFwUGYxUUZybGE3?=
 =?utf-8?B?ZkFBVDFocWlCSE9yQng4c2VqbkllVkNacGRVUDJ5d2lFNWY5VVo1dzI4S2Fn?=
 =?utf-8?B?dzA4QXFoVmo5bzkza0xEQnNkMHFwRHRmWWlURkZXcG94SlZtT1JlRzNkQWM0?=
 =?utf-8?B?bzJnRitrQ05rNDRtR2UvS0s3NVF0OVJRdXlEc1R3VnZ1a242VWQrcE8wSHJl?=
 =?utf-8?B?UHd4UUhSelJjSy9KdnhoV25rSFlGVjlvSmZBbzQ2ZGJGRFY0UFk4TW9jMUdP?=
 =?utf-8?B?UGtqSXQxS21Oa1U4YUk5TlVGR2N6dTlqY0FSTzRGWWVicnN2Zm5FNEJUQmIv?=
 =?utf-8?B?Q1BXcHlsYjVVSmdFOTNFZ2tmc0hjSjcxdkhBNVI0YjB1R3hueUFLK2RWMmh3?=
 =?utf-8?B?L2lFbTAwYjEyb2pPWENCY3ZObFYzSVRoMGdxYmk5bThPKzUyc1RHa2Z0QTZP?=
 =?utf-8?B?VG5rekJzZFRLTEY1dlgvbjEzNDJHalBKcDlId1BRalZRRHByQ3hqQ25NRko0?=
 =?utf-8?B?azBOc1ZadlVVRWlJUElERW5rMWR2Z0tHNXhaa3pkYTZqbk9tZVE2UjJiSWtM?=
 =?utf-8?B?TlhyS2FwMXR4TjFEaXZQQUVLcUczQmtQYkh4N290ODk2ZzNVSWw3M08zN3dB?=
 =?utf-8?B?STlFY2YrK0FKQkJqa08vcTJMMlVqakIwU3VVYTRYZmJWK0JIQyszd00yeXFT?=
 =?utf-8?B?V0FMMmQ3Sll3RWszRlVCNmthbGpoS21tQVlNL3dINDhOZUE4RXdJNDZIeXVK?=
 =?utf-8?B?bUdXZWh1OHBwbFk5Y2ZUN1lCdkw5cHE0UXllaHhOSys1QXUvd0d2N3pSS0Vp?=
 =?utf-8?B?cURraGpwQUp5RE9XbENWVm1kN0RYT2NXdzBtU2hzZUs2S0hBbXA0cTYwTEU3?=
 =?utf-8?B?b0dYZ1VFSWc3MzZyQnNGdFRRMXZQMjREdzF5WUtFNWlqSlk2N0JmSmMvL25p?=
 =?utf-8?B?WnU5UW10L3BnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U3JZSzZhY1V0SU5yZ2VHM2VVanQ5R1RleTVIQVNEU1FrTWk0TjE3NGRXaWhD?=
 =?utf-8?B?WGFwNUhLMzZBSHU2aERDYXl5aHp4SkNKa0ZrYzhTODJDYVVsQjJPVHE3K3BK?=
 =?utf-8?B?NkJmaUp2ZC9qM1VSU2lNTURhTktwQWdKKzE0K1ovUm81VUFtNE5XcytpVGw0?=
 =?utf-8?B?d0MzQnBleEpPT3lSdDNPSCtUdHlVNlp2dTg4K25rYlVEdm9wNFlwekVxVjNC?=
 =?utf-8?B?NUwxempqVlB5elovbDdaUTBNVER0Q0RnNG4ySG8zS0d6TitnZzk2Nk9sUkNx?=
 =?utf-8?B?enlUakM5bG9tbytsR1NNVXZqdW44SzQ3UzNtWU4vMS91WUpWT20vZTV1ZERw?=
 =?utf-8?B?c1pOSUYwSmo0ODlxYnlqdWc5b1FUY1RmTDNLa1B4OWZPblBzclJ3b0xLem1L?=
 =?utf-8?B?eHY2elgxTVdMZWdCczZ3Z3FDNFh2YWtFWGVQOHdKN2RZN3RIK0VaZ0NkR0VC?=
 =?utf-8?B?VEJjb1RNUTh0a09ZenV3QU5Fa3hGNlVtTGJoR0VvdmJxVXg1ZDdvY3ZaTFdP?=
 =?utf-8?B?RVpBMnpVdisyaEkrOGZsVmdPRWZVKzE4aE5OMmhDUW9VcjBrQ3RVcit0UjQ5?=
 =?utf-8?B?SHMxL2tsdlB2ZTJWQm9GWDZRWmdUam82bEg3S2pDcE9LSmdjblE5NTBVVTFW?=
 =?utf-8?B?eHNVL241OWNhRlBpMFBCNXFkU24yckVKUDJhaXI1RmpUYVB0NEJHNGtub1hD?=
 =?utf-8?B?aThOcVBTRUhxdXpZbjFmdTdVNHJkZk1zMUw4UnVDMHZXRU1FdEFLNEJFTTEw?=
 =?utf-8?B?eUxNT0NiRWM0aHMvakt6Y0gxMUJIM1J6U3V4V1NxQmxlRnJkWEN5UzZLSHBV?=
 =?utf-8?B?R0RlVlk5TnhuVGl3UVZVUUI0Z2ZNM2pWQXlRYk1MVVczSzlnQk1yN25md3k3?=
 =?utf-8?B?MnFaRERoTEpaNld5YU5Yd0NwQXhBVVZZYzFxOVMwcUJweklNY0xvb1Q5ZWZ6?=
 =?utf-8?B?bmQrM3pIZUhIejR4dVZrSFNqUUlMSlhjSTZMWFRhemlGSVlSNXNsUUlUNUtz?=
 =?utf-8?B?VEROUGNVTUIvMnQ1VjRNOFRKL04yd3JKeENDbEIxR3lTNkI0N3gyQ2FjaDdx?=
 =?utf-8?B?RzQ1QnJkbjhCdFA5bWMwM0pXM2NiWlBHSHJSTWVLMk1NdFFjbktBMWZFQyt5?=
 =?utf-8?B?Y1ZkQ2dXNDhYajhpdVFEek11ZFE1TlYvM3JDQW5LVWZWVUdqQklCSFBscmtY?=
 =?utf-8?B?bzJzb25SMTVqNjVyWUs3K0VpTVF6dGFvWmVVM1A0Y1FaVGkxTmVNbmpiT1VN?=
 =?utf-8?B?NVJTRS8rOWxIc2JreTlZT3Z5bnN1Z0F6WTVTcFVnQ1h6SVdjUnE0eEJIVFcz?=
 =?utf-8?B?UStPVW93bkJQNHFzRGtheCtsd05EYzBxWmlIY2hPRmIzTHpqNzR6NFVtWk9B?=
 =?utf-8?B?NGQzbU51dlFkWlF5NU0zNDBGbHpvRGk3dWFaTmxlc203TENtVWV2Nm41elVH?=
 =?utf-8?B?SHpreUFQUDBDellpSHhxOWlRTEtPd3Y1Z0FCUVM4ZTN0R1pramo3Q0dyK2Ix?=
 =?utf-8?B?dlhxSGpZeDd0bm80YkxNVWFiL2dHRG0vT3NVcUtJQm5aODh0L0lSVElTVkpF?=
 =?utf-8?B?d1dSZUUvWkZZSG9ZRUZwUkIzTjBJdXJHd212b3JqaDczQjZSaURJejViYmJo?=
 =?utf-8?B?VjhobUY3R1pWaWI5aXBKU2kyOVkwU3o4QWM3NTcxdTJiYUYvaWNtNUVnTkVp?=
 =?utf-8?B?ck1sQ2RtOVN1YkFncERMa2ZMcVIzaTZXbm1VRWdGQmpRL0tPNVdNTGt3QXZ1?=
 =?utf-8?B?anpIK1VQejVIa2dFbEJGVzVkZGQzbUlsNGluWlJZcHdsUm1iSC9nbVBrUDNK?=
 =?utf-8?B?bDNVbFlDTFVKOERwSnRkcEc5ZHNLbnFwaHJ6YUI0cUdWMnVCOVJTWHRDU0xx?=
 =?utf-8?B?R0ZTcXBuR1JyejB4ZUJTTG82YU05L01QRm85T21PeUxmR1IzTEpIdExrQk5P?=
 =?utf-8?B?RkplMTFlYUQ2UmpOQ21zcVdVQllwQkVQam40VHRlRjJOa0diUzRseEFwdHBu?=
 =?utf-8?B?YWtnNTRxK2xhYVBpSWNZUkpZYjhEWGRNR2s1VHFRYjVsUWJpOXZCK0tnak1a?=
 =?utf-8?B?UzZWY1dIQ1lIQjRnajVJNHhSUzNSbmFOSzVxVkY4OXhPalBKUlFQMFdUNnJq?=
 =?utf-8?Q?d2tU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <902A8A6D77E1D144BAB9BC7EAB9B4C7A@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8ffcd90-3950-451d-0d86-08dd942200ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2025 02:33:12.1364
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6QKq5BK9uA1QS1i7qIzatq5BLJUwG/izIvV75bqPizOTDc2RZuIMY4h7IlzwMOQTd60QFnwDtqVyJSwbsDl0HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8919

T24gMjAyNS81LzE2IDAwOjI5LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBGcmksIE1h
eSAwOSwgMjAyNSBhdCAwNTowNTozNFBNICswODAwLCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+IEBA
IC03ODYsMTUgKzc5MiwxOCBAQCBzdGF0aWMgaW50IHZwY2lfaW5pdF9jYXBhYmlsaXR5X2xpc3Qo
c3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+PiAgDQo+PiAgICAgICAgICAgICAgbmV4dCA9IHBjaV9m
aW5kX25leHRfY2FwX3R0bChwZGV2LT5zYmRmLA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcG9zICsgUENJX0NBUF9MSVNUX05FWFQsDQo+PiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdXBwb3J0ZWRfY2FwcywNCj4+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEFSUkFZX1NJWkUoc3VwcG9ydGVk
X2NhcHMpLCAmdHRsKTsNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHN1cHBvcnRlZF9jYXBzLCBuLCAmdHRsKTsNCj4+ICANCj4+IC0gICAgICAgICAgICByYyA9
IHZwY2lfYWRkX3JlZ2lzdGVyKHBkZXYtPnZwY2ksIHZwY2lfaHdfcmVhZDgsIE5VTEwsDQo+PiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwb3MgKyBQQ0lfQ0FQX0xJU1RfSUQs
IDEsIE5VTEwpOw0KPj4gLSAgICAgICAgICAgIGlmICggcmMgKQ0KPj4gLSAgICAgICAgICAgICAg
ICByZXR1cm4gcmM7DQo+PiArICAgICAgICAgICAgaWYgKCAhaXNfaHdkb20gKQ0KPj4gKyAgICAg
ICAgICAgIHsNCj4+ICsgICAgICAgICAgICAgICAgcmMgPSB2cGNpX2FkZF9yZWdpc3RlcihwZGV2
LT52cGNpLCB2cGNpX2h3X3JlYWQ4LCBOVUxMLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHBvcyArIFBDSV9DQVBfTElTVF9JRCwgMSwgTlVMTCk7DQo+PiArICAg
ICAgICAgICAgICAgIGlmICggcmMgKQ0KPj4gKyAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJj
Ow0KPj4gKyAgICAgICAgICAgIH0NCj4+ICANCj4+IC0gICAgICAgICAgICByYyA9IHZwY2lfYWRk
X3JlZ2lzdGVyKHBkZXYtPnZwY2ksIHZwY2lfcmVhZF92YWwsIE5VTEwsDQo+PiArICAgICAgICAg
ICAgcmMgPSB2cGNpX2FkZF9yZWdpc3RlcihwZGV2LT52cGNpLCB2cGNpX3JlYWRfdmFsLA0KPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaXNfaHdkb20gPyB2cGNpX2h3X3dy
aXRlOCA6IE5VTEwsDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwb3Mg
KyBQQ0lfQ0FQX0xJU1RfTkVYVCwgMSwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICh2b2lkICopKHVpbnRwdHJfdCluZXh0KTsNCj4+ICAgICAgICAgICAgICBpZiAoIHJj
ICkNCj4+IEBAIC04MDUsMTMgKzgxNCwxNyBAQCBzdGF0aWMgaW50IHZwY2lfaW5pdF9jYXBhYmls
aXR5X2xpc3Qoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+PiAgICAgIH0NCj4+ICANCj4+ICAgICAg
LyogVXRpbGl6ZSByc3ZkcF9tYXNrIHRvIGhpZGUgUENJX1NUQVRVU19DQVBfTElTVCBmcm9tIHRo
ZSBndWVzdC4gKi8NCj4+IC0gICAgcmV0dXJuIHZwY2lfYWRkX3JlZ2lzdGVyX21hc2socGRldi0+
dnBjaSwgdnBjaV9od19yZWFkMTYsIHZwY2lfaHdfd3JpdGUxNiwNCj4+IC0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgUENJX1NUQVRVUywgMiwgTlVMTCwNCj4+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgUENJX1NUQVRVU19ST19NQVNLICYNCj4+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB+KG1hc2tfY2FwX2xpc3QgPyBQQ0lfU1RBVFVT
X0NBUF9MSVNUIDogMCksDQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBD
SV9TVEFUVVNfUlcxQ19NQVNLLA0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBtYXNrX2NhcF9saXN0ID8gUENJX1NUQVRVU19DQVBfTElTVCA6IDAsDQo+PiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFBDSV9TVEFUVVNfUlNWRFpfTUFTSyk7DQo+PiArICAg
IHJldHVybiBpc19od2RvbSA/IDAgOiB2cGNpX2FkZF9yZWdpc3Rlcl9tYXNrKHBkZXYtPnZwY2ks
IHZwY2lfaHdfcmVhZDE2LA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB2cGNpX2h3X3dyaXRlMTYsIFBDSV9TVEFUVVMsDQo+PiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDIsIE5VTEwsDQo+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBDSV9TVEFUVVNf
Uk9fTUFTSyAmDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIH4obWFza19jYXBfbGlzdCA/DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQQ0lfU1RBVFVTX0NBUF9MSVNUIDoNCj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IDApLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBQQ0lfU1RBVFVTX1JXMUNfTUFTSywNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgbWFza19jYXBfbGlzdCA/DQo+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBDSV9TVEFUVVNfQ0FQX0xJU1Qg
OiAwLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBQQ0lfU1RBVFVTX1JTVkRaX01BU0spOw0KPiANCj4gV293LCB0aGF0J3MgYSBiaXQgdG9vIG11
Y2ggaW5kZW50YXRpb24gZm9yIG15IHRhc3RlLiAgRG8geW91IHRoaW5rIHlvdQ0KPiBjb3VsZCBk
bzoNCj4gDQo+IC8qIFJldHVybiBlYXJseSBmb3IgdGhlIGh3IGRvbWFpbiwgbm8gbWFza2luZyBv
ZiBQQ0lfU1RBVFVTLiAqLw0KPiBpZiAoIGlzX2h3ZG9tICkNCj4gICAgIHJldHVybiAwOw0KPiAu
Li4NCj4gDQo+IFNvIHRoYXQgeW91IGRvbid0IGhhdmUgdG8gdG91Y2ggdGhlIGN1cnJlbnQgcmV0
dXJuIGNodW5rPw0KSXQgc2VlbXMgYmV0dGVyLg0KV2lsbCBkbyBpbiBuZXh0IHZlcnNpb24uDQoN
Cj4gDQo+IFRoYW5rcywgUm9nZXIuDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4u
DQo=

