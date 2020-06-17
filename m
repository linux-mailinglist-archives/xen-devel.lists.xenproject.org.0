Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D001FD9A2
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 01:31:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlhVP-0006Sc-BF; Wed, 17 Jun 2020 23:30:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4LTj=76=intel.com=luwei.kang@srs-us1.protection.inumbo.net>)
 id 1jlhVO-0006Ox-4c
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 23:30:06 +0000
X-Inumbo-ID: 7841eb98-b0f2-11ea-b7bb-bc764e2007e4
Received: from mga14.intel.com (unknown [192.55.52.115])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7841eb98-b0f2-11ea-b7bb-bc764e2007e4;
 Wed, 17 Jun 2020 23:30:04 +0000 (UTC)
IronPort-SDR: dZpLAHVXOx0EZRmVKRVjvDs2ykDPabbixeE9dfu+qxAdOiF+kw7lJ0drKvraZtoogRtsEDxQOx
 2ctg6ljBaZbA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2020 16:30:02 -0700
IronPort-SDR: PptEuZ2UZYUbLPDgRhGTrwxs1DP58y5WCUXbKXdAf3NwgBGW2qeb2DufAz4HCrBXKu9CZclvFj
 aYZWb70rOh8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,523,1583222400"; d="scan'208";a="277437060"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga006.jf.intel.com with ESMTP; 17 Jun 2020 16:30:01 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 17 Jun 2020 16:30:01 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 17 Jun 2020 16:30:00 -0700
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 17 Jun 2020 16:30:00 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Wed, 17 Jun 2020 16:30:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OMSgwHCa9oE0NDJw20SbewPdTDj6DF+qhq+f94h5Cd003S68zKyAqE2Z/zTuIuqgAbFICxAzP8stGvOEZAKFjV/oZQEQs0raDO+U/vTPgpjPB2KWk9VUB47DMf103cKNWO4MNGwaKuWqYt1UAuzp+Oy13wjqAItNF9F0PzEUm8tsKOYfrG5+xKiFQFpJugHyKebadR809dmp05qYyQC6WG6gvT8xHS7jjGhN4kbYBVAAgL3OPQAGuxXA32WK2UunU4ZnYh6w0uMwetE62wYiETuzFh3qD9o0hLB+UVkf5aPvbA+J6VtfrEVyasp2NexUJ91eCkGH9P9tsusDv9ftQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08dvXD0VOFNYFfzaJYFsjbsUJIMlXCK9Yu42D5i9cfs=;
 b=QmR50JfAGmsbB/o0LRjNOVc5lhp9hcvl7kaG+IX1uMxlnc0wgueOzj/Xh3U5jsJ4MAPeUGRaxAZGgddjQHhyyzRiqW2ZrkjhfWyj9Ed7bHX0+08v6kxXRCsutur+nrl0BB/wDDkdnWhjbUOvVBpRA02Bx1cAFUNJQVLlaSF7xlw1tnM/WMzxpekv8Kz1i0wZ6QMj0q2HxZpfVcNlxNYUmgUsOaCmLzxWX9QLQWnT46ZELTBgO986nMVCIPNiLJzzvRyMq/jFM/ZfF1AVG+4Pv3uSKMqnuMUGhQfJGNGrn90nzmhCrHWsb819lRr67DM36fBExzuFTBSAq/NROC8kxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08dvXD0VOFNYFfzaJYFsjbsUJIMlXCK9Yu42D5i9cfs=;
 b=Qz2XnRhqkr6eokoHlszIMM6AdYgLkCS2I/L795rKrIt5sl4IWLIY3D/WX69G6C4CrfitEtWlztFUkNULNqS5BKcFjt8sa9d0dFHGXdUCNmj4zhWIeFZjlDD9Axs5kJlvt6sI9Xy7mbKljYL0j3WT0C8Djk5LF9FCLr5yoDT7zm0=
