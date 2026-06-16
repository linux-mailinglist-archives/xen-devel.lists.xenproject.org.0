Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UA1dHp5aMWoQhwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 16:15:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C170269056A
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 16:15:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=H0e9lTBR;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1339294.1600477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZUZp-0005XL-Qt; Tue, 16 Jun 2026 14:15:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339294.1600477; Tue, 16 Jun 2026 14:15:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZUZp-0005UZ-Ny; Tue, 16 Jun 2026 14:15:41 +0000
Received: by outflank-mailman (input) for mailman id 1339294;
 Tue, 16 Jun 2026 14:15:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZUZn-0005UT-9X
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 14:15:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZUZm-00AOjC-Ie
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 16:15:38 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a315a84-bab6-0a2a0a5309dd-0a2a45018a20-24
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 16:15:38 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a315a8a-c1f2-0a2a45010019-d155802fb572-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 16:15:38 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-490cf3000f0so46411605e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 07:15:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4620b1083e3sm604842f8f.20.2026.06.16.07.15.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 07:15:36 -0700 (PDT)
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
        d=suse.com; s=google; t=1781619338; x=1782224138; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=X6HrybE1Da0/djgF2PYpKziFD3GhGgNlXFtXfFAImfI=;
        b=H0e9lTBRhIc5Xy7TqG9OF3glbFrNRs7o3YlwFIauJW8fT76KYWGjwr1Ytmh1MqBYI4
         FzAstS+i3RjhdA4UK/04Dcx0iDn952nGNGcCp98UD8wz8tyjoQ2ND/qACcuHbhP+S1mF
         ocW/lnQL0juZT9Zrtx8yLoVzRevjpldaarZ0mZPfH0gz/n7hU+b/s5jQn5dvzPw0nZQu
         D1nH/oYmX5ZuLBHKIqhrrAa/N/2a2M67VcrK04wf50EuvNT9qQduXuEI4uam1cBJiT6o
         RJErS+wJDo/eOUatpvXLpELPszyFRbx27L7OCTfocLVUO6laT/dtPz7+devVmWmG0sWb
         yEeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781619338; x=1782224138;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X6HrybE1Da0/djgF2PYpKziFD3GhGgNlXFtXfFAImfI=;
        b=YOM2Sux7Hn8E028nIT2T0dT+5rjLgXJsrzc6RYdxtSr0TuW99C5Hv6X479e+rnn/DL
         ANxmhsB/0b/61doTb0+Lyyx63dV2GR6YFvx15I4C5vWm/sKCXewFUmiDScY7D4pLhJ/z
         vcVRTRAaC7lhEQ9JW+PkWTJy2cTvWR4K7Kw5XiAfigvmY3IbTc710ZkEGzr+IADt/rhV
         hNxVPGxKx+iw4phogqrDInXNSId7uc2BDlZy6SwYo8YvOtTK2iR0kSIexZ5gQNYa0VK0
         m1b7fYDNMQdTWi/UJdEiZIbq163MZdTSU2XE6JVcriYHgFhV9JVM9CkMOD04rTiviEKN
         hf6g==
X-Forwarded-Encrypted: i=1; AFNElJ81n0J9KTWS5JA/zN7kx55SeTUGBB1wRwZycwW02n8ln/LB2IecWnzDob3L1C4R7SP681B9y0C7rz4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yya4OiaBULyyTy2tVr7hanop0hLDPBI1Ovyz/IXNm9YmbCsNsVv
	RKy4IDzhTvUmkXOeTf/kW1Rrz6pXxaRR/RQi+6Y2hz6p0eX/hxxKq9AC6jooz9WLDw==
