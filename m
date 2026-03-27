Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPJOOF1ZxmkrJAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 11:18:05 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB673425AE
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 11:18:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1265322.1556305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w64G0-0004qr-GH; Fri, 27 Mar 2026 10:17:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1265322.1556305; Fri, 27 Mar 2026 10:17:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w64G0-0004o2-DL; Fri, 27 Mar 2026 10:17:36 +0000
Received: by outflank-mailman (input) for mailman id 1265322;
 Fri, 27 Mar 2026 10:17:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w64Fy-0004j8-OT
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 10:17:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w64Fy-005Tsv-4S
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 11:17:34 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c65937-2eae-0a2a0a5409dd-0a2a4508cbe6-46
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 11:17:33 +0100
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c6593d-1950-0a2a45080019-d155dd34a5a0-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 11:17:33 +0100
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-439b6d9c981so1225006f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 03:17:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919e722dsm12824398f8f.35.2026.03.27.03.17.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2026 03:17:32 -0700 (PDT)
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
        d=suse.com; s=google; t=1774606653; x=1775211453; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+B6wstCydzAEGTgL1iPeEd+t1hg3s3EyAxpurnUpQA0=;
        b=eZDAmGKgkJucgBSTjI+A1pM1HuE+TEZq2qiVCGAHKEGZNthyTgbfRBX+ffoosCELPb
         CQfdOR9chLBHaCd5SNfpRL2SFoSpT955uglCIlxexSbYhw3Pl5GiSMSGXR1FTI/luFQu
         TmMv8be0TBW4cKtRJOnXwlVgRsjCmWW2HR3toznCOOZlK6gzMDa+NhhIVsQcsq1eE+Tr
         7gLFsOx1joZYHfdabHiRifWJqRKVx2NkAmTGPdsQ27jslJiWN+6sOojr91TjlamhxDDj
         yqezmbNqT+Cy0lnPKiZJp6QtDDlcSancnzkN/7KWrcYoZbffJ7EXJ+Uz3djIi8rBvnk6
         RiHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774606653; x=1775211453;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+B6wstCydzAEGTgL1iPeEd+t1hg3s3EyAxpurnUpQA0=;
        b=l9fe4+ZR2QXGZdabUMAC4/KkTlD5qkTkcINUhSdZ+GrvveBkM6yOkgvtA3T5NtC7jB
         42w37Sz7MiVE+pdMLPmjxtn6DsTdB3tw+SxFVdtBcueSZf0JEK/WMYBlE1sqM9T8ljr1
         hXJYsYWuXF+RY1JzD/nNG0fSK0Aq3zrVh3B36uqNDhlLEY+npqF2DXZcrF51oMsqpXdm
         20+IUBfTRrTzVq2CgNSY6uUV2AsdPDeb7T+mGu1fNRULjzhxlUWEQftFPmvRE+sZ0Tj4
         iKI2UFIprYdys76Vo8NNetTIW7OGY8ho6rmY4XxbczvqFqHD0z4fSiXfHZSCbjuT3UPl
         XsKw==
X-Forwarded-Encrypted: i=1; AJvYcCXRJiYv/ivZZnHr3I4OG3ZqqcmJXezkctpYkeZCnH7207XH/YZ9ekYWZ9noCuxxxUzfuxRIvewoUh8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyLRssQDfGWz/gpdcInwU2CY9evK9xsDNWy+n3cwW9i8Y+9+xzI
	yv+J002PbLd1Iza10ch/6I3WBN1WQ/2FAibeHvuKHUWmX2dDWa7AcGyV3Nj7ufZhVg==
