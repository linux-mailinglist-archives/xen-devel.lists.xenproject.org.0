Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE46998548
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 13:45:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816035.1230211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syrbQ-0006am-Eh; Thu, 10 Oct 2024 11:45:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816035.1230211; Thu, 10 Oct 2024 11:45:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syrbQ-0006Yx-Bh; Thu, 10 Oct 2024 11:45:08 +0000
Received: by outflank-mailman (input) for mailman id 816035;
 Thu, 10 Oct 2024 11:45:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GYHQ=RG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syrbO-0006Yq-Pq
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 11:45:06 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1798c212-86fd-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 13:45:05 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5c915308486so1073959a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Oct 2024 04:45:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c937267272sm657074a12.75.2024.10.10.04.45.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Oct 2024 04:45:04 -0700 (PDT)
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
X-Inumbo-ID: 1798c212-86fd-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728560705; x=1729165505; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ppAeNhpjBNYJv1Ks4wa6MbXhaiqiZk06I7mEQhH62zk=;
        b=LxWSane1XX8bbcHTDonxGukjrSYzIqyOIm4ZAmRQU+zKHM4jbgkTRZ687zfBD3/R0f
         Q4T8fWQxyNEXw5GQd+V1RJYR/f97X+b8JW9/OlWZSDJHMwwjSAhbsTmMJiUJgeGpC2A0
         h1vWewC1LoY/Ck1CopkDq6uXlEmcj11S8L2PrARKoegEAJRHH1frbMQYRm1bLByD4gRQ
         n8+UNPyJT3Rq0MMj7lGYL+YwfXPUjNn27gczz4j1gqyBgOi8r/oU6ZftzoLBuVUkSt2d
         tghCsdZxhwI7Nx/g8m5C1Ar41QxYTHNFjw6GbSSWE5174UkgKAitXBP1C8ikB/6ro4TQ
         sUOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728560705; x=1729165505;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ppAeNhpjBNYJv1Ks4wa6MbXhaiqiZk06I7mEQhH62zk=;
        b=U/oSImdWi/A2dT34gVDHnPQOKHcFi/4cyygoHPsoSvF89NSfjmAJh2y7o6xW9W494g
         F1UBHe4sMjytd3rwsmHTOodFhzU8Q+k3+uWtM3SkgPl31Vs622FWnKkyfztUcLFMYHi9
         1hRG73doVINpdzf6wLv1u6vr+3W5+LjY0NWBoSYgti+8iGDoeQgsWRf21D6IFST3EaYL
         oqW5HOUdhgqrREN6MAA4B/3eIdjQi+D34M9dKGgz+Qp9WMstjSIofnpif2OoYfxNnL42
         YdhQ+0HhF1bee/cVFsAPydgi13KrKb1gy5kwfuojD+Y7DuKzp/asQuxUWTnhlmfXuWW1
         Apyg==
X-Forwarded-Encrypted: i=1; AJvYcCUP9tWtcA8UsWnSKs48wAqY0Tmv7ty3nGJezAYSsQ5Et3yaeAR+BMETOcGElz8Q0mpmibZ7o4mUwtg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw0befEhZxXqx006zljTYc70W1oJHN6Tb4nUFPcL8GmKn3AQn7h
	4faGMR8Y/tbZYgKuUeBz4cOcavWcJWodCUcM3WIDkZETqKpuUFyuT23B+qf11LQUEYSx0OKQtp4
	=
X-Google-Smtp-Source: AGHT+IE1uZQnKWWI3g1qy8TQV6BG0uN0sb1ymQCImHXCrVtafIzSnWiOb+y9d/QQ0Bo+cMcQ6m7/lg==
X-Received: by 2002:a05:6402:2707:b0:5c2:6343:8ddf with SMTP id 4fb4d7f45d1cf-5c91d699391mr4284098a12.33.1728560704682;
        Thu, 10 Oct 2024 04:45:04 -0700 (PDT)
Message-ID: <255254f9-93e9-4132-9218-dc18d78439b8@suse.com>
Date: Thu, 10 Oct 2024 13:45:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH v2] add config support for each Xen library
To: Juergen Gross <jgross@suse.com>
Cc: samuel.thibault@ens-lyon.org, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
References: <20241009140554.1084-1-jgross@suse.com>
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
In-Reply-To: <20241009140554.1084-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.10.2024 16:05, Juergen Gross wrote:
> Instead of adding all or no Xen library (controlled by CONFIG_XC),
> support a dedicated config option for each library instead,
> defaulting to disabled.
> 
> As it is no longer needed now, drop the CONFIG_XC support.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - merge patches of the V1 series (Samuel Thibault)
> 
> Note: do not apply to the tree until the related Xen series
> "stubdom: prepare more fine grained Xen library usage" has been
> applied.

And at this point it's solely "stubdom: add fine grained library config
items to Mini-OS configs" which is left as a dependency, isn't it?

Jan

