Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FC636BFCA
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 09:10:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118042.224008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbHqi-0000IR-Od; Tue, 27 Apr 2021 07:09:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118042.224008; Tue, 27 Apr 2021 07:09:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbHqi-0000I2-LN; Tue, 27 Apr 2021 07:09:36 +0000
Received: by outflank-mailman (input) for mailman id 118042;
 Tue, 27 Apr 2021 07:09:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4dJ3=JY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lbHqh-0000Hx-6Y
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 07:09:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05e1c6a8-3724-4155-a1b6-07036d071dac;
 Tue, 27 Apr 2021 07:09:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 51A58AFA9;
 Tue, 27 Apr 2021 07:09:33 +0000 (UTC)
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
X-Inumbo-ID: 05e1c6a8-3724-4155-a1b6-07036d071dac
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619507373; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wuGrBc3fgJjN9PLSBZcv+KjMhbROZ/4NSCSTRK3tonA=;
	b=bakdxKFJK4Q+Pvo1TFZx6kfPhYdBYVHR+m/vPEoxkOt+RcFyehrtc/l1iX/lGA1HHeOTn5
	2XEjK8i4TE2o1DrZgA2PCePbeQw6736e6Bs/65MkKJInyXLifWEcp6T/EO5SLL0Kma/3pv
	LAQl3bSto0QmlOobjuq1b3DLAdLkKGk=
Subject: Re: [PATCH] x86/emul: Use existing X86_EXC_* constants
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210426124535.23814-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f11189be-7ce7-ed54-a078-541eb3513eba@suse.com>
Date: Tue, 27 Apr 2021 09:09:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210426124535.23814-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 26.04.2021 14:45, Andrew Cooper wrote:
> ... rather than having separate definitions locally.  EXC_HAS_EC in particular
> is missing #CP, #VC and #SX vs X86_EXC_HAVE_EC.
> 
> Also switch a raw 14 for X86_EXC_PF in x86_emul_pagefault().
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> ---
>  xen/arch/x86/x86_emulate/x86_emulate.c | 739 ++++++++++++++++-----------------
>  xen/arch/x86/x86_emulate/x86_emulate.h |   4 +-
>  2 files changed, 361 insertions(+), 382 deletions(-)

This is a lot of code churn (almost all some slight growth) for this
kind of a change. I'm not opposed, but I'd like to explore alternatives
first. I know you often dislike token concatenation in macros, which
would be my first suggestion to get churn down here. The other option,
not reducing churn but reducing rather than increasing code volume (and
hence imo helping readability), would be to have shorthands for at
least some frequently raised exceptions like #UD and #GP - e.g.
generate_ud_if(). Thougths?

Jan

