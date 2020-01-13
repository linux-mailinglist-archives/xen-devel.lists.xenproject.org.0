Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAAE139B5E
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 22:26:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ir7Bd-0005aU-9l; Mon, 13 Jan 2020 21:23:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Ofl=3C=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ir7Bc-0005aN-7g
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 21:23:48 +0000
X-Inumbo-ID: fbfa8a1c-364a-11ea-82e6-12813bfff9fa
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fbfa8a1c-364a-11ea-82e6-12813bfff9fa;
 Mon, 13 Jan 2020 21:23:47 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id p17so11405430wmb.0
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jan 2020 13:23:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JKQEUdsudp30xwal3nxZAfnv+bLwGEHKWbfPIH0pCrk=;
 b=tZ48WxrnsdGbx/QC0ieR8CbD+tJtIF1om0zlLqNMLHLFb5/fXCcVPGAJUoTW275/6D
 RVDi2es6Rp/qK8mR7RabnrYGot+WPUFQVSRppqbv7g5bMFkZWNQgZeR1LpodmWxjdb2P
 1VNAuIjjtfayfogeMGIklYCZnCprAs+FzbLDqL4+TEq0NgTO6FnvH2AQAFqSiHWRiz0W
 EQFZjRr+oQkRtQ2n9Z1+w3KKfqFwhODNTUOkM2JkfGB6NJVjccucfmeimJIQ5bjqnsx8
 wZlFKffEeAQdTgIwGBcbVlWMfTm1kCRxwTsXebi1LTKvrlIPv2mddhZLBRsKmQeHxYQA
 j7pA==
X-Gm-Message-State: APjAAAWEGM8p4v4TmMmUQlxPqR5W4+mSiE91UNNJsa9xiH+poqnjFBun
 TiJrix7IwoPqnp5E38vfLQI=