X-Gm-Gg: Acq92OFin+f4RAk+qsJegym86rOrdVNAkXCJbMqHA605PVXStsdZ/dR7uqU1L7aEUEi
	IkRFeqcJ2UqfefIQVtVcbTEReaHOqV+pwkKsrXmtVCaXtJHF3iimsEjI+GYHF23XrM6dM9E7bmI
	BF8L6B5XJWvgVPYaH3upEQrWqUJZi18sXLaOnSaBrSS8LrBCN0dzqc6rMz/EQJy/Bv90tNdDYmi
	YoXAVG2a0rwOJQw9j+SQjI4QIyn9ImXAvmTt/OJwXVpfsLq8hU85fBnPZwPR1JzC+cN+8kFicVQ
	1BATo6T5F8iw8ENDI9ElqxUDW0t0NcYU5nYk5UvCiwGSbKxl5W2iXHZ2sjrOXEO7AXLpPrD+1At
	MShZhpUqkpZ1t0LSyvIfDMZl3ErD/h5Lj18cKcDhgtPzWWwfnpkATTROByj8j9KaroM7553/5kq
	4ITt3eXyjgQ3cNJ0ay5xljqzuw0cqNW5VIhb6+nWsQGbnCs7hoCsyFXAxp1HNSpZ6MSftmvTWhG
	3uyPeZ9ab7QDA8=
X-Received: by 2002:a05:600c:1f8c:b0:490:4b89:535f with SMTP id 5b1f17b1804b1-490ec4d6192mr263650325e9.8.1781619337342;
        Tue, 16 Jun 2026 07:15:37 -0700 (PDT)
Message-ID: <547d8b85-3537-4bb0-bddb-2ca2f14eb355@suse.com>
Date: Tue, 16 Jun 2026 16:15:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] xen/x86: Always strip xen.efi
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Frediano Ziglio <frediano.ziglio@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260608173108.2848469-1-andrew.cooper3@citrix.com>
 <b310db60-850a-4096-8900-54d0816e5063@suse.com>
 <965bcf53-accf-4297-bf8c-903dce45cba0@suse.com>
 <CAHt6W4f5KzkRhbDnCMS82zpAJ04-UkBoOXowyG=A5CT3yNSv9A@mail.gmail.com>
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
In-Reply-To: <CAHt6W4f5KzkRhbDnCMS82zpAJ04-UkBoOXowyG=A5CT3yNSv9A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1781619338-ADF40FF4-34358960/0/0
X-purgate-type: clean
X-purgate-size: 1568
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:andrew.cooper3@citrix.com,m:frediano.ziglio@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:marmarek@invisiblethingslab.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,gmail.com,invisiblethingslab.com,apertussolutions.com,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C170269056A

On 16.06.2026 16:07, Frediano Ziglio wrote:
> On Thu, 11 Jun 2026 at 15:42, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 11.06.2026 16:38, Jan Beulich wrote:
>>> On 08.06.2026 19:31, Andrew Cooper wrote:
>>>> Some old versions of binutils ld managed to produce efi files which the
>>>> matching version of strip couldn't process.  This includes Binutils 2.26
>>>> included in Ubuntu 16.04.  Delete the workaround for this bug, and require a
>>>> less broken toolchain.
>>>
>>> And we're certain newer versions of strip don't do any harm to the binaries?
>>> Already towards Frediano's posting I said that having looked at how things
>>> work there, I'm far from certain.
>>
>> I should have added: An option may be to link twice: Once with debug info
>> included, and once with it stripped. Personally I trust the linker creating
>> the various headers, including the section ones, more than strip's (or
>> objcopy's). Yet then I can only repeat my observation that linking PE+ from
>> ELF inputs looks to be significantly slower than linking ELF -> ELF.
> 
> That was also attempted. See previous versions. And no, it does not work.

How exactly does it not work? When stripping debug info while linking (as
we now do for the first two passes), the resulting image should be both
small enough and correct. What am I missing? The only caveat I'm aware of
is the Eclair scan, where we should avoid doing any work for the
"auxiliary" linking step (the one not producing the binary that's actually
going to be used for running Xen).

Jan

