Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBA6C536EF
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 17:36:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160370.1488533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJDow-0005KH-IY; Wed, 12 Nov 2025 16:35:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160370.1488533; Wed, 12 Nov 2025 16:35:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJDow-0005HV-F1; Wed, 12 Nov 2025 16:35:46 +0000
Received: by outflank-mailman (input) for mailman id 1160370;
 Wed, 12 Nov 2025 16:35:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EiA8=5U=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vJDou-0005HP-Gk
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 16:35:44 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f3b0bc6-bfe5-11f0-980a-7dc792cee155;
 Wed, 12 Nov 2025 17:35:39 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by GV1PR03MB8381.eurprd03.prod.outlook.com (2603:10a6:150:54::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 16:35:34 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 16:35:34 +0000
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
X-Inumbo-ID: 9f3b0bc6-bfe5-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qpGy9EVlfunHxvtSAg5FC5ETvRb0BNGuHCXm5T35q9tmabZsSeR/zjF6VBPkg4Fmb5/nNlv7s6O9FgL554K7JcaHge9IgKImS6Ad841/jRVDtZPgapMSL62buWxucEAeq/3ptT80W9RBAy0QMRQYTYifiSJyHuKx8kjq9PE+Kd59jgSIVRc6lI7rnHldNf3TK5ZDUKDSmrEFxIxaU2dc8wEIFngbDnB4iVyDBIes0e4UTvUn2/l7AwJ4L2Bfq6oEZ2cPgSvg//6KTOJNdh6n/G8MEBWwpxDjQU+PLChI1S/ywB9Et/gqaezEFp5pki00MRZ8TW8uDk9leT4DJJL48g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zs56Xkx4v/tlIQ5LvTJU1FgUW1cUPBdnAO4M5Byl1fc=;
 b=k5nP5Mr+MDq57G6QIk9eOsncT8gY9Dg32B9xW4ljCQLMvYsIUohrHQUGJZHK1oQIKVLvhn0X281MDOAFVLcUrApofxURIL2i4/E6RmUgNBJyBLYLSg7x+KZ2O2NvNCuVAwuB3LsMQQTz4E0MKDaRaLH+GPc1geISFSl+HKvPIXvVCvqZTkWv1JuE2pU0/wEn6RrfELpMebSvgQ5nd4Zv4rxiBe+GBC+6FXMwBrnZvVmqZJ/tcIwyoGqEdPMKFEN/BU1M4jNDaNxEc2lp2+xYIu+PNOatIlQwAQTn8uEuWMuenPNg39pYGQ/iVW18D0CXLHJlhn4q81yE2ZYBRJWq2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zs56Xkx4v/tlIQ5LvTJU1FgUW1cUPBdnAO4M5Byl1fc=;
 b=f6U7iKoVB9pahCh9x3n8wGGCBdDJf8sZ+T2ZH0zYbMDixPAnEnSLB/3c6vYBgF9j1URGmLQud3kmclptIBpgftastsJq3L4EKm64YxL/KOA9AP5kJy6skqdqfh8wkeQ3kqRhxjFrWsTJtGlktIWolMN+AGUVTZojPWxtTdbkpeM2Yn/urdrSqXSXG8Rm+9Q9ckX3ct80L/VEy2UHuoVchQTLRok+M5CogWhc9/7muWOOE8Pd3oTwt00rihJZJlgRcddYc171kCDX9rgdgZ4Em+FVJ3nrrxlutmkHfblYoFu8rulYXiNkGBngmbnoqkP7v/cPBsqXVq2HayJ5NzQrAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <6468bf48-deec-4c92-8158-92d1b28580f1@epam.com>
Date: Wed, 12 Nov 2025 18:35:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v7] x86: make Viridian support optional
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20251031161716.1222956-1-grygorii_strashko@epam.com>
 <a4d3eb8d-17ea-4d3c-87ef-ba5c3477b8c3@suse.com>
 <edb590e4-340d-4a0f-9543-0dfdcc7b54b1@epam.com>
 <210edee7-8525-47a9-8191-ea7d94db5fce@suse.com>
 <0a5af540-214d-46cc-93e5-f0266bb79064@epam.com>
 <b829a9dc-ed1d-45f9-a56f-ec288e0d5523@suse.com>
 <DE6SC2RG21IK.20ONZLHO187R5@amd.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <DE6SC2RG21IK.20ONZLHO187R5@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0243.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::10) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|GV1PR03MB8381:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b98745f-ea53-425d-981f-08de22098038
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MW9kWitkSzIrejJuYUtMRHhHQ0RrU1VXZjBoWjBKUFU1cEo3MUtwZHh5WllB?=
 =?utf-8?B?Umt3T3NJMG1QQjhrcGk0VjFjU0t2OG9ZN2t0eVpPalR5cm1TNTRGR3RZRkY3?=
 =?utf-8?B?NUw4Mkk5Q2hqai9ubmZydHBmcU0yVlhnV0pUMC9oYVBMQTFQNEpWR1UrUVZI?=
 =?utf-8?B?QXYxS0RLdUo2UTNHTFF3RnltdDdMVExsa200WW1OQXdQWHBLTXN1S2wraUo3?=
 =?utf-8?B?QVVZNktkVS9HcGZKQ1RueCtsblZGWjl1bjJ1RFJHaTVOays2QlhReE9sR2Rw?=
 =?utf-8?B?TmQxazQzWW9LSW9FMzlvZ1J3Q3Y2cnVtZ256ZGFYOWxFb0tFR3NtSFJDRkx3?=
 =?utf-8?B?S2ozR0JKcCtxTmgwVnZPQklBUytlbzVieFc0RkE4VVZYL3JabURvM0RMMjlw?=
 =?utf-8?B?L240RHpvdmRHRVhxdTdHU09ZTkxVdXVoN25FUDJCNkFwaEdnNEhnUnRvUkU2?=
 =?utf-8?B?VFBuVWZpMHhOMDZ5RDZQdVZYVjlpUmpVS0tZakZKbzY0Z3NROFNQTnBUVUd5?=
 =?utf-8?B?dndONGdmS3FWVTZzN2pMdHZ2SFExRTAzN2hXRDhCM1JNYzF1YmVYYkpMWHkv?=
 =?utf-8?B?NTlKM3BPZWFQVW9Icng3TE1mV3lQU29Zc09LaEFPYVBnSHdGQURoeGJRdUdy?=
 =?utf-8?B?SEs4a21UaUUvay80YWZIQmREOTR3RnFHdit1Y2NVekNSMkNIUExidE9WaDBD?=
 =?utf-8?B?Rm5nemRiYW9zOUg2VXpEZ2s5ZUNOMk1nMjc3T05sUGsyZVhPOWdjV3ZnQkgx?=
 =?utf-8?B?OVdZNmpPczVIYTZSVTl2TGdRTTAvRkwzeWdESG84SjZMTmc1MlFIeDg2YVZR?=
 =?utf-8?B?Y0poeVRtUHJLMElkTnpYY1RLTFF3cHJ6YVM3bHg2dWtDVWxBK1hJSkpEZ2Fn?=
 =?utf-8?B?TzkxNXp1OTcyWEsrOEg1czBhYS9RTmZqNEdWSElyL1p0ZE1QS0VQL1B3OUJa?=
 =?utf-8?B?Tm9qRXN4b0NSTnhVRTZuS3lzYlEwL0dIUXZTU3NYN1VqS0k4Yk9DUnRCRHdp?=
 =?utf-8?B?T1pRcFpJMEVrUU5jZkNnK1dteGI3d3BwK01IMlYzNnFjdEJMQVB1NTRBVUx4?=
 =?utf-8?B?dU0xRXJPcGtGTGhuWUpXRDJBcUswZGNYeC9zV1locU91S2N4RG4zUDk3cE1G?=
 =?utf-8?B?Q0Rac09ZdkVjaUJmcVZpdVNHdGdRMHg5ZEMvZkJNNFlPZXZQTWo4eUtFSGNO?=
 =?utf-8?B?WVhweFRqUGppVXNkUXhhUDFPZEhrZDFMNkFQeGpqSUdDWXJmZnkrY1VFcUpT?=
 =?utf-8?B?RGVyN3M3YkdiblJ3MmExbmtIZXZ5c1VrTzlVZStxTnpZRnN2Mzk1em9ET0JM?=
 =?utf-8?B?UzFmZ1BxUDFVVFBYRDFLbXlGcnFkWlBMOGo0bVlDL05JTnRVa2ZvRjhMQUNP?=
 =?utf-8?B?bzdtdmw1QlFZcUNVVXhTUmVXZGtYSWN4SVNDZFNyVFBwOUpPNHJtQTBsV2Jl?=
 =?utf-8?B?V2ZHNlVlcnpiSHNQdWl1SWNFdE5haGlraXljQWJFazEyU3JoQUVZS04zd29U?=
 =?utf-8?B?d2w1YXQxS3hHSjlYQnM1ekJuZW8vbGRzcjlWcVFMaVJUL0pnYnVMV2lLdXZU?=
 =?utf-8?B?cmszbE51NjAyM1JQdGxHSVNrWE5PMFM3UzNsaG1IbDFGMyt3ajRqeGdJbFJ4?=
 =?utf-8?B?TDkxSGQ0R0tXVUR2RzRVU0MxNUlXZWR4dnlyOUJvWFQ3OFFzZ0pmRThuYTQ4?=
 =?utf-8?B?MmRKM1BlSU9FcFBUVG1BT1Z4anBlVE9yRDdORWlnLzE1WHoyendYeVBVUWk2?=
 =?utf-8?B?c2V4Zkd0YkRIQW8vbE1NV3RtVkxwVVJJblM5YmRoYUZabEtQUHlRQjN5Um5L?=
 =?utf-8?B?aW5lc3VYaTYrbHpCeWZWdmdoREcxcjVWOVBsMW5PWElnQ2Z3KytzOC81SVNF?=
 =?utf-8?B?TWRQQkdOemFOSFZpelFvRUI2OEo4dzFRTENtQzNqbE5zZXV1enpGb3VSeGZ5?=
 =?utf-8?Q?FMb1/DaCkfUDQS0iy57PWXM0imdmutmR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THlJRXJhYzRWM200aVpPVWJoK2ltckl0QmN1ZHlSTTVDMDZLKzRKQkFmZjNw?=
 =?utf-8?B?WUdtRWxoL3hiejMwMG45eksvdkYxTE9uSzNGUW1FZDBhaXowUGhtNDZreW4z?=
 =?utf-8?B?LzhWRldiZ3ZwRmc0cExvWmZJVlR2bk9kS05FTmJoU3JuTGpSTnh6Nk1NSDhK?=
 =?utf-8?B?UWxzYkdIam5NRWx3UVBBdVVUZVhCNE5BQ1FETkVCZ1pKVS9tY1pBN2tEcjJu?=
 =?utf-8?B?M2o0VjMrdXZrTm50UDFlaXp3Y1hTL3l6S2c2dWE2TmU1WlVsUkVsQ2k4QndB?=
 =?utf-8?B?eWZRZnJYTXV0OENwbjVHcXFxZjF4Z25JeUN1azQrSXIxOGFUWnA2QzM1czBt?=
 =?utf-8?B?VjBrNEpIb3VybEVPR1NxYUJrcHFkNkpoeThMWTd3Z2pFa0FyTzhBSU8za2Yx?=
 =?utf-8?B?WC9IenBRbnQxWlMrbllzTTNEVGJWT2JxYmQwdGpoRnZQS1hBYm8yeWV4ekVO?=
 =?utf-8?B?cVYwV0FGUTQvNGM3N1pwbUFIUStBMDNvVWhlNmxUUktobWFqbUZxM1F3WXVn?=
 =?utf-8?B?blZGQkRTTWlXWTdDb3ZOdUxCcnZ4OHhlMEFTQXczdXMvalEwM3ZJdVQwOUxR?=
 =?utf-8?B?bUJPZk04TXRKQXhYQ3U2RFpmUEhjWVVySkoraDd5WEl1TWVCcDNpdGx2N3FX?=
 =?utf-8?B?aHNGQ0xzRElvdVRaTlJnSGZRUTA2UGFHL3V4Z3p3aXhWcWJwQWdXdDQ2aEpk?=
 =?utf-8?B?SVdMTDF4M3NlUlRHQ1E5aTg0QkErZ0Y0N084NVlOdUIzL3BIZXo0dEJwZVR2?=
 =?utf-8?B?YTg5SmxHTytpS3QwQ2V2VDFKMFlUUUozb01LaVJRR1NBZVFFVzRUdXBVdDdD?=
 =?utf-8?B?RnZpejBlUTQybG0rS2lwR0xBN3NvL2oxcVlNQVpQVkxNdlFNM2dTWHZOcWlo?=
 =?utf-8?B?UnllV3hMd2QvZDhOeDg1OGkxYnNnUjhMaGdKRjdlVWo2STVoSnR3ZUx1Rlor?=
 =?utf-8?B?UHVrQjRaU1gwUytWU3duVGRwQUlNZ0ZOV0Y2L3dmU1VGUTJ2ODY3aWlVRWR3?=
 =?utf-8?B?dGxnOG1XN1dTbnlNY05OSWllVVFiT0llN1ZvMkN5cE5LM2ZveCs2eG14azhZ?=
 =?utf-8?B?K1lXUXlpQUcxUTVQUzlnT3V1aGE4eTlLc0tHeVRmRlB5MldJQ3JsOVkwYnhO?=
 =?utf-8?B?NS8yeDNQKzhZRlBCNkJNUldhK0wwQitjYjhBc05Fd2NHNS9Ic2RpUWc0dHRZ?=
 =?utf-8?B?emgzT0ptVU1ZeGh6YVI0S24xdXNRRUdvU2sxK2d1T3BMMjA3QjFoT0Y0YnBm?=
 =?utf-8?B?WTIrc2U2Z29yV2NEb3NhMXFGb2dkQXpJekE5QmVzUmo1UEZsakJ2clNBQStU?=
 =?utf-8?B?bHpWZW5iSWJUdytmKysxQzNob0IzNGpuNjZsTmZzRUpKUVI2QmpKN0ZnNHE4?=
 =?utf-8?B?dThRWlZQVGlvZS9wbk1ZNWJPbUtwM08rNFVpeGczMXMwUnhkZWFZelVZdnYr?=
 =?utf-8?B?UVFqaHVITXR1WGZWVHNIV1NyZloyRVVZdEVmTHRhazhwbmtDUDVUNU90YTE5?=
 =?utf-8?B?UXlJTndaeFBOUXdrQk9md3Zmd0dpUGpVM2l6ZnVnSW5wN1gyK05iOWF1S1lV?=
 =?utf-8?B?S2pYSXZjVmdOdTdJWDRsWEdpWkdCWUx0a2toNWVzam5XVjlzQ2MwU3g0QndL?=
 =?utf-8?B?cjhQQmtZRDRHblpjTkdlQzdvTXFQWHRRVC9ObkVBVkN6cmZkQlJLZDRWYkR5?=
 =?utf-8?B?M1laQVNwS2g5ZkhHYUpldkt6bThGaVhzZHZ0c2pVT2ZDYTNIM092T3hmT2tr?=
 =?utf-8?B?YmZabENHZ0VuNXEwUm9namRrajlEZzgxT2RFSENQVm53TEJ0UWRFL0lITmgr?=
 =?utf-8?B?bi9POHpwVmV5WHlHMkJ0SExNWnVHSi9wQUYxbHh4bGgxb0g3QWJBT0RIMUxV?=
 =?utf-8?B?QUFiSHFscmVQZVVMcnd5S2lHMzFuWCsrV0I2NmFCNExZdGhkWHQ3NCtnMDJV?=
 =?utf-8?B?aFg3Qk9OR0M1QzZIMDBMMzZRMkpaSFVaMjFwTm9jN3l2dGsyZjBKY3JwOUN1?=
 =?utf-8?B?U0YrdktGTkcxZm5MNlRCbGI3aGFvWElYRU1sYWprN29HVjhIa3BoNWo2QzFC?=
 =?utf-8?B?Tmd1dkZ0M3Z2N0NEN3BoRzlXTG1HZHl5UmNqaUtibmFGR2hST1JQQ1hoZHlp?=
 =?utf-8?B?MkpNYXpEZU05T2RzSHNtSDZUR0MzZVUwTTRPMERoaXdtY0pPMFZXd1hTWnBt?=
 =?utf-8?B?TGc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b98745f-ea53-425d-981f-08de22098038
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 16:35:34.0836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8La/l7jv2Qy3GJ9Ov0Yh8Ert2rcR9HERkTqawy5DxlTwCdr/230ofpmTEekBF9bf62qu5dSWhwkJxijOTIJ0Ciedntva2HDRtHsCGBH1J3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8381



