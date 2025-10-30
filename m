Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEDBC20EFB
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 16:30:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153798.1484065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEUbs-0002FR-J9; Thu, 30 Oct 2025 15:30:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153798.1484065; Thu, 30 Oct 2025 15:30:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEUbs-0002DN-Fb; Thu, 30 Oct 2025 15:30:44 +0000
Received: by outflank-mailman (input) for mailman id 1153798;
 Thu, 30 Oct 2025 15:30:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+HTt=5H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vEUbq-0002DF-OS
 for xen-devel@lists.xenproject.org; Thu, 30 Oct 2025 15:30:42 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64e01494-b5a5-11f0-9d16-b5c5bf9af7f9;
 Thu, 30 Oct 2025 16:30:41 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-47117f92e32so10843695e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 30 Oct 2025 08:30:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4772fcf6c05sm2029845e9.4.2025.10.30.08.30.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 08:30:40 -0700 (PDT)
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
X-Inumbo-ID: 64e01494-b5a5-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761838241; x=1762443041; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5mi6RYPflF/GzUCPR+nIu+n6TF2ygal3gWPTYF0f7DY=;
        b=E7UW+lbmOhxcyU4lUlgiRnJRahrTR1cJkJ3feBXF66+MKyQ8X3Wao3VufdwiKvyrGJ
         4PrYp/0hf0uM8JEazwJ1G3xU7jZzgs4ZxsH7E97qNyzcw8CLi6FqbLIphd6XCp6R9mdy
         e+Lwh1kVJRU+3u4Vmv8ZlOUUV2UnWSU6eCIVbR2fPEP2yK3qJVnTWXhIc149qmPLdu87
         k43PvuFxLeHSlDPR5l/fPtucUlChHTFL7NKgJ208vgYsS5+GWsaRM+s0l7neSQr///jp
         uY3WzP/mYcKa8ShsdUU5bZDNimeslgHZ563reqcBPQcGsT4zc6EvjE6euGsFjtXxlOUM
         mfmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761838241; x=1762443041;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5mi6RYPflF/GzUCPR+nIu+n6TF2ygal3gWPTYF0f7DY=;
        b=oxUUMpRQJe6fthub6ieYY2Un58mQZ89uq9GGM7bcgi86GdR/eTNUHePTVh7XPz9gX1
         rr4dK1raC/PpilL5J+apT1DdMPxM/+XBo3HqkJkByGPT0iLWybbJ1Q9Y6veMiSIBo4N6
         LRIrVa1vtuz0z5cEhPLACOp5yD5qATFNhCleMuZVsPcBI94J4dsH1U+yxp6E6fPmsOoK
         Pj92pbTM584BrH5qUeZIL8Lhlk+wORgU8GfV4wqAC9pGcAk8SP3fMY8a0LrOSeDfJHkD
         IDSy3jaO1XjJmlvSV1ARdBzY5vuigCKJXHYwJPv3EELZEHDkQ4YqdRQsYkmB2eqAxw40
         PQ9A==
X-Gm-Message-State: AOJu0YzdKvxLohhMc4aqd8iRSmHgGJEyr5y7k4ZMlVZzNktzPMoVLBt6
	PDcfSk8Bp4sckuv3zNbNfb3reS668hqha6EOVofFBavlCrdqOh62vsd1NsBq3oAvyA==
X-Gm-Gg: ASbGncsS0fEktMe0uEYtRyXMOsfOHt6MJR0i+9fKsHdqvNUcCyqjrOWjwiyYx7AxCiw
	iF3lTXnQNiV7N9Zx1Vv7wWlMq2rNJvr/wKK/xQUO0Jljr6Lrv9NFdGdJGwvAgcoQeZzfKULebLt
	hXz+Vos3Fy7cphTVYJG0tgd384g1M96l5jR2cBy5OOZ55u9QbJkvXcuTn42Wmce7Mpse+4UVQCi
	5clTEa48Q082NNp/yFx1MyV9Z6AWzD3Bf4bXw91g4+CBd7tPHMy3G7Y5vv/L6op432xMGUECo96
	Ea+90WdIYr3JxOlmHS0wJ211gttB1ONscECHz6NUZaqKHzegnP/2Bkn3UgJ2tTMfJ9M/MrxxdIL
	DJMpPp7tgjkJU+CT4koKCLdxWxWdUR+WEW50R4RDVX5NQ+p67UrDNLRSHbl+KJsY6v15vQojhG1
	av420e5Mbd/2r1IBK5e+0pTbztFmXPohno4nszMZ/Ev9bUiz2am+3lbsqMN1GJxvpasDFd1Qc=
X-Google-Smtp-Source: AGHT+IGBai+sKPd4UMns6f3gq2/tt/uY87PPxVfOgYKy3Qo0CKHnnjeMlz413ms+t9OEEOQ0E9p2Kw==
X-Received: by 2002:a05:600c:3b0f:b0:46e:4a60:ea2c with SMTP id 5b1f17b1804b1-477308a897dmr942335e9.37.1761838240942;
        Thu, 30 Oct 2025 08:30:40 -0700 (PDT)
Message-ID: <fb391488-ea43-4565-9d1c-cdfd58602615@suse.com>
Date: Thu, 30 Oct 2025 16:30:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/ppc: Fix tooling FTBFS due to missing definitions
 in public header
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <1066630274.4872.1761755029561.JavaMail.zimbra@raptorengineeringinc.com>
 <6744abf0-3326-4de2-a14b-70faf56e91e6@suse.com>
 <1147119844.6178.1761837030938.JavaMail.zimbra@raptorengineeringinc.com>
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
In-Reply-To: <1147119844.6178.1761837030938.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.10.2025 16:10, Timothy Pearson wrote:
> ----- Original Message -----
>> From: "Jan Beulich" <jbeulich@suse.com>
>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> 
>> On 29.10.2025 17:23, Timothy Pearson wrote:
>>> int64_aligned_t and uint64_aligned_t need to be exposed when the GNU C compiler
>>> is in use.
>>>
>>> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
>>
>> Thanks. However, you've lost my R-b, and the Cc list was again entirely empty.
> 
> Apologies again.  I had thought for a trivial patch the CC was not required, will keep that in mind in the future.  

Just to clarify: However trivial a patch, it needs to be acked by a maintainer. Hence
they will want Cc-ing (not everyone's subscribed to the list, and not everyone may be
following each and every patch that's flowing in).

Jan

