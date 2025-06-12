Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65707AD6866
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 09:00:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012387.1390820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPbvU-0005UJ-NK; Thu, 12 Jun 2025 07:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012387.1390820; Thu, 12 Jun 2025 07:00:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPbvU-0005RI-K1; Thu, 12 Jun 2025 07:00:40 +0000
Received: by outflank-mailman (input) for mailman id 1012387;
 Thu, 12 Jun 2025 07:00:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9p7z=Y3=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uPbvS-0005RB-Kt
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 07:00:38 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2413::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb8299e9-475a-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 09:00:28 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 CH3PR12MB7739.namprd12.prod.outlook.com (2603:10b6:610:151::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.35; Thu, 12 Jun
 2025 07:00:23 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%5]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 07:00:23 +0000
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
X-Inumbo-ID: eb8299e9-475a-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=biNiFToTtcvyDEzV6Df1kh+bgcYXxa58KeyDpSTamUefLFuuld/FHGJJZNOmX7uLjrgYPBzhV9eYe1WR9DRjXff86u56AU3kWBaoNx4Qq113VSFC9ZUprsB2jKAhP2HcKQ3Q+RdbGMxfYHUA43QjE6aXYZ7iYFY9kQ6c1amQ9IenrY3IIgfVQwiFx2vBGWeOSW7EbfZYWXw/CaMRPxIsCm/Fx7XpXhfLUQ2+WVsu1wwlkh8OJGL0ot+l4UcH2Jg4TXQIaV2CY6Jg9LKdsVXnbuglpZEQV8f2YYlW7s5bbQBHlw9oa+wveANrxiLD6mNgea1sIOPuVntvaOVDwBLllA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MwJfmSiizxG16M3p9NxbNFxkoWlYAftQWJ274DMNj0Q=;
 b=P3K+32b2xO1+1U2bcc4UubstgQXvnlST2mCgLrBGBzjQ59oZFOGdbmeyHTfh5by/1mG2JUaQvo9osD+E7PjKJLnRR3wCX3y7jwrKeK0qBZtLHT3Hunn53B+GPVQYJzcJnWp8SgYygjJe9O9LPXAwIraAuOa2+k1C7xBdrHagbZeBnr3Y9mmL4MthamxufDTmvmSnGhAi5XcJfeawZxm/HD7Yic/aiCjF9mlGCdM0YH8/QlgZi2V/JjZBKbQ0nX+V4saTMkLgr3juqDe/L8t73fgZ/wGSvVbzhCDt5jFM/rD41Ibqbiss5jfeXR3Dzf6+OdfKf8Hz+FRRSBrwZPPTmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MwJfmSiizxG16M3p9NxbNFxkoWlYAftQWJ274DMNj0Q=;
 b=0In32TfFzqfxLuWpxG0+izM3XzvS5tlnInUbtoyF4fdZsb+Vax+CSxxgFSYVz7f5zwxHYXnGkIvmYGyaf+sB1rgrlkrl6VfMd5sveEhT5PBlXJB3k+WXkayulwICWHtxOAxtLZNavDxeGAVhZ0EtDO7Xdzn5Fni0h+XXVtWygfQ=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Orzel,
 Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 11/20] xen/pmstat: introduce CONFIG_PM_OP
Thread-Topic: [PATCH v4 11/20] xen/pmstat: introduce CONFIG_PM_OP
Thread-Index: AQHbz7FxOQ3KP08ui0ayy8qSOpLdm7P8ezaAgAKyKdA=
Date: Thu, 12 Jun 2025 07:00:23 +0000
Message-ID:
 <DM4PR12MB8451B7E75E5D8F978B943997E174A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250528091708.390767-1-Penny.Zheng@amd.com>
 <20250528091708.390767-12-Penny.Zheng@amd.com>
 <1a660f83-5d9a-402b-af28-ea82311b37ce@suse.com>
