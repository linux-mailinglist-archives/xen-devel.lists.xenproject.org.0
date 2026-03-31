Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPpGOWP3y2kXNAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 18:33:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF0036CC21
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 18:33:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269194.1558304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7c1W-0000Xd-Gf; Tue, 31 Mar 2026 16:33:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269194.1558304; Tue, 31 Mar 2026 16:33:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7c1W-0000VL-E2; Tue, 31 Mar 2026 16:33:02 +0000
Received: by outflank-mailman (input) for mailman id 1269194;
 Tue, 31 Mar 2026 16:33:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1w7c1U-0000VF-IJ
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 16:33:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7c1T-003hgI-C6
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 18:32:59 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69cbf739-5cb7-0a2a0a5109dd-0a2a4507dee2-2
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 18:32:59 +0200
Received: from [209.85.218.51] (helo=mail-ej1-f51.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69cbf73b-fd74-0a2a45070019-d155da33e5ff-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 18:32:59 +0200
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-b9bfcbaa81eso125551966b.1
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 09:32:59 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9b7ae7416dsm428646066b.28.2026.03.31.09.32.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2026 09:32:58 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774974779; x=1775579579; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C6Uwb+TKNThX8Ixf4SwdZeHn+/G93HvQAXOSf0CjIHM=;
        b=CX7sEsbWQe6EbObZV2UxDO8IvvuHUNQOu0jh84rYfhkILnMOB6nAJx8C1iQxT4Ten2
         wNI3eJTp1s4XaagQ/rBt6lDb0oTltKSaIMO+UbU0K2kLiBih4E9WuC2wxeMexetOTAwS
         BNfsbB7tp4AWPzhEfKdkimrwRcH3o7o9ElOvI2ZiTv9Y6HqyFVR3TLCyzZ2Lskap8ZYH
         pHs6JKEp/2y8CphbDCvGqfkb65ptSjfrGfIIno7SOq6lYHO79txG15tHrIaOymBzNu+w
         lDKp2pdl+Plwmi8dAxeKu7ZcTXK/gxxVlgK2fdBWcPycKXvZ27hh9MhVtL68GI5nvzmk
         ek8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774974779; x=1775579579;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C6Uwb+TKNThX8Ixf4SwdZeHn+/G93HvQAXOSf0CjIHM=;
        b=hMGcJ9tQRd7OT7KDGs58EymjlUfCiXrF1DI9eKSPyp4+MZvSdXqVmK0OOz3iLMCUye
         MPdcbP41ujkC7xz0l5lEyqPj3cHaRInjxeKr0Ulvkua2W7naOYa3gWbw3Qma/zhJa8q3
         e0GbPqFQdySb/5jvSesstIEJLQUeTSffhp7ConCbDRcFzB3I5JVMtU364f6vC12qWOcV
         xZpqfmleA2aJJC20owUQ6pJ3TBdWE8nByFt7k8jGPPXNzQMG0Qt32IZw/+2r23oK9+Og
         /iEHJx+MHKOGKB5rjKGDOLFUc0nkMb8MYEsiwDLKEU2fht0QEuUZlWp8a8sAqw3Tud/h
         wGDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyZN0pHAbPYjHV7vG3wXUFWc+ZrVit1kEkjoc5AiHlkQs5I4eEnnRbgieJAHrvEQGgsaMKY1uAkJo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwYoMpcgfHAOy/R6lHFX+FdAThEBGteYC5k2YDsvnyadv+UiJvS
	3CkG+phyjQWhIZ9LN/IWXBz8aThgqZBMdpU9YYnCYZVDn7HEfpsqeJ+x
X-Gm-Gg: ATEYQzy09mhTQGHO2/coU9ryFWaxyLwhc6j0kiHWgPyFcYP67pNaG31yCSZG8Gu7o83
	y5mb3OXm0mg3eUgxuvdWFH8wT9YPvSqSIxrr01whB8koO5GUa4j/kRTb41ceMPFGizjh3rYe7X2
	8+8jZm/qCq1c8c3hssN84G+rqGLcbk+6rHmAbJeerv3VTWczZcyPdSCTob5c1zosh50oNtq0UTf
	Koyyb4rxljgj+FfEE/uOhVzX/5nFi7zLhj/hU8r2mOy/5BgnbEr4X8XBA68nl1kfinlySQY4g+/
	rg3Yi2/RMnSq3W84BfalyA5WBCpR59A6/9OZbJIsu1OVQpHdXzXpB1JvdFka8cl3aVIABrZwrNP
	48XtJB6mWYi9EUMHGhI8zF+WUVpSuunHQLFBpdthNTdPDvqgXtohhDKJESDyzg2zwRRlHLZLcoP
	Hv37J5aLWobmqZP8jRktu+3jy9a9xdOkOuEh++5Nsv6wQeJcQILV0apoWajWO16z9fWPOyJ2H1z
	Zk=
X-Received: by 2002:a17:907:6c0e:b0:b98:3b5d:e143 with SMTP id a640c23a62f3a-b9c1379b322mr21088066b.6.1774974778508;
        Tue, 31 Mar 2026 09:32:58 -0700 (PDT)
Message-ID: <d67b2856-bf93-4254-afa1-745dc37e0623@gmail.com>
Date: Tue, 31 Mar 2026 18:32:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] xen: move domain_use_host_layout() to common
 code
