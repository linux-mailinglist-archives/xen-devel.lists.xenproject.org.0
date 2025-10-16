Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 073B8BE1CD1
	for <lists+xen-devel@lfdr.de>; Thu, 16 Oct 2025 08:47:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144117.1477586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9Hlz-0008L0-AQ; Thu, 16 Oct 2025 06:47:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144117.1477586; Thu, 16 Oct 2025 06:47:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9Hlz-0008J3-7g; Thu, 16 Oct 2025 06:47:39 +0000
Received: by outflank-mailman (input) for mailman id 1144117;
 Thu, 16 Oct 2025 06:47:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CbFY=4Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v9Hly-0008Ix-HP
 for xen-devel@lists.xenproject.org; Thu, 16 Oct 2025 06:47:38 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0069b281-aa5c-11f0-9d15-b5c5bf9af7f9;
 Thu, 16 Oct 2025 08:47:37 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-471075c0a18so3784155e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 15 Oct 2025 23:47:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47114428dedsm7620435e9.7.2025.10.15.23.47.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Oct 2025 23:47:36 -0700 (PDT)
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
X-Inumbo-ID: 0069b281-aa5c-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760597257; x=1761202057; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Uu+0Q7jlwk+RFBoViCKV+e3BvDmOsAcry3upwlvr4Uo=;
        b=fqxz28BYgfF66gu1/Z2TZ22V5dtw2km5a050ZM+IVc0pOUWb+vmQZrz1Z45ZzbksX+
         nu6sb9Xf3S+av+vTw5yWUJ92utGqmssfz1zFYzLTUmYrAsKT+K6uFfSkpVhTUvyqS9yv
         4RKsqkH/YPecS7DR+tsTQfc7BbX5Zym5PgG6v9BDYl4FjFAqn6IInNtQGjeDX33Sxo2B
         cTU3DGgwSoErm+y3ETJw7OiWMFH7eZJ//V9AVkfDKaPC8qI/B5Bj4DqQEVmD1GKqPPWN
         WCcLeY8VMicTVEK2jiNhPeMQAHrOvOpxG/o3yUqi0T5dQtcHciuKvs2XJrLAAoBu7EUy
         wenQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760597257; x=1761202057;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uu+0Q7jlwk+RFBoViCKV+e3BvDmOsAcry3upwlvr4Uo=;
        b=tTFzmgb3cL1k0XK6kim1dCLBbs6FFO7HvrOvC8qm/r2Sggqt2XLEqIeEXtF7MC+kmS
         S5RRpqTVPRquFa2YYHEkaUNE+PEBTKca1YPHt7RzbHY+8eA6HQzG26F1VgS1dHd3uB+V
         Rpe7JCFk65DmpbjbEl0nwpxQQ2X+2FHhGDXRw0dWrM+gN3s3dxMoAVr1VNAWMupmFJkJ
         CN5Lh2e4P7uFT5KmOdjX6zn9orkR/0xSQScolwsfy/xl4w8EoMvvOHBTJPIOb+Tj7YyU
         C4KorbnH2DQzFtP3fIGKHaIMFKNE022vuD762Zbpfh/KYjYSIWPWLx7gct59gGMmoK9c
         MksQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFd00Wos99aF7HlT45KQVQbd+g6wX22NJP8O5J+ppFQuKcRC//9RxK2QKcKtjCt4EcY6cxE7dmfy4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzuETO/wy/3t4L1Hwli3cup0FQv0vAvk/TNE2+pPkuywmK7Q8eu
	+H829Af6Qit+VdTcmDTLyfmVNyEmSYX24v84apffQDmTb+nW15DlzcGzFNn9K4yLNQ==
X-Gm-Gg: ASbGncsyN9G079fPAOnSWQ94hktmPjSAjfdlETBGL7OW6GOTan25ut38vHt4tov8QH8
	5c5Lc2vcULmTkLKUKYZpxT5SdRYEqEpr4lpLWWX8qENiYGqDNNLSUMrJ8YJ2mxrgbq2cNdh7wU1
	Eo9keB1y8VYwZi8gUWJVOCZXMVFgV6BvAt9ySboaXXNfXA4c2aFPPXM7kKPvFAj/lM4jGi4GAI9
	27lJA+k9CnaVLZJCQQF81kmh0wvFG4l4WGqQ8MpaPou/dxKh567JCaUn51dQm8za2Qq19fF5ykh
	K9o0mquif0qWm+bwuVjhNgMoQbcCcpI1oubBD7BhUYbE2WDdSICmSYWVhc5ddJva6deu+hzFpQW
	ec93yPzirg9aXIKIiw+zIn1aJPW78+6ZZgb90mpqpF4oTDE1SJBV7etOQO/47dodjy/pR74lfNH
	SyVSRJ4zZMisAcM2cMx8uAobd8jxnSi9JQPsOZOhp93oRcxl6ZG2OV6PMtjoNqUzo8xYfDJLc=
X-Google-Smtp-Source: AGHT+IEksz1QzuqxSSRGMweFznQE7YQq7qWLxIQhtKytn5QanlR9VnlEji7dGG+c+2oSr1zxWa2Jiw==
X-Received: by 2002:a05:600c:6487:b0:46e:4783:1a7a with SMTP id 5b1f17b1804b1-46fa9a8f37emr219325785e9.3.1760597256590;
        Wed, 15 Oct 2025 23:47:36 -0700 (PDT)
Message-ID: <6cf0b252-05ef-409f-876d-2016f0cdc088@suse.com>
Date: Thu, 16 Oct 2025 08:47:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21 v3 1/2] x86/apic: Avoid infinite loop in
 io_apic_level_ack_pending()
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <20251015210454.95381-1-jason.andryuk@amd.com>
 <20251015210454.95381-2-jason.andryuk@amd.com>
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
In-Reply-To: <20251015210454.95381-2-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.10.2025 23:04, Jason Andryuk wrote:
> io_apic_level_ack_pending() will end up in an infinite loop if
> entry->pin == -1.  entry does not change, so it will keep reading -1.
> 
> Convert to a proper for loop so that continue works.  Add a new helper,
> next_entry(), to handle advancing to the next irq_pin_list entry.
> 
> Noticed during code inspection.  The infinite loop was not observed.
> 
> Fixes: f821102450a1 ("x86: IRQ Migration logic enhancement.")
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> v3:
> const on next_entry() parameter
> Remove spaces inside for loop braces
> Remove inner if (!entry) check
> Expand commit message to state noticed during code inspection
> 
> v2:
> continue (not break) for pin == -1.
> 
> I added the next_entry() helper since putting the expression in the for
> loop is a little cluttered.  The helper can also be re-used for other
> instances within the file.
> ---
>  xen/arch/x86/io_apic.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
> index c384f10c1b..c35d611ecf 100644
> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -1586,20 +1586,24 @@ static int __init cf_check setup_ioapic_ack(const char *s)
>  }
>  custom_param("ioapic_ack", setup_ioapic_ack);
>  
> +static struct irq_pin_list *next_entry(const struct irq_pin_list *entry)
> +{
> +    if ( !entry->next )
> +        return NULL;
> +
> +    return irq_2_pin + entry->next;
> +}

When replying to the v2 thread I hadn't spotted yet that a v3 was already
posted. As indicated, imo this name to too generic (now). I'd be happy to
make adjustments while committing, as long as we can agree on some less
generic name.

Jan

