Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 862ED92AED4
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 05:36:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755695.1164128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR1eB-0007P5-9n; Tue, 09 Jul 2024 03:36:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755695.1164128; Tue, 09 Jul 2024 03:36:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR1eB-0007MV-6T; Tue, 09 Jul 2024 03:36:07 +0000
Received: by outflank-mailman (input) for mailman id 755695;
 Tue, 09 Jul 2024 03:36:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h7MY=OJ=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sR1e9-0007MP-PO
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 03:36:05 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2412::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c9ddf40-3da4-11ef-bbfb-fd08da9f4363;
 Tue, 09 Jul 2024 05:36:02 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by MW6PR12MB8952.namprd12.prod.outlook.com (2603:10b6:303:246::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 03:35:58 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 03:35:58 +0000
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
X-Inumbo-ID: 5c9ddf40-3da4-11ef-bbfb-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W3OpSaE+PXLT17IXNx80wAn4gjLbmVjuC1COvAc3ThKKqGUwSi8/8aK/R6NUD6w1i9UgdledJYDZsTR0q7hRhl8JlHdhsE/U9wI6xPqIRF994T1QWnCP/+yzPjFSyuVQI32L/Fx+i9guoghMYzORUcm3beESG3sl5DpBhVGZHnT1mUm/6I2Ivt0J1wVBDA2C3jib2atxoJf/VH/+7dS9MhG76KxxDDBOvp9o7yexmQbPsVGNffwK1uA5ri+xcOTSA14osxdzkU9yFkBnEZZPl8Ia+sLBOcu3RxhwcZkT2MRY0HWT7URAUOXVaQotj0fVhMjWguPAMhg0WNJrbjECcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O9gW7fR8eSICDQIfmHec3S38yz13C4jhgvYXpd6VyxM=;
 b=eE/vtET2WLwLxd3n0Ccptjwy4z6x4H/+DMlH1slL/Cu9gCJfjw8TI+9kqozFzdz8pc8j6b2F4cmPl8NozlgSgist2cCYqCnOjYFubiSezxRq58n4OxCGQOKtDgvsLHZld3YNw678JoOUFWEAEBmL7aKnBzfWF8DcIlYQXLRidbwAEn5V1qLB6VcN6jwD07oPNoAsJm7k0sSoeznWFuOsHvyl1zVQljg52mIZep03jfgdYRfkMRuzWEJi/U9CjcAJYbgm7k4s6fa5kXCeJEjixDJMRhy+k2xOlv2sW8C8cBJNyj9kMASN58jLGfLUjLF8RzahDWEfqWpL67rY6JQTdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O9gW7fR8eSICDQIfmHec3S38yz13C4jhgvYXpd6VyxM=;
 b=jhbeIByy4PeWiQwlqJdBgnQ/lEWDrKruJQZU6wWn3Bpi/4Gt50Zliq1XRUeLJP0E6EZc+8H1Fxix0pwTcWpD5aWo3uBXVlTkJhlLZhi8XaYiIbv9dH00Z1AK7bDsu2j1fEojWRYsYFrQgJZJBu+rZZ383Iq4r8nemQ47ltWy3O8=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Anthony PERARD <anthony.perard@vates.tech>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <gwd@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
	<jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v12 6/7] tools: Add new function to get gsi from
 dev
Thread-Topic: [RFC XEN PATCH v12 6/7] tools: Add new function to get gsi from
 dev
Thread-Index: AQHa0Svedv1p7hOYckC70HcmNEElN7Hs0raAgAFpqwA=
Date: Tue, 9 Jul 2024 03:35:57 +0000
Message-ID:
 <BL1PR12MB5849BEF865F5E6413402C219E7DB2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-7-Jiqian.Chen@amd.com> <ZovpKmmoabIvy135@l14>
