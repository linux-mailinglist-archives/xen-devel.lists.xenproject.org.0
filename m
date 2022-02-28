Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFEA4C6478
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 09:13:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280225.478083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOb96-0003TG-Ld; Mon, 28 Feb 2022 08:12:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280225.478083; Mon, 28 Feb 2022 08:12:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOb96-0003QX-H1; Mon, 28 Feb 2022 08:12:40 +0000
Received: by outflank-mailman (input) for mailman id 280225;
 Mon, 28 Feb 2022 08:12:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oRDO=TL=nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1nOb94-0003QR-MT
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 08:12:38 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on060e.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 300f9c96-986e-11ec-8539-5f4723681683;
 Mon, 28 Feb 2022 09:12:36 +0100 (CET)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AS8PR04MB8434.eurprd04.prod.outlook.com (2603:10a6:20b:345::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Mon, 28 Feb
 2022 08:12:35 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::552c:ed46:26dc:77cc]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::552c:ed46:26dc:77cc%4]) with mapi id 15.20.4995.018; Mon, 28 Feb 2022
 08:12:35 +0000
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
X-Inumbo-ID: 300f9c96-986e-11ec-8539-5f4723681683
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CEeWg750YBFAul3OOPRSIyVm/hDT90NNXncy+5jfRZBek8DJTI2XI+GASZnUIcP3vP4WEfRzWbW8Rf47fQ7UT6N1BFSye/yVzjENPH3326P+Fmr3+/DOGwww38/G5WBFGY7whuhnocxBv/9lYF03vl6DcQwaiNdzur8Yy8njiNowOCAenr0w4zG8YZjC/Cx1VIIONSBW9Q0LHZeAz1pBKS/l1hE6rmyPJndXoZsADajlcBdnNhcAsEmDGA6lFQgA+M09MFihHddNO8BGLX5m/dnBUgF10S7WlmTl6pRpJ8t7HwtHcd5jEjBz2QdSSXlkpS/uMJQd9aXmHMYkyp6VYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kn/Jwj7vhQrZqtsBVGzXc1XGDB76vUmMIy+0q687RVs=;
 b=RlLzQD/nyCQ2Obo9Wsiem3pT4yCGTAFH05/PvS3ux9iNnZIeuMXPlo1kpZDKoJlG7Fq/XknB5hEmqezTO9/YuRQajmzL89gRboCgCdNE/oqLNf3xXAN0TIn05khT/vBSElG4KNe2fEcVFgQdPb7MLPY9EKX/KyeSzYThUtIkYsTcpPTo+PQXKYeOFNtqqbTlV5TuWmnnY7FvwjTicUmFLAY5p/pgMCpIH7KzYVvZnfR98RwlMohU/UfdZtX+SbvzubtfLEgzY29hjU1UCDC1tJxPxidsFOCmq3lgxkUKgrb94w7gapt2JhY+gqxtm7+Cfx7k0AXs4aIRJTwfFVoMtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kn/Jwj7vhQrZqtsBVGzXc1XGDB76vUmMIy+0q687RVs=;
 b=NnISi3EyV0OMgbrZ3gu+9vRyGKt8MfyK1aHRc6UY3dUXobUrgjuayF9byaXQQqQkQmwB6oH32Amr1RC5KjdPUbJSTtvMjTODKqwgWDy3AvKnnZnJ+BsdNIz1PMiTXhAjTig9IQux+CNuAT9d83utQfZA4S7nUL4Dr4o6xVZepEQ=
From: Peng Fan <peng.fan@nxp.com>
To: Jan Beulich <jbeulich@suse.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "wl@xen.org"
	<wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "van.freenix@gmail.com"
	<van.freenix@gmail.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>,
	"julien@xen.org" <julien@xen.org>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, "bertrand.marquis@arm.com"
	<bertrand.marquis@arm.com>
Subject: RE: [PATCH 0/3] xen/arm: add i.MX lpuart and i.MX8QM initial support
Thread-Topic: [PATCH 0/3] xen/arm: add i.MX lpuart and i.MX8QM initial support
Thread-Index: AQHYLDnuLa4kODQy+UeFBibwbeVee6yom6AAgAABZNA=
Date: Mon, 28 Feb 2022 08:12:35 +0000
Message-ID:
 <DU0PR04MB94177C2DAC3018BCF1DF963588019@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20220228010711.11566-1-peng.fan@oss.nxp.com>
 <8938002d-6ed7-bb52-43b5-f9788da3a4d1@suse.com>
