Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOm8Ho/Fr2nWcAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 08:17:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7C824632F
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 08:17:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249820.1547213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzrKM-0000vu-Dc; Tue, 10 Mar 2026 07:16:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249820.1547213; Tue, 10 Mar 2026 07:16:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzrKM-0000uV-Al; Tue, 10 Mar 2026 07:16:26 +0000
Received: by outflank-mailman (input) for mailman id 1249820;
 Tue, 10 Mar 2026 07:16:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S17i=BK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vzrKK-0000uP-Ck
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 07:16:24 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a6e16b8-1c51-11f1-b164-2bf370ae4941;
 Tue, 10 Mar 2026 08:16:22 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4852ff06541so27869155e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 00:16:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485245dbcffsm112559375e9.18.2026.03.10.00.16.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2026 00:16:20 -0700 (PDT)
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
X-Inumbo-ID: 0a6e16b8-1c51-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773126981; x=1773731781; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uV76+llFq4AaGCDzTuZZ/2XFlOJWtZBta/pWcVVXHBc=;
        b=Y0DIMsAKBXX2he6xnQvQhqxcYgZjBN7352cCGyLH1GnNEUsHRhZoyuUM41k/5NGCnN
         GM2N5vnMOhkHnsqNcmwKoV39IaAsJGfaErlcL5GBf7IpT0DQNp2lSpVyCVSFkrLyQ9+Z
         KrIs1GkIUa2GLMQPl3qQ08tFgPC1xExd1HsVlbAmP16Ae6sL8IiF4iZ+51GOj7kbK+L7
         zo1EAZycffNwRMOAXshelSJqqEjD33hB1l/LJkXJWQtPmGuiCYwxS2bUbNKHWrYdsq7i
         1TNXdUW3tDd6V+/NiNDFxUKE+bOov2YrTWYk/7GcEo1qoxUrlFdMI0yevv1ibNYsQeN5
         Z61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773126981; x=1773731781;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uV76+llFq4AaGCDzTuZZ/2XFlOJWtZBta/pWcVVXHBc=;
        b=UBsxIPb0u2mva6DTwu5vSawuo1aSuxx+yPytuRu1i8+pClu2gqGsjMnrPvQiAeItLu
         EVsug2yL7LZb3zb3brMdqtTo35xmAjN0NwXtdM85D1JVTuEY//kaCTOtZ/r1F1N2oev/
         BjlM6hrRqRhGIimv7EFTt3Fm679gfKcVlracST1oKl7EyLVtk5poslCzDINMZBLBxoUE
         QxUUgKnGQCUw0lYIdNVHlA+cF6p/r3IbxkjofdhPqnXZKSNHfDTQO84IVGj5kiHQ9KIW
         kC39rydQgg8CkUFXFi0YwzilSyCUA0uMJA+aY36+U2x9D5Qke7RgSjatfPQxTusvtYWD
         F/OQ==
X-Forwarded-Encrypted: i=1; AJvYcCVU02Xy1iCIbaoI6g8dKjepJQKJPI+rUDY1Duwri/EkLIZGk5xhnOjd/4rv0Hkx53EHld8t6E9s7fQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyHDztYrWEAgpeISVzxMGfrEydL8alz9Hgw6pmZO47rxNPDed08
	zHprSPCQUp6yDag/UfEgtAhaPu4vC/Nv1uVUJLOztLID8xKaOr4XX0ZQxVb+QyYYig==
