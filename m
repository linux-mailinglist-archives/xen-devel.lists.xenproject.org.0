Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6BE16AA94
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 16:58:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6G5I-0008S7-KF; Mon, 24 Feb 2020 15:55:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6n0g=4M=gmail.com=glenbarney@srs-us1.protection.inumbo.net>)
 id 1j6G5H-0008Rx-Dh
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 15:55:51 +0000
X-Inumbo-ID: 1e34a916-571e-11ea-a490-bc764e2007e4
Received: from mail-qt1-x830.google.com (unknown [2607:f8b0:4864:20::830])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e34a916-571e-11ea-a490-bc764e2007e4;
 Mon, 24 Feb 2020 15:55:45 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id p34so6850888qtb.6;
 Mon, 24 Feb 2020 07:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=zu+TWZbM4CRpRqFHfbtB3hv30KK6Ss7SLoxRTvNFjOU=;
 b=M1SJ9wGp3SzUpf4xtxF8d1Sz7o/OMzrbZrh74EsHYwVy9xKNZi7LV7FIQlJev1L4xK
 JIcYU/OXV/9DKGYSIpoiJD2+Cx0HAk3eZPj+LmzO0PwDp758GOxtYi5Qms5Hyky+JpUD
 e1RM6wZri9zXCyL1VOgPOy0MVRaHDmpviCI9S1RFFAjMO/nNvok/S5OD3pyofe90n0FZ
 o1OC938qH4EW6BKFRialm4eK9zVSD0ZpBKzzVf4corvWAUwwipSCFDmUTJL6V+vn7pkt
 Q4UzV1sNeNI/tImYOVerEqaeOGJYGbIIsHLQMXDdqo2kMFLdHFO6T6mGMK8kXanig6ys
 Okrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=zu+TWZbM4CRpRqFHfbtB3hv30KK6Ss7SLoxRTvNFjOU=;
 b=jU0gKzExRkHGRaUgsFQj3B8DpWEI+5Z18wkPrXNxiyngkRiypDGjrmQedh584xtsBJ
 nV2n8h3f3eYPgsjEcgR9dUxvouChyPe8oPQcyRU+Fi3u94upJuI0UmZKU0w6bR1Dn2Mk
 ImiO7Q9d/XXkK/TKLQt69tFWFRB47wXHSZ3DZ8iOqFkG1y2+C/+gcY/NwwPzaVhBVVU7
 b5Ldx9GF6BB5h8gVtoHJ7JwUweZ0aUHfm7vr2h2Pb3Zz5ZMjhWgoIyE9XZPKgD7Bnmup
 Buc00HKgKWc7x3FS0Pga04yqjY8AlD/QBMWxlg88+wjX29ZX6U7mV3yc9Fsc8iU4Kczs
 3rbQ==
X-Gm-Message-State: APjAAAWdtZRSfvRa3Qod5Z6M1gTLMoZM0iMdQYm41xHiPFSGUaw8f1So
 15RKx5rhoGxKaJLOUredKa8iBIPLyx2oPLf6ZhQ=
X-Google-Smtp-Source: APXvYqwKdm0nKVBR7QNnmMX2wJBh15RXMuZdZTm+72bWlL5ALW1fUoIuhLOLdvbn17EoZsz4/tb4FJ6LsuG/eCvCNww=
X-Received: by 2002:ac8:340c:: with SMTP id u12mr48488914qtb.257.1582559745154; 
 Mon, 24 Feb 2020 07:55:45 -0800 (PST)
MIME-Version: 1.0
References: <CAG6MAzRcvUifqf=m7EE98bz0w_s2+Z=0Nx7YT0SVv75ek0Mc2Q@mail.gmail.com>
 <CAG6MAzR_bU5qnCLKpuUAt-S_dfxjnxgh12gUjnXfsfC7Fw2qMw@mail.gmail.com>
 <CAG6MAzSS0Kw2KHWZpb6O9kfoDKK2spn_WHfy9gnZcZLvES0wnQ@mail.gmail.com>
 <CAG6MAzRZsSaVdO6Qv+Xi1dpaUsrdh+kT9F-_K=8s7fHyXRbFWQ@mail.gmail.com>
