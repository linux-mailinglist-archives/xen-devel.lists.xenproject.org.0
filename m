Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E445F9EAA1C
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 08:58:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851918.1265887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKv7g-00043Z-GI; Tue, 10 Dec 2024 07:57:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851918.1265887; Tue, 10 Dec 2024 07:57:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKv7g-00040R-Ch; Tue, 10 Dec 2024 07:57:36 +0000
Received: by outflank-mailman (input) for mailman id 851918;
 Tue, 10 Dec 2024 07:57:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Ho5=TD=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tKv7f-00040L-3T
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 07:57:35 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20615.outbound.protection.outlook.com
 [2a01:111:f403:2418::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 695e50a6-b6cc-11ef-a0d5-8be0dac302b0;
 Tue, 10 Dec 2024 08:57:33 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SJ0PR12MB7083.namprd12.prod.outlook.com (2603:10b6:a03:4ae::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Tue, 10 Dec
 2024 07:57:28 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.8230.010; Tue, 10 Dec 2024
 07:57:28 +0000
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
X-Inumbo-ID: 695e50a6-b6cc-11ef-a0d5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xFwxfVc7Of3WbKsz2LltFCPhCjg2BeSCfJ1PpRBpsJ4P7wA72CGo4GCWs/UsU5hZuINynxo+EdG60wxNmALlLahrt2kRdHsJ6SJnD+wiJReu2bKgw8vZ0/t2JXHrIlCv37opoXlx6i3gdHx6sjT0xKVVko5EqFW9x9bat7AX219d3tAfZi7WGVCU9w36OJJkWQGDApzOpHP66uSwFnRYoe+Aico6JLvcbnqCcaH0hZNfdfhrfJo7RELRM57dWQ3qB7hUGTbjxv2913o19vdZhhdKhdGMd8ek1n5UuHsCV7nyBcl79UkQxFZlNAbRkNu4FEmIhE4uRnxhP/XFeY7oIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3elfN4RTw+8FCfJOKqQC7EiHtRdqbV/rdh8IiPozV5k=;
 b=WPdmHo/FdMhGuzpfl0RqaKm0P/Gj3EAh5qbGkj8WDmWi7oT6tBgibbGAHis69x9XKmvDs4k0kSY4OTiNdgxRP8jMdx4qphX8zv3CRCH1UZGCWDUzvaKH6xY8Qp97ZpjBM0IOhyjwoTXLlZGgc6x0HbyUlGHrVAdwNFUiHKwPXkUQo/8rMAaLOwN5Llxx6s5oE8yQfsD1w3WB6IcKG5wkd18AgThGWRioLEiSvOcyNpOT4NVZdU28KdbNL8FkTgvmzdWUZ/LTUprLkjbezPG7p4uI0Y2F7AnIlNwahUvyIbkJjUTaSlUg+FvLyfzsXvfM5BD/EI6d0SGtItC3u7RC/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3elfN4RTw+8FCfJOKqQC7EiHtRdqbV/rdh8IiPozV5k=;
 b=Uju2jukkezL8JilPQUbzjc5zUHU2ULyLzlZBXqJsfsNqVBIT0X+XP8MSvIBkhtEhHVO5uhlFhlwc/YX6RAXhbRS/1oQclTRD1NP+FAE4FLZe6cOypTSmXppYKgc7DuPvfOJgMxjCqOHyT8/4bIiaKE7auqL5VTvHrEjsPM8Aov0=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, "Huang, Ray"
	<Ray.Huang@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v2 1/1] vpci: Add resizable bar support
Thread-Topic: [PATCH v2 1/1] vpci: Add resizable bar support
Thread-Index: AQHbRIDgGHZ3ofHO0UuqqXvn+EZCabLd/CGAgAGXh4D//4qBgIAAiieA
Date: Tue, 10 Dec 2024 07:57:28 +0000
Message-ID:
 <BL1PR12MB584945F11C271CE137231F7BE73D2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20241202060956.1124162-1-Jiqian.Chen@amd.com>
 <4e4df0ee-67f6-41e3-bfc7-e78011680015@suse.com>
 <BL1PR12MB58499BEB287C4F9711324F71E73D2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <1e0576d9-400e-4483-8dd1-061e215a00cd@suse.com>
In-Reply-To: <1e0576d9-400e-4483-8dd1-061e215a00cd@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8230.010)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SJ0PR12MB7083:EE_
x-ms-office365-filtering-correlation-id: 19ce63c0-2597-4a59-857b-08dd18f04af6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZVgyRWJFOXlROEdLRE5vamFhRHVDQi9vVVRNejQzVkhadE4vcTJOc3MxbDBR?=
 =?utf-8?B?UzYza21QWENjcHVZdWVGQkI2emlLOHJ4dDB1OXF6N1l0dmxXWFBEY3g5Q1VM?=
 =?utf-8?B?Um1EUjJPekxtdDBRMzYxMFUzeFhXREkvZkVIeTk4SGNQbUVEN0k3eGowZ0JT?=
 =?utf-8?B?NGlHcE9QaFIyOC9tR3NXdDZ0YWRtSk9RTEVna3FISmorVCtaQXRNRkRtZkxH?=
 =?utf-8?B?WXZoTzJZR3VsbmZrYURtRXhEd2xnNG5xNjU1ZGNoZ2I4WDhHdE12OXJsSkcv?=
 =?utf-8?B?eHNBRXI5WEY4UGlSbVRkRWcxZkZhSTd4T1FBZmVqTjBid0tHRmdHNW1ENXhh?=
 =?utf-8?B?Y08reUZ6NE1rRnF6VndGUG00VDZQWk5US3BkU2dkbSsyZUIyNk8xdEx1UWd2?=
 =?utf-8?B?WXc5Y0hTT1pmb24yc0p2WHNLNW12aTJvVEFmUzFZbTZ6cDRpaWphNnpoanRJ?=
 =?utf-8?B?eHB1V3BHYkl6WjNlUnYxMHZjajVSRGo3WlNCb0o4cDhvcURPRE9vK0gyTE1P?=
 =?utf-8?B?aG11N3VxSjVUMGUzRjdiSHdla3UzS1BUZlZuRkRBZE0rbkdFZnlVMGlTcndl?=
 =?utf-8?B?M2JadEJvWHdNU0U0MmhiQmkxdndrZ0QydkJZZGtjL3RQV0dSMVRSdnBPaGJG?=
 =?utf-8?B?L2dkcWxMZGNJbkpQRHB5RFdFZWlieUxBdm43Z2syN1pYN0dhYUFQRW1oWHNH?=
 =?utf-8?B?UmlSQ1B0Zi9MYzZKYjBOempJYWFXeWZHOS9IZEhmVEliMTFaVEw2STc5ZDdt?=
 =?utf-8?B?NDBFNXBEdUQxYnBqZmcycE0ycmtZODJDVHBpcXNUdDYvSHFHL2d1Z01zMHcw?=
 =?utf-8?B?VEtYWE41RDdobW1iL0RES3MwVWNqcGRSM1pZaUg5NExzZW1QR2ZOdDRRTW5C?=
 =?utf-8?B?d1lYRWVzcHBwN1hhbHhaeHEzVkJmalpCTE9zMWJuRkdaRExBOEN5ZFQwOG1H?=
 =?utf-8?B?RTAySUo2Sk9NMVA4VzZPNGxTbjI3bGUzMFF6a2psZmpBczN1eThMUlJ1VGhU?=
 =?utf-8?B?dHN4TFdYMWkyaTFmM3VpZmJrc0h1b0RIT1pBaFV3bmpEcVdGL1JBR01CZzVG?=
 =?utf-8?B?QS9ndElWcVNKT2NMaGx3bENlNXQ4YVl1SDJ6UjBqWjdQZkZYdVl6TTZzaXcr?=
 =?utf-8?B?Y1hVaE9lZHVzR0ZXQWY0MExEYXp6NjlFb0I4UkJyZDNKRWJUczZzRXVlZ01p?=
 =?utf-8?B?RWJ4WXNzYUVlRnFxbnQ3RGZ1a25pR3hFaXIrNWxiY2lSM0I4L2xXM29ZMGdn?=
 =?utf-8?B?T1Y3ZWhpaG1wd1Q2MGdEeGNoQnhVSWZWQkFKeDFtK3BiOWJhYm1ERTkxNjFx?=
 =?utf-8?B?MUZKdmlUR1BlSFA4bnJSdXNBc1FvamRqcitUZXdWalREbFRrZlpnMUF3cHNP?=
 =?utf-8?B?dHdwdFcvZlplbklxakppQk1BUG1BTjJNZWFoUmNqMUpCc3N6MEV6bGRra2hC?=
 =?utf-8?B?SEx5bE9YWWVCSmQrbmdhTllNdlp0Y2lBZHVCakVnRmx6ZDh2ZkhRUXl5cnQ3?=
 =?utf-8?B?Vy9CdjJoblJZZ0lYeWxJcnQ1dzg5QlFYaHprQ0sxNmU1bmZ1MWdUbU1ZY2oy?=
 =?utf-8?B?WnFpc0QwR1QvQ3pKYWZBL29UaXBsTkE0bG1HZkhjcFVlNGw4alR2RStrYUJa?=
 =?utf-8?B?eXpkU3NFd3JuMEJYV1FpbFd1QmdiUXJ1RmFGMWdUcUFEemxDYXI0NWhJTHhZ?=
 =?utf-8?B?R3VWT3N0V21CVEptMjZ6bGFhVXVSTzN0eUNRMmdza2VNYnJEVjdsODRCVGFj?=
 =?utf-8?B?STMvWVUxRWMvcHBzWGljOStJY0hibjlkVEVLdUR0aGtSZ0pjcFE4RmczOWw4?=
 =?utf-8?B?bEZ6TjZVNE5sNnpCLzhxYjNyd0pUWC9wR1BGOWhrY3VScUQyTCtyS0RTMHpk?=
 =?utf-8?B?UkdWU0c1U0xqY2xrY1ExbTluMUpOZDhqYjdWSjZBTS94cFE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MThJTU9BOUZJMlBHTEFDam12NVlCdzFXR3pra0dzcEp2WXRXZWYvMzNSSUt1?=
 =?utf-8?B?YVZ1N2lubUpGQlB6VGRZeXpHMStUaTk4eHBnVnhXbVhIVDRlb2lWbjdiTlJE?=
 =?utf-8?B?Uyt4OHo1QzZpeFB1Z3pKNnJjaFpvd3E2Q3B1ZVJ5cm1mb05ZbVlERGZiTGhw?=
 =?utf-8?B?K2NkSklWb3p6aitIbVdCTG9FazdwRldKS2haQjY5QXBDcGxKSEJzNW9oVm1I?=
 =?utf-8?B?QWMreGxTZ0FVYnNla3IzZUgxSVVNVForUEx2a2FlRjFJcDk4d3RieUd3aWZs?=
 =?utf-8?B?bUpna1NSdUVDOUtQQzVNOEV3UGtML1JwRkJ3aGxxUVhGMUhUT1Z5T1RQL0pw?=
 =?utf-8?B?ckEvdnY1MTV6dmZkbVc3d2xkOEtpU2FLcFppb1hkQ25uRWx5b2pFaTlhYk9T?=
 =?utf-8?B?UUx0R2hTT0pabVp1NXlwRFdYdVhTL3dnSVpBSlUwSFRpUmhIck5MeExwWEJt?=
 =?utf-8?B?RHN5eFkxcytkVGNXUmZPZjcydW10MlU5clNrd0Q5ZDVuK0s5a2NycXI4NGRG?=
 =?utf-8?B?SGlCbnNhZTI1cXNtbkVBQndwNm5EdmtWWGVhSE5MNzhSL1hEd0FmVW5haTNL?=
 =?utf-8?B?YTNoQnA0bVZYOG1aVlNnZUlMSzdNcXF6WjdwVU5QbE56MU5SUzJtTFFVS0tk?=
 =?utf-8?B?V2x6clcrR3hlb2xOWndKZ1k2bjIxbmU3bHF0ZEtWVFJiK09vbjVFRFVEdnp6?=
 =?utf-8?B?WVEvcE9JV3pwUHAxbzJkQnpxTnpOU2gzblNJMlJUVW5SdjFVaFU2WnRDYW95?=
 =?utf-8?B?RG1PZGh2cGNPMmx1SFJTSFhPZy8vMHBQQjRpclowNnJrM1pqcFhUeHdCUlYv?=
 =?utf-8?B?TGFvMUowOGpFV1BtakxTb05sdTlhWVBqcEZhcytTb1d4K1dMUjlGNmNNV2o0?=
 =?utf-8?B?aCtJZ1gvRHRFM3llUXR3REcrNmQrM2JTZDFwRnFjYXFmS25vcWhFRENvRy9Z?=
 =?utf-8?B?cjljczA2RFR5VnVrUU1DK280cVd2aG45TDh1VWc2Q2lreGh0VFBsMmxsQVp0?=
 =?utf-8?B?ZTBwVElNUDNHRWdLZUVOYm53MlNSU2FINnU4dWVZd0ZueUpJeGhLV2lmTFNp?=
 =?utf-8?B?S3VmSWNYSzdoWHBGZ2NpeUNhS0ZDL2VjSDA4Ujl3RUY0ZFNHWEdZNjRQa0tC?=
 =?utf-8?B?bE9rNmxjS2pQb2toVVdZWnYydzVjK1o4dStJU2k0a2hPMGlHSDF0dUN0S3FL?=
 =?utf-8?B?c1BaSFNUWmV2UTFZQ0oxczVxRWhVMk16VHpoL1NnR2pLOERiTUdBSXN0MlpV?=
 =?utf-8?B?VC9ETFBCNG1UQTZjQVJ1dlVtNlgzUmxXQVBSNDdVQ2VRNisrcERmdnYxSGVl?=
 =?utf-8?B?WTA4YVFGSXJYZDBoY0kyRVpPS0lCcDhXVlRsbGdlOURPMXd5SzgvdndEMkYz?=
 =?utf-8?B?N2oyUTdWRW9ic1RjMDNoQkluTnN1T09XaFJRcFg4SVVtVFRZL3VCVkdsT2hz?=
 =?utf-8?B?cSttSWc2QkVSZXFHSm5LekFKTGJ6NVN2RTY2WVRQVVVsRC9LWnRwWHl2Wjlw?=
 =?utf-8?B?RGNZWEdxYjZuVFdPK1J1eFgzRS9zL0ozb1hDb1huVjJPV0h0b0xGdEZ2Y0F0?=
 =?utf-8?B?dEVFUkozdXFudmlFb0pZYmp1V3pWc1o5YllmYnJ2bUQ5NnhMUEhvUGpCZ0kz?=
 =?utf-8?B?NHduZlI5Skt6Wmp5WmRSUEFPREQwRk1MTUJIQTRXaHBJaVpNYjhGYitFTEo5?=
 =?utf-8?B?emJOYUpvcjhkaUtTQlRZQVFkRjJTK0lKeW5uOEovcWdwcnhWWEgvL0lqSFlq?=
 =?utf-8?B?MnlhRE9INXkwMi9aSjdTRWJTUzFObzZiQUVHSGN0b3JhWjVHWE5oVUxhbkdn?=
 =?utf-8?B?K2puWUdpd3J5VXFEclB3VGIxbVZlTXZ4WGEzUDgxRElydXJhRVV1dG1OVmdX?=
 =?utf-8?B?dmczck5mcjlkdS9xejQwdFRveFNUaDNIUW84WEwvNkNRZ2t0S1BnQ0NZa1JN?=
 =?utf-8?B?U3krdVBxY0krZCtOUWlUQldDMHF3bjB4MmJ4NmxhUEgzRFM2ZHFMbFBmbHVE?=
 =?utf-8?B?N1FYancvZUxQQ1k2V1RlK3k3NzY1UGEzOUR0RHNwM01QTmVHdksyMW9xeGNS?=
 =?utf-8?B?akRWRVB2akFjbS82NDlqYnRIVXpvY3VlQVZjeWpVTVQ3S1l6WVdBa3lOSWZQ?=
 =?utf-8?Q?UU94=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BDCB5B1472EA944DBBA1FE599E43F2BF@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19ce63c0-2597-4a59-857b-08dd18f04af6
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2024 07:57:28.5074
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 52+G5c0kYa9IS4Q3R8J2hFNcyVI1ejk++PPWIBh32m5cmN0lPI55N7UfJVAJsVFaFZtipKuZqcS3KeNxHdCumw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7083

