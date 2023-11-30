Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD687FEAF2
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 09:39:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644454.1005477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8cZV-0003Cs-MM; Thu, 30 Nov 2023 08:38:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644454.1005477; Thu, 30 Nov 2023 08:38:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8cZV-0003A0-IO; Thu, 30 Nov 2023 08:38:57 +0000
Received: by outflank-mailman (input) for mailman id 644454;
 Thu, 30 Nov 2023 08:38:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NfjJ=HL=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1r8cZU-00038g-37
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 08:38:56 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7e89::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3c49e29-8f5b-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 09:38:53 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CH3PR12MB8584.namprd12.prod.outlook.com (2603:10b6:610:164::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Thu, 30 Nov
 2023 08:38:48 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1%3]) with mapi id 15.20.7046.024; Thu, 30 Nov 2023
 08:38:48 +0000
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
X-Inumbo-ID: e3c49e29-8f5b-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NYFZDNraTBJ2sH5liyW32xLBEzkI3q2X2PfHBrNotD/DD5uuZgkLt+Fku8HJec5phJzNiSstgyYuhs0QymOQhqy0uFZ3LMS2TEyjfkcyxnXhxMAhXCjPfYkvjY3Q7EVrUNU1r1KHYdMz6Bh7Js/3W92VV6OUwXIztCqW8Nh0I7P0xtUP4vK4+w1ppF6Z4MnVWQPtR2RbSpH9t9PPjEoCnw0p4a4pIce6ugGw9hYgmLHc/3ZCSDkOeCqnlApOWMyhvCWIu60y+r0gw5D4+EMBRQJHa1CgVw1+sXAdGG9ueKA2a8H0L58uruo0tTrq0CYbYHjyV7QvlkNGVxmxFE/kGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FYv330pRZs/M9ux+daWixG//PtJ1d2N9UXPhnHCSRIg=;
 b=EEQVPyriyuzftVnkH2uSDe0F53phydhp7ZSDKRRYEcprpImnGR1PTjQmDHwWyKSSzq06Axr5y7Nyyd8rRSnMGN/Yqpqev+Ale40+1o4iKFvHihbZzvRpIEUef11fKcq0FMOtI8egEmgS4w5zx+sCFoH+hGYn9BNymozRL8i5OESOTQI9SVTQEdE/GVILhMxdEHQMrCTLgE/s5I+WYAL/CopxE8qgN2o+4ZrE/Q5QD3CddpPALufQQcS6p9LsWYnp+VN/cL9vKk4cAh+YAuY20b7imQZyrxkYkMuRcHpHpS1p2HgH2JZPJW7XxmBa1GhesIScrfovOUVVXysIjV+y8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FYv330pRZs/M9ux+daWixG//PtJ1d2N9UXPhnHCSRIg=;
 b=Pfy0G1qx/tDE9EDqegso4cr3Zxs8LwxulyDElDHXBPihCVXWMXvlCYA1FRvFQ9HCjvR+OsFF9LGm1D9hgowyaAnB4rQUJdy6Y9SYEFVYeOCRb0eUCSjGjAi6rlZFXAq3eQ8kUZ2FRU2aAf1aQGVuEAJFhwWHpCD6ruoslLfPy3g=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>, "Ragiadakou, Xenia"
	<Xenia.Ragiadakou@amd.com>
CC: "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, "Deucher, Alexander"
	<Alexander.Deucher@amd.com>, "Stabellini, Stefano"
	<stefano.stabellini@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, "Huang,
 Honglei1" <Honglei1.Huang@amd.com>, "Zhang, Julia" <Julia.Zhang@amd.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v2 2/3] x86/pvh: Open PHYSDEVOP_map_pirq for PVH
 dom0
Thread-Topic: [RFC XEN PATCH v2 2/3] x86/pvh: Open PHYSDEVOP_map_pirq for PVH
 dom0
Thread-Index: AQHaHsLnjKJ102tGrkSg9na/6oLNI7CP3bYAgAMYyICAACIUgA==
Date: Thu, 30 Nov 2023 08:38:48 +0000
Message-ID:
 <BL1PR12MB584911A5A3C50CEA128C9DE3E782A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20231124104136.3263722-1-Jiqian.Chen@amd.com>
 <20231124104136.3263722-3-Jiqian.Chen@amd.com>
 <fe8ee91c-7272-4cb9-b7a6-cb6ec7945bc1@suse.com>
 <BL1PR12MB5849B37472F195417B301A1EE782A@BL1PR12MB5849.namprd12.prod.outlook.com>
