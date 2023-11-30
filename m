Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE267FEFB1
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 14:03:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644676.1006043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8ghW-0003VW-Pu; Thu, 30 Nov 2023 13:03:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644676.1006043; Thu, 30 Nov 2023 13:03:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8ghW-0003TF-Ma; Thu, 30 Nov 2023 13:03:30 +0000
Received: by outflank-mailman (input) for mailman id 644676;
 Thu, 30 Nov 2023 13:03:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NfjJ=HL=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1r8ghV-0003T9-6c
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 13:03:29 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061a.outbound.protection.outlook.com
 [2a01:111:f400:fe59::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9dcecfd-8f80-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 14:03:27 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DS0PR12MB7849.namprd12.prod.outlook.com (2603:10b6:8:141::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Thu, 30 Nov
 2023 13:03:24 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1%3]) with mapi id 15.20.7046.024; Thu, 30 Nov 2023
 13:03:24 +0000
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
X-Inumbo-ID: d9dcecfd-8f80-11ee-98e4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jIwZNUvguKiQfphSGM+rHHnq8Uggs20LigMoRvn1X/GsDdOpFYXMNwe/o6ey11mtPK5YQP7hh5PMhfbIkfdagMkCFIISjG3tXyQfgJbO9VhEBYnVCAFHf6O9718wegPDaRlxYG2gzl7o1rUv7/9/rRNT7ndqUWfGuWt5P7w6x/a3pGQfiElB3ZkJlKNlUQHQc4EN2qP4rcfJz6rgKZ/XTqWGn0/BFy5mUad7BYNIzzJrNI/N9xKG8JhcCcUP4qtfdBeyF8toSozR95C7AlgLxSzOIESPoWojMCR40VgiBcHcrCJ/hXHvlvVCxcdePUK1O+QPy4m7hn5fJEe8wfuN6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HoJgKJe2TF6ZmZqQgzGJy4Ju7EGk5pYlcAaMdjBgs6U=;
 b=ZV8a9h6C9kLbNkUtUr4xcpY7r0hhBvOY2Y8OU3OgB4Zvw0RWu5E9+bqAQja6vKer84JlL3mYY9dzSKbbRdPAqvs+3SYpDo7bZtNfZVGgIt7l+jhTNGFEF/K1H5mRUe8kTQSRyAdhg6PGKClHUGJ32CSBT6gasZfuioekmyUvSbUoh4FfN84T3bj4XwduRqVuiya3cCIj7yhbwvWrYYtZM4pejt/VSpEgBAC4lupRti1RCaAI3pdOcUl/7e4G12bghAeHv8Y8EwIGGNbLWawCNauLai2QpPoUWlzgMZlkPMUfsK6Je/bhl8RVAVFI+7cDeO70OizRcbJZeHtbBxOjqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HoJgKJe2TF6ZmZqQgzGJy4Ju7EGk5pYlcAaMdjBgs6U=;
 b=FcvRfGDO6AlATe31MEkj9cAdy8e0Imv2A209to8shqtsOBxK2xOlL4Bn4GwTs3TUhoRDj40PgZ+8qwBavKhyr6hzOQBBipM2TK+eyvw6S7AaZymysDQZ4Aq7xQ3J3wecHuz1BWwAOdu5RD38iek3wuRSe+XUKaGXUYkNbH7fVGI=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Deucher, Alexander"
	<Alexander.Deucher@amd.com>, "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	"Stabellini, Stefano" <stefano.stabellini@amd.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "Huang, Honglei1" <Honglei1.Huang@amd.com>, "Zhang,
 Julia" <Julia.Zhang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [RFC XEN PATCH v2 1/3] xen/vpci: Clear all vpci status of device
Thread-Topic: [RFC XEN PATCH v2 1/3] xen/vpci: Clear all vpci status of device
Thread-Index: AQHaHsLfq+dfGUvRWUqPIEH3O9fXrbCPyyeAgAMgFYD//+e9gIAAjwuA
Date: Thu, 30 Nov 2023 13:03:24 +0000
Message-ID:
 <BL1PR12MB5849B20A8A9D5D7856E84158E782A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20231124104136.3263722-1-Jiqian.Chen@amd.com>
 <20231124104136.3263722-2-Jiqian.Chen@amd.com> <ZWX0U1tYooY70UJo@macbook>
 <BL1PR12MB58493CC28A32E3C9B3A1767FE782A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <14d2dd16-be21-4e9a-97eb-bb477af49e73@apertussolutions.com>
