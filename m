Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B74D16BFE9
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 12:48:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6YdI-0006kW-CM; Tue, 25 Feb 2020 11:44:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xmvt=4N=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1j6YdG-0006kR-5O
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 11:44:10 +0000
X-Inumbo-ID: 223df58e-57c4-11ea-8cb6-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 223df58e-57c4-11ea-8cb6-bc764e2007e4;
 Tue, 25 Feb 2020 11:44:09 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id c7so15892517edu.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2020 03:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=U7YA4KIFmZWkd2I0OK/m8L1As6xwMqkK9IoRlzL5tc4=;
 b=CzrAnXlOmeJuukrGIhpLXuGKaDwX+djRllsCLkJxUuxbtaZuK/HOKYDvsLdKSJji1R
 a1ZdQkDbfNLtqyulcDKm3oLjDyP0kZ8voAlVy/e44rrCAgMr+c2MiIa59UnIdToIWOkC
 mgswuclmco3OqwHaTI7A5jhDeFZ0eop+747X5HkJjbrbUPCDPhEiX/gJFBNd+tORwQmV
 oU+Elu5FtOr2HSaCCU/gPhK/fnQCuqcxCoYq44EIbXcyq+CPPUpqkLxP/DNDdj2tWzLT
 ag1/4jTpFApHczwkTWXfcJH1sa5g4TXc6f8Eb8Dtj2un8jgNLa63x/PSO1okO4vsS04d
 fxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=U7YA4KIFmZWkd2I0OK/m8L1As6xwMqkK9IoRlzL5tc4=;
 b=Y1WEqBdvsVRb2Tit+aLUpfL0aZUItwUB2UIWSTEksTt+t/tUXmIp8bqV7uVzLhz9Z/
 OXhM80VJuLz9pAMPVxrl+SIvDEyZ5VEW6b732zMbUZ3yd64knL2faicKGRixMLg18W9Q
 UOjn8Keq2AHSIq+uuu7xaOja5wUv3NOVfWuGqqalO8IdMcwtpb9wbS35MToqOqqMqSbf
 my57olxoCqShzCoCPGzJAam3Rm/sLqrHOvw5AER8aRSwN7WK+Tih6/6a4C6kIwMyyCgm
 pGtlIkW3esmRu37BQAtozYlCBu3oJlxCIivtBKpMfcFPaHzfTiowz3gLPwrLpAs3/Jhz
 OLJg==
X-Gm-Message-State: APjAAAWFJXtH7WAm7AyTtEl0S8w5F6lZ0jzTIZ0yE1crEKLQzjbIs8Wp
 utlfi3YN6g2Q/KTb0XT6K/zmJ0sWRII=
X-Google-Smtp-Source: APXvYqwK5KJ+SJ8SPlLZx2I7+uvS+WLmXPd21HwDlIf7gMMC/A+Jy4PM2uHnx1MKxw/vQYiUuUX05A==
X-Received: by 2002:a17:906:8692:: with SMTP id
 g18mr52053673ejx.97.1582631048105; 
 Tue, 25 Feb 2020 03:44:08 -0800 (PST)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com.
 [209.85.128.41])
 by smtp.gmail.com with ESMTPSA id qw15sm944024ejb.92.2020.02.25.03.44.07
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2020 03:44:07 -0800 (PST)
Received: by mail-wm1-f41.google.com with SMTP id z12so2636438wmi.4
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2020 03:44:07 -0800 (PST)
X-Received: by 2002:a05:600c:2c06:: with SMTP id
 q6mr5158545wmg.154.1582631046906; 
 Tue, 25 Feb 2020 03:44:06 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582310142.git.tamas.lengyel@intel.com>
 <dff6668838b61fb7fe508588bef91d650cddfeb5.1582310142.git.tamas.lengyel@intel.com>
 <20200225100452.GA4679@Air-de-Roger>
