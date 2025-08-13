Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A4CB242F1
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 09:41:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1079506.1440334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1um673-0001aI-HK; Wed, 13 Aug 2025 07:41:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1079506.1440334; Wed, 13 Aug 2025 07:41:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1um673-0001Y5-E3; Wed, 13 Aug 2025 07:41:33 +0000
Received: by outflank-mailman (input) for mailman id 1079506;
 Wed, 13 Aug 2025 07:41:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gOuC=2Z=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1um672-0001Xz-3x
 for xen-devel@lists.xenproject.org; Wed, 13 Aug 2025 07:41:32 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea635a48-7818-11f0-b898-0df219b8e170;
 Wed, 13 Aug 2025 09:41:27 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by GVXPR03MB10479.eurprd03.prod.outlook.com (2603:10a6:150:150::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Wed, 13 Aug
 2025 07:41:23 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 07:41:23 +0000
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
X-Inumbo-ID: ea635a48-7818-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uxoGP9SuzABzJkGIL8fBJb50o2iXCTGS9scTWkeaPXbeuqxzmtOgS769osFvne4+Kikv2TpoK1mClYlmlJd9xzuPanD+DuJ6IzwpIZBNJDOdvYrPTmBbCoSxcJ9c6pI6MdbcxCEBwOrRgLO3IjQQ6keiYEVk8L2MjvSbv4G12QuFJZ6PQNkMWRJxakUUzpt90F7NhiJHPZFNG7BhfdRedVlPL80xKDB8+eb7eBJeGylOcHPDe1w+HMXe5S1pEtnFwisb3cPHUkw857porBrAcVq6TNSIvZjM7oDMR0Gy7r7sNFYkn/EsjpHJfzWKPKyPdOf64js94f0O4quUU026qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jku2S9VOEnY+kzDwWRF4jnCWArjfF9dtIi/k9j2T53Y=;
 b=Ojb0IucUGeA7JNjFHs0l03xi81HxcF1DalSLyJysi8EO1RzY9+aYoK28U6ZmmwQlhTOtTcVpMGK0A1H6p4xNYtwv86h/p6s25QMOuthJOYB2Pr1Zr7W4CXKpLciwE4wc53OEdjZKPTX6PwOroZrwDvtWFraNniLVvgEU798g929473P5x77iqMv2CZaF6kvhNaUCngz6FMVZtBrTUBjiaYeWhNHb8yI6o1I2jvIxTahxUKUOj840EV0vHLZRwAJmsKhHsrZ1FlEBiUpVJtsgeS87DVfJOKmpuL2jbGirGVZfjRF+pqChSuozNX66KGGqJg8feVuUpTSzJ0XbF/uAIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jku2S9VOEnY+kzDwWRF4jnCWArjfF9dtIi/k9j2T53Y=;
 b=k9kSsIYUyz9aOqTwKZVmB6EEIRO26y623kZCLGGX3rbj/XihEh3B+gKuuas5NcBfox7JeM0Xucihwx/X/m+BrIYjANANYpVOIzUys2zzkMbluOKYY+yMPFOa/TxwXhrEaC5GrIetODdTycV4aHLjBcRNhu+8YMn7iZZ3AYMVoRGQCtRlCjho/oGdPT2E0e93WaH9s4zcgmntbgHbeSh8klbSkTpAZVj1lHhayTqEGB4ArZ8o5cCx4WnV65JGWyliaotA6dBtrHWXZGCiHKzxHlkhawnC9HMgpw7rU/bf4A0XJuOl1vMDzxuYw7dq5NIeaLpwp7z5GwM3KmzvLZWtIw==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>,
	"consulting@bugseng.com" <consulting@bugseng.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "jbeulich@suse.com"
	<jbeulich@suse.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH 2/2] Address violation of MISRA C Rule 13.1 involving
 asm side effects.
Thread-Topic: [XEN PATCH 2/2] Address violation of MISRA C Rule 13.1 involving
 asm side effects.
