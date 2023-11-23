Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9637F6471
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 17:56:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639939.997601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6D0O-0001i1-33; Thu, 23 Nov 2023 16:56:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639939.997601; Thu, 23 Nov 2023 16:56:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6D0O-0001fT-0Q; Thu, 23 Nov 2023 16:56:44 +0000
Received: by outflank-mailman (input) for mailman id 639939;
 Thu, 23 Nov 2023 16:56:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fVVO=HE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r6D0M-0001fL-Bg
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 16:56:42 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 462d4f54-8a21-11ee-98e2-6d05b1d4d9a1;
 Thu, 23 Nov 2023 17:56:41 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-507ad511315so1441146e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 Nov 2023 08:56:41 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 df2-20020a5d5b82000000b0032fbe5b1e45sm2089010wrb.61.2023.11.23.08.56.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Nov 2023 08:56:40 -0800 (PST)
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
X-Inumbo-ID: 462d4f54-8a21-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700758601; x=1701363401; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oBNn7jJG4lYeTriQcEhM9ixI3wBPM7jvwLZzjFwo4Qw=;
        b=dpNrbG2flxAx/LBtn3VJSLiFIx2PK9Z4QpxDDVbUsqwgblr2gS7BnCHAE28wMzQ8SB
         PYL+ZbWVWGb1zY6tIdW8vZooozCevSiu/7F/ITAfO2d+Nr5kWWuLqq5H/ijpLgxd+W1i
         0CD6PEBv0zxGKkKWK07zNhDmY9/OGwAHz6l34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700758601; x=1701363401;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oBNn7jJG4lYeTriQcEhM9ixI3wBPM7jvwLZzjFwo4Qw=;
        b=NX5NqvcTA5YQU6CZjNHugrKavo5vvIUet5N1HIcFDxHMGtuUgdX2+62em24emax0dW
         As4cOO4tjFnFoeZhha4oh/2FMpo/qa3xxs2uVf2t1RdIKQkQa8693ZBBD2cAw2krQKNQ
         DyIXZLzliZyCuD4rJD2QlvLaeadPJvaIoyes43lkYuo818M1dEvOqbMzGXRtvYItteEZ
         mVDvStirKel5B9muYCA+/wBhrVmlXVynDn1TsR7+auTAWKTBEpXyJ1pDUfGEgjX7o/IZ
         Es/sj+04R1flULUOnTDtk1Vqz6bo5ktDJ0r6Jw5I2hNi36aWJv6XtLDAeeG/KLnA2OVh
         5/dw==
X-Gm-Message-State: AOJu0YyQOCREklLQYY68H7CZncIrqTDnO57acw+wKTu4I1lcckaPmJgE
	r9crWEycpDq0o7hDeOYQlUegMA==
X-Google-Smtp-Source: AGHT+IHDra7Hz48a+TBpWM1gz8ylsu4+5PO9vcpVK6bVf4J9uVQbReOeRY5jzw6Y/7UTGRwFlLEnWA==
X-Received: by 2002:ac2:4c2a:0:b0:508:269d:1342 with SMTP id u10-20020ac24c2a000000b00508269d1342mr4145311lfq.35.1700758600558;
        Thu, 23 Nov 2023 08:56:40 -0800 (PST)
Message-ID: <c4a6866d-1522-4a21-b323-52fa9c807691@citrix.com>
Date: Thu, 23 Nov 2023 16:56:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/3] livepatch: add a dummy hypercall for testing purposes
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20231123112338.14477-1-roger.pau@citrix.com>
 <20231123112338.14477-3-roger.pau@citrix.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20231123112338.14477-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/11/2023 11:23 am, Roger Pau Monne wrote:
> Introduce a dummy XEN_SYSCTL_LIVEPATCH_TEST hypercall to be used in order to
> test livepatch functionality.  The hypercall fills a value in the passed
> structure, which is returned to the caller.
>
> The xen-livepatch utility is expanded to allow calling that hypercall, and
> printing the returned value on stdout.
>
> Finally, add dummy patch that changes the returned value of the hypercall from
> 1 to 2.  Such patch can be used with livepatch-build-tools in order to generate
> a livepatch payload, that when applied to the hypervisor change the printed
> value of `xen-livepatch test`.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> The whole logic is very simple now.  I think it's enough to have a skeleton we
> can later expand.
>
> Unsure whether we should do some kind of test (with `patch -F0`) that the patch
> still applies cleanly as part of Xen build.

Thanks for looking into this.  I think one tweak towards the larger plan
might help here.

When I envisaged this originally, it was something along the lines of
test_self_modify_code() which would be called on boot after alternatives
were called, which would sanity check the result of certain simple cases.

Then, for livepatching, I was thinking of something like this:

obj-y += test_smc.o
targets-y += test_smc_alt.o

i.e. we have test_smc.c and test_smc_alt.c which are two slightly
different copies of the same thing, and we compile both but don't link
the second one in.

Then, we can diff the two C files in order to make the patch to build as
a livepatch.  This way we're not maintaining a patch committed into the
tree, which I suspect will make everyone's lives easier.  I suspect in
practice that we'll want test_smc_asm.S pairs too.

Not necessarily for now, but I was also thinking we'd have a test stage
where we know exactly what the livepatch ought to look like, so we audit
the eventual livepatch elf that it has all the expected differences
encoded, and no extraneous ones.

Finally, I was thinking that the hypercall would (re)run
test_self_modify_code().  I'm on the fence about making it part of the
livepatch infrastructure, given that the nature of the test is wider,
but I can't think of any case that we'd be wanting runtime self
modifying code (e.g. rerun alternatives after ucode load) which isn't
linked to a new livepatch to begin with.

Thoughts?

~Andrew

