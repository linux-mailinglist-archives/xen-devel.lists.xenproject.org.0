Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEC9816553
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 04:26:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655659.1023351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rF4Fo-0001Wn-R3; Mon, 18 Dec 2023 03:25:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655659.1023351; Mon, 18 Dec 2023 03:25:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rF4Fo-0001Ue-Nx; Mon, 18 Dec 2023 03:25:16 +0000
Received: by outflank-mailman (input) for mailman id 655659;
 Mon, 18 Dec 2023 03:25:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nWsa=H5=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rF4Fm-0001UY-V4
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 03:25:15 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20600.outbound.protection.outlook.com
 [2a01:111:f403:2409::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c3ddcdf-9d55-11ee-98eb-6d05b1d4d9a1;
 Mon, 18 Dec 2023 04:25:13 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by PH7PR12MB8793.namprd12.prod.outlook.com (2603:10b6:510:27a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Mon, 18 Dec
 2023 03:25:05 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1%3]) with mapi id 15.20.7091.034; Mon, 18 Dec 2023
 03:25:05 +0000
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
X-Inumbo-ID: 0c3ddcdf-9d55-11ee-98eb-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VdV4MiJ+0VUVvCLFhI7Be/IO0vb3S4Yqm9rWgbqN6e+y3oM28DVoEtbnz9x1suqjNXpjOPJu6+n7o/DkxrelkpiDQuSHEcvQaVtyxnfpObkCia6SqgA73wLhf8n4K2NsB0p2LFNRvNfx14yeO1z6faXxEW2m6uhZOx/GHdPubk/421sMJ16ovwuEi90q7pOwwNyoggxA4vBdmAQ9HOIs0tkSMS7wKQzWE6GRb89XH8FNBCyG3dn1iWO9IKbB94ScKzB7UPbHI6nrCnTrnjZ9/TGUii/bcpeJoaOlBcFKxKGJqTaNAVMchIGdD8aU3Nin2AXHkNprUqke9Ab9A+2D/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mEBRPe2MRV/MdybBof27MTjnam7g6tLVZNDdVAm/X3c=;
 b=kf8T4MQS/sRETf0kPjHn7G9zMYLirng6nmAY2ia/KTJVFw2nPkXXRGWT69ijA5oibQ1R8L5YhTKK/jn6JbsSuMvLmqhzo9vfv4tRMVMBaeJqzIZl9ZXG6wiFTkZb0shYmRBjx1YLxC6omgaBdDeQ+opWjJoBp33TCP5N+IbYfdbisSP5158wWoFwa7HVsUTd0SMYrwyGQk1cb3EPAojUVg96TSfb/oDqmP02sOv54AyhN/pIrKZJ4S0pL/zaOakaqk70MwA9mu5RxIBbqmad2HyrdXpQWW+645yjuLQNOzdUfGAAmI1Qw3qJIuz76HcRDNOpnW9M6VFep+z8fFVahQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mEBRPe2MRV/MdybBof27MTjnam7g6tLVZNDdVAm/X3c=;
 b=w4oIoZscKVsckITRsUi03ogY4M6lODjOIrp79l13S5j7xatkgfARTjTzO3bUGCvN9pumbtbwHXjyEqXkD70o01R2LwsV32PV7xRM7AB646TU2ervIFQOZn6qyvAGpceVnhUIj0GlqSSXfF4ClqOH/yZQVeQNIwb7/g4/8+Wf+ck=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich
	<jbeulich@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>, Wei
 Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	"Huang, Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v3 2/3] x86/pvh: Add (un)map_pirq and setup_gsi
 for PVH dom0
Thread-Topic: [RFC XEN PATCH v3 2/3] x86/pvh: Add (un)map_pirq and setup_gsi
 for PVH dom0
Thread-Index:
 AQHaK4ebBv/EWT+No0GAUR8lU4172LCkNzqAgAGFPID//6gjAIABpqIA///CiwCAAi33AP//lJaAAAAYnAAAAExygAAan/AAACJ1V4D//45vgIAE5d8A
Date: Mon, 18 Dec 2023 03:25:05 +0000
Message-ID:
 <BL1PR12MB5849D229B71783001C834E72E790A@BL1PR12MB5849.namprd12.prod.outlook.com>
