Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F80167FDD
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 15:14:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j591c-00078R-GS; Fri, 21 Feb 2020 14:11:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jzOO=4J=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j591a-00078M-Vv
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 14:11:27 +0000
X-Inumbo-ID: 0bbe960b-54b4-11ea-8679-12813bfff9fa
Received: from mail-ed1-f65.google.com (unknown [209.85.208.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0bbe960b-54b4-11ea-8679-12813bfff9fa;
 Fri, 21 Feb 2020 14:11:26 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id p14so2455024edy.13
 for <xen-devel@lists.xenproject.org>; Fri, 21 Feb 2020 06:11:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RNx5wlyJ92OoXHSWPG6SFWHacxwT4hnoZ1XGCKg4Dts=;
 b=cpZhMkoOKAfXObTvPgwXuaPkIZXEw+5Cg4/+43zeiGx/v0pVM1nkzDAsucQXnD+u2p
 sO5XC/BrwfmhObx00YNQhQqx+a3SbvXGAC2PVIY/mgpNNOchtRxCZ2an/++eYbeSUdvO
 rgs3QRO+AtfXxA++nQsYay9AfOIb+xKlPBrwGpE2uGG4LSjP9IBqSlHEkUyCtLEPcT8F
 plXsjTv+Pk+qsvqXh/9hUomay6RWvzxV2/jP4+IX5d7cUMo9C7sr2YEMsEel3Y0gEDrA
 hP4JAipQjjjebSRJg8zvj+12yt+EAW/4jQxJcF/NBLmz+TMmPyESF8V+r8DTyMRnwE68
 cphQ==
X-Gm-Message-State: APjAAAWiSV7x1QDBAAZ42kK73JUd8PqvPWkbHQSExBj8/ZBaW7Y/Fsaz
 CsIuUqxnBOBCbI+OCWGaswRVTPhfd0uEmA==
X-Google-Smtp-Source: APXvYqwue45M+MchfLVjaOiNoL61zQzmOVqkDrYYkL9RVWdZkeAR1AFheRfO8NeRWSWN6Codid6jsg==
X-Received: by 2002:aa7:c6d7:: with SMTP id b23mr33758709eds.156.1582294285151; 
 Fri, 21 Feb 2020 06:11:25 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id d1sm245197ejy.3.2020.02.21.06.11.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2020 06:11:24 -0800 (PST)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20200220173116.88915-1-roger.pau@citrix.com>
 <83d48223-21eb-be54-985c-085449661892@xen.org>
 <20200221091005.GT4679@Air-de-Roger>
 <ac7ffe8b-06b0-655e-e842-cbc5d47ea85f@suse.com>
 <240c6e13-0b10-214f-cf8d-d1ab64eb441f@suse.com>
 <e5be3888-6252-f03c-675d-8d7dfd9330b8@xen.org>
 <21c59ebb-e396-447f-5ac1-d7e2efd76bb5@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <430123f5-afa9-4364-b703-f26279a7c585@xen.org>
Date: Fri, 21 Feb 2020 14:11:23 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <21c59ebb-e396-447f-5ac1-d7e2efd76bb5@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVlcmdlbiwKCk9uIDIxLzAyLzIwMjAgMTQ6MDYsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4g
T24gMjEuMDIuMjAgMTQ6NDksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4KPj4KPj4gT24gMjEvMDIv
MjAyMCAxMzo0NiwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4+IE9uIDIxLjAyLjIwIDE0OjM2LCBK
YW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAyMS4wMi4yMDIwIDEwOjEwLCBSb2dlciBQYXUgTW9u
bsOpIHdyb3RlOgo+Pj4+PiBPbiBUaHUsIEZlYiAyMCwgMjAyMCBhdCAwNzoyMDowNlBNICswMDAw
LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4+PiBIaSwKPj4+Pj4+Cj4+Pj4+PiBPbiAyMC8wMi8y
MDIwIDE3OjMxLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4+Pj4+Pj4gQWxsb3cgYSBDUFUgYWxy
ZWFkeSBob2xkaW5nIHRoZSBsb2NrIGluIHdyaXRlIG1vZGUgdG8gYWxzbyBsb2NrIAo+Pj4+Pj4+
IGl0IGluCj4+Pj4+Pj4gcmVhZCBtb2RlLiBUaGVyZSdzIG5vIGhhcm0gaW4gYWxsb3dpbmcgcmVh
ZCBsb2NraW5nIGEgcndsb2NrIHRoYXQncwo+Pj4+Pj4+IGFscmVhZHkgb3duZWQgYnkgdGhlIGNh
bGxlciAoaWU6IENQVSkgaW4gd3JpdGUgbW9kZS4gQWxsb3dpbmcgc3VjaAo+Pj4+Pj4+IGFjY2Vz
c2VzIGlzIHJlcXVpcmVkIGF0IGxlYXN0IGZvciB0aGUgQ1BVIG1hcHMgdXNlLWNhc2UuCj4+Pj4+
Pj4KPj4+Pj4+PiBJbiBvcmRlciB0byBkbyB0aGlzIHJlc2VydmUgMTRiaXRzIG9mIHRoZSBsb2Nr
LCB0aGlzIGFsbG93cyB0byAKPj4+Pj4+PiBzdXBwb3J0Cj4+Pj4+Pj4gdXAgdG8gMTYzODQgQ1BV
cy4gQWxzbyByZWR1Y2UgdGhlIHdyaXRlIGxvY2sgbWFzayB0byAyIGJpdHM6IG9uZSB0bwo+Pj4+
Pj4+IHNpZ25hbCB0aGVyZSBhcmUgcGVuZGluZyB3cml0ZXJzIHdhaXRpbmcgb24gdGhlIGxvY2sg
YW5kIHRoZSAKPj4+Pj4+PiBvdGhlciB0bwo+Pj4+Pj4+IHNpZ25hbCB0aGUgbG9jayBpcyBvd25l
ZCBpbiB3cml0ZSBtb2RlLiBOb3RlIHRoZSB3cml0ZSByZWxhdGVkIGRhdGEKPj4+Pj4+PiBpcyB1
c2luZyAxNmJpdHMsIHRoaXMgaXMgZG9uZSBpbiBvcmRlciB0byBiZSBhYmxlIHRvIGNsZWFyIGl0
IChhbmQKPj4+Pj4+PiB0aHVzIHJlbGVhc2UgdGhlIGxvY2spIHVzaW5nIGEgMTZiaXQgYXRvbWlj
IHdyaXRlLgo+Pj4+Pj4+Cj4+Pj4+Pj4gVGhpcyByZWR1Y2VzIHRoZSBtYXhpbXVtIG51bWJlciBv
ZiBjb25jdXJyZW50IHJlYWRlcnMgZnJvbSAKPj4+Pj4+PiAxNjc3NzIxNiB0bwo+Pj4+Pj4+IDY1
NTM2LCBJIHRoaW5rIHRoaXMgc2hvdWxkIHN0aWxsIGJlIGVub3VnaCwgb3IgZWxzZSB0aGUgbG9j
ayBmaWVsZAo+Pj4+Pj4+IGNhbiBiZSBleHBhbmRlZCBmcm9tIDMyIHRvIDY0Yml0cyBpZiBhbGwg
YXJjaGl0ZWN0dXJlcyBzdXBwb3J0IAo+Pj4+Pj4+IGF0b21pYwo+Pj4+Pj4+IG9wZXJhdGlvbnMg
b24gNjRiaXQgaW50ZWdlcnMuCj4+Pj4+Pgo+Pj4+Pj4gRldJVywgYXJtMzIgaXMgYWJsZSB0byBz
dXBwb3J0IGF0b21pYyBvcGVyYXRpb25zIG9uIDY0LWJpdCBpbnRlZ2Vycy4KPj4+Pj4+Cj4+Pj4+
Pj4gwqDCoCBzdGF0aWMgaW5saW5lIHZvaWQgX3dyaXRlX3VubG9jayhyd2xvY2tfdCAqbG9jaykK
Pj4+Pj4+PiDCoMKgIHsKPj4+Pj4+PiAtwqDCoMKgIC8qCj4+Pj4+Pj4gLcKgwqDCoMKgICogSWYg
dGhlIHdyaXRlciBmaWVsZCBpcyBhdG9taWMsIGl0IGNhbiBiZSBjbGVhcmVkIGRpcmVjdGx5Lgo+
Pj4+Pj4+IC3CoMKgwqDCoCAqIE90aGVyd2lzZSwgYW4gYXRvbWljIHN1YnRyYWN0aW9uIHdpbGwg
YmUgdXNlZCB0byBjbGVhciBpdC4KPj4+Pj4+PiAtwqDCoMKgwqAgKi8KPj4+Pj4+PiAtwqDCoMKg
IGF0b21pY19zdWIoX1FXX0xPQ0tFRCwgJmxvY2stPmNudHMpOwo+Pj4+Pj4+ICvCoMKgwqAgLyog
U2luY2UgdGhlIHdyaXRlciBmaWVsZCBpcyBhdG9taWMsIGl0IGNhbiBiZSBjbGVhcmVkIAo+Pj4+
Pj4+IGRpcmVjdGx5LiAqLwo+Pj4+Pj4+ICvCoMKgwqAgQVNTRVJUKF9pc193cml0ZV9sb2NrZWRf
YnlfbWUoYXRvbWljX3JlYWQoJmxvY2stPmNudHMpKSk7Cj4+Pj4+Pj4gK8KgwqDCoCBCVUlMRF9C
VUdfT04oX1FSX1NISUZUICE9IDE2KTsKPj4+Pj4+PiArwqDCoMKgIHdyaXRlX2F0b21pYygodWlu
dDE2X3QgKikmbG9jay0+Y250cywgMCk7Cj4+Pj4+Pgo+Pj4+Pj4gSSB0aGluayB0aGlzIGlzIGFu
IGFidXNlIHRvIGNhc3QgYW4gYXRvbWljX3QoKSBkaXJlY3RseSBpbnRvIGEgCj4+Pj4+PiB1aW50
MTZfdC4gWW91Cj4+Pj4+PiB3b3VsZCBhdCBsZWFzdCB3YW50IHRvIHVzZSAmbG9jay0+Y250cy5j
b3VudGVyIGhlcmUuCj4+Pj4+Cj4+Pj4+IFN1cmUsIEkgd2FzIHdvbmRlcmluZyBhYm91dCB0aGlz
IG15c2VsZi4KPj4+Pj4KPj4+Pj4gV2lsbCB3YWl0IGZvciBtb3JlIGNvbW1lbnRzLCBub3Qgc3Vy
ZSB3aGV0aGVyIHRoaXMgY2FuIGJlIGZpeGVkIHVwb24KPj4+Pj4gY29tbWl0IGlmIHRoZXJlIGFy
ZSBubyBvdGhlciBpc3N1ZXMuCj4+Pj4KPj4+PiBJdCdzIG1vcmUgdGhhbiBqdXN0IGFkZGluZyBh
bm90aGVyIGZpZWxkIHNwZWNpZmllciBoZXJlLiBBIGNhc3QgbGlrZQo+Pj4+IHRoaXMgb25lIGlz
IGVuZGlhbm5lc3MtdW5zYWZlLCBhbmQgaGVuY2UgYSB0cmFwIHdhaXRpbmcgZm9yIGEgYmlnCj4+
Pj4gZW5kaWFuIHBvcnQgYXR0ZW1wdCB0byBmYWxsIGludG8uIEF0IHRoZSB2ZXJ5IGxlYXN0IHRo
aXMgc2hvdWxkIGNhdXNlCj4+Pj4gYSBidWlsZCBmYWlsdXJlIG9uIGJpZyBlbmRpYW4gc3lzdGVt
cywgZXZlbiBiZXR0ZXIgd291bGQgYmUgaWYgaXQgd2FzCj4+Pj4gZW5kaWFubmVzcy1zYWZlLgo+
Pj4KPj4+IFdvdWxkbid0IGEgdW5pb24gYmUgdGhlIGJldHRlciBjaG9pY2U/Cj4+Cj4+IFlvdSB3
b3VsZCBub3QgYmUgYWJsZSB0byB1c2UgYXRvbWljX3QgaW4gdGhhdCBjYXNlIGFzIHlvdSBjYW4n
dCBhc3N1bWUgCj4+IHRoZSBsYXlvdXQgb2YgdGhlIHN0cnVjdHVyZS4KPiAKPiB1bmlvbiByd2xv
Y2t3b3JkIHsKPiAgwqDCoMKgIGF0b21pY190IGNudHM7Cj4gIMKgwqDCoCB1aW50MzJfdCB2YWw7
Cj4gIMKgwqDCoCBzdHJ1Y3Qgewo+ICDCoMKgwqDCoMKgwqDCoCB1aW50MTZfdCB3cml0ZTsKPiAg
wqDCoMKgwqDCoMKgwqAgdWludDE2X3QgcmVhZGVyczsKPiAgwqDCoMKgIH07Cj4gfTsKPiAKPiBz
dGF0aWMgaW5saW5lIGNvbnN0IHVpbnQzMl90IF9xcl9iaWFzKAo+ICDCoMKgwqAgY29uc3QgdW5p
b24gcndsb2Nrd29yZCB7Cj4gIMKgwqDCoMKgwqDCoMKgIC53cml0ZSA9IDAsCj4gIMKgwqDCoMKg
wqDCoMKgIC5yZWFkZXJzID0gMQo+ICDCoMKgwqAgfSB4Owo+IAo+ICDCoMKgwqAgcmV0dXJuIHgu
dmFsOwo+IH0KPiAKPiAuLi4KPiAgwqDCoMKgIGNudHMgPSBhdG9taWNfYWRkX3JldHVybihfcXJf
YmlhcygpLCAmbG9jay0+Y250cyk7Cj4gLi4uCj4gCj4gSSBndWVzcyB0aGlzIHNob3VsZCBkbyB0
aGUgdHJpY2ssIG5vPwoKWW91IGFyZSBhc3N1bWluZyB0aGUgYXRvbWljX3QgbGF5b3V0IHdoaWNo
IEkgd291bGQgcmF0aGVyIG5vIHdhbnQgdG8gaGFwcGVuLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBH
cmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
