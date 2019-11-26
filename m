Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B616410A6BF
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 23:44:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZjXI-0005tH-23; Tue, 26 Nov 2019 22:42:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LFuF=ZS=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iZjXG-0005tC-DV
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 22:42:18 +0000
X-Inumbo-ID: ff6c0bda-109d-11ea-a3a9-12813bfff9fa
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff6c0bda-109d-11ea-a3a9-12813bfff9fa;
 Tue, 26 Nov 2019 22:42:17 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id t26so5235687wmi.4
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2019 14:42:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0+Ad0UwNz1eeHz6dipXOsbsY5WqBVFD4OSmqtL5znWw=;
 b=EXE2yGPooNlNipJwMDFiUmTqhE5Tfn6UwQkHapM0/TFFMAdIq5FUAzQ08kXK/gyHyA
 bzHW8QmPkFKr9lZNRVcmrSzpvf6lr9oxhLizb1UKlLl5loeXwNtXatb01N47TS1kfO6V
 J1jzI3ywARWjfePXw/Hr+eCThs+zljROgJNkH1uMGw0aSLC2yaaDcbsMf/rkp8R5vJY0
 wZX7OZflLstHwq1SI1PCKVZt4IZkWiFchZRF0zcoeZJRkrHb0kH+XoObldvH3LziQzUw
 nJDZ2n4zNXdJGYg47gxrQEszDM7u1ls6nClz8MPwZ0puuPu6LKfeq6HPqdtDStL8mDkb
 Cm5Q==
X-Gm-Message-State: APjAAAXl3++hecVIXd5eo6DGzfKE3U5Ey8Rj4O/rNMiFx5qqIfJXT9JG
 Yo/Etbpj2C6AizqiuhKAnno=
X-Google-Smtp-Source: APXvYqz5DU+egggKxiePeviKV+Uyjpo1uYyI5u8bXlujyLqqPgcH6u7agBZa6tgohPJuYEBcjAF9Nw==
X-Received: by 2002:a1c:6255:: with SMTP id w82mr1221714wmb.20.1574808136540; 
 Tue, 26 Nov 2019 14:42:16 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com
 (cpc91200-cmbg18-2-0-cust94.5-4.cable.virginm.net. [81.100.41.95])
 by smtp.gmail.com with ESMTPSA id j11sm16387150wrq.26.2019.11.26.14.42.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2019 14:42:15 -0800 (PST)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20191115200115.44890-1-stewart.hildebrand@dornerworks.com>
 <20191115201037.44982-3-stewart.hildebrand@dornerworks.com>
 <b0bac87a-3a11-bbb1-6c13-a23087590d87@xen.org>
 <faf54fd5-0a42-2683-5ddf-0137b2b65046@xen.org>
 <alpine.DEB.2.21.1911261424540.8205@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <69e077dc-0512-1520-b406-03a7f3059701@xen.org>
