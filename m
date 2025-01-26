Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC65AA1CE6E
	for <lists+xen-devel@lfdr.de>; Sun, 26 Jan 2025 21:34:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877269.1287402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tc9Kw-0002O7-Fh; Sun, 26 Jan 2025 20:34:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877269.1287402; Sun, 26 Jan 2025 20:34:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tc9Kw-0002LQ-D8; Sun, 26 Jan 2025 20:34:30 +0000
Received: by outflank-mailman (input) for mailman id 877269;
 Sun, 26 Jan 2025 20:34:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vl/L=US=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1tc9Ku-0002LI-Mc
 for xen-devel@lists.xenproject.org; Sun, 26 Jan 2025 20:34:28 +0000
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [2607:f8b0:4864:20::102a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef984a56-dc24-11ef-a0e6-8be0dac302b0;
 Sun, 26 Jan 2025 21:34:27 +0100 (CET)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-2f4409fc8fdso5711905a91.1
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jan 2025 12:34:27 -0800 (PST)
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f7ffaf8b27sm5519409a91.37.2025.01.26.12.34.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jan 2025 12:34:25 -0800 (PST)
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
X-Inumbo-ID: ef984a56-dc24-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737923666; x=1738528466; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HV0rFwm2c/DiJ3VIFDuxU64dDw12Xibjr9C6hrIuIZM=;
        b=E41ZbYGAgfvpd8ve17OwbRlNK+Je79yrbsF36aliJvhlbu/KxYEMX77AXPg0GW9Qel
         dVYWD7x9S83eOZkDQFi9KOphDXExXO61oVfpur62pUvPjh1I52JnLnIUMWQ1t/5bX8Lo
         F4rISFQX4KEJWQqmk9qPLYHT3fJyFZhD+c5iq0UoXWuoThMwpyY+azffYwzg8+iKvQ/w
         /9jVsgkqbLHr3j51plodmfzfWPkDiYqMmzNI12NmTVEcPSTt/rMeoVbB2ndO+3ydBPhb
         kca8frmoFCxcClb91YY1UoiDrOs19c925oUhxVjdtb8Zbbo5rbk1Scv+Xa3DMJOU/wq8
         rMGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737923666; x=1738528466;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HV0rFwm2c/DiJ3VIFDuxU64dDw12Xibjr9C6hrIuIZM=;
        b=w/HNB+1RoGxnQsCAXHeVPa0lcVeAtzXNM5mCXoVNNTS8FgEdzt4gZbdMI0AD9EjTnI
         1pjewo/k5HJJyy3GcOfM2jzfMTMeocmYp/OPNiOKeZHhkjealMKfcfGhLs6kY2byTGAy
         sBgYCEgZ1PtwY8dhrmeN7gpBcRqdt5lTc7/SVACsAdZAi1SjTFus/84rZtsELD2tBETR
         zDwOrW+C1j3vE7hhEijlo6p2MBsLeYq4SbNjXiMO8IiBDbPL+Y6qokRYIhPrKXu+azI2
         lwi8i/7nAa5j3IEiXsRbdhNTGwLl/h6prD9yZPB9DQOUiZMp8/qSpt/6NpAmTE2zFRoe
         +ujw==
X-Forwarded-Encrypted: i=1; AJvYcCW35okzgSlQLFqJMSLHts+9pug7IErstLVXchTjSxFhwou7RbdhcAoUPDbHEJiO64zLglm+tAlWZIE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwyIfuTsin4j02GP67GjWin2jFPGk/MoQdFKui4tYnGim+2x13M
	XvnS5t4C1jP45mwhYODtrUZ7Fz7o0a1SrP8WeeOVjJQes7KBzE9XYwx8/lUGiZk=
X-Gm-Gg: ASbGncteZ0atWMeAABv3YyX/qrvDCifOQc9WcYO4WG9tSjNse70TE26M7H7dmz8xeMx
	0FrtMlj7Y3wXa6cl3+rhhcwR2QJL6GZ/rvnciuugzMAnvWqogt9ve/NfT85Zzkc2uqc3MxB7UB9
	6UeO8vBwwYwu7N601ufrxdJU4OR2znTWXn6m8UkKwBB0b3YtZd9A+ltTbuKgaA/Z2NJErqILKA0
	deEGnQRXgI0fHUayXJTtqZdZoeYHOGyuPsBs7T5tXbXpBl6Mi9FLb0wabY+FEWc5/r2d9rcqfY3
	YgOueSGXgs3zRoaDp/YFQToXwxi/ooFS7lHEh7/8WPr62/M=
X-Google-Smtp-Source: AGHT+IEnuvCpks4R8m2CWUAxXqy7OUK3I7qmzF32T6Ls9afPXbIvlOOo7wFmoCIeuE1afURwxObJ8g==
X-Received: by 2002:a17:90b:5488:b0:2ee:7e53:bfae with SMTP id 98e67ed59e1d1-2f7f177c6b3mr23097382a91.10.1737923666307;
        Sun, 26 Jan 2025 12:34:26 -0800 (PST)
Message-ID: <2641e9da-db13-490e-9bae-64ecde1f9352@linaro.org>
Date: Sun, 26 Jan 2025 12:34:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/20] accel/tcg: Restrict 'icount_align_option' global to
 TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-10-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/23/25 15:44, Philippe Mathieu-Daudé wrote:
> Since commit 740b1759734 ("cpu-timers, icount: new modules")
> we don't need to expose icount_align_option to all the
> system code, we can restrict it to TCG. Since it is used as
> a boolean, declare it as 'bool' type.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   accel/tcg/internal-common.h | 2 ++
>   include/system/cpus.h       | 2 --
>   accel/tcg/icount-common.c   | 2 ++
>   system/globals.c            | 1 -
>   4 files changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