In-Reply-To: <20200225100452.GA4679@Air-de-Roger>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 25 Feb 2020 04:43:30 -0700
X-Gmail-Original-Message-ID: <CABfawhn8ukW3KrcM-epW7QwSQjLupQdQ4HDDe31R=0URF8tjJg@mail.gmail.com>
Message-ID: <CABfawhn8ukW3KrcM-epW7QwSQjLupQdQ4HDDe31R=0URF8tjJg@mail.gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [Xen-devel] [PATCH v9 3/5] xen/mem_sharing: VM forking
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMjUsIDIwMjAgYXQgMzowNSBBTSBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIEZlYiAyMSwgMjAyMCBhdCAxMDo0OToy
MUFNIC0wODAwLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4gPiBWTSBmb3JraW5nIGlzIHRoZSBw
cm9jZXNzIG9mIGNyZWF0aW5nIGEgZG9tYWluIHdpdGggYW4gZW1wdHkgbWVtb3J5IHNwYWNlIGFu
ZCBhCj4gPiBwYXJlbnQgZG9tYWluIHNwZWNpZmllZCBmcm9tIHdoaWNoIHRvIHBvcHVsYXRlIHRo
ZSBtZW1vcnkgd2hlbiBuZWNlc3NhcnkuIEZvcgo+ID4gdGhlIG5ldyBkb21haW4gdG8gYmUgZnVu
Y3Rpb25hbCB0aGUgVk0gc3RhdGUgaXMgY29waWVkIG92ZXIgYXMgcGFydCBvZiB0aGUgZm9yawo+
ID4gb3BlcmF0aW9uIChIVk0gcGFyYW1zLCBoYXAgYWxsb2NhdGlvbiwgZXRjKS4KPgo+IEkndmUg
anVzdCByZWFsaXplZCB0aGF0IEknbSBub3Qgc3VyZSBob3cgYXJlIHNwZWNpYWwgcGFnZXMgaGFu
ZGxlZCwKPiB3aGF0IGhhcHBlbnMgdG8gdGhlIHhlbnN0b3JlLCBjb25zb2xlLCBzaGFyZWQgaW5m
byBwYWdlcywgb3IgdGhlCj4gdmNwdSBpbmZvIHBhZ2VzIGlmIHRoZSBwYXJlbnQgaGFzIHRob3Nl
IHJlZ2lzdGVyZWQ/CgpUaGUgZm9yayBzdGFydHMgb3V0IHdpdGggYW4gZW1wdHkgcDJtIHNvIHRo
ZXNlIHBhZ2VzIGFyZSBub3QgcHJlc2VudC4KSW4gY2FzZSB0aGUgZ3Vlc3QgaXRzZWxmIHRyaWVz
IHRvIGFjY2VzcyB0aGVzZSBwYWdlcywgb3IgYSBmb3JlaWduCm1hcHBpbmcgaXMgc2V0IHVwIGZv
ciB0aGVtLCB0aGVuIHRoYXQgd2lsbCB0cmlnZ2VyIGZvcmtfcGFnZSBmcm9tIHRoZQpwYXJlbnQu
IEkgc2VlIHRoYXQgaW4gdGhlIFZNIHJlc3RvcmUgcGF0aCBjbGVhcnMgdGhlIHBhZ2VzIGZvcgpI
Vk1fUEFSQU1fQ09OU09MRV9QRk4sIEhWTV9QQVJBTV9TVE9SRV9QRk4sIEhWTV9QQVJBTV9JT1JF
UV9QRk4gYW5kCkhWTV9QQVJBTV9CVUZJT1JFUV9QRk4gYnV0IGRvZXNuJ3QgcmVhbGx5IGV4cGxh
aW4gd2h5IHRoYXQgd291bGQgYmUKcmVxdWlyZWQuIEkgY2FuIGNlcnRhaW5seSBhZGQgdGhlIHNh
bWUgc3BlY2lhbCBoYW5kbGluZyBmb3IgdGhlc2UgSFZNCnBhcmFtcyB3aGVuIHRoZXkgZ2V0IGNv
cGllZCBkdXJpbmcgdGhlIGZvcmsgaHlwZXJjYWxsLgoKQXMgZm9yIHRoZSB2Y3B1IGluZm8gcGFn
ZSwgSSdtIG5vdCBzdXJlIHdoZXJlIHRoYXQgZ2V0cyBhbGxvY2F0ZWQgYW5kCm1hcHBlZCBub3Jt
YWxseS4gSSBkb24ndCBzZWUgYW55IHNwZWNpYWwgaGFuZGxpbmcgZm9yIHRoYXQgaW4gdGhlCnNh
dmUvcmVzdG9yZSBwYXRocy4gV2UgdXNlIHRoZSBzdGFuZGFyZCBjcmVhdGVkb21haW4gaHlwZXJj
YWxsIHRvCnNldHVwIHRoZSBWTSB0aGF0IHdpbGwgYmUgdXNlZCBmb3IgdGhlIGZvcmssIHRoZW4g
dXNlIHZjcHVfY3JlYXRlIHRvCmJyaW5nIHVwIHRoZSB2Q1BVcyBhbmQganVzdCBsb2FkIHRoZW0g
d2l0aCB0aGUgaHZtIGNvbnRleHQsIHByZXR0eQptdWNoIHRoZSBzYW1lIHdheSB0aGUgcmVzdG9y
ZSBwYXRoIHdvdWxkLgoKPiBBbHNvLCB3aGF0IGhhcHBlbnMgdG8gcGFnZXMgdGhhdCBhcmUgYmVp
bmcgdXNlZCBmb3IgRE1BIHdpdGggZW11bGF0ZWQKPiBkZXZpY2VzPyBXaWxsIFFFTVUgZm9yZWln
biBtYXBwaW5ncyBhbHNvIHRyaWdnZXIgdGhlIHBvcHVsYXRlIG9uCj4gZGVtYW5kIHJvdXRpbmUs
IHNvIHRoYXQgZXh0ZXJuYWwgZW11bGF0b3JzIGNhbiBhY2Nlc3MgdGhvc2U/CgpGb3JlaWduIG1h
cHBpbmdzIGRvIHRyaWdnZXIgdGhlIGZvcmtfcGFnZSByb3V0aW5lLCB5ZXMuIFNhbWUgZm9yCnNl
dHRpbmcgbWVtX2FjY2VzcyBwZXJtaXNzaW9ucy4KClRhbWFzCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
