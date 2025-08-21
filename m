Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7CAB2FC7C
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 16:28:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088745.1446474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up6HD-0002ZC-R3; Thu, 21 Aug 2025 14:28:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088745.1446474; Thu, 21 Aug 2025 14:28:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up6HD-0002WK-OC; Thu, 21 Aug 2025 14:28:27 +0000
Received: by outflank-mailman (input) for mailman id 1088745;
 Thu, 21 Aug 2025 14:28:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aDER=3B=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1up6HC-0002WE-8i
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 14:28:26 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18d56f36-7e9b-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 16:28:25 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AS8PR03MB6997.eurprd03.prod.outlook.com (2603:10a6:20b:295::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Thu, 21 Aug
 2025 14:28:21 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 14:28:21 +0000
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
X-Inumbo-ID: 18d56f36-7e9b-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SLB/rfLhp1qIg5vsJXHUd6WmKogkr82FOnwiTFsukVLkhS53lg/Ppl0NpOgpaqY6ywafELCkJ2ucNgPqLYATNlJVD653GiEixNXD5kLlKMoKhdh8K0u+UP0ekqWYIRmtuVD28IZ0mb64Yr0Fzv7DppGPdy2AUlTrYqr4XWnweSYEs9E3pWDsK+mqE4hhcqxF9FPA5S8uMWOKIzz0TLbbk2QbVxr7WAQjP1nogOMUyH2LrAZV6D+epKmPBFkQ/GDC6xwk9zOc/Xlkz69SZoV2uh2LIHzN8gYl1dNlfAxoo8l2O0l85qiupLz19rlplDInxmWcUgVO2qcUkOGcQYlLdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2pBSA7ptOM59xle2qOeWezWcB6iRprCVAaj5xGEaFcY=;
 b=N2UGrCYyNKK5ITy0hboB7grgwdsHX+hEGvIOmB9QfoGC0Kgi+Hlb0byEP+K8BH8EsSrSFODL5/FCZw4Gtr4Mnb0LQ+j95awbHZYZvm5/0VZ5GY2ol1S/+hx0MAPXxhOKOM11tKYzqHHk1a417PgZpeWtpW4lAzRhLa6AH3x2Fmlc1uRl2J1I8jzjpK/V+ggginxi2CWRO83BExT4xWs9IFzJbDNNLsmd2EhMxdlDdVESNVDapQVIU4Dr4DP/X7LWGWsMUivrb7FkNSB7JuIavHzIJ7d3YrYXgyt0pfFFCannN8QLMpbcODR0IidJccQOiVXOAg5vRyuJzXpdogWlTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2pBSA7ptOM59xle2qOeWezWcB6iRprCVAaj5xGEaFcY=;
 b=Odb2gt0If/hqd4b3VTsMS7e+Zt8H58s5XP2N3eNnl2zjwV1IGlAGL+dGYZ+eh4RY9FkLgN158CSWbxmRNaS9hMA99cwdY/4XidwNOdBqWHhPS5j8wrHx7yMOVMTL2ymKWAg9CAIsncSFxyK5pYaEg9U2YB6lTfi3/eiVAB6hJPg2yE+lHNbA3om+paVBHWVZ9cvEUUy6eCApUfg2mPjc1Gl1+ccoRXYudDtfWQSY/K2GnM0o9MdSibuh9vkUSI4zyCf6lGuMLAnMFju9Q0ZVcTRr3W16OJxJv53PP+OGBttQA44vIMtx4AAE5W+7IA8CFdG20nMYzbRsRaiqKn8b/g==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] misra: add deviation for MISRA C Rule 11.3
Thread-Topic: [PATCH] misra: add deviation for MISRA C Rule 11.3
Thread-Index: AQHcEaKMMDydbZiTjE+UNGKddouDNbRs1fAAgABSSoCAAAQwAA==
Date: Thu, 21 Aug 2025 14:28:21 +0000
Message-ID: <a916d650-3000-44f8-be86-714f4b46a986@epam.com>
References:
 <d6a8682c98880d66ea99f882520b3defda0e3fe0.1755672275.git.dmytro_prokopchuk1@epam.com>
 <5199396a-685c-4839-b7cb-d32e3f4a0b48@suse.com>
 <159de776-d0bf-4f77-a6b6-670246eca85e@epam.com>
