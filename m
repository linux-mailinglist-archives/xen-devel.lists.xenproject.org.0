Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 524DFC8DA8D
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 10:57:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173680.1498694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOYka-0005mk-H5; Thu, 27 Nov 2025 09:57:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173680.1498694; Thu, 27 Nov 2025 09:57:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOYka-0005k9-E3; Thu, 27 Nov 2025 09:57:20 +0000
Received: by outflank-mailman (input) for mailman id 1173680;
 Thu, 27 Nov 2025 09:57:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mf1n=6D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOYkZ-0005k3-CF
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 09:57:19 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75264c37-cb77-11f0-9d18-b5c5bf9af7f9;
 Thu, 27 Nov 2025 10:57:17 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-42b3ac40ae4so433043f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Nov 2025 01:57:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1ca1a2easm2784519f8f.23.2025.11.27.01.57.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Nov 2025 01:57:16 -0800 (PST)
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
X-Inumbo-ID: 75264c37-cb77-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764237437; x=1764842237; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bjWXA33GUcjpjK51jb+Ep5XdifVp6HJ9GkAfbi1d3Zs=;
        b=gsYdE2NqX+eZ5g28Fd5jJivekTdEcVmxscHnNXs5fswHG2GosR38U86y2zQlVAS+HQ
         YAKhZYHUAgNECwaNoCqLDKTh0hmpfVDiJonMC6C1Fip1JdhAycGd6tOQt4Jjey/xdV3D
         pXZKEi60eLCtQkatoYRQY4b3A6z9K6QG4fkipwjmHRiosAo1gCiCxE7L1I1LWgfo3l3y
         9xZL8g2aXiFGKWVpGOjV9A5R26OuYJNWFg6ty4FKuLIQtzmf//0NCYQScuUnF9xq6Kv4
         RHL3jHUENzOdSGI+NDAWa0Td87N22ROgBMsOyMFN577yqg1gzS2gNHOUG7evQV73ATLb
         cQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764237437; x=1764842237;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bjWXA33GUcjpjK51jb+Ep5XdifVp6HJ9GkAfbi1d3Zs=;
        b=TIjUnGq3gncDFQHCXVhF5MmI5IGeEl9hH1D9eiqeKaG7IqqRmAnmF/Lf/VQUo/VyMF
         eLW7jdnidzDd9Tfa4WC/mdXHOh535Jkj/frVkgtlz1NPNUJjBKgzlobTk/8Kx4lul3Xr
         v29SAQw2EQpnfkjN/EJGbnTk3Ny1eHfo6wS0Fkfql3e1eWeP43srFeFToG/agY3m/6YK
         olzY3ACuXTH3cShnGzTbNYP2oYfXsAhenmqN+j8pEIecNGJI+FFOQsPeyn5VIVQlyQwH
         180psEMwYh0dqzzDyG4y6LrMBeMsckTRmVAQXnxHbxxK9OVIygJOTL+QcEVhVotGyTt3
         0iQg==
X-Forwarded-Encrypted: i=1; AJvYcCX3vxyLSj8mscr9gKXs9EcyEHDznSVlY3219pmMXCv5KFNZSSV065K7IuPLk4zA4A5Yc5Erp9e7Tf4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzZ1fc/2kGHLvCBO1DK+SCEKJz4OqVuN0MSZHcPcn1Y1zRpjM4n
	5HqQLQdWNo07xfx2PCLrn8Rh8dAXVAQMU6xT/9fF3sLZUzzzpDtKlXw9nDLTcoOq0A==
