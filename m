Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BA2A851C7
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 04:55:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946578.1344421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u34Xc-0007I1-Gh; Fri, 11 Apr 2025 02:54:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946578.1344421; Fri, 11 Apr 2025 02:54:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u34Xc-0007GE-E6; Fri, 11 Apr 2025 02:54:52 +0000
Received: by outflank-mailman (input) for mailman id 946578;
 Fri, 11 Apr 2025 02:54:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AtDH=W5=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1u34Xb-0007G8-Ik
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 02:54:51 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20607.outbound.protection.outlook.com
 [2a01:111:f403:2407::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54ec1213-1680-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 04:54:49 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by MN0PR12MB5761.namprd12.prod.outlook.com (2603:10b6:208:374::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Fri, 11 Apr
 2025 02:54:45 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.8606.035; Fri, 11 Apr 2025
 02:54:45 +0000
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
X-Inumbo-ID: 54ec1213-1680-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lLWtZuJZ9YEEekCmzX/w6tTU2d8KPiMuWlg3IRd9tckQWgo4m3dmthDWxHW44MHCNmRmTf+/15usTUDFk57usplqq+IuSoNP/Ar79WFgMa2xELvJD/XOxp2GYZplsutZOSkdEGnNMHxHemrh842y4vzdKXzcyBF/vi4BAbKR942oQJKp5Qvk9+qisQgjWUsMKIw2iRQof+/c+SOCKP1cY67YazUDDHIN55KngdwV3zr4a1Em+PnyotlsoQ0VrXO33s7Euw2bGJf/SnvLjW+aITeJc3pAcAG0+AU30HjxV7SoF6JWtTBqerDQRfQYFLQZOmY4vZ91cj2SPiR5B4HiFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PCpQrs7bddYr+gubjWjlP6wQIVfg7X1MiNNGkD/P3r0=;
 b=KSR1hkhJerLRobmDx9UAy4nONXqrdes8yfkQIhQs4za7LIwe+HqP81y2//9yYCPs4D3Sh5Ru2HzX1HhiBwbNEk3UYCwY1oJallO5IgT2U71MWvzkkEi+HdedAxGVwLojbMv+8Qhn3ZpPw9Gw6WRbprv8FBCYEGqpe8FfnUpeEIigQ5gDcnGjfQfhVziY2y4E+EPPQxAhjOa1cHz/7a0fodBI8ns1JV245WUKzDl4erkEd6lKi+PZ1EfaBCAzeKDSXUqcYR/Mwt5sv2PJBu0fakdBkWGt5C8NFLyTeP3FKoETGTMxX7pcvW+IM8F/OgHktuVrNJa2bG+bygZCX6622Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PCpQrs7bddYr+gubjWjlP6wQIVfg7X1MiNNGkD/P3r0=;
 b=FQkGJWJ+0YxVlTlTNboXYC/uvTb8MIoneMFij8J1y14lt9UNOuxHvmV0vo5JEQiudazAzqLy8hBbQ29TD8g/TdckNoDAuuRnQMauqVwudSwjFYvcW5u9JCP00ndx4s1qC4h3hlX5gmQcdcTqil7S0jE/TYMqJwSV4sLx2oJrVNY=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v2 2/8] vpci/header: Emulate legacy capability list for
 host
Thread-Topic: [PATCH v2 2/8] vpci/header: Emulate legacy capability list for
 host
Thread-Index: AQHbqRsaTINnyZcO4ESL6xMBZUfUtLOc2UMAgAF0NAA=
Date: Fri, 11 Apr 2025 02:54:45 +0000
Message-ID:
 <BL1PR12MB58497FCC952CDEE7BAEF0688E7B62@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250409064528.405573-1-Jiqian.Chen@amd.com>
 <20250409064528.405573-3-Jiqian.Chen@amd.com>
 <7e89babb-ea6f-4434-a90b-19c2d12cc58d@suse.com>
In-Reply-To: <7e89babb-ea6f-4434-a90b-19c2d12cc58d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8606.035)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|MN0PR12MB5761:EE_
x-ms-office365-filtering-correlation-id: c4b49483-1ad2-42a4-4347-08dd78a43727
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SHlLRVdpcXVHUzZ4RDgvb3ViTnk5QXhub1I0Q1pSSVhyV25Yd1JVbmVRZTJo?=
 =?utf-8?B?eVVEL1Z2QjVEcmkrKzU1b0tROUoyYzc1V1V6djArMEU0eFEySTFHN3JHRFVz?=
 =?utf-8?B?MGlzTlZwQ0xjdXhTcnIwTUEzelJCVHphY2thcU80VzEzbHRkWTJNTzZrZndz?=
 =?utf-8?B?YThYOUZUTmh3VDRwZFZuRDJZTWdENHZYMGJQT3VDSXZCODJZZmlJdGdJWGtX?=
 =?utf-8?B?NXJnNHM5b1hlWTkyWFoveEcwUmd2ODNMcmxScTVqc3UyWHdYYUErVC9MS0RF?=
 =?utf-8?B?VU9YQVpWMWpCOTZKdEV6VSsvTFRtWkFSOGFpRkJBU3VzdFJSS20vZ0s2Q25I?=
 =?utf-8?B?dEVmbTZJZ1FNaGM1MmxWQ3NHUGV5ZXVHZ1RFOU9tTWRKNmYrUU9LaUFRSUVL?=
 =?utf-8?B?ZXVuMG9CZ25qc1BwcFFGUmpYbm1ocmN1dkFZbGwwQ05IZkUwck0vOC80Nmty?=
 =?utf-8?B?SlFTT05EUDNEV09RNHZjdUlGdW1ZTlVBS3NDRDdrK3BDTzlLd05IKzNvVkl2?=
 =?utf-8?B?OG05Y1hmVHQwbmpJdlJEb3JtTUNONEFUZFZvbkdMTVlNWG4vVTVROTNFWC9a?=
 =?utf-8?B?L2U3VGlSWDNFOGExVVY3dzBxV01UK1lHZmJGSmpOdUo5ZjczeUMzTnNiWFV2?=
 =?utf-8?B?M29jamkyUUtUVEovQ0orTHhveEdKMXgxMXRxcytEak9iTjM0bWJ3ZGwrRUwx?=
 =?utf-8?B?UlBOQVptNG1pN1JvRTFLelFOYlk2eVZsc0g5blp6VS85NWV1aXNMNTMxMUc1?=
 =?utf-8?B?Z2g2aFBsSGJOV29zK2pTaWdYTk1WOUNvV3cwOTdDZWc2ZGgyS3FjRzYyYWhk?=
 =?utf-8?B?VzRKMVczYVAyellmc3IzbnRZRm5ndVlUTDk3M0E3cTNXbGRnb1RLSmFCWDEy?=
 =?utf-8?B?dDFpamdLMHlyallCOWszSVVBUVdnMkovbHBuUnFKVnZPVUI1RVdmaFJSaEg0?=
 =?utf-8?B?cm5YYkJyT1JiaHZsdzRRNHVWV1VMMHUvQWNrbHZtNUNsZ0JUU2lIY1hpcENI?=
 =?utf-8?B?Z2E0eTMrcDFKQXkwcGtjZ0lIM1VJeXRXeWFITnY3eGxyOGdQTnBUdXhUenBG?=
 =?utf-8?B?SDlDRCt0eGxFa2RjZ2NWOGpZMElMU2MreGs2YkhGWko2QWhud0U5UFNpb3FG?=
 =?utf-8?B?Rm9OTHlIdnpieThUS29XZ25PNVRwdlY0NnE5aEFlb0RaL00xaVpLVzlvZklU?=
 =?utf-8?B?d1RLK3lYcVlHcGd2N2haVmJvRVVJQXJoNGJ1TmZURkFuV2dmNkQvdzJod0JK?=
 =?utf-8?B?K0ZkOUlUdlhDR0tyY0JkVXZVMnNYWWJQUHl4aDVMa21FMlVjeDRQOUdZVnRa?=
 =?utf-8?B?dGhhaC9GV21QaE5xMWVNTkdvaDYwTVZqMXJrbm56b1pUVU82SkdWNFdJdlpr?=
 =?utf-8?B?Ykh0RUw4eUFkeEs2MVAwM2NtS28xaWJMazA3N1UrY29vWThjRzdIdHJaa0FC?=
 =?utf-8?B?c0d2cjJXUmtYdE1XSDc5UExTbWltZ0pwRmdKaGtER1I1UlhzNWpSVGhJN014?=
 =?utf-8?B?RWx4OFhDRWdUb3RKazllakdPSWZ0b0liRzJMbmNSUzhha3JaWTNPZ0FIaHBS?=
 =?utf-8?B?QS91c3pnWDdTNEFXSW96U0tqUWFNcDh0Q0xQQ1ROQVM1OS9OcGx2QlI2NmVZ?=
 =?utf-8?B?K1k2cW5Gc0ZrVTI4YWtHRE14QnlsWkxZeG1DZXUrc0dqdHJpbUlUYnFXNmJJ?=
 =?utf-8?B?d2dLNFR0bSsxQWVmYjJtTmJ0N2pSQ0ZZMGpLSkE0VWxIcCs4b0JNODM4eldt?=
 =?utf-8?B?bTVDak5zZ3NLdUpOLzFhT2tkWlo3RHBUS3BvZE5RbWlnSEF1K0x5Tyt3dzRj?=
 =?utf-8?B?MkhJSkw2MFljK0MwanhHbVVQeG9aNDZ6RTRkMFNhYkk3WFR6NGtaL2dGSEpG?=
 =?utf-8?B?eG9NMU0xRk5qanJ1aERmY1hndkNiZHh4NlFjUkJ0QTJqQlA1ZnBHNGZIZWRQ?=
 =?utf-8?B?dXRZZjRPUmw4Tk00RHZDMFFYb1Q2R1VUck5acGNxdTYzbkpzbWZKU0tQVWpk?=
 =?utf-8?Q?fhSnaCILHg5wLxuEW5b4TeiZgy/rF8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MUh6WjRyTDhMTlVRLzR2T2ZYYlByR1dtMnJmNTdKS3VEUmhXMnppWnhqUVFx?=
 =?utf-8?B?Rnp4YkdLZzVMRVk5US9WUzRNTTVtNW1hRjAvV1ZqcFBJWFZuTjgyR3Jrei9a?=
 =?utf-8?B?elhtd0pUMTZuaFAxRmVvWE9UQ0dJS0RsSzRSc2lKRldQcHFLa0hyOEtadi9r?=
 =?utf-8?B?MlNpUDM4eG9DTGovYVBHZi8wS2Zra0dXdzBlSi9XWTh6YWxMMzZJbm1URUx4?=
 =?utf-8?B?dGsyZ2M2V2dCRklzWFdmaDkwOFJkbmVUUUh0RWJqdmllNFJpRjZOL2djS2Iw?=
 =?utf-8?B?ajhRQmVhZkk5VVczRGdpbEdVKzlRSW1nU2xITmRqK1Z0TEZ6L1dBaWJ6N0sv?=
 =?utf-8?B?ZHEvWmdqOEdJd0hmR3gwV1BQcngyUTNoWDdsbHF6RDdZUzFrYTJoWEN4QTQ4?=
 =?utf-8?B?ZzIrZ0tFVWFMMG1MVnFiTjJXaUVlakR6SnM4dW4yTEQvenpTR2VZdVlUQ0Uz?=
 =?utf-8?B?QzdIbUtBTTMrZHVlT1Zsc0hQQktFL1BpRHRVMlI1RjNxZCtjR2xpQ2UxQS9u?=
 =?utf-8?B?bkZPbHhqc3dzTW83MlVxSWZmYkxiKzlVOGtocWVqdjNIZTg2bU9rcWF3Q1Vu?=
 =?utf-8?B?TnpUMXYvN2dzbzhnR3hkNFVXRmpSYjZlRjVJanlGTnY2N0FLZSs5UHNDdVJG?=
 =?utf-8?B?bWtielZKWXNLMEgyYzJFNFpjUW13MjBEazlnajAvYjJRRnRIc1BQUnZIbTJH?=
 =?utf-8?B?eEg1S2NITjlsbEJoVlJ5M3l2QW9tVUxvWDg2Z21INUJKU2hRbjFzVmg2cHM0?=
 =?utf-8?B?emtScXEwRGdvbms0N3BsRk9rTktMUjAwQ0lna09LZndhNUg4Rll0alBBdDd6?=
 =?utf-8?B?dDkzVlA0QnRKSWc5UDNNcWF3TVBEMjY1UklGV1N2aGRCSS9tZTAwOXBjVTNX?=
 =?utf-8?B?dVpBcjQyWmQ5WXNERXgvYW1xSTlvaWVkekhQaUJSR3kyUDk4bVRwVENXSi9S?=
 =?utf-8?B?MjVvSTRQVEtxQjlCeXU2S3h4by81WC91di9sbWVuRmFlR2NwR2trRzNLNTNu?=
 =?utf-8?B?SjlRZStkcVRnaVRTbTkrZnB4ZGlNdVRZK0piT1lxVGZIRUtNQXNySkNaWVAz?=
 =?utf-8?B?WG4xOXVTemNsK29ldXRhTlJ3UUhRalBoNldMWVJEQTN4bHJtUmFrbjhraUtR?=
 =?utf-8?B?UjdndEkrakRtdXBKcGxubktROC95SW5XY20xMThVTGxoL2ZZYjhGaEhXZFQx?=
 =?utf-8?B?K09FUUxudVQyVitQczNpOW4yWkdVWVRXQUovN2N0UG9yVU5BUEduUUwvakNx?=
 =?utf-8?B?ZE5OZ0pwZFcwZ256UkRaY3g5SDZqdnllZDFNQ3ZHcXdSVkNhWXlSaXArK0I2?=
 =?utf-8?B?QUorSTUydmJzWE0yODFPL1VFemxKKy85WFZUWHRWelhRbVcrQ2hSVlhQSUM5?=
 =?utf-8?B?Vko5TGNWcGtET1FjdlB5NUUrNFA2OXdSZlJHb09TTlRMMXRxdUd2emdMU0xi?=
 =?utf-8?B?R1JwSmxOVHN4SWVoaDA5R3BVRkNhdGU1VGRDcXhPOGVMSlgwTlIzVUJSVCts?=
 =?utf-8?B?bytkcmRabE5kK1JtK01FWnVSUktQUlQvZUZXdk8zL1A3NFpSYmxod3I3QkFL?=
 =?utf-8?B?RlNYakwwOHUrMWFNVnZwSGQvd01HNVJ6MGhvbUJ5cjkycFFvV21GSWxSRTdk?=
 =?utf-8?B?OC92RmRoOEVOdEc2NkNhTWs2Ty9MZVhXSmlVRFlzM1Fralgwa05ndW5GNmd3?=
 =?utf-8?B?c1hpaEhWSU55UTNMWEE3SjFMSUpVeUJoUHlFUlNtMFJoa3prRkV3dWJ5QTVt?=
 =?utf-8?B?amRvOEFwbG82cHlucjUxWUhid1lyOG9TYUxzQndGQ2RzT2N3bGFvdW1ybEhB?=
 =?utf-8?B?NENsMnUrYTVCZTFCTnVEaVRCVnlBOWxBVEY4MlkzbVRqNGhBbzVFSlB4K0Zo?=
 =?utf-8?B?L0VrQ3AwaE9EemhjL3RQbUp2dkRxUE02aDgwUy9nSGNoSGc1R2NpQjdwMmJI?=
 =?utf-8?B?b1lITVdtTXRKaEpkM1NWR0ZrcU9IcGw2Sy9TVG9ETDUveGtwd3QzSHhEcU85?=
 =?utf-8?B?Z0UyMi9LczgxY0dHQjV6UjNBOXJlR0M2azVpWFltRmQxVHFIY29lSkkvYUhy?=
 =?utf-8?B?M2lJd0FIb0xWOE9jVzVEck5mV1gzM2xCS3NSVUUrc0c3UlNSSzRoaitjOEov?=
 =?utf-8?Q?GSxE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <34EB6A1BB9B5824C803740448F6B1138@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4b49483-1ad2-42a4-4347-08dd78a43727
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2025 02:54:45.1546
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8jmIWtpeoNcWuKf2BtoLXNOyiEjcNa6FjgjTUKS2fXUmmc8x9fNb23KWHUvbDhVbvmEiYTDRHiwQGWIYAwB5CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5761

