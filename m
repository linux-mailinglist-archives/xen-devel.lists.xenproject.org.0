Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B80BA3365
	for <lists+xen-devel@lfdr.de>; Fri, 26 Sep 2025 11:46:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1131383.1470501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v251b-0007cH-Jb; Fri, 26 Sep 2025 09:45:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1131383.1470501; Fri, 26 Sep 2025 09:45:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v251b-0007ZU-GS; Fri, 26 Sep 2025 09:45:59 +0000
Received: by outflank-mailman (input) for mailman id 1131383;
 Fri, 26 Sep 2025 09:45:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cR/D=4F=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v251Z-0007ZN-Mx
 for xen-devel@lists.xenproject.org; Fri, 26 Sep 2025 09:45:57 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 985db177-9abd-11f0-9d14-b5c5bf9af7f9;
 Fri, 26 Sep 2025 11:45:55 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 CH3PR12MB8187.namprd12.prod.outlook.com (2603:10b6:610:125::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.10; Fri, 26 Sep 2025 09:45:49 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.9160.011; Fri, 26 Sep 2025
 09:45:49 +0000
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
X-Inumbo-ID: 985db177-9abd-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iDXp5Fh0K51BKR1v8GAqIuiEKsJrWuBK98ii/Igpx2rQBqklH4bEshgyAZVrDk8olbqjZUVrtF+NEpL0U7qSTCyjx7yaBWoGk/1m4DSX4SkU6ddtGngJyvV2X2zOAuRspB3ntfLDpMTh72XVOvLA8nHrsAve0LsdIvaAjRZxo2f5Cc6Vd5fDz2UAWbsMO7S72Vmta3RBD8SvdUm5/GLColWrPK35/FoeHbY7dg71+BiY7G05sOOFOBMJuN4CpEucEYZnCUSqYukldVfdwZQAx2LgiB+X9iEcH2vsPf9gwCD12MeVyetlpF9/VxuK5HtGnnJFq2/fQMVWxW3MqyPeLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N8ayv8MzhWLcUDGe5sHhGVo9rUojz+kJ07hGrIQs6og=;
 b=uFf563sDTT3u7BYKM3Ir80Fjr33w6hNi+N4kCucYEbGKsjjOFZOBa3xhCMNlQnha56xtHu5TH6pxiAv6xtYxJhTgeKur/vRqdfU/MSUoTd/+5dWSQhIAkZM/BjCUXMa85/udyJbB0stCylURVEGjzuPa6JDDbrVppWTGvZBipwPpROiMUYT+ZTbiarpXdjv6R+6inxIhGZfUveUTKTbbaUIcZQAUCWIFcrqdShRFBpQwYcp8scE8movLniNzBxAc+0PuoFs2v/JJlksvjOQE02zUhPv+EhrfJQkifndNQ1kgVr5UllatK+PrOVQYS4zlM1drPJSC9/HJtUB5L7Peow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N8ayv8MzhWLcUDGe5sHhGVo9rUojz+kJ07hGrIQs6og=;
 b=OzF2IqsPzuu1lwUx+MRIgvHCaxexhRVy6fZIc5rAboyzZwl9f0zAkkmemyv6yDiG6djTDIasFu6ysQmh80SrKB/8p5R7C69BXOE9bTEFApBqqb83Q1xi7VAOUyCF5xNopKiXng16yBzWlnZzyCnL+he/VghykTyjgAMBG739Z4g=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, "Orzel, Michal" <Michal.Orzel@amd.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Rahul
 Singh <rahul.singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 20/26] xen/domctl: wrap iommu-related domctl op with
 CONFIG_MGMT_HYPERCALLS
Thread-Topic: [PATCH v2 20/26] xen/domctl: wrap iommu-related domctl op with
 CONFIG_MGMT_HYPERCALLS
Thread-Index: AQHcIiYdoRXj4d7euECxgRPy0m3CSbSN4o2AgBdh+wA=
Date: Fri, 26 Sep 2025 09:45:49 +0000
Message-ID:
 <DM4PR12MB84516521B6DB2E44D64AE209E11EA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-21-Penny.Zheng@amd.com>
 <0af66ec5-a53e-4f09-96bd-3cedb7419006@suse.com>
