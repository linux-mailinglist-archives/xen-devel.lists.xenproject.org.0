Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B6B8D2DB2
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 08:57:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731471.1136971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCDEa-0005ek-7s; Wed, 29 May 2024 06:56:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731471.1136971; Wed, 29 May 2024 06:56:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCDEa-0005be-4a; Wed, 29 May 2024 06:56:28 +0000
Received: by outflank-mailman (input) for mailman id 731471;
 Wed, 29 May 2024 06:56:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Qc4=NA=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sCDEY-0005bY-I0
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 06:56:26 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20604.outbound.protection.outlook.com
 [2a01:111:f400:7e88::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8fa52fae-1d88-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 08:56:24 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CYYPR12MB8989.namprd12.prod.outlook.com (2603:10b6:930:c2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Wed, 29 May
 2024 06:56:19 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%6]) with mapi id 15.20.7611.030; Wed, 29 May 2024
 06:56:19 +0000
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
X-Inumbo-ID: 8fa52fae-1d88-11ef-90a1-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d271MOobSqiWsr2Fzvp82W1acdsVQvqe5HmcF0hbn2vWPhkZBi8M5rWjX5pw8kADAVvbCEnEjklS/Oeq1tiOYqKkK146b6WmRZZ9fuTKWnztEdKLkdKHWsd02WlxZGAYnUgJZmUlEOiPxo6+gVNrerwCGx6sSovPiuYkVlB4I/kWcMm8d478Vu2vfE93DBNJKx+7kw9osM0tPG7M57dQ13qFXZNthlECivwYQ89m2MAG+2iKAI69dACzsKQwL2NSbmEHiessDYZMyuw3/JnPWD30bn4vwTKgWtig4a8rl4T71vwsaP0f6LuEPRULucgPVG/RntZkQPZZI6KDgyRXRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47llhVA5fJda5hOa/uPhhG+yP4DLIy+MMKnylrP/iec=;
 b=eM4eqvaTF9UWLfMNGWypJWGLrlLwWbloTzeyg2sF/QgbW8K6hGXA/4Db7GWr90I1XKmx9ooQwzg/6x5ax46fB7AR5uR/iA46+xs3U57Oqc0Cqc69IZDQ1WnF8+nvLhbUOuk08Ky1VII58Hl5/K1c+E42CzqDc8T5yKdKHCZ0NlAhn+n53qgnRXhx2U0T4zxPMLtau2D7HrUVU9XOLTqJzr3zCoqe+n89VNG22Mcd0xZgEXGieWazqGdlMvOJ2aiiV2q1FHwl2TZ0qXdnKcFznGYHKIJWeECC+o1E6yhX2g/hLAPUGWT+T2CHYjwYriU+qJYoC5xxM7NxG6b69SuAqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47llhVA5fJda5hOa/uPhhG+yP4DLIy+MMKnylrP/iec=;
 b=t9lAABuGXvPiU7+sHatw4GJY7qockbSfL3rvyVDwqJM/2Ntj/jQenbUe84J0Qt+/hehdbwxO851MzVmwcLQ+uSsxuvLZvBP6xP2dQC6HNEmaq/i2ZQlTAVZWS5mMiECFUKH68/sqCmg5O6QepsT7V0EdnnjqmufB0u5mO9MJCsE=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Hildebrand,
 Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Daniel P
 . Smith" <dpsmith@apertussolutions.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v8 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
