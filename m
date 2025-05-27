Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8130BAC49F8
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 10:15:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997920.1378706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJpRt-0006dV-DU; Tue, 27 May 2025 08:14:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997920.1378706; Tue, 27 May 2025 08:14:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJpRt-0006b5-Ap; Tue, 27 May 2025 08:14:13 +0000
Received: by outflank-mailman (input) for mailman id 997920;
 Tue, 27 May 2025 08:14:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5H65=YL=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uJpRr-0006au-DY
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 08:14:11 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20608.outbound.protection.outlook.com
 [2a01:111:f403:260e::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9037a8e3-3ad2-11f0-a2fd-13f23c93f187;
 Tue, 27 May 2025 10:14:08 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PAVPR03MB9600.eurprd03.prod.outlook.com
 (2603:10a6:102:30f::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Tue, 27 May
 2025 08:14:04 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%4]) with mapi id 15.20.8769.022; Tue, 27 May 2025
 08:14:04 +0000
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
X-Inumbo-ID: 9037a8e3-3ad2-11f0-a2fd-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rVzIuSq6wNJ6WoPCz+F2RThux3S8bCVpXN9jcbYF4hHX44xZuONR/sk3+DiXPpHNyfYrJc5HX7wiU2d4RfK80662i1ESrpL2rC4IrFNxWHlaUTfafcBR2ZXIHnTzeC8eEls56tYGl7u+CjE5kD2q5csrvrLwGiMH7EGfYd1lGu9MRkdZfRqoCTzO28tpYBMT0jcdp9yUN80I0kBf5f6AJBVI6T2o0S1vML3qOUUg3b8f6RidrvGT8vIg9O8mJKYHyhu0HEcTeWC099uOXtbP/l7YvJE9v2tnNdDLPwHGuy8pr5iPRrIntukUNcJjJZmEqyrzy0aA5Ika/fkgoVqh5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3mGVgixyFqAjabOC8dXkIkUxj2XKxnmKxYam2jZBwt8=;
 b=UrY4QEp5kdEoU2DrKyDiq9PvMDyB+ryyzymxCakP9Mxi0s2/19AdZTYhQVRT96N9Kcn2ITiLF2bJux/HxRsYWUpIkaJkDxyAOig6pJrKOaQXeaAQlNopnf5OtnyWsdzQfH6d3XNjqPAT/gYuSH7y8RaHXhzS97RYg0YoE5R1YNKIsMlRq8xe8FAtL4mooadGjzoCUYKzdcxrJXdzqFi42Jijj7Nm/99j36bNZJCnnGDuXf4eqOq2T+14Wa8b0Z0akQ+yNSK+QE02yCcJM3zOO3ZUNlO4rFmIDZkHD2nq7Pp5ONHjRfrpeIa+Nx7M/3KI4lKGvhz3tPCYjMlg63f8wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3mGVgixyFqAjabOC8dXkIkUxj2XKxnmKxYam2jZBwt8=;
 b=Hyp4OQOMHoF+uR2BQ4jzGnH3/uxfb3s9kNprBx6PAEzEvHFktD1NUwkaldbJhhYly30QQPB8xlUtvXxtl19uE8YFj5wy+O6tcl98NyM5zlKZz47rspsoVfG5ocdmumDHmvUc9ILBhlXle0lHx5NC49ZWzDgnuc01EMYZeeoqdpwT6FMjnIGRH2nSkO+zwyjCiEFc6h6y6xIuiIjFeqz+I/otN/GHZNnGtgO2lVCr2kmeMDraOtOFYyI2xEuHJEpsVhqdgtdEBqNa3yPyT9TldzWgBwyGOgvAAQMadSU3dM3gShkaTweQ+qowVZv1eDMvpRWmeHDqeLtbK68yJFpprA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v10 6/7] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
