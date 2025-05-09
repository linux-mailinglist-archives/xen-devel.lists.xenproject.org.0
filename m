Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFECAB089C
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 05:15:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979741.1366253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDEC1-0000R0-O1; Fri, 09 May 2025 03:14:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979741.1366253; Fri, 09 May 2025 03:14:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDEC1-0000Oz-JY; Fri, 09 May 2025 03:14:33 +0000
Received: by outflank-mailman (input) for mailman id 979741;
 Fri, 09 May 2025 03:14:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yxiy=XZ=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uDEBz-0000Os-RB
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 03:14:31 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2412::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b626edf1-2c83-11f0-9eb4-5ba50f476ded;
 Fri, 09 May 2025 05:14:27 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 CH2PR12MB9519.namprd12.prod.outlook.com (2603:10b6:610:27c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 03:14:18 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%5]) with mapi id 15.20.8699.026; Fri, 9 May 2025
 03:14:17 +0000
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
X-Inumbo-ID: b626edf1-2c83-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HIBuRKbNgnchziu9arHKtbMBcvRg+LSHv2bHXMjLiRvDLc2AncvaAy8OhvCVuDgdA4bgyG7L2UjIbEeq5wtCQb6q3E2xe0mMX+TMm7raS39CbyYpMoDpwh7Qjt9fiMbYq0dnHTfFnxOOH2G3/eTFGx5ZXHS4YSPgfGlG908kowhLZzPm+BsLIIBAXdFLd0Xg8Lcfdy/h2s+KNSBlNhF7+FsPNT32BLJF7d3dyB+eF2oBrLVkGeAKYI22GgaaE9SYDJguKvR2G/Fz5hIB/pYiDs2RASsww03w+KDWKmUcKN//k9JWg50UnqsQbzAf0hC9HbKMSDFCxjM3onJmtfy6sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2r/yog852ogEyjKEGCoySg2Zspyw8WgHf0Xvi/lWea8=;
 b=QnrbKuLsicYycuCebpWaGNPmZjohV2uoUwLqRk09ItK49udruBebKvh08oGMMXc2KNjjDQDQVgaR9aREIllkMqXeJQBjpETEdhd7nr/bxTnFFAntjvQWgU28oxOgqLpgrl81qXJdfqOJVarJ3r0xZAw56+bMQ9knllcx/vIxRxuqBvGP03jUNPdV6BVe/Eckld8muHPhSDvi/muSmNT1iuoOoBfYRu6NMPMqKTGUlhe3936wNlck9Nvzi4JvdlyRDw71PpNqKfaVrOb67iOVAp930cUBE8Bf8xhiHpxOoIP3MsI3HZtHQ2y/nTMbThYkO1v1Q+dmi5UXNgSVyt8g/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2r/yog852ogEyjKEGCoySg2Zspyw8WgHf0Xvi/lWea8=;
 b=hvMeXXb9wTNMmBkUhyP6u0cScTLLU4PusWQPLO++qOuf5zSOyCL+wGRB6Ed6ZOSao8mMu/uLAvBTvmjpieFAXYVDwjDn3HDMd61xumoK3UW9Vo8uS1YxnZgywaJqSGocBKofTnP7dx8Y+p3cqM4IJzWZG+cNLHFJ4MUeIFQ7WxY=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 11/15] xen/x86: implement EPP support for the amd-cppc
 driver in active mode
Thread-Topic: [PATCH v4 11/15] xen/x86: implement EPP support for the amd-cppc
 driver in active mode
Thread-Index: AQHbrRCuGuHP44zrR0KG5VY9cm/pkLO68EcAgA7Q8sA=
Date: Fri, 9 May 2025 03:14:17 +0000
Message-ID:
 <DM4PR12MB8451600459A923DA6786A306E18AA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-12-Penny.Zheng@amd.com>
 <b56cdeaa-7951-46f9-a558-d8a65bf8b237@suse.com>
In-Reply-To: <b56cdeaa-7951-46f9-a558-d8a65bf8b237@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_0fec2151-cbe0-4586-8a3f-997880a38a28_ActionId=e4682b6a-0079-47aa-899c-5b67ef962cba;MSIP_Label_0fec2151-cbe0-4586-8a3f-997880a38a28_ContentBits=0;MSIP_Label_0fec2151-cbe0-4586-8a3f-997880a38a28_Enabled=true;MSIP_Label_0fec2151-cbe0-4586-8a3f-997880a38a28_Method=Privileged;MSIP_Label_0fec2151-cbe0-4586-8a3f-997880a38a28_Name=Published
 AMD
 Product;MSIP_Label_0fec2151-cbe0-4586-8a3f-997880a38a28_SetDate=2025-05-09T03:14:07Z;MSIP_Label_0fec2151-cbe0-4586-8a3f-997880a38a28_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_0fec2151-cbe0-4586-8a3f-997880a38a28_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|CH2PR12MB9519:EE_
