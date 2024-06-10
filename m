Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 160D490257A
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 17:24:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737385.1143663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGgsE-0008NO-8u; Mon, 10 Jun 2024 15:23:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737385.1143663; Mon, 10 Jun 2024 15:23:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGgsE-0008Lt-68; Mon, 10 Jun 2024 15:23:54 +0000
Received: by outflank-mailman (input) for mailman id 737385;
 Mon, 10 Jun 2024 15:23:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mjq2=NM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sGgsC-0008Ll-Gc
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 15:23:52 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7112a8de-273d-11ef-90a2-e314d9c70b13;
 Mon, 10 Jun 2024 17:23:51 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-57864327f6eso61250a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 08:23:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57aadf9e208sm7778903a12.6.2024.06.10.08.23.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jun 2024 08:23:50 -0700 (PDT)
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
X-Inumbo-ID: 7112a8de-273d-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718033031; x=1718637831; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6xCki/NpCnpA1HteArI1mb6N8AF4E1RIvQM6ewyrFxE=;
        b=fg2T/1IxkbK7BMHAlYl94Dn1Sg5GfvlZT8muK1BGcUdRpP15TPit4vmBESaCXdEAur
         nqWKvx7j/RqBoPC1dtd1+IYB1uKDi7OZEO0W8Y0GCOYk7+YZwevojTUeOC7p8XCLvml8
         DeBwJu2aydzM63DeaG7rMZGtBXxMEkXH9Oe0vzeNJQgOgR0HZI+VdyIaMUmwYoWTgELA
         93BVXNBnKt8ocSErCfy2eaK04Q5RaCSUlPaYua028ccYR11zANclTTdGyQUOZGssSpTU
         ecoPkZ5hRtH+LshZ4vgMoASu63+mxnqtDs+Bdcz7D5x8c5jQJftRjBLxwWHIqwdx38rp
         dmxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718033031; x=1718637831;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xCki/NpCnpA1HteArI1mb6N8AF4E1RIvQM6ewyrFxE=;
        b=ZN3TukUPmLoBZ1WwMTHpW0iNy1UEZcy9AWeOZPiMOfvwenAy7cDKV+Ws7uM7B+CFsN
         uWWxGA4hSM7AqlwvWJMH9T8/HMr0pskrXeYlMn+LSjuhYvcDOv5TglGnzUgI+yc/OaE5
         BYRns/HLwTCgAN27J1oxXk2xASb4xSZfLzPXZXgIM3elOj6MJGh+mPLUxKCN4pfGdtwR
         Qn/QU+SUv8iWTB51XDM8NjAsQ3kAM9QXsUng5K8DA6kqx3IH1lMVoF/FcCOgWQx9+Ha6
         XGI3K4O9G2AGzSIBpQ/WuywAM23wO3P8EZoEzmxWkqYhA9D9HX4R1/2hIzKsTe0kMK2C
         YzHg==
X-Forwarded-Encrypted: i=1; AJvYcCWzCmv/PbA03Hg8DmHMLB+KItkwFYU0Ia0ahiYMBDfXAUxKlvf5+QRA3O3mpSKyq/9nfUOWKJuLkzdWK8QHI9EQvpxlFkK9MwXiGfQuqHU=
X-Gm-Message-State: AOJu0YxhRdbBQN+uEd6oQuWm/3lqXxtCjZW+axSjGraTSlXb7FrZ0Syx
	Yjl/DJ3tSmuWT/Zrztnt69O6GMvf3x7Co5Akly4u3zkAwd9UC8rbI1xsW+kvPA==
X-Google-Smtp-Source: AGHT+IH63vYMdlfXmRkZ0J/GObvRE+suGA3ilsk4/9x9D9/rtqi+HvtVbLSY/l4sGn+nU73Fs+yMIA==
X-Received: by 2002:a50:a697:0:b0:57c:6d37:4f43 with SMTP id 4fb4d7f45d1cf-57c6d375294mr4003584a12.11.1718033031158;
        Mon, 10 Jun 2024 08:23:51 -0700 (PDT)
Message-ID: <6182c5ca-f9df-4e6e-9a3d-9e71b3619fbe@suse.com>
Date: Mon, 10 Jun 2024 17:23:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 15/16] x86/vmx: replace CONFIG_HVM with CONFIG_VMX
 in vmx.h
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
 <9a1d4a9af373ff7164c20b9774eea5249af60b01.1717410850.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <9a1d4a9af373ff7164c20b9774eea5249af60b01.1717410850.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.06.2024 13:36, Sergiy Kibrik wrote:
> As now we got a separate config option for VMX which itself depends on
> CONFIG_HVM, we need to use it to provide vmx_pi_hooks_{assign,deassign}
> stubs for case when VMX is disabled while HVM is enabled.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



