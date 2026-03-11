Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPD2Fd4/sWmtswIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 11:11:42 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD578261D7E
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 11:11:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250953.1548283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0GX3-0007EE-QY; Wed, 11 Mar 2026 10:11:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250953.1548283; Wed, 11 Mar 2026 10:11:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0GX3-0007Cs-NV; Wed, 11 Mar 2026 10:11:13 +0000
Received: by outflank-mailman (input) for mailman id 1250953;
 Wed, 11 Mar 2026 10:11:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oqCu=BL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w0GX1-0007Cl-UN
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2026 10:11:11 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9fab059d-1d32-11f1-b164-2bf370ae4941;
 Wed, 11 Mar 2026 11:11:09 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4853aec185aso29201795e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Mar 2026 03:11:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4854b5e92d5sm40354145e9.1.2026.03.11.03.11.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2026 03:11:08 -0700 (PDT)
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
X-Inumbo-ID: 9fab059d-1d32-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773223868; x=1773828668; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8VSPL9pI0r/nB6HnC2XdlimUBaQh2F+tmXvni44X9HU=;
        b=GzJ/Mwc+ZZyI1ueebYXGMJNXNDOzyrJVMAhsAhOg5Jx93i74kArTq4K3mK+nYHcfQR
         EzBAGOwg9jhVVzdF9zKxVSuebrf260TE1Y3wBOjj0qi7USvzNmNMb5J5o4seH/BelT6u
         VEWO8rno+92TBIrzYvnLwk4/2qIoDEO0piDnGuWc1MafQc/j/K+VWavIXw2kf+L3uuNX
         JeUXSN3NcaHMJXfcbjK+TeUR25xal2ON5etTzyJd5CNONClhRBHhGskK5izBLB0ZLnht
         oCIRNbA6wZ1xmkFNfegZ6UE5q0LzsrvM+WKg4+r2DeaO1coW/K/Qd6pmLDP7KxviiLbP
         vUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773223868; x=1773828668;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8VSPL9pI0r/nB6HnC2XdlimUBaQh2F+tmXvni44X9HU=;
        b=OYkUV7wGexw5uHQmYqX5TQ8mzLxxGLn+YGJxClnAtCgMli1Xzn1b2wTLc2YMuWb/Rz
         LEtIG047+wslEGFfV566UM4w2xC8QLeUaZlP8d0yn/U+mT/DOY868U7WDWCGza0Ce5P0
         sLaS+6eoXgb2PXtrMGrx9Z6SBfS5+U8E4ZMK1S/eAWcCsUIdh9z/dqCTsbJmnvof2Smm
         acOC6oE9BzprUUKLqOcu09KbZ7z1+/rRP1qt/0nX8yoRS0uusuMjYpm8fDkXdMTuWpBS
         MC0MQjD86lWaX+H/2BKjVKSWFPKipEzWK1SeeXcrIsJWlceZNwh2fh1fTI3wG8kjrfju
         e4DA==
X-Forwarded-Encrypted: i=1; AJvYcCX4yW37p+6OAN5GBeHEQKMnFGxQMveBSjpSQ2wn2mUGtEizcGeBeCky7wSg/a9KuWVD8W7GgOCYh/0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwnQUi9L7D5WWnkyJAPQzU1WB+G8jpm8JWoAlmPawaEP5cFZgwP
	Q9XipdJtx9HbDfQT9HfhT8S9CTdocKMc+q0OhhGev7VDqsXpl2sPdF6xmZjlE3TyaQ==
X-Gm-Gg: ATEYQzyylRrYGk/pi6di7kyBfq9BnJC7hqtjM1IcZxXH6rmn0xS+ljCSVuXKDw7rz0I
	8Wknbzqq9ThXQm03qEoANKlM7r5xUe3TMyXOOFybxOs5Pnlfa6Ri9WVBoBnM/Of5axY5UvjGLYr
	YD4UcIDswLCnPUDMGcJtzyYUhgvZAGsLQIg4XHvT3ZDPwQ9qYM7TD2K2DSFw0g10FaOaE3ZIKGN
	bOphaaBOhrMXT7E7JQfFLV8wMtWBzj2FJTYCys4DCg4YR4d4prLh+Pg4XB/NqDdBQuv72zWkNlX
	8SQgYeRbrrYYgYpv0jZjQaDNMw/HE05Xq2uDpWKZdfZffcFoDcS3YgGgTCoh4LA0apNEHV9/gZz
	X3KNBvY4hB19bCiaSfwne4nQyYeU/iw7zAd48Z6hE10yXOOju8Itv+voGBSBzGxCEaBp+TdiJJ1
	J3HALuFjpeVyRUCTC9VHCjkbp0QTIafoQ7yuJs6Qmj2BA7QV8eRy23MG1t87MwTH2NWuZs3H24U
	nIvTt+TCwTLXag5lEknf4hChw==
X-Received: by 2002:a05:600c:3511:b0:485:3dfc:57a with SMTP id 5b1f17b1804b1-4854b134942mr31551655e9.32.1773223868541;
        Wed, 11 Mar 2026 03:11:08 -0700 (PDT)
Message-ID: <bbbb443d-a5c8-43a3-9caa-8dac1e332fb8@suse.com>
Date: Wed, 11 Mar 2026 11:11:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] x86: Drop cross-vendor support
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20260213114232.42996-1-alejandro.garciavallejo@amd.com>
 <7973d3d1-8984-421f-88db-ca17ea3cb2ac@suse.com>
 <DGZUVOWBI677.1QXF8LMTNO886@amd.com>
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
In-Reply-To: <DGZUVOWBI677.1QXF8LMTNO886@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: AD578261D7E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,xenproject.org,citrix.com,vates.tech,amd.com,lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 11.03.2026 10:46, Alejandro Vallejo wrote:
> On Wed Mar 11, 2026 at 9:54 AM CET, Jan Beulich wrote:
>> On 13.02.2026 12:42, Alejandro Vallejo wrote:
>>> Alejandro Vallejo (4):
>>>   x86: Reject CPU policies with vendors other than the host's
>>>   x86/hvm: Disable cross-vendor handling in #UD handler
>>>   x86/hvm: Remove cross-vendor checks from MSR handlers.
>>>   x86/svm: Drop emulation of Intel's SYSENTER behaviour on AMD systems
>>
>> With this, do we actually want to keep emulation of SYS{ENTER,EXIT,CALL,RET}
>> in the insn emulator? Or at least gate that on e.g. VM_EVENT, to still allow
>> its use by introspection? Whether to then also permit those with HVM_FEP=y
>> (but VM_EVENT=n) would be a follow-on question.
> 
> I can force emulation of anything by writing an instruction to an xAPIC register
> followed by RET and then CALL-ing it that address. If we want a hypervisor
> capable of running such ridiculous cases the emulator must be complete.

Well, yes, hence the question. Or in other words: Do we consider completeness
important for these insns? (There are others we don't currently support.)

> If not,
> the question is what to do otherwise. Inject #UD? Crash the domain?

#UD is what I think we inject for anything the emulator can't handle.

Jan

