Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 025DF1EB246
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 01:38:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfu0H-000704-8P; Mon, 01 Jun 2020 23:38:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zqDJ=7O=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1jfu0E-0006zR-U2
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 23:37:58 +0000
X-Inumbo-ID: ec9d4e86-a460-11ea-81bc-bc764e2007e4
Received: from mail-pj1-x1042.google.com (unknown [2607:f8b0:4864:20::1042])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec9d4e86-a460-11ea-81bc-bc764e2007e4;
 Mon, 01 Jun 2020 23:37:58 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id nm22so490606pjb.4
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2020 16:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HfFhYalJY0owExcssF2oPatU+OO5rT0/qJC/uP661lE=;
 b=D6RFiyd3vhs4PAjso9chbZyN90KGj+KGNss4NJQQ8ZtfXqYr8rob/58LqdkivyQ18S
 l8MM5DCaRgDBwmpNMqKrdYLfNRH4UDuLUbWD+FrxdZlCs7oRa7NWFLsPTWt+x02Cg+Y8
 cq/LBMagSbGn+1O9fmyA2upRrb1DRGWB3KkOBS4QZLb8bwrISwNs2qMqtQ5CMDZRh+fI
 HSymYViN4Vz251sbBkoz7+QKOmlsXmmdPwlsLYqWFEzzYkaFl1BQKctLNlp4pOMzWc6H
 lAQS+t6tOCAJf70J2cbezgmakkny+l09OEdidLQyiADzbfoocJWYEiW1gmFcQPbIpryA
 8FcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HfFhYalJY0owExcssF2oPatU+OO5rT0/qJC/uP661lE=;
 b=teh+8MQskn5fPa2yCUgAHjZi/7OQVgePvDTXjkPgkIm0aEUoxv1uGDVvR74omLUU/E
 YS9VSFuRNrG+FZNMa1CDBx5AIeSVMy0HZDjJ0eLX4xWD0YIK6OXRxPXwiV+JW4Yb56pJ
 QO7GkPAgkBh2F8TDTQ+JmXgGTZQDeOCnPYxZVix0QzZjbh4wTWXfu0wDp5ZCJykVgGU6
 KFFvCEQJkoKNl41WDoByJ2VdxhaCQsKQyGUxh9cNMcZdHgAQqvFWKHbhb8zwRPGlPZ8w
 XAiHCw1MkQDbeipINTbTuUnhLTswIvcEzOvvLFXnL2WwEhyoz2C5fXQxTFzybuA7YW9X
 wmIQ==
X-Gm-Message-State: AOAM531QTodeyuIRGUnVc/Is4Lyu64MIgpyfk4puExtwNtU14vToih03
 xYMyzbbQ9t0RectxMqQxtrSmqgormfI=
X-Google-Smtp-Source: ABdhPJwQbu/car7bKu2JAjkABhB4S+ApIJr/aipBL4QQbfu0LhpD4XGgfdkXxwi8pkIXezTuXqaYwg==
X-Received: by 2002:a17:902:bf43:: with SMTP id
 u3mr21921053pls.240.1591054677830; 
 Mon, 01 Jun 2020 16:37:57 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id h13sm444790pfk.25.2020.06.01.16.37.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 16:37:57 -0700 (PDT)
Subject: Re: [PATCH v2 8/8] target/i386/cpu: Use the IEC binary prefix
 definitions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200601142930.29408-1-f4bug@amsat.org>
 <20200601142930.29408-9-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fc1a89c0-c631-505d-f901-6a7821c74c2b@linaro.org>
Date: Mon, 1 Jun 2020 16:37:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200601142930.29408-9-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Helge Deller <deller@gmx.de>,
 Paul Durrant <paul@xen.org>, qemu-trivial@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 6/1/20 7:29 AM, Philippe Mathieu-Daudé wrote:
> IEC binary prefixes ease code review: the unit is explicit.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/i386/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


