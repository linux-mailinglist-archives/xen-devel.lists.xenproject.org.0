Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F80314CC1E
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 15:09:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwnzJ-0002Z2-LL; Wed, 29 Jan 2020 14:06:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WAbB=3S=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1iwnzI-0002Yx-28
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 14:06:36 +0000
X-Inumbo-ID: 8ef83e20-42a0-11ea-b211-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ef83e20-42a0-11ea-b211-bc764e2007e4;
 Wed, 29 Jan 2020 14:06:35 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y17so20326328wrh.5
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jan 2020 06:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5fxRb0a0/1m26YPRJTEDj6gmNTPBBJ5ChJZ4ZO1UjE4=;
 b=gAnvbpwxVmVX+JbUvmiyiCdA4Y8GQmFhoNqCUUGNQfUyYPs+Oxziw3KVzesEERVTAZ
 q5nrwIQ69F/XEHX8k0TRig5TxzBchxiVGHjz5jziPAeN0zfAg3KznQmPhrx17010th4d
 +TnBcGyxqp2lqS91Lom3PYIX1oUn5i3DpYXNpLwzfROucE+3Na3O5lIlz//TghQZ4ncN
 0G4ht0KG7f5KOBvsN0yGsPEm3sryJ76UYkIIX8oYWMXvlFqmd/eh1ztiGFWG3vu1pC9P
 AKqJHWieNSPqHrQikbieucFrSNiOVtiiDEV3yAwP0eEf5tsS72sUTfv7wfxdjvck7gdE
 kr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5fxRb0a0/1m26YPRJTEDj6gmNTPBBJ5ChJZ4ZO1UjE4=;
 b=ULj33PQBDjYGcpniXK+fLRodfXO8hJXPEV+nOaiDrRslxN8/WuLJlyruZiegHBhdyr
 qCcXCL3fX2CxCiWogc9EPImhxfRbCfEpKLHZy6J2QvT4l1xIH0k2fdT9iaOT79SQDZZu
 hKOR3FFV/dr0pYk3GLVMv4WISb3SfZepUmRJK7wD/966iwNMwJ0nQGuiEvZz7fhIA4q2
 pa4SY9RtFvaccjcbBNFLb9Doi9zqlwT/hz/95qs6uojJ2Jud8aWS+ZdOlASi858ARzVg
 P07CxduZE/Kgmj7vHGLVIgArj8imu3LrbHxRK7JyqUKuiyARwuf10Cw6hHSm5b3rnrM6
 xqHA==
X-Gm-Message-State: APjAAAXAfQ5mdqXaMFMPKVgptK+f2uLW5fdv34mMfs6pQ/LOAPPMVsiU
 otyZlPanuvKSBQS4Umw2hLTSt2xkqBQ/ULiVTDKoG3mP
X-Google-Smtp-Source: APXvYqyyVFasWwE60ieYws2garujdnGBR0JMyUWZ9iNApBKvHFaz9Qp10jpsU1xSLFKE743DzXyZuqIRr7yeEr5WHmw=
X-Received: by 2002:adf:e74a:: with SMTP id c10mr36209933wrn.386.1580306794446; 
 Wed, 29 Jan 2020 06:06:34 -0800 (PST)
MIME-Version: 1.0
References: <cover.1580148227.git.tamas.lengyel@intel.com>
 <ae2142231342bfc6fb9731303130a2c0fa381576.1580148227.git.tamas.lengyel@intel.com>
 <88661ce4-ef90-c525-586a-4668d4b0001e@suse.com>
 <CABfawhnZTSzh5X0Zctiikw7xhMEDdSGTnW2-eBVC_FsGN9-Ksg@mail.gmail.com>
 <1835b6f4-7361-8979-5a0e-27df5148873a@suse.com>
In-Reply-To: <1835b6f4-7361-8979-5a0e-27df5148873a@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Wed, 29 Jan 2020 07:05:57 -0700
Message-ID: <CABfawhkBh-EFjq_HDMaTbtHo=toDcM-C6NwEgCN4i7hZWNNeCA@mail.gmail.com>
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

