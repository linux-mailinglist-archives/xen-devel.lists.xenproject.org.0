Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41942A06FEB
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 09:26:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867852.1279396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVnrY-0003wG-J9; Thu, 09 Jan 2025 08:25:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867852.1279396; Thu, 09 Jan 2025 08:25:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVnrY-0003tV-G3; Thu, 09 Jan 2025 08:25:56 +0000
Received: by outflank-mailman (input) for mailman id 867852;
 Thu, 09 Jan 2025 08:25:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pS5t=UB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVnrW-0003tP-VL
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 08:25:55 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55cb1081-ce63-11ef-99a4-01e77a169b0f;
 Thu, 09 Jan 2025 09:25:51 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4361c705434so4841685e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 00:25:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9e37c2esm12612835e9.28.2025.01.09.00.25.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 00:25:49 -0800 (PST)
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
X-Inumbo-ID: 55cb1081-ce63-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736411150; x=1737015950; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+TMDLDP0xZcmW4CVYT1DFkE6CDenhsuSvPb6O/0lSRw=;
        b=FffU+kYLKYl5IWhZxFFDZdL4IKCl2K8M/47JmO98ccYU3n/vQYnW3tPMJXZE3JY+Ti
         SIRuMsRWthIyvUMm2G6CiLcj1721T3qpi4JWkgCztdEU+K0qZygw7403ZB782Gid3eWg
         jU2zOaO9MfwxwS1PA1rjwo7oED1IEZf0/mZoJlZ1mGUo9YcmKXU8cZJqIu8E0OEuIfHx
         CNe+BnRgqo9f7gjiiQ2F1QVMnM4jd9qMFGBAPrC7eglKCtuyHgtdpSjV9RPEij3Jbmkb
         hG3Ivi5m3FK7X4ILRENUaxOAHfb8k+/uet0hRHSQIO8uIppr+9axCGvtMg+XFXAt8ON4
         GNlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736411150; x=1737015950;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+TMDLDP0xZcmW4CVYT1DFkE6CDenhsuSvPb6O/0lSRw=;
        b=HnNwlQEPAznEvcT6cPpGmeZnsZzTyMslKDfZ9fOB5MfQEaMpgsNHKHxXfWsHMfoMxW
         odpSoS2c0lUMl6crgldEYj8tR4FSimIMAkDvnqHJYEma7ird6b9eWv+i3NeQYfJw36EI
         ZIswDFZw5ZOfy7Dv+PTSY7/UEYz2QeqzPJCwgcbkPq4p1ec/AUEDva0bwva5/6MRZN5t
         HRln7sb6HVlJk7Be1FmaHXx3au8OBvLqVxE8jSOmW7GoaPgoGyzvi8sG3Q+ndPYqbLmh
         EB4vb2775GCrKH4i3ajTjcKiWpn/2GVE8U2srIetOFnSyRhl7BnLgEMoFXI6v1eF+42m
         vbkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPLyCtSxqWyMSj1yCZo+G4aYdVZ5KZ2g2axLjc9qdB+NcvKJ4SOFphq2jHYOj8hW7QjWIu7EFhL/k=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyz9Pjii5wU74eLarLxoaf2ztwtJrztwnsVAQNpRptVlGNu0pud
	4F0TlICfSFasmibn8X/2s/D9zBhHhm3/H7kmrHFapsHlue/KGLgPD6OCJu8M+w==
X-Gm-Gg: ASbGncu3u+F4fRTB6rh7BFn2H7yRLuVYbFte2+Rr2vqr4SKWB7CPVFlrRD2Ba7plMe9
	DJTn0TQKn8u+asJoTXTf0n0LKQOwpSWtI0BZaszFgoDVa4AT18bCPLhFFGOOtBH/TnGxE2Zc9bH
	2IOWQt5HcN9TBrhJw7FmTyaqud1csok7KjZsgd3tjm+0aj7aaM2RBFXz5L2nQP5+s0QTch0aUZj
	/xYz+3EJRacFsOIFtKJP/hzrJ+dJk9oym32INy6UiXVEAh/59vp8qa3b/6xIfDhBK9Sf82q0FLE
	BqEiRq8AVKktBevnj/lclxx++8krVFaBSPZwNwDecg==
X-Google-Smtp-Source: AGHT+IH45E2AFOZLcWe00FAXF79S8ka45YuubKaRkFt+lZgrhXhmAPOAJphJgL42GfYlDkoXPSD8qw==
X-Received: by 2002:a05:600c:3543:b0:434:f767:68ea with SMTP id 5b1f17b1804b1-436e2677c7dmr49611375e9.5.1736411150223;
        Thu, 09 Jan 2025 00:25:50 -0800 (PST)
