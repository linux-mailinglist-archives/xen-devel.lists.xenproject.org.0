Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8605AAFC197
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 06:03:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035932.1408346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYzXb-0007OD-1Z; Tue, 08 Jul 2025 04:02:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035932.1408346; Tue, 08 Jul 2025 04:02:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYzXa-0007Lr-UZ; Tue, 08 Jul 2025 04:02:46 +0000
Received: by outflank-mailman (input) for mailman id 1035932;
 Tue, 08 Jul 2025 04:02:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BlNv=ZV=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uYzXZ-0007Ll-Mo
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 04:02:45 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2418::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6363803f-5bb0-11f0-b894-0df219b8e170;
 Tue, 08 Jul 2025 06:02:40 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 CH3PR12MB7570.namprd12.prod.outlook.com (2603:10b6:610:149::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Tue, 8 Jul
 2025 04:02:35 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%7]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 04:02:35 +0000
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
X-Inumbo-ID: 6363803f-5bb0-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j5xyGADSTvNJzxbHRejt5RS61FGIxF/RqaRZAx/wRdwEfIqPUtqanUwCi/srMozVCy4Y2ldOSE5v1a/YtX32OMhz+hkmXxxS3sGrFGKHcQJVU0kQURmK/55ItGxh4V2fOq5pevLCIqRknzSgkvBEp/N8e0L5Mz2DnA7V42Akh/GjDIqWIgezqkgPQpsGBcLEPmbnzSEhMzO0Mbw8SHc0ELhgINHV28as2ELD0XXxenFVTvWSAlEZYEvkdhTToRkQj+p2HJFJl14mWp2fshKerfrlJThtzloNLcDa9dNFc5drPrmmWuuakfKwIXsXWGA1vtEllgxVfGxh4cc78Nby4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BTLZlId4+nmhZZW1/BWDo2pPLaqhqYyznbc3bMXhV2o=;
 b=fVS03ydns5m0z01F2qRjnDfAPesXAimkweKZkiCeQZgZVSMGwONRnBChKB6M1etRNdmKlScZLccNqNyHytHsp29SmiytYgoEr9D4VKuJOtZqUAUVC5qM3kmycBZA9zMgVwC+RiM6jDjeOwjkgbx7G97byTKNUkWAv42Y4k6XKkkm5Kvzm7LmHBCLMa16dN/NHl9m1gvTge6YEI4jv8egDYchO/wd9Ii3k1p2+moiBjilB3qjtqvAr0VnyAkNlGeyA2jrOobmG6j0FRD+ceRyqw/3rWbX6oDYRbRcuwCDT9vZj4sMWRIXaTKMJrIEZ+67MdxFAyFZm3OZrzVnBfMWoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BTLZlId4+nmhZZW1/BWDo2pPLaqhqYyznbc3bMXhV2o=;
 b=QBGulBONoq5+xn3xbECXr6fVRrYW1JqTetSFitsqj9p2Cyf1IHYWqqyjxW2I9zq9ogyWqoEYFxOPj58DkMU0CLO5xcPV49qAV8kpnruf2c12PnIZCAI3aUyYMDr5EI/DYuuzsk33L5i1EFxZlMn4hm/scKSbVaVykvOgs7YPCqM=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v5 18/18] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC
 xen_sysctl_pm_op for amd-cppc driver
Thread-Topic: [PATCH v5 18/18] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC
 xen_sysctl_pm_op for amd-cppc driver
Thread-Index: AQHbzuRPZqaLvzCjuEKxxaw+9H72fLQHSh2AgCCHnCA=
Date: Tue, 8 Jul 2025 04:02:35 +0000
Message-ID:
 <DM4PR12MB8451DC192A1D18BF2C8E6139E14EA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-19-Penny.Zheng@amd.com>
 <a1bf3003-d0e3-4769-948d-872bc17b5f91@suse.com>
