Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BAC144675
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 22:31:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iu150-0008Pe-S8; Tue, 21 Jan 2020 21:28:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=toVe=3K=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1iu14y-0008PQ-PB
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 21:28:56 +0000
X-Inumbo-ID: 0765f56c-3c95-11ea-9fd7-bc764e2007e4
Received: from mail-io1-xd44.google.com (unknown [2607:f8b0:4864:20::d44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0765f56c-3c95-11ea-9fd7-bc764e2007e4;
 Tue, 21 Jan 2020 21:28:56 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id x1so4403042iop.7
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2020 13:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=rXWKJN1Uol519UrUUd6Ni4JWDuJLOdBOh1BuKgCBtHA=;
 b=SCxLlgugysTpdBL3SMXo89wGen+Kg6O1OOoGLpUs12hBqBVLRTQ+icisurHpxR26m6
 xtOC3J9A3zNw6DPqZLy0kywEYYBEwWSBI4Qeow70RMZ6IXXkN4C0anDXxZniGrFFfilb
 hR9xpS/+MlzY4KPff09CWRtZQ6RQ7eWMTt4xeaKg076s3v0z+70tIE02yjKdukduxbFn
 jsIWwuNXu9MpOAehGFLOeytteU9dasI4sBM6dPzcM/QYn4oOVOwbXSaOhTdgqwEnF3Oi
 Pg7+9aePLE0143ew9RcpWkP1Ahr94LrRhM/lmV2MspdKRCvmjaFHvmV/pGKPGflIMOih
 x1Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=rXWKJN1Uol519UrUUd6Ni4JWDuJLOdBOh1BuKgCBtHA=;
 b=q0yuOlMkJLA9gcaY5JOexZca2o5XVsrz2ki3Pll9osiuWHEKoBjnFtdxbdk8yhlICY
 QTVS2DdrT6Va9HrDXflDMCry15FhJh0lPnkbqlsFh4+CaUvB9rujFFwX+eUWRQzb5bC9
 izFCptPWB4qgpakgGaELmqPC4r15vAAVAvGZWaAN/fpRYgWEb0kRNw5qmoflponAKNvf
 TvRBqyN3m7LwRUZEXKC7foJKT8JQwf+X+k3apcv4dPfUd0ES3aULoNa77EUjwa/+gPQt
 TTpvjQGkZzYVSYDIlTUSUauJM8MwDI1lhcf28s1KLiFCEzLVBaT0MoUC+D2RgDamI3OO
 psLA==
X-Gm-Message-State: APjAAAVPyKpzS6w9GeC8uRcEk4n3GdfIowxuP/YHvATkgiwj+TD/1Lan
 Vy51GKgyYujFSUQP0Y1qflY=
X-Google-Smtp-Source: APXvYqzQziDhPe+/vi2wxsFF/Qn625M9QZtBl9YgTWYxifqrRmTt7b28YwAkB53AZFtYVNqEbFanZA==
X-Received: by 2002:a02:864b:: with SMTP id e69mr4754849jai.83.1579642135679; 
 Tue, 21 Jan 2020 13:28:55 -0800 (PST)
Received: from [100.64.72.109] ([173.245.215.240])
 by smtp.gmail.com with ESMTPSA id w15sm8780454iol.86.2020.01.21.13.28.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2020 13:28:55 -0800 (PST)
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Tue, 21 Jan 2020 16:28:54 -0500
Message-Id: <33984318-FCDC-4B2A-843C-A90D663F647D@gmail.com>
References: <20200121205642.GN1314@mail-itl>
In-Reply-To: <20200121205642.GN1314@mail-itl>
To: =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, 
 Lars Kurth <lars.kurth@citrix.com>, xen-devel@lists.xenproject.org
X-Mailer: iPad Mail (17C54)
Subject: Re: [Xen-devel] [PATCH v4 13/16] Regenerate autotools files
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
Cc: Ian Jackson <ian.jackson@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>,
 Wei Liu <wl@xen.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gSmFuIDIxLCAyMDIwLCBhdCAxNTo1OCwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIDxt
YXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPiB3cm90ZToKPiAKPiDvu79PbiBXZWQsIEph
biAxNSwgMjAyMCBhdCAwNDo1NzoyOVBNIC0wNTAwLCBSaWNoIFBlcnNhdWQgd3JvdGU6Cj4+Pj4g
T24gSmFuIDE0LCAyMDIwLCBhdCAyMTo0MiwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIDxt
YXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPiB3cm90ZToKPj4+IO+7v1NpbmNlIHdlIGhh
dmUgdGhvc2UgZ2VuZXJhdGVkIGZpbGVzIGNvbW1pdHRlZCB0byB0aGUgcmVwbyAod2h5PyEpLAo+
Pj4gdXBkYXRlIHRoZW0gYWZ0ZXIgY2hhbmdpbmcgY29uZmlndXJlLmFjLgo+PiAKPj4gSXMgdGhl
cmUgYW55IHJlYXNvbiBub3QgdG8gcmVtb3ZlIHRoZSBnZW5lcmF0ZWQgY29uZmlndXJlIGZpbGVz
PyAgQSBkZXZlbG9wZXIgdXNpbmcgZ2VuZXJhdGVkIGZpbGVzIG9uIHN5c3RlbSBCIHdvdWxkIGJl
IGluY29ycG9yYXRpbmcgY29uZmlndXJhdGlvbiBhc3N1bXB0aW9ucyBmcm9tIHN5c3RlbSBBIHdo
ZXJlIHRoZSBjb25maWd1cmUgc2NyaXB0IHdhcyBnZW5lcmF0ZWQuICBJZiB3ZSBhcmUgZ29pbmcg
dG8gc2hpcCBjb25maWd1cmUgc2NyaXB0cywgZG8gd2UgbmVlZCB0byBkb2N1bWVudCBhICJzeXN0
ZW0gQSIgcmVmZXJlbmNlIGRpc3Ryby9lbnZpcm9ubWVudCB3aGVyZSBhbGwgY29uZmlndXJlIHNj
cmlwdHMgZnJvbSBYZW4gd2lsbCBiZSBnZW5lcmF0ZWQ/Cj4+IAo+PiAKPj4gT3RoZXIgbm90ZXM6
Cj4+IAo+PiAxLiAgRGViaWFuIGF1dG9yZWNvbmYgd29ya3MgaW4gdGhlIFhlbiByb290IGRpcmVj
dG9yeSwgYnV0IHRoZSBkZWZhdWx0IE9wZW5FbWJlZGRlZCBhdXRvcmVjb25mIHVzZXMgR251IGxp
YnRvb2xpemUgYW5kIGZhaWxzIGJlY2F1c2Ugc29tZSBYZW4gYnVpbGQgc3ViZGlyZWN0b3JpZXMg
ZG9uJ3QgaGF2ZSBjb25maWd1cmUuYWMvLmluLiAgIAo+PiAKPj4gMi4gIElmIE9wZW5FbWJlZGRl
ZCBhdXRvcmVjb25mIGlzIHJ1biBvbmx5IGluIHRoZSB0b29scyBkaXJlY3RvcnkgKHdoZXJlIGl0
IHdvcmtzIGFuZCBnZW5lcmF0ZXMgYSBuZXcgdG9vbHMgY29uZmlndXJlKSwgdGhlbiByb290IGNv
bmZpZ3VyZSAoZ2VuZXJhdGVkIGZyb20gb2xkZXIgY29uZmlndXJlLmFjKSB3aWxsIHNpbGVudGx5
IGlnbm9yZSB0aGUgbmV3ZXIgdG9vbHMgY29uZmlndXJlIGFuZCB3cml0ZSBjb25maWcuaCBfd2l0
aG91dF8gdG9vbHMtc3BlY2lmaWMgY29uZmlnLCBzdWNoIGFzIHRoZSB2Y2hhbiBRTVAgcHJveHku
Cj4+IAo+PiAzLiBJZiBhdXRvcmVjb25mIHJ1bnMgc3VjY2Vzc2Z1bGx5IGluIHRoZSByb290IGRp
cmVjdG9yeSwgdGhlbiB0b29scy1zcGVjaWZpYyBjb25maWd1cmUgaXMgY29ycmVjdGx5IGdlbmVy
YXRlZCBhbmQgZXZlcnl0aGluZyB3b3JrcyBhcyBleHBlY3RlZC4KPj4gCj4+IFRoaXMgc2lsZW50
IGZhaWx1cmUgY291bGQgYmUgYXZvaWRlZCBieSBkZWxldGluZyB0aGUgZ2VuZXJhdGVkIGNvbmZp
Z3VyZSBzY3JpcHRzLiAgVGhlcmUgbWF5IGJlIG90aGVyIGZhaWx1cmUgbW9kZXMgZm9yIHVzaW5n
IFN5c3RlbSBBIGdlbmVyYXRlZCBzY3JpcHRzIG9uIGRvd25zdHJlYW0gYnVpbGQgc3lzdGVtIEIu
Cj4gCj4gWWVzLCBJIHRoaW5rIGdlbmVyYWwgZ29vZCBwcmFjdGljZXMgYXJlOgo+IDEuIGRvbid0
IGtlZXAgZ2VuZXJhdGVkIGF1dG90b29scyBmaWxlcyBpbiB2ZXJzaW9uIGNvbnRyb2wgc3lzdGVt
Cj4gMi4gZ2VuZXJhdGUgdGhlbSBpbnRvIHJlbGVhc2UgdGFyYmFsbHMKCkEgcG90ZW50aWFsIHRv
cGljIGZvciB0aGUgbmV4dCBYZW4gY29tbXVuaXR5IGNhbGw6ICBjYW4gd2UgZGVsZXRlIGdlbmVy
YXRlZCBhdXRvdG9vbHMgZmlsZXMgZnJvbSB0aGUgWGVuIHRyZWUgYW5kIHVwZGF0ZSB0aGUgcmVs
ZWFzZSBwcm9jZXNzIHRvIGdlbmVyYXRlK2J1bmRsZSB0aGVtIHdpdGggcmVsZWFzZSB0YXJiYWxs
cz8KClJpY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
