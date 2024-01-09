Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F75828000
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 09:01:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664312.1034433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rN73G-0001Rx-IE; Tue, 09 Jan 2024 08:01:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664312.1034433; Tue, 09 Jan 2024 08:01:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rN73G-0001Pl-F5; Tue, 09 Jan 2024 08:01:34 +0000
Received: by outflank-mailman (input) for mailman id 664312;
 Tue, 09 Jan 2024 08:01:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2W5I=IT=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rN73E-0001Pd-F2
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 08:01:32 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7e83::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b61b99e-aec5-11ee-9b0f-b553b5be7939;
 Tue, 09 Jan 2024 09:01:30 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SJ2PR12MB8832.namprd12.prod.outlook.com (2603:10b6:a03:4d0::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 08:01:25 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1%3]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 08:01:24 +0000
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
X-Inumbo-ID: 4b61b99e-aec5-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oTMcNSNuhNCzH1zAZc1QIgkBkaipAHZg/O7pzI24z4FeyO3FqoFJil1JLwno7Dvh8AI2E40Tnezv40t2zP1Pi83KXWgiwLBuxRFeTBYrlz3gmXwC5r6B2ib0ifh3EzZUS96061/j5aIttP4XbP5P/uaBvUkvJaz9Vzemk4piH+6VZ9StnZngScBg5JElvhXR5Jo1S9qzNuXIk3UvtbMeDtGeIA6nFZr2KYOHXqc/qGuHux7kkAC8jG1ZyVtjrjpTG9y/HNlhtP0RnLF6eG1C0+GY8jR+h+IWtAFDmFUrtZilhCZnoftWw3WmnoC6b8vcPn46i3bseq6ryZNsMU9qdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=APEEs3xdBsbebMVnachXSnPg39wFpg4nTqq/kuREfxw=;
 b=B3KN7NRYUmKqzb5YrJYc/7QGcUEhLe0qd8qn5+tSF6Dk3UjTXQ1SNCMkFKckkKQvQ2Al2MEb2SzDLv+CpqHuVbk3sZWiESQu1/yfb0UbWMH9RnwPI3GHL34GU0tsDh3xQSjOmtxmE1qR6mg7yD19nKyTcjSES8F88gW/nTtyLdIrkmxsYa2xkC1LPwddszWhzqxmRVW1j0/jnt+iCKWnJjqpEcUk6X1mBJ6W04wZXZQ34kIQ8hjgVlobY2VFiv0DM5W+xwFG77qPFHnnASFPyP40rWv/nyF8YFxiX4QgZunsCA4iT6xkbr5I6T4RALtXZm/vS6vqJ5BEUZyshB/gXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APEEs3xdBsbebMVnachXSnPg39wFpg4nTqq/kuREfxw=;
 b=1MahocspQX3T5aM1GLBu5rE1wuxtokdPwy97fNQEetQJ9YwlOMCHr5GYDUMPPQJZn6KglNLnw9xql5ICi6V4v6g5qFZRMwV5366l7b/K0yI8PeGC7yfLD23dPx/QlCGKjClHO4W46BQUXD9WFTHShrC8kVvOO7DNg3FZTpmVNIo=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Hildebrand,
 Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v4 3/5] x86/pvh: Add PHYSDEVOP_setup_gsi for PVH
 dom0
Thread-Topic: [RFC XEN PATCH v4 3/5] x86/pvh: Add PHYSDEVOP_setup_gsi for PVH
 dom0
Thread-Index: AQHaP6Y0Nj7ifAZhiEaHi72EzvHXWbDL9nOAgAOpxICAAgn6AA==
Date: Tue, 9 Jan 2024 08:01:24 +0000
Message-ID:
 <BL1PR12MB584962C05A039CF18A794779E76A2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240105070920.350113-1-Jiqian.Chen@amd.com>
 <20240105070920.350113-4-Jiqian.Chen@amd.com>
 <alpine.DEB.2.22.394.2401051651270.3675@ubuntu-linux-20-04-desktop>
 <5db2cde7-7fb1-460f-ab78-c462c3a1d46e@suse.com>
In-Reply-To: <5db2cde7-7fb1-460f-ab78-c462c3a1d46e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5045.namprd12.prod.outlook.com
 (15.20.7181.004)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SJ2PR12MB8832:EE_
