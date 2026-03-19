Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePW3KqT+u2mzqwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 14:48:20 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 154AB2CC2D1
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 14:48:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257227.1551659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3DjL-0005Eh-Fr; Thu, 19 Mar 2026 13:48:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257227.1551659; Thu, 19 Mar 2026 13:48:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3DjL-0005C1-DH; Thu, 19 Mar 2026 13:48:07 +0000
Received: by outflank-mailman (input) for mailman id 1257227;
 Thu, 19 Mar 2026 13:48:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8LP9=BT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w3DjJ-0005Bt-QY
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 13:48:05 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 409c2db4-239a-11f1-b164-2bf370ae4941;
 Thu, 19 Mar 2026 14:48:04 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-486fda2a389so1813895e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Mar 2026 06:48:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b51892244sm17861239f8f.22.2026.03.19.06.48.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Mar 2026 06:48:03 -0700 (PDT)
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
X-Inumbo-ID: 409c2db4-239a-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773928084; x=1774532884; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=L5A8Yi8Xx2/O7DfoLjNaDgBerAqER/ekqs/fmTnOfj8=;
        b=P/JovRZlSWdAjW+Go3LIov8a/Beh7trn6OP4EkBS1P7Bj0qax6rpbQmdaLVdFGyLdI
         qRudJ274Oj/tPaVrediM4FuCWVfG95CjPkLLBXA8OTJ9Er3JD+jOzOPrH+lZshhCJ+ms
         pZKqiiMXFFriFE+tqhdJBL+Uu6lo8pQQZzum3c8o84WFqBHLlq4zCU4AGCrwbSxglEA5
         RW8OyRWTfNf6/FNjoXMZboLTWfU2QpYtx02B/o+37CDt56Jpkl6Hjx7JMzkn9lpD15ha
         6Il5y93LME7ZBqfPGdTiEuPjNIwcOCkCiXO/qG9DD/jWqtLCjTOLdQ8eynSSyJBfqt6e
         ezDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773928084; x=1774532884;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5A8Yi8Xx2/O7DfoLjNaDgBerAqER/ekqs/fmTnOfj8=;
        b=is6XHKRwrY2tXBCXGYZjOMEyGZ4nFCAzhEUSH1Q9VfdBjQTm0lH5zTKUXZLxnkfxGS
         UU03WZ9YUVoVQVh4ZrQNlhTqv2ZVxGGbWeMZ+KW8JDzCi4y+AM7MLOzUYMdqIGgZIWmu
         Zwgd2ioiG5vvuC5JCrCUlZDaHK7HnEO/Oq7yBBWZLRIItOBgr0gnIfbBvlYLayy1cYTv
         aU3oqG9d5IbmBPjApmxagj9zTvw5q5SPY3iQwFkqwBbJtcN692+eyChmRGFUVPndChSN
         MZZQfnPHYFGmTwZTXMKUbgWwCe+l9osmSt66o02XEcd558QunE52qba1Gzp8m/FjcGx4
         osMg==
X-Forwarded-Encrypted: i=1; AJvYcCVfsdGtUqw2SW/g5MDQP66SNkCyu2NRi4xNfSk64UzldgcGzbd6odVZHwMzdas1P0rrCjF0KmedAI4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyt8dghnOFsGWakgDd2zguYezaRE10cylNd+pLsPVdUn+kwakJM
	i3VJ2RbKD517tmQ3Uvp4QlBiR4g18K5WcozBICmGODL/zgXvV9iar9IWVsVASoyMFQ==
X-Gm-Gg: ATEYQzwTLXVmKD+aM6kKvgm6bb4YmQ92CQGQQqHyDFdCEJWhmF/2ZE46/UZwjC0BBZk
	YTyQ0ONdUiJri2oTosEL1rpXsBIoV/5/l+olCRvgBuM8exoYRAf9enLClR9MXoOs+vzEPvoKsN0
	/JOwvHzZMfEyLSDgM1MkyM9PkZRS6UidltXAKk00alxCs2discEaQEI2FSUepwygJpK+5bdboMt
	HO7FKFv813h8yDKYwUCv+Z+3+Rd9dOSSUqKqXe96FckqCWSgXMRWnx/SxYOZ0NceX6IwgnOtYeg
	V0hARwoVy0ZjOnLvZoyy1E7khQQ+qXYw/W0zGbZ/+zpZYZM5MeXAlN89ha745GosGA1BcAo1TT6
	fBkP76FwyL/vZWJp8sLKnGCZoEsSf6F8umjqE0nU6vxrRKWEcFEk3EsQUF7IfvyfFRk7EcP8Yr4
	59og4VPVAkwS+aZCD/42WjeXLoQ2pzO271qOrKCP99DfEezSg0CuFAQ0sLO7NB+culW5Z6Gg5dr
	soO2BkWGwk/FeM=
X-Received: by 2002:a05:600c:b8a:b0:485:34b3:8589 with SMTP id 5b1f17b1804b1-486f4570873mr127939915e9.31.1773928083646;
        Thu, 19 Mar 2026 06:48:03 -0700 (PDT)
Message-ID: <929c9e0e-c465-447d-ba65-30053051a88e@suse.com>
Date: Thu, 19 Mar 2026 14:48:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] install.sh: Preserve directory symlinks
To: Thierry Escande <thierry.escande@vates.tech>
Cc: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20260313172456.871518-1-thierry.escande@vates.tech>
 <7ee208c4-1f83-4bec-86db-bae22bd2040c@suse.com>
 <3bc905c5-a0e5-4ca0-96f4-eb6bb73b2361@vates.tech>
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
In-Reply-To: <3bc905c5-a0e5-4ca0-96f4-eb6bb73b2361@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[3];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 154AB2CC2D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19.03.2026 14:26, Thierry Escande wrote:
> 
> 
> On 3/19/26 10:31, Jan Beulich wrote:
>> On 13.03.2026 18:25, Thierry Escande wrote:
>>> In various distros (i.e. Debian) some folders like /lib or /var/run are
>>> symlinks. Using the tar option --keep-directory-symlink preserves these
>>> symlinks.
>>>
>>> Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
>>> ---
>>>  install.sh | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/install.sh b/install.sh
>>> index 3e11c4d46f..5d0b7a4933 100644
>>> --- a/install.sh
>>> +++ b/install.sh
>>> @@ -27,7 +27,7 @@ tmp="`mktemp -d`"
>>>  echo "Installing Xen from '$src' to '$dst'..."
>>>  (cd $src; tar -cf - * ) | tar -C "$tmp" -xf -
>>>  
>>> -(cd $tmp; tar -cf - *) | tar --no-same-owner -C "$dst" -xf -
>>> +(cd $tmp; tar -cf - *) | tar --no-same-owner -C "$dst" --keep-directory-symlink -xf -
>>
>> How compatible (between flavors of tar as well as between versions of GNU
>> tar) is use of this option?
> 
> It's supported by GNU tar since version 1.27 (from ~12 years ago) but it
> seems to be the only implementation that supports it. BSD and busybox
> don't support it. I didn't check for other implementations.
> 
> I can add a flavor/version check if that makes sense.

Possibly. One question then is what the behavior was prior to that option
having been introduced.

Jan

