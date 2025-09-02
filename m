Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF41AB3FAB1
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 11:36:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105954.1456762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utNR9-0000Im-5o; Tue, 02 Sep 2025 09:36:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105954.1456762; Tue, 02 Sep 2025 09:36:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utNR9-0000Ff-2s; Tue, 02 Sep 2025 09:36:23 +0000
Received: by outflank-mailman (input) for mailman id 1105954;
 Tue, 02 Sep 2025 09:36:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0Jg=3N=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1utNR8-0000FX-0y
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 09:36:22 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48c43707-87e0-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 11:36:21 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-61cb4370e7bso7709502a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 02:36:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc1c7a8fsm9150713a12.3.2025.09.02.02.36.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 02:36:20 -0700 (PDT)
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
X-Inumbo-ID: 48c43707-87e0-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756805780; x=1757410580; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7+/5Vl//tzLfXwVhASc1rt+01VD2kpJA+zviG5NglgU=;
        b=QeK50tTpRBApS/CRtHZx4izKbcTkyoahjXlEkl3hGC/uM0EmpnPSC8Yz5RoO37qTSl
         hLi2S6I+mfND87CM7h1dxP03ZXfa8oS4aeVY96uxmmZHyP56v0aWW4TRvEAXj+/lVRMx
         9TXTFYonVdjvsybGqXSUGahMJgM15sbdmlZoCXqhlXV8H+RcVMlMwgQt6HCbJT8rozcy
         PtXGB8rMFNWw0GYgG/5LeVR3P1TBwYCd1CQRR1iJgCJddd7zjKBXHIVnHvA22/OrJ2Py
         UFCTDABourOgc0xqM2tCGNX/Az+IF9oJd5yVdRI9PKGmjM9usflTJBdVZ6+lBQbk16BS
         OJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756805780; x=1757410580;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7+/5Vl//tzLfXwVhASc1rt+01VD2kpJA+zviG5NglgU=;
        b=rxPTkB8yxlxHg3bcrzLQ8T25uiZsrTMgmusPB3OY0wXxn1Uxk7sFD95EVghph4Tl8W
         2IWORmHBgi4CkWzrhb42KNRXWVMs2TWB0qKf+5olnJG6l2TDsy53wZxNszvDE7hnMVjv
         0K6Kgn/oVgJayaJ1MnbzRi5Sdv5JwVMTlRkaUNedcnRLn9WBEgI9yKOrGXuqe9dCM4pn
         P7I3r3Fp4wDRbwOV4OByC9fsauKZ1n0yU6X2Q+7BHG9hUT0O96d7RlxljCS8PccNP+p9
         8HAojLMFlKQ6WCJIjC68enQ3qCFLPM8dQjEkFZflFgdupl2LKUV1H6V13AL1IUkOxtlT
         qoBA==
X-Gm-Message-State: AOJu0Yw0VlpQZFN3S4ZZQ3uA4F///mMRBJ24ag2Pav6OV9K/tPrbZYxh
	8PQoU07yDpU6IKiiINKvgkRtp9oQsV8BIyn/us89lb7iJBm+rHEOPibQfvJhhUfNYg==
X-Gm-Gg: ASbGncvZjnH6FoN6qJKQtb8OUim4smfxB/5sEyKdx/a+pZvKMMcWr7CiNac292ibJRB
	nwMzIq13m53cBZsIR0PMYrqPQcL6t6JUtvdHytDg+wqMbV18BQlZ4aYC1dbqkl22bPMrBzfGJzB
	Xk3OJ6N1IOxflTij2ceMHHP+tw1B/MCIM/otkI6+N9POyxoR/969dUZMnoZTl946sDgDppnbNfs
	0nVtsu8BU8uoyGj+EskQkzwzTw1CNr/OsVWcyJx/HItsDdm9Xy8LWLlpzLC/IqnlGqXOQYCfaKm
	Uoj6xcnTBvsv7G8VrtIrYOFl9l0siNd4UgokMBWps0U0alEWincK6n5WE3CzeGuU1eNSTEdWF5y
	09qUZvMGZJKJXLBA4mRtqJxU8wLo0eFKgILgekylTczMHzm5sKsses0CZSIYC6fm3teU5VVvW7h
	zrsV8BO0cUzn4o36ip3A==
X-Google-Smtp-Source: AGHT+IEaHYJi0kFjAjlOkJ83/qBIQtlUsO7pJCsb0cQRnU9fsgY95z+j0TBUqWQPaHBm5bNcBQHa7A==
X-Received: by 2002:a05:6402:5212:b0:61c:7f48:c476 with SMTP id 4fb4d7f45d1cf-61d26988edamr9275667a12.3.1756805780626;
        Tue, 02 Sep 2025 02:36:20 -0700 (PDT)
Message-ID: <d2f16c51-9557-4185-a603-cb161ce1cf7d@suse.com>
Date: Tue, 2 Sep 2025 11:36:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/15] emul/ns16x50: implement emulator stub
To: Stefano Stabellini <sstabellini@kernel.org>, dmukhin@xen.org
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com,
 roger.pau@citrix.com, dmukhin@ford.com
References: <20250828235409.2835815-1-dmukhin@ford.com>
 <20250828235409.2835815-4-dmukhin@ford.com>
 <alpine.DEB.2.22.394.2508291237100.341243@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2508291237100.341243@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.08.2025 21:57, Stefano Stabellini wrote:
> On Thu, 28 Aug 2025, dmukhin@xen.org wrote:
>> +static void cf_check ns16x50_free(void *arg)
>> +{
>> +    struct vuart_ns16x50 *vdev = arg;
>> +
>> +    if ( vdev )
>> +        ns16x50_deinit(vdev);
>> +
>> +    XVFREE(vdev);
> 
> XVFREE should only be called if ( vdev )

Why would this be? Like free(), both xfree() and xvfree() are fine to be
called with a NULL pointer. What's odd here is that the uppercase form (the
wrapper macro) is used - clearing the local variable is pointless when it
is about to go out of scope anyway.

Jan

