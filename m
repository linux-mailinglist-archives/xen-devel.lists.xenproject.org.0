Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6938B15B3B
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 11:07:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063589.1429295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh2lO-0004aG-41; Wed, 30 Jul 2025 09:06:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063589.1429295; Wed, 30 Jul 2025 09:06:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh2lO-0004YZ-16; Wed, 30 Jul 2025 09:06:18 +0000
Received: by outflank-mailman (input) for mailman id 1063589;
 Wed, 30 Jul 2025 09:06:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zSpT=2L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uh2lM-0004YR-No
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 09:06:16 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7003bf30-6d24-11f0-b895-0df219b8e170;
 Wed, 30 Jul 2025 11:06:11 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3b78127c5d1so2413272f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jul 2025 02:06:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-240497f9505sm52724255ad.46.2025.07.30.02.06.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 02:06:10 -0700 (PDT)
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
X-Inumbo-ID: 7003bf30-6d24-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753866371; x=1754471171; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ksWkcbPneZ/FWsJ3opxU1jQMA8bNWpiQUXS6WA3opfU=;
        b=bM6laFBjrme3NA8KQqXUGRo+g2z8gpzhd6HoUwOMQf9yGOMXyqGXBOA5c6motJH6CW
         5QgSuJFfk6B9Zenubi9umYUfh0a8gzlLzsXJ9hBPxAv5rE4wxhoAmt4YlOLwkt5kEgCX
         bjeCDFpfZv8RXSZ2rCtb+Kpoqq7PDP9phhzSU4V2+rPdfeiOshZYn2XuneYJSulpmxaW
         tW3fsFBbouNvSY8ckqiBt3TwNPmUam3bQpW+y+SP2bB8tFM8OPA7Xui6q+K73wWsr/7X
         NogbzkIbfw6YJ91UcoQQ581OE21Aq6jI+liaOZeH9okp/1FvQZQOfYF35AzrDde8pzFS
         W2ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753866371; x=1754471171;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksWkcbPneZ/FWsJ3opxU1jQMA8bNWpiQUXS6WA3opfU=;
        b=H50yS23gVMGRAzlqeaNmt5K5h4R9G4ok9FmkNa0uAUgrV3AMA9tpB8S/dH+pn9uR9l
         KlqxVNol+Yt8aZB6mdMzM+CJ8kw0qVT2R5TEcvDGjVqaUBuEWP8e6N2tSE2kqiDLGzaX
         vsOoLzQrd3FvXOg8+ZjrFO2zORjBooIGM1rBmXvJdmJsyQv8QWj+oybFTjRpv/MGBSQU
         /a0hwp2q/mKL2mgk+EeMoVFK8pQDF3MhthZHH00+AMCAS6NRM4iQrnKmJ8//NZ3irz52
         I10itJDOYVT5sTFFTAxi49PcVA91C0hK7KtG2fZW0hpSTp5JvyA/Vb2GyWA4BXFY6yTK
         i0Ig==
X-Forwarded-Encrypted: i=1; AJvYcCXIn4N81gh1KWPldblHHWrMp9vAtXtR49YfAjWLugvNVgMlnY/loXIAiaqAagDAL35UQuukNsi2mKs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxS01F8m+8JOTL5tTrXNSz5PQGmuNiu7ZOU9DpJzBQthOItof1p
	Bj4Bin/1dJ63VuYgxr2ZwiKhqw1vkNhTl9XOpGSsTZShuLDD2uh/xaDC9CivXA58og==
X-Gm-Gg: ASbGncs04sWkV1rqfK+jCnKYvlSZAqUF7pdin2wsqkSmz+3EDiwnyO0XVIkLMBvOKSv
	kLBf73XXViNahNWSEnnI7nZoU6pOHGOwQz/i86KAb4Jm1zgrelXpygr1wt7lgNXqa/hx/xec4dT
	N//Sjw46AEJHTid6FeRVFxqFkF5yO3zGNMP7m9/UzD1U4L3++eCCfRQtL62wNJMaKKZD7Y2Fd9X
	klTf5FRug8Y/y5Z8u9tMD41swjjxKliuF6pwQZ8w1KtV2mgq/CEcGiJ2WKxmu7p/f11Fp6PMUMA
	s3M4UQmCjfJM1QcW0cNmcB3cAivyJHg5PdutUMhjwmUVX7S9B5nxiEogJnT460zSP7G56zaNnP1
	8SrWi4hwrui7memHJaOtoPrhMIpGI+Z6kyJFNme2Th+YKWIDxeUIdNRBN6qRKg6cNQh2z2A6WtV
	3wY8b1dhY=
X-Google-Smtp-Source: AGHT+IFPodcGPI52AB6vZGW7HnZ/caZj7tuw0FOjHgF1kUdiB2fJa7KnZOKoyK0UzdkIgHlesXoBSA==
X-Received: by 2002:a05:6000:2586:b0:3b7:907d:41c with SMTP id ffacd0b85a97d-3b794ff155amr2006910f8f.35.1753866370863;
        Wed, 30 Jul 2025 02:06:10 -0700 (PDT)
Message-ID: <2485e233-77c2-4b82-87fc-5357dcb3c94b@suse.com>
Date: Wed, 30 Jul 2025 11:06:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/irq: Delete the pirq_cleanup_check() macro
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250729223110.3404441-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250729223110.3404441-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.07.2025 00:31, Andrew Cooper wrote:
> MISRA Rule 5.5 objects to a macro aliasing a function, which is what
> pirq_cleanup_check() does.  The macro is an overly-complicated way of writing:
> 
>     if ( !pirq->evtchn )
>         pirq_cleanup_check(pirq, d);

The way you word this does not in any way appreciate the original intention
behind introducing this macro: It wasn't to write something in an overly
complicated form, but to make sure no call site would mistakenly omit the
condition. IOW ...

> There are only a handful of users, so expand it inline to be plain regular C.
> 
> Doing this shows one path now needing braces, and one path in
> evtchn_bind_pirq() where the expanded form simplies back to no delta, as it
> follows an unconditional clear of info->evtchn.

... this one place you don't need to touch is now becoming at least close
to a bad precedent.

The code changes themselves being all fine, the above is not an objection
to the patch. I'd much appreciate if the description was re-worded, though,
to take into account the original intention. And obviously with the original
intention in mind, whether pleasing Misra this way is actually outweighing
the (latent) risk wants (re)considering.

Jan

