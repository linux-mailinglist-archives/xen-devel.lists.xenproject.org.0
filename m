Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDYxBLOXBGpiLwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 17:24:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 698F1536067
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 17:24:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308227.1579763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNBRY-0003jv-Rp; Wed, 13 May 2026 15:24:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308227.1579763; Wed, 13 May 2026 15:24:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNBRY-0003gz-OM; Wed, 13 May 2026 15:24:16 +0000
Received: by outflank-mailman (input) for mailman id 1308227;
 Wed, 13 May 2026 15:24:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wNBRX-0003gt-Dt
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 15:24:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNBRW-00128n-Qo
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 17:24:14 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a04977c-5cb7-0a2a0a5109dd-0a2a45019d26-48
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 17:24:14 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a04979e-c1f2-0a2a45010019-d155dd34f095-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 17:24:14 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-43d73422431so5227633f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 08:24:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4548e6a68ebsm40025840f8f.1.2026.05.13.08.24.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2026 08:24:13 -0700 (PDT)
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
        d=suse.com; s=google; t=1778685854; x=1779290654; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KW5t2bpTW8HpaeVug28uTHeYudospfOIsPRQK1HG9Ss=;
        b=fjOFmCosPeifdzBXnssakr3xoP+M3yr9WspfsYM0DI5Axi4fqVwE9/wqjwLzBsV0Nv
         BHFKE4A9Jvfzn0lG97xY4DbpaC2FGFxe6WQEK06W1HiNrZfYbyh9foWxHT0YLUQrc+X5
         HX1ksobuu2Ijdee3ujO8MKWRhhQdMfml7523utSm7XaCMfAcLhkiPKdNv6S9Jk65y41W
         f+l1tKHjbxTTzwDnTFOC7TKjyMcuob3AFMTPD0ySt/D4H1XIufCKF74rsrGOOJAO+AxL
         7yEagwUMucuR4Flb3/9nDHp9cs4r4ImISYi066PJgYPzE4AJvQvPagBx5Vlwfn5cLwsS
         V2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778685854; x=1779290654;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KW5t2bpTW8HpaeVug28uTHeYudospfOIsPRQK1HG9Ss=;
        b=pPRdl+eKOsIc+1wOz0KVZYuIkCmShHzLHM+6+yAO2Z6cGHKTKRwl2/EviDcXakoZCF
         Tfhgc34+NdcsAvwZDq8vnZYzyHGVMHNwyHa5YuMeDNIN/Tg7T+aNzd7i89fG90lPAFRm
         r6eNygo24cular3rUoziVSK/BWosu2ANk3twaXsirRubDwy51uv3m8iO9CD5rNjZyO7E
         kcqH5Eu1flRH1WQj0svfhr5FnMJoFHpx7kn3R6BE8QOcHRR2X3x8hyyemVoLTMh05TEf
         7u0XQHKPVcAPyGF0EUeo4QH1Y34YzZ1A8GNP3cBbBajyHDiPJO1ZRDB6vQceVVYw6lDc
         FEjQ==
X-Gm-Message-State: AOJu0Yz/HWB/HXe865/xg0QuJCh99ve8ILAT9FPDcuAUy1q3nrnd+YYZ
	W33hu2jTqKcf4oQ6v6t+Q2qDYJEeV56RkmsQbiyQHyJA+NKvL/7jttHu9HkzbFe/SQ==
X-Gm-Gg: Acq92OEAbw62KhkQpgGKe8J808e7cU++CzAYCYXBTgbDBaS1kMZlAOmLgJISKrfE1QX
	t9Rm4aYTMI936P9UaI/VOCb6qxHNnW/HCNHX7QB8+XEGtTfDlVpAW7e6kmoYGo4i7SV8LpCcame
	cSwtLD/qFVGRJVleYk9pLpkz1QNf1Ny57AxC7gRwQpUcZPH826QtedHkhJ7HRxyvHi+YOT3vCWb
	GTffKO7kakz25FLGFC6VCERHfJfdF2QKZGTs1aqt1+wEBVeqo339FHR9Qfd5L0KpQSL05KaqOvg
	7QEPjepnRQLeF35+v3q/sDikBEG0+Upzh7HdphIMnZHvkqDwn6UJUc36G6PHG4hKwmoYPuf4DtQ
	PtdLegXAYBZBqSmixT72bfVFEVf6VMaKCWQ9ueve80oa4w0YOFMpHcg8+w0kv+7ao0W0HQbP75y
	Uyo0xTwo3Kys0GBAWzd6ny803vRGv0btkvt2fFo8NATQagTOWSJ+sQGhOou8lLpz2BWoNXElOHS
	uyg/Dz0Be6qdXA=
X-Received: by 2002:a05:6000:1a8a:b0:455:59b5:d6ba with SMTP id ffacd0b85a97d-45c79f28b08mr5945274f8f.28.1778685854086;
        Wed, 13 May 2026 08:24:14 -0700 (PDT)
Message-ID: <439d03f4-4ebb-4bbf-a1ea-324156bff9f0@suse.com>
Date: Wed, 13 May 2026 17:24:13 +0200
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
In-Reply-To: <agSVa3uPHSZrszjz@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1778685854-AFB56FF4-0D32E4E9/0/0
X-purgate-type: clean
X-purgate-size: 4939
X-Rspamd-Queue-Id: 698F1536067
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
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

