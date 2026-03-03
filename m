Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFOsJ0HMpmnIVgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 12:55:45 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 010141EEB8D
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 12:55:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244670.1544064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxOKs-0002ss-IH; Tue, 03 Mar 2026 11:54:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244670.1544064; Tue, 03 Mar 2026 11:54:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxOKs-0002rR-FO; Tue, 03 Mar 2026 11:54:46 +0000
Received: by outflank-mailman (input) for mailman id 1244670;
 Tue, 03 Mar 2026 11:54:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKVY=BD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vxOKq-0002rG-SC
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2026 11:54:44 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bcb1983b-16f7-11f1-9ccf-f158ae23cfc8;
 Tue, 03 Mar 2026 12:54:30 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4837907f535so48750925e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Mar 2026 03:54:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd750607sm471415035e9.10.2026.03.03.03.54.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2026 03:54:29 -0800 (PST)
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
X-Inumbo-ID: bcb1983b-16f7-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772538870; x=1773143670; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AVFhxFutpF3studja/ZLtYGSJGAcd6yQ/oiyg+/5vvY=;
        b=Y8AYmANMcKsf3BCJSnpMhehi+UvSU9lfS0smZHkQRXteO5bzmft0OXMOvwdVLsCnmh
         sUJkTY5QKzqbRsDkkcvkp+bEywwHx+64jg0tWMbO8Pw5Mkxo1QSgknryCPPIyPbT4cOT
         vRd/a1D6Lvs26FxqCqjaId+knPnzseFPwgiLcCVfug1J3PUgM67b3n3JnYSdeEWGJWET
         4D0DTT3QLwQOtrc23jtRcfKNdclkx8UpI3IdZsHTQ+V1nDOxmog5adOhxY6/dszWrzt/
         ijEdtA9jDTn7acHsIrZ4QR3Sd3bsyp4ZBV6Sg2tuenqsF8rBOlr4XkmdI0mPG/puJQGf
         5zyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772538870; x=1773143670;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AVFhxFutpF3studja/ZLtYGSJGAcd6yQ/oiyg+/5vvY=;
        b=H8zkMKdXqsGs8T4kfMKevdFojHKW9EUBi2lgD0Jf5lYUl1asmLnr1TTcVwq/K5FMUK
         Qlbtjp6Pjvron7ScmC/JRl9fIH0W1EZImD+L4l9vH7J92cVkHH8NBRMO6WHIfm7bVmZK
         4IbenqXJlDZVBszwN6UnXCAVfmCJsrpErJWN8cC9NETfi2VocBulpa3bgp/or6VOd9sT
         1ynXoKvaC23sWkN+y6nzZVxzvltgKIyJWHlrWEelMcTVEDiDDXDoNivkdz7xUDaav1fz
         Ha92v1K2ORj3ICpa2p8F3B/4mR16QEihxa5g06Sugrn181Mhxynu+cTkNjmPdC7xurK2
         b9DQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdI6SKpNxMaUYPTT/BA1r9K6t1V+L5Daz8lhxAMj2MhjEjEzdqXhiN7+re1At4uqFNOVd4NrVxdOg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzZDWTiL1XvDFV++WN9G5JysEyuRvnrYL/mLYVG1MUSsPIsPl8T
	nxafZtXcjsPxwKf1uMBUg50t9rWHRuocam0Y84ImAlADr3HWC+bHJ9fHPB//v7AvlQ==
X-Gm-Gg: ATEYQzyyvetK1Y7ixcIptNjKiEgQrA4KMSnTR40Daq2aqZsluI9UK6UgD/ueBFrmjbz
	mZAKvHqDb3/ri8P9gzPTh4Md55Q7aqzo0NbHGsXkStRZnSobMv7Us69f4IiNhJhSeWp39ma6dVy
	Izjh04pDQiLzltAs+a4kGnvEoHBmMm0a4mFfWTzDG4OYKViPerIoLjzt6Qtpig+5rxq56UQf7U3
	bzOtOvrmjtwMdZTvf03ZxlCDpYY9m9PiRuuRBDTAgppPzdpkoDxCXzYuyk+78aYmBGZ4ueVQflE
	f0W9S+EL3XlwsXpHvmczteSeGEzQ2/JvI4muoqibk9k41tRP0nTmboPVWznG3jHskfacQ3oR7vf
	6GLxu3lXnvQnmw5rr4BHmmBNOTMbxpw0kDmlBkYc4DPKf+kGl5JR0BBgc/WZxenSNIfiHUQ2PTh
	uj9XdPxCV66pNE0oD1x6nHJKK25X5wb7Xcyr3YEvYcAIFeiIDq2gZIMbDJJR8PsStLjAWrR47VB
	QYxZk+x48B3FV8=
