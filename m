Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A63914CC80
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 15:32:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwoLl-0004rl-Ol; Wed, 29 Jan 2020 14:29:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WAbB=3S=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1iwoLk-0004rg-7M
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 14:29:48 +0000
X-Inumbo-ID: ccb3f09e-42a3-11ea-8396-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ccb3f09e-42a3-11ea-8396-bc764e2007e4;
 Wed, 29 Jan 2020 14:29:47 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id m16so786773wrx.11
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jan 2020 06:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lrIXJADmZ4JtCdEwsmwfJXtECTjYjDHNxZTxEsaoQsg=;
 b=PnJspwur3SRKgdJO5WA9UPrAbz306eOZInxSWlw+ZcYqBM5ojqfGBXJLvkpLxHBB+x
 lV1ozJMIIPPs6Tbpzp+z8HAgvp6UK5KP3vzYxPX5WDFfANcyGwwdBhZcmX2RIUFYeoo6
 iwZbydBqvwIpU9CP4hrqt9lz+Z43mkO+n11Pok8c/ZyHuJeEq4YoId7gLo3ETWtV0N+1
 lbwQ3R2yLUqN0UsiSmwlVGr/v53Y0CcZ4ODw7vXKc+eouJN+VPylmrgs2CJgeQrgFWwX
 d3Fcvr9gGlWa4e+5qfpd/Zjb8+NkQXUdHl+6GFYFmSmWgReGh8zBekHmLqHnmrpTZRxR
 NxdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lrIXJADmZ4JtCdEwsmwfJXtECTjYjDHNxZTxEsaoQsg=;
 b=UNn3NmSjnmAVHFzrV6yvYLUmPzlZTM150Sy3gpQeCvoWfM9pAuWDev6+PWlGW3dB7s
 slkrIrKLpFTLSbqvNJmB1f1FI1oA/EN2rHsQk25UVchDciIOEpg4xf7tFC/+gi10MwBE
 03pH9Xim4SPIowcYXP38UQAhaHT2hywTjs8ayU8h3aW/bfVV4/3urMWsg4LRkOap7KTl
 Pog5l76oDrU3CMMybWCIxaMcArAnh5w52Wbcf2ikwoVckAYpSujCmb/K+tkWB8WC4u7H
 31WwNCeqGWowhZ1TKXlH1KlVjxX+ZpX+Kg8Dcmxdt0TTZO9mDlOP/IxAFTaev7pqWLHt
 epyA==
X-Gm-Message-State: APjAAAV3Do42Ddmj1ips5mDy/COMHhS3nX4ImvytYTVGZuNY0DhkAEKH
 Q6U0Fqsy+ywd9YDWmX+9IUNlsqX7UXUOb4L2InE=
X-Google-Smtp-Source: APXvYqzPASRneqxbOKa105oTTIgBjG/ROSRoJntcoQxMK1suuEm6OJ9bFEaOUMEnQdvr7xdmQ/dnoyWsB3j0MPF0+0E=
X-Received: by 2002:adf:f5cf:: with SMTP id k15mr37223026wrp.182.1580308186575; 
 Wed, 29 Jan 2020 06:29:46 -0800 (PST)
MIME-Version: 1.0
References: <cover.1580148227.git.tamas.lengyel@intel.com>
 <ae2142231342bfc6fb9731303130a2c0fa381576.1580148227.git.tamas.lengyel@intel.com>
 <88661ce4-ef90-c525-586a-4668d4b0001e@suse.com>
 <CABfawhnZTSzh5X0Zctiikw7xhMEDdSGTnW2-eBVC_FsGN9-Ksg@mail.gmail.com>
 <1835b6f4-7361-8979-5a0e-27df5148873a@suse.com>
 <CABfawhkBh-EFjq_HDMaTbtHo=toDcM-C6NwEgCN4i7hZWNNeCA@mail.gmail.com>
