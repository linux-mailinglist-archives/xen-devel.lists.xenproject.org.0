Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBB31DE81B
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 15:33:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc7nQ-0005so-V3; Fri, 22 May 2020 13:33:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L400=7E=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jc7nP-0005sa-Kw
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 13:33:07 +0000
X-Inumbo-ID: c48df004-9c30-11ea-b9cf-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c48df004-9c30-11ea-b9cf-bc764e2007e4;
 Fri, 22 May 2020 13:33:06 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: LsteYU31AyrEhPUfZTgRE8v7ddfrDt4R/9S1KCMro4qUdmaGpBJvP56a92ktwAOszUbuQMAzNk
 ODj/MLM+IL9J7MJtz4JfurNRZLx36sMbWxxu7RxELg2rsYIaDHHCiu2gcPAI75A+TzuN1CwcwN
 /IPGi1c5RYopwxMnnr3xqeLYeKHUVgf0v0v77NGuEn1/AIyp6avHODLYqgBoFTs5ygnTlW41Wg
 ozwwL/d35BDvX+m6FIwAV7bis0IqPmd4mpwPAkzUDE7K5N7lWL12to+iPKVwWbzpJUdK1tj0R7
 p9M=
X-SBRS: 2.7
X-MesageID: 18174891
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,421,1583211600"; d="scan'208";a="18174891"
Date: Fri, 22 May 2020 15:32:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/svm: retry after unhandled NPT fault if gfn was
 marked for recalculation
Message-ID: <20200522133259.GC54375@Air-de-Roger>
References: <1590097438-28829-1-git-send-email-igor.druzhinin@citrix.com>
 <20200522100846.GV54375@Air-de-Roger>
 <04ec4ab4-a121-c5be-0a65-316e237dd793@citrix.com>
 <20200522102339.GX54375@Air-de-Roger>
 <fe6e5c7f-df0f-5436-a7cd-2949464ab9a7@citrix.com>
 <20200522111146.GZ54375@Air-de-Roger>
 <4831dc51-cea1-2870-422b-2af7d6d1f2d6@suse.com>
 <ef3411ac-9e7c-0ef7-ad9f-c24f8ebf32a6@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ef3411ac-9e7c-0ef7-ad9f-c24f8ebf32a6@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, wl@xen.org,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 22, 2020 at 02:11:15PM +0100, Andrew Cooper wrote:
> On 22/05/2020 14:04, Jan Beulich wrote:
> > On 22.05.2020 13:11, Roger Pau Monné wrote:
> >> That being said, I also don't like the fact that logdity is handled
> >> differently between EPT and NPT, as on EPT it's handled as a
> >> misconfig while on NPT it's handled as a violation.
> > Because, well, there is no concept of misconfig in NPT.
> 
> Indeed.  Intel chose to split EPT errors into two - MISCONFIG for
> structural errors (not present, or reserved bits set) and VIOLATION for
> permissions errors.
> 
> AMD reused the same silicon pagewalker design, so have a single
> NPT_FAULT vmexit which behaves much more like a regular pagefault,
> encoding structural vs permission errors in the error code.

Maybe I should clarify, I understand that NPT doesn't have such
differentiation regarding nested page table faults vs EPT, but I feel
like it would be clearer if part of the code could be shared, ie:
unify EPT resolve_misconfig and NPT do_recalc into a single function
for example that uses the necessary p2m-> helpers for the differing
implementations. I think we should be able to tell apart when a NPT
page fault is a recalc one by looking at the bits in the EXITINFO1
error field?

Anyway, this was just a rant, and it's tangential to the issue at
hand, sorry for distracting.

Roger.

