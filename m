Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC0AA6565B
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 16:49:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917237.1322197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuCi2-0006Ab-6w; Mon, 17 Mar 2025 15:48:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917237.1322197; Mon, 17 Mar 2025 15:48:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuCi2-00068S-3Q; Mon, 17 Mar 2025 15:48:58 +0000
Received: by outflank-mailman (input) for mailman id 917237;
 Mon, 17 Mar 2025 15:48:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Rdq/=WE=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tuCi1-00068M-0b
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 15:48:57 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55287481-0347-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 16:48:55 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3913cf69784so3921143f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 08:48:55 -0700 (PDT)
Received: from [192.168.1.74] (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb40cdafsm15448541f8f.62.2025.03.17.08.48.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 08:48:54 -0700 (PDT)
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
X-Inumbo-ID: 55287481-0347-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742226535; x=1742831335; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o+5W+UssECkTKS4DrzEwRnjDFNiMZjlh6x8JkFvP4I8=;
        b=Kr4CiRLafOzSfjo2UKX+6J8zmCK7ugPqB3IyS+TUie11/D6uMhM/izXS+Vm7EhAYWP
         E1y8uyU70skNbsfrh04Iu3SbwJ8mmYyCOebluOfPsCQe9IsXNTPEOxxgO42mwfe0GRmJ
         b3/7f/5GQFPMRhY+Uta+yYChyHcM/18LXn15i0tfSn1pQGFyzXZyJ6HC/n8KsNVGQ05z
         8VwC8VGXXSgTWtmsnyGLyoOPNazLqOMSn2bK6fLcipwnNbj5tHiP1EukLzIinBKfazF5
         GpQjGh2xZYzD1CfNQtANJmitQTtF3PSR8jYLZ5qFgWeMlxFzAtqqTx5EXu70VDAz1mwA
         IWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742226535; x=1742831335;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o+5W+UssECkTKS4DrzEwRnjDFNiMZjlh6x8JkFvP4I8=;
        b=VGhyMq7oLHNGIL/1pSS0LzFrdWEY/1Pi1TJ0rnIrZzfu/RCRi8Xpa4uBMyWKCSinCB
         vlx9Ve9S8KRvF2WC7SdlDz676bZrZl8IcSMAbv2O18bQrkRMxKiHjC0kd/Z9aLZPHtia
         KPzJQFR/dlz/sU9xn0bG4aB5Ubl263WEIvyrlnNJYiPnZVDE7MLw9yAO+SnhCA1tNazg
         eB/8pctKfmShHmONO5ORtSoYTO5w8SrH7aY+5L3/p+5xmCrY0s+E4l1XyczSuLrEaCUk
         5gz/hLXEHxfkSFRaALASxxStGLlE7lIoSRiWFXeXT7Gx44vJUNkMvbZl607dQeqRDR4i
         K7Bg==
X-Forwarded-Encrypted: i=1; AJvYcCWzk1wsmtdyRXgr8omh+9X774MfKdsvSwcaM+a8Z9gjbiiLkfuqFK46it6C1tyD9mKnd2qe6BZKo0o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzRtgfRgZ/xcFQXj+MC3r8kh5hg1L8ETxow+QQ/Dpw1KkD1Zm6h
	U/lQ3ppl27BN61zqAv71jwyC3Kw1JW+OXRuAWBZns3ZWJizbm8SjQAEeFWPgv+I=
X-Gm-Gg: ASbGncvkqRNBoZuNl7x6fB6r/eOjjqUVawGWcT49BdXobxFzpTL69kQgMGYkwG5gfi0
	vfU1ZdIh8zjSvOCC88TVr++2etxqFYtqzfhRIa1VQeNWH8TA6rk3di+IvBRpbfl4/SCqI3dqbEJ
	x/FjiWHb38kurSLXMTLEeHw8tSZn/kygdV2sfy/wYdgGLl5TJ4mAl0y/etJucYCY8V3sbWM7h5t
	HideXMODp0EgjimaHh+AR0VdpUq4ctSPgzBlaHbF5wk19MATFVOEr0CRkPTcUNAt+kh+tF1UDv5
	9rra4De9fRs7c3I3OXXMucjKvgliUY0ryDVcCON6YnwUVUUgQGNC30rGhWwVBs67XnaIdHyHmKc
	0Flhae+D1hw==
X-Google-Smtp-Source: AGHT+IGPYq8a1DX+sutBQTGjwo1ZKdFnw90ZowytYQDXuqZKLeSdwoGehqSW8lE4c/1Od7xg7Lk9Jg==
X-Received: by 2002:a5d:5f4b:0:b0:391:212:459a with SMTP id ffacd0b85a97d-3971e781d76mr12793882f8f.22.1742226534980;
        Mon, 17 Mar 2025 08:48:54 -0700 (PDT)
Message-ID: <d5e2aa98-5b9c-4521-927f-86585b7b2cfa@linaro.org>
Date: Mon, 17 Mar 2025 16:48:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/17] exec/memory.h: make devend_memop "target
 defines" agnostic
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paul Durrant <paul@xen.org>, Peter Xu <peterx@redhat.com>,
 alex.bennee@linaro.org, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-riscv@nongnu.org,
 manos.pitsidianakis@linaro.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Anthony PERARD <anthony@xenproject.org>, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Weiwei Li <liwei1518@gmail.com>
References: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
 <20250314173139.2122904-6-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250314173139.2122904-6-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/3/25 18:31, Pierrick Bouvier wrote:
> Will allow to make system/memory.c common later.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   include/exec/memory.h | 16 ++++------------
>   1 file changed, 4 insertions(+), 12 deletions(-)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index da21e9150b5..069021ac3ff 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -3138,25 +3138,17 @@ address_space_write_cached(MemoryRegionCache *cache, hwaddr addr,
>   MemTxResult address_space_set(AddressSpace *as, hwaddr addr,
>                                 uint8_t c, hwaddr len, MemTxAttrs attrs);
>   
> -#ifdef COMPILING_PER_TARGET
>   /* enum device_endian to MemOp.  */
>   static inline MemOp devend_memop(enum device_endian end)
>   {
>       QEMU_BUILD_BUG_ON(DEVICE_HOST_ENDIAN != DEVICE_LITTLE_ENDIAN &&
>                         DEVICE_HOST_ENDIAN != DEVICE_BIG_ENDIAN);
>   
> -#if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN
> -    /* Swap if non-host endianness or native (target) endianness */
> -    return (end == DEVICE_HOST_ENDIAN) ? 0 : MO_BSWAP;
> -#else
> -    const int non_host_endianness =
> -        DEVICE_LITTLE_ENDIAN ^ DEVICE_BIG_ENDIAN ^ DEVICE_HOST_ENDIAN;
> -
> -    /* In this case, native (target) endianness needs no swap.  */
> -    return (end == non_host_endianness) ? MO_BSWAP : 0;
> -#endif
> +    bool big_endian = (end == DEVICE_NATIVE_ENDIAN
> +                       ? target_words_bigendian()
> +                       : end == DEVICE_BIG_ENDIAN);

Unnecessary parenthesis?

> +    return big_endian ? MO_BE : MO_LE;
>   }
> -#endif /* COMPILING_PER_TARGET */
>   
>   /*
>    * Inhibit technologies that require discarding of pages in RAM blocks, e.g.,


