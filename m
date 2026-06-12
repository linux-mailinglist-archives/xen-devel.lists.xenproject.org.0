Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hsgjKvgULGo3LAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 16:17:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 128DE67A1BE
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 16:17:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=Ymqhw4Kh;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1336734.1598525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wY2h5-00044I-Is; Fri, 12 Jun 2026 14:17:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336734.1598525; Fri, 12 Jun 2026 14:17:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wY2h5-00042r-Fx; Fri, 12 Jun 2026 14:17:11 +0000
Received: by outflank-mailman (input) for mailman id 1336734;
 Fri, 12 Jun 2026 14:17:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wY2h4-00042l-2b
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 14:17:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wY2h3-00GOO3-C5
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 16:17:09 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2c14e5-2eae-0a2a0a5409dd-0a2a45038a58-0
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 16:17:09 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2c14e4-672d-0a2a45030019-d155dd30c4a5-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 16:17:09 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-45ef1629ff4so707711f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 07:17:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2c3782sm5772223f8f.25.2026.06.12.07.17.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jun 2026 07:17:07 -0700 (PDT)
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
        d=suse.com; s=google; t=1781273828; x=1781878628; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6T1/4sCoiuJrs0VOXsIiGjvm15JnE3yFgp6zRo6K2n0=;
        b=Ymqhw4KhOMYjuKx7FelxgMz8OAQhtzEKt0/lcgZqDGBeup3OswqHnXsps8WvxrhqMp
         Q4vuuCYzv2/aVSB1XCYJZgqUfCA9LMbhvh/RsTdwCZZcks8VvusdvvRDZauNYvoxVfUy
         cbiJZ+7W+CUJRJcP3SbNeG4apeCPq4zwCBGkmTxsZOz81AMIiRA3Ao6vkH1voVIcJE/q
         4Lw/878W/SI4Y1t00Cnv35Dbs1RRiw6zlMKV+rFXw45dz3Yc6FGhd8nHfUimsUT3xuCW
         M6PiQweLHbDLxW50MKDMxRytvuJLy+wdnXovkqFL9qpll72mQspJXJ9h0ecZOvYOiRMx
         w2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781273828; x=1781878628;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6T1/4sCoiuJrs0VOXsIiGjvm15JnE3yFgp6zRo6K2n0=;
        b=FO8txGJpmdWz/EQoeSJe3bdOi2+eebpzuNe5rH4v8FJlo40ja0scn8Mn4AeqpNUsDg
         7CxBks5dzhplPMV7Md98kcGAt6gZlJmOsUjcbet/I91tG56OR+l1FC8E6WfbvE4VIqVF
         U0hey/9BRnms6+f4KSIV434IhUYr8WE1GLob3EVoH7Zi2QdHJN9k+VXHMRZg5KoePYLq
         z+O00ZBm6SALRuoYP/7cQYwP0qF42iodupR+mQ0MG975rcH6TTTz9xce+GrX1zxQwYxG
         jLsW1NMU1c3lrb8W1Qyp1vJYqBsUqwE96YfT8ucMx+v/eY+H52fdjbl5DWN2d82AMMaG
         GWHA==
X-Forwarded-Encrypted: i=1; AFNElJ/EKvDvlh6Vb155qj+jTjnPzNdS0it9SDDpk9o73LcWqfdrswYf/hoEzKfNMUH/kbXmXk3Zlae76hM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzwSaZjoJeCvPYK9crTVNdOVhGKlRkxp5l2gmdtG/Rwlf9IIAlN
	21LxzorbwMqIqvPjd7Ceh9871OOu8fA0Vif7d5fNW2hCRfJRNN8b2ZscQ3Em9Dhmyw==
X-Gm-Gg: Acq92OFfUoFnz+peybmRs5E5c2Wu8OqGO6RYvXxvrbbh0FdZULQvW7yXiokErAdqPce
	icYR09FEH6GdES4r3DoB454T54Qz1mpqaFEjFBxGJejq2WMDE76L2iZXN5H5x5PbO4H+9EU8/+p
	HM9jgqst2S0ik0pkYQSFj7mPcqTV55oy78e5eau2PfZjLdp7hp1LdK7g1twnkyqbRkzPNPuknJ9
	Hg03pj/hDl+l3xKxQRHh/AAg1YzwAie0ZzRFqzF0pJjjCYgj9+f4YWHi1kkEuFqQEECjFja2uKK
	Fus1PvgfzJPrVopQnMWyp/n4T/G1n+3LHqvw6ftFnmOWoCfQJIil95OZvpiq/YkZA+dyJGUz2AO
	fDzf1uZmeRGHbDRpm8y/wPM7cQ5vLfzQKI96kxvdATJPLx7Dyz5KYAD2va3DqC5SvJA+RXAOKuS
	nhYQiWoafwyufWPXYz7HewZFOvipRbbP+X5/K81Rvus3AslKI6rjcSohqB9T0MVTdnQpkFtD1Gg
	UwX0SRGaJGxIw8=
X-Received: by 2002:a5d:4b52:0:b0:45e:f780:6177 with SMTP id ffacd0b85a97d-4606da70d8amr3568009f8f.18.1781273828320;
        Fri, 12 Jun 2026 07:17:08 -0700 (PDT)
Message-ID: <957a0fea-4099-4470-9b40-3f8b294c44dc@suse.com>
Date: Fri, 12 Jun 2026 16:17:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Assertion '!is_idle_vcpu(v)' failed after 'Remove
 fully_eager_fpu' commit on EFI
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <1781272430.8631fc262581453bbf619ec5b2062170.19ebc1c488b000701b@vates.tech>
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
In-Reply-To: <1781272430.8631fc262581453bbf619ec5b2062170.19ebc1c488b000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1781273829-36945938-DD14015E/0/0
X-purgate-type: clean
X-purgate-size: 1198
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
	FORGED_RECIPIENTS(0.00)[m:anthony.perard@vates.tech,m:ross.lagerwall@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: 128DE67A1BE

On 12.06.2026 15:53, Anthony PERARD wrote:
> Since commit dba44e051209 ("x86: Remove fully_eager_fpu"), I can't boot
> a machine and get assertion '!is_idle_vcpu(v)' failed instead. It's
> netbooted and EFI.
> 
> Xen call trace:
>    [<ffff82d04033da2c>] R vcpu_save_fpu+0x65/0xdc
>    [<ffff82d04029c5c4>] S efi_rs_enter+0x37/0x16a
>    [<ffff82d04029c7e3>] F efi_get_time+0x19/0xb2
>    [<ffff82d04047cbf0>] F init_xen_time+0x1e3/0x2b4
>    [<ffff82d040477a49>] F __start_xen+0x1d71/0x24b8
>    [<ffff82d0402043e7>] F __high_start+0xb7/0xc0
> 
> Assertion '!is_idle_vcpu(v)' failed at arch/x86/i387.c:195

The thinko looks to be in 4b9851c64522 ("x86: Remove fpu_initialised/fpu_dirty"):
While vcpu_restore_fpu() indeed unconditionally set the two boolean fields to
true at that point, idle vCPU-s may never make it through that function, and
hence ->fpu_dirtied would have remained false, triggering the (original) early
exit from _vcpu_save_fpu(). Perhaps all we can do now is guard the call to
vcpu_save_fpu() (and also the one to vcpu_restore_fpu() out of efi_rs_leave())
by explicit is_idle_vcpu() checks. Much like the calls are guarded in
__context_switch().

Jan

