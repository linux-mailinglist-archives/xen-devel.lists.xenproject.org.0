Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48052474201
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 13:06:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246646.425352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx6Yw-0003bq-LQ; Tue, 14 Dec 2021 12:05:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246646.425352; Tue, 14 Dec 2021 12:05:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx6Yw-0003Zt-Hv; Tue, 14 Dec 2021 12:05:42 +0000
Received: by outflank-mailman (input) for mailman id 246646;
 Tue, 14 Dec 2021 12:05:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jWHN=Q7=renesas.com=yoshihiro.shimoda.uh@srs-se1.protection.inumbo.net>)
 id 1mx6Yu-0003Iz-Mr
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 12:05:40 +0000
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2070d.outbound.protection.outlook.com
 [2a01:111:f403:700c::70d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 264f7b4c-5cd6-11ec-9e60-abaf8a552007;
 Tue, 14 Dec 2021 13:05:39 +0100 (CET)
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB3436.jpnprd01.prod.outlook.com (2603:1096:404:d7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Tue, 14 Dec
 2021 12:05:35 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b0dd:ed1e:5cfc:f408]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b0dd:ed1e:5cfc:f408%3]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 12:05:35 +0000
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
X-Inumbo-ID: 264f7b4c-5cd6-11ec-9e60-abaf8a552007
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IjDdXU8kMTdsrYUZ6o8iDgTHchv2u2P7drPLiaIRXZqpXRYRzfRCfsNd8BLfqJd/zOJQW4s3KW8Ysb4RZTAZ2RdMqs6Wy1/3IJzKM2lH6IoThBrxnsFlHnRkl08z5WGS7RvnP+BXPJosmoxT6fG/62bI/3yWKZwo4eBFI93u04S5lnKjhnTwZuwZXhRy12ykEPeWOOMooysoFbc2Tb2RytFFVqQqCe1uTUYdafZ/eti9VoSecGcKatXTATxsHc5mcqnRMyhBy36+W5NLYa9R58HJt4YnDd/Yf/nIx4cFk0B4KsFqj2iUHWY0vC4mDaNGIAkVUtAoVs3CpFMYIyzbLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MsUZgLCtyKsEdNuXNMxlfctoNkMMKk3ukpTp2QX20ms=;
 b=R9I3WiJYKMnk3nuJ/74T34epGZjdRrM07SZ0FlXB5fhN88yxrOE7AUyyX2epyuzfFRqlfNndqNx6FzGhBgnF/fJCZQ4MxZDI5kBuVU0ggYVxPnHGaE/gUJVYEHnzCRPG+12u398IuMnFlL4nfD48pFOI1/dmAOxNBJfhAfF+7JUXaJM3JDbsDRLpr/NwSO8+/E6qGs35ERQSfWBI5Ul7ztSE9EVcCdx5Y3Jr5B0MvgrnLhRLIg3LOPXlKjzPCiXUiv6B+X2n7j9Qjj/kUTFGnYSRPgS2OvdsyQnBf67dDNdHVOUcteqP957K0CBe2Kx5igquvA4tgeGaHcpzeDy4SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MsUZgLCtyKsEdNuXNMxlfctoNkMMKk3ukpTp2QX20ms=;
 b=GO2DB6+53LhGiiVflrMHuZVo9GgO8pzekV5hGW3qyKAJGL32DriH3sNT9GulPzh2VxjS/eiJXTMQsAQnznFFp2QhtYojQ74Mlxc43QbrPB1b7Uw/kfGmbLav/mjd0Jxgmz8hUESP7QoDIuF6Bu/mH4A+XbQSeKEcuIcnfGo75+w=
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: RE: [PATCH 02/10] iommu/ipmmu-vmsa: Add helper functions for MMU
 "context" registers
Thread-Topic: [PATCH 02/10] iommu/ipmmu-vmsa: Add helper functions for MMU
 "context" registers
Thread-Index: AQHX47d5bUBAY0i+EkObsnwBPyqCUKwx9ZHw
Date: Tue, 14 Dec 2021 12:05:35 +0000
Message-ID:
 <TY2PR01MB3692F7B244E88C6A185993CDD8759@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1638035505-16931-1-git-send-email-olekstysh@gmail.com>
 <1638035505-16931-3-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1638035505-16931-3-git-send-email-olekstysh@gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5c7609fa-b90d-49f8-3585-08d9befa094f
