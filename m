Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E34AE5FB5
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 10:43:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023411.1399397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTzF6-0008UW-GX; Tue, 24 Jun 2025 08:43:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023411.1399397; Tue, 24 Jun 2025 08:43:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTzF6-0008ST-Ct; Tue, 24 Jun 2025 08:43:00 +0000
Received: by outflank-mailman (input) for mailman id 1023411;
 Tue, 24 Jun 2025 08:42:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bMwc=ZH=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1uTzF4-0008SN-VR
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 08:42:59 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a699031-50d7-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 10:42:57 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by AS8PR03MB7842.eurprd03.prod.outlook.com (2603:10a6:20b:341::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Tue, 24 Jun
 2025 08:42:55 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%4]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 08:42:55 +0000
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
X-Inumbo-ID: 3a699031-50d7-11f0-a30f-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iit312uP3MRbcbgxjaRS2P/TpxaPgzg1TkpUuTieGJbLd6Xg0eNPXGJQg8f5MoHJ65tFtRvrPbUcNZcjQG+D/GEBhyngqqrHQVormhTrfIVP56Bb1pQ8kNiImnGQFoFWepIvlhj5NbyXYy6KDpQeWGYo18T6VO9Qm4DX3JkDanD2SvA+SYPXUs4lSfbkEcXAV+p6pSIxHKAdk4sy58B84lndAofodcrfcGF8r31VgpdphJEODn2wbGyHTa1oq+nlTr9FoVhAqAfkf8goWxe1F0YgZQL7Z7rfJKfjed9KgOmfJsCrBbRe56m2BtXpz18fV22fsfXjtMuYRoolR5oGug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y6AqxD5ErG783J2e0aZ8UpWyddV+VlzDQvc5JJ1As78=;
 b=kPsgLfupNe9tH0e7iuKG1ZeWBRJBrXXwkyaiBmQ1EZ+SEU70oYjIamMw3gbX6+hLxvulY89HzUAi8kZcpvaZaRG3W7q8wG+O35uKZEZN1cWoDNx1vlck7SyCZHZO89FWsa8CCeldf+1PwKpa5hAdjqJz902P5kw1zXFOy4Z4iMyXP+qSsWxUfWlmZArAn1K4I28nKTgEgzDowJ2M0oruoebzo5e7SUw8+DzmNYQIKc6o/gfoELMqG4T5FOF87PJlf78jrX/HJFGNFXaqZPUxRFfMePTiElvCFX/oMGfnXzZrYIkGXX8SraOybBPx4qsY6hJv8YrVrZLOejJ262W1zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y6AqxD5ErG783J2e0aZ8UpWyddV+VlzDQvc5JJ1As78=;
 b=d6n13J7IgD5dG8/npmERXIyyRPedZU0Ls8jfHGtrDqX2818Fd03NEtG6Htag7reXi4kWVegrkoSxwfv8JqB6UBn5jPHxVzEAC73np22u0StwrnM4UIOz3cPV4ibr4lSvoZJFHPGmXMWpsffe0FcN7M/wiXsmuIpbBCw/3UzQqbcsS8zTxxrdQvvj4qvSDRjVRyhdpHkbkNk/uWDrpJImNLHOXHi1yIAKOOwD5u8ylO04yTwZ/RJ5ykwD3ON0+2U129NhEXMOI/jivdUCdh09L5o4VA/A9xhdbPngx1usNknz+W+zfQpwQe8xZ7xEJgBqhfWunXXf7iNrLeKGshyLnA==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>, "jbeulich@suse.com"
	<jbeulich@suse.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Grygorii Strashko <grygorii_strashko@epam.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [RFC PATCH v4 5/8] xen/domctl: extend XEN_DOMCTL_assign_device to
 handle not only iommu
Thread-Topic: [RFC PATCH v4 5/8] xen/domctl: extend XEN_DOMCTL_assign_device
 to handle not only iommu
Thread-Index:
 AQHbyNXPDXt2FT3RV02cltfdm/Dd7rPdzmiAgCG+LgCACKrsAIACoXoAgAUPLACAAk4fgA==