X-Gm-Gg: ATEYQzyOJOoXWrJ4zp59M6WSHI5p9o1LIBNtQlBHkU0lwewrgMbjsrk1I0aMSYR4f82
	q+VnSSuPyCNzilMTWF6cfXxRMSPVopC2Gl8sBDGGWt/J/ar2RBNfs3P6zn736FA4eGc69tRdMro
	V8pCxOVI6M6CaOx8H/fY5D+K2c60VYfuRibkb5hn5TsXQv/CGDzuxFNTd89q4nKOt36e63mF0P4
	/AV+wOsrogzHnVt60ycor+kYrJmMCsKSnrD1iweAC0ZQjCKAgiOW6/wC14IMdlv25mVXa/BZg5b
	S4CW7YDR6PwT/oRldgCutBiHkuSKRqs7z4Pn/0J7Z3bjfrcXXLMr+iZhCVGu7lejNQt8ry/kz7I
	VUPNoinLp9g55paoGnNNdVt16rDnleXr+PrNu/v0RvhGPuQiddxl8FPdYC0S2sp5VviFsMmYcjJ
	3c9xNbxIl/ssQlD9+VMi2Amk2HGNr5sOzPrnSZ6DnxiSl7mOSKEk/vDRVa14fmAmOiqSqtFCDcc
	NV5VvOOL3any/c=
X-Received: by 2002:a05:6000:400b:b0:43b:94bf:63ff with SMTP id ffacd0b85a97d-43b9eb27f76mr2929039f8f.21.1774606653095;
        Fri, 27 Mar 2026 03:17:33 -0700 (PDT)
Message-ID: <e6a36adb-20fc-41ce-9db7-7c7bc4ba9fd5@suse.com>
Date: Fri, 27 Mar 2026 11:17:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/fpu: Initialise FTW as well as FCW in
 xstate_alloc_save_area()
To: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260326190429.1156367-1-andrew.cooper3@citrix.com>
 <20260326190429.1156367-3-andrew.cooper3@citrix.com>
 <a0cf5128-9387-4796-8440-7e33b6dd8337@citrix.com>
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
In-Reply-To: <a0cf5128-9387-4796-8440-7e33b6dd8337@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1774606653-E9086726-450BE835/0/0
X-purgate-type: clean
X-purgate-size: 1933
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:ross.lagerwall@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1DB673425AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 27.03.2026 11:04, Ross Lagerwall wrote:
> On 3/26/26 7:04 PM, Andrew Cooper wrote:
>> xstate_alloc_save_area() configures FCW and MXCSR to #RESET values but misses
>> FTW.  Fixing this means that the backing memory always has an architecturally
>> correct value.
>>
>> Adjust the comment to state that it's the #RESET values which we care about.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Ross Lagerwall <ross.lagerwall@citrix.com>
>>
>> I don't understand what the rest of the comment is trying to say, so have left
>> it alone.  There's still a lot of cleanup to be done to merge i387 and xstate.
>> ---
>>   xen/arch/x86/xstate.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
>> index e990abc9d18c..747df0b2e9a9 100644
>> --- a/xen/arch/x86/xstate.c
>> +++ b/xen/arch/x86/xstate.c
>> @@ -550,11 +550,12 @@ int xstate_alloc_save_area(struct vcpu *v)
>>           return -ENOMEM;
>>   
>>       /*
>> -     * Set the memory image to default values, but don't force the context
>> +     * Set the memory image to #RESET values, but don't force the context
>>        * to be loaded from memory (i.e. keep save_area->xsave_hdr.xstate_bv
>>        * clear).
>>        */
>>       save_area->fpu_sse.fcw = FCW_DEFAULT;
>> +    save_area->fpu_sse.ftw = FXSAVE_FTW_RESET;
>>       save_area->fpu_sse.mxcsr = MXCSR_DEFAULT;
>>   
>>       v->arch.xsave_area = save_area;
> 
> Is this comment correct given that it is initializing FCW to FCW_DEFAULT
> which is different from FCW_RESET?

Is the goal here to represent XSAVE init-state in memory, or do we truly mean
#RESET state (in which case FCW_RESET would need using, and in which case
leaving xstate_bv bit 0 clear would be wrong).

Jan

