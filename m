Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE64799C0F1
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2024 09:16:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.818449.1231767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0FJY-0008C8-HW; Mon, 14 Oct 2024 07:16:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 818449.1231767; Mon, 14 Oct 2024 07:16:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0FJY-00089k-En; Mon, 14 Oct 2024 07:16:24 +0000
Received: by outflank-mailman (input) for mailman id 818449;
 Mon, 14 Oct 2024 07:16:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9kmr=RK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t0FJW-00089c-Lp
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2024 07:16:22 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3640d00b-89fc-11ef-99a2-01e77a169b0f;
 Mon, 14 Oct 2024 09:16:20 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-37d49a7207cso2469419f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 14 Oct 2024 00:16:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d4b7a05b3sm10682595f8f.76.2024.10.14.00.16.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Oct 2024 00:16:20 -0700 (PDT)
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
X-Inumbo-ID: 3640d00b-89fc-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728890180; x=1729494980; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ts96frr75r13bLnPWGnC4EQ9/kRxjCdlmFRnyynBhEc=;
        b=O20h5+8lVa5KE/WCFbrwO2laTWaJrV35q1AcMcfrjlMzPqsq5/UmvWod4mHiEt9D3/
         rv6jp1hOCi1JwxSgDajwDW4E0nFRN5kI//sNaHvRtDK4Hdpqu70zjwalCOL4bzj5lXno
         08Rc+lILRfMv7uetxP0qlJ895y0xPEJS/tNbNV+arVu/HWfbERoHnlBslTbwHNyGF1+k
         hXRn3ZIpHFTJtdJ2EXR6WodqGWTu6QyMfhRjpCf6R1n40sugnW9GKWH9lQbMq3VDBmOe
         EfwTsmpCWWfjCwx3EZ+8/145nk7eN+ZRp3RXJ6dOUdkSjHDUCtCz8W2tCEa9m2xSPqge
         eZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728890180; x=1729494980;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ts96frr75r13bLnPWGnC4EQ9/kRxjCdlmFRnyynBhEc=;
        b=IfmwdeGNb4bkI86AnAVGsTSvGSffkNnA1aFzTAOCAwlRLeK/pHxABUIZtsbFFcrEw+
         OmHmtR1wK5ptBMeraUbhtFb53zHLyDE9yjpfu42HVOCqNj+x/wBPGjHdT8+KU50X/8EM
         8vaPRmmfkh+gWMbmzf75P+LsXM8vxASGaW9mkS675W93GF+QNfJzPIE7G7EtxAHjGR2/
         sk/16iNS1hryjMwywkWoaBMQBS2kypGnN6eRQo77lC/S7jta96A5x2KvLuzB5my1il5q
         G6hwD37ZCm6bl7T0uEY5x6tR8ZotUdMSZI8jiUqH54SAbI4l6/xvfhF6qdt0i1+nmo0k
         umpQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4+F6iJWsQZCpTpQ7XS0MD0jE3ZPSJrmPXDBuH8IECCne0+hDCbiLOpyWx7pu/lOF7QCHds/myQ6w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzKnqhC6XI2sSBLsAkGT8MhLu8aF1qr6hT+LKemIpY55rqJu25t
	Xy13gWSt3h9V/taeaG4wa46hs8iwqsA31BXzknu6AbEIvJZv7ReavcpBlDOg70/DEZ1XY7G4S6A
	=
X-Google-Smtp-Source: AGHT+IEvboDQruTyj93wiHQF1JckQNQOKMZTSpcekJRIJ1qXkCzGmMvIAnC7QTq+ieMhyIye4R9XbA==
X-Received: by 2002:a5d:452e:0:b0:37d:498a:a23f with SMTP id ffacd0b85a97d-37d600ca0b5mr5782930f8f.53.1728890180223;
        Mon, 14 Oct 2024 00:16:20 -0700 (PDT)
Message-ID: <ee839510-eb6b-4f3a-ab3c-f8f27e1ddad9@suse.com>
Date: Mon, 14 Oct 2024 09:16:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/public: increment domctl interface version
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241014070650.14296-1-jgross@suse.com>
 <c7ea754e-e250-4431-b698-a10c2299ce75@suse.com>
Content-Language: en-US
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
In-Reply-To: <c7ea754e-e250-4431-b698-a10c2299ce75@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.10.2024 09:14, Jan Beulich wrote:
> On 14.10.2024 09:06, Juergen Gross wrote:
>> The recent addition of the XEN_DOMCTL_dt_overlay function was missing
>> the related update of XEN_DOMCTL_INTERFACE_VERSION, as it has been the
>> first interface change of the 4.20 release cycle.
>>
>> Fixes: 4c733873b5c2 ("xen/arm: Add XEN_DOMCTL_dt_overlay and device attachment to domains")
> 
> I'm confused: That change (a) pre-dates the branching of 4.20 and (b)
> bumped the version ...
> 
>> --- a/xen/include/public/domctl.h
>> +++ b/xen/include/public/domctl.h
>> @@ -21,7 +21,7 @@
>>  #include "hvm/save.h"
>>  #include "memory.h"
>>  
>> -#define XEN_DOMCTL_INTERFACE_VERSION 0x00000017
>> +#define XEN_DOMCTL_INTERFACE_VERSION 0x00000018
> 
> ... from 0x16 to 0x17. And for no apparent reason, as plain additions don't
> require a bump. Didi you maybe mean to reference a different commit?

Albeit looking at the history of domctl.h I also can't spot any candidate.

Jan

