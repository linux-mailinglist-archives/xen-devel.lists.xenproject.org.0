Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB514B19BAF
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 08:47:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068776.1432639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uioym-0000Wh-OV; Mon, 04 Aug 2025 06:47:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068776.1432639; Mon, 04 Aug 2025 06:47:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uioym-0000VE-LO; Mon, 04 Aug 2025 06:47:28 +0000
Received: by outflank-mailman (input) for mailman id 1068776;
 Mon, 04 Aug 2025 06:47:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=owTc=2Q=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uioyk-0000V8-FH
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 06:47:26 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2414::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfd9b19d-70fe-11f0-b898-0df219b8e170;
 Mon, 04 Aug 2025 08:47:23 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 IA1PR12MB8333.namprd12.prod.outlook.com (2603:10b6:208:3fe::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Mon, 4 Aug
 2025 06:47:18 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%7]) with mapi id 15.20.8989.018; Mon, 4 Aug 2025
 06:47:18 +0000
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
X-Inumbo-ID: dfd9b19d-70fe-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OlrPvP2pe6iMfaJIdDIKqaUObVxf7U54xvz06cb88cqvKN6/PSIYFs1dl5DNIWC9BrF1Bil1/OTnxjjlAaSLvJrwQuAEHq6WErY5xm7jKV1En6329Qdb/ZNzBvxrz+htZdMCZNRdIHValtpvzHSnv4t09klVtuWaEM0pW5+lNrtNIJa0tZ1ZdQoOLp4mR//iUTPWQtP/UzAmgu0lQoXXHAPKFYsaTnr0HumSpqU8gzNkD30G5x6IitcZvBejB7clHaaWlUpa3z1cdq0qLkytFo7GbdXKaN+6WiUs+BfMcZEZtgE2atYmyHd4EBtPUNV8Rz2CFV0yJKCNVk6katT9UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2xq/ReXY7puCQUxFZtlcfELrpwip3t48nwXBkwAwcZI=;
 b=b/5bcFoBfJ9TEAsGXAcCdXuqP8zW+HOHLt7TMSaWU2Y991/zQrKQK1KgM9Slf1QtSksOTeBzPsu9SYTfbi1b2TyIT+o8QDv+BipM1xIgy4Qvej+E/2o7ssCUI+YSskXBmm2U02OiN9/gTXznlbVw/M/qls4EcKITbkTvvyFEPRHXtfX6rMB6cXQm42YLjDi71TH9LVJzh3DBP8nCUJWpOWfT558SHD1eQRemJLRQcSFytmYSFU960uCpO4zcwjATj9l156zK+SETvequavCeQeovoSDuxQd9FPit/3gxrF+UCzTE2TJ7BSzi3QkLjasovImF3NTSEaLcErf5lujXbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xq/ReXY7puCQUxFZtlcfELrpwip3t48nwXBkwAwcZI=;
 b=OuHr+khCpO90hx4BngKpF2RH7SuPHH72j30F6FlaNAtO9MnYCooL5Ujwhfa5x5WpG3iyqossd35BZqessG4TJ4TRaBM6V8eycVYXx/sqxgZDMnhpOnSZp+ejOEoqJlBCEl2fx+rL1rWghLS0H4vjnoSGOdBzTPJ3ht54F9tbLVE=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Orzel,
 Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v6 10/19] xen/cpufreq: introduce new sub-hypercall to
 propagate CPPC data
Thread-Topic: [PATCH v6 10/19] xen/cpufreq: introduce new sub-hypercall to
 propagate CPPC data
Thread-Index: AQHb8hcitzgUOLdI9E2rorZhWa2gA7Q061mAgB1EZAA=
Date: Mon, 4 Aug 2025 06:47:17 +0000
Message-ID:
 <DM4PR12MB845142B33B4AE40453161BF1E123A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
 <20250711035106.2540522-11-Penny.Zheng@amd.com>
 <916162aa-01fa-42a3-82c6-42a2c635f082@suse.com>
