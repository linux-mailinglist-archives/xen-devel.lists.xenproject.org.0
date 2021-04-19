Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD4336475A
	for <lists+xen-devel@lfdr.de>; Mon, 19 Apr 2021 17:46:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113060.215451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYW5x-0007yO-TB; Mon, 19 Apr 2021 15:45:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113060.215451; Mon, 19 Apr 2021 15:45:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYW5x-0007xz-Q6; Mon, 19 Apr 2021 15:45:53 +0000
Received: by outflank-mailman (input) for mailman id 113060;
 Mon, 19 Apr 2021 15:45:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EHwQ=JQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lYW5w-0007xu-6H
 for xen-devel@lists.xenproject.org; Mon, 19 Apr 2021 15:45:52 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 55c515eb-0af6-41dd-ab2c-729b281ae986;
 Mon, 19 Apr 2021 15:45:51 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BC064AD09;
 Mon, 19 Apr 2021 15:45:50 +0000 (UTC)
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
X-Inumbo-ID: 55c515eb-0af6-41dd-ab2c-729b281ae986
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618847150; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SmFUX0bpp/j7HuRVkXtDDoLa9R5T6dj1sa/aoJttEmc=;
	b=Tn7DKcSYhIkj7NvY7ydbNc0HYvspuwNtr3X0JWFgz4UasI+y9YO+fbvPn1bL011uH5rdV2
	kr1+V5oU7o22puLOkVnb8qbxYv/A4e9gQ30aTgLn2mkUGr0TccdDxCMpJdvpDmB0INQGyF
	26Z5462ScQTQNfCoxDlbdxH8ds24AKU=
Subject: Re: [PATCH 0/7] xen: Switch to using -Og for debug builds
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Juergen Gross <jgross@suse.com>,
 Tim Deegan <tim@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210419140132.16909-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9e8e116a-f4c3-e6bf-edee-d48e76a3d005@suse.com>
Date: Mon, 19 Apr 2021 17:45:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210419140132.16909-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.04.2021 16:01, Andrew Cooper wrote:
> As with the toolstack side, we ought to use -Og for debug builds.
> 
> All fixes are trivial.  The first 3 are understandable, given reduced
> optimisations.  The next 3 are, AFAICT, bogus diagnostics.
> 
> Andrew Cooper (7):
>   xen/arm: Make make_cpus_node() compile at -Og
>   x86/shim: Fix compilation at -Og
>   x86/sysctl: Make arch_do_sysctl() compile at -Og
>   x86/irq: Make create_irq() compile at -Og
>   xen/efi: Make efi_start() compile at -Og
>   x86/shadow: Make _shadow_prealloc() compile at -Og
>   xen: Use -Og for debug builds when available

Acked-by: Jan Beulich <jbeulich@suse.com>

I'd like to ask though that at least for the bogus warnings you
amend the commit messages with the gcc version these were observed
with. Perhaps even those seemingly bogus initializers would
benefit from a very brief comment (or else there's a fair chance
of them getting removed again at some point).

Jan

