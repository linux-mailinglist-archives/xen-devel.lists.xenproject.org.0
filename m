Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 594EC61233
	for <lists+xen-devel@lfdr.de>; Sat,  6 Jul 2019 18:36:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjnbU-0006gT-Uj; Sat, 06 Jul 2019 16:32:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=L7pd=VD=gmail.com=denisobrezkov@srs-us1.protection.inumbo.net>)
 id 1hjnbT-0006fP-18
 for xen-devel@lists.xenproject.org; Sat, 06 Jul 2019 16:31:59 +0000
X-Inumbo-ID: 9269f751-a00b-11e9-8980-bc764e045a96
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9269f751-a00b-11e9-8980-bc764e045a96;
 Sat, 06 Jul 2019 16:31:58 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id e3so10514077edr.10
 for <xen-devel@lists.xenproject.org>; Sat, 06 Jul 2019 09:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Vt4sai9k+jBAzZSQDpwX0uKeiM/jkFA/sWGVC2ItYSM=;
 b=SIOiYHaA0rdvjZ253TRIKA6qI8XjB/OrB9lh5MKDYw5QkA7qrBKCU6wJGjLA3VvnKZ
 Z2Tb+gEv6YEGjJIPZT3FlXwlZtmefSC0Eqy+sRdVwOw3n9eKHaUODNha3KWSQm1R8N+9
 ivO44afpSOZCoz4XC/wQHSB0gcQ7D/qRvOvCGNHRazdn+7AN7IotFPlKRdLKH/pQELK6
 Tu3HTNXaIXd0kpd6/RTLwrkUkZMw0Bz83Ru4gE6RHG10TBCh2h1DCLoU6Dy82PoLgAYb
 A3U2YQAf5kU5z+MUI+NGFbCxHTbuvv6eZ3l23lm9O8JE0U2ptIopiBeqPZ55t3WTkrf1
 q6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Vt4sai9k+jBAzZSQDpwX0uKeiM/jkFA/sWGVC2ItYSM=;
 b=gSboojzE77+NrgNl3nW1xsDj1s1i2LO0VmrCHcsNLkLw2bWlnvv3RaiCzUv9K9YHHl
 /ZYBvWLLQzQg6epz6vmJo1CCk47bzV8jsIXQ9gdi06dEcanKhKCyAxM5hJI2nseMf5zv
 wppDyIuAiHq0ri2qjrGVOdAX64jJ14B3GCTEaNVZpRcu77U9h84R6eyn0hyitQh8mEfy
 FfKnq2wSWb5UbN4B9kEjcSMbcXyhMSSWCv4Qto7gEkmeLSN867rhtfBCdIrHLd4pz5T7
 eITgORU3WWR11G13e5HvfNqBLUSaYX3yIkmtqX7K7TOrEZCEPcpfNlF3/xo3dnc0pKtx
 V7bw==
X-Gm-Message-State: APjAAAXwjCFUJRoFFeCzSqA2DK0evCFJH5AMxoP6Onz7t/AaSpF5+2JY
 MI16NbLRhBy5YqrM8lMBzR4=
X-Google-Smtp-Source: APXvYqx+to4z5tlLR1Ki4fEIe1+GT33T3BfZ/wUvRpvPGa/ZHRTRSS3YDiWs0iLqyg7SkKtKAz2Siw==
X-Received: by 2002:a17:906:2ad5:: with SMTP id
 m21mr8367825eje.55.1562430716906; 
 Sat, 06 Jul 2019 09:31:56 -0700 (PDT)
Received: from ?IPv6:2001:16b8:6619:6c00:1e4b:d6ff:fef9:46e6?
 (200116b866196c001e4bd6fffef946e6.dip.versatel-1u1.de.
 [2001:16b8:6619:6c00:1e4b:d6ff:fef9:46e6])
 by smtp.gmail.com with ESMTPSA id b30sm3797879ede.88.2019.07.06.09.31.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 06 Jul 2019 09:31:56 -0700 (PDT)
To: Julien Grall <Julien.Grall@arm.com>, Iain Hunter <drhunter95@gmail.com>
References: <4ec41ede-a8cb-6724-aa88-254387b2aa15@gmail.com>
 <CALC81-tWyUTXVf5uxtdi_i5Ndz0CRtoJ=XwTecz40bzyL7Ps1w@mail.gmail.com>
 <779518d6-b7f8-9faa-f22d-558013dc8cfb@gmail.com>
 <583833d2-8303-48f5-7cab-f9e4e112a694@gmail.com>
 <3a2a6185-0056-d931-a194-578239eedabc@gmail.com>
 <c85dcf69-2a56-811d-fa95-b313ca9ea66f@arm.com>
 <42daf482-9f3e-55c7-9bad-c61b147252af@gmail.com>
 <da1d04bb-54ad-5bf7-f62e-1fecbb1e7611@arm.com>
