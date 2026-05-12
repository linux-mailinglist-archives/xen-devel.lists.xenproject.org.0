Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gI56IUkGA2owzwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 12:51:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AB651EE2F
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 12:51:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306710.1578539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMki9-0007lv-Hu; Tue, 12 May 2026 10:51:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306710.1578539; Tue, 12 May 2026 10:51:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMki9-0007iy-F8; Tue, 12 May 2026 10:51:37 +0000
Received: by outflank-mailman (input) for mailman id 1306710;
 Tue, 12 May 2026 10:51:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wMki8-0007iq-0j
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 10:51:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMki7-009TKy-AN
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 12:51:35 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a03062f-e002-0a2a0a5209dd-0a2a4505b3c0-42
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 12:51:35 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a030636-aaa8-0a2a45050019-d1558031ec92-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 12:51:35 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-48a7fe4f40bso62304055e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 03:51:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e8e60f3d1sm23344885e9.3.2026.05.12.03.51.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2026 03:51:34 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778583094; x=1779187894; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=feCZtOsL2ZtBJMcko9VfAUJEm4qJa5DneRCyJ1kdOEU=;
        b=JAlSy9Is9RYEAyJ9qTKRheNt2FHOpsmhTDBvoIO0lbAckK6OeOhLQkMvZp7nYyeUlt
         Ju+WuXJxg8yU4lT9yqNGFE3goX7QlIokBmJh2DYakSplAkaZ9p5/UkvEwtC2ZmFoKlNz
         t2UTy7+aHDzlWSEeLEHn/jOmWO8PPjbxind5A3eUgWDHLCCLESYs03p05pw9mxH8SniY
         U2M8/gcNb+IPdO2XW+iPXkZEJFiE8OMA3nEABv8DjfwQLKjxr0w6ATrLfVPUvGgVAq+P
         5HnnoQDEWdhsvujr62P63BLpD9uy03MomZreYD4GtIFPqf1PUZTCiPyMJbx5NgvlxxLP
         HVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778583094; x=1779187894;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=feCZtOsL2ZtBJMcko9VfAUJEm4qJa5DneRCyJ1kdOEU=;
        b=eg1YLULuiSZa/r58ddZsJk1egtOgUaPXo3Kqz8R8BlDT/AtXAk8owF6mypH0uvP/d/
         vzOWULG49rFUxLsFB8PX+sfXO9WNAAsVVdnMuWb4ixYHwBu9vJSEdo7rcQoZuH/CsWH7
         Vk7z8eFw3vSiCBCUqPtFjvNt2vlGTLF/Q56XUlGzwX2pbDAtLx5lsLiI8OXvJRkUf8yJ
         W0XajIGAWFe2kD7FAAaSfC1A3Sx9e77PLFp4/eb4WBswKol7Esx+Zy4gaj3lao6f+Xvp
         q1ucrDpEHye4Yn8Ig6ukc6iq4j6PdxoNLnsCV+ZpWn7ollYqNgXMBgh6NtEaw7ep7z9a
         dN9g==
X-Gm-Message-State: AOJu0Yz57+BB0p/C7T84Pl2YBdDmkW6Tq8JEiiTH+jeKA+Io8csbnrX4
	Yo1HNBvW4RoKMJ5JTSqIaf3ONdKuLlIlqXjO6iQi/xg+D9eoGSbczQnMZW0E5/QNgg==
X-Gm-Gg: Acq92OESp7jspNo9l4ljQAH9/e4vBJt+JxEnCpegM5E9ntM4KFvCopHM4seZ6CKq+sr
	m7NkpahMWKtKcmHJrZNkqIv1O/5ZzX5omVTtZCocwOD1KYzpVUcgfH/xMD62Gl0qt5JSBYHrW++
	C92H1hsy6/xUwfnYiheYlHt+eFRIyti2VzikMzLII7IVnuncMr69SvO5EI5v3vOj1cPlphfXgRK
	1y5+3EMpdma3GlOmGp5LVbtVGuJDpTwMw+/qTGWTegsnrwKEbVd9A48z/c4KEPVef7spcYDkXDx
	N41x0Hyeb3CjacrhScQVx7JM2yHVn8URzjkFVmykVBgQrwy0AAtwTFHlx4qmLobA7BxzIcYFpoj
	j1JH8CpqrHUU1uCFWklAYle/inFen3j7EA+MgXoCGa9vfb2GGS73Z4GlAzea4SnqG7NvluQQpXf
	Hq4O90JVrzfBkTEMWQX0eAxaoU/3msn9EOr8l4o6AQJOUKZkBU7FWcY4jSoHMfIH52j0up0sY/G
	cmJMSNiB5p89r8=
