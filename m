Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E89C110D992
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 19:21:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iakqm-0001dM-Be; Fri, 29 Nov 2019 18:18:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Loh=ZV=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iakql-0001dH-DP
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 18:18:39 +0000
X-Inumbo-ID: a9b12ea8-12d4-11ea-b155-bc764e2007e4
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a9b12ea8-12d4-11ea-b155-bc764e2007e4;
 Fri, 29 Nov 2019 18:18:39 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id u18so15068120wmc.3
 for <xen-devel@lists.xenproject.org>; Fri, 29 Nov 2019 10:18:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=RDjul7WPkRnyIHFHugH23JkV42xdaYV6KFykuYE2u0s=;
 b=h0+6GSWaQDJmMSYeevmTLqeIsaD1gFzKY6o55HFmxFEQccEy3IKJN9ElPW9BdG/OZF
 BLHo+CxWtwCUp2Q4Uve8AwbgxDY/NLhsmbbB8v+uvm6NS+grb+cXgLpu4iv3JgZR0dcl
 WtHE6Y2u/rrPzjjFK550xKlxdRsCWEyK7w67flCP77o/SevOsPS1b4nPIlHKb8gbsecb
 Hidem0jGFKNAe5WrmtqnjFFHoP2SWd77FONlhyBWwkl1YycnSky3NgoV9Wt7DKUjKHG1
 xxQnjjQm+0KPTYGP7wEs1z369Gl7DE7KOOPc84uGXC13ry8mztwkP/ZPK6i3ekoPfpvS
 v6Fw==
X-Gm-Message-State: APjAAAXieAmw/T83Q/ELQ5lrz6WZIP70dZ1VqiWvsEtgsFSeDl+q3yLJ
 nbXJObfpirGfH6vbBlbGvO4=
X-Google-Smtp-Source: APXvYqxXHhnTq+EO6KbC8I9GjPcenB2k/cyuD/SfNzbXdiExAEUFQ1pVyFK/JQewp47SYwo3t35EYQ==
X-Received: by 2002:a1c:6086:: with SMTP id
 u128mr15499117wmb.131.1575051517395; 
 Fri, 29 Nov 2019 10:18:37 -0800 (PST)
Received: from debian (122.163.200.146.dyn.plus.net. [146.200.163.122])
 by smtp.gmail.com with ESMTPSA id q5sm14343460wmc.27.2019.11.29.10.18.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2019 10:18:36 -0800 (PST)
