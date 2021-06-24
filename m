Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D1D3B26B7
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jun 2021 07:22:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146372.269312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwHoE-0007xU-P1; Thu, 24 Jun 2021 05:21:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146372.269312; Thu, 24 Jun 2021 05:21:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwHoE-0007uZ-LR; Thu, 24 Jun 2021 05:21:50 +0000
Received: by outflank-mailman (input) for mailman id 146372;
 Thu, 24 Jun 2021 05:21:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GXyq=LS=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1lwHoD-0007uT-01
 for xen-devel@lists.xenproject.org; Thu, 24 Jun 2021 05:21:49 +0000
Received: from mga17.intel.com (unknown [192.55.52.151])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ecebf2c6-368d-4d52-aa46-01c6a7d74d27;
 Thu, 24 Jun 2021 05:21:39 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 22:21:38 -0700
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP; 23 Jun 2021 22:21:37 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 23 Jun 2021 22:21:37 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Wed, 23 Jun 2021 22:21:37 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Wed, 23 Jun 2021 22:21:36 -0700
Received: from MWHPR11MB1886.namprd11.prod.outlook.com (2603:10b6:300:110::9)
 by MW3PR11MB4587.namprd11.prod.outlook.com (2603:10b6:303:58::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Thu, 24 Jun
 2021 05:21:35 +0000
Received: from MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::6597:eb05:c507:c6c1]) by MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::6597:eb05:c507:c6c1%12]) with mapi id 15.20.4242.024; Thu, 24 Jun
 2021 05:21:35 +0000
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
X-Inumbo-ID: ecebf2c6-368d-4d52-aa46-01c6a7d74d27
IronPort-SDR: LW/18ocA/2h3R7u4bmGM/2XmFg5mGnB/YEsdSqSzWzvkD9uVoBa9jZ0lK7bAgJXmL+7DID2Gl9
 1tqNOZ1mfNyw==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="187779439"
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; 
   d="scan'208";a="187779439"
IronPort-SDR: DZXSJp2fAT48Lkgbu34YQLT5KF0jIMoJAz5Ldq6GuihmAw0mAc1n3WwpjIgxqhsBi8iBRQLz+z
 rlQmrWanO+Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; 
   d="scan'208";a="487615548"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EtGfe/As8u86Q1Kdy+8sXc8VbC+tTwCHICJKQGhNyF/wQYbtysbPlML6Tm/JmGzYo1DcWInkBpnJ/dlcRGwO/EwAkdQJMU5oe7shV8HeOWEgKdGJnMSTqp5fzUdlWXlGqykH3ZJkD/2EOaCykl1LFWEsXC5QeKeW6PvVB44k2YWAiXPi36Pcgp6kVTahernKWkqTQBuK57InTsw53C+Tj/fqv2Sdh+TmTEoFXtC1MY/9O/qV8rOVXIMsuvZGYrIjqAgpGhfcL9DF5pYI6Y1hf6m9MUN/l/4bD9D5RuIv+bUDlcxsE9kbktiYys2fKBT1MZqzkvhrqqr0liUkQwJ5kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q1rfPsGVelLmuPseQ6Loy6Bbgl2pHxI2BNOR3CKWw1c=;
 b=LRMVrg8Xp6DwCvgXE4DMFm7MO7qzLFyU0bwSP6xOMEf5KI7AaQ888/4EiST+45lv0KVSyTgZ52SbibzTsmMEQFZrYYi/DlObuIRnURQEY02+2KA1AX3PSSJFemaPp4Gq5m4OSOvPWxmOyHZMCxIgrWcd0sFlzmeRwjB4RmtHyTucwQ00IW4xrQwXyCu2g0jlkVD53Ze+5kmY0Yy864hdk7vq2yQdXm2MCMAZJ7zwK/Tp1bJmkBTKVqWK/9PoZmJIFNqJ4WXAKrHIybYBQDl54doOeBeYIRqIr078omA0wEOs98oGgX07oECON7VjkcyWekJ5nH92crGkMY57H6PKAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q1rfPsGVelLmuPseQ6Loy6Bbgl2pHxI2BNOR3CKWw1c=;
 b=kb7tSI/FgxrcRHS8cXfUJ4/GPSGX1UBozkAmC1DJsg97Sn6bZqMatvwBRgAJDfoWiCWI0Vq6kHVw1TCTI/lFX8TtsMkAPI5L8tPzJIyV4ARGlLJ5kS2hlqLPmG1t3s0TOZnlfyTlEJFswaPjMXOedKC0yWlbAn1UpQ1SIj3Vcjc=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>, "Cooper, Andrew" <andrew.cooper3@citrix.com>
