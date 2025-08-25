Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7B5B33C47
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 12:12:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1092900.1448500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqUBQ-0004b1-Ht; Mon, 25 Aug 2025 10:12:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1092900.1448500; Mon, 25 Aug 2025 10:12:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqUBQ-0004YX-Et; Mon, 25 Aug 2025 10:12:12 +0000
Received: by outflank-mailman (input) for mailman id 1092900;
 Mon, 25 Aug 2025 10:12:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqUBO-0004YQ-Bv
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 10:12:10 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f500af64-819b-11f0-b898-0df219b8e170;
 Mon, 25 Aug 2025 12:12:08 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-61c21e50168so3474977a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 03:12:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61c3174f5a4sm4741713a12.53.2025.08.25.03.12.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 03:12:07 -0700 (PDT)
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
X-Inumbo-ID: f500af64-819b-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756116727; x=1756721527; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RsZVC43IunFvyWbxaxDI9aVvWD2XCJWsTh0ftqEnnAg=;
        b=FFOoFgLXDwpd2I8X9NDp+9gyHjtCUFbO71203szUYfmHx4E5BIWJ7QoiSdn97IWDs5
         zcM26+GrqB/Ff+K9uzmM94KoPOWb/o7fC4xtn4I+GaL4+RkdfihkhOpYpIoEQQbKOInn
         Q0YNic8IQUCfrvfsO0PVVdGb+KcFAjRdhM8+OWaR4O7xWqHCI6S9Wa4enor998enZ40H
         39J6Zox6ouiZtxyvFUAq5/9NyNovyy74DOqzTfg5XqmrFxoc0InOUX0SIGyLuw+gSQ9u
         UfAia63sw7PsromgjY6X4SvzraGGeA0KgKynNXZuhB+KYg/BaurXkxoZJZHhds1PaK38
         QCnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756116727; x=1756721527;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RsZVC43IunFvyWbxaxDI9aVvWD2XCJWsTh0ftqEnnAg=;
        b=S64n5uHpgHv87Q+F1Id0WUoyqVgmo0lZvQtpO2TtqlYlK6FQddfVBxKUiGH8MqV7gj
         pSPnqZtWRc5UMvAZijD3vjac8Tegs5zB69xpIiuf2Yukr+SO9BKNjujSDoONDSEUT2kZ
         0mX0Nv+aJSFR/r9C4f7oi5/zelkeOEqDdCgZmXtfB41yiX3jhnJjEHKSdfeVnC3zf8v1
         omTrA1f6w4EB+A3vtEZZJJ06HP16z5TRsTy/BOJ2IDkjXpNT4anNoHd5/bQJnVoQyZSa
         NxK91SLsuv0H1vmPS6ANDdZ+xfYr+76YVHSmLkM1QAd6i1D7zgrtVpLZOX7pkUEYuVlu
         sPgA==
X-Forwarded-Encrypted: i=1; AJvYcCVJxlhTwVOB9ZT8S5B8IN1UExo2P+vagkSvgs2Iot2BxwlS7e4JC4mZTb8pFVZjEtyHYdQpIlDJLTI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YynjkMp8uHhf2QaJwGl5gz+UqLG9VDJBgkVQWRzH/FAxDpseBWJ
	kSURdUucoWAjcU0o4tcT6sS6yWJwCcI0rabOBIch5+goCNI8RtIIFafGrPre78tJBA==
X-Gm-Gg: ASbGnctnHAA2c4bYl15TeJksaq2SLBSEyRYYqtJvjEsLwmJ09Wo0ZWmTl2KX81JInpP
	cqklg/4CA0tEXcISUno/LeoEtADaRA3wSBTRWQO/KSFoiTFW+eSMgMZQWCmUNjdhUw1cFXlEWH7
	AzbRgXUBsoEnhpOSbNTzsXgBtH6YIFoW0knzM2fWx4Nliy+hIMeR3nq7xOQ+utwstWzJfGmFmBe
	2xjer3xsJntqNB0T5soeO+BQcTAI56JjZq/jGI69GDW60aP7q1UU5LNOMll3GtQNUr4PwaC2TCU
	E43DV7Plm7GrN3en5PF3jRURbPst67Byz2/lTtghsLxTz/zp59wEa2KD0Vl5M/3RHgNaiRX0chZ
	Q/QChghoZtEJpVsKDdlSNdR6kQ57F/XAw5xE2ZDIkXsjDjBOcqwgvorImVTUPORHM9YisRYllNA
	msU88yMeE=
X-Google-Smtp-Source: AGHT+IGHTMpzgCFmUauGDb8sL4/O+l2sAPc/6iQvCBVdedaN947fXOckR9MwAyWOoa9htkSy7DI+Rg==
X-Received: by 2002:a05:6402:51ce:b0:61c:35c0:87c6 with SMTP id 4fb4d7f45d1cf-61c35c09034mr5776489a12.12.1756116727295;
        Mon, 25 Aug 2025 03:12:07 -0700 (PDT)
Message-ID: <b7a3ae83-3136-4337-b45b-c075dcb212c4@suse.com>
Date: Mon, 25 Aug 2025 12:12:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] common/efi: fix Rule 2.1 violation in read_file()
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1e5a31fe588f58bd2b5c7835773fdf7899ff5511.1756047981.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <1e5a31fe588f58bd2b5c7835773fdf7899ff5511.1756047981.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.08.2025 17:10, Dmytro Prokopchuk1 wrote:
> MISRA C Rule 2.1 states: "A project shall not contain unreachable code."
> 
> The return statements in the 'read_file()' function is unreachable due

Especially due to the (imo wrong) use of plural, this continues to be
ambiguous. I'd suggest switching to singular and inserting "final" or
"main". Happy to adjust while committing, provided you agree.

Jan