Date: Tue, 24 Jun 2025 08:42:54 +0000
Message-ID: <4b69568b-3b21-4426-b78a-222ca11632e4@epam.com>
References: <cover.1747669845.git.oleksii_moisieiev@epam.com>
 <4f58bf9c47c40413ee9250c4cd21458382aac857.1747669845.git.oleksii_moisieiev@epam.com>
 <alpine.DEB.2.22.394.2505211715210.147219@ubuntu-linux-20-04-desktop>
 <f7a82cbe-2967-487f-9947-b56d1dea3e84@epam.com>
 <alpine.DEB.2.22.394.2506171701190.1780597@ubuntu-linux-20-04-desktop>
 <1780646c-cb6f-4508-86c8-a573fbc09f6a@epam.com>
 <alpine.DEB.2.22.394.2506221428420.8066@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2506221428420.8066@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|AS8PR03MB7842:EE_
x-ms-office365-filtering-correlation-id: 0c2fd0f6-a8ee-43f5-ff3c-08ddb2fb1cf9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VVNJSGhaVHZPZlYzSGpRZ3B6VVF5bDBSWjJnYklDQVAxT1ZPRGgrY1I1RXF3?=
 =?utf-8?B?RitFOEQvZkE4TE90R2EyVlZhaDNRY2pzdjhEMUQ1eHc1REZmdVN3UWpZK1Vn?=
 =?utf-8?B?S2gxZTM0N3gwTS9mTUtYaHdlQXIzMjJVbCtsOGpoejhCV0N2YjNDZ0REY2dp?=
 =?utf-8?B?WTdPT2JIOGFYTUY3SFJUb3JvSnN0MjBxcXZvS2dmaXZwUG5RUGZ0WlBMK29r?=
 =?utf-8?B?ZkVRWmR4bXFUWXFRQ1pOamlkUkpVRmRFdlk0Z01KNnpVemdBYStKY2hNaGQr?=
 =?utf-8?B?QTBlOVN1Yk1BUFJ4NXUvcXRMWi8xclo1TGo2MVNkTUhXUHA3MlBnWEJSWkIw?=
 =?utf-8?B?Mno5YVBHd05SbGxBSXlyQlZqR3E1TWUzbERyMEVzS09jdlNGVVc5d3B4MWxp?=
 =?utf-8?B?NXExQkhWdnZkNjRqSWRFVlpna1J6SHYwYXZvUHliYkRXWXhlb2YzcHlaQlU3?=
 =?utf-8?B?OERrK0pBMGcyeDJEQVBZQTA0T2JPSGllZ3JIOGhhRldxcWxNR3VNSkcrM2dr?=
 =?utf-8?B?ZkFqeHgvSno1UndBMit0VXVYbnVuM2Q4M0xiVklLUWhNS1FMYVh5cTBQdGxN?=
 =?utf-8?B?QUVzbUwxaFFyNlpjV2FVQzZhS3BXK05JMGQvSXN0OEZsY29sS2F0cllHNXpM?=
 =?utf-8?B?OWRwRHhZNmY0UlphTGVyT3BEUVc3LytvVkJjYlpsTzdYVytGOU1JamVBOVFr?=
 =?utf-8?B?SHB2b1hKOWtCNGJOZHpBV3NrQk9wSUhHYTltdzd2RjJYdHMrVUNLVDNqMUx2?=
 =?utf-8?B?VGduN3pmQ1dqWkkzOGV2ZFlvUGpFSlc3MS9ValNZcHJBbG1saGt3OVZHUmhp?=
 =?utf-8?B?RTlWUkQxWGtJK2ZsanFLdXROM2hWNHpwWVBqMXAyb3plcVgxdEZuZTM0MDVq?=
 =?utf-8?B?TmQybWJ1TkFoUkVmV0RwNXpSZDhGdXlwV0JFWVJDMmtNd1JzeFIzem1XUXkr?=
 =?utf-8?B?Mlc1eFdWUEpGYUxYYnlrRGN5Y3ZWRlpqRmJFQllUa0ZrclN1S2lwZWtweXh0?=
 =?utf-8?B?TnQ1eWNveTl4V0Rid1FEYzl3ZnUvd1hUUnBwMHkvSVd2aU40anpTOWVDajZn?=
 =?utf-8?B?UHBLRG45elVVQllNSkVqYUQrWDRnNmpyL2FML1pMTWxBMm96K1hoNk15MDlo?=
 =?utf-8?B?YVZQN0x2NVZpVmVXSDlDaVIyelFLVEdSSW5SRzd3YWt5SnU0c1cvS2t6SUJj?=
 =?utf-8?B?RU1KMjZFdUJUaDFKRy9idTl5NExNVzVzQ0hEN1dMZXh4RGZhdHd0dTgvMW1E?=
 =?utf-8?B?NXNLdjBpRTVOWGdsdW1zRzcwR0QxRmJYZGJxcG5tVGVHMXRpbDNpVzl5czJI?=
 =?utf-8?B?OE5oamRTZGRzMGovV0dLS2VkdFB6OXBMeU4vV0k1Znk4VkxuRUoxNTk3Vnd5?=
 =?utf-8?B?MmhSckVpeVZXQmZYeGpsMnV6T0VWZXoyaVBPaktpdUd6cnhsN25PQnMxV1J6?=
 =?utf-8?B?c2dhWVhSMzN3RWQ0dUZSMld0bTJYNEJiZjlFWm9Dd2FZS0x5NGxEQWxVMGx1?=
 =?utf-8?B?VUV6TzlnQmk0S20ySWFPNW4vRlE5cTBid3JleXJ4Z1dEVXBzdHBCNW9Oa0dO?=
 =?utf-8?B?c3FkeVJuY1N4V1Qrdy9jOUxOY3F1ZmhNR2lWY0FRQmVFRnMyQ2FsQzhhYnN0?=
 =?utf-8?B?R01JZWVuclllcDN6ODBZa1hMd0d5M2R4MHVOOXBISkdLblNqMmJwY0VtZlNz?=
 =?utf-8?B?ZkovckxSQnBLSGdJbEN1eVR6Z0xQeElOOTU1aDU1ZUtnZWR0ZDBGQm8rVm5m?=
 =?utf-8?B?YmtFb09Ycm94ZlpYb2lPOWFsbG9qV3QyWSt3Q1pnTlNZaGljTEt4RVRTZWhQ?=
 =?utf-8?B?OXhTbXNNb3RJMDNYZGpTUFpycDlxUTBFMFF5MkxlTUp6QWdXaDFTWklxNzVV?=
 =?utf-8?B?YVdhR1d1Q3VpdDdyVnl0aUROR1F2d01yM0lyWFFLN0FmMDJLcGFnVEUyRXVl?=
 =?utf-8?B?YkI3cmNCSUVsK1k5bHBaMEprTjNyUHQ5YzFBcEVzbG4xY3VkRmJvWjhGcS8y?=
 =?utf-8?Q?Jq3KSNXrzJjLpdkPCDzLc1EBRA+BTQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z0F6VnVCUUNnRXltaW0wTVhvellnNGxENXVJYWt1dHhUZTk4Y1pWUGFuSmFn?=
 =?utf-8?B?bTZYT3N0dEZmQ1NQWlNkQVd3eSs1eUtUUkxPcDI4UEFRb3JiZnIvdDAxbm9x?=
 =?utf-8?B?RnAyV25OTXdEUTRtM0Rsd3ZYSnpqbmlFUEVoQ0hwelpxOWFzWU9RR2pmbE16?=
 =?utf-8?B?QjIvaDZpSzhQMmJJa25XOXROZVdKcTN5b3NsY1luRWQ2SU1pVVBBVVQ3aDZk?=
 =?utf-8?B?Y3NJWG9GKzZ2dVBoTHZCTVlXWVAwRFdPdEdweGsrNEdOcUFTTUJtSjFpTlJQ?=
 =?utf-8?B?OEJNZnJqam1jZVBxK2lyREkwSkwrQlV1NGdSVk4vekpJb0EvVWxMS3R0R2px?=
 =?utf-8?B?dkg0L0tEQVdUM1hsRndickNFczJCYit6NVVXc3Q3bmFjM0lNejUxb1YxVmxR?=
 =?utf-8?B?RWZMaUNVb0thVHVDN29Mb1JSY3hiNDlnY0N2NWJacVNMMml5aTlnZnZWSnk3?=
 =?utf-8?B?L3huSlFJU3FjRG9kaUZlS3QvandtcmFUYi9zb2hkcTduNGRZaEN1SjFhZU1X?=
 =?utf-8?B?RGx0emNmVU1xcC9wNGZqemY3VDhNbU9pVEh5WTFickJ5N09XQTZ3V2ZCNDNM?=
 =?utf-8?B?ZFNZNHovTDNlMktSYTcvUDAxbGpRTFBtVSs4QUt2SFZBdmsyOHZqeEVFbTFP?=
 =?utf-8?B?dWJQR2R4UHdUTXRpUHhqZ0xadTJHaEFDZis2NjhmOUxpbkZFb1o1SUh6MitW?=
 =?utf-8?B?dFBWekJsb0UrVkFwSmZSbHlNNEkrRHB0M1J2UG1ITGN1cWhPQTQxWDQxbll1?=
 =?utf-8?B?M0tQakRKWksxaUNHN3czUUlOYUNsZ0lhc21jVndFaTBWSTNFM1lQaW5zRG14?=
 =?utf-8?B?clljYXBWYmhzblVNekF2eUlyNHF6KzR4dGtteGE2aEpUTjY2WHIvZDFrWlRP?=
 =?utf-8?B?WkNraW5ZaldkR0MvUC9xb2tOcG1MOHRONFU2N3NCOERWUUUxSTlRZ1FEaFNv?=
 =?utf-8?B?Q2NKTi9aYlR2d3haTU5SVFVuMUxwYmRhNE1mYVRSM3JsYlpuNm80aFMxQlp3?=
 =?utf-8?B?bk01djRzRUZFUWxEOEoyM0ppRG02VzVTVitjalN4dThUN2Y4ZnVqYmdDNmFT?=
 =?utf-8?B?dGo4V2NZUFBGVjMzS3daT2ZFSC9hcWFKNkN2WUt4TmRPcTRib3AzV1RYdVBr?=
 =?utf-8?B?c21GTnBvNlhCMEwyb3FnVXJNbE1RU0Iyclpxc0s3bCtCZS9rVWt4cVByRjV1?=
 =?utf-8?B?cGlOdGM1enRJenFQZ29ZWUNMTW9BL01qV3VXT05Ndi94MERUbWdSa0NlY3pG?=
 =?utf-8?B?QkdpK2NodEJ3YzE0VHVSYTVRTklBWGppV1Y4cUwxS3ZxRkxueVI2UDcvQ3NH?=
 =?utf-8?B?YkF2bkFhb2txaFV4ZURqVERnUGJoc0NHNkxVTGl4WktaTklTRmk5cFRlN3Y4?=
 =?utf-8?B?dElaSDFYZmxCSFVENjF2NGFrNVNxcWxBODczZGJTenhnY1IxdGw5RTZ4K3V4?=
 =?utf-8?B?dVRlUm1HRXpQTlhiUTk1MkFtbXZ1QjdNV2l1aDNDQ2FCVWE1d0w3U2FZMEVp?=
 =?utf-8?B?TWY2T25ZU2lmRHdQV09Pc1RzbzVCUFY3ZHRJMzZFakIxS3A0MnVlRm9xRjRJ?=
 =?utf-8?B?TmQvLzE2OVUzRVpMY1BlMWgyeGJIcWp5SDdyT2hZaTNyYThISU5jTTFBWVlV?=
 =?utf-8?B?MmN1WGdQemJBQU1WcnRQL0RsOWtUOU9DWmNXeVE3RUxuUU0zT1JQUys5d3JK?=
 =?utf-8?B?UlYyNEtVS3FmWkU3eW1oM0ZNUm5FOEVtay9WY3lMYXFINlZOQXQvWWg5NzRx?=
 =?utf-8?B?Q0FnaHRIb1YyZi9qcVJ1WHlkRE9zcW1ZTWJpdjNLTnowWFlwc3lFNEJWU2dN?=
 =?utf-8?B?TjVxd29RbCtwb2FST0FNN1k5WG11MllUUjF4YzE3bFI0YVoxZWlSaFVTdSsv?=
 =?utf-8?B?ZzZKVm9lektXV2wrTjNUV21VOW5IcThjZ1BsZk1zcFJEL1BNWW5jZVlKM0N6?=
 =?utf-8?B?a3Z2SlZtRkNrVStvVnRsdm1NOXhnRVBBVVl3aWc3WDR1M1JHV202Sml0QWY3?=
 =?utf-8?B?ajZYOEx4dG9POXA3cHA4TlpSVm1jLzBwTnpuUnZZcno3dnlIeERFUEhqN0cw?=
 =?utf-8?B?akhiZmo2K3dHdTZVVlA4T01VWjN0VGh3NjlqR3Y1VkxXbjVuVTUvbFVwM0FW?=
 =?utf-8?B?ODZFSEtrazZ1KzVrY0VZV2RmUVRGS3R5Szgvb2twY0VmdG1laERDbzd1SnFs?=
 =?utf-8?B?eWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <11D71BE6B80EA8468D3CBCE288EC2DF6@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c2fd0f6-a8ee-43f5-ff3c-08ddb2fb1cf9
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 08:42:54.8603
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KKlsQhx3q1UNVTkszCsOEMqRoBRwe6Exd3ePRoZY8Wx823Wl5IB/7gwXp5zWZwXw2bYpPTNYJNBWtpur0xnSDsiWPTm+HA9T5cOE1rBa++E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7842

