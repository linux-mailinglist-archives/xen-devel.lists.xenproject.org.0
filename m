Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D06D9E4D3F
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2024 06:24:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848841.1263627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJ4LZ-0007Tg-PB; Thu, 05 Dec 2024 05:24:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848841.1263627; Thu, 05 Dec 2024 05:24:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJ4LZ-0007SB-MB; Thu, 05 Dec 2024 05:24:17 +0000
Received: by outflank-mailman (input) for mailman id 848841;
 Thu, 05 Dec 2024 05:24:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=coHJ=S6=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tJ4LX-0007S3-PS
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2024 05:24:16 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20631.outbound.protection.outlook.com
 [2a01:111:f403:2413::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29af72b1-b2c9-11ef-a0d5-8be0dac302b0;
 Thu, 05 Dec 2024 06:24:14 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 MW6PR12MB8897.namprd12.prod.outlook.com (2603:10b6:303:24a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Thu, 5 Dec
 2024 05:24:09 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%5]) with mapi id 15.20.8207.017; Thu, 5 Dec 2024
 05:24:09 +0000
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
X-Inumbo-ID: 29af72b1-b2c9-11ef-a0d5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dZrMNKeAbkh+Q5jfoKuWakCH1iZdTyFSOHuzXltULjcR9t1x7z8ErBLlsb5TttTYWo6wjycY1ZIoOI05RVqym2aw+hHyLr+EF9biLPW/p/ISKD7okc3ynVf5UJrDK49DDMm9VSY/u8IZb9T9tl9Z32LFSM8cbWERHWfJadoTXPW/bp415bsZKGTms4yVmGnMBpUsd1UhieJMNaMyud3qVzj5vvxiPnR/ulnKHaEY4oAmIVMhUf1uU0Ls4cCPMu36Q52+SGYey8YYcti7OtmZWH9nvcu1OO3t3bLuwpIMzWytgxXnQuOUCKn4cwGEUE4pt0MoRHLZIxwt0247qiQlhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9QGzr0bpIIS6cGjua0AR48f45vIQxjwsO4CcqQH7VWU=;
 b=HP+oif/7ddYsdneV4cR/IJcOpGFOu16T2MdY7jxNgp+8fWk1a/EoXqQhMtCtNBcQDBsPSKnYE0LBZDXmsDps+47eeGuJ8zvXvcdYMU/3glgAWe/xcsZVh3C2Dc3ApnP0zCDOlHhpfY65GOkk7jDtFJb81mqCBwcq6taJMNFsZN03R8T0n6RIMwq+BTjQ/ndI23rONeXToj3R2hlbGnVf5UShc7mMfU5gYRMVz7WIZae0BTdiB8m+no7L6IOkRuY2VCFuskbJ5QYcDKgmeI9RRb/Jhvolce7+6qN8xlK99QtA8PZvNgpLMRDz5NP7oPihLTJ9Nzfdjv3kRSRlN5wwDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9QGzr0bpIIS6cGjua0AR48f45vIQxjwsO4CcqQH7VWU=;
 b=2XGSNPs0WLJDZGdqLnmGGL/cqClB9S6hAtzEWys1HnlZIF38r6stK8Sic6yDEn/lBHUK7qWKQzBf2G0ykjJfJ1dUVERMaNIavSG8k2M1xlGORHZgvwRBCH5fDEPX5DTSWrq1TAehsG3YYZpeET24YTTiN+/5oGAFzJ1Z/f1TSHw=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: "Andryuk, Jason" <Jason.Andryuk@amd.com>, =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?=
	<jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Oleksandr
 Tyshchenko <oleksandr_tyshchenko@epam.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "Ragiadakou, Xenia"
	<Xenia.Ragiadakou@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
Subject: RE: [PATCH v1 1/4] xen/acpi: upload power and performance related
 data from a PVH dom0
Thread-Topic: [PATCH v1 1/4] xen/acpi: upload power and performance related
 data from a PVH dom0
Thread-Index: AQHbRiYT0x98jyXl30G0kVQmyAsIc7LVwRsAgACzWQCAAKqSkA==
Date: Thu, 5 Dec 2024 05:24:08 +0000
Message-ID:
 <DM4PR12MB8451450DB78B350A9F46725FE1302@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20241204082430.469092-1-Penny.Zheng@amd.com>
 <20241204082430.469092-2-Penny.Zheng@amd.com>
 <fc2ef8da-62e8-431a-8a1b-508b3f9d5ef4@suse.com>
 <89ab9108-aa40-4da4-8e9f-dfa3bd49e2f4@amd.com>
