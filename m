Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F30DB55902
	for <lists+xen-devel@lfdr.de>; Sat, 13 Sep 2025 00:15:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1122693.1466231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxC3Z-0004ur-Hx; Fri, 12 Sep 2025 22:15:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1122693.1466231; Fri, 12 Sep 2025 22:15:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxC3Z-0004sJ-EN; Fri, 12 Sep 2025 22:15:49 +0000
Received: by outflank-mailman (input) for mailman id 1122693;
 Fri, 12 Sep 2025 22:15:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yT3b=3X=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uxC3Y-0004sD-4D
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 22:15:48 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 081f2ee5-9026-11f0-9d13-b5c5bf9af7f9;
 Sat, 13 Sep 2025 00:15:47 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-45b9c35bc0aso20647165e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 12 Sep 2025 15:15:47 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e01984a62sm42414805e9.4.2025.09.12.15.15.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Sep 2025 15:15:45 -0700 (PDT)
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
X-Inumbo-ID: 081f2ee5-9026-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1757715346; x=1758320146; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fI12ki/2YG8fLNA7sjUeC6RtlTYEgW9nrZQllWkJzRg=;
        b=s9e3ARRACT+dPW+d3jE7kfpmD3CLKFiowArDJgXVRj0ysFK5rk5agVsc4OWXX3/ajj
         hvJ6uXS6oQNBEGejYFe6qE+z+m4b/NSHIFJiZVz0AOMsaQW1OT6Zpp2Ic9UAc7Jok+k1
         AR0STS8C5vzKOMb2bl+yZFAXcF0RIstp/vgAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757715346; x=1758320146;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fI12ki/2YG8fLNA7sjUeC6RtlTYEgW9nrZQllWkJzRg=;
        b=eY3rYEwKoH31Kj7giWwY9in6ytTdbI22cdhVdajNBrl6gBWaxdy97BP8l3QXcqu1dc
         EMojrPlORHGo81DDWw0hmCx8SGCQNBm5cKYQ6iYkMlQNbQO0ZGfhMO7kTVcc37Yq0UlH
         9awTh1mu535DTmc9iK4oiuoSByAUmEWc0NC64JD+vsi6JuNrByR0RxLT9QxbuqoyiOwh
         xCnXBqP0lRNWWBk55dWvoqaWD3ZXoZjc8uHMm7AhexEnDBdVz1nQZQXzlQlDO1F5mO/R
         YOcchzfanYjQiKJWbU3ab1lSR1jC7oj+uD88POlMwcemzj7C/MBGC/MyOGqjM3X7xPen
         kMZw==
X-Gm-Message-State: AOJu0YwHGNf6L5tA6E1BJmUYONK4R8uv6qAioAJzgIuSjaVbnl+UGk1V
	P2U5Lr2UWfwh27dh8CISMqEeDmrsYMyb9UKMe5igt87ulJCtzS0JLnonmNq/bGPExyR52O4bUpg
	dSiRq
X-Gm-Gg: ASbGncsGG7Z12YqTkq3KETSmPh+6mW4eEtbKJrOHoPATyPAaQg00rHVoW5S2k8Q5I2P
	IRn5X0xYJSUuoCIzOt0u7Aw+KuqP3gSOmAPqfCRgmE9f19NTJ8uekuuHygYpfo4ZQh9ChLrRTOa
	EkF2Q6AmjP/O1CbG6JYzM4aQLQEaGSnDLECXBCJXA/IzEa1ZqNelQ8PFtjGK+OqiKSE5nnnXxNY
	myom+rDcQ46Rp7eNTb7P96j05VQ+0tMouwr+IISWajy0LICc9E7GolSZ7rZ770vXgnZ/2SrnhMk
	sIvqxtUFtK62EZfZzb5x+NF5Nmry5MZRPnq7vWMtbs9dRfSqeobv1jrhMhX5z3BFLfhFG1MJ+WW
	AaUl3XmVecFvwDKmpK5pJ8vEco4CPpSKyXL49ueAaWUHGMMyBvBRLX95WFJ5ssjaoWaQ3IS+B/r
	lvuTk=
X-Google-Smtp-Source: AGHT+IHL57xbQNLyXwWa6TfY10Loe97ih3Czug1bfxrG8oZCVxEB+Nxrd6BfG/1rTMSppH5ryP9GKg==
X-Received: by 2002:a05:600c:22d4:b0:45c:b56c:4194 with SMTP id 5b1f17b1804b1-45f211ccb4emr32414765e9.2.1757715346024;
        Fri, 12 Sep 2025 15:15:46 -0700 (PDT)
Message-ID: <9d128ef7-fd18-4eed-90e9-1a0236be361b@citrix.com>
Date: Fri, 12 Sep 2025 23:15:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] x86/emul: Make condition coverage warning
 non-fatal
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <20250912144427.1905141-1-andrew.cooper3@citrix.com>
 <20250912144427.1905141-6-andrew.cooper3@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250912144427.1905141-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/09/2025 3:44 pm, Andrew Cooper wrote:
> Randconfig with GCC-14 (Debian Trixie) found:
>
>   In file included from arch/x86/x86_emulate/x86_emulate.c:11,
>                    from arch/x86/x86_emulate.c:27:
>   arch/x86/x86_emulate/x86_emulate.c: In function 'x86_emulate':
>   arch/x86/x86_emulate/private.h:482:8: error: Too many conditions (found 826); giving up coverage [-Werror=coverage-too-many-conditions]
>     482 | ({  if ( (p) ) {                                                          \
>         |        ^
>   arch/x86/x86_emulate/x86_emulate.c:1283:5: note: in expansion of macro 'generate_exception_if'
>    1283 |     generate_exception_if((mode_vif() &&
>         |     ^~~~~~~~~~~~~~~~~~~~~
>
> which is a consequence of having a new enough compiler to allow
> CONFIG_CONDITIONAL_COVERAGE in to the mix.
>
> In the short term make warning non-fatal.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Julien Grall <julien@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>
> v4:
>  * New
>
> Full failure logs:
>   https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/11331286819
> ---
>  xen/arch/x86/Makefile | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> index d7aed7d92c15..a0bba5d9085e 100644
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -98,6 +98,9 @@ $(obj)/usercopy.o: CFLAGS-y += -iquote .
>  ifneq ($(CONFIG_HVM),y)
>  $(obj)/x86_emulate.o: CFLAGS-y += -Wno-unused-label
>  endif
> +ifneq ($(CONFIG_CONDITION_COVERAGE),y)
> +$(obj)/x86_emulate.o: CFLAGS-y += $(call cc-option,$(CC),-Wno-error=coverage-too-many-conditions)
> +endif

This should be ifeq, not ifneq.  It's probably safe to drop the
cc-option too, as that limits it to compilers which know
-fcondition-coverage

~Andrew

