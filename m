Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BD030F3C9
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 14:22:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81298.150007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7eZI-0000q1-Om; Thu, 04 Feb 2021 13:21:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81298.150007; Thu, 04 Feb 2021 13:21:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7eZI-0000pc-LK; Thu, 04 Feb 2021 13:21:08 +0000
Received: by outflank-mailman (input) for mailman id 81298;
 Thu, 04 Feb 2021 13:21:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+S2h=HG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l7eZH-0000pX-PS
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 13:21:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2fe32ee2-ee77-47e9-b75b-f250e306ad46;
 Thu, 04 Feb 2021 13:21:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4F4E0ACB0;
 Thu,  4 Feb 2021 13:21:05 +0000 (UTC)
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
X-Inumbo-ID: 2fe32ee2-ee77-47e9-b75b-f250e306ad46
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612444865; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dJzs662lbqQRyLLNgk7X6iCFiUXewoAvT9uUnaWPOqs=;
	b=hxc/wFGbOQAQOjYIlz1B9xY2d/FXqsAS3sesgzEmeN3/lWf9TarAtn+8jTSmwkJeS9Kk5+
	ddRWaE/oSQ8JUTqUAmIk9YlHpt1k2KfQGd7v8975qT32R/K+JuOQN4ZKBL3iJcvnYNnvei
	TwTfdqv9k8ahu+nS52xveVcRt+ImdO0=
To: Binutils <binutils@sourceware.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: ld 2.36 regression linking EFI binary from ELF input with debug info
Message-ID: <79812876-b43d-7729-da34-3b4cd1c31f24@suse.com>
Date: Thu, 4 Feb 2021 14:21:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hello,

the Xen project hypervisor build system includes building the
hypervisor binary as an EFI application, as an option (i.e.
as long as the tool chain supports this). Already when probing
the linker we now suddenly get several "relocation truncated
to fit:R_X86_64_32 against `.debug_...'" errors. I have not
had  the time to figure out what exactly broke this, and I'm
sending this mail in the hope that it may ring a bell for
someone.

For reference, the probing is as simple as

$(LD) -mi386pep --subsystem=10 -o efi/check.efi efi/check.o

As was to be expected, the errors disappear with -S, but that's
an option only for the probing, not for the actual linking of
the binary.

Thanks for pointers (or better yet, a fix),
Jan

