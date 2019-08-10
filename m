Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32ACB888D7
	for <lists+xen-devel@lfdr.de>; Sat, 10 Aug 2019 08:34:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hwKus-0004UL-LQ; Sat, 10 Aug 2019 06:31:50 +0000
Received: from mail6.bemta25.messagelabs.com ([195.245.230.41])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <labbott@redhat.com>) id 1hwKuq-0004UG-A7
 for xen-devel@lists.xensource.com; Sat, 10 Aug 2019 06:31:48 +0000
Received: from [46.226.52.100] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-1.bemta.az-a.eu-west-1.aws.symcld.net id D6/C1-10039-3D46E4D5;
 Sat, 10 Aug 2019 06:31:47 +0000
Authentication-Results: mx.messagelabs.com; spf=pass 
 (server-15.tower-264.messagelabs.com: domain of redhat.com designates 
 209.85.128.54 as permitted sender) smtp.mailfrom=redhat.com; dkim=none 
 (message not signed); dmarc=pass (p=none sp=none adkim=r aspf=r) 
 header.from=redhat.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIKsWRWlGSWpSXmKPExsVyMbTBTPdSil+
 sQfchG4t7U96zOzB6bO/bxR7AGMWamZeUX5HAmnHx0Af2gnWSFW8/tTE2MB4W6WLk4hASmMYo
 0XZtATuIIyFwk1Vi7463bF2MnEBOlsTFhXdZIew0iR/XjkPZtRJTL7SwgNhCAooSS/fPZ4OY9
 JVR4sCFTrBmYQEDie13frGCJEQE+pgkDn/rZILo8JM41XYGbBKbgLrE7tkrmUFsXgFbic73x8
 FqWARUJXp+nQerERUIl3jx5AwbRI2gxMmZT8A2cwr4S8ye0sUIYjMLmEnM2/yQGcIWl7j1ZD4
 ThC0vsf3tHOYJjMKzkLTPQtIyC0nLLCQtCxhZVjGaJxVlpmeU5CZm5ugaGhjoGhoa6Rpamuqa
 G+glVukm6qWW6panFpfoGuollhfrFVfmJuek6OWllmxiBMZISsFhtx2M82a90TvEKMnBpCTKu
 /2vb6wQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCV5PYNQJCRalpqdWpGXmAOMVJi3BwaMkwuuUDJ
 TmLS5IzC3OTIdInWK05Fiycd4iZo7L10Fkx69Fi5iFWPLy81KlxHmzQeYJgDRklObBjYOllEu
 MslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHkFQdbyZOaVwG19BXQQE9BB3E98QQ4qSURISTUw
 ZeZuf76p9JrbZ4FVZk88KtZu+7bBm//3hZJMO+5laUW2HWtbH/5r2+fi4P23z3z6j54Fqgaq0
 6Y8nTi1tv8s1/xXc5fvqJr1Pz/msnDs9Y0JVw11/3w5cnjjJAHtRaHtMid3JFnPzPDdaFv6xU
 S9d6OGV7BXufjWtkyx535loZ9nmbI/2xRzQe5nam11h+JPaZ3yd46G+avPGN6P3bZzxa63/Mf
 Ffj2bcPTzjKI3V/6c4wz0UF/PInRow9x53879/y5YtT146w4hCfvQyxdfW35kEv38iiV091Om
 vBkfGLW2a5S1B0S0eP61nLrt66WWjAvvpj4sSqvde+tVSiX7nxvGUS/59u/+cmPumSwfHSsll
 uKMREMt5qLiRAChvxkipAMAAA==
X-Env-Sender: labbott@redhat.com
X-Msg-Ref: server-15.tower-264.messagelabs.com!1565418706!470654!1
X-Originating-IP: [209.85.128.54]
X-SpamReason: No, hits=0.0 required=7.0 tests=newsletters: 
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29249 invoked from network); 10 Aug 2019 06:31:46 -0000
Received: from mail-wm1-f54.google.com (HELO mail-wm1-f54.google.com)
 (209.85.128.54)
 by server-15.tower-264.messagelabs.com with ECDHE-RSA-AES128-GCM-SHA256
 encrypted SMTP; 10 Aug 2019 06:31:46 -0000