Message-ID: <1af5c552-ea5e-4cf5-9a80-0e3559aeb403@suse.com>
Date: Thu, 9 Jan 2025 09:25:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/35] xen/console: introduce console_owner_domid()
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 dmukhin@ford.com, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Denis Mukhin <dmkhn@proton.me>
References: <20241205-vuart-ns8250-v1-20-e9aa923127eb@ford.com>
 <8a5a5a0f-72b0-4336-b0d2-142254319242@suse.com>
 <alpine.DEB.2.22.394.2501061046060.133435@ubuntu-linux-20-04-desktop>
 <c39c0c6f-2fab-46e8-9563-c91fe890e87f@suse.com>
 <alpine.DEB.2.22.394.2501071533060.133435@ubuntu-linux-20-04-desktop>
 <a2fa92ff-a5fb-4adc-86aa-1481ebec92fe@suse.com>
 <Z34xhkNu5YLyEzut@macbook.local>
 <121ae72e-6229-40a4-8b9f-4f8b0764b712@suse.com>
 <Z344xgqtpNZIDxHD@macbook.local>
 <m5iIn0DzBY1VE3oW8MMk5aJD5yovtFe2u7eorkGQVf0czY2gzIYl9k2aKmrdyh1AG6YAgyasVn86Js-vUQyudqjHY7bRYE1hXdCkdFVF0U8=@proton.me>
 <alpine.DEB.2.22.394.2501081615050.133435@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2501081615050.133435@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.01.2025 01:29, Stefano Stabellini wrote:
