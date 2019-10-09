Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65741D0EED
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 14:34:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIB7s-000606-Sz; Wed, 09 Oct 2019 12:31:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=N6Vs=YC=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1iIB7q-0005zv-NB
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 12:31:30 +0000
X-Inumbo-ID: b4cdc56a-ea90-11e9-80e3-bc764e2007e4
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4cdc56a-ea90-11e9-80e3-bc764e2007e4;
 Wed, 09 Oct 2019 12:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ge6IyJp6CtTVfQFWwPeoTTgBQJKNq3jXQ5sYXlhTiXg=; b=g306avEzv3jgEY934wrhMuzKR
 zIhvCldX2J/FPckX6Bx/kBxHWTpxiX98Ymnv29/3esKUagx5w3x+LrTTAh4z1Y2080usgkbf7u+Iq
 z7g82y1WIFQxYLPVH/VDXjWoAQOnXDGBpENx8994QU3c9hi2lCXYdclO2jvAa8O+37nhZs1h3mu8j
 g8uN96gsUtdqn4774KU9dF91S0bOQn98mn04mcRt21yJsyuWW/QtYFAYqGcZD6kTSFCQHN5kNl5cb
 YEy0+TZSJRUTNwUpQDB3YhcHUlcGYjhpQHzATA8YCohK7Gre/A8r04eU92qgVGbTWbSXErljCa6s2
 kzqkxRnHw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iIB7Y-0002Ki-Kw; Wed, 09 Oct 2019 12:31:12 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 703A0300565;
 Wed,  9 Oct 2019 14:30:19 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 3B7732009B59E; Wed,  9 Oct 2019 14:31:06 +0200 (CEST)
Date: Wed, 9 Oct 2019 14:31:06 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Masami Hiramatsu <mhiramat@kernel.org>
Message-ID: <20191009123106.GK2311@hirez.programming.kicks-ass.net>
References: <156777561745.25081.1205321122446165328.stgit@devnote2>
 <20190917151403.60023814bda80304777a35e5@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190917151403.60023814bda80304777a35e5@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH -tip v4 0/4] x86: kprobes: Prohibit kprobes
 on Xen/KVM emulate prefixes
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Randy Dunlap <rdunlap@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Josh Poimboeuf <jpoimboe@redhat.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBTZXAgMTcsIDIwMTkgYXQgMDM6MTQ6MDNQTSArMDkwMCwgTWFzYW1pIEhpcmFtYXRz
dSB3cm90ZToKPiBIaSBQZXRlciwKPiAKPiBDb3VsZCB5b3UgcmV2aWV3IHRoaXMgdmVyc2lvbj8K
ClRoZXNlIGxvb2sgZ29vZCB0byBtZTsgc2hhbGwgSSBtZXJnZSB0aGVtIG9yIHdoYXQgd2FzIHRo
ZSBwbGFuPwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
