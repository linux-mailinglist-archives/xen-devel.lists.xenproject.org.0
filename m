Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 806C52EFCCC
	for <lists+xen-devel@lfdr.de>; Sat,  9 Jan 2021 02:45:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63956.113388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ky3JC-0008MP-Oi; Sat, 09 Jan 2021 01:44:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63956.113388; Sat, 09 Jan 2021 01:44:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ky3JC-0008Ly-LD; Sat, 09 Jan 2021 01:44:50 +0000
Received: by outflank-mailman (input) for mailman id 63956;
 Sat, 09 Jan 2021 01:44:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KEI1=GM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ky3JB-0008Lp-Tg
 for xen-devel@lists.xenproject.org; Sat, 09 Jan 2021 01:44:49 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a52a1741-84a6-459d-9f1e-8a4653e58463;
 Sat, 09 Jan 2021 01:44:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3994F23A1E;
 Sat,  9 Jan 2021 01:44:48 +0000 (UTC)
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
X-Inumbo-ID: a52a1741-84a6-459d-9f1e-8a4653e58463
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610156688;
	bh=I3ZyY++peroLAL78alsHx6phuWnZD1dBdy606yTgCUU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nIbh5kAa0BXi79VimUt56Fxc3qrDufHeXHAWPL3fafgrBfRIxgc5vmhmb+vFt3idB
	 ZrlJ0uVT+RhWTWcNH/N2WErI4o2TnPMQ2Hkaa6Xdze9uFjqVOAIVaZ3wgkPyopBE9p
	 nZuYexXLeNXfnX1lPXDApAZg4JfFV55znwqwdpgFrdP6LQlQ3v4Sld/R0doSJba6NH
	 g94L5QRoAx3KELa6fyDQeGLesKYXmzzYwXHAnEpQG2O53r+phL8TzfICCAwo3Lg8o8
	 QKdfzd7Q7VYE3BJeYUPJ0YhaW+jl+7JFGyXkmSN6hM5P1CgfTKSc0ZjmQ3K8AUxkAq
	 zhwZ3HT/rA0Sg==
Date: Fri, 8 Jan 2021 17:44:47 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 07/11] xen/arm: bitops: Implement a ffsll function
In-Reply-To: <7c0410f150d78bae49c1d8ae0d918b56c2b0c7de.1610115608.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2101081622490.26153@sstabellini-ThinkPad-T480s>
References: <cover.1610115608.git.rahul.singh@arm.com> <7c0410f150d78bae49c1d8ae0d918b56c2b0c7de.1610115608.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 8 Jan 2021, Rahul Singh wrote:
> Implement the ffsll based on built-in function "__builtin_ffsll()"
> 
> ffsll will return one plus the index of the least significant 1-bit in
> doublewords or if doublewords is zero, returns zero.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
> Changes in V4:
>  - This patch is introduce in this verison.
> ---
>  xen/include/asm-arm/bitops.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/xen/include/asm-arm/bitops.h b/xen/include/asm-arm/bitops.h
> index 71ae14cab3..7f83ee1828 100644
> --- a/xen/include/asm-arm/bitops.h
> +++ b/xen/include/asm-arm/bitops.h
> @@ -170,6 +170,18 @@ static inline unsigned int find_first_set_bit(unsigned long word)
>          return ffsl(word) - 1;
>  }
>  
> +/**
> + * ffsll - find the first least significant set bit
> + * @doubleword: double word to search
> + *
> + * Returns one plus the index of the least significant 1-bit in @doubleword
> + * or if doubleword is zero, returns zero.
> + */
> +static inline int ffsll(long long doubleword)
> +{
> +        return __builtin_ffsll(doubleword);
> +}

This compiles fine with my old 4.9 compiler and in gitlab too, so I am
OK with this, even better because it is less code to maintain.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