From: Denis Obrezkov <denisobrezkov@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=denisobrezkov@gmail.com; prefer-encrypt=mutual; keydata=
 mQMuBFrAxPQRCAD59CJNd5LF1VmojUBpdr/bJ2TaKC7SW4ln7+PWn+QyAJfFOVFlTRIDsAlP
 65y7CacXFCXmLTACo4a7HEhRb5787kPm6rc30zpL+04uXCeTruYZi0ZnQVXOiab/qy3aMsk0
 6n9hMY28TSbM9nynnlrbg9pGkb1EiFVNsowJjFSKXa3Rpogte9qxfXmLf2eV0MZNnrmq6Kb2
 8ri5/Ffh5DG1CsN/dkv8n1kw2QqMM2RT+ZS57D+yCehtw355EXSVh2r+GsXAqMinOexcdYI4
 skvvP84OovRMnlJhmRdnbjO+QFiOVeLUj7WHMT3AbClaBlUuHkbFi9HLBHAiu6uMrNtzAQD9
 KoM6SXbuvlhCq2v78dGkex9EgaA7CSnBcNXuUdrjYQf+MsZgI7oDihT6TUBO0IDQL+qSrozs
 /hHV+HhWtc5+SYTsHXxnTkcVe12vR0uPw3fFUuncWnMRzHivKZC2ZF/w3LJL/nGzguAoPa9e
 VghM38EP49yO6ESthD4WvELMy2+zPkMiUqilMfxOl370RXxEBUIzFSpP6oqvNq7fvThGTQah
 mrFhflGSyMHXk75VkCiY+cbrMeB9xG7H3nlbQ9fYVCOPejnt8gImeazdIghQh1tjbNpjQhy8
 50klCowN5H+gaSZsy4K7jlJ1UNFz/vWCvlr3W8o4tA6EoJ4tjJV2HXcrUBPYLwkruKnv8QJM
 vyVj5an6Sfuwt/AmFEOKo1QJnAf+Oi47RrOmec8lXS/06TMn7z6krmuRul03HXayCtREqMyY
 VCf87oMpPYYnFJolDrSB8kCSZRn2aixzHl4IIGa9RVuywChzUvgZJbFGPFR+Qz1BK9Ltl7FC
 rQcuAqg3A2RJ7uoTNiZDfI0tKWm8BEUe5LqZqgFTkTkuV9D6UveYnDk2zUFGlDTguagW2XWI
 wiGaA9Ud7UBBlQGTZUwNGahAErUHI5gDSNfWEUaRBEccWKgddK3a/NhkxOveqDWWFcAt4K/g
 JOqBs+7Bm0RjQa+4EAP6gFx4098XBZP9ff6pPuFWRN6fvfdBDUMHqb3i2SGDWVPrRR/x+Iz/
 yfjdWlC/87QoRGVuaXMgT2JyZXprb3YgPGRlbmlzb2JyZXprb3ZAZ21haWwuY29tPoiWBBMR
 CAA+FiEExuZY9Y+VSLigQ/5M+4kLEySe7PkFAlrAxPQCGyMFCQWjmoAFCwkIBwIGFQgJCgsC
 BBYCAwECHgECF4AACgkQ+4kLEySe7PleSQEAktULi71pVGKh0vykq0wrn6IyqXx1SLFNwLcr
 PnZ2N5gA/3Ipzf3vXWXWCwRR07BB/H+9XgqWRl3jsu5EL9TzmyFAuQINBFrAxPQQCADaIOKd
 +PPUX4GvjdLikKxHsFRRpk75LiFZJcFU8cCA0M4Dg/Q0LcSX82TfgrfU34y7/rrF4ig/Dj81
 H8MB2u01lYA2QpQ/XdHfwFMxkj5FCB4Cq6EqGxsXsaRhw4Qu3ouiJiHCEeoMoloBLOlqpXBf
 qnJSnBXYJDnlyvxoFIVpX4l+q2xJk/877otbPK5TBYdeHQv/f7cWNxIUT5Feth9DVq4B9OG1
 BgOA1gH13KUmWhMaO+k/rYCJd9UiRoGm7FihyWrsRnG5K6VNnLjwjMjxDukNxdlITVbeK5/E
 QaiKRGRcTp3OwfHy6HlQH/JXGGyfmEx0rKVjoW/DD76MPpk/AAMFB/0SBNOW9asG5HeRKhJm
 QOPJDwNQik4t8uuZb7mw6+QoQuyzMBkXvhL7Aud0OluPeSYL2jZPw2IB26gvlUVva+FJRW9X
 7cInI5mnuB4HBGdNpzR+ngRzFyf+qsd6cUrrioQUQozQKCgKG/J2LimV1fC4hQW0n5Q0qM9I
 KX3PtRCgxItQbn/HdqkTXqv8oxDB9cQILJvIYDZnVLojB4rJFUNb397ao3qaXdXj3iaX6wwJ
 2Oo3cSxMGdY/8grRTDGYjItpWEM2noIRzdWSybzavtLHu/LmG4rbgy2aNm/TiVp28G5KvWW/
 fCLomZhN0JscRgSkYjSaxmMgEdks1h9DWTHkiH4EGBEIACYWIQTG5lj1j5VIuKBD/kz7iQsT
 JJ7s+QUCWsDE9AIbDAUJBaOagAAKCRD7iQsTJJ7s+UF2AQDqHEO2tekVMTWJa3SakIM5FJjk
 sao+JkzbKe0vDy4ecwEAukGaHvmKxMZsUOOjDWjDe4eV+aRTVjUjY7LAl3OJkiU=
