Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8703AD0460C
	for <lists+xen-devel@lfdr.de>; Thu, 08 Jan 2026 17:29:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197826.1515232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdssv-0005nb-E0; Thu, 08 Jan 2026 16:29:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197826.1515232; Thu, 08 Jan 2026 16:29:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdssv-0005kU-BF; Thu, 08 Jan 2026 16:29:17 +0000
Received: by outflank-mailman (input) for mailman id 1197826;
 Thu, 08 Jan 2026 16:29:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AIqS=7N=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vdssu-0005kO-Bh
 for xen-devel@lists.xenproject.org; Thu, 08 Jan 2026 16:29:16 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a623472-ecaf-11f0-9ccf-f158ae23cfc8;
 Thu, 08 Jan 2026 17:29:13 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH2PR03MB5287.namprd03.prod.outlook.com (2603:10b6:610:9e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Thu, 8 Jan
 2026 16:29:10 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 16:29:09 +0000
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
X-Inumbo-ID: 2a623472-ecaf-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lIR6qQVvOsK+mmVdq4qj1/QEcTVM2ATTzJP5LASEb1wikZ2HlQP3lmj90+IdZ1Ck9TDSZRxkXqsr6pkwPk8GThReR8xKd0s0PCs0b5PvWkUUf7UZ38wpREGeBsLtXeWQxDr9hkxaKqH9O4a1Vvhxg+8IbGQcI3MiYkPoTl0pATkg9KQ5hkizKFuVXp0QGz0B47RkyaSkCvKX3iq96SXJZXaQwgwdE6O1rG9K3dJMuMLqYOmuwF2LlWXT/3yuaEEVNQEZKc1ii4sYwTKTepnY3PwvdllewBeqoDCV25Cel2GLRbU+R3aa+pbop6/NSX7cx8FHEVmhM40OEafswc6DCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QK0XbmDjaJB9EdLs8Wl6IsRLrpv8moOY+/3MSf71hj8=;
 b=F8Y6kkyOnihQCLKx6qqjtkLCMKkGm8IbCm8vyEgG8LcWoM7/VQP93GQsiwU9e2QKeQzh4mHfVD0lULvKHZTUydLMmLhJCCnuNxNtXSGZm0oVVBJzZytfLYJeVU0jQQ/MH7+q21Ic23zpTFxxl4/iPjkEF9PnplE/2FYInRXa5r2pRtDaT3Hykz+vxmFUO97eQbqBPlQPMi+mns+j8GhoutrsjjlLA3q43tgcSQk2e4hLPEsD1o5F9q4KfXiY/TeMuZc5u4swjlR3GTK1pF7filY7mFTi6nFQjkHwktF6zbFJoB0ir6YoxL90zsnPX8ZFf6HsNg7OHOQUD6+LsUxxGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QK0XbmDjaJB9EdLs8Wl6IsRLrpv8moOY+/3MSf71hj8=;
 b=OXgV8wJsVh8fSDYRKuP44ZpCgVl+3A2739j49nr47cX7Am7GttYCpKppybtOsLtO35N2dKJE5Q962ZJYczsLNvfwxeociSLxfWMSzr05i4hxt3L7LDaRm6OXZREenbdN/2orJXbj3bxP8w0iggrmwpaaMmPF/40sMFgbVe64F8o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 8 Jan 2026 17:29:05 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] CI: switch KBL console into polling mode
