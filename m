Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mI0dJmkZe2lCBQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 09:25:13 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3CDAD787
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 09:25:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216152.1526109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlNKk-0002zU-41; Thu, 29 Jan 2026 08:24:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216152.1526109; Thu, 29 Jan 2026 08:24:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlNKj-0002wO-WE; Thu, 29 Jan 2026 08:24:58 +0000
Received: by outflank-mailman (input) for mailman id 1216152;
 Thu, 29 Jan 2026 08:24:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g1vo=AC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vlNKj-0002vn-B4
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 08:24:57 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe5d614a-fceb-11f0-b160-2bf370ae4941;
 Thu, 29 Jan 2026 09:24:56 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-430f3ef2d37so568093f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jan 2026 00:24:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e132303fsm12584702f8f.36.2026.01.29.00.24.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jan 2026 00:24:55 -0800 (PST)
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
X-Inumbo-ID: fe5d614a-fceb-11f0-b160-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769675096; x=1770279896; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s4DyzCok7BdHy5pEqU9S+8pEdv71c6muAcIG7r8DN4U=;
        b=Mi+G4KIoEdcX1n+yFFezdBNVhH6kDSr1cliizq1ukxLnfrGEElJ+4Mm3jZjD+v4dtk
         3b/RnAk0ZtTJz2VotM4uabEfq6rGk5whGLrL6kzQzoJhhwiCz+dw8Ak36QKyI6bXs44e
         WUfSWwO9MKCnyvzAwJo5P8Y3TP3u2aTNK/pps+WX+4CKh87rXGun2NFPlmFiP3R3B04z
         5LXrPOUNob48eVOXcHPnLSMk4vfW6thnvY3z8b8ISFeZJbf9kCOVuj7X0Ku8s/9DdMUe
         ApyNZ7uWbCPRSpggR3qa7NnV+A1BJXaNhEtc9XsjjBdUSLn9zKqWiJa7yz6vseHTNsnU
         qfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769675096; x=1770279896;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s4DyzCok7BdHy5pEqU9S+8pEdv71c6muAcIG7r8DN4U=;
        b=oRMowSRni0lVMoHfEzM60ckrA6zahznQXdn7hm/Ocw+LENtRuvZRkrtF0Y9BWW1LS0
         tnBE9STVx3w4RMAKw/+7JEmoIp1cvPaMY5eT5YCTVUIJQ1d9owTEM6kuySgy2zCw1uV5
         NhFOOf1eUsn+o7lasoNTWtBRgJ8K4tR1cxDXQpExb0G8M45ekiM1NZ9aiz9T9AVbRvNf
         Vs5S8bfgsGutL95+RgOVZ+zdwBZGnqOq9S336IHrKedS541839q9ldI7evfdZqLTUa/2
         Kun/bM/MGPn1U89SW6Z33A9Qprimuz0sR4krj0JploufWvHW301N8FBom5s620Y/6KIE
         vYOg==
X-Forwarded-Encrypted: i=1; AJvYcCXHmJXDEOlYP7wNRJn2JyIiDf6YA1wPKlivXx8IGK4UhQ4zdpq4P43Em802CI19PZVgAEmm29cCHuY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwGs8DcYbPiDLfdg9i6ru7fZB/YjDJb4GBH7bO/wJPtFNsvv5iI
	AhC/KolHF/BFJqLUnQuUWIfE512KeJ8CJywWdndbvEmXQKPF/2WPAqHr9J+cFC5c1Q==
X-Gm-Gg: AZuq6aLcsPWgiOIcUWTC2ccXOFTMqW6px8MPeVCse3/q5mdd7WuA6YIA38Q0x1LCgJA
	090zfwh15Z3BnelM6gQsbFPuiddNioUwDCY/OQ7Fr+8JO7wbjTfht8GL+LjXjEU9/tq+JQV9QgJ
	FXteC5u1LovCKIreVHZllK4fD+OAbzhyS1krYv2CnzidwkQRTqYWyTSiIYy5yrIsam0DZPzx5u/
	9l/RhkHQeiZ2SjLHWgzo9lMWZrmmSe+T8sM//LWjHFPFw/6Q+87rcnp3ug8DLNwn0R/mkR/hxSj
	66gA0HuLt/2C7kRV6Ov7O6VQj4uCO1dfEypq7EHyj+2lplDaN/T8Ms6+akQupP1RJMPH/bL0J5E
	q2rWjh2ce6JcjX8TPSxFMfwntFD3v/+Q3b+w8lOqkIPc7HN+LeZ/YCYRbwKov7tKt9gjeH9194t
	FQ2ypf2Glhwa2Vp26RmtO6/iDzefSps+KWjrUWUfAfZ3Ov6TEaPsQQDeq+rNuhaNYorwvU39BzN
	iY=
