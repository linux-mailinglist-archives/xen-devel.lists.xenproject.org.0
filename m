Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6929CABB5C2
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 09:13:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989579.1373594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGugf-0002DI-13; Mon, 19 May 2025 07:13:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989579.1373594; Mon, 19 May 2025 07:13:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGuge-0002AJ-U7; Mon, 19 May 2025 07:13:24 +0000
Received: by outflank-mailman (input) for mailman id 989579;
 Mon, 19 May 2025 07:13:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vhbn=YD=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uGugd-0002AD-E3
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 07:13:23 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20606.outbound.protection.outlook.com
 [2a01:111:f403:2414::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be09f3ae-3480-11f0-9ffb-bf95429c2676;
 Mon, 19 May 2025 09:13:20 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by IA1PR12MB6164.namprd12.prod.outlook.com (2603:10b6:208:3e8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 07:13:16 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 07:13:16 +0000
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
X-Inumbo-ID: be09f3ae-3480-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LUjpw2Oz/wxf3guZoQDwG+6MmaHcGrEH37PhLHthydoQReQfHJrEY0Te8aUtQxSqoeaDkdom2ZoYqjil4vCd4HU5G43BiSDDsOqnE+6yV5yQo6fKhNKbIxlCw+l6ajA6ZbMMVoxrlWm7D+mydxtxjmLlKRhXmgxHDup51GlG0Tzm2G14EqkJeNNNg5N5WJCB3iqIxuxGlJPIC9OBDUDE7/UPm0bolrlcPRMSu1vXiwWrO22eQ8ibe4kfFysyJleVJldlkSyyVpNwx7HHW1KprTCP1xPC7TK2vSzwW2y3L9S7iqs3aVFvudsk9Hnb3Zxd5+1qjxnYWqzZKZ5pqWrXOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J4nvKe0CBxA/dVyOu2C+FTjWdBAchTSRm6oY9xhuMwE=;
 b=ONx2lD+23cY8u9q110xSDtsU+0RMOhA0e0EbxjqUUVfZpmxeCnvypqv8a1O1uIYGzbb5NTd5kmmybNE6a2NiWI4RzTkDLQLs64uid5wYqE44ne1o8Wi5BjTaEeIlROLZfgKnpsKUevtxxE62bLc3f6TZD4tgaDRmyzF7p47oLJmy78I/k4ALG6O8RzGcnQH5lRMWC/+WiRlQq/KZCEI5l7okmTQCs6yEEXFTj+92QVedSRmUWMS4RoS9OTo+GBUKXCCLuMxQItzoNrgI4MUck4i66JCBFF1Sp4f1/pkxOcqlz7O6dBLyHlfjYGsUnNt10HERtuYrhUkz8bYU1d59gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J4nvKe0CBxA/dVyOu2C+FTjWdBAchTSRm6oY9xhuMwE=;
 b=qfOeDRpOV9zSPVmyQNU+ezTN2K32qP878hqYD2OGLjhzS3RTv5NsCO0BKrhNK2YzpCDkSyaq9hcZn2D5vxjTtAB+GEJAObq4Yg2vG+zwutjgFLQh/gP2a2KmB4qeJ31KKIFBWA+Gnkz9NNY5xaAIs2jUsOJeT6eo1ptX9qoajB0=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v4 03/10] vpci/header: Emulate extended capability list
 for dom0
Thread-Topic: [PATCH v4 03/10] vpci/header: Emulate extended capability list
 for dom0
Thread-Index: AQHbwMGevTfR886wakahq6ntIeNmMrPYfnSAgAGVuQD//4B5gIAAiU8A
Date: Mon, 19 May 2025 07:13:16 +0000
Message-ID:
 <BL1PR12MB58494740C0B258C63C3EBC08E79CA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
 <20250509090542.2199676-4-Jiqian.Chen@amd.com>
 <b569f90b-673d-44c0-b350-8a6f5f3c8d78@suse.com>
 <BL1PR12MB5849E0E13D669CE6B2755399E79CA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <bcdc0848-0c12-4ee0-b923-c7d5243bf097@suse.com>
In-Reply-To: <bcdc0848-0c12-4ee0-b923-c7d5243bf097@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8746.028)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|IA1PR12MB6164:EE_
x-ms-office365-filtering-correlation-id: 9bf50ef0-326d-4fba-7ae1-08dd96a4a046
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aS9yUzF0bU9tajhJS3pPcGNEVXRpN3FrM2drbUIzWUd1NktLZjBUK29CdWtp?=
 =?utf-8?B?MFkvT2E1RUxza2oxSFV2VDE0emVrUHRBazlOKytCSFlYOHVBVVQxajErUEJn?=
 =?utf-8?B?aW13cnU0MmY5L2F0SmE0V0hldHdYOUtYdWc0QWFZVTFNNm1qSzN0VHBnaGlD?=
 =?utf-8?B?MzJ3WWdiS2RZSG9tYzdJbytDM2xuYmtiMHVaUWtSOUdTaFg2QUc4ZEsya1ZB?=
 =?utf-8?B?ZDdIbkFaTkMvckNoSXFJOVhjNEJCQmdVSGFJdFhqNGMzcTdyOTdiUWNOclgy?=
 =?utf-8?B?M3FvTUpUb29QaC9PUWJFdGhFb1hncEJFb29QRXRxbTBya1pycEd3T3pjWFBY?=
 =?utf-8?B?N05KR0tMVnE4dHF2dXRYTnJKcjU4VnV1S0RWS1FNZ01nbFhGZEJ0ZUl1RXFn?=
 =?utf-8?B?UmZxWTVCb1dmOVNXQ2JQV2VzNTVjbUtldHY2THM0amVDM0dycm1QU0NTMEhk?=
 =?utf-8?B?d0VoTmFhM0JBd3drRFBBTjlXYzRwTXNyczZYNFQyTktpbGs4K2NnN0xDZzdw?=
 =?utf-8?B?WnRLR1VLN2N2Slp2S3o0Ym9iekZhUTdmNkxwMXFKQm45TUplcWRjNDh6VWVh?=
 =?utf-8?B?KzZQSHYra2hVNnd2S2dzUStHL2dwMGlITHdVWWo0RVdHWG44MWtmeWlIUmp4?=
 =?utf-8?B?cUV5ZXJsb2RJdjF3L1BzTHNMRlpsYWh3QUdrYVl5VjhZWXBpYmRwTUFqY1hM?=
 =?utf-8?B?WUFJbkZ5aFN3U0NvcTBwMy9STGlYZmwzc2pMMm9YZFVjSHg5QmZYRXdSaDcx?=
 =?utf-8?B?U3FVWFd2enU3c2pEK1ZkZDRYQlhxVGFibTNZK3Q4QkxzYXhvRGNUb04vNTVM?=
 =?utf-8?B?TWVoL3NYdVE0RHNkQUtCZEJtL0NNQUc2dnEwQlZ2ZGRLeWZNNVVGYzZwejBa?=
 =?utf-8?B?Sk9PS2NtQnNSbnJJR1lPd1hGL0M3REVLWCtSL25QSVhhL0tEb1FoTWcwbXlR?=
 =?utf-8?B?Y2k3RnNiUzl3WFh5d3FDejRvc0Y2d25RZHpIcEMzUktNclViTlNWWk1ZTlhq?=
 =?utf-8?B?MTZVc0w4MTdkNWxGM2FkZjZVWlg4Zkg1dG1PcXlTTE0wd21OUXMwOVBNT3lE?=
 =?utf-8?B?UitxS2dlYUZpNkJQcGZnalBGVjhDTXFjcTVjeVVyVVNZU3ZubjNkYjNFVUxH?=
 =?utf-8?B?M3dTK3V2ZFpYTHBZWU5kSmtTeTJFVjFWWVBVeXBWRnJpSkJ5amQ5bm9SdWNo?=
 =?utf-8?B?akFTQitUWnYxSFNUa0I0ZlE5eTVMQUczdW5HS08rWjVoVktFS3RyTnFubjF3?=
 =?utf-8?B?SjNRZ1RiMU8yb00zR1Z5MXhZQU5MKzhTdDIvb1IvRXIydmt1TjUwVlBmUlFj?=
 =?utf-8?B?WGIvY3F6NHVwSUxsclM1Wm9tZldjUmV2b0VUYlJKdGs5NFhwWHMxWFJweUta?=
 =?utf-8?B?R0loRW1oaVE3eFRNbC9NTkl6VHJvcW9KczJZSEtCMSt3U25oczhVS0J2bVJx?=
 =?utf-8?B?K3RESEYwSWlsSGVoUzJORWE1S2Vlc1BVN2RFdGJvbXFQZFFSS01USUhwMEtv?=
 =?utf-8?B?MVhzRlRkNDFzWGt6b0h0Y1lLVzJiQk5FNHBtemRwNXV4RElwTEpqUDVXbmpD?=
 =?utf-8?B?VHRBdGtuSFhVSFJYejZOOG0vbG1yVHljLythbTgvRjczaVVNOEV0L2J2RDd5?=
 =?utf-8?B?VmV1aHg3UVNQSEtzaXJGZ2p2cForUmxxWlM1Kyt3SEc0MFAzdmk2N08wNHU4?=
 =?utf-8?B?Mm9NbDZaQW5pajRiRExoNURsV2VtMGVvOXhwNW5SOHdhMjNJdTBmL1BKb25L?=
 =?utf-8?B?MzdzNmlvL2tqRkx0RGJQYUdVbEdXTEcyeHlONzR3cCtDVEVURjVvSGx1OGhw?=
 =?utf-8?B?MjNSZ3VPbXlwaFVhYkkxdnRIRXovQ3JkcENJZHFLemYyWjBKaDcyUHZSbTNH?=
 =?utf-8?B?NWd3K0svdUJ0L0dTK1ZmM29BbjEwcUlGQkNZMjVaN3BpMGhZVlAvcEVRdC9u?=
 =?utf-8?B?ei9tVCtsekhzSlNEcEpMa2FQdisrc3dtREx3dkw5VEwxSkoyendOZHdacnJ4?=
 =?utf-8?Q?ujfE+ymbU6jvmo4WQEH3/t5NgWtVmA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YnZCSFRxWDRScldTY0JtWStGcVFsK0RLQzNjM1U3UTJmY1RnZks5TUp6dXpL?=
 =?utf-8?B?eHBQQUhGbE5YN1BlQnNHZkFjdTFWZFZEWlRWSWdmc2JuQjIxOTdJc1puc3l1?=
 =?utf-8?B?RFUycnd3OUt0YzhMYlJGRDZ2a0Jlb1ViekVzWmlDTkR1cURmVkRFWFlFOTRy?=
 =?utf-8?B?REU2cHhnWHJuRFBZMTd6WDhYeWRJais4R3JPMWNTMlhTTUY5TVhSb0xYOU0x?=
 =?utf-8?B?bmNpZmtQVEJiZ216ZEU4c0JDc2NiYkUxTEhGa1ZCeWFRVXVMa2tsVVZhdU5G?=
 =?utf-8?B?amZFQkwrK2dIdXpINDhUWlFacHM4QzlPU0dMT0JLVmNSeWN0bXBCYzk3Y1VO?=
 =?utf-8?B?OTZuT3lGT2daV2loYXRibER1VUV4c0hNcnlnRXk3ZFpHUnp6ZGQ3YkJKT2Rs?=
 =?utf-8?B?UVhVQXRhQ01jZkdSWW9MYlh4Uy9mbTRVUmowa3k5Q29sQVdLSmMvcDZmbEEz?=
 =?utf-8?B?RUNSUlNYOWlkR1F6WXpmVFJkWk1xWWNNQmRXV3VYRFlMVERNdnBPQ0FJa0Mz?=
 =?utf-8?B?QUk2SGdvc0dYb0loSzE0M1owN3o4TlBJaEZoUVFNNGo2U2x4VmhRdXRWaFFy?=
 =?utf-8?B?cUZsOEpVYnA3NVhOSjN2T0xWeWo0bEtsNW1Jcm00QksxeFE2L0NKY1I5SjBq?=
 =?utf-8?B?cE13bmc5NTN0bDRUWGVheG02cnJxeisyUUlKcUFreWZZOFNYWW1wMFpWZXpD?=
 =?utf-8?B?c09UQXVQNEZRN1QxOUQ1bTZORmVpencrTmZsejN0YW5QcjR5aGZKYTNzSDQv?=
 =?utf-8?B?V2xIYVZ0bXVlem14N0wrb0NLMlhGcXMzSjhIVml0d2ZWR1NMdnlER0wxcGxy?=
 =?utf-8?B?MUdObHA3MHFVVkMzZnYwazVNZENRRmlKcWVlVWl1V0E1YlpHOWxtc2NwM0tM?=
 =?utf-8?B?aWM3TEpkL05zRG5qZmkzSlM1L1VKaWdGVlhQZCs0Zm1vWTJMNmFiVzVsVjJC?=
 =?utf-8?B?emQzUUtKRHlqbEkydCs4MzBEQmo2cUVvdlZrdFMwV00vaDhWTnU5SGtaUlBr?=
 =?utf-8?B?SDcrKytkdVk4dHA3NTVBTE83R3dXK2VjdUNuL0c1QUQzczIzVlRYZWs3UVhL?=
 =?utf-8?B?NHI2V3lnWmg2S2tjRUxHWVRoOXJOblE3ekFpNG1FeHFNVmYyd241bmVHeXVn?=
 =?utf-8?B?ZjNNT2ZqZVNYMFpQQ09EMnBpUklJQ2k5YzE5UFJrYkJFTTNESXdGRHNZUFl4?=
 =?utf-8?B?UjZhR3B6TXdTa0pWcVJuUUZnTktNR05YdkFYR1NHa3FJV05KVWdDd3N5Q1NQ?=
 =?utf-8?B?S3U4QVowQUZ5cCtkVGg3aW1maGoreXVIK2ZFNEs2d0NXdVJnVG1yZ1JMRk9k?=
 =?utf-8?B?WWo2MU4xSTBnM2FJbVo1bzhOWTB2Nk0wYnFPMjNHRVAvaXF4S1kvT2dSSXg0?=
 =?utf-8?B?SUxYRVRhTG5vblFoSGhHcGxGY2w1eVhFZTZXcWt0dnpOMTNHVGpVcHdHV1VR?=
 =?utf-8?B?U05OTXlSbWNwSFl2MW1KSjdITll5emVCd0xLK3BNck1zQlEzcmZOZGwvWmFX?=
 =?utf-8?B?YVdVSGxETWZuWDJxUDNlNFpMeFkvOWtlbzhPeTNiZlZ6aGVFUUZsRjVJbkVM?=
 =?utf-8?B?U1UvdExUaTcva1ZvU2VsSUczV0N0MFF6QjhZTVJlZ3VIQ3JSd0lTZ2x1bHlp?=
 =?utf-8?B?MHY3MDBEN3EzeUxIY3FIQzdhVEZ1dTBvbzlzc1ZSYkR4RFI3bWpab3VRdTRP?=
 =?utf-8?B?bGJOUmpibjZpNExOR3MzK1p6WkpTeWM2L0xpTVVUMnNMTkRxamtCczgxRTdX?=
 =?utf-8?B?dWQ4dm9ZTUFrR0hidTF5QytVSjlYdDBwVzhRSmJ0UVp4Um5TTUtSdEJrZFQz?=
 =?utf-8?B?U3NONFNvZU9qWFFTWVBRb0xDMTJvTWxhclc5L3pRTmRKSEhwMWNMQzlORU42?=
 =?utf-8?B?MW85L0hEN2VSRzRMWVRsQXhyM2E2cTUxa2N2OGVVcGpVMm91eHRYQnBvU3Y5?=
 =?utf-8?B?WmNiK1A0eUpoRkMzRk8zZDE3UjNFZms1SjhoT3FYMzg4QkF4SkkreVVnMUZt?=
 =?utf-8?B?OGdvaSthOFZMV1diQWg5dUgyL1dUcWw1MTRpU2lkUThhcmMxQ1ROeEVwM0xI?=
 =?utf-8?B?d1BPVUFPSTVhdlEvZVljNnNjNXM5d1Z5SEg0T0k0MlVMYUhsUURBbHFvNkxM?=
 =?utf-8?Q?yhYE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E7F7E842890EC24EA3FFCBC1A434A401@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bf50ef0-326d-4fba-7ae1-08dd96a4a046
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 07:13:16.3853
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FgXkHknNSlTt99DesTyzjEqQeREkzBhRQ9+g4MOzNibGogCK+NZrS+OrNdRkwHCYzn2IV5i8LWyJAz65BF/ReA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6164

