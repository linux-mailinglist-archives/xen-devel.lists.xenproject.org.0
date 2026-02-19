Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNw2GgUol2kzvQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 16:11:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CBB15FF30
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 16:11:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236452.1539156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt5fi-0002Pr-Pm; Thu, 19 Feb 2026 15:10:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236452.1539156; Thu, 19 Feb 2026 15:10:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt5fi-0002Nv-Mc; Thu, 19 Feb 2026 15:10:30 +0000
Received: by outflank-mailman (input) for mailman id 1236452;
 Thu, 19 Feb 2026 15:10:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vt5fh-0002Np-MK
 for xen-devel@lists.xenproject.org; Thu, 19 Feb 2026 15:10:29 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f7d2c23-0da5-11f1-b164-2bf370ae4941;
 Thu, 19 Feb 2026 16:10:27 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-435a11957f6so887500f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Feb 2026 07:10:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ac8d82sm50296630f8f.31.2026.02.19.07.10.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Feb 2026 07:10:26 -0800 (PST)
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
X-Inumbo-ID: 1f7d2c23-0da5-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771513827; x=1772118627; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uiHV1+uPsnsiaGe1CmpdkcgTyzbx0xEFHEi0Qjuzjw8=;
        b=QYynhKQOKeN6xyOoSqemU0tE9oyFkt36+B2KbWn6K6opUDH37qd0g+LWkPa/yK2CFn
         cmedpbW43wZi11WqRCyPHRF39bgksnSb02Mi7VB8pCcywvq4okt9tW9eAdhwWTvizoMY
         JFCW0ltp//APLYDkHEft29QXs2F5aGsG5OGuZO6vsxxAtsaJwuXBBIb5rslXimBcu8IT
         kMUiHl5N+pBchQ08YopWc/78xZqTWa1QnNp8MIQRoee47+KHYNwxRtzXSTNVmeZbMmQS
         a7WvkbwYKqmGb5ZiUihzxZaQLF8zkF94lKhjgnxLaZndxpV4ycKAJeusn7/dRKTEPShx
         UfnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771513827; x=1772118627;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uiHV1+uPsnsiaGe1CmpdkcgTyzbx0xEFHEi0Qjuzjw8=;
        b=Uo9Q8p9eJyYc60UtqfREVX8UTyUJ/FiUehcNzHyImeVFH1Jn4DzFi5kfynBKRTDGdz
         0Mt2ssnpTKmOjn8MW2EC+xLgp1nF7jw1yyVcoW76oPtzQWS2yf0Dp9NPW8F+ptf7qxvR
         MEbYLDbx7Oc4KDjwHwT65hso3/t8axJ9WEbRPOwwoCqBBXYsRakkqcomsPTIv+R7Dd7B
         F2+S8pAmxyHEjwmdQri5uDU4bk6Z5/gI5CjsQa6NbAbgFJQUJEzioK92no/keg8ylFwb
         KB5e90aKSUxsSrvcjDBGJUi1jLmrXEBTxA2ZXzgM+pvMGhlCOkvnOcERKLPaBc/HXXkA
         cHBA==
X-Forwarded-Encrypted: i=1; AJvYcCX81k33UGJe1EDKu8pOVm/m4FLwcqDZ7I3ExUBrvWmFNeCqMCeaTzWRY3NDSKwC7ZUOEDzo0ikGdXE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywz4IaBwf2n0FbvaKComUBEG3Qh+jbCQhQ4rtcFkhsr+cWL4WPr
	x68ILTKOVDlz5Ac35H1HwjYXSsUQkJLYYgd/81DtjJIN/TewkgMDh4UlE+Wk3qWsAA==
X-Gm-Gg: AZuq6aLjb1JrTKJcXCNmaLRY8JejLgkHNE7nEvKsNMdqNVHxnwKWQMJSa6DU7CYCUBr
	yoBLBfZ7b1Bez/uwwmxn+KVqiRTRecdImvpHttJfpNczDXz7U+0UyyC8kySWIIAJE5GFBYRUhRF
	XpecQoroL/xt9+u/K7J0JNjmnBmNJDT5mXpJXdXAAXRsFnfQFVmS6gtfj7kJatG6W9xpeMAYAWU
	eoZYKQ+TMYACzHc7ZkpNrLL5JVKtCpcOUMgUAswlAizqHlTejMxOODIiPgRMGDuc2IZKrYYSK27
	MDVI8sXKaE9ms9fs40n8l3WgitJT4X1IwQVBAlkRT6Yj10sFETGJNkbtl5vCU4Kmn3Q1uOER9J0
	bi5aB/EDraTIZdBevnc64xVfMMGGmsUbTdMzo00aK3UyPa0ygUAwlUNGiUDFvXBLsmrXGJeg2/8
	pjyzM4BZ1siqsjV3WmohULRfDkFxWB9Z3QUOm+42zaD3uMX7z3J51xN3pWD839768AmHRPTzzgI
	i08rqu2U1ShJ/v7Z6OOjG7i5g==
