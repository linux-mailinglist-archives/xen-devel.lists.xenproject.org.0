Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A43C080E466
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 07:44:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652661.1018657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCwUz-0006p5-Vy; Tue, 12 Dec 2023 06:44:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652661.1018657; Tue, 12 Dec 2023 06:44:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCwUz-0006lk-TC; Tue, 12 Dec 2023 06:44:09 +0000
Received: by outflank-mailman (input) for mailman id 652661;
 Tue, 12 Dec 2023 06:44:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aifi=HX=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rCwUy-0006le-H3
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 06:44:08 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20603.outbound.protection.outlook.com
 [2a01:111:f400:7e89::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d80a5c4c-98b9-11ee-98e8-6d05b1d4d9a1;
 Tue, 12 Dec 2023 07:44:07 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by MN0PR12MB5881.namprd12.prod.outlook.com (2603:10b6:208:379::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Tue, 12 Dec
 2023 06:44:02 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1%3]) with mapi id 15.20.7068.033; Tue, 12 Dec 2023
 06:44:02 +0000
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
X-Inumbo-ID: d80a5c4c-98b9-11ee-98e8-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lktgO23/YzRueY0oKisF6AFR7Ad5zRNn+iDicIvDrY/x6HoVqxNLucfgDBaucx6Yd71obT655G8vhP/aI6Ljqmm9QVtIRS4xqtYe/Zyz0/gBps6DDhnAkimeRuSgyVWoFfVG7IPIbxVy5us/gNrFP6qwQNDJZNSkSLV4vWlSrHgTw/2qu2yzD9lzrq8A01fV7Zn8kKt1unuCXe58SoLK/LsFD6my92pWldVhbnZX4zm+bowpdaUA1+ey3JcQpp9tvZ3+ht0pml6EIkWke8V/LtkVEx9whXaKcOYbVf1h61eYhc+AQyPuVRE4hFefRCRC1uOpZIZ16qWqrXVVxub6jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q3UhofQ4Z6ggn38aljjXLAReiEklRAth2DDEAU82orQ=;
 b=S50dNzMRt0vQughq44l+UfAeHdsV0pK0WEvVnA+V8INT6PX2MvRiUS42Bp9+r0dr0Af9xDa0d3zSM3LOx5eJ3IuGsn5KsqDdXYEm+YNdHGmNbmbWWXFETgABV5t5cNuUUxIi0VlALW4umsufvtIixRpGOiAjIIO7LveKehSNNm76Kqt+EhIEYjzyvw9KC9/q0LtsxTHbti64hC/IXwEyxVyb5xle2lDdaisGXJkzl6dRuNvuuk8Jslv31Xcl6T/aYV4IQ5D8e+4j78D4T0ISju/etsm8WaToGFr6kskCgTm/tI8fq0XYP+aVaat3Qenl66jJQyrnzlT2c3/M9Ghvbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3UhofQ4Z6ggn38aljjXLAReiEklRAth2DDEAU82orQ=;
 b=qb2xIv+kyXE7BvBmS0KFcez0NY7qPBV3C0sl2FDsIvHTVUXko3YGc+f7CRcSldMPo4ZHDDhQyDNutu4A3TjxgSSQ9ULhdo2tP92C3xk5KPdDkCe3D2mUiqM8T/h3zUXEXbYNJ9h8nBaV/BJjHIXv0VOlnxoalYAQMBYDsiv8hQE=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Deucher, Alexander"
	<Alexander.Deucher@amd.com>, "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	"Stabellini, Stefano" <stefano.stabellini@amd.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "Huang, Honglei1" <Honglei1.Huang@amd.com>, "Zhang,
 Julia" <Julia.Zhang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v3 1/3] xen/vpci: Clear all vpci status of device
