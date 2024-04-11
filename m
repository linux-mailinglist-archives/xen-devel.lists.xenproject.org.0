Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D35998A1417
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 14:13:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703881.1099808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rutIa-0002jX-44; Thu, 11 Apr 2024 12:13:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703881.1099808; Thu, 11 Apr 2024 12:13:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rutIa-0002hs-1I; Thu, 11 Apr 2024 12:13:00 +0000
Received: by outflank-mailman (input) for mailman id 703881;
 Thu, 11 Apr 2024 12:12:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eZ5N=LQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rutIY-0002hk-05
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 12:12:58 +0000
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [2607:f8b0:4864:20::82d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4863ee2-f7fc-11ee-b908-491648fe20b8;
 Thu, 11 Apr 2024 14:12:57 +0200 (CEST)
Received: by mail-qt1-x82d.google.com with SMTP id
 d75a77b69052e-43493745415so19761901cf.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Apr 2024 05:12:57 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 f18-20020ac81c92000000b00434f50f5d82sm831619qtl.14.2024.04.11.05.12.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Apr 2024 05:12:55 -0700 (PDT)
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
X-Inumbo-ID: d4863ee2-f7fc-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712837576; x=1713442376; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ySCRczzvMVB58WjnHUwULBNHEzdhVeYlOS/feJ5C65A=;
        b=UCU6ZK+qLAdJE0TH0m9clhEW89BiapBqHKvjFLogdxBLvNwEdo0YZSyjpOnKSmfYmd
         v9P0d6zQuiUoO/A1tBh1pfaIXk8VBjvJsGjRr/XliRWUyuLX0BAwTrZsQmYUUocxYodn
         6nxFYicySpq0AjcN8dwZoVJMVY9vVQRGoavAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712837576; x=1713442376;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ySCRczzvMVB58WjnHUwULBNHEzdhVeYlOS/feJ5C65A=;
        b=HRiyh38oHF5piTNM/ORrn2GsVRAwk749+dfFl6/zzMqNPiZdF9uTV8AGNBPiRDoSeC
         Fvz0VcUZCSN9u/3o91XsQGefrpkVZx9FOUXoZ0ayJY2N4KEYwb/OQg8OrnuFQE/9mlIG
         7DTLWTHCa1bquvOKXhyVjQGVwu6ABHMayLnUQw/yNHLFtIYY/bLAg8dEDP7qlugmpDym
         GJPliH27ihqMA+IvWebRWvZa4R8x9Oe6ZpcH+HbozstrPhE6R+ds/RPH4/QDXuRxlssz
         V7mJWEuciPZ4ReuUQ7JttNKBQZBoaZLaaZ20Yb00qGqnakBewNklrLvH6vitOvn7SA/e
         EdVA==
X-Forwarded-Encrypted: i=1; AJvYcCWmnfumxoblpIjsOF6sNmBbeGoShJoZoXU5W8OZ7zQEneK2jEtJN/ViXA0PI/XlPQZogC+G+vog7zQ88NArTb2mhuqwFPIs60h/KZFj0dQ=
X-Gm-Message-State: AOJu0YxU0jvT0xIxipzOlonqnwj86FxYE/LGaShbCL+Ir2bcc9EFw0sg
	wLJ48r8urLzYCxp9PT0mmDUAmyh8BsZpIfh6jLkcgtAVbOH4aBBkWXzSUBKqTmG/RrX75YtRtvA
	WLqg=
X-Google-Smtp-Source: AGHT+IGC8mcO+1uxmmFHV3bOEUQCiJ4TtAjB1GDT0zJSzuJ6BSxNryn1tqXkiESxqQCmYHDiPEVukg==
X-Received: by 2002:ac8:578a:0:b0:436:7b8e:677 with SMTP id v10-20020ac8578a000000b004367b8e0677mr108381qta.49.1712837575930;
        Thu, 11 Apr 2024 05:12:55 -0700 (PDT)
Message-ID: <66ef2d24-0c4f-4d35-89c3-04ffd870cc91@citrix.com>
Date: Thu, 11 Apr 2024 13:12:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] tools/misc: rework xenwatchdogd signal handling
To: leigh@solinno.co.uk, xen-devel@lists.xenproject.org
Cc: anthony.perard@citrix.com, slack@rabbit.lu
References: <20240329111056.6118-1-leigh@solinno.co.uk>
 <20240329111056.6118-3-leigh@solinno.co.uk>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240329111056.6118-3-leigh@solinno.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/03/2024 11:10 am, leigh@solinno.co.uk wrote:
> diff --git a/tools/misc/xenwatchdogd.c b/tools/misc/xenwatchdogd.c
> index 2f7c822d61..35a0df655a 100644
> --- a/tools/misc/xenwatchdogd.c
> +++ b/tools/misc/xenwatchdogd.c
> @@ -9,9 +9,11 @@
>  #include <unistd.h>
>  #include <signal.h>
>  #include <stdio.h>
> +#include <stdbool.h>
>  
>  xc_interface *h;
> -int id = 0;
> +static bool safeexit = false;
> +static bool done = false;

It's a common bug, but these need to be volatile.  Right now, ...

> @@ -90,10 +90,14 @@ int main(int argc, char **argv)
>      if (id <= 0)
>          err(EXIT_FAILURE, "xc_watchdog setup");
>  
> -    for (;;) {
> +    while (!done) {
>          sleep(s);

... the only reason this isn't an infinite loop is because the compiler
can't prove that sleep() doesn't modify the variable.  This goes wrong
in subtle and fun ways when using LTO.

I'll fix on commit.

For the record, I've taken 1-3 which are ready.  You'll need to rework 4
and later per Anthony's feedback.

~Andrew

