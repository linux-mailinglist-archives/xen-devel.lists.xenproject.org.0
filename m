Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F383A91768
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 11:14:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957240.1350404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5LJe-0001bc-7i; Thu, 17 Apr 2025 09:13:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957240.1350404; Thu, 17 Apr 2025 09:13:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5LJe-0001Yp-4t; Thu, 17 Apr 2025 09:13:50 +0000
Received: by outflank-mailman (input) for mailman id 957240;
 Thu, 17 Apr 2025 09:13:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uBz4=XD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u5LJc-0001Yj-Cr
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 09:13:48 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 442a1e20-1b6c-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 11:13:46 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5e6f4b3ebe5so1095767a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 02:13:46 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acb3d126fb1sm264809266b.101.2025.04.17.02.13.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 02:13:45 -0700 (PDT)
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
X-Inumbo-ID: 442a1e20-1b6c-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744881226; x=1745486026; darn=lists.xenproject.org;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=npzCosEEGRnhf08nh9R1y1SiE+0oq0s7FdBtOiiTQG0=;
        b=MEd+/u599S3Qx+fYUssgunJ7pWK94fmFKPmJhEFMjkoEljVe+BtITV3m6oso1G+1I3
         Ut/9XAXkAwvqXmZl6ZLEq9uwnc7Zl+gD0w2R5F6S2gRSCsMO2K4Uns5vnwjHi23Wr4DU
         BLSavdrY/uTXHI78ZrvToUjuM6NTLy8lChRslKYmhVBALiLQxrBAagFZ8DgbNkvZhJax
         OPvar6q68FYqxJ6MjFLNpi3/F1nelsxpaH4m7sOYOgLODOJQkls+/HBwzgofoQpN21M7
         dyME0odhEHHnMZEg7fvVX4FInoDhmTJbtz90eO/zgThuhE63sLeI8eKccMpUIiEy68Tv
         tW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744881226; x=1745486026;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=npzCosEEGRnhf08nh9R1y1SiE+0oq0s7FdBtOiiTQG0=;
        b=PCPr6ok+KkBAOsbvvgPUDFQpNIRNYKQh9tGba4Gxv0hc/G/xH1ClRvPLZZY8yZ7zxf
         CVksE/t1bO4w2pwlvtfT+f8C8ClCxuKAfZANh/Hv+Q3NZkflAdbtr4xjlUi4EgbaX7Io
         IN9wq+CNAHqJAO7L+LYSETTtmt/vYngiTEOOfIltRLUZGdaFRiF5N5DwTsIxAhxxvspW
         O4nNb5KiNkUX8lVd+It5h9AcQjXM1V9B1f0Tm1Mr6ys5E512piBTm+MGAknUIafxh+SZ
         xiWTTBUHT1fc7X5nfaFdhtGj+qSd8CWffR+mo96vcHGQXWe/0r0hwFNCcnuxgK9IzqvZ
         CYOg==
X-Forwarded-Encrypted: i=1; AJvYcCVqu01dRJKPhVqZ8dxWdI82Hd0yv6JiWWfZJwej+NEUXWmKEU6jxx+kFNRD0ZMWqBFrLbdHvxNce1w=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz6yRZYAoDt+pBKpYw6leR1A/rfQAmV8EBdiZjuN3uQDplqusMQ
	GejOvRBqYCzy2dT9imFPMIH1knUGLOWjkfOy29XiEnGsnZoC5ttu
X-Gm-Gg: ASbGnctYzjHHmawXvIesK2b4p1YaCh5BFMi7GT/nyhfsz4+A79JMQ2mF3VZJhmXXonq
	NHmAKaARl4Zj9kr3qSutZYcQ0fOQbE8fOE95IcW3RMuUgLtHm5ba4EVbtwTy68D2uczLFyQHbYz
	1Pff08RUXEe62LpfpOo11whYJoIOYaCp+g2IwreKTVzJr6dDqI4eAe6bte18FGdIlcENA97S6mm
	lPEECc1oVSqjy7VRf0ZNysPltOiIB+BZiubLU5jgH6791jrkB5tuGo2rAVZpJTR4ss1rPRGdw5Z
	3rtB2PgvUESzAUPm3anJdTSeilJJhHOXyb3D8JgSRkYoPi0lp+Sta/yIhB5VsBpd/8+NQP7C6ru
	RxpipYOvbxkoqokZ8
X-Google-Smtp-Source: AGHT+IHqck9zSbmI6Xn//iK06K1+3IVYnzNYfka5WJ7Fr6LzZYzVcNaAS8GETJInPIPVJCbzBxgOVw==
X-Received: by 2002:a17:906:478a:b0:ac2:fd70:ddcc with SMTP id a640c23a62f3a-acb42c33a01mr413309966b.47.1744881225725;
        Thu, 17 Apr 2025 02:13:45 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------RR2yIRijnQfw4ymP64d2yRnp"
Message-ID: <187bfe40-6603-42c0-9afe-3db169c8de39@gmail.com>
Date: Thu, 17 Apr 2025 11:13:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 11/14] xen/riscv: add external interrupt handling for
 hypervisor mode
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
 <1685488b8c1b48149e94bd3625c7b46b78c72e8e.1744126720.git.oleksii.kurochko@gmail.com>
 <a8a23afe-ae62-4b88-bf53-db2e1ada164d@suse.com>
 <01fa6252-ce42-46e3-becf-ede6961aff14@gmail.com>
Content-Language: en-US
In-Reply-To: <01fa6252-ce42-46e3-becf-ede6961aff14@gmail.com>

This is a multi-part message in MIME format.
--------------RR2yIRijnQfw4ymP64d2yRnp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/17/25 10:44 AM, Oleksii Kurochko wrote:
>>> +    action = desc->action;
>>> +
>>> +    spin_unlock_irq(&desc->lock);
>>> +
>>> +#ifndef CONFIG_IRQ_HAS_MULTIPLE_ACTION
>> Stolen from Arm? What's this about?
> Yes, it is stolen from Arm. I thought that it is a generic one, but the config is defined
> inside Arm's config.h.
> Then it could be dropped now as I don't know, at the moment, the cases when it is neeeded
> to exectute several handler for an irq for RISC-V.

Probably, IOMMU may setup multiple handler for the same interrupt. I'll double check that.

~ Oleksii

--------------RR2yIRijnQfw4ymP64d2yRnp
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/17/25 10:44 AM, Oleksii Kurochko
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:01fa6252-ce42-46e3-becf-ede6961aff14@gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <blockquote type="cite"
        cite="mid:a8a23afe-ae62-4b88-bf53-db2e1ada164d@suse.com">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">+    action = desc-&gt;action;
+
+    spin_unlock_irq(&amp;desc-&gt;lock);
+
+#ifndef CONFIG_IRQ_HAS_MULTIPLE_ACTION
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Stolen from Arm? What's this about?</pre>
      </blockquote>
      <pre>Yes, it is stolen from Arm. I thought that it is a generic one, but the config is defined
inside Arm's config.h.
Then it could be dropped now as I don't know, at the moment, the cases when it is neeeded
to exectute several handler for an irq for RISC-V.</pre>
    </blockquote>
    <pre>Probably, IOMMU may setup multiple handler for the same interrupt. I'll double check that.

~ Oleksii</pre>
  </body>
</html>

--------------RR2yIRijnQfw4ymP64d2yRnp--

