Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2452FA72A55
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 08:01:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928466.1331163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txhEc-0000yA-QT; Thu, 27 Mar 2025 07:01:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928466.1331163; Thu, 27 Mar 2025 07:01:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txhEc-0000vz-Mm; Thu, 27 Mar 2025 07:01:02 +0000
Received: by outflank-mailman (input) for mailman id 928466;
 Thu, 27 Mar 2025 07:01:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txhEb-0000uK-Fi
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 07:01:01 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3adb06ba-0ad9-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 08:00:56 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43cfecdd8b2so4942115e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 00:00:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39ad32bd464sm913643f8f.57.2025.03.27.00.00.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 00:00:55 -0700 (PDT)
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
X-Inumbo-ID: 3adb06ba-0ad9-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743058855; x=1743663655; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XY4rEhZouz/dD6J0mIF2iPA4hRefnA7gvZJbvlUOxO8=;
        b=eMHPoGBnzBoau2WO15mmAqnoz3sF0Za3tfMj18oAHKlOxCC+tTq9EAjRYCIj9RjoSL
         XqqCAZ9+oW3BO3sLEckwBmtdd06VUCu8sSYfoNCE3C/TghefMApt7bODilOYf/ZIEkMg
         4/Fk0SA0b+VTD9+b3TRnKAQfbLePdyOtcogtQxRMv3+n7ETdnf87FRws3Wurjgf6WHsB
         oSb+NEtrsgLtzjCFL5tF7YEcv3q7C2s8F/xAQ0ODUIg1VxeQ6KN4vyyHMT6DiZYAQwrF
         tdbY2ZQ8Sp6CE0NVej5TtKSsWXZONPOioXfllrZv+KBBtSjtX2Id3C9IhekTBJl4n+aI
         XYig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743058855; x=1743663655;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XY4rEhZouz/dD6J0mIF2iPA4hRefnA7gvZJbvlUOxO8=;
        b=UkrNiDXs+Zb6Ddv9MbKQFE9Gnx+1jZvthDNO5xmrxX89muoy3KubwoEV1rSiBJb6cw
         1ui/x1F0I7rcMyb656lGMofYFFUETwRjVswjE7rpo9CAzeyVzWiR/GTWU8x1AhN84dWe
         mqrSvCQL/xHWTc/SGf3u7L/30h+lTC6LTz89vnm2hg2XchHXvH+vOa1q59aZrp3+f+8r
         7UshLmvMq/JvAw0I4wIb8nw8Z5j9Hwf5O+im/m9LoTRZAcWkzKIAfSNGuMV7uWKiuSDB
         gQBfo4QPML759qAPjBjcf4+zVwBhqRTO3ixiqIvwphdJHAQMFiWRzz3eBY11/X6w/kEH
         vmCw==
X-Forwarded-Encrypted: i=1; AJvYcCUFufa5eA9wYLUeZcLP12cYq1daG5AGWlosLBm/zBWcHRVzactdLrVGqx4l8Ur7hSxWExJL7+Ifyi4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwcN+BqbaFiNsyjH3ieP2xjDOoOHJ1jjErWLNWq7xvGMtgAx0M3
	5Yzpy/RLOMYvZwHM7xypazj4VR6jIk7Y63aGQgB6prv7lEWNksqaqT+mJzIJeg==
X-Gm-Gg: ASbGncuwdKuMmS0yccDuZRCPE9YqSgLvifnP0E6hC/2PWPTfXuToauH69HlytdHTiLz
	N0tyv8EVthioybRAVMMZMKeYGM5yuj6jYzCm8CxAiYPTU1utCCGcWwYPyEs/UwdCu3Lk2EmKXaY
	CwsYADzeLbY+vQgslwHm9uy7RAU0Q1pcNGpCrH3hN1Bd6mlACferwG0cqZqRFu5RnXXV7lbro22
	Eg1jq5sZlGs2f5DQjh9AaxId8DNKwA/JbXFAcZmlBsQl3+b54902p/1YCwkZFwD/r0pUQRlIahH
	RLYNOiMiURtyJUwMU+ADMtEu/DzvImB44IzrttMz3SQsl0tboU+Q0lwOy2GMEbJtAqVCoi6u0hf
	Om6x0XfBkWh6nPio82yq4HbUvy/zp2A==
X-Google-Smtp-Source: AGHT+IHRq7CENvM/8EW7kDIQNhNfqxhPsWSzWsIQVdOrVOHlYaUFDgj89N78I2z6uLUMjbymUuhUJw==
X-Received: by 2002:a05:600c:1c28:b0:43d:2230:300f with SMTP id 5b1f17b1804b1-43d84e67696mr22925735e9.0.1743058855490;
        Thu, 27 Mar 2025 00:00:55 -0700 (PDT)
Message-ID: <ee9d3fb9-d3b3-49e1-8a2e-83990a3fc7c5@suse.com>
Date: Thu, 27 Mar 2025 08:00:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] docs: remove qemu-traditional support from
 documentation
To: Juergen Gross <jgross@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250326160442.19706-1-jgross@suse.com>
 <20250326160442.19706-3-jgross@suse.com>
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
In-Reply-To: <20250326160442.19706-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.03.2025 17:04, Juergen Gross wrote:
> @@ -1903,10 +1894,7 @@ it may be useful to request a different one, like UEFI.
>  
>  =item B<rombios>
>  
> -Loads ROMBIOS, a 16-bit x86 compatible BIOS. This is used by default
> -when B<device_model_version=qemu-xen-traditional>. This is the only BIOS
> -option supported when B<device_model_version=qemu-xen-traditional>. This is
> -the BIOS used by all previous Xen versions.
> +Loads ROMBIOS, a 16-bit x86 compatible BIOS.

Is this doc (and the option itself) still useful without qemut? qemuu doesn't
use it, I don't think?

> @@ -74,7 +71,6 @@ ov=4.0
>  Ensure references to qemu trees and Mini-OS in xen.git's Config.mk are updated.
>  The variables and there content should be:
>    * QEMU_UPSTREAM_REVISION: qemu-xen-X.Y.0
> -  * QEMU_TRADITIONAL_REVISION: xen-X.Y.0
>    * MINIOS_UPSTREAM_REVISION: xen-RELEASE-X.Y.0
>  Where X.Y is the release version (e.g. 4.17).

Especially for this piece of information I'm unconvinced it can plausibly be
removed ahead of removing the respective data from Config.mk.

> @@ -58,7 +56,6 @@ t=RELEASE-$r
>  
>  * change xen-unstable Config.mk
>  #   QEMU_UPSTREAM_REVISION,
> -#   QEMU_TRADITIONAL_REVISION
>  #   MINIOS_UPSTREAM_REVISION
>  #     (drop any references to the specific commits, e.g. date or title)

Same here then.

Jan