In-Reply-To: <8938002d-6ed7-bb52-43b5-f9788da3a4d1@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dece7b72-c268-4623-9a3b-08d9fa9213be
x-ms-traffictypediagnostic: AS8PR04MB8434:EE_
x-microsoft-antispam-prvs:
 <AS8PR04MB843413D6688A62710A3DEA8D88019@AS8PR04MB8434.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 5b2+gqL6CC6betoPrN/OAecoWtyJh38ESHuYkSnbqgTT+28vRnKXk2cHtiFGBccl8TE2PDm2bMfnhB0jiRqX2P0yzsiT0dOgJ6lFiyWIhmWCvdCcqluuGxEAr/ELOH4CY77BRpv/GWs6CXQB8ZQ8wjuZ3g2cBDsiND1AZbyeYQ6/QctRnbB4t4ehPOojIwmCODJZept5qn1nssO2QvfRBaw3vfzJizAykNLNee8S/t19n/7FLBOj1a7jBarlgwu9N9V9rNfFzYoBmSQTFXMkF1fwSIWj8dRdfyzZFz2IwU9B8Z6USZl7imFt7BMZvYLb4IoxuCCYGWFIb37T0+YdRET3CrDE0wZX6yUVPM274kc61nzzLACVhZuszTa3CYlsWBsXgCMEB4Q53Y8gqDDt/kmPTsDKpP/klKko0mR9RuFZctjT2/zVls2zSu1ipzVd4vzI4iT6hnFVM+VF2xCXkAD+3nd7JhAwH46KodRsHip1CrygqAQnelt3MsfSLR2/pu+fxM/WCHK5ruXBkZIhI0lLDLINy+E+Dp7OWrLoGBBGSCx4k/+H5DD9tsSjrmOIU2Ih1+g2vitBJlNJUKX4IQyHF6I7KzHbKPExk1jGMh9Xsn8CyS9CBTanXBzIY3/4V8Q49E2kaZx1cJXvr2kAfZc2HqZfdeti9uypsDRrCHT/JnI0M5K7zhng4YjYr+1IaUv2i88Jg0+cZSg9baESzQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(54906003)(86362001)(26005)(7416002)(71200400001)(316002)(9686003)(186003)(38070700005)(508600001)(55016003)(44832011)(66946007)(4326008)(66446008)(83380400001)(52536014)(110136005)(66476007)(66556008)(8936002)(122000001)(33656002)(38100700002)(64756008)(5660300002)(8676002)(53546011)(6506007)(7696005)(2906002)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OU1lKzhQZGp4VGRmYU5hRnMwN0RBQ0MxYkZsZFluNktZamc1M3RDRTBjMjln?=
 =?utf-8?B?a1dNTXdXK2hTakpGUFBEZzVtTHBsL3gxWkhIeE0vaDlBck1zeFdQblk0L3or?=
 =?utf-8?B?bnlzOXpRZEhKL3hGUTN6eEhGRkNQN3Byd3VUa25Ia2NBT3Zlck01TXl0UGRD?=
 =?utf-8?B?VVdJOWs0SVJCNDNJeDlJc25Hd0UrQjV4aHlDYkl3eDFwaHBlWGM2aUhWcWly?=
 =?utf-8?B?SmtSYmsrbDNQby9zbVpicjQxanh5MmlDckd6NEFrZGcrNVdWbHlybU42eWg4?=
 =?utf-8?B?V2xNcGFXeXg4VEFnT3JWcCtYV0lDY29ta000VklrK0Fsa0lydVo5NXZOem56?=
 =?utf-8?B?MjJrZmZvRjNobzI4K0wvSUdadmVldDgzdmdFOEtyUWxycUFWMHZJdGVaUytU?=
 =?utf-8?B?S3pmdnppdUJUYmJ4MXJreG1FOEZwWkNTd3ZZZE5mZDJOQkd2ZDBMMGt0d2to?=
 =?utf-8?B?TFArdEF6d2c2VzdRRlpjUVU1eWEyNTVObGtsZnlsT3BYd0tQbjEvQTRKeER4?=
 =?utf-8?B?RmljMVhiN0ZzemlOVndVRjJrSkJiSms1UlZDTG9aMDlBaE82OHBJd3kzbTBu?=
 =?utf-8?B?SVJGWUlQK1R1SXNod3c5Q1ROSTVOaEJXMWlUUDVpUGdPNi9Sb2l0clJoK0pI?=
 =?utf-8?B?cjhJeEFpWkl5bEdqcnB4czNlY0thbksveDd5Vm5EM25YY0c5MFVwSGhGcEEw?=
 =?utf-8?B?OHF3NHp2d2tEa3dSUlh1akMwVU5OeUI3S0p4WmdIaE5ZREIvRmdmaVpWckVu?=
 =?utf-8?B?dlZ1REVld2FXREVxbHFRaDFZRXhhTHlWWlNyODdvSHZhSzVrTjRPS1hGNE9u?=
 =?utf-8?B?QitGb0NLbVA2V3BkWHM0TkovYlBqTzMrOTkvRnZUanpYVUU1b0c5SEI0eDht?=
 =?utf-8?B?L1V5NmRCM2V1a1VxMkVva3JCWFFJek1DNG81RFcxSGNSa0lpWXhYS0VPSGli?=
 =?utf-8?B?WVBIU1ZxSjk5UmFLNUt6ZGpxWGlWUGgvbmllczAyN3JGZHFqdkM3aFpja20r?=
 =?utf-8?B?YUMxUEdrV0pkWTlBSHF3NkpSdU8vd05jZG45TUliNGdxQ3VhMnA4Mk5tQko5?=
 =?utf-8?B?d2dpVGpuWEdBVlFFaE0wZThyTUE4Y28wQXplSzIzcEwwRmFaNjRPQVRDb0Zh?=
 =?utf-8?B?Q2REWmI1Y3BWNjdWam02YURFNHVUQ3NIeDFSb2RmbGtzSWk4R3hvazNnZ2JF?=
 =?utf-8?B?OTIyM0J4akcwN0ZvZlBqLzNqcDBvbnp0d1N6MWo1dU9LbjN1aTl6ZEdZZE5l?=
 =?utf-8?B?VnBERjNBN01zbFBxY3QvN05RLzByYzMxdzZvNmpPWHRFbUVndjEyNG9oYkJo?=
 =?utf-8?B?b2RFV2psVE9hcHc5ZlZ2eGhVb3BBaXdLOUR1S3dmUHpaOGVmZ1dGd0hIMm0w?=
 =?utf-8?B?NTRndGtWZmYwaGFZUnMrN0FlTHgweG5Kbjd0SEE1emtnd2JGVlVBV2kyQ1J4?=
 =?utf-8?B?bHJwWjlmTGNEY3l5QUV5NlE5SEsxYnpXMzhkbzJ4YkN1MXNsbzMrU3pVbVJa?=
 =?utf-8?B?bnJtNTg3ekM4MnlKeFIvU2xGVHZCVUE3RnZ2N0JKZ0FHZW5Yd0hBWHFqK3R0?=
 =?utf-8?B?VFpUcVIySW5zcWsvY1R1Y3hOQWd4eVd2WXl6TVYvNGxMRG9KNkoxSGlXUW0y?=
 =?utf-8?B?UzZlZGl1UE03a2tacitzY0ZWdzhJRHpkUmc5V05uQy9mOFUxZU50Sk5NZnJj?=
 =?utf-8?B?R1NyN1htQkpnOFpOcStHNk9CV1ExWTgycElPemMxU0k2MHJBTmRSZGl0UmRZ?=
 =?utf-8?B?Tll1cmZEU1RVRVVCV2pPcXR3VDBvdWpsblR0cm03VHBQYkxrY0t5Y0pYckFG?=
 =?utf-8?B?d0hRNUNpQ0kyNGJRTHBYeXZJVkhKNjZOTUI3UmdFU1FVVWVGTXN1QUpQaXhr?=
 =?utf-8?B?TElQRzFTNjhidVNmK2Yzb0QvU1RFRE9LOHNEZDBiL1VRdW1aZGQ0UHNvcXZw?=
 =?utf-8?B?YUhwSmFRMFd2UWh5dVh1Wng2VCszeTlCSEV3UUNLWGFxa1ZHWFlNOW1BOXJM?=
 =?utf-8?B?eTUwMnVhWldQZEpXaU44eFFvUnRPTzN0bi85TFV0c3MzVjg2Z2NlZHpEK1l4?=
 =?utf-8?B?cmtuUHNFblRJVENoa2RFWXM4dGpxQ0hodnJQdFdUN1BMRHhrajY2L29LYm0y?=
 =?utf-8?B?ZjExQmk0Zk55dDFiYmhUNlZxK3VlVVhiZHBaZDRrakdBLzFONWxwbUE5SHRT?=
 =?utf-8?Q?1Xsno8F+Ec7TDTjv2bOzmlI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dece7b72-c268-4623-9a3b-08d9fa9213be
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2022 08:12:35.1969
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TDKyWmRjxxqC6VF9KX0AEZePSQ10pWDTE02glQGQAqFnhaZq+HlAU3y/qv+Kw1oCJeEQm0/goREuOKLfYtWvpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8434

