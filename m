Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80140A3D63A
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 11:12:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893767.1302629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl3XX-0002KR-IQ; Thu, 20 Feb 2025 10:12:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893767.1302629; Thu, 20 Feb 2025 10:12:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl3XX-0002Ix-Fd; Thu, 20 Feb 2025 10:12:19 +0000
Received: by outflank-mailman (input) for mailman id 893767;
 Thu, 20 Feb 2025 10:12:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gblN=VL=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tl3XV-0002Ir-Uh
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 10:12:18 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2413::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2849697e-ef73-11ef-9896-31a8f345e629;
 Thu, 20 Feb 2025 11:12:15 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by IA1PR12MB6018.namprd12.prod.outlook.com (2603:10b6:208:3d6::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Thu, 20 Feb
 2025 10:12:10 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%6]) with mapi id 15.20.8445.017; Thu, 20 Feb 2025
 10:12:09 +0000
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
X-Inumbo-ID: 2849697e-ef73-11ef-9896-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OG/1TP6xnMEjh6GnQciXiU0sQVBjdPZY+Wn3zn7ozJcQ2+8bb6c2iibGTvLTBoClcHJ+qIS8ssRilMhR/I7OqS30Ft7/m4YSzpq3tNmzPC/mDwlSNVthW6p4RB1Bd77cm07pUx+cVNaktBpnnrOI8/g5epKQEgOED5id9AuBgpWPf2hBVUiaGSMOdYfKJqUPuWTVYIv2QbnTxgAVeg+aq8FuUEXGW1buYu4BbRBjBBzuapor3zSELmrG8au+X77H2jgo/VfHgSYJ/O2VUI/aa+WXMsp9qxCPDopqSbmmiCOSKT3LVTcrkMpLC2phaDiz+QhfaAsKZzVx3uHSoT93vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=52J6/W0IBUPToHAu7LNwrsIOfSMvJSKM+EfTZBEazh0=;
 b=bwbQ9Wbbe/hmItvThT0e5tQI4roZz96bBqNowGig2DjIEm2scF9aYQbXddCZDrxJlA8et175udCnaEg+C1zfNGIcm9Yk2PCws1c1f0gcX0hXxP0HVwFm0kwv/zlKM5FRGfZLhylyx3+xqsxN8LmNWwm+dHjh6X6f7943h+hmR9XaVB/DPh41y64/KGDQZxCcCCD0dLrp47uzPtGh+UXCdIsQuLdSg/YFZPrfQw6AcKG1xTk8grG2g0+HszdJyUcOKtgmjzvbStT2pFcJ8Zf7zyFBVZgibt0GeAmv039uh09CtuR4pjPSwKhRMlMHRRH8FwoDd7wdHYAIZp9s2ddjIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=52J6/W0IBUPToHAu7LNwrsIOfSMvJSKM+EfTZBEazh0=;
 b=fv1SwQmAhGQF2roOisY8mlcs0t/fh4zuo+yDQdIB8296gX/pigB/n7HNspOFvOpEaQBjuzFpcHElvb+OukMMjdC1y9PJg6zwZUyLhL27GUozXK9yLhoYc9rr7yqc4iqgBxH6lyqsqSnmk2U7ILaO6sowVzP/fLslG+FZtJxbprg=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Sergiy
 Kibrik <Sergiy_Kibrik@epam.com>, "Huang, Ray" <Ray.Huang@amd.com>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v2 1/2] x86/hvm: make stdvga support optional
Thread-Topic: [PATCH v2 1/2] x86/hvm: make stdvga support optional
Thread-Index: AQHbg31vrqzjsF0c70CmhVWyEB2ei7NQfbkA
Date: Thu, 20 Feb 2025 10:12:09 +0000
Message-ID:
 <BL1PR12MB584900A8FB87513FC9D98388E7C42@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250220095349.1823593-1-Jiqian.Chen@amd.com>
