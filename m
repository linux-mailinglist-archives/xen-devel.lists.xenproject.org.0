Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJoPNRs/oWnsrQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Feb 2026 07:52:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 396141B384D
	for <lists+xen-devel@lfdr.de>; Fri, 27 Feb 2026 07:52:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1242458.1542900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvrgg-0006gs-Nu; Fri, 27 Feb 2026 06:50:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1242458.1542900; Fri, 27 Feb 2026 06:50:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvrgg-0006fA-K4; Fri, 27 Feb 2026 06:50:58 +0000
Received: by outflank-mailman (input) for mailman id 1242458;
 Fri, 27 Feb 2026 06:50:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WIjz=A7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vvrgf-0006f4-Vb
 for xen-devel@lists.xenproject.org; Fri, 27 Feb 2026 06:50:58 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa453960-13a8-11f1-b164-2bf370ae4941;
 Fri, 27 Feb 2026 07:50:56 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-4398913af88so1439959f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Feb 2026 22:50:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483c3b89c99sm86296875e9.15.2026.02.26.22.50.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Feb 2026 22:50:54 -0800 (PST)
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
X-Inumbo-ID: aa453960-13a8-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772175055; x=1772779855; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=a6SxXPmOTMM4Rh4av1xwN5jyAYhCLEfe1b/ppRAwbEQ=;
        b=LxpEWh+zkt3ggyDLRvivZJvldxfZAljXVYG+TVS4Y+FuuQGEvic2Z1NzGvScnHQy+i
         8/KyFV9lCpS04Qj+IsbAYMP1H5vNX6UHTgDTQwwx1CM+10n1tCP1H4A5EaMjAkLO75RB
         VDyJjzUvu6XHsD89uP9/qnwShbuas7nZ9crPHArfcZ6BG7bJg85iWzldSBlbY2uVLkg5
         oa3XuI8DMt2hrFJ30IemBXaXBF6bpu3/naA1QMBJJtbn1Hyq4uvXhO9B2PnmRw7hAcvO
         4+yKTw7WaOffxSvuH1weNojmrTQTqnx1IyZkfmDxQqO2M+7aTg9yJPG9weCipuQKR86M
         P7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772175055; x=1772779855;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a6SxXPmOTMM4Rh4av1xwN5jyAYhCLEfe1b/ppRAwbEQ=;
        b=ukNLo/XdkZsAWYzZJPrZxvJ243KFSbbn0xUoU93h9HYkBcdpOBRXfafVQkocV0yHkq
         ofI/K6Om7p+p7uvagEM9aNT/bC4HTgdt55NlLlUw6VWDsvcvZv5vV8ldVHPSu6JUcuS1
         5y1sl/92uQyN7bFC3lsHOkT/Y0z87WmG6fCVgEpwVdpOZSuPn1OgsyRQu6cidhgv6uA7
         gQwNtR1ol8Z+jb4bd4deF+U3jyK0zJhCDTHfzpUFYd32GOLZDD7uWB/sDbIr8ZdOK0/m
         SE/b28Bjvuvh/9deJp92h63dGEh42vYZLhH5YtaRXKpFGrETusM/I8OT4jnJW8uOaHD3
         CuQg==
X-Forwarded-Encrypted: i=1; AJvYcCWzvlGqN5Kwjmw0Oj4UTFPpj6IpPV3tiE7mwKOCQSHdS4qPj9Li/Dr2bk3zlfFeRfM0BBo1ZwKkHQs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzCJuStadioQKHi6f1sieajzegkHG7Tjfre4JqjiRV/WbspMJXI
	ySFKf55YX1X9s10CHeE2K/4ZMkCWtk1SrklBIIqr/EBZJ9n7fqjXum9BFTcIvryzv1yyC1j1ZVe
	K5K8=
X-Gm-Gg: ATEYQzy9gNc8tYQZK6O5jrDxGswQnd+cPTchRxOw68gI32G8jMzUeivAguK5RXb0ypE
	XEjdjJvNkOX+REFBsvTfaoOvooEoWBqL/Lia0jlrUjQc/EENo2TXI4nDI67hvCxIACFIeqpQwcA
	/iABVY0LYGLeg/MpnkqRvdP9jBPTxzsTcUHY5WDDhtZJQaY7YmUEFk6EG4W/yGbEejna/gex3OF
	406oFTjUysGUHd1zeL6Jgk0z5wBNJ+ixwV6ngkTFF1RlN5zqtP7+p50skZraYS9r9dyxsYIG3fc
	NjXBZkYKoXt1KcYccvycDLfXIBX3EkFBie2HBrGCtg05kJEvI92DSf7ijMVS3SD7alsdD8kpird
	VnLJmLmiHMELFbrELHzGdALFjAoZKIVrfUTna5Mt0RNarM5LwHJjB9doVgbSAwC4kq49bvVk+bq
	pfAOV//ccXlr2rYKFeut1F+r4IO8QEWFFHPeXge2HHccPcA1sAMHI6vNRAUe3s2tmqK+RzrQEl2
	J+J8IpA8j+mfbg=
X-Received: by 2002:a05:600c:3b99:b0:483:71f7:2796 with SMTP id 5b1f17b1804b1-483c9b9d99cmr24340165e9.10.1772175055446;
        Thu, 26 Feb 2026 22:50:55 -0800 (PST)
Message-ID: <a4345272-872c-4967-92e1-bbf74bf65ac1@suse.com>
Date: Fri, 27 Feb 2026 07:50:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Arm: device.c is init-only when OVERLAY_DTB=n
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c50219c1-5a23-46d0-bbe3-ab4a871a935b@suse.com>
 <53b251a1-948d-4c9c-ba0c-6f4fd99b1d6a@citrix.com>
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
In-Reply-To: <53b251a1-948d-4c9c-ba0c-6f4fd99b1d6a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:volodymyr_babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
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
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 396141B384D
X-Rspamd-Action: no action

On 26.02.2026 18:14, Andrew Cooper wrote:
> On 26/02/2026 4:28 pm, Jan Beulich wrote:
>> --- a/xen/arch/arm/Makefile
>> +++ b/xen/arch/arm/Makefile
>> @@ -15,7 +15,9 @@ obj-$(CONFIG_HAS_ALTERNATIVE) += alterna
>>  obj-y += cpuerrata.o
>>  obj-y += cpufeature.o
>>  obj-y += decode.o
>> -obj-y += device.o
>> +device-y := device.init.o
>> +device-$(CONFIG_OVERLAY_DTB) := device.o
>> +obj-y += $(device-y)
> 
> I know we've argued over this before and not come to a conclusion, but I
> still firmly believe this to be an anti-pattern we should expunge.
> 
> obj-y += $(if $(CONFIG_OVERLAY_DTB),device.o,device.init.o)

Whereas I think this one (in its adjusted form to really only accept 'y')
is, firmly believing that the "lists everywhere" approach is the more
readable and, more importantly, more scalable one. The form you suggest
quickly gets to its limits when multiple CONFIG_* need dealing with.

Jan

