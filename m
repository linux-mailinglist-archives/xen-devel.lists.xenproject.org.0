Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAF077495C
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 21:52:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580404.908596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTSkc-0008Qi-NV; Tue, 08 Aug 2023 19:52:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580404.908596; Tue, 08 Aug 2023 19:52:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTSkc-0008OU-Kw; Tue, 08 Aug 2023 19:52:18 +0000
Received: by outflank-mailman (input) for mailman id 580404;
 Tue, 08 Aug 2023 19:52:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K7Oi=DZ=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qTSkb-0008OO-Ll
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 19:52:17 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1334efdb-3625-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 21:52:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 4E0718285285;
 Tue,  8 Aug 2023 14:52:15 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id SG_fbO8XG_c0; Tue,  8 Aug 2023 14:52:14 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 8E136828593C;
 Tue,  8 Aug 2023 14:52:14 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Er11vF-l5oIy; Tue,  8 Aug 2023 14:52:14 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 1E61D8285285;
 Tue,  8 Aug 2023 14:52:14 -0500 (CDT)
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
X-Inumbo-ID: 1334efdb-3625-11ee-b280-6b7b168915f2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 8E136828593C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1691524334; bh=S74nCpp+zbs+6j1cN313tLRIw0grqHtroJIyEPXUZkU=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=D/57Npe3f6jh3mhIXThO//OUVtk25ZMWnd02FuI1wtuz7tmOyj8gyf7YSKwqHHvyU
	 Ag/ba1TLcdl0m6v37ZLdwwdtcLanFjfVJmyzG7jte80I55GZFXvCvA7kmp24m2wcEw
	 EsB7fzEfF885cgVtVga3UPXA6KklPzjqUBTXmMJo=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <d3bc8dd2-f502-2ffd-4f86-9bf0ff36d3fe@raptorengineering.com>
Date: Tue, 8 Aug 2023 14:52:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 4/9] xen/ppc: Implement bitops.h
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1691016993.git.sanastasio@raptorengineering.com>
 <63b89c627948015cc9a1c1e5d1775ee9e41508ba.1691016993.git.sanastasio@raptorengineering.com>
 <61ca4a1d-2589-5794-5560-db60e10a7f15@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <61ca4a1d-2589-5794-5560-db60e10a7f15@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/8/23 3:36 AM, Jan Beulich wrote:
> On 03.08.2023 01:03, Shawn Anastasio wrote:
>> Implement bitops.h, based on Linux's implementation as of commit
>> 5321d1b1afb9a17302c6cec79f0cbf823eb0d3fc
> 
> But with PPC32 bits dropped afaics, and with leading hard tabs replaced
> by four spaces - which in turn appears to yield some unhelpful placement
> of line-continuing backslashes. And with some
> asm-generic/bitops/builtin-*.h expanded. Please mention all adjustments
> you made, to allow for some future importing of updates to go as
> smoothly as possible.

Yes, that is all correct. Additionally, the code was adapted to use
32-bit words for bitmap entries like the rest of Xen's architectures do
instead of the 64-bit longs used by the Linux implementation. I provided
the reference to the Linux commit for completeness' sake, but to be
clear, my changes have caused it to diverge enough where I wouldn't
expect direct imports from Linux to be (conveniently) possible.

I'll clarify this in the commit message and also fix the macro
line-continuing backslash spacing.

> Jan

Thanks,
Shawn

