Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EE36C2DE
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 23:58:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnrtg-0001Uk-63; Wed, 17 Jul 2019 21:55:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yNpr=VO=gmail.com=denisobrezkov@srs-us1.protection.inumbo.net>)
 id 1hnrtf-0001Uf-BX
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 21:55:35 +0000
X-Inumbo-ID: 9a0d90e3-a8dd-11e9-8980-bc764e045a96
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9a0d90e3-a8dd-11e9-8980-bc764e045a96;
 Wed, 17 Jul 2019 21:55:34 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id p15so27776001eds.8
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jul 2019 14:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KKfpl3rmXwCJyTndI02tZ0ncu+sMVS++KkgE2k9lOoc=;
 b=pBP7AiAwaS/KNhUIPa05y/Mo2hC5XA5pZALNrGCogT3bUT9Wth46suA2y2gBHhwEyr
 kkqaz4L94/NoD6+IuDR/Oo80+rOtSEz6EVOYUyJjMle1rkMo/Ihojjz+OcscWyq43yqs
 do8u1Y8ilfgOFB3o4KzcfRzqQ5v3IevnDMRPbQCOsxojf01+IfdAfCL+XbzdURMYYYFn
 xX88utAgHSaESRJjbXA7jl3RlAC3txP2awJyNrO66ih4OJCG/JeFvkb5QbMTjX+WkdFD
 P5R1uUPlgzsw8HibGKNan5rt0M52rwRDdnPyY37gkXXGyXTrOFfCYl9QyrU9FRej2guh
 9iCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=KKfpl3rmXwCJyTndI02tZ0ncu+sMVS++KkgE2k9lOoc=;
 b=npWNVISlVExGiVQZ7vNSatpOeGWG5HpVtxe3OHqXuCuJUzlq5NM5LYLTdloDjatRHV
 Y2OJp+FnMmxArIDprdFK69ESMdZTK6eXeBgIPzuhdBDr92LpOefez3moXFv9ydiecl9U
 gg06xqZ/3/4IOnw4wtCb1cJE8nLeaO0GKbM+0Mn5+y3salxb2E8xPObYnzoBgElttJmK
 0tNRrtrimSv2QW5guwr2iROQldJDbShLxz3RiKLng6KAh+kw7lTdGdk56YrAtVTbhpmv
 zUQswmo7BsWG5wFiJQ4TvoN3XWvQARGqvTmVeLrBq6FJnuKvREBwsoZtwf0V4S3FBJfi
 YJ4A==
X-Gm-Message-State: APjAAAWNdi/2fs5ycnE3plIMrur7HgyyaQleH1L8NBdTmjGBZTxv4M11
 gA2PUPsIeUbnwWlZcGicd3U=
X-Google-Smtp-Source: APXvYqwhnVui0ytgnUl8i7iJ7Z8/SbSMtmnl507uSNlC36vM3n5bF4EN0xUpalt5DsL67sEfNnMZgw==
X-Received: by 2002:a50:fd91:: with SMTP id o17mr2820740edt.86.1563400533397; 
 Wed, 17 Jul 2019 14:55:33 -0700 (PDT)
Received: from ?IPv6:2001:16b8:665f:2100:1e4b:d6ff:fef9:46e6?
 (200116b8665f21001e4bd6fffef946e6.dip.versatel-1u1.de.
 [2001:16b8:665f:2100:1e4b:d6ff:fef9:46e6])
 by smtp.gmail.com with ESMTPSA id m31sm7249401edd.42.2019.07.17.14.55.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Jul 2019 14:55:32 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <8af4cfa481e24256b822f64efc6a0f45ae87cf65.1561750725.git.denisobrezkov@gmail.com>
 <a94734d2-ea51-3ba3-917b-e7cf21ace1d0@arm.com>
 <d304061e-f34e-d0e6-04a4-1a8bfc7414fa@gmail.com>
 <3261754d-f036-fbf1-d111-3ad10aa6f2eb@arm.com>
From: Denis Obrezkov <denisobrezkov@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=denisobrezkov@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <b2543b3f-a235-fc96-30f0-461de0458656@gmail.com>
Date: Wed, 17 Jul 2019 23:55:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3261754d-f036-fbf1-d111-3ad10aa6f2eb@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen/arm: Switch OMAP5 secondary cores
 into hyp mode
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
Cc: hy-gsoc@hy-research.com, sstabellini@kernel.org, drhunter95@gmail.com,
 andre.przywara@arm.com, tim@xen.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, baozich@gmail.com,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgo+IAo+IFdlbGwsIFhlbiBoYXMgYmVlbiBzdXBwb3J0ZWQgdGhlIG9tYXA1IGZvciBxdWl0
ZSBhIHdoaWxlLiBTbyB0aGVyZSBhcmUKPiB0d28gcG9zc2liaWxpdGllcyByZWdhcmRpbmcgdGhl
IGN1cnJlbnQgU01QIGNvZGU6Cj4gwqDCoCAxKSBJdCBpcyB0b3RhbGx5IGJyb2tlbiBhbmQgdGhl
cmVmb3JlIG5ldmVyIHdvcmtlZCBvbiBhbnkgb21hcDUKPiBwbGF0Zm9ybS4KPiDCoMKgIDIpIEl0
IHdvcmtzIGJ1dCB3aXRoIG1heWJlIG1vZGlmaWNhdGlvbiBpbiBVLWJvb3QuCj4gCj4gTG9va2lu
ZyBhdCB0aGUgbWFpbGluZyBsaXN0IGFyY2hpdmUgYW5kIHdpa2ksIEkgYmVsaWV2ZSAyKSBpcyBj
bG9zZXIgdG8KPiB0aGUgY3VycmVudCByZWFsaXR5LiBTbyB0aGlzIHJhaXNlIHRoZSBxdWVzdGlv
biB3aGV0aGVyIHlvdXIgcGF0Y2ggd2lsbAo+IGJyZWFrIGFueSBleGlzdGluZyBzZXR1cC4KPiAK
PiBEb24ndCBnZXQgbWUgd3JvbmcsIHRoZSBjb2RlIGlzIHBlcmZlY3RseSBmaW5lIGFzLCB0byB0
aGUgYmVzdCBvZiBteQo+IGtub3dsZWRnZSwgaXQgbWF0Y2hlcyB3aGF0IExpbnV4IGRvZXMuIEhv
d2V2ZXIsIEkgd291bGQgbGlrZSB0byBzZWUgYW4KPiBhbmFseXNpcyB3cml0dGVuIGluIHRoZSBj
b21taXQgbWVzc2FnZSByZWdhcmRpbmcgd2hhdCdzIGdvaW5nIHRvIGhhcHBlbgo+IGZvciBhbnkg
ZXhpc3Rpbmcgc2V0dXAuCj4gCj4gQ2hlZXJzLAo+IAoKSSBob3BlZCB0byBoZWFyIG1vcmUgb3Bp
bmlvbnMgYmVjYXVzZSBJIGRvbid0IHJlYWxseSB1bmRlcnN0YW5kIHdoZXJlIHRvCnN0YXJ0IC0g
SSBkb24ndCBrbm93IG11Y2ggYWJvdXQgaG93IHhlbiBhbmQgTGludXggd29ya2VkIHdpdGggb21h
cDUuCgotLSAKUmVnYXJkcywgRGVuaXMgT2JyZXprb3YKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
