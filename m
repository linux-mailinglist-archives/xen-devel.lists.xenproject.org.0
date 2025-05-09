Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D99AB09DF
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 07:46:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979782.1366285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDGYp-0002I8-FP; Fri, 09 May 2025 05:46:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979782.1366285; Fri, 09 May 2025 05:46:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDGYp-0002F0-Bl; Fri, 09 May 2025 05:46:15 +0000
Received: by outflank-mailman (input) for mailman id 979782;
 Fri, 09 May 2025 05:46:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=60h2=XZ=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uDGYn-0002Eu-VS
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 05:46:13 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20610.outbound.protection.outlook.com
 [2a01:111:f403:2408::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e49092f5-2c98-11f0-9ffb-bf95429c2676;
 Fri, 09 May 2025 07:46:03 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by IA0PPF6483BC7EA.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bcf) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Fri, 9 May
 2025 05:45:59 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 05:45:58 +0000
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
X-Inumbo-ID: e49092f5-2c98-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OXk0u0ay5sDz6sZ1BKGXFldl2JJGTaU408hF6g8Zgcx3UK4NBtUYlzuB+GZPHm1oWtI17HDRUCey6msvWKTzBWEoGi4oaGXmXqFR1krhx/a8LZFVIB7eKk+zEZsBOrDjcErbGnJcjIbDXbHrmhkp4uck8mvygmYtUOQzuiuR3vNBJ1AwkuyK17HAOsc38HswOt/qkUTQj2CPCdq3wASyjuk4wG8Pfjf1VdOFGbnxij+bwJ7jYPbzzBXMVAI9/TZu4n6fSeOlfvnrp7dt64b3f8F3tqyeAFdvgbvZBm+l2QvLLXI0qsVh377Rxdi1iR1ISkgUZRGJcjstKEu4acGXTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k0eJs5DZ88QhJuWTTVWXJg24qGD9FWw4Jq+krkdRndQ=;
 b=UnFLIXUONlV1797qyFN9VPof3bVRKY21Xx92MSnGIlNEmPMlY5UXy/2cs1WUTIC4dJE7tadM7ovumQDLYHkVbb0N9hWtmMde7uDSlxzd17QC9BouqadlYCMdgsme6vi/GvM6q0iI3RayzpVFjQaEEn5pqi2AB9/gp/UNAHMENW5M99xJEmtmO11yin7rLrI2FdTyHWGERKg295Xpq2Yk0VM8ng2tYPhgXA+yqIAhs7b0EbkCNTAJxEnX6orNApczwdfVic9zNbCNtDZ346uhInjqU9XjtODK7GG/yIB1RNt/tAH0R5pQYDyKSnDS/nlnnv7Sue5e5ER5iCb7SX1pTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0eJs5DZ88QhJuWTTVWXJg24qGD9FWw4Jq+krkdRndQ=;
 b=YKcne18Eh5wvWHvfu9lsjGojO+WkrCKecJk8OYZoAUFj9lyrXwtT/1PQO7F/LxEgmwAimuJ4nNYOqpWMOoJLz/e1NjQ1rajvr6OBbmcF93tdDih/D4NTf4a+/Cu5C5DY+i6EGyMoEvYYss8r4s1sW5HQXNiX+rut1as5cKkjWVE=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v3 11/11] vpci/msix: Add function to clean MSIX resources
Thread-Topic: [PATCH v3 11/11] vpci/msix: Add function to clean MSIX resources
Thread-Index: AQHbsoVgBiJKDhaKgU2icFKPtN29BrPInAgAgAHPIQA=
Date: Fri, 9 May 2025 05:45:58 +0000
Message-ID:
 <BL1PR12MB58491B3DAA9ADBD29203A757E78AA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
 <20250421061903.1542652-12-Jiqian.Chen@amd.com>
 <aByBmNc8s2yZigZZ@macbook.lan>