Thread-Topic: [RFC XEN PATCH v3 1/3] xen/vpci: Clear all vpci status of device
Thread-Index: AQHaK4eZ4y4R7EwUj0iEeYs1akErIbCkNISAgAGF8wA=
Date: Tue, 12 Dec 2023 06:44:01 +0000
Message-ID:
 <BL1PR12MB5849608FFBFBE6F14D28DA43E78EA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20231210164009.1551147-1-Jiqian.Chen@amd.com>
 <20231210164009.1551147-2-Jiqian.Chen@amd.com> <ZXcpGdSgTCwpTBkc@macbook>
In-Reply-To: <ZXcpGdSgTCwpTBkc@macbook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5302.namprd12.prod.outlook.com
 (15.20.7091.000)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|MN0PR12MB5881:EE_
x-ms-office365-filtering-correlation-id: 5f0cf4c2-3683-4c82-7ab2-08dbfaddba0e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 lFFXDKY3epXKN3PEV8npPxUodWX88SCAQ58ZAOMmL7s0nkaAPzGtDkSvc6IsNsUtHdj568p9i0iNqs5XphKTUh+G2K/pAKLrFexSgGuV3nEGthcAr7szXglZ/HxTJil8h5wrfln0tN+DIQbp8D9iXDXgWdTqren+pU4FMse3M4Qdb/yOZ2/to8hScIgZVhrmYBJ7s0Xxibh5uKkk1nvVjSMyNYtvb1zdDKDSY20Ia21bK1NW4CjMhvHSENQZ9rU8qyE38IYu9Q8uFfnwLUn1TqvzT6Z5fF7miCv45xOzf0B5fi3uubJyxTK/GNUk8iQcXTM4ixsyF9E/2m/Wb9+ZZDTSeQYaZ8ByOwDgQa0fmcjBBrho0PXYLM5di3sUHu4WbA029d8jqi+74htqa1iCmHp/FDqZp6RFNvYYHOgFkMlk6KU2UU/sFJk4jyDCy8mI7+c1AOi59a4HkkE3igpCUQyPEcZtoXQcmTycDtkDNLYrf1X5UbuEZ2xxGRoV9WWA8Eet8haAl8y1Y0PCutlVwapugJWEia5Lo2yDSkAIPNmu8imyqTYcLcg2U4b2V3Xu72kodiBpn7JFJCesfk/LLKmGueQrM3EN0wPySB5JNILOya+JMPEM7OsEyISH6Sps
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(376002)(346002)(366004)(136003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(7696005)(6506007)(2906002)(6916009)(64756008)(66476007)(66556008)(66946007)(52536014)(54906003)(66446008)(9686003)(71200400001)(53546011)(122000001)(38100700002)(33656002)(8676002)(4326008)(316002)(5660300002)(8936002)(55016003)(76116006)(478600001)(41300700001)(38070700009)(26005)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RkVqTnlJZE05eTgyQ1YyWTNTN1lWSFZxc1VoVG5WTG9kcU9CU1FXelJrTXRw?=
 =?utf-8?B?L2lGNGxaTHJzZU9OZDlrd1RCNmJ1aW1oanQrRmZGdmJZQitxM3hONXVzdW5W?=
 =?utf-8?B?L2ZQdkVacHZCZHpRdUVDdUVBRklkUnNsbDNrU3haVWpPMDRvcFduWGI5a0J2?=
 =?utf-8?B?NHB6MGRNeWVJQ2RBNXdNeHlUb1lBSzhKVFBIekk3c21uQU1Ta2FBWGw4S2Fu?=
 =?utf-8?B?ZWxqaTg2N3NWbGdLekp4TmRRaXlMMUFkK25GTmF5Q01JTTJpekNIdDV5Vksx?=
 =?utf-8?B?RjhqRVk4TnlVTTRUSHNBZUVReWhJMEtZR0VRaHRqdm5yMGZvK2NvTHcxZng3?=
 =?utf-8?B?eXltcUsvTitsem9kdTEzckVOeXU0SDBGTTU2ZktUSE1hYVFtSkdLeU03NEk0?=
 =?utf-8?B?UVNxUmEzeWkxcWU0RGtnbkZqdGhRT2IvRkZWQ1NKN0wxRFZqWlFldUI0RUsv?=
 =?utf-8?B?OXFyS2EyN1BLZVVESmlDRUxDYXFzRTlBdEJ2eVN6OGI1UmM2THlWbVN2VFJJ?=
 =?utf-8?B?QjN3UU8zUE50c0U1MHVUWHhiZ0gvOVMvYXVQcVJmaU5rVXJJTWhENWlyamZB?=
 =?utf-8?B?czUrdFFzcEVSODhyWGgxa2JBeE9XdnY5RVlDUlgzN2RvNmpqVmt6TTAvNHk5?=
 =?utf-8?B?WWlMcDR1d3JIL2s3cXJQRUhSL08vdUN1V0JTWkwrYVBOdFFCV2VzVWF3Z2Jm?=
 =?utf-8?B?dDc3LzQxa2JUSzY1WU9CT0RFUm4vaTM5VG8wZXBvbkZzbVA5SDJ1ZlpFUXQ3?=
 =?utf-8?B?UThoUXVuQ2RsYXplYXZqTE9zKzEvRC9GOTE1ZXJUcWc2dUdPYU1QYWx5NTVO?=
 =?utf-8?B?RE9pMjE5TWRQTXo3YlBvRm1DTXIvd0NPWkIzcFAvdFd6K3YvNkwvanlpM3NI?=
 =?utf-8?B?UEM5dVEvUUVpc08xSHllRHlSdG1xNFp0aFVGZXlFY0J0RlNYOHcvTDhSdStw?=
 =?utf-8?B?V3hBdU1zVkU3QnoxZk4xWEhBZFR0YVRJZlliZ2t5VTg5RWMwSm9RUHl1Mlds?=
 =?utf-8?B?NDNXQmMxK1h3K3dId0FvaWMwK1JBNmszdk5TbFpNYzJBMzVya2pxNGNTcnYz?=
 =?utf-8?B?NmpBQVdlRnhabXVXRHZSL201bmU4OU05NHF6Q2NFRE02QmxlR2w5cWx5OXFS?=
 =?utf-8?B?SlgyZjZQU2tEVXVaRlpNbTVObHY4TnNGU0tSTzNWdVkwMkxLOVJHWGRCMHI3?=
 =?utf-8?B?Q3J0enVwbTRKU1I5aTNZdCtuUkFCRTZNNzB0RWRuY0xBRWZEYWJmbGhLM1RM?=
 =?utf-8?B?U2VsVUx0UFhHQlZpbi9QcHRpVGRqQXBEQXFRcmluRGpmZVZxRmNsN3BTVExs?=
 =?utf-8?B?cnlYYWpxdk1OU1M1NkU4V3J2TDlydDVhR0VMRndzVGFYbHhQOEFjOGxTdWRP?=
 =?utf-8?B?TFJYYVBkd1F2Z3pvTXhBT25PekVOUVk5VytmNldscXBZOVdDUC9yUC9hS0xO?=
 =?utf-8?B?bklEbU41WXBHQ011V2hZbG9qWHVoTjRFZ2Nla0tnY01kZkZtS1BnamxSSTZa?=
 =?utf-8?B?RXE0Y2dZbEpRSGZRMWhnWHlmeDFKSHBPQzhLV0czRXJ4NG5YVjdwTXJlUEVL?=
 =?utf-8?B?MXozcUcrZ252ZTFsNksyVHJkTTJwYXQ2bmJZZHJ3U0xJcmhKbXJLK3FhZHBI?=
 =?utf-8?B?azFJdWZrUDVlbnNYWTBVUFlubnM5NG4rZVI4dGNWL0ZwK3lhcW1OOVFEYm1a?=
 =?utf-8?B?LzRSQXZ2eUpkdVRaWVYxYktURi96UEFVUjVQYlFvYXU1dHluZ0JxYkdtbElI?=
 =?utf-8?B?MzlLZlYwSHZmOURmc2pnaHNKZC9Kb0xXeS9GNnRMUENPYmxsTDBOVG5ER082?=
 =?utf-8?B?ODdFbTB0VGVnN1BUbFNhUXlHR1JrNXpmMkU5Z3kyZERScHM2Yko4L2tDNDk1?=
 =?utf-8?B?Uk1pWTU4MUtXOUZzeW1abXJubWV0YmhYdWttYUh2MkpCMExQTURJN0hEWU5E?=
 =?utf-8?B?ZitXZ2VQTVJvZ1EwMUpkSGszc3l1b1Q2VkRSWXRaQXJaQkdEelJaY2F2Mzlz?=
 =?utf-8?B?UHl0Mm9GZUFrd0QycWthZGRndlRwUWtXLzg4elE2aFpKWUd5TkJMbDY1TEJs?=
 =?utf-8?B?MTNmMnh2aERjd1VxV0hXRGc5NlJadXdGQ2M5WUdGelUybDZGb25YMXIyVUw5?=
 =?utf-8?Q?MOyU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <621729E44213894280CE7BD05AC04381@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f0cf4c2-3683-4c82-7ab2-08dbfaddba0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2023 06:44:01.9071
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NGwcsRJhEG/Cv+H8IqDpu3UmZz8G5IR3BpO1vSeW8YKXTSz1u+PAKZHL7L6SlwrEv0/qPEmRGjBdqQ3k3EbLOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5881

T24gMjAyMy8xMi8xMSAyMzoyMiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gT24gTW9uLCBE
ZWMgMTEsIDIwMjMgYXQgMTI6NDA6MDdBTSArMDgwMCwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiBX
aGVuIGEgZGV2aWNlIGhhcyBiZWVuIHJlc2V0IG9uIGRvbTAgc2lkZSwgdGhlIHZwY2kgb24gWGVu
DQo+PiBzaWRlIHdvbid0IGdldCBub3RpZmljYXRpb24sIHNvIHRoZSBjYWNoZWQgc3RhdGUgaW4g
dnBjaSBpcw0KPj4gYWxsIG91dCBvZiBkYXRlIGNvbXBhcmUgd2l0aCB0aGUgcmVhbCBkZXZpY2Ug
c3RhdGUuDQo+PiBUbyBzb2x2ZSB0aGF0IHByb2JsZW0sIGFkZCBhIG5ldyBoeXBlcmNhbGwgdG8g
Y2xlYXIgYWxsIHZwY2kNCj4+IGRldmljZSBzdGF0ZS4gV2hlbiB0aGUgc3RhdGUgb2YgZGV2aWNl
IGlzIHJlc2V0IG9uIGRvbTAgc2lkZSwNCj4+IGRvbTAgY2FuIGNhbGwgdGhpcyBoeXBlcmNhbGwg
dG8gbm90aWZ5IHZwY2kuDQo+Pg0KPj4gQ28tZGV2ZWxvcGVkLWJ5OiBIdWFuZyBSdWkgPHJheS5o
dWFuZ0BhbWQuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogSmlxaWFuIENoZW4gPEppcWlhbi5DaGVu
QGFtZC5jb20+DQo+PiAtLS0NCj4+ICB4ZW4vYXJjaC94ODYvaHZtL2h5cGVyY2FsbC5jIHwgIDEg
Kw0KPj4gIHhlbi9kcml2ZXJzL3BjaS9waHlzZGV2LmMgICAgfCAzNSArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKw0KPj4gIHhlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jICAgICAgfCAg
OSArKysrKysrKysNCj4+ICB4ZW4vaW5jbHVkZS9wdWJsaWMvcGh5c2Rldi5oIHwgIDggKysrKysr
KysNCj4+ICB4ZW4vaW5jbHVkZS94ZW4vdnBjaS5oICAgICAgIHwgIDYgKysrKysrDQo+PiAgNSBm
aWxlcyBjaGFuZ2VkLCA1OSBpbnNlcnRpb25zKCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL3g4Ni9odm0vaHlwZXJjYWxsLmMgYi94ZW4vYXJjaC94ODYvaHZtL2h5cGVyY2FsbC5jDQo+
PiBpbmRleCBlZWI3M2UxYWE1Li42YWQ1YjRkNWYxIDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gv
eDg2L2h2bS9oeXBlcmNhbGwuYw0KPj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9oeXBlcmNhbGwu
Yw0KPj4gQEAgLTg0LDYgKzg0LDcgQEAgbG9uZyBodm1fcGh5c2Rldl9vcChpbnQgY21kLCBYRU5f
R1VFU1RfSEFORExFX1BBUkFNKHZvaWQpIGFyZykNCj4+ICAgICAgY2FzZSBQSFlTREVWT1BfcGNp
X21tY2ZnX3Jlc2VydmVkOg0KPj4gICAgICBjYXNlIFBIWVNERVZPUF9wY2lfZGV2aWNlX2FkZDoN
Cj4+ICAgICAgY2FzZSBQSFlTREVWT1BfcGNpX2RldmljZV9yZW1vdmU6DQo+PiArICAgIGNhc2Ug
UEhZU0RFVk9QX3BjaV9kZXZpY2Vfc3RhdGVfcmVzZXQ6DQo+PiAgICAgIGNhc2UgUEhZU0RFVk9Q
X2RiZ3Bfb3A6DQo+PiAgICAgICAgICBpZiAoICFpc19oYXJkd2FyZV9kb21haW4oY3VycmQpICkN
Cj4+ICAgICAgICAgICAgICByZXR1cm4gLUVOT1NZUzsNCj4+IGRpZmYgLS1naXQgYS94ZW4vZHJp
dmVycy9wY2kvcGh5c2Rldi5jIGIveGVuL2RyaXZlcnMvcGNpL3BoeXNkZXYuYw0KPj4gaW5kZXgg
NDJkYjNlNmQxMy4uNmVlMmVkYjg2YSAxMDA2NDQNCj4+IC0tLSBhL3hlbi9kcml2ZXJzL3BjaS9w
aHlzZGV2LmMNCj4+ICsrKyBiL3hlbi9kcml2ZXJzL3BjaS9waHlzZGV2LmMNCj4+IEBAIC0yLDYg
KzIsNyBAQA0KPj4gICNpbmNsdWRlIDx4ZW4vZ3Vlc3RfYWNjZXNzLmg+DQo+PiAgI2luY2x1ZGUg
PHhlbi9oeXBlcmNhbGwuaD4NCj4+ICAjaW5jbHVkZSA8eGVuL2luaXQuaD4NCj4+ICsjaW5jbHVk
ZSA8eGVuL3ZwY2kuaD4NCj4+ICANCj4+ICAjaWZuZGVmIENPTVBBVA0KPj4gIHR5cGVkZWYgbG9u
ZyByZXRfdDsNCj4+IEBAIC02Nyw2ICs2OCw0MCBAQCByZXRfdCBwY2lfcGh5c2Rldl9vcChpbnQg
Y21kLCBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHZvaWQpIGFyZykNCj4+ICAgICAgICAgIGJyZWFr
Ow0KPj4gICAgICB9DQo+PiAgDQo+PiArICAgIGNhc2UgUEhZU0RFVk9QX3BjaV9kZXZpY2Vfc3Rh
dGVfcmVzZXQ6IHsNCj4+ICsgICAgICAgIHN0cnVjdCBwaHlzZGV2X3BjaV9kZXZpY2UgZGV2Ow0K
Pj4gKyAgICAgICAgc3RydWN0IHBjaV9kZXYgKnBkZXY7DQo+PiArDQo+PiArICAgICAgICBpZiAo
ICFpc19wY2lfcGFzc3Rocm91Z2hfZW5hYmxlZCgpICkNCj4+ICsgICAgICAgICAgICByZXR1cm4g
LUVPUE5PVFNVUFA7DQo+PiArDQo+PiArICAgICAgICByZXQgPSAtRUZBVUxUOw0KPj4gKyAgICAg
ICAgaWYgKCBjb3B5X2Zyb21fZ3Vlc3QoJmRldiwgYXJnLCAxKSAhPSAwICkNCj4+ICsgICAgICAg
ICAgICBicmVhazsNCj4+ICsNCj4+ICsgICAgICAgIHJldCA9IHhzbV9yZXNvdXJjZV9zZXR1cF9w
Y2koWFNNX1BSSVYsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChk
ZXYuc2VnIDw8IDE2KSB8IChkZXYuYnVzIDw8IDgpIHwNCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgZGV2LmRldmZuKTsNCj4+ICsgICAgICAgIGlmICggcmV0ICkNCj4+
ICsgICAgICAgICAgICBicmVhazsNCj4+ICsNCj4+ICsgICAgICAgIHBjaWRldnNfbG9jaygpOw0K
Pj4gKyAgICAgICAgcGRldiA9IHBjaV9nZXRfcGRldihOVUxMLCBQQ0lfU0JERihkZXYuc2VnLCBk
ZXYuYnVzLCBkZXYuZGV2Zm4pKTsNCj4+ICsgICAgICAgIGlmICggIXBkZXYgKQ0KPj4gKyAgICAg
ICAgew0KPj4gKyAgICAgICAgICAgIHJldCA9IC1FTk9ERVY7DQo+PiArICAgICAgICAgICAgcGNp
ZGV2c191bmxvY2soKTsNCj4gDQo+IE5pdDogYXNzaWduaW5nIC1FTk9ERVYgY291bGQgYmUgZG9u
ZSBhZnRlciBkcm9wcGluZyB0aGUgbG9jay4NCkkgd2lsbCBhZGp1c3QgdGhlIHNlcXVlbmNlIGlu
IG5leHQgdmVyc2lvbiwgdGhhbmtzLg0KDQo+IA0KPj4gKyAgICAgICAgICAgIGJyZWFrOw0KPj4g
KyAgICAgICAgfQ0KPj4gKw0KPj4gKyAgICAgICAgcmV0ID0gdnBjaV9yZXNldF9kZXZpY2Vfc3Rh
dGUocGRldik7DQo+PiArICAgICAgICBpZiAoIHJldCApDQo+PiArICAgICAgICAgICAgcHJpbnRr
KFhFTkxPR19FUlIgIlBDSSByZXNldCBkZXZpY2UgJXBwIHN0YXRlIGZhaWxlZFxuIiwNCj4+ICsg
ICAgICAgICAgICAgICAgICAgJnBkZXYtPnNiZGYpOw0KPiANCj4gUGxlYXNlIGRvIHRoZSBwcmlu
dCBvdXRzaWRlIG9mIHRoZSBsb2NrZWQgcmVnaW9uLCB0aGVyZSdzIG5vIG5lZWQgdG8NCj4gaG9s
ZCB0aGUgcGNpZGV2cyBsb2NrIGFmdGVyIHRoZSB2cGNpX3Jlc2V0X2RldmljZV9zdGF0ZSgpIGNh
bGwgaWYgeW91DQo+IHVzZSB0aGUgZGF0YSBpbiB0aGUgbG9jYWwgJ2RldicgdmFyaWFibGUgdG8g
cHJpbnQgdGhlIFNCREYuDQo+IA0KPiBJdCB3b3VsZCBhbHNvIGJlIGZpbmUgaWYgeW91IHdhbnQg
dG8gaW50cm9kdWNlIGEgbG9jYWwgc2JkZiB2YXJpYWJsZQ0KPiB0aGF0IHlvdSBjYW4gdXNlIGJv
dGggaGVyZSBhbmQgaW4gdGhlIGNhbGwgdG8gcGNpX2dldF9wZGV2KCkgYWJvdmUuDQo+IA0KPiBJ
IHRoaW5rIGl0J3MgYWxzbyBlYXNpZXIgdG8gcGFyc2UgaWYgdGhlIFNCREYgaXMgYXQgdGhlIGJl
Z2dpbmcgb2YgdGhlDQo+IG1lc3NhZ2U6DQo+IA0KPiAiJXBwOiBmYWlsZWQgdG8gcmVzZXQgUENJ
IGRldmljZSBzdGF0ZVxuIg0KPiANCj4gVGhhdCdzIGhvd2V2ZXIgYSBxdWVzdGlvbiBvZiB0YXN0
ZS4NCk5pY2Ugc3VnZ2VzdGlvbiwgSSB3aWxsIGFkanVzdCBhY2NvcmRpbmcgdG8gYWxsIHdoYXQg
eW91IHNhaWQuIFRoYW5rcy4NCg0KPiANCj4+ICsgICAgICAgIHBjaWRldnNfdW5sb2NrKCk7DQo+
PiArICAgICAgICBicmVhazsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gICAgICBkZWZhdWx0Og0KPj4g
ICAgICAgICAgcmV0ID0gLUVOT1NZUzsNCj4+ICAgICAgICAgIGJyZWFrOw0KPj4gZGlmZiAtLWdp
dCBhL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jIGIveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMNCj4+
IGluZGV4IDcyZWYyNzdjNGYuLjNjNjRjYjEwY2MgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vZHJpdmVy
cy92cGNpL3ZwY2kuYw0KPj4gKysrIGIveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMNCj4+IEBAIC0x
MDcsNiArMTA3LDE1IEBAIGludCB2cGNpX2FkZF9oYW5kbGVycyhzdHJ1Y3QgcGNpX2RldiAqcGRl
dikNCj4+ICANCj4+ICAgICAgcmV0dXJuIHJjOw0KPj4gIH0NCj4+ICsNCj4+ICtpbnQgdnBjaV9y
ZXNldF9kZXZpY2Vfc3RhdGUoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+PiArew0KPj4gKyAgICBB
U1NFUlQocGNpZGV2c19sb2NrZWQoKSk7DQo+PiArDQo+PiArICAgIHZwY2lfcmVtb3ZlX2Rldmlj
ZShwZGV2KTsNCj4+ICsgICAgcmV0dXJuIHZwY2lfYWRkX2hhbmRsZXJzKHBkZXYpOw0KPj4gK30N
Cj4+ICsNCj4+ICAjZW5kaWYgLyogX19YRU5fXyAqLw0KPj4gIA0KPj4gIHN0YXRpYyBpbnQgdnBj
aV9yZWdpc3Rlcl9jbXAoY29uc3Qgc3RydWN0IHZwY2lfcmVnaXN0ZXIgKnIxLA0KPj4gZGlmZiAt
LWdpdCBhL3hlbi9pbmNsdWRlL3B1YmxpYy9waHlzZGV2LmggYi94ZW4vaW5jbHVkZS9wdWJsaWMv
cGh5c2Rldi5oDQo+PiBpbmRleCBmMGMwZDQ3MjdjLi45MmMyZjI4YmNhIDEwMDY0NA0KPj4gLS0t
IGEveGVuL2luY2x1ZGUvcHVibGljL3BoeXNkZXYuaA0KPj4gKysrIGIveGVuL2luY2x1ZGUvcHVi
bGljL3BoeXNkZXYuaA0KPj4gQEAgLTI5Niw2ICsyOTYsMTQgQEAgREVGSU5FX1hFTl9HVUVTVF9I
QU5ETEUocGh5c2Rldl9wY2lfZGV2aWNlX2FkZF90KTsNCj4+ICAgKi8NCj4+ICAjZGVmaW5lIFBI
WVNERVZPUF9wcmVwYXJlX21zaXggICAgICAgICAgMzANCj4+ICAjZGVmaW5lIFBIWVNERVZPUF9y
ZWxlYXNlX21zaXggICAgICAgICAgMzENCj4+ICsvKg0KPj4gKyAqIE9uIFBWSCBkb20wLCB3aGVu
IGRldmljZSBpcyByZXNldCwgdGhlIHZwY2kgb24gWGVuIHNpZGUNCj4+ICsgKiB3b24ndCBnZXQg
bm90aWZpY2F0aW9uLCBzbyB0aGF0IHRoZSBjYWNoZWQgc3RhdGUgaW4gdnBjaSBpcw0KPj4gKyAq
IGFsbCBvdXQgb2YgZGF0ZSB3aXRoIHRoZSByZWFsIGRldmljZSBzdGF0ZS4gVXNlIHRoaXMgdG8g
cmVzZXQNCj4+ICsgKiB0aGUgdnBjaSBzdGF0ZSBvZiBkZXZpY2UuDQo+PiArICovDQo+IA0KPiBJ
IGdldCB0aGlzIGZlZWxpbmcgdGhpcyBpcyB0b28gc3BlY2lmaWMgdG8gdnBjaSwgd2hlbiB0aGUg
aHlwZXJjYWxsDQo+IGl0c2VsZiBjb3VsZCBiZSB1c2VkIGZvciBvdGhlciBwdXJwb3NlcyBpbiB0
aGUgZnV0dXJlLiAgSSB3b3VsZA0KPiBpbnN0ZWFkIHdyaXRlOg0KPiANCj4gLyoNCj4gICogTm90
aWZ5IHRoZSBoeXBlcnZpc29yIHRoYXQgYSBQQ0kgZGV2aWNlIGhhcyBiZWVuIHJlc2V0LCBzbyB0
aGF0IGFueQ0KPiAgKiBpbnRlcm5hbGx5IGNhY2hlZCBzdGF0ZSBpcyByZWdlbmVyYXRlZC4gIFNo
b3VsZCBiZSBjYWxsZWQgYWZ0ZXIgYW55DQo+ICAqIGRldmljZSByZXNldCBwZXJmb3JtZWQgYnkg
dGhlIGhhcmR3YXJlIGRvbWFpbi4NCj4gICovDQpUaGFua3MsIHdpbGwgdXNlIHRoaXMgaW4gbmV4
dCB2ZXJzaW9uLg0KDQo+IA0KPj4gKyNkZWZpbmUgUEhZU0RFVk9QX3BjaV9kZXZpY2Vfc3RhdGVf
cmVzZXQgICAgIDMyDQo+PiArDQo+PiAgc3RydWN0IHBoeXNkZXZfcGNpX2RldmljZSB7DQo+PiAg
ICAgIC8qIElOICovDQo+PiAgICAgIHVpbnQxNl90IHNlZzsNCj4+IGRpZmYgLS1naXQgYS94ZW4v
aW5jbHVkZS94ZW4vdnBjaS5oIGIveGVuL2luY2x1ZGUveGVuL3ZwY2kuaA0KPj4gaW5kZXggZDIw
YzMwMWEzZC4uZDYzNzc0MjRmMCAxMDA2NDQNCj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi92cGNp
LmgNCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi92cGNpLmgNCj4+IEBAIC0zMCw2ICszMCw3IEBA
IGludCBfX211c3RfY2hlY2sgdnBjaV9hZGRfaGFuZGxlcnMoc3RydWN0IHBjaV9kZXYgKnBkZXYp
Ow0KPj4gIA0KPj4gIC8qIFJlbW92ZSBhbGwgaGFuZGxlcnMgYW5kIGZyZWUgdnBjaSByZWxhdGVk
IHN0cnVjdHVyZXMuICovDQo+PiAgdm9pZCB2cGNpX3JlbW92ZV9kZXZpY2Uoc3RydWN0IHBjaV9k
ZXYgKnBkZXYpOw0KPj4gK2ludCB2cGNpX3Jlc2V0X2RldmljZV9zdGF0ZShzdHJ1Y3QgcGNpX2Rl
diAqcGRldik7DQo+IA0KPiBfX211c3RfY2hlY2sgcGxlYXNlLg0KPiANCj4gVGhhbmtzLCBSb2dl
ci4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