Received: by mail-wm1-f54.google.com with SMTP id z23so7384916wmf.2
 for <xen-devel@lists.xensource.com>; Fri, 09 Aug 2019 23:31:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OX6xAF2pV5cfIHHgU4/X1QMquKhtxthuTPD5VM2TsLk=;
 b=HudYP3ehEoxmM0sCkufTdavvC4goF4XmACIf+2oL3vU9wsleBxV8ByXM4WCCKI2D4S
 VNf7DQZRbeDOr0wCmm5Qrd93EMnm8nTFmsFCWdPV7c1OroPP1zBDGSeXO+IZMDg+9IqY
 QLspiOdzom/pEPMVrupNUPzLKqYiNANFEZhUWIy4OXKWBXlXFPoHHLW33dFCm617TZFl
 YPZz4Cy1SzPatDsmcqYxUCNQTwl6bWk8rD+9zpU45c+45WPbRu1Igqk6XNZ7IoTXj6a5
 Kn5t0K/gdN1oDGt5/EhRqWXIIYVko6p3OTM1jlGD1P+CHULR+LfvTMItUJ96TeiABEr0
 KCRA==
X-Gm-Message-State: APjAAAWTjVjmMYRn1RlVdUrSC+3FpMYpjASq4RxXJIXwg/ODPnui/vp0
 CjYBVuvqIlqaasWeFNyhdXZ6xw==
X-Google-Smtp-Source: APXvYqxg8ESiZ7gbQXxIYCoRicFr73TJ9y3z/Bo394Q9JVjfqbrLbUwjAG3KMeMDI7g5fA4u/RnlMw==
X-Received: by 2002:a1c:1a4c:: with SMTP id a73mr15380970wma.109.1565418706404; 
 Fri, 09 Aug 2019 23:31:46 -0700 (PDT)
Received: from [192.168.203.199] ([193.68.39.228])
 by smtp.gmail.com with ESMTPSA id v10sm159153wmc.11.2019.08.09.23.31.45
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Aug 2019 23:31:45 -0700 (PDT)
To: Development discussions related to Fedora
 <devel@lists.fedoraproject.org>, Adam Williamson
 <adamwill@fedoraproject.org>, test@lists.fedoraproject.org,
 Fedora Cloud SIG <cloud@lists.fedoraproject.org>,
 xen-devel@lists.xensource.com, coreos@lists.fedoraproject.org
