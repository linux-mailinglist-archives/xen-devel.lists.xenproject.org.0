Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id spdhDauzK2o+CAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 09:22:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 917B56772AE
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 09:22:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=NQtQBQOG;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1336363.1598137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXwCj-0006Y6-As; Fri, 12 Jun 2026 07:21:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336363.1598137; Fri, 12 Jun 2026 07:21:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXwCj-0006Vc-82; Fri, 12 Jun 2026 07:21:25 +0000
Received: by outflank-mailman (input) for mailman id 1336363;
 Fri, 12 Jun 2026 07:21:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wXwCh-0006VW-Os
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 07:21:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXwCg-00F6jH-UP
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 09:21:22 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2bb36b-5cb7-0a2a0a5109dd-0a2a4503d8aa-16
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 09:21:22 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2bb372-672d-0a2a45030019-d1558033e8dc-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 09:21:22 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-490c0c92cffso3838485e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 00:21:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490ea963cf8sm28639715e9.2.2026.06.12.00.21.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jun 2026 00:21:21 -0700 (PDT)
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
        d=suse.com; s=google; t=1781248882; x=1781853682; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IL5emG44aQz/1fnI3eRugBts7+Yg13g4mUa8npzBCJg=;
        b=NQtQBQOGUcBn8/sVHpkBdWEZiR0hPf5ZjkATz5sA8YOtwVZOLyP1TJmBg7LpTEK02V
         7EKDaLK46At4rtbR+d4ZHWRSHtJXYkS+bzVGhc7XlQ9voDdjG8wkbTeoBmy/rfBXWQYe
         WhpnZ82fFAt/a/VSxEbhCGo5iKD9fCNrqQJmJFrcu9hf9SZyWQg/cuxnDVVF+Sn3uAHf
         lIWPEe8ERSLgfXBLwVZ/ibT/2d4jS6aj8kCVSwu/PGVLQl6zOu5+20j5e7dBUDwww76r
         0rvQ/KctSA+SOhxUAmab1ZwNY5hhBFS8Fr0+1c0n+4+/VELdfD3UFDlaytf8zMxpnVlZ
         MoXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781248882; x=1781853682;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IL5emG44aQz/1fnI3eRugBts7+Yg13g4mUa8npzBCJg=;
        b=fYFA7/vSBLNl4LDzz8idSbE074IGL8oFxLUM3Od6qHkhgkzG8WLuLr1I9Iif/10cq0
         ouTRXr7b0fTkNvsySBbU6BCW2A0gmFWGjcq3Ixtoq4dBYgQ8B1ltjkEf0t/zpbI6/anX
         Y8agYKJXHR+t5rlCLFSf0/FQZMggpGo/W+DpCpjNzQrWHBhM62EIS8R43/vMXyxVOG85
         wMsn041v16wlAb5JR3dRVZOOkOrENE4g2n1+Q77orQ8crE623PRh2exwMC3gYm851qzv
         T4OG0YLbkKdf5YC7WLkYCtpN8mE1IxXAu6WflHGUdAvH3OPFDQ6o7HTrMzwWfNYv+to0
         +vyQ==
X-Forwarded-Encrypted: i=1; AFNElJ8g56lEYEBnaPWXgf82y9gHEfddGH1wXemRVnoR/en9mejTJb9ejsZsd7NElr2ub8xNy8pYLVn2imM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy6e6PWDYJ1i/s3BOK9irqikeuK907OI8pwFmV6Ssj1ZaqlBb2W
	QsUSuikqvMF+1oYFU57NXNJ1pfcJkeONvvQdb8v8mdTfVpSJN50YGmXgg4W3/k5SAA==
X-Gm-Gg: Acq92OEtMzuFuYh9dHalhh26mJSgQG3vdcrNpR7C90HK0JgIHiwWT3ngvbUkzWNLMVw
	3r1IvYCj669bzw63Bws50VhUz/Qu1oPp+HfYiddhODh9HyH7+swtYOw86xFl0zFInTcsbNVusOL
	o+UWAt7qmdUltLJy/IgOpF33c+iXJDTXH4LQkbOwgeXLROPfuSah00ojmRr5lKBEMICEMZyay3k
	fUXbHdRIDWyNpzmSVZhyFO3gI8+Xx6329IixujC/m+DnFhQk09ku1x/LvEOaOikkUXuEE81fIyK
	uHoFVJoY0ZWOXa5KZxJ/T2l7sd4uISx2eTIyzTEhmAL6SMd0Vcofb2ler4YT48xqIFOspbxVIgk
	fQAJW0LT5MK6xGqydfmHM0YM0v38LHqU0J2kwikn7rsmpyqRSFcvuYyofCyGFQWY7/b5IpfBG06
	5oUkD+J4LNu08HsV8nkR6P42JhEaxq/1DgnAjH8TfDTwmTJOT2nelfo3vLg+XZi+M8u2Sze+D3X
	7CjHthSa76wnaM=
X-Received: by 2002:a05:600c:c1c8:20b0:48e:6db3:ff33 with SMTP id 5b1f17b1804b1-490ec4d748cmr11902695e9.14.1781248882157;
        Fri, 12 Jun 2026 00:21:22 -0700 (PDT)
Message-ID: <758494a2-e3ec-42d2-85fe-9ed9d21c682f@suse.com>
Date: Fri, 12 Jun 2026 09:21:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] x86/efi: discard multiboot support for PE binary
To: Frediano Ziglio <freddy77@gmail.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Frediano Ziglio <frediano.ziglio@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260611153257.650054-1-frediano.ziglio@cloud.com>
 <20260611153257.650054-3-frediano.ziglio@cloud.com>
 <1781220672.8631fc262581453bbf619ec5b2062170.19eb906840c000701b@vates.tech>
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
In-Reply-To: <1781220672.8631fc262581453bbf619ec5b2062170.19eb906840c000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1781248882-39B7C938-6280EF52/0/0
X-purgate-type: clean
X-purgate-size: 1239
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:marmarek@invisiblethingslab.com,m:frediano.ziglio@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:mid,suse.com:from_mime,citrix.com:email];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 917B56772AE

On 12.06.2026 01:31, Teddy Astie wrote:
> Le 11/06/2026 à 17:33, Frediano Ziglio a écrit :
>> From: Roger Pau Monné <roger.pau@citrix.com>
>>
>> The multiboot headers (.text.header section) are not consumed in the PE
>> binary, hence discard them in the linker script when doing a PE build.
>>
>> The multiboot and PVH entry points are not used in the PE binary, hence
>> discard them in the linker script when doing a PE build.
>>
> 
> nit: it looks like both paragraph state the same thing
> 
>> That removes some relocations that otherwise appear due to the usage of the
>> start and __efi64_mb2_start symbols in the multiboot2 header.
>>
>> Section discarding is not done updating DISCARD_SECTIONS definition as the
>> change is specific for x86.
>>
>> No functional change intended.
>>
> 
> Given that this now prevents booting using multiboot2 when using the PE 
> build, this is a functional change, even though it's strongly 
> discouraged (not officially supported).
> 
> I would add a changelog entry to actually state this change (eventually 
> reminding that this was not actually supported anyway).

Did that actually work though? If not, I wouldn't see a need for a ChangeLog
entry.

Jan

