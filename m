Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A86CA9D03
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 10:30:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5n6c-00083T-I2; Thu, 05 Sep 2019 08:27:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A+Jx=XA=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1i5n6a-00083O-SP
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 08:27:01 +0000
X-Inumbo-ID: eac62c42-cfb6-11e9-b299-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eac62c42-cfb6-11e9-b299-bc764e2007e4;
 Thu, 05 Sep 2019 08:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T29HodBB++BKOCDptdMCNIsRzIU120R7kdF9uHbtmks=; b=UqdnQMjmtW19KSZrfKLHCPF4Q
 fGEVr4nbDik31n728nyaw2T0mxPNcCefnf9ns8C8tqhZKAdzSl4bhlsNrEleFzoexO5B/SBBv9pZ1
 gP9SAQN2MOR1kDvVSxtS5jWdPes3qUDGPC65tqRxYNSU8TlEa3ABWQO4fuvr7DqnumBUREc9abOfb
 pm8a9ftCNMHb4ubY4rrxy9wpBbWDgwiq/k74bEM3ocaT6SWNGYh6gwhh8ZWMSWQPmMhuOKCylsbrb
 ei30B0ulngvsmH4dr4EArVzL+/inlrpqCjWKVUkcx0UCiQ7Fwh+9S3nwK1zNoC/uv0dlDj2qmXDzO
 md6vSHZEA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i5n6Q-0005aT-I9; Thu, 05 Sep 2019 08:26:50 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id B44AE305E47;
 Thu,  5 Sep 2019 10:26:10 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 95DF220977763; Thu,  5 Sep 2019 10:26:47 +0200 (CEST)
Date: Thu, 5 Sep 2019 10:26:47 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190905082647.GZ2332@hirez.programming.kicks-ass.net>
References: <156759754770.24473.11832897710080799131.stgit@devnote2>
 <ad6431be-c86e-5ed5-518a-d1e9d1959e80@citrix.com>
 <20190905104937.60aa03f699a9c0fbf1b651b9@kernel.org>
 <1372ce73-e2d8-6144-57df-a98429587826@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1372ce73-e2d8-6144-57df-a98429587826@citrix.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH -tip 0/2] x86: Prohibit kprobes on
 XEN_EMULATE_PREFIX
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
 Stefano Stabellini <sstabellini@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Randy Dunlap <rdunlap@infradead.org>, Josh Poimboeuf <jpoimboe@redhat.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Ingo Molnar <mingo@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBTZXAgMDUsIDIwMTkgYXQgMDg6NTQ6MTdBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKCj4gSSBkb24ndCBrbm93IGlmIHlvdSd2ZSBzcG90dGVkLCBidXQgdGhlIHByZWZpeCBp
cyBhIHVkMmEgaW5zdHJ1Y3Rpb24KPiBmb2xsb3dlZCBieSAneGVuJyBpbiBhc2NpaS4KPgo+IFRo
ZSBLVk0gdmVyc2lvbiB3YXMgYWRkZWQgaW4gYy9zIDZjODZlZWRjMjA2ZGQxZjlkMzdhMjc5NmZh
YThlNmYyMjc4MjE1ZDIKCldoaWxlIHRoZSBYZW4gb25lIGRpc2Fzc2VibGVzIHRvIHZhbGlkIGlu
c3RydWN0aW9ucywgdGhhdCBLVk0gb25lIGRvZXMKbm90OgoKCS50ZXh0CnhlbjoKCXVkMjsgLmFz
Y2lpICJ4ZW4iCmt2bToKCXVkMjsgLmFzY2lpICJrdm0iCgpkaXNhc3NlbWJsZXMgbGlrZToKCjAw
MDAwMDAwMDAwMDAwMDAgPHhlbj46CiAgIDA6ICAgMGYgMGIgICAgICAgICAgICAgICAgICAgdWQy
CiAgIDI6ICAgNzggNjUgICAgICAgICAgICAgICAgICAganMgICAgIDY5IDxrdm0rMHg2ND4KICAg
NDogICA2ZSAgICAgICAgICAgICAgICAgICAgICBvdXRzYiAgJWRzOiglcnNpKSwoJWR4KQowMDAw
MDAwMDAwMDAwMDA1IDxrdm0+OgogICA1OiAgIDBmIDBiICAgICAgICAgICAgICAgICAgIHVkMgog
ICA3OiAgIDZiICAgICAgICAgICAgICAgICAgICAgIC5ieXRlIDB4NmIKICAgODogICA3NiA2ZCAg
ICAgICAgICAgICAgICAgICBqYmUgICAgNzcgPGt2bSsweDcyPgoKV2hpY2ggaXMgYSBiaXQgdW5m
b3J0dW5hdGUgSSBzdXBwb3NlLiBBdCBsZWFzdCB0aGV5IGRvbid0IGFwcGVhciB0bwpjb25zdW1l
IGZ1cnRoZXIgYnl0ZXMuCgpJIGtub3cgaXQgaXMgd2F0ZXIgdW5kZXIgdGhlIGJyaWRnZSBhdCB0
aGlzIHBvaW50OyBidXQgeW91IGNvdWxkJ3ZlIHVzZWQKVUQxIHdpdGggYSBkaXNwbGFjZW1lbnQg
d2l0aCBzb21lICd1bmxpa2VseScgdmFsdWVzLiBUaGF0IHdheSBpdAp3b3VsZCd2ZSBkZWNvZGVk
IHRvIGEgc2luZ2xlIGluc3RydWN0aW9uLgoKU29tZXRoaW5nIGxpa2U6CgoJdWQxICAgIDB4NmU2
NTc4KCVyYXgpLCVyYXgKCndoaWNoIHNwZWxscyBvdXQgInhlblwwIiBpbiB0aGUgZGlzcGxhY2Vt
ZW50OgoKCTQ4IDBmIGI5IDgwIDc4IDY1IDZlIDAwCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