References: <f685f4352bba0448c439fe725141f7f36faf51ee.camel@fedoraproject.org>
From: Laura Abbott <labbott@redhat.com>
Message-ID: <875e203d-1b50-3814-3f6a-b8ca96ccd758@redhat.com>
Date: Sat, 10 Aug 2019 08:31:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f685f4352bba0448c439fe725141f7f36faf51ee.camel@fedoraproject.org>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen / EC2 release criteria proposal
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC8xMC8xOSAyOjU2IEFNLCBBZGFtIFdpbGxpYW1zb24gd3JvdGU6Cj4gSGV5IGZvbGtzISBJ
J20gc3RhcnRpbmcgYSBuZXcgdGhyZWFkIGZvciB0aGlzIHRvIHRyaW0gdGhlIHJlY2lwaWVudAo+
IGxpc3QgYSBiaXQgYW5kIGluY2x1ZGUgZGV2ZWxAIGFuZCBjb3Jlb3NALgo+IAo+IFRoZSBTdG9y
eSBTbyBGYXI6IHRoZXJlIGlzIGEgRmVkb3JhIHJlbGVhc2UgY3JpdGVyaW9uIHdoaWNoIHJlcXVp
cmVzCj4gRmVkb3JhIHRvIGJvb3Qgb24gWGVuOgo+IAo+ICJUaGUgcmVsZWFzZSBtdXN0IGJvb3Qg
c3VjY2Vzc2Z1bGx5IGFzIFhlbiBEb21VIHdpdGggcmVsZWFzZXMgcHJvdmlkaW5nCj4gYSBmdW5j
dGlvbmFsLCBzdXBwb3J0ZWQgWGVuIERvbTAgYW5kIHdpZGVseSB1c2VkIGNsb3VkIHByb3ZpZGVy
cwo+IHV0aWxpemluZyBYZW4uIgo+IAo+IFdlIChRQSBncm91cCkgaGFkIGEgZGlzY3Vzc2lvbiBh
Ym91dCByZW1vdmluZyB0aGlzIGNyaXRlcmlvbiBlbnRpcmVseS4KPiBUaGF0IGhhcyBub3cgbW9y
cGhlZCBpbnRvIHRoZSBpZGVhIHRoYXQgd2Ugc2hvdWxkIHR3ZWFrIGl0IHRvIGJlCj4gZm9jdXNl
ZCBleGNsdXNpdmVseSBvbiB0aGUgIndpZGVseSB1c2VkIGNsb3VkIHByb3ZpZGVycyB1dGlsaXpp
bmcKPiBYZW4iLi4uYnkgd2hpY2ggd2UgbWVhbiBFQzIuIEF0IHRoZSB0aW1lIHRoaXMgY3JpdGVy
aW9uIHdhcyBpbnZlbnRlZCwKPiBhbGwgRUMyIGluc3RhbmNlIHR5cGVzIHVzZWQgWGVuOyBub3cs
IHNvbWUgc3RpbGwgdXNlIFhlbiwgYW5kIHNvbWUgdXNlCj4gS1ZNLgo+IAo+IFNvIGl0IHNlZW1z
IGxpa2UgdGhpcyB3b3VsZCBhbHNvIGJlIGEgZ29vZCBvcHBvcnR1bml0eSB0byByZXZpc2l0IGFu
ZAo+IG5haWwgZG93biBtb3JlIHNwZWNpZmljYWxseSBleGFjdGx5IHdoYXQgb3VyIGNsb3VkIHJl
cXVpcmVtZW50cyBhcmUuCj4gYmNvdHRvbiBzdWdnZXN0ZWQgIHRoYXQgd2UgcmVxdWlyZSB0d28g
c2FtcGxlIGluc3RhbmNlIHR5cGVzIHRvIGJlCj4gdGVzdGVkLCBjNS5sYXJnZSAoS1ZNKSBhbmQg
dDMubGFyZ2UgKFhlbikuIChJJ3ZlIGFsc28gbWFpbGVkIFRob21hcwo+IENhbWVyb24sIGV4LW9m
IFJlZCBIYXQsIG5vdyBvZiBBbWF6b24sIGZvciBoaXMgb3BpbmlvbiwgYXMgaXQgc2VlbWVkCj4g
bGlrZSBpdCBtaWdodCBiZSB3b3J0aHdoaWxlIC0gaGUncyBwcm9taXNlZCB0byBnZXQgYmFjayB0
byBtZSkuCj4gCj4gU28sIGZvciBub3csIGxldCBtZSBwcm9wb3NlIHRoaXMgYXMgYSB0cmlhbCBi
YWxsb29uOiB3ZSByZXdyaXRlIHRoZQo+IGFib3ZlIGNyaXRlcmlvbiB0byBzYXk6Cj4gCj4gIlJl
bGVhc2UtYmxvY2tpbmcgY2xvdWQgZGlzayBpbWFnZXMgbXVzdCBiZSBwdWJsaXNoZWQgdG8gQW1h
em9uIEVDMiBhcwo+IEFNSXMsIGFuZCB0aGVzZSBtdXN0IGJvb3Qgc3VjY2Vzc2Z1bGx5IGFuZCBt
ZWV0IG90aGVyIHJlbGV2YW50IHJlbGVhc2UKPiBjcml0ZXJpYSBvbiBjNS5sYXJnZSBhbmQgdDMu
bGFyZ2UgaW5zdGFuY2UgdHlwZXMuIgo+IAo+IE5vdGVzOgo+IAo+IDEuIFRoZSB0ZXN0IG1hdHJp
eCB0ZW1wbGF0ZSBoYXMgYW4gT3BlbnN0YWNrIGNvbHVtbiwgYnV0IHdlIG5ldmVyCj4gYWN0dWFs
bHkgY292ZXJlZCBPcGVuc3RhY2sgaW4gdGhlIHJlbGVhc2UgY3JpdGVyaWEuIEkgdGhpbmsgd2Ug
c2hvdWxkCj4gY29udGludWUgdG8gbGVhdmUgaXQgb3V0IG9mIHRoZSBjcml0ZXJpYSBhbmQgYWxz
byByZW1vdmUgdGhlIGNvbHVtbgo+IGZyb20gdGhlIG1hdHJpeC4gSW4gdGhlIHBhc3Qgd2UgdGVz
dGVkIE9wZW5zdGFjayBib290IGluIHRoZSBpbmZyYQo+IE9wZW5zdGFjaywgYnV0IHRoYXQgaGFz
IGdvbmUgYXdheSBvciBpcyBnb2luZyBhd2F5Li4udGhhdCBtZWFucyBhKSB3ZQo+IGNhbid0IHRl
c3Qgb24gT3BlbnN0YWNrIHNvIGVhc2lseSBhbnkgbW9yZSBhbmQgYikgYSBsb3Qgb2YgdGhlIHJl
YXNvbgo+IHRvIGJvdGhlciB0ZXN0aW5nIG9uIE9wZW5zdGFjayBpcyBnb25lLiBUaGlzIGlzIHVw
IGZvciBkZWJhdGUsIGJ1dCBpZgo+IHdlIGJlbGlldmUgaXQncyBpbXBvcnRhbnQgdG8gdGVzdCBv
biBPcGVuc3RhY2sgYW5kIGJsb2NrIG9uIHdvcmtpbmcgaW4KPiB0aGF0IGVudmlyb25tZW50IHdl
IG5lZWQgdG8gaGF2ZSBhIHJlbGlhYmxlIHdheSB0byAqZG8qIHRoYXQuCj4gCj4gMi4gVGhlIHRl
c3QgbWF0cml4IHRlbXBsYXRlIGFsc28gaGFzIGEgJ0xvY2FsJyBjb2x1bW4gd2hpY2ggaXMgZm9y
Cj4gdGVzdGluZyBsb2NhbGx5IHdpdGggdGVzdGNsb3VkLCBidXQgSSBkb24ndCB0aGluayB3ZSBu
ZWVkIHRvCj4gc3BlY2lmaWNhbGx5IHJlcXVpcmUgdGhhdCB0byB3b3JrIGluIHRoZSBjcml0ZXJp
YS4gSXQncyBtb3JlIG9mIGEKPiB0ZXN0aW5nIGNvbnZlbmllbmNlIHRoaW5nLCBzbyBldmVuIGlm
IG5vLW9uZSB0ZXN0cyBvbiBFQzIgd2UgYXQgbGVhc3QKPiB0ZXN0IHRoYXQgdGhlIGltYWdlIGJv
b3RzIGluIHRlc3RjbG91ZDsgdGVzdGNsb3VkIGlzbid0IGFuIGVudmlyb25tZW50Cj4geW91J2Qg
YWN0dWFsbHkgdXNlIHRvIGRvIGFueXRoaW5nIHByYWN0aWNhbCBpbi4KPiAKPiAzLiBJIGJlbGll
dmUgdGhpcyB3b3JkaW5nIGlzIGdlbmVyaWMgZW5vdWdoIHRvIGNvdmVyIHVzIGlmIHdlLCBlLmcu
LAo+IHdhbnQgdG8gc3RhcnQgYmxvY2tpbmcgb24gQ29yZU9TIGltYWdlcy4gQWxsIHdlIGhhdmUg
dG8gZG8gaXMgZGVjbGFyZQo+IHRoYXQgc29tZSBDb3JlT1MgaW1hZ2UgaXMgJ3JlbGVhc2UtYmxv
Y2tpbmcnLCBhbmQgaXQncyBpbnN0YW50bHkKPiBjb3ZlcmVkIGJ5IHRoaXMgcmVxdWlyZW1lbnQu
Cj4gCkknbSBpbiBmYXZvciBvZiB0aGlzLiBXZSd2ZSBoYWQgcHJvYmxlbXMgZ2V0dGluZyBlbmdh
Z2VtZW50IGFuZCBidWcKZml4aW5nIGZvciBYZW4gaW4gdGhlIEZlZG9yYSBrZXJuZWwuIE5hcnJv
d2luZyB0aGUgc2NvcGUgdG8gcGFydGljdWxhcgpYZW4gaW5zdGFuY2VzIHdpbGwgbWFrZSB0aGlz
IGVhc2llciB0byBkZWJ1ZyBhbmQgcHJvYmFibHkgbGVzcyBsaWtlbHkKdG8gYnJlYWsuCgpUaGFu
a3MsCkxhdXJhCgpQLlMuIEZvciB0aG9zZSB3aG8gbWlnaHQgYmUgaW50ZXJlc3RlZCBpbiBrZWVw
aW5nIHRoaXMgd29ya2luZyBpbgp0aGUga2VybmVsLCB0ZXN0aW5nIGlzIGdvb2QgYnV0IGJpc2Vj
dGluZyBhbmQgaWRlbnRpZnlpbmcgZml4ZXMKdG8gYnJpbmcgaW4gaXMgbXVjaCBtb3JlIHZhbHVh
YmxlIHNpbXBseSBiZWNhdXNlIGl0J3Mgd2hhdCdzIG1pc3NpbmcKYXQgdGhlIG1vbWVudC4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