x-ms-office365-filtering-correlation-id: 40b20670-fd7e-4daf-91b0-08dc10e92d16
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 aAwXXZfhKazivZ6Bi5EcCLSl72wXpuzBIvJNERq1tX8zgRjAVNtVfr5PuDEk7BPYmrdyQD9JVqBq4e//K/PNeaMWyKGxwFyOtExa44Th4wUIzjUhcyLyArfxeIQCtcI+e1nd52IH1V2lT9nHQcxsITg+vo7AgNkiC0kOWWpgDFJ4NwK5it2EJSfYmx+0Tz2EkbCSq1pyx2cIqpspN6LiZqL8zVp1TiSkJNWee6mQkzRHtdiyw20K3QkNv0rKHKZ/Q9ddGReUgx2OB2N7XEo4xcrzX1akd0CBxtjPA8Gm3PJ0293eOr2HRt8256U4JF4MGIMZMQr6Y9z6GVszaLH1h205DgqPuYvWwH/k9YGuOVS7IfPr+/GwgZbrbEoinDHtMS1Uedo0IaShUG8mbP8qBJVXVomO4y5tm8KxvKstfsXO2OXMuM2qS9Odt0ujjg226OhZSZOyrICFysFLI5O92UvgRMCPe2qGHubMx73Za0GjDy1qHjkcyvgyRSTieg1Iu37E/iYtP7SlbuycOKm+htd6Z3DlYagKgiIDm4R55Lmk/eA1j2AGdcYBtHnULGj5R+fMcZ+6FEaeoAr0SgpB0tox7nhCx0KXCXabopZpvTWHxnY4+XGh9VRE2pPB3KQQ1FTPP+lI25Z3FQr3IJ8ujLwcPSxw2Ze7hQAZp8HX7Zw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39860400002)(136003)(396003)(366004)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(6506007)(9686003)(53546011)(26005)(122000001)(38100700002)(8936002)(8676002)(4326008)(52536014)(7416002)(478600001)(5660300002)(2906002)(7696005)(54906003)(110136005)(71200400001)(64756008)(66556008)(66476007)(66446008)(316002)(66946007)(41300700001)(76116006)(38070700009)(33656002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bFBWcklvcUx6RlVrWUhIVUlwNDdxMFVqOWpPdUNIM3VGOHJrbUtodEhGcTVm?=
 =?utf-8?B?NzBxMEJkUmNtT1UrN1QwYWhwUGoxODZpREd6a1IxNWJONXJTSDFuWmdLNEhY?=
 =?utf-8?B?Y3FYaE5wZjhjTUpNRGk2TFZsTzQ5dC95TjVtMWtGT053MkZvZm5GY2dUVXc2?=
 =?utf-8?B?eXRyaFFLS0w1WTdJNzZYZk52aXRmcHE3VERaSEhENCtPZWhtdlYwVEVRVUd3?=
 =?utf-8?B?bVh4eVJIYUwrd1AwNXdITE5XYzdScmVQZ0I0SDk2dXhjQ05tOGNtOUc0bDR4?=
 =?utf-8?B?K2FhRnFYYjNWbkg5MHVpVmFpdnJzTlowQkNIVFptYUdnMDFsL2NkSkpBd2l3?=
 =?utf-8?B?a1A1Ny9xcXNtUEdUcmloNUN4Y1cyVUg5Z25BUWU4dGlzRjlhUmZjaGN6Zy9s?=
 =?utf-8?B?ZmxSVHBQaHNlR1V5MXZJQkVaMm1zU3ZacW9vNDRmQzNuWVhFMzJtQkk1bkFC?=
 =?utf-8?B?azVmSTZvT3BaSUlyT3AyUjdIcE01SktGeGs0SmVHMi9aQVZHT0FYT1drTmo5?=
 =?utf-8?B?TEhZMzExaExvcjh5SVhTSU5TZC94N0ViakxybFk1VEs3VUtWNFN4SnVnN0Y5?=
 =?utf-8?B?OW1RTUJOMitLN2lENDliR2NxcEZnWk1CdXlhVG9pOStDN1k2dUdsMDVRTVBC?=
 =?utf-8?B?TFAzN1VqQVkrK0JaZXVOY1BENnl6RTVBRk9ydWF6Um43SWNyK1pXaFl4LzBo?=
 =?utf-8?B?eUxIbmYyc0hRcU80bG9iK3ZFUFJnQ1hKLzNUTzlOY0o0dVV2RXdZd09kbldY?=
 =?utf-8?B?QzQxRklrR01BK1dFbmVJSzNUNlhKRVFIMEFlRzBSUTJYcDMvUnJZYkNXVlNI?=
 =?utf-8?B?bG90cXFKWFVQMm5LK2FkSE94QW15R2FvMnByOThLK2l2L3U5d21XM1RaMnox?=
 =?utf-8?B?VVlhNFNXZE9uU1hzSTgvbGcvMVNCcG9NMkRWMmFheXlXM1dvUzdnNWRON0Ro?=
 =?utf-8?B?WFJmTVNRUFE2NTlVb2x4T2JDbEpMZnpPMWdDSEZwSnh6QllmajEyOHlRSUFV?=
 =?utf-8?B?VXRvTy90K3JzcWxkanFEZE1aZk1lUnJGUDVieithL1d0Rm0xZjJ4VWZiUXBj?=
 =?utf-8?B?Y0IrZTBQcW1zVE9MTHMrZ2hHMU5qRFhENE5yQmFKcUtacGE5T3k5TzV4ZmFQ?=
 =?utf-8?B?dUhyZGpKamE5R2Rjakg5MDhUeTZ3VHU4L1Y1M2l0OCtWQ1VpUHVUcm9DNzNh?=
 =?utf-8?B?NVBHVEduQ3dSeDhVdjBHSW0xdWg0NFphK0w0bkJOeGxXY2NEaUtMaWV0MVdR?=
 =?utf-8?B?MnlqV0F5WFBCOTdBRkFhcVlBM1dKQ0NqNlJ0VTNmS3g1UGNMam5aWGtGR3Nk?=
 =?utf-8?B?QmlXMVdhTzJ1MzJ2eFR3RVBmZlpDQ1lIOWJWbS9nN0t0R2pvUkRGdThYUUpK?=
 =?utf-8?B?YUxRSVFubm1qR1JEMkNHQVZHTGVOTm8yRVh3UTJBQjV6NkV3bmg2NzNrRmJ3?=
 =?utf-8?B?ak9WOS9oZlVNU1pYTkQvNm1JbmxBakVVYW1KTktrbHpwclBSdkFabXhxNWQ0?=
 =?utf-8?B?dDV4TGw1b243ZWFSZUhKMXhlQkVJNWl6TEJPNnMyUnJxY2hvTG1YOXNkVUtP?=
 =?utf-8?B?K1RCSSszOGxSS2xhK0MyOVFhaER5djhLU3JwVndOdUVFM3VPalBINnlkY0Vk?=
 =?utf-8?B?aEtzM3FQUVVsMDk4aThzcHBoVkpLQk9leXkwcnk2bFV4SFM2WW1VMFFnTXpi?=
 =?utf-8?B?MWIvdTBWL3BNdkZaaGw1MTIxc3JKNzhzMDlZdHRaQUNWaUNXSkl2SEJkOWlG?=
 =?utf-8?B?WEd0SEwzWm8yNmY1Z1FDemlxV1RNR3hETHF4bTRyemN3WjZLMGJoU1dUbzhJ?=
 =?utf-8?B?Q0VJTjV0VW5IcGVMM3htWjNKa3UrbEo4TmxscmtlK2tZZ1pSVlMvc0Nha3JE?=
 =?utf-8?B?UldCS2NFcTZkaTM0VUxublFNQzhRbTFVRWpIanhQczVOSHY3WUowSnN3QXgr?=
 =?utf-8?B?T3NkT1ZXUlpSNlNFLzJyUTRHOFJKNjY4RDM3ditINVNENWZDVjArZDFCTWVa?=
 =?utf-8?B?Nnp0c0JjWHZlZk9WR1VUSkZzMXdPbENjeTRLMExDamJiZnlJN3BwUE16bW8r?=
 =?utf-8?B?bmp0UzFsNHd1dXQrYmZOMWpqc3dQNG1vVHo4RlVQMlZualp3ckpWdStEUDlq?=
 =?utf-8?Q?8vTI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <767A4CE58131B64A959AEF3355F37A17@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40b20670-fd7e-4daf-91b0-08dc10e92d16
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2024 08:01:24.9088
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BxFRSxdEOyOmz0J4RbtWIolucRAU3Zk33kbFlw3EaiQdO8vR3+DsXpFqZgEO8IYHUEI+axswGCW275v8AKKJfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8832

