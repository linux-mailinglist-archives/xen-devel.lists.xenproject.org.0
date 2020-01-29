Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D391914CE06
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 17:12:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwpuh-000813-HB; Wed, 29 Jan 2020 16:09:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WAbB=3S=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1iwpuf-0007xm-Ig
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 16:09:57 +0000
X-Inumbo-ID: caa32dde-42b1-11ea-8396-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id caa32dde-42b1-11ea-8396-bc764e2007e4;
 Wed, 29 Jan 2020 16:09:56 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id q9so289076wmj.5
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jan 2020 08:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z+41GGe5tZ/KcyQlos/P/pTXfRMX7AGAh9lSeca4Ywc=;
 b=SDpuixGppjHYO9/IOYLij4yZaN/d/4Dn21k0G7Ry9OZeQ5bsowHMu1HThRS0KWICqs
 aLh5IIX+AMxIOYbWv9wGejL6hjLq7KbaItwHZkYZDlV3A/vNzWRJEMfkY2qJyeUqjv2r
 bkKr9/b/8qwuAXCOa6dwRnQ3zV+YZy4uSpcZIgyDXyesUe8Oiq1TFXixpI9gMLJ6iAD1
 KpSkex6qr060dHI7SceUWuI7zoprlQGCxlOGxE4/1pkhTNd31dF/6vurc9l6H5jaKJE6
 uOall/N/HN4OooZVUrZHBUvyfkbqUROOINMfwZXqdHwaSrUu0p29iO8thGV4mSAWrsJZ
 yhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z+41GGe5tZ/KcyQlos/P/pTXfRMX7AGAh9lSeca4Ywc=;
 b=DzVi96rpyXbxKzC6aDn4r1YoO4H1nrKAZkBM/eA5FBPwG+zHkGEQXaqulGzKkYtjNW
 Xgh+zZL5qkcGGTGKDHnAYWrYvf2BYWt883R8N70kVdjYLXv/LQaYFpmslVmKigMZBKS/
 /jkuub89JV4JCs+tRqrSyqTd2LcIF/b47Ldfp4sz1lGnJ6ew2SBtwYuF1Firic7Y/JB1
 wEUJXJiRwYrJL+vdWCgsYFvSIHy0C65mMCaIgFsWQkapG9+NvJ3DrhL7G/r2ja5VLVAq
 o5PRlvulFbqa83Xg4E+LxCtkxa2iFP8XUxjDBYH86Yy6kkOuatd+eoMWJS8w+S8+ijPe
 QUag==
X-Gm-Message-State: APjAAAWCR/Hu83HYlW+WYOaJ3s//aiJllhvVn2XDxKlocdaK7R3yXrbS
 aSQHXUB5RvOoU1qdY/KW58x7qCSGf2ni9PkJlD0=
X-Google-Smtp-Source: APXvYqyHJHz0zXNQDPhkAnGKPweD21ar28jk4La9fVzGhMRkhae5aib3YOH/Jav/R2dgy/MzNyjl1PLKNmt0cSsvqx4=
X-Received: by 2002:a05:600c:d6:: with SMTP id
 u22mr12409672wmm.77.1580314196017; 
 Wed, 29 Jan 2020 08:09:56 -0800 (PST)
MIME-Version: 1.0
References: <cover.1580148227.git.tamas.lengyel@intel.com>
 <ae2142231342bfc6fb9731303130a2c0fa381576.1580148227.git.tamas.lengyel@intel.com>
 <88661ce4-ef90-c525-586a-4668d4b0001e@suse.com>
 <CABfawhnZTSzh5X0Zctiikw7xhMEDdSGTnW2-eBVC_FsGN9-Ksg@mail.gmail.com>
 <1835b6f4-7361-8979-5a0e-27df5148873a@suse.com>
 <CABfawhkBh-EFjq_HDMaTbtHo=toDcM-C6NwEgCN4i7hZWNNeCA@mail.gmail.com>
 <8143473f-c87d-a0d1-e211-c94b1dc7f5c8@suse.com>
 <CABfawh==quyX5uG1Rh5V8rbDO_SnNr-mA-=DSFn8ejvaXe_ZgA@mail.gmail.com>
