Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AD0B1FE48
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 06:06:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1076880.1438013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulJmY-0004zH-Qk; Mon, 11 Aug 2025 04:05:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1076880.1438013; Mon, 11 Aug 2025 04:05:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulJmY-0004x5-JZ; Mon, 11 Aug 2025 04:05:10 +0000
Received: by outflank-mailman (input) for mailman id 1076880;
 Mon, 11 Aug 2025 04:05:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kugx=2X=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1ulJmW-0004wz-CX
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 04:05:08 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2408::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59ba581e-7668-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 06:05:01 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CY8PR12MB7516.namprd12.prod.outlook.com (2603:10b6:930:94::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 04:04:57 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 04:04:57 +0000
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
X-Inumbo-ID: 59ba581e-7668-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eUme0jmvhkKzrKJpMOmk6TffDb1t+sJpTVVb/+8NX5eXQO1aaxR8BJB0lr5sXjVDrzNcbIr4xfYHHiGjoWvMiNIfAvTXKUX0VCt/NhXRPcQWY32XM4PxSySUk8pn+Q/VYlxdoiDiNB7D1prKoFCk362DXZqQTBhHrhGVm3NJRI79Dd/1PZbAqgaNuX8z1Z+qzzJBp1FkMBS2MdzTg3LLcQj6o7iWJ4Wme7hu63jDExRumj8xlhsSSPaxgK1fzSDtoLcIGy0lL08wu8VVc2/vye5/JhUnWCfCnOHxgLkJVCiEKT4wrEJioF8yXu1JjHUehhhOr9T3qgBAYIak6v5XUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w18p9Hmn8xl43ty+RobpzmMHh/4kV2nLidd4zqdEpxY=;
 b=Y+UjqKrIBleRlQi15B/iJOzfsDB8Hz7MUZljBcqlS7/I60w7I8TnejTlAigJ1VenZuvzLXqHKJAfviFEihGkuPA5qnX04Qb2I6ebI8i5HxMzr3NIsBj8C8R7YY1YQt0HqY8tpjRW5DX6zmkmN1NuKCaxAlaBspCntWKLgh23ZodW04CebrfJ1M+7eiMPNtiqavf3yYly6DkDWfWkxWAjUczAdvMHxZOOqlKl1hqv2HECdXZ40f/cdNBKknDLI1UtvzgdPKLOvzdLQ5u8gRPbr6s7cQrvvXkDX0kLD9czV3l9dWcDPGJBv6Lb2MluPIXsX8v8djwojRh0wzwOZf+ZQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w18p9Hmn8xl43ty+RobpzmMHh/4kV2nLidd4zqdEpxY=;
 b=WQJc1Yza8iRv7bIkz8jCA7coFsCBtMnATjgJXVhI6ClMGVOcbCNLlyIoKOJUX0G9zldnbO5JhysEcHFPf7NdC6vZz+sAahTJat7twNNGYXuit6bqdtIRrqklbNJqr+ygMW7pYyXqg2Y7Le/Fu7kOZt+9lT1Gscbu1d8cK/1n78U=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v11 1/5] vpci: Use cleanup to free capability resource
 during deassign
Thread-Topic: [PATCH v11 1/5] vpci: Use cleanup to free capability resource
 during deassign
Thread-Index: AQHcCDr/CaLOehn+20Smgxu8slgKHbRYdKKAgATqx4A=
Date: Mon, 11 Aug 2025 04:04:57 +0000
Message-ID:
 <BL1PR12MB584915F4FA5E4366E0338FC0E728A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250808080337.28609-1-Jiqian.Chen@amd.com>
 <20250808080337.28609-2-Jiqian.Chen@amd.com>
 <31f9800f-5d2a-4614-9850-07d6bbe232d8@suse.com>
