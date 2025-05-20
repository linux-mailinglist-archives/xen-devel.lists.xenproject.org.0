Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBADABDEC2
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 17:22:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990936.1374876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHOnN-0003hs-Dd; Tue, 20 May 2025 15:22:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990936.1374876; Tue, 20 May 2025 15:22:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHOnN-0003gR-A0; Tue, 20 May 2025 15:22:21 +0000
Received: by outflank-mailman (input) for mailman id 990936;
 Tue, 20 May 2025 15:22:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v48c=YE=epam.com=Oleksandr_Tyshchenko@srs-se1.protection.inumbo.net>)
 id 1uHOnM-0003gG-B1
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 15:22:20 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2613::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 377af172-358e-11f0-b892-0df219b8e170;
 Tue, 20 May 2025 17:22:18 +0200 (CEST)
Received: from PR3PR03MB6412.eurprd03.prod.outlook.com (2603:10a6:102:7d::8)
 by DBBPR03MB6843.eurprd03.prod.outlook.com (2603:10a6:10:202::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 15:22:14 +0000
Received: from PR3PR03MB6412.eurprd03.prod.outlook.com
 ([fe80::2887:9068:38f6:8340]) by PR3PR03MB6412.eurprd03.prod.outlook.com
 ([fe80::2887:9068:38f6:8340%6]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 15:22:14 +0000
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
X-Inumbo-ID: 377af172-358e-11f0-b892-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iBjvGbu/0vmUtunntwx9tn67GFW2jT+88JyiNxyrDhVgQOWbJ+IqVzkLZGfzEwg0IOH9a4Ew3sPx9pucWrsqkjp218Jgbh4VUbAeJakVsgb3YyR58FF3VAVtc5ehpVNKmZBRsOjlRJr7s/DbvXFiEym5pFg9sVKohYZXlObOC/cm1QFl7dNXbxKh1g2dNnbrS3UuSowa1ORNEk9bQjCN+eUZqup9OKQ4PQSHLgim93MjmmBELidHlvvNo9X+G20lHNeGzSPXcndNkw4Xmd7noIV5eqs4JoVUdacEZKYeQlwyJ/sPrhtZlmhxETgzcEHMWBfTsRtzEGIByijZgBDOHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X7DJWiPDJy5PhRYCIIt7cSltDC5ZIuEapP0V3N+U8G8=;
 b=y1mKHNXD5wMNiO9FVLGEFdOziI5VrNvOrWREJlPC2tHyUscAK7ixfIhyFPkmRz9fFserxTGCTZEbCz6J1N3tRuiQ/mMFmsixs+saXSZUVK0ZqGay/I8Dlj6Oz9sj66OAhRIRxCnQXKPkd++lHBYH/l9vAmnxQ5kswvt+wbuxBsAD+d8ilqXQxfw5bvU0Eqf/XGji6BnBtHYrkEnsxBZFyFnhQGG4pyJY/cGud1rFVhfb/w2yFcXXkPOQ+0Inz+laSduikycA9l8gxMhH7wbP878njtYqanjV1jESxCkA7FYGDnHnYuCBd9FSqKhM6rtS8c5/E/V9TIwRzwyIuzJdcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X7DJWiPDJy5PhRYCIIt7cSltDC5ZIuEapP0V3N+U8G8=;
 b=RCFaaEbwco1RRGGRyfSpTt2NGPyXPgXbVDcUcjT2O5LuskV7HgtB8UaaabCYU8FgrcIecoNqnYiYYgr1sr4N/g76Ra/LytjKZRJU8kLP10RWZXC2JWQSONmFrfcxID7kJn0AA2iEStLEDdH8DpN3JykMTeRGAQBlKiUUa07f/fNzm4VWrcGyCW4ieumGkMy9WM3LrBqsciPbMpqLYFyxbH5G7ZZ//kopt4/xCZa0Tt/+Gx0Gxw+neijLEpor1xUPOwTojK9RWW1xZwitEvSXPe7OOovyZ7BCOCIEvruzoGg3PasMj/NBds/vtVaevsh/c2iw2LSXdnnlWZDvmgIZUw==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] arm/vgic-v3: Fix write_ignore_64's check in
 __vgic_v3_rdistr_rd_mmio_write()
Thread-Topic: [PATCH] arm/vgic-v3: Fix write_ignore_64's check in
 __vgic_v3_rdistr_rd_mmio_write()
Thread-Index: AQHbyY3It6QrN0GxI0mChLdwI1GDxLPbnUIAgAAFjoA=
Date: Tue, 20 May 2025 15:22:14 +0000
Message-ID: <d9a384d6-b44c-4872-960c-023c6b625efb@epam.com>
References: <20250520134751.1460968-1-oleksandr_tyshchenko@epam.com>
 <f1e13b59-d7ec-4143-b859-ccc8777313bf@xen.org>
In-Reply-To: <f1e13b59-d7ec-4143-b859-ccc8777313bf@xen.org>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3PR03MB6412:EE_|DBBPR03MB6843:EE_
x-ms-office365-filtering-correlation-id: 4b3ed164-1bb5-4a14-60ba-08dd97b2198d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bVBUdDJ6ZjBBWk9pLzRQaVk3SU5oWllLVDZDZW5JY0IwWVJCWnhxdHZlUG44?=
 =?utf-8?B?dWxkRVF3SEszVmxwcTYyV0NoZVg0ZGZoeEdxVy9HK1I3TElKSHZWd3o0cGh1?=
 =?utf-8?B?YVdRUU9JNlpqV2dyYnJCMkltVzVRU3RBalZOUzREd3JOYUcrRHBweGZaMjBR?=
 =?utf-8?B?Z3hjYmdGWTZoS0Z0N0N0SEFSUGlrb1B4RC9GRmgxeFNBU1dsOWNPelBFZnli?=
 =?utf-8?B?Y1YzNWNmNlhlZnRVOWFka25oK2dMNm9EL1ludEJHcTVCYXZVNzV4eS80eDhI?=
 =?utf-8?B?TXhGdG1RTmNUVE5keE4yZExrSUJyNFRqV1kweEt0VXd5MEIvUmxHMllPQ3hs?=
 =?utf-8?B?eSszdmp0aXVTR3NwZGt3QmFOYXdwQlVqYVRlcmptQ0ZSSjYwYllwb0pNODVp?=
 =?utf-8?B?VmpJVGNONHVHakwyWXR0bnBTRERHSS9NWVpid0tNT2FDRDBMcm1YcUdaSGdY?=
 =?utf-8?B?UU1aVi9hL1dPeDRYU3d3MjJLZ3BEWmtQcVMzckttaFdncWl5c1AvRjY5VUpo?=
 =?utf-8?B?dHF6RmJmek5WVWE3OVVBNlJMd281SklIOE1KVVBpQVoxbCtFQUd2bVNNbUkr?=
 =?utf-8?B?cHdRbzBQdGZrZ3owblRHTEo3WEplR2tJcHVxVmE3RElVQ0NQVU5pMXl0M1Ni?=
 =?utf-8?B?b294V2R5eUNxOXByTlI2NU5MaDFSQjEzVHZkYWxORm4zaE9SR2s0NmN3VU5Q?=
 =?utf-8?B?WU1hem9DNkgwbFFMK1lCSnlHR2U0RkVBeWljYlFORmMyVjdvR2R1eU5ML2xV?=
 =?utf-8?B?Qnd2WS9mZncrYnpJUTg2TitXRFR3R05FN3lRblVqQXZiek01TWJ1VUhrQTVY?=
 =?utf-8?B?dERWTnVlb3l5UEx2YXdkdmVIWjUzS1g4SDZRQVE3MEN4VERTYmozMmM1YlpW?=
 =?utf-8?B?Rmt6alhmMW5ZRTBDSHN5OVpQSmxpcmlVdlUrUkw5bWoyQmNoT3pFbkN5TU5D?=
 =?utf-8?B?UGpwWVNZZDZIT0J4ZG5xbTM2VUtBajRBbE51WWxXa3FnMHpCWmNCNnRYOVJO?=
 =?utf-8?B?TDk5aCtoYnZUNHRMRlR2dGlzSlJTUTZoTUQyUzF1bmFiWlQxMEQxL3lWN25B?=
 =?utf-8?B?WTI2QlNpdkMraytUM1pLeEdPOU10MU5TeE84WXQxUlUxRjFMeUhDbW9vSlR6?=
 =?utf-8?B?T09ISWoyWjRtMTZpejBZRnRlZGJuY0JBSzc4MGR0STdCTm0zdjZoQzBITGNB?=
 =?utf-8?B?S3Bab1lGZ3VkUzhFakxwdkQxaWEyZjBBc2p3cUVUU2FGRWJKd1pabFRuTUdX?=
 =?utf-8?B?cHAvMFJaTENLMXdUOEFmYTBPQjRmV3VNNU9ZeDJ6VXVZUW9tOHVFVTl4M2Vn?=
 =?utf-8?B?NG9WWU9nRTFqM0NHN01haGxSdUpnRUU5NzNpNFpNQVdBVjMzOUF6VkRrV0Fh?=
 =?utf-8?B?a1RrUjN5SVlPMjZ0TTV2Mk5wb1hYMis1QXptL0JPbGFEMWVDL05ncjZnbjV2?=
 =?utf-8?B?SFlSMTZ4TkdZS01iQ0RnY0JONDEyMVdOZUl6ZlBlZjRmbnUyb0FvOW1GWDdI?=
 =?utf-8?B?SlIwWDBwdXFJQnZCR29vRlcvTDl5d1lzcnpFaWdnOHh3SGdpTEdLQlBIYzAx?=
 =?utf-8?B?dlRYdW1TcTZieCtDeDJQeUE0ajlrZlpLRExwTG9zOFBDMDRIdmR6NDR0VDB5?=
 =?utf-8?B?aEJ0MFpHN0Q2bUxHY0w3UUVyVUlIK3E4ZmkweVJIZkNuU2RGQnZvNlppcjFN?=
 =?utf-8?B?Y1kxeVVnbk9IWFhRZDBwNHFTejlra2duUVFFSSthV2s3eXhnQzlyS0ZvazBL?=
 =?utf-8?B?YmRMVTJGTU5EcnJ3VHdYVTRyeUhHQXBYdjB4WFFiUmRoQzFwWk1ST1FhNTBL?=
 =?utf-8?B?VzJJYjRTaDNaOU1vSU9FWUtQYmY3WGdSS1VhTEN6d2ZtMGV6OGdJRTJGSnAv?=
 =?utf-8?B?eUZ0ZHZQdURDN3JXZkxITTB6WmhNZGU4VDNaS0FHQXZZaFZSUTZxeUUvMDFo?=
 =?utf-8?B?K1hheGZrckViazc2Tmo1d0ErNW9Oa2FUR3ZKcERRMU9KTFlVUDdIeW5UZFIw?=
 =?utf-8?Q?/5tZhzLI0GP7zDniTIfeHvpXnyqn0k=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR03MB6412.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RXBQVDJBeTk5TUU0QncyZE1YOU90dE9ZRlBrSUNKT0hiNHpnczVoZXZ0aXA2?=
 =?utf-8?B?OFBrVGhEZ1hoQ3ZzSSs4NEtaekl2bmF4M0RqS3Jlem1nNUdyY0lMaVJNZ0lm?=
 =?utf-8?B?aW4reE5TMldNNnJ2c2QwSVQwaDE2OFBWTGxvcWtuekltV3J0emdhb1VtZmc5?=
 =?utf-8?B?R3VNcEwwd3lUUzRkQ0hQMVZYVmRjdlQ1M0pTWE42MnJwcGREZmlzUVpOLzJj?=
 =?utf-8?B?QUhPNG92SHBqR0JTckJLVGVuL1dEL20yS0ZxQ1RMOGRaZHY5ZlRrK1FQdENm?=
 =?utf-8?B?R2pEVmtRR2tTL2dUckdQZzEzM1VnNkNLUjBKTHFnNktkV2NmeGZwNXoxREl0?=
 =?utf-8?B?eEhhSlZMRGpiY3V3elY5TDFXV2ZjNkVyQ2tBRUxnc3puWUF5NHRNc3JCUkIr?=
 =?utf-8?B?aGk2UVQrbnVMSzRCRHFrNjFQOHk0cWliSjNhUUJlUE9nREhvWG5ZVlVuVDAr?=
 =?utf-8?B?SWFDUzlkUXZBcnVUNXFnUm1UUmpKaTl1eXRNaU1LQzcxbjJWZCt0VGNtaklS?=
 =?utf-8?B?Nmg1RE53dEg3MDhNbVB6UjF3eG1xTEk3YkJEREcwQk52dUJOamI3UThBKy82?=
 =?utf-8?B?V0dicVlsRytrVk9sdWtDaUg3UXNzY3BFcUpBOVBnekxQUFUxSWRmQ0F6cmZG?=
 =?utf-8?B?cjRkejdlRHFnVlRITXZ3RTlFZkFCUUVmSGpLbTVhNlpvWVgwNjRlWHYreDBN?=
 =?utf-8?B?K0dqbkJvcUI5SmdDd2xLeVN2OVhtRDRRUVRkNHRWZ3pMT053RUFKb1hzLzhG?=
 =?utf-8?B?NThRQjhyaEZhSjlyZ1h2emRvWDQ4UnpuTDEzdTRJdFRBL0NJSmY4NCtHcWlj?=
 =?utf-8?B?bGQ1ZUNDYzlPa2lSWG9Da3lMeDlhQkpvYlNQQUlPR081MVRFbEVYeHBHR0dY?=
 =?utf-8?B?dGxlME82akVuTno0TFZhak9saUtEL2NQUEVQdGlEc0NFV0FEb042TmNkdzE0?=
 =?utf-8?B?VEx6L0NMY0xYN2d5V3dBRmtoUHdjemVVMkhCWm9ONENGSTUxUzJJVDFDNU1Q?=
 =?utf-8?B?Z3p4OWlOVEV3KzF3NGlYeVhtOVBwd2ppUkllRG5kM1hVd2RLeXI1MW81ZG1R?=
 =?utf-8?B?VW5QN1JLOHRzdlh6TFJUL1AzVU56Nko5VzFzSEN5eEFieWl3NFRVYUhYSFdN?=
 =?utf-8?B?cUpvUWFYblhLb1VFcWgwL0JuT253WnJ6VFNvRkZpVURqQVVEK1ZQYzNTSzZn?=
 =?utf-8?B?UjNRNUxra1dCTksrcWVKNHlEL25teU9nSzlTejNLbjZIQ0RVS3FndVZaS29Y?=
 =?utf-8?B?OVdRUHZ2MnZCVGs0VmVmTHp3UURNTmVMTCtKaVdhV0wzS1BDOFBvNUdOd29R?=
 =?utf-8?B?VHJMbjBWVDZSYjExVWhzd0lYM1BZeG5GZVJGbk5PZmljT0cvQzR5Sm1HL3ZM?=
 =?utf-8?B?VTlSajgzTnNLSERmNVF0NnpXdFNLc0Z6NXBGeVpDSDJFS2pNc25kOFo0dStD?=
 =?utf-8?B?dlAwSnVvMmMyUG10VUxmbVpqS2xITW15RFRkR0NablBGSXY1N3g5RTRURWxY?=
 =?utf-8?B?Y2VWcU1GN3VYRWRybEMvMHhLQTg4TTgvV1ZQQmpmVktsdXVsYnJ2QkNkY1ZH?=
 =?utf-8?B?WXFHQ05YNjIwRUVqT0wrbGdmZjRKak9uNzBJeDlYNDZtWlBsaUxYOW96eUlz?=
 =?utf-8?B?UmxDVzF4UTNUTXBJYlNKT3E1NEUwYzdCVjdhdm9HVFFmaVk0eXNWNW44R0kr?=
 =?utf-8?B?L1BOajJ2UU5QOUFQNlN2MjlUS2UxblZkWHdtSWJ1OTZPMjY1WHpLQ0RoV1B2?=
 =?utf-8?B?QmpaSUIyeGt1bWMzY3NEcTg5WlFnNlR3cVYzaHFueDlzakIvSzZvR0RBVTF4?=
 =?utf-8?B?RklJUGdiaWdoTDh0Z0tCc1RuNXdRMGhZSjF6b1o4SURIdEQycEhvZzJsVE5G?=
 =?utf-8?B?VDkxOFJveWJSc0xwNUw0RU1Ua1pzRmNWRG8vcEpXemE4U05qT2s2eHdrc2RH?=
 =?utf-8?B?dW1vQWhXUXVYK21sZ0ZCdXNBVkk2OWlsSlUxQlVsQ1BqOG5wQXFTUWpHaFBk?=
 =?utf-8?B?TkMyb0E1cDRlS01BU2s1czFuVXpHTjlIWXNGYml1V2Nwc2xTa0hQTzVBUVZt?=
 =?utf-8?B?aHBJRWtacHNzNWNQMXZ3K0hHQmhxWUFaTVVuMW40bU9vY2p5dE5wWmo1ZGRU?=
 =?utf-8?B?UXRuaTUybEo2V3VSSzlQRXdxWE9ycGJURWkyMi8rWFpqZFFmN0NIcnhUeTM2?=
 =?utf-8?Q?5Mh0BC1YSE9zH1Wqz3jouEQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2FEC29AAE566E541BC0CFC68E1EF3A73@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3PR03MB6412.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b3ed164-1bb5-4a14-60ba-08dd97b2198d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2025 15:22:14.4820
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D31/BQsA8aCetpT8nmFzsTDaI5S2AKiIueeeVVv1KAcdUYcQBV8vZWVnfiX+LGBmfzEDlvAZWmr1PfxsPqyOlA+Sd0bK/I2WfchQEBqIRpA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB6843

DQoNCk9uIDIwLjA1LjI1IDE4OjAyLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+IEhpIE9sZWtzYW5k
ciwNCg0KSGVsbG8gSnVsaWVuDQoNCj4gDQo+IE9uIDIwLzA1LzIwMjUgMTQ6NDcsIE9sZWtzYW5k
ciBUeXNoY2hlbmtvIHdyb3RlOg0KPj4gQW4gYXR0ZW1wdCB0byB3cml0ZSBhY2Nlc3MgdGhlIHJl
Z2lzdGVyIChpLmUuIEdJQ1JfUFJPUEJBU0VSLCANCj4+IEdJQ1JfUEVOREJBU0VSKQ0KPj4gd2hp
Y2ggc2hvdWxkIGJlIGlnbm9yZWQgKGkuZS4gbm8gdmlydHVhbCBJVFMgcHJlc2VudCkgY2F1c2Vz
IHRoZSBkYXRhIA0KPj4gYWJvdXQNCj4gDQo+IEkgYXNzdW1lLCB0aGlzIGlzIGEgZ3Vlc3QgZGF0
YSBhYm9ydCwgcmF0aGVyIHRoYW4gWGVuIGNyYXNoPw0KDQp5ZXMNCg0KPiANCj4+IGR1ZSB0byBp
bmNvcnJlY3QgY2hlY2sgYXQgdGhlIHdyaXRlX2lnbm9yZV82NCBsYWJlbC4gVGhlIGNoZWNrIHNo
b3VsZCBiZQ0KPj4gaW52ZXJ0ZWQuDQo+IA0KPiBPT0ksIHdoeSB3b3VsZCBhIGd1ZXN0IHRyeSB0
byB3cml0ZSB0byBHSUNSX1BST1BCQVNFUiBpZiB0aGUgSVRTIGlzIG5vdCANCj4gcHJlc2VudD8g
V2FzIGl0IGEgYnVnIGluIHRoZSBPUz8NCg0Kbm8sIGl0IHdhcyBqdXN0IG1lIGV4cGVyaW1lbnRp
bmcgd2l0aCByZWRpc3RyaWJ1dG9yIHJlZ2lzdGVycy4NCg0KPiANCj4+DQo+PiBGaXhlczogYzRk
NmJiZGMxMmU1ICgieGVuL2FybTogdmdpYy12MzogU3VwcG9ydCAzMi1iaXQgYWNjZXNzIGZvciAN
Cj4+IDY0LWJpdCByZWdpc3RlcnMiKQ0KPj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIFR5c2hj
aGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPg0KPiANCj4gV2l0aCB0aGUgY29t
bWl0IG1lc3NhZ2UgY2xhcmlmaWVkIGFuZCBBbmRyZXcncyBjb21tZW50cyBhZGRyZXNzZWQ6DQo+
IA0KPiBBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCg0KdGhhbmtz
DQoNCj4gDQo+IENoZWVycywNCj4g

