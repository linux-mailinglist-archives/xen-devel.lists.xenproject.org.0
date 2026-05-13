Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMwuJb2RBGoVLgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 16:59:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EDE5359BB
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 16:59:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308170.1579713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNB37-0005Jp-Vr; Wed, 13 May 2026 14:59:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308170.1579713; Wed, 13 May 2026 14:59:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNB37-0005GH-Rr; Wed, 13 May 2026 14:59:01 +0000
Received: by outflank-mailman (input) for mailman id 1308170;
 Wed, 13 May 2026 14:59:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wNB36-0005Fw-Oo
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 14:59:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNB36-005EWp-5A
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 16:59:00 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0491b0-5cb7-0a2a0a5109dd-0a2a4505e0d0-8
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 16:58:59 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0491b3-aaa8-0a2a45050019-d155802fb04b-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 16:58:59 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-48d102471a4so69029975e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 07:58:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e8e5dd3e1sm74384125e9.1.2026.05.13.07.58.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2026 07:58:58 -0700 (PDT)
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
        d=suse.com; s=google; t=1778684339; x=1779289139; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=S49BnCLafZCcpJp1gNOheI7jeaPfBL59M9e1WCZKYAQ=;
        b=Ybn5d4UselDmCkd6VbuphKRIQ+hS3KPP851CGAnY1RIxPX2EuMXTuxXTINm9jgGF9H
         JwKiOTFJfCjYY1zOijW6QCt539t97agsh5NbOqVTDPzPyfQ5GH7CRS3LHLLhOJ/i5wzQ
         7tw3r+sQkALWUkUv8XB6/xa64XL3/8NPjgLIcQDFcEMwUzgF5yyuStKbehPuvzJ5I+Q3
         0eaBapecMlvVSNvQ3CXEQGsg4RwyVi9uSG7wcBjrY1K4ZcZV8jJxaPv7t/eG3E/oKFuY
         CmB1Kquv9HKjcSGOZOclQfemboBoAPms7m8DwQSAde/58wjxoM1q5IzmwbdjPkHfRtoQ
         I+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778684339; x=1779289139;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S49BnCLafZCcpJp1gNOheI7jeaPfBL59M9e1WCZKYAQ=;
        b=QYdov7m5y8B8Xnww1lv6obTJgwyJfEtgqUjbqTud7hSCATTcyBu90LynXtCdddYxWj
         XvYxYSziATfbuifjV4TM6l+EvXOrei5aYLG/m+ORFw3/axpkiB0TWhMBtTUaeWc9Szre
         j/G3fu2QfjioDcqIYLEnsawd1rDlRQy8U3s+7x30o3R1zerilu6Jc++2efvgI8yP9EY5
         Uxo7QK7W9ChA+jN+Hqle8WkxpjKXjgS+mXLjnbd1Xty7MGekSl1X+R3jWi6iMHAGu8lX
         BHj+mEfDfF/UbZhEfYupj2BJHC/q+2xDRM/QgDgkgTPwInKgOq/irbHfDEfCnaJy/SgR
         rSYg==
X-Gm-Message-State: AOJu0YzKtcAfayycYqjkr1cAimMH10pzeASiSUaGwvGNHTZajYHiVb+n
	Jtk4AVJDYJgtmzpnwKemTKyVxRILsBBUrjr5LRm+E1hGlbcaHyysRRP7WDyo1auF6Q==
X-Gm-Gg: Acq92OHHXz7AZAHl36JQ7IXVtXBJm7L6U5bEKF9MHGZVUeAnqbzneu3MOdvSkHVtTDm
	Q5GAQm6VMBKqnChBP+ISJ07EE8u/n+8eLnecbF6SVzIuCWbQhP0CSAtlg/Vua5Od0te95FcqwtJ
	s2f77BCJpvUXI60GT581SVMLjD8yPH3TC9o6a1dbWddGnsR0FxxBoLZv7EvPh/yenWHrAHoV7H0
	Fd7FIpSk0LG0NSgzAO/j7n8Xkz9vfOyic+CBu3YUqOY5OZv7M0Oru6hPhEfyGNJMldiR2cBQcyX
	sRYLGNf/GUOLyst0AcmmsQtxUfFaJmZbKNBHzRnfknxwSGOtzzeOQbas4328ohLNTwpmx9uvOZI
	xOn/3rXq5MBIBcGRmJn31uQIo3M/MPG6o6+S/plDYwZLk2ZdIjPbe2Ono6V8sCgUnG/oEtBE/Dq
	0MgOqT+Fy723KmINiGX/09K8TO12KsDPJp/agPB+aJ4Kwx10xXosasZ0gyT2rOIkm5M0ZbymijE
	4m9TKCOAjDBPidVwYjxyR0NZg==
X-Received: by 2002:a05:600c:4f93:b0:48e:51f5:2764 with SMTP id 5b1f17b1804b1-48fc9a4b05cmr54854145e9.27.1778684339344;
        Wed, 13 May 2026 07:58:59 -0700 (PDT)
Message-ID: <17a25f0e-91e3-4e09-92ad-21e7dc0ebe62@suse.com>
Date: Wed, 13 May 2026 16:58:57 +0200
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
In-Reply-To: <agSJlh8KQ9orL6wC@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1778684339-D9B70443-41B5CD2F/0/0
X-purgate-type: clean
X-purgate-size: 5424
X-Rspamd-Queue-Id: 44EDE5359BB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,vates.tech,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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

