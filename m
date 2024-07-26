Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F4B93CE54
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 08:54:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765269.1175855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXEpc-0000Eg-KY; Fri, 26 Jul 2024 06:53:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765269.1175855; Fri, 26 Jul 2024 06:53:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXEpc-0000Bw-Hf; Fri, 26 Jul 2024 06:53:36 +0000
Received: by outflank-mailman (input) for mailman id 765269;
 Fri, 26 Jul 2024 06:53:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8CH3=O2=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sXEpa-0000Bq-AZ
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 06:53:34 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c41c3e4d-4b1b-11ef-8776-851b0ebba9a2;
 Fri, 26 Jul 2024 08:53:31 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CH3PR12MB8281.namprd12.prod.outlook.com (2603:10b6:610:128::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Fri, 26 Jul
 2024 06:53:27 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7784.020; Fri, 26 Jul 2024
 06:53:27 +0000
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
X-Inumbo-ID: c41c3e4d-4b1b-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V3R5waRWVxXqgX/NqxkBDe+H1h9p5sDhOkREVIVIB33W+5pipCYDQ9K5aLdxJSvEARKNB9YVdE74MySpqYJg0nJWUdREeFcZOzftuzcn97d1BodYxKLVyL8bx0CbwRStS3cAQ+vpEXbRM+rDO8ZuAJZSMv7xk29jNik73LD6kkLmudkAbqsJF1ImWp6FoEACN1UTTjbUln24jOH5onRbqiPcRzkZYEN/zIqdxPGBogNgOrGBS02i2WBaR06mOkKjIWKddozChe18pw5jxZplaOwKDCL6OcUbkz+55vVren4k8mTzZEHRadRz5vkkO0AZmqUxHataOIIcpA+OY8dqUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AfMPp1rzJPurHPEQ0MOgTyxy0JVuYr8ce3YkF1vUxBU=;
 b=s/ouNwGeMTVPxOkmObfam5lPBO/t2XYuCjT8ksf67mr5CWxfChkx8A/dOggrDCnhUpO8pg/+YcZ/vK+58seNiAWbdHpZHkJrxVWxgQ4gNbfOeCxtjq1EE7Y9G4rqf6GiIRtb/TdwIsmE6NPanAraV6bexeg3iALGAH+eXvgna6ZgErVCnAW6VM19VCpK53eMx6TH9+NHCd7v8JUQydkVxzTH5hGB9Kqwp94+D4pgTMqtMAGtgf4KH1uVnQQSrHJtBOBPnfAwXyau8htbd7SIb6oARbWybfdpPHIzqIBLOgNigcQ+vXP8duPBdnRcAgx86Wn0ff3DxoKuxY4Qaaydww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AfMPp1rzJPurHPEQ0MOgTyxy0JVuYr8ce3YkF1vUxBU=;
 b=CHPA5CvG3zS/AgxtIxDklgnrcly7HVU5d2SiVrKWOC9PRvnTHDYbM546EQWPi0PEes1xjOHJaWpfhuOUVD0kB9euelMyXrL+t0le0ah1T/fZQugtUuacpUiq3IFdYtLbTBoMJDMx08UNZGBo/ZulT4vgDaHWg0RqsWYNSTAZSKE=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <gwd@xenproject.org>, Julien Grall
	<julien@xen.org>, Anthony PERARD <anthony@xenproject.org>, Juergen Gross
	<jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v12 4/7] x86/domctl: Add hypercall to set the access
 of x86 gsi
Thread-Topic: [XEN PATCH v12 4/7] x86/domctl: Add hypercall to set the access
 of x86 gsi
Thread-Index: AQHa0SvYL4tONjoIyEuzfSK6fk2TK7IDZYuAgAXOcoA=
Date: Fri, 26 Jul 2024 06:53:27 +0000
Message-ID:
 <BL1PR12MB5849C8A40630534241B31941E7B42@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-5-Jiqian.Chen@amd.com>
 <alpine.DEB.2.22.394.2407221505440.4857@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2407221505440.4857@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7784.020)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CH3PR12MB8281:EE_
