Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B22101A6F
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2019 08:41:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWy6H-0005NU-6L; Tue, 19 Nov 2019 07:39:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=byRa=ZL=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1iWy6F-0005NP-5l
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2019 07:38:59 +0000
X-Inumbo-ID: a562dbc2-0a9f-11ea-b678-bc764e2007e4
Received: from mail-qk1-x742.google.com (unknown [2607:f8b0:4864:20::742])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a562dbc2-0a9f-11ea-b678-bc764e2007e4;
 Tue, 19 Nov 2019 07:38:58 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id e187so16966274qkf.4
 for <xen-devel@lists.xenproject.org>; Mon, 18 Nov 2019 23:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OYgHUb6y41+yk++oDhvdyI2OnSV07x6sO52C/Z0tWJM=;
 b=JzjpCRLQMQQD5K8inaOUVkhg9820f5AoDvE96JVrIgDp6JewnwLNbR2c9BvYPdsnkR
 UBMVa6+Ch4BzjKoHbho3gwWerzArrh9+5sZTSextl1UL7o45y2x6TlqB0Y5/qEZ/RbNc
 zV6HWUSfBFvrbmivfgrY5iacXQZnEbEtB818xoIjGRB4AdyXqIqg6EFT1zF1qVhg1cIU
 3l2awYtsGO+xUQYwMtltwwyxDS15UJ1J7lI8BARa74TPZAeLJb+JweZir9wR+lyIri1G
 gMV+eCr+WB4L5AFiLvb3O+7f4FbfSwNf+CKJNg3ESmUaG1ZW+nbF0eji8gYr/1JiM6nL
 FiYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OYgHUb6y41+yk++oDhvdyI2OnSV07x6sO52C/Z0tWJM=;
 b=FosxmU3XyyMcJQ36LptPhtC8nGWWC2+PCOkLm4f5WrkKnapQlpu6iXhLJ11+DTCMRq
 WNuQrDv8oFBdD4ClL0olh5dH/Zw3avr9B1NM9m6jQwIVuP2PYRl8GW6svq1MSkc8wu9B
 b3O/A95Dk+JPvo2drMVwoGJoWEv3eQWnqUXMVNRSZu+oYK47wWdRrKmCW0MvBd0cYrIY
 EafM1YeoTr0R//2aPF9jv7mhHkVIwv2cWawUyQUlutx2uRi8V3MZT2xwy3cR0w/Yy4Fz
 L741hooCHIZBWJtDqE+9hlNHfYRwnd8UxGNyMv5Ov/kaaVH2bn/HgDzNNYdXYrOH8Lny
 67TA==
X-Gm-Message-State: APjAAAUq2SP7X6ctd0x1K9EPjX8c/neTIarRUNHQ6UPqLw8Yg77sDqAm
 ILmYb1hl/DWo1SMv3xen7ee/IAd+uK/g5zU1Kec6Cw==
X-Google-Smtp-Source: APXvYqxGCi6BDHx2lVJMqMwXVXBHRHcD0b4b9qVkGgScIrE3aoFEH9sVAIRkdC6VkIHvoZVqs8B1LxaUqH61v/K3r8o=
X-Received: by 2002:ae9:ed89:: with SMTP id
 c131mr28392758qkg.267.1574149137544; 
 Mon, 18 Nov 2019 23:38:57 -0800 (PST)