In-Reply-To: <ZovpKmmoabIvy135@l14>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7741.016)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|MW6PR12MB8952:EE_
x-ms-office365-filtering-correlation-id: 5054a867-9959-44cd-e8a0-08dc9fc83f09
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VnhXMG5yMUVCZGZjenViNy9vcVJ6cmF2eENBWERuc3BvdElTdmg0L29XVCto?=
 =?utf-8?B?TEdSbkVZYVRrMmZyejlUc2FFSTdjWmVhZXBXcTQ2K2pLdlVqanpBY0hnQVJE?=
 =?utf-8?B?MmdybFVtU3BOb2hPU21sYjExOW5FUVBRRXcrckNOTUN3eXRUY21JdUhzOVZG?=
 =?utf-8?B?T0R3SXpMY0lsdDA1NFEvRXdVTzBpazlZQktDZkphTVh4SkJZQjJON3RvcjRG?=
 =?utf-8?B?bmZ2a0s1VXNVM01zN252Q2UySVpwaVNsb05nSTllZFVsWWxjcTdrYjhUcUxo?=
 =?utf-8?B?bmdBaGRBT3hhVTRvaTNBNW5VcjlYUGpNOHlUbnZ0TlhVZlRmL3M5cGl0WHhX?=
 =?utf-8?B?UE1zamVvenFGK1pkM3p0NDZIb0hraE00cmtPYjNtS3pEYWlyaUlNZXFlS0I1?=
 =?utf-8?B?Y29JYjZqcStSNU1GWmdHbkdwRFIzN2dVMm90WXJFT3dUcnpVSGUzYzFWNVc5?=
 =?utf-8?B?eFZ2bGpPVEU0RWlhTWFITlhvRnloblgxU0hrZk5IWGZBYVgvci95WGdwVjh6?=
 =?utf-8?B?L0lEbVcxdU5KcFczZ1BWVmdvSGRDZk1NcXA3UFhIUzZhNVByMnM1QVo4RmU1?=
 =?utf-8?B?SWV4TEk0ci9HQUI0N1FLalFhZ2lNOHZKYUpXNzVJVUl0cWNKeHBpMWl5Mzg3?=
 =?utf-8?B?aERSSEQ2djhTRytKaWFVQ3Q5RFh3aFNpZjFrYjhWbjJPY2pwdHZ6d3lETXo3?=
 =?utf-8?B?d3NidFVXMUNqOHJpdVZWVGcvSCtHSUMyR3JQRXNVRWlVKzN6K0VTSExnZVVS?=
 =?utf-8?B?SVJzTDVtbXRMbWdSc3VPSklnVUdDcEVDbmpQRDhwUDBoUks3QkZ6cnFkbjRq?=
 =?utf-8?B?b1J2emMvMDNBTHVwb0U3K2t2SEFZZHlzcW9vMTJKL3lHMll0dythakV2eVZi?=
 =?utf-8?B?TUgwTUFJd1E0YVRTeGZsUTE3MVBVSzVqcmtUY2dGZDZBeEJ0b1lEU1JzRU8v?=
 =?utf-8?B?VS83aHlUS053d3RBc3Jubmd0eWpkUC9rQ3llZzczb3QxdmdNS01DNzVMdWcw?=
 =?utf-8?B?ejlFNGZianhYSGowMXhKejJxWkNJaUVUZks2NlJBaFJMOXdObG9TRU1Ma3R5?=
 =?utf-8?B?RlVCZXJCd3c0bmJjQXkwSzlUYWRsWXJVODB3YThzbEJPSS9LM3NwV2x0Zk1m?=
 =?utf-8?B?WUU3OUo2YW9aZFk5aFpDSkpOTG5nUml3Y3NEWU5jellwUFp1ekxvRzZlVmNU?=
 =?utf-8?B?eXUzV1VUaERFTzNPdHRnekhmckR2ZUtKODRSQy9OOWlkWVpHeUxxWG5KMGxC?=
 =?utf-8?B?MExUU2Q3YVpWN3FCTVVUczNYcEJaZ1N0d0UzSWZ0eHZOOENVNC8rR2FFbnBL?=
 =?utf-8?B?V3Z5SE5aK0dRd1VnL3dSdVU3bUNKQWJaYTZiV2VvRVRFRWpNOHJqVG5YQ0lU?=
 =?utf-8?B?UWpKTkdUQmMyN0FnbzEyTHBtem8ya0ZBSjlZRXBLRnc4ZWNuZmFEckNGVWJh?=
 =?utf-8?B?clJnZHlYWklBWVczTU1kcU9JV1h6RHp3ZU5mYXRwU0EwNSt1eTg3cWJTTzgz?=
 =?utf-8?B?b0lsOGdDRFNHbEtDcGp1anJ2SjIrT1Q5TUw0KzZBY29QbkdDVm0yNHg3T0ZS?=
 =?utf-8?B?R3QvQWJVZ2tQSUlhQUVGb1ZZdGF6NFZ4UDg3TVlnaWd0cW12N2pMN1BTNXl2?=
 =?utf-8?B?dENvempIVlZMbEZ2eW4rdVI0OHB5WnJZamdkelNqRTBIWWJYMVczcFlhS1hv?=
 =?utf-8?B?a1ZXbkIwRE4vdGJ4S2lyWHdRL05zbGxuS1RIdG9hWVV5VFlyT29nNGZ0b1pW?=
 =?utf-8?B?WUdHUkJ2bm1YK1pCeXdDOGIzeWxCNXYvVE02d3NJTjRNZTJ3VS9Pc25LeVRi?=
 =?utf-8?B?RkgzMUZ1MXlrdlFFK1dqMmVKOFBwUFZlaHoydTRwL2pIeXUxdEkrc0thS05K?=
 =?utf-8?B?TUZSUUhjVDJVUU1hRXY1UkZ3cDZRTE1GRVd4ZGN5M3Vnb2c9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SDZQclphVnZteHdOcnFjdGFmcVNQaURIMDM4ZXdnYmpBZUFiUmtGcmYxMFY4?=
 =?utf-8?B?OGp1V0s1aUh3bGxCSmU1WVFTZWtsZzBjL0k1SWZYK2ZLMEdPTVZMbUNPUjJO?=
 =?utf-8?B?RUkyUnRtTzQ5aFRZMXo4bDRTakIzVVFZZVc3d2FRWndCMGFaNG5RVjFMOTFs?=
 =?utf-8?B?bVIzczJOWU5WQVU2RjdiaVd4L0lHSFVKWXF2TUs1TXYrNDdCRTZJamd5OCtM?=
 =?utf-8?B?VWRNREdXRFUzWE95TGtmeXlSa2NteVVGcDFUbkxoL1diMklXbzBuYU13dUZq?=
 =?utf-8?B?YTJNejVVR3U3L2VFU3VoYVdHbHFpbTYvcVhpRXJTQ2w3VFYyV3NjSU5UQWZt?=
 =?utf-8?B?UjVTQXN3dXEwaU81MDI2Z1ZwSW81aVlVcngyelBRQllReWdRVURHbEJKWVhh?=
 =?utf-8?B?KzY1bGw4Mzl2aXRwSWxpUXRBOFFoNFZSdEU0WEhML0k3ME1US3NCWloyd2s5?=
 =?utf-8?B?VmFtcmhWczNuMTFwaEhSSG8yb2E3OGxqcWV4cWdLY2FXNGt0VG5zOVZkN0py?=
 =?utf-8?B?a3BoSXhLK0U1cWlmQUdmOHRQblpQSzRPdit0QUw0bjBLR3NxSTJwK3NOWDUv?=
 =?utf-8?B?MUxTMUF4RXd1dUZtWEU0MWh5TkNCeXI5c1FKVllaRkxjdXhQZWg4TUl4Wi90?=
 =?utf-8?B?a1hLa21UV3ROVVR0WXBZblBEU1p0UzlxY2I5YTZWbFdIeHFYMysrZmVScEd5?=
 =?utf-8?B?WUw0M0xKVTZTcWhrSXducDZRQVBYY3NDUC9EbHZPdllBR1A0S2QxUklkNUU2?=
 =?utf-8?B?WWVyRmdQUHlXWm5IVHRCaGpTOTlSaGJwdGwrSUpxcFNlM0tDUGdTZy9xV1Iw?=
 =?utf-8?B?M3dWbDRKck85UHFydE40TXNNZjJOZTluUjI2Y25uQ0lIOFNrdW9mNjVLK3FG?=
 =?utf-8?B?ZGNWNHVoR3l4WExHdEhQU3RIN3pTSG9kL2R0dWxwRlpmMWI2NEU3clJBVSt2?=
 =?utf-8?B?UEtKSDVzWGF1bUFPa01EbEFCRWJoMHBpa2RKdGhsY1JDQVdVNUJ5bmNqcFdR?=
 =?utf-8?B?RjRRZmxjSFd0YkpoeHR3MGtacmhhMGN6ZklxV0RmZCs4RGNwdEV0TC9VeDR4?=
 =?utf-8?B?RGVrcGRBbG4ydkxKbi8vQWE3RStWMHJ4M0NBd2lGWFpxQk5EbnFsdVhwdjZV?=
 =?utf-8?B?bFFIQnU2aUZwdEFZZjdZTWdHdzRZUVVBZ1krTUVWQWQxT3JacHdVSzFFQ3Nl?=
 =?utf-8?B?SnBrQld4aDYrNDNoTDZmYktxVkppTDR0UGlCTHpRSjJOUkhYREh2QTVPU0Y2?=
 =?utf-8?B?MWZRZDUxSS80RWh3OGp5bXMrdGZBTmpwRDBsUUprV1NoZ21rN1U1THJYeVhh?=
 =?utf-8?B?VDlKQmVlZjNTNUtsekFjbkFvSUorVVpIc3RFbTdia2lOejdrcllxOHZmSFBa?=
 =?utf-8?B?YUk3VFE5ZHl5WTBLZzZyY2N5T1JCN2lIeVY2aEtDaFBoTFJ6V08xeUNDRXVQ?=
 =?utf-8?B?V05SeGpNQy81M3BLa1I2S0lyaTk5QTJISnVoa0Y4b0x2Ukp0WHJrWjN6OG9M?=
 =?utf-8?B?WjFPdUVZYUNoTnhjTmhFWTd1dUNWczFLR1BxMTNERFJ1YWdMbStjZE5HWk50?=
 =?utf-8?B?QUJlWVoxWEpldVVaV1BIdHRhazZ2SlZBUEFPMm5tdk9HWEtNZ1o0RHlVcHVX?=
 =?utf-8?B?cVEyOGloTDN5ZzA5NVo2a3NxTS9mbzNGRndFakhMVlZLYTBnRlhGdGtUbE9x?=
 =?utf-8?B?bElCK1FZKytGaG03WVhUNEx0Z01QRFl6ZVo2b2JOYmcyOFRaRytoZUZMN3BM?=
 =?utf-8?B?SDhlVlN5SGVsbVpnQ0o2WGM3clczQ0hkK3g5NFpSeXVoWU5VOXJZRmQwU3lr?=
 =?utf-8?B?OEVYUEtUMjdmSnFLL1Z3QjR2WnVMUUxlaDlvdTVDNVVMYXMxdzIxYnllQzZX?=
 =?utf-8?B?ZmY3QzFpU3pKMzdyS21KUGdtVkV0blI1ZWZpQ1lROUw1aWQ2bG4zekx0elMr?=
 =?utf-8?B?ZThRTTNGSzFHZHZSQjRGTU01SkNKRUx4ODlGNjd5VFhMQ0huNTFiY0paRWZI?=
 =?utf-8?B?a1RlVFNCb0wwcU5XanVwTUxpV1NqMUkzem1WTkhhUmtqNjNmaURQa1FMYUZG?=
 =?utf-8?B?WmRYTU5ZNG5EMGo5a2NuNURVWGkrWUs0T3VnUHR6aHkrb002enVTWWFOb2Vy?=
 =?utf-8?Q?NguA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6AF4F9C532159D428311AA318160A04A@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5054a867-9959-44cd-e8a0-08dc9fc83f09
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2024 03:35:57.9245
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LH6QiafwX4IkvAr6Y/jtZbz3kuj8uHiwJFfvA60pBzFdGOtlRXRfwcUK1+i0YCgGhQm7Y0ctN/T/gptomsDXsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8952