In-Reply-To: <CABfawhkBh-EFjq_HDMaTbtHo=toDcM-C6NwEgCN4i7hZWNNeCA@mail.gmail.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Wed, 29 Jan 2020 07:29:10 -0700
Message-ID: <CABfawhkFp+VmMS5v_3TPVuAYrnPcHhLr+23RKYUyLVbL6Tz5uQ@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v6 5/9] x86/mem_sharing: use default_access
 in add_to_physmap
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMjksIDIwMjAgYXQgNzowNSBBTSBUYW1hcyBLIExlbmd5ZWwKPHRhbWFzLmsu
bGVuZ3llbEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBKYW4gMjksIDIwMjAgYXQgNjoy
NyBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIDI4
LjAxLjIwMjAgMTg6MDIsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiA+ID4gT24gVHVlLCBKYW4g
MjgsIDIwMjAgYXQgOTo1NiBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3Rl
Ogo+ID4gPj4KPiA+ID4+IE9uIDI3LjAxLjIwMjAgMTk6MDYsIFRhbWFzIEsgTGVuZ3llbCB3cm90
ZToKPiA+ID4+PiBXaGVuIHBsdWdnaW5nIGEgaG9sZSBpbiB0aGUgdGFyZ2V0IHBoeXNtYXAgZG9u
J3QgdXNlIHRoZSBhY2Nlc3MgcGVybWlzc2lvbgo+ID4gPj4+IHJldHVybmVkIGJ5IF9fZ2V0X2dm
bl90eXBlX2FjY2VzcyBhcyBpdCBjYW4gYmUgbm9uLXNlbnNpY2FsLCBsZWFkaW5nIHRvCj4gPiA+
Pj4gc3B1cmlvdXMgdm1fZXZlbnRzIGJlaW5nIHNlbnQgb3V0IGZvciBhY2Nlc3MgdmlvbGF0aW9u
cyBhdCB1bmV4cGVjdGVkCj4gPiA+Pj4gbG9jYXRpb25zLiBNYWtlIHVzZSBvZiBwMm0tPmRlZmF1
bHRfYWNjZXNzIGluc3RlYWQuCj4gPiA+Pgo+ID4gPj4gQXMgYmVmb3JlLCB0byBtZSAiY2FuIGJl
IG5vbi1zZW5zaWNhbCIgaXMgaW5zdWZmaWNpZW50IGFzIGEgcmVhc29uCj4gPiA+PiBoZXJlLiBJ
ZiBpdCBjYW4gYWxzbyBiZSBhICJnb29kIiB2YWx1ZSwgaXQgc3RpbGwgcmVtYWlucyB1bmNsZWFy
Cj4gPiA+PiB3aHkgaW4gdGhhdCBjYXNlIHAybS0+ZGVmYXVsdF9hY2Nlc3MgaXMgbmV2ZXJ0aGVs
ZXNzIHRoZSByaWdodAo+ID4gPj4gdmFsdWUgdG8gdXNlLgo+ID4gPgo+ID4gPiBJIGhhdmUgYWxy
ZWFkeSBleHBsYWluZWQgaW4gdGhlIHByZXZpb3VzIHZlcnNpb24gb2YgdGhlIHBhdGNoIHdoeSBJ
Cj4gPiA+IHNhaWQgImNhbiBiZSIuIEZvcmdvdCB0byBjaGFuZ2UgdGhlIGNvbW1pdCBtZXNzYWdl
IGZyb20gImNhbiBiZSIgdG8KPiA+ID4gImlzIi4KPiA+Cj4gPiBDaGFuZ2luZyBqdXN0IHRoZSBj
b21taXQgbWVzc2FnZSB3b3VsZCBiZSBlYXN5IHdoaWxlIGNvbW1pdHRpbmcuCj4gPiBCdXQgZXZl
biB3aXRoIHRoZSBjaGFuZ2UgSSB3b3VsZCBhc2sgd2h5IHRoaXMgaXMuIExvb2tpbmcgYXQKPiA+
IGVwdF9nZXRfZW50cnkoKSAoYW5kIGFzc3VtaW5nIHAybV9wdF9nZXRfZW50cnkoKSB3aWxsIHdv
cmsKPiA+IHNpbWlsYXJseSwgbWludXMgdGhlIHAybV9hY2Nlc3NfdCB3aGljaCBjYW4ndCBjb21l
IG91dCBvZiB0aGUKPiA+IFBURSBqdXN0IHlldCksIEkgc2VlCj4gPgo+ID4gICAgIGlmICggaXNf
ZXB0ZV92YWxpZChlcHRfZW50cnkpICkKPiA+ICAgICB7Cj4gPiAgICAgICAgICp0ID0gcDJtX3Jl
Y2FsY190eXBlKHJlY2FsYyB8fCBlcHRfZW50cnktPnJlY2FsYywKPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZXB0X2VudHJ5LT5zYV9wMm10LCBwMm0sIGdmbik7Cj4gPiAgICAgICAg
ICphID0gZXB0X2VudHJ5LT5hY2Nlc3M7Cj4gPgo+ID4gbmVhciBpdHMgZW5kLiBXaGljaCBtZWFu
cyBldmVuIGEgaG9sZSBjYW4gaGF2ZSBpdHMgYWNjZXNzIGZpZWxkCj4gPiBzZXQuIFNvIGl0J3Mg
c3RpbGwgbm90IGNsZWFyIHRvIG1lIGZyb20gdGhlIGRlc2NyaXB0aW9uIHdoeQo+ID4gcDJtLT5k
ZWZhdWx0X2FjY2VzcyBpcyB1bmlmb3JtbHkgdGhlIHZhbHVlIHRvIHVzZS4gV291bGRuJ3QgeW91
Cj4gPiByYXRoZXIgd2FudCB0byBvdmVycmlkZSB0aGUgb3JpZ2luYWwgdmFsdWUgb25seSBpZiBp
dCdzCj4gPiBwMm1fYWNjZXNzX24gdG9nZXRoZXIgd2l0aCBwMm1faW52YWxpZCBvciBwMm1fbW1p
b19kbSAoYnV0IG5vdAo+ID4gcGFnZWQtb3V0IHBhZ2VzKT8KPgo+IEF0IHRoaXMgcG9pbnQgSSB3
b3VsZCBqdXN0IHJhdGhlciBzdGF0ZSB0aGF0IGFkZF90b19waHlzbWFwIG9ubHkgd29ya3MKPiBv
biBhY3R1YWwgaG9sZXMsIG5vdCB3aXRoIHBhZ2VkLW91dCBwYWdlcy4gSW4gZmFjdCwgSSB3b3Vs
ZCBsaWtlIHRvCj4gc2VlIG1lbV9wYWdpbmcgYmVpbmcgZHJvcHBlZCBmcm9tIHRoZSBjb2RlYmFz
ZSBlbnRpcmVseSBzaW5jZSBpdCdzCj4gYmVlbiBhYmFuZG9uZWQgZm9yIHllYXJzIGFuZCBub29u
ZSBleHByZXNzaW5nIGFueSBpbnRlcmVzdCBpbiBrZWVwaW5nCj4gaXQuIEluIHRoZSBpbnRlcmlt
IEkgd291bGQgcmF0aGVyIG5vdCBzcGVuZCB1bm5lY2Vzc2FyeSBjeWNsZXMgb24KPiBzcGVjdWxh
dGluZyBhYm91dCBwb3RlbnRpYWwgY29ybmVyLWNhc2VzIG9mIG1lbV9wYWdpbmcgd2hlbiBub29u
ZQo+IGFjdHVhbGx5IHVzZXMgaXQuCj4KPiA+IE9mIGNvdXJzZSB0aGVuIHRoZSBxdWVzdGlvbiBp
cyB3aGV0aGVyIHRoZXJlCj4gPiB3b3VsZG4ndCBiZSBhbiBhbWJpZ3VpdHkgd2l0aCBwMm1fYWNj
ZXNzX24gaGF2aW5nIGdvdCBzZXQKPiA+IGV4cGxpY2l0bHkgb24gdGhlIHBhZ2UuIEJ1dCBtYXli
ZSB0aGlzIGlzIGltcG9zc2libGUgZm9yCj4gPiBwMm1faW52YWxpZCAvIHAybV9tbWlvX2RtPwo+
Cj4gQXMgZmFyIGFzIG1lbV9hY2Nlc3MgcGVybWlzc2lvbnMgZ28sIEkgZG9uJ3Qga25vdyBvZiBh
bnkgdXNlY2FzZSB0aGF0Cj4gd291bGQgc2V0IG1lbV9hY2Nlc3MgcGVybWlzc2lvbiBvbiBhIGhv
bGUgZXZlbiBpZiBieSBsb29rcyBvZiBpdCBpdCBpcwo+IHRlY2huaWNhbGx5IHBvc3NpYmxlLiBB
dCB0aGlzIHBvaW50IEkgd291bGQgcmF0aGVyIGp1c3QgcHV0IHRoaXMKPiBjb3JuZXItY2FzZSdz
IGRlc2NyaXB0aW9uIGluIGEgY29tbWVudC4KCkEgcG90ZW50aWFsIHNvbHV0aW9uIGZvciB0aGlz
IC0gaWYgb25lIHdvdWxkIG5lZWQgaXQgaW4gdGhlIGZ1dHVyZSAtCndvdWxkIGJlIHRvIGFkZCBh
bm90aGVyIFZNIGV2ZW50IHR5cGUgdGhhdCBYZW4gY2FuIHVzZSB0byBhbGVydCB0aGUKdG9vbHN0
YWNrIHRoYXQgYSBwcmUtZXhpc3RpbmcgbWVtX2FjY2VzcyBwZXJtaXNzaW9uIGlzIGJlaW5nCm92
ZXJ3cml0dGVuIGJ5IGZvcmtpbmcuIFRoYXQgd291bGQgYWxsb3cgdGhlIHRvb2xzdGFjayB0byBy
ZXNldCB0aGUKcGVybWlzc2lvbiBpZiBpdCB3YW50cyB0by4gQnV0IGhvbmVzdGx5LCBJIHRoaW5r
IGl0J3MgYSBsb3Qgb2YgY29kZQpmb3IgYSBzaXR1YXRpb24gdGhhdCBJIGRvbid0IGV4cGVjdCBh
bnlvbmUgd2lsbCBldmVyIHJ1biBpbnRvLiBMZXQncwpqdXN0IGRvY3VtZW50IGl0IGFuZCBtb3Zl
IG9uLgoKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
