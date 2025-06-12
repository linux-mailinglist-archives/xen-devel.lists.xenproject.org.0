Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D375AD66AB
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 06:10:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012317.1390778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPZFb-000099-4C; Thu, 12 Jun 2025 04:09:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012317.1390778; Thu, 12 Jun 2025 04:09:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPZFb-00008G-0I; Thu, 12 Jun 2025 04:09:15 +0000
Received: by outflank-mailman (input) for mailman id 1012317;
 Thu, 12 Jun 2025 04:09:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9p7z=Y3=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uPZFZ-000086-CV
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 04:09:13 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20628.outbound.protection.outlook.com
 [2a01:111:f403:2417::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd65c18e-4742-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 06:09:10 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 IA0PR12MB8974.namprd12.prod.outlook.com (2603:10b6:208:488::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 04:09:04 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%5]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 04:09:04 +0000
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
X-Inumbo-ID: fd65c18e-4742-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lsya7VyTF7qJKzQsjyuLtz1yNEZRNPdPtKsZX5gWebgLuMvjfU6DkEH0RlSgyvMTbwsZV4zUZy5KmGr3q79/A2dil1S7Ew6kAWfsjm+9fzaKpk9mw2o46UM1mYIkeipk600gYGqlkvHIqtUXOLDyZuuD4ZawKSfJFX+gtAD1ih2jPCss34IEUNT/wLueETUhT4VnhZY8oiazFMFFIqAPtzr30P/VfkNwDg62EGAhZHOZujo5jdQ/1bXqb5gcFFmYCiFdVdSJ6BU6xpoojxVFfVXHomkIDmAbtkHRgcgv4lAIE1PapPCQaIuaAIWU32rtNgMXh5h3U0oMhiuNUI9kCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1xD/LBP05JNzOUDMtF/vZBuY7B/raNdEAGzEK1q6nbI=;
 b=nM6bYL7/6jTXQexrFbLDb8IWamrAgkCGt34GiFetLok8b4VM6oH0pFryRfBAQ3+Rh2obaxTQKNPW63tnt9PDBvYsDeeGonqhCGhdmsd3JzOIwlz9Qlo6vvElvQHnuHN+NrDK3ZNGsnZQu0ZMVSbUYadXVmJp60VuM8sFooTMNKviUdox5dcHCIbc5fcsiF+jIrF09tN1LQNxnnZRQVJ9RCWDtgEPkcY+qyWBs+VnTgxCk+HgP4/VlhCa7MjRSvT70h+wmjP0EeN26eKibf9FKZqXOUcwS5kIzkgjonXZkn6qkh3gJQJdF5ZyV8u7ISj3vwKomqXztXtwrDyMmOH7AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xD/LBP05JNzOUDMtF/vZBuY7B/raNdEAGzEK1q6nbI=;
 b=MKcgIRMDnY29qiXkRmxNjgeCFFrQuZ3cmzSjNtZPPtEkYqHFB1XB3e0W7/gTmVC4oWJjoMmD3CAVey7pG3Jx0QKqy8W941oVhzxP+A4Xh//2hYPQG+HlnQ2qfssnFW4jMWukC/cnir3/UpyCjKaoYxpgPYIsRAvmFEEwpVuS/FY=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Orzel,
 Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 03/20] xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"
Thread-Topic: [PATCH v4 03/20] xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"
Thread-Index: AQHbz7Fj+78Jf3bO30Wr1Bk6dRI84bP8b/QAgAJ/5nA=
Date: Thu, 12 Jun 2025 04:09:04 +0000
Message-ID:
 <DM4PR12MB8451B5CBFD6D9DCDDB7040DEE174A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250528091708.390767-1-Penny.Zheng@amd.com>
 <20250528091708.390767-4-Penny.Zheng@amd.com>
 <1a73c720-012a-4795-9f47-f9c23b643de1@suse.com>
