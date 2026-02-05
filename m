Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKgfAe5FhGk/2QMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 08:25:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5526BEF669
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 08:25:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1221517.1529721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vntjt-0007KU-CS; Thu, 05 Feb 2026 07:25:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221517.1529721; Thu, 05 Feb 2026 07:25:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vntjt-0007Ix-9C; Thu, 05 Feb 2026 07:25:21 +0000
Received: by outflank-mailman (input) for mailman id 1221517;
 Thu, 05 Feb 2026 07:25:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DyEx=AJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vntjs-0007Io-1W
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 07:25:20 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd5c67c8-0263-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Feb 2026 08:25:09 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4806cc07ce7so4929335e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Feb 2026 23:25:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48317d2bab2sm67332275e9.3.2026.02.04.23.25.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 23:25:08 -0800 (PST)
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
X-Inumbo-ID: cd5c67c8-0263-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770276309; x=1770881109; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QBVWEpktYBWqTUwZ0yzPzFn4ghTuUTmZOg4TOLS4fBc=;
        b=Cvvy0YpHek4nYrL+NUqc4njeLJE0dXFHwMy/tH0KXTVUnkDk09tqoSYSwimsYlzFcp
         +03Ynq/mzDv0gnUBHxdV4Yny5tWdvpRiOkOOZUdwxDv+YmsykA33aCgVr0SelUNuYMz9
         alYbEpbTE9+aCfIPiGlTRCDNXncdQ7iO6myxp7lrTkC/AY0e0/E0vbyKS522qOMj2D+D
         EIafPcS7nP8POOPk/nMSlZbdJxoCN12IJLnaPRLvZZj/PRN85+LdRS5qtzNnjhuh/lhX
         fJAcq+I3w7oivJv5dIDPJhvYaPFI800AEyOv/Sh/ChsBFtg4WC52vHDsgRRkLYSt0OJ7
         zOzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770276309; x=1770881109;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBVWEpktYBWqTUwZ0yzPzFn4ghTuUTmZOg4TOLS4fBc=;
        b=h6AUzSDHko4SgiSJIx/gDbaqPhvuW+1WuF90K5ttASQyyZKIUlQNaIFOt8jQ205ffH
         7qGkG/t1nCr4Lq7bJronspg2NkU8QsUQcRskfxgvjuIewL9Ovt5LycjJ0TL3jEZKT1EL
         FiKGRZrPOvlETWw9E9+mhbn4aOtvz5s4viOpTyWv9t/1cStpHXwPxVUe/nMguf2sO/t6
         vFHyGLGpYFYZDCLfmAhAOgnBKSWrTuBSrHA2Eat1M2SPgx6Lvft5gsJYgC8hyehZcLID
         RGL6FMH5xCi1agfOpe9U3yvz5HX/nRCtLegUJjXWnkOhUdwjLe8wRilcBb1z8dc36zrx
         j2Ew==
X-Forwarded-Encrypted: i=1; AJvYcCX58L2umbH86ugtZP0jN7SWmtuzeF6Sjg3JKGQybDmamGVkBrYkbquuc2Ztx7XYctqVCjab+9LJbdI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxdmhAx3kbX0YVY/tdEE8+EMSZqjMTuUPhtkSL4XpJfZn5VXOfJ
	EbZO6X39lDcmM9DQ74W/hsTOw1q8HgiJxBO7Qtvf0tnkgiIWsBO5ytAprY4pc2PMlw==
X-Gm-Gg: AZuq6aKCSciJfxB8BXu+SUCEZihKZ9syJwXxO0c1HELeNjBcOgStOYzhVFvJSc1y1/L
	2C962DqoeqN3HspfYG8ptowPidqxc7BOLPkp3svFx8YXFwB6WMMqRXnJtSRFDgW1E4RxgwpZte/
	YlKUe3Lzga4bqOOgsQgelZh9aO5vYFLQ+FdF1ihUsqFc+gIbRIyNy1YsE+NV3eJ6gxNuYmdeLmW
	On4VzJ5lTGjNp/zN7bFzh1mUVEUJGjKnKq8uoDZb8oMf7RG+mC9BspDoHT9+Q6s6hRzNUzHn4Ew
	PxLDJh3m9b0ad+Su66J4k4aAaws0I1bxDWauuM2nX48kxlKGayResJF9jSi9u1j9kTqAPvlJGtn
	Gkz8HFY/+ue06LGpgXpe28HxweKyslcoS6erwZ/YvNWLbGvhsrLUU369od00A+WLrUOexEbRjSv
	e6ZYYdVX526xpXWVyPuMVhSkE6qYNNJM4OAXmtvKs6SITaPfJ81iu45Wrrj1K2WLcs/UOh2Ettu
	LI=
X-Received: by 2002:a05:600c:1d0a:b0:45d:d8d6:7fcc with SMTP id 5b1f17b1804b1-4830e99b3ffmr76619825e9.27.1770276309050;
        Wed, 04 Feb 2026 23:25:09 -0800 (PST)
Message-ID: <ce7abced-0ad2-449a-b6e2-87dd720dbbf6@suse.com>
Date: Thu, 5 Feb 2026 08:25:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen: Add macOS hypervisor build support
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <d923a50ff7870087347ef783516f3c2d2764dc6e.1770210872.git.bertrand.marquis@arm.com>
 <a3637eb3-ff0d-4a69-aa7e-e86be92b062b@suse.com> <aYNySRMnVyNixlzr@Mac.lan>
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
In-Reply-To: <aYNySRMnVyNixlzr@Mac.lan>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,stdgnu.mk:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:bertrand.marquis@arm.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5526BEF669
X-Rspamd-Action: no action

On 04.02.2026 17:22, Roger Pau Monné wrote:
> On Wed, Feb 04, 2026 at 04:31:12PM +0100, Jan Beulich wrote:
>> On 04.02.2026 14:16, Bertrand Marquis wrote:
>>> --- /dev/null
>>> +++ b/config/Darwin.mk
>>> @@ -0,0 +1,4 @@
>>> +include $(XEN_ROOT)/config/StdGNU.mk
>>
>> Darwin isn't really a GNU environment, is it? The definitions in that file
>> may be suitable, but perhaps a brief comment is warranted?
> 
> It's similar to FreeBSD in that regard, which is also not a GNU
> environment as the compiler and toolchain is LLVM.  However the LLVM
> toolchain attempt to be command line and output compatible with the
> GNU one AFAIK.

Hmm, FreeBSD (unlike OpenBSD and NetBSD) may be somewhat complicated in this
regard. First, I don't think the default compiler used matters. What does
matter is behavior in certain (many?) respects. E.g. in GNU binutils
ELFOSABI_FREEBSD is treated as equivalent to ELFOSABI_GNU in certain places.
So it may be viewed as a "hybrid"? (Of course there are many(?) other things
where GNU environments are expected to "behave" in certain ways.)

> FreeBSD.mk also includes StdGNU.mk.  Maybe we want to rename StdGNU.mk
> to generic.mk or common.mk?

Not sure here.

Jan

