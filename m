Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPEtIZPFeWl0zAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 09:15:15 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC4E9E1AC
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 09:15:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215242.1525453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl0hc-0008Pt-2s; Wed, 28 Jan 2026 08:15:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215242.1525453; Wed, 28 Jan 2026 08:15:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl0hc-0008NZ-06; Wed, 28 Jan 2026 08:15:04 +0000
Received: by outflank-mailman (input) for mailman id 1215242;
 Wed, 28 Jan 2026 08:15:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3VuQ=AB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vl0ha-0008NT-9J
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 08:15:02 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e8c8d28-fc21-11f0-9ccf-f158ae23cfc8;
 Wed, 28 Jan 2026 09:14:56 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-432d2c7a8b9so6269877f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 28 Jan 2026 00:14:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10ee078sm5173360f8f.16.2026.01.28.00.14.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jan 2026 00:14:55 -0800 (PST)
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
X-Inumbo-ID: 6e8c8d28-fc21-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769588096; x=1770192896; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JLPssjh+92Qd8vVx/+o3HM7WxMrt9XMrfIVt8FGZzS0=;
        b=NW/N49nRf5sWSulsrmWL+DHJAUtfZkgEf2RSc+1eamIPXU76O2iQJYKJxFAmLvkpul
         jZ4HuTQ2WesDzQDov+k8QduoyIopp0P6ZS4TYs8H/sLNVQvDAq1ZgLmuwuAxRZRmSVEo
         I6VgOBxGerVApmQUO3FN2cuMFGvVsBb0sMx1ioIgxYl2rj6MyCPhCPKTfV14HKP8kZZx
         811DfWX3r3tZ4BexURiVhlIVXpHQ8xWP7OooGvom9q+69T8nC9g9+aoLfdpf6UYZ4hxo
         KFD3O76+qW8+umMCSdvl1Sj32vCXljDqBdzUDjIrbeVmsSQvyG6LNBvZalJv0DgLrWsc
         /lmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769588096; x=1770192896;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JLPssjh+92Qd8vVx/+o3HM7WxMrt9XMrfIVt8FGZzS0=;
        b=wzruKrf1jueczdv8w2MKaKYyDO4F/Yn4YUDKtQxEVWJRssHGUdQf0TfVtke8iPnHK5
         9JOpFtrkQ4TZXJqO29TWCp0+Ej57muWeY6N14cHUgJRwEyd1QAjxhUwZzF7iVfRNAr1Z
         nRXB8I8vGGlRixAYDxYoJmnZsMsC1tzcXcou5oXhqsAum2WZvHwIhH3VoK2x393SpLmj
         ISTn8NV2wZs4Pbtm6J3sNIJXCmD7hsFOuCsgFF+bs/+eqFE7+PYjRBgEyd8WTakI+egh
         cYQY0avFknhmO4B7UEUwcaIVfVETuUGn/cbxI5RQX5e/ADOqobGfsgJ+qRR1+Gob3P+H
         7gtg==
X-Forwarded-Encrypted: i=1; AJvYcCVbyvPZgSF8IhjyNuYOMi+UFCzTXcR9YPnLMgDjeUkStqc6QoH6ikEhoOqr5gd4e+ffUrhJHJxc8T8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzqn26AfhTp444XE2baJh/jrtMid/YRs1qU1IilibCGy/YXK+ir
	93u6dmnROtNY2ZlAaIcOzbqo52/twgahkBc+BGPgbCHP8D0GE0A5WPEM5BtF31fjLQ==
X-Gm-Gg: AZuq6aJeptPlh9CBQYYiK0Xx4xHc8ctguCEFWEtKmskDqpTqdDTO+p0Eh6qXG8hIKmq
	Vr1tWg9GAWFTCIJ++CVZZ3jVNQhvPYeZwFTeX/u+v018do/YOTRBqQU/sWXBIIlbcH+4kBVnlY6
	/Z13yMs9UytqxhPn+LDUULQoNBo9ZME50x4zFmIXCgTeO9MWsJCHDMHhhUDK2N41DN+Tjmv/ui7
	a9fdiN09mmX953URRy/o2l3j1oONnOGOxkgD3oEmagZZHtZ2Cw+d15LZNF2F+PjDw5LfR7VnTdb
	NnkD+nhmjpREKqOqQERF/PfV/J/HCJJlunHvhvZhrBf+eMdEcD/5tRvjvDB3sBNZ6Z/LTbWtwvW
	zzoAxxvoMunB9ZHA6BVRolWjEyUBaS1/OV2vfnMFfUJtto3Mg3b/0XL6uyFmnAlLTn8ib1zf9kN
	1b0bwLHCKCjNivOhaAI4YrclnCiIQkGCxz62Sc1qvFksYtlwMR5aaG2nPBVcBrAtDUtIaJe1rqI
	vobmHHizjhTSg==
X-Received: by 2002:a05:6000:1ac6:b0:435:9223:bfd6 with SMTP id ffacd0b85a97d-435dd06c55emr6160203f8f.25.1769588096277;
        Wed, 28 Jan 2026 00:14:56 -0800 (PST)
Message-ID: <83d79978-b8fc-49a3-9016-df874a507bba@suse.com>
Date: Wed, 28 Jan 2026 09:14:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/treewide: More typeof() -> auto conversions
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260127101841.2213758-1-andrew.cooper3@citrix.com>
 <18aee854-2e08-4a45-9df7-1c622136afde@suse.com>
 <b9202688-5bff-44b3-bb10-24d05520377a@citrix.com>
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
In-Reply-To: <b9202688-5bff-44b3-bb10-24d05520377a@citrix.com>
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
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: ADC4E9E1AC
X-Rspamd-Action: no action

On 27.01.2026 18:10, Andrew Cooper wrote:
> On 27/01/2026 5:01 pm, Jan Beulich wrote:
>> On 27.01.2026 11:18, Andrew Cooper wrote:
>>> All of these are simple cases of using typeof() to avoid multiple parameter
>>> evaluation.  Using auto avoids multiple textural expansion also.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Thanks.
> 
> While I've got people's attentions, there's a secondary pattern we use
> that's a bit less clear to convert.
> 
>     typeof(a) *_ptr_a = &a;
> 
> With auto, you're required to write this as:
> 
>     auto _ptr_a = &a;
> 
> rather than the more-nomal-looking:
> 
>     auto *_ptr_a = &a;
> 
> 
> So far I've only found two examples, and I'm debating leaving them as
> are seeing as auto (in this form) is still a new concept to most.
> 
> Thoughts?

If already we're moving to the use of auto, I think such want converting
as well. "auto" meaning "type of rhs", this necessarily implies absence
of pointer-ness in the type. Really, is "auto *" actually a construct
which could make sense in some specific situation? This and the rhs type
are (seemingly) guaranteed to conflict.

Jan

