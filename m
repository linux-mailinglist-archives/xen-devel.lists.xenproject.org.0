Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 488D1C70DCA
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 20:42:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166441.1492978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLo45-0007zN-4L; Wed, 19 Nov 2025 19:42:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166441.1492978; Wed, 19 Nov 2025 19:42:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLo45-0007xU-0C; Wed, 19 Nov 2025 19:42:05 +0000
Received: by outflank-mailman (input) for mailman id 1166441;
 Wed, 19 Nov 2025 19:42:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GacY=53=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vLnud-0003Xw-MA
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 19:32:19 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7644e273-c57e-11f0-9d18-b5c5bf9af7f9;
 Wed, 19 Nov 2025 20:32:19 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by AM9PR03MB7012.eurprd03.prod.outlook.com (2603:10a6:20b:2d4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 19:32:16 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%4]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 19:32:16 +0000
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
X-Inumbo-ID: 7644e273-c57e-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q1qoCP6mIbLpMm0dygnwZ9RqboUcVFy8BmN96/fEUN8veP8hJKS+ZZtowOubz/1GOjxHI4qh4Clxu+N+mcirl5fVB3pg3C4aQfx1eSuYTBhIaFN7qEg7OYc2CEsWCKRjE9ssgLjtRqC6DDgD8HuXZ9eeolafTvTUKkpc2ARRp2jzzTo/8OtlXaRhyVim1BERme1fn209JrpWQPqXFwVsgZLIW1jLKzxsLiHBV7P6K+R1iauTH5rMuTnp0ShaMDmmst5+Ud2mm8hDZCLrxR37KUNgX82wlFCKnEZcD1fdzCH10Juh26kkWKF1NNMy/MSnZl44+rvLZzALE0fbwgsHAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AaBBvL45GWZve+KtHwXvB/y5MwarwU/6KhVE6kHGKhk=;
 b=w1wDdwuQpylIRGBe5UDbRnHiE3HOxk7FwMsvXh1ce7lQEtodoa0zTHSj8f4yB5s9MlhhKrml52GhSnNP5f74DdyM/SiQp9hY5FucEktK5fwFXxfndZ8+zy/Li7w3qXtMCTFXKaTiEGilfTExCV+4WfkiVeYPBRwRQ5Icyy+gGwGukQ5chrCpNKlMmF3is2BSGNHyujvpkory8NUZLNLLsvjzHtmBHQ692SCaxJbvV/7EtnbFZ/zlF2fYIecLC6cTf+WT1BBWP5Qwfl2PbVH1t2V5w7bxGzJ07WL4V1+i89f0RZiYceOCEF6p2mKe5vQMrAwzs7Ze8cxxc/hD1ClTvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaBBvL45GWZve+KtHwXvB/y5MwarwU/6KhVE6kHGKhk=;
 b=GPcQkZ/6dTn/q3tligg8wjU8l1vx23Kv2o7xNjyj/6Pya20l08xV8Rd6CcJdxhPTqw1WPImf3F8b7Aya38TtzVdMGFZ2TQWBTR2jDLFHiOpXERqhDjJrGzezVbyHUSOgGm8LZH32Or0YvnVIrgB48m6CUbKttZnJ28es4A4gLCkBZ0b1AEWZ6Hqzm7eheZJScAxgqX+nEomICA8ufv7+Ivu5ZByAj8Qpg+rpjxUs5s7R30QlM0r9EQIhlJlk01bKmppIoGDKpx625v4N8B5KbcO/MChRer03jcPGcKJqYoFyqiGyF/TqhCtqGttZf435EyOnUATSHPCLgwUnmPx6dw==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Paul Durrant <paul@xen.org>, Alejandro Vallejo
	<alejandro.garciavallejo@amd.com>, Jason Andryuk <jason.andryuk@amd.com>,
	Grygorii Strashko <grygorii_strashko@epam.com>