x-ms-office365-filtering-correlation-id: c5f3ddad-db52-4403-0233-08dcad3fa6b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?OVlKTjIwM2ZqcW9TMjloSitWQXBCTVF3Skd6aU8rMTJscGYzWDltQnVvV3Qr?=
 =?utf-8?B?Q3FGcW1DZ2xVTjQyVHhwVm5wNmJTcE9tdkFVTnFzd0tjQ3hlbzA0cDhsUnI0?=
 =?utf-8?B?VHZBRTd4QnZmRWVhUE5rWGhqZmNQM0I0OFVYbTJWaGVLbVF5b2QxaklETVZX?=
 =?utf-8?B?QlJGaElpNi9UR0dtV3VSY2JIaU1VSUwwM25PNld3M3VMVVF6K09mcU9iK08y?=
 =?utf-8?B?d3BRVTN5NnZHaUphdmhsejVqWGhjQzhQdVJMYlpuano1WG91NFpzZ3ZBaWV0?=
 =?utf-8?B?NlRkb2I2QWlrMHhMMkQ2NU95eCtNQjl1YmgvRDVBckFmdStnN0N1UHl3ejE1?=
 =?utf-8?B?SWFGNHBkREJYOTNSNWRmREM3eExrcEZISnRoZFVJWUxxUjU4dzJKb3NIVzdk?=
 =?utf-8?B?b2krZGlWN2RUVVBQSk1adEFPdFJZS21ZZEhjdGpTMXF3OGxiMG4rS0NHUWwv?=
 =?utf-8?B?ajU2T1JTKzF6ZDFZQ3RnYmVqY2t6U3VxL2pyQnRoT1BoYnBKYWVWS2FhRVVN?=
 =?utf-8?B?N1lwQ3QyQ0xNZE14WGpnSWJtRlNTNmIybmdGQm1xc2NmM2xRU2JJYzMwM3J5?=
 =?utf-8?B?aGpSdTVRZXIwajRSZmNua05GMWdCQ2NmcjhSQVl0cHpLMFpicVZuZW8xRjJS?=
 =?utf-8?B?cjJIeDZhUlkvVktHRGRTWFl1WGFFcE5kY3F5ZFBRckNjcmZxaW1rVkpOKzBa?=
 =?utf-8?B?R1g0bUl2NVlQK1FobGNwbHNBTEttcEJrMjAra3c3WHNxNDZ0S2I5SVJTV3hx?=
 =?utf-8?B?Z3R3T1lEelBuTWZaUjNEbGlGYWhHR1Mwa0lnbncxSkxaM3o4WGRqS2lZRVdk?=
 =?utf-8?B?Vis0QThFQWhPM3E3MHlKSmhpd2tOWjAzUnF5cWkrNlFsVDBuaittRjJ5cTVJ?=
 =?utf-8?B?SW82d0dMWjJMMHdncUtKWXVrdzBTbWZRcGpuMHRNTUJKVE5SYmFuQndUa21p?=
 =?utf-8?B?cTJ2UENYUy9pSk1YbGt2VWp6TkF2cWhuRllkY1VCMzVFTDFsRGk0VXBmRnNh?=
 =?utf-8?B?UDE0L2pUcjMxTGY4OE9uVjVVanRhTHRROWM5eklWNEd4MlJ2Um92cGpteGo2?=
 =?utf-8?B?SEFBSDVDU2J4RDNVWmdWSFJJMFdMT003emlXQzZvaTE4Y0ZHUmMzQWM4c0t1?=
 =?utf-8?B?cTBObkw0ZllmUTdVOGRmdDRvK1lsL0MxK3UwU3NyVXY2R210NUxpYXFtSjgy?=
 =?utf-8?B?L0NSNE1kTnhLTm42REVtM3BqSDB4dnJ0QUtmcFpOVVNQYXdHVDJJZjdGR0hn?=
 =?utf-8?B?b2N3aVBlNkdrNWF6RXpXcmswZVVoS2NSZE9EVkZCOTNhK2gxRHBRN3pxRFBP?=
 =?utf-8?B?UE1EUURoSDBmaTQrK1owWVZyTmhZN3ArT1lCbDVMTG14Y1VhMXZ0LytPMWd5?=
 =?utf-8?B?SDl0dXNaQlREdWk1U0txaFNYZFNtZjhrUHIxR3ZZcGRJR3ZCK2cyMSszVnRk?=
 =?utf-8?B?NXhWaDRJamU0amZObzg4UG8wTUZzQ29sd0RrbmgxTU1rbEV5N3JXR1dyRnlm?=
 =?utf-8?B?aXR5SVRybkg2Z0lqZHhxTTVpSWZFYWc5Ly9mWFQ0ZGlPbkJFTUdBbVZKN3FJ?=
 =?utf-8?B?bHF1SENLakZhVnhrTHQvanc1eVNzZ1d3ZTMyVlJ6Tnhhb2djVjBvekpkT0p0?=
 =?utf-8?B?aEM2UWJqMllFQ3ErZldyVUkzeTlSSUpjd1lNTThMYVBKb2VBaTNxOVM1U2FU?=
 =?utf-8?B?Z3g4eEpOYWJCVUNQQlVHVkpMSzlJRTZFYWpBbCs2VjZqT2ZWUzMxQzIvS0hV?=
 =?utf-8?B?bGNRNFBQdkhkTkpjc0lISVc0Q0owLzVYdldEUmNwNmtUM3p6amFXR2c5OWp6?=
 =?utf-8?B?bi82VlQrL3BHc2xiWjZpTjQ3MEw4ZzZFNm5GZldKSjlHZktMZEdSVjQ1NVlF?=
 =?utf-8?B?MVRFb2h3ckV3OVNGenR2N1FVcXRvcURuQWt3Y1k1eEQ2WGc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d0M4cnRYU1dlNlhUOG9uNVQ0Z2NMMzlEMnFSMGVZcWdIV0E5ZzhXK0FVWE5O?=
 =?utf-8?B?OThGUTNNTUd3Q0k3clozcFdjbXlaVWd1ZGI3YXZ4WXlKaGEvWmlkcnd5eGFt?=
 =?utf-8?B?YkFobTU2eXVqNVZHVXBCem1tMTVneWVPKzJUbUE4UHpCN0RSa1VadmtNbzky?=
 =?utf-8?B?My9jUktiRWxoY05wMGFUV1JBYjd2aWVQOFY4RDhnRHpCZ0N1bVhFN1hXZjFh?=
 =?utf-8?B?bi9WUmxETEVXL0QwZDhqRmVHbnVuSlBFM0daL2oxU1JvdHI1Z3JOMEVqR2V3?=
 =?utf-8?B?cVFEUnk5K2NtMHF2ak56NmNZSVYrTy9HaGRPb2o0SWRBOFU3UnNjd3lhTmtw?=
 =?utf-8?B?T21IVXQxSEZUSmZteERLdkpuN0RTSnAybTk3RXRZS0xlTkkrbHJ2SWFBUGo4?=
 =?utf-8?B?QVVhUWtqK1pOeURrMlpOdVdBRVB3cFhOUnpOVFYzWTdSdHZZRkhFS1VjSEpI?=
 =?utf-8?B?YWlxTDgzQktuSDI5aTZoVjZPOXlVeU8weE5UbHg0VThwWnQ5cGJlZloyT0dP?=
 =?utf-8?B?ZTJPaGtNNFhiOWgrbFRtUld2ZEhPMGg0UnNtbWU4ZTdMc2VTUkdFcmRuZm5h?=
 =?utf-8?B?ekZpb0ZXb0hKL0lrelA4RHJ2OXpHazlEcjl3eHNoc1lSWi9GSVNHVkFKUFM5?=
 =?utf-8?B?ZTFkRUNFWlV6RmdiSUNuZ0NlcEJYMWw4UVIwTlQzZXJ3czIyNTZxcnRPNzhn?=
 =?utf-8?B?TXZkVmJleUg0NkNld1hkVjBQU3RwdFI3Q1BwMUdZVzUwTWZJekxNL1ZVcG5J?=
 =?utf-8?B?dUdQVHJZZDBnUi91M04vbUpudDlGUEg1WlJZaTlOd0tOeTNnM0pOWk1KME9D?=
 =?utf-8?B?eWpSLy9YYzB1UnJxSXR3SE5VRml1LytmM3V0Q1g0WHZLeGJuNm5tOG9xZE5q?=
 =?utf-8?B?UnNzOU9Od0hXdFlHM2FTUWRtYzVlVDZ1cE9hN2x5TGc3aEU1eTlyWkwydXdl?=
 =?utf-8?B?Zm9ROTg3QVcwYk5ZL3RnUEl3UnBybFQzbkpjNU5JdkhWWWtxSkhZTjY5M0w3?=
 =?utf-8?B?WGlaVHpPbThpTWF5ZC9ZTEVzaHNxbEZVcmlMMVdkcDRMTUpYZHVCTzBsRXFK?=
 =?utf-8?B?ZE44N1AvWVptN3VjN3pGcXNJMmZ5Z0lIY3JKdUdwVHIxUTZla2lHdkNKOTRU?=
 =?utf-8?B?ZXFFUlNiWjVibWFGN1BXRm9WVnErOEo2YnNmK0VaZ2x6SGptaXFZU29DYmJG?=
 =?utf-8?B?dWJ6bDAyZlFVczg3eTlJRXZ0SjdMVEFLWmNhR1pVWmxlRkhYL0dHZmUwOWRy?=
 =?utf-8?B?dnEzajgwNHFvc09ya293ZWJYSVhMTlozMTBnY2VmdkhuS3VvVU1ZWHc0WWNY?=
 =?utf-8?B?UDR3STBNcXdHU2srTWtGVFovRFZFSnNLampzalVmR29QZlpzVGpYMng0S3N2?=
 =?utf-8?B?TjVnZ2FtY296Q096eEVNc3RudklwU0VqdnowRkhBQU1CSm1acHBUK2p1L1Jk?=
 =?utf-8?B?WWs5bS9LTUNoeEcwdDl5S1dPOTlDeDIzZnBXazUzaEowa296dWcyUmJOK0NY?=
 =?utf-8?B?dEZuVVhvKzkwanpBVnk2YlM0R0lEZkV6QTJFbVB0a1c2Zk44dXlKNktaRWdt?=
 =?utf-8?B?dkZMaVBjOThXSGxzMFlJaDVqQTVJUlBPS1BIbG9JM0VxVkpNTzB2bGFYUkdv?=
 =?utf-8?B?Rnh1Qk12czFxMlJvaWxHL2RUY1JJUXQ3ZzhQTU1nZTM1cTRZTzhsOXFFQkdG?=
 =?utf-8?B?TXlXbkhjSDlYaEVxRC94eWRWZUhCbUFFWlFDQ0xxSzNYYjA4YkxFQXA0bEdE?=
 =?utf-8?B?c21aOURuWnJHY0t6WkdrZkEzcC9JdCtzZ0xNNmxSRXhyOFNtdCtaU0RKTnYy?=
 =?utf-8?B?VTNuM1NibTc2ZzJJWnNqNTMvQ3k3N3ZnWUFRSHFUTmRsS0NKU2FjdmZtQUdP?=
 =?utf-8?B?UEhwMDZFUkRTZEpUd28wWlFNZFhuK2FmNWgwaXoxODBxcXdiMEk1dW05OHdY?=
 =?utf-8?B?bk1wZURuNnlRYTEvbStkNjgvVVJiR3J2RGhpdFN0OVpKbzhQOGgvUGJSOHFK?=
 =?utf-8?B?a2NsZjBMUjFjOWdYdWlIN2Z2UVlUNWEzTEtGUkg5M2hwQU8vRXd4cEdsZU5G?=
 =?utf-8?B?bnRJNnFpd3VlNVFiU1V6R0szeVFuNlZPZ09hcjNmMnVBUTdvQjVHclB3NWMv?=
 =?utf-8?Q?bN1c=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <63946469FAB758479AA58B345EB5D68D@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5f3ddad-db52-4403-0233-08dcad3fa6b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2024 06:53:27.0373
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UCG6EgYLhMwg//+wiNCqeHQqCMXRjMk4xwWvobDk7AeG1rtPoKAGQ95WcFuLOLlJzix/lREryh4UrD9yTJbuOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8281

