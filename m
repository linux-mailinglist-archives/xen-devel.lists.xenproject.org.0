Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B8330F258
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 12:39:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81269.149877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7cyW-0005eZ-J7; Thu, 04 Feb 2021 11:39:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81269.149877; Thu, 04 Feb 2021 11:39:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7cyW-0005eD-Fp; Thu, 04 Feb 2021 11:39:04 +0000
Received: by outflank-mailman (input) for mailman id 81269;
 Thu, 04 Feb 2021 11:39:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7cyU-0005dL-O4
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 11:39:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7cyU-0001eV-NH
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 11:39:02 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7cyU-0005Tg-Md
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 11:39:02 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l7cyR-0007qR-Eb; Thu, 04 Feb 2021 11:38:59 +0000
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
	bh=Bt5R+eZiexMfpDbKqjOZJnSlNakCvj1WeCRJGb7Yh4w=; b=2uzbtOCn7Q7mF7hQ9NVBZG6YB3
	ypB5Un8BgLBNMzNnoJacYwrc/hERhdcaUsWDiLy/wYG/ZOJ6P5c2whGZ/o7OsoWnWMkBBTPEigB85
	x5W0FOmAm3IJJiD3YpxcllLuwI74rhTcKQnJX/IMRvSfPWf/lCjuuZNovFBG+gPuj0f8=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24603.56531.218802.368677@mariner.uk.xensource.com>
Date: Thu, 4 Feb 2021 11:38:59 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Jan Beulich <jbeulich@suse.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.15] x86/efi: enable MS ABI attribute on clang
In-Reply-To: <20210203175805.86465-1-roger.pau@citrix.com>
References: <20210203175805.86465-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monne writes ("[PATCH for-4.15] x86/efi: enable MS ABI attribute on clang"):
> Or else the EFI service calls will use the wrong calling convention.
> 
> The __ms_abi__ attribute is available on all supported versions of
> clang.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Cc: Ian Jackson <iwj@xenproject.org>
> 
> Without this a Xen built with clang won't be able to correctly use the
> EFI services, leading to weird messages from the firmware and crashes.
> The impact of this fix for GCC users is exactly 0, and will fix the
> build on clang.

Reviewed-by: Ian Jackson <iwj@xenproject.org>

> The biggest fallout from this could be using the attribute on a
> compiler that doesn't support it, which would translate into a build
> failure, but the gitlab tests have shown no issues.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Thanks for the thorough attention to the release question in your
mails.  You're making my work very easy :-).

Ian.