Thread-Topic: [PATCH v10 6/7] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
Thread-Index: AQHbuP0k0QR8aqz5V029F3Jm2fq6qrO6kBmAgCu8ioA=
Date: Tue, 27 May 2025 08:14:03 +0000
Message-ID: <f1a9fc2a-1920-458e-b707-75e6fe8420d1@epam.com>
References: <cover.1745918678.git.mykyta_poturai@epam.com>
 <ef583aaae0a311ac8fec8fe4f18e76e9d62432ca.1745918678.git.mykyta_poturai@epam.com>
 <c40af488-b706-472b-ba89-50b856ccce37@suse.com>
In-Reply-To: <c40af488-b706-472b-ba89-50b856ccce37@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PAVPR03MB9600:EE_
x-ms-office365-filtering-correlation-id: 06167b80-ff67-4d06-6d15-08dd9cf671df
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?d2owS1RpbHp1ekRHQnZXMDlQU0hPTWRhRTVyeG92UTB0SUtkZkZwb0dwSUhy?=
 =?utf-8?B?a2VobnpLcEhQSUM4UTNEUlNZUkIrcW4ycFR0dUs1U0dOV3hsdFpXUkdJRmp6?=
 =?utf-8?B?L08zcVlSdlN2eVI5TEYwZUdTU2VUb3RYekhodm9TQlY2azFtNk80cE9GZ3VU?=
 =?utf-8?B?Z3NsbnExWFdWYlBzUUFEcmIyM1AvbXdTdGtTS2dSREE2bTBXRU9ibHdTbDZN?=
 =?utf-8?B?ek1scEc5dExuZ0tGUEpGVHd6Yjd6aFR4Vzl3Nmk3cFZRQ25YalFNVE9qbkdT?=
 =?utf-8?B?SU54Ym00VzRuNFVuOVphcVltdkpJUXhsYlkyMEVvZE11OUNXaUJkRnFVWDNL?=
 =?utf-8?B?WERMR3pNS3RwNDdxb2lpNHMvdkxyR25LWmNUUStRYWxtWG9yNFNFVDY3ZHR1?=
 =?utf-8?B?d1krbVFySWVQZjFHWTFkZHZOUXRXVWFyQzdSMEpYam1MK0RLZ1NLRExQY3I1?=
 =?utf-8?B?NkxMZndKUGJJWTkxVm1pVTlaYkZWYU5iN1QzcEJOVDhEMlpHRzBPbWxYamdx?=
 =?utf-8?B?SVVhTWdoQ2RmbEJsdERBM0krd2VaOGxNK3FDRXZXQjBCN1ZUaisxMXBCeitr?=
 =?utf-8?B?L3BJbVoyY1Y4QjhMa0h2UTBzakVRdCtlTEFBWHVxeWxXM2tpSm5qWmI3ek5D?=
 =?utf-8?B?V0kvbG9XMGlTN3gzZStDSzFNVWxJWTB6M2xhVFVQV1drdFQ1Wmhlakc3N3Vr?=
 =?utf-8?B?Uy9QVG1QanJWM2MvTVNwYVN1MXl6d29vVEo1VjdqLy9JMEJlRU1laVZwbmhC?=
 =?utf-8?B?MGlnQ0wzbTNncFNabGhzeHc5dVFkOTNaaWh6TTQrdjMvczl1UFpvSWFMeWE5?=
 =?utf-8?B?eUZ6eDZBRzAyVUxVbysrL08wcnBOeGZWaDdFcyszS0VJYzBKQTBUWWNRREk5?=
 =?utf-8?B?YlZJN2xtUTB4REpKWE9ibGx2eG85eHVTL2EzMUc0Zlk4dXB3bW12OEU4NDcz?=
 =?utf-8?B?dXp5MHdLd2FKck91MzdWdFFBeFNodmZqR2YxZEtlK1dQTHdqd2JGdERiSkE3?=
 =?utf-8?B?Z0J6dDBEa3pKQU5Qdm5CQnB6ek5wVWpOQ3FZVFE4dFc1bFRHOVVvRmNBV3NJ?=
 =?utf-8?B?eDV6K29md3ZZWXdTRjlMcXpLUmZRaTJhYXFQdzlMckplZWI1NXJIbGFpWDlV?=
 =?utf-8?B?RW53dFZFdDRSQ1lGeW5tOGhLUkYxQ0QvQTlBZm5wUWZjdEpycUk5MGY0MTlP?=
 =?utf-8?B?bm1pK0M2VEZvaFlOVHBPOHRXZXlLeHMvclVEcnJISjdWUmxwVTQ2bEYydVlO?=
 =?utf-8?B?OCtYQlAyVkVqY2NYd251OHNQc2ZnYWtzN2ZUZ1k4dnUvNWU1VnVJRW1SdlY2?=
 =?utf-8?B?SHhraUdSQVN5eW0rbVpEU2lnNE1QaXhDWEdaTWtIelp5NWRnYjVSclR3aVZm?=
 =?utf-8?B?YkZKaUJwd0c3em1YOWJCWk1aWEJmbGswTUZnS3l0WDlKZmtFb0psTWovaE1F?=
 =?utf-8?B?K1NFdGJadG9JOUxIRm9JUVBpWDdIdyt3Nko2cEttZ2ZJL2MxbElqQ2pmVzNI?=
 =?utf-8?B?TGI0dXczY1A4aWVjTkVqWG9mYWQ5cFJKM3V3QjQvMkl3R3dlRHpSUWV1ckF5?=
 =?utf-8?B?UCs0T2pXZ3hTRE14NWNleEw5L0JDQzBDKzk4eHFXTXNsTWN1VDVjOWdTcUlv?=
 =?utf-8?B?bVQ2bEhQSHYrYytqd21HazlRYmo3dDNSdEIwOWpRVEJpZVIyM1VMbWUrNjgr?=
 =?utf-8?B?TWxIdHVMY05GYURyVkJ1TjlNUFZ2VEo4eGdWTURPRHAvUEYybS9jTUdWTktL?=
 =?utf-8?B?bmRRSHJWTDB0Z0RwdWZLTUI0UWtzZnRMdUlHdW1BQWIvVENqVGYyVjdIRTIw?=
 =?utf-8?B?TGtXZU1vdWJaK0lMR0M2ZEs5c1ZJQUVFNHJQK2tLOFZ3QVErcFlwd213bE5l?=
 =?utf-8?B?UkVLV1ZIUVN0eFdQcU5Kcm8wTndCejJjN3NUKzhlUGRMZ2NxZENLS3hVeTZK?=
 =?utf-8?B?Z1VlSUNWOGh2Nm1xTUpudnY5NGluZ2FmMS9DOVhHM3NaV1Qwa3RTOHdEQVlS?=
 =?utf-8?Q?M38k9DuyFn3hO/Ez30M+YUIZAukWCI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UDIzVU80MXJFYkpWWitwTTduWER2WWxob0hvMGo1TjcydDk3RlljOW5NTEZs?=
 =?utf-8?B?V09qWHpyQkdSbU04b3lNSFpNUE5TbWtsTERyU1Mva2xVVHN4NCsreEl4UHEx?=
 =?utf-8?B?T3RhaGxFRTRobmRBY2VQN0x0dzl5czJvMmtXdWQzb0cvNlN1SFo2MnZVSUhB?=
 =?utf-8?B?YjZJUlJ5YjdKbHJsTWtZVDd5K3VUanJGaDE4QmFuY2hFMC9wVnpqODZkTVhJ?=
 =?utf-8?B?WTBETWdyS2hDajFGVzhsOXZoUEhuSlA5eWc5cVVEdUZhZnBPYWtnSEJ2R2lC?=
 =?utf-8?B?NzR6d2QrT09wMXBNWm9BeGpRU3pIK3o2a2FyK1Rid01tM0MzZndyNkg4ZHcx?=
 =?utf-8?B?SVNZZlhkR2dHVkMrSkVYbUxNZ1ZhRzBDK2VEcjdVNmlES3ljaVZlT3ZOZGl6?=
 =?utf-8?B?cWlJYy9STEdQdzFVRVlnWS9LVXlIc3k4Z1d1UjdKL1dBdWJGZWRZNFJUeE4w?=
 =?utf-8?B?dXdTWC9OVjcvRXRsenAweVlLdVY0ekxZcDVDVE9iNWZuWFIwZFdjeHVBZW9y?=
 =?utf-8?B?c0FzSDNJdVFPMldGaHIzT0xSY3czeUpFaXJkdnAxVFNVYytnLzQrR29NQlJm?=
 =?utf-8?B?T0FqT0traEpaOXpWbTNtRW9yTXNaUk9Zd3VURkxyL1dRajFpQTNsNlhmZE1q?=
 =?utf-8?B?bmRVeTVxckNiZTVkUENtL0Z6cUJ4RG1NR2U5b1hnT3JRcHVxclNVRktIekdQ?=
 =?utf-8?B?Y1YyRXdBVWpTUHdlc1VJUWd0OHZvckRRaWhGZmNUcFFwa1pQWWRSeFlOYjNE?=
 =?utf-8?B?WkRYZG50eSs4MSt3cjk4TnU1Wm9uTXE1UVFKcHZCVXNSVGdJVlMyRDBURUp5?=
 =?utf-8?B?ZGdKNUNWN2gvSUt0SHVoeWxzS1pWME1qQjhKTVliYlpjM2d1M09jMkdSRDBv?=
 =?utf-8?B?RVgzTnN2bjhoUk5hWXR1QzZZc1czSEhjd29JT0I3VXJwTHdObUJrZGpWTkp3?=
 =?utf-8?B?SzdLY3FDTGdmSzBLT1lMemI2eVZmTlU2K2lycWJxQzFKOFRYd3dvVWZzYnRU?=
 =?utf-8?B?d3FFU2FDT01rZ3lxei9PMjZjS21jcXJIWGVXRTNKZjlYbHprcGtPaUx5ZlRy?=
 =?utf-8?B?VnVHWnU4YlpUKzU4bk1Fd3ZoOGdrbXloaHpGWEgvNDk0dDdNSUNVT054T3lS?=
 =?utf-8?B?c2pQVWtKZ1oyNS8rVnQ4TE8rb0pnRU9YTCtQK0ZuRFBUc0dBUDZNd2pLSk9Q?=
 =?utf-8?B?U0Z3TjU1RHBtUXQxVHI0dGRrb1lVRnYrSFNqdmo5U2RId2RrcE5IdFhYQ0RE?=
 =?utf-8?B?dm1OUXh4TUQ2SWdVdXFPbnZQK083dVN4TzB5eW1FNThRdyt1MVBIRmlPQVB2?=
 =?utf-8?B?dmFaSkE4Z3NVMWJrbzJkdjgwNjhyWVZrM3NOVDdEU0tKbllsMXBBc0hvUEg4?=
 =?utf-8?B?N1AyUGpsWENkZlowVzdYNDZJSkw3U0Zqak0yaGQyR0JjMFZKbm5HNm5vdG5O?=
 =?utf-8?B?VVU2WGRHQkJ6SWdOd2gzRHE2WHp4blF2T285VFdkYmdmcjI1aXA1QWZpTDFs?=
 =?utf-8?B?NUR4eThDd256amNVNWh6eHJxV0dTZVB6UjhVaWlrUGZjQVlHL2JUTkdOc2FL?=
 =?utf-8?B?ZzhiT3N6OFNvQ1l5OE1lZDZBbTFTNElKOTA1QUZXem12WXVMUXo0T0hwUW9v?=
 =?utf-8?B?WnBVZHMrSWgwRjhUSUN6WHlCR0VTSllOUWFhazdveVlKUnFhNytxMDFtSEdq?=
 =?utf-8?B?ZHdHUW1IV3dNMHVPYkdIa2ZoVThQMzByMmU2YTVRQjRicVgwaE5hOW16aVF2?=
 =?utf-8?B?QU5jRXc3WnVDNUNjWGU0QmlESlcxMUhNVXlWWjB5ZUFPakliNHFkWkpuWmdF?=
 =?utf-8?B?bUxVWThhc0pYamVDaXJuc2p3UmozeGJGWnNSYnlTWDhOZTNhNHlSc21yc0lR?=
 =?utf-8?B?VzVtYzQvVEQ2d3ZMbFFTOWZ3WHo2WlJOMStBQVRMMFpIQUlXUlloS3NjbFhs?=
 =?utf-8?B?VnNRNm1BY1VaZ3B1QzVaZFJiSDl4cGlUNFdkbW1JOFJ2Vk04V291NXlZWm9T?=
 =?utf-8?B?OE1BMjNsUWI1Y1NEZy9ySWJlcDM4MXordEFTRmx3cFd0RU1tKytXMGo5SHZW?=
 =?utf-8?B?a3V0SWFFVk82SEVWaFVmbGI5TjlDTE8xOFZvOS9iR2dvK2g4LzBkbUVyZFpG?=
 =?utf-8?B?KzVCSUJrSnA4ZXVGSDE3cjJIK2c0bjhMSUhOaXVsdVBQVjNRRlJHQ0tXM0ZZ?=
 =?utf-8?B?WHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EFF20572BFC0424BAB93DF771F31C422@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06167b80-ff67-4d06-6d15-08dd9cf671df
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2025 08:14:04.2670
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XbzJL+ngI6vkz2NpclMIUU07KFWCBQAt6H/gQrokV9ZrBsII8a0FL2fMGW0dPOqzs3BTm+XvWenl+Sr58G/vzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9600

