Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E517144565A
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 16:30:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221636.383442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miegv-0008Rr-SJ; Thu, 04 Nov 2021 15:30:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221636.383442; Thu, 04 Nov 2021 15:30:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miegv-0008PE-PK; Thu, 04 Nov 2021 15:30:13 +0000
Received: by outflank-mailman (input) for mailman id 221636;
 Thu, 04 Nov 2021 15:30:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1miegu-0008P8-P1
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 15:30:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1miegu-0006k4-MS
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 15:30:12 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1miegu-0003A3-Lm
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 15:30:12 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1miegm-00039O-7W; Thu, 04 Nov 2021 15:30:04 +0000
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
	bh=bslyrMgq7JcyxCMheEO3gus9zjP9upMu4xt6Cchn8Jg=; b=OUwjlIpMLS4CvnIhE4gyRierHg
	L+YCbXjUDYqm4Hp01bJ2y8n/oQLNKEdCpOiLXShBRdmmZHnlkMJW2czZXCNy61UTSYyIJ/oEYdEzn
	I4T2cil4GKOVODqaKWSixkDLMPEL5C4y3wLV6KVMV0F30s4KJg8Muz4MA+3x1Z8lbQ1o=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24963.64635.597689.447218@mariner.uk.xensource.com>
Date: Thu, 4 Nov 2021 15:30:03 +0000
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.16] x86/passthrough: Fix hvm_gsi_eoi() build with
 GCC 12
In-Reply-To: <YYP7EkWGdvlDzZE8@Air-de-Roger>
References: <20211027200713.22625-1-andrew.cooper3@citrix.com>
	<77acd9ab-1bf0-cc02-3865-bf9844b3eae2@suse.com>
	<24962.46376.136195.463274@mariner.uk.xensource.com>
	<1950ed44-5b0f-bdad-75f9-b91c66d95fdd@suse.com>
	<67d7cf93-2860-f8f1-9de7-932da7f537e0@citrix.com>
	<2051641d-17f4-07ee-9db2-0234e6ce4c70@suse.com>
	<YYP7EkWGdvlDzZE8@Air-de-Roger>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monné writes ("Re: [PATCH for-4.16] x86/passthrough: Fix hvm_gsi_eoi() build with GCC 12"):
> I honestly don't think we expect any property of pirq_dpci, it just
> tells whether a pirq has a dpci associated with it or not. As I said
> on my previous replies I think GCC is not correct in doing the check
> after expanding the macro.
> 
> The relation between a pirq and it's dpci is an implementation detail
> that could change at any point, and hence the complain by GCC would no
> longer be true. That's exactly why we use a macro to get the dpci out
> of a pirq, because how that's obtained is opaque to the caller.
> 
> So while it's true that a NULL pirq will always result in a NULL dpci,
> a non-NULL pirq should not be assumed to result in a non-NULL dpci,
> which is inferred by GCC by expanding the macro.
> 
> In this specific case I think the change is fine for two reasons:
> 
>  * The pirq is obtained from the domain struct.
>  * The domain is known to be HVM because the only caller of
>    hvm_gsi_eoi is hvm_dpci_eoi which in
>    turn is only called by the vIO-APIC and the vPIC emulation code.
> 
> I dislike of GCC doing those checks to expanded macros. In this case I
> think the change is fine due to my reasoning above.
> 
> It might be appropriate to switch pirq_dpci to:
> 
> #define pirq_dpci(d, pirq) \
>     ((is_hvm_domain(d) && (pirq)) ? &(pirq)->arch.hvm.dpci : NULL)
> 
> Or to an inline helper.

Anyway, I don't think there are any functional implications.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