In-Reply-To: <1a73c720-012a-4795-9f47-f9c23b643de1@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-06-12T04:08:57.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|IA0PR12MB8974:EE_
x-ms-office365-filtering-correlation-id: 1081a8a3-3bad-4c97-3149-08dda966ded4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bndXYVpSdTZOdmgwemJBT1Z4SzY3eFpPWDZTWmc0M2Z3a0c1cUVUeDlhMVdW?=
 =?utf-8?B?ajAvcWZaWTdqVEtOcndpN1NsRFJjUmlXeU1hZGcxV29RQWk1ZUd1bVFMSzNa?=
 =?utf-8?B?Q0lUZkF6ajM5QVJvU01IQnozcFErNG5Kck1Na0VyWnI2S3FQUHNCUHpqZjhP?=
 =?utf-8?B?aHVqNWx0T1RCTy9KWDY4UWpCTmJhSHRnTER4WktMcWFidFNhaXc4UlNYM3E4?=
 =?utf-8?B?RVBSWjJraWZrbFVqaWtOZHFSMFQ4SFRvNDdGSFV2dHFWWG5Dd2RmOVlHUjJY?=
 =?utf-8?B?b1dxcHZHei9EZURST3BRTmJ1U09sZlJlZURyTTF4YkpKYnBQbTJsZUI3ZUFB?=
 =?utf-8?B?MlQrZk5raVRwZzF6SFRFQkd1NDhacjVzVEF0bEljZWdDWGRsb0M4TmthZDIw?=
 =?utf-8?B?MmhDRCtIVlV2NFNQV1JsQ1dyNUI3QXI4WWwzQk5wMUVyREpLdlpqRk84cjhT?=
 =?utf-8?B?ODZIVEFLSTlPVmlPWkF1cU51VERPOXVPZ1kyYW5nU0VLSUZwV3h4NHZqbmlC?=
 =?utf-8?B?c1Rrb1JvRFFMQ2xIQUZXSHFUcU1VS3lpd2tmS05YYkVPS2J4MWxJMk5IZ1Rn?=
 =?utf-8?B?cDErSWg4Z0JDRGc5WDZVajc3eVUwQW9SM3pWSkJwTDlTN2FZbzNRazN5MlRM?=
 =?utf-8?B?elNGWHFocHJrMHV1dFpGSHNua0t6Rk1MYjF1eUM2Wkg2YUozcjc4V3RxRVhi?=
 =?utf-8?B?WkNJVjhnblo1dlAxUWJ3dkhjcmVBNlR5KzVzWXRGR3Fmb2Z6Z1M4aEhiZVV3?=
 =?utf-8?B?V3VaSlVaK1EvSW9RaUdITUNucFRaang3ZEc5aUswR1dlTzIrWTY5dzZ6M0hz?=
 =?utf-8?B?b1dXb2piTnRiMVdtTTJuTGJubytHTGczQm5GSTZQWFJEYy9EWFpTWkNtQ0ph?=
 =?utf-8?B?azRNbXpITzY0K29uejBPWXRSSEdGUkM0Y3h5ajllV09mT3AyQmN4T0R3eTZ2?=
 =?utf-8?B?Uy9ZN2U4cERLRk9xVWNpSUZ2MkVwYXFJSXRXeUtmNjFaOWxFa29qbUpONE9B?=
 =?utf-8?B?cjAvcEhweERaMENwRnZHOFRIMFhsSjNWZXBoNmJLOURHRFhibGhzSXhqZUpW?=
 =?utf-8?B?U2UyazNBeTRNckdPSWdENklFZXFrbmlJa2s3QUQzZUxTRlMzZnRyYWdpNko1?=
 =?utf-8?B?TnFEYkNrTzIveXIrb1liTXhPY09hSUZkaUJhSWlBSXYzNnZmOWR6MlNpQ2RI?=
 =?utf-8?B?UUNNaGhpVU1Xcm9WZGtSQ3FsT3pWczdibkdUWGMya3ZZZEZQc1k5TmtIZWQ2?=
 =?utf-8?B?ckNIdCt5Zjg0a0pna0VwME9lUFo0bGNBMkZJREJjaFpSSGorTUZ6MGpiYUxW?=
 =?utf-8?B?Z2hndFU0NGpXMlhsMzBud3U4L21YTzlvMzBNbllubDFtK1A3eit6UXRoeFBP?=
 =?utf-8?B?Q2V4by8zdUdaVzR3TmxNK1RMYytPM004QVF5TDRGY1A1OEdrcElZUmxPZmQw?=
 =?utf-8?B?VkR6dUh3V0RqU05HcW9Da1Fja0ZaT1BqMUVrb0RwcEJrb082K283NU5KR1Er?=
 =?utf-8?B?emlNQ2s0TDNvSkdQSnNKOFkwM2Y3ampzUno4dGllN0pZUERhZUFXK0RLWHA4?=
 =?utf-8?B?SXNjcWQ3QjJmbDFDR0V0biszQ1dCTUx6RUlXUFJ2SXJKa3ZLaGd0Tms2ZFBy?=
 =?utf-8?B?bUtpVStmSTJBRC9jVUxDUEVyWUcyVk40YkFaK0VkMlhQSnkrVmduaDNvajM0?=
 =?utf-8?B?VTVGdTdPak4rcG1Sc2EwcEhtcUxmcGxJOTRoUWVqaWIxeGVWc09hYlY0cGc3?=
 =?utf-8?B?NG8zMTVQYkJUVkxLTHhrdmpoTWR2MW5sN05NQTJUdVdyN0ozZGxEYVBiTGgy?=
 =?utf-8?B?NGdMVTR6YnZUdmUrbHc3MTZhRy9DYkdvSENxaEtPek1HalFXZG05V2s3ejdR?=
 =?utf-8?B?QXhYUndXNzdSbXI5bEhSWmJTNlFFRUpJMERFUURKcCtDbW5WbG1WUjJrREFs?=
 =?utf-8?B?Vkl5eWxwazhtU20rTVV5Z2loaDE0WHIyWVBhS200cHlQaUJaL0tmMGk5Vm53?=
 =?utf-8?Q?2m65iK02SHlN2V0WNlpNRzCv95mN6Y=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RTkwWFRyRm5DMW9PMUFWaGdTbFJzWklHdkh4cm9Fd3FhQnZHMC9Bb2J5VHFI?=
 =?utf-8?B?RDNFcG50bXlXalpveDJlNTU0ZllXR0lsY3N0dGUyQThTdDdUQXFpWmgwVk1M?=
 =?utf-8?B?K2NqcXd2OG10Sm9lblUzVGd5TGE4Vi9Uamlac0xLT1poMDhOZUM1SE9wVFkw?=
 =?utf-8?B?eXBydkd6VFVVRENwNW1EcWl4amdPVnJ2OGRyYVBzWHFLWnFsNnlBS1dXZzJp?=
 =?utf-8?B?UnJiemtzWUtNMU5GNkJFUFk3d2xuU3g2azFMdlF4ZUxuUVorQjBxbFlmTGw0?=
 =?utf-8?B?T0wzTGQzQ2tNSVVSbU5TNFF5U2loOWgxTEpaaXkrL2RrMk00YUliWWVPbXdH?=
 =?utf-8?B?SGtadXZ6K2ZPYkJET2lxM1NaZVJlVkJpZVJtYVUySXNoWHB4dFA4bitjNmFl?=
 =?utf-8?B?L3VyUjE0a0E3WW1ZY0liQmpPU3JEbkN1aG9XcGJGU0l4TG1pOUNQNUh1aEtr?=
 =?utf-8?B?OFA4SGRZbytBa0NiNk5WQ3BnV2tRci8rODlhUnluNUNKMW0rT1ZaYUV6eU5F?=
 =?utf-8?B?YnVsYlp5akFhVlMrZktpbUdScUdiV1R3SFI4aHNwNUhlMXFoY1YvQlZCbHBv?=
 =?utf-8?B?WlFuWUE4bjgwOElsM2FjMXUyOVFFSWpOVzRvTzQxY1JSanVOeDRyR1BvaDNz?=
 =?utf-8?B?aUlSQmtmUHF6MTFOK1ZGU3B6RWp4bjRvSWN5TER1VWwycTlYSW12MHhtRzhN?=
 =?utf-8?B?NnIwblZzZlUydE5hNHYxMFlVVGw1VWVvVERBSFFreExhTFBIMDZUNnpLMkhV?=
 =?utf-8?B?U2VQQVZxTkozNEU3T1F6TWxFT2grNnpLWm5Qa0tCNENneVVjY0pzUXBiN0NT?=
 =?utf-8?B?eTdWMmZSMzZGRVBRYnp3dlluMzNkVlBwMXBQdzJjcjVaYm9lallLTUhkRThE?=
 =?utf-8?B?OGw3VnQ3ZGlPNGNOem9PVGE5a2dvOEdSQmJweVRhMHFQVjBmM3d1Y05FTVdX?=
 =?utf-8?B?eTB3ZnprN0xYclJBV0greVVhVitUWDRjSWdaYng1c0JucGZyM3VEeUI3N24z?=
 =?utf-8?B?bGFTM3FiTS9kYjE2UUdQT1liMTdLSWlWdGtIZUNWdVIvMXVPUkdkS0RCTHlM?=
 =?utf-8?B?QkNlQkw0MjJLK09ieElTclZ6eENMaFkxNjVpTHJEYWNxVW9FTitXaUJDeDQ3?=
 =?utf-8?B?N2VUd3BWWG5GUk8yeThna3p6YWM3ZW5oQnpXTTcwVkVMVUZJL2srbEYvZzhJ?=
 =?utf-8?B?VUVJb0w3aWNvRFVva2dRSGZDYXo1Z3l3ZmtsVU1pUWhKYXFwSkJKY29yRTRR?=
 =?utf-8?B?WlcrbDRVQTh6LzZiUUtzVGZQQVhLZmxWTFl3ZUxaNVNPb0FDNS8zQVhqdmZr?=
 =?utf-8?B?TmFWUTQ2NlBUU0tQMmR5NDRETDNKbnNQYnZyZENUOVUxM2pXSnY3QVNxT2ky?=
 =?utf-8?B?cko4SzRjamVLeFFWTXU4WE85WmdDRzVSZFJTeERob1BHUUErd0F1ZGZNNVZj?=
 =?utf-8?B?NW9PZWllVmhsZ0RKWWRPc1VUaXp2ZVc4U1lWcEppbWtRdlRYZWdvUDEwemQ1?=
 =?utf-8?B?eWYzbkhreTZHZjhNaDMvb3dUTnVmZWgvVzVKL0wvL0tORUUxN0VMMDJZWGNk?=
 =?utf-8?B?WnNGZkhPMnYrRXJtenNCbVJWamZJZ1JFdFRvQ0pJWHpCWXNsRy9remZZVUFM?=
 =?utf-8?B?NDRRRmNSWTZGWksvYzhHbWxRaVIrSXhpc2NqR3orUllCQ1VDUmYwQnE5SUxv?=
 =?utf-8?B?SzExdHdydTV4UUhmbWtPOGdQdU4wZlNrUmFucEd4QVhzVzQwRWgxL0lzVURr?=
 =?utf-8?B?aDZLSldzcWJvNVdpcVpvdFFRaEVIYjB1MHZqQnNvUkdmOHFkVHdnNGphU1Av?=
 =?utf-8?B?MHFWaTJYY2JPdWtPRFpEcWRmSDJzQ0JQUWpKTkxXaTJJVkwvRm9UaURCNVNK?=
 =?utf-8?B?aW02dmRINkJVL0s0d25yRXo4ampDOE5MbTJVRi8yQ1B5RG10UFM1TGl6NVR6?=
 =?utf-8?B?MThBUE52cE1JaGFKOG5tTDJ3VlVLVUxrY2NXSWliTitpZjhjaERESUswWE9j?=
 =?utf-8?B?YUJLNXNlM3BseXplSjRKZGRxRVJoblBsTHpMcUtqSzJrM0JLcit1Wm1Gb1I2?=
 =?utf-8?B?cEhjSzJkMWltdFdUcGI2YjVjWDZzUVlvRnVhUnovTWo4Q3o0L3pJeHVXMkx1?=
 =?utf-8?Q?Zri8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1081a8a3-3bad-4c97-3149-08dda966ded4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 04:09:04.6641
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W3GBII1SllnTWEmECqSXAZEaq2e0sgEXS0w9ZladykZMdMduEx5LFcbQixwvb+JdM+3uSnYNS1b8OQRCQPhaUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8974

