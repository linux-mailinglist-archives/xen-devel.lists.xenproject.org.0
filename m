Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACA2AADB34
	for <lists+xen-devel@lfdr.de>; Wed,  7 May 2025 11:19:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978390.1365191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCaw4-0000z5-Rh; Wed, 07 May 2025 09:19:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978390.1365191; Wed, 07 May 2025 09:19:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCaw4-0000wL-Ol; Wed, 07 May 2025 09:19:28 +0000
Received: by outflank-mailman (input) for mailman id 978390;
 Wed, 07 May 2025 09:19:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UeMd=XX=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uCaw3-0000wF-Jk
 for xen-devel@lists.xenproject.org; Wed, 07 May 2025 09:19:27 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062b.outbound.protection.outlook.com
 [2a01:111:f403:200a::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b758a57-2b24-11f0-9ffb-bf95429c2676;
 Wed, 07 May 2025 11:19:21 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 BY5PR12MB4243.namprd12.prod.outlook.com (2603:10b6:a03:20f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 09:19:13 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%5]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 09:19:13 +0000
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
X-Inumbo-ID: 5b758a57-2b24-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eZuCAr0ZYvR9InAzCG8m/B35zjGHIb5p//tDEY4pBo90CCwtgNIbevVQKwru+ZtTrAYvsL1s+7iWyhJdEOtG8ipQDQjH3dzHc4p28laUdv+aBpA0vEG45TbVN14s44XVopc1Z/Uz9xTAAeX45BlLzx9Iw3eh3P6CKQUrQJU4gY61VUT+F6JuO95NJ0tNxnPCDSvkHm4gFO1XZfFEqSjYA9AeY4Agvzn37F3Rj1lkLH2Ks3UAly8DSYAbu6W7PhHHTLVYPZsAE5yG2RhtjFdXpm63N6K6tWsdMQFYq62WjbAN1hjs/F9NAljLGbcWfkzXztgBsrFTiGqbrE4eQTc1ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XelD2B4pXLO/pscd3ozgXouGCQgqJpN16QfhWbtxGSs=;
 b=rOQRr6d1HibGWh1sFGK1TTkWe3J6Rw2GLvQcnxjRW/XVcWSvsndMRNpq2nsIvP5tjA+fnSiJbpic2K1RKGQpTbnQ6luEmSWTdpHxsD1up0hsqxcCdi7tCvVZRLjxD89t47MHt05IAINJsfObhhAYzENiDtZ2IaqaZgxT04CTiWQvgBpU3LyUB9THFUygZhQuXy3Bepqmr1FGDgajs35KqRmBfyb1BxGzfMmkqMAvcn3I0//tn/EdheV6JbgwlpsaYk8ckcNa+nGcWUjUzvZj9Ecs90p9tDz4fgFkhedoubtWtLzosAR3oN+JvjH78LFU3YMWPVuB64qY0dYE5KI2kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XelD2B4pXLO/pscd3ozgXouGCQgqJpN16QfhWbtxGSs=;
 b=YmhVaZQTLJspqVo36P0Be4/gl4EYIIdP8IzwktzVrZZgYDNiWg3pUThgbHFj7ZYJjSLRf4t8yynOn68D69hbzOEUOLX2Yi+iHR12pA0Bw3bXTaiOd7Gyv1RI8Esnb/8e0SMcwlfndx6ZskBNJ4fEsHbiRuOY3IZ6EUNY9VW5uJE=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 09/15] xen/x86: introduce a new amd cppc driver for
 cpufreq scaling
Thread-Topic: [PATCH v4 09/15] xen/x86: introduce a new amd cppc driver for
 cpufreq scaling
Thread-Index: AQHbrRCsgX0DHfsxBEGtMOCcDZZeSLO6zAoAgAwkvoA=
Date: Wed, 7 May 2025 09:19:13 +0000
Message-ID:
 <DM4PR12MB8451439DD06E810826853838E188A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-10-Penny.Zheng@amd.com>
 <448d6036-09ad-4505-800d-47606e8a3274@suse.com>
