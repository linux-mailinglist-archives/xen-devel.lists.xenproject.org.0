Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICUmIVd3wmnqdAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 12:36:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF21A307635
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 12:36:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260393.1553740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w503l-0005XV-7e; Tue, 24 Mar 2026 11:36:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260393.1553740; Tue, 24 Mar 2026 11:36:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w503l-0005Uv-4T; Tue, 24 Mar 2026 11:36:33 +0000
Received: by outflank-mailman (input) for mailman id 1260393;
 Tue, 24 Mar 2026 11:36:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w503j-0005Up-Ko
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 11:36:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w503i-006EtR-Iy
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 12:36:30 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c276ef-e002-0a2a0a5209dd-0a2a450a9f24-34
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 12:36:30 +0100
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c2773e-1772-0a2a450a0019-d155dd36a8e0-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 12:36:30 +0100
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-43b467dcf0bso3739027f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 04:36:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-487116f173csm52867155e9.2.2026.03.24.04.36.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2026 04:36:29 -0700 (PDT)
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
        d=suse.com; s=google; t=1774352190; x=1774956990; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ScMyBkDOwqEDv0EocgQ4r4i9mdyken1+1ACwAd0zjhQ=;
        b=gvkdRDp5BkQLEKIIRyormxd0Wxrk02XvxJRnEn0A/uqhQmPcV2+mGIUSyz2IWGO1gp
         nOk5PXcPXMih1LwY8JZ4mjvU32lkJZ3JhgWYx3VQwFpwg/srkp//nu8+IR36PtIV+oGK
         vqHX+/1hkEi7gEPba0fSoy0C227875itEA7xSuL/T/HWrOgARpsqOQH5dBxhsbEU//TZ
         sDowxQiSQ0LR59JoKowRQO3S1dfCuKlGOLYU1AEX8Xwbjrng+MJ4u8xpdeLSXoRLjIQA
         YWvEvQ5zwewu2rwMzjNZdtlQgYyE1GiCsQVWSfxZaOQmaVgZNHS0BXA7jTK+X30eMnoa
         YemQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774352190; x=1774956990;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ScMyBkDOwqEDv0EocgQ4r4i9mdyken1+1ACwAd0zjhQ=;
        b=nhFlWTf/sZYxpileH225QPGBqjugs/xvXBxJkTV888ETfx+t0MiEuzrp1n2JQeeE9s
         zNfW2EW1DxhXWV7euk41lNsovFf4LQ3hsMjzKR3LeZBQUhgauuWx+AdWL5JJpla5YuKq
         VsHtjv1tz90J6W43h4ldvVzfpXm50Yjy1mh+1+K4hRAq750qvz2JujdgvtNskV+8MkWo
         0P5Ih4e6G6Eiq2F4D3olWPNXI1IqrHqiGDqhN5qe7UDaefTYuo7L850vfSs+9BzRZa/d
         5mtE9v6yY63zkvzgXWIueSVd8WSflrzDsbD/GXg9SV9jzXdsf8yLHFVFs1uOiHZBapsD
         R+RA==
X-Forwarded-Encrypted: i=1; AJvYcCWYQtmFSl3IkZqWNPUb6XHicV597dnOD7JN4xOEQhxURKvWeRMWuexWNfSPxawhk/8Ok2Iamdcx2ws=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJbhUz+VoYLBQ/kHE+i57C1p4C6j16JePyn847ms29ZOmKd67f
	SZNT+iS0rcHmW3NFGx1Yf65G1oTm4BLyY+j0e+XJrd3S6+GSrsG8gLT4ow9tfIuiiQ==
X-Gm-Gg: ATEYQzzmQ/RoVSvJEOdpBg313UxaGh3Tqin3tfoVRiS+SJzMxrDQ8zLnl12SFtHMYjp
	G31y0pzWzwf2HSntZLqItyjLNXbPoVdqbRMOgYr3ZC1SxMmmfd7soz4VWuQkO0gAkqbqLdDiErc
	U+SEEX63XsSA3QdwU8PlsS7X1QiZvvGr/ZmwIJI0dSPmAIgLXnPOcRR4NVJGiCfAlEeHGv0j4/i
	aYmMksFBvv4E49YaC+/+VUYWyz2sail0QzKaZjAk/xYiOFtFnE2z2BAout/XPBAKhu4U0vbsmVW
	bivQ3RPPIhOafAr1P0N9FOTy154GH2G8CxRDQXYLgiLh4GIm68NupD6e9KQhqoxtxLuy0+uaFPz
	IARDVI7ULL/SYfomNJ3wQN8k7mA/a2S5aQWKTkdt1v9rA6bbRCzRXxiUaigoqQSBTnxTrZ0QC1n
	LoblvgCpMYvDAx2PJb9DxuxWzs/jkuC9DVto6O9OaAUSX7K2/7Ug+VWZCiMWGycjI16DV0p0Y61
	ZfmsKiRCoxiq8U=
X-Received: by 2002:a05:600c:6309:b0:485:3989:b3e4 with SMTP id 5b1f17b1804b1-4870f1f40d3mr42033905e9.6.1774352189681;
        Tue, 24 Mar 2026 04:36:29 -0700 (PDT)
Message-ID: <56102760-dcb3-4208-a6e3-086a966c8d65@suse.com>
Date: Tue, 24 Mar 2026 12:36:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] x86/efi: Add BGRT image preservation
 infrastructure
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>,
 xen-devel@lists.xenproject.org, sarkarsoumyajyoti23@gmail.com,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>
References: <20260324101726.6929-1-soumyajyotisarkar23@gmail.com>
 <20260324101726.6929-2-soumyajyotisarkar23@gmail.com>
 <acJxoijDI6vhs5wo@mail-itl> <56fa4fd5-19a8-4c46-9524-0f41090a8857@suse.com>
 <acJ1wTlRz3lKKjDw@mail-itl>
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
In-Reply-To: <acJ1wTlRz3lKKjDw@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1774352190-51E8D900-8061178F/0/0
X-purgate-type: clean
X-purgate-size: 993
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	FREEMAIL_CC(0.00)[gmail.com,lists.xenproject.org,citrix.com,apertussolutions.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:soumyajyotisarkar23@gmail.com,m:xen-devel@lists.xenproject.org,m:sarkarsoumyajyoti23@gmail.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: EF21A307635
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 24.03.2026 12:30, Marek Marczykowski-Górecki wrote:
> On Tue, Mar 24, 2026 at 12:23:19PM +0100, Jan Beulich wrote:
>> On 24.03.2026 12:12, Marek Marczykowski-Górecki wrote:
>>> On Tue, Mar 24, 2026 at 03:47:24PM +0530, Soumyajyotii Ssarkar wrote:
>>>> diff --git a/xen/common/efi/common-stub.c b/xen/common/efi/common-stub.c
>>>> index 77f138a6c5..9e595600d7 100644
>>>> --- a/xen/common/efi/common-stub.c
>>>> +++ b/xen/common/efi/common-stub.c
>>>> @@ -20,6 +20,7 @@ unsigned long efi_get_time(void)
>>>>
>>>>  void efi_halt_system(void) { }
>>>>  void efi_reset_system(bool warm) { }
>>>> +void __init efi_bgrt_status_info(void) { }
>>>
>>> This has a minor conflict with the current staging,
>>
>> In which case - against which tree was the submission? It shouldn't be
>> against anything else than current staging, and I don't think there were
>> any changes in this place recently.
> 
> There was - removal of efi_halt_system().

Three weeks ago, yes.

Jan

