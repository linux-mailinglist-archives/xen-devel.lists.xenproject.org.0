Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6E5849DF
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 12:40:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvJKW-0005YF-9P; Wed, 07 Aug 2019 10:38:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rMfM=WD=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1hvJKU-0005Y8-UW
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 10:38:02 +0000
X-Inumbo-ID: 6d77e4c4-b8ff-11e9-b9a2-77c8615d96d7
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6d77e4c4-b8ff-11e9-b9a2-77c8615d96d7;
 Wed, 07 Aug 2019 10:38:00 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id k2so4975517wrq.2
 for <xen-devel@lists.xenproject.org>; Wed, 07 Aug 2019 03:38:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xGIMuvKiRWGAighMeIoXICvoM84+mSRh6SCMOKg4t50=;
 b=paOyZP+4nMiqfw+1pbcpABRWxVYiUUibiAHPuU2mjgP/gfYLKX51rBEx48nDa+3G97
 VDSbemaFPlz6+MTo8yK0DfH44nMh1pmw8KI/QwF46Sv4Ef+R1btyqSEXbSblaCzjlQb2
 LvwBUu2TYOwD2ckdrErCxCd6SdgdNIMuoOaQI9292Yb8X84pSIeRHeajnfTVfKgjGd+V
 jb98mRSv2IQLoO+lNn4H8OorWl4QV+Zg90UBzWklB1N2LE1uu3XmdMDXJfSqttHhjum9
 4hC3MJ7+79I0KivTlA98tmn/ajszMcPf8qbsH41h+nxPQ9y/K5mDkTbkzNmKkhDMCZa8
 m8aQ==
X-Gm-Message-State: APjAAAXR7yOXizM4LV3tGgInBkbatTX9ZORzKqhFm3uhdF1ZaT9UPfVT
 uFkcBjx/PJmk0svhnxQ4NgIPig==
X-Google-Smtp-Source: APXvYqy4PVePIQDOvyWhEAtzNmLdItuCVcldRUW9KfALbPXIzDY7t2Ssr5gwLrhAtbji1xjO4Hfrdw==
X-Received: by 2002:adf:f481:: with SMTP id l1mr3615709wro.123.1565174280079; 
 Wed, 07 Aug 2019 03:38:00 -0700 (PDT)
Received: from [192.168.1.39] (214.red-83-51-160.dynamicip.rima-tde.net.
 [83.51.160.214])
 by smtp.gmail.com with ESMTPSA id c187sm4719394wmd.39.2019.08.07.03.37.56
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 03:37:59 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <2397186a-a28e-85dd-131c-900e777a60ad@redhat.com>
Date: Wed, 7 Aug 2019 12:37:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [Qemu-devel] [PATCH v6 00/26] Invert Endian bit in
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
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 dmitry.fleytman@gmail.com, sagark@eecs.berkeley.edu, mst@redhat.com,
 green@moxielogic.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 balaton@eik.bme.hu, keith.busch@intel.com, jcmvbkbc@gmail.com,
 frederic.konrad@adacore.com, pbonzini@redhat.com, kraxel@redhat.com,
 edgar.iglesias@gmail.com, mreitz@redhat.com, pburton@wavecomp.com,
 marex@denx.de, robh@kernel.org, hare@suse.com, gxt@mprc.pku.edu.cn,
 berto@igalia.com, proljc@gmail.com, qemu-block@nongnu.org,
 arikalo@wavecomp.com, jslaby@suse.cz, deller@gmx.de, david@redhat.com,
 magnus.damm@gmail.com, yuval.shaia@oracle.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, hpoussin@reactos.org, joel@jms.id.au,
 marcel.apfelbaum@gmail.com, anthony.perard@citrix.com,
 marcandre.lureau@redhat.com, david@gibson.dropbear.id.au, balrogg@gmail.com,
 jasowang@redhat.com, atar4qemu@gmail.com, antonynpavlov@gmail.com,
 jiri@resnulli.us, ehabkost@redhat.com, minyard@acm.org, jcd@tribudubois.net,
 sw@weilnetz.de, alistair@alistair23.me, chouteau@adacore.com,
 b.galvani@gmail.com, eric.auger@redhat.com, alex.williamson@redhat.com,
 sstabellini@kernel.org, jan.kiszka@web.de, clg@kaod.org, stefanha@redhat.com,
 imammedo@redhat.com, xen-devel@lists.xenproject.org, shorne@gmail.com,
 andrew.smirnov@gmail.com, jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, xiaoguangrong.eric@gmail.com,
 qemu-riscv@nongnu.org, andrew@aj.id.au, lersek@redhat.com, crwulff@gmail.com,
 laurent@vivier.eu, Andrew.Baumann@microsoft.com, sundeep.lkml@gmail.com,
 i.mitsyanko@gmail.com, michael@walle.cc, paul.durrant@citrix.com,
 qemu-ppc@nongnu.org, huth@tuxfamily.org, amarkovic@wavecomp.com,
 kbastian@mail.uni-paderborn.de, cohuck@redhat.com, peter.chubb@nicta.com.au,
 aurelien@aurel32.net, stefanb@linux.ibm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC83LzE5IDEwOjIzIEFNLCB0b255Lm5ndXllbkBidC5jb20gd3JvdGU6ClsuLi5dCj4gdjM6
