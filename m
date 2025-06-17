Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C832ADBFEE
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 05:39:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017656.1394650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRN9H-0006pr-9J; Tue, 17 Jun 2025 03:38:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017656.1394650; Tue, 17 Jun 2025 03:38:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRN9H-0006oM-6D; Tue, 17 Jun 2025 03:38:11 +0000
Received: by outflank-mailman (input) for mailman id 1017656;
 Tue, 17 Jun 2025 03:38:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zxid=ZA=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uRN9E-0006oG-PL
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 03:38:08 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20604.outbound.protection.outlook.com
 [2a01:111:f403:2009::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a6d412c-4b2c-11f0-a309-13f23c93f187;
 Tue, 17 Jun 2025 05:38:06 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 DM4PR12MB7717.namprd12.prod.outlook.com (2603:10b6:8:103::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.25; Tue, 17 Jun 2025 03:38:00 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%5]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 03:37:59 +0000
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
X-Inumbo-ID: 7a6d412c-4b2c-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hR+oWidaK1bzdmlL4LDkbvE57h6nlyvuJFGEZ/UGlrMvL6gzV/StOEcAjT/Yaa0V8I3oe0VHBgVZPyO75iJdT+H/rJlo3y82jI2RhrC+7uapyRz1RHr/JZec5AF0pjOXGDkBs/9JfvCyP3K++iE4wZ1CT9dFxaLH7LV6J1iKLXOJg8HSC65BxqiS1tWSP+WiGlcaVEWEaEf77HdlrUcbvD+vTIo+e5P4CtXJzA82m+zC9Xbkw4pC8Z/qTZjfyFweYgXPCKUp+SEVFvwzULr6+S9rx2C+mc3EU0mnc+W3LCYr05XpNAtUZVhhYTLFsmUw/mv9IcbnU1TPUtt7Bo/xlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfvLFk/btPx6m9wR5ht99Ql3XsUA6L4ajjpm7UMn3z8=;
 b=pUyxhK2SrG7MaU52lBVtpA7DDRkhLAMOfPoOG0URrhvBNxdx0MWpi6lLNiZTMysTIvqy74Bn4TrUdlQ3wrBqXceVDXN5BmGQf0YWTT4e5I9oPurymUfTRM4X+SA3dzx2NCDFC5nY1dXY7j72LcBxfYlKqx3XVedzKI6llx/gRoo0Cuh830wfugzeST9901XSfgdSuebDgVBMZ8DJv+ETEnQqQNxzu7Dmpnn87D/LpdjJEIEmoyEoViQ0b4A4gAOQh9C4k8HzYXuayp5n30iBjooGPmbQRFmJouxMXwzZ/RAwZxwquACfea1gnjcmNlc/+Z8E2kY/4e4BRoZpb0aqfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfvLFk/btPx6m9wR5ht99Ql3XsUA6L4ajjpm7UMn3z8=;
 b=sfDuC+yXs2KrfyfavVvNz9dPUHKvh8MTU14uoHSPj1F/QhQQiej8YoOhAiILodM5eIfFswx4ckxO8NJjm/GE4eQWOkc0VF9sVb1VM0imMr7c70S2WcqpMje3OeLNpcYYKy5VyYfy0xuuRUZ+uE2qRAsDgWuC5kcV7+ju1xnnbNs=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v5 01/18] xen/pmstat: guard perf.states[] access with
 XEN_PX_INIT
Thread-Topic: [PATCH v5 01/18] xen/pmstat: guard perf.states[] access with
 XEN_PX_INIT
Thread-Index: AQHbzuQ5KDq5M5MbdEiyL/UuBwqBb7P+KsSAgALCz6CABLMkgIABL2Ig
Date: Tue, 17 Jun 2025 03:37:59 +0000
Message-ID:
 <DM4PR12MB845147B611C3F6B88C3390D4E173A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-2-Penny.Zheng@amd.com>
 <0d60d42f-d844-41b5-a8ca-bdfe7883d15b@suse.com>
 <DM4PR12MB845179B8BDD9399B0DDB7260E170A@DM4PR12MB8451.namprd12.prod.outlook.com>
 <d156a26c-67a9-4915-a5a2-bf49a4c3e8b5@suse.com>
