Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09960D13E72
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 17:11:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200675.1516535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfKVM-00032W-Q7; Mon, 12 Jan 2026 16:10:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200675.1516535; Mon, 12 Jan 2026 16:10:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfKVM-0002zx-N7; Mon, 12 Jan 2026 16:10:56 +0000
Received: by outflank-mailman (input) for mailman id 1200675;
 Mon, 12 Jan 2026 16:10:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Amy=7R=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1vfKVK-0002zp-Ug
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 16:10:55 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4293c955-efd1-11f0-9ccf-f158ae23cfc8;
 Mon, 12 Jan 2026 17:10:49 +0100 (CET)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by PAXPR03MB7732.eurprd03.prod.outlook.com (2603:10a6:102:208::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 16:10:47 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%5]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 16:10:47 +0000
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
X-Inumbo-ID: 4293c955-efd1-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UHCF7UdKZahL3NotBmKm/M2w0iSOxuadM955wnAjp/IzFK+1Vm7QMQZ91h0Pvzgz7zYg/zCAAV8WDbdMCL1+c5aSaUKRv/WhOpX3wzYvMGGCBSnqA9CIldpYdDbdhNu9b0AleWdMBXpjL/JHggoPirZDyYmYP+cMJqQA2OsTNol3mg1tjgOcWAqr3vIX7RoY7BmVaykNKGgMuSdcjgctCZ65hIY/HvDq786MUrC2+gxqeW17T2Z5TwoQKhFUycgKtDgVo16lhypiXRjaoBV7aXe/8sYitI9B2N8maLrgWlwb0wV/Cul6dvBV20UEccnrf4X0Y6WR+ufUwOsigSS60Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3F2+mk0Oyw++ehCgnEpr6wttlxTm37blWi7nZ0c8SAw=;
 b=sRTUzk+msYa187xQ1WgCN7wCpzPdYfKbafAbU+0EdlyOBeLEON4R72Cu56f9qwmav8Y4CEGppyH6DWHWH44db0d+ZJtzH1R4OD42N2Rti+UGXtIoyo/jMeITMe2aEkGNxUEdZgrd4WDAVYnUc74ASjC6btx5qBjq3refk3cjRccuaGiEmPeAIz4YG9THrhKlWxwR2iBWpfUhLMpzSXxCatEny2mKm/k6KOVAqUbfegrwMOO7iFRohMOgWmzzqpLYULBBfiroLytmyNhqNgRWESesEbtMuzvIRtTEr4dVlmWmKsaxl24xwJ8IAvCa/xnGdTHY8ZiX4ju9ELV3PSg3Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3F2+mk0Oyw++ehCgnEpr6wttlxTm37blWi7nZ0c8SAw=;
 b=sn/+bj6UJW0mhRDiY3NSn28XFP52QMKdwSCSmufuEJtXaZJuEvRQWme353Yfpn0kK2bJ+ljfs0ZYojYZcPLGWnVFQCUtJrWeOAXwkdHoaAcBdbdW4ywl6deM/sDJY9Qqw2qld8+RcATGPCPeFlKUhYQ7+orOWdSLSLM4OKJ4tNkcNt+kYhXUGSp6i6RjpVcqQa8BJZrmVaV7PH1TddpFaCjrgVV7x/vE3brWeU72GO68OTA8DHWt6nGI4Ryh+aPhDwc3adci2V9jnhqwJJZOXqR4xK/5XenmKPmJrZfYxcR2uRGvBeQsSmvtEpSbUwv1LU+gE8Y/mbfSOS5L6YsWlw==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 1/5] xen/domctl: extend XEN_DOMCTL_assign_device to
 handle not only iommu
Thread-Topic: [PATCH v6 1/5] xen/domctl: extend XEN_DOMCTL_assign_device to
 handle not only iommu
Thread-Index: AQHcSyafS16SOr0Uk0OkeRdy8jd8CrVPHVoAgAADtoCAAACtAIAAA/oA
Date: Mon, 12 Jan 2026 16:10:47 +0000
Message-ID: <9631b854-2fc6-41aa-8b12-1e7283b22246@epam.com>
References: <cover.1761998077.git.oleksii_moisieiev@epam.com>
 <b0a72660d58608c80e7408eb8df32ec369d4e45b.1761998077.git.oleksii_moisieiev@epam.com>
 <9598b2e2-7df8-40c5-82cb-c097121af763@suse.com>
 <5d8f55a6-7182-4e9d-a139-96fddb9450f8@epam.com>
 <98f5e8f0-070c-4be5-9baf-46278de8093d@suse.com>
 <99586f5c-d76b-4cbe-9fbd-c87e86bb236a@epam.com>
 <7cbda859-4257-499e-86e0-a0d001fd49c9@suse.com>