In-Reply-To: <1a660f83-5d9a-402b-af28-ea82311b37ce@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-06-12T07:00:07.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|CH3PR12MB7739:EE_
x-ms-office365-filtering-correlation-id: 434091b9-46cf-431d-b539-08dda97ecd98
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WEpVUWorTlI2SURaNDc5ZXh5c3R2R3ZaZ3V1TEpiN095TUVUajVVendiUmZK?=
 =?utf-8?B?Nkg4OXdwbUdndDZYUUNlRGFHaGxxVXFzQkhZVEtMSnVPUnJoUXQ4bmxXWWxj?=
 =?utf-8?B?NGs4QkR5NjVtOU9UdC9tWEZFamFiTUFsclgyZTNxVmdJTzZhMmZhbVNaNGVW?=
 =?utf-8?B?aW8vaHpZaVpWMDQ1UEp5aWp2bHRQd2dZRG1MWWpNWlhqTjhlVFEzb2d5Ujlz?=
 =?utf-8?B?VEJlMzB5anZhcGhCZHhia25BbERwQ1FBVThkaDhtZmtqbHhRL25hazAwT0RN?=
 =?utf-8?B?cGpocW1zRDN1UVdMenI3WUNmTUR6V3JtYzRsKzRuVnlpdEtvOC9CLzF1cnpE?=
 =?utf-8?B?SjMxQzA4eWd2b3VhbHZIT1FGbVR5bG05bFhnOXUyQnZ1VDNSRmlrdm1QWFRl?=
 =?utf-8?B?NnBBVkM3V2FyMFNVdFYwS05Iejh3Yzg1b05uM1Rqb3BlWEZLQkV5YzhTYWh6?=
 =?utf-8?B?ai9EMXRUbldwT0F5Umx4em9pcVdsRmdveDgwWkZwNkI2MXJiRDJqd3N3dUtK?=
 =?utf-8?B?bHhIcHdGN2xneURkdXVudloyd3VSRER1TTFEUnVmZzBxNVZNSTV5dFhvYUFT?=
 =?utf-8?B?b3VkRTg1a29jOU9Hd2FROE9ITnJjUVBZbENmZGRUd0dieGtTWGlpNFRrUjBI?=
 =?utf-8?B?SkJ6VExqRnVrc0kzejRXMEVNL05GLy8xejhJYVZ2UEptUHhyU1hCQVlLRVdo?=
 =?utf-8?B?VFREU1o1SzRrdTFyTTFDbjRPYlRHakpydVJ0VFlWRDgvcTUrdjdvUnZYT042?=
 =?utf-8?B?VlhpM29KSnQwbVpJRHNWemRSMFFzTFhnWjJpc25iYzVTNEVYQm9TdTZpR0M3?=
 =?utf-8?B?cDU5b3pWL1NseDU5clVVeHRrYzZUL0luQjZHZS9oNEdHS2tKYmJlVStjemt6?=
 =?utf-8?B?VTlqOEgxdHkzZGwwQnM1eHVkSEROSXFRUUhVa2l4N2NTY0tIQzR5UXVXSnZr?=
 =?utf-8?B?UUxReVpienFkZlpYK3dOSWZVUDdiMXJMTGxrZXJxWmhKZmg5aEVVdlhRQTV5?=
 =?utf-8?B?VEpHYUt4bFYxR09yaTF4QlJSR3VZWC84dTI3MStvSUxYTVBmQlp4Qm14VElS?=
 =?utf-8?B?a3NFQ3dwSUVUa0RGUWpwMElyNjh1VWQ5cCsyR0lUanhISHdWTHlLRTRycnph?=
 =?utf-8?B?cEVvbHQ5RzEvN1c5QXF1blRaNWhzVXdyaGVKNUl5cEZwSjdXZzhNSndVdUZu?=
 =?utf-8?B?SHM3MnpVQ2lMaW56SDAxdWpFem5uWE9BNk5Kd1Z4cjEwMnFscmpsczZ5OFln?=
 =?utf-8?B?WVhKWklMaGtLQ3VEa2wyblB3UzJHTEVlYXZOL0dGcWcyVElVdVV6MVVxbG1n?=
 =?utf-8?B?RkE4QkdTYWFzUXo2QS9YOEY5T0h1bTc1TCtWa3lWNXBJSVVzRjljY0svaDJs?=
 =?utf-8?B?MDl5dUp4dlZzcVJKandkQ1R2U0hTR2R0eE9SalpMRFEyamNCVkt6NG93anBV?=
 =?utf-8?B?U0hHbS85cThWVzQ2dzd6QXA4SXZtMVB5UHBvMHNMeDNMVHhlKzJJcUp4SGky?=
 =?utf-8?B?NGFtWlk5MlNDZHQ0OTRRMklHVWplZ0R3ZWVYdFJPSWdHZVBwMVV1VGR5UzZV?=
 =?utf-8?B?WmFVVHRXdFMzYzhCWEZPWGpJTnRROUU5REhuMmVhMzRIc1JMSGNZYjh1MU9X?=
 =?utf-8?B?RW5wWVhoYW50NmhIWTBrdFd0Sm03ZXlyd0grSUdpYmpGLzVpN01hc1FudERD?=
 =?utf-8?B?MTVBa2RvUWxIZDh2enRaYXpnVmtyamdoOERLczNnOHZkQlN1ZUJtRVBiMHlx?=
 =?utf-8?B?Si9NQm1MejhualBLNG90QnFnbWZ4dU4vS2NqQnRjRWFqVkJqb3h5eDAybmQ4?=
 =?utf-8?B?VkxSbDVGaHBFRit3dWJqY3VxNkc1NGNaOWtweU9kK0hXS1NnMXhaSmtxTkhq?=
 =?utf-8?B?NE04YytQOFRqYnJNWlNZZ1B6SmsveVJ4L09tY2FkRm9qZmdTaUJEbVRqaWNx?=
 =?utf-8?B?RnNnWks0VGswNVgrMitVb0xMK0ovMEI5QXAwazhtZzNRQUpUUys2amZMdXV6?=
 =?utf-8?Q?hew7sap4RWDcHSmNPaKx5/jTLzaB/k=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eVZnKzdvWllld1NuOHdYaENCaXIxWmlQSnFBLzFIeWpVN0NROUZWSllqU1pU?=
 =?utf-8?B?dks4QkwzVC9jZGRsVFdqc0FqQ2FnSGhsajdzYTBGTUhZNmVLSnkzSm1teDNT?=
 =?utf-8?B?YkwzY1d3SXJFUHVISll6a3BPbWs0VysxZGxlMitIRVFFa2dNRjRtRGUxaUtO?=
 =?utf-8?B?NHZubHNxZW42QkM5aU1EUjNiYXRmaGkrSG45b0dWQnU5WDgyNmRwUHBvZEFH?=
 =?utf-8?B?S0tlZnpja1g3SFNWZFRYcXplbU8yTGlOT25pWkl1SWkvcEJSa3NqemMyLzJ1?=
 =?utf-8?B?Kys0MVIzcXR0a0tOV3JoODljcWw5bVZueXRTd29Pbk9PeGQzL05RZFNXVnNp?=
 =?utf-8?B?bzBSUXF6T3NGeTNmbXdxUUdiak5kYU5YY1liNTJ1UElvc3EzeXRXQVI4UEVV?=
 =?utf-8?B?N29HekpPcWRwc0pCME13Zys4VlFqTUhIeDlIRG40NDI4aUdycGRtdDdibldX?=
 =?utf-8?B?T1JFbU9TSGtPRGtqOUpoZnhaeERZRXAwVkVHMVpaWllDQStHbjA1KzBoZmxn?=
 =?utf-8?B?RmRGcWxDR2dKRW9tamE2bnVEcjROT1lsSWdBREhjRUZKc1JrNVJoRmRTRlY1?=
 =?utf-8?B?L3JIa216UkxPMHdnS040SGg5Z0xoQzVyQmdobW1KVDdnemtyV3BUaDRabFpn?=
 =?utf-8?B?ZEN4Wm54NndLNmptaWhCT0d5WStlQ0dGK1BXSGdoblVOR2QvRHdaT1VmOUVn?=
 =?utf-8?B?RmQ3d2pyd3FqVlhpamdSVjEwTnN1b2o5M0RvelVLZmwyRVhnaVhHOWE2TlBE?=
 =?utf-8?B?N21BaEQ2bWFLbDMzb3UrcDRrbHdvMnRPSThvOEFDMnNCaktaUFkxV2FjRXZ4?=
 =?utf-8?B?MExSSG9WZkdUV29WNXdRNHQzbks4Rk4rdG52bFVPRXRQdWxWQ1JwTkxHTmo5?=
 =?utf-8?B?TmhxVkhQaHl2T0VKeWZMbThOcitsSWp3QVluTTRyR1FNSGI0OGMwRDU2aENq?=
 =?utf-8?B?ay9rWXkxQ0RzbVhpdjI2eEd6Wm1XVWd2ZnFITkZNVUhHanJPNk9PbUNiVnMr?=
 =?utf-8?B?UkhSWFNnemFoZWZ5SkRGVVNIV1J6RmFIaVlyejMwYzk3WDRUMlh3ak90K3BQ?=
 =?utf-8?B?QzV5aWI4WnJWa0RJQUtqb3pZSTVYTmk5eVl2UDFKU1hqQjkwdnZGdHpCYXor?=
 =?utf-8?B?dmo1c08xK203TzNscVgwRytFTmtMc0JZOTFtdkhEOVhGcTdGVUloKzRvT1Yv?=
 =?utf-8?B?cy9Td2krVHJ6bmlKTnVjQVhhNUkveGoyckl3UldlWmsxZjNYYVR5NVkwVnpt?=
 =?utf-8?B?UVpaSk1paG1qckRwWUZ5d3ZpNmhrbm5XaUUwQ3FYaVFTZ1l4YTQvWFJYN1Ba?=
 =?utf-8?B?bk5PQ1FsNytCdXA5Sk9seFpCbHJ0cUlEbUVFTUNGVmRmZXJnWVpualVxcW5F?=
 =?utf-8?B?TWQ3ODZubUVYQzFWWUdzdHg1TjJwWjMvVnBNNXRsKzFkZ3BrdGc3U2RPOEtN?=
 =?utf-8?B?VG8zQnV0bzVaeHhVdEo4MjMrZ3FtcWFQZTQwK1YzYUdGWGVTQlVqbUVHNG5u?=
 =?utf-8?B?RHRWeUxYUjdlR1VEZDAwdUNtUWFxWHorWS9kYitYZk45NnRwTEZZQ2ZDb1Vl?=
 =?utf-8?B?T29CQWs2QkNiZ3BsWDZGcU51NHh1elJ6N25ucGdEeTRZenZwQVcrdVZxOFM3?=
 =?utf-8?B?T01TNndPeVVIMVFVWHp1YmR2WU9xMEJ5N1FzSXpIaW5IQUNHa2drMmVkZnh0?=
 =?utf-8?B?bTBqT0YyNmh4SjhxanQyUWd1RUFUZzBQbmFhbVJELzI5SlFub0NXbTNJdjEv?=
 =?utf-8?B?QnA0dXhaOHAwRnNpM0tyRzZjczM0TVoyRnhZb3RJZ1d0MmJoemVHV240WC9P?=
 =?utf-8?B?eFkrcFExZE9DY05MMG9wcktFenZpWTQ3T05kQkZuUFF1L3NMNmtQb3BDOW5Z?=
 =?utf-8?B?TGh2YkNINDFWUHBER090SEptWTZGYnhkODhzL3FuN3RSWGNyaFREWWRvSVpz?=
 =?utf-8?B?ZW5XSDRPczZCaDNZZHpLQUFvUnl0TDI0eVdONEE2ZGQxb2FreC82QmJLN2o2?=
 =?utf-8?B?Q2JJbVRLdG8xd3orNmx4VU9PTDY0TWZLNEFNeUR3dU1mbDNKUmQwZjRGdnFh?=
 =?utf-8?B?NmxQV3hoM2pXTVMxcUJKVTdXVWlUUlpBSGU3cnpmQzY3aXpEaWN5dkg3c1RS?=
 =?utf-8?Q?fThI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 434091b9-46cf-431d-b539-08dda97ecd98
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 07:00:23.6580
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JtRzNtZshk6+7a5znbuVKf0ZAH2r/AkE4lxFww30U5jwbqzMRR+65JB4QlJIN4MxAUMEIr7QLz6kO3r6c61iAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7739

