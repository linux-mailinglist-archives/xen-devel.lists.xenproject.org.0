Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mK6FM5tZi2ljUAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 17:15:23 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 408FC11CFEC
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 17:15:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226624.1533132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpqOM-0003NF-Ta; Tue, 10 Feb 2026 16:15:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226624.1533132; Tue, 10 Feb 2026 16:15:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpqOM-0003KO-Qe; Tue, 10 Feb 2026 16:15:10 +0000
Received: by outflank-mailman (input) for mailman id 1226624;
 Tue, 10 Feb 2026 16:15:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Z/2=AO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vpqOL-0003KI-L0
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 16:15:09 +0000
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [2a00:1450:4864:20::344])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7703144-069b-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Feb 2026 17:15:02 +0100 (CET)
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-47edd9024b1so54783765e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Feb 2026 08:15:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d5ebd1bsm77224785e9.6.2026.02.10.08.15.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Feb 2026 08:15:01 -0800 (PST)
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
X-Inumbo-ID: a7703144-069b-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770740102; x=1771344902; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=83ANY+DBIX2r6a6PRfgcxJxSlFqL7AK/rkfUiGRD9fU=;
        b=AOZ1s2pBleS7AAMyf2lsT2d2IGheMzlHQXxgDNM1sL0Ia+U/XHRtDIgje21aCbiMsH
         qKs9aA2u0U8DUTEIJDbH7aPAlRf4YXbVmNaq7LAUBQa1U0fzzQjf+o36CJ2SfDRUMbd1
         ZKCSk5hQXBm4/dzSyCDGLGHsaIEzVnTLVCmfnJ6VLjnl0RkPAgUiqV+XypUwKFHPf66S
         T7lcCzC/sPZa0x3F/VXv0FbWLgnOjEUeOZIHUQawWyEG+14YjK/2fTobZJ8M3x3+6/2n
         zAPm8geWwNtz1+kmwtHsDA2fjFq6s1FzMpy5Jav8om2MZu6WNHsR7fCmWRKfg3BQjY/e
         o4gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770740102; x=1771344902;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=83ANY+DBIX2r6a6PRfgcxJxSlFqL7AK/rkfUiGRD9fU=;
        b=mW5ifJLeeI06Wzg2+e6hpp3jST92bdxH+sZkrvl3CIcqAE9VvqRXd4evgREL0jPiRB
         5YUP91B4iE8eSujMhcGIgtLmzN5okwKot4qLFpABmuEo1Tk8/qgL8kSnSAmNXQfiWuW5
         iXNyAZitm3oilW2dIeyjfp+NoXahYmvzR6QtaWsI/nQC/sHDNPtR+21dR0TiCZ0wE6LO
         srTfkxQMah+1VqA1+sc6YKjnGb7zdCrSR83tAMlW6ZvLKaBFgJHN1Fjq9yLBym/I3Af2
         dQ3cSK6FeVuF2bCIuYFTLqnOh6aJuhyJ/tUMiHMDYuewZCeU1iClKq8+Xxd38ItLccMO
         CrtA==
X-Gm-Message-State: AOJu0Yw0m17GFd6Jw7aDZhW2DT13cy/LcHRogLrxraKRfnWyOWr1Aflt
	R3pdBHP3EWQbxkSz5c7n9VgQJkaes1lK5K+4aPOQZgwxY74FQOUOstjTvUWq565nUA==
