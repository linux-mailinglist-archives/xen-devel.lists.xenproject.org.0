Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B20173554
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 11:28:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7cqK-0005wT-Iu; Fri, 28 Feb 2020 10:26:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Vg/s=4Q=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j7cqJ-0005wN-Os
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 10:26:03 +0000
X-Inumbo-ID: b76c0d74-5a14-11ea-98f2-12813bfff9fa
Received: from mail-ed1-f65.google.com (unknown [209.85.208.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b76c0d74-5a14-11ea-98f2-12813bfff9fa;
 Fri, 28 Feb 2020 10:26:01 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id j17so2770423edp.3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Feb 2020 02:26:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K3I+mh98GL37xyMLCXnTNvdrZnEZScYEv7wstD3kQHU=;
 b=gWFVmgtFc0t63FCGAAm88U07D40tp6Z8BY/ffAR9b6zxWYV2SI8VToqX7mtYQJEhtb
 DN1kxsB2Xo7OyTunYY8BBpLlX4yeLdZDahvqA02vcKZNTrMCWWT+VIx4XldATgBUDCHQ
 7pzEc08BBn/tqXNwRSHDvhohWDagx5T+aSSoVzj7mUXg6GFewEHbaFtleJbf06mdhNK8
 3O1EOVPf/OmcbJ3AMtVe5UJA+bT/ENHi69Vwx6mXPioHDYwzBrEteLbHZ7C19H5N0+Xf
 jjBba+FiPAwEnKWLzg+BkzPUAEzDFvqJrMbIML+gtnuj+btEiaAczy4CrQKnidZ1/EMH
 5duQ==
X-Gm-Message-State: APjAAAWFum6MEiBPUpDY9e/SlKEnqH69RSbuQCjN9y5eYwEQi93ngTN+
 hL97L3fI30ab4PantUNvFQw=
X-Google-Smtp-Source: APXvYqxKYIMYM8MOdBkuR+w3CrFimS9Vt+wMIH7IKDf7bRKqTtkIj5cLvy4wuCfOoc3OYlvNIN4J3w==
X-Received: by 2002:a17:906:4058:: with SMTP id
 y24mr3590655ejj.280.1582885560749; 
 Fri, 28 Feb 2020 02:26:00 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-230.amazon.com.
 [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id v14sm466898edf.84.2020.02.28.02.25.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Feb 2020 02:26:00 -0800 (PST)
To: "Durrant, Paul" <pdurrant@amazon.co.uk>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20200226160848.1854-1-pdurrant@amazon.com>
 <20200226160848.1854-3-pdurrant@amazon.com>
 <4ad6fe4e-40bd-7a04-54d2-38edb56346e9@xen.org>
 <ff397422acb84e0a93bede1b742bf822@EX13D32EUC003.ant.amazon.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b8b53a09-8c02-3f7a-61a8-88b19186f768@xen.org>
Date: Fri, 28 Feb 2020 10:25:59 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <ff397422acb84e0a93bede1b742bf822@EX13D32EUC003.ant.amazon.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 2/3] libxl: make creation of xenstore
 suspend event channel node optional
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUGF1bCwKCk9uIDI4LzAyLzIwMjAgMDk6MjgsIER1cnJhbnQsIFBhdWwgd3JvdGU6Cj4+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4+IEZyb206IEp1bGllbiBHcmFsbCA8anVsaWVuQHhl
bi5vcmc+Cj4+IFNlbnQ6IDI3IEZlYnJ1YXJ5IDIwMjAgMjI6NTIKPj4gVG86IER1cnJhbnQsIFBh
dWwgPHBkdXJyYW50QGFtYXpvbi5jby51az47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
Zwo+PiBDYzogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+OyBJYW4g
SmFja3Nvbgo+PiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5v
cmc+Cj4+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggMi8zXSBsaWJ4bDogbWFrZSBj
cmVhdGlvbiBvZiB4ZW5zdG9yZQo+PiBzdXNwZW5kIGV2ZW50IGNoYW5uZWwgbm9kZSBvcHRpb25h
bAo+Pgo+PiBIaSwKPj4KPj4gT24gMjYvMDIvMjAyMCAxNjowOCwgUGF1bCBEdXJyYW50IHdyb3Rl
Ogo+Pj4gVGhlIHB1cnBvc2UgYW5kIHNlbWFudGljcyBvZiB0aGUgbm9kZSBhcmUgZXhwbGFpbmVk
IGluCj4+PiB4ZW5zdG9yZS1wYXRocy5wYW5kb2MgWzFdLiBJdCB3YXMgb3JpZ2luYWxseSBpbnRy
b2R1Y2VkIGluIHhlbmQgYnkKPj4gY29tbWl0Cj4+PiAxNzYzNmY0N2E0NzQgIlRlYWNoIHhjX3Nh
dmUgdG8gdXNlIGV2ZW50LWNoYW5uZWwtYmFzZWQgZG9tYWluIHN1c3BlbmQgaWYKPj4+IGF2YWls
YWJsZS4iLiBOb3RlIHRoYXQsIGJlY2F1c2UsIHRoZSB0b3AtbGV2ZWwgZnJvbnRlbmQgJ2Rldmlj
ZScgbm9kZQo+PiB3YXMKPj4+IGNyZWF0ZWQgd3JpdGFibGUgYnkgdGhlIGd1ZXN0IGluIHhlbmQs
IHRoZXJlIHdhcyBubyBuZWVkIHRvIGV4cGxpY2l0bHkKPj4+IGNyZWF0ZSB0aGUgJ3N1c3BlbmQt
ZXZlbnQtY2hhbm5lbCcgbm9kZSBhcyB3cml0YWJsZSBub2RlLgo+Pj4KPj4+IEhvd2V2ZXIsIGxp
YnhsIGNyZWF0ZXMgdGhlICdkZXZpY2UnIG5vZGUgYXMgcmVhZC1vbmx5IGJ5IHRoZSBndWVzdCBh
bmQKPj4gc28KPj4+IGV4cGxpY2l0IGNyZWF0aW9uIG9mIHRoZSAnc3VzcGVuZC1ldmVudC1jaGFu
bmVsJyBub2RlIGlzIG5lY2Vzc2FyeSB0bwo+PiBtYWtlCj4+PiBpdCB1c2FibGUuIFRoaXMgdW5m
b3J0dW5hdGVseSBoYXMgdGhlIHNpZGUtZWZmZWN0IG9mIG1ha2luZyBzb21lIG9sZAo+Pj4gV2lu
ZG93cyBQViBkcml2ZXJzIFsyXSBjZWFzZSB0byBmdW5jdGlvbi4gVGhpcyBpcyBiZWNhdXNlIHRo
ZXkgc2NhbiB0aGUKPj4gdG9wCj4+PiBsZXZlbCAnZGV2aWNlJyBub2RlLCBmaW5kIHRoZSAnc3Vz
cGVuZCcgbm9kZSBhbmQgZXhwZWN0IGl0IHRvIGNvbnRhaW4KPj4gdGhlCj4+PiB1c3VhbCBzdWIt
bm9kZXMgZGVzY3JpYmluZyBhIFBWIGZyb250ZW5kLiBXaGVuIHRoaXMgaXMgZm91bmQgbm90IHRv
IGJlCj4+IHRoZQo+Pj4gY2FzZSwgZW51bWVyYXRpb24gY2Vhc2VzIGFuZCAoYmVjYXVzZSB0aGUg
J3N1c3BlbmQnIG5vZGUgaXMgb2JzZXJ2ZWQKPj4gYmVmb3JlCj4+PiB0aGUgJ3ZiZCcgbm9kZSkg
bm8gc3lzdGVtIGRpc2sgaXMgZW51bWVyYXRlZC4gV2luZG93cyB3aWxsIHRoZW4gY3Jhc2gKPj4g
d2l0aAo+Pj4gYnVnY2hlY2sgY29kZSAweDdCLgo+Pj4KPj4+IFRoaXMgcGF0Y2ggYWRkcyBhIGJv
b2xlYW4gJ3N1c3BlbmRfZXZlbnRfY2hhbm5lbCcgZmllbGQgaW50bwo+Pj4gbGlieGxfY3JlYXRl
X2luZm8gdG8gY29udHJvbCB3aGV0aGVyIHRoZSB4ZW5zdG9yZSBub2RlIGlzIGNyZWF0ZWQgYW5k
IGEKPj4+IHNpbWlsYXJseSBuYW1lZCBvcHRpb24gaW4geGwuY2ZnIHdoaWNoLCBmb3IgY29tcGF0
aWJpbGl0eSB3aXRoIHByZXZpb3VzCj4+PiBsaWJ4bCBiZWhhdmlvdXIsIGRlZmF1bHRzIHRvIHRy
dWUuCj4+Pgo+Pj4gWzFdCj4+IGh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4u
Z2l0O2E9YmxvYjtmPWRvY3MvbWlzYy94ZW5zdG9yZS0KPj4gcGF0aHMucGFuZG9jO2hiPUhFQUQj
bDE3Nwo+Pj4gWzJdIGh0dHBzOi8vYWNjZXNzLnJlZGhhdC5jb20vZG9jdW1lbnRhdGlvbi9lbi0K
Pj4gdXMvcmVkX2hhdF9lbnRlcnByaXNlX2xpbnV4LzUvaHRtbC9wYXJhLQo+PiB2aXJ0dWFsaXpl
ZF93aW5kb3dzX2RyaXZlcnNfZ3VpZGUvc2VjdC1wYXJhLQo+PiB2aXJ0dWFsaXplZF93aW5kb3dz
X2RyaXZlcnNfZ3VpZGUtCj4+IGluc3RhbGxpbmdfYW5kX2NvbmZpZ3VyaW5nX3RoZV9wYXJhX3Zp
cnR1YWxpemVkX2RyaXZlcnMtCj4+IGluc3RhbGxpbmdfdGhlX3BhcmFfdmlydHVhbGl6ZWRfZHJp
dmVycwo+Pj4KPj4+IE5PVEU6IFdoaWxlIGFkZGluZyB0aGUgbmV3IExJQlhMX0hBVkVfQ1JFQVRF
SU5GT19TVVNQRU5EX0VWRU5UX0NIQU5ORUwKPj4+ICAgICAgICAgZGVmaW5pdGlvbiBpbnRvIGxp
YnhsLmgsIHRoaXMgcGF0Y2ggY29ycmVjdHMgdGhlIHByZXZpb3VzIHN0YW56YQo+Pj4gICAgICAg
ICB3aGljaCBlcnJvbmVvdXNseSBpbXBsaWVzIGlieGxfZG9tYWluX2NyZWF0ZV9pbmZvIGlzIGEg
ZnVuY3Rpb24uCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBh
bWF6b24uY29tPgo+Pj4gLS0tCj4+PiBDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNp
dHJpeC5jb20+Cj4+PiBDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KPj4+IENjOiBBbnRob255IFBF
UkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPj4+IC0tLQo+Pj4gICAgZG9jcy9tYW4v
eGwuY2ZnLjUucG9kLmluICAgIHwgIDcgKysrKysrKwo+Pj4gICAgdG9vbHMvbGlieGwvbGlieGwu
aCAgICAgICAgIHwgMTMgKysrKysrKysrKysrLQo+Pj4gICAgdG9vbHMvbGlieGwvbGlieGxfY3Jl
YXRlLmMgIHwgMTIgKysrKysrKysrLS0tCj4+PiAgICB0b29scy9saWJ4bC9saWJ4bF90eXBlcy5p
ZGwgfCAgMSArCj4+PiAgICB0b29scy94bC94bF9wYXJzZS5jICAgICAgICAgfCAgMyArKysKPj4K
Pj4gWW91IG1heSB3YW50IHRvIHVwZGF0ZSB4ZW5zdG9yZS1wYXRocy5wYW5kb2MgYXMgdGhlIGRv
Y3VtZW50IG1lbnRpb24gdGhlCj4+IG5vZGUgd2lsbCBiZSBjcmVhdGVkIGJ5IHRoZSB0b29sc3Rh
Y2suCj4+Cj4gCj4gVGhlIGRvYyBhbHJlYWR5IHNheXMgdGhhdDoKPiAKPiAtLS0tLQo+ICMjIyMg
fi9kZXZpY2Uvc3VzcGVuZC9ldmVudC1jaGFubmVsID0gIiJ8RVZUQ0hOIFt3XQo+ICAgCj4gVGhl
IGRvbWFpbidzIHN1c3BlbmQgZXZlbnQgY2hhbm5lbC4gVGhlIHRvb2xzdGFjayB3aWxsIGNyZWF0
ZSB0aGlzCj4gcGF0aCB3aXRoIGFuIGVtcHR5IHZhbHVlIHdoaWNoIHRoZSBndWVzdCBtYXkgY2hv
b3NlIHRvIG92ZXJ3cml0ZS4KPiAtLS0tLQoKVGhlIHBhcmFncmFwaCB5b3UgcXVvdGVkIGRvZXMg
bm90IHN1Z2dlc3QgdGhlIG5vZGUgbWF5IG5vdCBleGlzdC4gU28gSSAKdGhpbmsgeW91IHdhbnQg
dG8gdXBkYXRlIHRoZSBkb2N1bWVudGF0aW9uIHRvIHJlZmxlY3QgdGhlIG5vZGUgbWF5IG5vdCAK
ZXhpc3QuCgo+Pj4gICAgNSBmaWxlcyBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kb2NzL21hbi94bC5jZmcuNS5wb2QuaW4gYi9k
b2NzL21hbi94bC5jZmcuNS5wb2QuaW4KPj4+IGluZGV4IDBjYWQ1NjEzNzUuLjVmNDc2ZjFlMWQg
MTAwNjQ0Cj4+PiAtLS0gYS9kb2NzL21hbi94bC5jZmcuNS5wb2QuaW4KPj4+ICsrKyBiL2RvY3Mv
bWFuL3hsLmNmZy41LnBvZC5pbgo+Pj4gQEAgLTY2OCw2ICs2NjgsMTMgQEAgZmlsZS4KPj4+Cj4+
PiAgICA9YmFjawo+Pj4KPj4+ICs9aXRlbSBCPHN1c3BlbmRfZXZlbnRfY2hhbm5lbD1CT09MRUFO
Pgo+Pj4gKwo+Pj4gK0NyZWF0ZSB0aGUgeGVuc3RvcmUgcGF0aCBmb3IgdGhlIGRvbWFpbidzIHN1
c3BlbmQgZXZlbnQgY2hhbm5lbC4gVGhlCj4+PiArZXhpc3RlbmNlIG9mIHRoaXMgcGF0aCBjYW4g
Y2F1c2UgcHJvYmxlbXMgd2l0aCBvbGRlciBQViBkcml2ZXJzIHJ1bm5pbmcKPj4+ICtpbiB0aGUg
Z3Vlc3QuIElmIHRoaXMgb3B0aW9uIGlzIG5vdCBzcGVjaWZpZWQgdGhlbiBpdCB3aWxsIGRlZmF1
bHQgdG8KPj4+ICtCPHRydWU+Lgo+Pgo+PiBJbiB0aGUgbmV4dCBwYXRjaCB5b3UgYXJlIGdvaW5n
IHRvIG1ha2UgZGV2aWNlLyBydy4gRG8geW91IHNlZSBhbnkgaXNzdWUKPj4gd2l0aCBqdXN0IG5v
dCBjcmVhdGluZyB0aGUgbm9kZSBmb3IgZXZlcnlvbmU/IEFyZSBQViBkcml2ZXJzIGFsbG93ZWQg
dG8KPj4gYXNzdW1lIGEgbm9kZSB3aWxsIGJlIHByZXNlbnQ/Cj4gCj4gV2VsbCB0aGF0J3MgdGhl
IHByb2JsZW0uIFNvbWUgb2YgdGhlbSBtYXkgaGF2ZSBiZWNvbWUgYWNjdXN0b21lZCB0byBpdCBi
ZWluZyBwcmVzZW50LiBBbHNvIHRoZSBkb2N1bWVudGF0aW9uIGRvZXMgc2F5IGl0IGlzIGNyZWF0
ZWQgYnkgdGhlIHRvb2xzdGFjayAoYnV0IG5vdCB3aGVuKS4gUGVyaGFwcyBJIHNob3VsZCB1cGRh
dGUgdGhlIGRvYyB0byBzYXkgdGhlIHRvb2xzdGFjayAqbWF5KiBjcmVhdGUgdGhpcyBwYXRoIHdo
ZW4gdGhlIGRvbWFpbiBpcyBjcmVhdGVkLgoKSG1tbSBmYWlyIHBvaW50LiBIb3dldmVyLCB0aGlz
IG5vdyBtZWFucyB5b3UgbWF5IG5lZWQgdG8gbW9kaWZ5IHlvdXIgCmNvbmZpZ3VyYXRpb24gZmls
ZSBkZXBlbmRpbmcgb24gdGhlIFBWIGRyaXZlciBpbnN0YWxsZWQuCgpUaGlzIGlzIG5vdCBhIHZl
cnkgaWRlYWwgc2l0dWF0aW9uIHRvIGJlIGluIHdoZW4geW91IGhhdmUgdG8gdXBncmFkZSAKeW91
ciBPUyAoaW1hZ2luZSB0aGUgbmV3IFBWIGRyaXZlciByZXF1aXJlcyB0aGUgcGF0aCkuCgpIb3cg
ZG8geW91IGVudmlzaW9uIHRoaXMgdG8gd29yaz8KCj4gCj4+Cj4+IE15IGtub3dsZWRnZSBvZiB4
ZW5zdG9yZSBpcyBsaW1pdGVkLCBzbyBJIHRob3VnaHQgSSB3b3VsZCBhc2sgdGhlCj4+IHF1ZXN0
aW9ucyB0byB1bmRlcnN0YW5kIGEgYml0IG1vcmUgaG93IHN0YWJsZSB0aGUgQUJJIGlzIG1lYW50
IHRvIGJlLiA6KS4KPiAKPiBTdGFibGU/IFRoYXQnbGwgYmUgdGhlIGRheSA6LSkKClRoYW5rIHlv
dSBmb3IgdGhlIGNvbmZpcm1hdGlvbiA6KS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
