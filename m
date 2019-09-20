Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA70B9024
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 15:02:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBITo-0000Js-Cm; Fri, 20 Sep 2019 12:57:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z5Xb=XP=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iBITm-0000Jm-T3
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 12:57:42 +0000
X-Inumbo-ID: 3b21f734-dba6-11e9-b299-bc764e2007e4
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b21f734-dba6-11e9-b299-bc764e2007e4;
 Fri, 20 Sep 2019 12:57:42 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id q64so6936264ljb.12
 for <xen-devel@lists.xenproject.org>; Fri, 20 Sep 2019 05:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=tnSROW4oGsgszX5kP8+Hls31ZRpHaRQ9zkuBdSoSUgk=;
 b=Ez3W6/7mVQKnKHflg7Zd8Cd1EtwUJHTJCB5U1evnBFNfB492kxv9OxeXZPyoiKKFdF
 qC1dFL+J8lLw5D44qb3wUL9buS8hmCy/XUWWkLlduWHQCck1F+YjVSPht08nshgUxkFV
 ohRjKY2CDfAYz0zC/wBMYZKtCOjWz8Ai7ssw5a6W5q8tlOxPhvcqPWBI2y/fClNa3M08
 DdKv4ioeJt7TVot+3XS0mq2CTHvvPOJ3gWzNqNVy0uPjZbBZQWlWj3K8Qk2DB7gtsXeL
 yA9PBniwgl4ttOV1v8LsgdPCkJYuPTgEpcjmAonUqEiVqdAH4r/ECaoD0GIeUBgjzAUM
 O+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=tnSROW4oGsgszX5kP8+Hls31ZRpHaRQ9zkuBdSoSUgk=;
 b=RX7iJx/FW2utYinQ4o5Dl3ZacId1wUtS4jfSAFXe9gWmuzh4mDzaP3y8ogJrFGScgO
 Ked/sRge6rdS2LVe/V+9Lh9TeFLbWHdIoZGEUkGMtZQMt5wZn7j70eFnwaf8fic/mgoD
 jBHvaVTW5IRmGRWDdXxPGKtlnzvgRS44Xq6WfXHYd/TvcwAd76XKdMdTpVgZYZNzBlVy
 hN568hZIVZeFqkT7A4mgrtsE6mqOwOKnGE/jVjmOlE9UwsA4FZVsNvtdR1N06eTDWQds
 m5JtcBPNFR9n1XwFZe+/Th0/HYQz2k8RDCCt0XVjpTLaPHPG1cxXgycDaqYRvt3RTDGc
 rkIQ==
X-Gm-Message-State: APjAAAWateFl8is4vYo8j7nW9iEl5HyI0GabZzUa+0MyNn/RDUenhKiW
 EqoIw3OOqA6vVesHaPbK4cM=
X-Google-Smtp-Source: APXvYqxR8KsG5hMkxw3rRRlsxP52us7uVIJF3BavkiiUHV/RFnURVDF1N5SbsIWatDnOBDd1lbN7pQ==
X-Received: by 2002:a2e:9241:: with SMTP id v1mr9263898ljg.148.1568984260900; 
 Fri, 20 Sep 2019 05:57:40 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id z8sm527421lfg.18.2019.09.20.05.57.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 20 Sep 2019 05:57:40 -0700 (PDT)
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1568388917-7287-1-git-send-email-olekstysh@gmail.com>
 <1568388917-7287-9-git-send-email-olekstysh@gmail.com>
 <TYAPR01MB4544A71B2ED0B7265F17FA45D8880@TYAPR01MB4544.jpnprd01.prod.outlook.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <381b22a0-0fe6-3a80-751c-4c2529422d3d@gmail.com>
Date: Fri, 20 Sep 2019 15:57:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <TYAPR01MB4544A71B2ED0B7265F17FA45D8880@TYAPR01MB4544.jpnprd01.prod.outlook.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V4 8/8] iommu/arm: Add Renesas IPMMU-VMSA
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