T24gMjAyNS80LzEwIDIwOjQwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDkuMDQuMjAyNSAw
ODo0NSwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiBDdXJyZW50IGxvZ2ljIG9mIGluaXRfaGVhZGVy
KCkgb25seSBlbXVsYXRlcyBsZWdhY3kgY2FwYWJpbGl0eSBsaXN0DQo+PiBmb3IgZ3Vlc3QsIGV4
cGFuZCBpdCB0byBlbXVsYXRlIGZvciBob3N0IHRvby4gU28gdGhhdCBpdCB3aWxsIGJlDQo+PiBl
YXN5IHRvIGhpZGUgYSBjYXBhYmlsaXR5IHdob3NlIGluaXRpYWxpemF0aW9uIGZhaWxzIGFuZCBu
byBuZWVkDQo+PiB0byBkaXN0aW5ndWlzaCBob3N0IG9yIGd1ZXN0Lg0KPiANCj4gQmVmb3JlIEkg
KG1heWJlKSBsb29rIGF0IHRoZSBwYXRjaCBhcyBhIGhvbGU6IFdoZW4geW91IHNheSAiZ3Vlc3Qi
IHlvdQ0KPiBtZWFuICJEb21VIiAod2hpY2ggaXMgYSBjb21tb24gcGFpciBvZiBzeW5vbnltcyB3
ZSB1c2UpLCB3aGVyZWFzIHdoZW4NCj4geW91IHNheSAiaG9zdCIgeW91IG1lYW4gIkRvbTAiPyBU
aGUgbGF0dGVyIGlzIG5vdCBhIGNvbW1vbiBwYWlyIG9mDQo+IHN5bm9ueW1zOyAiaG9zdCIgZ2Vu
ZXJhbGx5IGNvdmVycyB0aGUgZW50aXJlIHN5c3RlbSwgaW5jbHVkaW5nIFhlbiBhbmQNCj4gYWxs
IGRvbWFpbnMuIFNlZSBlLmcuIHdvcmRpbmcgdGhhdCB3ZSB1c2UgaW4gWFNBcy4NClllcywgZ3Vl
c3QgbWVhbnMgZG9tVSwgaG9zdCBtZWFucyBkb20wKG9yIGhhcmR3YXJlIGRvbWFpbj8pLCBJIHdp
bGwgY2hhbmdlIG15IHdvcmQgaW4gbmV4dCB2ZXJzaW9uDQpUaGFuayB5b3UhDQoNCj4gDQo+IEph
bg0KDQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

