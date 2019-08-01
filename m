Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA7B7E033
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 18:30:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htDvx-0006Hc-Iz; Thu, 01 Aug 2019 16:28:05 +0000
Received: from mail6.bemta25.messagelabs.com ([195.245.230.172])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <bcotton@redhat.com>) id 1htDvw-0006HX-HP
 for xen-devel@lists.xensource.com; Thu, 01 Aug 2019 16:28:04 +0000
Received: from [46.226.53.52] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-4.bemta.az-c.eu-west-1.aws.symcld.net id 27/E8-10387-313134D5;
 Thu, 01 Aug 2019 16:28:03 +0000
Authentication-Results: mx.messagelabs.com; spf=pass 
 (server-15.tower-304.messagelabs.com: domain of redhat.com designates 
 209.85.210.179 as permitted sender) smtp.mailfrom=redhat.com; dkim=none 
 (message not signed); dmarc=pass (p=none sp=none adkim=r aspf=r) 
 header.from=redhat.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRWlGSWpSXmKPExsVyMfTSZl0hYed
 Yg3kvTCzuTXnP7sDosb1vF3sAYxRrZl5SfkUCa8a/Iw9YCy6yVFx+49XAeJe5i5GLQ0hgBqPE
 kZsvmUAcCYE5rBIrJs1g72LkBHKqJJ6cX80CYRdJHL9xGipeIbFp9wsmEJtXQFDi5MwnLBCTL
 rNKtPzexQaS4BSwk1g3fSZYM5uAqsTi94uZQWwWARWJM99fs0I0B0g0X+4DiwsLOErc2P6REc
 QWEdCW2H1gNTvIUGaBxywS67sOgG1jFtCUaN3+m30CI/8sJMtnIUktYGRaxWieVJSZnlGSm5i
 Zo2toYKBraGikawSkzcz0Eqt0k/VSS3XLU4tLdA31EsuL9Yorc5NzUvTyUks2MQIDMqXghNMO
 xtVHXusdYpTkYFIS5fW94xQrxJeUn1KZkVicEV9UmpNafIhRhoNDSYJ3laBzrJBgUWp6akVaZ
 g4wOmDSEhw8SiK8R0HSvMUFibnFmekQqVOMxhxLNs5bxMzR8WvRImYhlrz8vFQpcd5akFIBkN
 KM0jy4QbCovcQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmDdRCGgKT2ZeCdy+V0CnMAGdIsz
 qBHJKSSJCSqqBKa0+leF5tkrozgKtD6KxM1ousbl/u3jvpvFNr6C5//k6ljtVpuVu7p9k4seS
 F+ATe2/u/C1lTy7b93ln79yln9p56k+judTEJwa7N8ZsbogufmrbIFZ2Zt2UG2oaZ5lL99zt1
 Cr6U2f98PC0uSte+JmtTDjau38Cc/aEALl/ItL/GKt4V75IU/PmMz5zW4Or4pFSlFTMbhmLiy
 XyqlEty1iF877xTJHq4Xngp8ptVbB/ntiR0z55/w6/XGj+W/FSuJE8G58vo6/WA/OUO0sTK7U
 KwkOX57+I+DLvtFV1zhtZ28qN3BpfDvhuTX/NGjxPpTf76G7Tq4yvlrIqzApc+rlKcM5h44DC
 z9+V1tgpsRRnJBpqMRcVJwIAzhWPm1UDAAA=
X-Env-Sender: bcotton@redhat.com
X-Msg-Ref: server-15.tower-304.messagelabs.com!1564676881!740069!1
X-Originating-IP: [209.85.210.179]
X-SpamReason: No, hits=0.0 required=7.0 tests=newsletters: 
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18809 invoked from network); 1 Aug 2019 16:28:02 -0000
Received: from mail-pf1-f179.google.com (HELO mail-pf1-f179.google.com)
 (209.85.210.179)
 by server-15.tower-304.messagelabs.com with ECDHE-RSA-AES128-GCM-SHA256
 encrypted SMTP; 1 Aug 2019 16:28:02 -0000
Received: by mail-pf1-f179.google.com with SMTP id y15so34373282pfn.5
 for <xen-devel@lists.xensource.com>; Thu, 01 Aug 2019 09:28:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mvqo2h9I2T2ynGKkb3YNmlx5dA7M4p6mHgPqkZAeRps=;
 b=sJc678t2R6kWsYCRfiZ5o6WhnoS8SX7TFnNYFNlAcmdAPEvl/jUUr4pNo3fryIVdq5
 DXmliwN4N1xxlTZVhlYftXoXoH+O7RzrqTtv/uuUK21x039TSca5oJ0cmhFQl6lFJFhH
 g843ho05P7X+RbV60s1p7H+X5+vA+iSYqHwghLU5PKj1AU4EpN5ovLjFMcwfAbS7aWWQ
 lOZ2wX3Jt+iKjk8tB38PRw/tP+YEG/0QSjBj0jBYwO6qFjC+2jvl6xOrxOPy+WiCqVIc
 rmdCCS0lSIHpQn0YEEgOlrYmg5pGOxc+7Gbxtt50sxqMtDryETvY/E/vbj1b2D4tle9Q
 7h6g==
