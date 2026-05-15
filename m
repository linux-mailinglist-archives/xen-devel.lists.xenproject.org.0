Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEtAFK/CBmpdngIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 08:52:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF66C54A26A
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 08:52:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309629.1580674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNmP2-0001PS-2a; Fri, 15 May 2026 06:52:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309629.1580674; Fri, 15 May 2026 06:52:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNmP1-0001N6-WC; Fri, 15 May 2026 06:52:08 +0000
Received: by outflank-mailman (input) for mailman id 1309629;
 Fri, 15 May 2026 06:52:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wNmP0-0001N0-AK
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 06:52:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNmOz-00Gx39-86
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 08:52:05 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a06c290-2eae-0a2a0a5409dd-0a2a4509e516-8
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 08:52:05 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a06c294-2497-0a2a45090019-d155802bc8c2-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 08:52:05 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4891e5b9c1fso78920515e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 23:52:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe4c88495sm44635485e9.4.2026.05.14.23.52.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 May 2026 23:52:04 -0700 (PDT)
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
        d=suse.com; s=google; t=1778827924; x=1779432724; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=66Fp88XMgSl640LE1MMsS2BA9feptZHiN8drijgFsC0=;
        b=cJh9bWQsFLQgoqX+83Lq/1kRpvP4mcVIk6arZorQwEidnRY/NbrZRT8Ka5opdLDKVq
         2YKdes0Q99MkdgTpixRGtvDd18jTBinBFMkivPUhOeRIEuoKfHUEvoRWJlyoGXDzsSjt
         PRdhSLCQgvG02j9s7sFy3oFH8HwGT2Ge/YJmjpxeCSmsZ02jjCik05obPHy1hyEnvKT9
         D+4RcTaLiVfLLMEBO73n5ESJJqR8kZ4D7EsIv3hFM/3s1JXVEhurdm6fjGKZ1EYSb44F
         kp6X97WX8X+Q8uhIsRfk+/WGfU/gBv+aJ+QzFXPS1xK2G/mqfD3GIiHj3kTD6AyQu5Li
         K5pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778827924; x=1779432724;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=66Fp88XMgSl640LE1MMsS2BA9feptZHiN8drijgFsC0=;
        b=WrkbzeKCclEGIHaTl6tVklCK2RmV1Gfb5fWqH4GwSZwiuJId/tsJu4aIe+PPofS+TK
         etvkWWTogfBKgGsGHj62jLWENe0cTNRFkp3AiWyGWnuGqWZVBjQvC0EEcuqb9OCk9o+J
         ZmlDLW8QLi2zvRU+2tpn9raqKXCxze/4eUxJxRs3kz9HI6J2YFIArWDJxGrMQg/MP6rj
         pfp2yoBHkTEAVjnTrutKsTXLmLogOeFpBOa9QZGBkLNXOWeHS8UrkkASRnpx4IIJ1feK
         gT7Mp4oAvj5T9X3U0nn2/LygSiRN5wFL4PM/5ToEFcq3yfYfRzYkcZ8qDk1sR/OOcQ5B
         FqEg==
X-Gm-Message-State: AOJu0Yy+IHuf6HoH3o9u4QxnE1EKwqc2NJkFRq7VVeyAuHSSVNMSRVGl
	y/NgwrWpeOpGRQ2QEW34Vq0z4bP5APvZsZhhrED95lbAcXbe6ZRErRn1+Pci+CX+yg==
X-Gm-Gg: Acq92OFggpoB01WHEA6q07miw4EgggRrhbaen35DNBef9Dm3y9quQWhFKecM/OhrQxE
	bYhIKNdusxV4k4QQVgJ41vxbtiK5HdPYhPZf//PI771d7enTUGlsXi1iP4dF4S6OlcN/TeljXio
	eqYrlkzyuJaeiOmZYdrM5k3itfjuUbrWvE6heajRzqrSQZNyb2t81EB4+i7axCS24mxexfJmego
	aOaFZgakDXRhfZ01tT/XMXIlBEi7jefCz58yyjUJpYASb7E9TrdYuvaqrv06hZpK22PLtJPznOB
	0LxQXpOZFH5xUk+ykBorwEMTSPMlKxPeGGzIgfsCTmadL6Zi4jsAhwJQop8YnJOjBNXwvwqgFxt
	bt8gQcBNejs2IsYOGFRx6cO86mlIulGZyEloN/uqsvnjfiNBEr3y3cKqoxXRNq3z/kj/cglfdxL
	4cn18ox6RZ7s7VNfqord5dzASYHVoYtUwnfTHvtFwx3SuqFNZpmM+AiWBRKmajARYVp/ArdTl+H
	DC3JKvmAFhfpEk=
