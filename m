Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE229189650
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2020 08:46:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jETN1-0004E2-Or; Wed, 18 Mar 2020 07:44:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ggnj=5D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jETN0-0004Dx-4f
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2020 07:44:06 +0000
X-Inumbo-ID: 3c3e369b-68ec-11ea-baa2-12813bfff9fa
Received: from m9a0014g.houston.softwaregrp.com (unknown [15.124.64.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3c3e369b-68ec-11ea-baa2-12813bfff9fa;
 Wed, 18 Mar 2020 07:44:02 +0000 (UTC)
Received: FROM m9a0014g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0014g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 18 Mar 2020 07:42:56 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 18 Mar 2020 07:37:43 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 18 Mar 2020 07:37:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QsxZ348CuOaXbssiteIuebA6S/wvWdoLkR23BPodQ16etHpFfAd+BKyn/q/swTk8yxUUDkk8Qjkz+E9RATwwdu/IaMRsllooYj9hib/OGTX0XbWtPhvEbD7tP8WXo+kd/oAWflVfrNaNS+hcNFC+an1S+PKmcBFwna3JVsPiniVgNl+Ot+Rd3f62kMDSWrAkufRJnmquyHVcgSLViUiwznhKQK5qYlteYBox2JSwf60SrCRZ2jYAc4VgkTz+gkL8upDxshxiRLAkVUCxrbI+4oxbHwtZQEOs9zyN8o4GZLgV8pYlLWrDQ830oIavTBK4ZckCTtgNxUyDyWTC96Dh1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6tgiRTbrcF2OkICiqUrKGpanjybbNjBbpeHFfaLUE50=;
 b=fKxtqOMzgGn4IbFb5wVXzyHm+gl4WkVWNQ1MW7U1T45s5NPY0SCdPDTTyJpVhs24naTZ+SuEUL6ZhE6mC6EYt+nyILGsZObOHq48HcxkkSGE4wXPa5iRNvPA5uYVrAWco7UvkMkw7DygzDF95Rd59wwxvltmycu16Wn6toMmKbIr/x5huKYXUhfPprh7uxP1vvw9m/mkn+k0ZCrEisAPx2I+jxrDEsbvtwlsUxvcWfZ8zGNQwHeAwT2NfWuYakS1JRQjoK7XtUCxmiU/F3/wFTYCWLDPvJIqIY/L3gm7wEexhQ9EU3G24pTTqWnDG3FehVK5ylaTh9Uzs0aAvA/pxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
Received: from MN2PR18MB3573.namprd18.prod.outlook.com (2603:10b6:208:265::8)
 by MN2PR18MB2991.namprd18.prod.outlook.com (2603:10b6:208:a4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.18; Wed, 18 Mar
 2020 07:37:41 +0000
Received: from MN2PR18MB3573.namprd18.prod.outlook.com
 ([fe80::2c24:bc66:8596:8a7a]) by MN2PR18MB3573.namprd18.prod.outlook.com
 ([fe80::2c24:bc66:8596:8a7a%6]) with mapi id 15.20.2835.017; Wed, 18 Mar 2020
 07:37:41 +0000
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20200313130614.27265-1-jgross@suse.com>
 <20200313130614.27265-4-jgross@suse.com>
 <d6bad3fd-93b7-5835-4c46-dd2382dfd67e@suse.com>
 <388ab30a-f4ce-113a-aefd-7ad4b0124f9e@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f0d87b5a-d55b-7761-c36c-e3d38a873945@suse.com>
Date: Wed, 18 Mar 2020 08:37:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
In-Reply-To: <388ab30a-f4ce-113a-aefd-7ad4b0124f9e@suse.com>
Content-Language: en-US
X-ClientProxiedBy: AM4P190CA0014.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:200:56::24) To MN2PR18MB3573.namprd18.prod.outlook.com
 (2603:10b6:208:265::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2003:ca:b70b:8af1:81fd:9070:7c66:aa5d]
 (2003:ca:b70b:8af1:81fd:9070:7c66:aa5d) by
 AM4P190CA0014.EURP190.PROD.OUTLOOK.COM (2603:10a6:200:56::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.15 via Frontend Transport; Wed, 18 Mar 2020 07:37:40 +0000
X-Originating-IP: [2003:ca:b70b:8af1:81fd:9070:7c66:aa5d]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7906af86-1f93-4949-40c5-08d7cb0f3d6b
X-MS-TrafficTypeDiagnostic: MN2PR18MB2991:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR18MB2991B65600BE609CC09156C1B3F70@MN2PR18MB2991.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 03468CBA43
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(199004)(5660300002)(36756003)(478600001)(2616005)(2906002)(8936002)(86362001)(16526019)(31696002)(6666004)(8676002)(6636002)(186003)(66574012)(81166006)(81156014)(66476007)(66556008)(66946007)(6486002)(52116002)(316002)(31686004)(6862004)(4326008)(54906003)(37006003)(53546011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB2991;
 H:MN2PR18MB3573.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xHviR8q1UIrbxT6Xh9sPa8NMMTPXJDrXGPqKClCjjIh1gBeOt12XlY6rcG60aNqv2STlDgifEi88N5Lk8EQXlEYE+DFeeAJFst/174GYcrGlp27iWCpmnz6fKv9gMqsSuCozJdK1Q25c9WQKC9ebC2gqxsH+JFLSo3meIWEKfixX/8ftdSLS6yyzRx07RMLXIFo0vKWN38hQKZeVUzAV5SXfyv9Xtro8avv48GkHA1fxa9CgPCbGcFS7l53Lonm6dWTt7t/gjk0V4wZAHsFgpjft8pEOYom0yBXDkbCF+v22JTUoJ1Ca2A7CpQUVUoYxFusUwm4VFXtlqfeo40IKhUtlt1OsGh0Qz2nwRLT34Yf4lmw8RA9ZveTq3xw9kNF55pWfUF2/Sdw7Cr8VsqiFPmhgkrvLrz1i5ysYI4bu18Wc302fpnfXAhqQQ55R+YyG
X-MS-Exchange-AntiSpam-MessageData: Q3HZ4PJdkS7t+l/gwzDBuECAGOujIhNhBkPQw+U/NhUtgBhVtm7ubIRsEEtaTpFEuTQS/E4+xo2chh1oQ/lxm9NEvPIGBef9JchEAQuRU7WoQ/zpBj2l++KGZHgbiYlfaMEV2VtmwDocwAVxsGHkkF9d4fTb70YqWm9gtVKvf69D7D8TzfWX5v8WKcZ3cLhWm9kHo6S8+y1fQa2qbcNIGg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7906af86-1f93-4949-40c5-08d7cb0f3d6b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2020 07:37:41.8103 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DAjC+4hbT/KPz0EHQN7M7phCxTNvU54Tflf5gOYLwyDUJd/3Qgx7WDCfIHjr/zLaIN4UPB5PexMZfWoTWr7g9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB2991
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v6 3/4] xen/rcu: add assertions to debug
 build
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDMuMjAyMCAwNzoyNiwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAxNy4wMy4yMCAx
NTozNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDEzLjAzLjIwMjAgMTQ6MDYsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiBYZW4ncyBSQ1UgaW1wbGVtZW50YXRpb24gcmVsaWVzIG9uIG5vIHNv
ZnRpcnEgaGFuZGxpbmcgdGFraW5nIHBsYWNlCj4+PiB3aGlsZSBiZWluZyBpbiBhIFJDVSBjcml0
aWNhbCBzZWN0aW9uLiBBZGQgQVNTRVJUKClzIGluIGRlYnVnIGJ1aWxkcwo+Pj4gaW4gb3JkZXIg
dG8gY2F0Y2ggYW55IHZpb2xhdGlvbnMuCj4+Pgo+Pj4gRm9yIHRoYXQgcHVycG9zZSBtb2RpZnkg
cmN1X3JlYWRfW3VuXWxvY2soKSB0byB1c2UgYSBkZWRpY2F0ZWQgcGVyY3B1Cj4+PiBjb3VudGVy
IGFkZGl0aW9uYWwgdG8gcHJlZW1wdF9bZW58ZGlzXWFibGUoKSBhcyB0aGlzIGVuYWJsZXMgdG8g
dGVzdAo+Pj4gdGhhdCBjb25kaXRpb24gaW4gX19kb19zb2Z0aXJxKCkgKEFTU0VSVF9OT1RfSU5f
QVRPTUlDKCkgaXMgbm90Cj4+PiB1c2FibGUgdGhlcmUgZHVlIHRvIF9fY3B1X3VwKCkgY2FsbGlu
ZyBwcm9jZXNzX3BlbmRpbmdfc29mdGlycXMoKQo+Pj4gd2hpbGUgaG9sZGluZyB0aGUgY3B1IGhv
dHBsdWcgbG9jaykuCj4+Pgo+Pj4gV2hpbGUgYXQgaXQgc3dpdGNoIHRoZSByY3VfcmVhZF9bdW5d
bG9jaygpIGltcGxlbWVudGF0aW9uIHRvIHN0YXRpYwo+Pj4gaW5saW5lIGZ1bmN0aW9ucyBpbnN0
ZWFkIG9mIG1hY3Jvcy4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jv
c3NAc3VzZS5jb20+Cj4+Cj4+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+Cj4+IHdpdGggb25lIHJlbWFyazoKPj4KPj4+IEBAIC05MSwxNiArMTE0LDIzIEBAIHR5
cGVkZWYgc3RydWN0IF9yY3VfcmVhZF9sb2NrIHJjdV9yZWFkX2xvY2tfdDsKPj4+IMKgwqAgKiB3
aWxsIGJlIGRlZmVycmVkIHVudGlsIHRoZSBvdXRlcm1vc3QgUkNVIHJlYWQtc2lkZSBjcml0aWNh
bCBzZWN0aW9uCj4+PiDCoMKgICogY29tcGxldGVzLgo+Pj4gwqDCoCAqCj4+PiAtICogSXQgaXMg
aWxsZWdhbCB0byBibG9jayB3aGlsZSBpbiBhbiBSQ1UgcmVhZC1zaWRlIGNyaXRpY2FsIHNlY3Rp
b24uCj4+PiArICogSXQgaXMgaWxsZWdhbCB0byBwcm9jZXNzIHNvZnRpcnFzIHdoaWxlIGluIGFu
IFJDVSByZWFkLXNpZGUgY3JpdGljYWwgc2VjdGlvbi4KPj4KPj4gVGhlIGxhdGVzdCB3aXRoIHRo
ZSByZS1hZGRlZCBwcmVlbXB0X2Rpc2FibGUoKSwgd291bGRuJ3QgdGhpcyBiZXR0ZXIKPj4gc2F5
ICIuLi4gdG8gcHJvY2VzcyBzb2Z0aXJxcyBvciBibG9jayAuLi4iPwo+IAo+IEkgY2FuIGFkZCB0
aGlzLCBidXQgT1RPSCBibG9ja2luZyB3aXRob3V0IHByb2Nlc3Npbmcgc29mdGlycXMgaXMgbm90
Cj4gcG9zc2libGUsIGFzIHRoZXJlIGlzIG5vIG90aGVyIChsZWdhbCkgd2F5IHRvIGVudGVyIHRo
ZSBzY2hlZHVsZXIuCgpTdXJlLCBidXQgdGhhdCdzIHN0aWxsIGltcGxpY2l0LCBidXQgY291bGQg
ZG8gd2l0aCBzYXlpbmcgZXhwbGljaXRseS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