On 13.05.2026 17:14, Roger Pau Monné wrote:
> On Wed, May 13, 2026 at 04:58:57PM +0200, Jan Beulich wrote:
>> On 13.05.2026 16:24, Roger Pau Monné wrote:
>>> On Tue, May 12, 2026 at 04:59:35PM +0200, Jan Beulich wrote:
>>>> --- a/tools/libacpi/static_tables.c
>>>> +++ b/tools/libacpi/static_tables.c
>>>> @@ -33,6 +33,8 @@ struct acpi_20_facs Facs = {
>>>>  #define ACPI_PM_TMR_BLK_BIT_WIDTH           0x20
>>>>  #define ACPI_PM_TMR_BLK_BIT_OFFSET          0x00
>>>>  
>>>> +#define CMOS_CENTURY 0x32 /* Conventional index used also without ACPI */
>>>
>>> IMO this define (together with the RTC_CENTURY one below) need to be
>>> in a public header so it can be consumed by both the hypervisor and
>>> the toolstack.  Having two separate defines, one for the hypervisor,
>>> and another for the toolstack will just create confusion.
>>
>> I first thought I'd do it like this, but (a) this isn't a value Xen
>> defines (hence the comments in both places) and (b) I'm not entirely
>> happy with such a(n) (ab)use of the public headers (yes, we have other
>> such examples there, which I also don't really like).
> 
> Yeah, it's not great, but it's better than having the same value
> defined in two different files, and having to keep them in-sync for
> the CMOS century field to work correctly?

As the values come from the outside, they necessarily need to stay the
way they are (and hence implicitly in sync). If we meant to announce
another value to guests in the FADT we produce (breaking non-ACPI
guests), we then couldn't use RTC_CENTURY in hvm/rtc.c anyway. Instead
we'd have to track and migrate the index to use.

>>>> --- a/xen/arch/x86/hvm/rtc.c
>>>> +++ b/xen/arch/x86/hvm/rtc.c
>>>> @@ -47,6 +47,12 @@
>>>>  #define epoch_year     1900
>>>>  #define get_year(x)    ((x) + epoch_year)
>>>>  
>>>> +static inline bool is_century(unsigned int x)
>>>> +{
>>>> +    /* Constant below should match epoch_year above, just as BCD value. */
>>>> +    return x >= 0x19 && (x & 0xf) < 10 && (x >> 4) < 10;
>>>> +}
>>>> +
>>>>  enum rtc_mode {
>>>>     rtc_mode_no_ack,
>>>>     rtc_mode_strict
>>>> @@ -482,16 +488,32 @@ static int rtc_ioport_write(void *opaque
>>>>          data &= 0x7f;
>>>>          s->hw.cmos_index = data;
>>>>          spin_unlock(&s->lock);
>>>> +        /* RTC_CENTURY always forwarded to DM. */
>>>>          return (data < RTC_CMOS_SIZE);
>>>>      }
>>>>  
>>>> -    if ( s->hw.cmos_index >= RTC_CMOS_SIZE )
>>>> +    switch ( s->hw.cmos_index )
>>>>      {
>>>> +    case 0 ... RTC_CMOS_SIZE - 1:
>>>> +        orig = s->hw.cmos_data[s->hw.cmos_index];
>>>> +        break;
>>>> +
>>>> +    case RTC_CENTURY:
>>>> +        orig = s->hw.century;
>>>> +        if ( !is_century(orig) || !is_century(data) )
>>>
>>> Is a real RTC strict in such a way, ie: will it refuse to set the
>>> century value to < 19 (0x19)?  For example QEMU seems to be way more
>>> relaxed, and allow any century value.
>>
>> I can switch to rejecting merely 0. Unlike centuries in the future, it
>> didn't look very useful to me to permit anything below 19. Please clarify
>> which way you prefer it.
> 
> QEMU seems to tolerate everything, so I lean towards tolerating
> everything that's not 0.  That's solely based on what QEMU does, which
> I think it's likely to be (quite) widely tested.

Will do.

>>>> @@ -515,7 +538,10 @@ static int rtc_ioport_write(void *opaque
>>>>              /* Fetch the current time and update just this field. */
>>>>              s->current_tm = gmtime(get_localtime(d));
>>>>              rtc_copy_date(s);
>>>> -            s->hw.cmos_data[s->hw.cmos_index] = data;
>>>> +            if ( s->hw.cmos_index != RTC_CENTURY )
>>>> +                s->hw.cmos_data[s->hw.cmos_index] = data;
>>>> +            else
>>>> +                s->hw.century = data;
>>>>              rtc_set_time(s);
>>>>          }
>>>>          alarm_timer_update(s);
>>>
>>> Don't you need to adjust the tail return of rtc_ioport_write() (below
>>> the context here) to return 0 when s->hw.cmos_index == RTC_CENTURY, so
>>> the set value is also propagated to the DM, and not only the index?
>>
>> I don't think so. The case of us not handling RTC_CENTURY is dealt with
>> earlier in the function. Whereas when we handle the field, we don't want
>> to forward (like for all the other RTC fields).
> 
> Right, so then you also want to adjust the top part of
> rtc_ioport_write() to not propagate the write to the 0x70 IO port when
> data is RTC_CENTURY?  Otherwise you propagate the write to port 0x70,
> but not the read/write to port 0x71?

I can't, as whether to forward depends on the data subsequently written.
Propagating the index "just in case" is the only workable model that I
can think of. And as guests can do any number of successive port 70
writes, the DM needs to cope with this anyway.

Jan

