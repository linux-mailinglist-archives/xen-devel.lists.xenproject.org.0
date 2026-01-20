Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKX5Dyu0b2nHMAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:19 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3644822B
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208938.1521068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viBny-0007Nu-N3; Tue, 20 Jan 2026 13:29:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208938.1521068; Tue, 20 Jan 2026 13:29:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viBny-0007ML-Iu; Tue, 20 Jan 2026 13:29:58 +0000
Received: by outflank-mailman (input) for mailman id 1208938;
 Tue, 20 Jan 2026 13:29:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h83G=7Z=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1viBnx-00076a-9Q
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 13:29:57 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b8bc0f4-f604-11f0-b15e-2bf370ae4941;
 Tue, 20 Jan 2026 14:29:56 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB5814.namprd03.prod.outlook.com (2603:10b6:510:38::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Tue, 20 Jan
 2026 13:29:53 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 13:29:53 +0000
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
X-Inumbo-ID: 1b8bc0f4-f604-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qDpmRyx658HqU2LHnhPkEc15jkUVrFkywiqJl3ZbzMssHbnF0B3w08DJesCIA8mgRiCye2duMbkGMSbjpBScGktqg85kcp3PJqBckxuRYrbQPQPNz7QvtbMyLWZUHDU0CXFw+UPToT+dmOaRdQuLrml6FIJ5JK1ejZwANU6Kzf9+FdRc46LW50a/cRCgyZCKUTeG6THoI6LWaO3ORARfg1m79RtGjeeoXcpLMpv78JHMC473gcE7HwtcNDIVRUbe9gQs+4eRDvR2c3G1bqzGPa8noxk49+UNcy142PFw0sbtaE09Hu4sXJIcE21R+C1RMLFVqfv4LwWpV3UlWL04ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c3KrVPRaIiECjYbYSaGxk2ViYhhaRcd18ddTvf/i5ko=;
 b=wizV+IlqfLslykvbRpH2DMwe/wTVkAwEpq1apKCVDIACG7Kb6ggk334tQVRj84i3N3/lyUdE7HqSCyWVC2f9Gn9HCe/LP3wUIG8zNksTnS40DMwVgdwnvhtH6so/uFm5XXpAKhg4wDkfLyblcqIlf8S9kRorS4sovhkPNy0OlWl9QdHOC05whx1lpOvS1SpgLNgl2fD86ATRf1TBrPDx0iEVCKFfg+tNIKOyGLnIhfdk4nwAo+5wos4+jkpRk+pALawyWjZXZdXCR7Ruy6yIoopd88J9qekLQsf847VsuYj7Qid0aRpUu17WNmCQxQIeNaNO2ZdBMKaagcCIRHn8RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c3KrVPRaIiECjYbYSaGxk2ViYhhaRcd18ddTvf/i5ko=;
 b=J+VEdOb/HWyW9XJX4/nbMrTAiHgQuS+TRz0zP/BhqL2GB8x1j3Rz+lQydQiNco9zGZ1Zg82r+cSfgQU+0fFGOdeYaFYjew/4mO0kY1PSRf8JKBTnlpwCOldlFW5tiCDNMUWNjjUirccPDbqZRxfWf0w3wwT+dRtF0wXej2igzpo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b8df289c-a770-4186-b922-dbfba1bbbfc6@citrix.com>
Date: Tue, 20 Jan 2026 13:29:49 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/2] x86/svm: Intercept Bus Locks for HVM guests
To: Jan Beulich <jbeulich@suse.com>
References: <20260120095353.2778-1-alejandro.garciavallejo@amd.com>
 <20260120095353.2778-3-alejandro.garciavallejo@amd.com>
 <5a4aa1d9-dafb-453c-bd4c-8da860519f01@citrix.com>
 <00f36b33-65d5-4681-84d5-e1b2cbd8830d@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <00f36b33-65d5-4681-84d5-e1b2cbd8830d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0046.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB5814:EE_
