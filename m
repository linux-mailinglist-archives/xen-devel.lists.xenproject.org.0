Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F05BD1C16
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 09:19:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141746.1475908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8CpM-0006yi-7D; Mon, 13 Oct 2025 07:18:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141746.1475908; Mon, 13 Oct 2025 07:18:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8CpM-0006xq-4Q; Mon, 13 Oct 2025 07:18:40 +0000
Received: by outflank-mailman (input) for mailman id 1141746;
 Mon, 13 Oct 2025 07:18:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gL+L=4W=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v8CpL-0006xk-2B
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 07:18:39 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d563f57d-a804-11f0-9d15-b5c5bf9af7f9;
 Mon, 13 Oct 2025 09:18:37 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 DS0PR12MB6392.namprd12.prod.outlook.com (2603:10b6:8:cc::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.12; Mon, 13 Oct 2025 07:18:32 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2%3]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 07:18:32 +0000
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
X-Inumbo-ID: d563f57d-a804-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bx5THhAG/B4Wnd/Q0dM336yqxDa66CNJrhbMgwCNSepePBD3LrMqOY4iWxpT0DoXlLw3fTuBtyyMVE5lBVPqbNEn6CzFZ9+EzyIUBgQwXddeSpuMvay5y7gxY3QZxgIb1IsPaSe0UtikqwXHGu79y2ggQqHuWchXfW03vY+aUzeqhEfMm591s7gu7yAfimyarmAJtKIE/x+vd5vyte24RGgHfyoI2sAP8qF8vBZwRagtHbYjXVKE+5yyVIxTX/LM4sNoPsUR14Y0Z2cnKxjpSr70+fJartVenREmihlj/cTM3KCwuNplmhiSTYNy5/0cyVFN4Lf/m2rZZcVZjCF9qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x67xncueDdaEEto0kiXfl9pIIjowX4FydOBFE2Kh0mY=;
 b=Pqf2CMg1kwiGOGSUr9KlUcoCsRZNFiSlGTbD8Z3HENyguqJGu41RFO1oMmb9RgIl2lVS03bDwRuEOAawrhu5A9JYoWof+XHwKNurk02z69jxMhJvPEQum+KzDh8zyEZiVRcTE3cb2S1DANeKi5jHtbILE/vIWUOqZ3KdrbwSxv+no2ipz7z52tIPv8xxze5mR653rH6rUqINbpTUWk61cnXsIFG25jk9Q1ZN+IECjnW0+iOJoWi53F2+sSIC1DXmrpgplxmeQ+RMSGlWAM3MLomt54TynOuOwphUYlSgthyKQO81rcEweZCDfAMKGIHdQXJtIX3haNJegQ1OXO5ezA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x67xncueDdaEEto0kiXfl9pIIjowX4FydOBFE2Kh0mY=;
 b=MbrXWhSpBrcbH1baqanCmQt1175h5ulWWJTwbwvUcZlNGz8OsqR87qPHDaJOgrKkDdKXJDlzfmpuJb4XvRw+HnURY4c+56mWpCK7RgysyRlBk1oABrg/cIAyNILLC+XmrV/mrgplWT/GMgDEDFobtLexS2Fxxw6Pdm8h1KtrtwM=
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
Thread-Index: AQHcIiYjKV/PcPIAQEuJ6TZ/Q8rQNrSN9F6AgC6RCYCAA08OAIAABX1Q
Date: Mon, 13 Oct 2025 07:18:31 +0000
Message-ID:
 <DM4PR12MB8451A7C97D812B25A553985DE1EAA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-25-Penny.Zheng@amd.com>
 <56024eb0-b30f-43fd-84b7-6070a1d79cf0@suse.com>
 <DM4PR12MB845153811FA7748CA058EB9AE1ECA@DM4PR12MB8451.namprd12.prod.outlook.com>
 <fa709d35-8c7b-4c27-9bac-52a48f5b3fb3@suse.com>
