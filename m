Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D124D2D524
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jan 2026 08:39:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1206241.1519909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgeQK-0004uz-46; Fri, 16 Jan 2026 07:39:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1206241.1519909; Fri, 16 Jan 2026 07:39:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgeQK-0004sf-1O; Fri, 16 Jan 2026 07:39:12 +0000
Received: by outflank-mailman (input) for mailman id 1206241;
 Fri, 16 Jan 2026 07:39:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XdZn=7V=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vgeQI-0004sX-Be
 for xen-devel@lists.xenproject.org; Fri, 16 Jan 2026 07:39:10 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 707aab27-f2ae-11f0-b15e-2bf370ae4941;
 Fri, 16 Jan 2026 08:39:08 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 SN7PR12MB8792.namprd12.prod.outlook.com (2603:10b6:806:341::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 07:39:04 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2%2]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 07:39:04 +0000
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
X-Inumbo-ID: 707aab27-f2ae-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i3i41AWBbuBycFApyXWQYU83XjB9cnR9j0ijo/zwKyyl8/9h9nIUMrYwIsUv4EdoR90PJo9RVrW4T7MdOLW+zHLnEsXgHv0BS91DbdKHAAUMnyruuCMuddr4D0uVFijMrvgzBqrYwt0IHz31iJn6j3UQcedkJf0HJO+6fg844zPHZ9eJzMZW0segHAlAF9pMG9U5VD7fXlncTNt8kxdFsczQQBRkB9lLKNUXmzd0H9+MR4Z84Y8NuEGQKU//cAM1H3ssS5UlkM+V/Amogyx9FGD7YyCgStA214X0JNbcHxPw5jLRppkHvmDNUCUITRC3eXCZ1KnAETKgJnZv+ZvukA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HGTSZ8piwgHaKl1GOzMZjZyoyyCvYA907ZSIxn3VuzY=;
 b=cS5dD8akyt3XahQYRGTVPd7UEohkTU8zaHCo1HHxCAZkC4gIzc436ZdTigOM6vamASn4yyxPVMHik6aAG4XU7+tKfFCpa2SMvTiwTu7Q2f58FBJFnq5bvwaWA6I+TI9vUq0kHp0YzPint26K7c8JEGNHLSUAZIJBN5Y4tTJ4USDXK8tja86olpkgSmyVgiq6rxdcaFfe4Nbgb5r0w907c8us594FlyUtqANvTnuK/Bux1fUXzRUmFDtsVP/a0aH02JLvvJhmzYBvfN3vgQll5WezREQAX/OkH/R2vGyEL8+bu+K06aCEcTcfsS1dZUgXsyxmxASLU15HEG4if38JKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HGTSZ8piwgHaKl1GOzMZjZyoyyCvYA907ZSIxn3VuzY=;
 b=SepOppEN6/7eSGIKmBBFqamMRrS5tUaKlBkEZLXRxroUmO+TZCzPh5vAqi1tKYjzy7WZCXiu6XeikC2vxi0T8Qy9PIdaATfdD/m1gRaOY43/u1f7ut/sAejPGXMgZZKNPHr+CfwieYQxdn7hSJsD7HNXkjjXblr7+QYT+QZcW/A=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Tamas K
 Lengyel <tamas@tklengyel.com>
Subject: RE: [PATCH v4 3/6] x86/monitor: wrap monitor_op under CONFIG_VM_EVENT
Thread-Topic: [PATCH v4 3/6] x86/monitor: wrap monitor_op under
 CONFIG_VM_EVENT
Thread-Index: AQHchgFzx+i/rzGyyUiVB7q9IfPMErVUadBg
Date: Fri, 16 Jan 2026 07:39:04 +0000
Message-ID:
 <DM4PR12MB845154DF074B315619952C71E18DA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20260115092841.2651224-1-Penny.Zheng@amd.com>
 <20260115092841.2651224-4-Penny.Zheng@amd.com>