On 12.11.25 16:27, Alejandro Vallejo wrote:
> On Wed Nov 12, 2025 at 7:40 AM CET, Jan Beulich wrote:
>> On 11.11.2025 19:25, Grygorii Strashko wrote:
>>> On 06.11.25 15:47, Jan Beulich wrote:
>>>> On 06.11.2025 14:42, Grygorii Strashko wrote:
>>>>> On 06.11.25 13:35, Jan Beulich wrote:
>>>>>> On 31.10.2025 17:17, Grygorii Strashko wrote:
>>>>>>> --- a/xen/arch/x86/hvm/hvm.c
>>>>>>> +++ b/xen/arch/x86/hvm/hvm.c
>>>>>>> @@ -4231,8 +4231,9 @@ static int hvm_set_param(struct domain *d, uint32_t index, uint64_t value)
>>>>>>>                 rc = -EINVAL;
>>>>>>>             break;
>>>>>>>         case HVM_PARAM_VIRIDIAN:
>>>>>>> -        if ( (value & ~HVMPV_feature_mask) ||
>>>>>>> -             !(value & HVMPV_base_freq) )
>>>>>>> +        if ( !IS_ENABLED(CONFIG_VIRIDIAN) && value )
>>>>>>> +            rc = -ENODEV;
>>>>>>> +        else if ( (value & ~HVMPV_feature_mask) || !(value & HVMPV_base_freq) )
>>>>>>>                 rc = -EINVAL;
>>>>>>
>>>>>> I find the check for value to be (non-)zero a little dubious here: If any caller
>>>>>> passed in 0, it would get back -EINVAL anyway. Imo -ENODEV would be more suitable
>>>>>> in that case as well. Things would be different if 0 was a valid value to pass in.
>>>>>
>>>>> The idea was to distinguish between "Feature enabled, Invalid parameter" and "Feature disabled".
>>>> "
>>>> But you don't, or else the addition would need to live after the -EINVAL checks.
>>>> I also question the utility of knowing "parameter was invalid" when the feature
>>>> isn't available anyway.
>>>
>>> My understanding here - I need to drop non-zero "value" check.
>>> will be:
>>>
>>>      case HVM_PARAM_VIRIDIAN:
>>>          if ( !IS_ENABLED(CONFIG_VIRIDIAN) )
>>>              rc = -ENODEV;
>>>          else if ( (value & ~HVMPV_feature_mask) || !(value & HVMPV_base_freq) )
>>>              rc = -EINVAL;
>>>          break;
>>
>> Yes, or alternatively
>>
>>      case HVM_PARAM_VIRIDIAN:
>>          if ( (value & ~HVMPV_feature_mask) || !(value & HVMPV_base_freq) )
>>              rc = -EINVAL;
>>          else if ( !IS_ENABLED(CONFIG_VIRIDIAN) )
>>              rc = -ENODEV;
>>          break;
>>
>> Both have their up- and down-sides.
>>
>> Jan
> 
> We should aim for Grygorii's form, imo. If anything because it eliminates
> the second else-if on !VIRIDIAN, leading to a marginal binary size reduction.
> 
> There's no value in validation when viridian support just isn't there.