X-Gm-Message-State: APjAAAV0Va2k+/R3m5hhAblRaei1BknGJY4qa3fT2eFnnxIsFJR/u4aB
 cRkJ7ZVtFp707YLSvE3PPRoaiE9PwN3fzbP/knU6bg==
X-Google-Smtp-Source: APXvYqy1K+DQMRZfItKL4HnHWEhrbQJd5i5jl5caN/DjyZQm4RXK16jP++RqjdaPPZ2JqdNAmxHnbhfjhAVKdAdCalw=
X-Received: by 2002:a17:90a:9f4a:: with SMTP id
 q10mr9547718pjv.95.1564676880896; 
 Thu, 01 Aug 2019 09:28:00 -0700 (PDT)
MIME-Version: 1.0
References: <1499367541.22465.102.camel@fedoraproject.org>
 <20170706191317.GE21146@char.us.oracle.com>
 <1499370325.22465.107.camel@fedoraproject.org>
 <06A5F10A-88B7-440F-AADB-56A2F1704A86@xenproject.org>
 <c3fb1646ea39459200c925964fb46ec8a5c04470.camel@redhat.com>
 <081a209f86a08562e9f7a087ba434ad8b1b04309.camel@fedoraproject.org>
 <c230c496979d149d2663528defd7a15d52f7ce6a.camel@infradead.org>
 <CALeDE9Mn_Zd+gCrGHSCkQ8utJ4Hv0G=T=120++yZpRQF5F1sKA@mail.gmail.com>
 <87b8a119fbbd27dd706362e4e57e810cd88d0351.camel@fedoraproject.org>
 <64ed536563d83cdf164e87c044fecdbb75ba73f3.camel@fedoraproject.org>
 <CA+voJeUC1x53nDh8AMG=tW9AThD7Y-fiBMetTH_0+BTT0O=SHg@mail.gmail.com>
 <B807FFB7-A9B7-4858-B6DF-E07FF29C8E69@amazon.com>
In-Reply-To: <B807FFB7-A9B7-4858-B6DF-E07FF29C8E69@amazon.com>
From: Ben Cotton <bcotton@redhat.com>
Date: Thu, 1 Aug 2019 12:27:49 -0400
Message-ID: <CA+voJeWV00Dod-WsV3HRfrK-ZDDmqSPrhTYY5WzHjGDcLOyGjw@mail.gmail.com>
To: "Elnikety, Eslam" <elnikety@amazon.com>
Subject: Re: [Xen-devel] Criteria / validation proposal: drop Xen
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
Cc: For testing and quality assurance of Fedora releases
 <test@lists.fedoraproject.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Lars Kurth <lars.kurth.xen@gmail.com>,
 Fedora Cloud SIG <cloud@lists.fedoraproject.org>,
 Daniel Kiper <daniel.kiper@oracle.com>,
 "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 "xen-devel@lists.xensource.com" <xen-devel@lists.xensource.com>,
 Committers <committers@xenproject.org>, Peter Robinson <pbrobinson@gmail.com>,
 "MICHAEL A. YOUNG" <m.a.young@durham.ac.uk>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgMSwgMjAxOSBhdCAzOjI3IEFNIEVsbmlrZXR5LCBFc2xhbSA8ZWxuaWtldHlA
YW1hem9uLmNvbT4gd3JvdGU6Cj4KPiBCdXQgdDMgaXMgbm90IFhlbi4KPgpUaGF0J3MgYSBnb29k
IHJlYXNvbiB0byBub3QgdXNlIGl0LiA6LSkgSSBwaWNrZWQgaXQgdG8gYmUgYSBzbWFsbCwKY2hl
YXAgaW5zdGFuY2UgdGhhdCB3b3VsZCByZXByZXNlbnQgYSBwb3RlbnRpYWwgdXNlIGNhc2UuIElz
IHRoZSB0MgpmYW1pbHkgWGVuPyBPciB0aGUgbTU/IEkgdGhpbmsgaXQgbWFrZXMgc2Vuc2UgdG8g
d3JpdGUgdGhlIHJlcXVpcmVtZW50CmFzICJ0aGUgbGFzdGVzdCB2ZXJzaW9uIG9mIHRoZSBmb28g
ZmFtaWx5IiBqdXN0IHNvIHRoYXQgd2UncmUgbm90CnVwZGF0aW5nIGl0IGV2ZXJ5IHRpbWUgQVdT
IGFkZHMgYSBuZXcgdmVyc2lvbi4gU28gSSdsbCBkZWZlciB0byB5b3Ugb24Kd2hhdCdzIHRoZSBi
ZXN0IG9wdGlvbiBmb3Igc21hbGwtYW5kLVhlbi4KCgpUaGFua3MsCkJDCgotLSAKQmVuIENvdHRv
bgpIZSAvIEhpbSAvIEhpcwpGZWRvcmEgUHJvZ3JhbSBNYW5hZ2VyClJlZCBIYXQKVFo9QW1lcmlj
YS9JbmRpYW5hL0luZGlhbmFwb2xpcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
