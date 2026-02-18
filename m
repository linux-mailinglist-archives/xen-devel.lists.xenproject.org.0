Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OAyA53XlWlLVQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 16:15:41 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7023015757B
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 16:15:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235769.1538635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsjGR-0005Cz-5y; Wed, 18 Feb 2026 15:14:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235769.1538635; Wed, 18 Feb 2026 15:14:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsjGR-0005Ay-3H; Wed, 18 Feb 2026 15:14:55 +0000
Received: by outflank-mailman (input) for mailman id 1235769;
 Wed, 18 Feb 2026 15:14:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cF4C=AW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vsjGP-0005As-NM
 for xen-devel@lists.xenproject.org; Wed, 18 Feb 2026 15:14:53 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9230145e-0cdc-11f1-9ccf-f158ae23cfc8;
 Wed, 18 Feb 2026 16:14:51 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4836f363ad2so59828295e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 Feb 2026 07:14:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483983cf758sm20175595e9.17.2026.02.18.07.14.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Feb 2026 07:14:49 -0800 (PST)
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
X-Inumbo-ID: 9230145e-0cdc-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771427690; x=1772032490; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ejKGYYcKSl1yyojiwoaWBpbKznSBDiN085l/netShYg=;
        b=ICPH48MNAuLl9FxUM9VwmJ1KeZ0aGTyIDYiTtwNNwyba5lDuleFF69lfq5DMpjLdNy
         clJ+NqxE3yY3GSK/hTj5xZ4ebF7bEJLP9Dx4xpTymBWgiF869UB/Q9ejrt6jS8w/Es5s
         hU5mOw5MM0hXBljW2CE6x/lpysI7OaVdO2wswTLaz+QEgjloo6pSqS/IMN60CtNuaZMG
         XQAe/Rsdho9LJhsSjbXzLWezq7Ud1OsxvUMObdohpgmx8c4WbsfNIPouQaGrP+esdyk8
         hIQJDJNbFb/KCeMxJuecY+WM10FHvtQIi6pA5SDVRtfC/bNnVSJ08+p0K+JhwJ9IZFya
         EP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771427690; x=1772032490;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejKGYYcKSl1yyojiwoaWBpbKznSBDiN085l/netShYg=;
        b=A+Fwj/JN0262FCHTHN88CbDoqBooZ+n1AkkfdtnVrR1ZlFgVYgbAK9RcyUBz6RyoN5
         aRhvy95s8T4N29Jcrxmu2A+rVbCQs2Q9anyliOR1OWHtwXBSEnMlWKEhojPAJZ0essvY
         hYdljEkg21MFelpe2wbAI2t3dvybxvn378GXaIdaTKucK5DGnkdvb9PiIYomgpuW0Rtz
         aNXUwnTIxwfr1pKUSs+b/dxMeMT/uhzIGL/iklSSPHv+HiW6qpPZ3JfmYdtgER/Z00v8
         +7umIaNN1bo9EumDaGnvmyzPP0eZilgkNCx5rCWQIKF8ConnyAboubbQkkPSt8w2U0QG
         bOWg==
X-Forwarded-Encrypted: i=1; AJvYcCUPRa+4ENjUqtuQLKLc++Uh3jDVGAr0vuTIBQLEFv4o0xcu2ByMa27ntzuG6ayUQJ1RF9g9nHSus9o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxkPeMGF/vrx9AJcNpUObJHE1XNwiYS+AamN16WiSOGw1A0bmFq
	LEhFVxYcbj4xBoLlqyYenf/YDLNoxj7PqE6j7I17qsNcR86LWEvzb0ZMUchRjZmdBw==
