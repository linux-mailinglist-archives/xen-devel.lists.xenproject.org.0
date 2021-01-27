Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEFD3055D0
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 09:32:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75828.136636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4gEx-00085G-Cf; Wed, 27 Jan 2021 08:31:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75828.136636; Wed, 27 Jan 2021 08:31:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4gEx-00084t-9T; Wed, 27 Jan 2021 08:31:51 +0000
Received: by outflank-mailman (input) for mailman id 75828;
 Wed, 27 Jan 2021 08:31:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Shlr=G6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4gEw-00084o-1f
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 08:31:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 77637f9c-f4a9-4e88-a63c-7845e83fb037;
 Wed, 27 Jan 2021 08:31:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 49E2EAD57;
 Wed, 27 Jan 2021 08:31:48 +0000 (UTC)
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
X-Inumbo-ID: 77637f9c-f4a9-4e88-a63c-7845e83fb037
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611736308; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v38++mWX26+g7i6KhRuErWQs2ufiDDbJ7MmCoqmtsVM=;
	b=oj+59HnTiAtGmnbChY5ruxrl9beFn9pp9U+DEpEFOqHHp+91zzLOD/z05j68nuLb2w5ZXe
	5Bwi6o9FufOdNkREZv82IxvcAHNL+IAFpXMdICGsPjd177/q+3uEq+aUJc3YdV3lZo3W2V
	2UbUzCHxZsuOSOPCd1ICFnWH8EAM9eo=
Subject: Re: [PATCH] Fix error: array subscript has type 'char'
To: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Manuel Bouyer <bouyer@antioche.eu.org>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <574d9ed8-c827-6864-4732-4e1b813fc3e3@suse.com>
 <20210114122912.GA2522@antioche.eu.org>
 <1af2b532-4dce-29cf-94ae-ad0c399ecbce@suse.com>
 <20210114141615.GA9157@mail.soc.lip6.fr>
 <20210126174415.GA21858@mail.soc.lip6.fr>
 <24592.22685.67161.585056@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2452d5cb-90ba-a4c4-a5e4-3070c5a676d2@suse.com>
Date: Wed, 27 Jan 2021 09:31:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <24592.22685.67161.585056@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.01.2021 18:59, Ian Jackson wrote:
> Manuel Bouyer writes ("Re: [PATCH] Fix error: array subscript has type 'char'"):
>> On Thu, Jan 14, 2021 at 03:16:15PM +0100, Manuel Bouyer wrote:
>>> On Thu, Jan 14, 2021 at 02:25:05PM +0100, Jan Beulich wrote:
>>>> Which means you're shifting the undefined-ness from the implementation
> 
> The undefined-ness is in the *specification*. [1]
> 
>>>> Isn't this something that wants changing in your ctype.h instead?
>>>> the functions (or macros), as per the C standard
> 
> Jan, can you please check your facts before asserting the existence
> of a pretty blatant bug in a platform's implementation of basic C
> functions ?
> 
> From my copy of C99+TC1+TC2, para 7.4:
> 
>  1   In all cases the argument is an int, the value of which shall be
>      representable as an unsigned char or shall equal the value of the
>      macro EOF.  If the argument has any other value, the behavior is
>      undefined. [...]
> 
> If char is signed, then it can contain -ve values.  Those values are
> promoted to int by the usual integer promotions.  Naturally such
> negative values are not representable as unsigned char.  Passing them
> to ctype macros is UB.

I did read that part of the spec before replying. Irrespective
of the wording there it seems entirely unreasonable to me for
the spec to imply all use sites of the is...() functions to
have to use casts. Even more so that we all know (I suppose)
that casts can be dangerous as both potentially introducing
bugs (perhaps not at the point of their addition, but later
when code elsewhere gets changed) and keeping analysis tools
from actually spotting ones.

But yes, I'm not the maintainer of this code, so if you're
happy with such risks, so be it.

For the record, to me the less risky approach here would seem
to have been to make use of compilers allowing to choose
whether plain char is signed or unsigned, and force it to
unsigned for at least the affected components.

Jan

