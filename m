Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B150E189906
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2020 11:15:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEVg4-0008Jo-C4; Wed, 18 Mar 2020 10:11:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ggnj=5D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jEVg3-0008Jj-9r
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2020 10:11:55 +0000
X-Inumbo-ID: de77140e-6900-11ea-babb-12813bfff9fa
Received: from m4a0072g.houston.softwaregrp.com (unknown [15.124.2.130])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id de77140e-6900-11ea-babb-12813bfff9fa;
 Wed, 18 Mar 2020 10:11:54 +0000 (UTC)
Received: FROM m4a0072g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0072g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 18 Mar 2020 10:10:37 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 18 Mar 2020 10:03:59 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 18 Mar 2020 10:03:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EDWTnVOnDaJPyb0KShOEJuDOZ0Auc7OaRD03oeMDYyIWL6EXXC93dIYmMtlC9WTMQnDbTao6yWRABI1eVH5x7TYC4jKYo9vGA0WP/5fESwiO03Qprvo37XmFSTew7k46oHyx6YpOEt1v0loh+1t4RxGA4Uo+o4gsBS8nVTLjKWpBFW9L/XFx8hxW8Y8Umcgu+el0GE7LEQILu0lGMik2uKAMlfPu+nMdJdMbpAz0B3wGERf60uAVntMRcNVT1H9rmBTQmkVOTuSMeTOL7x8ptNGpQh3PqDOC0g6FbssbTwBGt0tFdwUYahoWkA5OcsOJkxxPBiE1YKqg939OGLipoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4aJh44r8T18KWr5Un1qBFk9S0xbts9UE+suVxZf4YDs=;
 b=Vc5NboUUlBk6S/rCFiMzt5Z4D0uHNDcO8JdqYNovV/zyZvuS2o26Gv4TLWbKgxoLGrzwilKQqaU6AodeclTe12M1sp5PIAKXK0C7pWgabMSurfaH0HsbRSXvqXbmftA51v4ijDjZs0g65w2Ye7yT8eGFsUyM62VxK4ojtC+H8ZyFMVoK6lmAqTF2rzFQvLdJYmIeulQxvlwcnra33uc0Y9BpgUzDLLbkkLomc9xOqTwiV52hfWsrfjJz0KM8EMXZ297BRWOBIJ/7jowRQ+gM6Ct0sNOXa83g8tDr5Vi6Q5ZVVmzuQwYul75/gNUN32jh0BcI2GG0ZNgm7Q4Mco/+IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
Received: from MN2PR18MB3573.namprd18.prod.outlook.com (2603:10b6:208:265::8)
 by MN2PR18MB3480.namprd18.prod.outlook.com (2603:10b6:208:265::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.14; Wed, 18 Mar
 2020 10:03:58 +0000
Received: from MN2PR18MB3573.namprd18.prod.outlook.com
 ([fe80::2c24:bc66:8596:8a7a]) by MN2PR18MB3573.namprd18.prod.outlook.com
 ([fe80::2c24:bc66:8596:8a7a%6]) with mapi id 15.20.2835.017; Wed, 18 Mar 2020
 10:03:58 +0000
To: David Woodhouse <dwmw2@infradead.org>
References: <56f7fe21daff2dc4bf8db7ee356666233bdb0f7a.camel@infradead.org>
 <20200207155701.2781820-2-dwmw2@infradead.org>
 <cdf20919a9c1afcee2d2f63631391a701cde46ef.camel@amazon.com>
 <017D4B5F-603D-42BF-94DA-B757FF27EAF8@infradead.org>
 <2f2368f84380dd2c81bbfa310d03bc3c3f800b94.camel@amazon.com>
 <B63B9D74-EF17-4E6F-AA5D-2BEC0C3228D7@infradead.org>
 <f5b6325a469352585d7cf1d7d01d2dc4a2f2af8f.camel@infradead.org>
 <af374a90-f060-7239-5a02-c98df409819c@suse.com>
 <f320e035b9e77a565be61d7ad13c3947c1d00cb8.camel@infradead.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d3e79d9b-63e8-9d4f-ff2b-38b99b7c3c42@suse.com>
Date: Wed, 18 Mar 2020 11:03:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
In-Reply-To: <f320e035b9e77a565be61d7ad13c3947c1d00cb8.camel@infradead.org>
Content-Language: en-US
X-ClientProxiedBy: FR2P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::15) To MN2PR18MB3573.namprd18.prod.outlook.com
 (2603:10b6:208:265::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2003:ca:b70b:8af1:81fd:9070:7c66:aa5d]
 (2003:ca:b70b:8af1:81fd:9070:7c66:aa5d) by
 FR2P281CA0005.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.15 via Frontend Transport; Wed, 18 Mar 2020 10:03:56 +0000
