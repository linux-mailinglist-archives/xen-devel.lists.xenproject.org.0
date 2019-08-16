Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E187A9010F
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 14:05:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyavw-0007m3-BO; Fri, 16 Aug 2019 12:02:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ibv6=WM=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1hyavv-0007ly-Fg
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 12:02:15 +0000
X-Inumbo-ID: afba1fc6-c01d-11e9-a661-bc764e2007e4
Received: from mail-oi1-x244.google.com (unknown [2607:f8b0:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id afba1fc6-c01d-11e9-a661-bc764e2007e4;
 Fri, 16 Aug 2019 12:02:14 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id b25so580068oib.4
 for <xen-devel@lists.xenproject.org>; Fri, 16 Aug 2019 05:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mTlvEQlwQxD+m3KCNTaQoPeyNkMz5awwGRbjpwvjjP4=;
 b=clEWcOMwE8ig/swEBxhVv+eYRtLzVRYzOdNAT4xBz1bX72Ll6PNcMUKCk6v0uVvLrx
 gbPx/m8UOIXYiXCZbrLpf9UIGtcyFWe7DpeZw9T7/T8Ukh1ODM3ao3EOPf2kOk0uuVjQ
 bUZeznpOmQhe1FUF+okF/+PPmA8KUpDPhIhiJ7wBKTtPULvEjTz4+xf/Fli6y5ADfXjz
 wAtUkjimkuWh5hiC4Rnby+nHeZvZAls0ZUvR8nPjlmWmUtVuBOh2dpRg3fJCFwuHmrRL
 UX+oNlk9YxiwIXoNhIrGB+3JVYzEm4z+G8k4kxE8nzAserwn7lO+4r8E+ID6L6GcAsSq
 0SZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mTlvEQlwQxD+m3KCNTaQoPeyNkMz5awwGRbjpwvjjP4=;
 b=ZjmPJ+QyUXnPUEz90M7GVjhTjIsVz5MwUvRvkYUkbw5DVkylYG0QJynJ2v9Kxd0tZE
 OZULdcvhLAELPjX2mtVRNv35mzti3zIFYm9bSNM6Uh2h27UvGVDOF3kCdXVWM82FRbA4
 YdKOTByHuIPWnq94+QcEFM4oiLCzbzu5ZNtWufFyue9iKi+se/PtJTuiG0Qx6/e9PKmC
 PBqduXziuWpmke6lz20HOVR41g8fkUw/CWFM7ADJsWknCvXth7wJX8YpgFuSJ/0WmkJd
 /fQRXqjKKxwX0zh1MOj/F8zTBIiHbAl6AL2FHuvw01KBWq0He/6c0fXsqWPa1LGh2//m
 9rgw==
X-Gm-Message-State: APjAAAXz8b7+ygtRj8YsHVnMZiDFcT4XOE58RWwKhmzZqrK9Blwc1S0X
 yhbVrwCuUKF1dEJH2s0FbzI69odmD1DrDeraDepIIg==
X-Google-Smtp-Source: APXvYqzT39k/DlDCfREc8tggE6tDp2LZAzaRwF8MATMyYj9oD8OFY8BqjW5qOATbiqowbjnwyMf+8eWQlW3FZMdwwIU=
X-Received: by 2002:aca:6185:: with SMTP id v127mr4861732oib.163.1565956934256; 
 Fri, 16 Aug 2019 05:02:14 -0700 (PDT)
MIME-Version: 1.0
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
 <a7d6eede-b152-4c06-8945-9607c663b99c@redhat.com> <1565955445398.83897@bt.com>
In-Reply-To: <1565955445398.83897@bt.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Aug 2019 13:02:03 +0100
Message-ID: <CAFEAcA-nihW1nuMOL-XCR_QxUXSXji=noe4eDNPHxkib4-_a6A@mail.gmail.com>
To: tony.nguyen@bt.com
Subject: Re: [Xen-devel] [Qemu-devel] [PATCH v7 00/42] Invert Endian bit in
 SPARCv9 MMU TTE
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
Cc: KONRAD Frederic <frederic.konrad@adacore.com>,
 Alberto Garcia <berto@igalia.com>, Qemu-block <qemu-block@nongnu.org>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Laszlo Ersek <lersek@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?B?SmnFmcOtIFDDrXJrbw==?= <jiri@resnulli.us>,
 Eduardo Habkost <ehabkost@redhat.com>, Beniamino Galvani <b.galvani@gmail.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, claudio.fontana@suse.com,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 sundeep subbaraya <sundeep.lkml@gmail.com>, Michael Walle <michael@walle.cc>,
 qemu-ppc <qemu-ppc@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Igor Mammedov <imammedo@redhat.com>, Fam Zheng <fam@euphon.net>,
 David Hildenbrand <david@redhat.com>, Palmer Dabbelt <palmer@sifive.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Keith Busch <keith.busch@intel.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Hannes Reinecke <hare@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Helge Deller <deller@gmx.de>,
 Magnus Damm <magnus.damm@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Corey Minyard <minyard@acm.org>,
 Stefan Weil <sw@weilnetz.de>, Yuval Shaia <yuval.shaia@oracle.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Stafford Horne <shorne@gmail.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Peter Chubb <peter.chubb@nicta.com.au>, Aurelien Jarno <aurelien@aurel32.net>,
 Paul Burton <pburton@wavecomp.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Anthony Green <green@moxielogic.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Rob Herring <robh@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Fabien Chouteau <chouteau@adacore.com>, andrzej zaborowski <balrogg@gmail.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, Max Reitz <mreitz@redhat.com>,
 Collin Walling <walling@linux.ibm.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Jiri Slaby <jslaby@suse.cz>,
 Marek Vasut <marex@denx.de>, Jia Liu <proljc@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Paul Durrant <paul.durrant@citrix.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Thomas Huth <huth@tuxfamily.org>, Jean-Christophe DUBOIS <jcd@tribudubois.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAxNiBBdWcgMjAxOSBhdCAxMjozNywgPHRvbnkubmd1eWVuQGJ0LmNvbT4gd3JvdGU6
Cj4KPiBIaSBQaGlsbGlwcGUsCj4KPiBPbiA4LzE2LzE5IDc6NTggUE0sIFBoaWxpcHBlIE1hdGhp
ZXUtRGF1ZMOpIHdyb3RlOgo+ID5PbiA4LzE2LzE5IDg6MjggQU0sIHRvbnkubmd1eWVuQGJ0LmNv
bSB3cm90ZToKPiA+PiBGb3IgZWFjaCBkZXZpY2UgZGVjbGFyZWQgd2l0aCBERVZJQ0VfTkFUSVZF
X0VORElBTiwgZmluZCB0aGUgc2V0IG9mCj4gPj4gdGFyZ2V0cyBmcm9tIHRoZSBzZXQgb2YgdGFy
Z2V0L2h3LyovZGV2aWNlLm8uCj4gPj4KPiA+PiBJZiB0aGUgc2V0IG9mIHRhcmdldHMgYXJlIGFs
bCBsaXR0bGUgb3IgYWxsIGJpZyBlbmRpYW4sIHJlLWRlY2xhcmUKPiA+PiB0aGUgZGV2aWNlIGVu
ZGlhbm5lc3MgYXMgREVWSUNFX0xJVFRMRV9FTkRJQU4gb3IgREVWSUNFX0JJR19FTkRJQU4KPiA+
PiByZXNwZWN0aXZlbHkuCj4gPgo+ID5JZiBvbmx5IGxpdHRsZSBlbmRpYW4gdGFyZ2V0cyB1c2Ug
YSBkZXZpY2UsIHRoYXQgZG9lc24ndCBtZWFuIHRoZSBkZXZpY2UKPiA+aXMgZGVzaWduZWQgaW4g
bGl0dGxlIGVuZGlhbi4uLgo+ID4KPiA+VGhlbiBpZiBhIGJpZyBlbmRpYW4gdGFyZ2V0IHBsYW4g
dG8gdXNlIHRoaXMgZGV2aWNlLCBpdCB3aWxsIHJlcXVpcmUKPiA+bW9yZSB3b3JrIGFuZCB5b3Ug
bWlnaHQgaGF2ZSBpbnRyb2R1Y2VkIHJlZ3Jlc3Npb25zLi4uCj4gPgo+ID5JJ20gbm90IHN1cmUg
dGhpcyBpcyBhIHNhZmUgbW92ZS4KPiA+Cj4gPj4gVGhpcyAqbmFpdmUqIGRlZHVjdGlvbiBtYXkg
cmVzdWx0IGluIGdlbnVpbmVseSBuYXRpdmUgZW5kaWFuIGRldmljZXMKPiA+PiBiZWluZyBpbmNv
cnJlY3RseSBkZWNsYXJlZCBhcyBsaXR0bGUgb3IgYmlnIGVuZGlhbiwgYnV0IHNob3VsZCBub3QK
PiA+PiBpbnRyb2R1Y2UgcmVncmVzc2lvbnMgZm9yIGN1cnJlbnQgdGFyZ2V0cy4KPiA+Cj4KPiBS
b2dlci4gRXZpZGVudGx5IHRvbyBuYWl2ZS4gVEJILCBtb3N0IGRldmljZXMgSSd2ZSBuZXZlciBo
ZWFyZCBvZi4uLgoKT1RPSCBpdCdzIHdvcnRoIG5vdGluZyB0aGF0IGl0J3MgcXVpdGUgbGlrZWx5
IHRoYXQgbW9zdCBvZgp0aGUgaW1wbGVtZW50YXRpb25zIG9mIHRoZXNlIERFVklDRV9OQVRJVkVf
RU5ESUFOIGRldmljZXMKcGlja2VkIGl0IGluIGFuIGVxdWFsbHkgbmFpdmUgd2F5LCBieSBqdXN0
IGNvcHlpbmcgc29tZSBvdGhlcgpkZXZpY2UncyBjb2RlLi4uCgp0aGFua3MKLS0gUE1NCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