In-Reply-To: <CAG6MAzRZsSaVdO6Qv+Xi1dpaUsrdh+kT9F-_K=8s7fHyXRbFWQ@mail.gmail.com>
From: Glen <glenbarney@gmail.com>
Date: Mon, 24 Feb 2020 07:55:33 -0800
Message-ID: <CAAVVsFmwoopngy6U8z1vUBH5j0gzuTLcMX+NcjQRjwshNr_LDw@mail.gmail.com>
To: Tomas Mozes <hydrapolic@gmail.com>, xen-users@lists.xenproject.org, 
 xen-devel@lists.xenproject.org
Subject: Re: [Xen-devel] [Xen-users] xen domU stall on 4.12.1
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU3VuLCBGZWIgMjMsIDIwMjAgYXQgMTE6MTIgUE0gVG9tYXMgTW96ZXMgPGh5ZHJhcG9saWNA
Z21haWwuY29tPiB3cm90ZToKPiBBcyByZXBvcnRlZCBpbiBodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMjAtMDEvbXNnMDAzNjEuaHRtbCBhbmQg
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi11c2Vycy8yMDIw
LTAyL21zZzAwMDQyLmh0bWwsIHN3aXRjaGluZyBiYWNrIHRvIGNyZWRpdDEgc2NoZWR1bGVyIHNl
ZW1zIHRvIG1ha2UgaXQgd29ya2luZyBhZ2Fpbi4gSSd2ZSBtaWdyYXRlZCA2IG1hY2hpbmVzIHRv
IFhlbiA0LjEyIHdpdGggc2NoZWQ9Y3JlZGl0IHhlbiBvcHRpb24gYW5kIGhhdmVuJ3Qgb2JzZXJ2
ZWQgYSBoYW5nIGZvciBtb3JlIHRoYW4gYSB3ZWVrIG5vdy4KCk15IGV4cGVyaWVuY2UgaXMgdGhl
IHNhbWUuICBJIGhhdmUgbWlncmF0ZWQgYWxsIDE2IG9mIG15IHBoeXNpY2FsCmhvc3RzIGJhY2sg
dG8gT3BlblN1c2UgMTUuMSB3aXRoIFhlbiA0LjEyLjEgd2l0aCBzY2hlZD1jcmVkaXQgLiAgQWxs
Cmd1ZXN0cyBhcmUgbm93IHJ1bm5pbmcgcGVyZmVjdGx5LCB3aXRob3V0IGFueSBpc3N1ZXMgYXQg
YWxsLiAgT3Zlcgp0aGlzIHBhc3Qgd2VlayBJIHBlcmZvcm1lZCBkaXJlY3RlZCBzdHJlc3MtdGVz
dGluZyBhZ2FpbnN0IHNldmVyYWwgb2YKbXkgZ3Vlc3RzLCBhbmQgdGhleSBhbGwgc3Vydml2ZWQg
d2l0aG91dCBhbnkgcHJvYmxlbXMgYXQgYWxsLiAgSSd2ZQpub3cgY29tcGxldGVseSBteSBtaWdy
YXRpb24gdG8gdGhlIG5ldyBndWVzdHMsIGFuZCBldmVyeW9uZSBpcyBoYXBweS4KCkknbSBub3cg
Z29pbmcgdG8gYnJpbmcgb25lIG9mIHRoZSBwcmV2aW91c2x5LWxpdmUgZ3Vlc3RzIG9uIGl0cyBv
d24KaG9zdCBiYWNrIHRvIGNyZWRpdDIgc28gSSBjYW4gY3Jhc2ggaXQgYW5kIHRyeSB0byBjYXB0
dXJlIGRlYnVnZ2luZwpvdXRwdXQgZm9yIHhlbi1kZXZlbCBhcyByZXF1ZXN0ZWQuICBCdXQgc2No
ZWQ9Y3JlZGl0IGlzIGRlZmluaXRlbHkKd2hhdCB3ZSBuZWVkZWQgdG8gc29sdmUgdGhpcyBwcm9i
bGVtISAgVGhhbmsgeW91IGFsbCBmb3IgaGVscGluZyB1cwpnZXQgdGhlcmUhCgpHbGVuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
