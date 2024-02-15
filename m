Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E1D855F45
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 11:33:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681563.1060396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raZ30-00039a-1g; Thu, 15 Feb 2024 10:32:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681563.1060396; Thu, 15 Feb 2024 10:32:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raZ2z-000379-UN; Thu, 15 Feb 2024 10:32:53 +0000
Received: by outflank-mailman (input) for mailman id 681563;
 Thu, 15 Feb 2024 10:32:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4dJ3=JY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raZ2y-00035g-6w
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 10:32:52 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91c1d174-cbed-11ee-8a4d-1f161083a0e0;
 Thu, 15 Feb 2024 11:32:51 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-33aeb088324so361772f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Feb 2024 02:32:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ay14-20020a5d6f0e000000b0033b2799815csm1439651wrb.86.2024.02.15.02.32.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 02:32:50 -0800 (PST)
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
X-Inumbo-ID: 91c1d174-cbed-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707993170; x=1708597970; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IOmQG/qM+lNoHDlTkBOz5ABj1XSkHT6x20LcXYNS5k0=;
        b=MoRBV+Lp8DI+lgruiyMGAs4dcsqU1s1Oa1YgSMweQAJt3PkN3aPtpBBh1L9n/5MYk6
         ibL8RYaKSL5LmUsP/CeLv57h4U7FE1tklbEB29CnSanztOEngZEsokSTtwTeh9pD9kTN
         7FKf5jPGrEDH4eQYUgoxDznFguBJqRigMsChVsQvPfx4FlSlXxxafcCZ9CuY1DGl24rZ
         BRZbG6jI7UrQ5Ggn9RRaSzT+NFGR3SQ/r9IUS/OJEUNaMnwB4u8hHBGRr0Du7fMDDXz8
         5nkzGwCNy/s1ZweLOSBhLBqBMKlPEjK+28Je42/LknkUwRHQQrHIgUc4WZjoOyLU4r9N
         rIpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707993170; x=1708597970;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IOmQG/qM+lNoHDlTkBOz5ABj1XSkHT6x20LcXYNS5k0=;
        b=FAQDDCI455hK8qlpc+hMej21ej7EUrRMs733+lnPh7XAUplUxwXQUpDW9UsU8XQs0f
         J5R3DsOtAzDxDzbbxyoP6V05eWiYZ69+UKSQPOM2ejDX2cW80AmYtHuZDCb6XTTCOIFK
         LM9K3kJ8nzvFpQXuldCJ0h12lczFhwVplH1E4xLTe38amPtxhD7V3Hj0/wXsUlS6oJgu
         f/ZGXXXZ9NHQXAKoNxKlML9pDYIOHOdo3khUAMDKhpy4dm6k8FcJe4/+OYdDRHOev4tN
         d9RIMe0Z0nRNF6HtGBuq1EANV0W8jESXIqxnfiDar/LHudxbQ/NsWLLHjZQ87eFKNLHg
         XYlA==
X-Forwarded-Encrypted: i=1; AJvYcCVLuj0HYyjFHIHjFGdSuHjARo+IYp+nwaQx+q4+q4aYgy1eRr2MmFDwDJMxIGLQ/emppos2cpGjCF8jUenMt/WtKrGirt9KPse4L5CkJ1c=
X-Gm-Message-State: AOJu0YwKJpmUN285w3BJop8g7tbynUuREPcjU62hhauaGnhcerB02DMx
	SQkmliYXc/iBH243BdCLPAE9tGI4FhW7ZIQro+vsusxRL54DjROGLVDaGR5vAYbW/vc5IYEhW9o
	=
X-Google-Smtp-Source: AGHT+IEZ82EnnpRdB3vayI6J21Rmx1snTkTpgtxBxE2JeSKWQIBrH1gn0uQvdtPhyADo29ZlRr/otA==
X-Received: by 2002:a5d:4fc1:0:b0:33c:e392:d98d with SMTP id h1-20020a5d4fc1000000b0033ce392d98dmr989287wrw.58.1707993170424;
        Thu, 15 Feb 2024 02:32:50 -0800 (PST)