T24gMjAyNC8xMi8xMCAxNToxNywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDEwLjEyLjIwMjQg
MDg6MDcsIENoZW4sIEppcWlhbiB3cm90ZToNCj4+IE9uIDIwMjQvMTIvOSAyMTo1OSwgSmFuIEJl
dWxpY2ggd3JvdGU6DQo+Pj4gT24gMDIuMTIuMjAyNCAwNzowOSwgSmlxaWFuIENoZW4gd3JvdGU6
DQo+Pj4+IC0tLSAvZGV2L251bGwNCj4+Pj4gKysrIGIveGVuL2RyaXZlcnMvdnBjaS9yZWJhci5j
DQo+Pj4+IEBAIC0wLDAgKzEsOTMgQEANCj4+Pj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBHUEwtMi4wLW9yLWxhdGVyICovDQo+Pj4NCj4+PiBXYXMgdGhpcyBhIGRlbGliZXJhdGUgZGVj
aXNpb24/IFdlIGRlZmF1bHQgdG8gR1BMLTIuMC1vbmx5LCBJIHRoaW5rLg0KPj4gV2lsbCBjaGFu
Z2UgdG8gR1BMLTIuMC1vbmx5Lg0KPj4gV2hhdCdzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gR1BM
LTIuMC1vbmx5IGFuZCBHUEwtMi4wLW9yLWxhdGVyPw0KPiANCj4gQXMgdGhlIG5hbWUgc2F5cywg
dGhlIGxhdHRlciBpbmNsdWRlcyBhbnkga25vd24gb3IgeWV0IHRvIGJlIHdyaXR0ZW4gbmV3ZXIN
Cj4gdmVyc2lvbnMgb2YgdGhlIEdQTC4NCj4gDQo+Pj4+ICsvKg0KPj4+PiArICogQ29weXJpZ2h0
IChDKSAyMDI0IEFkdmFuY2VkIE1pY3JvIERldmljZXMsIEluYy4gQWxsIFJpZ2h0cyBSZXNlcnZl
ZC4NCj4+Pj4gKyAqDQo+Pj4+ICsgKiBBdXRob3I6IEppcWlhbiBDaGVuIDxKaXFpYW4uQ2hlbkBh
bWQuY29tPg0KPj4+PiArICovDQo+Pj4+ICsNCj4+Pj4gKyNpbmNsdWRlIDx4ZW4vaHlwZXJjYWxs
Lmg+DQo+Pj4+ICsjaW5jbHVkZSA8eGVuL3ZwY2kuaD4NCj4+Pj4gKw0KPj4+PiArc3RhdGljIHZv
aWQgY2ZfY2hlY2sgcmViYXJfY3RybF93cml0ZShjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwN
Cj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50
IHJlZywNCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMy
X3QgdmFsLA0KPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lk
ICpkYXRhKQ0KPj4+PiArew0KPj4+PiArICAgIHVpbnQ2NF90IHNpemU7DQo+Pj4+ICsgICAgdW5z
aWduZWQgaW50IGluZGV4Ow0KPj4+PiArICAgIHN0cnVjdCB2cGNpX2JhciAqYmFycyA9IGRhdGE7
DQo+Pj4+ICsNCj4+Pj4gKyAgICBpZiAoIHBjaV9jb25mX3JlYWQxNihwZGV2LT5zYmRmLCBQQ0lf
Q09NTUFORCkgJiBQQ0lfQ09NTUFORF9NRU1PUlkgKQ0KPj4+PiArICAgICAgICByZXR1cm47DQo+
Pj4NCj4+PiBJIGRvbid0IHRoaW5rIHNvbWV0aGluZyBsaWtlIHRoaXMgY2FuIGdvIHVuY29tbWVu
dGVkLiBJIGRvbid0IHRoaW5rIHRoZQ0KPj4+IHNwZWMgbWFuZGF0ZXMgdG8gZHJvcCB3cml0ZXMg
aW4gdGhpcyBzaXR1YXRpb24/DQo+PiBTcGVjIHNheXM6IFNvZnR3YXJlIG11c3QgY2xlYXIgdGhl
IE1lbW9yeSBTcGFjZSBFbmFibGUgYml0IGluIHRoZSBDb21tYW5kIHJlZ2lzdGVyIGJlZm9yZSB3
cml0aW5nIHRoZSBCQVIgU2l6ZSBmaWVsZC4NCj4+IFRoaXMgY2hlY2sgaXMgc3VnZ2VzdGVkIGJ5
IFJvZ2VyIGFuZCBpdCByZWFsbHkgaGVscHMgdG8gcHJldmVudCBlcnJvbmVvdXMgd3JpdGVzIGlu
IHRoaXMgY2FzZSwNCj4+IHN1Y2ggYXMgdGhlIHJlc3VsdCBvZiBkZWJ1Z2dpbmcgd2l0aCBSb2dl
ciBpbiB0aGUgcHJldmlvdXMgdmVyc2lvbi4NCj4+IEkgd2lsbCBhZGQgdGhlIHNwZWMncyBzZW50
ZW5jZXMgYXMgY29tbWVudHMgaGVyZSBpbiBuZXh0IHZlcnNpb24uDQo+IA0KPiBXaGF0IHlvdSBx
dW90ZSBmcm9tIHRoZSBzcGVjIG1heSBub3QgYmUgZW5vdWdoIGFzIGEgY29tbWVudCBoZXJlLiBU
aGVyZSdzDQo+IG5vIGRpcmVjdCBpbXBsaWNhdGlvbiB0aGF0IHRoZSB3cml0ZSB3b3VsZCBzaW1w
bHkgYmUgZHJvcHBlZCBvbiB0aGUgZmxvb3INCj4gaWYgdGhlIGJpdCBpcyBzdGlsbCBzZXQuIFNv
IEkgdGhpbmsgeW91IHdhbnQgdG8gZ28gYSBsaXR0bGUgYmV5b25kIGp1c3QNCj4gcXVvdGluZyBm
cm9tIHRoZSBzcGVjLg0KSG93IGFib3V0IHF1b3RpbmcgUm9nZXIncyBwcmV2aW91cyB3b3Jkczog
IiBUaGUgbWVtb3J5IGRlY29kaW5nIG11c3QgYmUgZGlzYWJsZWQgYmVmb3JlIHdyaXRpbmcgdGhl
IEJBUiBzaXplIGZpZWxkLg0KT3RoZXJ3aXNlIGNoYW5naW5nIHRoZSBCQVIgc2l6ZSB3aWxsIGxl
YWQgdG8gdGhlIGFjdGl2ZSBwMm0gbWFwcGluZ3MgZ2V0dGluZyBvdXQgb2Ygc3luYyB3LnIudC4g
dGhlIG5ldyBCQVIgc2l6ZS4iID8NCg0KPiANCj4+Pj4gKyAgICAgICAgaWYgKCByYyApDQo+Pj4+
ICsgICAgICAgIHsNCj4+Pj4gKyAgICAgICAgICAgIHByaW50aygiJXBwOiBhZGQgcmVnaXN0ZXIg
Zm9yIFBDSV9SRUJBUl9DQVAgZmFpbGVkIChyYz0lZClcbiIsDQo+Pj4+ICsgICAgICAgICAgICAg
ICAgICAgJnBkZXYtPnNiZGYsIHJjKTsNCj4+Pj4gKyAgICAgICAgICAgIGJyZWFrOw0KPj4+PiAr
ICAgICAgICB9DQo+Pj4+ICsNCj4+Pj4gKyAgICAgICAgcmMgPSB2cGNpX2FkZF9yZWdpc3Rlcihw
ZGV2LT52cGNpLCB2cGNpX2h3X3JlYWQzMiwgcmViYXJfY3RybF93cml0ZSwNCj4+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICByZWJhcl9vZmZzZXQgKyBQQ0lfUkVCQVJfQ1RSTCwg
NCwNCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwZGV2LT52cGNpLT5oZWFk
ZXIuYmFycyk7DQo+Pj4+ICsgICAgICAgIGlmICggcmMgKQ0KPj4+PiArICAgICAgICB7DQo+Pj4+
ICsgICAgICAgICAgICBwcmludGsoIiVwcDogYWRkIHJlZ2lzdGVyIGZvciBQQ0lfUkVCQVJfQ1RS
TCBmYWlsZWQgJWRcbiIsDQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgJnBkZXYtPnNiZGYsIHJj
KTsNCj4+Pj4gKyAgICAgICAgICAgIGJyZWFrOw0KPj4+DQo+Pj4gSXMgaXQgY29ycmVjdCB0byBr
ZWVwIHRoZSBvdGhlciBoYW5kbGVyIGluc3RhbGxlZD8gQWZ0ZXIgYWxsIC4uLg0KPj4gV2lsbCBj
aGFuZ2UgdG8gInJldHVybiByYzsiIGhlcmUgYW5kIGFib3ZlIGluIG5leHQgdmVyc2lvbi4NCj4g
DQo+IEknbSBub3QgY29udmluY2VkIHRoaXMgaXMgd2hhdCB3ZSB3YW50LCBhcyBwZXIgLi4uDQo+
IA0KPj4+PiArICAgICAgICB9DQo+Pj4+ICsgICAgfQ0KPj4+PiArDQo+Pj4+ICsgICAgcmV0dXJu
IDA7DQo+Pj4NCj4+PiAuLi4geW91IC0gaW1vIHNlbnNpYmx5IC0gYXJlbid0IGNvbW11bmljYXRp
bmcgdGhlIGVycm9yIGJhY2sgdXAgKHRvIGFsbG93DQo+Pj4gdGhlIGRldmljZSB0byBiZSB1c2Vk
IHdpdGhvdXQgQkFSIHJlc2l6aW5nLg0KPiANCj4gLi4uIHdoYXQgSSBzYWlkIGhlcmUuDQpTb3Jy
eSwgSSBkaWRu4oCZdCB1bmRlcnN0YW5kLg0KRG8geW91IG1lYW4gaXQgaXMgbm90IGVub3VnaCB0
byByZXR1cm4gZXJyb3IgY29kZSBvbmNlIGEgaGFuZGxlciBmYWlsZWQgdG8gYmUgaW5zdGFsbGVk
LCBJIG5lZWQgdG8gcmVtb3ZlIHRoZSBhbHJlYWR5IGluc3RhbGxlZCBoYW5kbGVycz8NCg0KPiAN
Cj4+Pj4gQEAgLTU0MSw2ICs1NDIsMTYgQEANCj4+Pj4gICNkZWZpbmUgIFBDSV9WTkRSX0hFQURF
Ul9SRVYoeCkJKCgoeCkgPj4gMTYpICYgMHhmKQ0KPj4+PiAgI2RlZmluZSAgUENJX1ZORFJfSEVB
REVSX0xFTih4KQkoKCh4KSA+PiAyMCkgJiAweGZmZikNCj4+Pj4gIA0KPj4+PiArLyogUmVzaXph
YmxlIEJBUnMgKi8NCj4+Pj4gKyNkZWZpbmUgUENJX1JFQkFSX0NBUAkJNAkvKiBjYXBhYmlsaXR5
IHJlZ2lzdGVyICovDQo+Pj4+ICsjZGVmaW5lICBQQ0lfUkVCQVJfQ0FQX1NJWkVTCQkweEZGRkZG
RkYwICAvKiBzdXBwb3J0ZWQgQkFSIHNpemVzICovDQo+Pj4NCj4+PiBNaXNyYSBkZW1hbmRzIHRo
YXQgdGhpcyBoYXZlIGEgVSBzdWZmaXguDQo+PiBEbyBiZWxvdyBQQ0lfUkVCQVJfQ1RSTF9CQVJf
SURYLCBQQ0lfUkVCQVJfQ1RSTF9OQkFSX01BU0sgYW5kIFBDSV9SRUJBUl9DVFJMX0JBUl9TSVpF
IGFsc28gbmVlZCBhIFUgc3VmZml4Pw0KPiANCj4gVGhleSBtYXkgd2FudCB0byBnYWluIHRoZW0g
Zm9yIGNvbnNpc3RlbmN5LCBidXQgdGhleSBkb24ndCBzdHJpY3RseSBuZWVkDQo+IHRoZW0uIEkg
d2FudGVkIHRvIHNheSAiU2VlIHRoZSByZXN0IG9mIHRoZSBmaWxlIiwgYnV0IGl0IGxvb2tzIGxp
a2UgdGhlDQo+IGZpbGUgd2Fzbid0IGNsZWFuZWQgdXAgeWV0IE1pc3JhLXdpc2UuDQpZZXMsIEkg
bm90aWNlZCB0aGF0IHRoZSByZXN0IG9mIHRoZSBmaWxlIGRpZG4ndCBhZGQgVSBzdWZmaXggdG9v
Lg0KU28sIEkganVzdCBuZWVkIHRvIGFkZCBVIHN1ZmZpeGVzIGZvciBteSBuZXcgbWFjcm9zPw0K
DQo+IA0KPj4+PiArI2RlZmluZSBQQ0lfUkVCQVJfQ1RSTAkJOAkvKiBjb250cm9sIHJlZ2lzdGVy
ICovDQo+Pj4+ICsjZGVmaW5lICBQQ0lfUkVCQVJfQ1RSTF9CQVJfSURYCTB4MDAwMDAwMDcgIC8q
IEJBUiBpbmRleCAqLw0KPj4+PiArI2RlZmluZSAgUENJX1JFQkFSX0NUUkxfTkJBUl9NQVNLCTB4
MDAwMDAwRTAgIC8qICMgb2YgcmVzaXphYmxlIEJBUnMgKi8NCj4+Pj4gKyNkZWZpbmUgIFBDSV9S
RUJBUl9DVFJMX0JBUl9TSVpFCTB4MDAwMDFGMDAgIC8qIEJBUiBzaXplICovDQo+Pj4+ICsjZGVm
aW5lICBQQ0lfUkVCQVJfQ1RSTF9TSVpFKHYpIFwNCj4+Pj4gKyAgICAgICAgICAgICgxVUwgPDwg
KE1BU0tfRVhUUih2LCBQQ0lfUkVCQVJfQ1RSTF9CQVJfU0laRSkgKyAyMCkpDQo+Pj4NCj4+PiBU
aGUgbGl0ZXJhbCAyMCAoYXBwZWFyaW5nIGhlcmUgdGhlIDJuZCB0aW1lKSBhbHNvIHdhbnRzIGhp
ZGluZyBiZWhpbmQgYQ0KPj4+ICNkZWZpbmUuDQo+PiBPSywgd2lsbCBhZGQgIiAjZGVmaW5lIFBD
SV9SRUJBUl9TSVpFX1VOSVRfQllURVNfTEVOIDIwIiB0byByZXBsYWNlIGFib3ZlIHR3byAnMjAn
IGNhc2UuDQo+IA0KPiBXaGF0IGlzICJVTklUX0JZVEVTX0xFTiIgdGhlcmU/IFRoZXJlJ3Mgbm90
aGluZyBieXRlLWlzaCBoZXJlLCBJIGRvbid0DQo+IHRoaW5rLCAyMCBpcyBzaW1wbHkgdGhlIHNo
aWZ0IGJpYXMuDQpJdCdzIGEgbmFtaW5nIHByb2JsZW0uIFdoYXQgSSB3YW50IHRvIGV4cHJlc3Mg
aGVyZSBpcyB0aGF0IHRoZSBiYXNpYyB1bml0IGlzIDFNQiwgd2hpY2ggaXMgMl4yMCBvZiBieXRl
cy4NClNpbmNlIHRoZSBzcGVjIGhhcyB0aGUgZGVmaW5pdGlvbiBhYm91dCB0aGUgdmFsdWUgb2Yg
dGhlIGJhciBzaXplIGJpdHMgb2YgcmVnaXN0ZXI6DQpCQVIgU2l6ZSAtIFRoaXMgaXMgYW4gZW5j
b2RlZCB2YWx1ZS4NCjAJMSBNQiAoMl4yMCBieXRlcykNCjEJMiBNQiAoMl4yMSBieXRlcykNCjIJ
NCBNQiAoMl4yMiBieXRlcykNCjMJOCBNQiAoMl4yMyBieXRlcykNCuKApg0KNDMJOCBFQiAoMl42
MyBieXRlcykNCkRvIHlvdSBoYXZlIHN1Z2dlc3Rpb24gYWJvdXQgdGhpcyBtYWNybyBuYW1lPw0K
DQo+IA0KPiBKYW4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

