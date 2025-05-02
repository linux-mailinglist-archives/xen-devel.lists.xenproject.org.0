Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABBEAA6C09
	for <lists+xen-devel@lfdr.de>; Fri,  2 May 2025 09:50:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974453.1362309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAl9k-0002UT-El; Fri, 02 May 2025 07:50:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974453.1362309; Fri, 02 May 2025 07:50:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAl9k-0002Rs-A1; Fri, 02 May 2025 07:50:00 +0000
Received: by outflank-mailman (input) for mailman id 974453;
 Fri, 02 May 2025 07:49:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XN81=XS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uAl9i-0002Rm-Ul
 for xen-devel@lists.xenproject.org; Fri, 02 May 2025 07:49:58 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b036cf7-272a-11f0-9eb4-5ba50f476ded;
 Fri, 02 May 2025 09:49:57 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5efe8d9eb12so2679822a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 02 May 2025 00:49:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fa76f3b9e6sm853190a12.0.2025.05.02.00.49.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 May 2025 00:49:56 -0700 (PDT)
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
X-Inumbo-ID: 0b036cf7-272a-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746172197; x=1746776997; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nVp9OgJINH32GLcw38xnfkr6nqklHhiDmMM9ojEBDJs=;
        b=bH6nluPtx6ZGqt5S6HXt9qzgbEOSyvdRu6/Vu/n9RmuyehVu85u8v9SMBoN60tmHdX
         kj6WHNK17bJpDc5eoMI5liz2P6+WcA4adUjbg2Z/NVfxIKC7/IlMdqmcoy0W1Pi1ch1F
         v1Ch/0wfBTygEjqjO+JzKw9H2XWGUJRTE35tCFaKi5kAANj1tGEe3GH1tdL1QkgQkCH8
         gMyVTFHRGuB7K0+bZsmT8cwzKzOGhyW41c7dLWwtJtwZ5MVQaSfQOtodKsZlTWZ/2kTG
         ZB7KMarCYWRuMf48vU0QMrSFd2zv3aUEYcMDS+gDSjMDhpxamxvmWs1GgMxaS+QjYRJ5
         beUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746172197; x=1746776997;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVp9OgJINH32GLcw38xnfkr6nqklHhiDmMM9ojEBDJs=;
        b=Rq9lUD3dYVuTk7LwI5oHiIL8zKkrw1JiAyo/zYZS4geAfsjim5K8SwedTgukbFPfoo
         oc1mT3FPbGrxOg5GSxemnd9rfrOWA8kLYVZ/NLuCVUCMiFLRkd5XHfxzSITDMQXXSXZ7
         bHsfQaLGZluDyYXkvsX0FedozJwSey+pSHOQJF0KIrGK5RsiwdR+9UhQIYqGNtTaCKPn
         RvpPE6qEyDwAn/QDC7YjpmW3WtPRACR4sRWN0meLTzDHC0CYD4bH6SLG3QwChEqNTsAa
         BIzF7dMpd2+B04P1ILzAQ3wGPmE8uypISiXh5msG5gWhnWtUojtLOmDTuS2PoDDmoPh8
         McGw==
X-Forwarded-Encrypted: i=1; AJvYcCWvn2HbX7+955m3Jf+Vw+1fu4Ue7RnmarH4N2+SBb/CpnqmUmON13ZmtYcXYPPjZ2M+9tB928Vp/Aw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw4Yji1vuxH3yofv0gG6Fs9LGN9yySsiJX/Z7tlD11uFRw+NUWZ
	migYCQlaa2fT156dVnNaBcvQCNjI4PNPjRLAyTKdHktpmRJwEwZBBpj6+yQsaQ==
X-Gm-Gg: ASbGncvFVy1HNrb+En2vV56iuX/zsPCjW1RPstDoNs52/oNtzl4t//RDnOp7uZzzpoJ
	zE+KKnv41ZxPzUL+YHm2oAjl/2AJ4aKfBcb39Fis2z3dDYCOAmazuq67uvNnj8hAHv3w2Hu3WPq
	fVnPReKigvLVKSZyh1TT7QROcJ45SxvV+Xe8EeApuOHOulae7+ypCyYCopN9rYcYTPC69f3ZwPL
	fgHSuWDYM4ZeNEbcGBwaEkmEBBWLeBP46jFXipyOKmzpruxaO+pNlftrluXmUmr0NikCg3R4dxn
	V4985NBqJuDbgBzqUIFx85KL6SXQO0SyU3b7Ng61fyzTJKukvqJoADkgmocVKbr8OMKecs9b2/m
	spA//01UGF1k4hKHepZSfibUVCQ==
X-Google-Smtp-Source: AGHT+IHuhog1hPuJBIOfPWOpBYi8z84Qif/TB8q9HsyPM861/M9qCURNAWhm2K2lULZokhZsmd9V4A==
X-Received: by 2002:a05:6402:2685:b0:5f8:d4bf:e663 with SMTP id 4fb4d7f45d1cf-5fa77fdc49amr1276416a12.2.1746172197144;
        Fri, 02 May 2025 00:49:57 -0700 (PDT)
Message-ID: <c982c724-b705-4dd1-8225-59817efece84@suse.com>
Date: Fri, 2 May 2025 09:49:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/vmx: Fix label name in vmwrite_safe()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250501230834.759523-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250501230834.759523-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.05.2025 01:08, Andrew Cooper wrote:
> This condition is called VMFail(valid) in the SDM.
> 
> No functional change.
> 
> Fixes: fc3db01db6fb ("x86/vmx: Rework VMX wrappers using `asm goto()`")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