X-Gm-Gg: AZuq6aKlz0IHYZ8J7Dq5Q+xVtvhNRj4r3viYpEWc5awsSYbr0U9vA0lJJmHz/h9HJ7l
	B5QYnrpRpUFjq5oSGAz46MYB//DuwnMmO5QTN2ngBEblhR3IctySwEdjh+UGe5fV11ZS0o0iOde
	9pX2vWCrHWUeVkvgsrXnkd+bQf1gMVRn/bTSNwbb4J11KV8ydD0F6F1hsKd7jE8bp8IjVp6psX5
	mnnvbCeCbs0QveU0pMLzqAIVwLEuAS9zml5hmlYYeJn2cusaMEFuhy8mQCH1GLpryr8QQ0UMbwh
	Navj2/X/p0D844c74LZmmy9IcxjdfWLEpaFULdTRUyTHPoHeEOeWXsIVnRWXIz5ulXGOtIva9Um
	/xkDEIM2+9DZSfv0G/MAya+uB/fyNnSnNqqPybaoW8XX9iyPDbXlkfj6RdeUm6XIuRHEwjNG8JG
	D+npTaYBAfrgu1ApizemSvO/PpAjgCWC2FqSVJqlxRGq1L39p8JjaEKLRYJ2BsCX6p9qVj6olmY
	Pz0BSjg3F4j2ek=
X-Received: by 2002:a05:600c:4e4d:b0:477:c478:46d7 with SMTP id 5b1f17b1804b1-48373a3e749mr299892365e9.22.1771427690408;
        Wed, 18 Feb 2026 07:14:50 -0800 (PST)
Message-ID: <e08b65e3-8908-4882-9481-d4aa7dbfcfa1@suse.com>
Date: Wed, 18 Feb 2026 16:14:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/5] xen: change VIRQ_CONSOLE to VIRQ_DOMAIN to allow
 non-hwdom binding
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 grygorii_strashko@epam.com, anthony.perard@vates.tech, michal.orzel@amd.com,
 julien@xen.org, roger.pau@citrix.com, jason.andryuk@amd.com,
 victorm.lira@amd.com, andrew.cooper3@citrix.com,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.22.394.2602041533440.3175371@ubuntu-linux-20-04-desktop>
 <20260204233712.3396752-2-stefano.stabellini@amd.com>
 <82c06e52-1db0-46e5-be9f-7ca0360ffc70@suse.com>
 <alpine.DEB.2.22.394.2602091520460.1134401@ubuntu-linux-20-04-desktop>
 <43e80ad6-7b42-42de-b36f-1a9079589912@suse.com>
 <alpine.DEB.2.22.394.2602131206040.6031@ubuntu-linux-20-04-desktop>
 <053d2624-2891-4534-83f0-b05e190afe3b@apertussolutions.com>
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
In-Reply-To: <053d2624-2891-4534-83f0-b05e190afe3b@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dpsmith@apertussolutions.com,m:stefano.stabellini@amd.com,m:grygorii_strashko@epam.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:victorm.lira@amd.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim,amd.com:email];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7023015757B
X-Rspamd-Action: no action