Thread-Topic: [RFC XEN PATCH v8 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
Thread-Index:
 AQHap3bgiER4vYjwvk2+R5oTa8V63LGZ5EYAgAHVa4D//4e1AIAAis+A//+FmgCAEsTugP//viAAABEhvwA=
Date: Wed, 29 May 2024 06:56:19 +0000
Message-ID:
 <BL1PR12MB584922B0352AA2F4A359FD66E7F22@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240516095235.64128-1-Jiqian.Chen@amd.com>
 <20240516095235.64128-6-Jiqian.Chen@amd.com>
 <9652011f-3f24-43f8-b91e-88bd3982a4c4@suse.com>
 <BL1PR12MB5849EB5EE20B1A6C647F5717E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <b10e68e2-3279-471d-a089-c40934050737@suse.com>
 <BL1PR12MB58491A32C32C33545AC71AB7E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <4b311c82-b252-413a-bb64-0a36aa97680a@suse.com>
 <BL1PR12MB5849333D416160492A7475E2E7F22@BL1PR12MB5849.namprd12.prod.outlook.com>
 <70c86c74-3ed6-4b22-9ba6-3f927f81bcd0@suse.com>
In-Reply-To: <70c86c74-3ed6-4b22-9ba6-3f927f81bcd0@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7611.030)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CYYPR12MB8989:EE_
x-ms-office365-filtering-correlation-id: 02c9b6b4-904d-42fa-6879-08dc7fac7197
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|366007|376005|7416005|1800799015|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?cGI3ZURqVzl1VDh6TmMyTFk4MEFvNGwybXE4UDVseVRpYnF4ODRPMmdTdjU3?=
 =?utf-8?B?QnNJMmhUZ2RWdG5valJCNExVSjRMbjhoRUZMelN2Y0hUZlpOamJWZlR4dWtT?=
 =?utf-8?B?d0ZZdVQrTm9pRWE5cHUxaUI2VXdBWGM0dTNuSlFpZjNobWE5Z2F5ZjlJb05T?=
 =?utf-8?B?TlNQZk5scmlJOTBUOFNOZGJUaHlIbTBnRWIrMG4xREoyc09TQ3pVcHk1b25r?=
 =?utf-8?B?NnZTOHluWldLRlQwTWp2Y0FMOE1HYWpZa0tNZ1lpU0o3aG0xRElwSGxPUVNB?=
 =?utf-8?B?QUNNVXhJTUJxY3ltb1FITVQrWHlOZlhUaGFnc29JVitiMkhvamdvVVgrQ1ov?=
 =?utf-8?B?UTk2b2M3Vlh1YkN4NHBoNmlldU14SVVWZWd0M003VnYxaGRvam5EVDFtVTVW?=
 =?utf-8?B?OEpGaVNMVFkxVHNMK3J2VHpuYjFnWDBiajBsMHlIWllqRUlEMGtBV2ZPWlI1?=
 =?utf-8?B?S291OVRsRVBSdXRwREUza0VOdTMrckh5Rklyb3FGemZCVzJ6em9tY3JZR1Mx?=
 =?utf-8?B?eWllTTJhQ3JBdTNIVlNZTDBlSEVSVTBUSW9PYW1wK2tsR1h0ajV3U21nOFJp?=
 =?utf-8?B?dVJyenBqQVJXcm1EWkt1RktwdDlqR1ozMFk2aDVyL1VGRTNWM0tBUzVyZWVa?=
 =?utf-8?B?ejQ4aEg0N0dmb2RUYitRKyt6d01VZS9Qc2g5UFJ5WkVsVTU0UnZhV2ZrbzJX?=
 =?utf-8?B?VHpiRlZDTWF5cmNxVDRBVDlmWHNZejF6WkIycE9mWmFNWGV0N2dGSHdJMzhZ?=
 =?utf-8?B?ZXFKK0xwdlA1WGFGWW02RlJBeGdFMFBjOHdXNk5oWHV1ZnA1RTY3ZlY5R2N4?=
 =?utf-8?B?MTJYL21QR1h0Q3VnUDdySTVqNmk4Q2psVWxTNDdzcmJwT2xZZW9RUDVibEJI?=
 =?utf-8?B?QTY1RXZQTE9vOE1ZbHFUWGxUMXZMS1JDWkFFN05PcklkUXo0SDBMSithaWgy?=
 =?utf-8?B?K1JoYTV5V1BON2ZkR3NqcGc4Yy9uVmpVUy9lYlU4N3p1VjhLeGxsWVRITlVt?=
 =?utf-8?B?anRSVEdYc1ZSMjhvM0NtU0RuVjk1WkhST2k5cW9tTFN5RTBOV3ZpbVFVYTZq?=
 =?utf-8?B?c0F6VDEyY29CRTlNcWxTajg4bVZVNy82MWUvcm5TdE01VWFtY28yaVpmOS9B?=
 =?utf-8?B?WUNmT1VxVnd0RUx0VjAzZVFkUGF6N3R5Qk14SHk2YWwveGUwRG1NSVAxQ0lw?=
 =?utf-8?B?S1NIVnBTeWk1TWdHVjloME02d1BoUWord0JWUTlDWktzTnBSdEdGZmpFNGRk?=
 =?utf-8?B?NkxWb1FXd1ZCSk5wdC9KMWNaeUJxR2dVZEZaWlYwZ1NrbnE4VVllZ2FPNzZy?=
 =?utf-8?B?N3pCNktXVnpxSHMyNWtwd3UySGhyVU4vekJHVG56dGRBVEVSWk9rSVp1K3Rm?=
 =?utf-8?B?aHR6aWhpT05RdUpnTy8vcCtwc2U3WENLeW92dEo1cWhhdmN3UWVCL0duOXVC?=
 =?utf-8?B?bEtxbGcrekd1VTNaVWtwcUhlajFONDVQSktJa1gwaXM5ZGlHYjU5aFhmdkNG?=
 =?utf-8?B?NGlwUlV2Z1NkbjNIWDZwWWZDMklaK1RuaFQzbEtqOFRUbTVoL0t5dGI4M2xF?=
 =?utf-8?B?aEdBbS9pT2FIMjB3cWtkNkRlVUJxL0NTbnJYVmUrM3JxaHRhcndOdE5xTkto?=
 =?utf-8?B?U2t5Mkh5cEJuelFsUU9kRXgxelhYVThvU0ZKeElVdmpJaE1xUUJOUmt2eGFI?=
 =?utf-8?B?S1doYVJxUmdybEFxTjh5ZCtMMENRVk9EMTNhYVY3MVVLR1o2eVEyQUFLc3dk?=
 =?utf-8?B?ZFlQS211WjBHdXFPTG5WcFhxbTRWcytSeDV6dUlBR2s0b05POGZSbGtPdnIv?=
 =?utf-8?B?N1FYZHRtTkpWTnR4cUk2QT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WVdRb1NsNXNqZ0k3b3B3aWdNNGh4SnlTZ3BEbUdkV3lKbkRadVNBNTZOb1NB?=
 =?utf-8?B?ZklWb2o3RXdOV1pLYlljSVJBMlNMMUkxeFZxcTJncEhRaFg5YUR5MGJWVmJY?=
 =?utf-8?B?eDI4cTdaK0NXa1U5VTZmYVRId2drVkF5M0l6ME9zUG8xOEdPblUyRC9tYUF1?=
 =?utf-8?B?WVVvZ2pHdFQrYS8wWktodlNiL25Bd3JNV0tDMkM1SnNpN0t3Q1B2bjc2UGZ1?=
 =?utf-8?B?VGJ6aTZEVmJSSm9nRWNvSE5sdU5uZFRFYVJ1ZVNFNnZkVExvUC9Ga2VFS3ZK?=
 =?utf-8?B?T3RhVDkxTkVZeHpMTS8xOVRDdkphM25hSWoraDV4Vno5WHFqaDdOR2NIclU5?=
 =?utf-8?B?R0dQZk9neHU0L3dWdmtvU3FZRkJBcGwrVWE3SDlQRFlYeElBblQ3OGRBRUFH?=
 =?utf-8?B?akQwa1VIQVNDNHliWDlMVHg1UFIwdmdhanhROFdheUhnOUpFaWxZMzZMOGxh?=
 =?utf-8?B?UTB6UFlNcGw5ODdyYUZ0TWd2SUxqUHJ3M0xMYytNQ29TT2xTbWtUTFl1NUlG?=
 =?utf-8?B?V1RDYjcrQ0hmZktHczhIUE4vMVBZTEpPYSs4SXZyMFJSYlFCTThldVp6WFQy?=
 =?utf-8?B?WkFqa2tuZFpWSGJKU3dqSTcyR2lRek51N0ZrbnRPTG1lWHVkbjBFTFJIVXpB?=
 =?utf-8?B?bmRhSkNjWC9BMHg3NjNPcFJVcTA3bCtKV0dKd00xNy9qMU5IU08yelBWeU0x?=
 =?utf-8?B?eDMxbUM3eDN0UklqSnExMk8yT0k4WDRJeU52RGszbVpWeTUrQkJ1VEhsTzlx?=
 =?utf-8?B?R0FGc1hxbG1BSDZpeHdHakttL3U1V2M0cU1OM2RtQWJCTzRpcVB3MHRRVG5X?=
 =?utf-8?B?TDJSekpDVnM0dWovNjlCQys0OTJ0NmhKcXJKN1lYN0tFcFQ4ZXo1UmRmOHJW?=
 =?utf-8?B?MVJhazZveDIraFdyY0ZMV0hiU2RIZDFReHFCZFEvdXdnSFBZTytRc2RKdHpo?=
 =?utf-8?B?TEd0dGNqZ21nNXordmVOQkFSR1puQjZZWUFzMkVkWi84dkdQb3RvU3o5VlVO?=
 =?utf-8?B?dkR6ZzIvNThCM3duTjZ0c0lQZm5Hd3RjdUgvWVpzd2RVTjU2QkhOMmlsY2Vq?=
 =?utf-8?B?d2ZRSW01TjByMkpzQkdzUjJCZWt5Y1JjVWhUNXhQTTMrSUlxZzQ5dEgrNm5G?=
 =?utf-8?B?UjVxZCtWSktDbU9oU0NOL2NvYXZmVjNsRjZocE1uNjlIZ21NV0VnS3dlT3ZI?=
 =?utf-8?B?bkpEWXlESXZpK2diL2hoTXRZRGVnK3hTOUgxcFkvMVhqOEZkZGhKd2pYWEwr?=
 =?utf-8?B?VDY4Vkh5WXU5dXRncmV4d25BL1ZENDdaMFlxZFM1OFVQTUtuZDc0bzNOUzd4?=
 =?utf-8?B?akphV1BIdVBxbXBRWUc0YzR2MTloUWoweExZcFdLc3d4TVFOUHJSUy9acGND?=
 =?utf-8?B?QktTZTBxOEpGNGd0WG1TYU5JSEc4V0xQSkV6cUI4Q2Rwd0cydzE5N0hUaVY0?=
 =?utf-8?B?ZUpidHVkOW9GQS9ESXR6cWdJazhoNmxqNFZNWmt4OWpMWjVoYkpJWk5HZWVk?=
 =?utf-8?B?bUVoOTFlZllYWHRnWFV4WlBlTkFzK202bndyejg0OUhGSmZqUUNkclNLQ3pn?=
 =?utf-8?B?Yk81M1VhL0ExTFZNeWQyNkhUSmpuK0tROWVOcGRVMi9DaUlTYlhmTndjL2xi?=
 =?utf-8?B?aTFZakJNU3Z3LzRzMktCVnZTVmx5L2o5OFFJRzRYOEFTUGNTQzF6VVFKMURC?=
 =?utf-8?B?RzRWTEorc0tobnYyTFRLa2daeXI1VThXczdIeVE1ZGR6aUVzSXQ3bUFscWtt?=
 =?utf-8?B?dU5sUFlyYjFBa1FNSkpqM0hQZDRCT3lnREZjUUhwOXdDZ3Q1c21HdVF1b1l2?=
 =?utf-8?B?MnpjLzBwdDFtRWRDS2pWZVk0bGVSR1dOTE1WZ3h6N1duQzg1OE1qTlFZd1hq?=
 =?utf-8?B?M2JjOWRMd2xJR1JMUkFQQjluWVpJaWFmekJpQXRtbjgxM3hUTnhMTG1PUkI0?=
 =?utf-8?B?amdXMmI2dWpBaWR6SzhjYmFXSUNmUER5SFNMeW01bnk3bkxDVmMrZStYT3ZW?=
 =?utf-8?B?ZzJTaWp2aVdjR084QzMvMitCVGVvTUlkQ1F4MjRWa2o4VHZPY293VDdkYmVh?=
 =?utf-8?B?ZVhBOCt0SkRlbkh6aFhsWGJQbE02QnYzaXhWNlJTQldJZm00U2FUcVBVSzRW?=
 =?utf-8?Q?Udgo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <24906CDB39577B4E8F9CD30A939A50BA@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02c9b6b4-904d-42fa-6879-08dc7fac7197
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2024 06:56:19.6541
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x2ZAuuHeHTXH5+oPxCaU3i3Fe3Fj+KvTscSDIK/H83hXPbMpHLy8IU+t90daCknn4RPus1eT9dUjlOajxYUBvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8989

