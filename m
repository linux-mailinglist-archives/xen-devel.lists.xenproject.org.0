Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0E780E459
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 07:37:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652655.1018645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCwOC-0004jp-2P; Tue, 12 Dec 2023 06:37:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652655.1018645; Tue, 12 Dec 2023 06:37:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCwOB-0004gd-Va; Tue, 12 Dec 2023 06:37:07 +0000
Received: by outflank-mailman (input) for mailman id 652655;
 Tue, 12 Dec 2023 06:37:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aifi=HX=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rCwOA-0004gX-Ga
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 06:37:06 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060f.outbound.protection.outlook.com
 [2a01:111:f400:fe59::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd1a68f1-98b8-11ee-98e8-6d05b1d4d9a1;
 Tue, 12 Dec 2023 07:37:05 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by MN0PR12MB5881.namprd12.prod.outlook.com (2603:10b6:208:379::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Tue, 12 Dec
 2023 06:37:00 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1%3]) with mapi id 15.20.7068.033; Tue, 12 Dec 2023
 06:37:00 +0000
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
X-Inumbo-ID: dd1a68f1-98b8-11ee-98e8-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J9JQwd86JFHGZ3pdjeo6wvqVxppE6VBr3vRwvgOcoxVxlqJP1b73osefGA0GzyRUzkv97bRwu6erFLM/xSgULIfFBk4M8znDLSaOXcjmgVmiEyWs6gZ7NKbFsP6kuXkYsVXXIifZmqrI1sdu2bTL49qGN3pgsHl13M6YuS6CpahgGWgm5MtFFykQHA08YBwgTX0whd/8GUqLtFJgCgWO9F5GjUBgAIBLVfo1g6hPAX1qL3vfs6MNEw7qwF0ehmWss0lYWFw8ymR+7pz4+z/JSVLf6zX0aCKx71iXBRqzsV6ZPRR/BmKZxLarEwLeZzp50p56XmAggDkL8pKRzI/xiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GTFN+ZiMS1TahMG+uxs4O2MndfgFHskJy6IFhBP998w=;
 b=nVBfy8gEH1Mt6+JLTjqs+eIH4NFU+pQYFNrTfoe3F2z+MEmMSxCwVJ1BeDhJozIlwjUER39NO7r1fRqfMOpyZ0fazbEYZ2epl+aLPP8XeE2y4FYqz1bMTujH82dxNyn7vjIMGJRtT/eZVObA1TGVVgsEupfcchlLFijTGOqfD3zAZ/96zyXhQ32RUo2WTN3mRDaUQW+c9kml3ect82bTlDDcoth3fW5GvjUIDC8FlV4uOXOl4GsouiJNEa6zC24czTqogc/Dju4umbZnfMyrer7WaPrp6DPEwjOUR26hQlsjx92AJv68CtGj27gqU4y/rVKD4KfqPHbRIQZgv0pp4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GTFN+ZiMS1TahMG+uxs4O2MndfgFHskJy6IFhBP998w=;
 b=Aws3PJtUUdkTU5c3iz5JaVF29CK+AJDAVcRaOOXVZveWrizvsYSKHQgYWGF4vZXtpCEmqjRlHCUakf4nDGUhozIBBdxg3SIO2QkayotZF766btM6cPqeZeuyz2Is3zAHZBYqXuEBRogDCFgPAVdmsZM1gYZWd/3h/5XpDJ08Bqw=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard
	<anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Deucher, Alexander"
	<Alexander.Deucher@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, "Huang,
 Honglei1" <Honglei1.Huang@amd.com>, "Zhang, Julia" <Julia.Zhang@amd.com>,
	"Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC QEMU PATCH v3 1/1] xen: Use gsi instead of irq for mapping
 pirq
Thread-Topic: [RFC QEMU PATCH v3 1/1] xen: Use gsi instead of irq for mapping
 pirq
Thread-Index: AQHaK4lXtH9e9Sdr6Eux87H1RxVtTrCkN9cAgAGB1YA=
Date: Tue, 12 Dec 2023 06:37:00 +0000
Message-ID:
 <BL1PR12MB58495E4207750FFF1C348968E78EA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20231210165240.1551450-1-Jiqian.Chen@amd.com>
 <20231210165240.1551450-2-Jiqian.Chen@amd.com> <ZXcr5v43dsJAx8aK@macbook>
