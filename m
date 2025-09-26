Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58761BA2983
	for <lists+xen-devel@lfdr.de>; Fri, 26 Sep 2025 08:57:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1131110.1470322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v22Ol-0001GT-OJ; Fri, 26 Sep 2025 06:57:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1131110.1470322; Fri, 26 Sep 2025 06:57:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v22Ol-0001DN-LJ; Fri, 26 Sep 2025 06:57:43 +0000
Received: by outflank-mailman (input) for mailman id 1131110;
 Fri, 26 Sep 2025 06:57:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cR/D=4F=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v22Oj-0001DH-S5
 for xen-devel@lists.xenproject.org; Fri, 26 Sep 2025 06:57:42 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 145c2491-9aa6-11f0-9809-7dc792cee155;
 Fri, 26 Sep 2025 08:57:35 +0200 (CEST)
Received: from IA1PR12MB8467.namprd12.prod.outlook.com (2603:10b6:208:448::9)
 by MW6PR12MB8950.namprd12.prod.outlook.com (2603:10b6:303:24a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 06:57:31 +0000
Received: from IA1PR12MB8467.namprd12.prod.outlook.com
 ([fe80::1633:cc45:8177:a91e]) by IA1PR12MB8467.namprd12.prod.outlook.com
 ([fe80::1633:cc45:8177:a91e%6]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 06:57:31 +0000
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
X-Inumbo-ID: 145c2491-9aa6-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HmrTGq3Y7t8H8tYEs/Y/05HwEBoDwNM4eFj5LitfHikIBtR8Y0/jT+TE8JLOd6A3YW3igzelDjrcjMbDSEF6H3SBP1yvw8593KUudR2jARaGh0NLip9RcOhEwFO7yatLUmDCHZB8tnS3OWW+IZShmB9CIH5jEu9kuqxU3sBMVhPOj+HkVwt4Sf3XTNY5z8ifNxGaT9ae4HofVqZCI6HdGNqzTwh94nMZ90xGry6NO2QWtPxlY/IfhRXC1lWpwA1NVHpP7jQjX8o+s3hKdZu5xilJSsD3wnCGNPto3KkQ8/4Qap9j5zvpkobul5zNGE1jxDvTPNVNwWE2oM2ppHGXzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UsWE8zRfk+e3Px7//gF/wZR5IUFDweX/byn1Tiau7Vg=;
 b=Z9TYKzp2kALYMF8Kyi/bVRPYjGPEFJAIF5eiDXjQPLkpW8isELVQpKt4fyzV5x69N1Hp8XNVtfaGA0ZkvUuwNcoBAguKovMWoTZ8yS40smFwtOPPjx0TXrjFGa1nNDUJZ3kuwfNAPb5GT4VNCKHYI2UsvImN1ZmN2jMW2JWoRGAoCxu11rIr3SyIAPTIYA/ZcnSpbskueR8YLbKnI7BTELFOuLtsZuU74k5Sn2UsP5eZVL51CkeTD6MW02tDkvnDz75ggozWufy+lKrFM4ufAcTZurGwIO4BA5cuh6vBkcHYo22KrQl9eOcQnMRCygtHlNnYt+WYYFDaBaC5nsmuQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UsWE8zRfk+e3Px7//gF/wZR5IUFDweX/byn1Tiau7Vg=;
 b=hj0YLlLp+uhur3wxTQTINmDp7G1+Rr5V+52CyLj60femvteGMIcuhVWydsNnQf4W9//XUeeFNt4/vuJgZpGlEw1Bmdzlv/qiP95D1+SBMPb7h1+ztwWW/VnDa/Pc6lM9SjlaE07Kzt/vjG9VCoPdJieiR9U3OS/yGQWSOgsLE38=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Stabellini, Stefano"
	<stefano.stabellini@amd.com>, "Andryuk, Jason" <Jason.Andryuk@amd.com>
Subject: RE: [PATCH v2 18/26] xen/domctl: wrap xsm_getdomaininfo() with
 CONFIG_MGMT_HYPERCALLS
Thread-Topic: [PATCH v2 18/26] xen/domctl: wrap xsm_getdomaininfo() with
 CONFIG_MGMT_HYPERCALLS
Thread-Index:
 AQHcIiYYEaVyPVCsmkah0K573htVM7SN/BaAgBWuJICAAGLSAIAA6DCQgAAq/ICAAADyQA==
Date: Fri, 26 Sep 2025 06:57:31 +0000
Message-ID:
 <IA1PR12MB8467188458BA8FAF348AC538E11EA@IA1PR12MB8467.namprd12.prod.outlook.com>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-19-Penny.Zheng@amd.com>
 <a8b93dcc-c003-49a6-8a78-5fb890cbaec0@suse.com>
 <DM4PR12MB8451BE98219C343F8F62482AE11FA@DM4PR12MB8451.namprd12.prod.outlook.com>
 <66b43c3b-c74f-4c18-b91a-bd7b56a62eff@suse.com>
 <DM4PR12MB84518B65027B6A355ED4D246E11EA@DM4PR12MB8451.namprd12.prod.outlook.com>
 <af57c032-541d-4956-85de-269066c50cd3@suse.com>
In-Reply-To: <af57c032-541d-4956-85de-269066c50cd3@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-09-26T06:57:24.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR12MB8467:EE_|MW6PR12MB8950:EE_
x-ms-office365-filtering-correlation-id: 84631df8-3a75-44be-e5b7-08ddfcc9f69c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?WnlrZXlQOVlQVzhRV28ydGZjNVhSVVUrbG1kc3RHSWs3YTh5VWUwOXBZODBo?=
 =?utf-8?B?WjRFUVhjc0h1VGNSSFJVOEdQUjlRSHlwZTBCSklwZlFhblBDU2tIZnJ4Szds?=
 =?utf-8?B?WWZkTWxxNENyZDVIaDVhdW1Lc2dGSlhiVE91cVZjVmc4YlJHMjZBM1VUOUhm?=
 =?utf-8?B?UG9rMUJFWDJjaGVEY1p6K0UxSUV0ak1BN0pOcGdOU3JhMnpaeFdpa21FT05R?=
 =?utf-8?B?UDYyYzV1ZjI2ZDNuMkd5STNDeVJHNi9vK1A5S2pmVW1hbjQ2azBmMzg0K2pk?=
 =?utf-8?B?UEhneUtTWGtwNGNkQjEzSHE3VVZJS2dvNElEcXJBWjFwSjZ2cDI4clQwYWtn?=
 =?utf-8?B?Tlp3MkdtUVlHUnMzU1Uydk1qeXpOL0x2aTFnajFoRVZIMVFCSmZPUlM5Nlh6?=
 =?utf-8?B?dVRCK2pLbXFaTzJ5Vm5XanRXR1FuYk1XTldZdWF6WEFwSXZaSTg0LytQUzFz?=
 =?utf-8?B?R0pocXdzSW9VWUpObWlEUFVUNnp3MkJRYXYzSE13ak0vUVFEam52ZGttdW0w?=
 =?utf-8?B?RmZiMGhBMlM4am81a3BoZE1FMGNqYXNLNDg2QTdVK3BRTjFzbFVrcFh5aVJr?=
 =?utf-8?B?VXRGY2RMTk5iZC8yNjJQck82TXJoZzk2WmtnWTJObDRzUkU1ak1KL3FFem1L?=
 =?utf-8?B?b09NQ0tUQjZOd0Z5SFVIbjdyRkdZVmQ4TDNKZEh4ZjNkL0hBSGxxaW4rUURx?=
 =?utf-8?B?bFNuTEU4RlZieUhiU2pKNlV4NkhTZkRaOXVjS0lGaEFXM2FRYURBdFAwSzE2?=
 =?utf-8?B?Rm5NQ3RneXRVbVFONU94c2hzWWRjckpoOFBqSlRvc3dmU1laamZweDFhdHp5?=
 =?utf-8?B?aXFrckUybTdwc2RqbmRDYitCSWV1RjdKNnQxZTJKQnRONmlwaWJsNHBCanNY?=
 =?utf-8?B?NXV5Uml0bzI2blhrK2p5elN1bUpySEUxSnBPRlR4R2dwWVpnUTBucm1DT1V6?=
 =?utf-8?B?anJpb1pic1pkWnRGWDl5Y1hzcmZiWUV1UGwzZ01VNTU4bUJnemp4ODI0Z1Ry?=
 =?utf-8?B?dGYrL2hPZ3F5QjdKLzhla0d2V3R3SncxMnZvVEJpNlhiNjlOQ1RxclN1LzlT?=
 =?utf-8?B?N2FPYVZMc3gyVEIwNlVXZjJ6d1JtSzNSU0tQZFRKSFZreXc1M2JBS2k0RGhY?=
 =?utf-8?B?L0owQ01KK292aUtGbFkycVdQQ1RNYUs4OUZDdWE3NnZ4NW5PZUIyTHc1NFkw?=
 =?utf-8?B?VldSc3o5Q3M2QzJsMTlreUVnL2JVeU5DU1d2WVZXRTJJNWxyRklXWDRHUlVu?=
 =?utf-8?B?WUpIQ1hmN1B1RWk3NHhldmZ1aE00RGw1d3VVMS9Lbk5kcmo1ZjIxZms3U25p?=
 =?utf-8?B?Q284Z0tzUmlyejNPcEhSOG9DOEZ2eDJJc0xOZCs5VWh1VVlUK0pTMzRIaVp4?=
 =?utf-8?B?cHZxRGpMSFYwZ0xqWmZnUml2VnFFZm9rVU5jajRNUjVmUDRBRzBwTE55S1cv?=
 =?utf-8?B?TWF3ZHhMajFheDI0ektWNUxEbXEwZFY4SEZLbUhTTjZibnBSWUZwK1pMNXFi?=
 =?utf-8?B?VXVhWGc5NjJXd3dtR05WUmhVYmVLVER4STluTWRaeURoM1RtZVNWYWx2ckUr?=
 =?utf-8?B?QkNrWnNsbzQ3bU9oQ3IvalhaMEhhY3Z1Sks3b0lhTG5wditQblZJS0s5MURG?=
 =?utf-8?B?WUdmcGVTMTlOeTJwMUllMGhPeXUybDZhZ2YrK09iZ2dwUDN6WnBvTXgxUXBz?=
 =?utf-8?B?SVhoSnU2ZHY2RmRzc0FUMWtHdUdTM1RvcnlhS0NZaGpUUTJ4aGlwcGNLMnV4?=
 =?utf-8?B?L052eWtTSmpSQ3lqTTdCTDhTaXRHbmRQdmh5WWpnNlhZQ0pFQlRqR0xMc282?=
 =?utf-8?B?SkRnRGxrVnRXcDdONHpUV3hBaDBSaWlHU0hYZVdqWGkrblFUb3RvN1V4Rm5R?=
 =?utf-8?B?dlFic0VRcFJCckZiSnlNYk5qZnhKblMzOTJNS3FsRjhLVXQxYTgwNEw3elpO?=
 =?utf-8?B?VHhlUFdmTFNTaUNmZXlleGRKQTlQRnUzVFdJSVBaSzdoa1NicXJIV09jVjdK?=
 =?utf-8?B?amFqU21BTVdJOTAxK3RFQUNHQ3R1eVJ5QzZWaGg3UWdjdm9PZExPMXV0L1k5?=
 =?utf-8?Q?z9e+Fl?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB8467.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WmQrRFArbkJuQXQyUndhV2hXU0xZc1RLVThpNktsRkZmQkVDVm1qYldwanFn?=
 =?utf-8?B?QVpTTFR3MEt0OUlESlEzQ21uMnJNTmtiT3p0cGxTMW5kOFVYbXd4TnlaaGdW?=
 =?utf-8?B?TlBDZkF3TEQ0V1c1YU9kbFJjdWhsVWpWdmUxNWIrZ1N1SEhGMzkraVYxMXR5?=
 =?utf-8?B?bzhIWkxML3NQUzVIYUprMlU1SS9xQjJCcnZLekduSTZ5aHFtZEUyNVh6a1E3?=
 =?utf-8?B?MTVmZXpVdE9hbmhOWWpTNDlNMHFPRStwVUZycnRIYXhLTHNaSUdsckNKSVln?=
 =?utf-8?B?S1BKaUZCR29EZ2VyUFNqUVNuM3ZGYlFHRW50SHllMG04UlA5NjZDN0ZONmtn?=
 =?utf-8?B?amEybk9WclJETlBDUmYwSWdaTGlXWS9hSm5BV0d0UzZ6YjNMZk1hYWRycGNn?=
 =?utf-8?B?U0ZhWGtOWjEvTS9IN25lSlJyU3gwdlJvSHVpM2RBRW5OTVVrVnpJczZSRkhx?=
 =?utf-8?B?NVlXVUVZUVE1USs1ZERoV0ZRUGNDSlZMMmQ0aDdidVNPUXliM3dUTm5vUkhr?=
 =?utf-8?B?VTN2bERDSitUTzVwNHhjRmdNVmR5eC9ETlJTQWlab0JjZ0JUeTl2ZXJYaGtE?=
 =?utf-8?B?ZmxrNGI3VDdCTVlVL2Y3WW5NRXpjYWxCRzRGSGNESys1YmJOdHNURnJjNUpt?=
 =?utf-8?B?QTBQRUZUUjZHeVY0blpOZ2t5MjJ2Y1hmRk9jN3BoaWRmdlRBV2NFQUxkUE0x?=
 =?utf-8?B?L2xhUVBCU3hsajIyNm1aT0hHcUtpVDJINmpKVERId01oU3hoK3FsTHEzQnVh?=
 =?utf-8?B?TWFybHVjYWNFTzludlNRaUcrMUlsVVZoWHFTZTIwVDBtcjNUMXg1NGxZN2dR?=
 =?utf-8?B?TWRJb2x6a1NsK1h1MGJ0MG1FL2toRERjeU9MU0lEcUxoUnpWTWx1S0NSL3BI?=
 =?utf-8?B?ZjBWV2dhSWxncFlqdngrajUxMFVEQkZHajhVRTN4Q1Vtc1hMRXZHc0dSb1Ew?=
 =?utf-8?B?RXJjeXo1dGhGMWpheEpWcTBZazdNN0Rzd0QrTlNoT1VDc1BXb3p5dWYrQjF1?=
 =?utf-8?B?RWY4Rldqalo1bjRzTmJUdzBsRUdNaktraFpnVCtEVmhHNDF5NkdNRGVxajJX?=
 =?utf-8?B?NUNLNlZXeUJOVUY2cVo4aDRsOWlzN2FLaWRSaU00ajhjbW84QTVreHljN0I3?=
 =?utf-8?B?amk0eGNlODE4aWprNjNJY2gxL1NmRGoxMWpGeEhqZzNzeUhvNWNDaWpyNnp5?=
 =?utf-8?B?Q0dLQm1TZjVlQWQrME9FaFh3dDE5dnBScEsxeko5TG5oVnB3b2tqd01tNW50?=
 =?utf-8?B?NVVJNFJmUUc2bTJOQjBMRXJaUGxrUVFFVHFEbXFENFljUzh6MEFlZjRuOGtF?=
 =?utf-8?B?N1R4U3JNalFmNEhNaFZWQkJSd3pha0VhOXpPQ09JNXZDVkVsZ0orcFI4Mlp5?=
 =?utf-8?B?U1dla3NJc2MxcDVzdUU2V3J3WVpPTitiZFQra2EwTWxTRkY5R1hHL1BWK2ZP?=
 =?utf-8?B?Q1hEQUhlTTcwNDRlMUJYS1JvREhiMkxjM3VJNit1TTlYZmlnTm1OSHhHRmJh?=
 =?utf-8?B?REdHQ3JvcUJtb01FQVJxVWM2TFhlMG9TWHVKbGRVWDJHYlJmTlUvcFFtMmg1?=
 =?utf-8?B?dURCUXQ2aTltKzJzN21vbXhxYWFDOXJoWTlkQXRlWnRWNUUxSy9yTHFQcE1V?=
 =?utf-8?B?Y1B4VUhCbStDaXFSOUpaWUhwc0ZObGQvK1ZJL2JEb1VQbVI5VFliVitFRkdN?=
 =?utf-8?B?R0VaekRWZUhGMTBNL01rZi9tdWxpa3o2VzE0dmdqTkEwWi9OTTlJc0ZZR0ZZ?=
 =?utf-8?B?djdiM1RFWGRMYW9ISDkrZWh0MFFNT1Z2MEZFcGlxRFJMVUZuNE83cHYxV0gy?=
 =?utf-8?B?NUNKZ3R4K0k2eWhXSGJBYnFWOEJ6dU03Y3ZqZmFVbi9wdG1tYUpuRmIxVEpY?=
 =?utf-8?B?Q3hCWXpkOVZZZTdHcnE0M00zNjVScFNwY09qNit4ZDRoOGo2cHNqTVdoWFpP?=
 =?utf-8?B?M09tZE9HbXNPYkhJd2FGS05TWlVhRnV4UVRMc2dKM0NWcjdFRmNydCtaVXl4?=
 =?utf-8?B?aDNJLzF1Wjlhb2ZvOFhlL2RmWjdSL3VzQ1pjUnpGK2RIQnEzSGFxQTBSWmtC?=
 =?utf-8?B?VDEzM3lGVXVoYXpTRG5wbEZkWXhIdTZvdVJwb3RjYzA1N2o3eURBY3RyT2Ev?=
 =?utf-8?Q?EyfI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8467.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84631df8-3a75-44be-e5b7-08ddfcc9f69c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2025 06:57:31.2272
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lkUPhxIWWLxYsoAgSr2sSa74qZVV/4Wk4ypbkhk134mTKOGhNTJR2/ZphbsaWzXuLgOvHSz013/ovCOmo8m44A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8950

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IEZyaWRheSwgU2VwdGVtYmVyIDI2LCAy
MDI1IDI6NTMgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4NCj4g
Q2M6IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgRGFuaWVsIFAuIFNtaXRoDQo+IDxk
cHNtaXRoQGFwZXJ0dXNzb2x1dGlvbnMuY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnOyBTdGFiZWxsaW5pLA0KPiBTdGVmYW5vIDxzdGVmYW5vLnN0YWJlbGxpbmlAYW1kLmNvbT47
IEFuZHJ5dWssIEphc29uDQo+IDxKYXNvbi5BbmRyeXVrQGFtZC5jb20+DQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjIgMTgvMjZdIHhlbi9kb21jdGw6IHdyYXAgeHNtX2dldGRvbWFpbmluZm8oKSB3
aXRoDQo+IENPTkZJR19NR01UX0hZUEVSQ0FMTFMNCj4NCj4gT24gMjYuMDkuMjAyNSAwNjo0MSwg
UGVubnksIFpoZW5nIHdyb3RlOg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+
PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4+IFNlbnQ6IFRodXJz
ZGF5LCBTZXB0ZW1iZXIgMjUsIDIwMjUgMTA6MjkgUE0NCj4gPj4NCj4gPj4gT24gMjUuMDkuMjAy
NSAxMTo0MSwgUGVubnksIFpoZW5nIHdyb3RlOg0KPiA+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+ID4+Pj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+
Pj4+IFNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIgMTEsIDIwMjUgOTozMCBQTQ0KPiA+Pj4+DQo+
ID4+Pj4gT24gMTAuMDkuMjAyNSAwOTozOCwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4+Pj4+IC0t
LSBhL3hlbi9pbmNsdWRlL3hzbS94c20uaA0KPiA+Pj4+PiArKysgYi94ZW4vaW5jbHVkZS94c20v
eHNtLmgNCj4gPj4+Pj4gQEAgLTU1LDggKzU1LDggQEAgc3RydWN0IHhzbV9vcHMgew0KPiA+Pj4+
PiAgICAgIHZvaWQgKCpzZWN1cml0eV9kb21haW5pbmZvKShzdHJ1Y3QgZG9tYWluICpkLA0KPiA+
Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgeGVuX2RvbWN0bF9n
ZXRkb21haW5pbmZvICppbmZvKTsNCj4gPj4+Pj4gICAgICBpbnQgKCpkb21haW5fY3JlYXRlKShz
dHJ1Y3QgZG9tYWluICpkLCB1aW50MzJfdCBzc2lkcmVmKTsNCj4gPj4+Pj4gLSAgICBpbnQgKCpn
ZXRkb21haW5pbmZvKShzdHJ1Y3QgZG9tYWluICpkKTsNCj4gPj4+Pj4gICNpZmRlZiBDT05GSUdf
TUdNVF9IWVBFUkNBTExTDQo+ID4+Pj4+ICsgICAgaW50ICgqZ2V0ZG9tYWluaW5mbykoc3RydWN0
IGRvbWFpbiAqZCk7DQo+ID4+Pj4+ICAgICAgaW50ICgqZG9tY3RsX3NjaGVkdWxlcl9vcCkoc3Ry
dWN0IGRvbWFpbiAqZCwgaW50IG9wKTsNCj4gPj4+Pj4gICAgICBpbnQgKCpzeXNjdGxfc2NoZWR1
bGVyX29wKShpbnQgb3ApOw0KPiA+Pj4+PiAgICAgIGludCAoKnNldF90YXJnZXQpKHN0cnVjdCBk
b21haW4gKmQsIHN0cnVjdCBkb21haW4gKmUpOyBAQA0KPiA+Pj4+PiAtMjM0LDcNCj4gPj4+Pj4g
KzIzNCwxMSBAQCBzdGF0aWMgaW5saW5lIGludCB4c21fZG9tYWluX2NyZWF0ZSgNCj4gPj4+Pj4N
Cj4gPj4+Pj4gIHN0YXRpYyBpbmxpbmUgaW50IHhzbV9nZXRkb21haW5pbmZvKHhzbV9kZWZhdWx0
X3QgZGVmLCBzdHJ1Y3QNCj4gPj4+Pj4gZG9tYWluDQo+ID4+Pj4+ICpkKSAgew0KPiA+Pj4+PiAr
I2lmZGVmIENPTkZJR19NR01UX0hZUEVSQ0FMTFMNCj4gPj4+Pj4gICAgICByZXR1cm4gYWx0ZXJu
YXRpdmVfY2FsbCh4c21fb3BzLmdldGRvbWFpbmluZm8sIGQpOw0KPiA+Pj4+PiArI2Vsc2UNCj4g
Pj4+Pj4gKyAgICByZXR1cm4gLUVPUE5PVFNVUFA7DQo+ID4+Pj4+ICsjZW5kaWYNCj4gPj4+Pj4g
IH0NCj4gPj4+Pg0KPiA+Pj4+IFRoaXMgaXMgaW4gdXNlIGJ5IGEgWGVuc3RvcmUgc3lzY3RsIGFu
ZCBhIFhlbnN0b3JlIGRvbWN0bC4gVGhlDQo+ID4+Pj4gc3lzY3RsIGlzIGhlbmNlIGFscmVhZHkg
YnJva2VuIHdpdGggdGhlIGVhcmxpZXIgc2VyaWVzLiBOb3cgdGhlDQo+ID4+Pj4gZG9tY3RsIGlz
IGFsc28gYmVpbmcgc2NyZXdlZCB1cC4gSSBkb24ndCB0aGluayBNR01UX0hZUEVSQ0FMTFMNCj4g
Pj4+PiByZWFsbHkgb3VnaHQgdG8gZXh0ZW5kIHRvIGFueSBvcGVyYXRpb25zIGF2YWlsYWJsZSB0
byBvdGhlciB0aGFuIHRoZSBjb3JlDQo+IHRvb2xzdGFjay4NCj4gPj4+PiBUaGF0J3MgdGhlIFhl
bnN0b3JlIG9uZXMgaGVyZSwgYnV0IGFsc28gdGhlIG9uZXMgdXNlZCBieSBxZW11DQo+ID4+Pj4g
KHdoZXRoZXIgcnVuIGluDQo+ID4+IERvbTAgb3IgYSBzdHViZG9tKS4NCj4gPj4+DQo+ID4+PiBN
YXliZSBub3Qgb25seSBsaW1pdGVkIHRvIHRoZSBjb3JlIHRvb2xzdGFjay4gSW4NCj4gPj4+IGRv
bTBsZXNzL2h5cGVybGF1bmNoZWQNCj4gPj4gc2NlbmFyaW9zLCBoeXBlcmNhbGxzIGFyZSBzdHJp
Y3RseSBsaW1pdGVkLiBRRU1VIGlzIGFsc28gbGltaXRlZCB0bw0KPiA+PiBwdmggbWFjaGluZSB0
eXBlIGFuZCB3aXRoIHZlcnkgcmVzdHJpY3RlZCBmdW5jdGlvbmFsaXR5KCwgb25seSBhY3RpbmcN
Cj4gPj4gYXMgYSBmZXcgdmlydGlvLXBjaSBkZXZpY2VzIGJhY2tlbmQpLiBAQW5kcnl1aywgSmFz
b24gQFN0YWJlbGxpbmksDQo+ID4+IFN0ZWZhbm8gQW0gSSB1bmRlcnN0YW5kaW5nIGNvcnJlY3Rs
eSBhbmQgdGhvcm91Z2hseSBhYm91dCBvdXIgc2NlbmFyaW8gaGVyZSBmb3INCj4gdXBzdHJlYW0/
DQo+ID4+PiBUcmFja2luZyB0aGUgY29kZXMsIGlmIFhlbnN0b3JlIGlzIGNyZWF0ZWQgYXMgYSBz
dHViIGRvbWFpbiwgaXQNCj4gPj4+IHJlcXVpcmVzDQo+ID4+IGdldGRvbWFpbmluZm8tZG9tY3Rs
IHRvIGFjcXVpcmUgcmVsYXRlZCBpbmZvLiAgU29ycnksIEkgaGF2ZW4ndCBmb3VuZA0KPiA+PiBo
b3cgaXQgd2FzIGNhbGxlZCBpbiBRRU1VLi4uDQo+ID4+DQo+ID4+IEl0J3Mgbm90ICJpdCI7IGl0
J3MgZGlmZmVyZW50IG9uZXMuIEZpcnN0IGFuZCBmb3JlbW9zdCBJIHdhcyB0aGlua2luZw0KPiA+
PiBvZg0KPiA+PiAgKiBYRU5fRE9NQ1RMX2lvcG9ydF9tYXBwaW5nDQo+ID4+ICAqIFhFTl9ET01D
VExfbWVtb3J5X21hcHBpbmcNCj4gPj4gICogWEVOX0RPTUNUTF9iaW5kX3B0X2lycQ0KPiA+PiAg
KiBYRU5fRE9NQ1RMX3VuYmluZF9wdF9pcnENCj4gPj4gYnV0IHRoZXJlIG1heSBiZSBvdGhlcnMg
KGFsYmVpdCBwZXIgdGhlIGR1bW15IHhzbV9kb21jdGwoKSB0aGlzIGlzDQo+ID4+IHRoZSBmdWxs
IHNldCkuIEFzIGEgZ2VuZXJhbCBjcml0ZXJpYSwgYW55dGhpbmcgdXNpbmcgWFNNX0RNX1BSSVYN
Cj4gPj4gY2hlY2tpbmcgY2FuIGluIHByaW5jaXBsZSBiZSBjYWxsZWQgYnkgcWVtdS4NCj4gPj4N
Cj4gPg0KPiA+IFVuZGVyc3Rvb2QuDQo+ID4gSSBhc3N1bWUgdGhhdCB0aGV5IGFyZSBhbGwgZm9y
IGRldmljZSBwYXNzdGhyb3VnaC4gV2UgYXJlIG5vdCBhY2NlcHRpbmcgZGV2aWNlDQo+IHBhc3N0
aHJvdWdoIHZpYSBjb3JlIHRvb2xzdGFjayBpbiBkb20wbGVzcy9oeXBlcmxhdW5jaC1lZCBzY2Vu
YXJpb3MuIEphc29uIGhhcw0KPiBkZXZlbG9wZWQgZGV2aWNlIHBhc3N0aHJvdWdoIHRocm91Z2gg
ZGV2aWNlIHRyZWUgdG8gb25seSBhY2NlcHQgInN0YXRpYw0KPiBjb25maWd1cmVkIiBwYXNzdGhy
b3VnaCBpbiBkb20wbGVzcy9oeXBlcmxhdW5jaC1lZCBzY2VuYXJpbywgd2hpbGUgaXQgaXMgc3Rp
bGwNCj4gaW50ZXJuYWwgLCBpdCBtYXkgYmUgdGhlIG9ubHkgYWNjZXB0IHdheSB0byBkbyBkZXZp
Y2UgcGFzc3Rocm91Z2ggaW4NCj4gZG9tMGxlc3MvaHlwZXJsYXVuY2gtZWQgc2NlbmFyaW8uDQo+
DQo+IFJpZ2h0LCBidXQgbm8gbWF0dGVyIHdoYXQgeW91ciBnb2FscywgdGhlIHVwc3RyZWFtIGNv
bnRyaWJ1dGlvbnMgbmVlZCB0byBiZSBzZWxmLQ0KPiBjb25zaXN0ZW50LiBJLmUuIG5vdCAocmlz
ayB0bykgYnJlYWsgb3RoZXIgZnVuY3Rpb25hbGl0eS4gKFJlYWxseSB0aGUgZm91ciBkb21jdGwt
cw0KPiBtZW50aW9uZWQgYWJvdmUgbWlnaHQgYmV0dGVyIGhhdmUgYmVlbiBwdXQgZWxzZXdoZXJl
LCBlLmcuIGFzIGRtLW9wcy4gTW92aW5nDQo+IHRoZW0gbWF5IGJlIGFuIG9wdGlvbiBoZXJlLikN
Cg0KVW5kZXJzdG9vZC4NCkknbGwgbW92ZSB0aGVtIGFsbCB0byB0aGUgZG0tb3BzDQoNCj4NCj4g
SmFuDQo=

