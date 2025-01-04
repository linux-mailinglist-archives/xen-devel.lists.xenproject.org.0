Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B11A01148
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 01:21:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864695.1275922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTruX-000344-J5; Sat, 04 Jan 2025 00:21:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864695.1275922; Sat, 04 Jan 2025 00:21:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTruX-00031K-G5; Sat, 04 Jan 2025 00:21:01 +0000
Received: by outflank-mailman (input) for mailman id 864695;
 Sat, 04 Jan 2025 00:20:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MbXJ=T4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tTruV-00031D-BE
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 00:20:59 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4038695-ca31-11ef-99a4-01e77a169b0f;
 Sat, 04 Jan 2025 01:20:57 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AE367A4109D;
 Sat,  4 Jan 2025 00:19:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63EF2C4CEDD;
 Sat,  4 Jan 2025 00:20:54 +0000 (UTC)
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
X-Inumbo-ID: c4038695-ca31-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735950055;
	bh=d2gXTBle0r2rC3VZD8twpKsd0+v0LbFWXpI1d0H/QK8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EWSKzH+IWtdilP56Jf902jlgQg8YrQtVfcekqGJz7ezkZTFiZtbkNomEY8f63Nij8
	 pBf+2C9QsMCRY4uDawvxa+BAtbeqPO6XSpTR1qT7Hk2zuQ9Zg3vSDC+F6P4jKPBhOy
	 trXmr9sduQhoNlzHVrLOXHznoOF+L9RqokhUuiyseQE1R8/++WnAKo08LDrWC2O/uA
	 k9nyZGCnpabLCKXNINVNSXDGvgmebLwsOKbyBZDH5hW2zSP1rqO+XREdRvZ09ZTWa7
	 9YcxYenk5TY48ZjLwakINHvqwqL+7R39qbD2EoLBXVY3CMTaV5DJZ9TWD3L33G9H1N
	 NJwsIrBhGoUaQ==
Date: Fri, 3 Jan 2025 16:20:52 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, consulting@bugseng.com
Subject: Re: [PATCH v2 1/2] x86/uaccess: rework user access speculative harden
 guards
In-Reply-To: <e3ec3dad28dc94436c0b330b2f995120@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2501031617280.16425@ubuntu-linux-20-04-desktop>
References: <20241126093508.6966-1-roger.pau@citrix.com> <20241126093508.6966-2-roger.pau@citrix.com> <cf1f87d1-f616-4944-94fa-69a777249072@suse.com> <e3ec3dad28dc94436c0b330b2f995120@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Nicola, one question below

On Wed, 27 Nov 2024, Nicola Vetrini wrote:
> > #define AMD_OSVW_ERRATUM(osvw_id, ...)  osvw_id, __VA_ARGS__, 0
> > 
> > where we're using the C99 form rather than the GNU extension, and where
> > hence __VA_ARGS__ would - by extrapolation of the Misra rule - need
> > parenthesizing, when it isn't and can't be.
> > 
> > Isn't it rather the case that variable argument macros need a more general
> > deviation, if not an adjustment to the Misra rule? Extending the Cc list
> > some ...

Nicola, if you look at the original patch:
https://marc.info/?l=xen-devel&m=173261356716876

"The current guards to select whether user accesses should be speculative
hardened violate Misra rule 20.7, as the UA_KEEP() macro doesn't (and can't)
parenthesize the 'args' argument."

And the very first change in the patch is:

diff --git a/xen/arch/x86/include/asm/uaccess.h b/xen/arch/x86/include/asm/uaccess.h
index 2d01669b96..6b8150ac22 100644
--- a/xen/arch/x86/include/asm/uaccess.h
+++ b/xen/arch/x86/include/asm/uaccess.h
@@ -24,9 +24,6 @@ unsigned int copy_from_unsafe_ll(void *to, const void *from, unsigned int n);
 void noreturn __get_user_bad(void);
 void noreturn __put_user_bad(void);
 
-#define UA_KEEP(args...) args
-#define UA_DROP(args...)
-
 /**
  * get_guest: - Get a simple variable from guest space.
  * @x:   Variable to store result.
 

Do you think there is any way we could configure Eclair, with or without
a deviation, not to detect every use of UA_KEEP as violations?

