Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F90992F33
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 16:28:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812091.1224803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxoij-00022S-5o; Mon, 07 Oct 2024 14:28:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812091.1224803; Mon, 07 Oct 2024 14:28:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxoij-00020i-3G; Mon, 07 Oct 2024 14:28:21 +0000
Received: by outflank-mailman (input) for mailman id 812091;
 Mon, 07 Oct 2024 14:28:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mBo3=RD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sxoih-0001vP-GX
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 14:28:19 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6504121e-84b8-11ef-99a2-01e77a169b0f;
 Mon, 07 Oct 2024 16:28:17 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a995ec65c35so111246066b.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2024 07:28:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99525346b4sm164159166b.124.2024.10.07.07.28.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Oct 2024 07:28:16 -0700 (PDT)
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
X-Inumbo-ID: 6504121e-84b8-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728311297; x=1728916097; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mOFJP3SNRaQwpw2JZooN/AnokeTbtqrd1zcnTTIB/Mk=;
        b=EeI5V2sp0gy9oJlyDukiUgxJKdLPYyT6Yxly3MP1S97VkJhDcxB7uIKaPnpT78gPV4
         ALFv8rzXo+iayXZkzhFG1BC6kB8d1y4VgXVmr13/p9qi42iOtnRn1FxyUiYgza9ytnSc
         /pvmGpZ5P0nr70Gj8vH1yp8i+dQr/6qiuzvOw0Y6uJgkSJCnuk75lqTfmTiohRMLTA74
         /jdUXauuQ9ToHlCBa5vd7rvoqgKqqMsvODSLWcp+i+FbTRRBYG6EBJuhkZeLvIhyIU80
         /RUe8V7twyIqjY6gmuEdk1BSPMnhaHWaULtHTTDoYw9Lt1hHzaiyNHnI6uyRqjkAmcKC
         qFag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728311297; x=1728916097;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mOFJP3SNRaQwpw2JZooN/AnokeTbtqrd1zcnTTIB/Mk=;
        b=D4YfrfqWC1hHtQZ4fdASmk3um86AutIk/YCzE25iq5Zn70Q27Q16P+BDHtofhqvJsO
         x+8thWPm7UIr/kGbieI4PtfuLGV4azjjSGR0T5tC+Jspg9SUM0fxBxI97phsfS+sGXFn
         mfL2h1czKVPvCGUWxdNI4BIBJnKiC9YbUjJi05yA7s15f4SuOHWBQNH0RJcoHKfI41iR
         DL9ahGjr1dgB8j60b/IIr74gBKthjDUzdIJXvLH0k5lU9d2YgQ9+zwalZTGDPxvFEjzg
         k8lg3/ITIWQWJDFwkU8ocrenVLIaSJH6K2PJq8z0v3wsO1cawHVinmIxzQqLzqg/7AOa
         fWYg==
X-Forwarded-Encrypted: i=1; AJvYcCVn7yaYg0UJ3kjontj6N6v8COAKm0fQbrnGsxoO2KUvUELoEJN/26c/OB5/uw8GlK+Sxgn+9Lzjx/U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxTtBaedTiC8k/a8IWtqeyXBHPQKCNBJYjKPFNcm5fCXapbLjPf
	vXmmEFUri7BuvlYewuRlSIcFPH1h+aKpeiRnug3gBz6levEcEFCc/Ywu7ncBB01C2WWix7d2lX4
	=
X-Google-Smtp-Source: AGHT+IFaGu/kOnvA1iw/mPJPo5u6+ziQTk777SZOLyK9maRGbVvItjyWpamVkBo1AnpEoyMPwcV9zA==
X-Received: by 2002:a17:907:36c8:b0:a8d:43c5:9a16 with SMTP id a640c23a62f3a-a991cede585mr1313025966b.6.1728311297166;
        Mon, 07 Oct 2024 07:28:17 -0700 (PDT)
Message-ID: <d6c0cb7a-5a71-4018-abe1-4ed81a1da71b@suse.com>
Date: Mon, 7 Oct 2024 16:28:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 2/4] x86/emul: address violations of MISRA C Rule
 16.3
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1728308312.git.federico.serafini@bugseng.com>
 <662440bc082fcb91ad9489999add02fc71416d45.1728308312.git.federico.serafini@bugseng.com>
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
In-Reply-To: <662440bc082fcb91ad9489999add02fc71416d45.1728308312.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.10.2024 16:16, Federico Serafini wrote:
> @@ -457,6 +460,8 @@ int x86emul_fpu(struct x86_emulate_state *s,
>              case 7: /* fistp m64i */
>                  goto fpu_memdst64;
>              }
> +            ASSERT_UNREACHABLE();
> +            break;

"return X86EMUL_UNHANDLEABLE" like is also used just a few lines down
from here?

Jan


