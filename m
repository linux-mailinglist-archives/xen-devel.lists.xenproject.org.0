Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 171BCB3C402
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 22:59:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1102206.1454926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us6Bb-0002uV-8o; Fri, 29 Aug 2025 20:59:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1102206.1454926; Fri, 29 Aug 2025 20:59:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us6Bb-0002sb-63; Fri, 29 Aug 2025 20:59:03 +0000
Received: by outflank-mailman (input) for mailman id 1102206;
 Fri, 29 Aug 2025 20:59:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b4pU=3J=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1us6BZ-0002sV-Rj
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 20:59:01 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc0fd882-851a-11f0-8dd7-1b34d833f44b;
 Fri, 29 Aug 2025 22:58:59 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-45b82a21e6bso6302445e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 29 Aug 2025 13:58:59 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b66c7f0d0sm86138025e9.3.2025.08.29.13.58.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Aug 2025 13:58:58 -0700 (PDT)
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
X-Inumbo-ID: fc0fd882-851a-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756501139; x=1757105939; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=h8TyG9Vd8UOJ9yTcvN4sd9LcWR+g5/48sVvFQ+3BGFo=;
        b=XFKgvhCCxZRdsFzvQI1Ent2IehS/KMzfqf8Oy5G5tmtOLTNMkkA5dOPGHD+/HrGwnV
         KWX4WNWy8Wxd12Cs4eUkWadXXhAAu3ojuwLhNLlWPfhp7MA7H7mkIYHFndsU4Dh38PYx
         0lQgbk4iO3KXQDlz4s6a4ekiwgguZRK7egJxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756501139; x=1757105939;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h8TyG9Vd8UOJ9yTcvN4sd9LcWR+g5/48sVvFQ+3BGFo=;
        b=EMyuXaeMaicIwMpe7qNT0rG4c+EN1q62UfMIlw+tX+QP5mG8cQVR0BdBtmn8LK8Yan
         SvnHnO87NJ/elJYjq7nJfuu4ROoXnHsFHE6zPDc3o2+ZLYPW+FjhB7PkjNFzWXsr4RI6
         yxOiyTTog6A3/nPvQP5qNf9yhP0pZZL/is5Q9eLkGklRYDpgcZyy0QR33AlkS4kCEKgj
         IgVrs4nGrnl6DJuQ7ac9/boXFNC7vJGJ10TcF+GqvGZBZ4L2QqA+vD554kqky5KK1hum
         MijSSvvURkOBQxJV0nGO3TwimQsBnFQpv6kwY46twZf0LvuLwlokextDF5pT7GlGVbIL
         BSAg==
X-Forwarded-Encrypted: i=1; AJvYcCUlfNIHtVulODjtODHojXDxDLxbfhybo1zdiyThz7sGMo/o/J+T4g5zcZbejxiv2dm6SNP3nniTavQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw0odPDi/EYgt5rTguyD8L/Q9gZpgBZn9ANujCv0mPoJ7AhMtbu
	JqclBeHLdnJproIeWxie9PkmpqxCpBLR0ZZkfGa3XGGq4A3ndcYOwr10KjQohbGPL/8=
X-Gm-Gg: ASbGnctAwX1ohn13XhEDbjaGZVoEr3Owmbo/TwpM/o1BFdIDbSbkGGEk/ghA4BesOSw
	O8yJeLe2F/5lHCaS3ZXX3QvqItoAaqU8sWjrO0POLpGoD8kix6RI5/weNmIWcUBgNzoObRPgzh1
	feWWl96l5tWQe09GsYiYaaiL+3BLGZ5VDUtiMv798YN9Q/i06+54GZPQ5YkYBQ7YNnoPHd8zKDI
	yQ2wneQGJOzaJec+4yVORO1HN1KjbgOGYX4R+BgRsyLgL4+hmdLlKH8IsZ2I0j86CByNdwvURO+
	/TWwdPIJrF8mE/HDObyTay0WWHV6q4+mZOQlgW0D73veIDs/GLk/7KLHkiL9w2+8q5mDK19Y30b
	u3nDmAPb5yKFf+GRRF8DeG1XEHx1TTZXDS+YbmdRLXACxU/4/2K7zZzASiH/6jBavGLjJ
X-Google-Smtp-Source: AGHT+IEWUC3T+iAiR6xwtxuJSCopIWY8eL0Rpx6Aep/vsT/hQElzkEN+bC0+VIBTHTRSFwaOWNfLEA==
X-Received: by 2002:a05:600c:4f12:b0:459:dde3:1a37 with SMTP id 5b1f17b1804b1-45b66343ea2mr131838745e9.25.1756501138620;
        Fri, 29 Aug 2025 13:58:58 -0700 (PDT)