T24gMjkuMDQuMjUgMTU6MjAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyOS4wNC4yMDI1IDEz
OjUyLCBNeWt5dGEgUG90dXJhaSB3cm90ZTogDQo+IEkgZnVydGhlciBub3RpY2UgdGhhdCB5b3Ug
ZGlkbid0IGFkanVzdCB0aGUgInJlc2V0IiBzdWItb3AgaGFuZGxpbmcsIGRlc3BpdGUNCj4gbXkg
ZWFybGllciBoaW50IGluIHRoYXQgZGlyZWN0aW9uLiBMb29raW5nIGF0IHRoZSBjb21taXQgbWVz
c2FnZSwgeW91IG9ubHkNCj4gbWVudGlvbiBQSFlTREVWT1BfcGNpX2RldmljZV9hZGQgYW55d2F5
LiBJIHRoaW5rIGFsbCB0aHJlZSBuZWVkIG1lbnRpb25pbmcNCj4gdGhlcmUsIHdoaWNoIHdvdWxk
IHRoZW4gKGhvcGVmdWxseSkgY2xhcmlmeSB3aGF0IHRoZSBkZWFsIGlzIHdpdGgNCj4gUEhZU0RF
Vk9QX3BjaV9kZXZpY2VfcmVzZXQuDQo+IA0KPiBKYW4NCg0KUEhZU0RFVk9QX3BjaV9kZXZpY2Vf
cmVzZXQgZG9lc24ndCBjaGVjayBpZiBQQ0kgcGFzc3Rocm91Z2ggaXMgZW5hYmxlZCANCm9yIG5v
dCwgc28gdGhlcmUgaXMgbm8gcmVhc29uIHRvIGFkZCBzcGVjaWFsIGNsYXVzZXMuIEkgd2lsbCBh
ZGQgdGhpcyB0byANCnRoZSBjb21taXQgbWVzc2FnZSB0byBiZSBjbGVhci4NCg0KLS0gDQpNeWt5
dGE=

