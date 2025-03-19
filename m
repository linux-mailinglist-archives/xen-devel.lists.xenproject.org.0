Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B19A6886F
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 10:44:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920147.1324399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tupxI-0000B7-6w; Wed, 19 Mar 2025 09:43:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920147.1324399; Wed, 19 Mar 2025 09:43:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tupxI-00008O-2Y; Wed, 19 Mar 2025 09:43:20 +0000
Received: by outflank-mailman (input) for mailman id 920147;
 Wed, 19 Mar 2025 09:43:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBEQ=WG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tupxF-00008G-V0
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 09:43:17 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93d68d5e-04a6-11f0-9899-31a8f345e629;
 Wed, 19 Mar 2025 10:43:14 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3913fdd003bso248061f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 02:43:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb40fab8sm21096836f8f.63.2025.03.19.02.43.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 02:43:13 -0700 (PDT)
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
X-Inumbo-ID: 93d68d5e-04a6-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742377393; x=1742982193; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Db7gOvKWMYfbxAPDocka8V40rBvFYh3qXq/n//nWdvI=;
        b=Lxqbsc1dpPeEbH3Trm1anA74Dt2buvJH5wFIOYwED0dbo3SL829nnI9m5oTNpl1Xsu
         AnFlOtLK8J0+NK2mZo1N2s1rx6FRefSNqwSKb0YAh6Y5zZZCh/GPXNY2oF5v6reRUMkf
         p3T+JoabrSEkE11qA8hpTscUfygv67L8CKGxOTGwiklLQoLZgInYt3/Kcf7jumfywTTM
         +wRGRYU5Bz1pDBY4I7L/faxmAmrI1lTRkspBoN1jWvgJQNalA7qjTN0rNhVo3TLhcOs0
         e1+2qla06wtjEIxSb6KvCIbjFOtVMvBFNakF8Awi0vHrQpzSNpg0cV/ukMqlRqh64P9n
         RIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742377393; x=1742982193;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Db7gOvKWMYfbxAPDocka8V40rBvFYh3qXq/n//nWdvI=;
        b=kdtxRhZv4PdlN7qtA+20NnPiix6jAnZNVTfWIvTq9p6+kdmwZ84hXWwypoEdqTW91a
         qJ5a0pbSNnBh1esFbdrbOTNuqA7uKazWns4dKVzTaAi9xpYIxgtmJv/cgMsyKb9Galr2
         olqdkJTMG6ixEz8gghkeItrxYFlFsv/yztsDQFdYn8sMdk6w/vjyOKfYWdDKSxxskmqj
         KemyVkYT3ak23r/zJtyehE6/6YCL/UVm5PcEefVLKn9MIn9ANqnU49TqF2wqYUdB7rgF
         gvf6hgHTGtX8lAP5u4/njpoXeotop2KwXFdfgj3QI0dKoiY5LEk/gK/ObP9wisLp6kOn
         tdag==
X-Forwarded-Encrypted: i=1; AJvYcCU+tMMFFNn3NsXQmVqmXJSR2bupvgLbInCZb1L3d7PQUtx8zSSQHy/Tc/aLEL6ZMzDNK5uEhArua6c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzZercLswTDwMkjxYHwt3m7Gl7H34t43CyyKgV7Ze7z584OouRa
	iDfS/SFjlsfxZeb0+V4VwaHlSjzW2szl5q0hpe0VvMbe86/hkeNZjDuvhqyCQQ==
X-Gm-Gg: ASbGncvZ3QUtQJzB9Rhu15LgjEdpl2CTob2uzlc4BfoVrwFEL9VrkqCNDV8hfECWPSB
	KIIgZayDFzXKEJdK6DDMTkn+3RIq4YrCSz2XHLH2WziRLmnHtCoS1BVhYSpdNjv74ulj7Q1YTES
	NXvErKWIgjrBMsozdjL/F9+qOu4UNj9gDsJ6tSV0SKDAaNHhp2hN6/mwBhMiz/c/ldLc7ToTtSV
	/0BKj5XJd5BLc2ss1cWjOeqy9JHvniq/uOwWpMauQFCNob2mdQ6I+LUGRDLFgwGxbP9Wp5nf6pW
	MuFMv68dPqeD8i1PU1x3CX8y23HKPG6N9qCfoZCYZnsfXTojpymQFoDKsagUgGcuJqsH4ijnr52
	GPOtLxvMkY8cxCu2mOO7mhVol/B53bLmIWewX5axL
X-Google-Smtp-Source: AGHT+IGzx74EM8rMzc/EDjNWHtPhVWwfTPfWprRkbqf0GVm15QnY6V1lSQBJeF6Xhwcz+8UhgfDntw==
X-Received: by 2002:a5d:64e7:0:b0:390:f0ff:2c10 with SMTP id ffacd0b85a97d-3996bb774d9mr5944096f8f.19.1742377393600;
        Wed, 19 Mar 2025 02:43:13 -0700 (PDT)
Message-ID: <e112ecca-b891-4c23-ace1-8128e586cb94@suse.com>
Date: Wed, 19 Mar 2025 10:43:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] Strip build path directories in tools, xen and
 xen/arch/x86
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 =?UTF-8?Q?Fr=C3=A9d=C3=A9ric_Pierret_=28fepitre=29?=
 <frederic.pierret@qubes-os.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.a5cb9c3a17249fc067ab501818c3a3e6c7c229cf.1742317309.git-series.marmarek@invisiblethingslab.com>
 <0370c0eb1fd9ac00acab016792132fa0b943d384.1742317309.git-series.marmarek@invisiblethingslab.com>
 <017d5c41-d4ea-4d91-b6ec-b4660e7325ae@suse.com>
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
In-Reply-To: <017d5c41-d4ea-4d91-b6ec-b4660e7325ae@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.03.2025 10:15, Jan Beulich wrote:
> On 18.03.2025 18:01, Marek Marczykowski-Górecki wrote:
>> --- a/xen/Makefile
>> +++ b/xen/Makefile
>> @@ -411,6 +411,8 @@ ifneq ($(CONFIG_CC_IS_CLANG),y)
>>  CFLAGS += -Wa,--strip-local-absolute
>>  endif
>>  
>> +$(call cc-option-add CFLAGS,CC,-ffile-prefix-map=$(XEN_ROOT)=.)
> 
> This is lacking a comma:
> 
> $(call cc-option-add,CFLAGS,CC,-ffile-prefix-map=$(XEN_ROOT)=.)

And then, having tried the correct form (seeing the option then is passed
to the compiler), I can't spot any difference in the resulting
xen-syms.map. There were a few absolute paths there before (for
arch/x86/x86_64/kexec_reloc.S and arch/x86/acpi/wakeup_prot.S), and the
exact same ones are present afterwards.

I've tried this with both an in-tree build and an out-of-tree one. Under
what (extra?) conditions would a behavioral change to be expected?

Jan

