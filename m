Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4928832DAA
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jan 2024 18:05:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669114.1041741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQsID-00040o-9Y; Fri, 19 Jan 2024 17:04:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669114.1041741; Fri, 19 Jan 2024 17:04:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQsID-0003yP-6o; Fri, 19 Jan 2024 17:04:33 +0000
Received: by outflank-mailman (input) for mailman id 669114;
 Fri, 19 Jan 2024 17:04:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B1jB=I5=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rQsIC-0003yJ-Gs
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2024 17:04:32 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d012a064-b6ec-11ee-98f2-6d05b1d4d9a1;
 Fri, 19 Jan 2024 18:04:31 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-337d58942c9so964365f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jan 2024 09:04:31 -0800 (PST)
Received: from [192.168.1.67] ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 o9-20020adfe809000000b00337bf81e06bsm6914635wrm.48.2024.01.19.09.04.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jan 2024 09:04:30 -0800 (PST)
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
X-Inumbo-ID: d012a064-b6ec-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705683871; x=1706288671; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qc2Peb2JtOjy+B1gVthMdZe/szYQ6eQYqtZctt3o1nc=;
        b=tTWv+xfwfZ16ZUYt2N+sMu17QR1eaEgER9YRD59nXJsxYyqZksT9U8fXDQ/YNh5f8A
         MXT9QTvsAAEyWkfrmP2Z4giHy1pBOHIgZD3AWah6Egl01Mvan2l2UIipbQaAXEbhMB4Q
         d4nN9EemVf4REkLjgCYny0XcVPvCKH9ZrOu24RmDAYYag9zycvKQ9Kya+DJUFMrmEK8I
         fxzkykB6+SkMTLoKikbP6TQu+zWby96DsI/VZBel83bBlqKuGJls7cQ0LUxioOyzisvZ
         BdArHC+A9M3k4Z35eOm3xB7Jq1TCN/c8Y/bxm/b3Fw43qAPrAMvsU0ZKC97v/7f/SVKE
         8axw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705683871; x=1706288671;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qc2Peb2JtOjy+B1gVthMdZe/szYQ6eQYqtZctt3o1nc=;
        b=hIjV77D6Ajez3CMoR9j9fXZpsA6IoFfC9+4QTJTT0wz5LayNO/12YQ7vKdULWTsQ7e
         koNxc6Aw8nQq6N5lbkMhB5KY//lL0VoTTyG+QaWmL7Ig7KqHWdd6hSKqmiUpLpgsfvKu
         atFwAUesukyqNY45bBQxFYfIFX1y05qF9Vi4sKa8qyx9Ev1RfTZlVrKauMQgPZDU+97/
         aVoHAm89OFQElrZZXN81ZceIJvsLyfAOCWeQvx/XknvxyChmUbqHXIQGJlU3sBF+QSy+
         ulBWzUHXfPc6TNzaAadLdjpOxNfmt9+M7FhjyO48hzwXkeOSvfhmoJdxYLZHelftkE6u
         /w0g==
X-Gm-Message-State: AOJu0YwEXi9dYlqF+yoDenVLER95x7VzRe3nDlfQ4sF4ICU2FdEpIrGR
	DEECCL8Wylxngm/cTlT45tB0Crk258P9A+u/pb9/Q3A2i1iy96W/QdRUHI3ERg0=
X-Google-Smtp-Source: AGHT+IEDul5qUywMEJN+jSpZ6HXwnoasyUWK6xBsr0YM5aaNwbaNPCRkpy+8DrtQEvcE2bjVbOg8uw==
X-Received: by 2002:a5d:654d:0:b0:337:a7fb:90d6 with SMTP id z13-20020a5d654d000000b00337a7fb90d6mr5721wrv.79.1705683871090;
        Fri, 19 Jan 2024 09:04:31 -0800 (PST)
Message-ID: <e25f2ede-1264-4c74-bc10-df7d9f874d47@linaro.org>
Date: Fri, 19 Jan 2024 18:04:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] hw/xen: convert stderr prints to error/warn
 reports
Content-Language: en-US
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1705670342.git.manos.pitsidianakis@linaro.org>
 <bf5504369023dc115f0d7a756c4c5254fa9cd10d.1705670342.git.manos.pitsidianakis@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <bf5504369023dc115f0d7a756c4c5254fa9cd10d.1705670342.git.manos.pitsidianakis@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/1/24 14:24, Manos Pitsidianakis wrote:
> According to the QEMU Coding Style document:
> 
>> Do not use printf(), fprintf() or monitor_printf(). Instead, use
>> error_report() or error_vreport() from error-report.h. This ensures the
>> error is reported in the right place (current monitor or stderr), and in
>> a uniform format.
>> Use error_printf() & friends to print additional information.
> 
> This commit changes fprintfs that report warnings and errors to the
> appropriate report functions.
> 
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> ---
>   hw/xen/xen-hvm-common.c | 12 ++++++------
>   hw/xen/xen-mapcache.c   |  5 ++---
>   2 files changed, 8 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


