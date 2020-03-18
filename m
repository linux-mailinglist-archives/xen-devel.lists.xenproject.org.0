Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A041898F5
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2020 11:10:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEVad-0007To-Im; Wed, 18 Mar 2020 10:06:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ggnj=5D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jEVab-0007Tj-Ph
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2020 10:06:17 +0000
X-Inumbo-ID: 15b1555c-6900-11ea-bec1-bc764e2007e4
Received: from m9a0013g.houston.softwaregrp.com (unknown [15.124.64.91])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 15b1555c-6900-11ea-bec1-bc764e2007e4;
 Wed, 18 Mar 2020 10:06:13 +0000 (UTC)
Received: FROM m9a0013g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0013g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 18 Mar 2020 10:05:32 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 18 Mar 2020 09:57:05 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 18 Mar 2020 09:57:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LoQTo3KjXYw13kau3HtXwwOWIrugAngilP8vajQ4ni37xJB4xvJ4ksxBmIchD1Z2IyJCzy6a0g9qK8v0OhywDPxq/Uue3+/wocn/sJj81i2y+WrdR7/jzkMh5L8+3EFxPXx19BrWjcITMnoXdhQo8ei5FCaXZFHwPC3fE05qt8SYyAJeow8stSVKeCH9ty/j2Y+yCnZT16VUhWWnr40fbJJOJm9+ehARUmud2H2v4SDh86vjSCx1V58oCb76pJQWmEk4036IDR/i5ABtbGNmVs3WJ/AYo2KvugXol+CvIVMsqP6xPGqpciZaL+Ak5oPPNlknMMgH53UDzlxu1RWkug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UqUl/W+Nf7Y8QeigDezShUTXEbhCo7tOKp0qUU19bdA=;
 b=dCQj6LFFHQn49oTKR/FZY01m36V0+JFdbnMEDTR+xgKnQ57AYemMVWdZA1/L/y9MqC4O0rhW4MWiNR8n2xNiMVFt13bJk9gLoocVtjEcsO8E0ioalq0hxPLVk2e2GXJ4ISsXAPlxGYtp9nDGvYfsULNSaaHc4kQrmKQIG9sLsHENnZNYzHsjltLGcvwNXeVTB+9/8KgTjj+0RO5woZdw6deYyubGLvIOuhULVTP6zQxAOImE6pHeRBhBs+PEmaOKwOXSqXbjv7vXzQ9NKmUAkQnAeEtzCYyV1m/zMmLBlvhgyWq5HCZvnITXN/ctsEQnoNiIq+YplFJl2W/SW0ds+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