In-Reply-To: <14d2dd16-be21-4e9a-97eb-bb477af49e73@apertussolutions.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: IA1PR12MB8495.namprd12.prod.outlook.com
 (15.20.7068.000)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DS0PR12MB7849:EE_
x-ms-office365-filtering-correlation-id: 4e5a3050-3502-42c6-cdba-08dbf1a4bc62
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 AaH+dZ9iwfYPZnOX/BGpMWE3qwf/cN8SaPjkuUo0NQZD2+9Cl0Q9rVckXSMK5uP1FkK0sosz9+7s1pamEpvrb2K7lLKN2jLU36quJJi7WuErxn6ngNw2qqnCVzbgXjaZb20kGVc+IrYCx9ZACjfXZN7NyDFRAtnnHggs83M4Nf78YDUM0o9jXHfiNPfHRsmUg3cgVSsL3T5MOmgWDt/6XayDxgdrd8drgYray+ZfUadNAOK5HmRxON0huVd+Z4L3ApSWH/U+V7TleJNd+tOMBy8txPdmHbDhoRm1xcO3Xnv4RPiyE+QY807gVWVnq625zhT5pyrjudBkV8oGzSpcGv4SCrMhRuYqn5+SaNvyvu1mhgzYZu4ywK0qN78CeINB/sd2FA1l9KsYrzfrbEbqsxDyBZqWmuvViQDtn1LSmF7QyQhv99t5QWr+20u79lr3NgPq7yjvhF4KGfhS22acKsGD7NdXv3Ak3Dfxk7Hss+zWvetLqO404X5v9CThb8encZ8U9RvJwvY1HKKssTbE/1liUirv9BkqKeYAK6b8F/0csshFZ/BxYrW12n9H5XzQi5nPNr0UQk2ox2WDSClMOOo1cBoAOK02eaRt2v6K3QRQNgRaKF3Tm7M9Z38eE3K+
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(346002)(376002)(396003)(366004)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(6506007)(26005)(83380400001)(53546011)(7696005)(9686003)(122000001)(5660300002)(4326008)(8676002)(52536014)(8936002)(41300700001)(2906002)(478600001)(316002)(71200400001)(6916009)(54906003)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(33656002)(38100700002)(38070700009)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Zjg2a2w2WkE5WmtCT3ZSUWlESXFLS2lPTUxacnE5TFFGcndIVFU0cUlxdUV5?=
 =?utf-8?B?eHo4T3RvWjhyWmpDZjhJVjQ3b1llTVVaaU5tZTdEZGM2WWR0c2dkYlJJNGY2?=
 =?utf-8?B?MWpnemdWNzV2WGdnR0FZa2JiZDA2djI2U2dWNmlYWHN2TkU4eXQ5d3VFQmsz?=
 =?utf-8?B?a3NTdFh6VFlxOHlZTVRBR1RMUnV1S2NldzBwN2dEZmFsVWJPcE9Ud2U0QSs0?=
 =?utf-8?B?b3grK2cvcHduMEdNTUUvK2tJUnJuZ0pla3c0dzVvTi9wb0dpR1FTZWcrbE1S?=
 =?utf-8?B?ZW1FSTJTVUZsam43OXg4cmR4aUliUW1aSXFtZlNzUmxncUc0N1dkcVkrdENh?=
 =?utf-8?B?azVwZ2JvaTVNZVNhZTZna0Iyc3c5c1F6N1BpVVZDOFdiTTRVWFU4dWhOczY2?=
 =?utf-8?B?bjN5czEvS284bTF1c0FicDBJQ0gzcm1uQUVOTWx0UUVZdDJSYzY1YVkxNTJ1?=
 =?utf-8?B?Y1NMaUhvVzMrYml1M0R3MmFXTGU3ck8wOCt4RGJJd3N1MFArUGNpdFZGMzBx?=
 =?utf-8?B?VzhIY2NNVVlGQmxwNE9JaEpYUmNFMnp3N1krVFI1TDIzeWF3a1ZydDN3ajdj?=
 =?utf-8?B?R2VwNnMrMzZUdXdNclRRcnFVRHd3Szh2Z2UvVE1BVmMwc1ZkWEM1V3doZHdp?=
 =?utf-8?B?U2pHbU5WYmYwa1Ryb3o5OGVCWENBZmdjS0xucncyalU4RlpESEljc1Q1RU9r?=
 =?utf-8?B?VlNiRGJQUDRNbGF2OUt6OXlRQkZkRmZrbFUxOWs5NldtSktLYllDdDJZNURG?=
 =?utf-8?B?Vyt0SlFEcTAyVFFyWk4ySUU5S2Q2cE5oYmRGNE5nbitqWllySlcwL2JCN3BK?=
 =?utf-8?B?Q1dZQWROMDVTZHg1c1NrKzFMSk5WME92N0h4ZG53WUNxSmRJb1JwaElKb1Ey?=
 =?utf-8?B?b3k1YjFDNE45S24yZlFLbTZ2K3hhN29IL0g3c3g0MlpMczV6M2J5RWFqNWVZ?=
 =?utf-8?B?TFZtSUNiMFkycFpBYm9LYkVIVU02Q3hJMHFjQ0lQR3ZJNktZUkk2ZVRmbDZu?=
 =?utf-8?B?Wm0zYUFwazdGbkV5cDhkNE15N1l0TXlzcGJmQWsyT0ZNQVptdWNNUHZPdDFl?=
 =?utf-8?B?WnBjZnBhWlpNS2M4bVdBRFdmT3grbUw0UGlQeHVPMEdFV0hvZ1VOeUJ5d1FT?=
 =?utf-8?B?Y1M4V0ducVphaXN6YUVFeE5OUXFiSnEyamM0anFQYkNzSHJoMjFaYWtRTWM4?=
 =?utf-8?B?VHJoYUdWRTdGcEpmWmE2WFF4UkdQZ2VzR1hRYndJdGt6UHhJN1ZJM21obSs2?=
 =?utf-8?B?TDdFUGpEYlpBYk4xUklwb1h6d1pUUWRNRFZrV0ZuTXVTZWk2WHNlR0JZM05U?=
 =?utf-8?B?c213SWpRcVROaEpnbE5pQVAzUDRoMXlteDNsYXRZZkNrN3U2K0VvUHFrNm1r?=
 =?utf-8?B?dXlxQlduZFVqTEhLMXZJN3ZYSzYvOXhESkp0cDc5R2NNc1dtMmNhSDgyclU0?=
 =?utf-8?B?V0huelNQazNndFhYTnQzRWNrMDh0UjYwY2IrM1NtRnNYOE9jQ3V3TEhFRngy?=
 =?utf-8?B?S05qcmRiWVhjRFhLRFRsRkRVemR6bk4vT2JrMDB4ei93Uy9taG92ZGJHK3cv?=
 =?utf-8?B?VEZjMlBIOGxwTTdDMXUzcllqMHF5Y2NRTXZoZVRCM2Q0ODdXSzdOS2RRekpx?=
 =?utf-8?B?YlVraU5zQklQNk90SmVBMmxVSUk4ZTdTUXM3VkZUQnpoU2p4SVVpa2Raenlw?=
 =?utf-8?B?eVJlaDc0bzN5ejF3VlM4RklnUmVFTkNNZ1Q3aW0vWVFjOG9RUWUybCswdHor?=
 =?utf-8?B?K0VDeGdXNnpqR1RaK1hRTG9mdU5GZFpOVndBN0pJTUVQOHdBNWlWU0pQdkN4?=
 =?utf-8?B?YmdqRW91NWNveTQwVWRXRFZrVEtGWWlkRmlobWQvVXVVS3M1d1FPeDl6a1ZR?=
 =?utf-8?B?UTVhcUFUeXVRUzJpMFlnV3JTRWVhMURITHdLYWIweE80S3JZc0VDdTFqR3kw?=
 =?utf-8?B?bDdBT1hnOG9mSEJvNm1USWNUWTFKdWl5N0hQQ2lYNWp2N0VGVHQveS9ZYnNE?=
 =?utf-8?B?YmxYTnErc0hpdjltVm04dlo0SUdvUXdMV2g5M2dNSzZsenpxOHFxUjNrZlMx?=
 =?utf-8?B?cStKMHJxY2gwbGdxVUJFZ1g0S0U2Y3gxUlh5TG5WVG9yR3RGKzlXeXB4U2d5?=
 =?utf-8?Q?Dbts=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <31A0E18D2BB3014DA3C2A6E860DD4CF8@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e5a3050-3502-42c6-cdba-08dbf1a4bc62
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2023 13:03:24.0354
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KsrwOdaT1qDZhPG0/iCZQqTuSWC1eTP6k5AGQQuD6JGKl2xwDODABs3KTLhz+f6yBJj98pHgM2qW27yyGc6TUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7849

