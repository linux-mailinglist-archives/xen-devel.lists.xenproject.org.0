Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2098C91AA17
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 17:01:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.750183.1158439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMqcJ-0003zF-Go; Thu, 27 Jun 2024 15:00:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 750183.1158439; Thu, 27 Jun 2024 15:00:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMqcJ-0003wg-D7; Thu, 27 Jun 2024 15:00:55 +0000
Received: by outflank-mailman (input) for mailman id 750183;
 Thu, 27 Jun 2024 15:00:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sMqcH-0003wa-FN
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 15:00:53 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c20c264-3496-11ef-90a3-e314d9c70b13;
 Thu, 27 Jun 2024 17:00:52 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ed5ac077f5so26454851fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jun 2024 08:00:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-706b4a34396sm1504050b3a.143.2024.06.27.08.00.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jun 2024 08:00:51 -0700 (PDT)
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
X-Inumbo-ID: 0c20c264-3496-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719500452; x=1720105252; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9T9lhiIargU7BQQ8R4KHbS3lR+mCE9LZcP1kLLiEcAA=;
        b=AqmB6LzDT+vAcVVTMdLE5tywXsUxCf/ErcDe/2Oeh/vYPpqV7b7fM6J80cMU8U1vBb
         hVJe9AWMd9wPZ4Mg1GZfBPANLNS7sAJ9NjiXYhu2GMuGnL88poazvPx2KXZ9UZB0beET
         DjiQkX7QuzvMZHt/qnP1JZH2jqbROCXOqeeeWZxCylxEi+OyZQnFF4VDcn7UceV5Ju9k
         micfeuUHVcHkDL7iS5PZRNqAJWu3PH+tRWRBvvDAWmPjehXH+Tjs86Twq2pL9/oqx15q
         irfEBqUFs6vjU0SJuKnUIXu4ZmoTE6WsKAkm9Ju3v/iglYOu8xjjYeRYtzaHp9YR/5CB
         JtVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719500452; x=1720105252;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9T9lhiIargU7BQQ8R4KHbS3lR+mCE9LZcP1kLLiEcAA=;
        b=Jz6IoKs5uoI3bqnVLW5d0+AmbNQiYdRcIjt2Nwnt25Ccn0VSNZFd6Hpyk4tdKRIqIN
         I0gYmhwdxKMtp2FM6e4t/4Jk/k72/zZUSIoBHANkB/zY26fsDKTfFITUFW8GlsND8rZA
         vxF4anDwV1iCdKR/gkyRR2OZOM1fytkYyi2fIHJOb8Enlfwp8LzQoaE3N23WcWM99hlx
         O4VzNCA8CaHq44ssVKtfDnkLua0Hn+iS3R3CMW7IIvYOcKeIPHUh65G75O2UemMhxjXj
         Low2viDE0qwdZUqqhwYYuRF+/6+CCFx6SvYBEN3sRg7P3r2GbO+553GO8ZkNRyozttw4
         40fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNuoGQM8uQWb1WlkpatjG+90qH4CK4guZ55bQPyJGwRlL78voM+RUAGqU2yBUoJDcdHJ3OyweXwOPnGGNJzj/f/+BjrDPI7I/Oj2C44zk=
X-Gm-Message-State: AOJu0YxfeB0AcPIP/qdIYBPHPN8ZaDkTow+appjw9xzx3XbfMNZVPaGZ
	vuomh5vnJkKBkWf9YfXmCef2cxD5kPRJ3SLoZ0Y9MFg8J4ca/6/HEL0fJsXAFQ==
X-Google-Smtp-Source: AGHT+IEG6vZTUo6YAqdxo5/eYl5aq1qPisCJ7iDgpSsU/lY64fVDHLpMy23dL5K09OF3AwCZfJHiaA==
X-Received: by 2002:a2e:9e95:0:b0:2ec:50eb:d5a2 with SMTP id 38308e7fff4ca-2ec59403692mr87211311fa.29.1719500452036;
        Thu, 27 Jun 2024 08:00:52 -0700 (PDT)
Message-ID: <3689797f-c26d-4c8e-ae22-d31e0b27e8a2@suse.com>
Date: Thu, 27 Jun 2024 17:00:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19? v13 0/10] Enable build of full Xen for RISC-V
To: oleksii.kurochko@gmail.com
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1719319093.git.oleksii.kurochko@gmail.com>
 <e8ad8849f10ab8658b84ce18670549ef6314ae4e.camel@gmail.com>
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
In-Reply-To: <e8ad8849f10ab8658b84ce18670549ef6314ae4e.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.06.2024 14:08, oleksii.kurochko@gmail.com wrote:
> I saw a message in the xen-devel channel:```
> erm...  We've got a problem. 
> https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/7185148004
> very clearly failed with a panic(), but reported success out to Gitlab
> ```
> However, I couldn't determine if this is related to the patches in this
> series or to patches that were merged earlier.

I don't think that's related to the progress of this series. It is
technically related, nevertheless.

> I would like to understand what needs to be done to be sure that this
> patch series could be merged.

First of there is - afaict - still no Arm ack for patch 1. Without that
no progress is possible at all. And then there still is this vague "I
found another bug" indication by Andrew. It wouldn't feel quite right
to me to commit without this having been clarified one way or another,
albeit formally - with acks in place and the issue not raised on the
list - doing so would still be okay-ish.

Jan