X-Received: by 2002:a05:600c:818e:b0:480:1b65:b741 with SMTP id 5b1f17b1804b1-483c9ba3aadmr290397015e9.15.1772538869902;
        Tue, 03 Mar 2026 03:54:29 -0800 (PST)
Message-ID: <d7419a76-4c9a-4741-b738-9a4bdbfb0dd0@suse.com>
Date: Tue, 3 Mar 2026 12:54:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] xenpm: Add get-core-temp subcommand
To: Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <ec92e54a493a16f5bc085738e943b3778c3a0231.1772211384.git.teddy.astie@vates.tech>
 <aadf2e78f91f442964cc4e93c028b6b31fceb9eb.1772211384.git.teddy.astie@vates.tech>
 <7380cf63-e9ac-4df9-9633-c26f9de0027a@suse.com>
 <4c18413b-6296-4a30-bbec-561f7b802cbc@vates.tech>
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
In-Reply-To: <4c18413b-6296-4a30-bbec-561f7b802cbc@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 010141EEB8D
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,xenproject.org,lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 03.03.2026 11:50, Teddy Astie wrote:
> Le 02/03/2026 à 17:52, Jan Beulich a écrit :
>> On 27.02.2026 18:00, Teddy Astie wrote:
>>> @@ -1354,6 +1358,127 @@ void enable_turbo_mode(int argc, char *argv[])
>>>                   errno, strerror(errno));
>>>   }
>>>   
>>> +static int fetch_dts_temp(xc_interface *xch, uint32_t cpu, bool package, int *temp)
>>> +{
>>> +    xc_resource_entry_t entries[] = {
>>> +        { .idx = package ? MSR_PACKAGE_THERM_STATUS : MSR_IA32_THERM_STATUS },
>>> +        { .idx = MSR_TEMPERATURE_TARGET },
>>> +    };
>>> +    struct xc_resource_op ops = {
>>> +        .cpu = cpu,
>>> +        .entries = entries,
>>> +        .nr_entries = ARRAY_SIZE(entries),
>>> +    };
>>> +    int tjmax;
>>> +
>>> +    int ret = xc_resource_op(xch, 1, &ops);
>>> +
>>> +    switch ( ret )
>>> +    {
>>> +    case 0:
>>> +        /* This CPU isn't online or can't query this MSR */
>>> +        return -1;
>>
>> Further down at the callers of this function you assume errno is set whenever
>> an error indication is returned. As xc_resource_op() didn't fail, you will
>> need to synthesize an errno value here.
>>
> 
> ah yes indeed
> 
>>> +static void get_core_temp(int argc, char *argv[])
>>> +{
>>> +    int temp = -1, cpu = -1;
>>> +    unsigned int socket;
>>> +    bool has_data = false;
>>> +
>>> +    if ( argc > 0 )
>>> +        parse_cpuid(argv[0], &cpu);
>>> +
>>> +    if ( cpu != -1 )
>>> +    {
>>> +        if ( !fetch_dts_temp(xc_handle, cpu, false, &temp) )
>>> +            printf("CPU%d: %d°C\n", cpu, temp);
>>> +        else
>>> +        {
>>> +            fprintf(stderr, "Unable to fetch temperature (%d - %s)\n",
>>> +                    errno, strerror(errno));
>>> +            printf("No data\n");
>>> +            exit(ENODATA);
>>
>> In how far is using errno values as arguments to exit() a useful thing? (I
>> think you had it like this before, and I merely forgot to ask.) Yes, I can
>> see the tool using a number of exit(EINVAL), but I don't understand those
>> either. This way you can't even document easily what particular exit codes
>> mean, as the errno values may vary across OSes.
>>
> 
> I reused the exit(...) pattern used in xenpm, but I'm also fine by 
> returning simpler errors (like exit(1) or exit(EXIT_FAILURE)).

Anthony, can you please suggest which one better fits the toolstack as a
whole?

Jan