In-Reply-To: <31f9800f-5d2a-4614-9850-07d6bbe232d8@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.9009.009)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CY8PR12MB7516:EE_
x-ms-office365-filtering-correlation-id: 425baea3-9457-4d28-052e-08ddd88c3c43
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?emNGNmFqT2IwY2lJc0FqcWliSXdzZWdwdnlHUzlacm96Z1d3K09MaXBnTFR0?=
 =?utf-8?B?NDZocTNCM3pwRVRMOStsSnB5OFlTdmxWT3NsVU9DMGxQMkY1ZjVYRzNkYUhH?=
 =?utf-8?B?SXFpVkVwUWhoVmgzSllvTkgyTEFuVWMzVG5yU2dNaHREeHR0VVg3Rk5ENHNU?=
 =?utf-8?B?eHVxQ2FicHdROUdoa1JRRjZQOEp2Ni9UeEVKLzVZM1l2WkZiN1FPamtEa2I0?=
 =?utf-8?B?b1VOQkU3VVo0K1pxS0lTejlva2tPWVoreFphb2xpWWZscWwvNGVmSVZubVNX?=
 =?utf-8?B?WFd0bVB5dkNmOEJSdDN3cUJRSVdQeE1scHRMSmpDbFZkd25mNmVZVFBNZHFL?=
 =?utf-8?B?OTMwK0lNSld0R2lmOUN5TGNTRXBQZ3BxZGJ3NTVWT1Mzb3FGUllCdkoybnFB?=
 =?utf-8?B?Y1BsalluYUF5N3J4OVkwRWg1K0lrLzkyR2RVWk96T3pWL1c3cmsyb1g5Tlow?=
 =?utf-8?B?MThOa3BoMVBhVUs2ajNYNGRHNThxMWJmcjdtOTRoelpSajFKS0tvaVZ6Z2RE?=
 =?utf-8?B?NE5DMEN1QUNTdUZCQ1UwWlRpVURNLy9EWFl2c0o5UW82VklLOFVSNCttL1VG?=
 =?utf-8?B?RUpFVFJEcy9QenlSU1Vhb2p0WENVVnp1eUMrekh5cnh3T0pFTnhmWHM3WTIr?=
 =?utf-8?B?ZnlIS0ljKyt4NTI0amtIa0pGL3c5UmlpM2NTQjB1QUZWRkVZNS85aFBXY09L?=
 =?utf-8?B?VHYxSk5pRm1FOXBkQUw0ZUp2TWIwbitDN1FLcEJOelQzbkh4T3VlTDZWRFN4?=
 =?utf-8?B?VjVIZWRTNTU5V004ZS9DTTN2bDdKL0pLamJBMWtXNVlyemFvNGJhY0R6Y2hE?=
 =?utf-8?B?ZVdpK2s1a2d1OWNGN1dKYmpmbWF0UUYxS0duRDdROTFiR3RsUWhNMWdGU0Ni?=
 =?utf-8?B?SGgwRDBUQ2gzUWRJd0l4bVJVdysyUFhrWW03c1RZcUpQTlBrZVZ3QmxrS3pw?=
 =?utf-8?B?bEN0VjlSbGx6WHA1WE5rZER4L1RZckFvbkZlRnJoRWd6RHdsT2FVVmRXTjFs?=
 =?utf-8?B?L25admlUQVNheldGem5EMTEzZWJYcm1BdHpUaEp1V0dBL1RuQ2xqSUhudUJG?=
 =?utf-8?B?OFdJeVlKeE0ySjV5ZU0wRlIzeWhCeWRUemxlSVJ4SnpubmpjUEh6TDZ2WnJW?=
 =?utf-8?B?NlI0Qjd5UHVvTk5zcmpOYzUrSkU3SmZ6d0grbmtMR1JlOFVFaGV3Q2ZlMUFW?=
 =?utf-8?B?cEJmYUpQano1VWIyYzZoZmx5YjNqMi9USVpvV09TMkZiNkIvWGlLQ2FSSDRk?=
 =?utf-8?B?SlJwdnJEclc2VGJrYitieUJtaSsvOGR2ZmxPb0kyc3lSTmZHemNrbFFzZk9r?=
 =?utf-8?B?K1RWMHNjK05kRFVjeDZia0FubUd1K1RLYkRCaXNxNXV3bERNck1KVnl0UEN2?=
 =?utf-8?B?SWZ5SHpSemE0ajVud2FDUDkwS0JqSEYwVnlOWUFQNnFlTWdKSkNzK1ZweExK?=
 =?utf-8?B?OWVUK2JYbEhPenNSQ01HOEM0bHp6SFhaRittSFN1UTdnS3dzQjFWY3picjBD?=
 =?utf-8?B?QmlHYXFiYlN6RE1uYTNKZlVNQlhNUC9QZXRCZGN4SEsxREcvNE5yUFFXUFpZ?=
 =?utf-8?B?aThOVkpUWnJCM2dza3RRRTYzVmlqQUJMVlhoMURIbWQ4MDFzN2VsT2E5ZDNV?=
 =?utf-8?B?Q2Z1aGt6MjFUVU5Bbmp5NzVkc2hmNFdZVmRmQWJ5L0hWaDYxbEZjVVFZMSt6?=
 =?utf-8?B?aTcvVVRrbXFEbmVmb3VRQ1ZNSUlFZnJyUlBsNkI5TzlxVi9ya1dPQVlNWHFT?=
 =?utf-8?B?K0NVRzAxNnN5ajB2L0JKaC9BZFlaUFNzTUh6QnRHcWR0SFNMZWFuYlVKOUZX?=
 =?utf-8?B?Q1JNRDdoYWZSZzJvRllRQ0xIMzAzYkxKL3l6aWpuVW9oSVFQbS9VTGdQMjdT?=
 =?utf-8?B?b0pkZHdRRnZWM252em9LRGZaVUNTdHp6NDV2RTlWYzBTWkxlNTA1VG5UdDRL?=
 =?utf-8?B?QzZyRkttNlppV3YwKzc5Uy92cldYbzgvOWo0VThYR0syeEw4alBEa2pmd2Vh?=
 =?utf-8?Q?KpfbfNM5Ncln5oEYXl7mNV6rYa762s=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NGtkVDZyRkZWaWhnU01jekZROE5wakxrY2ZPQXkyS293V2oza0F0dTZvU01B?=
 =?utf-8?B?YlR1UVdqNmJMVkdvQlFtcFA0LzV2NEpFNlZ0M1RCcGJUMHBHS0Y4MjRKUkhw?=
 =?utf-8?B?bHBodjRsN2txL3VlSFBDdTJuUHMrVVZINlNsVE14bVZLN3ZDNzJEWW93b2hp?=
 =?utf-8?B?UTBWQ0pWYUNSbFI4V2djVEVtUU1sN1RZVytHbjFSSys4YTlnY1JFbnJoUVQx?=
 =?utf-8?B?UFZ2Y3VoUGFSaXBhK0VUaGdhc1dsRHhaUGhaL0VtdVpzdDBWUlNJcElYM1U1?=
 =?utf-8?B?MTlEaE5EMnY0Y05IVGxlL0VCSVp1dXh1bGUrdDAyYVR1Rm1sb0tFVnFHbWRw?=
 =?utf-8?B?U2RUZjl1NHV1SzBlakFaSWtGMWU1T2N4cUVqdEFBZ25yRFVwRXJJazd0MWZK?=
 =?utf-8?B?NEl1ZU5mQ0JBa0dEaFlKSGM5dkg2ajBXZXl5QVVDblhoMlRUeFVxUEFCMThu?=
 =?utf-8?B?aXpxRzIzdlJRWFNXYmREMHg4VU9zbFVLdzRSWWkvWU9XWlZPaEszS29TQjhT?=
 =?utf-8?B?MStnbXQybFpCckN6d29USjltTXJjWERnYXZKc29BdU5tdUo2Rk1qbjBLRnVW?=
 =?utf-8?B?TlRkMVBVVXllWnY5NjlpWmRZKzRWUWw5Ym9xcGNPeDhXYUNrcVJhL0F1RnMx?=
 =?utf-8?B?S3p0MVNweUQ0TnlwTkVWd3ZmL3NEcjdjNlU4M3ZBcFRQZ0RYT2t1aXNlc2lM?=
 =?utf-8?B?N2o2SVJuMjVKREVPTnltTXBIZ3FyNnZjL1EvbEIxa3I0V0t3TUl6VVhjbzNH?=
 =?utf-8?B?YmZoV3ZUdW9BQUJGSnd2Q1lSNlVQKzFjendtWkN2U2h1ZjhuQmdMc3pFSkZW?=
 =?utf-8?B?U3YzNTcvN3YvSjE0eVRJdjdEdnRIMVd1WTdXRk0wdFFyVjZHamFQeWVkVDdh?=
 =?utf-8?B?cGJzV0gzSkJtOUpnTThGN0RSYmJUbjVENTEwNTVHUWhUZDY2N0ZPWHIxN3B4?=
 =?utf-8?B?MDJLeXJHZTYray9rZUZlWWdEeHMzd3Fld2gvWWkycU1sOVpYdXNLcG5teU44?=
 =?utf-8?B?clhCTTZQcSs0bUl6dlBCc3lHaUU0TjNETldobVpvcm5YenE3LzMzN05kWERY?=
 =?utf-8?B?YSs1Z3ZXeGhKM0JDYldoMnJ0SEpSdFdtL0J5Q2F1aTBVWWZMTU5IVXJBV0Vj?=
 =?utf-8?B?Z2RtSDhvbHREVmt4Q2JVRmNvZ29SdVRmczFRcFNlRGRyS1doVElER3ZDclMr?=
 =?utf-8?B?WUo5d25VRnBqUWZLV0Vrbyt1SnFuZlprMmdZUnJ4MmdtcWEyV1NqbzRZL1h1?=
 =?utf-8?B?MTRZeTNqMzY5dUMvQ3RnMUwwQVl0WWIyQ1g4WUpNUVRZaWhFVTlmM1pGTjFn?=
 =?utf-8?B?Mmk1UTJzTnRvdXZsZTIyazBoL2plem1YbXV1SU5mcmVGZ3dPM3JaYzFvOE5a?=
 =?utf-8?B?Nm1aZEdKZW1NTGoxOU8yUmt6VjRhL0RTc0g5SVU3UC9JWjViN296dllVY3lm?=
 =?utf-8?B?R3N3Zm9zR2MwZERTa1BXWDFxMmFkKzZVcjNpSlEraFJVY3pYNXBQR3pNcGVI?=
 =?utf-8?B?LzdpMUsrZ0V2RTNBL1BHVWdOYXBUZG5qM3JPS3M4S3FEZGYwaEF1OTFkcFZu?=
 =?utf-8?B?cnZwQnRVVzhSNXgzTm5GemRMOVNpbjAvZDRYcWdCdVBjTUYweSsvS3BuREdt?=
 =?utf-8?B?MEtaOHZBTmM1OGFReDl6RVZLSmxzTXRVK0F6eFp6RkxzRjNOTkdIYmVWV2g2?=
 =?utf-8?B?OHNYL3hNTlh4bU1GcGp2UjhBWHQ0Yi9WMTJEMzhNc1RWa2ZQeWwwOVJacnpX?=
 =?utf-8?B?Z2VNbFY0bGphZnVnRjVmMmhORlo5WVhzTUZDTnhQOEN5S1VaalhoMVRZSmh3?=
 =?utf-8?B?MjlqSjZqVmN3ekxCQkhMTVR0QXpVWVU2a1B4TDkzbTJ1YllsVWhPYUY3cU9x?=
 =?utf-8?B?NTRzUzlFL1FvRWE0eEtXVDJlY1UrMkJERUhiVVFwMEFMQ29ER3JlZnVCM01v?=
 =?utf-8?B?TzI5L01Ed1J2N0hhSmtQN2Q1K2xDbXBLUmpLbFVpVHhWTllZQmtvanVzZnNB?=
 =?utf-8?B?Z3hmODNrR0FTTlVWM0o3cWhPOWNSYzJyT3JHNldGa2dnUm1ueXNuNzhnQWEw?=
 =?utf-8?B?bTBHYnhENitxS1M0cG45Vlh3eFFyRVMzNGdEMzJiL0tONlFqM0JseEI5V0dV?=
 =?utf-8?Q?CdJ0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2CF6310250EB1544AA5E6870DB2C9DF2@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 425baea3-9457-4d28-052e-08ddd88c3c43
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2025 04:04:57.3989
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tp3oyfyqm/X3jLRsJTmKy/QRjlPNs/hvY8ZDD3o4+0BY+mo/I5PkY5effc5atVMvD8LIOMn65YIbnmmqqxW+Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7516

