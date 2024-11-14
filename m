Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAF39C8884
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 12:11:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836288.1252172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBXkr-0007Ig-3N; Thu, 14 Nov 2024 11:11:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836288.1252172; Thu, 14 Nov 2024 11:11:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBXkq-0007GD-W0; Thu, 14 Nov 2024 11:11:16 +0000
Received: by outflank-mailman (input) for mailman id 836288;
 Thu, 14 Nov 2024 11:11:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81on=SJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tBXkp-0007G4-6C
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 11:11:15 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27abf034-a279-11ef-99a3-01e77a169b0f;
 Thu, 14 Nov 2024 12:11:11 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43162cf1eaaso6154765e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 03:11:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432dac21a15sm16616085e9.38.2024.11.14.03.11.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 03:11:10 -0800 (PST)
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
X-Inumbo-ID: 27abf034-a279-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmUiLCJoZWxvIjoibWFpbC13bTEteDMyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjI3YWJmMDM0LWEyNzktMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNTgyNjcxLjQwNzg5LCJzZW5kZXIiOiJqYmV1bGljaEBzdXNlLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731582671; x=1732187471; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZBaIyazJjJMr4oD9NzgbY3iHT93rvlmS402mcAKCBDY=;
        b=YGx6SCEnBdMZ4S9NWTm1LblxmXT5Gx3iqGGZX2TskNOEhLTK7i2rURBsAMYFZIeAdN
         O7oQjqSFf60zDvOQA/u6S+AAOiWNlzYKE9OCLHHJA8MNb5+ktAoQieQXV8et5oDo51Bm
         255yJPaDXVDFfeWd8HHOxevBCRy+TYjM23gX4ohFXxqbeS+VocgcIIz1E7AaEjTli0Gt
         beEpvmds98WluCKs8TTJiP5PWbggC4Fdc9SZbkYx/AWYURaHr7FoBjXdnMy/Sq7cvgs2
         yz6m0fnCQ+s47fo6mXetuxnHSRBgspcuWZpakQQFXaux8kvydpA0XZTYka4dVMgO7csV
         XDGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731582671; x=1732187471;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZBaIyazJjJMr4oD9NzgbY3iHT93rvlmS402mcAKCBDY=;
        b=ATX9I8imbiUVCXepKU0PubBHppHaUMk1UMbgKJ5LpVtIA3DD/MCAd04epggYDsxXF7
         luRyTObWtQHDxwIa9ooNesyj3dvy/UPAlcc9CepckN2ZUGcqN2VmVp0hD0eBfedtXrRs
         /Km+Xg9dOjWGA+BO83Hnf28ASiB5RWnt4jy6cYexDJOKbEcsU2NVLl3h4opeo9AFJMxg
         8xvlWb2nzTKfKESoyNOnB2g4FuEWDRGzObcv+bHMLNPkPuwbJw4ArL1kGQzWGI+pDPDH
         3u5z9gn25LBcGXNYLUP/uMn5S0jAQxx3xd1WvH2pZAoXSD3FNGo3iBRtKbfPeqCvbO4X
         /2VQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzFl3RZVFh09IQe+JrX5inWuBvE+efNtWmgbNvTsUXh+7zp8hdOoxyd0RTITVBuBR7AhIP5f5E8AY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwHUlAnLox5jcn9V3D33sCx/PcbtbIqKfaDp+bZ5fkCBeG5p+50
	hfeD2zIHlp87Uxqn3xkDUq2yOXwPosATbqUIRqzXkxsc9aOB/0aUBAzUQ5wYjw==
X-Google-Smtp-Source: AGHT+IHqDPRLkrFtfmKFzwgm+oJLPS40eFOB5dWMD7VHvGhGdqBaRh8v9jxpC71Y4eMRSL6pDWrKjA==
X-Received: by 2002:a05:600c:3b93:b0:431:562a:54be with SMTP id 5b1f17b1804b1-432da77c15amr18800125e9.9.1731582670742;
        Thu, 14 Nov 2024 03:11:10 -0800 (PST)
Message-ID: <f0072d5d-8626-4708-91a8-503a33e99ec5@suse.com>
Date: Thu, 14 Nov 2024 12:11:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] x86/ucode: Remove the collect_cpu_info() call from
 parse_blob()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241112211915.1473121-1-andrew.cooper3@citrix.com>
 <20241112211915.1473121-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241112211915.1473121-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.11.2024 22:19, Andrew Cooper wrote:
> With the tangle of logic starting to come under control, it is now plain to
> see that parse_blob()'s side effect of re-gathering the signature/revision is
> pointless.
> 
> The cpu_request_microcode() hooks need the signature only.  The BSP gathers
> this in early_microcode_init(), the APs and S3 in microcode_update_cpu().

That's microcode_update_one() after 502478bc1d9d if I'm not mistaken. In the
course of determining that I'm afraid I also found the first sentence of this
paragraph rather misleading than helpful: While it is true what is being said,
in both cases it is collect_cpu_info() that is being invoked, retrieving both
signature and revision. IOW logic needing the signature only doesn't really
matter here (and the sentence made me hunt for cases where we would read just
the signature, aiming at verifying that leaving the revision field unset
would indeed not be a problem).

>  For
> good measure, the apply_microcode() hooks also keep the revision correct as
> load attempts are made.
> 
> This finally gets us down to a single call per CPU on boot / S3 resume, and no
> calls during late-load hypercalls.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Preferably with the problematic sentence dropped or clarified:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

