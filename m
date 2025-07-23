Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71133B0EC86
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 09:58:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053421.1422183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueUNB-0005cC-7U; Wed, 23 Jul 2025 07:58:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053421.1422183; Wed, 23 Jul 2025 07:58:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueUNB-0005YK-1P; Wed, 23 Jul 2025 07:58:45 +0000
Received: by outflank-mailman (input) for mailman id 1053421;
 Wed, 23 Jul 2025 07:58:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3SBI=2E=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1ueUN9-0005W3-V4
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 07:58:43 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9ff0fa1-679a-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 09:58:42 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by PAXPR03MB8082.eurprd03.prod.outlook.com (2603:10a6:102:231::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 07:58:37 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8922.037; Wed, 23 Jul 2025
 07:58:37 +0000
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
X-Inumbo-ID: d9ff0fa1-679a-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oSFVsNNQp6TB1W3Mvjt5mbitUjCTmjuZWsFiaOzk3BXZadSivIYgIUE/UeeM16p6SxJPbrbp0i0EE/RVaGRLF9G4WUlRIaMZXTcOrOkj/ZmE0kKEbqi+Rhs91Mukrq0h2ECowhfWrc/dcIne4ZNMs7RSF8r/ntvki76ECZP5Yf21tI5iMpMdyXbG59IzED2VgYIjkfvcBJaB3k8gU+tMVd2WdPlzRuok0M9HWg/+A1EnYYBIuA0YptxYwS9n0ZWbbq/JJfFZC44rG0S/PtHBM4Ae55+7Ku55eV/WUqw5g7yiL+sTG57EJ7CLKJZ5okUCv1x6YTqMUXmtYfTzhOLeJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iGd8jpjjgbD+dfUi5Vkb27+4DiAea+M+ZupswyVR2nI=;
 b=zIfcOHCvpQSG2TMNUHQqcpUiKdVUSDvw62AsR4bZD7F1XlKjotjgSFRR9jVibPKZ9ILWFKZ8i6/DU/S54r4VHHXqrVpVGaEsTFBGY9+2mi7I7ALJL7Deac2VxKo3xpq9T2pho7B+HoBT5uvXia8eDsZLMk+GZdxKzCZL3xzPo0yGqhw239re9J/OQNS9S9LsTq5ZEchexw4DkeN5UWhhCerGSXNCV8Rr1ibPuDs89T+n/E5XVa+Emmw+hM7cpowf5AtrGafBPTaTVqh71qowSTVVQg1NsmFRZXlt+K/l+wlb3mkpfCKztWWqPZLqOvUT4rXAIoiupyga4QMiOFyR8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iGd8jpjjgbD+dfUi5Vkb27+4DiAea+M+ZupswyVR2nI=;
 b=iilMANqPrWt5zyj2+y7rCwzP82ibUx06JKYwyj+XRR7lXZmd805kgKmfB7ckqoy/CZ9wQL9PBnLFqFSh1wQ6zI7bW7Gjnqx0IYnMdknm9aNsUynSj1NdlyE1KF/n7k1UFGu7Kyj+epUQbcPuCBe3PwqtTVvrumeHlTbwhPCsm0bvRpB+T2iWPpMQDVci3h8Hkn5/cBeQ2i3JEOMvjUSernnhOMdv9mxWfkqnRxKJMuJWc8OeKKnN8eYDFkwRgDMqXddXMu+ti4y94Rz+m8T32pc998+YVMqzT/6/dOoJb4mFFWF7g0hXTyDekRWQsDme+dQGLdETqv1iDIPD98K4sQ==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Grygorii Strashko <grygorii_strashko@epam.com>
Subject: [XEN][PATCH 0/8] xen/arm64: make aarch32 support optional
Thread-Topic: [XEN][PATCH 0/8] xen/arm64: make aarch32 support optional
Thread-Index: AQHb+6eYwx4lPelweEyRazeHF5wQTA==
Date: Wed, 23 Jul 2025 07:58:36 +0000
Message-ID: <20250723075835.3993182-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|PAXPR03MB8082:EE_
x-ms-office365-filtering-correlation-id: 8c32a767-2b9e-4134-5e4e-08ddc9bebab9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?S2FRWE00RmJnTHpoa2hwVXJCYkhXQm1vUXNlcmxTRlEvbG81MGtWQWVUV2to?=
 =?utf-8?B?Ty9pZFFidjRhLzR0UmVDRi9OT3F3ZzZrYjBMczFhelkySzJDSHBaM1hPN2V6?=
 =?utf-8?B?bVpxNDk0QmsrNXpnOUFwZ3VyY201SjM1ZERUVXdkcVJiYmF1T05oNGZpVXdC?=
 =?utf-8?B?MXJKUmtzZGFJZWc0RnJ0WTdhY3BVc0d6alN5QVNrWURUTWZDdVMvTk1Fb1FG?=
 =?utf-8?B?dEV3SWZDUWZTbkNUNzFRNXdOWFhWZmpObk9WUXc1c3VvcEFidGlWZk5QMjM2?=
 =?utf-8?B?c1Bmam9rdlo0VGdSWGJTNFEvYWNwVXpuRU5DRlVjdm9OeS9Qbk5MYWJPOHVa?=
 =?utf-8?B?MnlXRjdmSFNQRGNFYTJGK2hFenk1WXg3Rk9MNVAzdk9ZOWg5SlFrN0c0dmFz?=
 =?utf-8?B?TUVHMTdYMHF1TkJmN0crT0FXOUZqVUhMbzRqVjRHcHFTRGhZekl4RFdJUDZo?=
 =?utf-8?B?SjBpT1BwSXBiaGJaZ0lhVnp3Zm9XalVIREswYXN1VmNyRm9lOGdFa2pxRCtK?=
 =?utf-8?B?dFpULzVBMEVmclpVZkI1S05mbDJFb2F2UC9lenZwSUhwNHlldjZWVUZyVlJ0?=
 =?utf-8?B?bkQ3QXFZQkJGaytrRjRUcW5aUk9QQmc1Skt0dXZpeDdVY0dOUGNEenBuYzl6?=
 =?utf-8?B?bXdQeWpXckxvd05oSUgxTWg3OGltMnBNMlZIcjh5OFZ0YndsRk5SY2V4bkQx?=
 =?utf-8?B?L1l1MDk1Y01HNnhlb3FFUk5tZzI5U3dReUU5VFR2VFgva2h4V0NmTU51VlZp?=
 =?utf-8?B?U2xXTVlyZm9Xam1wdkFCdXVmaFJpanQrcG5KWGNqYThzbE5Kb2VHbUlyOHU1?=
 =?utf-8?B?Y1d6NDN0ODArUEVjZHJyS0RRRWdNUjU1c2FhcHpwTlV1dXYxWFJkcHgwVDk2?=
 =?utf-8?B?b2xLQUszdkhVSlVvOFQxV2dRMDczMWZRZGtUcnp6V0d5QjVMSEdXcmpVOTFK?=
 =?utf-8?B?VDVJMVpqaHowQW1OTTFoMXpyYjIyb0Y1RDdGcmJxU2twY25lem5oL2FjbEd3?=
 =?utf-8?B?SlgzR0k4YUk2YU5kVzJDbHoyclRkQzdKakUwWU1iWmlKQ3FnOSs0TUZGS2Ro?=
 =?utf-8?B?Mm9PcFk2d3lhdVZ2dGpMQ29VU3Z4cHR5L3l5K0VPOXhCeXV4L24rb1UwQ1Ri?=
 =?utf-8?B?QmNwS1E3R0RaNXdzMW5nWjdFQzVpcXBLYUk0NnJ2aG41WTJnTlROVVFNUHdK?=
 =?utf-8?B?Sm9ZMC8rU1dQakJEL203TVpxZVJhOXIrWVVNdks1V291aVVybmJKS21nVys5?=
 =?utf-8?B?M0pqdlhUTWVBa3FCVGdXMGc0aW1hMzBDNmliU3VhZlAzVW9ZYVAyV2dPU0o2?=
 =?utf-8?B?ZXR2TDlSTGtPUVJjR3lMK0lrTGtiNlNlY2NINGNZRGltMnRiRVFNc0NnZHBV?=
 =?utf-8?B?OGp3Y003TnpndUd1S0JIZTNSb3pnUTBKZkVqWFhoRGROekpBQjVxR1JPMkp6?=
 =?utf-8?B?Mnd1U3IzaithUExuaUtnK2pDd3pOK1FHNDhxZW5qZkt3amxOWjM4TEgxQzRp?=
 =?utf-8?B?ZWpCTUxuTEJGMjNYWDhWNjk5VDFkQ01VQWV4R0pOSXJPVUVUN1BiVVkyVmxL?=
 =?utf-8?B?bGpKWC9mRWczdEQ3ODF4ZmcyR0QwZHE4Uk43cURRWGxaUDdJaDJ0THAwamV6?=
 =?utf-8?B?RmlRQXVwUGp0UkMreHk0cmpVbXJOTjkwYm9YcUhEREJaelg0dkdJS1hrMU0w?=
 =?utf-8?B?anRSUWJWU3JJZzJSYnh2VnBzTFo1T2p6cWUwU1pVN21TUjNrT1BQNnpIbkpj?=
 =?utf-8?B?VktWNE1SaW1ndmtSNTQzR3VLWUIvcmx2QjlUZnBRaVZJUUdKQkhTaTRTZ2Ra?=
 =?utf-8?B?Sm85aDhlcStwdm42emtnOW1ud0VndzRUdVcrRG1iUDNpaWdhcGxVYzhxRlJj?=
 =?utf-8?B?VzJWYTBhQXNsUlpHTTIyMHN1SUpJTW1mN2JyVVZuN3N0N2NuZGJsVFYyUjU0?=
 =?utf-8?B?cnNGSmQxL1NmbkRIQThFd3N3YVhxQXhwMUtmeW5kWmcrRUtPeVFLeHREME9u?=
 =?utf-8?B?bWdLcFRRU1dBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WjU4L2RZbEtFTXVUMEVRMWtWMys2d1V6cVFLbCtkVi9KVGtiK2lCcG5peFR2?=
 =?utf-8?B?VngrbUh0SXRnQWVid2I4dDBqMllVRFc3VzN1S1NYb25aeUUza3lPZUs4aDBz?=
 =?utf-8?B?TEQzd3phR1g3d0VmOUQxU0hRNU9Eb0lVdlZyUkd4dFVsYjZZRGlqNE05MHJi?=
 =?utf-8?B?cnQ1Wmk0KzFWVSt1eDFRT3lvUzd6YmtHQzZKajJ2WmtYblZ6WE03bk5JaWwv?=
 =?utf-8?B?K2JPdTlaNTVzdHJTcGlYTUg2WWdJZzNSS0dsRkd2QU42d1lNdDRsaXlTRisz?=
 =?utf-8?B?OWtFMk1EMFRIcVdCQ1R1cDMxR0tqQWE2RGJWY2NuVWJXbDJKL2ZSakpZNUFZ?=
 =?utf-8?B?RUlOcDd4RG80TGtQNVhZa0JQR3JnUGpVMnNzR2VFREtrOVZGT20rK1dqaDhp?=
 =?utf-8?B?S2dvdFJsNzkwRDlwSFVSQ3NwcXVGR0pJaEd0ekRkS0UybjZ2MGh5eUNIK0l1?=
 =?utf-8?B?L1JJUjgzL21KNkEzeXYwMlFYZ3ZUTGE5dFVLVkZlMDlGWEZiQTNYNUJzNkU4?=
 =?utf-8?B?cGRpRjZ3V1BhVTdqS0tTYXFqSHNSUDhRVVRXZkRrckNHQ2lrRXRsVzIya3h1?=
 =?utf-8?B?VUk3TGNjSlQ1SWNMWUtyRU1uZnlMVUdxa2FYcFkyWVJ6TnN1TjJRMFhkNFY5?=
 =?utf-8?B?aHhSeFlOcFQwcVp1cm1KbE50R2tucE1NYXNrRlNTUXhlZ09PMitLbXBnTlkv?=
 =?utf-8?B?ZVhqVHh3Z294SjYrZWl5VGltT2xPaWIrQWszR3B5aDR2L2VZaUtyeGVtWm05?=
 =?utf-8?B?SVNLTEdKZE0yYS9FcDdMVG10NDRrczdMRzNGNnhHTEtIdEVOZXNic04zMTZJ?=
 =?utf-8?B?bVd3UG5ucC9jc2l0cjgyWC9IamhJQ2h3blN0Y1FEMTlITjc3ZkNSc0c5TzRk?=
 =?utf-8?B?eXpSRkRaOE1wdDkvUmtTWUhrODNCcHRwVzMxd250KzhFSzdHeWVCVDhENmNr?=
 =?utf-8?B?ZTR6YWlscmw0TW5tVENzbTR4cnFaS0hCdk9lRjNXemxiZk1Yb0pBOXBseUlk?=
 =?utf-8?B?TTNYSEpyaFJwSnpnQmdhcXYyQmE2cWZLb0ZVVW1BSVQ1SitSODlOWjMyMERQ?=
 =?utf-8?B?aTBSVW93U1B3cWkvaENobWsyeDlwc3c2VlZhcUNTN3MxQ3U5d0xwSEoyejlJ?=
 =?utf-8?B?QWNzRlhFcGVKT3p4b2h3L0Y1MmFtK0hPRnFVQ2pGVUxlNjhJSWNEMXFsS0dY?=
 =?utf-8?B?dlZtM2E4MFlrU3M4OEZab3M2QkduZzYwYk9aYzJlMnNiSm1LSzZLQlowY2lj?=
 =?utf-8?B?YzYrQ0tZZTdaMmpqWERxOGZ6dFlicXo5N1lKODcxcmJDK0RDcmQvaEdsNWVV?=
 =?utf-8?B?cTFOVVY4SS9iK3Zmc1M0ZG9NRzdRZ2VJQTYyOERiMkFHWHdySlJjeS9VQmxj?=
 =?utf-8?B?K3ltUW1yU000UFlNRHVwSlVqQkNTR1BybGNPOWtoN2lESEsydGhEYk5EcGdr?=
 =?utf-8?B?RUJvYkErL29pd3hFb3hiQkhRcjhWNFFNMElkVmovK0hLUFd1TnhLd2d3eC91?=
 =?utf-8?B?aS9XRkpqelRCTFJUdC95aTgwUHFpTDdUTWZMQ29jVVQwMis0TVFIeDBWZVRn?=
 =?utf-8?B?NjR2QjJDYTNZQk1zTVdjTmtvM3AxT0QycHZkTmYwNVgyUGZvR0JTUHdVVzBO?=
 =?utf-8?B?VlRHVzAweFJmU0NyNjZXTEI2RTNEcSttemdqYU94T3hDQzgyMU8rVXArZFk0?=
 =?utf-8?B?MU5RdDZHbFJjTWtMT2FIMWVkVE5WNkRrL2p3K1N0c0ZzNC91TnBjdTFTbGc0?=
 =?utf-8?B?ZzliMnNoeUJEQ1pqVHNOU0VCZWJyVDZETlZOaVk1cVZKR3N1eU1kNUhuc1NL?=
 =?utf-8?B?QXRETVIrcEo5bzdRbWxPWlVFNVM3NTdYWUs0cUt1L0JwVU5LUGRVUEY3b2lh?=
 =?utf-8?B?VG95Rm5tT25PSDZFeEh5YnFWWGxXM3laaVN0SHFodnNnK0lxVTNrOUdPWHM5?=
 =?utf-8?B?YUVtaXVFc1lPQndhdkJoKytjTjg2N2hsQ3FNLy9tZFZ3aGtTdUUrMXFHRVV2?=
 =?utf-8?B?eWovRk1zZC9FWjdvclR1dVJ6MlUrY2xQVnZsR1o1bkhiQ1NwTjdjYmJSd0NB?=
 =?utf-8?B?Qzc3OFA2WVdNbStHMCtiZU1pTWJ3MjVtbmNBZkVvMXFpQ1k1VHBINUtNa0NQ?=
 =?utf-8?B?Rk5KL0tSQkxTQmZQRHJ5YWY1V0NXejliQ1NGSUI0dzNvdkxaM1Btazg4emxX?=
 =?utf-8?B?RkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7D97B87C4EA43E44B1DC83AB5542BEB0@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c32a767-2b9e-4134-5e4e-08ddc9bebab9
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2025 07:58:36.9902
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QO4iTs0tigX5EqLqXgiR7OR4RosJNtRrK3o2OXXnGt/8YfZmO/ZF53iiLPXeySikIy8A0CYxcGLLWbIP4MTRUMeRfg9A2WUirKHhDz9UkbY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8082

RnJvbTogR3J5Z29yaWkgU3RyYXNoa28gPGdyeWdvcmlpX3N0cmFzaGtvQGVwYW0uY29tPg0KDQpI
aSwNCg0KTm93IEFybTY0IEFBcmNoMzIgZ3Vlc3Qgc3VwcG9ydCBpcyBhbHdheXMgZW5hYmxlZCBh
bmQgYnVpbHQtaW4gd2hpbGUgbm90DQphbGwgQXJtNjQgcGxhdGZvcm1zIHN1cHBvcnRzIEFBcmNo
MzIgb3IgdGhpcyBzdXBwb3J0IG1pZ2h0IG5vdCBiZSBuZWVkZWQuDQoNCkhlbmNlLCB0aGlzIHNl
cmllcyBpbnRyb2R1Y2VzIGJhc2ljIHN1cHBvcnQgZm9yIGRpc2FibGluZyBBcm02NCBBQXJjaDMy
DQpndWVzdCBzdXBwb3J0IGJ5IGludHJvZHVjaW5nIEtjb25maWcgb3B0aW9uIENPTkZJR19BUk02
NF9BQVJDSDMyIHRvIGFsbG93IGVuYWJsZS9kaXNhYmxlDQpBcm02NCBBQXJjaDMyIGd1ZXN0IHN1
cHBvcnQgKGRlZmF1bHQgeSkuIA0KDQpQYXRjaGVzIDEtNCBQcmVyZXF1aXNpdGUgcGF0Y2hlcw0K
UGF0Y2ggNSAtIEludHJvZHVjZXMgS2NvbmZpZyBvcHRpb24gQ09ORklHX0FSTTY0X0FBUkNIMzIg
YW5kIHByZXZlbnRzIGNyZWF0aW5nIGRvbWFpbnMNCiAgICAgICAgICBydW5uaW5nIEFybTY0IEFB
cmNoMzIgZ3Vlc3RzIGlmIENPTkZJR19BUk02NF9BQVJDSDMyPW4NClBhdGNoZXMgNi04IC0gZW5h
YmxlcyBidWlsZC10aW1lIG9wdGltaXphdGlvbiBvZiBBQXJjaDMyIHNwZWNpZmljIGNvZGUgYnkg
cmVkZWZpbmluZyBzb21lDQogICAgICAgICAgICAgIG1hY3JvIChsaWtlIGlzXzMyLzY0Yml0X2Rv
bWFpbigpKSBhcyBjb25zdGFudHMNCg0KR3J5Z29yaWkgU3RyYXNoa28gKDgpOg0KICB4ZW4vYXJt
OiBzcGxpdCBzZXRfZG9tYWluX3R5cGUoKSBiZXR3ZWVuIGFybTY0L2FybTMyDQogIHhlbi9hcm06
IG1vdmUgdmNwdV9zd2l0Y2hfdG9fYWFyY2g2NF9tb2RlKCkgaW4gYXJjaF92Y3B1X2NyZWF0ZSgp
DQogIHhlbi9hcm06IG1vdmUgdmNwdV9zd2l0Y2hfdG9fYWFyY2g2NF9tb2RlKCkgaW4gYXJtNjQN
CiAgeGVuL2FybTogc3BsaXQgaXNfMzJiaXQvNjRiaXRfZG9tYWluKCkgYmV0d2VlbiBhcm02NC9h
cm0zMg0KICB4ZW4vYXJtNjQ6IG1ha2UgYWFyY2gzMiBzdXBwb3J0IG9wdGlvbmFsDQogIHhlbi9h
cm02NDogY29uc3RpZnkgaXNfMzIvNjRiaXRfZG9tYWluKCkgbWFjcm8gZm9yIENPTkZJR19BUk02
NF9BQVJDSDMyPW4NCiAgeGVuL2FybTogcmVncy5oIHNwbGl0IHN1YmFyY2ggZGVmaW5pdGlvbnMg
YmV0d2VlbiBhcm02NC9hcm0zMg0KICB4ZW4vYXJtNjQ6IGNvbnN0aWZ5IHJlZ3NfbW9kZV9pc18z
MmJpdCBtYWNybyBmb3IgQ09ORklHX0FSTTY0X0FBUkNIMzI9bg0KDQogeGVuL2FyY2gvYXJtL0tj
b25maWcgICAgICAgICAgICAgICAgICAgICAgIHwgIDcgKysrDQogeGVuL2FyY2gvYXJtL2FybTMy
L01ha2VmaWxlICAgICAgICAgICAgICAgIHwgIDEgKw0KIHhlbi9hcmNoL2FybS9hcm0zMi9kb21h
aW4tYnVpbGQuYyAgICAgICAgICB8IDIyICsrKysrKysNCiB4ZW4vYXJjaC9hcm0vYXJtNjQvTWFr
ZWZpbGUgICAgICAgICAgICAgICAgfCAgMSArDQogeGVuL2FyY2gvYXJtL2FybTY0L2RvbWFpbi1i
dWlsZC5jICAgICAgICAgIHwgNjUgKysrKysrKysrKysrKysrKysrKysNCiB4ZW4vYXJjaC9hcm0v
YXJtNjQvZG9tYWluLmMgICAgICAgICAgICAgICAgfCAgNSArKw0KIHhlbi9hcmNoL2FybS9hcm02
NC9kb21jdGwuYyAgICAgICAgICAgICAgICB8ICA2ICsrDQogeGVuL2FyY2gvYXJtL2RvbTBsZXNz
LWJ1aWxkLmMgICAgICAgICAgICAgIHwgMTQgLS0tLS0NCiB4ZW4vYXJjaC9hcm0vZG9tYWluLmMg
ICAgICAgICAgICAgICAgICAgICAgfCAgOSArKy0NCiB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxk
LmMgICAgICAgICAgICAgICAgfCAzMyArKystLS0tLS0tDQogeGVuL2FyY2gvYXJtL2luY2x1ZGUv
YXNtL2FybTMyL2RvbWFpbi5oICAgIHwgMjggKysrKysrKysrDQogeGVuL2FyY2gvYXJtL2luY2x1
ZGUvYXNtL2FybTMyL3Byb2Nlc3Nvci5oIHwgIDUgKysNCiB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9h
c20vYXJtNjQvZG9tYWluLmggICAgfCA3MSArKysrKysrKysrKysrKysrKysrKysrDQogeGVuL2Fy
Y2gvYXJtL2luY2x1ZGUvYXNtL2FybTY0L3Byb2Nlc3Nvci5oIHwgMTkgKysrKysrDQogeGVuL2Fy
Y2gvYXJtL2luY2x1ZGUvYXNtL2RvbWFpbi5oICAgICAgICAgIHwgIDkgKystDQogeGVuL2FyY2gv
YXJtL2luY2x1ZGUvYXNtL3JlZ3MuaCAgICAgICAgICAgIHwgMjQgLS0tLS0tLS0NCiB4ZW4vYXJj
aC9hcm0vc2V0dXAuYyAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQ0KIHhlbi9jb21tb24v
ZGV2aWNlLXRyZWUvZG9tMGxlc3MtYnVpbGQuYyAgICB8ICA2ICstDQogeGVuL2luY2x1ZGUvYXNt
LWdlbmVyaWMvZG9tMGxlc3MtYnVpbGQuaCAgIHwgIDkgKysrDQogMTkgZmlsZXMgY2hhbmdlZCwg
MjU4IGluc2VydGlvbnMoKyksIDc4IGRlbGV0aW9ucygtKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCB4
ZW4vYXJjaC9hcm0vYXJtMzIvZG9tYWluLWJ1aWxkLmMNCiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVu
L2FyY2gvYXJtL2FybTY0L2RvbWFpbi1idWlsZC5jDQogY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9h
cmNoL2FybS9pbmNsdWRlL2FzbS9hcm0zMi9kb21haW4uaA0KIGNyZWF0ZSBtb2RlIDEwMDY0NCB4
ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vYXJtNjQvZG9tYWluLmgNCg0KLS0gDQoyLjM0LjENCg==