Subject: [XEN][PATCH] x86: make Viridian support optional
Thread-Topic: [XEN][PATCH] x86: make Viridian support optional
Thread-Index: AQHcWYs2Y218dBKOy0uhfhyo74AxFw==
Date: Wed, 19 Nov 2025 19:32:16 +0000
Message-ID: <20251119193215.1012108-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR03MB4594:EE_|AM9PR03MB7012:EE_
x-ms-office365-filtering-correlation-id: 339787f2-983e-4418-476f-08de27a2590b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?TjjRFNmIzls3hOgqTWCBiOm6pTRlzRs7HjxjB8jJnkPLrVTUr/Ri1OPQvz?=
 =?iso-8859-1?Q?SMBQWKyjXA1jPmDfMGG5iLUZ8hktydwa/zRoDDA82pDU5LBvh98iJxmMqt?=
 =?iso-8859-1?Q?OA6s1XWSef/P2aH59MSPyIE5UubhU5OMIn0lpoQ85lmTof6s6oPXXIFr7V?=
 =?iso-8859-1?Q?KZ5qJSjwP2X98zACAleT0YgE+zKAZ1pyoY9wmxkgJip1jbn2zIRToEbSOT?=
 =?iso-8859-1?Q?OIYjDVMXmHa27QMVwM6ZLP4PRxMlRel578UAzf3RxsEM5nx6NhaJ7+pm6A?=
 =?iso-8859-1?Q?8jhjRY9mfRF39FloILcuK7gcdgsAR3qP3wvsqUWHmduDJdS0hpTX/55/XW?=
 =?iso-8859-1?Q?ykjF9XR7hq9ZTZInk9Ifd4JP0iUCwVA+dxXw11FkfZLh+SIZMN7p1DI8CY?=
 =?iso-8859-1?Q?M72YrXQbm/+giMenU1qxY+1sIarYNv+wCPeIGozQ9pp92ezLXCXBLORq6W?=
 =?iso-8859-1?Q?xE9cmcTwFb0QpKp1tUmo/EwcHCD+KVwsmypxT86ynVaPS/zNeaxbHlZLcp?=
 =?iso-8859-1?Q?uvEL7YDvRizaGKgRq7GParmy8/kyPu5mNMMj085PLdylfPJln5NuTLP4/i?=
 =?iso-8859-1?Q?/s2xlrabr6O0shSvRxsansiw9GRlXqjHh3vV9msgeHTkl4jfw9hY2RPVQI?=
 =?iso-8859-1?Q?RFDza+GsJN6tdnSnngxgNLpRNtkm+vmrD1igWMGdTHHKOYI2ckAnkq8uvH?=
 =?iso-8859-1?Q?OAeOl9yQCfLdZyqYs9KRFXcYOVx9MvWTRIqwYOk0qKBNoh9l3NcmSPNiFM?=
 =?iso-8859-1?Q?HY4H8cGsDtk0N/L6n4mIp0s5nRur75Je81bUkoraU+1994DIW90BkIjDDW?=
 =?iso-8859-1?Q?IcGT2OfoFI1iEuWPOqxVIL4vIfKiCCbzCkup9HOTWU1BIl9vgVv/2cRXsM?=
 =?iso-8859-1?Q?LBGJ5HvwCEAQ++SDbeCHoG9JZ/h6UrBfidD8IEQUlrGiZWTGwrHtNTf6LS?=
 =?iso-8859-1?Q?8EZWt8dHCyDv/BmFV3D5hG/hiMMzPPfMZEImdx33ZviblCt2LK22CYPzV+?=
 =?iso-8859-1?Q?ga15cVvXecA/jqQMD9rwKnqhB86HRuRQ1wXAj2uEiYdGbDbja1T6X1AwCa?=
 =?iso-8859-1?Q?UOXs7Gzpi9DggNWoY6NQnhDzzbpjbqL0wiIm4a7+NhWp++zvjpkv8FHmNi?=
 =?iso-8859-1?Q?x04toA1IOMGKA1ulkK74zQcOobsyz43PJwkl4BlE4omehowSP9vAHtWcvr?=
 =?iso-8859-1?Q?WjBbN1WYBk7rkEPSjOKz6im8flqOcFpxujfAxdfc8tthYN88RFQmxsZSfk?=
 =?iso-8859-1?Q?ip4VhysT+JFtyT8oicZW7E7/iBNKjF4CBHG+N+g097uBKrlhpYY5HC3tiE?=
 =?iso-8859-1?Q?yDTON8knObfQsYJM3UrI2+twsDTPmjjlUQ3V9MqF+C4w+dpiIGgTQjC9pQ?=
 =?iso-8859-1?Q?pCfja4zYaA21IE4c64p6/HENN1yTXgPGcOJPZWYqV4U+0B/3pEZFApb0QG?=
 =?iso-8859-1?Q?dSNOxeokA7p1vq0iW4u3xrvqK9mIp4sf68HrB2e3esUNVyrtX6C8l/bkNt?=
 =?iso-8859-1?Q?NufRm8qyw9FaLk32gULbW2M2gWp025PMAW5azbJyLJlW0tfPbmJsn0lB6W?=
 =?iso-8859-1?Q?UN49i9jwC5vBTU3DVsQAlKcxhq5c?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?bth3p3vpd1SGaMdrwn+cqmzytjelYEL8S0Q08IETYJJ7cKrPFaStW98Piy?=
 =?iso-8859-1?Q?CLHkEWUod+JZWjv7u6oYAHdNJL6GhI5hv1PK2dVM7+VdWQWizL3itjVFu7?=
 =?iso-8859-1?Q?rVzydSPo8fG9cgbfx9+v2/QoEjZDKU5mBAFipMAY68H/fNJc5caoeON7J/?=
 =?iso-8859-1?Q?zmyGs6JXsxhA7fttmHRGcYYBJFHpZ7b5UmbgE9gwtCVgcN/N6H9xP9N2+3?=
 =?iso-8859-1?Q?bt1+Gb8W4n349vOVI4Ej8FR0vrhV4ZBNPM84/CnzZ4x9fu6ghj9EdolheJ?=
 =?iso-8859-1?Q?OG9s7lpDuFFD+JQia0CsZq0LY8bpIefhdcXoq7jLb44JcGDI38cA4eJDco?=
 =?iso-8859-1?Q?Y7haHBnpmEUfZZOikjslz0uahtzUHIG53pd0P9ozDeioPwPhFfFTls4wl0?=
 =?iso-8859-1?Q?iTGKWKxEhRze2vLaKZYtJuNVNWWGdX2+rwmulm+rbsBntA7pzELtPLpOde?=
 =?iso-8859-1?Q?gNalKleM21QUJiSqhAmRvNqJmL6CJKgWhpHTEyak0rzS9AWxgbCf3LdWKs?=
 =?iso-8859-1?Q?AcQzaz+k0UHT2+qSgQ7X4pO4iaiznb/nnUnZ+JriHC2ym83LrqNqa5FdiM?=
 =?iso-8859-1?Q?gU4UzTOHRqnMco7ybblYdk6dl6afFV4bk5UVdPybTa8VQRRq3iJmGfopLo?=
 =?iso-8859-1?Q?pBUo4MPAXlSdWZUhYJcglqh9U5rCUveOK+OB8yC3ZICPhbQaJqn3IghQpu?=
 =?iso-8859-1?Q?E7lrSva+sYR3KiHYaGI3uOLyamnt3vcujzoL9KzJvS/3m/IdknvklxXB2o?=
 =?iso-8859-1?Q?zwsm4FlAlFOq4vADTmubPSbOJeEkZWSrcdFySkFMlkC2ndEWsuHVTHDxvy?=
 =?iso-8859-1?Q?Q4BtDrowC74ZY21bYOi74CfgxeFx4MTrpuzX9qZdcusJdgP5FVfJeDnjDK?=
 =?iso-8859-1?Q?iHMCIrfD/T9wVE4OLqZKaWq+WtsnAorku4LPLdAchy+1h4fRZqIIC+BZp5?=
 =?iso-8859-1?Q?eHQHvAHvFBH0jcxVofvvcfEd2kB93mF9P6W5Rb1yLDSaUE0+a5fcqeSNBZ?=
 =?iso-8859-1?Q?k6DUAo7vklqWBjmmneW4/y01z84h3ykQoz1R/a+61vykgLbWVHI0aBHRY2?=
 =?iso-8859-1?Q?y32E2ivSHb57qvZrZUCFWTvEBs5DLh9/tgrENESZkspl+LVJQqumbJ9O8Z?=
 =?iso-8859-1?Q?cFebMu+Xu7uiF7rmTGZ5tEdwoc+TuKSQlO4+RqnMGDgFZZOSeMfbtJ5ztJ?=
 =?iso-8859-1?Q?q2DX1L0DAdm3RNvZDH9SBPpD82bOjO3g0zv9qq0SeripzupGJAMNpOLU56?=
 =?iso-8859-1?Q?N/0fEHwX7nkhj0P2mRN4Fm/6vxvviG1Z8tIlYB1n6SFNG3ryk3MXnVErWj?=
 =?iso-8859-1?Q?YnqGPzKARQuhhskatNHDXo3Uo+RasKuLJYrOVFWAhaY9IcQNaVZipCzvX7?=
 =?iso-8859-1?Q?zzq8J28cxJPAHKhVyyg+OKU/MLMHNLmYt4VGAebHZpdVSotQBRYOdRGGH0?=
 =?iso-8859-1?Q?OwID74ktMAZJGq6tEtjAKJ+7d0xo4/9zqsLMEsblU8NTNcxa0UDWjTF4jB?=
 =?iso-8859-1?Q?2jLl18gyuYKCUqjiqC/V1jnrq+LHMIBQGc43EQ0cSG0KDl1EF12Ak0COva?=
 =?iso-8859-1?Q?r8Rvvu4YRgzSSjhrNqthwBPrSuIJ4boMR7dS2ULf6CrdVWo+jB5HwirKls?=
 =?iso-8859-1?Q?bmdABrvnd5+PiEmxGgg4BOFaUqILm4UtxmT2TCBYz4u3Ng5P+iCPeUKw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 339787f2-983e-4418-476f-08de27a2590b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 19:32:16.4431
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ATskDiWZe2Rs34sRPsqklIfq28Cp+9hIxAMghbC5PvM/0tiWhUrJS9bYyRLVNaxO8pSDEtFI557sGvhTEo+a3FxB5G6JfzKtcxN506nGWcI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7012

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
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>=20
---
changes in v8:
- drop checks from viridian_load_vcpu/domain_ctxt()
- drop check "value !=3D 0" in HVM_PARAM_VIRIDIAN handler, laways return
  -ENODEV for VIRIDIAN=3Dn

