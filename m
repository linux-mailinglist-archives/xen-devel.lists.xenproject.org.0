Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 544152FFF53
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 10:40:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72634.130825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2suh-0004zv-Hl; Fri, 22 Jan 2021 09:39:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72634.130825; Fri, 22 Jan 2021 09:39:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2suh-0004zW-ET; Fri, 22 Jan 2021 09:39:31 +0000
Received: by outflank-mailman (input) for mailman id 72634;
 Fri, 22 Jan 2021 09:39:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=83/a=GZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l2sug-0004zR-Jv
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 09:39:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c0edf777-ec6e-4d03-a56e-086e55ca4c82;
 Fri, 22 Jan 2021 09:39:28 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0C327AB9F;
 Fri, 22 Jan 2021 09:39:28 +0000 (UTC)
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
X-Inumbo-ID: c0edf777-ec6e-4d03-a56e-086e55ca4c82
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611308368; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PfRz3NjP146cqGUz+Ibt0enQ9Me1trVhRSzb8KPwekU=;
	b=NcFVQuFzp5q1vkRveInEh9RLQG2xVp67iBzNOPiQunhjYomfMkmDyt90RzSaGPBj6ddfVJ
	x9ec0NwPtFDB5vuSeR7jSDV50l5ClslkI9qY4i6kkph4V80KSOaLDITxh7Ghq2Cj4qbkUy
	248XNGuhPYN3p6awVRk+f+BYqEviQ6o=
Subject: Re: [PATCH v3 0/5] Support Secure Boot for multiboot2 Xen
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Daniel Kiper <daniel.kiper@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Olivier Lambert <olivier.lambert@vates.fr>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <cover.1611273359.git.bobbyeshleman@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <109ab168-b312-0082-dfd7-d990bab82480@suse.com>
Date: Fri, 22 Jan 2021 10:39:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <cover.1611273359.git.bobbyeshleman@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22.01.2021 01:51, Bobby Eshleman wrote:
> This is version 3 for a patch set sent out to the ML in 2018 [1] to
> support UEFI Secure Boot for Xen on multiboot2 platforms.
> 
> A new binary, xen.mb.efi, is built.  It contains the mb2 header as well
> as a hand-crafted PE/COFF header.  The dom0 kernel is verified using the
> shim lock protocol.
> 
> I followed with v2 feedback and attempted to convert the PE/COFF header
> into C instead of ASM.  Unfortunately, this was only possible for the
> first part (Legacy) of the PE/COFF header.  The other parts required
> addresses only available at link time (such as __2M_rwdata_end,
> __pe_SizeOfImage, efi_mb_start address, etc...), which effectively ruled
> out C.

I don't follow the conclusion drawn, so would you mind going into
further detail?

Jan

