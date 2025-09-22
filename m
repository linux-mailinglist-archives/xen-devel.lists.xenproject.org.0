Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DCBB91E42
	for <lists+xen-devel@lfdr.de>; Mon, 22 Sep 2025 17:24:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1127821.1468386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0iOM-00023j-VD; Mon, 22 Sep 2025 15:23:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1127821.1468386; Mon, 22 Sep 2025 15:23:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0iOM-00020g-SD; Mon, 22 Sep 2025 15:23:50 +0000
Received: by outflank-mailman (input) for mailman id 1127821;
 Mon, 22 Sep 2025 15:23:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PyN9=4B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v0iOK-00020Z-P8
 for xen-devel@lists.xenproject.org; Mon, 22 Sep 2025 15:23:48 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e033170-97c8-11f0-9d14-b5c5bf9af7f9;
 Mon, 22 Sep 2025 17:23:40 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3ee12a63af1so1984001f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Sep 2025 08:23:40 -0700 (PDT)
Received: from [192.168.42.55] ([74.50.221.250])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-269803601e3sm136417365ad.144.2025.09.22.08.23.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Sep 2025 08:23:39 -0700 (PDT)
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
X-Inumbo-ID: 1e033170-97c8-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758554620; x=1759159420; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cPCr2LK5pv/2B/54ptDrAwYpqRUMnsSaenADRpPpUkA=;
        b=baHE3IgFpIfgK3iXDeXP+Lxl34bvYPtWovnHQK8cyUM+mrAk5aWIUDHYlL/p+hZCxu
         9nYbi+kCKjRdKUBhkRlSBUbY4+2wReLtuyAmiGn0LFGn89uUQI6L45ul3v77B5FujP0g
         I+ZsaXi/45XFCxxR9OUzfMbS2ufPA7lFGYTC9/cFyiqUxPadiCMLC171jOST+873ejI3
         cm/dbsBtVBbOHNNhq+MknbiyQPsCJ4k8sVEfuq4kbIDzvS9hcCXQnIXHdh3kEI6m3Lq9
         bmYDOZKsT9lcQpd9hCYtENhXxj5kLg1MRqEumzbirEVqtP1Qxc1CFwlYE9/JqbRl0OYv
         ByGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758554620; x=1759159420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cPCr2LK5pv/2B/54ptDrAwYpqRUMnsSaenADRpPpUkA=;
        b=KP4uAnA4fDYsvkR5zWZPp/s/5SDTAUQmGlluqN3WQ2TeVYfGgFUt7+IeD6MtMRQ3jS
         zbq66kvMtSvoWQka1vkls21t2ErHZCMr/7O8w1Cchlw1cez3nu274ou0bZ+jsdxsxhHu
         HHhQNdkJqAql8+8qk3AqtzMvO8lkI16ft1dhbbmOETJHMqrWzT+cMy2W91gx0BQoxMC/
         vXiK/rsfYQKwvjM+jgwhXd43Vaawp3YQMT4A0rD+ppUJioiIKHxzOeY6VTX9eSraMyR6
         Ez1U10hOhszOmRosreOgoHPw6qREdqLrRELFfyvovTcfivFKwS9xTssr34xVfS4HVj4L
         6imw==
X-Forwarded-Encrypted: i=1; AJvYcCW18AQftZN7/nU/dOszZrKHzWNvRvUeWvfc0tjojOmhEUvp3dW+/EFtM+Dfoy2EFCGnnTGoplJv9zw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy/faT2UaxSy9NNjUx6Vj+L9NTBjTNE7igTQoxEyznd8L56zGDw
	7PPeYavjXQ02Uxs6EAhre6Jcad+gmu8+zkROOU8tqpLBLzxZisZnCjx7UDfwKA841w==
X-Gm-Gg: ASbGncvoHu9D/uuVLoqHooFBc4CWvXim6k6VdVPGRU1sQAkc0aOgFvB6YRqpBM7Q4uP
	eBcQJf84OLpthk63R9/fkLxUxViBPbdMpjCb8ubFiN94v5AASzae8ABGcwqzfMYM4lAgXpVZWhm
	45i0/uNr0derfiC/PCo3U0WSYaHBMru6faGYopOjc5QFx+fjF5M6QnhAgNTcG3CGhRR4jOEibbS
	IeEwCaqtyulrqI7XJu4K3PTjuZiLa/5e1eqITCKP3FTGBKtYZPFvLcgwYBvBvLW6Mp/U2klhEAd
	W+iCKzc2pM+xFh5w9k+90hef51QobVThkGsGqS7iZhDQVx4ffeupgtKtupAs3pBPCo7Hg1oN6a2
	2zO3NoSu8X1DLrEXnypYkw8mJHb3sT7Ot
X-Google-Smtp-Source: AGHT+IFD9luHa/mC3+npNF1k+2YxYcrMfVgTGhDyzvabyJlzV52bsSqXYpGMmgo66b+uUPbwXOIGfQ==
X-Received: by 2002:a05:6000:22c7:b0:3ee:1357:e18f with SMTP id ffacd0b85a97d-3ee7bad15e4mr11203323f8f.12.1758554619677;
        Mon, 22 Sep 2025 08:23:39 -0700 (PDT)
Message-ID: <c7e17ae4-0630-4061-b0e8-495cba02bc20@suse.com>
Date: Mon, 22 Sep 2025 17:23:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/domain: introduce DOMID_ANY
To: dmukhin@xen.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250920174732.1207847-2-dmukhin@ford.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250920174732.1207847-2-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.09.2025 19:47, dmukhin@xen.org wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Add a new symbol DOMID_ANY aliasing DOMID_INVALID to improve the readability
> of the code.
> 
> Update all relevant domid_alloc() call sites.
> 
> Amends: 2d5065060710 ("xen/domain: unify domain ID allocation")
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v1:
> - moved DOMID_ANY from the public header

This addresses my comment, but not Andrew's subsequent response, specifically
aiming at ...

> --- a/tools/tests/domid/harness.h
> +++ b/tools/tests/domid/harness.h
> @@ -41,6 +41,7 @@ extern unsigned long find_next_zero_bit(const unsigned long *addr,
>  
>  #define DOMID_FIRST_RESERVED            (100)
>  #define DOMID_INVALID                   (101)
> +#define DOMID_ANY                       DOMID_INVALID

... avoiding the need for any such secondary definitions.

Jan