X-Received: by 2002:a05:6000:184e:b0:431:907:f324 with SMTP id ffacd0b85a97d-435dd1da001mr10835018f8f.61.1769675095883;
        Thu, 29 Jan 2026 00:24:55 -0800 (PST)
Message-ID: <2044f927-6d9f-4c7f-9e47-6e4c6dbb2fcd@suse.com>
Date: Thu, 29 Jan 2026 09:24:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] xen/console: handle multiple domains using
 console_io hypercalls
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 grygorii_strashko@epam.com, anthony.perard@vates.tech, michal.orzel@amd.com,
 julien@xen.org, roger.pau@citrix.com, jason.andryuk@amd.com,
 victorm.lira@amd.com, andrew.cooper3@citrix.com,
 xen-devel@lists.xenproject.org, Daniel Smith <dpsmith@apertussolutions.com>
References: <alpine.DEB.2.22.394.2601221704110.7192@ubuntu-linux-20-04-desktop>
 <20260123010640.1194863-1-stefano.stabellini@amd.com>
 <ebc50459-b6f8-4827-b326-edda5f0f67d7@suse.com>
 <alpine.DEB.2.22.394.2601281807290.2238666@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2601281807290.2238666@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
	FORGED_RECIPIENTS(0.00)[m:sstabellini@kernel.org,m:stefano.stabellini@amd.com,m:grygorii_strashko@epam.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:victorm.lira@amd.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0A3CDAD787
X-Rspamd-Action: no action

On 29.01.2026 03:42, Stefano Stabellini wrote:
> On Wed, 28 Jan 2026, Jan Beulich wrote:
>> On 23.01.2026 02:06, Stefano Stabellini wrote:
>>> @@ -742,17 +758,36 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
>>>          if ( copy_from_guest(kbuf, buffer, kcount) )
>>>              return -EFAULT;
>>>  
>>> -        if ( is_hardware_domain(cd) )
>>> +        /*
>>> +         * Take both cons->lock and console_lock:
>>> +         * - cons->lock protects cons->buf and cons->idx
>>> +         * - console_lock protects console_send and is_focus_domain
>>> +         *   checks
>>> +         *
>>> +         * The order must be respected. guest_printk takes the
>>> +         * console_lock so it is important that cons->lock is taken
>>> +         * first.
>>> +         */
>>> +        spin_lock(&cons->lock);
>>> +        nrspin_lock_irq(&console_lock);
>>> +        if ( is_focus_domain(cd) )
>>
>> Why would any of the domains possibly being permitted to be "focus" suddenly
>> gain direct access here? Full access in do_console_io() is still prevented by
>> the XSM check there, afaict. Cc-ing Daniel, as it's not quite clear to me
>> whether to introduce another XSM check here, whether to check ->is_console
>> directly, or yet something else.
> 
> The XSM check still happens first in do_console_io() via
> xsm_console_io(XSM_OTHER, current->domain, cmd), which validates that
> the domain has permission to use console_io hypercalls. The focus check
> is an additional restriction that only allows reading when the domain
> has focus: it doesn't grant new permissions. Dom0less domains with
> input_allowed = true are already permitted by XSM policy to use
> console_io;

Are they? I don't see any XSM or Flask code checking that flag. What the
dummy xsm_console_io() checks is ->is_console.

However, what indeed I didn't pay attention to when writing the original
comment is that guest_console_write() has only a single caller,
do_console_io(). So there's no concern in this regard here as long as no
new caller appears.

Jan

