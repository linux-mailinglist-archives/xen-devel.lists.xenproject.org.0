Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CB0ACC7B6
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 15:27:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004449.1384170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMRf2-00055u-8a; Tue, 03 Jun 2025 13:26:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004449.1384170; Tue, 03 Jun 2025 13:26:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMRf2-00054D-5x; Tue, 03 Jun 2025 13:26:36 +0000
Received: by outflank-mailman (input) for mailman id 1004449;
 Tue, 03 Jun 2025 13:26:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pD2F=YS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uMRf0-000547-Nk
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 13:26:34 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e0af112-407e-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 15:26:33 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a375888197so2886433f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Jun 2025 06:26:33 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450d7fc1b60sm167304865e9.34.2025.06.03.06.26.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jun 2025 06:26:32 -0700 (PDT)
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
X-Inumbo-ID: 5e0af112-407e-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748957193; x=1749561993; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KF+yQPTvcTBTRlMsU6t+RNdnyD5G7ZHfRtKfZZnH7ks=;
        b=gKlHA/ekwwqg6qOtjpeFOL/acGv3vh4O5qvERBVg6TMoW76BIAvf01/v9UmrI0dXtJ
         bBMK8+2KIsR8ZCCHz4F9L988fH4J6e6qfG4csy7ieXOEzY2lo3TOhNltzSBV4U7VHcTM
         1HzXhfxdQ/lsd3GoZTKAQIyaI21xxV2y8HzjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748957193; x=1749561993;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KF+yQPTvcTBTRlMsU6t+RNdnyD5G7ZHfRtKfZZnH7ks=;
        b=eoDpxhilE1f2uuJRFUmU3KbU3FNsEbo0BUvuxwXNIPcI3ypKx7FagNWewooTOLoPuW
         JGl1NyojKyqCCUioqfef9ZLWnjkpkni+uWy/epnRNev3yuCOGsWA4BIcw1ya8zGAy7Eb
         wc88DZPwEfrhSOw7asxHZRvRJiklmc/QWHIFlhxwIBFF/hlcuodviZt93Xlf7/y5ctRz
         KQBA+CxmAr8GUxyOx9J+eRVfflmD2xFv9uRswFc2UpLpaL0J4Y7Vdchw98rFglqbTeSU
         T8q+a262Q9248VoeE6dWCg2SkoxQZ9bztUk8578/+NugC5aQDAIlwXk0GS1ztAn6ueqP
         mZqg==
X-Forwarded-Encrypted: i=1; AJvYcCWpe5BxVKyvMeI5fsLyyyW6hppfl2EJBCM9GVGYQFnGArc/mnFXseGVQnuKt3CeKKsYmCwauwySjik=@lists.xenproject.org
X-Gm-Message-State: AOJu0YztirKWq7GgLW9yJh+IXgke5hJiYL8NZ1qar4MNoC/G1jKRnchi
	JhIJN7qipuH3Gva8TRie3E9R2DeeTVyQUDX9nQ6T5yJ7R3WzsV87uxvJXyYWBysANxg=
X-Gm-Gg: ASbGncsx9Y5AZm5vBjlfuoRUYmkdojv1f1jc+3/2iizgbQ41ZtddlZBouERUxBfCu11
	ULNOm320qbPWxCqRGhhfxvhlugbRpAvdMApVDC4hNGkT1yN6vvEftEKF+IB8dZbuh3o88aEfksv
	YG969Ab+HmXXTa+DFEdTY28yMnOdIvNwj5SJ8hfLO5bzRasB738ES65RVm1Nlk0rWakXwI6Ch9/
	IvMT2EeWckQquVutGetvx3pGywuPdIsFkAJHGOrR9JwAlOwFtG6v/XecjaS15eBxib0OxLidVGL
	MBjEhMhyydWj2JKzd9U/bYMckfWd9SJKC5Az0PGgNORjPFQtBEz3lcX60vi4/vwfMk8N2TqHM2o
	bN4fVzl7fnOQneaCaG1kLxKJEX4M=
X-Google-Smtp-Source: AGHT+IG079AGySF/BWmgTm8Kr/NnK/R3IIpVYFTqeDETSSySJAPEXPDUFbAjLGSERQq4LNZpOLx5NQ==
X-Received: by 2002:a05:6000:2dc5:b0:3a4:d4e5:498a with SMTP id ffacd0b85a97d-3a4fe398f3emr8214427f8f.42.1748957193089;
        Tue, 03 Jun 2025 06:26:33 -0700 (PDT)
Message-ID: <d9ed8961-f0da-46d6-81da-7b98a12903ec@citrix.com>
Date: Tue, 3 Jun 2025 14:26:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 4/9] CI: Ignore run-tools-test return value
To: Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250603124222.52057-1-anthony@xenproject.org>
 <20250603124222.52057-5-anthony@xenproject.org>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250603124222.52057-5-anthony@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/06/2025 1:42 pm, Anthony PERARD wrote:
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> index 2750d24eba..046137a4a6 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -135,10 +135,11 @@ done
>      ### tests: tools-tests-pv, tools-tests-pvh
>      "tools-tests-pv"|"tools-tests-pvh")
>          retrieve_xml=1
> -        passed="test passed"
> +        passed="run-tools-test over"
>          domU_check=""
>          dom0_check="
> -/root/run-tools-tests /usr/lib/xen/tests /tmp/tests-junit.xml && echo \"${passed}\"
> +/root/run-tools-tests /usr/lib/xen/tests /tmp/tests-junit.xml ||:
> +echo \"${passed}\"
>  nc -l -p 8080 < /tmp/tests-junit.xml >/dev/null &
>  "
>          if [ "${test_variant}" = "tools-tests-pvh" ]; then

I noticed this too while hacking on XTF support.  Also of note, I'm not
sure we want to be saying done to the expect script before sending the
results.

The underlying problem is that ${passed} isn't really a pass message;
it's a done+pass message, and there is no way to say "failed" to the
expect script, leaving timeout as the only option of signalling a failure.

I don't think we want to be ignoring errors from run-tools-tests
specifically, but arranging this is hard.  You always need something at
an outer level judging whether there was a good test result.

For XTF, the way I did this was to declare that anything didn't match
"^(Success|Error|Crash|Fail).*" on the final line of the console log to
be deemed to be Crash (because it's usually an uncaught exception).

For this, the best I can think of is to have a fixed outer script which
runs "./test/script && echo $success || echo $failure".  The internal
set -e will cause most unexpected conditions to be an error.

~Andrew