Message-ID: <aV_bUYAOG7xO4uJR@Mac.lan>
References: <20251208153519.1198226-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251208153519.1198226-1-marmarek@invisiblethingslab.com>
X-ClientProxiedBy: PA7P264CA0202.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:36d::15) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH2PR03MB5287:EE_
X-MS-Office365-Filtering-Correlation-Id: c9223ed8-7a39-4167-3e87-08de4ed30d1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SnYzNGJiYk5OcktndE80SGZSekMrTGwzM2x6ZDVyczBJM0tKZE9FelZFVlNW?=
 =?utf-8?B?Qjcxc05CeVozWGVKc3luRmQ2QU8xUGlidFVQanlldEJHanRJRUZ6QTFiL0xL?=
 =?utf-8?B?MW1EdkVJSGhJdytNN09CZTUyNmRiNWFGTWlzQUI5LzhsZ0E3SGh5M3lxSzk1?=
 =?utf-8?B?SEtBc3pQK1ZVdU1VdDlUeWlDMUkxaW9ySGQ3OXZWN200bk1qbmFFdkRUNlVx?=
 =?utf-8?B?aU4xbXpaRThUdUQxdUpFSklPSVoxZFlzQ1luQTR2clhYM3Q1VEV6RTRMMjZW?=
 =?utf-8?B?THQyZTRaWmpRVCtIV1ppdmZVVG5qVSt4OXh3ZGF5MGp4U08zVTByeVRHTnVn?=
 =?utf-8?B?aHJrejVVOUM5Z1ppZG93N1NveHQ2K2JmeGNYYS91RlA0MUtBRCs4cWRvUGg4?=
 =?utf-8?B?WHUzeHlQUkhRUTUrbzBhemszendFQWFNRjNCdWpaSjRxZTc3bG1JNDJCUk1h?=
 =?utf-8?B?WEYwWnMxalRxUVdFbHc3Q0twcWpHbi9QYlh4blFnNW9jRDJselBmODVQUG85?=
 =?utf-8?B?OFhpaGJXSC9mcUJCaENodHJPSkdoUDV2dE5rbjlYdVdMdmVUZ3dNZmJ1UzI2?=
 =?utf-8?B?R3g1eGRVTXdBTEd4ZVl4MUZ5VzdkSEFDWnRQVGFqUEZodFZoTEJ1Vy9PbnJU?=
 =?utf-8?B?eVhyWEJmYW94ZGpMY0ZhQmhUNUZGdWdZSTZKb1BIQ2lYbjYwNTcxN091K2k3?=
 =?utf-8?B?VHBINlhScGZDWHlhb1pzd3Vpaml1aW1zMFdmR0tSN0pmWFkzU3V5aU1PZU1S?=
 =?utf-8?B?YnZFaVhEL3BDVHRjVkNJZG5aR1dVMzJ6eEU2S2txenV3THVwelFzSnhRVXJH?=
 =?utf-8?B?SVVJTGw4OExkS1NPMDNRN29CZEdZVTFxQS9BSnNmS2VDTkxib1VkU21RUzB0?=
 =?utf-8?B?WTJOU3Y2VE8xYytMVWdMVkVDU0d1RWNpdEVQN3g0N1Z1MnpJcW5zaUwvZTFG?=
 =?utf-8?B?NGNRdVBOVk52dU9uTVRGcS82d1RDZnZlNEdLbFVJZXlaRXViTGhZR0ppbU9O?=
 =?utf-8?B?Z1hVaWErMUF4QVJkdmszVEdCdCtFOEdoVjdsMVRYd2Z6UU1xR3k5Wm4vc0h4?=
 =?utf-8?B?aW1LNWx5S1k0NjhoQStiV1hwVnI3NkEwSVJmcGo2cjZhbTM3Uml6OWtYa1Vr?=
 =?utf-8?B?cGlNM3p5dDZqMTdUOC95azJtYzQ5V3VxNEZtZllxR0taQk9qdE1YSm1iWnFU?=
 =?utf-8?B?Sm9mRzlGVGRjODlZOTl2Z0N0b29qVHVGS2MxVmw4S0lpbUtuSWRVQW9zRzZp?=
 =?utf-8?B?blExTndrVW40S1VPdUhSM1lKdEtkK2doVDhMbTl0MEdqM3NidzBSeFNObDJw?=
 =?utf-8?B?VDlnd3A5MmZWZ2hNRm1IRnBNbUF2OEZ1aFU0UFlQT2VlU2dxdS9XTjZ6NndY?=
 =?utf-8?B?NkNUMGVnMGNTTTg1dXhZYURxVjZFS1ArWUVLSGY0WTNaZ0FZM1BEOXVNN3A5?=
 =?utf-8?B?a3dneW5hREh6ZXppNDFsTitGT2lueUZFZ3RMRkNCck1rRCtsMUtVeUZ0QkR6?=
 =?utf-8?B?KzBzU1VvdkpMVlM3Z0xGL2V4Nno4cUZMdm1xR0FmaHhsbTdpSDlWUW14M1Zp?=
 =?utf-8?B?cmU5VERSSjVmWnZDL2NMaGxUT1pTNUpzS0hnOFIyUk42Rk9HanhFU2hJdG00?=
 =?utf-8?B?L3lINHlxVXZNWUFvbGZSKzlLY2lCM0loODF2MlpyaURhNFBEaDFNbXExQWJs?=
 =?utf-8?B?ZHF6ZDBPREdkVWx6Ni9Wb2dzdWQrS1ZsK3FLd25lSW41TTUzY2pmS1lKaU1U?=
 =?utf-8?B?ZTEwMVZHSlZzQ2UrVEU5NURZbGx3WVppSmxUMG43d1JzZ2diNnh6UktKQ21G?=
 =?utf-8?B?VzdHTWxNMnhTUm1hNDliRlZwdjFQRHh0SzUyYkZGMWJaSEh5QlZZdkRnaWFE?=
 =?utf-8?B?Wkt2cEVqSUNMc0RTK0pwd1NYUWplMTEvL2E3UGlNcVRUaUlkU0JBa0FmSlcr?=
 =?utf-8?Q?AWl5Frf+7eMjilt6GTS1FVO9McyzYcVF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFBZWXZ0RnovYll3UXZiNzV3M2hNcXIzRnZobkRUeUJRaDJuay82WHNuSzVL?=
 =?utf-8?B?cHc2d09MNHh3T2FGbVRkNjFTVUhlTFZKdzlDMFdPK0pSY1FpYnBBa1RzQnB0?=
 =?utf-8?B?Tlk0emsxem5XQlovZW5zbXFhd2hNTDZJVWFSSU42TTF0MmpxK1ltMHQ4Q2Ni?=
 =?utf-8?B?QkhJRGYxdE11ZU5mejI0Y2s3MFhPNW1IY2xWYkliZ0dBS1gza3J5cnFPMVAz?=
 =?utf-8?B?MDZFbHgvSHpadHF6VjBhQzFPQTdPUnNIK0kvdWRvTkNmdEJVNTFYN0g5dTBh?=
 =?utf-8?B?R1N1SWZlQXNIZ3o3TmUvWjJkTUpUUWRaWnF6MWUvOStBSlhjV1YxTEYrSnJz?=
 =?utf-8?B?QnBOQXVXckFVV0Ivd1g5QlF1TU43SHVBMlN6enY1UDBZaDA3WEp5OCtjZnpn?=
 =?utf-8?B?RU5FWmV2SUxQZlI2MEdtT1NYZ0s1aElYMk5PUXdweWIyVHQ5LzBnUUxoZGFm?=
 =?utf-8?B?WFhTeitYYkUxK3B5S3dwRFFsbWJTSU1JMlp2ME01V1dkREZ4NzJwZFZLVVBV?=
 =?utf-8?B?djNLSDhNamZnNjNLOXhMaTdhS1lYTC9wM2VKeHNyWHZnTUtwK3luQ0xwVkhP?=
 =?utf-8?B?azZPNkNXSG9oT1BwYS9xSlZ3N3VQOFJrZlREVEN5TlBpKzVTK3Zma1J1bWhD?=
 =?utf-8?B?c0crbUY0Zys1Y1gzZ0lHbG1nYmd3Y3NTbUxoVXA3VFRTb3BsMkJTbVZVTS9h?=
 =?utf-8?B?blNLY0JzMW1jeTFBVlFtWjloTFVBSmdNMldpV1Axamo4YnBsclN2aGN1TTRJ?=
 =?utf-8?B?NmlIQm1iOWZOUkM5Rk1OOVhwa3d2Y1BvTXAwWTNOa3RBN2J4SXMwa0x3NzBG?=
 =?utf-8?B?SDNLVGQwbHhZWmNEVVYycVg2TDI4OVFoYjZaVElrVmJUdmtQNy9FOCtZeFRq?=
 =?utf-8?B?ZGhLd0RKc1hCMVVqcThhRGUveUNkaDVjV2hTaUxNaWxzZzdySVBrRDVOdHN1?=
 =?utf-8?B?cDF1cTUwTFFtWVNVVEtvWWNWMWdvRkxzck51WnU3MVozSzQyVnNlcEdpb2lV?=
 =?utf-8?B?OUhkWlE5RmVIdXVMdjhMVFJvWWdqYUdSZ1NYSW5rNmxheGxmQlRIRjFJcDQ0?=
 =?utf-8?B?RWF3aWN5bWxRa2dLcm55aUwrbjQ0eS9kdXhNOEt3TTErZG5ZUVIyaEZzcmlq?=
 =?utf-8?B?K2tYY3Eyd2t4QkgrZmYvT3pmT29IK3kvYTNpcHBtNlUwZUlDTStWNGRpVG9w?=
 =?utf-8?B?U1hqQ294MHFXOVVtOHh4bDluQ2VzUmEwWUJwU2RoRW5SMlkrRU9tdXpWOEMz?=
 =?utf-8?B?bDl2ZEltNE13eDAyajN2OGRVQUx3R0t4eDBlTlJuWjRuTGxlanFGdVhVVWhD?=
 =?utf-8?B?UGhqSlhFYXFOZjdMdkRhZjF3T3ErWmF2OFY4S3UrWmsrb3JEV29XNnZFUm5Y?=
 =?utf-8?B?WTRaYm5TZU1iTVZTWXJYc1BiaHBqNFVLOUlob0FyRjZqUTVob1kxeWxrOUV2?=
 =?utf-8?B?c2o2NWEyZ0loWUJZQVZHLzV6Q2J6L3NVNFlLMFZRVHE0U2dJWGZBbmxsZnFE?=
 =?utf-8?B?bUh2UGNvY09nTk5hdCsxSnk5eHNaTUdIcHN0Tk9TcnZUdzF2TGE1T1ZFZzRS?=
 =?utf-8?B?ckU2NzV3ZksxL3g2SG5jbnBvR1ZKZEZadDJ1THFoV0FKNnVVTk1oVHM2Qzkw?=
 =?utf-8?B?WUM5NVpnbngyeTNPK2treHVObmRKVjNraXBrRm5HOEsyWExsa3B6S1JBVjRD?=
 =?utf-8?B?QWZaU09RaG5YV3hQYThGcmx4WVpYaUJqeklHR252bk53SmxBR0NvYWlldUcr?=
 =?utf-8?B?K3h2a1VyNEczQjFtelFwR0hiNXJ2c1dDNlF6U09IWEVxU2JLOWgvaFZUYTFj?=
 =?utf-8?B?MFdjQ0poeEc1NXU0cmRpNFl5MStPaFkvYWIwekpDRmNXM2RsT1RTYUZRVFdL?=
 =?utf-8?B?bC9QNXlEZ2dhWVhPWFlLejQ5dmpIUXZOY2pEVHg1NXhNWk5OVlpOM3FSY3lU?=
 =?utf-8?B?QkxCb0pLL1RzdGM1cXhiNVB5ZStqN2RXV2JWRXQzVVR2Q29EbWNEMWdCL2s0?=
 =?utf-8?B?aHFCZllmQUp4Ulo5QUdiSENWY2xwTi9CQ3BZN0xyc3ZEWlcxcjN2d3pFSk84?=
 =?utf-8?B?WWxXTUhEYVE5TVpCOFd6c3N5RTFUQ1NHVDZDK3FpUCtFQ3d6K0IrU0NxNHU0?=
 =?utf-8?B?Qy9tU3lSWmhmRWIzUFNyemNncFpJNW42K0RidGVoa3lPSGRQOVB4WFE5R0F6?=
 =?utf-8?B?OEk3SlpHUzRUUTB3aUI3QVM4QldqS3BIWEw2WG5UdTI0SDQ5Wm1NVFRHN0Qr?=
 =?utf-8?B?alV2STNmVmNkKzVNZjNYSTBsN0drQUFjc1VSYlFYZnVnbVNDUDZsSU91SU13?=
 =?utf-8?B?ZVR3Sk9McXJDRFk1MDhibzNiOFE5WU9uSEFqczBkUnN1QVdGV2tjZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9223ed8-7a39-4167-3e87-08de4ed30d1e
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 16:29:09.9119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vJkKUkXZdrSneFPKTjnqH9mhwEM7cHqS9OcA+MwCXUkcLFkITRs/UIcfWlBgkHuiTlonLZmS7XvJPjbITSz3rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5287

On Mon, Dec 08, 2025 at 04:35:13PM +0100, Marek Marczykowski-Górecki wrote:
> In an attempt to debug/workaround occasional console freeze, switch it
> to polling mode. If that helps, it will narrow down the search.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

