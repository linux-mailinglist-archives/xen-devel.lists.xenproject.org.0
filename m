Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E318DA178A
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 12:58:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3I6B-0008Sq-Hk; Thu, 29 Aug 2019 10:56:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jJ98=WZ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1i3I69-0008S4-QU
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 10:56:13 +0000
X-Inumbo-ID: 9d25e02e-ca4b-11e9-b95f-bc764e2007e4
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9d25e02e-ca4b-11e9-b95f-bc764e2007e4;
 Thu, 29 Aug 2019 10:56:12 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id v16so2118547lfg.11
 for <xen-devel@lists.xenproject.org>; Thu, 29 Aug 2019 03:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=iBHTnUJ/yCrxrDw+TQZVGV6E1ORabmcWjaI0CUzoU9Y=;
 b=SZRTiIDdM1pbz+jvje/4NjJ2gFUqLJkV0FF1dPV8T0u+6jwA7okMo3ulUvTsi0ElVg
 /oeLlBmLhoEffjuEacmqHJAyevl+5gMteDPPW2qZ00T7Y1xy537dJAwJQjLkbDtxprhZ
 4T3I/34mrdjNdRY+2+CVXSLNlMc8qYOtaW98y2qxEiBEi4XTc9lKRWDZ3AwTapc8j7SH
 UmHyHWv6bSdDTTA2Tbxek5NqAN321QsL9C6ECObDCtLX9mxo9UNxaN7nUbbQZw0VHPQJ
 EX65LqVJtcbF6qVEzr1yqqUnTu7gE5IJEycgFGE6+cETxtmaZiBhCyGhZnAAnA6cWb+6
 mRvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=iBHTnUJ/yCrxrDw+TQZVGV6E1ORabmcWjaI0CUzoU9Y=;
 b=aKBKEEoJzQdeIHE8GQRyA1KbVppmQiRw0KSp00INi83yCezUL+KUx0NWqAcVuEaYhu
 BnqROjYqa5t9WGmLb3Akjci6DkxaO0BPM/v5wlw9PwBWeQIhuIz8SUFiLMZxQIwENUpW
 XMR1Hj9Ex3dqh9C0ZEziQ0azjGpkaJVKt00o05+oGI+ttmHntaxTYUljJl7KkNEsfA5W
 a/AAuN325CafX8HgY/OV+gSVYE5zsRQKy7BeTuLwr/f4PLWsqY9cB6Hq9DxJib8z5S75
 HS39UG9+7XlZ7G/F7b10qb78XIIdJc5VP7KTWxmNw0Xvrro3h/thplMnVqNKOxts9+Lw
 c39A==
X-Gm-Message-State: APjAAAXOQDl9vszAO44KiwYijRkyMk162Pz6ID4iB3W5fw37n4BAmyY0
 2RYIVzTnNhr6HDBn7SfUl74=
X-Google-Smtp-Source: APXvYqxNFJTN0QQiYUBOLsv/4dmanL6k7Kdy1yuvhZXazvg+RH4hB6+ZQbbNlkwPc2t1tGpHU76W4g==
X-Received: by 2002:a19:ec16:: with SMTP id b22mr5759322lfa.1.1567076171429;
 Thu, 29 Aug 2019 03:56:11 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id u9sm297301lju.100.2019.08.29.03.56.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 29 Aug 2019 03:56:10 -0700 (PDT)
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1566324587-3442-1-git-send-email-olekstysh@gmail.com>
 <1566324587-3442-9-git-send-email-olekstysh@gmail.com>
 <TYAPR01MB4544A44A2BDFADD533AF6D1AD8A20@TYAPR01MB4544.jpnprd01.prod.outlook.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <1fef0ad1-3aaf-de88-262d-da0f5ae3f510@gmail.com>
