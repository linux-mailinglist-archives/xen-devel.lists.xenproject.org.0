Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AAaNGDuOOmqQ/wcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 15:46:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B81056B790E
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 15:46:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=XT3TWIan;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1344296.1603398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc1SC-00035y-Kg; Tue, 23 Jun 2026 13:46:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344296.1603398; Tue, 23 Jun 2026 13:46:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc1SC-00033B-Hw; Tue, 23 Jun 2026 13:46:16 +0000
Received: by outflank-mailman (input) for mailman id 1344296;
 Tue, 23 Jun 2026 13:46:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wc1SA-000334-JH
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 13:46:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wc1SA-00EWVM-09
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 15:46:14 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3a8e23-e002-0a2a0a5209dd-0a2a4509b9d8-4
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 15:46:13 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a3a8e25-4999-0a2a45090019-d1558031c885-3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 15:46:13 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-490a76757e5so35755715e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 06:46:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4923fe7b359sm363298205e9.9.2026.06.23.06.46.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jun 2026 06:46:12 -0700 (PDT)
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
        d=suse.com; s=google; t=1782222373; x=1782827173; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/0/1yboZ9+2i88mjtfHYubEpuWxYl3dEnFK3kI0Tmyk=;
        b=XT3TWIanxOXIPhueirXcb8866PzWW8HR5ZzLKpKLTTQZIrZg9BOED7o+0c0IHmj1VE
         rCAqWRFQPtte14v5GfyMrJnjp3vIVFWpE34fWpikxP+8n3hVAtNItCo+2Rwh/QaLmHoe
         Z3GFzhrbWRua07aL42u/j31OD4MhlLWpFDftnY6CZHmdZckJe3Eihr3C4r1DA6MP183I
         hRaWsPHy4NOP2iCeVJX4k0pwevVUDjEiu+QXoQTZuV6yg0oT/wq1SrfxcXoo7bSZGF1g
         JO4t7eGNuuidSN8BBn4tiio/TNh0A1teFLzMMoY48vB3eYeXRdHz87u3cU4ppGZ9BM3b
         at8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782222373; x=1782827173;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/0/1yboZ9+2i88mjtfHYubEpuWxYl3dEnFK3kI0Tmyk=;
        b=IAs6TMBcwlYM3ll/8egCHL7hgv7zqgw/bGXIvdB9DVAYO/nLcZLvAF2Mx5Y0vv5Qbz
         QkEPfPHo03EZ034qsMa+QM+u3yYpowLMYoLaR34uzg3YDV+HF/PfZ1UcAeCcTLZeBSqV
         FgMQL1gAv4+VCp0cODgFMQga10qeYOexUXZxxU2Im01aRyZEHav9qCIJknGT9o/yPtFS
         WTYaJ4Hv+8IT+GQItMjfZvY3skKH+5hwAMSxO+Cc3hndUulEFybQQ2xDQx9jPq5GOvpK
         wVXBRNkZVLTdhZHsXjN4L/tsoVLcmJdT1vtUxLLUvOFo8r73CMfp7rwQqwjqay2UbS4M
         vAdA==
X-Forwarded-Encrypted: i=1; AFNElJ9J/rYHnKRjek18X27B4q0ChwQ+3hq61uD6pQEtA6TfeFOwgil42+Td3pg8vdvYRiwiRVifI3SWRr4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywc0pDsrNkH5uernpvaO40yyVK0TXFyH/vjE5FOTUeOusaJY5vO
	LHZ0KSIS6wqi7nh8TL9TyzunNbkUUBe9gJrVyMu7K7GWpvwHsp8i9sdnYlLPDZo6gQ==
X-Gm-Gg: AfdE7ck7SvKh6kWhMahzA9Pe2YPHk1GAgBHaELh5r66awPWl3mP3Ml9eH+uBHUZh+OD
	ieFGu3w0uwJ7rQT/qr9OhUYkJl78bjQtjZunTJZfBjyX9OmwhLC0lWjhSnKnizQuQM2t1UgUQ3U
	s1jKfQUlumn9aBqiT+VIYAie06tHgSLlIf4qHRdgLuvcaR5vkr74hf/YTVfgTbAA8jHGhVeprOs
	GvMwZLgz0Q/qy3FqQNkzx0Wmog+j8WY899IVr4sdlJxYs5Pi/ebfGkVxq6ebpyn2pI/z6OHm5L+
	moYJSu+cen6ZVXBx6rzmdMNH+M3HExlUHurmfJSTGLtbWzQUrM+8z1Z3sxAVTF0DzHrQqLcDJ6D
	6SZitDTNXRIsgYtdfWcg65LguPZ24qmElGh67NbarTGBaJUIdiIFWef++7aKn5yjlpPdYgUuP1k
	OVM6pkChIEcy4QkESTdkESZ7TMIbvdDcj5Mc80RVPYG7KvvzhByXTjboZDLLaecbYPpGkAT50nh
	Cxx
X-Received: by 2002:a05:600c:e556:10b0:490:c2a2:b1d4 with SMTP id 5b1f17b1804b1-4925b3bc8f2mr29630355e9.35.1782222373326;
        Tue, 23 Jun 2026 06:46:13 -0700 (PDT)
Message-ID: <c3d0c6cd-cc4e-48cc-a0fd-a455a6d4917d@suse.com>
Date: Tue, 23 Jun 2026 15:46:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] char/ns16550: bound execution time of
 ns16550_interrupt()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20260623103145.76383-1-roger.pau@citrix.com>
 <20161bd5-a081-4562-a1d9-14dbdba109f3@gmail.com>
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
In-Reply-To: <20161bd5-a081-4562-a1d9-14dbdba109f3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1782222373-73BEE744-AF4F0501/0/0
X-purgate-type: clean
X-purgate-size: 1185
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: B81056B790E

On 23.06.2026 15:36, Oleksii Kurochko wrote:
> On 6/23/26 12:31 PM, Roger Pau Monne wrote:
>> The current logic in ns16550_interrupt() will loop until the device sets
>> the NOINT in IIR.  At least on the Lenovo ThinkSystem SR630 V4 the flow
>> control of the serial-over-lan emulated UART seems to be broken, as it
>> doesn't set the NOINT bit consistently.  The Transmitter Holding Register
>> Empty in LSR also seems to not be properly signaled, as even with it set
>> writes to the transmit register take ~6ms.  This leads to the watchdog
>> triggering very easily on such system.
>>
>> Introduce an upper bound on the execution time of ns16550_interrupt(), this
>> is currently set as 4x the polling interval, which is calculated as the
>> time to fill RX FIFO and/or empty TX FIFO.  The current maximum is 5ms.
>> Once the timeout triggers the interrupt is disabled and the uart is
>> switched to polling mode.
> 
> Don't you mmiss Fixes: tag?

Fixes: "SoL on Lenovo ThinkSystem SR630 V4"

you mean? I think there's nothing wrong with our pre-existing code, and
the changes here instead are a workaround for some (apparently) badly
implemented SoL.

Jan