In-Reply-To: <448d6036-09ad-4505-800d-47606e8a3274@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=2e500a0c-1fb0-47c4-85e0-2cb5a0521676;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-05-07T09:19:04Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|BY5PR12MB4243:EE_
x-ms-office365-filtering-correlation-id: 766b0b1a-6001-4c56-ada5-08dd8d483b8e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TXJVQ1c3S2szeXM2N096dlNFTnlJZTdNOGJjVDBmSk9OVmUyZHJBYUR2WGVB?=
 =?utf-8?B?Qk1zUDJIckwwWW05cEF1SnZqSk91WVZjcG9SbGwzeWtxNi9xc0cwblNVRmdU?=
 =?utf-8?B?V3JCUm1aQ3lGQWxxejhjUGRET2ltaDlKL2NXamgxd2s4YWRCZitaY1VQc3k4?=
 =?utf-8?B?c2N2NklsWk4wUjRsRlV6bHF5dDdrMklSd0JxWnlQeUNhWlpFU205L3Y0ZUNi?=
 =?utf-8?B?amo4c2t3VDRROHBIditZaDB3MG9qeS94YXp0dEhNaWlqcXpxSFVXYUpqVnhF?=
 =?utf-8?B?Uzh5OEZ1SDlySHpwL1o1Sm1xQU5McUxJL3VPSjlvNHVja1BFOEVBQys0ZTFQ?=
 =?utf-8?B?cyt2OHdhb2FMbnBZaVpsaWNUS1NzbEw2Vm1aaDhSTzB6Zk1UV0R5VVRha2Yx?=
 =?utf-8?B?YkVLRmlZUnRVTENCUi9rdkJLTTAzNlA4cGsyckZxbmViYkUxdjdKTVBNdWtx?=
 =?utf-8?B?N1hZL05yL0dIRnVJemJ1MnZDdVF6M0dncWQyeG40NXZDVXp6REU3aGxOSTF2?=
 =?utf-8?B?UjBOMEpTZmkxSXUrMzV0Uk9mSndESkY3d2ZkcmpNdlRzVmtjQ3JjVCtreE5D?=
 =?utf-8?B?a24vYzZJWmthNHppZjRJZkN6eXlQa29EejhvN1kyZXdkVU8vbzdadkdnY2Na?=
 =?utf-8?B?NmxkanVqcElkcTVNd2txeklNVzVsM2hycFgvMmpnODBWby82NHF6OElrdEdt?=
 =?utf-8?B?SEJXRlJtcjlXT2diK29oUEJrQmhqSzBOM1lERC84eTlwWEN5ZFBVVUlocG9T?=
 =?utf-8?B?eEtDeWkvenF0aHNSTDVyZER6L2FIaFJaMXVpT3ZrdTdUTlhTeGppbzJMV1BS?=
 =?utf-8?B?Nk44QjV5UmlYUnJaY1N3czhyeVJhMVdHSThpNC9jTzVuT1RjWmIwdXllVDdM?=
 =?utf-8?B?ZkM1V1VocEU5dTFSdWszeFM4VlVOc2VQK1ozWjhuRVIwK3c4d1A0NnR3eDJ1?=
 =?utf-8?B?OTBRQWtRU1JXOHhXSHVsVEV0RU5lSUNYNSsvaGNadGtKMDRhRGE1MHZHaUdX?=
 =?utf-8?B?czhKTEI4ZkJMV0xTbW1YWExaOUMxUmJwN1hVM3dzZWp1OWVGTERpa0FUdDNK?=
 =?utf-8?B?YjdEVHU5Wkxlc1FTT3o4aEVlQk1RMWdFRHh2bU0vbm9zKzlvTnB1VjhnVGVV?=
 =?utf-8?B?WEpkVEN5blFkNzQyWHVtTFNoeFZySWFZSk5rUUJqRUIwQXNKWXJVUHJvWVMy?=
 =?utf-8?B?SWpYTDhrbWNOT1dNSFdiempsV1VHS1pocGxqQlpmNUlYRjU5RTJlU3lJZ2JX?=
 =?utf-8?B?UUFlczdkZHE5eG5YL0dvY2dHRElIcUlueDJJZnBBbkVQWXpNOUVOSElNaVZv?=
 =?utf-8?B?cUtEVVJnL0dqdTRnWXVYODBoWWxVYWRGSVFZOWtvRG96MzhzMnZrMmZ0bnIw?=
 =?utf-8?B?ck1kZllyQmEwaXY4emRWbEc3K2sxWUUxdk4wMDB5YW5qc1VsUm5nS1g2Skhl?=
 =?utf-8?B?TXlhYjR3S01KWUVuUFJPbEZBSjRaSkxwdWtObWxROFRsN1R6OFB0YldPL1Ru?=
 =?utf-8?B?cThvMjRPcktRampnNkp1NTlxNVVxMU9qQ0lMUVdrMkNwQTlseGRLTDJPYUxa?=
 =?utf-8?B?bHNob1Zubkt3N0V0RzlkZEs2ZmZUZnlsVDFNMlc4Z0hsMU1teHZyK05WQklv?=
 =?utf-8?B?U2tOR3luMVl4a3hRZ0Z0a0Fka2FwYXQ5bkJwanR6cTZFQ3NpWENoQXhlTTE5?=
 =?utf-8?B?MzU0ajkvQXY1eGNIL1VYMzU2a3JtRDZEbU5VM0xoTFBBTlkrU25wb2RvNDB1?=
 =?utf-8?B?VGJjREdvVE5HcGV6cXo3ZEtNcDk3aW5aZDNlcEVzL1NWMUF1bE5oTzJuK3R2?=
 =?utf-8?B?MGxNM2FHSk1DN3YxaStZdGJlaVIzN1VvaC9SVjdPdGxFOENYUkx1SUpNaEhB?=
 =?utf-8?B?cjJaODZlTDdtUE9MTWNNMDZ0WW5WVmZnYXBLVkhmSGRhMEdCNENGek9tRUtI?=
 =?utf-8?B?Nmh0S2ZhcHJ6UFNYanBCYWhzUlZsODJWMkMyUjE4SW5SbDhwY2ZRTE1naytU?=
 =?utf-8?Q?AEFQVEuwj1f8B9nEdoy7g8JdZdG/ec=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NmdFT1A2Si9HT2RheEtyU2RwVzM5MWdoR2g5cUNIaEJ3ZHVVSTZSSTl1ZGFE?=
 =?utf-8?B?NGNMeElWNE8vOXpBR2dEY096dHV2YVNmWkNZZE5mOEFoZ2daNDRTZWNPWFV0?=
 =?utf-8?B?K09zbW92YWZ6Zi9qbEJrS1BrNER5d1YvdENPcytoVHMwRWRrQ2M0eE9nR2ZW?=
 =?utf-8?B?YXpOWmswQTd3bzJvSW55WndoT1l6ZmdFejhkYkhMWnhvRHU4SjJGbDJJYmNS?=
 =?utf-8?B?K1R0dCtUVHZFQTBncU1mUTRJZ1k2dnZBU0Y0QUVwSXYzMHBHajRQR3lQUXcx?=
 =?utf-8?B?N3BzenpzNHArWkZVTE9xK01obFpjODZvTWZlZ3lrNHNVQzdPMDlTTnhkZnhl?=
 =?utf-8?B?RlpTbWlTTFJiSVlqa3h3a2phM2FQSWhvN1dBb1RCUFJOQ3REdCtCL01PYVNh?=
 =?utf-8?B?SVVEYXZLSnFnY0t5NHJjREJkNTQ1bFRXTWFQYlZFZWR4VmRsN09sYnhscWZx?=
 =?utf-8?B?NlhlZVY2M29Belo5d3NWaGZQcExmTEhTa1daZDZNWlA0anBKTHU3ckRHY2pH?=
 =?utf-8?B?cC9SR09FeDNOUXdFKzBvZ0pyTWt4cFRGMm1WcEs5S3hNdXBTeG9wYkdkbTM3?=
 =?utf-8?B?c3ZvRWdQQTQyNjl5SGRMK25uNjNDSXB5Znd0NU1KbzN2dUx0UzlrTHVRYXVH?=
 =?utf-8?B?MlVneFFLbngvTEtzcldvT20vcU95T3RYaUc0ZU55a0tKRVp6N3BBbHFtV0tk?=
 =?utf-8?B?VDVneXNDTnZzRXROc1c2Tk5BVXdubTJYSmQvYlJRZlRCMmRGVWZtRGhEZHFk?=
 =?utf-8?B?emxkQXdOY1A3aHJiNzFGb3hJVGhsb1pSdXkzUk9YOUJjM3MrSFJnaEw2aXRk?=
 =?utf-8?B?REo5OHBNY29La2d2Y1ZTVnBOOEszc3RZcHVybmtFTW1MbEYwSnRoeE53bEZF?=
 =?utf-8?B?amFHL2dhdGRvdUQ0bS9SWlRVVjVHWmNmN0trOXFxK0Jvd2lxWTZnM0hBZFpH?=
 =?utf-8?B?SkM0TnhjSzlIbDFOVmtSQjN6OGhuZHJoSlloNnNtREhZcmRXZ3padTVpR0tQ?=
 =?utf-8?B?NlQwY1JkNjNCZXpYNEYwUDBNR0k2cXBsaXhMa1lhSWpwMDlEWkhZRjVPMkM2?=
 =?utf-8?B?bGtBRUdzYU9Nblp1OUI2dGg1RjJBY3k3MG1scGtHaEs2ODczSFlXK0NZSzRL?=
 =?utf-8?B?MlFFakV3Q1lRbHJXNnh1eXpXNGdEdHhWUXR0Tk5ud2FFMzZCZjRoeURCbWVV?=
 =?utf-8?B?NGpINFdYN2ZFU1RxUTczUEhUb2RCejNIMEk4VXlXQ2gzZjVoUjhuVXlKcmxC?=
 =?utf-8?B?VUZHK1FvZ0FaMnJQaHpSNEVSM1JKN2FXRlcyNXZ3MmJDem1DMkRwWndCZEdP?=
 =?utf-8?B?a3FpUlA5bXc3Z1R1dmJKbGFxZ0JyUmRNaVpqZlFHY0Nia1h1UnBpNzdYT0NR?=
 =?utf-8?B?Tk53WlMxMHArMExkWHBOU1YrMVp0YWtqTWNSOXo1TUFwemo5aFM5aVJWS050?=
 =?utf-8?B?d1BVdFdFMnhTZzA3SXVqS0duTmowSlVkbmZpNWIvQllxUllvWUdrUEZLNXZK?=
 =?utf-8?B?b3hDVC9PNHJtamxvVnpvdUFNRWFnMDM0S3RmblNDZVRYV2JrTmJ2ZHpRYlN0?=
 =?utf-8?B?QTJ3TldOUGZqSlc0T1VkYTNQV0txb3VMM29rSFNsdjU3T2wxdjdZbWtCNVlN?=
 =?utf-8?B?UjVkZmF4dDUzM0ZEZjQ5NW15Qkd5cFZpZ0RJQ2xvRGlxTjlPTVI0WTVITjRH?=
 =?utf-8?B?NkIxa0lSL0kweGNLZDBaMTlNVmltT0RueVlOSEppalVXeTE5Rlg0U3ZMOTM3?=
 =?utf-8?B?bG1YUTRkbmltYk8rL1NIT0krRzBMenFnL2pWdXV1NEVCNzNVdUlCcXA3N00y?=
 =?utf-8?B?cmoxdkt5b1NqVHhDS3YxZWovMXJFcHcwWWdmUXBRWU5WenY4a2tVT3dnYUFL?=
 =?utf-8?B?RjRxa0pkZlAvRTRHbmdFKzBZK1h6QlV1bVRyVEF2cGVRU1QzREFkRmkyTWFH?=
 =?utf-8?B?T21tWStnT3lsYytBckFTazdUelVuejhuUFdFNkp5TVcrUWloV2NsdXJSRDF2?=
 =?utf-8?B?TEVxQkN0SXc2RWlaZDRXeHo2eDJtSHFYOTBPcGhMR3M5bnFPR0F4NlllM1A1?=
 =?utf-8?B?UFVoYitXSmd2QWUvR3NXMkJIQ2tvejFxWS9pcmxHa3pDRmdGNWtjM0kyU2ht?=
 =?utf-8?Q?YKnM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 766b0b1a-6001-4c56-ada5-08dd8d483b8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 09:19:13.2537
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D/J7IqeXfJr6UvkGh9LpK3sRIUwuErAKzrNchZV5hNqhzUDXyMgQjO4xw4jigce+iwWYKuKNO2EoikogO6D3bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4243

