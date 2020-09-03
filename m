Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2812E25BF05
	for <lists+xen-devel@lfdr.de>; Thu,  3 Sep 2020 12:25:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kDmQN-00035T-On; Thu, 03 Sep 2020 10:24:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w8ah=CM=intel.com=zhiyuan.lv@srs-us1.protection.inumbo.net>)
 id 1kDmQL-00035D-Nu
 for xen-devel@lists.xen.org; Thu, 03 Sep 2020 10:24:57 +0000
X-Inumbo-ID: 70d85d8b-cc54-4cbd-b7f9-6d366d8d5710
Received: from mga02.intel.com (unknown [134.134.136.20])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 70d85d8b-cc54-4cbd-b7f9-6d366d8d5710;
 Thu, 03 Sep 2020 10:24:55 +0000 (UTC)
IronPort-SDR: FTLu1qiDPD08ZbtxpuzhE4cNvMcRGklFJbMhiotmwyml00VE9oQWAqXBinRKohCB30cJkww+7H
 qhpXu6jmHP7Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9732"; a="145289237"
X-IronPort-AV: E=Sophos;i="5.76,386,1592895600"; d="scan'208";a="145289237"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2020 03:24:53 -0700
IronPort-SDR: QgsNbKf9A/QKkWDhZEx2YTlM1hPS7eRc7WMJoEDyXwdAkzHsZkTm0cYCiliQ1Sj/BHvoM5tqFK
 pXiSlLCX2UoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,386,1592895600"; d="scan'208";a="302158478"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 03 Sep 2020 03:24:53 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 3 Sep 2020 03:24:53 -0700
Received: from orsmsx102.amr.corp.intel.com (10.22.225.129) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 3 Sep 2020 03:24:53 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX102.amr.corp.intel.com (10.22.225.129) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 3 Sep 2020 03:24:52 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 3 Sep 2020 03:24:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FX1F9Kcq8vkZQJzbYpnTpFHGg9MZHS4TUrUHl/d9dxCRw8buSz2+1/9N8oGVfl7G2/o3CrjkC5AussW/7jvjPio5tXZIOQPGzjdgTFfyaZGjcaUkzyBBwKaZxVbkDfU63dnEx+tbrmdeM9JuyoLkZibwi5YPgDlebQ8fBOglWU5RyWBzf612Fqw32mrv69bBepT2H9/x9Q1vUyT4F3vZuAg+1h+zs9GR7+4uNyQo1gGJsweGITMnukQDBfQRRBHIfFTbkq+xQKsKiZvNzB5g1IHC7M6BVb+uXG02nFRXEcJcUlFbFuzF73UDs6fLIlk92Nod4NvV3tXum7MesXPrcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=URHCDqe0+fo4MdR6Mjgzir9PA4FV/8JSqZZcOc6uFHE=;
 b=CT1UG2zOfBHovAlYvHoWvBPOqZOQaeYEKWdKGx2VVWyLTeHuJLVAznyZDfwhrfODcZ2YIHPIJU3xBbVbcnMcG+5uhTSL0iRTOpzsOsvgmIWrAbXdxA+TkX0nOaANmReHVRaB18n5ErppnSQFIyS9p+E/xkStKli3HaICTmcvSRSfQogNUxNUrsehtAYe2OwQdw8zkG2BwoGLLPdPfBux0RiISx5p4tC7Hquz+jaWDd10QXsK+Cq+JqBCFtFo2jF0JLpynLM8rSkEkr+1g0juJ2pZmKzdDgp8VIO+F9QWTj6OytoQGBf4Kq2bAoTrbZ4FvEsFkYuw3844S+/u1VBhiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=URHCDqe0+fo4MdR6Mjgzir9PA4FV/8JSqZZcOc6uFHE=;
 b=qcvO3Mg8GBSnLuMSos32/LuttgnJjFiazNWCfIIHCDYPDW1237R/tFE9ugYL4K5B0Y/rn/8oi+DRL5x/Px+kE4CYm4zBwJyte316ETPAbpFt0EEiWGqWTGIWgEMaZ5LELWJrpJZtb3c8FGA+Fs2bqZQOGNBZ89trkrmy16O1/QU=
