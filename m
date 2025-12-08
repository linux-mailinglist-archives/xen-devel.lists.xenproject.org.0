Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF14CACA45
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 10:25:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180297.1503505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSXV0-0003c3-5F; Mon, 08 Dec 2025 09:25:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180297.1503505; Mon, 08 Dec 2025 09:25:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSXV0-0003ad-17; Mon, 08 Dec 2025 09:25:42 +0000
Received: by outflank-mailman (input) for mailman id 1180297;
 Mon, 08 Dec 2025 09:25:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSXUy-0003ZA-NP
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 09:25:40 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc783f8a-d417-11f0-9d1b-b5c5bf9af7f9;
 Mon, 08 Dec 2025 10:25:39 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-42b3c965cc4so1930010f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 01:25:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7cbe9070sm24301825f8f.7.2025.12.08.01.25.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 01:25:38 -0800 (PST)
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
X-Inumbo-ID: dc783f8a-d417-11f0-9d1b-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765185939; x=1765790739; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aP1D+R/GRdoPWvf3Nq8tvD8qDup3udkssVSCwcGTRIs=;
        b=LWu5rHrxkXYDiPWzeNVAJcG6klaLmA4R8JzGdNd27PW5Uw04yhOuygD5IDVBGQa0i2
         BR4ag4uosq5E5vepa8HrfEf7aVJ9jGWkw8Kmlwqtp+Hg+MkemMFpfT2RMIM48XsNzcph
         VGjqhJO5f9qXu7krl1kkxTTRHbG+rIqQ42NArjb7yTUQLSTAhIB86IYdJ9yWK1Ars1/e
         uIeST2WXBjtMjvkgv9rR915y9JsAP3YRv4EqyJL9hhDupXztOkSCYs5ZOhxPgMRObBEb
         sZWX3vM3dAF6A0YTF+Vfxv5R/z34mIDMWEVty2nk4EyFAqib99FEXFlTeugkl6iCo6JR
         HdjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765185939; x=1765790739;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aP1D+R/GRdoPWvf3Nq8tvD8qDup3udkssVSCwcGTRIs=;
        b=dNbvVdf/c74IX1sC6oEGsLIAmUHLBZzoLt+jf0ma/qnMNGP1pMITV3+HA1hJBn/W8r
         Y1K+tZJemdrvqKKjsfo74TLtVTpoReg8fLWgcuay+LnHiThwKz0zR0I2W6gpG5e98FhF
         AiMTXwXgZ0f+EBTuaSJSDfJWscNNc2a6YYzCgI6EWAv0e4m5o10QUpd7/nmZbh7mt+OX
         bJTUGUO9Oh/NGGm9zFNbpNT+FeGVQkxNjudfAxYfcYroiT/muqImfTMpFp3TgA9CuMPq
         Ck2T2HN6DWEa7sGwKVSAJOI8krjjNZBRp7YKI8Ek23Y2D2iyUfTcGxUnfT4KSZHkxgVK
         OFWg==
X-Forwarded-Encrypted: i=1; AJvYcCU9IQD9U8LFdKxWVuvmmvMCou0H+DrHWQVumz6dtQsZAtTi84mDqN+qcsnLNiM1dy6yZVpt8whX5a8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5VUyOtc8ECUu0fdU4nfu4TXp8RW5J7A5gpDgnD3ID0MoObKBG
	BezjbZQJuBkn+tDSCoPTWQNlb8AMRuYiAmplh8pcPRREdhIkOj1huRcxn74QH2dy9g==
X-Gm-Gg: ASbGncvsgyiRcioJb+oUI5a/T+FDNg4L82pBRzjqzRgoLSbRYJuSxuO1vhRwz/fYw+u
	ZHbrcaXYqan+KjUcghMq8Sm1hBmKQokyG31YHz2iQekL/XBKXNGAp86h09FY9FSeAOfSCMhautX
	BXcHgZ5f0U+S1cbDlWXm97RVBtL8QRFUD7mVN0KQzlSOwwT5kQ3peQcq5LVD18LkIem6qrG2qlc
	rk0sBy7/2pPVH+VmDpjxoU3T3y+3pffgonyDNyaawGo0GCsYHnKQ1ZrinVZ0Rlu1WNX9ddo5aQV
	Y7A0eAz8tskiyz+bqSWryB4vX78Mv+uG0GU3T3LrNU3y7/3gLFEfnCPuenfaslaZyXvcrA4uy9B
	g3bBeZyE7LO+h39zr9wV9wng3OxVJCP42mg1P36gZa8LjrkcZk6iyIkUaawnkcD/kudmdSVe6zL
	E1Gu0X3eaefWRFCcP618CoIZBRAh2xyOk62hOaagpnidk6/+6X3vRYq8luzDyF6IknMV02ddwUl
	xw=
X-Google-Smtp-Source: AGHT+IGY2emwMtsTJ+eGGw0i2uzNKsfTyWKXjL7M59/vxPyPEilj/aEsG6E/a7LpFYhR/moRDM7cFQ==
X-Received: by 2002:a05:6000:40de:b0:42e:d669:9e84 with SMTP id ffacd0b85a97d-42f89ef1a08mr8732003f8f.29.1765185939191;
        Mon, 08 Dec 2025 01:25:39 -0800 (PST)
Message-ID: <7d019929-24df-4523-9817-6c17017c2320@suse.com>
Date: Mon, 8 Dec 2025 10:25:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] x86/amd: Exclude K8 RevD and earlier from levelling
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251202105710.1472927-1-andrew.cooper3@citrix.com>
 <20251202105710.1472927-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251202105710.1472927-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.12.2025 11:57, Andrew Cooper wrote:
> Between RevD and RevE silicon, the feature MSRs moved location.  This property
> is highlighted by the suggested workaround for Erratum #110 which gives the
> two different MSRs for the extended feature leaf.
> 
> The other feature MSRs are not given and while they're easy enough to figure
> out I don't have any K8's to test the result with.

I can see where you're coming from, but shouldn't we then first document those
extremely old models as unsupported in SUPPORT.md?

Jan