In-Reply-To: <159de776-d0bf-4f77-a6b6-670246eca85e@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AS8PR03MB6997:EE_
x-ms-office365-filtering-correlation-id: 9c71f57f-c8e9-423a-685e-08dde0befae6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|42112799006|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MDluS0dMckt2NkZhMlpiV0xYb3hGVlVKc0N6Nkp5VE9JeGh3Q0p2b3MzMWZX?=
 =?utf-8?B?TzRMay9OYlVuby9kOGo3WXNOT0NrSGNqU1RlVWhyQWd3d1JyRzNTd3ZiNWJD?=
 =?utf-8?B?UnlEWjB6ZHhnVjFyY0xZaVJ4TStvQVhMVUl5V0c0OUVLSEd3Smh6MkFIaE4x?=
 =?utf-8?B?dEQvSThHNFFNVTV4UnFpbFZBV3VrbzhsTkpNNUx1bThvcEFpU2RYWXY3cXVs?=
 =?utf-8?B?aERzTVV6ZVFqakgvdEJWRUpIQTgvOU90YU9pRTI0aDZkcEkvb2l1d0MyeGE4?=
 =?utf-8?B?aWpjQUVYM1BvYTZ0RlRacmM0cHgyMzZGNVU1Z05PRHNJN0thT3VlcEU2ZFVh?=
 =?utf-8?B?Z28yK0NVNHpvV2FUWTdPMEhvS2p3MC9od3lnY0xRZ0VYaUJ4MDVteTBMNi85?=
 =?utf-8?B?RFBFSmhNQnZJYVJJcnlkZTZ3a1AyaEpoenVubm9Sd0pzeFRVU2NZUGcxODhk?=
 =?utf-8?B?blo0U2o1YTRPbU9LVUpUaDRYUVMxeU50bElYQXBUT2JBSjVESFdVa2hySzVJ?=
 =?utf-8?B?TEtMd1NmRUpJY2JtSnU4cndhNTl0Z3VzdmlNUHV0M1hNUFlIYU40R2F2NWhz?=
 =?utf-8?B?R0dMMTFvNUpwQXdhTFR4QU1ZRFJGZE1peUg4S2JBQnNUYk9UOGUwOHU0WEwy?=
 =?utf-8?B?MitYN3pXSVViOEFHckxpNldiZWVCUEJveGhIR0JlUitBTjNXUzNCMStXTTd4?=
 =?utf-8?B?K2Z1QjVtOExmMURaMG5Xa25jREczS3YrMitZTy9FMGFTYlNyNlNCakg5S3Fy?=
 =?utf-8?B?c0dlTjBLMDlEWEF6d3MwRlFnNlVSTEsvSlJQMi9BZmltLzlsU0pRZjJSMWlt?=
 =?utf-8?B?SUwwelEvZjhld3dlWUtLcUZ6SnNRZHVMK1FXMG8vVVNnRUtVUzc5TEtVMVRT?=
 =?utf-8?B?VURUbGhKcVMwbXk3Ui9pbU9MQ2FGRkEvZ1JuZ0trRWFLUjB0WjVTTzMzMk5x?=
 =?utf-8?B?cTRYZUxNQXk5d1g3cklTbk51TXlCaU9BRU41UVMvQWM2dS80SHROTVc2NnYr?=
 =?utf-8?B?eERrdDFhVCtGeHNYRkFoNzdUbkZ4UUxndlhzdTA5VEFnK2lOemh1T21jWDlS?=
 =?utf-8?B?SzFwZWZzTndMMm9ZVEZ5VnBoeERZQWVPK2tQTUJOL1hYTHNFbW44ZDh2S2ph?=
 =?utf-8?B?S09UYmkrdExqQlg1RngzV1FQbkE1WHY4VlJCaWN2MGpJOTFkR21iek1lbWFK?=
 =?utf-8?B?cjhQd0ZOcXE4Y3h5RG55eGEwTEZrRHVMZW1CQXp2RG9GbVZ1UnhXcXAraUs4?=
 =?utf-8?B?aENSOVh6K2hYazdpa3kxQTcyejRYV3c1TUdPTHl6dVM5OWFGUVVYdW1IOVl1?=
 =?utf-8?B?Y3FDSEE5c0ZYWFBtSXpLMktZMEQ2SGIxc2dXU1pQeGZkczNnU04zSGJRME5O?=
 =?utf-8?B?U014TDEva3N1UWpPVU9UY1NaZW52Ykx4WngrUmh6ZGFucGlZK3pyZlJTOG5T?=
 =?utf-8?B?b1JxemtIQ0xYOGRLL3dEU3JrZ2xSZlV3WEUyVGFrbFVScVpqODI2OVZuaTQz?=
 =?utf-8?B?T3UzZWpMY3M2Ulg5VVJiZ1NiNU9VVGRrbHhaRWNLMWVRMW80V3NhblloNnBN?=
 =?utf-8?B?WTZDdk4zZDNPdUNIWVl6YTZYTEJSZmJmRmRNSmtYSWRLTnpDQVc2V1h2ZGVG?=
 =?utf-8?B?czdwQlFnSXIxUklyM3U0U053Sk5UclNIcWNYUFhBRlpkaG5BMFNnODNRVDM1?=
 =?utf-8?B?UFRWck5JYysvOXlwT1plQmhJako0MXpjR3g1RVFOY0g0VDI2QU5KZTM1UlhS?=
 =?utf-8?B?Qk9iN0lwaXd1eGordDNkSGQxSCtVeWFuWTdqRWUzVUxsZXY0MDVaa2w1WUNp?=
 =?utf-8?B?VXhmZEtnNlJ0MDI0THllYVAxR0J3UXlPSGJNVVBLT1lJYVZaUE9IYjNVamMv?=
 =?utf-8?B?ZlRuUldSMnFnZE93OVRJSkc5a1FYOXBZaktQSnJ0anoyYVVYUXM2YktodVg5?=
 =?utf-8?B?anZRdENaYlFkK2hIbDF5RDBmTEVHbCt1SXk1V0hDYUU1RzdlZFdyempOeGg3?=
 =?utf-8?B?dUZXVUhNUzV3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(42112799006)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a1RyN3cwUVNXOW5Mdm1QbFY5NkpZVnJhM3A1TFZLeWs2M3lyNURpM0FXSGRD?=
 =?utf-8?B?NjZuOTRtcHRaZU0wN0ZwM1JSZ0NrK3ZXOGpSNEhKQTJidWZtbGF0bDY2WXFj?=
 =?utf-8?B?VTNBaG1WR3R5ejBSYzVtd3RtQXFSWGJOYmlXSXBKMFZOcmN2Qit3N3p4aEJu?=
 =?utf-8?B?UG5icHlJeEZPeE9GM1Bic1Q3NkRVWDVQV2FBSlI4aWN2ZUdzRDd6TGxSdFNu?=
 =?utf-8?B?UHRqMWpMNkZIZnhNSkJCRENSRVhTQzVPNHI1TWFiYzdyLzZKSFR3MFRnS0ZB?=
 =?utf-8?B?UnZzdWlNQjhvbHNrcysyUnRFakFxU3lhbk1EanV4LzJsYUZ5VFNuL3hoZ1RB?=
 =?utf-8?B?NHNoVVhjeWJsejVLR3ZnQnJIbnB5OXlxZjJZQ0pLUjFSWlc4VkduV0t4MUsy?=
 =?utf-8?B?NFRFdWxqSHV0bnJyMDJmVktWQXRSUkt1Y3FGQVo0eVZ1Q2xUclg3bFFIUUJZ?=
 =?utf-8?B?UDdJWkduSGVVYXJadFpHMkc2cGxLa09XdzVjdXFpeUliQU8xN1AxMkNERUxH?=
 =?utf-8?B?b04wcDdHamVoNW9jdEJSSWphcmViNVBzdjR6VXhDWUUxeFQrZVZZdlV3Z0lQ?=
 =?utf-8?B?Y0U2WUl2cVl5N1I5Nk9rSEtEVzZId2kwdlo2Sk1aMVZUNGY2ajQzaU1Gbmg4?=
 =?utf-8?B?VVNGckxSRUpBcDEzaEwvQmNTcHN6akh1Q3RWSWh4T3pzVEhKVVV5UlYyblRs?=
 =?utf-8?B?NXZTaFZuc3JLTmNUSFk3RHhKN3owb1k2aW40RnpGcC9uR09BMy81K0JmRmEy?=
 =?utf-8?B?cnFhWW9tSTlJTjQrWHk0V1l4dExMR0UvVEplMHgwNXRjL0U1SmVJUlZKcGp4?=
 =?utf-8?B?T2tiRjQ2ZHRaV0Z6WWNnVFpxT3ZDak5QOGJUUjlDVXlaanlHNXdwMTNYTVFx?=
 =?utf-8?B?L204MGxRcjNIdzNzbi9Jdng2OTZXM3UwY2dzQmxmdVdET3p6Qi8xZEJpRy9L?=
 =?utf-8?B?Si9NWTIzZW1JWCt1Y0dXRFNveHM4MFUyYlNCR1BaU25JZkdVamt3STd3UFBs?=
 =?utf-8?B?Sy9MYkJBSmZlSjZzWWFOQ1FYUUZweWRaTG5leUJKYWRDZ3FsVjBKSXc4dGly?=
 =?utf-8?B?TlYwbXdXQjlXMzFtd0RqNEpmenF1NCtEVHJ5ZlRJSFdUcHRTS1pyTGdpczdI?=
 =?utf-8?B?Sk9DOWJrR3VhRlBwSG9vV1dPMjhTQmszaTFmMzBiaDExZTJrTWNGRGhSMlNw?=
 =?utf-8?B?aXVSTGV1V0d6RUVXL2pvUndQMEtRZTNZaituTFBKUGdpa2o5TC9xWXUwVHNz?=
 =?utf-8?B?TEpsZ3UyakU5UEtTZExBcVdlQ2ZHUFFoTTNNeHV0TEw2czRVNDVyVEUwSWFz?=
 =?utf-8?B?Ni9LaXJUcndPa2JITTJTNlF2QmlkcjVUZ0RrQW1KM29RZW16S3ZhN093WnV6?=
 =?utf-8?B?cG5Jak9xM1FqOStZYUd3aXhiWGVTV3BVcVB6NlF3K3c1Ykl5bWxQT1NBZXlE?=
 =?utf-8?B?dmRncTFjRU9DVC9WY1Q3Q0FDUlREekZqZjlDVUdXcXlQT3A3dGEyNEdCd2wr?=
 =?utf-8?B?UVdnb2JpNVk0OUVBM2xLazg3b0dhaVg1dk9qckJmTHFYM2VyMVdDR2hablg2?=
 =?utf-8?B?Zys0TUFISm5ncWRHOS9YUlIvcFhjWWFJUHMra3NOYUJ2V2tJbDdId1Rpa0NZ?=
 =?utf-8?B?NzdPOUd4NkVidDRmbkd6dkRwbjBDOVgzKzVFRDdXSGlweEwzZHpUbVFTMzU5?=
 =?utf-8?B?djM2dTJEUmRrSTdSVnAxdTByWktIUHVyR3d5Ny9UY1ozREJRd3BUM1pwNHJ2?=
 =?utf-8?B?Z3BYSjc2MEwrTlIrQWM4Z2ZCZEd5dG5yRm5sREszUEIvMnk3WGpuOGlIYSs5?=
 =?utf-8?B?MjViT1Z3OStLREp0K25NbWg3NFh1WjVRbXRxZ0xQeWxzZWNId09ZUEZOb2xB?=
 =?utf-8?B?RXhOcERyc1p0NExCZHFhRWFjcG1NamVUeXIvL0tuSGJZaHdENlJhS0ZKOE9q?=
 =?utf-8?B?cjhjY3F6RkRWT3huTWZFS0lrNU96KzdQR2tta0NObHFDeVhFSGVEQ0VTUUh3?=
 =?utf-8?B?aWxHamxXNnZjSGhNSjJTdTdTL0dKclFVTXFQMC9tQU5UeForRFByK1I1UVJ0?=
 =?utf-8?B?d1Rvc2NVbTFqYXprR3hOL3gxNlRmbHJQRTRLblVxbTFIVTE4WlJXYzJ3bmZQ?=
 =?utf-8?B?WkNKS3g0a3hTL3Rpdm1vRWUwUHg5ZEtlVDVyaXBhamQ0aTNZdHlIaHM1WUNl?=
 =?utf-8?B?VGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <49A2E5CC5C12934FA8FE857845A4EF43@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c71f57f-c8e9-423a-685e-08dde0befae6
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2025 14:28:21.4214
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5S2HShFplmS8Ohld64eRaBYZqT3IFJt8FSkKTClVhwWY/5Gi7pmJtqJ4PhUA8Fa0GPjy7yPVYvkV6NN4UujrCzGMDaPkniuIeTEfycOPwPU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6997

