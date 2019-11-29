Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E9A10DB4A
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 22:46:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iao2Z-0002fj-6d; Fri, 29 Nov 2019 21:43:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Loh=ZV=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iao2X-0002fe-PZ
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 21:43:01 +0000
X-Inumbo-ID: 36d8efca-12f1-11ea-a3ed-12813bfff9fa
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 36d8efca-12f1-11ea-a3ed-12813bfff9fa;
 Fri, 29 Nov 2019 21:43:00 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id w15so5819590wru.4
 for <xen-devel@lists.xenproject.org>; Fri, 29 Nov 2019 13:43:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=PKDefqlQQygRW0c+EJ8lbIjW+9pwnaGgOUXkBdGpOJU=;
 b=HZZhZ+HNDR82rTnjYyU6l2PZln6IHKyrjqv4wkPUIeFjgJynwgFnE8CSS+BrtjHcEJ
 I5BjE2f99pRUQHPb406XoQIy+kRhj+VqCCSLiJw1Foue+c92F7y7pQxfTHny5k3ViHSl
 m8JhXXY3xL9fzYL10K7i+WU2furOnTxBgwDIqnPWt2xWm1KsClmJFLHg2TOneClTePrY
 Pb8qc8q1TN4KyI2B1fuexuGLDTj0gwu/f5KDfcSITh58CjPVZ5wfD06jOLurkiManWQ3
 IroM0Iv+Jwjed7PZBSk3lOq7Lvb2WLC5Z3U53o/YfAYdg3Rw2vKp4Zj+1FbSxMKjOXHw
 KsUg==
X-Gm-Message-State: APjAAAWg5KMQ9dmXKOMaPZJ/Bj3Y3/a5YUrAA8/OPpVboU94/ESx8cyg
 COEqJxTazGmAW9nQ5dfQKss=
X-Google-Smtp-Source: APXvYqxvu9YVe0uZrleUrZ2SQan5HbosagelhYKXNAn0KjPIuOSDwecXPr7+n8OhGrYvHRsmxhfTLA==
X-Received: by 2002:adf:83c7:: with SMTP id 65mr11158998wre.368.1575063780121; 
 Fri, 29 Nov 2019 13:43:00 -0800 (PST)
Received: from debian (122.163.200.146.dyn.plus.net. [146.200.163.122])
 by smtp.gmail.com with ESMTPSA id y8sm14209969wmi.9.2019.11.29.13.42.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2019 13:42:59 -0800 (PST)