T24gMjAyNC8xLzggMTY6NTAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNi4wMS4yMDI0IDAx
OjU0LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+PiBPbiBGcmksIDUgSmFuIDIwMjQsIEpp
cWlhbiBDaGVuIHdyb3RlOg0KPj4+IE9uIFBWSCBkb20wLCB0aGUgZ3NpcyBkb24ndCBnZXQgcmVn
aXN0ZXJlZCwgYnV0DQo+Pj4gdGhlIGdzaSBvZiBhIHBhc3N0aHJvdWdoIGRldmljZSBtdXN0IGJl
IGNvbmZpZ3VyZWQgZm9yIGl0IHRvDQo+Pj4gYmUgYWJsZSB0byBiZSBtYXBwZWQgaW50byBhIGh2
bSBkb21VLg0KPj4+IE9uIExpbnV4IGtlcm5lbCBzaWRlLCBpdCBjYWxsZXMgUEhZU0RFVk9QX3Nl
dHVwX2dzaSBmb3INCj4+PiBwYXNzdGhyb3VnaCBkZXZpY2VzIHRvIHJlZ2lzdGVyIGdzaSB3aGVu
IGRvbTAgaXMgUFZILg0KPj4+IFNvLCBhZGQgUEhZU0RFVk9QX3NldHVwX2dzaSBmb3IgYWJvdmUg
cHVycG9zZS4NCj4+Pg0KPj4+IENvLWRldmVsb3BlZC1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdA
YW1kLmNvbT4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBKaXFpYW4gQ2hlbiA8SmlxaWFuLkNoZW5AYW1k
LmNvbT4NCj4+PiAtLS0NCj4+PiAgeGVuL2FyY2gveDg2L2h2bS9oeXBlcmNhbGwuYyB8IDYgKysr
KysrDQo+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykNCj4+Pg0KPj4+IGRpZmYg
LS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL2h5cGVyY2FsbC5jIGIveGVuL2FyY2gveDg2L2h2bS9o
eXBlcmNhbGwuYw0KPj4+IGluZGV4IDYzMmE2OGJlM2NjNC4uZTI3ZDNjYTE1MTg1IDEwMDY0NA0K
Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaHlwZXJjYWxsLmMNCj4+PiArKysgYi94ZW4vYXJj
aC94ODYvaHZtL2h5cGVyY2FsbC5jDQo+Pj4gQEAgLTk3LDYgKzk3LDEyIEBAIGxvbmcgaHZtX3Bo
eXNkZXZfb3AoaW50IGNtZCwgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcpDQo+Pj4g
ICAgICAgICAgYnJlYWs7DQo+Pj4gICAgICB9DQo+Pj4gIA0KPj4+ICsgICAgY2FzZSBQSFlTREVW
T1Bfc2V0dXBfZ3NpOg0KPj4+ICsgICAgICAgIGlmICggaXNfaGFyZHdhcmVfZG9tYWluKGN1cnJk
KSAmJiAhaGFzX3BpcnEoY3VycmQpICkNCj4+PiArICAgICAgICAgICAgYnJlYWs7DQo+Pj4gKyAg
ICAgICAgZWxzZQ0KPj4+ICsgICAgICAgICAgICByZXR1cm4gLUVOT1NZUzsNCj4+DQo+PiBJIGFt
IG5vdCBzdXJlIHdoYXQgaXMgdGhlIGJlc3QgImlmIiBjaGVjayBmb3IgdGhpcyBzaXR1YXRpb24g
YnV0IEkgYW0NCj4+IGd1ZXNzaW5nIHdlIGRvbid0IG5lZWQgaGFzX3BpcnEoY3VycmQpLiBNYXli
ZSB0aGlzIGlzIHN1ZmZpY2llbnQ6DQo+Pg0KPj4gaWYgKCBpc19oYXJkd2FyZV9kb21haW4oY3Vy
cmQpICkNCj4+ICAgICBicmVhazsNCj4+IGVsc2UNCj4+ICAgICByZXR1cm4gLUVOT1NZUzsNCj4g
DQo+IE1heWJlDQo+IA0KPiAgICAgaWYgKCAhaXNfaGFyZHdhcmVfZG9tYWluKGN1cnJkKSApDQo+
ICAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOw0KPiAgICAgQVNTRVJUKCFoYXNfcGlycShjdXJy
ZCkpOw0KPiAgICAgYnJlYWs7DQo+IA0KPiA/IFdoYXQgSSBwcmltYXJpbHkgZGlzbGlrZSBpbiBi
b3RoIGVhcmxpZXIgcHJvcG9zYWxzIGlzIHRoZSAoaW1vDQo+IGNvbmZ1c2luZykgdXNlIG9mICJl
bHNlIi4NCkl0IGxvb2tzIGxpa2UgbW9yZSByZWFzb25hYmxlLiBJIHdpbGwgY2hhbmdlIHRvIGFz
IHRoaXMgaW4gbmV4dCB2ZXJzaW9uIGlmIHRoZXJlIGFyZSBubyBvdGhlciBndXlzIGhhdmUgZGlm
ZmVyZW50IG9waW5pb25zLg0KDQo+IA0KPiBKYW4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFp
YW4gQ2hlbi4NCg==

