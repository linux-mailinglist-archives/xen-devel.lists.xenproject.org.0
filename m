Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7298FEAB8
	for <lists+xen-devel@lfdr.de>; Sat, 16 Nov 2019 06:27:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVqZp-0006O4-Sk; Sat, 16 Nov 2019 05:24:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=st+B=ZI=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1iVqZo-0006Nu-7g
 for xen-devel@lists.xenproject.org; Sat, 16 Nov 2019 05:24:52 +0000
X-Inumbo-ID: 6993f7ea-0831-11ea-984a-bc764e2007e4
Received: from mail-qv1-xf31.google.com (unknown [2607:f8b0:4864:20::f31])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6993f7ea-0831-11ea-984a-bc764e2007e4;
 Sat, 16 Nov 2019 05:24:50 +0000 (UTC)
Received: by mail-qv1-xf31.google.com with SMTP id n4so1492348qvq.9
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2019 21:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=kbjwsooBUeLGb2D1Pj4azRIIPNIE1/PF78qoowXU6yY=;
 b=QQbxYw0eAOBEupsDyvrXJiDExRM7yKV5t4PQwK2KlCX9+g48aD+6LKV6ghd8ns7oZm
 QEN/O+1/O1YG669KyetLwJxeMdvs1CP+DfxEU5iYJNwhRX8ERLgLPezC+sXpKXRZOL2C
 5yX9z9KfCx8WQc+tq1ZVmCFIAexiZLuF9WsoEwdqJ9DkryHyEjZVmnFjiY2HPBndpDeI
 XAph4bJJwBc7IFbPxsOUPCu3hNeDNQ5z+ghuG/rbVjpMpgQtpq5Yk8MM6XQJuOQhqjY+
 5ughi+R9I0wTSkSPXEnF6mChKidC/+MWTg+9DcikB2viWA41NGpoLAZOvV9NKihdBauf
 0BRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=kbjwsooBUeLGb2D1Pj4azRIIPNIE1/PF78qoowXU6yY=;
 b=bNay2SMAPe2uahu0xRqZvsiURl4gs4Oz/J6GTB8sleNJUFaJ7jAK0ONf1E/bDEflvx
 ZHMct8FEEaw58L5cHTmt8vRfRz6Hjj1dbwwKqfG+s9FDMMCkU3+SBXFVKt71D26c3sBA
 bXKAd8dr34ItX5OYoB+fDG1nZZLJfOqyVWBGjKzX44IxSagWIKcDenFIMmCpaLolBxgs
 4F0M1gsdTFkima7pQ82oMH6XCoYrZiYZ5nciTGTVhwgxNgXSEXJA1ETeIt2yTbu17PL/
 w4NeuujuiHDBXGAZbXuJZcDGqThsZSlrxxdD1zjhXqzUCb6x5SNdyxnlwk8EUh8bQEIz
 LX8w==
X-Gm-Message-State: APjAAAVLE2mkmKGKAAF0Ap2RTO4ll7Cc8Vqbon6CzJSkNaTJUmcHoBn/
 kHtqLG6UDUZwu9dFFmkvSRArKvKeo/wt9BPBlD7SAMJq6MI+BQ==
X-Google-Smtp-Source: APXvYqyLdxp722oH9JXf29vkujy4ebhDzgghG345WkvioK55gHxRzMxPV4JHb+P7jz1+8S7p1s+PB8YEMiAbXFJ5NK8=
X-Received: by 2002:a0c:fa0a:: with SMTP id q10mr9763145qvn.193.1573881889822; 
 Fri, 15 Nov 2019 21:24:49 -0800 (PST)
MIME-Version: 1.0
From: Roman Shaposhnik <roman@zededa.com>
Date: Fri, 15 Nov 2019 21:24:38 -0800
Message-ID: <CAMmSBy9VN9fFC1M5P7OdLOiwZdgWjjWjMWppA63gnOe5wwGr4A@mail.gmail.com>
To: xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="000000000000f64ceb05976feef5"
Subject: [Xen-devel] Likely regression in efi=no-rs option
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--000000000000f64ceb05976feef5
Content-Type: text/plain; charset="UTF-8"

Hi!

as I've reported earlier -- part of my testing of Xen 4.13 RC2 failed
in a massive way with Dom0 never coming up. I've traced that problem
to the option that we're using to boot Xen:
    efi=no-rs
We've been using this option for quite sometime and Xen 4.13 RC2
is the first one that seems to make Dom0 boot fail with this option
present (note that RC1 was fine).

I was wondering whether there were any changes in the areas related
to UEFI in Xen that may have triggered this.

Here's the boot line that works with RC2:
    dom0_mem=1024M,max:1024M dom0_max_vcpus=1 dom0_vcpus_pin smt=false
adding efi=no-rs make Dom0 boot process fail:
    efi=no-rs dom0_mem=1024M,max:1024M dom0_max_vcpus=1 dom0_vcpus_pin smt=false

Attaching xl info and dmesg just in case

Thanks,
Roman.

--000000000000f64ceb05976feef5
Content-Type: text/plain; charset="US-ASCII"; name="dmesg.txt"
Content-Disposition: attachment; filename="dmesg.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_k314mkai0>
X-Attachment-Id: f_k314mkai0

