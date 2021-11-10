Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF0744C6BF
	for <lists+xen-devel@lfdr.de>; Wed, 10 Nov 2021 19:24:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224377.387674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mksGr-0003NS-NL; Wed, 10 Nov 2021 18:24:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224377.387674; Wed, 10 Nov 2021 18:24:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mksGr-0003KV-JS; Wed, 10 Nov 2021 18:24:29 +0000
Received: by outflank-mailman (input) for mailman id 224377;
 Wed, 10 Nov 2021 18:24:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mksGq-0003KP-8m
 for xen-devel@lists.xenproject.org; Wed, 10 Nov 2021 18:24:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mksGq-0008B2-5G
 for xen-devel@lists.xenproject.org; Wed, 10 Nov 2021 18:24:28 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mksGq-0008Ti-4I
 for xen-devel@lists.xenproject.org; Wed, 10 Nov 2021 18:24:28 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mksGm-0002DL-IA; Wed, 10 Nov 2021 18:24:24 +0000
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
	bh=HinUL7XsycS2d2kjqbipDXEETOyw7kln67zJvl/DxDE=; b=Bv8e7A1gxtSEYs71oXY/Lyr64K
	HG/k7MSRfCvkwZcAQqdRVergx3JqK/yQ+xIk2JZXJXLZGfgPIzZ2hq9daOBXVtXFsPw8tkLefE1pr
	+CxYKLa3gTEf4yNWrJ5TF22s/KYjUgDokYQvkvRxHnA60gnGfoGVEadsJIiiIhep6Q98=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24972.3670.562878.659880@mariner.uk.xensource.com>
Date: Wed, 10 Nov 2021 18:24:22 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Juergen  Gross <jgross@suse.com>,
    Jan Beulich <jbeulich@suse.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.16] x86/cpuid: prevent shrinking migrated policies max leaves
In-Reply-To: <20211110174059.64633-1-roger.pau@citrix.com>
References: <20211110174059.64633-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monne writes ("[PATCH for-4.16] x86/cpuid: prevent shrinking migrated policies max leaves"):
> CPUID policies from guest being migrated shouldn't have the maximum
> leaves shrink, as that would be a guest visible change. The hypervisor
> has no knowledge on whether a guest has been migrated or is build from
> scratch, and hence it must not blindly shrink the CPUID policy in
> recalculate_cpuid_policy. Remove the
> x86_cpuid_policy_shrink_max_leaves call from recalculate_cpuid_policy.
> Removing such call could be seen as a partial revert of 540d911c28.
...
> This is a regression introduced in this release cycle, so we should
> consider whether we want to take this patch. It's mostly moving a
> shrink call from the hypervisor into the toolstack and making it more
> selective.
> 
> Main risks would be this shrinking somehow altering the recalculations
> of the CPUID policy done by the hypervisor. Removing the shirk itself
> in the hypervisor shouldn't cause issues as that wasn't done before,
> and reporting empty max leaf should be fine.

Thank you.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