T24gMjAyNC83LzggMjE6MjcsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBPbiBNb24sIEp1bCAw
OCwgMjAyNCBhdCAwNzo0MToyM1BNICswODAwLCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+IGRpZmYg
LS1naXQgYS90b29scy9saWJzL2N0cmwveGNfcGh5c2Rldi5jIGIvdG9vbHMvbGlicy9jdHJsL3hj
X3BoeXNkZXYuYw0KPj4gaW5kZXggZTlmY2Q3NTVmYTYyLi41NGVkYjBmM2MwZGMgMTAwNjQ0DQo+
PiAtLS0gYS90b29scy9saWJzL2N0cmwveGNfcGh5c2Rldi5jDQo+PiArKysgYi90b29scy9saWJz
L2N0cmwveGNfcGh5c2Rldi5jDQo+PiBAQCAtMTExLDMgKzExMSwzOCBAQCBpbnQgeGNfcGh5c2Rl
dl91bm1hcF9waXJxKHhjX2ludGVyZmFjZSAqeGNoLA0KPj4gICAgICByZXR1cm4gcmM7DQo+PiAg
fQ0KPj4gIA0KPj4gK2ludCAtKHhjX2ludGVyZmFjZSAqeGNoLCB1aW50MzJfdCBzYmRmKQ0KPj4g
K3sNCj4+ICsgICAgaW50IHJjID0gLTE7DQo+PiArDQo+PiArI2lmIGRlZmluZWQoX19saW51eF9f
KQ0KPj4gKyAgICBpbnQgZmQ7DQo+PiArICAgIHByaXZjbWRfZ3NpX2Zyb21fcGNpZGV2X3QgZGV2
X2dzaSA9IHsNCj4+ICsgICAgICAgIC5zYmRmID0gc2JkZiwNCj4+ICsgICAgICAgIC5nc2kgPSAw
LA0KPj4gKyAgICB9Ow0KPj4gKw0KPj4gKyAgICBmZCA9IG9wZW4oIi9kZXYveGVuL3ByaXZjbWQi
LCBPX1JEV1IpOw0KPiANCj4gDQo+IFlvdSBjb3VsZCByZXVzZSB0aGUgYWxyZWFkeSBvcGVuZWQg
ZmQgZnJvbSBsaWJ4ZW5jYWxsOg0KPiAgICAgeGVuY2FsbF9mZCh4Y2gtPnhjYWxsKQ0KRG8gSSBu
ZWVkIHRvIGNoZWNrIGl0IHRoaXMgZmQ8MD8NCg0KPiANCj4+ICsNCj4+ICsgICAgaWYgKGZkIDwg
MCAmJiAoZXJybm8gPT0gRU5PRU5UIHx8IGVycm5vID09IEVOWElPIHx8IGVycm5vID09IEVOT0RF
VikpIHsNCj4+ICsgICAgICAgIC8qIEZhbGxiYWNrIHRvIC9wcm9jL3hlbi9wcml2Y21kICovDQo+
PiArICAgICAgICBmZCA9IG9wZW4oIi9wcm9jL3hlbi9wcml2Y21kIiwgT19SRFdSKTsNCj4+ICsg
ICAgfQ0KPj4gKw0KPj4gKyAgICBpZiAoZmQgPCAwKSB7DQo+PiArICAgICAgICBQRVJST1IoIkNv
dWxkIG5vdCBvYnRhaW4gaGFuZGxlIG9uIHByaXZpbGVnZWQgY29tbWFuZCBpbnRlcmZhY2UiKTsN
Cj4+ICsgICAgICAgIHJldHVybiByYzsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICByYyA9IGlv
Y3RsKGZkLCBJT0NUTF9QUklWQ01EX0dTSV9GUk9NX1BDSURFViwgJmRldl9nc2kpOw0KPiANCj4g
SSB0aGluayB0aGlzIHdvdWxkIGJlIGJldHRlciBpbXBsZW1lbnRlZCBpbiBMaW51eCBvbmx5IEMg
ZmlsZSBpbnN0ZWFkIG9mDQo+IHVzaW5nICNkZWZpbmUuIFRoZXJlJ3MgYWxyZWFkeSAieGNfbGlu
dXguYyIgd2hpY2ggaXMgcHJvYmFibHkgZ29vZA0KPiBlbm91Z2ggdG8gYmUgdXNlZCBoZXJlLg0K
PiANCj4gSW1wbGVtZW50YXRpb24gZm9yIG90aGVyIE9TIHdvdWxkIGp1c3Qgc2V0IGVycm5vIHRv
IEVOT1NZUyBhbmQNCj4gcmV0dXJuIC0xLg0KVGhhbmtzLCB3aWxsIGNoYW5nZSBpbiBuZXh0IHZl
cnNpb24uDQoNCj4gDQo+IA0KDQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