On 18.02.2026 16:07, Daniel P. Smith wrote:
> On 2/13/26 15:09, Stefano Stabellini wrote:
>> On Tue, 10 Feb 2026, Jan Beulich wrote:
>>> On 10.02.2026 00:23, Stefano Stabellini wrote:
>>>> On Mon, 9 Feb 2026, Jan Beulich wrote:
>>>>> On 05.02.2026 00:37, Stefano Stabellini wrote:
>>>>>> Today only hwdom can bind VIRQ_CONSOLE. This patch changes the virq from
>>>>>> global to VIRQ_DOMAIN to allow other domains to bind to it.
>>>>>>
>>>>>> Note that Linux silently falls back to polling when binding fails, which
>>>>>> masks the issue.
>>>>>>
>>>>>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>>>>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>>>>
>>>>> Technically this is an ABI change, and hence I'm uncertain it can go without
>>>>> that aspect being at least mentioned, perhaps even its implications properly
>>>>> discussed.
>>>>
>>>> I am not sure if it qualifies as an ABI change or not but I am happy to
>>>> expand the commit message in any way you might suggest.
>>>>
>>>> The jist of it is already in the commit message, really the key element
>>>> is that VIRQ_CONSOLE can be bound by multiple domains.
>>>>
>>>> Aside from spelling out "this is an ABI change" what do you have in
>>>> mind?
>>>
>>> What I mean is discussion of the implications for domains using the vIRQ.
>>> Previously most domains would have attempts to bind this vIRQ rejected.
>>> Technically it is possible that kernels had code paths blindly doing the
>>> binding, relying on it to work only when running as Dom0. And really, you
>>> appear to break XEN_DOMCTL_set_virq_handler when used with VIRQ_CONSOLE,
>>> without which its binding wasn't possible at all before (except for the
>>> hardware domain, which get_global_virq_handler() falls back to when no
>>> other domain is set). Or am I mis-reading things, as I can't spot any use
>>> of VIRQ_CONSOLE under tools/, whereas I would have expected provisions
>>> for (host) console handling to be delegated to a separate control or
>>> console domain? Of course other toolstacks (the XAPI-based one for
>>> example) might actually have such provisions.
>>>
>>> And then there's the XSM question: XEN_DOMCTL_set_virq_handler obviously
>>> is subject to XSM checking. The same isn't true for VIRQ_DOMAIN-type
>>> vIRQ-s. Yet this vIRQ isn't supposed to be universally available to
>>> every DomU. Instead the ->console->input_allowed checking is kind of
>>> substituting such a check, which iirc Daniel said (in more general
>>> context) shouldn't ever be done. IOW in patch 5 you're actually effecting
>>> policy, which should be XSM's job aiui.
>>>
>>> Bottom line: The patch may need to be more involved, but at the very
>>> least the description would need updating to justify it being as simple
>>> as it is right now.
>>
>> What do you think of this:
>>
>> ---
>>
>> xen/console: change VIRQ_CONSOLE from global to per-domain
>>
>> Previously VIRQ_CONSOLE was a global VIRQ (VIRQ_GLOBAL type), meaning
>> only the hardware domain (or a domain explicitly set via
>> XEN_DOMCTL_set_virq_handler) could bind it. Any other domain attempting
>> to bind would fail with -EBUSY because get_global_virq_handler() would
>> return hwdom by default.
>>
>> This patch changes VIRQ_CONSOLE to VIRQ_DOMAIN type, allowing any domain
>> to bind it independently, similar to VIRQ_ARGO. The console notification
>> is now sent via send_guest_domain_virq() directly to the focus domain
>> rather than through send_global_virq().
>>
>> Implications:
>>
>> 1. Guest kernels that previously called bind on VIRQ_CONSOLE blindly
>>     will now succeed. Linux handles binding failure gracefully by falling
>>     back to polling, so this should not cause regressions.
>>
>> 2. XEN_DOMCTL_set_virq_handler can no longer be used with VIRQ_CONSOLE.
>>     The domctl explicitly rejects non-VIRQ_GLOBAL types. This means
>>     toolstacks that relied on set_virq_handler to delegate console handling
>>     to a separate console domain will need to use a different mechanism.
>>     Note: No known in-tree toolstack uses set_virq_handler with VIRQ_CONSOLE.
>>
>> 3. VIRQ_DOMAIN bindings are not subject to XSM checks beyond the
>>     standard event channel allocation policy. Access control for console
>>     input is enforced via the per-domain console->input_allowed flag,
>>     which is set for:
>>     - The hardware domain (by default in domain_create())
>>     - dom0less domains on ARM (in construct_domU())
>>     - The PV shim domain on x86 (in pv_shim_setup_dom())
>>     - Domains with vpl011 using the Xen backend (in domain_vpl011_init())
> 
> Actually this goes back to the concern I have raised many times, 
> is_hardware_domain() always serves a double purpose. The explicit check 
> that the domain is where the hardware is, but also the implicit access 
> control check that it is allowed to do the hardware access. The implicit 
> access control check is a subversion of XSM and the reality is that the 
> input_allowed flag is just unmasking this subversion for an explicit 
> access control check outside the purview of xsm.

I don't think I can deduce from this what your view is on the change proposed.
There is, as per what you say, an existing issue with is_hardware_domain().
(Likely at some point you'll propose patches to address this.) What I can't
conclude is whether you deem this new issue "okay(ish)" on the basis that some
vaguely related issue already exists, or whether you object to this new way
of "subversion".

Jan