Date: Fri, 29 Nov 2019 21:42:57 +0000
From: Wei Liu <wl@xen.org>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Message-ID: <20191129214257.sonq5vyjeggavorh@debian>
References: <20191129172445.32664-1-pdurrant@amazon.com>
 <20191129173611.skfu63d4kqcysnoi@debian>
 <20191129174423.hbzdjtcondvnbts2@debian>
 <20191129211533.GF5763@mail-itl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191129211533.GF5763@mail-itl>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH-for-4.13 v7] Rationalize max_grant_frames
 and max_maptrack_frames handling
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMjksIDIwMTkgYXQgMTA6MTU6MzNQTSArMDEwMCwgTWFyZWsgTWFyY3p5a293
c2tpLUfDs3JlY2tpIHdyb3RlOgo+IE9uIEZyaSwgTm92IDI5LCAyMDE5IGF0IDA1OjQ0OjIzUE0g
KzAwMDAsIFdlaSBMaXUgd3JvdGU6Cj4gPiBPbiBGcmksIE5vdiAyOSwgMjAxOSBhdCAwNTozNjox
MVBNICswMDAwLCBXZWkgTGl1IHdyb3RlOgo+ID4gPiBPbiBGcmksIE5vdiAyOSwgMjAxOSBhdCAw
NToyNDo0NVBNICswMDAwLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gPiA+ID4gRnJvbTogR2Vvcmdl
IER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgo+ID4gPiA+IAo+ID4gPiA+IFhlbiB1
c2VkIHRvIGhhdmUgc2luZ2xlLCBzeXN0ZW0td2lkZSBsaW1pdHMgZm9yIHRoZSBudW1iZXIgb2Yg
Z3JhbnQKPiA+ID4gPiBmcmFtZXMgYW5kIG1hcHRyYWNrIGZyYW1lcyBhIGd1ZXN0IHdhcyBhbGxv
d2VkIHRvIGNyZWF0ZS4gSW5jcmVhc2luZwo+ID4gPiA+IG9yIGRlY3JlYXNpbmcgdGhpcyBzaW5n
bGUgbGltaXQgb24gdGhlIFhlbiBjb21tYW5kLWxpbmUgd291bGQgY2hhbmdlCj4gPiA+ID4gdGhl
IGxpbWl0IGZvciBhbGwgZ3Vlc3RzIG9uIHRoZSBzeXN0ZW0uCj4gPiA+ID4gCj4gPiA+ID4gTGF0
ZXIsIHBlci1kb21haW4gbGltaXRzIGZvciB0aGVzZSB2YWx1ZXMgd2FzIGNyZWF0ZWQuIFRoZSBz
eXN0ZW0td2lkZQo+ID4gPiA+IGxpbWl0cyBiZWNhbWUgc3RyaWN0IGxpbWl0czogZG9tYWlucyBj
b3VsZCBub3QgYmUgY3JlYXRlZCB3aXRoIGhpZ2hlcgo+ID4gPiA+IGxpbWl0cywgYnV0IGNvdWxk
IGJlIGNyZWF0ZWQgd2l0aCBsb3dlciBsaW1pdHMuIEhvd2V2ZXIsIHRoYXQgY2hhbmdlCj4gPiA+
ID4gYWxzbyBpbnRyb2R1Y2VkIGEgcmFuZ2Ugb2YgZGlmZmVyZW50ICJkZWZhdWx0IiB2YWx1ZXMg
aW50byB2YXJpb3VzCj4gPiA+ID4gcGxhY2VzIGluIHRoZSB0b29sc3RhY2s6Cj4gPiA+ID4gCj4g
PiA+ID4gLSBUaGUgcHl0aG9uIGxpYnhjIGJpbmRpbmdzIGhhcmQtY29kZWQgdGhlc2UgdmFsdWVz
IHRvIDMyIGFuZCAxMDI0LAo+ID4gPiA+ICAgcmVzcGVjdGl2ZWx5Cj4gPiA+ID4gLSBUaGUgbGli
eGwgZGVmYXVsdCB2YWx1ZXMgYXJlIDMyIGFuZCAxMDI0IHJlc3BlY3RpdmVseS4KPiA+ID4gPiAt
IHhsIHdpbGwgdXNlIHRoZSBsaWJ4bCBkZWZhdWx0IGZvciBtYXB0cmFjaywgYnV0IGRvZXMgaXRz
IG93biBkZWZhdWx0Cj4gPiA+ID4gICBjYWxjdWxhdGlvbiBmb3IgZ3JhbnQgZnJhbWVzOiBlaXRo
ZXIgMzIgb3IgNjQsIGJhc2VkIG9uIHRoZSBtYXgKPiA+ID4gPiAgIHBvc3NpYmxlIG1mbi4KPiA+
ID4gPiAKPiA+ID4gPiBUaGVzZSBkZWZhdWx0cyBpbnRlcmFjdCBwb29ybHkgd2l0aCB0aGUgaHlw
ZXJ2aXNvciBjb21tYW5kLWxpbmUgbGltaXQ6Cj4gPiA+ID4gCj4gPiA+ID4gLSBUaGUgaHlwZXJ2
aXNvciBjb21tYW5kLWxpbmUgbGltaXQgY2Fubm90IGJlIHVzZWQgdG8gcmFpc2UgdGhlIGxpbWl0
Cj4gPiA+ID4gICBmb3IgYWxsIGd1ZXN0cyBhbnltb3JlLCBhcyB0aGUgZGVmYXVsdCBpbiB0aGUg
dG9vbHN0YWNrIHdpbGwKPiA+ID4gPiAgIGVmZmVjdGl2ZWx5IG92ZXJyaWRlIHRoaXMuCj4gPiA+
ID4gLSBJZiB5b3UgdXNlIHRoZSBoeXBlcnZpc29yIGNvbW1hbmQtbGluZSBsaW1pdCB0byAqcmVk
dWNlKiB0aGUgbGltaXQsCj4gPiA+ID4gICB0aGVuIHRoZSAiZGVmYXVsdCIgdmFsdWVzIGdlbmVy
YXRlZCBieSB0aGUgdG9vbHN0YWNrIGFyZSB0b28gaGlnaCwKPiA+ID4gPiAgIGFuZCBhbGwgZ3Vl
c3QgY3JlYXRpb25zIHdpbGwgZmFpbC4KPiA+ID4gPiAKPiA+ID4gPiBJbiBvdGhlciB3b3Jkcywg
dGhlIHRvb2xzdGFjayBkZWZhdWx0cyByZXF1aXJlIGFueSBjaGFuZ2UgdG8gYmUKPiA+ID4gPiBl
ZmZlY3RlZCBieSBoYXZpbmcgdGhlIGFkbWluIGV4cGxpY2l0bHkgc3BlY2lmeSBhIG5ldyB2YWx1
ZSBpbiBldmVyeQo+ID4gPiA+IGd1ZXN0Lgo+ID4gPiA+IAo+ID4gPiA+IEluIG9yZGVyIHRvIGFk
ZHJlc3MgdGhpcywgaGF2ZSBncmFudF90YWJsZV9pbml0IHRyZWF0IG5lZ2F0aXZlIHZhbHVlcwo+
ID4gPiA+IGZvciBtYXhfZ3JhbnRfZnJhbWVzIGFuZCBtYXhfbWFwdHJhY2tfZnJhbWVzIGFzIGlu
c3RydWN0aW9ucyB0byB1c2UgdGhlCj4gPiA+ID4gc3lzdGVtLXdpZGUgZGVmYXVsdCwgYW5kIGhh
dmUgYWxsIHRoZSBhYm92ZSB0b29sc3RhY2tzIGRlZmF1bHQgdG8gcGFzc2luZwo+ID4gPiA+IC0x
IHVubGVzcyBhIGRpZmZlcmVudCB2YWx1ZSBpcyBleHBsaWNpdGx5IGNvbmZpZ3VyZWQuCj4gPiA+
ID4gCj4gPiA+ID4gVGhpcyByZXN0b3JlcyB0aGUgb2xkIGJlaGF2aW9yIGluIHRoYXQgY2hhbmdp
bmcgdGhlIGh5cGVydmlzb3IgY29tbWFuZC1saW5lCj4gPiA+ID4gb3B0aW9uIGNhbiBjaGFuZ2Ug
dGhlIGJlaGF2aW9yIGZvciBhbGwgZ3Vlc3RzLCB3aGlsZSByZXRhaW5pbmcgdGhlIGFiaWxpdHkK
PiA+ID4gPiB0byBzZXQgcGVyLWd1ZXN0IHZhbHVlcy4gIEl0IGFsc28gcmVtb3ZlcyB0aGUgYnVn
IHRoYXQgcmVkdWNpbmcgdGhlCj4gPiA+ID4gc3lzdGVtLXdpZGUgbWF4IHdpbGwgY2F1c2UgYWxs
IGRvbWFpbnMgd2l0aG91dCBleHBsaWNpdCBsaW1pdHMgdG8gZmFpbC4KPiA+ID4gPiAKPiA+ID4g
PiBOT1RFOiAtIFRoZSBPY2FtbCBiaW5kaW5ncyByZXF1aXJlIHRoZSBjYWxsZXIgdG8gYWx3YXlz
IHNwZWNpZnkgYSB2YWx1ZSwKPiA+ID4gPiAgICAgICAgIGFuZCB0aGUgY29kZSB0byBzdGFydCBh
IHhlbnN0b3JlZCBzdHViZG9tYWluIGhhcmQtY29kZXMgdGhlc2UgdG8gNAo+ID4gPiA+IAlhbmQg
MTI4IHJlc3BlY3RpdmVseTsgdGhpcyBiZWhhdm91ciB3aWxsIG5vdCBiZSBtb2RpZmllZC4KPiA+
ID4gPiAKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFw
QGNpdHJpeC5jb20+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFu
dEBhbWF6b24uY29tPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBldS5jaXRyaXguY29tPgo+ID4gPiA+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+Cj4gPiA+ID4gUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPgo+ID4gPiAKPiA+ID4gQWNrZWQtYnk6IFdlaSBMaXUgPHdsQHhlbi5v
cmc+Cj4gPiAKPiA+IEluIHRoZW9yeSBJIHNob3VsZCB3YWl0IGZvciBNYXJlaydzIGFjayBmb3Ig
Y2hhbmdlcyB0byBweXRob24gYmluZGluZywKPiA+IGJ1dCB0aGUgY2hhbmdlcyBhcmUgdHJpdmlh
bCB0aGVyZSBzbyBJIHBsYW4gdG8gcHVzaCB0aGlzIHBhdGNoIGxhdGVyCj4gPiB0b25pZ2h0IHRv
IGJvdGggc3RhZ2luZyBhbmQgc3RhZ2luZy00LjEzIHNvIHRoYXQgaXQgY2FuIGJlIHRlc3RlZCBv
dmVyCj4gPiB0aGUgd2Vla2VuZC4KPiA+IAo+ID4gTWFyZWssIEkgYXBvbG9naXNlIGluIGFkdmFu
Y2UgaW4gY2FzZSB5b3UgZGlzYWdyZWUgd2l0aCBteSBhc3Nlc3NtZW50Lgo+IAo+IEZXSVcsIGZv
ciBweXRob24gcGFydDoKPiBBY2tlZC1ieTogTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIDxt
YXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPgoKVGhhbmtzLiBJIHdpbGwgZm9sZCB0aGlz
IGluLgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