In-Reply-To: <20260115092841.2651224-4-Penny.Zheng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2026-01-16T07:38:56.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|SN7PR12MB8792:EE_
x-ms-office365-filtering-correlation-id: 1ff81181-3753-43e5-6802-08de54d25307
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|7053199007;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?PQczt1BOXKHc6B5BiPEe80Spz1heArct9D610W9LGFBw5eaoziXTAxLqeU?=
 =?iso-8859-1?Q?fzvDk9lAfgq0smcTzpXts6rxFJxLQZAldEOgJ0nhq7NYBPRn8Qp5lE988T?=
 =?iso-8859-1?Q?3PD3TZv8Kka5T9G8rgAssGgZN5k82oD5vs5lpVu6yS6Eq8BvXmWUO3q3iP?=
 =?iso-8859-1?Q?jvDpqBQo4u1FEis6LnwfhzRGOvVyq2LS/Trq1nM2BXGsy/aiBSnI/si6Pg?=
 =?iso-8859-1?Q?lUOz10VymgB7FDBzJOauxbTz2DcrXZ0gdoaH9xKytfcS+WXYWobTeKd3+F?=
 =?iso-8859-1?Q?cxHUiM9Lsqe1u8vPsfjorRjlZRa06HwnK/XhPom9JXm/QpcAMjSPg9H4JU?=
 =?iso-8859-1?Q?2P1aN3ie7wgYtIUykEevek4ORSyyatq9Heh0j9sxI5PKzme1xulBHcBCLq?=
 =?iso-8859-1?Q?HGc0s9Ex8qoSEG0eColJJMHSbt7hX6qAPsN+gJziW1hkq6eeTbPceKFTQX?=
 =?iso-8859-1?Q?EBRgKVJ7YoVxHiIE20vTt4FS2Ux4xE4PGd7N/Tuat9N9vGa6KZZzI6cnW4?=
 =?iso-8859-1?Q?4JxqkXb6qGMzY6dBPUI5OX0WzTRWY0zOV46eaaU8naUo31lSkRUpd5TO7/?=
 =?iso-8859-1?Q?vNvDsECe9HQNLJSkbaaEWQ/yNsGBMVTUtT+b2nBuR3DZfDcTtQ3fNFO6N9?=
 =?iso-8859-1?Q?t0XuWMhhjwODg80/6zgCztnfCx8rmkSCmQ+7ObcwrjK+K7+ceXj+hERWk3?=
 =?iso-8859-1?Q?kDyVdXxDe4QmitDoWX5rXUlFcXvLNI8hBUvgsNjnEfNhzVLB6ZMC+TnRJW?=
 =?iso-8859-1?Q?fogsbupf6hRX+H+5Inh8k/6CuskxKvJliSgKBjtKb2MXbwnYWy7obSIl8d?=
 =?iso-8859-1?Q?ru3QLhw64MfCMdImI+om02lRBb12loeGpM9C+fmeGP5+sgyk5pieQNnEI6?=
 =?iso-8859-1?Q?xGxzNxqIhXUNFC2o4+gkllF8ct5rwVsB7uQbboH2sHUADBGpEW58TaPDkJ?=
 =?iso-8859-1?Q?kH0yQeDf5YEbK6HeWtbTSm7oKtp1qmVxKAN158sXKN1vzS1Py0NtmkmWu2?=
 =?iso-8859-1?Q?P698rVEx3t3bW3yz47orkZfetCbzvP1Qj4a9j0mzWjppiVNGtRashMdYeZ?=
 =?iso-8859-1?Q?7RrViIqFC86UkO5ksFYct1PRSfwrwtc+TXFHV1pyS1jHGLhOY2RPzV5/4Z?=
 =?iso-8859-1?Q?IT9ClFnlTM7x461X5nEMFYHR2OYUC/lunBAByQKuOkWbYH0AIPZMcRuHu4?=
 =?iso-8859-1?Q?cMjFRv/pFxm1LnNcv/jTZOF617QJCs/hEHTEFdUPClEiSFV3uSnJoxP51G?=
 =?iso-8859-1?Q?/cwn2HXGk/0UyHtCir+JsDV2bW5Lgc4Z5ZxyaMyS+sTOinAtY6Ia39R1L2?=
 =?iso-8859-1?Q?5Kja7C25d5Xm1pBwCGLqsS+PdfwZBbwVAy0rFJ2CmyNswE5rVTt6l5tsy1?=
 =?iso-8859-1?Q?pj8WuxZDDUUpZna6v3Vmz/dLC9a3Az+2cbMfFILVbd2w7n5woS89aJ6P+z?=
 =?iso-8859-1?Q?/aH/lgs9sVq1X4ZNiU71nlQEVJaLLMsoQTNAmlRPkIaTDKgxaK7M7SMPRX?=
 =?iso-8859-1?Q?+HVmwckbKyYFzkGj6hfKvlN7pSmw9pP16y3J4OGsxPt6rxmcVdeNC8D2CO?=
 =?iso-8859-1?Q?t1X6p6hcGSpq+85y8zPbRtk8uQIDKscnSOu1K9CEOvSJmojADFhgWl32UB?=
 =?iso-8859-1?Q?7Bp09MzSnU4OpQvsn6TsEsZHrrOMSuVvQQ9lCfNmucHlgUD/mYfosA/U7/?=
 =?iso-8859-1?Q?TDiBuwTJytYo94hE6ss=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ifYPthjVSAyMsjUYWLkT3HDGKSvSGvINFFsl1mH++fPT2Gn+4ws6KdUlOl?=
 =?iso-8859-1?Q?XUh/cNsmA5bfeqtc4X21iNiEi5p6+XKtG9WtJaJixaVWWd4uzEGKdiyXH4?=
 =?iso-8859-1?Q?OhVpVncj+A9M9DUIdYOTz20N2Pi5vyUtc/ATK4y5PnUxV+rTx/psu1koj9?=
 =?iso-8859-1?Q?s9P5GflqX6g/kllzFjDd5I5QcdAsRN6+W5SI4t9hXZoelcFkqGJPnHsprb?=
 =?iso-8859-1?Q?T5ABe6k3W6+cOIpoobj9Pl9hWixKbza33yOQuLwag2EhadO99mq0hq8t8k?=
 =?iso-8859-1?Q?OYDe3hhE7UX1SX6PB4o3rdbTpQFDCEEhjq96DjvIJgaHG2h3CVo/udMkyl?=
 =?iso-8859-1?Q?YNctA4/D3FGTVQs9EkXtE8LbXEhEhgoJFMis4RMR1n19C6vbrtnvgLm/l3?=
 =?iso-8859-1?Q?TU7bx/S6Tur6VVPxwCvsUGqv0OFdhbmJpfjZVks63bwf6wsoz4TWWM1Haj?=
 =?iso-8859-1?Q?mMF5wqwX1kBZvDaHMF2lYyJTEwrIorBPOlNHPcJ+7JhMbQPBM0raXZ8E2i?=
 =?iso-8859-1?Q?dKqZZAcjg8aT9jx2/b+mMH1HtWRyRKEvVlwBH5RQRiJJJRaoPk5XypeD2u?=
 =?iso-8859-1?Q?kSX7YcghYyJZOSkxEhDwhhLE2euFqoHuGCRzLRwoLo/Tp79opyOICxttgI?=
 =?iso-8859-1?Q?zu51cJGyogTsR5bGMVv8jocmZ37ZERTvtITKi7hErM0W8ZR92ViyKNhUpR?=
 =?iso-8859-1?Q?BYcgQhCcK2FvSOJZAG61U+3f4w2XtA85l+cwFkbXYslCaw6mNccyZWMsiI?=
 =?iso-8859-1?Q?z5a3djJGf0Cfvlybo8gSSVFCtk4O6Xu1CsYTMWKgowSg4QKPhxC8H/W4UV?=
 =?iso-8859-1?Q?vnGq+xbCnqv7Y5bjI8UeVfQ/iQEO8qkc5eUEOg5t0QuQR/A7S/ufBCgLIj?=
 =?iso-8859-1?Q?EDPa7Eu7FhOT4WEkuy/nEmCphOQEdwjdTJhud0aBMqEO/LEfPvkblWxh4H?=
 =?iso-8859-1?Q?56NQk5qtB3r8AyhsucTcVYWiI6Nir8bkK/PpAvFBsJf32Hy5+wxGrrkiB+?=
 =?iso-8859-1?Q?wW3tmRA3MtMuwqeuob/r9QJSt3+fWzyuV0aGj59EzKRk7j5uz9pWfUyZ1v?=
 =?iso-8859-1?Q?1SNSj5xxQ5AfrrrTItZj+X9vDndrnWQkYZA88NCSiCvktWJGrcIxuJ5bpQ?=
 =?iso-8859-1?Q?UVVgKoOfU31zcE7BgOVXV2mc3NnDPe6MidQNOiWfn9yPti8H+HrLczJb5o?=
 =?iso-8859-1?Q?/pNvI8ExXDhH4HcXBoPZPotYNsiQRMcoalrOfUPET4Tt04q69arMojT0bt?=
 =?iso-8859-1?Q?cZlaPPtT+nxXMCZ+7/BYQC+Enbq2ZQISdqDD/QUtBuNXZe2cCvJiqM2S/M?=
 =?iso-8859-1?Q?o97lMV5/tuoXE6K3PX1VTJ1Dz3cVt5JiTZZwr8XhMVZmEOAqYgrqLMcJIR?=
 =?iso-8859-1?Q?d7bPAh0byIostsAvjWoaI6bEHWimh4x5WJMYCHd4AZiHPdFet2EeZZXwPM?=
 =?iso-8859-1?Q?+NlZkuivteMFFzbW+YG1e1TxMk3vxGsIVAWTg8G4q0WxwoVwD+AjU3LorO?=
 =?iso-8859-1?Q?fe1HittYp5d3CL49ZhTcaFoAZ5xJv1RmnmQ+I4tD1zctWHti6W6O+T4mgq?=
 =?iso-8859-1?Q?0pmA1brsKhJrbCK6e4t8CAgp4EFzx838hGkHmQAsboABCOr9fpDedDl4FT?=
 =?iso-8859-1?Q?TnpfSQwtzM2oIrjRrd2pQgA6TuXWEqKVuuqRe7AjZqImeEZgzPHBuqCvhQ?=
 =?iso-8859-1?Q?+Kldmkw+Oqsil9xSdsPRlLrwie7IIoPks92heZrhTAh/MlifcdWa+U4lln?=
 =?iso-8859-1?Q?f1QF2mFcZjreBEHalX5Kt5M95bgSXmcezlZ+07CMEuEeEl?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ff81181-3753-43e5-6802-08de54d25307
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2026 07:39:04.5934
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ak5VvBmH/7sYhH2WosLQewdcOB4fP40LsMQnVLP+Zarrm1IDAfzXdKbl1UoL2h82K0LnKqxA3MPBm3rrfY72dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8792

