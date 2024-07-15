Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A29E5930FEB
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 10:37:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758735.1168186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTHCp-000874-T8; Mon, 15 Jul 2024 08:37:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758735.1168186; Mon, 15 Jul 2024 08:37:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTHCp-00084p-QO; Mon, 15 Jul 2024 08:37:11 +0000
Received: by outflank-mailman (input) for mailman id 758735;
 Mon, 15 Jul 2024 08:37:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FSyp=OP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sTHCo-00084j-Rs
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 08:37:10 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6cf671e5-4285-11ef-bbfb-fd08da9f4363;
 Mon, 15 Jul 2024 10:37:10 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2eea8ea8bb0so73026921fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jul 2024 01:37:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bc516c3sm35338505ad.286.2024.07.15.01.37.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 01:37:06 -0700 (PDT)
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
X-Inumbo-ID: 6cf671e5-4285-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721032629; x=1721637429; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1C7evJHk+L/WlisahsOiTlHIUSZyQgJDiA5zgmTs108=;
        b=MxAFNEz8zIvK7Uf4oTDKY448QngOXlcBmVahGAxqnLialkW13IoHuxO0iHqIz0sQCS
         tD4e9phntc3wOn/I75bp2ltHh4o7S6XoI9lflQAVsav/8GLX3xriQJCJoB8pWWco5C6l
         za1qGAbtW46oQhNntGn4wIOfikthvGA/FndP9ekCbG/vj1t8B1WNCAkKxuPZw7nEd6hY
         XP0Z1fZ7/T0RqNVTIRQh81bQU3wFBR0rdQ5hfrC0fBcrrUFv3D1iiImGbhkJJErEW2CB
         TdqdOkEOHK1FPQEc8/nyAhhqhV9d+TgjvaLWgT1CW96suG/ImfP9tMRwtBSfp/cBPSQH
         avIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721032629; x=1721637429;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1C7evJHk+L/WlisahsOiTlHIUSZyQgJDiA5zgmTs108=;
        b=GOXUw+9a8a1NX0iussVlHBbEc75BnNN75R+c/FV+Wx2Jqojn7LEdAC4/fWBEwvmiwO
         EAjUP9ckYM+/jzPF4A6oOXrcx20bZx4Z9dCqWdpG2SbdoeFii/x4lx+ssjp/rOMf3OW3
         /3GTFV35lB0Y1ikl0cZxz6T2HUvWrrnD/85+TB4U+jAIQuXmBbrJ0uk/zLpmJ9GSCV2K
         oqWswIWtTkWo3+oZ/PgqfTgMzwP11Ibtdypi2P/OegJpQ8du6w2AMbzVmfwhe2qabfRg
         Mw6EW3jcRJDVVOsIzhqsJ0t8X3s5/Qf+BuV5ed2g7nyrB5Lj3wEwrH+54lQqC9B+xrjZ
         14tg==
X-Forwarded-Encrypted: i=1; AJvYcCWlQo9vP1u4GdD98DsGM25JZws+m3XW4A6/IhreeVPCEo1WW/PiwCz1c5Htb6olyzcqyg5wgG86pYOwK1FJPyROFagqp4Z3NzfS8MhyM7M=
X-Gm-Message-State: AOJu0YxCaWlgF+DTWhrbqpKU22tXZJrUpDZCR22mJQDBPkXuHQPHq+RW
	vI3HswyjGcmn6W6xk/u73O/VHyRTstTix9TkjxtkX5IjMx+AffR7Ex842EX0Ow==
X-Google-Smtp-Source: AGHT+IESBr0RupiyZgx+Cg0opf413Kv3Gsdpc7qjfp/YMA7b3rPLyb06fT/ayvZ+84ltDdGhQJ4g8Q==
X-Received: by 2002:a05:651c:a09:b0:2ec:4d8a:785a with SMTP id 38308e7fff4ca-2eeb30ba739mr186443751fa.4.1721032627271;
        Mon, 15 Jul 2024 01:37:07 -0700 (PDT)
Message-ID: <4876111b-8782-4b54-ad04-0a970cc8b4e7@suse.com>
Date: Mon, 15 Jul 2024 10:36:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/8] xen/device-tree: Move Arm's setup.c bootinfo
 functions to common
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1720799925.git.oleksii.kurochko@gmail.com>
 <cb2348393294b8910d794d9d11fff28ff0e6996b.1720799926.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <cb2348393294b8910d794d9d11fff28ff0e6996b.1720799926.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.07.2024 18:22, Oleksii Kurochko wrote:> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -77,6 +77,7 @@ obj-$(CONFIG_UBSAN) += ubsan/
>  
>  obj-$(CONFIG_NEEDS_LIBELF) += libelf/
>  obj-$(CONFIG_HAS_DEVICE_TREE) += libfdt/
> +obj-$(CONFIG_HAS_DEVICE_TREE) += device-tree/
>  
>  CONF_FILE := $(if $(patsubst /%,,$(KCONFIG_CONFIG)),$(objtree)/)$(KCONFIG_CONFIG)
>  $(obj)/config.gz: $(CONF_FILE)

I think it would be nice for the bad placement of the two lib*/ entries
to not lead to further bad placements. Imo your addition wants to go
ahead of the

obj-$(CONFIG_HAS_DEVICE_TREE) += device_tree.o

line. (Eventually I expect common/device_tree.c would then also want to
move there, probably at the same time renaming it.)

Jan


