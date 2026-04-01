Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGb/E40wzWn0agYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 16:49:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BAC37C6E5
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 16:49:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270519.1559168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7wss-0000uQ-A6; Wed, 01 Apr 2026 14:49:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270519.1559168; Wed, 01 Apr 2026 14:49:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7wss-0000sx-6G; Wed, 01 Apr 2026 14:49:30 +0000
Received: by outflank-mailman (input) for mailman id 1270519;
 Wed, 01 Apr 2026 14:49:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7wsq-0000sp-NL
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 14:49:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7wsp-005rvH-UO
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 16:49:27 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69cd3067-e002-0a2a0a5209dd-0a2a4506afa8-26
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 16:49:27 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69cd2ed0-0df0-0a2a45060019-d155dd36a82b-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 16:42:24 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-43b949bf4easo741872f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 07:42:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4888a71615fsm2671605e9.12.2026.04.01.07.42.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2026 07:42:23 -0700 (PDT)
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
        d=suse.com; s=google; t=1775054544; x=1775659344; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dJGJXJR1M4p6XhI9b433b+HJBvyLg0Kh3Ht7B/jYeBk=;
        b=GuNoAmwZW8EkT6IapaSEX3kZpNNliPojUs37JtNXjuDRYzGr+wyrTa7YMiYYUXQT5G
         TyhwRGX1AfKuNTDA5Z6NA6WwX9NSXFA1jh20Xos4EuPmrcfYOoqmsw7Yv6IRZ1PIavsr
         b7m5wxyzDToiPV87ulfH8ogjKUTPyrs8HIoUTA+HcecU1qPBPIghAwldTrIOJy5C/Nv7
         moL9jwjevhiwCrj7dXNmxatO3HIqUqdJbazW9aZiUokM04X3tzexr7OStEVTJ9669G4O
         k/3mhtH9dXmVptNrs1VL208obhjGrG/tOG3E0fBd+1uLwoGaoFBhbjrkheuvYXROADMi
         DKrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775054544; x=1775659344;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJGJXJR1M4p6XhI9b433b+HJBvyLg0Kh3Ht7B/jYeBk=;
        b=hOgLo2w29iZ9RPcmo6pfxWWR59jNPjgvNH1xXoCsdcc1yGIwrCIk1UTTc+sJIHRigd
         dZvUrXyXzjODTmZA5Bagv6mlmwbNIqyZIG/IvS99VjSI9E2A0EQ2U2H5ZUkDf6jaK8ML
         QUn+WsTH5XuW9LjE0RoYbb9WPINH8JYEFMXV1ZgrtAJoJe5TTTq66hij9fk5rPaSYZhj
         lWuQeiOR85jQ4LekVDaBFUwEg0jOi1efK4DQckWb/ItYWVBuRtKhVuplQ+SjNqNFqLfi
         WDgQmgnC5yOwESgUJr0Kz6F+wF+pYmU475bjH04fxUYnR8SBzP630jQKdfEX5m1gw2EG
         Hm4A==
X-Forwarded-Encrypted: i=1; AJvYcCXvmAa7MOu3ynaS5AVEDZctQ0/iMxwwEEwphAMxO7an+/F+X1dZiUcroiDAbuSI7WdRIOcB3grc1B4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw5yJdZ2sExaHEoFr/61Cvz+c4nfq6mdoUvTZ01hkqtaCAEcOSn
	5qNtu0HOugY8/INPQ8O76yXkjaq6wEscqqEtcwYBhLSaVkxoBYWB5CFCd4Bfy7UsNQ==
X-Gm-Gg: ATEYQzxDR3XJ4kHr09ct7ZDBHvNfDXKiz11Q236Q993EypS61cSsAvmnKLhhVg1IStY
	tQ4m3IHhftXyVoF43mqEn+ILDGRhz7IAM7px0j5t/sDj3Wr8WZ4eTdWyZdmsC3GRXKq8mqUZrfQ
	ShLLLZdfTPH20l3GAHPe9lcva/PMStIlLS2pHNUhtxlm+8gYQwsyFSNuu/GnNjT2Mt6ULBk1HVo
	wANnzNztDNv9Z4bxBwr9K5amGku5KIsF6kduoLDO+OIJ8YLbAvGlwya5vEbqNIOmE0qwIdDwwAw
	PAF/v7G04iAOJernYuNbxXHL+0zsVmeELgFsNPdaVe0JccbN5mZiJZv07y4vs19aVzVEZwJ/Jr0
	IzaI/zQvYcNI36EFnNJ5LQvnTeLumfED3gvEz36ptb8Px8jNV3WI/TqEyDV7/qoPBp0DJshe19V
	4X63N0mBmXt5/kGa8I774ny8oMsuOkFndagUhr5YCCtKnJXtYaAuxnvU2AkJ/0rDL0F/ez9uYX+
	avYZ6pJt04HP2c=
X-Received: by 2002:a05:600c:3e1a:b0:486:fbc4:8fe2 with SMTP id 5b1f17b1804b1-488835d166amr61875095e9.15.1775054544098;
        Wed, 01 Apr 2026 07:42:24 -0700 (PDT)
