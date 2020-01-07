Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F03132B2C
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 17:35:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iornd-0006qf-1z; Tue, 07 Jan 2020 16:33:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Heq1=24=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iornb-0006qa-OB
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 16:33:43 +0000
X-Inumbo-ID: 7786e1ba-316b-11ea-ac58-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7786e1ba-316b-11ea-ac58-12813bfff9fa;
 Tue, 07 Jan 2020 16:33:42 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id w15so97695wru.4
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2020 08:33:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=I4Br8FmrvfDN9w8ZJYD5zLXH7Iyw7KmhR41tOLodyo0=;
 b=USWoHfjZq+j89TKg6GyapoSdMqILsuxYPwAfGndVeMed0amjF8d8GcUpX80ritO7qp
 kSOuxp/6z6NMKF5sddnELgR3cfQCVy4uDyIB0TVk6F28S7BKjUCZM6iA1etZkCLA1jUa
 8AK6xYh93dpByZ3LfTtQGPxjFkm/wIM2E6sl+QHPn7ZEsUvplwNmAuIZvOL3t6ITXti5
 JnHCLCZNX/fI1MAWt6JCv6Pa+kt3l3JOUtpeuisIw8l5hVwsMNHz2/shNqUDrNddD2WP
 AG5NEhwIp9wGHZpTApmkz4DScjrJug0N7Lk0Gf+BMcKN5t6f297mDRmwgVnUGkGrKpZM
 GF+w==
X-Gm-Message-State: APjAAAW3bdWdAZMHPm+XUwjfzENqPQ5nbBSat0wJgftMsnoZdtmU21B4
 VZqfgLN6Q0MAnkOPWGEMMM4=
X-Google-Smtp-Source: APXvYqwTwU+qM3Ky5hyM2/Z5II4PVaeQQSaWGw0KG1Zim/DWQQe5w7TkGx3GY5FSEQOoN+EadD0Alw==
X-Received: by 2002:adf:bc4f:: with SMTP id
 a15mr110297613wrh.160.1578414822131; 
 Tue, 07 Jan 2020 08:33:42 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id i16sm162246wmb.36.2020.01.07.08.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 08:33:41 -0800 (PST)
