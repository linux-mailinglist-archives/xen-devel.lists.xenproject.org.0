Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDB96EACF
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 20:47:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoXrL-00072D-Th; Fri, 19 Jul 2019 18:43:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AH7D=VQ=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1hoXrK-000726-Av
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 18:43:58 +0000
X-Inumbo-ID: 2a65e6c3-aa55-11e9-8980-bc764e045a96
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe49::604])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2a65e6c3-aa55-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 18:43:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FnOXaFoKb78HcPE5Xhl6pCr6BYiS7dzwQCyki6L1cvTQu5PBKcLTJyemHoI65j2slpypzlU/UjwnRJV3lCg+gvdgKzPQnnU8YZO5p65N7qY/ICGIRrNfHo1mCO63n/suY2Z/Kj364UlqNGiQ1TlcjFOvscYwAJqktur8pzSBUgbRVpsbrUPzJpQ3+hqbUa9+v1XAIuLy7hQ/LVKiCsLQkWbaehICuxzMiCEVj3aGQ8ZPFPRSkYEvhqAvswaarU2Q+7DtLlguJXXeRDM+12CRaUKIV5wX954WqDju00OJS+bogWKbuB0viOw+4oak3XIqGgQsQAdDAMkVyoV6ouBzOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1q2SKdNepYeKDQjfP756ZrpoTQxVAbMRgIi/wZuV2E=;
 b=k7LNCI9NPvzHV00V5WEcGRzPKhWkw+kZXyMR81mp3rxf9ALGww4FDhmDv+UHyNJags9Bil0cK+WjKoXEaoFSSFGn8qCmpFdU/mkIbGP/XtPte+0a5H5Ozlq002P+T/pAnxTiSHbqAkFLo/UoF6xrMtnnbr2Id9mp+QgZTCGAwc5NO+XpJl5gdB4PQA/PCD5dNUg0A9WF5mZeCURDXqfixr8Dn39gz0vzxqSVtFrB5mjAPILrlDbgoh4UiSlxrsyEhV8RIo0S8wZCEmmN3eJ23oe+k9D8XNYUCaZEi7A/UlmF+aKv64mWlbitzOjvjJhA6ywPbkxwDJXvk45xJ9qr4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1q2SKdNepYeKDQjfP756ZrpoTQxVAbMRgIi/wZuV2E=;
 b=V3sBZnWX0HrS9OxEOm3J3Ss1WadSTcxfHFCwjPKndmL2xl2UvvD7ltluBSnqKhoJYPDahIF2VwUD+9r+MwsiOamLc+3EgxIJP/o8E6gkKRQxH7v/kj7zQwQDhXASSRyEjd7HWDGsmhvpEhBCv71Z2Ynshz91ANeIImZ5Kwyavy8=
Received: from DM6PR12MB3515.namprd12.prod.outlook.com (20.179.106.151) by
 DM6PR12MB2953.namprd12.prod.outlook.com (20.179.104.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.14; Fri, 19 Jul 2019 18:43:55 +0000
Received: from DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::3576:d8b0:7554:adc]) by DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::3576:d8b0:7554:adc%7]) with mapi id 15.20.2094.013; Fri, 19 Jul 2019
 18:43:55 +0000
From: "Woods, Brian" <Brian.Woods@amd.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [PATCH v3 14/14] AMD/IOMMU: process softirqs while dumping IRTs
Thread-Index: AQHVO/VX3Kxfr5X6kUqWlRRaNiXYV6bSS+iA
Date: Fri, 19 Jul 2019 18:43:55 +0000
Message-ID: <20190719184352.GK4496@amd.com>
References: <6272c301-a905-38cf-dd1a-645f3d703241@suse.com>
 <10fb0354-9018-a714-44b7-efda1b579aa1@suse.com>
