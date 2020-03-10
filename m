Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAED917FFCE
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 15:09:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBfWQ-0007LT-5R; Tue, 10 Mar 2020 14:06:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HhRS=43=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jBfWO-0007LK-LV
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 14:06:12 +0000
X-Inumbo-ID: 4bf3c2cc-62d8-11ea-92cf-bc764e2007e4
Received: from mail-ed1-x52a.google.com (unknown [2a00:1450:4864:20::52a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4bf3c2cc-62d8-11ea-92cf-bc764e2007e4;
 Tue, 10 Mar 2020 14:06:12 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id n18so16450480edw.9
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2020 07:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=gSKYPb1c6r52Kv6GLMNubxc3RTEXCmPrvtMXa0ml/G8=;
 b=cDb/u4dQd8s1FrJH8qWwXrZtUSjJhGKeQhMISKg9vpEw6RBjNfVnMPMWPHWLInu/px
 1SHM+5pxHHtUZAw/6dPFI99vW72iigpSNpmw/1JWhmx+IvE/Rl2rN7Uy1wKYHb5qFXco
 E2s+eNcdxuU9WjgsFCkiAxbG28mvz6lOhGHZ5L5S7zG5fi4DMEf0GPKoVXu+ji6S3ORr
 wpAtFetJ9KNhawSUCR/dWXqMF1uuZG+M5FA+IOrgrdkfkQfqgYGVCz3AddforIT/3Wvn
 T1ZtmzqVIKAUxp1CkghT6CFmjj1EAxIvTeDrPpq3Op+KKa80LlitTwOl907U9CRBGYZ7
 co1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=gSKYPb1c6r52Kv6GLMNubxc3RTEXCmPrvtMXa0ml/G8=;
 b=HMnDPxACEVVF/hqK4simPYbD/MuB278k4A5rZjyVfE2s99aQMGZvx551HZxDmCqRyB
 35yPVlnsRm+WgpdrQIxIbDTF3vlPCBQSIDP4o3RLeBiQJKrV5XrPrkOjjJzbNDfiKv5D
 eLCiby7KY1IsiIaJ3tHjwBonas1r+s9e6ftjpp7fAiC3v4tSLXXiVmCFF2eQoUfJdFRJ
 l6RFFiMqQcsLlyBuUzqLBiTGeKeo1au4LTkAVRc44WSi41tCxSJNBFgAZLtFNFvi6W/H
 FP7jbrDhEiRJSjZO2RP1KyWELyXkekz5q3Ud/ETInHUIOgmicKa9Uz2UQSGEQlbLHTP2
 eK0Q==
X-Gm-Message-State: ANhLgQ2UI1kuAjHrtPRXZfCcW/h2vmK65Q7IH418xiFO+8x8ENb4GyfP
 njZEwGTY9twlXy5tjOpXgyg=
X-Google-Smtp-Source: ADFU+vuxol4Lalpdw05WWqdoX2P1w+ayvEVx97aQ7sPmkyJO1Dr8TD8g3EvlXn7zWJsi6aOQI6H/Kg==
X-Received: by 2002:aa7:c50e:: with SMTP id o14mr14812116edq.164.1583849171227; 
 Tue, 10 Mar 2020 07:06:11 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id f23sm2684893ejy.7.2020.03.10.07.06.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 Mar 2020 07:06:10 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <20200310124353.4337-1-paul@xen.org>
 <cb92de03-a210-ea3e-ad73-c0c817e29c4b@suse.com>
In-Reply-To: <cb92de03-a210-ea3e-ad73-c0c817e29c4b@suse.com>
Date: Tue, 10 Mar 2020 14:06:09 -0000
Message-ID: <001401d5f6e5$0d310e00$27932a00$@xen.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIxSMevZMd+y3oS17Sz/lIoH9B5zAIXt5wFp3p6sdA=
Content-Language: en-gb
Subject: Re: [Xen-devel] [PATCH v5] x86: irq: Do not BUG_ON multiple unbind
 calls for shared pirqs
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
Reply-To: paul@xen.org
Cc: xen-devel@lists.xenproject.org, 'Varad Gautam' <vrd@amazon.de>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Julien Grall' <julien@xen.org>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KPiBTZW50OiAxMCBNYXJjaCAyMDIwIDEzOjU3Cj4gVG86IHBhdWxAeGVuLm9y
Zwo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IFZhcmFkIEdhdXRhbSA8dnJk
QGFtYXpvbi5kZT47IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBSb2dlcgo+IFBhdSBN
b25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY1XSB4ODY6IGlycTogRG8gbm90
IEJVR19PTiBtdWx0aXBsZSB1bmJpbmQgY2FsbHMgZm9yIHNoYXJlZCBwaXJxcwo+IAo+IE9uIDEw
LjAzLjIwMjAgMTM6NDMsIHBhdWxAeGVuLm9yZyB3cm90ZToKPiA+IHY1Ogo+ID4gIC0gQlVHX09O
KCFzaGFyZWFibGUpIHJhdGhlciB0aGFuIEFTU0VSVChzaGFyZWFibGUpCj4gPiAgLSBEcm9wIEFT
U0VSVCBvbiBucl9ndWVzdHMKPiAKPiBXaHkgZHJvcCwgcmF0aGVyIHRoYW4gbW92ZSAuLi4KPiAK
PiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9pcnEuYwo+ID4gKysrIGIveGVuL2FyY2gveDg2L2lycS5j
Cj4gPiBAQCAtMTY4MCw5ICsxNjgwLDIyIEBAIHN0YXRpYyBpcnFfZ3Vlc3RfYWN0aW9uX3QgKl9f
cGlycV9ndWVzdF91bmJpbmQoCj4gPgo+ID4gICAgICBCVUdfT04oIShkZXNjLT5zdGF0dXMgJiBJ
UlFfR1VFU1QpKTsKPiA+Cj4gPiAtICAgIGZvciAoIGkgPSAwOyAoaSA8IGFjdGlvbi0+bnJfZ3Vl
c3RzKSAmJiAoYWN0aW9uLT5ndWVzdFtpXSAhPSBkKTsgaSsrICkKPiA+IC0gICAgICAgIGNvbnRp
bnVlOwo+ID4gLSAgICBCVUdfT04oaSA9PSBhY3Rpb24tPm5yX2d1ZXN0cyk7Cj4gPiArICAgIGZv
ciAoIGkgPSAwOyBpIDwgYWN0aW9uLT5ucl9ndWVzdHM7IGkrKyApCj4gPiArICAgICAgICBpZiAo
IGFjdGlvbi0+Z3Vlc3RbaV0gPT0gZCApCj4gPiArICAgICAgICAgICAgYnJlYWs7Cj4gPiArCj4g
PiArICAgIGlmICggaSA9PSBhY3Rpb24tPm5yX2d1ZXN0cyApIC8qIE5vIG1hdGNoaW5nIGVudHJ5
ICovCj4gPiArICAgIHsKPiAKPiAuLi4gYmFjayBoZXJlPyAoVGhpcyB3b3VsZCBiZSBlYXN5IGVu
b3VnaCB0byB0YWtlIGNhcmUgb2Ygd2hpbGUKPiBjb21taXR0aW5nLCBpZmYgd2UgZGVjaWRlZCB0
byBnbyB3aXRoIHRoaXMgdmFyaWFudC4pCgpPaywgbGV0J3Mgc2VlIGhvdyB5b3VyIGFsdGVybmF0
aXZlIGdvZXMuCgogIFBhdWwKCj4gCj4gSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
