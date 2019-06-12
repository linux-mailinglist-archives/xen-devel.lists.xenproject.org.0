Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2096042706
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 15:09:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hb2xf-00012a-0C; Wed, 12 Jun 2019 13:06:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LY3b=UL=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1hb2xd-00012U-A8
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 13:06:41 +0000
X-Inumbo-ID: ea5d8aab-8d12-11e9-8980-bc764e045a96
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ea5d8aab-8d12-11e9-8980-bc764e045a96;
 Wed, 12 Jun 2019 13:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Vz71fAv9Dgsi5w8SWFWAKFrTsfzkrQd2BAWGvR/wWuI=; b=fErnmr3AWG76KtAlXl/YU8PcH
 TunZZicwX9oi7ZawY41vyXVmfR5Lsrdam4Nt5CesogYlNN+9bAAyLvoBe87Iv4BSAUSZs48pp8lPw
 YRadvSKrf2MpcW17rAP6mbqKeVAf+gmWrtNDb08tCFvZdQHhydJ/7ezrvMEF0+EedtOvwx1/HlNPI
 p7eAEKvubGtQgWXHLoaa2lCEtyO0tR9rPwhmLu7e8h+HFwCddEahLEpZHNW3LGknuER4plSS9imiN
 OBHEf86p9woXaqAyyCdj96h1Vjb80lIzCNprL9JpN8Dt4DEr55DhlPjlVm4v7aLXygmMW8zqUk9KT
 +2OKIaRaw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=hirez.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hb2xP-0004XY-0m; Wed, 12 Jun 2019 13:06:33 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 89BD620259522; Wed, 12 Jun 2019 13:48:36 +0200 (CEST)
Date: Wed, 12 Jun 2019 13:48:36 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20190612114836.GI3436@hirez.programming.kicks-ass.net>
References: <20190612101228.23898-1-jgross@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190612101228.23898-1-jgross@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH] x86/xen: disable nosmt in Xen guests
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMTI6MTI6MjhQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBXaGVuIHJ1bm5pbmcgYXMgYSBYZW4gZ3Vlc3Qgc2VsZWN0aW5nICJub3NtdCIgZWl0
aGVyIHZpYSBjb21tYW5kIGxpbmUKPiBvciBpbXBsaWNpdGx5IHZpYSBkZWZhdWx0IHNldHRpbmdz
IG1ha2VzIG5vIHNlbnNlLCBhcyB0aGUgZ3Vlc3QgaGFzIG5vCj4gY2x1ZSBhYm91dCB0aGUgcmVh
bCBzeXN0ZW0gdG9wb2xvZ3kgaXQgaXMgcnVubmluZyBvbi4gV2l0aCBYZW4gaXQgaXMKPiB0aGUg
aHlwZXJ2aXNvcidzIGpvYiB0byBlbnN1cmUgdGhlIHByb3BlciBidWcgbWl0aWdhdGlvbnMgYXJl
IGFjdGl2ZQo+IHJlZ2FyZGluZyBzbXQgc2V0dGluZ3MuCj4gCj4gU28gd2hlbiBydW5uaW5nIGFz
IGEgWGVuIGd1ZXN0IHNldCBjcHVfc210X2NvbnRyb2wgdG8gIm5vdCBzdXBwb3J0ZWQiCj4gaW4g
b3JkZXIgdG8gYXZvaWQgZGlzYWJsaW5nIHJhbmRvbSB2Y3B1cy4KCklmIGl0IGRvZXNuJ3QgbWFr
ZSBzZW5zZTsgdGhlbiB0aGUgdG9wb2xvZ3kgc2hvdWxkIG5vdCBleHBvc2UgU01UCnRocmVhZHMg
YW5kIHRoZSBrbm9iIHdpbGwgbm90IGhhdmUgYW55IGVmZmVjdC4KCklmIHlvdSBleHBvc2UgU01U
IHRvcG9sb2d5IGluZm8gdG8gdGhlIGd1ZXN0LCB0aGVuIHlvdSBnZXQgd2hhdCB5b3UgYXNrCmZv
ci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