Subject: RE: [PATCH 4/9] VT-d: adjust domid map updating when unmapping
 context
Thread-Topic: [PATCH 4/9] VT-d: adjust domid map updating when unmapping
 context
Thread-Index: AQHXXRHFNRbepFBfWEWHFxIPdQtGWKsit1XA
Date: Thu, 24 Jun 2021 05:21:35 +0000
Message-ID: <MWHPR11MB18863FB7CE96AB9EEA94DC778C079@MWHPR11MB1886.namprd11.prod.outlook.com>
References: <03285055-47ff-ab10-ae76-0553f28f136d@suse.com>
 <be453d69-dfa8-1f75-b30f-918229c73d02@suse.com>
In-Reply-To: <be453d69-dfa8-1f75-b30f-918229c73d02@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.142.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 02c7756f-70b8-4b13-c425-08d936cfef5c
x-ms-traffictypediagnostic: MW3PR11MB4587:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <MW3PR11MB458741EA89A4A947F11B9E108C079@MW3PR11MB4587.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: az/gCWPG4HOGk9GpWG8PhsE5VcSjX7EaRGForMOr1GzJJf70bpysGrzy6qYit+CRvVx1+n9Q4L1KNCzr0L7WCNt14eAMYgCHR3JGgfswAvhesaOCFxXjz5SK8E3n7I2lF/St3W6Jg6phzlZrfLiXCGBDXPegtHFurYMQkdsrHGX4gDuExKJDt6qpkQ/MbhzsyNQxzpeRGO6D1NIiLtuoSW5Ruwfgy8YsR80JEmNZAyixBDl6v0wzE6kahhpuHXRgPQXx3NXK66jxjO0Sxkm8YsTdEv2/YfChym/CqgfKhQemd+7B2rf+6sA/hs9iX4dn3Hg/ZWMs7C85NiNq6iXbbibkOkE6Fd0YJ0hdLi35tap5K6z5W6/UDoBkQx7rJlDhqNj6V2ccBe87AoKsFbGhzhcDecpxmRx6EoLg5BfLOXWl6abl8GgIJy16JzQgCPWay0sJM3+7/ExfNZ6xkfBO1LuII0cWBpPrVmH4/CDBe2KmBgGtYz7/lreCIe3DPS1JrLs9AD5LlcuP9j8QzjspziFiov5uZSfcIb8OhkdSRMw8rERWFd17fpnQ+G1Zq87QPC7mFA3XshfxwbP8FZznxl+BRtsYwyuQ6UXOFy/pjoY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1886.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(366004)(136003)(346002)(39860400002)(38100700002)(64756008)(122000001)(66446008)(186003)(7696005)(26005)(478600001)(66476007)(6506007)(71200400001)(66946007)(8676002)(66556008)(55016002)(83380400001)(76116006)(2906002)(110136005)(316002)(86362001)(33656002)(9686003)(4326008)(8936002)(52536014)(54906003)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZVFMelV0aUVVUXVhb2dDTW9PR2FJY1pSbFVLM05abW1CbXo5L2E5TTNpK2cz?=
 =?utf-8?B?bTRSNks4UWgyQ3ZUaWcrM1ZXZ3doNzRGRlVIK2xkWWlKcExZM1dYOEJuUjhw?=
 =?utf-8?B?R0F1cUVOK2J6LzQvaGVsc1o2M1JiNmxhcElTOUExeVQ2WWJSRmtqb0cyL3lY?=
 =?utf-8?B?NkZSRnU1d3YwN1hqWnFLVG15azB6N1RUWUFEeklMQXJyWWRVOG5uNkNPd1ZV?=
 =?utf-8?B?RXYvUGRqekk4MjZsZUp2NkxNZ0h6OGJEQnVQTVpmbDNlVG52TEwyckg0L1Qy?=
 =?utf-8?B?bSt2OTkyUDJ0OGNWVEdmRU50am01Skc5bGFudGh6S01IdVpQVUp0WXlzR290?=
 =?utf-8?B?V1V3cUNTQlNPcEJLZW43c3hINnV3aTBmd3BIN2MwWEdGUWVGS0o2VjNRQ3Ew?=
 =?utf-8?B?Q2RrRUYxTGhyWjNuOFFkL2FZYzFubU9yZWFnVGh2SUt4NUM0cm91M3ZMVEUy?=
 =?utf-8?B?SlNvSGE4eEFSL2htd0c4V2pOTCs1VXR4QzFYdjdMeGxmbWdiTFFaNnk5WTEv?=
 =?utf-8?B?NjNOa3ZZNG4ybHFjZTBTK20xZEhMY2I2cGZNcFp3U0k2WkVhaXJIMXdRZktR?=
 =?utf-8?B?SzFOVHJ5MjA3OWZaVCt3QjM0N0tGUS9nVWNtSk1FemlxdHFUajY1RXYyTzdr?=
 =?utf-8?B?OVJKTUpVbFdOZ09kbzlFRStPRHVzWEFocGZpS2xBU2ZQSFNSMlBkV2ZLbXdi?=
 =?utf-8?B?ZTQzcXBNRGdON1RBblZFQVRBMDNnckZDNTRXK1BmUTZVdmlUckdYZ3d0NEF4?=
 =?utf-8?B?SVRyU0x6UFJOQXZrUGU3eHVEckFWZVZWZzRTVmhkYjRTN05QalpsenRYRFVM?=
 =?utf-8?B?WkJPMUhrc3hON1NOVkhlbUxOQktxS0ZCb2tqOGtKR1dFcys4N3pNdkJHRUp4?=
 =?utf-8?B?aXNxenhuSXBSM0p3YlBmMWVsNlJvVmFoVzFiY05HOTVuc1ByQWNIMWVQTHp4?=
 =?utf-8?B?Qk85ZmdMRFpFZlIvbUhoSEhmTXVrTmlEYlRCU1Ava3B1QnR6c1VxM1RQUmFB?=
 =?utf-8?B?cFdhaDNwY1dMdW56UXpxMk53ZEIvOFJDaThEMDZaOFhBUWZxTTN4QmNFUUpv?=
 =?utf-8?B?YUtHUFBadTZLTmpROVQzbURaeXVvd1VLT3JCNmFGU0tEbUhzb0J0SFFsMWlj?=
 =?utf-8?B?UFY0eUx1OGZ6Skx6MzYxbC90M3FTdXR1VUlxaDNZUmNhcWttUXhmR0cvcm5H?=
 =?utf-8?B?TzZhOGtLNVYvR3hlQWVvNm40K0h2Rzg5T1M5NEtJeExkZGpyNVQ5QjZXWnU4?=
 =?utf-8?B?anlzV1F1cElSTDdqUkQ0dVhPSmtESy94UTZsWC9vbnNMckpvdmVyUk9zNWxZ?=
 =?utf-8?B?SmdvV2NRT2U3TGU5Q1RtU0dtUlF2NDJtMG5KdlBzMWJEMUlXSnhPTk9Nc2py?=
 =?utf-8?B?d2RjOTh1MitZQ1UvSUh3WlNic2YvNmUzR283UDBCeXpxMHUzVzhSeTVFcm9L?=
 =?utf-8?B?UVhuYU9sZmx5QkF5bm1KT2ZLQnlsYmFmZ21PaHVKczM3aU1qWWhqckh2WmxQ?=
 =?utf-8?B?OURjREpBczFVZWxOV29XTGZGVmg3RUc0QUtwUUJXTzFZUkt6aTc3MVlCajNw?=
 =?utf-8?B?K0ZnNjZkOFpaSmhwUXdEVHI3b1U3VHQxR0hLTzN2THBJazBzNVFhQXY2NUx2?=
 =?utf-8?B?UEkyK2FUWWhnMWpDcS9LaDJyOUtObnc1dG0xR1ZsbFZjRUpEQXdqSFp1TTF3?=
 =?utf-8?B?c2tJdTM4Q29LOEx0TnhpRnNPMzVjcTdlRmN6NlRiMXlCQVh6QmwzbThqMVZy?=
 =?utf-8?Q?P6lPBzM5sF4VmqWGQtH/n2igamY58aew9Um7RHL?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1886.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02c7756f-70b8-4b13-c425-08d936cfef5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2021 05:21:35.0740
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: doYnIg1DULp8IbLcR9PVXsgQ1sYlG1pdM8Bw85cJFnDlbQzCp4K+GKHwGcAFvv1+RvKaZViFVZ80IPpiTCEzSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4587
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFdlZG5lc2Rh
eSwgSnVuZSA5LCAyMDIxIDU6MjggUE0NCj4gDQo+IFdoZW4gYW4gZWFybGllciBlcnJvciBvY2N1
cnJlZCwgY2xlYW5pbmcgdXAgdGhlIGRvbWlkIG1hcHBpbmcgZGF0YSBpcw0KPiB3cm9uZywgYXMg
cmVmZXJlbmNlcyBsaWtlbHkgc3RpbGwgZXhpc3QuIFRoZSBvbmx5IGV4Y2VwdGlvbiB0byB0aGlz
IGlzDQo+IHdoZW4gdGhlIGFjdHVhbCB1bm1hcHBpbmcgd29ya2VkLCBidXQgc29tZSBmbHVzaCBm
YWlsZWQgKHN1cHBvc2VkbHkNCj4gaW1wb3NzaWJsZSBhZnRlciBYU0EtMzczKS4gVGhlIGd1ZXN0
IHdpbGwgZ2V0IGNyYXNoZWQgaW4gc3VjaCBhIGNhc2UNCj4gdGhvdWdoLCBzbyBhZGQgZmFsbGJh
Y2sgY2xlYW51cCB0byBkb21haW4gZGVzdHJ1Y3Rpb24gdG8gY292ZXIgdGhpcw0KPiBjYXNlLiBU
aGlzIGluIHR1cm4gbWFrZXMgaXQgZGVzaXJhYmxlIHRvIHNpbGVuY2UgdGhlIGRwcmludGsoKSBp
bg0KPiBkb21haW5faW9tbXVfZG9taWQoKS4NCj4gDQo+IE5vdGUgdGhhdCBubyBlcnJvciB3aWxs
IGJlIHJldHVybmVkIGFueW1vcmUgd2hlbiB0aGUgbG9va3VwIGZhaWxzIC0gaW4NCj4gdGhlIGNv
bW1vbiBjYXNlIGxvb2t1cCBmYWlsdXJlIHdvdWxkIGFscmVhZHkgaGF2ZSBjYXVzZWQNCj4gZG9t
YWluX2NvbnRleHRfdW5tYXBfb25lKCkgdG8gZmFpbCwgeWV0IGV2ZW4gZnJvbSBhIG1vcmUgZ2Vu
ZXJhbA0KPiBwZXJzcGVjdGl2ZSBpdCBkb2Vzbid0IGxvb2sgcmlnaHQgdG8gZmFpbCBkb21haW5f
Y29udGV4dF91bm1hcCgpIGluIHN1Y2gNCj4gYSBjYXNlIHdoZW4gdGhpcyB3YXMgdGhlIGxhc3Qg
ZGV2aWNlLCBidXQgbm90IHdoZW4gYW55IGVhcmxpZXIgdW5tYXAgd2FzDQo+IG90aGVyd2lzZSBz
dWNjZXNzZnVsLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPg0KDQpSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+
DQoNCj4gDQo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jDQo+ICsr
KyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jDQo+IEBAIC04MCw5ICs4MCwx
MSBAQCBzdGF0aWMgaW50IGRvbWFpbl9pb21tdV9kb21pZChzdHJ1Y3QgZG9tDQo+ICAgICAgICAg
IGkgPSBmaW5kX25leHRfYml0KGlvbW11LT5kb21pZF9iaXRtYXAsIG5yX2RvbSwgaSsxKTsNCj4g
ICAgICB9DQo+IA0KPiAtICAgIGRwcmludGsoWEVOTE9HX0VSUiBWVERQUkVGSVgsDQo+IC0gICAg
ICAgICAgICAiQ2Fubm90IGdldCB2YWxpZCBpb21tdSBkb21pZDogZG9taWQ9JWQgaW9tbXUtPmlu
ZGV4PSVkXG4iLA0KPiAtICAgICAgICAgICAgZC0+ZG9tYWluX2lkLCBpb21tdS0+aW5kZXgpOw0K
PiArICAgIGlmICggIWQtPmlzX2R5aW5nICkNCj4gKyAgICAgICAgZHByaW50ayhYRU5MT0dfRVJS
IFZURFBSRUZJWCwNCj4gKyAgICAgICAgICAgICAgICAiQ2Fubm90IGdldCB2YWxpZCBpb21tdSAl
dSBkb21pZDogJXBkXG4iLA0KPiArICAgICAgICAgICAgICAgIGlvbW11LT5pbmRleCwgZCk7DQo+
ICsNCj4gICAgICByZXR1cm4gLTE7DQo+ICB9DQo+IA0KPiBAQCAtMTQ3LDYgKzE0OSwxNyBAQCBz
dGF0aWMgaW50IGNvbnRleHRfZ2V0X2RvbWFpbl9pZChzdHJ1Y3QNCj4gICAgICByZXR1cm4gZG9t
aWQ7DQo+ICB9DQo+IA0KPiArc3RhdGljIHZvaWQgY2xlYW51cF9kb21pZF9tYXAoc3RydWN0IGRv
bWFpbiAqZG9tYWluLCBzdHJ1Y3QgdnRkX2lvbW11DQo+ICppb21tdSkNCj4gK3sNCj4gKyAgICBp
bnQgaW9tbXVfZG9taWQgPSBkb21haW5faW9tbXVfZG9taWQoZG9tYWluLCBpb21tdSk7DQo+ICsN
Cj4gKyAgICBpZiAoIGlvbW11X2RvbWlkID49IDAgKQ0KPiArICAgIHsNCj4gKyAgICAgICAgY2xl
YXJfYml0KGlvbW11X2RvbWlkLCBpb21tdS0+ZG9taWRfYml0bWFwKTsNCj4gKyAgICAgICAgaW9t
bXUtPmRvbWlkX21hcFtpb21tdV9kb21pZF0gPSAwOw0KPiArICAgIH0NCj4gK30NCj4gKw0KPiAg
c3RhdGljIHZvaWQgc3luY19jYWNoZShjb25zdCB2b2lkICphZGRyLCB1bnNpZ25lZCBpbnQgc2l6
ZSkNCj4gIHsNCj4gICAgICBzdGF0aWMgdW5zaWduZWQgbG9uZyBjbGZsdXNoX3NpemUgPSAwOw0K
PiBAQCAtMTcyNCw2ICsxNzM3LDkgQEAgc3RhdGljIGludCBkb21haW5fY29udGV4dF91bm1hcChz
dHJ1Y3QgZA0KPiAgICAgICAgICBnb3RvIG91dDsNCj4gICAgICB9DQo+IA0KPiArICAgIGlmICgg
cmV0ICkNCj4gKyAgICAgICAgZ290byBvdXQ7DQo+ICsNCj4gICAgICAvKg0KPiAgICAgICAqIGlm
IG5vIG90aGVyIGRldmljZXMgdW5kZXIgdGhlIHNhbWUgaW9tbXUgb3duZWQgYnkgdGhpcyBkb21h
aW4sDQo+ICAgICAgICogY2xlYXIgaW9tbXUgaW4gaW9tbXVfYml0bWFwIGFuZCBjbGVhciBkb21h
aW5faWQgaW4gZG9taWRfYml0bXANCj4gQEAgLTE3NDMsMTkgKzE3NTksOCBAQCBzdGF0aWMgaW50
IGRvbWFpbl9jb250ZXh0X3VubWFwKHN0cnVjdCBkDQo+IA0KPiAgICAgIGlmICggZm91bmQgPT0g
MCApDQo+ICAgICAgew0KPiAtICAgICAgICBpbnQgaW9tbXVfZG9taWQ7DQo+IC0NCj4gICAgICAg
ICAgY2xlYXJfYml0KGlvbW11LT5pbmRleCwgJmRvbV9pb21tdShkb21haW4pLQ0KPiA+YXJjaC52
dGQuaW9tbXVfYml0bWFwKTsNCj4gLQ0KPiAtICAgICAgICBpb21tdV9kb21pZCA9IGRvbWFpbl9p
b21tdV9kb21pZChkb21haW4sIGlvbW11KTsNCj4gLSAgICAgICAgaWYgKCBpb21tdV9kb21pZCA9
PSAtMSApDQo+IC0gICAgICAgIHsNCj4gLSAgICAgICAgICAgIHJldCA9IC1FSU5WQUw7DQo+IC0g
ICAgICAgICAgICBnb3RvIG91dDsNCj4gLSAgICAgICAgfQ0KPiAtDQo+IC0gICAgICAgIGNsZWFy
X2JpdChpb21tdV9kb21pZCwgaW9tbXUtPmRvbWlkX2JpdG1hcCk7DQo+IC0gICAgICAgIGlvbW11
LT5kb21pZF9tYXBbaW9tbXVfZG9taWRdID0gMDsNCj4gKyAgICAgICAgY2xlYW51cF9kb21pZF9t
YXAoZG9tYWluLCBpb21tdSk7DQo+ICAgICAgfQ0KPiANCj4gIG91dDoNCj4gQEAgLTE3NzUsNiAr
MTc4MCw3IEBAIHN0YXRpYyB2b2lkIGlvbW11X2RvbWFpbl90ZWFyZG93bihzdHJ1Y3QNCj4gIHsN
Cj4gICAgICBzdHJ1Y3QgZG9tYWluX2lvbW11ICpoZCA9IGRvbV9pb21tdShkKTsNCj4gICAgICBz
dHJ1Y3QgbWFwcGVkX3JtcnIgKm1ybXJyLCAqdG1wOw0KPiArICAgIGNvbnN0IHN0cnVjdCBhY3Bp
X2RyaGRfdW5pdCAqZHJoZDsNCj4gDQo+ICAgICAgaWYgKCBsaXN0X2VtcHR5KCZhY3BpX2RyaGRf
dW5pdHMpICkNCj4gICAgICAgICAgcmV0dXJuOw0KPiBAQCAtMTc4Niw2ICsxNzkyLDkgQEAgc3Rh
dGljIHZvaWQgaW9tbXVfZG9tYWluX3RlYXJkb3duKHN0cnVjdA0KPiAgICAgIH0NCj4gDQo+ICAg
ICAgQVNTRVJUKCFoZC0+YXJjaC52dGQucGdkX21hZGRyKTsNCj4gKw0KPiArICAgIGZvcl9lYWNo
X2RyaGRfdW5pdCAoIGRyaGQgKQ0KPiArICAgICAgICBjbGVhbnVwX2RvbWlkX21hcChkLCBkcmhk
LT5pb21tdSk7DQo+ICB9DQo+IA0KPiAgc3RhdGljIGludCBfX211c3RfY2hlY2sgaW50ZWxfaW9t
bXVfbWFwX3BhZ2Uoc3RydWN0IGRvbWFpbiAqZCwgZGZuX3QgZGZuLA0KDQo=

