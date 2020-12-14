Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAF82D948C
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 10:04:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.51984.90939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kojlV-0007lc-NO; Mon, 14 Dec 2020 09:03:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 51984.90939; Mon, 14 Dec 2020 09:03:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kojlV-0007lF-K4; Mon, 14 Dec 2020 09:03:33 +0000
Received: by outflank-mailman (input) for mailman id 51984;
 Mon, 14 Dec 2020 09:03:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MGmN=FS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kojlT-0007lA-JP
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 09:03:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b7e670b-fad6-473f-b56a-93f25bab5c0f;
 Mon, 14 Dec 2020 09:03:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 09240AC10;
 Mon, 14 Dec 2020 09:03:30 +0000 (UTC)
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
X-Inumbo-ID: 8b7e670b-fad6-473f-b56a-93f25bab5c0f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607936610; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0NgiftfljNLjlF2FZgtFopk9t52PfwgGAjN3ponFFHQ=;
	b=PKsWk1tWU3PV/r61wFreN0yf8jSgRvOd5srjlYx3/w1HGoIODIYpNwjSRfC6XzTcs76M18
	0HRmLVYZXu+R+OR1LqR+sUySL4DGVOaEFC+Zd8O45MiDqqllmiZQzkvtwxRotFyy5Tzmb1
	mJZ6oBesDP4OIyDRYdptOk0THP9wgOY=
Subject: Re: [PATCH v4 1/3] xen/arm: add support for
 run_in_exception_handler()
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201214075615.25038-1-jgross@suse.com>
 <20201214075615.25038-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <74be05c2-375e-6b7e-ef87-31d4f7338a03@suse.com>
Date: Mon, 14 Dec 2020 10:03:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201214075615.25038-2-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 14.12.2020 08:56, Juergen Gross wrote:
> Add support to run a function in an exception handler for Arm. Do it
> the same way as on x86 via a bug_frame.
> 
> Unfortunately inline assembly on Arm seems to be less capable than on
> x86, leading to functions called via run_in_exception_handler() having
> to be globally visible.

Could you extend on this? I don't understand what the relevant
difference is, from just looking at the changes.

> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V4:
> - new patch
> 
> I have verified the created bugframe is correct by inspecting the
> created binary.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  xen/arch/arm/traps.c       | 10 +++++++++-
>  xen/drivers/char/ns16550.c |  3 ++-
>  xen/include/asm-arm/bug.h  | 32 +++++++++++++++++++++-----------
>  3 files changed, 32 insertions(+), 13 deletions(-)

Aiui you also need to modify xen.lds.S to cover the new (or really
the last renamed) section.

Jan

