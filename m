Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC80357C4E
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 08:18:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107043.204605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUNz2-0001QP-Jz; Thu, 08 Apr 2021 06:17:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107043.204605; Thu, 08 Apr 2021 06:17:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUNz2-0001Q0-GK; Thu, 08 Apr 2021 06:17:40 +0000
Received: by outflank-mailman (input) for mailman id 107043;
 Thu, 08 Apr 2021 06:17:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e/uL=JF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lUNz0-0001Pv-Dc
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 06:17:38 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e70c1a65-c673-4fcf-b139-03a79cb099e5;
 Thu, 08 Apr 2021 06:17:37 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 72FE5AFF5;
 Thu,  8 Apr 2021 06:17:36 +0000 (UTC)
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
X-Inumbo-ID: e70c1a65-c673-4fcf-b139-03a79cb099e5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617862656; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u6JothBE6sZgySqbyFqB3ODE8g4BwjXU76JRr4M0/oE=;
	b=jEbRajOq5xO3WbLj3s8CWMPNBDJjJk6RDQn6eu8ETnzETRtoblcXaNSy6ru00W7NEHAZMj
	MHTj7gjuZcpPtk8xWfkoyJsP/gipx0QF1R2AdiGQZjEEmglLiPz0KSretXd+8Bl9a44UAA
	3HeWf3yMmbYqssbf7vUrs8SdP7WJKR4=
Subject: Re: [PATCH] xen/gunzip: Fix build with clang after 33bc2a8495f7
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210407182726.26603-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <59afb632-f2c9-bf3d-ef97-bc9f5a95d0a6@suse.com>
Date: Thu, 8 Apr 2021 08:17:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210407182726.26603-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07.04.2021 20:27, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The compilation will fail when building Xen with clang and
> CONFIG_DEBUG=y:
> 
> make[4]: Leaving directory '/oss/xen/xen/common/libelf'
>   INIT_O  gunzip.init.o
> Error: size of gunzip.o:.text is 0x00000019
> 
> This is because the function init_allocator() will not be inlined
> and is not part of the init section.
> 
> Fix it by marking init_allocator() with INIT.
> 
> Fixes: 33bc2a8495f7 ("xen/gunzip: Allow perform_gunzip() to be called multiple times")
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

