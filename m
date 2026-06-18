Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tqcSAQ8GNGp6LQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 16:51:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BEE6A1070
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 16:51:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=eFRXMBhO;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1341245.1601705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waE53-0006cd-38; Thu, 18 Jun 2026 14:50:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341245.1601705; Thu, 18 Jun 2026 14:50:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waE52-0006b5-W4; Thu, 18 Jun 2026 14:50:56 +0000
Received: by outflank-mailman (input) for mailman id 1341245;
 Thu, 18 Jun 2026 14:50:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1waE50-0006av-Vh
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 14:50:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waE50-00EvFC-8u
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 16:50:54 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3405cb-2eae-0a2a0a5409dd-0a2a4509bc50-6
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 16:50:54 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a3405cd-4999-0a2a45090019-d155dd2bc0a3-3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 16:50:54 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-45eea68dd6fso609584f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 07:50:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4620b1083e3sm20785780f8f.20.2026.06.18.07.50.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jun 2026 07:50:52 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781794253; x=1782399053; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OnAsW+mOMZlaoSSRnLfmPqdezOhqrvG1MnW48XYmMwo=;
        b=eFRXMBhOzfDhLjlNlFgqN6vyBSZtxlMoICwr+1Tondtww10XxOJPaTO/GUzXESm24d
         FXpYu3ADxnsgy6XyATnA/grihzALMkbrGBL9VA7VqqiETcsw1FhSZ6tIxpyatKKgpUH/
         wnyHNI/BwDSlsnzs0tee2RDx1fM4JjTt5B/Xg82I8el5IcazvGC+BC23fV5bs5L//0+H
         M1LBVfVMlUE0HX+PZ0+JTHp5X/Kv2hiZStPqtr9UqzXrBVm6vU83c/OMpIwbqmqjsPzU
         d+/CJj6VxgVfuGLgu1gb+aXqxTMwgE7Kx0iyod9lp9tfqSlqcyo60Uv82Ebn2/EjpxgV
         C+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781794253; x=1782399053;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OnAsW+mOMZlaoSSRnLfmPqdezOhqrvG1MnW48XYmMwo=;
        b=O7FyiicycKQVMgmaMVLssZ0ARmIGSoqf7LReC0y9dWKwE+StAN4rz7bTutNFjt1/Fp
         HMHqvCMvfwQIKHq8N0wVb+HjdKyaiqE9DiBfW4+WLkoZd4WvN8lMhcbG0VNFQsQTD0Mj
         Lvi2W0N0bpbbokw5CfIVGR4i75TJY6eqjfaiym7jegRD5BhibSVy1Wd0cMgoj0pbw8Oy
         Ofq/eeoV/oCmeQHMIZL6GRCapuxCguSTgBCfc1FjNt7G9jxl+pfc/nUIw/plT/ZlLLrb
         3slupZi5KV0wClFFUDUUmhe42TKs1UfkyT+hyzfsR98/9cmGXh2oaexIME4zaSjpWYTg
         HZFg==
X-Forwarded-Encrypted: i=1; AFNElJ/bL/auH8W4szqksYGq1pJIWm8T0XANyxifKfLknwRLGjIAPz2yulSMb+01Est/di42xy4D00O1GrQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzKgOWV9uNJsV+LQKdRyN//h3d3edczyA/0mUEQ1vDzf9gwwz11
	/IE6HVtxPYDO5dx08DEGcy+jzbGmMiivm18mp/0Jz4iMznvcHPmrRsfXCdZ7g/f1Bg==
X-Gm-Gg: AfdE7cnggdg0pi7QApgYa7SU/p1gdyCsanmeD5Rl+SJaQ65diOlLBJL0zlvndPe2BQ6
	6ivmcAinWDckvsLo/0L/a0lD0UvFM+AXQ5Fnvaf4RRQrcXq43TA9702fQDDuqgBV8aA59viu7tO
	AFbNtinp596VnaNZODfNosQQ6um7/z85aA2mmDRvr85uvVpMy+lSHAyd+8SfsZ6OuxijA+QjYla
	7Ax4/O1PJarrR4qIxbFTGxHBIxHjgPd99NLTNwmV9xnjvxiP8Nh8jNOE7k+yYKQuQwkOwv9/xIM
	AYtbUTSU1Sgv2wzUSX2yMTkDb86ybNsHrIe3g43AVPhkMfmUzbhdtIm0fdXwpZ7i9qgTXHeJ3AL
	wdaaGzwGFPPFsP4Iv6ig4IyByXqDfHPxYhohCu/32qAIW6B8mw/dlV8wNdwwh4tuFHwPzM6w9hb
	vSYXHiTtFfxyQ4lEFASnBGJdgzYwbgfR9NAETIwfM38Ii6fZGpRjdbAM5i8rPRRCHxODoiBb7Nt
	oqv