In-Reply-To: <fa709d35-8c7b-4c27-9bac-52a48f5b3fb3@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-10-13T07:18:24.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|DS0PR12MB6392:EE_
x-ms-office365-filtering-correlation-id: b03eeb9b-5415-4e16-e23e-08de0a28b722
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?aG1rN3RMTmVickF0ZkZJWVpJMS9odk1PTENaZ1JLR0k5UEQzb1doTHEzQ05H?=
 =?utf-8?B?SmRYTisvcnVCQlBBUFhGSTRXdlpCNmErc2hzY3MxRDBqU2czMDhKUWwwdSs2?=
 =?utf-8?B?ZEhOMldZcTJCeHVXL1NRQysvNVRlNTNka24zNjh3dkc3RFc0VFB5dVMvNHI1?=
 =?utf-8?B?NXNIeHZFWjJJa0Q3emFKTW93NkhqWC9VQnhFZFlLVUFRQk1heDFENkdRM2xP?=
 =?utf-8?B?aHBGcHhpdGtOaVNKVlRTVUtndHBacW5xNnBVQi82eVVxVWFmald3YjREdzA5?=
 =?utf-8?B?YWhiRUt3VkxzLzhaRzk4eEI1WGppeUMvendkd1Rmd01VcGdCWTRVa0Q0VGZM?=
 =?utf-8?B?Y1VyQ1pEcGdVdU9PYU11NXZsQXBONmJNZmhDT1BJOEYxQTRjQ1h1akVGVTRP?=
 =?utf-8?B?djA4cWRhbkxYWjBMeklzeFAxL2RSaVV0cFhiWldHa2tqRXJHVjhCakxNbDZu?=
 =?utf-8?B?ejh4T0hTWk9vVGF1ZWRRZS8rVEJRRzJzZ0NXSi85ajRnQ0tESVh1ckdJMmpR?=
 =?utf-8?B?VGR1SGJxUTJLS1FUN3BKVS83MDdZZzJRL25pWlg4MzZ5QjB1Y3hrRjhuQkw5?=
 =?utf-8?B?a2pROFpHTGlmWnV5M1lHRmR0aks2UVdBamhjT2k5QkdxSGJsRzg2Uzd5NE5W?=
 =?utf-8?B?S3pEZ0d4eTVtTlRMNVR5bmU0dmp3dVFVVStzdlNINUFMakJscUkrazlZQnFq?=
 =?utf-8?B?VEtwbnAyS0ZjQTlCa2JOZi9WbTNNay8yS3NUY0FGTVBXaERSa1AyTUVTMkUx?=
 =?utf-8?B?c3dlSzJTVS9XOTZ2UUpiaFkxVkNaeG1OUkxEMUhMeTBHM25DbTlpM3JJcTEw?=
 =?utf-8?B?bndXd1gzN3llQ3V2U0Y5STdsTXNucXFLc1lkOTFidzdRRllDbmpzZlg2K0py?=
 =?utf-8?B?NEtsVFB5R1hqSnREaUNxaWdaTHJCbEtnRWtsUHJsVU5GYkt2eFNGbytkUEIv?=
 =?utf-8?B?bEZET0NnZVM2ckJxdG9HM1BkQ2JFZHdoSFpWbTluT0I2aEdYQ2lPZ0hNcE1H?=
 =?utf-8?B?TXRnMG1aY2F2VXJmYzZHeFBCQmJhY3ErU1gzaXRGMEMyWStZYWRHWUxZU1F5?=
 =?utf-8?B?ay84cUMyRTh0ekFnSXdQS2ZHNkE3Y005TEhxbk9ycGtObUxMemVzZWFzdmlI?=
 =?utf-8?B?Ymxvc2Y0TDdOU2p4NVVEZy9wTE03c3J1d0QvR0NGdzhLWGFRT1oxd3lDQ1ZS?=
 =?utf-8?B?NURJbGhTQVU0TGxyLzdrVEJld25GbVhLOEdaczBmbktEK3dOQ01GMnZ2Yk1w?=
 =?utf-8?B?Vkp1cHA5aFJWVFJsOTg0Y2VuVGxpblJWNjhCWXh2Q3FnMXRhbGVvQW5KS1kv?=
 =?utf-8?B?WVBZL2dwdHJXbXJpa3hHY2tPbFZNbDZtMjJDaTRLZW0xdmxKbEpTZkJ4V0pK?=
 =?utf-8?B?S0xhZ3o1Nnh0QkFMOWoyWHhoYVRMRklCWXFTdE1JYzlJRGJMaXFmMWhaZ2pR?=
 =?utf-8?B?OGprdmFSSzhaajVJbURadnY3U3JuSjh2VklBZXNFZ1oyZ2Y3S3o2T1FPQkJD?=
 =?utf-8?B?SFpnN3lUUm14SGpVeVE4dkRQOFFEeFZxKzd6OGswMFdiTHBRemhPQk5mWU1p?=
 =?utf-8?B?SXJPMGhCVFVseHAxQXBVYytnVzVtRHpIaWgvMHlEcG9namlEYjFFMVAvdnVT?=
 =?utf-8?B?S2pKYmYwL0w1a25BY3pMcm9QVU55bkdoSS92cDF1MVhYNUF0Y291aW90ZWJR?=
 =?utf-8?B?bkZPLytFVExsaXVhU1hPeGNMcktvc09KclVlMSs5bExqWkRGUXdLbHlTY00x?=
 =?utf-8?B?RGFzSjZEUmhqaEd6WUxsb1FLMGFiNWFMbk05czhuYnlkQW5ZdVVPa1FjNEV0?=
 =?utf-8?B?QmhQTzRlNk45WGpFQldKb3FBWkZjSTF2NmlnODdWUzN0dzBuYXA5bGhTZzV1?=
 =?utf-8?B?aGJWNEE0dlZRc3dhZUdWTi9tRTNqbFJyZ0Vrbm9RdVYyRmd0aU9YS3lyS0R2?=
 =?utf-8?B?Z0lCMU13dFhRbk9ZVUNRb3pvUXhLUjRUY25kNjU4V2IrSlhxSCtMdHJTRHEw?=
 =?utf-8?B?a3RRVU9IR1IzT3RyYmpaVHB3d21lTzR4a2c1c3M5TTFxUzVhM2lSbGtudzc3?=
 =?utf-8?Q?76xxQ9?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YWNUOXhjYVZTeGR6RjdGaThpcEUrNFk1S0p0YVlxNEJxb0tyalN5WnFLYUxY?=
 =?utf-8?B?WXdSQlhNTlQ4YmFNaFU4SmZQZlc1NVIza1RzUmphbXpXOG4xbVdzM0pLamFs?=
 =?utf-8?B?ZGxVZklic1Fqd1VsUW5iaGVjUjNvZGNtVEtYTlpDaGQ2RmVZSk9tMUtOTU9P?=
 =?utf-8?B?Rk9pQkxtZjRoYXIxalI0eUp4aHlpVkVqSXR4ZzJoQjVudGUzc1RldlpEZFdF?=
 =?utf-8?B?MlhnNlprUXdLK3ovSCtEc2dmQThONnQ2UXc2UHU1dk1qNVFYVktSMitYS3k3?=
 =?utf-8?B?N09QWnNlc21aSzNCekdjcTB1dDZGTHhkaERnditBQTZBbkRlT25haHZ2cW1E?=
 =?utf-8?B?UnREL0thSVR2MnRYNndsVWpnN1NWd28vOGo1OUMrREtJS0crODFLTEtGakh2?=
 =?utf-8?B?YnQ5WFp3dEI5YmE3MW5obHBRYWNtbnZrdG1JZFRsbkZ3cUFOYUZkZVJyM252?=
 =?utf-8?B?U3owQ3h4TVJBWVZ2aDZHZjQzemdaMkpGRkNneGpkWENoTkU1UDNoVUlJRWl6?=
 =?utf-8?B?R1B1dkVVb1ppWVJscFg0TUJobUJ0SUtpMkZkNWliWGw2bkgyVWpxclljYU9n?=
 =?utf-8?B?b0MvQTNpZGlVMDZvbm1vQ2xLZ0dwazBPeW1PbExvU2FUUm01c3lIS1BSNWh3?=
 =?utf-8?B?S2J1TTNUK2sxSmhUV2tCR0ZYS2NIM0w0cUZFMEhONWdwWTd2TzR0V2lteEJJ?=
 =?utf-8?B?SWc5VUNkK08wbE5iOEttbEI0U1ZERmc2RTZxUFZnUW4zNExkRjd6Q1VWNkVv?=
 =?utf-8?B?NUVuQ0Q1L3E4dkRTR1FoNUM5c1NpMG15K0VtVUJ5eEdXUDRzZ1RIYmRpbVBU?=
 =?utf-8?B?Q0hIT205enIvdWFDUC9FaU84ek5tTDl2RHR5TzROTHczczRNZjVPa1Q1RDlM?=
 =?utf-8?B?eTJ1RVQrWXNKUWk2ZzFoQi9YRFpYSGFMdUdMZmh0azRqYW8xeG5lUGs4Y3U4?=
 =?utf-8?B?TnYxRWxWc0c0Y3FqZXRJVEZHYkV3N2dWcDliS0oyOTZaclhQa1lLeUdCOG9w?=
 =?utf-8?B?MkhJZkM1a1lqZ2RGZ1BIMUFPSlFqMDlqRFlvZGhuS0trY1IwZGZjaDU1TmxI?=
 =?utf-8?B?YW90TXA2V2h6UXA3Tm1ub2hXZkZiOXFYRDJTTDRiay9tRTB5cVY0RkgwODBK?=
 =?utf-8?B?cnBCTVZnU0hKZ2VEd2d0VFNlMVhncHFsV05FbUtPYTRyMXZ5Z2diRTdRRTdV?=
 =?utf-8?B?YnF5dlhkMk1KckQ1ZFoxeUl4VlRDd1I0aWlEZ1VCb3RYWjlBUmVaeXFMZUZo?=
 =?utf-8?B?RXNhTlNjdE56T2JWTUdTSjArRFRvTVN3dlJWK0plZ0EyY0ozVWpWTW9xU29l?=
 =?utf-8?B?c1ZZNk05dE8yMGdvNUt4dndGTTRZVS8zWnU3WWNkNk5SaXdJbVNHbm1GUWJG?=
 =?utf-8?B?akN5SDFUVnp0bk9VYnp6ZTdJTTlFeDY2bm1JejFvYTNoV0dtakZkYVUxbmV3?=
 =?utf-8?B?QmgxeVdiTWFYSlpEWTJsT29JU0dtdVZsRW9sVUFpTGJMNnNwSTAyaE1IZXM1?=
 =?utf-8?B?WjhpWHVsNUlCTlFQOCt0UytZZGlzWC9pU1MyN1NzdFRQdWVlYWdzdW1TakVC?=
 =?utf-8?B?MW0xNERiNHRpdTVlajUvWGhWbVRXaWc5T0NZNkdmWTFHWFNrR2ZvL2xNZjFu?=
 =?utf-8?B?eFdqMk9wNGxuOWpweTQrbStwWEJvYW5RU1plTjVLeTVhdXoyWG5IM3ZlOUhO?=
 =?utf-8?B?bENJQ2J6UXV3SEMwWURZTDVOLzRsTktNUDlBU2FKMWlsUis0UE9hSDNPSUM4?=
 =?utf-8?B?dHNpcEptRUxYdzNibWF1REZjRmtpOWRCdHF1em82QUdtL1FMZmx2cXJUNUh2?=
 =?utf-8?B?cjNPRUYxWHNkeGNkb2w4SGZZS3ltYnN4NVN4ZXpscE1oUm5lTHZJWEg2QWdK?=
 =?utf-8?B?eEN2QjQ0YUQ5ZVBWTFJsekVtc1p2WVk4VU1jRzhOZ3F3aUZqV0xMejFaaHhN?=
 =?utf-8?B?LzloOHRlaVNiR1V0czNzWkZHQjdwZHRwRXJPYi9zY3hPYVpTYzg2cFVxSTdp?=
 =?utf-8?B?NU1VSCtmL25FTjdPTEJUSmhYdnRMSWNuWnJtcnJ0UGthMG5aczZaZ0F0aDVw?=
 =?utf-8?B?alpkRUY2NGZMOERBcCs0QkhXKzJxMjFLUXJMeFFuV1ZQNklLUzJhV1VWa2JR?=
 =?utf-8?Q?utMA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b03eeb9b-5415-4e16-e23e-08de0a28b722
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2025 07:18:31.9941
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Arz9zeoypMwkmlqQo8nfamslQv2rgzDm+t7aGIyqagzUitMo7Ink0mMGThDmhvlWmbnkdoG0PHBExEghD7QkFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6392

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwgT2N0b2JlciAxMywgMjAy
NSAyOjQxIFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+DQo+IENj
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
b21jdGwtb3Agd2l0aA0KPiBDT05GSUdfTUdNVF9IWVBFUkNBTExTDQo+DQo+IE9uIDExLjEwLjIw
MjUgMDg6NDQsIFBlbm55LCBaaGVuZyB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gPj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+PiBT
ZW50OiBUaHVyc2RheSwgU2VwdGVtYmVyIDExLCAyMDI1IDk6MDMgUE0NCj4gPj4NCj4gPj4+IC0t
LSBhL3hlbi9saWIveDg2L01ha2VmaWxlDQo+ID4+PiArKysgYi94ZW4vbGliL3g4Ni9NYWtlZmls
ZQ0KPiA+Pj4gQEAgLTEsMyArMSwzIEBADQo+ID4+PiAgb2JqLXkgKz0gY3B1aWQubw0KPiA+Pj4g
IG9iai15ICs9IG1zci5vDQo+ID4+PiAtb2JqLXkgKz0gcG9saWN5Lm8NCj4gPj4+ICtvYmotJChD
T05GSUdfTUdNVF9IWVBFUkNBTExTKSArPSBwb2xpY3kubw0KPiA+Pg0KPiA+PiBGYWlyIHBhcnRz
IG9mIGNwdWlkLmMgYWxzbyBiZWNvbWUgdW5yZWFjaGFibGUuIEFuZCBhbGwgb2YgbXNyLmMgYWZh
aWNzLg0KPiA+Pg0KPiA+DQo+ID4gSSBqdXN0IGZvdW5kIHRoYXQgdGhlIGZ1bmN0aW9ucyBkZWZp
bmVkIGhlcmUsIGFzIGhlbHBlcnMvbGlicmFyaWVzLCBhcmUgdXNlZCBpbg0KPiB0b29scy9saWJz
L2d1ZXN0L3hnX2NwdWlkX3g4Ni5jIHRvby4gRW1tbSwgdG8gbWFrZSBjb21waWxlciBoYXBweSwg
SSBzdGlsbCBuZWVkIHRvDQo+IHByb3ZpZGUgc3R1YnMgZm9yIHRoZW0gd2hlbiBNR01UX0hZUEVS
Q0FMTFM9bi4gT3IgYW55IGJldHRlciBzdWdnZXN0aW9uPw0KPg0KPiBIb3cgZG9lcyB0aGUgTWFr
ZWZpbGUgY2hhbmdlIGhlcmUgYWZmZWN0IHRvb2xzL2xpYnMvZ3Vlc3QvPyBXaGF0IHdvdWxkIHlv
dSBuZWVkDQo+IHN0dWJzIGZvciB0aGVyZT8NCj4NCg0KTGlrZSBGdW5jdGlvbiB4Y19jcHVfcG9s
aWN5X2lzX2NvbXBhdGlibGUoKSBpbiB0b29scy9saWJzL2d1ZXN0L3hnX2NwdWlkX3g4Ni5jIGlz
IGFsc28gdXNpbmcgeDg2X2NwdV9wb2xpY2llc19hcmVfY29tcGF0aWJsZSgpIHRvIGRvIHRoZSBj
b21wYXJpc29uIGJldHdlZW4gaG9zdCBhbmQgZ3Vlc3QuIElmIG1ha2luZyB4ZW4vbGliL3g4Ni9w
bG9jeS5vIGd1YXJkZWQgYnkgTUdNVF9IWVBFUkNBTExTLCB3ZSB3aWxsIGhhdmUgInVuZGVmaW5l
ZCByZWZlcmVuY2UgIiBlcnJvci4gSW1vLCBpdCBpcyBub3Qgc3VpdGFibGUgdG8gZ3VhcmQgZmls
ZXMgdG9vbHMvbGlicy9ndWVzdC94Z19jcHVpZF94ODYubyB3aXRoIE1HTVRfSFlQRVJDQUxMUy4N
ClNvIGl0IHdlIHN0aWxsIHdhbnQgdG8gaGF2ZSB0aGUgTWFrZWZpbGUgY2hhbmdlIGhlcmUsIHdl
IG5lZWQgdG8gcHJvdmlkZSBzdHVicy4gT3Igd2UgcmVtb3ZlIHRoZSBNYWtlZmlsZSBjaGFuZ2Ug
aGVyZSwgYXMgdGhlIHJvbGUgb2YgdGhlc2UgZnVuY3Rpb25zIGlzIG1vcmUgb2YgdGhlIGxpYnJh
cnksDQoNCj4gSmFuDQo=