DQoNCk9uIDgvMjEvMjUgMTc6MTMsIERteXRybyBQcm9rb3BjaHVrIHdyb3RlOg0KPiANCj4gDQo+
IE9uIDgvMjEvMjUgMTI6MTgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMjAuMDguMjAyNSAw
OToxNywgRG15dHJvIFByb2tvcGNodWsxIHdyb3RlOg0KPj4+IE1JU1JBIEMgUnVsZSAxMS4zIHN0
YXRlczogIkEgY2FzdCBzaGFsbCBub3QgYmUgcGVyZm9ybWVkIGJldHdlZW4gYSANCj4+PiBwb2lu
dGVyDQo+Pj4gdG8gb2JqZWN0IHR5cGUgYW5kIGEgcG9pbnRlciB0byBhIGRpZmZlcmVudCBvYmpl
Y3QgdHlwZS4iDQo+Pj4NCj4+PiBWaW9sYXRpb25zIG9mIHRoaXMgcnVsZSBhcmlzZSBkdWUgdG8g
dGhlICdjb250YWluZXJfb2YnIG1hY3JvLCB3aGljaCANCj4+PiBjYXN0cw0KPj4+IGEgbWVtYmVy
IG9mIGEgc3RydWN0dXJlIHRvIGl0cyBjb250YWluaW5nIHN0cnVjdHVyZToNCj4+PiDCoMKgwqDC
oCBjb250YWluZXJfb2YocHRyLCB0eXBlLCBtZW1iZXIpICh7wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXA0KPj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgdHlwZW9mX2ZpZWxkKHR5cGUsIG1lbWJlcikgKl9fbXB0ciA9IChwdHIpO8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBcDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAodHlwZSAq
KSggKGNoYXIgKilfX21wdHIgLSBvZmZzZXRvZih0eXBlLG1lbWJlcikgKTt9KQ0KPj4+DQo+Pj4g
VGhlICdjb250YWluZXJfb2YnIG1hY3JvIGlzIHNhZmUgYmVjYXVzZSBpdCByZWxpZXMgb24gdGhl
IA0KPj4+IHN0YW5kYXJkaXplZCBhbmQNCj4+PiB3ZWxsLWRlZmluZWQgJ29mZnNldG9mJyBtYWNy
byB0byBjYWxjdWxhdGUgdGhlIG1lbW9yeSBhZGRyZXNzIG9mIHRoZQ0KPj4+IGNvbnRhaW5pbmcg
c3RydWN0dXJlLCB3aGlsZSBhc3N1bWluZyBwcm9wZXIgYWxpZ25tZW50IGFuZCBlbnN1cmluZyBu
bw0KPj4+IHVuZGVmaW5lZCBiZWhhdmlvciwgcHJvdmlkZWQgdGhhdCB0aGUgaW5wdXQgcG9pbnRl
ciBpcyB2YWxpZCBhbmQgDQo+Pj4gcG9pbnRzIHRvDQo+Pj4gdGhlIHNwZWNpZmllZCBtZW1iZXIu
DQo+Pj4NCj4+PiBDb25maWd1cmUgRWNsYWlyIHRvIHN1cHByZXNzIHZpb2xhdGlvbiByZXBvcnRz
IHJlbGF0ZWQgdG8gJ2NvbnRhaW5lcl9vZg0KPj4+IG1hY3JvLiBVcGRhdGUgJ2RldmlhdGlvbnMu
cnN0JyBmaWxlIGFjY29yZGluZ2x5LiBBZGQgUnVsZSAxMS4zIHRvIHRoZQ0KPj4+IG1vbml0b3Jl
ZCBsaXN0Lg0KPj4+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYt
Ynk6IERteXRybyBQcm9rb3BjaHVrIDxkbXl0cm9fcHJva29wY2h1azFAZXBhbS5jb20+DQo+Pg0K
Pj4gTG9va3MgbGFyZ2VseSBva2F5OyBqdXN0IG9uZSBuaXQgYW5kIGEgcXVlc3Rpb246DQo+Pg0K
Pj4+IC0tLSBhL2F1dG9tYXRpb24vZWNsYWlyX2FuYWx5c2lzL0VDTEFJUi9kZXZpYXRpb25zLmVj
bA0KPj4+ICsrKyBiL2F1dG9tYXRpb24vZWNsYWlyX2FuYWx5c2lzL0VDTEFJUi9kZXZpYXRpb25z
LmVjbA0KPj4+IEBAIC00MDMsNiArNDAzLDE0IEBAIGJlY2F1c2UgdGhlIHNlbWFudGljcyBvZiB0
aGUgJ25vcmV0dXJuJyANCj4+PiBhdHRyaWJ1dGUgZG8gbm90IGFsdGVyIHRoZSBjYWxsaW5nIGNv
bnZlDQo+Pj4gwqAgfQ0KPj4+IMKgIC1kb2NfZW5kDQo+Pj4gKy1kb2NfYmVnaW49IkNvbnZlc2lv
bnMgaW4gdGhlICdjb250YWluZXJfb2YnIG1hY3JvIGFyZSBzYWZlIGJlY2F1c2UgDQo+Pj4gaXQg
cmVsaWVzIG9uDQo+Pg0KPj4gIkNvbnZlcnNpb25zIiAoYWxzbyBpbiBkZXZpYXRpb25zLnJzdCkN
Cj4+DQo+Pj4gLS0tIGEvYXV0b21hdGlvbi9lY2xhaXJfYW5hbHlzaXMvRUNMQUlSL21vbml0b3Jl
ZC5lY2wNCj4+PiArKysgYi9hdXRvbWF0aW9uL2VjbGFpcl9hbmFseXNpcy9FQ0xBSVIvbW9uaXRv
cmVkLmVjbA0KPj4+IEBAIC00NSw2ICs0NSw3IEBADQo+Pj4gwqAgLWVuYWJsZT1NQzNBMi5SMTAu
Mg0KPj4+IMKgIC1lbmFibGU9TUMzQTIuUjExLjENCj4+PiDCoCAtZW5hYmxlPU1DM0EyLlIxMS4y
DQo+Pj4gKy1lbmFibGU9TUMzQTIuUjExLjMNCj4+DQo+PiBXaGlsZSB0aGUgZGVzY3JpcHRpb24g
bWVudGlvbnMgdGhpcyBjaGFuZ2UsIGl0IGRvZXNuJ3Qgc2F5IHdoeSAoZS5nLiAibm8NCj4+IHZp
b2xhdGlvbnMgbGVmdCIgb3IgIm9ubHkgdGhpcyBhbmQgdGhhdCB2aW9sYXRpb24gbGVmdCIgb3Ig
c29tZSBzdWNoKS4NCj4gQVJNOsKgIDgxM1YgLT7CoMKgIDE2Vg0KPiBYODY6IDE0MjJWIC0+IDEw
MzVWDQo+IA0KPiBMb29rcyBPSyBmb3IgQVJNICh0byBiZSBhZGRlZCBpbiB0aGUgbW9uaXRvcmlu
ZyBsaXN0KSwgYnV0IFg4Ni4uLg0KPiBBbnl3YXkgdGhlIG51bWJlciBvZiByZXBvcnRlZCBlcnJv
cnMgaGFzIG5vIHNpZGUgZWZmZWN0Lg0KPiANCj4gSmFuLCBkZWNpc2lvbiB1cCB0byB5b3UgKGlu
Y2x1ZGUgaW50byBtb25pdG9yZWQuZWNsIG9yIG5vdCkuDQo+IA0KPiBEbXl0cm8uDQoNCkFjdHVh
bGx5LCBiZXR0ZXIgd2F5IGlzIHRvIHJlbW92ZSAnLWVuYWJsZT1NQzNBMi5SMTEuMycgZnJvbSB0
aGUgDQptb25pdG9yZWQuZWNsIGZpbGUgYW5kIGNyZWF0ZSBzZXBhcmF0ZSBwYXRjaCAoaW4gZnV0
dXJlKS4NCg0KRG15dHJvLg0KDQo+Pg0KPj4+IC0tLSBhL2RvY3MvbWlzcmEvZGV2aWF0aW9ucy5y
c3QNCj4+PiArKysgYi9kb2NzL21pc3JhL2RldmlhdGlvbnMucnN0DQo+Pj4gQEAgLTM5Myw2ICsz
OTMsMTQgQEAgRGV2aWF0aW9ucyByZWxhdGVkIHRvIE1JU1JBIEM6MjAxMiBSdWxlczoNCj4+PiDC
oMKgwqDCoMKgwqDCoMKgIChpLmUuLCBsZXNzIHN0cmljdCkgYWxpZ25tZW50IHJlcXVpcmVtZW50
IGFyZSBzYWZlLg0KPj4+IMKgwqDCoMKgwqDCoCAtIFRhZ2dlZCBhcyBgc2FmZWAgZm9yIEVDTEFJ
Ui4NCj4+PiArwqDCoCAqIC0gUjExLjMNCj4+PiArwqDCoMKgwqAgLSBDb252ZXNpb25zIGluIHRo
ZSAnY29udGFpbmVyX29mJyBtYWNybyBhcmUgc2FmZSBiZWNhdXNlIGl0IA0KPj4+IHJlbGllcyBv
bg0KPj4+ICvCoMKgwqDCoMKgwqAgdGhlIHN0YW5kYXJkaXplZCBhbmQgd2VsbC1kZWZpbmVkICdv
ZmZzZXRvZicgbWFjcm8gdG8gDQo+Pj4gY2FsY3VsYXRlIHRoZSBtZW1vcnkNCj4+DQo+PiBBY3R1
YWxseSBhbm90aGVyIG5pdDogSGVyZSBhcyB3ZWxsIGFzIGluIHRoZSBkZXNjcmlwdGlvbiwgaXQg
d291bGQgYmUgDQo+PiBuaWNlDQo+PiB0byBhZGQgcGFyZW50aGVzZXMsIHNvIGluZGljYXRlIHRo
ZSBmdW5jdGlvbi1uZXNzIG9mIGJvdGggbWFjcm9zIChpLmUuDQo+PiBjb250YWluZXJfb2YoKSBh
bmQgb2Zmc2V0b2YoKSkuDQo+Pg0KPj4gSmFuDQo=

