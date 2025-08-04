Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC40B19D9E
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 10:29:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068936.1432789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiqZK-00055h-Ho; Mon, 04 Aug 2025 08:29:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068936.1432789; Mon, 04 Aug 2025 08:29:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiqZK-00053B-El; Mon, 04 Aug 2025 08:29:18 +0000
Received: by outflank-mailman (input) for mailman id 1068936;
 Mon, 04 Aug 2025 08:29:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=owTc=2Q=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uiqZJ-000535-5u
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 08:29:17 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2413::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ac34c84-710d-11f0-a321-13f23c93f187;
 Mon, 04 Aug 2025 10:29:15 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 PH7PR12MB7139.namprd12.prod.outlook.com (2603:10b6:510:1ef::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.17; Mon, 4 Aug
 2025 08:29:11 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%7]) with mapi id 15.20.8989.018; Mon, 4 Aug 2025
 08:29:11 +0000
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
X-Inumbo-ID: 1ac34c84-710d-11f0-a321-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dmLfBlKawHfVsyw3Jm1tk6I9skr0V0uGRmJmC6uwwcfOz1Bqu4j1inVuaM61H8BDxgdJ/NSEmALDjOdnuXue56BjX1P1f8w78dB/NAfPjqOsUhmP+XAEXzBqtkuiEn89XiCWRWuG9UUJH7eZ5kKcecTtUEZLrxALiqqdAAIo+H4O6gC1i1GS3JOWbzOffUmqs2gqiWzawgszdKLql6l9WnQRaOvDQwFrQcAhvlJWQ3MaOTlbgSbfukGDzpD8ra1McuZtKoL8ZnXUeslBeNNsN1T+SvrlqrZsdikS9ByI3gvM7DtLvDdcRsMICji0CIUejY271ePcnkRm0RzJt5b0TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YMC+cNg1cuk05Uw6D0cIVpXLmDasdBh0Km303e6AvN8=;
 b=cQHVxvQW/VVBjaWmCdaM/9+0wSMUYR8nIq/FqDrrXkgLXf7zczIopvWimhpJGtyo2q2C0Mp7WUb27tmow+8srTuvhVGacnhS+DQRk1V4JVVqsyPqk6q4VHh0CAR04W2Ih9Jz2soA2bxRXMklsNe1dhjA+N/sucfwOaCPB5oOu3YdipNAljhoATUBPRLv69zWri2Lt4Ngy46n1mkthXwva0D+eOhimCv/+J966wCtcUIp3nEL78eJ2qIPIe/8CWzEFAtT64PxAuO3rtLmeGFhvkjvxsxosNURGlu2xXu486G0RfoR3w4dk3FOGMHP8LPg1UdyVpoJXsIjeL+5kyqRpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YMC+cNg1cuk05Uw6D0cIVpXLmDasdBh0Km303e6AvN8=;
 b=cU7O8sZFMDic9g+ezKox2AwwAf8zX+rYspo+XXRvWd7FHot0OcX6tRjN+KnFjA1qGNnIG/amoH6izucD5ew5svSQ4Y1436FDzMSmRHq9qU6NV8iDTgq5hNkmGW0QWCmS/tuK6GinBl9+0etUYzceTLwWckY6ncPvq50WucnbxKk=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v1 05/25] xen: introduce CONFIG_DOMCTL
Thread-Topic: [PATCH v1 05/25] xen: introduce CONFIG_DOMCTL
Thread-Index: AQHcBFvCe6jl5BDdFUqaZVGrjdEUNbRSHXyAgAAKwpA=
Date: Mon, 4 Aug 2025 08:29:11 +0000
Message-ID:
 <DM4PR12MB845118D11DCA4E169D294553E123A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250803094738.3625269-1-Penny.Zheng@amd.com>
 <20250803094738.3625269-6-Penny.Zheng@amd.com>
 <770f41e5-5d02-4358-8f91-e577f762cf58@suse.com>
