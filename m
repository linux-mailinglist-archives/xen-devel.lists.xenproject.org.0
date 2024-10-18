Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1EB9A3DCB
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 14:05:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821795.1235748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1liX-0003bn-0M; Fri, 18 Oct 2024 12:04:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821795.1235748; Fri, 18 Oct 2024 12:04:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1liW-0003Zn-Tw; Fri, 18 Oct 2024 12:04:28 +0000
Received: by outflank-mailman (input) for mailman id 821795;
 Fri, 18 Oct 2024 12:04:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dzfJ=RO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t1liV-0003Zf-4l
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 12:04:27 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e3fd19b-8d49-11ef-a0be-8be0dac302b0;
 Fri, 18 Oct 2024 14:04:25 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-37d5689eea8so1469578f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 18 Oct 2024 05:04:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431606965edsm25569755e9.22.2024.10.18.05.04.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Oct 2024 05:04:24 -0700 (PDT)
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
X-Inumbo-ID: 1e3fd19b-8d49-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729253065; x=1729857865; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Z5IdA1FD82Z7SpcZiRdkvg8+n7jOpz3Wh0YtWAEeyDY=;
        b=QR0ylp3bX04OutSjS0ivkLB7LHHf8MvnoQoCztF0zbpA5L3KIyfEJIvWoUnI+YBqMF
         8KRwPwgMSRdObey3sV2uScMNoX33aPQQRgL6D//ULAEZTZsLqtkMyOWJI1lHAIMi9sof
         l2Clwqhw5Gl3kQu4pky7AygA38aUIdHe2fwE9hzSU4NFdzF48w1akGAOyA1BkLuiEYSf
         hvbIZbDW8mJolcvKFKPKhANPFrb8hPBMJCbgomtjl7YQV9EKDdKCZW4DqvlDQolZYe/e
         mUPImVRVS/Ea5NrcoU0IwUe2pYdMzsWyWxi9N3DEtSR3KhGuOsi5orI8oDQEJqq8h/MJ
         brew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729253065; x=1729857865;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z5IdA1FD82Z7SpcZiRdkvg8+n7jOpz3Wh0YtWAEeyDY=;
        b=RdUc2abfjEVVHBvJZ+nwsDtnGh3PUPEXRCvbrh0rmtK+/VfWWLqbQondB6594X/jmE
         d0yvDhopUt2g7VRfr3Ooheqg1dcEB187yuRaZkyB7zz/sEZKR880Z4aXlTWhbgakMUQn
         I1GcNL8W9GPmEItYVE1T5q+0aaL9bllgZQTbPegfEBgtaTgW5d/MvF2hBRzNZhhyKqrO
         3SMZ2PDKbjOpVQl8vOyJgUMpmz/XAsbgZ5B+E4ly6OYHQIDV2fUh0D1jqwsbftYS9q+0
         sr94fgn7DxWrYBvdbfCtQyMSTd8G3tGjIaNpMZHZgE64fhFJ6dcorRFFKh7ESRX+TsvS
         8jEQ==
X-Gm-Message-State: AOJu0YwtbRUNDNUdmsyFFE1j5NMnlkKRtqkgZqa12RH8r2RIYxsxAZJq
	trISkPlHyb9oZjZfA8VQ0smid0Fk5yPY3QkuyHlJkSYZNk9Ubf/V+pitkqJi0w==
X-Google-Smtp-Source: AGHT+IG3EYhfTwpceYezltsli9CjEyXeoT6/1BEfG6xhn1gvF+HJB7avRid9dhZvXwdJaivFS8pi4g==
X-Received: by 2002:adf:cf08:0:b0:37c:d179:2f77 with SMTP id ffacd0b85a97d-37eab4d13aamr1495253f8f.12.1729253064598;
        Fri, 18 Oct 2024 05:04:24 -0700 (PDT)