References:
 <BL1PR12MB5849B1BDCBECD73353413869E78EA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <704cc051-7362-4691-a120-4effaf8dd1fc@suse.com>
 <BL1PR12MB584993E317AF28E675814FC6E78DA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <917ef38b-5aec-4c6a-803c-c0b2dcc74454@suse.com>
 <BL1PR12MB58494259A9E37CD7133090D9E78CA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZXrRG8oc25Do0Dnv@macbook> <390368e2-5f13-4bbf-8c07-4a05c04e9939@suse.com>
 <ZXrTwfzedFQLhxiQ@macbook>
 <alpine.DEB.2.22.394.2312141441020.3175268@ubuntu-linux-20-04-desktop>
 <PH7PR12MB58546C2F2208D57396C48764E793A@PH7PR12MB5854.namprd12.prod.outlook.com>
 <ZXwOabGbV_lFaSfO@macbook>
In-Reply-To: <ZXwOabGbV_lFaSfO@macbook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL3PR12MB6546.namprd12.prod.outlook.com
 (15.20.7113.000)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|PH7PR12MB8793:EE_
x-ms-office365-filtering-correlation-id: 4b37cd59-d3d5-4547-5000-08dbff78eda9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 HFdp9eQshtaTNJC+BjwRmm0FXACK/jCe8hhM8nmqasji74QHRDQF/qW2DK0YQIE+x+XkG0hAB5vWJC38jLGNAHvpW5i4y2y8ZCv7TVUk8+mXR4hu+nwcxZ6Isd4oCncIbL/yE34dofOIrvIp6EI1B/Yf6OZPAtmX5utXUVlxq/5y3sjLy3yOeLQMCfG3WzfSJTfQJVmQaQJ6mlkJMN4beOElm9PsbFNdarwSqreFiH8nTB7UASpv3SECgSVr5LjEEmM8gJNh2Yjx/I4fbaUVy3Fe9jmL5GQUy3l63nfESPGqI8hOES7DqRCqX53iDAToIkGFlbKSmofEFbbkzSMScmuHeisTJTgjQb6ZhItTZ1GuzBue5izmdVfxUhU55H3amZ2yecC6a+5uN0yjv3odmNKh1O9uzzS4MRIxfym1pplHe9iPcAw0GwnOGQNx1PSf2Z79townkwzJN1o6tgBHHjT6FlE565Nf1dRfJsrE8ldu48Z/H8E2HzhlHHXfu06KncI0dppf2OECtWYb9I1wGuFjjZDC/FynK2LaC/AnJGesAa2+a2SaMzy/tF/f/CHl2FZnAIEM1SFmEZkD8xoZSOXebNqbXDWD5Vx8F/MwINiRFis01cSkPQQ7jdryPv8o
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(346002)(39860400002)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(55016003)(38070700009)(76116006)(33656002)(38100700002)(122000001)(83380400001)(26005)(53546011)(71200400001)(478600001)(2906002)(66556008)(66476007)(66446008)(64756008)(54906003)(6916009)(9686003)(7696005)(6506007)(4326008)(8936002)(8676002)(66946007)(316002)(5660300002)(41300700001)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dGtBeDZBK3JCeWJtZGlTQXZJWDg3dHVMMElnaFAvemJScTl6UU5ZRW52bjRF?=
 =?utf-8?B?ZjN1TlgrdU9IcVlxSWZNNzYzSS8welJadlhZOURLYmphYlhpWEIrOUdhYk1M?=
 =?utf-8?B?MmtiM08rV1ZzdlpoZ2VtRCtjQ1dyUmFZK3VVSHBMRzd3WFZTVmpCOU9OT05i?=
 =?utf-8?B?T1Uvcmd1UldiS21jOHJMSHZ0SlZpc1I0Zzg0SjByaE9rQllFaFpOdVFZMnQ2?=
 =?utf-8?B?VEd6NFdvanhqV1Y5Wk9XNmNHc0hXY1J6R25YVzFtTmt6RFpxZklPbnE5MXdC?=
 =?utf-8?B?cTVHZjNmSVhzM3VpWHJPcXBtV2JxL0lLWHVKMldZd2R1VmJYaFNCZXZRa3dV?=
 =?utf-8?B?Ykx6eDN2SUp4dHBVNGFWUzB4UFVNTklSb3k5SWdPZDIraWxYM0xnL2dxMWVI?=
 =?utf-8?B?WmxUUXc1ZitVaGp4dnpEZm02OS96R1NXTzNzck5RMjNGOTVPSmNSM3JDRDFw?=
 =?utf-8?B?eTJoOUtGTzAza1JnU0VBSlBLcGNhekVWQURZc3VCcnpka2hlSytsVnlUaTlZ?=
 =?utf-8?B?S01zc2hOeTI0WWJlYVlxSEhwSVJVUFlUVjlsdElXckpvenRGYTAyMmpRUG4w?=
 =?utf-8?B?ekpkZHY4eUxvOHNGblJ6QkpXempnSm5rVzBUQS9FYUdWUVFTUGFLV1F4aVhU?=
 =?utf-8?B?eTI1cVJycTl6cHZaYThqbVVpbmo0cFhHU01ncHVtQnA5cyt0VjcyNXptZGNJ?=
 =?utf-8?B?UnpOclNTbFFsN0NITlpmTFlvRG5yM3FHbVZNVkgvNGw5SEZKUUROYmJlZTJx?=
 =?utf-8?B?RGNTQ0ZmN3lnUEpXcXprdHk1d3o3Zk5Wd1VWR2xYZzB0RFJyaUM3eFNxVStK?=
 =?utf-8?B?K0NtQks5UURsSTJRbUFuYWFuR0RqNHR4REFNTDljMzN0bVVwWTQ0ZXdsVDFm?=
 =?utf-8?B?RW5qWEtaN1JBQmNrckFqQkwwT0Q4c21DSlgxMFFhRDRLbnF1Y25wRkdXdXJB?=
 =?utf-8?B?MFo2Y2xnTTc4N1RjcEFFVWFnbHpmaG9mYjhLY0ZCR3U4ZWZ1dDVDRTMvcXFB?=
 =?utf-8?B?RTBjK2p0bVl3Mnl5K3NIMUJON00yczZxdUxiOHU3cEpkelBhTENwRGF3UHJt?=
 =?utf-8?B?VDdENGtPS0VKM0NKK0Z3QVU2QzQ3ZDFvUVRzT0QwSWxTS0g2TXM3NjhPVGlG?=
 =?utf-8?B?K3VXdlZTWEU1ZGNJRmtpRk9vWXh2VlRVN1hrY0RaZ2oxK1N2dnB2b255U3VB?=
 =?utf-8?B?VWp2cGZNUnIrbmZGQTlGZXF0SHA1OGJSVCtuV3RPeFhmYTl3N3d5WkxQWVZR?=
 =?utf-8?B?alBrWlBtZzVtRlV0VEV6VkVyYW5yck9sTmZ2b2VVRjVpT0ZMK0JtUXhLSUho?=
 =?utf-8?B?dndLNlZkcFQ0L3JNTXRhN3B3ZzBVZHROR29IYnJ0ODFPSFVaQ1VPaUZzY1J1?=
 =?utf-8?B?NGlpWjBISGxkdDJFemlTcWtvczgxSzhaaVVMS1NEa0laT21HR3FEd09pZHk5?=
 =?utf-8?B?ejh5V1hMUWI4QndBQWRBTlpZa2VRR0VLSHdEeTBmWERXeC82YmZWY3Y0bEQz?=
 =?utf-8?B?dWxZTm50ZGtYUnk2L1VZK1l1WXBJVGlnUFpYazlBSkZXRThvMFc1UExHbTZ3?=
 =?utf-8?B?NlZFYzNOQnQ3a1ovVkg0STFOOHFoSzBxczFDVGZMZHlGUlR2TXE5QVhyYjJm?=
 =?utf-8?B?OFBDenBPZ2VIUjRPekR2S1hqUGRlSkt2WlpISi9MV1hDdURra3AxdkdqRk9W?=
 =?utf-8?B?d1BycmJmY2lRQ2dFYWZxS1NKdGVBdmlQbjZaaTZzRHVGVXFRRFZiN3lNc2V2?=
 =?utf-8?B?TVZJb3V0TG1qQ2dmM0VOd2lmT3o4bnJTVEc0VWJ2S2UxeWVLWkFXSG5DOWkr?=
 =?utf-8?B?ejdESm9QVWc1UHVBcmxaMXRycEhDaXIxMkphaExVWlluU0J3akdPMTBueURN?=
 =?utf-8?B?Q0xWREkycktlSXM4bWNMNkFDWDVpb01XdTlRVUVxdEc3RWRTeGhkN20vVmEy?=
 =?utf-8?B?YUlReTN2emF0eE9IQ0pWUjBORTM1K1NkdFZZTmZBK2FWcG5XNmVGcm41NUo1?=
 =?utf-8?B?bnRRZTIrZ2V5Q3ZEUUJSV0JaUHVnNE5aVVJQbjRIWVJRMi9ndTJSa1lKd1hv?=
 =?utf-8?B?SUdXMlcwTHNlZHNObE1NVmhhR0NyZzhmb0ZRRzVLMjArMWtWV3B3ektNeTZl?=
 =?utf-8?Q?gD2o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <69B4D5EBBE258046ABEA1CD25345FEB1@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b37cd59-d3d5-4547-5000-08dbff78eda9
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2023 03:25:05.1269
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vkG13Re49c2Pfj087dyRvvpCl1lBBu+IvcDkvMJ63ALGItbb2CWr8fqMnLBJ3laojSdE0CRKQxka2yCfcoLifg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8793

