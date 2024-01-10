Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E688293AE
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jan 2024 07:25:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665303.1035464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNS0x-0006DL-JQ; Wed, 10 Jan 2024 06:24:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665303.1035464; Wed, 10 Jan 2024 06:24:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNS0x-0006Ah-Fo; Wed, 10 Jan 2024 06:24:35 +0000
Received: by outflank-mailman (input) for mailman id 665303;
 Wed, 10 Jan 2024 06:24:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6bPZ=IU=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rNS0v-0006Ab-Sz
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2024 06:24:33 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20609.outbound.protection.outlook.com
 [2a01:111:f400:7eb2::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9910dc7-af80-11ee-9b0f-b553b5be7939;
 Wed, 10 Jan 2024 07:24:31 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CH2PR12MB4312.namprd12.prod.outlook.com (2603:10b6:610:af::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Wed, 10 Jan
 2024 06:24:27 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::bafd:1985:94e6:ef33]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::bafd:1985:94e6:ef33%6]) with mapi id 15.20.7181.015; Wed, 10 Jan 2024
 06:24:27 +0000
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
X-Inumbo-ID: e9910dc7-af80-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G4AvRaQWSGpCs8h9Joh+2NXeh05vopMFWCQAQZU8TOBvGWty+43wQW/8bB9OjZVJWFb7vjR/O6nyu+IG80NLem/gyVLRg5e+L5Ryky+FQQK6J0Xthd3AzkNAA2/9CGj9LnbhpX8Gq35jD4jTGg1946GWWtudbyAGAYK9IWRbJTEa+Hl6kPEE494ZvOBPlo5bvnHRpeEUkIKDcSg7IHW43dkobOp+EUYTX/5EmxR/KGznJmbjNQBxsgB1caBThPkQqbYBUZihhPbk2lkqpLrUAzcY3UVje7Yss04IyDaop16k4+GkxV19YwsQyQZ5xsaKOFHvrY2gLcwSsCuMet9rgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ic+dQrxDEN2PXgKgtZbj6lGK54OQ8ahMVCJLoStW6Y=;
 b=W8Od4HX3GACysWrBwKu2kY+P6OcKAWClf4zs9pojvkhDSwyxfLN39uAhGJh2nJu9VN7vOkshTtpDZ11byNkpH3kASO6Tu7QDTg7nx6GIGOEva+3m0Ar5A0PNI5CaQuNl+8yWMWg12ZV0GGGFjavQDQJmCd1XubWrTpNkiE8aY6H3YTKNauXfN64JfEgZ+4/lVjnxX6B1YPyTig6K4iQ7vlBDAdfQ9zVd5+BbpjUaJyuUJljUNkaptBmV4JPKkAP8DQo3HI0Tzfi8oPiPG1dJ6FR9wPf14uLuFzDf9pMDropvZTccSXl9o+QxfRZZW91LsOuDfXk0O/4ALiVreApszg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ic+dQrxDEN2PXgKgtZbj6lGK54OQ8ahMVCJLoStW6Y=;
 b=GM8Gys0XA698wv5U/14YBmBGv0T3edf4aBDitvSHc/lof32m9M1skSTpPAXy3+ZACDFgBYB3NCBknz/+QFAAJF7v5PuyEL0mXG0b8JOwr47E9cj6HRUFIhzWPW7zYO3IJ6lzMNEwB0ii1UhNmYjYrCXTrdSZrYC6i2leN9bgSVs=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v4 1/5] xen/vpci: Clear all vpci status of device
Thread-Topic: [RFC XEN PATCH v4 1/5] xen/vpci: Clear all vpci status of device
Thread-Index: AQHaP6YrwTeuO8u85U6eXqUvf5Gm3LDRoHaAgAF/ZoA=
Date: Wed, 10 Jan 2024 06:24:26 +0000
Message-ID:
 <BL1PR12MB58494843C4BCE9A522A0E674E7692@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240105070920.350113-1-Jiqian.Chen@amd.com>
 <20240105070920.350113-2-Jiqian.Chen@amd.com>
 <70add06b-59c6-469a-8570-f7a6f5bc15fb@amd.com>
