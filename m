Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A9C400DCD
	for <lists+xen-devel@lfdr.de>; Sun,  5 Sep 2021 04:31:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178869.325001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMhvv-0004xZ-Tw; Sun, 05 Sep 2021 02:30:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178869.325001; Sun, 05 Sep 2021 02:30:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMhvv-0004vs-O2; Sun, 05 Sep 2021 02:30:59 +0000
Received: by outflank-mailman (input) for mailman id 178869;
 Sun, 05 Sep 2021 02:30:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=af6+=N3=unixindia.com=bhasker@srs-us1.protection.inumbo.net>)
 id 1mMhvt-0004vm-OJ
 for xen-devel@lists.xenproject.org; Sun, 05 Sep 2021 02:30:57 +0000
Received: from mail-io1-xd30.google.com (unknown [2607:f8b0:4864:20::d30])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 61eaba39-4c97-49ab-9a2d-50a97823c5c7;
 Sun, 05 Sep 2021 02:30:56 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id b10so4020459ioq.9
 for <xen-devel@lists.xenproject.org>; Sat, 04 Sep 2021 19:30:56 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 61eaba39-4c97-49ab-9a2d-50a97823c5c7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unixindia.com; s=mail;
        h=mime-version:from:date:message-id:subject:to;
        bh=9GhxT6iwrAUFJk5X6XPrE5T9ku0+A2eEn9VbjHQLQIo=;
        b=wD34T0Gvd/G8aM6SWzrcuQIBuyaUkEE5aP2179vfJDvOPiIIEYbEniiZSWqCH7VYcy
         sEE5wMVn1gp7c6rFEiTC7Jd8svNigMfs/8BvnLyFPKvZyYH4iPWu+a2lDcveeMi1NDAX
         rnGA4JMIeko96oI3krWpHZ2npAQuvw1xzlu14cGNveGMQRcKgGun480dONIzkIc/QS5c
         NKdPYTApOsFRxDDeLmO2VN4XZotAxi2BcUBX0lm4FpL26dMShXT5CdCxwP4eLz9yI/AD
         FwWRJ0Ja0iOo4UZPAbZTAMoNJoxW70/ZYcMXz0ZIle06Sosv12kjBjqB7S+A7XbSRz87
         abPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=9GhxT6iwrAUFJk5X6XPrE5T9ku0+A2eEn9VbjHQLQIo=;
        b=WtG97C1xZiMU0klDUrJzDwvj3XEYdhzpCScGsdjhlvVI7LymvqBzwlhWAcml9qI+Uq
         TnPuJiUyC0J1s71c0jvH4tpSfHEuZYlPy7yMXRWkm562H1pFT9yueYlJ4Mw7ljDzKy5j
         vcH0D4R8BXsNO1wTNGQExA8YvKYAuZG/iIkVExhzc4maHuyg0x7RKjZElKnuFyQCi1Vt
         s9PZ73U8lz0ovhTal1iC1txlurLLMvvIfKXtUYsrARYkkgI3h0PB5hGAdW9jPbq10Q8l
         1Qt1uvX3l15cdsVq46YznWN1HxgWK74g9lulk0tMazUmlj/ZwdH90+HpmtGZfgoq2JrV
         bj/Q==
X-Gm-Message-State: AOAM532IwbA/LAVoFxYQgkYAgeVn/hqEh1+AMRUp3eY3NQxZxajkF7zi
	IwSQApI4h/KTblG4LPoflxHt9NWg9HBNklpvnvw3Nv0e8HYBz2CR560=
X-Google-Smtp-Source: ABdhPJwdKE+lU/CkGaWvd3SU3J4iNHihj1Pae38TvnF0g7XLrRJhQ9OIpnsmKu6R3H/ZJowz7UtGLPagw3hxNWODII8=
X-Received: by 2002:a02:1dc9:: with SMTP id 192mr5354954jaj.92.1630809055894;
 Sat, 04 Sep 2021 19:30:55 -0700 (PDT)
MIME-Version: 1.0
From: Bhasker C V <bhasker@unixindia.com>
Date: Sun, 5 Sep 2021 03:30:45 +0100
Message-ID: <CAPLCSGD+Tw3M1GcU6thqE4YiN6bWqJVqwc1YPPL7-rNb63J2pw@mail.gmail.com>
Subject: Pygrub crash when trying to edit kernel commandline
To: xen-users@lists.xenproject.org, xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="0000000000007950e905cb36526c"

