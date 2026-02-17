Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qABaDDBmlGkFDgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 13:59:28 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9532314C377
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 13:59:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234982.1538048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsKfV-00069Q-Q2; Tue, 17 Feb 2026 12:59:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234982.1538048; Tue, 17 Feb 2026 12:59:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsKfV-00067z-NJ; Tue, 17 Feb 2026 12:59:09 +0000
Received: by outflank-mailman (input) for mailman id 1234982;
 Tue, 17 Feb 2026 12:59:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RxGT=AV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vsKfT-00067t-M0
 for xen-devel@lists.xenproject.org; Tue, 17 Feb 2026 12:59:07 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6cf20670-0c00-11f1-b164-2bf370ae4941;
 Tue, 17 Feb 2026 13:58:59 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4837907f535so28973065e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Feb 2026 04:58:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d5e11f5sm534954765e9.4.2026.02.17.04.58.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 04:58:58 -0800 (PST)
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
X-Inumbo-ID: 6cf20670-0c00-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771333139; x=1771937939; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/WCmpwbaJJgPAXucNE0zsL31kfnwk6q6vxi8Dnj5iHM=;
        b=GxmADRR1c9QdRCrVaX19yd5Ww3x9eA8gjoryfjzJ10ffmZB3XMTeMd3S1AcIwsPUiX
         lON1GSKqIxTWC+ozsVNrdy5m7D5JPw8Q1MxrFW3kNtfpCGN5f7WjOMdEKxYqnwmE1SoZ
         5H/mltY3W+xbk5PNAlClqkFlY4YN88Ad3Q65taHZ0M8AGeNFe8UJuz7H5wYRTNB0iy69
         KwxBInPAI6cPOZ7/uzjufnKXEBG4sEZX5bJPvhMQGBYtzNKcPEmL+I96Kgk4DYss+2P6
         LjKz392k9K76uJL/vGFv7t45YiE63d8EWTO7J/UQqqxpgrONCKILkEu9ut3CI90RsHC5
         /Yig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771333139; x=1771937939;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/WCmpwbaJJgPAXucNE0zsL31kfnwk6q6vxi8Dnj5iHM=;
        b=LkK2oflEeSUI82KvdfrT7tMSEpF5gU1PuOCi+0k3kHchkmSM8vsI5aP05ngY83HIGS
         PdmH5ZfhfYP6ecDAuHCfKhdapuo/OJUJU9iz2A7jfwIruch8HJj6kp7JGi+5vlzMSgjx
         2JETxDiWm6b6LMYwB91DWo8MGiYmZM9/+GkxIgrw141zNzziyXfjBBmaSjgZiTX8FVSl
         YvlValG5QKjAuOLX9w27Hkp3WRGfounJ7G8KRFr0wJx+TuORjS3xCrFnkehfECkCv9IS
         sJzxyAvT2hEV4Pv047u6xWWTYJv/KDA3NLw84lzK+VjsJ5ZlmVOffYiuubER8GS26EQc
         baKg==
X-Gm-Message-State: AOJu0Yy5/rWzwLP5DkuNswH1RHqlT8DXAURZn2F7qloWyqxX+FBvxhoa
	XhsEOn0CI+BqKD9I6QkF28e6hdcML0ws3G/xXWRenIk3FNZzSDW8JFMa9DnwbB5qHw==
X-Gm-Gg: AZuq6aLITYeCAwg6nzhGs8WvTMPU773kMKYGxaIQ76Bro83ef+pOgqpSowv6Ucm6OMA
	ri/G/aSPUH6tbXQjsooBWTwNtrZ2VZORMWN2yPjtRfvN+nTkTuQYZ24iNGxeb1jN1NrLBr+n/r0
	UShEFt4Ryy1VjI8+wqKZsy1PCIC7eMUdQMJIyLAxjuMqQagbWbj3yN+DI8dVt4twDveM0JDlJ2S
	bxqgJXWgrzXg8qmZow7m4nQcSbhzLpc+5caYvXZJ1H1FPaNHXYu1up3r/b2nmtks/pahHQqvfQh
	ToK9130l8H5ZBCfHWthSNf0Vv/nypxYRjGPoDOQa8PbBCGOhV27Pm119J7elaVyqBMUIdI1/flQ
	ZezC/6mhV2JAIhhly/QGl9HmSP0Eynj1nBunJOuMS0wKHrInU+KIwfv7o5Fl4lzK8NwzWHd97MT
	3qIQ29OssRVj7Qe3IAIQBzmwbkQMalVqo5UIA8MHhP8errVYGHrbABNtwqWUEWUwW5MLqfhgB2s
	N/DGDBq9vegcoE=
X-Received: by 2002:a05:600c:310e:b0:480:4b5d:9ec with SMTP id 5b1f17b1804b1-48379bf4709mr209789985e9.33.1771333138712;
        Tue, 17 Feb 2026 04:58:58 -0800 (PST)
Message-ID: <753e14da-39e3-41d0-bbbc-0e10c9594b9f@suse.com>
Date: Tue, 17 Feb 2026 13:58:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] domain: skip more stuff for idle's vCPU-s in
 vcpu_create()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>
References: <c0aef909-b294-40af-8d24-033b28450338@suse.com>
 <aZRLMePmm8ehD94H@Mac.lan> <a0e47cf7-91f0-471e-b6b8-6554f496190f@suse.com>
 <aZRVFVXYKzQmt3Q8@Mac.lan>
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
In-Reply-To: <aZRVFVXYKzQmt3Q8@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 9532314C377
X-Rspamd-Action: no action

On 17.02.2026 12:46, Roger Pau Monné wrote:
> On Tue, Feb 17, 2026 at 12:17:35PM +0100, Jan Beulich wrote:
>> On 17.02.2026 12:04, Roger Pau Monné wrote:
>>> On Mon, Feb 16, 2026 at 04:54:30PM +0100, Jan Beulich wrote:
>>>> @@ -516,7 +516,8 @@ struct vcpu *vcpu_create(struct domain *
>>>>      }
>>>>  
>>>>      /* Must be called after making new vcpu visible to for_each_vcpu(). */
>>>> -    vcpu_check_shutdown(v);
>>>> +    if ( !is_idle_domain(d) )
>>>> +        vcpu_check_shutdown(v);
>>>
>>> I would possibly leave this as-is.  I agree that the idle domain will
>>> never shut down, but it's possibly best to needlessly call into
>>> vcpu_check_shutdown() for the idle domain rather than adding the extra
>>> conditional for the common case?
>>
>> I'd prefer to keep it conditional: Calling the function for the idle
>> domain gives a wrong impression, plus it may be the only one where the
>> shutdown lock is used for that domain. We may want to make lock init
>> conditional in domain_create() as well (possibly with other things we
>> needlessly do for idle or more generally system domains).
> 
> I've been thinking about this, and I'm not sure whether it's the best
> approach to avoid initializing locks or lists for the idle
> vCPUs/domain.
> 
> It's certainly good to avoid initializing stuff that consumes memory
> or other resources, but skipping plain initialization (iow: setting of
> values) of fields that are in the respective structs seems dangerous
> to a certain degree.  If for whatever reason we end up with stray
> calls from the idle vCPUs/domain into functions that use those fields
> it's likely safer to have them initialized, rather than tripping into
> some uninitialized pointer or deadlock trying to acquire and
> uninitiated lock.

Otoh without doing so it's pretty unlikely that we would spot such stray
calls. Which better would be avoided imo.

Jan

