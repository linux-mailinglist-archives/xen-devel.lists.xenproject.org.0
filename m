Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAE7AD4F98
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 11:21:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011397.1389817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPHdP-0002UT-Hp; Wed, 11 Jun 2025 09:20:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011397.1389817; Wed, 11 Jun 2025 09:20:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPHdP-0002SR-EV; Wed, 11 Jun 2025 09:20:39 +0000
Received: by outflank-mailman (input) for mailman id 1011397;
 Wed, 11 Jun 2025 09:20:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5UX=Y2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPHdO-0002SG-2V
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 09:20:38 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54f86aa9-46a5-11f0-b894-0df219b8e170;
 Wed, 11 Jun 2025 11:20:35 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a52874d593so6140449f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 02:20:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b083abcsm9064790b3a.92.2025.06.11.02.20.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 02:20:34 -0700 (PDT)
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
X-Inumbo-ID: 54f86aa9-46a5-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749633635; x=1750238435; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RmmAk3ljw2xs7Jfo2z76cXMFwHIrLyQ23gotV90W91A=;
        b=JvcYuFha/8P89JrbpqeyklP/0FOsIE4cRp3boZzO1vbXLlN1gOk/isOVWFVgji4kEX
         I9sY4BeFMuRD548xT0IVxS1uG/bBgGzSfb2/KFn63iX7OFb0gXWZcYJFBko2bvOqXIq9
         i3B7D5OW/0urXIymBhe6B81vihugAAG9bwGOFyI+V7v5jPduQjMhqEvBZjxxb+IYf8SL
         qLM1uOJXPltkD7zpMmiJtz5bDDLCNLz5nKnvgcQgI5jW3hkPbTF49aQsGXovFrLh23Ex
         9m8bodIRb/eDjLDZyBNTP+PLy0AFAjZtelY8NBKk077hMfp1IE2sdMrrlcmENsEWtYzi
         Ok7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749633635; x=1750238435;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmmAk3ljw2xs7Jfo2z76cXMFwHIrLyQ23gotV90W91A=;
        b=Ou7QMQrX+bVg4TZqfsPnP9ZYv0cMhamSldi8yWFGt0A9FrMtibz17tEFM2sOKPSPFC
         BN42xs/nkxieOFQe7RMLAnc2RrhcOSadreigpayEphiBrDmxZpKrWwYyPnj6WN0BRgZj
         nAG2C7uMrgWNQB/Dr6U3bITvdP6fFESI3opW6cyG3oDz4vlENAX5plZNMkL4dzUI0F7w
         48Mo0RJCC/Z4ERf5Lks/A1oICuzwUy1IycTGXplz3xjZdSwgI3xPinAfigzlpQao8ols
         shaJ5ZLJSUmF0fXDWGV3GSBkVRvRWE/SJHjPFuccBxIX9dxEPsDfJuSJaGKWJmjs64f+
         /KZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzgO84V59sTQzz1Of6lvYPaPXKN2FIz4E7vXJQxzQrA3UtYx2unIlxgDgvIvKagWgi9OP+Sd0VrqM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzsZ7qjXPhT7DGVB7nQAYOBBbVlhkIshr2wfkYAkUJcQTKFj6W8
	PJXXIFuEWvtC57SOT4RdbS8+iij09aahDPy3pX3ZKqlqHSUSfl3LEhF7A8Y77QEG3w==
X-Gm-Gg: ASbGncuyNqbVazoJotZSDzIy7myW0m77k1iNF0WrlM0fJ4JHm1j7JtQVm2DzD1Lbx0x
	jtmIX+p/RA4zNOFrhNw0Rh1buGi1spc0ZWevOt6MutLR2Cc86XekZDCEF9DMmnNNzPdWA49NLnY
	1YbDJBJ87I2a3FpeD7Xh+ZbWle+dLQzoIKaA/kbCv3QPK4Ws2VNyTTkZUuFxh5k9BkYIPtz6PHX
	lxitsRkiYdUee051nBPHsVHzUka+BVg1mFCOysYGWqJF1t/xMMoN4/R468aSpPOpTJortZHAWyi
	jeYSEs/HrwCXFKD8uuoTXxV31oWCQzAFg6h0zKt/ouU2zqwvoQAu16fjJoGzG3wK5zmINP2CbHR
	SwE0GEN5QvpNv5bVvU2azHhJ70UeOutZ6LCVPx9S3a1lvD86ZRWLucecVFg==
X-Google-Smtp-Source: AGHT+IE0XkmQO2ozOglXdSorlrAS94jRzNH6FQCCpF9eM0+jXZ0teLS0oOv7L84TPhUONxKPGTxDYQ==
X-Received: by 2002:a5d:5888:0:b0:3a4:eb7a:2cda with SMTP id ffacd0b85a97d-3a558ad707fmr1768474f8f.30.1749633635200;
        Wed, 11 Jun 2025 02:20:35 -0700 (PDT)
Message-ID: <6213c0dd-2145-48a2-9e8a-8a949da5e866@suse.com>
Date: Wed, 11 Jun 2025 11:20:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/domain: fix late hwdom feature
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250610234105.1082890-1-dmukhin@ford.com>
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
In-Reply-To: <20250610234105.1082890-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.06.2025 01:42, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Fix get_initial_domain_id() which how returns hardware_domid and breaks late
> hwdom feature [1].
> 
> [1] https://lore.kernel.org/xen-devel/a4c860d7-1fa0-43f4-8ae1-af59b7c6506f@xen.org/
> 

Reported-by: Julien Grall <julien@xen.org>

> Fixes: f147ccf2 ("xen/consoled: clean up console handling for PV shim")

12 hex digit please (see sending-patches.pandoc), i.e. f147ccf2b3c8 (largely for
my own reference, to make respective adjustments while committing).

> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


