Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F265DA45D
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2019 05:31:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKwRM-00082I-Iu; Thu, 17 Oct 2019 03:27:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ntod=YK=kernel.org=mhiramat@srs-us1.protection.inumbo.net>)
 id 1iKwRL-00082D-Dm
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2019 03:27:03 +0000
X-Inumbo-ID: fbc1b82a-f08d-11e9-93c1-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fbc1b82a-f08d-11e9-93c1-12813bfff9fa;
 Thu, 17 Oct 2019 03:27:02 +0000 (UTC)
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 699EC20640;
 Thu, 17 Oct 2019 03:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571282821;
 bh=XvBeg7TzhsqdaOPxVpJmWL2oonJbx2FFN9cGwYruGQc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qoTsYbcs/HLjh7anCCftNRsW8YVQ03EeYfp635WLn/ka7G15TJOANN23/4lcSj+ev
 r8DYbxdQftGy84Gu77XbREd3T6sT6eDgBw4XHQ56QCFCZ36rqpQj/k/UCuV4a3ECh5
 gY4S1RWgElkUHJaAKIqmC+vOZyA/vz0djXCgfdT4=
Date: Thu, 17 Oct 2019 12:26:55 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Message-Id: <20191017122655.6fae3c0e44417a0af30cd2d1@kernel.org>
In-Reply-To: <20191009123106.GK2311@hirez.programming.kicks-ass.net>
References: <156777561745.25081.1205321122446165328.stgit@devnote2>
 <20190917151403.60023814bda80304777a35e5@kernel.org>
 <20191009123106.GK2311@hirez.programming.kicks-ass.net>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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

SGkgUGV0ZXIsCgpPbiBXZWQsIDkgT2N0IDIwMTkgMTQ6MzE6MDYgKzAyMDAKUGV0ZXIgWmlqbHN0
cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPiB3cm90ZToKCj4gT24gVHVlLCBTZXAgMTcsIDIwMTkg
YXQgMDM6MTQ6MDNQTSArMDkwMCwgTWFzYW1pIEhpcmFtYXRzdSB3cm90ZToKPiA+IEhpIFBldGVy
LAo+ID4gCj4gPiBDb3VsZCB5b3UgcmV2aWV3IHRoaXMgdmVyc2lvbj8KPiAKPiBUaGVzZSBsb29r
IGdvb2QgdG8gbWU7IHNoYWxsIEkgbWVyZ2UgdGhlbSBvciB3aGF0IHdhcyB0aGUgcGxhbj8KClRo
YW5rcyBmb3IgdGhlIHJldmlldywgeWVzLCBjb3VsZCB5b3UgbWVyZ2UgdGhpcyBzZXJpZXMgdG8g
c3VwcG9ydCBlbXVsYXRlZCBwcmVmaXhlcyBjb3JyZWN0bHk/CgpUaGFuayB5b3UsCgotLSAKTWFz
YW1pIEhpcmFtYXRzdSA8bWhpcmFtYXRAa2VybmVsLm9yZz4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
