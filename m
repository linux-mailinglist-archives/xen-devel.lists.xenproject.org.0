Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D157D85B653
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 09:59:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683316.1062789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcLxf-0007EK-Lw; Tue, 20 Feb 2024 08:58:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683316.1062789; Tue, 20 Feb 2024 08:58:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcLxf-0007Cn-JD; Tue, 20 Feb 2024 08:58:47 +0000
Received: by outflank-mailman (input) for mailman id 683316;
 Tue, 20 Feb 2024 08:58:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSgb=J5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rcLxe-0007Cf-JM
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 08:58:46 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40508ec3-cfce-11ee-98f5-efadbce2ee36;
 Tue, 20 Feb 2024 09:58:44 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3394b892691so2824714f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 00:58:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 w14-20020adfcd0e000000b0033d14c96ec1sm12607957wrm.45.2024.02.20.00.58.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 00:58:43 -0800 (PST)
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
X-Inumbo-ID: 40508ec3-cfce-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708419524; x=1709024324; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l7RgsLGIxKZjFjkm6tWwc7IiHgqfN1e9ON21bL9X0ww=;
        b=bJUsJm3TrmLnQ+2PX9b3qObviWTsAZQE1K9RtS2n3l0/HoM1fkO2fsEQFqazUOL5ew
         f7bkFi9tu3mOAsS4weItzVdsYGlsOnPKukEFkAqwMoSF5d+526lgxZOHEWy/U48wVuyx
         EfUBe2aWH2lhAKmz46U2jvAQhSwYrZCsRdBnfuvuie8cQqmzxdKTZW8VzT1lR0vFS4RX
         TxQLLuyvpVwSlop5hDjLl7wy+p8sumvRC9ujwA7tyX5hGeg5mzL97n+P0UGaxUOg5++V
         8M21Sqy165VVqVSNWBREV3FNQxTvLtrCV/6U36oV5rnrfYb2NScviC108n83u9JvJkuX
         X8Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708419524; x=1709024324;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l7RgsLGIxKZjFjkm6tWwc7IiHgqfN1e9ON21bL9X0ww=;
        b=uuqzPN6p3G7PUnAir9wkdla0hdwB3n3CmLNpV6M+GI4C/23ZVy+1xMadXYSCZgCyc3
         E2pDsVz6HktMeHTjz8I9TYzWxfWiXZ6ajn544Ae9iyrlM1k6pfsZFvh6TV97kjQrB6gc
         0KKgknmi4a7LjCBNUHTozRXOZ95Ji8O3rkYHMlyUIRgSbBteRdUag7vEQT0rgz4pcmaq
         PLNFeAxdsoKR20gL/IOIpQ63EF4AdWsgUDHWWCE+IzfzddWHei8Dnz0ZfsydB4wJPI7/
         Jnf2hgAEeO0D9nK8ecZe3WYVqSVOcLlfsnV4Yn5JuV7PQxtC9VUqb/i69Q2f17XoblFy
         7D0w==
X-Gm-Message-State: AOJu0YzB+tfyTARQynJKSkI85Jhrc8RYCxS5d8eKkbw9fU4XBLnB/B+D
	halJ5JMYhJSRKuZgL6lZy/xxT+idqsNUdKeOpll5y9W1Ev5ruL+3TpEJyu17SyfnMaM/y1h8I/4
	=
X-Google-Smtp-Source: AGHT+IFZK/acD1PwUe+3xq0lACWefO9yT1lPal999S1+H4X230qVjE7lWrG2s0Z0WPrTqgjlR727gQ==
X-Received: by 2002:a05:6000:1548:b0:33d:3c0c:ad53 with SMTP id 8-20020a056000154800b0033d3c0cad53mr7639800wry.30.1708419524067;
        Tue, 20 Feb 2024 00:58:44 -0800 (PST)
Message-ID: <80b4ca6f-a9cf-4060-a6ea-03ef61350680@suse.com>
Date: Tue, 20 Feb 2024 09:58:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/8] limit passing around of cpu_user_regs
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <e5f62a45-5b68-404d-908e-909f84f87b44@suse.com>
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
In-Reply-To: <e5f62a45-5b68-404d-908e-909f84f87b44@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.02.2024 09:51, Jan Beulich wrote:
> Unlike (synchronous) exception handlers, interrupt handlers don't normally
> have a need to know the outer context's register state. Similarly, the vast
> majority of key handlers has no need for such.
> 
> 1: serial: fake IRQ-regs context in poll handlers
> 2: keyhandler: drop regs parameter from handle_keyregs()
> 3: serial: drop serial_rx_fn's regs parameter
> 4: PV-shim: drop pv_console_rx()'s regs parameter
> 5: serial: drop serial_[rt]x_interrupt()'s regs parameter
> 6: IRQ: drop regs parameter from handler functions
> 7: x86/APIC: drop regs parameter from direct vector handler functions
> 8: consolidate do_bug_frame() / bug_fn_t
> 
> I think it is now only the lack of an ack for the 1st patch which is keeping
> this series from going in.

Actually while sending I noticed that further patch 5 still is in need
of an Arm ack.

Jan