[Public]

Hi, Tamas

May I ask for a review on this commit?

Many thanks
Penny Zheng

> -----Original Message-----
> From: Penny, Zheng <penny.zheng@amd.com>
> Sent: Thursday, January 15, 2026 5:29 PM
> To: xen-devel@lists.xenproject.org; Andryuk, Jason <Jason.Andryuk@amd.com=
>
> Cc: Huang, Ray <Ray.Huang@amd.com>; Penny, Zheng
> <penny.zheng@amd.com>; Jan Beulich <jbeulich@suse.com>; Andrew Cooper
> <andrew.cooper3@citrix.com>; Roger Pau Monn=E9 <roger.pau@citrix.com>; Ta=
mas
> K Lengyel <tamas@tklengyel.com>; Alexandru Isaila <aisaila@bitdefender.co=
m>;
> Petre Pircalabu <ppircalabu@bitdefender.com>
> Subject: [PATCH v4 3/6] x86/monitor: wrap monitor_op under CONFIG_VM_EVEN=
T
>
> Feature monitor_op is based on vm event subsystem, so monitor.o shall be
> wrapped under CONFIG_VM_EVENT.
> The following functions are only invoked by monitor-op, so they all shall=
 be wrapped
> with CONFIG_VM_EVENT (otherwise they will become unreachable and violate
> Misra rule 2.1 when VM_EVENT=3Dn):
> - hvm_enable_msr_interception
>   - hvm_function_table.enable_msr_interception
> - hvm_has_set_descriptor_access_existing
>   - hvm_function_table.set_descriptor_access_existi
> - arch_monitor_get_capabilities
> Function monitored_msr() still needs a stub to pass compilation when
> VM_EVENT=3Dn.
>
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
>  xen/arch/x86/hvm/Makefile          |  2 +-
>  xen/arch/x86/hvm/svm/svm.c         |  8 +++++++-
>  xen/arch/x86/hvm/vmx/vmx.c         | 10 ++++++++++
>  xen/arch/x86/include/asm/hvm/hvm.h | 18 +++++++++++-------
> xen/arch/x86/include/asm/monitor.h |  9 +++++++++
>  5 files changed, 38 insertions(+), 9 deletions(-)
>
> diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile index
> 1b97bdc624..ee4b45a4ee 100644
> --- a/xen/arch/x86/hvm/Makefile
> +++ b/xen/arch/x86/hvm/Makefile
> @@ -16,7 +16,7 @@ obj-y +=3D io.o
>  obj-y +=3D ioreq.o
>  obj-y +=3D irq.o
>  obj-y +=3D mmio.o
> -obj-y +=3D monitor.o
> +obj-$(CONFIG_VM_EVENT) +=3D monitor.o
>  obj-y +=3D mtrr.o
>  obj-y +=3D nestedhvm.o
>  obj-y +=3D pmtimer.o
> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c inde=
x
> 21f355a657..5d23603fc1 100644
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -297,6 +297,7 @@ void svm_intercept_msr(struct vcpu *v, uint32_t msr, =
int
> flags)
>          __clear_bit(msr * 2 + 1, msr_bit);  }
>
> +#ifdef CONFIG_VM_EVENT
>  static void cf_check svm_enable_msr_interception(struct domain *d, uint3=
2_t msr)
> {
>      struct vcpu *v;
> @@ -304,6 +305,7 @@ static void cf_check svm_enable_msr_interception(stru=
ct
> domain *d, uint32_t msr)
>      for_each_vcpu ( d, v )
>          svm_intercept_msr(v, msr, MSR_INTERCEPT_WRITE);  }
> +#endif /* CONFIG_VM_EVENT */
>
>  static void svm_save_dr(struct vcpu *v)  { @@ -824,6 +826,7 @@ static vo=
id
> cf_check svm_set_rdtsc_exiting(struct vcpu *v, bool enable)
>      vmcb_set_general2_intercepts(vmcb, general2_intercepts);  }
>
> +#ifdef CONFIG_VM_EVENT
>  static void cf_check svm_set_descriptor_access_exiting(
>      struct vcpu *v, bool enable)
>  {
> @@ -841,6 +844,7 @@ static void cf_check svm_set_descriptor_access_exitin=
g(
>
>      vmcb_set_general1_intercepts(vmcb, general1_intercepts);  }
> +#endif /* CONFIG_VM_EVENT */
>
>  static unsigned int cf_check svm_get_insn_bytes(struct vcpu *v, uint8_t =
*buf)
> { @@ -2454,9 +2458,11 @@ static struct hvm_function_table __initdata_cf_c=
lobber
> svm_function_table =3D {
>      .fpu_dirty_intercept  =3D svm_fpu_dirty_intercept,
>      .msr_read_intercept   =3D svm_msr_read_intercept,
>      .msr_write_intercept  =3D svm_msr_write_intercept,
> +#ifdef CONFIG_VM_EVENT
>      .enable_msr_interception =3D svm_enable_msr_interception,
> -    .set_rdtsc_exiting    =3D svm_set_rdtsc_exiting,
>      .set_descriptor_access_exiting =3D svm_set_descriptor_access_exiting=
,
> +#endif
> +    .set_rdtsc_exiting    =3D svm_set_rdtsc_exiting,
>      .get_insn_bytes       =3D svm_get_insn_bytes,
>
>      .nhvm_vcpu_initialise =3D nsvm_vcpu_initialise, diff --git
> a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c index
> 89f9d9c7f6..40e4c71244 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -1581,6 +1581,7 @@ static void cf_check vmx_set_rdtsc_exiting(struct v=
cpu
> *v, bool enable)
>      vmx_vmcs_exit(v);
>  }
>
> +#ifdef CONFIG_VM_EVENT
>  static void cf_check vmx_set_descriptor_access_exiting(
>      struct vcpu *v, bool enable)
>  {
> @@ -1595,6 +1596,7 @@ static void cf_check
> vmx_set_descriptor_access_exiting(
>      vmx_update_secondary_exec_control(v);
>      vmx_vmcs_exit(v);
>  }
> +#endif /* CONFIG_VM_EVENT */
>
>  static void cf_check vmx_init_hypercall_page(void *p)  { @@ -2474,6 +247=
6,7 @@
> static void cf_check vmx_handle_eoi(uint8_t vector, int isr)
>          printk_once(XENLOG_WARNING "EOI for %02x but SVI=3D%02x\n", vect=
or,
> old_svi);  }
>
> +#ifdef CONFIG_VM_EVENT
>  static void cf_check vmx_enable_msr_interception(struct domain *d, uint3=
2_t msr)
> {
>      struct vcpu *v;
> @@ -2481,6 +2484,7 @@ static void cf_check
> vmx_enable_msr_interception(struct domain *d, uint32_t msr)
>      for_each_vcpu ( d, v )
>          vmx_set_msr_intercept(v, msr, VMX_MSR_W);  }
> +#endif /* CONFIG_VM_EVENT */
>
>  #ifdef CONFIG_ALTP2M
>
> @@ -2932,7 +2936,9 @@ static struct hvm_function_table __initdata_cf_clob=
ber
> vmx_function_table =3D {
>      .nhvm_domain_relinquish_resources =3D nvmx_domain_relinquish_resourc=
es,
>      .update_vlapic_mode =3D vmx_vlapic_msr_changed,
>      .nhvm_hap_walk_L1_p2m =3D nvmx_hap_walk_L1_p2m,
> +#ifdef CONFIG_VM_EVENT
>      .enable_msr_interception =3D vmx_enable_msr_interception,
> +#endif
>  #ifdef CONFIG_ALTP2M
>      .altp2m_vcpu_update_p2m =3D vmx_vcpu_update_eptp,
>      .altp2m_vcpu_update_vmfunc_ve =3D vmx_vcpu_update_vmfunc_ve, @@ -
> 3141,9 +3147,11 @@ const struct hvm_function_table * __init start_vmx(voi=
d)
>
>      vmx_function_table.caps.singlestep =3D cpu_has_monitor_trap_flag;
>
> +#ifdef CONFIG_VM_EVENT
>      if ( cpu_has_vmx_dt_exiting )
>          vmx_function_table.set_descriptor_access_exiting =3D
>              vmx_set_descriptor_access_exiting;
> +#endif
>
>      /*
>       * Do not enable EPT when (!cpu_has_vmx_pat), to prevent security ho=
le @@ -
> 3214,8 +3222,10 @@ void __init vmx_fill_funcs(void)
>      if ( !cpu_has_xen_ibt )
>          return;
>
> +#ifdef CONFIG_VM_EVENT
>      vmx_function_table.set_descriptor_access_exiting =3D
>          vmx_set_descriptor_access_exiting;
> +#endif
>
>      vmx_function_table.update_eoi_exit_bitmap =3D vmx_update_eoi_exit_bi=
tmap;
>      vmx_function_table.process_isr            =3D vmx_process_isr;
> diff --git a/xen/arch/x86/include/asm/hvm/hvm.h
> b/xen/arch/x86/include/asm/hvm/hvm.h
> index 666fa402a8..af042ae858 100644
> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> @@ -192,7 +192,11 @@ struct hvm_function_table {
>      void (*handle_cd)(struct vcpu *v, unsigned long value);
>      void (*set_info_guest)(struct vcpu *v);
>      void (*set_rdtsc_exiting)(struct vcpu *v, bool enable);
> +
> +#ifdef CONFIG_VM_EVENT
>      void (*set_descriptor_access_exiting)(struct vcpu *v, bool enable);
> +    void (*enable_msr_interception)(struct domain *d, uint32_t msr);
> +#endif
>
>      /* Nested HVM */
>      int (*nhvm_vcpu_initialise)(struct vcpu *v); @@ -224,8 +228,6 @@ str=
uct
> hvm_function_table {
>                                  paddr_t *L1_gpa, unsigned int *page_orde=
r,
>                                  uint8_t *p2m_acc, struct npfec npfec);
>
> -    void (*enable_msr_interception)(struct domain *d, uint32_t msr);
> -
>  #ifdef CONFIG_ALTP2M
>      /* Alternate p2m */
>      void (*altp2m_vcpu_update_p2m)(struct vcpu *v); @@ -435,11 +437,18 @=
@
> static inline bool using_svm(void)
>
>  #define hvm_long_mode_active(v) (!!((v)->arch.hvm.guest_efer & EFER_LMA)=
)
>
> +#ifdef CONFIG_VM_EVENT
>  static inline bool hvm_has_set_descriptor_access_exiting(void)
>  {
>      return hvm_funcs.set_descriptor_access_exiting;
>  }
>
> +static inline void hvm_enable_msr_interception(struct domain *d,
> +uint32_t msr) {
> +    alternative_vcall(hvm_funcs.enable_msr_interception, d, msr); }
> +#endif /* CONFIG_VM_EVENT */
> +
>  static inline void hvm_domain_creation_finished(struct domain *d)  {
>      if ( hvm_funcs.domain_creation_finished ) @@ -681,11 +690,6 @@ stati=
c inline
> int nhvm_hap_walk_L1_p2m(
>          v, L2_gpa, L1_gpa, page_order, p2m_acc, npfec);  }
>
> -static inline void hvm_enable_msr_interception(struct domain *d, uint32_=
t msr) -{
> -    alternative_vcall(hvm_funcs.enable_msr_interception, d, msr);
> -}
> -
>  static inline bool hvm_is_singlestep_supported(void)  {
>      return hvm_funcs.caps.singlestep;
> diff --git a/xen/arch/x86/include/asm/monitor.h
> b/xen/arch/x86/include/asm/monitor.h
> index 3c64d8258f..9249324fd0 100644
> --- a/xen/arch/x86/include/asm/monitor.h
> +++ b/xen/arch/x86/include/asm/monitor.h
> @@ -71,6 +71,7 @@ int arch_monitor_domctl_op(struct domain *d, struct
> xen_domctl_monitor_op *mop)
>      return rc;
>  }
>
> +#ifdef CONFIG_VM_EVENT
>  static inline uint32_t arch_monitor_get_capabilities(struct domain *d)  =
{
>      uint32_t capabilities =3D 0;
> @@ -102,6 +103,7 @@ static inline uint32_t arch_monitor_get_capabilities(=
struct
> domain *d)
>
>      return capabilities;
>  }
> +#endif /* CONFIG_VM_EVENT */
>
>  int arch_monitor_domctl_event(struct domain *d,
>                                struct xen_domctl_monitor_op *mop); @@ -12=
3,7 +125,14
> @@ static inline void arch_monitor_cleanup_domain(struct domain *d) {}
>
>  #endif
>
> +#ifdef CONFIG_VM_EVENT
>  bool monitored_msr(const struct domain *d, u32 msr);
> +#else
> +static inline bool monitored_msr(const struct domain *d, u32 msr) {
> +    return false;
> +}
> +#endif
>  bool monitored_msr_onchangeonly(const struct domain *d, u32 msr);
>
>  #endif /* __ASM_X86_MONITOR_H__ */
> --
> 2.34.1


