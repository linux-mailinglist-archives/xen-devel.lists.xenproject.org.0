Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4236C5B85EF
	for <lists+xen-devel@lfdr.de>; Wed, 14 Sep 2022 12:08:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406911.649324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYPJQ-0006CH-F4; Wed, 14 Sep 2022 10:08:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406911.649324; Wed, 14 Sep 2022 10:08:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYPJQ-00068n-AE; Wed, 14 Sep 2022 10:08:08 +0000
Received: by outflank-mailman (input) for mailman id 406911;
 Wed, 14 Sep 2022 10:08:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sTap=ZR=amd.com=Ruili.Ji@srs-se1.protection.inumbo.net>)
 id 1oYPJO-00068h-19
 for xen-devel@lists.xenproject.org; Wed, 14 Sep 2022 10:08:06 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2083.outbound.protection.outlook.com [40.107.94.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1dedf6a3-3415-11ed-9761-273f2230c3a0;
 Wed, 14 Sep 2022 12:08:04 +0200 (CEST)
Received: from BL1PR12MB5993.namprd12.prod.outlook.com (2603:10b6:208:399::9)
 by SJ1PR12MB6171.namprd12.prod.outlook.com (2603:10b6:a03:45a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.20; Wed, 14 Sep
 2022 10:07:59 +0000
Received: from BL1PR12MB5993.namprd12.prod.outlook.com
 ([fe80::7189:8652:da69:2158]) by BL1PR12MB5993.namprd12.prod.outlook.com
 ([fe80::7189:8652:da69:2158%7]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 10:07:59 +0000
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
X-Inumbo-ID: 1dedf6a3-3415-11ed-9761-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XEOrQx9G+VzoB3p3Nw5TxLvBc0Da2+wspTyv7bPAzvcfigdJRN09WyBf+LdRrzaCSjaFkObxQRlGQFR8awRYnzeBigrRmHQ/G9Z44Fr5TcUWe2vqyAGdX3zA/ngWsofXRoYTil3buxZribliwpbeWzMtYnJTNpl0WUFDUBnWiVx8VEppfI7f0wg+K5N3dncFMJ6TKiDx56o68n16a4zCFIbUdPrDLc4lrjayJVtVI/ctETZ5uuCrig8Rnd6Ua7nrGQl4ip3hdI6hXtkvlJWc98TcghSrRujsty0Ww3FyDP+deRTpa1lrze84/456RHMhcm/OdjmVdJ2Oy73EWXxJjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQlRZp/LsDa23blJpgPD4b7fA8JpfcfZhwrf8HpH2rI=;
 b=k1Z+6bWx9XD0RrjGNsNVLWWyi5nRdiQx0RIC3x/edY7flc/l5TA4JNLElW0GfyNoOAB6tWaaJVxk/8xifAfffHsLLKTNyn/FdXPy3Ys01x6XSHIw0OvyuzUnhnPSv5cUAQGUdnP9n+J0fC2jmG+kuyIyhi7Reh8LR+0dLHUOuDAXYRXIW47js8kRLHmgrYAL0Y/BeZFaYvo39wUz5Jx3ZBLFpVSicKlIRsV7MxvifFB0+wrfrX8p8e2M7882P832Gl/kJd4g1oBJA6bATf3W6L4WwKjkeREW6uVuSwlYLdcEy60Jej6elfK3Jd0UvZ5ln56SbsMrprJipRP5IOreRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQlRZp/LsDa23blJpgPD4b7fA8JpfcfZhwrf8HpH2rI=;
 b=X3wBkhBt5OC7e5a30NOz8oWRF5BJbZjgctoJuaLRZ08azf4HCTy7dhXHddTv8rYB+aEJONY9vYopvOYPActqlfURjjgmY57GJSbPLqt5yA33tAdrt2Mt/hR44NZuz5M4nLzJ/Ec81BDmljaxuavpZ/9R2BTF18M8Zz4GK2fhuC8=
From: "Ji, Ruili" <Ruili.Ji@amd.com>
To: Paul Durrant <xadimgnik@gmail.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
CC: "Liu, Aaron" <Aaron.Liu@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH] hw/xen: set pci Atomic Ops requests for passthrough
 device
Thread-Topic: [PATCH] hw/xen: set pci Atomic Ops requests for passthrough
 device
Thread-Index: AdjBw9S5XjagBB9xT0W01YXm2Fq4yQAkLQ9gATHwuGAAP0mxgAAB/V+Q
Date: Wed, 14 Sep 2022 10:07:59 +0000
Message-ID:
 <BL1PR12MB59937394D936EE7EDF5E3F809B469@BL1PR12MB5993.namprd12.prod.outlook.com>
References:
 <BL1PR12MB599341DC55BA53FE588DE14E9B7E9@BL1PR12MB5993.namprd12.prod.outlook.com>
 <BL1PR12MB5993C52DD9A881FACE6FA28D9B419@BL1PR12MB5993.namprd12.prod.outlook.com>
 <BL1PR12MB5993DC46EDF5D01ED20E2E179B479@BL1PR12MB5993.namprd12.prod.outlook.com>
 <8be84a25-c31d-fd88-f913-c03c15046a55@xen.org>
In-Reply-To: <8be84a25-c31d-fd88-f913-c03c15046a55@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=fe71ddb2-53de-4503-92e7-b763c759a0b3;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-09-14T10:04:41Z;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5993:EE_|SJ1PR12MB6171:EE_
x-ms-office365-filtering-correlation-id: a13cb2c6-4007-48a8-4bf2-08da96390096
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ITtvtnb2jLdJqsH9JHV+lVQfdmoR8JqdhLqK1t9yOgl+8rn1Okfr+aV5DKC5kOJUaqvXgZFeEuyG2r40T8ef4xxbk3FXjoYvGtPVG37458iNbD8FZ8odnBiEeYhB9LG/IVet2nX4LsZZNxpjpONkDU8plt5A+uyrJgzvtGOv9FhqnC2ePzXeiK8n9Zj9j0CIA9rCCwVbxGCg7z7rEsGaFHwOcG7twSPbniL0mHu51F0X+yoD9dp3SXh8fyu1Bi7WTGeKdSJw4xoGmtyNGJ+9DkHY5FB0gEBuWuMZaLex4cyV5onlg4J5hASg2tw2EAdWuQ3uGQCu2/0rnDEFrQZ7P/lOqQewLuqWt4JnIKmRkjh6LUBfcPVN2uAWBFKtbHc9g4FenfKfpblwu5d79boi2mSmKo0M1AaB5XhfQOYIQ7x4dW8NstmnFYUn3Ti48w3kizdTlRLwNKkeQHdQ69LvW5FPpvU9F2vKp/vv8v9HTd+ZTcQwBLVGt1ttEn28t1s1X5yARmzwrZgesRyCpeOGSWQzvGSvseeR/h75GfamV8onh/ChjDe7IBtSffNRXubJh9LDeEZLjDLufPn3rNYbGcGbyrTLedxILcHUArGHIXaNn7w0zlldj++RzT9xqh17jkxV0nlm166I3TyhAfX++6mlfryYyFlOgYCAPtOMQCl14NrCYKEVACqExOwQ1pDKH6KJdv9fzczvjEmvkcG7GzBkmB7GIQ/NvQwHWxR2p/JXmyAL8jYa5YeaugRYgVi+r63hkQ4bfNlYpvrNm2o5YznfR8Giaw7qYmr9j1N6cfrOV1BU6acoRuQh+5f65lVVGoZVVzRjHmb6izqu1Q0lAw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5993.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(136003)(376002)(366004)(451199015)(54906003)(186003)(66946007)(6506007)(26005)(4326008)(53546011)(9686003)(478600001)(316002)(71200400001)(45080400002)(86362001)(52536014)(38070700005)(66476007)(64756008)(41300700001)(55016003)(8676002)(76116006)(110136005)(66446008)(5660300002)(83380400001)(7696005)(66556008)(966005)(122000001)(38100700002)(8936002)(2906002)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?U1UxaHdoUElDRjEyVzhpVHF4SWlPS1FDQUh4aWQ4NXpzbnY2Vmwzam9C?=
 =?iso-2022-jp?B?SUR5bjhxUzdhNjVWWTNQeUNiblNaRGhuWkFlVC9DRFRTQjFZMW13TWtr?=
 =?iso-2022-jp?B?cm1MSVk3YkZyRHh2eXBCYXl2K2lIdlVZUDBuYVFrZTM1VHR4VXZ6UThG?=
 =?iso-2022-jp?B?Mk5CTVdhenhMMEFiaEx1N1VxeDJxT3k4RWxqdXg4amV6MHpQcXlHVGR0?=
 =?iso-2022-jp?B?QnZRc0JIZzJsckF3ZStHalgvMDFERmhoS1dlS0Jja3Z5YXlwVlZjSU04?=
 =?iso-2022-jp?B?emkvR0xCKzBGY1Zack5jeDRaaFJpbm9CdGNISWJ6RmJveGh0ZG1URE84?=
 =?iso-2022-jp?B?aldGZ0U3cWlid0pCOUxpdk5NRE5HdWwrb2UrMEUxWXlNQ3dub2JvRUNL?=
 =?iso-2022-jp?B?TWlMV0lpREp0WTRBVVBhWitNRTExOFlRajlBeGg3RjZnTUp2SUVGQ1h1?=
 =?iso-2022-jp?B?RjhIS1R5RzBQOFhRSGdHMVlwZEpPS2tUdjJua1RqR2xLQ2ZJOVVjKzBS?=
 =?iso-2022-jp?B?T1pVTmMrcWZadnBVaDhhVDg2a3cva3FRQ1lTNCt0aTVLQVB6TUpQM0xw?=
 =?iso-2022-jp?B?S1Y2aG9VSUpBZmFtYUgzVlFiSkg2V1AyUi9YSWM5TUJWNVdtcklDMGpI?=
 =?iso-2022-jp?B?NXZhMUpaODZPRGpETFAvRHpFc2U5U3RGMHNjRHpTSnNXQ20wL1JNSCtl?=
 =?iso-2022-jp?B?VkpvVlpMT2toZGQrblg0V3BwMXZhMkZxdEJSL1ZGbFJsRFpDKzVsUE5u?=
 =?iso-2022-jp?B?aS9TWndiVVIrSktnZ1hNRVNOWTVrbDRUTUcrdEppUm1lSktld0d3ejZY?=
 =?iso-2022-jp?B?VmlCL2RTYUVtVEVKQTlpbG4raDFNTmVMOXcvcURrQUtNWTEwSWhmUjEy?=
 =?iso-2022-jp?B?UGlsWkxtaXltd1ZkUkN3aXdDNDhDWmNxNW9ERnZYSWFEemxuRlArMjl3?=
 =?iso-2022-jp?B?aGRqY2oyeHc4NzFwSzJ2emdaZWRKbCs5ZWFXeE9yQ0ErNmlFeEI5YXRu?=
 =?iso-2022-jp?B?U3h4K3d6UjE3WnRGZXFJdTVjZElnejZqdWlaNDFQV2l2aEExVzRpSzZt?=
 =?iso-2022-jp?B?cWdOdHBhLy9XWDRxM1ZnN3lkQXhkemRqWVhhdGorNVpsMHB2bUt3d3By?=
 =?iso-2022-jp?B?RTM4aEMvaGVXckd1eXRHaWpSdkFDdXFybUtaNVY0YWpXV05ScGR2UHVs?=
 =?iso-2022-jp?B?NC81aDlrc3oyQ3V0V0x4eHFsdjQ5MkRKY3poTGM1Nk12QzRpNjcxZUt1?=
 =?iso-2022-jp?B?cUpMb25ZUm10VXRrZjduMmNNWlZtbFBrSHR6TzFncmtZYTArc2hnZ09z?=
 =?iso-2022-jp?B?blNqYlZ1NFRncmNwTjl1ajBLaUo2VTcwQk52UXo2Q3E2Q3QwWEJVTC82?=
 =?iso-2022-jp?B?Zi9pL3hOaHJ1RWhTTmJXZUR0QmJzYmI1QndiWnB4Z0xiZE15NzVQUmxW?=
 =?iso-2022-jp?B?NG9GUEdWOHhEbit2ZENZT01EMlljaHdpZ0hKWU5oU0hLZzI0SlNzbWdu?=
 =?iso-2022-jp?B?dmpITUVDc3NWQ0Ewenc4TThwbXRrL3FzKzhyZGxPSGdHNXlFaDFRRHJJ?=
 =?iso-2022-jp?B?anM1dmw2YTBBM05JdGxOK0tGa1JQYUNxUE90K0xZVmVOVnp6L3dqSGI5?=
 =?iso-2022-jp?B?dXBQNDBuS0JTVUQ3LzNzWUN2Nk1PYmNPZjV6UmVoZFFHcnVJNm92a1VN?=
 =?iso-2022-jp?B?R0U2bmNpVHBKL3V2TGhVNUxhbXF0djZkVFZCYjl5TVBJUjVDUFRJS1Zr?=
 =?iso-2022-jp?B?YVVpUXY0UEFqVEFuc1pLOEwvT0l2K1NRY1pwUGl4ZDU4RWg0UStDV0Rz?=
 =?iso-2022-jp?B?LzJlaUMzMUhVV1NZOHFQNDBTdWd4U0xTTkZTSmlpc0hnQTh5dUdmMzFu?=
 =?iso-2022-jp?B?ZVVid21mekJoUjNudk50NEtoVlNiZ1NWbFpPc2pKdTNwaVpPMTRNYTVj?=
 =?iso-2022-jp?B?a0pNbzRKWVpTVmc3WHZqQVJyVVByV1JId2IxakFyZVk4eTliQlNrK3NQ?=
 =?iso-2022-jp?B?Rjd3Lzd2RVFpaUd3ejdaUGlOVUROSm0zcHZ5TllGZm16bjM0T1hPYy9T?=
 =?iso-2022-jp?B?czhZYXVudjRzTFlMejFkbi9TdGEwMUg1d3VwenI1RlROS3ZwdmN3WHpy?=
 =?iso-2022-jp?B?N0FkVGNRaWJMN0JEMXVvZFZxYzk4eDVjSWlGRnRsRVBPS0hoM2pURURw?=
 =?iso-2022-jp?B?WG1jQ3AxR1cxL1pFRGxrY1RCVVRRK2hvaUx1TGFhcVZNS0laSzlWOHll?=
 =?iso-2022-jp?B?b29HSnRzc2UvSHNaUVBSS3IyZUNyN0dXSmMwOGRxTjBOd0dPVHR5MjFX?=
 =?iso-2022-jp?B?aW1JWA==?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5993.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a13cb2c6-4007-48a8-4bf2-08da96390096
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2022 10:07:59.2873
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qSV1OlcsAXyxGYwZ590nIn5Pg0JSnsxokizf2t6Z5TRf9/Bt4224EQocI49b9Rd2ju3KHOP0X0QPxXZE5i8LfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6171

[AMD Official Use Only - General]

Hi Paul,

Thank you!
But how could we merge this patch ?

Ruili
-----Original Message-----
From: Paul Durrant <xadimgnik@gmail.com>
Sent: 2022=1B$BG/=1B(B9=1B$B7n=1B(B14=1B$BF|=1B(B 17:08
To: Ji, Ruili <Ruili.Ji@amd.com>; qemu-devel@nongnu.org
Cc: Liu, Aaron <Aaron.Liu@amd.com>; xen-devel@lists.xenproject.org
Subject: Re: [PATCH] hw/xen: set pci Atomic Ops requests for passthrough de=
vice

Caution: This message originated from an External Source. Use proper cautio=
n when opening attachments, clicking links, or responding.


On 13/09/2022 04:02, Ji, Ruili wrote:
> [AMD Official Use Only - General]
>
>
> Hi Paul,
>
> Could you help to review this patch?
>

LGTM. You can add my R-b to it.

   Paul

> Thanks
>
> *From:* Ji, Ruili
> *Sent:* 2022=1B$BG/=1B(B9=1B$B7n=1B(B7=1B$BF|=1B(B 9:04
> *To:* 'Paul Durrant' <paul@xen.org>; 'qemu-devel@nongnu.org'
> <qemu-devel@nongnu.org>
> *Cc:* Liu, Aaron <Aaron.Liu@amd.com>; 'xen-devel@lists.xenproject.org'
> <xen-devel@lists.xenproject.org>
> *Subject:* RE: [PATCH] hw/xen: set pci Atomic Ops requests for
> passthrough device
>
> FYI
>
> *From:* Ji, Ruili
> *Sent:* 2022=1B$BG/=1B(B9=1B$B7n=1B(B6=1B$BF|=1B(B 15:40
> *To:* qemu-devel@nongnu.org <mailto:qemu-devel@nongnu.org>
> *Cc:* Liu, Aaron <Aaron.Liu@amd.com <mailto:Aaron.Liu@amd.com>>
> *Subject:* [PATCH] hw/xen: set pci Atomic Ops requests for passthrough
> device
>
>  From c54e0714a1e1cac7dc416bd843b9ec7162bcfc47 Mon Sep 17 00:00:00
> 2001
>
> From: Ruili Ji ruili.ji@amd.com <mailto:ruili.ji@amd.com>
>
> Date: Tue, 6 Sep 2022 14:09:41 +0800
>
> Subject: [PATCH] hw/xen: set pci Atomic Ops requests for passthrough
> device
>
> Make guest os access pci device control 2 reg for passthrough device
>
> as struct XenPTRegInfo described in the file hw/xen/xen_pt.h.
>
> /* reg read only field mask (ON:RO/ROS, OFF:other) */
>
> uint32_t ro_mask;
>
> /* reg emulate field mask (ON:emu, OFF:passthrough) */
>
> uint32_t emu_mask;
>
> Resolves:
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitl
> ab.com%2Fqemu-project%2Fqemu%2F-%2Fissues%2F1196&amp;data=3D05%7C01%7CRu
> ili.Ji%40amd.com%7Ca5e2c22a81544feb6bb408da96309702%7C3dd8961fe4884e60
> 8e11a82d994e183d%7C0%7C0%7C637987432689748212%7CUnknown%7CTWFpbGZsb3d8
> eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3
> 000%7C%7C%7C&amp;sdata=3DJg8588FWkIZzmSEyt50TYCbck2NuoVJdm7ZP0Z%2FtFGc%3
> D&amp;reserved=3D0
> <https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit
> lab.com%2Fqemu-project%2Fqemu%2F-%2Fissues%2F1196&amp;data=3D05%7C01%7CR
> uili.Ji%40amd.com%7Ca5e2c22a81544feb6bb408da96309702%7C3dd8961fe4884e6
> 08e11a82d994e183d%7C0%7C0%7C637987432689748212%7CUnknown%7CTWFpbGZsb3d
> 8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C
> 3000%7C%7C%7C&amp;sdata=3DJg8588FWkIZzmSEyt50TYCbck2NuoVJdm7ZP0Z%2FtFGc%
> 3D&amp;reserved=3D0>
>
> Signed-off-by: Aaron.Liu@amd.com <mailto:Aaron.Liu@amd.com>
>
> Signed-off-by: ruili.ji@amd.com <mailto:ruili.ji@amd.com>
>
> ---
>
> hw/xen/xen_pt_config_init.c | 4 ++--
>
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
>
> index c5c4e943a8..adc565a00a 100644
>
> --- a/hw/xen/xen_pt_config_init.c
>
> +++ b/hw/xen/xen_pt_config_init.c
>
> @@ -985,8 +985,8 @@ static XenPTRegInfo xen_pt_emu_reg_pcie[] =3D {
>
>           .offset     =3D 0x28,
>
>           .size       =3D 2,
>
>           .init_val   =3D 0x0000,
>
> -        .ro_mask    =3D 0xFFE0,
>
> -        .emu_mask   =3D 0xFFFF,
>
> +        .ro_mask    =3D 0xFFA0,
>
> +        .emu_mask   =3D 0xFFBF,
>
>           .init       =3D xen_pt_devctrl2_reg_init,
>
>           .u.w.read   =3D xen_pt_word_reg_read,
>
>           .u.w.write  =3D xen_pt_word_reg_write,
>
> --
>
> 2.34.1
>