In-Reply-To: <ZXcr5v43dsJAx8aK@macbook>
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
x-ms-office365-filtering-correlation-id: f250ac85-4daf-489d-c2de-08dbfadcbef5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 FcU4raobi3bpDuJqXlAYDldzbbR6onrY/2FmYixh7v/K7u01RKhUg9mwzTBSpgxJrfScbGn44VNwpWhG2LbxgUMVIzoyWSHQlMdFmualjG89cNK9weEru73H+OhBxh6A5AoSNXYGQKTRiPjut3SQdUG/2SevCvDiMYEzVjIhYGCyVJDh8nJ8EcaMZasmY60B8NQbrFrB97N/uvAV5zhKG8qdhURpERDxrTaE8EssVNmJXlr3rAwRW01OV9/EVKnrVvlo5yF0ANCGVYojKQ61Ej9Yc+dxM44baNupwIFgu04VSFRsER7QUhajftrOBC19DRXIG5RGSCDu9F+3LaIiFDaya+Or6MEF7wDhgab5da7hMDQGDInLnVSS4lBbXoS5Fprd95fSEQHx4z5E7JppphSbDPBOG6aApoUGvUIu/FhFQ6fi2O7tiRru7fZBiGTPOhEaMXAsuPW6VRiUthspHOZIw/+0xAtXJj9m2pZmXEuL0ixd1vwAMD7hGgEX8X/xIzBJJGk0q66ZQiwTPy1tA8s50i2eycFGgv/DauworZa91BwpHe6HH6uacF0ysGKPPCoOwvvRX02vquEzH7U7peiu5yjDkQJemlQeziLR25i7OdCd5RVlaWk4xx0DQTSH
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(346002)(376002)(39860400002)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(41300700001)(83380400001)(26005)(38070700009)(33656002)(122000001)(38100700002)(5660300002)(316002)(8936002)(8676002)(4326008)(2906002)(6506007)(7696005)(53546011)(71200400001)(9686003)(52536014)(66446008)(54906003)(64756008)(6916009)(66946007)(66556008)(66476007)(478600001)(55016003)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VUlzb0FCWjRtU3paVlpHdU5Ma1lTYmVDZGhvUEpUMlJFRmQ5K3o4Q2F6dkdj?=
 =?utf-8?B?U0czUkxaM1pzeWw5ME9HNis4UE85VmVCYkNqRkVZekFVVll6SEZpV2xpNnZH?=
 =?utf-8?B?Q05TQmhrMXhrSzI0VmpOV0NvcUxQYzV0SGRBVitIT0sxYndUNmRnc2tKdWpT?=
 =?utf-8?B?M0o5Ykd4ZHFnN24vT2pnRm1ZWTFuZDdIOHZwV0lxRGREVEVjaW1lWXczbkRN?=
 =?utf-8?B?bVFsYUcrZXRkVnhxdk54bXJaOTZWdkZXSmxiN2lZakR4WVZKWTFwY0MycXAr?=
 =?utf-8?B?TjBlODM3MjAvNWtKQ29rbWQ1cDlZRm10RmJoVWZRbHpablc4UXVtVWFhbExM?=
 =?utf-8?B?WmxMV3NBb1I5ZkozaWJyQzVLYkxpWXp4UFpaa25NNU5wTDhaNHNVN1ZWNjJI?=
 =?utf-8?B?Y0N5QzhHM0xBZGQ5Y2taT2F4eW9sbHdSWlE0bHp4cmtoSmMzNUhlRnM2R09Q?=
 =?utf-8?B?bnBQVWJ5cGR0Z0pEWWJieVNrTjJRRkJhU0RUdk54NThEMVRGdDA4YTRnb3Q3?=
 =?utf-8?B?QjJKS0IwYnd1NXNqL1NTNGxlOXFXUy9SZlM4enoxeFV6NDVPN05UNTQwZUxE?=
 =?utf-8?B?QUF0UDFhMFR6RndRVS9yZzNZdStEcGdOYnA1ankxNjliVVVrM2cyTDhxUFlZ?=
 =?utf-8?B?NWYyUS9NSGNYV2dFTnYySkh0QWh4dWN0R2cvQzc5UDVQSjNXaW8xaTdIN2Zm?=
 =?utf-8?B?Ny9iQ2ovQVJhdzhFTktlbmR4MTBBbjlKQ0V4b2VoVjB4M21nL21VdmRVcG1I?=
 =?utf-8?B?T0pUcEJZaXl4REVEY25qVVNmc2tmQkZJRWZwNXVpeUhXS3JwK2VqOVhJenlk?=
 =?utf-8?B?dS9HSUlGRit4L1pPSG93S2J6VE5wOEpRN2Fwc0FRZlhwNDJuV2diY2c1M1RJ?=
 =?utf-8?B?ZFZuUjhqMzVDQ0hmd3dPaEJRRDBIN3hPRE5oUmtXMzFUUEdRQ1Z5dHM0SDJ5?=
 =?utf-8?B?QlVtem1rYU0vaW1SR3hoTHJpNStNSjR3WTkybzVNSk5KM2FaSkwwWGxPQUl5?=
 =?utf-8?B?ZzJHLzVJYmt2bEhuVTVIVUV1b0FFRy9WU3lyQ1NIbHBCM09VS0VNTzZ2K3FO?=
 =?utf-8?B?MDFWak1CZVRzQjhwZkt0N2xzMVhWb2hucm5CM1F4NDdwZmkwcE5TaGYrY1RU?=
 =?utf-8?B?WktMeXo3U0pyVGh5N1FTYUlEZHg5cnYwZGkzM3NkelVZNmlZNnJKYXdLTDFi?=
 =?utf-8?B?RE1UaGduc1NGSTd5NzkzWEdkLzA5bUZvams3UDVoSDFnMFFUeTZlcUhWNTRa?=
 =?utf-8?B?NE9FSmI4L2R0SHdDRGZqQUx1elU1czcxK3lOUHVnWENnOG5FRXhkSTRRaGJw?=
 =?utf-8?B?dUl1R0JSOVIzT3dUa0ZmdXlLdlpMblRYWEl4UUphdWltMi9MUHpGeVh4U0hE?=
 =?utf-8?B?L1NTL1lNL20wdmNKM1gwZlh3Z2dPRzJUSTQwbEdjMUpWQ2xjNlRNa3ZZUHNB?=
 =?utf-8?B?WlpoTWxNNFhCTWdER2FnM1hobDNpRlhRQ203N3NmODUyUmlkbURncGhHS3I3?=
 =?utf-8?B?ZzNXb1BiNXNYOGttY3Z2WDVTcGZXU1Rub1k0UTl0ZWphMGFRMzFiTnJ3RFJH?=
 =?utf-8?B?c3lBQ1pTb0pzc04rY3IySjZnQVhCcVBzL25RaSs5bnR0WmtjZmViT0ZjZ0l6?=
 =?utf-8?B?S291ZDJQblJUWUlmZWJoT3Z2OURiWWZUMEk1NEpqY0oyVE1HWFE1SG9QV3Jn?=
 =?utf-8?B?NFFweFVvSEwxTkswNnJyL01yaXM2UnExMVRwTEJCQVNjVHpUS2N0TGpCTUNP?=
 =?utf-8?B?UFEyaGJvbWtYaHNuLzh5RFlndDFMZnpjWnFHL2pOaVdFdTBPb0J4Z2dmbE5B?=
 =?utf-8?B?ckpPSzhKZWpVbmF5NDZtdEdBQ1VJZFpocGwyMCswZVE0eGg4UXhacnROUCtn?=
 =?utf-8?B?R0dTeUphVTZNdmdCM0ZPamZnYzh2M2dySnMzUlBwN3A4YlpyQ2E5Zld3VmxF?=
 =?utf-8?B?b0tkelpDZnpDODVsM1A5aytYOGZEWFJycThBNUdYWEdyQzBEY25ZUTVxcG9P?=
 =?utf-8?B?ckxsbW1QR3YzQkpqQmN0OHlHZmw4WmozendxYlhYdE5XdURPSjIrMHp3dUFC?=
 =?utf-8?B?NUxMZW9DdEVuY05TclFnSWprZkh0RkRqZ3ZKKzZnazRNdnNZNTQ4NGhzdmJ6?=
 =?utf-8?Q?BApQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <12E09E1B444C5E4BA400A861241A9156@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f250ac85-4daf-489d-c2de-08dbfadcbef5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2023 06:37:00.6338
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: naRE17VYtKtjxt3EHLEj2kskswEmEpY7g05FuGm8xu5VScg2FsFL4B+XoGZuA4hWsLd2dqFQVGM519N63ZUlIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5881

