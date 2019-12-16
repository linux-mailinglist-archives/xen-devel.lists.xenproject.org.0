Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58369121ABB
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 21:16:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igwjV-0004Gu-Py; Mon, 16 Dec 2019 20:12:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fawy=2G=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1igwjU-0004Go-Aw
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 20:12:44 +0000
X-Inumbo-ID: 6b349c22-2040-11ea-a914-bc764e2007e4
Received: from mail-qk1-x72d.google.com (unknown [2607:f8b0:4864:20::72d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6b349c22-2040-11ea-a914-bc764e2007e4;
 Mon, 16 Dec 2019 20:12:43 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id u5so5583368qkf.8
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2019 12:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=jnIchVrq53Ev60LUdNTp4NCq92DKpL1vEAesgRZA9dI=;
 b=K56+8EXAQCkDwk1KAufeTrySTWTks2t6sQ2FRK3NSNXCqUjyYwtgfmlL0EL59Xacp7
 2NoPX3GDcyBcVKEoHUU627f8FU3abD7ZEsn6lsYYtyvQxsT+cBxTJ8gXhYF/LFlxGhnf
 7WNzM5bdhpkDoSg/wJd8nx1YtExdwok8MfcMVQzGyJT+rBXv1l52VAbdY8Xb3Z+WoEtd
 SfcbqgkPJng7GTTgj6L9XSDByrZy6tM34ZdjfLhB2BK2sz3AdrdSy16VmVtI6B6y1pBS
 XsbyV95n2iDiSUS9chAkW2oHCadOJ6i+ckIq7uWmg6zhRWRsq4/96/yB6Wl7lf2MQowm
 SmZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=jnIchVrq53Ev60LUdNTp4NCq92DKpL1vEAesgRZA9dI=;
 b=tWv4ERvNcZDcxu9uMcYtZ0PLV+UcJnZKULsbAtKPP/xrV/jXJP+wCNXGSARR+uFS3D
 HZ9rLm2Fcihk2hbaVnXBcLB7sKq5iQ2EHtqL8TMWWaSic81Dw8sYlprCM6EKZCfirzXi
 FpOBQiUMbNpjG0wfE436oh6ZWXFevaCA/pms35MXOEEkW/7xnqGedpiL7owyhyscgjA/
 RChti0a5OZmiZqGjykxFM/Cnw1H9Ul+ofMuuJIm38k5sNj+JXXCQO6jNiNUNv6r4YsYx
 osi/xOYCZLVQBS26o9JKw8YRNNFupVlrOBvvonZcN2pXoOWPGqbmYgIaoWGfIwI1y313
 uQig==
X-Gm-Message-State: APjAAAVJuLNb8b/R+4nwdle5mHXU7UQLyj3Hmxs0Em1TdsXpi0y1e6NV
 GFuTU1pycnS2DHnZxxVPZyXCqpgbDJSujWxxuvfhBlVJJI0=
X-Google-Smtp-Source: APXvYqyRX19tFp9u50IQeJPfcWuKimVBHwAbrhpiHswhpIgpHl2gOq3xSsMeitiUkBcNX4isPXuZ8NJPHshNeBr2OW0=
X-Received: by 2002:a37:c57:: with SMTP id 84mr1178141qkm.157.1576527162861;
 Mon, 16 Dec 2019 12:12:42 -0800 (PST)
MIME-Version: 1.0
From: Roman Shaposhnik <roman@zededa.com>
Date: Mon, 16 Dec 2019 12:12:31 -0800
Message-ID: <CAMmSBy8Zh00tebTvz=__GDv478++b-2t4248YnkH0W9DVgqKbw@mail.gmail.com>
To: xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="00000000000085a7fc0599d7d52f"
Subject: [Xen-devel] REGRESSION: Xen 4.13 RC5 fails to bootstrap Dom0 on ARM
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--00000000000085a7fc0599d7d52f
Content-Type: text/plain; charset="UTF-8"

Hi!

it appears that something has broken in 4.13 RC5 so that
I'm now getting the following on ARM (full logs are attached).

(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) Failed to allocate requested dom0 memory. 672MB unallocated
(XEN) ****************************************

My GRUB boot sequence hasn't changed:

xen_hypervisor /boot/xen.efi console=dtuart   dom0_mem=1024M,max:1024M
dom0_max_vcpus=1 dom0_vcpus_pin
xen_module /boot/kernel console=hvc0 root=(hd1,gpt1)/rootfs.img text
devicetree (hd1,gpt4)/eve.dtb
xen_module (hd1,gpt1)/initrd.img

In fact, if I use Xen 4.12 instead of 4.13 -- everything seems to work
as it used to.

Thanks,
Roman.

--00000000000085a7fc0599d7d52f
Content-Type: text/plain; charset="US-ASCII"; name="log.txt"
Content-Disposition: attachment; filename="log.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_k48vjjil0>
X-Attachment-Id: f_k48vjjil0

VXNpbmcgbW9kdWxlcyBwcm92aWRlZCBieSBib290bG9hZGVyIGluIEZEVApYZW4gNC4xMy4wLXJj
IChjL3MgKSBFRkkgbG9hZGVyCiBYZW4gNC4xMy4wLXJjCihYRU4pIFhlbiB2ZXJzaW9uIDQuMTMu
MC1yYyAoQCkgKGdjYyAoQWxwaW5lIDYuNC4wKSA2LjQuMCkgZGVidWc9eSAgRnJpIERlYyAgMTYg
MDc6Mjk6MTAgVVRDIDIwMTkKKFhFTikgTGF0ZXN0IENoYW5nZVNldDoKKFhFTikgYnVpbGQtaWQ6
IGJmMmU1ZGRlOGRmODE5OTIzMGExYjBhMjVmYjhmMjIwYmUzNzE0YTAKKFhFTikgUHJvY2Vzc29y
OiA0MTBmZDAzMzogIkFSTSBMaW1pdGVkIiwgdmFyaWFudDogMHgwLCBwYXJ0IDB4ZDAzLCByZXYg
MHgzCihYRU4pIDY0LWJpdCBFeGVjdXRpb246CihYRU4pICAgUHJvY2Vzc29yIEZlYXR1cmVzOiAw
MDAwMDAwMDAwMDAyMjIyIDAwMDAwMDAwMDAwMDAwMDAKKFhFTikgICAgIEV4Y2VwdGlvbiBMZXZl
bHM6IEVMMzo2NCszMiBFTDI6NjQrMzIgRUwxOjY0KzMyIEVMMDo2NCszMgooWEVOKSAgICAgRXh0
ZW5zaW9uczogRmxvYXRpbmdQb2ludCBBZHZhbmNlZFNJTUQKKFhFTikgICBEZWJ1ZyBGZWF0dXJl
czogMDAwMDAwMDAxMDMwNTEwNiAwMDAwMDAwMDAwMDAwMDAwCihYRU4pICAgQXV4aWxpYXJ5IEZl
YXR1cmVzOiAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAKKFhFTikgICBNZW1vcnkg
TW9kZWwgRmVhdHVyZXM6IDAwMDAwMDAwMDAwMDExMjIgMDAwMDAwMDAwMDAwMDAwMAooWEVOKSAg
IElTQSBGZWF0dXJlczogIDAwMDAwMDAwMDAwMTExMjAgMDAwMDAwMDAwMDAwMDAwMAooWEVOKSAz
Mi1iaXQgRXhlY3V0aW9uOgooWEVOKSAgIFByb2Nlc3NvciBGZWF0dXJlczogMDAwMDAxMzE6MDAw
MTEwMTEKKFhFTikgICAgIEluc3RydWN0aW9uIFNldHM6IEFBcmNoMzIgQTMyIFRodW1iIFRodW1i
LTIgSmF6ZWxsZQooWEVOKSAgICAgRXh0ZW5zaW9uczogR2VuZXJpY1RpbWVyIFNlY3VyaXR5CihY
RU4pICAgRGVidWcgRmVhdHVyZXM6IDAzMDEwMDY2CihYRU4pICAgQXV4aWxpYXJ5IEZlYXR1cmVz
OiAwMDAwMDAwMAooWEVOKSAgIE1lbW9yeSBNb2RlbCBGZWF0dXJlczogMTAxMDExMDUgNDAwMDAw
MDAgMDEyNjAwMDAgMDIxMDIyMTEKKFhFTikgIElTQSBGZWF0dXJlczogMDIxMDExMTAgMTMxMTIx
MTEgMjEyMzIwNDIgMDExMTIxMzEgMDAwMTExNDIgMDAwMTExMjEKKFhFTikgVXNpbmcgU01DIENh
bGxpbmcgQ29udmVudGlvbiB2MS4wCihYRU4pIFVzaW5nIFBTQ0kgdjEuMAooWEVOKSBTTVA6IEFs
bG93aW5nIDggQ1BVcwooWEVOKSBHZW5lcmljIFRpbWVyIElSUTogcGh5cz0zMCBoeXA9MjYgdmly
dD0yNyBGcmVxOiAxMjAwIEtIegooWEVOKSBHSUN2MiBpbml0aWFsaXphdGlvbjoKKFhFTikgICAg
ICAgICBnaWNfZGlzdF9hZGRyPTAwMDAwMDAwZjY4MDEwMDAKKFhFTikgICAgICAgICBnaWNfY3B1
X2FkZHI9MDAwMDAwMDBmNjgwMjAwMAooWEVOKSAgICAgICAgIGdpY19oeXBfYWRkcj0wMDAwMDAw
MGY2ODA0MDAwCihYRU4pICAgICAgICAgZ2ljX3ZjcHVfYWRkcj0wMDAwMDAwMGY2ODA2MDAwCihY
RU4pICAgICAgICAgZ2ljX21haW50ZW5hbmNlX2lycT0yNQooWEVOKSBHSUN2MjogMTYwIGxpbmVz
LCA4IGNwdXMsIHNlY3VyZSAoSUlEIDAyMDAxNDNiKS4KKFhFTikgWFNNIEZyYW1ld29yayB2MS4w
LjAgaW5pdGlhbGl6ZWQKKFhFTikgSW5pdGlhbGlzaW5nIFhTTSBTSUxPIG1vZGUKKFhFTikgVXNp
bmcgc2NoZWR1bGVyOiBTTVAgQ3JlZGl0IFNjaGVkdWxlciByZXYyIChjcmVkaXQyKQooWEVOKSBJ
bml0aWFsaXppbmcgQ3JlZGl0MiBzY2hlZHVsZXIKKFhFTikgIGxvYWRfcHJlY2lzaW9uX3NoaWZ0
OiAxOAooWEVOKSAgbG9hZF93aW5kb3dfc2hpZnQ6IDMwCihYRU4pICB1bmRlcmxvYWRfYmFsYW5j
ZV90b2xlcmFuY2U6IDAKKFhFTikgIG92ZXJsb2FkX2JhbGFuY2VfdG9sZXJhbmNlOiAtMwooWEVO
KSAgcnVucXVldWVzIGFycmFuZ2VtZW50OiBzb2NrZXQKKFhFTikgIGNhcCBlbmZvcmNlbWVudCBn
cmFudWxhcml0eTogMTBtcwooWEVOKSBsb2FkIHRyYWNraW5nIHdpbmRvdyBsZW5ndGggMTA3Mzc0
MTgyNCBucwooWEVOKSBBbGxvY2F0ZWQgY29uc29sZSByaW5nIG9mIDY0IEtpQi4KKFhFTikgQ1BV
MDogR3Vlc3QgYXRvbWljcyB3aWxsIHRyeSAxMCB0aW1lcyBiZWZvcmUgcGF1c2luZyB0aGUgZG9t
YWluCihYRU4pIEJyaW5naW5nIHVwIENQVTEKKFhFTikgQ1BVMTogR3Vlc3QgYXRvbWljcyB3aWxs
IHRyeSAyMyB0aW1lcyBiZWZvcmUgcGF1c2luZyB0aGUgZG9tYWluCihYRU4pIENQVSAxIGJvb3Rl
ZC4KKFhFTikgQnJpbmdpbmcgdXAgQ1BVMgooWEVOKSBDUFUyOiBHdWVzdCBhdG9taWNzIHdpbGwg
dHJ5IDIyIHRpbWVzIGJlZm9yZSBwYXVzaW5nIHRoZSBkb21haW4KKFhFTikgQ1BVIDIgYm9vdGVk
LgooWEVOKSBCcmluZ2luZyB1cCBDUFUzCihYRU4pIENQVTM6IEd1ZXN0IGF0b21pY3Mgd2lsbCB0
cnkgMTggdGltZXMgYmVmb3JlIHBhdXNpbmcgdGhlIGRvbWFpbgooWEVOKSBDUFUgMyBib290ZWQu
CihYRU4pIEJyaW5naW5nIHVwIENQVTQKKFhFTikgQ1BVNDogR3Vlc3QgYXRvbWljcyB3aWxsIHRy
eSAyMSB0aW1lcyBiZWZvcmUgcGF1c2luZyB0aGUgZG9tYWluCihYRU4pIENQVSA0IGJvb3RlZC4K
KFhFTikgQnJpbmdpbmcgdXAgQ1BVNQooWEVOKSBDUFU1OiBHdWVzdCBhdG9taWNzIHdpbGwgdHJ5
IDIwIHRpbWVzIGJlZm9yZSBwYXVzaW5nIHRoZSBkb21haW4KKFhFTikgQ1BVIDUgYm9vdGVkLgoo
WEVOKSBCcmluZ2luZyB1cCBDUFU2CihYRU4pIENQVTY6IEd1ZXN0IGF0b21pY3Mgd2lsbCB0cnkg
MTggdGltZXMgYmVmb3JlIHBhdXNpbmcgdGhlIGRvbWFpbgooWEVOKSBDUFUgNiBib290ZWQuCihY
RU4pIEJyaW5naW5nIHVwIENQVTcKKFhFTikgQ1BVNzogR3Vlc3QgYXRvbWljcyB3aWxsIHRyeSAx
NyB0aW1lcyBiZWZvcmUgcGF1c2luZyB0aGUgZG9tYWluCihYRU4pIEJyb3VnaHQgdXAgOCBDUFVz
CihYRU4pIENQVSA3IGJvb3RlZC4KKFhFTikgSS9PIHZpcnR1YWxpc2F0aW9uIGRpc2FibGVkCihY
RU4pIFAyTTogNDAtYml0IElQQSB3aXRoIDQwLWJpdCBQQSBhbmQgOC1iaXQgVk1JRAooWEVOKSBQ
Mk06IDMgbGV2ZWxzIHdpdGggb3JkZXItMSByb290LCBWVENSIDB4ODAwMjM1NTgKKFhFTikgQWRk
aW5nIGNwdSAwIHRvIHJ1bnF1ZXVlIDAKKFhFTikgIEZpcnN0IGNwdSBvbiBydW5xdWV1ZSwgYWN0
aXZhdGluZwooWEVOKSBBZGRpbmcgY3B1IDEgdG8gcnVucXVldWUgMAooWEVOKSBBZGRpbmcgY3B1
IDIgdG8gcnVucXVldWUgMAooWEVOKSBBZGRpbmcgY3B1IDMgdG8gcnVucXVldWUgMAooWEVOKSBB
ZGRpbmcgY3B1IDQgdG8gcnVucXVldWUgMAooWEVOKSBBZGRpbmcgY3B1IDUgdG8gcnVucXVldWUg
MAooWEVOKSBBZGRpbmcgY3B1IDYgdG8gcnVucXVldWUgMAooWEVOKSBBZGRpbmcgY3B1IDcgdG8g
cnVucXVldWUgMAooWEVOKSBhbHRlcm5hdGl2ZXM6IFBhdGNoaW5nIHdpdGggYWx0IHRhYmxlIDAw
MDAwMDAwMDAyY2MwNjggLT4gMDAwMDAwMDAwMDJjYzc3YwooWEVOKSAqKiogTE9BRElORyBET01B
SU4gMCAqKioKKFhFTikgTG9hZGluZyBkMCBrZXJuZWwgZnJvbSBib290IG1vZHVsZSBAIDAwMDAw
MDAwNDhkMDkwMDAKKFhFTikgQWxsb2NhdGluZyAxOjEgbWFwcGluZ3MgdG90YWxsaW5nIDEwMjRN
QiBmb3IgZG9tMDoKKFhFTikKKFhFTikgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKgooWEVOKSBQYW5pYyBvbiBDUFUgMDoKKFhFTikgRmFpbGVkIHRvIGFsbG9jYXRlIHJl
cXVlc3RlZCBkb20wIG1lbW9yeS4gNjcyTUIgdW5hbGxvY2F0ZWQKKFhFTikgKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKgooWEVOKQooWEVOKSBSZWJvb3QgaW4gZml2ZSBz
ZWNvbmRzLi4uCg==
--00000000000085a7fc0599d7d52f
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--00000000000085a7fc0599d7d52f--

