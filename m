Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ihTUJ6D5H2oAtgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 11:53:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A380636557
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 11:53:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=YgCCoBmd;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1326003.1591389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUiHm-0002DU-TA; Wed, 03 Jun 2026 09:53:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326003.1591389; Wed, 03 Jun 2026 09:53:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUiHm-0002Bl-QR; Wed, 03 Jun 2026 09:53:18 +0000
Received: by outflank-mailman (input) for mailman id 1326003;
 Wed, 03 Jun 2026 09:53:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUiHm-0002Bf-0w
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 09:53:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUiHl-00BJbR-DX
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 11:53:17 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ff982-2eae-0a2a0a5409dd-0a2a450cc6c2-32
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 11:53:17 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ff98d-62f1-0a2a450c0019-d155802ed013-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 11:53:17 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4903d730b1fso113143725e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 02:53:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b6162289sm46269265e9.6.2026.06.03.02.53.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 02:53:16 -0700 (PDT)
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
        d=suse.com; s=google; t=1780480397; x=1781085197; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sDHRfJYsQa7236Unwtgl2Qvc6Eohkv1iU8PGCWhV0ms=;
        b=YgCCoBmdy8w2aNXD0A2D+H5n1gLmAuDyqglVhqAsvsxnB9GCl3MqJ6osuTIEQ5ugS6
         ztorhoDDbS0091c/Bco4kL6hAOm1tUk6uu3UgY9jfOAeRujuwjmleBYxtiCFZ6l7Jxim
         NAGF3CDP9VT5B/JwsocFWddS2Rxgvd+RxpozhO7C8FsCF+L94MtVe/6EOmUaChgGMe3H
         P9eoytRCk5MbcxuSu7sPh44GoD36ioMhdyS+EnUhMCBJOgdGZKC89F8PpoN2lXBfu0o2
         c63K7f+6eTAAK2gh9T5Khg1CMF7tMzkl3lE8AeW8qts0f+WLBUGWW/7ciVH57J1cW9J/
         dvXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780480397; x=1781085197;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sDHRfJYsQa7236Unwtgl2Qvc6Eohkv1iU8PGCWhV0ms=;
        b=MhMisjC6C1mGl1y1j63nY+Gbeb1e/ulJyN8+CfmY3q+bwIW8kGFNSe6m70N88gQeL+
         bAME0PvUZC2Ji+WXv3w6BQi5oj9ZInBIuBH/hmrLta0/ErzVDX6il+M2qxWXUKmgm3jW
         mQCf/ZGfJHT5v1yyD/149uNb2DphC+KPzwINlCiqM0xQPaNQ4itgXHQt3wkHmz8ZQv+o
         snuZ+0ztW73h72AcFXOPgoV4psC0YKSsawG7ufvIdLT8GzzhEP8HeKIPR+3i/WczgTbb
         eyskvVVEmwBUl+LoFtOSwdA0OadDiqPOY+fHAd50hTrBXYsKcPk+ZU2d2uYrrrmkCzXp
         e4Yg==
X-Forwarded-Encrypted: i=1; AFNElJ9HdoXdZvaeBARz50w2n6hl3my4AUuA2iepE3VN6fW0rZUEGdjNTah0lRUxjOe0J/oENIl/W3hfJlw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwUZeMS3aq87AosyoW3XqgYi/pL0HC3evjBoBqqZobM7h7mpfYx
	mhZXhGqgT3sKv27K+I0ykdRWo0LuEyJAySZx2i5rfrtPptH6hg2/PhLfVCovv3q0IA==
X-Gm-Gg: Acq92OGSeCcPM3mAfeGKFDi9nmU2KHjVFpdbMku6REKjH+lIVJfB5HrDDoUgvegqPGD
	tBeDu81GVmGpecMRI6qKCowuKCclyjugzQEFCUyTVja32PprREhFb/rkUag2o9bBh4OqLAbibQv
	iqKuWFpUbydYwcGun3j5W0E2UY85tQDqaR+uKPHS5EcI73JLhAqhagQ5XscgCybLuBcFvrZcnA1
	v4BzXmSrILefuzOvruwCGak9W45mxkpkm31cwJPOzprCt8G150TIVSIJgEEO7hAz5PFRaBvH9SV
	mkwazcBEhFGhTQLOdzXHNfitWIn55FTmEJ2eWgkOb5dnnVnHaKOvnGUOvLbpiG0Q8QNE8VITVbj
	hjmbdjIL1J14KhaNuocpniRYfomoRvJoIUzV547GU2x4vTvI7jwVALb8taNdMBgn9mkXWPq0tiC
	BmaVcDYmqy20KiZfi0ytD8vzn/PK6Pn0AwfEPlqf09PVMApGxfFTJP0pTxdFesFHHSLW1bNt4jQ
	N6FzFVtFVU5BScBP09V/Y0VSQ==
X-Received: by 2002:a05:600c:34ca:b0:490:4ee0:82ff with SMTP id 5b1f17b1804b1-490b5fe6112mr40923915e9.27.1780480396613;
        Wed, 03 Jun 2026 02:53:16 -0700 (PDT)
