Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 097F81181BF
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 09:08:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieaXn-0002SV-Vn; Tue, 10 Dec 2019 08:06:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DUzY=2A=gmail.com=sj38.park@srs-us1.protection.inumbo.net>)
 id 1ieaXm-0002S7-AK
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 08:06:54 +0000
X-Inumbo-ID: 02644d1c-1b24-11ea-a914-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 02644d1c-1b24-11ea-a914-bc764e2007e4;
 Tue, 10 Dec 2019 08:06:46 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id y17so18893460wrh.5
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2019 00:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=7GoRrqMVjX62ovnIfLayQu397lbmVjmI5+RiUUbRiGQ=;
 b=GdRAAQdC6QZDUZIYk/X86ZA51nIRrjCvroKLQhl+vQNMWYaGDanM7DGEKpwca3zPHu
 ppBTghPnROkT+2cwPnoApk+kexmUcttpTEOHDGjP9sFmG/0QCNJJH/HUIa3O6LUDD/n2
 ITNGCFFe/LqwmGna6pPDWwfbm0NBHLkEkyStYSyeSuxKAbiVKwcijmSl/keWRtj4VY76
 OmK4G2aOsbj81v5cZ52R9eLEM8Yr1vCbPCH3ZWcpi1Qdaqa6fZrLXufUfnYU5ygurCSm
 607C4uLL5VEa5N8yyRUBLfDUR8Xbm8eqKjohmnY8PcNmd3MpRep9+B7y8ohOHqmeINyt
 BCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=7GoRrqMVjX62ovnIfLayQu397lbmVjmI5+RiUUbRiGQ=;
 b=t3/iFZjikHhxTTmk8jGBDaw3XC8ARpXQKzNrqlDlu0Gr5UZbk6VYJlYVlpNmT21qS1
 WQhFnpCC9QFtkD0cSkAMR/symUfdpxobc390Hbk3YkYum23mdk20hpszN6BcOqvslgyy
 Mbi19HWgaM3QfYMNBlRO6JNz1wI6uH23QDeqQdqFU7DqHY880ufAMwb/u0wHQYVwbSN1
 oqZ6jtv199SbygObhwrLUp+TJ2K5tyZvgYhTGjbEsa4U7KQHzC3b+F4WDAilVEQUkmxy
 5eR2IleZIeYbu9UsFvPpaYmAvWgFk8/vKq0Pu0Yq53qZJhAZmQ5tjEt4xoggk1uP7u2Z
 dedA==
X-Gm-Message-State: APjAAAUl5eUDWBS1arPCOVbDFlyOF2aUedMNT88b44Wxs2rDxJuf5Aj1
 1AwecB7E30aP2+XNWrQs7jU=
X-Google-Smtp-Source: APXvYqzH9cYr9GL5jOU9NlCTPtbT6Sylija6v00hFlZeRgKAwbbYW8L0T8jLsHZY4duoYruQpEfytA==
X-Received: by 2002:adf:f504:: with SMTP id q4mr1468459wro.299.1575965205566; 
 Tue, 10 Dec 2019 00:06:45 -0800 (PST)
Received: from localhost.localdomain (x2f7fae7.dyn.telefonica.de.
 [2.247.250.231])
 by smtp.gmail.com with ESMTPSA id a16sm2342587wrt.37.2019.12.10.00.06.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 00:06:44 -0800 (PST)
From: SeongJae Park <sj38.park@gmail.com>
X-Google-Original-From: SeongJae Park <sjpark@amazon.de>
To: sjpark@amazon.com
Date: Tue, 10 Dec 2019 08:06:28 +0000
Message-Id: <20191210080628.5264-3-sjpark@amazon.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191210080628.5264-1-sjpark@amazon.de>
References: <20191210080628.5264-1-sjpark@amazon.de>
Subject: [Xen-devel] [PATCH v5 2/2] xen/blkback: Squeeze page pools if a
 memory pressure is detected
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
Cc: axboe@kernel.dk, sj38.park@gmail.com, konrad.wilk@oracle.com,
 pdurrant@amazon.com, SeongJae Park <sjpark@amazon.de>,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 xen-devel@lists.xenproject.org, roger.pau@citrix.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RWFjaCBgYmxraWZgIGhhcyBhIGZyZWUgcGFnZXMgcG9vbCBmb3IgdGhlIGdyYW50IG1hcHBpbmcu
