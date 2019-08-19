Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 009F694CF2
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 20:31:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzmPY-0004Sa-Nv; Mon, 19 Aug 2019 18:29:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gzz1=WP=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1hzmPX-0004SQ-Kq
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 18:29:43 +0000
X-Inumbo-ID: 4f04ee44-c2af-11e9-8bf0-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f04ee44-c2af-11e9-8bf0-12813bfff9fa;
 Mon, 19 Aug 2019 18:29:43 +0000 (UTC)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3F48369EE1
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2019 18:29:42 +0000 (UTC)
Received: by mail-wr1-f70.google.com with SMTP id j10so5643864wrb.16
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2019 11:29:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2AWM5QJsOEl26RbrGu9u71/aoBSOJcokey3JtMybmtE=;
 b=X2eKDj3TK8lmJVeM67uC0j5867PSP2IY4hNLHS1V/p1oV+Vfb11LpLTNrFVA2HIl1R
 Q07/n1ErOQirzR6bMvG3zK9gDoIEDoUa20znr8Xmx5E5msvafST8wVsyx/zzyBHoQ2Sg
 Vxm65BRfflWafZsMCcJa+wJpTVXEhF4v6TQrcxPXA6XPah04fLDwmYD/T3gKdKCqOX7i
 1eVwNYWL1UgiKBZISLA3soUWvOQh+NqBI3ShkomjPDVodzUbS0/CKMOf8pxQf7FEF/3S
 GPVbotfojpoE068Qgzc/QWrrEdjzaFpkTfLpz6UhT9gFGvdU4DG43k427+jAwP7vNQNd
 bfYQ==
X-Gm-Message-State: APjAAAVkFO6K/VVYb5idw45emn9WcHNfFDmQJGa/3jyKpTkdoIH0BfBh
 gkTr0Lknlv7JDrzFJxgUnkXbYgo+1Xv4+OtM1ieN2qiV2OhrdS5R5r0a5fZAP3SO/onCIwMrC+9
 MwWW3ud3fwe94Oz6M095oRDx7iao=
X-Received: by 2002:adf:f204:: with SMTP id p4mr30446226wro.317.1566239380849; 
 Mon, 19 Aug 2019 11:29:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyg0OqJZAKSnLqhaxokVPXEufs5sg5knDZPQxFk14FkUk+Vv8S0ARXUwV8ldlCH7o+UEsaAaQ==
X-Received: by 2002:adf:f204:: with SMTP id p4mr30446155wro.317.1566239380560; 
 Mon, 19 Aug 2019 11:29:40 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:399c:411e:1ccb:f240?
 ([2001:b07:6468:f312:399c:411e:1ccb:f240])
 by smtp.gmail.com with ESMTPSA id o14sm28083513wrg.64.2019.08.19.11.29.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2019 11:29:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Thomas Huth <thuth@redhat.com>, tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
 <1565941032362.60179@bt.com>
 <1b5f5a92-1b75-f0d9-d7bc-4605094ad8e7@redhat.com>
 <8d8b37c9-3daf-d241-df92-1a5467bca451@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <3b983f77-8503-3fcd-7c42-45d0121845e6@redhat.com>
