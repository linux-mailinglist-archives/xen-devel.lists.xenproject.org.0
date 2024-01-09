Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D955B8283CD
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 11:17:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664361.1034517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rN99v-000316-71; Tue, 09 Jan 2024 10:16:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664361.1034517; Tue, 09 Jan 2024 10:16:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rN99v-0002y3-4B; Tue, 09 Jan 2024 10:16:35 +0000
Received: by outflank-mailman (input) for mailman id 664361;
 Tue, 09 Jan 2024 10:16:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2W5I=IT=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rN99t-0002xT-5G
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 10:16:33 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20603.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 283c6ebb-aed8-11ee-9b0f-b553b5be7939;
 Tue, 09 Jan 2024 11:16:30 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by MW3PR12MB4570.namprd12.prod.outlook.com (2603:10b6:303:5f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 10:16:26 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1%3]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 10:16:26 +0000
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
X-Inumbo-ID: 283c6ebb-aed8-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZRgYNbU9PUdhq7t8I0046QDboj+6uDbgva3wLX+zJV1MDypMmduQsZOKJWqnmXfvfnu+XU10jF/qOG5Mea/UwMDTKsu2yhs2Mq+5+Y6rcvZpJUVHigFyCR9GRqf+xgTqN1MQUIVZh/FHmQxhtBDhVQAdeM8A0QlYQ2LFxzUxf5v1nRGmPgI1zugbfOzuaVywr7Ar/UM4Ns+xZBZmPBqzii12XnxfDiq+JmXAMgdlIS1jWRsGePHbgJT1UwGF4Se1POl2pnu+BBcbKqbWv752FvEdgDmbtxqYv+Lejn4BTDuH3/krFiMH7kmRmxQjeEXsmbo7hylEa1PP+5rA1M2i6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qg9Biv3qOmWoJx52dkUYm3ZlFgwHuSKOHAT84cMVDHY=;
 b=E8LX6Rd11+MBvhJk7ij71QXFQgoG7uyYPtxs4gRUTfelPfy6OkYM1vqKP4vsa3Ml05QLjj5jA3RhurtkEk3j3LpoSukRg6we1lLLM+SMDDdFEbigSJ+8zfZ9BzQIkUm2Gv5cBmkkrqYsCsXzvjLmS9vmtiminu01UxdVx6bucZqsIYBjRbFy8X1AhTV/HC3t0yDiBc9n4C6IoyGDgoPI4LtRCawYq2fZYa75w2pAPS00BJv7Q2bu/8mzs2EeQbkHQIxhJ6MaVV4MTuczMV/64xhiNb2hR7DaQHefWOQ6RzViXOD06pjtliYRO2gpyHtt/AQLoIWjk0XZSH7x+W57TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qg9Biv3qOmWoJx52dkUYm3ZlFgwHuSKOHAT84cMVDHY=;
 b=1kkD+ZICM3GI/z2KaAzHXOH1bMDc2iM2EzYmNV2YAvAK8WnR2hXWh/ByXjDQ66mhPIZBWadaeI1eqiK+qzDUWOyYM0YgvTMpwUSxbI0x+Rc9uTFeMd7x04P+qnLIStCXQQ+uhff8j2SveLkd0Fs88ngEm5htcRePQWGB1BgSh+s=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Hildebrand,
 Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v4 4/5] domctl: Use gsi to grant/revoke irq
 permission
Thread-Topic: [RFC XEN PATCH v4 4/5] domctl: Use gsi to grant/revoke irq
 permission
Thread-Index:
 AQHaP6Y1pt0ckfKChE+VsjXCWSj8+LDL+oWAgAOnBgCAAGd3gIABof4A//+U/YCAAIregA==
Date: Tue, 9 Jan 2024 10:16:26 +0000
Message-ID:
 <BL1PR12MB58490E62825A5B1ACCE605EAE76A2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240105070920.350113-1-Jiqian.Chen@amd.com>
 <20240105070920.350113-5-Jiqian.Chen@amd.com>
 <alpine.DEB.2.22.394.2401051702200.3675@ubuntu-linux-20-04-desktop>
 <882bd39a-8a29-4f4f-b64f-765c4858b1c8@suse.com> <ZZwPSZoqyY6g9yhi@macbook>
 <BL1PR12MB58492746170F6BF777901141E76A2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <b4ed7764-a44c-4ac8-bb56-379fdeba16e8@suse.com>
