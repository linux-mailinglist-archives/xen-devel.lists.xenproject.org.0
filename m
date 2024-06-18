Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4543490C64A
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 12:18:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742963.1149849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJVuT-0002g2-IC; Tue, 18 Jun 2024 10:17:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742963.1149849; Tue, 18 Jun 2024 10:17:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJVuT-0002dG-FZ; Tue, 18 Jun 2024 10:17:53 +0000
Received: by outflank-mailman (input) for mailman id 742963;
 Tue, 18 Jun 2024 10:17:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MUlf=NU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJVuS-0002by-Kn
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 10:17:52 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04398e3f-2d5c-11ef-90a3-e314d9c70b13;
 Tue, 18 Jun 2024 12:17:50 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-57a30dbdb7fso9312296a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2024 03:17:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cbb05b465sm7017004a12.18.2024.06.18.03.17.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 03:17:49 -0700 (PDT)
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
X-Inumbo-ID: 04398e3f-2d5c-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718705870; x=1719310670; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mmse11iwk+dOuhhetfXQZRuoY9UK/MzzpAZaloY4n94=;
        b=e8+WRRSiu41PWNGVFgG6Zqo4yI7TF9WrqlsZ8nLP9NpCl7rb8ZtTbWRPo10DF/abLE
         vyqKsViYMdqbXdZUzzxEqAkYWWDtZq7cYQI4YtsfJTGpa0s4Jzs0tOdJ5TUs8Nd9gvDy
         VU+ikW6jJw0I53eEsAbXD4CPVb2xnFh6j5woCvxgI+XADDQge4EXc1D/YqAGnIL81Nll
         seRDlqjlTxnX55pb1nTS3TM2Gs69COfJxN58BRJ3f5AVGr/NqY2boleEVWuvCdmaVG/G
         Wg/X/799UqlgCfoUtzcf8LoJTUVPGfny6cOo2zOSH3JvtctjMD6rfu/SmL8ncoQ4qZF8
         k0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718705870; x=1719310670;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmse11iwk+dOuhhetfXQZRuoY9UK/MzzpAZaloY4n94=;
        b=tiyGJ91L1iXoZDnO5e1iaYukocF7A59QShMImVUBHbADNRKYnBZCsxzns21007ER1t
         jhtBTK3i3K62/aJ1aBqDqgB/X3DJhLwZ/5acpZL7wAVrn+Qtm+8VE7kX0czlQFxZs6ah
         Tb46+UqIrEfzAtQxXJx641rGHzIzugEhNZ0GhyVIBSUinasU9+L4f6SloFftDTx+kjuz
         64SvY2WzMrCvwI/9JfkaKghbPdkRP4uNkVjQa1guS3ypX3wGOgyRrsh6NUYVByJKXVga
         hSTiTs1kRgiaQfzDy3S39/kA/9Vv8Nko63zPiUNA01KPyZVvIVQKuzAtnRtnAIFETZia
         gF6Q==
X-Forwarded-Encrypted: i=1; AJvYcCW61txxcIpcbi5aLs0P95H5m+Sk6pvd5UUoWuVBtOuNet0Ol2zaJwsipheVikW/A/2hscholPLcv8E+t2ZVsb0jLlSsUayHrO2oV4A2gxs=
X-Gm-Message-State: AOJu0YwYDb6Er9V6gjseON5mY7o/QuucjMCQWQvG9abftdX2x6aaVGvL
	gvh4u3nU0VdOLH93U8bpHbFSKbCmjOqgkXXDODFHdBRHD69qrjvfi8LGMMZpww==
X-Google-Smtp-Source: AGHT+IHnINw1V0tHbmiq3APKrRqreJIbHSt0C1d2QVxCbPFa79Pygjv5nj5vh0FBWCe+s8dhyOhvMQ==
X-Received: by 2002:a50:cd01:0:b0:57c:6832:7b2e with SMTP id 4fb4d7f45d1cf-57cbd4d96admr8996861a12.0.1718705869892;
        Tue, 18 Jun 2024 03:17:49 -0700 (PDT)
Message-ID: <9c1aa55f-f5e9-45a4-8df1-358db981bdfd@suse.com>
Date: Tue, 18 Jun 2024 12:17:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] x86/boot: Collect the Raw CPU Policy earlier on
 boot
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240617173921.1755439-1-andrew.cooper3@citrix.com>
 <20240617173921.1755439-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240617173921.1755439-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.06.2024 19:39, Andrew Cooper wrote:
> This is a tangle, but it's a small step in the right direction.
> 
> In the following change, xstate_init() is going to start using the Raw policy.
> 
> calculate_raw_cpu_policy() is sufficiently separate from the other policies to
> safely move like this.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



