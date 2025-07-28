Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2101CB1442C
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 00:03:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061972.1427582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugVwJ-0000N7-O3; Mon, 28 Jul 2025 22:03:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061972.1427582; Mon, 28 Jul 2025 22:03:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugVwJ-0000L0-LA; Mon, 28 Jul 2025 22:03:23 +0000
Received: by outflank-mailman (input) for mailman id 1061972;
 Mon, 28 Jul 2025 22:03:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LT6m=2J=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1ugVwI-0000Ku-8P
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 22:03:22 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa80e92c-6bfe-11f0-a31e-13f23c93f187;
 Tue, 29 Jul 2025 00:03:17 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3b78bca0890so648490f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 15:03:17 -0700 (PDT)
Received: from [192.168.69.209] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4587ac76b92sm109791715e9.32.2025.07.28.15.03.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 15:03:16 -0700 (PDT)
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
X-Inumbo-ID: aa80e92c-6bfe-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753740197; x=1754344997; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RNIcMWrT77lRSI5yJdux4FBr4DfzeqIMHH1qpDmp+PU=;
        b=ec8ZVsdYoX0/nX+r6TFyND/kXiGGvBbFtiMS/2NSIssxQg4r7K4QAWm7xgtcrbmWBF
         3A752yCnaSl9Z0qIog7Fe5733cT1uYiJg/acnsB7xV3paBcacRc5sMPtfx1TgVwrfBh7
         bstBIEQ2P1/VdeixmISS1q3XeITrjMdYtjwcEtVJ2YjGJKj3OD0LbvEeUuqKhJqG0MN/
         +XJH7wSV0yRYTJrdeT4mhfDXQ11sx4hNeunS4Gmwtb8LpnsW7eZhNN+ykBmtSNoIhRiS
         u+F7+Y2fopTczY00cWvmpeZT1/f9i7nzVYwYBeaaTEWNcat4U2hNuqeupIaz3DJWfdp8
         Zsig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753740197; x=1754344997;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RNIcMWrT77lRSI5yJdux4FBr4DfzeqIMHH1qpDmp+PU=;
        b=jNQoYSWir38GZlPLIqgBOBn9vTcI+0Irygj1dkGXhLfuUgNPJN3zK9iHdcm2jBwgnD
         ElphPBobdBB95KdvUNbDn8PA4TlPVdSZR/8bpkPxX9v6jREUNgboj9HcHTZAkpS7TibC
         +xjmmX8yNW7E62vb11ykzg5cWk2Yn+IfhBtgtHo4DcOnbt+tW4hJIQz9LuyV3nmfp5ci
         53oc1E9I/X4I/C2JmemO2Qz5yr9W73ij8WS5BrOph0ARNxMu3jYfhlatVl460mKxJnsT
         kMs9+9zXY7CSNkIWfUSE9Kn/ywfmilxb9WVwh8OSFiG1nS+remjx1V0SQGrzZ3HbJgLv
         wPBA==
X-Forwarded-Encrypted: i=1; AJvYcCUMe+S5ayIlRgTuhRd3P0SpesdwdbRxW+qpBCQ/TVqd0BcpFt6yQIsR5nV+iCsoUXiT55JEPq1KKTk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyDChjiu5NPt8VunuJY4T9q/IHE0geX7e8PVB+Fltz/hnyFaDDP
	1m/p0tvcX1eD9cpKc63eAy86luTOT6PlyDjEJ/bwxnvTMzhuVI0cuqtMwvnxU/3VNvw=
X-Gm-Gg: ASbGncu88tUE8urd4oDy7uVsXZ5kUMzx7oAWoTBlwdSUqJtUYcxjbrtorDIWyd8dfLm
	BBjPUKEQCQg6cLVBjp7Ka5KgIGkh6R3KoQ9ZRnBO1CCryM+TJt+gqyYaqKj0G9wg3AN/EpLK7Xc
	SBLeDxFiXDyqnj8v7IGezJ89vv2HpqQL7aTAcQDHUEUkXXZXCqwZGS1ij5jmSUJEOnP+6i77I9t
	EB2vM8lvl8YaKvaP84Y/WtY56VMdPDnGaDz4masuW2QeUNeUe4KqmZqkp70zBFhZYhKrbZJ1Znf
	sFzU9lYusjnaNeiSjDtkGBXPN8zNjX0S1cjWApckMMnfEt2RGGWfifbTZKugXBISMOQYhD79Vf8
	ytSuF7IWPGieQ3/w6Q4TxGOo2Hm/CUaU+1ZBtGx0+TQi1lgbUpDNMVzHnrLgTTjgccg==
X-Google-Smtp-Source: AGHT+IFXbprBq/nqvVOgW0TQZTcZxJT6uBqAu5FR/QXzaf3Ftm6UCd9ha+8+mUgcBdzxbAhoHz4Dow==
X-Received: by 2002:a05:600c:1da8:b0:450:d386:1afb with SMTP id 5b1f17b1804b1-4587d83d6a0mr86970465e9.9.1753740196915;
        Mon, 28 Jul 2025 15:03:16 -0700 (PDT)
Message-ID: <09452c14-9ca6-4e7e-9a57-a71e6c24c84b@linaro.org>
Date: Tue, 29 Jul 2025 00:03:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/passthrough: add missing error-report include
To: Adam Williamson <awilliam@redhat.com>, qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Anthony PERARD <anthony@xenproject.org>
References: <20250717220207.171040-1-awilliam@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250717220207.171040-1-awilliam@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/7/25 00:02, Adam Williamson wrote:
> In cfcacba an `error_report` was added to this file, but the
> corresponding include of `qemu/error-report.h` was missed. This
> only becomes apparent when building against Xen 4.20+.
> 
> Signed-off-by: Adam Williamson <awilliam@redhat.com>
> ---
>   hw/xen/xen_pt.c | 1 +
>   1 file changed, 1 insertion(+)

Patch queued, thanks!