X-MS-Office365-Filtering-Correlation-Id: 063e26b3-d214-418c-c7fa-08de5827fe7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VFFmTGxvVXVwc1NlRUVIZ1ZhNkh3NS8vWkc0MVI0N1d1aEswSXNVdHFxbXU4?=
 =?utf-8?B?WmRyeTZXbkxLaHlOTG1qV1J5MmxvRFZGSkhsc1F5NDZjVGZMMUYxTU16MXYy?=
 =?utf-8?B?YTFkdStFS0xoenlvRTdHQm9CU1dRTUlObnNnbzVKcXg4c09yQTVaeDZ3d2hi?=
 =?utf-8?B?VGNBcnFWOW5FdEcvQmlxaDlNYndZVXN4RE56ZXY1V2NBSnhORnVpeEUyZGly?=
 =?utf-8?B?VmhDSmtERjE2dmxkZVkydmV6bHN5b3hYRXFTWnZ0bnZSZkg4S1Q3TlExbUdu?=
 =?utf-8?B?dURFeGF2cm56QzN4Zk9DUVB3bWRIUXRPTEFPQ3V0bytsaWNHV2g4OTg0cVNO?=
 =?utf-8?B?TFc4SGNqMXE3WExUVEM1ZUI4dHBSYlNMMC9keG91NFJ1NlY5aTdjNWl3T2ox?=
 =?utf-8?B?TS9nRmNHZmJGSHRCYU5ERjNWb01SRzVCdjBBVS9hcmFNVEtJTmMwRFkzY3pM?=
 =?utf-8?B?NTdXL3NrT0tSM3BEYk13N216a2pxL1JTSGx1dWc4dC9ZRVZDMDJqdmJCdUhB?=
 =?utf-8?B?aHFoT3RwOVNmbVVDblg3dFBwcWU0ZHVCVmhCZE9QcHhHTUVPWmtqZWxHUXBE?=
 =?utf-8?B?eW1FRHJPeGFBc1hwUElxTE9QNDZzWjkzNExpa09DenBISXBrQ3dNcDhHMkxG?=
 =?utf-8?B?M3AyVEttN2NsS3lQS0ZZcFhzSjFkRzFRclRWQnN5SVVWbXhYd0NkT3Fwb0hM?=
 =?utf-8?B?T0QrMUxtWU9iVDlodWcvK0xiWU9mQldwam94NEZST2xQWVo1UVhVUnFjdm5V?=
 =?utf-8?B?SWd5L3JjWEF6VjM0dGIzOWQwaGo0d3lndHZ2UWVnL2IrMEt1QVcxQmh6MzBW?=
 =?utf-8?B?U1l4VWYzZDRHYTNZdHEzUHZPR2NReCs5Mkorb1BUOGtOSU1BcjJUajRwWEtz?=
 =?utf-8?B?WS82TjN3WlVCcFdrbnNJbnVsV0pZbnZpUXo1bmJnKzgrRlZTbXJ5QzBUOUhB?=
 =?utf-8?B?TGFyQnNhdXBWdndwSFhQL0dZcHd6Um4rUFlDeWErOXBNMHFPbnZsbFd6U2x4?=
 =?utf-8?B?WFBwZDBubWZMUG9ZZ0hrMGxQbjRTQnZBUklnc3VRK2J0a3RiZTBrcjBSNXZ4?=
 =?utf-8?B?a2d0QkJVNjhaenJsZmYwV1JPS01BL3JJeUZuSndkR1JKSUt6OXQxYVl3OHB3?=
 =?utf-8?B?NDVISnF0RGJ5bk5FM0s1WjZUbFNjQXQvSzhpL2wwZnJiTm84Ty9TVnQzSnVF?=
 =?utf-8?B?U3BtUGNmM1krYWs0aENxQzkrSUNseFMvRkxveGxld09MaWdDNWxhVVZRaWdP?=
 =?utf-8?B?bDdlTFZaNmJrWnlJNjZCeXFCbDYvd3VoREpmRmIzU0YydEhFc01YRHV4b09V?=
 =?utf-8?B?aDdRSW5kY0lBMWkzWWt0UE9LS0xUenplZGVJV1FoSGVhcUlFeTFIUS91OW94?=
 =?utf-8?B?Y3oyVXVLbE1iTElSVXMwTmZqQk9lWUgralF5d1NpajZXODZ1czljSzkwYkIz?=
 =?utf-8?B?ak5HTGlpZXM1Tk5oNVoyOVBtRXZPTFp3YkFoYzdlYldEajRIVE5mcUVkR1ho?=
 =?utf-8?B?cWZSZ0lOV000NUVyT2MwS3NWMmdOczI5ZVp3cE5tK05yamZJNWVYb28rcFly?=
 =?utf-8?B?L3FZU0NvWldoSTJGYk9Hb1dRRmV4R2ptRlF3SWEzcmYvYWRJaDNFU2d3ZHZJ?=
 =?utf-8?B?LzVLZmJNNUVQWmduMi9ycUxPV1NOSUJiOUY4V3VOVE5TVE1WTWo1OGVFb0wz?=
 =?utf-8?B?ZUdHRDZ6MXhOSnZyVCtDZWxucE0wdFU1S0dHZ1hnY25vRWlEOWpTa2t2MnMw?=
 =?utf-8?B?TTNPcUIyL1N5WXllRFhlR243SVB3djg0aGx2TnI0R082NWdDWGdQa2NQRFk5?=
 =?utf-8?B?ckNTMklCQ1lnbnFSdmV0QWExWStVUVJqOHhNai9lRXRXQ0ZCb3RHYXQzbFI2?=
 =?utf-8?B?TGNIOHN3ai9hRS9OUEpRT2oxeXFYTTZxVGcvQjB3dXVoRURwTXFIbXpnMmk3?=
 =?utf-8?B?TENUZ2NONFBPM0JYMTdVWXZRRml6TWxuU2MyUUY5aUZRMEhJWkgzTUtZRy9X?=
 =?utf-8?B?MVl2ckNVS084cXpISDBYRENjOENnY0FBWEFDRDJRVWtUaUllcTFiNWlCZFY3?=
 =?utf-8?B?cmRJYWtzTytqcndXVis3cXI4NXRiWUo1cDlVQTJmTy9WaG8xNUJPYlNadnk0?=
 =?utf-8?Q?E6no=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzdOcWpjK2JjUld3WUZlVHNLNHFJaXFlSzVPODFtQnpRZ1BOdU9qQVJsSDNN?=
 =?utf-8?B?cm4yNFlteEZpbjJGY1N0bmNQSkFsTEw3TkJCc3FWZTZtTUVFUGRoY2hGbklU?=
 =?utf-8?B?a3VRRUV4c1UrdUVUb3YxTTY4bjZWMFBvM2JheDB5US9PbEdsTGtUcEFpT3pB?=
 =?utf-8?B?NURqYWVzSmYzeElrcnNWZDdOTmdpQzlXbzBsODlEWXBrSDZJejBENWtnc00v?=
 =?utf-8?B?ay8wK0xvaWYyQ25vOGlIQlpDMjU5dEZLODVaRTRSQlZhbWdtN25ad1phZjhs?=
 =?utf-8?B?Wks5S1J0TTNUWDZsc2VMbHhmYnNlOHY2SmlHRitrajRxRDBETzNsOStvQ2FI?=
 =?utf-8?B?dkJpbU9PcGdQNDQ0bndSd3ZmZm9YWVVXNHJ6TU5SaXRMTzhqc1EvT0RRSVpC?=
 =?utf-8?B?K2Jza2VVOS9GVFlDbEVpYVNRZjhuVjUwMVU5WDFOOWdEQWhNaU81Y3RSM3Nz?=
 =?utf-8?B?bTVVYS9XejM2Y0ljbXpTd1htT0ROajk2bkRvUVlUMlUxV0VxeFlyR0J2MldS?=
 =?utf-8?B?Q3oyY3FiS2pxbWI5MDN0Z3k0dDU2ZTFiRytjb0FpQjdkS1FBVjFMeHI3cG5X?=
 =?utf-8?B?NTUvTGpNazlFenZXMmhQZWl5MnJUOU8va2thYWNkdzV1WitRaEwycjNIYVRl?=
 =?utf-8?B?aXlQcDRKelNNMDFlM25WMW10YlI2c282QVVRazZWOTdjV3RWZHYvSUY5dHhQ?=
 =?utf-8?B?Zi9tQ1VxeU82YTdYU2FubWR4OFlUMXNmcUFzZXJEbzNSN3UzTzhMRHQ2eHNI?=
 =?utf-8?B?a3BSNGdFdnErQ3RhZk9ibnR3UmNmenYxOVdaeHd0UTR5cVZKTGJ3clpJQUdi?=
 =?utf-8?B?WkFsSjZINSt6amhXeXdrZytMOUR5UXozQXM1V0IzY2h5aXpMcGVSQi83c1g3?=
 =?utf-8?B?Umd2dkQrK1dxdjZMdVhzTndXZU1odk5FZnlpMkFxNzFmU3RNaDVGbkgremdw?=
 =?utf-8?B?cXc2dTJnaVMwQ1dXZUtOY3BObW9oVzlMaytJRWtDcUxOT3YwYnY5dHFKQUpv?=
 =?utf-8?B?ZWZoM1kvbG9ZSElYaFlzRXhZKzJBcC9JQUJ6ajRiaHN4cU5PSThwdm1pNXhG?=
 =?utf-8?B?U20vUzZHZCs3VW5IM1E4eHZGeHJIT2h3VEpTVUpxWlVWcVh0NXUvQUQ4VEFy?=
 =?utf-8?B?ZjdSNy9EdTZ0M0doT1RQcjZhMlJ3eU5JemxDd0dwY3Y0NlJCaTBMTll4ZEV6?=
 =?utf-8?B?TWhoL2JSZDRZWmY2UHdlZ2RmZVdxeDM2RVJTWFBGclFmOERRRUl5LzZUa25z?=
 =?utf-8?B?MmR6TSsrVXhuTHJkSWNsNFhiZWhDWFBQdVA3QWVTMWJyKzlYYThhUmduSlNs?=
 =?utf-8?B?Y1ZmMzk3bG5teHA1NFB3OEJvcVo4QWlNb1A1MkxkTEtVMXhEVllvQjBQMHh1?=
 =?utf-8?B?MlRwU3hCeUw3NXViLzF4alAxcTY4ZVd1VWZSVWw0WTgrV0dLZkJYajN4cll4?=
 =?utf-8?B?UzV6ZzQzSjNGYnhaN3FwZ0wvcHFXZ1cxM2M0TU45VzVrbEk0QVFWSGJaekUz?=
 =?utf-8?B?SG1uNFBjRmFZZVRmWnZXeVVldlcrOU5aL0REREw1c3dSemoxMmRCbTF3ZzZD?=
 =?utf-8?B?aXoxYmIyNklhTmVFTlBEOTltaGFKamptTGdXUERic2dVSHY0S3V4NDViMmE2?=
 =?utf-8?B?Y1FqdmsyZklLMzMxQzlTS1d2VFh6OTUwNzhWbDBzNGM2U0E3SlJWL1BJQ3Zo?=
 =?utf-8?B?dDVUczF6VzFNZHg3KzAxL1UwUWd0dXBaSXg3a1o4eFNtK3h2Rjd0SjJ6UjFy?=
 =?utf-8?B?NTVvMmJTVlU5QjJ4Y1V5WC8yaGNPL2VRU09OUk1iRzNtQnFsd3RBeXU3MmM2?=
 =?utf-8?B?NGl1UE5FN0ZJRFBMTW9WRC9SNmVjaGZzRUo5RFJGRmE4SkFhVzdtMkpzVzRN?=
 =?utf-8?B?OVQzZ1EwV3QxWGRWUHAzbkRLSTBtY0dXeHQ5UjNmaUcrQTB1MGZrellKcVU2?=
 =?utf-8?B?UVJLclYrTEp4K0xIYVZaakZSc1N1bTdrNldOczUzSU1MV2RwSVZKM2ZTVkV2?=
 =?utf-8?B?QUh6dzlzc1IwK2MzZ01ZeXZUZ3RLVmd1dzBCNHFWWDVaMkxlZWVwS1l1R2pq?=
 =?utf-8?B?bWY0dWRHdlNzNUs4anNaYUhnL3NMTHpoWkk2TldiaTY4RU5zMkdsODJPaVNq?=
 =?utf-8?B?SDNsbEhiRnlkcVVWS2ZENm9KWE4rWmVuNTVCUW1NM2RTbUdqWTNYWkd1clF1?=
 =?utf-8?B?UlBrWGN6VzRhVjRWWUJoVmxSV3FXeXpHc0p0SEZ2MU1oQkh4Zi9IZ09oaTVm?=
 =?utf-8?B?OWdvdkQ3VjJtY1JPTm5vL3VPL0ErRy9zbm1jRUhpcFNVblQrTWEyK3RKaXNu?=
 =?utf-8?B?NWFDQ0dwdDU3cm45ZGhWU09RRTlyZ1RIVXgzVkFLMkwzTVB5N3pOeGRYdVBO?=
 =?utf-8?Q?rGoE1OhExmK4aBho=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 063e26b3-d214-418c-c7fa-08de5827fe7f
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 13:29:53.1511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1+e7PCal8BSykJApApseIxTJgok149bl4ECK1s92AOvOfRgOJJQt9OzMqn0z50grnQuIxmGkoH4vykSCLw+wVp5mCyFJeWWI6UiCPz3WjjA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5814
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: DD3644822B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20/01/2026 1:27 pm, Jan Beulich wrote:
> On 20.01.2026 14:18, Andrew Cooper wrote:
>> On 20/01/2026 9:53 am, Alejandro Vallejo wrote:
>>> --- a/xen/arch/x86/hvm/svm/vmcb.c
>>> +++ b/xen/arch/x86/hvm/svm/vmcb.c
>>> @@ -66,6 +66,12 @@ static int construct_vmcb(struct vcpu *v)
>>>          GENERAL2_INTERCEPT_XSETBV      | GENERAL2_INTERCEPT_ICEBP       |
>>>          GENERAL2_INTERCEPT_RDPRU;
>>>  
>>> +    if ( cpu_has_bus_lock_thresh )
>>> +    {
>>> +        vmcb->_general3_intercepts = GENERAL3_INTERCEPT_BUS_LOCK_THRESH;
>> |=
>>
>>> +        vmcb->bus_lock_thresh = 1; /* trigger immediately */
>> Really?  The APM states:
>>
>> On processors that support Bus Lock Threshold (indicated by CPUID
>> Fn8000_000A_EDX[29] BusLockThreshold=1), the VMCB provides a Bus Lock
>> Threshold enable bit and an unsigned 16-bit Bus Lock Threshold count. On
>> VMRUN, this value is loaded into an internal count register. Before the
>> processor executes a bus lock in the guest, it checks the value of this
>> register. If the value is greater than 0, the processor executes the bus
>> lock successfully and decrements the count. If the value is 0, the bus
>> lock is not executed and a #VMEXIT to the VMM is taken.
>>
>> So according to the APM, setting the count to 1 will permit one bus lock
>> then exit (fault style) immediately before the next.  This also says
>> that a count of 0 is a legal state.
> But then you'd livelock the guest as soon as it uses a bus lock. Are you
> suggesting to set to 1 in response to a bus lock exit, and keep at 0 at
> all other times?

I should have been clearer.  I'm complaining at the "trigger
immediately" comment, because I don't think that's a correct statement
of how hardware behaves.

Simply dropping the comment would be ok, but I'd also like to understand
hardware behaviour if it differs from what the APM says.

~Andrew