changes in v7:
- s/!is_viridian_vcpu()/!IS_ENABLED(CONFIG_VIRIDIAN) checks in
  viridian_load_vcpu/domain_ctxt(), because it is not
  guaranteed that HVM_PARAM_VIRIDIAN will be loaded before
  viridian_load_vcpu_ctxt() is called (comment from Jason Andryuk)

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
  support optional")

v7: https://patchwork.kernel.org/project/xen-devel/patch/20251031161716.122=
2956-1-grygorii_strashko@epam.com/
v6: https://patchwork.kernel.org/project/xen-devel/patch/20251023151807.560=
843-1-grygorii_strashko@epam.com/
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
 xen/arch/x86/hvm/viridian/viridian.c    |  8 ++++----
 xen/arch/x86/hvm/vlapic.c               | 11 +++++++----
 xen/arch/x86/include/asm/hvm/domain.h   |  2 ++
 xen/arch/x86/include/asm/hvm/hvm.h      |  3 ++-
 xen/arch/x86/include/asm/hvm/vcpu.h     |  2 ++
 xen/arch/x86/include/asm/hvm/viridian.h | 15 +++++++++++++++
 9 files changed, 46 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
index 5e86cac26e1b..5c47a45c9350 100644
--- a/xen/arch/x86/hvm/Kconfig
+++ b/xen/arch/x86/hvm/Kconfig
@@ -75,6 +75,16 @@ config ALTP2M
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
index 88ad4100001e..7299cfa90ad5 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -4231,8 +4231,9 @@ static int hvm_set_param(struct domain *d, uint32_t i=
ndex, uint64_t value)
             rc =3D -EINVAL;
         break;
     case HVM_PARAM_VIRIDIAN:
-        if ( (value & ~HVMPV_feature_mask) ||
-             !(value & HVMPV_base_freq) )
+        if ( !IS_ENABLED(CONFIG_VIRIDIAN) )
+            rc =3D -ENODEV;
+        else if ( (value & ~HVMPV_feature_mask) || !(value & HVMPV_base_fr=
eq) )
             rc =3D -EINVAL;
         break;
     case HVM_PARAM_IDENT_PT:
diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridi=
an/viridian.c
index f79cffcb3767..90e749ceb581 100644
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
index 94d19730b2c1..83be2bd1c29c 100644
--- a/xen/arch/x86/include/asm/hvm/domain.h
+++ b/xen/arch/x86/include/asm/hvm/domain.h
@@ -105,7 +105,9 @@ struct hvm_domain {
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
index 927427764c9e..93da4dd2dc4b 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -514,7 +514,8 @@ hvm_get_cpl(struct vcpu *v)
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
index 3cf7a71fd309..eae9ac53767b 100644
--- a/xen/arch/x86/include/asm/hvm/vcpu.h
+++ b/xen/arch/x86/include/asm/hvm/vcpu.h
@@ -173,7 +173,9 @@ struct hvm_vcpu {
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

