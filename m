Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AD3fKT9/jGl9pwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 14:08:15 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 068F2124A6B
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 14:08:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227604.1533994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq9w8-0000ML-Vn; Wed, 11 Feb 2026 13:07:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227604.1533994; Wed, 11 Feb 2026 13:07:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq9w8-0000KQ-SC; Wed, 11 Feb 2026 13:07:20 +0000
Received: by outflank-mailman (input) for mailman id 1227604;
 Wed, 11 Feb 2026 13:07:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Hh8=AP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vq9w6-0000KK-Uu
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 13:07:18 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96af9854-074a-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Feb 2026 14:07:16 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso19113015e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 05:07:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835d99e194sm35334155e9.8.2026.02.11.05.07.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Feb 2026 05:07:15 -0800 (PST)
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
X-Inumbo-ID: 96af9854-074a-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770815236; x=1771420036; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eSHBXr8GkYYfTsEYs/TG8FluGNQdUJqEV4XOmrLk/ws=;
        b=g6Y5QgqSwmvb6gLGS8Zg9VPUnVSo2KaTR+qVdkdYm47/qc1Ixz4xpHkBxtg9iHaLIJ
         nY52BToFDXiN0GmBXGJMR2whp8YcBK9dMr/FKizPibx8fVeh52uUVDg0wXbBEBZYTb5M
         xtrWa1TVdVlY9SdeUSsqD4GQa2S1znNTALCym8hrRw22v8j0WiWqTVZAeQ5uEKTPOLpK
         jj6wVSdu6hBbnM7HRf9uPxrMcHHceOBMOTLXPg5CXPeR2mPfI4FWQU16dklfjUAizNr/
         a4kYpQhluS/TybN8t9iHItk0vLfowILWRW2Rsl60ETPeQ/LuusqACLpSanfmz9ni53Dl
         yiiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770815236; x=1771420036;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSHBXr8GkYYfTsEYs/TG8FluGNQdUJqEV4XOmrLk/ws=;
        b=kp5i3KTDnjLK28qxfTU8wwZOXl+TYeU31x5l+lqKJPBcoNc4OhzSXGCAdP4obBtAJZ
         6QombjvKCOzpgm8fzlo5/us1c0EzsZNGP9ufLZqSI67Qfgd959JEGFL8zDI0fAz2uEmZ
         O5cdbnlIqtvGVmXzvZCob1QdxsFA7YA72xfsHbvynYC4q9gYNjx6Dd6oG6vYRj0yttXj
         koNfs9Y1Ux1T8/UQ0knnpSqzo26Xm90JjSUkiEDJ5S1f/hLX/saw2rbnhxK4AiyJ0WA0
         58PHuyZNmkLiytV+RSYQZLQzApfl7n5K6+rKrEDKQWG9cErPKJX6vITugkLXNDslrnOe
         M+mA==
X-Forwarded-Encrypted: i=1; AJvYcCXqK9yqJETNCpiUlJ+Ofi8AyCDtC05C0CSx+HjjfXDaDIPK+Hgnnb5yFqf4ClH0ZQEAt4k8aPlJJJM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzyGYDpfzZjvduzhlUeuSsyIq/nMuMGAjkHgf0s5z/u2op3Z7rz
	mwccPD6PBKRqW+PbkykOfTrOcQsbYcoOjKXVQmTWjXCM+APX4yNiTza0fcCkNSbfXQ==
X-Gm-Gg: AZuq6aJKcVRDN8c74Fb3d2NIt3FDoy4IxoaeVAuWjFUlSChr4l0t7p/DvP967iFokmN
	H9pQoTQMJq+3voQ6ThPrTcUy2/ZkBbo60+ec0wephLRWmMYxfKjWgU/CMY20+0ofupPRfn69epR
	Mfshg7Xw2vb/qXsd+JBD2Xe9aR1cXQqmv9LoI4QHDc84MvVI4QuMzx5v3lPrDE7+n5phaiWlQNX
	lEs5Nwh2H+kbYk4W+Ok499fQmid7KVrCKt3kfO2YmiaDzz/nqCB4E5groKVjyttgTfMafcyzhO8
	gI1zFBlE2sVpwxovEMdvbF7SK8Hum4j/E7qSgf6WKmUifw3FcKgB+Gyz8YN/PLvBO+72vtvoHE4
	bH2IDD+UuDLvspYHZd7T0EqZsl8Gaah5fq2T8a20lpyQ2+3GTzXOQNc+cabQnmFPddnmsW2csHL
	Mh2ooJf1FDbX7fmXQKXMrFse6isHzTD5YXkss1L6Ud1/ZHbIUOUVejjl0Xoo4ORXhdP2wG+aF9X
	PqncWWKLnKBweY=
X-Received: by 2002:a05:600c:3b23:b0:47f:8c05:786b with SMTP id 5b1f17b1804b1-4832021eae9mr256478535e9.28.1770815235550;
        Wed, 11 Feb 2026 05:07:15 -0800 (PST)
Message-ID: <3f1e043f-2cd1-43a3-9ec9-9323c133d8d1@suse.com>
Date: Wed, 11 Feb 2026 14:07:13 +0100
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
In-Reply-To: <aYx064WIMMNmLAza@Mac.lan>
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 068F2124A6B
X-Rspamd-Action: no action

On 11.02.2026 13:24, Roger Pau Monné wrote:
> On Wed, Feb 11, 2026 at 12:40:58PM +0100, Jan Beulich wrote:
>> On 11.02.2026 11:46, Roger Pau Monne wrote:
>>> --- a/xen/tools/check-endbr.sh
>>> +++ b/xen/tools/check-endbr.sh
>>> @@ -92,14 +92,15 @@ ${OBJDUMP} -j .text $1 -d -w | grep '	endbr64 *$' | cut -f 1 -d ':' > $VALID &
>>>  #    check nevertheless.
>>>  #
>>>  eval $(${OBJDUMP} -j .text $1 -h |
>>> -    $AWK '$2 == ".text" {printf "vma_hi=%s\nvma_lo=%s\n", substr($4, 1, 9), substr($4, 10, 16)}')
>>> +    $AWK '$2 == ".text" {printf "bin_sz=%s\nvma_hi=%s\nvma_lo=%s\n", "0x" $3, substr($4, 1, 9), substr($4, 10, 16)}')
>>>  
>>> -${OBJCOPY} -j .text $1 -O binary $TEXT_BIN
>>> -
>>> -bin_sz=$(stat -c '%s' $TEXT_BIN)
>>> +# Convert objdump hex reported .text size to decimal
>>> +bin_sz=$(printf %u $bin_sz)
>>
>> (Alternatively without this line, but ...
>>
>>>  [ "$bin_sz" -ge $(((1 << 28) - $vma_lo)) ] &&
>>
>> [ "$(($bin_sz))" -ge $(((1 << 28) - $vma_lo)) ] &&
>>
>> ?)
> 
> Isn't that bash-specific functionality?  The script interpreter is set
> as /bin/sh.

I, too, would have thought so, but then the rhs of the -ge already used $((...)).

Jan

