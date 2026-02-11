Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHRZFZKHjGmHqgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 14:43:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB752124E0B
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 14:43:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227677.1534101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqAUw-0005KJ-9l; Wed, 11 Feb 2026 13:43:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227677.1534101; Wed, 11 Feb 2026 13:43:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqAUw-0005HY-73; Wed, 11 Feb 2026 13:43:18 +0000
Received: by outflank-mailman (input) for mailman id 1227677;
 Wed, 11 Feb 2026 13:43:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Hh8=AP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vqAUu-0005HS-Ly
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 13:43:16 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d9a41ad-074f-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 14:43:15 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-4359249bbacso635052f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 05:43:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783e54d48sm4472000f8f.33.2026.02.11.05.43.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Feb 2026 05:43:14 -0800 (PST)
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
X-Inumbo-ID: 9d9a41ad-074f-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770817395; x=1771422195; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PhtV26UQt/YzS/mJqsXNV6LpEVa5g2rjGL/eEqK64QA=;
        b=B6cPY7OKsZw440JDAjzCgUVPZmS0yk2e0bsqjwW1PJf+j79soX126KZ//0grGHxaiw
         LUZtCAlnSY2ai009AuErJTGYzPo6IgWKBiRtSl4QLljZetE3ZWW8Nr4EhYIF10u6aPHJ
         8XmNYxGisHGmMIc18sI6uMYM7V8lDda2Pk8mncDPL4tw8R93OLozs3b/Ln4iWjg+3niF
         V3BDxUTSvcVHl3+aa9/lrhYdrl8rAadq5JCV35OhzMXZjjKtaA2JQJTQAgJOTatxsAjX
         Zoar+VZK8kzKqPj48PwWGH7F4G9L5HiRn3Lo9MEUCpWAVoLKaLJ2Oa6+UXlipijWDLzD
         jNsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770817395; x=1771422195;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PhtV26UQt/YzS/mJqsXNV6LpEVa5g2rjGL/eEqK64QA=;
        b=qTIqki09mM51WLn7CcHqj3s/yoUDTwuPkr+dSjbxYPiGsP2m3w1DDwQTP/pog/rWG/
         dRJUctSF6XQv4CuIiffzWfBo2//yCOTOfSWU0yqhztP62qiKr81kr0tiidFo+gY+5eL9
         SdWOOvLFg8Kx7nXbyHXQX76Q9plHyi2jm6wON7rX4nvKGKycdMJFf6iNBo6bazJ3uYHg
         z2Eo1ni05+ZzOUPSultvyfgUxfmYmdmyEnpZ5DqxqBMmx4K/g/CxA2TYBdOXtfcDNVPP
         SjaEj5mq+06V/e2G6NRyHL6sXiHmmNTKh4q9KKexNMfDmsd5fFIwwTT3E3Iea4wLDRYK
         9RZw==
X-Forwarded-Encrypted: i=1; AJvYcCUYV89Z7Fw7cqqaRsTCvGExbHsKgexrQ8n3NKe6eCxGYpZ10X1OH9uTrRE4Pij2SikDtowqMJ8Afko=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy8TNNsDXPM7QMFxRDGSz6x4fxQhNbhdaij8+yhTJ1AOv/OfgU2
	JE1HHsbNwVhcxfVb1CuJIy0gM6BiTew2KiLVpirEcZOa8jfpvwg9YTZr3F1pEDUIjA==
X-Gm-Gg: AZuq6aKb15kmSmEa/yO4H+BY3WBA9BbewuU2YetoD/aG8vKdFThIQzeUa5RdLO2yb/8
	xzd3yoQghNneYWyxxpEOq9KA+KW5xukI+nKu3IE1yOXhU8rjazeVnXdxQedp18P4jqOSOw5F6nR
	wdHsCPW9zDcgyDpQRM4ky++LknbeANVE/t4k+6ck6ZNnzmaOMcjT+lTUtUPFE1lWQV6EmZP5g86
	WSTqsqt78fNtLnDmcC+gXc8kKy3Pl5urHhclf01DChbhTp7smqDGjy+qQxK+7g9CS01WjUg/cO8
	lraQ1HGelJaBNOo4dRKERw41TJXils4ldV7S7m58Mhb3jaMLhrOT6LTvOh37L6Sne2TGF2NF9Z/
	F6iNU2pYzCdQLrOK/jowPeeuwr/YFd45rCeO00WBCZXrzd2EdDyY/Psu+FwV6fur2w1MN3Fufte
	wqQf5jXz3Tn5w6z/9/7O+rMvnVtwTmAOsvzeKrFqWPI7zXa7TVrmTb9/kHTDXEnJNruyDQD5gMV
	ZxRHu1FZJLYhbw=