In-Reply-To: <CABfawh==quyX5uG1Rh5V8rbDO_SnNr-mA-=DSFn8ejvaXe_ZgA@mail.gmail.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Wed, 29 Jan 2020 09:09:19 -0700
Message-ID: <CABfawhnzLSuEqR6nbJo_nZRxYig74onVbfEcKJehEj93eFPmwg@mail.gmail.com>
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

T24gV2VkLCBKYW4gMjksIDIwMjAgYXQgNzo1NiBBTSBUYW1hcyBLIExlbmd5ZWwKPHRhbWFzLmsu
bGVuZ3llbEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBKYW4gMjksIDIwMjAgYXQgNzo0
NCBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIDI5
LjAxLjIwMjAgMTU6MDUsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiA+ID4gT24gV2VkLCBKYW4g
MjksIDIwMjAgYXQgNjoyNyBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3Rl
Ogo+ID4gPj4KPiA+ID4+IE9uIDI4LjAxLjIwMjAgMTg6MDIsIFRhbWFzIEsgTGVuZ3llbCB3cm90
ZToKPiA+ID4+PiBPbiBUdWUsIEphbiAyOCwgMjAyMCBhdCA5OjU2IEFNIEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6Cj4gPiA+Pj4+Cj4gPiA+Pj4+IE9uIDI3LjAxLjIwMjAg
MTk6MDYsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiA+ID4+Pj4+IFdoZW4gcGx1Z2dpbmcgYSBo
b2xlIGluIHRoZSB0YXJnZXQgcGh5c21hcCBkb24ndCB1c2UgdGhlIGFjY2VzcyBwZXJtaXNzaW9u
Cj4gPiA+Pj4+PiByZXR1cm5lZCBieSBfX2dldF9nZm5fdHlwZV9hY2Nlc3MgYXMgaXQgY2FuIGJl
IG5vbi1zZW5zaWNhbCwgbGVhZGluZyB0bwo+ID4gPj4+Pj4gc3B1cmlvdXMgdm1fZXZlbnRzIGJl
aW5nIHNlbnQgb3V0IGZvciBhY2Nlc3MgdmlvbGF0aW9ucyBhdCB1bmV4cGVjdGVkCj4gPiA+Pj4+
PiBsb2NhdGlvbnMuIE1ha2UgdXNlIG9mIHAybS0+ZGVmYXVsdF9hY2Nlc3MgaW5zdGVhZC4KPiA+
ID4+Pj4KPiA+ID4+Pj4gQXMgYmVmb3JlLCB0byBtZSAiY2FuIGJlIG5vbi1zZW5zaWNhbCIgaXMg
aW5zdWZmaWNpZW50IGFzIGEgcmVhc29uCj4gPiA+Pj4+IGhlcmUuIElmIGl0IGNhbiBhbHNvIGJl
IGEgImdvb2QiIHZhbHVlLCBpdCBzdGlsbCByZW1haW5zIHVuY2xlYXIKPiA+ID4+Pj4gd2h5IGlu
IHRoYXQgY2FzZSBwMm0tPmRlZmF1bHRfYWNjZXNzIGlzIG5ldmVydGhlbGVzcyB0aGUgcmlnaHQK
PiA+ID4+Pj4gdmFsdWUgdG8gdXNlLgo+ID4gPj4+Cj4gPiA+Pj4gSSBoYXZlIGFscmVhZHkgZXhw
bGFpbmVkIGluIHRoZSBwcmV2aW91cyB2ZXJzaW9uIG9mIHRoZSBwYXRjaCB3aHkgSQo+ID4gPj4+
IHNhaWQgImNhbiBiZSIuIEZvcmdvdCB0byBjaGFuZ2UgdGhlIGNvbW1pdCBtZXNzYWdlIGZyb20g
ImNhbiBiZSIgdG8KPiA+ID4+PiAiaXMiLgo+ID4gPj4KPiA+ID4+IENoYW5naW5nIGp1c3QgdGhl
IGNvbW1pdCBtZXNzYWdlIHdvdWxkIGJlIGVhc3kgd2hpbGUgY29tbWl0dGluZy4KPiA+ID4+IEJ1
dCBldmVuIHdpdGggdGhlIGNoYW5nZSBJIHdvdWxkIGFzayB3aHkgdGhpcyBpcy4gTG9va2luZyBh
dAo+ID4gPj4gZXB0X2dldF9lbnRyeSgpIChhbmQgYXNzdW1pbmcgcDJtX3B0X2dldF9lbnRyeSgp
IHdpbGwgd29yawo+ID4gPj4gc2ltaWxhcmx5LCBtaW51cyB0aGUgcDJtX2FjY2Vzc190IHdoaWNo
IGNhbid0IGNvbWUgb3V0IG9mIHRoZQo+ID4gPj4gUFRFIGp1c3QgeWV0KSwgSSBzZWUKPiA+ID4+
Cj4gPiA+PiAgICAgaWYgKCBpc19lcHRlX3ZhbGlkKGVwdF9lbnRyeSkgKQo+ID4gPj4gICAgIHsK
PiA+ID4+ICAgICAgICAgKnQgPSBwMm1fcmVjYWxjX3R5cGUocmVjYWxjIHx8IGVwdF9lbnRyeS0+
cmVjYWxjLAo+ID4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlcHRfZW50cnktPnNh
X3AybXQsIHAybSwgZ2ZuKTsKPiA+ID4+ICAgICAgICAgKmEgPSBlcHRfZW50cnktPmFjY2VzczsK
PiA+ID4+Cj4gPiA+PiBuZWFyIGl0cyBlbmQuIFdoaWNoIG1lYW5zIGV2ZW4gYSBob2xlIGNhbiBo
YXZlIGl0cyBhY2Nlc3MgZmllbGQKPiA+ID4+IHNldC4gU28gaXQncyBzdGlsbCBub3QgY2xlYXIg
dG8gbWUgZnJvbSB0aGUgZGVzY3JpcHRpb24gd2h5Cj4gPiA+PiBwMm0tPmRlZmF1bHRfYWNjZXNz
IGlzIHVuaWZvcm1seSB0aGUgdmFsdWUgdG8gdXNlLiBXb3VsZG4ndCB5b3UKPiA+ID4+IHJhdGhl
ciB3YW50IHRvIG92ZXJyaWRlIHRoZSBvcmlnaW5hbCB2YWx1ZSBvbmx5IGlmIGl0J3MKPiA+ID4+
IHAybV9hY2Nlc3NfbiB0b2dldGhlciB3aXRoIHAybV9pbnZhbGlkIG9yIHAybV9tbWlvX2RtIChi
dXQgbm90Cj4gPiA+PiBwYWdlZC1vdXQgcGFnZXMpPwo+ID4gPgo+ID4gPiBBdCB0aGlzIHBvaW50
IEkgd291bGQganVzdCByYXRoZXIgc3RhdGUgdGhhdCBhZGRfdG9fcGh5c21hcCBvbmx5IHdvcmtz
Cj4gPiA+IG9uIGFjdHVhbCBob2xlcywgbm90IHdpdGggcGFnZWQtb3V0IHBhZ2VzLiBJbiBmYWN0
LCBJIHdvdWxkIGxpa2UgdG8KPiA+ID4gc2VlIG1lbV9wYWdpbmcgYmVpbmcgZHJvcHBlZCBmcm9t
IHRoZSBjb2RlYmFzZSBlbnRpcmVseSBzaW5jZSBpdCdzCj4gPiA+IGJlZW4gYWJhbmRvbmVkIGZv
ciB5ZWFycyBhbmQgbm9vbmUgZXhwcmVzc2luZyBhbnkgaW50ZXJlc3QgaW4ga2VlcGluZwo+ID4g
PiBpdC4gSW4gdGhlIGludGVyaW0gSSB3b3VsZCByYXRoZXIgbm90IHNwZW5kIHVubmVjZXNzYXJ5
IGN5Y2xlcyBvbgo+ID4gPiBzcGVjdWxhdGluZyBhYm91dCBwb3RlbnRpYWwgY29ybmVyLWNhc2Vz
IG9mIG1lbV9wYWdpbmcgd2hlbiBub29uZQo+ID4gPiBhY3R1YWxseSB1c2VzIGl0Lgo+ID4gPgo+
ID4gPj4gT2YgY291cnNlIHRoZW4gdGhlIHF1ZXN0aW9uIGlzIHdoZXRoZXIgdGhlcmUKPiA+ID4+
IHdvdWxkbid0IGJlIGFuIGFtYmlndWl0eSB3aXRoIHAybV9hY2Nlc3NfbiBoYXZpbmcgZ290IHNl
dAo+ID4gPj4gZXhwbGljaXRseSBvbiB0aGUgcGFnZS4gQnV0IG1heWJlIHRoaXMgaXMgaW1wb3Nz
aWJsZSBmb3IKPiA+ID4+IHAybV9pbnZhbGlkIC8gcDJtX21taW9fZG0/Cj4gPiA+Cj4gPiA+IEFz
IGZhciBhcyBtZW1fYWNjZXNzIHBlcm1pc3Npb25zIGdvLCBJIGRvbid0IGtub3cgb2YgYW55IHVz
ZWNhc2UgdGhhdAo+ID4gPiB3b3VsZCBzZXQgbWVtX2FjY2VzcyBwZXJtaXNzaW9uIG9uIGEgaG9s
ZSBldmVuIGlmIGJ5IGxvb2tzIG9mIGl0IGl0IGlzCj4gPiA+IHRlY2huaWNhbGx5IHBvc3NpYmxl
LiBBdCB0aGlzIHBvaW50IEkgd291bGQgcmF0aGVyIGp1c3QgcHV0IHRoaXMKPiA+ID4gY29ybmVy
LWNhc2UncyBkZXNjcmlwdGlvbiBpbiBhIGNvbW1lbnQuCj4gPgo+ID4gSSB0aGluayBJIHdvdWxk
IGFjayBhIHJldmlzZWQgcGF0Y2ggaGF2aW5nIHRoaXMgcHJvcGVybHkgZXhwbGFpbmVkLgo+Cj4g
VGhhdCdzIGZpbmUsIEknbGwgYWRkIHNvbWUgY29tbWVudHMgdG8gdGhpcyBlZmZlY3QgYW5kIHJl
d29yZCB0aGUKPiBjb21taXQgbWVzc2FnZS4KPgoKQWN0dWFsbHksIGxvb2tpbmcgYXQgdGhlIGlt
cGxlbWVudGF0aW9uIG9mIHAybV9zZXRfbWVtX2FjY2VzcyBpdCdzIG5vdApjbGVhciB0byBtZSB3
aGV0aGVyIHdlIGNhbiBldmVuIGhhdmUgYSBob2xlIHdpdGggYSBtZW1fYWNjZXNzCnBlcm1pc3Np
b24gc2V0LiBDYW4geW91IGhhdmUgYSAiaG9sZSIgdHlwZSB3aXRoIGEgdmFsaWQgZ2ZuPyBJZiBu
b3QsCnRoaXMgaXMgYSBub24taXNzdWUgc2luY2UgcDJtX3NldF9tZW1fYWNjZXNzIG9ubHkgc2V0
cyBtZW1fYWNjZXNzCnBlcm1pc3Npb25zIHRoYXQgcGFzcyAhZ2ZuX2VxKGdmbiwgSU5WQUxJRF9H
Rk4pLgoKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
