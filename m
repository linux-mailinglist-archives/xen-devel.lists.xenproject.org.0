Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9A6ADC529
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 10:37:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017990.1394898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRRp9-0004Aa-7W; Tue, 17 Jun 2025 08:37:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017990.1394898; Tue, 17 Jun 2025 08:37:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRRp9-00048E-4x; Tue, 17 Jun 2025 08:37:43 +0000
Received: by outflank-mailman (input) for mailman id 1017990;
 Tue, 17 Jun 2025 08:37:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zxid=ZA=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uRRp7-000486-Jv
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 08:37:41 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20603.outbound.protection.outlook.com
 [2a01:111:f403:200a::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54108cdc-4b56-11f0-a309-13f23c93f187;
 Tue, 17 Jun 2025 10:37:40 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 MN0PR12MB6104.namprd12.prod.outlook.com (2603:10b6:208:3c8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Tue, 17 Jun
 2025 08:37:35 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%5]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 08:37:35 +0000
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
X-Inumbo-ID: 54108cdc-4b56-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SarLjttMj6JAjjK0puUDWaLUVfnojJGf84P34T4ivxEi9FCpYpymT27rdz2D0mLEhAvXNqbkvkuqNXoGM2I5tQQ4SbgXs3iY0jApcg/xFoeIPqEoWd28fIPBhJBi+ewJqDj20zhrStouBgT5mcMVsKj34A5AnuHEjixwEnDmZR1JLC1YyfOYaKwHyiX9mjiQ/IUA/4yIQJHRBsxzJ7LzzuMTbS30IicPLITWBzmB33Euu2Zq47VRHveLSO/NjrBT7fZDipUiAqGqubl5J82aUoS/kFU0bPZRb7EAk4UUM4yt+TBqaO+oNW8pMGzWFw+/1XS7lgJC7kcVB81YJdpDgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nf0QYkR/TafdU4WgMuO/fHhhOQMqY8vnUfXysXD//aA=;
 b=E0RClnAhr3Kr/Ag7s0/TZdHwNyPuDeN42shopX7W+XkE5Yz3T5MEmkAPjZ/5p4KMT6A6ZNBwgJD0b9gZ5OUqzjHESu80RBDCg7d7X9bA94gGsDhnPFRWaDIkg6f10ZnrgnTTedx78VxtFirvAILj9QRsJa1Ka511mwqUH1WUT/E+KZNMsM3n3p3FCyn8lWdNZVKpna/4/ZCq/jC2MAAqAWOgIP2t4mEme5RPwOsdwJLp1p7IG5TRWsUJOdlb5HJ9Wj48XI/3hJOGnE7BH/bymcdM/s+qmDUgrVNgdBU0/NlGKvBMaIHXxMYw/yN3/QRQHj50/jG5JdsgrEPypjP1Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nf0QYkR/TafdU4WgMuO/fHhhOQMqY8vnUfXysXD//aA=;
 b=uSsX8V3juHjPeVvsrOBteqdor8CtC8j61dUp39MdlBsZYC3JX8rLJjQvVE/23iHif53VAincxqRK82hXF+7O8ae7r8FWKG0Eh9WqTiRQtovWHJam9ysR44hZ1K2II12I8yEt+6KXJmvljWvqAjiw1ITjCxZ7tvzu99x3927fmgw=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v5 08/18] xen/cpu: Expand core frequency calculation for
 AMD Family 1Ah CPUs
Thread-Topic: [PATCH v5 08/18] xen/cpu: Expand core frequency calculation for
 AMD Family 1Ah CPUs
Thread-Index: AQHbzuRB4/qHZZI650u0dV+1tuD8lbP/mD+AgAeP7oA=
Date: Tue, 17 Jun 2025 08:37:35 +0000
Message-ID:
 <DM4PR12MB8451B36D62A525A9B1DC4FCCE173A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-9-Penny.Zheng@amd.com>
 <711ac855-78e9-41bf-b057-4ed809b89c9c@suse.com>