Message-ID: <dd39f5b0-1276-403f-a607-47caceaa151e@suse.com>
Date: Wed, 1 Apr 2026 16:42:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] xen: move domain_use_host_layout() to common
 code
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1774281309.git.oleksii.kurochko@gmail.com>
 <533d01db2b36b8357cd87e99a64a6e66dbdd1db4.1774281309.git.oleksii.kurochko@gmail.com>
 <6df9470e-4969-48d1-bf0c-c6569a5e5577@suse.com>
 <57581b7d-cb9f-444c-9321-63b2fc3d09f0@gmail.com>
 <d1288db4-2001-4914-919f-b613fd607bcc@suse.com>
 <d67b2856-bf93-4254-afa1-745dc37e0623@gmail.com>
 <cdacc6a8-cd49-4327-a98c-636545e8579b@suse.com>
 <600b1b66-fd85-4b7f-8bdc-793667bccfec@gmail.com>
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
In-Reply-To: <600b1b66-fd85-4b7f-8bdc-793667bccfec@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1775054544-658533D8-99C9EB55/0/0
X-purgate-type: clean
X-purgate-size: 3870
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
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B1BAC37C6E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 01.04.2026 16:38, Oleksii Kurochko wrote:
> 
> 
> On 4/1/26 7:58 AM, Jan Beulich wrote:
>> On 31.03.2026 18:32, Oleksii Kurochko wrote:
>>> On 3/31/26 5:53 PM, Jan Beulich wrote:
>>>> On 31.03.2026 17:20, Oleksii Kurochko wrote:
>>>>> On 3/30/26 5:13 PM, Jan Beulich wrote:
>>>>>> On 23.03.2026 17:29, Oleksii Kurochko wrote:
>>>>>>> domain_use_host_layout() is not really architecture-specific, so move it
>>>>>>> from the Arm header to the common header xen/domain.h and provide a common
>>>>>>> implementation in xen/common/domain.c. domain_use_host_layout() potentially
>>>>>>> is needed for x86 [1].
>>>>>> No matter that this may indeed be true, ...
>>>>>>
>>>>>>> Turn the macro into a function to avoid header dependency issues.
>>>>>> ... this introduces unreachable code on x86, i.e. a Misra rule 2.1 violation.
>>>>> Do we have some deviation tag for such cases when the code temporary
>>>>> isn't used?
>>>> I'm sorry, but it'll take me about as long as you to find out.
>>> Sure, I will take a look. I just thought that maybe you have a solution
>>> already just in your head.
>> Well, I do: Don't make this an out-of-line function.
>>
>>>    I wonder
>>>> about "temporary" though: Do you have a clear understanding as to when
>>>> that will change?
>>> No, I don't. As Stefano mentioned they will need this function one day.
>>> Another option we could use ifndef x86 or ifdef DOM0_LESS and then when
>>> someone will really need it on x86, this ifdef will be dropped. I don't
>>> know if it is better solution.
>>>
>>> It seems like the best one solution will still make a try to make
>>> declare this function as macro.
>> Or an inline function. There's nothing ...
>>
>>>>>>> @@ -2544,6 +2544,12 @@ void thaw_domains(void)
>>>>>>>     
>>>>>>>     #endif /* CONFIG_SYSTEM_SUSPEND */
>>>>>>>     
>>>>>>> +bool domain_use_host_layout(struct domain *d)
>>>>>>> +{
>>>>>>> +    return is_domain_direct_mapped(d) ||
>>>>>>> +           (paging_mode_translate(d) && is_hardware_domain(d));
>>>>>>> +}
>>>>>> The placement of paging_mode_translate() doesn't match ...
>>>>>>
>>>>>>> --- a/xen/include/xen/domain.h
>>>>>>> +++ b/xen/include/xen/domain.h
>>>>>>> @@ -62,6 +62,22 @@ void domid_free(domid_t domid);
>>>>>>>     #define is_domain_direct_mapped(d) ((d)->cdf & CDF_directmap)
>>>>>>>     #define is_domain_using_staticmem(d) ((d)->cdf & CDF_staticmem)
>>>>>>>     
>>>>>>> +/*
>>>>>>> + * Is the auto-translated domain using the host memory layout?
>>>>>>> + *
>>>>>>> + * domain_use_host_layout() is always False for PV guests.
>>>>>> ... the description of the function.
>>>>> But why the placement should be different?
>>>> If you focus on auto-translated, then imo paging_mode_translate()
>>>> better would guard everything.
>>> Then it make sense to do in the following way:
>>>    bool domain_use_host_layout(struct domain *d)
>>>    {
>>> -    return is_domain_direct_mapped(d) ||
>>> -           (paging_mode_translate(d) && is_hardware_domain(d));
>>> +    return paging_mode_translate(d) &&
>>> +           (is_domain_direct_mapped(d) || is_hardware_domain(d));
>>>    }
>> ... in here which clearly speaks against doing so. And yes, this is what I
>> was asking for (with the function parameter also suitably constified).
> 
> I expect that with an inline function in xen/domain.h compiler will want 
> have paging_mode_translate() be explicitly defined, so an inclusion of 
> xen/paging.h will be needed, but likely I am wrong that it will be 
> needed it the case of inline function.

I don't think you're wrong with that. What I don't understand is why it
needs to be xen/domain.h where the function would be placed. If need be
you could make an entirely new header, where (presumably) you're not
going to have any include recursion concerns.

Jan

