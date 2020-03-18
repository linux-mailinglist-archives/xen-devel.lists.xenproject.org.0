Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6AB18992F
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2020 11:22:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEVnZ-00006f-9N; Wed, 18 Mar 2020 10:19:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ggnj=5D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jEVnX-00006a-MV
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2020 10:19:39 +0000
X-Inumbo-ID: f21cf8d8-6901-11ea-bec1-bc764e2007e4
Received: from m9a0014g.houston.softwaregrp.com (unknown [15.124.64.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f21cf8d8-6901-11ea-bec1-bc764e2007e4;
 Wed, 18 Mar 2020 10:19:38 +0000 (UTC)
Received: FROM m9a0014g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0014g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 18 Mar 2020 10:18:29 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 18 Mar 2020 10:10:28 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 18 Mar 2020 10:10:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cw3JsfkYtfdcW2BHP6nytOZNNfqQl1Idx6ppCE5MZSjHuWMRzTXopI+TF7AhZ9LUEtgTxQeOGxyHpfCBoEkwxAfdZ/BOM7/2qSSsZl0FueNPIoldcnQomxP+hC6pV60h4a0UwRMUe0zHJXNG6YWqPEybYZx1SFgO1CFLT8gL2/qFeqzNUJp0x78x+ifzGO6OE6tumanmOnmioT7hrZiLUkW7yCsMox1qpvRqMLmaQiPapuhB6UpRWYkg9wFkiYu7dZzTSsxVDShQjhQmG5JQOc1TPW/5EUnBGlMjnm03vx9Ylm56s0AejeqQEdae+yr6X7jEYX3S0d/WmScQTcGrvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wcld2ZfKTTRh/jIufNovXWUidBTZxJEGcITVUxshAa4=;
 b=W0wT64Eq4ZeZ635DsD1zrgC4D7okdjnDfPbVgYYKjPlQ07VWZSe7nwMUmUHgiCwoLus1yaST9+0qC6dVrGeTtajMpLyjYVh8Hx2HLmLEbRXH8KposSKdJiEqROkXydL7YMr+smo3EPw2lgqPRETc+74BniibT5gp+uGS7e1HOS8h2mzlVIVMoWvNPPJhggwMBiyAX+H0hNPpI7RroIYiZ+wk+Zy+dn3tXjG1DwPO5wJWlgk+KAV34Og0qeZ0zOcmGBN+RA4RBHsVFbKQA0wIy4QsxZ2pFe+6pimoKMgOrbVwofNCHtVsyfiWy/YyyQJHxSUSEKhSHKSaaNAZ+KnLgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
Received: from MN2PR18MB3573.namprd18.prod.outlook.com (2603:10b6:208:265::8)
 by MN2PR18MB2367.namprd18.prod.outlook.com (2603:10b6:208:a9::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.18; Wed, 18 Mar
 2020 10:10:27 +0000
Received: from MN2PR18MB3573.namprd18.prod.outlook.com
 ([fe80::2c24:bc66:8596:8a7a]) by MN2PR18MB3573.namprd18.prod.outlook.com
 ([fe80::2c24:bc66:8596:8a7a%6]) with mapi id 15.20.2835.017; Wed, 18 Mar 2020
 10:10:27 +0000
To: <paul@xen.org>
References: <56f7fe21daff2dc4bf8db7ee356666233bdb0f7a.camel@infradead.org>
 <20200207155701.2781820-2-dwmw2@infradead.org>
 <cdf20919a9c1afcee2d2f63631391a701cde46ef.camel@amazon.com>
 <017D4B5F-603D-42BF-94DA-B757FF27EAF8@infradead.org>
 <2f2368f84380dd2c81bbfa310d03bc3c3f800b94.camel@amazon.com>
 <B63B9D74-EF17-4E6F-AA5D-2BEC0C3228D7@infradead.org>
 <f5b6325a469352585d7cf1d7d01d2dc4a2f2af8f.camel@infradead.org>
 <af374a90-f060-7239-5a02-c98df409819c@suse.com>
 <f320e035b9e77a565be61d7ad13c3947c1d00cb8.camel@infradead.org>
 <005f01d5fd02$b7aa2240$26fe66c0$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6bed9bf3-1d2b-286a-cd3f-55e5dd2d8efd@suse.com>
Date: Wed, 18 Mar 2020 11:10:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
In-Reply-To: <005f01d5fd02$b7aa2240$26fe66c0$@xen.org>
Content-Language: en-US
X-ClientProxiedBy: AM0PR0102CA0034.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:14::47) To MN2PR18MB3573.namprd18.prod.outlook.com
 (2603:10b6:208:265::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2003:ca:b70b:8af1:81fd:9070:7c66:aa5d]
 (2003:ca:b70b:8af1:81fd:9070:7c66:aa5d) by
 AM0PR0102CA0034.eurprd01.prod.exchangelabs.com (2603:10a6:208:14::47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.15 via Frontend
 Transport; Wed, 18 Mar 2020 10:10:25 +0000
X-Originating-IP: [2003:ca:b70b:8af1:81fd:9070:7c66:aa5d]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb16f86c-1371-49de-8ae6-08d7cb2494c1
X-MS-TrafficTypeDiagnostic: MN2PR18MB2367:
X-Microsoft-Antispam-PRVS: <MN2PR18MB2367BDCC90B95A42033938F3B3F70@MN2PR18MB2367.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 03468CBA43
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(366004)(346002)(376002)(396003)(39860400002)(199004)(4326008)(31696002)(52116002)(8676002)(8936002)(81166006)(81156014)(53546011)(6666004)(7416002)(6916009)(36756003)(54906003)(478600001)(86362001)(16526019)(2616005)(316002)(5660300002)(6486002)(66556008)(66476007)(66946007)(2906002)(186003)(31686004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB2367;
 H:MN2PR18MB3573.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EobWOeRnPsKr1PBpVrqHbQRhLoFw6bRIIioF78UjnLi6AKECDi49ikBpynMbA6YxJ50Rj4zzlfpIET35LJpt3DFlKtTfY3uv16w6zn65b2OQ3WnIcHdsx5yt7yQciTLD0GUUWksU6eIRUgy9W4c4Ik7B1Jb9IRgfazwQ6DU9vM/34zECRQ4FusnIYaRctsncj971YmFjoUkSATbIKQE47kYBt8YT/B904NOpB5Va4iKB89Qd7PkwElr25Hu3ia1Ydd44QWaV9Zx5UEVkStoqVKFfOXiuX9iP6U3lGx1m5Uyub2F6BQ2bCr0AREe2NgszB4M+UChULCZyG1Buzrk1s0e82MEkYz6su3+ZJjRk0F7GoNNIdqChm0CWOq+hWaa+UnKJVFVfytwMa+t/TdtWI1cVvB3sBKkIaxbBn5I1m70ch6UyGn78cpXixrS6QvUi
X-MS-Exchange-AntiSpam-MessageData: b/7YyxZZzP1V4m2TTy+GEr/eu1GcdO97aO1rQG+jNSdqdA6AHO+Ae8mZfkzt7zWniOIgu271ZRVyhfX+eppj9xOEHTGAvz1+myYSJaPShXrvi6CL+SycEUGXnHAL/D5WxteJHT5fxIyGG5Fq+FHGbNdClEY4RTGUzZVxCNkIQvhcV7nV17ydVnmp/MVxR3SnJabhSyhuUDXvlvwigr2F3Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: fb16f86c-1371-49de-8ae6-08d7cb2494c1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2020 10:10:27.3159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tmBFQ4itz6R5n2qzgtWSVd49oCjXCfplEKXTcR0sl44nxXd/sm12AamnOb1zc+PpnhK70HzijzUb6svhsa0/Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB2367
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
Cc: sstabellini@kernel.org, julien@xen.org, wl@xen.org, konrad.wilk@oracle.com,
 george.dunlap@eu.citrix.com, andrew.cooper3@citrix.com,
 ian.jackson@eu.citrix.com, george.dunlap@citrix.com,
 jeff.kubascik@dornerworks.com, "'Xia, Hongyan'" <hongyxia@amazon.com>,
 stewart.hildebrand@dornerworks.com, xen-devel@lists.xenproject.org,
 'David Woodhouse' <dwmw2@infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDMuMjAyMCAwOTo1MywgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxpc3Rz
LnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgRGF2aWQgV29vZGhvdXNlCj4+IFNlbnQ6IDE3
IE1hcmNoIDIwMjAgMjI6MTUKPj4KPj4gT24gVGh1LCAyMDIwLTAyLTIwIGF0IDEyOjU5ICswMTAw
LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IE9uIDA3LjAyLjIwMjAgMTk6MDQsIERhdmlkIFdvb2Ro
b3VzZSB3cm90ZToKPj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvbW0uYwo+Pj4+ICsrKyBiL3hlbi9h
cmNoL3g4Ni9tbS5jCj4+Pj4gQEAgLTQ4OCw3ICs0ODgsOCBAQCB2b2lkIHNoYXJlX3hlbl9wYWdl
X3dpdGhfZ3Vlc3Qoc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSwgc3RydWN0IGRvbWFpbiAqZCwKPj4+
Pgo+Pj4+ICAgICAgIHBhZ2Vfc2V0X293bmVyKHBhZ2UsIGQpOwo+Pj4+ICAgICAgIHNtcF93bWIo
KTsgLyogaW5zdGFsbCB2YWxpZCBkb21haW4gcHRyIGJlZm9yZSB1cGRhdGluZyByZWZjbnQuICov
Cj4+Pj4gLSAgICBBU1NFUlQoKHBhZ2UtPmNvdW50X2luZm8gJiB+UEdDX3hlbl9oZWFwKSA9PSAw
KTsKPj4+PiArICAgIEFTU0VSVCgocGFnZS0+Y291bnRfaW5mbyAmIH5QR0NfeGVuX2hlYXApID09
IFBHQ19zdGF0ZV9pbnVzZSB8fAo+Pj4+ICsgICAgICAgICAgIChwYWdlLT5jb3VudF9pbmZvICYg
flBHQ194ZW5faGVhcCkgPT0gUEdDX3N0YXRlX3VuaW5pdGlhbGlzZWQpOwo+Pj4KPj4+IENhbiB1
bmluaXRpYWxpemVkIHBhZ2VzIHJlYWxseSBtYWtlIGl0IGhlcmU/Cj4+Cj4+IFllcCwgd2Ugc2hh
cmUgdGhlIGxvdyAxTWlCIHdpdGggZG9tX2lvLgo+Pgo+IAo+IE9PSSBhbnlvbmUga25vdyB3aHkg
d2UgZG8gdGhpcz8gSXMgaXQgYWN0dWFsbHkgbmVjZXNzYXJ5PwoKWWVzLCBmb3IgRG9tMCB0byBi
ZSBhYmxlIHRvIGFjY2VzcyB0aGluZ3MgbGlrZSBFQkRBLCBJQkZULCBvciBkYXRhCmZvdW5kIGlu
IEJJT1Mgc3BhY2UuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
