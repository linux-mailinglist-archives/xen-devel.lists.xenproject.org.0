Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA8F88FB91
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 10:33:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698847.1091017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpm6S-00056d-Tp; Thu, 28 Mar 2024 09:31:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698847.1091017; Thu, 28 Mar 2024 09:31:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpm6S-00054R-QN; Thu, 28 Mar 2024 09:31:20 +0000
Received: by outflank-mailman (input) for mailman id 698847;
 Thu, 28 Mar 2024 09:31:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JFXD=LC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rpm6R-00054K-Fu
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 09:31:19 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed8088fe-ece5-11ee-afe3-a90da7624cb6;
 Thu, 28 Mar 2024 10:31:17 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-56bf6591865so1108604a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 02:31:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ef15-20020a05640228cf00b0056c1380a972sm601476edb.74.2024.03.28.02.31.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Mar 2024 02:31:16 -0700 (PDT)
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
X-Inumbo-ID: ed8088fe-ece5-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711618277; x=1712223077; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jq+PqoYN8UPKZoful/+v/XUaP4MGZA3H0thHS9iahjk=;
        b=RxFZBBWFc+3mINBVF86tchCwnLHSYUcI0nHqziPNMUOsNlyXZba9EgsTe/qgg1SIV2
         fupmre8xTTaPF8Sj+eYUxOFi3xK/eY+0UjajUicF0ouSEen7DZch8JL21casOegrj80o
         VOZmYBdu61M9tF9MbZTf6kyvJjaZrqjzXROOSsmbZBx+CwS95qx55/mZLKbCBJ7wliuD
         Kk0NUcM2laI9iBF6NuHWe7JJ3h01QAztQtN8LyGcDGK8imoHVYCSAYDD07kf+74XYQXP
         7iU7CL1YMWrJdMhk8o3yOIu5ZXJlEI/2kMqgrnJYH/kbzAa+Di04lYcp/pRcL60FG7c0
         lc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711618277; x=1712223077;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jq+PqoYN8UPKZoful/+v/XUaP4MGZA3H0thHS9iahjk=;
        b=rfcKMO8ZM1psQ7fXuPeeAsbDwrEVbFM4yvstTev8k3DOZHJAuxb19bYOUSXHJAxIBG
         MVbfAndjyexsLbvt8o8PteOsqqstcIb2Yr39jcFTEMjRiFAMSsgUpq6T6QYKTGx0d8gj
         LO+By1eKjtKoEI9JlAgvBhIp85PZijn+QEZrglVsFKfynuuuQamAPuxR0Y1LYg14pWRb
         mg8YH0OrJ2pq7xOb93IwYMOzx3rjYBMtBtKeqaH/IBA+WhNbV6F11tNMNbS7gt0NjpQU
         7ZmI6UJd7tSX0HuHM35sG5Mwcwfm3EvT4nCSHmmYNb/BISxN1P+182bWVJ2HffelknA+
         7OqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkEdKx81s8GoKAAVnYewwQopGaDtaW9lfX7HIsyxgYq14cknzr/7ibrEGl30p5NiHKsj2KsxYpmOM+aVWsjYkNUI8gKi/AU7AXqHDgsfo=
X-Gm-Message-State: AOJu0YwejyqFbk1LQ+hB7vmy6iWJoNYeJlKr4hPdQDx2LMb2sOO1vLU3
	o5FaZ18bFiYCmGr0ep+R7EsZ4KZllArFjkV6l3PDqMp6iq19BJEdUAQdyCIb7g==
X-Google-Smtp-Source: AGHT+IGSjy1EWlI3uBlgjW001BPNTf0X0SvCS3RNB1Rgv9F7IcS6d+OZ++XEpXk+rD/LwNHRbmYvrw==
X-Received: by 2002:a50:9344:0:b0:56c:2785:ca34 with SMTP id n4-20020a509344000000b0056c2785ca34mr1664512eda.5.1711618276900;
        Thu, 28 Mar 2024 02:31:16 -0700 (PDT)
Message-ID: <21da34a4-d946-47d0-86a6-b184fd010c94@suse.com>
Date: Thu, 28 Mar 2024 10:31:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] tools/misc: rework xenwatchdogd signal handling
To: leigh@solinno.co.uk
Cc: andrew.cooper3@citrix.com, anthony.perard@citrix.com, slack@rabbit.lu,
 xen-devel@lists.xenproject.org
References: <55416d60-cae7-4e79-8bde-bc07ee9e3830@suse.com>
 <20240327181353.10951-1-leigh@solinno.co.uk>
 <20240327181353.10951-3-leigh@solinno.co.uk>
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
In-Reply-To: <20240327181353.10951-3-leigh@solinno.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.03.2024 19:13, leigh@solinno.co.uk wrote:
> From: Leigh Brown <leigh@solinno.co.uk>
> 
> Rework xenwatchdogd signal handling to do the minimum in the signal
> handler. This is a very minor enhancement.
> ---
>  tools/misc/xenwatchdogd.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)

Throughout the series Signed-off-by: are missing from both you and Leigh.
The latter you may of course add only in case of this either having been
provided earlier (and dropped for an unknown reason), or with respective
agreement.

> --- a/tools/misc/xenwatchdogd.c
> +++ b/tools/misc/xenwatchdogd.c
> @@ -9,9 +9,11 @@
>  #include <unistd.h>
>  #include <signal.h>
>  #include <stdio.h>
> +#include <stdbool.h>
>  
>  xc_interface *h;
> -int id = 0;
> +bool safeexit = false;
> +bool done = false;

Seeing the subsequent patch adding static, please don't introduce new
non-static items.

Jan