In-Reply-To: <aByBmNc8s2yZigZZ@macbook.lan>
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
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|IA0PPF6483BC7EA:EE_
x-ms-office365-filtering-correlation-id: a3d30d42-d381-42cf-7d93-08dd8ebcc656
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eHhMRm4wUUpnNkxEcytRTGZaZGNyK2ZXbG5zRndaWUYyZXpTL280Tk1YczVW?=
 =?utf-8?B?aEg2RTZDenc0YzBjTFdGQW5HVnRKVkxPN1FiZ2R0aFM1MWk5WVhmTWoyOG9J?=
 =?utf-8?B?VVErNmxNWWFKT2tkejloL25oY3czRUhFTmI4ZldUSisvZXVySUExSmNHalBo?=
 =?utf-8?B?QzBVY01aeXhxRERJTk1OS2p5ZVVTVHc2Z2pxZ3pGeFVKOUVwRHJzWEM2UGc2?=
 =?utf-8?B?NjVVb2lNa2piakdZTEdkY3VjSFVwT3RiQzJIS3dJTEVBeTcxZHc1S2ZVZFpo?=
 =?utf-8?B?Y3JhbDJ1WS9PWTRTekRHNDA1VjY3TFlhMUZJTTg5SC90d3BQc2d3N09Jd3hm?=
 =?utf-8?B?alMwU0tDM1VBRmNOOXc3SnNnQWhuWnNUZFV0Y3NWcDdXWmFaT29hNHROUjlo?=
 =?utf-8?B?UXlEMkFSUFg0amtJbDNlbDFIV2FuL1RvNmx6RldoK0orcE03citFMmhNWWwy?=
 =?utf-8?B?b0dWRFY1QmlJSFllZjNDL3htSGQxNzEraXZRMFlRNWdTTEtvWXV0TjlUMGtC?=
 =?utf-8?B?VEkraWJyanFEVnkxckZOOEtnSkNmMi8yTmRnZjZZVGVmdUpiaG1LZHN3L0dO?=
 =?utf-8?B?b0kzdzVqMGdJeTgrd0JQZ29kdVJ3YzRDR3JLckg0ckErUW5oc0p5WExIdDFM?=
 =?utf-8?B?SSt1bVJHUHJTZHVCZGUzZnVnZ1FzYjNBbmJOVGtMQnVncDB4SWNUY3pucUxB?=
 =?utf-8?B?bDVlOTVzMDVtM2NuTlBENGgxUHJXZ3Y2TFBuNk8yWGk0TnQ2U2FaQXZIZkoy?=
 =?utf-8?B?SmxrN21HVXVLQnl3RGxNQVlqVVBxWjJoWXRKSGdwVUVBSDVjd0MrekM4Smtr?=
 =?utf-8?B?Z3pBTElhR3JEYTFQN1k3cUlWMzhNVGJCRkQ5MkhWSU4vZHQyeUpvdWxxZyth?=
 =?utf-8?B?NjV3UFpYUGdQT1N3bXF3SlVibkVlZVJmZFo2ZWtkTVkzNUR6U2M4N2JzSCs1?=
 =?utf-8?B?L3hFdmlQVy91d2w0WjF2WlA4UmlqTUNwamtHckw1Z0N4ZENPM2Y2ck85R3M0?=
 =?utf-8?B?TTZxYnE4ZlhtTmhOcXcxTlFsU2xNSXdWcjV1eVY5djRBeWFIbWp5WGJ3Q1NB?=
 =?utf-8?B?czdEK2M1elFmdlpmNU9BS3RQY1p6bG9JR3FGZjJUVDBJenphVEZsUDFHem5l?=
 =?utf-8?B?Rkd3V01semlkbnhWVTFXUnRpamV6U2MxWDF4S1FJWlFkZnJBaGdxNnJkMWZm?=
 =?utf-8?B?YUl3ZWtmaTY2NEtqSVYydGFRM2RkZHAwVVIxY3hOK045SnBNZkd0ZkFCZVM1?=
 =?utf-8?B?UzhKRE1jYTdPRkJRN3hIOGRjNHo3aTBDcklJVDdRR21CcFhhYmVwQzl4em1Q?=
 =?utf-8?B?M2NrMEYzVUlBYkNIQ0FRUTBoSDJSaTRGSlFoczRCYlJtaGdrSml6eE5oYi9G?=
 =?utf-8?B?enJiS01hUGN0RHhXeEdaT05YNENhV09WTUlCTG8rRDJ6Y2xWcDBwV01YNVhF?=
 =?utf-8?B?UEk3WkJIeGVLQVhWNDJPMHpKcWEzenBuTnoyamtVZnVsc0FlbVgwZHFqYS9r?=
 =?utf-8?B?SU0wT2FMV2VsbVhvOXlWckVxVUczVzNVYXFCTDZkNmhEYnk1bk1LTTUzUG1p?=
 =?utf-8?B?clVLVXQzL2V5K1I1emZHNG4wWWM0RnVYRThLYmVJWFNoZGt0ME10MTI4cGxD?=
 =?utf-8?B?QmxVUlpuekxTREo0a0pXWHRXR0dZK1VuaDc3VXI0VzEwcThZd1kvNmRibFBG?=
 =?utf-8?B?UUcwYTJVRUdNU1o1Tmc4b1Z6OEI3Tkg5VnhSV1hXWUFIM085MnpOSUVnRnU2?=
 =?utf-8?B?Z1lvM29QaFk5ZVFaNGZ0allzcWFvRUVrWEpVZ1gwZUQ4cFFWellHcDhVLzA5?=
 =?utf-8?B?UDVNT0hCc05yQU9BMHErYnZSSFhHLy9IbXUxdUVLb0Z2TnM3SkYrVEtCdW9O?=
 =?utf-8?B?VU1mQWorNUFxc29nRVB0b2MyZlRrZC9wMWRqZ1dvVTVNSmNzZ3c4R0Rka1dS?=
 =?utf-8?B?RGdGTmVCSm5jRjV1M1J3L0dWakg3aFJOejVKU3J5dEtTNDZ3REVwNStuVngr?=
 =?utf-8?Q?6HCdbvLu7zE0vmGy6vziu7D/nb3w6s=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bStldS8yU0g3blBKWFJ1VzU4THQ5anVCNGtHTGFLVmdlbmpyajk5bEZNNkJ0?=
 =?utf-8?B?aGwzbUlBRHEvUzkrWlBZbHhlaXpFdjhZSldEVENVeWxHOUkvWklVdzNjeXo5?=
 =?utf-8?B?cjRLMGFOVlE1cFlORXpXNXgwZGRtMW01WUVvRkJjZXRYSkZCTnBpRkMrLzVX?=
 =?utf-8?B?aDk0eU5LaXVNTUlvU25LNjRrNkpaK0R1cytuVExycGZkQk9mTDZ1OElGOVdJ?=
 =?utf-8?B?V2YwSVZmY2FNTHdqcnduUldxelliSzFaUm5zMGtKUVVoQUZkSjkvNm1zK3ly?=
 =?utf-8?B?QjZHY05oNGt3VkdzdUFCTlRTYTE1SDN6VmFVNXBGT1lnZkwzem0wRGhBQU9r?=
 =?utf-8?B?MDR3QjFDa0lMOUp0b2kzMFRVeEk5L3p5bDJQMVhRVUF3ZDFMcU1CSnZtclFn?=
 =?utf-8?B?bG0zQ3ZZcTZRRmVReStSTkF6YW9HZkhxSGhuaEVTN210Unl0NnhscVJnNng1?=
 =?utf-8?B?bGFIMGYybC82S2ZmZE9zanhmSFMvZk16aWdwSTd3L0psb0pmLytYeU9NNzNu?=
 =?utf-8?B?SlgzRVVhU2RUYS9iZ1BwQXVTSHVtbTVXSjRBaVVQeTdQdnRpRk1wckZYdlJM?=
 =?utf-8?B?djdkMTBhUy9hTmJPUkQyZHZGTE5DRlZLTzNiUlN1NUl5ZjZiaktBVEVmODlZ?=
 =?utf-8?B?MFpPMjJoaW1oNWFwbExWc29jYktZcndVOVZzY3EvM0RLbUlLWWgxUTdXM0Zt?=
 =?utf-8?B?ZkljWUdOb2VMRTlYTWZ6azZLRnl5ZFpydWNiK1Z6dkZDaUFzNUhNa0duMmJU?=
 =?utf-8?B?a1lzWWQ1VzRuQURYRkJhakN6RkFvSU1FbnpSRURMNWwvejhiaEhHWmp2ZEdN?=
 =?utf-8?B?ZWlmMWFPa1VrcklMYUlkNGplSVJWNjdFUGtJbDVRKzB4ODlMRElZZ25PU3VB?=
 =?utf-8?B?d05UVThJUVQxczhJOUNyb1g5RzN6eEdNaHVCZXk2L1FvQ0pEb0VSUGRPOTh0?=
 =?utf-8?B?T1BBS2x3NXExOVM1QkREbDdoK3NIQ1NtOGMzMUVZQ241RVY2bVVtdUYxQXJ1?=
 =?utf-8?B?OURwMXZZQVJTMU1ORTZlUThyNXRNa0Ntc1JPRThua1ZGaktMTlhhZVpUcmx0?=
 =?utf-8?B?TDZ6YURlL2RNc2NUWnZDSjZrb1hYMWdIM2RxQTV0aTZTRmJQWGdGc2dxWjZO?=
 =?utf-8?B?c3BPSUtQNWI1UEZLQ2JOUm1VV2hqQnZUaEkyc1VERGtYbUhpVVpvZHRqdXpq?=
 =?utf-8?B?YUFZUjZsVTROaFJ0ZUkwWkNSdDM5WEhreWVJK2hzZ2lSU2o4KzR0N0xPallL?=
 =?utf-8?B?b1lCY3VyNmYzaEMrTG5hRSswQVJzQk44OVZQdFFJVy8wTkVFeE5QZW5KN0Yy?=
 =?utf-8?B?SWg3NUc3bnM1MFcrQ0E1YjhzcUVWejBmVkpVaktaVEdQTWtMVCtubWpjVEda?=
 =?utf-8?B?S1kvMnc0Wkw1Q1hzRy9yN2x0bzlXNlpwVWQwR0pnVlk3aGF4dC9wN3lzUCtz?=
 =?utf-8?B?MmNnNnZWRlFOV2R4Y2lLcWNDb09POXhVLzVjK283V2RETlR1bitVTXVFK0JG?=
 =?utf-8?B?RkY2akVZSnA3aEVGbjJwUzdNelpYZXBhb3E4L0JQeGNjS04xRkNLMEp6YVpk?=
 =?utf-8?B?MEUvUStQdzhMazdBcC9vQ09EMm5uNXdOLys2SHZZZ0hveUx1WXNBQW5IaE9K?=
 =?utf-8?B?NzNDSVl0Nnp1UVJiOHpWdGdjWnpsbGx6eElRUndEcnpxWUdVYXJNZDk2SVBZ?=
 =?utf-8?B?Nm5aRkpHV211Q01IZEpZWDdZN0VZdDZ6K0szdXh0bE1EZHZkblJybnJ6NDV5?=
 =?utf-8?B?QjU2d3dFNXVHdFhNQUUxWFdkYlRMS0RHTGxicWJucDN1YnpSMVBhckY1aXVj?=
 =?utf-8?B?d2tySzZtbVlaTHpSMlRmTUFRd1haQkxFTk9GZ0tGMkFCcTdtdlFzMVFTMzFR?=
 =?utf-8?B?S2I3WlNYSmVMaTNERStNemhHOElSTTB4MXpwR2ZESGtzRkdoTTgzWEFFcnBJ?=
 =?utf-8?B?N1Q0cXlFbzc0RVY1NGxKVFZBZ2grQk1ZMFZGRG8zRUhoNE1yVE90dzkwQTlv?=
 =?utf-8?B?WWlxbUMybGlOWmpEU3JRWHBLWkpIei9pb00wOE5VeWQxRlBaLzd5MUt3Qyty?=
 =?utf-8?B?MVYxZXhTcnRKVDc5dDRiVnltSTArM3JpS2lSaUJhZGdEZEpDOWIrZ2t3bVJi?=
 =?utf-8?Q?0AJA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <01411F09E0568340BDAB9CCA473C70B3@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3d30d42-d381-42cf-7d93-08dd8ebcc656
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2025 05:45:58.8776
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XUqcQ0ZJlvOyWN/QgG+DsOJGz3YmF1ByNQNfQeVhM0efwQbkOUKuyrizWEMofqtdfpxeVKFn5WZpjJXxYIhxuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF6483BC7EA