Message-ID: <efac3768-b434-4f22-96f0-887540651b7e@citrix.com>
Date: Fri, 29 Aug 2025 21:58:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/gen-cpuid: correct cycle detection
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <73d725a9-4163-4dd8-a9ac-b1c234005ced@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <73d725a9-4163-4dd8-a9ac-b1c234005ced@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/07/2025 7:59 am, Jan Beulich wrote:
> With the processing done linearly (rather than recursively), checking
> whether any of the features was previously seen is wrong: That would
> e.g. trigger for this simple set of dependencies
>
>     X: [A, B]
>     A: [C]
>     B: [C]
>
> (observed in reality when making AMX-AVX512 dependent upon both
> AMX-TILE and AVX512F, causing XSAVE to see AMX-AVX512 twice in its list
> of dependents). But checking the whole accumulated set also isn't
> necessary - just checking the feature we're processing dependents of is
> sufficient. We may detect a cycle later that way, but we still will
> detect it. What we need to avoid is adding a feature again when we've
> already seen it.
>
> As a result, seeding "seen[]" with "feat" isn't necessary anymore.
>
> Fixes: fe4408d180f4 ("xen/x86: Generate deep dependencies of features")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Doing AMX-AVX512's dependencies like mentioned above still isn't quite
> right; we really need AVX512F || AVX10, which can't be expressed right
> now.
>
> This contextually collides with patch 2 of "x86/cpu-policy: minor
> adjustments", posted almost 2 years ago and still pending (afair) any
> kind of feedback.
>
> I'd like to note that the commented out code in the loop (sitting
> between the two hunks beklow) doesn't really work for ARCH_CAPS: The
> first unused bit (between XAPIC_STATUS and OVRCLK_STATUS) triggers
>
> Traceback (most recent call last):
>   File ".../xen/../xen/tools/gen-cpuid.py", line 608, in <module>
>     sys.exit(main())
>   File ".../xen/../xen/tools/gen-cpuid.py", line 602, in main
>     crunch_numbers(state)
>   File ".../xen/../xen/tools/gen-cpuid.py", line 382, in crunch_numbers
>     (state.names[feat], repl(seen)))
>   File ".../xen/../xen/tools/gen-cpuid.py", line 378, in repl
>     return "[" + ", ".join((state.names[x] for x in l)) + "]"
>   File ".../xen/../xen/tools/gen-cpuid.py", line 378, in <genexpr>
>     return "[" + ", ".join((state.names[x] for x in l)) + "]"
> KeyError: 534
>
> (line numbers slightly shifted due to other debugging code I had added).
> My Python clearly isn't good enough to try to guess how to fix that.

I've posted a fix for this.


>
> --- a/xen/tools/gen-cpuid.py
> +++ b/xen/tools/gen-cpuid.py
> @@ -350,7 +350,7 @@ def crunch_numbers(state):
>  
>      for feat in deep_features:
>  
> -        seen = [feat]
> +        seen = []
>          to_process = list(deps[feat])
>  
>          while len(to_process):
> @@ -363,14 +363,14 @@ def crunch_numbers(state):
>  
>              f = to_process.pop(0)
>  
> -            if f in seen:
> -                raise Fail("ERROR: Cycle found with %s when processing %s"
> -                           % (state.names[f], state.names[feat]))
> +            if f == feat:
> +                raise Fail("ERROR: Cycle found with %s" % (state.names[f], ))

Despite f and feat being the same now, I think this wants to keep the
other part of the sentence.  i.e. "Cycle found when processing %s".

It's a little awkward that there's no sensible way to reverse engineer
the cycle and print it, but it's also been far too long since I last did
graph theory.

>  
> -            seen.append(f)
> -            to_process = list(set(to_process + deps.get(f, [])))
> +            if not (f in seen):
> +                seen.append(f)
> +                to_process = list(set(to_process + deps.get(f, [])))

    if f not in seen:

But this will be a simpler patch if you do:

    if f in seen:
        continue

and don't change the indentation of of seen.append()

After this fix goes in, and now because the order is less relevant, I
probably ought to rewrite this to use sets rather than lists.  I have a
suspicion it can be done better than one-at-a-time; all that matters if
we don't see a repeat feature in deps.  We don't need to check the
feature bits outside of deps because they're (by definition) leaf values.

~Andrew

