Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D59F8AB351
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 09:37:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i68ly-0003QD-Dp; Fri, 06 Sep 2019 07:35:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TT/o=XB=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1i68lw-0003Q8-B9
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 07:35:08 +0000
X-Inumbo-ID: d1ab19c6-d078-11e9-978d-bc764e2007e4
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1ab19c6-d078-11e9-978d-bc764e2007e4;
 Fri, 06 Sep 2019 07:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qc1A/0vmo5wP4vpvwTJu55z+mim/TKkMRY82VkokPRg=; b=uWf7HwZC/+IfEzfYjKrpXGsBS
 dV8iXCpPucF2YwnrQS+kp6CXHpDlGwGHgBvXlHBCDIKVOt862XnJT5luD34qeLuUWd80qBtaGTkwt
 aij2DPPKlqDp+wV9qhXxxDvxLHyNYhxJHy7WfFuYiHV4ER556QztPNHOcV0Y2KU+3Cmc98ipdcC9g
 2j7qOOLAriTEhUpZAOvG9abuQjS/luDLPFIGe+VNjFGiktwXqcUlcF1MNG6mcmivd5kgD1yGPLua5
 somEbZonUalQeUiM1PUdSv6erPb1viq+FfIsbPYO0yel1ZXLlUkl/2SMb2GB7J+wvbHWaJu7XUoAH
 6TDoTVk0A==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i68lT-00032P-PI; Fri, 06 Sep 2019 07:34:40 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 8FD33303121;
 Fri,  6 Sep 2019 09:33:59 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id D931F29DE7804; Fri,  6 Sep 2019 09:34:36 +0200 (CEST)
Date: Fri, 6 Sep 2019 09:34:36 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Masami Hiramatsu <mhiramat@kernel.org>
Message-ID: <20190906073436.GS2349@hirez.programming.kicks-ass.net>
References: <156773433821.31441.2905951246664148487.stgit@devnote2>
 <156773434815.31441.12739136439382289412.stgit@devnote2>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <156773434815.31441.12739136439382289412.stgit@devnote2>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Randy Dunlap <rdunlap@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Josh Poimboeuf <jpoimboe@redhat.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBTZXAgMDYsIDIwMTkgYXQgMTA6NDU6NDhBTSArMDkwMCwgTWFzYW1pIEhpcmFtYXRz