Cj4gLSBMaWtlIHYxLCB0aGUgZW50aXJlIFRDR01lbU9wIGVudW0gaXMgbm93IE1lbU9wLgo+IC0g
TWVtT3AgdGFyZ2V0IGRlcGVuZGFudCBhdHRyaWJ1dGVzIGFyZSBjb25kaXRpb25hbCB1cG9uIE5F
RURfQ1BVX0gKPiAKPiB2NDoKPiAtIEFkZGVkIFBhb2xvIEJvbnppbmkgYXMgaW5jbHVkZS9leGVj
L21lbW9wLmggbWFpbnRhaW5lcgo+IAo+IHY1Ogo+IC0gSW1wcm92ZWQgY29tbWl0IG1lc3NhZ2Vz
IHRvIGNsYXJpZnkgaG93IGludGVyZmFjZSB0byBhY2Nlc3MKPiAgIE1lbW9yeVJlZ2lvbiB3aWxs
IGJlIGNvbnZlcnRlZCBmcm9tICJ1bnNpZ25lZCBzaXplIiB0byAiTWVtT3Agb3AiLgo+IC0gTW92
ZWQgY3B1X3RyYW5zYWN0aW9uX2ZhaWxlZCgpIE1lbU9wIGNvbnZlcnNpb24gZnJvbSBwYXRjaCAj
MTEgdG8gIzkKPiAgIHRvIG1ha2UgcmV2aWV3IGVhc2llci4KPiAKPiB2NjoKPiAtIEltcHJvdmVk
IGNvbW1pdCBtZXNzYWdlcy4KPiAtIEluY2x1ZGUgYXMgcGF0Y2ggIzEgYW4gZWFybGllciBwb3N0
ZWQgVEFSR0VUX0FMSUdORURfT05MWSBjb25maWd1cmUgcGF0Y2guCj4gLSBUeXBlbGVzcyBtYWNy
byBTSVpFX01FTU9QIGlzIG5vdyBpbmxpbmUuCj4gLSBzaXplX21lbW9wIG5vdyBpbmNsdWRlcyBD
T05GSUdfREVCVUdfVENHIGNvZGUuCj4gLSBzaXplX21lbW9wIG5vdyBhbHNvIGVuY29kZXMgZW5k
aWFubmVzcyB2aWEgTU9fVEUuCj4gLSBSZXZlcnRlZCBzaXplX21lbW9wIG9wZXJhbmQgInVuc2ln
bmVkIGxvbmciIGJhY2sgdG8gInVuc2lnbmVkIi4KPiAtIFNlY29uZCBwYXNzIG9mIHNpemVfbWVt
b3AgdG8gcmVwbGFjZSBuby1vcCBwbGFjZSBob2xkZXIgd2l0aCBNT197OHwxNnwzMnw2NH0uCj4g
LSBEZWxheSBtZW1vcnlfcmVnaW9uX2Rpc3BhdGNoX3tyZWFkLHdyaXRlfSBvcGVyYW5kIGNvbnZl
cnNpb24gdW50aWwgbm8tb3AKPiAgIHNpemVfbWVtb3AgaXMgaW1wbGVtZW50ZWQgc28gd2UgaGF2
ZSBwcm9wZXIgdHlwaW5nIGF0IGFsbCBwb2ludHMgaW4gYmV0d2Vlbi4KPiAtIEZpeGVkIGJ1ZyB3
aGVyZSBub3QgYWxsIG1lbW9yeV9yZWdpb25fZGlzcGF0Y2hfe3JlYWQsd3JpdGV9IGNhbGxlcnMg
d2hlcmUKPiAgIGVuY29kaW5nIGVuZGlhbm5lc3MgaW50byB0aGUgTWVtT3Agb3BlcmFuZCwgc2Vl
IHBhdGNoICMyMC4KPiAtIEZpeGVkIGJ1ZyB3aGVyZSBub3QgYWxsIG1lbW9yeV9yZWdpb25fZGlz
cGF0Y2hfe3JlYWQsd3JpdGV9IGNhbGxlcnMgd2VyZQo+ICAgY29sbGFwc2luZyB0aGVpciBieXRl
IHN3YXAgaW50byBhZGp1c3RfZW5kaWFubmVzcywgc2VlIHBhdGNoICMyMCBhbmQgIzIyLgo+IC0g
U3BsaXQgYnl0ZSBzd2FwIGNvbGxhcHNpbmcgcGF0Y2ggKHY1ICMxMSkgaW50byAjMjEgYW5kICMy
Mi4KPiAtIENvcnJlY3RlZCBub24tY29tbW9uICotY29tbW9uLW9iaiB0byAqLW9iai4KPiAtIFJl
cGxhY2VkIGVudW0gZGV2aWNlX2VuZGlhbiB3aXRoIE1lbU9wIHRvIHNpbXBsaWZ5IGVuZGlhbm5l
c3MgY2hlY2tzLiBBCj4gICBzdHJhaWdodCBmb3J3YXJkIHNlZCBidXQgdG91Y2hlZCAqYWxvdCog
b2YgZmlsZXMuIFNlZSBwYXRjaCAjMTYgYW5kICMxNy4KPiAtIERlbGV0ZWQgZW51bSBkZXZpY2Vf
ZW5kaWFuLgo+IC0gRGVsZXRlZCBERVZJQ0VfSE9TVF9FTkRJQU4gZGVmaW5pdGlvbi4KPiAtIEdl
bmVyYWxpemVkIHRoZSBkZXNjcmlwdGlvbiBvZiBpbnRyb2R1Y2VkIE1lbVR4QXR0cnMgYXR0cmli
dXRlIGJ5dGVfc3dhcC4KCkknbSBjb25mdXNlZCBJIHRoaW5rIEkgYWxyZWFkeSByZXZpZXdlZCB2
YXJpb3VzIHBhdGNoZXMgb2YgeW91ciBwcmV2aW91cwpzZXJpZXMgYnV0IGRvbid0IHNlZSBteSBS
ZXZpZXdlZC1ieSB0YWdzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