W1B1YmxpY10NCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBKdW5lIDEw
LCAyMDI1IDk6NDEgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4N
Cj4gQ2M6IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgQW5kcmV3IENvb3Blcg0KPiA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPjsNCj4gQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQHZhdGVzLnRlY2g+
OyBPcnplbCwgTWljaGFsDQo+IDxNaWNoYWwuT3J6ZWxAYW1kLmNvbT47IEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPHNzdGFiZWxsaW5pQGtlcm5l
bC5vcmc+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2NCAxMS8yMF0geGVuL3Btc3RhdDogaW50cm9kdWNlIENPTkZJR19QTV9PUA0KPg0KPiBP
biAyOC4wNS4yMDI1IDExOjE2LCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPiAtLS0gYS94ZW4vY29t
bW9uL0tjb25maWcNCj4gPiArKysgYi94ZW4vY29tbW9uL0tjb25maWcNCj4gPiBAQCAtNTkxLDQg
KzU5MSwxMSBAQCBjb25maWcgU1lTQ1RMDQo+ID4gICAgICAgdG8gcmVkdWNlIFhlbiBmb290cHJp
bnQuDQo+ID4gIGVuZG1lbnUNCj4gPg0KPiA+ICtjb25maWcgUE1fT1ANCj4gPiArICAgYm9vbCAi
RW5hYmxlIFBlcmZvcm1hbmNlIE1hbmFnZW1lbnQgT3BlcmF0aW9uIg0KPiA+ICsgICBkZXBlbmRz
IG9uIEFDUEkgJiYgSEFTX0NQVUZSRVEgJiYgU1lTQ1RMDQo+ID4gKyAgIGRlZmF1bHQgeQ0KPiA+
ICsgICBoZWxwDQo+ID4gKyAgICAgVGhpcyBvcHRpb24gc2hhbGwgZW5hYmxlIHVzZXJzcGFjZSBw
ZXJmb3JtYW5jZSBtYW5hZ2VtZW50IGNvbnRyb2wNCj4gPiArICAgICB0byBkbyBwb3dlci9wZXJm
b3JtYW5jZSBhbmFseXppbmcgYW5kIHR1bmluZy4NCj4gPiAgZW5kbWVudQ0KPg0KPiBXaHkgaXMg
dGhpcyBiZWluZyBhZGRlZCBvdXRzaWRlIG9mIHRoZSAiU3VwcG9ydGVkIGh5cGVyY2FsbCBpbnRl
cmZhY2VzIg0KPiBtZW51PyAoTm8gbWF0dGVyIHdoZXJlIGl0J3MgYWRkZWQsIHBsZWFzZSBtYWtl
IHN1cmUgdGhlcmUncyBhIHNlcGFyYXRpbmcgYmxhbmsNCj4gbGluZSBhaGRlYWQgb2YgdGhlIHN1
YnNlcXVlbnQgImVuZG1lbnUiLikNCg0KQmVjYXVzZSwgSSBpbnRlbmRlZCB0byBoYXZlIHRoZSBv
bmx5IGZpdmUgY2F0b2dvcnkgdW5kZXIgIlN1cHBvcnRlZCBoeXBlcmNhbGwgaW50ZXJmYWNlcyI6
DQogICAgICAgIC0gc3lzY3RsDQogICAgICAgIC0gZG9tY3RsDQogICAgICAgIC0gaHZtDQogICAg
ICAgIC0gcGh5c2Rldg0KICAgICAgICAtIHBsYXRmb3JtDQpXaGljaCB3aWxsIGJlIGludHJvZHVj
ZWQgaW4gYSBwYXRjaCBzZXJpZSBhbmQgbWF5IGNvbnRhaW4gbXVsdGlwbGUgZGlmZmVyZW50IGZl
YXR1cmVzLg0KUE1fT1AgaXMgbW9yZSBvciBsZXNzIGEgZmVhdHVyZSB0byBtZS4gQW5kIGl0IGlz
IG9ubHkgZGVwZW5kZW50IG9uIFNZU0NUTCwgbGlrZSBMSVZFUEFUQ0gsIGV0Yw0KDQo+DQo+IEph
bg0K

