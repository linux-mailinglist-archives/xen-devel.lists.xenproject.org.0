Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D78B27A7D1
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 08:49:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMmxB-0004vX-LG; Mon, 28 Sep 2020 06:48:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RDSs=DF=linaro.org=masami.hiramatsu@srs-us1.protection.inumbo.net>)
 id 1kMmxA-0004vS-SI
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 06:48:04 +0000
X-Inumbo-ID: aaf5ccb8-1d23-4e25-967a-57676bd0a07c
Received: from mail-yb1-xb44.google.com (unknown [2607:f8b0:4864:20::b44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aaf5ccb8-1d23-4e25-967a-57676bd0a07c;
 Mon, 28 Sep 2020 06:48:04 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id x20so139558ybs.8
 for <xen-devel@lists.xenproject.org>; Sun, 27 Sep 2020 23:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ovr+WvWyj5jxuZL9xiwgc769pC1rISshJ64tm1AJ6Vo=;
 b=hY67SrT8hiXuTDMpa/F3fQj5I3e2BtgSscvkeetioL8+HSq/UO2ruZ3Ss2XaEcKawZ
 6IPGZA2cBxR+199Yll4IU6hgFDZYWJwIIAS7uOpne2kp4ctt07hUFAnmtQuJy5G7aY8F
 Op98+geRM0r15derSlv+tmOw5gITR26T44YXpS5GQYb93xl3WGXXSUpkY9nE8H07kI8t
 hxkYRVisunmWpcPC8QVWPAO6J0aZfLvYxDD0TAZyhH8VdqsE5oV3h9SinFQ+LigLKk+F
 TGB/1fyGRdrzV+wdnhp2yULtUNniygaUIY47+DQV9x+/yCPk1roxa1+J96jZsE/Hjt+t
 kzrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ovr+WvWyj5jxuZL9xiwgc769pC1rISshJ64tm1AJ6Vo=;
 b=fM+bF8p5EN1Jg6IgLZlODDou6ylKIKwM6fBdrk5QOFJoMGzMH4SB/CZ7Wv3XCa9pM9
 ZBgZmrSBggeidq/Jpi8gOhMae6LbVq19nD7zDTo/4t5M04KFrjOH5dAhsWnRGjEVkLlm
 n0L55rsUSx/D//nLZu2o5VZPNkl3ptizIswoxd32LW1FyBFecnrmC3fHMuaifuBmIM9M
 h6zBEWwua2ENJr38yVajiMiEkypbOagv8IHoV41+HiZv825vDz2DOenPkkBe6eVpR/5H
 qUE6vqGho3ZTveU2Lp8rkca/W668kMhsK0Ol/l4zZ19F72daR7MSgqiQKNF+KmNTkGlL
 O1sw==
X-Gm-Message-State: AOAM532xfc1ePSBrwr4j2TCb4Roq6LWelYamsXNCpIgz+7Zq1cSk5uzx
 030NEBJmcTODAZADhSWZcQHrHL1TsUUF4yzi9pmdWg==
X-Google-Smtp-Source: ABdhPJyjaJj5tqmhDJvYWeUHKfXyGmD4exN9qZpe433p0PpG9lPtEJdVV8oNPmoN9Rbe6qpe/AEi7IOv/AvHLxBnN8k=
X-Received: by 2002:a25:5088:: with SMTP id e130mr199761ybb.234.1601275683597; 
 Sun, 27 Sep 2020 23:48:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200926205542.9261-1-julien@xen.org>
In-Reply-To: <20200926205542.9261-1-julien@xen.org>
From: Masami Hiramatsu <masami.hiramatsu@linaro.org>
Date: Mon, 28 Sep 2020 15:47:52 +0900
Message-ID: <CAA93ih3-gTAEzV=yYS-9cHGyN9rfAC28Xeyk8Gsmi7D2BS_OWQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] xen/arm: Unbreak ACPI
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 ehem+xen@m5p.com, bertrand.marquis@arm.com, andre.przywara@arm.com, 
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, 
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, 
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="0000000000004f364105b05a0c5f"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
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

--0000000000004f364105b05a0c5f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

This made progress with my Xen boot on DeveloperBox (
https://www.96boards.org/product/developerbox/ ) with ACPI.

Thank you,


2020=E5=B9=B49=E6=9C=8827=E6=97=A5(=E6=97=A5) 5:56 Julien Grall <julien@xen=
.org>:

>
> From: Julien Grall <jgrall@amazon.com>
>
> Hi all,
>
> Xen on ARM has been broken for quite a while on ACPI systems. This
> series aims to fix it.
>
> Unfortunately I don't have a system with ACPI v6.0 or later (QEMU seems
> to only support 5.1). So I did only some light testing.
>
> I have only build tested the x86 side so far.
>
> Cheers,
>
> *** BLURB HERE ***
>
> Julien Grall (4):
>   xen/acpi: Rework acpi_os_map_memory() and acpi_os_unmap_memory()
>   xen/arm: acpi: The fixmap area should always be cleared during
>     failure/unmap
>   xen/arm: Check if the platform is not using ACPI before initializing
>     Dom0less
>   xen/arm: Introduce fw_unreserved_regions() and use it
>
>  xen/arch/arm/acpi/lib.c     | 79 ++++++++++++++++++++++++++++++-------
>  xen/arch/arm/kernel.c       |  2 +-
>  xen/arch/arm/setup.c        | 25 +++++++++---
>  xen/arch/x86/acpi/lib.c     | 18 +++++++++
>  xen/drivers/acpi/osl.c      | 34 ++++++++--------
>  xen/include/asm-arm/setup.h |  2 +-
>  xen/include/xen/acpi.h      |  1 +
>  7 files changed, 123 insertions(+), 38 deletions(-)
>
> --
> 2.17.1
>


--
Masami Hiramatsu

--0000000000004f364105b05a0c5f
Content-Type: application/octet-stream; name=xen-acpi-hide-uart-address
Content-Disposition: attachment; filename=xen-acpi-hide-uart-address
Content-Transfer-Encoding: base64
Content-ID: <f_kfm5fsug0>
X-Attachment-Id: f_kfm5fsug0

eGVuOiBhY3BpOiBIaWRlIFVBUlQgYWRkcmVzcyBvbmx5IGlmIFNUQU8gdGFibGUgc3BlY2lmaWVk
IGl0CgpGcm9tOiBNYXNhbWkgSGlyYW1hdHN1IDxtYXNhbWkuaGlyYW1hdHN1QGxpbmFyby5vcmc+
CgpTaW5jZSBTUENSIHRhYmxlIG1heSBub3QgZXhpdCBpZiBTVEFPLT5pZ25vcmVfdWFydCBpcyBu
b3Qgc2V0Cm9yIFNUQU8gdGFibGUgZG9lcyBub3QgZXhpc3QsIGF0IGZpcnN0IGNoZWNrIHRoZSBT
VEFPIHRhYmxlLgoKU2lnbmVkLW9mZi1ieTogTWFzYW1pIEhpcmFtYXRzdSA8bWFzYW1pLmhpcmFt
YXRzdUBsaW5hcm8ub3JnPgotLS0KIHhlbi9hcmNoL2FybS9hY3BpL2RvbWFpbl9idWlsZC5jIHwg
ICAyOSArKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE3IGlu
c2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9h
Y3BpL2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2FjcGkvZG9tYWluX2J1aWxkLmMKaW5k
ZXggMWIxY2ZhYmIwMC4uOTdkMWNkZGZiNiAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2FjcGkv
ZG9tYWluX2J1aWxkLmMKKysrIGIveGVuL2FyY2gvYXJtL2FjcGkvZG9tYWluX2J1aWxkLmMKQEAg
LTI4LDggKzI4LDkgQEAKIAogc3RhdGljIGludCBfX2luaXQgYWNwaV9pb21lbV9kZW55X2FjY2Vz
cyhzdHJ1Y3QgZG9tYWluICpkKQogewotICAgIGFjcGlfc3RhdHVzIHN0YXR1czsKKyAgICBzdHJ1
Y3QgYWNwaV90YWJsZV9zdGFvICpzdGFvID0gTlVMTDsKICAgICBzdHJ1Y3QgYWNwaV90YWJsZV9z
cGNyICpzcGNyID0gTlVMTDsKKyAgICBhY3BpX3N0YXR1cyBzdGF0dXM7CiAgICAgdW5zaWduZWQg
bG9uZyBtZm47CiAgICAgaW50IHJjOwogCkBAIC0zOSwyMSArNDAsMjUgQEAgc3RhdGljIGludCBf
X2luaXQgYWNwaV9pb21lbV9kZW55X2FjY2VzcyhzdHJ1Y3QgZG9tYWluICpkKQogICAgICAgICBy
ZXR1cm4gcmM7CiAKICAgICAvKiBUT0RPOiBEZW55IE1NSU8gYWNjZXNzIGZvciBTTU1VLCBHSUMg
SVRTICovCi0gICAgc3RhdHVzID0gYWNwaV9nZXRfdGFibGUoQUNQSV9TSUdfU1BDUiwgMCwKKyAg
ICBzdGF0dXMgPSBhY3BpX2dldF90YWJsZShBQ1BJX1NJR19TVEFPLCAwLAorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIChzdHJ1Y3QgYWNwaV90YWJsZV9oZWFkZXIgKiopJnN0YW8pOworICAg
IGlmICggQUNQSV9TVUNDRVNTKHN0YXR1cykgJiYgc3Rhby0+aWdub3JlX3VhcnQpIHsKKyAgICAg
ICAgLyogRGVueSBVQVJUIGFjY2VzcyBvbmx5IHdoZW4gU1RBTyBzcGVjaWZpZWQgaXQgKi8KKyAg
ICAgICAgc3RhdHVzID0gYWNwaV9nZXRfdGFibGUoQUNQSV9TSUdfU1BDUiwgMCwKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAoc3RydWN0IGFjcGlfdGFibGVfaGVhZGVyICoqKSZzcGNyKTsK
KyAgICAgICAgaWYgKCBBQ1BJX0ZBSUxVUkUoc3RhdHVzKSApCisgICAgICAgIHsKKyAgICAgICAg
ICAgIHByaW50aygiRmFpbGVkIHRvIGdldCBTUENSIHRhYmxlXG4iKTsKKyAgICAgICAgICAgIHJl
dHVybiAtRUlOVkFMOworICAgICAgICB9CiAKLSAgICBpZiAoIEFDUElfRkFJTFVSRShzdGF0dXMp
ICkKLSAgICB7Ci0gICAgICAgIHByaW50aygiRmFpbGVkIHRvIGdldCBTUENSIHRhYmxlXG4iKTsK
LSAgICAgICAgcmV0dXJuIC1FSU5WQUw7CisgICAgICAgIG1mbiA9IHNwY3ItPnNlcmlhbF9wb3J0
LmFkZHJlc3MgPj4gUEFHRV9TSElGVDsKKyAgICAgICAgLyogRGVueSBNTUlPIGFjY2VzcyBmb3Ig
VUFSVCAqLworICAgICAgICByYyA9IGlvbWVtX2RlbnlfYWNjZXNzKGQsIG1mbiwgbWZuICsgMSk7
CisgICAgICAgIGlmICggcmMgKQorICAgICAgICAgICAgcmV0dXJuIHJjOwogICAgIH0KIAotICAg
IG1mbiA9IHNwY3ItPnNlcmlhbF9wb3J0LmFkZHJlc3MgPj4gUEFHRV9TSElGVDsKLSAgICAvKiBE
ZW55IE1NSU8gYWNjZXNzIGZvciBVQVJUICovCi0gICAgcmMgPSBpb21lbV9kZW55X2FjY2Vzcyhk
LCBtZm4sIG1mbiArIDEpOwotICAgIGlmICggcmMgKQotICAgICAgICByZXR1cm4gcmM7Ci0KICAg
ICAvKiBEZW55IE1NSU8gYWNjZXNzIGZvciBHSUMgcmVnaW9ucyAqLwogICAgIHJldHVybiBnaWNf
aW9tZW1fZGVueV9hY2Nlc3MoZCk7CiB9Cg==
--0000000000004f364105b05a0c5f--