Date: Tue, 7 Jan 2020 16:33:39 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200107163339.rwqo6ybwzxgi77e4@debian>
References: <20200105164801.26278-1-liuwe@microsoft.com>
 <20200105164801.26278-4-liuwe@microsoft.com>
 <8437e48d-b22c-68c1-f589-fd945c011a3f@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8437e48d-b22c-68c1-f589-fd945c011a3f@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v3 3/5] x86/hyperv: provide percpu hypercall
 input page
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKYW4gMDYsIDIwMjAgYXQgMTE6Mjc6MThBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDUuMDEuMjAyMCAxNzo0NywgV2VpIExpdSB3cm90ZToKPiA+IEh5cGVyLVYncyBp
bnB1dCAvIG91dHB1dCBhcmd1bWVudCBtdXN0IGJlIDggYnl0ZXMgYWxpZ25lZCBhbiBub3QgY3Jv
c3MKPiA+IHBhZ2UgYm91bmRhcnkuIFRoZSBlYXNpZXN0IHdheSB0byBzYXRpc2Z5IHRob3NlIHJl
cXVpcmVtZW50cyBpcyB0byB1c2UKPiA+IHBlcmNwdSBwYWdlLgo+IAo+IEknbSBub3Qgc3VyZSAi
ZWFzaWVzdCIgaXMgcmVhbGx5IHRydWUgaGVyZS4gT3RoZXJzIGNvdWxkIGNvbnNpZGVyIGFkZGlu
Zwo+IF9fYWxpZ25lZCgpIGF0dHJpYnV0ZXMgYXMgZWFzeSBvciBldmVuIGVhc2llciAoYnkgYmVp
bmcgZXZlbiBtb3JlCj4gdHJhbnNwYXJlbnQgdG8gdXNlIHNpdGVzKS4gQ291bGQgd2Ugc2V0dGxl
IG9uICJPbmUgd2F5IC4uLiI/CgpEbyB5b3UgbWVhbiBzb21ldGhpbmcgbGlrZQoKICAgc3RydWN0
IGZvbyBfX2FsaWduZWQoOCk7CgogICBodl9kb19oeXBlcmNhbGwoT1AsIHZpcnRfdG9fbWFkZHIo
JmZvbyksIC4uLik7Cgo/CgpJIGRvbid0IHRoaW5rIHRoaXMgaXMgdHJhbnNwYXJlbnQgdG8gdXNl
ciBzaXRlcy4gUGx1cywgZm9vIGlzIG9uIHN0YWNrCndoaWNoIGlzIDEpIGRpZmZpY3VsdCB0byBn
ZXQgaXRzIG1hZGRyLCAyKSBtYXkgY3Jvc3MgcGFnZSBib3VuZGFyeS4KCklmIEkgbWlzdW5kZXJz
dG9vZCB3aGF0IHlvdSBtZWFudCwgcGxlYXNlIGdpdmUgbWUgYW4gZXhhbXBsZSBoZXJlLgoKPiAK
PiA+IEBAIC04MywxNCArODQsMzMgQEAgc3RhdGljIHZvaWQgX19pbml0IHNldHVwX2h5cGVyY2Fs
bF9wYWdlKHZvaWQpCj4gPiAgICAgIHdybXNybChIVl9YNjRfTVNSX0hZUEVSQ0FMTCwgaHlwZXJj
YWxsX21zci5hc191aW50NjQpOwo+ID4gIH0KPiA+ICAKPiA+ICtzdGF0aWMgdm9pZCBzZXR1cF9o
eXBlcmNhbGxfcGNwdV9hcmcodm9pZCkKPiA+ICt7Cj4gPiArICAgIHZvaWQgKm1hcHBpbmc7Cj4g
PiArCj4gPiArICAgIG1hcHBpbmcgPSBhbGxvY194ZW5oZWFwX3BhZ2UoKTsKPiA+ICsgICAgaWYg
KCAhbWFwcGluZyApCj4gPiArICAgICAgICBwYW5pYygiRmFpbGVkIHRvIGFsbG9jYXRlIGh5cGVy
Y2FsbCBpbnB1dCBwYWdlIGZvciAldVxuIiwKPiAKPiAiLi4uIGZvciBDUFUldVxuIiBwbGVhc2Uu
Cj4gCj4gPiArICAgICAgICAgICAgICBzbXBfcHJvY2Vzc29yX2lkKCkpOwo+ID4gKwo+ID4gKyAg
ICB0aGlzX2NwdShodl9wY3B1X2lucHV0X2FyZykgPSBtYXBwaW5nOwo+IAo+IFdoZW4gb2ZmbGlu
aW5nIGFuZCB0aGVuIHJlLW9ubGluaW5nIGEgQ1BVLCB0aGUgcHJpb3IgcGFnZSB3aWxsIGJlCj4g
bGVha2VkLgoKUmlnaHQuIFRoYW5rcyBmb3IgY2F0Y2hpbmcgdGhpcyBvbmUuCgo+IAo+ID4gLS0t
IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYuaAo+ID4gKysrIGIveGVuL2luY2x1
ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYuaAo+ID4gQEAgLTUxLDYgKzUxLDggQEAgc3RhdGljIGlu
bGluZSB1aW50NjRfdCBodl9zY2FsZV90c2ModWludDY0X3QgdHNjLCB1aW50NjRfdCBzY2FsZSwK
PiA+ICAKPiA+ICAjaWZkZWYgQ09ORklHX0hZUEVSVl9HVUVTVAo+ID4gIAo+ID4gKyNpbmNsdWRl
IDx4ZW4vcGVyY3B1Lmg+Cj4gPiArCj4gPiAgI2luY2x1ZGUgPGFzbS9ndWVzdC9oeXBlcnZpc29y
Lmg+Cj4gPiAgCj4gPiAgc3RydWN0IG1zX2h5cGVydl9pbmZvIHsKPiA+IEBAIC02Myw2ICs2NSw4
IEBAIHN0cnVjdCBtc19oeXBlcnZfaW5mbyB7Cj4gPiAgfTsKPiA+ICBleHRlcm4gc3RydWN0IG1z
X2h5cGVydl9pbmZvIG1zX2h5cGVydjsKPiA+ICAKPiA+ICtERUNMQVJFX1BFUl9DUFUodm9pZCAq
LCBodl9wY3B1X2lucHV0X2FyZyk7Cj4gCj4gV2lsbCB0aGlzIHJlYWxseSBiZSBuZWVkZWQgb3V0
c2lkZSBvZiB0aGUgZmlsZSB0aGF0IGRlZmluZXMgaXQ/Cj4gCgpUaGlzIGNhbiBsaXZlIGluIGEg
cHJpdmF0ZSBoZWFkZXIgZm9yIHRoZSB0aW1lIGJlaW5nLgoKPiBBbHNvLCB3aGlsZSBsb29raW5n
IGF0IHRoaXMgSSBub3RpY2UgdGhhdCAtIGRlc3BpdGUgbXkgZWFybGllcgo+IGNvbW1lbnQgd2hl
biBnaXZpbmcgdGhlIHJlc3BlY3RpdmUsIHNvcnQtb2YtY29uZGl0aW9uYWwgYWNrIC0KPiB0aGVy
ZSBhcmUgKHN0aWxsKSBtYW55IGFwcGFyZW50bHkgcG9pbnRsZXNzIF9fcGFja2VkIGF0dHJpYnV0
ZXMKPiBpbiBoeXBlcnYtdGxmcy5oLiBDYXJlIHRvIGNvbW1lbnQgb24gdGhpcz8KCkFnYWluLCB0
aGF0J3MgYSBzdHJhaWdodCBpbXBvcnQgZnJvbSBMaW51eC4gSSB0cmllZCBub3QgdG8gZGV2aWF0
ZSB0b28KbXVjaC4gQSBjb21taXQgaW4gTGludXggKGVjMDg0NDkxNzI3YjApIGNsYWltcyAiY29t
cGlsZXIgY2FuIGFkZAphbGlnbm1lbnQgcGFkZGluZyB0byBzdHJ1Y3R1cmVzIG9yIHJlb3JkZXIg
c3RydWN0IG1lbWJlcnMgZm9yCnJhbmRvbWl6YXRpb24gYW5kIG9wdGltaXphdGlvbiIuCgpJIGp1
c3QgY2hlY2tlZCBhbGwgdGhlIHBhY2tlZCBzdHJ1Y3R1cmVzLiBUaGV5IHNlZW0gdG8gaGF2ZSBh
bGwgdGhlCnJlcXVpcmVkIG1hbnVhbCBwYWRkaW5ncyBhbHJlYWR5LiBJIGNhbiBvbmx5IGFzc3Vt
ZSB0aGV5IHRyaWVkIHRvIGVycmVkCm9uIHRoZSBzYWZlIHNpZGUuCgpXZWkuCgo+IAo+IEphbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
