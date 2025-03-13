Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7827DA5F71A
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 14:58:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912279.1318586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsj4k-0007TG-94; Thu, 13 Mar 2025 13:58:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912279.1318586; Thu, 13 Mar 2025 13:58:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsj4k-0007RL-6R; Thu, 13 Mar 2025 13:58:18 +0000
Received: by outflank-mailman (input) for mailman id 912279;
 Thu, 13 Mar 2025 13:58:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2IX=WA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tsj4i-0007RE-Qa
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 13:58:16 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35ed092d-0013-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 14:58:15 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cf034d4abso8993625e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 06:58:15 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d188b12ddsm21647405e9.8.2025.03.13.06.58.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 06:58:14 -0700 (PDT)
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
X-Inumbo-ID: 35ed092d-0013-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741874295; x=1742479095; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5ENqAw/ooDKAWUJCFTq03ijJWR72T+RJ8gdQoWV47OY=;
        b=LMMVsqsJlikFoegv+KcrwE+Zo2gwpDqmsTfCCOX8SDrdavEs9hIeXLb5wlptDny7lJ
         sjtfYhNFHjFDKJBwam+ICMB4GYovVmAqz6kPjvg+dXMNioY0yPNoHEU5ICUmDDQ4b/cB
         gFw3YizlvqFTkl9CvZXu7+Dk4ZOnvBEkvp2bk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741874295; x=1742479095;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ENqAw/ooDKAWUJCFTq03ijJWR72T+RJ8gdQoWV47OY=;
        b=nFZgtTvvPiJ24K+oSuCJ/k4lhZTQrR1FAY3vNDi7EKKKDGa+JJwdKV4dKcjhFgNv3U
         fEJ+toeE+WAK83vhcUPXzIyaeAg/3cIyCjfOK33YNvNOI6pUMPaT251qSLi5NGkX9igo
         Qx+vbbsSYHF9ad1cQAGfAafNdd+0OtMow80MtksLrfGIiF6M1jpZ3nuh536M83uCjUxK
         RoEoGzzdWnYruugO32hCLE29zZrB1nOjTt3MY4zvNMTvsJWHzIQcEZArF6VnHDhgKpE7
         D125qVP8od3MtV1PNnPdWNkWgsRnuY4x48ES5HNnq2SHua9kMRFtEbLSYykySPahrJA3
         DhFw==
X-Forwarded-Encrypted: i=1; AJvYcCU+QHSmdsS5YELlOrAgld172MTG9mj/ffg7EuVexF5k8DkV5jgjK1rJYVupWr8xitai/qsvmxpNrds=@lists.xenproject.org
X-Gm-Message-State: AOJu0YywrpKNric7cWr19F6CgxLTI+XKGin5Zz3YUUFHJUb6pLIu7ZZ3
	Fubd5MED3bgrnfFJiq8kGTTMLoY2zwMt3RYXr/01XSIlZtqpAlBgSDDDZJhJnmo=
X-Gm-Gg: ASbGncsmjwYcxjrJOJ53f6OtKTLa5P0jtmKqXcRNXK5ygapNgR7QleEiGlvJUVQymeK
	bLhx2jqSBLjmZphx8DLj6restH7qyjBaQLQwWZOU38KgXssalOuQV/skDch3yd/6n8Z+Dzg2pDd
	O7eoXQ0I8SxGL9Z/B0Fk9KJgG2bdRAzbOHm+jR+PIMJvBRcryEUki3YIi6KSmeTtkk6gQYQRAZB
	W1s7BzpYnYQwVtLIZuytzWJdjKPiT26zripXA6utv30OIJduyX3u0xGiZLqCKj4UAQMhIpqUX9w
	nIWuacnlgAWyk1d7s79/lKjQwvuBkBINsySEiCH8w520IxxLf4jU2NXfAVIhbH7hnpCqzicSdHf
	2IDm5YYvi
X-Google-Smtp-Source: AGHT+IEEZcTBB/GVqJGgoFPUJJPevAdDJReyUsHw+kRBKV4/BpUfjN8s/YU0NjYGigvK4xu4xHC4Yw==
X-Received: by 2002:a05:600c:4f02:b0:43c:f87c:24d3 with SMTP id 5b1f17b1804b1-43d01c121bbmr101302695e9.20.1741874295315;
        Thu, 13 Mar 2025 06:58:15 -0700 (PDT)
Message-ID: <6ff81326-762c-46ec-a06a-254ba166433b@citrix.com>
Date: Thu, 13 Mar 2025 13:58:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] trace: convert init_trace_bufs() to constructor
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <e1e556c4-ed71-41f7-acfc-b7fa866a0d3e@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e1e556c4-ed71-41f7-acfc-b7fa866a0d3e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/03/2025 1:38 pm, Jan Beulich wrote:
> There's no need for each arch to invoke it directly, and there's no need
> for having a stub either. With the present placement of the calls to
> init_constructors() it can easily be a constructor itself.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

This has a side effect of wiring it up on RISC-V and PPC, as they
process constructors.  It looks safe enough, but have you double checked?


However, the position and logic during init is nonsense, I think.

It registers a cpu notifier which only does spin_lock_init() on a
per-cpu variable, which I think only works today because 0 is the init
value.

alloc_trace_bufs() on the other hand has a for_each_online_cpu() loop
because it's too late and ought to be a presmp_initcall().

Also the allocations could be NUMA-local for all but the biggest of
servers (given the 16T upper limit because there are raw uint32_t's
involved in the protocol).

I'm tempted to ack this on the basis that it is an improvement, but a /*
TODO this is all mad, please fix */ wouldn't go amiss either.

~Andrew