Message-ID: <123c446c-e56f-457e-9cf4-58a43a3b069a@suse.com>
Date: Thu, 15 Feb 2024 11:32:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 2/3] x86/uaccess: replace __{get,put}_user_bad()
 with STATIC_ASSERT_UNREACHABLE()
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1706259490.git.federico.serafini@bugseng.com>
 <e28bb23a12fae3c8630f943b469137d367f20022.1706259490.git.federico.serafini@bugseng.com>
 <ec849d3a-4f6a-4afd-a7c4-418906eb909a@suse.com>
 <alpine.DEB.2.22.394.2402061707520.1925432@ubuntu-linux-20-04-desktop>
 <22ee2311-1e6b-4f2e-86e4-12d20b5ba4a2@suse.com>
 <6451696b-0366-4069-b82b-094e63eced8d@bugseng.com>
 <0b0b5a50-7692-4500-baa4-68df8f1c5d7a@suse.com>
 <d7812cd9-7d06-493b-b8a8-d2353f148e8b@bugseng.com>
 <a5d9b91d-4e56-4512-9b15-d6868a383923@suse.com>
 <04a2c7b2-07e5-46fd-835e-42b3c6307547@bugseng.com>
 <a4c2f7c0-66bc-436f-bc99-8f8ba4ec822e@suse.com>
 <fffaa145-16ff-4969-bf4c-cfe0be98b66a@bugseng.com>
 <2117bb4e-94a3-4990-945b-6fb141ae1e63@suse.com>
 <3ed651c3-4ed3-4237-bf57-3a99a790df1a@bugseng.com>
 <3edafece-f15e-4a28-9f17-a4b08d3e0215@suse.com>
 <35249e32-9eb2-4c51-868d-de2cd2d8230b@bugseng.com>
 <45c19a87-5833-4350-a374-3a70fd3aa9ae@suse.com>
 <d735e980-c5a5-46b1-a511-cc2d666dac23@bugseng.com>
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
In-Reply-To: <d735e980-c5a5-46b1-a511-cc2d666dac23@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.02.2024 11:07, Federico Serafini wrote:
> On 15/02/24 09:10, Jan Beulich wrote:
>> On 14.02.2024 17:11, Federico Serafini wrote:
>>> I did some tries with example programs
>>> and the assembler error always points to file and line
>>> of the most enclosing function that caused the failure.
>>> If I am not missing something, using __FILE__ and __LINE__ does not add
>>> any information.
>>>
>>> Therefore, if the new macro is used within the body of other macros,
>>> then the resulting assembler error will point to the source of
>>> the problem (e.g., the site of a bogus call to put_guest()).
>>>
>>> In my opinion, converting put_guest() &Co. to inline functions is not
>>> convenient: the assembler error will point to the most enclosing
>>> function that would be put_unsafe_size(), instead of pointing to the
>>> source of the problem.
>>
>> The assembler error will point to where the inline function was expanded,
>> sure. __FILE__ / __LINE__ ought to point to that inline function (where
>> the macro was used) then, though?
> 
> This is what I get:
> 
> federico@Dell:~$ cat m.c
> #define STRINGIFY(arg) #arg
> #define STATIC_ASSERT_UNREACHABLE(file, line) \
>    asm(".error \"static assertion failed: " file ": " STRINGIFY(line) "\"")

__FILE__ / __LINE__, if to be used, want using here, not at the use
site.

> static inline __attribute__((always_inline)) void g(int x) {
>    switch(x) {
>      case 0:
>        STATIC_ASSERT_UNREACHABLE(__FILE__, __LINE__);
>    }
> }
> 
> static inline __attribute__((always_inline)) void f(int x) {
>    g(x);
> }
> 
> int main(void) {
>    f(0);
>    return 0;
> }
> federico@Dell:~$ gcc -O3 m.c
> m.c: Assembler messages:
> m.c:8: Error: static assertion failed: m.c: 8

That's as expected. There's no mix of macros and inline functions in
your example.

> Note that the linker behaves differently:
> 
> federico@Dell:~$ cat m.c
> extern void __put_user_bad(void);
> 
> static inline __attribute__((always_inline)) void g(int x) {
>    switch(x) {
>      case 0:
>        __put_user_bad();
>    }
> }
> 
> static inline __attribute__((always_inline)) void f(int x) {
>    g(x);
> }
> 
> int main(void) {
>    f(0);
>    return 0;
> }
> federico@Dell:~$ gcc -O3 m.c
> /usr/bin/ld: /tmp/ccv9KHJD.o: in function `main':
> m.c:(.text.startup+0x9): undefined reference to `__put_user_bad'
> collect2: error: ld returned 1 exit status

The important difference is: Here we're told that there was a use of
__put_user_bad, which is easy to grep for, and thus see how the
supplied function / file / line(?) relate to the ultimate problem.

I'm afraid I'm meanwhile confused enough by the various replies
containing results of experimentation that I can't really tell
anymore what case is best. Hence I can only restate my expectation for
an eventual v3: Diagnosing what the issue is, no matter whether the new
macro is used in another macro or in an inline function, should not
become meaningfully more difficult. In how far this is the case wants
clarifying in the description of the change.

Jan

