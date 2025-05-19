Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7007DABB765
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 10:37:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989648.1373653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGvzQ-0007XM-2w; Mon, 19 May 2025 08:36:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989648.1373653; Mon, 19 May 2025 08:36:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGvzQ-0007Uu-0D; Mon, 19 May 2025 08:36:52 +0000
Received: by outflank-mailman (input) for mailman id 989648;
 Mon, 19 May 2025 08:36:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BFfW=YD=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uGvzO-0007Uo-Ig
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 08:36:50 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20626.outbound.protection.outlook.com
 [2a01:111:f403:2009::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66984309-348c-11f0-a2fa-13f23c93f187;
 Mon, 19 May 2025 10:36:48 +0200 (CEST)
Received: from IA1PR12MB8467.namprd12.prod.outlook.com (2603:10b6:208:448::9)
 by LV3PR12MB9215.namprd12.prod.outlook.com (2603:10b6:408:1a0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 08:36:44 +0000
Received: from IA1PR12MB8467.namprd12.prod.outlook.com
 ([fe80::1633:cc45:8177:a91e]) by IA1PR12MB8467.namprd12.prod.outlook.com
 ([fe80::1633:cc45:8177:a91e%4]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 08:36:44 +0000
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
X-Inumbo-ID: 66984309-348c-11f0-a2fa-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jb6/6mtDTq7sXiL32odoLb3YYJUiPoN4E8kUAHtB2YMU8sO91T8CddulkDZvy5ciLou6nL1y/u/rbVj2LaDpBOrci+ataYYV0bzrpMWArmrc3v3nsfH8avimVyJIUCitwNqOx9rfjuXjY3mGNUzBljXVDUbzC/CgGjBP+KsamWYSYksLw9nHiIvh0MZbzUTHFg/bLqmxIY0QZYzea86P26A5P7zFTlT4oqFoa+qOlz07PXwG1Khdgen96FTavnrsENDxM0/pVe9aJThybXw8WfELj/Lxjna4f7S6ESnqopfgi37uIKMa+DHKD9toJ+mkemNPLRggD7oxO8ld4qcD9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gns/AnUio66ezaanr2QOzkBfgwoCi6WD1aIav/++4Yk=;
 b=xB7vjTwPsBL/2qeD6bDiv3qavh2iVP+BI1gwgxTgk6P8AoGcnm3D/hnrPMhr+cpQswS9Z5rTYibLf/h0IV46XmelgiAk+TTQR+GU630selYi6k4K4XK5h/hwLI5DBZuWB4zstPkHECUjn0OlLP48bn9zpk09FOr5/lp0QlLIJ4mvAie+3v6FAVTm9tENGSI+Wvw1NFC6Q78NT8FeHZWtSVdmYCgZsZf49ex4Zeq3EBBvJzuoWHHDvaXq7PePC61zpyjBAYFYhX/aFu8Gr6gGP1vq5hY7U68RDKKWrMbp+0/5JoYNUOFrRyoPGeIf0a/ZycPSvxelIKa184izxzKJZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gns/AnUio66ezaanr2QOzkBfgwoCi6WD1aIav/++4Yk=;
 b=lmnT/i/rPLXV2QVwsuD9DQ6MrWb4Wxxjjb22R+0ldRoDVQJVKLKL/wsdttxPk7oIbcpNAEjx5Oe4C0qNnDB3/mPJUsdQUoQrK6/KWvN62Bwo9ZAyh3FxJb/NuE12saWBzPdSW+rwbmcr/CA6XTttjqUNYuvzhFbRpXIDIhsUvDQ=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 05/15] xen/x86: introduce "cpufreq=amd-cppc" xen
 cmdline
Thread-Topic: [PATCH v4 05/15] xen/x86: introduce "cpufreq=amd-cppc" xen
 cmdline
Thread-Index: AQHbrRCmtZ7pr/knH02upOrsNIOYE7O6sNeAgB8mXDA=
Date: Mon, 19 May 2025 08:36:44 +0000
Message-ID:
 <IA1PR12MB846717BD0A9E985C9E22AEFDE19CA@IA1PR12MB8467.namprd12.prod.outlook.com>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-6-Penny.Zheng@amd.com>
 <57a3b2c0-d57d-46e3-b248-0e243f715423@suse.com>
In-Reply-To: <57a3b2c0-d57d-46e3-b248-0e243f715423@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=7c77b369-f1ed-460f-8fce-0b55394e74f5;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-05-19T08:36:37Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR12MB8467:EE_|LV3PR12MB9215:EE_
x-ms-office365-filtering-correlation-id: 02a42c10-da96-40ae-5dac-08dd96b0493a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?a2lQczFMUG9QdzVvUkJRaTluRnFsb09hQnRBNEcyMlpqYmVIeEVQVEdrYVFj?=
 =?utf-8?B?aVMrSUpiMm5vTGJMR3BYNGFzZ3lWSndxZ0FKOWthbUg2YXZ2NjJYVWQyVTQ2?=
 =?utf-8?B?UUpxeTVyZHBpbHVsb29KN2hRVkkwTUNMMlU1R3JrN0JhbWhpb3NySUMzOTlY?=
 =?utf-8?B?LzJIZ05LdVhqc1hjN0puZXJBNTJFWXNmclBrQmNjcUo4RktXclhJaG9kcDRz?=
 =?utf-8?B?ZXNzOUtUKzlrY2xRbVY1QlhPeTd4b1kyV3c0VEJFVU9LbmxIcDJEcnAzMUJI?=
 =?utf-8?B?am9ncDJDaGxVVWR5bGN1a0F4elFabkNUaDk4QU9TbUpNRFkzbkdMSHJ2ZWpt?=
 =?utf-8?B?bHFyL1VBak1nMUNkYjZGL0ZjTnh0Q1I5RW5pd3pqZWxFcUhEN0N0V3hTcUVj?=
 =?utf-8?B?amNpOUVWSUhmTkVrVS9xWkx5aFlOcUpjYlE1Z3F3eWNaQ2ZlT1c4QlhmZ0Iv?=
 =?utf-8?B?R1BHQzBqNzIvUXluRnQrZk9nNlJhRTVxRTZXUmw2YlN6NjNBZEt4dCtOeXBh?=
 =?utf-8?B?djArbWlxNXNmTFlVcXUvcnhNeGRPMXZvUEY1S1p5c1hGQjdTWVpMZmE5UGlm?=
 =?utf-8?B?U0tUZGs0Z3Q5dFAxUlVSZEx3RGYwTFZLRGpRZklERGFIVmlqYU14Q2xxYzhn?=
 =?utf-8?B?ZUl1bEdVTlBZa1RORU1mSmNDMHNHTkhBYUpHVHRnRGg3c2RnNXdvQUM1cm56?=
 =?utf-8?B?d1V5c1pwWWpudk1RM3l0YUlGVFRxRHV0ZjRlUWdsdWQ2dzl5V1NUdjRvZFFV?=
 =?utf-8?B?K2Fjay9rYndIUisweWNNaVl3WjZWZmxXY0pmak55MGNhTjVwdWNwa0dTc0hj?=
 =?utf-8?B?Uk1zeUtGV3dCZTA3UGQyN3AzN3JNTkxaVWdRWXJwSE1GSzRLZmRaRTB1Y09W?=
 =?utf-8?B?MmZ4bjQ3Z3ZLZ0Y4bStiM3R5VkQ5UVJndWxibVlYSFdIZ2luRVhWRFBja0t2?=
 =?utf-8?B?Nng0SEl4WGJLM2JiaStZU1F3RTUyU3QrNkFBZlZvQ0k5VVFiMUpyT1J3WDVy?=
 =?utf-8?B?c1pUTm5uVWt4ekFYaWNXUk96NTFnYUcrRng1M3dRNFNHR0dVU2ZqUXlJWUpM?=
 =?utf-8?B?SFlCVnM1ZjJOVmYxSzcyWHdRREpZblkvU2RLRUdXRkNtbW85dkFwdXpnMFFV?=
 =?utf-8?B?WGtxQmtWc2tXRzlNTldmSi95VnpTQ3FYenRPUWNqS3N2WjFjek5aZlhiTVcy?=
 =?utf-8?B?Z0lCeWNsTTd3NGNNNXFDTTFDTkgzMlRQQTRiTE1TMWs4V1pKbDJhdzNHRTBv?=
 =?utf-8?B?b3krMG84S2cxQUlmbVQ0T0ROejJyK1FXT2c4TDdtS0ZXbE91SmllYmdoOHdM?=
 =?utf-8?B?aWFpeUxxcEFZa3NlTjZWc2s3RFVNcVp2R0d6Z2pUcDBzN2N5N3dIbkY1UDc3?=
 =?utf-8?B?b0VhZUlRSXpwMWdJb2p3MDlrQmsweDlCTks4Q1lUa2pNZUVHWXN4aFNuWUdX?=
 =?utf-8?B?VjRyRk1yRWt1QVBSTDlEMDNxS2d4bnlHa2pBOGlibGdLYWcyMklZUG5uVFEr?=
 =?utf-8?B?dnpYWVlGZmJ4NDhUVSsrQVR5S245MlFXZnJNV25MRWJreTMxL2doZ0w0dDBs?=
 =?utf-8?B?VzJwS3BxZXllNUEwSHN6ZnAwanh3VXZrMUpYWEE5UStFekJTd2VRQjhOSGFs?=
 =?utf-8?B?RW5xNWhEQ0cyTGo1RFFHZmZqb3BqSUs5SzBjeHNURTlOZmpJRWZEYWZ0Q1Vy?=
 =?utf-8?B?a1h1Z0UzamdqS0xkTHRxaUd6ME11OEtHZnFWSWhKam9MdGRKclVjUjNZekhT?=
 =?utf-8?B?NWt1dFJMdjFUM0NwTDJEZmFtMHQzUHRMWlNxeXNORVdMVkdmZ3lHangwdFRO?=
 =?utf-8?B?OExvRWUwOGtYMWZBb0VnVVp6a3dKNlBuK1BpdlUrR2oxbzVoNE0xMVhTMVpX?=
 =?utf-8?B?S1hCUTlEZ1QxVjAvYW5rQ3BlakhTOG4yKzFEM09wU3I0bHF5YUk3VlBuRHhH?=
 =?utf-8?B?NlVycWdoem05WDhnOFM4MHU0Qk9DdTdoQU16K3M5L1QyZzVqWVlqNnVBOUtS?=
 =?utf-8?Q?p+43uJcu0jCqse00UUSvaTQBW/AM1Q=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB8467.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WUFKWHZZY1BmZ005VUpPZHpydG01SGhCQ0RWb202M3ZEM2RWNDVSdE5CY3FM?=
 =?utf-8?B?UTRJaHhFVzdrQkpPY3dPSm5Eb3pWOUFkRnhBcTFsdlpoZEhscWFUYnYwNy9P?=
 =?utf-8?B?V0Zibk1LRVRLRXhiMVZ2MXU1RXZEVWU2aUl0L3ZsKzR5NU1WaWpPbmJRYW8y?=
 =?utf-8?B?R1h4MklxREVMbVp1amE4a0svVW9mWjBXblNWclZHM2pNSmliM0JoY1cwWW5L?=
 =?utf-8?B?MGhnRmpleHF0M21SMzJaR3YrL1F4TjBsdUhnTEEzKzFrMUk0UCtFbllGSkYv?=
 =?utf-8?B?QXFwSFI0UDdkczZhdjhuNXlBc09PQWRYN1BMbGRRWUNZeEQxanJUTzRFQlRz?=
 =?utf-8?B?RkM3MlIyNCsvNkM1UGoxOW93TGRoMXVFNXVWNy9Ba1hMaGYzNG56NlZ0eGNS?=
 =?utf-8?B?eThMOE1lQWE4MS9CMHRzTnpOdjlUajVzUmp1THJaNC83Wk1PbXhTeWlPSHdJ?=
 =?utf-8?B?T1NxNXAydUhKM2RzNzNkRnVLekF5NXQ0WTM5OGFnd3I1VWNoZlcrT0k3V3Zs?=
 =?utf-8?B?eVBMTnEra2g1RHN2TTVsWVgybllXcUVaR3BCWmRsYzVXK1BRd0ZiTUZ2WUVh?=
 =?utf-8?B?WS9UVUZQR3gzeGlIM0hodkJuQUR0dHl3cHNRWHBuL25DbzNKRGNXZ29IQkZS?=
 =?utf-8?B?RUtiM0ticTM3bndrL29KTWhKdmNmaDZra0tGakRHK3hQY3JhclFvWDlXd2JG?=
 =?utf-8?B?MWNteUErckxMaUVBRWJCVG96ckVnaHB2UVlwNzh5V1hUQ0R0aEpnZEY0dEln?=
 =?utf-8?B?SnBZdFpWQnRKNDE4YUFOaDdUbSt4LzZscU8vQWlBZ2QxOU1Ba3pRY3ZIdWxU?=
 =?utf-8?B?MmNoQ2hVVExycmpTVnpLaENKVVN5VnpLa3pnUmpTenZ1TjFjQ2swcUErOWtB?=
 =?utf-8?B?NmhnMlU2Q0V2eTFrTU5PRGNjTzdFQ2t6TjNnQnRiWU9TMW1HWGlrc3MyMkpl?=
 =?utf-8?B?N0ljMVZqMHNhK1JCU0xtd2NVZ3lOZzZyRXhER1UrQU95bkdyeFhwWkVJcDZo?=
 =?utf-8?B?a3NueUVGSjBobjFsRnNhSS9RRDltb0dJUFpxeFlHZFBGR01YZk5vK2k1QVhU?=
 =?utf-8?B?WnBpY0pWa3dTTTU2SnNmbFdnSmxnQzR4dGNmNmo3MUtKYkcxQUk2c3pRdGlj?=
 =?utf-8?B?ZzAweEhnaGh3T1NBYVFkZS9wZE9vMk45dXcwZ3Y1eE45TGFwYjhiMjRFNjJu?=
 =?utf-8?B?NkxKNUtkM3RQMC80eUxKZmZXVVoyOUpoUzF3MFY2WXcxOUNiR0FzRWVpNFBL?=
 =?utf-8?B?TzhkQXdWSGxOVXFZRGpGbDRzdjV6cjZLSDVYcjl3RUpyUjV4SWFmM2dxcTlH?=
 =?utf-8?B?MTJTcjBHb25UbzRUV3ZybGdiR2pIeGpDRTIxRE1sVHJCSjlWUEtycVg4TkM1?=
 =?utf-8?B?eEFEZDhTb2x5cVFPZkZuRnlpU3hTZHhLRFA2UW40SGhsdVM3MlI2NkF3SE9K?=
 =?utf-8?B?MmpOWmtJMDlaVVp1bit0NVpEVmVTRWs5V1BoTjExQUVEdmsyQnlBNW9Pa3Ay?=
 =?utf-8?B?TWFuSkhGYk83eEpYQm5FZmU1K3RaL3hMSVVlZ29URW9hTCtxYThIYzRTMGt4?=
 =?utf-8?B?Wkt4RjVFaFlYN2dxd1FVYlkwOFJxdkswU1Vyd1F0UFZ3dXc0OHExUTB1R0ZC?=
 =?utf-8?B?TGhzbCs0RkJHejBmY1ZaV0RCNkFwV3NhREJlV0ZZVzdvV091MUFDUGtBVnZU?=
 =?utf-8?B?NjlhMDZzRkdCWnNVSWRHakN4K1RBYk16N29vSkl3S1RZSjRYOW5VUlBVczBH?=
 =?utf-8?B?TDBQbTJhNlNBR1ZOanlzQkhlVzMvdUl2MDUydG85Q014SW5kQ3drWnZYN3Bm?=
 =?utf-8?B?aHVLUkdsN2hjTWZOYWhjeUNJNlVNcXNDdWxRRnQvaUF4V21NdmNaQndnNGVR?=
 =?utf-8?B?V216dGtJbmd3dUY0Yit2eXkzUkVtSTRmZ05xVXdqYk9qeldORFdUejJZR2Rh?=
 =?utf-8?B?N3NDa01EWW15WThEMVlrZEpQREhGNHFTYURkbWp3WE0yNzNmOVFFNHViSHJ1?=
 =?utf-8?B?UGdvT0xYa1U4Zlh4MHRWQzFVcElwNCtBbDU3bUo0U1ovZVRLdmUzbERXM0c2?=
 =?utf-8?B?bVdGWUNNMkcvbHU1MHZGVHY2S3ZyUEprdXkwK2loMGZBZE9OZTZMSDMvbWpT?=
 =?utf-8?Q?JjxU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8467.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a42c10-da96-40ae-5dac-08dd96b0493a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 08:36:44.3056
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K0+ZY2AWabzo28E3H9JCZCehqMU5IdNIf64M4PH/aDN/8MV+2BTfjw7GVd1l/+zt+PH0vur5wDN33u3kZPheqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9215

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIEFwcmlsIDI5LCAyMDI1
IDg6NTIgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4NCj4gQ2M6
IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgQW5kcmV3IENvb3Blcg0KPiA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT47IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEB2YXRl
cy50ZWNoPjsNCj4gT3J6ZWwsIE1pY2hhbCA8TWljaGFsLk9yemVsQGFtZC5jb20+OyBKdWxpZW4g
R3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgUm9nZXIgUGF1DQo+IE1vbm7DqSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyB4
ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djQgMDUvMTVdIHhlbi94ODY6IGludHJvZHVjZSAiY3B1ZnJlcT1hbWQtY3BwYyIgeGVuDQo+IGNt
ZGxpbmUNCj4NCj4gT24gMTQuMDQuMjAyNSAwOTo0MCwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4g
LS0tIGEveGVuL2luY2x1ZGUvYWNwaS9jcHVmcmVxL3Byb2Nlc3Nvcl9wZXJmLmgNCj4gPiArKysg
Yi94ZW4vaW5jbHVkZS9hY3BpL2NwdWZyZXEvcHJvY2Vzc29yX3BlcmYuaA0KPiA+IEBAIC01LDYg
KzUsOSBAQA0KPiA+ICAjaW5jbHVkZSA8cHVibGljL3N5c2N0bC5oPg0KPiA+ICAjaW5jbHVkZSA8
eGVuL2FjcGkuaD4NCj4gPg0KPiA+ICsvKiBhYmlsaXR5IGJpdHMgKi8NCj4gPiArI2RlZmluZSBY
RU5fUFJPQ0VTU09SX1BNX0NQUEMgICA4DQo+DQo+IFRoaXMgbmVlZHMgY29ycmVsYXRpbmcgKGF0
IGxlYXN0IHZpYSBjb21tZW50YXJ5LCBiZXR0ZXIgYnkgYnVpbGQtdGltZSBjaGVja2luZykgd2l0
aA0KPiB0aGUgb3RoZXIgWEVOX1BST0NFU1NPUl9QTV8qIHZhbHVlcy4gT3RoZXJ3aXNlIHNvbWVv
bmUgYWRkaW5nIGEgbmV3DQo+ICNkZWZpbmUgaW4gdGhlIHB1YmxpYyBoZWFkZXIgbWF5IG5vdCAo
ZWFzaWx5KSBub3RpY2UgYSBwb3NzaWJsZSBjb25mbGljdC4gV2l0aCB0aGF0IGluDQo+IG1pbmQg
SSBhbHNvIHF1ZXN0aW9uIHdoZXRoZXIgOCBpcyBhY3R1YWxseSBhIGdvb2QgY2hvaWNlOiBUaGF0
J3MgdGhlIG9idmlvdXMgbmV4dA0KPiB2YWx1ZSB0byB1c2UgaW4gdGhlIHB1YmxpYyBpbnRlcmZh
Y2UuIFNJRl9QTV9NQVNLIGlzIDggYml0cyB3aWRlLCBzbyBhIHNlbnNpYmxlDQo+IHZhbHVlIHRv
IHVzZSBoZXJlIHdvdWxkIGJ5IGUuZy4gMHgxMDAuDQo+DQoNCkkndmUgYWRkZWQgYSBwdWJsaWMg
ZmxhZyBhbmNob3IgIlhFTl9QUk9DRVNTT1JfUE1fUFVCTElDX0VORCIgaW4gcHVibGljIGhlYWRl
cjoNCiAgICAgICAgICNkZWZpbmUgWEVOX1BST0NFU1NPUl9QTV9QVUJMSUNfRU5EICAgIFhFTl9Q
Uk9DRVNTT1JfUE1fVFgNCmFuZCB3aWxsIGRvIHRoZSBmb2xsb3dpbmcgYnVpbGQtdGltZSBjaGVj
a2luZzoNCiAgICAgICAgQlVJTERfQlVHX09OKFhFTl9QUk9DRVNTT1JfUE1fQ1BQQyA8PSBYRU5f
UFJPQ0VTU09SX1BNX1BVQkxJQ19FTkQpOw0KDQo+IEphbg0K

