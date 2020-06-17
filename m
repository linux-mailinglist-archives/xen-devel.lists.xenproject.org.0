Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3B31FC6F2
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 09:16:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlSHY-00049A-2G; Wed, 17 Jun 2020 07:14:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4LTj=76=intel.com=luwei.kang@srs-us1.protection.inumbo.net>)
 id 1jlRpK-0001bL-MS
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 06:45:38 +0000
X-Inumbo-ID: 257a288a-b066-11ea-8496-bc764e2007e4
Received: from mga14.intel.com (unknown [192.55.52.115])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 257a288a-b066-11ea-8496-bc764e2007e4;
 Wed, 17 Jun 2020 06:45:35 +0000 (UTC)
IronPort-SDR: U4AMsr18tpfi+Ukc5NhJtP2IAhkZwbf0E84JqvBA33ECky18DvkML0kVEuPNcTWK0FpPjtiMXf
 /eFCQyPBkygg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2020 23:45:34 -0700
IronPort-SDR: MfGb4CciptqFEzYJ6cKl9Pu6BW4DfdbCZUBFbP1tTDHrwynnrLIENndoqzvXyuDMluRBmIOun7
 VFM9qYGJOnZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,521,1583222400"; d="scan'208";a="317446265"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by FMSMGA003.fm.intel.com with ESMTP; 16 Jun 2020 23:45:33 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 16 Jun 2020 23:45:24 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 16 Jun 2020 23:45:24 -0700
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 16 Jun 2020 23:45:24 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Tue, 16 Jun 2020 23:45:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cxgqVa5IPV8oT8ZfbNYg7dPCfPPEVFytoWl/da1aGn6Jzx6fqJT/L+RWkOq8YFIa6Y0AlfIg4Gt79j9u7dkgo1FLD/JqNZl5IbCmyAHQL8FKAJGTWXf4q9ZuaL3KoZgBzYkrEguFZFWO9Hvnlx0U//xQJ7xI26N/C7uP3NLsEp2Tf8BynHBkHjjZ+kG0eHFsPqUvuwYeFcOEvRY+nDkTPntiCKkihQY3toPdv9S/8M3xUN4OOnaiA/m6vF6vKamxNJ6c+rh/K50CvMRuGBeHwhzIOIaQbOryVoC8Oy8hZ2f2bJx6lOaDCRBnKcYt2Z0EyBQydnM5gSUuVUiTJkn61g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dyX7aos7dqWWXqrhWttgADAOtJuahBAkLRf0OxULrlo=;
 b=W0eQXP2lnDLcSFJoNnWKC6ioBx2tpid2Q5O8T8K7tW3WXO11x5rUqaUvOwejXeIIefI4Qkd8cvvTzgiFoOHSLL4MI9Y8PSvUPvFN2F7/vzY9wJQmNclgOOCyg4KQ024KS4u9L4Kep/xFMK4ROUN6MjZ/9DgdJ/wBULcd3AJP0c0AnRGRA8fbCmZO+GxXckaEQw4QYATN+2VQxA10UewC+rjvns/2XsxcqHw3fSigLUshUXufIliA/hXox07tCOXIJ4L7ylnZ3thHiqxt00heXSsTCyj3VTo0VfjmFxgzz0Sa36EBWj85ctFo6K/LYiyG9b27v8f33qt7V5WrFj6+EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dyX7aos7dqWWXqrhWttgADAOtJuahBAkLRf0OxULrlo=;
 b=zcAR4uPJwAwd9Vtr2VJACTxMiKNPC6dOjjHiW1eiterWFP2d0QdBES+8DeLtKTGuhmeXGKmGKMuY4L8nt6hW+MuIYHrpfh0qscEUs28hs11uSac705ri7/nHxOXuDzFfTb4NQV+dm2gFJq19uaT0oXOpxW4hLyOban5iLfRShiY=