Thread-Index: AQHcCK0jS1rUvIHcNU+6wO2ItjtxCLRgOfkA
Date: Wed, 13 Aug 2025 07:41:23 +0000
Message-ID: <175d7b47-32bb-4b5d-a16b-7402bd823b15@epam.com>
References:
 <1283be3b76d76814af244bbca544f6a3b74a04de.1754689062.git.nicola.vetrini@bugseng.com>
 <c4da2554d94c3f7bd4b1e460dcaa27db382ece2f.1754689062.git.nicola.vetrini@bugseng.com>
In-Reply-To:
 <c4da2554d94c3f7bd4b1e460dcaa27db382ece2f.1754689062.git.nicola.vetrini@bugseng.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|GVXPR03MB10479:EE_
x-ms-office365-filtering-correlation-id: 16f35bff-6d49-4db1-835a-08ddda3ccd51
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?c2NIbHpZdXBYL3Q4RE8xT0N2MDNaRTBFK0VEaVBnOURaR1FKQlVCV09obUdH?=
 =?utf-8?B?bnlGV1UxU1hKT3Z3SStQaUhNWGpxeEJUOFEzbS9FTUdlYjViaERIZ3pzTGJ4?=
 =?utf-8?B?WlFycDFOaC9QZktrUFBYOG1mREcxbUk2SlhGd29FZnlBWWREVmwrd0NnTE5M?=
 =?utf-8?B?MXRwVTFadW9UYVQwaHhIYmY4UDNiWnNuQmdJT2JRRG93Qys3SXVaWjVJS0da?=
 =?utf-8?B?dTFCMnpBWThnaUVKTzZRRUhRRXAzTkhjWXg0V3l1dmk3bmR2WkFDdGR1T3B3?=
 =?utf-8?B?OTMyTHNjb0xjNUYxbitVTnN4ZEU1c01sbWwzeHpTZk5LVXBOWVlEMjNzSUNi?=
 =?utf-8?B?amtZTTczY2xmM1dUYzltcmRHQW5aZnJURTd2UzZJWVFBTEk0bXc3K3RGaXY3?=
 =?utf-8?B?OERCS0xtTjVaNEhRQUJqREFSNThKU0V3REV0NWY0UTNSWFZZSHNTZkRDcHZ5?=
 =?utf-8?B?d0EwaGp1V0dMYy91cU1FeVVwcWx0aVRnL085U3hQd2JHQ201RXNNODRyVzlj?=
 =?utf-8?B?dzFKeFh5RHk4Ni9TdDVVNmV2cEVZNGR0NS8zVFE1ODhONXl2MUlqNkhISVQy?=
 =?utf-8?B?RkJJOFErSWFBVUtPeWt3c1FlNlVydzk2SDViUlBVcnc1c1ROYmxHSGZTMmhX?=
 =?utf-8?B?SkJTY2NzUHF1dlVINDN0alJYK1hHM0ppdXpYWWpWeWxSK2FRYm1uQXpMOW1J?=
 =?utf-8?B?a1dmRE14TWlPOFIraXVFMGJQMjJSeXE5MnA5M1EwQml6bE9MdVVuNUhObDYv?=
 =?utf-8?B?djFxdXVzWHBlSEcrK0Nsd0h5UFM4T3V3am94ZlNtZWVOZWs5RTdGRnpiblJN?=
 =?utf-8?B?dVEyUmQwM05UcHlKVW1tcEpDb29Dbk02VUdjNlhrU3JSVWZPa2RVMW5aNGNM?=
 =?utf-8?B?aGZPMmNjM3JCVzNvcXVkWU50eTRQc1NneCt2SDJWSENCOXZ5WHNMb1ZDSTBO?=
 =?utf-8?B?bEEwZWdXVyt4bXJqdjB5VkVvMmxKNVVUSXEySUxaYjhxRkFlUzBsL2oweEpK?=
 =?utf-8?B?eldIUFBTYnZQTHBzNmZ2WFRlY0NCR2k1NjFLZnVKQVJKUHJZbjBPeGVJaXph?=
 =?utf-8?B?QUdpbjdMTzBSS0U2QzVzWDJ2c2l5SXp0cGJsSHBzYlJLVkwvVmdTdHVtWG4w?=
 =?utf-8?B?YkNXZHl0U1RidW82VXFkdEhjNGNUa2VISzZla04xWGo4SlZxYUoxRFFrNTJO?=
 =?utf-8?B?b3pUczFGeUI5bnRucDMrcUZyc05FTVF2eENZVWdqd2lYQ284bm1icFdyb3Ft?=
 =?utf-8?B?eFJwczlHUmEyNDQrQzRBMW5SM2ZzVWhSZTdhejRnZGFKQ29PaVhqUHprNTYx?=
 =?utf-8?B?TnpGL0dWZkNyeE9qbjdYYlgxUWFyQnZJNGJxTDV6S0pOUEROYmFIVGk0WUx2?=
 =?utf-8?B?Z1dUL1hJOHYxcStwY0pUSHpMZEIvRUx1QjJndFFOSytHNlN0L2F1b3hSazQr?=
 =?utf-8?B?WjBmQnFkdHFDNG41NGo5YzBGYnFvOGFkcUp2NEVPaEtBcXVIQk1BK1pNWU80?=
 =?utf-8?B?RXExWjZyQklHVnllNU1mUWJtdlJFb3dBVWJXMGt2TXRKV1p3eXpQaiswNWZN?=
 =?utf-8?B?M2ZjWjVMajdYOEtVaWFnTU8wMDdLUmNRalZBWmJJeitCTWlRL0hMUnN0MUlz?=
 =?utf-8?B?SDd2TWppZjk1Vm1JbmN0SDFUVkd3TmVBbEs4bkNLWXlNR0RIL0tYWDJVUnVR?=
 =?utf-8?B?K3NqSmhaWktnYlVtQWtOUXdZRUsvYlVFVUNMY1Z0Q3E1cWpETXJQcDlMS3pW?=
 =?utf-8?B?M3NwZ0tkT2o3YUQraW9SM2pPdWsva21zU0czblZwc2dKL2ludCsxVy9wSklX?=
 =?utf-8?B?eTUxcWFmdENZMmNOc1ZjUzJpa291d3JzQUNLWHROZEtCcU9JTXdubmh2WWV3?=
 =?utf-8?B?eGNvcUswNnZIbGJ0NSs0VHZDdmp3Njl4bXhXVDVKNkthTzhWKzEzUGZRR1FK?=
 =?utf-8?B?V05xWHE2cVdRQ094b2oySDBMdnNwUnQ1Vk5ITlVVZW1MK1dvU3ZXUE5Pa1NX?=
 =?utf-8?B?c1hGSkF0cnNBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZVRrVGp6ZG5vWUs3Qk9ZTDV5ODdiSy90L0FNTEhIcHp4Ui81eVJUUXN1R3FP?=
 =?utf-8?B?RjJ1THc0UXRvdTk5aHB3NnNtQWcyK1BUa0wxRHdod1cyam4wSzNNOFI1QWpK?=
 =?utf-8?B?MDY1b285enRGU0EwaG1pREdMZFkreVVMRVlFMUd4blNYMmk1d1FKUmEwSWl6?=
 =?utf-8?B?ZnJEbWxYR3RYTWQwejBnSUZpUFlFNFJjT0dLc2tDMk0wakYxdnVtYWJEYncy?=
 =?utf-8?B?STRHdjlUU2FrWm5MaWVBT0lpOUFPeFhvY1dQbG1aOG5HeUJpYURIbVZnZ3lK?=
 =?utf-8?B?ZWYxQm9TbGc0WmVsR0hDK21KVFdoM0E5WW1qNTU1anJGcGFIRHFONDFLLzJW?=
 =?utf-8?B?aThoKzZETEZpN3ZwVGRxTHBYNUVOQjNBempTS3loS0pkb05hQklscjFRWDNP?=
 =?utf-8?B?Q2ZhVVplK1pNMmpFTE95WFRhbmxUb0FSZGdXNzZ3QkY3Z3dvdVVjVjZ2Y1ZR?=
 =?utf-8?B?ZnBXb0pqODZqeFJFQmRKMFQwcCtYTjlJV0dIanl6a2N0RWtqWUY0Z3F4M3VZ?=
 =?utf-8?B?R29kR2JWVFNaRXdES0l3by9FdXNITjZjVnpIRytudmdGQUxkU0F5a1BGeW5C?=
 =?utf-8?B?azUvREVhQWp3ejY0RVNEODhSdlNNNDFLbEF0a3FZajZvMkhXRWNTUWp1cVQy?=
 =?utf-8?B?MDJMblZScURTQUhHYWNXNkdKakZpVkNSMWQrU3JJdFBrVmsrRjhWTkp2NEN4?=
 =?utf-8?B?bEVjRU9EVStrRjNPOTZYRnlEODFTMkxIbWJSMFY5OGtzVFJONHU2S3ZTa2dK?=
 =?utf-8?B?eHMrNWZiYmhWWUV0eVorS1Rwa3k4QnRwaGNFeEFGSU9abHQ1UXFxR1pZTjI2?=
 =?utf-8?B?VWVSakt6Nm5wLzlVU0VPQVpTRnpNTWZPbHZScHMyNFZSaHFqVW1naHlnZyt3?=
 =?utf-8?B?cEd2ZXNlWC9jQm42V0k3a0JoZFJwalFUVUdmbUI5VVlSRTFuY3dVb255a3U4?=
 =?utf-8?B?Q1pOMlMvaEtVRWw3WnVpS1VSUjRSNDczUkljcXRkSFhHYm9rWjJ5SWJPT0c3?=
 =?utf-8?B?T0FCdkgycjE4cC94dTFHRVdnUHMzVWZaVGZXZ3UwRkpKakFRVkxpREpBME1j?=
 =?utf-8?B?U3hsT1FHVXg1aHNQR2pSVWJ6S0R2UkxIckZSc01rZTZkZG9xNGVWM0txbmkz?=
 =?utf-8?B?SlNRMS9IZzBHL0ZSeTZNVzliZTUyemFxelQ2U3RnRnBRVzNnWFR3K09NdjFK?=
 =?utf-8?B?Y2QySXNFbzZIeUNUVmtaYTUycmtURDdtS2lmc0xnVDFqSVBYZlVIMDNtQjdN?=
 =?utf-8?B?S0pzS3RMRXZndDBqYW80TjZmS1RoTmRxaTZkZTYxc2hnQTduUUhuUmljZXVt?=
 =?utf-8?B?ZnM4eFJQc1hNQzZpR09LZHZ4VnhhejNLaFR6eCtFK3I2SnM5TUVSUnM1SWsr?=
 =?utf-8?B?VEtxL0hodzlITEhHUm5PY0Zucm9ucWJKcEdqZG0rQUdBbm8welRZb01VODFW?=
 =?utf-8?B?dk1Geld6TXI1ZjkzQWpoRDJERkxUZi84bmh0U1hUbEt2RlUxdGRKaFh6Q2Vl?=
 =?utf-8?B?RXpEU0RmSnB4OThLT2l4MmpFWmc0RjJuZ3pCcUduaUJaME5Pa05lV2IrZzZa?=
 =?utf-8?B?U2FZay9oM1VEY0lleFFOYUFXSGFiZmZYTEEydlhPLzFCaVJaTVNPeWRNNHdK?=
 =?utf-8?B?WGxLdEJaNy9DQTg1cGczN3RBbk9TMXRqbU9iekZMdW5yRzdJOHJNbmNqaG15?=
 =?utf-8?B?NjRBL05ROE95U2VIak1IY2xkempxL1dXZTVzeCtoOWt4QlJ3UVl4bjlmWE9B?=
 =?utf-8?B?THdGYVFCMkpiT2o1QmorQXQ0bHRYRmtPN1dQaDNib1BidmU0eklrSnVrZ25p?=
 =?utf-8?B?T2tJNy91T25tZXdPRy9YOTNPN2NDR3hIVkJ6WU9ZUHZhNmc5TzArc2szSUpK?=
 =?utf-8?B?dFd4SnU3MnR1TTFSZXlwaHpuR0VHVjhDYnEySDNPOEpGM3ZWMzA0cnF5UXI4?=
 =?utf-8?B?SDJQR0dnTXk3bU1ZQjg5UFdlc0s0VGtFdjVKdzZaMUw1aThSbytHT0dTbmRC?=
 =?utf-8?B?TFYvYXRGZHlCYmZnWHRWK2EvdHZHZmVzRXhkRkNrS3F2N09ZM3p0REF4a0Nj?=
 =?utf-8?B?ZXFvd3lQRUNTRG1aTHEvWVU1RDlQVnNrcXcxc3VscXY1TGVXajdjOUJvQXhV?=
 =?utf-8?B?WGlTc3QyVXkyWGZpeExLK0Fib20xdEhQM2FOL1VRcE0yUEtoUXJESzRVZlMr?=
 =?utf-8?B?WVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F15BDCF20CA28F498A38006198DC67ED@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16f35bff-6d49-4db1-835a-08ddda3ccd51
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2025 07:41:23.1202
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SqpKlpV5hsdq6H7QSolhX4eFQZPfIaZKxp06eyGFjC8GYFqPWev+mbLgpcPS9fbCUxHj/2EenHj8nV/G7EcuLyO5iZXQqxuBQt1YduR8dZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10479