Received: from DM5PR1101MB2266.namprd11.prod.outlook.com (2603:10b6:4:57::17)
 by DM5PR11MB1306.namprd11.prod.outlook.com (2603:10b6:3:b::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18; Wed, 17 Jun 2020 23:29:58 +0000
Received: from DM5PR1101MB2266.namprd11.prod.outlook.com
 ([fe80::b07e:e40:d34e:b601]) by DM5PR1101MB2266.namprd11.prod.outlook.com
 ([fe80::b07e:e40:d34e:b601%6]) with mapi id 15.20.3109.021; Wed, 17 Jun 2020
 23:29:58 +0000
From: "Kang, Luwei" <luwei.kang@intel.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: RE: [PATCH v1 0/7] Implement support for external IPT monitoring
Thread-Topic: [PATCH v1 0/7] Implement support for external IPT monitoring
Thread-Index: KAn5ItxMsuAqHW3ZzkheyNf1oni9hpiVzvKAgAAIowCAAHHNAIAAVp/wgAArhICAADbMIIAABJuAgACxxQA=
Date: Wed, 17 Jun 2020 23:29:58 +0000
Message-ID: <DM5PR1101MB22662FC744E519062C941A40809A0@DM5PR1101MB2266.namprd11.prod.outlook.com>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
 <cb530abc-bef6-23b9-86d8-f43167e14736@citrix.com>
 <1555629278.8787770.1592333278517.JavaMail.zimbra@cert.pl>
 <MWHPR11MB1645D9EFF209C6733C4DC5018C9A0@MWHPR11MB1645.namprd11.prod.outlook.com>
 <DM5PR1101MB22669C0DD0A5AA455681A08D809A0@DM5PR1101MB2266.namprd11.prod.outlook.com>
 <20200617092103.GZ735@Air-de-Roger>
 <DM5PR1101MB22669E5CB0C4384B1005A58E809A0@DM5PR1101MB2266.namprd11.prod.outlook.com>
 <20200617125339.GB735@Air-de-Roger>
In-Reply-To: <20200617125339.GB735@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.214]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bb39dce2-91d2-4690-c61c-08d813165992
x-ms-traffictypediagnostic: DM5PR11MB1306:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB13064998A2258CF58560F2B4809A0@DM5PR11MB1306.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 04371797A5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jbhrCrHwlunoXXoMBORg60y+8vWQV508kszKRlLb7dXnYaOm7Dox2pk6j+zup5955M5MbHrAo16OMx6nuves9dAHSuFzaeFpPTWQF5+KARU032QxNjnG9YMvGmVgJd4y61EVylmTjXHJMDs/IcvjnMRPn4f5s6P1atOWNZ3moITGtTAqbAkbhnPqnCfwsR+gW4pD2JIsBsQbTlbQbh8/eA0404By4+STbWBKYy1UwPSDA9QYZHveON56TMWXqQ7XY1vYt1sv/UPTf9qX+e1M3yPGPYRMyA4/7dn6P8FZp1eVGmON3vo+eFWSlxRlAPij2x5TXrfyIb8s7S+xqRIMYQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR1101MB2266.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(396003)(376002)(136003)(346002)(39860400002)(2906002)(4744005)(7416002)(316002)(55016002)(478600001)(71200400001)(54906003)(9686003)(26005)(33656002)(8936002)(86362001)(66946007)(66556008)(66446008)(66476007)(5660300002)(76116006)(7696005)(6916009)(4326008)(6506007)(186003)(8676002)(52536014)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: RZFbX1ouATHnlvwV5LGc2eG2aPLAm+eZDHNfadHBiUlLPwasr0SgmuQqfweIiPIiqJOkkVErdLuQolprw+WcqFC0PuWrSf9+YzhY8ZGwwmvbjbfhXi7HVrmCGSBxhbmqO/VIgTYSvfYqs0Mt5lopf7zPSf4ZcsEayeLQbUzppXUx6uE0Zbh/omB9ysWpk9w6OYXKOt+9Q2HpSKrHW02rEaFi9zEzieRJA29/jPeU4ldSkbrWU9km16665+CcwjS6r4IiF6mjhuFdt2enh55kZVOmRTnPfti1ldPj+DaMJFub+X/Ygw18y2bWooIUlYpqVPG7gPgjD3jVAfZ7iPVK0GHxzDX5vyxNEKQPbc+bEJMej/iWXSABSI44oEC8ACqu4F0CmxIc8JmfrEsnB6HvY1BRgNW+85ACfYe0sfPXe7Ysn6G/GERln8Pgjn6FQAolmHyeJtZVZWL5LVOqmzsL0yTqlX5R48hiqeY0QG+x3xrfWE+0iqHEQHATfmBtIRNF
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: bb39dce2-91d2-4690-c61c-08d813165992
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2020 23:29:58.4435 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fR4MJsxjZWhYnWDFVTYB4UIm+95YahqpVT3fBXosifuEi0J5QEQluRjxTkVbeH8tBKZEeSrJh5jvFqWdTihHlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1306
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, "Nakajima, Jun" <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?utf-8?B?TWljaGHFgiBMZXN6Y3p5xYRza2k=?= <michal.leszczynski@cert.pl>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiA+ID4gSG93IGRvZXMgS1ZNIGRlYWwgd2l0aCB0aGlzLCBkbyB0aGV5IGluc2VydC9tb2RpZnkg
dHJhY2UgcGFja2V0cyBvbg0KPiA+ID4gdHJhcHBlZCBhbmQgZW11bGF0ZWQgaW5zdHJ1Y3Rpb25z
IGJ5IHRoZSBWTU0/DQo+ID4NCj4gPiBUaGUgS1ZNIGluY2x1ZGVzIGluc3RydWN0aW9uIGRlY29k
ZXIgYW5kDQo+IGVtdWxhdG9yKGFyY2gveDg2L2t2bS9lbXVsYXRlLmMpLCBhbmQgdGhlIGd1ZXN0
J3MgbWVtb3J5IGNhbiBiZSBzZXQgdG8NCj4gd3JpdGUtcHJvdGVjdCBhcyB3ZWxsLiBCdXQgaXQg
ZG9lc24ndCBzdXBwb3J0IEludGVsIFBUIHBhY2tldHMgc29mdHdhcmUgZW11bGF0b3IuDQo+IEZv
ciBLVk0sIHRoZSBJbnRlbCBQVCBmZWF0dXJlIHdpbGwgYmUgZXhwb3NlZCB0byBLVk0gZ3Vlc3Qg
YW5kIEtWTSBndWVzdCBjYW4NCj4gdXNlIEludGVsIFBUIGZlYXR1cmUgbGlrZSBuYXRpdmUuDQo+
IA0KPiBCdXQgaWYgc3VjaCBmZWF0dXJlIGlzIGV4cG9zZWQgdG8gdGhlIGd1ZXN0IGZvciBpdCdz
IG93biB1c2FnZSwgd29uJ3QgaXQgYmUNCj4gbWlzc2luZyBwYWNrZXRzIGZvciBpbnN0cnVjdGlv
bnMgZW11bGF0ZWQgYnkgdGhlIFZNTT8NCg0KSWYgc2V0dGluZyB0aGUgZ3Vlc3QncyBtZW1vcnkg
d3JpdGUtcHJvdGVjdCwgSSB0aGluayB5ZXMuIA0KDQpUaGFua3MsDQpMdXdlaSBLYW5nDQoNCj4g
DQo+IFRoYW5rcywgUm9nZXIuDQo=

