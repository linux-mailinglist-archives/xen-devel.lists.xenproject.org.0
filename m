Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E61AAF692
	for <lists+xen-devel@lfdr.de>; Thu,  8 May 2025 11:17:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979116.1365815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCxNC-0003Wk-Q2; Thu, 08 May 2025 09:16:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979116.1365815; Thu, 08 May 2025 09:16:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCxNC-0003UZ-ND; Thu, 08 May 2025 09:16:58 +0000
Received: by outflank-mailman (input) for mailman id 979116;
 Thu, 08 May 2025 09:16:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w+WT=XY=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uCxNB-0003UT-7J
 for xen-devel@lists.xenproject.org; Thu, 08 May 2025 09:16:57 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20613.outbound.protection.outlook.com
 [2a01:111:f403:2412::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ecd68b5-2bed-11f0-9eb4-5ba50f476ded;
 Thu, 08 May 2025 11:16:55 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by IA0PR12MB8745.namprd12.prod.outlook.com (2603:10b6:208:48d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.20; Thu, 8 May
 2025 09:16:50 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8722.020; Thu, 8 May 2025
 09:16:50 +0000
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
X-Inumbo-ID: 2ecd68b5-2bed-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HmpHCqE5HWReDcnCubkbsV1HVjJl1ux2vRRn0/osbJ0k45MmtDzhyCCJagEGwz2437HBw+4wO+j33Lx9utPlmsDImG5bL0A6XtKh3OhFENmC5G2mL58Q6Drs82FLLT1tf5/eEdSDJJWKVNXdAFFGGNNmbYvPoh7hnvqgDr8MjgGyROOlyFFhKb4zI/9/DXg9hpWRmv4DdscBCKaP1LV377pteBAEA4RAy7JL0NKuFHBmTITIB5oZnydbn2WL38Em/hpNUJDyljHqceTSnbedCO4v7xX5GPwMxqhX+voGLKfQoMh6/Mwqa25xcEd+pUb+qu1D0e7IEZVCptqRo4870Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+h2FORUlvcPIlretBNSWEat6brs4D4xB3UI9dgNI70c=;
 b=IHGDG1axrLyiEmMthb4ucj+3nAWJsx1yCL6Hr09Ri2y+VEwmHcBuzTr/HG+Zz3e2sjO6tsmObIJr93d7LuAcQEB8fnYDngmun/GWWhb+Xij6pMEWjcfgWHlPPVMefcjf1VB9SVQjzGq2D9x9GQlilGAXucz3ltPE3hNRVnpgU3EiPL5l8r8K7Ra5k03hv3MBAcj206B2nO6UFGOUD7Dg96oHjoCgVBlUO1A7Qe6vKYkro2TZzlXsWs0UUyxTqMRgFTY0dSS+byqNM/okVBKqbqgxTFxO1nTRc7BxUqPlGJgcWsIu3UE6WEepNPtBMcQBVA/HPp9jZOYaObFUu7BIVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+h2FORUlvcPIlretBNSWEat6brs4D4xB3UI9dgNI70c=;
 b=jddZJfm3rjOMxgtUltDw8rn0QcbkvAGQokORrtBS+gon0cneAZDqygdIBkcEf6Wd040R87m5F+IW+X3bFRwtyVF8MWygXCD8AVt23zX83BMDUXdxq6XSiLSvSNkxJ4B39ElJ9fWIclRt634jz9lWqy23erkCiWFGh2zxBFPyf8Q=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v3 07/11] vpci: Hide extended capability when it fails to
 initialize
Thread-Topic: [PATCH v3 07/11] vpci: Hide extended capability when it fails to
 initialize
Thread-Index: AQHbsoVd9OkTHNIeNk69huFsDqzHMLOv3AoAgBk3cgA=
Date: Thu, 8 May 2025 09:16:49 +0000
Message-ID:
 <BL1PR12MB58494C2ACD017CA85802061BE78BA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
 <20250421061903.1542652-8-Jiqian.Chen@amd.com>
 <af333718-8a7b-4e97-a24e-16699b6dd0bf@suse.com>
In-Reply-To: <af333718-8a7b-4e97-a24e-16699b6dd0bf@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8722.017)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|IA0PR12MB8745:EE_
x-ms-office365-filtering-correlation-id: 77e10879-539a-42b6-40d3-08dd8e111091
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?L1hsRytzZ2pFUHdYcGkycGFpQ2gySkQ3WnFZZG1HT2M4TlhlaHZLNHpOMFlO?=
 =?utf-8?B?eUh4ck8zbWpzTyt6SnpTYWZYUS9MZFBBL2U2YWs3VlVTbTg5cnRUa0M2NkNx?=
 =?utf-8?B?WHJlV2ZFTG4vclk3L21FeGo4UjFtdTVNQXhtK3NUKzNrL0JmanRmc2FlQWJO?=
 =?utf-8?B?bXllT2szWkRqY3h2cC9RQVh3bjF3K1NIQjE2TUpLN0hwTngvOFZEVUtvRFBJ?=
 =?utf-8?B?MEd3TldoZmFuL2hoYnh4ME9Hd0pTcVI1QmV1MGlrRFpLL2pmRzJOTzVXeGw3?=
 =?utf-8?B?MUVXektWZWt2bUZVQjdwbnhhaENXa2JaUUEzTmNmRUE1MjNXcnFveFdPenNG?=
 =?utf-8?B?bElwQ1dMc0c0bFNiN1F1Y1g3aFErbmVlcDdvNjNGbUFyVC9HT1ZoMk1FVjhJ?=
 =?utf-8?B?QklmQWpQZVN5Y0x2ZFF5bElhZURPeUFkNHh6OWdmN0F0aDJzVVRvQWdtWUJJ?=
 =?utf-8?B?RlhjQkxxbHl6cUx6TW9kK0NQSElOTGpwU1gwVkQ2QmlOenRSMVdzcVg3TzlK?=
 =?utf-8?B?dk40OTJtSlJjRkVGUEVQZGNOc3R0SDZuQXVKSDRXT2VCZGJZNlF2MFdjaDFU?=
 =?utf-8?B?aHBzY0RYVjNGeWd4b0NteGp2d3RTVUt6eGVDV1c2Qm9BTll0SGRlMFE4djNR?=
 =?utf-8?B?cFVzQW9iVFM3S2xsaDdSbythSlNRSTJGRDlFZGRaRUg1aFFZenBPck51R1VD?=
 =?utf-8?B?NXFyYjV3WFU3YzUxR3Q3T0JXbCtmYjRGSnIxUGZxckErUldFeG94MWNKdWVK?=
 =?utf-8?B?MlBlajdBZnE2WW9vTmI5WmlLNFpoclFDMVB4YUFtNmFWUlFJS0Z6V3pJN0cy?=
 =?utf-8?B?QVcvMDBUbEFCTWs2ZjVobFpJdk1IOS8rVWEyQ2dTMGNXRVZ2Q00zZkR3dW90?=
 =?utf-8?B?R1A0OWVGcXk3d3ZtZjlWMFlCZzdlT1haazdpUU9ORC80ZUkvSjJaNldKSkJE?=
 =?utf-8?B?cWtLNjZ2V0JLcHh1RHNGVDFsWnZNOGhJZGZCOUJBV1ljUzRlakZOUUF6SUZ0?=
 =?utf-8?B?NGwyNHpaWG53cmxiRmNiSGM1UTh6azdkbVQwd3ZOWjYyTnpCM1E5T1hOOFlW?=
 =?utf-8?B?T0hRVUpSMks3VlAvK0NRdUlyZHpoK0l1Sk9nSjF5UllyNTVEVHFhU2VCOHNh?=
 =?utf-8?B?SVFaOXcrTUdUbThod1dZeUNPOUNSTk5mb2NMUDl0a2dCelc5OXhTaFNENWJ3?=
 =?utf-8?B?Rzc4MFNpaEZ1dzVCZlNhN1lqK085TWNXV1YyTnVSc1FDZzV0dFFqT0NDcERp?=
 =?utf-8?B?bVQ2bDRiZTVmMUFmcWRtWGh5U09uT0xHOHhRbmhnYllvSitGMCs1MDRCS1dN?=
 =?utf-8?B?UFRWVFg5bWEzK1FkeXBiUlFTM3EyTVJna0w2Y056Qm43eUNuYjlDK1NmeGY4?=
 =?utf-8?B?bklPWE1HeW9ZM3hyRm91VlRWcEpRbU81cmI0RFhYQXBlTllPbDNlUjF6RDFo?=
 =?utf-8?B?TTRGTDVzaW44TUNTNC9qL2sreW1PQ3QyYUl3SHBVQ0VlSUs2Y215dlBTVlFs?=
 =?utf-8?B?MllyOGdCWUJ1VGQ0NFcySTZhamxocEduYUprR1NFa21kWTd0RnN0RWtncmIy?=
 =?utf-8?B?Q3NucjdJM0d0ajYxZDQxRlY0bkVhRGlKclVPcXJ0U05iaVNMWStIdXU5ai81?=
 =?utf-8?B?VXgrSGhadG1lZFJlM2htKzgzcENlU0VNZGpKU25TZTRoTlQ5UGR1dnJtK3Rk?=
 =?utf-8?B?amM0dEVaK2dCUUtzeW5lMG5RQXRyaklzamZBR2RKNGc5SEl3WllDZXR4OHYv?=
 =?utf-8?B?SnB0emlKUEl3MGJ2UkFmMFhXVDVUbCtHRXgzK0IrbjRBcE1IZHFxTHN6TjR2?=
 =?utf-8?B?b3JMRkt2RDBJMzNla1Bpazlla1Y1Q2M5dldEN01vODF1WERzaVU1cERlRTYv?=
 =?utf-8?B?STVGZ1VsRzVXR3dGR1FKZnpuS1NqZFNuaGdDT1JsQmpJbUVneVV5Z3ZsSmNJ?=
 =?utf-8?B?Wkw4a1VTUTQzcGUvUWlCV3Q2RWVFMU5GVURPb2wxeVl6Wk1yUXdOdlRVSmdI?=
 =?utf-8?Q?+xWh5ivowRbjv3N8ihe/9v5UNTKvnU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b04xd0R1elh6YXlrckx0aU0yVTNxaXY5d3hRWE03NXdIU1lYKyt1ZmQrdXhq?=
 =?utf-8?B?T2NjRVBLM1NvSU1jQW9INFpOMkY1MVZuaWh0YXR5WU1VaGMra1dLZVo4ZlV2?=
 =?utf-8?B?MHdYcHBpRHRWbElDajNISnJOeFRUaTY0cHgvSnlzYVNTRFRjSmYxdmVJZDVy?=
 =?utf-8?B?aHc5R1VENEI0R2ViOENpTDhsSnJGOTAwd1pYRmMrRGY2T1BoUUFrMW83QTN6?=
 =?utf-8?B?eWxuajF4bi9ROUcrUTJhRHMwQkdGYTFmdTJKZ0p1b2ZvWnpHdzJ5NDhHalRr?=
 =?utf-8?B?TWs0ZU95ZzVkUzlKUkZ0SFFqdU5Nd3FMYmVWTTBER1dhS2RKVDZkTkpoOFFn?=
 =?utf-8?B?TXc5OFptcGc4RlczazI0MjBGQVp0TUV3TlJ2cE1Lb3RESk01MlU3TW5sR0FF?=
 =?utf-8?B?dTVkc2FkOGhVMkJieUtnamVXQ29JcHNrOS9XZjBuOHdHdDl4QlA2VWNqMlEr?=
 =?utf-8?B?Y3A5SktqNDFCR29yVXc0dVZNWHRvSi9GYUd5cDlqT2U0eG45WmVVMFEvTy9T?=
 =?utf-8?B?ZGg1RmU4SnQvdHdBY0xDNnBjYXpmUkdOVlpIQzBkL3Q3UThwdkp5MENIcWxp?=
 =?utf-8?B?OUg3eTArRjh2Z3JwdVllNlZKd29Nc1BaZFBVS2xBR2JkQWdseTJmQTJCa2kz?=
 =?utf-8?B?ODZUbGpYYjlibmcrRHYrK25WN2gxRWJ0elluUUs5OXc4YTJxcDA3eXBmN3Q2?=
 =?utf-8?B?dGF6eWhndVdHNmh3Y1JRNjBoUjlTeXdMUHljcDNvclZxRS9yQnhjWUpTZHls?=
 =?utf-8?B?Y2NRRkVrdG1IN0RINlBYZXA4QWpOajhLQmJQN0VkWmNPRXhEMG0rSU5ZWm9W?=
 =?utf-8?B?QTdGTVh6M0sxQ09udmhDdkcxYkhiU3BpWkdVRUhrSlE1TmpNczBQaEwrSGNO?=
 =?utf-8?B?NWxlWWZzNHJ4TStrbDRvQndsbzAvSWRBK3M4c2dyMFljemVsWVE3ZnVQbHZk?=
 =?utf-8?B?bmx2dHVubzFzT3I3RE1mMldmNGFEem1RSUJjcExTKzNUV0QyNzhVV09ZT2E5?=
 =?utf-8?B?ZWQ4UDc2d1ZmMUZob2NJbmNJa3dGWGthN05RcWpqbWd6QkdTUnFXRWtzZVNy?=
 =?utf-8?B?azJiNm9VWG1lWXM5aldLekJDY0lRaWZ4QjBwR2Y5WmVYZ0xDRTVISEFHVlNt?=
 =?utf-8?B?K01RRXc2MERkS3ZrWW1SbzBLMmY0dUpkODF2cFNKMGIrNHA4Y2ZCM3FHYVRi?=
 =?utf-8?B?eDFxUjcxeFNoWHZkck9uQkJDemV5SHRkZnpsWDdka0FLSWRZcFEvM29hQXVT?=
 =?utf-8?B?d2NpU0p3VGg1RlptZll5cjJ6ZWVJOUl1TkFXNkU5TGtSRnlHOXU4ekxKUnVa?=
 =?utf-8?B?RlpCVUJSTENObWlvMVd6ZU5pdWd4cml4UkVTbmhvdVg0WnVPTzBlLzVyUXpu?=
 =?utf-8?B?VkQ3S285cnJYVUlDay9sYTZCSGFwNHc1T1FWTWg4YlZMek8wZm9CWVlIZHV6?=
 =?utf-8?B?VCs4cGdNSytwRHJQRUJkOWJRQkw1bGYvaGV5dFppNGJEYTZRV3E2WkR2YlRn?=
 =?utf-8?B?c3NSZ0Z5QmJiN3hMOEdrQlpJRGNTQmJ0T2pFdnUrRE1sRGIzQ1lVaUc5OWZD?=
 =?utf-8?B?YVdhNHRqamV3N05QRENSZXk5aVh6dllCeW1XMy9kb1dRZHB2RTNBTElUUlNZ?=
 =?utf-8?B?MG9LWUNJcWR4cGdVcXhxWGIwNWwxT0dvY3A3Nk5aR0l3V3NVNTByYkQ4K3JB?=
 =?utf-8?B?Y1M4WUtGbkpPQ1VGZGdlVEhQdGwwSmU4NHJQc0VBbjlSWmtGK0t2RERxMHdm?=
 =?utf-8?B?OHYzRkFheVkyQ0VjOStSSUZOWjhHV0dhV0FxMnB5dkdERGlTRzYzdGFpWHdj?=
 =?utf-8?B?bFI3N01KY2xPTFA4eVgzSW1pNjJzUjJReEw1N21IcHVGTm0zaTcyNWtPT0hC?=
 =?utf-8?B?RTdlRTJ5L09hYzVGYUVQc1FsNjB3VXNEYjRCS2loenJCNmRhQjhraGdodHNJ?=
 =?utf-8?B?M2sxaVM2WktUKzY5NGJGcmpUVWZhUWRRQkNqNmVQejRCYU5XcDZNN2gxTFJ2?=
 =?utf-8?B?REExYXZWaGltZHlDL3VvRnBLK0tCM2MwNURBTzlMSWRhajVxZDArb3p3OE9r?=
 =?utf-8?B?NTFObWNKeE5DNUlLbmlKS2x5b2I1TWdPcUQzRzZZRGFjVVFzaUdNeVZRamFN?=
 =?utf-8?Q?q15c=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B557EC0FBA8B7B4FB1A6D4517AD02297@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77e10879-539a-42b6-40d3-08dd8e111091
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2025 09:16:49.9655
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XZfszncdCnpNkykCmYDp7eqF65lAdxx8s9k7G+IredD+dKfisKj5661EKsWV3RtEmPaRdIG61nQ4EnrolouITQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8745

