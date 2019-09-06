Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 023FBAB472
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 10:55:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i69yB-0002gc-TZ; Fri, 06 Sep 2019 08:51:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hqBu=XB=kernel.org=mhiramat@srs-us1.protection.inumbo.net>)
 id 1i69y9-0002gX-VB
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 08:51:49 +0000
X-Inumbo-ID: 902a7054-d083-11e9-abed-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 902a7054-d083-11e9-abed-12813bfff9fa;
 Fri, 06 Sep 2019 08:51:49 +0000 (UTC)
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D635E20578;
 Fri,  6 Sep 2019 08:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567759908;
 bh=dq2PqlTTw4AElMpP7ipwksECqbehXK1zm3qLvsANfrM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YhS2+p4hAE3qi/YHQnaSjDgvtiLthO++VBzJ5h5XyiQRZJxPJNmyCg2B9mfG33C+y
 l7BNfv4Sij6TO4piVHUz+Og3vQy5lzuLx6JpTaXAhLhl6FQ/AQfi4E+5w0G0Oj0Rg6
 OBfosjkDswbiTvw8D57R/XCrMOvOq4VuY8bLRruk=
Date: Fri, 6 Sep 2019 17:51:43 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Masami Hiramatsu <mhiramat@kernel.org>
Message-Id: <20190906175143.469287501610cbca73f0abbb@kernel.org>
In-Reply-To: <20190906174519.699b83f08d81b55203212fa1@kernel.org>
References: <156773433821.31441.2905951246664148487.stgit@devnote2>
 <156773434815.31441.12739136439382289412.stgit@devnote2>
 <20190906073436.GS2349@hirez.programming.kicks-ass.net>
 <20190906174519.699b83f08d81b55203212fa1@kernel.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Subject: Re: [Xen-devel] [PATCH -tip v3 1/2] x86: xen: insn: Decode Xen and
 KVM emulate-prefix signature
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
 Peter Zijlstra <peterz@infradead.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Randy Dunlap <rdunlap@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Josh Poimboeuf <jpoimboe@redhat.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCA2IFNlcCAyMDE5IDE3OjQ1OjE5ICswOTAwCk1hc2FtaSBIaXJhbWF0c3UgPG1oaXJh
bWF0QGtlcm5lbC5vcmc+IHdyb3RlOgoKPiA+IAo+ID4gSG93IGFib3V0IHdlIG1ha2UgdGhpcyBh
c20vdmlydF9wcmVmaXguaCBvciBzb21ldGhpbmcgYW5kIGluY2x1ZGU6Cj4gPiAKPiA+IC8qCj4g
PiAgKiBWaXJ0IGVzY2FwZSBzZXF1ZW5jZXMgdG8gdHJpZ2dlciBpbnN0cnVjdGlvbiBlbXVsYXRp
b247Cj4gPiAgKiBpZGVhbGx5IHRoZXNlIHdvdWxkIGRlY29kZSB0byAnd2hvbGUnIGluc3RydWN0
aW9uIGFuZCBub3QgZGVzdHJveQo+ID4gICogdGhlIGluc3RydWN0aW9uIHN0cmVhbTsgc2FkbHkg
dGhpcyBpcyBub3QgdHJ1ZSBmb3IgdGhlICdrdm0nIG9uZSA6Lwo+ID4gICovCj4gPiAKPiA+ICNk
ZWZpbmUgX19YRU5fRU1VTEFURV9QUkVGSVggIDB4MGYsMHgwYiwweDc4LDB4NjUsMHg2ZSAgLyog
dWQyIDsgLmFzY2lpICJ4ZW4iICovCj4gPiAjZGVmaW5lIF9fS1ZNX0VNVUxBVEVfUFJFRklYICAw
eDBmLDB4MGIsMHg2YiwweDc2LDB4NmQJLyogdWQyIDsgLmFzY2lpICJrdm0iICovCgpCVFcsIHdo
YXQgc2hvdWxkIHdlIGNhbGwgaXQsICJlbXVsYXRlIHByZWZpeCIgb3IgInZpcnQgcHJlZml4Ij8K
InZpcnQgcHJlZml4IiBzb3VuZHMgdG9vIGdlbmVyaWMgdG8gbWUuIFNvIEkgcmF0aGVyIGxpa2Ug
ZW11bGF0ZV9wcmVmaXguaC4KClRoYW5rIHlvdSwKLS0gCk1hc2FtaSBIaXJhbWF0c3UgPG1oaXJh
bWF0QGtlcm5lbC5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
