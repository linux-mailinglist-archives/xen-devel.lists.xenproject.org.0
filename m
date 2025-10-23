Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 110A9C02104
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 17:19:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149285.1480959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBx54-0003lt-4l; Thu, 23 Oct 2025 15:18:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149285.1480959; Thu, 23 Oct 2025 15:18:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBx54-0003k4-0N; Thu, 23 Oct 2025 15:18:22 +0000
Received: by outflank-mailman (input) for mailman id 1149285;
 Thu, 23 Oct 2025 15:18:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5hDG=5A=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vBx52-0003jy-KF
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 15:18:20 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7dbf66d5-b023-11f0-980a-7dc792cee155;
 Thu, 23 Oct 2025 17:18:13 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by PAVPR03MB9678.eurprd03.prod.outlook.com (2603:10a6:102:318::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 15:18:09 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 15:18:08 +0000
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
X-Inumbo-ID: 7dbf66d5-b023-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rFhmhv3rPidWMFRNQKrrSL32ZMgyBu2reNaqNbbaX0eWlmj9MIarE1sk9YPB9lu4yobZHreHKshgMgUWv6q0hL4ZgyG22CdHpXXr9kqKwIkGXvTa701XEMjB4v0fhimqGR/ATQ5i4nh0EK8TF5koC4U4NovpCeq7yDAvZ3uYipdvht/7nWkTHXWagpcQb7a/6E/5RL2qLRxQ8dn+bhpWcXO1MnDWHq7y4/E+FonRSptCxZwItCSyiSaRu9+QrYd6IXZGhOjphj18RLONdkC1i7M3NcOV5F9/b+egPEZhZQkhBwoN2uXRIHHu67XkR8p6ZNBDDtL3kiJaJ4nq2c2bVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8MUb44F5n/7tiR1DwE+1zr6DgyXhJfN6Vs6OF7ubPI=;
 b=UQz756Sp41B2Zt40FQlf4m50ROHy6a3xCwstXV+6qzEAfQ3/T4LGmIrDPEuWatCa9SabRvYLCHMeqxb1xqKsymczazqglu654cKOOYz9DTFvyGPSoFqplZsu/Wl4qNuDfG7QqPVUznhee/l5k2NrqDRalZbXzKP9aFf+jIJvnftDwMknQl0QqizldQjVKn4nuZaH0BiTtUFerAR1zrM4xBH4VCDeWRP7C3H2+arxl1MJuIca7Wi9PbgCjzY/vI0OmmFzxLNim2RFxi7QlpCAKJDpYLxZ/u1KRBE1cg9IOrNhDngplmGqyLEiptIK9jtoFnyeWI1SLqBZeCbOSTLg0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8MUb44F5n/7tiR1DwE+1zr6DgyXhJfN6Vs6OF7ubPI=;
 b=e5xZIRqvAvTdxSUAxU+fFlZ42lkJ6eNcx82ro2NUhvxygcuW24dc2VNAdYhMrupyZU4JvdiexLj3vSF3F7bzToj0XSELpPsc7RU2frevV7gAn2NxNOJ/qH2q+bWsqdhsDNc17c4n0UYboJvHP7dctEeSeykZ2kLvDcac6qFRvgoAvwk5hQcTmmMAIqurOj+q9Tpv53rPWeO5Ht+CsJ1gS8egB1hQFHjFAkmWcpEklel3uY6n8D1z7DxK1pexjXfPqNrAXM5VR579t1dKL3Tsx+Iuue6V3ylzsdRX7uMD1J9VLj5pyZdcfcbC+buYEZhY0mn9mqQ3I/rHeoJP/DzS3g==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Paul Durrant <paul@xen.org>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [XEN][PATCH v5] x86: make Viridian support optional
Thread-Topic: [XEN][PATCH v5] x86: make Viridian support optional
Thread-Index: AQHcRDA9CIdNzsbPp0OC3kg4wBoldQ==
Date: Thu, 23 Oct 2025 15:18:08 +0000
Message-ID: <20251023151807.560843-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|PAVPR03MB9678:EE_
x-ms-office365-filtering-correlation-id: b0115747-0fd8-4442-3fb2-08de12475f8e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?mXWwcI4IKIxLi/R8QkqNgS4DUbuz5Yy7KBqof+c8rIEnWkurVWYGUwHDxT?=
 =?iso-8859-1?Q?B8WoWhevUUUv6lLYPI+YwYNSTQEYECsiZ3vaCpQrPYrNyCxsfJ3zIRZzuH?=
 =?iso-8859-1?Q?ldLNVZ8aUw3pmyXSV2vSg7zZtkF+weCCRQ+dYYHz6DGbQcz0ikmwLH84LH?=
 =?iso-8859-1?Q?S5hpOnJgqCFfZ7howw5nXIjX/1NTsx7k1ZBMkQA4AR38DVtc4OUfoyLrla?=
 =?iso-8859-1?Q?H+N2fqpLSFADbRCwv4ihasUWaz2Cv2xCRR+0ZkwnFVjhfckx/+fcVqad82?=
 =?iso-8859-1?Q?k9kzaVR2Yi3TgjxvOo5gm/uL2UTFWwGcxtpvPx/iL3lyM3bhU4Kgbsf5Ps?=
 =?iso-8859-1?Q?RbxS3GItuqgi3XECRZTFrk6qC7ts9hkIwCdE3jgZV4xy+V2yOAd9gZLKxI?=
 =?iso-8859-1?Q?CWvb2qyYFJuqGiAEQK9zlIV7Ok2w7zTfom4ay0D6fZeGxmD29k2mEFeJsL?=
 =?iso-8859-1?Q?bS9NMPwYv2tQFwGXJuqX9s3oxSsbNlcfiD41lQUoX12E+c8duTAAaBpxId?=
 =?iso-8859-1?Q?l42509s55Dt5ioBFPtA7c0co+OUccGfmDTZ17Am6pnph1yok0ZlWcOsJKT?=
 =?iso-8859-1?Q?izra+s0BbgrSoLtsw0JI/T9c0s72/3zfhOP/Tlj32ew38IVBjn93rfLJVt?=
 =?iso-8859-1?Q?+7IUb4xv5MoWlxiiNWSym5UpflW/3DhfrjBDk7U6lAYeVAsdO8U3PjiUEr?=
 =?iso-8859-1?Q?maPGw+eRSjHKDQsjhmFINhe+KAF+LS6eMJtFGaegdEUlqMFkLPpgPEPHpM?=
 =?iso-8859-1?Q?2Flr2h39gHLNG3w6YFbzjt1jsWpAMbowUqzHbOnb9jvEOezt4JtFDZprUx?=
 =?iso-8859-1?Q?Av29tZg2nKhI595otFgvlmtGUmRSEr34Y4ZXxGDVHvW3sS8xwjuYwDJG21?=
 =?iso-8859-1?Q?6gsd9kFXrYruxxNSyQzTilo2tg86ptrmvhHXirlMEWuMFd9MQjwvUnbB2f?=
 =?iso-8859-1?Q?XPZG0GgnhIDmSNYWamQY8Hvp1EZ8nx91yN3Q6lBqsST0Xv1mSHW9sR3qoJ?=
 =?iso-8859-1?Q?7aRq2SM5RagohJDoznbfZbj/gFr7GYTlJa7UHT6rvjx0lrExQ0/nHbWnlC?=
 =?iso-8859-1?Q?tyRi5OAJ39aTZx5QR43uBb/CxMjqiShJnIxezrrtDMZJVHiZFSAvxT1Atg?=
 =?iso-8859-1?Q?E/T+T3zsSM/iY7ICqEQYY74w5Bnigus/gHkC3Vda8RReTOJKh9WT3LIb7l?=
 =?iso-8859-1?Q?/uzOM5ldc89H2m/6Yv6MiTx1DM+1kqorLR/yxbj0VPpL7uua8o32qiJGxl?=
 =?iso-8859-1?Q?in9OT8WD0y/CJfORrZPoEbJuxXR7aooQ9Q/zKRQMBjLHj87+9HqcE/R772?=
 =?iso-8859-1?Q?MXbIa03ZmnFZYuHxxsZr45t60CDylOqht5G0P16PZDEkXyY0sQH/JWzfPQ?=
 =?iso-8859-1?Q?UAVc48Nl+avgr+o7sPJKbhqr6wYi7CYwiUdwwBGnT84nNXvjBQBHLdiXY0?=
 =?iso-8859-1?Q?r/X86EekmwGgkccMjx6ZzNvxSGQNVmYZ54vgdfRvgodfNbdBAjKLt8YXO1?=
 =?iso-8859-1?Q?3yoemzZhK40vjdbelDKyTYug2yGn2jOVDgNAO7bSGHT62uo/zEHOtTjqWD?=
 =?iso-8859-1?Q?qMBS7WySMLX20u1N8WD9n7O6p3F8?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?TstorkvqJFBDF8xsklNSO8LyuhP+gcS627t51fmCHQ9LAI9qJduqt9/XkD?=
 =?iso-8859-1?Q?z88WDbhIb2d6liMSE22M+K8oJD6rBzF54DCSTUiAjhNKFBeOTi6imBYHmN?=
 =?iso-8859-1?Q?cDPXV6SINjb3FlasNPi3Ac2UIwQdUymIr9T0Rx9JnrOKfYOgKaKMDoKIRS?=
 =?iso-8859-1?Q?pKP7e4DmxCkQqiMwP/PLV4Lmp1hCKk8Z7XIoCqedCeO7DFduKz1rfBwIAw?=
 =?iso-8859-1?Q?WvFCPV5T4+C1Ywsrr14nehz5u+3rw57JMKNF8BPqifELlzeGJqJmRb6oVM?=
 =?iso-8859-1?Q?4iumdG5cnlmTkpGZcHLX+UTy5GkNkjQaKi8yHwuvttX0KljvR7aCWvImtd?=
 =?iso-8859-1?Q?VbQFZZlOZhyj7Vijg/lmTYTrurL7VNDEIDfuUizQvDMVgnPsc9LgeDfk4i?=
 =?iso-8859-1?Q?ej7JGPK9ur7KKcQZNR31BtIyqgSPtYVnuUgLQGZPGupWbhXsjtiHD5+Bhz?=
 =?iso-8859-1?Q?pHjA+iaQbEQJOcaJd3nQoxfL0Kao8I2mgpyR6Cq/lqdN16e1K3ercE4pUN?=
 =?iso-8859-1?Q?FUpbUpk9G5qipT7TUSMkRk7NprEBppP8kw7ZE5TrrfAd8eZHg0tDQMp+jc?=
 =?iso-8859-1?Q?9BykRgHAEyF5aPG1+jpEJ+t9d60d31chraI4TgvQSPhDvcc5UX77amfovv?=
 =?iso-8859-1?Q?iZ2y5E+0m3OlJeNlkV5EnBJ7FAa68pO9vYWFGBq3BUiho0rXM6d4yRm2Kk?=
 =?iso-8859-1?Q?Fc12EFCu/myjdgjVuLE9oYrotfJRQkvqJp0FXZbv+URG9V6eYWTcyzz2Wu?=
 =?iso-8859-1?Q?XIgaojeQo0+6Qgju/ViJAsrw0+tRYZBS/hctZYwMUm7Sm1+w5iVzjixdVI?=
 =?iso-8859-1?Q?cgql0yW1Fh3S9jmnAZapuiCh33hntsOkO8eln4shzm3u55QUPBr/FjaU7F?=
 =?iso-8859-1?Q?3VBbHDO0Q4s/nOT6oXVx6y7BUkKtQ9LqKWNN7vYawmB4wxt4lPvyAP1Ubt?=
 =?iso-8859-1?Q?Daz0NFRAbHWO8sQCN8J2MbV5Q1603/XgFXyHgGX8lCXO7Syf9DC+mxBVaL?=
 =?iso-8859-1?Q?RBuQoeMs0+DpKmJ4mDIengnefszLabmy8l1znH6sVmb/ES81qdmhytmHMQ?=
 =?iso-8859-1?Q?RRDi1f54O3lAMwfqeysYa8qAB7QwwLyExqnWBXJWybYA3ppplLKcrgnV47?=
 =?iso-8859-1?Q?4XKmyM21ZUjGx5U0iNRQLKkT5gr7I//K29WX8Hi4B6yEWepn1TaaxgEmk2?=
 =?iso-8859-1?Q?we4Ut6kk6Hm0T0Ntkv+fbZIf+oEkZUCQWgX9TGRNX9VYQFHC/P+C4RwrQJ?=
 =?iso-8859-1?Q?8pQ67SiMzbSr+EVSs1/Ij1ZeKQUFxGFjJU3th9eAB3uMziMnGNsD25B8Vw?=
 =?iso-8859-1?Q?IwWFDbdVRYbTZEdrNt3MEZ1p2FWnIyS+V+peMfM1YfTDMcyI3HpfxZf7ik?=
 =?iso-8859-1?Q?W3kI986uAcXaJnXhtMkHzLB2UsUR79bTQyTIVD3A04ck29P7zH0mnT54Ll?=
 =?iso-8859-1?Q?m4ZIbVh8bLoemUq9Vmnk9AK7CfOPKi7tlZNldyjZAUjhhTgVrRLDI8Fqbq?=
 =?iso-8859-1?Q?/T7n5ISkV+6+4/jiRmgcZHjGqtpJcUfgkdLf50fvRhOp+P/n+cAJJZfZWe?=
 =?iso-8859-1?Q?lnJnpEhYP57uU7/aXVLzN5X90Jf7FQCskx+PxduC4UhMvtPWzH6nIXoGgh?=
 =?iso-8859-1?Q?gD1fVZDVRqRHfkszUk6Hra99O19O3By8NUtFxP7KLmW2CdNHbUTy6Cng?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0115747-0fd8-4442-3fb2-08de12475f8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2025 15:18:08.8108
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9rPoR/i7oBUv6tM24IGSxCwXqcru8UogylrgGi7IPrhwBgXPGx0pfCYS/y2QSmMTGqrFf5Ytr6LMX/F7Jtrh0Ir/XRdgxPtAU7HP6dWFpD0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9678

From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

Add config option VIRIDIAN that covers viridian code within HVM.
Calls to viridian functions guarded by is_viridian_domain() and related mac=
ros.
Having this option may be beneficial by reducing code footprint for systems
that are not using Hyper-V.

[grygorii_strashko@epam.com: fixed NULL pointer deref in
viridian_save_domain_ctxt(); stub viridian_vcpu/domain_init/deinit()]
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
changes in v6:
- add stubs for viridian_vcpu/domain_init/deinit()
- update Kconfig description
- make set(HVM_PARAM_VIRIDIAN) return -ENODEV
  if (!IS_ENABLED(CONFIG_VIRIDIAN) && value)

changes in v5:
- drop "depends on AMD_SVM || INTEL_VMX"
- return -EILSEQ from viridian_load_x() if !VIRIDIAN

changes in v4:
- s/HVM_VIRIDIAN/VIRIDIAN
- add "depends on AMD_SVM || INTEL_VMX"
- add guard !is_viridian_vcpu() checks in viridian_load_vcpu_ctxt/viridian_=
load_domain_ctxt

changes in v3:
- fixed NULL pointer deref in viridian_save_domain_ctxt() reported for v2,
  which caused v2 revert by commit 1fffcf10cd71 ("Revert "x86: make Viridia=
n
  support optional"")

v5: https://patchwork.kernel.org/project/xen-devel/patch/20250930125215.108=
7214-1-grygorii_strashko@epam.com/
v4: https://patchwork.kernel.org/project/xen-devel/patch/20250919163139.282=
1531-1-grygorii_strashko@epam.com/
v3: https://patchwork.kernel.org/project/xen-devel/patch/20250916134114.221=
4104-1-grygorii_strashko@epam.com/
v2: https://patchwork.kernel.org/project/xen-devel/patch/20250321092633.398=
2645-1-Sergiy_Kibrik@epam.com/

 xen/arch/x86/hvm/Kconfig                | 10 ++++++++++
 xen/arch/x86/hvm/Makefile               |  2 +-
 xen/arch/x86/hvm/hvm.c                  |  5 +++--
 xen/arch/x86/hvm/viridian/viridian.c    | 14 ++++++++++----
 xen/arch/x86/hvm/vlapic.c               | 11 +++++++----
 xen/arch/x86/include/asm/hvm/domain.h   |  2 ++
 xen/arch/x86/include/asm/hvm/hvm.h      |  3 ++-
 xen/arch/x86/include/asm/hvm/vcpu.h     |  2 ++
 xen/arch/x86/include/asm/hvm/viridian.h | 15 +++++++++++++++
 9 files changed, 52 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
index f223104be03c..625262f97f43 100644
--- a/xen/arch/x86/hvm/Kconfig
+++ b/xen/arch/x86/hvm/Kconfig
@@ -62,6 +62,16 @@ config ALTP2M
=20
 	  If unsure, stay with defaults.
=20
+config VIRIDIAN
+	bool "Hyper-V enlightenments for guests" if EXPERT
+	default y
+	help
+	  Support optimizations for Hyper-V guests such as hypercalls, efficient
+	  timers and interrupt handling. This is to improve performance and
+	  compatibility of Windows VMs.
+
+	  If unsure, say Y.
+
 config MEM_PAGING
 	bool "Xen memory paging support (UNSUPPORTED)" if UNSUPPORTED
 	depends on VM_EVENT
diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
index 6ec2c8f2db56..736eb3f966e9 100644
--- a/xen/arch/x86/hvm/Makefile
+++ b/xen/arch/x86/hvm/Makefile
@@ -1,6 +1,6 @@
 obj-$(CONFIG_AMD_SVM) +=3D svm/
 obj-$(CONFIG_INTEL_VMX) +=3D vmx/
-obj-y +=3D viridian/
+obj-$(CONFIG_VIRIDIAN) +=3D viridian/
=20
 obj-y +=3D asid.o
 obj-y +=3D dm.o
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 3a30404d9940..6e0460984c09 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -4292,8 +4292,9 @@ static int hvm_set_param(struct domain *d, uint32_t i=
ndex, uint64_t value)
             rc =3D -EINVAL;
         break;
     case HVM_PARAM_VIRIDIAN:
-        if ( (value & ~HVMPV_feature_mask) ||
-             !(value & HVMPV_base_freq) )
+        if ( !IS_ENABLED(CONFIG_VIRIDIAN) && value )
+            rc =3D -ENODEV;
+        else if ( (value & ~HVMPV_feature_mask) || !(value & HVMPV_base_fr=
eq) )
             rc =3D -EINVAL;
         break;
     case HVM_PARAM_IDENT_PT:
diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridi=
an/viridian.c
index f79cffcb3767..b935803700fd 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -1097,14 +1097,14 @@ static int cf_check viridian_save_domain_ctxt(
 {
     const struct domain *d =3D v->domain;
     const struct viridian_domain *vd =3D d->arch.hvm.viridian;
-    struct hvm_viridian_domain_context ctxt =3D {
-        .hypercall_gpa =3D vd->hypercall_gpa.raw,
-        .guest_os_id =3D vd->guest_os_id.raw,
-    };
+    struct hvm_viridian_domain_context ctxt =3D {};
=20
     if ( !is_viridian_domain(d) )
         return 0;
=20
+    ctxt.hypercall_gpa =3D vd->hypercall_gpa.raw;
+    ctxt.guest_os_id =3D vd->guest_os_id.raw,
+
     viridian_time_save_domain_ctxt(d, &ctxt);
     viridian_synic_save_domain_ctxt(d, &ctxt);
=20
@@ -1117,6 +1117,9 @@ static int cf_check viridian_load_domain_ctxt(
     struct viridian_domain *vd =3D d->arch.hvm.viridian;
     struct hvm_viridian_domain_context ctxt;
=20
+    if ( !is_viridian_domain(d) )
+        return -EILSEQ;
+
     if ( hvm_load_entry_zeroextend(VIRIDIAN_DOMAIN, h, &ctxt) !=3D 0 )
         return -EINVAL;
=20
@@ -1153,6 +1156,9 @@ static int cf_check viridian_load_vcpu_ctxt(
     struct vcpu *v;
     struct hvm_viridian_vcpu_context ctxt;
=20
+    if ( !is_viridian_domain(d) )
+        return -EILSEQ;
+
     if ( vcpuid >=3D d->max_vcpus || (v =3D d->vcpu[vcpuid]) =3D=3D NULL )
     {
         dprintk(XENLOG_G_ERR, "HVM restore: dom%d has no vcpu%u\n",
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 4121285daef8..b315e56d3f18 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -447,7 +447,8 @@ void vlapic_EOI_set(struct vlapic *vlapic)
      * priority vector and then recurse to handle the lower priority
      * vector.
      */
-    bool missed_eoi =3D viridian_apic_assist_completed(v);
+    bool missed_eoi =3D has_viridian_apic_assist(v->domain) &&
+                      viridian_apic_assist_completed(v);
     int vector;
=20
  again:
@@ -463,7 +464,7 @@ void vlapic_EOI_set(struct vlapic *vlapic)
      * NOTE: It is harmless to call viridian_apic_assist_clear() on a
      *       recursion, even though it is not necessary.
      */
-    if ( !missed_eoi )
+    if ( has_viridian_apic_assist(v->domain) && !missed_eoi )
         viridian_apic_assist_clear(v);
=20
     vlapic_clear_vector(vector, &vlapic->regs->data[APIC_ISR]);
@@ -1375,7 +1376,8 @@ int vlapic_has_pending_irq(struct vcpu *v)
      * If so, we need to emulate the EOI here before comparing ISR
      * with IRR.
      */
-    if ( viridian_apic_assist_completed(v) )
+    if ( has_viridian_apic_assist(v->domain) &&
+         viridian_apic_assist_completed(v) )
         vlapic_EOI_set(vlapic);
=20
     isr =3D vlapic_find_highest_isr(vlapic);
@@ -1388,7 +1390,8 @@ int vlapic_has_pending_irq(struct vcpu *v)
     if ( isr >=3D 0 &&
          (irr & 0xf0) <=3D (isr & 0xf0) )
     {
-        viridian_apic_assist_clear(v);
+        if ( has_viridian_apic_assist(v->domain) )
+            viridian_apic_assist_clear(v);
         return -1;
     }
=20
diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/a=
sm/hvm/domain.h
index 333501d5f2ac..95d9336a28f0 100644
--- a/xen/arch/x86/include/asm/hvm/domain.h
+++ b/xen/arch/x86/include/asm/hvm/domain.h
@@ -111,7 +111,9 @@ struct hvm_domain {
     /* hypervisor intercepted msix table */
     struct list_head       msixtbl_list;
=20
+#ifdef CONFIG_VIRIDIAN
     struct viridian_domain *viridian;
+#endif
=20
     /*
      * TSC value that VCPUs use to calculate their tsc_offset value.
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/=
hvm/hvm.h
index 838ad5b59eb0..6f174ef658f1 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -509,7 +509,8 @@ hvm_get_cpl(struct vcpu *v)
     (has_hvm_params(d) ? (d)->arch.hvm.params[HVM_PARAM_VIRIDIAN] : 0)
=20
 #define is_viridian_domain(d) \
-    (is_hvm_domain(d) && (viridian_feature_mask(d) & HVMPV_base_freq))
+    (IS_ENABLED(CONFIG_VIRIDIAN) && \
+     is_hvm_domain(d) && (viridian_feature_mask(d) & HVMPV_base_freq))
=20
 #define is_viridian_vcpu(v) \
     is_viridian_domain((v)->domain)
diff --git a/xen/arch/x86/include/asm/hvm/vcpu.h b/xen/arch/x86/include/asm=
/hvm/vcpu.h
index 924af890c5b2..9ed9eaff3bc5 100644
--- a/xen/arch/x86/include/asm/hvm/vcpu.h
+++ b/xen/arch/x86/include/asm/hvm/vcpu.h
@@ -176,7 +176,9 @@ struct hvm_vcpu {
     /* Pending hw/sw interrupt (.vector =3D -1 means nothing pending). */
     struct x86_event     inject_event;
=20
+#ifdef CONFIG_VIRIDIAN
     struct viridian_vcpu *viridian;
+#endif
 };
=20
 #endif /* __ASM_X86_HVM_VCPU_H__ */
diff --git a/xen/arch/x86/include/asm/hvm/viridian.h b/xen/arch/x86/include=
/asm/hvm/viridian.h
index 47c9d13841ac..07ea95d4ae6e 100644
--- a/xen/arch/x86/include/asm/hvm/viridian.h
+++ b/xen/arch/x86/include/asm/hvm/viridian.h
@@ -86,11 +86,26 @@ viridian_hypercall(struct cpu_user_regs *regs);
 void viridian_time_domain_freeze(const struct domain *d);
 void viridian_time_domain_thaw(const struct domain *d);
=20
+#if defined(CONFIG_VIRIDIAN)
 int viridian_vcpu_init(struct vcpu *v);
 int viridian_domain_init(struct domain *d);
=20
 void viridian_vcpu_deinit(struct vcpu *v);
 void viridian_domain_deinit(struct domain *d);
+#else
+static inline int viridian_vcpu_init(struct vcpu *v)
+{
+    return 0;
+}
+
+static inline int viridian_domain_init(struct domain *d)
+{
+    return 0;
+}
+
+static inline void viridian_vcpu_deinit(struct vcpu *v) {}
+static inline void viridian_domain_deinit(struct domain *d) {}
+#endif
=20
 void viridian_apic_assist_set(const struct vcpu *v);
 bool viridian_apic_assist_completed(const struct vcpu *v);
--=20
2.34.1

