Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D82565F79
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2019 20:32:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hldpI-0007Jv-Mt; Thu, 11 Jul 2019 18:29:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QTNt=VI=gmail.com=denisobrezkov@srs-us1.protection.inumbo.net>)
 id 1hldpG-0007Jg-OP
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2019 18:29:50 +0000
X-Inumbo-ID: dda78840-a409-11e9-8980-bc764e045a96
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id dda78840-a409-11e9-8980-bc764e045a96;
 Thu, 11 Jul 2019 18:29:49 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id k8so6738888edr.11
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2019 11:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6Sgwx6jYZKczzsq8OCsDJsuTf/SfzYsV533qsfFWBps=;
 b=MWAiulQP0XCKQooQzf45nAMIym48LbKzjd0XJTBlgFnZU7Y4P80yr699RdUhEsiPcd
 vBLf88/W/d4rM34QZvuUTWteVX1MWWMFALsRF0zkpvaN5VtQzJtCxPIxvT81REYVf012
 WE4MYg5TJU63eTOiVjJ35VSloEWhEC7NZkfiuzpuay5+918ew7HdXPdyIEZsELZ0bSiB
 px/B9GtFURSlVdyxVDgnrrYaY4O5x09MfRnEseJufluckYwbkE7M+gxB3lWP2iihJLur
 b+k2P1jv246J7Ihog7QIEC3RgJL40XGYVLTRiwi3nN2E0vQZhKybC5Tk/8YknDYUtNUI
 yB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=6Sgwx6jYZKczzsq8OCsDJsuTf/SfzYsV533qsfFWBps=;
 b=SEuoUI4+fokMcQzvtAG104TZquCos3G5YMqZtbvJD0NoEwr+zD+WbqQhvwl6EsPZ2r
 3EF/8PDNcLMOOPQWZTw5IGAlFmeJaXKOmiPA6P9B4BtaNFlgZd/iWZuCniGreBrUBzzw
 vFJJ3/0WP86EAXTf+LgJXYJHH+UalES5zGz1Dkhai45vkMrD9Z/hLIPGqxE9vuUS4tBo
 KBvWeUgjDuv69rM1J2Nen2NMnIq4OEidTOX6E3ILRc3SImycD8suTdtMsPsAsFipc6Ob
 EFhfACzbgmmjiTIWLuJGdATt+kxSPwLL+cOzHd2leJo+5Bt7v/m3ooybyofzJyzxsoEu
 zjDg==
X-Gm-Message-State: APjAAAUvRjagmSMjhlkuiYElBPyOg61Pjzj6PxQzcD/qRe09v/ZBcvte
 zcpIslDmIPPqcWjhoBSccbQ=
X-Google-Smtp-Source: APXvYqwUEl8YWR2GWnXmrEOjaKvf0SiqjNL0iRlV0FqI0oBwzX45dK3PEjUQHRIqnvtj8E0AXPnTcQ==
X-Received: by 2002:a50:9929:: with SMTP id k38mr4999746edb.4.1562869788837;
 Thu, 11 Jul 2019 11:29:48 -0700 (PDT)
Received: from ?IPv6:2001:16b8:6623:b200:1e4b:d6ff:fef9:46e6?
 (200116b86623b2001e4bd6fffef946e6.dip.versatel-1u1.de.
 [2001:16b8:6623:b200:1e4b:d6ff:fef9:46e6])
 by smtp.gmail.com with ESMTPSA id nc6sm1294230ejb.62.2019.07.11.11.29.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Jul 2019 11:29:48 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, Hunyue Yau <hy-gsoc@hy-research.com>
References: <25386cfa-d0b7-83fe-4d87-5af3459d54bd@gmail.com>
 <alpine.DEB.2.21.1907101512230.12168@sstabellini-ThinkPad-T480s>
 <e7104450-54ae-6720-9d9f-f4e8889946c8@gmail.com> <520937670.d9P0eaHOQZ@acer0>
 <28955848-fdc0-5311-580b-23fd8ce7bea2@gmail.com>
 <d1d8514d-05e6-66f3-ef8d-95f1b48ccfd4@arm.com>
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
Message-ID: <1de0763d-0945-378d-6838-aeae13191059@gmail.com>
Date: Thu, 11 Jul 2019 20:29:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <d1d8514d-05e6-66f3-ef8d-95f1b48ccfd4@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [GSoC-2019] About the crossbar and xen
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Iain Hunter <drhunter95@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA3LzExLzE5IDc6MzIgUE0sIEp1bGllbiBHcmFsbCB3cm90ZToKCj4+Cj4+IFdoYXQg
ZG8geW91IHRoaW5rPwo+IAo+IEhhdmUgeW91IGxvb2tlZCBhdCB0aGUgc2VyaWVzIEkgcG9pbnRl
ZCBvdXQgZWFybGllciBvbj8gSXQgZXh0ZW5kcyBYZW4KPiB0byBzdXBwb3J0IG90aGVyIGludGVy
cnVwdCBjb250cm9sbGVyIHBhcmVudC4KPiAKWWVzLCBidXQgeW91IHNhaWQgb25jZSB0aGF0IHRo
ZXNlIHBhdGNoIHNlcmllcyB3YXNuJ3QgYWNjZXB0ZWQgYmVjYXVzZQptYWludGFpbmVycyBkaWRu
J3QgbGlrZSBzb21ldGhpbmcuIFNvLCBJIHdhbnRlZCB0byB1bmRlcnN0YW5kIHdoZXRoZXIKdGhp
cyBhcHByb2FjaCBpcyBhY2NlcHRhYmxlLgoKLS0gClJlZ2FyZHMsIERlbmlzIE9icmV6a292Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