MIME-Version: 1.0
References: <CF777A91-F2D3-4489-B1CB-FB08D55FCD01@gmail.com>
In-Reply-To: <CF777A91-F2D3-4489-B1CB-FB08D55FCD01@gmail.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Mon, 18 Nov 2019 23:38:46 -0800
Message-ID: <CAMmSBy80GBE0odJtYcQKBuL8RX9O=ixShKgOKMs++5zpgN=hEQ@mail.gmail.com>
To: Rich Persaud <persaur@gmail.com>
Subject: Re: [Xen-devel] Likely regression in efi=no-rs option
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBOb3YgMTgsIDIwMTkgYXQgMTE6MzEgUE0gUmljaCBQZXJzYXVkIDxwZXJzYXVyQGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBOb3YgMTksIDIwMTksIGF0IDAyOjEzLCBSb21hbiBTaGFw
b3NobmlrIDxyb21hbkB6ZWRlZGEuY29tPiB3cm90ZToKPiA+Cj4gPiDvu79PaywgdG8gc3VtIHVw
IC0tIHRoZXJlJ3MgZGVmaW5pdGVseSBhIHByZXR0eSBtYWpvciByZWdyZXNzaW9uIG9uIGFsbAo+
ID4gdGhpcyBoYXJkd2FyZSB3aXRoIFhlbiA0LjEzIFJDMjoKPiA+ICAgaHR0cHM6Ly93d3cuZGVs
bC5jb20vZW4tdXMvd29yay9zaG9wL2dhdGV3YXlzLWVtYmVkZGVkLWNvbXB1dGluZy9zYy9nYXRl
d2F5cy1lbWJlZGRlZC1wY3MvZWRnZS1nYXRld2F5P35jaz1idAo+ID4KPiA+IFdpdGhvdXQgZWZp
PW5vLXJzIG9wdGlvbiBYZW4gcGFuaWNzIG9uIGJvb3QgKHNvcnJ5IGZvciBhdHRhY2hpbmcgdGhl
Cj4gPiBzY3JlZW5zaG90IC0tIEkga25vdyBpdCBpcyBub3Qgc3VwZXIgaGVscGZ1bCBidXQgaXQg
Z2V0cyB0aGUgcG9pbnQKPiA+IGFjcm9zcykKPgo+IEkgZG9uJ3QgdGhpbmsgdGhlIHNjcmVlbnNo
b3QgY2FtZSB0aHJvdWdoLi4KClNvbWVob3cgSSBtYW5hZ2VkIHRvIGF0dGFjaCBpdCB0byBteSBy
ZXBseSB0byBNYXJlayA7LSkKICAgIGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2
ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0xMS9qcGdRNUFrdFp6dkFILmpwZwoKPiBCeSAid2l0aG91
dCBlZmk9bm8tcnMiIGRvIHlvdSBtZWFuICJlZmk9cnMiIG9yIG5vIGV4cGxpY2l0IHZhbHVlIGZv
ciBlZmkgb24gdGhlIFhlbiBjb21tYW5kIGxpbmU/CgpObyBleHBsaWNpdCB2YWx1ZS4gSXMgdGhl
cmUgYSBkaWZmZXJlbmNlPyBJIGFzc3VtZWQgZGVmYXVsdCAobm8KZXhwbGljaXQgdmFsdWUpIG1l
YW5zIGVmaT1ycyAtLSBhbSBJIG1pc3Rha2VuPwoKPiA+IFdpdGggZWZpPW5vLXJzIFhlbiBib290
cyBmaW5lLCBidXQgRG9tMCBjYW4ndCBjb21lIHVwLgo+Cj4gSXMgdGhhdCB3aXRoIFJDMiwgb3Ig
UkMyICsgdGhlIHJlY2VudCBwYXRjaCBmcm9tIE1hcmVrIGZvciBlZmk9bm8tcnM/CgpKdXN0IHZh
bmlsbGEgUkMyIC0tIGxpa2UgSSBzYWlkIC0tIEkgdGhpbmsgSSBoYXZlIHRyb3VibGUgYnVpbGRp
bmcgaGlzCndpdGggcGF0Y2ggKHNlZSBteSByZXBseSB0byBoaW0pLgoKPiAgQW55IHNlcmlhbCBs
b2dzIGZyb20gZG9tMCBib290PyAgQ2FuIHlvdSBzaGFyZSB0aGUgZG9tMCBrZXJuZWwgY29tbWFu
ZCBsaW5lIHdpdGggYWxsIG9wdGlvbnM/CgpXb3VsZCBiZSBoYXBweSB0byBzaGFyZSB0aGVtIG9u
Y2UgSSBnZXQgdG8gdGhlIGxhYiAoYW5kIGhvcGVmdWxseSBieQp0aGF0IHRpbWUgSSBjYW4gZmln
dXJlIG91dCBob3cgdG8gYnVpbGQgd2l0aCBNYXJlaydzIHBhdGNoKS4KClRoYW5rcywKUm9tYW4u
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