Message-ID: <e22d87c2-d09b-848a-b520-e80599d895a1@gmail.com>
Date: Sat, 6 Jul 2019 18:31:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <da1d04bb-54ad-5bf7-f62e-1fecbb1e7611@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [GSOC-2019] Problem with initializing crossbar on
 bb-x15 in dom0
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Hunyue Yau <hy-gsoc@hy-research.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA3LzYvMTkgNTo1NyBQTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IAoKPiAKPiAgICAg
IHJjID0gdW5tYXBfbW1pb19yZWdpb25zKGQsIF9nZm4ocGZuX3N0YXJ0KSwKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHBmbl9lbmQgKyBwZm5fc3RhcnQgKyAxLAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgX21mbihwZm5fc3RhcnQpKTsKPiAKPiBZb3UgYXJlIG5vdCBjb21w
dXRpbmcgY29ycmVjdGx5IHRoZSBudW1iZXIgb2YgcGFnZXMuIEkgdGhpbmsgeW91IHdhbnQgCj4g
InBmbl9lbmQgLSBwZm5fc3RhcnQgKyAxIi4KT2ssIEkgY2hhbmdlZCBpdCBhbmQgd2FzIGFibGUg
dG8gYm9vdCB0byB0aGUgcHJldmlvdXMgZXJyb3IuIEkgdGhpbmsgYQpsb2dpY2FsIG5leHQgc3Rl
cCB3b3VsZCBiZSB0byBzZXQgdXAgdGhlIHVhcnQgc29tZWhvdz8KPiAKPiBCdXQgdGhpcyBmZWVs
cyB3ZWlyZCB0byBtYXAgdGhlbiB1bm1hcCB0aGUgbW1pby4gSW5zdGVhZCwgeW91IHNob3VsZCAK
PiBibGFja2xpc3QgdGhlIGNyb3NzYmFyIGRldmljZS4gSGF2ZSBhIGxvb2sgYXQgdGhlIGZpZWxk
IGJsYWNrbGlzdF9kZXYgaW4gCj4gcGxhdGZvcm1fZGVzYy4KSG0sIEkgY2FuIHNlZSB0aGF0IGlu
IHRoZSBkZXZpY2UgdHJlZSB0aGUgY3Jvc3NiYXIgaGFzIGEgcGhhbmRsZQpwcm9wZXJ0eSA8MHgw
MDAwMDAwOD4gYW5kIHRoZSBtYWluIG5vZGUgaGFzIGFuIGludGVycnVwdC1wYXJlbnQgcHJvcGVy
dHkKMHgwMDAwMDAwOC4gU28sIGFsbCB0aGUgaW50ZXJydXB0cyBzZWVtcyB0byBiZSBtYXBwZWQg
dG8gdGhlIGNyb3NzYmFyLgpXb3VsZG4ndCBiZSB0aGF0IGEgcHJvYmxlbSBpZiB3ZSBibGFja2xp
c3QgdGhlIGRldmljZT8gQWxzbywgdGhlIHRlZ3JhCmltcGxlbWVudGF0aW9uIGJsYWNrbGlzdCBv
bmx5IGEgdWFydC4KCi0tIApSZWdhcmRzLCBEZW5pcyBPYnJlemtvdgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
