Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7925B65F1
	for <lists+xen-devel@lfdr.de>; Tue, 13 Sep 2022 05:02:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406125.648531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXwBd-0001U7-B6; Tue, 13 Sep 2022 03:02:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406125.648531; Tue, 13 Sep 2022 03:02:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXwBd-0001RE-83; Tue, 13 Sep 2022 03:02:09 +0000
Received: by outflank-mailman (input) for mailman id 406125;
 Tue, 13 Sep 2022 03:02:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qMAb=ZQ=amd.com=Ruili.Ji@srs-se1.protection.inumbo.net>)
 id 1oXwBc-0001R8-67
 for xen-devel@lists.xenproject.org; Tue, 13 Sep 2022 03:02:08 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2064.outbound.protection.outlook.com [40.107.220.64])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71c96c04-3310-11ed-a31c-8f8a9ae3403f;
 Tue, 13 Sep 2022 05:02:05 +0200 (CEST)
Received: from BL1PR12MB5993.namprd12.prod.outlook.com (2603:10b6:208:399::9)
 by SJ0PR12MB5470.namprd12.prod.outlook.com (2603:10b6:a03:3bd::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Tue, 13 Sep
 2022 03:02:01 +0000
Received: from BL1PR12MB5993.namprd12.prod.outlook.com
 ([fe80::7189:8652:da69:2158]) by BL1PR12MB5993.namprd12.prod.outlook.com
 ([fe80::7189:8652:da69:2158%7]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 03:02:01 +0000
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
X-Inumbo-ID: 71c96c04-3310-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CcJpAWxHp1YcHlSBrGMyCh7IPCE7B/tZFfQky92qWTWEOU+gliSzCp0EweCEAQxFGWXSJecg3pQ5aLWxkdUjxxOhP9PRl0COyF2+Krs7LDj3x+K6+9zNyTwmWRuNiMBi/mGxya3B93FdM9jrZe7F0dpRdy/pyV1DclCVRJVig7c05xJc6tC7rRZmXO2osenq1VFrkFXC2Jz/aMNJkaU0967Ug8i75wpObcjYUBqZapuSAV5rNtPUW7Ocw2Tfpacrme6EGba2Z8Lz0ZhDuHHLGr/ao6XEE5Ir6Qk78v+zxFG1o0b+t48krFDBMp/y6ddwSgEAwha9848RA4JjgsS+AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gkvIyBMgo/NmIFYsjc24BRclBG2sUpVhlh4owhI0ob8=;
 b=O+3f+HCPYK3imDVdGaHqBWtFzNU7hveaRnuTDNMnaU9gDmnFtIo9L/J9PaS1ct/KoFB81qpj8PFoPA3XLog/1XEISMsfoBj9oWU9lNlECSuSw3XsWjnPGIrsaST75reClSfcJWnj6mkxoKKjdIFlzVo0pgByAuB1K9qwPfwNkq2MzZig5vwUSGVoIIZdWCNqbFISJK2jsJPwOEI8ms+rI17+0fl76h5CDsZoCrDmhkanmaO9iHYBXmWP5Q43v2O0ESDnYeH5EYt9HwFZ6kg7wkXK/UkraZhZa69ANPfwJj21NjEKWZoWs6yZqsjN+kPAkYR2Tc75SUVKePYfAPKkLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gkvIyBMgo/NmIFYsjc24BRclBG2sUpVhlh4owhI0ob8=;
 b=RK0gWz8rGzuDT2Ec8scqJZLFyMRGInFxp3rkQRmPMxq+xbLmSZbM4RK5JMpVB7vGIUgSH1VVJdCdg4oDatItVZPMOmYZR69uxqAmbL5GqqV3br9SQ5I+EqIZbhqfPFbdyc6EewUhr+ey2Clo13TxEkcaLuUOnDdcCpIkf7KkmPM=
From: "Ji, Ruili" <Ruili.Ji@amd.com>
To: Paul Durrant <paul@xen.org>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
CC: "Liu, Aaron" <Aaron.Liu@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH] hw/xen: set pci Atomic Ops requests for passthrough
 device
Thread-Topic: [PATCH] hw/xen: set pci Atomic Ops requests for passthrough
 device
Thread-Index: AdjBw9S5XjagBB9xT0W01YXm2Fq4yQAkLQ9gATHwuGA=
Date: Tue, 13 Sep 2022 03:02:01 +0000
Message-ID:
 <BL1PR12MB5993DC46EDF5D01ED20E2E179B479@BL1PR12MB5993.namprd12.prod.outlook.com>
References:
 <BL1PR12MB599341DC55BA53FE588DE14E9B7E9@BL1PR12MB5993.namprd12.prod.outlook.com>
 <BL1PR12MB5993C52DD9A881FACE6FA28D9B419@BL1PR12MB5993.namprd12.prod.outlook.com>
In-Reply-To:
 <BL1PR12MB5993C52DD9A881FACE6FA28D9B419@BL1PR12MB5993.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=149f7e60-4d0f-4975-8ab3-8497009eb09c;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-09-06T07:36:17Z;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5993:EE_|SJ0PR12MB5470:EE_
x-ms-office365-filtering-correlation-id: f6636885-7a33-4abe-0a97-08da9534545b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 s3Sc6abCfjKTil2V9hICO9dRGrh2Nu2Ab/GFMnsSq5fPXiff2ZrgK1TCB/Pv4dxWtNyADjwAifc6Htjo7Od01Tltv72UiYgZbmOu2bSkLNwwieYjw8nYKRTLv1r3P3+2W2eOQZS/Xa2TSmC+2vlt+45gSie9/pAaAN+aL71IiuRUjyiy0HrZ1FE4BJUtZNM8UMJSV1MpBpdXIg0Xvv4i0gLYesXm6w0iMU4ad6rw3djzdceS7MHMKsAJsg8/PYpxQ3eDAU7h08ElJ173JveumscVUxso3X6Xq6vSMnkaI6lEAY6Z515IHwBGLBXL5NbLdXV9lreh/OpW9XQBUnbJKMspp3mxzCM8B5vu/XvHBTclto/yFqoke5WzRp6+6s0x41In/HSJeaZJi8V7O2pEjRNjUYppCrm6wp+JzVSIiC6tWoIj04hC9GdDnieaqkT7F/ySIQMnX1puT4PtZQX65pRotqvoCFspbgRc47mPkj26AM2PNVpRQNFAqIW4BVnRn3uCzj8c2q2OLeIxkbrvHJKtygX1W/hnHf2aq9zjFYv5L4ABLsSJw16LT0nymcjmyeFjfxGSKalJs+tMqstdX1QPStKI51+pqQK7rhZuBkPbj88vIXw6ZNp5IEkjyiWQWMKJ0ac2WY6wChw0mmGnfYXN9eTTyh3nhfwSJw5yPPVUm2sj/gNjUzI2OR+2pjRl9X+bGmodC5RgP/6aiunnqT52l+EA0tWmFCShfaL28fYUePv8xkUtPZOlY/rVF0wRbQqjGYiM4zg99+adwxElHFd2+FelNQ0K+bJx78rz0Vs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5993.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(366004)(346002)(376002)(39860400002)(451199015)(966005)(186003)(86362001)(9686003)(53546011)(316002)(41300700001)(64756008)(478600001)(110136005)(7696005)(33656002)(8936002)(122000001)(83380400001)(54906003)(52536014)(38100700002)(4326008)(66446008)(76116006)(66556008)(71200400001)(6506007)(5660300002)(66946007)(26005)(8676002)(66476007)(38070700005)(166002)(55016003)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?aTI1VmJ3NU9pU2syeG00QmZRd1lkZWtLK1NuOWttYzYvN09xUnlhVXVR?=
 =?iso-2022-jp?B?VytBcSt3VlRXODlSRkN6WGg0TkpuTXVDekxrVDFPRDdnRWhGTmFlenFE?=
 =?iso-2022-jp?B?UEVFclBHKzJEcW5DNWdFZ3RBdGE2YVVteHl0RWt2OEJwZzN0RWl1NUxh?=
 =?iso-2022-jp?B?RU1Ea3FBSGNSclRaZWgrVWs2U3ZwdmpMMk9xbm4yWW9sTmdkdUtRSCsv?=
 =?iso-2022-jp?B?U0tPeHNnVWJ2bXlYMDF2Q012VHdkdmdhdkJPM21JTnlqVVcxZmIyNkZ1?=
 =?iso-2022-jp?B?eGRhNCtHbmZWQ05DQm1mK1N3aVNhZmI4QXFHakRPcERVRmlnMXFueUIz?=
 =?iso-2022-jp?B?bEtETm84UzJVQW1NOTVvTlMwcmdHcVhJb0dBZU1RQ3daTTBqenJZek1l?=
 =?iso-2022-jp?B?SEw4M3Izb3dSTXpvZG5BUjdqTUdVVWNSOGFiNHEzbjB3cHEwNHVwZnZZ?=
 =?iso-2022-jp?B?WWZIcitWNkNYazd2TUNhckZVWDFCbzg5VVd2N0crZUh2dHl1aGRIWmx1?=
 =?iso-2022-jp?B?S3IxZHJTZ2s1dTdON2h6MjJ1WmErM0dOUnJBNTIrQS9uYmVzYzBrKyt2?=
 =?iso-2022-jp?B?UXBBQXl4blp1SFNtcm1YOEdUT3N0VmNzb3VnMlErbkZOMFZjTkNUYTk2?=
 =?iso-2022-jp?B?ZURjTUpOYXdrMkFFZFNPOC82VnIrV1AxRzFkWW9aTTlKN0lmWlhtb0dM?=
 =?iso-2022-jp?B?dWtENEFvajgrUWZQSFBFWmh2d0tVb01hL0xsTTlzdlVPOVNnMk13Umc0?=
 =?iso-2022-jp?B?RGNEWXNkYWNSVkc2ekhEODRrZER3cVV1Yk96SEh0alNIM0VTQU1qbXlZ?=
 =?iso-2022-jp?B?M3ZDdWNYNW5UTkl4eUNGdTZpUU9TcVNyN01QOFdrVUpUUEwzNkhud1Y2?=
 =?iso-2022-jp?B?YnpBM1BGMFNPaDdMRlBoNUpTVkN3ZktKYTJkbnZhRzRCeDZqeVV4NFF2?=
 =?iso-2022-jp?B?SUo4NklTYloxQmdHSENtVWVLc3h0RmZBVFlaN0t6cjRnTlY0OStHUWpm?=
 =?iso-2022-jp?B?WTRBT0g0a3FZNzN0ajZwZjlzZEZyV0RUNitjVUVDUXA1ak1vZjZmRE1m?=
 =?iso-2022-jp?B?a0Q2WEhCa3NMM1JtNU1RbzFLekxuUFNEbDExamVCbTBTcDQ5bURRcjha?=
 =?iso-2022-jp?B?V0R1ZkFnOTVDeENtdEFVYWhjL3I0SGNzQXpQMlhOZm5QcnBVZTlDYnBR?=
 =?iso-2022-jp?B?ZVlZQzE3cW5Qa1pTUHp5VnlUaUQxYndBMUJ0Qk1RRW02MTNPdWV3aGpJ?=
 =?iso-2022-jp?B?Zkc0TUd1Rjl3Q2M3ZXRxLzRVQi9FS3dFR3kyZDBpdVdxaUtuYVB1TXhI?=
 =?iso-2022-jp?B?UnA0aytVOWw4cTgzbENJRG12VlBXY3hqK1RVRjgyRU1zWVB1WmovZkRi?=
 =?iso-2022-jp?B?cVY3OE5mN0wreWhyRXd2ZTJRNmw4bWxYVXoxYld4SVgyOFIyTjVFTnVv?=
 =?iso-2022-jp?B?SmZiQ2hYNGN2Nlc4NnRrVTk3UlhYOE15SWdKVnZVZjVPTGUzYU1BU2pa?=
 =?iso-2022-jp?B?SW1LNEEyWHpDUGJtbTQ0cVdlc3FKU2dleS93UjJRU053R0lsdFREb2Fp?=
 =?iso-2022-jp?B?VSt4SkFUTm01UEtPc1IwY0dTWlNWenZ6bWFJemllNUIvdUd4ZVJXSzR6?=
 =?iso-2022-jp?B?cElnckdhTm1xNVFrNXp2ZmEyVTlqRHZPSFJwWkQwZ2NKTFBBYXFyZVJE?=
 =?iso-2022-jp?B?UDBzNjFCa2JMdXlFRUtCRmorMHR6K25qTUxaMzdiV3BTKzJ1N0FrNjZS?=
 =?iso-2022-jp?B?OSsrc2lDajV1Yi9lMGpjWVJUcmM1TFhxMGJrRDVjREpORVVqZVc4NlVQ?=
 =?iso-2022-jp?B?Y2RnVE85SmZ1K0VyNjJaTXdKZ0ZWNzRtb2JVYU40ZFBaTXpIa1NRNUlq?=
 =?iso-2022-jp?B?MW9aNXhiT3Vyek0vV3FVKzVCYXFyNUEydzM2U1ZTSCtyK3RhSUZNa3pP?=
 =?iso-2022-jp?B?WXpKVVhkY2hzQ3NLUittQ0ZCUFFpcEZDM2UzaFk0ZGdJZ2p0ZzBzandD?=
 =?iso-2022-jp?B?TDJwWUVpOHcvbThkNHVxRTFHVGRab1d0VzRJNGJtdWg4UExyNXB6V085?=
 =?iso-2022-jp?B?SVg1WGJadks0N3RsS0NnSDlFTWFQUmxrREMwK2xXcTBablY2cGgwU0tB?=
 =?iso-2022-jp?B?elh0QU5TbjYxa2I4TWNmYlk1RkxOSDFXREkyekJUck5pR2JZNmVVdVBI?=
 =?iso-2022-jp?B?ZUpLMkpVa2lkaGl1L09nVU5udWVGTTl5OWV3TzhZck42dGpLT2NKMnVi?=
 =?iso-2022-jp?B?OWwvNkZJYktSVDdNQ2dUWStaRDVtRDgxVXB0U0tkSU83eUx0amNRZHU0?=
 =?iso-2022-jp?B?K3NzUA==?=
Content-Type: multipart/alternative;
	boundary="_000_BL1PR12MB5993DC46EDF5D01ED20E2E179B479BL1PR12MB5993namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5993.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6636885-7a33-4abe-0a97-08da9534545b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2022 03:02:01.2280
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dw4VW8bG9CBpYjMk+loELpJCu9gjJ7IOvP0boZHIDBOCH1ltdEq8f8gU/8rOQwM+LygRHuh9VYf/bWLSrSEm2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5470

--_000_BL1PR12MB5993DC46EDF5D01ED20E2E179B479BL1PR12MB5993namp_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]