X-Originating-IP: [2003:ca:b70b:8af1:81fd:9070:7c66:aa5d]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e0ce8ca-f15a-4ebb-7290-08d7cb23acee
X-MS-TrafficTypeDiagnostic: MN2PR18MB3480:
X-Microsoft-Antispam-PRVS: <MN2PR18MB3480647DFF4A91AB2EB6ECBBB3F70@MN2PR18MB3480.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 03468CBA43
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(376002)(396003)(39860400002)(346002)(366004)(199004)(6486002)(31696002)(5660300002)(16526019)(186003)(2616005)(316002)(86362001)(54906003)(66556008)(66946007)(66476007)(478600001)(4326008)(36756003)(8676002)(81156014)(81166006)(8936002)(31686004)(6666004)(52116002)(7416002)(53546011)(6916009)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB3480;
 H:MN2PR18MB3573.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bm1SPvLlX1kgJIKfP9WN7H+MFG+yo9+mV5VzdCLzrr+d1I9wOegQQKHis6tAdc1HlhRj+ctY+Li9Ep5gsZlN+uMAke7AwBvgJ7GxWnVTQL718u1gx3ZJ3rouj+tntZeSiIU+F2IhiP9TjBorjW/F2Zr99lRYtcdogcftKttIkZ0/gQ3/ToUFCsHpxdyKYvZN7Unrl4KPlEt9xG+O1FlHRtRjQNSCyRy7rlx0RtKVeWIzcMnNBPsYFQ2W3gh/lawDGcaMFzfIsWb9E+LHuDfYX3yy5Vaf2qC3DxscMKzgK0n3dEcLw5vI2YipVZfC1nB1ckLrqqOR0ecq/KlGYJa41veG9dagNe+8KeAi7vsmIZ/uz9+7pqSZO0PDfL8O/QLCc2JbZA/69aQzFUaZSq0/Erh0PjhWslna6zNKfoyWRrGwr+qa6SpzgkpyyrXX5q5H
X-MS-Exchange-AntiSpam-MessageData: 2w5ODakBy/phfWTc/fN6DfMvVgG5win0t03pUXs4BpNavTCOd3xBHDV0Rhz5c9GWONdmqtznvng8Py0+QvARF4s4jw2UCVsWbFEd0GXYi70MH3DAM3w67wusM/tU8b5FZOQoin++xV8wNGHUrbuQQKMG9TFJSwnQHXqNMMKOYb6yQ+F4zpSyqX9z8VZ19eHSLecoeV3k+MQtb5yhwfW1qg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e0ce8ca-f15a-4ebb-7290-08d7cb23acee
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2020 10:03:58.4056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X2VgFGBxtohoX8p+LiLzy21EzQ7ZPxUSQxWsfl3YpUdBqhuSDjrzDsmiXZpvgNpJKGf4FEIDL9OjPMnwPOG7wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB3480
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 2/2] xen/mm: Introduce PG_state_uninitialised
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "jeff.kubascik@dornerworks.com" <jeff.kubascik@dornerworks.com>, "Xia,
 Hongyan" <hongyxia@amazon.com>,
 "stewart.hildebrand@dornerworks.com" <stewart.hildebrand@dornerworks.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDMuMjAyMCAyMzoxNSwgRGF2aWQgV29vZGhvdXNlIHdyb3RlOgo+IE9uIFRodSwgMjAy