In-Reply-To: <10fb0354-9018-a714-44b7-efda1b579aa1@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN4PR0501CA0148.namprd05.prod.outlook.com
 (2603:10b6:803:2c::26) To DM6PR12MB3515.namprd12.prod.outlook.com
 (2603:10b6:5:18a::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Woods@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f40d2fe9-aaf3-4964-5832-08d70c790dac
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2953; 
x-ms-traffictypediagnostic: DM6PR12MB2953:
x-microsoft-antispam-prvs: <DM6PR12MB2953803E829F5EE6E11E599BE5CB0@DM6PR12MB2953.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(346002)(39860400002)(136003)(376002)(199004)(189003)(6436002)(316002)(305945005)(6916009)(6486002)(2906002)(14454004)(4326008)(54906003)(86362001)(53936002)(6512007)(6246003)(8676002)(33656002)(1076003)(3846002)(36756003)(71190400001)(71200400001)(478600001)(66476007)(66556008)(64756008)(66446008)(66946007)(66066001)(25786009)(6116002)(5660300002)(81156014)(81166006)(52116002)(7736002)(446003)(256004)(14444005)(11346002)(68736007)(8936002)(486006)(26005)(99286004)(186003)(476003)(6506007)(386003)(102836004)(2616005)(229853002)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2953;
 H:DM6PR12MB3515.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kq63TWfAPaBEtUHxDIO4rRBGyh++xa5U4wS6/m28hFWlz+Px7kbyUKwzb0c2BKtmC2YILyQENlDDJBlPil20iUamVHSsApEMAgYAwjT7aYTR3f17OJfIK8iJFsuZJW7gtYv2LMlavOhQAh1jOQtkLnTcjrkdMknPJKW7sd2c26Hcmj9W7ZTMBXAIzgsOquxa+//ifM7WBXXZp1/b7ZWgzvqvNsvQIGLn9bdpJvn+RsEmrPmM16y/B3/Lt5pkS1KFvAtLW5h9X+LL3AbxS2m9kBSb0Q43cwKyO5mVNg5oYQ+zNmCePYQ0585ykz1NNom9FyqEK/lkTpHB7AWhk4ZM1gZ/Mhb53NXG7FRmQUMdY9E9/wxgcm+mnrzgPn//wbLF7nuJWrY0ODbH/nX8eiNWmOVTBnYIpoTUogXFjG0MMAM=
Content-ID: <51179C99BE253C49B448A78D0A063966@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f40d2fe9-aaf3-4964-5832-08d70c790dac
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 18:43:55.7198 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: brwoods@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2953
Subject: Re: [Xen-devel] [PATCH v3 14/14] AMD/IOMMU: process softirqs while
 dumping IRTs
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Woods, 
 Brian" <Brian.Woods@amd.com>, "Suthikulpanit,
 Suravee" <Suravee.Suthikulpanit@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgMDQ6NDE6MjFQTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gV2hlbiB0aGVyZSBhcmUgc3VmZmljaWVudGx5IG1hbnkgZGV2aWNlcyBsaXN0ZWQgaW4g
dGhlIEFDUEkgdGFibGVzIChubwo+IG1hdHRlciBpZiB0aGV5IGFjdHVhbGx5IGV4aXN0KSwgb3V0
cHV0IG1heSB0YWtlIHdheSBsb25nZXIgdGhhbiB0aGUKPiB3YXRjaGRvZyB3b3VsZCBsaWtlLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkFja2Vk
LWJ5OiBCcmlhbiBXb29kcyA8YnJpYW4ud29vZHNAYW1kLmNvbT4KCj4gLS0tCj4gdjM6IE5ldy4K
PiAtLS0KPiBUQkQ6IFNlZWluZyB0aGUgdm9sdW1lIG9mIG91dHB1dCBJIHdvbmRlciB3aGV0aGVy
IHdlIHNob3VsZCBmdXJ0aGVyCj4gICAgICAgc3VwcHJlc3MgbG9nZ2luZyBoZWFkZXJzIG9mIGRl
dmljZXMgd2hpY2ggaGF2ZSBubyBhY3RpdmUgZW50cnkKPiAgICAgICAoaS5lLiBlbWl0IHRoZSBo
ZWFkZXIgb25seSB1cG9uIGZpbmRpbmcgdGhlIGZpcnN0IElSVEUgd29ydGgKPiAgICAgICBsb2dn
aW5nKS4gQW5kIHdoaWxlIG1pbm9yIGZvciB0aGUgdG90YWwgdm9sdW1lIG9mIG91dHB1dCBJJ20K
PiAgICAgICBhbHNvIHVuY29udmluY2VkIGxvZ2dpbmcgYm90aCBhICJwZXIgZGV2aWNlIiBoZWFk
ZXIgbGluZSBhbmQgYQo+ICAgICAgICJzaGFyZWQiIG9uZSBtYWtlcyBzZW5zZSwgd2hlbiBvbmx5
IG9uZSBvZiB0aGUgdHdvIGNhbiBhY3R1YWxseQo+ICAgICAgIGJlIGZvbGxvd2VkIGJ5IGFjdHVh
bCBjb250ZW50cy4KPiAKPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVf
aW50ci5jCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2ludHIuYwo+
IEBAIC0yMiw2ICsyMiw3IEBACj4gICAjaW5jbHVkZSA8YXNtL2h2bS9zdm0vYW1kLWlvbW11LXBy
b3RvLmg+Cj4gICAjaW5jbHVkZSA8YXNtL2lvX2FwaWMuaD4KPiAgICNpbmNsdWRlIDx4ZW4va2V5
aGFuZGxlci5oPgo+ICsjaW5jbHVkZSA8eGVuL3NvZnRpcnEuaD4KPiAgIAo+ICAgc3RydWN0IGly
dGVfYmFzaWMgewo+ICAgICAgIGJvb2wgcmVtYXBfZW46MTsKPiBAQCAtOTE3LDYgKzkxOCw4IEBA
IHN0YXRpYyBpbnQgZHVtcF9pbnRyZW1hcF9tYXBwaW5nKGNvbnN0IHMKPiAgICAgICBkdW1wX2lu
dHJlbWFwX3RhYmxlKGlvbW11LCBpdnJzX21hcHBpbmctPmludHJlbWFwX3RhYmxlKTsKPiAgICAg
ICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCYoaXZyc19tYXBwaW5nLT5pbnRyZW1hcF9sb2NrKSwg
ZmxhZ3MpOwo+ICAgCj4gKyAgICBwcm9jZXNzX3BlbmRpbmdfc29mdGlycXMoKTsKPiArCj4gICAg
ICAgcmV0dXJuIDA7Cj4gICB9Cj4gICAKPiAKCi0tIApCcmlhbiBXb29kcwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