In-Reply-To: <916162aa-01fa-42a3-82c6-42a2c635f082@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-08-04T06:47:11.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|IA1PR12MB8333:EE_
x-ms-office365-filtering-correlation-id: 1a0a1966-2020-4a74-b289-08ddd322c131
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TW9xeUpPOGx1WnBzY2dhMUdnbnRibHNTdjdHUXY0SnhrSEhhRmZmdDNIYXRq?=
 =?utf-8?B?UmdZRWRvV2VTS1M0RXhYbXE2WUF3dWRpSVNsZERaMkR6ZFV6WkFkaXJMTEU2?=
 =?utf-8?B?VFBzWVd6UGg4d1dmV3hSWDBzNUlpL1V6QVA4ZWtPSEtBcXpLc0o2eXI1M0ty?=
 =?utf-8?B?L1dFMWU3OUdBdW1VdlBIQTFDNU1mWTgrdHdFNEcxL0FBUmk2Q00vbGI2Vloy?=
 =?utf-8?B?R1RUazlkRHpHR3hNdHUwR1lpWHNHVGJCYkM0aEdMZzUvbmdYQzlaRTBBcExt?=
 =?utf-8?B?dlBITVp1Wi9YdVVweU9laDl1eFh4cnYweGpmT1UzT1RDSlFxUlllektzUDcy?=
 =?utf-8?B?V0NVcElyVzVwUlIxbEo4aVV5U0dqdXRqQ1hEdU92dzhPRkw5bzZsanMvQ3BP?=
 =?utf-8?B?Wkw1QXg5OVRKckdNL1JFM2JXT0ladFFGQlRqTTZJZFVrM1Qrd3MxMkVRR2F1?=
 =?utf-8?B?TjVjekJ5aTVxSkNCc1hWSTRUSmFNakhteTZJSG0yV2ZiMWovWU5ZNXVVeWhV?=
 =?utf-8?B?T2dTeS9sV2VXcjg2eHBhcmZEb3BUT09oVUM5c2o2dWF0T1FOZFYxbHBoT1dv?=
 =?utf-8?B?aEhGRGtZbU44dURIcFNhaEpwdE8vdzBySFRmSERxYnM4VzZIdzZWZVZ1Z3V3?=
 =?utf-8?B?TnlVUTIxWVQ0dUtHcE0xTFRjelI2RG5pa2x4NjlXZkRqS1VEbTR1TWZTSTlS?=
 =?utf-8?B?YVQ1bGNBRjI1eFlleHBtMENXUFE3aEQ5VXJTcmpFVEZ0SlJvQnIvdEkrNGdL?=
 =?utf-8?B?WmIrSVNPY0NWZ3BtVWlEZk9WVzQvTEVmQU9QOGJ5bDhtcHRzMVFHL0g3L0pv?=
 =?utf-8?B?STVHYk9tekhobjY1RWVyQzJrdjNLUTZPbE4wMEtXM1IwamM3eFc4UmNWQ3VI?=
 =?utf-8?B?c05sd0RHQ20zOXBFRDVkU2tsUW9qcVZWM1NFdEtkdXJNbGx6MXdsLzh4UkVT?=
 =?utf-8?B?WlV6T3RzNkhhQldSVWtTSkpkUlZEVW9vdHBsZzlyTGozZG5YRWV5aDdHVUhy?=
 =?utf-8?B?N3JuYjZBZndZb0tsWXVsT3B1YmNHZ1FTTFNaVnhZSFVDY1pzWlRtUlhES1ZC?=
 =?utf-8?B?OHlvNDUySzdUQlNiY2N6UnFWckRMMGFiUjJVWllFdXMvdXdZRkRHY2E0MUM4?=
 =?utf-8?B?MXU5ekRvMVZQQ0IzTkZSMitCOGtSY0doUitpUXV1R2YzVDF2dHBCakFabEtm?=
 =?utf-8?B?OFlRTDlFQzVvRDZPa0lhbTlCSW5hb1dkcmIvdlN6Y0RERTJrYTd2Y2J4RVJt?=
 =?utf-8?B?ZHFVSlFEREs1K2Nmd0VEOWdqbW9Gb2NyQzYvbGlFbnFNRm1EK3lWaVBmZkZD?=
 =?utf-8?B?V1ZIWUh2bjVvZ0hGQkRKTXk3UWwvUEVpN0c5VXBBM0NNZnpKRUJoZzZyN3pK?=
 =?utf-8?B?enRmQU8zU2FCQTdkOVZNbDJiSmxqVDZldFNtSEdiUnVCZjNzSis2bVc1YWUy?=
 =?utf-8?B?Z3Y2OGF1U0RuL1hWYmwvaDZ0WTVWcG9abmhWeTRXZGhSR0NSc2FBVkRMRXFC?=
 =?utf-8?B?cjU1UXd6WXpyQlhhRXFWVEJieEExNis3NTVEUlBUWFI4Q1M5bWZ3Z3RtblZH?=
 =?utf-8?B?Rm5NakJ4VTlWaGN0U096ZktITmNyeElnbG0xbGM3dG1IYXR6MStsTDExdkQ3?=
 =?utf-8?B?LzM1RC9jd1VmN0VVVTVvNE1BdTRwWGZEQmJ5NnNxSEc5RDVhY1hWMkVmSS9C?=
 =?utf-8?B?NGJSMERtMmxXYWJ4VS81R2VsQkNWU2ZZRUNJYVZzUTQ1ODNyNk9RenRZOTFW?=
 =?utf-8?B?WGorN3ptK3hIT3hVdHRkK1VtRENzb3BOcS9ldys1VE5vTHVOZTkzcGtqVVZZ?=
 =?utf-8?B?OUcxMFRoWk9WdHVUb1ZoVlZvZEp6Sm4xK0FWWE0yek91OXkvWDlGMTZYaG9p?=
 =?utf-8?B?OWxLc1VzY2g2VDVNWmNEd2NwZDBrd2NubUw3TUlsSjR5VjhxYzB4M2FKOEFm?=
 =?utf-8?B?bUNwaEw5RFRQdTJZeDI3blJYUmhQeXJnSHBrVzhlYlVIMG53SkVLc3hEdUpy?=
 =?utf-8?Q?SOV1GulNmbP8LHI+7OM6WSQbtW6etc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MEVXVkl5N1hlY0NmTUFSWEpNdEtjS0ZVdG9JY1Vmc0FNWW5hcE9HTGxyNXZz?=
 =?utf-8?B?RmNUelRabTE4NTdUdXBBRnNFWDJzdXdkejU5ZzMxMU9nMENZZ0pNZFpDcUJz?=
 =?utf-8?B?dkV5MXlHSHk2NTdoNGRuWWJ3a1l4RmI5Zm9MbktWN1FsZEhWdG1NcTBCUWs4?=
 =?utf-8?B?UkE3bDB6OUd5ak9JM0tySWUzNTkxTjBPbUtLK2hnU1VrVTV5ZHp2UW9nNmtD?=
 =?utf-8?B?eElGMVJFdTdEa1BUS0FSTGEwN3llN0xzTUZ2WGkvc0ZoRVVDamR5ai9YQllC?=
 =?utf-8?B?UkZiWitFMHJrZllhZmwzRy9aKzE5SG5aUzN6MG5aektOODVWKzhpMXZKMWhi?=
 =?utf-8?B?Z3F6a2dabnNFajJVcUdNQ0JOMGJRZVVUU0pReFgyK0orQTJFQTdEZktlZU9v?=
 =?utf-8?B?Z1RTRnFZT0NvWE9lMTZDeE9XS2t2ek5sNC9hb1JDdk1ubC9oVnBrMzBIelho?=
 =?utf-8?B?Zlp1dFYycHBtbTNsb1AxMnF6YVlhUVQzcUt6aEtFbjhjZC9ZaU56TGoxb1Js?=
 =?utf-8?B?YWJxTGtJYmpVQXhGb21XQ3dvVERIL0RIOG9UQUFWTzZBbE8waTE3aTN2Z2JX?=
 =?utf-8?B?cDRuMTNMOFRXYS82ZlZVUjMxWGUxUFh4U1hweWQ2ZnpRNWF2U25zNVMyZkkx?=
 =?utf-8?B?NmsrRWYyT3p4cGcyeGFoaWc3VUxnL2dTMmhRdmIydEl2V0ppc243SGoxZGhS?=
 =?utf-8?B?UEg2azhwSUF3YTJKTVF1K0tVZm5tS1pLSDRna0RvLysrVnlBTUdFVmxxWTNN?=
 =?utf-8?B?Nll0NE85QjZsR0JSZy8xbWwydnlqTUYycVBXR1phRkt4cjBuQ29OTDNJbmpm?=
 =?utf-8?B?RkVBOC9iaEFtT2tyd2VBZnpKMkk4QTVjdVdFQUtqWFRxRk5sQmhjaGs1RGRL?=
 =?utf-8?B?WnEvQVNXNmtRcys3L0g1ZjF1d3B3b3VUZ3ZRY29Gd1NBMmxPM3h5c0s0RW1x?=
 =?utf-8?B?NzlHVDB4SFU3SVpibFZISHVGWVU5azl2bDJyQVQrUTJaUEZHSjEwdkNScmE5?=
 =?utf-8?B?UWhmakttWTBtMWY0MUtyUFdxWjVuN25oZ2hhYzZNVkZNaVR0dk92ZFdsVytN?=
 =?utf-8?B?ems3VmpUb3VDOFEvcmtGRHRDNjNQYW5MeHBBUG0vV0VYNFVBM0hMYTBtLzk2?=
 =?utf-8?B?R0JnRTVYM1A2clp2Rmg5N0RYbThHYkJ4VXY3ZzVsNUZIaXlXcXVxNitRelRk?=
 =?utf-8?B?eDNwazhDRlY1OVB4ZXBKTjFnaDl3N3RNR2dqS0dXRUZKWEs2djZMcUdCVm1K?=
 =?utf-8?B?Q0ZGOWNZSXhqVW5xOVdUd3B2TnJJdENLeUd3T3I1T0hWUHpPaXphQTlNY1pa?=
 =?utf-8?B?amRNT0s2TjNndEp3dW00cmtwZnlMWUEyZE1QV0tYaWxNTmhSRkNVRFNqUUJr?=
 =?utf-8?B?MVJONUNjcU81c3JRUGthaUM3MHl6emMrNzJ2VU9jaXljUENaZ1JleWlGRmlm?=
 =?utf-8?B?L3pqbXJIMUhlMkRmTUdWbHpkb0tkbURqVnMyT1JEMmMwODAzdllnZ01pL084?=
 =?utf-8?B?aFRCNkZLdzZHTk1aV29xbFVmOW5VZW9qNzlMc0s3MWhOZkJPc3d2UjF1RGox?=
 =?utf-8?B?eEovdloxQUVFTUIzU1FPRmVVdWhmZy9vWjUwdWxXd01HL3ZJWUI1cGFXYlNM?=
 =?utf-8?B?K2srU21VMkhQUGRGa3RaOWhyVldBSmUxeVBNakFwV1RNSVpvLy9sMldJVnNY?=
 =?utf-8?B?emlKMGZYY0ZPWWdHdXkvVFZpaytObVFMd2cyNjdpT1lWRTdnakZxRU1jbVgv?=
 =?utf-8?B?MDFGMURWRFZhZURjRVBoSmt5VFVoYytKSWJJdkJwZEtnN1RrZmxieGdwUnlh?=
 =?utf-8?B?VmdIVnJjT0d5SEo5cS9pdjl3YmFyVmkyRkY5Qld1VSthUElOc29YTnozcVh2?=
 =?utf-8?B?R0k1SWV6YUR4WXJIdTNXei9NSm1zRkkreTRpc1k5U1JWTEhWMkYxQkFEV2NB?=
 =?utf-8?B?bldEOUVJREhRSDdYUDlLOWZMc2JlaXlYSS9uWUprMHkybFJWSVcyY0g3ZmRS?=
 =?utf-8?B?NXhZOGxzU0JlcWFPUTFsSlhHR0NVRFE5UDBxTmZselRJK0p6b2ZMZEZ1UlNT?=
 =?utf-8?B?QWtQN0tTUFhCb3p3V3Jqd2ZVSG9JY0luWHAxZ0ptcUthU2t2OFBHejhVaUNr?=
 =?utf-8?Q?Nwqg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a0a1966-2020-4a74-b289-08ddd322c131
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2025 06:47:17.9807
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i64R5QgdWhYBt8sJIZrlkTuWN6s93QihoBlKY8slg/CH9RvVp2I2a1rIf11l2leaeWN20X8KMl3Z4UKJJnLgHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8333

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgSnVseSAxNiwgMjAy
NSAxMTozOSBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0KPiBD
YzogSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPjsgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+Ow0KPiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAdmF0ZXMudGVjaD47IE9y
emVsLCBNaWNoYWwNCj4gPE1pY2hhbC5PcnplbEBhbWQuY29tPjsgSnVsaWVuIEdyYWxsIDxqdWxp
ZW5AeGVuLm9yZz47IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IHY2IDEwLzE5XSB4ZW4vY3B1ZnJlcTogaW50cm9kdWNlIG5ldyBzdWItaHlwZXJjYWxsIHRvDQo+
IHByb3BhZ2F0ZSBDUFBDIGRhdGENCj4NCj4gT24gMTEuMDcuMjAyNSAwNTo1MCwgUGVubnkgWmhl
bmcgd3JvdGU6DQo+ID4gKyAgICAgICAgICAgICBjcHBjX2RhdGEtPmNwYy5ub21pbmFsX3BlcmYg
PiBjcHBjX2RhdGEtPmNwYy5oaWdoZXN0X3BlcmYgKQ0KPiA+ICsgICAgICAgICAgICAvKg0KPiA+
ICsgICAgICAgICAgICAgKiBSaWdodCBub3csIFhlbiBkb2Vzbid0IGFjdHVhbGx5IHVzZSBoaWdo
ZXN0X3BlcmYvbm9taW5hbF9wZXJmLw0KPiA+ICsgICAgICAgICAgICAgKiBsb3dlc3Rfbm9ubGlu
ZWFyX3BlcmYvbG93ZXN0X3BlcmYgdmFsdWVzIHJlYWQgZnJvbSBBQ1BJIF9DUEMNCj4gPiArICAg
ICAgICAgICAgICogdGFibGUuIFhlbiByZWFkcyBDUFBDIGNhcGFiaWxpdHkgTVNSIHRvIGdldCB0
aGVzZSBmb3VyIHZhbHVlcy4NCj4gPiArICAgICAgICAgICAgICogU28gd2FybmluZyBpcyBlbm91
Z2guDQo+ID4gKyAgICAgICAgICAgICAqLw0KPiA+ICsgICAgICAgICAgICBwcmludGtfb25jZShY
RU5MT0dfV0FSTklORw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAiQnJva2VuIENQUEMg
cGVyZiB2YWx1ZXM6IGxvd2VzdCgldSksIG5vbmxpbmVhcl9sb3dlc3QoJXUpLA0KPiBub21pbmFs
KCV1KSwgaGlnaGVzdCgldSlcbiIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIGNwcGNf
ZGF0YS0+Y3BjLmxvd2VzdF9wZXJmLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICBjcHBj
X2RhdGEtPmNwYy5sb3dlc3Rfbm9ubGluZWFyX3BlcmYsDQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgIGNwcGNfZGF0YS0+Y3BjLm5vbWluYWxfcGVyZiwNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgY3BwY19kYXRhLT5jcGMuaGlnaGVzdF9wZXJmKTsNCj4gPiArDQo+ID4gKyAgICAg
ICAgLyogbG93ZXN0X21oeiBhbmQgbm9taW5hbF9taHogYXJlIG9wdGlvbmFsIHZhbHVlICovDQo+
ID4gKyAgICAgICAgaWYgKCBjcHBjX2RhdGEtPmNwYy5sb3dlc3RfbWh6ID4gY3BwY19kYXRhLT5j
cGMubm9taW5hbF9taHogKQ0KPg0KPiBJZiB0aGV5J3JlIG9wdGlvbmFsLCB3aGF0IGlmIGxvd2Vz
dF9taHogaXMgcHJvdmlkZWQgYnV0IG5vbWluYWxfbWh6IGlzbid0Pw0KPiBXb3VsZG4ndCB0aGUg
d2FybmluZyBuZWVkbGVzc2x5IHRyaWdnZXIgaW4gdGhhdCBjYXNlPw0KPg0KDQpZZXMsIG9ubHkg
Ym90aCBhcmUgcHJvdmlkZWQsIHRoaXMgY2hlY2sgaXMgbWVhbmluZ2Z1bA0KKyAgICAgICAgaWYg
KCBjcHBjX2RhdGEtPmNwYy5ub21pbmFsX21oeiAmJg0KKyAgICAgICAgICAgICBjcHBjX2RhdGEt
PmNwYy5sb3dlc3RfbWh6ID4gY3BwY19kYXRhLT5jcGMubm9taW5hbF9taHogKQ0KDQo+ID4gLS0t
IGEveGVuL2luY2x1ZGUvcHVibGljL3BsYXRmb3JtLmgNCj4gPiArKysgYi94ZW4vaW5jbHVkZS9w
dWJsaWMvcGxhdGZvcm0uaA0KPiA+IEBAIC0zNjMsNiArMzYzLDcgQEAgREVGSU5FX1hFTl9HVUVT
VF9IQU5ETEUoeGVucGZfZ2V0aWRsZXRpbWVfdCk7DQo+ID4gICNkZWZpbmUgWEVOX1BNX1BYICAg
MQ0KPiA+ICAjZGVmaW5lIFhFTl9QTV9UWCAgIDINCj4gPiAgI2RlZmluZSBYRU5fUE1fUERDICAz
DQo+ID4gKyNkZWZpbmUgWEVOX1BNX0NQUEMgNA0KPiA+DQo+ID4gIC8qIFB4IHN1YiBpbmZvIHR5
cGUgKi8NCj4gPiAgI2RlZmluZSBYRU5fUFhfUENUICAgMQ0KPiA+IEBAIC0zNzAsNiArMzcxLDEw
IEBAIERFRklORV9YRU5fR1VFU1RfSEFORExFKHhlbnBmX2dldGlkbGV0aW1lX3QpOw0KPiA+ICAj
ZGVmaW5lIFhFTl9QWF9QUEMgICA0DQo+ID4gICNkZWZpbmUgWEVOX1BYX1BTRCAgIDgNCj4gPg0K
PiA+ICsvKiBDUFBDIHN1YiBpbmZvIHR5cGUgKi8NCj4gPiArI2RlZmluZSBYRU5fQ1BQQ19QU0Qg
ICAxDQo+ID4gKyNkZWZpbmUgWEVOX0NQUENfQ1BDICAgMg0KPg0KPiBBcyBwZXIgdGhpcywgLi4u
DQo+DQo+ID4gQEAgLTQ1Nyw2ICs0NjIsMjYgQEAgc3RydWN0IHhlbl9wcm9jZXNzb3JfcGVyZm9y
bWFuY2UgeyAgdHlwZWRlZg0KPiA+IHN0cnVjdCB4ZW5fcHJvY2Vzc29yX3BlcmZvcm1hbmNlIHhl
bl9wcm9jZXNzb3JfcGVyZm9ybWFuY2VfdDsNCj4gPiBERUZJTkVfWEVOX0dVRVNUX0hBTkRMRSh4
ZW5fcHJvY2Vzc29yX3BlcmZvcm1hbmNlX3QpOw0KPiA+DQo+ID4gK3N0cnVjdCB4ZW5fcHJvY2Vz
c29yX2NwcGMgew0KPiA+ICsgICAgdWludDhfdCBmbGFnczsgLyogSU46IFhFTl9DUFBDX3h4eCAq
Lw0KPg0KPiAuLi4gaXQncyBhIHR5cGUgdGhhdCdzIGxpdmluZyBoZXJlLCBub3QgYSBjb2xsZWN0
aW9uIG9mIGZsYWdzLiBBbnkgcmVhc29uIHRoZSBmaWVsZCBpc24ndA0KPiBuYW1lZCAidHlwZSI/
DQo+DQoNCkl0IGlzIGEgY29sbGVjdGlvbiBvZiBmbGFncy4gT25seSB3aGVuIGJvdGggWEVOX0NQ
UENfUFNEIGFuZCBYRU5fQ1BQQ19DUEMgYXJlIHNldCwgd2UgY291bGQgcnVuIGNwdWZyZXFfY3B1
X2luaXQoKSB0byBpbml0aWFsaXplIGNwdWZyZXEgY29yZS4NCg0KPiA+ICsgICAgdWludDhfdCBw
YWRbM107DQo+ID4gKyAgICAvKg0KPiA+ICsgICAgICogSU46IFN1YnNldCBfQ1BDIGZpZWxkcyB1
c2VmdWwgZm9yIENQUEMtY29tcGF0aWJsZSBjcHVmcmVxDQo+ID4gKyAgICAgKiBkcml2ZXIncyBp
bml0aWFsaXphdGlvbg0KPiA+ICsgICAgICovDQo+ID4gKyAgICBzdHJ1Y3Qgew0KPiA+ICsgICAg
ICAgIHVpbnQzMl90IGhpZ2hlc3RfcGVyZjsNCj4gPiArICAgICAgICB1aW50MzJfdCBub21pbmFs
X3BlcmY7DQo+ID4gKyAgICAgICAgdWludDMyX3QgbG93ZXN0X25vbmxpbmVhcl9wZXJmOw0KPiA+
ICsgICAgICAgIHVpbnQzMl90IGxvd2VzdF9wZXJmOw0KPiA+ICsgICAgICAgIHVpbnQzMl90IGxv
d2VzdF9taHo7DQo+ID4gKyAgICAgICAgdWludDMyX3Qgbm9taW5hbF9taHo7DQo+ID4gKyAgICB9
IGNwYzsNCj4NCj4gV2hhdCwgYWdhaW4sIHdhcyB0aGUgcmVhc29uIHRvIHdyYXAgdGhlc2UgaW50
byBhIHN1Yi1zdHJ1Y3Q/DQoNCkkgd2FudCB0byBtYWtlIHRoZXNlIGZpZWxkcyBkaWZmZXJlbnRp
YXRlZCBmcm9tIHRoZSBvdGhlciB0d28gKHNoYXJlZF90eXBlIGFuZCBkb21haW5faW5mbyksIGFz
IHN1Yi1zdHJ1Y3QgY3BjIGNvbnRhaW5zIF9DUEMgZmllbGQgaW5mbywgYW5kIHRoZSBvdGhlciB0
d28gY29udGFpbnMgX1BTRCBpbmZvDQoNCj4NCj4gSmFuDQo=

