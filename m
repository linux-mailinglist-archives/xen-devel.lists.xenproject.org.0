Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEE4392DFB
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 14:30:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133076.248128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmF8l-0000rG-OX; Thu, 27 May 2021 12:29:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133076.248128; Thu, 27 May 2021 12:29:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmF8l-0000ok-LS; Thu, 27 May 2021 12:29:31 +0000
Received: by outflank-mailman (input) for mailman id 133076;
 Thu, 27 May 2021 12:29:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HjtO=KW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmF8k-0000oe-Iw
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 12:29:30 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd4d9319-174f-405d-90c9-e07212ec942f;
 Thu, 27 May 2021 12:29:29 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6E11A218DD;
 Thu, 27 May 2021 12:29:28 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 519A811A98;
 Thu, 27 May 2021 12:29:28 +0000 (UTC)
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
X-Inumbo-ID: cd4d9319-174f-405d-90c9-e07212ec942f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622118568; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SCWyRvE5JWWIQWwVbsGK4b5GWaY4O0M7tRlh4MgyuhQ=;
	b=Ybv5HTYupYzbJGPQQZqnq2teQyO+mx4GOh52O4k5zJPr+8SgDHx6GFMIpilgmRfZhCP/Qy
	xtTklwQgNbFVm58D9mjm9T1TpPohwyLwsC9kYwWYgUBYyM410XktLFlk+wlQ7zTPevTwMe
	HgOWNilQRCqsVVY0zQc/nkhaBhaZifk=
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 00/12] x86: memcpy() / memset() (non-)ERMS flavors plus
 fallout
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <8f56a8f4-0482-932f-96a9-c791bebb4610@suse.com>
Date: Thu, 27 May 2021 14:29:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

While the performance varies quite a bit on older (pre-ERMS) and newer
(ERMS) hardware, so far we've been going with just a single flavor of
these two functions, and oddly enough with ones not consistent with one
another. Using plain memcpy() / memset() on MMIO (video frame buffer)
is generally okay, but the ERMS variant of memcpy() turned out to
regress (boot) performance in a way easily visible to the human eye.
Hence as a prerequisite step this series switches the frame buffer
(and VGA) mapping to be write-combining independent of firmware
arrangements (of MTRRs in particular).

v2, besides addressing review feedback not addressed verbally, extends
things to
- driving gcc's inlining of __builtin_mem{cpy,set}(),
- page clearing and scrubbing.

01: x86: introduce ioremap_wc()
02: x86: re-work memset()
03: x86: re-work memcpy()
04: x86: control memset() and memcpy() inlining
05: x86: introduce "hot" and "cold" page clearing functions
06: page-alloc: make scrub_on_page() static
07: mm: allow page scrubbing routine(s) to be arch controlled
08: x86: move .text.kexec
09: video/vesa: unmap frame buffer when relinquishing console
10: video/vesa: drop "vesa-mtrr" command line option
12: video/vesa: adjust (not just) command line option handling

Side note: While strictly speaking the xen/drivers/video/ changes fall
under REST maintainership, with that code getting built for x86 only
I'm restricting Cc-s to x86 maintainers.

Jan