Received: from DM5PR1101MB2266.namprd11.prod.outlook.com (2603:10b6:4:57::17)
 by DM6PR11MB4530.namprd11.prod.outlook.com (2603:10b6:5:2a4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Wed, 17 Jun
 2020 06:45:23 +0000
Received: from DM5PR1101MB2266.namprd11.prod.outlook.com
 ([fe80::b07e:e40:d34e:b601]) by DM5PR1101MB2266.namprd11.prod.outlook.com
 ([fe80::b07e:e40:d34e:b601%6]) with mapi id 15.20.3109.021; Wed, 17 Jun 2020
 06:45:23 +0000
From: "Kang, Luwei" <luwei.kang@intel.com>
To: "Tian, Kevin" <kevin.tian@intel.com>,
 =?utf-8?B?TWljaGHFgiBMZXN6Y3p5xYRza2k=?= <michal.leszczynski@cert.pl>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Subject: RE: [PATCH v1 0/7] Implement support for external IPT monitoring
Thread-Topic: [PATCH v1 0/7] Implement support for external IPT monitoring
Thread-Index: KAn5ItxMsuAqHW3ZzkheyNf1oni9hpiVzvKAgAAIowCAAHHNAIAAVp/w
Date: Wed, 17 Jun 2020 06:45:22 +0000
Message-ID: <DM5PR1101MB22669C0DD0A5AA455681A08D809A0@DM5PR1101MB2266.namprd11.prod.outlook.com>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
 <cb530abc-bef6-23b9-86d8-f43167e14736@citrix.com>
 <1555629278.8787770.1592333278517.JavaMail.zimbra@cert.pl>
 <MWHPR11MB1645D9EFF209C6733C4DC5018C9A0@MWHPR11MB1645.namprd11.prod.outlook.com>
In-Reply-To: <MWHPR11MB1645D9EFF209C6733C4DC5018C9A0@MWHPR11MB1645.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.216]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7da5ecad-e0d6-4fc4-4f97-08d8128a028e
x-ms-traffictypediagnostic: DM6PR11MB4530:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB4530E371DC7BC3977AEC9F35809A0@DM6PR11MB4530.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 04371797A5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l4mETXw6qtV02rtVCf0BwOmVSXl2BLIfse9jIkROH6NiUmVa7l5ZHQqoQPbNoXLX8IhVJhyNLEMQB3tVyLhBmGLm3kofmbLcPqvzQA9ASZT8177SFCu4C5mn5h3E4NeUTwlrivTTQBypPZJY0XuYSdUWl+tFwxHCM7P+k5qeL+wvAxy8XOQizb/zFgNg1YYaqpajWYaivOpJUsz8nBb7IdSlg7bgxdSyBtlqOwboJosm/jNY+k9GeJdoW1VAXMCjb/+v2L6a0/5otc5ozWzZdd6DFJoFVcevLooQYA92ECmNUYJ/PG8iWQmYdM/qvkdp
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR1101MB2266.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(346002)(376002)(136003)(396003)(39860400002)(26005)(7416002)(83380400001)(4326008)(71200400001)(6506007)(8936002)(66574015)(52536014)(478600001)(53546011)(110136005)(54906003)(316002)(86362001)(7696005)(76116006)(66946007)(66476007)(66556008)(5660300002)(66446008)(64756008)(33656002)(9686003)(55016002)(186003)(8676002)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 7FoioelfeK/kOQ0HVYT+5HUgQN7NjWP6/rB0EW/9ZwYKfcfmu+yuBS9kKz/FPINbaaEGf4IDBl10YxMMXkHMqTWHWttt93RkZL4zWcl5aqbBxBn8uAE2ZZi9ylcjgvdTRHbMr09O/LQzzXADtJFqGrz3OP7S0i4fomzeleq57pWYI0iuBnBmfG0kKchNQKnQ9vi7aHvPhUG1XC65ENAQL7JDaiig10SfPKapMscLyBfg6mdk/82wACx987tL86/9plotUycW09XLafLZOehY/GUt3PJQ7qghQabcXKAeFcRCV0bYjpMUxKWjYbeoHP+toCZfoOj+0GrQkPjEGO/pXz4R0i+ovXL1zuDeOffTqVINHW1uldND2TP5REWQjqqjNUe0J5MiKtP3ikcXWLp9otVyrEmBPEIAgkSiyPh/jAOO5/98haWcAeVd1qrE1HpaRaU36P/u34VoH9DpLIogGoOgKbQ6NuHYHcYMRAL/3uwbectjS98FK0T8MuBzOdrZ
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7da5ecad-e0d6-4fc4-4f97-08d8128a028e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2020 06:45:22.8503 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KTqYLEfMQQFLJJfFYAdzP5WwPTVSlSIj7BxzNGq8D4u0F6e3T1kvfVgoYm6RGzQNjucYI4Wk0fBY7YHbMee3Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4530
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Wed, 17 Jun 2020 07:14:46 +0000
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Ian
 Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 "Nakajima, Jun" <jun.nakajima@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBUaWFuLCBLZXZpbiA8a2V2aW4u
