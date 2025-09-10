Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D77C9B51397
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 12:11:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1118092.1463998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwHnI-0003k6-KA; Wed, 10 Sep 2025 10:11:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1118092.1463998; Wed, 10 Sep 2025 10:11:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwHnI-0003hV-Gs; Wed, 10 Sep 2025 10:11:16 +0000
Received: by outflank-mailman (input) for mailman id 1118092;
 Wed, 10 Sep 2025 10:11:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=golU=3V=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uwHnH-0003hP-GO
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 10:11:15 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2418::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a252763-8e2e-11f0-9809-7dc792cee155;
 Wed, 10 Sep 2025 12:11:12 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SA0PR12MB7075.namprd12.prod.outlook.com (2603:10b6:806:2d5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 10:11:09 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::53da:e77e:261e:5a29]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::53da:e77e:261e:5a29%6]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 10:11:09 +0000
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
X-Inumbo-ID: 7a252763-8e2e-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uqXJgupmxrL/JOX1LMNdYIc0KVIkjkCeEQfanSg5CGJWsqRhan7FlOyW7Bdp5As0r+0RY1Tm4rj37maDz62Pp0HMxs18dDq8zPzUHNh/oulpn3OtLI3nhziwPjf813BltwxQFaCzm56qjqduv2tkZLcFYuGledq2KYD9D5ALVZSjJX4d27bw5XK1GEtPDL8eDVPCZ0ozqp30RZfVzjxFb/jujEYNx59un4k7tn5qdvNwG0NjoWCrC+ZOpk2b+akzxhHakXSN3nsJ7ug2Qn8FV16dxgSyrsUqbmTx2uQv7aFZjU8+3c812wWmpYa4f8P2wNJWgrRzkLynGhx/p+cuVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ph6vbwRzsg4J07rqbqonx8auHwK6/iO33Wn/HOQg+1E=;
 b=KAEOY4ED8wsiu9QLyibakyb9EVCpKdlMqds8UtKjGQCSrInlFvVrUc29WUjO5ghofy9ZvH/pMjnR8BDmMmb2fno7OAoxd3NlC8B1W99vXUtrrAxN/o7NJzDZfkYUztLIFzwvUARlgAcvBWWUeVW/dhtZ05oyIBnt8kUFBuVPEqmJzQ9+nX/YQ3n7Pxp7lEzYM6uPjI4sn/PGn4Ze/50vfk61Iav6OXBBiN6oKuqmivVvdTk149KaFRDAg+S4wbFzxEoUMxeqUI2P4AvMYt5lMVri+flPr4DXJpe4MpcBgNxlL6GdB21M0BiHXNPqIYBe/udR7SK3t5c5dAiwg0SYZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ph6vbwRzsg4J07rqbqonx8auHwK6/iO33Wn/HOQg+1E=;
 b=sr6UbGLO1WpmFmqvrkxPZsEIAhNOhQAetyFwwTl8ir9SI1v8ujTyCiiy8pwn1aWbevn/ZCDmALmAam4iTHSRN1nWhEjEAYfLaQUIzTcl7yEX5CBZJHbzjrklg6miFG/EzcEh2FJ554KVV/8Q1UTRQ0H4pM+aHMKIv4rrY9NJHoc=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v11 5/5] vpci/msix: Implement cleanup function for MSI-X
Thread-Topic: [PATCH v11 5/5] vpci/msix: Implement cleanup function for MSI-X
Thread-Index: AQHcCDsDNbhhyPeREkWOwl6zipBaO7R5mWoAgBNQ/IA=
Date: Wed, 10 Sep 2025 10:11:09 +0000
Message-ID:
 <BL1PR12MB5849906C2DBD9DE5C8D8FD41E70EA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250808080337.28609-1-Jiqian.Chen@amd.com>
 <20250808080337.28609-6-Jiqian.Chen@amd.com> <aLGJqMJH46neJYAy@Mac.lan>