X-Gm-Gg: ATEYQzzSSoSWPFF03DOmlC+NXwS82V41St39vw61ZK+Lu2K0sdIX1mYsHSazaWdds5a
	9Q2puMHZCjVuN+uSIRAbDETrkopfBGlX6MfxnG7mylxQatF1rbZ9fIjiZNrkUYYLEWUJ9gucs4z
	VAo5iLcJ9IDBH7CBxikFCQ6g22a94CFyg/ctarVpGpmEPR+7bwfzy1+sHaXeg5WKFi3igBTqzlE
	fSlENoO8Mowoq95HSIuElihryv75tLi6UeGdrb44sduElrB2QXl3B7hCZ7JCTZC7I7tFvrI2EwF
	13rlAkB0qaUwzN6h89j8JaFH7AiZrDOSMSJjtXZnmhQ47xKPBq/R+oqCD6UllKUug4O5HDq//yX
	U3/P+yaUowyEAnb+Oo/GomPgOjMatZv8v5GWB7OVChdyZT+FckrA7XQ+8gFTfm+XFhMrglbOmU4
	4DcU8vUejjp4IZGnIXvMEA03a7N/TeyfQLQp7G8emGWghO9rvm44tXk3m4hgCG4hDGAuT3K7h6v
	Ge02MH0HNI+9iI=
X-Received: by 2002:a05:600c:a41:b0:483:c35d:367f with SMTP id 5b1f17b1804b1-48526957c15mr223332805e9.21.1773126981243;
        Tue, 10 Mar 2026 00:16:21 -0700 (PDT)
Message-ID: <fd39ace3-1caa-4869-9733-0cf737aac7f9@suse.com>
Date: Tue, 10 Mar 2026 08:16:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/14] x86/pv: System call handling in FRED mode
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260227231636.3955109-1-andrew.cooper3@citrix.com>
 <20260227231636.3955109-13-andrew.cooper3@citrix.com>
 <1fc7bde0-dbaa-4daf-b23f-a46b84219278@citrix.com>
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
In-Reply-To: <1fc7bde0-dbaa-4daf-b23f-a46b84219278@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AA7C824632F
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 09.03.2026 23:25, Andrew Cooper wrote:
> On 27/02/2026 11:16 pm, Andrew Cooper wrote:
>> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
>> index 2f40f628cbff..e2c35a046e6b 100644
>> --- a/xen/arch/x86/traps.c
>> +++ b/xen/arch/x86/traps.c
>> ...
>> +        case 2: /* SYSENTER */
>> +        {
>> +            /*
>> +             * FRED delivery preserves the interrupted state, but previously
>> +             * SYSENTER discarded almost everything.
>> +             *
>> +             * The guest isn't aware of FRED, so recreate the legacy
>> +             * behaviour.
>> +             *
>> +             * When setting the selectors, clear all upper metadata.  In
>> +             * particular fred_ss.swint becomes pend_DB on ERETx.
>> +             *
>> +             * When converting to a fault, hardware finally gives us enough
>> +             * information to account for prefixes, so provide the more
>> +             * correct behaviour rather than assuming the instruction was two
>> +             * bytes long.
>> +             */
>> +            unsigned int len = regs->fred_ss.insnlen;
>> +
>> +            regs->ssx = FLAT_USER_SS;
>> +            regs->rsp = 0;
>> +            regs->eflags &= ~(X86_EFLAGS_VM | X86_EFLAGS_IF);
>> +            regs->csx = 3;
>> +            regs->rip = 0;
>> +
>> +            if ( !curr->arch.pv.sysenter_callback_eip )
>> +            {
>> +                regs->rip -= len;
>> +                pv_inject_hw_exception(X86_EXC_GP, 0);
>> +            }
>> +            else
>> +                pv_inject_callback(CALLBACKTYPE_sysenter);
>> +            break;
> 
> This isn't actually a correct transformation of the IDT code.  When the
> SYENTER entrypoint isn't registered, this delivers a #GP at
> 0003:fffffffffffffffe
> 
> The simple fix to get back to IDT behaviour is to simply drop the
> subtraction of len.
> 
> In FRED mode, we can finally point the #GP at the SYSENTER instruction,
> rather than delivering at 0.  We could even provide the success case
> pointing sensibly too.
> 
> The question is should we?  Until now, the differences between FRED and
> IDT mode are minimal.  This would be major difference, and it's for
> SYSENTER which all but unused.  I'm erring on the side of "match IDT".

I agree. Down the road we could introduce an opt-in "better behavior" mode
when running under FRED (also covering other aspects previously discussed).

Jan