X-Received: by 2002:a05:6000:2585:b0:437:6dac:4578 with SMTP id ffacd0b85a97d-4379791b7a4mr42456544f8f.42.1771513826799;
        Thu, 19 Feb 2026 07:10:26 -0800 (PST)
Message-ID: <fccf0e23-222b-4da3-9b4f-0345373fe641@suse.com>
Date: Thu, 19 Feb 2026 16:10:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvm: Advertise and support extended destination IDs
 for MSI/IO-APIC
To: Julian Vetter <julian.vetter@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260209113412.2603088-1-julian.vetter@vates.tech>
 <87be26c1-52fe-438f-8aad-1d5ea0f0a325@vates.tech>
 <d3b71e9b-c026-4cda-99cc-a8037f302bd5@vates.tech>
 <eb4363a6-9035-4922-9314-60f4c6ca9309@suse.com>
 <bb00446e-ed6a-4c9f-9c6f-e49fd7b81997@vates.tech>
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
In-Reply-To: <bb00446e-ed6a-4c9f-9c6f-e49fd7b81997@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julian.vetter@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 49CBB15FF30
X-Rspamd-Action: no action

On 19.02.2026 14:52, Julian Vetter wrote:
> 
> 
> On 2/19/26 14:28, Jan Beulich wrote:
>> On 19.02.2026 14:08, Julian Vetter wrote:
>>> On 2/9/26 14:40, Teddy Astie wrote:
>>>> Le 09/02/2026 à 12:36, Julian Vetter a écrit :
>>>>> --- a/xen/arch/x86/hvm/vioapic.c
>>>>> +++ b/xen/arch/x86/hvm/vioapic.c
>>>>> @@ -411,7 +411,7 @@ static void ioapic_inj_irq(
>>>>>     
>>>>>     static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
>>>>>     {
>>>>> -    uint16_t dest = vioapic->redirtbl[pin].fields.dest_id;
>>>>> +    uint32_t dest = VIOAPIC_RTE_DEST(vioapic->redirtbl[pin].bits);
>>>>
>>>> I would rather introduce a new field in vioapic_redir_entry for the
>>>> extended dest part; and compute dest from that and dest_id.
>>>
>>> Here I have a question. This struct is a public ABI struct.
>>> vioapic_redir_entry is defined in
>>> xen/include/public/arch-x86/hvm/save.h. It's part of XENs VM
>>> save/restore operation. It is used by libxc and toolstacks to migrate
>>> VMs between hosts. Changing the struct might be undesirable? Yes, it
>>> would make the code cleaner. having a bit entry for the extended dest
>>> bits. What's the general opinion on this? With the VIOAPIC_RTE_DEST
>>> macro I avoided touching this struct...
>>
>> Which in turn raises the question: How do you migrate those bits? It looks
>> like you're losing them.
> 
> The bits are preserved correctly. The migration saves/restores the full 
> uint64_t bit union member, not the individual bit fields.

Which is, aiui, only because for the IO-APIC we haven't introduced "check"
hooks, yet. Which, yes, ...

> But, the issue 
> is maybe in the other direction? If we migrate a VM from a new XEN 
> (where the guest has programmed extended dest IDs into RTEs) to an old 
> XEN that doesn't understand them. The raw bits would be restored 
> correctly into bits, but the old XENs vioapic_deliver only reads 
> fields.dest_id (8 bits) and would silently ignore the extended bits. The 
> guest would end up with broken interrupt routing to vCPUs with APIC ID > 
> 255.

... goes along of what you're saying here.

> But there is not much we can do?!

The bits need explicitly migrating (which may well be as part of the RTE,
as you describe), with checking as mentioned above in place. That checking
would refuse the migration prior to your patch (or when the feature is
disabled for the guest), and allow it through afterwards (when the feature
is enabled for the guest).

Jan

