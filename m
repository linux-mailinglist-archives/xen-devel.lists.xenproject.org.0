Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F51AD565B
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 15:02:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011711.1390163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPL62-0006Cq-LL; Wed, 11 Jun 2025 13:02:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011711.1390163; Wed, 11 Jun 2025 13:02:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPL62-0006Ae-Id; Wed, 11 Jun 2025 13:02:26 +0000
Received: by outflank-mailman (input) for mailman id 1011711;
 Wed, 11 Jun 2025 13:02:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5UX=Y2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPL60-0006AY-VA
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 13:02:24 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 510c7af4-46c4-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 15:02:23 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a536ecbf6fso3064290f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 06:02:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482af3841csm9097316b3a.30.2025.06.11.06.02.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 06:02:22 -0700 (PDT)
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
X-Inumbo-ID: 510c7af4-46c4-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749646943; x=1750251743; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=L41nIti+Tlb+IzdTAmRZs4r0kBu6zBB4/SpRm2dg4T8=;
        b=GTWxnPHAFWTndE3Wq4FbEUUTw8MD5pUpnRHmhan7Y4pxZ2TrQncg6ZbJfzp+99nW1N
         wqqKjfHamrU8EUcZxNsQj9/erFlSFj90wHLkulVGcy6BYMBpsUN7Z7wmVzW2B7lIUkVv
         hBAfsaHFoiVDx9zQe4bClhYmOOiczeLCYQwlczq3kawG+GjWxPC95iregOjrksPWeiNs
         J3odFKpE2sBGLGFxGNJIQbmE7vbFkWN7esV02xfTbSRheoY3pTpku0uLsrncuGSsKb4r
         CC7P1w1vMp6sJlrbEiDzR7gs0ZqJ/41UFMGXYWZposvdEBA7cCQsCafHSrS01MHav7cZ
         3tvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646943; x=1750251743;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L41nIti+Tlb+IzdTAmRZs4r0kBu6zBB4/SpRm2dg4T8=;
        b=SDTYZOA5dQJbuLJGPs3mOutjH4qzd5An1lPpOSk2bl3it7VN1Uhi1XKo9edTfwv97I
         MV8k1YB+tt9scLQaBp7vQNnUddOZBsxwtoC/SwkIOuWVfjo/beLCM56/fvZGzIXT7TEI
         jyYSWucdPgokQhqX6WY1A3XDYe0QyoUBs12YBU5NKJrj03PInMr9f3C4Mlkt2sC7QF1j
         RwFR+leuIMWsNMr5KmIfRqf+svVflbhLM2iRcwBtB+ze5Z42TIoACN92n2mmobMl83jJ
         hoGShScsBqVchLmRrUOlvdtZyMKhpVBefutmPPn7jVmj3zNqy/PtYnYj+ZXb6C5Bk/8h
         uUuA==
X-Forwarded-Encrypted: i=1; AJvYcCVT/s0yYXpb/LO30Vjkhjbz7+8NBMixyu2n5yJPskMTDRxh/+Ab0NbuQXfjKVbsDKqy8xfiq+nI1f8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy0A9eqrPcR5luFmEcjtEs9UAPtc/Ujq1KS2IABKlkrVlh4j3i1
	zd1uQj1yB+IH7kgsSnTaBra0fS6R3euFJg7sGdF/QcHYqlXf92AiHYWhKJjkH0mcZQ==
X-Gm-Gg: ASbGncvTWFzxBIThGWdEaSWXrMgKHz959+w8+G5LdjXNSNTElts7oN86i6hyIhQI9ap
	6oLbtO6i4wycR0puQbee33sq4sMwEJGmE1VRYktLVGExGMKgzxW41B77gk4GPNUa+oNrm6PQ0lV
	UaZMXkhDB14KgO+SWUeOUYMvX7LkNGBB7CfeDREoKuxvMJuMo14bzx2P/SjOqT0Q/wNGWPvCkWM
	1QVsrmx+XbKD7+5f6i1hgKe+SQN2XnJcJ6NkvPx9x6+gjJj/jmI9c51/k8DiI7t4Vo11KVCaS1E
	m0tOXnbkUZhdgUqL0fsrZMhN8gDhBAHTlD63D/Dl2mqVm4v3eY4VVFbjm69shaCLd+sjuoi5dc7
	/HnqvUllEWga5yHnWMx3wKa4HcCHFkk1Ry4SeeMJlghLt048=
X-Google-Smtp-Source: AGHT+IHOnltg6OUBdGGtgOTcV1CKv9AAP19iVNuk+7l1jpKIo07ujaqd4vluGZQLUds8g3s89a0HyQ==
X-Received: by 2002:a5d:6101:0:b0:3a5:58a5:6a83 with SMTP id ffacd0b85a97d-3a558a56a92mr2025020f8f.13.1749646943040;
        Wed, 11 Jun 2025 06:02:23 -0700 (PDT)
Message-ID: <43725e7d-cb4c-44b7-a3e5-59d8d597c805@suse.com>
Date: Wed, 11 Jun 2025 15:02:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] xen/xsm: Add XSM_HW_PRIV
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250610225737.469690-1-jason.andryuk@amd.com>
 <20250610225737.469690-2-jason.andryuk@amd.com>
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
In-Reply-To: <20250610225737.469690-2-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.06.2025 00:57, Jason Andryuk wrote:
> Xen includes disctinct concepts of a control domain (privileged) and a
> hardware domain, but there is only a single XSM_PRIV check.  For dom0
> this is not an issue as they are one and the same.
> 
> With hyperlaunch and its build capabilities, a non-privileged hwdom and a
> privileged control domain should be possible.  Today the hwdom fails the
> XSM_PRIV checks for hardware-related hooks which it should be allowed
> access to.
> 
> Introduce XSM_HW_PRIV, and use it to mark many of the physdev_op and
> platform_op.  The hwdom is allowed access for XSM_HW_PRIV.
> 
> Make XSM_HW_PRIV a new privilege level that is given to the hardware
> domain, but is not exclusive.  The control domain can still execute
> XSM_HW_PRIV commands.  This is a little questionable since it's unclear
> how the control domain can meaningfully execute them.  But this approach
> is chosen to maintain the increasing privileges and keep control domain
> fully privileged.

I consider this conceptually wrong. "Control" aiui refers to software
(e.g. VMs or system-wide settings), but there ought to be a (pretty?)
clear boundary between control and hardware domains, imo. As to
"pretty" - should any overlap be necessary (xms_machine_memory_map()
comes to mind), such would need handling specially then, I think. At
the same time: The more of an overlap there is, the less clear it is
why the two want/need separating in the first place.

Jan

