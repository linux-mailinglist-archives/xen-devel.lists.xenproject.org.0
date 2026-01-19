Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C369D3B122
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jan 2026 17:33:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208233.1520452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhsBZ-0001cw-Dh; Mon, 19 Jan 2026 16:33:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208233.1520452; Mon, 19 Jan 2026 16:33:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhsBZ-0001Zt-AN; Mon, 19 Jan 2026 16:33:01 +0000
Received: by outflank-mailman (input) for mailman id 1208233;
 Mon, 19 Jan 2026 16:33:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5NKf=7Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vhsBY-0001Zn-7q
 for xen-devel@lists.xenproject.org; Mon, 19 Jan 2026 16:33:00 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e4bf7e2-f554-11f0-9ccf-f158ae23cfc8;
 Mon, 19 Jan 2026 17:32:49 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-430f3ef2d37so3516526f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Jan 2026 08:32:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4356996cf33sm24840625f8f.25.2026.01.19.08.32.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 08:32:48 -0800 (PST)
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
X-Inumbo-ID: 7e4bf7e2-f554-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768840369; x=1769445169; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PWZtUaHgj9FkKrdCwqyUaCh/zsx6Y8epxrk+KkO6QAA=;
        b=OP3MeLkqhaYPaI6Zu/afY4oipm6RUn0wvItEUsFDkHynikdIIPGyOwd89V/Bn8jTdB
         lAh9B91XIyBPEsrT+ykBNd5y8cakLTHHOzSadKeLNx6HBp5Zbp9rpq3TUeOiuocoIuEf
         jUxkVDaS6VLfplOkLGrlPJ7uVSDzr64gJ7QLvtTgnvIn4etF32CW1LMFajAftR6JXrb7
         ertgm9bvZ6XBoIJ+C8Sp96RdsDT+KlVqeXFR/jUtONqMuaEp1P9wzvFirUseNA0EiO2g
         ZXJsndyB2Df5dA3kklfHca0H9yUFlSug7i2fWo4k3G6SpG8Eyc+EsXHShXwJtZjWSoyT
         zm/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768840369; x=1769445169;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PWZtUaHgj9FkKrdCwqyUaCh/zsx6Y8epxrk+KkO6QAA=;
        b=iroYZCMBuugoXXAFEUY80bFAbcOWZNNTaC44+GeGLFBeuphOLhpvDgDaoYcJ1mxcNG
         xG6QHbwkhpQWqy/q6pB1OAggR5eaHl2BOkpmla2duNxhxISG+ssOpO8RHpvWyP8e++v9
         BMfFL2G231gliU0LnASYtSVvBGazhRsQWfmCRe2nXWFcJhbuTmA809aykFz0sIuwmzZK
         JOM4JhVtwQlwuFUhmYj5P1mpUaF9gjC1AaxHDVlUQ0Rw2+ZLme5lrswXf0+lLe4obvEW
         stY1+ExPL4JSrlvI3r8/ZI3w8+646wkOrhsJfvnI5KYeW/OyQfqJ6VzwfDB6mGL/Eo9W
         Zj+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXKsyc0lmWgtIsUw64lkwae+a7KdpTRZLFZx/h9/+6X13+OJNVXUamArKQ64mzXcsjL3ccLg8C1juk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzn2PrmSXtJCjKyLIkJu/UsZ9QWxNizGlkgEzOqNfwmgcWmbI/F
	+UuTxl0Gn5tc6Pi9I+DXoDIguxaJMTmE2+rU1ik6llu4D9Ep2Pxd8uaJCDWTHO7FRQ==
X-Gm-Gg: AZuq6aKYMM68IHZ4GW95D+tgxCcQ5c7cAqZOJ2N9x7FqqV9GIk0EQOzNGFqknFt5h8t
	7WIgPhHy3uDG28JhrFZ2j1t23gASPhASWEh8lOW7JaXsaAu6/ZVQNK0ZKomiyZG+RpGoiAAOnPm
	RfWaDEc7L9iItrqSzOeqd18ZPwayKuXqUOKTjanNZQTITYlXqn1BsgvAoAadITriOwCb5ak83U/
	NTwIxfv41dz7tJxs0QBV2g6klRcyPlavg08fRct12serkGxmMpMkOEDFpDTk7/G35sHhJ0kOK31
	NYIJj4wCNLG69yGbibUC7Z3A9PdY7rR9cyMcpNFUoBzV4JMJAqkBQ1D14XnjfhxgvFShMIfvM/Q
	W8mx6SPasYrnphmanqvjw6cxt0hrBXFhXd/nAPYsmgeFOsIOYWg5JPIpqz2g70pabfbX3w0e3G4
	FVblTWeC9hJFCX4qsHs9Uo1KNURK+0HclnKMNAubLnvIwMx5RJRMwMdYan+H0Y4xws2d6/N0eTb
	AY=
X-Received: by 2002:a05:6000:144b:b0:430:f5dc:d34a with SMTP id ffacd0b85a97d-43569bbb0acmr17227187f8f.29.1768840368754;
        Mon, 19 Jan 2026 08:32:48 -0800 (PST)
Message-ID: <63c35c5e-577b-4346-b600-03808306177f@suse.com>
Date: Mon, 19 Jan 2026 17:32:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/console: handle multiple domains using console_io
 hypercalls
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: grygorii_strashko@epam.com, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Victor Lira <victorm.lira@amd.com>,
 andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2601131638350.6279@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <alpine.DEB.2.22.394.2601131638350.6279@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.01.2026 01:39, Stefano Stabellini wrote:
> @@ -815,6 +831,11 @@ long do_console_io(
>          if ( count > INT_MAX )
>              break;
>  
> +        d = console_get_domain();
> +        console_put_domain(d);
> +        if ( d != current->domain )
> +            return 0;

This isn't atomic (as in: in a suitably locked region) with ...

> @@ -830,7 +851,10 @@ long do_console_io(
>                  break;
>              }
>              rc += len;
> -            serial_rx_cons += len;
> +            nrspin_lock_irq(&console_lock);
> +            if ( serial_rx_cons != serial_rx_prod )
> +                serial_rx_cons += len;
> +            nrspin_unlock_irq(&console_lock);
>          }
>          break;

... this. If the focus domain changes after the check in the earlier hunk,
I think you need to also return with no input here. Or you need to acquire
the lock earlier (and then similarly in console_switch_input()), albeit
that would then mean holding it across a copy-to-guest. Which technically
is perhaps not a problem, but it leaves an uneasy feeling.

In no case may you continue the loop if the focus domain changed, or else
you potentially hand the old one input targeted at the new one.

For context: What caught my attention is the conditional inside the locked
region. This, imo, shouldn't be necessary when everything else is properly
structured.

Actually, the lock strictly needs holding now across all accesses to
serial_rx_{cons,prod}. That'll then naturally make the conditional
unnecessary.

Jan