T24gMjAyNS80LzIzIDAwOjA2LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjEuMDQuMjAyNSAw
ODoxOCwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vcGNpX3Jl
Z3MuaA0KPj4gKysrIGIveGVuL2luY2x1ZGUveGVuL3BjaV9yZWdzLmgNCj4+IEBAIC00NDksNiAr
NDQ5LDcgQEANCj4+ICAjZGVmaW5lIFBDSV9FWFRfQ0FQX0lEKGhlYWRlcikJCSgoaGVhZGVyKSAm
IDB4MDAwMGZmZmYpDQo+PiAgI2RlZmluZSBQQ0lfRVhUX0NBUF9WRVIoaGVhZGVyKQkJKCgoaGVh
ZGVyKSA+PiAxNikgJiAweGYpDQo+PiAgI2RlZmluZSBQQ0lfRVhUX0NBUF9ORVhUKGhlYWRlcikJ
KCgoaGVhZGVyKSA+PiAyMCkgJiAweGZmYykNCj4+ICsjZGVmaW5lIFBDSV9FWFRfQ0FQX05FWFRf
TUFTSwkJMHhGRkMwMDAwMFUNCj4gDQo+IFRvIGF2b2lkIGludHJvZHVjaW5nIHJlZHVuZGFuY3ks
IGltbyB0aGlzIGFkZGl0aW9uIGNhbGxzIGZvcg0KPiANCj4gI2RlZmluZSBQQ0lfRVhUX0NBUF9O
RVhUKGhlYWRlcikJTUFTS19FWFRSKGhlYWRlciwgUENJX0VYVF9DQVBfTkVYVF9NQVNLKQ0KV2hl
biBJIHRlc3RlZCB0aGlzIGxvY2FsbHksIEkgZW5jb3VudGVyZWQgZXJyb3JzOiBldmVyeSBuZXh0
IHBvc2l0aW9uIGFkZHJlc3MgbG9zcyB0d28gYml0cyB6ZXJvLg0KVGhlIG5leHQgcmVnaXN0ZXIg
aGFzIDEyIGJpdHMsIGFjY29yZGluZyB0byBQQ0kgc3BlYywgdGhlIGJvdHRvbSB0d28gYml0cyBh
cmUgcmVzZXJ2ZWQgemVybywNCnNvICIjZGVmaW5lIFBDSV9FWFRfQ0FQX05FWFRfTUFTSyAweEZG
QzAwMDAwVSIgaXMgZmluZSwNCmJ1dCBpZiBjaGFuZ2UgdGhpcyAiI2RlZmluZSBQQ0lfRVhUX0NB
UF9ORVhUKGhlYWRlcikgTUFTS19FWFRSKGhlYWRlciwgUENJX0VYVF9DQVBfTkVYVF9NQVNLKSIs
DQpJIG5lZWQgdG8gY2hhbmdlIFBDSV9FWFRfQ0FQX05FWFRfTUFTSyB0byBiZSAweEZGRjAwMDAw
VSwgaXMgaXQgZmluZT8NCg0KPiANCj4gbm93Lg0KPiANCj4gSmFuDQoNCi0tIA0KQmVzdCByZWdh
cmRzLA0KSmlxaWFuIENoZW4uDQo=