X-Gm-Gg: ASbGncuwP8ww6/FkIkW3VgpW3fPtWpN6fUAL9fMSAqv0tccFgMQRxzZEbRWozhUNC/8
	F3EaalBGS/RBefeXb9cHdSoTmaix+dB9ttdyuhvjtA6qlSfqmQZcvV3/KVf/MoYzGJXjUEjz5p/
	eHyv6ndqMiX+7zancWgtyyKQdM+5wcX6+riCIHUhbSH5PN8xn1dxphm5rTtNnKTWQLlpBa9WYnC
	UsE9V0oWbdiRWek3h9mU+SyuJ2NZPtz2/mvbgKyxe2QZfn+7YvDvJOupiyugH8ZrUBDn0qYbDF6
	Y6usOHaPs9hY9e8l342gM/I/RON+BDiRbgor5V0yPAjvbfCkS6zZ8RPKVWJaJPoVagZAI06/qTs
	BL1aZ/4zUhmwtN/jSSuRC3AkyeByTab3ninVJxsdPCtmyVYWTRUnwsw3FMDnexv1txCbR2MHo4L
	VOVo5z++Tnr7zLfwLTaG6eyp/OEcApbUXLCJg7USv5MUS8/78MCAUAUPLsulzeUvBS7nZsYjgil
	Tc=
X-Google-Smtp-Source: AGHT+IG9XxYZv8VBI6reig0VgVfb2qgLC6iatpNdX97oU/QHlyayyCCi06MyK0ToDAUFXzigDq+Yww==
X-Received: by 2002:a05:6000:1f03:b0:42b:3867:b39c with SMTP id ffacd0b85a97d-42cc1cf452amr19591077f8f.34.1764237437035;
        Thu, 27 Nov 2025 01:57:17 -0800 (PST)
Message-ID: <3fd32ba0-0670-4c9b-b216-60c55a5de7ba@suse.com>
Date: Thu, 27 Nov 2025 10:57:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] symbols/riscv: re-number intermediate files
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bd689f02-3e6b-4d15-aa1d-d757a9ee54a8@suse.com>
 <37ed4a18-f1a0-4c1f-b915-1708c235068b@suse.com>
 <db4bccef-a746-4912-89ad-b015a8d43f78@gmail.com>
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
In-Reply-To: <db4bccef-a746-4912-89ad-b015a8d43f78@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.11.2025 10:49, Oleksii Kurochko wrote:
> 
> On 11/26/25 2:44 PM, Jan Beulich wrote:
>> In preparation to do away with symbols-dummy, re-number the assembly and
>> object files used, for the numbers to match the next passes real output.
>> This is to make 0 available to use for what now is handled by
>> symbols-dummy.
>>
>> Signed-off-by: Jan Beulich<jbeulich@suse.com>
>>
>> --- a/xen/arch/riscv/Makefile
>> +++ b/xen/arch/riscv/Makefile
>> @@ -26,16 +26,16 @@ $(TARGET)-syms: $(objtree)/prelink.o $(o
>>   	    $(objtree)/common/symbols-dummy.o -o $(dot-target).0
>>   	$(NM) -pa --format=sysv $(dot-target).0 \
>>   		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>> -		> $(dot-target).0.S
>> -	$(MAKE) $(build)=$(@D) $(dot-target).0.o
>> +		> $(dot-target).1.S
>> +	$(MAKE) $(build)=$(@D) $(dot-target).1.o
>>   	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
>> -	    $(dot-target).0.o -o $(dot-target).1
>> +	    $(dot-target).1.o -o $(dot-target).1
>>   	$(NM) -pa --format=sysv $(dot-target).1 \
>>   		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>> -		> $(dot-target).1.S
>> -	$(MAKE) $(build)=$(@D) $(dot-target).1.o
>> +		> $(dot-target).2.S
>> +	$(MAKE) $(build)=$(@D) $(dot-target).2.o
>>   	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \ - $(dot-target).1.o -o $@ + $(dot-target).2.o 
>> -o $@ $(NM) -pa --format=sysv $@ \ | $(objtree)/tools/symbols 
>> --all-symbols --xensyms --sysv --sort \ > $@.map
>>
> LGTM: Reviewed-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks. May I remind you again that there wants to be a blank before the
opening angle bracket? That is an issue which was also pointed out for
some of your recent release-acks. (Canonically, the "-by" also wants to
be all lower case, I think.)

Jan