--0000000000007950e905cb36526c
Content-Type: multipart/alternative; boundary="0000000000007950e705cb36526a"

--0000000000007950e705cb36526a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi
 When I try to edit kernel command line of domU, pygrub crashes

bcv@bcvibmb1:~$ sudo xl create -c /etc/xen/utils.cfg
Parsing config from /etc/xen/utils.cfg
Using <class 'grub.GrubConf.GrubConfigFile'> to parse /boot/grub/menu.lst

    pyGRUB  version 0.6
 =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
 =E2=94=82 root            (hd0,0)                                         =
       =E2=94=82
 =E2=94=82 kernel          /boot/vmlinuz-4.19.0-17-amd64 root=3D/dev/xvda2 =
ro elev> =E2=94=82
 =E2=94=82 initrd          /boot/initrd.img-4.19.0-17-amd64                =
       =E2=94=82
 =E2=94=82                                                                 =
       =E2=94=82
 =E2=94=82                                                                 =
       =E2=94=82
 =E2=94=82                                                                 =
       =E2=94=82
 =E2=94=82                                                                 =
       =E2=94=82
 =E2=94=82                                                                 =
       =E2=94=82
 =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
     Use the =E2=86=91 and =E2=86=93 keys to select which entry is highligh=
ted.
     Press 'b' to boot, 'e' to edit the selected command in the
     boot sequence, 'c' for a command-line, 'o' to open a new line
     after ('O' for before) the selected line, 'd' to remove the
     selected line, or escape to go back to the main menu.


Traceback (most recent call last):
                                    File "/usr/lib/xen-4.14/bin/pygrub",