In-Reply-To: <aLGJqMJH46neJYAy@Mac.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.9094.017)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SA0PR12MB7075:EE_
x-ms-office365-filtering-correlation-id: bd9295e8-3735-4b32-aad3-08ddf0525ce3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?d2w1Y1pMS1ZZS2p2cU5rTUVyc01ROXY0N2FVK2FxQk41YTRjQitOekp6QnVa?=
 =?utf-8?B?L2tiVWZ0Qmg2ZWxJMDVPR2QyUVVuaHY4dW1ISjhRbU9SVUdJa0FnaEhaaHBD?=
 =?utf-8?B?TzlRWGk4QXkzQUtiTnY5RDdMZ0hyOENsRVB6Skw1ckVPUkVGNXBuZndsdzll?=
 =?utf-8?B?a3lNcmVUTlRrWUIrVDR1S3dHVCtPRXIzcmNNZHplQWduUDFDSDRpcmNQUVEy?=
 =?utf-8?B?Q2tUTFBnb205d2xNNm5IdUw0Qys5T1RhcUpOMzhrWXFRZDNRbzVsZHZxTzVP?=
 =?utf-8?B?NkRuVVVtd0JxNHNZYUlra2JvclVvRmJrR09VT1o3ZlRTYWNTUENxRTVnQ3lv?=
 =?utf-8?B?SlBYbXBLNWM0ZDVMd1pXQmtaZ1kySnpNU0l3QmQ3L25sbnVkcXYwM09KWDg0?=
 =?utf-8?B?M0txeTczYkJ0V21LZWNFK0ZrVkZ3ZktYWWNaZ3hsZHdLZU5OcXdqdVZkNkIy?=
 =?utf-8?B?NWV3aUZ6aHlxeWhjUnlPcXN4M3BxaFNkM3NXZHMwcVVqQU9yWjVDRHlJcnFt?=
 =?utf-8?B?WHBJVG1KNW5kcy9pTFl5aTl1QmZHeGVCekJNYTFMbmhkMUw5elcwSndTd0xQ?=
 =?utf-8?B?OUpIdGtGa013WXpTSGJwUlJVeTRReVViQzBVY1lBVDdKdDBzZWx5T3VWVnhT?=
 =?utf-8?B?ZGh6ZEhrLzVpR2g4MVI4MVJpMDJxTEFjOHpoYTJidVBhTCtXbnUyQlpKRWJT?=
 =?utf-8?B?TlNJUDQvVGROZnhLTnZkZWppa2NuRHhyamlCSUl2UUIwWVhLZUZWSStPa29w?=
 =?utf-8?B?aFh2bUY0UE04UXZ3eG5jTkF5YllUNnQ3QjUvL0kwUG5od1k3OHp2TGtZYkdB?=
 =?utf-8?B?RGpVM2hFZkV5Q2RSNnF4bHhPUFZrN0N4b3AyNmdhMTJlTllEWk03RmVrNDJz?=
 =?utf-8?B?NUR3TC9kN3R6WjN3cTQzQUkvUkEvTkkwN01ubU1UMEJDME53TmNIUWIxbXBJ?=
 =?utf-8?B?QVkza2pBbXJ3cWVsSzhRUmUvZWNTZ1RLbkN4bnNUSWIxSVp2aGRDQ1Zrb1NF?=
 =?utf-8?B?Y0RkbFdqY0hEd01XcUhPWTdJNm13WktsTUMzNlA0dmdLeVFnVGxWdy82RlJH?=
 =?utf-8?B?VEdBNnptVkdtNjM5Ylk1OUdhSUVWM1BZRFd5cHMyTUtNdHNibmZDa2NhZU4x?=
 =?utf-8?B?emdzZGhvM0xROUlmdlZQbHl0bExHYTBaWkY3SzBUZHJlVXlFQU5mNGFLOFB2?=
 =?utf-8?B?dUhVVUhyWlFuSHUvQ3JlekF1Mmp0cXJzYzBrM094cUpzT1V5UUtDOXAxczhV?=
 =?utf-8?B?UnFEZEtKa25YTXRzUjk2V1EwMXBLK096elAydjFWbWlWNjBMMzZRMzI3NUVt?=
 =?utf-8?B?UmdvNmRFRjBGb3RkYXVNV214TWNWYldDV3VsOCtFMVhaZkN2THRzQW5GRjdX?=
 =?utf-8?B?NDE5ZCszTWZUc3B0OFJESTM2ZFZ3NmFYNGRUWnR1YktGbUVoazdGSjlSalhm?=
 =?utf-8?B?NThMK2FyMy9zUVJmSVRURU9jMkFlZUNrWU1BUVpRUzlrSzRtTTFUdWlidjFu?=
 =?utf-8?B?Ym5aa3hQU1RwaUw1eWNVQ2RBM2MyWUF0Z1pIaUJDL3RidlBiN3ZJTXJ1VDQ5?=
 =?utf-8?B?YWxaL3JZZk15ck9ZTE01QlNJODhVVmRvOGtRbExlT0VhMTh1bnRGQzJYNEdj?=
 =?utf-8?B?elZPR2YzOVJXTlFTRldLTUpuM2FuQlBvTDZHME1tK2s2aUxDRmF5ZTJocFNh?=
 =?utf-8?B?TTIwV21GNUI5RDl5N0V0SDkwd1Q4YkxxQ2FQYmdNdHVia1NFQlJER2RGS0w3?=
 =?utf-8?B?ejhSVkhaR0xOcTltSEt4T2pRVnNCc3R6cDZSVnZHLzEreit1bStObGJnRmk1?=
 =?utf-8?B?QlY1dmxjSzJiRTVHeGtCUVJxOUtQOVdHZ3ZseXdwdE9YVnlkMWlhaHJKV21h?=
 =?utf-8?B?U2Y3MmF2cmZkSFJLZ0Y1UUlPNE1kS3p0WUZ6VnppTmR5L3I0SFNhV0FqZVg5?=
 =?utf-8?B?WlRJNzRKS1pjMThtWHZhN0FxVVVXdnlOQkd5aDZmT0tPcCtFSEZEMUs3NjFz?=
 =?utf-8?Q?hIlr/WnEqssKrF/BTvtxjErdnjMK6c=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cDlvOGJFSDl0VE91c041enRLdmhOdFlCWEJxME41dnNGY2gxWm9IN1Vld3JH?=
 =?utf-8?B?a295d0lYMkdRZ3NWOEhJNWpuWVU0aFExWHB3QkE5U1NwWjYvZk9kWmVnNEZ3?=
 =?utf-8?B?REhPM0V3Wi9WVGlSQ20vdVJJaGZlNVdQckdBTWh0QnlFdHdaUWlHNklSMlBR?=
 =?utf-8?B?T2JsWFpSNmlwOTVGbzgyanhVb0p5OEc0ZVcrcUJEVUtyMzEvQ1FHWnVPMG8z?=
 =?utf-8?B?NGhCd29wMUd5aS8zTWx1NVlrU1hSMmlpdUtpd0RqSDVEOFlLdHkxSGlaUFhY?=
 =?utf-8?B?MHRFRFpCKzNTL09zaHNRYzdDSUZWcmVXZFhpTnFOV09IaTVTeldQRWlWdFFa?=
 =?utf-8?B?SldGZUJJVHFNczZEV2ZaNDNDRVB4OTFZT0lvNkh2Rk9qVlViNDZ5ek5GKzBY?=
 =?utf-8?B?SVNKRHIyWWRwQkJZc3lJbHVxNmplMWtOV1JSdkR2Q1Y2TXJibWJJQVgxbUZX?=
 =?utf-8?B?NVFDanl1eGd5Y2lvOHlucDlvQVlhUk8xU1NzYllFbVoySnM1RnF1WlNUYXp2?=
 =?utf-8?B?Yk1iNTV1QjFtdE51R2ZxUS9KUERsYVpoTExTcjMrUVRYNm11eHdidVBVWXQ3?=
 =?utf-8?B?TDFNLzJzaVVKNG1QcnczSWNHcGFCcytibnoyU0dPTEJjSWlaMDNsMCt2bjV1?=
 =?utf-8?B?RUNXbWpES3piUzVXZ2VaTUlXODlnVkV3RWVjaG1WUitvQTJqbVI4VklERFBU?=
 =?utf-8?B?MlBPWGpkV3VQSlpMUXBHcmRhOHJJNWhBcUZtZHozcVFnVnFiUks3ZE1vWlZQ?=
 =?utf-8?B?Z0UvQVVUK1U1VGRJbitLZlU3djJRMndnSHd0UWg0cmFUbGlHa0NsV2NXYmRm?=
 =?utf-8?B?SVEraFpzSU1jTUNnR2duTm1rbFIvZ0JOYnVtT3lheE5vUU1jL3ZoSlZ1SzFN?=
 =?utf-8?B?TzloOWltVmxEZGoyVFhpWVJpMG9WenZMNUdqanZsVFMrR0wyQzdQcExFZzh1?=
 =?utf-8?B?dGVVeUNybWhxRkVPQ3F6VXlzR3JUZzkxQTA1Q05iZkxoencrTEFmZGhTUlR4?=
 =?utf-8?B?dmVMMkV1Tm5vcHg4Z3o0RWxKeGJaaFcvTEZjTkJ2ZkxISExFWm1jbXBDTEJa?=
 =?utf-8?B?N2lRVy9hUWhyOUxQSzVmYXU0OE9LVzJXMHowcVN5MUVoNGJqTS9jWnE4L3Fl?=
 =?utf-8?B?K1Y3emxFSGdMU3Y2NmhDWTREZ0FING1kYkxua2dJL1FOS1lZZjBOWC9uNHo0?=
 =?utf-8?B?VlFRN1hlNGI1QXVaL2NmZ0QxODNMdW9GWFBrSWRpV0tUWkJwVWRVQ2RLNmdm?=
 =?utf-8?B?dUpLL2lBTERpSXlaTkhVRnA2ZUdyUEVRUUZuNEtSVjJtNGdlZEFnTTJaemRk?=
 =?utf-8?B?K1c0dEt4K3JsS1FNRlVlMVZYb3hnUkFSa0ZVL3NZQUttNHYwdWVNVUltOWpG?=
 =?utf-8?B?Mi9JdzR3ZXdVUVlyZ0hsSUFLUldnUHJ1YjdHQjUvZkNDTXFmK1dnMUlSZWR2?=
 =?utf-8?B?amE3Y3pnNmt4d0xPUW9Uczl2U1BmNVN4Mm4vVG5Sb1pvMG82U2dqZE82RHN1?=
 =?utf-8?B?Z2Z1RGE5cmJxZkg2U2RLSkZ4OTFSTGhFNS9ndmdJeTNWaFh1WHBUR0g1Vkky?=
 =?utf-8?B?VXgwamlvQVJvY1N4YTB1bHhONzM5c3FpVU9KN3JoZVd6a1VLZmlja2JPTVJ2?=
 =?utf-8?B?cXE2QUYwZUJDa3ExNm85K3ZxaWN6SFlLNzNPbUVMR1VGYml6YzJUTVFNRlYr?=
 =?utf-8?B?N3lhSjVSNS9rejVFdDY0Y3A2MlZMSzFzSThQNGRDdDJDUTdRZ25lUWhyNTZv?=
 =?utf-8?B?NEJpck9qTkdSU3FNMlBHTGdHNEk0OWFhbW1DdXJzZVd4VXhDY3lUdWpSVEZS?=
 =?utf-8?B?NTJwbTl2QUpCVUw1WERyVGtMb09CZnl5MEY0NEh1VEV3Z2cxcVBDTkNjYTNl?=
 =?utf-8?B?V1pRQ0ZXK0NCZWFna0JzcVdpb1BJMmJidXZKdEhRSVY4L3M3ZGNpREJESFAx?=
 =?utf-8?B?R2FQNDZ1T00xc2hjTHp0aU4vZ0U3Sk95V1hRbWVnU1BRcWczdmwvVzZlY2U0?=
 =?utf-8?B?M2xNd21yVW42SldtbWMzdCt3L1pwLy8yRkxkT2paR2FsYmV6amxjRkl5MFZG?=
 =?utf-8?B?aFNjaFBRSlVsdjA5OFlGOStrMlVXdzVjN3dKRDd1NU1tMnZSeXR5WDlxbmxv?=
 =?utf-8?Q?26Bs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <239E8B6410292E46B8C5286E5F560521@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd9295e8-3735-4b32-aad3-08ddf0525ce3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2025 10:11:09.2529
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ac7TNJKxbCaDddNUdq3dtJdshGRBcl2zKOqR6buvb68OucZzJ4pMVNuMccic7BGZX51hWZPaq4kAexuT6nuX5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7075

