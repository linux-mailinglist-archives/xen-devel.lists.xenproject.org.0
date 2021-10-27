Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC9743C6D1
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 11:50:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216812.376562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mffZD-0001CU-Tu; Wed, 27 Oct 2021 09:49:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216812.376562; Wed, 27 Oct 2021 09:49:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mffZD-00019S-QR; Wed, 27 Oct 2021 09:49:55 +0000
Received: by outflank-mailman (input) for mailman id 216812;
 Wed, 27 Oct 2021 09:49:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mffZC-00018i-J2
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 09:49:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mffZC-0000JN-IH
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 09:49:54 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mffZC-0007bR-HX
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 09:49:54 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mffZ7-00074M-Em; Wed, 27 Oct 2021 10:49:49 +0100
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
	bh=JxyqyvZQahu+SmFfOBf6TLjKBOYVW8BxtkDd7aW8iDQ=; b=PEz+322SgrqGTvF3Ea1ECw22di
	kAfug9VB4SAgJHZ36BIUYzVq3KdAxZhhXNnjJPpiGwv8c9cJyAtATVP1LSLgHnsvIRRGUid4xU2W8
	jA4hFc2xpVJOf2AV2RXfC+aIguvwe0f3V2zIAVMTHZ8CnG1cXe9him7k6jZYlL+AwQqk=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24953.8381.24925.802466@mariner.uk.xensource.com>
Date: Wed, 27 Oct 2021 10:49:49 +0100
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew  Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/2] x86: de-duplicate MONITOR/MWAIT CPUID-related
 definitions
Newsgroups: chiark.mail.xen.devel
In-Reply-To: <YW6tx43rw1SEo4fY@MacBook-Air-de-Roger.local>
References: <9963c7a2-f880-66fc-8f12-b1ddd0619c91@suse.com>
	<b809979b-5d43-482b-921b-65a4e203db2f@suse.com>
	<YW6tx43rw1SEo4fY@MacBook-Air-de-Roger.local>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monné writes ("Re: [PATCH 2/2] x86: de-duplicate MONITOR/MWAIT CPUID-related definitions"):
> On Tue, Oct 19, 2021 at 09:08:22AM +0200, Jan Beulich wrote:
> > As of 724b55f48a6c ("x86: introduce MWAIT-based, ACPI-less CPU idle
> > driver") they (also) live in asm/mwait.h; no idea how I missed the
> > duplicates back at the time.
> > 
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

