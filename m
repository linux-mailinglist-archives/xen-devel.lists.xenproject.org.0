Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 158E1AE002B
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jun 2025 10:45:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019809.1396306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSAsU-0001YE-4Q; Thu, 19 Jun 2025 08:44:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019809.1396306; Thu, 19 Jun 2025 08:44:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSAsU-0001VV-0p; Thu, 19 Jun 2025 08:44:10 +0000
Received: by outflank-mailman (input) for mailman id 1019809;
 Thu, 19 Jun 2025 08:44:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xoG=ZC=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uSAsS-0001VP-MA
 for xen-devel@lists.xenproject.org; Thu, 19 Jun 2025 08:44:08 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20604.outbound.protection.outlook.com
 [2a01:111:f403:2415::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8db93ab4-4ce9-11f0-a30c-13f23c93f187;
 Thu, 19 Jun 2025 10:44:06 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.41; Thu, 19 Jun
 2025 08:43:59 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%5]) with mapi id 15.20.8835.027; Thu, 19 Jun 2025
 08:43:59 +0000
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
X-Inumbo-ID: 8db93ab4-4ce9-11f0-a30c-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DuPL8cptkIyT2Y7VewB2MyWdwqwrffsLjFxGRb6img+V3FJH5pDCxKviMGnJ7TJENoL8OOtz2BCetacEO0Ms2s+vw76L/hjzlbggxHnZJhe0edyLZXB0otnCH3fAIxPExBhEPotM+bTfwxZrK2N1ZAdK6H3bqemeuOmiYxB5daQTNhNYaaa6zuk3dSFF2kznt20gAY2PbUFoZE9o+tIOIkxPO3uDvfM7BO2U2GCvvX48z+MhijmumsRX0y5mhoMW6N/Wq4LdaLm/CfR/l3T9pDI4+7jwJ5CgseoHDuWqeHTy7RuvPfXMhSoBxnVz3v7QuCzWhQJIlUw7cfYzcO0jTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DmK0jtN2SMcGMOlx7rLXibuUM6JCMQ8+QE0LkmBlqls=;
 b=EzXumRBteWT+y+jWYCzIaSWe+hHS802fxt8c9NunbAZrk3opsu+erZPaP1Rhl3SA0ZsE52Y6y63KC84w+9sql16TSiwn+U9FKNNghyzjlVYnw6LKbkAVHPS2eULX9WmHMae9sctRkVnukfbcwKRVEJiWfXa2tM0oSr+AylOVmKRt0kBT3AJiA7e4Bswz8QqrZBtdLZ0kWZBF56wQtccsIjZkl8VdsuFsLEIDQRjucoJpCrs310da4Ipwgqdrim73/z/FVrHJ6S5gx53Sr8EUskPPE+3og6eMvSjITqPNd1XNMr2IZSAF/IR6fuA+QaAPo4xktlz0YZONzBF7vdCz3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DmK0jtN2SMcGMOlx7rLXibuUM6JCMQ8+QE0LkmBlqls=;
 b=nDUudoJ4IVtb1dNbV24XWZ2RVhLwJo290o9cuZHFaC4b/ecxkg9OHT9wsSx2Xs9OnR7S2zAZEYVh8D7ZsyCoCA1jvbTuHlDQ0GELyaFqxxG/weyRbiCLYlppoQiDMeKxY+iIfxMSbS25viPEmWpBqslrJK5u0v7n7VF5IuVOFUk=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v5 06/18] xen/x86: introduce "cpufreq=amd-cppc" xen
 cmdline
Thread-Topic: [PATCH v5 06/18] xen/x86: introduce "cpufreq=amd-cppc" xen
 cmdline
Thread-Index: AQHbzuRARq8PSmkmBEm8nuMU3PtyjLP/b5OAgArbRUA=
Date: Thu, 19 Jun 2025 08:43:59 +0000
Message-ID:
 <DM4PR12MB8451AD27C6E39F0781749156E17DA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-7-Penny.Zheng@amd.com>
 <3edeeff2-5728-46cc-9436-01e5e3cf2bd3@suse.com>
