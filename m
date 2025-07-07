Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2CCAFBD90
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 23:34:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035817.1408191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYtU1-0000L2-Jk; Mon, 07 Jul 2025 21:34:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035817.1408191; Mon, 07 Jul 2025 21:34:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYtU1-0000Ii-H1; Mon, 07 Jul 2025 21:34:41 +0000
Received: by outflank-mailman (input) for mailman id 1035817;
 Mon, 07 Jul 2025 21:34:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S3ai=ZU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uYtU0-0000Gf-5O
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 21:34:40 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2cc42fb0-5b7a-11f0-b894-0df219b8e170;
 Mon, 07 Jul 2025 23:34:35 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DB5E75C599A;
 Mon,  7 Jul 2025 21:34:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FC80C4CEE3;
 Mon,  7 Jul 2025 21:34:32 +0000 (UTC)
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
X-Inumbo-ID: 2cc42fb0-5b7a-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751924073;
	bh=APjvK74QYsHKmdqDLq3Cd9GMFz7ki3oiGhgKURYIj8Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uT+ohkxu/xSR9fQ8jc0+gjyoLkLn5F0dalAaajX13ps6z26Gzrn8HZhl3vcfC9ViA
	 MCyoCMAq7bSJvLTW/eFj353ali/TBWtPjOVk5jgBo91rLtJ7Z0QoovqoyWs124SiJ4
	 nNvMogZGme0lIT+ZacAgkG/8UB76lTQbu91aPKngtV4ieTl1X2Hl91uSClCrk0WBrE
	 syG1Ww8L/p/CIu8iNU3mDe9SUqugdHQMcfwi2UR99wQumT0z7v8+RJNQ7kCCnaQqH0
	 QxjCKzmOQSsZBcrvyZujrwGo2tQOo//gGbwz23XE9bIuIObMkgHg+5VRp4U7D1sK7Z
	 FetaYn/2P3FRA==
Date: Mon, 7 Jul 2025 14:34:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 5/5] xen/bitops: address violation of MISRA C Rule
 5.5
In-Reply-To: <2f921089abc6cc396c430f3edf4e7151294a649f.1751659393.git.dmytro_prokopchuk1@epam.com>
Message-ID: <alpine.DEB.2.22.394.2507071433540.605088@ubuntu-linux-20-04-desktop>
References: <cover.1751659393.git.dmytro_prokopchuk1@epam.com> <2f921089abc6cc396c430f3edf4e7151294a649f.1751659393.git.dmytro_prokopchuk1@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 4 Jul 2025, Dmytro Prokopchuk1 wrote:
> Address a violation of MISRA C:2012 Rule 5.5:
> "Identifiers shall be distinct from macro names".
> 
> Reports for service MC3A2.R5.5:
> xen/include/xen/bitops.h: non-compliant function '__test_and_set_bit(int, volatile void*)'
> xen/include/xen/bitops.h: non-compliant macro '__test_and_set_bit'
> xen/include/xen/bitops.h: non-compliant function '__test_and_clear_bit(int, volatile void*)'
> xen/include/xen/bitops.h: non-compliant macro '__test_and_clear_bit'
> xen/include/xen/bitops.h: non-compliant function '__test_and_change_bit(int, volatile void*)'
> xen/include/xen/bitops.h: non-compliant macro '__test_and_change_bit'
> xen/include/xen/bitops.h: non-compliant function 'test_bit(int, const volatile void*)'
> xen/include/xen/bitops.h: non-compliant macro 'test_bit'
> 
> The primary issue stems from the macro and function
> having identical names, which is confusing and
> non-compliant with common coding standards.
> Change the functions names by adding two underscores at the end.
> No functional changes.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

I think these should also be deviated either using a SAF in-code comment
if possible or a regex in
automation/eclair_analysis/ECLAIR/deviations.ecl and
docs/misra/deviations.rst



