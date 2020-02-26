Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29746170603
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 18:25:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j70NW-0005mW-4k; Wed, 26 Feb 2020 17:21:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5J6w=4O=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1j70NU-0005mR-Hz
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 17:21:44 +0000
X-Inumbo-ID: 758cd946-58bc-11ea-aba8-bc764e2007e4
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 758cd946-58bc-11ea-aba8-bc764e2007e4;
 Wed, 26 Feb 2020 17:21:44 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id dm3so3914285edb.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2020 09:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JFGn9RcjLU2YktGVjORFqrPB+Q7Gf8TtxYQBU56k1c8=;
 b=TxQYa2fRtWyuTCObwuAQsk0oJjdfBs9u9G0ZHNBM/bahhaL3ZhbMeD7bFCf+igfYGq
 dAyWSqyuv/7EgYwh9ieqkvLcDnwUgKp/d63CtEpjl/odgt54Hpl9taRQg3Z1vCv5zP+B
 9SbQa/qhjr9ComNxl3WH4KyZFbAigbGHltu9LkgZa/xD8EdOpCNpqkFmbXzwaiptfZ9j
 djDoq3lkF5SKgCs8qbHkPP2mhllLEHmf32wF7dgbZxYaWKjBTU3z2upzHZxivkSffw6e
 GzAStBLDzDlbKd4LDGvXI6aRvwp66Kpb0TulignQ2HJp4wtOh8QaIUTOqKrvnbNdqhbW
 Svaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JFGn9RcjLU2YktGVjORFqrPB+Q7Gf8TtxYQBU56k1c8=;
 b=Np9I5QrkVFfnHNSv8V4L3qlnvBnLpLlJhQqk3MFQvoFIKfGqd9w8ZJYX7XWPvHZL0D
 ALtDOLO9ZbBEzIYcXcjGrlUf1lQ51mFedT7tuR3OhXLL+0ztkMI31KpOzGZRJ5LY9+Tz
 wXkrZwdylJc7Tyeu1OAPO0soac36IMUKk0C+4uFf12/e3s8Q5vMVUxQqzD7cvtpyT693
 4s0yEAQBgglzuGkeKLN9ZOr4W33ZaZi+yUEKaBd8qkqiAD1Seqywk8wNaqoUW2ZnGOSE
 GFlc56ohzRdyuW8UaUH5kVjqJIg3GKn9ye/G5X0UwSFX8i2mkQPZHDC4C8j9Uw780aTd
 XUWg==
X-Gm-Message-State: APjAAAVea21Xlp4RJDJQ1eDvU4OVIqBv/YQs58sPno0ShOUZ9PWbrUCn
 kz9BciTQb7kTQ7gihFaUztAKUWfAwN8=
X-Google-Smtp-Source: APXvYqxWc3EI7dKbMM2XsIhMPU9cYaLIuwLTWmw3j8I03pe61Jcr/BQQp46Vyjk3V4tt7dIRZiFq3A==
X-Received: by 2002:aa7:d90e:: with SMTP id a14mr409577edr.56.1582737702695;
 Wed, 26 Feb 2020 09:21:42 -0800 (PST)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com.
 [209.85.221.43])
 by smtp.gmail.com with ESMTPSA id j63sm164234edd.81.2020.02.26.09.21.41
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2020 09:21:42 -0800 (PST)
Received: by mail-wr1-f43.google.com with SMTP id z15so4110471wrl.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2020 09:21:41 -0800 (PST)
X-Received: by 2002:adf:9cca:: with SMTP id h10mr6937431wre.390.1582737701237; 
 Wed, 26 Feb 2020 09:21:41 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582658216.git.tamas.lengyel@intel.com>
 <8df741964b56c10ed912f9187dcb31aae7251085.1582658216.git.tamas.lengyel@intel.com>
 <20200226151247.GF24458@Air-de-Roger.citrite.net>
 <CABfawhn1mDFcP3saj3DzritNS2Zxzs5tsLeHuobwYAG3SYWOzA@mail.gmail.com>
 <20200226153621.GH24458@Air-de-Roger.citrite.net>
 <CABfawhkp6nvPt4KM8rOsE06D=h_1iyeCRi9aS2i3OvFBnHL6KA@mail.gmail.com>
 <20200226161036.GJ24458@Air-de-Roger.citrite.net>
 <CABfawhmrM3iS5QMkMz78b8K25s9V947yJPBULAs4D5Bt7FUDXQ@mail.gmail.com>
