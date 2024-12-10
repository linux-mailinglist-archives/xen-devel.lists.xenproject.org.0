Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 450C59EB403
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 15:53:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852638.1266381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL1bX-0002Hf-6N; Tue, 10 Dec 2024 14:52:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852638.1266381; Tue, 10 Dec 2024 14:52:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL1bX-0002FX-3n; Tue, 10 Dec 2024 14:52:51 +0000
Received: by outflank-mailman (input) for mailman id 852638;
 Tue, 10 Dec 2024 14:52:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=So9x=TD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tL1bV-0002FR-Q5
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 14:52:49 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c486547-b706-11ef-a0d5-8be0dac302b0;
 Tue, 10 Dec 2024 15:52:48 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-434ab114753so37838925e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 06:52:48 -0800 (PST)
Received: from ?IPV6:2003:ca:b746:63c:8df1:d232:d9a2:1ff9?
 (p200300cab746063c8df1d232d9a21ff9.dip0.t-ipconnect.de.
 [2003:ca:b746:63c:8df1:d232:d9a2:1ff9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3864a8e4db3sm819979f8f.47.2024.12.10.06.52.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 06:52:47 -0800 (PST)
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
X-Inumbo-ID: 6c486547-b706-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733842368; x=1734447168; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YRW5wH+yNRZJL2JIni570vNgX6sMwNHhrgnxkmfz5Js=;
        b=dA/s6wIGS/71uVl0GVFlcnhtK51mNDotHlW9p8puhBcK+Aw0CJrx/gCwkwjvxZT47F
         iEmiD+lgTIvc0mOTbH5sghd3Ca0d965ailcjJz3DQUYiyDMyQv64jndOMv/HCxWMsfd6
         UHVzV7vtwCBc+1xzTQpM/3/asXaybdQphAAPsLEWaKQbXvzi+HoeCODuq0wFbSqRGA6g
         PdpQL4o8/P7kxy5R0kxuNllb1EEFXJph9PLCKm3VADZRasvnc1RL702JRSKujF1xAiO3
         HGrJQ60zNUAyqZbiySddF01sYmao1+TpRftx46pmi4zfqS3HWnvN2Xh21tuJUXRtABrH
         1tcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733842368; x=1734447168;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YRW5wH+yNRZJL2JIni570vNgX6sMwNHhrgnxkmfz5Js=;
        b=KZxErDlmQOQVzLXFzGnQ+n3gA7PEc1S8f+vZPZNCqyU/u0WLq9BEhTPMS7m5BIlswE
         DerWQB9L+5C63fvAXMKhBhgkg7CUkYPd/W+iN1D7DT8MuQJJrML8KuolyGYVPy7yb5Gx
         jp9+nPxROH4YwM6nRt4Ntpk9Ql/ehy3GLbsiYfw34Zp0qKh/E7n/pdZAqS67rd/TKfmd
         /L7F/fB2diCniu9en9pQNfULT0jY3f4WGjqclzoFarr3R2sz1gtqDAA0FgJVJVmHmd7G
         UaRhjbV1mUqKZpTS8upqCafKgzWNO3C6q215+sr6N9m9ktGggvYCZ9vAHspOzNNbyo2f
         3qsw==
X-Forwarded-Encrypted: i=1; AJvYcCVOYkeuqh7RRvdRRTjttrrV7omANe/KDOjhLqv7r+no4zsOJwEwdPhc8UVoU/VlE/tyQ7zuFWIY2ik=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz2hboPwok0Tt1LZtSQzikrJ5XWntyAcma2tcXWnXeD53uVtDPU
	5d0vnvrt9dsqbLrk8I+1h5LTkyh1biMQPa8b/kyRwo71DccZQsdiyPJV++FDrw==
X-Gm-Gg: ASbGncvZFzztTlCKG8bUUeDvQD+WRzIvdZapKBsf1LLULsWsumlbmNsXYYu+B4aogSs
	cio/2sK+oN8cq1JefNEBFvDnWamnzsJ5XRpREIVaCPj/fqbys/KjXxav6Y1QOiJSBSORQSNXtW/
	ubQ0ZWHDXbgB1bcmtptPtRI7LieVfyPSlNGnbys9ZDZ7uqeOJn+KrgsD3Xs6LongbMTxUNZRpef
	mfXkvrYwY7rONyrAC1Wg99bavrNrpaT7VP2ukhSnSQm32eAZ7QPmBscF44zOyG6PfUBsMiksXcB
	BTpukqn7IVKk5EQ2j8FnWjKOyZPNKuLMwQilLZbFZ3HniwThDE/wJIRTpUWYy+iNHgH2w7RYis0
	1usvLP2i7jg==
X-Google-Smtp-Source: AGHT+IG1svCsZ0wdtLZw99ZEPrnDOHNcWHl3wiEhcidgqkjoBDz+hU3y0KGnIQmr6hLlewC2Wr1R0Q==
X-Received: by 2002:a05:600c:4ecb:b0:434:f270:a513 with SMTP id 5b1f17b1804b1-434fffc627dmr39028945e9.29.1733842368209;
        Tue, 10 Dec 2024 06:52:48 -0800 (PST)
Message-ID: <7ab4786b-15fa-4504-9694-f63b0f71c5a2@suse.com>
Date: Tue, 10 Dec 2024 15:52:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/35] xen/console: introduce use of 'is_console' flag
To: dmukhin@ford.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-18-e9aa923127eb@ford.com>
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
In-Reply-To: <20241205-vuart-ns8250-v1-18-e9aa923127eb@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> The code now inspects d->is_console flag to decide whether the console focus
> should move to the domain w/ console after administrator presses <Ctrl+aaa>.
> 
> Console owner domain switch logic updated accordingly.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Just as a remark, as it's a pre-existing problem: I'm unconvinced that
"is_console" is a good name here.

> @@ -509,14 +509,20 @@ static void console_find_owner(void)
>              domid = get_initial_domain_id();
>          else
>              domid = next_rx - 1;
> +
>          d = rcu_lock_domain_by_id(domid);
> -        if ( d )
> +        if ( d == NULL )

Seeing the original code, the more "natural" transformation would be to
!d (as we use elsewhere as well, to keep code short).

Jan

