Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J42VDGoYQmp10AkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 09:02:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E536D6ADE
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 09:02:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=GWUi8yYE;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1347228.1605108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we608-0001Nk-Kc; Mon, 29 Jun 2026 07:01:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347228.1605108; Mon, 29 Jun 2026 07:01:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we608-0001Kj-GT; Mon, 29 Jun 2026 07:01:52 +0000
Received: by outflank-mailman (input) for mailman id 1347228;
 Mon, 29 Jun 2026 07:01:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1we606-0001JR-9U
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 07:01:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1we605-00DwgC-Me
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 09:01:49 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a421851-bab6-0a2a0a5309dd-0a2a45038bd6-26
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 09:01:49 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a42185d-ec1a-0a2a45030019-d155dd31bdda-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 09:01:49 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-472a14c9965so865082f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 00:01:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4701835b625sm25141803f8f.36.2026.06.29.00.01.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 00:01:48 -0700 (PDT)
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
        d=suse.com; s=google; t=1782716509; x=1783321309; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SClWngN+cLTzdk2J60YUqgBs6yuZo+06SQX967ZqG1E=;
        b=GWUi8yYE8G9nGoZMSlqMmcRelpkctdwfyj4pa8e/ffFQw2w2PLo83s6pUkfMJLitah
         ILKmCTsNP//jsb330So7FmcrUpp1kcOv7TAJ8MkGFUck7gR+JI2yDWdP3DvVP/a9SUmC
         gEj07Gt1cP9urpGAJE39hPY+Mkk8jTcaOSNacaUIHnzOBH7cHzJoVbmJu7H+L5Oo+m5s
         CAZLM4U8yjK6eSq7K4a7IJ+Y61CJlNyQdM6afmqpICrZTy26WdzYqGv9RpHbHwAZ9eYU
         XiDpBKvNX6W3LWlE4a2NDSYYgPIECOl+Tk3onYuB26+EZzO/TVcXbs06AINpxLIotZdi
         YlDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782716509; x=1783321309;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SClWngN+cLTzdk2J60YUqgBs6yuZo+06SQX967ZqG1E=;
        b=PTi7dLN3EDc2r6Y5TwXLL7Pm/cE0dbEZGAUla74gbhlswUwigRdfztoz52dQ/Y5Sm5
         Lnls18PIx+uijoEAJwGbOoRg0gF3QQQdeS+CKSDxrvwKnssnaS/pmj9A09M/dH7Rp2J6
         mhG6fKVyAdodeLdiupvxnUu4HUeooK32aCs9DMkAokCYRoENCsS0AhlDhK57mlRbWElt
         t1ir7hL/nuUQJRVKrLGJLTgwaxW5VLiPbB0ogyGpruMKye9u5r9lhsalK7vYv8xFXyVD
         6ZPHpM+TiHUKy6Lnkc+GoXZuXpXM9LyBuS79+Q2ZjMF14tAaz8LUavchnlNUSpXeNenz
         7azw==
X-Forwarded-Encrypted: i=1; AHgh+Rq1WDhCprntBhJlnGKG56zZ0Q89W3t85OH3yPOLL/Z1cPGlNnO6ott4NiMqsrZ4lAqPQiajNNVhdMg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwL7iRwJ5dg2CNRkgY0QLeAS4IbZAOOBPwzu/kY2fnHH0pMENLa
	TBUUdXgd3B5+Ei+OrXtP2FwzN/yIWdAs3ljJnZ1tuRBjNr1Meyknakv510bPUQq7Hg==
X-Gm-Gg: AfdE7ckwv21zphSoqrwiRRYLFZhoWDGmxrnRa8aBG2l8NVb8kkFiDBpgKxatRp3BOK1
	0HbDzHoN0utPthOH9aqmG8oTo8Bs7HywFueYZ113ztduD9nML9H120n2YES/b/P/noiUcm8pCgw
	vDQSKh552K7orkuS3K/033eFIEAkBc4OQgHGOG+15PypaOmy4hcJrMZv2ikHES1oAJO1QZvB/oC
	hdnayaSBKnkuEXJUxH7LsWwnZKhJ6mCSb7/eSrON4r2B5H0RNUP8k2jGOgS8EFemfxXt18Tj5SN
	s1SnYVAz4UIoTLH5MvY1i45/o/HdISJUJAxHOmJ0fh/Rcx4TZhEwSw3beMA5AIOeufLyDli0tJZ
	2BjjjUtrOPwi4XElebD4ATlS4Vq+32YxpdeGzQeoAvhfRllFGTUbi2fP3ZTQ8HI3wqLQ8lHx/M6
	iOlV/eeqsc+iLS88teV1aNVXsao6qdZTGtVcup3wLrApWrwbC8ViaMZqfju6o+7TbDCKC1/AgeK
	hPD