x-ms-traffictypediagnostic: TY2PR01MB3436:EE_
x-microsoft-antispam-prvs:
 <TY2PR01MB3436A29FAA3C962B47B0AA97D8759@TY2PR01MB3436.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1169;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 cD5juAUbYGtMDUbg258o/qpY40bIcDculav9n34yg9yeuRmYS5elHoAaXBoTSPjSLqbI9C3l4RMc6XrPmX9ENDALyhoYYmad+qNhTarkcuOP19ghM5MIi2FhAWT9Zw0YqxdGNjD7fXZ32pkOEriMA4tOVC/4UEQyYifaKmRCoDqdOPmJLic7nNzrqA2FLnim6xKlkefRyYQqwAIrtsUyXJBRzlTn5Uj8PK8hXFLipM1D6/LTv7+THqVdtcJhnTUL+IIWOyNwTI9JWMIDHrtf2qoRhDIuSHMsVSbnuHBBmy1y2NHTKK62Owm1GWcRqOXSsDP/WvZDYew/LBZ0DFchLjMHx0d7R5nGjxpL7wcTZ6XL+Lou3qeM/p/tSv5e2MgpSBWfl4uiK6y36Jycoc1qBSqJoiI7tAA1coVFTdNkTaeIPiSdYZGjxvqn1SKNv7WZZY6tNnThCzHiJiCbw6d8fEGSkXE8SIuNli3bwztyl4zZ96dwaHbEllLU57JKDXVKTA42eOVfxw2XWfU42POqog8Bf1EIlus1Y05l/iAqBdIxjshMcQ/KrSNDlFK6h3Eh09lY/ma9vx4LshQqDyx3xhFnIv633xFTU19YCG5jQnQidlyizXOjOm+hUOdPqNGLxteGBi2a8KXDt9wTm/pA+SiSz+HX7wWWKW4kUPXSh93bMMP8q0Uil5JyS3Ah/iP/nUWb8w9BuVYyxuHCZ12w7Q==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(122000001)(52536014)(86362001)(4326008)(9686003)(33656002)(26005)(2906002)(7696005)(8936002)(38100700002)(508600001)(6506007)(5660300002)(186003)(8676002)(54906003)(66574015)(316002)(83380400001)(110136005)(38070700005)(76116006)(66446008)(66476007)(71200400001)(55016003)(64756008)(66946007)(66556008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Ni9sZVpJeDBZK1FyOG5NeDRRbTMvZkIxNDE1VHlFMWZPTHNrUENMM2wxa1Ra?=
 =?utf-8?B?ajN4TGpyQmlSSDRCOWM4N2Ywb3VUY05VcEkwREdFRmxIdHZkaUlsNnZlYmlN?=
 =?utf-8?B?Qm82Y1FxUVVPaW1pVWdZUjZwRDg5TXg2RVFtV0gxcFc3VXZnSGJuZGc3OVNG?=
 =?utf-8?B?Unp0RVVxYlBtSDlHM0xSYmZHTUJuSmx3NDI0cVF1QldwS0xWajFhWE1aSVlF?=
 =?utf-8?B?NmRHK0d0QURQZktjUld4SFFsYzk3UlhTamlCNGxJd0c2K0tXTVMzL1RtMHBL?=
 =?utf-8?B?OHFBak50dEV1RG04OWlaZGFlQklVT2RiMDFXTXlUa2k5ZllKYjFzaDRzaENC?=
 =?utf-8?B?U05mOGFobGNwbkNtdlR1dlFLcThPQ3pLNXkvdDErZjBZeFU0K0R6bmVmMGF2?=
 =?utf-8?B?TWxXTVB4WXI3cStVRm00U3krbEVWWXRsci8vb3krT094N0VRVGhFRHQ1ZW1E?=
 =?utf-8?B?Sy9rZzhiYkt6Z0RydThlQ3g1SmdkUUZpYjBZUE9GTEFzOFozeWhXdjVSSnZ1?=
 =?utf-8?B?Q0Q4NC9HMURVSE9LblJONVpvc2FpVEQ3ZEVwQlFHdHBHVHlUYVdrc3FqWlov?=
 =?utf-8?B?eE5teCtjUVNYMUQ4QUtCZnplalYxLzBaK1NiVytlbzY1OUxOZDVPWHlBOU9V?=
 =?utf-8?B?d1MxY1BzQms5UEVRRXNvazR2TGFCSzdhdDhHWXRrTXFxY205L09mQ1FyOS9p?=
 =?utf-8?B?bEgxSEFZRXZYY1k2QURzT0hmZTY2Sk5Edk1zWkVBN1VKMDZsNUZjdVdLbGNH?=
 =?utf-8?B?OEFBNGFaVnhpQk1NODJUcEcrK3N1V1NHS0NQWTh1SjNiV0NKaWUyTzdvUkFu?=
 =?utf-8?B?Rm1YWlQxVkh4SkpoN0x0MDd3eUN0WDV1bm02aXM3eUdFTzhJTW1kMlFVY1pr?=
 =?utf-8?B?YlNtM0NBbDNoMmRRbHQ3blVucmxkb0pjcWxUdXVmbVJPMXMxY0IyN3N4Z0dW?=
 =?utf-8?B?WjM5ckpsMHVMNHBrRTlYRlhFTnNpaDdTSll5emk2NU1qWm9jTmFKMXlxa1l3?=
 =?utf-8?B?Ry9VR2g5WS9NNEh4ZmxEbVBwWTZORGVSUWdMRkNrQmJGcDlDTnpVMVMxaTd2?=
 =?utf-8?B?WG1ZemRveGp2YzR3U0VlakpUOTltSzFEODlLZTRBN3FUZnhuVkl4QmxncXdp?=
 =?utf-8?B?VCtoWHRDbS9ITXYrUVFnYlZmTW1VS3hTYldiNGsvTUtVMkpWcG1oK3NtLzBQ?=
 =?utf-8?B?QkoxZUJPNGpyclJQSUxhdHNuRHdFdGtMeGk4ei8zV0tMbDBzKzVJQlErSk9s?=
 =?utf-8?B?M25VditEc1k5aExJdmZMOWNzWUYrU1hCeWp5NmdzUlh0MnUzbGRkWXd4Y1k0?=
 =?utf-8?B?SDhqcm9lRDFWZll2eGRtOFlXbmZ1MzVpSEJhLy81SmozbVRLWU5XUlZqUFBI?=
 =?utf-8?B?NGkycGhOdHljamxKaXAzM1lWNTNta1lWRXcyMHRZdEpDZzI3OHNaYmd4ZU1Y?=
 =?utf-8?B?MzRySnJ3cjVLMXhOVFZueGZxcWZJNVYxZnlKT2liY0R0MzBUZUNTYlFjaHM1?=
 =?utf-8?B?VVo5Nm56bXMvckZjTGVyM20yM3BTRTdmRE1XNkNweHVtYlFteWJyZ0RrSjEx?=
 =?utf-8?B?eS9EWWJ6UnJOOTR0QlNLOWUvc1U0STNCQmF0VEZ4SkQzTHpxT3QxVlQ2NHpT?=
 =?utf-8?B?c0ttR3VQSnRQeXpUMFRGdXd0MjFOelJZejY1QTNHa2l0UzZrNEhwRWhtTXJT?=
 =?utf-8?B?YXJnRXR6MXVwbU0xcnJqbjYyTSt6Nmx2eEdCNTd5MmpOT2hyM2pmVHQyQ0tm?=
 =?utf-8?B?d0ZqT1RuVmx3S1ZTRldlRFo3QVBwNDBnVzhmTWRBdHVDMk1jdlRLUE1pbGgw?=
 =?utf-8?B?OTFyMUJTTFpDMWpBemZMT0dmbDlNaCtVR0xIUnJpQ1N2V0I5OGNGSFNMQmNR?=
 =?utf-8?B?bTd1SEhxUElUQ3lncXRSdGYzd25raUw1UGtHNHNyU3pMcGlWNEFLNE9nYUFG?=
 =?utf-8?B?WHJlNmNvUHVPb0NIN2ZjNE9TaDIwSDIvRTQyZW5PNHdIZUkwZVJvT1g0ejZ5?=
 =?utf-8?B?TnU1WGJ2TFI0UUdTOEZsbzBZQ2hFMWxlZ1lDVnR5ZURFQ01TejgvVEpISnZ4?=
 =?utf-8?B?NWxkUXlESlNzSnZkamI0Q1cySnBSSThndjAxbFRNblArdExmZVdmR1dGL08v?=
 =?utf-8?B?bkQzZDdjNTNyN0pPMjgzM2l0MURVY1ZJa1d4dUlKaHUvSFRNSHl4MDhYVEgw?=
 =?utf-8?B?YkNnQWg1cDNTZ0NqYTNLS05ySGg0TlZzQnNEOHh0bXZrY2VCZWc5MVpTQVNH?=
 =?utf-8?B?RXZQd0ZTcXE2VncvUW42aDM3b3l6bXJhRDVraGNWZkdCQ3cyMko1UU53STh5?=
 =?utf-8?B?K0VWUkR5eGd5ZEllKzdveHBqL1diNCtSMSs5QThoMjVVeDNWekY2UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c7609fa-b90d-49f8-3585-08d9befa094f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2021 12:05:35.5743
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G70YnSwjWSgg7m6eamd76Oa4mFWTT48DTSKFF2pZDz4qqoA9JRHtHmuTRhnHtJnJHUFziKlvrxJD4fHNfJUlAxtwuBLOjfZskSRBq6kUN8m8mU4q+BllrHE+COlZEljn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3436

SGVsbG8gT2xla3NhbmRyLXNhbiwNCg0KPiBGcm9tOiBPbGVrc2FuZHIgVHlzaGNoZW5rbywgU2Vu
dDogU3VuZGF5LCBOb3ZlbWJlciAyOCwgMjAyMSAyOjUyIEFNDQo+IA0KPiBGcm9tOiBPbGVrc2Fu
ZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+DQo+IA0KPiBUaGlz
IGlzIGEgbm9uLXZlcmJhdGltIHBvcnQgb2YgY29ycmVzcG9uZGluZyBMaW51eCB1cHN0ZWFtIGNv
bW1pdDoNCj4gMTZkOTQ1NGY1ZTA0NDdmOWMxOWNiZjM1MGIzNWVkMzc3YjlmNjRlYg0KPiANCj4g
T3JpZ2luYWwgY29tbWl0IG1lc3NhZ2U6DQo+ICBjb21taXQgMTZkOTQ1NGY1ZTA0NDdmOWMxOWNi
ZjM1MGIzNWVkMzc3YjlmNjRlYg0KPiAgQXV0aG9yOiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGlo
aXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+DQo+ICBEYXRlOiAgIFdlZCBOb3YgNiAxMTozNTo0
NyAyMDE5ICswOTAwDQo+IA0KPiAgIGlvbW11L2lwbW11LXZtc2E6IEFkZCBoZWxwZXIgZnVuY3Rp
b25zIGZvciBNTVUgImNvbnRleHQiIHJlZ2lzdGVycw0KPiANCj4gICBTaW5jZSB3ZSB3aWxsIGhh
dmUgY2hhbmdlZCBtZW1vcnkgbWFwcGluZyBvZiB0aGUgSVBNTVUgaW4gdGhlIGZ1dHVyZSwNCj4g
ICBUaGlzIHBhdGNoIGFkZHMgaGVscGVyIGZ1bmN0aW9ucyBpcG1tdV9jdHhfe3JlZyxyZWFkLHdy
aXRlfSgpDQo+ICAgZm9yIE1NVSAiY29udGV4dCIgcmVnaXN0ZXJzLiBObyBiZWhhdmlvciBjaGFu
Z2UuDQo+IA0KPiAgIFNpZ25lZC1vZmYtYnk6IFlvc2hpaGlybyBTaGltb2RhIDx5b3NoaWhpcm8u
c2hpbW9kYS51aEByZW5lc2FzLmNvbT4NCj4gICBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9l
dmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gICBSZXZpZXdlZC1ieTogTmlrbGFzIFPD
tmRlcmx1bmQgPG5pa2xhcy5zb2Rlcmx1bmQrcmVuZXNhc0ByYWduYXRlY2guc2U+DQo+ICAgU2ln
bmVkLW9mZi1ieTogSm9lcmcgUm9lZGVsIDxqcm9lZGVsQHN1c2UuZGU+DQo+IA0KPiAqKioqKioq
KioqDQo+IA0KPiBUaGlzIGlzIGEgcHJlcmVxIHdvcmsgbmVlZGVkIHRvIGFkZCBzdXBwb3J0IGZv
ciBTNCBzZXJpZXMgZWFzaWx5DQo+IGluIHRoZSBmdXR1cmUuDQo+IA0KPiBCZXNpZGVzIGNoYW5n
ZXMgZG9uZSBpbiB0aGUgb3JpZ2luYWwgY29tbWl0LCB3ZSBhbHNvIG5lZWQgdG8gdXBkYXRlDQo+
IGFuIGV4dHJhIGNhbGwgc2l0ZXMgd2hpY2ggTGludXggZHJpdmVyIGRvZXNuJ3QgaGF2ZSwgYnV0
IFhlbiBkcml2ZXINCj4gaGFzIHN1Y2ggYXMgaXBtbXVfY3R4X3dyaXRlX2NhY2hlKCksIGV0Yy4N
Cj4gDQo+IE5vIGNoYW5nZSBpbiBiZWhhdmlvci4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE9sZWtz
YW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4NCg0KVGhhbmsg
eW91IGZvciB0aGUgcGF0Y2ghDQoNClJldmlld2VkLWJ5OiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9z
aGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+DQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGly
byBTaGltb2RhDQoNCg==