In-Reply-To: <3edeeff2-5728-46cc-9436-01e5e3cf2bd3@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-06-19T08:43:18.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|MW4PR12MB6873:EE_
x-ms-office365-filtering-correlation-id: e5f8d3f8-2914-4450-ac86-08ddaf0d6f97
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SFdOeTIwMTlxUWJCY0p0aGk2ampqUXZPS3NxeEpsaDY3WkF6UklZMHBVMkdk?=
 =?utf-8?B?djFsQU1pNWxVbWpwVDNKbVliQitYS0V2L0F2NmdTMVpiWHo1WGw0YVNhbzFF?=
 =?utf-8?B?MWNETFFLbEZ3U2RJVFl6UUxDekZrUy9zNzJMLy9RMTVkamdrc0dHcHN6dm5S?=
 =?utf-8?B?WUgyd2xMZHE0VkY1UWpJZlRlbXZBb3VlcG5BVkpsN0l1bGxtUEtlaHhkamZL?=
 =?utf-8?B?cnhwR044WXpwUzNybzA2Zmw1bSt0dDAyb0RSMDA0RlVuTzFSWHlSR0QvdXJh?=
 =?utf-8?B?TnJmV1VqWXU2OUxzYjVGTDZIalRCM0cwRXQvVTZBaG1NOHovYm92M3JOc2gy?=
 =?utf-8?B?bml3MlgrNXhoVVlhN2IyNzQ0QWs0cEphcHphWlA0YXZ4SDJyZy96N0FZNXdu?=
 =?utf-8?B?bGY4U0Voci9zZmE3ajRramJVOUZIQk1UYXJiNk81ZVBTMDBZZG41OHpDakNN?=
 =?utf-8?B?bXlRWEtPM2tGcDhBeEpSMmJNMHNoMmF2bVJvczJCU2JTOUs2Z04xZzlMTURi?=
 =?utf-8?B?eWlEUnRyZWVuZ0wrRzQ2b3N0QkRHRTlIRFQyTytPdGoraEpPK2p1MzJRZHNV?=
 =?utf-8?B?OERIdUdxOFgwTmYxbUFKNFZnQ2tPMGZwNVloTUlpRGFPREMzU2ZiSkc3VFQx?=
 =?utf-8?B?bEdLVVhyL3JuY3FrM0xjK1pTNjRzV3FkOGFFbHJIbHFmRzRHdnpsc0xCVmRt?=
 =?utf-8?B?a0NMYVA2aUxVWUI3NHNDWDlSMEFDM05rOVRXOE4zSXdNTnBUTkFvd0VGSHRE?=
 =?utf-8?B?Ynh3OTJEais4M3lYUmt3djh6Y1RGSjhwNmNqWDB1NHd4TWVzRkVKcGIvdkJE?=
 =?utf-8?B?Y3B6TG9KVENrd1hTVWhmU0xxUFVqN0JLVzloV3F0bmI4bHFsZWpkaTErVDJS?=
 =?utf-8?B?V1FONnU3NFlUNHA4YnNnWWg5Ym1zY1RWWnpndCtLRXNHWWpCdVozZWRmd09P?=
 =?utf-8?B?bEczOWVJWmNRMkY3RkJtMGdwZE9SOGhVeXgvcm5oSnpJbTJ3VlU2MjJKTEQ4?=
 =?utf-8?B?Y3RlWVVUWVY3ODBiNUZsSHNjNE5ERmc1N3F4MXF2dnNPT1prcXpCbkpSekxC?=
 =?utf-8?B?VUpYTm1FSlp6Y2diS09uMjFtZ1MyMEFnZ2hxeitSeEtjMVFEU2FId0V5V3dV?=
 =?utf-8?B?dmEzQ0VMMkNRNThVSC9LZXJ0Y2k3Z0pRMUlrbFQrL2lqUmZJY2NocjJUaVJk?=
 =?utf-8?B?R1o2bDkyQ2RKTXp1QjZSSjZYaDM4SFEvOUsxWFFGM0hhbzJYUEJ4VFF3Wmkx?=
 =?utf-8?B?d0xoS29rTHA3TjhsaXZjQXhlSXhTazkvNlpJQjFEeTV2TG5KbzNFZU1SVS9l?=
 =?utf-8?B?eEl1TGhNUlhKZlorSU0vTkNUaStBODJtY3U1RkJ6MGoxRExCUG02QWtoeUR0?=
 =?utf-8?B?eE5wZzA2YitXRjBWaVhVSkQrNUxTSDh0eC9WSGdMc2szQzRtaURMaU5nRWpo?=
 =?utf-8?B?c1FtenQ5cjRwZ0FEaVA5ajNXclcyUmlpV1BmcE1MUmF2RTg3Vm9KY2diZlRL?=
 =?utf-8?B?cFFVUHhYcHZuekFTdWJzUkhPMmErQlVvQ1RVTFE1SG1vVTZhR3g1bVgwSVJ1?=
 =?utf-8?B?ditRcjJTNm9FakQ3aERFM0dPUENtTE4rZm9kVmYwTVN6aTROSnF4TTB1RTk4?=
 =?utf-8?B?QUg5QmpJa2NMTWNicGp3VkpIUmJOZHpvd2RERWJOb250enFUKzdQMVBHZVVk?=
 =?utf-8?B?R3ltTTVNZ3d2czdLT0htaVF3d3JCMWhkalRwWEUxQzZ0NWsydVdJKzMvQjlm?=
 =?utf-8?B?S0VSZmIrT1c5Z0I0ZUtnQmxuTE9SQ2hhdytUV3VBK1kxcDlxa2cwSmpGVVp1?=
 =?utf-8?B?RUZGdUhyeWdyNFU0WFV6MVRwRWdsSVJ4TTl2ZEFCS3ArRFhRNGlheHdYZ3kr?=
 =?utf-8?B?d2N5SjZDSGFnUGJVamtKd2xUTzNTWXVjSml1ZHQ0TFNUQUVvalljUEhuSzJU?=
 =?utf-8?B?WjRDQXg2UmtwWk43NXV0TUpTRHlzNjhuU3RqYklBL0xaVEs0Kys4Y0dFR3Ex?=
 =?utf-8?Q?ybEgMQFJnFwoPmgmSa31Eymf7MhLWA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S1JLZlZGZmVXSFlIZVY4OThEYW1nMzBVS2Q4eU5DRjZHY2Q4a3JVVFBqZDUx?=
 =?utf-8?B?S0hmWFVGYUFqVVRsdjNYZExSNjZnS1d0cHVXSkllNFZkZ1J6aVZ2NWs1Zk4v?=
 =?utf-8?B?OUVzOFBRRnpqdC85TXBqUm8rTVhvZjZOTVMxOEFCZ3RMR1p3NkZaZ1pNSlJB?=
 =?utf-8?B?dm5xZlFMSFE4cG42M0NtYXYyZWMxd2xXcjdHTk1xNmcya3VhTy9jOVBBN09T?=
 =?utf-8?B?ZlVCaHdaS0JsS0VTd3BSOVpKOXB0WjBhYk9LMjlVdWFGaTQrME1lQThLMzBi?=
 =?utf-8?B?cnk2VDQzeHhSdndRR29lT21QY2gyNktiQUg4T2hBRERSQVZtbFNoZThRTTN4?=
 =?utf-8?B?WGx2Ym9HbXR0TS9nZkN1eWxSZjRzalBZK1M5U0psUkhRejA1UzVmeFhlRGlH?=
 =?utf-8?B?VGo1aEduZEtRbEtwTmRuQ2VPb1dCdURQNTkzUE1jOWxEUnIwUm56Qmx4ZUNE?=
 =?utf-8?B?djJvcE5qYTA5QnAvNzB5QXI5ei9SYlpQYklrZml5elk2WGJaQXJsaGg2cWFN?=
 =?utf-8?B?QmF4R3lhak03ZXp6OTByUTBobUc1NEF4aVJnRXdTYllpUEZ0VTRaWG5PUUJr?=
 =?utf-8?B?YnJmMXVKSmtubVRHL3VLaXI1SGtPQ0VEMDhGU2pvbDNiM3BBWnpzNExCb0tZ?=
 =?utf-8?B?My9TRHRyK3JIOVZPc0xpNEhacTNNQk42YXBZY2crTGZqbTV1aDNaTFF1ZTF6?=
 =?utf-8?B?QlBYUnhWbW1SSjY5bzdoSk1halkxaEFCdHo5SUNjc3lzcEJJQWxjc0pJS2tR?=
 =?utf-8?B?Y1pFSFNjQjVFSkdQa0JMZmN2TGxtQ3ovajl4cjFWOEhWbUEyNmhxcjBsa0tn?=
 =?utf-8?B?WVoyN2NqZFNsQnRtd2wxbVJFT1E1d1ZCWXF4VVpkTzh0WDJjTlhJRTBYalgz?=
 =?utf-8?B?RkszQ2VHZ0lyRFhoU1B2UGhhb0drT3A1WHlJcDNwZnJKaGZyRWREM1YrbXJy?=
 =?utf-8?B?blJ2MGUwTDFqS2xmay82ZWNCNWF1TjZyRlVLMVdwTVRqWUt0WFNXQmM1VmNL?=
 =?utf-8?B?QWVSVWtRM3dYdUxmcUUwSi9TWFAxQUszUmt6dS9nMVQ4U3ZXSG9BSzdCMnU2?=
 =?utf-8?B?QWZhZ3RlTFBTeVdhYWlnUGtIVlF4cE9WZDZRbTRvbUZiMkR2dkFHbVNyUXVw?=
 =?utf-8?B?a2tLd052SW1ZcVcyd20xaHJTQ2h0TlJsODhjRkNtK2RpNHI3QVR1aFNBdFc1?=
 =?utf-8?B?eGE1VWVSSFZTb1c0bVZBcHF4bnh0eWxZUkZmcTgzbERmSTJLSzYwZjlUUlor?=
 =?utf-8?B?eDhMRUZ5c1d5amxOQmtiSlprYm1Ob3U1ZjRncG11ZFBxMzhPdk9IYWY1UUho?=
 =?utf-8?B?eTkzUDN5SHNuS1BFUXM4WXZaeGluajM0MlpuVllJbURZWTR2QXozMXJyaWxm?=
 =?utf-8?B?SjRncTZjR0R4QzBOZVlrbWJGcmFQWkhXUkFYam5FbHZVaVZpUFZ5aEp0MlhV?=
 =?utf-8?B?cTF6MDYwK1NTemxvTUxrenl3QlZLZHhwN29Oemp1WVBjN2h5eTVTZnZvaUtm?=
 =?utf-8?B?SXVJdXlySEFPd3k4UU1TVHczVm1hQkswK2VwQUpBZWxHdDh5WWxCOWlJbXAv?=
 =?utf-8?B?S2R6VDlLd1ZYZTBLaGp2V1FiYUtHQ1IrR1BjN00ycmppWWR4a2ErYkFReTFs?=
 =?utf-8?B?QUhuVUxmbC90elcrUHFkWWdjRHYxSzRZZTNoNkI4Tno5UUpzSlJxcVVyZTFN?=
 =?utf-8?B?akZYYmtvajhBZTRnaFNFZTArUXZBREROZkJmdkV6RVUwK0QwVkhqYUwybVA4?=
 =?utf-8?B?UUhaUlFZV29SUkRXeGRWdTBCWjlwZVZSS1dMSXhCRU04SWJuZ1crcHMwTHZL?=
 =?utf-8?B?ek9vNUtHR2tRYTZzUVFva2tGendpVkt6aElVaWN1M29ObGFIODNWNDVTWTJ3?=
 =?utf-8?B?MHIwSWZwMnk3MlR3Y29UY2pzVmFyZDdoeEZiK1I4a3p2eUJTOEQ2ZjgzMXF4?=
 =?utf-8?B?aHo2dk8rSHQ4UUgvU2tHMC9QNE1ucmVpdFhLTndqVEFmSjZpVGY2YnlMZEU0?=
 =?utf-8?B?M0x6RVBiQkxqMW5nVkg5cElmS0xoS3VDa2ZlR2RFSDI5ckc1SUE3NXlFVnJV?=
 =?utf-8?B?TkNPdU5RcGVXVHVEYnhndFA1WVEyUEhOVmJFeDM1aS9qRnFWZXlyYm1CQmJy?=
 =?utf-8?Q?+Jw0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5f8d3f8-2914-4450-ac86-08ddaf0d6f97
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2025 08:43:59.8032
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vISSWZ4u6DrcTGuYeyM8L3xF6SG88hiSDlG++bLIpx3toR66twATq1OQYu6+cf/OO5AnGbS1Gs6zOaRObzHmxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6873

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBKdW5lIDEyLCAyMDI1
IDY6NDIgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4NCj4gQ2M6
IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgQW5kcmV3IENvb3Blcg0KPiA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT47IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEB2YXRl
cy50ZWNoPjsNCj4gT3J6ZWwsIE1pY2hhbCA8TWljaGFsLk9yemVsQGFtZC5jb20+OyBKdWxpZW4g
R3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgUm9nZXIgUGF1DQo+IE1vbm7DqSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyB4
ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djUgMDYvMThdIHhlbi94ODY6IGludHJvZHVjZSAiY3B1ZnJlcT1hbWQtY3BwYyIgeGVuDQo+IGNt
ZGxpbmUNCj4NCj4gT24gMjcuMDUuMjAyNSAxMDo0OCwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4g
LS0tIGEveGVuL2FyY2gveDg2L3BsYXRmb3JtX2h5cGVyY2FsbC5jDQo+ID4gKysrIGIveGVuL2Fy
Y2gveDg2L3BsYXRmb3JtX2h5cGVyY2FsbC5jDQo+ID4gQEAgLTk0LDYgKzk1LDggQEAgc3RhdGlj
IGludCBfX2luaXQgaGFuZGxlX2NwdWZyZXFfY21kbGluZShlbnVtDQo+ID4gY3B1ZnJlcV94ZW5f
b3B0IG9wdGlvbikgIHsNCj4gPiAgICAgIGludCByZXQgPSAwOw0KPiA+DQo+ID4gKyAgICAvKiBE
byBub3Qgb2NjdXB5IGJpdHMgcmVzZXJ2ZWQgZm9yIHB1YmxpYyB4ZW4tcG0gKi8NCj4gPiArICAg
IEJVSUxEX0JVR19PTihNQVNLX0lOU1IoWEVOX1BST0NFU1NPUl9QTV9DUFBDLA0KPiBTSUZfUE1f
TUFTSykpOw0KPg0KPiBUaGlzIGxvb2tzIGxpa2UgYW4gYWJ1c2Ugb2YgTUFTS19JTlNSKCkuIFdo
eSBub3Qgc2ltcGx5DQo+DQo+ICAgICBCVUlMRF9CVUdfT04oWEVOX1BST0NFU1NPUl9QTV9DUFBD
ICYgU0lGX1BNX01BU0spOw0KPg0KPiA/DQoNCkJlY2F1c2UgaW4gU0lGX1BNX01BU0ssIGl0J3Mg
Yml0IDggdG8gMTUgcmVzZXJ2ZWQgZm9yIHhlbi1wbSBvcHRpb25zLA0KU2VlICINCiNkZWZpbmUg
U0lGX1BNX01BU0sgICAgICAgKDB4RkY8PDgpIC8qIHJlc2VydmUgMSBieXRlIGZvciB4ZW4tcG0g
b3B0aW9ucyAqLw0KIg0KU28gSSdtIHRyeWluZyB0byB1c2UgTUFTS19JTlNSKCkgdG8gZG8gdGhl
IG5lY2Vzc2FyeSByaWdodCBzaGlmdCAob3RoZXIgdGhhbiB1c2luZyA4IGRpcmVjdGx5LCBpbiBj
YXNlIFNJRl9QTV9NQVNLIGNoYW5nZXMgaW4gdGhlIGZ1dHVyZS4uLikNCg0KPg0KPiBKYW4NCg==

