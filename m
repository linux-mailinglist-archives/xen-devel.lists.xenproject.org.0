Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB40EC0844
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 17:04:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDrki-0001dM-4J; Fri, 27 Sep 2019 15:01:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wAPT=XW=amazon.com=prvs=166d6d219=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDrkg-0001dE-S4
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 15:01:46 +0000
X-Inumbo-ID: b8f4242c-e137-11e9-967c-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by localhost (Halon) with ESMTPS
 id b8f4242c-e137-11e9-967c-12813bfff9fa;
 Fri, 27 Sep 2019 15:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569596506; x=1601132506;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=z3uNx6EAyC1KE9e6ICOXMp68AqbwPBoD9ngIPm3Z8SA=;
 b=RzpfRIFCLWcbHK3TwcxO+WJqtka4rXsnB7osto1acO1dSX/tU+KqVvl0
 v9W4dHWqj1zEGA7+CmnaKj47IRQSwaWkYcJQYi5co4DKgc9y+hqvoFz/B
 ZAn16fqFzCec1vhGGMtp4euB9f2RsBRmNui+5dSnmNHPS6J5gURLnRKl9 Y=;
X-IronPort-AV: E=Sophos;i="5.64,555,1559520000"; d="scan'208";a="787874773"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-c7131dcf.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 27 Sep 2019 15:01:44 +0000
Received: from EX13MTAUWB001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-c7131dcf.us-west-2.amazon.com (Postfix) with ESMTPS
 id 1CB99A0703; Fri, 27 Sep 2019 15:01:42 +0000 (UTC)
Received: from EX13D14UWB001.ant.amazon.com (10.43.161.158) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.207) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 27 Sep 2019 15:01:41 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D14UWB001.ant.amazon.com (10.43.161.158) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 27 Sep 2019 15:01:41 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Fri, 27 Sep 2019 15:01:39 +0000
To: Jan Beulich <jbeulich@suse.com>
References: <cover.1569489002.git.hongyax@amazon.com>
 <ccabf9b1ce3142ca65e453ec9a5ae1d34d28a992.1569489002.git.hongyax@amazon.com>
 <20190926142657.mc3y7i4ovz6hvua6@debian>
 <7d68a0dc-d101-1823-5d8b-89e1b4a5f6fb@amazon.com>
 <d9cc437b-add6-3a71-be44-c5d5b74b9d8f@suse.com>
 <6d410229-a7b9-22dc-3708-90d1ae9d728a@amazon.com>
 <8120a633-573f-d66c-2662-1b9d1124eecb@suse.com>
From: <hongyax@amazon.com>
Message-ID: <bafd3fed-ccf0-bfaf-0162-5a264de46bea@amazon.com>
Date: Fri, 27 Sep 2019 16:01:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8120a633-573f-d66c-2662-1b9d1124eecb@suse.com>
Content-Language: en-US
Precedence: Bulk
Subject: Re: [Xen-devel] [RFC PATCH 71/84] x86/setup: start tearing down the
 direct map.
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Konrad
 RzeszutekWilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>,
 IanJackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcvMDkvMjAxOSAxNToxNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjcuMDkuMjAxOSAx
NjowMiwgaG9uZ3lheEBhbWF6b24uY29tIHdyb3RlOgo+IAo+IEJ1dCB0aGVuIHdoeSBkbyB0aGUg
aW5pdGlhbCBzbyBtYW55IHBhdGNoZXMgKGluaGVyaXRlZCBmcm9tIFdlaSkKPiBjb252ZXJ0IGZy
b20gZG9taGVhcCB0byB4ZW5oZWFwIGFsbG9jYXRpb25zIGF0IGFsbD8gSWYgeW91cgo+IGFwcHJv
YWNoIGlzIHRvIGJlIGF0IGxlYXN0IGFuIGludGVybWVkaWF0ZSBnb2FsLCB0aGVuIEkgdGhpbmsg
dGhlCj4gb3JkZXIgb2YgY2hhbmdlcyBzaG91bGQgYmUgc3VjaCB0aGF0IG9uLWRlbWFuZCBtYXBw
aW5nIG9mIHhlbmhlYXAKPiBwYWdlcyBvY2N1cnMgZmlyc3QsIGFuZCB0aGVuIHRoZSB4ZW5oZWFw
IC0+IGRvbWhlYXAgY29udmVyc2lvbgo+IGNhbiBoYXBwZW4gaW4gYmFzaWNhbGx5IGFyYml0cmFy
aWx5IHNtYWxsIHN0ZXBzLgo+IAoKQWxzbyBJIGhhdmUgdGVzdGVkIFdlaSdzIHBhdGNoZXMgd2l0
aCBmaXhlcy4gSXQgaXMgcHJldHR5IHN0YWJsZSBhZ2FpbnN0IG15IApzZXR1cCBiZWNhdXNlIHRo
ZSBkaXJlY3QgbWFwIGhhcyBub3QgYmVlbiBhY3R1YWxseSByZW1vdmVkLiBJIGFtIGFibGUgdG8g
cnVuIApYVEYgdGVzdHMsIGJvb3QgZG9tMCwgbGF1bmNoLCByZXN0YXJ0IGFuZCBkZXN0cm95IGd1
ZXN0cyB3aXRob3V0IGJyZWFrYWdlLiBGcm9tIAphIHN0YWJpbGl0eSBwb2ludCBvZiB2aWV3LCBp
dCBwcm9iYWJseSBtYWtlcyBtb3JlIHNlbnNlIGZvciBXZWkncyBwYXRjaGVzIHRvIGdvIAppbiBm
aXJzdC4gRnJvbSB0aGUgcmV2aWV3cywgaXQgbG9va3MgbGlrZSBteSBwYXRjaGVzIHRvIGFjdHVh
bGx5IHJlbW92ZSB0aGUgCmRpcmVjdCBtYXAgY2FuIGJlbmVmaXQgZnJvbSBtb3JlIFJGQ3MsIGFu
ZCBjYW4gYmUgc2VwYXJhdGVkIGZyb20gV2VpJ3MgaW50byBhIApzZWNvbmQgYmF0Y2guCgpIb25n
eWFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