I'm planning to resend with below diff applied:

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index c09fb2ba6873..7299cfa90ad5 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -4231,7 +4231,7 @@ static int hvm_set_param(struct domain *d, uint32_t index, uint64_t value)
              rc = -EINVAL;
          break;
      case HVM_PARAM_VIRIDIAN:
-        if ( !IS_ENABLED(CONFIG_VIRIDIAN) && value )
+        if ( !IS_ENABLED(CONFIG_VIRIDIAN) )
              rc = -ENODEV;
          else if ( (value & ~HVMPV_feature_mask) || !(value & HVMPV_base_freq) )
              rc = -EINVAL;
diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
index 5fb148b2aa15..90e749ceb581 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -1117,9 +1117,6 @@ static int cf_check viridian_load_domain_ctxt(
      struct viridian_domain *vd = d->arch.hvm.viridian;
      struct hvm_viridian_domain_context ctxt;
  
-    if ( !IS_ENABLED(CONFIG_VIRIDIAN) )
-        return -EILSEQ;
-
      if ( hvm_load_entry_zeroextend(VIRIDIAN_DOMAIN, h, &ctxt) != 0 )
          return -EINVAL;
  
@@ -1156,9 +1153,6 @@ static int cf_check viridian_load_vcpu_ctxt(
      struct vcpu *v;
      struct hvm_viridian_vcpu_context ctxt;
  
-    if ( !IS_ENABLED(CONFIG_VIRIDIAN) )
-        return -EILSEQ;
-
      if ( vcpuid >= d->max_vcpus || (v = d->vcpu[vcpuid]) == NULL )
      {
          dprintk(XENLOG_G_ERR, "HVM restore: dom%d has no vcpu%u\n",


PS: Not sure I have enough stamina and enthusiasm to continue post v8 version.

-- 
Best regards,
-grygorii


