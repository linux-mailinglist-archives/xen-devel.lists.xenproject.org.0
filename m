Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6030AA9CBF
	for <lists+xen-devel@lfdr.de>; Mon,  5 May 2025 21:45:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976342.1363514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uC1jx-0007h5-FW; Mon, 05 May 2025 19:44:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976342.1363514; Mon, 05 May 2025 19:44:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uC1jx-0007e9-Ck; Mon, 05 May 2025 19:44:37 +0000
Received: by outflank-mailman (input) for mailman id 976342;
 Mon, 05 May 2025 19:44:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9/1y=XV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uC1jw-0007e3-28
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 19:44:36 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cecfa2a-29e9-11f0-9ffb-bf95429c2676;
 Mon, 05 May 2025 21:44:32 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AA2364A5A1;
 Mon,  5 May 2025 19:44:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9ABAC4CEE4;
 Mon,  5 May 2025 19:44:28 +0000 (UTC)
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
X-Inumbo-ID: 5cecfa2a-29e9-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746474270;
	bh=OA60VWp0llEUQpPM/Acri1qpDoUSmwYiYugg4nz4CZ8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VQo3euLvozySondpySpsUj3pJ2eXh0ez+CM97pmQVbEidIWWkcVAyxVwjBgH24Bdr
	 i/VGuYZuos/9kTyCaH20vTzj9olf63YoVghd6xG1Y2TNtSUCyL4qqRHZ3hVSitUdGY
	 hSqoHX1hdHHl5ypr8LJyykx7YbRFvsdQybnMuYnugJlCBtZgXhNeD4ynQ+ISjUiI6W
	 ntxiU3CdEtCEpK8ZafGlSnU1uaRMdTe2eOqMl3dOsuZDiU5N0xIiC1dQ446/gcsuQh
	 MKJERQIl0gbb4No+UbcTRlNbjFttScxvY7gD+E9jIxrksayDDoi4DFYhxk/cFX+WWs
	 BkvZIizArb11g==
Date: Mon, 5 May 2025 12:44:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Roberto Bagnara <roberto.bagnara@bugseng.com>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    "consulting @ bugseng . com" <consulting@bugseng.com>
Subject: Re: [PATCH] xen: Use __auto_type
In-Reply-To: <20250505124646.1569767-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2505051244090.3879245@ubuntu-linux-20-04-desktop>
References: <20250505124646.1569767-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1097180844-1746474270=:3879245"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1097180844-1746474270=:3879245
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 5 May 2025, Andrew Cooper wrote:
> In macros it is common to declare local variables using typeof(param) in order
> to ensure that side effects are only evaluated once.  A consequence of this is
> double textural expansion of the parameter, which can get out of hand very
> quickly with nested macros.
> 
> A GCC extension, __auto_type, is now avaialble in the new toolchain baseline
> and avoids the double textural expansion.

I think this is a good change


> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
> CC: consulting@bugseng.com <consulting@bugseng.com>
> 
> The resulting build is identical.
> 
> RFC.  This requires a MISRA change, as it currently manifests as a R1.1
> violation.  Nevertheless, I think we want to start using in places where we
> currently use typeof(expression of <initilaiser>).
> 
> Eclair run on this patch (expecting a failure):
>   https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1800631949
> 
> Min toolchain check:
>   https://godbolt.org/z/f9WjooPYj
> 
> GCC Manual:
>   https://www.gnu.org/software/c-intro-and-ref/manual/html_node/Auto-Type.html
> ---
>  xen/include/xen/macros.h | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/include/xen/macros.h b/xen/include/xen/macros.h
> index cd528fbdb127..b5e5ff4b1c2f 100644
> --- a/xen/include/xen/macros.h
> +++ b/xen/include/xen/macros.h
> @@ -71,18 +71,18 @@
>  /* Hide a value from the optimiser. */
>  #define HIDE(x)                                 \
>      ({                                          \
> -        typeof(x) _x = (x);                     \
> +        __auto_type _x = (x);                   \
>          asm volatile ( "" : "+r" (_x) );        \
>          _x;                                     \
>      })
>  
>  #define ABS(x) ({                              \
> -    typeof(x) x_ = (x);                        \
> +    __auto_type x_ = (x);                      \
>      (x_ < 0) ? -x_ : x_;                       \
>  })
>  
>  #define SWAP(a, b) \
> -   do { typeof(a) t_ = (a); (a) = (b); (b) = t_; } while ( 0 )
> +   do { __auto_type t_ = (a); (a) = (b); (b) = t_; } while ( 0 )
>  
>  #define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]) + __must_be_array(x))
>  
> @@ -110,15 +110,15 @@
>   */
>  #define min(x, y)                               \
>      ({                                          \
> -        const typeof(x) _x = (x);               \
> -        const typeof(y) _y = (y);               \
> +        const __auto_type _x = (x);             \
> +        const __auto_type _y = (y);             \
>          (void)(&_x == &_y); /* typecheck */     \
>          _x < _y ? _x : _y;                      \
>      })
>  #define max(x, y)                               \
>      ({                                          \
> -        const typeof(x) _x = (x);               \
> -        const typeof(y) _y = (y);               \
> +        const __auto_type _x = (x);             \
> +        const __auto_type _y = (y);             \
>          (void)(&_x == &_y); /* typecheck */     \
>          _x > _y ? _x : _y;                      \
>      })
> 
> base-commit: 78ce2be733b1e45e2e190c1765fe31da318d435f
> -- 
> 2.39.5
> 
--8323329-1097180844-1746474270=:3879245--

