Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPIBHmdEzmlQmQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 12:26:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A7A387B49
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 12:26:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271499.1559623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8FFd-000187-In; Thu, 02 Apr 2026 10:26:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271499.1559623; Thu, 02 Apr 2026 10:26:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8FFd-00015z-G8; Thu, 02 Apr 2026 10:26:13 +0000
Received: by outflank-mailman (input) for mailman id 1271499;
 Thu, 02 Apr 2026 10:26:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w8FFb-00015s-HM
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 10:26:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8FFa-008YTB-QH
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 12:26:10 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ce442e-2eae-0a2a0a5409dd-0a2a4502b270-44
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 12:26:10 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69ce438d-42fa-0a2a45020019-d155dd33f094-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 12:23:10 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-43d23305225so290635f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 03:23:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4f5016sm7290604f8f.33.2026.04.02.03.23.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Apr 2026 03:23:09 -0700 (PDT)
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
        d=suse.com; s=google; t=1775125389; x=1775730189; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TByXgXUf0dXmY7eeNlUMjgWwY1dliRPveG2PCCoifUQ=;
        b=R8DTZ8J/CBD6TOwPi8Lvyy1rUB4gC0M3ApxUxKDeb5ZQHpfdzQ09wgDVi0np79wNMx
         SC0p0UigZ57Z5BlX7BF0nQoKL4xC4LSiCCFu+DdtH5sWckWU2h7mUzTXwYyR24nn6bcH
         LBqDlxHj9o+V6LxpLajz6dafrE/GtHK4JGYUS31TZ0dJDLUnyLUEeZyvz9xRWX6f1pve
         mgGdrHqk+5bf4KR8HpeBwydH9tLEuLtn2p+DWok9qployoHiqb/anRj6DE8X+oOGWYxr
         29u25kJSXktj6noJt/h5/SPxPdQvupKy+vTo7+eMPlDb0ktSv0ob5M6t+QvZ5UKWFGP1
         3uaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775125389; x=1775730189;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TByXgXUf0dXmY7eeNlUMjgWwY1dliRPveG2PCCoifUQ=;
        b=q8T3uLcI2Ps/VC1z53QdVzqEi/9SHvNCOs0rp/0tjubJ5nksr7Q84wz7DTxY+txPYV
         YaO3GGxFbtkZwx+FE3SJKA5U6rkOIA5KzBDKl/VK9pyS1FV6JAy3pncwPEsIzvCp685y
         QwLflgxjg+8cmNj9z1kkP9HJzdlXVBpjp6fAPfTXxgfp50VkZZ+2WZhjI196IcwjRdpc
         jfXN2Dzp0Y8cMOJZ4kJOPfq6Vktut17b3rSEUsqTbEa+oXDiBQv6kqnOIdSnxH+3d+Py
         edb3VBFnhMseLSikN2+l8nnqesrVLWtJsWttia3HdU4IIQYDjXxjPqwwydP5QoiIti41
         Mj2A==
X-Gm-Message-State: AOJu0YxXChRj3tzGjHDNDhIcRMt5Y0MEiXNgO93zeSgtil7E7H/6lxMo
	HUW7n65pW7O4AM+QGJb/llXepLLeVa5t1ER+rUq+ID/CmsbDN2yDv32MIk/6xorGoA==
X-Gm-Gg: AeBDiev3Zbw69GX4GeV8mAOFofnN2Cqp1b5qAGpmgAo7lEE4Lp4Q0v5NNYe2RwEn21m
	7ooGSYGrsrDsFZFIaLHOd7TgIEaYPdn2h2LUpCw3XdsBoibu7P627NPdicmX8wngXjXIPZli8ZD
	kpr0aI2Z0u6JodchBiF1WYi3naPsMsAk79iJNOrLkGsgmNqLR1Q8QbacRS4RAQUZg+HT3MCZxft
	QK5CJlKApg4u/BzRj/LP1TAXhdJ1gh5ZwcN4czl16hYXS6qteqOnTxSSve1vkEmqmcfTmPpPttk
	qx0q6lfhVQfHNoQVBPqABujVn0livJqsGgKZCEddhUZCA7Uir+jiIfqjYTZjRST0G2Ka0L/5FWD
	R4RIu1mHd1rkHgvP2GDdZhtVeRzNHih64r6cGDX7ntXBj2e6JFI1YpVnKnSWT7CAxwFb1O/PlwX
	2xwz1E0iU2n6LJjyCEvltsdlizXE6VVzK7oUuGCR8aacPoblGT8v8Zwy8rQ3AguCgCpptX8yh7x
	Wbo80zr0o8QPrw=
