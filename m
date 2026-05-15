Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCnPOg/eBmp4ogIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 10:49:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E67454BB53
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 10:49:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309754.1580806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNoEB-00086z-Fi; Fri, 15 May 2026 08:49:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309754.1580806; Fri, 15 May 2026 08:49:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNoEB-00084J-Cv; Fri, 15 May 2026 08:49:03 +0000
Received: by outflank-mailman (input) for mailman id 1309754;
 Fri, 15 May 2026 08:49:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wNoE9-00084D-6z
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 08:49:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNoE8-007t2n-JR
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 10:49:00 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a06dded-bab6-0a2a0a5309dd-0a2a4509eb92-46
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 10:49:00 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a06ddfc-2497-0a2a45090019-d155802dc4ec-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 10:49:00 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-48a563e4ef7so80429325e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 01:49:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da15a562dsm13329010f8f.33.2026.05.15.01.48.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2026 01:48:59 -0700 (PDT)
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
        d=suse.com; s=google; t=1778834940; x=1779439740; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jpAJA4bW2cKY0DQ/ED1MjxowmGDO0JsQM54YfVjgZgc=;
        b=PrcZXuxyzy3Mao9MmIJy3aHU3ddOVa4vU/e0t1ZZg+if2FqkZXnnhKQDKoZo8A49K6
         YFDlpafnU+IHDGv4mX1p1FQTnjuXAOZCTeVKwTOto23ZKggWiGGmbI0auprg/hpqtOBK
         Lqi66KZFskvH90KctlCbez4zAhqMEIXyq3uQMfYmTglSz+Nskr4NPK8TUsRtbUaLOEuX
         FoYXFdBSMaJF/fXWaXF18Pmw3Ozex+RxcQtlesOW6DaTO0wlOegTTIaXNu/RHeizO4BW
         ulyJFPR1tnE72V4Fh1EDtLce3Q3WQPJJfsIQUY5pNRtkab+z6fCn8Ll7ChXAWlIywMOX
         2m7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778834940; x=1779439740;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jpAJA4bW2cKY0DQ/ED1MjxowmGDO0JsQM54YfVjgZgc=;
        b=OToP+eUmn3qC56/z5t87MQEd1s+0j6/P3IaFcSS7psYNEZkeFKH8jq3VuAfZXPYiCM
         eyps6qZIIizUgPz0Y2viiiUqWDzrt5mG8MaTUxvDbslrB/TVdUHvMVB1vMDqjdEIyBL9
         O6sMbXvGVRS9J8HAyg+RSkbawliaweSQDtVCN/ErDXVQ08HBC3pbTED47DUdRJGrSmNJ
         AiqGkXzNIVeW3Im8aMA4a7tkbCRKoFygNdhf3IjkzXqy6m0wPCmWCln39tqwkpucMM7w
         MeOpstl/epPz/LDjPCjwY36sa+X7cJ2qLg8ylxXQf/kZc34CavofvST7WGG3owAIKj9k
         4/Xw==
X-Gm-Message-State: AOJu0YygB62Z+AHSuaKIo4JuzXc5rs0+FI7CbmvzqT0wY8W6YcOWZciv
	j9G4vE2q842uCKLWsP1/WCN5nj+RIgPVy8THM/hzc3NwwZtV/gQZD3mhdsKewst85g==
X-Gm-Gg: Acq92OGfH54xMexWowx+6i0B3975A6wyP9xlZl5F/L5vQx84SqlyR4axO2Kv+LxMP/L
	J4lo3sPpczAgDz0Jb102gi1ZCbXQDMTFHZ/qVHKIpJu8cd0oDQ3BIZLpoN6UiL6DjuMYtMTbfz0
	jyMQhBdvPqoBeg0RsaXcWSDCQ4vfnburywb7VDaH0cbGWITRuLBMDUnGIja26yXksRq0fXXuDfP
	7ewf09c6tS1L21eqk9RbwLzVSlnSs02B8fTeazHJqWBVINugIw6fGzt61fGPsA48V+jmgE2/GIc
	0cVKZ0Q4w+5c05b8+f52Cvs5JAJQUzJMpUvpcL7WgvHKtIkft+uYF7VBznTa5+womkJozMCG96w
	/FsRRzH3BtWd1ha2D/eUoVfMrIDa4dHwOmLNdLKz4VUeCz30DPsQJPrZR7NIL5+bRnOE7uYi59N
	ZVl+d9S9ny3K7nzyCUnG7lEiCK0Too/nsUX+sCeaSi4NOKSK1rSOEj26ndRM9o4PBCG4xynpRCr
	mS+SyDkx/C2dJU=
