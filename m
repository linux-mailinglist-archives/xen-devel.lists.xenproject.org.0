Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70959AF8931
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 09:24:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032894.1406307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXamC-0003P0-9h; Fri, 04 Jul 2025 07:24:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032894.1406307; Fri, 04 Jul 2025 07:24:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXamC-0003MU-6Z; Fri, 04 Jul 2025 07:24:04 +0000
Received: by outflank-mailman (input) for mailman id 1032894;
 Fri, 04 Jul 2025 07:24:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MIza=ZR=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uXamA-0003MK-OW
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 07:24:02 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2413::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da806087-58a7-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 09:23:59 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 DS5PPF6BCF148B6.namprd12.prod.outlook.com (2603:10b6:f:fc00::652)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 4 Jul
 2025 07:23:56 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%5]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 07:23:56 +0000
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
X-Inumbo-ID: da806087-58a7-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cgJNawBNZ34GLTDh40aK16dFOjSERoxQLY8id5C/iFjCnWyZHKfIDYj/rSG5r+R8BbLZylKS7NrWR1RixQA3ThchIrFP1QnAZpGgsw28tSNuh6urtX+YB3dztQXlhJPrqB/k+gmOkuQYtBdz34/cCc24eATYBcblaGpRk85RHtVgGDWsaU3RlOtyXbU1781Q06etOEW6oyzL7I5zYVdXn0MOzMsNzK4vPXVd8jHFUJhfGv3lZEBQ/F0WWiGxUR8M3VhiCVA7QoOXhFWV9DmDJygRGEKma+n1+jGBOxcAfwsPCUbz7Th+IIH25o6G49k/srFK66wssgiEQCxlatEvAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=51X/0lNg/yREE8CoY9CTu3+dmCz2HswrLI8hRFqhXpE=;
 b=Gadbu33LOoyi50xka7tOOpI0Ab4hBlXf9x7tfSXKIlzt+/zFih6ci+9d4MmZJgJHyQbHtKS+s/Mwi07myZUAxIOffbtr/dIQIg4eNkbVrzHif6VmMamjx1xSjropaBN8bJNhJqW+qVGaPBu9P53kA9TMX1aOjNVRZsCRuZrr8tksbeNTFaANNNRh7IdsSQ5BWzCj5lh3CQLaksntPAxaRRqyGVtJdr9toCQxAzQVLY6foPESrrD4CIlfaKyhUKpj9rBBD5I1PcN2wZ+w2Ub5J4gLK3JsB0p1UzcUqQIHfoof0m0AxfkhTHWQLl23c/PHYc4rPK5AsTcui7jnUqwLWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=51X/0lNg/yREE8CoY9CTu3+dmCz2HswrLI8hRFqhXpE=;
 b=JayInUjrgL/jU6hapKosv+xllCzUA9cjj0N7UkN7bZf+8ZNZKCN8dcSna8ZWwlJmXHQ8BjnB9suFJfDvadacIcacLxBJRA5jjy9xRolkK7B5Vo5ZoBKucyim3EJ6pivhqzK+VJlXGHa6W19/fNLizdX0oI2SJ/JqiH0weV/kOug=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v5 10/18] xen/cpufreq: introduce a new amd cppc driver for
 cpufreq scaling
Thread-Topic: [PATCH v5 10/18] xen/cpufreq: introduce a new amd cppc driver
 for cpufreq scaling
Thread-Index:
 AQHbzuRFzooSbGuOOkWtJb1ZJ/MIx7QGEZYAgBiv97CAAB5CAIACoScggAA46ICAAA8FQA==
Date: Fri, 4 Jul 2025 07:23:56 +0000
Message-ID:
 <DM4PR12MB84519333B094A966F4E467C4E142A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-11-Penny.Zheng@amd.com>
 <964dcd5e-6a7d-41f2-94b4-c07672ffdc89@suse.com>
 <DM4PR12MB8451D32EC45867F91C37F702E140A@DM4PR12MB8451.namprd12.prod.outlook.com>
 <d0b2e49a-293a-481d-8c6d-626a19513122@suse.com>
 <DM4PR12MB84512DB2E098CE364A9A53BAE142A@DM4PR12MB8451.namprd12.prod.outlook.com>
 <15694c6c-55eb-4e99-8ee6-3c953bc69f28@suse.com>