IFhlbiA0LjEzLjAtcmMKKFhFTikgWGVuIHZlcnNpb24gNC4xMy4wLXJjIChAKSAoZ2NjIChBbHBp
bmUgNi40LjApIDYuNC4wKSBkZWJ1Zz15ICBUaHUgTm92IDE0IDA2OjQzOjAxIFVUQyAyMDE5CihY
RU4pIExhdGVzdCBDaGFuZ2VTZXQ6IAooWEVOKSBidWlsZC1pZDogM2NmOWY3MzdlN2ViYzNjOTIw
MjRmMzM1ODMzMDJiZGFjZDM2Yjg4MwooWEVOKSBCb290bG9hZGVyOiBHUlVCIDIuMDMKKFhFTikg
Q29tbWFuZCBsaW5lOiBkb20wX21lbT0xMDI0TSxtYXg6MTAyNE0gZG9tMF9tYXhfdmNwdXM9MSBk
b20wX3ZjcHVzX3BpbiBzbXQ9ZmFsc2UKKFhFTikgWGVuIGltYWdlIGxvYWQgYmFzZSBhZGRyZXNz
OiAweDg4MDAwMDAwCihYRU4pIFZpZGVvIGluZm9ybWF0aW9uOgooWEVOKSAgVkdBIGlzIGdyYXBo
aWNzIG1vZGUgMTY4MHgxMDUwLCAzMiBicHAKKFhFTikgRGlzYyBpbmZvcm1hdGlvbjoKKFhFTikg
IEZvdW5kIDAgTUJSIHNpZ25hdHVyZXMKKFhFTikgIEZvdW5kIDEgRUREIGluZm9ybWF0aW9uIHN0
cnVjdHVyZXMKKFhFTikgRUZJIFJBTSBtYXA6CihYRU4pICAwMDAwMDAwMDAwMDAwMDAwIC0gMDAw
MDAwMDAwMDA1ODAwMCAodXNhYmxlKQooWEVOKSAgMDAwMDAwMDAwMDA1ODAwMCAtIDAwMDAwMDAw
MDAwNTkwMDAgKHJlc2VydmVkKQooWEVOKSAgMDAwMDAwMDAwMDA1OTAwMCAtIDAwMDAwMDAwMDAw
OWYwMDAgKHVzYWJsZSkKKFhFTikgIDAwMDAwMDAwMDAwOWYwMDAgLSAwMDAwMDAwMDAwMGEwMDAw
IChyZXNlcnZlZCkKKFhFTikgIDAwMDAwMDAwMDAxMDAwMDAgLSAwMDAwMDAwMDg2NDhhMDAwICh1
c2FibGUpCihYRU4pICAwMDAwMDAwMDg2NDhhMDAwIC0gMDAwMDAwMDA4NjQ4YjAwMCAoQUNQSSBO
VlMpCihYRU4pICAwMDAwMDAwMDg2NDhiMDAwIC0gMDAwMDAwMDA4NjRiNTAwMCAocmVzZXJ2ZWQp
CihYRU4pICAwMDAwMDAwMDg2NGI1MDAwIC0gMDAwMDAwMDA4YzIyNDAwMCAodXNhYmxlKQooWEVO
KSAgMDAwMDAwMDA4YzIyNDAwMCAtIDAwMDAwMDAwOGM1MjgwMDAgKHJlc2VydmVkKQooWEVOKSAg
MDAwMDAwMDA4YzUyODAwMCAtIDAwMDAwMDAwOGM3MzYwMDAgKHVzYWJsZSkKKFhFTikgIDAwMDAw
MDAwOGM3MzYwMDAgLSAwMDAwMDAwMDhjZWE3MDAwIChBQ1BJIE5WUykKKFhFTikgIDAwMDAwMDAw
OGNlYTcwMDAgLSAwMDAwMDAwMDhkMmZmMDAwIChyZXNlcnZlZCkKKFhFTikgIDAwMDAwMDAwOGQy
ZmYwMDAgLSAwMDAwMDAwMDhkMzAwMDAwICh1c2FibGUpCihYRU4pICAwMDAwMDAwMDhkMzAwMDAw
IC0gMDAwMDAwMDA4ZDQwMDAwMCAocmVzZXJ2ZWQpCihYRU4pICAwMDAwMDAwMGUwMDAwMDAwIC0g
MDAwMDAwMDBmMDAwMDAwMCAocmVzZXJ2ZWQpCihYRU4pICAwMDAwMDAwMGZlMDAwMDAwIC0gMDAw
MDAwMDBmZTAxMTAwMCAocmVzZXJ2ZWQpCihYRU4pICAwMDAwMDAwMGZlYzAwMDAwIC0gMDAwMDAw
MDBmZWMwMTAwMCAocmVzZXJ2ZWQpCihYRU4pICAwMDAwMDAwMGZlZTAwMDAwIC0gMDAwMDAwMDBm
ZWUwMTAwMCAocmVzZXJ2ZWQpCihYRU4pICAwMDAwMDAwMGZmMDAwMDAwIC0gMDAwMDAwMDEwMDAw
MDAwMCAocmVzZXJ2ZWQpCihYRU4pICAwMDAwMDAwMTAwMDAwMDAwIC0gMDAwMDAwMDE2ZTAwMDAw
MCAodXNhYmxlKQooWEVOKSBBQ1BJOiBSU0RQIDhDRTQ5MDAwLCAwMDI0IChyMiBBTEFTS0EpCihY
RU4pIEFDUEk6IFhTRFQgOENFNDkwQTgsIDAwQ0MgKHIxIEFMQVNLQSAgIEEgTSBJICAgMTA3MjAw
OSBBTUkgICAgIDEwMDEzKQooWEVOKSBBQ1BJOiBGQUNQIDhDRTZDMzcwLCAwMTBDIChyNSBBTEFT
S0EgICBBIE0gSSAgIDEwNzIwMDkgQU1JICAgICAxMDAxMykKKFhFTikgQUNQSTogRFNEVCA4Q0U0
OTIwOCwgMjMxNjcgKHIyIEFMQVNLQSAgIEEgTSBJICAgMTA3MjAwOSBJTlRMIDIwMTIwOTEzKQoo
WEVOKSBBQ1BJOiBGQUNTIDhDRThFRjgwLCAwMDQwCihYRU4pIEFDUEk6IEFQSUMgOENFNkM0ODAs
IDAwODQgKHIzIEFMQVNLQSAgIEEgTSBJICAgMTA3MjAwOSBBTUkgICAgIDEwMDEzKQooWEVOKSBB
Q1BJOiBGUERUIDhDRTZDNTA4LCAwMDQ0IChyMSBBTEFTS0EgICBBIE0gSSAgIDEwNzIwMDkgQU1J
ICAgICAxMDAxMykKKFhFTikgQUNQSTogRklEVCA4Q0U2QzU1MCwgMDA5QyAocjEgQUxBU0tBICAg
QSBNIEkgICAxMDcyMDA5IEFNSSAgICAgMTAwMTMpCihYRU4pIEFDUEk6IE1DRkcgOENFNkM1RjAs
IDAwM0MgKHIxIEFMQVNLQSAgIEEgTSBJICAgMTA3MjAwOSBNU0ZUICAgICAgIDk3KQooWEVOKSBB
Q1BJOiBIUEVUIDhDRTZDNjMwLCAwMDM4IChyMSBBTEFTS0EgICBBIE0gSSAgIDEwNzIwMDkgQU1J
LiAgICA1MDAwQikKKFhFTikgQUNQSTogTFBJVCA4Q0U2QzY2OCwgMDA5NCAocjEgSU5URUwgICBT
S0wtVUxUICAgICAgICAwIE1TRlQgICAgICAgNUYpCihYRU4pIEFDUEk6IFNTRFQgOENFNkM3MDAs
IDAyNDggKHIyIElOVEVMICBzZW5zcmh1YiAgICAgICAgMCBJTlRMIDIwMTIwOTEzKQooWEVOKSBB
Q1BJOiBTU0RUIDhDRTZDOTQ4LCAyQkFFIChyMiBJTlRFTCAgUHRpZERldmMgICAgIDEwMDAgSU5U
TCAyMDEyMDkxMykKKFhFTikgQUNQSTogU1NEVCA4Q0U2RjRGOCwgMEJFMyAocjIgSU5URUwgIFRo
ZXJfUnZwICAgICAxMDAwIElOVEwgMjAxMjA5MTMpCihYRU4pIEFDUEk6IFNTRFQgOENFNzAwRTAs
IDA0QTMgKHIyIElOVEVMICAgICB6cG9kZCAgICAgMTAwMCBJTlRMIDIwMTIwOTEzKQooWEVOKSBB
Q1BJOiBEQkdQIDhDRTcwNTg4LCAwMDM0IChyMSBJTlRFTCAgICAgICAgICAgICAgICAgIDAgTVNG
VCAgICAgICA1RikKKFhFTikgQUNQSTogREJHMiA4Q0U3MDVDMCwgMDA1NCAocjAgSU5URUwgICAg
ICAgICAgICAgICAgICAwIE1TRlQgICAgICAgNUYpCihYRU4pIEFDUEk6IFNTRFQgOENFNzA2MTgs
IDA2RTkgKHIyICBJTlRFTCB4aF9ydnAwNyAgICAgICAgMCBJTlRMIDIwMTIwOTEzKQooWEVOKSBB
Q1BJOiBTU0RUIDhDRTcwRDA4LCA1NDdFIChyMiBTYVNzZHQgIFNhU3NkdCAgICAgIDMwMDAgSU5U
TCAyMDEyMDkxMykKKFhFTikgQUNQSTogVUVGSSA4Q0U3NjE4OCwgMDA0MiAocjEgICAgICAgICAg
ICAgICAgICAgICAgICAwICAgICAgICAgICAgIDApCihYRU4pIEFDUEk6IFNTRFQgOENFNzYxRDAs
IDBFNzMgKHIyIENwdVJlZiAgQ3B1U3NkdCAgICAgMzAwMCBJTlRMIDIwMTIwOTEzKQooWEVOKSBB
Q1BJOiBCR1JUIDhDRTc3MDQ4LCAwMDM4IChyMSBBTEFTS0EgICBBIE0gSSAgIDEwNzIwMDkgQU1J
ICAgICAxMDAxMykKKFhFTikgQUNQSTogRE1BUiA4Q0U3NzA4MCwgMDBBOCAocjEgSU5URUwgICAg
ICBTS0wgICAgICAgICAxIElOVEwgICAgICAgIDEpCihYRU4pIEFDUEk6IFRQTTIgOENFNzcxMjgs
IDAwMzQgKHIzICAgICAgICBUcG0yVGFibCAgICAgICAgMSBBTUkgICAgICAgICAwKQooWEVOKSBB
Q1BJOiBBU0YhIDhDRTc3MTYwLCAwMEE1IChyMzIgSU5URUwgICAgICAgSENHICAgICAgICAxIFRG
U00gICAgRjQyNDApCihYRU4pIFN5c3RlbSBSQU06IDQwMDNNQiAoNDA5OTczNmtCKQooWEVOKSBO
byBOVU1BIGNvbmZpZ3VyYXRpb24gZm91bmQKKFhFTikgRmFraW5nIGEgbm9kZSBhdCAwMDAwMDAw
MDAwMDAwMDAwLTAwMDAwMDAxNmUwMDAwMDAKKFhFTikgRG9tYWluIGhlYXAgaW5pdGlhbGlzZWQK
KFhFTikgdmVzYWZiOiBmcmFtZWJ1ZmZlciBhdCAweDAwMDAwMDAwYzAwMDAwMDAsIG1hcHBlZCB0
byAweGZmZmY4MmMwMDAyMDEwMDAsIHVzaW5nIDY5MTJrLCB0b3RhbCA2OTEyawooWEVOKSB2ZXNh
ZmI6IG1vZGUgaXMgMTY4MHgxMDUweDMyLCBsaW5lbGVuZ3RoPTY3MjAsIGZvbnQgOHgxNgooWEVO
KSB2ZXNhZmI6IFRydWVjb2xvcjogc2l6ZT04Ojg6ODo4LCBzaGlmdD0yNDoxNjo4OjAKKFhFTikg
Q1BVIFZlbmRvcjogSW50ZWwsIEZhbWlseSA2ICgweDYpLCBNb2RlbCA3OCAoMHg0ZSksIFN0ZXBw
aW5nIDMgKHJhdyAwMDA0MDZlMykKKFhFTikgU01CSU9TIDMuMCBwcmVzZW50LgooWEVOKSBVc2lu
ZyBBUElDIGRyaXZlciBkZWZhdWx0CihYRU4pIEFDUEk6IFBNLVRpbWVyIElPIFBvcnQ6IDB4MTgw
OCAoMzIgYml0cykKKFhFTikgQUNQSTogdjUgU0xFRVAgSU5GTzogY29udHJvbFswOjBdLCBzdGF0
dXNbMDowXQooWEVOKSBBQ1BJOiBTTEVFUCBJTkZPOiBwbTF4X2NudFsxOjE4MDQsMTowXSwgcG0x
eF9ldnRbMToxODAwLDE6MF0KKFhFTikgQUNQSTogMzIvNjRYIEZBQ1MgYWRkcmVzcyBtaXNtYXRj
aCBpbiBGQURUIC0gOGNlOGVmODAvMDAwMDAwMDAwMDAwMDAwMCwgdXNpbmcgMzIKKFhFTikgQUNQ
STogICAgICAgICAgICAgd2FrZXVwX3ZlY1s4Y2U4ZWY4Y10sIHZlY19zaXplWzIwXQooWEVOKSBB
Q1BJOiBMb2NhbCBBUElDIGFkZHJlc3MgMHhmZWUwMDAwMAooWEVOKSBBQ1BJOiBMQVBJQyAoYWNw
aV9pZFsweDAxXSBsYXBpY19pZFsweDAwXSBlbmFibGVkKQooWEVOKSBBQ1BJOiBMQVBJQyAoYWNw
aV9pZFsweDAyXSBsYXBpY19pZFsweDAyXSBlbmFibGVkKQooWEVOKSBBQ1BJOiBMQVBJQyAoYWNw
aV9pZFsweDAzXSBsYXBpY19pZFsweDAxXSBlbmFibGVkKQooWEVOKSBBQ1BJOiBMQVBJQyAoYWNw
aV9pZFsweDA0XSBsYXBpY19pZFsweDAzXSBlbmFibGVkKQooWEVOKSBBQ1BJOiBMQVBJQ19OTUkg
KGFjcGlfaWRbMHgwMV0gaGlnaCBlZGdlIGxpbnRbMHgxXSkKKFhFTikgQUNQSTogTEFQSUNfTk1J
IChhY3BpX2lkWzB4MDJdIGhpZ2ggZWRnZSBsaW50WzB4MV0pCihYRU4pIEFDUEk6IExBUElDX05N
SSAoYWNwaV9pZFsweDAzXSBoaWdoIGVkZ2UgbGludFsweDFdKQooWEVOKSBBQ1BJOiBMQVBJQ19O
TUkgKGFjcGlfaWRbMHgwNF0gaGlnaCBlZGdlIGxpbnRbMHgxXSkKKFhFTikgQUNQSTogSU9BUElD
IChpZFsweDAyXSBhZGRyZXNzWzB4ZmVjMDAwMDBdIGdzaV9iYXNlWzBdKQooWEVOKSBJT0FQSUNb
MF06IGFwaWNfaWQgMiwgdmVyc2lvbiAzMiwgYWRkcmVzcyAweGZlYzAwMDAwLCBHU0kgMC0xMTkK
KFhFTikgQUNQSTogSU5UX1NSQ19PVlIgKGJ1cyAwIGJ1c19pcnEgMCBnbG9iYWxfaXJxIDIgZGZs
IGRmbCkKKFhFTikgQUNQSTogSU5UX1NSQ19PVlIgKGJ1cyAwIGJ1c19pcnEgOSBnbG9iYWxfaXJx
IDkgaGlnaCBsZXZlbCkKKFhFTikgQUNQSTogSVJRMCB1c2VkIGJ5IG92ZXJyaWRlLgooWEVOKSBB
Q1BJOiBJUlEyIHVzZWQgYnkgb3ZlcnJpZGUuCihYRU4pIEFDUEk6IElSUTkgdXNlZCBieSBvdmVy
cmlkZS4KKFhFTikgRW5hYmxpbmcgQVBJQyBtb2RlOiAgRmxhdC4gIFVzaW5nIDEgSS9PIEFQSUNz
CihYRU4pIEFDUEk6IEhQRVQgaWQ6IDB4ODA4NmE3MDEgYmFzZTogMHhmZWQwMDAwMAooWEVOKSBQ
Q0k6IE1DRkcgY29uZmlndXJhdGlvbiAwOiBiYXNlIGUwMDAwMDAwIHNlZ21lbnQgMDAwMCBidXNl
cyAwMCAtIGZmCihYRU4pIFBDSTogTUNGRyBhcmVhIGF0IGUwMDAwMDAwIHJlc2VydmVkIGluIEU4
MjAKKFhFTikgUENJOiBVc2luZyBNQ0ZHIGZvciBzZWdtZW50IDAwMDAgYnVzIDAwLWZmCihYRU4p
IFtWVC1EXSAgUk1SUiBhZGRyZXNzIHJhbmdlIDhkODAwMDAwLi44ZmZmZmZmZiBub3QgaW4gcmVz
ZXJ2ZWQgbWVtb3J5OyBuZWVkICJpb21tdV9pbmNsdXNpdmVfbWFwcGluZz0xIj8KKFhFTikgQUNQ
STogQkdSVDogaW52YWxpZGF0aW5nIHYxIGltYWdlIGF0IDB4ODhlNWEwMTgKKFhFTikgVXNpbmcg
QUNQSSAoTUFEVCkgZm9yIFNNUCBjb25maWd1cmF0aW9uIGluZm9ybWF0aW9uCihYRU4pIFNNUDog
QWxsb3dpbmcgNCBDUFVzICgwIGhvdHBsdWcgQ1BVcykKKFhFTikgSVJRIGxpbWl0czogMTIwIEdT
SSwgODQwIE1TSS9NU0ktWAooWEVOKSBTd2l0Y2hlZCB0byBBUElDIGRyaXZlciB4MmFwaWNfY2x1
c3RlcgooWEVOKSB4c3RhdGU6IHNpemU6IDB4NDQwIGFuZCBzdGF0ZXM6IDB4MWYKKFhFTikgbWNl
X2ludGVsLmM6Nzc4OiBNQ0EgQ2FwYWJpbGl0eTogZmlyc3RiYW5rIDAsIGV4dGVuZGVkIE1DRSBN
U1IgMCwgQkNBU1QsIENNQ0kKKFhFTikgQ1BVMDogSW50ZWwgbWFjaGluZSBjaGVjayByZXBvcnRp
bmcgZW5hYmxlZAooWEVOKSBTcGVjdWxhdGl2ZSBtaXRpZ2F0aW9uIGZhY2lsaXRpZXM6CihYRU4p
ICAgSGFyZHdhcmUgZmVhdHVyZXM6CihYRU4pICAgQ29tcGlsZWQtaW4gc3VwcG9ydDogU0hBRE9X
X1BBR0lORwooWEVOKSAgIFhlbiBzZXR0aW5nczogQlRJLVRodW5rIE4vQSwgU1BFQ19DVFJMOiBO
bywgT3RoZXI6IEJSQU5DSF9IQVJERU4KKFhFTikgICBMMVRGOiBiZWxpZXZlZCB2dWxuZXJhYmxl
LCBtYXhwaHlzYWRkciBMMUQgNDYsIENQVUlEIDM5LCBTYWZlIGFkZHJlc3MgODAwMDAwMDAwMAoo
WEVOKSAgIFN1cHBvcnQgZm9yIEhWTSBWTXM6IFJTQiBFQUdFUl9GUFUKKFhFTikgICBTdXBwb3J0
IGZvciBQViBWTXM6IFJTQiBFQUdFUl9GUFUKKFhFTikgICBYUFRJICg2NC1iaXQgUFYgb25seSk6
IERvbTAgZW5hYmxlZCwgRG9tVSBlbmFibGVkICh3aXRoIFBDSUQpCihYRU4pICAgUFYgTDFURiBz
aGFkb3dpbmc6IERvbTAgZGlzYWJsZWQsIERvbVUgZW5hYmxlZAooWEVOKSBVc2luZyBzY2hlZHVs
ZXI6IFNNUCBDcmVkaXQgU2NoZWR1bGVyIHJldjIgKGNyZWRpdDIpCihYRU4pIEluaXRpYWxpemlu
ZyBDcmVkaXQyIHNjaGVkdWxlcgooWEVOKSAgbG9hZF9wcmVjaXNpb25fc2hpZnQ6IDE4CihYRU4p
ICBsb2FkX3dpbmRvd19zaGlmdDogMzAKKFhFTikgIHVuZGVybG9hZF9iYWxhbmNlX3RvbGVyYW5j
ZTogMAooWEVOKSAgb3ZlcmxvYWRfYmFsYW5jZV90b2xlcmFuY2U6IC0zCihYRU4pICBydW5xdWV1
ZXMgYXJyYW5nZW1lbnQ6IHNvY2tldAooWEVOKSAgY2FwIGVuZm9yY2VtZW50IGdyYW51bGFyaXR5
OiAxMG1zCihYRU4pIGxvYWQgdHJhY2tpbmcgd2luZG93IGxlbmd0aCAxMDczNzQxODI0IG5zCihY
RU4pIFBsYXRmb3JtIHRpbWVyIGlzIDIzLjk5OU1IeiBIUEVUCihYRU4pIERldGVjdGVkIDI0OTYu
MTgwIE1IeiBwcm9jZXNzb3IuCihYRU4pIEVGSSBtZW1vcnkgbWFwOgooWEVOKSAgMDAwMDAwMDAw
MDAwMC0wMDAwMDAwMDA3ZmZmIHR5cGU9MyBhdHRyPTAwMDAwMDAwMDAwMDAwMGYKKFhFTikgIDAw
MDAwMDAwMDgwMDAtMDAwMDAwMDAwYmZmZiB0eXBlPTIgYXR0cj0wMDAwMDAwMDAwMDAwMDBmCihY
RU4pICAwMDAwMDAwMDBjMDAwLTAwMDAwMDAwNDdmZmYgdHlwZT03IGF0dHI9MDAwMDAwMDAwMDAw
MDAwZgooWEVOKSAgMDAwMDAwMDA0ODAwMC0wMDAwMDAwMDU3ZmZmIHR5cGU9MiBhdHRyPTAwMDAw
MDAwMDAwMDAwMGYKKFhFTikgIDAwMDAwMDAwNTgwMDAtMDAwMDAwMDA1OGZmZiB0eXBlPTAgYXR0
cj0wMDAwMDAwMDAwMDAwMDBmCihYRU4pICAwMDAwMDAwMDU5MDAwLTAwMDAwMDAwNWVmZmYgdHlw
ZT03IGF0dHI9MDAwMDAwMDAwMDAwMDAwZgooWEVOKSAgMDAwMDAwMDA1ZjAwMC0wMDAwMDAwMDVm
ZmZmIHR5cGU9NCBhdHRyPTAwMDAwMDAwMDAwMDAwMGYKKFhFTikgIDAwMDAwMDAwNjAwMDAtMDAw
MDAwMDA5ZWZmZiB0eXBlPTMgYXR0cj0wMDAwMDAwMDAwMDAwMDBmCihYRU4pICAwMDAwMDAwMDlm
MDAwLTAwMDAwMDAwOWZmZmYgdHlwZT0wIGF0dHI9MDAwMDAwMDAwMDAwMDAwZgooWEVOKSAgMDAw
MDAwMDEwMDAwMC0wMDAwMDAwOGMwZmZmIHR5cGU9MiBhdHRyPTAwMDAwMDAwMDAwMDAwMGYKKFhF
TikgIDAwMDAwMDA4YzEwMDAtMDAwMDA0M2ZlMWZmZiB0eXBlPTcgYXR0cj0wMDAwMDAwMDAwMDAw
MDBmCihYRU4pICAwMDAwMDQzZmUyMDAwLTAwMDAwN2U1MWZmZmYgdHlwZT0xIGF0dHI9MDAwMDAw
MDAwMDAwMDAwZgooWEVOKSAgMDAwMDA3ZTUyMDAwMC0wMDAwMDdlNTVmZmZmIHR5cGU9NCBhdHRy
PTAwMDAwMDAwMDAwMDAwMGYKKFhFTikgIDAwMDAwN2U1NjAwMDAtMDAwMDA4NTBlNmZmZiB0eXBl
PTcgYXR0cj0wMDAwMDAwMDAwMDAwMDBmCihYRU4pICAwMDAwMDg1MGU3MDAwLTAwMDAwODUzOWVm
ZmYgdHlwZT0xIGF0dHI9MDAwMDAwMDAwMDAwMDAwZgooWEVOKSAgMDAwMDA4NTM5ZjAwMC0wMDAw
MDg2NDg5ZmZmIHR5cGU9NCBhdHRyPTAwMDAwMDAwMDAwMDAwMGYKKFhFTikgIDAwMDAwODY0OGEw
MDAtMDAwMDA4NjQ4YWZmZiB0eXBlPTEwIGF0dHI9MDAwMDAwMDAwMDAwMDAwZgooWEVOKSAgMDAw
MDA4NjQ4YjAwMC0wMDAwMDg2NGI0ZmZmIHR5cGU9NiBhdHRyPTgwMDAwMDAwMDAwMDAwMGYKKFhF
TikgIDAwMDAwODY0YjUwMDAtMDAwMDA4NjUwZmZmZiB0eXBlPTQgYXR0cj0wMDAwMDAwMDAwMDAw
MDBmCihYRU4pICAwMDAwMDg2NTEwMDAwLTAwMDAwODY1MTdmZmYgdHlwZT03IGF0dHI9MDAwMDAw
MDAwMDAwMDAwZgooWEVOKSAgMDAwMDA4NjUxODAwMC0wMDAwMDg2NTE4ZmZmIHR5cGU9MiBhdHRy
PTAwMDAwMDAwMDAwMDAwMGYKKFhFTikgIDAwMDAwODY1MTkwMDAtMDAwMDA4ODFmZmZmZiB0eXBl
PTcgYXR0cj0wMDAwMDAwMDAwMDAwMDBmCihYRU4pICAwMDAwMDg4MjAwMDAwLTAwMDAwODg1ZThm
ZmYgdHlwZT0yIGF0dHI9MDAwMDAwMDAwMDAwMDAwZgooWEVOKSAgMDAwMDA4ODVlOTAwMC0wMDAw
MDhiYzIzZmZmIHR5cGU9NCBhdHRyPTAwMDAwMDAwMDAwMDAwMGYKKFhFTikgIDAwMDAwOGJjMjQw
MDAtMDAwMDA4YmVjMGZmZiB0eXBlPTcgYXR0cj0wMDAwMDAwMDAwMDAwMDBmCihYRU4pICAwMDAw
MDhiZWMxMDAwLTAwMDAwOGMyMjNmZmYgdHlwZT0zIGF0dHI9MDAwMDAwMDAwMDAwMDAwZgooWEVO
KSAgMDAwMDA4YzIyNDAwMC0wMDAwMDhjNTI3ZmZmIHR5cGU9MCBhdHRyPTAwMDAwMDAwMDAwMDAw
MGYKKFhFTikgIDAwMDAwOGM1MjgwMDAtMDAwMDA4YzczNWZmZiB0eXBlPTcgYXR0cj0wMDAwMDAw
MDAwMDAwMDBmCihYRU4pICAwMDAwMDhjNzM2MDAwLTAwMDAwOGNlYTZmZmYgdHlwZT0xMCBhdHRy
PTAwMDAwMDAwMDAwMDAwMGYKKFhFTikgIDAwMDAwOGNlYTcwMDAtMDAwMDA4ZDI5ZmZmZiB0eXBl
PTYgYXR0cj04MDAwMDAwMDAwMDAwMDBmCihYRU4pICAwMDAwMDhkMmEwMDAwLTAwMDAwOGQyZmVm
ZmYgdHlwZT01IGF0dHI9ODAwMDAwMDAwMDAwMDAwZgooWEVOKSAgMDAwMDA4ZDJmZjAwMC0wMDAw
MDhkMmZmZmZmIHR5cGU9NCBhdHRyPTAwMDAwMDAwMDAwMDAwMGYKKFhFTikgIDAwMDAxMDAwMDAw
MDAtMDAwMDE2ZGZmZmZmZiB0eXBlPTcgYXR0cj0wMDAwMDAwMDAwMDAwMDBmCihYRU4pICAwMDAw
MDhkMzAwMDAwLTAwMDAwOGQzZmZmZmYgdHlwZT0wIGF0dHI9MDAwMDAwMDAwMDAwMDAwMAooWEVO
KSAgMDAwMDBlMDAwMDAwMC0wMDAwMGVmZmZmZmZmIHR5cGU9MTEgYXR0cj04MDAwMDAwMDAwMDAw
MDAxCihYRU4pICAwMDAwMGZlMDAwMDAwLTAwMDAwZmUwMTBmZmYgdHlwZT0xMSBhdHRyPTgwMDAw
MDAwMDAwMDAwMDEKKFhFTikgIDAwMDAwZmVjMDAwMDAtMDAwMDBmZWMwMGZmZiB0eXBlPTExIGF0
dHI9ODAwMDAwMDAwMDAwMDAwMQooWEVOKSAgMDAwMDBmZWUwMDAwMC0wMDAwMGZlZTAwZmZmIHR5
cGU9MTEgYXR0cj04MDAwMDAwMDAwMDAwMDAxCihYRU4pICAwMDAwMGZmMDAwMDAwLTAwMDAwZmZm
ZmZmZmYgdHlwZT0xMSBhdHRyPTgwMDAwMDAwMDAwMDAwMDEKKFhFTikgYWx0IHRhYmxlIGZmZmY4
MmQwODA0NzkxYjAgLT4gZmZmZjgyZDA4MDQ4NzFjYwooWEVOKSBzcHVyaW91cyA4MjU5QSBpbnRl
cnJ1cHQ6IElSUTcuCihYRU4pIEludGVsIFZULWQgaW9tbXUgMCBzdXBwb3J0ZWQgcGFnZSBzaXpl
czogNGtCLCAyTUIsIDFHQgooWEVOKSBJbnRlbCBWVC1kIGlvbW11IDEgc3VwcG9ydGVkIHBhZ2Ug
c2l6ZXM6IDRrQiwgMk1CLCAxR0IKKFhFTikgSW50ZWwgVlQtZCBTbm9vcCBDb250cm9sIG5vdCBl
bmFibGVkLgooWEVOKSBJbnRlbCBWVC1kIERvbTAgRE1BIFBhc3N0aHJvdWdoIG5vdCBlbmFibGVk
LgooWEVOKSBJbnRlbCBWVC1kIFF1ZXVlZCBJbnZhbGlkYXRpb24gZW5hYmxlZC4KKFhFTikgSW50
ZWwgVlQtZCBJbnRlcnJ1cHQgUmVtYXBwaW5nIGVuYWJsZWQuCihYRU4pIEludGVsIFZULWQgUG9z
dGVkIEludGVycnVwdCBub3QgZW5hYmxlZC4KKFhFTikgSW50ZWwgVlQtZCBTaGFyZWQgRVBUIHRh
YmxlcyBlbmFibGVkLgooWEVOKSBJL08gdmlydHVhbGlzYXRpb24gZW5hYmxlZAooWEVOKSAgLSBE
b20wIG1vZGU6IFJlbGF4ZWQKKFhFTikgSW50ZXJydXB0IHJlbWFwcGluZyBlbmFibGVkCihYRU4p
IG5yX3NvY2tldHM6IDEKKFhFTikgRW5hYmxlZCBkaXJlY3RlZCBFT0kgd2l0aCBpb2FwaWNfYWNr
X29sZCBvbiEKKFhFTikgRU5BQkxJTkcgSU8tQVBJQyBJUlFzCihYRU4pICAtPiBVc2luZyBvbGQg
QUNLIG1ldGhvZAooWEVOKSAuLlRJTUVSOiB2ZWN0b3I9MHhGMCBhcGljMT0wIHBpbjE9MiBhcGlj
Mj0wIHBpbjI9MAooWEVOKSBUU0NfREVBRExJTkUgZGlzYWJsZWQgZHVlIHRvIEVycmF0YTsgcGxl
YXNlIHVwZGF0ZSBtaWNyb2NvZGUgdG8gdmVyc2lvbiAweGIyIChvciBsYXRlcikKKFhFTikgQWxs
b2NhdGVkIGNvbnNvbGUgcmluZyBvZiAzMiBLaUIuCihYRU4pIG13YWl0LWlkbGU6IE1XQUlUIHN1
YnN0YXRlczogMHgxMTE0MjEyMAooWEVOKSBtd2FpdC1pZGxlOiB2MC40LjEgbW9kZWwgMHg0ZQoo
WEVOKSBtd2FpdC1pZGxlOiBsYXBpY190aW1lcl9yZWxpYWJsZV9zdGF0ZXMgMHhmZmZmZmZmZgoo
WEVOKSBWTVg6IFN1cHBvcnRlZCBhZHZhbmNlZCBmZWF0dXJlczoKKFhFTikgIC0gQVBJQyBNTUlP
IGFjY2VzcyB2aXJ0dWFsaXNhdGlvbgooWEVOKSAgLSBBUElDIFRQUiBzaGFkb3cKKFhFTikgIC0g
RXh0ZW5kZWQgUGFnZSBUYWJsZXMgKEVQVCkKKFhFTikgIC0gVmlydHVhbC1Qcm9jZXNzb3IgSWRl
bnRpZmllcnMgKFZQSUQpCihYRU4pICAtIFZpcnR1YWwgTk1JCihYRU4pICAtIE1TUiBkaXJlY3Qt
YWNjZXNzIGJpdG1hcAooWEVOKSAgLSBVbnJlc3RyaWN0ZWQgR3Vlc3QKKFhFTikgIC0gVk1DUyBz
aGFkb3dpbmcKKFhFTikgIC0gVk0gRnVuY3Rpb25zCihYRU4pICAtIFZpcnR1YWxpc2F0aW9uIEV4
Y2VwdGlvbnMKKFhFTikgIC0gUGFnZSBNb2RpZmljYXRpb24gTG9nZ2luZwooWEVOKSBIVk06IEFT
SURzIGVuYWJsZWQuCihYRU4pIEhWTTogVk1YIGVuYWJsZWQKKFhFTikgSFZNOiBIYXJkd2FyZSBB
c3Npc3RlZCBQYWdpbmcgKEhBUCkgZGV0ZWN0ZWQKKFhFTikgSFZNOiBIQVAgcGFnZSBzaXplczog
NGtCLCAyTUIsIDFHQgooWEVOKSBhbHQgdGFibGUgZmZmZjgyZDA4MDQ3OTFiMCAtPiBmZmZmODJk
MDgwNDg3MWNjCihYRU4pIEJyb3VnaHQgdXAgMiBDUFVzCihYRU4pIFBhcmtlZCAyIENQVXMKKFhF
TikgQWRkaW5nIGNwdSAwIHRvIHJ1bnF1ZXVlIDAKKFhFTikgIEZpcnN0IGNwdSBvbiBydW5xdWV1
ZSwgYWN0aXZhdGluZwooWEVOKSBBZGRpbmcgY3B1IDIgdG8gcnVucXVldWUgMAooWEVOKSBSdW5u
aW5nIHN0dWIgcmVjb3Zlcnkgc2VsZnRlc3RzLi4uCihYRU4pIHRyYXBzLmM6MTU4OTogR1BGICgw
MDAwKTogZmZmZjgyZDBiZmZmZjA0MSBbZmZmZjgyZDBiZmZmZjA0MV0gLT4gZmZmZjgyZDA4MDM4
ODNmMwooWEVOKSB0cmFwcy5jOjc4NDogVHJhcCAxMjogZmZmZjgyZDBiZmZmZjA0MCBbZmZmZjgy
ZDBiZmZmZjA0MF0gLT4gZmZmZjgyZDA4MDM4ODNmMwooWEVOKSB0cmFwcy5jOjExMjM6IFRyYXAg
MzogZmZmZjgyZDBiZmZmZjA0MSBbZmZmZjgyZDBiZmZmZjA0MV0gLT4gZmZmZjgyZDA4MDM4ODNm
MwooWEVOKSBtY2hlY2tfcG9sbDogTWFjaGluZSBjaGVjayBwb2xsaW5nIHRpbWVyIHN0YXJ0ZWQu
CihYRU4pIERvbTAgaGFzIG1heGltdW0gMzEyIFBJUlFzCihYRU4pIE5YIChFeGVjdXRlIERpc2Fi
bGUpIHByb3RlY3Rpb24gYWN0aXZlCihYRU4pICoqKiBCdWlsZGluZyBhIFBWIERvbTAgKioqCihY
RU4pIEVMRjogcGhkcjogcGFkZHI9MHgxMDAwMDAwIG1lbXN6PTB4MTEwMjAwMAooWEVOKSBFTEY6
IHBoZHI6IHBhZGRyPTB4MjIwMDAwMCBtZW1zej0weDQ4ODAwMAooWEVOKSBFTEY6IHBoZHI6IHBh
ZGRyPTB4MjY4ODAwMCBtZW1zej0weDIzMTE4CihYRU4pIEVMRjogcGhkcjogcGFkZHI9MHgyNmFj
MDAwIG1lbXN6PTB4MzgwMDAwCihYRU4pIEVMRjogbWVtb3J5OiAweDEwMDAwMDAgLT4gMHgyYTJj
MDAwCihYRU4pIEVMRjogbm90ZTogR1VFU1RfT1MgPSAibGludXgiCihYRU4pIEVMRjogbm90ZTog
R1VFU1RfVkVSU0lPTiA9ICIyLjYiCihYRU4pIEVMRjogbm90ZTogWEVOX1ZFUlNJT04gPSAieGVu
LTMuMCIKKFhFTikgRUxGOiBub3RlOiBWSVJUX0JBU0UgPSAweGZmZmZmZmZmODAwMDAwMDAKKFhF
TikgRUxGOiBub3RlOiBJTklUX1AyTSA9IDB4ODAwMDAwMDAwMAooWEVOKSBFTEY6IG5vdGU6IEVO
VFJZID0gMHhmZmZmZmZmZjgyNmFjMTgwCihYRU4pIEVMRjogbm90ZTogSFlQRVJDQUxMX1BBR0Ug
PSAweGZmZmZmZmZmODEwMDEwMDAKKFhFTikgRUxGOiBub3RlOiBGRUFUVVJFUyA9ICIhd3JpdGFi
bGVfcGFnZV90YWJsZXN8cGFlX3BnZGlyX2Fib3ZlXzRnYiIKKFhFTikgRUxGOiBub3RlOiBTVVBQ
T1JURURfRkVBVFVSRVMgPSAweDg4MDEKKFhFTikgRUxGOiBub3RlOiBQQUVfTU9ERSA9ICJ5ZXMi
CihYRU4pIEVMRjogbm90ZTogTE9BREVSID0gImdlbmVyaWMiCihYRU4pIEVMRjogbm90ZTogdW5r
bm93biAoMHhkKQooWEVOKSBFTEY6IG5vdGU6IFNVU1BFTkRfQ0FOQ0VMID0gMHgxCihYRU4pIEVM
Rjogbm90ZTogTU9EX1NUQVJUX1BGTiA9IDB4MQooWEVOKSBFTEY6IG5vdGU6IEhWX1NUQVJUX0xP
VyA9IDB4ZmZmZjgwMDAwMDAwMDAwMAooWEVOKSBFTEY6IG5vdGU6IFBBRERSX09GRlNFVCA9IDAK
KFhFTikgRUxGOiBub3RlOiBQSFlTMzJfRU5UUlkgPSAweDEwMDAzNDAKKFhFTikgRUxGOiBGb3Vu
ZCBQVkggaW1hZ2UKKFhFTikgRUxGOiBhZGRyZXNzZXM6CihYRU4pICAgICB2aXJ0X2Jhc2UgICAg
ICAgID0gMHhmZmZmZmZmZjgwMDAwMDAwCihYRU4pICAgICBlbGZfcGFkZHJfb2Zmc2V0ID0gMHgw
CihYRU4pICAgICB2aXJ0X29mZnNldCAgICAgID0gMHhmZmZmZmZmZjgwMDAwMDAwCihYRU4pICAg
ICB2aXJ0X2tzdGFydCAgICAgID0gMHhmZmZmZmZmZjgxMDAwMDAwCihYRU4pICAgICB2aXJ0X2tl
bmQgICAgICAgID0gMHhmZmZmZmZmZjgyYTJjMDAwCihYRU4pICAgICB2aXJ0X2VudHJ5ICAgICAg
ID0gMHhmZmZmZmZmZjgyNmFjMTgwCihYRU4pICAgICBwMm1fYmFzZSAgICAgICAgID0gMHg4MDAw
MDAwMDAwCihYRU4pICBYZW4gIGtlcm5lbDogNjQtYml0LCBsc2IsIGNvbXBhdDMyCihYRU4pICBE
b20wIGtlcm5lbDogNjQtYml0LCBQQUUsIGxzYiwgcGFkZHIgMHgxMDAwMDAwIC0+IDB4MmEyYzAw
MAooWEVOKSBQSFlTSUNBTCBNRU1PUlkgQVJSQU5HRU1FTlQ6CihYRU4pICBEb20wIGFsbG9jLjog
ICAwMDAwMDAwMTY0MDAwMDAwLT4wMDAwMDAwMTY4MDAwMDAwICgyNDU3NjAgcGFnZXMgdG8gYmUg
YWxsb2NhdGVkKQooWEVOKSBWSVJUVUFMIE1FTU9SWSBBUlJBTkdFTUVOVDoKKFhFTikgIExvYWRl
ZCBrZXJuZWw6IGZmZmZmZmZmODEwMDAwMDAtPmZmZmZmZmZmODJhMmMwMDAKKFhFTikgIEluaXQu
IHJhbWRpc2s6IDAwMDAwMDAwMDAwMDAwMDAtPjAwMDAwMDAwMDAwMDAwMDAKKFhFTikgIFBoeXMt
TWFjaCBtYXA6IDAwMDAwMDgwMDAwMDAwMDAtPjAwMDAwMDgwMDAyMDAwMDAKKFhFTikgIFN0YXJ0
IGluZm86ICAgIGZmZmZmZmZmODJhMmMwMDAtPmZmZmZmZmZmODJhMmM0YjgKKFhFTikgIFhlbnN0
b3JlIHJpbmc6IDAwMDAwMDAwMDAwMDAwMDAtPjAwMDAwMDAwMDAwMDAwMDAKKFhFTikgIENvbnNv
bGUgcmluZzogIDAwMDAwMDAwMDAwMDAwMDAtPjAwMDAwMDAwMDAwMDAwMDAKKFhFTikgIFBhZ2Ug
dGFibGVzOiAgIGZmZmZmZmZmODJhMmQwMDAtPmZmZmZmZmZmODJhNDYwMDAKKFhFTikgIEJvb3Qg
c3RhY2s6ICAgIGZmZmZmZmZmODJhNDYwMDAtPmZmZmZmZmZmODJhNDcwMDAKKFhFTikgIFRPVEFM
OiAgICAgICAgIGZmZmZmZmZmODAwMDAwMDAtPmZmZmZmZmZmODJjMDAwMDAKKFhFTikgIEVOVFJZ
IEFERFJFU1M6IGZmZmZmZmZmODI2YWMxODAKKFhFTikgRG9tMCBoYXMgbWF4aW11bSAxIFZDUFVz
CihYRU4pIEVMRjogcGhkciAwIGF0IDB4ZmZmZmZmZmY4MTAwMDAwMCAtPiAweGZmZmZmZmZmODIx
MDIwMDAKKFhFTikgRUxGOiBwaGRyIDEgYXQgMHhmZmZmZmZmZjgyMjAwMDAwIC0+IDB4ZmZmZmZm
ZmY4MjY4ODAwMAooWEVOKSBFTEY6IHBoZHIgMiBhdCAweGZmZmZmZmZmODI2ODgwMDAgLT4gMHhm
ZmZmZmZmZjgyNmFiMTE4CihYRU4pIEVMRjogcGhkciAzIGF0IDB4ZmZmZmZmZmY4MjZhYzAwMCAt
PiAweGZmZmZmZmZmODI4MWIwMDAKKFhFTikgQm9ndXMgRE1JQkFSIDB4ZmVkMTgwMDEgb24gMDAw
MDowMDowMC4wCihYRU4pIEluaXRpYWwgbG93IG1lbW9yeSB2aXJxIHRocmVzaG9sZCBzZXQgYXQg
MHg0MDAwIHBhZ2VzLgooWEVOKSBTY3J1YmJpbmcgRnJlZSBSQU0gaW4gYmFja2dyb3VuZAooWEVO
KSBTdGQuIExvZ2xldmVsOiBBbGwKKFhFTikgR3Vlc3QgTG9nbGV2ZWw6IEFsbAooWEVOKSBYZW4g
aXMgcmVsaW5xdWlzaGluZyBWR0EgY29uc29sZS4KKFhFTikgKioqIFNlcmlhbCBpbnB1dCB0byBE
T00wICh0eXBlICdDVFJMLWEnIHRocmVlIHRpbWVzIHRvIHN3aXRjaCBpbnB1dCkKKFhFTikgRnJl
ZWQgNTQwa0IgaW5pdCBtZW1vcnkKKFhFTikgZW11bC1wcml2LW9wLmM6MTExMzpkMHYwIERvbWFp
biBhdHRlbXB0ZWQgV1JNU1IgMDAwMDAwMWIgZnJvbSAweDAwMDAwMDAwZmVlMDBkMDAgdG8gMHgw
MDAwMDAwMGZlZTAwMTAwCihYRU4pIGVtdWwtcHJpdi1vcC5jOjExMTM6ZDB2MCBEb21haW4gYXR0
ZW1wdGVkIFdSTVNSIDAwMDAwMDFiIGZyb20gMHgwMDAwMDAwMGZlZTAwZDAwIHRvIDB4MDAwMDAw
MDBmZWUwMDkwMAooWEVOKSBkMDogRm9yY2luZyB3cml0ZSBlbXVsYXRpb24gb24gTUZOcyBlMDAw
MC1lZmZmZgooWEVOKSBCb2d1cyBETUlCQVIgMHhmZWQxODAwMSBvbiAwMDAwOjAwOjAwLjAKKFhF
TikgUENJIGFkZCBkZXZpY2UgMDAwMDowMDowMC4wCihYRU4pIFBDSSBhZGQgZGV2aWNlIDAwMDA6
MDA6MDIuMAooWEVOKSBQQ0kgYWRkIGRldmljZSAwMDAwOjAwOjA4LjAKKFhFTikgUENJIGFkZCBk
ZXZpY2UgMDAwMDowMDoxNC4wCihYRU4pIFBDSSBhZGQgZGV2aWNlIDAwMDA6MDA6MTQuMgooWEVO
KSBQQ0kgYWRkIGRldmljZSAwMDAwOjAwOjE2LjAKKFhFTikgUENJIGFkZCBkZXZpY2UgMDAwMDow
MDoxNy4wCihYRU4pIFBDSSBhZGQgZGV2aWNlIDAwMDA6MDA6MWMuMAooWEVOKSBQQ0kgYWRkIGRl
dmljZSAwMDAwOjAwOjFjLjUKKFhFTikgUENJIGFkZCBkZXZpY2UgMDAwMDowMDoxZi4wCihYRU4p
IFBDSSBhZGQgZGV2aWNlIDAwMDA6MDA6MWYuMgooWEVOKSBQQ0kgYWRkIGRldmljZSAwMDAwOjAw
OjFmLjMKKFhFTikgUENJIGFkZCBkZXZpY2UgMDAwMDowMDoxZi40CihYRU4pIFBDSSBhZGQgZGV2
aWNlIDAwMDA6MDA6MWYuNgooWEVOKSBQQ0kgYWRkIGRldmljZSAwMDAwOjAxOjAwLjAKKFhFTikg
UENJIGFkZCBkZXZpY2UgMDAwMDowMjowMC4wCihYRU4pIGQwOiBGb3JjaW5nIHJlYWQtb25seSBh
Y2Nlc3MgdG8gTUZOIGZlZDAwCg==
--000000000000f64ceb05976feef5
Content-Type: text/plain; charset="US-ASCII"; name="info.txt"
Content-Disposition: attachment; filename="info.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_k314mph81>
X-Attachment-Id: f_k314mph81

