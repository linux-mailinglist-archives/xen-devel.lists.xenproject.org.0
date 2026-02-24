Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iImFLAl0nWmAQAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 10:48:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 156BF184E92
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 10:48:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239691.1541086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vup1y-0007hJ-8B; Tue, 24 Feb 2026 09:48:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239691.1541086; Tue, 24 Feb 2026 09:48:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vup1y-0007eF-5b; Tue, 24 Feb 2026 09:48:38 +0000
Received: by outflank-mailman (input) for mailman id 1239691;
 Tue, 24 Feb 2026 09:48:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1N/p=A4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vup1x-0007e9-2f
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 09:48:37 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fcb3dd70-1165-11f1-b164-2bf370ae4941;
 Tue, 24 Feb 2026 10:48:35 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4834826e555so50822615e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Feb 2026 01:48:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b7fddbsm253339335e9.8.2026.02.24.01.48.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 01:48:34 -0800 (PST)
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
X-Inumbo-ID: fcb3dd70-1165-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771926515; x=1772531315; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BifFEShi07zxgyb7JIpguvavMHUAAKxzlf3K35ygMkk=;
        b=afEMvfl8lr43MPo8SeN7w+5TnUwqPh+uan3ax3kAsWJ7eS80iqRl+K+sVBDTDEkT4l
         VnrOFBuHQ06ypoL5BZnCEJbe7YWLy4CcY/MQKnp9IACn79EpFyKH9dcAlux5Z3HqQBV6
         PDh9zVUWxDtaMfnh+f7mBG1xvYkDVeoMw2eoAfj95ydX3knYZCMQylQSq8/doEhQrPqo
         5lyuKJByxPcFRLRO5/JEQhKRy0l55jHzS/Cd4rmBg2u/D6LeW45OTxLM93eTq+sqN4Bw
         o1dzyqsTfBEMcAFiTUZz9IdJphVGCOEuQdPTUyB5EhWrXMKnG3ik0eJL/BuZzIbLi96o
         MovA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771926515; x=1772531315;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BifFEShi07zxgyb7JIpguvavMHUAAKxzlf3K35ygMkk=;
        b=jXPPmhi8kJtRulaJCV5autdicmH0Wzz5TNm0pdEsHICIJUeQ6pSQkDHwUpQ/tVf+kp
         4/D7mrTvTZxNPzWg7t3TXLX1RXnLjkeLx2CNzixoLcqusdgbepsl+FOx1beroJ4loISU
         9R/LAPZeqLWnyrjY6y/uundSp+C/FgIAsNeCU3zur1Ae7zclq1BjOheaIdN7z9HJEfDu
         4xitFoSfuMAc/050rJG6cEBBOK8xP9vK4BkM4YY/K+mqlF9hymmMpY4Hs/NJ/daqI2Df
         x4LvsBTdZGQA/WHGhDl/Nbd+N9hkQx1VDlWnwGigqQ8lU2N+4Bi5m2QljQo8PiW8bkTs
         0Yzw==
X-Forwarded-Encrypted: i=1; AJvYcCXaBYN+JRZR8fS7yFmX5BHvuVEHwoPIZXdgepH4IOFUYQKvV3lBY5fbTF1yuv4zSAtDu+xliiktFqk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyGAkP7np4P7n9oxA7d5oPHqsgRneVDQJFVTYdMvCAh6oEKJSDv
	gAZ7OEiYveaRC/OIxARCN2fdx1Pocoxuk+LHy+YQoRxpRGNTrKpzxF3fMR8egsbeUA==
