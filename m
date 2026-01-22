Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIcbCSIhcmmPdQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 14:07:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF5D6709F
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 14:07:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210994.1522560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viuPP-00076o-B6; Thu, 22 Jan 2026 13:07:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210994.1522560; Thu, 22 Jan 2026 13:07:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viuPP-00074n-87; Thu, 22 Jan 2026 13:07:35 +0000
Received: by outflank-mailman (input) for mailman id 1210994;
 Thu, 22 Jan 2026 13:07:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1viuPO-00074h-DV
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 13:07:34 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4fe36d6b-f793-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 14:07:32 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-432d28870ddso557062f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 05:07:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43596291e0asm16097810f8f.15.2026.01.22.05.07.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jan 2026 05:07:31 -0800 (PST)
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
X-Inumbo-ID: 4fe36d6b-f793-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769087251; x=1769692051; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yNTP+eYEmV3w6t6J7C5LKXYlmhLrORYUk+EXWQH+UNw=;
        b=UazU7fKR7uH8aZAsj2JU7eUk79xJG+OaBEgdtA4c/kGxdv72zwW8UAXm+zMLMfvTYn
         STIIF1/M/xBWjTajrf39mH1UxFS3H7XE0fif/uYVD9vgOGIYUc2nBqvpI+HykR/c3X98
         gK6/oh060QYfroBpAqI1nCK6kLFIiDgNgr22ow+fnLXNP+5XN3G4WJQW+0ptH8ZiSP6T
         wrkXa/6CZu4c54tAAqrz7EzZb+UuUlHJjS72MQKPMax7Je92Cc9+jlpMG7umZOLd2Q46
         kiS4Iwj4sSkzrG6vzCi0lF5x7/ckbukGSZzp9++hUsiKI5BolLH5C0B+m1jSnapGQe7A
         6Cdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769087251; x=1769692051;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yNTP+eYEmV3w6t6J7C5LKXYlmhLrORYUk+EXWQH+UNw=;
        b=w+p7dhu6V2a47vpW1Ok4+KT4/22SfKo/SCTLteFV1OdrPaNOA6epajnl2tcyBaKVvc
         a46sJl3BQ6oiLnmsVkF2PgUGf+jYcVitMiQH8zscGHVfl0x07JflP4/UUcsFbyKFf4av
         X0L4dGoWxlPK2nh7EytC9EFDhbKTTVPVY8Zn5jHistO5XzPc8ZvhYJz4P2/HJTmPgymx
         R66Azv9m7aPjfxucoS201lZOxhVZSaLtykaCRvJDJpb7BwnNhPraJCbgyh4pbdWXLBYl
         XEYCRBmQQPfG/GFsNgtAEJKt9QNIJUnZkvbrAi2vYng75HIWaGvdGFE8Z/CTQo4eWPEo
         +VlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSkHZ7ILMl+SDMujlE0MBt+UtCI1e9IiMMiW6HEgTHjL9Z9DzSk2OHB0kINvivqAWg4eKys8XjPBY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwNgbgUVjqFa3ip3p1wb79a/YkXLcpms+TooOloKjOV4q0X07PN
	TKbH3T39ja1s+eWbQZUNkaMUgZUuOc3F/FsIoVzeXttrZE1Ekk5NmHKkIWjw2uDhHw==
X-Gm-Gg: AZuq6aKXWiooZfEPHCoxVNZjfXtRmXxhDZpAIy5+WbKWgHK9MwQBy4k4Z62qvTcinmg
	mJIjKfyg4OV6YDaoFjsmObBNCPGFkuxV8jGahmIG6jl35S1SZjseP4FulosJGM28AzT9mkBrRJp
	jmMAOUt9ZTzsETCr7dFLD6TFJTGl9zzUaQU+i97dvSTQSQYlEpo5UCd49uOaajBTV2Wdpdrt0w7
	tjTYMIjFQ9x9EqPCkfyiBI4vRx97so5AI0lUGfCUIg5hZreao6a1KRc8yjFurzJ9FlgLxiIp7zu
	6R8kN3l6gSbSlaIm5OPZXH+jJtAa84AIYx4wr9TEEuxilKlEWjcR5JGqFaOTyMzBWpJeG5RoR7M
	+w5irSFAv7d/W3utUHu95xDHRfaOs9dP/6gjsyuT5SYzNNcFM3CoKHkWGXhU5tsO+5TZGcrW68H
	quKcnVH64S664ooRRaX9CHHlMvxX7e54fAwMIprt6S13rJIAWRLZ0WjOA8/hGrwmDODQv42+L8S
	jk=
X-Received: by 2002:a05:6000:2505:b0:435:af89:11be with SMTP id ffacd0b85a97d-435af89120emr1402722f8f.15.1769087251523;
        Thu, 22 Jan 2026 05:07:31 -0800 (PST)
Message-ID: <d3e70ccd-12ae-4a1c-b9f0-809d90071622@suse.com>
Date: Thu, 22 Jan 2026 14:07:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] xen/mm: limit non-scrubbed allocations to a
 specific order
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260115111804.40199-1-roger.pau@citrix.com>
 <20260115111804.40199-4-roger.pau@citrix.com>
 <858d73b3-2feb-419f-bf3b-9a264e9f9af8@suse.com> <aXIeKAzodr75xMsL@Mac.lan>
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
In-Reply-To: <aXIeKAzodr75xMsL@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
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
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 8AF5D6709F
X-Rspamd-Action: no action

On 22.01.2026 13:55, Roger Pau Monné wrote:
> On Mon, Jan 19, 2026 at 05:13:25PM +0100, Jan Beulich wrote:
>> On 15.01.2026 12:18, Roger Pau Monne wrote:
>>> --- a/docs/misc/xen-command-line.pandoc
>>> +++ b/docs/misc/xen-command-line.pandoc
>>> @@ -1822,6 +1822,15 @@ Specify the deepest C-state CPUs are permitted to be placed in, and
>>>  optionally the maximum sub C-state to be used used.  The latter only applies
>>>  to the highest permitted C-state.
>>>  
>>> +### max-order-dirty
>>> +> `= <integer>`
>>> +
>>> +Specify the maximum allocation order allowed when scrubbing allocated pages
>>> +in-place.  The allocation is non-preemptive, and hence the value must be keep
>>> +low enough to avoid hogging the CPU for too long.
>>> +
>>> +Defaults to `CONFIG_DIRTY_MAX_ORDER` or if unset to `CONFIG_DOMU_MAX_ORDER`.
>>
>> This may end up misleading, as - despite their names - these aren't really
>> Kconfig settings that people could easily control in their builds.
> 
> But those have different default values depending on the architecture,
> hence I didn't know what else to reference to as the default.  I'm
> open to suggestions, but I think we need to reference some default
> value so the user knows where to look for.

I agree something needs saying. In the absence of anything better we may be
able to think of, perhaps simply clarify that these are #define-s in source,
not Kconfig settings?

Jan