X-Google-Smtp-Source: APXvYqyL15uYdajB2iI58qGD1JEEakyGlmFw5ohooome+luG+1GwLzdTbabqLGaQPO5RqHMw47emdQ==
X-Received: by 2002:a05:600c:290f:: with SMTP id
 i15mr23101921wmd.115.1578950626795; 
 Mon, 13 Jan 2020 13:23:46 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-230.amazon.com.
 [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id w17sm16900369wrt.89.2020.01.13.13.23.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jan 2020 13:23:46 -0800 (PST)
To: "Durrant, Paul" <pdurrant@amazon.co.uk>,
 "jandryuk@gmail.com" <jandryuk@gmail.com>
References: <20200109114816.2293-1-pdurrant@amazon.com>
 <20200109114816.2293-5-pdurrant@amazon.com>
 <CAKf6xptYj+qwpjHLFidnGidphmOZtyu56menMd0ScfLh-X064A@mail.gmail.com>
 <6696d0425bbb4b50a064221b37bdcfaf@EX13D32EUC003.ant.amazon.com>
From: Julien Grall <julien@xen.org>
Message-ID: <01d32c81-9977-980a-f6c9-75a8cbbd370c@xen.org>
Date: Mon, 13 Jan 2020 21:23:45 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <6696d0425bbb4b50a064221b37bdcfaf@EX13D32EUC003.ant.amazon.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v2 4/6] libxl: allow creation of domains
 with a specified or random domid
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUGF1bCwKCk9uIDEzLzAxLzIwMjAgMTY6NTQsIER1cnJhbnQsIFBhdWwgd3JvdGU6Cj4+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4+IEZyb206IGphbmRyeXVrQGdtYWlsLmNvbSA8amFu
ZHJ5dWtAZ21haWwuY29tPgo+PiBTZW50OiAxMyBKYW51YXJ5IDIwMjAgMTY6MTYKPj4gVG86IER1
cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51az4KPj4gQ2M6IHhlbi1kZXZlbCA8eGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPjsgQW50aG9ueSBQRVJBUkQKPj4gPGFudGhvbnku
cGVyYXJkQGNpdHJpeC5jb20+OyBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNv
bT47IFdlaQo+PiBMaXUgPHdsQHhlbi5vcmc+Cj4+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBb
UEFUQ0ggdjIgNC82XSBsaWJ4bDogYWxsb3cgY3JlYXRpb24gb2YgZG9tYWlucwo+PiB3aXRoIGEg
c3BlY2lmaWVkIG9yIHJhbmRvbSBkb21pZAo+Pgo+PiBPbiBUaHUsIEphbiA5LCAyMDIwIGF0IDY6
NTAgQU0gUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPiB3cm90ZToKPj4+Cj4+PiBU
aGlzIHBhdGNoIGFkZHMgYSAnZG9taWQnIGZpZWxkIHRvIGxpYnhsX2RvbWFpbl9jcmVhdGVfaW5m
byBhbmQgdGhlbgo+Pj4gbW9kaWZpZXMgZG9fZG9tYWluX2NyZWF0ZSgpIHRvIHVzZSB0aGF0IHZh
bHVlIGlmIGl0IGlzIHZhbGlkLiBBbnkgdmFsaWQKPj4+IGRvbWlkIHdpbGwgYmUgY2hlY2tlZCBh
Z2FpbnN0IHRoZSByZXRpcmVkIGRvbWlkIGxpc3QgYmVmb3JlIGJlaW5nIHBhc3NlZAo+Pj4gdG8g
bGlieGxfX2RvbWFpbl9tYWtlKCkuCj4+PiBJZiB0aGUgZG9taWQgdmFsdWUgaXMgaW52YWxpZCB0
aGVuIFhlbiB3aWxsIGNob29zZSB0aGUgZG9taWQsIGFzIGJlZm9yZSwKPj4+IHVubGVzcyB0aGUg
dmFsdWUgaXMgdGhlIG5ldyBzcGVjaWFsIFJBTkRPTV9ET01JRCB2YWx1ZSBhZGRlZCB0byB0aGUg
QVBJLgo+Pj4gVGhpcyB2YWx1ZSBpbnN0cnVjdHMgbGlieGxfX2RvbWFpbl9tYWtlKCkgdG8gc2Vs
ZWN0IGEgcmFuZG9tIGRvbWlkCj4+IHZhbHVlLAo+Pj4gY2hlY2sgaXQgZm9yIHZhbGlkaXR5LCB2
ZXJpZnkgaXQgZG9lcyBub3QgbWF0Y2ggYSByZXRpcmVkIGRvbWFpbiwgYW5kCj4+IHRoZW4KPj4+
IHBhc3MgaXQgdG8gWGVuJ3MgWEVOX0RPTUNUTF9jcmVhdGVkb21haW4gb3BlcmF0aW9uLiBJZiBY
ZW4gZGV0ZXJtaW5lcwo+PiB0aGF0Cj4+PiBpdCBjby1pbmNpZGVzIHdpdGggYW4gZXhpc3Rpbmcg
ZG9tYWluLCBhIG5ldyByYW5kb20gdmFsdWUgd2lsbCBiZQo+Pj4gc2VsZWN0ZWQgYW5kIHRoZSBv
cGVyYXRpb24gd2lsbCBiZSByZS10cmllZC4KPj4+Cj4+PiBOT1RFOiBsaWJ4bF9fbG9ndigpIGlz
IGFsc28gbW9kaWZpZWQgdG8gb25seSBsb2cgdmFsaWQgZG9taWQgdmFsdWVzIGluCj4+PiAgICAg
ICAgbWVzc2FnZXMgcmF0aGVyIHRoYW4gYW55IGRvbWlkLCB2YWxpZCBvciBvdGhlcndpc2UsIHRo
YXQgaXMgbm90Cj4+PiAgICAgICAgSU5WQUxJRF9ET01JRC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5
OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+Cj4+PiAtLS0KPj4+IENjOiBJYW4g
SmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KPj4+IENjOiBXZWkgTGl1IDx3bEB4
ZW4ub3JnPgo+Pj4gQ2M6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29t
Pgo+Pj4KPj4+IHYyOgo+Pj4gICAtIFJlLXdvcmtlZCB0byB1c2UgYSB2YWx1ZSBmcm9tIGxpYnhs
X2RvbWFpbl9jcmVhdGVfaW5mbwo+Pj4gLS0tCj4+PiAgIHRvb2xzL2xpYnhsL2xpYnhsLmggICAg
ICAgICAgfCAgOSArKysrKysrKysKPj4+ICAgdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMgICB8
IDMyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCj4+PiAgIHRvb2xzL2xpYnhsL2xp
YnhsX2ludGVybmFsLmMgfCAgMiArLQo+Pj4gICB0b29scy9saWJ4bC9saWJ4bF90eXBlcy5pZGwg
IHwgIDEgKwo+Pj4gICA0IGZpbGVzIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCj4+Pgo+Pgo+PiA8c25pcD4KPj4KPj4+IGRpZmYgLS1naXQgYS90b29scy9saWJ4bC9s
aWJ4bF9jcmVhdGUuYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jCj4+PiBpbmRleCAxODM1
YTU1MDJjLi5lZTc2ZGVlMzY0IDEwMDY0NAo+Pj4gLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfY3Jl
YXRlLmMKPj4+ICsrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jCj4+PiBAQCAtNjAwLDkg
KzYwMCwzOSBAQCBpbnQgbGlieGxfX2RvbWFpbl9tYWtlKGxpYnhsX19nYyAqZ2MsCj4+IGxpYnhs
X2RvbWFpbl9jb25maWcgKmRfY29uZmlnLAo+Pj4gICAgICAgICAgICAgICBnb3RvIG91dDsKPj4+
ICAgICAgICAgICB9Cj4+Pgo+Pj4gLSAgICAgICAgcmV0ID0geGNfZG9tYWluX2NyZWF0ZShjdHgt
PnhjaCwgZG9taWQsICZjcmVhdGUpOwo+Pj4gKyAgICAgICAgaWYgKGxpYnhsX2RvbWlkX3ZhbGlk
X2d1ZXN0KGluZm8tPmRvbWlkKSkgewo+Pj4gKyAgICAgICAgICAgICpkb21pZCA9IGluZm8tPmRv
bWlkOwo+Pj4gKwo+Pj4gKyAgICAgICAgICAgIGlmIChsaWJ4bF9faXNfcmV0aXJlZF9kb21pZChn
YywgKmRvbWlkKSkgewo+Pj4gKyAgICAgICAgICAgICAgICBMT0dFRChFUlJPUiwgKmRvbWlkLCAi
ZG9tYWluIGlkIGlzIHJldGlyZWQiKTsKPj4+ICsgICAgICAgICAgICAgICAgcmMgPSBFUlJPUl9G
QUlMOwo+Pj4gKyAgICAgICAgICAgICAgICBnb3RvIG91dDsKPj4+ICsgICAgICAgICAgICB9Cj4+
PiArICAgICAgICB9IGVsc2UgaWYgKGluZm8tPmRvbWlkID09IFJBTkRPTV9ET01JRCkgewo+Pj4g
KyAgICAgICAgICAgICpkb21pZCA9IDA7IC8qIFplcm8tb3V0IGluaXRpYWwgdmFsdWUgKi8KPj4+
ICsgICAgICAgIH0KPj4+ICsKPj4+ICsgICAgICAgIGZvciAoOzspIHsKPj4+ICsgICAgICAgICAg
ICBpZiAoaW5mby0+ZG9taWQgPT0gUkFORE9NX0RPTUlEKSB7Cj4+PiArICAgICAgICAgICAgICAg
IC8qIFJhbmRvbWl6ZSBsb3dlciBvcmRlciBieXRlcyAqLwo+Pj4gKyAgICAgICAgICAgICAgICBy
ZXQgPSBsaWJ4bF9fcmFuZG9tX2J5dGVzKGdjLCAodm9pZCAqKWRvbWlkLAo+Pj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVvZih1aW50MTZfdCkpOwo+Pgo+
PiBDYXN0aW5nIHRvIHZvaWQgKiBhc3N1bWVzIGxpdHRsZSBlbmRpYW4uCj4gCj4gSSB0aGluayB0
aGF0J3MgYSBmYWlybHkgc2FmZSBhc3N1bXB0aW9uIGFzIGZhciBhcyBYZW4gZ29lcy4uLgoKTm90
IHJlYWxseSwgdGhlcmUgYXJlIHRlY2huaWNhbGx5IG5vdGhpbmcgKG90aGVyIHRoYW4gYnVnIGZp
eGVzKSAKcHJldmVudGluZyB1cyB0byB1c2UgYSBiaWcgZW5kaWFuIGd1ZXN0IG9uIFhlbiBvbiBB
cm0uCgpJIGFjdHVhbGx5IGRpZCBwbGF5IHdpdGggYmlnIGVuZGlhbiBvbiBYZW4gaW4gdGhlIHBh
c3QgYW5kIG1hbmFnZWQgdG8gCmdldCBhIGd1ZXN0IHJ1bm5pbmcuIFRoZSBtYWluIGFubm95aW5n
IHBhcnQgaXMgTGludXggYXMgaXQgaXMgYXNzdW1pbmcgCnRvIHVzZSB0aGUgc2FtZSBlbmRpYW4g
YXMgdGhlIGh5cGVydmlzb3IuIEJ1dCBvdGhlciBPUyBtYXkgbm90IGhhdmUgdGhpcyAKaXNzdWVz
Li4uCgpUaGUgaHlwZXJ2aXNvciBpdHNlbGYgaXMgbGlrZWx5IGdvaW5nIHRvIHN0YXkgbGl0dGxl
IGVuZGlhbiwgc28gZG9lcyB0aGUgCmludGVyZmFjZS4gRm9yIHRoZSB0b29scywgd2Ugc2hvdWxk
IGFpbSB0byBub3QgaW50cm9kdWNlIG1vcmUgYXNzdW1wdGlvbiAKdGhhdCB0aGUgc29mdHdhcmUg
d2lsbCBiZSBsaXR0bGUgZW5kaWFuLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