> On Wed, 8 Jan 2025, Denis Mukhin wrote:
>> On Wednesday, January 8th, 2025 at 12:35 AM, Roger Pau Monné <roger.pau@citrix.com> wrote:
>>> On Wed, Jan 08, 2025 at 09:13:02AM +0100, Jan Beulich wrote:
>>>> On 08.01.2025 09:04, Roger Pau Monné wrote:
>>>>> On Wed, Jan 08, 2025 at 08:28:32AM +0100, Jan Beulich wrote:
>>>>>> On 08.01.2025 00:40, Stefano Stabellini wrote:
>>>>>>> On Tue, 7 Jan 2025, Jan Beulich wrote:
>>>>>>>> On 06.01.2025 19:48, Stefano Stabellini wrote:
>>>>>>>>> On Mon, 6 Jan 2025, Jan Beulich wrote:
>>>>>>>>>> On 04.01.2025 05:15, Denis Mukhin wrote:
>>>>>>>>>>> On Tuesday, December 10th, 2024 at 11:28 PM, Jan Beulich jbeulich@suse.com wrote:
>>>>>>>>>>>> On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
>>>>>>>>>>>>
>>>>>>>>>>>>> From: Denis Mukhin dmukhin@ford.com
>>>>>>>>>>>>>
>>>>>>>>>>>>> console_owner_domid() is introduced to obtain the "console owner" domain ID.
>>>>>>>>>>>>>
>>>>>>>>>>>>> The call is used in NS8250 emulator to identify the case when physical xen
>>>>>>>>>>>>> console focus is owned by the domain w/ NS8250 emulator, in which case,
>>>>>>>>>>>>> messages from guest OS are formatted w/o '(XEN)' prefix.
>>>>>>>>>>>>
>>>>>>>>>>>> Such messages ought to be processed through guest_printk(), which wants a
>>>>>>>>>>>> domain pointer, not a domid_t anyway. Plus isn't that going to be
>>>>>>>>>>>> current->domain anyway at the callsite, eliminating the need for such a
>>>>>>>>>>>>
>>>>>>>>>>>> helper altogether?
>>>>>>>>>>>
>>>>>>>>>>> If the current domain is owning the physical console and printing, say, Linux
>>>>>>>>>>> login prompt, there's no need to add "(XEN)" for every printout; adding timestamps
>>>>>>>>>>> can be disabled from Xen command line.
>>>>>>>>>>
>>>>>>>>>> Surely there shouldn't be (XEN), but without (d<N>) it'll be ambiguous in a log
>>>>>>>>>> which domain a message came from. As long as only Dom0 messages are left un-
>>>>>>>>>> prefixed, that's likely fine. Yet as soon as multiple domains can issue such
>>>>>>>>>> messages (and have console "focus") I think the prefix needs to be there.
>>>>>>>>>
>>>>>>>>> It looks like we are aligned on the desired behavior,
>>>>>>>>
>>>>>>>> Hmm, no, I don't think we are. I don't ...
>>>>>>>>
>>>>>>>>> but for clarity,
>>>>>>>>> see https://marc.info/?l=xen-devel&m=173405161613716, also copy/pasted
>>>>>>>>> here:
>>>>>>>>>
>>>>>>>>> I think we should provide a consistent behavior across architectures.
>>>>>>>>> The current behavior with vpl011 and dom0less on ARM is the following:
>>>>>>>>>
>>>>>>>>> - no prefix for Dom0 output
>>>>>>>>> - DOM$NUM for DomUs when not in focus, otherwise no prefix
>>>>>>>>
>>>>>>>> ... view this model as a desirable one. It leaves room for ambiguity.
>>>>>>>
>>>>>>> Adding a few more people in CC for feedback.
>>>>>>>
>>>>>>> My priority is to keep the architectures aligned. It might be OK to
>>>>>>> change output format, but then let's do it uniformly on ARM as well.
>>>>>>>
>>>>>>> Jan, please clarify what you think would be better than the above. Is it
>>>>>>> the following? I don't think I understood your preference.
>>>>>>>
>>>>>>> - DOM$NUM for Dom0 and DomUs when not in focus, otherwise no prefix
>>>>>>
>>>>>> No, I mean like we have it with guest_printk() today. (XEN) for Xen's
>>>>>> own messages, (d<N>) for ordinary domains' ones, and no prefix
>>>>>> exclusively for the hardware/control domain. What is best to do when
>>>>>> hardware and control domains are distinct I'm uncertain - I'd be
>>>>>> inclined to suggest that the hardware domain then stay the one without
>>>>>> any prefix.
>>>>>
>>>>> One concern I have with this approach is whether the addition of the
>>>>> (d<N>) prefixes will skew output of interactive applications. So far
>>>>> the prefix is added to output from all domains different than dom0
>>>>> because the console is not interactive for them, and hence no input
>>>>> can be consumed.
>>>>
>>>> Hmm, that's an aspect I have to admit I didn't think of.
>>>>
>>>>> If that changes however, and domains different than dom0 can get input
>>>>> from the Xen console then I wonder how much the added prefix will skew
>>>>> output. Another possible option would be to not print the prefix for
>>>>> the domain that has the console input assigned (current target), and
>>>>> print it for all other domains (even for dom0 when not in focus).
>>>>
>>>> That's largely what aiui was proposed. My extra requirement there would
>>>> then be that we make sure a log message is always emitted when console
>>>> focus shifts, so it's possible to identify the owner for any part of
>>>> the log.
>>>
>>>
>>> Indeed, printing console input shifting should be a requirement
>>> regardless of how we decide to print the prefix.
>>
>> Console input focus switch is indicated after pressing Crtl+aaa, e.g.:
>> [[
>> ...
>> (XEN) [15359.353038] *** Serial input to Xen (type 'CTRL-aaa' to switch input)
>> (XEN) [15361.176754] *** Serial input to DOM0 (type 'CTRL-aaa' to switch input)
>> (XEN) [15711.297202] *** Serial input to DOM1 (type 'CTRL-aaa' to switch input)
>> ...
>> ]]
> 
> 
> Roger, Jan, you should use Xen Dom0less more :-) This is the way it
> already works on ARM. Let me expand on my earlier message that was too
> terse.
> 
> At boot time, Xen prints messages with the (XEN) prefix as usual:
> 
> (XEN) Brought up 4 CPUs
> 
> When Dom0 starts, it has not prefix (and has input by default):
> 
> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
> 
> When a DomU starts, it has the following prefix (and doesn't have
> input):
> 
> (XEN) DOM1: [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]

Which is wrong - this isn't a Xen message. Such messages imo want prefixing
(d<N>), as guest_printk() does.

Jan

> Eventually, both Linuxes finish booting, you can login into Dom0 as
> usual. Messages from Dom1, if any, are still printed with (XEN) DOM1 as
> prefix.
> 
> You can switch input to Dom1 with Ctrx-aaa, the same way that you do
> today to switch between Xen and Dom0. Xen prints a message:
> 
> (XEN) *** Serial input to DOM1 (type 'CTRL-a' three times to switch input)
> 
> Now, as you type, you send characters to Dom1. And Dom1 doesn't have the
> DOM1 prefix any longer, while it is still has (XEN) because the message
> is printed by Xen on behalf of the domain:
> 
> (XEN) / # echo hello world
> (XEN) hello world
> 
> If Dom0 prints anything in the backgrounds, it shows without prefixes:
> 
> hello world from dom0
> 
> If another domain, dom2, prints anything in the background, it shows
> with (XEN) DOM2 prefix:
> 
> (XEN) DOM2: hello from dom2
> 
> I think it makes sense to be consistent across architectures and we
> should default to the same behavior on x86 too. If we want to make
> improvements, the one thing I could potentially see changing is adding a
> DOM0 prefix to Dom0 messages when Dom0 does not have input. If we do
> that, let's do it on both ARM and x86 architectures.
> 
> Cheers,
> Stefano


