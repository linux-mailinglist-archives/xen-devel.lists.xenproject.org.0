Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8F590C41E
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 09:08:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742749.1149611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJSwX-0001ps-0x; Tue, 18 Jun 2024 07:07:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742749.1149611; Tue, 18 Jun 2024 07:07:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJSwW-0001nr-TL; Tue, 18 Jun 2024 07:07:48 +0000
Received: by outflank-mailman (input) for mailman id 742749;
 Tue, 18 Jun 2024 07:07:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MUlf=NU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJSwW-0001l8-6U
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 07:07:48 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75a30120-2d41-11ef-b4bb-af5377834399;
 Tue, 18 Jun 2024 09:07:44 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a6f0dc80ab9so768436866b.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2024 00:07:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56ecdd63sm588842366b.124.2024.06.18.00.07.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 00:07:43 -0700 (PDT)
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
X-Inumbo-ID: 75a30120-2d41-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718694464; x=1719299264; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wmqHpjlrF/8EuIZ3+EMf7K0vzVJ3D8wKTPfD2B2kFDg=;
        b=fHJomjlFIf80GLwhU4w0uh4ENS1OwZyDEUPSnUZNLhxAxI0Igd+OLaZljdxQ2lYJPs
         l4/KlUm/MPGN1XwIy8XxsEmlCPHtTuwuu3DPf5pZY6jfUF3r9+9VESPKKnGYcyUhJUyh
         Js59JYHMHEt34B2fBsfFOD0YqdBfsteRaDqqAz+8KhHipLCfp9+DyC1EPeaD9ZhcDA+h
         xTmKToh+N8fnOWdi8N/6gaiNQVdBLViorbE8FxyFC6v+fYmK8XFO5y5YjsfhcN8asPtt
         5d4u7pv7/TDNo/qcgmSG1i9wZvTCACLfARAYdMbloXdIISEiktqrFxkqeJR5/5wClLUS
         SZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718694464; x=1719299264;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wmqHpjlrF/8EuIZ3+EMf7K0vzVJ3D8wKTPfD2B2kFDg=;
        b=tAXyDKaaBOA9yvPiYGGySJUn/aw8SFI3kzgHlXsOm4z69iVgYxAViszcdA00HIG0+/
         9tFQ+V6Es/Mxz/kD4uYSPGLFtjpIm9Bz3ISU+ZrKDy/jrW9PYHivkRLWHT2iargVj/DZ
         67XTCvbtLwhVHBRZQMGRItlpxp7Je46Dj0ommlKWK7lWKwCYUduvwOe1EveC499X2Dbh
         2NANUP+uwsaSKI/ij4nTaCHBnO6uBLUD20BlMfNhDLQee2o5JU9AblAlUN5C/tcGZuyt
         k6PudQWMOkD7nyCQqheymEi3/Jde4vtvfv0uX5R/cNTDecPLwInYPaalHGSSofWzh0Th
         s2uQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXuNRwDwvLy+RqzczYTwFJu/k1QO1y21QcARi2EkJOlg2AgxGCQmlSzTGcfgXtY1iL72B6+9zeiHqutMqDhpFULVuHX4s2AI0tVzktW7I=
X-Gm-Message-State: AOJu0YzJZTreKmFMPlECxFr2oJaaNjN3wxQHQwz67CAksyQsT/WkHIUy
	H8EpMFjk1b7zEzurn100FwsDBQLLXZR9nFpPYbt/U2IqtEWJUvCkrCfQWkJ1mw==
X-Google-Smtp-Source: AGHT+IG9qGgAvQORThwDkhdGNmFw9izjdFgu7MYYv+MqcOI9u6vrZ6CNzjiYrOQI50jMZCpbPU6vig==
X-Received: by 2002:a17:906:ca0b:b0:a6f:1025:8dd5 with SMTP id a640c23a62f3a-a6f60de24dfmr707771966b.75.1718694463722;
        Tue, 18 Jun 2024 00:07:43 -0700 (PDT)
Message-ID: <cc6ca257-4a1d-405d-97e3-f6ef1834435c@suse.com>
Date: Tue, 18 Jun 2024 09:07:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] xen/ubsan: Fix UB in type_descriptor declaration
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240617175521.1766698-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240617175521.1766698-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.06.2024 19:55, Andrew Cooper wrote:
> struct type_descriptor is arranged with a NUL terminated string following the
> kind/info fields.
> 
> The only reason this doesn't trip UBSAN detection itself (on more modern
> compilers at least) is because struct type_descriptor is only referenced in
> suppressed regions.
> 
> Switch the declaration to be a real flexible member.  No functional change.
> 
> Fixes: 00fcf4dd8eb4 ("xen/ubsan: Import ubsan implementation from Linux 4.13")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



