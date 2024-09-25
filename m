Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D50985718
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 12:21:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803806.1214616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stP8u-0005rl-MP; Wed, 25 Sep 2024 10:21:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803806.1214616; Wed, 25 Sep 2024 10:21:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stP8u-0005pF-Ja; Wed, 25 Sep 2024 10:21:08 +0000
Received: by outflank-mailman (input) for mailman id 803806;
 Wed, 25 Sep 2024 10:21:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lFoA=QX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1stP8t-0005p9-Mh
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 10:21:07 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ddef1c6e-7b27-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 12:21:03 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c5c3a1f474so3709914a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 03:21:03 -0700 (PDT)
Received: from ?IPV6:2a00:23ee:19c8:3368:2340:cc04:33fd:b83a?
 ([2a00:23ee:19c8:3368:2340:cc04:33fd:b83a])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf4c5002sm1690937a12.65.2024.09.25.03.21.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2024 03:21:01 -0700 (PDT)
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
X-Inumbo-ID: ddef1c6e-7b27-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727259662; x=1727864462; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3grR5TuetlbWM25oskqOdGHs2vwZJxvLzXwYWXO2k90=;
        b=H4uyS/dXinYQzNKQbEp0Gbqe1m7nDS9YNQGPAOw60ulVvH++r4VgVxI8FY1ZJzZfK7
         yRe8qqkXzbUO0C5mza9fGbjljcweRtetTU20jUGhZUbLWMQhSIA1fjyqdakF7ynoru6g
         w+PwiwKba+MF8ncC+CQqDcs+b4ysRnzTObjYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727259662; x=1727864462;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3grR5TuetlbWM25oskqOdGHs2vwZJxvLzXwYWXO2k90=;
        b=XkZXpBZkVnFmfLb36l/BaYzGcZW3/nvA3n5NpkGBz8AIAjCFUEjrD7R41JjKiYlS67
         njjSFZbOisokfdTCW5E/B4Y/Y7C94axHaWbMe0FnB0E9dO7fvANxllI1JupVcth2dyCC
         KedKCInTbFLQPPcNn3Vo+4rjvBC/UvVfZZL4G+jLWP707SLYUYbS/JNmlcRyiUui/D0x
         UA8WLqzdz6bfSwqzJ2VZAM6j2xkiVNILjBVhtBbgi52MJfCM6BZF4CQsXBPTUxiSRowk
         TtDSt1Dj9/Ma2HrJXxK5XfWV3CxPtD6RlUwTBAw2LXIRrxIeK4ZH5wItYOS/XX+7TogK
         Z8TQ==
X-Forwarded-Encrypted: i=1; AJvYcCV35lpevt+K51CFEojDEpv3KoLWfpXm6C20rZMIcCEnHFuL+7wM6/IIw5yRCIAgMdgExtM+nrhnbws=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyNFV3m+Riyh6kE5TYiBJzjGZRwiSUUJk8sCN6TvZO8PfEFpB8c
	Sb0OLb8F//+nGKVOhmFRzywyRxDh0uf0Oc5LgYV8EgrxcxZJ62ojkwm/QbAe638=
X-Google-Smtp-Source: AGHT+IHE8GWD8RYBE9hhgy1yEDchEnxuKAeORU9flByt79v4oqLFn23rYOKwM2zzqUFM+nGF90datQ==
X-Received: by 2002:a05:6402:40c5:b0:5c5:cb4a:a6f3 with SMTP id 4fb4d7f45d1cf-5c72060a57cmr1667566a12.3.1727259662334;
        Wed, 25 Sep 2024 03:21:02 -0700 (PDT)
Message-ID: <eaa4a524-fd12-4716-9d9f-cff25a4c9bbf@citrix.com>
Date: Wed, 25 Sep 2024 11:21:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] xen/livepatch: do Xen build-id check earlier
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20240925084239.85649-1-roger.pau@citrix.com>
 <20240925084239.85649-5-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240925084239.85649-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/09/2024 9:42 am, Roger Pau Monne wrote:
