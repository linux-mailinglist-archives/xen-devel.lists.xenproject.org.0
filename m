Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D323ABED76
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 10:03:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991589.1375440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHePl-00040s-SB; Wed, 21 May 2025 08:03:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991589.1375440; Wed, 21 May 2025 08:03:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHePl-0003ye-Nz; Wed, 21 May 2025 08:03:01 +0000
Received: by outflank-mailman (input) for mailman id 991589;
 Wed, 21 May 2025 08:02:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TwEK=YF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHePj-0003yY-MZ
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 08:02:59 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ffa348d8-3619-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 10:02:54 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6021b8b2c5fso2387111a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 01:02:54 -0700 (PDT)
Received: from [10.1.248.227] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d04b059sm869953666b.10.2025.05.21.01.02.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 May 2025 01:02:53 -0700 (PDT)
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
X-Inumbo-ID: ffa348d8-3619-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747814573; x=1748419373; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8RKb0K7otHgP7RzDk9UByehX8X7QlZO9RoYs09s8/hk=;
        b=IYil/KNBW1X+PsRTnEbkYFHN34g4HJq/gPs+tHSXoSFrebKUEJnI4hgJfjK3w15KB/
         ZNwx/dr8tcZD3i2JuOGY60CCDipKSKd6PHFumbdJ0rYfZ72jMbf0IdOQnmWyVEuBTEQt
         pnDMyMrkfdf6iUPj1h3szPmFKE9dnO31jkEykOwduPGwKWbgWO1vcVqRxnxKHS/VKbCI
         9h7kIGS/6CzdAtFG23VygJT0ds82zTBcpn1RyAlt/0abIjojG2a2IWGutkYLGYamSj1Y
         UeAkTOSmmM2NX8d2xesz2KWXF+pLp6NEXef1s69RZFqnRegVsa00/mIGKioFH6hSCqkF
         Vw+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747814573; x=1748419373;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8RKb0K7otHgP7RzDk9UByehX8X7QlZO9RoYs09s8/hk=;
        b=GJl0B2qlFKgD/M97EjNqKmUuqvqEqPXabR4YkruIzt3IqA7058TgMxuBBDFg/U4xNq
         P+3w362QBMCJAlUY+8hyaLye2CEQy3SifaoUr2wpcQJMlzOC9+U4MtmVxe8FpFdj9Jf5
         QXeM7Z4+Ekk8bBY5UcTFLdWy6D1rAgsfXUxsOujH1hBbRAxM9MdXJmOMElrQfI0Ld8aG
         JSkQIWbeAw2isy5U+R4aDCslwb6uQAp3VATFN00QzjOWaKvH8EmvruhD2RCGOT/agqf4
         A6rMfGnPAEV5OhMYgZXdnzPDOe/7ZHpkB/FnjHCDnnaGukf4X8J8Y8Dog6NGNAup0bjG
         g00A==
X-Forwarded-Encrypted: i=1; AJvYcCVSNpjiV4Vf2piVsWvlzT9zXBxJptSdyOnN9YcEOtALzUrg6eGprxdgpNttB/L4CPpZdXO/N0yj20g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwbSsg5n8rR8bVKThZPlXIaUMHw2OoPIP9Lp90sHvUvQIskdafW
	0cH1sxmjO3SZyPg1B95lzEhSFi8ZksMJXc6+xC7CzKWvfagtmOxhQzL5KVIUpq71OA==
X-Gm-Gg: ASbGncvGpJWJzdPwE+Pe4kxNMA22SRZF5AupVvftCrG2VwyLidsqho4TacLA5bOYAv9
	SLLJ5YpFKVhCIL8RjkIw52J+humx2qZiT1VwuKHR8o5jPXStQglBSKMtM79Hi+7VFb6CvuGKxED
	QCCb6Idomd9imlZa3hBze5dDe56P/6LpHvJB1vk+n4JRM+0OO2TtJ98BH8Rk0o012uZ8CB+5or2
	GX47oYgIyHZnEnA+h8/04cH/My0WXAbzExxDqYkX8/8iPLQqzRAtFvb86sS40sZnwLp5UJa1KqS
	EQW19IxdItDvvosQGFBa59Qwsrar5L+MBjUuI+OnJUfk0ZnnGK1tg0QA0bPi3g==
X-Google-Smtp-Source: AGHT+IEND500oVlNJLsvfzvE8jA4wdHt87LyiNW3spphFfaYZ4JjLnPNiwijKC6n/CYM3yRrQftDFg==
X-Received: by 2002:a17:907:980d:b0:ad2:3f1f:7965 with SMTP id a640c23a62f3a-ad52d43838fmr1945414266b.4.1747814573541;
        Wed, 21 May 2025 01:02:53 -0700 (PDT)
Message-ID: <675950c9-f48a-489e-9ca1-816d876fbcbb@suse.com>
Date: Wed, 21 May 2025 10:02:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] xen/domain: unify domain ID allocation
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 teddy.astie@vates.tech, dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250521000024.2944685-1-dmukhin@ford.com>
 <20250521000024.2944685-2-dmukhin@ford.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250521000024.2944685-2-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.05.2025 02:00, dmkhn@proton.me wrote:
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -66,6 +66,11 @@ DEFINE_RCU_READ_LOCK(domlist_read_lock);
>  static struct domain *domain_hash[DOMAIN_HASH_SIZE];
>  struct domain *domain_list;
>  
> +/* Non-system domain ID allocator. */
> +static DEFINE_SPINLOCK(domid_lock);
> +static DECLARE_BITMAP(domid_bitmap, DOMID_FIRST_RESERVED);
> +static domid_t domid_last;

Please move this into the narrowest possible scope. No reason to expose
it to the entire CU.

> @@ -2405,6 +2412,46 @@ domid_t get_initial_domain_id(void)
>      return hardware_domid;
>  }
>  
> +domid_t domid_alloc(domid_t domid)
> +{
> +    spin_lock(&domid_lock);
> +
> +    if ( domid < DOMID_FIRST_RESERVED )
> +    {
> +        if ( __test_and_set_bit(domid, domid_bitmap) )
> +            domid = DOMID_INVALID;
> +    }
> +    else
> +    {
> +        domid = find_next_zero_bit(domid_bitmap, DOMID_FIRST_RESERVED,
> +                                   domid_last);
> +
> +        if ( domid == DOMID_FIRST_RESERVED )
> +            domid = find_next_zero_bit(domid_bitmap, DOMID_FIRST_RESERVED, 0);

Despite what the last sentence of the description says, there is a subtle
behavioral change here: The original code would never return what was
called "rover" there. If the most recently created domain went away, you
would return its ID again here if no other ID is free (which is easier to
run into with patch 3 in place, and MAX_DOMID set to a pretty low value).
(Noticing only later: This could even occur without wrapping, as the last
argument passed is just domid_last, without adding in 1.)

I agree it's debatable whether using the sole available ID instead of
failing wouldn't be better(?) behavior in this specific case, but such
definitely can't go silently.

Furthermore you once again are potentially returning ID 0 here (after
wrapping), when the original code specifically avoided that (irrespective
of there actually being a Dom0, that is; i.e. covering both the dom0less
case and the late-hwdom one).

To be frank, being at v8 I find it problematic that there still are
(unmentioned and potentially unwanted) behavioral changes here. This
kind of supports my earlier raised question of whether we actually want
this sort of a change.

Jan

