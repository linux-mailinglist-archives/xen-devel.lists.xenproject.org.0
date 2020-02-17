Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D29161E0E
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 00:49:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3q6H-0002zu-JV; Mon, 17 Feb 2020 23:46:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=c0MO=4F=suse.com=jfehlig@srs-us1.protection.inumbo.net>)
 id 1j3q6F-0002zo-N8
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 23:46:51 +0000
X-Inumbo-ID: c1e289dc-51df-11ea-80a6-12813bfff9fa
Received: from m9a0013g.houston.softwaregrp.com (unknown [15.124.64.91])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c1e289dc-51df-11ea-80a6-12813bfff9fa;
 Mon, 17 Feb 2020 23:46:48 +0000 (UTC)
Received: FROM m9a0013g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0013g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 17 Feb 2020 23:46:07 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 17 Feb 2020 23:41:44 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 17 Feb 2020 23:41:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wu9HOLM3qLZsWZoGp/19UaS1n1T9vVWI0o2RPHZRy2kUtXrSUxrN1T7dn6hmNwALA16rudm7lXAtD6XcjUoH/yperLs+rOHbCNLIQ+OeRlP8aAKtIsCHvr0fc8VuaFgYa9t4VHKV1sAjx3lchFHcp1+IvV1/4ixdhTF9lmadCbbJgmfmAAUW3xvPeij76H1eUvp0xNmS6IeExPaMdfMzTcdaJAZwafFhto2k6HZlXgsW8D05Y5oITaCgdszgE3mmeuMh6Dcm6fe+OjmtOnChzLQca6rhXMurQ0cHuzQANnAJ6WEhSC6PLvdaUhb3jdVVF4X7r+zVUst7Ri+zXjSkgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0MFBrqhxUfZGJv3byfMZZvJP2kvdXLwJ5f+uRxYvoY=;
 b=XT0lNOFqHM+E4ZbU+MEjXv3JRzME2lHWfJyUHybpvDVxVJPu7MaPXecec7804qPdfGVk2adL2yYVmh7EoYBoA+ENKTSUlk1toVUmUesglTt9Vh6OaJF1P8nTepRbbmwjh+5/QwH+SaiACASSIfvwQ0lnS7c7m//NCbnA2ZbnqXhd7QGlAyBQK00V7cgEYNnx+XxdTQkS4XWSIY4ALoE5EoHLHdA+Otu7UO+OIOnhGl6mhjqQg4fhKeIimze/gdxYdLGvgs3FfTntjhp9R+hTEJ8tcw9wIuL0lUpDJ8CzCJuWSZ9MGNrd9Dq08LvEhtPxCiHUlpz7KCHsSnCSK6d4mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jfehlig@suse.com; 
