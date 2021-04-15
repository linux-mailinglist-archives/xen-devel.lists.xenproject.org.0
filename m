Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C870360B26
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 15:57:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111168.212561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX2Tp-0003MU-CV; Thu, 15 Apr 2021 13:56:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111168.212561; Thu, 15 Apr 2021 13:56:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX2Tp-0003M8-9G; Thu, 15 Apr 2021 13:56:25 +0000
Received: by outflank-mailman (input) for mailman id 111168;
 Thu, 15 Apr 2021 13:56:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LGOb=JM=gmail.com=charles.fg@srs-us1.protection.inumbo.net>)
 id 1lX2Tn-0003M2-Ov
 for xen-devel@lists.xen.org; Thu, 15 Apr 2021 13:56:23 +0000
Received: from mail-wm1-x32b.google.com (unknown [2a00:1450:4864:20::32b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c36663f6-8410-4192-b21e-f5d4e99b6809;
 Thu, 15 Apr 2021 13:56:22 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 t14-20020a05600c198eb029012eeb3edfaeso2320854wmq.2
 for <xen-devel@lists.xen.org>; Thu, 15 Apr 2021 06:56:22 -0700 (PDT)
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
X-Inumbo-ID: c36663f6-8410-4192-b21e-f5d4e99b6809
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=byRvgTFGO9ucYURh1Ie6umYu+Fuaut31wnKr8l4qWTM=;
        b=ndSNjVobAnwoYIIzedy+pEgJF10VGFdyLqgHv3fBgVcjG9xDgSrpV6ngnvdNx6o8Kr
         8MmcLrYja4HfccN55eo7LjpFIDO8QZD15CvP7zz58IEB6QPtqifBLjZnJjWAVDCChrWC
         acpYEj69CuVgZBRwdWLMu4iHltesd5iWC4N/NpIWt/ctva6dOhZj3cR72Gw1z2fVNIHS
         ciAvUhk4ZHPGHNboUgKlyNxYQVKgfBZ2tqjGPn4iCHrh7bG4izQ/JE1HmJgf7EjJiEDT
         qUaOimfOnwzH9VXUNPmd8m+29RCddS7/LCcAaxbFcmdJ0EyFIzMWQ3iMjRs7KbXiPHof
         0UKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=byRvgTFGO9ucYURh1Ie6umYu+Fuaut31wnKr8l4qWTM=;
        b=EjP2xCicRhhQx6myMR75H+rym64gDITxdLeHxc7qUvJhVFIhLaxNu3FUhb/C+MU68/
         JSvtJ/vJdPDNh3/2MuVFZZHOcqyJ/WSAbUE/iljOo4/jmX10m7zNz8bWfSMI5GZi81CZ
         nuTjDG+jIm5ZSYzUkDDZ9hU7EWu+NIkSp+GqU3JpvQMa+9B9MeuZGDLOQv0GbNQ8QAGV
         iKpi5UqG7CV6EodmXD2tFFV3m0X9aDZlVGZFUBogFxz3keajs5pVV4Iach0IgM4jTJyu
         zXuHAKw5ImAQyzX0xeyScKwhxrsDVD7+a9sJswcitxKNbnLJOFT3jnJEaoKmjoZOx1sN
         ej8A==
X-Gm-Message-State: AOAM530GVgMa0NMxT5pEjbxJp/g9RJFjTKrq/YeJn53PGLNrz1vJ3TWF
	KY5CFDyco03WcMaP8PYhW9UgqslbiamSnUpBfueKNr8Dygp/qg==
X-Google-Smtp-Source: ABdhPJwgriCMcbcDpzZdT3UXoMsrOqzlmHyHnS1ge/FCUdBIJCseL/HcjD47aHXwmem/taqyideGtaHLtMvVCMxoKdo=
X-Received: by 2002:a1c:9d90:: with SMTP id g138mr3292521wme.156.1618494981057;
 Thu, 15 Apr 2021 06:56:21 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Charles_Gon=C3=A7alves?= <charles.fg@gmail.com>
Date: Thu, 15 Apr 2021 14:55:45 +0100
Message-ID: <CAAQRGoD4yEEhiQk8LkKuOU_F2As3BsichHNY_ijoiVWwd3JZPw@mail.gmail.com>
Subject: Failed to enable debug messages in xen 4.13
To: xen-devel@lists.xen.org
Content-Type: multipart/alternative; boundary="0000000000006ab15c05c0033add"

--0000000000006ab15c05c0033add
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Guys,

I've enabled the log_lvl=3Dall guest_loglvl=3Dall, tried the xl debug-key +=
,
configured the build with
./configure --enable-debug

Do I miss something?

xl info

                                                      6:15
host                   : xendev
release                : 4.4.0-148-generic
version                : #174~14.04.1-Ubuntu SMP Thu May 9 08:17:37 UTC 201=
9
machine                : x86_64
nr_cpus                : 16
max_cpu_id             : 15
nr_nodes               : 1
cores_per_socket       : 8
threads_per_core       : 2
cpu_mhz                : 2994.413
hw_caps                :
178bf3ff:f6d8320b:2e500800:244033ff:0000000f:209c01a9:00000000:00000500
virt_caps              : pv hvm hvm_directio pv_directio hap shadow
total_memory           : 32699
free_memory            : 28229
sharing_freed_memory   : 0
sharing_used_memory    : 0
outstanding_claims     : 0
free_cpus              : 0
xen_major              : 4
xen_minor              : 13
xen_extra              : .0
xen_version            : 4.13.0
xen_caps               : xen-3.0-x86_64 xen-3.0-x86_32p hvm-3.0-x86_32
hvm-3.0-x86_32p hvm-3.0-x86_64
xen_scheduler          : credit2
xen_pagesize           : 4096
platform_params        : virt_start=3D0xffff800000000000
xen_changeset          : Tue Dec 17 14:19:49 2019 +0000 git:a2e84d8-dirty
xen_commandline        : placeholder dom0_mem=3D2048M,max:2048M log_lvl=3Da=
ll
guest_loglvl=3Dall dom0_max_vcpus=3D2 dom0_vcpus_pin
cc_compiler            : gcc (Ubuntu 7.5.0-3ubuntu1~14.04.1) 7.5.0
cc_compile_by          : root
cc_compile_domain      :
cc_compile_date        : Wed Apr 14 05:13:56 WEST 2021
build_id               : 428bb9223a72819e497d6b06a396034ab3b5280d
xend_config_format     : 4





Atenciosamente,
*Charles Ferreira Gon=C3=A7alves *

--0000000000006ab15c05c0033add
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+SGVsbG8gR3V5cyzCoDxkaXY+PGJyPjwvZGl2PjxkaXY+SSYjMzk7dmUg
ZW5hYmxlZCB0aGXCoGxvZ19sdmw9YWxsIGd1ZXN0X2xvZ2x2bD1hbGwsIHRyaWVkwqB0aGUgDQoN
CnhsIGRlYnVnLWtleSArLCBjb25maWd1cmVkIHRoZSBidWlsZCB3aXRowqA8L2Rpdj48ZGl2Pi4v
Y29uZmlndXJlIC0tZW5hYmxlLWRlYnVnPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5EbyBJIG1p
c3Mgc29tZXRoaW5nPzwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+eGwgaW5mbyDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCA2OjE1PGJyPmhvc3QgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgOiB4ZW5kZXY8YnI+cmVs
ZWFzZSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDogNC40LjAtMTQ4LWdlbmVyaWM8YnI+dmVyc2lv
biDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDogIzE3NH4xNC4wNC4xLVVidW50dSBTTVAgVGh1IE1h
eSA5IDA4OjE3OjM3IFVUQyAyMDE5PGJyPm1hY2hpbmUgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqA6
IHg4Nl82NDxicj5ucl9jcHVzIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgOiAxNjxicj5tYXhfY3B1
X2lkIMKgIMKgIMKgIMKgIMKgIMKgIDogMTU8YnI+bnJfbm9kZXMgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgOiAxPGJyPmNvcmVzX3Blcl9zb2NrZXQgwqAgwqAgwqAgOiA4PGJyPnRocmVhZHNfcGVyX2Nv
cmUgwqAgwqAgwqAgOiAyPGJyPmNwdV9taHogwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqA6IDI5OTQu
NDEzPGJyPmh3X2NhcHMgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqA6IDE3OGJmM2ZmOmY2ZDgzMjBi
OjJlNTAwODAwOjI0NDAzM2ZmOjAwMDAwMDBmOjIwOWMwMWE5OjAwMDAwMDAwOjAwMDAwNTAwPGJy
PnZpcnRfY2FwcyDCoCDCoCDCoCDCoCDCoCDCoCDCoDogcHYgaHZtIGh2bV9kaXJlY3RpbyBwdl9k
aXJlY3RpbyBoYXAgc2hhZG93PGJyPnRvdGFsX21lbW9yeSDCoCDCoCDCoCDCoCDCoCA6IDMyNjk5
PGJyPmZyZWVfbWVtb3J5IMKgIMKgIMKgIMKgIMKgIMKgOiAyODIyOTxicj5zaGFyaW5nX2ZyZWVk
X21lbW9yeSDCoCA6IDA8YnI+c2hhcmluZ191c2VkX21lbW9yeSDCoCDCoDogMDxicj5vdXRzdGFu
ZGluZ19jbGFpbXMgwqAgwqAgOiAwPGJyPmZyZWVfY3B1cyDCoCDCoCDCoCDCoCDCoCDCoCDCoDog
MDxicj54ZW5fbWFqb3IgwqAgwqAgwqAgwqAgwqAgwqAgwqA6IDQ8YnI+eGVuX21pbm9yIMKgIMKg
IMKgIMKgIMKgIMKgIMKgOiAxMzxicj54ZW5fZXh0cmEgwqAgwqAgwqAgwqAgwqAgwqAgwqA6IC4w
PGJyPnhlbl92ZXJzaW9uIMKgIMKgIMKgIMKgIMKgIMKgOiA0LjEzLjA8YnI+eGVuX2NhcHMgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgOiB4ZW4tMy4wLXg4Nl82NCB4ZW4tMy4wLXg4Nl8zMnAgaHZtLTMu
MC14ODZfMzIgaHZtLTMuMC14ODZfMzJwIGh2bS0zLjAteDg2XzY0IDxicj54ZW5fc2NoZWR1bGVy
IMKgIMKgIMKgIMKgIMKgOiBjcmVkaXQyPGJyPnhlbl9wYWdlc2l6ZSDCoCDCoCDCoCDCoCDCoCA6
IDQwOTY8YnI+cGxhdGZvcm1fcGFyYW1zIMKgIMKgIMKgIMKgOiB2aXJ0X3N0YXJ0PTB4ZmZmZjgw
MDAwMDAwMDAwMDxicj54ZW5fY2hhbmdlc2V0IMKgIMKgIMKgIMKgIMKgOiBUdWUgRGVjIDE3IDE0
OjE5OjQ5IDIwMTkgKzAwMDAgZ2l0OmEyZTg0ZDgtZGlydHk8YnI+eGVuX2NvbW1hbmRsaW5lIMKg
IMKgIMKgIMKgOiBwbGFjZWhvbGRlciBkb20wX21lbT0yMDQ4TSxtYXg6MjA0OE0gbG9nX2x2bD1h
bGwgZ3Vlc3RfbG9nbHZsPWFsbCBkb20wX21heF92Y3B1cz0yIGRvbTBfdmNwdXNfcGluPGJyPmNj
X2NvbXBpbGVyIMKgIMKgIMKgIMKgIMKgIMKgOiBnY2MgKFVidW50dSA3LjUuMC0zdWJ1bnR1MX4x
NC4wNC4xKSA3LjUuMDxicj5jY19jb21waWxlX2J5IMKgIMKgIMKgIMKgIMKgOiByb290PGJyPmNj
X2NvbXBpbGVfZG9tYWluIMKgIMKgIMKgOiA8YnI+Y2NfY29tcGlsZV9kYXRlIMKgIMKgIMKgIMKg
OiBXZWQgQXByIDE0IDA1OjEzOjU2IFdFU1QgMjAyMTxicj5idWlsZF9pZCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCA6IDQyOGJiOTIyM2E3MjgxOWU0OTdkNmIwNmEzOTYwMzRhYjNiNTI4MGQ8YnI+eGVu
ZF9jb25maWdfZm9ybWF0IMKgIMKgIDogNDxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pjxi
cj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PjxiciBjbGVhcj0iYWxsIj48ZGl2PjxkaXYgZGly
PSJsdHIiIGNsYXNzPSJnbWFpbF9zaWduYXR1cmUiIGRhdGEtc21hcnRtYWlsPSJnbWFpbF9zaWdu
YXR1cmUiPjxkaXYgZGlyPSJsdHIiPjxkaXY+PGJyPjwvZGl2PjxkaXY+QXRlbmNpb3NhbWVudGUs
PC9kaXY+PGI+Q2hhcmxlcyBGZXJyZWlyYSBHb27Dp2FsdmVzIDwvYj48YnI+PGZvbnQgY29sb3I9
IiM2NjY2NjYiPjxicj48L2ZvbnQ+PGZvbnQgY29sb3I9IiM2NjY2NjYiIHNpemU9IjEiPjxicj48
L2ZvbnQ+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+DQo=
--0000000000006ab15c05c0033add--

