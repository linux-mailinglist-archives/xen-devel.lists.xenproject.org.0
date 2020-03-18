Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FAD189984
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2020 11:32:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEVxm-0001jl-P4; Wed, 18 Mar 2020 10:30:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ggnj=5D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jEVxk-0001jg-MP
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2020 10:30:12 +0000
X-Inumbo-ID: 71b3ea4c-6903-11ea-babd-12813bfff9fa
Received: from m4a0072g.houston.softwaregrp.com (unknown [15.124.2.130])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 71b3ea4c-6903-11ea-babd-12813bfff9fa;
 Wed, 18 Mar 2020 10:30:11 +0000 (UTC)
Received: FROM m4a0072g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0072g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 18 Mar 2020 10:28:56 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 18 Mar 2020 10:20:52 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 18 Mar 2020 10:20:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c4f8S6wA8/+nwcN5u2MKyhsCXu2nS4jZ0PDXDXDOlY3FT3QPsctywr8rPUV11lxcxxwmJqkZDvLIvDReZVGP5wAoN6Cx3QRvkZCzkIxwKb59aYGP+mzSxBAlRgxvKcpXG+oKE3o2AZs5A6dqUOMiUpxg58D5DCeABMQh/09Wx30LQ3dEFqELd0aM5IttvMdH+qkawktyJNS+ainfViXoFlYqFPL+w/aF1C0Qanj60cuBB5WqzU7Jd1x9UVKkBzPjbPeIaO1BzrFZkrNl9bfrujGCXxkiZguDumvxhBImauI1Ogs1FwCRJpzmg42g+qehQ+ZZvMke2CdQuVwWSRFAXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qzwy+/6WjmvFeqvwH006gCRzGb6dSQBcl0noLPZMSlw=;
 b=I2t5ho4puen4A2npp6bc+5CjuuJXUUe/2ranIiftoYTtRGKcwL2uJUKdKizMoUCRmIl0UcMJwkCqy0qWR98o41B7GHOBymWMHcmTuip0zEpNX+9T8o/H9iPAa8oLwTUoHj7TeEKs6BZD3PIb17WoJNrxf6pIzBGlr/PBCZtfSwPuZACxoltYe9f/Q/hxo5dKmPgkvo75CWFrBt4KIFVjEzXNpX2q7TuzK1bJBmxxsGvdwnFs69Gvyc7zpx8/x9eyvgOBFYH5/Zd9uRsaAuVdmDcExHrT5hfPzpYrcktfVWOByKn2qn7icAz9XXJdiFoz/P94gGT5fw3qcdxlzXUdXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
Received: from MN2PR18MB3573.namprd18.prod.outlook.com (2603:10b6:208:265::8)
 by MN2PR18MB3166.namprd18.prod.outlook.com (2603:10b6:208:16a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.21; Wed, 18 Mar
 2020 10:20:51 +0000
Received: from MN2PR18MB3573.namprd18.prod.outlook.com
 ([fe80::2c24:bc66:8596:8a7a]) by MN2PR18MB3573.namprd18.prod.outlook.com
 ([fe80::2c24:bc66:8596:8a7a%6]) with mapi id 15.20.2835.017; Wed, 18 Mar 2020
 10:20:51 +0000
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
 <20200226113355.2532224-16-anthony.perard@citrix.com>
 <dd7bf903-6f51-7610-3963-2b572a6bde49@suse.com>
 <20200317183503.GB4088@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fffc904e-bbc2-f19c-7a76-cdbaf56a0cba@suse.com>
Date: Wed, 18 Mar 2020 11:20:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
In-Reply-To: <20200317183503.GB4088@perard.uk.xensource.com>
Content-Language: en-US
X-ClientProxiedBy: ZR0P278CA0049.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::18) To MN2PR18MB3573.namprd18.prod.outlook.com
 (2603:10b6:208:265::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2003:ca:b70b:8af1:81fd:9070:7c66:aa5d]
 (2003:ca:b70b:8af1:81fd:9070:7c66:aa5d) by
 ZR0P278CA0049.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1d::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.15 via Frontend Transport; Wed, 18 Mar 2020 10:20:49 +0000