In-Reply-To: <89ab9108-aa40-4da4-8e9f-dfa3bd49e2f4@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=6ee03fae-d4d4-4996-ae84-4d17a9756712;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-12-05T05:22:22Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|MW6PR12MB8897:EE_
x-ms-office365-filtering-correlation-id: 0b3f2a9b-7412-453d-d6b9-08dd14ed0b92
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RXVoYWRNcS9VdTlyaERlSHNwekQ3aXhKd2JEcEpINHlKT3E0MCt2QlRmOUM3?=
 =?utf-8?B?Q0w3YnpVMk91cFVSWEU2eTA5SDJHekJvRlMwalFQczM4ZUxPUElsMEJBbVdo?=
 =?utf-8?B?MTN2WVVOeVZrZDhWTjQyWmU5dUNnVS9zbjBLaGpSbVNUanpIc1NmYUVzbzMw?=
 =?utf-8?B?L1RhaDdOZ2FZbXlsN0hYNHk4OG5sZlBaTFcvcm9TSHpwbnY4MVYrLzNYcnlx?=
 =?utf-8?B?UXBWVTAwYnBqR1hOaFBhM2x3bHQ3aHVuRnBHQlhsb3h2RXNrVFp6THJEOXFP?=
 =?utf-8?B?LzlOUjArVkxITnNrWmhPVFc4NVpXeHlzUzJEWTdZTEdyazZOZUNaRUdDM2tk?=
 =?utf-8?B?VERoTDJ0dGh4NmZLVjlseWtDTFE4eXBsMUdTN2kralBmc0Q5bHA5VFJHckJL?=
 =?utf-8?B?RmxtV3AxRk5YaG5CdCtUZXBvM1NlbStQUi95cXE4K1dGWng0enh2eUEvdnUy?=
 =?utf-8?B?TkZUVnY1U3pWalBwYmtSeWJUV2M0Z2ZpM0k1d3RqMFM0VHNqR1FjMVg0bkdW?=
 =?utf-8?B?Wm9SMkI1OEh0NkVYckgrN1Z0QlZ6N1dtQkNRTDMybldnZXU2cjc1NTkrU1dt?=
 =?utf-8?B?ZlQyajJxSXFvRUNjVXBHRmorOVNsbG1SbUxXL2lPRzZOYi81dkt6cldLb1I5?=
 =?utf-8?B?YzJZYTlzdW5MbS9WaUxEZ1d2cHFvZVQzSiszOE9saWJYQW9NZzhxSkE5Tjdi?=
 =?utf-8?B?aU9FUStGSFpTcUd5NlJ5cE5ZakJDNWdQTnBMTmZkQ2VMUmlvT3BEam84MmYy?=
 =?utf-8?B?WkFqUUdDb0U3K2xUd1VGWi85aGd1WDN4d0RhVGxlVUQzdTJ3SS9RRTc0Uldu?=
 =?utf-8?B?czMrQi9MSTQveUNPRWY1ZzA4ZXp6d292dG1ENlExODJuaVN3V2JrZ1pkd3VR?=
 =?utf-8?B?VGx2VjE2cUJwckNCNW9icDBxYnBiOVZoK2MwNWpLTU5raStDTkszcmRuU2F6?=
 =?utf-8?B?RXN5LzhscHp1VlpwUk5JMEVoZEgvcUgzU2tKdmJjRkV3WFBnTVBVVHNBL2VD?=
 =?utf-8?B?aDVJYTNMeDB5ZVhSWHFYT2o4UmE2NVE0cmcyTWk3ZTBmcS9LR1dEdldEL1N0?=
 =?utf-8?B?OURHR1dIZzBBKzlrMzJJOVoyNGpmbFkwUzkrd0FKbzBCWE9DVk5hNmkvaXho?=
 =?utf-8?B?WHR1UUhycVBiTDZmWVEzYldaQkZ1Ukw2S2RaREVjWFAyU3BUSUZSYUVlNHZX?=
 =?utf-8?B?YUJsNkdKY2tkbGE0RFN1QjlJLzJqQkdvVWllZlB2WVFPckw5cVJEbXJtK0h5?=
 =?utf-8?B?R2pjaXk5ektOWmlpNXl1ZXpOYm9wOERtVTJEdW9pa08renJmZ1RHaDVjcE9v?=
 =?utf-8?B?VlA4WDFXdGRxaHRkM0tEang3N2RPOEJocktZbGVBN2FTbXFuWnRIYSt2UHhv?=
 =?utf-8?B?L2ltd0VhbGNNcDZFTTFOVE1XdTdSYXZPMU0yQStaTllHR2pvQjdDRXlkK3hn?=
 =?utf-8?B?RFpqQUpwbVVYY2FURTkxaWRIbHZDZWVFcUZYU3NlaGpoRko5aEtpdmpDQmRC?=
 =?utf-8?B?ZmMrU0dKNzBzWEttTFZMOFA2REJ3QVhqU3crVFNvYy9ZeWM2djhPNWI0ZXBB?=
 =?utf-8?B?dEFqMlEranJXclpKQTlSTFRiamRpelBQU3kvZ1hSQ1VqOWEvOGlzOWk3a3pr?=
 =?utf-8?B?WTVKOHZFT3JhVDJYTWw5MjR0eW5HanNObitsR3lqWGpSSURJZW1LMDQyTVFw?=
 =?utf-8?B?aVZESGt1MVo0a2xsSFFjY01CS0JUNmFKNTZmNFJSdGhoMWlDOHU2OENlajVC?=
 =?utf-8?B?N3FKWTl6dC80RVZXOTh1S0h0TCtMZnM2RVdBK2thTkg4VURqcGVxYWxGQW9N?=
 =?utf-8?Q?nphfglkOoHP9hy01Us6/RWoa/tEdassn61JG4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VUF0QS8wTDZrUkdGZUhlcG40U3BBUnMwRFJXaVhwWElZTzZzTnFtcnNtYkEw?=
 =?utf-8?B?VjR2N1E2TmpzaTRCWHFoL2NtbzJpbnJqVzhiUnB1UHEwYWxwNmgzUlhDSnpi?=
 =?utf-8?B?dDdqaEV6WXNRZmNSVjhadzZHV3VUTU9sRmJmRE85dGxVZlljSG13Ri9LcitI?=
 =?utf-8?B?d0tyU1NoSlEvUmN1N1B4U05HWWdLQWNvQUNKOE9Sek9yKzRZVUxxVXhtaUVj?=
 =?utf-8?B?emk0VTMxY2hudjJMUlFBS2ptNkdpeTdkUWd4UHlQMnd1Visvelh5dUxxYjUy?=
 =?utf-8?B?UThNdCswMzcxUzFGc1J1TW00Z0IwYjJ0ZFVKdFkzNFphZzhHcGkyNnkvaDNN?=
 =?utf-8?B?UlRhakhtYVFvU3dvWWM2UlRTMEVsdm9LdGU1WWpoc2pqTzVhVlhsWEhyR2ov?=
 =?utf-8?B?MzBlL1BrUG80NUV1dmdaRkJNaFpUY1VQSWZrbnpxbldNVDE2RzFhN2FPQkRl?=
 =?utf-8?B?ZlRXbWZaUWVuelBYMjE3SHpNRzRZVDU3TVhQZllNNktJN2ZoOHNZYTJ2Wmg2?=
 =?utf-8?B?Z2NNQzdtUXc3bzY1Yis1RVZ3clQvN0M4dnFmZkRicGl3U01mVExHeU5IdzRy?=
 =?utf-8?B?MEtIMDkzYmRmU3V2T2ErdG1hK0c3OEJZR0JXMWIxbGliK0xNUVU5RWZKWE5Z?=
 =?utf-8?B?cVFndW4xc3JTRFErTSt6TFhicFZPcVpBS21IMjYwbkFtQklvSXBpcjBLTDAz?=
 =?utf-8?B?WXNVckZaMERvdmRGdHRvemxYNUNNVEtyVEJVUmsxZmhVWmcyL1BRM3BORXo2?=
 =?utf-8?B?U2RicWp2eWI0VDRMdVVZYzVqZHFBY05QbVNUMElOd0lETUJRQVZIRHpvQ3pH?=
 =?utf-8?B?dFhJbVNlVTRld1M0b0ZoZXVyTEJxWWZ4d2NhTFVpK3pYZjViR3JHOXI1cndq?=
 =?utf-8?B?dlRkZG1tek8zenM5ay9NUWhidTZXRFNob0hXZ1dVbDZRL3JxNDczcTlJOWZh?=
 =?utf-8?B?VUx6S0RYaVNIcldhS2NEOFM1VVBXVEx4VUFsNFNUeGVaTDFVcnJncGdsaTRp?=
 =?utf-8?B?WEpvT2FoMUhZSHlxYWZJSjQ0WWtmRDNvSnFzTHQrUVdiRjh4L0gwa2RHc0dx?=
 =?utf-8?B?ZXFMZ1A4MGlwZjVDMU5STWsrRnJPaitLSVh5R2w2NFA4MGdRRzRkRVlYaGlD?=
 =?utf-8?B?Vm9jR0pBR0MwQXo5aW9tU29BN1dtbmxocWJuR3FnOXpBQjZDTHBYbkRibVdV?=
 =?utf-8?B?bWwxL0hCR0tyeFFZcnB2bE8rR2swaTlJMVkrZk12K0JhNGdIZG1wVG5YWjVN?=
 =?utf-8?B?cS90eUFZVVQ4S2M4R0pUQXJVazFRQk9pSEF3UVJzd3luS0k3MEd0NG5tM05t?=
 =?utf-8?B?bmZmTnM2UDBRTmw3Rm42bnRQdzhDdFRuYXRsZFhyd1RDb0Y0ODlnZy93Z1Bi?=
 =?utf-8?B?NGhEdFhTanArbk1CeTJoTWx0aFlycW4xaHE2eUdocUJpcUZLVXdneStBdzJM?=
 =?utf-8?B?TUprN0ZHaEs0V21lb2R0eUZ1SGV2MUxibG03KzBMaERNTGV4Rkp3d3RsTllB?=
 =?utf-8?B?VUh2b0VUdUtKNzJXMlJKOU9lR1lHRXEvUU4ralBNNWRZcG9lQUkrMDd3WjBK?=
 =?utf-8?B?c20yWGJVY2pSemlVdTlNMnM2VDhRT3g4NjAyRG9vdEVtQmYrZWpjR1Y4TFJ3?=
 =?utf-8?B?bU1MWVJUZWRZdm1VQms5OXpEMUhEZkxjSUpkUkp5RFZWNmRUY1BpaC8rdTJO?=
 =?utf-8?B?SUJ1U052WHJwOGtIUHgwNGZ6T3d4N3MrRW9jeFRqRWVMeml4TjMwUFhDZ20x?=
 =?utf-8?B?bUhmR0YwYzZnQzU3T3ErSkI5c0NpWjdCb3B0d01BWVRNZ09saVNZUjJvYUdt?=
 =?utf-8?B?OUtyeERiTURKbnNJMk10aXlDa2VxRmU3eUttMXBsK1h5eXc3NldMUjUzYU8x?=
 =?utf-8?B?aTlQRnlxekw5WVRqdmhmOFVaUjQ2RkgvY2s4alZWK0Yzb1NxWjZnaTNxNUhW?=
 =?utf-8?B?R2wyK3ArQnpQbk1SSTFJSWQ0dThtZVMvQXN3RitZM0w3b0svak83S3hGTE0v?=
 =?utf-8?B?ZmZKbitUYURUemU1M2ZiQ2ZTeXhPSk05ZkhtWW5aYWNUY2N6N1hMZ3FOc01L?=
 =?utf-8?B?aUR0aUNUaEowbnNQa0hNcVhxQWZndnZmL2UrSVNoaU4yRVJzRXhyYUkvNjN3?=
 =?utf-8?Q?EulA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b3f2a9b-7412-453d-d6b9-08dd14ed0b92
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2024 05:24:09.0317
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IRo0r+cuMXYw8S5Uf1R2xHZ8r19ihcReoOkXIJcOT5Rs4ODWJ86/ygRXwpTrEwb+E2P0vcZuiafJeHXiK/Baqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8897

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFzb24gQW5k
cnl1ayA8amFzb24uYW5kcnl1a0BhbWQuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgRGVjZW1iZXIg
NSwgMjAyNCAzOjEyIEFNDQo+IFRvOiBKw7xyZ2VuIEdyb8OfIDxqZ3Jvc3NAc3VzZS5jb20+OyBQ
ZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+Ow0KPiBTdGVmYW5vIFN0YWJlbGxpbmkg
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBPbGVrc2FuZHIgVHlzaGNoZW5rbw0KPiA8b2xla3Nh
bmRyX3R5c2hjaGVua29AZXBhbS5jb20+DQo+IENjOiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1k
LmNvbT47IFJhZ2lhZGFrb3UsIFhlbmlhDQo+IDxYZW5pYS5SYWdpYWRha291QGFtZC5jb20+OyB4
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJu
ZWwub3JnOyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU3ViamVj
dDogUmU6IFtQQVRDSCB2MSAxLzRdIHhlbi9hY3BpOiB1cGxvYWQgcG93ZXIgYW5kIHBlcmZvcm1h
bmNlIHJlbGF0ZWQgZGF0YQ0KPiBmcm9tIGEgUFZIIGRvbTANCj4NCj4gT24gMjAyNC0xMi0wNCAw
MzoyOSwgSsO8cmdlbiBHcm/DnyB3cm90ZToNCj4gPiBPbiAwNC4xMi4yNCAwOToyNCwgUGVubnkg
Wmhlbmcgd3JvdGU6DQo+ID4+IEZyb206IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPg0KPiA+Pg0KPiA+PiBXaGVuIHJ1bm5pbmcgYXMgYSBQVkggZG9tMCB0aGUgQUNQSSBN
QURUIGlzIGNyYWZ0ZWQgYnkgWGVuIGluIG9yZGVyDQo+ID4+IHRvIHJlcG9ydCB0aGUgY29ycmVj
dCBudW1iZXJzIG9mIHZDUFVzIHRoYXQgZG9tMCBoYXMsIHNvIHRoZSBob3N0DQo+ID4+IE1BRFQg
aXMgbm90IHByb3ZpZGVkIHRvIGRvbTAuICBUaGlzIGNyZWF0ZXMgaXNzdWVzIHdoZW4gcGFyc2lu
ZyB0aGUNCj4gPj4gcG93ZXIgYW5kIHBlcmZvcm1hbmNlIHJlbGF0ZWQgZGF0YSBmcm9tIEFDUEkg
ZHluYW1pYyB0YWJsZXMsIGFzIHRoZQ0KPiA+PiBBQ1BJIFByb2Nlc3NvciBVSURzIGZvdW5kIG9u
IHRoZSBkeW5hbWljIGNvZGUgYXJlIGxpa2VseSB0byBub3QgbWF0Y2gNCj4gPj4gdGhlIG9uZXMg
Y3JhZnRlZCBieSBYZW4gaW4gdGhlIGRvbTAgTUFEVC4NCj4gPj4NCj4gPj4gWGVuIHdvdWxkIHJl
bHkgb24gTGludXggaGF2aW5nIGZpbGxlZCBhdCBsZWFzdCB0aGUgcG93ZXIgYW5kDQo+ID4+IHBl
cmZvcm1hbmNlIHJlbGF0ZWQgZGF0YSBvZiB0aGUgdkNQVXMgb24gdGhlIHN5c3RlbSwgYW5kIHdv
dWxkIGNsb25lDQo+ID4+IHRoYXQgaW5mb3JtYXRpb24gaW4gb3JkZXIgdG8gc2V0dXAgdGhlIHJl
bWFpbmluZyBwQ1BVcyBvbiB0aGUgc3lzdGVtDQo+ID4+IGlmIGRvbTAgdkNQVXMgPCBwQ1BVcy4g
IEhvd2V2ZXIgd2hlbiBydW5uaW5nIGFzIFBWSCBkb20wIGl0J3MgbGlrZWx5DQo+ID4+IHRoYXQg
bm9uZSBvZiBkb20wIENQVXMgd2lsbCBoYXZlIHRoZSBwb3dlciBhbmQgcGVyZm9ybWFuY2UgZGF0
YQ0KPiA+PiBmaWxsZWQsIGFuZCBoZW5jZSB0aGUgWGVuIEFDUEkgUHJvY2Vzc29yIGRyaXZlciBu
ZWVkcyB0byBmZXRjaCB0aGF0DQo+ID4+IGluZm9ybWF0aW9uIGJ5IGl0c2VsZi4NCj4gPj4NCj4g
Pj4gSW4gb3JkZXIgdG8gZG8gc28gY29ycmVjdGx5LCBpbnRyb2R1Y2UgYSBuZXcgaGVscGVyIHRv
IGZldGNoIHRoZSBfQ1NUDQo+ID4+IGRhdGEgd2l0aG91dCB0YWtpbmcgaW50byBhY2NvdW50IHRo
ZSBzeXN0ZW0gY2FwYWJpbGl0aWVzIGZyb20gdGhlDQo+ID4+IENQVUlEIG91dHB1dCwgYXMgdGhl
IGNhcGFiaWxpdGllcyByZXBvcnRlZCB0byBkb20wIGluIENQVUlEIG1pZ2h0IGJlDQo+ID4+IGRp
ZmZlcmVudCBmcm9tIHRoZSBvbmVzIG9uIHRoZSBob3N0Lg0KPiA+Pg0KPiA+PiBOb3RlIHRoYXQg
dGhlIG5ld2x5IGludHJvZHVjZWQgY29kZSB3aWxsIG9ubHkgZmV0Y2ggdGhlIF9DU1QsIF9QU1Ms
DQo+ID4+IF9QUEMgYW5kIF9QQ1QgZnJvbSBhIHNpbmdsZSBDUFUsIGFuZCBjbG9uZSB0aGF0IGlu
Zm9ybWF0aW9uIGZvciBhbGwNCj4gPj4gdGhlIG90aGVyIFByb2Nlc3NvcnMuICBUaGlzIHdvbid0
IHdvcmsgb24gYW4gaGV0ZXJvZ2VuZW91cyBzeXN0ZW0NCj4gPj4gd2l0aCBQcm9jZXNzb3JzIGhh
dmluZyBkaWZmZXJlbnQgcG93ZXIgYW5kIHBlcmZvcm1hbmNlIHJlbGF0ZWQgZGF0YQ0KPiA+PiBi
ZXR3ZWVuIHRoZW0uDQo+ID4+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBBbmRyeXVr
IDxqYXNvbi5hbmRyeXVrQGFtZC5jb20+DQo+ID4NCj4gPiBJIHRoaW5rIHRoaXMgaXMgdGhlIFYy
IHZlcnNpb24gb2YgSmFzb24ncyBwYXRjaCwgb2Ygd2hpY2ggaGUgc2VudCBWMw0KPiA+IGp1c3Qg
eWVzdGVyZGF5Pw0KPg0KPiBQZW5ueSdzIHBhdGNoIGhhcyBzb21lIG9mIHRoZSBjaGFuZ2VzIEkg
bWFkZSwgYnV0IHRoZW4gSSBtYWRlIGFuIGFkZGl0aW9uYWwNCj4gY2hhbmdlIGFuZCBkaWRuJ3Qg
dGVsbCBoZXIgYWJvdXQgaXQuDQo+DQo+ID4gUGxlYXNlIHN5bmMgd2l0aCBoaW0gaG93IHRvIHBy
b2NlZWQ6IGlzIGhpcyBwYXRjaCBtZWFudCB0byBiZSBhDQo+ID4gcHJlcmVxdWlzaXRlIGZvciB5
b3VyIHNlcmllcyBvciBhIHBhcnQgb2YgaXQ/DQo+DQo+IFNvcnJ5IGZvciB0aGUgY29uZnVzaW9u
LiAgUGVubnksIEkgdGhpbmsgeW91IHNob3VsZCBqdXN0IGdyYWIgbXkgdjMNCj4gKGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL3hlbi1kZXZlbC8yMDI0MTIwMzIyNTMzOC4xMzM2LTEtDQo+IGphc29u
LmFuZHJ5dWtAYW1kLmNvbS9ULyN1KQ0KPiBhbmQgcmVzdWJtaXQgd2l0aCB0aGF0LiAgSXQgcmVt
b3ZlcyBhIEJVR19PTiB0aGF0IGNoZWNrcGF0Y2ggY29tcGxhaW5lZCBhYm91dA0KPiAod2hpY2gg
aXMgdW5yZWFjaGFibGUgYmVjYXVzZSBvZiBhbiBlYXJsaWVyIE5VTEwgY2hlY2spLg0KPg0KDQpT
dXJlLCBJJ20gZG93bmxvYWRpbmcgeW91ciB2ZXJzaW9uLCBhbmQgd2lsbCByZWJhc2UgYW5kIHB1
c2ggYSBuZXcgdmVyc2lvbiBoZXJlfg0KDQo+IFRoYW5rcywNCj4gSmFzb24NCg0KTWFudCB0aHgs
DQpQZW5ueQ0K