T24gMjAyNS84LzggMTY6NTgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwOC4wOC4yMDI1IDEw
OjAzLCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+IEBAIC0zMjEsNiArMzIxLDI5IEBAIHZvaWQgdnBj
aV9kZWFzc2lnbl9kZXZpY2Uoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+PiAgICAgICAgICAgICAg
ICAgICAgICAmcGRldi0+ZG9tYWluLT52cGNpX2Rldl9hc3NpZ25lZF9tYXApOw0KPj4gICNlbmRp
Zg0KPj4gIA0KPj4gKyAgICBmb3IgKCBpID0gMDsgaSA8IE5VTV9WUENJX0lOSVQ7IGkrKyApDQo+
PiArICAgIHsNCj4+ICsgICAgICAgIGNvbnN0IHZwY2lfY2FwYWJpbGl0eV90ICpjYXBhYmlsaXR5
ID0gJl9fc3RhcnRfdnBjaV9hcnJheVtpXTsNCj4+ICsgICAgICAgIGNvbnN0IHVuc2lnbmVkIGlu
dCBjYXAgPSBjYXBhYmlsaXR5LT5pZDsNCj4+ICsgICAgICAgIHVuc2lnbmVkIGludCBwb3MgPSAw
Ow0KPj4gKw0KPj4gKyAgICAgICAgaWYgKCAhY2FwYWJpbGl0eS0+Y2xlYW51cCApDQo+PiArICAg
ICAgICAgICAgY29udGludWU7DQo+PiArDQo+PiArICAgICAgICBpZiAoICFjYXBhYmlsaXR5LT5p
c19leHQgKQ0KPj4gKyAgICAgICAgICAgIHBvcyA9IHBjaV9maW5kX2NhcF9vZmZzZXQocGRldi0+
c2JkZiwgY2FwKTsNCj4+ICsgICAgICAgIGVsc2UgaWYgKCBpc19oYXJkd2FyZV9kb21haW4ocGRl
di0+ZG9tYWluKSApDQo+PiArICAgICAgICAgICAgcG9zID0gcGNpX2ZpbmRfZXh0X2NhcGFiaWxp
dHkocGRldi0+c2JkZiwgY2FwKTsNCj4+ICsgICAgICAgIGlmICggcG9zICkNCj4+ICsgICAgICAg
IHsNCj4+ICsgICAgICAgICAgICBpbnQgcmMgPSBjYXBhYmlsaXR5LT5jbGVhbnVwKHBkZXYsIGZh
bHNlKTsNCj4+ICsgICAgICAgICAgICBpZiAoIHJjICkNCj4gDQo+IE5pdDogQmxhbmsgbGluZSBi
ZXR3ZWVuIGRlY2xhcmF0aW9uKHMpIGFuZCBzdGF0ZW1lbnQocykgcGxlYXNlLiAoTGlrZWx5DQo+
IGVhc3kgZW5vdWdoIHRvIGFkanVzdCB3aGlsZSBjb21taXR0aW5nLCBpZiBubyBvdGhlciBuZWVk
IGZvciBhIHYxMg0KPiBhcmlzZXMuKQ0KVGhhbmtzLg0KQlRXLCBkbyBJIG5lZWQgZm9yLTQuMjEg
ZmxhZyBpZiBJIGV4cGVjdCB0aGlzIHNlcmllcyB0byBiZSBtZXJnZWQgYmVmb3JlIDQuMjEgcmVs
ZWFzZT8NCg0KPiANCj4gSmFuDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4uDQoN
Cg==