T24gMjAyNC83LzIzIDA2OjEwLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+IE9uIE1vbiwg
OCBKdWwgMjAyNCwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiBTb21lIHR5cGUgb2YgZG9tYWlucyBk
b24ndCBoYXZlIFBJUlFzLCBsaWtlIFBWSCwgaXQgZG9lc24ndCBkbw0KPj4gUEhZU0RFVk9QX21h
cF9waXJxIGZvciBlYWNoIGdzaS4gV2hlbiBwYXNzdGhyb3VnaCBhIGRldmljZQ0KPj4gdG8gZ3Vl
c3QgYmFzZSBvbiBQVkggZG9tMCwgY2FsbHN0YWNrDQo+PiBwY2lfYWRkX2RtX2RvbmUtPlhFTl9E
T01DVExfaXJxX3Blcm1pc3Npb24gd2lsbCBmYWlsIGF0IGZ1bmN0aW9uDQo+PiBkb21haW5fcGly
cV90b19pcnEsIGJlY2F1c2UgUFZIIGhhcyBubyBtYXBwaW5nIG9mIGdzaSwgcGlycSBhbmQNCj4+
IGlycSBvbiBYZW4gc2lkZS4NCj4+IFdoYXQncyBtb3JlLCBjdXJyZW50IGh5cGVyY2FsbCBYRU5f
RE9NQ1RMX2lycV9wZXJtaXNzaW9uIHJlcXVpcmVzDQo+PiBwYXNzaW5nIGluIHBpcnEgdG8gc2V0
IHRoZSBhY2Nlc3Mgb2YgaXJxLCBpdCBpcyBub3Qgc3VpdGFibGUgZm9yDQo+PiBkb20wIHRoYXQg
ZG9lc24ndCBoYXZlIFBJUlFzLg0KPj4NCj4+IFNvLCBhZGQgYSBuZXcgaHlwZXJjYWxsIFhFTl9E
T01DVExfZ3NpX3Blcm1pc3Npb24gdG8gZ3JhbnQvZGVueQ0KPj4gdGhlIHBlcm1pc3Npb24gb2Yg
aXJxKHRyYW5zbGF0ZSBmcm9tIHg4NiBnc2kpIHRvIGR1bVUgd2hlbiBkb20wDQo+PiBoYXMgbm8g
UElSUXMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSmlxaWFuIENoZW4gPEppcWlhbi5DaGVuQGFt
ZC5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPg0K
Pj4gU2lnbmVkLW9mZi1ieTogSmlxaWFuIENoZW4gPEppcWlhbi5DaGVuQGFtZC5jb20+DQo+PiAt
LS0NCj4+IENDOiBEYW5pZWwgUCAuIFNtaXRoIDxkcHNtaXRoQGFwZXJ0dXNzb2x1dGlvbnMuY29t
Pg0KPj4gUmVtYWluaW5nIGNvbW1lbnQgQERhbmllbCBQIC4gU21pdGg6DQo+PiArICAgICAgICBy
ZXQgPSAtRVBFUk07DQo+PiArICAgICAgICBpZiAoICFpcnFfYWNjZXNzX3Blcm1pdHRlZChjdXJy
ZCwgaXJxKSB8fA0KPj4gKyAgICAgICAgICAgICB4c21faXJxX3Blcm1pc3Npb24oWFNNX0hPT0ss
IGQsIGlycSwgYWNjZXNzX2ZsYWcpICkNCj4+ICsgICAgICAgICAgICBnb3RvIGdzaV9wZXJtaXNz
aW9uX291dDsNCj4+IElzIGl0IG9rYXkgdG8gaXNzdWUgdGhlIFhTTSBjaGVjayB1c2luZyB0aGUg
dHJhbnNsYXRlZCB2YWx1ZSwgDQo+PiBub3QgdGhlIG9uZSB0aGF0IHdhcyBvcmlnaW5hbGx5IHBh
c3NlZCBpbnRvIHRoZSBoeXBlcmNhbGw/DQo+PiAtLS0NCj4+ICB4ZW4vYXJjaC94ODYvZG9tY3Rs
LmMgICAgICAgICAgICAgIHwgMzIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+PiAg
eGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL2lvX2FwaWMuaCB8ICAyICsrDQo+PiAgeGVuL2FyY2gv
eDg2L2lvX2FwaWMuYyAgICAgICAgICAgICB8IDE3ICsrKysrKysrKysrKysrKysNCj4+ICB4ZW4v
YXJjaC94ODYvbXBwYXJzZS5jICAgICAgICAgICAgIHwgIDUgKystLS0NCj4+ICB4ZW4vaW5jbHVk
ZS9wdWJsaWMvZG9tY3RsLmggICAgICAgIHwgIDkgKysrKysrKysrDQo+PiAgeGVuL3hzbS9mbGFz
ay9ob29rcy5jICAgICAgICAgICAgICB8ICAxICsNCj4+ICA2IGZpbGVzIGNoYW5nZWQsIDYzIGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9kb21jdGwuYyBiL3hlbi9hcmNoL3g4Ni9kb21jdGwuYw0KPj4gaW5kZXggOTE5MGUxMWZh
YWEzLi40ZTllNGM0Y2ZlZDMgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC94ODYvZG9tY3RsLmMN
Cj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9kb21jdGwuYw0KPj4gQEAgLTM2LDYgKzM2LDcgQEANCj4+
ICAjaW5jbHVkZSA8YXNtL3hzdGF0ZS5oPg0KPj4gICNpbmNsdWRlIDxhc20vcHNyLmg+DQo+PiAg
I2luY2x1ZGUgPGFzbS9jcHUtcG9saWN5Lmg+DQo+PiArI2luY2x1ZGUgPGFzbS9pb19hcGljLmg+
DQo+PiAgDQo+PiAgc3RhdGljIGludCB1cGRhdGVfZG9tYWluX2NwdV9wb2xpY3koc3RydWN0IGRv
bWFpbiAqZCwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB4ZW5fZG9t
Y3RsX2NwdV9wb2xpY3lfdCAqeGRwYykNCj4+IEBAIC0yMzcsNiArMjM4LDM3IEBAIGxvbmcgYXJj
aF9kb19kb21jdGwoDQo+PiAgICAgICAgICBicmVhazsNCj4+ICAgICAgfQ0KPj4gIA0KPj4gKyAg
ICBjYXNlIFhFTl9ET01DVExfZ3NpX3Blcm1pc3Npb246DQo+PiArICAgIHsNCj4+ICsgICAgICAg
IGludCBpcnE7DQo+PiArICAgICAgICB1bnNpZ25lZCBpbnQgZ3NpID0gZG9tY3RsLT51LmdzaV9w
ZXJtaXNzaW9uLmdzaTsNCj4+ICsgICAgICAgIHVpbnQ4X3QgYWNjZXNzX2ZsYWcgPSBkb21jdGwt
PnUuZ3NpX3Blcm1pc3Npb24uYWNjZXNzX2ZsYWc7DQo+PiArDQo+PiArICAgICAgICAvKiBDaGVj
ayBhbGwgYml0cyBhbmQgcGFkcyBhcmUgemVybyBleGNlcHQgbG93ZXN0IGJpdCAqLw0KPj4gKyAg
ICAgICAgcmV0ID0gLUVJTlZBTDsNCj4+ICsgICAgICAgIGlmICggYWNjZXNzX2ZsYWcgJiAoIH5Y
RU5fRE9NQ1RMX0dTSV9QRVJNSVNTSU9OX01BU0sgKSApDQo+PiArICAgICAgICAgICAgZ290byBn
c2lfcGVybWlzc2lvbl9vdXQ7DQo+PiArICAgICAgICBmb3IgKCBpID0gMDsgaSA8IEFSUkFZX1NJ
WkUoZG9tY3RsLT51LmdzaV9wZXJtaXNzaW9uLnBhZCk7ICsraSApDQo+PiArICAgICAgICAgICAg
aWYgKCBkb21jdGwtPnUuZ3NpX3Blcm1pc3Npb24ucGFkW2ldICkNCj4+ICsgICAgICAgICAgICAg
ICAgZ290byBnc2lfcGVybWlzc2lvbl9vdXQ7DQo+PiArDQo+PiArICAgICAgICBpZiAoIGdzaSA+
IGhpZ2hlc3RfZ3NpKCkgfHwgKGlycSA9IGdzaV8yX2lycShnc2kpKSA8PSAwICkNCj4gDQo+IGdz
aSBpcyB1bnNpZ25lZCBpbnQgYnV0IGl0IGlzIHBhc3NlZCB0byBnc2lfMl9pcnEgd2hpY2ggdGFr
ZXMgYW4gaW50IGFzDQo+IHBhcmFtZXRlci4gSWYgZ3NpID49IElOVDMyX01BWCB3ZSBoYXZlIGEg
cHJvYmxlbS4gSSB0aGluayB3ZSBzaG91bGQNCj4gZXhwbGljaXRseSBjaGVjayBmb3IgdGhlIHBv
c3NpYmxlIG92ZXJmbG93IGFuZCByZXR1cm4gZXJyb3IgaW4gdGhhdA0KPiBjYXNlLg0KQnV0IGhl
cmUgaGFzIGNoZWNrZWQgImdzaSA+IGhpZ2hlc3RfZ3NpKCkiLCBjYW4gaGlnaGVzaV9nc2koKSBy
ZXR1cm4gYSBnc2kgPj0gSU5UMzJfTUFYPw0KDQo+IA0KPiANCj4+ICsgICAgICAgICAgICBnb3Rv
IGdzaV9wZXJtaXNzaW9uX291dDsNCj4+ICsNCj4+ICsgICAgICAgIHJldCA9IC1FUEVSTTsNCj4+
ICsgICAgICAgIGlmICggIWlycV9hY2Nlc3NfcGVybWl0dGVkKGN1cnJkLCBpcnEpIHx8DQo+PiAr
ICAgICAgICAgICAgIHhzbV9pcnFfcGVybWlzc2lvbihYU01fSE9PSywgZCwgaXJxLCBhY2Nlc3Nf
ZmxhZykgKQ0KPj4gKyAgICAgICAgICAgIGdvdG8gZ3NpX3Blcm1pc3Npb25fb3V0Ow0KPj4gKw0K
Pj4gKyAgICAgICAgaWYgKCBhY2Nlc3NfZmxhZyApDQo+PiArICAgICAgICAgICAgcmV0ID0gaXJx
X3Blcm1pdF9hY2Nlc3MoZCwgaXJxKTsNCj4+ICsgICAgICAgIGVsc2UNCj4+ICsgICAgICAgICAg
ICByZXQgPSBpcnFfZGVueV9hY2Nlc3MoZCwgaXJxKTsNCj4+ICsNCj4+ICsgICAgZ3NpX3Blcm1p
c3Npb25fb3V0Og0KPj4gKyAgICAgICAgYnJlYWs7DQo+PiArICAgIH0NCj4+ICsNCj4+ICAgICAg
Y2FzZSBYRU5fRE9NQ1RMX2dldHBhZ2VmcmFtZWluZm8zOg0KPj4gICAgICB7DQo+PiAgICAgICAg
ICB1bnNpZ25lZCBpbnQgbnVtID0gZG9tY3RsLT51LmdldHBhZ2VmcmFtZWluZm8zLm51bTsNCj4+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vaW9fYXBpYy5oIGIveGVuL2Fy
Y2gveDg2L2luY2x1ZGUvYXNtL2lvX2FwaWMuaA0KPj4gaW5kZXggNzgyNjhlYThmNjY2Li43ZTg2
ZDgzMzc3NTggMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vaW9fYXBp
Yy5oDQo+PiArKysgYi94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vaW9fYXBpYy5oDQo+PiBAQCAt
MjEzLDUgKzIxMyw3IEBAIHVuc2lnbmVkIGhpZ2hlc3RfZ3NpKHZvaWQpOw0KPj4gIA0KPj4gIGlu
dCBpb2FwaWNfZ3Vlc3RfcmVhZCggdW5zaWduZWQgbG9uZyBwaHlzYmFzZSwgdW5zaWduZWQgaW50
IHJlZywgdTMyICpwdmFsKTsNCj4+ICBpbnQgaW9hcGljX2d1ZXN0X3dyaXRlKHVuc2lnbmVkIGxv
bmcgcGh5c2Jhc2UsIHVuc2lnbmVkIGludCByZWcsIHUzMiB2YWwpOw0KPj4gK2ludCBtcF9maW5k
X2lvYXBpYyhpbnQgZ3NpKTsNCj4+ICtpbnQgZ3NpXzJfaXJxKGludCBnc2kpOw0KPj4gIA0KPj4g
ICNlbmRpZg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9pb19hcGljLmMgYi94ZW4vYXJj
aC94ODYvaW9fYXBpYy5jDQo+PiBpbmRleCBkMmEzMTNjNGFjNzIuLjU5NjhjODA1NTY3MSAxMDA2
NDQNCj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9pb19hcGljLmMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4
Ni9pb19hcGljLmMNCj4+IEBAIC05NTUsNiArOTU1LDIzIEBAIHN0YXRpYyBpbnQgcGluXzJfaXJx
KGludCBpZHgsIGludCBhcGljLCBpbnQgcGluKQ0KPj4gICAgICByZXR1cm4gaXJxOw0KPj4gIH0N
Cj4+ICANCj4+ICtpbnQgZ3NpXzJfaXJxKGludCBnc2kpDQo+PiArew0KPj4gKyAgICBpbnQgaW9h
cGljLCBwaW4sIGlycTsNCj4+ICsNCj4+ICsgICAgaW9hcGljID0gbXBfZmluZF9pb2FwaWMoZ3Np
KTsNCj4+ICsgICAgaWYgKCBpb2FwaWMgPCAwICkNCj4+ICsgICAgICAgIHJldHVybiAtRUlOVkFM
Ow0KPj4gKw0KPj4gKyAgICBwaW4gPSBnc2kgLSBpb19hcGljX2dzaV9iYXNlKGlvYXBpYyk7DQo+
PiArDQo+PiArICAgIGlycSA9IGFwaWNfcGluXzJfZ3NpX2lycShpb2FwaWMsIHBpbik7DQo+PiAr
ICAgIGlmICggaXJxIDw9IDAgKQ0KPj4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+PiArDQo+
PiArICAgIHJldHVybiBpcnE7DQo+PiArfQ0KPj4gKw0KPj4gIHN0YXRpYyBpbmxpbmUgaW50IElP
X0FQSUNfaXJxX3RyaWdnZXIoaW50IGlycSkNCj4+ICB7DQo+PiAgICAgIGludCBhcGljLCBpZHgs
IHBpbjsNCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbXBwYXJzZS5jIGIveGVuL2FyY2gv
eDg2L21wcGFyc2UuYw0KPj4gaW5kZXggZDhjY2FiMjQ0OWM2Li43Nzg2YTMzMzc3NjAgMTAwNjQ0
DQo+PiAtLS0gYS94ZW4vYXJjaC94ODYvbXBwYXJzZS5jDQo+PiArKysgYi94ZW4vYXJjaC94ODYv
bXBwYXJzZS5jDQo+PiBAQCAtODQxLDggKzg0MSw3IEBAIHN0YXRpYyBzdHJ1Y3QgbXBfaW9hcGlj
X3JvdXRpbmcgew0KPj4gIH0gbXBfaW9hcGljX3JvdXRpbmdbTUFYX0lPX0FQSUNTXTsNCj4+ICAN
Cj4+ICANCj4+IC1zdGF0aWMgaW50IG1wX2ZpbmRfaW9hcGljICgNCj4+IC0JaW50CQkJZ3NpKQ0K
Pj4gK2ludCBtcF9maW5kX2lvYXBpYyhpbnQgZ3NpKQ0KPj4gIHsNCj4+ICAJdW5zaWduZWQgaW50
CQlpOw0KPj4gIA0KPj4gQEAgLTkxNCw3ICs5MTMsNyBAQCB2b2lkIF9faW5pdCBtcF9yZWdpc3Rl
cl9pb2FwaWMgKA0KPj4gIAlyZXR1cm47DQo+PiAgfQ0KPj4gIA0KPj4gLXVuc2lnbmVkIF9faW5p
dCBoaWdoZXN0X2dzaSh2b2lkKQ0KPj4gK3Vuc2lnbmVkIGhpZ2hlc3RfZ3NpKHZvaWQpDQo+PiAg
ew0KPj4gIAl1bnNpZ25lZCB4LCByZXMgPSAwOw0KPj4gIAlmb3IgKHggPSAwOyB4IDwgbnJfaW9h
cGljczsgeCsrKQ0KPj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaCBi
L3hlbi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaA0KPj4gaW5kZXggMmE0OWZlNDZjZTI1Li44Nzdl
MzVhYjEzNzYgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmgNCj4+
ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaA0KPj4gQEAgLTQ2NCw2ICs0NjQsMTMg
QEAgc3RydWN0IHhlbl9kb21jdGxfaXJxX3Blcm1pc3Npb24gew0KPj4gICAgICB1aW50OF90IHBh
ZFszXTsNCj4+ICB9Ow0KPj4gIA0KPj4gKy8qIFhFTl9ET01DVExfZ3NpX3Blcm1pc3Npb24gKi8N
Cj4+ICtzdHJ1Y3QgeGVuX2RvbWN0bF9nc2lfcGVybWlzc2lvbiB7DQo+PiArICAgIHVpbnQzMl90
IGdzaTsNCj4+ICsjZGVmaW5lIFhFTl9ET01DVExfR1NJX1BFUk1JU1NJT05fTUFTSyAxDQo+PiAr
ICAgIHVpbnQ4X3QgYWNjZXNzX2ZsYWc7ICAgIC8qIGZsYWcgdG8gc3BlY2lmeSBlbmFibGUvZGlz
YWJsZSBvZiB4ODYgZ3NpIGFjY2VzcyAqLw0KPj4gKyAgICB1aW50OF90IHBhZFszXTsNCj4+ICt9
Ow0KPj4gIA0KPj4gIC8qIFhFTl9ET01DVExfaW9tZW1fcGVybWlzc2lvbiAqLw0KPj4gIHN0cnVj
dCB4ZW5fZG9tY3RsX2lvbWVtX3Blcm1pc3Npb24gew0KPj4gQEAgLTEzMDYsNiArMTMxMyw3IEBA
IHN0cnVjdCB4ZW5fZG9tY3RsIHsNCj4+ICAjZGVmaW5lIFhFTl9ET01DVExfZ2V0X3BhZ2luZ19t
ZW1wb29sX3NpemUgICAgICAgODUNCj4+ICAjZGVmaW5lIFhFTl9ET01DVExfc2V0X3BhZ2luZ19t
ZW1wb29sX3NpemUgICAgICAgODYNCj4+ICAjZGVmaW5lIFhFTl9ET01DVExfZHRfb3ZlcmxheSAg
ICAgICAgICAgICAgICAgICAgODcNCj4+ICsjZGVmaW5lIFhFTl9ET01DVExfZ3NpX3Blcm1pc3Np
b24gICAgICAgICAgICAgICAgODgNCj4+ICAjZGVmaW5lIFhFTl9ET01DVExfZ2Ric3hfZ3Vlc3Rt
ZW1pbyAgICAgICAgICAgIDEwMDANCj4+ICAjZGVmaW5lIFhFTl9ET01DVExfZ2Ric3hfcGF1c2V2
Y3B1ICAgICAgICAgICAgIDEwMDENCj4+ICAjZGVmaW5lIFhFTl9ET01DVExfZ2Ric3hfdW5wYXVz
ZXZjcHUgICAgICAgICAgIDEwMDINCj4+IEBAIC0xMzI4LDYgKzEzMzYsNyBAQCBzdHJ1Y3QgeGVu
X2RvbWN0bCB7DQo+PiAgICAgICAgICBzdHJ1Y3QgeGVuX2RvbWN0bF9zZXRkb21haW5oYW5kbGUg
ICBzZXRkb21haW5oYW5kbGU7DQo+PiAgICAgICAgICBzdHJ1Y3QgeGVuX2RvbWN0bF9zZXRkZWJ1
Z2dpbmcgICAgICBzZXRkZWJ1Z2dpbmc7DQo+PiAgICAgICAgICBzdHJ1Y3QgeGVuX2RvbWN0bF9p
cnFfcGVybWlzc2lvbiAgICBpcnFfcGVybWlzc2lvbjsNCj4+ICsgICAgICAgIHN0cnVjdCB4ZW5f
ZG9tY3RsX2dzaV9wZXJtaXNzaW9uICAgIGdzaV9wZXJtaXNzaW9uOw0KPj4gICAgICAgICAgc3Ry
dWN0IHhlbl9kb21jdGxfaW9tZW1fcGVybWlzc2lvbiAgaW9tZW1fcGVybWlzc2lvbjsNCj4+ICAg
ICAgICAgIHN0cnVjdCB4ZW5fZG9tY3RsX2lvcG9ydF9wZXJtaXNzaW9uIGlvcG9ydF9wZXJtaXNz
aW9uOw0KPj4gICAgICAgICAgc3RydWN0IHhlbl9kb21jdGxfaHlwZXJjYWxsX2luaXQgICAgaHlw
ZXJjYWxsX2luaXQ7DQo+PiBkaWZmIC0tZ2l0IGEveGVuL3hzbS9mbGFzay9ob29rcy5jIGIveGVu
L3hzbS9mbGFzay9ob29rcy5jDQo+PiBpbmRleCA1ZTg4YzcxYjhlMjIuLmE1YjEzNGM5MTEwMSAx
MDA2NDQNCj4+IC0tLSBhL3hlbi94c20vZmxhc2svaG9va3MuYw0KPj4gKysrIGIveGVuL3hzbS9m
bGFzay9ob29rcy5jDQo+PiBAQCAtNjg1LDYgKzY4NSw3IEBAIHN0YXRpYyBpbnQgY2ZfY2hlY2sg
Zmxhc2tfZG9tY3RsKHN0cnVjdCBkb21haW4gKmQsIGludCBjbWQpDQo+PiAgICAgIGNhc2UgWEVO
X0RPTUNUTF9zaGFkb3dfb3A6DQo+PiAgICAgIGNhc2UgWEVOX0RPTUNUTF9pb3BvcnRfcGVybWlz
c2lvbjoNCj4+ICAgICAgY2FzZSBYRU5fRE9NQ1RMX2lvcG9ydF9tYXBwaW5nOg0KPj4gKyAgICBj
YXNlIFhFTl9ET01DVExfZ3NpX3Blcm1pc3Npb246DQo+PiAgI2VuZGlmDQo+PiAgI2lmZGVmIENP
TkZJR19IQVNfUEFTU1RIUk9VR0gNCj4+ICAgICAgLyoNCj4+IC0tIA0KPj4gMi4zNC4xDQo+Pg0K
DQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