X-Received: by 2002:a05:600c:c087:b0:48a:5546:61a1 with SMTP id 5b1f17b1804b1-48fe61f2911mr25474555e9.15.1778827924538;
        Thu, 14 May 2026 23:52:04 -0700 (PDT)
Message-ID: <242237a9-6b9e-4580-8936-aa61be6b0636@suse.com>
Date: Fri, 15 May 2026 08:52:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 3/5] x86/vRTC: support century field
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <b36b6f2f-2b0e-462d-9846-4a1b4d7edef9@suse.com>
 <383355d1-7032-4445-8a06-cb4411ea797e@suse.com>
 <agSJlh8KQ9orL6wC@macbook.local>
 <17a25f0e-91e3-4e09-92ad-21e7dc0ebe62@suse.com>
 <agSVa3uPHSZrszjz@macbook.local>
 <439d03f4-4ebb-4bbf-a1ea-324156bff9f0@suse.com>
 <agTTtrSm1tBnBGK9@macbook.local>
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
In-Reply-To: <agTTtrSm1tBnBGK9@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1778827925-37D7FA53-554CB6E2/0/0
X-purgate-type: clean
X-purgate-size: 3278
X-Rspamd-Queue-Id: AF66C54A26A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,vates.tech,gmail.com];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 13.05.2026 21:40, Roger Pau Monné wrote:
> On Wed, May 13, 2026 at 05:24:13PM +0200, Jan Beulich wrote:
>> On 13.05.2026 17:14, Roger Pau Monné wrote:
>>> On Wed, May 13, 2026 at 04:58:57PM +0200, Jan Beulich wrote:
>>>> On 13.05.2026 16:24, Roger Pau Monné wrote:
>>>>> On Tue, May 12, 2026 at 04:59:35PM +0200, Jan Beulich wrote:
>>>>>> @@ -515,7 +538,10 @@ static int rtc_ioport_write(void *opaque
>>>>>>              /* Fetch the current time and update just this field. */
>>>>>>              s->current_tm = gmtime(get_localtime(d));
>>>>>>              rtc_copy_date(s);
>>>>>> -            s->hw.cmos_data[s->hw.cmos_index] = data;
>>>>>> +            if ( s->hw.cmos_index != RTC_CENTURY )
>>>>>> +                s->hw.cmos_data[s->hw.cmos_index] = data;
>>>>>> +            else
>>>>>> +                s->hw.century = data;
>>>>>>              rtc_set_time(s);
>>>>>>          }
>>>>>>          alarm_timer_update(s);
>>>>>
>>>>> Don't you need to adjust the tail return of rtc_ioport_write() (below
>>>>> the context here) to return 0 when s->hw.cmos_index == RTC_CENTURY, so
>>>>> the set value is also propagated to the DM, and not only the index?
>>>>
>>>> I don't think so. The case of us not handling RTC_CENTURY is dealt with
>>>> earlier in the function. Whereas when we handle the field, we don't want
>>>> to forward (like for all the other RTC fields).
>>>
>>> Right, so then you also want to adjust the top part of
>>> rtc_ioport_write() to not propagate the write to the 0x70 IO port when
>>> data is RTC_CENTURY?  Otherwise you propagate the write to port 0x70,
>>> but not the read/write to port 0x71?
>>
>> I can't, as whether to forward depends on the data subsequently written.
>> Propagating the index "just in case" is the only workable model that I
>> can think of. And as guests can do any number of successive port 70
>> writes, the DM needs to cope with this anyway.
> 
> Hm, I see, the newly written value to port 0x71 is taken into account
> to decide whether to forward to the DM or not.
> 
> I wonder: would it be simpler to extend the size of the hvm_hw_rtc
> structure so that Xen can detect whether the incoming VM has support
> for the century field, and then avoid having to play heuristics
> with the value itself?

It would surely be possible (and we may need to do so anyway for the alarm
date/month fields), but I wanted to get away without doing so here. And it
seemed pretty reasonable to leverage the padding field for this.

>  We would know ahead of starting the guest
> whether RTC_CENTURY is supposed to be handled by Xen or forwarded to
> the DM, and we won't be limited to use 0 as the sentinel value for not
> exposing RTC_CENTURY.

These are the positive aspects. The negative one is that "backwards"
migration would break with the larger record size. Whereas with the padding
field used, it won't: The guest likely won't notice that the value at 0x32
isn't updated anymore, i.e. stays at value 20. Somebody would need to
artificially change time across century boundaries for this to become
noticeable. (Note that this aspect is different for alarm date/month: If
either of those fields was in use, backwards migration indeed needs to
fail.)

Jan