X-Received: by 2002:a05:6000:2884:b0:46c:8f47:3b5a with SMTP id ffacd0b85a97d-46dc20764e4mr24785368f8f.23.1782716508679;
        Mon, 29 Jun 2026 00:01:48 -0700 (PDT)
Message-ID: <ca4b8df8-edb0-4192-94f8-dbb29101be03@suse.com>
Date: Mon, 29 Jun 2026 09:01:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools: Use posix_memalign instead of valloc for NetBSD
To: Frediano Ziglio <freddy77@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>
Cc: bouyer@antioche.eu.org, xen-devel@lists.xenproject.org,
 Frediano Ziglio <frediano.ziglio@cloud.com>, Juergen Gross
 <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20260430095521.8399-1-frediano.ziglio@cloud.com>
 <afMzlcrP7phSirsw@macbook.local>
 <CAHt6W4cwh3tx4nZNmqe9TS8TFsQDsL4pYBEBz3qqX032Jmqf5g@mail.gmail.com>
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
In-Reply-To: <CAHt6W4cwh3tx4nZNmqe9TS8TFsQDsL4pYBEBz3qqX032Jmqf5g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1782716509-B6D2B5D1-E349E599/0/0
X-purgate-type: clean
X-purgate-size: 2221
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:anthony.perard@vates.tech,m:bouyer@antioche.eu.org,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@cloud.com,m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vates.tech];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,cloud.com:email];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 98E536D6ADE

On 26.06.2026 17:07, Frediano Ziglio wrote:
> On Thu, 30 Apr 2026 at 11:48, Roger Pau Monné <roger.pau@citrix.com> wrote:
>>
>> Adding Manuel that maintains the NetBSD xen-tools package.
>>
>> On Thu, Apr 30, 2026 at 10:55:21AM +0100, Frediano Ziglio wrote:
>>> More similar to other implementation.
>>> posix_memalign was adde in NetBSD 8.0, released on July 17, 2018
>>> and went out of support on May 4, 2024.
>>>
>>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
>>> ---
>>>  tools/include/xenctrl.h     | 5 +++++
>>>  tools/libs/ctrl/xc_netbsd.c | 9 ++++++++-
>>>  2 files changed, 13 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
>>> index d5dbf69c89..f4316089e7 100644
>>> --- a/tools/include/xenctrl.h
>>> +++ b/tools/include/xenctrl.h
>>> @@ -1390,6 +1390,11 @@ int xc_lockprof_query(xc_interface *xch,
>>>                        uint64_t *time,
>>>                        xc_hypercall_buffer_t *data);
>>>
>>> +/**
>>> + * Allocate memory with a given alignment.
>>> + * The alignment must be a power of 2 and at least sizeof(void*).
>>> + * It returns NULL on error, errno is not set.
>>> + */
>>>  void *xc_memalign(xc_interface *xch, size_t alignment, size_t size);
>>>
>>>  /**
>>> diff --git a/tools/libs/ctrl/xc_netbsd.c b/tools/libs/ctrl/xc_netbsd.c
>>> index 1318d4d906..d27154dce9 100644
>>> --- a/tools/libs/ctrl/xc_netbsd.c
>>> +++ b/tools/libs/ctrl/xc_netbsd.c
>>> @@ -60,7 +60,14 @@ void discard_file_cache(xc_interface *xch, int fd, int flush)
>>>
>>>  void *xc_memalign(xc_interface *xch, size_t alignment, size_t size)
>>>  {
>>> -    return valloc(size);
>>> +    int ret;
>>> +    void *ptr;
>>> +
>>> +    ret = posix_memalign(&ptr, alignment, size);
>>> +    if (ret != 0 || !ptr)
>>> +        return NULL;
>>> +
>>> +    return ptr;
>>>  }
>>>
>>>  int xc_pcidev_get_gsi(xc_interface *xch, uint32_t sbdf)
>>> --
>>> 2.43.0
>>>
> 
> I saw Manuel reply almost 2 months ago.
> Still pending.

You understand, though, that Roger can't approve this patch. That'll need to be
Anthony. Sending a ping _his_ way is certainly appropriate after this long a
time.

Jan

