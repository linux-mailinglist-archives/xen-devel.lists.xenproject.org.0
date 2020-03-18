Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E31201899B2
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2020 11:41:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEW5W-000252-T5; Wed, 18 Mar 2020 10:38:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ggnj=5D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jEW5V-00024x-Vq
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2020 10:38:14 +0000
X-Inumbo-ID: 8d22e6b0-6904-11ea-babd-12813bfff9fa
Received: from m4a0072g.houston.softwaregrp.com (unknown [15.124.2.130])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8d22e6b0-6904-11ea-babd-12813bfff9fa;
 Wed, 18 Mar 2020 10:38:13 +0000 (UTC)
Received: FROM m4a0072g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0072g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 18 Mar 2020 10:36:56 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 18 Mar 2020 10:28:58 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 18 Mar 2020 10:28:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T0lIAH4i2JK0cqnj7BY94PwrPtS+VKhMrJ+/wN+Mz4z8lIelk5Gqr7vcjcUZYXJtyE6zU2q+dhX9hrr6kadPG7hgViFo8B4J+B7IKTAw9hG4raKskQmazjzQycjRQ5egyJ56j57fIh8qX0djzhlNqHDGdLoEbF5NH1hH59e9OP3GHwSePD5/FFYMHsEoPh7BWEhjXR11ux0J7K/7u1vzzUoXZPeC0rnF4zXt95rYmMThhC+DnVOgtB5QtH1FaCvUaMQdyspvfcR7osvHLBoqhTY5FoXN6uu2PypMm64mXvrks/wjc0/Uf0WFhTk/GQOe0yWJfoOHgGvt7ACq3nZdqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+RurKaGcZiVLRlLi7oveAHpwqSwgfbfVbthqF1dOwI=;
 b=BD8mfdEul9PgcrV8lQzrMn21tV4YXflsdU6tj3hMBoZPEoIH281sWg/EKgZha7pHsMTAOl5Dd3zTcu9BQYeQmjv5NHEO9N1P4KyCbahleRACWf6ZN0i+GrXju4LRUyBfaamEusgUnZNzjIlGpQw78Mp7JZ6qefcg5zg2iQ1gB+5qdeanWVoXcboFrphhop4Qcm40uGxKnkKjZS+fLpoNVfmnLW7em1BqQA4yru2vJYfNgcQ7aTRoyejFkokMPs6zJFqd1AUeAVStQYfDUx5OOG63W7qex/94XaoOUMD/nXjyOcHH3+HK/OWfeca9kg0Z2EY1/UfabQFrZTx5qG8vgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
Received: from MN2PR18MB3573.namprd18.prod.outlook.com (2603:10b6:208:265::8)
 by MN2PR18MB2925.namprd18.prod.outlook.com (2603:10b6:208:38::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.22; Wed, 18 Mar
 2020 10:28:55 +0000
Received: from MN2PR18MB3573.namprd18.prod.outlook.com
 ([fe80::2c24:bc66:8596:8a7a]) by MN2PR18MB3573.namprd18.prod.outlook.com
 ([fe80::2c24:bc66:8596:8a7a%6]) with mapi id 15.20.2835.017; Wed, 18 Mar 2020
 10:28:55 +0000
To: Jason Andryuk <jandryuk@gmail.com>
References: <cfbb5553-b9dc-ee86-145f-3cab92289c4d@suse.com>
 <20200317152310.114567-1-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b7965c1c-8e6a-a133-5e2c-0640b4b0e60c@suse.com>
Date: Wed, 18 Mar 2020 11:28:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
In-Reply-To: <20200317152310.114567-1-jandryuk@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR10CA0055.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::35) To MN2PR18MB3573.namprd18.prod.outlook.com
 (2603:10b6:208:265::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2003:ca:b70b:8af1:81fd:9070:7c66:aa5d]
 (2003:ca:b70b:8af1:81fd:9070:7c66:aa5d) by
 AM0PR10CA0055.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.18 via Frontend
 Transport; Wed, 18 Mar 2020 10:28:54 +0000
