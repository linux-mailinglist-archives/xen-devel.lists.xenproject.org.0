Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4802E9F4E17
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 15:42:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859276.1271396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNYla-0001cd-Tf; Tue, 17 Dec 2024 14:41:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859276.1271396; Tue, 17 Dec 2024 14:41:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNYla-0001aL-Qp; Tue, 17 Dec 2024 14:41:42 +0000
Received: by outflank-mailman (input) for mailman id 859276;
 Tue, 17 Dec 2024 14:41:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pb9=TK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tNYlY-0001aE-VY
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 14:41:41 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06038481-bc85-11ef-99a3-01e77a169b0f;
 Tue, 17 Dec 2024 15:41:39 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4361b0ec57aso52854935e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 06:41:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c80601desm11318680f8f.90.2024.12.17.06.41.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 06:41:38 -0800 (PST)
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
X-Inumbo-ID: 06038481-bc85-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734446498; x=1735051298; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IGIiE5nXPSdxpWn1Ea/upPyLjrOSFuw1lO2GkhdBkEk=;
        b=HekXA5+FAAc18h5EObAS9Oxyx5bGekq4lnkSkYrqnyPiwufaPbYUt2Df/6CXV979l8
         dqmFTsvs8aS0FjovPOWI0W/aD6LnXMUEPk1CN29uOBkk9Fb1kzFOQr62+ITFltwjGmkt
         xHWhf374XLh/xMb1DweqamEqojPTYpW+XngcB53dzMTGnYYxjIWLfsd7HP4bqpCs9tJr
         BS9rfxe5NO6OZIW/OjyJOCsj4NnNHqS5FPht785T2yLLfxdlh2QUF7fOz06SVV3JTkCX
         mmuo8Hclz3xOyHX8CLIk0CsWKWI/Mwh0uWW5BPNLXkQshQHqsgMxd/clvnBOHyvMmxoF
         Vd0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734446498; x=1735051298;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IGIiE5nXPSdxpWn1Ea/upPyLjrOSFuw1lO2GkhdBkEk=;
        b=PU/ubGBGIcuQ4+FySKFRFP5VkbNSnwA802KQDaCjgURbvSTD+LxHs8k6F3sk9AHQuU
         vEC+qkZSugDIHAD+f3J1HsGPVQBUIw5/EGItUxNaJ0PJk3tpJLWPYf0fkKL4T+m8YXAY
         L2aC6UdUUxRRUtfcp86N/vsTPLw7Pvr3WzThOsGvB5AbDOTHpk6pIumcVjALEwvfpG7R
         3Q9hckaS5vCmRfgkGLOZEDEB6OknwgQMThcntD5w3dVcB4iTyqHYYYYxNBNCrjOIzMX0
         s3Iitp7mmce4XXRTXoUerMBoZFrpqCmFGITuMqdVD5vVXv2ieYTqA2B9uwE8OHEAvr87
         EoFA==
X-Forwarded-Encrypted: i=1; AJvYcCXeQwoCGmQsBl+vIhzg8hgL2wyBqZVdV+H+hMpgIDMuRkgOBULWlXVRGbRBQ2iRuay0hVeLUOGRWvM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzsVy95juAoeEVlWC+anhhppECVCasJ+glt1of+gRlrM1InaYZf
	6jJKrwm7lOAw7B1k7C12AvGlYdD0BPUlFuSfNz7Wt5WlgV9/NdhSq07O2JjlEQ==
X-Gm-Gg: ASbGncu6b+rvTmRZuLz+dwVOh1nHH852gqV+YbagN8DXGSizc/IQE7jL0i/3OeroeBk
	B4QXdTIV1Uyhp93nuyeyTjMd8wCVRCOFD1D4PlTyJYjqpgx0XvgKiMVqgXrSl1IaXViPMhdB0mU
	Z755gXaGIU11+/TKMqwt5bOMsEu0cLngrRtTZqYTh8Xao35YKHr52fR0xkKbCuPPgFoN4VvK32t
	W6v49NmYP/A01uSHSfEeg6wv2/tnnEkrV0U304SBnzYRcKZFXi8iAM5Q2g3TRoooLSzSHeWwaUL
	FYi/eU9q2GCMpX9iKdQ2GmZzcr7GUv8rhu6XrXeLIg==
X-Google-Smtp-Source: AGHT+IFcmM7MFVmVdHBt5xSpXewNEV6y+O/CCUwYClWubnSAvJsT44J1wEL+QADxh74btqDbY/BU9A==
X-Received: by 2002:a05:600c:1da6:b0:434:a746:9c82 with SMTP id 5b1f17b1804b1-4362aa26e46mr123041945e9.5.1734446498520;
        Tue, 17 Dec 2024 06:41:38 -0800 (PST)
Message-ID: <6ee25017-db0f-4928-a07a-89558035a3f9@suse.com>
Date: Tue, 17 Dec 2024 15:41:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] xen: add new domctl get_changed_domain
To: Juergen Gross <jgross@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241217142218.24129-1-jgross@suse.com>
 <20241217142218.24129-4-jgross@suse.com>
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
In-Reply-To: <20241217142218.24129-4-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.12.2024 15:22, Juergen Gross wrote:
> Add a new domctl sub-function to get data of a domain having changed
> state (this is needed by Xenstore).
> 
> The returned state just contains the domid, the domain unique id,
> and some flags (existing, shutdown, dying).
> 
> In order to enable Xenstore stubdom being built for multiple Xen
> versions, make this domctl stable.  For stable domctls the
> interface_version is always 0.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

As before:
Reviewed-by: Jan Beulich <jbeulich@suse.com> # non-XSM/Flask