X-Received: by 2002:adf:e612:0:b0:44b:5398:4e85 with SMTP id ffacd0b85a97d-462410d3e44mr12154680f8f.22.1781794253243;
        Thu, 18 Jun 2026 07:50:53 -0700 (PDT)
Message-ID: <0d5d4fda-d296-4027-a62a-134fd8aaae53@suse.com>
Date: Thu, 18 Jun 2026 16:50:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] XSM: guard .sysctl() and .readconsole() hooks
From: Jan Beulich <jbeulich@suse.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <bf642902-7235-45a8-a470-f164a930c0c1@suse.com>
 <8536e453-423d-45a0-bb82-38283eca4786@citrix.com>
 <0604a985-96fc-454f-b9a1-242bc6cce9b6@suse.com>
 <a3e51817-4464-4672-a975-ba76349bab31@apertussolutions.com>
 <243c5119-a016-49f4-919e-efa492b02e5e@suse.com>
 <d6071252-a8fa-44b5-923e-b08175ab0fa7@apertussolutions.com>
 <12468fb6-0cf7-4e27-89ca-8ec4640e569b@suse.com>
Content-Language: en-US
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
In-Reply-To: <12468fb6-0cf7-4e27-89ca-8ec4640e569b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1781794254-F59FF744-868519D4/0/0
X-purgate-type: clean
X-purgate-size: 2829
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dpsmith@apertussolutions.com,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.xenproject.org,citrix.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	RCPT_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 51BEE6A1070

On 18.06.2026 14:51, Jan Beulich wrote:
> On 18.06.2026 14:48, Daniel P. Smith wrote:
>> On 6/18/26 8:42 AM, Jan Beulich wrote:
>>> On 18.06.2026 14:34, Daniel P. Smith wrote:
>>>> On 6/18/26 8:23 AM, Jan Beulich wrote:
>>>>> On 18.06.2026 14:13, Andrew Cooper wrote:
>>>>>> On 18/06/2026 12:32 pm, Jan Beulich wrote:
>>>>>>> Leaving the hook pointers in struct xsm_ops when !SYSCTL would lead to
>>>>>>> the BUG_ON() in xsm_fixup_ops() triggering for respectively configured
>>>>>>> hypervisors.
>>>>>>>
>>>>>>> While moving the #ifdef for the corresponding xsm_*() wrappers, also move
>>>>>>> those for xsm_page_offline() (where the hook pointer field already is
>>>>>>> suitably guarded).
>>>>>>>
>>>>>>> Fixes: c9eabaa03a68 ("xen/xsm: wrap around xsm_sysctl with CONFIG_SYSCTL")
>>>>>>> Fixes: bddd9af6049f ("xen/sysctl: wrap around XEN_SYSCTL_readconsole")
>>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>>
>>>>>> Ugly.  We probably ought to see about booting the RANDCONFIG hypervisor
>>>>>> too, which should be able to spot things like this.
>>>>>>
>>>>>> This is a regression vs 4.21, so does need including.
>>>>>
>>>>> Aiui it's a regression vs 4.20, i.e. will want backporting to 4.21.
>>>>>
>>>>>> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, although...
>>>>>
>>>>> Thanks.
>>>>>
>>>>>>> --- a/xen/include/xsm/xsm.h
>>>>>>> +++ b/xen/include/xsm/xsm.h
>>>>>>> @@ -61,8 +61,10 @@ struct xsm_ops {
>>>>>>>    #endif
>>>>>>>        int (*set_target)(struct domain *d, struct domain *e);
>>>>>>>        int (*domctl)(struct domain *d, struct xen_domctl *op);
>>>>>>> +#ifdef CONFIG_SYSCTL
>>>>>>>        int (*sysctl)(int cmd);
>>>>>>>        int (*readconsole)(uint32_t clear);
>>>>>>> +#endif
>>>>>>
>>>>>> ... this is now the 3rd CONFIG_SYSCTL in xsm_ops.
>>>>>>
>>>>>> I know it will grow the diff, but can we see about collecting them into
>>>>>> a single region, and in dummy_ops too?  It will shrink the overall
>>>>>> result, and the order of pointers in this ops structure is uninteresting.
>>>>>
>>>>> I have a far more consolidating patch in the works, which is how I actually
>>>>> noticed the issue. I'd prefer to keep things as simple as possible here.
>>>>
>>>> By the way, I was going back through this and notices that they are not
>>>> ifdef out in xsm/dummy.h. Are we relying on them being inlines to ensure
>>>> that they do not result in dead code?
>>>
>>> I think so. Maybe it's unhelpful that we have
>>
>> To be clear, you want to leave as is for now (or at least pick up in 
>> another patch)?
> 
> It's up to you - I can add the #ifdef there, but it doesn't look to strictly
> be needed.

Can you please make explicit which way you'd like it in order to provide an
ack, so this bug fix can go in?

Jan

