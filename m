Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 098F9A717EF
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 14:58:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927836.1330591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txRHE-0003Kh-9b; Wed, 26 Mar 2025 13:58:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927836.1330591; Wed, 26 Mar 2025 13:58:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txRHE-0003IY-6U; Wed, 26 Mar 2025 13:58:40 +0000
Received: by outflank-mailman (input) for mailman id 927836;
 Wed, 26 Mar 2025 13:58:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SgUP=WN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txRHD-0003IS-2M
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 13:58:39 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a3c9b45-0a4a-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 14:58:37 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-39149bccb69so6008008f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 06:58:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d82e835fesm2976965e9.10.2025.03.26.06.58.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 06:58:36 -0700 (PDT)
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
X-Inumbo-ID: 6a3c9b45-0a4a-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742997517; x=1743602317; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aX3BvjpLYZFBsAgHIOw41C81sxLWcztG5nPAt1XiwCk=;
        b=MJV0S535cyVRsC0MdxmCVGAWjjr8QJXnRBWtmccpsrQCvy8WN2CiUPLQ2bXtyHLklm
         jaZHOtvoEi5uZuGpqQgiBERzck9AyKocpnb16zDducfiaQQFX5riU7uyl/DnIxVDebo1
         x4NntzV8E99YuzYb1USZmM2O+IAtJ7vuGU81RLc9e+kc/AQ40pd8mp8JFbKJUzsu8RyQ
         r8h4P0A5GGu0+KHeU1k2xy6nSaEXmEWRNsZ0fYkIj4kVtiJUqu2WMF8ByFHDCj+UnF87
         tviB42xJDlC2PSccm7mViBSpquB2pynHRgqwZHTCg09zmpBNkCptCihS2SgpEptELnar
         cgSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742997517; x=1743602317;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aX3BvjpLYZFBsAgHIOw41C81sxLWcztG5nPAt1XiwCk=;
        b=ZIIk0C6+10n0G6V4pqMdNI7clWplIucZV83g0fbZ5yAXbJBDU7pOaKXtlJeuqrS1DL
         Nv+CIgrZUAMSCBcGFluOo9QrW70gAa8op1zv8la0qFG8MWe6veMKiGeuGa7ydjEgw5OB
         VyK1v/aS3JXcvI4DRCEHD0mXQeylQc50e74HdvjfxgPVpJAOMpyZz3xIdBmCKYUz7KjM
         MlnzI5YQ8h+eQl+xth4DSCcJ9SUwlwrurutPhEZl1O3VAVOWJzUB01XcxZENxLPKloKl
         cTyYk60JZXCmYwHbas5p76MSfcWiZjJcuNmByf24Ad3Xhu3HRVgn8b9YvXhSZsbuDRrK
         XU7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUNR587opG5e74rQfmz1rPBWjd6gCpTbSwu/3spJN6pmuX1BxycRYWA+9jR9IqZJE9i1su/tZqy3dQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzNDuCejPFmSRGpJeAlRbGSexi8NMvnVFH8EZRVnAdLTagbBzvi
	hbggOWKOyXAnLneOggU3tz5+aTWLVCU7PMmPbs/Ib17IYsLWoQfprsq01H4LAQ==
X-Gm-Gg: ASbGnctJppeOXPOJS39rKBYpNMp3uiWgyD95BMu7G4H1ynRK4c4mn8p7u7B/qI6dN9F
	sS/y/XHpBzuZjmBbqt/hjCNte8KObDBbWYKPQ+YlKURu6cDwFpcVr3SqFEsDF8WjdOTGg0yFagy
	MvhBR7YT+x7bkABSRLkOqP9tYd2qjs+Rrv4M9esIHulAXd8+ip//LbShu+Ghi5k1oqMrVOPSXH/
	D/Wy0jx9IQxi2itGt8pjluDWBufq3rnq70JsIygrZ2HNaf0ZbU6A2qfEOkB+5c89TFXTwqEnRFB
	Zl/yE8Uj2o8k4W4uk3ylclTZsSoygYyxNweBMjlM20qdvNahP1l/evUjW6sFBrWgDTQQZbFKtdH
	vHhiYJartKGiO+YSwQ6tkheoY5KbWOw==
X-Google-Smtp-Source: AGHT+IGj3fZIsIX55znbsulSqicDpGDSFLsXYgJDbZX3a5Yeo10UwYKvWPY1p0sErpS2v07BHyZprw==
X-Received: by 2002:a05:6000:1f87:b0:391:2ba9:4c59 with SMTP id ffacd0b85a97d-3997f93988amr20128056f8f.43.1742997516902;
        Wed, 26 Mar 2025 06:58:36 -0700 (PDT)
Message-ID: <6a322685-d5eb-49b2-8aab-3e03eead1553@suse.com>
Date: Wed, 26 Mar 2025 14:58:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/8] xen/console: rename switch_serial_input() to
 console_switch_focus()
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250318233617.849903-1-dmukhin@ford.com>
 <20250318233617.849903-6-dmukhin@ford.com>
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
In-Reply-To: <20250318233617.849903-6-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.03.2025 00:36, dmkhn@proton.me wrote:
> Update the name to emphasize the physical console input switch to a
> new owner domain following the naming notation in the console driver.
> 
> No functional change.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

While I don't strictly mind the change, I'd like to point out that ...

> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -511,7 +511,7 @@ static bool console_check_focus_by_id(domid_t domid)
>      return !!d;
>  }
>  
> -static void switch_serial_input(void)
> +static void console_switch_focus(void)

... unlike the description says, "input" isn't reflected at all in the new
name.

Jan