aG9zdCAgICAgICAgICAgICAgICAgICA6IGxpbnV4a2l0LTAwMGJhYmU0ZDBjNQpyZWxlYXNlICAg
ICAgICAgICAgICAgIDogNC4xOS41LWxpbnV4a2l0CnZlcnNpb24gICAgICAgICAgICAgICAgOiAj
MSBTTVAgRnJpIE5vdiAxNSAwMTozMzo1NyBVVEMgMjAxOQptYWNoaW5lICAgICAgICAgICAgICAg
IDogeDg2XzY0Cm5yX2NwdXMgICAgICAgICAgICAgICAgOiAyCm1heF9jcHVfaWQgICAgICAgICAg
ICAgOiAzCm5yX25vZGVzICAgICAgICAgICAgICAgOiAxCmNvcmVzX3Blcl9zb2NrZXQgICAgICAg
OiAyCnRocmVhZHNfcGVyX2NvcmUgICAgICAgOiAxCmNwdV9taHogICAgICAgICAgICAgICAgOiAy
NDk2LjE4MApod19jYXBzICAgICAgICAgICAgICAgIDogYmZlYmZiZmY6NzZmYWYzZmY6MmMxMDA4
MDA6MDAwMDAxMjE6MDAwMDAwMGY6MDA5YzZmYmY6MDAwMDAwMDA6MDAwMDAxMDAKdmlydF9jYXBz
ICAgICAgICAgICAgICA6IHB2IGh2bSBodm1fZGlyZWN0aW8gcHZfZGlyZWN0aW8gaGFwIHNoYWRv
dyBpb21tdV9oYXBfcHRfc2hhcmUKdG90YWxfbWVtb3J5ICAgICAgICAgICA6IDQwMDMKZnJlZV9t
ZW1vcnkgICAgICAgICAgICA6IDI5MTEKc2hhcmluZ19mcmVlZF9tZW1vcnkgICA6IDAKc2hhcmlu
Z191c2VkX21lbW9yeSAgICA6IDAKb3V0c3RhbmRpbmdfY2xhaW1zICAgICA6IDAKZnJlZV9jcHVz
ICAgICAgICAgICAgICA6IDAKeGVuX21ham9yICAgICAgICAgICAgICA6IDQKeGVuX21pbm9yICAg
ICAgICAgICAgICA6IDEzCnhlbl9leHRyYSAgICAgICAgICAgICAgOiAuMC1yYwp4ZW5fdmVyc2lv
biAgICAgICAgICAgIDogNC4xMy4wLXJjCnhlbl9jYXBzICAgICAgICAgICAgICAgOiB4ZW4tMy4w
LXg4Nl82NCB4ZW4tMy4wLXg4Nl8zMnAgaHZtLTMuMC14ODZfMzIgaHZtLTMuMC14ODZfMzJwIGh2
bS0zLjAteDg2XzY0IAp4ZW5fc2NoZWR1bGVyICAgICAgICAgIDogY3JlZGl0Mgp4ZW5fcGFnZXNp
emUgICAgICAgICAgIDogNDA5NgpwbGF0Zm9ybV9wYXJhbXMgICAgICAgIDogdmlydF9zdGFydD0w
eGZmZmY4MDAwMDAwMDAwMDAKeGVuX2NoYW5nZXNldCAgICAgICAgICA6IAp4ZW5fY29tbWFuZGxp
bmUgICAgICAgIDogZG9tMF9tZW09MTAyNE0sbWF4OjEwMjRNIGRvbTBfbWF4X3ZjcHVzPTEgZG9t
MF92Y3B1c19waW4gc210PWZhbHNlCmNjX2NvbXBpbGVyICAgICAgICAgICAgOiBnY2MgKEFscGlu
ZSA2LjQuMCkgNi40LjAKY2NfY29tcGlsZV9ieSAgICAgICAgICA6IApjY19jb21waWxlX2RvbWFp
biAgICAgIDogCmNjX2NvbXBpbGVfZGF0ZSAgICAgICAgOiBUaHUgTm92IDE0IDA2OjQzOjAxIFVU
QyAyMDE5CmJ1aWxkX2lkICAgICAgICAgICAgICAgOiAzY2Y5ZjczN2U3ZWJjM2M5MjAyNGYzMzU4
MzMwMmJkYWNkMzZiODgzCnhlbmRfY29uZmlnX2Zvcm1hdCAgICAgOiA0Cg==
--000000000000f64ceb05976feef5
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--000000000000f64ceb05976feef5--

