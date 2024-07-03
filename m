Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55435926418
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 16:59:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753178.1161466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP1RU-00082U-Tq; Wed, 03 Jul 2024 14:58:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753178.1161466; Wed, 03 Jul 2024 14:58:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP1RU-00080E-RL; Wed, 03 Jul 2024 14:58:44 +0000
Received: by outflank-mailman (input) for mailman id 753178;
 Wed, 03 Jul 2024 14:58:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzTd=OD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sP1RU-0007ys-87
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 14:58:44 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd8717bc-394c-11ef-bbf9-fd08da9f4363;
 Wed, 03 Jul 2024 16:58:43 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2ec5fad1984so75482631fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 07:58:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac15693e8sm104327845ad.217.2024.07.03.07.58.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 07:58:42 -0700 (PDT)
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
X-Inumbo-ID: bd8717bc-394c-11ef-bbf9-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720018723; x=1720623523; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kRw9znZlnI6jm8th1Pv0UU9ORD6y2czHbelRNdjt9HU=;
        b=ZtJwzKMhG/E8H1HRA8JO4ZZlbaMc7W1YXWAJrPbx/9gARYYgr3phyktrPwiP4s1mB1
         hQPLHeZXcHEkiN/bdpnx1xVtkY8KMLbKsv1cgz7lFmJ84R9mSb159pY6/ZJ1yKsnZJNW
         ph/Q3S+aZKoT21hGC7wA5ULBM+Onf9OTlVyFrT+v+i8bFucGsL8m26Pzz4tvCygn0Exp
         iud3uO1HtIdZWP0rGbbnP4T5OpC+/UcHnjXbrdfK+aN7gYsbWX6JtPZ5mn/T2Tm9VeK7
         5n4mTLo9FsJeey2SojyOSu4xwOyQGW5FBfYs3jt9Jstc1zWaHonwJiBtFI9LeIKOUUAR
         S80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720018723; x=1720623523;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kRw9znZlnI6jm8th1Pv0UU9ORD6y2czHbelRNdjt9HU=;
        b=sVNh1b121o4pwvBIPuXFfDnkLL/hiYnk3LCEG+EKU37W+nHOIWSDaq50ywVa0PSSEP
         M+AVsmV4ZPD4BD7+6pPz99qs/nUOjY3f5O2wDk3QSjuSM1W+HJB2Q/07dFP+NH92NiUn
         gO+46EyzJ8kfSodaULB7mIRrpwxOcLWpYniLb/D6q08TOus6Sv4CjjZFxT05wIYtDFlP
         ck3GPo8Evm+xiaopiDRu3th21L2gVgf1bBRx4VcCzNi2/go7kS48ZIyYMmTTxY8jgw0F
         r3ylUyezy2k1awIaJ464DsrdhVv0+zEzT3DDZUIyASJlLZ6nKxXPWy3iUOPp1iVaV7dz
         6tmw==
X-Forwarded-Encrypted: i=1; AJvYcCXF4FS+gIgMWWuD4folX8nHlTSZxBGd3St/FUbTndCB9Gbb2GB07lpVOJk+15fxWS88/JulG6oYtdmcVvfnU2AS2Qlc/jqnoMVdmU+h004=
X-Gm-Message-State: AOJu0YzNggLGHF4mjm1ZF2jJ4dUNPIWS0uOoCrwiGjuQS18raPX/qZwS
	p7aGhAYpGPl3K+osIxQVOMUd0yLjLPV3fmKYg9fod0mUzShUE3pbFq7t4rC2RQ==
X-Google-Smtp-Source: AGHT+IHMVPNS+DrQEvs7sPXifZKblKy/TMKczmf9s7RZLjkkAtwJ8HkERLwZE/GTH294ddEaIqdxfQ==
X-Received: by 2002:a2e:a5c4:0:b0:2ee:5ec1:1838 with SMTP id 38308e7fff4ca-2ee5ec11928mr103850441fa.30.1720018722726;
        Wed, 03 Jul 2024 07:58:42 -0700 (PDT)
Message-ID: <08a33c85-419c-45c9-a54e-1198304fc6a1@suse.com>
Date: Wed, 3 Jul 2024 16:58:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] x86/intel: optional build of TSX support
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240701082506.190941-1-Sergiy_Kibrik@epam.com>
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
In-Reply-To: <20240701082506.190941-1-Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.07.2024 10:25, Sergiy Kibrik wrote:
> Transactional Synchronization Extensions are supported on certain Intel's
> CPUs only, hence can be put under CONFIG_INTEL build option.
> 
> The whole TSX support, even if supported by CPU, may need to be disabled via
> options, by microcode or through spec-ctrl, depending on a set of specific
> conditions. To make sure nothing gets accidentally runtime-broken all
> modifications of global TSX configuration variables is secured by #ifdef's,
> while variables themselves redefined to 0, so that ones can't mistakenly be
> written to.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Btw - any reason you didn't Cc Roger?

Jan


