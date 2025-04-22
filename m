Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B74AA971EA
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 18:07:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963243.1354261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7G92-0006EC-JO; Tue, 22 Apr 2025 16:06:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963243.1354261; Tue, 22 Apr 2025 16:06:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7G92-0006CF-Go; Tue, 22 Apr 2025 16:06:48 +0000
Received: by outflank-mailman (input) for mailman id 963243;
 Tue, 22 Apr 2025 16:06:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f4Vg=XI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u7G91-0006C9-6n
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 16:06:47 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca140b7e-1f93-11f0-9eb0-5ba50f476ded;
 Tue, 22 Apr 2025 18:06:46 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43d04ea9d9aso25516285e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 09:06:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d5bbcc3sm180726865e9.19.2025.04.22.09.06.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 09:06:45 -0700 (PDT)
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
X-Inumbo-ID: ca140b7e-1f93-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745338006; x=1745942806; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0MujALK7hRILETvo7c+tPYqHjHElPCWdCDGjnhPZnug=;
        b=gRhyGQFoZP7CvCGT5xlylftQbFSigdq+EHNpv9uwb6xMh2LNts12SJD8BFDdiYn7Zs
         zsr9AhGpo8rQvCutJ1KA//oLvb+ia32tR1HPvWQd3Hk9kcqc3IN4pdLbXcGWzEW2QD4p
         KYVS7AWks+yd+3bmKEQZVRYyzMnQ6Gp6mZ9+/4c0Qt0/CH7+3/6JCHuCWT6pTyb74Ymj
         QVQeO1KeTXCZ8fmx1m9OXbzsfj5g0hUFJU21+iMV73QgkC2V8RHDTfsyeUXqmqIyyLYE
         25/qi+2l8Mz17adcnRUAViGvWWd7ioz7jjjJRgglHO1ZEFM5KdasevB0FqVwV9mpHXB2
         gL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745338006; x=1745942806;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0MujALK7hRILETvo7c+tPYqHjHElPCWdCDGjnhPZnug=;
        b=kz4aDaJUrg46JasKSvosQ/MCo7IsEGiQmJIrOmkkc1PspYMX2gfrej1eYxd+tXlhKq
         H1S5Sdwa5+gjdX+REHOc47CzHlAQej/Xat1gRlNjb7RsKnNJ1euvyTW8OxGE1Re2soc7
         cxXL7GPnlC5qf/S7OHE4gxXuXy0LMbOua2a36xGSk27rXDuljl3s27uC10l23JqBXl4B
         VOprihhmRyyzqxVGFiAsJGK86KvSGoQImutW6WJFhJHwEIqRc3fp1jT6kOEn2Nec+DuA
         OYjRCd8FSbXCQcJYgT1HitRrTwJMsiayUHkDrjosD/6HGg8NH/m8ONegx0NPwsNlq2UV
         ei+w==
X-Forwarded-Encrypted: i=1; AJvYcCWySjzQ15FGiz7QB33Ybu1TKTTxalEofT0cBxsI8yphmt0b5pj4gHh9S7sHenPtI4h7WoLk7Te642k=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw8lww9qP50tGXGv9mDQhGWW67CzkbDlYUfivzTU91rGNFfMYnQ
	WM6uS9VfaRiTrum+VPQSZu3Qe0fWPFWubfwCUfUmKhPT4TA9DeCaK3s3z5pIRQ==
X-Gm-Gg: ASbGnctz1YqzQPv0kLcxaethTbxA2Xdb2Zp/KwLuBz4bgYuKJjTTOiTFWEP8fg68v01
	iv6Yaf6XDXtQr9Sb4QnDOOh57d+neaFK5yX2SXQ+Omad2057vm2ZNGK6kt4L8MRU1rNJE9hCCks
	4ZNQ20K5ZL50lD2qthkRHP9wcK4XWRvnASOpbtIWoNdORJFlJEB1SOMo3OyapXQV9jC7o1tDgBg
	CsPvgmEGciJi8Lh6+HoNISTw0giZOFZ6jAB8J1MW1U16AGCilf6KMrVmL1ELMiNW9P1Qfeno83j
	uq//aHEe0lkoq56q+9y7X86OGXRim9J2okqqK+lJ5rBRW2If5YxJXuL1jHDMFxkAFuRu/xgeBY/
	1Lpo9beCgFuZo9UT+GA2bvB7QRg==
X-Google-Smtp-Source: AGHT+IGXdZnfWTZOZbPlNyc1JaDuOIvClBhJqWlp3l+GimgiC51DXGN3+KU3zhlRCpaMLaFfe1YiLA==
X-Received: by 2002:a05:600c:a405:b0:439:91dd:cf9c with SMTP id 5b1f17b1804b1-4407163e193mr142252665e9.10.1745338005706;
        Tue, 22 Apr 2025 09:06:45 -0700 (PDT)
Message-ID: <af333718-8a7b-4e97-a24e-16699b6dd0bf@suse.com>
Date: Tue, 22 Apr 2025 18:06:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/11] vpci: Hide extended capability when it fails to
 initialize
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Huang Rui <ray.huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
 <20250421061903.1542652-8-Jiqian.Chen@amd.com>
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
In-Reply-To: <20250421061903.1542652-8-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.04.2025 08:18, Jiqian Chen wrote:
> --- a/xen/include/xen/pci_regs.h
> +++ b/xen/include/xen/pci_regs.h
> @@ -449,6 +449,7 @@
>  #define PCI_EXT_CAP_ID(header)		((header) & 0x0000ffff)
>  #define PCI_EXT_CAP_VER(header)		(((header) >> 16) & 0xf)
>  #define PCI_EXT_CAP_NEXT(header)	(((header) >> 20) & 0xffc)
> +#define PCI_EXT_CAP_NEXT_MASK		0xFFC00000U

To avoid introducing redundancy, imo this addition calls for

#define PCI_EXT_CAP_NEXT(header)	MASK_EXTR(header, PCI_EXT_CAP_NEXT_MASK)

now.

Jan