In-Reply-To: <20250220095349.1823593-1-Jiqian.Chen@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8445.012)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|IA1PR12MB6018:EE_
x-ms-office365-filtering-correlation-id: 315ab3f6-747c-471c-e51e-08dd51970964
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?c2gyYmVuMVpCQXFXL1NBM21jNlpmZ1MydnI4VndWdjZNQVhxUjB0NXZEaWh3?=
 =?utf-8?B?WDVrQ0NqT1lnd2lxZEdLNlgxTW5YUmJYR3pDWnpYYUFoZlphZlRkT08vcGsr?=
 =?utf-8?B?Z21GT2s5RSt2Zy9XR1k4dlBSeFZ4dVhBUFVhVnQyak1lamZlR2RFVS8ycVJs?=
 =?utf-8?B?YjRWWlVqdlF5eHdxcVZGblNqUkxnUHd2czRNVm1rak9URHU2ZGI1OG45ZThX?=
 =?utf-8?B?T0pZSUIwMWlkYlNMUjNUMHpidEk2SlpKcVptUkhnd3NMdnFaMFRjSWtSN3R5?=
 =?utf-8?B?bkF3Rk1UOFAwL1F3L0d3VkZkYTNqSlNVa0t5YXhCS1h0NjJVWWVUbGJ3ZWp2?=
 =?utf-8?B?NlV6bllvZWs3K3BhNENWRlJMQ3QxaXY2Y1cveWxNZy9obzN5ekVtSnpaa1p4?=
 =?utf-8?B?VTB5R3VlWUtKL3hjeUhiQ25IWDJsVnlkamVXYU9hYm5jS2trTzh6Unk2WmtJ?=
 =?utf-8?B?Yi9DclZRb3Y3Q1ZVMTdJN2hodElqVG0rNXUrb1drWTMyWk93M2JXTlYwWDd2?=
 =?utf-8?B?azJpdnpxeGI4TjdQam9scjZ2aEFIYUlUNmcyeUtUc1JnSG1Wb1JudSs2UUFa?=
 =?utf-8?B?Q21UYU9zVS9MVlBzNWhRVHFHTUhpY0QrTXhWUStDcUVuZU9lRmxkRVJWOXpB?=
 =?utf-8?B?aDFMb2w3OXBOcU9rdEtGREFTVmF5djNja2xwNnhaYWlFV25PdWdDNkEyQVFR?=
 =?utf-8?B?UWpqQThSZ1ZIWUphY1NRMENMVitZWUUxU2lFQnBsWm9EeFVVNDQ1MHRUZ0lv?=
 =?utf-8?B?alpMdFJCODgrOWY0VitDajdNVUNIZDR2K3ZSbTcyQ2dCVlRZRG9BUzRwbVph?=
 =?utf-8?B?RDBheGFVYlF3Znk5L2ZvVmNQM0ZtODhMKzEvbmdDSGZzbHlYekNUYllxaFJC?=
 =?utf-8?B?SDJQNFRVTHpvWlZXMVdnUWdPWnpJbGZkeStiT1p5K29mcmtsc2poZ2hYQ09V?=
 =?utf-8?B?czFWTm5MeTVUQmVZSFczODhrTC9VbjVvbGlQdUowWmJKS1oybkQzcmhFdnJl?=
 =?utf-8?B?bTE3WXdXc1NscDk1T1R6cFdUUy9SLzg3TTZYT0orZlNYMTJvbC8vWS9iRm9P?=
 =?utf-8?B?b3ZLdGZIV1pVMUxhenBMVlJNZmgyVXlFeHVTYSsxSFE2L0lRTGV2aktGSWhW?=
 =?utf-8?B?Y21sSWFFcW8xSitOQVlXLzREQ1AwcnFkTnlWeUJOdGJvZFVoMlVQeUtNdkZO?=
 =?utf-8?B?aDZXYVFwalhINUtQT0tQREI4UlNJSFdFWmU0S1FPZzlXdjVlQkRsQi80SmtF?=
 =?utf-8?B?alV2a3psbHdWbi9FZXBZU2NuZDlIdkJyYzFTdFRWNjNmTkgyNjhzNHFxNGhQ?=
 =?utf-8?B?MzVZU3lLelo0MkdKMXZkamdjazdOMEFrM0gzSHdyWE9BdWpBZG1ONzcvZzNB?=
 =?utf-8?B?SUxlMVRRSDhKaEQ4OCtSdWI4d3hIR3RnV1dvTkRlUm51Y2VLbDd6QndOYXcx?=
 =?utf-8?B?MVRaeDd3dytMVnhESm1IcW50UHRUaFRxYit5ODlXbm11U0k2NmJEeG0rcWVW?=
 =?utf-8?B?WHRGek4zNFljZy9zVjA4Y1hLRTgvdlZUdmlqNEphODFNbDg5aFZCNmR1bWpx?=
 =?utf-8?B?Qm5Qa2VkVmxoY1IyQmYrWEpMMXpmK2NWc1g5RER2K25HWmFPTTZJMGhPUEhy?=
 =?utf-8?B?TC9EcjhZMVNFWCtrSEVFcnhtY3Q1NmlBelZGV2doMEVZc2RJblI0NEJBanpO?=
 =?utf-8?B?ZktEMmVKYmxjWTdHeDNUNVVZMGNNL1RKaHVLeUY3ZXMvRTExQ2NVK3NuOGJv?=
 =?utf-8?B?ZkJrU0dKd3ZwVis0Y1hpMmZXbElTajNGS2cwZkpxM0RkTFZKb1RrMmRJOVZN?=
 =?utf-8?B?SUpkcVJKbUdVTW1JZVFLT3ZRcENyNi9ISVY2NW1wdE1OWHg3WitYZGhpMm54?=
 =?utf-8?B?R3NRUXc5enJVSk00d1JsZk9FV2FVbW4xaWUzRytVSG5qb2c9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cmNSdGlWSUlOZkQzb2FaeDhGRmYrWFE3VnkyOWRvYVpLV1RDYjFXMENXdXFI?=
 =?utf-8?B?RmlxMmNsMWwwbFF3VldwY3RZYUVJcG1rN3p0T28rN0Z2bFFWc1BTU3Q3SElm?=
 =?utf-8?B?VEx3N1JuZDV1ajFFT2dWYUt3SzNwZ2tFb0Q5QkU0U2QrRTZrNTBpUHFIekpx?=
 =?utf-8?B?WDhiTk1iQVhVUnVBRjJoenVYNmpzbWNMRmxSZWVLMkJBWFN1OGgwTVBHYVR6?=
 =?utf-8?B?LzBLa1JKQm9WdGZKMjdmVWFNTDlZblZUMlJxMFJYbGZHY0w4OXp5a1ZDUkoy?=
 =?utf-8?B?Z0U4ZXZWZmgyUXI3VW11N2dHdFl4QWxiVnRJU1JBaW45Zm10MGcxWi92eHYw?=
 =?utf-8?B?YWRleW52ck8vZUVza2lueGwwb2Z0ZHhWOXJzSURwdGZMNXZYdnNQcks3L0lu?=
 =?utf-8?B?UmNhTnRRa2tLdHpHWDRxU1YvYzRyYkkxSVAzQVl0dGVObUVFRWtvZjFrcWQ0?=
 =?utf-8?B?ekQ0cUNWQm92aEFwYWNEcFF4RzAzanFqTUlxaS92UDIzSHV6WTdZWk1MdFdR?=
 =?utf-8?B?YzZza2dZSkJmSmhzajBFZnBTaGJVK1NPWk40YTdMWGk4V25MTEpBL1EyK0gz?=
 =?utf-8?B?WktvV0NPaE5qZkZBUHB3WTNLQlAvckFJY1JKTlA3YUh4QTRvOURuQWdlWEJ1?=
 =?utf-8?B?N25BdFo4TjZxSTQ3M1NHRzdBTU54a0VmcjBQLzF6UVlqN1RpQ291TGhnQyty?=
 =?utf-8?B?VUVybnBDZFFESWRBeEt3d1FTMkpnaXJseW0rRTgvdVhYZkcxempyMnExWkFL?=
 =?utf-8?B?Vi9YSWdiNldWcC96S1JnRUY5MktIQmxYYUplUDBQcXRHQkg5WllmL2t5ZnRG?=
 =?utf-8?B?aXovK2JnWFFtUnJvU210QTE0S045Rk9ZM01LQ0ZHSjVmV3ExbXlBYnlhTEc5?=
 =?utf-8?B?dVh2Z3BkL1dDL3N4MjZsNnVxVmJCbnAwRDBOTXB4NDBFVlJLKzlvYWhEU0U5?=
 =?utf-8?B?aHdYZHhhREJ1UjltOVVtcjhiR0R3QW9RTlQzREpKblNuUEFwL2tLWnhRSm0y?=
 =?utf-8?B?dG4xdndkSXQrTkd4Y1RSaTRkRm9OM09QQ0lEdzBtUDJmZHhwWDZoVjhTaXFH?=
 =?utf-8?B?ay84L2IxSEJZZ3Z0WTArV1I3d0Q2UHdONDFsaHFjRVF5V0oxQ1NvY1oyQnJT?=
 =?utf-8?B?RzJSTVc4ZHpoeXl5cXlPcS82aGswQnFOOG1Yd2ZKQU0xNnYzVDI5bjBCVzlw?=
 =?utf-8?B?NXVjTDE2Zk45elRhdEJwd0o5Z0ZSdFI5UEkwb2s0bGtnWGxNRHFkbWVNbnVi?=
 =?utf-8?B?eWVQT3c2Sm9WSHpNWDQrWVpHNm02WE1PN2VDR2xwTGtBSHVJVTFPMFM2YlhL?=
 =?utf-8?B?VWlJbEowZkplZk9ZaWRxRUJ2RnNNRE5oaXBFWFF2dEdvOUVCY2syMlhyWTBt?=
 =?utf-8?B?YzdVOTl6MXFXUjBJdTl0VjFHcU1OMlBneHVua3hrUGlkTEtaRVBuL24xNjNY?=
 =?utf-8?B?dDFnR2VHTk5rMTJjZ2paUlUvREpvamVuYlRtMVowcS8yQ0dSakpXR1lHNzZG?=
 =?utf-8?B?WGZMdzgwSnJ0K2Z1ZHBGaXdKTjJ2UHdrcU1XdS9WRGtUbUFHRzFzUFFuVjJa?=
 =?utf-8?B?bDN5S1ZRQVJGVVl4b2s3SzdWcVBPdVp3UGk0ZnNjVTFtTHozbCtBa2dsQm1w?=
 =?utf-8?B?SjBjb1h5UFU3L0JibXNwNzZLYzNaL2F5Ly9iTDZwMnpEejNMNWdvTEV5Tmpl?=
 =?utf-8?B?cVAwWVgzMW16S0NwVlhMcUJ0YkVrOG9ET0pHVitNbkpGVVEzVWtrRWZ0a0Yw?=
 =?utf-8?B?MU5ZenVhZEhNTmtUaHNkNWh6QXBXSHBCbUpLeU5iRDluWkZPZCtMb0h5RkxV?=
 =?utf-8?B?TGllelo2OFBBNHhhQzZHRFl4b0lyVk1hakNEeVVTQmM1SERoVU5EOEhyTUJJ?=
 =?utf-8?B?d2tqckZML3d4RnZaSGg0SExHSWNhL0pWem1xVlRYaUVJcnFoN2dKeEVSQk0z?=
 =?utf-8?B?WlM0RCtUMEs5T1NQcXFEYVhPZEFLQ0o5NXZMcmhrUUJ5SnQ2WjlKSlJNOXhD?=
 =?utf-8?B?amJmQ20yNm1pUXVPK0VFeXdIUForNlNUaWxucjFUZE1sazBJN3VHS2FPK1pY?=
 =?utf-8?B?enBSZERJOXBpMVBTU2toWSsrVkhMZXd6QXFiaksxaFBpdENzWUxac3F5SE02?=
 =?utf-8?Q?lZ0s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1C8EB9889DD31B488A380E9B3C21EB7A@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 315ab3f6-747c-471c-e51e-08dd51970964
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2025 10:12:09.5719
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g4mQmcFkyVfhz7FIHGYJm1Q0IUv8QOJDpbBY4ybfEfLwlKG/WaMXkGvE0m6gUd05QTIUGkOThylZ8xjdulalew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6018