T24gMjAyNS81LzE5IDE0OjU2LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTkuMDUuMjAyNSAw
ODo0MywgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24gMjAyNS81LzE4IDIyOjIwLCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAwOS4wNS4yMDI1IDExOjA1LCBKaXFpYW4gQ2hlbiB3cm90ZToN
Cj4+Pj4gQEAgLTgyNyw2ICs4MjcsMzQgQEAgc3RhdGljIGludCB2cGNpX2luaXRfY2FwYWJpbGl0
eV9saXN0KHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBDSV9TVEFUVVNfUlNWRFpfTUFTSyk7DQo+Pj4+
ICB9DQo+Pj4+ICANCj4+Pj4gK3N0YXRpYyBpbnQgdnBjaV9pbml0X2V4dF9jYXBhYmlsaXR5X2xp
c3Qoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+Pj4+ICt7DQo+Pj4+ICsgICAgdW5zaWduZWQgaW50
IHBvcyA9IFBDSV9DRkdfU1BBQ0VfU0laRSwgdHRsID0gNDgwOw0KPj4+DQo+Pj4gVGhlIHR0bCB2
YWx1ZSBleGlzdHMgKGluIHRoZSBmdW5jdGlvbiB5b3UgdG9vayBpdCBmcm9tKSB0byBtYWtlIHN1
cmUNCj4+PiB0aGUgbG9vcCBiZWxvdyBldmVudHVhbGx5IGVuZHMuIFRoYXQgaXMsIHRvIGJlIGFi
bGUgdG8ga2luZCBvZg0KPj4+IGdyYWNlZnVsbHkgZGVhbCB3aXRoIGxvb3BzIGluIHRoZSBsaW5r
ZWQgbGlzdC4gU3VjaCBsb29wcywgaG93ZXZlciwNCj4+PiB3b3VsZCAuLi4NCj4+Pg0KPj4+PiAr
ICAgIGlmICggIWlzX2hhcmR3YXJlX2RvbWFpbihwZGV2LT5kb21haW4pICkNCj4+Pj4gKyAgICAg
ICAgLyogRXh0ZW5kZWQgY2FwYWJpbGl0aWVzIHJlYWQgYXMgemVybywgd3JpdGUgaWdub3JlIGZv
ciBndWVzdCAqLw0KPj4+PiArICAgICAgICByZXR1cm4gdnBjaV9hZGRfcmVnaXN0ZXIocGRldi0+
dnBjaSwgdnBjaV9yZWFkX3ZhbCwgTlVMTCwNCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHBvcywgNCwgKHZvaWQgKikwKTsNCj4+Pj4gKw0KPj4+PiArICAgIHdoaWxlICgg
cG9zID49IFBDSV9DRkdfU1BBQ0VfU0laRSAmJiB0dGwtLSApDQo+Pj4+ICsgICAgew0KPj4+PiAr
ICAgICAgICB1aW50MzJfdCBoZWFkZXIgPSBwY2lfY29uZl9yZWFkMzIocGRldi0+c2JkZiwgcG9z
KTsNCj4+Pj4gKyAgICAgICAgaW50IHJjOw0KPj4+PiArDQo+Pj4+ICsgICAgICAgIGlmICggIWhl
YWRlciApDQo+Pj4+ICsgICAgICAgICAgICByZXR1cm4gMDsNCj4+Pj4gKw0KPj4+PiArICAgICAg
ICByYyA9IHZwY2lfYWRkX3JlZ2lzdGVyKHBkZXYtPnZwY2ksIHZwY2lfcmVhZF92YWwsIHZwY2lf
aHdfd3JpdGUzMiwNCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwb3MsIDQs
ICh2b2lkICopKHVpbnRwdHJfdCloZWFkZXIpOw0KPj4+DQo+Pj4gLi4uIG1lYW4gd2UgbWF5IGlu
dm9rZSB0aGlzIHR3aWNlIGZvciB0aGUgc2FtZSBjYXBhYmlsaXR5LiBTdWNoDQo+Pj4gYSBzZWNv
bmRhcnkgaW52b2NhdGlvbiB3b3VsZCBmYWlsIHdpdGggLUVFWElTVCwgY2F1c2luZyBkZXZpY2Ug
aW5pdA0KPj4+IHRvIGZhaWwgYWx0b2dldGhlci4gV2hpY2ggaXMga2luZCBvZiBhZ2FpbnN0IG91
ciBhaW0gb2YgZXhwb3NpbmcNCj4+PiAoaW4gYSBjb250cm9sbGVkIG1hbm5lcikgYXMgbXVjaCBv
ZiB0aGUgUENJIGhhcmR3YXJlIGFzIHBvc3NpYmxlLg0KPj4gTWF5IEkga25vdyB3aGF0IHNpdHVh
dGlvbiB0aGF0IGNhbiBtYWtlIHRoaXMgdHdpY2UgZm9yIG9uZSBjYXBhYmlsaXR5IHdoZW4gaW5p
dGlhbGl6YXRpb24/DQo+PiBEb2VzIGhhcmR3YXJlIGNhcGFiaWxpdHkgbGlzdCBoYXZlIGEgY3lj
bGU/DQo+IA0KPiBBbnkgb2YgdGhpcyBpcyB0byB3b3JrIGFyb3VuZCBmbGF3ZWQgaGFyZHdhcmUs
IEkgc3VwcG9zZS4NCj4gDQo+Pj4gSW1vIHdlIG91Z2h0IHRvIGJlIHVzaW5nIGEgYml0bWFwIHRv
IGRldGVjdCB0aGUgc2l0dWF0aW9uIGVhcmxpZXINCj4+PiBhbmQgaGVuY2UgdG8gYmUgYWJsZSB0
byBhdm9pZCByZWR1bmRhbnQgcmVnaXN0ZXIgYWRkaXRpb24uIFRob3VnaHRzPw0KPj4gQ2FuIHdl
IGp1c3QgbGV0IGl0IGdvIGZvcndhcmQgYW5kIGNvbnRpbnVlIHRvIGFkZCByZWdpc3RlciBmb3Ig
bmV4dCBjYXBhYmlsaXR5IHdoZW4gcmMgPT0gLUVYSVNULCBpbnN0ZWFkIG9mIHJldHVybmluZyBl
cnJvciA/DQo+IA0KPiBQb3NzaWJsZSwgYnV0IGZlZWxzIHdyb25nLg0KSG93IGFib3V0IHdoZW4g
RVhJU1QsIHNldHRpbmcgdGhlIG5leHQgYml0cyBvZiBwcmV2aW91cyBleHRlbmRlZCBjYXBhYmls
aXR5IHRvIGJlIHplcm8gYW5kIHJldHVybiAwPyBUaGVuIHdlIGJyZWFrIHRoZSBjeWNsZS4NCg0K
PiANCj4gSmFuDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=

