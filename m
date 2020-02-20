Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA3E166713
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 20:23:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4rMq-0001CF-PU; Thu, 20 Feb 2020 19:20:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wWA0=4I=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j4rMo-0001CA-RM
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 19:20:10 +0000
X-Inumbo-ID: 01ad7d0b-5416-11ea-8584-12813bfff9fa
Received: from mail-ed1-f68.google.com (unknown [209.85.208.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 01ad7d0b-5416-11ea-8584-12813bfff9fa;
 Thu, 20 Feb 2020 19:20:09 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id v28so35019802edw.12
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2020 11:20:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p6zrlHDwVkK1AMBFZAfZxEgU4Q8u4K7ehALIzCiSe0s=;
 b=uAz1BbJeavnx47IOFMdzv7SpKABUBvamWcs1U1d5lztP4t5sundafwkAi0ZRXJePZF
 DgwgOwhVedpDvvQfhPmntgWtSbpSnvD+JRchYEEpGS8M3F0aK5Sk3CnXRTNx+CZvNnuy
 AAWqhIMaORB22ReGaJL4CpGjC+j6VH4hIQcxIzE4D2LyqeV/PhuH/6SfBC5upfn2jWEI
 eFUEeMHeelLGxMUY1WQFkIaC1tXXNV4PsApQwS8l/6xxk19WkD+gAG1VRoavrhfCxNDK
 JiYzF1FZyItY888xX14S1dPnQPnglg6SpOGa6yIEwIpFVzXlG9hqNctIVWNtmILeFW1z
 9HLQ==
X-Gm-Message-State: APjAAAUns6xg71Yq13x+LRa0qUmwNiWej0XcoM/GcAUK3NUh881rqD2F
 m10aN5jLLL2OqLiMCYNU2qA=
X-Google-Smtp-Source: APXvYqylaoiZKN45e5tDNBJkFA54eTIF7iuF85SMLbxhtVnaR0AB+iEJfshNoFZ+3jqtU52WwM7KtA==
X-Received: by 2002:a50:d506:: with SMTP id u6mr29346287edi.225.1582226409021; 
 Thu, 20 Feb 2020 11:20:09 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-230.amazon.com.
 [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id j24sm30166edr.57.2020.02.20.11.20.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2020 11:20:08 -0800 (PST)
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20200220173116.88915-1-roger.pau@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <83d48223-21eb-be54-985c-085449661892@xen.org>
Date: Thu, 20 Feb 2020 19:20:06 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200220173116.88915-1-roger.pau@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v2] rwlock: allow recursive read locking
 when already locked in write mode
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyMC8wMi8yMDIwIDE3OjMxLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gQWxsb3cg
YSBDUFUgYWxyZWFkeSBob2xkaW5nIHRoZSBsb2NrIGluIHdyaXRlIG1vZGUgdG8gYWxzbyBsb2Nr
IGl0IGluCj4gcmVhZCBtb2RlLiBUaGVyZSdzIG5vIGhhcm0gaW4gYWxsb3dpbmcgcmVhZCBsb2Nr
aW5nIGEgcndsb2NrIHRoYXQncwo+IGFscmVhZHkgb3duZWQgYnkgdGhlIGNhbGxlciAoaWU6IENQ
VSkgaW4gd3JpdGUgbW9kZS4gQWxsb3dpbmcgc3VjaAo+IGFjY2Vzc2VzIGlzIHJlcXVpcmVkIGF0
IGxlYXN0IGZvciB0aGUgQ1BVIG1hcHMgdXNlLWNhc2UuCj4gCj4gSW4gb3JkZXIgdG8gZG8gdGhp
cyByZXNlcnZlIDE0Yml0cyBvZiB0aGUgbG9jaywgdGhpcyBhbGxvd3MgdG8gc3VwcG9ydAo+IHVw
IHRvIDE2Mzg0IENQVXMuIEFsc28gcmVkdWNlIHRoZSB3cml0ZSBsb2NrIG1hc2sgdG8gMiBiaXRz
OiBvbmUgdG8KPiBzaWduYWwgdGhlcmUgYXJlIHBlbmRpbmcgd3JpdGVycyB3YWl0aW5nIG9uIHRo
ZSBsb2NrIGFuZCB0aGUgb3RoZXIgdG8KPiBzaWduYWwgdGhlIGxvY2sgaXMgb3duZWQgaW4gd3Jp
dGUgbW9kZS4gTm90ZSB0aGUgd3JpdGUgcmVsYXRlZCBkYXRhCj4gaXMgdXNpbmcgMTZiaXRzLCB0
aGlzIGlzIGRvbmUgaW4gb3JkZXIgdG8gYmUgYWJsZSB0byBjbGVhciBpdCAoYW5kCj4gdGh1cyBy
ZWxlYXNlIHRoZSBsb2NrKSB1c2luZyBhIDE2Yml0IGF0b21pYyB3cml0ZS4KPiAKPiBUaGlzIHJl
ZHVjZXMgdGhlIG1heGltdW0gbnVtYmVyIG9mIGNvbmN1cnJlbnQgcmVhZGVycyBmcm9tIDE2Nzc3
MjE2IHRvCj4gNjU1MzYsIEkgdGhpbmsgdGhpcyBzaG91bGQgc3RpbGwgYmUgZW5vdWdoLCBvciBl
bHNlIHRoZSBsb2NrIGZpZWxkCj4gY2FuIGJlIGV4cGFuZGVkIGZyb20gMzIgdG8gNjRiaXRzIGlm
IGFsbCBhcmNoaXRlY3R1cmVzIHN1cHBvcnQgYXRvbWljCj4gb3BlcmF0aW9ucyBvbiA2NGJpdCBp
bnRlZ2Vycy4KCkZXSVcsIGFybTMyIGlzIGFibGUgdG8gc3VwcG9ydCBhdG9taWMgb3BlcmF0aW9u
cyBvbiA2NC1iaXQgaW50ZWdlcnMuCgo+ICAgc3RhdGljIGlubGluZSB2b2lkIF93cml0ZV91bmxv
Y2socndsb2NrX3QgKmxvY2spCj4gICB7Cj4gLSAgICAvKgo+IC0gICAgICogSWYgdGhlIHdyaXRl
ciBmaWVsZCBpcyBhdG9taWMsIGl0IGNhbiBiZSBjbGVhcmVkIGRpcmVjdGx5Lgo+IC0gICAgICog
T3RoZXJ3aXNlLCBhbiBhdG9taWMgc3VidHJhY3Rpb24gd2lsbCBiZSB1c2VkIHRvIGNsZWFyIGl0
Lgo+IC0gICAgICovCj4gLSAgICBhdG9taWNfc3ViKF9RV19MT0NLRUQsICZsb2NrLT5jbnRzKTsK
PiArICAgIC8qIFNpbmNlIHRoZSB3cml0ZXIgZmllbGQgaXMgYXRvbWljLCBpdCBjYW4gYmUgY2xl
YXJlZCBkaXJlY3RseS4gKi8KPiArICAgIEFTU0VSVChfaXNfd3JpdGVfbG9ja2VkX2J5X21lKGF0
b21pY19yZWFkKCZsb2NrLT5jbnRzKSkpOwo+ICsgICAgQlVJTERfQlVHX09OKF9RUl9TSElGVCAh
PSAxNik7Cj4gKyAgICB3cml0ZV9hdG9taWMoKHVpbnQxNl90ICopJmxvY2stPmNudHMsIDApOwoK
SSB0aGluayB0aGlzIGlzIGFuIGFidXNlIHRvIGNhc3QgYW4gYXRvbWljX3QoKSBkaXJlY3RseSBp
bnRvIGEgdWludDE2X3QuIApZb3Ugd291bGQgYXQgbGVhc3Qgd2FudCB0byB1c2UgJmxvY2stPmNu
dHMuY291bnRlciBoZXJlLgoKVGhlIHJlc3Qgb2YgdGhlIGNvZGUgbG9va3MgZ29vZCB0byBtZS4K
CkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
