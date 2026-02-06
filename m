Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qE40JYIChmmyJAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 16:02:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6D3FF676
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 16:02:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223322.1530879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voNLZ-0001QX-K6; Fri, 06 Feb 2026 15:02:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223322.1530879; Fri, 06 Feb 2026 15:02:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voNLZ-0001NQ-H6; Fri, 06 Feb 2026 15:02:13 +0000
Received: by outflank-mailman (input) for mailman id 1223322;
 Fri, 06 Feb 2026 15:02:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8hvW=AK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1voNLY-0001NK-P3
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 15:02:12 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfd9470e-036c-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Feb 2026 16:02:10 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-480142406b3so18060795e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 06 Feb 2026 07:02:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48320978108sm28935295e9.7.2026.02.06.07.02.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Feb 2026 07:02:09 -0800 (PST)
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
X-Inumbo-ID: cfd9470e-036c-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770390130; x=1770994930; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=J2vEvvZsMtMoC9IZOQ21H59oFhwHjgyBrGXIbGtUX1c=;
        b=d5OwRzvuE9DdB5efs9wiajBzs+ZEFvhBs3H3genclXwK78IyeOBwV1hV0R73AqfzPf
         w2VVVG6KT2/lHUYHMU3M+n8WjEMEf/z2Sx1xvgDsuDQt9spZETZNj7VykLxueZHp6H0O
         iXjtMhpt877n7zRb0tbeTdGNsNELmDWQKosJX4bS7zA4Un7K4TGeA9oAIVHDE/Sgu+ZN
         oZGn9eTOMwwjPtE3PSWtQHTM6LwTJmQGpP3IJrecKa3h6PmFk1YwBFhKGcX33O7LCdmj
         FP9CvwBOArcxlWlMT3Vb4VPh/8pewI/woYzyY6rWcPM68IGDJk6hPNn5EqLVV77aSqod
         Fu8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770390130; x=1770994930;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2vEvvZsMtMoC9IZOQ21H59oFhwHjgyBrGXIbGtUX1c=;
        b=L0BB7J6eYz0Yt0j1pb399b6pa8OiD4aeV/iNlk8Rh9fNSwbHjvJyql7wLB0SMJPDYA
         xMUSBHnZg/p/z8B1kz3Yfn32d779oIuPfWiOIdxZQTCWAcTT0ntfLME3b5FSF+NUCrLK
         q6TIhmUv7GhN87oujkCN9D2HzpQQCk5XWJApGXatKFUxBTKqz5Lop6dOnlQf8JbJaiKU
         +9zt6pCG0b92CS4Mvpxb4D6M/55Otp3OgiRmxxcLoQ7r5WouzqP59NbQzcw8pAm71z9w
         Aip1AJhJdpnA5i5ixV1iKbAZeIiF1CmFh6GcaUj89Of1aXrs4twC/v+SRrxqn2N+phEl
         T0Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUqYMXuL9Ct0MhTDPN+kK8fQXCepqAUtulnnCv2Xfhl/Xc9YZ9eqU0N2MprnJZDDmRRGSMPwU+EvF8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YySZJxJ9nirZZqe4XIKjnadueeRDZgDGIpKAq55k29tH+GurIWH
	hQ7l/I3suVC6/9xr6qjxPiqxoFu8H2yWXWHqkQTiSAt7h7mghbxKaV3lNyXM+TJ4RQ==
X-Gm-Gg: AZuq6aKeN910VEJ2xm8eOpXoQYGfcAji/gwTTehUpVAlsBNI9/dbcTdGz3jvrITsy2y
	yslNnS4meD8lV4vjVlJjNE8xO5qCKJ1e6e5dNUaFWOOWweE6qsGF03eAKDQ7tA6/wNHRbPXZ09l
	FdmE/lslfU0GEhxZHF4EcVeh0o8H1ZrjL9i1DBm0mK0xce2kBDrjrb0cokr6KdcEBJpBmc0u47l
	RkIWn38Bu+XOe3iIhceebw7Q/3Tk+WpIJDVwLHBesE5GOpOcmfMWEz7AIWF/kvfCbb79w3+ZoE+
	yeTzIvIleR2swQcinxxAMfl+H0RErJ0sBKizRqljlJPVV5c0qs8Lu6j0yYCP2/7P6i6qRG1D8WT
	IDD0Zh3/E5x0u8RZTZFJMopj8D8WYffG3nEsPdwthD/z8Jivs5EUrfvpsMro6c8A8RBh/5+imkG
	41GmIs154c1hHPxCfZbAZFRTgHwV4YIj9lpC5l2Zr9f9qG32HGaVJ5rYaME9rpZILgAgiZmiDlv
	oo=
X-Received: by 2002:a05:600c:8b57:b0:479:35e7:a0e3 with SMTP id 5b1f17b1804b1-4832021d9b3mr46394515e9.30.1770390129614;
        Fri, 06 Feb 2026 07:02:09 -0800 (PST)
Message-ID: <436bb64f-39d9-4b01-9f50-7a734f3e6764@suse.com>
Date: Fri, 6 Feb 2026 16:02:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched: move vCPU exec state barriers
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Juergen Gross <jgross@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1e2df446-b116-4861-a396-b87895a96c67@suse.com>
 <1beb7c04-5c21-4ba2-a74e-467f659224e5@gmail.com>
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
In-Reply-To: <1beb7c04-5c21-4ba2-a74e-467f659224e5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:julien@xen.org,m:sstabellini@kernel.org,m:volodymyr_babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:jgross@suse.com,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.907];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 6A6D3FF676
X-Rspamd-Action: no action

On 06.02.2026 13:57, Oleksii Kurochko wrote:
> 
> On 2/5/26 12:33 PM, Jan Beulich wrote:
>> The barrier in vcpu_context_saved() is specifically about the clearing of
>> ->is_running. It isn't needed when we don't clear the flag.
>>
>> Furthermore, one side of the barrier being in common code, the other would
>> better be, too. This way, all architectures are covered (beyond any
>> specific needs they may have).
> 
> Don't we want then move ...
> 
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/arm/domain.c
>> +++ b/xen/arch/arm/domain.c
>> @@ -333,17 +333,7 @@ void sync_local_execstate(void)
>>   
>>   void sync_vcpu_execstate(struct vcpu *v)
>>   {
>> -    /*
>> -     * We don't support lazy switching.
>> -     *
>> -     * However the context may have been saved from a remote pCPU so we
>> -     * need a barrier to ensure it is observed before continuing.
>> -     *
>> -     * Per vcpu_context_saved(), the context can be observed when
>> -     * v->is_running is false (the caller should check it before calling
>> -     * this function).
>> -     */
>> -    smp_rmb();
>> +    /* Nothing to do -- no lazy switching */
>>   }
> 
> ... to common code with ability to re-define sync_vcpu_execstate() by arch
> as only x86 does something inside this function?

Indeed this was considered already, as a possible next step.

Jan