T24gMjAyNS84LzI5IDE5OjA2LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBGcmksIEF1
ZyAwOCwgMjAyNSBhdCAwNDowMzozN1BNICswODAwLCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+IFdo
ZW4gTVNJLVggaW5pdGlhbGl6YXRpb24gZmFpbHMsIHZQQ0kgaGlkZXMgdGhlIGNhcGFiaWxpdHks
IGJ1dA0KPj4gcmVtb3ZpbmcgaGFuZGxlcnMgYW5kIGRhdGFzIHdvbid0IGJlIHBlcmZvcm1lZCB1
bnRpbCB0aGUgZGV2aWNlIGlzDQo+PiBkZWFzc2lnbmVkLiBTbywgaW1wbGVtZW50IE1TSS1YIGNs
ZWFudXAgaG9vayB0aGF0IHdpbGwgYmUgY2FsbGVkDQo+PiB0byBjbGVhbnVwIE1TSS1YIHJlbGF0
ZWQgaGFuZGxlcnMgYW5kIGZyZWUgaXQncyBhc3NvY2lhdGVkIGRhdGEgd2hlbg0KPj4gaW5pdGlh
bGl6YXRpb24gZmFpbHMuDQo+Pg0KPj4gU2luY2UgY2xlYW51cCBmdW5jdGlvbiBvZiBNU0ktWCBp
cyBpbXBsZW1lbnRlZCwgZGVsZXRlIHRoZSBvcGVuLWNvZGUNCj4+IGluIHZwY2lfZGVhc3NpZ25f
ZGV2aWNlKCkuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSmlxaWFuIENoZW4gPEppcWlhbi5DaGVu
QGFtZC5jb20+DQo+PiAtLS0NCj4+IGNjOiAiUm9nZXIgUGF1IE1vbm7DqSIgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPg0KPj4gLS0tDQo+PiB2MTAtPnYxMSBjaGFuZ2VzOg0KPj4gKiBNb3ZlIGNhbGxp
bmcgYWxsIGNsZWFudXAgaG9vayBpbiB2cGNpX2RlYXNzaWduX2RldmljZSgpIG91dCBvZiB0aGlz
IHBhdGNoLg0KPj4gKiBBZGQgaGlkZSBwYXJhbWV0ZXIgdG8gY2xlYW51cF9tc2l4KCkuDQo+PiAq
IENoZWNrIGhpZGUsIGlmIGl0IGlzIGZhbHNlLCByZXR1cm4gZGlyZWN0bHkgaW5zdGVhZCBvZiBs
ZXR0aW5nIGN0cmwgUk8uDQo+Pg0KPj4gdjktPnYxMCBjaGFuZ2VzOg0KPj4gKiBDYWxsIGFsbCBj
bGVhbnVwIGhvb2sgaW4gdnBjaV9kZWFzc2lnbl9kZXZpY2UoKSBpbnN0ZWFkIG9mIGNsZWFudXBf
bXNpeCgpLg0KPj4NCj4+IHY4LT52OSBjaGFuZ2VzOg0KPj4gKiBNb2RpZnkgY29tbWl0IG1lc3Nh
Z2UuDQo+PiAqIENhbGwgY2xlYW51cF9tc2l4KCkgaW4gdnBjaV9kZWFzc2lnbl9kZXZpY2UoKSB0
byByZW1vdmUgdGhlIG9wZW4tY29kZSB0byBjbGVhbnVwIG1zaXggZGF0YXMuDQo+PiAqIEluIGNs
ZWFudXBfbXNpeCgpLCBtb3ZlICJsaXN0X2RlbCgmdnBjaS0+bXNpeC0+bmV4dCk7IiBhYm92ZSBm
b3IgbG9vcCBvZiBpb3VubWFwIG1zaXggdGFibGVzLg0KPj4NCj4+IHY3LT52OCBjaGFuZ2VzOg0K
Pj4gKiBHaXZlbiB0aGUgY29kZSBpbiB2cGNpX3JlbW92ZV9yZWdpc3RlcnMoKSBhbiBlcnJvciBp
biB0aGUgcmVtb3ZhbCBvZg0KPj4gICByZWdpc3RlcnMgd291bGQgbGlrZWx5IGltcGx5IG1lbW9y
eSBjb3JydXB0aW9uLCBhdCB3aGljaCBwb2ludCBpdCdzDQo+PiAgIGJlc3QgdG8gZnVsbHkgZGlz
YWJsZSB0aGUgZGV2aWNlLiBTbywgUm9sbGJhY2sgdGhlIGxhc3QgdHdvIG1vZGlmaWNhdGlvbnMg
b2YgdjcuDQo+Pg0KPj4gdjYtPnY3IGNoYW5nZXM6DQo+PiAqIENoYW5nZSB0aGUgcG9pbnRlciBw
YXJhbWV0ZXIgb2YgY2xlYW51cF9tc2l4KCkgdG8gYmUgY29uc3QuDQo+PiAqIFdoZW4gdnBjaV9y
ZW1vdmVfcmVnaXN0ZXJzKCkgaW4gY2xlYW51cF9tc2l4KCkgZmFpbHMsIG5vdCB0byByZXR1cm4N
Cj4+ICAgZGlyZWN0bHksIGluc3RlYWQgdHJ5IHRvIGZyZWUgbXNpeCBhbmQgcmUtYWRkIGN0cmwg
aGFuZGxlci4NCj4+ICogUGFzcyBwZGV2LT52cGNpIGludG8gdnBjaV9hZGRfcmVnaXN0ZXIoKSBp
bnN0ZWFkIG9mIHBkZXYtPnZwY2ktPm1zaXggaW4NCj4+ICAgaW5pdF9tc2l4KCkgc2luY2Ugd2Ug
bmVlZCB0aGF0IGV2ZXJ5IGhhbmRsZXIgcmVhbGl6ZSB0aGF0IG1zaXggaXMgTlVMTA0KPj4gICB3
aGVuIG1zaXggaXMgZnJlZWQgYnV0IGhhbmRsZXJzIGFyZSBzdGlsbCBpbiB0aGVyZS4NCj4+DQo+
PiB2NS0+djYgY2hhbmdlczoNCj4+ICogQ2hhbmdlIHRoZSBsb2dpYyB0byBhZGQgZHVtbXkgaGFu
ZGxlciB3aGVuICF2cGNpLT5tc2l4IGluIGNsZWFudXBfbXNpeCgpLg0KPj4NCj4+IHY0LT52NSBj
aGFuZ2VzOg0KPj4gKiBDaGFuZ2UgZGVmaW5pdGlvbiAic3RhdGljIHZvaWQgY2xlYW51cF9tc2l4
IiB0byAic3RhdGljIGludCBjZl9jaGVjayBjbGVhbnVwX21zaXgiDQo+PiAgIHNpbmNlIGNsZWFu
dXAgaG9vayBpcyBjaGFuZ2VkIHRvIGJlIGludC4NCj4+ICogQWRkIGEgcmVhZC1vbmx5IHJlZ2lz
dGVyIGZvciBNU0lYIENvbnRyb2wgUmVnaXN0ZXIgaW4gdGhlIGVuZCBvZiBjbGVhbnVwX21zaXgo
KS4NCj4+DQo+PiB2My0+djQgY2hhbmdlczoNCj4+ICogQ2hhbmdlIGZ1bmN0aW9uIG5hbWUgZnJv
bSBmaW5pX21zaXgoKSB0byBjbGVhbnVwX21zaXgoKS4NCj4+ICogQ2hhbmdlIHRvIHVzZSBYRlJF
RSB0byBmcmVlIHZwY2ktPm1zaXguDQo+PiAqIEluIGNsZWFudXAgZnVuY3Rpb24sIGNoYW5nZSB0
aGUgc2VxdWVuY2Ugb2YgY2hlY2sgYW5kIHJlbW92ZSBhY3Rpb24gYWNjb3JkaW5nIHRvDQo+PiAg
IGluaXRfbXNpeCgpLg0KPj4NCj4+IHYyLT52MyBjaGFuZ2VzOg0KPj4gKiBSZW1vdmUgdW5uZWNl
c3NhcnkgY2xlYW4gb3BlcmF0aW9ucyBpbiBmaW5pX21zaXgoKS4NCj4+DQo+PiB2MS0+djIgY2hh
bmdlczoNCj4+IG5ldyBwYXRjaC4NCj4+DQo+PiBCZXN0IHJlZ2FyZHMsDQo+PiBKaXFpYW4gQ2hl
bi4NCj4+IC0tLQ0KPj4gIHhlbi9kcml2ZXJzL3ZwY2kvbXNpeC5jIHwgNDcgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKy0NCj4+ICB4ZW4vZHJpdmVycy92cGNpL3ZwY2ku
YyB8ICA4IC0tLS0tLS0NCj4+ICAyIGZpbGVzIGNoYW5nZWQsIDQ2IGluc2VydGlvbnMoKyksIDkg
ZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3ZwY2kvbXNpeC5j
IGIveGVuL2RyaXZlcnMvdnBjaS9tc2l4LmMNCj4+IGluZGV4IDU0YTUwNzA3MzNhYS4uMjg3YWFm
ZGE5MTU3IDEwMDY0NA0KPj4gLS0tIGEveGVuL2RyaXZlcnMvdnBjaS9tc2l4LmMNCj4+ICsrKyBi
L3hlbi9kcml2ZXJzL3ZwY2kvbXNpeC5jDQo+PiBAQCAtNjU1LDYgKzY1NSw1MSBAQCBpbnQgdnBj
aV9tYWtlX21zaXhfaG9sZShjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+ICAgICAgcmV0
dXJuIDA7DQo+PiAgfQ0KPj4gIA0KPj4gK3N0YXRpYyBpbnQgY2ZfY2hlY2sgY2xlYW51cF9tc2l4
KGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBib29sIGhpZGUpDQo+PiArew0KPj4gKyAgICBp
bnQgcmM7DQo+PiArICAgIHN0cnVjdCB2cGNpICp2cGNpID0gcGRldi0+dnBjaTsNCj4+ICsgICAg
Y29uc3QgdW5zaWduZWQgaW50IG1zaXhfcG9zID0gcGRldi0+bXNpeF9wb3M7DQo+PiArDQo+PiAr
ICAgIGlmICggIW1zaXhfcG9zICkNCj4+ICsgICAgICAgIHJldHVybiAwOw0KPiANCj4gTGlrZSB3
aXRoIHRoZSBNU0kgY2FwYWJpbGl0eSwgaXMgaXQgcG9zc2libGUgdG8gZ2V0IGNhbGxlZCBhbmQN
Cj4gcGRldi0+bXNpeF9wb3MgYmUgMD8NClNpbmNlIGN1cnJlbnRseSBvbmx5IHZwY2lfZGVhc3Np
Z25fZGV2aWNlIGFuZCB2cGNpX2luaXRfY2FwYWJpbGl0aWVzIGNhbGwgY2xlYW51cCBob29rLA0K
YW5kIHRoZXkgYm90aCBoYXZlIGNoZWNrIHRvIHByZXZlbnQgcG9zIGJlaW5nIDAsIHNvIGlmIHlv
dSB0aGluayBjaGVjayBoZXJlIGlzIHJlZHVuZGFuY3ksIEkgd2lsbCBkZWxldGUgaXQgaW4gbmV4
dCB2ZXJzaW9uLA0KTVNJIGFuZCBSZWJhciBjbGVhbnVwIGhvb2sgYXJlIHRoZSBzYW1lIGFzIGhl
cmUuDQoNCj4gDQo+IEkgd291bGQgYWxzbyBhdm9pZCB0aGUgY2FsbCB0byB2cGNpX3JlbW92ZV9y
ZWdpc3RlcnMoKSBpZiAhaGlkZSwgSQ0KPiB0aGluayB5b3UgY2FuIGNoYW5nZSB0aGUgb3JkZXIg
b2YgdGhlIGNsZWFudXAsIHNvIGl0J3M6DQo+IA0KPiBpZiAoIHZwY2ktPm1zaXggKQ0KPiB7DQo+
ICAgICBsaXN0X2RlbCgmdnBjaS0+bXNpeC0+bmV4dCk7DQo+ICAgICBmb3IgKCB1bnNpZ25lZCBp
bnQgaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHZwY2ktPm1zaXgtPnRhYmxlKTsgaSsrICkNCj4gICAg
ICAgICBpZiAoIHZwY2ktPm1zaXgtPnRhYmxlW2ldICkNCj4gICAgICAgICAgICAgaW91bm1hcCh2
cGNpLT5tc2l4LT50YWJsZVtpXSk7DQo+IA0KPiAgICAgWEZSRUUodnBjaS0+bXNpeCk7DQo+IH0N
Cj4gDQo+IGlmICggIWhpZGUgKQ0KPiAgICAgcmV0dXJuIDA7DQo+IA0KPiByYyA9IHZwY2lfcmVt
b3ZlX3JlZ2lzdGVycyh2cGNpLCBtc2l4X2NvbnRyb2xfcmVnKG1zaXhfcG9zKSwgMik7DQo+IC4u
Lg0KPiANCj4gVGhhbmtzLCBSb2dlci4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hl
bi4NCg0K