ICBUaGUgc2l6ZSBvZgp0aGUgcG9vbCBzdGFydHMgZnJvbSB6ZXJvIGFuZCBiZSBpbmNyZWFzZWQg
b24gZGVtYW5kIHdoaWxlIHByb2Nlc3NpbmcKdGhlIEkvTyByZXF1ZXN0cy4gIElmIGN1cnJlbnQg
SS9PIHJlcXVlc3RzIGhhbmRsaW5nIGlzIGZpbmlzaGVkIG9yIDEwMAptaWxsaXNlY29uZHMgaGFz
IHBhc3NlZCBzaW5jZSBsYXN0IEkvTyByZXF1ZXN0cyBoYW5kbGluZywgaXQgY2hlY2tzIGFuZApz
aHJpbmtzIHRoZSBwb29sIHRvIG5vdCBleGNlZWQgdGhlIHNpemUgbGltaXQsIGBtYXhfYnVmZmVy
X3BhZ2VzYC4KClRoZXJlZm9yZSwgYGJsa2Zyb250YCBydW5uaW5nIGd1ZXN0cyBjYW4gY2F1c2Ug
YSBtZW1vcnkgcHJlc3N1cmUgaW4gdGhlCmBibGtiYWNrYCBydW5uaW5nIGd1ZXN0IGJ5IGF0dGFj
aGluZyBhIGxhcmdlIG51bWJlciBvZiBibG9jayBkZXZpY2VzIGFuZAppbmR1Y2luZyBJL08uICBT
eXN0ZW0gYWRtaW5pc3RyYXRvcnMgY2FuIGF2b2lkIHN1Y2ggcHJvYmxlbWF0aWMKc2l0dWF0aW9u
cyBieSBsaW1pdGluZyB0aGUgbWF4aW11bSBudW1iZXIgb2YgZGV2aWNlcyBlYWNoIGd1ZXN0IGNh
bgphdHRhY2guICBIb3dldmVyLCBmaW5kaW5nIHRoZSBvcHRpbWFsIGxpbWl0IGlzIG5vdCBzbyBl
YXN5LiAgSW1wcm9wZXIKc2V0IG9mIHRoZSBsaW1pdCBjYW4gcmVzdWx0cyBpbiB0aGUgbWVtb3J5
IHByZXNzdXJlIG9yIGEgcmVzb3VyY2UKdW5kZXJ1dGlsaXphdGlvbi4gIFRoaXMgY29tbWl0IGF2
b2lkcyBzdWNoIHByb2JsZW1hdGljIHNpdHVhdGlvbnMgYnkKc3F1ZWV6aW5nIHRoZSBwb29scyAo
cmV0dXJucyBldmVyeSBmcmVlIHBhZ2UgaW4gdGhlIHBvb2wgdG8gdGhlIHN5c3RlbSkKZm9yIGEg
d2hpbGUgKHVzZXJzIGNhbiBzZXQgdGhpcyBkdXJhdGlvbiB2aWEgYSBtb2R1bGUgcGFyYW1ldGVy
KSBpZiBhCm1lbW9yeSBwcmVzc3VyZSBpcyBkZXRlY3RlZC4KCkRpc2N1c3Npb25zCj09PT09PT09
PT09CgpUaGUgYGJsa2JhY2tgJ3Mgb3JpZ2luYWwgc2hyaW5raW5nIG1lY2hhbmlzbSByZXR1cm5z
IG9ubHkgcGFnZXMgaW4gdGhlCnBvb2wsIHdoaWNoIGFyZSBub3QgY3VycmVudGx5IGJlIHVzZWQg
YnkgYGJsa2JhY2tgLCB0byB0aGUgc3lzdGVtLiAgSW4Kb3RoZXIgd29yZHMsIHRoZSBwYWdlcyBh
cmUgbm90IG1hcHBlZCB3aXRoIGZvcmVpZ24gcGFnZXMuICBCZWNhdXNlIHRoaXMKY29tbWl0IGlz
IGNoYW5naW5nIG9ubHkgdGhlIHNocmluayBsaW1pdCBidXQgdXNlcyB0aGUgbWVjaGFuaXNtIGFz
IGlzLAp0aGlzIGNvbW1pdCBkb2VzIG5vdCBpbnRyb2R1Y2UgaW1wcm9wZXIgbWFwcGluZ3MgcmVs
YXRlZCBzZWN1cml0eQppc3N1ZXMuCgpPbmNlIGEgbWVtb3J5IHByZXNzdXJlIGlzIGRldGVjdGVk
LCB0aGlzIGNvbW1pdCBrZWVwcyB0aGUgc3F1ZWV6aW5nCmxpbWl0IGZvciBhIHVzZXItc3BlY2lm
aWVkIHRpbWUgZHVyYXRpb24uICBUaGUgZHVyYXRpb24gc2hvdWxkIGJlCm5laXRoZXIgdG9vIGxv
bmcgbm9yIHRvbyBzaG9ydC4gIElmIGl0IGlzIHRvbyBsb25nLCB0aGUgc3F1ZWV6aW5nCmluY3Vy
cmluZyBvdmVyaGVhZCBjYW4gcmVkdWNlIHRoZSBJL08gcGVyZm9ybWFuY2UuICBJZiBpdCBpcyB0
b28gc2hvcnQsCmBibGtiYWNrYCB3aWxsIG5vdCBmcmVlIGVub3VnaCBwYWdlcyB0byByZWR1Y2Ug
dGhlIG1lbW9yeSBwcmVzc3VyZS4KVGhpcyBjb21taXQgc2V0cyB0aGUgdmFsdWUgYXMgYDEwIG1p
bGxpc2Vjb25kc2AgYnkgZGVmYXVsdCBiZWNhdXNlIGl0IGlzCmEgc2hvcnQgdGltZSBpbiB0ZXJt
cyBvZiBJL08gd2hpbGUgaXQgaXMgYSBsb25nIHRpbWUgaW4gdGVybXMgb2YgbWVtb3J5Cm9wZXJh
dGlvbnMuICBBbHNvLCBhcyB0aGUgb3JpZ2luYWwgc2hyaW5raW5nIG1lY2hhbmlzbSB3b3JrcyBm
b3IgYXQKbGVhc3QgZXZlcnkgMTAwIG1pbGxpc2Vjb25kcywgdGhpcyBjb3VsZCBiZSBhIHNvbWV3
aGF0IHJlYXNvbmFibGUKY2hvaWNlLiAgSSBhbHNvIHRlc3RlZCBvdGhlciBkdXJhdGlvbnMgKHJl
ZmVyIHRvIHRoZSBiZWxvdyBzZWN0aW9uIGZvcgptb3JlIGRldGFpbHMpIGFuZCBjb25maXJtZWQg
dGhhdCAxMCBtaWxsaXNlY29uZHMgaXMgdGhlIG9uZSB0aGF0IHdvcmtzCmJlc3Qgd2l0aCB0aGUg
dGVzdC4gIFRoYXQgc2FpZCwgdGhlIHByb3BlciBkdXJhdGlvbiBkZXBlbmRzIG9uIGFjdHVhbApj
b25maWd1cmF0aW9ucyBhbmQgd29ya2xvYWRzLiAgVGhhdCdzIHdoeSB0aGlzIGNvbW1pdCBpcyBh
bGxvd2luZyB1c2Vycwp0byBzZXQgaXQgYXMgdGhlaXIgb3B0aW1hbCB2YWx1ZSB2aWEgdGhlIG1v
ZHVsZSBwYXJhbWV0ZXIuCgpNZW1vcnkgUHJlc3N1cmUgVGVzdAo9PT09PT09PT09PT09PT09PT09
PQoKVG8gc2hvdyBob3cgdGhpcyBjb21taXQgZml4ZXMgdGhlIG1lbW9yeSBwcmVzc3VyZSBzaXR1
YXRpb24gd2VsbCwgSQpjb25maWd1cmVkIGEgdGVzdCBlbnZpcm9ubWVudCBvbiBhIHhlbi1ydW5u
aW5nIHZpcnR1YWxpemF0aW9uIHN5c3RlbS4KT24gdGhlIGBibGtmcm9udGAgcnVubmluZyBndWVz
dCBpbnN0YW5jZXMsIEkgYXR0YWNoIGEgbGFyZ2UgbnVtYmVyIG9mCm5ldHdvcmstYmFja2VkIHZv
bHVtZSBkZXZpY2VzIGFuZCBpbmR1Y2UgSS9PIHRvIHRob3NlLiAgTWVhbndoaWxlLCBJCm1lYXN1
cmUgdGhlIG51bWJlciBvZiBwYWdlcyB0aGF0IHN3YXBwZWQgaW4gYW5kIG91dCBvbiB0aGUgYGJs
a2JhY2tgCnJ1bm5pbmcgZ3Vlc3QuICBUaGUgdGVzdCByYW4gdHdpY2UsIG9uY2UgZm9yIHRoZSBg
YmxrYmFja2AgYmVmb3JlIHRoaXMKY29tbWl0IGFuZCBvbmNlIGZvciB0aGF0IGFmdGVyIHRoaXMg
Y29tbWl0LiAgQXMgc2hvd24gYmVsb3csIHRoaXMgY29tbWl0CmhhcyBkcmFtYXRpY2FsbHkgcmVk
dWNlZCB0aGUgbWVtb3J5IHByZXNzdXJlOgoKICAgICAgICAgICAgICAgIHBzd3BpbiAgcHN3cG91
dAogICAgYmVmb3JlICAgICAgNzYsNjcyICAxODUsNzk5CiAgICBhZnRlciAgICAgICAgICAyMTIg
ICAgMywzMjUKCk9wdGltYWwgQWdncmVzc2l2ZSBTaHJpbmtpbmcgRHVyYXRpb24KLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoKVG8gZmluZCBhIGJlc3Qgc3F1ZWV6aW5nIGR1
cmF0aW9uLCBJIHJlcGVhdGVkIHRoZSB0ZXN0IHdpdGggdGhyZWUKZGlmZmVyZW50IGR1cmF0aW9u
cyAoMW1zLCAxMG1zLCBhbmQgMTAwbXMpLiAgVGhlIHJlc3VsdHMgYXJlIGFzIGJlbG93OgoKICAg
IGR1cmF0aW9uICAgIHBzd3BpbiAgcHN3cG91dAogICAgMSAgICAgICAgICAgODUyICAgICA2LDQy
NAogICAgMTAgICAgICAgICAgMjEyICAgICAzLDMyNQogICAgMTAwICAgICAgICAgMjAzICAgICAz
LDM0MAoKQXMgZXhwZWN0ZWQsIHRoZSBtZW1vcnkgcHJlc3N1cmUgaGFzIGRlY3JlYXNlZCBhcyB0
aGUgZHVyYXRpb24gaXMKaW5jcmVhc2VkLCBidXQgdGhlIHJlZHVjdGlvbiBzdG9wcGVkIGZyb20g
dGhlIGAxMG1zYC4gIEJhc2VkIG9uIHRoaXMKcmVzdWx0cywgSSBjaG9zZSB0aGUgZGVmYXVsdCBk
dXJhdGlvbiBhcyAxMG1zLgoKUGVyZm9ybWFuY2UgT3ZlcmhlYWQgVGVzdAo9PT09PT09PT09PT09
PT09PT09PT09PT09CgpUaGlzIGNvbW1pdCBjb3VsZCBpbmN1ciBJL08gcGVyZm9ybWFuY2UgZGVn
cmFkYXRpb24gdW5kZXIgc2V2ZXJlIG1lbW9yeQpwcmVzc3VyZSBiZWNhdXNlIHRoZSBzcXVlZXpp
bmcgd2lsbCByZXF1aXJlIG1vcmUgcGFnZSBhbGxvY2F0aW9ucyBwZXIKSS9PLiAgVG8gc2hvdyB0
aGUgb3ZlcmhlYWQsIEkgYXJ0aWZpY2lhbGx5IG1hZGUgYSB3b3JzdC1jYXNlIHNxdWVlemluZwpz
aXR1YXRpb24gYW5kIG1lYXN1cmVkIHRoZSBJL08gcGVyZm9ybWFuY2Ugb2YgYSBgYmxrZnJvbnRg
IHJ1bm5pbmcKZ3Vlc3QuCgpGb3IgdGhlIGFydGlmaWNpYWwgc3F1ZWV6aW5nLCBJIHNldCB0aGUg
YGJsa2JhY2subWF4X2J1ZmZlcl9wYWdlc2AgdXNpbmcKdGhlIGAvc3lzL21vZHVsZS94ZW5fYmxr
YmFjay9wYXJhbWV0ZXJzL21heF9idWZmZXJfcGFnZXNgIGZpbGUuICBXZSBzZXQKdGhlIHZhbHVl
IHRvIGAxMDI0YCBhbmQgYDBgLiAgVGhlIGAxMDI0YCBpcyB0aGUgZGVmYXVsdCB2YWx1ZS4gIFNl
dHRpbmcKdGhlIHZhbHVlIGFzIGAwYCBpcyBzYW1lIHRvIGEgc2l0dWF0aW9uIGRvaW5nIHRoZSBz
cXVlZXppbmcgYWx3YXlzCih3b3JzdC1jYXNlKS4KCkZvciB0aGUgSS9PIHBlcmZvcm1hbmNlIG1l
YXN1cmVtZW50LCBJIHVzZSBhIHNpbXBsZSBgZGRgIGNvbW1hbmQuCgpEZWZhdWx0IFBlcmZvcm1h
bmNlCi0tLS0tLS0tLS0tLS0tLS0tLS0KCiAgICBbZG9tMF0jIGVjaG8gMTAyNCA+IC9zeXMvbW9k
dWxlL3hlbl9ibGtiYWNrL3BhcmFtZXRlcnMvbWF4X2J1ZmZlcl9wYWdlcwogICAgW2luc3RhbmNl
XSQgZm9yIGkgaW4gezEuLjV9OyBkbyBkZCBpZj0vZGV2L3plcm8gb2Y9ZmlsZSBicz00ayBjb3Vu
dD0kKCgyNTYqNTEyKSk7IHN5bmM7IGRvbmUKICAgIDEzMTA3MiswIHJlY29yZHMgaW4KICAgIDEz
MTA3MiswIHJlY29yZHMgb3V0CiAgICA1MzY4NzA5MTIgYnl0ZXMgKDUzNyBNQikgY29waWVkLCAx
MS43MjU3IHMsIDQ1LjggTUIvcwogICAgMTMxMDcyKzAgcmVjb3JkcyBpbgogICAgMTMxMDcyKzAg
cmVjb3JkcyBvdXQKICAgIDUzNjg3MDkxMiBieXRlcyAoNTM3IE1CKSBjb3BpZWQsIDEzLjg4Mjcg
cywgMzguNyBNQi9zCiAgICAxMzEwNzIrMCByZWNvcmRzIGluCiAgICAxMzEwNzIrMCByZWNvcmRz
IG91dAogICAgNTM2ODcwOTEyIGJ5dGVzICg1MzcgTUIpIGNvcGllZCwgMTMuODc4MSBzLCAzOC43
IE1CL3MKICAgIDEzMTA3MiswIHJlY29yZHMgaW4KICAgIDEzMTA3MiswIHJlY29yZHMgb3V0CiAg
ICA1MzY4NzA5MTIgYnl0ZXMgKDUzNyBNQikgY29waWVkLCAxMy44NzM3IHMsIDM4LjcgTUIvcwog
ICAgMTMxMDcyKzAgcmVjb3JkcyBpbgogICAgMTMxMDcyKzAgcmVjb3JkcyBvdXQKICAgIDUzNjg3
MDkxMiBieXRlcyAoNTM3IE1CKSBjb3BpZWQsIDEzLjg3MDIgcywgMzguNyBNQi9zCgpXb3JzdC1j
YXNlIFBlcmZvcm1hbmNlCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KCiAgICBbZG9tMF0jIGVjaG8g
MCA+IC9zeXMvbW9kdWxlL3hlbl9ibGtiYWNrL3BhcmFtZXRlcnMvbWF4X2J1ZmZlcl9wYWdlcwog
ICAgW2luc3RhbmNlXSQgZm9yIGkgaW4gezEuLjV9OyBkbyBkZCBpZj0vZGV2L3plcm8gb2Y9Zmls
ZSBicz00ayBjb3VudD0kKCgyNTYqNTEyKSk7IHN5bmM7IGRvbmUKICAgIDEzMTA3MiswIHJlY29y
ZHMgaW4KICAgIDEzMTA3MiswIHJlY29yZHMgb3V0CiAgICA1MzY4NzA5MTIgYnl0ZXMgKDUzNyBN
QikgY29waWVkLCAxMS43MjU3IHMsIDQ1LjggTUIvcwogICAgMTMxMDcyKzAgcmVjb3JkcyBpbgog
ICAgMTMxMDcyKzAgcmVjb3JkcyBvdXQKICAgIDUzNjg3MDkxMiBieXRlcyAoNTM3IE1CKSBjb3Bp
ZWQsIDEzLjg3OCBzLCAzOC43IE1CL3MKICAgIDEzMTA3MiswIHJlY29yZHMgaW4KICAgIDEzMTA3
MiswIHJlY29yZHMgb3V0CiAgICA1MzY4NzA5MTIgYnl0ZXMgKDUzNyBNQikgY29waWVkLCAxMy44
NzQ2IHMsIDM4LjcgTUIvcwogICAgMTMxMDcyKzAgcmVjb3JkcyBpbgogICAgMTMxMDcyKzAgcmVj
b3JkcyBvdXQKICAgIDUzNjg3MDkxMiBieXRlcyAoNTM3IE1CKSBjb3BpZWQsIDEzLjg3ODYgcywg
MzguNyBNQi9zCiAgICAxMzEwNzIrMCByZWNvcmRzIGluCiAgICAxMzEwNzIrMCByZWNvcmRzIG91
dAogICAgNTM2ODcwOTEyIGJ5dGVzICg1MzcgTUIpIGNvcGllZCwgMTMuODc0OSBzLCAzOC43IE1C
L3MKCkluIHNob3J0LCBldmVuIHdvcnN0IGNhc2Ugc3F1ZWV6aW5nIG1ha2VzIG5vIHZpc2libGUg
cGVyZm9ybWFuY2UKZGVncmFkYXRpb24uICBJIHRoaW5rIHRoaXMgaXMgZHVlIHRvIHRoZSBzbG93
IHNwZWVkIG9mIHRoZSBJL08uICBJbgpvdGhlciB3b3JkcywgdGhlIGFkZGl0aW9uYWwgcGFnZSBh
bGxvY2F0aW9uIG92ZXJoZWFkIGlzIGhpZGRlbiB1bmRlciB0aGUKbXVjaCBzbG93ZXIgSS9PIGxh
dGVuY3kuCgpOZXZlcnRoZWxlc3MsIHBsZWFzZXQgbm90ZSB0aGF0IHRoaXMgaXMganVzdCBhIHZl
cnkgc2ltcGxlIGFuZCBtaW5pbWFsCnRlc3QuCgpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPgpTaWduZWQtb2ZmLWJ5OiBTZW9uZ0phZSBQYXJrIDxzanBhcmtAYW1h
em9uLmRlPgotLS0KIGRyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2svYmxrYmFjay5jIHwgMjMgKysr
KysrKysrKysrKysrKysrKysrLS0KIGRyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2svY29tbW9uLmgg
IHwgIDEgKwogZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay94ZW5idXMuYyAgfCAgMyArKy0KIDMg
ZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL2Jsa2JhY2suYyBiL2RyaXZlcnMvYmxvY2sv
eGVuLWJsa2JhY2svYmxrYmFjay5jCmluZGV4IGZkMWUxOWYxYTQ5Zi4uNGQ0ZGJhN2VhNzIxIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL2Jsa2JhY2suYworKysgYi9kcml2
ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL2Jsa2JhY2suYwpAQCAtMTQyLDYgKzE0MiwyMiBAQCBzdGF0
aWMgaW5saW5lIGJvb2wgcGVyc2lzdGVudF9nbnRfdGltZW91dChzdHJ1Y3QgcGVyc2lzdGVudF9n
bnQgKnBlcnNpc3RlbnRfZ250KQogCQlIWiAqIHhlbl9ibGtpZl9wZ3JhbnRfdGltZW91dCk7CiB9
CiAKKy8qIE9uY2UgYSBtZW1vcnkgcHJlc3N1cmUgaXMgZGV0ZWN0ZWQsIHNxdWVlemUgZnJlZSBw
YWdlIHBvb2xzIGZvciBhIHdoaWxlLiAqLworc3RhdGljIGludCB4ZW5fYmxraWZfYnVmZmVyX3Nx
dWVlemVfZHVyYXRpb25fbXMgPSAxMDsKK21vZHVsZV9wYXJhbV9uYW1lZChidWZmZXJfc3F1ZWV6
ZV9kdXJhdGlvbl9tcywKKwkJeGVuX2Jsa2lmX2J1ZmZlcl9zcXVlZXplX2R1cmF0aW9uX21zLCBp
bnQsIDA2NDQpOworTU9EVUxFX1BBUk1fREVTQyhidWZmZXJfc3F1ZWV6ZV9kdXJhdGlvbl9tcywK
KyJEdXJhdGlvbiBpbiBtcyB0byBzcXVlZXplIHBhZ2VzIGJ1ZmZlciB3aGVuIGEgbWVtb3J5IHBy
ZXNzdXJlIGlzIGRldGVjdGVkIik7CisKK3N0YXRpYyB1bnNpZ25lZCBsb25nIHhlbl9ibGtfYnVm
ZmVyX3NxdWVlemVfZW5kOworCit1bnNpZ25lZCB4ZW5fYmxrYmtfcmVjbGFpbShzdHJ1Y3QgeGVu
YnVzX2RldmljZSAqZGV2KQoreworCXhlbl9ibGtfYnVmZmVyX3NxdWVlemVfZW5kID0gamlmZmll
cyArCisJCW1zZWNzX3RvX2ppZmZpZXMoeGVuX2Jsa2lmX2J1ZmZlcl9zcXVlZXplX2R1cmF0aW9u
X21zKTsKKwlyZXR1cm4gMDsKK30KKwogc3RhdGljIGlubGluZSBpbnQgZ2V0X2ZyZWVfcGFnZShz
dHJ1Y3QgeGVuX2Jsa2lmX3JpbmcgKnJpbmcsIHN0cnVjdCBwYWdlICoqcGFnZSkKIHsKIAl1bnNp
Z25lZCBsb25nIGZsYWdzOwpAQCAtNjU2LDggKzY3MiwxMSBAQCBpbnQgeGVuX2Jsa2lmX3NjaGVk
dWxlKHZvaWQgKmFyZykKIAkJCXJpbmctPm5leHRfbHJ1ID0gamlmZmllcyArIG1zZWNzX3RvX2pp
ZmZpZXMoTFJVX0lOVEVSVkFMKTsKIAkJfQogCi0JCS8qIFNocmluayBpZiB3ZSBoYXZlIG1vcmUg
dGhhbiB4ZW5fYmxraWZfbWF4X2J1ZmZlcl9wYWdlcyAqLwotCQlzaHJpbmtfZnJlZV9wYWdlcG9v
bChyaW5nLCB4ZW5fYmxraWZfbWF4X2J1ZmZlcl9wYWdlcyk7CisJCS8qIFNocmluayB0aGUgZnJl
ZSBwYWdlcyBwb29sIGlmIGl0IGlzIHRvbyBsYXJnZS4gKi8KKwkJaWYgKHRpbWVfYmVmb3JlKGpp
ZmZpZXMsIHhlbl9ibGtfYnVmZmVyX3NxdWVlemVfZW5kKSkKKwkJCXNocmlua19mcmVlX3BhZ2Vw
b29sKHJpbmcsIDApOworCQllbHNlCisJCQlzaHJpbmtfZnJlZV9wYWdlcG9vbChyaW5nLCB4ZW5f
YmxraWZfbWF4X2J1ZmZlcl9wYWdlcyk7CiAKIAkJaWYgKGxvZ19zdGF0cyAmJiB0aW1lX2FmdGVy
KGppZmZpZXMsIHJpbmctPnN0X3ByaW50KSkKIAkJCXByaW50X3N0YXRzKHJpbmcpOwpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay9jb21tb24uaCBiL2RyaXZlcnMvYmxvY2sv
eGVuLWJsa2JhY2svY29tbW9uLmgKaW5kZXggMWQzMDAyZDc3M2Y3Li5jMDMzNGNkYTc5ZmUgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2svY29tbW9uLmgKKysrIGIvZHJpdmVy
cy9ibG9jay94ZW4tYmxrYmFjay9jb21tb24uaApAQCAtMzgzLDYgKzM4Myw3IEBAIGlycXJldHVy
bl90IHhlbl9ibGtpZl9iZV9pbnQoaW50IGlycSwgdm9pZCAqZGV2X2lkKTsKIGludCB4ZW5fYmxr
aWZfc2NoZWR1bGUodm9pZCAqYXJnKTsKIGludCB4ZW5fYmxraWZfcHVyZ2VfcGVyc2lzdGVudCh2
b2lkICphcmcpOwogdm9pZCB4ZW5fYmxrYmtfZnJlZV9jYWNoZXMoc3RydWN0IHhlbl9ibGtpZl9y
aW5nICpyaW5nKTsKK3Vuc2lnbmVkIHhlbl9ibGtia19yZWNsYWltKHN0cnVjdCB4ZW5idXNfZGV2
aWNlICpkZXYpOwogCiBpbnQgeGVuX2Jsa2JrX2ZsdXNoX2Rpc2tjYWNoZShzdHJ1Y3QgeGVuYnVz
X3RyYW5zYWN0aW9uIHhidCwKIAkJCSAgICAgIHN0cnVjdCBiYWNrZW5kX2luZm8gKmJlLCBpbnQg
c3RhdGUpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay94ZW5idXMuYyBi
L2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2sveGVuYnVzLmMKaW5kZXggYjkwZGJjZDk5YzAzLi5k
ZTQ5YTA5ZTY5MzMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2sveGVuYnVz
LmMKKysrIGIvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay94ZW5idXMuYwpAQCAtMTExNSw3ICsx
MTE1LDggQEAgc3RhdGljIHN0cnVjdCB4ZW5idXNfZHJpdmVyIHhlbl9ibGtia19kcml2ZXIgPSB7
CiAJLmlkcyAgPSB4ZW5fYmxrYmtfaWRzLAogCS5wcm9iZSA9IHhlbl9ibGtia19wcm9iZSwKIAku
cmVtb3ZlID0geGVuX2Jsa2JrX3JlbW92ZSwKLQkub3RoZXJlbmRfY2hhbmdlZCA9IGZyb250ZW5k
X2NoYW5nZWQKKwkub3RoZXJlbmRfY2hhbmdlZCA9IGZyb250ZW5kX2NoYW5nZWQsCisJLnJlY2xh
aW0gPSB4ZW5fYmxrYmtfcmVjbGFpbQogfTsKIAogaW50IHhlbl9ibGtpZl94ZW5idXNfaW5pdCh2
b2lkKQotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
