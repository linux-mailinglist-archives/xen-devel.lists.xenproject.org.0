Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAF543709D
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 06:00:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214690.373348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdliZ-0004Hk-K2; Fri, 22 Oct 2021 03:59:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214690.373348; Fri, 22 Oct 2021 03:59:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdliZ-0004F1-Ga; Fri, 22 Oct 2021 03:59:43 +0000
Received: by outflank-mailman (input) for mailman id 214690;
 Fri, 22 Oct 2021 03:59:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rhvd=PK=arm.com=Hongda.Deng@srs-us1.protection.inumbo.net>)
 id 1mdliX-0004Ev-T6
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 03:59:42 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.44]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 15c49f2a-4046-450b-ab12-c911635d9163;
 Fri, 22 Oct 2021 03:59:38 +0000 (UTC)
Received: from AS9PR06CA0014.eurprd06.prod.outlook.com (2603:10a6:20b:462::8)
 by VI1PR08MB2654.eurprd08.prod.outlook.com (2603:10a6:802:25::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Fri, 22 Oct
 2021 03:59:35 +0000
Received: from VE1EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:462:cafe::a0) by AS9PR06CA0014.outlook.office365.com
 (2603:10a6:20b:462::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Fri, 22 Oct 2021 03:59:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT019.mail.protection.outlook.com (10.152.18.153) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.16 via Frontend Transport; Fri, 22 Oct 2021 03:59:34 +0000
Received: ("Tessian outbound 8e26f7114b75:v103");
 Fri, 22 Oct 2021 03:59:34 +0000
Received: from c25474b878db.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 24968092-B4EE-48C0-8D08-96E731F2FBC7.1; 
 Fri, 22 Oct 2021 03:59:28 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c25474b878db.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 22 Oct 2021 03:59:28 +0000
Received: from VE1PR08MB5677.eurprd08.prod.outlook.com (2603:10a6:800:1ab::17)
 by VE1PR08MB5231.eurprd08.prod.outlook.com (2603:10a6:802:a1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Fri, 22 Oct
 2021 03:59:24 +0000
Received: from VE1PR08MB5677.eurprd08.prod.outlook.com
 ([fe80::d810:52a3:dce3:4d06]) by VE1PR08MB5677.eurprd08.prod.outlook.com
 ([fe80::d810:52a3:dce3:4d06%7]) with mapi id 15.20.4608.018; Fri, 22 Oct 2021
 03:59:24 +0000
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
X-Inumbo-ID: 15c49f2a-4046-450b-ab12-c911635d9163
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Z6jLoJFWKltuxsykmIa1UGsMxyjOXZSLrfdGE4TlOw=;
 b=sTUEfvNdFNahQnUH2z//kHjJu8sKTyE8Wpa+LyKf0V/dEbjOa/bynDS1Z36kDcFkGIFZI1AflB6KUFYieerjsqMX03S2IUAdckV3gWvD6WmKkKYh7sCShdGVnfRYy3UvIP79nVRDzp5sp9rGQf2JZVQuvFP8HTrSXktDdp0mIz4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gegl8JnWOD2jBdBGK/ACzYaLVHoZYZKJSCcaVRH+BG1NtQSkSPtEOr8zVMGFf3E11P5JNeIR/T0y6Gxnu9ud8Itykzk1+cFNcToGMQjU1qgGX5n+BVGlYwGZv4EEe9MvHByIdEa3Z2plriXPgeoiVdfaMnD4MiLn3IC+nYM+egcPEhKHrLygpmb8I7qwSZhs9BxRXlThGKUA89p1KRhSQM49jaTW/HuzSt5PSlIKU4dOeb3NlXaUf66of/3GRV/WWPbCBX1ootFwgNOiYPe1hStfngZ4p0LY+wq6BHUZzWhtUka3s658LtQnSx4GydL1T4KJ73bWjeJWAr9EGD8IgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Z6jLoJFWKltuxsykmIa1UGsMxyjOXZSLrfdGE4TlOw=;
 b=TYE3rR58ZUrxHpMJPo/JsdBMpSks1UkeI9MVTeeeRANIEw8hqkDpzVKRk/8AYXNdT9DabPUrzN0OhVYeByDuXXe7cEs3MpQI+LkIdtI6S7SvbKXJVOeUy9DSni74wi/fGTUjPepsxfcm+TFjrmNMwz+piLQwvu8C9g4qRg//g7C3lXqPqExApZrCxDJjp5QS6IhfzXtWrcuJZ1RDfmrewPMhtqfQYE1vG288k+Mj3peyRED0VYYVGRYBNJXQfEVTMhlo2Fr+V5TgojIbu2tsgApVceud5iWE6XPLjh4uoiHaUpWE7iCWs6PyG4GOiKLg2z9alln0C3CHjxdorlDY2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Z6jLoJFWKltuxsykmIa1UGsMxyjOXZSLrfdGE4TlOw=;
 b=sTUEfvNdFNahQnUH2z//kHjJu8sKTyE8Wpa+LyKf0V/dEbjOa/bynDS1Z36kDcFkGIFZI1AflB6KUFYieerjsqMX03S2IUAdckV3gWvD6WmKkKYh7sCShdGVnfRYy3UvIP79nVRDzp5sp9rGQf2JZVQuvFP8HTrSXktDdp0mIz4=
From: Hongda Deng <Hongda.Deng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Ian Jackson <iwj@xenproject.org>
Subject: RE: [for-4.16] Re: [PATCH v4] xen/arm: vgic: Ignore write access to
 ICPENDR*
Thread-Topic: [for-4.16] Re: [PATCH v4] xen/arm: vgic: Ignore write access to
 ICPENDR*
Thread-Index: AQHXxnOw130F/XXfpEO1c6gHtggnravdj7eAgAAiDICAALKBsA==
Date: Fri, 22 Oct 2021 03:59:23 +0000
Message-ID:
 <VE1PR08MB5677A51519ADA1EE66D19C58E6809@VE1PR08MB5677.eurprd08.prod.outlook.com>
References: <20211021120319.2394-1-Hongda.Deng@arm.com>
 <e7804793-82a4-b2ac-0146-fe5bbed2bfbf@xen.org>
 <5bb464f6-0b71-d419-b05c-82abdebf85e3@xen.org>
In-Reply-To: <5bb464f6-0b71-d419-b05c-82abdebf85e3@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 631D0F1D41B7B744AEBE04DC34A20CE2.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: f8ba0f3c-3085-4829-2b37-08d995105c10
x-ms-traffictypediagnostic: VE1PR08MB5231:|VI1PR08MB2654:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB2654F068F65CEB2A1F9667B9E6809@VI1PR08MB2654.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 355MZ06+0Ns9NgGAF3ItzbJLCZUZtE+C0nTloFuXsDxvmizkiJEa5XW/8m/AMKpbKLo8/Umm77cZEBSC2CtNqe/q89LMfT5rh7a9xKCfKsr1c3zWmjWwJvsAr0Cv9wQBC0pa8bPdZgqvdo+J9hFmR0vEagEPEsskWKD8vJfHin/2dMKqcjL0ODXv7NdasEoManHNvBDvlE6ZXfwUbKZoctn/fKhXYiW29OOEGPYEDn2smz+GXY1suC9h0qQI5XdDJnUFGEIfzH0CxPWarCJxQEC679K/vHha7oxmM1xlLgyfrjD/fHb9/AKZ5akwj8EJOr3qVLOilc4/CkYm0xvUGT7b//EbtvPs9AHwtq0SbZNLab5R0yC0uU/IP5QFnnY2N35geaicJFI+Ics0xqB/dyJ1dlAOeDyXXRHFkPpnt5rSca9mut10wNyz8k0m2rKiEAM2XWcqEawi9JbWvYbB+4RapXKSE2/BbVoF1kA7ucSq+TZkJcx4+jxlVqQ0sFu9mvOe4KGcJKTyNK37SFQfzuwhqrbC/ck4ZEb8CUKwIYQhrnwNRkBNOHx123NymQryZEY6sJpKeS8SE671WSv5kUnq5ySA2A1G8ATDo6OzQtlxE930i+tmRD4TRFp0RsFYPl4w8YhzHOC3k9ln7ymI9IUkp3pwFts3M1Fclewfxzir8V1h55Gh8j5SWdBbZW8onIeDNyWjcJReop2G49HpwHu39sMFeZtxpA/9RTI+/K5AOX5VaLBRnI4ZmU+e563+wvTGkITuUG+jG+3VNrcuYD+lKENWV0rNuXOZKAEYg9E=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5677.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(122000001)(26005)(38100700002)(52536014)(5660300002)(7696005)(54906003)(316002)(83380400001)(4326008)(186003)(66946007)(33656002)(110136005)(9686003)(55016002)(6506007)(64756008)(66446008)(2906002)(508600001)(53546011)(66556008)(86362001)(38070700005)(66476007)(8936002)(8676002)(76116006)(71200400001)(966005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5231
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a9b53db0-1bef-412a-deb5-08d9951055da
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EzSBhR4TpAtj4+EyWGbsOC9nI5xPg/Mx3vvnm6xkl7f1vXBgcyxFoNiKXnnBEvxUQy+TDJwxzFHTXIeKPbo7P1oZQ9L1D3BGmG+uRagJS7Eqj/9Zwo/V+jmayTmaUssA1tiTn82yKzegYwZ6EJSCW9Ns54ao5telsLLtglygfr0ru90xGVl4CPg04N53gdcgvidGB1Q2ovXFvqYVHi66ijHqM5KMsCKIQj+aB9PdEERt3GzE6l0z89eyZI4gPcDqpEc9T8JpCOdHjGSeEhFDJJGw+PDfLLlY1iojTLE9vmsS/ynDAZDuiwm/Xi7cXKEf2mjM3LpJHzhd4Y8atpDXLJq1avCdyG2rWiLNWgQx7tflrU97Ftg7Cz+64Sospt6oiBxtFmcnIPm9mWBVyc6wuWAoKGIsUrkUegMlVeUfM5SsxFWR9qZpI/P6cZO1A44NNujHI2y8+R0Hwgw2+05JxMJfc2HgrFL6aGZHwdRZHkJBHpI5yR7xoQzaODDScemVkXxrbk3wAHRp4KCnUU0k6nX1+TGM0O+zZ8X7Oj4ysDkj3wHRLjfHgCe2e0IV8+3GJxnJDE74TGQxGi/Lb7RnNKzKKqW8Lc/NPxiG3vra3sfBaLeLVhaV/rJ6B6J7I6hGuJ2Jw5OvuSqpd0UQzfdSVJrxfJSdeh5HLAVCjL/3I9puo976ODC61+nFOTdtqT9gtTHU533+Ss4f5Wo36x8i5bY7ssBdztTdfgKky0O25s0Y4EJcKzgiyBfi4jz2rDtuGyDQLhd2yA8P7QCglcZLl3nqUG6KY6ompmPsXKCaf48=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(316002)(966005)(52536014)(8936002)(110136005)(9686003)(186003)(8676002)(26005)(356005)(4326008)(70586007)(5660300002)(83380400001)(54906003)(2906002)(36860700001)(55016002)(7696005)(6506007)(33656002)(82310400003)(53546011)(47076005)(81166007)(86362001)(70206006)(336012)(508600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2021 03:59:34.4445
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8ba0f3c-3085-4829-2b37-08d995105c10
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2654

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVuIEdyYWxs
IDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogMjAyMeW5tDEw5pyIMjLml6UgMToxNg0KPiBUbzog
SG9uZ2RhIERlbmcgPEhvbmdkYS5EZW5nQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmc7DQo+IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmcNCj4gQ2M6IEJlcnRyYW5kIE1hcnF1
aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IFdlaSBDaGVuDQo+IDxXZWkuQ2hlbkBhcm0u
Y29tPjsgSWFuIEphY2tzb24gPGl3akB4ZW5wcm9qZWN0Lm9yZz4NCj4gU3ViamVjdDogUmU6IFtm
b3ItNC4xNl0gUmU6IFtQQVRDSCB2NF0geGVuL2FybTogdmdpYzogSWdub3JlIHdyaXRlIGFjY2Vz
cyB0bw0KPiBJQ1BFTkRSKg0KPiANCj4gDQo+IA0KPiBPbiAyMS8xMC8yMDIxIDE2OjE0LCBKdWxp
ZW4gR3JhbGwgd3JvdGU6DQo+ID4gT24gdGhlIHByZXZpb3VzIHZlcnNpb24sIHdlIGRpc2N1c3Nl
ZCB0byBpbmNsdWRlIHRoZSBwYXRjaCBmb3IgNC4xNi4gU28NCj4gPiBwbGVhc2UgdGFnIGl0IHdp
dGggZm9yLTQuMTYgYW5kIENDIHRoZSBSZWxlYXNlIE1hbmFnZXIgKElhbikuIFRoaXMgd2lsbA0K
PiA+IGhlbHAgaGltIHRvIHRyYWNrIHdoYXQncyBvdXRzdGFuZGluZyBmb3IgdGhlIHJlbGVhc2Uu
DQo+ID4NCj4gPiBPbiAyMS8xMC8yMDIxIDEzOjAzLCBIb25nZGEgRGVuZyB3cm90ZToNCj4gPj4g
Q3VycmVudGx5LCBYZW4gd2lsbCByZXR1cm4gSU8gdW5oYW5kbGVkIHdoZW4gZ3Vlc3RzIHdyaXRl
IElDUEVORFIqDQo+ID4+IHZpcnR1YWwgcmVnaXN0ZXJzLCB3aGljaCB3aWxsIHJhaXNlIGEgZGF0
YSBhYm9ydCBpbnNpZGUgdGhlIGd1ZXN0Lg0KPiA+PiBGb3IgTGludXggZ3Vlc3QsIHRoZXNlIHZp
cnR1YWwgcmVnaXN0ZXJzIHdpbGwgbm90IGJlIGFjY2Vzc2VkLiBCdXQNCj4gPj4gZm9yIFplcGh5
ciwgdGhlc2UgdmlydHVhbCByZWdpc3RlcnMgd2lsbCBiZSBhY2Nlc3NlZCBkdXJpbmcgdGhlDQo+
ID4+IGluaXRpYWxpemF0aW9uLiBaZXBoeXIgZ3Vlc3Qgd2lsbCBnZXQgYW4gSU8gZGF0YSBhYm9y
dCBhbmQgY3Jhc2guDQo+ID4+IEVtdWxhdGluZyBJQ1BFTkRSIGlzIG5vdCBlYXN5IHdpdGggdGhl
IGV4aXN0aW5nIHZHSUMsIHRoaXMgcGF0Y2gNCj4gPj4gcmV3b3JrcyB0aGUgZW11bGF0aW9uIHRv
IGlnbm9yZSB3cml0ZSBhY2Nlc3MgdG8gSUNQRU5EUiogdmlydHVhbA0KPiA+PiByZWdpc3RlcnMg
YW5kIHByaW50IGEgbWVzc2FnZSBhYm91dCB3aGV0aGVyIHRoZXkgYXJlIGFscmVhZHkgcGVuZGlu
Zw0KPiA+PiBpbnN0ZWFkIG9mIHJldHVybmluZyB1bmhhbmRsZWQuDQo+ID4+IE1vcmUgZGV0YWls
cyBjYW4gYmUgZm91bmQgYXQgWzFdLg0KPiA+Pg0KPiA+PiBbMV0gaHR0cHM6Ly9naXRodWIuY29t
L3plcGh5cnByb2plY3QtcnRvcy96ZXBoeXIvYmxvYi9lYWY2Y2Y3NDVkZjM4MDdlNmUNCj4gPj4g
Y2M5NDFjM2EzMGRlNmMxNzlhZTM1OS9kcml2ZXJzL2ludGVycnVwdF9jb250cm9sbGVyL2ludGNf
Z2ljdjMuYyNMMjc0DQo+ID4+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IEhvbmdkYSBEZW5nIDxob25n
ZGEuZGVuZ0Bhcm0uY29tPg0KPiA+DQo+ID4gV2hpbGUgSSBhZ3JlZSB0aGUgUmV2aWV3ZWQtYnkg
ZnJvbSBCZXJ0cmFuZCBzaG91bGQgYmUgZHJvcHBlZCwgdGhlDQo+ID4gUmVsZWFzZS1hY2tlZC1i
eSBmcm9tIElhbiBpcyBzaW1wbHkgYSB3YXkgdG8gc2F5IGhlIGlzIGhhcHB5IHRvIGluY2x1ZGUN
Cj4gPiB0aGUgcGF0Y2ggZm9yIDQuMTYuIFNvIHRoaXMgc2hvdWxkIGhhdmUgYmVlbiByZXRhaW4u
DQo+ID4NCj4gPiBUaGUgcGF0Y2ggbG9va3MgZ29vZCB0byBtZSwgc28gSSBjYW4gYWRkIElhbidz
IHRhZyBvbiBjb21taXQ6DQo+ID4NCj4gPiBSZXZpZXdlZC1ieTogSnVsaWVuIEdyYWxsIDxqZ3Jh
bGxAYW1hem9uLmNvbT4NCj4gDQo+IENvbW1pdHRlZC4NCj4gDQo+IENoZWVycywNCj4gDQo+IC0t
DQo+IEp1bGllbiBHcmFsbA0KDQpUaGFuayB5b3UgIQ0KDQpJIGp1c3QgbGVhcm5lZCB0aGF0IEkg
c2hvdWxkIGFkZCAiUmV2aWV3ZWQtYnkiIGFuZCAiIFJlbGVhc2UtYWNrZWQtYnkiIHRhZ3MgYmFz
ZWQgb24gcHJldmlvdXMNCnBhdGNoZXMsIHNvcnJ5IGZvciB0aGF0LCBJIHdpbGwga2VlcCBpdCBp
biBtaW5kLg0KDQpDaGVlcnMsDQoNCi0tLQ0KSG9uZ2RhDQo=