QWRkaW5nIFJvZ2VyIGFuZCBKYW4gdG8gdGhlIGNvbnZlcnNhdGlvbi4NCg0KUGxlYXNlIHNlZSBi
ZWxvdy4NCg0KT24gMjMvMDYvMjAyNSAwMDozMCwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0K
PiBPbiBUaHUsIDE5IEp1biAyMDI1LCBPbGVrc2lpIE1vaXNpZWlldiB3cm90ZToNCj4+IE9uIDE4
LzA2LzIwMjUgMDM6MDQsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4+PiBPbiBUaHUsIDEy
IEp1biAyMDI1LCBPbGVrc2lpIE1vaXNpZWlldiB3cm90ZToNCj4+Pj4gSGkgU3RlZmFubywNCj4+
Pj4NCj4+Pj4gSSdtIHZlcnkgc29ycnkgZm9yIGEgbG9uZyBzaWxlbmNlLiBQbGVhc2Ugc2VlIG15
IGFuc3dlcnMgYmVsb3c6DQo+Pj4+DQo+Pj4+IE9uIDIyLzA1LzIwMjUgMDM6MjUsIFN0ZWZhbm8g
U3RhYmVsbGluaSB3cm90ZToNCj4+Pj4+IE9uIE1vbiwgMTkgTWF5IDIwMjUsIE9sZWtzaWkgTW9p
c2llaWV2IHdyb3RlOg0KPj4+Pj4+IEZyb206IEdyeWdvcmlpIFN0cmFzaGtvPGdyeWdvcmlpX3N0
cmFzaGtvQGVwYW0uY29tPg0KPj4+Pj4+DQo+Pj4+Pj4gQWRkIGNoYWluZWQgaGFuZGxpbmcgb2Yg
YXNzaWduZWQgRFQgZGV2aWNlcyB0byBzdXBwb3J0IGFjY2Vzcy1jb250cm9sbGVyDQo+Pj4+Pj4g
ZnVuY3Rpb25hbGl0eSB0aHJvdWdoIFNDSSBmcmFtZXdvcmssIHNvIERUIGRldmljZSBhc3NpZ24g
cmVxdWVzdCBjYW4gYmUNCj4+Pj4+PiBwYXNzZWQgdG8gRlcgZm9yIHByb2Nlc3NpbmcgYW5kIGVu
YWJsaW5nIFZNIGFjY2VzcyB0byByZXF1ZXN0ZWQgZGV2aWNlDQo+Pj4+Pj4gKGZvciBleGFtcGxl
LCBkZXZpY2UgcG93ZXIgbWFuYWdlbWVudCB0aHJvdWdoIEZXIGludGVyZmFjZSBsaWtlIFNDTUkp
Lg0KPj4+Pj4+DQo+Pj4+Pj4gVGhlIFNDSSBhY2Nlc3MtY29udHJvbGxlciBEVCBkZXZpY2UgcHJv
Y2Vzc2luZyBpcyBjaGFpbmVkIGFmdGVyIElPTU1VDQo+Pj4+Pj4gcHJvY2Vzc2luZyBhbmQgZXhw
ZWN0ZWQgdG8gYmUgZXhlY3V0ZWQgZm9yIGFueSBEVCBkZXZpY2UgcmVnYXJkbGVzcyBvZiBpdHMN
Cj4+Pj4+PiBwcm90ZWN0aW9uIGJ5IElPTU1VIChvciBpZiBJT01NVSBpcyBkaXNhYmxlZCkuDQo+
Pj4+Pj4NCj4+Pj4+PiBUaGlzIGFsbG93cyB0byBwYXNzIG5vdCBvbmx5IElPTU1VIHByb3RlY3Rl
ZCBEVCBkZXZpY2UgdGhyb3VnaA0KPj4+Pj4+IHhsLmNmZzoiZHRkZXYiIHByb3BlcnR5IGZvciBw
cm9jZXNzaW5nOg0KPj4+Pj4+DQo+Pj4+Pj4gZHRkZXYgPSBbDQo+Pj4+Pj4gICAgICAgICIvc29j
L3ZpZGVvQGU2ZWYwMDAwIiwgPC0gSU9NTVUgcHJvdGVjdGVkIGRldmljZQ0KPj4+Pj4+ICAgICAg
ICAiL3NvYy9pMmNAZTY1MDgwMDAiLCA8LSBub3QgSU9NTVUgcHJvdGVjdGVkIGRldmljZQ0KPj4+
Pj4+IF0NCj4+Pj4+Pg0KPj4+Pj4+IFRoZSBjaGFuZ2UgaXMgZG9uZSBpbiB0d28gcGFydHM6DQo+
Pj4+Pj4gMSkgdXBkYXRlIGlvbW11X2RvX2R0X2RvbWN0bCgpIHRvIGNoZWNrIGZvciBkdF9kZXZp
Y2VfaXNfcHJvdGVjdGVkKCkgYW5kDQo+Pj4+Pj4gbm90IGZhaWwgaWYgRFQgZGV2aWNlIGlzIG5v
dCBwcm90ZWN0ZWQgYnkgSU9NTVUNCj4+Pj4+PiAyKSBhZGQgY2hhaW5lZCBjYWxsIHRvIHNjaV9k
b19kb21jdGwoKSBpbiBkb19kb21jdGwoKQ0KPj4+Pj4+DQo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTog
R3J5Z29yaWkgU3RyYXNoa288Z3J5Z29yaWlfc3RyYXNoa29AZXBhbS5jb20+DQo+Pj4+Pj4gU2ln
bmVkLW9mZi1ieTogT2xla3NpaSBNb2lzaWVpZXY8b2xla3NpaV9tb2lzaWVpZXZAZXBhbS5jb20+
DQo+Pj4+Pj4gLS0tDQo+Pj4+Pj4NCj4+Pj4+Pg0KPj4+Pj4+DQo+Pj4+Pj4gICAgIHhlbi9hcmNo
L2FybS9maXJtd2FyZS9zY2kuYyAgICAgICAgICAgICB8IDM3ICsrKysrKysrKysrKysrKysrKysr
KysrKysNCj4+Pj4+PiAgICAgeGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2Zpcm13YXJlL3NjaS5o
IHwgMTQgKysrKysrKysrKw0KPj4+Pj4+ICAgICB4ZW4vY29tbW9uL2RvbWN0bC5jICAgICAgICAg
ICAgICAgICAgICAgfCAxOSArKysrKysrKysrKysrDQo+Pj4+Pj4gICAgIHhlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoL2RldmljZV90cmVlLmMgICB8ICA2ICsrKysNCj4+Pj4+PiAgICAgNCBmaWxlcyBj
aGFuZ2VkLCA3NiBpbnNlcnRpb25zKCspDQo+Pj4+Pj4NCj4+Pj4+PiBkaWZmIC0tZ2l0IGEveGVu
L2FyY2gvYXJtL2Zpcm13YXJlL3NjaS5jIGIveGVuL2FyY2gvYXJtL2Zpcm13YXJlL3NjaS5jDQo+
Pj4+Pj4gaW5kZXggZTE1MjJlMTBlMi4uOGVmZDU0MWM0ZiAxMDA2NDQNCj4+Pj4+PiAtLS0gYS94
ZW4vYXJjaC9hcm0vZmlybXdhcmUvc2NpLmMNCj4+Pj4+PiArKysgYi94ZW4vYXJjaC9hcm0vZmly
bXdhcmUvc2NpLmMNCj4+Pj4+PiBAQCAtMTI2LDYgKzEyNiw0MyBAQCBpbnQgc2NpX2Fzc2lnbl9k
dF9kZXZpY2Uoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGR0X2RldmljZV9ub2RlICpkZXYpDQo+
Pj4+Pj4gICAgICAgICByZXR1cm4gMDsNCj4+Pj4+PiAgICAgfQ0KPj4+Pj4+ICAgICANCj4+Pj4+
PiAraW50IHNjaV9kb19kb21jdGwoc3RydWN0IHhlbl9kb21jdGwgKmRvbWN0bCwgc3RydWN0IGRv
bWFpbiAqZCwNCj4+Pj4+PiArICAgICAgICAgICAgICAgICAgWEVOX0dVRVNUX0hBTkRMRV9QQVJB
TSh4ZW5fZG9tY3RsX3QpIHVfZG9tY3RsKQ0KPj4+Pj4+ICt7DQo+Pj4+Pj4gKyAgICBzdHJ1Y3Qg
ZHRfZGV2aWNlX25vZGUgKmRldjsNCj4+Pj4+PiArICAgIGludCByZXQgPSAwOw0KPj4+Pj4+ICsN
Cj4+Pj4+PiArICAgIHN3aXRjaCAoIGRvbWN0bC0+Y21kICkNCj4+Pj4+PiArICAgIHsNCj4+Pj4+
PiArICAgIGNhc2UgWEVOX0RPTUNUTF9hc3NpZ25fZGV2aWNlOg0KPj4+Pj4+ICsgICAgICAgIHJl
dCA9IC1FT1BOT1RTVVBQOw0KPj4+Pj4gQXJlIHlvdSBzdXJlIC1FT1BOT1RTVVBQIGlzIHRoZSBy
aWdodCBlcnJvciBjb2RlIGZvciB0aGUgMyBjaGVja3MgYmVsb3c/DQo+Pj4+IFRoZSAtRU9QTk9U
U1VQUCBjb2RlIGlzIHVzZWQgYmVjYXVzZSB0aGlzIGlzIHBhcnQgb2YgYSBjaGFpbmVkIGNhbGwg
YWZ0ZXINCj4+Pj4gaW9tbXVfZG9fZG9tY3RsLCBhcyBzdGF0ZWQgaW4geGVuL2NvbW1vbi9kb21j
dGwuYzo4NTkuIFRoZQ0KPj4+PiBYRU5fRE9NQ1RMX2Fzc2lnbl9kZXZpY2UNCj4+Pj4gY2FsbCBp
cyBleHBlY3RlZCB0byBoYW5kbGUgYW55IERUIGRldmljZSwgcmVnYXJkbGVzcyBvZiB3aGV0aGVy
IHRoZSBEVA0KPj4+PiBkZXZpY2UgaXMNCj4+Pj4gcHJvdGVjdGVkIGJ5IGFuIElPTU1VIG9yIGlm
IHRoZSBJT01NVSBpcyBkaXNhYmxlZC4NCj4+Pj4gVGhlIGZvbGxvd2luZyBjYXNlcyBhcmUgY29u
c2lkZXJlZDoNCj4+Pj4NCj4+Pj4gMS4gSU9NTVUgUHJvdGVjdGVkIERldmljZSAoU3VjY2VzcykN
Cj4+Pj4NCj4+Pj4gSWYgdGhlIGRldmljZSBpcyBwcm90ZWN0ZWQgYnkgdGhlIElPTU1VIGFuZCBp
b21tdV9kb19kb21jdGwgcmV0dXJucyAwLA0KPj4+PiB3ZSBjb250aW51ZQ0KPj4+PiBwcm9jZXNz
aW5nIHRoZSBEVCBkZXZpY2UgYnkgY2FsbGluZyBzY2lfZG9fZG9tY3RsLg0KPj4+Pg0KPj4+PiAy
LiBJT01NVSBEaXNhYmxlZCAoLUVPUE5PVFNVUFAgZnJvbSBpb21tdV9kb19kb21jdGwpDQo+Pj4+
DQo+Pj4+IElmIGlvbW11X2RvX2RvbWN0bCByZXR1cm5zIC1FT1BOT1RTVVBQLCBpbmRpY2F0aW5n
IHRoYXQgdGhlIElPTU1VIGlzDQo+Pj4+IGRpc2FibGVkLA0KPj4+PiB3ZSBzdGlsbCBwcm9jZWVk
IHRvIGNhbGwgc2NpX2RvX2RvbWN0bC4NCj4+PiBPSyB0aGlzIG1ha2VzIHNlbnNlLiAgSSB0aGlu
ayBpdCBpcyBPSyB0byBoYXZlIGEgc3BlY2lhbCBlcnJvciBjb2RlIHRvDQo+Pj4gc2F5ICJ0aGUg
SU9NTVUgaXMgZGlzYWJsZWQiIGJ1dCBJIGRvbid0IGtub3cgaWYgaXQgaXMgYSBnb29kIGlkZWEg
dG8gdHJ5DQo+Pj4gdG8gdXNlIC1FT1BOT1RTVVBQIGZvciB0aGF0LiAtRU9QTk9UU1VQUCBjb3Vs
ZCBtZWFuIGEgaHlwZXJ2aXNvcg0KPj4+IGNvbmZpZ3VyYXRpb24gd2l0aCBkb21jdGwgZGlzYWJs
ZWQsIGZvciBpbnN0YW5jZS4NCj4+Pg0KPj4+IEl0IG1pZ2h0IGJlIHdpc2VyIHRvIHVzZSBhIGRp
ZmZlcmVudCBlcnJvciBjb2RlLiBNYXliZSBFTk9FTlQ/DQo+Pj4NCj4+IEkgc2VlIHRoYXQgaW4g
dGhlIGZvbGxvd2luZyBjb21taXQ6DQo+Pg0KPj4gNzFlNjE3YTZiOCAodXNlIGlzX2lvbW11X2Vu
YWJsZWQoKSB3aGVyZSBhcHByb3ByaWF0ZS4uLiwgMjAxOS0wOS0xNykNCj4+DQo+PiAtRU5PU1lT
IHJldHVybiBjb2RlIHdhcyBjaGFuZ2VkIHRvIC1FT1BOT1RTVVBQIGluIGlvbW11X2RvX2RvbWN0
bC4NCj4+DQo+PiBJdCdzIG5vdCBjbGVhciB0byBtZSB3aHkgdGhpcyB3YXMgZG9uZSBmcm9tIHRo
ZSBjb21taXQgZGVzY3JpcHRpb24uDQo+Pg0KPj4gTWF5YmUgd2Ugc2hvdWxkIGFkZCBjb21taXQg
YXV0aG9yPw0KPiBSb2dlciBhbmQgSmFuIG1pZ2h0IGtub3c=