line 884, in <module>

                      raise RuntimeError("Unable to find partition
containing kernel")
             RuntimeError: Unable to find partition containing kernel
                                                                     libxl:
error: libxl_bootloader.c:648:bootloader_finished: Domain 4:bootloader
failed - consult logfile /var/log/xen/bootloader.4.log
                                                    libxl: error:
libxl_exec.c:117:libxl_report_child_exitstatus: bootloader [1316] exited
with error status 1
         libxl: error: libxl_create.c:1576:domcreate_rebuild_done: Domain
4:cannot (re-)build domain: -3

                            libxl: error:
libxl_domain.c:1182:libxl__destroy_domid: Domain 4:Non-existant domain
libxl: error: libxl_domain.c:1136:domain_destroy_callback: Domain 4:Unable
to destroy guest
libxl: error: libxl_domain.c:1063:domain_destroy_cb: Domain 4:Destruction
of domain failed
bcv@bcvibmb1:~$


Attached is the log
Am I doing something wrong ? or is this a known issue ?

Thanks
Bhasker C V

--0000000000007950e705cb36526a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdj5IaTwvZGl2PjxkaXY+wqBXaGVuIEkgdHJ5IHRvIGVkaXQga2Vy
bmVsIGNvbW1hbmQgbGluZSBvZiBkb21VLCBweWdydWIgY3Jhc2hlczwvZGl2PjxkaXY+PHNwYW4g
c3R5bGU9ImNvbG9yOnJnYig2MSwxMzMsMTk4KSI+PGJyPjwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFu
IHN0eWxlPSJjb2xvcjpyZ2IoNjEsMTMzLDE5OCkiPmJjdkBiY3ZpYm1iMTp+JCBzdWRvIHhsIGNy
ZWF0ZSAtYyAvZXRjL3hlbi91dGlscy5jZmc8YnI+UGFyc2luZyBjb25maWcgZnJvbSAvZXRjL3hl
bi91dGlscy5jZmc8YnI+VXNpbmcgJmx0O2NsYXNzICYjMzk7Z3J1Yi5HcnViQ29uZi5HcnViQ29u
ZmlnRmlsZSYjMzk7Jmd0OyB0byBwYXJzZSAvYm9vdC9ncnViL21lbnUubHN0PGJyPjxicj7CoCDC
oCBweUdSVUIgwqB2ZXJzaW9uIDAuNjxicj7CoOKUjOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUkDxicj7CoOKUgiByb290IMKgIMKgIMKgIMKgIMKgIMKgKGhk
MCwwKSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoOKUgjxicj7CoOKUgiBrZXJuZWwgwqAgwqAgwqAgwqAgwqAvYm9v
dC92bWxpbnV6LTQuMTkuMC0xNy1hbWQ2NCByb290PS9kZXYveHZkYTIgcm8gZWxldiZndDsg4pSC
PGJyPsKg4pSCIGluaXRyZCDCoCDCoCDCoCDCoCDCoC9ib290L2luaXRyZC5pbWctNC4xOS4wLTE3
LWFtZDY0IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIOKUgjxicj7CoOKUgiDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoOKUgjxicj7CoOKU
giDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoOKUgjxi
cj7CoOKUgiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oOKUgjxicj7CoOKUgiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoOKUgjxicj7CoOKUgiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoOKUgjxicj7CoOKUlOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUmDxicj7CoCDCoCDCoFVzZSB0aGUg4oaRIGFuZCDihpMga2V5cyB0byBz
ZWxlY3Qgd2hpY2ggZW50cnkgaXMgaGlnaGxpZ2h0ZWQuPGJyPsKgIMKgIMKgUHJlc3MgJiMzOTti
JiMzOTsgdG8gYm9vdCwgJiMzOTtlJiMzOTsgdG8gZWRpdCB0aGUgc2VsZWN0ZWQgY29tbWFuZCBp
biB0aGU8YnI+wqAgwqAgwqBib290IHNlcXVlbmNlLCAmIzM5O2MmIzM5OyBmb3IgYSBjb21tYW5k
LWxpbmUsICYjMzk7byYjMzk7IHRvIG9wZW4gYSBuZXcgbGluZTxicj7CoCDCoCDCoGFmdGVyICgm
IzM5O08mIzM5OyBmb3IgYmVmb3JlKSB0aGUgc2VsZWN0ZWQgbGluZSwgJiMzOTtkJiMzOTsgdG8g
cmVtb3ZlIHRoZTxicj7CoCDCoCDCoHNlbGVjdGVkIGxpbmUsIG9yIGVzY2FwZSB0byBnbyBiYWNr
IHRvIHRoZSBtYWluIG1lbnUuPGJyPjxicj48YnI+VHJhY2ViYWNrIChtb3N0IHJlY2VudCBjYWxs
IGxhc3QpOjxicj7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBGaWxlICZxdW90Oy91c3IvbGliL3hlbi00LjE0L2Jpbi9weWdydWImcXVvdDssIGxp
bmUgODg0LCBpbiAmbHQ7bW9kdWxlJmd0Ozxicj7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCByYWlzZSBSdW50aW1lRXJyb3IoJnF1b3Q7VW5hYmxlIHRvIGZpbmQgcGFydGl0aW9uIGNv
bnRhaW5pbmcga2VybmVsJnF1b3Q7KTxicj7CoCDCoCDCoCDCoCDCoCDCoCDCoFJ1bnRpbWVFcnJv
cjogVW5hYmxlIHRvIGZpbmQgcGFydGl0aW9uIGNvbnRhaW5pbmcga2VybmVsPGJyPsKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbGlieGw6IGVycm9yOiBsaWJ4
bF9ib290bG9hZGVyLmM6NjQ4OmJvb3Rsb2FkZXJfZmluaXNoZWQ6IERvbWFpbiA0OmJvb3Rsb2Fk
ZXIgZmFpbGVkIC0gY29uc3VsdCBsb2dmaWxlIC92YXIvbG9nL3hlbi9ib290bG9hZGVyLjQubG9n
PGJyPsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGxpYnhsOiBlcnJvcjogbGlieGxfZXhlYy5jOjExNzps
aWJ4bF9yZXBvcnRfY2hpbGRfZXhpdHN0YXR1czogYm9vdGxvYWRlciBbMTMxNl0gZXhpdGVkIHdp
dGggZXJyb3Igc3RhdHVzIDE8YnI+wqAgwqAgwqAgwqAgwqBsaWJ4bDogZXJyb3I6IGxpYnhsX2Ny
ZWF0ZS5jOjE1NzY6ZG9tY3JlYXRlX3JlYnVpbGRfZG9uZTogRG9tYWluIDQ6Y2Fubm90IChyZS0p
YnVpbGQgZG9tYWluOiAtMzxicj7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBsaWJ4bDogZXJyb3I6IGxpYnhsX2RvbWFpbi5jOjExODI6bGlieGxfX2Rlc3Ryb3lfZG9t
aWQ6IERvbWFpbiA0Ok5vbi1leGlzdGFudCBkb21haW48YnI+bGlieGw6IGVycm9yOiBsaWJ4bF9k
b21haW4uYzoxMTM2OmRvbWFpbl9kZXN0cm95X2NhbGxiYWNrOiBEb21haW4gNDpVbmFibGUgdG8g
ZGVzdHJveSBndWVzdDxicj5saWJ4bDogZXJyb3I6IGxpYnhsX2RvbWFpbi5jOjEwNjM6ZG9tYWlu
X2Rlc3Ryb3lfY2I6IERvbWFpbiA0OkRlc3RydWN0aW9uIG9mIGRvbWFpbiBmYWlsZWQ8YnI+YmN2
QGJjdmlibWIxOn4kwqA8L3NwYW4+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+
PGRpdj48L2Rpdj48ZGl2PkF0dGFjaGVkIGlzIHRoZSBsb2c8L2Rpdj48ZGl2PkFtIEkgZG9pbmcg
c29tZXRoaW5nIHdyb25nID8gb3IgaXMgdGhpcyBhIGtub3duIGlzc3VlID88L2Rpdj48ZGl2Pjxi
cj48L2Rpdj48ZGl2PlRoYW5rczwvZGl2PjxkaXY+Qmhhc2tlciBDIFYgPGJyPjwvZGl2PjwvZGl2
Pg0K
--0000000000007950e705cb36526a--
--0000000000007950e905cb36526c
Content-Type: text/x-log; charset="x-binaryenc"; name="bootloader.4.log"
Content-Disposition: attachment; filename="bootloader.4.log"
Content-Transfer-Encoding: base64
Content-ID: <f_kt6ll68k0>
X-Attachment-Id: f_kt6ll68k0

VXNpbmcgPGNsYXNzICdncnViLkdydWJDb25mLkdydWJDb25maWdGaWxlJz4gdG8gcGFyc2UgL2Jv
b3QvZ3J1Yi9tZW51LmxzdAobKEIbKTAbWzE7MjRyG1ttDxtbPzdoG1s/MWgbPRtbSBtbShtbPzFo
Gz0bWzFCICAgIHB5R1JVQiAgdmVyc2lvbiAwLjYNG1sxQiAbWzBtDmxxcXFxcXFxcXFxcXFxcXFx
cXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFr
Dw0bWzFCIBtbMG0OeA8gG1swOzdtD0RlYmlhbiBHTlUvTGludXgsIGtlcm5lbCA0LjE5LjAtMTct
YW1kNjQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAbW20PIBtbMG0OeA8NG1sxQiAbWzBt
DngPIERlYmlhbiBHTlUvTGludXgsIGtlcm5lbCA0LjE5LjAtMTctYW1kNjQgKHNpbmdsZS11c2Vy
IG1vZGUpG1sxMkMbWzBtDngPDRtbMUIgG1swbQ54DyBEZWJpYW4gR05VL0xpbnV4IDEwG1s1MkMb
WzBtDngPDRtbMUIgG1swbQ54DyBEZWJpYW4gR05VL0xpbnV4IDEwIChTaW5nbGUtVXNlcikbWzM4
QxtbMG0OeA8NG1sxQiAbWzBtDngPIERlYmlhbiBHTlUvTGludXggMTAgKERlZmF1bHQgS2VybmVs
KRtbMzVDG1swbQ54Dw0bWzFCIBtbMG0OeA8gRGViaWFuIEdOVS9MaW51eCAxMCAoRGVmYXVsdCBL
ZXJuZWwsIFNpbmdsZS1Vc2VyKRtbMjJDG1swbQ54Dw0bWzFCIBtbMG0OeA8bWzcyQxtbMG0OeA8N
G1sxQiAbWzBtDngPG1s3MkMbWzBtDngPDRtbMUIgG1swbQ5tcXFxcXFxcXFxcXFxcXFxcXFxcXFx
cXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxcXFxag8bWzFC
G1s3MEQbWzBtDg9Vc2UgdGhlIOKGkSBhbmQg4oaTIGtleXMgdG8gc2VsZWN0IHdoaWNoIGVudHJ5
IGlzIGhpZ2hsaWdodGVkLhtbMUIbWzU4RFByZXNzIGVudGVyIHRvIGJvb3QgdGhlIHNlbGVjdGVk
IE9TLCAnZScgdG8gZWRpdCB0aGUbWzFCG1s1MkRjb21tYW5kcyBiZWZvcmUgYm9vdGluZywgJ2En
IHRvIG1vZGlmeSB0aGUga2VybmVsIGFyZ3VtZW50cxtbMUIbWzU5RGJlZm9yZSBib290aW5nLCBv
ciAnYycgZm9yIGEgY29tbWFuZCBsaW5lLhtbN0EbWzI2QxtbMTJCG1s2OERXaWxsIGJvb3Qgc2Vs
ZWN0ZWQgZW50cnkgaW4gIDIgc2Vjb25kcxtbPzFoGz0NG1tKG1sxMkEbWzczQxtbMTJCG1s2OERX
aWxsIGJvb3Qgc2VsZWN0ZWQgZW50cnkgaW4gIDEgc2Vjb25kcxtbPzFoGz0NG1tKG1sxN0EbWzND
RGViaWFuIEdOVS9MaW51eCwga2VybmVsIDQuMTkuMC0xNy1hbWQ2NCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIBtbMUIbWzcwRBtbMDs3bQ9EZWJpYW4gR05VL0xpbnV4LCBrZXJuZWwgNC4x
OS4wLTE3LWFtZDY0IChzaW5nbGUtdXNlciBtb2RlKSAgICAgICAgICAgG1s0QhtbbQ8bWzEzQhtb
NjhEG1s/MWgbPRtbMThBCAgbWzA7N20PRGViaWFuIEdOVS9MaW51eCwga2VybmVsIDQuMTkuMC0x
Ny1hbWQ2NCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIBtbMUIbWzcwRBtbbQ9EZWJpYW4g
R05VL0xpbnV4LCBrZXJuZWwgNC4xOS4wLTE3LWFtZDY0IChzaW5nbGUtdXNlciBtb2RlKSAgICAg
ICAgICAgG1s0QhtbMTNCG1s2OEQbWz8xaBs9G1sxOEEICBtbMDs3bQ9yb290ICAgICAgICAgICAg
KGhkMCwwKSAgICAgICAgICAgICAgICAgG1sxQhtbNDBEG1ttD2tlcm5lbCAgICAgICAgICAvYm9v
dC92bWxpbnV6LTQuMTkuMC0xNy1hbWQ2NCByb290PS9kZXYveHZkYTIgcm8gZWxldj4bWzFCG1s3
MERpbml0cmQgICAgICAgICAgL2Jvb3QvaW5pdHJkLmltZy00LjE5LjAtMTctYW1kNjQbWzFCG1s0
OEQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAbWzFCG1szM0QgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAbWzFCG1szNkQgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgG1sxNDsxMkgnYicgdG8gYm9vdCwgJ2UnIHRvIGVkaXQg
dGhlIHNlbGVjdGVkIGNvbW1hbmQgaW4gdGhlG1sxQhtbNThEYm9vdCBzZXF1ZW5jZSwgJ2MnIGZv
ciBhIGNvbW1hbmQtbGluZSwgJ28nIHRvIG9wZW4gYSBuZXcgbGluZRtbMUIbWzYxRGFmdGVyICgn
TycgZm9yIGJlZm9yZSkgdGhlIHNlbGVjdGVkIGxpbmUsICdkJyB0byByZW1vdmUgdGhlG1sxQhtb
NTlEc2VsZWN0ZWQgbGluZSwgb3IgZXNjYXBlIHRvIGdvIGJhY2sgdG8gdGhlIG1haW4gbWVudS4b
WzExQRtbMTVDG1s/MWgbPRtbMkEbWzcwRHJvb3QgICAgICAgICAgICAoaGQwLDApICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAbWzFCG1s3MEQbWzA7N20Pa2Vy
bmVsICAgICAgICAgIC9ib290L3ZtbGludXotNC4xOS4wLTE3LWFtZDY0IHJvb3Q9L2Rldi94dmRh
MiBybyBlbGV2PhtbMUIbW20PG1s/MWgbPRtbPzFsGz4bWzI0OzFIDRtbPzFsGz5UcmFjZWJhY2sg
KG1vc3QgcmVjZW50IGNhbGwgbGFzdCk6CiAgRmlsZSAiL3Vzci9saWIveGVuLTQuMTQvYmluL3B5
Z3J1YiIsIGxpbmUgODg0LCBpbiA8bW9kdWxlPgogICAgcmFpc2UgUnVudGltZUVycm9yKCJVbmFi
bGUgdG8gZmluZCBwYXJ0aXRpb24gY29udGFpbmluZyBrZXJuZWwiKQpSdW50aW1lRXJyb3I6IFVu
YWJsZSB0byBmaW5kIHBhcnRpdGlvbiBjb250YWluaW5nIGtlcm5lbAo=
--0000000000007950e905cb36526c--

