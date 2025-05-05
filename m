Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9F5AA93C1
	for <lists+xen-devel@lfdr.de>; Mon,  5 May 2025 14:57:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976107.1363344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBvNq-0006cY-Mf; Mon, 05 May 2025 12:57:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976107.1363344; Mon, 05 May 2025 12:57:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBvNq-0006a6-Iy; Mon, 05 May 2025 12:57:22 +0000
Received: by outflank-mailman (input) for mailman id 976107;
 Mon, 05 May 2025 12:57:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RNxR=XV=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uBvNo-0006Zw-I0
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 12:57:21 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78e92764-29b0-11f0-9ffb-bf95429c2676;
 Mon, 05 May 2025 14:57:17 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 0D7524EE7DAE;
 Mon,  5 May 2025 14:57:16 +0200 (CEST)
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
X-Inumbo-ID: 78e92764-29b0-11f0-9ffb-bf95429c2676
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1746449836;
	b=cfDBtjv74drHMsMMvIwOjp9ak2ybpgOLQmEQJqD0b2fyuDOxemnN+mFhSmvZ5vsMPweN
	 xfp0gWSGKUcNp/nkkqwQUNmI+XEIooCyzH+PcEcZ0Jo/d0DIky64X9GFAcQiyr0yza15a
	 vS3IYAldspdMwZfK71c8WSn5I2MY7viLUF9z4PaZtIS2fStLm9bMLuQRihFrlrERJWmhi
	 NfcvQ68BfJcxmdro7XCvFoJW2aRYtzGmZ2zKNNSPIAMMzGrls1bI7Xjmxui12v2lKopki
	 HGiJ9VlUjZYvCGbz7h3vJWP23uKXBE7avu9Q+UEIqV1epTUM8TsHauZeh9f9ETbLK5GFA
	 73tINZlaF5JBw00V6xsmjqQel62Ww21Yxwq2361yw4TIl9yKOclLP4YS7+KLOk+6FT2F/
	 YZDiP8peSOi4OyEBEj/pQ+XmkLnN3ljXhurDlVnVCcne6YkaWvN7vKPGcdXJWFdxjDYgx
	 3QDqfawNJL1hLzuwlk5oHE3y7l827f2s8p4DwXCZ72nH+tuyZGkT7kPU5BfN8WoLAmrLN
	 0ZIZCiuEaZjJtlMiLHzTMGlVZdqyxcmmV82RFmjcGPLYjtw4y4ovXgNi9w/i6vJM2v03n
	 sEESv4cp2JP9PJEFf3DW0aVFM8bL7BLzFdc48+GC5/NnkFAFhtCCsNP4JKwzleg=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1746449836;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=+6q07O2QYqE5gk+2iKSDXVQnl8JvJZKymTeJI/7hVDk=;
	b=RzCc8xwKw9NIdpl+Y4gYZlcK2n8cFvDLE5FDvqQdsawDl/sWLfEtj3PtvnATm6A+UZvT
	 +kUCPyFXuvElj/AurjjddEkxWBPEt4VALVj64vOxvXNgcGmYagcOyElDvwKQAIicGAj6z
	 Ti9usDanqpqgl4/3ezCsGoHEFEunKLw15Q5Hhl183QNPGDb0pPbVj/jkV3faxYlOQyWTF
	 CEOdNSk4XTyfZmFgyYBS7JP9tOrAHxZj6/uzchwaGyo9hrXlngLtlwNMosP+8rX6GQ0Lg
	 L72k1aMCUbMmg2VowqIbR6kuTxV/0+mdvNSyAm8yXeISCVCdOobgElys1sr0XWNj1wAv3
	 cQiVYgIwZTxDtIYn2Dk+DLOhK9IgqkX8d1zmYSEgAyKsSsiV/71dqtJvKnY6VGn0LKOHR
	 BXmB7gQAZI/r6x9OAKYZIoteZSBf33tWHd3KYAtVp/q1VeLnTnmdWazQSui9FI6FQ6tlj
	 QZeXxIkGx9D51BnGiuaHu2++E995WFpzvUAicOG4V0o0vjWhT0P7ffbJpMin2VaqdJDPH
	 iodjuu0oT0nprI6iITjrr+we8cT6kd5klshGMmXTaOzRbs6NIXOfr97qakOW1EiyijsMN
	 rQu38R5dsAjR8IjPWGryGocSy2Z0QJWR7RaLfEhKJPqjP2VP50frMvmRcnS7WzU=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1746449836; bh=f+qrYVZxqGp3o1hxx/v0ijYEK0ZG3VMS8sHMYJ+qfoA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uEzTkcT4jm2aDHsNd6012W5YQg2Luc2sZC1N+aDI5nN+2wYpMVmwx2VQJMJJjCHt1
	 rnJBka9Fm4QxHGXlBGU6D1k8kDBckxjNRA/P6jUXd+aDRJ0iGIRm42cvruygsOShHx
	 X9i38Hfj1YvRRTHtgOM1frK3e7plbMVaggcsBqD3i0XmedHsb58v9auNPdgm7Sh1pL
	 U+ZyseiEmjtZNS5JxoG5i1DQ1c6FdR4ElHrVJ2heN4Vtih+ucOo/iUYiWlXN8TrCtE
	 BMUQ3PP8stHzpW8RnpRl1zt0ZEWZTQhzAR80C3FKAGJzdUgNQRxaM+/qEmUpgV7ga7
	 CbjnhJ5LnZmsg==
MIME-Version: 1.0
Date: Mon, 05 May 2025 14:57:16 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Roberto Bagnara <roberto.bagnara@bugseng.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>
Subject: Re: [PATCH] xen: Use __auto_type
In-Reply-To: <20250505124646.1569767-1-andrew.cooper3@citrix.com>
References: <20250505124646.1569767-1-andrew.cooper3@citrix.com>
Message-ID: <707b9f833fd4cd0341ad09cbc3265ec9@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-05-05 14:46, Andrew Cooper wrote:
> In macros it is common to declare local variables using typeof(param) 
> in order
> to ensure that side effects are only evaluated once.  A consequence of 
> this is
> double textural expansion of the parameter, which can get out of hand 
> very
> quickly with nested macros.
> 
> A GCC extension, __auto_type, is now avaialble in the new toolchain 
> baseline
> and avoids the double textural expansion.
> 
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
> violation.  Nevertheless, I think we want to start using in places 
> where we
> currently use typeof(expression of <initilaiser>).
> 
> Eclair run on this patch (expecting a failure):
>   
> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1800631949
> 

Hi,

to make the analysis pass you need a couple of hunks in 
eclair_analysis/ECLAIR/toolchain.ecl:

-name_selector+={auto_type, "^__auto_type$"}

and add auto_type to the STD.tokenext config below around line 25, then 
later

-name_selector+={ext_auto_type, "^ext_auto_type$"}

and add "ext_auto_type" to the -config lines below

around line 125, along with a reference to the gcc docs above the 
configurations and in C-language-toolchain.rst

This is an extension, so it's usable without further MISRA impact.

> Min toolchain check:
>   https://godbolt.org/z/f9WjooPYj
> 
> GCC Manual:
>   
> https://www.gnu.org/software/c-intro-and-ref/manual/html_node/Auto-Type.html
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
>  #define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]) + 
> __must_be_array(x))
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

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