Date: Tue, 26 Nov 2019 22:42:14 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1911261424540.8205@sstabellini-ThinkPad-T480s>
Content-Language: en-GB
Subject: Re: [Xen-devel] [XEN PATCH v3 07/11] xen: arm: vgic: allow delivery
 of PPIs to guests
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
Cc: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andre Przywara <andre.przywara@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyNi8xMS8yMDE5IDIyOjM2LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24gTW9u
LCAyNSBOb3YgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBPbiAyMy8xMS8yMDE5IDIwOjM1
LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBIaSwKPj4+Cj4+PiBPbiAxNS8xMS8yMDE5IDIwOjEw
LCBTdGV3YXJ0IEhpbGRlYnJhbmQgd3JvdGU6Cj4+Pj4gQWxsb3cgdmdpY19nZXRfaHdfaXJxX2Rl
c2MgdG8gYmUgY2FsbGVkIHdpdGggYSB2Y3B1IGFyZ3VtZW50Lgo+Pj4+Cj4+Pj4gVXNlIHZjcHUg
YXJndW1lbnQgaW4gdmdpY19jb25uZWN0X2h3X2lycS4KPj4+Pgo+Pj4+IHZnaWNfY29ubmVjdF9o
d19pcnEgaXMgY2FsbGVkIGZvciBQUElzIGFuZCBTUElzLCBub3QgU0dJcy4gRW5mb3JjZSB3aXRo
Cj4+Pj4gQVNTRVJUcy4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFN0ZXdhcnQgSGlsZGVicmFu
ZCA8c3Rld2FydC5oaWxkZWJyYW5kQGRvcm5lcndvcmtzLmNvbT4KPj4+Pgo+Pj4+IC0tLQo+Pj4+
IHYzOiBuZXcgcGF0Y2gKPj4+Pgo+Pj4+IC0tLQo+Pj4+IE5vdGU6IEkgaGF2ZSBvbmx5IG1vZGlm
aWVkIHRoZSBvbGQgdmdpYyB0byBhbGxvdyBkZWxpdmVyeSBvZiBQUElzLgo+Pj4KPj4+IFRoZSBu
ZXcgdkdJQyBzaG91bGQgYWxzbyBiZSBtb2RpZmllZCB0byBzdXBwb3J0IGRlbGl2ZXJ5IG9mIFBQ
SXMuCj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdmdpYy5jIGIveGVuL2FyY2gv
YXJtL3ZnaWMuYwo+Pj4+IGluZGV4IDgyZjUyNGEzNWMuLmMzOTMzYzI2ODcgMTAwNjQ0Cj4+Pj4g
LS0tIGEveGVuL2FyY2gvYXJtL3ZnaWMuYwo+Pj4+ICsrKyBiL3hlbi9hcmNoL2FybS92Z2ljLmMK
Pj4+PiBAQCAtNDEwLDEwICs0MTAsMTAgQEAgdm9pZCB2Z2ljX2VuYWJsZV9pcnFzKHN0cnVjdCB2
Y3B1ICp2LCB1aW50MzJfdCByLAo+Pj4+IGludCBuKQo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBpcnFfc2V0X2FmZmluaXR5KHAtPmRlc2MsIGNwdW1hc2tfb2Yodl90YXJnZXQtPnBy
b2Nlc3NvcikpOwo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzcGluX2xvY2tfaXJx
c2F2ZSgmcC0+ZGVzYy0+bG9jaywgZmxhZ3MpOwo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAvKgo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBUaGUgaXJxIGNhbm5vdCBi
ZSBhIFBQSSwgd2Ugb25seSBzdXBwb3J0IGRlbGl2ZXJ5IG9mIFNQSXMKPj4+PiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICogdG8gZ3Vlc3RzLgo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgKiBUaGUgaXJxIGNhbm5vdCBiZSBhIFNHSSwgd2Ugb25seSBzdXBwb3J0IGRlbGl2ZXJ5IG9m
IFNQSXMKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogYW5kIFBQSXMgdG8gZ3Vlc3Rz
Lgo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICovCj4+Pj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgQVNTRVJUKGlycSA+PSAzMik7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgQVNTRVJUKGlycSA+PSBOUl9TR0lTKTsKPj4+Cj4+PiBXZSB1c3VhbGx5IHB1dCBBU1NFUlQo
KSBpbiBwbGFjZSB3ZSBrbm93IHRoYXQgY29kZSB3b3VsZG4ndCBiZSBhYmxlIHRvIHdvcmsKPj4+
IGNvcnJlY3RseSBpZiB0aGVyZSBBU1NFUlQgd2VyZSBoaXQuIEluIHRoaXMgcGFydGljdWxhciBj
YXNlOgo+Pj4KPj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCBpcnFfdHlwZV9z
ZXRfYnlfZG9tYWluKGQpICkKPj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBnaWNfc2V0X2lycV90eXBlKHAtPmRlc2MsIHZnaWNfZ2V0X3ZpcnFfdHlwZSh2LCBuLCBpKSk7
Cj4+Pgo+Pj4gMSkgV2UgZG9uJ3Qgd2FudCB0byBhbGxvdyBhbnkgZG9tYWluIChpbmNsdWRpbmcg
RG9tMCkgdG8gbW9kaWZ5IHRoZQo+Pj4gaW50ZXJydXB0IHR5cGUgKGkuZS4gbGV2ZWwvZWRnZSkg
Zm9yIFBQSXMgYXMgdGhpcyBpcyBzaGFyZWQuIFlvdSB3aWxsIGFsc28KPj4+IG1vc3QgbGlrZWx5
IG5lZWQgdG8gbW9kaWZ5IHRoZSBjb3VudGVycGFydCBpbiBzZXR1cF9ndWVzdF9pcnEoKS4KPj4+
Cj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHAtPmRlc2MtPmhhbmRsZXItPmVuYWJs
ZShwLT5kZXNjKTsKPj4+Cj4+PiAyKSBPbiBHSUN2MywgdGhlIHJlLWRpc3RyaWJ1dG9yIG9mIHZD
UFUgQSBpcyBhY2Nlc3NpYmxlIGJ5IHZDUFUgQi4gU28gdkNQVSBCCj4+PiBjb3VsZCBlbmFibGUg
dGhlIFNHSSBmb3IgdkNQVSBBLiBCdXQgdGhpcyB3b3VsZCBiZSBjYWxsZWQgb24gdGhlIHdyb25n
IHBDUFUKPj4+IGxlYWRpbmcgdG8gaW5jb25zaXN0ZW5jeSBiZXR3ZWVuIHRoZSBoYXJkd2FyZSBz
dGF0ZSBvZiB0aGUgaW50ZXJuYWwgdkdJQwo+Pj4gc3RhdGUuCj4+Cj4+IEkgdGhvdWdodCBhIGJp
dCBtb3JlIG9mIHRoZSBpc3N1ZSBvdmVyIHRoZSB3ZWVrLWVuZC4gVGhlIGN1cnJlbnQgdkdJQyBp
cwo+PiBmYWlybHkgbWVzc3kuIEkgY2FuIHNlZSB0d28gc29sdXRpb25zIG9uIGhvdyB0byBzb2x2
ZSB0aGlzOgo+PiAgICAgIDEpIFNlbmQgYW4gSVBJIHRvIHRoZSBwQ1BVIHdoZXJlIHRoZSB2Q1BV
IEEgaXMgcnVubmluZyBhbmQgZGlzYWJsZS9lbmFibGUKPj4gdGhlIGludGVycnVwdC4gVGhlIG90
aGVyIHNpZGUgd291bGQgbmVlZCB0byB0aGUgdkNQVSB3YXMgYWN0dWFsbHkgcnVubmluZyB0bwo+
PiBhdm9pZCBkaXNhYmxpbmcgdGhlIFBQSSBmb3IgdGhlIHdyb25nIHBDUFUKPj4gICAgICAyKSBL
ZWVwIHRoZSBIVyBpbnRlcnJ1cHQgYWx3YXlzIGVuYWJsZWQKPj4KPj4gV2UgcHJvcGFnYXRlZCB0
aGUgZW5hYmxlL2Rpc2FibGUgYmVjYXVzZSBvZiBzb21lIG1lc3N5IHBhcnQgaW4gdGhlIHZHSUM6
Cj4+ICAgICAgLSB2Z2ljX2luamVjdF9pcnEoKSB3aWxsIG5vdCBxdWV1ZSBhbnkgcGVuZGluZyBp
bnRlcnJ1cHQgaWYgdGhlIHZDUFUgaXMKPj4gb2ZmbGluZS4gV2hpbGUgaW50ZXJydXB0IGNhbm5v
dCBiZSBkZWxpdmVyZWQsIHdlIHN0aWxsIG5lZWQgdG8ga2VlcCB0aGVtCj4+IHBlbmRpbmcgYXMg
dGhleSB3aWxsIG5ldmVyIG9jY3VyIGFnYWluIG90aGVyd2lzZS4gVGhpcyBpcyBiZWNhdXNlIHRo
ZXkgYXJlCj4+IGFjdGl2ZSBvbiB0aGUgaG9zdCBzaWRlIGFuZCB0aGUgZ3Vlc3QgaGFzIG5vIHdh
eSB0byBkZWFjdGl2YXRlIHRoZW0uCj4+ICAgICAgLSBPdXIgaW1wbGVtZW50YXRpb24gb2YgUFND
SSBDUFUgd2lsbCByZW1vdmUgYWxsIHBlbmRpbmcgaW50ZXJydXB0cyAoc2VlCj4+IHZnaWNfY2xl
YXJfcGVuZGluZ19pcnFzKCkpLiBJIGFtIG5vdCBlbnRpcmVseSBzdXJlIHRoZSBpbXBsaWNhdGlv
biBoZXJlCj4+IGJlY2F1c2Ugb2YgdGhlIHByZXZpb3VzLgo+Pgo+PiBUaGVyZSBhcmUgYSBwcm9i
YWJseSBtb3JlLiBBc2lkZSB0aGUgaXNzdWVzIHdpdGggaXQsIEkgZG9uJ3QgcmVhbGx5IHNlZSBn
b29kCj4+IGFkdmFudGFnZSB0byBwcm9wYWdhdGUgdGhlIGludGVycnVwdCBzdGF0ZSBhcyB0aGUg
aW50ZXJydXB0cyAoUFBJcywgU1BJcykgaGF2ZQo+PiBhY3RpdmUgc3RhdGUuIFNvIHRoZXkgY2Fu
IG9ubHkgYmUgcmVjZWl2ZWQgb25jZSB1bnRpbCB0aGUgZ3Vlc3QgYWN0dWFsbHkKPj4gaGFuZGxl
cyBpdC4KPj4KPj4gU28gbXkgcHJlZmVyZW5jZSB3b3VsZCBzdGlsbCBiZSAyKSBiZWNhdXNlIHRo
aXMgbWFrZXMgdGhlIGNvZGUgc2ltcGxlciwgYXZvaWQKPj4gSVBJIGFuZCBvdGhlciBwb3RlbnRp
YWwgbG9ja2luZyB0cm91YmxlLgo+IAo+IFllcywgSSB0aGluayB0aGF0IGlzIGEgZ29vZCBzdWdn
ZXN0aW9uLiBJIHRha2UgdGhhdCB5b3UgbWVhbiB0aGF0IGluCj4gdmdpY19kaXNhYmxlX2lycXMg
Zm9yIFBQSXMgd2Ugd291bGQgb25seSBjbGVhciBHSUNfSVJRX0dVRVNUX0VOQUJMRUQKPiB0aGVu
IHJldHVybiBiYXNpY2FsbHksIHJpZ2h0PwpOb3QgcmVhbGx5LCBJIGFtIG9ubHkgc3VnZ2VzdGlu
ZyB0byByZW1vdmUgdGhlIHBhcnQKCmlmICggZGVzYyAhPSBOVUxMICkKICAgLi4uCgpCdXQgdGhp
cyBjaGFuZ2UgYWxvbmUgaXMgbm90IGVub3VnaC4gSXQgd291bGQgcmVxdWlyZSBzb21lIG1vZGlm
aWNhdGlvbiAKaW4gdGhlIHJlc3Qgb2YgdGhlIHZHSUMgKHNlZSBteSBwcmV2aW91cyBlLW1haWwp
IGFuZCBsaWtlbHkgc29tZSAKaW52ZXN0aWdhdGlvbiB0byB1bmRlcnN0YW5kIHRoZSBpbXBsaWNh
dGlvbiBvZiBrZWVwaW5nIHRoZSBpbnRlcnJ1cHQgCmVuYWJsZWQgZnJvbSB0aGUgSFcgKEkgYW0g
YSBiaXQgd29ycnkgd2UgbWF5IGhhdmUgYmFja2VkIHRoaXMgYXNzdW1wdGlvbiAKaW50byBvdGhl
ciBwYXJ0IG9mIHRoZSB2R0lDIDooKS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