In-Reply-To: <7cbda859-4257-499e-86e0-a0d001fd49c9@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|PAXPR03MB7732:EE_
x-ms-office365-filtering-correlation-id: 53a6b0c1-2515-4527-8b98-08de51f52598
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?aHBFTmhFZzB4L3RKa0hCQk12SEpLTi85UE1MSE00TmNxNk9NTi9HR2R2SFdx?=
 =?utf-8?B?NXBYcWNhVURvWjlMMXNHSGRNRVpBNkJFVlQrd2ErYUVaUHMwZHA3SEgwVDB4?=
 =?utf-8?B?VjY3cVNyZ3ZwYlo2dG5NY1RlYW5LUXNBTFU0ZUJzSmR4MTd6eFVZL2dHQ3ZN?=
 =?utf-8?B?MUlYd2dxNTR0MVkzc2JVbi9tME9kNFJVSUdtbTRvMGRzR3ZyT241c2ZxRWtq?=
 =?utf-8?B?S0ZEREhzY2JmV0xhYUxTdC9YR05XSUwzUE1JaTFaNUMxekRMOXZBWlczTG5n?=
 =?utf-8?B?Unhxbk5UZEFUcWtvMExaZVFtZVpLdEF4dXF0NHR3bStab0w0S2VMa1lnRDd6?=
 =?utf-8?B?MHhkMnZLVlFoT2RyanhUQm1VRlJia2Y2cVJ0TzBHcFVkY0YxQkd2Qm1CNUhj?=
 =?utf-8?B?cWI3dXIxSjd6d2pHWTd1bnQ5K1BqUk5tbkgyNEtFWXVPRmplc29zeVB1SGdW?=
 =?utf-8?B?SnhGVk52WXkvYTkwVi9JSTFhS3gxa2k0ZGNnVXVWc2xuSVFsaW1SYzc3cmpS?=
 =?utf-8?B?Qm5CcWJ0Y2xvSVkyTndBU2xJbVlJVThaSTVsL3BPajBPTi85MEIzM1lnWDZr?=
 =?utf-8?B?NFJna2hIMStWY21uL1lxT1I1dFFhOFhZay94cVJEMVlWSk5NbHhHdE1FZ0d2?=
 =?utf-8?B?dngyVEVYcXhUblhzUjVGSjZBOXV6N1k3a2h2TlhMMDFBK1VhWk8yeFhDYUxO?=
 =?utf-8?B?L0h2bVI2blFDMGx0aGlFdTdibG4xSmNjendOTUZKL3FQNWw1L1c2OHZYbkli?=
 =?utf-8?B?a2hmRmpFWFJpOEZHSnFac0V0cUJscjlSN0ZEUWtzaFpCZktFRE8zbldLUWJ6?=
 =?utf-8?B?NU1zNS9pOU4zcUM1cTJwdXlxQzA0MkZmaVBJaWJ4ZENJZ2FaMUZyN0JyUnpq?=
 =?utf-8?B?Rk1BYWhuZW1jQzQ5d2ZyVFREUlpIVnVhOGR2RVRJRGtkYWQ1d2ZlbnNLSGtH?=
 =?utf-8?B?ZnpScmx4MFNZVXNUV0IxL2Q3dzl1dUhmVDVFVmUwVm5POEI4aERmNlF1cmZS?=
 =?utf-8?B?ampWWVpWQ09tckNoaGZuQnhEVkt4UWlRWWRTTTJVdEdQaW8xUGs5WlJIOUdQ?=
 =?utf-8?B?UzZYYzY3SGtsY1RXNkZtd0lpcWRMQThDMWkzakNsY09YKzNVT0piRklNYVhL?=
 =?utf-8?B?RU8xekdEUEs2aWVXRGZjV0NFL0lpRkgxdnJDOStoZEFKN0Z6TjBqYldaRGRv?=
 =?utf-8?B?cS9sQUltM1JOb3V5M29NQW1kZDNxdm0yUDVGcHk2VktoYkY3NDlNTDBzbzIy?=
 =?utf-8?B?b2owZ29rVmpPNnM3dnk0ZXByYzlsbzMwQ1FNSUtGd05uNnlEZ0gxbEJvOWMv?=
 =?utf-8?B?blErSnRDLzRrZjFLVXZmanNobjNrTENtSDNiSG5RLzVYeFUvYWRsNmZ1MmVt?=
 =?utf-8?B?VnBzaGlRcWtCcWVtTVJKbStyWmVxT0daNTBiOVFUQlhac2Q2ZUZ3dU00SHVv?=
 =?utf-8?B?RVdwY2p4eVpWRXlyZDV0a2RLamlaTXltOEU1ZmthUTlqK2M5aFN1SmZOMzc1?=
 =?utf-8?B?VktVQnA2VUFJMktPU0hSSVNyS3A1T1RnUHBieGFiMEVGYmMyYllzazVza3Nn?=
 =?utf-8?B?OExvQ0JyYzdreG1pcCtGWVhWNlRYZVFianM1QmtJZDdQa29jWWVxeW1QeGNM?=
 =?utf-8?B?cGRIMkIwK25hTXZiYVRQZk51NHpxQTlkY1ZnYU9JNCtrZFJibVR0eG41bnp4?=
 =?utf-8?B?aTdtMzM2SVY1azVWaklKazJjV0h5UFhtc0MxYlpVQk52ZWt3Qitoak95MlJZ?=
 =?utf-8?B?Y3Jaa2YzR3FhYnkvU0pvYlJCMlFXVGFaZW1QMjEwNFIzQ3hzeFdpM1c1bCs1?=
 =?utf-8?B?MnNxVnlHWldTQ25kc1h1bnAveEVMYStVTmxzdkUwVkpEQzhIYWpkMVV1UWxw?=
 =?utf-8?B?dXRBYlR4UEFNWDlZcDI2ZGZKOVZlOVozaFdlVE1kNGtTeDRmcUg0S0lXTmQ2?=
 =?utf-8?B?WFdkMGtTbklUdjBSNXlpVUNmSTRwd054enM4VEZuWDl3TElmL21RMERsNWJF?=
 =?utf-8?B?cklZRFlGWS9zSVFRd0xPMDdUY294bGV0SXFZaGNZUEh2bUZqTmJuUW5RQTFE?=
 =?utf-8?Q?1aG93Q?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Sm4vc0haRzZKK3V3V1ZWVVB2b1ZocXBoRjVaTWpsdWFXMUlsQ3VqbHltWXNE?=
 =?utf-8?B?R1o2a2pLcGZ4WnVqRThRV1llQlRyVk9GQytpcXJRTnpkcmh3bTlXRXNocklw?=
 =?utf-8?B?VTJRZS9nZlJaaUUvYVRqNmNvV3hTdk0xbXNCMTh4d2FNOHVXbU4xR0RIUVB3?=
 =?utf-8?B?ZTN6YXFFY29MSlQ4cFd5WUxEeWVXVitPK2tXdENmblU3UXNDemc4Z1ZtdjND?=
 =?utf-8?B?cUVYN093YU1UbHRob29HMmlNdHdUQnJRdWlwN0o5NG9tZ0hKSUdweTBqZEhm?=
 =?utf-8?B?Yis1QUx1MGJVRGIxaHllbms2ZHhmNUtMRnEycXgwSlB2dFY1bEt6cU53L3Bw?=
 =?utf-8?B?cHE0UVpiZkNZcDRlbUF4clpHSForWFZLMW9FTisxOTVlV21ma2U4K0pnbWVq?=
 =?utf-8?B?WW5tS1QySWVCNHFMTWNQMC9MdzE3VzB5bGRveXhPOW9ORmtrWDNBa3Q3aElT?=
 =?utf-8?B?SXV1eVZxVllZelZnMVBaSmF4WnB0OWdHdEp4WTN4RjhqS1VHeVdibkdlZDc3?=
 =?utf-8?B?Unc5bWtXaktxK3E3STNmYnZHT0xvNGtEbG5zYTZGT2EyV1VKRjNkaWNKMDZ5?=
 =?utf-8?B?ajU0dVU3dlBXV3RES2YwNDZZV2hBU0lrNTlpUEZtOTFmSlZna00zc3QrL0xt?=
 =?utf-8?B?R3h1dDNOZFYxVmRub1UxbXVndkJvWndpcnNEMEhmR0ZLd0hLSU0wZ2tOMDdS?=
 =?utf-8?B?WklkVFlEM3hueHR0RkEya0R1bEw0SFU4cWM5MVBCbURrODVyOTMvcmU5bUpY?=
 =?utf-8?B?azhjcndncDhrRmMzdkdWdkhmbEhHNmN2d1g2Ynk0MnlweTVvVXBMZ3o0TTg3?=
 =?utf-8?B?UVVUSmFXenp6ckVDVlFkK3VoM2F3MXN2TENFTGJjY2FvYWJ3WXFtMXptbHl6?=
 =?utf-8?B?NU9adUJ1d3R0YmNoR216Z3FoRnFYdE5tZEN6WEpTbGlsR1BNZmJpcWlZaXF6?=
 =?utf-8?B?VWpjNzhJUitDMFBCYmlzbzZtQ2k3N01Sc0dWUnI4VkliVFFTaDBrakUwZGlh?=
 =?utf-8?B?dnRGU0VadlZVQURPaDE0dzg0eDFGVG9tNkFHZFJCb2dxRll0RC96N1E3UFZD?=
 =?utf-8?B?R1NIYnBtblZ4bElhcjFWOTA1M0RPU0tMeXdPZjNabXBLUzNhQmUySVkyU1Zq?=
 =?utf-8?B?UFduMUsybkRCN2JBMlB2YWVUVlhzL0E1NVlXOHUvSU9uci94K3k4TFZFVndN?=
 =?utf-8?B?Z0g0MDdxTC85YUk1WjF4K2k4Rld1c2REWHozMk9NUnBXblRDYVd5bHZqQ1RG?=
 =?utf-8?B?VmhYU3hZUmNISW9td0NoMU0vOURuZ2JhOFJWSmw1anN2VHVkZlk2VTIvMDhw?=
 =?utf-8?B?M0RoWkQ3ai9NYnl5b3d1Q0FxQ0FGTU1qV084OUpXdHgrQ293VENpeUdybG1k?=
 =?utf-8?B?cjArYWFnZVRjNlpKcFNrdGtLUEd1cHV5dzVrUUdKa0t6OXBJRnh0SkNWMWc2?=
 =?utf-8?B?Qm9kYkJhenhHN0hyVnE0d00xTnlNL1U2QzM1eU9ld1BVbVdhZ2VuM2VVNVox?=
 =?utf-8?B?WGt2emxKbEdaejd4UWpRQmpnRi90SEw3bS9mYWsyUnM1dGFhZ2JJU3VHZEt2?=
 =?utf-8?B?Sm90eXNmZ2lldjBydGVtYTdNV2VHd0pnNGdSRncyZFUydXFBakhGcUkxcm9u?=
 =?utf-8?B?dk9USGl1aXZxdzNZWVhud1pmbjVzK2VuZ2h3NVRnUmJGM1g0MG8zR1VmNTM5?=
 =?utf-8?B?MVQ2WFNxQWFzaHEvV2JTRWRtWTZoTzNkL1F1ODRZUTJoSWtaODY4MkF2Vzhu?=
 =?utf-8?B?RVBWNXJWWi83ckxFbUEzVlRMbjBnV0x5dDZUNUxNVkxMTlBSdU5LUmM0SUZF?=
 =?utf-8?B?UnRnTkhORncrSUZJQVEwOWY0aUtiSVZ1UEtIOTk0K1ZkTFBrTWJWM2VOdW5i?=
 =?utf-8?B?MDB2cGtFYmpCVUo3RWt3KzliRnJqcmRPSlVyajRyMVJjL2ZpVnl5Y2xLM3hL?=
 =?utf-8?B?R3VhQ24wVlFaUnAvVXYxRGxFaEZXYnFoeFNVQmZUWG9hTTkrZEhKOTFiUWZM?=
 =?utf-8?B?U1FJZElmYlQ4aE5tTFBVRjlWbDFCU25XdzZpN25HRVdKYmQ5Qk05WjVyTFZr?=
 =?utf-8?B?SzQwTlI5akc5RVJaclhCVWlZemc0aUk3UDdqbklWNnR1SFFvVjYrUTVsblNH?=
 =?utf-8?B?OEwyNWI5a1FRZUJseDFPbTc0Nk1KbTl0c2dvMnJwTjF0VjNmbnlFZW1vZzQ3?=
 =?utf-8?B?R2ovNVpXNWFlZERKM0lzU1E5NTB5bFQxMWJZbThKR2oxblJTRFU1K0xqVnpy?=
 =?utf-8?B?UVlySjZna2puMG1GYVNsRUtZYi9HaFd0QTNaenlhWDdhTWh1bnJNeXBRMktG?=
 =?utf-8?B?V25yNUVxS0lNV3NvL3N4QmlGNEUyeWh5bjJISnhhTHF1RngxNTkvQUtLcVJP?=
 =?utf-8?Q?hmMx2uZnDQtJLGfo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5F0EE00AA70ECB45A352B0A89F7777C5@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53a6b0c1-2515-4527-8b98-08de51f52598
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2026 16:10:47.2260
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p5vSvyD9k0394bDFv7L0cEktVmOfjvTFFED01UnCjaZASpF7x9LSuThk6QDyGCoF/vgr+uiDQAN2HpvYs9jBolDejJMwSRaljWu2sjilPmk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7732