In-Reply-To: <a1bf3003-d0e3-4769-948d-872bc17b5f91@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-07-08T04:02:24.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|CH3PR12MB7570:EE_
x-ms-office365-filtering-correlation-id: b6f433dd-f7ca-4230-5e61-08ddbdd44561
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RlhpOGRYM3d1cFl4UHQzSktwNGJsMVlGZ1M0eno3Y2RlLzJ4VkNwR2wvKyt0?=
 =?utf-8?B?UzNEMEFFY0xpQXBRaXpxNjJUY01FT09xZFcva1FSaDlidG1paEtjRVNIRjM3?=
 =?utf-8?B?RXVuVkI0elk5a2hNVzJJTEtxV3FQN2F4b3RRRDhLcjZ1ZWFDeDJmelRIVzYz?=
 =?utf-8?B?cUI2Uzc1dm0xbVVoRUJmMGpuV0RDY2poR05PY2hIeDEwNzhQY3VLR2NkZ0R1?=
 =?utf-8?B?eThrTEU3VEEvdDI4OE10elgwTDBmN3dXL3k2c2RIU2U4MWg1UEtyT0x2Tks1?=
 =?utf-8?B?SFM1T0NQQmdJNy9XTlhFdjlOZXlhZUtMcmdVUW1pTXlJMkVoU05yNzl4UWtk?=
 =?utf-8?B?TkFKSGdHQ01WQU1lLzhHdlpMSGV1SzJUQnlSRk1QdGpqSXM1cTY5WlVjWita?=
 =?utf-8?B?K01kaVpvaGxPaUlObFRsRmFxV3hReUhFaUpjRk9tbVFaRGV6eU0yL2lPQldD?=
 =?utf-8?B?Zjg1Q2kwL1N0YlA1RzN4SFBaQjZiakExNkkvQ3hiTWgyTHlKdkhYY0ZJSXg1?=
 =?utf-8?B?a2lIZm1xamFFaDVLaExCMXdpUS83VityWXZXdkRzakN5K3F2ck8yRE5zREd5?=
 =?utf-8?B?WmdHV2FKSVJ4NmNRSG9ydzZ6UVFTMVVqZVdtdzFyV3IzL1I4UzBTU0dJd1pL?=
 =?utf-8?B?NmVOZ1Z1UnBCOGFKako5L1o2RjE1dGhkQTlSVGxoOHhlditsTFFZN29VelNO?=
 =?utf-8?B?Y1kvdFZ3VHFHYjdzZysweGJuTDkzbi9JaDB4ZjhFbnVDWWt5aWw3Qk9xcTlX?=
 =?utf-8?B?a1NYZk83b1dRVU1ZOE1yT2tkM083YU5mYXZNTzFuTmVPSnFaU1JHVTk2MFFi?=
 =?utf-8?B?WURqWEQ2aVpiMXEwRG5wZnExd1lIZ2dyQkRwV3pldVVVcUl6eWw4Z1BHZ0tO?=
 =?utf-8?B?cDVyTnFzcERqYXFNVE8rd0h1STVwUEdMMGIzZFpTL1ZYU041Z3dpSjRXL3pt?=
 =?utf-8?B?TTRSYitoN01YZi8yMXg3ajhWc3Zpa0VEL0FhRmVGMmN5K1RqNWZuczB0aFdI?=
 =?utf-8?B?bzRwSGUxMGNjUGd5Q0hXSWdEUjRROTU1RnRnUmx6MDBIbGcwMnFTUzlCMEdO?=
 =?utf-8?B?UlhHeTlkVU5ZY0VMWTJCV2hrRjlhaWVlUVFBS0poMVdCK29aUTNTM0lta2NE?=
 =?utf-8?B?SlBURloralBBRkhEdFg3RDloazBQUzVMUGJHRk9IMS9EbDFXc2pxQ29vZUUr?=
 =?utf-8?B?TnlqRHNlVVdWWlVKd1BHUW5kaFNMUnR4MWZUU3FrVzh3YkZPUFVRSk91VFBK?=
 =?utf-8?B?TGRpVjNFeGFlaGorc1BRVUlVY2F5a2ZBWWJESmlGbzM1S0pyaWJtR0FJZytC?=
 =?utf-8?B?U3pFZ1FXNVR1NW9mUTBDdDEwdmZEWTcrSXIxUGQzOEYrVnBuY0tZSFZhZW5J?=
 =?utf-8?B?WVBqbHpkbmZ6UDBRcXdjbHAzNk5pWWsyaXIzY1VhUjVmcEpmVGNMY1UzYjVr?=
 =?utf-8?B?T2lLbmpybk1tNDFyQWl1UmpoelBnZzJBSkNTTTNkRmMwSm9nWlZHRS9YbUZa?=
 =?utf-8?B?djJQTkllS0h3eUFqeGVjSlNIdDdlM3pnaUNYbVgrZWd1cU40RHZGSlNJZzUw?=
 =?utf-8?B?M0VJdnRlamlWWkN5NEJ0WVBQS2N5Q1BqY0JMakJPdUU2Zkl0cGFEc3pXSzNV?=
 =?utf-8?B?MTBadWtIMzBsaTczWnQzMTgrdSt4eHF4UjF5TlhtaW1mcTl6ak9mdFpqeEoz?=
 =?utf-8?B?QTBKdTdnZmNRZi9yQWhlNGlZbUhpU29TdmhMT1lVT0JQNWFValkyNmlPSFlV?=
 =?utf-8?B?T01wVEV6K1k2VU9SNzYzY001VTRMT0VzMVJnT0w2QzZmSlFVZ0tZU29XeXpO?=
 =?utf-8?B?WnJUMlhHMEpTdmVkVVhHdXk0SDF5bVJMMnRVSFIyVjdNRzZYY1kxT09icVBh?=
 =?utf-8?B?VnlrdzZVUWZlUHFnN2RoR2h2RWVXcVNhdHBtNW0reXFKQWlxdk1GamZQaGxX?=
 =?utf-8?B?V21JanczL1ZZTVdnME5Wek1wYnhpcGlNdWp2MXRQUG4yeEcwZGhjSUEwMUlD?=
 =?utf-8?B?NXlBc1cvTXNnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cGtxRUcxUm9jUGFmNmJwaEZCTDg1MXBBUHdHbWJ2SlRQZk5qMFN2Y2lsUUpI?=
 =?utf-8?B?aHFkcjNyVjRzSEhBeW9ENE16QnhnY216ZjN6dVZ6Q3g0ZW5KY1Fib0NqYnMr?=
 =?utf-8?B?ckorb3V0VjA2c3lOWU5LWFp3Qy9vUmxsbFVQVmJmdFJUK2tJOFlmTEdrbE8w?=
 =?utf-8?B?ZzdMdEUvNmVhM2dmQmMvRk9zU0Q1NUlWQ0QzK2tZTG9UbUR1T0NWSGNzY21n?=
 =?utf-8?B?NzdvL2NWdlR1a1VodUZybHFCTkZTZ0pwZEY3a0VMTnRTUXp6TlRPVnhoUHlL?=
 =?utf-8?B?WnBqd0hnZ2J0OENDa1lzN3FjYVB5Rmg5d01HYWFXdzNXTVErUHhzdzF3aE03?=
 =?utf-8?B?YmxZUzZTZUpTbnNKUGZvZ1NUOW5NclFUMXRldE5FVmM5QWZFUHFQUjJJYk5C?=
 =?utf-8?B?Qll3d0VzYVROODE5WkhLNk1wZVN6RlJOWFVZbEZsODJtRjc0Nm5vcEcrRWF2?=
 =?utf-8?B?ay90S1hwNkVLQjg3RXkwSXlJWFVNaHFqWit0ZDhVQU1FNVVqYUtUTmU3MGF0?=
 =?utf-8?B?ay9wQmhhVVNYbFUrQnJYLyt0TytQY3kwNFUvcXFqdFhqOEIwNDNSbTJwcHAr?=
 =?utf-8?B?Uk8xdnVRL2Y3OC80UmJxRFhIVmlFZFlWdUF0V3dUVlh5azhabVIzQndPRE1M?=
 =?utf-8?B?Mm41WFlJRUxNRkRqQitmdVIyWVQ0eFpxRmRjN1lxa3R1RkFFUDBxTmY2cURS?=
 =?utf-8?B?emxWa0pvNE5RdE1ZQlFMcEpQVERWNWZTcTEyeDVLc0JTVTZzVXR2dmp6RGYx?=
 =?utf-8?B?cVNQdjFFaXJEMGFkcVFwZkY5SE82NExlYVA3emFsc1RNa3ljc0lsaGk4ZHlG?=
 =?utf-8?B?aWRHc2M3WVRGam9nY1VQSG54eUI1M2hoMndycGk0eXhsL2lBNG9HY295enRa?=
 =?utf-8?B?cy8vYnlIZithNEp6UUNZd2dPT0FHaE5Wd3hBVHVwczBJSDZvZk9mQWRHMHhw?=
 =?utf-8?B?MmMvSHAxNVczYzBWZmtJcDdpYzZldTRHOUJ0a29ZQ2lKcDlRc21ZMEFGWk0z?=
 =?utf-8?B?ZVNaQ2lJbC90dWswVEdMNVlPbkIza1JkYkZ3dk9kYlZjaFJOS1o4TlVuVFF5?=
 =?utf-8?B?RUZ1K2Y2cnkyWjAyTzE4ZGQyRTd0WE4wQXk4M0hWRGxodjhUQnovQVFjM2FT?=
 =?utf-8?B?TUNGUVZxSGF2MTJsbzRmRjRZVjNXNllxQlprOUFlMmNlWk1pTVJyUnF5UWpq?=
 =?utf-8?B?RlQ1MkVoeXcwQWxpSG1SdHA4NVpNZUV2VUM3dzlEd09TZ1RGaWt3YkJkMG03?=
 =?utf-8?B?TDcxMVVSaEh1WU4wVTcxK3h5OU9QYWR1Q0h5SnBUKzkwYW51eFJXVTJYeWlP?=
 =?utf-8?B?WkM2YWkxZVhGdVRqYWp3QkNrQ0N1dSt5MXZmZERtQk5HSnp2VFFRdFA2dzE0?=
 =?utf-8?B?UWp1RWg2WnNReXRYQ2ovY0VUWWZLSXZ2Q0NYQjV6L0xXVTk0ZGk1T0JxYnp3?=
 =?utf-8?B?azN3SUVWT3RFTEtRK0lLbEdoQ1JTV1ZzRnl3RXJsQTlSbTlxOERQVStBM3NM?=
 =?utf-8?B?Q3lCdU9kY1AxM2VxK2UzcVhYaEp1R3pFS1N6WlZuU2VZQy9VVmE3VHpkVEtK?=
 =?utf-8?B?UFl3MTJzK0tWVWlYUStYcnBNYWEyZjJCenF6SWk2ZEdOZC9vNnhmZWs3VmxB?=
 =?utf-8?B?RTFlaEFZMXpCM3pQMzBLM3IwUjV3bmdPckJiRGtzc0UrUFpOVjVObFQwcE5Z?=
 =?utf-8?B?Mm85ekExTXpiZDlwWDlDV2dDNHpEQ2llcmV4MjYyNlpHUWxrRE5PcURmM1E0?=
 =?utf-8?B?NXlDclh2SWg2NEF4MDIrZHBiYUxaYmwwNk83WXhDYWlTeU56cVN1WTRHcnhV?=
 =?utf-8?B?ampQZmk5ZG9lODFiUWtEZmhhUzJhSC9NVmZPNDhTdlU5KytWZUZXcGZoQ1V5?=
 =?utf-8?B?d3VTd1NIdnR2ckJKVGFBUFFkaVNkK1JPV0xwU1Nnc214OGdHNHNhRmJrcnVH?=
 =?utf-8?B?MThxbDZYSkk4OXBZd1plSUNHZXVHNUhzdkxpblhWZUMzL25GdFlDMXNCTE5G?=
 =?utf-8?B?N1M0N09jN2tYUHRQTXJKRS90RldhU0ltWS9GNnZDdnkxbFppZ3Y1anBra1JO?=
 =?utf-8?B?bFRPM2FyRlV1S0E2dHFWL21uVjZteHZZSFliWlNWZlNFK2FLOGdNTWRpaHZO?=
 =?utf-8?Q?tPOY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6f433dd-f7ca-4230-5e61-08ddbdd44561
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2025 04:02:35.0673
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nDgV+dxVDhWB8OfI55EzUDjTl4h5AbgJE1PnZo2+5amOmH1vLXQ0s0DaqfVEOVYmPfFeLytRlRnwjmpyQEHPMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7570

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIEp1bmUgMTcsIDIwMjUg
NjozOCBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0KPiBDYzog
SHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBBbnRob255IFBFUkFSRA0KPiA8YW50aG9u
eS5wZXJhcmRAdmF0ZXMudGVjaD47IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+Ow0KPiBPcnplbCwgTWljaGFsIDxNaWNoYWwuT3J6ZWxAYW1kLmNvbT47IEp1bGllbiBH
cmFsbCA8anVsaWVuQHhlbi5vcmc+OyBSb2dlciBQYXUNCj4gTW9ubsOpIDxyb2dlci5wYXVAY2l0
cml4LmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IHhl
bi0NCj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2
NSAxOC8xOF0geGVuL2NwdWZyZXE6IEFkYXB0IFNFVC9HRVRfQ1BVRlJFUV9DUFBDDQo+IHhlbl9z
eXNjdGxfcG1fb3AgZm9yIGFtZC1jcHBjIGRyaXZlcg0KPg0KPiBPbiAyNy4wNS4yMDI1IDEwOjQ4
LCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPiAtLS0gYS90b29scy9taXNjL3hlbnBtLmMNCj4gPiAr
KysgYi90b29scy9taXNjL3hlbnBtLmMNCj4gPiArDQo+ID4gKyAgICBjYXNlIFhFTl9TWVNDVExf
Q1BQQ19TRVRfUFJFU0VUX0JBTEFOQ0U6DQo+ID4gKyAgICAgICAgaWYgKCBzZXRfY3BwYy0+c2V0
X3BhcmFtcyAmIFhFTl9TWVNDVExfQ1BQQ19TRVRfREVTSVJFRCApDQo+ID4gKyAgICAgICAgICAg
IHJldHVybiAtRUlOVkFMOw0KPiA+ICsgICAgICAgIHBvbGljeS0+cG9saWN5ID0gQ1BVRlJFUV9Q
T0xJQ1lfQkFMQU5DRTsNCj4gPiArICAgICAgICBtaW5fcGVyZiA9IGRhdGEtPmNhcHMubG93ZXN0
X3BlcmY7DQo+ID4gKyAgICAgICAgbWF4X3BlcmYgPSBkYXRhLT5jYXBzLmhpZ2hlc3RfcGVyZjsN
Cj4gPiArICAgICAgICBlcHAgPSBDUFBDX0VORVJHWV9QRVJGX0JBTEFOQ0U7DQo+ID4gKyAgICAg
ICAgYnJlYWs7DQo+DQo+IElzbid0IHRoaXMgbW9yZSBsaW5lICJvbmRlbWFuZCI/IFRvIG1lLCAi
YmFsYW5jZSIgd291bGQgbWVhbiB0eWluZyBwZXJmIHRvIGF0IGxlYXN0DQo+IGNsb3NlIGFyb3Vu
ZCB0aGUgbWlkZGxlIG9mIGxvd2VzdCBhbmQgaGlnaGVzdC4NCj4NCg0KVGhlICJiYWxhbmNlIiB3
b3JkIGNvbWVzIGZyb20gdGhlIGVwcCB2YWx1ZSwgaXQgaXMgMTI3LCB3aGljaCBpcyB0aGUgbWlk
ZGxlIHZhbHVlDQpJbiBhY3R1YWwgaGFyZHdhcmUgYWxnb3JpdGhtLCB0aGUgdmFsdWUgb2YgRW5l
cmd5IFBlcmZvcm1hbmNlIFByZWZlcmVuY2UgcmVnaXN0ZXIoRVBQKSB3aWxsIGJlIHRyYW5zbGF0
ZWQgdG8gZnJlcXVlbmN5IHNldHRpbmcsDQpBbmQgaXQgc2V0cyB0aGUgbWluaW11bSBhY3RpdmUg
ZnJlcXVlbmN5Lg0KIEFuIEVQUCBvZiB6ZXJvIHNldHMgdGhlIG1pbiBhY3RpdmUgZnJlcXVlbmN5
IHRvIEZtYXgsIHdoaWxlIGFuIEVQUCBvZiAyNTUgc2V0cyB0aGUgbWluIGFjdGl2ZSBmcmVxdWVu
Y3kgdG8gRm1pbiAofklkbGVGcmVxKS4gIEl0IGlzIGxpbmVhciBzY2FsaW5nLCBzbyBlcHAgb2Yg
MTI3IGlzIGNhbGN1bGF0ZWQgdG8gdGhlIG1pZGRsZSBvZiBGbWF4IGFuZCBGbWluLg0KQW5kIEZt
YXggY29ycmVzcG9uZHMgdG8gdGhlIGhpZ2hlc3QgcGVyZiwgYW5kIEZtaW4gY29ycmVzcG9uZHMg
dG8gdGhlIG5vbi1saW5lYXIgbG93ZXN0IHBlcmYNCg0KPiA+ICsgICAgY2FzZSBYRU5fU1lTQ1RM
X0NQUENfU0VUX1BSRVNFVF9OT05FOg0KPiA+ICsgICAgICAgIC8qDQo+ID4gKyAgICAgICAgICog
SW4gcGFhc2l2ZSBtb2RlLCBYZW4gZ292ZXJub3IgaXMgcmVzcG9uc2libGUgZm9yIHBlcmZvbWFu
Y2UgdHVuaW5nLg0KPg0KPiBOaXQ6IHBhc3NpdmUNCj4NCj4gPiArICAgICAgICAgKiB3ZSBzaGFs
bCBzZXQgbG93ZXN0X3BlcmYgd2l0aCAibG93ZXN0X25vbmxpbmVhcl9wZXJmIiB0byBlbnN1cmUN
Cj4gPiArICAgICAgICAgKiBnb3Zlcm5vcmluZyBwZXJmb3JtYW5jZSBpbiBQLXN0YXRlcyByYW5n
ZS4NCj4gPiArICAgICAgICAgKi8NCj4gPiArICAgICAgICBtaW5fcGVyZiA9IGRhdGEtPmNhcHMu
bG93ZXN0X25vbmxpbmVhcl9wZXJmOw0KPiA+ICsgICAgICAgIG1heF9wZXJmID0gZGF0YS0+Y2Fw
cy5oaWdoZXN0X3BlcmY7DQo+DQo+IEFzIGluIHRoZSBlYXJsaWVyIHBhdGNoIC0gSSBmZWFyIEkg
ZG9uJ3QgdW5kZXJzdGFuZCB0aGUgY29tbWVudCwgYW5kIGhlbmNlIHdoeSB0bw0KPiB1c2UgbG93
ZXN0LW5vbmxpbmVhciBoZXJlIHJlbWFpbnMgdW5jbGVhciB0byBtZS4NCj4NCg0KQWZ0ZXIgcHJl
dmlvdXMgZGlzY3Vzc2lvbiwgSSdsbCB1c2Ugbm9uLWxpbmVhciBsb3dlc3QgaW4gYWxsIHBsYWNl
cw0KDQo+IEphbg0K