In-Reply-To: <70add06b-59c6-469a-8570-f7a6f5bc15fb@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5755.namprd12.prod.outlook.com
 (15.20.7181.004)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CH2PR12MB4312:EE_
x-ms-office365-filtering-correlation-id: 2be7568e-d820-455e-00c4-08dc11a4cbb6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 jF9xd07uLWr2kyyDfwjhXCCps1CBzicNtVP9cxCk6xOGVB5viNKz+d9Vy/rAjXMvgaCMT/ZCNrS/tn5dfCGUAL0ns0Kum44/yw6boab9oBEwQ0APNuxek9gvsFmSRyKskyktUQZiSqhKyIkxhySwUL+3yYzii7HOaNxwsWwXi8G35kxf3VlAcElqqzN3XEMZJW5GleeL/vCrCs2W3fV6DbOqNXSPpFBLgCmig7JgwwL+H0VwGr3hZYm0+OC16YpkCx79pkGIeeu4EkZv8TmI7xF1ajfECbOnapxyIu4wNYHRlHqGfRAX4gpnk66JVApMZcoi9ikTlZUlfcXVRKPDPptWQ0TiLCe8qV0MAdb/saBZPhpgA9RQZifohyp6WAFKRMttF7zQQbrgaXLEKrN0mgf76Tq5FLh+AacQc0rV6ekuh4mH1Q70LzgXnd4sZZj7FYp6S2Bpteosq2mem2tKM63W3pI9MZDAtgA3P3/lpSchl2pI40nUV3pMjbmXon21tLmrdo+UG0J8ztvsnZePKMfZQgagkto/u9JkXg59VoLtjJAob4VgZO6sgR8WRWCd9ik6AHkhHOLPxwEOVFgXHXu2Z8w92MfBjJn2zDN21zCSuPBuK18gF6pXvWPg/isB
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(39860400002)(396003)(346002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(26005)(83380400001)(9686003)(6506007)(53546011)(7696005)(122000001)(5660300002)(71200400001)(6862004)(7416002)(52536014)(4326008)(2906002)(41300700001)(478600001)(66476007)(66446008)(316002)(54906003)(8676002)(8936002)(64756008)(6636002)(76116006)(66556008)(66946007)(33656002)(38100700002)(38070700009)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L3IrbmpkVnIrT0dNVU85T1FPZzNudW01Titta0k3YWtrNTFKTGVQVUxwVVA2?=
 =?utf-8?B?c3RaSTJxUDhUVFZqS0lqaWJtSkxOcG5uM1A5YjdMWnNKYWZYUFE2Z3ByMUJE?=
 =?utf-8?B?MnBabTFGRTNrTUlsMGVVSjBaalErZFdub0ZDV1g4ekxUb0QwSURmMUUzakwy?=
 =?utf-8?B?OVN6Z2EvT2JuREFXaUdUY010dmhndi9Na3l2dHpXMGhibXYwSEpxa2ludEVB?=
 =?utf-8?B?NU16bzQ4NFRlaUE4SkJPZkZNMHdoVUtvaFBHaHdORXRYZTU0V25vOEdqalJw?=
 =?utf-8?B?bThzVXJkTThjUThGQ2dvMUFOYXZia0JvbnptM0RQQytMajNtZ2JyNzRuQlBx?=
 =?utf-8?B?Uy8reVd1eExiem1TamNRNVlBbzVyTTdENEhnM2Y3Y0U4QTNHTWkzSEhoWXd5?=
 =?utf-8?B?cnhUaWVVUzJ3U3FEZ0l4M1JyWFhLMjc0UVBFdEw0L1FKUWU3clZubmQyVnhH?=
 =?utf-8?B?WFhFeHl5djhRWXNGYmRxZ3BLZGRmWE1za2hxUlpOSzJGazhNNVpXTG9PVUlD?=
 =?utf-8?B?ZjBMR1NpTzhiekxmTkhONmgyY0xENWU4Rms5YjZYUTFhMWNXeUpQMEJvVWNs?=
 =?utf-8?B?aGNzbTJDK2hTNk5ZNkx5L1Z2ZnhqVDNlZHFKMlBQNXB5RUx4dEJYZnNQYTV0?=
 =?utf-8?B?eFNnamkxQnhPUGlndXhoSDRFZzVrcTBxY01CMU5xUDdweFlEMlhKVUpNWHpL?=
 =?utf-8?B?N3RtVkliSWtuV3VnVEpTalZPVWJvajlVa1BaSTBqblJvUTFCRFdZamtUeUJ4?=
 =?utf-8?B?d29hOFVrTUF0cEI2MktHQytWb084ZnhGbU5JUW84NjY3ZC9LRHJ3YnFDQ21v?=
 =?utf-8?B?VEJJeEMvRVB3c3REcEZFTU52VEUrMklYYW9uQXFFRUNTblNsMG9oRjk1UW5V?=
 =?utf-8?B?Z25ha294bEZXam9nQWE1ZkFhUTRqUzR4d1JiUDlrdWZMall3aGMwTkdqTmIy?=
 =?utf-8?B?TmNva0ZUTGszRG5ydnRiY3BZbzZucEdXUURDVElPbm1UUVFFQTZWbk1kam5Z?=
 =?utf-8?B?RW1vZU13dGZKaUczV25kRWFCRjZ1dW1yN05vU1VFb1BnR0g0WlIyRitKT2ln?=
 =?utf-8?B?dUp6YVlYUGhMWlFXQ2JBSUdyVWpvQkRMRE1RTGQ2amdheEpJUlRJMTZhbUZX?=
 =?utf-8?B?Z3duemtrWm5tOGdGeWRaMDhiRWNpb2VKZ01valNybWlGTnpFeU9pNGRpNmRG?=
 =?utf-8?B?dDZUTjF4ZHRQOVhDL0dZWkdyRnAwQWUrUUNjSEVmd09JOXMwRWJEcTFLck5T?=
 =?utf-8?B?KzNHSlZUV0FUYllDTlN1aEhsUjRyajdjcy9GcG9IckNKL1RJQm1JdlFDSklD?=
 =?utf-8?B?WlBqaThQT0I5ck5hZzNyMWxyb0pyWXRKZHFFbWRCSUw0b1BUUWRJVWpwV0Vw?=
 =?utf-8?B?UVN1UXh5dUUza0lqODRVQ1pSOFEvOE1nRkh3Yms3Sk1FU3ZmWlU2VlA1OHU1?=
 =?utf-8?B?T3N0alpMd2N4eHJvT1ArZVNNdmxsc0NjVE5Zd0U0VjVBSUZua3BLeHp2TS9R?=
 =?utf-8?B?Z2N0WDBsVEFncDZRSkFqQ3VSdlI3THhnbXNtZ1U3NmtMOE9JditpK3pGc3d4?=
 =?utf-8?B?dG5NTUpGVGNpaUtLKzNUM1Y2dnVSb3BnNDNBanNveTJyem8xVFV5SzZmOGZx?=
 =?utf-8?B?MHVCU2owSVVrUk80OWcxVkhtMnJFc1BiRnhvN2d1MWE5TFNhdXRkTXRXRDl1?=
 =?utf-8?B?RGp1RFJWMjR1bC9xOGpwTFR3K0J3c1FJdVJnOU41UlJZR1BOOTlEUEFtaGIw?=
 =?utf-8?B?Wm5FNlptUnlHbXZCSjZ6TEs2SGFRMmdMcGJoZThwN05acE5MQUIyWEczNDNx?=
 =?utf-8?B?ZWI2aDdlb0RZSnFUSURWakZCeSt0eXNMZXp4bEpGV2FsdFprU1EzWU0vL3d2?=
 =?utf-8?B?bUlnYVAxZ0l4UzRaSEhiMVlnRGp5Wnl4RUcwT0VSSzhsNW51emlzM0dUZjdS?=
 =?utf-8?B?b1d0NUw0d1JKVkpPZFh1dloyam16dU0yb3ZCOWtsVUxLNGk2d24xUnVEdmFB?=
 =?utf-8?B?Q0pwOTFGbjRjamtpc2FBcW0zaGZRazdUaXpucDN2VFV3eXpPYzRkbExZcHJi?=
 =?utf-8?B?YUIwajRHVndQdEpmaG8wbitocGZUQ2FUaElJVnc2RGsrVVFXK3VnMGxudXU3?=
 =?utf-8?Q?oeOA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6C5E149B8C78C245A07382FF4DA20164@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2be7568e-d820-455e-00c4-08dc11a4cbb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2024 06:24:26.9344
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +lIp79cyuWmZacge5/RAvHSzeXlyAtics7zbHrJciyh5FzhmU+69alC9BCJCuKApc3srQRSqSSttznfae9CXHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4312

T24gMjAyNC8xLzkgMjM6MjQsIFN0ZXdhcnQgSGlsZGVicmFuZCB3cm90ZToNCj4gT24gMS81LzI0
IDAyOjA5LCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9w
Y2kvcGh5c2Rldi5jIGIveGVuL2RyaXZlcnMvcGNpL3BoeXNkZXYuYw0KPj4gaW5kZXggNDJkYjNl
NmQxMzNjLi41NTJjY2JmNzQ3Y2IgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vZHJpdmVycy9wY2kvcGh5
c2Rldi5jDQo+PiArKysgYi94ZW4vZHJpdmVycy9wY2kvcGh5c2Rldi5jDQo+PiBAQCAtNjcsNiAr
NjgsMzkgQEAgcmV0X3QgcGNpX3BoeXNkZXZfb3AoaW50IGNtZCwgWEVOX0dVRVNUX0hBTkRMRV9Q
QVJBTSh2b2lkKSBhcmcpDQo+PiAgICAgICAgICBicmVhazsNCj4+ICAgICAgfQ0KPj4gIA0KPj4g
KyAgICBjYXNlIFBIWVNERVZPUF9wY2lfZGV2aWNlX3N0YXRlX3Jlc2V0OiB7DQo+PiArICAgICAg
ICBzdHJ1Y3QgcGh5c2Rldl9wY2lfZGV2aWNlIGRldjsNCj4+ICsgICAgICAgIHN0cnVjdCBwY2lf
ZGV2ICpwZGV2Ow0KPj4gKyAgICAgICAgcGNpX3NiZGZfdCBzYmRmOw0KPj4gKw0KPj4gKyAgICAg
ICAgaWYgKCAhaXNfcGNpX3Bhc3N0aHJvdWdoX2VuYWJsZWQoKSApDQo+PiArICAgICAgICAgICAg
cmV0dXJuIC1FT1BOT1RTVVBQOw0KPj4gKw0KPj4gKyAgICAgICAgcmV0ID0gLUVGQVVMVDsNCj4+
ICsgICAgICAgIGlmICggY29weV9mcm9tX2d1ZXN0KCZkZXYsIGFyZywgMSkgIT0gMCApDQo+PiAr
ICAgICAgICAgICAgYnJlYWs7DQo+PiArICAgICAgICBzYmRmID0gUENJX1NCREYoZGV2LnNlZywg
ZGV2LmJ1cywgZGV2LmRldmZuKTsNCj4+ICsNCj4+ICsgICAgICAgIHJldCA9IHhzbV9yZXNvdXJj
ZV9zZXR1cF9wY2koWFNNX1BSSVYsIHNiZGYuc2JkZik7DQo+PiArICAgICAgICBpZiAoIHJldCAp
DQo+PiArICAgICAgICAgICAgYnJlYWs7DQo+PiArDQo+PiArICAgICAgICBwY2lkZXZzX2xvY2so
KTsNCj4+ICsgICAgICAgIHBkZXYgPSBwY2lfZ2V0X3BkZXYoTlVMTCwgc2JkZik7DQo+PiArICAg
ICAgICBpZiAoICFwZGV2ICkNCj4+ICsgICAgICAgIHsNCj4+ICsgICAgICAgICAgICBwY2lkZXZz
X3VubG9jaygpOw0KPj4gKyAgICAgICAgICAgIHJldCA9IC1FTk9ERVY7DQo+PiArICAgICAgICAg
ICAgYnJlYWs7DQo+PiArICAgICAgICB9DQo+PiArDQo+IA0KPiAgICAgICAgIHdyaXRlX2xvY2so
JnBkZXYtPmRvbWFpbi0+cGNpX2xvY2spOw0KPiANCj4+ICsgICAgICAgIHJldCA9IHZwY2lfcmVz
ZXRfZGV2aWNlX3N0YXRlKHBkZXYpOw0KPiANCj4gICAgICAgICB3cml0ZV91bmxvY2soJnBkZXYt
PmRvbWFpbi0+cGNpX2xvY2spOw0KdnBjaV9yZXNldF9kZXZpY2Vfc3RhdGUgb25seSByZXNldCB0
aGUgdnBjaSBzdGF0ZSBvZiBwZGV2IHdpdGhvdXQgZGVsZXRpbmcgcGRldiBmcm9tIGRvbWFpbiwg
YW5kIGhlcmUgaGFzIGhlbGQgcGNpZGV2c19sb2NrLCBpdCBoYXMgbm8gbmVlZCB0byBsb2NrIHBj
aV9sb2NrPw0KDQo+IA0KPj4gKyAgICAgICAgcGNpZGV2c191bmxvY2soKTsNCj4+ICsgICAgICAg
IGlmICggcmV0ICkNCj4+ICsgICAgICAgICAgICBwcmludGsoWEVOTE9HX0VSUiAiJXBwOiBmYWls
ZWQgdG8gcmVzZXQgUENJIGRldmljZSBzdGF0ZVxuIiwgJnNiZGYpOw0KPj4gKyAgICAgICAgYnJl
YWs7DQo+PiArICAgIH0NCj4+ICsNCj4+ICAgICAgZGVmYXVsdDoNCj4+ICAgICAgICAgIHJldCA9
IC1FTk9TWVM7DQo+PiAgICAgICAgICBicmVhazsNCj4+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVy
cy92cGNpL3ZwY2kuYyBiL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jDQo+PiBpbmRleCA3MmVmMjc3
YzRmOGUuLjNjNjRjYjEwY2NiYiAxMDA2NDQNCj4+IC0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvdnBj
aS5jDQo+PiArKysgYi94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYw0KPj4gQEAgLTEwNyw2ICsxMDcs
MTUgQEAgaW50IHZwY2lfYWRkX2hhbmRsZXJzKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4gIA0K
Pj4gICAgICByZXR1cm4gcmM7DQo+PiAgfQ0KPj4gKw0KPj4gK2ludCB2cGNpX3Jlc2V0X2Rldmlj
ZV9zdGF0ZShzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+ICt7DQo+PiArICAgIEFTU0VSVChwY2lk
ZXZzX2xvY2tlZCgpKTsNCj4gDQo+ICAgICBBU1NFUlQocndfaXNfd3JpdGVfbG9ja2VkKCZwZGV2
LT5kb21haW4tPnBjaV9sb2NrKSk7DQo+IA0KPj4gKw0KPj4gKyAgICB2cGNpX3JlbW92ZV9kZXZp
Y2UocGRldik7DQo+PiArICAgIHJldHVybiB2cGNpX2FkZF9oYW5kbGVycyhwZGV2KTsNCj4+ICt9
DQo+PiArDQo+PiAgI2VuZGlmIC8qIF9fWEVOX18gKi8NCj4+ICANCj4+ICBzdGF0aWMgaW50IHZw
Y2lfcmVnaXN0ZXJfY21wKGNvbnN0IHN0cnVjdCB2cGNpX3JlZ2lzdGVyICpyMSwNCg0KLS0gDQpC
ZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

