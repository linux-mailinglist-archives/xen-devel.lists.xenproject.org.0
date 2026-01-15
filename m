Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BF9D2403B
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 11:49:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1204777.1519351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgKuS-0005sB-68; Thu, 15 Jan 2026 10:49:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1204777.1519351; Thu, 15 Jan 2026 10:49:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgKuS-0005pp-2q; Thu, 15 Jan 2026 10:49:00 +0000
Received: by outflank-mailman (input) for mailman id 1204777;
 Thu, 15 Jan 2026 10:48:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cICa=7U=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vgKuQ-0005pj-Oe
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 10:48:58 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9c5e020-f1ff-11f0-9ccf-f158ae23cfc8;
 Thu, 15 Jan 2026 11:48:55 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA3PR03MB8253.namprd03.prod.outlook.com (2603:10b6:806:460::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.6; Thu, 15 Jan
 2026 10:48:52 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 10:48:51 +0000
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
X-Inumbo-ID: c9c5e020-f1ff-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cNHTZ6YSwe3K6lsme5ecCkrmm60mbukPGJjx0Mhc2Lr+Bat+60Nmty5Oe8UXoNIRN+tyQE9LjVIX6wusho4Prtup5ofxNL2zbkpFZE23329hi06JlmvjVhBTfgJsPGD3Rnk6X0dQ+1YYljiBCCzGBjKx9QCFdUdojZnQRQiBl5Bjaf8kxHcICiI5CHacwqSNucBEWLXU6U1GbiDl0D0Z7QNXqIpNXCwVVdB/kJlpUxtw+fDVGjAZdvMZr6tvP89BitBlLQuJF6mIhV9lIY16EaLe1Ayg0rKCBYucGp4RcqghXzc1LB0h9xzp+gHRREkh6HWwNZSxJNTaFxz2OrF5HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LlVpFKCHmOhYc/17Woga3RbyZhaYj8zZbHJcIq5OwbM=;
 b=pzWMbracWm78c1WwN5dY2pUwyGz4eTCTL7NF//M/LDNSlYJBDBAeSbljGBHjAxRBVYrdS9sXudpLW5JscYUbrxlKi053wgJX7mvQh4LIzKSm6qnvUXATUlB4beqI9HHbeDVyABoZnNqAUhq3cpCl2eOqVcogyKc9JK6iXBSzUqgCcK5OEdSwqtezlaKFbiUsI132jv4syN/yoJXPQ3arjL/Pp4JSjVxH0P8AC1H93qBy+fxde0QB5ydSpsheg5rqaMagVyO5opJ9ox/YJ94+6FoyhmXdoS106xwHBBQnFZwNbJMsc+j9p8l6Spu8/v/cETjY4uvF7+Ay1PRVsYmC9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LlVpFKCHmOhYc/17Woga3RbyZhaYj8zZbHJcIq5OwbM=;
 b=c9hNJbl0yH0+5ASIlOzUXXZsd+2OdiVIUWxcZhNwT1oIxH5SVCHJi4usAQid5UkeHjrOB9ceU6FkmJMq3N+kzeOLAXWyO0EjUshFn38cqCzYOaEGscAoSPmc4b1MMQZxs2UQdWoGTj50j5nn1CYCq2/Wz+dhdJwAU4VVhAyzwrA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 15 Jan 2026 11:48:47 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] xen/mm: limit non-scrubbed allocations to a specific
 order
Message-ID: <aWjGDy3ixLRTpZbF@Mac.lan>
References: <20260108175536.82153-1-roger.pau@citrix.com>
 <20260108175536.82153-3-roger.pau@citrix.com>
 <b547676c-ff2e-4a56-b3b4-2b2da167e2f1@suse.com>
 <aWZQLL997K3MTQY4@Mac.lan>
 <b535344e-1f27-4d5c-85aa-1529868f85fc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b535344e-1f27-4d5c-85aa-1529868f85fc@suse.com>