X-Received: by 2002:a5d:584a:0:b0:43b:5672:efe with SMTP id ffacd0b85a97d-43d150488e1mr13247849f8f.9.1775125389460;
        Thu, 02 Apr 2026 03:23:09 -0700 (PDT)
Message-ID: <0b284c32-4dd3-4663-881b-834c47070328@suse.com>
Date: Thu, 2 Apr 2026 12:23:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: IOMMU faults after S3
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <acZZmGXIJlmN3KGm@mail-itl>
 <e8bbaae2-5cff-4549-9f27-fbbda7346f60@suse.com>
 <090b8b8f-141b-4a24-92eb-879c0a0c73e1@suse.com> <ac2nibFfvGm_7elv@mail-itl>
 <933a3e95-33d2-4e20-a4d5-2d8b20c2da7f@suse.com> <ac4kCq87SQSc6ddV@mail-itl>
 <aa6910f1-365a-4534-b229-9730b3aede02@suse.com>
 <97bfb299-a465-48a3-a036-f217de683c2c@suse.com> <ac46HK_KiUaLdK4N@mail-itl>
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
In-Reply-To: <ac46HK_KiUaLdK4N@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1775125390-AEF21CD1-987A9CF9/13/0
X-purgate-type: clean
X-purgate-size: 3288
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D7A7A387B49
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 02.04.2026 11:42, Marek Marczykowski-Górecki wrote:
> On Thu, Apr 02, 2026 at 10:47:53AM +0200, Jan Beulich wrote:
>> On 02.04.2026 10:39, Jan Beulich wrote:
>>> On 02.04.2026 10:08, Marek Marczykowski-Górecki wrote:
>>>> The xl dmesg output (from MTL this time):
>>>>
>>>>     (XEN) [  123.477511] Entering ACPI S3 state.
>>>>     (XEN) [18446743903.571842] _disable_pit_irq:2649: using_pit: 0, cpu_has_apic: 1
>>>>     (XEN) [18446743903.571856] _disable_pit_irq:2659: cpuidle_using_deep_cstate: 1, boot_cpu_has(X86_FEATURE_XEN_ARAT): 0
>>>
>>> XEN_ARAT being off is the one odd aspect here. That'll want tracking down
>>> separately. As per xen-cpuid output (below) ARAT is available.
>>
>> For this you may want to also add logging to intel_init_arat(): Since opt_arat
>> can be false only due to command line option use, it can only be the function
>> not being called (which looks impossible on plain staging code), or cpu_has_arat
>> being false despite the xen-cpuid output that you supplied earlier (inexplicable
>> as well, at least for now).
> 
> Hm, I got this:
> 
>     (XEN) [   11.403340] intel_init_arat:674: opt_arat: 1, cpu_has_arat: 0
> 
> so, cpu_has_arat=0 ...
> next lines are those, to hint when it happened in the boot process:
> 
>     (XEN) [   11.409754] mwait-idle: MWAIT substates: 0x11112020
>     (XEN) [   11.416130] mwait-idle: v0.4.1 model 0xaa
>     (XEN) [   11.422396] mwait-idle: lapic_timer_reliable_states 0x2
> 
> Looks like calculate_host_policy() runs much later...

Hmm, yes, and that's the problem. The reason I don't see this is that a newer
version of [1] has this

--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -628,6 +628,8 @@ void identify_cpu(struct cpuinfo_x86 *c)
 	}
 
 	/* Now the feature flags better reflect actual CPU features! */
+	if (c == &boot_cpu_data)
+		calculate_host_policy();
 
 	xstate_init(c);
 
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -384,7 +384,7 @@ void calculate_raw_cpu_policy(void)
     /* Was already added by probe_cpuid_faulting() */
 }
 
-static void __init calculate_host_policy(void)
+void __init calculate_host_policy(void)
 {
     struct cpu_policy *p = &host_cpu_policy;
 
@@ -959,6 +959,7 @@ static void __init calculate_hvm_def_pol
 
 void __init init_guest_cpu_policies(void)
 {
+    /* Do this a 2nd time to account for setup_{clear,force}_cpu_cap() uses. */
     calculate_host_policy();
 
     if ( IS_ENABLED(CONFIG_PV) )

and of course I'm doing my work (and my analysis) with that in place.

I may need to break this out and submit independently, but really the problem
here is that the containing series has been sitting largely unreviewed (and
hence not in a position to plausibly re-post) for almost 5 years. Andrew,
(maybe also Roger) - I'm open to suggestions how to proceed. When your xstate
cleanup patches were helped to go in ahead of mine, you promised to help mine
going in afterwards. Yet nothing has happened (and I'm tired of re-submitting
large pieces of work just for the sake of re-submitting, i.e. without having
has [sufficient] feedback on the earlier version).

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2021-04/msg01336.html