x-ms-office365-filtering-correlation-id: 3720e022-3ba4-4d8d-e2b5-08dd8ea795b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?YUhxOFdMSmM5YzJPV09oQ1dmTWdEUXV4TGtWakh3dUdqSGp5UW04cFVhaWFT?=
 =?utf-8?B?R0VubUZLdU11WHk0eWhydVg5a0xDMGFoNFdkMTdFMGtHUEJ3endId1J5VEM0?=
 =?utf-8?B?Z2g0VVZqSnhOU0lBaEJxc21GTHI3NGZMSENCT0RWNGhLaGxyNzJWa1ZpMEdx?=
 =?utf-8?B?NStvQk12N1BFREJXSXdZZ3ZSQlgvZnQrUFV6UGtRTDU4SkFUb3VnOFQ2OXk1?=
 =?utf-8?B?NkhPN2RjYmhTSXN1L3NCakh1WTNKcmVNVW5qdG15V3hwY1BZSDNzVUs3bnIx?=
 =?utf-8?B?dFRpdFd4blp5eUJhRjAreW5oR3BFOXdIUUhUUnZ6a0lXMWZEVHpKYlIwWEdM?=
 =?utf-8?B?b0pReFltN1hhbTJ2ZUZ2VGt3akROYTdXZm9nQVhBNHBXZzhYLzdCS3FleVgy?=
 =?utf-8?B?a2JScVRpNEl5UnVFdFVaQTFqb1o2QkFmVTVRdXg0THIydmsxRUdobFpTTzAx?=
 =?utf-8?B?MnB3UFZHZGRKTjdXUUFTaWZ1WFpNWTJCSnhXbFQvRHc3aCtYcXR6TGJCVS95?=
 =?utf-8?B?TmczeThIKzkxVmtuMkJWd0tyVUVYQktNZE9HN2E3dkw0WkExM09KMTJLNjU0?=
 =?utf-8?B?ZTZ6ZFp1MGJ1dmJ3QlFrWHlSNUlWTmdPODBYY3FPeFNLUkt6T2FMSmIrb0Jp?=
 =?utf-8?B?cmVFOGhwTm5seVBiM0t6M0dNN1kvalgwN1RtRytjRjl0RVRMMVk5SWhGbGRl?=
 =?utf-8?B?VExBRDFLVzBrMEc1WDVRN0s1RFFFbGV3UjNTbjdwVElmcHdSNytuZkkxS2lh?=
 =?utf-8?B?cmFiVHhxK2JrcENzYmRZRGRZc3lUS3gvZnVjM1VLN1N1NHN2dWFxQVpSYkFW?=
 =?utf-8?B?THZueGZjb2lHWlhRR1hBTWZOZHZoSkRKZkkxNE9WVGpWNmV2OFlpcEZsK3U5?=
 =?utf-8?B?WldTd3FTb3lkU2NDLzk1QmcyNHhrYmNJNnFqckxTNlpMSlZSRnAvdFl1Y0hB?=
 =?utf-8?B?WEhDUkIxR0oyWCtWQzFkdXJXZFpZeXl1OXhLUnZ3VytuTmNMeTd0WTY3Tm9i?=
 =?utf-8?B?K3k5OG5na3Q2dEdwMkdEUTRHTmpxWWpnUWF1amFpMk1hYno5MlhzUjMvLy8y?=
 =?utf-8?B?R1ZBUUhhcThhWS9YRFJIc1NOVi9Zdm9PcHJhSkZ2QlBoUStvdzRNN3ZyZzRt?=
 =?utf-8?B?Ymw0UjJmUDI3eWM2TGJZdUNLd2VKT2dqNjFYZXlFelRUZjB5eHBmV01XazdZ?=
 =?utf-8?B?ZTZqWUN4bHJYUWorWTl5d0lEMkRrTTZRUUVKYTFXYzJtcUJrb2doVHdmWVJt?=
 =?utf-8?B?MUx1czBXM0N4ek9tVmJLckQzdFI2L0lHbHJicHhkVWY1QkNtSytCclhWekdx?=
 =?utf-8?B?KzhBN2tFcXpUbVNNTTZpZFlIdHh3eDFaU091dmlWbnNCQktOUlRJdjJCeWpC?=
 =?utf-8?B?WTNQR01vcVkxZnNuNzBmcnFuMXRsaXZ3UEoramoxVFB3RU5RTktuZDRVR0Ur?=
 =?utf-8?B?eEhJT0RteU1BNFRhMGxTWGo2MlNOVXNoZSs5a3U0R1dKa1gyRk5yc2FyVmp2?=
 =?utf-8?B?ZUh0clRXMENwcE1ZODlkeHFxQWR6cHZUbGZuMnpBNFl4bVRwQmJuL2xBUkht?=
 =?utf-8?B?UmJYZ05ibFd1VUo4b2RrS0NjN0RtNHFWaWk5N2ZWNXhkcDhhZHBxL1hnNm9S?=
 =?utf-8?B?Q2dudDIxMStieXp3SDU5USt3WUdBMWw3cVlzVkpORDFHTlVkMUNsTFc5dnBZ?=
 =?utf-8?B?S05rRTR1WnU3OXBMNThKVGxMVFJ6a1hqMUJvUHdjOXNWZ1kvd1kyVDhqVGFB?=
 =?utf-8?B?Zkt1U0RHZE1OQ0E2Y3pRQ1NDaFZFcDhWcUV6YkhkVitXNkdrYVVrazEvNGZm?=
 =?utf-8?B?M2UwWStwUGZDVTJ3NTV3MTArZDhYUDJaam1mekZWMVRDemI4ZSszRFVRUnRO?=
 =?utf-8?B?RnRZYkQrcGdKMDNiQmpHbTk1S0dLb0xmU3RXVnpaNjRQNFRNUEN3RkFSS2xQ?=
 =?utf-8?B?ZzZTZEthUHNmSENjMU05cFJPbDlWdFhIaHhlVllZcGxPa3NMOWRLTWl4ekFq?=
 =?utf-8?Q?atA8Lv4wITs75jHAUIyxrEzCXosgAE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SUpTbFJxZ3dQSSt3bjZrV1hFWlBHL2RMUXZ3a2c4blhML2hzd1lyc3ZiTzli?=
 =?utf-8?B?YnZXMHY3NFdLeDM2aTA2REk0eDZXZTZPZkV4TGg1Y05jYWx3NnpiL3JGZnds?=
 =?utf-8?B?d3NRQXp6WGFnZ3AxbjBmOXRtanZNSHNaMlI5aUJFWG5YeThOV3ZNY0F1NEx4?=
 =?utf-8?B?UHZqUHZDN2NpeVdJbXNkWXhYdko3Y0lqd3REenhOblEyMFUrTkJZQUdEbHU4?=
 =?utf-8?B?dk1PRFAycmRQTUg2TnlIdVBMbXBSOUN3R1o1OE9LUE1hMC8rb21Td1VJTUtK?=
 =?utf-8?B?clhEd2Y0RFpZTDNEY2xvTkpONlpoa2xRU3hQalRzVzFnbGV2aGUwd3Nwcnpm?=
 =?utf-8?B?Y2MyajhPL2RjSHk1RkNOMXBZNWpaQURMaXBVWTNuUWR1LzFqcnQ3ek40MGVS?=
 =?utf-8?B?eTJacGZ4c2ZsQWgyUGNHR0ZHWWsxMW1jbjd1QVhUa0g0Rks4Z0NxSWxiL1Nj?=
 =?utf-8?B?UEQ3MUJNZmRXLzhhbWgyWDhHRnBJYlZvelZOSWhYQzJCS2RMUkZOUGYzaTJC?=
 =?utf-8?B?Qko2dmxramVoQ3kzalIrcXQrN25vbG55TnpTclAzTkx1OTJYZGRQRHpsMTEr?=
 =?utf-8?B?MjUvSWlCOHJmY2JvbHBJL1p3a0lpc0FKbk51czZFNjN0aWl6Nk4vVEt4eENT?=
 =?utf-8?B?aWY4dGVmMi9yVVpjc3ZzR215dTh3QkxVR1gwNGxkRWk0VjRVenV0NkFFcHI2?=
 =?utf-8?B?ZUgvNmhtWkFYWitBVnhnb2k5WVJRd3FLelU2Q29SOXBsYldWT3VqZ2VnOUdG?=
 =?utf-8?B?UWR3RkQrd1YzME1RZ1AvbFA4dWJiaElRUXJzTTlsZ3MyQ2twTGdaWlVNUUd2?=
 =?utf-8?B?RVRlMDE2WHkxWGpGQWdMd1FMVTI4cGNFZHFKcU10WmNHTXUvRlNVUS9RNEN5?=
 =?utf-8?B?NDg2elVzd2VJWWVLbEkwSFNDU2N3WWdHTnR0TW9nenM5TGw5clBuMXgxdFRG?=
 =?utf-8?B?cTF6d01lblViSGpoWEoyNW5SNE50aTBXVVBUTHF1ZzhsbDk5SHFhZ1dnRVZz?=
 =?utf-8?B?allYVHI3RFAyNm0xQlRIR1NFdHRnNVdxdEYvRGQzYjNvNC9VTzBreUppbkE1?=
 =?utf-8?B?dHRKbVlodDI3THlUdjdUTnZKZ3hyV2sxUmY3eWhtaEtFQ3Z4MjNqNW9JYzlB?=
 =?utf-8?B?NE5ReGtPUWoyV2ZwYnVWcnN0SVZSeXlwQVdNTHN5Y1JZV2JqZzBORHJIbnJh?=
 =?utf-8?B?YnVRcnhjM1k0NmQ5cTdyNFYyNmNlS29GNkx0TWl5TEkyWHozOElCRGVxM2M0?=
 =?utf-8?B?OG1vSXF6WWxGS3QyajlpRzdOVC8wMTV4bTRJNUUrRFlXbFVZcDZGMHY3UGl1?=
 =?utf-8?B?a3UvK29temYyMGNVbzIxemZXQTZHL01ZakVtdGZtL3F0RktQMXJrdEl4a0F5?=
 =?utf-8?B?T0NkKzZnelZMNUdRMjhjVEJZMFRBaFlBZlZRdFR6STl5Q0tWSzR4R2s0cTRD?=
 =?utf-8?B?ZFVITDFZckxHNCtiUnhYK1V1Zk0vdDFieXZDUG5ZSm5xbExSWHlJbzFVbzN1?=
 =?utf-8?B?QTZHSmRkVUVwRG9sdFVwMklzZStHaDlLV09VRTQvRnJ0bnZOUGljZmpqRGQ1?=
 =?utf-8?B?YW1NRjFCT0FUMG1BL2d5WFdPSExib2hjMFYwQkxHTi82WVNqNEJHN0h4KzAr?=
 =?utf-8?B?N2tKNHRmeXlKakdUeHNFYWJ6YXk5Nm5nM3luTGZHUUdyNWhPYlR0N0wzTHJ4?=
 =?utf-8?B?R253a1o5TTNPbFZuaWNERGdyZTQyWWtKWTVHSElweWxXTkovNU92ZWFycWlL?=
 =?utf-8?B?VWpnZVBDa1FRNkY2azBGbWc4V1liQVoyMHRPbmhoK1pXektYUDdFN0JvYWNK?=
 =?utf-8?B?RDhsaUNSbkR5dkNMWFJpOFpnSU1RTUQxVExsMCt3NE4yUzJvNmliRFpHV0dD?=
 =?utf-8?B?L3UzWXVROWxCblNZU0pUUHh4VVJYSU1KRytzMG1kaVozL0JxOVpwczNUV09O?=
 =?utf-8?B?NlJRMlZ1bTNyYVgxVWlqTVI5Uk5VVFJ6RGNTazVtUHdvTU4wNERUODlpU2o0?=
 =?utf-8?B?MVZkV3A2dHFXRWkrWjBlRjJyYzZTM3VRb0dleTRjUXlvWFN6VHQ4SUM2cDNm?=
 =?utf-8?B?SFZLdWlDWlQwMlBpSnJPbEhKMTBlYlQweHZnODU1K2MvYnRYSmdNcmdybkJT?=
 =?utf-8?Q?rJvw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3720e022-3ba4-4d8d-e2b5-08dd8ea795b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2025 03:14:17.8396
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ImHnWjeVXR/NE3l3BhH2jlXorV4JU0VEezG+/F6ds+npWi7DB+etyikzsEWbg+aOsmVaqvgafG1Oxlikgurf+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9519

