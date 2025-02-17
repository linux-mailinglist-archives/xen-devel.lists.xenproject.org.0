Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98812A37FB3
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 11:17:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889991.1299018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjyBp-0007vr-FV; Mon, 17 Feb 2025 10:17:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889991.1299018; Mon, 17 Feb 2025 10:17:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjyBp-0007ss-CL; Mon, 17 Feb 2025 10:17:25 +0000
Received: by outflank-mailman (input) for mailman id 889991;
 Mon, 17 Feb 2025 10:17:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eS2x=VI=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tjyBn-0007sm-Iy
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 10:17:23 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20612.outbound.protection.outlook.com
 [2a01:111:f403:2408::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ee02c88-ed18-11ef-9896-31a8f345e629;
 Mon, 17 Feb 2025 11:17:21 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 SJ2PR12MB8719.namprd12.prod.outlook.com (2603:10b6:a03:543::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.14; Mon, 17 Feb 2025 10:17:17 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 10:17:17 +0000
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
X-Inumbo-ID: 5ee02c88-ed18-11ef-9896-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UCmkRYRf7LF1qv6MS4hmBuUTfSFNMbRbPG3oo/mzUC1zSV9GE0rmhVZZSUZw3XGCwAs9axOhaMuimf8e71FfkVWTzhlIJTnh4Oy80lAvhUHIpRAP/sa9Dc2mU9of0mPD6Ix+ZWRd6o1B3WU5yjfUDwmcYutV6P6L+7GCEUPYJy90l/LNysKsgxRyg5MD6FnB2iGUbSC8JOXSrYV/v9WM43CpcssNy1pxbr/f4OPaykRM4D4eyAlv0KWfNzFCsMqlRmYcLMO9oCu5S/IR0VhKI9DONeRENz3yQ3zoYBRHodGXeDwRvsJK5mVNgEZIv+IPZeiif8ZX/JD/jmt+NThxcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSB4x377Q8EOZy0USqfY9YpsFQJRszHITxUbuL6Fum8=;
 b=mz6ouaRZXFNl4n8zRssBEI4/vU8744DBOfBFp7mt3+xkrIZodeXAAW64BnbVyRgoPQLDqTfymjG//6PElFEYpM8YtCyN/MrRw8TdMblp9nsbc9/XGDgrkSPRRS7UmsFl+ee+wPTwywMrZqCB3jVbgLHOMYsWppeArI+xkp9refVq1XL5HK2vMojr0PSoszmGGN+OjgbNHgv4zaqBhE2gBOihvGjaboJHS8xATqMhPQo8I8QS8tw89PqjmAfcEI6G3Vg/hYOrAat9apFrgBQFTyXXI8lHVxp2HpnGYynM+vJaY2Zo+sKWnLEesQdWpX9uX2FazfenpUkZTQ1GZLg9nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSB4x377Q8EOZy0USqfY9YpsFQJRszHITxUbuL6Fum8=;
 b=uHz7yIuo1PhUWTp1BYlEssxnTAVBkOtEC2B8+665pgImCXiKMoWW961XP5MVOPHyPUnG86Q17I2Y1Uhr+o8DewmbmgVI4CBZjZbFUmTBAf2lEpCdf+rBdQgs3P99gtTSAKcabH6wZE9C5GwyONHyVXFRe3MkJ0wJ56rdJB155hw=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "Andryuk, Jason"
	<Jason.Andryuk@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony
 PERARD <anthony.perard@vates.tech>, "Orzel, Michal" <Michal.Orzel@amd.com>,
	Julien Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 03/11] xen/x86: introduce "cpufreq=amd-cppc" xen
 cmdline
Thread-Topic: [PATCH v2 03/11] xen/x86: introduce "cpufreq=amd-cppc" xen
 cmdline
Thread-Index: AQHbeHHOqjf30im2P0K06mFnJR527rNCCo2AgAkjUfA=
Date: Mon, 17 Feb 2025 10:17:16 +0000
Message-ID:
 <DM4PR12MB8451A3D08427CDD412AA650DE1FB2@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250206083255.1296363-1-Penny.Zheng@amd.com>
 <20250206083255.1296363-4-Penny.Zheng@amd.com>
 <ed8af131-7f1b-47db-8d28-553977a4f3cd@suse.com>
In-Reply-To: <ed8af131-7f1b-47db-8d28-553977a4f3cd@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=01938b22-6aab-447e-8cc7-659f3bcf125d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-02-17T07:41:38Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|SJ2PR12MB8719:EE_
x-ms-office365-filtering-correlation-id: cb556742-b18b-4ed9-2c5f-08dd4f3c4164
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RExQdWJqV056cE84TmRnOW9IaG16M3NOdWFlM1diMll1ZEtYVG5SM2FaL3dV?=
 =?utf-8?B?aURuQTFiQWh3cnZBOWhhVnJ3RDd1eXJZNDk1RzZVbitsWFZ5SHdQd0VzY3Bn?=
 =?utf-8?B?dnd5elhXZGhpcmZOK3BFM2x1TGdPMFRUVnFvRzBRR0R3L3RzRTd4THJMbmxX?=
 =?utf-8?B?cEhIV011dFBMb0xVanpvNE05ZmxjS3Q2UVlYQUs1RHRweEhjK2c3UHVHdldm?=
 =?utf-8?B?VjNaaU9aMnVzWXM4YnppZGZ4ekJsWHBuMVIxYTlGdDdyOUFuK0Fmd0ZvVlRU?=
 =?utf-8?B?WjVJalpjdk9LQ3UzNlhpQUtiekVJSGlrSkt5OTV0SVp1Q3puc3hEdFBxRWRt?=
 =?utf-8?B?OHRGRlVhSzZpV01xNHY2Si9SdjNWdkpLeWk2UDFnb1ZHTUlPVXlnbWJhK3U1?=
 =?utf-8?B?WUViR0N6R2M5RGRQTm80VGZORHhhdmNBTU0yRnJyTS9SamxLSkdsK3JFSmNq?=
 =?utf-8?B?TDhyL01lL1lCMml6UzdPakhHVEZFaTB4NXNOZTVTN1pXRFgrYUxoN1MvQ1Fx?=
 =?utf-8?B?ZVhTUEFWeHdxM0pQODBFd2hJL2ltTHlRU0U4dDE0cDB3RmV4M3JOYlBNdm5E?=
 =?utf-8?B?RHpKdGIxNC9aeWkxOUpteVFTVnE4dTFJZGxIQjJjWkJtb3l5Vjh2VXNJaC9z?=
 =?utf-8?B?SnVMUGd6WjlzS01SeUNTUUNreEdjUDNsbHBFTGtyVk10UlFpdjgzeDhNK0Vi?=
 =?utf-8?B?MzlxOVZ5OVhCYmNWNXdOb0I4VVVvVVZUa3lTejJYVHF2Rk84QndUVkplYVQ4?=
 =?utf-8?B?VDlaN3pkS0tLYWYrZ3Z5RnVseTh4OWJPZzdrWkJxTHZneXROS21iTEx1V1Ay?=
 =?utf-8?B?Wnp4aWs2dGREMmZhQjZ6emJNenBic09qSkFhUUt2MUNuYktyMWswVDIyTHV4?=
 =?utf-8?B?d00xT2JlcW5GVlNJNVY4MVlzK0tITjdtcm1aeWF3Q3RHOW51emFERktrK1I5?=
 =?utf-8?B?S0lQUm5nUEVzZmgydjVJTVFtU2hTUXJLUXNaYktQQUsyVWNEaWVWTnd1Qk9B?=
 =?utf-8?B?UGk1WmpVUWcrMndjNHpjb1VHaW1WMTU1QnliOVZsZERMbWFXN2tBOGl0Yjdu?=
 =?utf-8?B?L09xRHFUMGw5MjVQdmQzZHZlYzdKK2dxWk9GUG14WHZkRmtiSU9ZZWdOY1Bz?=
 =?utf-8?B?Z3Z2R0tITjlCeHdxUlB2Y211VTBrNkIyeVM5NWlSUjJLQUVsQXRNY1haL0RB?=
 =?utf-8?B?S09Wb0VYM2Jsd2xBdVVRSkl0eXdkVjZsSDk0QkJLbTR0WVU1NUVMZmdkTE9v?=
 =?utf-8?B?WUhKRmJCb3MxbXdCWFZtTGF3ZmVrc0hFQ0xoUWtMbmszSTIwcnY0c1luVUtV?=
 =?utf-8?B?VWNlYWZIa3NVR1lHcGVnazJrdFMxdUpNVFc5a1I1M0FlcXpQWmJ0Z0JRRVd2?=
 =?utf-8?B?b1Z1QUZ1Y2RNQTRoYUZBa0lVY1BpSFdjeVo4QlVVejlqUzgxK05PVGRUQ2lW?=
 =?utf-8?B?SkhhcjJjSS83V1QyT2NGbThaY2NMcVNHVnY1WVJFY21VQ3JtT0FFSGNjcEpt?=
 =?utf-8?B?bmFCTkRqTG14Mlhuelc2aThYSm1nWlA2RUhOekIrbVQ2QmgzV08wdi9TdUdC?=
 =?utf-8?B?RlAycmxhSVN3SDVjUkJ2YnEwN21VeUdSbGFQLzJkQXF4QnRPRjJDanNmUk5Y?=
 =?utf-8?B?YWQzTXlHZERMcy8xcm12VDAwVVo0Z2tHSFlJT2RuMkRJVFQ0aXdwVzZTRGlJ?=
 =?utf-8?B?Q0RnYkp0aUpJM3Bnb3ZPMGVJSWZtT1FVanZyeE1SYUlCOVBuRzFPUjRYMEdB?=
 =?utf-8?B?cHVpejljemN4UGhkTVIrWnpJM0FqT1FCNk5xQ0NOMlRpVTJXbDd5a3RNa2RV?=
 =?utf-8?B?VER4ajRwRTBVdGxEVGdZR0ZSWHJTd1UwWEtCQ3RadlFlNGVpVjVEQ2lsTkVs?=
 =?utf-8?B?azhubXVVNkxzcldySGFXK3lxVVVSQXB4TTJuNFY5L2JYbTlDRVQ1L3NLNUJ4?=
 =?utf-8?Q?ZMM0kiN0Rta7rTIsPw63IMY31vna6fxK?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YzNvUU1rdDBuN3c5c3l2bWY5WjFsOHd5VzUzNHA1VkpKdGVUWjFQdWtRM01F?=
 =?utf-8?B?QUsyRXRJa2Y2TUoyVStZcDlEbUc1N3AyYkdVUVp1T3gxd3pkRWZsUHExMnFG?=
 =?utf-8?B?eThWNXhHRXVvaEk1UFhrWElVaHhpRkFVcVVNazViT2pYS09BM3htd1h6Z3V4?=
 =?utf-8?B?OFlCWkgwRFByZFBrS1c3VjdSRldHb01DUUlsQWJGcHBRRmdpSjliN25FcXkz?=
 =?utf-8?B?T0hIUTlMajR5NS9ITy8xb2c2TzdiYmd4VWR5RHJuZUZBby9FYUQrQ3VPSHJK?=
 =?utf-8?B?WGpsRzV4MCt2WFAzbHY5eGxCeEE2TlNKQ1lUR1BxU2FvYTkrZFEzL0lNV1Vi?=
 =?utf-8?B?SjZVTDl3aFBqRXM4ZHJUV0JQZXJ3S0hoajZ6ZUdaOWRxTWVhMjYwamlITWpB?=
 =?utf-8?B?NHMrWFZTWHhCMlpjaW56anNxUG54U0wwclNoRndUVE1pdktZNjF2cXpoakZS?=
 =?utf-8?B?TTNTNVdCKzJSYUM2ZVllOE9URXNmb0ZaNHQrZ2hSSzMwenhCWm9KTnN3WVl3?=
 =?utf-8?B?NzBjVWk1MEQrUDJKWGRZZVFmOWZUdk9UVWRTd0UzTDZhU3VjY2N1UzhveVpp?=
 =?utf-8?B?WlFCeUgzTno3eFJ3cUwrRk95V20vN20xVlVLSVQ0Z0lHczRtWStjMHZkb3Ru?=
 =?utf-8?B?R2g5SmtZWDVMa1MyVGhNbHBwUTZJN1I2U2VaSDhPNmxJRlRmeFVnTnc1YUg5?=
 =?utf-8?B?Ly9rbXZHckxKUVhBRnpKS2Z6M0U2M0RHRk93UitTMG0ya2I5MmJQRk4wWitD?=
 =?utf-8?B?RHpSRmsrOFFzRXVWY29NL2hkZkJ4RW1MY0dkNzVuVUpNd042Wk1vczRNTnpY?=
 =?utf-8?B?WTA5VkhibldEY1RLcGUvWTgzSjFtZ2lDeE54QUFGQ2xhUWw1dEdQTG5XNFhn?=
 =?utf-8?B?d1c1NCtXZ1QyRHIxUkt6NzdpQ3ZUQ2tiV0RjVEJQWCtKWEM4ckZ4Rk1leHRO?=
 =?utf-8?B?ekZKNldoU0RlVHJJUkdOYllSMk15ZjlBdkxwaWprMlpFcmZYZnZFVEVwcjBT?=
 =?utf-8?B?RktGK2RsOXkxdnhDa1NaQXQvOEVxZ2h6QnduSE9LYXJETlM3SU9wc1BYWVNk?=
 =?utf-8?B?QWY1VWhJajhpN2tFaXNENXNmODNkZjVUeVNYdHlDZi9HNnNCU2ZkbGdldXdX?=
 =?utf-8?B?UkdFRUxXbGJYdlRZOTlxZEt5YVF5b3h5RENTcFlkTGdJRlhrSkljbVVDTStl?=
 =?utf-8?B?cGJpR0lKUkRwOGVxVk4vU29xMExoWHdiZE1CNTAvenczK09xUWoyaXppSC9G?=
 =?utf-8?B?UThxazI2V1lGai9zRHZFdzVYaGN5alIwQVk2RHdzcWxydXNtNW4zcUdnMHFi?=
 =?utf-8?B?US9wT01jczZ1TnlseTFzeW9BYXJtSEJaZklhOVV4WWhWTUszUVdXWkgwSFhS?=
 =?utf-8?B?QzJOclBRajhoMXc4blVvb0s3WUp1c2lWTWc3SmhFcFVHOWtkUWEyUjhYMFVR?=
 =?utf-8?B?TEtOeEsrT1lwZDVxWllkS2FOZEl5N1RwcG9hOWhaL3FaajVOVU9rOTIvQzFP?=
 =?utf-8?B?NHoyR1BZNUFYRWZNVitLT1NJSEdnUGp6b1BPVFVHOCtZR0ZiS0IwYlFRelNO?=
 =?utf-8?B?a2x3UVM1TlljQmdOZHY1SXJFaXNrUitaTXpYZmo0UzcwRGc4TEU2ZHo3RTVm?=
 =?utf-8?B?cFFubnA0bU8rSUFFWW55OU1pR1hBWnZLaW5iamoweUphU2lWbEQvcURhNlhF?=
 =?utf-8?B?VVJ2Rmw2TFBQWnBjWjdqZkEyTm5zdThzdTJEY3FRM1JHZG5pUzNndm84QWVk?=
 =?utf-8?B?bGhZZi9tSTRzT003RXRvcStRZFR4WVY4M1ZONmFnM0NHWUhvOHNNOVJnU3lC?=
 =?utf-8?B?UUM1ekgxNnRTT0hNbmlVcUQ5bU42Q0srMGZzVE5iUGwzeEJlOWtTMUdsM0po?=
 =?utf-8?B?SnpxUHBROUVVQ0Q1YXRYcjdILzE2S0RqRi80eU40Z01XQmRVNkVoOENDRXBH?=
 =?utf-8?B?QndvTlNmcVYweHhnd2pvZHRob2ExYTV1RFV1WmJOU0huSlFCUWYvVnF3S2Zt?=
 =?utf-8?B?blA1MUhQOXBwTnZTVFArVCsrWjUyTGVLbnV2OHQ0RWxGbkFRSkNBam90YW4r?=
 =?utf-8?B?MENELzAzV01ISnNIcG5yWWJXUXNyZTk5SC9iWXhLNVRNeENrdzdyRHFYaWZ2?=
 =?utf-8?Q?Epvk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb556742-b18b-4ed9-2c5f-08dd4f3c4164
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2025 10:17:16.9591
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HGBQMBm/jPYiw/TLhHnl7yrYkdRgZeU6Qdjo0IKA2Dq2e7PQJKTZpHANjbuxvuaKtaC6JLciK/tQGwKTknCkOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8719

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBGZWJydWFyeSAxMSwgMjAy
NSA4OjA5IFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+DQo+IENj
OiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEFuZHJ5dWssIEphc29uDQo+IDxKYXNv
bi5BbmRyeXVrQGFtZC5jb20+OyBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPjsNCj4gQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQHZhdGVzLnRlY2g+OyBPcnpl
bCwgTWljaGFsDQo+IDxNaWNoYWwuT3J6ZWxAYW1kLmNvbT47IEp1bGllbiBHcmFsbCA8anVsaWVu
QHhlbi5vcmc+OyBSb2dlciBQYXUgTW9ubsOpDQo+IDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFN0
ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IHhlbi0NCj4gZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAwMy8xMV0geGVu
L3g4NjogaW50cm9kdWNlICJjcHVmcmVxPWFtZC1jcHBjIiB4ZW4gY21kbGluZQ0KPg0KPiBPbiAw
Ni4wMi4yMDI1IDA5OjMyLCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPiAtLS0gYS94ZW4vYXJjaC94
ODYvYWNwaS9jcHVmcmVxL2NwdWZyZXEuYw0KPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9hY3BpL2Nw
dWZyZXEvY3B1ZnJlcS5jDQo+ID4gQEAgLTE0OCw2ICsxNDgsOSBAQCBzdGF0aWMgaW50IF9faW5p
dCBjZl9jaGVjayBjcHVmcmVxX2RyaXZlcl9pbml0KHZvaWQpDQo+ID4gICAgICAgICAgICAgICAg
ICBjYXNlIENQVUZSRVFfbm9uZToNCj4gPiAgICAgICAgICAgICAgICAgICAgICByZXQgPSAwOw0K
PiA+ICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+ICsgICAgICAgICAgICAgICAgZGVm
YXVsdDoNCj4gPiArICAgICAgICAgICAgICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5JTkcgIlVu
c3VwcG9ydGVkIGNwdWZyZXEgZHJpdmVyDQo+ID4gKyBmb3IgdmVuZG9yIEludGVsXG4iKTsNCj4N
Cj4gU2FtZSBoZXJlLiBUaGUgc3RyaW5nIGFsb25nIG92ZXJydW5pbmcgbGluZSBsZW5ndGggaXMg
ZmluZS4gQnV0IHRoaXMgY2FsIHRoZW4gc3RpbGwgYmUNCj4gd3JhcHBlZCBhcw0KPg0KPiAgICAg
ICAgICAgICAgICAgICAgIHByaW50ayhYRU5MT0dfV0FSTklORw0KPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAiVW5zdXBwb3J0ZWQgY3B1ZnJlcSBkcml2ZXIgZm9yIHZlbmRvciBJbnRlbFxu
Iik7DQo+DQo+IHRvIHJlc3BlY3QgdGhlIGxpbmUgbGVuZ3RoIGxpbWl0IGFzIG11Y2ggYXMgcG9z
c2libGUuDQo+DQo+ID4gQEAgLTEzMSw2ICsxMzEsMTUgQEAgc3RhdGljIGludCBfX2luaXQgY2Zf
Y2hlY2sgc2V0dXBfY3B1ZnJlcV9vcHRpb24oY29uc3QNCj4gY2hhciAqc3RyKQ0KPiA+ICAgICAg
ICAgICAgICBpZiAoIGFyZ1swXSAmJiBhcmdbMV0gKQ0KPiA+ICAgICAgICAgICAgICAgICAgcmV0
ID0gaHdwX2NtZGxpbmVfcGFyc2UoYXJnICsgMSwgZW5kKTsNCj4gPiAgICAgICAgICB9DQo+ID4g
KyAgICAgICAgZWxzZSBpZiAoIGNob2ljZSA8IDAgJiYgIWNtZGxpbmVfc3RyY21wKHN0ciwgImFt
ZC1jcHBjIikgKQ0KPiA+ICsgICAgICAgIHsNCj4gPiArICAgICAgICAgICAgeGVuX3Byb2Nlc3Nv
cl9wbWJpdHMgfD0gWEVOX1BST0NFU1NPUl9QTV9DUFBDOw0KPiA+ICsgICAgICAgICAgICBjcHVm
cmVxX2NvbnRyb2xsZXIgPSBGUkVRQ1RMX3hlbjsNCj4gPiArICAgICAgICAgICAgY3B1ZnJlcV94
ZW5fb3B0c1tjcHVmcmVxX3hlbl9jbnQrK10gPSBDUFVGUkVRX2FtZF9jcHBjOw0KPg0KPiBXaGls
ZSBhcHBhcmVudGx5IGFnYWluIGEgcHJlLWV4aXN0aW5nIHByb2JsZW0sIHRoZSByaXNrIG9mIGFy
cmF5IG92ZXJydW4gd2lsbCBiZWNvbWUNCj4gbW9yZSBtYW5pZmVzdCB3aXRoIHRoaXMgYWRkaXRp
b246IFBlb3BsZSBtYXkgcGxhdXNpYmx5IHdhbnQgdG8gcGFzcyBhIHVuaXZlcnNhbA0KPiBvcHRp
b24gdG8gWGVuIG9uIGFsbCB0aGVpciBpbnN0YW5jZXM6DQo+ICJjcHVmcmVxPWh3cCxhbWQtY3Bw
Yyx4ZW4iLiBJIHRoaW5rIHRoaXMgd2FudHMgdGFraW5nIGNhcmUgb2YgaW4gYSBwcmVyZXEgcGF0
Y2gsIGkuZS4NCj4gYmVmb3JlIHlvdSBmdXJ0aGVyIGV4dGVuZCBpdC4gSGVyZSB5b3Ugd2lsbCB0
aGVuIGZ1cnRoZXIgd2FudCB0byBidW1wDQo+IGNwdWZyZXFfeGVuX29wdHNbXSdlcyBkaW1lbnNp
b24sIHRvIGFjY291bnQgZm9yIHRoZSBub3cgc2Vuc2libGUgdGhyZWUtZm9sZCBvcHRpb24uDQo+
DQoNCkNvcnJlY3QgbWUgaWYgSSdtIHdyb25nLCBXZSBhcmUgbWlzc2luZyBkZWFsaW5nIHRoZSBz
Y2VuYXJpbyB3aGljaCBsb29rcyBsaWtlIHRoZSBmb2xsb3dpbmc6DQoiY3B1ZnJlcT1hbWQtY3Bw
Yyxod3AsdmVyYm9zZSIuIGB2ZXJib3NlYCBpcyBhbiBvdmVycnVuIGZsYWcgd2hlbiBwYXJzaW5n
IGFtZC1jcHBjLg0KSSd2ZSB3cml0dGVuIHRoZSBmb2xsb3dpbmcgZml4Og0KYGBgDQpkaWZmIC0t
Z2l0IGEveGVuL2RyaXZlcnMvY3B1ZnJlcS9jcHVmcmVxLmMgYi94ZW4vZHJpdmVycy9jcHVmcmVx
L2NwdWZyZXEuYw0KaW5kZXggODYwYWUzMmM4YS4uMGZlNjMzZDRiYyAxMDA2NDQNCi0tLSBhL3hl
bi9kcml2ZXJzL2NwdWZyZXEvY3B1ZnJlcS5jDQorKysgYi94ZW4vZHJpdmVycy9jcHVmcmVxL2Nw
dWZyZXEuYw0KQEAgLTcxLDYgKzcxLDIyIEBAIHVuc2lnbmVkIGludCBfX2luaXRkYXRhIGNwdWZy
ZXFfeGVuX2NudCA9IDE7DQoNCiBzdGF0aWMgaW50IF9faW5pdCBjcHVmcmVxX2NtZGxpbmVfcGFy
c2UoY29uc3QgY2hhciAqcywgY29uc3QgY2hhciAqZSk7DQoNCitzdGF0aWMgaW50IF9faW5pdGRh
dGEgbnJfY3B1ZnJlcV9hdmFpbF9vcHRzID0gMzsNCitzdGF0aWMgY29uc3QgY2hhciAqIF9faW5p
dGRhdGEgY3B1ZnJlcV9hdmFpbF9vcHRzW25yX2NwdWZyZXFfYXZhaWxfb3B0c10gPSB7ICJ4ZW4i
LCAiaHdwIiwgImFtZC1jcHBjIiB9Ow0KKw0KK3N0YXRpYyB2b2lkIF9faW5pdCBjcHVmcmVxX2Nt
ZGxpbmVfdHJpbShjb25zdCBjaGFyICpzKQ0KK3sNCisgICAgdW5zaWduZWQgaW50IGkgPSAwOw0K
Kw0KKyAgICBkbw0KKyAgICB7DQorICAgICAgICBpZiAoIHN0cm5jbXAocywgY3B1ZnJlcV9hdmFp
bF9vcHRzW2ldLCBzdHJsZW4oY3B1ZnJlcV9hdmFpbF9vcHRzW2ldIC0gMSkgPT0gMCApDQorICAg
ICAgICAgICAgcmV0dXJuIGZhbHNlOw0KKyAgICB9IHdoaWxlICggKytpIDwgbnJfY3B1ZnJlcV9h
dmFpbF9vcHRzICkNCisNCisgICAgcmV0dXJuIHRydWU7DQorfQ0KKw0KIHN0YXRpYyBpbnQgX19p
bml0IGNmX2NoZWNrIHNldHVwX2NwdWZyZXFfb3B0aW9uKGNvbnN0IGNoYXIgKnN0cikNCiB7DQog
ICAgIGNvbnN0IGNoYXIgKmFyZyA9IHN0cnBicmsoc3RyLCAiLDo7Iik7DQpAQCAtMTE4LDcgKzEz
NCw3IEBAIHN0YXRpYyBpbnQgX19pbml0IGNmX2NoZWNrIHNldHVwX2NwdWZyZXFfb3B0aW9uKGNv
bnN0IGNoYXIgKnN0cikNCiAgICAgICAgICAgICBjcHVmcmVxX2NvbnRyb2xsZXIgPSBGUkVRQ1RM
X3hlbjsNCiAgICAgICAgICAgICBjcHVmcmVxX3hlbl9vcHRzW2NwdWZyZXFfeGVuX2NudCsrXSA9
IENQVUZSRVFfeGVuOw0KICAgICAgICAgICAgIHJldCA9IDA7DQotICAgICAgICAgICAgaWYgKCBh
cmdbMF0gJiYgYXJnWzFdICkNCisgICAgICAgICAgICBpZiAoIGFyZ1swXSAmJiBhcmdbMV0gJiYg
Y3B1ZnJlcV9jbWRsaW5lX3RyaW0oYXJnICsgMSkgKQ0KICAgICAgICAgICAgICAgICByZXQgPSBj
cHVmcmVxX2NtZGxpbmVfcGFyc2UoYXJnICsgMSwgZW5kKTsNCiAgICAgICAgIH0NCiAgICAgICAg
IGVsc2UgaWYgKCBJU19FTkFCTEVEKENPTkZJR19JTlRFTCkgJiYgY2hvaWNlIDwgMCAmJg0KYGBg
DQoNCj4NCj4gSmFuDQoNCk1hbnkgdGhhbmtzLA0KUGVubnkNCg==

