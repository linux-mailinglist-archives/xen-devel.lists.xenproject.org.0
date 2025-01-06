Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3708DA0216E
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 10:05:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865567.1276807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUj2i-00035G-OA; Mon, 06 Jan 2025 09:05:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865567.1276807; Mon, 06 Jan 2025 09:05:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUj2i-00032w-L4; Mon, 06 Jan 2025 09:05:00 +0000
Received: by outflank-mailman (input) for mailman id 865567;
 Mon, 06 Jan 2025 09:04:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9khw=T6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tUj2g-00031p-UA
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 09:04:58 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4dbc2e1e-cc0d-11ef-a0df-8be0dac302b0;
 Mon, 06 Jan 2025 10:04:58 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43624b2d453so146013385e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2025 01:04:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b3b214sm602532695e9.28.2025.01.06.01.04.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 01:04:57 -0800 (PST)
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
X-Inumbo-ID: 4dbc2e1e-cc0d-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736154298; x=1736759098; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xKdz5ZfmiRbMkL0bHona89NxxSVkAQIEzmDNyelosa8=;
        b=W7dB3BBZQUgZD35FenAZFQqMrb0QGe39zN4SlpYvcw5tLbW4tiPz2DOhLlCQNjRlfu
         Vti7zaWGPWb1MxnzOUzMXxK9iHgfFyZ5htmvrL5sflYKntwc0M3gBTSQx0CBDzghDuzo
         bntK+afZLGT99QNrzyAcife77zJ8DQCLi6TuwWs1LjNQm6ZP1ir90NRjD21WpYpIuK89
         PyY/L7sBLThNmmpb1yFF91xyr59MOA9D8xbgn6WBnyHcIVgirXHBn+HMsRCLDAj9mCEs
         pI6ZogimMNZ9eZqwpnZ1CmB6nFIhhWw37WlCgrkGheknG6/RoJwC/acya0p1dafEj5xr
         w1FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736154298; x=1736759098;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKdz5ZfmiRbMkL0bHona89NxxSVkAQIEzmDNyelosa8=;
        b=elfdsc2WGadqO9MZr9gEvbu0gdWCeJUsrHppoeqvt0pXLLn0UoRcaX374tQTcb/+vk
         cNywFF3Zec2MPDiVTIRjXi2Z+R1uWWG67cZqvb42R0bfHPIIsd74JXNGWsjOAinrE8sp
         XWF65SaWIOvMAMlYjhP1McylyHKLaYrRNuQovuYUnDuirSfm9qxs54JgGlwD0ZUa5HVo
         U7lSmvRY6uHrWWotGT8I05zWWJxqvEzQHNtWjPWjKvGluazgaugq0BWZpCD4ZUqJNppq
         uaAV48x+SLNwYUsJTgAw2wkXC8A8tAHZ7wvkTBfFR1y20NqcAVwj13WVAmKg1xeCFRcp
         B2KQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdbE4+kmlKASCvOn3AhEp4n0OfUPOchh/wRT0q/0njnNPIgtEwef/pqufG+PaJkILLzTeCm3YBKl4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxwf4YLEBgbSNM7SNjPnMFJMb4z0SX4FDXJBc5Wx0cpv35kaw3F
	uS2MTd9g3W0roUC4s89N1lNasZ3bJxyhaOiPDK2zZbanw6Hg1EYqTUtv04xZaQ==
X-Gm-Gg: ASbGncvEaLsnQzNOiiCTPP3Rko1JojxXhS/9Qbc4Ws82OQPJqZpfS8tAjZHwxote0nU
	WySvd6U9bZPDU37Wi3On37Sq8d7iJB1IaS9iVW/8EnrcvIyHX5ZHVCaJraPbOH09YQd7U0j3xJf
	sUf0Ts3N7BnYtrbw9dSw2IegS7a0l8cnD7MpMEuPDLsJKbUShgOvVuhqS32Rf+XKZa2FvgiW4qY
	oPPLHlXhWoOmlKBfh9oVc0O0YpzOmhoQ65hXUslUa6quwKUUZZl3jvHff0xqxHpNEe5xeHSIKEK
	d8tHN3bHoPHauHpa16gtTUyezxAfLAH2yjFj1hJm0g==