In-Reply-To: <b4ed7764-a44c-4ac8-bb56-379fdeba16e8@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: MN0PR12MB6151.namprd12.prod.outlook.com
 (15.20.7181.004)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|MW3PR12MB4570:EE_
x-ms-office365-filtering-correlation-id: ce9a1c0f-b585-4426-13c0-08dc10fc0a25
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 tbfM0/5IVwm8zQNgwMuF9iDiPY7tbfqUnqJDpYyPXQ3qPxqq5cUN9/UDaGC52LDToSyI9I82txpcGuOG9NtFePDSPLvllvmpDtBvhRq5sdC3uz9DvPC5/NtAhBwBCCmW2DlD4QouFE40sAh9VkvX3B/Diw5LuYALRdZbNXHKxrtAUIef2YCdU03VmYRARpfL5qySpaB3KCWMA1dMeyYPQKsUWRHaZkD4b0ytfPhU4zXppUJxtyB4eNAUvaE19ExlWxlTMZPSGEFAhZzRzPbIWQNrgktiboXAlbms0hz+G5kiFSkBCrusIeXW4Yrlq6tmtCsM3GjsxPjW/SHV/gx3dRNnWTsipqZf00K/jpnBWUYqb4yZog+IsLhcxBESFceCsBK7GcjcnS8tL/7PL78HuUcqKwHnOImJnlnSV4dASmp4IgZ09umJRWN7sQcy6lM8xGgtm68SsMI4dCoaw1dl0BU2ZrtMYr4uWQK/0kXZhCpK8sXYKBZTYuw9lb/YP9eTOaQZWaPXpTaC+Xkt6p/ifaZU6VBEKsqPmPddH8UyD2FjYMQMjCTJRJE/OkM+pUeRV3ZCKv4UUqgDJX3qDQcZULWNH6Jh8wsdgGouQ2Dn57VHoVaNk8ODoGdAC8sfB0mY
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(136003)(396003)(376002)(346002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(5660300002)(8936002)(7416002)(52536014)(8676002)(4326008)(76116006)(66446008)(66946007)(6916009)(64756008)(66556008)(54906003)(66476007)(316002)(2906002)(38070700009)(38100700002)(9686003)(122000001)(26005)(478600001)(33656002)(71200400001)(83380400001)(41300700001)(55016003)(7696005)(6506007)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bnd1UUplY0lvYlVqRUxzTnU1Y0d5emc4WjdYK0R1VFBQcVBpRE9WeTN0QnFz?=
 =?utf-8?B?S1JZb0RDbU53dEJkb0VUVFd0NXFOZkZQc3p0RFBCUFh1YzA0RWtRMFpMUmtz?=
 =?utf-8?B?SjNpcEhhY045VGdnOERodTBydjJlaFRqVFR3S2I5Tit5UzlzMmI1Zkc3bFBD?=
 =?utf-8?B?V1Q4cnlXQWQ3Lzh3ekNvdFBwdCtYTFJMY2Fza25TVmhtYUR6RkxPb29yeWJI?=
 =?utf-8?B?RjFvSC9sZlpKKzRUZ3AvM0E2UzhsK2tEcUVyTGFTaUl0S0hhSnhZbDRVTXVn?=
 =?utf-8?B?Um9taERraTVyUXQzak1SenRyekxqUHdJUW94ZDQrd2UxNk1aY2JGU3pJek9N?=
 =?utf-8?B?VDM3SmdoR3pWWTdvY0ZmWURMR21RS2xyYnFvV2ZaMXc2TS96V2VUcXJBaFZs?=
 =?utf-8?B?YUR1WXV4clpBSzVoSzBDQ3ZCV0J6cEtZSzNPQ05qeDliRE9GTElBcUtJRXdr?=
 =?utf-8?B?Rk9Mc2VkWnNrMlJEb0NMU0JTVWlSQW0vd204L2t2OUF4M045MkdoVFNSSXpL?=
 =?utf-8?B?cktMVzMrZ3VjVTRuaDY1WGdmUy90RHo0T2paR2hHSE9WbzNvQy8zN29jd2M1?=
 =?utf-8?B?WjEvT2ZkRTd0VUw0bkExZTJsTC9FQ01pcmRiQmRNOHRoTERoR3FIUldrcVd4?=
 =?utf-8?B?dC9PdEkwQ3E3MWxVUWErZW5zUUpwZW0wSUJ0YzJhYWhjb0s4U0RBbUw5Y0Q3?=
 =?utf-8?B?M1Z3a3JvTUJtWFMvTFJ1SEJCUW1ncXRoUk04a2NZQmZBYmRkY3RKMldudWhr?=
 =?utf-8?B?U1pmNjNsRWZqNUN4WVZuWjYrU0R2Y1hCT3lydlhkMUVuTmVrZ1JnODNrZXBr?=
 =?utf-8?B?d1FxdStCZVVMQ1J6ZzlhWkN3Sm9ZUHV0b3RVeDYrZ1puL0ZlZkRlVWJPbWtD?=
 =?utf-8?B?MlJvS2xqK2FvT0dVL3A0cDVjUmUxM2lydElYL1U2cjVIcmhsMDIvWkhYWjFF?=
 =?utf-8?B?MmZqZ0VtdVJtbVZJUmtEemlvRnhnSTd5cVdaeE1kU0d5Q0JaVGNSam9YRFJN?=
 =?utf-8?B?RnUyeHIvWU14b3FqejZTdjdMdkJ2dGNwT05JTzVMQ0h2NWx1eG1BRGtqdUwx?=
 =?utf-8?B?MlNydHZKN0l2WENtSEo5a3RkOVBMR1V5QU1MZ2YvZnRWTC9wTUk5aTFaR1Np?=
 =?utf-8?B?QW56NFB3RlJjU1QvQ3M0MTNYa2o3NFoxTXU3QXFjeTJlS2hsZTQ3TW5PdS82?=
 =?utf-8?B?SStuVEFsMHNNLzVHWWFtVVc1ai94QUdvM25ZZHBMRGVDUlMwaW9ZRCtZemhK?=
 =?utf-8?B?UjZSK0ljc0h1emU5cU9XNUd3K1h5WExlcFZaMUlJbWtSUFNSTVEyVFlycnFv?=
 =?utf-8?B?am95NkgyUUVEclNYVHZRZFNzalhiVXJWUmIyL3R3TlY5NEdqYnU1RDJpUTFF?=
 =?utf-8?B?SFRwMGpab3lFb2ZOd3NwWHJFNmFPT3VBL0lWTGdZdXB6R1BuWlIvVkNMS1pl?=
 =?utf-8?B?T3Q2cWtmdXo1TmJObXRvMWxYTExuRXpMQXBSeEwvUTdlbDE5clh6RjBualR2?=
 =?utf-8?B?ejlrTnpwaks2RWNyTFI5NjV1QjNWM0ppTXR2czMybmNpWkhoN01HeHhxdWFG?=
 =?utf-8?B?SmpYTWVpRDFHV1JUckZCV1h5cFFkVDR3elNUTmhzelNSS0dyOFg0UWx0LzAv?=
 =?utf-8?B?NTJsWVdCRUxib2JleitsNjhHVlF1SWhLRksxQlI2elQzSmtHbzh4Z2VOcE5m?=
 =?utf-8?B?MDgyZFlhWElMV3EwamtrK1RQSXF0eXgrcXhLd1hhclhrbmZ6VFh1RmRHVnZG?=
 =?utf-8?B?VHN2UElrb3ZqelhqUDZYekN2cktHOFZtZi9nZGdJOFJrTTFXbTgrT1RtK3J5?=
 =?utf-8?B?bHpWVXZjNHpkbDd1c1B3WllWcDdBZXhIc0hEYnZvUnBCaWVVd3B4c0RnTzV6?=
 =?utf-8?B?ZWdaemFXWWkvbzFFdlBEM0ZmYjF2ZXY3UzJQL3IvZ3pJS3NhblczOUpEeU0w?=
 =?utf-8?B?MU1STGR0NTBpanQvbWNvK0hGMzJrS0swcmgxVDEzMjl0OUZWSzJ5TTQrbEow?=
 =?utf-8?B?blJ1Q1BvSlh6dXhtazJuVFdWaGRMbldtdStMOWVvYTFRVDZpWU4rUW9LMnBu?=
 =?utf-8?B?ZXZUUGNTOXEwY1FKWnhxY2h1bW5wcGNZZVp6OU04T0JIRllaYUQxTEdBTldH?=
 =?utf-8?Q?Z6Pc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <71A1A426F109514F8E643BB180919EA3@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce9a1c0f-b585-4426-13c0-08dc10fc0a25
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2024 10:16:26.7701
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9q94+ahIOicd+H7XtVvcjN7j/ATCtzjhRzal17xE5uphYIFOfarkal9X/JfB5cDiarcWjETPCuXvMDvutPthwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4570

T24gMjAyNC8xLzkgMTc6MzgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwOS4wMS4yMDI0IDA5
OjE4LCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+PiBPbiAyMDI0LzEvOCAyMzowNSwgUm9nZXIgUGF1
IE1vbm7DqSB3cm90ZToNCj4+PiBPbiBNb24sIEphbiAwOCwgMjAyNCBhdCAwOTo1NToyNkFNICsw
MTAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4gT24gMDYuMDEuMjAyNCAwMjowOCwgU3RlZmFu
byBTdGFiZWxsaW5pIHdyb3RlOg0KPj4+Pj4gT24gRnJpLCA1IEphbiAyMDI0LCBKaXFpYW4gQ2hl
biB3cm90ZToNCj4+Pj4+PiAtLS0gYS90b29scy9saWJzL2xpZ2h0L2xpYnhsX3BjaS5jDQo+Pj4+
Pj4gKysrIGIvdG9vbHMvbGlicy9saWdodC9saWJ4bF9wY2kuYw0KPj4+Pj4+IEBAIC0xNDE4LDYg
KzE0MTgsNyBAQCBzdGF0aWMgdm9pZCBwY2lfYWRkX2RtX2RvbmUobGlieGxfX2VnYyAqZWdjLA0K
Pj4+Pj4+ICAgICAgdW5zaWduZWQgbG9uZyBsb25nIHN0YXJ0LCBlbmQsIGZsYWdzLCBzaXplOw0K
Pj4+Pj4+ICAgICAgaW50IGlycSwgaTsNCj4+Pj4+PiAgICAgIGludCByOw0KPj4+Pj4+ICsgICAg
aW50IGdzaTsNCj4+Pj4+PiAgICAgIHVpbnQzMl90IGZsYWcgPSBYRU5fRE9NQ1RMX0RFVl9SRE1f
UkVMQVhFRDsNCj4+Pj4+PiAgICAgIHVpbnQzMl90IGRvbWFpbmlkID0gZG9taWQ7DQo+Pj4+Pj4g
ICAgICBib29sIGlzc3R1YmRvbSA9IGxpYnhsX2lzX3N0dWJkb20oY3R4LCBkb21pZCwgJmRvbWFp
bmlkKTsNCj4+Pj4+PiBAQCAtMTQ4Niw2ICsxNDg3LDcgQEAgc3RhdGljIHZvaWQgcGNpX2FkZF9k
bV9kb25lKGxpYnhsX19lZ2MgKmVnYywNCj4+Pj4+PiAgICAgICAgICBnb3RvIG91dF9ub19pcnE7
DQo+Pj4+Pj4gICAgICB9DQo+Pj4+Pj4gICAgICBpZiAoKGZzY2FuZihmLCAiJXUiLCAmaXJxKSA9
PSAxKSAmJiBpcnEpIHsNCj4+Pj4+PiArICAgICAgICBnc2kgPSBpcnE7DQo+Pj4+Pg0KPj4+Pj4g
QSBxdWVzdGlvbiBmb3IgUm9nZXIgYW5kIEphbjogYXJlIHdlIGFsd2F5cyBndWFyYW50ZWVkIHRo
YXQgZ3NpID09IGlycQ0KPj4+Pj4gKGFsc28gaW4gdGhlIFBWIGNhc2UpPw0KPj4+Pg0KPj4+PiBJ
aXJjIGZvciBJTy1BUElDIGJhc2VkIElSUXMgdGhhdCdzIGFsd2F5cyB0aGUgY2FzZTsNCj4+Pg0K
Pj4+IEkgdGhpbmsgdGhhdCdzIGFsd2F5cyB0aGUgY2FzZSBvbiBMaW51eCwgYmVjYXVzZSBpdCBj
YWxscw0KPj4+IFBIWVNERVZPUF9tYXBfcGlycSB3aXRoIGluZGV4ID09IHBpcnEgKHNlZSBMaW51
eA0KPj4+IHBjaV94ZW5faW5pdGlhbF9kb21haW4oKSkuICBCdXQgb3RoZXIgT1NlcyBjb3VsZCBw
b3NzaWJseSBtYWtlIHRoZQ0KPj4+IGNhbGwgd2l0aCBwaXJxID09IC0xIGFuZCBnZXQgYSByYW5k
b21seSBhbGxvY2F0ZWQgcGlycSBmb3IgR1NJcy4NCj4+IEkgZG9uJ3QgdGhpbmsgaXQncyBpbXBv
cnRhbnQgd2hldGhlciBwaXJxIGlzIHJhbmRvbWx5IGdlbmVyYXRlZC4gV2hhdCdzIGltcG9ydGFu
dCBpcyB3aGV0aGVyIGlycSBhbHdheXMgZXF1YWxzIGdzaSBpbiB4ZW4uDQo+PiBJZiBzbywgd2Ug
Y2FuIGRpcmVjdGx5IHBhc3MgaW4gYW5kIGdyYW50IGdzaS4gSG93ZXZlciwgYWNjb3JkaW5nIHRv
IEphbidzIHByZXZpb3VzIGVtYWlsIHJlcGx5LCBpbiB0aGUgY2FzZSBvZiBNc2ksIGlycSBtYXkg
bm90IGJlIGVxdWFsIHRvIGdzaSwgc28gbXkgcGF0Y2ggY2Fubm90IG1lZXQgdGhpcyBzaXR1YXRp
b24uDQo+PiBJIGFtIGNvbmZ1c2luZyBpZiB0aGUgY3VycmVudCBkb21haW4gZG9lc24ndCBoYXZl
IFBJUlEgZmxhZywgdGhlbiByZWdhcmRpbmcgdG8gWEVOX0RPTUNUTF9pcnFfcGVybWlzc2lvbiwg
d2hpY2gga2luZCBvZiBpcnEgd2Ugc2hvdWxkIGdyYW50IHRvIGNhbGxlciBkb21haW4/IFRoZSBn
c2kgb3Igb3RoZXIgaXJxPw0KPj4gT3IgY2FuIHdlIGFkZCBhIGNoZWNrIGluIFhFTl9ET01DVExf
aXJxX3Blcm1pc3Npb24sIGlmIHRoZSBjdXJyZW50IGRvbWFpbiBoYXMgUFJJUSwgd2UgY2FuIGdl
dCBpcnEgZnJvbSBwaXJxKGxpa2UgdGhlIG9yaWdpbmFsIGltcGxlbWVudGF0aW9uKSwgaWYgbm90
IHdlIGNhbiBhc3NpZ24gZ3NpIHRvIGlycSwgYW5kIHRoZW4gZ3JhbnQgaXJxLiBPZiBjb3Vyc2Us
IHRoYXQgbmVlZHMgdG8gcmVxdWlyZSB0aGUgY2FsbGVyIHRvIHBhc3MgaW4gYm90aCB0aGUgcGly
cSBhbmQgZ3NpLg0KPiANCj4gSSBleHBlY3QgTVNJIHdpbGwgbmVlZCBoYW5kbGluZyBkaWZmZXJl
bnRseSBmcm9tIEdTSXMuIFdoZW4gTVNJIGlzDQo+IHNldCB1cCBmb3IgYSBkZXZpY2UgKGFuZCBo
ZW5jZSBmb3IgYSBkb21haW4gaW4gcG9zc2Vzc2lvbiBvZiB0aGF0DQo+IGRldmljZSksIGFjY2Vz
cyBvdWdodCB0byBiZSBncmFudGVkIHJpZ2h0IGF3YXkuDQo+IA0KPj4+IElPVzogSSBkb24ndCB0
aGluayB0aGUgcGlycSBmaWVsZCBpbiB4ZW5fZG9tY3RsX2lycV9wZXJtaXNzaW9uIGNhbiBiZQ0K
Pj4+IGFsdGVyZWQgbGlrZSBwcm9wb3NlZCBoZXJlIHRvIHN3aXRjaCBmcm9tIHBhc3NpbmcgYSBw
aXJxIHRvIGEgR1NJLiAgQQ0KPj4+IG5ldyBoeXBlcmNhbGwgc2hvdWxkIGJlIGludHJvZHVjZWQg
dGhhdCBlaXRoZXIgaXMgR1NJIHNwZWNpZmljLCBvcg0KPj4+IGNvbnRhaW5zIGEgdHlwZSBmaWVs
ZCBpbiBvcmRlciB0byBzcGVjaWZ5IHRoZSBuYW1lc3BhY2UgdGhlIGZpZWxkDQo+Pj4gdGFyZ2V0
cy4NCj4+IEEgbmV3IGh5cGVyY2FsbCB1c2luZyBmb3IgZ3JhbnRpbmcgZ3NpPyBJZiBzbywgaG93
IGRvZXMgdGhlIGNhbGxlciBrbm93IHRvIGNhbGwgd2hpY2ggaHlwZXJjYWxsIHRvIGdyYW50IHBl
cm1pc3Npb24sIFhFTl9ET01DVExfaXJxX3Blcm1pc3Npb24gb3IgdGhhdCBuZXcgaHlwZXJjYWxs
Pw0KPiANCj4gRWl0aGVyIHdlIGFkZCBhIGZlYXR1cmUgaW5kaWNhdG9yLCBvciB0aGUgY2FsbGVy
IHNpbXBseSB0cmllcyB0aGUNCj4gbmV3IEdTSSBpbnRlcmZhY2UgZmlyc3QuDQpJIGFtIHN0aWxs
IG5vdCBzdXJlIGhvdyB0byB1c2UgYW5kIGltcGxlbWVudCBpdC4NClRha2luZyBwY2lfYWRkX2Rt
X2RvbmUgYXMgYW4gZXhhbXBsZSwgZm9yIG5vdyBpdHMgaW1wbGVtZW50YXRpb24gaXM6DQpwY2lf
YWRkX2RtX2RvbmUNCgl4Y19waHlzZGV2X21hcF9waXJxDQoJeGNfZG9tYWluX2lycV9wZXJtaXNz
aW9uKCwscGlycSwpDQoJCVhFTl9ET01DVExfaXJxX3Blcm1pc3Npb24NCg0KQW5kIGFzc3VtZSB0
aGUgbmV3IGh5cGVyY2FsbCBpcyBYRU5fRE9NQ1RMX2dzaV9wZXJtaXNzaW9uLCBkbyB5b3UgbWVh
bjoNCnBjaV9hZGRfZG1fZG9uZQ0KCXhjX3BoeXNkZXZfbWFwX3BpcnENCglyZXQgPSB4Y19kb21h
aW5fZ3NpX3Blcm1pc3Npb24oLCxnc2ksKQ0KCQlYRU5fRE9NQ1RMX2dzaV9wZXJtaXNzaW9uDQoJ
aWYgKCByZXQgIT0gMCApDQoJCXhjX2RvbWFpbl9pcnFfcGVybWlzc2lvbigsLHBpcnEsKQ0KCQkJ
WEVOX0RPTUNUTF9pcnFfcGVybWlzc2lvbg0KQnV0IGlmIHNvLCBJIGhhdmUgYSBxdWVzdGlvbiB0
aGF0IGluIFhFTl9ET01DVExfZ3NpX3Blcm1pc3Npb24sIHdoZW4gdG8gZmFpbCBhbmQgd2hlbiB0
byBzdWNjZXNzPw0KDQpPciBkbyB5b3UgbWVhbjoNCnBjaV9hZGRfZG1fZG9uZQ0KCXhjX3BoeXNk
ZXZfbWFwX3BpcnENCglyZXQgPSB4Y19kb21haW5faXJxX3Blcm1pc3Npb24oLCxwaXJxLCkNCgkJ
WEVOX0RPTUNUTF9pcnFfcGVybWlzc2lvbg0KCWlmICggcmV0ICE9IDAgKQ0KCQl4Y19kb21haW5f
Z3NpX3Blcm1pc3Npb24oLCxnc2ksKQ0KCQkJWEVOX0RPTUNUTF9nc2lfcGVybWlzc2lvbg0KQW5k
IGluIFhFTl9ET01DVExfZ3NpX3Blcm1pc3Npb24sIGFzIGxvbmcgYXMgdGhlIGN1cnJlbnQgZG9t
YWluIGhhcyB0aGUgYWNjZXNzIG9mIGdzaSwgdGhlbiBncmFudGluZyBnc2kgdG8gY2FsbGVyIHNo
b3VsZCBiZSBzdWNjZXNzZnVsLiBSaWdodD8NCg0KPiANCj4+IEkgbWVhbiBob3cgdGhlIGNhbGxl
ciBrbm93IGlmIHRoZSBjdXJyZW50IGRvbWFpbiBoYXMgUElSUSBvciBub3QgYW5kIHdoZW4gdG8g
cGFzcyBpbiBwaXJxIG51bWJlciwgd2hlbiB0byBwYXNzIGluIGdzaSBudW1iZXIuDQo+IA0KPiBB
biBpbnRlcmZhY2UgdGhhdCdzIEdTSS1jZW50cmljIHdvdWxkIG9ubHkgZXZlciBiZSBwYXNzZWQg
YSBHU0kNCj4gKG9mIGNvdXJzZSwgSSdtIGluY2xpbmVkIHRvIGFkZCkuDQo+IA0KPiBKYW4NCg0K
LS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