In-Reply-To: <770f41e5-5d02-4358-8f91-e577f762cf58@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-08-04T08:24:51.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|PH7PR12MB7139:EE_
x-ms-office365-filtering-correlation-id: 0e785f94-7cc3-45e2-e85f-08ddd330fcfb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aWZ4YlB6UVdaS3VMM09HRFF5ZXFLdjVwdEtjcHRyVjF1eVY3bVN5SUlUbVRx?=
 =?utf-8?B?UDczbmZ3RTl5RHpoTGR6Tk9BdEJQZktGQ010dlRyNEFaOXY0dG11RGFTSXZB?=
 =?utf-8?B?Q1Q2VXBOZ0VqMUxTMUpSa2diS3BzeFVtQ2ZZR2laWWVCRGxaQkhISXE3QTRh?=
 =?utf-8?B?NEVBVFZaeExyT2crUzVoNCtpZlgvQk5QVTBDbVhPOHV3WnZuYlROQ1hHVUlp?=
 =?utf-8?B?UFhZWHlGeHdyTUNOSVlkdnhoTDgwWmZZSGR5bFNJT0trYmpGSjVTYTlEN3E5?=
 =?utf-8?B?NDh2OGY1djg5SnZGVHZvWkZpY1E1ZEZMNWh5elMwVzhsRldFYTRsOUhaTGRT?=
 =?utf-8?B?emFGYUR0ZTN0NHBuelVRZVVPeGFESkIxUU9pZ3JQb3dDa0VQY3hlQmVvc0JF?=
 =?utf-8?B?OThQRzRhS1ArTnoyQ1BFa2ZtMHRHa2xSRHJBeE93NEh3ZDdTQ0dlT3I3Z0VD?=
 =?utf-8?B?OFRmSXdidEtyWU5DNmxBLzE1M3h3VG9QeHBpOWloN0l1VWx4Z1JOaVlXNTht?=
 =?utf-8?B?ellkQ1lLVmFvRTNReHpNL3lrOFd4VG9ZVTFRMDNzdWY5SXJlMmc2WGx1bEVr?=
 =?utf-8?B?ak1BdFQrVWZOSTVhcFI0aWttMEJJdGR1bG1XbTRXR1FOOFZPYW13UWM4Y0Vq?=
 =?utf-8?B?M05DZkhQMFVTV0p0bzB2SnZpNE15bnUrS0ZBVm5RRW5JLzJwV3Zhd1RxWThT?=
 =?utf-8?B?cHJiZ0gwOWpDbXlra2hYTDlWK3NXanc1Q2x1S1o0VExqSW9WeklOZi9UUklD?=
 =?utf-8?B?c29laTdvTjlxKzdJbFd6MFNjSXVyRDhqR2QvUEFnbzVJVy9nTWtyUXIrRGx6?=
 =?utf-8?B?ekExVWQwU2EzcGtuN1Y2cjROQVJ2RFUrdW5mU1N6eE8zOGQ0aThET2VuZEdN?=
 =?utf-8?B?emZ1WGhOMXV0RkxwVUVBa1YrMUoxcEN5SXR3YTZTZTlacVpLZTloZlcvYzMx?=
 =?utf-8?B?OG1ubEhJc2VOQXlYRDdYOGlEWXZDT1AwekN3VFh4T0ZtS2lqdjJNK0dUdU9L?=
 =?utf-8?B?R2JEc3VNS0VTb2ZQUGVxMDdsc25mWEZKSUtjSXRrQVpBQVVHblJLTXNzaWNs?=
 =?utf-8?B?cnc4WTl3akdhNDBPWmY3RGRRWkV5WWl0S1RIU3V4ZmpYVS81SkVKNGxUY0hq?=
 =?utf-8?B?WHBFdS9UYXJybzB0ZDBFRkd5alNUVnVkeGNmMExCSHBjUzk1S015cmdrcytH?=
 =?utf-8?B?TzNLWm5FOHVjRThoRWwrMzNKZEJzK1ZDT1lRNGw5OEpHVmNXWlNqQTI3VnRR?=
 =?utf-8?B?cmFBYkFTcUlwanhpWDRXVTV6ZG8xR3NTNDFQK29vYnNNajFGMHpyYm5YMGV4?=
 =?utf-8?B?UWFFMUR3TXlXOHlVaE8yUVBaQ0xVd2xVdjBLc0VIb3JBNDNITU1GenNGRzBP?=
 =?utf-8?B?YTFlRmpNclYyb2xSZzdkYWRXV1VCdHNPUjZYNUtsRDlsYXRtcWV1MmVHa0JT?=
 =?utf-8?B?bDhtN0dMa2t0ZDN1V0FIdGlxTVc4cjMwL0k1cXEyTkFxcUZvdEhLTHgwL1Uz?=
 =?utf-8?B?TzJqdTBRSnVLbWJhcWVWdkNiZkFDMDRqN24rMndKZFV3SWJUNytpTXhLTDVM?=
 =?utf-8?B?azRURHFRdnhQMnN0ZUN6bm5POUhoLzhQRmgwQ2NVaWVCV3BVM21WblYwbUlN?=
 =?utf-8?B?cFdNSmVxQk5EUEE5c0x2clovV0hHenJMdWY5RUxqZlFOS29Bazc2TXdPM0c5?=
 =?utf-8?B?N09wWURmaFFvRnhqM2RycWRmb2dFT0djYlI0Um1BRmJGZms0TGNZUkJiRVcx?=
 =?utf-8?B?SW5tY2Nha2xwQzA0Vjg5STNmbkdseDVuR2lNSm42Y01paGJJRWRUcXYrVEl0?=
 =?utf-8?B?TTRENG9aOFk1dFpnK3U3dUcrWjVZaFNQZENMc2tqdGx0SHhWK0xRUTIyRFZS?=
 =?utf-8?B?ZHdQY1djUVM5eFFXVThFWklsTXFnN0dSUFlNV0ZsSThML2NUTmR1SlFTZTRq?=
 =?utf-8?B?TDNTVGFWWmtQcW9zOGtHSG9ZT3FiR0ZEdVVJVkxMY0xzd0xDeWNhWjdHU2hk?=
 =?utf-8?Q?+MTX9KFMQe0isEzjiTpfErRaq1CLSk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q3MwZXVkUzBGSGNGbXNSbHVmdEdha1hIM3NJTFdhWU1vbGt0SkxXOVE1aHc1?=
 =?utf-8?B?WEVmcXBzeGt4eDZodm1JcUpUWFZzaGQ0anhJUjBJYnczdDFhd0ZmTXpSYmIv?=
 =?utf-8?B?bEtSdnNneHdRK1Q2TDgvRU56Q1VCODBES1hJcXBENVh6aFQ5UWRld0tFcmxP?=
 =?utf-8?B?ZTVBbmUrcW9TaTYxQjVHUmdHS2xPdjZvWmtIM0laOFNqcUNnYVF2UGJTcjlh?=
 =?utf-8?B?MXJuMktYT0d0K1FiNkxDSG0wdTZaNzVKK3FDcjFVaS84T1pVT2o5TnFSdnEx?=
 =?utf-8?B?UTc0bGZ6THlQcmVsYUljVUNlSDJaREJjZFdrdXBXZ2ZPSFFDTFdiWXZKVVE5?=
 =?utf-8?B?UTc1TWtCSGgvRE5VMlpsWGFTVy9ua1ZEbGNIZ0ovOC8rVHdROGI0YVFHYXFv?=
 =?utf-8?B?OFNqNGFlVHJBSTVoSXBDSnpvM0hiZ0I5d0wzYk55UVk1aDhveVBmZ0MxZzNP?=
 =?utf-8?B?N0pFVW0yek9MQ0FDOWFvaEhrUGpYd3h6eGNJRTVCYVlVaGJVSVhuMnA1NWtp?=
 =?utf-8?B?QUNHY09mR09xS3ZGNEMrNWxWVWxLQW84UjJCeVk5WHVqWmNtZVJCazN6Wnph?=
 =?utf-8?B?bDBFZitzck1LOVlxQ2lCZ0NMRSt5WnJDY3F2djNGWVhPRktqdGVseUJzbmg3?=
 =?utf-8?B?VzYrMGVod2QzUkcxZnBsNVhuZlg3RWF4bEpBelJaRklTb01PWkRJNXV0OGYr?=
 =?utf-8?B?YjQvUFdqRFBNRXQzTVpGVzZBbWxPc2kxVTdMQnlMMzdydHhKdXJoYmd4KzFq?=
 =?utf-8?B?aTE3bEI4TzJoWWVzbC80TDg1am4zNWVYOXJKclRVWUJhZEVQNUR1RURTUm90?=
 =?utf-8?B?c1JPMmI2N0FmRHB0Lzd6a2FBaHFaaXFrMTZUTXptcUUycUdGQ1prRitkRjJw?=
 =?utf-8?B?WXZtZ29ra3dmZzdKaklpM0JOcW4yaG5QNHQ3WlpMYmR2aCtaa0ViNU9OQkJp?=
 =?utf-8?B?YWsvMFQzdzJNRDdmWEJuV1QxQjZIa0ZkMEF6SDZ0WlloQ2pxQnVBYndIeUx2?=
 =?utf-8?B?c2RNMmdHL1B5bTI1RGpGblpjQm9GK2ExdjlyNVkxNWRxNkQyNk9PWC9XTzRW?=
 =?utf-8?B?aUFaUC9CMTd1UkFCY3pjRU9IUlc5L3g5UlYyRzljQ2l4ZWgvUy9sWVdEcTZi?=
 =?utf-8?B?ODlZL2FmUGtvNUVVOFJEdlZ5MTZaUC9wcmRHZFlnaWtXNnl5c3hNYmxmek9I?=
 =?utf-8?B?a3J3N0tyUHdjTUF6SlVzeWxPdzRhTlJ6TmNtOVltSnlYMXZhUzdnbU04WURC?=
 =?utf-8?B?aUlCYzRZZEdmOCt5K3QycFN2RFdzMzBoRzRKb1A2cDVyYXVnK0RJUnRYTng2?=
 =?utf-8?B?MGl0WTBIUkdMZFV2NFdlcmkwN0Y0TmhmVnlDS1F3TjZzYWFCb29jdURlRUZt?=
 =?utf-8?B?bGE5YmRGdlVOWXAzai95N2YvejFFNlhmV0pCMzYwdEFqZ1NqUVpia2x3WWhQ?=
 =?utf-8?B?Mnh2M1JPS0IyTi9JOVBVWkd3SHhFdzZSUjUyTEhRN0xtTHBNSFhDYlpGQWhx?=
 =?utf-8?B?T0dqVXZMbXA0Y1lVckREWkh2czFZY1lYNjcyWUdnOVppamhKelpDczJVR2Ns?=
 =?utf-8?B?eEEyQjE0VUxUbUZoMVRSUmRRRnE3L0lBRzNXMzFPMUJ0RnpKY1lrTVZwdUtD?=
 =?utf-8?B?UG1SM1BPbnpRb2s3THdMUHpUMWFVTFF4enR1a2RyNzZZcUh2ZGhVYVFVS0k0?=
 =?utf-8?B?WVNKeTBrSkVPcmpFZjkza1ZuK3dmbnFjQVRacVNjN1R6SC9XRlErMzhPS2s1?=
 =?utf-8?B?anlpMHF6SXdqS2hrcW5tVlBNczl5dEtmZ29IMWZpbkFZTEF4NzAzMmhoNjJW?=
 =?utf-8?B?WE9YVXpUcU55Vkt4cWZtZHQ1WVZjVWFuVmRycGpZVjJNbkRPTkdMcGJTTitN?=
 =?utf-8?B?ZWt2S3JSMzNycmdWMlJueHQrQjZIc1p0b0swOFh1SVAzTGtMb0swVVQ4bTJz?=
 =?utf-8?B?L0pDc2RBMjNiQmc3ZWFFR2o2SWozNW5UaUtxNWxXbWJLTEwzV1VUOUh3dUto?=
 =?utf-8?B?Z1NZL05OcXFtL096ZUN5TTlFOWgvYUlLQm1xZERFQVJOdmphamJOZGhRVzU1?=
 =?utf-8?B?RXlHbEhWRWRvY25ibHB1N2RUWC94d3ZRb2hxZDFyUjRaL1doOC9DamEvOGhH?=
 =?utf-8?Q?RWOo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e785f94-7cc3-45e2-e85f-08ddd330fcfb
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2025 08:29:11.2508
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H0Up82158fXAD4MxGPGHpgd4MifsseLof3O0RqS8qTEaOYzdWOmGgQIvvvZ1tDBlVrtAJQB48mDOOr+lGglR7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7139

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwgQXVndXN0IDQsIDIwMjUg
Mzo0MSBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0KPiBDYzog
SHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPjsgQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQHZhdGVz
LnRlY2g+Ow0KPiBPcnplbCwgTWljaGFsIDxNaWNoYWwuT3J6ZWxAYW1kLmNvbT47IEp1bGllbiBH
cmFsbCA8anVsaWVuQHhlbi5vcmc+OyBSb2dlciBQYXUNCj4gTW9ubsOpIDxyb2dlci5wYXVAY2l0
cml4LmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IHhl
bi0NCj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2
MSAwNS8yNV0geGVuOiBpbnRyb2R1Y2UgQ09ORklHX0RPTUNUTA0KPg0KPiBPbiAwMy4wOC4yMDI1
IDExOjQ3LCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPiAtLS0gYS94ZW4vY29tbW9uL0tjb25maWcN
Cj4gPiArKysgYi94ZW4vY29tbW9uL0tjb25maWcNCj4gPiBAQCAtNjI3LDYgKzYyNywxMCBAQCBj
b25maWcgU1lTQ1RMDQo+ID4gICAgICAgVGhpcyBvcHRpb24gc2hhbGwgb25seSBiZSBkaXNhYmxl
ZCBvbiBzb21lIGRvbTBsZXNzIHN5c3RlbXMsIG9yDQo+ID4gICAgICAgUFYgc2hpbSBvbiB4ODYs
IHRvIHJlZHVjZSBYZW4gZm9vdHByaW50Lg0KPiA+DQo+ID4gK2NvbmZpZyBET01DVEwNCj4gPiAr
ICAgYm9vbCAiRW5hYmxlIGRvbWN0bCBoeXBlcmNhbGwiDQo+ID4gKyAgIGRlZl9ib29sIHkNCj4g
PiArDQo+DQo+IEp1c3QgdG8gcmUtaXRlcmF0ZSAtIHdlIGRvbid0IHRoaW5rIHdlIHdhbnQgdGhp
bmdzIHRvIGJlIHRoaXMgZmluZS1ncmFpbmVkLg0KPiAoQXMgYW4gYXNpZGUsIG5pdDogImJvb2wi
IGFuZCAiZGVmX2Jvb2wiIGFyZSBwYXJ0bHkgcmVkdW5kYW50IHdpdGggb25lDQo+IGFub3RoZXIu
KQ0KPg0KDQpBcmUgd2Ugc3VnZ2VzdGluZyB0byB1c2Ugb25lIEtjb25maWcsIG1heWJlIGxpa2Ug
Q09ORklHX1hFTkNUTChub3QgYSBnb29kIGNob2ljZSwganVzdCBwb3BwaW5nIGluIG15IGhlYWQu
Li4pLCB0byB3cmFwIGFsbCBzY2VuYXJpb3MsIGluY2x1ZGluZyBzeXNjdGwtb3AsIGRvbWN0bC1v
cCwgamlxaWFuJ3MgcGxhdGZvcm0tb3AsIGV0YyA/IEluIHdoaWNoIGNhc2UsIG1heWJlIHdlIHN0
aWxsIHN1Ym1pdCBjb21taXRzKG9yIGZlYXR1cmVzKSBzZXJpZSBieSBzZXJpZSwgbW9yZSBlYXN5
IHRvIHJldmlldywgIGJ1dCBvbmx5IHdoZW4gYWxsIGlzIGNvbXBsZXRlZCwgd2UgbWFrZSB0aGlz
IEtjb25maWcgYXMgYW4gc2VsZWN0YWJsZSBvcHRpb24gPw0KDQo+IEphbg0K