T24gMjAyNC81LzI5IDE0OjMxLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjkuMDUuMjAyNCAw
NDo0MSwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gSGksDQo+PiBPbiAyMDI0LzUvMTcgMTk6NTAs
IEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDE3LjA1LjIwMjQgMTM6MTQsIENoZW4sIEppcWlh
biB3cm90ZToNCj4+Pj4gT24gMjAyNC81LzE3IDE4OjUxLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+
Pj4+IE9uIDE3LjA1LjIwMjQgMTI6NDUsIENoZW4sIEppcWlhbiB3cm90ZToNCj4+Pj4+PiBPbiAy
MDI0LzUvMTYgMjI6MDEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4+PiBPbiAxNi4wNS4yMDI0
IDExOjUyLCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+Pj4+Pj4+ICsgICAgICAgIGlmICggZ3NpID49
IG5yX2lycXNfZ3NpICkNCj4+Pj4+Pj4+ICsgICAgICAgIHsNCj4+Pj4+Pj4+ICsgICAgICAgICAg
ICByZXQgPSAtRUlOVkFMOw0KPj4+Pj4+Pj4gKyAgICAgICAgICAgIGJyZWFrOw0KPj4+Pj4+Pj4g
KyAgICAgICAgfQ0KPj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4gKyAgICAgICAgaWYgKCAhaXJxX2FjY2Vz
c19wZXJtaXR0ZWQoY3VycmVudC0+ZG9tYWluLCBnc2kpIHx8DQo+Pj4+Pj4+DQo+Pj4+Pj4+IEku
ZS4gYXNzdW1pbmcgSVJRID09IEdTST8gSXMgdGhhdCBhIHZhbGlkIGFzc3VtcHRpb24gd2hlbiBh
bnkgbnVtYmVyIG9mDQo+Pj4+Pj4+IHNvdXJjZSBvdmVycmlkZXMgbWF5IGJlIHN1cmZhY2VkIGJ5
IEFDUEk/DQo+Pj4+Pj4gQWxsIGlycXMgc21hbGxlciB0aGFuIG5yX2lycXNfZ3NpIGFyZSBnc2ks
IGFyZW4ndCB0aGV5Pw0KPj4+Pj4NCj4+Pj4+IFRoZXkgYXJlLCBidXQgdGhlcmUncyBub3QgbmVj
ZXNzYXJpbHkgYSAxOjEgbWFwcGluZy4NCj4+Pj4gT2gsIHNvIGRvIEkgbmVlZCB0byBhZGQgYSBu
ZXcgZ3NpX2NhcHMgdG8gc3RvcmUgZ3JhbnRlZCBnc2k/DQo+Pj4NCj4+PiBQcm9iYWJseSBub3Qu
IFlvdSBvdWdodCB0byBiZSBhYmxlIHRvIHRyYW5zbGF0ZSBiZXR3ZWVuIEdTSSBhbmQgSVJRLA0K
Pj4+IGFuZCB0aGVuIGNvbnRpbnVlIHRvIHJlY29yZCBpbiAvIGNoZWNrIGFnYWluc3QgSVJRIHBl
cm1pc3Npb25zLg0KPj4gQnV0IEkgZm91bmQgaW4gZnVuY3Rpb24gaW5pdF9pcnFfZGF0YToNCj4+
ICAgICBmb3IgKCBpcnEgPSAwOyBpcnEgPCBucl9pcnFzX2dzaTsgaXJxKysgKQ0KPj4gICAgIHsN
Cj4+ICAgICAgICAgaW50IHJjOw0KPj4NCj4+ICAgICAgICAgZGVzYyA9IGlycV90b19kZXNjKGly
cSk7DQo+PiAgICAgICAgIGRlc2MtPmlycSA9IGlycTsNCj4+DQo+PiAgICAgICAgIHJjID0gaW5p
dF9vbmVfaXJxX2Rlc2MoZGVzYyk7DQo+PiAgICAgICAgIGlmICggcmMgKQ0KPj4gICAgICAgICAg
ICAgcmV0dXJuIHJjOw0KPj4gICAgIH0NCj4+IERvZXMgaXQgbWVhbiB0aGF0IHdoZW4gaXJxIDwg
bnJfaXJxc19nc2ksIHRoZSBnc2kgYW5kIGlycSBpcyBhIDE6MSBtYXBwaW5nPw0KPiANCj4gTm8s
IGFzIGV4cGxhaW5lZCBiZWZvcmUuIEkgYWxzbyBkb24ndCBzZWUgaG93IHlvdSB3b3VsZCBkZXJp
dmUgdGhhdCBmcm9tIHRoZSBjb2RlIGFib3ZlLg0KQmVjYXVzZSBoZXJlIHNldCBkZXNjLT5pcnEg
PSBpcnEsIGFuZCBpdCBzZWVtcyB0aGVyZSBpcyBubyBvdGhlciBwbGFjZSB0byBjaGFuZ2UgdGhp
cyBkZXNjLT5pcnEsIHNvLCBnc2kgMSBpcyBjb25zaWRlcmVkIHRvIGlycSAxLg0KDQo+ICJucl9p
cnFzX2dzaSIgZGVzY3JpYmVzIHdoYXQgaXRzIG5hbWUgc2F5czogVGhlIG51bWJlciBvZg0KPiBJ
UlFzIG1hcHBpbmcgdG8gYSAoX3NvbWVfKSBHU0kuIFRoYXQncyB0byB0ZWxsIHRoZW0gZnJvbSB0
aGUgbm9uLUdTSSAoaS5lLg0KPiBtYWlubHkgTVNJKSBvbmVzLiBUaGVyZSdzIG5vIGltcGxpY2F0
aW9uIHdoYXRzb2V2ZXIgb24gdGhlIElSUSA8LT4gR1NJDQo+IG1hcHBpbmcuDQo+IA0KPj4gV2hh
dCdzIG1vcmUsIHdoZW4gdXNpbmcgUEhZU0RFVk9QX3NldHVwX2dzaSwgaXQgY2FsbHMgbXBfcmVn
aXN0ZXJfZ3NpLA0KPj4gYW5kIGluIG1wX3JlZ2lzdGVyX2dzaSwgaXQgdXNlcyAiIGRlc2MgPSBp
cnFfdG9fZGVzYyhnc2kpOyAiIHRvIGdldCBpcnFfZGVzYyBkaXJlY3RseS4NCj4gDQo+IFdoaWNo
IG1heSBiZSB3cm9uZywgd2hpbGUgdGhhdCB3cm9uZy1uZXNzIG1heSBub3QgaGF2ZSBoaXQgYW55
b25lIGluDQo+IHByYWN0aWNlIChmb3IgcmVhc29ucyB0aGF0IHdvdWxkIG5lZWQgd29ya2luZyBv
dXQpLg0KPiANCj4+IENvbWJpbmluZyBhYm92ZSwgY2FuIHdlIGNvbnNpZGVyICJnc2kgPT0gaXJx
IiB3aGVuIGlycSA8IG5yX2lycXNfZ3NpID8NCj4gDQo+IEFnYWluIC0gbm8uDQpTaW5jZSB5b3Ug
YXJlIGNlcnRhaW4gdGhhdCB0aGV5IGFyZSBub3QgZXF1YWwsIGNvdWxkIHlvdSB0ZWxsIG1lIHdo
ZXJlIHNob3cgdGhleSBhcmUgbm90IGVxdWFsIG9yIHdoZXJlIGJ1aWxkIHRoZWlyIG1hcHBpbmdz
LA0Kc28gdGhhdCBJIGNhbiBrbm93IGhvdyB0byBkbyBhIGNvbnZlcnNpb24gZ3NpIGZyb20gaXJx
Lg0KDQo+IA0KPiBKYW4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