SGkgYWxsLA0KDQpPbiAyMDI1LzIvMjAgMTc6NTMsIEppcWlhbiBDaGVuIHdyb3RlOg0KPiBGcm9t
OiBTZXJnaXkgS2licmlrIDxTZXJnaXlfS2licmlrQGVwYW0uY29tPg0KPiANCj4gSW50cm9kdWNl
IGNvbmZpZyBvcHRpb24gWDg2X1NURFZHQSBzbyB0aGF0IHN0ZHZnYSBkcml2ZXIgY2FuIGJlDQo+
IGRpc2FibGVkIG9uIHN5c3RlbXMgdGhhdCBkb24ndCBuZWVkIGl0Lg0KPiANCj4gV2hhdCdzIG1v
cmUsIGluIGZ1bmN0aW9uIGVtdWxhdGlvbl9mbGFnc19vaywgdG8gY2hlY2sgaWYgdG9vbHN0YWNr
DQo+IHBhc3MgYW55IGVtdWxhdGlvbiBmbGFnIHRoYXQgZGlzYWJsZWQgaW4gYnVpbGRpbmcgdGlt
ZS4NCj4gDQpJIGFtIHNvcnJ5Lg0KQWZ0ZXIgc2VuZGluZyBteSBzZXJpZXMsIEkganVzdCBmb3Vu
ZCBvdXQgdGhhdCB0aGVyZSBhcmUgdjMgZm9yIHRoaXMgd29yay4NCmh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL3hlbi1kZXZlbC83YTBlZTg4My04NTQyLTRlMTctYWRlYi05YzFkODNmNTg2NTdAc3Vz
ZS5jb20vDQpBbmQgaXQgc2VlbXMgdGhhdCB0aGUgdjMgaGFzIG5vIG90aGVyIGltcGxlbWVudGF0
aW9uLXJlbGF0ZWQgY29tbWVudCwganVzdCB3YWl0aW5nIGZvciB4ODYgTWFpbnRhaW5lcnMnIG9w
aW5pb24uDQoNCj4gU2lnbmVkLW9mZi1ieTogU2VyZ2l5IEtpYnJpayA8U2VyZ2l5X0tpYnJpa0Bl
cGFtLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSmlxaWFuIENoZW4gPEppcWlhbi5DaGVuQGFtZC5j
b20+DQo+IC0tLQ0KPiBIaSBhbGwsDQo+IHRoaXMgaXMgYSByZXdvcmsgZm9yIGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL3hlbi1kZXZlbC8yMDI0MDkxMjA4NTcwOS44NTgwNTItMS1TZXJnaXlfS2li
cmlrQGVwYW0uY29tL1QvI3UuDQo+IA0KPiB2MS0+djIgY2hhbmdlczoNCj4gKiBGb3IgZW11bGF0
aW9uIGZsYWdzLCBhZGRlZCBhIG5ldyBmaWxlICJhcmNoL3g4Ni9odm0vS2NvbmZpZy5lbXUiIHRv
IGJlIGEgc2VwYXJhdGUgc2VsZXRpb24sDQo+ICAgYW5kIG1vdmVkIGRlZmluaXRpb24gb2YgImNv
bmZpZyBYODZfU1REVkdBIiBpbnRvIGl0Lg0KPiAqIEFkZGVkIGEgbmV3IG1hY3JvICIjZGVmaW5l
IERJU0FCTEVEX0VNVV9NQVNLICghSVNfRU5BQkxFRChDT05GSUdfWDg2X1NURFZHQSkgPyBYODZf
RU1VX1ZHQSA6IDApIiwNCj4gICBhbmQgY2hlY2tlZCBpdCBpbiBmdW5jdGlvbiBlbXVsYXRpb25f
ZmxhZ3Nfb2suDQo+ICogQWRqdXN0ZWQgbWFjcm8gImhhc192dmdhIi4NCj4gDQo+IEJlc3QgcmVn
YXJkcywNCj4gSmlxaWFuIENoZW4uDQo+IC0tLQ0KPiAgeGVuL2FyY2gveDg2L0tjb25maWcgICAg
ICAgICAgICAgIHwgIDIgKysNCj4gIHhlbi9hcmNoL3g4Ni9kb21haW4uYyAgICAgICAgICAgICB8
ICAyICsrDQo+ICB4ZW4vYXJjaC94ODYvaHZtL0tjb25maWcuZW11ICAgICAgfCAxNCArKysrKysr
KysrKysrKw0KPiAgeGVuL2FyY2gveDg2L2h2bS9NYWtlZmlsZSAgICAgICAgIHwgIDIgKy0NCj4g
IHhlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9kb21haW4uaCB8ICA2ICsrKysrLQ0KPiAgeGVuL2Fy
Y2gveDg2L2luY2x1ZGUvYXNtL2h2bS9pby5oIHwgIDQgKysrKw0KPiAgNiBmaWxlcyBjaGFuZ2Vk
LCAyOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IHhlbi9hcmNoL3g4Ni9odm0vS2NvbmZpZy5lbXUNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC94ODYvS2NvbmZpZyBiL3hlbi9hcmNoL3g4Ni9LY29uZmlnDQo+IGluZGV4IDljZGQwNDcyMWFm
YS4uZTRmZWRmN2U1NGQ4IDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC94ODYvS2NvbmZpZw0KPiAr
KysgYi94ZW4vYXJjaC94ODYvS2NvbmZpZw0KPiBAQCAtMTIzLDYgKzEyMyw4IEBAIGNvbmZpZyBI
Vk0NCj4gIA0KPiAgCSAgSWYgdW5zdXJlLCBzYXkgWS4NCj4gIA0KPiArc291cmNlICJhcmNoL3g4
Ni9odm0vS2NvbmZpZy5lbXUiDQo+ICsNCj4gIGNvbmZpZyBBTURfU1ZNDQo+ICAJYm9vbCAiQU1E
LVYiIGlmIEVYUEVSVA0KPiAgCWRlcGVuZHMgb24gSFZNDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC94ODYvZG9tYWluLmMgYi94ZW4vYXJjaC94ODYvZG9tYWluLmMNCj4gaW5kZXggNzhhMTNlNjgx
MmM5Li4yODljOTE0NTk0NzAgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9kb21haW4uYw0K
PiArKysgYi94ZW4vYXJjaC94ODYvZG9tYWluLmMNCj4gQEAgLTc1OCw2ICs3NTgsOCBAQCBzdGF0
aWMgYm9vbCBlbXVsYXRpb25fZmxhZ3Nfb2soY29uc3Qgc3RydWN0IGRvbWFpbiAqZCwgdWludDMy
X3QgZW1mbGFncykNCj4gICAgICAgICAgICAgICAoWDg2X0VNVV9BTEwgJiB+KFg4Nl9FTVVfVlBD
SSB8IFg4Nl9FTVVfVVNFX1BJUlEpKSAmJg0KPiAgICAgICAgICAgICAgIGVtZmxhZ3MgIT0gWDg2
X0VNVV9MQVBJQyApDQo+ICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7DQo+ICsgICAgICAgIGlm
ICggZW1mbGFncyAmIERJU0FCTEVEX0VNVV9NQVNLICkNCj4gKyAgICAgICAgICAgIHJldHVybiBm
YWxzZTsNCj4gICAgICB9DQo+ICAgICAgZWxzZSBpZiAoIGVtZmxhZ3MgIT0gMCAmJiBlbWZsYWdz
ICE9IFg4Nl9FTVVfUElUICkNCj4gICAgICB7DQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYv
aHZtL0tjb25maWcuZW11IGIveGVuL2FyY2gveDg2L2h2bS9LY29uZmlnLmVtdQ0KPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLmFhNjBiNjIyNzAzNg0KPiAtLS0g
L2Rldi9udWxsDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vS2NvbmZpZy5lbXUNCj4gQEAgLTAs
MCArMSwxNCBAQA0KPiArbWVudSAiRW11bGF0ZWQgZGV2aWNlIHN1cHBvcnQiDQo+ICsJdmlzaWJs
ZSBpZiBFWFBFUlQNCj4gKw0KPiArY29uZmlnIFg4Nl9TVERWR0ENCj4gKwlib29sICJTdGFuZGFy
ZCBWR0EgY2FyZCBlbXVsYXRpb24gc3VwcG9ydCIgaWYgRVhQRVJUDQo+ICsJZGVmYXVsdCB5DQo+
ICsJZGVwZW5kcyBvbiBIVk0NCj4gKwloZWxwDQo+ICsJICBCdWlsZCBzdGR2Z2EgZHJpdmVyIHRo
YXQgZW11bGF0ZXMgc3RhbmRhcmQgVkdBIGNhcmQgd2l0aCBWRVNBIEJJT1MNCj4gKwkgIEV4dGVu
c2lvbnMgZm9yIEhWTSBndWVzdHMuDQo+ICsNCj4gKwkgIElmIHVuc3VyZSwgc2F5IFkuDQo+ICsN
Cj4gK2VuZG1lbnUNCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vTWFrZWZpbGUgYi94
ZW4vYXJjaC94ODYvaHZtL01ha2VmaWxlDQo+IGluZGV4IDRjMWZhNWM2YzJiZi4uNGQxZjhlMDBl
YjY4IDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL01ha2VmaWxlDQo+ICsrKyBiL3hl
bi9hcmNoL3g4Ni9odm0vTWFrZWZpbGUNCj4gQEAgLTIyLDcgKzIyLDcgQEAgb2JqLXkgKz0gcG10
aW1lci5vDQo+ICBvYmoteSArPSBxdWlya3Mubw0KPiAgb2JqLXkgKz0gcnRjLm8NCj4gIG9iai15
ICs9IHNhdmUubw0KPiAtb2JqLXkgKz0gc3RkdmdhLm8NCj4gK29iai0kKENPTkZJR19YODZfU1RE
VkdBKSArPSBzdGR2Z2Eubw0KPiAgb2JqLXkgKz0gdmlvYXBpYy5vDQo+ICBvYmoteSArPSB2bGFw
aWMubw0KPiAgb2JqLXkgKz0gdm1fZXZlbnQubw0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2
L2luY2x1ZGUvYXNtL2RvbWFpbi5oIGIveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL2RvbWFpbi5o
DQo+IGluZGV4IGI3OWQ2YmFkZDcxYy4uNjhiZTIzYmYzYmY0IDEwMDY0NA0KPiAtLS0gYS94ZW4v
YXJjaC94ODYvaW5jbHVkZS9hc20vZG9tYWluLmgNCj4gKysrIGIveGVuL2FyY2gveDg2L2luY2x1
ZGUvYXNtL2RvbWFpbi5oDQo+IEBAIC00OTQsMTMgKzQ5NCwxNyBAQCBzdHJ1Y3QgYXJjaF9kb21h
aW4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFg4Nl9FTVVfUElUIHwgWDg2
X0VNVV9VU0VfUElSUSB8ICAgICAgIFwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFg4Nl9FTVVfVlBDSSkNCj4gIA0KPiArI2RlZmluZSBESVNBQkxFRF9FTVVfTUFTSyBcDQo+
ICsgICAgKCFJU19FTkFCTEVEKENPTkZJR19YODZfU1REVkdBKSA/IFg4Nl9FTVVfVkdBIDogMCkN
Cj4gKw0KPiAgI2RlZmluZSBoYXNfdmxhcGljKGQpICAgICAgKCEhKChkKS0+YXJjaC5lbXVsYXRp
b25fZmxhZ3MgJiBYODZfRU1VX0xBUElDKSkNCj4gICNkZWZpbmUgaGFzX3ZocGV0KGQpICAgICAg
ICghISgoZCktPmFyY2guZW11bGF0aW9uX2ZsYWdzICYgWDg2X0VNVV9IUEVUKSkNCj4gICNkZWZp
bmUgaGFzX3ZwbShkKSAgICAgICAgICghISgoZCktPmFyY2guZW11bGF0aW9uX2ZsYWdzICYgWDg2
X0VNVV9QTSkpDQo+ICAjZGVmaW5lIGhhc192cnRjKGQpICAgICAgICAoISEoKGQpLT5hcmNoLmVt
dWxhdGlvbl9mbGFncyAmIFg4Nl9FTVVfUlRDKSkNCj4gICNkZWZpbmUgaGFzX3Zpb2FwaWMoZCkg
ICAgICghISgoZCktPmFyY2guZW11bGF0aW9uX2ZsYWdzICYgWDg2X0VNVV9JT0FQSUMpKQ0KPiAg
I2RlZmluZSBoYXNfdnBpYyhkKSAgICAgICAgKCEhKChkKS0+YXJjaC5lbXVsYXRpb25fZmxhZ3Mg
JiBYODZfRU1VX1BJQykpDQo+IC0jZGVmaW5lIGhhc192dmdhKGQpICAgICAgICAoISEoKGQpLT5h
cmNoLmVtdWxhdGlvbl9mbGFncyAmIFg4Nl9FTVVfVkdBKSkNCj4gKyNkZWZpbmUgaGFzX3Z2Z2Eo
ZCkgICAgICAgIChJU19FTkFCTEVEKENPTkZJR19YODZfU1REVkdBKSAmJiBcDQo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgISEoKGQpLT5hcmNoLmVtdWxhdGlvbl9mbGFncyAmIFg4Nl9F
TVVfVkdBKSkNCj4gICNkZWZpbmUgaGFzX3Zpb21tdShkKSAgICAgICghISgoZCktPmFyY2guZW11
bGF0aW9uX2ZsYWdzICYgWDg2X0VNVV9JT01NVSkpDQo+ICAjZGVmaW5lIGhhc192cGl0KGQpICAg
ICAgICAoISEoKGQpLT5hcmNoLmVtdWxhdGlvbl9mbGFncyAmIFg4Nl9FTVVfUElUKSkNCj4gICNk
ZWZpbmUgaGFzX3BpcnEoZCkgICAgICAgICghISgoZCktPmFyY2guZW11bGF0aW9uX2ZsYWdzICYg
WDg2X0VNVV9VU0VfUElSUSkpDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaW5jbHVkZS9h
c20vaHZtL2lvLmggYi94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vaHZtL2lvLmgNCj4gaW5kZXgg
ZjJiODQzMWZhY2IwLi4zMmEyNDkwZmJjYjIgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9p
bmNsdWRlL2FzbS9odm0vaW8uaA0KPiArKysgYi94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vaHZt
L2lvLmgNCj4gQEAgLTEwOCw3ICsxMDgsMTEgQEAgc3RydWN0IHZwY2lfYXJjaF9tc2l4X2VudHJ5
IHsNCj4gICAgICBpbnQgcGlycTsNCj4gIH07DQo+ICANCj4gKyNpZmRlZiBDT05GSUdfWDg2X1NU
RFZHQQ0KPiAgdm9pZCBzdGR2Z2FfaW5pdChzdHJ1Y3QgZG9tYWluICpkKTsNCj4gKyNlbHNlDQo+
ICtzdGF0aWMgaW5saW5lIHZvaWQgc3RkdmdhX2luaXQoc3RydWN0IGRvbWFpbiAqZCkge30NCj4g
KyNlbmRpZg0KPiAgDQo+ICBleHRlcm4gdm9pZCBodm1fZHBjaV9tc2lfZW9pKHN0cnVjdCBkb21h
aW4gKmQsIGludCB2ZWN0b3IpOw0KPiAgDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENo
ZW4uDQo=