In-Reply-To: <711ac855-78e9-41bf-b057-4ed809b89c9c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-06-17T08:37:25.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|MN0PR12MB6104:EE_
x-ms-office365-filtering-correlation-id: cb38ce9f-8d61-472f-82cf-08ddad7a357b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WGFuLzhSRkZ4TkpkcGc4T3lTclJMcDBBSndDcVpIQTNpYVlQRmZNbXpwbUhz?=
 =?utf-8?B?MnNBL0t4alN4M2t3dFpkU0JYamZVc1VVYUlPZ2dYOWRmaW9oYTI4amQvUGU1?=
 =?utf-8?B?bXMxYk9BbmhZOFhwVTBTRHhEWG1OZW5tVTd1eTJnM2pnSENmNldSRTZjRGc2?=
 =?utf-8?B?c3VEaDY0WFlBdzhDVDJUVXMvcHFWbnJ1Z2tlKzhKUTF2MEZRMXBnb1NXYW9X?=
 =?utf-8?B?cVhjZ2h3Rmc2UmtvZTAyMGEzU3pkNHRjK3R3M0VhbUJhb1pkUzhYejZYaXZw?=
 =?utf-8?B?YWNtb3lLR0VrR21jZFJJQXBaMnJHbm12ODFXcW5CTXNZYkFVS296V2JQd2lp?=
 =?utf-8?B?QU9lYzVUTkZiZFZaeXJZNXZCMXhDQmZLQTVoNXM0ekFNSUEwMEo2OHJBNUIw?=
 =?utf-8?B?TzNXNGpzRlQ2T1E4UFNDTTc3eGZ3WWdObHBSNXJrZnFtbHZLR2JOK0tlVWJo?=
 =?utf-8?B?bE9BdHI0bEV2V2FhT04wdUZWNUFFdG5lL0pxekhBajZPMGRvTENTbDJBWW4y?=
 =?utf-8?B?RDYwdEE3SThOS2F5R3ZWVThYYUdqazZkV2dHQmk4SytuT29TRFBONFBxd0hE?=
 =?utf-8?B?OTRtT3VrS3MyZGxRckNybG4vZjBLRnJiSVlUbEpTM21LSGNOTGl5R2NSbHFD?=
 =?utf-8?B?NHB2ck5Ec1l4Q2NSaktsRjJCK3BPcXNkOU1lU281akl1UUFTUjJZSkZZNWU1?=
 =?utf-8?B?ckZ5UmFkYlBOTzlrbE5UZEJIMFp6N1VMRUpxci82bDR0UHFmejc0VDVrNERE?=
 =?utf-8?B?eTB0K1F6aFdHdXNwK2VkR21CQldTbHNSaWFjOVZCSEduR3FQZ2czbGR4L2VF?=
 =?utf-8?B?am9IWWc4elpoSTFDc25wenZKUW83RE5qZW1Ma0dvNU11cU1GQU5icENFQ2pm?=
 =?utf-8?B?RzVrWlE4Y3R0eTZhTzFUS1BBLytIeVV2T0dLMEdJN2dtNjcvK1Q2T1ZXSEJ0?=
 =?utf-8?B?VVRvTGpiZjRyUVNxcXB0QUZhSGkzYjNkaFZnTHVtTHVIQWZ0bkRVV1FjSlFV?=
 =?utf-8?B?eEZYeEVVUkxsL2svck8rZmNnNmtuMHJTK2ZualVQRXVwbnduMzBwd3Y5R3Zt?=
 =?utf-8?B?dFU1b1NIMjh3OXpQNEFUYzQxeUFkS2tMV29jakg0aUJkVHgyVVBudGhRVUho?=
 =?utf-8?B?QTFQaVZ6RVBxUXdqQWMyTGd2SHJHTDQ1T3lwZHlVaGdCalR3aUUzL1FjU0Ny?=
 =?utf-8?B?emRBZjh2cjBPMFFwWFFEK29malMza1J2VFRXSTZoQ3pSU3FxOURhRG92N2pl?=
 =?utf-8?B?SEt3Uy9UN0FPenNTK0RnOG56SmdyT284a1YvYjlocGZoL1BYeTNKTlZBQW9s?=
 =?utf-8?B?YnFrSHlWUmhudU51Wk54bGcxYjN0TDc2N2hJa2NtWU5wa0d6bGdQY1Q1UUVa?=
 =?utf-8?B?VERncHNnWHk2Nmp3eUIzUkhza2IxcEM1SkNwUDBPSU9ocTBzYUpseHhWSEFT?=
 =?utf-8?B?QUs1LytXYi9kSndKbzIvU2k3SDZ3Rmw5YTI4NXF0NDl3OUlnSUgzcERJMzlo?=
 =?utf-8?B?QWZ2NGpBTHNXZXR3YlpSbk5ob25LR1BSSjVEU29qbUJ0dFA4K3VXSWV6V2FL?=
 =?utf-8?B?bm5FcXFvbWVYZDdjTHFpTzE4MEU4YThWTWI1VEVVRUpiQXlMaUlVOUhjOXhk?=
 =?utf-8?B?ODBiYXdLd1ZwN1pxNmZNMHNCMnFTdjZ3OFRxM2hPZ3Y4NGwwN1JGRUxYSnhl?=
 =?utf-8?B?Nm4vb2xhL3VGQWJHWXRGMk1keGx3cFlBb3JxZmdNU0k5QUJxdXNWaldrdGxa?=
 =?utf-8?B?c2dQbmJFOXZPSThtVzM4emVxdUZPTnk5cFRMS29Ubnh2R0lkRUN0YWZlMEtF?=
 =?utf-8?B?REtsQ09veXppMUNjKzRQckVWU0t3SmJGYzhLYWpKU0R0SHZqOHorSk11bHB4?=
 =?utf-8?B?c1RvdWl3SHhPU252VzJxNlNaMGwxSk9BRmxwYUpYYXV3WCtJUmltM0JDSUtv?=
 =?utf-8?B?SW9LVlVWRkNhR09YUXdEdjhLcGp1YXhJd0hzTzIrYVZLcW9tK2tYZGVYRkVl?=
 =?utf-8?Q?eNalFPzuquCzaGUQ9tyUWm2pNx1E6M=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SmZMT1JvQWVNNkgvdEFBR2VoN0xYaVZIRkowWE9idjVzdG5lVFY2RmdIb0hm?=
 =?utf-8?B?NGp5TnRxWDBhLy9QOVhiT1g5V2RWb211Q2ZJT0dIVW04emVvSVhaUzZzeTA4?=
 =?utf-8?B?bzZaejVzaU5nNlh1emlLNHFHckIrUVY4QW8wWmZSNE1lbFNTZjVXZ3owb1M1?=
 =?utf-8?B?UW1oOFVUMmdOcFZYNGtGd0xRait2MVh6QmxaRlJESnVka1pqcUFCV1lNZHNY?=
 =?utf-8?B?Q2lTbGRRRTBsbVVNV1dDZnEyVzV3MEVJTThrMTRMQ3o0c3A2SGtadXJyK01p?=
 =?utf-8?B?YUd4RnM3R05NZE9WQTFHc0djb1Y1QnN1YXo3b3pnQWFXQndwVC95a0R0aWpu?=
 =?utf-8?B?S0JGL2F1RVlldXJ1ZnRYRXdtRlMrV0FsREQyL01hMDRWaGE3d3lSUSsyK08z?=
 =?utf-8?B?SjQxUzlKUlFSQ1hvVWNPQTlUdTRPbDVpYWdib3hqamk2bHpyTU8yWmlta3pj?=
 =?utf-8?B?WGlVbzZFN3BhamRkWUxNd1Vuc3pPYURKRlk4MWs1dkcreXlBM0xpT3E1S0Vo?=
 =?utf-8?B?TS92SUp6dkU5WStwZU1vV29CUXRHNWFkRStrTklsbVM2QUNiU1lCZFp3aGt0?=
 =?utf-8?B?YU1LWk92RXU5bE1VMUVNemVhcUJLbjJZS2p5R0k4TkNGYTdBWUdwNGMxYzVU?=
 =?utf-8?B?V2VxUWl5NC82aVhseFNDZnhjY2xnQVQ2dFVxdFhsWEhNUG9PN3JJeTRUQWli?=
 =?utf-8?B?UW5uMWxUWHVaQzZOUUVRUXB6czV1bWxXbS80enhPTkQ5aURaL2YxSjViU1N2?=
 =?utf-8?B?QUVsVnBwcWJlalUwbk9GQmIvTnU2N25jaEdib2VPVndGM093d1MvcHFsaUZp?=
 =?utf-8?B?VndDOVE3OHZMQ2dFYkEyQWlSdzR0Y0lvYjVkT0JUNk1Pc0E1bWMyL1JLUzNF?=
 =?utf-8?B?dlZ5UUNKT2FFcEVxZER0TE5SL2ZNNUpsSHdGOTJ2dEx5cHVxNHEydCtJaHFx?=
 =?utf-8?B?cHFZTVQ5RmEyQlVyYTdkU01XYldsM25GeFlXYUhpMWRBYWhnekwzSWFzazM0?=
 =?utf-8?B?dHp4bmpVWitvY0dnR0tzazliTEFVbTEydzRxOVVDbzdoOEZCZ093b2xhQXhO?=
 =?utf-8?B?ZUdlQmVDdVlwdDJ5NU01ZlZvTnRUVnhOOENySW5mdTkyckY2UFdGTHA0eUpU?=
 =?utf-8?B?MTZRWmdneWtQeThDL3oxUXBIdlVnOTJBY1o2UkdWdGgwN3VNRytia2RycEVo?=
 =?utf-8?B?ajJwY0Fwc1ZOYUQyeUsxUmNGSy9CbE5NN09ieWJuYjVRSXFpbnVEVFpFcXQ3?=
 =?utf-8?B?RHFNUVVPNTFGU2wzcytrQXd4dnptbzM0c0QxQ2ZoLzZ2cFVSRDJRYUhEOWJw?=
 =?utf-8?B?T2dVSFFxdVl1R1BqNW9BQXJSTElZbzB5UDgzSkg4N2IyWnoxYUdHTjdIRmJJ?=
 =?utf-8?B?WUNEZjRuNnZaaTQ2bVJBRUcwSW9vMll1MExoVVlUZjdNbUk0ZE9JRTdXNTFx?=
 =?utf-8?B?N3MvaVBFaEZ2SzlOZEhMbytISW5qelRROENLdVNIUVRvQWFnR1N2VGtmcnhl?=
 =?utf-8?B?S1hyS3k5dktnWU83Ti9oR0Yxem1FREtsNVBER2oyWXZVNk4zT1VYVitjQnVX?=
 =?utf-8?B?MjNtUHJ3dlk0cXhESTN6N0ppa0JPMSs0YWpmc3ZqZHp5NlVFbzZvUjArVXFi?=
 =?utf-8?B?Z2JORlVNNHlJdm5xOWRJOVh5bVZXTFh6L2lwRG5QbHU2cGlxM1ByZ1RrS2RG?=
 =?utf-8?B?SjBHQWFNYmlHTTJNcy82cmpHOU9DVzZYTXJ6eDRhNWxpaFZaR1BRQ2U2L05v?=
 =?utf-8?B?UXBWWEJmOEtEUEVCQWcwZlR2NkRoKzR2NU9zS0crYlN5VlNDVG9iYk1SOVp6?=
 =?utf-8?B?eTBWR2NVTmc5ZVdlcTMvVGVmS3EydlNnTko3L1B2N25YNm1Cd1dWcW95T2Uv?=
 =?utf-8?B?bUFyQnFkNU5LcVNsYTA1TzlrRTUxaDZLb09rdDdSYmRGZVJoVU03N1dxSExB?=
 =?utf-8?B?blpPZjVBQS9oeDB3MEY3bUhrTmxMc1ZLT2pVZ0plVWh5Y016aTV2alViN3Mw?=
 =?utf-8?B?L0ZGZFI3U0NmUHZJZGcvZGtQblNtYVMvbjJEbGMwR0JKbDZFQ05NNHUwdVFu?=
 =?utf-8?B?VC9qeTdDckRwdFN6YzZMMXlGR0E4ZUdZUzByRy9pMFlPMXc1VzZMWC9TNDRC?=
 =?utf-8?Q?CYTw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb38ce9f-8d61-472f-82cf-08ddad7a357b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2025 08:37:35.0968
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hURPr8dexF+VXaHPlA3dDKxto0KiTrq5J5Uhj2HzVPsKvmvpKnBe3eXjwBKK0T90i2aQfyjeADYL8OuIo45WDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6104

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBKdW5lIDEyLCAyMDI1
IDk6MDggUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4NCj4gQ2M6
IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgQW5kcmV3IENvb3Blcg0KPiA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPjsgeGVuLQ0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIHY1IDA4LzE4XSB4ZW4vY3B1OiBFeHBhbmQgY29yZSBmcmVxdWVuY3kgY2FsY3VsYXRp
b24gZm9yDQo+IEFNRCBGYW1pbHkgMUFoIENQVXMNCj4NCj4gT24gMjcuMDUuMjAyNSAxMDo0OCwg
UGVubnkgWmhlbmcgd3JvdGU6DQo+ID4gLS0tIGEveGVuL2FyY2gveDg2L2NwdS9hbWQuYw0KPiA+
ICsrKyBiL3hlbi9hcmNoL3g4Ni9jcHUvYW1kLmMNCj4gPiBAQCAtNTgzLDEyICs1ODMsNDAgQEAg
c3RhdGljIHZvaWQgYW1kX2dldF90b3BvbG9neShzdHJ1Y3QgY3B1aW5mb194ODYgKmMpDQo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICA6DQo+ID4gYy0+Y3B1X2NvcmVfaWQpOyAgfQ0KPiA+DQo+ID4gK3N0YXRpYyB1bnNpZ25lZCBp
bnQgYXR0cl9jb25zdCBhbWRfcGFyc2VfZnJlcSh1bnNpZ25lZCBpbnQgZmFtaWx5LA0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCB2YWx1
ZSkNCj4gPiArew0KPiA+ICsgICB1bnNpZ25lZCBpbnQgZnJlcSA9IDA7DQo+ID4gKw0KPiA+ICsg
ICBzd2l0Y2ggKGZhbWlseSkgew0KPiA+ICsgICBjYXNlIDB4MTAgLi4uIDB4MTY6DQo+ID4gKyAg
ICAgICAgICAgZnJlcSA9ICgoKHZhbHVlICYgMHgzZikgKyAweDEwKSAqIDEwMCkgPj4gKCh2YWx1
ZSA+PiA2KSAmIDcpOw0KPiA+ICsgICAgICAgICAgIGJyZWFrOw0KPiA+ICsNCj4gPiArICAgY2Fz
ZSAweDE3IC4uLiAweDE5Og0KPiA+ICsgICAgICAgICAgIGZyZXEgPSAoKHZhbHVlICYgMHhmZikg
KiAyNSAqIDgpIC8gKCh2YWx1ZSA+PiA4KSAmIDB4M2YpOw0KPiA+ICsgICAgICAgICAgIGJyZWFr
Ow0KPiA+ICsNCj4gPiArICAgY2FzZSAweDFBOg0KPiA+ICsgICAgICAgICAgIGZyZXEgPSAodmFs
dWUgJiAweGZmZikgKiA1Ow0KPiA+ICsgICAgICAgICAgIGJyZWFrOw0KPiA+ICsNCj4gPiArICAg
ZGVmYXVsdDoNCj4gPiArICAgICAgICAgICBwcmludGsoWEVOTE9HX0VSUg0KPiA+ICsgICAgICAg
ICAgICAgICAgICAiVW5zdXBwb3J0ZWQgY3B1IGZhbWlseSAweCV4IG9uIGNwdWZyZXEgcGFyc2lu
ZyIsDQo+ID4gKyAgICAgICAgICAgICAgICAgIGZhbWlseSk7DQo+DQo+IEkgdGhpbmsgSSByZXF1
ZXN0ZWQgYmVmb3JlIChlbHNld2hlcmUpIHRvIHByZWZlciAlI3ggb3ZlciAweCV4Lg0KPg0KPiBI
b3dldmVyLCB3aHkgdGhlIGxvZyBtZXNzYWdlPyBXaXRoIC4uLg0KPg0KPiA+ICsgICAgICAgICAg
IGJyZWFrOw0KPiA+ICsgICB9DQo+ID4gKw0KPiA+ICsgICByZXR1cm4gZnJlcTsNCj4gPiArfQ0K
PiA+ICsNCj4gPiAgdm9pZCBhbWRfbG9nX2ZyZXEoY29uc3Qgc3RydWN0IGNwdWluZm9feDg2ICpj
KSAgew0KPiA+ICAgICB1bnNpZ25lZCBpbnQgaWR4ID0gMCwgaDsNCj4gPiAgICAgdWludDY0X3Qg
aGksIGxvLCB2YWw7DQo+ID4NCj4gPiAtICAgaWYgKGMtPng4NiA8IDB4MTAgfHwgYy0+eDg2ID4g
MHgxOSB8fA0KPiA+ICsgICBpZiAoYy0+eDg2IDwgMHgxMCB8fCBjLT54ODYgPiAweDFBIHx8DQo+
DQo+IC4uLiB0aGlzIGNvbmRpdGlvbiwgdGhlcmUgc2ltcGx5IGNvdWxkIGJlIEFTU0VSVF9VTlJF
QUNIQUJMRSgpIHRoZXJlPyBIYXBweQ0KPiB0byBhZGp1c3Qgd2hpbGUgY29tbWl0dGluZywgc28g
bG9uZyBhcyB5b3UgYWdyZWUuIFdpdGggdGhlIGFkanVzdG1lbnQ6DQo+IFJldmlld2VkLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+DQoNCkFncmVlZCwgdGh4DQoNCj4gSmFu
DQo=

