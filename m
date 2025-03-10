Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF67A58DE8
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 09:19:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906174.1313620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trYM4-0007GW-Al; Mon, 10 Mar 2025 08:19:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906174.1313620; Mon, 10 Mar 2025 08:19:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trYM4-0007El-7p; Mon, 10 Mar 2025 08:19:20 +0000
Received: by outflank-mailman (input) for mailman id 906174;
 Mon, 10 Mar 2025 08:19:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sahL=V5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1trYM3-0007EZ-2u
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 08:19:19 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c6a2605-fd88-11ef-9ab8-95dc52dad729;
 Mon, 10 Mar 2025 09:19:18 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3914aba1ce4so376436f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 01:19:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c103aa5sm14287910f8f.94.2025.03.10.01.19.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Mar 2025 01:19:17 -0700 (PDT)
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
X-Inumbo-ID: 5c6a2605-fd88-11ef-9ab8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741594758; x=1742199558; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OvJxbE4gF22IQHz7PFh96IMiLJCFmtTGkr7AgW0f3Q8=;
        b=hF6V2sNSQdOFw+CA5XSowufllSr6sl9TcuAnCNfQj/OP1ptFLSxO/1sp1DXsQ6Trw9
         wdxr18Ee/3n8G9KrLgHUYqdioMpR6UgRZZ+j4aQGT9RWBgFN/krO0MY1/DBo0rkpNnTT
         6w6N7S6fr6xb7HPh8T75zqRiXBOD81o3F4RCzRSLVmP4kFODTTW85pZGDDA8WrxEMIno
         KGN/iaS9dZNZ3jgxodoXowQv7/Vl49aJFx//g2vJW+PfCsddLN6VORg/8yIXhp+xPqn5
         VIug5fZB5yYA0MDYRHPavGjZOHR5kdFAE2lij8gX94subExBWyeFx/tTkHYgLtfj+WLj
         /y1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741594758; x=1742199558;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OvJxbE4gF22IQHz7PFh96IMiLJCFmtTGkr7AgW0f3Q8=;
        b=g0vklITIFmQE4yALAJCuxYtdQxwHoxY4g1Xj85xwEqc5hF5fkfhNEJ6FuCjX6R/a5K
         f1dMpoiINu1cveh+7B2YkFwG71E/Po7dKay8gwhOrqPIUKjYT+mKExHLOqtNJnDuzgAw
         WJiahCzWgC4dgjhPqKcR9fE8oeNZzpQf8HShdiPQFIMu75tatHO6TrHTaqBK42fQfTBO
         XnGWCuUH0clWZTMSVM3Uu7B79LGrAgVKMbKXE8nhkoz+/NHE49FcetKE9z2sHOplMnb8
         OTg8NKRljl/hAC/7GTxsY3fgyi4tA4zc6y3aoAIMZgsmCa9wrRed79toHm7eBD2pmqjH
         CNFA==
X-Forwarded-Encrypted: i=1; AJvYcCXxYwigbDK21GnpcWxHVp7G/cUCqVUKAUYVJcqfAR+Esh0fJoNH1/VlxiiA6B+i/xsa8TP9Q6SEwHg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwYC9XWIvMCxBcDwypXlmyPdSz75POeZPxbz3G18xM6t9CinSn3
	+yjXTWlpL4hEMI2CxkWQ1cDJWdcw5FzBZYYii9A8VagA8jLIi2vT+qw0O5t2Aw==
X-Gm-Gg: ASbGncuj9yNJ+orAIeDMgDhsMAVWUcD4ncQ9pwhcVPidmqpJCbSIIeYIAf/1oiaOQt0
	xvd0X5hdcjtWfAFICKlPzwuvaNuhUaxSOFJziAUsYqLBEREwGhKZTrBPMawKma4OhBBLuNVp1ra
	Ur0X4xYOnutEgKkmQT+S6fTu8fzIYvGS8tecUFmoQ/ivYUCQrooGH5j8T/oL1OkhPXD+j1/QbrJ
	/wFPuaotRDXr3JvJsoLckvXXMXfzZCW7EkpA0PfpmQhmRYBON+a2+wi4ennnSCK0jZkLuKI9BSQ
	ckw+1dZNkk1/NC89nf3XCM2x/4jduAlUxcW2IK5wEHSAaop+nfeRyH/JK2vHbLYQ+tJVO1mIoGN
	0SDmxJrQa9ptzkS3qbihWcgegs93ZAA==
X-Google-Smtp-Source: AGHT+IH649fLojEQEEy9ukZI1fqmPMIss8CMKLaoKCE0fZrs68YAoUeBcN6J3r5rw9A5XDho/1rLZA==
X-Received: by 2002:a05:6000:402a:b0:38f:2efb:b829 with SMTP id ffacd0b85a97d-39132db8f39mr9003322f8f.50.1741594757632;
        Mon, 10 Mar 2025 01:19:17 -0700 (PDT)
Message-ID: <2e17aa1c-29a5-4e82-8c1f-f9e34f4bef55@suse.com>
Date: Mon, 10 Mar 2025 09:19:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/watchdog: Identify which domain watchdog fired
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250303232941.2641306-3-andrew.cooper3@citrix.com>
 <20250307142442.3063528-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250307142442.3063528-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.03.2025 15:24, Andrew Cooper wrote:
> When a watchdog fires, the domain is crashed and can't dump any state.
> 
> Xen allows a domain to have two separate watchdogs.  Therefore, for a
> domain running multiple watchdogs (e.g. one based around network, one
> for disk), it is important for diagnostics to know which watchdog
> fired.
> 
> As the printk() is in a timer callback, this is a bit awkward to
> arrange, but there are 12 spare bits in the bottom of the domain
> pointer owing to its alignment.
> 
> Reuse these bits to encode the watchdog id too, so the one which fired
> is identified when the domain is crashed.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