> ---
>  xen/include/xen/bitops.h | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
> index a4d31ec02a..b292470ad7 100644
> --- a/xen/include/xen/bitops.h
> +++ b/xen/include/xen/bitops.h
> @@ -120,7 +120,7 @@ static always_inline bool generic_test_bit(int nr, const volatile void *addr)
>  }
>  
>  /**
> - * __test_and_set_bit - Set a bit and return its old value
> + * __test_and_set_bit__ - Set a bit and return its old value
>   * @nr: Bit to set
>   * @addr: Address to count from
>   *
> @@ -129,7 +129,7 @@ static always_inline bool generic_test_bit(int nr, const volatile void *addr)
>   * but actually fail.  You must protect multiple accesses with a lock.
>   */
>  static always_inline bool
> -__test_and_set_bit(int nr, volatile void *addr)
> +__test_and_set_bit__(int nr, volatile void *addr)
>  {
>  #ifndef arch__test_and_set_bit
>  #define arch__test_and_set_bit generic__test_and_set_bit
> @@ -139,11 +139,11 @@ __test_and_set_bit(int nr, volatile void *addr)
>  }
>  #define __test_and_set_bit(nr, addr) ({             \
>      if ( bitop_bad_size(addr) ) __bitop_bad_size(); \
> -    __test_and_set_bit(nr, addr);                   \
> +    __test_and_set_bit__(nr, addr);                 \
>  })
>  
>  /**
> - * __test_and_clear_bit - Clear a bit and return its old value
> + * __test_and_clear_bit__ - Clear a bit and return its old value
>   * @nr: Bit to clear
>   * @addr: Address to count from
>   *
> @@ -152,7 +152,7 @@ __test_and_set_bit(int nr, volatile void *addr)
>   * but actually fail.  You must protect multiple accesses with a lock.
>   */
>  static always_inline bool
> -__test_and_clear_bit(int nr, volatile void *addr)
> +__test_and_clear_bit__(int nr, volatile void *addr)
>  {
>  #ifndef arch__test_and_clear_bit
>  #define arch__test_and_clear_bit generic__test_and_clear_bit
> @@ -162,11 +162,11 @@ __test_and_clear_bit(int nr, volatile void *addr)
>  }
>  #define __test_and_clear_bit(nr, addr) ({           \
>      if ( bitop_bad_size(addr) ) __bitop_bad_size(); \
> -    __test_and_clear_bit(nr, addr);                 \
> +    __test_and_clear_bit__(nr, addr);               \
>  })
>  
>  /**
> - * __test_and_change_bit - Change a bit and return its old value
> + * __test_and_change_bit__ - Change a bit and return its old value
>   * @nr: Bit to change
>   * @addr: Address to count from
>   *
> @@ -175,7 +175,7 @@ __test_and_clear_bit(int nr, volatile void *addr)
>   * but actually fail.  You must protect multiple accesses with a lock.
>   */
>  static always_inline bool
> -__test_and_change_bit(int nr, volatile void *addr)
> +__test_and_change_bit__(int nr, volatile void *addr)
>  {
>  #ifndef arch__test_and_change_bit
>  #define arch__test_and_change_bit generic__test_and_change_bit
> @@ -185,11 +185,11 @@ __test_and_change_bit(int nr, volatile void *addr)
>  }
>  #define __test_and_change_bit(nr, addr) ({              \
>      if ( bitop_bad_size(addr) ) __bitop_bad_size();     \
> -    __test_and_change_bit(nr, addr);                    \
> +    __test_and_change_bit__(nr, addr);                  \
>  })
>  
>  /**
> - * test_bit - Determine whether a bit is set
> + * test_bit__ - Determine whether a bit is set
>   * @nr: bit number to test
>   * @addr: Address to start counting from
>   *
> @@ -197,7 +197,7 @@ __test_and_change_bit(int nr, volatile void *addr)
>   * If two examples of this operation race, one can appear to succeed
>   * but actually fail.  You must protect multiple accesses with a lock.
>   */
> -static always_inline bool test_bit(int nr, const volatile void *addr)
> +static always_inline bool test_bit__(int nr, const volatile void *addr)
>  {
>  #ifndef arch_test_bit
>  #define arch_test_bit generic_test_bit
> @@ -207,7 +207,7 @@ static always_inline bool test_bit(int nr, const volatile void *addr)
>  }
>  #define test_bit(nr, addr) ({                           \
>      if ( bitop_bad_size(addr) ) __bitop_bad_size();     \
> -    test_bit(nr, addr);                                 \
> +    test_bit__(nr, addr);                               \
>  })
>  
>  /* --------------------- Please tidy above here --------------------- */
> -- 
> 2.43.0
> 