In-Reply-To:
 <BL1PR12MB5849B37472F195417B301A1EE782A@BL1PR12MB5849.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: MN0PR12MB6344.namprd12.prod.outlook.com
 (15.20.7068.000)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CH3PR12MB8584:EE_
x-ms-office365-filtering-correlation-id: 359f918e-cadd-4f11-c209-08dbf17fc5e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 xe17EHAWKG6DpPzg4BPtMOUeYoKuLfMFBMvGVsXpR3Nzf8t2jT3dKbr1Jx2aMW0imM/vyqI7YvreiRyFI+JJ4GVgZQ8Z3rvhCy6k4ssnc7l/bA+KbZTuWBYZXL+GhsJBXXYvsDviMSfOo7lUCeEYqz0OVw2kiIZ3RUTCL2MC9WDyFe4M0rYehlJ/qfkfOe0rgrNilzNzFctChvhpPemyajjERbnta/3C1dJ5gcHsXcl5eU4J/v6+6AeZgjrnTNNJici/oTqJIdSgtoTumz78lH8av2qmsHk/Mpo512XABZnl9TnI4gd2NOxGrg/+r+3W10lwe8+CeJsEL0x7t7MNvVWs0ZwP3KEAjTuyvaHJU8EkigDWQaQ7sQB3S/urQmEFF0X7eSh6YJ96exTBJqB9yii793zEqPolilbeyLLqkji2bYpAIow2nBqU1rJqBd6TawML/qUjy4wrIDhHCqu6mnLOk9jSOJIDLURm11m/ki2QU/DkE0rVFiqA55lI8EZpUVA1RJUTI57QttydRBp8SS4HYLFwQImJch85dIJuq+xK758JeaJcG74w2gw+fdtBbHUQqFBZEqJE/VBiKiOh0uOhsFAzSVM8WWO1EZKbeqStZCI9bgkObNH/vlHKLiGfykRbXOztdfa3525GZPR/0kgcBrMddduX1Vw8M8ZusEErXeB6IgHN597i+5hW3rCb
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(376002)(136003)(39860400002)(366004)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(8676002)(8936002)(4326008)(110136005)(54906003)(316002)(52536014)(478600001)(76116006)(6636002)(66946007)(66476007)(66556008)(64756008)(66446008)(5660300002)(41300700001)(38070700009)(2906002)(122000001)(38100700002)(26005)(2940100002)(9686003)(7696005)(33656002)(71200400001)(53546011)(6506007)(83380400001)(202311291699003)(55016003)(340984004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eStlTVBrUHNoZmtidnBiS3RLa0FyZlFwVHR1b2trVDN1S1RnY1k5d0tJYmtW?=
 =?utf-8?B?dlFZRlIxaXpmeDRkbmhMSTNhc1UzNXRKcExpMlVNS2VmWjV1SzBDTEQrUHNh?=
 =?utf-8?B?dDdSdDlzTXJuN0lFbWFCWGVuMGhYSkdxMU5BRGE3Z3RMdThjRjFhSmkxbWc4?=
 =?utf-8?B?dWtrd3UxNUJTSWl0RkV3VmU0NW9PL1paU1czWEtRNnpJTGVqZVV4eExHdzFt?=
 =?utf-8?B?M1lXdUo5NzJtNXA4SXA0a1g4QVFyTVAxYzJNOURVQXU3R2Q4c0hBMEgyNUtn?=
 =?utf-8?B?VzliVGVrRlQwQndTdnluSCtXeE9uaVZRNllWc0JGS0dldzVXRWRQS0xjbVZE?=
 =?utf-8?B?QnhyME1pSk8xWXlUYm02YzFWQWE4bE9aTGNpYlNjSFBDYmFMRFZ1VUxpWW9x?=
 =?utf-8?B?aXBwck43SitqaHZIVUtOVGtzNko3aG5kSHR2eUIrbGk5cHcxbkVwZVYxN2oy?=
 =?utf-8?B?dUdaNGVybURtUS9qOTQ1UUY3RzZJeGo5Rm1Cc3JiL1VMSjhRUFV3T1ZvYUdR?=
 =?utf-8?B?L2dxV0hmT2FUb2lQUHladnFOWnd4Zk5VZXNibEdobDdzT2R1aGNIN1d0Rzgy?=
 =?utf-8?B?cnhUMjhYSndSaUk2am1HYTRIaEJoeW4rczc2KzcyYVpqdXg3K2RYbjJRMjBt?=
 =?utf-8?B?M29UcVdOTjAzSXE3TGs4ek9FZVgxQjI2SVNLa0ZMWmpnU1liMXk3YncxK3I0?=
 =?utf-8?B?a2pzUTdIRGNnYXlxOG5sTUhIazM3eW1iQ0txUkFrSm1wbjNnUG5MczJuZTVs?=
 =?utf-8?B?NzdzTTlZSWIvVVRVUjV6RkNnbU13YmJRdFhDbWhnTnVUeWdMd0NtcFRrMXlZ?=
 =?utf-8?B?QU9NUnZxVjh2S294RWxybnlJa2xSRmZpek1CMUQ1YmcvdHdGbjI2aDJsUE5k?=
 =?utf-8?B?UlhRU3pHUjY0cjNnelg0LzdMRmJveENDT2Z3NlVWTm03cUtRNDMvQVAzQ2pG?=
 =?utf-8?B?UXYveFV0a0J2b09oQWFNd2R6NjJva2o4NFFxdTJXVDREMDdOK2xvN3lZUnBY?=
 =?utf-8?B?cy8ycUdpOFdDclY4cVRpR2wyTGYzOUY1NWZ5bmxBZHVWaWVSM2pLd3lUblN4?=
 =?utf-8?B?MDBWM1JYa1o4SGN5RktlelN1bTdHd1BGYkRCdUtkOHlKcEh0Uk5yY2E0ZlBB?=
 =?utf-8?B?VmdKTjE3TWcwZUZIVU1wcWFjTkxlOFpQQyt4QUpEeFlhdTNEYVQvRnpxSDc4?=
 =?utf-8?B?N2tNMmtHV3RVOStINis1Qkd6d09DaWVnL0VLTEMzZHdibTgwTFRzSVhGSmM2?=
 =?utf-8?B?WXZtaTdjaHpndS9CeXNiNGZlcndDV0VaL1VUbzJPK21qNmhPcldkeVRtY2NN?=
 =?utf-8?B?bkVIWTFEOG9vTU53Rm8xOEppVVlEWmNIT2l5UGh3Vm0rdUdqMS9zbUwvUGE2?=
 =?utf-8?B?alBucHcxc0d2ZEtNY1dET1NCMExSckN2YlBGSXRxSnhURVgzSXlkVXlKNThj?=
 =?utf-8?B?eTVhNzZadlNManZneFkyK1NjcXRsNktyUk1DVndkT1lzTlhhMDNEYzhkV1FM?=
 =?utf-8?B?cys4MDFNMk5IUEEzbmp6ZDJ1eEw0UDV6cVlFSHFJdHBMYXVBYmRQTWRISzVR?=
 =?utf-8?B?aGxEOGdZc2lxS002L0JSWFpwbGRTQU1PWnhkN3l5VnRJeWpDZTdLWnBCZjRq?=
 =?utf-8?B?ejR1VE5PWHJwcFVaNkl6L2hyalFNZW9weFY0bFMzbzBNa2h3U3YzTGh2TjlS?=
 =?utf-8?B?R2o1TlYvRkt4aW1yWll3ZDZmRElWbkdhejBsRzF1WjRuckw1UitYTmlOZUVu?=
 =?utf-8?B?VGJOMXdnemhacWRHSkc4STFwV255ZkQrL2NxcDFuaXR4QW9GZUhhNTZYK1NM?=
 =?utf-8?B?amZ6MjhKQmJsN1VmdnRxV0pXUUN0NEEydENMUThIOGFETTJ1aDVvTEZZYkxx?=
 =?utf-8?B?aW11UjdnazBiU2w3dEcvUGtxOC9kRy96ZWwyQjY4cElPUjBLaVcva09kcUp6?=
 =?utf-8?B?RURBZFpnQ3RvUUpmSzk5WDA1dFdQYmx6bml0ZnZOdEw3SS9rZURtQTFaNW9n?=
 =?utf-8?B?dWkvWHF0QU8xVTJaNTJkRVJIM1BqR2hJZjk2UnpxbGJnUStoMnNiR3JMWWJJ?=
 =?utf-8?B?dUU4bUs5UDZtOUcyYUNLSGdMNDJEUkhnNUpIc0RGVTJFQnB6ZVBnZms0Z2l2?=
 =?utf-8?Q?+yMA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C51E1F63A5A3B94A8808346D05B30A6A@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 359f918e-cadd-4f11-c209-08dbf17fc5e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2023 08:38:48.6008
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xu6IM4+/78EZeHH1jDmLobmQNZ5Ul6LVQgwxq+FoP9vSmhtmycbdnVLf7B6GpA9BsOcbEqQKV659cvPFnnjpEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8584

SGkgSmFuIEJldWxpY2gsDQoNCk9uIDIwMjMvMTEvMzAgMTQ6NDQsIENoZW4sIEppcWlhbiB3cm90
ZToNCj4gDQo+IE9uIDIwMjMvMTEvMjggMjM6MTQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24g
MjQuMTEuMjAyMyAxMTo0MSwgSmlxaWFuIENoZW4gd3JvdGU6DQo+Pj4gLS0tIGEveGVuL2FyY2gv
eDg2L2h2bS9oeXBlcmNhbGwuYw0KPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaHlwZXJjYWxs
LmMNCj4+PiBAQCAtNzQsNiArNzQsOCBAQCBsb25nIGh2bV9waHlzZGV2X29wKGludCBjbWQsIFhF
Tl9HVUVTVF9IQU5ETEVfUEFSQU0odm9pZCkgYXJnKQ0KPj4+ICAgICAgew0KPj4+ICAgICAgY2Fz
ZSBQSFlTREVWT1BfbWFwX3BpcnE6DQo+Pj4gICAgICBjYXNlIFBIWVNERVZPUF91bm1hcF9waXJx
Og0KPj4+ICsgICAgICAgIGlmIChpc19oYXJkd2FyZV9kb21haW4oY3VycmQpKQ0KPj4+ICsgICAg
ICAgICAgICBicmVhazsNCj4+PiAgICAgIGNhc2UgUEhZU0RFVk9QX2VvaToNCj4+PiAgICAgIGNh
c2UgUEhZU0RFVk9QX2lycV9zdGF0dXNfcXVlcnk6DQo+Pj4gICAgICBjYXNlIFBIWVNERVZPUF9n
ZXRfZnJlZV9waXJxOg0KPj4NCj4+IElmIHlvdSB3b3VsZG4ndCBnbyB0aGUgcm91dGUgc3VnZ2Vz
dGVkIGJ5IFJvZ2VyLCBJIHRoaW5rIHlvdSB3aWxsIG5lZWQNCj4+IHRvIGRlbnkgc2VsZi1tYXBw
aW5nIHJlcXVlc3RzIGhlcmUuDQo+IERvIHlvdSBtZWFuIGJlbG93Pw0KPiBpZiAoYXJnLmRvbWlk
ID09IERPTUlEX1NFTEYpDQo+IAlyZXR1cm47DQo+IA0KPj4NCj4+IEFsc28gbm90ZSB0aGF0IGJv
dGggaGVyZSBhbmQgaW4gcGF0Y2ggMSB5b3Ugd2lsbCB3YW50IHRvIGFkanVzdCBhIG51bWJlcg0K
Pj4gb2Ygc3R5bGUgdmlvbGF0aW9ucy4NCj4gQ291bGQgeW91IHBsZWFzZSBkZXNjcmlwdCBpbiBk
ZXRhaWw/IFRoaXMgd2lsbCBncmVhdGx5IGFzc2lzdCBtZSBpbiBtYWtpbmcgbW9kaWZpY2F0aW9u
cyBpbiB0aGUgbmV4dCB2ZXJzaW9uLiBUaGFuayB5b3UhDQpPaCEgRG8geW91IG1lYW4gdGhlcmUg
YXJlIG1hbnkgY29kZSBzdHlsZSBwcm9ibGVtcyB0aGF0IG5vdCBzYXRpc2ZpYWJsZSBmb3IgQ09E
SU5HX1NUWUxFIG9mIFhlbiBpbiBteSBjb2Rlcz8NClRoYW5rIFhlbmlhIGZvciByZW1pbmRlci4N
Cg0KPiANCj4+DQo+PiBKYW4NCj4gDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4u
DQo=