dGlhbkBpbnRlbC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgSnVuZSAxNywgMjAyMCA5OjM1IEFN
DQo+IFRvOiBNaWNoYcWCIExlc3pjennFhHNraSA8bWljaGFsLmxlc3pjenluc2tpQGNlcnQucGw+
OyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBDYzogWGVu
LWRldmVsIDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+OyBKYW4gQmV1bGljaA0KPiA8
amJldWxpY2hAc3VzZS5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgUm9nZXIgUGF1IE1vbm7D
qQ0KPiA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBOYWthamltYSwgSnVuIDxqdW4ubmFrYWppbWFA
aW50ZWwuY29tPjsgR2VvcmdlDQo+IER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPjsg
SWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ow0KPiBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPjsNCj4gS2FuZywgTHV3ZWkgPGx1d2VpLmthbmdAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBS
RTogW1BBVENIIHYxIDAvN10gSW1wbGVtZW50IHN1cHBvcnQgZm9yIGV4dGVybmFsIElQVCBtb25p
dG9yaW5nDQo+IA0KPiArTHV3ZWksIHdobyBkZXZlbG9wZWQgUFQgZm9yIEtWTSBhbmQgaXMgdGhl
IGJlc3Qgb25lIHdobyBjYW4gaGVscA0KPiByZXZpZXcgVk1YIGNoYW5nZXMgZnJvbSBJbnRlbCBz
aWRlLiBQbGVhc2UgaW5jbHVkZSBoaW0gaW4gZnV0dXJlIHBvc3Qgb3INCj4gZGlzY3Vzc2lvbi4N
Cj4gDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBNaWNoYcWCIExl
c3pjennFhHNraSA8bWljaGFsLmxlc3pjenluc2tpQGNlcnQucGw+DQo+ID4gU2VudDogV2VkbmVz
ZGF5LCBKdW5lIDE3LCAyMDIwIDI6NDggQU0NCj4gPiBUbzogQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4gPiBDYzogWGVuLWRldmVsIDx4ZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmc+OyBKYW4gQmV1bGljaA0KPiA+IDxqYmV1bGljaEBzdXNlLmNvbT47IFdl
aSBMaXUgPHdsQHhlbi5vcmc+OyBSb2dlciBQYXUgTW9ubsOpDQo+ID4gPHJvZ2VyLnBhdUBjaXRy
aXguY29tPjsgTmFrYWppbWEsIEp1biA8anVuLm5ha2FqaW1hQGludGVsLmNvbT47IFRpYW4sDQo+
ID4gS2V2aW4gPGtldmluLnRpYW5AaW50ZWwuY29tPjsgR2VvcmdlIER1bmxhcA0KPiA+IDxnZW9y
Z2UuZHVubGFwQGNpdHJpeC5jb20+OyBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4
LmNvbT47DQo+ID4gSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IFN0ZWZhbm8gU3RhYmVs
bGluaQ0KPiA+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPiA+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjEgMC83XSBJbXBsZW1lbnQgc3VwcG9ydCBmb3IgZXh0ZXJuYWwgSVBUDQo+ID4gbW9uaXRv
cmluZw0KPiA+DQo+ID4gLS0tLS0gMTYgY3plIDIwMjAgbyAyMDoxNywgQW5kcmV3IENvb3BlciBh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tDQo+ID4gbmFwaXNhxYIoYSk6DQo+ID4NCj4gPiA+IE9u
IDE2LzA2LzIwMjAgMTY6MTYsIE1pY2hhxYIgTGVzemN6ecWEc2tpIHdyb3RlOg0KPiA+ID4+IElu
dGVsIFByb2Nlc3NvciBUcmFjZSBpcyBhbiBhcmNoaXRlY3R1cmFsIGV4dGVuc2lvbiBhdmFpbGFi
bGUgaW4NCj4gPiA+PiBtb2Rlcm4NCj4gPiBJbnRlbA0KPiA+ID4+IGZhbWlseSBDUFVzLiBJdCBh
bGxvd3MgcmVjb3JkaW5nIHRoZSBkZXRhaWxlZCB0cmFjZSBvZiBhY3Rpdml0eQ0KPiA+ID4+IHdo
aWxlIHRoZSBwcm9jZXNzb3IgZXhlY3V0ZXMgdGhlIGNvZGUuIE9uZSBtaWdodCB1c2UgdGhlIHJl
Y29yZGVkDQo+ID4gPj4gdHJhY2UgdG8NCj4gPiByZWNvbnN0cnVjdA0KPiA+ID4+IHRoZSBjb2Rl
IGZsb3cuIEl0IG1lYW5zLCB0byBmaW5kIG91dCB0aGUgZXhlY3V0ZWQgY29kZSBwYXRocywNCj4g
PiA+PiBkZXRlcm1pbmUgYnJhbmNoZXMgdGFrZW4sIGFuZCBzbyBmb3J0aC4NCj4gPiA+Pg0KPiA+
ID4+IFRoZSBhYm92ZW1lbnRpb25lZCBmZWF0dXJlIGlzIGRlc2NyaWJlZCBpbiBJbnRlbChSKSA2
NCBhbmQgSUEtMzINCj4gPiBBcmNoaXRlY3R1cmVzDQo+ID4gPj4gU29mdHdhcmUgRGV2ZWxvcGVy
J3MgTWFudWFsIFZvbHVtZSAzQzogU3lzdGVtIFByb2dyYW1taW5nIEd1aWRlLA0KPiA+IFBhcnQg
MywNCj4gPiA+PiBDaGFwdGVyIDM2OiAiSW50ZWwgUHJvY2Vzc29yIFRyYWNlLiINCj4gPiA+Pg0K
PiA+ID4+IFRoaXMgcGF0Y2ggc2VyaWVzIGltcGxlbWVudHMgYW4gaW50ZXJmYWNlIHRoYXQgRG9t
MCBjb3VsZCB1c2UgaW4NCj4gPiA+PiBvcmRlciB0bw0KPiA+IGVuYWJsZQ0KPiA+ID4+IElQVCBm
b3IgcGFydGljdWxhciB2Q1BVcyBpbiBEb21VLCBhbGxvd2luZyBmb3IgZXh0ZXJuYWwgbW9uaXRv
cmluZy4NCj4gPiA+PiBTdWNoIGEgZmVhdHVyZSBoYXMgbnVtZXJvdXMgYXBwbGljYXRpb25zIGxp
a2UgbWFsd2FyZSBtb25pdG9yaW5nLA0KPiA+ID4+IGZ1enppbmcsIG9yIHBlcmZvcm1hbmNlIHRl
c3RpbmcuDQo+ID4gPg0KPiA+ID4gSGVsbG8sDQo+ID4gPg0KPiA+ID4gSSdtIHZlcnkgZXhjaXRl
ZCB0byBzZWUgc3VwcG9ydCBsaWtlIHRoaXMgYXBwZWFyaW5nLsKgIEhvd2V2ZXIsIGJlDQo+ID4g
PiBhd2FyZSB0aGF0IHdlJ3JlIGN1cnJlbnRseSBpbiBjb2RlIGZyZWV6ZSBmb3IgdGhlIDQuMTQg
cmVsZWFzZSwgc28NCj4gPiA+IGluLWRlcHRoIHJldmlld3Mgd2lsbCBwcm9iYWJseSBiZSBkZWxh
eWVkIHNvbWV3aGF0IGR1ZSB0byBvdXIgYnVnDQo+ID4gPiBxdWV1ZSBhbmQgcmVsZWFzZSBhY3Rp
dml0aWVzLg0KPiA+DQo+ID4gU3VyZSwgdGFrZSB5b3VyIHRpbWUgOikNCj4gPg0KPiA+DQo+ID4g
Pg0KPiA+ID4gVGhhdCBzYWlkLCBJJ3ZlIGhhZCBhIHZlcnkgcXVpY2sgbG9vayB0aHJvdWdoIHRo
ZSBzZXJpZXMsIGFuZCBoYXZlIGENCj4gPiA+IGZldyBnZW5lcmFsIHF1ZXN0aW9ucyBmaXJzdC4N
Cj4gPiA+DQo+ID4gPiBBRkFJQ1QsIHRoaXMgaXMgc3RyaWN0bHkgZm9yIGV4dGVybmFsIG1vbml0
b3Jpbmcgb2YgdGhlIFZNLCBub3QgZm9yDQo+ID4gPiB0aGUgVk0gdG8gdXNlIGl0c2VsZj/CoCBJ
ZiBzbywgaXQgc2hvdWxkbid0IGhhdmUgdGhlIEggdGFnIGhlcmU6DQo+ID4gPg0KPiA+ID4gWEVO
X0NQVUZFQVRVUkUoSVBULMKgwqDCoMKgwqDCoMKgwqDCoMKgIDUqMzIrMjUpIC8qSMKgIEludGVs
IFByb2Nlc3NvciBUcmFjZSAqLw0KPiA+ID4NCj4gPiA+IGJlY2F1c2UgdGhhdCBleHBvc2VzIHRo
ZSBmZWF0dXJlIHRvIHRoZSBndWVzdCwgd2l0aCB0aGUgaW1wbGljYXRpb24NCj4gPiA+IHRoYXQg
YWxsIG90aGVyIHBhcnRzIG9mIHRoZSBmZWF0dXJlIHdvcmsgYXMgYWR2ZXJ0aXNlZC4NCj4gPg0K
PiA+IE9rLCBJIHdpbGwgcmVtb3ZlIHRoZSBIIHRhZy4NCj4gPg0KPiA+DQo+ID4gPg0KPiA+ID4N
Cj4gPiA+IEFyZSB0aGVyZSBhbnkgcmVzdHJpY3Rpb25zIG9uIEVQVCBiZWluZyBlbmFibGVkIGlu
IHRoZSBmaXJzdCBwbGFjZT8NCj4gPiA+IEknbSBub3QgYXdhcmUgb2YgYW55LCBhbmQgaW4gcHJp
bmNpcGxlIHdlIGNvdWxkIHVzZSB0aGlzDQo+ID4gPiBmdW5jdGlvbmFsaXR5IGZvciBQViBndWVz
dHMgYXMgd2VsbCAodXNpbmcgdGhlIENQTCBmaWx0ZXIpLg0KPiA+ID4gVGhlcmVmb3JlLCBJIHRo
aW5rIGl0IHdvdWxkIGJlIGhlbHBmdWwgdG8gbm90IHRpZSB0aGUgZnVuY3Rpb25hbGl0eQ0KPiA+
ID4gdG8gSFZNIGd1ZXN0cywgZXZlbiBpZiB0aGF0IGlzIHRoZSBvbmx5IG9wdGlvbiBlbmFibGVk
IHRvIHN0YXJ0IHdpdGguDQo+ID4NCj4gPiBJIHRoaW5rIGF0IHRoZSBtb21lbnQgaXQncyBub3Qg
cmVxdWlyZWQgdG8gaGF2ZSBFUFQuIFRoaXMgcGF0Y2ggc2VyaWVzDQo+ID4gZG9lc24ndCB1c2Ug
YW55IHRyYW5zbGF0aW9uIGZlYXR1cmUgZmxhZ3MsIHNvIHRoZSBvdXRwdXQgYWRkcmVzcyBpcw0K
PiA+IGFsd2F5cyBhIG1hY2hpbmUgcGh5c2ljYWwgYWRkcmVzcywgcmVnYXJkbGVzcyBvZiBjb250
ZXh0LiBJIHdpbGwgY2hlY2sNCj4gPiBpZiBpdCBjb3VsZCBiZSBlYXNpbHkgdXNlZCB3aXRoIFBW
Lg0KPiA+DQo+ID4NCj4gPiA+DQo+ID4gPiBUaGUgYnVmZmVyIG1hcHBpbmcgYW5kIGNyZWF0aW9u
IGxvZ2ljIGlzIGZhaXJseSBwcm9ibGVtYXRpYy4NCj4gPiA+IEluc3RlYWQgb2YgZmlnaHRpbmcg
d2l0aCBhbm90aGVyIG9wZW5jb2RlZCBleGFtcGxlLCB0YWtlIGEgbG9vayBhdA0KPiA+ID4gdGhl
IElPUkVRIHNlcnZlcidzIHVzZSBvZiAiYWNxdWlyZSByZXNvdXJjZSIgd2hpY2ggaXMgYSBtYXBw
aW5nDQo+ID4gPiBpbnRlcmZhY2Ugd2hpY2ggc3VwcG9ydHMgYWxsb2NhdGluZyBtZW1vcnkgb24g
YmVoYWxmIG9mIHRoZSBndWVzdCwNCj4gPiA+IG91dHNpZGUgb2YgdGhlIGd1ZXN0IG1lbW9yeSwg
Zm9yIHVzZSBieSBjb250cm9sIHRvb2xzLg0KPiA+ID4NCj4gPiA+IEkgdGhpbmsgd2hhdCB0aGlz
IHdhbnRzIGlzIGEgYml0IHNvbWV3aGVyZSBpbiBkb21haW5fY3JlYXRlIHRvDQo+ID4gPiBpbmRp
Y2F0ZSB0aGF0IGV4dGVybmFsIHRyYWNpbmcgaXMgdXNlZCBmb3IgdGhpcyBkb21haW4gKGFuZCBh
bGxvY2F0ZQ0KPiA+ID4gd2hhdGV2ZXIgc3RydWN0dXJlcy9idWZmZXJzIGFyZSBuZWNlc3Nhcnkp
LCBhY3F1aXJlIHJlc291cmNlIHRvIG1hcA0KPiA+ID4gdGhlIGJ1ZmZlcnMgdGhlbXNlbHZlcywg
YW5kIGEgZG9tY3RsIGZvciBhbnkgbmVjZXNzYXJ5IHJ1bnRpbWUgY29udHJvbHMuDQo+ID4gPg0K
PiA+DQo+ID4gSSB3aWxsIGNoZWNrIHRoaXMgb3V0LCB0aGlzIHNvdW5kcyBsaWtlIGEgZ29vZCBv
cHRpb24gYXMgaXQgd291bGQNCj4gPiByZW1vdmUgbG90cyBvZiBjb21wbGV4aXR5IGZyb20gdGhl
IGV4aXN0aW5nIGlwdF9lbmFibGUgZG9tY3RsLg0KPiA+DQo+ID4gPg0KPiA+ID4gV2hhdCBzZW1h
bnRpY3MgZG8geW91IHdhbnQgZm9yIHRoZSBidWZmZXIgYmVjb21pbmcgZnVsbD/CoCBHaXZlbiB0
aGF0DQo+ID4gPiBkZWJ1Z2dpbmcvdHJhY2luZyBpcyB0aGUgZ29hbCwgSSBwcmVzdW1lICJwYXVz
ZSB2Y3B1IG9uIGZ1bGwiIGlzIHRoZQ0KPiA+ID4gcHJlZmVycmVkIGJlaGF2aW91ciwgcmF0aGVy
IHRoYW4gZHJvcCBwYWNrZXRzIG9uIGZ1bGw/DQo+ID4gPg0KPiA+DQo+ID4gUmlnaHQgbm93IHRo
aXMgaXMgYSByaW5nLXN0eWxlIGJ1ZmZlciBhbmQgd2hlbiBpdCB3b3VsZCBiZWNvbWUgZnVsbCBp
dA0KPiA+IHdvdWxkIHNpbXBseSB3cmFwIGFuZCBvdmVycmlkZSB0aGUgb2xkIGRhdGEuDQo+ID4N
Cj4gPiA+DQo+ID4gPiBXaGVuIHRoaXMgc3ViamVjdCB3YXMgYnJvYWNoZWQgb24geGVuLWRldmVs
IGJlZm9yZSwgb25lIGlzc3VlIHdhcw0KPiA+ID4gdGhlIGZhY3QgdGhhdCBhbGwgYWN0aW9ucyB3
aGljaCBhcmUgaW50ZXJjZXB0ZWQgZG9uJ3QgZW5kIHVwIHdyaXRpbmcNCj4gPiA+IGFueSBhcHBy
b3ByaWF0ZSBwYWNrZXRzLsKgIFRoaXMgaXMgcGVyaGFwcyBsZXNzIG9mIGFuIGlzc3VlIGZvciB0
aGlzDQo+ID4gPiBleGFtcGxlLCB3aGVyZSB0aGUgZXh0ZXJuYWwgYWdlbnQgY2FuIHNlZSBWTUV4
aXRzIGluIHRoZSB0cmFjZSwgYnV0DQo+ID4gPiBpdCBzdGlsbCByZXN1bHRzIGluIG1pc3Npbmcg
aW5mb3JtYXRpb24uwqAgKEl0IGlzIGEgbWFqb3IgcHJvYmxlbSBmb3INCj4gPiA+IFBUIHdpdGhp
biB0aGUgZ3Vlc3QsIGFuZCBuZWVkcyBYZW4ncyBpbnRlcmNlcHQvZW11bGF0aW9uIGZyYW1ld29y
aw0KPiA+ID4gYmVpbmcgdXBkYXRlZCB0byBiZSBQVC1hd2FyZSBzbyBpdCBjYW4gZmlsbCBpbiB0
aGUgc2FtZSBwYWNrZXRzDQo+ID4gPiB3aGljaCBoYXJkd2FyZSB3b3VsZCBoYXZlIGRvbmUgZm9y
IGVxdWl2YWxlbnQgYWN0aW9ucy4pDQo+ID4NCj4gPiBPaywgdGhpcyBzb3VuZHMgbGlrZSBhIGhh
cmQgaXNzdWUuIENvdWxkIHlvdSBwb2ludCBvdXQgd2hhdCBjb3VsZCBiZQ0KPiA+IHRoZSBwYXJ0
aWN1bGFyIHByb2JsZW1hdGljIGNhc2VzPyBGb3IgaW5zdGFuY2UsIGlmIHNvbWV0aGluZyB3b3Vs
ZA0KPiA+IGFsdGVyIEVJUC9SSVAgb3IgQ1IzIHRoZW4gSSBiZWxpdmUgaXQgd291bGQgc3RpbGwg
YmUgcmVjb3JkZWQgaW4gUFQNCj4gPiB0cmFjZSAoaS5lLiB0aGVzZSB2YWx1ZXMgd2lsbCBiZSBs
b2dnZWQgb24gVk0gZW50cnkpLg0KDQplLmcuIElmIGEgVk0gZXhpdCBpcyB0YWtlbiBvbiBhIGd1
ZXN0IHdyaXRlIHRvIENSMyAoaW5jbHVkaW5nIOKAnE1PViBDUjPigJ0gYXMgd2VsbCBhcyB0YXNr
IHN3aXRjaGVzKSwgdGhlIFBJUCBwYWNrZXQNCm5vcm1hbGx5IGdlbmVyYXRlZCBvbiB0aGUgQ1Iz
IHdyaXRlIHdpbGwgYmUgbWlzc2luZy4gVGhlIFBJUCBwYWNrZXQgbmVlZHMgdG8gYmUgd3JpdHRl
biB0byB0aGUgUFQgYnVmZmVyIGJ5IHNvZnR3YXJlLiBBbm90aGVyIGV4YW1wbGUgaXMgVk0tZXhp
dCB0YWtlbiBvbiBSRFRTQy4gDQoNCkZvciBWTSBpbnRyb3NwZWN0aW9uLCBhbGwgdGhlIEludGVs
IFBUIHBhY2tldHMgbWF5IG5lZWQgdG8gZW11bGF0ZWQgYnkgc29mdHdhcmUuIFNvbWUgZGVzY3Jp
cHRpb24gaW4gU0RNIGFzIGJlbG93Og0KSWYgYSBWTU0gZW11bGF0ZXMgYW4gZWxlbWVudCBvZiBw
cm9jZXNzb3Igc3RhdGUgYnkgdGFraW5nIGEgVk0gZXhpdCBvbiByZWFkcyBhbmQvb3Igd3JpdGVz
IHRvIHRoYXQgcGllY2Ugb2Ygc3RhdGUsIGFuZCB0aGUgc3RhdGUgZWxlbWVudCBpbXBhY3RzIElu
dGVsIFBUIHBhY2tldCBnZW5lcmF0aW9uIG9yIHZhbHVlcywgaXQgbWF5IGJlIGluY3VtYmVudCB1
cG9uIHRoZSBWTU0gdG8gaW5zZXJ0IG9yIG1vZGlmeSB0aGUgb3V0cHV0IHRyYWNlIGRhdGEuDQoN
ClRoYW5rcywNCkx1d2VpIEthbmcNCg0KPiA+DQo+ID4gPg0KPiA+ID4NCj4gPiA+IFRoYW5rcywN
Cj4gPiA+DQo+ID4gPiB+QW5kcmV3DQo+ID4NCj4gPg0KPiA+IEJlc3QgcmVnYXJkcywNCj4gPiBN
aWNoYcWCIExlc3pjennFhHNraQ0KPiA+IENFUlQgUG9sc2thDQo=