X-Gm-Gg: AZuq6aKY3hv0mWqvQu64OjHlNrun9fZxo4B1eX+CF5+NhqB1FMbQCCrKCBeiy59S3QH
	fypzV7Jp1v69LPpd4H5rL3m3fcJGPgiilMIkUCmyCssREvKp5O2p8Xv7JHRO3D54+8uzb3t6Hgz
	4S/kD9R0nWXpCmG+5OElJG+ylBmctS/Sla7ORb7TAY4LCh+t+fdpU1c3cucsv6knhPLy1yEaXo7
	tdruYBWCT3DmXc0hcmIVG9Unpo4AkjpMwOD+KjvZz4uAEyLbsFp2L7KfXkOJXuLPlbbQrPSkZ44
	Uoe+pxcw1bPSwm94THp4jreNURZU2z3FjBV9EyTE+lO90XzapLKN23tJpgBBxQe3fxoDz2yhsWX
	pwYnYnyv+XXeNKdfRch1tm8Uz0K/49VNURsuseNTszIy6VAPeOSMrBwDUY067r0nHE41BdX8MYL
	4e80jZqXDcWWMxtJ1hww0gcpao+ZKHLTezDc0Zi/OxNmvZxI2dm0tC4UV+n4fxk0PuD6ezD+hqt
	0Ebj18uyceu0Tg=
X-Received: by 2002:a05:600c:1549:b0:477:582e:7a81 with SMTP id 5b1f17b1804b1-483201da21bmr212990905e9.4.1770740101938;
        Tue, 10 Feb 2026 08:15:01 -0800 (PST)
Message-ID: <5d656a16-467e-4603-b5c6-e388303ecd38@suse.com>
Date: Tue, 10 Feb 2026 17:15:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: always consider '/' as a division in assembly
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20260210151110.26770-1-roger.pau@citrix.com>
 <FE2A96EE-5D99-4CD4-82AE-7538B94DBB0F@arm.com> <aYtVBuHVcfZE-L-a@Mac.lan>
 <1115BE16-FE3E-4F9D-BB32-77064580D5E3@arm.com> <aYtYKlcoVAFvn8jh@Mac.lan>
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
In-Reply-To: <aYtYKlcoVAFvn8jh@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:Bertrand.Marquis@arm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,suse.com:mid,suse.com:dkim];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 408FC11CFEC
X-Rspamd-Action: no action

On 10.02.2026 17:09, Roger Pau Monné wrote:
> On Tue, Feb 10, 2026 at 03:57:17PM +0000, Bertrand Marquis wrote:
>> Hi Roger
>>
>>> On 10 Feb 2026, at 16:55, Roger Pau Monné <roger.pau@citrix.com> wrote:
>>>
>>> On Tue, Feb 10, 2026 at 03:44:33PM +0000, Bertrand Marquis wrote:
>>>> Hi Roger,
>>>>
>>>>> On 10 Feb 2026, at 16:11, Roger Pau Monne <roger.pau@citrix.com> wrote:
>>>>>
>>>>> GNU assembler will consider '/' as the start of comment marker on some
>>>>> platforms.  This is incorrect with Xen's usage, which does use '/' in
>>>>> assembly files as a mathematical operator.
>>>>>
>>>>> The behavior of the assembler can be altered by passing the --divide
>>>>> option; unconditionally pass this option when available to force the
>>>>> expected behavior.
>>>>
>>>> This is solving the issue and I can build for arm with what and further
>>>> for x86 on mac os but it fails on check-endbr.sh:
>>>>
>>>> /bin/sh ../tools/check-endbr.sh xen-syms
>>>> stat: illegal option -- c
>>>
>>> Yeah, I know.  I've fixed the stat issue, but there's a further one
>>> about an illegal bit sequence in grep.  I'm looking into that.
>>
>> LC_ALL=C grep is fixing that one on my side
> 
> I haven't tested that one yet, but yes, might be a way to solve.
> Would you like to send the fix for grep?
> 
>> with that and stat -c replaced with wc -c < xx I can fully compile x86 on Mac os.
> 
> Yeah, the problem with using wc is that you have to read the file.  I
> prefer $(($(du <file> |cut -w -f1) << 9)) because that avoids reading
> the actual data to count.

But shifting by hardcoded 9 doesn't look very portable. The size not being
exact may be okay for the purposes here, but wouldn't it then be better to
use (standardized) ls output?

Jan