dSB3cm90ZToKCj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL3hlbi9pbnRlcmZh
Y2UuaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3hlbi9pbnRlcmZhY2UuaAo+IGluZGV4IDYyY2Ew
M2VmNWM2NS4uZmUzM2E5Nzk4NzA4IDEwMDY0NAo+IC0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNt
L3hlbi9pbnRlcmZhY2UuaAo+ICsrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3hlbi9pbnRlcmZh
Y2UuaAo+IEBAIC0zNzksMTIgKzM3OSwxNSBAQCBzdHJ1Y3QgeGVuX3BtdV9hcmNoIHsKPiAgICog
UHJlZml4IGZvcmNlcyBlbXVsYXRpb24gb2Ygc29tZSBub24tdHJhcHBpbmcgaW5zdHJ1Y3Rpb25z
Lgo+ICAgKiBDdXJyZW50bHkgb25seSBDUFVJRC4KPiAgICovCj4gKyNpbmNsdWRlIDxhc20veGVu
L3ByZWZpeC5oPgo+ICsKPiAgI2lmZGVmIF9fQVNTRU1CTFlfXwo+IC0jZGVmaW5lIFhFTl9FTVVM
QVRFX1BSRUZJWCAuYnl0ZSAweDBmLDB4MGIsMHg3OCwweDY1LDB4NmUgOwo+ICsjZGVmaW5lIFhF
Tl9FTVVMQVRFX1BSRUZJWCAuYnl0ZSBfX1hFTl9FTVVMQVRFX1BSRUZJWCA7Cj4gICNkZWZpbmUg
WEVOX0NQVUlEICAgICAgICAgIFhFTl9FTVVMQVRFX1BSRUZJWCBjcHVpZAo+ICAjZWxzZQo+IC0j
ZGVmaW5lIFhFTl9FTVVMQVRFX1BSRUZJWCAiLmJ5dGUgMHgwZiwweDBiLDB4NzgsMHg2NSwweDZl
IDsgIgo+ICsjZGVmaW5lIFhFTl9FTVVMQVRFX1BSRUZJWCAiLmJ5dGUgIiBfX1hFTl9FTVVMQVRF
X1BSRUZJWF9TVFIgIiA7ICIKPiAgI2RlZmluZSBYRU5fQ1BVSUQgICAgICAgICAgWEVOX0VNVUxB
VEVfUFJFRklYICJjcHVpZCIKPiArCj4gICNlbmRpZgoKUG9zc2libHkgeW91IGNhbiBkbyBzb21l
dGhpbmcgbGlrZToKCiNkZWZpbmUgWEVOX0VNVUxBVEVfUFJFRklYCV9fQVNNX0ZPUk0oLmJ5dGUg
X19YRU5fRU1VTEFURV9QUkVGSVggOykKI2RlZmluZSBYRU5fQ1BVSUQJCVhFTl9FTVVMQVRFX1BS
RUZJWCBfX0FTTV9GT1JNKGNwdWlkKQoKPiAgI2VuZGlmIC8qIF9BU01fWDg2X1hFTl9JTlRFUkZB
Q0VfSCAqLwo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS94ZW4vcHJlZml4Lmgg
Yi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS94ZW4vcHJlZml4LmgKPiBuZXcgZmlsZSBtb2RlIDEwMDY0
NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uZjkwMWJlMGQ3YTk1Cj4gLS0tIC9kZXYvbnVsbAo+ICsr
KyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3hlbi9wcmVmaXguaAo+IEBAIC0wLDAgKzEsMTAgQEAK
PiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KPiArI2lmbmRlZiBfVE9P
TFNfQVNNX1g4Nl9YRU5fUFJFRklYX0gKPiArI2RlZmluZSBfVE9PTFNfQVNNX1g4Nl9YRU5fUFJF
RklYX0gKPiArCj4gKyNpbmNsdWRlIDxsaW51eC9zdHJpbmdpZnkuaD4KPiArCj4gKyNkZWZpbmUg
X19YRU5fRU1VTEFURV9QUkVGSVggIDB4MGYsMHgwYiwweDc4LDB4NjUsMHg2ZQo+ICsjZGVmaW5l
IF9fWEVOX0VNVUxBVEVfUFJFRklYX1NUUiAgX19zdHJpbmdpZnkoX19YRU5fRU1VTEFURV9QUkVG
SVgpCj4gKwo+ICsjZW5kaWYKCkhvdyBhYm91dCB3ZSBtYWtlIHRoaXMgYXNtL3ZpcnRfcHJlZml4
Lmggb3Igc29tZXRoaW5nIGFuZCBpbmNsdWRlOgoKLyoKICogVmlydCBlc2NhcGUgc2VxdWVuY2Vz
IHRvIHRyaWdnZXIgaW5zdHJ1Y3Rpb24gZW11bGF0aW9uOwogKiBpZGVhbGx5IHRoZXNlIHdvdWxk
IGRlY29kZSB0byAnd2hvbGUnIGluc3RydWN0aW9uIGFuZCBub3QgZGVzdHJveQogKiB0aGUgaW5z
dHJ1Y3Rpb24gc3RyZWFtOyBzYWRseSB0aGlzIGlzIG5vdCB0cnVlIGZvciB0aGUgJ2t2bScgb25l
IDovCiAqLwoKI2RlZmluZSBfX1hFTl9FTVVMQVRFX1BSRUZJWCAgMHgwZiwweDBiLDB4NzgsMHg2
NSwweDZlICAvKiB1ZDIgOyAuYXNjaWkgInhlbiIgKi8KI2RlZmluZSBfX0tWTV9FTVVMQVRFX1BS
RUZJWCAgMHgwZiwweDBiLDB4NmIsMHg3NiwweDZkCS8qIHVkMiA7IC5hc2NpaSAia3ZtIiAqLwoK
PiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYvbGliL2luc24uYyBiL2FyY2gveDg2L2xpYi9pbnNuLmMK
PiBpbmRleCAwYjU4NjJiYTZhNzUuLmI3ZWI1MDE4N2RiOSAxMDA2NDQKPiAtLS0gYS9hcmNoL3g4
Ni9saWIvaW5zbi5jCj4gKysrIGIvYXJjaC94ODYvbGliL2luc24uYwoKPiBAQCAtNTgsNiArNjEs
MzcgQEAgdm9pZCBpbnNuX2luaXQoc3RydWN0IGluc24gKmluc24sIGNvbnN0IHZvaWQgKmthZGRy
LCBpbnQgYnVmX2xlbiwgaW50IHg4Nl82NCkKPiAgCQlpbnNuLT5hZGRyX2J5dGVzID0gNDsKPiAg
fQo+ICAKPiArc3RhdGljIGNvbnN0IGluc25fYnl0ZV90IHhlbl9wcmVmaXhbXSA9IHsgX19YRU5f
RU1VTEFURV9QUkVGSVggfTsKPiArLyogU2VlIGhhbmRsZV91ZCgpQGFyY2gveDg2L2t2bS94ODYu
YyAqLwo+ICtzdGF0aWMgY29uc3QgaW5zbl9ieXRlX3Qga3ZtX3ByZWZpeFtdID0gIlx4Zlx4Ymt2
bSI7CgpUaGVuIHlvdSBjYW4gbWFrZSB0aGlzIGNvbnNpc3RlbnQ7IG1heWJlIGV2ZW4gc29tZXRo
aW5nIGxpa2U6CgpzdGF0aWMgY29uc3QgaW5zbl9ieXRlX3QgKnZpcnRfcHJlZml4W10gPSB7Cgl7
IF9fWEVOX0VNVUxBVEVfUFJFRklYIH0sCgl7IF9fS1ZNX0VNVUxBVEVfUFJFRklYIH0sCgl7IE5V
TEwgfSwKfTsKCkFuZCB0aGVuIGNoYW5nZSBlbXVsYXRlX3ByZWZpeF9zaXplIHRvIGVtdWxhdGVf
cHJlZml4X2luZGV4ID8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