PiBTdWJqZWN0OiBSZTogW1BBVENIIDAvM10geGVuL2FybTogYWRkIGkuTVggbHB1YXJ0IGFuZCBp
Lk1YOFFNIGluaXRpYWwNCj4gc3VwcG9ydA0KPiANCj4gT24gMjguMDIuMjAyMiAwMjowNywgUGVu
ZyBGYW4gKE9TUykgd3JvdGU6DQo+ID4gRnJvbTogUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+
DQo+ID4NCj4gPiBBZGQgaS5NWCBscHVhcnQgZHJpdmVyIGFuZCBpLk1YOFFNIHBsYXRmb3JtIHN1
cHBvcnQuDQo+ID4gIC0gbHB1YXJ0IGlzIHRoZSB1YXJ0IElQIHVzZWQgaW4gaS5NWDhRTS9RWFAv
OTMuDQo+ID4gIC0gVmVyeSBiYXNpYyBpLk1YOFFNIHBsYXRmb3JtIHN1cHBvcnQuDQo+ID4NCj4g
PiBQZW5nIEZhbiAoMyk6DQo+ID4gICB4ZW4vYXJtOiBBZGQgaS5NWCBscHVhcnQgZHJpdmVyDQo+
ID4gICB4ZW4vYXJtOiBBZGQgaS5NWCBscHVhcnQgZWFybHkgcHJpbnRrIHN1cHBvcnQNCj4gPiAg
IHhlbi9hcm06IEFkZCBpLk1YOFFNIHBsYXRmb3JtIHN1cHBvcnQNCj4gPg0KPiA+ICB4ZW4vYXJj
aC9hcm0vS2NvbmZpZy5kZWJ1ZyAgICAgICAgICAgICAgfCAgMjEgKysNCj4gPiAgeGVuL2FyY2gv
YXJtL2FybTY0L2RlYnVnLWlteC1scHVhcnQuaW5jIHwgIDQ4ICsrKysNCj4gPiAgeGVuL2FyY2gv
YXJtL3BsYXRmb3Jtcy9NYWtlZmlsZSAgICAgICAgIHwgICAxICsNCj4gPiAgeGVuL2FyY2gvYXJt
L3BsYXRmb3Jtcy9pbXg4cW0uYyAgICAgICAgIHwgIDQ0ICsrKysNCj4gPiAgeGVuL2RyaXZlcnMv
Y2hhci9LY29uZmlnICAgICAgICAgICAgICAgIHwgICA4ICsNCj4gPiAgeGVuL2RyaXZlcnMvY2hh
ci9NYWtlZmlsZSAgICAgICAgICAgICAgIHwgICAxICsNCj4gPiAgeGVuL2RyaXZlcnMvY2hhci9p
bXgtbHB1YXJ0LmMgICAgICAgICAgIHwgMzAzDQo+ICsrKysrKysrKysrKysrKysrKysrKysrKw0K
PiA+ICB4ZW4vaW5jbHVkZS94ZW4vaW14LWxwdWFydC5oICAgICAgICAgICAgfCAgNjQgKysrKysN
Cj4gPiAgOCBmaWxlcyBjaGFuZ2VkLCA0OTAgaW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgeGVuL2FyY2gvYXJtL2FybTY0L2RlYnVnLWlteC1scHVhcnQuaW5jDQo+ID4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL2lteDhxbS5jICBjcmVhdGUg
bW9kZQ0KPiA+IDEwMDY0NCB4ZW4vZHJpdmVycy9jaGFyL2lteC1scHVhcnQuYyAgY3JlYXRlIG1v
ZGUgMTAwNjQ0DQo+ID4geGVuL2luY2x1ZGUveGVuL2lteC1scHVhcnQuaA0KPiANCj4gSSBndWVz
cyB0aGUgbGF0dGVyIHR3byBhZGRpdGlvbnMgd2FudCB0byBiZSBhY2NvbXBhbmllZCBieSBhbiB1
cGRhdGUNCj4gdG8gLi9NQUlOVEFJTkVSUycgQVJNIHNlY3Rpb24uDQoNCkknbGwgYWRkcmVzcyB0
aGlzIGluIHYyLiBMZXQgbWUgd2FpdCBtb3JlIGNvbW1lbnRzIGFuZCBhZGRyZXNzIHRvZ2V0aGVy
Lg0KDQpUaGFua3MsDQpQZW5nLg0KDQo+IA0KPiBKYW4NCg0K