X-Gm-Gg: AZuq6aJ9E4Niqo/zB1l/2q5wxfncLsxZVru9y8dwPMVnFEMBukRFUxvFzRKuwrq+P0X
	nc4FRfL44Mhho95M7LKJ89egFZIUlWBa7OdnsCOxCp7an+PZqJTeC5wPoT8Z+eLWN2o6aXjUqMP
	vK67DftQk+b5XMURcGGMmhv4tgxxrdKmopjtCUaIxM/Je1ThdfuAflFZD2nya498S4IXKquWdz+
	59Foraq5nAsBF10N4ei+OQx5EgY5bTOkGPZ7xLETc+6rfxxIKUhWyR7GMLOGlMA5cIWGr5WKoqB
	uwzXLT7atpK3QatyC1mwZuyELRc8rdZHIpa15q/y5F9c+WEVolvOrC/Sp/sRYeWr7ktYYD9IRjf
	OxRPHiQPvuQQm/d548FgpTJZHOHl/oQuamBSgLxOljqBvRmRO2SUXoj0Nz6UPnHL4EeBytQ5uBH
	vWsBb3NtxQk/MMa6n6M+r4RhuC5i0zvj0lhtZRLuRbIXJyvsiAVDLl4eRHSZ/llek1GVP0z9XLj
	ZFlXbtqk3UNiGI=
X-Received: by 2002:a05:600c:3516:b0:483:a21:7744 with SMTP id 5b1f17b1804b1-483a9637590mr165145385e9.26.1771926515200;
        Tue, 24 Feb 2026 01:48:35 -0800 (PST)
Message-ID: <72f6e508-c75a-4aaa-a727-8cfeaa204d8e@suse.com>
Date: Tue, 24 Feb 2026 10:48:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] tools/tests/x86_emulator: disable xmm* tests on clang
To: Edwin Torok <edwin.torok@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1771840208.git.edwin.torok@citrix.com>
 <9e380de50b64e45e9044a2f4bcf1a5bdb7e74a29.1771840208.git.edwin.torok@citrix.com>
 <7f6cca68-f681-41ce-8d2c-2f4854510759@suse.com>
 <E1E1F4B3-C0FE-4077-A6E1-738056D5B370@citrix.com>
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
In-Reply-To: <E1E1F4B3-C0FE-4077-A6E1-738056D5B370@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:edwin.torok@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 156BF184E92
X-Rspamd-Action: no action

On 24.02.2026 10:34, Edwin Torok wrote:
>> On 23 Feb 2026, at 16:10, Jan Beulich <jbeulich@suse.com> wrote:
>> On 23.02.2026 11:04, Edwin Török wrote:
>>> clang-21 doesn't support `-ffixed-xmm0`, so `%xmm0` won't have the
>>> expected value.
>>> Disable these tests on clang.
>>
>> I don't think that's what we want, and not only because of the clutter the
>> various #ifdef cause. We want to be able to run as many of the tests as
>> possible, so the first goal should be to find some alternative mechanism to
>> achieve the same effect. A global register variable comes to mind as a
>> possible option.
>>
>> Further, how did you arrive at which tests need suppressing?
> 
> I used gdb to look at the 2 memory areas, and noticed that the XMM region was different between emulated and actual when built with clang.
> Then I noticed the build failures due to the lack of fixed-xmm0.
> Then I added the ifdefs one by one as I ran the test until the whole test program passed without failure.
> I tried adding some ‘pxor xmm0, xmm0’ into the cpu_has_sse2 sections, but that didn’t really work either.
> 
> Although I may have been misled by the overlapping region, see below.
> 
>> I don't think
>> we rely on an "expected value" anywhere. I don't even recall us passing
>> -ffixed-xmm0 when compiling test_x86_emulate.c.
> 
> Yes, I’m surprised it works with GCC. But maybe only because the emulator overwrites the actual FXSAVE area corresponding to XMM.
> XMM0 begins at offset 160, and 0x100 - 0x80 = 128.
> AFAICT the actual execution stores its result at [0x80, 0x80+0x200), and the emulator stores its result into [0x100, 0x100+0x200).
> So the emulator will overwrite some of the values from the actual run. 
> 
> This only works if the end of the FXSAVE area looks like its beginning (i.e. if FCW/FSW/etc. happens to match MM6/etc.)

Are you possibly overlooking the fact that res[] is an array of unsigned int elements,
i.e. the offsets used in source code all need to be multiplied by 4 to give offsets in
memory?

Jan

