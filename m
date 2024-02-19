Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 547B585A62D
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 15:40:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682933.1062193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc4o4-0000Vb-C4; Mon, 19 Feb 2024 14:39:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682933.1062193; Mon, 19 Feb 2024 14:39:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc4o4-0000T6-99; Mon, 19 Feb 2024 14:39:44 +0000
Received: by outflank-mailman (input) for mailman id 682933;
 Mon, 19 Feb 2024 14:39:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SL20=J4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rc4o2-0000T0-M7
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 14:39:42 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b72dcec7-cf34-11ee-8a52-1f161083a0e0;
 Mon, 19 Feb 2024 15:39:41 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-412698cdd77so3674615e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 Feb 2024 06:39:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p18-20020a05600c359200b0041256523bf8sm8848960wmq.31.2024.02.19.06.39.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 06:39:40 -0800 (PST)
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
X-Inumbo-ID: b72dcec7-cf34-11ee-8a52-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708353581; x=1708958381; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Eg46NAymx8dIIJL3V+k2/dbUTTVI5beeX6j3e+DHUJg=;
        b=PgbKG+UxiqhBfjbDCFKVx5+AQnQBvWsMV0fVapUEVOc9T4fb1ILic8JzG+BX05YeHQ
         TWIuk/anHiOOSK69+8oCEv6le34WYIfcdbQOHHnSjdR+FOIljqQkTwBoqzjkMZjIdrff
         AzvVMZ0nZKSVnQucILkyd0Ju4/H07pxHyXBSs78/cc1Rie9vYz6D026sCc6pYBvCsMa8
         tHGbCx64lgXY3m9AXKmu6RzUKbT5g8u1S2xXXCGdNFRoCrDRGqjUovChbvkcYr8Q3vDi
         Rtl/jseUgfph55cE9Io/QBmgakIXdM9JhUFigv9wy0ppzp71uO1a0PpHzlYjfAYALJ9N
         vwWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708353581; x=1708958381;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Eg46NAymx8dIIJL3V+k2/dbUTTVI5beeX6j3e+DHUJg=;
        b=uOpJKy0fje6aAYtRUMFCSmXvw5rx7W8y1HgWE+XMEE/bkWyOtQLOB/+FWFiz4DWJ0r
         guLa2RIl92CRGoupJV8Qk439vWhjVL4pMCkL38M/zO0BKagbrw88nnvkCAG5DAvor3rJ
         t8Ms25YMKiud2oF7zyIBIUgG5vKOBUvlsXJ80Gs7NV4rcczaXv0JQJwZptTMJ+PF9jAP
         kVlGUV4YJlSwc3xZpZhp8Oi25yjceo/WpiDtA4XyUmJ13Qv4qeYKNm39qkZHXJMtTJ6L
         ionFnQHsjAV7TyRK/oRS0bd6cy/8WMK2VmUxz8VpdRNPeTd6EhFa3scx3jpSZ6nIfBo4
         52Ug==
X-Forwarded-Encrypted: i=1; AJvYcCUT/gki17Ak1OUvkQ9umyJCqKEOGbzgeWwajcdPqfOYR5dda45MRJaGhQUxAPKmJbfDFEvOgpTl32aRII6TmYAmaKNxh4yTdUVA01RsQqU=
X-Gm-Message-State: AOJu0Yy2e/JNIzbZ/6zSS6gRnqyoOvWdzVSz0DT04zHSrxBAKGUanXX8
	3qYpT3vf3t6AhyOeaKzSHchRiSju2RmIt7+kPs6XiAGZMVq03EufBnb6IlS3Ag==
X-Google-Smtp-Source: AGHT+IHO76xhLBvmz43qHToAPze/ftWK/H0MI8HvorXPID5KWU/GT7d4+o/luhmJHQT7UhtnA7aO4g==
X-Received: by 2002:a05:600c:1c1d:b0:412:529f:934a with SMTP id j29-20020a05600c1c1d00b00412529f934amr7463079wms.19.1708353581025;
        Mon, 19 Feb 2024 06:39:41 -0800 (PST)
Message-ID: <9af4dd5f-771e-4e43-9e04-a393a2cdb746@suse.com>
Date: Mon, 19 Feb 2024 15:39:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] xen/hvm: Move other hvm_function_table booleans into
 the caps bitfield
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <20240206012051.3564035-1-george.dunlap@cloud.com>
 <20240206012051.3564035-4-george.dunlap@cloud.com>
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
In-Reply-To: <20240206012051.3564035-4-george.dunlap@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.02.2024 02:20, George Dunlap wrote:
> @@ -144,7 +144,7 @@ static bool __init hap_supported(struct hvm_function_table *fns)
>  
>      if ( !opt_hap_enabled )
>      {
> -        fns->hap_supported = 0;
> +        fns->caps.hap = 0;

As you touch such, would you mind switching to true/false instead of
1/0 at this occasion?

> @@ -3000,7 +3000,7 @@ const struct hvm_function_table * __init start_vmx(void)
>          vmx_function_table.update_eoi_exit_bitmap = vmx_update_eoi_exit_bitmap;
>          vmx_function_table.process_isr = vmx_process_isr;
>          vmx_function_table.handle_eoi = vmx_handle_eoi;
> -        vmx_function_table.virtual_intr_delivery_enabled = true;
> +        vmx_function_table.caps.virtual_intr_delivery = true;

I'm unsure about this one - it had "enabled" in its name for a good
reason. Then again its (somewhat more involved) derivation from
other capability bits (and a command line option) isn't fundamentally
different from that of, say, hap_supported. Hence I guess with the
other item taken care of
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