> The check against the expected Xen build ID should be done ahead of attempting
> to apply the alternatives contained in the livepatch.
>
> If the CPUID in the alternatives patching data is out of the scope of the
> running Xen featureset the BUG() in _apply_alternatives() will trigger thus
> bringing the system down.  Note the layout of struct alt_instr could also
> change between versions.  It's also possible for struct exception_table_entry
> to have changed format, hence leading to other kind of errors if parsing of the
> payload is done ahead of checking if the Xen build-id matches.
>
> Move the Xen build ID check as early as possible.  To do so introduce a new
> check_xen_buildid() function that parses and checks the Xen build-id before
> moving the payload.  Since the expected Xen build-id is used early to
> detect whether the livepatch payload could be loaded, there's no reason to
> store it in the payload struct, as a non-matching Xen build-id won't get the
> payload populated in the first place.
>
> Note parse_buildid() has to be slightly adjusted to allow fetching the section
> data from the 'data' field instead of the 'load_addr' one: with the Xen build
> ID moved ahead of move_payload() 'load_addr' is not yet set when the Xen build
> ID check is performed.  Also printing the expected Xen build ID has part of
> dumping the payload is no longer done, as all loaded payloads would have Xen
> build IDs matching the running Xen, otherwise they would have failed to load.
>
> Fixes: 879615f5db1d ('livepatch: Always check hypervisor build ID upon livepatch upload')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Much nicer.  A couple of suggestions.

> ---
> Changes since v1:
>  - Do the Xen build-id check even earlier.
> ---
>  xen/common/livepatch.c              | 66 +++++++++++++++++++----------
>  xen/include/xen/livepatch_payload.h |  1 -
>  2 files changed, 44 insertions(+), 23 deletions(-)
>
> diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
> index 8e61083f23a7..895c425cd5ea 100644
> --- a/xen/common/livepatch.c
> +++ b/xen/common/livepatch.c
> @@ -448,24 +448,21 @@ static bool section_ok(const struct livepatch_elf *elf,
>      return true;
>  }
>  
> -static int xen_build_id_dep(const struct payload *payload)
> +static int xen_build_id_dep(const struct livepatch_build_id *expected)
>  {
>      const void *id = NULL;
>      unsigned int len = 0;
>      int rc;
>  
> -    ASSERT(payload->xen_dep.len);
> -    ASSERT(payload->xen_dep.p);
> +    ASSERT(expected->len);
> +    ASSERT(expected->p);
>  
>      rc = xen_build_id(&id, &len);
>      if ( rc )
>          return rc;
>  
> -    if ( payload->xen_dep.len != len || memcmp(id, payload->xen_dep.p, len) ) {
> -        printk(XENLOG_ERR LIVEPATCH "%s: check against hypervisor build-id failed\n",
> -               payload->name);
> +    if ( expected->len != len || memcmp(id, expected->p, len) )
>          return -EINVAL;
> -    }

I'd suggest merging this into check_xen_buildid(), which is the single
caller and serves the same singular purpose.

It removes the ASSERT() (expected is now a local variable), and it helps
with some diagnostic improvements.

>  
>      return 0;
>  }
> @@ -495,11 +493,44 @@ static int parse_buildid(const struct livepatch_elf_sec *sec,
>     return 0;
>  }
>  
> +static int check_xen_buildid(const struct livepatch_elf *elf)
> +{
> +    struct livepatch_build_id id;
> +    const struct livepatch_elf_sec *sec =
> +        livepatch_elf_sec_by_name(elf, ELF_LIVEPATCH_XEN_DEPENDS);
> +    int rc;
> +
> +    if ( !sec )
> +    {
> +        printk(XENLOG_ERR LIVEPATCH "%s: %s is missing\n",

"%s: Section: '%s' missing\n".

(Maybe no single quotes around the section as we know it's non-empty.)

> +               elf->name, ELF_LIVEPATCH_XEN_DEPENDS);
> +        return -EINVAL;
> +    }
> +
> +    rc = parse_buildid(sec, &id);
> +    if ( rc )
> +    {
> +        printk(XENLOG_ERR LIVEPATCH "%s: failed to parse build-id at %s: %d\n",

"%s: Failed to parse section '%s' as build id: %d\n".

> +               elf->name, ELF_LIVEPATCH_XEN_DEPENDS, rc);
> +        return -EINVAL;
> +    }
> +
> +    rc = xen_build_id_dep(&id);
> +    if ( rc )
> +    {
> +        printk(XENLOG_ERR LIVEPATCH
> +               "%s: check against hypervisor build-id failed: %d\n",

"%s: build-id mismatch:\n"
"  livepatch: %*phN\n"
"        xen: %*phN\n"

This needs xen_build_id_dep() inlining in order to have the xen build-id
string, but the end result is much more informative.

I think I'm happy doing all of this on commit, but it might be a better
idea not to.

~Andrew

