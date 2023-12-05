Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C83AE8056ED
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 15:15:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647935.1011722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAWCc-0001EG-FK; Tue, 05 Dec 2023 14:15:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647935.1011722; Tue, 05 Dec 2023 14:15:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAWCc-0001BR-C9; Tue, 05 Dec 2023 14:15:10 +0000
Received: by outflank-mailman (input) for mailman id 647935;
 Tue, 05 Dec 2023 14:15:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cmhw=HQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rAWCb-0001B8-59
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 14:15:09 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0fb99d0-9378-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 15:15:07 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40c09f5a7cfso27592705e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 06:15:07 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 r16-20020a05600c459000b00406408dc788sm22439735wmo.44.2023.12.05.06.15.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 06:15:06 -0800 (PST)
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
X-Inumbo-ID: b0fb99d0-9378-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701785706; x=1702390506; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j1opGavxz8TwcFCrwdX7Fk20nmJ0k675jB1bULHd0YU=;
        b=iSK8+PfKwhhbx6R7uo3ZDOsxngzhFeiYgWzFeP6APHOnSYki84PaHQlFUFhqkipqdR
         1bauUPtPpP4zu4LcH0fJYE2xx9omlbGewsQ0a52ih+KAGIiNyQVe6JGzp/H1jdhXv+dk
         qIElHQtUYaAJ2S4Um1UPrJLm1iqDn8jBDkevU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701785706; x=1702390506;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j1opGavxz8TwcFCrwdX7Fk20nmJ0k675jB1bULHd0YU=;
        b=pMqF0bbNZXW/n36zV6Wscbp8pA9SsQZktJrCMnl4249tB5DIJWAxZK4F149NE8YKhG
         huc3dM9VM708NIPIhFN7tEIxkBJ/yX4/xYKbvv8WkLBaDTRvGkIWtK8pC7rKQOKzXP4e
         q9G2yINx5Xj4nFEbFnkkI02IzWJISW7RwkihJNZOwC28A7pReoMsSsWGhravhyziiBfp
         iGE21KuYcaSi/BPqb7jkDKh+dCHvGyzJHtjZmj5YOCxlKPRXFutQZ+yckHenfvlrXiLn
         k4d6Ut5yx0qiY/5pFuKS20EcsdaYdA1PVVApq0aJqkdmXbif6+g7n6bvudb8hVfD3uns
         XSgA==
X-Gm-Message-State: AOJu0YyVgyQ4GUjOSj5hGJxY6pEuUfmyY/sDJX/XCRhsaekQ3IiCajvj
	/9Te+RqWkBVxExm0B6Ynozwx/A==
X-Google-Smtp-Source: AGHT+IHM+00yicD+N5cglAkjvSLSskOrQO7fT08yP+V8r5XCE5tNVJUch783fcZqc9g/lplrMFAj4A==
X-Received: by 2002:a05:600c:230a:b0:40b:5e59:e9e9 with SMTP id 10-20020a05600c230a00b0040b5e59e9e9mr494713wmo.136.1701785706605;
        Tue, 05 Dec 2023 06:15:06 -0800 (PST)
Message-ID: <824c50c3-ad3f-4d97-a3e8-5343564cbde5@citrix.com>
Date: Tue, 5 Dec 2023 14:15:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] livepatch-build-tools: allow livepatching version.c
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20231205123403.63813-1-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20231205123403.63813-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/12/2023 12:34 pm, Roger Pau Monne wrote:
> Currently version.o is explicitly ignored as the file would change as a result
> of the orignal and the patched build having possibly different dates and
> times.
>
> Fix such difference by exporting the date and time from the build script, so
> that both builds share the same build time.  This allows checking for changes
> in version.c, since the rest of fields need to be manually changed in order to
> produce different output.
>
> Setting XEN_BUILD_{DATE,TIME} as an environment variable has been supported
> since before livepatch support was added to Xen, so it's safe to export those
> variables unconditionally.
>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  livepatch-build | 4 ++++
>  livepatch-gcc   | 2 --
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/livepatch-build b/livepatch-build
> index e2ccce4f7fd7..f622683fc56c 100755
> --- a/livepatch-build
> +++ b/livepatch-build
> @@ -417,6 +417,10 @@ if [ "${SKIP}" != "build" ]; then
>  
>      export CROSS_COMPILE="${TOOLSDIR}/livepatch-gcc "
>  
> +    # Force same date and time to prevent unwanted changes in version.c
> +    export XEN_BUILD_DATE=`LC_ALL=C date`
> +    export XEN_BUILD_TIME=`LC_ALL=C date +%T`

Date is the one that goes wrong every time, but everything else in
compile.h can go wrong in a way that causes version.o to change.

Ideally, the pristine source for building livepatches would include a
generated compile.h, and livepatch would have a way to force no
regeneration of the header.  But I've got no idea how nice that would be
to arrange.

That way, you're using the same details as the Xen being patched, rather
than hoping that two identical different details will cancel out in the
binary diff.

> +
>      echo "Perform full initial build with ${CPUS} CPU(s)..."
>      build_full
>  
> diff --git a/livepatch-gcc b/livepatch-gcc
> index fcad80551aa0..e4cb6fb59029 100755
> --- a/livepatch-gcc
> +++ b/livepatch-gcc
> @@ -33,7 +33,6 @@ if [[ "$TOOLCHAINCMD" =~ $GCC_RE ]] ; then
>              obj=$2
>              [[ $2 = */.tmp_*.o ]] && obj=${2/.tmp_/}
>              case "$(basename $obj)" in
> -            version.o|\
>              debug.o|\
>              check.o|\

Tangential question.  check.o is excluded because it's a toolchain test,
but any idea what debug.o is doing in this list?

It can't possibly be the debug.c I've recently added to x86 (which we'll
want to be able to livepatch), so I guess it's got something to do the
ARM debug.S's, but I can't see anything in those that are worthy of
exemption either...

~Andrew