On 13.05.2026 16:24, Roger Pau Monné wrote:
> On Tue, May 12, 2026 at 04:59:35PM +0200, Jan Beulich wrote:
>> Both ROMBIOS and SeaBIOS (with CONFIG_QEMU=y, as we build it) blindly
>> assume availability of this field (at its conventional index 0x32); OVMF
>> at least has code to inspect FADT. Hence we ought to have supported it
>> virtually forever.
>>
>> As the index is beyond RTC_CMOS_SIZE, leverage the padding field in
>> struct hvm_hw_rtc to hold its value. Update the field only when involved
>> values are valid BCD century specifiers. Otherwise (for VMs migrated in
>> from an older hypervisor) leave handling to the DM.
>>
>> This makes the Linux rtc-cmos driver report y3k compatibility.
>>
>> While extending xen-hvmctx.c:dump_rtc() also add RTC offset there.
>>
>> Fixes: 4ca161214355 ("[HVM] Move RTC emulation into the hypervisor")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Am I overly paranoid with the checking of the field, considering that
>> Xen 3.x post-dates year 2000 and hence all firmware nowadays usable guests
>> have ever run with should have been aware of the field? Or am I, quite the
>> opposite, still not strict enough?
>>
>> I can't help the impression that this introduces a latency issue for
>> the 2nd of gmtime()'s while() loops: We now allow years up into the 99th
>> century, i.e. over 8000 years away from 1970. 8000 years are very roughly
>> 2^^38 seconds, making for (again very roughly) 5 million iterations there.
>> Did I get my math wrong, or do we need a prereq change to (vastly) reduce
>> the number of iterations of that loop (e.g. along the lines of the other
>> one, first going in 400 year steps)?
> 
> Hm, maybe we need to add some XTF testing for the RTC?  I'm slightly
> worried how much time this could take, and since those calls are
> serialized on the s->lock I wonder whether enough parallel accesses
> from the guest could manage to trigger the watchdog?

I'm not really up to making an XTF test, I guess. However, as you look to
share my concern, I'll add a prereq patch adjusting gmtime().

>> --- a/tools/libacpi/static_tables.c
>> +++ b/tools/libacpi/static_tables.c
>> @@ -33,6 +33,8 @@ struct acpi_20_facs Facs = {
>>  #define ACPI_PM_TMR_BLK_BIT_WIDTH           0x20
>>  #define ACPI_PM_TMR_BLK_BIT_OFFSET          0x00
>>  
>> +#define CMOS_CENTURY 0x32 /* Conventional index used also without ACPI */
> 
> IMO this define (together with the RTC_CENTURY one below) need to be
> in a public header so it can be consumed by both the hypervisor and
> the toolstack.  Having two separate defines, one for the hypervisor,
> and another for the toolstack will just create confusion.

I first thought I'd do it like this, but (a) this isn't a value Xen
defines (hence the comments in both places) and (b) I'm not entirely
happy with such a(n) (ab)use of the public headers (yes, we have other
such examples there, which I also don't really like).

>> --- a/xen/arch/x86/hvm/rtc.c
>> +++ b/xen/arch/x86/hvm/rtc.c
>> @@ -47,6 +47,12 @@
>>  #define epoch_year     1900
>>  #define get_year(x)    ((x) + epoch_year)
>>  
>> +static inline bool is_century(unsigned int x)
>> +{
>> +    /* Constant below should match epoch_year above, just as BCD value. */
>> +    return x >= 0x19 && (x & 0xf) < 10 && (x >> 4) < 10;
>> +}
>> +
>>  enum rtc_mode {
>>     rtc_mode_no_ack,
>>     rtc_mode_strict
>> @@ -482,16 +488,32 @@ static int rtc_ioport_write(void *opaque
>>          data &= 0x7f;
>>          s->hw.cmos_index = data;
>>          spin_unlock(&s->lock);
>> +        /* RTC_CENTURY always forwarded to DM. */
>>          return (data < RTC_CMOS_SIZE);
>>      }
>>  
>> -    if ( s->hw.cmos_index >= RTC_CMOS_SIZE )
>> +    switch ( s->hw.cmos_index )
>>      {
>> +    case 0 ... RTC_CMOS_SIZE - 1:
>> +        orig = s->hw.cmos_data[s->hw.cmos_index];
>> +        break;
>> +
>> +    case RTC_CENTURY:
>> +        orig = s->hw.century;
>> +        if ( !is_century(orig) || !is_century(data) )
> 
> Is a real RTC strict in such a way, ie: will it refuse to set the
> century value to < 19 (0x19)?  For example QEMU seems to be way more
> relaxed, and allow any century value.

I can switch to rejecting merely 0. Unlike centuries in the future, it
didn't look very useful to me to permit anything below 19. Please clarify
which way you prefer it.

>> @@ -515,7 +538,10 @@ static int rtc_ioport_write(void *opaque
>>              /* Fetch the current time and update just this field. */
>>              s->current_tm = gmtime(get_localtime(d));
>>              rtc_copy_date(s);
>> -            s->hw.cmos_data[s->hw.cmos_index] = data;
>> +            if ( s->hw.cmos_index != RTC_CENTURY )
>> +                s->hw.cmos_data[s->hw.cmos_index] = data;
>> +            else
>> +                s->hw.century = data;
>>              rtc_set_time(s);
>>          }
>>          alarm_timer_update(s);
> 
> Don't you need to adjust the tail return of rtc_ioport_write() (below
> the context here) to return 0 when s->hw.cmos_index == RTC_CENTURY, so
> the set value is also propagated to the DM, and not only the index?

I don't think so. The case of us not handling RTC_CENTURY is dealt with
earlier in the function. Whereas when we handle the field, we don't want
to forward (like for all the other RTC fields).

Jan