DQoNCk9uIDEyLzAxLzIwMjYgMTc6NTYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMi4wMS4y
MDI2IDE2OjU0LCBPbGVrc2lpIE1vaXNpZWlldiB3cm90ZToNCj4+DQo+PiBPbiAxMi8wMS8yMDI2
IDE3OjQwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+PiBPbiAxMi4wMS4yMDI2IDE2OjE2LCBPbGVr
c2lpIE1vaXNpZWlldiB3cm90ZToNCj4+Pj4gT24gMDYvMTEvMjAyNSAxMjowOSwgSmFuIEJldWxp
Y2ggd3JvdGU6DQo+Pj4+PiBPbiAwMS4xMS4yMDI1IDEyOjU2LCBPbGVrc2lpIE1vaXNpZWlldiB3
cm90ZToNCj4+Pj4+PiBAQCAtODI3LDcgKzgyOCwzMiBAQCBsb25nIGRvX2RvbWN0bChYRU5fR1VF
U1RfSEFORExFX1BBUkFNKHhlbl9kb21jdGxfdCkgdV9kb21jdGwpDQo+Pj4+Pj4gICAgICAgICBj
YXNlIFhFTl9ET01DVExfdGVzdF9hc3NpZ25fZGV2aWNlOg0KPj4+Pj4+ICAgICAgICAgY2FzZSBY
RU5fRE9NQ1RMX2RlYXNzaWduX2RldmljZToNCj4+Pj4+PiAgICAgICAgIGNhc2UgWEVOX0RPTUNU
TF9nZXRfZGV2aWNlX2dyb3VwOg0KPj4+Pj4+ICsgICAgICAgIGludCByZXQxOw0KPj4+Pj4+ICsN
Cj4+Pj4+PiArICAgICAgICAvKg0KPj4+Pj4+ICsgICAgICAgICAqIEFkZCBjaGFpbmVkIGhhbmRs
aW5nIG9mIGFzc2lnbmVkIERUIGRldmljZXMgdG8gc3VwcG9ydA0KPj4+Pj4+ICsgICAgICAgICAq
IGFjY2Vzcy1jb250cm9sbGVyIGZ1bmN0aW9uYWxpdHkgdGhyb3VnaCBTQ0kgZnJhbWV3b3JrLCBz
bw0KPj4+Pj4+ICsgICAgICAgICAqIERUIGRldmljZSBhc3NpZ24gcmVxdWVzdCBjYW4gYmUgcGFz
c2VkIHRvIEZXIGZvciBwcm9jZXNzaW5nIGFuZA0KPj4+Pj4+ICsgICAgICAgICAqIGVuYWJsaW5n
IFZNIGFjY2VzcyB0byByZXF1ZXN0ZWQgZGV2aWNlLg0KPj4+Pj4+ICsgICAgICAgICAqIFRoZSBh
Y2Nlc3MtY29udHJvbGxlciBEVCBkZXZpY2UgcHJvY2Vzc2luZyBpcyBjaGFpbmVkIGJlZm9yZSBJ
T01NVQ0KPj4+Pj4+ICsgICAgICAgICAqIHByb2Nlc3NpbmcgcHJlc2VydmluZyByZXR1cm4gY29k
ZSBhbmQgZXhwZWN0ZWQgdG8gYmUgZXhlY3V0ZWQgZm9yDQo+Pj4+Pj4gKyAgICAgICAgICogYW55
IERUIGRldmljZSByZWdhcmRsZXNzIGlmIERUIGRldmljZSBpcyBwcm90ZWN0ZWQgYnkgSU9NTVUg
b3INCj4+Pj4+PiArICAgICAgICAgKiBub3QgKG9yIElPTU1VIGlzIGRpc2FibGVkKS4NCj4+Pj4+
PiArICAgICAgICAgKi8NCj4+Pj4+PiArICAgICAgICByZXQxID0gc2NpX2RvX2RvbWN0bChvcCwg
ZCwgdV9kb21jdGwpOw0KPj4+Pj4gV2h5IHdvdWxkIHRoaXMgbm90IGJlIHRoZSBpbml0aWFsaXpl
ciBvZiB0aGUgbmV3IHZhcmlhYmxlPyAoSSBhbHNvIGRvbid0IHRoaW5rDQo+Pj4+PiB0aGF0IHdl
J3ZlIGRlY2lkZWQgdG8gcGVybWl0IHZhcmlhYmxlIGRlY2xhcmF0aW9ucyBhdCBvdGhlciB0aGFu
IHRoZSB0b3Agb2YNCj4+Pj4+IHNjb3BlcyBvciB3aXRoaW4gZS5nLiBhIGZvcigpIGxvb3AgY29u
dHJvbCBjb25zdHJ1Y3QuKQ0KPj4+Pj4NCj4+Pj4gKw0KPj4+Pj4+ICAgICAgICAgICAgIHJldCA9
IGlvbW11X2RvX2RvbWN0bChvcCwgZCwgdV9kb21jdGwpOw0KPj4+Pj4+ICsgICAgICAgIGlmICgg
cmV0IDwgMCApDQo+Pj4+Pj4gKyAgICAgICAgICAgIHJldHVybiByZXQ7DQo+Pj4+PiBXaHkgd291
bGQgeW91IGludm9rZSBib3RoIGluIGFsbCBjYXNlcz8gSWYgc2NpX2RvX2RvbWN0bCgpIGhhbmRs
ZWQgdGhlIHJlcXVlc3QsDQo+Pj4+PiB0aGVyZSBpc24ndCBhbnkgcG9pbnQgaW4gYWxzbyBpbnZv
a2luZyBpb21tdV9kb19kb21jdGwoKSwgaXMgdGhlcmU/IE9yIGVsc2UgaXMNCj4+Pj4+IHRoZXJl
IG1heWJlIHNvbWUgY3J1Y2lhbCBhc3BlY3QgbWlzc2luZyBmcm9tIHRoZSBkZXNjcmlwdGlvbiAo
b3Igbm90IGV4cGxpY2l0DQo+Pj4+PiBlbm91Z2ggdGhlcmUgZm9yIGEgbm9uLVNDSSBwZXJzb24g
bGlrZSBtZSk/DQo+Pj4+Pg0KPj4+Pj4gQWxzbyB0aGlzIGRvZXNuJ3QgbG9vayB0byBmaXQgdGhl
IGRlc2NyaXB0aW9uIHNheWluZyAiVGhlIFNDSSBhY2Nlc3MtY29udHJvbGxlcg0KPj4+Pj4gRFQg
ZGV2aWNlIHByb2Nlc3NpbmcgaXMgY2hhaW5lZCBhZnRlciBJT01NVSBwcm9jZXNzaW5nIC4uLiIN
Cj4+Pj4+DQo+Pj4+IFdlIGNhbGwgYm90aCBiZWNhdXNlIFNDSSBhbmQgSU9NTVUgY292ZXIgZGlm
ZmVyZW50IGNvbmNlcm5zIGFuZCBhIERUDQo+Pj4+IGRldmljZSBtYXkgbmVlZA0KPj4+PiBib3Ro
OiBTQ0kgZm9yIEZXLW1lZGlhdGVkIGFjY2VzcyBjb250cm9sIChwb3dlci9jbG9ja3MvcmVzZXQp
IGFuZCBJT01NVQ0KPj4+PiBmb3IgRE1BIGlzb2xhdGlvbi4NCj4+Pj4gU0NJIHJldHVybmluZyBz
dWNjZXNzIGRvZXMgbm90IG1lYW4gdGhlIElPTU1VIHdvcmsgaXMgcmVkdW5kYW50Lg0KPj4+IENh
biB0aGUgY29tbWVudCB0aGVuIHBsZWFzZSBiZSB1cGRhdGVkIHRvIHByb3Blcmx5IGNhbGwgb3V0
IHRoaXMgZHVhbA0KPj4+IHJlcXVpcmVtZW50Pw0KPj4gWWVzLCBmb3Igc3VyZS4NCj4+Pj4gLSBz
Y2lfZG9fZG9tY3RsKCkgcmV0dXJucyAtRU5YSU8gd2hlbiBpdCBoYXMgbm90aGluZyB0byBkbyAo
bm9uLURULCBubw0KPj4+PiBtZWRpYXRvciwgbWVkaWF0b3IgbGFja3MgYXNzaWduIGhvb2spLg0K
Pj4+PiBUaGF0IGlzIHRoZSDigJxub3QgaGFuZGxlZCBieSBTQ0nigJ0gc2VudGluZWw7IGluIHRo
YXQgY2FzZSB0aGUgY29kZQ0KPj4+PiBwcm9jZWVkcyB0byBJT01NVSBub3JtYWxseS4NCj4+Pj4g
LcKgIFdoZW4gc2NpX2RvX2RvbWN0bCgpIHN1Y2NlZWRzICgwKSwgdGhlIGRldmljZSBtYXkgc3Rp
bGwgcmVxdWlyZSBJT01NVQ0KPj4+PiBwcm9ncmFtbWluZw0KPj4+PiAoZS5nLiwgRFQgZGV2aWNl
IGhhcyBhbiBpb21tdXMgcHJvcGVydHkpLiBTa2lwcGluZyBpb21tdV9kb19kb21jdGwoKQ0KPj4+
PiB3b3VsZCBsZWF2ZSBETUEgaXNvbGF0aW9uIHVucHJvZ3JhbW1lZC4NCj4+Pj4NCj4+Pj4gVGhl
IGZpbmFsIGlmIChyZXQxICE9IC1FTlhJTykgcmV0ID0gcmV0MTsgZW5zdXJlcyB0aGF0IGlmIGJv
dGggcGF0aHMgcmFuDQo+Pj4+IGFuZCBJT01NVSBzdWNjZWVkZWQsDQo+Pj4+IGFuIFNDSSBmYWls
dXJlIGlzIHN0aWxsIHJlcG9ydGVkIHRvIHRoZSBjYWxsZXIuDQo+Pj4+DQo+Pj4+IERldmljZS10
cmVlIGV4YW1wbGVzIHRvIGlsbHVzdHJhdGUgdGhlIGR1YWwgcm9sZXM6DQo+Pj4+IDEuIEFjY2Vz
cy1jb250cm9sbGVkIERUIGRldmljZSAobm90IG5lY2Vzc2FyaWx5IElPTU1VLXByb3RlY3RlZCk6
DQo+Pj4+DQo+Pj4+IGkyYzM6IGkyY0BlNjUwODAwMCB7DQo+Pj4+ICAgIMKgwqDCoCBjb21wYXRp
YmxlID0gInJlbmVzYXMscmNhci1nZW4zLWkyYyI7DQo+Pj4+ICAgIMKgwqDCoCByZWcgPSA8MCAw
eGU2NTA4MDAwIDAgMHg0MD47DQo+Pj4+ICAgIMKgwqDCoCBwb3dlci1kb21haW5zID0gPCZzY21p
X3BkIDU+O8KgwqDCoMKgwqAgLy8gRlctbWFuYWdlZCBwb3dlciBkb21haW4NCj4+Pj4gICAgwqDC
oMKgIGNsb2NrcyA9IDwmc2NtaV9jbGsgMTI+Ow0KPj4+PiAgICDCoMKgwqAgY2xvY2stbmFtZXMg
PSAiZmNrIjsNCj4+Pj4gICAgwqDCoMKgIGFjY2Vzcy1jb250cm9sbGVycyA9IDwmc2NtaV94ZW4g
MD47DQo+Pj4+ICAgIMKgwqDCoCAvLyBubyBpb21tdXMgcHJvcGVydHk6IFNDSSBtYXkgbmVlZCB0
byBhdXRob3JpemUvcG93ZXIgdGhpcyBkZXZpY2U7DQo+Pj4+IElPTU1VIGhhcyBub3RoaW5nIHRv
IGRvDQo+Pj4+IH07DQo+Pj4+DQo+Pj4+IDIuIElPTU1VLXByb3RlY3RlZCBEVCBkZXZpY2UgdGhh
dCBzdGlsbCBtYXkgbmVlZCBTQ0kgbWVkaWF0aW9uOg0KPj4+PiB2cHU6IHZpZGVvQGU2ZWYwMDAw
IHsNCj4+Pj4gICAgwqDCoMKgIGNvbXBhdGlibGUgPSAicmVuZXNhcyxyY2FyLXZwdSI7DQo+Pj4+
ICAgIMKgwqDCoCByZWcgPSA8MCAweGU2ZWYwMDAwIDAgMHgxMDAwMD47DQo+Pj4+ICAgIMKgwqDC
oCBpb21tdXMgPSA8JmlwbW11IDAgMD47wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8vIG5lZWRz
IElPTU1VIG1hcHBpbmcgZm9yIERNQQ0KPj4+PiBpc29sYXRpb24NCj4+Pj4gICAgwqDCoMKgIHBv
d2VyLWRvbWFpbnMgPSA8JnNjbWlfcGQgNz47wqDCoMKgwqDCoCAvLyBGVy1tYW5hZ2VkIHBvd2Vy
L2Nsb2NrL3Jlc2V0DQo+Pj4+ICAgIMKgwqDCoCBjbG9ja3MgPSA8JnNjbWlfY2xrIDM0PjsNCj4+
Pj4gICAgwqAgwqAgYWNjZXNzLWNvbnRyb2xsZXJzID0gPCZzY21pX3hlbiAwPjsNCj4+Pj4gICAg
wqDCoMKgIGNsb2NrLW5hbWVzID0gInZwdSI7DQo+Pj4+IH07DQo+Pj4+Pj4gLS0tIGEveGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvZGV2aWNlX3RyZWUuYw0KPj4+Pj4+ICsrKyBiL3hlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoL2RldmljZV90cmVlLmMNCj4+Pj4+PiBAQCAtMzc5LDYgKzM3OSwxMiBAQCBp
bnQgaW9tbXVfZG9fZHRfZG9tY3RsKHN0cnVjdCB4ZW5fZG9tY3RsICpkb21jdGwsIHN0cnVjdCBk
b21haW4gKmQsDQo+Pj4+Pj4gICAgICAgICAgICAgICAgIGJyZWFrOw0KPj4+Pj4+ICAgICAgICAg
ICAgIH0NCj4+Pj4+PiAgICAgDQo+Pj4+Pj4gKyAgICAgICAgaWYgKCAhZHRfZGV2aWNlX2lzX3By
b3RlY3RlZChkZXYpICkNCj4+Pj4+PiArICAgICAgICB7DQo+Pj4+Pj4gKyAgICAgICAgICAgIHJl
dCA9IDA7DQo+Pj4+Pj4gKyAgICAgICAgICAgIGJyZWFrOw0KPj4+Pj4+ICsgICAgICAgIH0NCj4+
Pj4+PiArDQo+Pj4+Pj4gICAgICAgICAgICAgcmV0ID0gaW9tbXVfYXNzaWduX2R0X2RldmljZShk
LCBkZXYpOw0KPj4+Pj4+ICAgICANCj4+Pj4+PiAgICAgICAgICAgICBpZiAoIHJldCApDQo+Pj4+
PiBIb3cgYXJlIERUIGFuZCBQQ0kgZGlmZmVyZW50IGluIHRoaXMgcmVnYXJkPw0KPj4+PiBQbGVh
c2UgZmluZCBleGFtcGxlcyBhYm92ZS4NCj4+PiBTb3JyeSwgYnV0IEkgY2FuJ3Qgc3BvdCBhbnl0
aGluZyBQQ0ktaXNoIGluIHRoZSBleGFtcGxlcyBhYm92ZS4gVGhlbiBhZ2FpbiBJDQo+Pj4gYWxz
byBubyBsb25nZXIgcmVjYWxsIHdoeSBJIGNvbXBhcmVkIHdpdGggUENJIGhlcmUuIE9oLCBwZXJo
YXBzIGJlY2F1c2UgdGhlDQo+Pj4gUENJIHNpZGUgaXNuJ3QgYmVpbmcgbW9kaWZpZWQgYXQgYWxs
Lg0KPj4+DQo+PiBDb3JyZWN0LCBwY2kgY29kZSB3YXNuJ3QgdG91Y2hlZCBieSB0aGVzZSBjaGFu
Z2VzLg0KPiBZZXQgbXkgcXVlc3Rpb24gYm9pbHMgZG93biB0byAid2h5Iiwgbm90ICJ3aGV0aGVy
Ii4NCj4NCj4gSmFuDQpJIGhhdmUgcmV2aWV3ZWQgdGhlIHByZXZpb3VzIHZlcnNpb25zIG9mIHRo
ZSBwYXRjaCBzZXJpZSBhbmQgY291bGQgbm90IA0KZmluZCBhbnkgcXVlc3Rpb25zIHJlbGF0ZWQg
dG8gUENJIHByaW9yIHRvIHRoaXMgc2VyaWVzLiBUaGVyZWZvcmUsICJIb3cgDQphcmUgRFQgYW5k
IFBDSSBkaWZmZXJlbnQgaW4gdGhpcyByZWdhcmQ/IiBhcHBlYXJzIHRvIGJlIHRoZSBmaXJzdCAN
CnF1ZXN0aW9uIGNvbmNlcm5pbmcgUENJLg0KDQpCUiwNCk9sZWtzaWkuDQo=

