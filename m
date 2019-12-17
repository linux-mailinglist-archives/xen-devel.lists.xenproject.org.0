Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C2F1229F8
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 12:28:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihAzc-0002ki-PK; Tue, 17 Dec 2019 11:26:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VK9c=2H=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ihAzb-0002kd-BQ
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 11:26:19 +0000
X-Inumbo-ID: 0b177aaa-20c0-11ea-8ea3-12813bfff9fa
Received: from mail-wr1-f51.google.com (unknown [209.85.221.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0b177aaa-20c0-11ea-8ea3-12813bfff9fa;
 Tue, 17 Dec 2019 11:26:18 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id t2so10915550wrr.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2019 03:26:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pZkFtyC/RlLRmfxsOf48H6d5laXqEx2kZRjOp519I2o=;
 b=SvtoIfp/mjMWlAoApDzH3RiNiHg++mOTfhtRHMgCZY/gtiCwn3Lnq7wcwqJEemmcHe
 ZqIlTRg18yHJL7Z+psSdN6kSaH7dIP/8JU8CqFGN2lCQqrP4YKWKNn0o5S1FcF5HGYVJ
 /FEe2KT8d16UvGc0Am3xDPWEzaXiMdlvtzdOiagHhSeL449s4vt3ZRrhenvgANPIqIYQ
 +1ogF8CBtJtQ9oyI4TSNWLefI5Ahwle4WfV502FcK8CxIKkmhKp6rt9xRecD0b+toC8I
 ZGRYzwTbG/DfcfAuwWz/Tuh4tqpnGn7bn1HR3Jlmbi6cA3A6Dq4X6vjLiraMjhSQZ4+O
 F1qQ==
X-Gm-Message-State: APjAAAUBugPnF2xzthdamPTs3wrK2pVuQrrl+qeQA0yjsZxCFCqN7Jyz
 lo6LJqyg9p3ANY1mrOwC+R71cGIk
X-Google-Smtp-Source: APXvYqxohhOV1T7dqLmcxyp6AzCRyyb5wogLVdua3qeIsbVqf2RucB++d5BtJWXLXH/KO728uXPHXQ==
X-Received: by 2002:a5d:4847:: with SMTP id n7mr36581962wrs.30.1576581977430; 
 Tue, 17 Dec 2019 03:26:17 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-234.amazon.com.
 [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id j12sm25546935wrt.55.2019.12.17.03.26.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2019 03:26:16 -0800 (PST)
To: Stefano Stabellini <sstabellini@kernel.org>, andrei.cherechesu@nxp.com
References: <AM6PR04MB42465A5C5405FE85DA1F6FB0F9510@AM6PR04MB4246.eurprd04.prod.outlook.com>
 <766fc278-d729-ae7c-1abb-053f938eb8aa@xen.org>
 <alpine.DEB.2.21.1912161450550.13474@sstabellini-ThinkPad-T480s>
 <10975eca-f391-959c-9933-fc07df9ef603@xen.org>
 <alpine.DEB.2.21.1912161700140.13474@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <5e3544bf-f85d-9326-682d-3d571ddff23c@xen.org>
Date: Tue, 17 Dec 2019 11:26:16 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1912161700140.13474@sstabellini-ThinkPad-T480s>
Content-Language: en-GB
Subject: Re: [Xen-devel] Xen ARM Dom0less passthrough without IOMMU
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxNy8xMi8yMDE5IDAxOjE4LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24gTW9u
LCAxNiBEZWMgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBPbiAxNi8xMi8yMDE5IDIzOjA1
LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+PiBPbiBNb24sIDE2IERlYyAyMDE5LCBKdWxp
ZW4gR3JhbGwgd3JvdGU6Cj4+Pj4gT24gMTYvMTIvMjAxOSAxODowMiwgQW5kcmVpIENoZXJlY2hl
c3Ugd3JvdGU6Cj4+Pj4gQnV0IGV2ZW4gd2l0aCB0aGlzIHBhdGNoLCBSQU0gaW4gRG9tVSBpcyBu
b3QgZGlyZWN0IG1hcHBlZCAoaS5lIEd1ZXN0Cj4+Pj4gUGh5c2ljYWwKPj4+PiBBZGRyZXNzID09
IEhvc3QgUGh5c2ljYWwgQWRkcmVzcykuIFRoaXMgbWVhbnMgdGhhdCBETUEtY2FwYWJsZSBkZXZp
Y2UKPj4+PiB3b3VsZAo+Pj4+IG5vdCB3b3JrIHByb3Blcmx5IGluIERvbVUuCj4+Pj4KPj4+PiBX
ZSBjb3VsZCB0aGVvcml0aWNhbGx5IG1hcCBEb21VIGRpcmVjdCBtYXBwZWQsIGJ1dCB0aGlzIHdv
dWxkIGJyZWFrIHRoZQo+Pj4+IGlzb2xhdGlvbiBwcm92aWRlZCBieSB0aGUgaHlwZXJ2aXNvci4K
Pj4+Cj4+PiBZZXMsIGJlaW5nIGFibGUgdG8gbWFwIHRoZSBEb21VIG1lbW9yeSAxOjEgY2FuIGJl
IHByZXR0eSB1c2VmdWwgZm9yIHNvbWUKPj4+IHZlcnkgZW1iZWRkZWQgZG9tMGxlc3MgY29uZmln
dXJhdGlvbnMsIGluIGZhY3QgSSB3YXMgc3VycHJpc2VkIHRoYXQgYQo+Pj4gY291cGxlIG9mIFhp
bGlueCB1c2VycyBhc2tlZCBtZSBmb3IgdGhhdCByZWNlbnRseS4gVHlwaWNhbGx5LCB0aGUgdXNl
cnMKPj4+IGFyZSBhd2FyZSBvZiB0aGUgY29uc2VxdWVuY2VzIGJ1dCB0aGV5IHN0aWxsIGZpbmQg
dGhlbSBiZXR0ZXIgdGhhbiB0aGUKPj4+IGFsdGVybmF0aXZlIChpLmUuIHRoZSBsYWNrIG9mIGlz
b2xhdGlvbiBpcyBiYWQgYnV0IGlzIHRvbGVyYWJsZSBpbiB0aGVpcgo+Pj4gY29uZmlndXJhdGlv
bi4pCj4+IFRoaXMgZG9lcyBub3QgbWFrZSBtdWNoIHNlbnNlLi4uIFRoZSB3aG9sZSBwb2ludCBv
ZiBhIGh5cGVydmlzb3IgaXMgdG8gaXNvbGF0ZQo+PiBndWVzdCBiZXR3ZWVuIGVhY2ggb3RoZXIu
Li4gU28gaWYgeW91IGFyZSBoYXBweSB3aXRoIHRoZSBsYWNrIG9mIGlzb2xhdGlvbiwKPj4gdGhl
biB3aHkgYXJlIHlvdSB1c2luZyBhbiBoeXBlcnZpc29yIGF0IHRoZSBmaXJzdCBwbGFjZT8KPiAK
PiBUaGVyZSBhcmUgYSBudW1iZXIgb2YgcmVhc29ucywgYWx0aG91Z2ggdGhleSBhcmUgYWxsIHZh
cmlhdGlvbiBvZiB0aGUKPiBzYW1lIHRoZW1lLiBJbiBhbGwgdGhlc2UgY2FzZXMgdGhlIElPTU1V
IGNhbm5vdCBiZSB1c2VkIGZvciBvbmUgcmVhc29uCj4gb3IgdGhlIG90aGVyIChhIGRldmljZSBp
cyBub3QgYmVoaW5kIHRoZSBJT01NVSwgb3IgZHVlIHRvIGFuIGVycmF0YSwKPiBldGMuKQo+IAo+
IC0gbXVsdGlwbGUgYmFyZW1ldGFsIGFwcHMKPiBUaGUgdXNlciB3YW50cyB0byBydW4gdHdvIG9y
IG1vcmUgYmFyZW1ldGFsICh1bmlrZXJuZWwtbGlrZSkKPiBhcHBsaWNhdGlvbnMuIFRoZSB1c2Vy
IG93bnMgYm90aCBhcHBsaWNhdGlvbnMgYW5kIHNoZSBpcyBub3QgbXVjaAo+IGNvbmNlcm5lZCBh
Ym91dCBpc29sYXRpb24gKGFsdGhvdWdoIGl0IGlzIGFsd2F5cyBkZXNpcmFibGUgd2hlbgo+IHBv
c3NpYmxlLikKPiAKPiAtIG11bHRpcGxlIE9TZXMKPiBUaGlzIGlzIHNpbWlsYXIgdG8gdGhlIG9u
ZSBiZWZvcmUsIGhvd2V2ZXIsIGluc3RlYWQgb2YgbXVsdGlwbGUKPiBiYXJlbWV0YWwgYXBwcywg
d2UgYXJlIHRhbGtpbmcgYWJvdXQgbXVsdGlwbGUgZnVsbCBPU2VzLiBGb3IgaW5zdGFuY2UsCj4g
TGludXggYW5kIEFuZHJvaWQgb3IgTGludXggYW5kIFZ4V29ya3MuIEFnYWluLCB0aGV5IGFyZSBi
b3RoIG1haW50YWluZWQKPiBieSB0aGUgc2FtZSB1c2VyIChubyBtdWx0aS10ZW5hbmN5KSBzbyBp
c29sYXRpb24gaXMgZGVzaXJhYmxlIGJ1dCBpdCBpcwo+IG5vdCB0aGUgdG9wIGNvbmNlcm4uCj4g
Cj4gLSByZWFsLXRpbWUgLyBubyByZWFsLXRpbWUKPiBUaGUgdXNlciB3YW50cyB0byBydW4gYSBy
ZWFsLXRpbWUgT1Mgb3IgcmVhbC10aW1lIGJhcmVtZXRhbCBhcHAgYW5kIGEKPiBub24gcmVhbC10
aW1lIE9TLiBGb3IgaW5zdGFuY2UgYSB0aW55IGJhcmVtZXRhbCBhcHAgY29udHJvbGxpbmcgb25l
Cj4gc3BlY2lmaWMgZGV2aWNlIGFuZCBMaW51eC4gQWdhaW4sIHRoZSB1c2VyIGlzIHJlc3BvbnNp
YmxlIGZvciBib3RoCj4gc3lzdGVtcyBzbyBpc29sYXRpb24gaXMgbm90IGEgY29uY2Vybi4KPiAK
PiBJbiBhbGwgdGhlc2UgY2FzZXMgdGhlIHVzZXJzIGhhcyB0byBydW4gbXVsdGlwbGUgT1NlcyBv
ciBiYXJlbWV0YWwgYXBwcwo+IHNvIHNoZSBuZWVkcyBhIGh5cGVydmlzb3IuIEhvd2V2ZXIsIGl0
IGlzIHRvbGVyYWJsZSB0aGF0IHRoZSBhcHBzIGFyZQo+IG5vdCBhY3R1YWxseSBmdWxseSBpc29s
YXRlZCBmcm9tIGVhY2ggb3RoZXJzIGJlY2F1c2UgdGhleSBhcmUgYm90aAo+IGRldmVsb3BlZCBh
bmQgZGVwbG95ZWQgdG9nZXRoZXIgYnkgdGhlIHNhbWUgIm93bmVyIi4KCkkgZG9uJ3QgdGhpbmsg
Im1haW50YWluZWQgYW5kIGRlcGxveWVkIGJ5IHRoZSBzYW1lIG93bmVyIiBpcyBlbm91Z2ggdG8g
Cmp1c3RpZnkgaXQgaXMgc29tZXdoYXQgc2FmZSB0byB1c2UgaXQuIFlvdSBhbHNvIG5lZWQgdG8g
dHJ1c3QgeW91ciAKdXNlcnMuIEZvciBpbnN0YW5jZSwgaWYgeW91IGFsbG93IHlvdXIgdXNlcnMg
dG8gaW50ZXJhY3Qgd2l0aCB0aGUgT1MgCihlLmcgaW5zdGFsbGluZyBhcHAuLi4pIG9yIGhhdmUg
aW50ZXJuZXQsIHRoZW4geW91IHdpbGwgYmUgb25lIGRheSBvciAKYW5vdGhlciBwcm9uZSB0byBh
IHZ1bG5lcmFiaWxpdHkuCgpBIGdvb2QgZXhhbXBsZSB0aGF0IGNvbWUgaW50byBtaW5kIGlzIHRo
ZSBibGFja2hhdCB0YWxrIGluIDIwMTcgYWJvdXQgCkJsdWVQaWxsIChzZWUgWzFdKS4gVGhpcyBp
cyBvbmUgY2FzZSB3aGVyZSBpc29sYXRpb24gd2FzIGRpc21pc3NlZCwgeWV0IAppdCBiaXRlIHRo
ZW0gYWZ0ZXIuCgpUaGlzIHdhcyBvbmx5IG9uZSBPUy4gSSBsZXQgeW91IGltYWdpbmUgd2l0aCBh
IHN5c3RlbSBtdWx0aXBsZSBPU2VzLi4uCgpDaGVlcnMsCgpbMV0gCmh0dHBzOi8vd3d3LmJsYWNr
aGF0LmNvbS9kb2NzL3VzLTE3L3dlZG5lc2RheS91cy0xNy1CYXpoYW5pdWstQmx1ZVBpbGwtRm9y
LVlvdXItUGhvbmUucGRmCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
