Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMQ0INJ8w2mbrAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 07:12:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FE632015D
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 07:12:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261692.1554505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5HTO-0002PB-CN; Wed, 25 Mar 2026 06:12:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261692.1554505; Wed, 25 Mar 2026 06:12:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5HTO-0002Mt-9M; Wed, 25 Mar 2026 06:12:10 +0000
Received: by outflank-mailman (input) for mailman id 1261692;
 Wed, 25 Mar 2026 06:12:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5HTN-0002Mn-8b
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 06:12:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5HTM-003P1w-4d
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 07:12:08 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c37c8a-bab6-0a2a0a5309dd-0a2a4505a7da-36
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 07:12:07 +0100
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c37cb7-5aeb-0a2a45050019-d155dd31c900-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 07:12:07 +0100
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-439bcec8613so3209262f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 23:12:07 -0700 (PDT)
Received: from ?IPV6:2003:ca:b744:7ebf:2977:bdbf:7f63:e225?
 (p200300cab7447ebf2977bdbf7f63e225.dip0.t-ipconnect.de.
 [2003:ca:b744:7ebf:2977:bdbf:7f63:e225])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b64703c7fsm44217920f8f.23.2026.03.24.23.12.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2026 23:12:06 -0700 (PDT)
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
        d=suse.com; s=google; t=1774419127; x=1775023927; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bA0B+33Q8q17uugzakYy1qRB96eZDNIMwdbLP1Crkjk=;
        b=Vm/d6/3TgDTdflk+HvQptXT15EFKWtL4dgTARPJP48F4nnQs8S+UWdIQJ2IP9lIfs/
         dJw+Swp0CIE4K2e/UfmRxqcdz9BhX52Ivl9BOniPS17ZM59n6GCDEkZGOCdoFSHLgzjv
         T3FJFNsnyDMPOOqpX3SP6gHAbn0r3VWLs1Lgk6QjJOmjo+Z0Imn4XeTTUzXztjPpuiCs
         hnqtFk3FyKikoo8KHOggJfMVlKEVe4hAvJudgjYN8CGpY7AuN1fJ81dfyrRK5vLWMeMF
         U2jYNwYtGV/GWE4BPKSwgW3O2PLxKaKrYwPIh1bSl1jnclKj98t0bGu6s81HyWyXsFAt
         t9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774419127; x=1775023927;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bA0B+33Q8q17uugzakYy1qRB96eZDNIMwdbLP1Crkjk=;
        b=Wc1l9flnZifkr+2tkaFRyCyNDdjhey0g9iQ8+ECfK8nDK0YdDj4Go1s96ka+sXoEun
         rwZrszv6a5EQSE5/t1PjbCNPx680Bxal9I9KwI5SLj1VWqFklXGOefMKEV/q1SsRiYMV
         ObZ80X1UEoaNiZvEPEcHppJAmlhROlrLieGkU/oMjeFuAdhxAg7Krt4DUNpkH6G62YLk
         +LOIeqFZYOwT5bJwE9XypUd7avp9zP0+Q3WXabPIRso0uEavniuevPFrLzrVBoqKDcIp
         pVQH9ZVGZjB9i+4u4wceIshcqs6WTP37XALjN42PhUjOlXli8QAu+YBIZxxbWuG5cgK0
         2ZTw==
X-Forwarded-Encrypted: i=1; AJvYcCVcgLEYayZK5Wr198G3IoKVBgwIjee66AdnQu4pbGtqoiOpRQGw04FOxPPmYr0MdhJ0fH314mBnCrw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyolhHg6+66LRqwQ5OMg6Po+BBIh8uofVEb6WeHKhIfwVl3eDE+
	VABuroCNytT6fxWcrSvgck3hHsKTFrJUlJAgrn1XQWvjrzfFV/pOwIxKEXCI7WrX6Q==
