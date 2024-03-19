Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A4D88064B
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 21:52:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695606.1085473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmgR1-0006th-Eb; Tue, 19 Mar 2024 20:51:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695606.1085473; Tue, 19 Mar 2024 20:51:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmgR1-0006sA-Bb; Tue, 19 Mar 2024 20:51:47 +0000
Received: by outflank-mailman (input) for mailman id 695606;
 Tue, 19 Mar 2024 20:51:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CQvM=KZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rmgQz-0006s4-Lw
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 20:51:45 +0000
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [2607:f8b0:4864:20::831])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e417d2e-e632-11ee-afdd-a90da7624cb6;
 Tue, 19 Mar 2024 21:51:44 +0100 (CET)
Received: by mail-qt1-x831.google.com with SMTP id
 d75a77b69052e-430c41f3f89so2877631cf.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Mar 2024 13:51:44 -0700 (PDT)
Received: from [10.80.67.139] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 bw7-20020a05622a098700b00430cc9ca5ffsm3251967qtb.81.2024.03.19.13.51.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 13:51:42 -0700 (PDT)
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
X-Inumbo-ID: 7e417d2e-e632-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710881503; x=1711486303; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9ssBcy+nyWsJ8bmEaXd//Ag4IkIIyUhjb0uq6ZyMtjI=;
        b=auG+hlZPsUlqD8YibDK41xMUlbu1+VitJG8J0w2KmnldSLBxyMJuVmerjTU1WAQVV9
         aQhNkQUbxtgoPH6pWVb8mggjbtV6ZhNBxRV59IcqbCXnIil0Ox/5p5M67K+AQIG+C9mr
         vH85Sy3vNHT3jdO1kbKnNR+cnGAQZxImFZutE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710881503; x=1711486303;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ssBcy+nyWsJ8bmEaXd//Ag4IkIIyUhjb0uq6ZyMtjI=;
        b=qjeeBpDAI/fsx0olWTWIfG/nG7xj5BfrlEOdsMfeOhbcQzdqHMTRWIajW7/RZoRGRE
         xv0AqKiNrF0ZoeDFnd5xj0KIWbXMqPFB3Owc/UyX0DqN7qy9XWHYH/NJBBdA5KzQmGiX
         PJha4demosvLYPAeh0EAMSrk10JhdyYMM5HRHdNKIIhqEVb9GcfK9UfDornsZFoZv+dS
         TQUe1tyKsq8ImRY0ev20YTq4qaJgj5ceiysVrtdz3aiNU7Retl++ORc5wUhEE5A0kcZk
         j7fkq6LLuiolOeALjAzknEKt7xtFqNkxgPG+lT8Isd/1z6qFUpCkrmmVSRWGBr385eBD
         90TA==
X-Forwarded-Encrypted: i=1; AJvYcCW3A94azSVsnt6ISqlXiY51OWiUWNb9N3uqiO4ecNGAgNjm4Laif4/nkJaEui63DmZvgnYTCdgZTFYlr+dY93/dB83Xm3EvObfqiSwr1vQ=
X-Gm-Message-State: AOJu0YxSFJ7UFiOLUUjlB1c1g5mZQxp3QtLF24nv/pMCkvOQRcNA/8g4
	y74kVtudgXvecrPZsHfMEHtehO6qOeRyhlOJ8JJuesafvtmrF7zf4uzBTPz3vwk=
X-Google-Smtp-Source: AGHT+IEU/owLiZ1iXm5qel7/stcnGoWAYql2UkQey8BE6Q1zAN0tj5BvYg8+IVJBjyyhnHCn5ybDFA==
X-Received: by 2002:a05:622a:a091:b0:430:fff3:aa9f with SMTP id jv17-20020a05622aa09100b00430fff3aa9fmr307244qtb.18.1710881503130;
        Tue, 19 Mar 2024 13:51:43 -0700 (PDT)
Message-ID: <61b8e8a6-ab9d-434d-88dc-9ea4a082375b@citrix.com>
Date: Tue, 19 Mar 2024 20:51:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: increase NMI timer frequency if necessary
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <d5fd3646-18b3-4dae-8da7-6afa187f930e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <d5fd3646-18b3-4dae-8da7-6afa187f930e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/01/2024 4:55 pm, Jan Beulich wrote:
> Since the performance counters used for the NMI watchdog count non-
> halted cycles, they may count at a rate higher than cpu_khz.

Is this in theory, or observed in practice?

It is my understanding that perf counters count in P0 reference cycles,
and not at the Turbo/CBS rate.

>  Thus the
> watchdog tick may occur more frequently than invocations of the timer
> if we don't account for the ratio between nominal and maximum CPU clock
> speeds, which would be a problem in particular when "watchdog_timeout=1"
> is in effect (for high enough ratios even larger timout values may pose
> a problem).
>
> Leverage the so far display-only data we collect on newer Intel and AMD
> CPUs. On older CPUs we just have to (continue to) hope that the default
> frequency of 1 Hz is okay(-ish) to use.
>
> While adding the new variable, also move the (now adjacent) cpu_khz to
> .data.ro_after_init.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> This renders the "log" in the function names somewhat stale, but I don't
> think this strictly warrants renaming the functions right away.

I'm not comfortable with this change.  It's adding to a complicated
timing problem, rather than simplifying it.

The real problem we've got is that the NMI handler is guessing at the
timeout by counting NMIs, not by actually counting time.  There are
several ways to fix this even with the current rendezvous logic.  When
the NMI handler can actually say "if ( NOW() - last > timeout )", then
the exact frequently of NMIs becomes far less important.

~Andrew