Date: Fri, 29 Nov 2019 18:18:34 +0000
From: Wei Liu <wl@xen.org>
To: George Dunlap <George.Dunlap@citrix.com>
Message-ID: <20191129181834.4j23qzsyk6wopa4x@debian>
References: <20191129172445.32664-1-pdurrant@amazon.com>
 <20191129173611.skfu63d4kqcysnoi@debian>
 <20191129174423.hbzdjtcondvnbts2@debian>
 <45641766-DF1F-460A-8612-6D99D39683C3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <45641766-DF1F-460A-8612-6D99D39683C3@citrix.com>
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
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMjksIDIwMTkgYXQgMDU6NTM6MzlQTSArMDAwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiAKPiAKPiA+IE9uIE5vdiAyOSwgMjAxOSwgYXQgNTo0NCBQTSwgV2VpIExpdSA8d2xA
eGVuLm9yZz4gd3JvdGU6Cj4gPiAKPiA+IE9uIEZyaSwgTm92IDI5LCAyMDE5IGF0IDA1OjM2OjEx
UE0gKzAwMDAsIFdlaSBMaXUgd3JvdGU6Cj4gPj4gT24gRnJpLCBOb3YgMjksIDIwMTkgYXQgMDU6
MjQ6NDVQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+ID4+PiBGcm9tOiBHZW9yZ2UgRHVu
bGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Cj4gPj4+IAo+ID4+PiBYZW4gdXNlZCB0byBo
YXZlIHNpbmdsZSwgc3lzdGVtLXdpZGUgbGltaXRzIGZvciB0aGUgbnVtYmVyIG9mIGdyYW50Cj4g
Pj4+IGZyYW1lcyBhbmQgbWFwdHJhY2sgZnJhbWVzIGEgZ3Vlc3Qgd2FzIGFsbG93ZWQgdG8gY3Jl
YXRlLiBJbmNyZWFzaW5nCj4gPj4+IG9yIGRlY3JlYXNpbmcgdGhpcyBzaW5nbGUgbGltaXQgb24g
dGhlIFhlbiBjb21tYW5kLWxpbmUgd291bGQgY2hhbmdlCj4gPj4+IHRoZSBsaW1pdCBmb3IgYWxs
IGd1ZXN0cyBvbiB0aGUgc3lzdGVtLgo+ID4+PiAKPiA+Pj4gTGF0ZXIsIHBlci1kb21haW4gbGlt
aXRzIGZvciB0aGVzZSB2YWx1ZXMgd2FzIGNyZWF0ZWQuIFRoZSBzeXN0ZW0td2lkZQo+ID4+PiBs
aW1pdHMgYmVjYW1lIHN0cmljdCBsaW1pdHM6IGRvbWFpbnMgY291bGQgbm90IGJlIGNyZWF0ZWQg
d2l0aCBoaWdoZXIKPiA+Pj4gbGltaXRzLCBidXQgY291bGQgYmUgY3JlYXRlZCB3aXRoIGxvd2Vy
IGxpbWl0cy4gSG93ZXZlciwgdGhhdCBjaGFuZ2UKPiA+Pj4gYWxzbyBpbnRyb2R1Y2VkIGEgcmFu
Z2Ugb2YgZGlmZmVyZW50ICJkZWZhdWx0IiB2YWx1ZXMgaW50byB2YXJpb3VzCj4gPj4+IHBsYWNl
cyBpbiB0aGUgdG9vbHN0YWNrOgo+ID4+PiAKPiA+Pj4gLSBUaGUgcHl0aG9uIGxpYnhjIGJpbmRp
bmdzIGhhcmQtY29kZWQgdGhlc2UgdmFsdWVzIHRvIDMyIGFuZCAxMDI0LAo+ID4+PiAgcmVzcGVj
dGl2ZWx5Cj4gPj4+IC0gVGhlIGxpYnhsIGRlZmF1bHQgdmFsdWVzIGFyZSAzMiBhbmQgMTAyNCBy
ZXNwZWN0aXZlbHkuCj4gPj4+IC0geGwgd2lsbCB1c2UgdGhlIGxpYnhsIGRlZmF1bHQgZm9yIG1h
cHRyYWNrLCBidXQgZG9lcyBpdHMgb3duIGRlZmF1bHQKPiA+Pj4gIGNhbGN1bGF0aW9uIGZvciBn
cmFudCBmcmFtZXM6IGVpdGhlciAzMiBvciA2NCwgYmFzZWQgb24gdGhlIG1heAo+ID4+PiAgcG9z
c2libGUgbWZuLgo+ID4+PiAKPiA+Pj4gVGhlc2UgZGVmYXVsdHMgaW50ZXJhY3QgcG9vcmx5IHdp
dGggdGhlIGh5cGVydmlzb3IgY29tbWFuZC1saW5lIGxpbWl0Ogo+ID4+PiAKPiA+Pj4gLSBUaGUg
aHlwZXJ2aXNvciBjb21tYW5kLWxpbmUgbGltaXQgY2Fubm90IGJlIHVzZWQgdG8gcmFpc2UgdGhl
IGxpbWl0Cj4gPj4+ICBmb3IgYWxsIGd1ZXN0cyBhbnltb3JlLCBhcyB0aGUgZGVmYXVsdCBpbiB0
aGUgdG9vbHN0YWNrIHdpbGwKPiA+Pj4gIGVmZmVjdGl2ZWx5IG92ZXJyaWRlIHRoaXMuCj4gPj4+
IC0gSWYgeW91IHVzZSB0aGUgaHlwZXJ2aXNvciBjb21tYW5kLWxpbmUgbGltaXQgdG8gKnJlZHVj
ZSogdGhlIGxpbWl0LAo+ID4+PiAgdGhlbiB0aGUgImRlZmF1bHQiIHZhbHVlcyBnZW5lcmF0ZWQg
YnkgdGhlIHRvb2xzdGFjayBhcmUgdG9vIGhpZ2gsCj4gPj4+ICBhbmQgYWxsIGd1ZXN0IGNyZWF0
aW9ucyB3aWxsIGZhaWwuCj4gPj4+IAo+ID4+PiBJbiBvdGhlciB3b3JkcywgdGhlIHRvb2xzdGFj
ayBkZWZhdWx0cyByZXF1aXJlIGFueSBjaGFuZ2UgdG8gYmUKPiA+Pj4gZWZmZWN0ZWQgYnkgaGF2
aW5nIHRoZSBhZG1pbiBleHBsaWNpdGx5IHNwZWNpZnkgYSBuZXcgdmFsdWUgaW4gZXZlcnkKPiA+
Pj4gZ3Vlc3QuCj4gPj4+IAo+ID4+PiBJbiBvcmRlciB0byBhZGRyZXNzIHRoaXMsIGhhdmUgZ3Jh
bnRfdGFibGVfaW5pdCB0cmVhdCBuZWdhdGl2ZSB2YWx1ZXMKPiA+Pj4gZm9yIG1heF9ncmFudF9m
cmFtZXMgYW5kIG1heF9tYXB0cmFja19mcmFtZXMgYXMgaW5zdHJ1Y3Rpb25zIHRvIHVzZSB0aGUK
PiA+Pj4gc3lzdGVtLXdpZGUgZGVmYXVsdCwgYW5kIGhhdmUgYWxsIHRoZSBhYm92ZSB0b29sc3Rh
Y2tzIGRlZmF1bHQgdG8gcGFzc2luZwo+ID4+PiAtMSB1bmxlc3MgYSBkaWZmZXJlbnQgdmFsdWUg
aXMgZXhwbGljaXRseSBjb25maWd1cmVkLgo+ID4+PiAKPiA+Pj4gVGhpcyByZXN0b3JlcyB0aGUg
b2xkIGJlaGF2aW9yIGluIHRoYXQgY2hhbmdpbmcgdGhlIGh5cGVydmlzb3IgY29tbWFuZC1saW5l
Cj4gPj4+IG9wdGlvbiBjYW4gY2hhbmdlIHRoZSBiZWhhdmlvciBmb3IgYWxsIGd1ZXN0cywgd2hp
bGUgcmV0YWluaW5nIHRoZSBhYmlsaXR5Cj4gPj4+IHRvIHNldCBwZXItZ3Vlc3QgdmFsdWVzLiAg
SXQgYWxzbyByZW1vdmVzIHRoZSBidWcgdGhhdCByZWR1Y2luZyB0aGUKPiA+Pj4gc3lzdGVtLXdp
ZGUgbWF4IHdpbGwgY2F1c2UgYWxsIGRvbWFpbnMgd2l0aG91dCBleHBsaWNpdCBsaW1pdHMgdG8g
ZmFpbC4KPiA+Pj4gCj4gPj4+IE5PVEU6IC0gVGhlIE9jYW1sIGJpbmRpbmdzIHJlcXVpcmUgdGhl
IGNhbGxlciB0byBhbHdheXMgc3BlY2lmeSBhIHZhbHVlLAo+ID4+PiAgICAgICAgYW5kIHRoZSBj
b2RlIHRvIHN0YXJ0IGEgeGVuc3RvcmVkIHN0dWJkb21haW4gaGFyZC1jb2RlcyB0aGVzZSB0byA0
Cj4gPj4+IAlhbmQgMTI4IHJlc3BlY3RpdmVseTsgdGhpcyBiZWhhdm91ciB3aWxsIG5vdCBiZSBt
b2RpZmllZC4KPiA+Pj4gCj4gPj4+IFNpZ25lZC1vZmYtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3Jn
ZS5kdW5sYXBAY2l0cml4LmNvbT4KPiA+Pj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxw
ZHVycmFudEBhbWF6b24uY29tPgo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFu
LmphY2tzb25AZXUuY2l0cml4LmNvbT4KPiAKPiBEb2VzIHRoaXMgd2luIHNvbWUga2luZCBvZiBh
d2FyZCBmb3Ig4oCcbW9zdCBjb2xsYWJvcmF0aXZlIHBhdGNo4oCdPwoKSW4gdGVybXMgb2YgbnVt
YmVycyBvZiBTb0IsIG5vdCB5ZXQuIEkndmUgc2VlbiBwYXRjaChlcykgd2l0aCB0aHJlZQpTb0Jz
LgoKU29tZW9uZSBzaG91bGQndmUgbGVmdCBhIHR5cG8gaW4gc29tZXdoZXJlIHNvIHRoYXQgSSBj
YW4gZml4IGl0IGFuZCBwdXQKbXkgU29CIGluLiBUaGF0IG1heSBtYWtlIHRoaXMgcGF0Y2ggdGhl
IG1vc3QgY29sbGFib3JhdGl2ZSBwYXRjaCBJIGtub3cKb2YuIDotKQoKV2VpLgoKPiAKPiAgLUdl
b3JnZQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
