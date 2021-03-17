Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4480533F3E2
	for <lists+xen-devel@lfdr.de>; Wed, 17 Mar 2021 16:16:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98746.187503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMXu1-00006F-S6; Wed, 17 Mar 2021 15:16:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98746.187503; Wed, 17 Mar 2021 15:16:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMXu1-00005o-Oe; Wed, 17 Mar 2021 15:16:05 +0000
Received: by outflank-mailman (input) for mailman id 98746;
 Wed, 17 Mar 2021 15:16:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lMXu0-00005i-95
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 15:16:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lMXu0-0000FI-8F
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 15:16:04 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lMXu0-0006VW-7W
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 15:16:04 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lMXtv-0002LQ-G4; Wed, 17 Mar 2021 15:15:59 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=Icv57Gp6+BsuyhEq7m+9iroCpbGX5bsczcoIxbrzdy0=; b=V/b9JJtVuvGr4f/gUd9NfoNgLW
	xqVPm76U1RM7393omizClVMCYYMA0Y9TyJuaVoN4Zf0l02mzio59CRngUlYDluwPmEQwteyiT+Z6g
	eNl9y8G5ducgfYI5CEaf62LmNweGIwNaJvfUWl4i+5ZdltFkP/FaDxOwwPszhmEZA4xs=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24658.7471.309734.168120@mariner.uk.xensource.com>
Date: Wed, 17 Mar 2021 15:15:59 +0000
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
    Xen-devel <xen-devel@lists.xenproject.org>,
    Jan Beulich <JBeulich@suse.com>,
    Wei Liu <wl@xen.org>,
    Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 1/3] Revert "x86/msr: drop compatibility #GP handling in
 guest_{rd,wr}msr()"
In-Reply-To: <YFIbEqh9IhrY0Lwr@Air-de-Roger>
References: <20210316161844.1658-1-andrew.cooper3@citrix.com>
	<20210316161844.1658-2-andrew.cooper3@citrix.com>
	<24658.1583.601613.903527@mariner.uk.xensource.com>
	<4b1c13ee-f121-3379-6fb3-c0d4dbb76e48@citrix.com>
	<24658.5692.932979.892439@mariner.uk.xensource.com>
	<YFIbEqh9IhrY0Lwr@Air-de-Roger>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monné writes ("Re: [PATCH 1/3] Revert "x86/msr: drop compatibility #GP handling in guest_{rd,wr}msr()""):
> On Wed, Mar 17, 2021 at 02:46:20PM +0000, Ian Jackson wrote:
> > Roger, can I get your opinion about the possible downside risks of
> > this patch ?
> 
> For patches 1 and 2 the risk is low I think. This is already the same
> handling that we do in pre-4.15, so it's unlikely to cause issues.
> >From a guests PoV they don't change the result of trying to access any
> of the modified MSRs, accessing them will still result in a #GP being
> injected to the guest.
> 
> The main risk for patch 3 would be that reporting 0 for
> MSR_RAPL_POWER_UNIT would result in some kind of issue on certain
> guests, or that it triggers the poking of other MSRs in the
> expectation that they would be available. I think those are quite
> unlikely, and the patch fixes a real issue with Solaris guests.

Thanks.  That is very helpful.

All three patches 

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

but subject to Jan's questions on patch 3 being resolved somehow.

Ian.

