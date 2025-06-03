Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10206ACC8E3
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 16:16:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004532.1384261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMSRK-0000Wb-Jx; Tue, 03 Jun 2025 14:16:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004532.1384261; Tue, 03 Jun 2025 14:16:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMSRK-0000Ts-Gg; Tue, 03 Jun 2025 14:16:30 +0000
Received: by outflank-mailman (input) for mailman id 1004532;
 Tue, 03 Jun 2025 14:16:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pD2F=YS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uMSRJ-0000Tl-Lv
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 14:16:29 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54b5a63d-4085-11f0-b894-0df219b8e170;
 Tue, 03 Jun 2025 16:16:24 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-441d437cfaaso39139075e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Jun 2025 07:16:27 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4efe6c842sm18186772f8f.29.2025.06.03.07.16.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jun 2025 07:16:26 -0700 (PDT)
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
X-Inumbo-ID: 54b5a63d-4085-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748960187; x=1749564987; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yw0+f7BJLdAUZiURTz5Gc9U5JJQs3FyRngWcjGXPPFc=;
        b=mkFD9tTG6wGgiwqBvh+wgWHcEasCMkORznLkE8xVeuLSiWAdIuuQRWTvJxIoQVZQ7W
         m769U/cboETXRbJ5lNoKE/f4aONc6R22ynGzG80N5yR8yIxTEi/4TxwNnrOSzeeKxzJO
         lZrwXemQ00uoR4WNsaYr04b178/1VMSUwzeCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748960187; x=1749564987;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yw0+f7BJLdAUZiURTz5Gc9U5JJQs3FyRngWcjGXPPFc=;
        b=AfekpoooQ6NKiPtAP83gzYN1Fx7f9yF70UCzkx++y5XBINyhMqALuZcnHlyQ5/1XX+
         gpNq5bbEF2rijXbWtEyPQ+uGk+WqVnb7baeC/WlptyK/ScuDHC5Bbds1kNmlY1NAmPaW
         +kJX3RM7kR6dWR5r5Uou6yDq7+DLca+ks1hVSkVtyuvJJgnleyCqJaM9fJifLsEQ9D3Y
         S7LEvRQlaA3vhPd9KfIGe5EmHO/2GW3mo9FeXjbiFd9wKBr+K1dTmW9McKPhCDLBVXhc
         pfyo0Ry/eWr7WzmZLgNaVJUaZPr9fJtsDTuuHRWpaa1TRIH83QKNteMrnbLMaDNdRwHB
         QtyQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7qDKnLdesS0fMSTh6rtQiC0L6k7SqCF05hpiMFCA/xg+N7RHKp/SRnKsM4OC9c/wwIquX8GT37+Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxv2xXctHDnfbX1EJyVW8BsPhEPETLwnF7e4gVeOB1IAiKoE/V8
	LmSu3w0cDSXtc3SF6in9JaGePGj88ofUFY7rkcEP+TUycpyVbCpd+td6Z2UVdV24WYk=
X-Gm-Gg: ASbGncvrMwZsyXLLkHzm7vYkzaMdwlu4ZxqMgLJz1lhcEHmMXAsUWLTX4zR6pGH242X
	gkODP/R7jDhy6sAMdazuSW/aEiijTEGylHZS2g8DNKaiimRElLjxLIiV27P+nEKhKC1+ewysem4
	wbp/sn4L8B6NwhCTu0hp388HMnulel5i6wMWM4WEldd/g5P5xVpf90N50smE6hnERZlqDbjW3uY
	CvV8KEAiBOm7DpLyFE4/tJC9Y8KLN5EqYD9ltGLzz2Z7VsVOdbISTJN2UVwjzw8kFryZTR3vFJO
	wrjWHtp261hTB/C5UC55iQ72MIxkyawiE1Vul9UFK9wJ8jDjYXwwYoNST+Jo1fENxOqugIfh28P
	w7Gnrp2gdFfzLckDd
X-Google-Smtp-Source: AGHT+IFfJRs/Szwtq4iZ0OHZqQZIThzeum1Qg6P0iWiceJcXG8t9xTQoxuJ1An7ppDKVQ3N06Jd2GQ==
X-Received: by 2002:a5d:5f8b:0:b0:3a4:e841:b236 with SMTP id ffacd0b85a97d-3a4f89ddd6fmr14482333f8f.33.1748960187029;
        Tue, 03 Jun 2025 07:16:27 -0700 (PDT)
Message-ID: <e5d562be-caad-498b-ad33-05ff126af1c9@citrix.com>
Date: Tue, 3 Jun 2025 15:16:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 9/9] CI: Add timing to junit
To: Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250603124222.52057-1-anthony@xenproject.org>
 <20250603124222.52057-10-anthony@xenproject.org>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250603124222.52057-10-anthony@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/06/2025 1:42 pm, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@vates.tech>
>
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
>  automation/scripts/run-tools-tests | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/automation/scripts/run-tools-tests b/automation/scripts/run-tools-tests
> index 852c1cfbcf..e38cc4068c 100755
> --- a/automation/scripts/run-tools-tests
> +++ b/automation/scripts/run-tools-tests
> @@ -18,9 +18,12 @@ for f in "$1"/*; do
>          continue
>      fi
>      echo "Running $f"
> -    printf '  <testcase name="%s">\n' "$f" >> "$xml_out"
> +    time_start=$EPOCHREALTIME
>      "$f" 2>&1 | tee /tmp/out
>      ret=${PIPESTATUS[0]}
> +    time_end=$EPOCHREALTIME
> +    time_test="$(bc <<<"$time_end - $time_start")"
> +    printf '  <testcase name="%s" time="%f">\n' "$f" "$time_test" >> "$xml_out"

I'd suggest $time_delta rather than $time_test.

~Andrew