X-Received: by 2002:a5d:64e3:0:b0:431:c06:bc82 with SMTP id ffacd0b85a97d-43779e4e6bdmr11781480f8f.12.1770817394847;
        Wed, 11 Feb 2026 05:43:14 -0800 (PST)
Message-ID: <ab881c05-ffe1-499e-af3b-ba8c77c3c599@suse.com>
Date: Wed, 11 Feb 2026 14:43:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] xen/tools: remove usages of `stat -s` in
 check-endbr.sh
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <20260211104638.7938-1-roger.pau@citrix.com>
 <20260211104638.7938-3-roger.pau@citrix.com>
 <35bdb10b-d39d-4e67-9ed8-c0b85ca5bd54@suse.com> <aYx064WIMMNmLAza@Mac.lan>
 <3f1e043f-2cd1-43a3-9ec9-9323c133d8d1@suse.com> <aYyFV9sIw_cAvruJ@Mac.lan>
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
In-Reply-To: <aYyFV9sIw_cAvruJ@Mac.lan>
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
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: AB752124E0B
X-Rspamd-Action: no action

On 11.02.2026 14:34, Roger Pau Monné wrote:
> On Wed, Feb 11, 2026 at 02:07:13PM +0100, Jan Beulich wrote:
>> On 11.02.2026 13:24, Roger Pau Monné wrote:
>>> On Wed, Feb 11, 2026 at 12:40:58PM +0100, Jan Beulich wrote:
>>>> On 11.02.2026 11:46, Roger Pau Monne wrote:
>>>>> --- a/xen/tools/check-endbr.sh
>>>>> +++ b/xen/tools/check-endbr.sh
>>>>> @@ -92,14 +92,15 @@ ${OBJDUMP} -j .text $1 -d -w | grep '	endbr64 *$' | cut -f 1 -d ':' > $VALID &
>>>>>  #    check nevertheless.
>>>>>  #
>>>>>  eval $(${OBJDUMP} -j .text $1 -h |
>>>>> -    $AWK '$2 == ".text" {printf "vma_hi=%s\nvma_lo=%s\n", substr($4, 1, 9), substr($4, 10, 16)}')
>>>>> +    $AWK '$2 == ".text" {printf "bin_sz=%s\nvma_hi=%s\nvma_lo=%s\n", "0x" $3, substr($4, 1, 9), substr($4, 10, 16)}')
>>>>>  
>>>>> -${OBJCOPY} -j .text $1 -O binary $TEXT_BIN
>>>>> -
>>>>> -bin_sz=$(stat -c '%s' $TEXT_BIN)
>>>>> +# Convert objdump hex reported .text size to decimal
>>>>> +bin_sz=$(printf %u $bin_sz)
>>>>
>>>> (Alternatively without this line, but ...
>>>>
>>>>>  [ "$bin_sz" -ge $(((1 << 28) - $vma_lo)) ] &&
>>>>
>>>> [ "$(($bin_sz))" -ge $(((1 << 28) - $vma_lo)) ] &&
>>>>
>>>> ?)
>>>
>>> Isn't that bash-specific functionality?  The script interpreter is set
>>> as /bin/sh.
>>
>> I, too, would have thought so, but then the rhs of the -ge already used $((...)).
> 
> OK, yes, I didn't realize those existing usages.  Now that I look at
> it it does seem to have a bunch of other bashisms, for example
> parameter expansion.

Then perhaps in another patch we want to properly mark it as a bash script.

Jan