T24gMjAyMy8xMi8xMSAyMzozMywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gT24gTW9uLCBE
ZWMgMTEsIDIwMjMgYXQgMTI6NTI6NDBBTSArMDgwMCwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiBJ
biBQVkggZG9tMCwgaXQgdXNlcyB0aGUgbGludXggbG9jYWwgaW50ZXJydXB0IG1lY2hhbmlzbSwN
Cj4+IHdoZW4gaXQgYWxsb2NzIGlycSBmb3IgYSBnc2ksIGl0IGlzIGR5bmFtaWMsIGFuZCBmb2xs
b3cNCj4+IHRoZSBwcmluY2lwbGUgb2YgYXBwbHlpbmcgZmlyc3QsIGRpc3RyaWJ1dGluZyBmaXJz
dC4gQW5kDQo+PiB0aGUgaXJxIG51bWJlciBpcyBhbGxvY2VkIGZyb20gc21hbGwgdG8gbGFyZ2Us
IGJ1dCB0aGUNCj4+IGFwcGx5aW5nIGdzaSBudW1iZXIgaXMgbm90LCBtYXkgZ3NpIDM4IGNvbWVz
IGJlZm9yZSBnc2kNCj4+IDI4LCB0aGF0IGNhdXNlcyB0aGUgaXJxIG51bWJlciBpcyBub3QgZXF1
YWwgd2l0aCB0aGUgZ3NpDQo+PiBudW1iZXIuIEFuZCB3aGVuIHBhc3N0aHJvdWdoIGEgZGV2aWNl
LCBxZW11IHdhbnRzIHRvIHVzZQ0KPj4gZ3NpIHRvIG1hcCBwaXJxLCB4ZW5fcHRfcmVhbGl6ZS0+
eGNfcGh5c2Rldl9tYXBfcGlycSwgYnV0DQo+PiB0aGUgZ3NpIG51bWJlciBpcyBnb3QgZnJvbSBm
aWxlDQo+PiAvc3lzL2J1cy9wY2kvZGV2aWNlcy88c2JkZj4vaXJxIGluIGN1cnJlbnQgY29kZSwg
c28gaXQNCj4+IHdpbGwgZmFpbCB3aGVuIG1hcHBpbmcuDQo+Pg0KPj4gVXNlIHJlYWwgZ3NpIG51
bWJlciByZWFkIGZyb20gZ3NpIHN5c2ZzLg0KPj4NCj4+IENvLWRldmVsb3BlZC1ieTogSHVhbmcg
UnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IEppcWlhbiBDaGVuIDxK
aXFpYW4uQ2hlbkBhbWQuY29tPg0KPj4gLS0tDQo+PiAgaHcveGVuL3hlbi1ob3N0LXBjaS1kZXZp
Y2UuYyB8IDIgKy0NCj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvaHcveGVuL3hlbi1ob3N0LXBjaS1kZXZpY2UuYyBi
L2h3L3hlbi94ZW4taG9zdC1wY2ktZGV2aWNlLmMNCj4+IGluZGV4IDhjNmU5YTE3MTYuLmUyNzBh
YzI2MzEgMTAwNjQ0DQo+PiAtLS0gYS9ody94ZW4veGVuLWhvc3QtcGNpLWRldmljZS5jDQo+PiAr
KysgYi9ody94ZW4veGVuLWhvc3QtcGNpLWRldmljZS5jDQo+PiBAQCAtMzY0LDcgKzM2NCw3IEBA
IHZvaWQgeGVuX2hvc3RfcGNpX2RldmljZV9nZXQoWGVuSG9zdFBDSURldmljZSAqZCwgdWludDE2
X3QgZG9tYWluLA0KPj4gICAgICB9DQo+PiAgICAgIGQtPmRldmljZV9pZCA9IHY7DQo+PiAgDQo+
PiAtICAgIHhlbl9ob3N0X3BjaV9nZXRfZGVjX3ZhbHVlKGQsICJpcnEiLCAmdiwgZXJycCk7DQo+
PiArICAgIHhlbl9ob3N0X3BjaV9nZXRfZGVjX3ZhbHVlKGQsICJnc2kiLCAmdiwgZXJycCk7DQo+
IA0KPiBEb24ndCB5b3UgbmVlZCB0byBmYWxsdGhyb3VnaCB0byB1c2UgdGhlIGlycSBudW1iZXIg
b24gZmFpbHVyZT8NCj4gT3RoZXJ3aXNlIHBhc3N0aHJvdWdoIHdvbid0IHdvcmsgb24gb2xkZXIg
TGludXggdmVyc2lvbnMgdGhhdCBkb24ndA0KPiBleHBvc2UgdGhlIGdzaSBub2RlLg0KWW91IGFy
ZSByaWdodCwgSSB3aWxsIHVzZSB0aGUgaXJxIGlmIHRoZXJlIGlzbid0IGEgZ3NpIHN5c2ZzLCBp
biBuZXh0IHZlcnNpb24uIFRoYW5rIHlvdS4NCg0KPiANCj4gVGhhbmtzLCBSb2dlci4NCg0KLS0g
DQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