X-Google-Smtp-Source: AGHT+IGzOlRD+xy41OVyHw/+lix+/OkWZVTntIKcBq44C2zyFJD52W57hsDVmvgTwVspEVp9lLV8pg==
X-Received: by 2002:a05:600c:3b86:b0:434:f0df:9fd with SMTP id 5b1f17b1804b1-4366835c187mr451917285e9.2.1736154297780;
        Mon, 06 Jan 2025 01:04:57 -0800 (PST)
Message-ID: <be09172b-5351-4ac0-af6a-1c78318c1bb3@suse.com>
Date: Mon, 6 Jan 2025 10:05:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/35] xen/console: introduce consoled_is_enabled()
To: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-17-e9aa923127eb@ford.com>
 <1968c658-595d-4d36-8558-8f178f8ed531@suse.com>
 <dbgW8XOq7JPdwZfOVtTFNzR4sEKb8gtxLEa1gygWzrm3gtGw28Rh4rxtwROJZ63-oMBOdfrzck3uET7uXNAjd3DW_NNRcgU_WbsCaFTmC0g=@proton.me>
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
In-Reply-To: <dbgW8XOq7JPdwZfOVtTFNzR4sEKb8gtxLEa1gygWzrm3gtGw28Rh4rxtwROJZ63-oMBOdfrzck3uET7uXNAjd3DW_NNRcgU_WbsCaFTmC0g=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.01.2025 04:00, Denis Mukhin wrote:
> On Tuesday, December 10th, 2024 at 6:31 AM, Jan Beulich <jbeulich@suse.com> wrote:
> 
>>
>>
>> On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
>>
>>> --- a/xen/drivers/char/consoled.c
>>> +++ b/xen/drivers/char/consoled.c
>>> @@ -43,13 +43,13 @@ struct xencons_interface *consoled_get_ring_addr(void)
>>> static char buf[BUF_SZ + 1];
>>>
>>> /* Receives characters from a domain's PV console */
>>> -void consoled_guest_rx(void)
>>> +int consoled_guest_rx(void)
>>> {
>>> size_t idx = 0;
>>> XENCONS_RING_IDX cons, prod;
>>>
>>> if ( !cons_ring )
>>> - return;
>>> + return 0;
>>>
>>> spin_lock(&rx_lock);
>>>
>>> @@ -91,15 +91,17 @@ void consoled_guest_rx(void)
>>>
>>> out:
>>> spin_unlock(&rx_lock);
>>> +
>>> + return 0;
>>> }
>>>
>>> /* Sends a character into a domain's PV console */
>>> -void consoled_guest_tx(char c)
>>> +int consoled_guest_tx(char c)
>>> {
>>> XENCONS_RING_IDX cons, prod;
>>>
>>> if ( !cons_ring )
>>> - return;
>>> + return 0;
>>>
>>> cons = ACCESS_ONCE(cons_ring->in_cons);
>>> prod = cons_ring->in_prod;
>>> @@ -118,6 +120,7 @@ void consoled_guest_tx(char c)
>>>
>>> cons_ring->in[MASK_XENCONS_IDX(prod++, cons_ring->in)] = c;
>>>
>>> +
>>> /* Write to the ring before updating the pointer */
>>
>>
>> No excess blank lines please.
> 
> Fixed.
> 
>>
>>> @@ -125,6 +128,13 @@ void consoled_guest_tx(char c)
>>> notify:
>>> /* Always notify the guest: prevents receive path from getting stuck. */
>>> pv_shim_inject_evtchn(pv_console_evtchn());
>>> +
>>> + return 0;
>>> +}
>>
>>
>> For both of the functions - what use is it to make the functions return
>> a value, when all they'd ever return is zero (and callers don't care)?
> 
> Fixed.
> 
>> I'm also having a hard time seeing how this adjustment is related to ...
>>
>>> +bool consoled_is_enabled(void)
>>> +{
>>> + return pv_shim && pv_console;
>>> }
>>
>>
>> ... the introduction of this function (which by itself is probably fine).
> 
> That will be a cleanup in console driver on the code path I touched wrt console
> focus switch.

Yet then please don't mix entirely independent things in a single patch.

Jan