Received: from BY5PR18MB3315.namprd18.prod.outlook.com (10.255.139.204) by
 BY5PR18MB3220.namprd18.prod.outlook.com (10.255.136.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Mon, 17 Feb 2020 23:41:43 +0000
Received: from BY5PR18MB3315.namprd18.prod.outlook.com
 ([fe80::e837:42bb:9b5f:45c4]) by BY5PR18MB3315.namprd18.prod.outlook.com
 ([fe80::e837:42bb:9b5f:45c4%7]) with mapi id 15.20.2707.035; Mon, 17 Feb 2020
 23:41:43 +0000
To: Ian Jackson <ian.jackson@citrix.com>
References: <20200214155933.7048-1-jfehlig@suse.com>
 <24134.56617.646033.43087@mariner.uk.xensource.com>
From: Jim Fehlig <jfehlig@suse.com>
Message-ID: <72cb6f36-5dce-cc51-372f-4055d084f3a1@suse.com>
Date: Mon, 17 Feb 2020 16:41:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
In-Reply-To: <24134.56617.646033.43087@mariner.uk.xensource.com>
Content-Language: en-US
X-ClientProxiedBy: SN4PR0701CA0038.namprd07.prod.outlook.com
 (2603:10b6:803:2d::31) To BY5PR18MB3315.namprd18.prod.outlook.com
 (2603:10b6:a03:196::12)
MIME-Version: 1.0
Received: from [192.168.0.4] (75.169.19.89) by
 SN4PR0701CA0038.namprd07.prod.outlook.com (2603:10b6:803:2d::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.25 via Frontend
 Transport; Mon, 17 Feb 2020 23:41:43 +0000
X-Originating-IP: [75.169.19.89]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18b3898a-a91b-4751-fa65-08d7b402f1ab
X-MS-TrafficTypeDiagnostic: BY5PR18MB3220:
X-Microsoft-Antispam-PRVS: <BY5PR18MB3220EC592801C86E31A4FFF9C6160@BY5PR18MB3220.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0316567485
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(39860400002)(136003)(366004)(376002)(396003)(199004)(189003)(2906002)(86362001)(36756003)(478600001)(6666004)(4326008)(8676002)(52116002)(16526019)(66556008)(16576012)(81166006)(81156014)(186003)(31686004)(8936002)(26005)(316002)(6486002)(66946007)(53546011)(6916009)(5660300002)(31696002)(956004)(2616005)(66476007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3220;
 H:BY5PR18MB3315.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qjjxUOnfMjytax3jKP0LnLQHXZ3Vj5QbwObmDmcpfpqm969my4db7b9/3Q/y69YaNFmgq5ZHuHRYmk1WNYoNjxNur7WuJsKcuL9AStVAOqtNSY/AYLLQADGIZuedIOCSyI51v5qd9uhUdJJ/CkPus7VuFJxIAC0hb54IMoR6Ks4fLQquEcXsdZazKW9ThBjGWh4+9+ICyHd6IIv6/LJaX58Mz25eP60tnqomxKOLSt+ypCUn2ySENLmAli6bVlmdaaR0DYeY1/sG7t96tNUO01ITa8UNJh1/XOK62WMWiO/RHwYbFeBtr8cE69MZujCutHRHKU9ZGT3ayP726jYFzqFhogVeIs/VAl1YYkkNwwN0w9l1s4XzlibHf84paA2s4H5Sr0cYxi/cR3hLzrf4td3A/EzNwEGs2FviNXJ6OSxt4wGFyo2+sQUACX8eH94A
X-MS-Exchange-AntiSpam-MessageData: ujxH+Kb9ZnMCeRhxc+DiftdT22wOVhs2+wgRHuGNEUSr2Hb7uebll8yShpRJ4nWrTHu2AC0eX47gAfqqo5KInb8N3OWX5QF2EJvlYhWnqc8XK+JLmNboxbpHWkKPtKsPFiS2J9Xn812kzS47LI47kg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 18b3898a-a91b-4751-fa65-08d7b402f1ab
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2020 23:41:43.5807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LvZUE1SUMDmQNmuRA8ewmzQcM3Xio7AguqAIkhATJpsMVHkGv5QUUkknIJWu1QkVwnSE+Eda24vYZd2BTnm0VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3220
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [OSSTEST PATCH V2] build: fix configuration of
 libvirt
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMi8xNC8yMCAxMDo0NyBBTSwgSWFuIEphY2tzb24gd3JvdGU6Cj4gSmltIEZlaGxpZyB3cml0
ZXMgKCJbT1NTVEVTVCBQQVRDSCBWMl0gYnVpbGQ6IGZpeCBjb25maWd1cmF0aW9uIG9mIGxpYnZp
cnQiKToKPj4gbGlidmlydC5naXQgY29tbWl0IDI2MjFkNDhmMDAgcmVtb3ZlZCB0aGUgbGFzdCB0
cmFjZXMgb2YgZ251bGliLCB3aGljaAo+PiBhbHNvIHJlbW92ZWQgdGhlICctLW5vLWdpdCcgb3B0
aW9uIGZyb20gYXV0b2dlbi5zaC4gVW5rbm93biBvcHRpb25zIGFyZQo+PiBub3cgcGFzc2VkIHRv
IHRoZSBjb25maWd1cmUgc2NyaXB0LCB3aGljaCBxdWlja2x5IGZhaWxzIHdpdGgKPj4KPj4gICAg
Y29uZmlndXJlOiBlcnJvcjogdW5yZWNvZ25pemVkIG9wdGlvbjogYC0tbm8tZ2l0Jwo+Pgo+PiBS
ZW1vdmUgdGhlIGdudWxpYiBoYW5kbGluZyBmcm9tIHRzLWxpYnZpcnQtYnVpbGQsIGluY2x1ZGlu
ZyB0aGUgJy0tbm8tZ2l0Jwo+PiBvcHRpb24gdG8gYXV0b2dlbi5zaC4gV2hpbGUgYXQgaXQgcmVt
b3ZlIGNvbmZpZ3VyZSBvcHRpb25zIG5vIGxvbmdlcgo+PiBzdXBwb3J0ZWQgYnkgdGhlIGxpYnZp
cnQgY29uZmlndXJlIHNjcmlwdC4KPiAKPiBIYXJtZi4gIFRoYW5rcyBmb3IgbG9va2luZyBpbnRv
IHRoaXMgYW5kIHRyeWluZyB0byBmaXggdGhpcyBtZXNzLgo+IAo+IEkgdGhpbmsgdGhlcmUgaXMg
YSBwcm9ibGVtIHdpdGggeW91ciBwYXRjaCwgd2hpY2ggaXMgdGhhdCAyNjIxZDQ4ZjAwCj4gaXMg
cmVjZW50IGVub3VnaCB0aGF0IHdlIG1pZ2h0IHdhbnQgc3RpbGwgdG8gYmUgYWJsZSB0byBidWls
ZCB3aXRoCj4gZWFybGllciB2ZXJzaW9ucy4KCkFoLCBnb29kIHBvaW50LgoKPiBJcyB0aGVyZSBh
biBlYXN5IHdheSB0byB0ZWxsIChieSBsb29raW5nIGF0IHRoZSB0cmVlIGFmdGVyIGNoZWNrb3V0
LAo+IG1heWJlKSB3aGV0aGVyIHRvIGRvIHRoZSBvbGQgb3IgdGhlIG5ldyB0aGluZyA/CgpUaGVy
ZSB3b3VsZCBiZSBubyBnbnVsaWIgZGlyZWN0b3J5IGluIGEgdHJlZSBjaGVja2VkIG91dCBhZnRl
ciBjb21taXQgCjI2MjFkNDhmMDAuIEFub3RoZXIgb3B0aW9uIGlzIHRvIGNoZWNrIGZvciB0aGUg
J2Jvb3RzdHJhcCcgc2NyaXB0IGluIHRoZSByb290IG9mIAp0aGUgdHJlZSwgd2hpY2ggd2FzIHJl
bW92ZWQgYnkgMjYyMWQ0OGYwMC4KCj4gWW91ciBwZXJsIGNvZGUgbG9va3MgZ29vZCB0byBtZSBm
b3Igd2hhdCBpdCBpcyB0cnlpbmcgdG8gZG8uCgpJJ20gYWZyYWlkIG15IHBlcmwgaXMgdG9vIHdl
YWsgdG8gcXVpY2tseSBoYWNrIHNvbWV0aGluZyB1cCB0byBzdXBwb3J0IGJvdGggcHJlIAphbmQg
cG9zdCBnbnVsaWIgYnVpbGRzIDotKC4gSSdsbCBhZGQgdGhpcyB0YXNrIHRvIG15IGxpc3QgaWYg
eW91IGRvbid0IGhhdmUgdGltZSAKZm9yIGl0LgoKUmVnYXJkcywKSmltCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
