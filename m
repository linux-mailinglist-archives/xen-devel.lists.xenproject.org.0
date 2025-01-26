Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 932FDA1CEC5
	for <lists+xen-devel@lfdr.de>; Sun, 26 Jan 2025 22:19:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877343.1287493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcA21-00067O-AJ; Sun, 26 Jan 2025 21:19:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877343.1287493; Sun, 26 Jan 2025 21:19:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcA21-00064d-7L; Sun, 26 Jan 2025 21:19:01 +0000
Received: by outflank-mailman (input) for mailman id 877343;
 Sun, 26 Jan 2025 21:18:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vl/L=US=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1tcA1z-00064X-F6
 for xen-devel@lists.xenproject.org; Sun, 26 Jan 2025 21:18:59 +0000
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [2607:f8b0:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 275b1621-dc2b-11ef-a0e6-8be0dac302b0;
 Sun, 26 Jan 2025 22:18:58 +0100 (CET)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-215770613dbso45938355ad.2
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jan 2025 13:18:58 -0800 (PST)
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21da3d9db91sm50141815ad.48.2025.01.26.13.18.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jan 2025 13:18:55 -0800 (PST)
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
X-Inumbo-ID: 275b1621-dc2b-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737926337; x=1738531137; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X+G0ryUleEoZxvXmUvLzmbIUvRMHYbb2l6B2uT5mTT0=;
        b=VwkgbrmA4EwIkAPtmBRPPhmxoRb9zldGJRSoZb8mjZ1EqEEpe+J94fEFxGQno8K+8a
         2M1fghYvqPQwX0S8xQMlc93NGS37fT9TbS0+F8iQNHEoxeU0m/Y4ynFfDV9RChCy2/XP
         mXt3FE2GGzbQQ5T4duvereM7iKlEUVeKcJhqvx8DKboMIujcih59ZnaHxI9v8XA3dR5j
         UK0mfpXnWIeO4k8CTWiv/Z3QgCD745jRdFtZsVrnWwuxe6nJ4yoMOkGRWLNi/jdZ6nMd
         fatXZrYiDnjs7q60orwXcUq0bpgOMB6oH99Bbu+8YHmpvCijDm1xcGRtxupMknwXvmPl
         32AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737926337; x=1738531137;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X+G0ryUleEoZxvXmUvLzmbIUvRMHYbb2l6B2uT5mTT0=;
        b=ATvAibriCbM5XFSBydJdpnjsHhR6Ak+NuCVCDhpslBDTfeY7VrWit7meVPR98vERWF
         z6p8CgwbU35TPEffX06t4Inp4i/AHk/sY/R5QuiIOokAN9WJX583h0EiAq3u5wkc9tQ4
         mgnBgin0/gBRQFauzJuke9c9EfHM3KBSV0z+/m88bns1k/fceOvUSYGU2Mi+I84dthyt
         VRIjFPwRZUHJBf2Kw+nCrqXoNbEE5VhEg7M7CdwC1pAJQf/nJfbzGgQRlsK5RfKnGfjc
         8G4CLTsDNsBxG7AiRchnr/q/ZM05o8FitJLAdsdUlW+LpOpJZjRnkcxL3cRGDagYiL2j
         CRtA==
X-Forwarded-Encrypted: i=1; AJvYcCXmX+5/J7vLmzW35zKNQ9KTVXUGtZd5xXS6kM+SmSKYOcM3xoviG1ugMjQv4iShI2trZemO0iqruAc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwpWMnfhvJpi2mxCSL5iXc08386svriUcwbQtm3cs9YEXNd7WH+
	wxCivMEBDhU+NgTry/ASeLM5xDeZ5/nJuRqrAmJChcDfO0Oor6/inFi4mdZRGzg=
X-Gm-Gg: ASbGnct3WVEWk3bbhC4W23RJfyft8ZcE+ShMXQn6jZtWrhpGLgl99JmTHHH0sLvmeyX
	FwKj8l/jWp7/oq9D4s1ZPjzjqQ1Whycgzb0BlKZBEQV6bUW5IAf5jblOwpt73Y79v8NoKk5iCmY
	/Qppt1quF5B6dJLdC6Z53yDczyNAx+4pjoQ6hmx7rccuqbie26v+GHIaiIQUQjYpwDp+HgnbTEH
	e52fI6UJsHDY0ULzdOcoEXmC5I+1si/1aXUuPqbbveGWP3ylnaNTDBhqZwkoE/gtoFbDd6IRjjV
	3ORgoNZyDUpNekKUc2KUtdcyJrz83DNkGthcWT9UTzWp+At9aLoqkMkIPg==
X-Google-Smtp-Source: AGHT+IFqQ9SrCqtaqHBxnEeUe9wIIgiFAi160abwNWKtJLcX5dR1YlfbX/KbmypQ71AFHncXjFvVWg==
X-Received: by 2002:a17:902:db0e:b0:215:522d:72d6 with SMTP id d9443c01a7336-21c355bae02mr611350715ad.38.1737926336707;
        Sun, 26 Jan 2025 13:18:56 -0800 (PST)
Message-ID: <39ee3338-aa9b-4cdf-a06c-ab25341d3cd2@linaro.org>
Date: Sun, 26 Jan 2025 13:18:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/20] cpus: Have cpu_class_init_props() per user / system
 emulation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-18-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-18-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/23/25 15:44, Philippe Mathieu-Daudé wrote:
> Rather than maintaining a mix of system / user code for CPU
> class properties, move system properties to cpu-system.c
> and user ones to the new cpu-user.c unit.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   cpu-target.c         | 58 --------------------------------------------
>   hw/core/cpu-system.c | 40 ++++++++++++++++++++++++++++++
>   hw/core/cpu-user.c   | 27 +++++++++++++++++++++
>   hw/core/meson.build  |  5 +++-
>   4 files changed, 71 insertions(+), 59 deletions(-)
>   create mode 100644 hw/core/cpu-user.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