T24gMjAyMy8xMi8xNSAxNjoyOSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gT24gRnJpLCBE
ZWMgMTUsIDIwMjMgYXQgMDc6MjA6MjRBTSArMDAwMCwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4g
ZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfcGNpLmMgYi90b29scy9saWJzL2xp
Z2h0L2xpYnhsX3BjaS5jDQo+PiBpbmRleCBkMzUwN2QxM2EwMjkuLmY2NjVkMTdhZmJmNSAxMDA2
NDQNCj4+IC0tLSBhL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfcGNpLmMNCj4+ICsrKyBiL3Rvb2xz
L2xpYnMvbGlnaHQvbGlieGxfcGNpLmMNCj4+IEBAIC0xNDg2LDYgKzE0ODYsNyBAQCBzdGF0aWMg
dm9pZCBwY2lfYWRkX2RtX2RvbmUobGlieGxfX2VnYyAqZWdjLA0KPj4gICAgICAgICAgZ290byBv
dXRfbm9faXJxOw0KPj4gICAgICB9DQo+PiAgICAgIGlmICgoZnNjYW5mKGYsICIldSIsICZpcnEp
ID09IDEpICYmIGlycSkgew0KPj4gKyAgICAgICAgaW50IGdzaSA9IGlycTsNCj4+ICAgICAgICAg
IHIgPSB4Y19waHlzZGV2X21hcF9waXJxKGN0eC0+eGNoLCBkb21pZCwgaXJxLCAmaXJxKTsNCj4+
ICAgICAgICAgIGlmIChyIDwgMCkgew0KPj4gICAgICAgICAgICAgIExPR0VEKEVSUk9SLCBkb21h
aW5pZCwgInhjX3BoeXNkZXZfbWFwX3BpcnEgaXJxPSVkIChlcnJvcj0lZCkiLA0KPj4gQEAgLTE0
OTQsNyArMTQ5NSw3IEBAIHN0YXRpYyB2b2lkIHBjaV9hZGRfZG1fZG9uZShsaWJ4bF9fZWdjICpl
Z2MsDQo+PiAgICAgICAgICAgICAgcmMgPSBFUlJPUl9GQUlMOw0KPj4gICAgICAgICAgICAgIGdv
dG8gb3V0Ow0KPj4gICAgICAgICAgfQ0KPj4gLSAgICAgICAgciA9IHhjX2RvbWFpbl9pcnFfcGVy
bWlzc2lvbihjdHgtPnhjaCwgZG9taWQsIGlycSwgMSk7DQo+PiArICAgICAgICByID0geGNfZG9t
YWluX2lycV9wZXJtaXNzaW9uKGN0eC0+eGNoLCBkb21pZCwgZ3NpLCAxKTsNCj4+ICAgICAgICAg
IGlmIChyIDwgMCkgew0KPj4gICAgICAgICAgICAgIExPR0VEKEVSUk9SLCBkb21haW5pZCwNCj4+
ICAgICAgICAgICAgICAgICAgICAieGNfZG9tYWluX2lycV9wZXJtaXNzaW9uIGlycT0lZCAoZXJy
b3I9JWQpIiwgaXJxLCByKTsNCj4+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2RvbWN0bC5jIGIv
eGVuL2NvbW1vbi9kb21jdGwuYw0KPj4gaW5kZXggZjVhNzFlZTVmNzhkLi43ODJjNGE3YTcwYTQg
MTAwNjQ0DQo+PiAtLS0gYS94ZW4vY29tbW9uL2RvbWN0bC5jDQo+PiArKysgYi94ZW4vY29tbW9u
L2RvbWN0bC5jDQo+PiBAQCAtNjU4LDcgKzY1OCwxMiBAQCBsb25nIGRvX2RvbWN0bChYRU5fR1VF
U1RfSEFORExFX1BBUkFNKHhlbl9kb21jdGxfdCkgdV9kb21jdGwpDQo+PiAgICAgICAgICAgICAg
cmV0ID0gLUVJTlZBTDsNCj4+ICAgICAgICAgICAgICBicmVhazsNCj4+ICAgICAgICAgIH0NCj4+
IC0gICAgICAgIGlycSA9IHBpcnFfYWNjZXNzX3Blcm1pdHRlZChjdXJyZW50LT5kb21haW4sIHBp
cnEpOw0KPj4gKw0KPj4gKyAgICAgICAgaWYgKCBpc19odm1fZG9tYWluKGN1cnJlbnQtPmRvbWFp
bikgKQ0KPj4gKyAgICAgICAgICAgIGlycSA9IHBpcnE7DQo+PiArICAgICAgICBlbHNlDQo+PiAr
ICAgICAgICAgICAgaXJxID0gcGlycV9hY2Nlc3NfcGVybWl0dGVkKGN1cnJlbnQtPmRvbWFpbiwg
cGlycSk7DQo+IA0KPiBZb3UgYXJlIGRyb3BwaW5nIGFuIGlycV9hY2Nlc3NfcGVybWl0dGVkKCkg
Y2hlY2sgaGVyZSBmb3IgdGhlIEhWTQ0KPiBjYXNlLCBhcyBwaXJxX2FjY2Vzc19wZXJtaXR0ZWQo
KSB0cmFuc2xhdGVzIGZyb20gcGlycSB0byBpcnEgYW5kIGFsc28NCj4gY2hlY2tzIGZvciBwZXJt
aXNzaW9ucy4NCj4gDQo+IFRoaXMgd291bGQgbmVlZCB0byBiZSBzb21ldGhpbmcgYWxvbmcgdGhl
IGxpbmVzIG9mOg0KPiANCj4gaXJxID0gMDsNCj4gaWYgKCBpc19odm1fZG9tYWluKGN1cnJlbnQt
PmRvbWFpbikgJiYNCj4gICAgICBpcnFfYWNjZXNzX3Blcm1pdHRlZChjdXJyZW50LT5kb21haW4s
IHBpcnEpICkNCk9oLCB5ZXMsIGl0IHNob3VsZCBhZGQgdGhpcyBjaGVjay4NCg0KPiAgICAgaXJx
ID0gcGlycTsNCj4gZWxzZQ0KPiAgICAgaXJxID0gcGlycV9hY2Nlc3NfcGVybWl0dGVkKGN1cnJl
bnQtPmRvbWFpbiwgcGlycSk7DQo+IA0KPiBBbmQgdGhlbiBJIHdvbmRlciB3aGV0aGVyIGl0IHdv
dWxkbid0IGJlIGJlc3QgdG8gdW5pZm9ybWx5IHVzZSBhIEdTSQ0KPiBmb3IgYm90aCBQViBhbmQg
SFZNLg0KSWYgd2Ugb25seSBsb29rIGF0IHRoZSB2YWx1ZShzZWVtcyB0aGUgbnVtYmVyIG9mIGdz
aSA9PSBwaXJxID09IGlycSBpbiBQViksIGl0IHNlZW1zIHRoYXQgZ3NpIGNhbiBhbHNvIGJlIHVz
ZWQgdW5pZm9ybWx5IGZvciBQVi4NCkFuZCB0aGVuIGhlcmUgc2hvdWxkIGJlLiANCmlmICggaXJx
X2FjY2Vzc19wZXJtaXR0ZWQoY3VycmVudC0+ZG9tYWluLCBwaXJxKSApDQoJaXJxID0gcGlycTsN
CmVsc2UNCnsNCglyZXQgPSAtRVBFUk07DQoJYnJlYWs7DQp9DQoNCj4gDQo+IFRoYW5rcywgUm9n
ZXIuDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=