Date: Thu, 29 Aug 2019 13:56:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <TYAPR01MB4544A44A2BDFADD533AF6D1AD8A20@TYAPR01MB4544.jpnprd01.prod.outlook.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V3 8/8] iommu/arm: Add Renesas IPMMU-VMSA
 support
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDI5LjA4LjE5IDExOjM3LCBZb3NoaWhpcm8gU2hpbW9kYSB3cm90ZToKPiBIaSBPbGVrc2Fu
ZHItc2FuLAoKSGkgU2hpbW9kYS1zYW4uCgoKPgo+PiBGcm9tOiBPbGVrc2FuZHIgVHlzaGNoZW5r
bywgU2VudDogV2VkbmVzZGF5LCBBdWd1c3QgMjEsIDIwMTkgMzoxMCBBTQo+Pgo+PiBGcm9tOiBP
bGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+Cj4+Cj4+
IFRoZSBJUE1NVS1WTVNBIGlzIFZNU0EtY29tcGF0aWJsZSBJL08gTWVtb3J5IE1hbmFnZW1lbnQg
VW5pdCAoSU9NTVUpCj4+IHdoaWNoIHByb3ZpZGVzIGFkZHJlc3MgdHJhbnNsYXRpb24gYW5kIGFj
Y2VzcyBwcm90ZWN0aW9uIGZ1bmN0aW9uYWxpdGllcwo+PiB0byBwcm9jZXNzaW5nIHVuaXRzIGFu
ZCBpbnRlcmNvbm5lY3QgbmV0d29ya3MuCj4+Cj4+IFBsZWFzZSBub3RlLCBjdXJyZW50IGRyaXZl
ciBpcyBzdXBwb3NlZCB0byB3b3JrIG9ubHkgd2l0aCBuZXdlc3QKPj4gR2VuMyBTb0NzIHJldmlz
aW9ucyB3aGljaCBJUE1NVSBoYXJkd2FyZSBzdXBwb3J0cyBzdGFnZSAyIHRyYW5zbGF0aW9uCj4g
VGhpcyBpcyBzdGlsbCAiR2VuMyIsIHNvIHRoYXQgcGxlYXNlIHJlcGxhY2UgaXQgd2l0aCAiUi1D
YXIgR2VuMyIuLi4KCldpbGwgZG8uCgoKPgo+PiB0YWJsZSBmb3JtYXQgYW5kIGlzIGFibGUgdG8g
dXNlIENQVSdzIFAyTSB0YWJsZSBhcyBpcyBpZiBvbmUgaXMKPj4gMy1sZXZlbCBwYWdlIHRhYmxl
ICh1cCB0byA0MCBiaXQgSVBBKS4KPj4KPj4gVGhlIG1ham9yIGRpZmZlcmVuY2VzIGNvbXBhcmUg
dG8gdGhlIExpbnV4IGRyaXZlciBhcmU6Cj4+Cj4+IDEuIFN0YWdlIDEvU3RhZ2UgMiB0cmFuc2xh
dGlvbi4gTGludXggZHJpdmVyIHN1cHBvcnRzIFN0YWdlIDEKPj4gdHJhbnNsYXRpb24gb25seSAo
d2l0aCBTdGFnZSAxIHRyYW5zbGF0aW9uIHRhYmxlIGZvcm1hdCkuIEl0IG1hbmFnZXMKPj4gcGFn
ZSB0YWJsZSBieSBpdHNlbGYuIEJ1dCBYZW4gZHJpdmVyIHN1cHBvcnRzIFN0YWdlIDIgdHJhbnNs
YXRpb24KPj4gKHdpdGggU3RhZ2UgMiB0cmFuc2xhdGlvbiB0YWJsZSBmb3JtYXQpIHRvIGJlIGFi
bGUgdG8gc2hhcmUgdGhlIFAyTQo+PiB3aXRoIHRoZSBDUFUuIFN0YWdlIDEgdHJhbnNsYXRpb24g
aXMgYWx3YXlzIGJ5cGFzc2VkIGluIFhlbiBkcml2ZXIuCj4+Cj4+IFNvLCBYZW4gZHJpdmVyIGlz
IHN1cHBvc2VkIHRvIGJlIHVzZWQgd2l0aCBuZXdlc3QgUi1DYXIgR2VuMyBTb0MgcmV2aXNpb25z
Cj4+IG9ubHkgKEgzIEVTMy4wLCBNMy1XKywgZXRjLikgd2hpY2ggSVBNTVUgSC9XIHN1cHBvcnRz
IHN0YWdlIDIgdHJhbnNsYXRpb24KPj4gdGFibGUgZm9ybWF0Lgo+Pgo+PiAyLiBBQXJjaDY0IHN1
cHBvcnQuIExpbnV4IGRyaXZlciB1c2VzIFZNU0F2OC0zMiBtb2RlLCB3aGlsZSBYZW4gZHJpdmVy
Cj4+IGVuYWJsZXMgQXJtdjggVk1TQXY4LTY0IG1vZGUgdG8gY292ZXIgdXAgdG8gNDAgYml0IGlu
cHV0IGFkZHJlc3MuCj4+Cj4+IDMuIENvbnRleHQgYmFuayAoc2V0cyBvZiBwYWdlIHRhYmxlKSB1
c2FnZS4gSW4gWGVuLCBlYWNoIGNvbnRleHQgYmFuayBpcwo+PiBtYXBwZWQgdG8gb25lIFhlbiBk
b21haW4uIFNvLCBhbGwgZGV2aWNlcyBiZWluZyBwYXNzIHRocm91Z2hlZCB0byB0aGUKPj4gc2Ft
ZSBYZW4gZG9tYWluIHNoYXJlIHRoZSBzYW1lIGNvbnRleHQgYmFuay4KPj4KPj4gNC4gSVBNTVUg
ZGV2aWNlIHRyYWNraW5nLiBJbiBYZW4sIGFsbCBJT01NVSBkZXZpY2VzIGFyZSBtYW5hZ2VkCj4+
IGJ5IHNpbmdsZSBkcml2ZXIgaW5zdGFuY2UuIFNvLCBkcml2ZXIgdXNlcyBnbG9iYWwgbGlzdCB0
byBrZWVwIHRyYWNrCj4+IG9mIHJlZ2lzdGVyZWQgSVBNTVUgZGV2aWNlcy4KPj4KPj4gU2lnbmVk
LW9mZi1ieTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0u
Y29tPgo+PiBDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPj4gQ0M6IFlv
c2hpaGlybyBTaGltb2RhIDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4KPiBBYm91
dCB0aGlzIGhhcmR3YXJlIGhhbmRsaW5nLCB0aGlzIHBhdGNoIHNlZW1zIGdvb2QgdG8gbWUuIEJ1
dCwgc2luY2UKPiBJJ20gbm90IGZhbWlsaWFyIGFib3V0IFhlbiBwYXNzdGhyb3VnaCBmcmFtZXdv
cmssIEkgdGhpbmsgSSBjYW5ub3QKPiBhZGQgbXkgUmV2aWV3ZWQtYnkgdGFnIGludG8gdGhpcyBw
YXRjaC4gV2hhdCBkbyB5b3UgdGhpbms/CgpJIGFtIG5vdCBjb21wbGV0ZWx5IHN1cmUgcmVnYXJk
aW5nIHRoYXQsIGJ1dCBJIGhhdmUgc2VlbiBjYXNlcyB3aGVuIHRoZSAKcGVvcGxlIGdpdmUgdGhl
aXIgUi1iIG5vdCBmb3IgdGhlIGVudGlyZSBwYXRjaCwgYnV0IGZvciBhIHBhcnQgb2YgaXQuCgpF
c3BlY2lhbGx5LCB3aGVuIHBhdGNoIHRvdWNoZXMgbWFueSBzdWItc3lzdGVtcy9hcmNocy4gV291
bGQgeW91IG1pbmQgaWYgCkkgc3BlY2lmeSB3aGF0IHlvdXIgUi1iIGNvdmVycz8gLT4gW2ZvciB0
aGUgSVBNTVUgSC9XIGJpdHNdCgoKVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3LgoKPgo+IEJlc3Qg
cmVnYXJkcywKPiBZb3NoaWhpcm8gU2hpbW9kYQo+Ci0tIApSZWdhcmRzLAoKT2xla3NhbmRyIFR5
c2hjaGVua28KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