Received: from CY4PR11MB2022.namprd11.prod.outlook.com (2603:10b6:903:2d::19)
 by CY4PR11MB1576.namprd11.prod.outlook.com (2603:10b6:910:d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Thu, 3 Sep
 2020 10:24:51 +0000
Received: from CY4PR11MB2022.namprd11.prod.outlook.com
 ([fe80::11ac:a3df:27d4:1230]) by CY4PR11MB2022.namprd11.prod.outlook.com
 ([fe80::11ac:a3df:27d4:1230%3]) with mapi id 15.20.3348.015; Thu, 3 Sep 2020
 10:24:51 +0000
From: "Lv, Zhiyuan" <zhiyuan.lv@intel.com>
To: Roman Shaposhnik <roman@zededa.com>
CC: Jason Long <hack3rcon@yahoo.com>, Mario Marietto <marietto2008@gmail.com>, 
 "igvt-g@lists.01.org" <igvt-g@lists.01.org>,
 "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, "xen-devel@lists.xen.org"
 <xen-devel@lists.xen.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "Li, Susie" <susie.li@intel.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Li, Weinan Z" <weinan.z.li@intel.com>,
 "Downs, Mike" <mike.downs@intel.com>, "Xu, Terrence" <terrence.xu@intel.com>
Subject: Re: Various problems for the Xen for XenGT code and guide.
Thread-Topic: Various problems for the Xen for XenGT code and guide.
Thread-Index: AQHWfHlvQQNx0EabX0SrOv89XbYUY6lUBxOAgAAEfACAAdBPAP//8SCAgAF5E4A=
Date: Thu, 3 Sep 2020 10:24:50 +0000
Message-ID: <7D5BA6A5-3A34-4AF8-9A8C-2010DBB72124@intel.com>
References: <CA+1FSihpq_i-poiihdF0srE3fGXnncGtCMYqAGmNZu7fjNcY=w@mail.gmail.com>
 <CY4PR11MB15594EC5255084B8AE509068F02E0@CY4PR11MB1559.namprd11.prod.outlook.com>
 <1093525083.1169948.1598979998646@mail.yahoo.com>
 <559F4617-9633-4B40-BA55-E79305E20530@intel.com>
 <CAMmSBy8vor1GBqNUSRjj=gNRBwDjzRWFcxuAU0EYkRDgwQ4K+g@mail.gmail.com>
In-Reply-To: <CAMmSBy8vor1GBqNUSRjj=gNRBwDjzRWFcxuAU0EYkRDgwQ4K+g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.39.20071300
authentication-results: zededa.com; dkim=none (message not signed)
 header.d=none;zededa.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [111.198.237.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0997df5c-eea3-41e9-81bd-08d84ff3978e
x-ms-traffictypediagnostic: CY4PR11MB1576:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR11MB1576681B26B2315E2E0EF1E9832C0@CY4PR11MB1576.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uoo6lNnkTrRomy0bePG7slhSo7GrZq+SRuoAQ0rGwjgXgbwfzZJ9wX7wek1Lo8cQrxgpzRI8PjCj3xP3inUZ/B9BfYZHtmctGmlWDiB10S2S8/a169IflV4mLLHzPRImwueZMXV3fL2xYo28wUWA0Je+4DGtYmUrXM2s7MdUqowcFZqdcT38zNHcoyeowIqqBdwL2vrfVZkQlO8lPmPkAvaWL5buxL12SotgKQHgXL8OgU5dgzVPB8ZXLGIIdy9D4/46J2qO+GcmtXg2x0mL8emgPLSl13EW9aFrBFA5hSjj8A5pkk0sJoD54Di0ntMKWGCnNy9z1pZnH7bkRySLwSlYP4/H5kBeG9GOpN3Ebb/8r77EEmO0FaQG8nIu1iCU
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR11MB2022.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(376002)(346002)(366004)(136003)(6512007)(71200400001)(316002)(26005)(91956017)(64756008)(2616005)(66946007)(76116006)(66556008)(66446008)(186003)(2906002)(66476007)(5660300002)(6486002)(6506007)(54906003)(8676002)(4326008)(83380400001)(8936002)(36756003)(33656002)(86362001)(107886003)(53546011)(478600001)(6916009)(13296005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: WzsI9BJkxlsSWAwvMJh2SiJu49TT6gbioFzT+h3IHz6Jq+e+D2fG8tlfLAOwe2rPV9BlgmJQVPrRVHd5yMF0NAbAheQdHXHjHRkFOi6M32FikZeE4oW0ehg5fcRSuhTwb3HeaS6zjbQL9sxTRjq2EUI67tOnfn27JAHxMudhiLl8WVUDqnquBmsFLVjeVjB5PWIIix0/atVDZAXgpDQUI1L+BnJUVYzMrGblnxujOktQ1xtA2UqtS4tA02hsuPloRPLTHEtuDHQnqcqWBoTNY9JyS3RpaFCBTSJkq2eBN8SU7Hg8a9TS1twhBYyecXu/hJ3L5L9dh7S8B40vVVOg/51npxT81F7nyiKOHlaPoimVvfeShiZtcCam6IdI0tuoLtid/UzM3Ct75LSYzBAeoQUAGLiqrYgLbE0q9BfJ4ym50jH6aaJotKWN3ZhzN1gNNUPggax/iPPkKAATarAbQgRzCm60T3rZJI63dCDc/Vpu7JY48S+d/NsSGqRKpavnOzVwUViwmllu613CEqWQiDRu9LzN9olF9ciTH0ttV08pXArtwCOU5KJ0HW6f1hz6FTs2Nv+30OJ9Z8G8RuQ9k+rQWCkKpRq7OvIEZSsGex0n82+C1MMmWE0kQWLTJ6WXNKS1Fntmg6m8OigkdgfJ6w==
Content-Type: text/plain; charset="utf-8"
Content-ID: <7CB481035A3D314E92C88D5645950F8F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB2022.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0997df5c-eea3-41e9-81bd-08d84ff3978e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2020 10:24:50.8622 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lpKQOHxd1hufkinw5W8w8XF3Q6pvM6VdGPW+/rXArs5ltnwWXMf46esu57ATt2eqcGqxdIUcaT0m0wZQh5e3+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1576
X-OriginatorOrg: intel.com
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUm9tYW4sDQoNClNvcnJ5IHRoYXQgSSBhbSBhIHNvZnR3YXJlIGd1eSBhbmQgY2FuIG9ubHkg
c3BlYWsgZm9yIHNvZnR3YXJlLiBJbiBnZW5lcmFsIHRoZXJlIGFyZSB2YXJpb3VzIGFwcHJvYWNo
ZXMgdG8gc3VwcG9ydCBncmFwaGljcyB2aXJ0dWFsaXphdGlvbi4gR1ZULWcgYXMgYSBwdXJlIHNv
ZnR3YXJlIGFwcHJvYWNoLCBkb2VzIG5vdCByZWx5IG9uIGFueSBoYXJkd2FyZSBJL08gdmlydHVh
bGl6YXRpb24gZmVhdHVyZXMsIG1lYW53aGlsZSwgaHlwZXJ2aXNvcnMgbmVlZCBzcGVjaWZpYyBp
bXBsZW1lbnRhdGlvbnMuIElmIHRoZSBoYXJkd2FyZSBzdXBwb3J0cyBzdGFuZGFyZCB2aXJ0dWFs
IGRldmljZXMsIGJvdGggWGVuIGFuZCBLVk0gY2FuIHVzZSB0aGVtIG1vcmUgZWFzaWx5LiBUaGFu
a3MhDQoNClJlZ2FyZHMsDQotWmhpeXVhbg0KDQrvu78tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KRnJvbTogUm9tYW4gU2hhcG9zaG5payA8cm9tYW5AemVkZWRhLmNvbT4NCkRhdGU6IFRodXJz
ZGF5LCBTZXB0ZW1iZXIgMywgMjAyMCBhdCAzOjU2IEFNDQpUbzogWmhpeXVhbiBMdiA8emhpeXVh
bi5sdkBpbnRlbC5jb20+DQpDYzogSmFzb24gTG9uZyA8aGFjazNyY29uQHlhaG9vLmNvbT4sIE1h
cmlvIE1hcmlldHRvIDxtYXJpZXR0bzIwMDhAZ21haWwuY29tPiwgImlndnQtZ0BsaXN0cy4wMS5v
cmciIDxpZ3Z0LWdAbGlzdHMuMDEub3JnPiwgInhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZyIgPHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4sICJ4ZW4tZGV2ZWxAbGlzdHMueGVu
Lm9yZyIgPHhlbi1kZXZlbEBsaXN0cy54ZW4ub3JnPiwgImludGVsLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmciIDxpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiwgImxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmciIDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPiwgU3VzaWUg
TGkgPHN1c2llLmxpQGludGVsLmNvbT4sICJUaWFuLCBLZXZpbiIgPGtldmluLnRpYW5AaW50ZWwu
Y29tPiwgIkxpLCBXZWluYW4gWiIgPHdlaW5hbi56LmxpQGludGVsLmNvbT4sICJEb3ducywgTWlr
ZSIgPG1pa2UuZG93bnNAaW50ZWwuY29tPiwgIlh1LCBUZXJyZW5jZSIgPHRlcnJlbmNlLnh1QGlu
dGVsLmNvbT4NClN1YmplY3Q6IFJlOiBWYXJpb3VzIHByb2JsZW1zIGZvciB0aGUgWGVuIGZvciBY
ZW5HVCBjb2RlIGFuZCBndWlkZS4NCg0KT24gV2VkLCBTZXAgMiwgMjAyMCBhdCA1OjQ4IEFNIEx2
LCBaaGl5dWFuIDx6aGl5dWFuLmx2QGludGVsLmNvbT4gd3JvdGU6DQo+DQo+IEhpLA0KPg0KPiBJ
dCBpcyBtYWlubHkgZHVlIHRvIHRoZSBidXNpbmVzcyBwcmlvcml0eSBjaGFuZ2UuIFhlbkdUIHBy
b2plY3Qgd2FzIG9yaWdpbmFsbHkgY3JlYXRlZCBmb3IgZGF0YSBjZW50ZXIgdXNhZ2VzIHdpdGgg
WEVPTiBFMyBzZXJ2ZXJzIHdoaWNoIGhhdmUgaW50ZWdyYXRlZCBwcm9jZXNzb3IgZ3JhcGhpY3Mu
IEFmdGVyIFNreUxha2UgRTMsIHRoZXJlIGFyZSBubyBuZXcgc2VydmVycyBjYXBhYmxlIG9mIHJ1
bm5pbmcgR1ZULWcsIGFuZCBJbnRlbCBmdXR1cmUgZ3JhcGhpY3MgZm9yIGRhdGEgY2VudGVyIHdp
bGwgaGF2ZSBkaWZmZXJlbnQgYXBwcm9hY2hlcyBmb3IgR1BVIHNoYXJpbmcuIEFub3RoZXIgcmVh
c29uIGlzIHRoZSBYZW5HVCB1cHN0cmVhbSBkaWZmaWN1bHR5LiBEaWZmZXJlbnQgZnJvbSBLVk1H
VCB3aGljaCBoYXMgYmVlbiBmdWxseSBtZXJnZWQgdG8gdXBzdHJlYW0sIFhlbiBwYXJ0IG9mIEdW
VC1nIHN0aWxsIGhhcyB0ZWNobmljYWwgb3BlbnMgdGhhdCBhcmUgaGFyZCB0byBjbG9zZSBxdWlj
a2x5Lg0KDQpUaGlzIGlzIGV4dHJlbWVseSB1c2VmdWwgLS0gdGhhbmtzIGZvciBzaGFyaW5nLiBB
bnkgY2hhbmNlIHlvdSBjYW4NCmVsYWJvcmF0ZSBvbiB0aGUgbGF0ZXIgcGFydCAiYW5kIEludGVs
IGZ1dHVyZSBncmFwaGljcyBmb3IgZGF0YSBjZW50ZXINCndpbGwgaGF2ZSBkaWZmZXJlbnQgYXBw
cm9hY2hlcyBmb3IgR1BVIHNoYXJpbmciPw0KDQpJT1csIGlzIHRoZXJlIGFueXRoaW5nIHRoYXQg
SW50ZWwgaXMgY29va2luZyB1cCB0aGF0IG1heSBoZWxwIFhlbiBpbg0KdGhhdCBkZXBhcnRtZW50
Pw0KDQpUaGFua3MsDQpSb21hbi4NCg0K