X-Received: by 2002:a05:600c:8211:b0:489:c57:7836 with SMTP id 5b1f17b1804b1-48e51f40ecemr488630785e9.27.1778583094587;
        Tue, 12 May 2026 03:51:34 -0700 (PDT)
Message-ID: <5b77896d-4f56-439c-9b7f-c3d83d671066@suse.com>
Date: Tue, 12 May 2026 12:51:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] symbols: explicitly specify source file name for symtab
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <f921abc1-1f1a-4ef1-b21b-a65b5d50eafd@suse.com>
 <agLw10IR1KO3tNKX@macbook.local>
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
In-Reply-To: <agLw10IR1KO3tNKX@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1778583095-D3D67443-AD105564/10/73395122804
X-purgate-type: spam
X-purgate-size: 2711
X-Rspamd-Queue-Id: E8AB651EE2F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,xen.org,kernel.org,vates.tech,amd.com,gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,suse.com:email,suse.com:mid,suse.com:dkim];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 12.05.2026 11:20, Roger Pau Monné wrote:
> On Mon, May 11, 2026 at 12:00:03PM +0200, Jan Beulich wrote:
>> If there are any local symbols in an object file, GNU ld will create an
>> STT_FILE symbol derived from the object file name if there is none in the
>> incoming symbol table. The object file name, however, varies between
>> linking passes. As a result, symbol name compression can yield different
>> results if any of those local symbols need retaining (Arm [and RISC-V]
>> mapping symbols are omitted, for example). If that difference in
>> compression would yield a difference in the sizes of symbol_names[] or
>> symbols_token_table[], the compare-symbol-tables sanity check will fail.
>>
>> Fixes: d37d63d4b548 ("symbols: prefix static symbols with their source file names")
>> Reported-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> --- a/xen/arch/x86/Makefile
>> +++ b/xen/arch/x86/Makefile
>> @@ -200,7 +200,8 @@ $(TARGET).efi: $(objtree)/prelink.o $(no
>>  ifeq ($(CONFIG_DEBUG_INFO),y)
>>  	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),echo,:) "Will strip debug info from $(@F)"
>>  endif
>> -	$(objtree)/tools/symbols $(all_symbols) --empty > $(dot-target).0s.S
>> +	$(objtree)/tools/symbols $(all_symbols) --source-name=$(@F).S --empty \
>> +		> $(dot-target).0s.S
>>  	$(MAKE) $(build)=$(@D) .$(@F).0s.o
>>  	$(foreach base, $(VIRT_BASE) $(ALT_BASE), \
>>  	          $(LD) $(call EFI_LDFLAGS,$(base)) -T $(obj)/efi.lds $< $(relocs-dummy) \
>> @@ -210,6 +211,7 @@ endif
>>  		> $(dot-target).1r.S
>>  	$(NM) -pa --format=sysv $(dot-target).$(VIRT_BASE).0 \
>>  		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>> +                  --source-name=$(@F).S \
>>  		> $(dot-target).1s.S
>>  	$(MAKE) $(build)=$(@D) .$(@F).1r.o .$(@F).1s.o
>>  	$(foreach base, $(VIRT_BASE) $(ALT_BASE), \
>> @@ -220,6 +222,7 @@ endif
>>  		> $(dot-target).2r.S
>>  	$(NM) -pa --format=sysv $(dot-target).$(VIRT_BASE).1 \
>>  		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>> +                  --source-name=$(@F).S \
>>  		> $(dot-target).2s.S
> 
> Wouldn't it be more accurate to use $(dot-target) as the source name?
> 
> Maybe $(notdir $(dot-target)).S?

Why would that be better (more accurate)? The file names change, so the
specified file is "virtual" anyway. I simply don't see why prepending a
. would be helpful.

> I see the default is already set to the target filename for other
> arches, so not a big deal IMO.

It's a "virtual" filename also there. No real xen-syms.S is ever created.

Jan