W1B1YmxpY10NCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEFwcmls
IDMwLCAyMDI1IDEyOjM5IEFNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5j
b20+DQo+IENjOiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEFuZHJldyBDb29wZXIN
Cj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBBbnRob255IFBFUkFSRCA8YW50aG9ueS5w
ZXJhcmRAdmF0ZXMudGVjaD47DQo+IE9yemVsLCBNaWNoYWwgPE1pY2hhbC5PcnplbEBhbWQuY29t
PjsgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IFJvZ2VyDQo+IFBhdSBNb25uw6kgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJu
ZWwub3JnPjsNCj4geGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjQgMTEvMTVdIHhlbi94ODY6IGltcGxlbWVudCBFUFAgc3VwcG9ydCBmb3IgdGhl
IGFtZC1jcHBjDQo+IGRyaXZlciBpbiBhY3RpdmUgbW9kZQ0KPg0KPiBPbiAxNC4wNC4yMDI1IDA5
OjQwLCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPiBAQCAtNDM0LDEyICs0NjQsODIgQEAgc3RhdGlj
IGludCBjZl9jaGVjaw0KPiA+IGFtZF9jcHBjX2NwdWZyZXFfY3B1X2luaXQoc3RydWN0IGNwdWZy
ZXFfcG9saWN5ICpwb2xpY3kpDQo+ID4NCj4gPiAgICAgIGFtZF9jcHBjX2Jvb3N0X2luaXQocG9s
aWN5LCBkYXRhKTsNCj4gPg0KPiA+ICsgICAgcmV0dXJuIDA7DQo+ID4gK30NCj4gPiArDQo+ID4g
K3N0YXRpYyBpbnQgY2ZfY2hlY2sgYW1kX2NwcGNfY3B1ZnJlcV9jcHVfaW5pdChzdHJ1Y3QgY3B1
ZnJlcV9wb2xpY3kNCj4gPiArKnBvbGljeSkgew0KPiA+ICsgICAgaW50IHJldDsNCj4gPiArDQo+
ID4gKyAgICByZXQgPSBhbWRfY3BwY19jcHVmcmVxX2luaXRfcGVyZihwb2xpY3kpOw0KPiA+ICsg
ICAgaWYgKCByZXQgKQ0KPiA+ICsgICAgICAgIHJldHVybiByZXQ7DQo+ID4gKw0KPiA+ICAgICAg
YW1kX2NwcGNfdmVyYm9zZShwb2xpY3ktPmNwdSwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
IkNQVSBpbml0aWFsaXplZCB3aXRoIGFtZC1jcHBjIHBhc3NpdmUgbW9kZVxuIik7DQo+ID4NCj4g
PiAgICAgIHJldHVybiAwOw0KPiA+ICB9DQo+ID4NCj4gPiArc3RhdGljIGludCBjZl9jaGVjayBh
bWRfY3BwY19lcHBfY3B1X2luaXQoc3RydWN0IGNwdWZyZXFfcG9saWN5DQo+ID4gKypwb2xpY3kp
IHsNCj4gPiArICAgIGludCByZXQ7DQo+ID4gKw0KPiA+ICsgICAgcmV0ID0gYW1kX2NwcGNfY3B1
ZnJlcV9pbml0X3BlcmYocG9saWN5KTsNCj4gPiArICAgIGlmICggcmV0ICkNCj4gPiArICAgICAg
ICByZXR1cm4gcmV0Ow0KPiA+ICsNCj4gPiArICAgIHBvbGljeS0+cG9saWN5ID0gY3B1ZnJlcV9w
b2xpY3lfZnJvbV9nb3Zlcm5vcihwb2xpY3ktPmdvdmVybm9yKTsNCj4NCj4gVGhpcyBpcyB0aGUg
aW5pdCBwYXJ0LCB3aGljaCBpcyBmaW5lLiBXaGF0IGlmIHRoZSBnb3Zlcm5vciBpcyBiZWluZyBj
aGFuZ2VkLCB0aG91Z2g/DQo+IFRoZSBzdHJ1Y3QgZmllbGQgaXMgbmV3LCBhbmQgdGhlcmUncyBu
byBvdGhlciBwbGFjZSBJIGNhbiBzcG90IHdoZXJlIGl0IHdvdWxkIGJlDQo+IGFkanVzdGVkLg0K
Pg0KDQpZZXMsIEkndmUgbWlzc2VkIHRoZSBwYXJ0IHRoYXQgdXNlciBjaGFuZ2luZyBnb3Zlcm5v
ciB0aHJvdWdoICJ4ZW5wbSBzZXQtc2NhbGluZy1nb3Zlcm5vciINCkknbGwgYWRkIGEgbmV3IGNv
bW1pdCB0byBmaXgNCg0KPg0KPiBKYW4NCg==

