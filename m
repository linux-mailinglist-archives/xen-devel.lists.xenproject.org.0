Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DBE29CEF3
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 09:21:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13360.33945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXghr-0007jY-Cu; Wed, 28 Oct 2020 08:21:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13360.33945; Wed, 28 Oct 2020 08:21:19 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXghr-0007j9-9u; Wed, 28 Oct 2020 08:21:19 +0000
Received: by outflank-mailman (input) for mailman id 13360;
 Wed, 28 Oct 2020 08:21:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dk2S=ED=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kXghp-0007j4-Mz
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 08:21:17 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c991c82c-92c3-464e-b5c1-54adc5770001;
 Wed, 28 Oct 2020 08:21:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A3CFBB91A;
 Wed, 28 Oct 2020 08:21:15 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dk2S=ED=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kXghp-0007j4-Mz
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 08:21:17 +0000
X-Inumbo-ID: c991c82c-92c3-464e-b5c1-54adc5770001
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c991c82c-92c3-464e-b5c1-54adc5770001;
	Wed, 28 Oct 2020 08:21:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603873276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+zq4UqT3xUB0tKR32SS8TSAnP6cpSu6XeY5h3ZH7QX8=;
	b=uZTHiAp4hwTIXkyC/Lq80Qs4tmHg/0tz/n/e2qpuUBw6P02MSYguAlQPzEfrh0bFJAar1w
	U8j2yqlqTKZaEexFuIBefXtJCyQ3iUOWZVKOAfirfH+b7O1Ma3wcDIVfqQnPF6gsasepK/
	6ocMlRcqutTEhNOCKYtlpKa6BraPgns=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A3CFBB91A;
	Wed, 28 Oct 2020 08:21:15 +0000 (UTC)
Subject: Re: [PATCH 1/3] x86/ucode: Break out compare_revisions() from
 existing infrastructure
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Igor Druzhinin <igor.druzhinin@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20201026172519.17881-1-andrew.cooper3@citrix.com>
 <20201026172519.17881-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a8c50574-ce8e-44ad-fccd-9b8f2b3288c1@suse.com>
Date: Wed, 28 Oct 2020 09:21:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201026172519.17881-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.10.2020 18:25, Andrew Cooper wrote:
> Drop some unnecesserily verbose pr_debug()'s on the AMD side.

To be honest I'm not entirely convinced of this part of the change:
For one, pr_debug() expands to nothing by default. And then you
delete 2/3 of all pr_debug() instances, putting under question why
there's a pr_debug() in the first place.

> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Only after having looked at the subsequent patches to understand
how this is going to be useful:
Acked-by: Jan Beulich <jbeulich@suse.com>
However, ...

> --- a/xen/arch/x86/cpu/microcode/amd.c
> +++ b/xen/arch/x86/cpu/microcode/amd.c
> @@ -168,6 +168,15 @@ static bool check_final_patch_levels(const struct cpu_signature *sig)
>      return false;
>  }
>  
> +static enum microcode_match_result compare_revisions(
> +    uint32_t old_rev, uint32_t new_rev)

... this (and the respective Intel code) is another good example
where, by our present guide lines, fixed width types aren't
appropriate to use. "unsigned int" (and in the later patch plain
"int" or "signed int") will fulfill the purpose, and hence ought
to be preferred.

Jan