X-ClientProxiedBy: PAZP264CA0208.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:237::21) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA3PR03MB8253:EE_
X-MS-Office365-Filtering-Correlation-Id: 01f6bdd9-a4ff-4295-d83b-08de5423abc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YUdBaFVGUS84S3dBL3RhZnF3M1FSL3hta2U4Q09Qd2VMVTlTSFhRTDBFeWk0?=
 =?utf-8?B?a2ZnMm5LMmRBbWpZOE1Zc1dHZ1RBS2pESVBVdXpsbm9FelB2UngrdTNSSW53?=
 =?utf-8?B?c054RmNEcXVKN0pIdXRvYklaTDFsZFJua0xRU2l2RHRGMjRzUTBtRHV5bUti?=
 =?utf-8?B?OWs1TzNmTnNQT3loa0szWllYUlFEbnQ3emV1WUVUb0ZZNkN1dVBESmVLTFNY?=
 =?utf-8?B?WS9vRVJjckJERVNWTFBJRStJVVJKYk9yUGIyYjdGVElWaTRWcmdHVGxBc0M5?=
 =?utf-8?B?b1V1eWFNMFU1czI5ZjNZclcrTE1CcmpGd1E0dGFIdm92aGx4V1IzaTF2N29x?=
 =?utf-8?B?QnAvOUxUSHlpdEdpSjhuTEJ2UmpqeTNKV0dLWGtsejZEM2NraXIzSnNWWkJF?=
 =?utf-8?B?cDhiRzhYTXBEM1M5cDFFWjAwbzd3ZjV5VCsxcGRiOXRlVXZOaW5ucjhodXVU?=
 =?utf-8?B?UkpmL0o0cTVxTmZxMk9kK0U4SExWSEhaUlYrdFllKzY3RlJoWkNzTTN0dHl0?=
 =?utf-8?B?bTBwVUlpa2g0TjBSZ2xqZVcwZklORzZOK29lMEVTcGFrUm5NT0FhcXR3MU11?=
 =?utf-8?B?QmJnSnpSSmZuVW5DT053WTAvVVB4a05FVExvOFpiQVdWL0lDOFJ1Y3MvYWFD?=
 =?utf-8?B?OHBnN01qQTEvd2g3NkUvWElxaTU1M252a1o2djBBZkNYL2ZrSjFVSmpqZ1px?=
 =?utf-8?B?SkxCQ21RZ1FjYlBLWVhnZ2xJczliSisrQVlLNnEwOEdJUFA5eUVuL2d0czRP?=
 =?utf-8?B?Y3VVR3p0YlFxUFlVbFBUR0U1Mmk1SFcvaDk4NkMxeFhRVit5VXg1WGhTMWhI?=
 =?utf-8?B?MW5Wd2g3cXRhK1dnaWsvMnNrakZNbU5CWHovdFNmN05DOHRndmFnOENzRHVF?=
 =?utf-8?B?bkNFcFB1VVZiRnBicEYvOUs5cHhQYmNjL09CcFlkR250aHdPZ211UjR2Y2tP?=
 =?utf-8?B?eVRZMTNQY3pSbk0vU21rY0pTWUhXSTBFTE5pbm16TkpqSVdyNm9mTkFPNTQ0?=
 =?utf-8?B?YlphWUoxRVFiclFXMnhNd0VlUEd0VDhEL01CcnhIcjRpd3IvYkgzZGtTRDFn?=
 =?utf-8?B?VXBSa2REZE85ZFRNb0ttaWZlQ2ZlSG9XM1J1aW1YdlNTcldOMzZsRXAyMFQ5?=
 =?utf-8?B?L1lmdHA0RS9MaW1kZk8yWHgvLzVsZ251d1FBbHJtbHY0cU5qUFY0MUhiQm02?=
 =?utf-8?B?bXhNemR6dEVBY2MyRG94QUVZMGN3Wm43akVEUGszdTJTK2NmQTNnYTRVNnBl?=
 =?utf-8?B?NFJvY3NGcHl6QlhVM0ZHSUQxSnhXQVZtMmt0SmZ5cjkxNXNxUk1SWFR6aWtN?=
 =?utf-8?B?a0I2VXRHOHV6aXNGV3gwL2V2VFFXbC8rd1hWOHdmbDU0b2UyVWV5SGF6cENq?=
 =?utf-8?B?MDhWanRUSFRYNU4vMTBXSmlyZ3hFSXB1cVhPUlJ2c3NLYXptMHJydDg4dTJp?=
 =?utf-8?B?SkJFOUVQN0JOWWhaSlhrUHUzWmxNQmRtQmljNThwTzdKUkgxQ1VwdlljNU5u?=
 =?utf-8?B?NnpqVnFnNmxNQ2NDWm5DWlhpQ29FT2RtSHV6MzVWQUtvMGxFOWZLYkI3VjU4?=
 =?utf-8?B?ZXhjQ05xLzZjNmdQYk5YYm9ISVVYK3RlSGFRTWFBbUV2Q0dLSVVIV0RETFA4?=
 =?utf-8?B?MGRINW9CN0d5VU9MZ2ZPaCtHdG9IRzhTUU1DUFQ5d3BvTTEyV1VtOW5VRVdF?=
 =?utf-8?B?VU9UZTdmVkdmRmtnbW1zaUo1d1BiTDRWeDFOSjRDS3pPcENXQVY0NEtiWEcv?=
 =?utf-8?B?Y3Q3WUtTc1E3a1F0OUtLSm5vVkNzejZmU2hNUTdqQlo4YnBRM1JCU1AydE9Z?=
 =?utf-8?B?Z1djY1FYbUlnR1QrWlluNnptc0hpeUkvUDdqcTNjYXA1RWxVZWV3K2RKZ29T?=
 =?utf-8?B?TVh5MTRXeU5Td0RLcm02UW9SSkM5Ui9CRFgxanJCZ3JkZDJSNEtKbU4xeTJW?=
 =?utf-8?B?WjF6QWhtcDF3QncxZk9iSUxYdy9HQTRDRGNjTWg1NEVDb0hhZGhVWWttUkdy?=
 =?utf-8?B?Z2xIT3JnMldNS0RwckhtSk9sbWFZenYvbU9HS2NiWERsdVlVQUd2S3pVMXM1?=
 =?utf-8?B?U3ZMaFFqN09INnFtSjhSbE1IYitpZlhuUEVpL050dFlwSXh1YzRjclZNNlFB?=
 =?utf-8?Q?zIqc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1FSZUxaK253bFc5eUVNSlBJYVduMHg3cmNYTm9PNXpHZk5IbXNZajdjL3RL?=
 =?utf-8?B?TkY0cFJuMnkxTlNyZ0JtRTZiT0QxOFlCeTdEeVllMGtrUDhYRmVNOGdtZ3pq?=
 =?utf-8?B?aDdiZWNWVTJyU29oa2VzS2VpYkZaSGJjaUlNaTUxenpWaVlyWFl4aGpMb3B0?=
 =?utf-8?B?Y3luRG9pcThNdklpM3dFdWUyQWxGcStjUTJ5bXhxSFhpVEM5aVkwMlpPUGJy?=
 =?utf-8?B?TnVnbzFsOStTWTdoQnRmaTEvTGEvdzg3dVMrdG1EUjlYQWYxbHVlTTVrNjBr?=
 =?utf-8?B?NWk0L01nOEI2c2RaYjBxNEFqQVdkTDQ1TDVYVUdnQ1lhQ1N5a1Q1cHpsUmpm?=
 =?utf-8?B?ZSt3MXZqdlU3SkR3Mmt1VUlZcm9heWUxYWNaSExuZUtuOWpXVnZxOURnTmVh?=
 =?utf-8?B?Z2xJdkJyY2ZaNit5TTVaR3hGcTN1VnJCVmFSamgwRktUMHZDZUFrWHJNaWpm?=
 =?utf-8?B?dFRiRnVDcW14WVU3a0FvbDdVZFVPdEhwVWU4U1l2TlVmc29FdEFpOFJGbmw4?=
 =?utf-8?B?eWNlY2dnZFBxLzAzd2ZYREpnV3padi9lWW90Sk9qNVMvdm80aE9zbEQrYXBm?=
 =?utf-8?B?TE02eSt5N2Y4Wk1WTnI2KzRuOHFFakYyWFExTHIvMXR3VUl2NE9BN0N2VGhW?=
 =?utf-8?B?bU1rSVFGaUZna0FCRmRPVlpyS2YxOVV5MmFOM0ZTb0EvR0xSL2pwZlU5a0l0?=
 =?utf-8?B?NlBKamZ1Ylp2allyMk9YWXVndElPRkEvR0ZJaEo2a2lRNFVpODNVMEM2REhK?=
 =?utf-8?B?MzdUYjhmN3BPbHp0VW9HUmdMNFkwdmRiUTNRc3FyRVpSRXlhZHk1cWNuWDQr?=
 =?utf-8?B?NE02TG9yS3BETHhzODhYTVpsU0JwbGZQanB3R0NIdWE1Qks1SVJic2Nsc0ZU?=
 =?utf-8?B?Wng3RmgzV0UrTmRVK2trbExScXJoeTRseHYzazVYRUNCekhhR2x1by9yVGpw?=
 =?utf-8?B?SXRPQjNXK0M0anFvQkxPSklLR0Z3ZDg0cXlsV01PTmdtYTBodHBYc2F5OGJu?=
 =?utf-8?B?L3liNG1WcnhaMC9SN0x3K0V4SHREWkV5NWt0Y0RVNmo1bVRTREZQeWc3RHZq?=
 =?utf-8?B?MkVRckpseTIxMFF0Y0pwWVVTN0plUnJmREZ2UjJLOWFEMmFtUXN0UGtMcnVG?=
 =?utf-8?B?MEdVOW14SEIvSHQ0RTBUWk5udWtmcWJvd29VUFU0OXJmMTVqbGJPQzFpamlj?=
 =?utf-8?B?VWo3R2RkaFRsWjJYdnVOdE5KN1ZFMldSYXRyd2ZUd20vcHBNbVM4bUhIWDU2?=
 =?utf-8?B?ZGhqNkdUR1dyWkw5Z0ZnaXlJWktJdUQyeXNTcU1SMkZYajFPNVRZVU1VcmxD?=
 =?utf-8?B?WmlkVGdVZ0VHKytNUGJpZU1qMlE1UUVyRE4zMytvU0lpbXZxMHJmYU8xbTJP?=
 =?utf-8?B?dHpYNWVpL2ljV3dEWG10M2oyVkN3ZFBFUFVrYSs3YnBkU3ZiMlVISFIyT08v?=
 =?utf-8?B?UW80enZpdzcvTWl6d09vQXlNSS8rcGdHK0JLYzFpRnZBbVgzKzYrMmFPNFpp?=
 =?utf-8?B?TWQvTU9Bbkl1eWZ3cEJpZ1A5VFZZVjMwRG02Z0RVdW05UUdabU9NMmV0c0I5?=
 =?utf-8?B?K3IyS1huaTlYVHBJWE94Mml6NTZHV3QxTkZUcW9rSlBmVHB6cUVhRHpDOFRO?=
 =?utf-8?B?akZtbGJib3lHYktrV2Mva1doK2s3cnllbGFNVUJkTkc4cThtMmROOHJISDlp?=
 =?utf-8?B?L2diSW9KWUFQejE4L0Y4cGc0Y3hxNXdWMHhyOGlQdXI2dkxLTmx4UkswOE0v?=
 =?utf-8?B?bGMrdEdXcDhRVU52bDVwVGx6MWhsVHQ1ajhpRGllc0RDL1BxT0JsWkVhclpF?=
 =?utf-8?B?c3R0Y0F1QnVZY0F1TkVYQktWejZzbkpNLzM2MnNaRHpSdTBCRlF5aEQvTitz?=
 =?utf-8?B?N2ZXdjdHZnVMMDhWVTI4Q1RodVZFVStDZjJ6a3RxTzVETUFWK2pXdVBYdGpx?=
 =?utf-8?B?YnNkMndsS2RIYzhWYmg2QnN1K1RaUDkrUTUxbC9zRHhJY3lSVVB3NGY2aFhO?=
 =?utf-8?B?MFdrR3lLN2RVTVV1NmJvZDM0SExqekdoVXN1MHVQUGprb054Ulc5VC95OUs0?=
 =?utf-8?B?S25tUk5mQ1lyUDRsaFE3ZEJyQ0QyY1R3dDUvemxQTnlhbEFVTUNKbnRlU0Fm?=
 =?utf-8?B?VW9hWmdBUzg0cFlBV0dERG5HSkFCL0JwL2Frdkhyc0J6U3BURGV5N3hGOWtv?=
 =?utf-8?B?ZXBlUlFjVzdLUSs1eHpFcFdLYUpsY04rb1ByelRzcTZxTDR6RVM0VmU3U0ZM?=
 =?utf-8?B?V2l3bjh6UWptTjJ6OUh2ODFLd3VIM3VQci9jNXZCUzdvMDdXUHdVM0JqSVVY?=
 =?utf-8?B?UHhNb2ZrbTdWdE5XQXR2MEVha0pXbTVtbWlKRnF6RndINTA0ckNZUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01f6bdd9-a4ff-4295-d83b-08de5423abc6
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 10:48:51.8134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ltOJKC9VGljHuhWv97sqFe1LFSSoVDEyVZMq/Yu3bbw6h3SUoDc8upFJ5Zuw7Y4f79DqtU1vvl6Bwukkol7NQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB8253