MC0wMi0yMCBhdCAxMjo1OSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA3LjAyLjIw
MjAgMTk6MDQsIERhdmlkIFdvb2Rob3VzZSB3cm90ZToKPiAgICAgICAgICBBU1NFUlQoKHBnW2ld
LmNvdW50X2luZm8gJiB+UEdDX2V4dHJhKSA9PSBQR0Nfc3RhdGVfaW51c2UgfHwKPiAgICAgICAg
ICAgICAgICAgKHBnW2ldLmNvdW50X2luZm8gJiB+UEdDX2V4dHJhKSA9PSBQR0Nfc3RhdGVfdW5p
bml0aWFsaXNlZCk7Cj4+PiAgICAgICAgICAgcGFnZV9zZXRfb3duZXIoJnBnW2ldLCBkKTsKPj4+
ICAgICAgICAgICBzbXBfd21iKCk7IC8qIERvbWFpbiBwb2ludGVyIG11c3QgYmUgdmlzaWJsZSBi
ZWZvcmUgdXBkYXRpbmcgcmVmY250LiAqLwo+Pj4gLSAgICAgICAgcGdbaV0uY291bnRfaW5mbyA9
IFBHQ19hbGxvY2F0ZWQgfCAxOwo+Pj4gKyAgICAgICAgcGdbaV0uY291bnRfaW5mbyB8PSBQR0Nf
YWxsb2NhdGVkIHwgMTsKPj4KPj4gVGhpcyBpcyB0b28gcmVsYXhlZCBmb3IgbXkgdGFzdGU6IEkg
dW5kZXJzdGFuZCB5b3Ugd2FudCB0bwo+PiByZXRhaW4gcGFnZSBzdGF0ZSwgYnV0IEkgc3VwcG9z
ZSBvdGhlciBiaXRzIHdvdWxkIHdhbnQgY2xlYXJpbmcKPj4gbmV2ZXJ0aGVsZXNzLgo+IAo+IFlv
dSBzZWVtIHRvIGhhdmUgZHJvcHBlZCB0aGUgQVNTRVJUIGltbWVkaWF0ZWx5IGJlZm9yZSB0aGUg
Y29kZSBzbmlwcGV0Cj4geW91IGNpdGVkLCBpbiB3aGljaCBhcmJpdHJhcnkgb3RoZXIgY29udGVu
dHMgb2YgY291bnRfaW5mbyBhcmUgbm90Cj4gcGVybWl0dGVkLiBJIHB1dCBpdCBiYWNrLCBpbiBp
dHMgY3VycmVudCBmb3JtIGFmdGVyIEkgcmViYXNlIG9uIHRvcCBvZgo+IFBhdWwncyBjb21taXQg
Yzc5M2QxMzk0NGI0NWQgYXNzaW5nIFBHQ19leHRyYS4KCkJ1dCB0aGF0JyBvbmx5IGFuIEFTU0VS
VCgpLCBpLmUuIG5vIHByb3RlY3Rpb24gYXQgYWxsIGluIHJlbGVhc2UgYnVpbGRzLgoKPj4+IC0t
LSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbW0uaAo+Pj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4
Ni9tbS5oCj4+PiBAQCAtNzIsMTIgKzcyLDEzIEBACj4+PiAgICAgKiB7IGludXNlLCBvZmZsaW5p
bmcsIG9mZmxpbmVkLCBmcmVlLCBicm9rZW5fb2ZmbGluaW5nLCBicm9rZW4gfQo+Pj4gICAgICov
Cj4+PiAgICNkZWZpbmUgUEdDX3N0YXRlICAgICAgICAgICAgICAgICAgUEdfbWFzayg3LCA5KQo+
Pj4gLSNkZWZpbmUgUEdDX3N0YXRlX2ludXNlICAgICAgICAgICAgUEdfbWFzaygwLCA5KQo+Pj4g
KyNkZWZpbmUgUEdDX3N0YXRlX3VuaW5pdGlhbGlzZWQgICAgUEdfbWFzaygwLCA5KQo+Pj4gICAj
ZGVmaW5lIFBHQ19zdGF0ZV9vZmZsaW5pbmcgICAgICAgIFBHX21hc2soMSwgOSkKPj4+ICAgI2Rl
ZmluZSBQR0Nfc3RhdGVfb2ZmbGluZWQgICAgICAgICBQR19tYXNrKDIsIDkpCj4+PiAgICNkZWZp
bmUgUEdDX3N0YXRlX2ZyZWUgICAgICAgICAgICAgUEdfbWFzaygzLCA5KQo+Pj4gICAjZGVmaW5l
IFBHQ19zdGF0ZV9icm9rZW5fb2ZmbGluaW5nIFBHX21hc2soNCwgOSkKPj4+ICAgI2RlZmluZSBQ
R0Nfc3RhdGVfYnJva2VuICAgICAgICAgICBQR19tYXNrKDUsIDkpCj4+PiArI2RlZmluZSBQR0Nf
c3RhdGVfaW51c2UgICAgICAgICAgICBQR19tYXNrKDYsIDkpCj4+Cj4+IFdvdWxkIGltbyBiZSBu
aWNlIGlmIHRoaXMgbW9zdCBjb21tb24gc3RhdGUgd2FzIGFjdHVhbGx5Cj4+IGVpdGhlciAxIG9y
IDcsIGZvciBlYXN5IHJlY29nbml0aW9uLiBCdXQgdGhlIG1vc3Qgc3VpdGFibGUKPj4gdmFsdWUg
dG8gcGljayBtYXkgYWxzbyBkZXBlbmQgb24gdGhlIG91dGNvbWUgb2Ygb25lIG9mIHRoZQo+PiBj
b21tZW50cyBvbiBwYXRjaCAxLgo+IAo+IE5vdCBxdWl0ZSBzdXJlIHdoeSAxIGFuZCA3IGFyZSBl
YXNpZXIgdG8gcmVjb2duaXNlIHRoYW4gb3RoZXIgdmFsdWVzLgo+IFRoZSBpbXBvcnRhbnQgb25l
IGlzIHRoYXQgdW5pbml0aWFsaXNlZCBoYXMgdG8gYmUgemVybywgc2luY2UgdGhhdCdzCj4gdGhl
IGRlZmF1bHQgKGJlY2F1c2UgdGhhdCdzIHdoYXQgdGhlIGZyYW1lIHRhYmxlIGlzIG1lbXNldCB0
by4gV2hpY2ggaXMKPiBjaGFuZ2VhYmxlLCBidXQgbm9uLXRyaXZpYWxseSBzbykuCgpJbiBwYXJ0
aWN1bGFyIDcgbWF5IGltbyBiZSBlYXNpZXIgdG8gcmVjb2duaXplLCBhcyBoYXZpbmcgYWxsCm9m
IHRoZSB0aHJlZSBiaXRzIHNldC4gSXQgc29tZXRpbWVzIGhlbHBzIHNlZWluZyBzdWNoIGF0IChh
bG1vc3QpCnRoZSBmaXJzdCBnbGFuY2UgaW4gZS5nLiBsb2dnZWQgZGF0YS4KCkphbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