In-Reply-To: <d156a26c-67a9-4915-a5a2-bf49a4c3e8b5@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-06-17T03:37:51.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|DM4PR12MB7717:EE_
x-ms-office365-filtering-correlation-id: fd0ffee5-8f9c-46c4-24f9-08ddad505aec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VWlyYWhyM3BXTmFZWlBvN2YyT2RZT0F1S3Vodm1COUNpOEJVRnM5OHkxY3dh?=
 =?utf-8?B?WFp3aG9tWGpVVHVjV2FlL1NXZHpZR3FsMXR6bGVFb254WjFxeGhydUZtdzJP?=
 =?utf-8?B?NmFkQkwzRE0xME9pQmtSdXBpK1dNSmhiQVRYK2ltWTF3cmFEMVV4bkVvaEls?=
 =?utf-8?B?WnN4amx6RkxVOTVzSG1ROVNJVVFiZjlUSnJkQXd5YUN0R2t5UTFFbUg3UjBM?=
 =?utf-8?B?clozUXd1dHdGczhhbWs4UElHUmlmaE5wbDRmQ2dZMWhPOFJidGE0eGNpQVVz?=
 =?utf-8?B?bENMeVg4aDRMUUtITkYyb2YwMUtwcC9uMjhUQ0V6T3VtMzgrT2FROSt4eHEr?=
 =?utf-8?B?NjljN01KN29RNHJGM3hMb28zcUtzb3FxdnhyNUFzdW5DM2Z3NEM3SDJEdlBa?=
 =?utf-8?B?a1Z2U05Zc2FlZWt0YWxoVzdQZjVFRWdpT1ZNQnp3ZFRrbjBjOWpnbkFRWXVm?=
 =?utf-8?B?TmVJQ0hPbnhNd25QK25TOEpZWTBJaGxhVlI5c1RhSTAxaWNSNFNudjdDTTZI?=
 =?utf-8?B?N3BWSFZhL0NmNkc1elBEMjZDVE84SFZZN2dHVjI3Z2xFd2w4cUtPSmMyQ2lh?=
 =?utf-8?B?cnVBUmNQTzFYREtjWjM1QkIzT0Q0TnV1Q0tLb2RrQTVSZGZLckkxbEtiZWVY?=
 =?utf-8?B?T0d5RTV5K0I2QmltWjk2cS9GK2pLZnRVYWpwOTFnUUtKT2tJNEFSd2hDdll4?=
 =?utf-8?B?YUVGWndMQy9ObTR5T05jUkJLL3RSN3FNS0cwbktMV0NtcnVKZ3VFT0Vvak50?=
 =?utf-8?B?ZlZsUkdxbUlyeFRyejZjSndSMW5VajZ1ZzZOUnRhSkxJUHVubVhlVU8xL2lY?=
 =?utf-8?B?TE5iMU1SS0JrbFpMVm5ocGZBdUNiZ3gwdWVKa3pMSzVkMi9MVTBMZmFkQkMy?=
 =?utf-8?B?TDBQRER5R1BOeHFCSE1CdGlIcUZMQ0d6aG4zMTNkTzA2SWgvQUNPajEzSFBN?=
 =?utf-8?B?cHVxWjBXMVY3cE5ibURJbFVkQzBQbGRYOExLa0ROeEZyajJ2eExDVWVYcjF4?=
 =?utf-8?B?bWtxQlR4bElVOTZla2ZaeTkwL3l1OU8zNVNkQlFhMndBWk1OaVkxelZDWHg1?=
 =?utf-8?B?eVNSdXV0dGw5VXhmWWhsM2R4ek9TRGdjMXU4MElyb1Y5Q2d0cWJFMERBeGJo?=
 =?utf-8?B?UjMrcXowQ2xDS2FJYVhkVHRrT0VYbnY0b3NKUFFMR01obEpXN2tsUWhUWlRV?=
 =?utf-8?B?dFhSNThpTytVdGxRYThlV3NhaXFMMGVDMUZGdUFuZEt4RUx1TVFnK2JtdTRn?=
 =?utf-8?B?SXIraTU5Q2I0SlIxU29DVFJmOFJ0Q1EvcHdZRzZNVEZRMFRmQmR4QVVrZURy?=
 =?utf-8?B?cmgxZGJHbFZpbmNyWm1mZUR1eXN6aVNpckdkVnNXZHh4WndHUGRDS3JBZ3Rk?=
 =?utf-8?B?VDd1UVoycUZaSTd3a0I1QzQybDF1RnZJVmYzUmpGVnliV1djWjJEbWtWUFNs?=
 =?utf-8?B?TFp1OEt3eWhuNVRxUUVGWFcyTDBQOFJNalZTZzZ3SW5ta2ttTjgvVnVHd1h2?=
 =?utf-8?B?QUh4SkRIVFFXTC9CL1poRHhzMy84YVNoMEpXYlFLT01wQWNqTnBidDFQTlds?=
 =?utf-8?B?MVlmUS8rclJoTU03QlBIcTlEUDFSWE43U0w0MVdWTG83bWF6Y2picDEyR29I?=
 =?utf-8?B?SmtIdC9seHFTNEoreVJ5NXdEUEdQeE9mMXl2dDBrUFRhQm5yQlNyN2dBWmty?=
 =?utf-8?B?UUcxYzZmaGdCeGl0N2NiTFJjcURreERic2Uyd1k0NGRvZ2FmWlJ5ZHZDL2gx?=
 =?utf-8?B?eW9vaDhLQ2V1SnNlZXY5QUtTWWF1K1hBV1c0aWhiUk15MytTeWxrcEVTQ21Y?=
 =?utf-8?B?b20yT1NreDArMzVPOThkNTE0b2tYQjlycS9tMjVlamJvdG9lUVREYXBocFln?=
 =?utf-8?B?ZkttUUI4N3J4NEprL3hNV1Jxd1VBSStvZjdVY2wyYWwwQU9QZG5oSldYalF3?=
 =?utf-8?B?VnV4MkNLYmVHSjFsT0dyZ3RzU1lxemRCV2FCRGk5ZFlGSE8vVkxuQVlnTHo0?=
 =?utf-8?Q?8HcxvvgLFlN3Tsn5Dk1719GzFaneuU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UlBGa1VJYW05L2gvczkzZU5zRm84Z2dqdDFwNEhZcGtJTmVKNytXVEpRaUhX?=
 =?utf-8?B?Um8rMnlEMnhtQ3JUTTdvV0RtcUlwVU5Sc0VPNm84MXVLYTBSN0hsTHJNTml3?=
 =?utf-8?B?aXlQdlJnY2pIUjBCajRtZXVRYkJ3Sm13ajFva2xnYzFiSUsxSVFGNXpkTHpz?=
 =?utf-8?B?dGlFSHJaYlg1OS9LQUdOK2IyNHJqVzRCZ2VoNStvNVpLRThQc1hVZmlwOHdn?=
 =?utf-8?B?bGZ2TGVJUzRJRDhRYkJHekdiWWt2SXhLNDY2b0xMb1YzNGFveEFTMEJmUVJj?=
 =?utf-8?B?bExIR1FGZ0dDSzNxSHhrTFFOcW81TnBISFRremNVU3NuM05paks2OUxQVG5P?=
 =?utf-8?B?ZVluVEJsanpzYU8wYmlIdjZ4b002N1dVNVJ0Vk10aXh2QmwzeXZvbTA2b25N?=
 =?utf-8?B?SjIvRGwray9Za3cybVZZazdyU1NVdk9LNVJORGJUZUlBUVFSWXVETnJ4M21w?=
 =?utf-8?B?OVBIUm5YUzJFVmdpWlRISnZUZzdUSlh0amVyMFRJY1Y1V1Z3SVdxRmMzQm5E?=
 =?utf-8?B?aGhRMW9LZlZFWndtWXg1MC9naTUrSlNscnppTTU1K1c2UVV2aDFHWDd3RDJB?=
 =?utf-8?B?dElVcVJ4MUlsa2l2VkRBai83TDV1YUhpYi9ObHNEM1RkMUlaREpORklJR0pM?=
 =?utf-8?B?RGZVTml5d2JibDM5cG45aHI0L1gyZ1RuWW55VGY3dEhHNFM2bzk0ZU1QaEp0?=
 =?utf-8?B?ZGJ5NE5Td1ZGMVVha0R4MFFlOWlDVVI2K2ZoVVFGbml1NjQ0Z3lHc1dWaUR3?=
 =?utf-8?B?UmpEUThxRnlwSVIxK3FZTHJtdGw2MW1WYWErcWV6aGFjTjhTZWRxNkJFN2Vw?=
 =?utf-8?B?ajVUL1ByTHNmWTU3bHRJbTg3WGJIa25rektRK3p5djRjY0FLQ0cyYzRxdCtG?=
 =?utf-8?B?WTBrZ29sVm1vUlZoVXBwOUQwNDMvcW1hK1lOWk84NDhyTDhuUXpPQ2xSMmtY?=
 =?utf-8?B?b1QxbGFCMWRmNDlGYm0zUDN5K2JXMk9PUzRTS2ZIeXRMWldmTERaN2k3QUh2?=
 =?utf-8?B?aG1zWW41MlNOcjV2OCtUcVNOSzhOZjhiaWYzUGd3K3JPWlY3d2VEa2pPU0sv?=
 =?utf-8?B?cFlPWmdmd3E2UCsxZVlDTzlpWWcwUm92TkxQYnFTblZySGMveWh3N2hiZjl3?=
 =?utf-8?B?UVE4MmRHYkNDNzE2RUVmZmtoV3E4eHdBVWtDOVFDL0xDY2R2VXlXZ3pZK3lC?=
 =?utf-8?B?V3k3blM5dVZ2R1NYTkp3NzFOdDk4RzNNNC91SEs2Y2c0ZUFCTm1mSkNzUlBM?=
 =?utf-8?B?SGxxM2tLZDNpN1RiWURzbEF5bitjK1BkUDRzcjJLUDBlbUNUMkpETjh3aERG?=
 =?utf-8?B?L0crV25YUk50cDdoN3NVbWdPWUxtN3c3Tm1TdGxWckUzRDFZblhVNmVENEpv?=
 =?utf-8?B?VG8vdytZVHVaMmtSck4va2o5NjlkUUJqcEduYzgzT0R6RnVBbkE5anRjSTR0?=
 =?utf-8?B?ZE5kYkkrU0ZjdjdrNTZuVllWZFlhejd4VlNEUnZKZTQyeUVwWks2ZGZwbEdk?=
 =?utf-8?B?Y0dibVhlYXIwNzc5K0Q0dW01NWZGdXdZQ3hqb3RHVkg4NmpaZ3IxV0FCQ0Rx?=
 =?utf-8?B?OHBTWnkwWlRvWjkyazZRblYwM2c0UDFrUDVPQkkvd2txMW9ZWGhKTTBOUTF2?=
 =?utf-8?B?Sk80c3EzTVA2cVFrUjZ5MG1HQWgzSkV3bzZYU0RaSExFdUtlTXhzZ24yelNX?=
 =?utf-8?B?bElRRVBlYnE3enFRdGZBelB1UXZMbTROQzlyOUVlNmo2TXVmemhHcUtwRExM?=
 =?utf-8?B?Mi9uSUIvaTdBUituOGhMYkpWTC9LWWRBWEVjRitiaG9iTU9SQUk3Um9PMUpS?=
 =?utf-8?B?amt0aktmSEFubzR3TTBwMlJMcFVaWnJHbkUySCtKeWd0dWNLU2FwZytZSDBh?=
 =?utf-8?B?bk9qNElOallCTWExNGZJNDJuQ3h3SGFJNmRtZTNOZklUdUtySXp4QXRia0JP?=
 =?utf-8?B?WEZCQlNoaUcxc1Y2MDBZbjBXakYrdWMyeXROcCtSbEZGRDdpRVJDQ2dpdFhj?=
 =?utf-8?B?WWxjTklMTmFPOGtKTFcwRmpBMVh0Q1dQVEkrTDMybGpzSENiOHQwbzVTcE9L?=
 =?utf-8?B?a1hQQzlIQTc0TEFReEVtTXBtWDcwUmtLZTdnNnVqYmRNMzk4NXExL2g1NDFL?=
 =?utf-8?Q?Bako=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd0ffee5-8f9c-46c4-24f9-08ddad505aec
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2025 03:37:59.0652
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4xnmWk+v5oV0UD+yt/uAG7EpYEXwnxHjXnl1joPmb3R2R1+sOy/jS5+FHH2INadY8Vs9dES8xFTWYzzJIdFo3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7717

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwgSnVuZSAxNiwgMjAyNSA1
OjE2IFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+DQo+IENjOiBI
dWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IDAxLzE4XSB4ZW4vcG1zdGF0OiBndWFyZCBw
ZXJmLnN0YXRlc1tdIGFjY2VzcyB3aXRoDQo+IFhFTl9QWF9JTklUDQo+DQo+IE9uIDE2LjA2LjIw
MjUgMTE6MDUsIFBlbm55LCBaaGVuZyB3cm90ZToNCj4gPiBbUHVibGljXQ0KPiA+DQo+ID4+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4NCj4gPj4gU2VudDogV2VkbmVzZGF5LCBKdW5lIDExLCAyMDI1IDExOjIwIFBN
DQo+ID4+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+DQo+ID4+IENjOiBI
dWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZw0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IDAxLzE4XSB4ZW4vcG1zdGF0OiBndWFy
ZCBwZXJmLnN0YXRlc1tdIGFjY2Vzcw0KPiA+PiB3aXRoIFhFTl9QWF9JTklUDQo+ID4+DQo+ID4+
IE9uIDI3LjA1LjIwMjUgMTA6NDgsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+Pj4gQWNjZXNzaW5n
IHRvIHBlcmYuc3RhdGVzW10gYXJyYXkgc2hhbGwgbm90IGJlIG9ubHkgZ3VhcmRlZCB3aXRoDQo+
ID4+PiB1c2VyLWRlZmluZWQgaHlwZXJjYWxsIGlucHV0LCBzbyB3ZSBhZGQgWEVOX1BYX0lOSVQg
Y2hlY2sgdG8gZ2FpbiBzYWZldHkuDQo+ID4+DQo+ID4+IFdoYXQgaXMgImd1YXJkZWQgd2l0aCB1
c2VyLWRlZmluZWQgaHlwZXJjYWxsIGlucHV0Ij8gQW5kIHdoYXQgc2FmZXR5DQo+ID4+IGFyZSB3
ZSBsYWNraW5nPw0KPiA+Pg0KPiA+Pj4gLS0tIGEveGVuL2RyaXZlcnMvYWNwaS9wbXN0YXQuYw0K
PiA+Pj4gKysrIGIveGVuL2RyaXZlcnMvYWNwaS9wbXN0YXQuYw0KPiA+Pj4gQEAgLTIyOCwxMCAr
MjI4LDEzIEBAIHN0YXRpYyBpbnQgZ2V0X2NwdWZyZXFfcGFyYShzdHJ1Y3QNCj4gPj4+IHhlbl9z
eXNjdGxfcG1fb3ANCj4gPj4gKm9wKQ0KPiA+Pj4gICAgICByZXQgPSBjb3B5X3RvX2d1ZXN0KG9w
LT51LmdldF9wYXJhLmFmZmVjdGVkX2NwdXMsDQo+ID4+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgZGF0YSwgb3AtPnUuZ2V0X3BhcmEuY3B1X251bSk7DQo+ID4+Pg0KPiA+Pj4gLSAgICBmb3Ig
KCBpID0gMDsgaSA8IG9wLT51LmdldF9wYXJhLmZyZXFfbnVtOyBpKysgKQ0KPiA+Pj4gLSAgICAg
ICAgZGF0YVtpXSA9IHBtcHQtPnBlcmYuc3RhdGVzW2ldLmNvcmVfZnJlcXVlbmN5ICogMTAwMDsN
Cj4gPj4+IC0gICAgcmV0ICs9IGNvcHlfdG9fZ3Vlc3Qob3AtPnUuZ2V0X3BhcmEuc2NhbGluZ19h
dmFpbGFibGVfZnJlcXVlbmNpZXMsDQo+ID4+PiAtICAgICAgICAgICAgICAgICAgICAgICAgIGRh
dGEsIG9wLT51LmdldF9wYXJhLmZyZXFfbnVtKTsNCj4gPj4+ICsgICAgaWYgKCBwbXB0LT5wZXJm
LmluaXQgJiBYRU5fUFhfSU5JVCApDQo+ID4+PiArICAgIHsNCj4gPj4+ICsgICAgICAgIGZvciAo
IGkgPSAwOyBpIDwgb3AtPnUuZ2V0X3BhcmEuZnJlcV9udW07IGkrKyApDQo+ID4+PiArICAgICAg
ICAgICAgZGF0YVtpXSA9IHBtcHQtPnBlcmYuc3RhdGVzW2ldLmNvcmVfZnJlcXVlbmN5ICogMTAw
MDsNCj4gPj4+ICsgICAgICAgIHJldCArPSBjb3B5X3RvX2d1ZXN0KG9wLT51LmdldF9wYXJhLnNj
YWxpbmdfYXZhaWxhYmxlX2ZyZXF1ZW5jaWVzLA0KPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgZGF0YSwgb3AtPnUuZ2V0X3BhcmEuZnJlcV9udW0pOw0KPiA+Pj4gKyAgICB9DQo+
ID4+DQo+ID4+IEdvaW5nIGZyb20ganVzdCB0aGUgY29kZSBjaGFuZ2U6IFlvdSB3YW50IHRvIGF2
b2lkIGNvcHlpbmcgb3V0DQo+ID4+IGZyZXF1ZW5jeSB2YWx1ZXMgd2hlbiBub25lIGhhdmUgYmVl
biByZXBvcnRlZD8gQnV0IHdoZW4gbm9uZSBoYXZlDQo+ID4+IGJlZW4gcmVwb3J0ZWQsIGlzbid0
IHBtcHQtDQo+ID4+PiBwZXJmLnN0YXRlX2NvdW50IChhZ2FpbnN0IHdoaWNoIG9wLT51LmdldF9w
YXJhLmZyZXFfbnVtIHdhcw0KPiA+PiB2YWxpZGF0ZWQpIHNpbXBseSBnb2luZyB0byBiZSAwPyBJ
ZiBub3QsIGhvdyB3b3VsZCBjYWxsZXJzIGtub3cgdGhhdA0KPiA+PiBubyBkYXRhIHdhcyBoYW5k
ZWQgYmFjayB0byB0aGVtPw0KPiA+DQo+ID4gSSBtYXkgbWlzdW5kZXJzdGFuZCB3aGF0IHlvdSd2
ZSBjb21tZW50ZWQgb24gdjQgcGF0Y2ggInRvb2xzL3hlbnBtOg0KPiA+IFByaW50IENQUEMgcGFy
YW1ldGVycyBmb3IgYW1kLWNwcGMgZHJpdmVyIiwgcXVvdGluZyB0aGUgZGlzY3Vzc2lvbiB0aGVy
ZSwgIg0KPiA+IFRoaXMgbG9va3MgcXVlc3Rpb25hYmxlIGFsbCBvbiBpdHMgb3duLiBXaGVyZSBp
cyBpdCB0aGF0IC0+cGVyZi5zdGF0ZXMNCj4gPiBhbGxvY2F0aW9uIGlzIGJlaW5nIGF2b2lkZWQ/
IEkgZmlyc3QgdGhvdWdodCBpdCBtaWdodCBiZSBwYXRjaCAwNg0KPiA+IHdoaWNoIGlzIHJlbGF0
ZWQsIGJ1dCB0aGF0IGRvZXNuJ3QgbG9vayB0byBiZSBpdC4gSW4gYW55IGV2ZW50IGZ1cnRoZXIN
Cj4gPiBkb3duIGZyb20gaGVyZSB0aGVyZSBpcw0KPiA+DQo+ID4gICAgIGZvciAoIGkgPSAwOyBp
IDwgb3AtPnUuZ2V0X3BhcmEuZnJlcV9udW07IGkrKyApDQo+ID4gICAgICAgICBkYXRhW2ldID0g
cG1wdC0+cGVyZi5zdGF0ZXNbaV0uY29yZV9mcmVxdWVuY3kgKiAxMDAwOw0KPiA+DQo+ID4gaS5l
LiBhbiBhY2Nlc3MgdG8gdGhlIGFycmF5IHNvbGVseSBiYXNlZCBvbiBoeXBlcmNhbGwgaW5wdXQu
DQo+ID4gIg0KPiA+IEkgdGhvdWdodCB3ZSB3ZXJlIGluZGljYXRpbmcgYSBzY2VuYXJpbywgdXNl
ciBhY2NpZGVudGFsbHkgd3JpdGVzIHRoZQ0KPiA+ICJvcC0+dS5nZXRfcGFyYS5mcmVxX251bSAi
LCBhbmQgaXQgbGVhZHMgdG8gYWNjZXNzaW5nIG91dC1vZi1yYW5nZQ0KPiA+IGFycmF5IHNsb3Qg
aW4gQ1BQQyBtb2RlLiBUaGF0J3MgdGhlIHJlYXNvbiB3aHkgSSBhZGRlZCB0aGlzIGd1YXJkDQo+
DQo+IFdlbGwsIGl0J3Mgbm90IGFuIG91dC1vZi1yYW5nZSBhY2Nlc3MsIGJ1dCBhIE5VTEwgZGVy
ZWYsIGJ1dCB5ZXMsIHRoZSBjb25jZXJuIHZvaWNlZA0KPiB0aGVyZSBpcyByZWxhdGVkLiBCdXQg
dGhhdCBjYW4ndCBiZSBkb25lIGluIGFuIGlzb2xhdGVkIHBhdGNoLCBpdCBtYWtlcyBzZW5zZSBv
bmx5DQo+IHRvZ2V0aGVyIHdpdGggdGhlIGNoYW5nZSB0byB0aGUgaWYoKSB0aGF0IEkgZGlkIGNv
bW1lbnQgb24uIEFuZCBldmVuIHRoZW4gaWYgaXQgaXMNCj4gZ3VhcmFudGVlZCB0aGF0IHBlcmYu
c3RhdGVfY291bnQgaXMgYWx3YXlzIDAgd2hlbiBwZXJmLnN0YXRlcyBpcyBOVUxMLCB3ZSdkIGJl
IGZpbmUNCj4gd2l0aG91dCBhbnkgY2hhbmdlLiBZZXQgdGhpcyBsYXR0ZXIgYXNwZWN0IGdvZXMg
YmFjayB0byB0aGUgcXVlc3Rpb24gSSBoYWQgcmFpc2VkDQo+IHRoZXJlOiAiV2hlcmUgaXMgaXQg
dGhhdCAtPnBlcmYuc3RhdGVzIGFsbG9jYXRpb24gaXMgYmVpbmcgYXZvaWRlZD8iDQo+DQoNCi0+
cGVyZi5zdGF0ZXMgaXMgYWxsb2NhdGVkIGluIHNldF9weF9wbWluZm8oKSwgd2hpY2ggaXMgYSBw
eC1zcGVjaWZpYyBmdW5jdGlvbi4NCkluIHRoZSBjYWxsZXIgb2Ygc2V0X3B4X3BtaW5mbygpLCB3
ZSBoYXZlIGFzc2VydGlvbiAiQVNTRVJUKCEoeGVuX3Byb2Nlc3Nvcl9wbWJpdHMgJiBYRU5fUFJP
Q0VTU09SX1BNX0NQUEMpKTsiDQp0byBlbnN1cmUgaXQgd2lsbCBub3QgYmUgaW52b2tlZCBpbiBD
UFBDIG1vZGUuDQoNCkFuc3dlcmluZyIgQW5kIGV2ZW4gdGhlbiBpZiBpdCBpcyAgZ3VhcmFudGVl
ZCB0aGF0IHBlcmYuc3RhdGVfY291bnQgaXMgYWx3YXlzIDAgd2hlbiBwZXJmLnN0YXRlcyBpcyBO
VUxMIiwgbWF5YmUgd2Ugc2hhbGwgYWRkIGFub3RoZXIgY2hlY2sNCmluIHRoZSB2ZXJ5IGJlZ2lu
bmluZyBvZiBnZXRfY3B1ZnJlcV9wYXJhKCk6DQpgYGANCmlmICggIXBtcHQgfHwgKChwbXB0LT5p
bml0ICYgWEVOX1BYX0lOSVQpICYmICFwbXB0LT5wZXJmLnN0YXRlcykgfHwgKChwbXB0LT5pbml0
ICYgWEVOX0NQUENfSU5JVCkgJiYgcG1wdC0+cGVyZi5zdGF0ZV9jb3VudCkpDQpgYGANCldlIGFy
ZSBlbnN1cmluZyBpbiBDUFBDIG1vZGUsIC0+cGVyZi5zdGF0ZV9jb3VudCBtdXN0IGJlIHplcm8s
IHRoZW4gb3AtPnUuZ2V0X3BhcmEuZnJlcV9udW0gaXMgdmFsaWRhdGVkIGFnYWluc3QgaXQsIHdl
IHdpbGwNCm5ldmVyIGVudGVyIGludG8gdGhlIGxvb3AuLi4NCg0KQW5kIGlmIHdlJ3JlIG9rYXkg
d2l0aCBhYm92ZSBjaGFuZ2UsIHJpZ2h0LCBpdCBzaGFsbCBub3QgYmUgZG9uZSBpbiBhbiBpc29s
YXRlZCBwYXRjaCwgYW5kIGl0IHNoYWxsIGJlIGFkZGVkIG9ubHkgdG9nZXRoZXIgd2l0aCB0aGUg
Y2hhbmdlIHRvIHRoZSBpZigpDQoNCj4gPiBCdWl0IGFzIHlvdSBzYWlkIGF0IHRoZSB2ZXJ5IGJl
Z2lubmluZywgIG9wLT51LmdldF9wYXJhLmZyZXFfbnVtIGlzIHZhbGlkYXRlZA0KPiBhZ2FpbnN0
IHBtcHQtPnBlcmYuc3RhdGVfY291bnQsIHNvIGlnIHRoZSBhYm92ZSBzY2VuYXJpbyB3aWxsIG5v
dCBoYXBwZW4sIEknbGwgZGVsZXRlDQo+IHRoaXMgY29tbWl0Lg0KPg0KPiBOb3Qgc3VyZSB5ZXQg
d2hldGhlciBkZWxldGluZyBpcyB0aGUgcmlnaHQgY291cnNlIG9mIGFjdGlvbi4NCj4NCj4gSmFu
DQo=