On Wed, Jan 14, 2026 at 09:48:59AM +0100, Jan Beulich wrote:
> On 13.01.2026 15:01, Roger Pau Monné wrote:
> > On Fri, Jan 09, 2026 at 12:19:26PM +0100, Jan Beulich wrote:
> >> On 08.01.2026 18:55, Roger Pau Monne wrote:
> >>> --- a/xen/common/memory.c
> >>> +++ b/xen/common/memory.c
> >>> @@ -279,6 +279,18 @@ static void populate_physmap(struct memop_args *a)
> >>>  
> >>>                  if ( unlikely(!page) )
> >>>                  {
> >>> +                    nodeid_t node = MEMF_get_node(a->memflags);
> >>> +
> >>> +                    if ( memory_scrub_pending(node) ||
> >>> +                         (node != NUMA_NO_NODE &&
> >>> +                          !(a->memflags & MEMF_exact_node) &&
> >>> +                          memory_scrub_pending(node = NUMA_NO_NODE)) )
> >>> +                    {
> >>> +                        scrub_free_pages(node);
> >>> +                        a->preempted = 1;
> >>> +                        goto out;
> >>> +                    }
> >>
> >> At least for order 0 requests there's no point in trying this. With the
> >> current logic, actually for orders up to MAX_DIRTY_ORDER.
> > 
> > Yes, otherwise we might force the CPU to do some scrubbing work when
> > it won't satisfy it's allocation request anyway.
> > 
> >> Further, from a general interface perspective, wouldn't we need to do the
> >> same for at least XENMEM_increase_reservation?
> > 
> > Possibly yes.  TBH I would also be fine with strictly limiting
> > XENMEM_increase_reservation to 2M order extents, even for the control
> > domain.  The physmap population is the only that actually requires
> > bigger extents.
> 
> Hmm, that's an option, yes, but an ABI-changing one.

I don't think it changes the ABI: Xen has always reserved the right to
block high order allocations.  See for example how max_order() has
different limits depending on the domain permissions, and I would not
consider those limits part of the ABI, they can be changed from the
command line.

Thanks, Roger.

