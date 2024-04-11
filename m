Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 131CC8A1F6C
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 21:24:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704177.1100390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rv01m-0007er-Pn; Thu, 11 Apr 2024 19:24:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704177.1100390; Thu, 11 Apr 2024 19:24:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rv01m-0007cl-MP; Thu, 11 Apr 2024 19:24:06 +0000
Received: by outflank-mailman (input) for mailman id 704177;
 Thu, 11 Apr 2024 19:24:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eZ5N=LQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rv01l-0007cf-1h
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 19:24:05 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ed42cf7-f839-11ee-b908-491648fe20b8;
 Thu, 11 Apr 2024 21:24:04 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-516d6898bebso210644e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Apr 2024 12:24:04 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 h14-20020a1709070b0e00b00a518c69c4e3sm1015200ejl.23.2024.04.11.12.24.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Apr 2024 12:24:02 -0700 (PDT)
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
X-Inumbo-ID: 0ed42cf7-f839-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712863443; x=1713468243; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XG2WtMK/5r6apS8BtDSbN/AY1cqgu30xH777apn6QFY=;
        b=DZX9aUIr10tTfhaL3RBjwXXwO8vw0ztQgYZEyr2t0ee4b5Ju5Fu2UmrA6pk2FSd78Q
         FssFCdFMnQYCLCvQQDoMJa8r5FvEGRdltIvXVJiRSEbsZ0eakgljX6hYEAv8oQ7/No/Q
         PMvdBzoCp5+xeQcO35Gfb/1ci7Yx/WNyE49FA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712863443; x=1713468243;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XG2WtMK/5r6apS8BtDSbN/AY1cqgu30xH777apn6QFY=;
        b=cqBFX90mqxg+1w//D+xHT1BOFhe59nenMO0ldkdUpWbWgvqmV8H7CX5/S0IuxIbZM1
         k24ClX18OgAYSXbqssBMrxLfKAn5/nJGWoH5lqHj6xp+VAd8PaEyYcQMNFCpvVkv97Ro
         i+FNuvTPRE4iJrBYd/AKPnprzDSEr9kaWRwII537hfjbIE9jkVlRggilXz3k7zkSjTBB
         2BuPVTu7qFIZxyPLSfAgNrORx9UkWQtOcdoO3EThE3hcZ/kp6HeXxFyzLPthsniE0Yhi
         AZBKEF0S5AqeoCbWp3xzDuOcKNwsQ3ArQXWT+osCCGK3z5pwHrt+X1NfKgCfE8o+cCqw
         cO4g==
X-Forwarded-Encrypted: i=1; AJvYcCWUifBRS5Rnf4UbFTpil04Nzw7AWUbmHQWpIEDBFnK9PULfkXAApfRrkmXoLKQ8w1dwyhfi62ZhAN5zcrO4W8KknrLgKNht7TO0i2j86hI=
X-Gm-Message-State: AOJu0YzUGk6AWEGPBhbmK9T8xluwKAF+pKkhC4yUzf7An14481dzECBn
	54DROlWJ/VknEUQ9cTrIQVWYzaoEq6TBNr3bmBkglNv3h81d6nmVHIL8XcufWro=
X-Google-Smtp-Source: AGHT+IEK3ZMXKqCmFF3z/XLguectpFMYiXrFDqPfV5Ud6uXfbFsrJnNG61NjOuqqE0kupI1Tw+QjaA==
X-Received: by 2002:ac2:5a50:0:b0:517:8ad8:c64 with SMTP id r16-20020ac25a50000000b005178ad80c64mr357412lfn.21.1712863443561;
        Thu, 11 Apr 2024 12:24:03 -0700 (PDT)
Message-ID: <360958a2-5b0d-4fbc-8637-2a33185bdd8d@citrix.com>
Date: Thu, 11 Apr 2024 20:24:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] gzip: refactor state tracking
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20240411152518.2995-1-dpsmith@apertussolutions.com>
 <20240411152518.2995-4-dpsmith@apertussolutions.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240411152518.2995-4-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/04/2024 4:25 pm, Daniel P. Smith wrote:
> diff --git a/xen/common/gzip/gunzip.c b/xen/common/gzip/gunzip.c
> index 1bcb007395ba..9b4891731b8b 100644
> --- a/xen/common/gzip/gunzip.c
> +++ b/xen/common/gzip/gunzip.c
> @@ -102,12 +109,13 @@ __init int gzip_check(char *image, unsigned long image_len)
>  
>  __init int perform_gunzip(char *output, char *image, unsigned long image_len)
>  {
> +    struct gzip_data gd;
>      int rc;

By the end of this series,

Reading symbols from xen-syms...
(gdb) p sizeof(struct gzip_data)
$1 = 2120

x86 has an 8k stack and this takes 1/4 of it.  Other bits of state are
dynamically allocated, even in inflate.c, so I'd highly recommend doing
the same for this.


Also, could I nitpick the name and request:

struct gzip_state *s;

?

~Andrew