Hi Paul,

Could you help to review this patch?

Thanks
From: Ji, Ruili
Sent: 2022=1B$BG/=1B(B9=1B$B7n=1B(B7=1B$BF|=1B(B 9:04
To: 'Paul Durrant' <paul@xen.org>; 'qemu-devel@nongnu.org' <qemu-devel@nong=
nu.org>
Cc: Liu, Aaron <Aaron.Liu@amd.com>; 'xen-devel@lists.xenproject.org' <xen-d=
evel@lists.xenproject.org>
Subject: RE: [PATCH] hw/xen: set pci Atomic Ops requests for passthrough de=
vice

FYI

From: Ji, Ruili
Sent: 2022=1B$BG/=1B(B9=1B$B7n=1B(B6=1B$BF|=1B(B 15:40
To: qemu-devel@nongnu.org<mailto:qemu-devel@nongnu.org>
Cc: Liu, Aaron <Aaron.Liu@amd.com<mailto:Aaron.Liu@amd.com>>
Subject: [PATCH] hw/xen: set pci Atomic Ops requests for passthrough device

From c54e0714a1e1cac7dc416bd843b9ec7162bcfc47 Mon Sep 17 00:00:00 2001
From: Ruili Ji ruili.ji@amd.com<mailto:ruili.ji@amd.com>
Date: Tue, 6 Sep 2022 14:09:41 +0800
Subject: [PATCH] hw/xen: set pci Atomic Ops requests for passthrough device

Make guest os access pci device control 2 reg for passthrough device
as struct XenPTRegInfo described in the file hw/xen/xen_pt.h.
/* reg read only field mask (ON:RO/ROS, OFF:other) */
uint32_t ro_mask;
/* reg emulate field mask (ON:emu, OFF:passthrough) */
uint32_t emu_mask;

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1196
Signed-off-by: Aaron.Liu@amd.com<mailto:Aaron.Liu@amd.com>
Signed-off-by: ruili.ji@amd.com<mailto:ruili.ji@amd.com>
---
hw/xen/xen_pt_config_init.c | 4 ++--
1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index c5c4e943a8..adc565a00a 100644
--- a/hw/xen/xen_pt_config_init.c
+++ b/hw/xen/xen_pt_config_init.c
@@ -985,8 +985,8 @@ static XenPTRegInfo xen_pt_emu_reg_pcie[] =3D {
         .offset     =3D 0x28,
         .size       =3D 2,
         .init_val   =3D 0x0000,
-        .ro_mask    =3D 0xFFE0,
-        .emu_mask   =3D 0xFFFF,
+        .ro_mask    =3D 0xFFA0,
+        .emu_mask   =3D 0xFFBF,
         .init       =3D xen_pt_devctrl2_reg_init,
         .u.w.read   =3D xen_pt_word_reg_read,
         .u.w.write  =3D xen_pt_word_reg_write,
--
2.34.1


--_000_BL1PR12MB5993DC46EDF5D01ED20E2E179B479BL1PR12MB5993namp_
Content-Type: text/html; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-2022-=
jp">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Microsoft YaHei";
	panose-1:2 11 5 3 2 2 4 2 2 4;}
@font-face
	{font-family:"\@Microsoft YaHei";}
@font-face
	{font-family:"MS PGothic";
	panose-1:2 11 6 0 7 2 5 8 2 4;}
@font-face
	{font-family:"\@MS PGothic";}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:JA;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only - General]<br>
</p>
<br>
<div>
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:ZH-CN">Hi Paul,<=
br>
<br>
Could you help to review this patch?<br>
<br>
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:ZH-CN">Thanks<o:=
p></o:p></span></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b>From:</b> Ji, Ruili <br>
<b>Sent:</b> 2022<span lang=3D"JA" style=3D"font-family:&quot;MS PGothic&qu=
ot;,sans-serif">=1B$BG/=1B(B</span>9<span lang=3D"JA" style=3D"font-family:=
&quot;MS PGothic&quot;,sans-serif">=1B$B7n=1B(B</span>7<span lang=3D"JA" st=
yle=3D"font-family:&quot;MS PGothic&quot;,sans-serif">=1B$BF|=1B(B</span> 9=
:04<br>
<b>To:</b> 'Paul Durrant' &lt;paul@xen.org&gt;; 'qemu-devel@nongnu.org' &lt=
;qemu-devel@nongnu.org&gt;<br>
<b>Cc:</b> Liu, Aaron &lt;Aaron.Liu@amd.com&gt;; 'xen-devel@lists.xenprojec=
t.org' &lt;xen-devel@lists.xenproject.org&gt;<br>
<b>Subject:</b> RE: [PATCH] hw/xen: set pci Atomic Ops requests for passthr=
ough device<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">FYI<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b>From:</b> Ji, Ruili <br>
<b>Sent:</b> 2022<span lang=3D"ZH-CN" style=3D"font-family:&quot;Microsoft =
YaHei&quot;,sans-serif;mso-fareast-language:ZH-CN">=1B$BG/=1B(B</span>9<spa=
n lang=3D"ZH-CN" style=3D"font-family:&quot;Microsoft YaHei&quot;,sans-seri=
f;mso-fareast-language:ZH-CN">=1B$B7n=1B(B</span>6<span lang=3D"ZH-CN" styl=
e=3D"font-family:&quot;Microsoft YaHei&quot;,sans-serif;mso-fareast-languag=
e:ZH-CN">=1B$BF|=1B(B</span>
 15:40<br>
<b>To:</b> <a href=3D"mailto:qemu-devel@nongnu.org">qemu-devel@nongnu.org</=
a><br>
<b>Cc:</b> Liu, Aaron &lt;<a href=3D"mailto:Aaron.Liu@amd.com">Aaron.Liu@am=
d.com</a>&gt;<br>
<b>Subject:</b> [PATCH] hw/xen: set pci Atomic Ops requests for passthrough=
 device<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">From c54e0714a1e1cac7dc416bd843b9ec7162bcfc47 Mon Se=
p 17 00:00:00 2001<o:p></o:p></p>
<p class=3D"MsoNormal">From: Ruili Ji <a href=3D"mailto:ruili.ji@amd.com">r=
uili.ji@amd.com</a><o:p></o:p></p>
<p class=3D"MsoNormal">Date: Tue, 6 Sep 2022 14:09:41 +0800<o:p></o:p></p>
<p class=3D"MsoNormal">Subject: [PATCH] hw/xen: set pci Atomic Ops requests=
 for passthrough device<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Make guest os access pci device control 2 reg for pa=
ssthrough device<o:p></o:p></p>
<p class=3D"MsoNormal">as struct XenPTRegInfo described in the file hw/xen/=
xen_pt.h.<o:p></o:p></p>
<p class=3D"MsoNormal">/* reg read only field mask (ON:RO/ROS, OFF:other) *=
/<o:p></o:p></p>
<p class=3D"MsoNormal">uint32_t ro_mask;<o:p></o:p></p>
<p class=3D"MsoNormal">/* reg emulate field mask (ON:emu, OFF:passthrough) =
*/<o:p></o:p></p>
<p class=3D"MsoNormal">uint32_t emu_mask;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Resolves: <a href=3D"https://gitlab.com/qemu-project=
/qemu/-/issues/1196">
https://gitlab.com/qemu-project/qemu/-/issues/1196</a><o:p></o:p></p>
<p class=3D"MsoNormal">Signed-off-by: <a href=3D"mailto:Aaron.Liu@amd.com">=
Aaron.Liu@amd.com</a><o:p></o:p></p>
<p class=3D"MsoNormal">Signed-off-by: <a href=3D"mailto:ruili.ji@amd.com">r=
uili.ji@amd.com</a><o:p></o:p></p>
<p class=3D"MsoNormal">---<o:p></o:p></p>
<p class=3D"MsoNormal">hw/xen/xen_pt_config_init.c | 4 ++--<o:p></o:p></p>
<p class=3D"MsoNormal">1 file changed, 2 insertions(+), 2 deletions(-)<o:p>=
</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xe=
n_pt_config_init.c<o:p></o:p></p>
<p class=3D"MsoNormal">index c5c4e943a8..adc565a00a 100644<o:p></o:p></p>
<p class=3D"MsoNormal">--- a/hw/xen/xen_pt_config_init.c<o:p></o:p></p>
<p class=3D"MsoNormal">+++ b/hw/xen/xen_pt_config_init.c<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -985,8 +985,8 @@ static XenPTRegInfo xen_pt_emu_r=
eg_pcie[] =3D {<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .of=
fset&nbsp;&nbsp;&nbsp;&nbsp; =3D 0x28,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .si=
ze&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D 2,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .in=
it_val&nbsp;&nbsp; =3D 0x0000,<o:p></o:p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .ro_mask=
&nbsp;&nbsp;&nbsp; =3D 0xFFE0,<o:p></o:p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .emu_mas=
k&nbsp;&nbsp; =3D 0xFFFF,<o:p></o:p></p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .ro_mask=
&nbsp;&nbsp;&nbsp; =3D 0xFFA0,<o:p></o:p></p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .emu_mas=
k&nbsp;&nbsp; =3D 0xFFBF,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .in=
it&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D xen_pt_devctrl2_reg_init,<o:p></=
o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .u.=
w.read&nbsp;&nbsp; =3D xen_pt_word_reg_read,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .u.=
w.write&nbsp; =3D xen_pt_word_reg_write,<o:p></o:p></p>
<p class=3D"MsoNormal">-- <o:p></o:p></p>
<p class=3D"MsoNormal">2.34.1<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</body>
</html>

--_000_BL1PR12MB5993DC46EDF5D01ED20E2E179B479BL1PR12MB5993namp_--

