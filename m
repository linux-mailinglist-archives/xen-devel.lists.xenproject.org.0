Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE0513D835
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 11:51:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is2e6-0005Bx-PP; Thu, 16 Jan 2020 10:45:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1is2e4-0005Bs-JY
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 10:45:00 +0000
X-Inumbo-ID: 38c9e57e-384d-11ea-b89f-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 38c9e57e-384d-11ea-b89f-bc764e2007e4;
 Thu, 16 Jan 2020 10:44:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EAAA0AC8B;
 Thu, 16 Jan 2020 10:44:49 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200109162232.82782-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e678321a-3682-9cd5-f9a7-c0d76fdaf90e@suse.com>
Date: Thu, 16 Jan 2020 11:44:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200109162232.82782-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/smp: use APIC ALLBUT destination
 shorthand when possible
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDEuMjAyMCAxNzoyMiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IElmIHRoZSBJUEkg
ZGVzdGluYXRpb24gbWFzayBtYXRjaGVzIHRoZSBtYXNrIG9mIG9ubGluZSBDUFVzIHVzZSB0aGUK
PiBBUElDIEFMTEJVVCBkZXN0aW5hdGlvbiBzaG9ydGhhbmQgaW4gb3JkZXIgdG8gc2VuZCBhbiBJ
UEkgdG8gYWxsIENQVXMKPiBvbiB0aGUgc3lzdGVtIGV4Y2VwdCB0aGUgY3VycmVudCBvbmUuIFRo
aXMgY2FuIG9ubHkgYmUgc2FmZWx5IHVzZWQKPiB3aGVuIG5vIENQVSBob3RwbHVnIG9yIHVucGx1
ZyBvcGVyYXRpb25zIGFyZSB0YWtpbmcgcGxhY2UsIG5vIG9mZmxpbmUKPiBDUFVzIG9yIHRob3Nl
IGhhdmUgYmVlbiBvbmxpbmVkIGFuZCBwYXJrZWQgYW5kIGZpbmFsbHkgd2hlbiBhbGwgQ1BVcwo+
IGluIHRoZSBzeXN0ZW0gaGF2ZSBiZWVuIGFjY291bnRlZCBmb3IgKGllOiB0aGUgbnVtYmVyIG9m
IENQVXMgZG9lc24ndAo+IGV4Y2VlZCBOUl9DUFVTIGFuZCBBUElDIElEcyBhcmUgYmVsb3cgTUFY
X0FQSUNTKS4KPiAKPiBUaGlzIGlzIHNwZWNpYWxseSBiZW5lZmljaWFsIHdoZW4gdXNpbmcgdGhl
IFBWIHNoaW0sIHNpbmNlIHVzaW5nIHRoZQo+IHNob3J0aGFuZCBhdm9pZHMgcGVyZm9ybWluZyBh
biBBUElDIHJlZ2lzdGVyIHdyaXRlIChvciBtdWx0aXBsZSBvbmVzCj4gaWYgdXNpbmcgeEFQSUMg
bW9kZSkgZm9yIGVhY2ggZGVzdGluYXRpb24gd2hlbiBkb2luZyBhIGdsb2JhbCBUTEIKPiBmbHVz
aC4KPiAKPiBUaGUgbG9jayB0aW1lIG9mIGZsdXNoX2xvY2sgb24gYSAzMiB2Q1BVIGd1ZXN0IHVz
aW5nIHRoZSBzaGltIHdpdGhvdXQKPiB0aGUgc2hvcnRoYW5kIGlzOgo+IAo+IEdsb2JhbCBsb2Nr
IGZsdXNoX2xvY2s6IGFkZHI9ZmZmZjgyZDA4MDRiMjFjMCwgbG9ja3ZhbD1mNjAyZjYwMiwgbm90
IGxvY2tlZAo+ICAgbG9jazoyMjg0NTU5MzgoNzk0MDYwNjU1NzMxMzUpLCBibG9jazoyMDU5MDg1
ODAoNTU2NDE2NjA1NzYxNTM5KQo+IAo+IEF2ZXJhZ2UgbG9jayB0aW1lOiAzNDc1Nzducwo+IAo+
IFdoaWxlIHRoZSBzYW1lIGd1ZXN0IHVzaW5nIHRoZSBzaG9ydGhhbmQ6Cj4gCj4gR2xvYmFsIGxv
Y2sgZmx1c2hfbG9jazogYWRkcj1mZmZmODJkMDgwNGI0MWMwLCBsb2NrdmFsPWQ5YzRkOWJjLCBj
cHU9MTIKPiAgIGxvY2s6MTg5MDc3NSg0MTY3MTkxNDgwNTQpLCBibG9jazoxNjYzOTU4KDI1MDAx
NjEyODI5NDkpCj4gCj4gQXZlcmFnZSBsb2NrIHRpbWU6IDIyMDM5NW5zCj4gCj4gQXBwcm94aW1h
dGVseSBhIDEvMyBpbXByb3ZlbWVudCBpbiB0aGUgbG9jayB0aW1lLgo+IAo+IE5vdGUgdGhhdCB0
aGlzIHJlcXVpcmVzIGxvY2tpbmcgdGhlIENQVSBtYXBzIChnZXRfY3B1X21hcHMpIHdoaWNoIHVz
ZXMKPiBhIHRyeWxvY2suIFRoaXMgaXMgY3VycmVudGx5IHNhZmUgYXMgYWxsIHVzZXJzIG9mIGNw
dV9hZGRfcmVtb3ZlX2xvY2sKPiBkbyBhIHRyeWxvY2ssIGJ1dCB3aWxsIG5lZWQgcmVldmFsdWF0
aW5nIGlmIG5vbi10cnlsb2NrIHVzZXJzIGFwcGVhci4KCkFsbCBvZiB0aGlzIGxvb2tzIG9rYXkg
dG8gbWUsIGJ1dCBJIGhhdmUgYSBudW1iZXIgb2YgbWVjaGFuaWNhbAooaG9wZWZ1bGx5IG5vdCB0
b28gbml0cGlja3kpIGNvbW1lbnRzLgoKPiBBbHNvIHRoZXJlJ3Mgc29tZSBjb2RlIG1vdmVtZW50
IG9mIF9fcHJlcGFyZV9JQ1IgYW5kCj4gX19kZWZhdWx0X3NlbmRfSVBJX3Nob3J0Y3V0LCB3aGlj
aCBpcyBhIG5vbi1mdW5jdGlvbmFsIGNoYW5nZSBidXQgSQo+IGRpZG4ndCBmZWVsIGxpa2UgaXQg
c2hvdWxkIGJlIHNwbGl0IHRvIGEgc2VwYXJhdGUgcGF0Y2guCgpUaGlzIG1heSBiZXR0ZXIgYmUg
c3BsaXQgb3V0IC0gc2VlIGJlbG93IGZvciB3aHkuCgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9hY3Bp
L2Jvb3QuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9hY3BpL2Jvb3QuYwo+IEBAIC0xMDMsNiArMTAz
LDcgQEAgYWNwaV9wYXJzZV94MmFwaWMoc3RydWN0IGFjcGlfc3VidGFibGVfaGVhZGVyICpoZWFk
ZXIsIGNvbnN0IHVuc2lnbmVkIGxvbmcgZW5kKQo+ICAJCQkgICAgICAgcHJvY2Vzc29yLT5sYXBp
Y19mbGFncyAmIEFDUElfTUFEVF9FTkFCTEVECj4gIAkJCSAgICAgICA/IEtFUk5fV0FSTklORyAi
V0FSTklORzogIiA6IEtFUk5fSU5GTywKPiAgCQkJICAgICAgIHByb2Nlc3Nvci0+bG9jYWxfYXBp
Y19pZCwgcHJvY2Vzc29yLT51aWQpOwo+ICsJCWNwdV9vdmVyZmxvdyA9IHRydWU7CgpJIGRvbid0
IHRoaW5rIHRoaXMgaXMgYSBnb29kIG5hbWUuIFNlZWluZyB0aGF0IHdlIGhhdmUgImRpc2FibGVk
X2NwdXMiLApob3cgYWJvdXQgInVuYWNjb3VudGVkX2NwdXMiIG9yIHNvbWUgc3VjaD8gKFRoaXMg
Y291bGQgc3RpbGwgYmUgYSBib29sZWFuCmZvciB0aGUgdGltZSBiZWluZywgaWYgcHJlZmVycmVk
IHRvIG5vdCBiZSBhIHRydWUgY291bnQuKQoKVGhpbmtpbmcgYWJvdXQgaXQsIHdoYXQgYWJvdXQg
dGhlIHBlcmlvZCBvZiB0aW1lIGJldHdlZW4gYSBDUFUgaGF2aW5nCmdvdCBwaHlzaWNhbGx5IGhv
dC1hZGRlZCAoYW5kIGhlbmNlIGtub3duIGF0IHRoZSBoYXJkd2FyZSBsZXZlbCkgYW5kCml0IGFj
dHVhbGx5IGdldHRpbmcgYnJvdWdodCB1cCBmb3IgdGhlIGZpcnN0IHRpbWU/IElPVyAtIGRvIHlv
dQpwZXJoYXBzIG5lZWQgdG8gZXhjbHVkZSB1c2Ugb2YgdGhlIHNob3J0Y3V0IGFsc28gd2hlbiBk
aXNhYmxlZF9jcHVzCmlzIG5vbi16ZXJvPwoKPiBAQCAtMjMsNiArMjQsMzEgQEAKPiAgI2luY2x1
ZGUgPGlycV92ZWN0b3JzLmg+Cj4gICNpbmNsdWRlIDxtYWNoX2FwaWMuaD4KPiAgCj4gK3N0YXRp
YyBpbmxpbmUgaW50IF9fcHJlcGFyZV9JQ1IodW5zaWduZWQgaW50IHNob3J0Y3V0LCBpbnQgdmVj
dG9yKQo+ICt7Cj4gKyAgICByZXR1cm4gQVBJQ19ETV9GSVhFRCB8IHNob3J0Y3V0IHwgdmVjdG9y
Owo+ICt9CgpJIHRoaW5rIF9fcHJlcGFyZV9JQ1IyKCkgc2hvdWxkIGJlIG1vdmVkIHRvZ2V0aGVy
IHdpdGggaXQsIGFuZCBJIGFsc28KdGhpbmsgbW92ZW1lbnQgbGlrZSB0aGlzIHNob3VsZCBpbmNs
dWRlIGNvcnJlY3RpbmcgdGhlIG5hbWUgKGJ5CmRyb3BwaW5nIGF0IGxlYXN0IG9uZSBvZiB0aGUg
dW5kZXJzY29yZXMpLiBBcyBwZXIgcmVjZW50IGNvbW1lbnRzCmVsc2V3aGVyZSAiaW5saW5lIiBt
YXkgYWxzbyB3YW50IGRyb3BwaW5nIGF0IHRoaXMgb2NjYXNpb24uCgo+ICtzdGF0aWMgdm9pZCBf
X2RlZmF1bHRfc2VuZF9JUElfc2hvcnRjdXQodW5zaWduZWQgaW50IHNob3J0Y3V0LCBpbnQgdmVj
dG9yLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQg
aW50IGRlc3QpCgpUaGUgcmVuYW1pbmcgc2hvdWxkIGdvIGV2ZW4gZmFydGhlciBoZXJlOiBUaGVy
ZSdzIG5vdGhpbmcgImRlZmF1bHQiCmFib3V0IHRoaXMgZnVuY3Rpb24gLSB0aGVyZSdzIG5vdCBz
ZWNvbmQsIG5vbi1kZWZhdWx0IGltcGxlbWVudGF0aW9uLgpKdXN0IGxpa2Ugb3RoZXIgc2ltaWxh
ciBmdW5jdGlvbnMgaXQgc2hvdWxkIGp1c3QgYmUKc2VuZF9JUElfc2hvcnRjdXQoKS4KCj4gQEAg
LTMwLDcgKzU2LDQwIEBACj4gIAo+ICB2b2lkIHNlbmRfSVBJX21hc2soY29uc3QgY3B1bWFza190
ICptYXNrLCBpbnQgdmVjdG9yKQo+ICB7Cj4gLSAgICBhbHRlcm5hdGl2ZV92Y2FsbChnZW5hcGlj
LnNlbmRfSVBJX21hc2ssIG1hc2ssIHZlY3Rvcik7Cj4gKyAgICBib29sIGNwdXNfbG9ja2VkID0g
ZmFsc2U7Cj4gKwo+ICsgICAgLyoKPiArICAgICAqIFByZXZlbnQgYW55IENQVSBob3R7dW59cGx1
ZyB3aGlsZSBzZW5kaW5nIHRoZSBJUElzIGlmIHdlIGFyZSB0byB1c2UKPiArICAgICAqIGEgc2hv
cnRoYW5kLCBhbHNvIHJlZnVzZSB0byB1c2UgYSBzaG9ydGhhbmQgaWYgbm90IGFsbCBDUFVzIGFy
ZQo+ICsgICAgICogb25saW5lIG9yIGhhdmUgYmVlbiBwYXJrZWQuCj4gKyAgICAgKi8KPiArICAg
IGlmICggc3lzdGVtX3N0YXRlID4gU1lTX1NUQVRFX3NtcF9ib290ICYmICFjcHVfb3ZlcmZsb3cg
JiYKPiArICAgICAgICAgLyogTkI6IGdldF9jcHVfbWFwcyBsb2NrIHJlcXVpcmVzIGVuYWJsZWQg
aW50ZXJydXB0cy4gKi8KPiArICAgICAgICAgbG9jYWxfaXJxX2lzX2VuYWJsZWQoKSAmJiAoY3B1
c19sb2NrZWQgPSBnZXRfY3B1X21hcHMoKSkgJiYKPiArICAgICAgICAgKHBhcmtfb2ZmbGluZV9j
cHVzIHx8Cj4gKyAgICAgICAgICBjcHVtYXNrX2VxdWFsKCZjcHVfb25saW5lX21hcCwgJmNwdV9w
cmVzZW50X21hcCkpICkKCk9uIHRoZSBmaXJzdCBhbmQgc2Vjb25kIHBhc3MgSSB0aG91Z2h0IHRo
aXMgY29udHJhZGljdHMgdGhlIGRlc2NyaXB0aW9uLgpUbyBkaXNhbWJpZ3VhdGUgKGFuZCBhc3N1
bWluZyBJIHVuZGVyc3RhbmQgaXQgY29ycmVjdGx5KSwgaG93IGFib3V0CnNheWluZyBzb21ldGhp
bmcgbGlrZSAiVGhpcyBjYW4gb25seSBiZSBzYWZlbHkgdXNlZCB3aGVuIG5vIENQVSBob3RwbHVn
Cm9yIHVucGx1ZyBvcGVyYXRpb25zIGFyZSB0YWtpbmcgcGxhY2UsIHRoZXJlIGFyZSBubyBvZmZs
aW5lIENQVXMgKHVubGVzcwp0aG9zZSBoYXZlIGJlZW4gb25saW5lZCBhbmQgcGFya2VkKSBhbmQg
ZmluYWxseSAuLi4iPwoKPiArICAgIHsKPiArICAgICAgICBjcHVtYXNrX2NvcHkodGhpc19jcHUo
c2NyYXRjaF9jcHVtYXNrKSwgJmNwdV9vbmxpbmVfbWFwKTsKPiArICAgICAgICBjcHVtYXNrX2Ns
ZWFyX2NwdShzbXBfcHJvY2Vzc29yX2lkKCksIHRoaXNfY3B1KHNjcmF0Y2hfY3B1bWFzaykpOwoK
ICAgICAgICBjcHVtYXNrX2FuZG5vdCh0aGlzX2NwdShzY3JhdGNoX2NwdW1hc2spLCAmY3B1X29u
bGluZV9tYXAsCiAgICAgICAgICAgICAgICAgICAgICAgY3B1bWFza19vZihzbXBfcHJvY2Vzc29y
X2lkKCkpKTsKCj8KCj4gKyAgICB9Cj4gKyAgICBlbHNlCj4gKyAgICB7Cj4gKyAgICAgICAgaWYg
KCBjcHVzX2xvY2tlZCApCj4gKyAgICAgICAgewo+ICsgICAgICAgICAgICBwdXRfY3B1X21hcHMo
KTsKPiArICAgICAgICAgICAgY3B1c19sb2NrZWQgPSBmYWxzZTsKPiArICAgICAgICB9Cj4gKyAg
ICAgICAgY3B1bWFza19jbGVhcih0aGlzX2NwdShzY3JhdGNoX2NwdW1hc2spKTsKCklzIHRoZXJl
IGEgZ3VhcmFudGVlIHRoYXQgdGhlIGZ1bmN0aW9uIHdvbid0IGJlIGNhbGxlZCB3aXRoIGFuCmVt
cHR5IG1hc2s/IEFsbCBiYWNraW5nIGZ1bmN0aW9ucyBsb29rIHRvIGdyYWNlZnVsbHkgZGVhbCB3
aXRoCnRoaXMgY2FzZSwgeWV0IC4uLgoKPiArICAgIH0KPiArCj4gKyAgICBpZiAoIGNwdW1hc2tf
ZXF1YWwobWFzaywgdGhpc19jcHUoc2NyYXRjaF9jcHVtYXNrKSkgKT4gKyAgICAgICAgX19kZWZh
dWx0X3NlbmRfSVBJX3Nob3J0Y3V0KEFQSUNfREVTVF9BTExCVVQsIHZlY3RvciwKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQVBJQ19ERVNUX1BIWVNJQ0FMKTsKCi4uLiB5
b3UnZCBtYWtlIHRoaXMgYW4gImFsbC1idXQiIG1lc3NhZ2UgdGhlbi4gQWRkaW5nIGEKIWNwdW1h
c2tfZW1wdHkoKSBjaGVjayB3b3VsZCBzZWVtIGEgbGl0dGxlIGV4cGVuc2l2ZSwgc28gaG93CmFi
b3V0IHlvdSBjb3B5IGNwdW1hc2tfb2Yoc21wX3Byb2Nlc3Nvcl9pZCgpKSBhYm92ZSBhbmQgYWRk
CiFjcHVtYXNrX3Rlc3RfY3B1KHNtcF9wcm9jZXNzb3JfaWQoKSwgLi4uKSBoZXJlPwoKPiArICAg
IGVsc2UKPiArICAgICAgICBhbHRlcm5hdGl2ZV92Y2FsbChnZW5hcGljLnNlbmRfSVBJX21hc2ss
IG1hc2ssIHZlY3Rvcik7CgpJcyB0aGVyZSBubyByZWFzb24gYXQgYWxsIHRvIGFsc28gY2hlY2sg
aGVyZSB3aGV0aGVyIEFQSUNfREVTVF9BTEwKY291bGQgYmUgdXNlZD8gT2gsIEkgc2VlIC0gdGhl
IGJhY2tpbmcgZnVuY3Rpb25zIGFsbCBleGNsdWRlIHRoZQpsb2NhbCBDUFUuIEkgd29uZGVyIHdo
eSBlLmcuIGZsdXNoX2FyZWFfbWFzaygpIHRoZW4gY2xlYXJzIHRoZQpDUFUgb2ZmIHRoZSBtYXNr
IGl0IHBhc3NlcyBvbi4gQW5kIHdpdGggdGhpcyBiZWhhdmlvciB0aGUKc2luZ2xlIGNwdW1hc2tf
ZXF1YWwoKSBjaGVjayBhYm92ZSBpcyB0b28gcmVzdHJpY3RpdmUgLSB5b3UnbGwKd2FudCB0byBj
aGVjayB3aGV0aGVyIG1hc2sgbWF0Y2hlcyB0aGUgY2FsY3VsYXRlZCBhbGwtYnV0IG9uZSBvcgpj
cHVfb25saW5lX21hcC4gSS5lLiBwZXJoYXBzIHlvdSB3YW50CgogICAgICAgIGNwdW1hc2tfb3Io
dGhpc19jcHUoc2NyYXRjaF9jcHVtYXNrKSwgbWFzaywKICAgICAgICAgICAgICAgICAgIGNwdW1h
c2tfb2Yoc21wX3Byb2Nlc3Nvcl9pZCgpKSk7CgphbmQgdGhlbgoKICAgIGlmICggY3B1bWFza19l
cXVhbCh0aGlzX2NwdShzY3JhdGNoX2NwdW1hc2spLCAmY3B1X29ubGluZV9tYXApICkKCj8KCkph
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