T24gMjAyNS81LzggMTg6MDQsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIE1vbiwgQXBy
IDIxLCAyMDI1IGF0IDAyOjE5OjAzUE0gKzA4MDAsIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4gV2hl
biBpbml0X21zaXgoKSBmYWlscywgaXQgbmVlZHMgdG8gY2xlYW4gYWxsIE1TSVggcmVzb3VyY2Vz
Lg0KPj4gU28sIGFkZCBhIG5ldyBmdW5jdGlvbiB0byBkbyB0aGF0Lg0KPj4NCj4+IFNpZ25lZC1v
ZmYtYnk6IEppcWlhbiBDaGVuIDxKaXFpYW4uQ2hlbkBhbWQuY29tPg0KPj4gLS0tDQo+PiBjYzog
IlJvZ2VyIFBhdSBNb25uw6kiIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4+IC0tLQ0KPj4gdjIt
PnYzIGNoYW5nZXM6DQo+PiAqIFJlbW92ZSB1bm5lY2Vzc2FyeSBjbGVhbiBvcGVyYXRpb25zIGlu
IGZpbmlfbXNpeCgpLg0KPj4NCj4+IHYxLT52MiBjaGFuZ2VzOg0KPj4gbmV3IHBhdGNoLg0KPj4N
Cj4+IEJlc3QgcmVnYXJkcywNCj4+IEppcWlhbiBDaGVuLg0KPj4gLS0tDQo+PiAgeGVuL2RyaXZl
cnMvdnBjaS9tc2l4LmMgfCAyMSArKysrKysrKysrKysrKysrKysrKy0NCj4+ICAxIGZpbGUgY2hh
bmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4NCj4+IGRpZmYgLS1naXQg
YS94ZW4vZHJpdmVycy92cGNpL21zaXguYyBiL3hlbi9kcml2ZXJzL3ZwY2kvbXNpeC5jDQo+PiBp
bmRleCAwMjI4ZmZkOWZkYTkuLmUzMjJjMjYwZjZiYyAxMDA2NDQNCj4+IC0tLSBhL3hlbi9kcml2
ZXJzL3ZwY2kvbXNpeC5jDQo+PiArKysgYi94ZW4vZHJpdmVycy92cGNpL21zaXguYw0KPj4gQEAg
LTcwMyw2ICs3MDMsMjUgQEAgaW50IHZwY2lfbWFrZV9tc2l4X2hvbGUoY29uc3Qgc3RydWN0IHBj
aV9kZXYgKnBkZXYpDQo+PiAgICAgIHJldHVybiAwOw0KPj4gIH0NCj4+ICANCj4+ICtzdGF0aWMg
dm9pZCBmaW5pX21zaXgoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+PiArew0KPj4gKyAgICBzdHJ1
Y3QgdnBjaSAqdnBjaSA9IHBkZXYtPnZwY2k7DQo+PiArICAgIHVuc2lnbmVkIGludCBtc2l4X3Bv
cyA9IHBkZXYtPm1zaXhfcG9zOw0KPj4gKw0KPj4gKyAgICBpZiAoICFtc2l4X3BvcyB8fCAhdnBj
aS0+bXNpeCApDQo+IA0KPiBUaGF0J3Mgbm90IGZ1bGx5IGNvcnJlY3QgaGVyZS4gIFNlZSBob3cg
aW4gaW5pdF9tc2l4KCkgdnBjaS0+bXNpeCBpcw0KPiBzZXQgYXQgdGhlIHRhaWwgb2YgdGhlIGZ1
bmN0aW9uLCBhZnRlciBoYXZpbmcgYWRkZWQgdGhlIHJlZ2lzdGVyDQo+IGhhbmRsZXJzLg0KVGhh
bmtzISBZb3UgYXJlIG1vcmUgbWV0aWN1bG91cy4gSSBkaWRuJ3Qgbm90aWNlIHRoYXQuDQpXaWxs
IGNoYW5nZSBpbiBuZXh0IHZlcnNpb24uDQoNCj4gDQo+IEkgdGhpbmsgeW91IGluc3RlYWQgd2Fu
dDoNCj4gDQo+IGlmICggIW1zaXhfcG9zICkNCj4gICAgIHJldHVybjsNCj4gDQo+IHZwY2lfcmVt
b3ZlX3JlZ2lzdGVycyh2cGNpLCBtc2l4X2NvbnRyb2xfcmVnKG1zaXhfcG9zKSwgMik7DQo+IA0K
PiBpZiAoICEodnBjaS0+bXNpeCApDQo+ICAgICByZXR1cm47DQo+IA0KPiBsaXN0X2RlbCgmdnBj
aS0+bXNpeC0+bmV4dCk7DQo+IC4uLg0KPiANCj4+ICsgICAgICAgIHJldHVybjsNCj4+ICsNCj4+
ICsgICAgbGlzdF9kZWwoJnZwY2ktPm1zaXgtPm5leHQpOw0KPj4gKw0KPj4gKyAgICBmb3IgKCB1
bnNpZ25lZCBpbnQgaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHZwY2ktPm1zaXgtPnRhYmxlKTsgaSsr
ICkNCj4+ICsgICAgICAgIGlmICggdnBjaS0+bXNpeC0+dGFibGVbaV0gKQ0KPj4gKyAgICAgICAg
ICAgIGlvdW5tYXAodnBjaS0+bXNpeC0+dGFibGVbaV0pOw0KPj4gKw0KPiANCj4gU2luY2UgeW91
IGhhdmUgYWRkZWQgdG8gYWxsIHByZXZpb3VzIGNsZWFudXAgZnVuY3Rpb25zLCBkbyB5b3UgYWxz
bw0KPiBuZWVkIGEgY29tbWVudCBoZXJlIHRvIG1lbnRpb24gdGhlIGNhcGFiaWxpdHkgaGVhZGVy
IGlzIG5vdCBoYW5kbGVkPw0KPiANCj4gVEJIIEknbSBub3Qgc3VyZSB3aGV0aGVyIHRoYXQncyBy
ZWxldmFudCBpbiB0aGUgY29udGV4dCBoZXJlIChhbmQNCj4gb3RoZXIgY2xlYW51cCBmdW5jdGlv
bnMpLCBhcyB0aGUgY2FwYWJpbGl0eSBoZWFkZXIgdHJhcHMgYXJlIG5vdCBhZGRlZA0KPiBieSB0
aGUgUkVHSVNURVJfVlBDSV97TEVHQUNZLEVYVEVOREVEfV9DQVAoKSBpbml0IGhvb2tzIGVpdGhl
ciwgc28gaXQNCj4gd291bGQgc2VlbSBhc3ltbWV0cmljIGZvciB0aGUgY2xlYW51cCBob29rIHRv
IGF0dGVtcHQgdG8gcmVtb3ZlIHRob3NlDQo+IGluIHRoZSBmaXJzdCBwbGFjZS4NCkluZGVlZCwg
eW91IGFyZSByaWdodC4NCkZvciBzeW1tZXRyeSBjb25zaXN0ZW5jeSwgSSBzaG91bGQgbm90IGhh
dmUgdG8gYWRkIHRoZXNlIGNvbW1lbnRzLg0KSSB3aWxsIHJlbW92ZSB0aGVtIGZvciBNU0kgYW5k
IFJlYmFyIGluIG5leHQgdmVyc2lvbi4NCg0KPiANCj4+ICsgICAgdnBjaV9yZW1vdmVfcmVnaXN0
ZXJzKHZwY2ksIG1zaXhfY29udHJvbF9yZWcobXNpeF9wb3MpLCAyKTsNCj4+ICsgICAgeGZyZWUo
dnBjaS0+bXNpeCk7DQo+PiArICAgIHZwY2ktPm1zaXggPSBOVUxMOw0KPiANCj4gWEZSRUUoKTsN
Cj4gDQo+IFRoYW5rcywgUm9nZXIuDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4u
DQo=