W1B1YmxpY10NCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBKdW5lIDEw
LCAyMDI1IDk6MDEgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4N
Cj4gQ2M6IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgQW5kcmV3IENvb3Blcg0KPiA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPjsNCj4gQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQHZhdGVzLnRlY2g+
OyBPcnplbCwgTWljaGFsDQo+IDxNaWNoYWwuT3J6ZWxAYW1kLmNvbT47IEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPHNzdGFiZWxsaW5pQGtlcm5l
bC5vcmc+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2NCAwMy8yMF0geGVuL3g4NjogcmVtb3ZlICJkZXBlbmRzDQo+IG9uICFQVl9TSElNX0VY
Q0xVU0lWRSINCj4NCj4gT24gMjguMDUuMjAyNSAxMToxNiwgUGVubnkgWmhlbmcgd3JvdGU6DQo+
ID4gUmVtb3ZlIGFsbCAiZGVwZW5kcyBvbiAhUFZfU0hJTV9FWENMVVNJVkUiIChhbHNvIHRoZSBm
dW5jdGlvbmFsbHkNCj4gPiBlcXVpdmFsZW50ICJpZiAhLi4uIikgaW4gS2NvbmZpZyBmaWxlLCBz
aW5jZSBuZWdhdGl2ZSBkZXBlbmRhbmN5IHdpbGwNCj4gPiBiYWRseSBhZmZlY3QgYWxseWVzY29u
ZmlnLiBUbyBtYWtlIHN1cmUgdW5jaGFuZ2luZyBwcm9kdWNlZCBjb25maWcNCj4gPiBmaWxlIGJh
c2VkIG9uICJwdnNoaW1fZGVmY29uZmlnIiwgd2Ugc2hhbGwgZXhwbGljaXRseSBzdGF0ZSBhY2Nv
cmRpbmcNCj4gPiBLY29uZmlnIGlzIG5vdCBzZXQNCj4gPg0KPiA+IEFkZCAiZGVmYXVsdCB5IiBm
b3IgU0hBRE9XX1BBR0lORyBhbmQgVEJPT1QsIG90aGVyd2lzZSB3ZSB3aWxsIGhhdmUNCj4gPiB1
bnNldCB2YWx1ZXMgd2hlbiBydW5uaW5nIG1ha2UgZGVmY29uZmlnIGJhc2VkIG9uICJ4ODZfNjRf
ZGVmY29uZmlnIi4NCj4NCj4gSSBmZWFyIEkgZG9uJ3QgdW5kZXJzdGFuZCB0aGlzLCBwZXJoYXBz
IHJlbGF0ZWQgdG8gbWUgYWxzbyBub3Qgc2VlaW5nIGhvdyAuLi4NCj4NCg0KSWYgd2UganVzdCBy
ZW1vdmVkICJkZWZhdWx0ICFQVl9TSElNX0VYQ0xVU0lWRSIsIC5jb25maWcgZmlsZSBnZW5lcmF0
ZWQgYnkgIm1ha2UgZGVmY29uZmlnIg0Kd2lsbCBjaGFuZ2UsIGhhdmluZyB1bnNldHRpbmcgdmFs
dWVzIGZvciBTSEFET1dfUEFHSU5HICgjIENPTkZJR19TSEFET1dfUEFHSU5HIGlzIG5vdCBzZXQp
DQpJZiBjaGFuZ2luZyBpdCB0byAiZGVmYXVsdCB5IiBpcyB0b28gY2FzdWFsLCBtYXliZSB3ZSBz
aGFsbCBhZGQgIkNPTkZJR18gU0hBRE9XX1BBR0lORz15IiBpbiB4ODZfNjRfZGVmY29uZmlnLA0K
dG8gYXQgbGVhc3QgcmV0YWluIGNvbnNpc3RlbnQgLmNvbmZpZyBmaWxlLg0KTXkgZmF1bHQsIE9u
bHkgY29uc2lkZXJpbmcgIlNIQURPV19QQUdJTkciIGlzIGVub3VnaCwgYXMgVEJPT1QgZGVwZW5k
cyBvbiBVTlNVUFBPUlRFRCBmaXJzdGx5DQoNCj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvS2NvbmZp
Zw0KPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9LY29uZmlnDQo+ID4gQEAgLTE0Myw3ICsxNDMsNyBA
QCBjb25maWcgWEVOX0lCVA0KPiA+DQo+ID4gIGNvbmZpZyBTSEFET1dfUEFHSU5HDQo+ID4gICAg
IGJvb2wgIlNoYWRvdyBQYWdpbmciDQo+ID4gLSAgIGRlZmF1bHQgIVBWX1NISU1fRVhDTFVTSVZF
DQo+ID4gKyAgIGRlZmF1bHQgeQ0KPiA+ICAgICBkZXBlbmRzIG9uIFBWIHx8IEhWTQ0KPiA+ICAg
ICBoZWxwDQo+ID4NCj4gPiBAQCAtMTc1LDcgKzE3NSw3IEBAIGNvbmZpZyBCSUdNRU0NCj4gPiAg
Y29uZmlnIFRCT09UDQo+ID4gICAgIGJvb2wgIlhlbiB0Ym9vdCBzdXBwb3J0IChVTlNVUFBPUlRF
RCkiDQo+ID4gICAgIGRlcGVuZHMgb24gSU5URUwgJiYgVU5TVVBQT1JURUQNCj4gPiAtICAgZGVm
YXVsdCAhUFZfU0hJTV9FWENMVVNJVkUNCj4gPiArICAgZGVmYXVsdCB5DQo+ID4gICAgIHNlbGVj
dCBDUllQVE8NCj4gPiAgICAgaGVscA0KPiA+ICAgICAgIEFsbG93cyBzdXBwb3J0IGZvciBUcnVz
dGVkIEJvb3QgdXNpbmcgdGhlIEludGVsKFIpIFRydXN0ZWQNCj4gPiBFeGVjdXRpb24NCj4NCj4g
Li4uIHRoZXNlIHR3byBmaXQgd2l0aCB0aXRsZSBhbmQgZGVzY3JpcHRpb24uIFRoZSBqdXN0aWZp
Y2F0aW9uIGZvciByZW1vdmluZw0KPiB0aGUgIVBWX1NISU1fRVhDTFVTSVZFIGhlcmUgaXMgbm90
ICJicmVha3MgYWxseWVzY29uZmlnIi4NCj4NCg0KSG1tbSwgaXQgaXMgdGhlIGNvbnNlcXVlbmNl
IG9mICJyZW1vdmluZyB0aGUgIVBWX1NISU1fRVhDTFVTSVZFIg0KTWF5YmUgSSBzaGFsbCBhZGQg
bW9yZSBleHBsYW5hdGlvbiBpbiBjb21taXQgbWVzc2FnZT8NCg0KDQo+ID4gQEAgLTI4OCw3ICsy
ODgsNiBAQCBjb25maWcgUFZfU0hJTV9FWENMVVNJVkUNCj4gPg0KPiA+ICAgICAgIElmIHVuc3Vy
ZSwgc2F5IE4uDQo+ID4NCj4gPiAtaWYgIVBWX1NISU1fRVhDTFVTSVZFDQo+ID4NCj4gPiAgY29u
ZmlnIEhZUEVSVl9HVUVTVA0KPiA+ICAgICBib29sICJIeXBlci1WIEd1ZXN0Ig0KPiA+IEBAIC0y
OTgsNyArMjk3LDYgQEAgY29uZmlnIEhZUEVSVl9HVUVTVA0KPiA+DQo+ID4gICAgICAgSWYgdW5z
dXJlLCBzYXkgTi4NCj4gPg0KPiA+IC1lbmRpZg0KPiA+DQo+ID4gIGNvbmZpZyBSRVFVSVJFX05Y
DQo+ID4gICAgIGJvb2wgIlJlcXVpcmUgTlggKE5vIGVYZWN1dGUpIHN1cHBvcnQiDQo+DQo+IFBs
ZWFzZSBkb24ndCBsZWF2ZSBkb3VibGUgYmxhbmsgbGluZXMuDQo+DQo+ID4gLS0tIGEveGVuL2Fy
Y2gveDg2L2NvbmZpZ3MvcHZzaGltX2RlZmNvbmZpZw0KPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9j
b25maWdzL3B2c2hpbV9kZWZjb25maWcNCj4gPiBAQCAtMjYsMyArMjYsOCBAQCBDT05GSUdfRVhQ
RVJUPXkNCj4gPiAgIyBDT05GSUdfSU5URUxfSU9NTVUgaXMgbm90IHNldA0KPiA+ICAjIENPTkZJ
R19ERUJVRyBpcyBub3Qgc2V0DQo+ID4gICMgQ09ORklHX0dEQlNYIGlzIG5vdCBzZXQNCj4gPiAr
IyBDT05GSUdfU0hBRE9XX1BBR0lORyBpcyBub3Qgc2V0DQo+ID4gKyMgQ09ORklHX1RCT09UIGlz
IG5vdCBzZXQNCj4gPiArIyBIWVBFUlZfSFlQRVJWX0dVRVNUIGlzIG5vdCBzZXQNCj4NCj4gVGhp
cyBvbmUgZG9lc24ndCBsb29rIHJpZ2h0LCBzaW1wbHkgYnkgaXRzIG5hbWUuDQo+DQo+ID4gKyMg
Q09ORklHX0hWTSBpcyBub3Qgc2V0DQo+ID4gKyMgQ09ORklHX1ZHQSBpcyBub3Qgc2V0DQo+DQo+
IEp1c3QgdG8gbWVudGlvbiBpdCAtIEknbSB1bnN1cmUgd2hldGhlciBhZGRpbmcgc3VjaCBhdCB0
aGUgZW5kIGlzbid0IGdvaW5nIHRvIGNhdXNlDQo+IGlzc3Vlcy4gQnV0IG1heWJlIEknbSBwYXJh
bm9pZCAuLi4NCj4NCg0KSXQgY291bGQgYmUgdG9vIGNhc3VhbC4uDQpJIHdpbGwgb25seSBsZWF2
ZSBWR0EgaGVyZSwgYXMgd2UncmUgc3VyZSB0aGF0IHdpdGggcmVtb3ZpbmcgIiFQVl9TSElNX0VY
Q0xVU0lWRSIsDQpDT05GSUdfVkdBIGlzIHNldHRpbmcgYXMgeSBpbiBwdnNoaW1fZGVmY29uZmln
DQoNCj4gPiAtLS0gYS94ZW4vZHJpdmVycy92aWRlby9LY29uZmlnDQo+ID4gKysrIGIveGVuL2Ry
aXZlcnMvdmlkZW8vS2NvbmZpZw0KPiA+IEBAIC0zLDEwICszLDEwIEBAIGNvbmZpZyBWSURFTw0K
PiA+ICAgICBib29sDQo+ID4NCj4gPiAgY29uZmlnIFZHQQ0KPiA+IC0gICBib29sICJWR0Egc3Vw
cG9ydCIgaWYgIVBWX1NISU1fRVhDTFVTSVZFDQo+ID4gKyAgIGJvb2wgIlZHQSBzdXBwb3J0Ig0K
PiA+ICAgICBzZWxlY3QgVklERU8NCj4gPiAgICAgZGVwZW5kcyBvbiBYODYNCj4gPiAtICAgZGVm
YXVsdCB5IGlmICFQVl9TSElNX0VYQ0xVU0lWRQ0KPiA+ICsgICBkZWZhdWx0IHkNCj4gPiAgICAg
aGVscA0KPiA+ICAgICAgIEVuYWJsZSBWR0Egb3V0cHV0IGZvciB0aGUgWGVuIGh5cGVydmlzb3Iu
DQo+DQo+IExpa2UgYWJvdmUsIHRoaXMgY2hhbmdlIGFsc28gZG9lc24ndCByZWFsbHkgZml0IHdp
dGggdGl0bGUgYW5kIGRlc2NyaXB0aW9uLg0KDQpJIGhhdmUgYWRkZWQgIiAoYWxzbyB0aGUgZnVu
Y3Rpb25hbGx5IGVxdWl2YWxlbnQgImlmICEuLi4iKSAiIGluIGNvbW1pdCBtZXNzYWdlIHRvIGFs
c28NCmNvdmVyIGFib3ZlIGNoYW5nZQ0KDQo+DQo+IEphbg0K