X-Gm-Gg: ATEYQzyyokqq62p1w4niD6LkAIaEJybd5mC17sV/PmIPAPKoZN3RQgTaTvjPmbowMqL
	c/jkyiVkZj3kQt7xb9+dJeIj1LoAjuCmsA9hgPW790bKHeLfg+u2THSNyNW2yrKW0bdR69+NMos
	3QksnX7ICL/pJakOqOgiweNZuCj4nnOrv20Ivpbt8w0z8C25pg1pyfPz+WmCqHU5h9N74QKV1/R
	2irVrdE63Ks8V6bhHBFfes+HFF9PzQ1LKp9GzsedEYerrIVqy2uZ0+2vabpL0uP1eSXBujF8/cc
	eEZXvzI5z7yltwqgmiMShaziuVrqZD483VVNTMrfwtUYOtwRp3S2BvJKuQK5VlOxeFlJmwnDI5/
	k3/kx9LvK0OKh7K5p3LnuRSlmQb/paMKXr8CeQ9vR9uXqlQQmitQkHfsKcgCL+b+YS/123G2Zpk
	Suz6v0fg/05ZsgvWwOsRCwkEjEZvIuariLbxaHjnkzJuVnjhnFDW2n9984h7Fd3N6gMsIlZaEcT
	BpI5mlVUgtU9DjL8xkSemDrzzJJWM3iIMw3wIJXtOpYfCEHebCRmIkeKtkb
X-Received: by 2002:a05:6000:2583:b0:43b:5037:7ef3 with SMTP id ffacd0b85a97d-43b889a4c9dmr3060676f8f.20.1774419126919;
        Tue, 24 Mar 2026 23:12:06 -0700 (PDT)
Message-ID: <d66de28e-ab0e-44cf-b255-deb5856f7c58@suse.com>
Date: Wed, 25 Mar 2026 07:12:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] EFI: avoid OOB config file reads
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Kamil Frankowicz <kamil.frankowicz@cert.pl>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <63284ab7-8e38-4448-a789-1b9c23c4d95c@suse.com>
 <f56a8eac-bd35-496d-ae9a-b429f8305b31@suse.com>
 <d86ec941-ba0a-4beb-b213-7d1bc9a1ec19@citrix.com>
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
In-Reply-To: <d86ec941-ba0a-4beb-b213-7d1bc9a1ec19@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1774419127-9F082488-49006692/0/0
X-purgate-type: clean
X-purgate-size: 1364
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:marmarek@invisiblethingslab.com,m:dpsmith@apertussolutions.com,m:kamil.frankowicz@cert.pl,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D4FE632015D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 24.03.2026 18:13, Andrew Cooper wrote:
> On 24/03/2026 4:36 pm, Jan Beulich wrote:
>> The message emitted by pre_parse() pretty clearly states the intention.
>> Make sure we actually do so.
>>
>> Fixes: bf6501a62e80 ("x86-64: EFI boot code")
>> Reported-by: Kamil Frankowicz <kamil.frankowicz@cert.pl>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/common/efi/boot.c
>> +++ b/xen/common/efi/boot.c
>> @@ -907,8 +907,13 @@ static void __init pre_parse(const struc
>>              start = 0;
>>      }
>>      if ( file->size && end[-1] )
>> +    {
>>           PrintStr(L"No newline at end of config file,"
>>                     " last line will be ignored.\r\n");
>> +
>> +         for ( UINTN pos = file->size; pos-- && *--end; )
>> +             *end = 0;
>> +    }
> 
> I agree this is what the the function intended.
> 
> But, ignoring the final line is rude and there's no viable editor in a
> UEFI shell to fix it.

On all the early EFI systems I had in use there was one. I'd need to check
more recent systems, though. (I know some come without any EFI shell at all.)

>  Can't we just copy the file into a
> one-byte-bigger buffer and terminate it properly?

If that would have been possible with equally little churn, I would have
done it that way. Of course it is possible in principle.

Jan