T24gV2VkLCBKYW4gMjksIDIwMjAgYXQgNjoyNyBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMjguMDEuMjAyMCAxODowMiwgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+ID4gT24gVHVlLCBKYW4gMjgsIDIwMjAgYXQgOTo1NiBBTSBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gT24gMjcuMDEuMjAyMCAxOTowNiwgVGFt
YXMgSyBMZW5neWVsIHdyb3RlOgo+ID4+PiBXaGVuIHBsdWdnaW5nIGEgaG9sZSBpbiB0aGUgdGFy
Z2V0IHBoeXNtYXAgZG9uJ3QgdXNlIHRoZSBhY2Nlc3MgcGVybWlzc2lvbgo+ID4+PiByZXR1cm5l
ZCBieSBfX2dldF9nZm5fdHlwZV9hY2Nlc3MgYXMgaXQgY2FuIGJlIG5vbi1zZW5zaWNhbCwgbGVh
ZGluZyB0bwo+ID4+PiBzcHVyaW91cyB2bV9ldmVudHMgYmVpbmcgc2VudCBvdXQgZm9yIGFjY2Vz
cyB2aW9sYXRpb25zIGF0IHVuZXhwZWN0ZWQKPiA+Pj4gbG9jYXRpb25zLiBNYWtlIHVzZSBvZiBw
Mm0tPmRlZmF1bHRfYWNjZXNzIGluc3RlYWQuCj4gPj4KPiA+PiBBcyBiZWZvcmUsIHRvIG1lICJj
YW4gYmUgbm9uLXNlbnNpY2FsIiBpcyBpbnN1ZmZpY2llbnQgYXMgYSByZWFzb24KPiA+PiBoZXJl
LiBJZiBpdCBjYW4gYWxzbyBiZSBhICJnb29kIiB2YWx1ZSwgaXQgc3RpbGwgcmVtYWlucyB1bmNs
ZWFyCj4gPj4gd2h5IGluIHRoYXQgY2FzZSBwMm0tPmRlZmF1bHRfYWNjZXNzIGlzIG5ldmVydGhl
bGVzcyB0aGUgcmlnaHQKPiA+PiB2YWx1ZSB0byB1c2UuCj4gPgo+ID4gSSBoYXZlIGFscmVhZHkg
ZXhwbGFpbmVkIGluIHRoZSBwcmV2aW91cyB2ZXJzaW9uIG9mIHRoZSBwYXRjaCB3aHkgSQo+ID4g
c2FpZCAiY2FuIGJlIi4gRm9yZ290IHRvIGNoYW5nZSB0aGUgY29tbWl0IG1lc3NhZ2UgZnJvbSAi
Y2FuIGJlIiB0bwo+ID4gImlzIi4KPgo+IENoYW5naW5nIGp1c3QgdGhlIGNvbW1pdCBtZXNzYWdl
IHdvdWxkIGJlIGVhc3kgd2hpbGUgY29tbWl0dGluZy4KPiBCdXQgZXZlbiB3aXRoIHRoZSBjaGFu
Z2UgSSB3b3VsZCBhc2sgd2h5IHRoaXMgaXMuIExvb2tpbmcgYXQKPiBlcHRfZ2V0X2VudHJ5KCkg
KGFuZCBhc3N1bWluZyBwMm1fcHRfZ2V0X2VudHJ5KCkgd2lsbCB3b3JrCj4gc2ltaWxhcmx5LCBt
aW51cyB0aGUgcDJtX2FjY2Vzc190IHdoaWNoIGNhbid0IGNvbWUgb3V0IG9mIHRoZQo+IFBURSBq
dXN0IHlldCksIEkgc2VlCj4KPiAgICAgaWYgKCBpc19lcHRlX3ZhbGlkKGVwdF9lbnRyeSkgKQo+
ICAgICB7Cj4gICAgICAgICAqdCA9IHAybV9yZWNhbGNfdHlwZShyZWNhbGMgfHwgZXB0X2VudHJ5
LT5yZWNhbGMsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlcHRfZW50cnktPnNhX3Ay
bXQsIHAybSwgZ2ZuKTsKPiAgICAgICAgICphID0gZXB0X2VudHJ5LT5hY2Nlc3M7Cj4KPiBuZWFy
IGl0cyBlbmQuIFdoaWNoIG1lYW5zIGV2ZW4gYSBob2xlIGNhbiBoYXZlIGl0cyBhY2Nlc3MgZmll
bGQKPiBzZXQuIFNvIGl0J3Mgc3RpbGwgbm90IGNsZWFyIHRvIG1lIGZyb20gdGhlIGRlc2NyaXB0
aW9uIHdoeQo+IHAybS0+ZGVmYXVsdF9hY2Nlc3MgaXMgdW5pZm9ybWx5IHRoZSB2YWx1ZSB0byB1
c2UuIFdvdWxkbid0IHlvdQo+IHJhdGhlciB3YW50IHRvIG92ZXJyaWRlIHRoZSBvcmlnaW5hbCB2
YWx1ZSBvbmx5IGlmIGl0J3MKPiBwMm1fYWNjZXNzX24gdG9nZXRoZXIgd2l0aCBwMm1faW52YWxp
ZCBvciBwMm1fbW1pb19kbSAoYnV0IG5vdAo+IHBhZ2VkLW91dCBwYWdlcyk/CgpBdCB0aGlzIHBv
aW50IEkgd291bGQganVzdCByYXRoZXIgc3RhdGUgdGhhdCBhZGRfdG9fcGh5c21hcCBvbmx5IHdv
cmtzCm9uIGFjdHVhbCBob2xlcywgbm90IHdpdGggcGFnZWQtb3V0IHBhZ2VzLiBJbiBmYWN0LCBJ
IHdvdWxkIGxpa2UgdG8Kc2VlIG1lbV9wYWdpbmcgYmVpbmcgZHJvcHBlZCBmcm9tIHRoZSBjb2Rl
YmFzZSBlbnRpcmVseSBzaW5jZSBpdCdzCmJlZW4gYWJhbmRvbmVkIGZvciB5ZWFycyBhbmQgbm9v
bmUgZXhwcmVzc2luZyBhbnkgaW50ZXJlc3QgaW4ga2VlcGluZwppdC4gSW4gdGhlIGludGVyaW0g
SSB3b3VsZCByYXRoZXIgbm90IHNwZW5kIHVubmVjZXNzYXJ5IGN5Y2xlcyBvbgpzcGVjdWxhdGlu
ZyBhYm91dCBwb3RlbnRpYWwgY29ybmVyLWNhc2VzIG9mIG1lbV9wYWdpbmcgd2hlbiBub29uZQph
Y3R1YWxseSB1c2VzIGl0LgoKPiBPZiBjb3Vyc2UgdGhlbiB0aGUgcXVlc3Rpb24gaXMgd2hldGhl
ciB0aGVyZQo+IHdvdWxkbid0IGJlIGFuIGFtYmlndWl0eSB3aXRoIHAybV9hY2Nlc3NfbiBoYXZp
bmcgZ290IHNldAo+IGV4cGxpY2l0bHkgb24gdGhlIHBhZ2UuIEJ1dCBtYXliZSB0aGlzIGlzIGlt
cG9zc2libGUgZm9yCj4gcDJtX2ludmFsaWQgLyBwMm1fbW1pb19kbT8KCkFzIGZhciBhcyBtZW1f
YWNjZXNzIHBlcm1pc3Npb25zIGdvLCBJIGRvbid0IGtub3cgb2YgYW55IHVzZWNhc2UgdGhhdAp3
b3VsZCBzZXQgbWVtX2FjY2VzcyBwZXJtaXNzaW9uIG9uIGEgaG9sZSBldmVuIGlmIGJ5IGxvb2tz
IG9mIGl0IGl0IGlzCnRlY2huaWNhbGx5IHBvc3NpYmxlLiBBdCB0aGlzIHBvaW50IEkgd291bGQg
cmF0aGVyIGp1c3QgcHV0IHRoaXMKY29ybmVyLWNhc2UncyBkZXNjcmlwdGlvbiBpbiBhIGNvbW1l
bnQuCgpUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