To: Jan Beulich <jbeulich@suse.com>
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <d1288db4-2001-4914-919f-b613fd607bcc@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1774974779-56CAA303-02942C41/10/73395122804
X-purgate-type: spam
X-purgate-size: 3592
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4AF0036CC21
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/31/26 5:53 PM, Jan Beulich wrote:
> On 31.03.2026 17:20, Oleksii Kurochko wrote:
>> On 3/30/26 5:13 PM, Jan Beulich wrote:
>>> On 23.03.2026 17:29, Oleksii Kurochko wrote:
>>>> domain_use_host_layout() is not really architecture-specific, so move it
>>>> from the Arm header to the common header xen/domain.h and provide a common
>>>> implementation in xen/common/domain.c. domain_use_host_layout() potentially
>>>> is needed for x86 [1].
>>>
>>> No matter that this may indeed be true, ...
>>>
>>>> Turn the macro into a function to avoid header dependency issues.
>>>
>>> ... this introduces unreachable code on x86, i.e. a Misra rule 2.1 violation.
>>
>> Do we have some deviation tag for such cases when the code temporary
>> isn't used?
> 
> I'm sorry, but it'll take me about as long as you to find out.

Sure, I will take a look. I just thought that maybe you have a solution 
already just in your head.

  I wonder
> about "temporary" though: Do you have a clear understanding as to when
> that will change?

No, I don't. As Stefano mentioned they will need this function one day. 
Another option we could use ifndef x86 or ifdef DOM0_LESS and then when 
someone will really need it on x86, this ifdef will be dropped. I don't 
know if it is better solution.

It seems like the best one solution will still make a try to make 
declare this function as macro.

> 
>>>> @@ -2544,6 +2544,12 @@ void thaw_domains(void)
>>>>    
>>>>    #endif /* CONFIG_SYSTEM_SUSPEND */
>>>>    
>>>> +bool domain_use_host_layout(struct domain *d)
>>>> +{
>>>> +    return is_domain_direct_mapped(d) ||
>>>> +           (paging_mode_translate(d) && is_hardware_domain(d));
>>>> +}
>>>
>>> The placement of paging_mode_translate() doesn't match ...
>>>
>>>> --- a/xen/include/xen/domain.h
>>>> +++ b/xen/include/xen/domain.h
>>>> @@ -62,6 +62,22 @@ void domid_free(domid_t domid);
>>>>    #define is_domain_direct_mapped(d) ((d)->cdf & CDF_directmap)
>>>>    #define is_domain_using_staticmem(d) ((d)->cdf & CDF_staticmem)
>>>>    
>>>> +/*
>>>> + * Is the auto-translated domain using the host memory layout?
>>>> + *
>>>> + * domain_use_host_layout() is always False for PV guests.
>>>
>>> ... the description of the function.
>>
>> But why the placement should be different?
> 
> If you focus on auto-translated, then imo paging_mode_translate()
> better would guard everything.

Then it make sense to do in the following way:
  bool domain_use_host_layout(struct domain *d)
  {
-    return is_domain_direct_mapped(d) ||
-           (paging_mode_translate(d) && is_hardware_domain(d));
+    return paging_mode_translate(d) &&
+           (is_domain_direct_mapped(d) || is_hardware_domain(d));
  }

> 
>> is_domain_direct_mapped() is false for PV guests (and for other guest
>> types on x86).
>>
>> So if domain_use_host_layout() is fully depends on
>> paging_mode_translate(d) && is_hardware_domain(d) and for which
>> paging_mode_translate() is false if it is PV guest.
>> Thereby domain_use_host_layout() is false too.
>>
>>>
>>> Further, the first sentence above suggests the caller has to check
>>> paging_mode_translate() before calling, which as per the implementation
>>> clearly isn't the intention.
>>
>> Sorry, I don't follow you here.
> 
> By starting the comment with "Is the auto-translated domain using", you
> imply the caller checked for that aspect already. At least the way I
> read it.

My understanding was that it is an explanation what function is checking.

~ Oleksii



