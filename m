Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YuFKLMbaO2r5eAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 15:25:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8A66BE944
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 15:25:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=KDfQ7pTk;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1344954.1603967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcNbI-0007Eh-Nz; Wed, 24 Jun 2026 13:25:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344954.1603967; Wed, 24 Jun 2026 13:25:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcNbI-0007Bt-Ky; Wed, 24 Jun 2026 13:25:08 +0000
Received: by outflank-mailman (input) for mailman id 1344954;
 Wed, 24 Jun 2026 13:25:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wcNbG-0007Bn-H3
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 13:25:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcNbF-0029fw-Tz
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 15:25:05 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3bdaac-e002-0a2a0a5209dd-0a2a450bc45c-28
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 15:25:05 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3bdab1-ac48-0a2a450b0019-d1558029a517-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 15:25:05 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-492329c5514so4330815e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 06:25:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c1e840efdsm6571900f8f.5.2026.06.24.06.25.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 06:25:03 -0700 (PDT)
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
        d=suse.com; s=google; t=1782307504; x=1782912304; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qaDctgAA58axr3wmtfmlkSxuDvQwZusYq2XindzAz8w=;
        b=KDfQ7pTkkaV4PwguO4g9NK+Yw7R2MFhuHb0gAwnqc9NOhILTypTk/Vvb2+NxZ18mIO
         iC7fL14TzkqhodJluIMkIuFvmjka8krsBwHvWkO8ZmBGoFI3ZVnHVgJECcbZEtbWqujk
         VQBgmFfo3V47xbufR3V8HMFK3Y16kb5dAfTLAfzCv8iWZT2zQ5DIRZVnCFYRBGBOMLFW
         RIGen93TbbnCGdXOFhhF2DLkiKpM0fE4/gZkwwReI1+41cQg5JLKXDi3b1qXodrLgEhr
         e6I4b3Inveg6KgFuyEzjO4CnMqcatzi6DxWsinmrW1y+LeHOgmk5c6wtgPu7PFmupyH7
         8Mww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782307504; x=1782912304;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qaDctgAA58axr3wmtfmlkSxuDvQwZusYq2XindzAz8w=;
        b=FVJlNw5HPiVfeuHdGEbrea/yxdn4aW8hDDyL85w+cej+/uRQcghlOidQtOXybSsdcm
         dV1pdgievwGNFCoJ6LVUOKTZzcSjEhCqts+B0XXzx0oZTRzsakMlzDUs8a0F2o5lw/t1
         oTk77r4nukwNR2oOiiGf0/shwxo/2yL7qtMpwepMJOn1MomCkGFt4kn6FUb8wmPtVyOz
         ZuuiB3Wn7tK8oj9oqMNJot4dJeL/liKM6h6pXaihxl/jVbCe1OIOnqOA2ZFFxHAyv6X4
         r2LObz/Ba+NIpXVeYuhnsN1RMAeo6Q5+tOWIAtx/DZM3rSalIrGgWjC3FuKl1yJEC2TJ
         Jv7w==
X-Gm-Message-State: AOJu0YyDS1y/VA5Fvfhze5WUbi2IFCoAiGIZn0apM+naAFWO/E8X4mAW
	WkS0ddes5QkkfthfqwrCCOf1AF4ZxArBltkReNZgaWdVeXFUgs1NgNPhg25Pq2A+xYSJwkY/dO9
	oiBOQRA==
X-Gm-Gg: AfdE7ckuCKjLwjqSP8AiZDP5dY2gc/+2du2elqNJAWSP3P0YXXIDKirWhMiEYdYLVfy
	acGFSq/Y6CiKzc54YT5ZSt+3ocaj7rj7QKvNDYDI3h2TKYX7wfdMjMmEoDiky9IUu1wTurAQk/F
	GDa9LnfNYre9E0HOK0g40GvntAKGDrQ5k1fC9DeLplNSG8n5O+FidEDhCzy15/O8FIqzNu2MQ7f
	BWv7cSD7OIA/dGaLPORZjIx00EMVnPyNifu1fQkxm1vcDy5PsbTFwfkGLQ5pMXUWAN/PWlJoe4e
	LpJnfSUbubPK0G3cK8Uhf2yBpTh6dwBcbZUvnY2AP+SjIQrKQ5FhcZGxIOYRs2zIFEvQ788NfEs
	0UBnWxW507E82Ok/lWcuH/drIOp6gagIcrJYlSpeScY1G3R6lmmes3YWv2uGyxiJDE2c+zsjis7
	KIMToOsirlEIjL3jjnb5lPuT7PqRvs0pB6x1pCndsP02jFdGYIUlWmfXpqdjHSdZUV1SXvDgP0z
	1AJ
X-Received: by 2002:a7b:c346:0:b0:490:b58f:4d65 with SMTP id 5b1f17b1804b1-4925a1f2e14mr95404825e9.15.1782307504457;
        Wed, 24 Jun 2026 06:25:04 -0700 (PDT)
Message-ID: <489f0a75-9942-42bb-b449-7ac84474ae2a@suse.com>
Date: Wed, 24 Jun 2026 15:25:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: sort obj-<...> list of main Makefile
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <fe611607-c4d4-4db0-85a2-445bbec5fc47@suse.com>
 <1e3b36a6-1970-4376-97fa-621899ae2ad4@citrix.com>
 <d2d794a4-dfd3-45c3-b5fe-836d0a0c2244@suse.com>
 <0ccf8786-3460-4500-848c-2f0058c8a269@citrix.com>
 <51e4bad3-251c-4dfd-b487-a760a102a08a@suse.com>
Content-Language: en-US
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
In-Reply-To: <51e4bad3-251c-4dfd-b487-a760a102a08a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1782307505-A673A220-BD120D8E/0/0
X-purgate-type: clean
X-purgate-size: 1733
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1E8A66BE944

On 24.06.2026 12:45, Jan Beulich wrote:
> On 24.06.2026 12:40, Andrew Cooper wrote:
>> On 24/06/2026 11:37 am, Jan Beulich wrote:
>>> On 24.06.2026 11:10, Andrew Cooper wrote:
>>>> On 24/06/2026 8:50 am, Jan Beulich wrote:
>>>>> x86_emulate.o coming rather late in the list may want considering to make
>>>>> an exception for: It takes comparably long to build, and hence it may be
>>>>> best if it got scheduled as early as possible in a parallel make.
>>>> Move it to the front with a comment saying "Really a subdir, but not
>>>> expressed in that way" or something?
>>> We have
>>>
>>> obj-y += x86_emulate/
>>>
>>> there, so excusing this by what you say would feel somewhat wrong.
>>
>> Wait, we've got both that and the higher level x86_emulate.c reaching
>> into that subdir?
>>
>> Can't we just fix that?  The higher x86_emulate.c is almost empty, and
>> lost it's main purpose when you started splitting decode out.
> 
> It's emptier for you than for me, as I've put some AMX stuff there which
> otherwise would require #ifdef-ary elsewhere. I guess I can see about
> moving that and then indeed ...
> 
>> That way we no longer have a special case, and no need to excuse it. 
>> Subdirs always get entered first.
> 
> ... try to get to this state.

x86/x86_emulate/x86_emulate.c has no #ifdef-ary at its top so far. Sites
#include-ing the file are responsible for carrying all prereq #include-s
(i.e. ones needed on top of what x86/x86_emulate/private.h supplies). Are
we happy to give up on that and have #ifdef-ed #include-s (and alike)
at the top of x86/x86_emulate/x86_emulate.c? (For AMX there would then
also be a couple of static items in a __XEN__-only code fragment.)

Jan