X-Originating-IP: [2003:ca:b70b:8af1:81fd:9070:7c66:aa5d]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3bf0f6a-ab24-4a16-6e71-08d7cb2608b5
X-MS-TrafficTypeDiagnostic: MN2PR18MB3166:
X-Microsoft-Antispam-PRVS: <MN2PR18MB31665C98382774495EC33170B3F70@MN2PR18MB3166.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 03468CBA43
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(376002)(39860400002)(346002)(136003)(396003)(199004)(52116002)(6916009)(5660300002)(2906002)(36756003)(2616005)(4326008)(53546011)(81156014)(7416002)(16526019)(186003)(6486002)(81166006)(31696002)(6666004)(8936002)(66476007)(66946007)(66556008)(8676002)(54906003)(31686004)(86362001)(316002)(478600001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB3166;
 H:MN2PR18MB3573.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4onl2ckUn7QEW7ZmnfNDymOY21+ZVhI9XtZ8ELxwI4p6iN58TdmOvmRYAwmPh7p0vvPp/8zHawbSr2sfV+FS2uqcp05YX5HUT+xmx3YF7Um4nfAukUAAmj0FozdmSfJNuKTiZmFXeyU3Ow+bpOmjPIX/d7Nv56V8YstlV0RHtVQUHkMie6uvTPyMFZXbJnN7SILo/+Ttcdfl+ILTXg8x6iIhWGq/jVS1YFITZz+jFAS/7SEM0p9NNacM8l+CeRM1yEl+xn4t79hN8BFS8CdqmL806u/AtVXOoRtfMNqMQUyQXLmbynKZoOPVJuzvqQBR9zUGz7ToJMaLCJfObax8nOvagpKDhh2ncKUdZlQuCmippP/Oh+V56I/431XRZD1z4XdKBaHMEP7FRH89f8wvXEtt/Mq2RyDXacYnsAIYBbha+OqBv5Px1Oy05X1d3z1R
X-MS-Exchange-AntiSpam-MessageData: 1VBj5UaKZldOFER6nzphrV6Jz4c4aj8knlw3qke1w82hU0FY/WMGFQtFyZ1uTz/QKmHfunSsy4WCLdFDBtLUSE0yEUzR8JqZOLuWSYDWWglRVoZuV021bF3xtK01oUt96BGtvLVR3lss+d08+7r6T78jmDBCYx6ILwWmLcVH313M/6n/irINRMjZ/L0l9Vc5KJd1LYkgj30LZ1BLn3sJHA==
X-MS-Exchange-CrossTenant-Network-Message-Id: c3bf0f6a-ab24-4a16-6e71-08d7cb2608b5
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2020 10:20:51.3469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F/CBTG3ZU8JiexjBlMcehKrTgf6p4f50Z++WJlYGW5d7YIctNQ2UIF+cofqcyO+nuhpz0jsvINPLOrjSJTOMqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB3166
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [XEN PATCH v3 15/23] xen/build: have the root
 Makefile generates the CFLAGS
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDMuMjAyMCAxOTozNSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gT24gV2VkLCBNYXIg
MDQsIDIwMjAgYXQgMDQ6MDA6NTJQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDI2
LjAyLjIwMjAgMTI6MzMsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+Pj4gQEAgLTExMyw2ICsxMTUs
NjQgQEAgJChLQ09ORklHX0NPTkZJRyk6Cj4+PiArQUZMQUdTICs9IC1EX19BU1NFTUJMWV9fCj4+
PiArCj4+PiArQ0ZMQUdTICs9ICQoQ0ZMQUdTLXkpCj4+Cj4+IEkgY2FuJ3Qgc2VlbSB0byBiZSBh
YmxlIHRvIHNwb3QgYSBzaW1pbGFyIGxpbmUgZm9yIEFGTEFHUy4KPiAKPiBJIGRpZG4ndCBhZGQg
YW55IGJlY2F1c2UgaXQgd2Fzbid0IG5lY2Vzc2FyeS4KClN5bW1ldHJ5IC8gY29uc2lzdGVuY3kg
d291bGQgc3RpbGwgYmUgZGVzaXJhYmxlIGltby4KCj4+PiBAQCAtMTA3LDcgKzY1LDcgQEAgJChm
b3JlYWNoIG8sJChmaWx0ZXItb3V0ICUvLCQob2JqLXkpICQob2JqLWJpbi15KSAkKGV4dHJhLXkp
KSwkKGV2YWwgJChjYWxsIGdlbmQKPj4+ICAgc3ViZGlyLXkgOj0gJChzdWJkaXIteSkgJChmaWx0
ZXIgJS8sICQob2JqLXkpKQo+Pj4gICBvYmoteSAgICA6PSAkKHBhdHN1YnN0ICUvLCAlL2J1aWx0
X2luLm8sICQob2JqLXkpKQo+Pj4gICAKPj4+IC0kKGZpbHRlciAlLmluaXQubywkKG9iai15KSAk
KG9iai1iaW4teSkgJChleHRyYS15KSk6IENGTEFHUyArPSAtRElOSVRfU0VDVElPTlNfT05MWQo+
Pj4gKyQoZmlsdGVyICUuaW5pdC5vLCQob2JqLXkpICQob2JqLWJpbi15KSAkKGV4dHJhLXkpKTog
Q0ZMQUdTLXkgKz0gLURJTklUX1NFQ1RJT05TX09OTFkKPj4KPj4gV2hpbGUgaW4gdGhlIGRlc2Ny
aXB0aW9uIHlvdSBzYXkgIldlIGNhbid0IHVzZSBDRkxBR1MgaW4KPj4gc3ViZGlyZWN0b3JpZXMg
dG8gYWRkIGZsYWdzIHRvIHBhcnRpY3VsYXIgdGFyZ2V0cywgLi4uIiwgaXQKPj4gcmVtYWlucyB1
bmNsZWFyIHRoZXJlIHdoeSB0aGF0IGlzLCBhbmQgaGVuY2Ugd2h5IGNoYW5nZXMgbGlrZQo+PiB0
aGlzIG9uZSBhcmUgbmVjZXNzYXJ5LiBJZiB0aGlzIGlzIGEgcmVzdHJpY3Rpb24gdGhhdCdzIGdv
aW5nIHRvCj4+IHJlbWFpbiwgdGhpcyBhbHNvIG5lZWRzIHdyaXRpbmcgZG93biBpbiBhIHByb21p
bmVudCBwbGFjZS4gQWZ0ZXIKPiAKPiBZZXMsIEkgc2hvdWxkIHByb2JhYmx5IHN0YXJ0IHdyaXRp
bmcgc29tZSBkb2N1bWVudGF0aW9uLCBwcm9iYWJseQo+IGZvbGxvd2luZyB0aGUga2luZCBvZiBk
b2N1bWVudGF0aW9uIHRoYXQgTGludXggaGFzIGZvciBrYnVpbGQsIGFuZCBJCj4gY291bGQgcHV0
IHRoYXQgaW4gZG9jcy9taXNjLCBhbG9uZyBzaWRlIHRoZSBrY29uZmlnIGRvYy4gVGhhdCBwcm9i
YWJseQo+IG5vdCBhIHByb21pbmVudCBwbGFjZSwgYnV0IEkgZG9uJ3Qga25vdyBpZiB0aGVyZSdz
IGEgYmV0dGVyIHBsYWNlLgoKSWYgaXQncyB0byBsaXZlIHVuZGVyIGRvY3MvLCB0aGVuIEkgZ3Vl
c3MgeGVuL1J1bGVzLm1rIHNob3VsZCBhdApsZWFzdCBwb2ludCB0byB0aGF0IGRvY3VtZW50YXRp
b24gKHBlcmhhcHMgaW4gYSBjb21tZW50IG5lYXIgdGhlCmZpcnN0IHNldHRpbmcgb3IgY29uc3Vt
cHRpb24gb2YgQ0ZMQUdTLXkpLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
