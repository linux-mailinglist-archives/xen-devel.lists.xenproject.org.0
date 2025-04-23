Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67287A97D8A
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 05:31:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963911.1354810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7QpZ-0002M2-99; Wed, 23 Apr 2025 03:31:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963911.1354810; Wed, 23 Apr 2025 03:31:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7QpZ-0002JR-5z; Wed, 23 Apr 2025 03:31:25 +0000
Received: by outflank-mailman (input) for mailman id 963911;
 Wed, 23 Apr 2025 03:31:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EGKH=XJ=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1u7QpX-0002JL-FI
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 03:31:23 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2412::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c7272d8-1ff3-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 05:31:20 +0200 (CEST)
Received: from PH7PR12MB5854.namprd12.prod.outlook.com (2603:10b6:510:1d5::20)
 by DM6PR12MB4330.namprd12.prod.outlook.com (2603:10b6:5:21d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Wed, 23 Apr
 2025 03:31:16 +0000
Received: from PH7PR12MB5854.namprd12.prod.outlook.com
 ([fe80::bd58:fa72:e622:dd76]) by PH7PR12MB5854.namprd12.prod.outlook.com
 ([fe80::bd58:fa72:e622:dd76%5]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 03:31:16 +0000
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
X-Inumbo-ID: 6c7272d8-1ff3-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rruxgc2iVLNztS+GUgK60lmRL6HU3RFMUwiyozK4L9+KnU2GPYld3qaDRsL2VsVMDskAHfIXDINgOv3RG9dnz7luY9xi9Muw20e/nLGFHaP7cokeLCXRcjEM4jhZurxY61NBnG+QceXY+w0/aevxKsCENzKFAmAxyvg69hf7QS0VjeWqGcUcMOJAvFq0aCS1jP6qiwk4OtQiO5nfgiWC3c6QVHKoPKiSKX9tzy2C0r0Kqt2K/SdTt0hJ+vgfgSHydMMXswfAAe66eUTRF79zdh8JYHj3hrCCp5W0uTLPkH290l+2WBDd7WcKGWqJkd2t3dvj7CLYy8avLLeqU2WGhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1BvF9/3y2RiDdh4AnkdVlx5R4oAGyRJDzRMfqWQpQ5M=;
 b=xI+F8VZFDsp0wLOlnZddyDHHdMWDHwyqxmRg+MM3nKaivtUN3U8Y9Rh08ICAdDU+IsixtZP24A0y5n4cRoGCnlGiSM91aAit0vGp+ezgT09geAcpfiz1qqi6JrMIBKsdk/nD081b5aI/2Ln30tKIJYJsm+RfiS2O+b3aaNkxcFu5WIXJ5G2SBEd3/WU0Nx7YCyAyz4zN+yip/Nss656LMWSkDk3r36uD2BNAK6k8snhJYbWETEQnz+b9FfqniuimGd7JdtoETy9DXIP/qmCR2JTHyUCZDbLGMgFVpeB4Fq4JBSvTYpCTwYOVMlY7au/vHIa2UrAtYVZoyag3ERBx+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1BvF9/3y2RiDdh4AnkdVlx5R4oAGyRJDzRMfqWQpQ5M=;
 b=j00B82qSo+j5aJ2IlGOXbSeInbPpAQifkOmpzffNf8lvNyjxVP2bS1qBh6gNvJ1sxDon6KG7eWJ//q1DGuap4T3MDh9TkoptOkkPYVTM+BjvMls2wl3Rr/k1fZH1+9brJ4l/OVl17+QztXwdl5byyTn69gd5AYykahlutKCUegU=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v3 03/11] vpci/header: Emulate legacy capability list for
 dom0
Thread-Topic: [PATCH v3 03/11] vpci/header: Emulate legacy capability list for
 dom0
Thread-Index: AQHbsoVY0As/JNC0IkWc2g8aH+9wh7Ov2pQAgAFGpwA=
Date: Wed, 23 Apr 2025 03:31:16 +0000
Message-ID:
 <PH7PR12MB58541ACB964BC8274D787B8EE7BA2@PH7PR12MB5854.namprd12.prod.outlook.com>
References: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
 <20250421061903.1542652-4-Jiqian.Chen@amd.com>
 <a60a1843-e15e-495e-98f4-f55b64ab336d@suse.com>
In-Reply-To: <a60a1843-e15e-495e-98f4-f55b64ab336d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: PH7PR12MB5854.namprd12.prod.outlook.com
 (15.20.8655.031)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB5854:EE_|DM6PR12MB4330:EE_
x-ms-office365-filtering-correlation-id: 8939a6ee-e78f-4c3b-aeeb-08dd82174e15
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RG1TbzBiTnVlcjRtejlkTnNuVkpKN0xmRG04M0VTNmJDc0krdjQxNnN1WlhT?=
 =?utf-8?B?L3VJZlR5UW03OVpuRTdvV1h3OWRiYVhoeDRMY1Ard3lKcEFlZUt1em0vaFJ0?=
 =?utf-8?B?R05WcE9zdGhkUDJQa2o2YVV3VFNGR003YUxOd0J6TGduV25VblRtSVh4bHMy?=
 =?utf-8?B?eEtlUStPR0htQUdhbXNmOTJDb290bS83YTRRT0xSRU4vZTY5a2FpbEJ0cjQ0?=
 =?utf-8?B?bm0xUGZ6c0thZHRwdzVsWFlqdFZXZXphOVdZdjNLQ0FwSTdnTXk2ejk5L2hD?=
 =?utf-8?B?RjJBSHFzNFdLS01YM0RoMGVSR2owQjIvcW9ObFBsWnNZdFhjNEgxS05OMXNz?=
 =?utf-8?B?Z2VsSEkrelp6djA5QlNJTURRSjFEQTZnUC9SRTRzWU9hS3lDN1BUazJXUjRG?=
 =?utf-8?B?UVJuaXdFY3pHV05RODZhQjFGK3ZWY0JnUUZYMmphV0FuQ3pxb1RVV09DWkkv?=
 =?utf-8?B?UjMxeEdvMVNJTytPRGREUVZHeXFYQXdWVlRpYjVyTnJrOVlEbk9kbloxbmpi?=
 =?utf-8?B?N2lvb3NwSjRFT2wxbFBaamY3ZmVvRFUzeWVEU2hXV3VTUnpqNExaMEkxellR?=
 =?utf-8?B?aU9aS2lZOVVDWU0wTWRNdUNjdEpuMllCU1RRVVNqaW5QRUZOb1l0WEh0TGF5?=
 =?utf-8?B?a3g0SThWZkpWWmZmeUEyN2JzSGQxY0hwek5hcFIxZHhNaGV4YXBmMjluTFF5?=
 =?utf-8?B?NFdDZ1o4aU1tYlh5a3kvQktYOEpibUNLRi9yb2JYUnc2RnRTUmpmSi82UXFa?=
 =?utf-8?B?RGVKT2lxbW9NWWxYcm1VYSs5NHRnZ0VsVEFId2Z3NnFSQlJoUHV2OFFkbUF1?=
 =?utf-8?B?UDBuUXZBT3ZGRnhoSUNZeFVhZnh2TjdjWTlvTlprYW5NVmZ2aFZoSGdyTVJx?=
 =?utf-8?B?YnUwcXF0R1I3Vmoxd1N1K1lVU1JRbEp3UVNaMnRBUWt3RDR3YWozeUFGSmlZ?=
 =?utf-8?B?NWlTUENmMXIyaFVuVnBTakMvaHpHN0ZOY004eG8vV2NkQVdOOW9yaEE0RkJk?=
 =?utf-8?B?dE9kek1RaFNlcWlTUkQydllpdnB1MHY1T1BSbTJkcDFGMlRoc1hHUUU3dnRB?=
 =?utf-8?B?Z1ZCRncybVQzYTBNK3Q4Qm1IK3NqVmI0OStHSldaRTRsTHF4MmF4UHBKV1hG?=
 =?utf-8?B?WVYyU0gxT1lydmo0RnBKMHlRWFpGUmNwQ1piNHdLRHRFUU4vTW9sSlRLNXpR?=
 =?utf-8?B?RXE2T1NGdnZnYzIxWHN6dDhBNXBPQ3lQMGNmWW45Rm1PRUVOY1QzQW9oeVNp?=
 =?utf-8?B?b3JYYUp6S1JyOU02U1hLVzBDVFJGWDhyTWc2M3JOQ1dEZEdJQ2YyaHFLN3Zv?=
 =?utf-8?B?akZRT3Y3SndEWGY3N3hFWFNDbjNFYTkyWmwwMEowNG1ON1FxMkpQZVpCNTJH?=
 =?utf-8?B?dVVOcFMwdTV4L1VUeFJyRTdueisxbExCSkhVNkI4QlBiL2VYK0dZTHBsdGM1?=
 =?utf-8?B?OXNvN2NBenBOaTdONHBLT0lvTmUwb0xmUERNQ0FCUmJ6YlBVRVZFcG5qY1Nj?=
 =?utf-8?B?TXhRam04VWozcVh1b25aTUdwZWc1TlhIeEtIZUNMSmdjclVIVGFRaHBWUVBN?=
 =?utf-8?B?RnovZ3k2ZUFrQzBhamUxRFlmZGE4dHBEY042U2tMcEtueC9meERXTHJMUzVM?=
 =?utf-8?B?WTJ5Y21tZit5MFhyTjdCZ2RFVWFsODN3VmFzaVdUcXRqNWhvTFRaTU5iU1Uw?=
 =?utf-8?B?Tzh1RGRYQjgrbkQva1ZHTDdraVNoN1dBUDJEb2QyWmlHaXZpQThHMS9XK0Ux?=
 =?utf-8?B?ZXAySmpRTDMxZHFjcWhaTXg0L0QzWUxERUdBRjU4RDZYTVJnSFF6cTg1ZTRY?=
 =?utf-8?B?VHIxNERkWnRjMTN2T3c2cGkrdzVrU0NYV2YrNzZRVGRUaGtKWStiU2VjWjFB?=
 =?utf-8?B?dXQxenRYdW1CQnc5Slhmd3ZQTW92UmNsWXAvL0pnclVaTEhXUGhzNXMvai9Y?=
 =?utf-8?B?eDJ0S2lJU3R0UUpJZzljZGpXNWc4SUd0WUxONWVHSEhkYXpDeklOMHBwUnVM?=
 =?utf-8?B?SVVXTTRQdnJ3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5854.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b2NiNFNhVFJLSDRISEJMOEtaUmZEenVrZk1RRzV3ZXk2M0M5NnU1cEZkbm0z?=
 =?utf-8?B?bGdURDZNdVpzTWU1czBJd1ZpWlNkNmFrenRoMU55NncxVnRzK0dOTmtObW5V?=
 =?utf-8?B?R3Uyd3dSaCt4NmpkQTJ4M1cwUjdCRUszVDhLWU53bEhjM09uS2k2R1E1NDhW?=
 =?utf-8?B?N1RYcTJiTEhmWmoycE1vTGFpV1k4NmJEZlJBN3RZd1VJb0FDQktkQ2pReUx3?=
 =?utf-8?B?d0dDRFgzczhWdU94NXFmK0dlT25MSHZvRVJZUkh4cFpTbit4N3d3VUtiY3pS?=
 =?utf-8?B?UTVqTEtvSSt1Wk5YMHRVTFdVWGs3dFNvVnF0TFBlY2ZSUmtnNHlMQW5LTUJF?=
 =?utf-8?B?dThCTVBRR010Q2lUZkYvU2VES1p0WDlhYkM1TlhSV21BQUdTMWlCWUJPOGM0?=
 =?utf-8?B?V2NqcEl2K1I0RkFkeUp4dlhRR091QXFEcHhNRUErckxzR2RSRGxsWDBuSjNK?=
 =?utf-8?B?VzAvUnN1UG5qTTF2T0hoWmJUb2FWOUZvcTR2VlZXb2MyS01jd1lNMzFhTHpD?=
 =?utf-8?B?WmN0RHhEZnhQMSt0UlhXV3JXYzgxNWkxdlNiYW9kQ3lnNnFKU0xuWDUvWlFP?=
 =?utf-8?B?c1BiQ29DbnZCbVdHZHdyWkt0T3E2ditha2lka2FwbjFpR1I2QjlOMHJLRnVn?=
 =?utf-8?B?bVZJcGtiRm1yKzNWTTNjZlQzMmQ1cU81blZDa2IxVzFHZUFmRmhRTWQvLzBu?=
 =?utf-8?B?Z1BabDVTbWlwa1puL0hxMWN0eHk4U0pFaXAwS1d0VGZUcTFWczBZdElkNDMv?=
 =?utf-8?B?ckNuemhjdHVlMkxpUWV3TFNadWpWU215Tm5GdDRIOCtMa0xlWTU5c3ljTzMy?=
 =?utf-8?B?REJFZ2RTdXowRkJ2STFzcXRZK1JJUHE4UVJ6Vm1Bc2J5MjNxZzhPdFhySlY2?=
 =?utf-8?B?cnRZcVdZWlNpbkVhUk0wQjk4WVNyQkxZbXQyWUt0RURvbFpBQTVmcFdvSzZv?=
 =?utf-8?B?ZS9VSXV1TXR6dXdKNGlnc0p2cStLUWxtaFlRQnh4OEtjOFVQRnE5Vzgza3lM?=
 =?utf-8?B?bGV2Yk16S2ROQ1BmaVVhMC9EdU1TWjFEVGlzN3hQQmRWV2xWcittc2o0bWsz?=
 =?utf-8?B?OE16NUZlZ3pMT2RFQmhHNkJmcVlZTGZOM3NITjg2YlE1RFFaR3JKdEpJT0ti?=
 =?utf-8?B?Mkl6ajVjSzZSeEdzNUVPUGJtUnNwYjFXRG10NGNWa2JqU2dDMnlHNFhTSUI2?=
 =?utf-8?B?VmNGL3drNzlJSmVNQU1Yb0M1SWFibXhFZzFYdzg5MXBVdm5ONGhwTzN1VzVF?=
 =?utf-8?B?ZHYrU3NSMFZmeFBiT2p1R2ErMllrV1NHbHpYcisyTldveTlGNXVMbzdqWGxT?=
 =?utf-8?B?K3grd2E4WmRhWWJoOHhxSDYvNEdtVHVteVhyTUpHMVlaYXZsOUo5MndnZTRm?=
 =?utf-8?B?bzA4ZEw0Z0toMEhZY0VUTy9rd0dFMlZlY0I2MTNQQ0o0OE13dkhXOHhPRHl4?=
 =?utf-8?B?SFBMZStoSkpEQ05GbWdHSkVHYURVM1ZrQlhQUkkxa3QxUHY0WGsrTUFNbXE4?=
 =?utf-8?B?blBOcm80QUdaVDgyRExEODBIbi9ZTStqMmpVZG1KUDJqNUNGdG9uNkRobFlT?=
 =?utf-8?B?M3ppRnJiblpIRVYrZHp2TnBBTU9wSXlja0NVeDNkTnVYT0RqamMyajdRaW5J?=
 =?utf-8?B?YzFXMVdaNW1veElSc0c0M1dSaExVTTF1TnluVUh4bEkwRW9kT3pkVmx0bmh2?=
 =?utf-8?B?S0Vja2swRzN5bVVLQVgwcFhNdlZOQ3pmK0JQcnY5a2loV01JRjVoQ2Z6NVdI?=
 =?utf-8?B?cDFtelh0V2tLdnBTeGFSSUNRSTNUdHdGWkE5VXZ3emIyNllWT2pBSFQ1OGVw?=
 =?utf-8?B?Ritic0syc0NsRFg2VllpZVNzN21wdXM0RFRkVGRVR2pFVXFPSDFJdFlBeUtr?=
 =?utf-8?B?ZGxBZWNteHhoZjBSTzZ4bVNiRXltdkFQZTQvVE1LRkxWWnFJR0dlUFMyMXUy?=
 =?utf-8?B?VHBKMGs1VG9XWjI0aEl3WEZuMlhRMCtUWXhGQmtHNWZDWHViN01sTlVkbGI4?=
 =?utf-8?B?Z0dmTmFkR2t5MmdHTmxlQTZJZk5EZHJaMTFLTzFuMzlhU2p1RG85QkRYem1R?=
 =?utf-8?B?UWtVVG1NZ0l6eFB3eUpCdmlYenNzWW9zT3hRMDI3NTdabnVVMFpzZVNPNDNa?=
 =?utf-8?Q?tCzk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <573B15EBB7BCCB47ABF4097E6AA2BE30@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5854.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8939a6ee-e78f-4c3b-aeeb-08dd82174e15
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2025 03:31:16.1784
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M9Qe+C8LOK1/VvjcckvaNAr7diblfDHxS2EmK8IMjErA6rpNrQoONKktEhIMJ2q3NeBXfJPkYXtCOTbrEbiCog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4330

T24gMjAyNS80LzIzIDAwOjAxLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjEuMDQuMjAyNSAw
ODoxOCwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiBAQCAtNzU5LDEwICs3NTksMTEgQEAgc3RhdGlj
IGludCB2cGNpX2luaXRfY2FwYWJpbGl0eV9saXN0KHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4g
ICAgICAgICAgICAgIFBDSV9DQVBfSURfTVNJLA0KPj4gICAgICAgICAgICAgIFBDSV9DQVBfSURf
TVNJWCwNCj4+ICAgICAgICAgIH07DQo+PiArICAgICAgICBjb25zdCB1bnNpZ25lZCBpbnQgKmNh
cHMgPSBpc19od2RvbSA/IE5VTEwgOiBzdXBwb3J0ZWRfY2FwczsNCj4+ICsgICAgICAgIGNvbnN0
IHVuc2lnbmVkIGludCBuID0gaXNfaHdkb20gPyAwIDogQVJSQVlfU0laRShzdXBwb3J0ZWRfY2Fw
cyk7DQo+PiAgDQo+PiAgICAgICAgICBuZXh0ID0gcGNpX2ZpbmRfbmV4dF9jYXBfdHRsKHBkZXYt
PnNiZGYsIFBDSV9DQVBBQklMSVRZX0xJU1QsDQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHN1cHBvcnRlZF9jYXBzLA0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBBUlJBWV9TSVpFKHN1cHBvcnRlZF9jYXBzKSwgJnR0bCk7DQo+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNhcHMsIG4sICZ0dGwpOw0KPiANCj4g
QXMgcGVyIHRoZSB2MyBhZGp1c3RtZW50IHRvIHBhdGNoIDAyLCB5b3UgY2FuIHBhc3Mgc3VwcG9y
dGVkX2NhcHMgaGVyZSBpbg0KPiBhbGwgY2FzZXMuIE9ubHkgbiBuZWVkcyB0byBiZSB6ZXJvIGZv
ciB0aGUgaHdkb20gY2FzZS4NCk9oLCByaWdodC4gSSB3aWxsIGNoYW5nZSBpbiBuZXh0IHZlcnNp
b24uDQoNCj4gDQo+IEphbg0KDQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

