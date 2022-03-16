Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 844C64DAE41
	for <lists+xen-devel@lfdr.de>; Wed, 16 Mar 2022 11:30:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291131.493958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUQty-00017e-FY; Wed, 16 Mar 2022 10:29:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291131.493958; Wed, 16 Mar 2022 10:29:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUQty-00015X-Bm; Wed, 16 Mar 2022 10:29:10 +0000
Received: by outflank-mailman (input) for mailman id 291131;
 Wed, 16 Mar 2022 10:29:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u7dg=T3=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nUQtx-00015R-46
 for xen-devel@lists.xenproject.org; Wed, 16 Mar 2022 10:29:09 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id e8625005-a513-11ec-8eba-a37418f5ba1a;
 Wed, 16 Mar 2022 11:29:07 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D10731476;
 Wed, 16 Mar 2022 03:29:05 -0700 (PDT)
Received: from [10.57.71.197] (unknown [10.57.71.197])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 372003F73D;
 Wed, 16 Mar 2022 03:29:04 -0700 (PDT)
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
X-Inumbo-ID: e8625005-a513-11ec-8eba-a37418f5ba1a
Message-ID: <14a1e221-7a55-42f5-6eb5-03b64e20e337@arm.com>
Date: Wed, 16 Mar 2022 11:28:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] kconfig: detect LD implementation
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20220314105535.13518-1-roger.pau@citrix.com>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <20220314105535.13518-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Roger,

On 14.03.2022 11:55, Roger Pau Monne wrote:
> Detect GNU and LLVM ld implementations. This is required for further
> patches that will introduce diverging behaviour depending on the
> linker implementation in use.
> 
> Note that LLVM ld returns "compatible with GNU linkers" as part of the
> version string, so be on the safe side and use '^' to only match at
> the start of the line in case LLVM ever decides to change the text to
> use "compatible with GNU ld" instead.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/Kconfig | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/xen/Kconfig b/xen/Kconfig
> index d134397a0b..e8d5e70d46 100644
> --- a/xen/Kconfig
> +++ b/xen/Kconfig
> @@ -23,6 +23,12 @@ config CLANG_VERSION
>  	int
>  	default $(shell,$(BASEDIR)/scripts/clang-version.sh $(CC))
>  
> +config LD_IS_GNU
> +	def_bool $(success,$(LD) --version | head -n 1 | grep -q "^GNU ld")
> +> +config LD_IS_LLVM
> +	def_bool $(success,$(LD) --version | head -n 1 | grep -q "^LLD")
> +
>  # -fvisibility=hidden reduces -fpic cost, if it's available
>  config CC_HAS_VISIBILITY_ATTRIBUTE
>  	def_bool $(cc-option,-fvisibility=hidden)

NIT: You do not really need to use head especiialy if grep for the beginning of a line.
With or without this:
Reviewed-by: Michal Orzel <michal.orzel@arm.com>

Cheers,
Michal

