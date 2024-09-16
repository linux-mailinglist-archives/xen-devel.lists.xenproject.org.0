Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C84197A2C0
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 15:11:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799505.1209488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqBVa-0006Iq-7h; Mon, 16 Sep 2024 13:11:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799505.1209488; Mon, 16 Sep 2024 13:11:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqBVa-0006GJ-4k; Mon, 16 Sep 2024 13:11:14 +0000
Received: by outflank-mailman (input) for mailman id 799505;
 Mon, 16 Sep 2024 13:11:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W1kI=QO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sqBVY-0006GD-TC
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 13:11:12 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 251904bc-742d-11ef-a0b6-8be0dac302b0;
 Mon, 16 Sep 2024 15:11:11 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a8a6d1766a7so580381166b.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2024 06:11:11 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612e18b0sm317422966b.147.2024.09.16.06.11.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Sep 2024 06:11:09 -0700 (PDT)
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
X-Inumbo-ID: 251904bc-742d-11ef-a0b6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726492271; x=1727097071; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KyXOpceYh8O7+jc+GSFGknqRJ1Ls76C+Mf2lX6XFz2g=;
        b=X7U0eYEaM6/NBGWQxIA7yyOh3uLwZGn2wioQDOZn158sGdsaCnQ0q0JUBJZmZ51UlZ
         Wg4YgAwzKUvtnnj7wjRb+4B/45eoFen7i4E57gLExIzyIfulCpXEKnehNsFmaJeTCVXU
         bC41zi9+Ve6p/ek3DLM9sWq0G70sTlxB8IVt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726492271; x=1727097071;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KyXOpceYh8O7+jc+GSFGknqRJ1Ls76C+Mf2lX6XFz2g=;
        b=rMUQ68mqgPc6Zdp/2VaTIGlszoQDcHIrnV5pLVEQwbIkTVH/bDKQT0DmK7uTYHxKbm
         +vde6oIKK5HSOvL4w5X9Z6tsKGvnPha/1Z29k0o+15LwA1+ANNYD/Fu13xyYFci/0kh7
         kmvU0EdzazD+J+0Qp6x3PVCRHjX9TJVHeEgP9xxZcQ+eOHk1LGzL6RqLC+SYQr2UWhjL
         9p9TnoHd7oNo5qxCMG5/GoZI8k/rFSHV6R8pe6TeqEeSLPQJx5hhepx30mpap5bE2MWt
         QQlMiaz1Iaq++L3RnCY2CsTfc9xgJXPJiLYiwRjMIGaWE+himqYdT2Eg8PKlKk74Vco0
         IBqw==
X-Forwarded-Encrypted: i=1; AJvYcCXuuk7PrcesLEQsg38GoAoQQRzQ/f76PgTG811+nW6WoKQuAjqc6BhMe7hphfkcwwWemyuWhctc4NQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwcUxsZfdt0KNnNqxJbsUTSkTDyPgwEWk/WuQHXiMbPFTdDuE0c
	nrFubXk5iqrWFDFpF8eHjYLedp7mwifIzwfJOy69MG49P0VecHqcezUicG6uspU=
X-Google-Smtp-Source: AGHT+IHT+N8S9ENnQ4JLJf7QA/Mwe8F9Lc48w6IlXmw5iT3w0O3bhxjVE9WyY8Iv2jYpIlaDRQ9UpA==
X-Received: by 2002:a17:907:3e86:b0:a86:8917:fcd6 with SMTP id a640c23a62f3a-a9029671639mr1695703666b.60.1726492270478;
        Mon, 16 Sep 2024 06:11:10 -0700 (PDT)
Message-ID: <01b4b04f-d7ba-4526-b45f-2146bfc03cbe@citrix.com>
Date: Mon, 16 Sep 2024 14:11:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] x86/time: introduce command line option to select
 wallclock
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20240913075907.34460-1-roger.pau@citrix.com>
 <20240913075907.34460-2-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240913075907.34460-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/09/2024 8:59 am, Roger Pau Monne wrote:
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index 959cf45b55d9..2a9b3b9b8975 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -2816,6 +2816,27 @@ vwfi to `native` reduces irq latency significantly. It can also lead to
>  suboptimal scheduling decisions, but only when the system is
>  oversubscribed (i.e., in total there are more vCPUs than pCPUs).
>  
> +### wallclock (x86)
> +> `= auto | xen | cmos | efi`
> +
> +> Default: `auto`
> +
> +Allow forcing the usage of a specific wallclock source.
> +
> + * `auto` let the hypervisor select the clocksource based on internal
> +   heuristics.
> +
> + * `xen` force usage of the Xen shared_info wallclock when booted as a Xen
> +   guest.  This option is only available if the hypervisor was compiled with
> +   `CONFIG_XEN_GUEST` enabled.
> +
> + * `cmos` force usage of the CMOS RTC wallclock.
> +
> + * `efi` force usage of the EFI_GET_TIME run-time method when booted from EFI
> +   firmware.

For both `xen` and `efi`, something should be said about "if selected
and not satisfied, Xen falls back to other heuristics".

> +
> +If the selected option is invalid or not available Xen will default to `auto`.

I'm afraid that I'm firmly of the opinion that "auto" on the cmdline is
unnecessary complexity.  Auto is the default, and doesn't need
specifying explicitly.  That in turn simplifies ...

> +
>  ### watchdog (x86)
>  > `= force | <boolean>`
>  
> diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
> index 29b026735e5d..e4751684951e 100644
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -1552,6 +1552,37 @@ static const char *__init wallclock_type_to_string(void)
>      return "";
>  }
>  
> +static int __init cf_check parse_wallclock(const char *arg)
> +{
> +    wallclock_source = WALLCLOCK_UNSET;
> +
> +    if ( !arg )
> +        return -EINVAL;
> +
> +    if ( !strcmp("auto", arg) )
> +        ASSERT(wallclock_source == WALLCLOCK_UNSET);

... this.

Hitting this assert will manifest as a system reboot/hang with no
information on serial/VGA, because all of this runs prior to getting up
the console.  You only get to see it on a PVH boot because we bodge the
Xen console into default-existence.

So, ASSERT()/etc really need avoiding wherever possible in cmdline parsing.

In this case, all it serves to do is break examples like `wallclock=xen
wallclock=auto` case, which is unlike our latest-takes-precedence
behaviour everywhere else.

> +    else if ( !strcmp("xen", arg) )
> +    {
> +        if ( !xen_guest )

We don't normally treat this path as an error when parsing (we know what
it is, even if we can't action it).  Instead, there's no_config_param()
to be more friendly (for PVH at least).

It's a bit awkward, but this should do:

    {
#ifdef CONFIG_XEN_GUEST
        wallclock_source = WALLCLOCK_XEN;
#else
        no_config_param("XEN_GUEST", "wallclock", s, ss);
#endif
    }

There probably wants to be something similar for EFI, although it's not
a plain CONFIG so it might be more tricky.

~Andrew