Ck9uIDIwLjA5LjE5IDAzOjI1LCBZb3NoaWhpcm8gU2hpbW9kYSB3cm90ZToKPiBIaSBPbGVrc2Fu
ZHItc2FuLAoKSGksIFNoaW1vZGEtc2FuCgoKPj4gRnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28s
IFNlbnQ6IFNhdHVyZGF5LCBTZXB0ZW1iZXIgMTQsIDIwMTkgMTI6MzUgQU0KPj4KPj4gRnJvbTog
T2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPgo+Pgo+
PiBUaGUgSVBNTVUtVk1TQSBpcyBWTVNBLWNvbXBhdGlibGUgSS9PIE1lbW9yeSBNYW5hZ2VtZW50
IFVuaXQgKElPTU1VKQo+PiB3aGljaCBwcm92aWRlcyBhZGRyZXNzIHRyYW5zbGF0aW9uIGFuZCBh
Y2Nlc3MgcHJvdGVjdGlvbiBmdW5jdGlvbmFsaXRpZXMKPj4gdG8gcHJvY2Vzc2luZyB1bml0cyBh
bmQgaW50ZXJjb25uZWN0IG5ldHdvcmtzLgo+Pgo+PiBQbGVhc2Ugbm90ZSwgY3VycmVudCBkcml2
ZXIgaXMgc3VwcG9zZWQgdG8gd29yayBvbmx5IHdpdGggbmV3ZXN0Cj4+IFItQ2FyIEdlbjMgU29D
cyByZXZpc2lvbnMgd2hpY2ggSVBNTVUgaGFyZHdhcmUgc3VwcG9ydHMgc3RhZ2UgMiB0cmFuc2xh
dGlvbgo+PiB0YWJsZSBmb3JtYXQgYW5kIGlzIGFibGUgdG8gdXNlIENQVSdzIFAyTSB0YWJsZSBh
cyBpcyBpZiBvbmUgaXMKPj4gMy1sZXZlbCBwYWdlIHRhYmxlICh1cCB0byA0MCBiaXQgSVBBKS4K
Pj4KPj4gVGhlIG1ham9yIGRpZmZlcmVuY2VzIGNvbXBhcmUgdG8gdGhlIExpbnV4IGRyaXZlciBh
cmU6Cj4+Cj4+IDEuIFN0YWdlIDEvU3RhZ2UgMiB0cmFuc2xhdGlvbi4gTGludXggZHJpdmVyIHN1
cHBvcnRzIFN0YWdlIDEKPj4gdHJhbnNsYXRpb24gb25seSAod2l0aCBTdGFnZSAxIHRyYW5zbGF0
aW9uIHRhYmxlIGZvcm1hdCkuIEl0IG1hbmFnZXMKPj4gcGFnZSB0YWJsZSBieSBpdHNlbGYuIEJ1
dCBYZW4gZHJpdmVyIHN1cHBvcnRzIFN0YWdlIDIgdHJhbnNsYXRpb24KPj4gKHdpdGggU3RhZ2Ug
MiB0cmFuc2xhdGlvbiB0YWJsZSBmb3JtYXQpIHRvIGJlIGFibGUgdG8gc2hhcmUgdGhlIFAyTQo+
PiB3aXRoIHRoZSBDUFUuIFN0YWdlIDEgdHJhbnNsYXRpb24gaXMgYWx3YXlzIGJ5cGFzc2VkIGlu
IFhlbiBkcml2ZXIuCj4+Cj4+IFNvLCBYZW4gZHJpdmVyIGlzIHN1cHBvc2VkIHRvIGJlIHVzZWQg
d2l0aCBuZXdlc3QgUi1DYXIgR2VuMyBTb0MgcmV2aXNpb25zCj4+IG9ubHkgKEgzIEVTMy4wLCBN
My1XKywgZXRjLikgd2hpY2ggSVBNTVUgSC9XIHN1cHBvcnRzIHN0YWdlIDIgdHJhbnNsYXRpb24K
Pj4gdGFibGUgZm9ybWF0Lgo+Pgo+PiAyLiBBQXJjaDY0IHN1cHBvcnQuIExpbnV4IGRyaXZlciB1
c2VzIFZNU0F2OC0zMiBtb2RlLCB3aGlsZSBYZW4gZHJpdmVyCj4+IGVuYWJsZXMgQXJtdjggVk1T
QXY4LTY0IG1vZGUgdG8gY292ZXIgdXAgdG8gNDAgYml0IGlucHV0IGFkZHJlc3MuCj4+Cj4+IDMu
IENvbnRleHQgYmFuayAoc2V0cyBvZiBwYWdlIHRhYmxlKSB1c2FnZS4gSW4gWGVuLCBlYWNoIGNv
bnRleHQgYmFuayBpcwo+PiBtYXBwZWQgdG8gb25lIFhlbiBkb21haW4uIFNvLCBhbGwgZGV2aWNl
cyBiZWluZyBwYXNzIHRocm91Z2hlZCB0byB0aGUKPj4gc2FtZSBYZW4gZG9tYWluIHNoYXJlIHRo
ZSBzYW1lIGNvbnRleHQgYmFuay4KPj4KPj4gNC4gSVBNTVUgZGV2aWNlIHRyYWNraW5nLiBJbiBY
ZW4sIGFsbCBJT01NVSBkZXZpY2VzIGFyZSBtYW5hZ2VkCj4+IGJ5IHNpbmdsZSBkcml2ZXIgaW5z
dGFuY2UuIFNvLCBkcml2ZXIgdXNlcyBnbG9iYWwgbGlzdCB0byBrZWVwIHRyYWNrCj4+IG9mIHJl
Z2lzdGVyZWQgSVBNTVUgZGV2aWNlcy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIFR5
c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPgo+PiBDQzogSnVsaWVuIEdy
YWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPj4gQ0M6IFlvc2hpaGlybyBTaGltb2RhIDx5b3No
aWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4KPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4g
SSBoYXZlIHJldmlld2VkIHRoaXMgcGF0Y2ggYWJvdXQgdGhlIElQTU1VIGhhcmR3YXJlIGJpdHMs
Cj4gc28sCj4KPiBSZXZpZXdlZC1ieTogWW9zaGloaXJvIFNoaW1vZGEgPHlvc2hpaGlyby5zaGlt
b2RhLnVoQHJlbmVzYXMuY29tPiBbZm9yIHRoZSBJUE1NVSBIL1cgYml0c10KClRoYW5rIHlvdS4K
CgouLi4KCkkgaGF2ZSBjaGVja2VkIG5ldyBkcml2ZXIgdmVyc2lvbiBvbiBSLUNhciBHZW4zIE0z
TiBTb0MgYW5kIGNhbiBjb25maXJtIAppdCB3b3Jrcy4KCi0tIApSZWdhcmRzLAoKT2xla3NhbmRy
IFR5c2hjaGVua28KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