T24gMjAyMy8xMS8zMCAyMDoyNSwgRGFuaWVsIFAuIFNtaXRoIHdyb3RlOg0KPiBPbiAxMS8zMC8y
MyAwMToyMiwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gSGkgUm9nZXIgYW5kIERhbmllbCBQLiBT
bWl0aCwNCj4+DQo+PiBPbiAyMDIzLzExLzI4IDIyOjA4LCBSb2dlciBQYXUgTW9ubsOpIHdyb3Rl
Og0KPj4+IE9uIEZyaSwgTm92IDI0LCAyMDIzIGF0IDA2OjQxOjM0UE0gKzA4MDAsIEppcWlhbiBD
aGVuIHdyb3RlOg0KPj4+PiBXaGVuIGEgZGV2aWNlIGhhcyBiZWVuIHJlc2V0IG9uIGRvbTAgc2lk
ZSwgdGhlIHZwY2kgb24gWGVuDQo+Pj4+IHNpZGUgd29uJ3QgZ2V0IG5vdGlmaWNhdGlvbiwgc28g
dGhlIGNhY2hlZCBzdGF0ZSBpbiB2cGNpIGlzDQo+Pj4+IGFsbCBvdXQgb2YgZGF0ZSBjb21wYXJl
IHdpdGggdGhlIHJlYWwgZGV2aWNlIHN0YXRlLg0KPj4+PiBUbyBzb2x2ZSB0aGF0IHByb2JsZW0s
IHRoaXMgcGF0Y2ggYWRkIG5ldyBoeXBlcmNhbGwgdG8gY2xlYXINCj4+Pj4gYWxsIHZwY2kgZGV2
aWNlIHN0YXRlLiBBbmQgd2hlbiByZXNldCBkZXZpY2UgaGFwcGVucyBvbiBkb20wDQo+Pj4+IHNp
ZGUsIGRvbTAgY2FuIGNhbGwgdGhpcyBoeXBlcmNhbGwgdG8gbm90aWZ5IHZwY2kuDQo+Pj4+DQo+
Pj4+IFNpZ25lZC1vZmYtYnk6IEppcWlhbiBDaGVuIDxKaXFpYW4uQ2hlbkBhbWQuY29tPg0KPj4+
PiBTaWduZWQtb2ZmLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPg0KPj4+PiAtLS0N
Cj4+Pj4gwqAgeGVuL2FyY2gveDg2L2h2bS9oeXBlcmNhbGwuY8KgIHzCoCAxICsNCj4+Pj4gwqAg
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMgfCAyMSArKysrKysrKysrKysrKysrKysrKysN
Cj4+Pj4gwqAgeGVuL2RyaXZlcnMvcGNpL3BoeXNkZXYuY8KgwqDCoMKgIHwgMTQgKysrKysrKysr
KysrKysNCj4+Pj4gwqAgeGVuL2RyaXZlcnMvdnBjaS92cGNpLmPCoMKgwqDCoMKgwqAgfMKgIDkg
KysrKysrKysrDQo+Pj4+IMKgIHhlbi9pbmNsdWRlL3B1YmxpYy9waHlzZGV2LmjCoCB8wqAgMiAr
Kw0KPj4+PiDCoCB4ZW4vaW5jbHVkZS94ZW4vcGNpLmjCoMKgwqDCoMKgwqDCoMKgIHzCoCAxICsN
Cj4+Pj4gwqAgeGVuL2luY2x1ZGUveGVuL3ZwY2kuaMKgwqDCoMKgwqDCoMKgIHzCoCA2ICsrKysr
Kw0KPj4+PiDCoCA3IGZpbGVzIGNoYW5nZWQsIDU0IGluc2VydGlvbnMoKykNCj4+Pj4NCj4+Pj4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vaHlwZXJjYWxsLmMgYi94ZW4vYXJjaC94ODYv
aHZtL2h5cGVyY2FsbC5jDQo+Pj4+IGluZGV4IGVlYjczZTFhYTUuLjZhZDViNGQ1ZjEgMTAwNjQ0
DQo+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaHlwZXJjYWxsLmMNCj4+Pj4gKysrIGIveGVu
L2FyY2gveDg2L2h2bS9oeXBlcmNhbGwuYw0KPj4+PiBAQCAtODQsNiArODQsNyBAQCBsb25nIGh2
bV9waHlzZGV2X29wKGludCBjbWQsIFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0odm9pZCkgYXJnKQ0K
Pj4+PiDCoMKgwqDCoMKgIGNhc2UgUEhZU0RFVk9QX3BjaV9tbWNmZ19yZXNlcnZlZDoNCj4+Pj4g
wqDCoMKgwqDCoCBjYXNlIFBIWVNERVZPUF9wY2lfZGV2aWNlX2FkZDoNCj4+Pj4gwqDCoMKgwqDC
oCBjYXNlIFBIWVNERVZPUF9wY2lfZGV2aWNlX3JlbW92ZToNCj4+Pj4gK8KgwqDCoCBjYXNlIFBI
WVNERVZPUF9wY2lfZGV2aWNlX3N0YXRlX3Jlc2V0Og0KPj4+PiDCoMKgwqDCoMKgIGNhc2UgUEhZ
U0RFVk9QX2RiZ3Bfb3A6DQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoICFpc19oYXJkd2Fy
ZV9kb21haW4oY3VycmQpICkNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IC1FTk9TWVM7DQo+Pj4+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2ku
YyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQo+Pj4+IGluZGV4IDA0ZDAwYzdjMzcu
LmY4NzE3MTU1ODUgMTAwNjQ0DQo+Pj4+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Bj
aS5jDQo+Pj4+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQo+Pj4+IEBAIC04
MjQsNiArODI0LDI3IEBAIGludCBwY2lfcmVtb3ZlX2RldmljZSh1MTYgc2VnLCB1OCBidXMsIHU4
IGRldmZuKQ0KPj4+PiDCoMKgwqDCoMKgIHJldHVybiByZXQ7DQo+Pj4+IMKgIH0NCj4+Pj4gwqAg
K2ludCBwY2lfcmVzZXRfZGV2aWNlX3N0YXRlKHUxNiBzZWcsIHU4IGJ1cywgdTggZGV2Zm4pDQo+
Pj4NCj4+PiBZb3UgY291bGQgdXNlIHBjaV9zYmRmX3QgaGVyZSBpbnN0ZWFkIG9mIDMgcGFyYW1l
dGVycy4NCj4+IFdpbGwgY2hhbmdlIGluIG5leHQgdmVyc2lvbiwgdGhhbmsgeW91Lg0KPj4NCj4+
Pg0KPj4+IEknbSBob3dldmVyIHVuc3VyZSB3aGV0aGVyIHdlIHJlYWxseSBuZWVkIHRoaXMgaGVs
cGVyIGp1c3QgdG8gZmV0Y2gNCj4+PiB0aGUgcGRldiBhbmQgY2FsbCB2cGNpX3Jlc2V0X2Rldmlj
ZV9zdGF0ZSgpLCBJIHRoaW5rIHlvdSBjb3VsZCBwbGFjZQ0KPj4+IHRoaXMgbG9naWMgZGlyZWN0
bHkgaW4gcGNpX3BoeXNkZXZfb3AoKS7CoCBVbmxlc3MgdGhlcmUgYXJlIHBsYW5zIHRvDQo+Pj4g
dXNlIHN1Y2ggbG9naWMgb3V0c2lkZSBvZiBwY2lfcGh5c2Rldl9vcCgpLg0KPj4gSWYgSSBwbGFj
ZSB0aGUgbG9naWMgb2YgcGNpX3Jlc2V0X2RldmljZV9zdGF0ZSBkaXJlY3RseSBpbiBwY2lfcGh5
c2Rldl9vcC4gSSB0aGluayBJIG5lZWQgdG8gZGVjbGFyZSB2cGNpX3Jlc2V0X2RldmljZV9zdGF0
ZSBpbiBwY2kuaD8gSWYgaXQgaXMgc3VpdGFibGUsIEkgd2lsbCBjaGFuZ2UgaW4gbmV4dCB2ZXJz
aW9uLg0KPj4NCj4+Pg0KPj4+PiArew0KPj4+PiArwqDCoMKgIHN0cnVjdCBwY2lfZGV2ICpwZGV2
Ow0KPj4+PiArwqDCoMKgIGludCByZXQgPSAtRU5PREVWOw0KPj4+DQo+Pj4gU29tZSBYU00gY2hl
Y2sgc2hvdWxkIGJlIGludHJvZHVjZWQgZnJvIHRoaXMgb3BlcmF0aW9uLCBhcyBub25lIG9mIHRo
ZQ0KPj4+IGV4aXN0aW5nIG9uZXMgaXMgc3VpdGFibGUuwqAgU2VlIHhzbV9yZXNvdXJjZV91bnBs
dWdfcGNpKCkgZm9yIGV4YW1wbGUuDQo+Pj4NCj4+PiB4c21fcmVzb3VyY2VfcmVzZXRfc3RhdGVf
cGNpKCkgb3Igc29tZSBzdWNoIEkgd291bGQgYXNzdW1lLg0KPj4gSSBkb24ndCBrbm93IHdoYXQg
SSBzaG91bGQgZG8gaW4gWFNNIGZ1bmN0aW9uKGFzc3VtZSBpdCBpcyB4c21fcmVzb3VyY2VfcmVz
ZXRfc3RhdGVfcGNpKS4NCj4+IEhpIERhbmllbCBQLiBTbWl0aCwgY291bGQgeW91IHBsZWFzZSBn
aXZlIG1lIHNvbWUgc3VnZ2VzdGlvbnM/DQo+PiBKdXN0IHRvIGNoZWNrIHRoZSBYU01fUFJJViBh
Y3Rpb24/DQo+Pg0KPiANCj4gUm9nZXIsIHRoYW5rIHlvdSBmb3Igc2VlaW5nIHRoaXMgYW5kIGFk
ZGluZyBtZSBpbiENCj4gDQo+IEppcWlhbiwgSSBqdXN0IHdhbnRlZCB0byBsZXQgeW91IGtub3cg
SSBoYXZlIHNlZW4geW91ciBwb3N0IGJ1dCBJIGhhdmUgYmVlbiBhIGxpdHRsZSB0aWVkIHVwIHRo
aXMgd2Vlay4gSnVzdCB3aXRoIHRoZSBjdXJzb3J5IGxvb2ssIEkgdGhpbmsgUm9nZXIgaXMgc3Vn
Z2VzdGluZyBhIG5ldyBYU00gY2hlY2svaG9vayBpcyB3YXJyYW50ZWQuDQo+IA0KPiBJZiB5b3Ug
d291bGQgbGlrZSB0byBhdHRlbXB0IGF0IHdyaXRpbmcgdGhlIGR1bW15IHBvbGljeSBzaWRlLCBt
aW1pYyB4c21fcmVzb3VyY2VfcGx1Z19wY2kgaW4geGVuL2luY2x1ZGUveHNtL2R1bW15LmggYW5k
IHhlbi9pbmNsdWRlL3hzbS94c20uaCwgdGhlbiBJIGNhbiBsb29rIGF0IGhhbmRsaW5nIHRoZSBG
TEFTSyBwb3J0aW9uIG5leHQgd2VlayBhbmQgcHJvdmlkZSBpdCB0byB5b3UgZm9yIGluY2x1c2lv
biBpbnRvIHRoZSBzZXJpZXMuIElmIHlvdSBhcmUgbm90IGNvbWZvcnRhYmxlIHdpdGggaXQsIEkg
Y2FuIGxvb2sgYXQgdGhlIHdob2xlIHRoaW5nIG5leHQgd2Vlay4gSnVzdCBsZXQgbWUga25vdyB3
aGF0IHlvdSB3b3VsZCBiZSBjb21mb3J0YWJsZSB3aXRoLg0KSSB3aWxsIHJlZmVyIHRvIHhzbV9y
ZXNvdXJjZV91bnBsdWdfcGNpIGFuZCB0cnkgdG8gYWRkIGR1bW15IHBvbGljeSBpbiBuZXh0IHZl
cnNpb24uIEkgYW0gbG9va2luZyBmb3J3YXJkIHlvdXIgcmV2aWV3IGFuZCBndWlkZS4gVGhhbmsg
eW91IHZlcnkgbXVjaCENCg0KPiANCj4gdi9yLA0KPiBkcHMNCg0KLS0gDQpCZXN0IHJlZ2FyZHMs
DQpKaXFpYW4gQ2hlbi4NCg==