Message-ID: <0a2a9405-c102-4c9e-a62e-e5e0a5f44054@suse.com>
Date: Wed, 3 Jun 2026 11:53:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] xen/domain: fix UBSAN null pointer dereference of
 d->shared_info
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1779712171.git.oleksii.kurochko@gmail.com>
 <04dd784b6b9a4dfca9a313ea8802d8d514d65021.1779712171.git.oleksii.kurochko@gmail.com>
 <3aef7763-aea3-496a-8c18-d3659f590373@suse.com>
 <fb1b1194-5855-49d9-99fc-d35a3038833c@gmail.com>
 <3eb9ab3d-dc4d-4019-89c8-9f7dbdc528cd@suse.com>
 <9df0b08e-6185-4d0e-bd06-32fe9d684ad0@gmail.com>
 <033aa467-ad86-48be-a59b-05315aa3cf4c@suse.com>
 <0e53e87e-df9f-4c30-a089-8c4e45babcab@gmail.com>
 <00daf333-a1e7-4691-9dca-240ebf9dfcd2@suse.com>
 <0d378d0d-9e8b-4fe3-ac03-10f8ff8922a2@gmail.com>
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
In-Reply-To: <0d378d0d-9e8b-4fe3-ac03-10f8ff8922a2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1780480397-E0965CF5-26C91BB7/0/0
X-purgate-type: clean
X-purgate-size: 2997
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:from_mime,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A380636557

On 03.06.2026 11:47, Oleksii Kurochko wrote:
> On 6/3/26 11:22 AM, Jan Beulich wrote:
>> On 03.06.2026 11:01, Oleksii Kurochko wrote:
>>> On 6/3/26 10:18 AM, Jan Beulich wrote:
>>>> On 03.06.2026 10:07, Oleksii Kurochko wrote:
>>>>> On 6/3/26 7:54 AM, Jan Beulich wrote:
>>>>>> On 02.06.2026 18:11, Oleksii Kurochko wrote:
>>>>>>> On 6/2/26 1:19 PM, Jan Beulich wrote:
>>>>>>>> On 25.05.2026 15:20, Oleksii Kurochko wrote:
>>>>>>> --- a/xen/common/event_fifo.c
>>>>>>> +++ b/xen/common/event_fifo.c
>>>>>>> @@ -562,9 +562,10 @@ static void setup_ports(struct domain *d, unsigned
>>>>>>> int prev_evtchns)
>>>>>>>
>>>>>>>              evtchn = evtchn_from_port(d, port);
>>>>>>>
>>>>>>> -        if ( d->shared_info &&
>>>>>>> -             guest_test_bit(d, port, &shared_info(d, evtchn_pending)) )
>>>>>>> +#ifdef CONFIG_HAS_SHARED_INFO
>>>>>>> +        if ( guest_test_bit(d, port, &shared_info(d, evtchn_pending)) )
>>>>>>>                  evtchn->pending = true;
>>>>>>> +#endif
>>>>>>
>>>>>> While as per above shared_info() would best not exist when !HAS_SHARED_INFO
>>>>>> (in which case #ifdef may be unavoidable here), an alternative where
>>>>>> IS_ENABLED() could be used here may want at least considering. E.g.
>>>>>> causing a link-time failure when shared_info() is used (and not compiled
>>>>>> out).
>>>>
>>>> ... here. There are downsides to this, so which route to go needs settling
>>>> on.
>>>
>>> For an alternative approach are you okay with the following introduction:
>>>
>>> #ifdef CONFIG_HAS_SHARED_INFO
>>> #define shared_info(d, field)      __shared_info(d, (d)->shared_info, field)
>>> #else
>>> void *__shared_info_unavailable(void);
>>> #define shared_info(d, field) \
>>>       (*(typeof(__shared_info(d, (d)->shared_info, field))
>>> *)__shared_info_unavailable())
>>> #endif
>>>
>>> And then use IS_ENABLED(CONFIG_HAS_SHARED_INFO) everywhere where
>>> shared_info() is used including the case above:
>>>
>>> v->vcpu_info_area.map =
>>>       IS_ENABLED(CONFIG_HAS_SHARED_INFO) && v->vcpu_id < XEN_LEGACY_MAX_VCPUS
>>>       ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
>>>       : &dummy_vcpu_info;
>>>
>>> Everything that in event_2l.c could go for now without
>>> IS_ENABLED(CONFIG_HAS_SHARED_INFO) where shared_info() is used as that
>>> code isn't expected to be called by arch which doesn't support 2L so no
>>> linkage error will occur.
>>
>> Yes, this roughly is what I was thinking of. I'd like to remind you though
>> of issues with identifiers with two leading underscores.
> 
> For event_2l.c would you be okay to make compilation of it conditional 
> by CONFIG_HAS_SHARED_INFO or it would be better to introduce separate 
> CONFIG_HAS_EVTCHN_2L:
>    -obj-y += event_2l.o
>    +obj-$(CONFIG_HAS_EVTCHN_2L) += event_2l.o

See my earlier reply: Let's stick to just HAS_SHARED_INFO unless there's
a clear need to distinguish that from 2-level event channels support.

Jan