Received: from MN2PR18MB3573.namprd18.prod.outlook.com (2603:10b6:208:265::8)
 by MN2PR18MB3480.namprd18.prod.outlook.com (2603:10b6:208:265::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.14; Wed, 18 Mar
 2020 09:57:03 +0000
Received: from MN2PR18MB3573.namprd18.prod.outlook.com
 ([fe80::2c24:bc66:8596:8a7a]) by MN2PR18MB3573.namprd18.prod.outlook.com
 ([fe80::2c24:bc66:8596:8a7a%6]) with mapi id 15.20.2835.017; Wed, 18 Mar 2020
 09:57:03 +0000
To: David Woodhouse <dwmw2@infradead.org>
References: <56f7fe21daff2dc4bf8db7ee356666233bdb0f7a.camel@infradead.org>
 <20200207155701.2781820-1-dwmw2@infradead.org>
 <a531f518-f996-34a0-7218-a746ae210393@suse.com>
 <641040a4aebc62e1e0e3874f513e3a308ec3ace0.camel@infradead.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9b0d191e-2553-6368-84d6-8425abe23c39@suse.com>
Date: Wed, 18 Mar 2020 10:56:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
In-Reply-To: <641040a4aebc62e1e0e3874f513e3a308ec3ace0.camel@infradead.org>
Content-Language: en-US
X-ClientProxiedBy: AM3PR04CA0141.eurprd04.prod.outlook.com (2603:10a6:207::25)
 To MN2PR18MB3573.namprd18.prod.outlook.com
 (2603:10b6:208:265::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2003:ca:b70b:8af1:81fd:9070:7c66:aa5d]
 (2003:ca:b70b:8af1:81fd:9070:7c66:aa5d) by
 AM3PR04CA0141.eurprd04.prod.outlook.com (2603:10a6:207::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.21 via Frontend Transport; Wed, 18 Mar 2020 09:57:01 +0000
X-Originating-IP: [2003:ca:b70b:8af1:81fd:9070:7c66:aa5d]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94b88d26-387b-41d6-898e-08d7cb22b59c
X-MS-TrafficTypeDiagnostic: MN2PR18MB3480:
X-Microsoft-Antispam-PRVS: <MN2PR18MB3480D9844C6DBE553DB2824AB3F70@MN2PR18MB3480.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 03468CBA43
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(376002)(396003)(39860400002)(346002)(366004)(199004)(6486002)(31696002)(5660300002)(16526019)(186003)(2616005)(316002)(86362001)(54906003)(66556008)(66946007)(66476007)(478600001)(66574012)(4326008)(36756003)(8676002)(81156014)(81166006)(8936002)(31686004)(6666004)(52116002)(7416002)(53546011)(6916009)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB3480;
 H:MN2PR18MB3573.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8iq5Fkmboz6HO+OiPFy/7rOgFSUAVhUSM1SLX9DuQvXsgSrGCTWfxPaX7uz5jMdNrWJV1aNB3IYdCGYpFtrNyjw0fAnHMDOel3KuTgb5JiAcQmOrNDZJ7uvsVEiic/2/AXhaWhZ19r7Z7DwIHfSp5VfksmMGNOn73J7eQdj93EhPN1Hvr+dLBQoWbbrcaSwktoqNifvOt8gW9int49WcgnVPLXcA846uAqYG2OwWJ/k5N49b9INPbf1cA/kCD2r1hklDYAvKYhN69z2Q/5tCrSrlQFMrZaRuO42/2U1PlGzQLbNvKTy0XDMxXdK6x+uwvZXvksg1afz9WOEcRNU6Y6GdAA+qT/R52bZHQhBTzF69gvoHiOrpaqyidTAKoZCfDBp7yyaV+lGB/P+rIK0JXXZCdqDvPlJHHVnHE0bj44Z3Pwqz2aUTAvzH+fFXI0pF
X-MS-Exchange-AntiSpam-MessageData: vDr4L5zW/uOZv0bXj77OTMY7+2I8tOBwW97RZ6Ym00+IQVhCq2tT9FxuXd4pr/36D1EDDumanyljpsf+ArvEVQlOePonAagRa8wrkaASJf6ibd56ZeRkOfw8dbvT+yj8FJ8tJLpgVvueq2BZGBfTNll5mXI9ME4P+9w6t6iIVCs+pcojHAric9f0g+IcJrgnvHODy6f3MhsFumr4tm2t4A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 94b88d26-387b-41d6-898e-08d7cb22b59c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2020 09:57:03.4556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uJ/9jR9H5QRn8ywSVjWeIhJ1X1/CCKyJS/k7+i+TPoj6RGgU1MNCIylo4HldLVPeApnOldMr7J4jbbSFPxfBRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB3480
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 1/2] xen/mm: fold PGC_broken into PGC_state
 bits
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jeff Kubascik <jeff.kubascik@dornerworks.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDMuMjAyMCAyMjo1MiwgRGF2aWQgV29vZGhvdXNlIHdyb3RlOgo+IE9uIFRodSwgMjAy
MC0wMi0yMCBhdCAxMjoxMCArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA3LjAyLjIw
MjAgMTY6NTcsIERhdmlkIFdvb2Rob3VzZSB3cm90ZToKPj4+IEBAIC0xMTQ1LDE2ICsxMTQ1LDE5
IEBAIHN0YXRpYyBpbnQgcmVzZXJ2ZV9vZmZsaW5lZF9wYWdlKHN0cnVjdAo+Pj4gcGFnZV9pbmZv
ICpoZWFkKQo+Pj4gICAKPj4+ICAgICAgIGZvciAoIGN1cl9oZWFkID0gaGVhZDsgY3VyX2hlYWQg
PCBoZWFkICsgKCAxVUwgPDwgaGVhZF9vcmRlcik7Cj4+PiBjdXJfaGVhZCsrICkKPj4+ICAgICAg
IHsKPj4+IC0gICAgICAgIGlmICggIXBhZ2Vfc3RhdGVfaXMoY3VyX2hlYWQsIG9mZmxpbmVkKSAp
Cj4+PiArICAgICAgICBzdHJ1Y3QgcGFnZV9saXN0X2hlYWQgKmxpc3Q7Cj4+PiArICAgICAgICBp
ZiAoIHBhZ2Vfc3RhdGVfaXMoY3VyX2hlYWQsIG9mZmxpbmVkKSApCj4+PiArICAgICAgICAgICAg
bGlzdCA9ICZwYWdlX29mZmxpbmVkX2xpc3Q7Cj4+PiArICAgICAgICBlbHNlIGlmIChwYWdlX3N0
YXRlX2lzKGN1cl9oZWFkLCBicm9rZW4pICkKPj4+ICsgICAgICAgICAgICBsaXN0ID0gJnBhZ2Vf
YnJva2VuX2xpc3Q7Cj4+PiArICAgICAgICBlbHNlCj4+PiAgICAgICAgICAgICAgIGNvbnRpbnVl
Owo+Pj4gICAKPj4+ICAgICAgICAgICBhdmFpbFtub2RlXVt6b25lXS0tOwo+Pj4gICAgICAgICAg
IHRvdGFsX2F2YWlsX3BhZ2VzLS07Cj4+PiAgICAgICAgICAgQVNTRVJUKHRvdGFsX2F2YWlsX3Bh
Z2VzID49IDApOwo+Pj4gICAKPj4+IC0gICAgICAgIHBhZ2VfbGlzdF9hZGRfdGFpbChjdXJfaGVh
ZCwKPj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICB0ZXN0X2JpdChfUEdDX2Jyb2tlbiwg
JmN1cl9oZWFkLT5jb3VudF9pbmZvKSA/Cj4+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
JnBhZ2VfYnJva2VuX2xpc3QgOiAmcGFnZV9vZmZsaW5lZF9saXN0KTsKPj4+ICsgICAgICAgIHBh
Z2VfbGlzdF9hZGRfdGFpbChjdXJfaGVhZCwgbGlzdCk7Cj4+Cj4+IFdoaWxlIEkgcmVhbGl6ZSBp
dCdzIGZld2VyIGNvbXBhcmlzb25zIHRoaXMgd2F5LCBJIHN0aWxsIHdvbmRlcgo+PiB3aGV0aGVy
IGZvciB0aGUgcmVhZGVyJ3Mgc2FrZSBpdCB3b3VsZG4ndCBiZXR0ZXIgYmUKPj4gcGFnZV9pc19v
ZmZsaW5lZCgpIGZpcnN0IGFuZCB0aGVuIHBhZ2VfaXNfYnJva2VuKCkgZG93biBoZXJlLgo+IAo+
IE5haCwgdGhhdCB3b3VsZCBiZSB3b3JzZS4gVGhpcyB3YXkgdGhlcmUgYXJlIHR3byBjYXNlcyB3
aGljaCBhcmUKPiBleHBsaWNpdGx5IGhhbmRsZWQgYW5kIHRoZSBsaXN0IHRvIHVzZSBmb3IgZWFj
aCBvZiB0aGVtIGlzIGV4cGxpY2l0bHkKPiBzZXQuIFRoZSAnaWYgKGF8fGIpIOKApiAgICBzb21l
X2Z1bmN0aW9uKGEgPyB0aGluZ19mb3JfYSA6IHRoaW5nX2Zvcl9iKScKPiBjb25zdHJ1Y3QgaXMg
bXVjaCBsZXNzIGNvbXByZWhlbnNpYmxlLgoKSXQncyBhIG1hdHRlciBvZiB0YXN0ZSwgSSBhZ3Jl
ZSwgYW5kIGluIHN1Y2ggYSBjYXNlIEkgZ2VuZXJhbGx5IGFkdmlzZQp0byBzZWUgYWJvdXQgbGlt
aXRpbmcgY29kZSBjaHVybi4gRm9yIGNvZGUgeW91IHRoZW4gc3RpbGwgaW50cm9kdWNlCmFuZXcs
IHllcywgdGFzdGUgZGVjaXNpb25zIG1heSB0eXBpY2FsbHkgYmUgdG8gdGhlIGF1dGhvcnMganVk
Z2VtZW50Cih0aGVyZSBhcmUgZXhjZXB0aW9ucywgdGhvdWdoKS4KCj4+PiBAQCAtMTY5OSwxNCAr
MTcxNCwxNCBAQCB1bnNpZ25lZCBpbnQgb25saW5lX3BhZ2UobWZuX3QgbWZuLAo+Pj4gdWludDMy
X3QgKnN0YXR1cykKPj4+ICAgICAgIGRvIHsKPj4+ICAgICAgICAgICByZXQgPSAqc3RhdHVzID0g
MDsKPj4+ICAgCj4+PiAtICAgICAgICBpZiAoIHkgJiBQR0NfYnJva2VuICkKPj4+ICsgICAgICAg
IGlmICggKHkgJiBQR0Nfc3RhdGUpID09IFBHQ19zdGF0ZV9icm9rZW4gfHwKPj4+ICsgICAgICAg
ICAgICAgKHkgJiBQR0Nfc3RhdGUpID09IFBHQ19zdGF0ZV9icm9rZW5fb2ZmbGluaW5nICkKPj4+
ICAgICAgICAgICB7Cj4+PiAgICAgICAgICAgICAgIHJldCA9IC1FSU5WQUw7Cj4+PiAgICAgICAg
ICAgICAgICpzdGF0dXMgPSBQR19PTkxJTkVfRkFJTEVEIHxQR19PTkxJTkVfQlJPS0VOOwo+Pj4g
ICAgICAgICAgICAgICBicmVhazsKPj4+ICAgICAgICAgICB9Cj4+PiAtCj4+PiAtICAgICAgICBp
ZiAoICh5ICYgUEdDX3N0YXRlKSA9PSBQR0Nfc3RhdGVfb2ZmbGluZWQgKQo+Pj4gKyAgICAgICAg
ZWxzZSBpZiAoICh5ICYgUEdDX3N0YXRlKSA9PSBQR0Nfc3RhdGVfb2ZmbGluZWQgKQo+Pgo+PiBJ
IGRvbid0IHNlZSBhIG5lZWQgZm9yIGFkZGluZyAiZWxzZSIgaGVyZS4KPiAKPiBUaGV5IGFyZSBt
dXR1YWxseSBleGNsdXNpdmUgY2FzZXMuIEl0IG1ha2VzIHRoaW5ncyBhIHdob2xlIGxvdCBjbGVh
cmVyCj4gdG8gdGhlIHJlYWRlciB0byBwdXQgdGhlICdlbHNlJyB0aGVyZSwgYW5kIHNvbWV0aW1l
cyBoZWxwcyBhIG5hw692ZQo+IGNvbXBpbGVyIGFsb25nIHRoZSB3YXkgdG9vLgoKV2VsbCwgSSdt
IGFmcmFpZCBJJ20gZ29pbmcgdG8gYmUgcHJldHR5IHN0cmljdCBhYm91dCB0aGlzOiBJdCdzIGFn
YWluCmEgbWF0dGVyIG9mIHRhc3RlLCB5ZXMsIGJ1dCB3ZSBnZW5lcmFsbHkgdHJ5IHRvIGF2b2lk
IHBvaW50bGVzcyBlbHNlLgpXaGF0IHlvdSBjb25zaWRlciAiYSB3aG9sZSBsb3QgY2xlYXJlciB0
byB0aGUgcmVhZGVyIiBpcyB0aGUgb3Bwb3NpdGUKZnJvbSBteSBwb3YuCgo+Pj4gLS0tIGEveGVu
L2luY2x1ZGUvYXNtLXg4Ni9tbS5oCj4+PiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L21tLmgK
Pj4+IEBAIC02NywxOCArNjcsMjcgQEAKPj4+ICAgIC8qIDMtYml0IFBBVC9QQ0QvUFdUIGNhY2hl
LWF0dHJpYnV0ZSBoaW50LiAqLwo+Pj4gICAjZGVmaW5lIFBHQ19jYWNoZWF0dHJfYmFzZSBQR19z
aGlmdCg2KQo+Pj4gICAjZGVmaW5lIFBHQ19jYWNoZWF0dHJfbWFzayBQR19tYXNrKDcsIDYpCj4+
PiAtIC8qIFBhZ2UgaXMgYnJva2VuPyAqLwo+Pj4gLSNkZWZpbmUgX1BHQ19icm9rZW4gICAgICAg
UEdfc2hpZnQoNykKPj4+IC0jZGVmaW5lIFBHQ19icm9rZW4gICAgICAgIFBHX21hc2soMSwgNykK
Pj4+IC0gLyogTXV0dWFsbHktZXhjbHVzaXZlIHBhZ2Ugc3RhdGVzOiB7IGludXNlLCBvZmZsaW5p
bmcsIG9mZmxpbmVkLAo+Pj4gZnJlZSB9LiAqLwo+Pj4gLSNkZWZpbmUgUEdDX3N0YXRlICAgICAg
ICAgUEdfbWFzaygzLCA5KQo+Pj4gLSNkZWZpbmUgUEdDX3N0YXRlX2ludXNlICAgUEdfbWFzaygw
LCA5KQo+Pj4gLSNkZWZpbmUgUEdDX3N0YXRlX29mZmxpbmluZyBQR19tYXNrKDEsIDkpCj4+PiAt
I2RlZmluZSBQR0Nfc3RhdGVfb2ZmbGluZWQgUEdfbWFzaygyLCA5KQo+Pj4gLSNkZWZpbmUgUEdD
X3N0YXRlX2ZyZWUgICAgUEdfbWFzaygzLCA5KQo+Pj4gLSNkZWZpbmUgcGFnZV9zdGF0ZV9pcyhw
Zywgc3QpICgoKHBnKS0+Y291bnRfaW5mbyZQR0Nfc3RhdGUpID09Cj4+PiBQR0Nfc3RhdGVfIyNz
dCkKPj4+IC0KPj4+IC0gLyogQ291bnQgb2YgcmVmZXJlbmNlcyB0byB0aGlzIGZyYW1lLiAqLwo+
Pj4gKyAvKgo+Pj4gKyAgKiBNdXR1YWxseS1leGNsdXNpdmUgcGFnZSBzdGF0ZXM6Cj4+PiArICAq
IHsgaW51c2UsIG9mZmxpbmluZywgb2ZmbGluZWQsIGZyZWUsIGJyb2tlbl9vZmZsaW5pbmcsIGJy
b2tlbiB9Cj4+PiArICAqLwo+Pj4gKyNkZWZpbmUgUEdDX3N0YXRlICAgICAgICAgICAgICAgICAg
UEdfbWFzayg3LCA5KQo+Pj4gKyNkZWZpbmUgUEdDX3N0YXRlX2ludXNlICAgICAgICAgICAgUEdf
bWFzaygwLCA5KQo+Pj4gKyNkZWZpbmUgUEdDX3N0YXRlX29mZmxpbmluZyAgICAgICAgUEdfbWFz
aygxLCA5KQo+Pj4gKyNkZWZpbmUgUEdDX3N0YXRlX29mZmxpbmVkICAgICAgICAgUEdfbWFzaygy
LCA5KQo+Pj4gKyNkZWZpbmUgUEdDX3N0YXRlX2ZyZWUgICAgICAgICAgICAgUEdfbWFzaygzLCA5
KQo+Pj4gKyNkZWZpbmUgUEdDX3N0YXRlX2Jyb2tlbl9vZmZsaW5pbmcgUEdfbWFzayg0LCA5KQo+
Pgo+PiBUQkggSSdkIHByZWZlciBQR0Nfc3RhdGVfb2ZmbGluaW5nX2Jyb2tlbiwgYXMgaXQncyBu
b3QgdGhlCj4+IG9mZmxpbmluZyB3aGljaCBpcyBicm9rZW4sIGJ1dCBhIGJyb2tlbiBwYWdlIGlz
IGJlaW5nCj4+IG9mZmxpbmVkLgo+IAo+IEl0IGlzIHRoZSBwYWdlIHdoaWNoIGlzIGJvdGggYnJv
a2VuIGFuZCBvZmZsaW5pbmcuCj4gT3IgaW5kZWVkIGl0IGlzIHRoZSBwYWdlIHdoaWNoIGlzIGJv
dGggb2ZmbGluaW5nIGFuZCBicm9rZW4uCgpJLmUuIHlvdSBhZ3JlZSB3aXRoIGZsaXBwaW5nIHRo
ZSB0d28gcGFydHMgYXJvdW5kPwoKPj4+ICsjZGVmaW5lIHBhZ2VfaXNfb2ZmbGluaW5nKHBnKSAg
ICAgIChwYWdlX3N0YXRlX2lzKChwZyksIGJyb2tlbl9vZmZsaW5pbmcpIHx8IFwKPj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYWdlX3N0YXRlX2lzKChwZyksIG9mZmxp
bmluZykpCj4+Cj4+IE92ZXJhbGwgSSB3b25kZXIgd2hldGhlciB0aGUgUEdDX3N0YXRlXyogb3Jk
ZXJpbmcgY291bGRuJ3QgYmUKPj4gYWRqdXN0ZWQgc3VjaCB0aGF0IGF0IGxlYXN0IHNvbWUgb2Yg
dGhlc2UgdGhyZWUgd29uJ3QgbmVlZAo+PiB0d28gY29tcGFyaXNvbnMgKGJ5IG1hc2tpbmcgb2Zm
IGEgYml0IGJlZm9yZSBjb21wYXJpbmcpLgo+IAo+IFRoZSB3aG9sZSBwb2ludCBpbiB0aGlzIGV4
ZXJjaXNlIGlzIHRoYXQgdGhlcmUgaXNuJ3QgYSB3aG9sZSBiaXQgZm9yCj4gdGhlc2U7IHRoZXkg
YXJlIGVhY2ggKnR3byogc3RhdGVzIG91dCBvZiB0aGUgcG9zc2libGUgOC4KClN1cmUuIEJ1dCBq
dXN0IGNvbnNpZGVyIHRoZSBtb3JlIGdlbmVyYWwgY2FzZTogSW5zdGVhZCBvZiB3cml0aW5nCgoJ
aWYgKCBpID09IDYgfHwgaSA9PSA3ICkKCnlvdSBjYW4gYXMgd2VsbCB3cml0ZQoKCWlmICggKGkg
fCAxKSA9PSA3ICkKClNpbWlsYXIgZm9yIG11bHRpcGxlID09IHZzIGEgc2luZ2xlIDw9IG9yID49
LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