In-Reply-To: <0af66ec5-a53e-4f09-96bd-3cedb7419006@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-09-26T09:03:32.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|CH3PR12MB8187:EE_
x-ms-office365-filtering-correlation-id: 211a46ef-9474-4124-feb9-08ddfce179c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?bDBaWmp0N2ZWU3p2dWU4TkRsQW9DZVBQQW1ITENPeFVCRmEwVXdqM1NSUGNK?=
 =?utf-8?B?c2ovUnRMUVlkeHZXUmhhTnVGZ05KbW8xYnJMVHlmNHpFaXpWbFZNLy9HQ0Vz?=
 =?utf-8?B?VlpIVDhCT011MCtOOElBblhCWnNXMXhidFl0T2M1clhDLzg1ZnJuOVdRSWJa?=
 =?utf-8?B?YzFXcWprK3ptUXhYUGw2d3hkV0d5bGU5cXUyRXM4RlQ0TkJ0enJPbDZiOE5B?=
 =?utf-8?B?VUZhUnRhbVpEb0RWbnE1c0tXK2FBS3kycWx2WC9lYktTNXU3SEdXcmh1anFr?=
 =?utf-8?B?TUM1MXBJTTA2bC9NaE8wMUdMMXhKc290V3VLMWg1WWZLQXk5ZW1ZaXVncm56?=
 =?utf-8?B?amVyYldzL3FPWTlCYm9NMUY0Ullaa3ljcEE4OFd6RFJrQ3BubklnU1hvTkU5?=
 =?utf-8?B?dDhqRHBpcEpjN3lqZU1xOEg0ZUg0ZTVnZmxLQUxWZVpWSkVqdnI1NUpDNkdX?=
 =?utf-8?B?TzBkSXI0bk9aWDJpdDhiQkVwNUZWMkxVOWdGMTBCeTE4cFdRSks0Q1g5UUJC?=
 =?utf-8?B?elB3SzlKcTFJT09JczI1dDZ4aXAyTlBOdFFNMXBnMU9WY2RsdVFmRllJUXNQ?=
 =?utf-8?B?Y3hVaHcyOWxDUGRTRnVONkVodElYdjJ2UUdzSzlUSVZPeUdpT25yT1JVdnhM?=
 =?utf-8?B?bVVsQ3l6RnlaM3lVaEMwYXRNbzZXenZGR0RWd05VaHU5M1hDbWp3cVFYN1lR?=
 =?utf-8?B?MVlzUHRZRENoOWFid1l3S216UHpkRXp3djEvb0NEM2IwU2s3TUlmTFAzem1H?=
 =?utf-8?B?LzhYUENmWlREK3pwRURwa3JzcWRBVnd1MjFrQVN4U1M0cTVxMGV2b05CNThU?=
 =?utf-8?B?SGZxbUV5SnRkcG43TU9zWWZRSnppblpNQTB3Q0N6TjVVcHlhU3BGNmhVNjVt?=
 =?utf-8?B?VGwvVzk5dmNubWxzSlVmWW1BS0lCWnk2WUUvNTU2TWVDcGQwK3dpWEI0b1Aw?=
 =?utf-8?B?MXR4ejIxaVNxSzF6VU9TVkx2aWkrUVI2dzV3RG1RcTIySitFSENHanowY09v?=
 =?utf-8?B?Z0VwY2JQUUxCa0JCYTFxOXFTQ3ArOGRNd2NKZTNHRnpyZ1NLWU5uQ3l1V3JS?=
 =?utf-8?B?ZzV4OFBSM0Q1SE9oSnJHbkpGYVNqN05nSDRYbXVOWjIvMDdHMEUzWVhrM01J?=
 =?utf-8?B?ZndxM05GYm5DSDBqbkxJRXZnREl1ZEd3MElxKzZ3ZWxsTUxKa20zZlBqUWo5?=
 =?utf-8?B?MklFLzhUL2hySDV6RnZoVlkzY1lLZloycm5ZUVRnRlJHRXhJSU5wd2I1N3U2?=
 =?utf-8?B?aXV4dnVCc1lPYXBxTC9FWFhVSDlrVGoyV1JReGtnVGQvQTZHaFZlSXF5ZTI4?=
 =?utf-8?B?OXdZUCtlRnhGbVZrUWE4bW9BQ3NydDl0a1pXTVVRSVpsUEFqeWhNak1QVVNj?=
 =?utf-8?B?c1drQ1B4bUl2WDBjcFl0aFpuSmZScVlLNHk1bjlESkdBUkNEb1YzdGVCVVZM?=
 =?utf-8?B?UVF4ekNiK2NSa3o3MENYNWxQUFRzemlKd09IYzRqM0JXMVV3b0Ntak9UZHBB?=
 =?utf-8?B?cXNMcEZnWVM5TTJvZE5uZmdhN2loSnZUMlFacEJZN1RMTkZCM08rbDhnNXVP?=
 =?utf-8?B?ZVhKMEdHM21oRDNhMWxxVGRxdmZFNk5TKzlWUCtaaFM1SGpSOVptQjdCL1pU?=
 =?utf-8?B?ZWhpUVF2b3JwL3d4TXZGcmJWeWlIN0d1YzFXbzQ3RXBpQkNSakZvMWtIcDBT?=
 =?utf-8?B?VUZoZWdvM1VwOVU2bEZrSUJYelpXVE1KYW16cFdJMzVMcjVTZGdYbHQrbk1R?=
 =?utf-8?B?SEpFVWJPSmhyRTRLaDRTNjBxRnVsM0pudjQrS0ozNy9BWmlQRkRsV1FTU01T?=
 =?utf-8?B?ZStlUFc1UWpPZzErUlB2SGdsMGhzZnBQZHIzOGhlZ3lQYnozak9wVEZTOHpI?=
 =?utf-8?B?bGtCWUh2ck5BcXFFZlVSaWRUNVpndHFEdXRweWsxelBaWCs5Q01GK0xBYXl6?=
 =?utf-8?B?SGVubHl2N3FQdTdUc1dzS29BOFVEa0RFRy9rbGpSUTByM2Q3UzVRN2h6dUpU?=
 =?utf-8?Q?K6dWtyWiipB9AV5M0cuKfxFN2PY1Vo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WVBISDFmcTVwM1J3cVgyalhYMGlZdndMZzhhNENXMERwWnhaN3gyRXI2cVJ3?=
 =?utf-8?B?aDR5THdKM0RMc1dqKzhJZ0g3bHdEbHNWbEZadnZ5SHpPRkxjSEdkTnRVNkg3?=
 =?utf-8?B?UVRoeFJmRDZ0SU9MNTdnZ08zR0hoMjVtR0d6dGJGaDRmNksxVHI2NVo1MFBG?=
 =?utf-8?B?ZzBzb2NyTkVielkrU3c0ZU1NREFjekYzV1FUQ2U3Uk1kMjcrb2pidS9RbDls?=
 =?utf-8?B?RmdOVUt0Q0RzWEpwTnhzRGdzZ0x5OEF2TmRWNWtuTURQOXlabEpnWituZWEy?=
 =?utf-8?B?NTBEVTM4eGxkblU0U01KZm1kWnV2a0VudnNxWS8rTVBMOW4yUldJaXFheVN6?=
 =?utf-8?B?N05udlFaN1BEbjdyZzdKVlNzVy80ZVMvN3g2WUNZY250MXdkdXBaeWZuY3Mz?=
 =?utf-8?B?TGNqSEYzcitqM3N0bFd0cUFsVTZLN2MrcEF3SHcvcFBrLzhDV1ZsZHFOZ05x?=
 =?utf-8?B?Rm40eDRQVVArYlpLT2hZQVBJaXRlSGpXVlFrb3FqS0dHMWk3SVZvMDZJbWlj?=
 =?utf-8?B?OTNmWjQ3MzlVb0ZZRVI5NHJHdUVLeHJnYklCV1A4Q3dKODFId1IxVUhCekww?=
 =?utf-8?B?a3U1UTdpY1BOd3lHSmI1OWxFRVlCNFdyMGdxV1pQdHlxekdiSmFoV3phS05N?=
 =?utf-8?B?enBGSDg0cTQzanBQd0h4MEErN3VzZ3ptOVFvQ3JRZVo1UGZUUmxIcGtRZjFx?=
 =?utf-8?B?WXpxcEhBZDQ0OE9zVlhhVUp4MnJ6T2J5anJ3bFZ3cUZ5MkZuVURGZGxCazVz?=
 =?utf-8?B?Y3dVR1hnWnNIV2VUNWIrQURXdEVWZVZkd0xuREZacURoR0VMWFNkdE9jcGRO?=
 =?utf-8?B?MGtlMEdYU29PdHJqSTN3RE40dDNzcllNdDRTVlRnWGRvQ2FNM2tVRm95U2ZM?=
 =?utf-8?B?MHVkODlEWnNTYjR0Vlo2eXZmMGpxamh1U2JHOTFRaXB2UnZRNkQvVDAwckha?=
 =?utf-8?B?dU5MNkNiRE1BZHVNQ05ac2xXbFZwL1d4bklWeGd1UUJJS0dMaXY0V1l4Y3Nm?=
 =?utf-8?B?ajdGcGZIcEZtNGFXeG9qNDQvamRsYUk1SUY0ZEg1RE4rNzNyaFVhMXg1UlRn?=
 =?utf-8?B?WTVPUG4wRFRyeGdCc0x0L0puNUZxWTFYS1ZtVEhZWm1uTHN2bWZ6eUxJYkxC?=
 =?utf-8?B?UnUvbUhSb0NudmVEaUZ6cEUxcHlkSVZoTW5HZDduVDI3NDlFVzBtMGNLQWZz?=
 =?utf-8?B?RVVRRVgvYnIyd0NwQlNTd2xpZVlUOFpIcHhSYWFudk9zcEVPNHNFT2xrazJM?=
 =?utf-8?B?ZXIzOUhFZGJaRFB4RjFUc0UxVWlDYnBpQ0F3am52Y0tkY1RaNmsvY0hTZVZj?=
 =?utf-8?B?KytJY1ZwVG9mWEE3OXlCT2ZUa1ZJNDZ2dFI5R2YrZ2hoYzVIanAzbCs3cjBY?=
 =?utf-8?B?MzFiUGdUR2ZpTU1HaGdGS1g1MEF0RW5Lcno0QWRUUGJYL0tlUlJCV21wRTFI?=
 =?utf-8?B?YUtOaTV1KzNPY1NnNW9Tc1d2TXBvSEVBUFd3OFFnRUtSRjZOcitWY010ZEgy?=
 =?utf-8?B?VFJhNEtTMk1oWDZEYXlSVUh0cjlrMnQ3cmxyYTRvNGJNTFJZUWYva3I1V2FK?=
 =?utf-8?B?cXNncTFCWTZqeENHVEZTS2w4L0lUMFZyc2taWlpLemhGVnR6ZFpmTWpjYkNL?=
 =?utf-8?B?Wi9rUXZuNEhwRGorVHNSbnZsaHA5MXhuUXI3YW13R080Vjh6dENNQmlhdlFk?=
 =?utf-8?B?OGltSmlkbHBhZG8vVzVYOXB4RkZVWFM3T244TGgreWozM2poQ1FBSkVEcUUv?=
 =?utf-8?B?N1oxSjFlYUFoY3J4eVcxNHNXSWhiNzZ1ZTlMZUVPby9VSmZDZmRWRXEwQ0kx?=
 =?utf-8?B?b0g2cnlOUVFWTzZLc1RqQWpWL2ZFRHg0NWg1dHRIOFQ3aHZUS0J0ZDhJQmxi?=
 =?utf-8?B?WWNkQm5MN0x0dzFCNy9mbGpJaFdvLzNrN25nMzdJV3JnR2FwaGNSZUdSWkZM?=
 =?utf-8?B?clhxS05nODJKNWhpYkNKV2tLVWRkS3FPYUxLdUdHc0NIaFhhc0UyODZmZXZS?=
 =?utf-8?B?dDNmOGZDayszTW5pRTFOcDMvSUUyZWZqZ2FqY2hZa0lCcVVBbXcvemhiakxt?=
 =?utf-8?B?dVltR05kcXhsU1pSZWN5NVBGa3RiTUR2YXRia1ZpN0xjeHg0THg3dC84T1B4?=
 =?utf-8?Q?FANs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 211a46ef-9474-4124-feb9-08ddfce179c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2025 09:45:49.6807
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kmThXqmQ4rtQhJR0FNEYxo4Y3XwthQvhN9sJpA9AS15Wzubt8Wx+eQiaswJ+eV+LIMzmV9CjZrysJSWZ5sSTPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8187

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIgMTEs
IDIwMjUgNzo1OSBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0K
PiBDYzogSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkN
Cj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3Jn
PjsgQmVydHJhbmQgTWFycXVpcw0KPiA8YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPjsgT3J6ZWws
IE1pY2hhbCA8TWljaGFsLk9yemVsQGFtZC5jb20+OyBBbmRyZXcNCj4gQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPjsgQW50aG9ueSBQRVJBUkQNCj4gPGFudGhvbnkucGVyYXJkQHZh
dGVzLnRlY2g+OyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47DQo+IFZv
bG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT47IFJhaHVsIFNpbmdo
DQo+IDxyYWh1bC5zaW5naEBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMjAvMjZdIHhlbi9kb21jdGw6IHdyYXAgaW9tbXUt
cmVsYXRlZCBkb21jdGwgb3Agd2l0aA0KPiBDT05GSUdfTUdNVF9IWVBFUkNBTExTDQo+DQo+IE9u
IDEwLjA5LjIwMjUgMDk6MzgsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+IEZ1bmN0aW9uIGlvbW11
X2RvX2RvbWN0bCgpIGlzIHRoZSBtYWluIGVudHJ5IGZvciBhbGwgaW9tbXUtcmVsYXRlZA0KPiA+
IGRvbWN0bC1vcCwgYW5kIHNoYWxsIGJlIHdyYXBwZWQgd2l0aCBDT05GSUdfTUdNVF9IWVBFUkNB
TExTLg0KPiA+IFRyYWNraW5nIGl0cyBjYWxsaW5nIGNoYWluLCB0aGUgZm9sbG93aW5nIGZ1bmN0
aW9ucyBzaGFsbCBhbGwgYmUNCj4gPiB3cmFwcGVkIHdpdGggQ09ORklHX01HTVRfSFlQRVJDQUxM
UzoNCj4gPiAtIGlvbW11X2RvX3BjaV9kb21jdGwNCj4gPiAgIC0gaW9tbXVfZ2V0X2RldmljZV9n
cm91cA0KPiA+ICAgICAtIGFtZF9pb21tdV9ncm91cF9pZC9pbnRlbF9pb21tdV9ncm91cF9pZA0K
PiA+ICAgLSBkZXZpY2VfYXNzaWduZWQNCj4gPiAgIC0gYXNzaWduX2RldmljZQ0KPiA+ICAgICAt
IGludGVsX2lvbW11X2Fzc2lnbl9kZXZpY2UvYW1kX2lvbW11X2Fzc2lnbl9kZXZpY2UNCj4gPiAg
IC0gZGVhc3NpZ25fZGV2aWNlDQo+ID4gICAgIC0gcmVhc3NpZ25fZGV2aWNlX293bmVyc2hpcC9y
ZWFzc2lnbl9kZXZpY2UNCj4gPiAtIGlvbW11X2RvX2R0X2RvbWN0bA0KPiA+ICAgLSBpb21tdV9k
ZWFzc2lnbl9kdF9kZXZpY2UNCj4gPiAgICAgLSBhcm1fc21tdV9yZWFzc2lnbl9kZXYvYXJtX3Nt
bXVfcmVhc3NpZ25fZGV2DQo+ID4gICAgIC0gaXBtbXVfcmVhc3NpZ25fZGV2DQo+ID4gICAgICAg
LSBpcG1tdV9kZWFzc2lnbl9kZXYNCj4gPiAgICAgICAgIC0gaXBtbXVfZGV0YWNoX2Rldg0KPiA+
ICAgLSBkdF9maW5kX25vZGVfYnlfZ3BhdGgNCj4gPiBXcmFwIFhFTl9ET01DVExfYXNzaWduX2Rl
dmljZXt0ZXN0X2Fzc2lnbl9kZXZpY2UsZGVhc3NpZ25fZGV2aWNlLA0KPiA+IGdldF9kZXZpY2Vf
Z3JvdXB9LWNhc2UgdHJhbnNpZW50bHkgd2l0aCBDT05GSUdfTUdNVF9IWVBFUkNBTExTLCBhbmQg
aXQNCj4gPiB3aWxsIGJlIHJlbW92ZWQgd2hlbiBpbnRyb2R1Y2luZyBDT05GSUdfTUdNVF9IWVBF
UkNBTExTIG9uIHRoZSB3aG9sZQ0KPiA+IGRvbWN0bC5jIGluIHRoZSBsYXN0Lg0KPiA+DQo+ID4g
U2lnbmVkLW9mZi1ieTogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFtZC5jb20+DQo+DQo+IEFw
YXJ0IGZyb20gYWxsIG9mIHRoZSBhYm92ZSBhbm90aGVyIGFzcGVjdCBiZWNvbWVzIGFwcGFyZW50
IGhlcmU6IFNvbWUgY29kZSBpcw0KPiBjYWxsZWQgYXQgYm9vdCB0aW1lIG9ubHkgb25jZSBtYW5h
Z2VtZW50IGh5cGVyY2FsbHMgYXJlIGNvbXBpbGVkIG91dC4gU3VjaCBjb2RlDQo+IHNob3VsZCB0
aGVuIG1vdmUgdG8gLmluaXQudGV4dCwgc28gd2UgbWF5IG5lZWQgdG8gZ2FpbiBzb21ldGhpbmcg
bGlrZQ0KPiBfX2luaXRfb3JfbWdtdC4gSW1vIHRoYXQgd291bGQgd2FudCBkZWFsaW5nIHdpdGgg
cmlnaHQgaGVyZSwgYnV0IEkgY2FuIGltYWdpbmUNCj4gb3BpbmlvbnMgdG8gZGlmZmVyIG9uIHRo
aXMuDQo+DQoNCkxpa2UgaGFuZGxlX2RldmljZSgpIC0+IGlvbW11X2Fzc2lnbl9kdF9kZXZpY2Uo
KSwgb25jZSBNR01UX0hZUEVSQ0FMTFM9biBjb21waWxlZCBvdXQgdG9vbHN0YWNrIHNjZW5hcmlv
LCB3ZSBvbmx5IGhhdmUgdXNhZ2UgYXQgYm9vdCB0aW1lIGZvciBkb20wbGVzcyBvbiBhcm0uIEFu
ZCBhbHNvIHNldF9nbG9iYWxfdmlycV9oYW5kbGVyKCkgaW4gdGhlIHByZXZpb3VzIGNvbW1pdC4u
LiBBbmQgZG9tYWluX2NyZWF0ZSgpL2RvbWFpbl90ZWFyZG93bigpLi4uDQpJIHJlbWVtYmVyZWQg
dGhhdCB3aGVuIGNoZWNraW5nIGVhY2ggc3dpdGNoLWNhc2UtYmxvY2sgdW5kZXIgZG9fZG9tY3Rs
KCksIGZvciBzb21lIG9mIGl0LCB0aGUgcmVmZXJlbmNlcyBjb3VsZCBiZSBzaW1wbHkgZGl2aWRl
ZCBpbnRvIHR3byB3YXlzOiB0b29sc3RhY2sgYW5kIGJvb3QtdGltZS4gSSBzdWdnZXN0IHRvIGRv
IGl0IG9uIGEgZm9sbG93LXVwIHBhdGNoIHNlcmllIHRvIGdvIHRocm91Z2ggZG9fZG9tY3RsKCkg
YWxsIG92ZXIgYWdhaW4uDQoNCj4gRnVydGhlcm1vcmUsIHdoaWxlIGxvb2tpbmcgYXJvdW5kLCBJ
IG5vdGljZWQgdGhhdCB0aGVyZSdzIGR0X292ZXJsYXlfc3lzY3RsKCksIGVudGlyZWx5DQo+IHVu
Z3VhcmRlZCBkZXNwaXRlIHRoZSBlYXJsaWVyIHN5c2N0bCBzZXJpZXMuIFlldCBpZiB0aGF0IHdv
cmsgKGFuZCBNaXNyYSBjaGVja2luZykNCj4gYXNzdW1lZCBPVkVSTEFZX0RUQj1uLCB0aGVuIHRo
ZXJlJ3MgaW9tbXVfcmVtb3ZlX2R0X2RldmljZSgpIHdoaWNoIGlzIG9ubHkNCj4gdXNlZCB3aGVu
IE9WRVJMQVlfRFRCPXkuDQo+DQoNClRoZSB3aG9sZSBmaWxlIGR0LW92ZXJsYXkuYyBpcyBndWFy
ZGVkIGJ5IENPTkZJR19TWVNDVEwsIGFzIGl0IGlzIGNvbXBpbGVkIHVuZGVyIENPTkZJR19PVkVS
TEFZX0RUQiB3aGljaCBkZXBlbmRzIG9uIENPTkZJR19TWVNDVEwuIFNvLCBkdF9vdmVybGF5X3N5
c2N0bCgpIGlzIGd1YXJkZWQuDQogV2hpbGUsICB5ZXMsIEkgZm9yZ290IGlvbW11X3JlbW92ZV9k
dF9kZXZpY2UoKS4NCg0KPiBKYW4NCg==

