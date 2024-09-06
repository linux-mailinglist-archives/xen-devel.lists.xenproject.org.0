Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4936396FE84
	for <lists+xen-devel@lfdr.de>; Sat,  7 Sep 2024 01:35:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.792073.1202108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smiTT-0003tx-Pk; Fri, 06 Sep 2024 23:34:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 792073.1202108; Fri, 06 Sep 2024 23:34:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smiTT-0003ru-MB; Fri, 06 Sep 2024 23:34:43 +0000
Received: by outflank-mailman (input) for mailman id 792073;
 Fri, 06 Sep 2024 23:34:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y4lz=QE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1smiTR-0003ro-Ti
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2024 23:34:42 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94f5b61e-6ca8-11ef-99a1-01e77a169b0f;
 Sat, 07 Sep 2024 01:34:39 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 139C15C5A53;
 Fri,  6 Sep 2024 23:34:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 960FCC4CEC4;
 Fri,  6 Sep 2024 23:34:35 +0000 (UTC)
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
X-Inumbo-ID: 94f5b61e-6ca8-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725665677;
	bh=TW9TknLKXphvGldXv6XGxyhIwbYipqug07d3WeROLCQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pxpMzqk6gF0R0VeGwxOXik9TvvYiJoDAuGT5mEySicgmjCQ3LZvha//6MzxzMksFl
	 sESxHd5jhFdOw1N8kec+dLo2iW8OBnJMXdKp/0kCkOij9HrWObqzFBkfW6p1GkphKF
	 cJ038XxrzN4alGyzgi8VViJPlZnObhGTIHBJMhAOZ08T+AJU7EySi7fIrskJ/3NPgC
	 /OGxGsqXrgRXqy9Dv2skUbMyba/Tq2i/76z9spDNStcPHMdsvQSTOitJ5G7pNzDbdX
	 RnhMEdAEN7QT8dAnRX1QT31Dfcg9UsSmEoWR/RG26u95n8DJeqQs3+ahr6dYgH4fGN
	 JV1AYWXmnADCA==
Date: Fri, 6 Sep 2024 16:34:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: Re: [PATCH v3 1/5] xen/bitops: Reinstate the please tidy message
In-Reply-To: <20240904225530.3888315-2-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2409061630150.53815@ubuntu-linux-20-04-desktop>
References: <20240904225530.3888315-1-andrew.cooper3@citrix.com> <20240904225530.3888315-2-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1542644096-1725665616=:53815"
Content-ID: <alpine.DEB.2.22.394.2409061634330.53815@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1542644096-1725665616=:53815
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2409061634331.53815@ubuntu-linux-20-04-desktop>

On Wed, 4 Sep 2024, Andrew Cooper wrote:
> Recent additions have undone prior tidying at the top of the file.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Hi Andrew,

I admit I don't understand the value and the meaning of the "Please tidy
above here" comments.

However, you got one just like this one committed with ea59e7d780d9 and
then removed by 5f7606c048f7. It looks like they are useful to you. As
you are the one doing the tiding, and given that you had one already
before:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
> ---
>  xen/include/xen/bitops.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
> index ed6b9ccc724f..6f8e36f1c755 100644
> --- a/xen/include/xen/bitops.h
> +++ b/xen/include/xen/bitops.h
> @@ -210,6 +210,8 @@ static always_inline bool test_bit(int nr, const volatile void *addr)
>      test_bit(nr, addr);                                 \
>  })
>  
> +/* --------------------- Please tidy above here --------------------- */
> +
>  static always_inline attr_const unsigned int ffs(unsigned int x)
>  {
>      if ( __builtin_constant_p(x) )
> -- 
> 2.39.2
> 
--8323329-1542644096-1725665616=:53815--

