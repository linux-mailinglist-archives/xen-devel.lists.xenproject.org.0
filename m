Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNgQBc2u+Gn2xgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 16:35:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77ED54BFBCC
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 16:35:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299984.1574542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJuOh-0005dX-3g; Mon, 04 May 2026 14:35:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299984.1574542; Mon, 04 May 2026 14:35:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJuOh-0005aa-0b; Mon, 04 May 2026 14:35:47 +0000
Received: by outflank-mailman (input) for mailman id 1299984;
 Mon, 04 May 2026 14:35:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wJuOf-0005aQ-8J
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 14:35:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJuOe-002kNW-KN
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 16:35:44 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f8aeb0-2eae-0a2a0a5409dd-0a2a450aa908-26
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 16:35:44 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f8aec0-56b3-0a2a450a0019-d1558036d05b-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 16:35:44 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-488e1a8ac40so40224405e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 07:35:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a8feec2b6sm80259785e9.25.2026.05.04.07.35.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2026 07:35:43 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777905344; x=1778510144; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Qntpk/nMtvFjJuNiDNbWyBm0EJqsC4q2Qt+eXA1yoP4=;
        b=ANGvkv5fysRnmys8g05CU1owp/3um67GmFKXiRIM54ocbozRmCkR2tgoEWHnhteVHZ
         Ge802ae4rSlSf3RPma40b9xdAytdaVElD5kaIbIvSl0E4vGuA2TY39HRWfAjAy+rIvmz
         Xo+JBdjZ1JpmN/5TujZ3hWtsc+9M35OM4SpaoLv06qRoJ5aAxcyOpcBfF79cFo7hG9JX
         JF4THKkpwHbA9eLSTIX6WussURj3xQKPrPLR8TCwEp0gQ0xuicKe/2Ueuc5Lb8uPA66L
         ksP0bvSqJrBJCIXHZW5y13G6lJ1oKa7R6KEaxcstM3U6dpoaOwoQpARJaQFk/SwD293J
         rRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777905344; x=1778510144;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qntpk/nMtvFjJuNiDNbWyBm0EJqsC4q2Qt+eXA1yoP4=;
        b=QXvyccbh6id2XmAxkue9ZpqL9Ke46SOojtJqtvCoIu6ARg97KqKpVNXTZxfyImK0Jh
         TQ4sr7Mjs7ocd9m2w8VC50YKIJIAZS8aTbVwMOQiXA0MRHUHzbpdQ1B8vx37OhSCtaYi
         O0ktcA7CjBtBs35t4G7RwUqXcaLXL+RZIPZuVmFgQMNm5rHEX2Yh5RJPplGcChWeEFAz
         2BdyEzJU9m6Lrgnl8Sl6rxCPG/nLkhv2Mi8KuWjapHuZSOCrZPZHRG9hZx7lIEWN0p9a
         xXUO1ATCfQPcnSnywjwlb9SJFuoRvA42xyWpDyXh494AtQJBh2PDaMBQhS1SHE7qYR/J
         rUfA==
X-Forwarded-Encrypted: i=1; AFNElJ+9uzMoBOOxLMzoGIuLQqGLWUbxTHPO0LUvheiFgCK10op74yWcYPvCPebtBBu2LsnSEcz4lovqRHs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzHpPNp7LrCabdTt5n43IE6/hRE3W0wq3SJtTOAOsdJMI1nvJbf
	LNg84r/JaKBWw02vhEM9QJEzy10VGmqZQVg1LAhC9gHmqFd8LIS+rvB3nZQt3lfHJQ==
X-Gm-Gg: AeBDieuViwhhCcK5L4rSHLe1PcAutQk2LGG9OwNZeFnrfkZ48Q9asXNT+X7xQWbHUVS
	Ztk4QRj7mOa99K1mzsP8IbnNUJahDw1Uf/HJfpgZGnV+VQYAzwBGJmeLAVdNCqWENoXFx3VWMHS
	R5IAvzeosQhTh0iH+WEcPVKj1zaFzLB8XNBYLPcEIQDtSQfuMV1s804HF3tosOY8rMWsrHTqbbU
	j+H1b6ipmxlkZoNDT81KaDRc+wSLgcH0EudH+1tHGo6K9Oio0pKANDbSkFLCSNp6VjgWOjdgf8Q
	t5ixnzidIB/5FQGaM8dX8ww2ELEWcfPBh+ahvIy60okQe10uOxo8pLRMLj8aDGNNZcd+OQWI1fk
	OKmjEk7ca0AV/tmi6HeoucN/bdnLyqYjIVo9dOyqF5xNFqBpWoCdUvYx5Rm1NSqqn0n7qiuXR5Z
	hgPv/ORudKVqEBQ4S9dHbhGKuTdYTB6AN7mwOJLVVxKN90reG50VYa0JT3mw4fHvdON2txnNPQ9
	ByYKlC/1jnwzinHehQyKnN3Fw==
X-Received: by 2002:a05:600c:c0c5:b0:485:30d4:6b9e with SMTP id 5b1f17b1804b1-48a98662e71mr133672405e9.21.1777905344106;
        Mon, 04 May 2026 07:35:44 -0700 (PDT)
Message-ID: <904df363-2f46-40fa-be05-7c1998b98c17@suse.com>
Date: Mon, 4 May 2026 16:35:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/17] libacpi: Split dsdt.asl file and extract i440
 specific parts
From: Jan Beulich <jbeulich@suse.com>
To: Thierry Escande <thierry.escande@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-2-thierry.escande@vates.tech>
 <58d73d7e-49e8-4bcb-ad6b-ba92dbf0ce0d@suse.com>
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
In-Reply-To: <58d73d7e-49e8-4bcb-ad6b-ba92dbf0ce0d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1777905344-CF77D8B7-5443444C/0/0
X-purgate-type: clean
X-purgate-size: 674
X-Rspamd-Queue-Id: 77ED54BFBCC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
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
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

On 04.05.2026 16:34, Jan Beulich wrote:
> On 13.03.2026 17:35, Thierry Escande wrote:
>> --- a/tools/firmware/hvmloader/Makefile
>> +++ b/tools/firmware/hvmloader/Makefile
>> @@ -78,7 +78,7 @@ rombios.o: roms.inc
>>  smbios.o: CFLAGS += -D__SMBIOS_DATE__="\"$(SMBIOS_REL_DATE)\""
>>  
>>  ACPI_PATH = ../../libacpi
>> -DSDT_FILES += dsdt_anycpu_qemu_xen.c
>> +DSDT_FILES += dsdt_i440_anycpu_qemu_xen.c
> 
> Instead of merely adding the i440 infix, could we perhaps replace the anycpu
> one (which doesn't serve any purpose here anymore, afaics)?

Thinking about it, qemu and xen perhaps fall into the same category, and could
perhaps also be dropped.

Jan