Date: Mon, 19 Aug 2019 20:29:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8d8b37c9-3daf-d241-df92-1a5467bca451@redhat.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [qemu-s390x] [Qemu-devel] [PATCH v7 33/42] exec:
 Replace device_endian with MemOp
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
Cc: frederic.konrad@adacore.com, berto@igalia.com, qemu-block@nongnu.org,
 arikalo@wavecomp.com, pasic@linux.ibm.com, hpoussin@reactos.org,
 anthony.perard@citrix.com, xen-devel@lists.xenproject.org, philmd@redhat.com,
 green@moxielogic.com, jiri@resnulli.us, ehabkost@redhat.com,
 b.galvani@gmail.com, eric.auger@redhat.com, alex.williamson@redhat.com,
 stefanha@redhat.com, jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 andrew@aj.id.au, claudio.fontana@suse.com, crwulff@gmail.com,
 laurent@vivier.eu, sundeep.lkml@gmail.com, michael@walle.cc,
 qemu-ppc@nongnu.org, kbastian@mail.uni-paderborn.de, imammedo@redhat.com,
 fam@euphon.net, peter.maydell@linaro.org, david@redhat.com, palmer@sifive.com,
 balaton@eik.bme.hu, keith.busch@intel.com, jcmvbkbc@gmail.com, hare@suse.com,
 sstabellini@kernel.org, andrew.smirnov@gmail.com, deller@gmx.de,
 magnus.damm@gmail.com, marcel.apfelbaum@gmail.com, atar4qemu@gmail.com,
 minyard@acm.org, sw@weilnetz.de, yuval.shaia@oracle.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, peter.chubb@nicta.com.au, clg@kaod.org, shorne@gmail.com,
 qemu-riscv@nongnu.org, i.mitsyanko@gmail.com, cohuck@redhat.com,
 amarkovic@wavecomp.com, jan.kiszka@web.de, aurelien@aurel32.net,
 pburton@wavecomp.com, sagark@eecs.berkeley.edu, jasowang@redhat.com,
 kraxel@redhat.com, edgar.iglesias@gmail.com, gxt@mprc.pku.edu.cn,
 robh@kernel.org, lersek@redhat.com, borntraeger@de.ibm.com, joel@jms.id.au,
 antonynpavlov@gmail.com, chouteau@adacore.com, balrogg@gmail.com,
 Andrew.Baumann@microsoft.com, mreitz@redhat.com, walling@linux.ibm.com,
 dmitry.fleytman@gmail.com, mst@redhat.com, mark.cave-ayland@ilande.co.uk,
 jslaby@suse.cz, marex@denx.de, proljc@gmail.com, marcandre.lureau@redhat.com,
 alistair@alistair23.me, paul.durrant@citrix.com, david@gibson.dropbear.id.au,
 xiaoguangrong.eric@gmail.com, huth@tuxfamily.org, jcd@tribudubois.net,
 stefanb@linux.ibm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkvMDgvMTkgMjA6MjgsIFBhb2xvIEJvbnppbmkgd3JvdGU6Cj4gT24gMTYvMDgvMTkgMTI6
MTIsIFRob21hcyBIdXRoIHdyb3RlOgo+PiBUaGlzIHBhdGNoIGlzICpodWdlKiwgbW9yZSB0aGFu
IDgwMGtCLiBJdCBrZWVwcyBiZWluZyBzdHVjayBpbiB0aGUgdGhlCj4+IGZpbHRlciBvZiB0aGUg
cWVtdS1zMzkweCBsaXN0IGVhY2ggdGltZSB5b3Ugc2VuZCBpdC4gUGxlYXNlOgo+Pgo+PiAxKSBU
cnkgdG8gYnJlYWsgaXQgdXAgaW4gbW9yZSBkaWdlc3RpYmxlIHBpZWNlcywgZS5nLiBjaGFuZ2Ug
b25seSBvbmUKPj4gc3Vic3lzdGVtIGF0IGEgdGltZSAodGhpcyBpcyBhbHNvIGJldHRlciByZXZp
ZXdhYmxlIGJ5IHBlb3BsZSB3aG8gYXJlCj4+IGludGVyZXN0ZWQgaW4gb25lIGFyZWEpCj4gCj4g
VGhpcyBpcyBub3QgcmVhbGx5IHBvc3NpYmxlLCBzaW5jZSB0aGUgcGF0Y2ggaXMgYmFzaWNhbGx5
IGEKPiBzZWFyY2gtYW5kLXJlcGxhY2UuICBZb3UgY291bGQgcGVyaGFwcyB1c2Ugc29tZSBtYWdp
Ywo+ICgiREVWSUNFX01FTU9QX0VORElBTiIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdCkgdG8gYWxs
b3cgYSBzcGxpdCwgYnV0IGl0Cj4gd291bGQgaW50cm9kdWNlIG1vcmUgY29tcGxpY2F0aW9uIHRo
YW4gYW55dGhpbmcgZWxzZS4KCkknbSBzdHVwaWQsIGF0IHRoaXMgcG9pbnQgb2YgdGhlIHNlcmll
cyBpdCBfd291bGRfIGJlIHBvc3NpYmxlIHRvIHNwbGl0CnRoZSBwYXRjaCBieSBzdWJzeXN0ZW0u
ICBTdGlsbCBub3Qgc3VyZSBpdCB3b3VsZCBiZSBhY3R1YWxseSBhbiBhZHZhbnRhZ2UuCgpQYW9s
bwoKPiBBZ3JlZWQgb24gdGhlIEhUTUwgdGhvdWdoLiA6KQo+IAo+IFBhb2xvCj4gCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
