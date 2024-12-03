Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EF19E1723
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 10:21:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847503.1262580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIP4p-0002BA-FS; Tue, 03 Dec 2024 09:20:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847503.1262580; Tue, 03 Dec 2024 09:20:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIP4p-00029U-CX; Tue, 03 Dec 2024 09:20:15 +0000
Received: by outflank-mailman (input) for mailman id 847503;
 Tue, 03 Dec 2024 09:20:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x39C=S4=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tIP4o-00029O-Af
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 09:20:14 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20628.outbound.protection.outlook.com
 [2a01:111:f403:2408::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cbe5314e-b157-11ef-a0d3-8be0dac302b0;
 Tue, 03 Dec 2024 10:20:11 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 PH7PR12MB6562.namprd12.prod.outlook.com (2603:10b6:510:212::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 09:20:07 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%5]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 09:20:07 +0000
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
X-Inumbo-ID: cbe5314e-b157-11ef-a0d3-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T2WCnYVTlH5VWOi7zRvKKq1Qc/x9Oa5Hy46jixSAosBMqQz2TDRzsOX44huj4T02F++pN32bEarLKyAwxHmc2RgeK1ZgxaMu+axT+500uYm/p2xsOQ17/1xbQp3V2rCpP3P5NIbAKVqT3n9c9gCeiOHY4VUTXz849AkfIxS7g7sFhbvH66hBIcqFsLebVvAxHnO4jCTm2p5rc8bKQnNiyGvNd9h4Y+FWGaMl8Vjq+k/bDGAMPP9tcTun/t2ry9xESxt/HHH50kDet1/yupN3aQ3r0/DKyjgFp7+sfGHCpdNYmp9LbWu5jKPia3C0ljw+wEiARLMq45jSETL0V/quJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wpmG62rNwxUCRRSduoBNtHqYfSVIsRfGjwj5dP9BrEw=;
 b=D+v2DTkTzz7pCSpauHZVoUURcb/eQ2PnJske7HDDe0HZDx4WYBXcTaCx7AZpNN0ry/tp4Ucs+CKmNQdSWW9RqCYd237PfEkodQEDXgnHmX/ylZp+m+RbXQiZiLVwUS+vXmlLhPXA/GdB+nWOuWqmhewP+a6DBPdbI0c5PyRo10QJDErF99FI3ePGlmSlJKGr8QAGiRpRDlFjbKls4ILFB8gzhlQwv9Eyyk8tleVIy/X8v0j6dRzeGb/YOzSgTWx+YWdEyAAZ7PBvQOr8WYnobkghGiDeIiQB628ltvA/BJQd6rHCaEGQ05PGVDHVe4spv3pMtk5q/4p7gQTt78zapQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wpmG62rNwxUCRRSduoBNtHqYfSVIsRfGjwj5dP9BrEw=;
 b=O6W6AKoW9/j2cD3doKZN74NeCgR+Rjvva2GhfxYtjTmVdB+gEbSbF0K66MCwH8Mfe0V44W7+j6+5xA6k7/fgj5bE3xKPFDqS0SciK71zsC+DU7Kd1zuHh1vZclS+iH3tzEm4hpPcs7DmwHK956PFUVn+KVEKdgxq/Zi1FRO+xLI=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "Stabellini, Stefano" <stefano.stabellini@amd.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	"Andryuk, Jason" <Jason.Andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: RE: [PATCH v1 01/11] xen/x86: add CPPC feature flag for AMD
 processors
Thread-Topic: [PATCH v1 01/11] xen/x86: add CPPC feature flag for AMD
 processors
Thread-Index: AQHbRVvdfIbZFgMPg0manVVUsTPS8rLUMQcAgAAMzBA=
Date: Tue, 3 Dec 2024 09:20:07 +0000
Message-ID:
 <DM4PR12MB845131F8D9EAECD48345A510E1362@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20241203081111.463400-1-Penny.Zheng@amd.com>
 <20241203081111.463400-2-Penny.Zheng@amd.com>
 <99fb0003-8ad6-403a-9340-40d9dc322429@citrix.com>
In-Reply-To: <99fb0003-8ad6-403a-9340-40d9dc322429@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=407fcdab-ec81-48c0-a8ca-3e4e84714271;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-12-03T09:18:10Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|PH7PR12MB6562:EE_
x-ms-office365-filtering-correlation-id: 78c64f74-354e-47f8-a49c-08dd137badc2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Qk5vWkJwOTVIQXJ3NUh0alA3amRHaktrS3NpaXFjZ0owNUVHNmtZa0pJZ2Rw?=
 =?utf-8?B?emJEbSsyK0NrTVM1bGQ5R0UwVDVxQkFubS9PY2k4RFpDcTJzZllma2RhVGNS?=
 =?utf-8?B?SnZNWXdmV3lFY2NaWHp6MkRtWVFabFg3YlNycUsrMEhDNHJnUXhJN1VnV1dz?=
 =?utf-8?B?TkNoUnpNVk4wWkc3TVBzYUNHekxkbXRkM21XSmpmdHI0Um4xLzJzM0lzZ1FY?=
 =?utf-8?B?eXJ1aEpCRmtuYWZSV0RmNW1HMmlSVGl2N0lyL3dWSjZURHRUYXJGOHNLZm1s?=
 =?utf-8?B?aU9FMXpEemNWMjJVejlkT010R0ZWbnBscFVjNURDYWpVRnpNMDFpNVIybzZv?=
 =?utf-8?B?WVRmSTA1c2tmT2p2TmxHbE1vSUsxdzd4QkttZDNoRExXVDdlb3Y4RVBGY0pR?=
 =?utf-8?B?STY0dzdaK05RM1FqNjRIdjhOUUptR09JdFVFaHg1ZzFZcW1EVVhMM2VRTVVY?=
 =?utf-8?B?SWh1aUR3eEhzSFhZQ3AxdnNFSzhyVFVmVHZaWkJGNXZlWDRyWW1aOGlvaEwy?=
 =?utf-8?B?Rk1oVHhkUXlqMjlERnc5Nkx5SUp3TjhDZ3JSZE1nb0F2a3FlV04wYS9aTWpz?=
 =?utf-8?B?LzQvVkhWOXJ0dVVibDBKeE5WMzErMTI0M1oyVGhSUVFTY1g1Vkw3VldOU29v?=
 =?utf-8?B?VFZZOXBvMDNMRHA0VHVOTmxlYmN6Rkx0V2thY2VSamo0aWZmUjl4NnFzMFlk?=
 =?utf-8?B?djV5RUNaS0JGc29vYTdHZnNFS0xJdFMvemsrS210RTcxczFEWFI1R1NVL3k3?=
 =?utf-8?B?S1dpdkxaeDIzWVloUUp0dG4xVllHaUhyb1JIOStSVGhuU2xnUFFKZGhYeXd4?=
 =?utf-8?B?M3VKTTFUaFRVV2tlZ0ZuVkZzTUxSelBMcWFTSGp5V2JxdU9qL0lHZlR0QThj?=
 =?utf-8?B?WlZLREpkbGJVcVF6d2ZpK1NZZVlzQk0wK0FHVWNTYzRQaXhHVVZNVmYvckxx?=
 =?utf-8?B?OU5STmF3aFVrL0VYNjA1YldTZFFPeEZJc3g1THQvQ29VL0tMOHMrNjhKN1dk?=
 =?utf-8?B?WWNITFVvWXIxblNyd2xXazRNS1k4aDlTL2dlclQyNGpWQ296U25sTWVHUTVq?=
 =?utf-8?B?SkJlUUNyd3NZQWJUR05vTWxMMmJ3VzhndWRINFh5UnVkWXhDTlRmNEgyT2Ns?=
 =?utf-8?B?T1MzZlRMMjVBMVAwTGlyOXFsMW5FeXhDZ080R1lPSkI4dERvVVkxazNqamJv?=
 =?utf-8?B?YXg4eFBxeGhqdVdtb2lpdGplMS9aTHREYldyOXkrYkZiaTdVaVVTZEIwdkcr?=
 =?utf-8?B?R2V0TnFxN2hQdENDdjhQWU5ydmlLZ3BiNDN0STZKbFdZZ3R0TjI3Wm1Naklv?=
 =?utf-8?B?M1pDV3c2UUdsZE1oOEluR1VnNnp5aExtUkg5OFNVODdOREE0eklXeU4zR1ZT?=
 =?utf-8?B?Y1N1SjZ4aEF3QzJKNGVvbWpyQ0JVdjNtZjRZSTh2cVZaZjhLeWR6aXNKS1Fy?=
 =?utf-8?B?NFZGdmpobDIzTlVNVTBIdU1jMnZJNmt3eWlyaUxDenUvbU5pbmhWejBpaFZO?=
 =?utf-8?B?eEVvN0pmTjUwTkZ0cXhQSWNxeUpCVzhEeW5MVXRRWWpqeGZYU3htaXBkV3B1?=
 =?utf-8?B?c0ZwTUo2TzBUVWNSbHFHQ1JPZE4vd2xpWHhQeXJxb0VGSWFBTVRYUWswWndy?=
 =?utf-8?B?N2tvUEkyWFVsY0UvS0F6RCtYMVJnL1RpL3hOVG92bkJ3bEpMRk1GRkFFUk5R?=
 =?utf-8?B?NWV2V3NJZldjZ1JnQlMvMlBuRkZoMExxenlPTk9CVEJnSXZLNkRUMmU0cmxo?=
 =?utf-8?B?NFFhaVliN0JuWEIvSmNvT1ZmbThmdGpRWEJCSHJ1T1c2WVZuWnNldHNabXJF?=
 =?utf-8?B?UU1uQnFnUTdVNHVFd1BWdzYzVmFJbFQ4ZnV2aUJ0N0JzZGgvMlJFaXd5VUhY?=
 =?utf-8?B?eEd0MzFiRzJVZzZVeG5zVy8xRnR6NjNmdlc3T1R1K1NQb3htWUNpUmhUM1lU?=
 =?utf-8?Q?+lOj3/LTXjs=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d3VjM0FOSVJIajNHZFlXb0NpY3UxK01MaWIzdXNGZWwvZktKTjU1Y3d0Q0dM?=
 =?utf-8?B?c3R4Mm5SdVBHVDJqWW8yRC9jUDVyK1hyN2pSVEx2dHFKR2NMWGxkK3UvQXpp?=
 =?utf-8?B?dmVFRXZGRTFlb2FpWHlqL1JZbkpvT3BFbmtZRy8xa3pYak1XUVZkRUxabGRM?=
 =?utf-8?B?RlVVTG9BYmdDWDlHSHpMQS9IbXFHM0k4amVDMDNjbHhERG45RGdjUml0VC8w?=
 =?utf-8?B?emNIclAxN0FSWGJGakg3aFdieXFaUFZOY3JDK0VsZURIcFVsWE95bjU1NVpK?=
 =?utf-8?B?UVpSZjNxZitaTndkZ0YxbzdyNm4xZmM1cFl1Vm9ManI5WVArY2ZEdU5IdVN0?=
 =?utf-8?B?Nk1MQUJ3ZnY5c0t4VzZFckg5T3E3bFBycjAxUnJ6YlowdDlpdHA5QVJlMGs1?=
 =?utf-8?B?MjV5MnFKdGZiUEg1aC9OMEtINUJZMDcxOXZuSW5BY0djT3RUZTNlU1cxRW45?=
 =?utf-8?B?bHNpMU4zMTRVaFV0cEVjbDhmMlQ1ajFWU2h3b09rcm1paTlteVZTbm1ETDZN?=
 =?utf-8?B?QldYNG9ieXgwVkZ1NjAzRUFwZWk0ZDRnWVF3dlJQcjQyU01Za0gvakQxWjQx?=
 =?utf-8?B?NTljTmQrM05QT3NnRTJ3U1lQUjNTZmZ2TkhidGhSRTJDVi9KZVJTRDRtczhx?=
 =?utf-8?B?cDcyejB3eG1BWi9wMnNJdlhuY1NOOSswdGg5S1B3OUtLblpnZEw1RVJFNE5Q?=
 =?utf-8?B?MjUybkttUEVRS1F5RXVkTWdXdW9laXo4eGRkS29nanZpWXQrdVhsWkZEeUI1?=
 =?utf-8?B?NDVpQ0U0V1Q1WGJ4NkhqMTRzRTRUSWg5NzFZeGl1UXNUck1WTU5pR3pQMmd6?=
 =?utf-8?B?ZHlwaTBjZGFZUklMK3NMYVQxb3hlTmEzM3hjSjBBdVNVYTRpcy80blg5Mktl?=
 =?utf-8?B?MC9DaTZyNDZZREZ2Uy9BeCtJSDA0TVhWMkw5SnI2MHNDMkZTc3JsWU9Jdnov?=
 =?utf-8?B?Ny9TNHl3RUx3b2wrT2pmZVZrMmdKdUpzbnBRZkJwZWY2NUhoRTYvdWpMU1F2?=
 =?utf-8?B?WExrdU5TZjVnNW5sd0M3OXZ1SXdXWWxlWWxvTnB5WG1kVElHUzdCSEhjK2tC?=
 =?utf-8?B?V3JIOXVSekF3K3VnNUJkcHcyZXc3dFNpWjJpMUc4a284R1pDdytFQ2RsaXVX?=
 =?utf-8?B?WkMraEtYcjBwZE83Y2tCcXVpWnAwRUdOWFlMUlJxOGRCb2dqaEpqdWxqaW9r?=
 =?utf-8?B?TGR3U0oxVGRleURqSUxabU9lemRHYm9FclMzM0VBMzRrbVpoRVE0YWFvOCtN?=
 =?utf-8?B?TGRUa0hVZHROQnppTnJHUUY4ZWNxOEM0U3dxdmNCbjNiQVF6dUVaR2k0WDNl?=
 =?utf-8?B?VXhWWm5wSkFBcFJtMXBOQlZyWW5kYnVzdzV5bERlZnBQbys4MkRRSFdISlA5?=
 =?utf-8?B?V3p3dVBVQS8vS0ZwdzN1dmNYWDhtU2hMSVJXWWhZRVRIMHhNZUNKZ1JHdkMw?=
 =?utf-8?B?OFYxc3dlY2xtVjM1bzlKTTJ1aWNHRUM0VnJIcU5tU3d4Y3ltYkFQRTY1c0pq?=
 =?utf-8?B?Wm02eFdRR3RYUGl0WS9rbkJLMjNFQzlOT1czenNySkFXSWV3SExOMFY3Z3hW?=
 =?utf-8?B?Q21mZ0NYRmFOSUk0eEVQN1hSaW5XNFEvMi8vZkhlbjBjS0JveWVCTEdoQkd4?=
 =?utf-8?B?R09mU2pYTUlJVTlxSzVzTDFqcVFIb2lmTFpEYjRIczBCdFBpbGszSU9vK0JD?=
 =?utf-8?B?L1lLTVNHZTdUSHlBMXdkNUljR0JRMGdxcDJTSTFqc2RwdFNVNHVlTzJTUjVi?=
 =?utf-8?B?c2RHS1BjNDVObm5BWFdPeHBwRDlwRk9MS0cwOVFLYVVpSE9VcXJLOUtiOHd5?=
 =?utf-8?B?TnczMzl0cVhxNEY4emYvbURWYVFoTlhJZERjc3d6Qmo4K0hSdFo0ZExod3Jx?=
 =?utf-8?B?M1A1Mllna05JblF4UmJ5Tm42WUJxb1RBOWxPZ3dBbXNRN05zTWdoWkZJRFI1?=
 =?utf-8?B?bDdFeGZRV3hRbEUrTzVmbFE0ZEhLZ2w1NThDZzBCL3FIUHhGSzNvNUc1YUpt?=
 =?utf-8?B?RElaT1AvT0R3Q3ZGZlNjanpkQVFBNDczSGNDL3ViMHJiMWVmSGlmSGE4ZzJp?=
 =?utf-8?B?dWROekZMZjlQMlRIa3F3M0RlaWVYYndEcGZ5bVN5OXdEWVlCenVHVnp4WDdm?=
 =?utf-8?Q?2mXU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78c64f74-354e-47f8-a49c-08dd137badc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2024 09:20:07.3539
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +t/zmztUsHGnIHGRYkPs8jwPvERtEIFZguXxgqgirNJeVAngfWip0I3vW2lxCtzyVTauVtgIimdxksrMKLnf1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6562

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4gU2VudDogVHVlc2RheSwgRGVjZW1i
ZXIgMywgMjAyNCA0OjMyIFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5j
b20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IFN0YWJlbGxpbmksIFN0
ZWZhbm8gPHN0ZWZhbm8uc3RhYmVsbGluaUBhbWQuY29tPjsgSHVhbmcsIFJheQ0KPiA8UmF5Lkh1
YW5nQGFtZC5jb20+OyBSYWdpYWRha291LCBYZW5pYSA8WGVuaWEuUmFnaWFkYWtvdUBhbWQuY29t
PjsNCj4gQW5kcnl1aywgSmFzb24gPEphc29uLkFuZHJ5dWtAYW1kLmNvbT47IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT47DQo+IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYxIDAxLzExXSB4ZW4veDg2OiBhZGQgQ1BQ
QyBmZWF0dXJlIGZsYWcgZm9yIEFNRA0KPiBwcm9jZXNzb3JzDQo+DQo+IE9uIDAzLzEyLzIwMjQg
ODoxMSBhbSwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4gQWRkIENvbGxhYm9yYXRpdmUgUHJvY2Vz
c29yIFBlcmZvcm1hbmNlIENvbnRyb2wgZmVhdHVyZSBmbGFnIGZvciBBTUQNCj4gPiBwcm9jZXNz
b3JzLg0KPiA+DQo+ID4gYW1kLXBzdGF0ZSBpcyB0aGUgQU1EIENQVSBwZXJmb3JtYW5jZSBzY2Fs
aW5nIGRyaXZlciB0aGF0IGludHJvZHVjZXMgYQ0KPiA+IG5ldyBDUFUgZnJlcXVlbmN5IGNvbnRy
b2wgbWVjaGFuaXNtIG9uIG1vZGVybiBBTUQgQVBVIGFuZCBDUFUgc2VyaWVzLg0KPiA+IFRoZXJl
IGFyZSB0d28gdHlwZXMgb2YgaGFyZHdhcmUgaW1wbGVtZW50YXRpb25zOiAiRnVsbCBNU1IgU3Vw
cG9ydCINCj4gPiBhbmQgIlNoYXJlZCBNZW1vcnkgU3VwcG9ydCIuDQo+ID4NCj4gPiBSaWdodCBu
b3csIHhlbiB3aWxsIG9ubHkgaW1wbGVtZW50ICJGdWxsIE1TUiBTdXBwb3J0IiwgYW5kIHRoaXMg
bmV3DQo+ID4gZmVhdHVyZSBmbGFnIGluZGljYXRlcyB3aGV0aGVyIHByb2Nlc3NvciBoYXMgdGhp
cyBmZWF0dXJlIG9yIG5vdC4NCj4NCj4gRG8geW91IGhhdmUgYSByZWZlcmVuY2UgdG8gd2hlcmUg
dGhpcyBpcyBkb2N1bWVudGVkPw0KPg0KDQpZZXMsIGh0dHBzOi8vd3d3LmFtZC5jb20vY29udGVu
dC9kYW0vYW1kL2VuL2RvY3VtZW50cy9wcm9jZXNzb3ItdGVjaC1kb2NzL3Byb2dyYW1tZXItcmVm
ZXJlbmNlcy8yNDU5NC5wZGYNClNlZSBwYWdlIDYyOCBmb3IgQ1BVSUQgRm44MDAwXzAwMDhfRUJY
IEV4dGVuZGVkIEZlYXR1cmUgSWRlbnRpZmllcnMNCg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTog
UGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFtZC5jb20+DQo+ID4gLS0tDQo+ID4gIHhlbi9hcmNo
L3g4Ni9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmggICAgICAgfCAxICsNCj4gPiAgeGVuL2luY2x1
ZGUvcHVibGljL2FyY2gteDg2L2NwdWZlYXR1cmVzZXQuaCB8IDEgKw0KPiA+ICAyIGZpbGVzIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4
Ni9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmgNCj4gPiBiL3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2Fz
bS9jcHVmZWF0dXJlLmgNCj4gPiBpbmRleCAzYTA2YjZmMjk3Li42OTM1NzAzZTcxIDEwMDY0NA0K
PiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmgNCj4gPiArKysg
Yi94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oDQo+ID4gQEAgLTE3MCw2ICsx
NzAsNyBAQCBzdGF0aWMgaW5saW5lIGJvb2wgYm9vdF9jcHVfaGFzKHVuc2lnbmVkIGludCBmZWF0
KQ0KPiA+ICAjZGVmaW5lIGNwdV9oYXNfYW1kX3NzYmQgICAgICAgIGJvb3RfY3B1X2hhcyhYODZf
RkVBVFVSRV9BTURfU1NCRCkNCj4gPiAgI2RlZmluZSBjcHVfaGFzX3ZpcnRfc3NiZCAgICAgICBi
b290X2NwdV9oYXMoWDg2X0ZFQVRVUkVfVklSVF9TU0JEKQ0KPiA+ICAjZGVmaW5lIGNwdV9oYXNf
c3NiX25vICAgICAgICAgIGJvb3RfY3B1X2hhcyhYODZfRkVBVFVSRV9TU0JfTk8pDQo+ID4gKyNk
ZWZpbmUgY3B1X2hhc19jcHBjICAgICAgICAgICAgYm9vdF9jcHVfaGFzKFg4Nl9GRUFUVVJFX0NQ
UEMpDQo+ID4gICNkZWZpbmUgY3B1X2hhc19hdXRvX2licnMgICAgICAgYm9vdF9jcHVfaGFzKFg4
Nl9GRUFUVVJFX0FVVE9fSUJSUykNCj4gPg0KPiA+ICAvKiBDUFVJRCBsZXZlbCAweDAwMDAwMDA3
OjAuZWR4ICovDQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLXg4Ni9j
cHVmZWF0dXJlc2V0LmgNCj4gPiBiL3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLXg4Ni9jcHVmZWF0
dXJlc2V0LmgNCj4gPiBpbmRleCA4ZmEzZmI3MTFhLi4xNWY3MDc2MzliIDEwMDY0NA0KPiA+IC0t
LSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLXg4Ni9jcHVmZWF0dXJlc2V0LmgNCj4gPiArKysg
Yi94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC14ODYvY3B1ZmVhdHVyZXNldC5oDQo+ID4gQEAgLTI2
NSw2ICsyNjUsNyBAQCBYRU5fQ1BVRkVBVFVSRShBTURfUFBJTiwgICAgICA4KjMyKzIzKSAvKg0K
PiBQcm90ZWN0ZWQgUHJvY2Vzc29yIEludmVudG9yeSBOdW1iZXINCj4gPiAgWEVOX0NQVUZFQVRV
UkUoQU1EX1NTQkQsICAgICAgOCozMisyNCkgLypTICBNU1JfU1BFQ19DVFJMLlNTQkQNCj4gYXZh
aWxhYmxlICovDQo+ID4gIFhFTl9DUFVGRUFUVVJFKFZJUlRfU1NCRCwgICAgIDgqMzIrMjUpIC8q
IQ0KPiBNU1JfVklSVF9TUEVDX0NUUkwuU1NCRCAqLw0KPiA+ICBYRU5fQ1BVRkVBVFVSRShTU0Jf
Tk8sICAgICAgICA4KjMyKzI2KSAvKkEgIEhhcmR3YXJlIG5vdCB2dWxuZXJhYmxlIHRvDQo+IFNT
QiAqLw0KPiA+ICtYRU5fQ1BVRkVBVFVSRShDUFBDLCAgICAgICAgICA4KjMyKzI3KSAvKkEgIENv
bGxhYm9yYXRpdmUgUHJvY2Vzc29yDQo+IFBlcmZvcm1hbmNlIENvbnRyb2wgKi8NCj4NCj4gVGhl
cmUgbmVlZHMgdG8gYmUgbm8gIkEiIGluIHRoaXMgcGF0Y2gsIGJlY2F1c2UgaXQncyBjZXJ0YWlu
bHkgbm90IHJlYWR5IHRvIGFkdmVydGlzZQ0KPiB0byBndWVzdHMgeWV0Lg0KPg0KPiBJZiB5b3Un
cmUgaW50ZW5kaW5nIGl0IGZvciBldmVudHVhbCB1c2UgYnkgZ3Vlc3RzLCB0aGVuIHRoZSAiQSIg
b25seSBnb2VzIGJhY2sgaW4gYXQgdGhlDQo+IGVuZCBvZiB0aGUgc2VyaWVzIHdoZW4gdGhlIHN1
cHBvcnQgdG8gY29ycmVjdGx5IHZpcnR1YWxpc2UgaXQgYXBwZWFycywgYnV0IGl0IGxvb2tzIGxp
a2UNCj4gaXQgd2lsbCBiZSBYZW4tb25seS4NCj4NCg0KVW5kZXJzdG9vZCEgVGh4IGZvciB0aGUg
ZXhwbGFuYXRpb24uIEknbGwgcmVtb3ZlIGluIG5leHQgU2VyaWUNCg0KPiB+QW5kcmV3DQoNCk1h
bnkgdGhhbmtzLA0KUGVubnkNCg==