X-Originating-IP: [2003:ca:b70b:8af1:81fd:9070:7c66:aa5d]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4d40211-ac7c-42a2-f52e-08d7cb272917
X-MS-TrafficTypeDiagnostic: MN2PR18MB2925:
X-Microsoft-Antispam-PRVS: <MN2PR18MB29259BADF948C9465F4981DBB3F70@MN2PR18MB2925.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 03468CBA43
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(366004)(39860400002)(346002)(376002)(396003)(199004)(6486002)(316002)(186003)(2616005)(478600001)(31696002)(16526019)(6666004)(2906002)(86362001)(66556008)(66946007)(8936002)(53546011)(8676002)(31686004)(81166006)(81156014)(6916009)(5660300002)(36756003)(4326008)(52116002)(66476007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB2925;
 H:MN2PR18MB3573.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fn10YksUYIpZLeO/Dy7p/5gO9BXmpLyvAB2n07aKLvCgKq4Rfgp19XZX6BBW15U5G0vPYwsJCExTGMuIRcQLQNPT47cVDeY/AOVQBH6yHkBmRx9fMrtRpreRHsFR0Vbu/StI3P8YlMTS9TT/J3EMmEtYIpJwpBW91rNvhKs/JqN/rjGqu30EabqK6hIH6vu/8jz5qKd3kc1ZNSZbK0p+Y7x2mgWe9Gg0MISQCC+TAlGQWT+7V9FFZBti9qSfOAjQKv0EGEc5jSx80PgVoCYKQZov4QIPK0zXNlXf2R9hqUkGS/pk0+QngluRQo7Jw5qfojgvaJl4rTUif9z7n7luy5jfh5pSe0/FJOJjeqPR9VIIpQzjQHq/RAQVMXTOVskswhWlgyPiOhofaAjCNsf8mAa58BKHjt/R8R5cl7Q9RKjfSaHqtuikNSPJdOZegzEd
X-MS-Exchange-AntiSpam-MessageData: zelfKkX7nETt1F35Rfr09iD/5C9ygtrem95PAheQCwVhtBvBwD1IV+9upYhZMK6MBWsODihokRSU3wDx3rHGSlszrGg9MGttyu1FXe2txepOPj9Go78J5AIfKKs7G4eG2JfsNPAn9jyBQ8hTwdzNvaiwBaB9a+leP3ymmnn7sEzb+23xgGE+I49BQ/AcKrGyQBGELBxGn5mSzM1Gd7yaSw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b4d40211-ac7c-42a2-f52e-08d7cb272917
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2020 10:28:55.1585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rIzhn+jrEhN7GfioAnadxQkiSHBRt4de427VKMVKLiI68xyqIg+lDB3Iav6BUtpIbamIsOSpYiecjPGORK2zKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB2925
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [BUG] panic: "IO-APIC + timer doesn't work" -
 several people have reproduced
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
Cc: andrew.cooper3@citrix.com, aaron@ajanse.me, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDMuMjAyMCAxNjoyMywgSmFzb24gQW5kcnl1ayB3cm90ZToKPiBPbiAxNy4wMy4yMDIw
IDE1OjA4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTcuMDMuMjAyMCAxNTowOCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAxNy4wMy4yMDIwIDE0OjQ4LCBKYXNvbiBBbmRyeXVrIHdyb3Rl
Ogo+Pj4+IEkgZ290IGl0IHRvIGJvb3QgcGFzdCAiSU8tQVBJQyArIHRpbWVyIGRvZXNuJ3Qgd29y
ayIuICBJIHByb2dyYW1tZWQKPj4+PiB0aGUgSFBFVCB0byBwcm92aWRlIGEgcGVyaW9kaWMgdGlt
ZXIgaW4gaHBldF9yZXN1bWUoKSBvbiBUMC4gIFdoZW4gSQo+Pj4+IGFjdHVhbGx5IGdvdCBpdCBw
cm9ncmFtbWVkIHByb3Blcmx5LCBpdCB3b3JrZWQgdG8gaW5jcmVtZW50Cj4+Pj4gcGl0MF90aWNr
cy4gIEkgYWxzbyBtYWRlIHRpbWVyX2ludGVycnVwdCgpIHVuY29uZGl0aW9uYWxseQo+Pj4+IHBp
dDBfdGlja3MrKyB0aG91Z2ggdGhhdCBtYXkgbm90IG1hdHRlci4KPj4+Cj4+PiBIbW0sIGF0IHRo
ZSBmaXJzdCBnbGFuY2UgSSB3b3VsZCBpbXBseSB0aGUgc3lzdGVtIGdldHMgaGFuZGVkIHRvIFhl
bgo+Pj4gd2l0aCBhIEhQRVQgc3RhdGUgdGhhdCB3ZSBkb24ndCAoYW5kIHByb2JhYmx5IGFsc28g
c2hvdWxkbid0KSBleHBlY3QuCj4+PiBDb3VsZCB5b3UgcHJvdmlkZSBIUEVUX0NGRyBhcyB3ZWxs
IGFzIGFsbCBIUEVUX1RuX0NGRyBhbmQKPj4+IEhQRVRfVG5fUk9VVEUgdmFsdWVzIGFzIGhwZXRf
cmVzdW1lKCkgZmluZHMgdGhlbSBiZWZvcmUgZG9pbmcgYW55Cj4+PiBhZGp1c3RtZW50cyB0byB0
aGVtPyBXaGF0IGFyZSB0aGUgY29tcG9uZW50cyAvIHBhcnRpZXMgaW52b2x2ZWQgaW4KPj4+IGdl
dHRpbmcgWGVuIGxvYWRlZCBhbmQgc3RhcnRlZD8KPj4KPj4gT2YgY291cnNlIG11Y2ggZGVwZW5k
cyBvbiB3aGF0IGV4YWN0bHkgeW91IG1lYW4geW91J3ZlIGRvbmUgdG8KPj4gdGhlIEhQRVQgYnkg
c2F5aW5nICJJIHByb2dyYW1tZWQgdGhlIEhQRVQgdG8gcHJvdmlkZSAuLi4iLgo+IAo+IEJlbG93
IGlzIHRoZSBkaWZmLiAgSXQgd2FzIG1lc3NpZXIgYW5kIEkgdGlkaWVkIGl0IHVwIHNvbWUuCj4g
Cj4gSXQncyBtYWlubHkgdGhlIGNoYW5nZSB0byBocGV0X3Jlc3VtZSgpIHRvIG1pbWljIExpbnV4
J3MgbGVnYWN5IEhQRVQKPiBzZXR1cCBvbiBUMC4gIEl0IHR1cm5zIG9uIEhQRVRfQ0ZHX0xFR0FD
WSB0byBlbnN1cmUgdGhlIHRpbWVyIGludGVycnVwdAo+IGlzIHJ1bm5pbmcuICBBbmQgaXQgYWxz
byBpbmNsdWRlcyB0aGUgcHJpbnRpbmcgb2YgdGhlIGluaXRpYWwgSFBFVAo+IGNvbmZpZzoKPiBI
UEVUX0NGRyAwMDAwMDAwMQo+IEhQRVRfVDBfQ0ZHIDAwMDA4MDMwCj4gSFBFVF9UMF9ST1VURSAw
MDAwMDE2Ywo+IEhQRVRfVDFfQ0ZHIDAwMDA4MDAwCj4gSFBFVF9UMV9ST1VURSAwMDAwMDAwMAo+
IEhQRVRfVDJfQ0ZHIDAwMDA4MDAwCj4gSFBFVF9UMl9ST1VURSAwMDAwMDAwMAo+IEhQRVRfVDNf
Q0ZHIDAwMDA4MDAwCj4gSFBFVF9UM19ST1VURSAwMDAwMDAwMAo+IEhQRVRfVDRfQ0ZHIDAwMDBj
MDAwCj4gSFBFVF9UNF9ST1VURSAwMDAwMDAwMAo+IEhQRVRfVDVfQ0ZHIDAwMDBjMDAwCj4gSFBF
VF9UNV9ST1VURSAwMDAwMDAwMAo+IEhQRVRfVDZfQ0ZHIDAwMDBjMDAwCj4gSFBFVF9UNl9ST1VU
RSAwMDAwMDAwMAo+IEhQRVRfVDdfQ0ZHIDAwMDBjMDAwCj4gSFBFVF9UN19ST1VURSAwMDAwMDAw
MAo+IAo+IE90aGVyIGNoYW5nZXMgYXJlIHRvIHRyeSB0byBwcmV2ZW50IFhlbiBmcm9tIGNsb2Ji
ZXJpbmcgVDAgYXMgYSBwZXJpb2RpYwo+IHRpbWVyLgoKV2h5ICJjbG9iYmVyaW5nIj8gQWNjb3Jk
aW5nIHRvIHRoZSB2YWx1ZXMgYWJvdmUgVDAgaXMgbmVpdGhlciBlbmFibGVkCm5vciBzZXQgdG8g
cGVyaW9kaWMuCgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9ocGV0LmMKPiArKysgYi94ZW4vYXJjaC94
ODYvaHBldC5jCj4gQEAgLTU4NSwxNiArNTg1LDI3IEBAIHZvaWQgX19pbml0IGhwZXRfYnJvYWRj
YXN0X2luaXQodm9pZCkKPiAgICAgICAgICAgICAgIHB2X3J0Y19oYW5kbGVyID0gaGFuZGxlX3J0
Y19vbmNlOwo+ICAgICAgIH0KPiAgIAo+ICsgICAgcHJpbnRrKFhFTkxPR19JTkZPICIlcyBjZmcg
JWRcbiIsIF9fZnVuY19fLCBjZmcpOwo+ICAgICAgIGhwZXRfd3JpdGUzMihjZmcsIEhQRVRfQ0ZH
KTsKPiAgIAo+ICAgICAgIGZvciAoIGkgPSAwOyBpIDwgbjsgaSsrICkKPiAgICAgICB7Cj4gLSAg
ICAgICAgaWYgKCBpID09IDAgJiYgKGNmZyAmIEhQRVRfQ0ZHX0xFR0FDWSkgKQo+ICsgICAgICAg
IHByaW50ayhYRU5MT0dfSU5GTyAiaHBldCBjZmcgJWQgbGVnYWN5ICVkXG4iLCBpLCBjZmcgJiBI
UEVUX0NGR19MRUdBQ1kpOwo+ICsgICAgICAgIGlmICggaSA9PSAxICYmIChjZmcgJiBIUEVUX0NG
R19MRUdBQ1kpICkKPiAgICAgICAgICAgewo+ICAgICAgICAgICAgICAgLyogc2V0IEhQRVQgVDAg
YXMgb25lc2hvdCAqLwo+IC0gICAgICAgICAgICBjZmcgPSBocGV0X3JlYWQzMihIUEVUX1RuX0NG
RygwKSk7Cj4gKyAgICAgICAgICAgIGNmZyA9IGhwZXRfcmVhZDMyKEhQRVRfVG5fQ0ZHKDEpKTsK
PiAgICAgICAgICAgICAgIGNmZyAmPSB+KEhQRVRfVE5fTEVWRUwgfCBIUEVUX1ROX1BFUklPRElD
KTsKPiAgICAgICAgICAgICAgIGNmZyB8PSBIUEVUX1ROX0VOQUJMRSB8IEhQRVRfVE5fMzJCSVQ7
Cj4gKyAgICAgICAgICAgIGhwZXRfd3JpdGUzMihjZmcsIEhQRVRfVG5fQ0ZHKDEpKTsKPiArICAg
ICAgICB9Cj4gKwo+ICsgICAgICAgIGlmICggaSA9PSAwICYmIChjZmcgJiBIUEVUX0NGR19MRUdB
Q1kpICkKPiArICAgICAgICB7Cj4gKyAgICAgICAgICAgIC8qIHNldCBIUEVUIFQwIGFzIHBlcmlv
ZGljICovCj4gKyAgICAgICAgICAgIGNmZyA9IGhwZXRfcmVhZDMyKEhQRVRfVG5fQ0ZHKDApKTsK
PiArICAgICAgICAgICAgY2ZnIHw9IChIUEVUX1ROX0xFVkVMIHwgSFBFVF9UTl9QRVJJT0RJQyk7
CgpBIGNoYW5nZSBsaWtlIHRoaXMgb2YgY291cnNlIHdvbid0IGJlIGFjY2VwdGFibGUgb3V0c2lk
ZSBvZgp5b3VyIG93biByZXBvLCBidXQgSSBhc3N1bWUgeW91J3JlIGNsZWFyIGFib3V0IHRoaXMu
CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