In-Reply-To: <CABfawhmrM3iS5QMkMz78b8K25s9V947yJPBULAs4D5Bt7FUDXQ@mail.gmail.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 26 Feb 2020 10:21:05 -0700
X-Gmail-Original-Message-ID: <CABfawhmtPPZ9tGSgasq85Jn44+vy7TuJnZzg8S7R8h=LpJsT+w@mail.gmail.com>
Message-ID: <CABfawhmtPPZ9tGSgasq85Jn44+vy7TuJnZzg8S7R8h=LpJsT+w@mail.gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [Xen-devel] [PATCH v10 1/3] xen/mem_sharing: VM forking
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMjYsIDIwMjAgYXQgOToxNyBBTSBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRr
bGVuZ3llbC5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBGZWIgMjYsIDIwMjAgYXQgOToxMCBBTSBS
b2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24g
V2VkLCBGZWIgMjYsIDIwMjAgYXQgMDg6NTg6MDVBTSAtMDcwMCwgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+ID4gPiBPbiBXZWQsIEZlYiAyNiwgMjAyMCBhdCA4OjM2IEFNIFJvZ2VyIFBhdSBNb25u
w6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IE9uIFdlZCwg
RmViIDI2LCAyMDIwIGF0IDA4OjIwOjMwQU0gLTA3MDAsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToK
PiA+ID4gPiA+ID4gPiArc3RhdGljIGludCBwb3B1bGF0ZV9zcGVjaWFsX3BhZ2VzKHN0cnVjdCBk
b21haW4gKmNkKQo+ID4gPiA+ID4gPiA+ICt7Cj4gPiA+ID4gPiA+ID4gKyAgICBzdHJ1Y3QgcDJt
X2RvbWFpbiAqcDJtID0gcDJtX2dldF9ob3N0cDJtKGNkKTsKPiA+ID4gPiA+ID4gPiArICAgIHN0
YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgcGFyYW1zW10gPQo+ID4gPiA+ID4gPiA+ICsgICAgewo+
ID4gPiA+ID4gPiA+ICsgICAgICAgIEhWTV9QQVJBTV9TVE9SRV9QRk4sCj4gPiA+ID4gPiA+ID4g
KyAgICAgICAgSFZNX1BBUkFNX0lPUkVRX1BGTiwKPiA+ID4gPiA+ID4gPiArICAgICAgICBIVk1f
UEFSQU1fQlVGSU9SRVFfUEZOLAo+ID4gPiA+ID4gPiA+ICsgICAgICAgIEhWTV9QQVJBTV9DT05T
T0xFX1BGTgo+ID4gPiA+ID4gPiA+ICsgICAgfTsKPiA+ID4gPiA+ID4gPiArICAgIHVuc2lnbmVk
IGludCBpOwo+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiArICAgIGZvciAoIGk9MDsgaTw0
OyBpKysgKQo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBOaXQ6IGNhbiB5b3UgcGxlYXNlIGFkZCBz
b21lIHNwYWNlcyBhcm91bmQgdGhlIG9wZXJhdG9ycz8KPiA+ID4gPiA+Cj4gPiA+ID4gPiBTdXJl
Lgo+ID4gPiA+ID4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiArICAgIHsKPiA+ID4gPiA+ID4g
PiArICAgICAgICB1aW50NjRfdCB2YWx1ZSA9IDA7Cj4gPiA+ID4gPiA+ID4gKyAgICAgICAgbWZu
X3QgbmV3X21mbjsKPiA+ID4gPiA+ID4gPiArICAgICAgICBzdHJ1Y3QgcGFnZV9pbmZvICpwYWdl
Owo+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiArICAgICAgICBpZiAoIGh2bV9nZXRfcGFy
YW0oY2QsIHBhcmFtc1tpXSwgJnZhbHVlKSB8fCAhdmFsdWUgKQo+ID4gPiA+ID4gPiA+ICsgICAg
ICAgICAgICBjb250aW51ZTsKPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gKyAgICAgICAg
aWYgKCAhKHBhZ2UgPSBhbGxvY19kb21oZWFwX3BhZ2UoY2QsIDApKSApCj4gPiA+ID4gPiA+ID4g
KyAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4g
PiArICAgICAgICBuZXdfbWZuID0gcGFnZV90b19tZm4ocGFnZSk7Cj4gPiA+ID4gPiA+ID4gKyAg
ICAgICAgc2V0X2dwZm5fZnJvbV9tZm4obWZuX3gobmV3X21mbiksIHZhbHVlKTsKPiA+ID4gPiA+
ID4gPiArCj4gPiA+ID4gPiA+ID4gKyAgICAgICAgcmV0dXJuIHAybS0+c2V0X2VudHJ5KHAybSwg
X2dmbih2YWx1ZSksIG5ld19tZm4sIFBBR0VfT1JERVJfNEssCj4gPiA+ID4gPiA+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHAybV9yYW1fcncsIHAybS0+ZGVmYXVsdF9hY2Nlc3Ms
IC0xKTsKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gSSB0aGluayB5b3UgYWxzbyBuZWVkIHRvIGNv
cHkgdGhlIGNvbnRlbnRzIGZyb20gdGhlIHBhcmVudCBwYWdlIGhlcmUuCj4gPiA+ID4gPgo+ID4g
PiA+ID4gVGhlIHRvb2xzdGFjayBzaW1wbHkgY2xlYXJzIHRoZXNlIHBhZ2VzIGR1cmluZyByZXN0
b3JlIHNvIEknbSBub3Qgc3VyZQo+ID4gPiA+ID4gKHNlZSBodHRwczovL3hlbmJpdHMueGVuLm9y
Zy9naXR3ZWIvP3A9eGVuLmdpdDthPWJsb2I7Zj10b29scy9saWJ4Yy94Y19zcl9yZXN0b3JlX3g4
Nl9odm0uYztoPTNmNzgyNDhmMzJmZWMyMzlkYjc3YjBlNDgzYjAxOTUyMTFlNmI5NzQ7aGI9SEVB
RCNsNjEpLgo+ID4gPiA+ID4gSSBkb24ndCBzZWUgd2h5IHlvdSB3b3VsZCBoYXZlIHRvIGNsZWFy
IHRoZSBwYWdlcyBmaXJzdCBpZiB0aGV5IGdldAo+ID4gPiA+ID4gb3ZlcndyaXR0ZW4gYnkgc2F2
ZWQgdmVyc2lvbnMgbGF0ZXIuIE9yIHRoZXNlIHBhZ2VzIGFyZSBleHBlY3RlZCB0byBiZQo+ID4g
PiA+ID4gdG9ybi1kb3duIGJ5IHRoZSBzYXZlL3Jlc3RvcmUgYXdhcmUgZ3Vlc3RzPwo+ID4gPiA+
Cj4gPiA+ID4gR3Vlc3RzIHVzaW5nIHRob3NlIHBhZ2VzIGtub3cgdGhleSBhcmUgdG9ybiBkb3du
IGR1cmluZyBzdXNwZW5kL3Jlc3VtZQo+ID4gPiA+IGFuZCBleHBlY3QgdG8gZmluZCBhIGNsZWFu
IHN0YXRlIHdoZW4gcmVzdW1pbmcuIFRoYXQncyBub3QgdGhlIGNhc2Ugd2l0aAo+ID4gPiA+IGZv
cmtpbmcgaG93ZXZlciwgYXMgdGhlIGd1ZXN0IGlzIGNvbXBsZXRlbHkgdW5hd2FyZSBvZiB0aGUg
Zm9yawo+ID4gPiA+IGhhcHBlbmluZy4KPiA+ID4gPgo+ID4gPiA+IE9uZSB0aGluZyBJJ20gbm90
IHN1cmUgb2YgaXMgd2hldGhlciB0aGUgYmFja2VuZHMgKHhlbnN0b3JlZCwKPiA+ID4gPiB4ZW5j
b25zb2xlZCkgd2lsbCBjb3BlIHdpdGggdGhvc2UgcGFnZXMgYmVpbmcgYWxyZWFkeSBwb3B1bGF0
ZWQgb24KPiA+ID4gPiBndWVzdCBjcmVhdGlvbi4KPiA+ID4gPgo+ID4gPiA+IEFGQUlDVCBhbm90
aGVyIGlzc3VlIGlzIHRoYXQgeGVuc3RvcmUgd2F0Y2hlcyBhcmUgbm90IGNvcGllZCBvdmVyIGZy
b20KPiA+ID4gPiB0aGUgcGFyZW50LCBzbyBhbnkgd2F0Y2hlcyB0aGUgcGFyZW50IG1pZ2h0IGhh
dmUgc2V0IHdpbGwgbm90IGZpcmUgb24KPiA+ID4gPiB0aGUgY2hpbGQuIFRoYXQgd291bGQgcmVx
dWlyZSBzb21lIGtpbmQgb2YgaW50ZXJhY3Rpb24gd2l0aCB4ZW5zdG9yZWQKPiA+ID4gPiBpbiBv
cmRlciB0byByZXF1ZXN0IGEgZ3Vlc3Qgc3RhdGUgdG8gYmUgY29waWVkIG92ZXIgdG8gYW5vdGhl
ciBndWVzdC4KPiA+ID4KPiA+ID4gU291bmRzIGxpa2UgaXQgbW9zdCBsaWtlbHkgd291bGQgbmVl
ZCB0byBiZSBoYW5kbGVkIGlmIHRoZSBndWVzdCB1c2VzCj4gPiA+IHRoZW0uIEknbSBub3Qgc3Vy
ZSBpZiBhIGRlZmF1bHQgTGludXggSFZNIGd1ZXN0IHVzZXMgdGhlbSB0aG91Z2guCj4gPgo+ID4g
TGludXggUFZIVk0gZG9lcyB1c2UgeGVuc3RvcmUgd2F0Y2hlcyB0byBtb25pdG9yIGJhY2tlbmQg
c3RhdGUKPiA+IGNoYW5nZXMsIGJ1dCBpdCB3b3VsZCByZXF1aXJlIGEgbm9uLXRyaXZpYWwgYW1v
dW50IG9mIHdvcmsgdG8gY2xvbmUKPiA+IHRoZSBzdGF0ZSBvZiBQViBkZXZpY2VzLCBzbyBJIGd1
ZXNzIGl0J3Mgc29tZXRoaW5nIHRvIGJlIGxlZnQgYXMgYQo+ID4gVE9ETyBpdGVtLgo+ID4KPiA+
ID4gQQo+ID4gPiBXaW5kb3dzIEhWTSBndWVzdCB3aXRob3V0IHRoZSBQViBkcml2ZXJzIGlzIGNl
cnRhaW5seSBub3QgWGVuIGF3YXJlIHNvCj4gPiA+IHRoZXJlIHRoaW5ncyBhbHJlYWR5IHdvcmsg
anVzdCBmaW5lIGFuZCB0aGF0IGlzIG91ciBwcmltYXJ5IHRhcmdldCBmb3IKPiA+ID4gb3VyIHVz
ZS1jYXNlLiBQVkhWTS9QVkggTGludXggZ3Vlc3RzIGFyZSBub3QuIFNvIHRoYXQncyByZWFsbHkg
b3V0c2lkZQo+ID4gPiB0aGUgc2NvcGUgb2Ygd2hhdCBJIGNhbiBjb250cmlidXRlIGF0IHRoZSBt
b21lbnQuCj4gPgo+ID4gU3VyZS4KPiA+Cj4gPiBDYW4geW91IHBsZWFzZSBhZGQgYSBUT0RPIGl0
ZW0gaGVyZSB0byBub3RlIHRoYXQgdGhlIGNvbnRlbnRzIG9mIHRob3NlCj4gPiBzcGVjaWFsIHBh
Z2VzIGxpa2VseSBuZWVkIHRvIGJlIGNvcGllZCBvdmVyLCBhbmQgdGhhdCB0aGUgc3RhdGUgb2Yg
UFYKPiA+IGRldmljZXMgYW5kIGludGVyZmFjZXMgdGhhdCByZWx5IG9uIGJhY2tlbmRzIHJ1bm5p
bmcgaW4gdXNlcnNwYWNlIGlzCj4gPiBub3QgaGFuZGxlZCBhdCBhbGwuCj4gPgo+Cj4gT2YgY291
cnNlLiBJIHdpbGwgZmluaXNoIHVwIHRoZSBQViB0aW1lciBwYXJ0cyBhbmQgY29weWluZyB0aGUg
c2hhcmVkCj4gaW5mbyBwYWdlLCBidXQgd2lsbCBsZWF2ZSB0aGUgcmVzdCBhcyBUT0RPLiBIb3Bl
ZnVsbHkgdGhpcyB3aWxsIGdldCBhdAo+IGxlYXN0IGEgZGVmYXVsdCBMaW51eCBIVk0gZm9yayB3
b3JraW5nIHRoZSBzYW1lIHdheSBhcyBXaW5kb3dzIGRvZXMsCj4gYnV0IGlmIG5vdCB0aGVuIEkn
bGwgdW5mb3J0dW5hdGVseSBoYXZlIHRvIGxlYXZlIGl0IGFzLWlzIGZvciBub3cuCj4KClVuZm9y
dHVuYXRlbHkgTGludXgncyBWTkMgY29uc29sZSBpcyBzdGlsbCBvbmx5IHJlc3BvbnNpdmUgaWYg
dGhlCnBhcmVudCB3YXMganVzdCByZXN0b3JlZCBmcm9tIGEgc2F2ZSBmaWxlLiBUaGVyZSBtdXN0
IGJlIHNvbWUgb3RoZXIKcGllY2VzIG1pc3NpbmcgaGVyZSBidXQgSSdtIGp1c3QgZ29pbmcgdG8g
ZG9jdW1lbnQgaXQgYXMgYSBUT0RPIGFzCml0J3MgcmVhbGx5IG91dHNpZGUgb3VyIHNjb3BlLgoK
VGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