X-Received: by 2002:a05:600c:4e87:b0:48a:768b:eea9 with SMTP id 5b1f17b1804b1-48fe60e51bamr44257195e9.4.1778834939932;
        Fri, 15 May 2026 01:48:59 -0700 (PDT)
Message-ID: <83427254-9e8e-4905-8bbc-c65874a863d2@suse.com>
Date: Fri, 15 May 2026 10:48:58 +0200
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
 <242237a9-6b9e-4580-8936-aa61be6b0636@suse.com>
 <agbcfy3TSg7dpkkx@macbook.local>
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
In-Reply-To: <agbcfy3TSg7dpkkx@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1778834940-4156BA53-E47EDF13/0/0
X-purgate-type: clean
X-purgate-size: 3555
X-Rspamd-Queue-Id: 5E67454BB53
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,vates.tech,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 15.05.2026 10:42, Roger Pau Monné wrote:
> On Fri, May 15, 2026 at 08:52:03AM +0200, Jan Beulich wrote:
>> On 13.05.2026 21:40, Roger Pau Monné wrote:
>>> On Wed, May 13, 2026 at 05:24:13PM +0200, Jan Beulich wrote:
>>>> On 13.05.2026 17:14, Roger Pau Monné wrote:
>>>>> On Wed, May 13, 2026 at 04:58:57PM +0200, Jan Beulich wrote:
>>>>>> On 13.05.2026 16:24, Roger Pau Monné wrote:
>>>>>>> On Tue, May 12, 2026 at 04:59:35PM +0200, Jan Beulich wrote:
>>>>>>>> @@ -515,7 +538,10 @@ static int rtc_ioport_write(void *opaque
>>>>>>>>              /* Fetch the current time and update just this field. */
>>>>>>>>              s->current_tm = gmtime(get_localtime(d));
>>>>>>>>              rtc_copy_date(s);
>>>>>>>> -            s->hw.cmos_data[s->hw.cmos_index] = data;
>>>>>>>> +            if ( s->hw.cmos_index != RTC_CENTURY )
>>>>>>>> +                s->hw.cmos_data[s->hw.cmos_index] = data;
>>>>>>>> +            else
>>>>>>>> +                s->hw.century = data;
>>>>>>>>              rtc_set_time(s);
>>>>>>>>          }
>>>>>>>>          alarm_timer_update(s);
>>>>>>>
>>>>>>> Don't you need to adjust the tail return of rtc_ioport_write() (below
>>>>>>> the context here) to return 0 when s->hw.cmos_index == RTC_CENTURY, so
>>>>>>> the set value is also propagated to the DM, and not only the index?
>>>>>>
>>>>>> I don't think so. The case of us not handling RTC_CENTURY is dealt with
>>>>>> earlier in the function. Whereas when we handle the field, we don't want
>>>>>> to forward (like for all the other RTC fields).
>>>>>
>>>>> Right, so then you also want to adjust the top part of
>>>>> rtc_ioport_write() to not propagate the write to the 0x70 IO port when
>>>>> data is RTC_CENTURY?  Otherwise you propagate the write to port 0x70,
>>>>> but not the read/write to port 0x71?
>>>>
>>>> I can't, as whether to forward depends on the data subsequently written.
>>>> Propagating the index "just in case" is the only workable model that I
>>>> can think of. And as guests can do any number of successive port 70
>>>> writes, the DM needs to cope with this anyway.
>>>
>>> Hm, I see, the newly written value to port 0x71 is taken into account
>>> to decide whether to forward to the DM or not.
>>>
>>> I wonder: would it be simpler to extend the size of the hvm_hw_rtc
>>> structure so that Xen can detect whether the incoming VM has support
>>> for the century field, and then avoid having to play heuristics
>>> with the value itself?
>>
>> It would surely be possible (and we may need to do so anyway for the alarm
>> date/month fields), but I wanted to get away without doing so here. And it
>> seemed pretty reasonable to leverage the padding field for this.
>>
>>>  We would know ahead of starting the guest
>>> whether RTC_CENTURY is supposed to be handled by Xen or forwarded to
>>> the DM, and we won't be limited to use 0 as the sentinel value for not
>>> exposing RTC_CENTURY.
>>
>> These are the positive aspects. The negative one is that "backwards"
>> migration would break with the larger record size. Whereas with the padding
>> field used, it won't: The guest likely won't notice that the value at 0x32
>> isn't updated anymore, i.e. stays at value 20.
> 
> Sorry, maybe I'm confused, but when migrating backwards the access
> won't be handled by Xen anymore, and hence we don't know what it would
> return, it's up to the catch-all device model.

Oh, you're right of course. The value returned would be whatever the DM
deems appropriate.

Jan