DQoNCk9uIDgvOS8yNSAwMDo0MCwgTmljb2xhIFZldHJpbmkgd3JvdGU6DQo+IFRoZSBydWxlIHN0
YXRlczogIkluaXRpYWxpemVyIGxpc3RzIHNoYWxsIG5vdCBjb250YWluIHBlcnNpc3RlbnQgc2lk
ZSBlZmZlY3RzIi4NCj4gVGhlIHNwZWNpZmljIHdheSBpbiB3aGljaCB0aGUgJ21ycycgaW5zdHJ1
Y3Rpb24gaXMgdXNlZCBkb2VzIG5vdCBsZWFkIHRvDQo+IHZpc2libGUgc2lkZSBlZmZlY3RzIGZv
ciB0aGUgc3Vycm91bmRpbmcgY29kZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE5pY29sYSBWZXRy
aW5pIDxuaWNvbGEudmV0cmluaUBidWdzZW5nLmNvbT4NCj4gLS0tDQo+IE5vdCB5ZXQgdGVzdGVk
IG9uIHRoZSBYZW4gRUNMQUlSIHJ1bm5lciwgYXMgdGhlIHN5bnRheCB1c2VkIGluIHRoZSBkZXZp
YXRpb24NCj4gaXMgb25seSBzdXBwb3J0ZWQgYWZ0ZXIgdXBkYXRpbmcgdGhlIHJ1bm5lci4NCj4g
DQo+IFdoYXQgdGhlIHRvb2wgaXMgcmVwb3J0aW5nIGlzIHRoYXQgZHVlIHRvIHRoZSAnPXInIGNv
bnN0cmFpbnQgYW5kIHRoZQ0KPiBzZW1hbnRpY3Mgb2YgdGhlIGluc3RydWN0aW9uLCB0aGVyZSBp
cyB0aGUgc2lkZSBlZmZlY3Qgb2Ygd3JpdGluZyB0byAnX3InLA0KPiBidXQgdGhpcyBpcyBub3Qg
b2JzZXJ2YWJsZSBvdXRzaWRlIHRoZSBzdG10IGV4cHIuIFRoZSBkZXZpYXRpb24gZW5kcyB1cCBi
ZWluZw0KPiBhIGJpdCB0b28gZ2VuZXJhbCBmb3IgbXkgdGFzdGUsIGJ1dCB0aGUgcmVzdHJpY3Rp
b24gb24gdGhlIGFjdHVhbCBpc3RydWN0aW9uDQo+IHNob3VsZCBiZSBlbm91Z2ggdG8gbGltaXQg
YXBwbGljYWJpbGl0eSB0byBjYXNlcyB0aGF0IGFyZSBhcmd1YWJseSBzYWZlIGluDQo+IHByYWN0
aWNlLg0KPiANCj4gQW4gYWx0ZXJuYXRpdmUgYXBwcm9hY2ggd291bGQgYmUgcmVwcmVzZW50ZWQg
Ynkgc3RhdGluZyB0aGF0IHNpZGUgZWZmZWN0cyBpbg0KPiAnUkVBRF9TWVNSRUc2NCcgYXJlIHNh
ZmUsIGJ1dCB0aGlzIGlzIG5vdCB0cnVlIGluIGdlbmVyYWwuDQo+IC0tLQ0KPiAgIGF1dG9tYXRp
b24vZWNsYWlyX2FuYWx5c2lzL0VDTEFJUi9kZXZpYXRpb25zLmVjbCB8IDQgKysrKw0KPiAgIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9hdXRvbWF0
aW9uL2VjbGFpcl9hbmFseXNpcy9FQ0xBSVIvZGV2aWF0aW9ucy5lY2wgYi9hdXRvbWF0aW9uL2Vj
bGFpcl9hbmFseXNpcy9FQ0xBSVIvZGV2aWF0aW9ucy5lY2wNCj4gaW5kZXggZWMwY2FjNzk3ZTVm
Li42YjQ5MmUzODUwNWQgMTAwNjQ0DQo+IC0tLSBhL2F1dG9tYXRpb24vZWNsYWlyX2FuYWx5c2lz
L0VDTEFJUi9kZXZpYXRpb25zLmVjbA0KPiArKysgYi9hdXRvbWF0aW9uL2VjbGFpcl9hbmFseXNp
cy9FQ0xBSVIvZGV2aWF0aW9ucy5lY2wNCj4gQEAgLTQzNyw2ICs0MzcsMTAgQEAgd3JpdGUgb3Ig
bm90Ig0KPiAgICMgU2VyaWVzIDEzDQo+ICAgIw0KPiAgIA0KPiArLWRvY19iZWdpbj0iQ29uc2lk
ZXIgdGhlIGFzbSBpbnN0cnVjdGlvbiB0byByZWFkIGFuIEFybSBzeXN0ZW0gcmVnaXN0ZXIgdG8g
aGF2ZSBubyBzaWRlIGVmZmVjdHMuIg0KPiArLWFzbV9wcm9wZXJ0aWVzKz17ImFzbShhbnkoKSkm
JmNoaWxkKHRleHQsIGFzdF9maWVsZCh2YWx1ZSxebXJzXFxzKyUwLiokKSkiLCB7bm9fc2lkZV9l
ZmZlY3R9fQ0KPiArLWRvY19lbmQNCj4gKw0KPiAgIC1kb2NfYmVnaW49IkFsbCBkZXZlbG9wZXJz
IGFuZCByZXZpZXdlcnMgY2FuIGJlIHNhZmVseSBhc3N1bWVkIHRvIGJlIHdlbGwgYXdhcmUNCj4g
ICBvZiB0aGUgc2hvcnQtY2lyY3VpdCBldmFsdWF0aW9uIHN0cmF0ZWd5IG9mIHN1Y2ggbG9naWNh
bCBvcGVyYXRvcnMuIg0KPiAgIC1jb25maWc9TUMzQTIuUjEzLjUscmVwb3J0cys9e2Rpc2FwcGxp
ZWQsImFueSgpIn0NCg0KSSB0aGluayBpdCdzIHdvcnRoIHRvIGFkZCBleGFtcGxlIG9mIG1hY3Jv
IGV4cGFuc2lvbiBpbiB0aGUgY29tbWl0IA0KZGVzY3JpcHRpb24gb3IgYXNtX3Byb3BlcnRpZXMg
ZG9jOg0KDQp1aW50NjRfdCBfcjsgYXNtIHZvbGF0aWxlKCJtcnMgICUwLCAiIlRQSURSX0VMMiIg
OiAiPXIiIChfcikpOw0KDQpUaGlzIHVzZXMgdGhlICdtcnMnIGluc3RydWN0aW9uIHRvIHJlYWQg
ZnJvbSB0aGUgVFBJRFJfRUwyIHJlZ2lzdGVyLiANCldoaWxlIHRoaXMgcmVhZCBvcGVyYXRpb24g
YWNjZXNzZXMgYSBzeXN0ZW0gcmVnaXN0ZXIsIHJlYWRpbmcgaXRzZWxmIA0KZG9lc24ndCBjYXVz
ZSBhbnkgcGVyc2lzdGVudCBzaWRlIGVmZmVjdHMsIGFzIG5vIHByb2dyYW0gc3RhdGUgaXMgbW9k
aWZpZWQuDQoNCkRteXRybw==

