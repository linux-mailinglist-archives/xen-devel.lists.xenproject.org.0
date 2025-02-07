Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D786A2C162
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 12:16:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883555.1293517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgML4-0004Uz-T2; Fri, 07 Feb 2025 11:16:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883555.1293517; Fri, 07 Feb 2025 11:16:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgML4-0004To-Q8; Fri, 07 Feb 2025 11:16:02 +0000
Received: by outflank-mailman (input) for mailman id 883555;
 Fri, 07 Feb 2025 11:16:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lMDZ=U6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tgML3-0004Td-6C
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 11:16:01 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2415::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7739524-e544-11ef-b3ef-695165c68f79;
 Fri, 07 Feb 2025 12:15:58 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by IA1PR12MB9064.namprd12.prod.outlook.com (2603:10b6:208:3a8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 11:15:55 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8422.010; Fri, 7 Feb 2025
 11:15:55 +0000
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
X-Inumbo-ID: e7739524-e544-11ef-b3ef-695165c68f79
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fyIM2ncNeNJLwYQf6t2WJW85zVzFy4sVvi1F9o5PaiK6dD070yOHtPF6k+Qcf1gVwQLk7neH/er2bwsKolHuiXfp2AeIwcBzb1eS1fEr5y9SjWRri32z96d5ahH2Ge1R+NPRLon9D+XFRUsQxXkVbkWwsPfFNwDbQiFsQq1Gd7kyeU2WFukI+5hfvLkt5+OkvYzKf14bop21GtcPUCxt4S+0EPMnJ10iNTeXdvqxfg1Fg1dl/TmQ2AiYc43SOpOTH/iOQDjFYxZkRRBHMx3/CR/qyIMnVT9VKKmWArhPjQcjSsJmDv4ewktySff9hMZKstbUhuBBMwOdL0J/uJdHsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8qU6pYNBb2xxsw4aUN34MdcZxsoBiM30GXkReHkEXHI=;
 b=r8Qbv+VnhT69a/shoq0wXLw86IG1qa+ZJr6xE+XVl5hdGC1qsYwETScyOqkbZNAxxcVI+VGZw0QyqIf3t8yyAd1Y+kKaZfjgJXNGX95Bh9R0kZq2ptQ7cjCTF3yqnCnLNyv4IEaIwtCHNNRTHHBXD/8IHokfKTCOHLf5VLVcQpIghSr609Acj+a7RvV0rgkPt4/nNrjSn0NMQiZED/HC82wUpH3PMamOI64aY9GEAh3lbT1VoIaJKSz+8uva+tFvNJvAejWf1LJY/sGPjTBUi+BMepUMH2Ly8gKd48ZIn7R/eoXDA3re4ekslGlcmpXufL0zKHRdgsQCRkFYskGkHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8qU6pYNBb2xxsw4aUN34MdcZxsoBiM30GXkReHkEXHI=;
 b=0FAJ8to8izVldgrnWiTZu5kyGtyLR2jWMEf97keHhis5vAZbOrMJ6UewYojoE2cz+k2N0Jk0lBVXCbrmn45sxegAoetw/RIJErOle2GLC7crHRLBMdgmuIqqCrwnal2GuJg98fOzETfp833/phWlwExuwZOJSxENRl/k5WTcpRc=
From: "Orzel, Michal" <Michal.Orzel@amd.com>
To: "Stabellini, Stefano" <stefano.stabellini@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>,
	"bertrand.marquis@arm.com" <bertrand.marquis@arm.com>, "julien@xen.org"
	<julien@xen.org>, "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
	Henry Wang <xin.wang2@amd.com>
Subject: Re: [PATCH v6 3/7] docs/features/dom0less: Update the late XenStore
 init protocol
Thread-Topic: [PATCH v6 3/7] docs/features/dom0less: Update the late XenStore
 init protocol
Thread-Index: AQHbeQMkBUofAJ8s2EqCURv0f+YTjbM7sUcA
Date: Fri, 7 Feb 2025 11:15:55 +0000
Message-ID: <845c8a9a-4fa0-4d5d-baa6-c20254fe8354@amd.com>
References:
 <alpine.DEB.2.22.394.2502061750480.619090@ubuntu-linux-20-04-desktop>
 <20250207015341.1208429-3-stefano.stabellini@amd.com>
In-Reply-To: <20250207015341.1208429-3-stefano.stabellini@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5273:EE_|IA1PR12MB9064:EE_
x-ms-office365-filtering-correlation-id: 091d05c6-ab0b-4503-fdcf-08dd4768ca7a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Z09udTkyd3B5OXJpYmNCMWlTWEpxcVZZZmFrTmFsYXFpalNEL0hKTThkYUth?=
 =?utf-8?B?T1pPenVzS2JvY3BjYlErTGhNOUt2Z3ZsYTJxWmtxRUd0TWhTYzBkeVBzNWoy?=
 =?utf-8?B?Qkh6R0dpWUJOUmU5YlBNWmhnejNtOFlWbWI4RS8vS2pxV25OV2xUdmhINHA0?=
 =?utf-8?B?VTBSUGd2c3pHSjU5bTBzdXJQUTBnTmpJemtoZm9tSTNJK2RKUWtaMi9pTWNZ?=
 =?utf-8?B?ZWl3Smw5SlFZaXRueE1pZzI5NHd1VVQ3bjJ3cFIzeE1GNGo2dGlQaW55ZmJn?=
 =?utf-8?B?djZWVnNCVkVIdXpEVUR5N3p0bHc5L3lDZkpuZzdMQUNKSUUrLzR4UDUxYWJD?=
 =?utf-8?B?dkN2ZHNNZGtXeGdBNXhBN2JQRkw5eHZ1LytaQU10NldzVlZSTER0Y3FtSnJj?=
 =?utf-8?B?Q0xuaTVKc3Y4ME41akNqTklvOXJxNzZwZG5FRGFqdjFDQmRwSkExTVcyZ3N0?=
 =?utf-8?B?VjBWQ1dBSm9oK0g2VjUvNTJTMTBYZzFHODIvRDhlQjNNaHhwS1ZUK2tLeHFH?=
 =?utf-8?B?RzJjSFdtMHlxV2IwWEs0cGVJVEk5Q2Rnbko0ZUJLV0V3cXZBNTZTZjVwWTJF?=
 =?utf-8?B?VzFsdm1vaWFLQlk4Qi9PVXp1S3FvVlRpSDdZTisyZTdmZDQvQk9mMk8xRW5S?=
 =?utf-8?B?a2JLcU5HcFFEM3hvbXhVc1pZRkx3YzlITENVTEZGb0NVM05PODZBa3lUNkhT?=
 =?utf-8?B?bHRVNVg5ZnBwZ2ZCTHZyK1RKWUJ6dWJyVW1CbE1jN1RFY0h1VFNFamVnSkZN?=
 =?utf-8?B?aTU0aE5FUEkzV1hHSWp0WDk1NkE5QkkrQm5iS25xS01Yakp5ck9sMm5uVHQr?=
 =?utf-8?B?d0FrT1A4cjZaQ1dJSkN5RXBrRTAvSURTVlM5UGNqczArME1VK2dGUTRyeWZR?=
 =?utf-8?B?UHZIdUJUYTc3c1c2V2hMcGVucHp4NVJjRWNoenU4ZkJ1VUsrakFqNkY4bExY?=
 =?utf-8?B?VDZuNDhyeDc0b2lFWmdjTmZNL3haVFFyUXluMlNCaEhMV1RYOUNoM2xoWTJN?=
 =?utf-8?B?UjJBcXhKdFVnNWxld0I5cmlBaUN5SDMvNDhUT29ObHFVeXJTVEpwMk9hRFpV?=
 =?utf-8?B?ZkZ5N0NRdmRxaXdZa3pLdVdya2lhRFdhRnVIT0dMVkJYZVRXdzA1U2lvWHRD?=
 =?utf-8?B?Q0FFMjJQQ04xa0tXa0tERXc4aTFtMFVxUFVQU2g2Z3BEOERJeEcxU1RXTCtv?=
 =?utf-8?B?V200TFJIUjVXdTNFSSswLy9FaGhIcEJCZ2ZxTGxQeWpDN2lHZldJMEE5SEJi?=
 =?utf-8?B?OXpaeXUxS0xMckkxWHNxN1RxbXFRNGlHb3ZnM3FsRnNBMFlkWVlhYng3Mi9C?=
 =?utf-8?B?cnMyS3FMVXZMWG1rQ3ZGZ0hGUW5mUzFIOGpvQjhJSDFjTnF6eno0V0dCdXhC?=
 =?utf-8?B?cytQUXR3NGRxaXJMNzNiU3l5MWZ4ajh1SkZjNjZSOWkvcTMwNUs1QkY2M0Va?=
 =?utf-8?B?VlovNWlIUFJXWXVScklmRWYwbFRhRWcyaExndDJTbVh5V3QvZ0ZJSUNCOXhq?=
 =?utf-8?B?ZzVIdzFMaHB4MDJUZHI5OXFHTS9JcjVneE9IR08vaDdDTm5aTkJ4ai93WHhq?=
 =?utf-8?B?WjY1aVNnZXFZbys2em11S0REczNZVFNKR09FeHJFVzVXSDh0ZG5ETTc2WG1G?=
 =?utf-8?B?SFpBNmxpU2xHbWozVU94ZmpySDlqaEV3NHd2ZTFRMHU0eTllRlk0b3RiNEtN?=
 =?utf-8?B?L3lJQjUxVWprVEtvMHFDb0d3eUVFeThPZWNCc1pEdUJoelZ1Z1FPR2p1RmVq?=
 =?utf-8?B?ZlUvVldWM2lmRXZkaG80c3QrVnlpdndmYm9VZUdvRUIzOEpsbUNRdGxucnZF?=
 =?utf-8?B?M1dhWkt6L0h4dTA0dGcreEsvc3dLL2pWa1QrNkp3ekRCMnFGNk1OSUhCUHZ0?=
 =?utf-8?B?VktvU0NuN3hXQUU2Z1pHMlEwN2hDNHMxSWw5aGZEYmtFcENxUkF4R2RPUSt2?=
 =?utf-8?Q?VvPUqdKQ9PJNBNn4dYMNN1/n9W/I1BdF?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RUpRRnppRCtyclBLeUJ4aUxBWWVVSjI0TzNMU25QYlZRVnUzSzFBbG9PbHoy?=
 =?utf-8?B?QXJrQ2hvSDNPRmg4dmJYUFdWY0xyMUZFclpkTW5UdWpLbW1oeWo5dG1OOGZB?=
 =?utf-8?B?WERucDNGK2QvdDUxRHQrWTVGZ09PeXpzdU1leDlrNEU4RlpCSXhTeERYYWEy?=
 =?utf-8?B?NytJblZRMkZTV2pwTUw3blhyYjJ1WS9vK0lFVHl0TE5yYklCNU0vMDg5MTRi?=
 =?utf-8?B?dUtYMjkwYUw0emVQcDd6cE1LUmxXcGhvVUVVMEt4aGpDR09pcmg3M1IrQlVC?=
 =?utf-8?B?aVc2bWJxM3FiRUd4OXI1c1Q1bUtRL3k2TWdOdGh5R25MNTdKZzhvU0d6STBN?=
 =?utf-8?B?SmJNVk1lS0NJTGd0NkRTT2lPTGY1NUoxUnRBeEdWUmZqcmpBd0haaW91Nkk0?=
 =?utf-8?B?ano1WThFTlUvT1JJN2p6alVKYTZoRG9ycWlsclBHUVFIQ1VXZEk3OGZFclRS?=
 =?utf-8?B?YkFhdjZtVDBydDhzN2luT2Nqb1lnVW1VVmxncmNqZWFJbGFyaEVKQVV4NnRY?=
 =?utf-8?B?N1FseDM3OUxXZnZmZG9pQlpCVldpZUl0Q3FDZ1lqNUFkY2lDQVFlVHViUys1?=
 =?utf-8?B?dkx2NHJvd2VRdm5YZTFBYlhINkkzOEc3V0MxZUFCNlRoNzdGdVUxVlNkWHB4?=
 =?utf-8?B?L1I1TGxqOXNLMTZESmNScUdDYVAyMUhKMVFGcDBNaHFOSDVIeWNSOGZuRGg3?=
 =?utf-8?B?QUJ2V3lzQUU1Y0xKajJFTmdIenJUTjhFQkVKZDJPTTk4dkZvOWFWQm96R2M5?=
 =?utf-8?B?eHVmVHk5YVlEaG9GQ3B5b3I5WGRlRjVDYVQxSklSallYSU9QZjFyaXFOVUR2?=
 =?utf-8?B?SFNiYXFUaXFza0xiWG5EeE1ZQ3R4aWo0cFRYbFYzSGdLcHF3V2ozVm5MT2ZC?=
 =?utf-8?B?eHZaekNKc0J2YnN3WVdtSFRmYXpyQTNqdW9mbEovbjF6a3hQM2E1bm1GM3B6?=
 =?utf-8?B?eDc5MEhKYXRJK1EyOW9CaGJwUExuQW5nRGgzdHVPQmkyWU9NZi9wbjBTRnVN?=
 =?utf-8?B?ZUhlNjRKdC83WjlLTUlWeFNlM2NxZXNRL29sMFdaclZhMVBVNitMeHAyWlhJ?=
 =?utf-8?B?M0ExTlNIV0VwRHlxUkcxOHR1ZWZvb2R4QTA2ZUJ4SVk3RElRTlNtNGUzRVZY?=
 =?utf-8?B?Q001N01xalk3Nmhzb1I4THkvRU5iT2IwOTFmcFd0NXEzZGUxYmFXK0FMQUow?=
 =?utf-8?B?Mkl6Nld0WnA2VVNvR2gvdEw0K2JGOXhianBvVFB2ODAzMnpqMWQwaGwxQzl6?=
 =?utf-8?B?ZGk2VldEY0ZiMkY2MWg0ZzhKL0ZuUytLQkhiVXpsVFg3UWpPdk02K29PK3pU?=
 =?utf-8?B?d1BoN1A0bFEwZkIxd0VlcmNxQmU2TXpnZkhid3lvTHpnSExNSERTZnBIV2x2?=
 =?utf-8?B?dEc5TUg0RG5Yb28xaU5IMlFzUUgyMkp0TitmbEFjclN2L2FVbFozK0FxcWh2?=
 =?utf-8?B?WGpEbEV2LzlPVzJVUjBnUjFyaVYvN3ZEamtFUk5EYkxoc2tUSVJjU0EwOGtO?=
 =?utf-8?B?aC9mSWg3YXhxdm4rTjkrVkxvd1l3SGFSK1AzUnltaFg2N1hoODZERitsbzdy?=
 =?utf-8?B?MzY0MFVkOGdyN0dKT0xSbStPS0crNVFaQTRxSVp2MzZGTkVKMzNqSElaenRw?=
 =?utf-8?B?LzJvS29NQTc5VzJBVHAzNE5iNGNiWDVRSDlCOVRXTFduQklHbTZ2ckhKSHE4?=
 =?utf-8?B?SG9IMFpkTmptTXM2YmhVVTFVOVRiblRKakd1MUVxV3BhODFtNDZNakxNR2V4?=
 =?utf-8?B?d0ZqNDk4QmJGRks2UUU5d0RrbVprVFFwNjVEeUZRVjVFSEJyL1YwempabWR1?=
 =?utf-8?B?cW5QTU10bzJxYlBhREpERmtOcmhlbk5LYjVJQ0gyWVRDek5rdmNLQ3JtY2w5?=
 =?utf-8?B?azlPanRnKzVHaTM3RjFLSkl3blpSNCtBd2FDTFkrcHhscklBRHVhOE1CV1VQ?=
 =?utf-8?B?VjlRaXBLRktUeUFuU1gxdlpiZ3hTcVc3MzM1Z1FjWUpPVHgxem5YMTJ3NnpC?=
 =?utf-8?B?akRkelBTTkIwbmpaODhMZzFFdXRjL0R4clRTdGl4TG54MGlPWFpjZXlmYVdK?=
 =?utf-8?B?UExwVnRLU29zTFlLcUpuM053b01wd3U2ZXI1M0x5RFZOQTN2UFFvR2dVeE40?=
 =?utf-8?Q?If5o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <12D8A48F9F1A634FAF8E527495110C21@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 091d05c6-ab0b-4503-fdcf-08dd4768ca7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2025 11:15:55.5533
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iYbIrQ1T82GoLoC64OW9LDraqEVrg0EmCjOAxcDownH3lDp5rEMRvEekEqaUJS82
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9064

DQoNCk9uIDA3LzAyLzIwMjUgMDI6NTMsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gRnJv
bTogSGVucnkgV2FuZyA8eGluLndhbmcyQGFtZC5jb20+DQo+IA0KPiBXaXRoIHRoZSBuZXcgYWxs
b2NhdGlvbiBzdHJhdGVneSBvZiBEb20wbGVzcyBEb21VcyBYZW5TdG9yZSBwYWdlLA0KPiB1cGRh
dGUgdGhlIGRvYyBvZiB0aGUgbGF0ZSBYZW5TdG9yZSBpbml0IHByb3RvY29sIGFjY29yZGluZ2x5
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSGVucnkgV2FuZyA8eGluLndhbmcyQGFtZC5jb20+DQpA
U3RlZmFubywgeW91ciBTT0IgaXMgbWlzc2luZy4NCg0KUmV2aWV3ZWQtYnk6IE1pY2hhbCBPcnpl
bCA8bWljaGFsLm9yemVsQGFtZC5jb20+DQoNCn5NaWNoYWwNCg0K