Message-ID: <7afb8389-3758-4633-a97a-3623513dc917@suse.com>
Date: Fri, 18 Oct 2024 14:04:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] x86/boot: create a C bundle for 32 bit boot code
 and use it
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20241017133123.1946204-1-frediano.ziglio@cloud.com>
 <20241017133123.1946204-2-frediano.ziglio@cloud.com>
 <ZxJJZvOCQLzU_Q5s@macbook.local>
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
In-Reply-To: <ZxJJZvOCQLzU_Q5s@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.10.2024 13:41, Roger Pau Monné wrote:
> On Thu, Oct 17, 2024 at 02:31:19PM +0100, Frediano Ziglio wrote:
>> @@ -25,14 +23,47 @@ $(obj32): XEN_CFLAGS := $(CFLAGS_x86_32) -fpic
>>  $(obj)/%.32.o: $(src)/%.c FORCE
>>  	$(call if_changed_rule,cc_o_c)
>>  
>> +orphan-handling-$(call ld-option,--orphan-handling=error) := --orphan-handling=error
>>  LDFLAGS_DIRECT-$(call ld-option,--warn-rwx-segments) := --no-warn-rwx-segments
>>  LDFLAGS_DIRECT += $(LDFLAGS_DIRECT-y)
>>  LD32 := $(LD) $(subst x86_64,i386,$(LDFLAGS_DIRECT))
>>  
>> -%.bin: %.lnk
>> -	$(OBJCOPY) -j .text -O binary $< $@
>> +text_gap := 0x010200
>> +text_diff := 0x408020
>> +
>> +$(obj)/build32.base.lds: AFLAGS-y += -DGAP=$(text_gap) -DTEXT_DIFF=$(text_diff)
>> +$(obj)/build32.offset.lds: AFLAGS-y += -DGAP=$(text_gap) -DTEXT_DIFF=$(text_diff) -DFINAL
>> +$(obj)/build32.base.lds $(obj)/build32.offset.lds: $(src)/build32.lds.S FORCE
>> +	$(call if_changed_dep,cpp_lds_S)
>> +
>> +targets += build32.offset.lds build32.base.lds
>> +
>> +# link all 32bit objects together
>> +$(obj)/built-in-32.tmp.o: $(obj32)
>> +	$(LD32) -r -o $@ $^
>> +
>> +# link bundle with a given layout and extract a binary from it
>> +$(obj)/built-in-32.%.bin: $(obj)/build32.%.lds $(obj)/built-in-32.tmp.o
>> +	$(LD32) $(orphan-handling-y) -N -T $< -Map $(@:bin=map) -o $(@:bin=o) $(filter %.o,$^)
>> +	$(OBJCOPY) -j .text -O binary $(@:bin=o) $@
>> +	rm -f $(@:bin=o)
>> +
>> +quiet_cmd_combine = GEN     $@
>> +cmd_combine = \
>> +	$(PYTHON) $(srctree)/tools/combine_two_binaries.py \
>> +		--gap=$(text_gap) --text-diff=$(text_diff) \
>> +		--script $(obj)/build32.offset.lds \
>> +		--bin1 $(obj)/built-in-32.base.bin \
>> +		--bin2 $(obj)/built-in-32.offset.bin \
>> +		--map $(obj)/built-in-32.offset.map \
>> +		--exports cmdline_parse_early,reloc \
>> +		--output $@
> 
> See xen/Rules.mk, for consistency the indentation should be done with
> spaces when defining variables.  That would also allow to align the
> options.

And ideally also such that the options align with the first program
argument.

>> +
>> +targets += built-in-32.S
>>  
>> -%.lnk: %.32.o $(src)/build32.lds
>> -	$(LD32) -N -T $(filter %.lds,$^) -o $@ $<
>> +# generate final object file combining and checking above binaries
>> +$(obj)/built-in-32.S: $(obj)/built-in-32.base.bin $(obj)/built-in-32.offset.bin \
>> +		$(srctree)/tools/combine_two_binaries.py FORCE
> 
> Can you indent this using spaces also, so it's on the same column as
> the ':'?

The first $(obj) you mean, I think / hope?

Jan

