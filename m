Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A383AC7FF4C
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 11:42:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170252.1495322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNU0q-0004Tn-Nc; Mon, 24 Nov 2025 10:41:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170252.1495322; Mon, 24 Nov 2025 10:41:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNU0q-0004SF-Jp; Mon, 24 Nov 2025 10:41:40 +0000
Received: by outflank-mailman (input) for mailman id 1170252;
 Mon, 24 Nov 2025 10:41:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNU0p-0004Qk-G4
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 10:41:39 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2200d1f2-c922-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 11:41:28 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4775ae5684fso19258305e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 02:41:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf3b4c13sm187496895e9.13.2025.11.24.02.41.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 02:41:27 -0800 (PST)
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
X-Inumbo-ID: 2200d1f2-c922-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763980888; x=1764585688; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9zMZoLq11/KR/OzoedDUjQTXtJ+wLH8rtsk/2VPdtRA=;
        b=XdPFsfSoi4jwnmwc8IrjW/MSs+pWsPdhd1Nyojt4kD3u8d8oTVTKvXoKweS86oyvwj
         ep+NP6RS3hXCVqDXYVc/zoNJWiMZt/6y+eoyomqRv8tyDwGnd+zmOMXO+uDAVv68cDmn
         bYotout3Eefb7vCnXDN1HGhoaU9vYIVdUHOt6kHa0FM3CQRQt4euhF3tRAXkZizKH7pz
         FYpQkxHBswWzMwtDoY2NSpFJs91xe+LIuXIUJlDfCjqYDIdJGfiaHJFWCjNzgQsOWzTw
         uW1vtbnf70U+19yJ56eJHcOfJgmgci6E4RWf4BSboDPyUWjRPaR/w7W2BnF10s9llY0k
         ZtIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763980888; x=1764585688;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9zMZoLq11/KR/OzoedDUjQTXtJ+wLH8rtsk/2VPdtRA=;
        b=ptnGyTBCTpoR47ZGwZUeevo/1TnmlvE0OEzbighziXUPYgnUTY9RumQttvNqcOayBh
         z6sVdyEZrWtEFqZnYdVL2PmVDC8evSitbzt1t2zBPtj7X2WSznmkw+G2C/rjTTdNx76r
         +1674GKVe625c9wLSqiPa4jviYRIAV+oUJRECeaSJkN8x7Ku1zIp8DmlfaC4ftWpKJqG
         MfH77L2H3CQIjKsG2se4wbmPi/07hl5H+t1XZH0P/UgpVsMXrnlAteYcyE4oCAcyuZJw
         lAvQPykSu21YXnn4ncr1FnxFY8d1l4XYXSnCmi0FKfJQuEshPkaP6aspPexjLOev+t4H
         Xlgg==
X-Forwarded-Encrypted: i=1; AJvYcCWR6NKqIoYZqGNBd5aa0dISaq0W/Eiut553qymbZ4t8tgwhNUh+o1Oql28N4LCAqtc7LJs/cFHCIcU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz+3x4zlOu0yknMMXwRw4MdoTnHH1lGf8ZVGlzRNNZN0NztieN8
	QokbGouunZpD///ujyE8HNpl6rktGjut/IZr5VSsBc/wxQv1O8iuurJvp2WIOwvG10kgx+UrryI
	d5Gg=
X-Gm-Gg: ASbGncsEdj45oAuVHniL0FoVdmkPCVj0ACV3zDVrM+lmCNQgZtiX5UxKqLMDmM9lzEs
	fxixMqowJnSPeheBH5GmAh7vLKHfd8eXxIw3KAq9kTg3p5e6oAjY087JhqSYQDkNqqnoHzn38BW
	+zY63DDmmfBLQqCn7BPqUspu2D5ofGdhkbcn1YOn16vLrFxZtYFdQEtyrQj6DefZdFvBb/6ebZ7
	7W8F+8Uvp79qRMErS8ChcQSBzc4mCztP+q9U1ICNto9QIYaoaNKesEQSki3zv/WoC95wN9pYiku
	sStZaUBLDFf7PRVFX+me+l0pC080d5L9ksOsXQRG0b/6oIEtbfD7ZBeMtEmAhgsNhKVWtF4REMy
	c6N94JIs57pTADhiAX5Qh5Ry2GKOMSPOu2goIAZorfqQBQFCN1iYI4MtDJcUSUzs9bPuv84gAQB
	80jJn7LVVFxQrqG98wv+reoOf9kWQNp8xyPZ4OYkq3174KF9VHOEIeZ+Gvpi/fqLhz/a3pQf/6s
	68=
X-Google-Smtp-Source: AGHT+IGaYEC4CCRCg8Q2Y3ZwqEUcqQOTfDpB1cB5g79Wr/oLQ+wI5zk6WLdPtDwjtFjgIwAW7+pWzQ==
X-Received: by 2002:a05:600c:1f1a:b0:45d:f81d:eae7 with SMTP id 5b1f17b1804b1-477c114f45fmr108582765e9.28.1763980888107;
        Mon, 24 Nov 2025 02:41:28 -0800 (PST)
Message-ID: <d34e3e86-c51a-49b3-8b46-140526755f0f@suse.com>
Date: Mon, 24 Nov 2025 11:41:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] build: add make macro for making file from file.in
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251121132332.23514-1-jgross@suse.com>
 <20251121132332.23514-2-jgross@suse.com>
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
In-Reply-To: <20251121132332.23514-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.11.2025 14:23, Juergen Gross wrote:
> --- a/Config.mk
> +++ b/Config.mk
> @@ -159,6 +159,19 @@ define move-if-changed
>  	if ! cmp -s $(1) $(2); then mv -f $(1) $(2); else rm -f $(1); fi
>  endef
>  
> +PATH_FILES := Paths
> +INC_FILES = $(foreach f, $(PATH_FILES), $(XEN_ROOT)/config/$(f).mk)
> +
> +include $(INC_FILES)
> +
> +BUILD_MAKE_VARS = $(foreach f, $(PATH_FILES), $(shell awk '$$2 == ":=" { print $$1; }' $(XEN_ROOT)/config/$(f).mk.in))

Feels like my prior comments weren't really addressed. I continue to think that
none of the above is part of what the subject says.

> +# Replace @xxx@ markers in $(1).in with $(xxx) variable contents, write to $(1)
> +define apply-build-vars
> + $(1): $(1).in $$(INC_FILES)

I further understood your reply to my v2 comment the way that you would drop the
slightly odd leading blank from here.

Jan

> +	sed $$(foreach v, $$(BUILD_MAKE_VARS), -e 's#@$$(v)@#$$($$(v))#g') <$$< >$$@
> +endef
> +
>  CFLAGS += -fno-strict-aliasing
>  
>  CFLAGS += -std=gnu99