W1B1YmxpY10NCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBBcHJpbCAy
OSwgMjAyNSAxMDoyOSBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29t
Pg0KPiBDYzogSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBBbmRyZXcgQ29vcGVyDQo+
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1
QGNpdHJpeC5jb20+OyB4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjQgMDkvMTVdIHhlbi94ODY6IGludHJvZHVjZSBhIG5ldyBhbWQgY3Bw
YyBkcml2ZXIgZm9yDQo+IGNwdWZyZXEgc2NhbGluZw0KPg0KPiBPbiAxNC4wNC4yMDI1IDA5OjQw
LCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvYWNwaS9jcHVmcmVx
L2FtZC1jcHBjLmMNCj4gPiArKysgYi94ZW4vYXJjaC94ODYvYWNwaS9jcHVmcmVxL2FtZC1jcHBj
LmMNCj4gPiArLyoNCj4gPiArICogSWYgQ1BQQyBsb3dlc3RfZnJlcSBhbmQgbm9taW5hbF9mcmVx
IHJlZ2lzdGVycyBhcmUgZXhwb3NlZCB0aGVuIHdlDQo+ID4gK2Nhbg0KPiA+ICsgKiB1c2UgdGhl
bSB0byBjb252ZXJ0IHBlcmYgdG8gZnJlcSBhbmQgdmljZSB2ZXJzYS4gVGhlIGNvbnZlcnNpb24g
aXMNCj4gPiArICogZXh0cmFwb2xhdGVkIGFzIGFuIGxpbmVhciBmdW5jdGlvbiBwYXNzaW5nIGJ5
IHRoZSAyIHBvaW50czoNCj4gPiArICogIC0gKExvdyBwZXJmLCBMb3cgZnJlcSkNCj4gPiArICog
IC0gKE5vbWluYWwgcGVyZiwgTm9taW5hbCBmcmVxKQ0KPiA+ICsgKi8NCj4gPiArc3RhdGljIGlu
dCBhbWRfY3BwY19raHpfdG9fcGVyZihjb25zdCBzdHJ1Y3QgYW1kX2NwcGNfZHJ2X2RhdGEgKmRh
dGEsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGZy
ZXEsIHVpbnQ4X3QgKnBlcmYpIHsNCj4gPiArICAgIGNvbnN0IHN0cnVjdCB4ZW5fcHJvY2Vzc29y
X2NwcGMgKmNwcGNfZGF0YSA9IGRhdGEtPmNwcGNfZGF0YTsNCj4gPiArICAgIHVpbnQ2NF90IG11
bCwgZGl2Ow0KPiA+ICsgICAgaW50IG9mZnNldCA9IDAsIHJlczsNCj4gPiArDQo+ID4gKyAgICBp
ZiAoIGZyZXEgPT0gKGNwcGNfZGF0YS0+Y3BjLm5vbWluYWxfbWh6ICogMTAwMCkgKQ0KPg0KPiBJ
J20gcHJldHR5IHN1cmUgSSBjb21tZW50ZWQgb24gdGhpcyBiZWZvcmU6IFRoZSBleHByZXNzaW9u
IGhlcmUgX3N1Z2dlc3RzXyB0aGF0DQo+ICJmcmVxIiBpcyBpbiBrSHosIGJ1dCB0aGF0J3Mgbm90
IGJlaW5nIG1hZGUgZXhwbGljaXQgYW55d2hlcmUuDQo+DQoNClNvcnJ5LCBJIG1heSBvdmVybG9v
aywgYW5kIEknbGwgYmUgbW9yZSBjYXJlZnVsLg0KSSBoYXZlIGNsYXJpZmllZCBpdCBpbiB0aGUg
ZnVuY3Rpb24gdGl0bGUsIGFuZCBtYXliZSBpdCdzIG5vdCBlbm91Z2guIEknbGwgY2hhbmdlIHRo
ZSBwYXJhbWV0ZXINCm5hbWUgZnJvbSAiZnJlcSIgdG8gImZyZXFfa2h6IiB0byBiZSBtb3JlIGV4
cGxpY2l0Lg0KDQo+ID4gKyAgICB7DQo+ID4gKyAgICAgICAgKnBlcmYgPSBkYXRhLT5jYXBzLm5v
bWluYWxfcGVyZjsNCj4gPiArICAgICAgICByZXR1cm4gMDsNCj4gPiArICAgIH0NCj4gPiArDQo+
ID4gKyAgICBpZiAoIGZyZXEgPT0gKGNwcGNfZGF0YS0+Y3BjLmxvd2VzdF9taHogKiAxMDAwKSAp
DQo+ID4gKyAgICB7DQo+ID4gKyAgICAgICAgKnBlcmYgPSBkYXRhLT5jYXBzLmxvd2VzdF9wZXJm
Ow0KPiA+ICsgICAgICAgIHJldHVybiAwOw0KPiA+ICsgICAgfQ0KPg0KPiBIb3cgbGlrZWx5IGlz
IGl0IHRoYXQgdGhlc2UgdHdvIGVhcmx5IHJldHVybiBwYXRocyBhcmUgdGFrZW4sIHdoZW4gdGhl
IGluY29taW5nDQo+ICJmcmVxIiBpcyAyNSBvciA1IE1IeiBncmFudWxhcj8gSU9XIC0gaXMgaXQg
cmVsZXZhbnQgdG8gc2hvcnRjdXQgdGhlc2UgdHdvIGNhc2VzPw0KPg0KDQpTb3JyeSwgSSBtYXkg
bm90IHVuZGVyc3RhbmQgd2hhdCB5b3UgbWVhbiBoZXJlLg0KQW5zd2VyaW5nICIgSG93IGxpa2Vs
eSBpcyBpdCB0aGF0IHRoZXNlIHR3byBlYXJseSByZXR1cm4gcGF0aHMgYXJlIHRha2VuICINCkl0
J3MgcmFyZSBpZy4uLi4gbWF5YmUgKm9uZGVtYW5kKiBnb3Zlcm5vciB3aWxsIGZyZXF1ZW50bHkg
Z2l2ZSBmcmVxdWVuY3kgYXJvdW5kIG5vbWluYWwgZnJlcXVlbmN5LA0KYnV0IHRoZSBleGFjdCB2
YWx1ZSBpcyByYXJlIGlnLg0KSSdtIGNvbmZ1c2VkIGFib3V0ICIgd2hlbiB0aGUgaW5jb21pbmcg
ICJmcmVxIiBpcyAyNSBvciA1IE1IeiBncmFudWxhciAiLg0KQXJlIHdlIHRhbGtpbmcgYWJvdXQg
aXMgaXQgd29ydGh5IHRvIGhhdmUgdGhlc2UgdHdvIGVhcmx5IHJldHVybiBwYXRocyBjb25zaWRl
cmluZyBpdCBpcyByYXJlbHkgdGFrZW4NCg0KPiA+ICsgICAgaWYgKCBjcHBjX2RhdGEtPmNwYy5s
b3dlc3RfbWh6ICYmIGNwcGNfZGF0YS0+Y3BjLm5vbWluYWxfbWh6ICYmDQo+ID4gKyAgICAgICAg
IGNwcGNfZGF0YS0+Y3BjLmxvd2VzdF9taHogPCBjcHBjX2RhdGEtPmNwYy5ub21pbmFsX21oeiAp
DQo+DQo+IEFsb25nIHRoZSBsaW5lcyBvZiBhIGNvbW1lbnQgb24gYW4gZWFybGllciBwYXRjaCwg
dGhlIG1pZGRsZSBwYXJ0IG9mIHRoZSBjb25kaXRpb24NCj4gaGVyZSBpcyByZWR1bmRhbnQgd2l0
aCB0aGUgM3JkIG9uZS4gQWxzbywgZG9uJ3QgeW91IGNoZWNrIHRoaXMgcmVsYXRpb24gYWxyZWFk
eQ0KPiBkdXJpbmcgaW5pdD8gSU9XIGlzbid0IGl0IHRoZSAzcmQgcGFydCB3aGljaCBjYW4gYmUg
ZHJvcHBlZD8NCj4NCg0KWWVzLCB5b3UncmUgcmlnaHQuIEkndmUgY2hlY2tlZCBpdCBpbiBzZXRf
Y3BwY19wbWluZm8oKSBhbHJlYWR5IGFuZCBvbmx5IGdhdmUgd2FybmluZ3MgdGhlcmUuDQpJIHNo
YWxsIGRlbGV0ZSB0aGUgY2hlY2sgaGVyZSwgYW5kIGJlc2lkZXMgZ2l2aW5nIHdhcm5pbmcgbWVz
c2FnZSBkdXJpbmcgaW5pdCwgaWYgdmFsdWVzIGFyZQ0KaW52YWxpZCwgaW5zdGVhZCBvZiBzdG9y
aW5nIGludmFsaWQgdmFsdWVzLCB3ZSBzaGFsbCBzZXQgY3BwY19kYXRhLT5jcGMubG93ZXN0X21o
eiAvIGNwcGNfZGF0YS0+Y3BjLm5vbWluYWxfbWh6IHRoZW0NCnplcm8uLi4gVGhlbiB3aGVyZXZl
ciB3ZSBhcmUgdHJ5aW5nIHRvIHVzZSB0aGVtLCBsaWtlIGhlcmUsIG5vbi16ZXJvIHZhbHVlcyBl
bnN1cmVzIHZhbGlkIHZhbHVlcy4NCg0KPiA+ICtzdGF0aWMgaW50IGFtZF9nZXRfbWF4X2ZyZXEo
Y29uc3Qgc3RydWN0IGFtZF9jcHBjX2Rydl9kYXRhICpkYXRhLA0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdW5zaWduZWQgaW50ICptYXhfZnJlcSkgew0KPiA+ICsgICAgdW5zaWdu
ZWQgaW50IG5vbV9mcmVxID0gMCwgYm9vc3RfcmF0aW87DQo+ID4gKyAgICBpbnQgcmVzOw0KPiA+
ICsNCj4gPiArICAgIHJlcyA9IGFtZF9nZXRfbG93ZXN0X29yX25vbWluYWxfZnJlcShkYXRhLA0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRhdGEtPmNwcGNf
ZGF0YS0+Y3BjLm5vbWluYWxfbWh6LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGRhdGEtPmNhcHMubm9taW5hbF9wZXJmLA0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICZub21fZnJlcSk7DQo+ID4gKyAgICBpZiAoIHJl
cyApDQo+ID4gKyAgICAgICAgcmV0dXJuIHJlczsNCj4gPiArDQo+ID4gKyAgICBib29zdF9yYXRp
byA9ICh1bnNpZ25lZCBpbnQpKGRhdGEtPmNhcHMuaGlnaGVzdF9wZXJmIC8NCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZGF0YS0+Y2Fwcy5ub21pbmFsX3BlcmYpOw0KPg0K
PiBJIG1heSBoYXZlIHNlZW4gbG9naWMgZW5zdXJpbmcgbm9taW5hbF9wZXJmIGlzbid0IDAsIHNv
IHRoYXQgcGFydCBtYXkgYmUgZmluZS4gV2hhdA0KPiBndWFyYW50ZWVzIHRoaXMgZGl2aXNpb24g
dG8geWllbGQgYSBwb3NpdGl2ZSB2YWx1ZSwgdGhvdWdoPw0KPiBJZiBpdCB5aWVsZHMgemVybyAo
c2F5IDB4ZmYgLyAweDgwKSwgLi4uDQo+DQoNCkkgdGhpbmsgbWF5YmUgeW91IHdlcmUgc2F5aW5n
IDB4ODAvMHhmZiB0byB5aWVsZCB6ZXJvIHZhbHVlLiBGb3IgdGhhdCwgd2UgY2hlY2tlZCB0aGF0
IGhpZ2hlc3RfcGVyZg0KbXVzdCBub3QgYmUgc21hbGxlciB0aGFuIG5vbWluYWxfcGVyZiBkdXJp
bmcgaW5pdCwgc2VlIC4uLg0KDQo+ID4gKyAgICAqbWF4X2ZyZXEgPSBub21fZnJlcSAqIGJvb3N0
X3JhdGlvOw0KPg0KPiAuLi4gemVybyB3aWxsIGJlIHJlcG9ydGVkIGJhY2sgaGVyZS4gSSB0aGlu
ayB5b3Ugd2FudCB0byBzY2FsZSB0aGUgY2FsY3VsYXRpb25zIGhlcmUgdG8NCj4gYXZvaWQgc3Vj
aC4NCj4NCj4gPiArc3RhdGljIHZvaWQgY2ZfY2hlY2sgYW1kX2NwcGNfaW5pdF9tc3JzKHZvaWQg
KmluZm8pIHsNCj4gPiArICAgIHN0cnVjdCBjcHVmcmVxX3BvbGljeSAqcG9saWN5ID0gaW5mbzsN
Cj4gPiArICAgIHN0cnVjdCBhbWRfY3BwY19kcnZfZGF0YSAqZGF0YSA9IHRoaXNfY3B1KGFtZF9j
cHBjX2Rydl9kYXRhKTsNCj4gPiArICAgIHVpbnQ2NF90IHZhbDsNCj4gPiArICAgIHVuc2lnbmVk
IGludCBtaW5fZnJlcSA9IDAsIG5vbWluYWxfZnJlcSA9IDAsIG1heF9mcmVxOw0KPiA+ICsNCj4g
PiArICAgIC8qIFBhY2thZ2UgbGV2ZWwgTVNSICovDQo+ID4gKyAgICByZG1zcmwoTVNSX0FNRF9D
UFBDX0VOQUJMRSwgdmFsKTsNCj4gPiArICAgIC8qDQo+ID4gKyAgICAgKiBPbmx5IHdoZW4gRW5h
YmxlIGJpdCBpcyBvbiwgdGhlIGhhcmR3YXJlIHdpbGwgY2FsY3VsYXRlIHRoZSBwcm9jZXNzb3Li
gJlzDQo+ID4gKyAgICAgKiBwZXJmb3JtYW5jZSBjYXBhYmlsaXRpZXMgYW5kIGluaXRpYWxpemUg
dGhlIHBlcmZvcm1hbmNlIGxldmVsIGZpZWxkcyBpbg0KPiA+ICsgICAgICogdGhlIENQUEMgY2Fw
YWJpbGl0eSByZWdpc3RlcnMuDQo+ID4gKyAgICAgKi8NCj4gPiArICAgIGlmICggISh2YWwgJiBB
TURfQ1BQQ19FTkFCTEUpICkNCj4gPiArICAgIHsNCj4gPiArICAgICAgICB2YWwgfD0gQU1EX0NQ
UENfRU5BQkxFOw0KPiA+ICsgICAgICAgIHdybXNybChNU1JfQU1EX0NQUENfRU5BQkxFLCB2YWwp
Ow0KPiA+ICsgICAgfQ0KPiA+ICsNCj4gPiArICAgIHJkbXNybChNU1JfQU1EX0NQUENfQ0FQMSwg
ZGF0YS0+Y2Fwcy5yYXcpOw0KPiA+ICsNCj4gPiArICAgIGlmICggZGF0YS0+Y2Fwcy5oaWdoZXN0
X3BlcmYgPT0gMCB8fCBkYXRhLT5jYXBzLmxvd2VzdF9wZXJmID09IDAgfHwNCj4gPiArICAgICAg
ICAgZGF0YS0+Y2Fwcy5ub21pbmFsX3BlcmYgPT0gMCB8fCBkYXRhLT5jYXBzLmxvd2VzdF9ub25s
aW5lYXJfcGVyZiA9PSAwIHx8DQo+ID4gKyAgICAgICAgIGRhdGEtPmNhcHMubG93ZXN0X3BlcmYg
PiBkYXRhLT5jYXBzLmxvd2VzdF9ub25saW5lYXJfcGVyZiB8fA0KPg0KPiBTYW1lIHF1ZXN0aW9u
IGFzIGFza2VkIGVsc2V3aGVyZSAtIHdoZXJlIGlzIHRoaXMgcmVsYXRpb24gc3BlY2lmaWVkPw0K
Pg0KPiA+ICsgICAgICAgICBkYXRhLT5jYXBzLmxvd2VzdF9ub25saW5lYXJfcGVyZiA+IGRhdGEt
PmNhcHMubm9taW5hbF9wZXJmIHx8DQo+ID4gKyAgICAgICAgIGRhdGEtPmNhcHMubm9taW5hbF9w
ZXJmID4gZGF0YS0+Y2Fwcy5oaWdoZXN0X3BlcmYgKQ0KDQpoZXJlIC4uLg0KDQo+DQo+IEphbg0K

