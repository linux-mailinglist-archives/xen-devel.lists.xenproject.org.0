Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA97CA7B63
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 14:14:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179037.1502677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRVdL-0007gZ-KW; Fri, 05 Dec 2025 13:14:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179037.1502677; Fri, 05 Dec 2025 13:14:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRVdL-0007dy-HF; Fri, 05 Dec 2025 13:14:03 +0000
Received: by outflank-mailman (input) for mailman id 1179037;
 Fri, 05 Dec 2025 13:14:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7OvG=6L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vRVdJ-0007ds-NO
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 13:14:01 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42d1aad8-d1dc-11f0-980a-7dc792cee155;
 Fri, 05 Dec 2025 14:13:59 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-47790b080e4so13389605e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Dec 2025 05:13:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7cbfeb38sm8606982f8f.12.2025.12.05.05.13.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Dec 2025 05:13:58 -0800 (PST)
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
X-Inumbo-ID: 42d1aad8-d1dc-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764940439; x=1765545239; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vGyEvfooEaGE6DNyarHbZZNIZo14J8itnREU99NTLvI=;
        b=FhxkINPcyVVmjgfK02cU8C6d00xAp4fNCggYMbGZal42f0yUUPCkdHN7CiK7qmLDH5
         oUNMhJVZHQr6T+BqOPxOOfXy1nGc2IWHdJOj83njaPCz0hpTWSVUaKkWiJ2+Z622yga8
         dlVxFKujDpW8XerhTj+4ctL+1NNHfOLoPEs6aQaAlWLHMN+o11G8BpDt5UTMtlTOwemJ
         eqtRvdql5oO5YWrgFuZFlyEem5spgBVk81amP3ZU1LWDtx/lzt2X4++a8hCp9ubZN411
         8VCvT+cRrLlaug7FAH51rYSCjIagSPeeu5YGWiE6wDrDl9fq7PXspsVBgPkBX+B7H0T+
         u+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764940439; x=1765545239;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vGyEvfooEaGE6DNyarHbZZNIZo14J8itnREU99NTLvI=;
        b=rdFcCUpeiDri5BN4owdNQS3xSJYuk+6v+lOshfmVc+7sfQPiqK10WhL22v1gmmsVvf
         KBYYqBlZXUsE3HYIFNKwyo3e5BW/c+ZnmdYq1JfkRqIoP6wUz3StV0k8LX2oNeAKwQXY
         jipnEs6UyQv8T5dtmPlcaRHGD/8dzu99XNm63lzX+9DaPCLSLOmBSYmilUjm7dj+0TSL
         aRR+psXat0y48utl7cUjKZZkmXw7q1AFCcKxi/KlAemJFK/KAx2Yr6w+a2ToFtiytZqF
         hDlLvuvXLL0ameszEqLJjUzVBgTRNjlqO3bRHuOQpl+hsaD/bVJeUrmLXcBjAOmU/Tss
         nA9w==
X-Forwarded-Encrypted: i=1; AJvYcCULb7vemde6SXMp8BRwlF4VHqshaM3Mgl3Cra78ZzrIt9J1kb5ceZUINt2XLxDAOVbJglskwr5FL84=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwkiZ8jj4DtqcZc/zDZB0jkzXKhz2Yhat1aP93M6pPwDsB0srLV
	B/4lIkv4YShX9tgRflBUDv8R2SEzCpsntMzH9ti/30OWdBZVpTJD9Q3NCBVV5YSeuQ==
X-Gm-Gg: ASbGncvIbdpd6N/QBD4DsQ4AqdBnbixgyAFOabISw7+oRlUXtQ/S4ZZNZ2h9lL81nD8
	680EHrCn3FBrDYFfgOUs1z6W8tIQ5wKm/18KMeiNUqmwszkV6x8f7aWgdZKKQY5C9CKPX0Wi8pI
	SoIL5kZMeXAvy+m5ay87o1EkcqlBzyIFer9Xz+5QDwNb90efxhs4PIEP/AGqAL6uLnEbulgWpH2
	WfgWBRuU6rftStdlzdx8r6428zxqCg2gaJt/L7CHEjUFkUuULXd+rpto1rPm2wHXLGo5StAoqXv
	lQnZAWiFpDGvnWO65QhEt505kvVkSRXm3d2CVU9+Op2wjAimSjZi30bhH/yRFAwwpnOH++27Y1z
	sO/p7hV2HeeuUMjw+/JWSOlYj7KKHACZ4al3IBjaDDoD1ZsTHHc3mpjBmMQWukruRazQ1MnrUel
	XMtLGqgswB9Svi/lKVmRqev7J5zwqk4B/0NFVVw+LaZyOiFVaB4hvp2mJaeoYHN8SH3n/BdoBiY
	EQ=
X-Google-Smtp-Source: AGHT+IGV9HQIBY1Op+2U3yMF+eyzqavSke5jWSBpqeZAZJt8Cqgw1pAFx+FrqmYR8//yNA1nb/gk7Q==
X-Received: by 2002:a05:6000:4282:b0:42b:31da:18b1 with SMTP id ffacd0b85a97d-42f731d0f7bmr10240502f8f.56.1764940438714;
        Fri, 05 Dec 2025 05:13:58 -0800 (PST)
Message-ID: <e9d37bd4-7e31-402b-a874-0e9ad10b2a1e@suse.com>
Date: Fri, 5 Dec 2025 14:13:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 09/10] x86: use / "support" UDB
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <926a2315-a2b7-4aad-87e6-d686c9da9e3a@suse.com>
 <78b7c8a0-16ae-49c3-8c7b-5b10f5b0d688@suse.com>
 <e2ce221b-f852-4f9a-8a82-322e6f2af522@citrix.com>
 <846afe9d-458f-4ec8-a58e-faf0617707df@citrix.com>
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
In-Reply-To: <846afe9d-458f-4ec8-a58e-faf0617707df@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.12.2025 13:40, Andrew Cooper wrote:
> On 05/12/2025 12:01 pm, Andrew Cooper wrote:
>> On 24/11/2025 3:01 pm, Jan Beulich wrote:
>>> --- a/xen/arch/x86/include/asm/bug.h
>>> +++ b/xen/arch/x86/include/asm/bug.h
>>> @@ -21,7 +21,7 @@
>>>  
>>>  #ifndef __ASSEMBLY__
>>>  
>>> -#define BUG_INSTR       "ud2"
>>> +#define BUG_INSTR       ".byte 0xd6" /* UDB */
>>>  #define BUG_ASM_CONST   "c"
>>>  
>>>  #else  /* !__ASSEMBLY__ */
>>> @@ -37,7 +37,7 @@
>>>          .error "Invalid BUGFRAME index"
>>>      .endif
>>>  
>>> -    .L\@ud: ud2a
>>> +    .L\@ud: .byte 0xd6 /* UDB */
> 
> P.S. Presumably binutils is going to learn a udb mnemonic at some
> point?  Can we include a version number in the comment?

I has already learned it, so it'll be available from 2.46 onwards. I've
added a comment, but aiui we'd then need to also cover Clang's integrated
assembler (if and when that gains support). In the meantime I've made both
comments say "UDB, requiring gas 2.46".

Jan

