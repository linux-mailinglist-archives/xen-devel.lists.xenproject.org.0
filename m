Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B760997802
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 23:59:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815193.1228887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syehj-0000L0-5b; Wed, 09 Oct 2024 21:58:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815193.1228887; Wed, 09 Oct 2024 21:58:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syehj-0000Iu-2M; Wed, 09 Oct 2024 21:58:47 +0000
Received: by outflank-mailman (input) for mailman id 815193;
 Wed, 09 Oct 2024 21:58:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XgrK=RF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1syehh-0008AP-O1
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 21:58:45 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a686a2ac-8689-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 23:58:43 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a99543ab209so36292166b.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 14:58:43 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99533f51f1sm492430666b.93.2024.10.09.14.58.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 14:58:42 -0700 (PDT)
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
X-Inumbo-ID: a686a2ac-8689-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728511123; x=1729115923; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0r81zqmpFt5fU1xOrESgWby3mypK04ICMpE60zE1iGE=;
        b=WcP6loWzwU48//eHNr8k2NpIg1nUsYA8Y+TQe8swd9YFJko4yWBI/yFjBLHb9QTryY
         HTxTx5Kt0tGTo5IojZxpk2i3/8em4+YM/1GgX6wAix7gaYs5CqXX25GPL9FiZO5KxGAT
         ehVv+0ThZXRI9kpGr3RHxvOKX9od93tWHpzGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728511123; x=1729115923;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0r81zqmpFt5fU1xOrESgWby3mypK04ICMpE60zE1iGE=;
        b=n7ZUEIEgbEZDFE9zHdgA+PLXK5rkhiicvRRsUGq1AiJg3rayeJWcwTOqjqW9hESR6p
         kJT2Cr2GFtGZZUoQi2Ll2K3jWxssH/09x3h7yxzi2a16aCZ/x8HTlk3rje27CJc2I5oB
         LBreMdNKJnpCuG7i4r99igDAQnh14wpgW5ws39OpAuxeddzHgN2ppW8FA19RzKSE0FXO
         HvcsYTWSriDl490Os4YES7D0/AwRK/U4nXilWkuGfkFdw97eOYLsYhz+8UYWCQh+wZe5
         LO0u2mpCFEhj5OxMLe0s/1cvwLvR7xKjcIibIIzZbaZ1nNvxtytv5FQn+/CFkl+jYtPo
         u4iQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2/nsWFuBWFjTlxzE9UCwZsF6n5PSqWdnDvsZu7S6KZksVjgu0T08fIwK2j8iVNGQMbZ6bm0OqxLc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwbSDmOYdPM6Howrflg8qICabJeh9+jqjQ59t5x7gjDxEPMpOOI
	Fb0yg94uS86UC1lQhdRXpqNeIIxn6cAX2dxfnEFvHCzZ33NE2yGYBFvX51a/l5Q=
X-Google-Smtp-Source: AGHT+IH9goltpp8+JOLSAO8qY/HNcuZ3Z4ax7zTLIiBn29+rVSNnGE1UEo2DD3tLeABCIDOUFWGXRA==
X-Received: by 2002:a17:907:6d1b:b0:a99:4b5a:a59 with SMTP id a640c23a62f3a-a998d1982ffmr303372466b.18.1728511122961;
        Wed, 09 Oct 2024 14:58:42 -0700 (PDT)
Message-ID: <9cb1ed7d-4755-4ce4-bdd3-3697b3a9d2c4@citrix.com>
Date: Wed, 9 Oct 2024 22:58:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/11] lib/x86: Relax checks about policy compatibility
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>
References: <20241001123807.605-1-alejandro.vallejo@cloud.com>
 <20241001123807.605-2-alejandro.vallejo@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241001123807.605-2-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/10/2024 1:37 pm, Alejandro Vallejo wrote:
> diff --git a/xen/lib/x86/policy.c b/xen/lib/x86/policy.c
> index f033d22785be..63bc96451d2c 100644
> --- a/xen/lib/x86/policy.c
> +++ b/xen/lib/x86/policy.c
> @@ -15,7 +15,16 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
>  #define FAIL_MSR(m) \
>      do { e.msr = (m); goto out; } while ( 0 )
>  
> -    if ( guest->basic.max_leaf > host->basic.max_leaf )
> +    /*
> +     * Old AMD hardware doesn't expose topology information in leaf 0xb. We
> +     * want to emulate that leaf with credible information because it must be
> +     * present on systems in which we emulate the x2APIC.
> +     *
> +     * For that reason, allow the max basic guest leaf to be larger than the
> +     * hosts' up until 0xb.
> +     */
> +    if ( guest->basic.max_leaf > 0xb &&
> +         guest->basic.max_leaf > host->basic.max_leaf )
>          FAIL_CPUID(0, NA);
>  
>      if ( guest->feat.max_subleaf > host->feat.max_subleaf )

This isn't appropriate.  You're violating the property that a guest
policy should be bounded by the max (called host here).

Instead, the max policies basic.max_leaf should be at least 0xb.

This is another case where the max wants to be higher with default
inheriting from host.

But it occurs to me that with max being an not-sane-in-isolation policy
anyway, we probably want to end up setting max->$foo.max_leaf to the
appropriate ARRAY_SIZE()'s.

For any leaves within the bounds that Xen knows, it's fine for the
toolstack to set values there even beyond host max leaf, as long as it
doesn't violate other consistency checks.

So, please fix this by adjusting
calculate_{pv,hvm}_{max,default}_policy() in Xen.

Sadly I think it will end up a tad ugly, but don't worry too much. 
We've got a number of host==default but max special fields, and I'm
wanting to get a few more examples before choosing how best to
rationalise it to reduce opencoding.

~Andrew

