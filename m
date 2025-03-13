Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5931AA5F784
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 15:19:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912319.1318615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsjPV-0006Q4-Cx; Thu, 13 Mar 2025 14:19:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912319.1318615; Thu, 13 Mar 2025 14:19:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsjPV-0006NS-AN; Thu, 13 Mar 2025 14:19:45 +0000
Received: by outflank-mailman (input) for mailman id 912319;
 Thu, 13 Mar 2025 14:19:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tsjPT-0006NL-BO
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 14:19:43 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34960a37-0016-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 15:19:42 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cebe06e9eso6838285e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 07:19:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d188bb738sm21934945e9.22.2025.03.13.07.19.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 07:19:41 -0700 (PDT)
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
X-Inumbo-ID: 34960a37-0016-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741875581; x=1742480381; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=goDV6lGswItr7xQ/Z0Q0bqGFoZ86/anSRCuFIs13c+s=;
        b=f3Gz3z8xwqvlkahhLxPZqQ5djNHuZoPDG8PGsRP4f95DLwujJ5VvIKF5HPcCOkVhlc
         IF/qM/oMUfDJ0lmKf9bNND2bjyag86U6H+IUIIhUHhNeAshBgxu88pr/UILBEg/yRQz/
         AGWNIZD+gguRA6DokrWY9G1KxTSu5NONFBazWZKeA/62RO/TBZJJWbB5oZiGJqj+UxTE
         TsIRe5TcQQuOs2U40uSxhv4l87Y/keAX4XuZ2mJU2V895WKgbQUuhwPPJkxyP9sOywm3
         Bj0jmVhQNnZFrTvwAA1aOwX7rniYvsTkWLZIvshbIJrpg0RxJP0rtLZfMfxZaqL76vsb
         AJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741875581; x=1742480381;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=goDV6lGswItr7xQ/Z0Q0bqGFoZ86/anSRCuFIs13c+s=;
        b=owYA07umRsbvMRSsG3PUEin/XWunfu65YnxleW4BZorJUlAOiJj9sJ2vlXafyLS05v
         gJT3CJeXJ7A3jOo2my9XI0/rg8Tu79aQ4jghnlYGkbEwDyfea9YgwgjCgJkvV2/SGtG2
         Yi1tNo/uKS5ZEODDBx9sZX7UcY1UpdLxCVLVY4XeNYJ1AAQmGYpAjhD6GVBBfU/b6ne0
         Y4WZed2ErUqZAvPqKuvp6QmTIuRr4DOB/atERUawWr5QjkEEWinXAyZroLSCHZIxSMIk
         55VPZXHTAaO/vIlbxY1Cvaw9jVIMoUzD3Y169ICJyh2k849NSl9BJwYNcI8LJTHx3mQy
         XpFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNjg1g5OaXl7lR9huatZB77jkmB4JsdTdCMKfJTkeXNaZFjbE7sKBUZn0KrIXvyf4HTzRDqLaWOrI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzWzQdOKA8p9wpQVRURIzhnYqLOvNMrod0iDcbZqKkjcaX8f75L
	wHOD3/dNzHEdTFFPGlYJm6Rz9ZgvexLep6h/1zHhnAYAegJGPlDfbbtthnY89w==
X-Gm-Gg: ASbGncvpJEsSP+jUTIYpvLOVvrDZr4dO6rARDmf2//J2KwR/DgFuUKWsQTYVxLz5s4u
	2lu76bOnfS9w8GTRb8OI42t+t0sXVLobr6hbXyWOAlyQzrseM9bnD0PSaXPwKUsS5VSEsxofvfP
	LKgRS060LDITDetu8fTBsC4je7y3l8pi2r2de1kp7prKW2SPKb+KtnZe+lrCe2kPeMbJSi1L/72
	V80w7YYu15nsHVP4ZKTEN4u0p8Hrf9tL9FroLu4pxtsBcbFMTWYOnqXSfQwMxf43dNz8kSGrZ3K
	TLicRVxb4VJVp1BfZiTVWXYVLeQZuC/gwwW7RtVxRodQ+vWmjlGdix13TKb3jTdeEg1ejsTAMyI
	4elrZGtUS2rVDvOeJJpdTFRyBBvAUMQ==
X-Google-Smtp-Source: AGHT+IG6SFZBDXn3vrBjFmBozU4rJ0YGMfJA5qLKqvoCBBIBGlYYN/OwxnIUvfYHWfx5wZ7kcw51LA==
X-Received: by 2002:a05:600c:4f4f:b0:43d:d06:3798 with SMTP id 5b1f17b1804b1-43d0d063a25mr36143775e9.20.1741875581419;
        Thu, 13 Mar 2025 07:19:41 -0700 (PDT)
Message-ID: <b59ea14e-0bce-4c3e-b1fb-021b53af1780@suse.com>
Date: Thu, 13 Mar 2025 15:19:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] trace: convert init_trace_bufs() to constructor
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e1e556c4-ed71-41f7-acfc-b7fa866a0d3e@suse.com>
 <6ff81326-762c-46ec-a06a-254ba166433b@citrix.com>
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
In-Reply-To: <6ff81326-762c-46ec-a06a-254ba166433b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.03.2025 14:58, Andrew Cooper wrote:
> On 13/03/2025 1:38 pm, Jan Beulich wrote:
>> There's no need for each arch to invoke it directly, and there's no need
>> for having a stub either. With the present placement of the calls to
>> init_constructors() it can easily be a constructor itself.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> This has a side effect of wiring it up on RISC-V and PPC, as they
> process constructors.  It looks safe enough, but have you double checked?

I've been looking at this differently: For both it can't be right for the
function to _not_ be called. And no matter that ...

> However, the position and logic during init is nonsense, I think.
> 
> It registers a cpu notifier which only does spin_lock_init() on a
> per-cpu variable, which I think only works today because 0 is the init
> value.
> 
> alloc_trace_bufs() on the other hand has a for_each_online_cpu() loop
> because it's too late and ought to be a presmp_initcall().
> 
> Also the allocations could be NUMA-local for all but the biggest of
> servers (given the 16T upper limit because there are raw uint32_t's
> involved in the protocol).

... there's certainly further room for improvement, init_trace_bufs()
is all just "normal" code, which was already built before.

If there are missing pieces to make trace buffers fully working there,
that's no different from before the patch.

As to alloc_trace_bufs() - that has a 2nd caller, so converting to
presmp_initcall() may not buy us all that much.

> I'm tempted to ack this on the basis that it is an improvement, but a /*
> TODO this is all mad, please fix */ wouldn't go amiss either.

I understand you like adding such comments; I, however, at least
sometimes (e.g.) don't. Especially without at least outlining what
would need doing. Just saying "this is all mad" doesn't really help
very much.

Jan