In-Reply-To: <15694c6c-55eb-4e99-8ee6-3c953bc69f28@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=9eb3a99a-c522-40fb-8d78-9ce1da6ac1cb;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-07-04T07:23:45Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|DS5PPF6BCF148B6:EE_
x-ms-office365-filtering-correlation-id: 1caa168a-c174-46ec-691b-08ddbacbbcb3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bTJYR2h0dmVFK3N6QXhDWUxOdzg0VTdCK2d3ZzZoaldra3pHUWZ5L25ydHFC?=
 =?utf-8?B?dHpkYzFXYWtIckNUbk91eTRONTlDci85UzBMY2RuV0dvQmdOeUdIenNYNDJG?=
 =?utf-8?B?WlFyM2x1alhBTlc4YUQ0RklqaVU4T2FQb3gveWo3dWJrTWRZUVpvb1k2MVNo?=
 =?utf-8?B?cEhqMFBFVnUzbGE1akNlOUJqTEtXd0J4RGQ0RmtaVldGR0RHNXo3U2RuMW1q?=
 =?utf-8?B?OENJSTJMclUyUUloSWFPSWdURnVVMTBwN1QwQVRqN3IrcDBadGE3SDJkS3BF?=
 =?utf-8?B?UXQ2bjg1SnBkMDhNTnBrUzJKaXNCOTBMWXBaNmp6OGE3KzhKdEVITlBnbHdD?=
 =?utf-8?B?d0YzYU90SEFZb2lZdFNPRzlGK25hSG1mUnF5WFRlSWlWTVVTdUpWRUVuckw1?=
 =?utf-8?B?ODhTREdxVTUxSEE1aUFlSjRmY084cFNBL3FGdklFTGNTcTM1VXpNM1NzV1BV?=
 =?utf-8?B?K0FXeDFmU0d1dllhNzZIckluQ2hpTlRWOUNXYURRMGxWMVBXaVZ0QklJSE9l?=
 =?utf-8?B?bTI1aDlzMVFzd09aSHY0eitmNGlrcHZYNDNNRnpVWlUrZ1RJTGZMSWRvTHVO?=
 =?utf-8?B?T25CN1NXWmoyUU81MHp5M2xXamh2NGMvcXlNdS9GN0lqTkhIb1JlcHpnK1Rw?=
 =?utf-8?B?T216YTI0SE41dldDNEtEWTQzRTlVT2RuVXRTZEJZaXJaTS9RUytxSlRTSnBC?=
 =?utf-8?B?cXdEQ0RQbEFXRkJQcUl4M1RiQnN6WGtjcFBYL2NMcTlvQlVsSzZZbWxnYlFV?=
 =?utf-8?B?TlpIaWEyVTl6YWhSQzBGenBucjVWN1BTMklaMmd1U0F1YUNCaEI5WmRzSTl5?=
 =?utf-8?B?MzFSV29pTm1GNzlDWWR5eVFMT2ViZDc5aEVQQWlQenNiZnlTa1dSbjJjcVFD?=
 =?utf-8?B?eG5uRlVRMy9PNEJBcmFyaVdXK0ZGb0JJZk10YktodjdKajFGZnFpSmY4dStI?=
 =?utf-8?B?dG85c1hlRGxzencrVStXdXRCRTN3KzlHNWRTZi9Yc2tPMmc0QXo5M3JQTjQ5?=
 =?utf-8?B?UU9DVnFkVjNoNlBqbjJ4djRTUFN4UHlUN1NHUGVpVUxFWFhtTWZoU1UyaUZ1?=
 =?utf-8?B?NWRsZ2lBNDUxdXdEelBoNGZvZ1BmYUp0d1BIV25lQTB5ZCt0YlZmam00ajVV?=
 =?utf-8?B?NDNtS3granFFTHpjb3NHOGVRejhzQ2pyMFZidXJQOHkwd0c0WGd1eDJHVHVi?=
 =?utf-8?B?WHRDaDI2K3hJR1BjTGlLMDBsbmtLLy9Sb2FFTUFGRWExSDk5blY1cG9pVDIy?=
 =?utf-8?B?VWcwZzcvWDQvalNORzBQaEhtVGNoZW5oNUlIY1M5WnRRa1ovclpLaTdBb0Jn?=
 =?utf-8?B?M2pGTFZmQkdoRHVhc2VSMStzQ1R4UWE2ZVV3b0s1ZjE2S3FBckxMRkplVmd3?=
 =?utf-8?B?MmlEQTVUWS9pM1BKSWl0Vld6eWFqNUd1eWp2cllXMm5lb2tPT0JoZGVHdTh2?=
 =?utf-8?B?QkxnejRPVGUzS3RVMHlLMHdLWGpURmNXU3dxVFExM09ZMjRzbmtRMXpFR3Uy?=
 =?utf-8?B?YXlickRrN3hyM3hsaTNUME5LbHh4YllPQTY4VHFtOXJSYTF2alhCZVloQk5H?=
 =?utf-8?B?SVhhU0pCWmJxWks0VzY1VzhHRlVvd0MxZTBKZnhIZS9Cd0FLOEFoSGRObFUv?=
 =?utf-8?B?a1RJNldCQThLWjlEc1d3NmlKM0s5MFgvZ0ZnaHM5NUdZSlRPK1dhZDVPVDRB?=
 =?utf-8?B?aGhYK3dSMHVXZkVzQnlkZHBJSlNQVXZJbjhjZ3M3V3RBaituaEM3a2lrZlly?=
 =?utf-8?B?azkrMGNlUTZ3bkkyYmNMTHBJdWdYaWVRUzNNL3FocGxhcWZsQ01JVTRYYlFt?=
 =?utf-8?B?UEZsSXBPN092N2ExUjVETUJGTUdWNFA3ZXc1WW9RTHNPcWIrWWRUazZOWEV2?=
 =?utf-8?B?ampzbnlRVDZHYUo0NFZvRkZ1MmhXYVVwYTZxTW90WFQzUFFjR2V4Qk82S0dy?=
 =?utf-8?B?Uy9lcHRVdkpCZXR0Qnh6clRlZWxJUFlMNUlVNWJ3bkF0NDM2VktZM2UvVXBj?=
 =?utf-8?Q?MBWq3pCGaFUkU3IMOJuo7NVx652aZ4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?endoSDhTWkRNWnhxRks0SmQ2djBFNHNxQlpxQ0loZG9MMGlkbk02a3FhZG5w?=
 =?utf-8?B?VklrbFViV0hvM3YyNkttb296S3JsbEE0dmVzc2xEOGtrR3RueW5LbkR1b09q?=
 =?utf-8?B?SzU5TzV6Si9GWmlPTkV5MGw0dHNOZHBsL0FwM3phdTNkd3RXYnRndjdGanBu?=
 =?utf-8?B?aGI5TXpCV0dRQzFabXU0MmhiaytsTENINlRpTlRESEhtRnFlOU9pdEx3TVV0?=
 =?utf-8?B?Mmptcjd5TG1ONUdsbjJrdlVHb28zdGNIdU5jakYxSWNlT0pDenlSc1RwSmhM?=
 =?utf-8?B?aXBPdndOQmNzd2wrTWtWWDgzT285TEtPTDkrL0NLbmJrME5nNnA5M2EvejI3?=
 =?utf-8?B?NFo0ZFJTSWl4SW9IWXFFelJUYW5JZ2Q4TGZSZ1JTSHYzTHl0TDBlN1JPQmUx?=
 =?utf-8?B?dWdGdGhleTd2Q2Zqemp4VFo4eTV5UFJNaW9FSVUycnYrVVpxdTdUUUdxQTgw?=
 =?utf-8?B?Nm1Tc0N4R3F2Y1h3dk5RYU1MTGowV2lWVFVrOVNGOEdPc29nZ084WUJmalU5?=
 =?utf-8?B?WUs0eVpvV0dVaGZ1L0JNa2EreEdVSEJzcW5DSVNIQ3hpQVhtZ05CQm1nQkIy?=
 =?utf-8?B?dHR5ckVEMTA1Y2kzeFBnOS9oTjh3S0FNOW5CZ3UvR0xiR0tydjJhejhiNnpj?=
 =?utf-8?B?UkhzNkVxakFSNHEwVjZIVE1pYTJXZ3JHZTY1alV3a01iWC9mZ29LUTFWdjE3?=
 =?utf-8?B?bXFFKzV6NTE5NjZzN2UrbGJmVkl2bVpaeXBzWnRUZTlIeUkrUXhocm9lTXox?=
 =?utf-8?B?dVl1SnRCM3FCRXp3L2Z3Z3Q1ZVE3SG9jV3Q5c28wakUxR3V5aU5zMFFyTVZO?=
 =?utf-8?B?NjRtcTgzOG5VaXovN3hYM3RhaXJ4YzVoMFdYc3NDN0Z4UjU4M2g2emhUZzVE?=
 =?utf-8?B?Zkljb09hRmVZVTRCemkvRVFnZ0VITnBKU3FtRDBUTTRDbUN4c0xzY3pzWUlR?=
 =?utf-8?B?dGdPb3crT2tocENGK0lmSTI0cXUvTVQ0cGhsR0c2Wlo4MG1IU2ZWTFNHNFVM?=
 =?utf-8?B?dzVHMmo4YS9SRXFyZFlqSlhwR2Myd1ZaZnpkd3RTWFlnOTJXdHN5Vk9kTzhP?=
 =?utf-8?B?dUhGY2cwcXo2MHJjcnRmZ1VkaXRXSFI5T3pzdHZxK0NTQkRBdVpYQTZTQWFH?=
 =?utf-8?B?Znh3TVRMYXp4VFdKWEdzZm8rb3h1ZzVUNGJOYk0vdTRDcGlpdEhBcGFLU25n?=
 =?utf-8?B?K1hBT3Q0dnZxR0ZNQmVwYStCMjRVWHBIajQxZHlXMk9FR0ozNzdMKzB5Qnhl?=
 =?utf-8?B?b1RTVkpsRDA3R2I1SkQrUlBzSFRpcHhjWDFwd3ErNkQ4MjN4aEhGUzE3T056?=
 =?utf-8?B?OVRNa0tIdUJHaHFHazlOcnNIYkQwWDRET1o2RHptYk5SUk16V1FMemdHQThF?=
 =?utf-8?B?VUYrbkNtOVdhM2krdVFDYlN4SWlBMXRBUzd0M01YWmJQVDErZVZRYVJwMzVw?=
 =?utf-8?B?WXlzVXFHOUVveDY4QlNmNzR1eUR0QVc3NFFJa1RWeHdPcFFpNVl6NGVxZnhM?=
 =?utf-8?B?UkxwSlhsc1oyekdXb1FOMGZFWFVPUkxsR1EwaWs4bzkxRzdtek1SM2dmQ1pm?=
 =?utf-8?B?Vy9QQVJDdWRwVTF3Yjc5NnlneTRYV1ljYWxBbmE0Y3Q4SjB5cVNSL1MyVnRu?=
 =?utf-8?B?T0lNeXY4Q3p3cXN0OGlzZTVsME9TQkNSYzhwVmtueVFGSm05MndmYkw1TURT?=
 =?utf-8?B?aENlaWVJd1FlQUlBTnlhUmZVeTFsenM5MXg0czZRZUhWRDJxcUs1clhTa2ht?=
 =?utf-8?B?aHVtWjA4bFhiK3EwT0VORTduTjRFdFlueE5ZMjFsM1E5SkxldEhTL1dYSTdM?=
 =?utf-8?B?L3pEVklsT1pHM2FScnNmUnIzY3c5azVRckJWbEw3aFoxbURqWmFMQTlaVVNQ?=
 =?utf-8?B?dWlJZm5SdXlabnVGTjFtQnhBSXJIbVZRa2FOOTAzbTFmZFNTZkVIcXBLeTBa?=
 =?utf-8?B?ZHlicnZMclRIYUxwVm4zOFArM0F6T1F5T2NpODdXc2NZQU11WVhNaUNOeFFx?=
 =?utf-8?B?dGxoelltMXloZHlTME5yV1VkNWFNVWJoWldOcWgzQ2tpZjhZN2tUU29NZnFN?=
 =?utf-8?B?STloSGJUNU1ldEdLK25GQVMzSGZISnRLaHJuc2lCZEVQQmVRc1dlQXp2dlR2?=
 =?utf-8?Q?JFLU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1caa168a-c174-46ec-691b-08ddbacbbcb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2025 07:23:56.3118
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e7BSrFvJuWOCKok4OeyFwiAtOrD8/M0GKUuJLXuXedA8hiQXDL6444yO19qZfgdMD2kqZDOLCYjX7qGyIkaoyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF6BCF148B6

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IEZyaWRheSwgSnVseSA0LCAyMDI1IDI6
MjEgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4NCj4gQ2M6IEh1
YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgQW5kcmV3IENvb3Blcg0KPiA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
PjsgeGVuLQ0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHY1IDEwLzE4XSB4ZW4vY3B1ZnJlcTogaW50cm9kdWNlIGEgbmV3IGFtZCBjcHBjIGRyaXZl
ciBmb3INCj4gY3B1ZnJlcSBzY2FsaW5nDQo+DQo+IE9uIDA0LjA3LjIwMjUgMDU6NDAsIFBlbm55
LCBaaGVuZyB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJv
bTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+PiBTZW50OiBXZWRuZXNkYXks
IEp1bHkgMiwgMjAyNSA2OjQ4IFBNDQo+ID4+DQo+ID4+IE9uIDAyLjA3LjIwMjUgMTE6NDksIFBl
bm55LCBaaGVuZyB3cm90ZToNCj4gPj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+
Pj4+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPj4+PiBTZW50OiBU
dWVzZGF5LCBKdW5lIDE3LCAyMDI1IDEyOjAwIEFNDQo+ID4+Pj4gVG86IFBlbm55LCBaaGVuZyA8
cGVubnkuemhlbmdAYW1kLmNvbT4NCj4gPj4+Pg0KPiA+Pj4+IE9uIDI3LjA1LjIwMjUgMTA6NDgs
IFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+Pj4+PiArc3RhdGljIGludCBjZl9jaGVjayBhbWRfY3Bw
Y19jcHVmcmVxX3RhcmdldChzdHJ1Y3QgY3B1ZnJlcV9wb2xpY3kgKnBvbGljeSwNCj4gPj4+Pj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50
IHRhcmdldF9mcmVxLA0KPiA+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB1bnNpZ25lZCBpbnQgcmVsYXRpb24pIHsNCj4gPj4+Pj4gKyAgICB1bnNpZ25l
ZCBpbnQgY3B1ID0gcG9saWN5LT5jcHU7DQo+ID4+Pj4+ICsgICAgY29uc3Qgc3RydWN0IGFtZF9j
cHBjX2Rydl9kYXRhICpkYXRhID0NCj4gPj4+Pj4gK3Blcl9jcHUoYW1kX2NwcGNfZHJ2X2RhdGEs
DQo+ID4+IGNwdSk7DQo+ID4+Pj4+ICsgICAgdWludDhfdCBkZXNfcGVyZjsNCj4gPj4+Pj4gKyAg
ICBpbnQgcmVzOw0KPiA+Pj4+PiArDQo+ID4+Pj4+ICsgICAgaWYgKCB1bmxpa2VseSghdGFyZ2V0
X2ZyZXEpICkNCj4gPj4+Pj4gKyAgICAgICAgcmV0dXJuIDA7DQo+ID4+Pj4+ICsNCj4gPj4+Pj4g
KyAgICByZXMgPSBhbWRfY3BwY19raHpfdG9fcGVyZihkYXRhLCB0YXJnZXRfZnJlcSwgJmRlc19w
ZXJmKTsNCj4gPj4+Pj4gKyAgICBpZiAoIHJlcyApDQo+ID4+Pj4+ICsgICAgICAgIHJldHVybiBy
ZXM7DQo+ID4+Pj4+ICsNCj4gPj4+Pj4gKyAgICAvKg0KPiA+Pj4+PiArICAgICAqIFNldHRpbmcg
d2l0aCAibG93ZXN0X25vbmxpbmVhcl9wZXJmIiB0byBlbnN1cmUgZ292ZXJub3JpbmcNCj4gPj4+
Pj4gKyAgICAgKiBwZXJmb3JtYW5jZSBpbiBQLXN0YXRlIHJhbmdlLg0KPiA+Pj4+PiArICAgICAq
Lw0KPiA+Pj4+PiArICAgIGFtZF9jcHBjX3dyaXRlX3JlcXVlc3QocG9saWN5LT5jcHUsIGRhdGEt
DQo+ID5jYXBzLmxvd2VzdF9ub25saW5lYXJfcGVyZiwNCj4gPj4+Pj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGRlc19wZXJmLCBkYXRhLT5jYXBzLmhpZ2hlc3RfcGVyZik7DQo+ID4+Pj4N
Cj4gPj4+PiBJIGZlYXIgSSBkb24ndCB1bmRlcnN0YW5kIHRoZSBjb21tZW50LCBhbmQgaGVuY2Ug
aXQgcmVtYWlucyB1bmNsZWFyDQo+ID4+Pj4gdG8gbWUgd2h5IGxvd2VzdF9ub25saW5lYXJfcGVy
ZiBpcyBiZWluZyB1c2VkIGhlcmUuDQo+ID4+Pg0KPiA+Pj4gSG93IGFib3V0DQo+ID4+PiBgYGAN
Cj4gPj4+IENob29zZSBsb3dlc3Qgbm9ubGluZWFyIHBlcmZvcm1hbmNlIGFzIHRoZSBtaW5pbXVt
IHBlcmZvcm1hbmNlIGxldmVsDQo+ID4+PiBhdCB3aGljaA0KPiA+PiB0aGUgcGxhdGZvcm0gbWF5
IHJ1bi4NCj4gPj4+IExvd2VzdCBub25saW5lYXIgcGVyZm9ybWFuY2UgaXMgdGhlIGxvd2VzdCBw
ZXJmb3JtYW5jZSBsZXZlbCBhdA0KPiA+Pj4gd2hpY2ggbm9ubGluZWFyIHBvd2VyIHNhdmluZ3Mg
YXJlIGFjaGlldmVkLCBBYm92ZSB0aGlzIHRocmVzaG9sZCwNCj4gPj4+IGxvd2VyIHBlcmZvcm1h
bmNlDQo+ID4+IGxldmVscyBzaG91bGQgYmUgZ2VuZXJhbGx5IG1vcmUgZW5lcmd5IGVmZmljaWVu
dCB0aGFuIGhpZ2hlciBwZXJmb3JtYW5jZSBsZXZlbHMuDQo+ID4+PiBgYGANCj4gPj4NCj4gPj4g
SSBmaW5hbGx5IGhhZCB0byBnbyB0byB0aGUgQUNQSSBzcGVjIHRvIHVuZGVyc3RhbmQgd2hhdCB0
aGlzIGlzDQo+ID4+IGFib3V0LiBUaGVyZSBsb29rcyB0byBiZSBhbiBpbXBsaWNhdGlvbiB0aGF0
IGxvd2VzdCA8PQ0KPiA+PiBsb3dlc3Rfbm9ubGluZWFyLCBhbmQgc3RhdGVzIGluIHRoYXQgcmFu
Z2Ugd291bGQgY29ycmVzcG9uZCBtb3JlIHRvDQo+ID4+IFQtc3RhdGVzIHRoYW4gdG8gUC1zdGF0
ZXMuIFdpdGggdGhhdCBJIHRoaW5rIEkgYWdyZWUgd2l0aCB0aGUgdXNlDQo+ID4NCj4gPiBZZXMs
IEl0IGRvZXNuJ3QgaGF2ZSBkZWZpbml0aXZlIGNvbmNsdXNpb24gYWJvdXQgcmVsYXRpb24gYmV0
d2Vlbg0KPiA+IGxvd2VzdCBhbmQgbG93ZXN0X25vbmxpbmVhciBJbiBvdXIgaW50ZXJuYWwgRlcg
ZGVzaWduZWQgc3BlYywgaXQNCj4gPiBhbHdheXMgc2hvd3MgbG93ZXN0X25vbmxpbmVhciBjb3Jy
ZXNwb25kcyB0byBQMg0KPiA+DQo+ID4+IG9mIGxvd2VzdF9ub25saW5lYXIgaGVyZS4gVGhlIGNv
bW1lbnQsIGhvd2V2ZXIsIGNvdWxkIGRvIHdpdGggbW92aW5nDQo+ID4+IGZhcnRoZXIgYXdheSBm
cm9tIG1lcmVseSBxdW90aW5nIHRoZSBwcmV0dHkgYWJzdHJhY3QgdGV4dCBpbiB0aGUgQUNQSQ0K
PiA+PiBzcGVjLCBhcyBzdWNoIHF1b3RpbmcgZG9lc24ndCBoZWxwIGluIGNsYXJpZnlpbmcgdGVy
bWlub2xvZ3kgdXNlZCwNCj4gPj4gd2hlbiB0aGF0IHRlcm1pbm9sb2d5IGFsc28gaXNuJ3QgZXhw
bGFpbmVkIGFueXdoZXJlIGVsc2UgaW4gdGhlIGNvZGUgYmFzZS4NCj4gPg0KPiA+DQo+ID4gSG93
IGFib3V0IHdlIGFkZCBkZXRhaWxlZCBleHBsYW5hdGlvbnMgYWJvdXQgZWFjaCB0ZXJtaW5vbG9n
eSBpbiB0aGUNCj4gPiBiZWdpbm5pbmcgZGVjbGFyYXRpb24gLCBzZWU6DQo+ID4gYGBgDQo+ID4g
Ky8qDQo+ID4gKyAqIEZpZWxkIGhpZ2hlc3RfcGVyZiwgbm9taW5hbF9wZXJmLCBsb3dlc3Rfbm9u
bGluZWFyX3BlcmYsIGFuZA0KPiA+ICtsb3dlc3RfcGVyZg0KPiA+ICsgKiBjb250YWluIHRoZSB2
YWx1ZXMgcmVhZCBmcm9tIENQUEMgY2FwYWJpbGl0eSBNU1IuDQo+ID4gKyAqIEZpZWxkIGhpZ2hl
c3RfcGVyZiByZXByZXNlbnRzIGhpZ2hlc3QgcGVyZm9ybWFuY2UsIHdoaWNoIGlzIHRoZQ0KPiA+
ICthYnNvbHV0ZQ0KPiA+ICsgKiBtYXhpbXVtIHBlcmZvcm1hbmNlIGFuIGluZGl2aWR1YWwgcHJv
Y2Vzc29yIG1heSByZWFjaCwgYXNzdW1pbmcNCj4gPiAraWRlYWwNCj4gPiArICogY29uZGl0aW9u
cw0KPiA+ICsgKiBGaWVsZCBub21pbmFsX3BlcmYgcmVwcmVzZW50cyBtYXhpbXVtIHN1c3RhaW5l
ZCBwZXJmb3JtYW5jZSBsZXZlbA0KPiA+ICtvZiB0aGUNCj4gPiArICogcHJvY2Vzc29yLCBhc3N1
bWluZyBpZGVhbCBvcGVyYXRpbmcgY29uZGl0aW9ucy4NCj4gPiArICogRmllbGQgbG93ZXN0X25v
bmxpbmVhcl9wZXJmIHJlcHJlc2VudHMgTG93ZXN0IE5vbmxpbmVhcg0KPiA+ICtQZXJmb3JtYW5j
ZSwgd2hpY2gNCj4gPiArICogaXMgdGhlIGxvd2VzdCBwZXJmb3JtYW5jZSBsZXZlbCBhdCB3aGlj
aCBub25saW5lYXIgcG93ZXIgc2F2aW5ncw0KPiA+ICthcmUNCj4gPiArICogYWNoaWV2ZWQuIEFi
b3ZlIHRoaXMgdGhyZXNob2xkLCBsb3dlciBwZXJmb3JtYW5jZSBsZXZlbHMgc2hvdWxkIGJlDQo+
ID4gKyAqIGdlbmVyYWxseSBtb3JlIGVuZXJneSBlZmZpY2llbnQgdGhhbiBoaWdoZXIgcGVyZm9y
bWFuY2UgbGV2ZWxzLg0KPg0KPiBXaGljaCBpcyBzdGlsbCBvbmx5IHRoZSB2YWd1ZSBzdGF0ZW1l
bnQgYWxzbyBmb3VuZCBpbiB0aGUgc3BlYy4gVGhpcyBzYXlzIG5vdGhpbmcNCj4gYWJvdXQgd2hh
dCBoYXBwZW5zIGJlbG93IHRoYXQgbGV2ZWwsIG9yIHdoYXQgdGhlIHJlbGF0aW9uc2hpcCB0byBv
dGhlciBmaWVsZHMgaXMuDQo+DQo+ID4gKyAqIEZpZWxkIGxvd2VzdF9wZXJmIHJlcHJlc2VudHMg
dGhlIGFic29sdXRlIGxvd2VzdCBwZXJmb3JtYW5jZSBsZXZlbA0KPiA+ICtvZiB0aGUNCj4gPiAr
ICogcGxhdGZvcm0uDQo+ID4gKyAqDQo+ID4gKyAqIEZpZWxkIG1heF9wZXJmLCBtaW5fcGVyZiwg
ZGVzX3BlcmYgc3RvcmUgdGhlIHZhbHVlcyBmb3IgQ1BQQyByZXF1ZXN0IE1TUi4NCj4gPiArICog
RmllbGQgbWF4X3BlcmYgY29udmV5cyB0aGUgbWF4aW11bSBwZXJmb3JtYW5jZSBsZXZlbCBhdCB3
aGljaCB0aGUNCj4gPiArcGxhdGZvcm0NCj4gPiArICogbWF5IHJ1bi4gQW5kIGl0IG1heSBiZSBz
ZXQgdG8gYW55IHBlcmZvcm1hbmNlIHZhbHVlIGluIHRoZSByYW5nZQ0KPiA+ICsgKiBbbG93ZXN0
X3BlcmYsIGhpZ2hlc3RfcGVyZl0sIGluY2x1c2l2ZS4NCj4gPiArICogRmllbGQgbWluX3BlcmYg
Y29udmV5cyB0aGUgbWluaW11bSBwZXJmb3JtYW5jZSBsZXZlbCBhdCB3aGljaCB0aGUNCj4gPiAr
cGxhdGZvcm0NCj4gPiArICogbWF5IHJ1bi4gQW5kIGl0IG1heSBiZSBzZXQgdG8gYW55IHBlcmZv
cm1hbmNlIHZhbHVlIGluIHRoZSByYW5nZQ0KPiA+ICsgKiBbbG93ZXN0X3BlcmYsIGhpZ2hlc3Rf
cGVyZl0sIGluY2x1c2l2ZSBidXQgbXVzdCBiZSBsZXNzIHRoYW4gb3INCj4gPiArZXF1YWwgdG8N
Cj4gPiArICogbWF4X3BlcmYuDQo+ID4gKyAqIEZpZWxkIGRlc19wZXJmIGNvbnZleXMgcGVyZm9y
bWFuY2UgbGV2ZWwgWGVuIGlzIHJlcXVlc3RpbmcuIEFuZCBpdA0KPiA+ICttYXkgYmUNCj4gPiAr
ICogc2V0IHRvIGFueSBwZXJmb3JtYW5jZSB2YWx1ZSBpbiB0aGUgcmFuZ2UgW21pbl9wZXJmLCBt
YXhfcGVyZl0sIGluY2x1c2l2ZS4NCj4gPiArICovDQo+ID4gK3N0cnVjdCBhbWRfY3BwY19kcnZf
ZGF0YQ0KPiA+ICt7DQo+ID4gKyAgICBjb25zdCBzdHJ1Y3QgeGVuX3Byb2Nlc3Nvcl9jcHBjICpj
cHBjX2RhdGE7DQo+ID4gKyAgICB1bmlvbiB7DQo+ID4gKyAgICAgICAgdWludDY0X3QgcmF3Ow0K
PiA+ICsgICAgICAgIHN0cnVjdCB7DQo+ID4gKyAgICAgICAgICAgIHVuc2lnbmVkIGludCBsb3dl
c3RfcGVyZjo4Ow0KPiA+ICsgICAgICAgICAgICB1bnNpZ25lZCBpbnQgbG93ZXN0X25vbmxpbmVh
cl9wZXJmOjg7DQo+ID4gKyAgICAgICAgICAgIHVuc2lnbmVkIGludCBub21pbmFsX3BlcmY6ODsN
Cj4gPiArICAgICAgICAgICAgdW5zaWduZWQgaW50IGhpZ2hlc3RfcGVyZjo4Ow0KPiA+ICsgICAg
ICAgICAgICB1bnNpZ25lZCBpbnQgOjMyOw0KPiA+ICsgICAgICAgIH07DQo+ID4gKyAgICB9IGNh
cHM7DQo+ID4gKyAgICB1bmlvbiB7DQo+ID4gKyAgICAgICAgdWludDY0X3QgcmF3Ow0KPiA+ICsg
ICAgICAgIHN0cnVjdCB7DQo+ID4gKyAgICAgICAgICAgIHVuc2lnbmVkIGludCBtYXhfcGVyZjo4
Ow0KPiA+ICsgICAgICAgICAgICB1bnNpZ25lZCBpbnQgbWluX3BlcmY6ODsNCj4gPiArICAgICAg
ICAgICAgdW5zaWduZWQgaW50IGRlc19wZXJmOjg7DQo+ID4gKyAgICAgICAgICAgIHVuc2lnbmVk
IGludCBlcHA6ODsNCj4gPiArICAgICAgICAgICAgdW5zaWduZWQgaW50IDozMjsNCj4gPiArICAg
ICAgICB9Ow0KPiA+ICsgICAgfSByZXE7DQo+ID4gKw0KPiA+ICsgICAgaW50IGVycjsNCj4gPiAr
fTsNCj4gPiBgYA0KPiA+IFRoZW4gaGVyZSwgd2UgY291bGQgZWxhYm9yYXRlIHRoZSByZWFzb24g
d2h5IHdlIGNob29zZSBsb3dlc3Rfbm9ubGluZWFyX3BlcmYNCj4gb3ZlciBsb3dlc3RfcGVyZjoN
Cj4gPiBgYGANCj4gPiArICAgIC8qDQo+ID4gKyAgICAgKiBIYXZpbmcgYSBwZXJmb3JtYW5jZSBs
ZXZlbCBsb3dlciB0aGFuIHRoZSBsb3dlc3Qgbm9ubGluZWFyDQo+ID4gKyAgICAgKiBwZXJmb3Jt
YW5jZSBsZXZlbCwgc3VjaCBhcywgbG93ZXN0X3BlcmYgPD0gcGVyZiA8PSBsb3dlc3Rfbm9ubGlu
ZXJfcGVyZiwNCj4gPiArICAgICAqIG1heSBhY3R1YWxseSBjYXVzZSBhbiBlZmZpY2llbmN5IHBl
bmFsdHksIFNvIHdoZW4gZGVjaWRpbmcgdGhlIG1pbl9wZXJmDQo+ID4gKyAgICAgKiB2YWx1ZSwg
d2UgcHJlZmVyIGxvd2VzdCBub25saW5lYXIgcGVyZm9ybWFuY2Ugb3ZlciBsb3dlc3QgcGVyZm9y
bWFuY2UNCj4gPiArICAgICAqLw0KPiA+ICsgICAgYW1kX2NwcGNfd3JpdGVfcmVxdWVzdChwb2xp
Y3ktPmNwdSwgZGF0YS0+Y2Fwcy5sb3dlc3Rfbm9ubGluZWFyX3BlcmYsDQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGRlc19wZXJmLCBkYXRhLT5jYXBzLmhpZ2hlc3RfcGVyZik7DQo+
ID4gYGBgDQo+DQo+IFRoaXMgcmVhZHMgZmluZSB0byBtZS4NCj4NCj4gUXVlc3Rpb24gdGhlbiBp
cyB0aG91Z2g6IElzIHNldHRpbmcgbG93ZXN0X3BlcmYgYXMgdGhlIGxvdyBib3VuZGFyeSBhIGdv
b2QgaWRlYSBpbg0KPiBhbnkgb2YgdGhlIHBsYWNlcz8gKElpcmMgaXQgaXMgdXNlZCBpbiBvbmUg
b3IgdHdvIHBsYWNlcy4gT3IgYW0gSQ0KPiBtaXNyZW1lbWJlcmluZz8pDQoNClllcywgaW4gYWN0
aXZlIG1vZGUsIEkgY2hvb3NlIGxvd2VzdF9wZXJmIGFzIG1pbl9wZXJmIHRvIHRyeSB0byBleHRl
bmQgdGhlIGxpbWl0YXRpb24gZm9yIGFjdGl2ZShhdXRvbm9tb3VzKSBtb2RlDQpNYXliZSBpdCBp
cyBub3QgYSBnb29kIGNob2ljZS4gTWF5YmUgY3B1ZnJlcSBkcml2ZXIgaXMgbGltaXRlZCB0byBk
byBwZXJmb3JtYW5jZSB0dW5pbmcgaW4gUC1zdGF0ZXMgcmFuZ2UuDQoNCj4NCj4gSmFuDQo=

